Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10529.1794480435394931809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 02:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=H9d+AIPr;
 spf=pass (domain: geanix.com, ip: 185.70.43.96, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794480432; x=1794739632;
	bh=CYFNnXKe792t/HGDERG+orTAsr/SAe1EMXkC+0dSclU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H9d+AIPrW4yH/rjHyk/4CqQGHE7PjNYETQHQgCn3ZyzOqjTsS7E9bpPYtGlPqYjF0
	 4Il+L9s7J9WLjlnl2WEPtaz8h4sC8sHK86R749Dv1zkmRG+LGhGcDaxwR4zHJfJrMx
	 Vea4UEAw5BAFAlijV33tnJNxesjFn2iSU/FzVAyT+vvfAwwtn9yBmWLLn12hBvCY+2
	 JPFa+sbXPEQYzEw63EHyOCdfCLJGu7szx/CNMS0cx9+fE8OrjXH8Bzy3oSo/nXO55h
	 /GwCtS+9sQDq8tIhTwOwbWHu4Bsm3JOtjfC/CAppbFUDrKIE/X6Gg0F3+fw0zzc9q3
	 XB3iMMz7IXKiA==
Date: Thu, 12 Nov 2026 10:47:06 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
From: Sean Nyekjaer <sean@geanix.com>
Cc: =?utf-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
Message-ID: <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com>
In-Reply-To: <18E7449543C100DC.893556@lists.openembedded.org>
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com> <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com> <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com> <18E7449543C100DC.893556@lists.openembedded.org>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 5d9f01f87db86e02507bb818c5f9e1fd8602cf43
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 10:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250085



> On 12 Nov 2026, at 11.12, Sean Nyekjaer via openembedded-core <sean=3Dgea=
nix.com@lists.openembedded.org> wrote:
>=20
>=20
>=20
>> On 12 Nov 2026, at 09.54, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
>>=20
>> On Thu, 12 Nov 2026 at 09:35, Sean Nyekjaer <sean@geanix.com> wrote:
>> Globally in my distro conf.
>>=20
>> I have tried:
>> INCOMPATIBLE_LICENSE:pn-os-rootfs =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D
>>=20
>> INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=9D
>>=20
>> INCOMPATIBLE_LICENSE:class-target =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D
>>=20
>> What is os-rootfs?
>>=20
>> Setting this globally is obsolete since several years ago and it only ev=
er worked in combination with meta-gpl2. You need to put INCOMPATIBLE_LICEN=
SE into your product image (which is the only place where it matters), and =
then it will be applied only to that image during do_rootfs. Is there some =
documentation you followed which misled you?
>=20
> No, but maybe I have seen some old documentation.
> But https://docs.yoctoproject.org/ref-manual/variables.html#term-INCOMPAT=
IBLE_LICENSE describes it well.
>=20
> I have moved INCOMPATIBLE_LICENSE to os-rootfs.bb
> $ cat os-rootfs.bb
> SUMMARY =3D "OS rootfs"
> DESCRIPTION =3D "Read-only erofs root filesystem"
> LICENSE =3D "MIT"
>=20
> inherit image
>=20
> INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>=20
> IMAGE_FSTYPES =3D "erofs-lz4hc"
>=20
> IMAGE_FEATURES:append =3D " read-only-rootfs"
>=20
> PACKAGE_EXCLUDE:append =3D " kernel-image-*"
>=20
> IMAGE_INSTALL =3D "\
>    base-files \
>    base-passwd \
>    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)=
} \
>    netbase \
>    ${VIRTUAL-RUNTIME_login_manager} \
>    ${VIRTUAL-RUNTIME_init_manager} \
>    ${VIRTUAL-RUNTIME_dev_manager} \
>    ${VIRTUAL-RUNTIME_update-alternatives} \
> "
>=20
> When running it "bitbake os-rootfs -c populate_sdk=E2=80=9D, it still fai=
ls with:
> ERROR: os-rootfs-1.0-r0 do_populate_sdk: Some packages cannot be
> installed into the image because they have incompatible licenses:
>         binutils-cross-canadian-aarch64 (GPL-3.0-only)
>         gcc-cross-canadian-aarch64 (GPL-3.0-only)
>         gdb-cross-canadian-aarch64 (GPL-3.0-only LGPL-3.0-only)
>         nativesdk-autoconf (GPL-3.0-or-later)
>=20
> I=E2=80=99m on the wrynose branch, if that could be the issue.

My intern pointed me to commit f757ae4dad ("license_image: extend to SDK co=
verage")
When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populate_=
sdk

/Sean


