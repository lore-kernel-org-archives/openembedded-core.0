Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467F2C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 13:44:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.2561.1668347034447377035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 05:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XJBCW43P;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668347035;
  x=1699883035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BUUP4l/uBxwSqsHsXSD+huB1uHDOqMCqQOXXGmemArk=;
  b=XJBCW43PR+6oSI/jYYDriFFgVTWKA3VfPgR25M3sxptC4aH8x53Y+YkZ
   B9vc3LkL9K52Ix65R7z79ZV9PgaDmHkvIX1ksBS+g8Q8oH7ITdX7Azszb
   Ge9iteTm4ZZF7lbkJykIj5qhoIzkFeYgehYvOVvKUP+q40VcG74m4Wmxe
   q1ka4/wE2xludQ6DElq7sVWIvzm3upOYPpyscTv4Hu9RqmconXnVd/3Ue
   COeerpSsUJBDakvcK/5Eb6q9BZ7Xd9DsdDKsS24csJHVjZK0MB71vswfM
   8NDCZvsB1X3KiDHxALm+tcYO/ZqsEKsHenkqHRwDJcr4dCpxaLhASysJA
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Christoph Lauer <christoph.lauer@email.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: RE: [OE-core] [PATCH] initial configs: set initial
 {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
Thread-Topic: [OE-core] [PATCH] initial configs: set initial
 {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
Thread-Index: AQHY9rRDKjZIJ5QxAk+KO/6WmY5fjK481OMg
Date: Sun, 13 Nov 2022 13:43:52 +0000
Message-ID: <b6ac86a81444402796ff28436add5731@axis.com>
References: <20221112163103.42796-1-christoph.lauer@email.de>
In-Reply-To: <20221112163103.42796-1-christoph.lauer@email.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 13:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173193

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Christoph Lauer
> Sent: den 12 november 2022 17:31
> To: openembedded-core@lists.openembedded.org
> Cc: Christoph Lauer <christoph.lauer@xtronic.de>
> Subject: [OE-core] [PATCH] initial configs: set initial {DISTRO|MACHINE|I=
MAGE}FEATUREs as weak as possible
>=20
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>=20
> This gives BSP creators the flexibility to change features with weak defa=
ults
>=20
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta-poky/conf/distro/poky.conf               |  2 +-
>  meta/conf/bitbake.conf                        | 28 +++++++++----------
>  .../distro/include/default-distrovars.inc     |  6 ++--
>  meta/conf/machine/include/qemu.inc            |  2 +-
>  meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
>  5 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
> index 3e90766349..3a453ef9ed 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -18,7 +18,7 @@ POKY_DEFAULT_DISTRO_FEATURES =3D "largefile opengl ptes=
t multiarch wayland vulkan"
>  POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
>  POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"
>=20
> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_F=
EATURES}"
> +DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_=
FEATURES}"
>=20
>  PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
>  PREFERRED_VERSION_linux-yocto-rt ?=3D "5.19%"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index dea573986d..b2540bb3f5 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -885,31 +885,31 @@ OES_BITBAKE_CONF =3D "1"
>  # Machine properties and packagegroup-base stuff
>  ##################################################################
>=20
> -MACHINE_FEATURES ?=3D ""
> -DISTRO_FEATURES ?=3D ""
> +MACHINE_FEATURES ??=3D ""
> +DISTRO_FEATURES ??=3D ""
>=20
> -DISTRO_EXTRA_RDEPENDS ?=3D ""
> -DISTRO_EXTRA_RRECOMMENDS ?=3D ""
> -MACHINE_EXTRA_RDEPENDS ?=3D ""
> -MACHINE_EXTRA_RRECOMMENDS ?=3D ""
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
> +DISTRO_EXTRA_RDEPENDS ??=3D ""
> +DISTRO_EXTRA_RRECOMMENDS ??=3D ""
> +MACHINE_EXTRA_RDEPENDS ??=3D ""
> +MACHINE_EXTRA_RRECOMMENDS ??=3D ""
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS ??=3D ""
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ??=3D ""
>=20
>  EXTRA_IMAGE_FEATURES ??=3D ""
>  IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>=20
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> -DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> +DISTRO_FEATURES_NATIVE ??=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVESDK ??=3D "x11"
>=20
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl =
wayland"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod open=
gl wayland"
> +DISTRO_FEATURES_FILTER_NATIVE ??=3D "api-documentation debuginfod opengl=
 wayland"
