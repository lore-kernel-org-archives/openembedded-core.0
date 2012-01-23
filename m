Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RpNCX-0001sd-VR
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 17:57:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0NGnGC8002818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 08:49:16 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 23 Jan 2012 08:49:15 -0800
Message-ID: <4F1D8F89.2050806@windriver.com>
Date: Mon, 23 Jan 2012 10:49:13 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
	<CAAQYJAu_8aV4fs24bjJd-xCTc28QQ1nYtaSmbK04xzYDeuVqkw@mail.gmail.com>
	<15F6B012-1598-4434-8A1A-28E056BFFAE2@dominion.thruhere.net>
	<CAAQYJAupcHBBUNQWGyoCXV1OMcSpHH0UT0AzJWCsz5yMCoA_bA@mail.gmail.com>
In-Reply-To: <CAAQYJAupcHBBUNQWGyoCXV1OMcSpHH0UT0AzJWCsz5yMCoA_bA@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jan 2012 16:57:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/12 8:21 AM, Andrea Adami wrote:
> On Sun, Jan 15, 2012 at 12:22 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>
>> Op 15 jan. 2012, om 12:17 heeft Andrea Adami het volgende geschreven:
>>
>>> On Sat, Jan 14, 2012 at 4:10 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>>>
>>>> Op 14 jan. 2012, om 14:07 heeft Andrea Adami het volgende geschreven:
>>>>
>>>>> * Take the extra bits in do_install from meta-openembedded
>>>>> * and add pkg_postinst script (adapted from Gentoo).
>>>>> * Default to 'Universal' timezone, present in the base package
>>>>> * and allow override using DEFAULT_TIMEZONE variable.
>>>>> * /etc/localtime and /etc/timezone are purposedly not packaged.
>>>>> * Bump PR
>>>>>
>>>>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>>>>> ---
>>>>> meta/recipes-extended/tzdata/tzdata_2011n.bb |   55 +++++++++++++++++++++++++-
>>>>> 1 files changed, 53 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>> index de9281a..862a196 100644
>>>>> --- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>> +++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>>>>> @@ -5,7 +5,7 @@ LICENSE = "PD"
>>>>> LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
>>>>> DEPENDS = "tzcode-native"
>>>>>
>>>>> -PR = "r0"
>>>>> +PR = "r1"
>>>>>
>>>>> RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
>>>>>               timezone-arctic timezone-asia timezone-atlantic \
>>>>> @@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bd
>>>>>
>>>>> S = "${WORKDIR}"
>>>>>
>>>>> +DEFAULT_TIMEZONE ?= "Universal"
>>>>> +
>>>>> TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
>>>>>           factory solar87 solar88 solar89 etcetera backward systemv \
>>>>>          "
>>>>> @@ -41,7 +43,56 @@ do_install () {
>>>>>          # libc is removing zoneinfo files from package
>>>>>          cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
>>>>>          cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
>>>>> -     chown -R root:root ${D}
>>>>> +
>>>>> +        # Install defaults
>>>>> +        install -d ${D}${sysconfdir}
>>>>> +        echo ${DEFAULT_TIMEZONE}>  ${D}${sysconfdir}/timezone
>>>>> +        cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
>>>>
>>>> Shouldn't that be an 'ln -sf' instead of a 'cp'?
>>>>
>>> No, I don't think so.First reason is /usr may not be mounted, maybe
>>> living on another device..
>>> See first Google link about this:
>>> http://www.redhat.com/archives/rhl-devel-list/2006-April/msg00017.html
>>> Then, as you see, the postinst takes care of both cases.
>>
>> That only applies to non-UTC times in RTC, which we don't use. And furthermore, no machine has /usr on a seperate partition since support for that is broken.
>
> I try to bump the thread before the sources get renamed ;)
>
> About separation of exec_prefix, pls see
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015672.html
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015771.html
>
> So, what is the position to take?  Symlink or copy?

On other systems I've used.. the rule has been: hardlink (same disk) or copy. 
Since the symlink would point into /usr and that should usually be avoided (as 
mentioned above).

I thought there used to be a tool that would do the hardlink, if possible and 
then copy if not.. but I'm not sure if that is even reasonable with our image 
creation... (so copy is likely best answer then)

--Mark

> Regards
>
> Andrea
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



