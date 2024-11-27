Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECCDD6ACF7
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 17:26:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.77061.1732728357155307323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 09:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gFFnflew;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202411271725537f585b0d0240f06fcf-kuhkca@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202411271725537f585b0d0240f06fcf
        for <openembedded-core@lists.openembedded.org>;
        Wed, 27 Nov 2024 18:25:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Qo6pBqXoElZDio9GRfBzccye2zbZHiFRIlgLWAR+IOI=;
 b=gFFnflewCesdYpa9ZAVORbL0B1xxeMHHNFX+JpI4ylTYxfCqhXlsos5AO8u7pR4bKMMFOI
 83lD0+fHGl18IF5caNx3jCyH2nFpZUmUvrqib5F9LNzBkYJ2bJJzTg+E3kll0DeOCZNsUbk2
 fcd9hcBcm9lKLHTZkE6duKrkg3D0DeXjDuA+TvTYDyCpbFRXzWDIvvyAieFyojLXPX0QG0su
 HdeOoce+O5/qsHUlaxtOjO3rNtHKS5mtCswBHh8VKgnLcPKCJ261kmh8GE8sRQAhlz5I5VD1
 n2ptKrsOLXApgG3Fv7H3FwSVr/mH269Rbc6pWcgam6sTCAwL2paSKhyA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 1/2] init-manager: define dev_manager for all init managers
Date: Wed, 27 Nov 2024 18:24:54 +0100
Message-Id: <20241127172455.15722-1-peter.marko@siemens.com>
In-Reply-To: <20241125183636.15293-1-peter.marko@siemens.com>
References: <20241125183636.15293-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 17:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207939

From: Peter Marko <peter.marko@siemens.com>

Currently VIRTUAL-RUNTIME_dev_manager is defined by some init managers
with "??=" and in packagegroup-core-boot with "?=".
This means that this variable is different in this package group and in
all other the recipes.
This was discovered when trying to use new feature INIT_MANAGER when
migrating to scarthgap and using systemd distro. After deleting all
VIRTUAL_RUNTIME providers defined in init-manager-systemd udev was
installed additionally via packagegroup-core-boot.

Hiaving a distro settings overriden in single recipe is wrong and needs
to be corrected. Therefore let's define the setting in all init managers
and remove it from packagegroup-core-boot.

core-image-tiny-initramfs has a dilemma - use busybox-mdev even if
distro does not enable it in busybox recipe to keep the image tiny, or
rather not install it even if distro enables it in busybox.
This patch chooses the first option.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/init-manager-none.inc            | 1 +
 meta/conf/distro/include/init-manager-sysvinit.inc        | 1 +
 meta/recipes-core/images/core-image-tiny-initramfs.bb     | 3 +++
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 -
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index bbedf898f7..6ece5c9906 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -1,3 +1,4 @@
 VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"
+VIRTUAL-RUNTIME_dev_manager ??= "udev"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index aa2393944d..e2d17b358d 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -4,3 +4,4 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
 VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"
+VIRTUAL-RUNTIME_dev_manager ??= "udev"
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 7a71d55b1e..c2aa68c788 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -6,6 +6,9 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
 that can subsequently be picked up by external image generation tools such as wic."
 
+# if distro does not override VIRTUAL-RUNTIME_dev_manager and default in different, busybox is compiled without mdev support
+# however this keeps the image small by not installing heavy-weight manager and in initramfs it may not even be necessary
+# override in distro if needed
 VIRTUAL-RUNTIME_dev_manager ?= "busybox-mdev"
 
 PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index fecc3334ea..fa06092e27 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -10,7 +10,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 # Distro can override the following VIRTUAL-RUNTIME providers:
-VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 EFI_PROVIDER ??= "grub-efi"
-- 
2.30.2


