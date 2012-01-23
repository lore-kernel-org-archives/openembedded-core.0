Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RpKtP-0005Bh-9S
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 15:29:07 +0100
Received: by dadw11 with SMTP id w11so1334879dad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pV7IR6o+a29aMmnXQeJg3hyQW9Z4Bb1MfD98QtXA7l0=;
	b=BDnaQo6C6FRS9vh9Zm41i1xLW39YBp0STVxU4IeTKnQoJtxNWU3YOTjepypxMXc0CT
	k8lQGRQ269jxPyVky7AI4jyK3j1MntyLTVZcSFqyrJ1QTIt5h5oDs2U1TlprOkIC3JqI
	f2oJk3+yj7wX73cAOqF+ofqHiet+VcZXDxKFc=
MIME-Version: 1.0
Received: by 10.68.83.46 with SMTP id n14mr22279220pby.97.1327328481615; Mon,
	23 Jan 2012 06:21:21 -0800 (PST)
Received: by 10.142.166.19 with HTTP; Mon, 23 Jan 2012 06:21:21 -0800 (PST)
In-Reply-To: <15F6B012-1598-4434-8A1A-28E056BFFAE2@dominion.thruhere.net>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
	<CAAQYJAu_8aV4fs24bjJd-xCTc28QQ1nYtaSmbK04xzYDeuVqkw@mail.gmail.com>
	<15F6B012-1598-4434-8A1A-28E056BFFAE2@dominion.thruhere.net>
Date: Mon, 23 Jan 2012 15:21:21 +0100
Message-ID: <CAAQYJAupcHBBUNQWGyoCXV1OMcSpHH0UT0AzJWCsz5yMCoA_bA@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jan 2012 14:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 12:22 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 15 jan. 2012, om 12:17 heeft Andrea Adami het volgende geschreven:
>
>> On Sat, Jan 14, 2012 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 14 jan. 2012, om 14:07 heeft Andrea Adami het volgende geschreven:
>>>
>>>> * Take the extra bits in do_install from meta-openembedded
>>>> * and add pkg_postinst script (adapted from Gentoo).
>>>> * Default to 'Universal' timezone, present in the base package
>>>> * and allow override using DEFAULT_TIMEZONE variable.
>>>> * /etc/localtime and /etc/timezone are purposedly not packaged.
>>>> * Bump PR
>>>>
>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>>> ---
>>>> meta/recipes-extended/tzdata/tzdata_2011n.bb | =A0 55 ++++++++++++++++=
+++++++++-
>>>> 1 files changed, 53 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recip=
es-extended/tzdata/tzdata_2011n.bb
>>>> index de9281a..862a196 100644
>>>> --- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>> +++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>> @@ -5,7 +5,7 @@ LICENSE =3D "PD"
>>>> LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D3;md5=3D0646=
8c0e84ef4d4c97045a4a29b08234"
>>>> DEPENDS =3D "tzcode-native"
>>>>
>>>> -PR =3D "r0"
>>>> +PR =3D "r1"
>>>>
>>>> RCONFLICTS=3D "timezones timezone-africa timezone-america timezone-ant=
arctica \
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0timezone-arctic timezone-asia timezone-atla=
ntic \
>>>> @@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] =3D "a343e542486b2b8ebdeca=
474eed79f1c04f69420ca943c2b9bd
>>>>
>>>> S =3D "${WORKDIR}"
>>>>
>>>> +DEFAULT_TIMEZONE ?=3D "Universal"
>>>> +
>>>> TZONES=3D "africa antarctica asia australasia europe northamerica sout=
hamerica =A0\
>>>> =A0 =A0 =A0 =A0 =A0factory solar87 solar88 solar89 etcetera backward s=
ystemv \
>>>> =A0 =A0 =A0 =A0 "
>>>> @@ -41,7 +43,56 @@ do_install () {
>>>> =A0 =A0 =A0 =A0 # libc is removing zoneinfo files from package
>>>> =A0 =A0 =A0 =A0 cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
>>>> =A0 =A0 =A0 =A0 cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
>>>> - =A0 =A0 chown -R root:root ${D}
>>>> +
>>>> + =A0 =A0 =A0 =A0# Install defaults
>>>> + =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}
>>>> + =A0 =A0 =A0 =A0echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
>>>> + =A0 =A0 =A0 =A0cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} $=
{D}${sysconfdir}/localtime
>>>
>>> Shouldn't that be an 'ln -sf' instead of a 'cp'?
>>>
>> No, I don't think so.First reason is /usr may not be mounted, maybe
>> living on another device..
>> See first Google link about this:
>> http://www.redhat.com/archives/rhl-devel-list/2006-April/msg00017.html
>> Then, as you see, the postinst takes care of both cases.
>
> That only applies to non-UTC times in RTC, which we don't use. And furthe=
rmore, no machine has /usr on a seperate partition since support for that i=
s broken.

I try to bump the thread before the sources get renamed ;)

About separation of exec_prefix, pls see

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015672.=
html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015771.=
html

So, what is the position to take?  Symlink or copy?

Regards

Andrea


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


