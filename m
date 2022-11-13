Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE92C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 08:29:32 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.864.1668328156189059570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 00:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=WhCqnlBi;
 spf=pass (domain: email.de, ip: 217.72.192.78, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668328154;
	bh=79fKZqh3CspqxYm1e1lX1LwXh2cFFgoKiTiVswSng68=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WhCqnlBiinCh7OvCnSFOnko2Rm6+ntm2JYEgSLcywnaOCYpSTGn8bDW6z5PjdTFu+
	 cSPAOyIA+8yFHca2aRcmN04VJYBnTA6Ywc/8Kw6sp1IPRa8ql4orYYhCfu4FFHngUC
	 KRJr/FLPFiXCc4qu1f1yBCNMYV0ETI1YTkk+OQ50t7Hd1T8uRSpa+kvb6lCp088rvJ
	 ZasRUJ2vk4DDm7jFv/WSz3fWGOxUYXMUEoMlFI7kpcEo7X7sxZPnck8fRrz1/+ascq
	 fZMV4X/cnJQSL+FvWhgWpDzgxOGGh5W5nQLDKmdQlMo27rgNzQqQBWk950v+I8Ar9v
	 V+UMJgAYbs+9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MgibW-1pS6fG0Sk8-00gubl; Sun, 13 Nov 2022 09:29:14 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [meta-oe][PATCH v2 2/2] initial configs: set initial {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
Date: Sun, 13 Nov 2022 08:28:24 +0000
Message-Id: <20221113082824.17041-2-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221113082824.17041-1-christoph.lauer@email.de>
References: <20221113082824.17041-1-christoph.lauer@email.de>
X-Provags-ID: V03:K1:9mL8xM9yCOgugtNanb/Z1HhX5RU4Nc8reOOor4WoOzcMj4EQp4k
 2N+YT3I5p7g1xvKH5Wxy2+1YFoicrxWuj1CTqeQYYaINOP4ShynQFJhAx5/caaTocZTG0Mp
 lVxzPWyEaNTCYPOF/1/Va7OVf4SJnzO4qL/+aE698t557mw+KPzgaYCwVw398g4d00MvTjH
 ccLQNlkWamapuZCrtLmkw==
UI-OutboundReport: notjunk:1;M01:P0:Vr1bJ+l2YMU=;hf75Y7xhcOOz/DRysjKBhDvoViK
 Dnf/ORJjGHZvMobaweDNPV9ZCnIQzrQujA1MvYNzZNpGsD7SUVX2ihKO7ebdaQ8+tDeFRSq/n
 s3MFkREMzWYPCBp/gQ0YVlj8wHqRDBb5kyEfCibVCkuo8vNWm02Tqo8Mnlx+9cnT29JRcdzvD
 JHahfvS73FVkSP6r1XQb3+EPPnbjjJv3pqatEAz2iutgITRPjC76yGwH5LjF8cPZPpocM5aat
 cxVAYJlcdl+RWCwYnXxwKMfziddjg1JTxDXbVTN02SAy0bl4abn251V9UW5+J4jtYKDH0uGDI
 6zicDEnjHJ5fTTxl1GbL5O7xD7YEAMvIQfTRBuYPkF5ju2OgCcunzVfDHMycxHuill+pTGpKp
 PeFRv53tBq1ypeRFOzH6Jq4mjhZ8OucDHk1vz3XTb0SUTYjCIeBK1BziUDPEPDl7pP5cv47HB
 frOBLB26VAZ+fm6ePEFSbp/lUv/l/hFwdIX0W5uP2dQ4kadqgnZyHu2BCdeuZX2BGUHsgyZRj
 g6iV9q+aP+Ckjs1GGiDpS9gWTpXI/8wuCCfEdE/2fT8vsLGOGhAuvY+p6cP0PYWcCQL96oBTc
 ivgoJzdnSwF+CvKPknWeNn7s/+F+GU/fKMKzbCGqBduIZ0A+uJ3YK/YZG8LFsQ7ng7jIp4DY9
 EtlgxKEKOjzMlw787qvlzabHtviYJEYvhvBxAepJCfBgnFFaczUAke15WbVfAn8IeLgV8iNTa
 WeFh3gUOQWUFAG1SRWaxCPhtFPKj6oEYFhXfTwgCDhwAs99IbW3lTzH65MNOsoMoFPjo7u/iZ
 jqxC3+em0OQ4JULtEArnx3ywKuF7HrO+zPqOc3RVYBB64V8qoL1J0sr+tPVt/rdA4qf/+1LXj
 ExgCW/pJ5qpqTmPWfQNXsPrbl4S/eposCNfget5OHzEEvDMfuhcBXLu5BvEVIExE9iAVWD31a
 HnWsArDPHU5fayW2YsrpYyr+X2s=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 08:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173183

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change features with weak defau=
lts

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/conf/bitbake.conf                        | 28 +++++++++----------
 .../distro/include/default-distrovars.inc     |  6 ++--
 meta/conf/machine/include/qemu.inc            |  2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

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


