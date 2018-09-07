Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBF3E797AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 11:40:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id o18-v6so14387883wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 04:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eRzu94CnB8I8dZb6TVe6aTevJQ7X6PJWqRVg38RQoc8=;
	b=BqrPkNvk+uIGCud0wcPoa8gCu5kziePsrgz5eKFdnLYtySQPY2GKcnnmZYX5y50rC7
	VGHMoJna4/XIfRz6PFZtmzDOYBAA+MGzFbkkZbu+iSyYGtCZ5kfRDa4KV5mytfKHZz7u
	ssTR4mcQXAhiE/TCLAMyfjNLCMLN7f4FsPs+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eRzu94CnB8I8dZb6TVe6aTevJQ7X6PJWqRVg38RQoc8=;
	b=EWsrmZlTG0rQbzc+Tm41T7LSfZK8ZKx0wytOh0iq0Nm0+Dlq01N8vIvyRz2K9R7Bvm
	EDqlVRVavLN0LaCWyX+8erISAkxgqWf419WXahrrJH0raV5rV1fooS/UhWpZYkPwTBvG
	LFOCZM6dpS4pV5mf1Pkifj0kMBXo6aFiBZHY4ahuQauiCYyFrfXpzlljGuviH9BJw7lT
	QADQDONbBN5TZiS9eYMJsQj6y/QoeibZp+ULaslagf+VWqGWtgPDsdhh4MrvNTH8tiAK
	i88MLtjgoGWflco3agDBXZdk5Tj2W1lRg0Ob/EVhIu31B3+89bHvoBlpFAIFLa1FtLwu
	C6/w==
X-Gm-Message-State: APzg51BsFXWJzqoXBayizdTwHW6SScMCn3JwdI4zfnurrv1D3xF6sMGH
	wtizmbHqtCclooOtk4vzsV7C+b040pA=
X-Google-Smtp-Source: ANB0Vda9V0qSbTSHQOQmZcxeiOgVajVgLuFnEBmpWGRHBdFz2cl/4mKGtHdRTo8lxixG1VwmxbmtDQ==
X-Received: by 2002:a1c:545d:: with SMTP id
	p29-v6mr5340243wmi.94.1536320443909; 
	Fri, 07 Sep 2018 04:40:43 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g7-v6sm6642694wrw.30.2018.09.07.04.40.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 04:40:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:40:36 +0100
Message-Id: <20180907114036.16685-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180907114036.16685-1-richard.purdie@linuxfoundation.org>
References: <20180907114036.16685-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] busybox/packagegroups: Break out the busybox-syslog dependency
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
X-List-Received-Date: Fri, 07 Sep 2018 11:40:44 -0000

The busybox-syslog rrecomends is proving tricky as it gets pulled in early and
there are conflicts between its use of update-alternatives and busybox needing
to provide those things.

We already have recipes using BAD_RRECOMMENDS to remove this dependency, it probably
makes sense to spell it out explicitly and allow it to be overridden more easily.

This patch does this, dropping the now unneeded BAD_RRECOMMENDS. It preserves
the dependency as a recommendation for now, further cleanup may allow simplication
of that.

This unbreaks certain build failures on the autobuilder, more as a workaround but
is a change we probably want to make anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-providers.inc                  | 1 +
 meta/recipes-core/busybox/busybox.inc                           | 2 +-
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 2 --
 meta/recipes-core/images/core-image-tiny-initramfs.bb           | 2 --
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb      | 1 +
 .../initrdscripts/initramfs-live-install-efi_1.0.bb             | 1 +
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb   | 1 +
 .../initrdscripts/initramfs-module-install-efi_1.0.bb           | 1 +
 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb       | 1 +
 10 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 779b03d50cf..019ceeb290a 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -25,6 +25,7 @@ VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
+VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 2ad29a7e72e..e1fba4243a1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -47,7 +47,7 @@ RCONFLICTS_${PN}-syslog = "rsyslog sysklogd syslog-ng"
 
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
+RRECOMMENDS_${PN} = "${PN}-udhcpc"
 
 RDEPENDS_${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}"
 
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 6de860e43a8..7df8ab1ebd8 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -27,7 +27,5 @@ inherit core-image
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-BAD_RECOMMENDATIONS += "busybox-syslog"
-
 # Use the same restriction as initramfs-live-install
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 51d08a0cd1c..d7f97f3a170 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -23,8 +23,6 @@ inherit core-image
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-BAD_RECOMMENDATIONS += "busybox-syslog"
-
 # Use the same restriction as initramfs-live-install
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6337b998acc..660343eafa2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -2,6 +2,7 @@ SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 PR = "r4"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index f588a1077bf..cc842ae8b71 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "file://init-install-efi.sh"
 PR = "r1"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 9222d57c1ae..48fc0c4a769 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -8,6 +8,7 @@ PR = "r9"
 S = "${WORKDIR}"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 78a61cde25f..523138cff36 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -2,6 +2,7 @@ SUMMARY = "initramfs-framework module for EFI installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 PR = "r4"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 04e90cd302c..56898e824f3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -2,6 +2,7 @@ SUMMARY = "initramfs-framework module for installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 # The same restriction as grub
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 76cd7fc4ebf..8dc445dc8f6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -46,4 +46,5 @@ RDEPENDS_${PN} = "\
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
 RRECOMMENDS_${PN} = "\
+    ${VIRTUAL-RUNTIME_base-utils-syslog} \
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
-- 
2.17.1


