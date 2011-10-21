Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RHA1d-0002Mc-FN
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:00:21 +0200
Received: by eyd9 with SMTP id 9so3765619eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 00:54:28 -0700 (PDT)
Received: by 10.213.14.1 with SMTP id e1mr2426753eba.82.1319183667948;
	Fri, 21 Oct 2011 00:54:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm19316817eej.7.2011.10.21.00.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 00:54:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
Date: Fri, 21 Oct 2011 09:54:21 +0200
Message-Id: <7603E49D-D11F-4D4A-8883-B07E61B3FBC2@dominion.thruhere.net>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
	<1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
	<1318698176.2342.77.camel@ted>
	<CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Fri, 21 Oct 2011 08:00:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 09:34 heeft Martin Jansa het volgende geschreven:

> On Sat, Oct 15, 2011 at 7:02 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sat, 2011-10-15 at 12:38 +0200, Martin Jansa wrote:
>>> * this way we can use
>>>   EXTRA_DRIDRIVERS_armv4t +=3D ",glamo" in meta-openmoko layer and
>>>   EXTRA_DRIDRIVERS_armv4t +=3D ",foo" in meta-bar layer without =
knowledge
>>>   of other modules in other layers in stack
>>> * actually it's like old MACHINE_DRI_MODULES from OE-classic but =
renamed
>>>   to indicate that it should be used for architecture not machine
>>=20
>> This is way overcomplicated. Just do:
>>=20
>> DRIDRIVERS_append_armv4t =3D ",glamo"
>=20
> Ah, is it expected that armv4t is no longer valid OVERRIDE?

It is valid for angstrom:

koen@dominion:/OE/tentacle/sources/meta-ti$ MACHINE=3Dom-gta01 bitbake =
-e | grep OVERRIDES
# DISTROOVERRIDES=3D${DISTRO}
DISTROOVERRIDES=3D"angstrom"
# MACHINEOVERRIDES=3D${MACHINE}:${@bb.data.getVar('FEED_ARCH', =
d,1).replace('all','noarch')}:${SOC_FAMILY}
MACHINEOVERRIDES=3D"om-gta01:armv4t:Unknown"
# =
OVERRIDES=3D${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}${TARGET_OS}:${TRANSLATE=
D_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVER=
RIDES}:forcevariable${@bb.utils.contains("TUNE_FEATURES", "thumb", =
":thumb", "", d)}${@bb.utils.contains("TUNE_FEATURES", =
"no-thumb-interwork", ":thumb-interwork", "", d)}:libc-glibc:libc-glibc

regards,

Koen

>=20
> =
OVERRIDES=3D"linux-gnueabi:arm:build-linux:pn-libdrm:om-gta02::shr:forceva=
riable:thumb:libc-glibc"
>=20
> # =
OVERRIDES=3D${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${=
PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable${@bb.utils.contai=
ns("TUNE_FEATURES",
> "thumb", ":thumb", "", d)}${@bb.utils.contains("TUNE_FEATURES",
> "no-thumb-interwork", ":thumb-interwork", "", d)}:libc-glibc
>=20
> So I've to change it to
> DRIDRIVERS_append_arm
> or is it TRANSLATED_TARGET_ARCH fault?
>=20
> Regards,
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



