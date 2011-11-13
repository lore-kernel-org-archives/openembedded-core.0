Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RPeJF-0003X9-No
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Nov 2011 18:57:38 +0100
Received: by eyd9 with SMTP id 9so4465195eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2011 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3KOsiqGK3mhmSZUxulH2nl/UM7RaEoxIxpzXKIIEnPs=;
	b=nYgBzbXWsqZCILG475y+4XDLAiA7Jg+Dh22SR2+OG+Z66vkeRDpFr+x2Jg1pfYThA3
	TmeRRwVgSqDd/agqSfWaBOZCniPwoOB5Y3zh9ZmNvjOpq0VwSo8YquhFvYALswyeZ4ME
	ZXFOOj4FSMrJDSDerWWq5Pm76TzLEQbN/8csM=
Received: by 10.213.2.133 with SMTP id 5mr1551350ebj.8.1321206674146;
	Sun, 13 Nov 2011 09:51:14 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 49sm51968781eec.1.2011.11.13.09.51.12
	(version=SSLv3 cipher=OTHER); Sun, 13 Nov 2011 09:51:13 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 21:50:54 +0400
Message-Id: <1321206654-14713-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1321206654-14713-1-git-send-email-dbaryshkov@gmail.com>
References: <1321206654-14713-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/2] screenshot: rename to sato-screenshot
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
X-List-Received-Date: Sun, 13 Nov 2011 17:57:38 -0000

To remove a name conflict with e17's screenshot tool (and possibly other
screenshot tools, as screenshot is a generic term), rename screenshot
to sato-screenshot.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../sato-screenshot/files/fix_ldadd_order.patch    |   15 +++++++++++++
 .../sato-screenshot/sato-screenshot_git.bb         |   23 ++++++++++++++++++++
 .../screenshot/files/fix_ldadd_order.patch         |   15 -------------
 meta/recipes-sato/screenshot/screenshot_git.bb     |   23 --------------------
 meta/recipes-sato/tasks/task-core-x11.bb           |    2 +-
 5 files changed, 39 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
 create mode 100644 meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
 delete mode 100644 meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
 delete mode 100644 meta/recipes-sato/screenshot/screenshot_git.bb

diff --git a/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
new file mode 100644
index 0000000..7d9689e
--- /dev/null
+++ b/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
@@ -0,0 +1,15 @@
+Fix the ordering of LDADD options to fix a compilation failure.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Inappropriate [configuration] 
+
+diff -urN screenshot.orig//Makefile.am screenshot/Makefile.am
+--- screenshot.orig//Makefile.am	2010-06-29 11:55:00.000000000 -0700
++++ screenshot/Makefile.am	2011-03-01 11:09:01.215813968 -0800
+@@ -23,4 +23,4 @@
+ # A standalone tool for running from a terminal and scripts
+ bin_PROGRAMS = screenshot
+ screenshot_SOURCES = main.c
+-screenshot_LDADD = $(GTK_LIBS) libshot.la
++screenshot_LDADD = libshot.la $(GTK_LIBS)
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
new file mode 100644
index 0000000..5e51d3d
--- /dev/null
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "An ultra-simple screen capture utility, aimed at handheld devices"
+HOMEPAGE = "http://www.o-hand.com"
+BUGTRACKER = "http://bugzilla.openedhand.com/"
+
+LICENSE = "GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://main.c;endline=9;md5=023e14d6404d0a961eb97cbd011fc141 \
+                    file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
+
+DEPENDS = "matchbox-panel-2"
+SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
+PV = "0.1+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
+           file://fix_ldadd_order.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/matchbox-panel/*.so"
+FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
diff --git a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
deleted file mode 100644
index 7d9689e..0000000
--- a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix the ordering of LDADD options to fix a compilation failure.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Upstream-Status: Inappropriate [configuration] 
-
-diff -urN screenshot.orig//Makefile.am screenshot/Makefile.am
---- screenshot.orig//Makefile.am	2010-06-29 11:55:00.000000000 -0700
-+++ screenshot/Makefile.am	2011-03-01 11:09:01.215813968 -0800
-@@ -23,4 +23,4 @@
- # A standalone tool for running from a terminal and scripts
- bin_PROGRAMS = screenshot
- screenshot_SOURCES = main.c
--screenshot_LDADD = $(GTK_LIBS) libshot.la
-+screenshot_LDADD = libshot.la $(GTK_LIBS)
diff --git a/meta/recipes-sato/screenshot/screenshot_git.bb b/meta/recipes-sato/screenshot/screenshot_git.bb
deleted file mode 100644
index 917a27d..0000000
--- a/meta/recipes-sato/screenshot/screenshot_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "An ultra-simple screen capture utility, aimed at handheld devices"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
-
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://main.c;endline=9;md5=023e14d6404d0a961eb97cbd011fc141 \
-                    file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
-
-DEPENDS = "matchbox-panel-2"
-SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
-PV = "0.1+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://fix_ldadd_order.patch"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/matchbox-panel/*.so"
-FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index 106bc0f..f1b06f9 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -61,7 +61,7 @@ RDEPENDS_task-core-apps-x11-core = "\
     leafpad \
     ${FILEMANAGER} \
     matchbox-terminal \
-    screenshot"
+    sato-screenshot"
 
 
 RDEPENDS_task-core-apps-x11-games = "\
-- 
1.7.7.1



