Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBA3C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 16:31:40 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by mx.groups.io with SMTP id smtpd.web10.4308.1668270698131180857
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 08:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=ur4shLxB;
 spf=pass (domain: email.de, ip: 212.227.15.3, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668270695;
	bh=nMRBCFOC45zknFB/6XG6QX+6Q5gtSIuJOrVOirMNFB8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=ur4shLxBxzfnuuBHUVz7q3jzCsA0mXlwESJioIFNZGwjzqHuCMaNQM+k7GNXcYqZc
	 Kv0zfDIDkvf/4UOqLdmSg5trBlPDPPJdbZaWE4/MgrJm81SQP0YC+L3bKFN6On20uO
	 aVqTj+36p2xvjQo2MVthbe6GbKcm77mOJLEKTNiT+oYD3jnwSeo9jlFhMSf4Dh4gC4
	 dpmsZGaRz7dpPFLq+m35r2PHFW20qOcv/Z/ZMGKqNXK+JC0BHw1+Gkslb6Z9nKabOY
	 MC2m+oAj85rdObexANH3HZBD9ApxypsY/0u2tQy51yrAEjCqtNq3ZjoWLJi7VGE8EK
	 Grw+SptHgdGiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1Mgzeb-1pTnCc2Rob-00hRDn; Sat, 12 Nov 2022 17:31:35 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH] initial configs: set initial {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
Date: Sat, 12 Nov 2022 16:31:03 +0000
Message-Id: <20221112163103.42796-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:BDW2RmvQPtql672WJ+KGLXzFbSNOlCILTLJNc3A9CMtb0RUYK/2
 fgHjEVsXvltC/4f7gcku+Gge6a2B3+Z5N/Di0WMRIkNNu0DTkS8zOg6bXY3d/1Wt/hu0KUL
 lQFime8BV4QreDRfZBE+Va6Kk1bofSOsisxcNmsGqNnaYaSZ2uOXQj3dhspqOHrF282IzO4
 oJ7ZhQSN374DRhBQVX0zQ==
UI-OutboundReport: notjunk:1;M01:P0:yfRY398kpbs=;M9tXUSX+nZsC/9Mo/uBmwnHvbth
 uRgRg8ebkTowrrABij+ukbil3ql3NHdMUGqlEH4TUEkfPRKClTd740IzAuTDf56qiY7ja6ZE0
 CngDaEwrrFeIEOScxj1jCFmAfmZaI/b6dtKF9kxCxQ93y0yp/vyM6LZwjagngGyDnIhEcr0N5
 sUTpLKNjrfowpwpaK0Frw5rZC+3JidPppAR0JyWgZMLAl4FDSUAQP+uqVAIzi7AZe9BKG4X0a
 ODYb66iRBR9TT32O8Z1eFj/aonECHrDYP4Ks6qVgo/V48FkfBc9mHT7PDRriBQP/aYWaAvWdW
 i2HlHUphEKFf1JPMa3Dr7S2s9R1XFuWAZoJxglZ8S36AnDtyQX69oCzZbcDrIqyHEsx1TmZ49
 yLJZ95pWpoboNZzZKjqKmkSdsab3IB6R8SpO1OkjtiGCbDdJAkJt8W3ZjJ5R7FVootYcXGV/L
 4PszmfmUnuZD7Brb6sdiCdzsFjz9eBrX/pkSGkF6oll/NwUjV5TXnCaoxra9yNrCyT8F8siWY
 NxIvlfE8CnrW05gCmhpkI/xRjW/21yOIowY/x190MFI27vCRGRlSF37O1FjpEEWFgFeEbXUNn
 7DF1xcRs7mhjI9Q3zu3C4fLSRHC3Yr6G4DR578ODI6yNLYaJ2dQm9o+6dto+7372W+13jf2zD
 QEiPRYU/vlxsNIQzR8Nncn4a9K+Tzt5crug44rBTtFQ/ba70fZLjGiXIgHWqaVADxKyzbQ+9z
 SQH2ZCan9hX8I5svJk5gtnVPb7f8Z9ZbHmx/Wcj5e17p2IgCXpUWaTSdK88BaiEKS9nkqXdgV
 jVVn+ZiYV8SUD+y3L0eflEByRwcgJAEHQngxwk8IRn8JRy+xzJbvN566TrANoOlAIF+5V5ybZ
 aWpU8QrG7RZ/FKsmKwOcqUg4BSTQ/xNnCBe5jsdM2ap2hvhNYOMhpUa5kRbJ+aX59FzOhAGiK
 BxWmmQh22SM5ZyZ4NvxlUaAK23Q=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 16:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173163

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change features with weak defau=
lts

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta-poky/conf/distro/poky.conf               |  2 +-
 meta/conf/bitbake.conf                        | 28 +++++++++----------
 .../distro/include/default-distrovars.inc     |  6 ++--
 meta/conf/machine/include/qemu.inc            |  2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.=
conf
index 3e90766349..3a453ef9ed 100644
=2D-- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -18,7 +18,7 @@ POKY_DEFAULT_DISTRO_FEATURES =3D "largefile opengl ptest=
 multiarch wayland vulkan"
 POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"

-DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FE=
ATURES}"
+DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_F=
EATURES}"

 PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
 PREFERRED_VERSION_linux-yocto-rt ?=3D "5.19%"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dea573986d..b2540bb3f5 100644