> +DISTRO_FEATURES_FILTER_NATIVESDK ??=3D "api-documentation debuginfod ope=
ngl wayland"
>=20
> -DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-=
data ldconfig"
> -MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> +DISTRO_FEATURES_BACKFILL ??=3D "pulseaudio sysvinit gobject-introspectio=
n-data ldconfig"
> +MACHINE_FEATURES_BACKFILL ??=3D "rtc qemu-usermode"
>=20
>  COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MAC=
HINE_FEATURES', d)}"
>  COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index abf48f79f0..3b3d439ad3 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -19,9 +19,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc =3D "seccomp"
>  # seccomp is not yet ported to microblaze
>  DISTRO_FEATURES_DEFAULT:remove:microblaze =3D "seccomp"
>=20
> -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa bluetooth debuginfod ext2 ipv4 ip=
v6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat sec=
comp"
> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
> -IMAGE_FEATURES ?=3D ""
> +DISTRO_FEATURES_DEFAULT ??=3D "acl alsa bluetooth debuginfod ext2 ipv4 i=
pv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat se=
ccomp"
> +DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT}"
> +IMAGE_FEATURES ??=3D ""
>=20
>  COMMERCIAL_AUDIO_PLUGINS ?=3D ""
>  # COMMERCIAL_AUDIO_PLUGINS ?=3D "gst-plugins-ugly-mad gst-plugins-ugly-m=
pegaudioparse"
> diff --git a/meta/conf/machine/include/qemu.inc
> b/meta/conf/machine/include/qemu.inc
> index d9bed7708d..04ffe55309 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -10,7 +10,7 @@ XSERVER ?=3D "xserver-xorg \
>              xf86-video-fbdev \
>              "
>=20
> -MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
> +MACHINE_FEATURES ??=3D "alsa bluetooth usbgadget screen vfat"
>=20
>  MACHINEOVERRIDES =3D. "qemuall:"
>=20
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index 0b399ac1f9..f5f9f89a9f 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"
>  require conf/machine/include/qemu.inc
>  require conf/machine/include/riscv/tune-riscv.inc
>=20
> -MACHINE_FEATURES =3D "screen keyboard ext2 ext3 serial"
> +MACHINE_FEATURES ?=3D "screen keyboard ext2 ext3 serial"
>=20
>  KERNEL_IMAGETYPE =3D "Image"
>  KERNEL_IMAGETYPES +=3D "uImage"
> --
> 2.17.1

This is a breaking change, which can have a lot of not easily detected=20
consequences, and I would advise against it. Changing ??=3D to ?=3D means=20
that you can no longer do, e.g., DISTRO_FEATURES +=3D " foo" in your=20
configuration. For comparison, if you add the following to a recipe or=20
your local.conf:

FOOBAR1 ??=3D "foo"
FOOBAR1 +=3D "bar"
FOOBAR2 ?=3D "foo"
FOOBAR2 +=3D "bar"

the result will be:

FOOBAR1=3D" bar"
FOOBAR2=3D"foo bar"

If your patch is applied to Poky, this is the resulting change in the=20
configuration:

--- a.txt       2022-11-13 14:34:17.882922391 +0100
+++ b.txt       2022-11-13 14:34:37.902531305 +0100
@@ -7,6 +7,6 @@
 DISTRO_FEATURES_NATIVE=3D"x11 ipv6 xattr"
 DISTRO_FEATURES_NATIVESDK=3D"x11"
 IMAGE_FEATURES=3D" debug-tweaks ptest-pkgs debug-tweaks tools-debug"
-MACHINE_FEATURES=3D"alsa bluetooth usbgadget screen vfat x86 pci rtc qemu-=
usermode"
+MACHINE_FEATURES=3D" x86 pci rtc qemu-usermode"
 MACHINE_FEATURES_BACKFILL=3D"rtc qemu-usermode"
 MACHINE_FEATURES_BACKFILL_CONSIDERED=3D" "

As can be seen, your change has modified the default configuration for=20
qemux86-64 and you did not notice, even though you were aware that you=20
were changing the variables. Imagine what it would do to others...

//Peter


