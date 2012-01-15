Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmODE-0001DQ-Gf
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jan 2012 12:25:25 +0100
Received: by dadw11 with SMTP id w11so131550dad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2012 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qmAD+LVWDiyO1OdM2fs2JiCHNo4glk4xS1EKUKZ9Nd4=;
	b=VI8oiiNT7bb3D5P6N+UaT6IaF0CHGhbHMgabosYN7Bc/MjVLIsJtc/vtH8QxmGGKDs
	fZ8PLQpCsu3AlnSSLpqdsIvzze2mskqInxf9IYlJS9noyIxqHx8oviY8nNoe4/k4xh5n
	JvI2MMQicfULBb/yp3zQiA94evrDULBZYpNa0=
MIME-Version: 1.0
Received: by 10.68.122.198 with SMTP id lu6mr17597750pbb.92.1326626265196;
	Sun, 15 Jan 2012 03:17:45 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Sun, 15 Jan 2012 03:17:45 -0800 (PST)
In-Reply-To: <C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
Date: Sun, 15 Jan 2012 12:17:45 +0100
Message-ID: <CAAQYJAu_8aV4fs24bjJd-xCTc28QQ1nYtaSmbK04xzYDeuVqkw@mail.gmail.com>
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
X-List-Received-Date: Sun, 15 Jan 2012 11:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 14, 2012 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 jan. 2012, om 14:07 heeft Andrea Adami het volgende geschreven:
>
>> * Take the extra bits in do_install from meta-openembedded
>> * and add pkg_postinst script (adapted from Gentoo).
>> * Default to 'Universal' timezone, present in the base package
>> * and allow override using DEFAULT_TIMEZONE variable.
>> * /etc/localtime and /etc/timezone are purposedly not packaged.
>> * Bump PR
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> meta/recipes-extended/tzdata/tzdata_2011n.bb | =A0 55 ++++++++++++++++++=
+++++++-
>> 1 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recipes=
-extended/tzdata/tzdata_2011n.bb
>> index de9281a..862a196 100644
>> --- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
>> +++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
>> @@ -5,7 +5,7 @@ LICENSE =3D "PD"
>> LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D3;md5=3D06468c=
0e84ef4d4c97045a4a29b08234"
>> DEPENDS =3D "tzcode-native"
>>
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> RCONFLICTS=3D "timezones timezone-africa timezone-america timezone-antar=
ctica \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0timezone-arctic timezone-asia timezone-atlant=
ic \
>> @@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] =3D "a343e542486b2b8ebdeca47=
4eed79f1c04f69420ca943c2b9bd
>>
>> S =3D "${WORKDIR}"
>>
>> +DEFAULT_TIMEZONE ?=3D "Universal"
>> +
>> TZONES=3D "africa antarctica asia australasia europe northamerica southa=
merica =A0\
>> =A0 =A0 =A0 =A0 =A0factory solar87 solar88 solar89 etcetera backward sys=
temv \
>> =A0 =A0 =A0 =A0 "
>> @@ -41,7 +43,56 @@ do_install () {
>> =A0 =A0 =A0 =A0 # libc is removing zoneinfo files from package
>> =A0 =A0 =A0 =A0 cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
>> =A0 =A0 =A0 =A0 cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
>> - =A0 =A0 chown -R root:root ${D}
>> +
>> + =A0 =A0 =A0 =A0# Install defaults
>> + =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}
>> + =A0 =A0 =A0 =A0echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
>> + =A0 =A0 =A0 =A0cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D=
}${sysconfdir}/localtime
>
> Shouldn't that be an 'ln -sf' instead of a 'cp'?
>
No, I don't think so.First reason is /usr may not be mounted, maybe
living on another device..
See first Google link about this:
http://www.redhat.com/archives/rhl-devel-list/2006-April/msg00017.html
Then, as you see, the postinst takes care of both cases.

Thanks for reviewing

Regards

Andrea


P.S. I have indeed a doubt, about  " # libc is removing zoneinfo files
from package ". This will be a second patch maybe.


>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


