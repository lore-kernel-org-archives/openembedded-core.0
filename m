Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T90OQ-000397-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 23:10:42 +0200
Received: by weyr6 with SMTP id r6so4373718wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=GmhRR4RYcKy2chFZHLxfgoHncqw1JzxEoogENF1f3CE=;
	b=QoE0TQv3WPJAB1pyGtg5wQyIsYM57nxDFGMi5z3oDiGj49uHwwGqNgIgXwrIrpHTDB
	EXipqshc2N6Lh++6NvBYe3q4tvmIUUTo2dbRp3iyyv1vWuMhjTLeX0DZR+dT/rf8PxnY
	LIK6E3P5w5JH1DLCdeYhm1xNu2epffSolVJLO966uRo0QI+p8KciIXvmTBKZ7OE4NKPG
	nnDVVtf73YBhz5pny8QBFdZMmSpC7k95pUeaf4HGfrvDge/U7N9qJEISLecQeOk21SPA
	q23Qqb+4BjVD3KL7ZRNOARF5aS6pVOTi8wMjj44HsSTK8iMVxLMG/AkoYiKlxOpp44uI
	SF/Q==
Received: by 10.216.233.208 with SMTP id p58mr2253761weq.56.1346792300436;
	Tue, 04 Sep 2012 13:58:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm26008355wiv.11.2012.09.04.13.58.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 13:58:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 22:58:37 +0200
Message-Id: <1346792317-26563-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346792317-26563-1-git-send-email-Martin.Jansa@gmail.com>
References: <1346792317-26563-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] packagegroup-core-x11: split machine specific parts to separate recipe packagegroup-core-x11-server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 21:10:42 -0000

* add new packagegroup-core-x11-server to SIGGEN_EXCLUDERECIPES_ABISAFE,
  so that recipes depending on it are not rebuilt after every machine
  swtich
* allows to remove task-x11-server and task-x11 from meta-oe without 
  loosing any functionality
* be carefull with default XSERVER value which does not have 
  xf86-input-mouse and xf86-input-keyboard)
* VIRTUAL-RUNTIME_xserver_common which defaults to x11-common in oe-core 
  and xserver-common in meta-oe's task-x11

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf                               |  1 +
 .../packagegroups/packagegroup-core-x11-xserver.bb | 24 ++++++++++++++++++++++
 .../packagegroups/packagegroup-core-x11.bb         | 16 ++-------------
 3 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index dfcb1f3..ed50f1c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -24,4 +24,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   base-files \
   keymaps \
   udev-extraconf \
+  packagegroup-x11-xserver \
 "
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
new file mode 100644
index 0000000..bf39e63
--- /dev/null
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -0,0 +1,24 @@
+#
+# Copyright (C) 2011 Intel Corporation
+#
+
+LICENSE = "MIT"
+PR = "r38"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGES = "${PN}"
+
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+
+SUMMARY_${PN} = "X11 display server"
+RDEPENDS_${PN} = "\
+    ${XSERVER} \
+    "
+
+# Allow replacing task-x11-server in meta-oe
+RPROVIDES_${PN} = "task-x11-server task-xserver"
+RREPLACES_${PN} = "task-x11-server task-xserver"
+RCONFLICTS_${PN} = "task-x11-server task-xserver"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index e306c08..e89df3a 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -3,15 +3,11 @@
 #
 
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 inherit packagegroup
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGES = "${PN} ${PN}-xserver ${PN}-utils"
-
-XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+PACKAGES = "${PN} ${PN}-utils"
 
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
@@ -25,11 +21,6 @@ RDEPENDS_${PN} = "\
     ${PN}-utils \
     "
 
-SUMMARY_${PN}-xserver = "X11 display server"
-RDEPENDS_${PN}-xserver = "\
-    ${XSERVER} \
-    "
-
 SUMMARY_${PN}-utils = "X11 basic utilities and init"
 RDEPENDS_${PN}-utils = "\
     ${VIRTUAL-RUNTIME_xserver_common} \
@@ -44,9 +35,6 @@ RDEPENDS_${PN}-utils = "\
 RPROVIDES_${PN} = "task-x11"
 RREPLACES_${PN} = "task-x11"
 RCONFLICTS_${PN} = "task-x11"
-RPROVIDES_${PN}-xserver = "task-x11-server task-xserver"
-RREPLACES_${PN}-xserver = "task-x11-server"
-RCONFLICTS_${PN}-xserver = "task-x11-server"
 RPROVIDES_${PN}-utils = "task-x11-utils"
 RREPLACES_${PN}-utils = "task-x11-utils"
 RCONFLICTS_${PN}-utils = "task-x11-utils"
-- 
1.7.12



