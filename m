Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10194.1794478382937974081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 02:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=hcUEzaWw;
 spf=pass (domain: geanix.com, ip: 185.70.43.98, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794478380; x=1794737580;
	bh=xQ2EjJoZHWiUGDBYK74ptNa/ec7AUC/v9FTgpR6LTyk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hcUEzaWwm+tsH4wr9+eA0vEmPsaOaRRRRnUxy4xzNMUoYwfjkpN2+M05bf99Z7mp0
	 q73TZDjHoYsGqegc+Twp5Hg9ZWrnwRIxFV+gKLXUMKKAsG0u5sMY8k/Q0R2nVORlzW
	 rDsznpTRbbqDOVIMM154tReU1atFxBidddBv965Cw6iAlCR3mpxE2ruYl6jqdgw7MA
	 bYtH+C4w3CNbp883fncDfzIHfQpAWeZRnGBQd5YN3+4wx4826qWYlMJGTGz+DOSM1l
	 QJK58flAGxeDNO43qP+Wq6Up7yqINpIQg8Qrg/Ghx33wVYRxCWIHwiUMTaBe2BUXfw
	 PfsLZyLa+t/Ew==
Date: Thu, 12 Nov 2026 10:12:56 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
Message-ID: <0F474204-E5AF-44DC-B556-3BDDEEBC9C63@geanix.com>
In-Reply-To: <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com> <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com> <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 42bbe8bff54f5b830313b5967948867fa635cc43
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 10:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250084



> On 12 Nov 2026, at 09.54, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Thu, 12 Nov 2026 at 09:35, Sean Nyekjaer <sean@geanix.com> wrote:
> Globally in my distro conf.
>=20
> I have tried:
> INCOMPATIBLE_LICENSE:pn-os-rootfs =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D
>=20
> INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=9D
>=20
> INCOMPATIBLE_LICENSE:class-target =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D
>=20
> What is os-rootfs?
>=20
> Setting this globally is obsolete since several years ago and it only eve=
r worked in combination with meta-gpl2. You need to put INCOMPATIBLE_LICENS=
E into your product image (which is the only place where it matters), and t=
hen it will be applied only to that image during do_rootfs. Is there some d=
ocumentation you followed which misled you?

No, but maybe I have seen some old documentation.
But https://docs.yoctoproject.org/ref-manual/variables.html#term-INCOMPATIB=
LE_LICENSE describes it well.

I have moved INCOMPATIBLE_LICENSE to os-rootfs.bb
$ cat os-rootfs.bb
SUMMARY =3D "OS rootfs"
DESCRIPTION =3D "Read-only erofs root filesystem"
LICENSE =3D "MIT"

inherit image

INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*"

IMAGE_FSTYPES =3D "erofs-lz4hc"

IMAGE_FEATURES:append =3D " read-only-rootfs"

PACKAGE_EXCLUDE:append =3D " kernel-image-*"

IMAGE_INSTALL =3D "\
    base-files \
    base-passwd \
    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)}=
 \
    netbase \
    ${VIRTUAL-RUNTIME_login_manager} \
    ${VIRTUAL-RUNTIME_init_manager} \
    ${VIRTUAL-RUNTIME_dev_manager} \
    ${VIRTUAL-RUNTIME_update-alternatives} \
"

When running it "bitbake os-rootfs -c populate_sdk=E2=80=9D, it still fails=
 with:
ERROR: os-rootfs-1.0-r0 do_populate_sdk: Some packages cannot be
 installed into the image because they have incompatible licenses:
         binutils-cross-canadian-aarch64 (GPL-3.0-only)
         gcc-cross-canadian-aarch64 (GPL-3.0-only)
         gdb-cross-canadian-aarch64 (GPL-3.0-only LGPL-3.0-only)
         nativesdk-autoconf (GPL-3.0-or-later)

I=E2=80=99m on the wrynose branch, if that could be the issue.

/Sean
