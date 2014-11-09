Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D252560809
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 13:11:54 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so6885845wgg.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Nov 2014 05:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Ryx1sHR7wqGc8eahZTtPB9c2atdyiZq1jCY6Ju/azas=;
	b=exlAoNXmNs2EK7vNxBXCHKgxTDkvhjNim4MeSJw7BWu7iHUnHYd2kgfAia+V2W2lb6
	qCi8P9+lr8A+fr4cwshtZ3LS9w0Rd94oEeWC/qhZJfyKy4YwisqIe18OPmdrAd4hBjyH
	8HOuEPIMQ6aLpD0NusykMIzEUsrrugqMbABmN/Kh7l7CkaOtYKE8MLUUPjeLgkEmPYDi
	+4NluLkIUOz7dgBtokLCwXIE++WqHwQ5gz2Z8YfRZ95s7PKL9zNH7gExewiCq8UB42HS
	pqB2BN8DJeZbMk+4lpPD/iGKKu6sASNBaNZgHUcNhHt19mVB9fdh4ujXSJu7G06DenhR
	Kv/w==
X-Gm-Message-State: ALoCoQl8neKbnTeexByZN5EYk6OrXjuzboQ3CoVtY/5OCeozdJl3AJTNUTVZVH7K4gMWMvOVgCrU
X-Received: by 10.180.103.226 with SMTP id fz2mr17442711wib.4.1415538714415;
	Sun, 09 Nov 2014 05:11:54 -0800 (PST)
Received: from ?IPv6:2001:610:612::c9d5:a0ad:f493:40ca?
	([2001:610:612:0:c9d5:a0ad:f493:40ca])
	by mx.google.com with ESMTPSA id bl9sm9313687wib.24.2014.11.09.05.11.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Nov 2014 05:11:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141109075151.GH9512@denix.org>
Date: Sun, 9 Nov 2014 14:11:51 +0100
Message-Id: <1AF0FB98-051E-4E51-BF74-1DBA700CCEA4@dominion.thruhere.net>
References: <1415399089-27578-1-git-send-email-denis@denix.org>
	<CAP9ODKoa60CMUEc1+w=4OqPZNQ7b9hFCBNzo8+fB=-kdK=VDZQ@mail.gmail.com>
	<20141109075151.GH9512@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1990.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [RFC][PATCH] u-boot-mkimage: allow building target version of the tool
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Nov 2014 13:11:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 9 nov. 2014, om 08:51 heeft Denys Dmytriyenko <denis@denix.org> het =
volgende geschreven:
>=20
> On Sat, Nov 08, 2014 at 05:12:36PM -0200, Otavio Salvador wrote:
>> On Fri, Nov 7, 2014 at 8:24 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>=20
>>> u-boot doesn't really support building its tools for the target, as =
they are
>>> built with HOSTCC compiler, which is also used to compile fixdep =
utility
>>> that gets executed during the build. Since it might be beneficial to =
have a
>>> target version of mkimage, let's hack it to build fixdep in a =
separate step.
>>>=20
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ...
>>> +       make HOSTCC=3D"${BUILD_CC}" HOSTLD=3D"${BUILD_LD}" =
HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTSTRIP=3Dtrue dot-config=3D0 =
scripts_basic
>> ...
>>=20
>> We do it in meta-fsl-arm as below:
>=20
> That still doesn't work when building tools for the target:
> /bin/sh: scripts/basic/fixdep: cannot execute binary file: Exec format =
error
>=20
> I guess you are missing the point of this patch, as sandbox_defconfig =
will=20
> only eliminate dot-config=3D0 parameter, but not the need to build =
fixdep=20
> separately with a different host compiler...
>=20
> On the other hand - is it a real requirement to build mkimage for the =
target?

I use it a lot when regenerating initramfses on the target.

regards,

Koen

>=20
>=20
>> ESCRIPTION =3D "U-boot bootloader mxsboot tool"
>> LICENSE =3D "GPLv2+"
>> LIC_FILES_CHKSUM =3D =
"file://Licenses/README;md5=3Dc7383a594871c03da76b3707929d2919"
>> SECTION =3D "bootloader"
>> DEPENDS =3D "openssl"
>> PROVIDES =3D "u-boot-mxsboot"
>>=20
>> PV =3D "v2014.10+git${SRCPV}"
>>=20
>> SRCREV =3D "75ce95e627609c9b9e537e935e69c4ecef26c8f7"
>> SRCBRANCH =3D "patches-2014.10"
>> SRC_URI =3D =
"git://github.com/Freescale/u-boot-imx.git;branch=3D${SRCBRANCH}"
>>=20
>> S =3D "${WORKDIR}/git"
>>=20
>> inherit fsl-u-boot-localversion
>>=20
>> EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC} ${CPPFLAGS}" =
HOSTLDFLAGS=3D"-L${libdir}
>> -L${base_libdir}" HOSTSTRIP=3Dtrue CONFIG_MX28=3Dy'
>>=20
>> do_configure () {
>>    oe_runmake sandbox_defconfig
>> }
>>=20
>> do_compile () {
>>    oe_runmake tools-only
>> }
>>=20
>> do_install () {
>>    install -d ${D}${bindir}
>>    install -m 0755 tools/mxsboot ${D}${bindir}/uboot-mxsboot
>>    ln -sf uboot-mxsboot ${D}${bindir}/mxsboot
>> }
>>=20
>> BBCLASSEXTEND =3D "native nativesdk"
>>=20
>>=20
>> --=20
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