=2D-- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -885,31 +885,31 @@ OES_BITBAKE_CONF =3D "1"
 # Machine properties and packagegroup-base stuff
 ##################################################################

-MACHINE_FEATURES ?=3D ""
-DISTRO_FEATURES ?=3D ""
+MACHINE_FEATURES ??=3D ""
+DISTRO_FEATURES ??=3D ""

-DISTRO_EXTRA_RDEPENDS ?=3D ""
-DISTRO_EXTRA_RRECOMMENDS ?=3D ""
-MACHINE_EXTRA_RDEPENDS ?=3D ""
-MACHINE_EXTRA_RRECOMMENDS ?=3D ""
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
+DISTRO_EXTRA_RDEPENDS ??=3D ""
+DISTRO_EXTRA_RRECOMMENDS ??=3D ""
+MACHINE_EXTRA_RDEPENDS ??=3D ""
+MACHINE_EXTRA_RRECOMMENDS ??=3D ""
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS ??=3D ""
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ??=3D ""

 EXTRA_IMAGE_FEATURES ??=3D ""
 IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"

 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?=3D "x11"
+DISTRO_FEATURES_NATIVE ??=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVESDK ??=3D "x11"

 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl w=
ayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod openg=
l wayland"
+DISTRO_FEATURES_FILTER_NATIVE ??=3D "api-documentation debuginfod opengl =
wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ??=3D "api-documentation debuginfod open=
gl wayland"

-DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-d=
ata ldconfig"
-MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
+DISTRO_FEATURES_BACKFILL ??=3D "pulseaudio sysvinit gobject-introspection=
-data ldconfig"
+MACHINE_FEATURES_BACKFILL ??=3D "rtc qemu-usermode"

 COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACH=
INE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/d=
istro/include/default-distrovars.inc
index abf48f79f0..3b3d439ad3 100644
=2D-- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -19,9 +19,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc =3D "seccomp"
 # seccomp is not yet ported to microblaze
 DISTRO_FEATURES_DEFAULT:remove:microblaze =3D "seccomp"

-DISTRO_FEATURES_DEFAULT ?=3D "acl alsa bluetooth debuginfod ext2 ipv4 ipv=
6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat sec=
comp"
-DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
-IMAGE_FEATURES ?=3D ""
+DISTRO_FEATURES_DEFAULT ??=3D "acl alsa bluetooth debuginfod ext2 ipv4 ip=
v6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat se=
ccomp"
+DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT}"
+IMAGE_FEATURES ??=3D ""

 COMMERCIAL_AUDIO_PLUGINS ?=3D ""
 # COMMERCIAL_AUDIO_PLUGINS ?=3D "gst-plugins-ugly-mad gst-plugins-ugly-mp=
egaudioparse"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/includ=
e/qemu.inc
index d9bed7708d..04ffe55309 100644
=2D-- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,7 +10,7 @@ XSERVER ?=3D "xserver-xorg \
             xf86-video-fbdev \
             "

-MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
+MACHINE_FEATURES ??=3D "alsa bluetooth usbgadget screen vfat"

 MACHINEOVERRIDES =3D. "qemuall:"

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/mac=
hine/include/riscv/qemuriscv.inc
index 0b399ac1f9..f5f9f89a9f 100644
=2D-- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/riscv/tune-riscv.inc

-MACHINE_FEATURES =3D "screen keyboard ext2 ext3 serial"
+MACHINE_FEATURES ?=3D "screen keyboard ext2 ext3 serial"

 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES +=3D "uImage"
=2D-
2.17.1


