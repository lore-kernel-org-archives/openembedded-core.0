Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLWkZ-0003j0-15
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:04:47 +0100
Received: by faas16 with SMTP id s16so186973faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KHJmOQBVlKBB5opTMGVDJD52Agy4UJ35X+UOi/ajzhA=;
	b=WB+Lk6feFXT9ViNWqowB1QH7nHEH8ux7MtbrGl8Nk2KkF9mxKwOP3xLvvqgudQBZl5
	8zZhQsDpEkGyrswzu7xmj6LVn2qYlQGJ2Dp9XYoqHF8q4PnQoNTPfswtt8SPOoPbM4da
	1RNvW9tU1uAiQ8Xs8s3QpOEU9JYxKDGJUgN3k=
Received: by 10.223.91.82 with SMTP id l18mr4042859fam.30.1320224313802;
	Wed, 02 Nov 2011 01:58:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm4197213faf.14.2011.11.02.01.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 01:58:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:58:23 +0100
Message-Id: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH 1/3] task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow distributions to use different set of initscripts or no initscripts at all
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
X-List-Received-Date: Wed, 02 Nov 2011 09:04:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb   |    6 +++++-
 meta/recipes-core/tasks/task-core-boot.bb |    6 ++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 23a3051..4fe7987 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -1,7 +1,11 @@
 SUMMARY = "Keyboard maps"
 DESCRIPTION = "Keymaps and initscript to set the keymap on bootup."
 SECTION = "base"
-RDEPENDS_${PN} = "initscripts console-tools"
+
+# Distro can override initscripts provider
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} console-tools"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 9e63ebb..05c280d 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 ALLOW_EMPTY = "1"
-PR = "r8"
+PR = "r9"
 
 #
 # Set by the machine configuration with packages essential for device bootup
@@ -23,6 +23,8 @@ VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
 # Distro can override init_manager provider
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+# Distro can override initscripts provider
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 
 PACKAGES = "\
     task-core-boot \
@@ -34,7 +36,7 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
-    initscripts \
+    ${VIRTUAL-RUNTIME_initscripts} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-- 
1.7.7.1



