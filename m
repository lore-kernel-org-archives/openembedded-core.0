Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rqhj5-0002jV-C6
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 10:04:07 +0100
Received: by dakf10 with SMTP id f10so1032090dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 00:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=baTU/J24X2ZuvEVPtxLXUUkVDfJe26H5NOIzXq4SK6Q=;
	b=q9tTylTfpzxaCmmS8HJG+aJb1r7k9NVI7hf5/lNmCPGBjj1Obg4hI42YtnyvRwKh8z
	gecXLFcEVRjiKEHmqkAZV5RalxfzUqI4u6pH4T0Yu7FHvOxw5tn6qB1NYSx2RFY7cLD2
	9hGeYoEQ2EOn6cKB9vnLuPg4qPnzDEI9Ho6dM=
MIME-Version: 1.0
Received: by 10.68.83.46 with SMTP id n14mr12715120pby.97.1327654577703; Fri,
	27 Jan 2012 00:56:17 -0800 (PST)
Received: by 10.142.166.19 with HTTP; Fri, 27 Jan 2012 00:56:17 -0800 (PST)
In-Reply-To: <4F1D8F89.2050806@windriver.com>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
	<CAAQYJAu_8aV4fs24bjJd-xCTc28QQ1nYtaSmbK04xzYDeuVqkw@mail.gmail.com>
	<15F6B012-1598-4434-8A1A-28E056BFFAE2@dominion.thruhere.net>
	<CAAQYJAupcHBBUNQWGyoCXV1OMcSpHH0UT0AzJWCsz5yMCoA_bA@mail.gmail.com>
	<4F1D8F89.2050806@windriver.com>
Date: Fri, 27 Jan 2012 09:56:17 +0100
Message-ID: <CAAQYJAsUbgnrREyabxF6mLed5m+3a0mU_tMcSu_rPYF4DHSnnQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata_2011n: provide pkg_postinst and timezone defaults
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 09:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2012 at 5:49 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 1/23/12 8:21 AM, Andrea Adami wrote:
>>
>> On Sun, Jan 15, 2012 at 12:22 PM, Koen Kooi<koen@dominion.thruhere.net>
>> =A0wrote:
>>>
>>>
>>> Op 15 jan. 2012, om 12:17 heeft Andrea Adami het volgende geschreven:
>>>
>>>> On Sat, Jan 14, 2012 at 4:10 PM, Koen Kooi<koen@dominion.thruhere.net>
>>>> =A0wrote:
>>>>>
>>>>>
>>>>> Op 14 jan. 2012, om 14:07 heeft Andrea Adami het volgende geschreven:
>>>>>
>>>>>> * Take the extra bits in do_install from meta-openembedded
>>>>>> * and add pkg_postinst script (adapted from Gentoo).
>>>>>> * Default to 'Universal' timezone, present in the base package
>>>>>> * and allow override using DEFAULT_TIMEZONE variable.
>>>>>> * /etc/localtime and /etc/timezone are purposedly not packaged.
>>>>>> * Bump PR
>>>>>>
>>>>>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>>>>>> ---
>>>>>> meta/recipes-extended/tzdata/tzdata_2011n.bb | =A0 55
>>>>>> +++++++++++++++++++++++++-
>>>>>> 1 files changed, 53 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>>> b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>>> index de9281a..862a196 100644
>>>>>> --- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>>> +++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>>> @@ -5,7 +5,7 @@ LICENSE =3D "PD"
>>>>>> LIC_FILES_CHKSUM =3D
>>>>>> "file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a4=
a29b08234"
>>>>>> DEPENDS =3D "tzcode-native"
>>>>>>
>>>>>> -PR =3D "r0"
>>>>>> +PR =3D "r1"
>>>>>>
>>>>>> RCONFLICTS=3D "timezones timezone-africa timezone-america
>>>>>> timezone-antarctica \
>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0timezone-arctic timezone-asia timezone-at=
lantic \
>>>>>> @@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] =3D
>>>>>> "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bd
>>>>>>
>>>>>> S =3D "${WORKDIR}"
>>>>>>
>>>>>> +DEFAULT_TIMEZONE ?=3D "Universal"
>>>>>> +
>>>>>> TZONES=3D "africa antarctica asia australasia europe northamerica
>>>>>> southamerica =A0\
>>>>>> =A0 =A0 =A0 =A0 =A0factory solar87 solar88 solar89 etcetera backward=
 systemv \
>>>>>> =A0 =A0 =A0 =A0 "
>>>>>> @@ -41,7 +43,56 @@ do_install () {
>>>>>> =A0 =A0 =A0 =A0 # libc is removing zoneinfo files from package
>>>>>> =A0 =A0 =A0 =A0 cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
>>>>>> =A0 =A0 =A0 =A0 cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
>>>>>> - =A0 =A0 chown -R root:root ${D}
>>>>>> +
>>>>>> + =A0 =A0 =A0 =A0# Install defaults
>>>>>> + =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}
>>>>>> + =A0 =A0 =A0 =A0echo ${DEFAULT_TIMEZONE}> =A0${D}${sysconfdir}/time=
zone
>>>>>> + =A0 =A0 =A0 =A0cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE}
>>>>>> ${D}${sysconfdir}/localtime
>>>>>
>>>>>
>>>>> Shouldn't that be an 'ln -sf' instead of a 'cp'?
>>>>>
>>>> No, I don't think so.First reason is /usr may not be mounted, maybe
>>>> living on another device..
>>>> See first Google link about this:
>>>> http://www.redhat.com/archives/rhl-devel-list/2006-April/msg00017.html
>>>> Then, as you see, the postinst takes care of both cases.
>>>
>>>
>>> That only applies to non-UTC times in RTC, which we don't use. And
>>> furthermore, no machine has /usr on a seperate partition since support =
for
>>> that is broken.
>>
>>
>> I try to bump the thread before the sources get renamed ;)
>>
>> About separation of exec_prefix, pls see
>>
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/0156=
72.html
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/0157=
71.html
>>
>> So, what is the position to take? =A0Symlink or copy?
>
>
> On other systems I've used.. the rule has been: hardlink (same disk) or
> copy. Since the symlink would point into /usr and that should usually be
> avoided (as mentioned above).
>
> I thought there used to be a tool that would do the hardlink, if possible
> and then copy if not.. but I'm not sure if that is even reasonable with o=
ur
> image creation... (so copy is likely best answer then)
>
> --Mark
>
>
>> Regards
>>
>> Andrea
>>
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Please take on hold this patch.
Further inspection of do_rootfs logs reveals that the postinst is run
during that task and the code tries to write /etc/localtime on host,
fails and exits 1.

I'll add a check like

pkg_postinst_${PN}() {
if test "x$D" !=3D "x"; then
	exit 1
else

and send a revised patch in a few hours.

Regards

Andrea

P.S.
This is a low hanging fruit wrt recipes duplication between oe-core and met=
a-oe.
Please add your review/comments, thanks.


