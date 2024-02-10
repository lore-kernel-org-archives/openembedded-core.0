Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB97C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 15:11:22 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.15306.1707577874592280696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 07:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=fN63N7Fu;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 87B4C240101
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 16:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707577872; bh=AziC29+JrEHhYqmbNVirGx29CfK0ZQPr7/qorC6/htI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=fN63N7FuHjs/HBMTjRyKRgJeOBbAWKmF4ZPEYV9/HhqdZZJ5yfJpLwRPVoZ/mfW59
	 a5b2IP0BB67q/PHHMDNZz0u1tgzfXT6fas7U6A5badKNP8yIG0GY6bMUNbYV/N06qi
	 Hve3wolGw6WY6rJszSKHvthX85YErD3wFaC/0PtjoP7pfqfzw5Gd42au+5j7cxVPI6
	 KHxY0Iul7LE7RRRQKfw8ClmQDFPkZ45YXNMckzfTY7yvkEw0n5dngKziy432e74wFY
	 l1z7eQCr2YSsXtfEYGr8HN5uephOH3al7dfqy+axuZV0tk5txSxNcW13BKRuZ5REFU
	 AD1I78TktujNQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TXDgy5bBKz9rxW;
	Sat, 10 Feb 2024 16:11:10 +0100 (CET)
Message-ID: <04d638bef75838d473e9eec69d8d5ed45dafb462.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual-" in RPROVIDES and
 RDEPENDS
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Simone
 =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
Date: Sat, 10 Feb 2024 15:05:09 +0000
In-Reply-To: <2168122ec19bface339bdb7d414f53d347fd9607.camel@linuxfoundation.org>
References: <20240210113612.525615-1-simone.p.weiss@posteo.com>
	 <2168122ec19bface339bdb7d414f53d347fd9607.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 15:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195276

On Sat, 2024-02-10 at 14:38 +0000, Richard Purdie wrote:
> On Sat, 2024-02-10 at 11:36 +0000, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Instead of using "virtual-" use "VIRTUAL-RUNTIME_" as recommended
> > in insane.bbclass for RPROVIDES and RDEPENDS.
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/recipes-bsp/grub/grub-bootconf_1.00.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-bsp/grub/grub-efi_2.12.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-core/glibc/glibc-package.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-core/musl/musl_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-core/systemd/systemd-boot_255.1.bb=C2=A0=C2=A0=C2=A0=
 | 2 +-
> > =C2=A0meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 2 +-
> > =C2=A06 files changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> > b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> > index 783e30bf38..33a4517e5b 100644
> > --- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> > +++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION =3D "Grub might require different
> > configuration file for \
> > =C2=A0different machines."
> > =C2=A0HOMEPAGE =3D
> > "https://www.gnu.org/software/grub/manual/grub/grub.html#Configurat
> > ion"
> > =C2=A0
> > -RPROVIDES:${PN} +=3D "virtual-grub-bootconf"
> > +RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_grub-bootconf"
> > =C2=A0
> > =C2=A0inherit grub-efi-cfg
> > =C2=A0
> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-
> > bsp/grub/grub-efi_2.12.bb
> > index 9857e8e036..078a59a465 100644
> > --- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
> > +++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
> > @@ -5,7 +5,7 @@ require conf/image-uefi.conf
> > =C2=A0GRUBPLATFORM =3D "efi"
> > =C2=A0
> > =C2=A0DEPENDS:append =3D " grub-native"
> > -RDEPENDS:${PN} =3D "grub-common virtual-grub-bootconf"
> > +RDEPENDS:${PN} =3D "grub-common VIRTUAL-RUNTIME_grub-bootconf"
> > =C2=A0
> > =C2=A0SRC_URI +=3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://cfg=C2=A0\
> > diff --git a/meta/recipes-core/glibc/glibc-package.inc
> > b/meta/recipes-core/glibc/glibc-package.inc
> > index 1ef987be0a..8846934b25 100644
> > --- a/meta/recipes-core/glibc/glibc-package.inc
> > +++ b/meta/recipes-core/glibc/glibc-package.inc
> > @@ -7,7 +7,7 @@ RPROVIDES:${PN} =3D "eglibc rtld(GNU_HASH)"
> > =C2=A0RPROVIDES:${PN}-utils =3D "eglibc-utils"
> > =C2=A0RPROVIDES:${PN}-mtrace =3D "eglibc-mtrace libc-mtrace"
> > =C2=A0RPROVIDES:${PN}-pic =3D "eglibc-pic"
> > -RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev virtual-libc-dev"
> > +RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev VIRTUAL-RUNTIME_libc-
> > dev"
> > =C2=A0RPROVIDES:${PN}-staticdev =3D "eglibc-staticdev"
> > =C2=A0RPROVIDES:${PN}-doc =3D "eglibc-doc"
> > =C2=A0RPROVIDES:glibc-extra-nss =3D "eglibc-extra-nss"
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> > core/musl/musl_git.bb
> > index 324269a968..54df0de913 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -76,7 +76,7 @@ FILES:${PN}-dev =3D+ "${libdir}/libcrypt.a
> > ${libdir}/libdl.a ${libdir}/libm.a \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > =C2=A0
> > =C2=A0RDEPENDS:${PN}-dev +=3D "linux-libc-headers-dev bsd-headers-dev
> > libssp-nonshared-staticdev"
> > -RPROVIDES:${PN}-dev +=3D "libc-dev virtual-libc-dev"
> > +RPROVIDES:${PN}-dev +=3D "libc-dev VIRTUAL-RUNTIME_libc-dev"
> > =C2=A0RPROVIDES:${PN} +=3D "ldd rtld(GNU_HASH)"
> > =C2=A0
> > =C2=A0LEAD_SONAME =3D "libc.so"
> > diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb
> > b/meta/recipes-core/systemd/systemd-boot_255.1.bb
> > index 4ee25ee72f..32495c883d 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_255.1.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_255.1.bb
> > @@ -45,7 +45,7 @@ python __anonymous () {
> > =C2=A0
> > =C2=A0FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> > =C2=A0
> > -RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
> > +RDEPENDS:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
> > =C2=A0
> > =C2=A0CFLAGS:append:libc-musl =3D " -D__DEFINED_wchar_t"
> > =C2=A0
> > diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> > b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> > index 19637546a9..5017b256e7 100644
> > --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> > +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> > @@ -2,7 +2,7 @@ LICENSE =3D "MIT"
> > =C2=A0LIC_FILES_CHKSUM =3D
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4d
> > e20420"
> > =C2=A0SUMMARY =3D "Basic systemd-boot configuration files"
> > =C2=A0
> > -RPROVIDES:${PN} +=3D "virtual-systemd-bootconf"
> > +RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
> > =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > =C2=A0
> > =C2=A0inherit systemd-boot-cfg
>=20
> I appreciate the intent here but I'm not sure this is quite right.
>=20
> Most of the usage of VIRTUAL-RUNTIME is done as variable substitution
> so ${VIRTUAL-RUNTIME_XXX} and then declared somewhere.

True, I saw that.=20
> These cases of virtual-XXX are simple enough they don't require that.
> I
> think the patch could therefore add more confusion rather than
> improve
> things.

Might be true, in that case let us just ignore the patch for now :)

Simone
>=20
> Cheers,
>=20
> Richard
>=20
>=20


