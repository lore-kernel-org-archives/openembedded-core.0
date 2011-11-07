Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ9I-0000Rq-GD
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:26:08 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2512213faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3hgbMSfjcil6CH6jBD9Wq4K/KwSE+1+I+AwLo5KGHts=;
	b=lu/YqgRtu1NyZb1N/ZEMtmj1SOWGk5JBDTuc0pByqUz6xe2b6EVaGoBnm/alDl33PV
	/SD/YeiOSvMfe7P6u0i+NhvhKUCIG2q+smMv0ykYExyUB+1cDvgnGCC5IFGccAOTMqFZ
	lQ92seJnHm+CAbH73VTNN0Umdp02d659WJtLo=
Received: by 10.152.103.68 with SMTP id fu4mr6632030lab.50.1320675588348;
	Mon, 07 Nov 2011 06:19:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ps2sm8614570lab.12.2011.11.07.06.19.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:19 +0100
Message-Id: <84e5fbf773aaea7baedb2aa5f7a13270c843ddd4.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 4/6] task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow distributions to use different set of initscripts or no initscripts at all
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
X-List-Received-Date: Mon, 07 Nov 2011 14:26:08 -0000

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
1.7.7.2



