Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9837B7704D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 02:18:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t852IVFi010494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Sep 2015 19:18:31 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 4 Sep 2015 19:18:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Sep 2015 19:18:31 -0700
Message-ID: <1441419511-5991-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: more nails in the coffin
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
X-List-Received-Date: Sat, 05 Sep 2015 02:18:32 -0000
Content-Type: text/plain

Create packagegroup-busybox and modify packagegroup-core-boot
to conditionally use it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../packagegroups/packagegroup-busybox.bb          |   23 ++++++++++++++++++++
 .../packagegroups/packagegroup-core-boot.bb        |   17 ++++++++-------
 2 files changed, 32 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-busybox.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-busybox.bb b/meta/recipes-core/packagegroups/packagegroup-busybox.bb
new file mode 100644
index 0000000..acf0791
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-busybox.bb
@@ -0,0 +1,23 @@
+#
+# Copyright (C) 2015 Wind River Inc.
+#
+
+SUMMARY = "Busybox related information"
+DESCRIPTION = "Busybox packages and variables"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+# Do not ever, ever override LOCAL variables.
+#
+LOCAL_sysvinit = " \
+                   ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+                   "
+
+RDEPENDS_${PN} = "\
+    busybox \
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${LOCAL_sysvinit}", "", d)} \
+    "
+
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..b2d0775 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -17,14 +17,17 @@ inherit packagegroup
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
-# Distro can override the following VIRTUAL-RUNTIME providers:
+# These can be overridden in any .conf file.
+#
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
-VIRTUAL-RUNTIME_login_manager ?= "busybox"
-VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
+VIRTUAL-RUNTIME_busybox ?= "packagegroup-busybox"
 
-SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+# Do not ever, ever override LOCAL variables.
+#
+LOCAL_sysvinit = " \
+                    sysvinit \
                     modutils-initscripts \
                     init-ifupdown \
                     ${VIRTUAL-RUNTIME_initscripts} \
@@ -33,12 +36,10 @@ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwc
 RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
-    busybox \
-    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${LOCAL_sysvinit}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_busybox} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.9.5


