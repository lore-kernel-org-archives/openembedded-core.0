Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF87C60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:56:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2016 07:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="894706776"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2016 07:56:33 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2D7226A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:44:27 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 17:58:47 +0200
Message-Id: <1453305530-556-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] acpid: upgrade to 2.0.26
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
X-List-Received-Date: Wed, 20 Jan 2016 15:56:47 -0000

2.0.25 -> 2.0.26

a) Fixed an out of tree build error with musl
b) Updated HOMEPAGE and BUGTRACKER info

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/acpid/acpid.inc                   |  4 +-
 .../acpid/acpid/0001-Fix-out-of-source-build.patch | 46 ++++++++++++++++++++++
 meta/recipes-bsp/acpid/acpid_2.0.25.bb             |  7 ----
 meta/recipes-bsp/acpid/acpid_2.0.26.bb             |  9 +++++
 4 files changed, 57 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
 delete mode 100644 meta/recipes-bsp/acpid/acpid_2.0.25.bb
 create mode 100644 meta/recipes-bsp/acpid/acpid_2.0.26.bb

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index e015619..12ec19b 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -1,6 +1,6 @@
 SUMMARY = "A daemon for delivering ACPI events"
-HOMEPAGE = "http://sourceforge.net/projects/acpid/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=33140&atid=407341"
+HOMEPAGE = "http://sourceforge.net/projects/acpid2"
+BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
 LICENSE = "GPLv2+"
 
diff --git a/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch b/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
new file mode 100644
index 0000000..d1aa3aa
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
@@ -0,0 +1,46 @@
+From 5d32b65af750e2007730f3d55a552a186aed81a6 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 20 Jan 2016 14:08:29 +0200
+Subject: [PATCH] Fix out of source build
+
+Since the source directory contains another config.h, the build
+directory should be searched first.
+
+Upstream-Status: Submitted
+[https://sourceforge.net/p/acpid2/tickets/10/]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ sock.c      | 2 +-
+ ud_socket.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sock.c b/sock.c
+index 644d460..9e04501 100644
+--- a/sock.c
++++ b/sock.c
+@@ -21,7 +21,7 @@
+  */
+ 
+ #ifdef HAVE_CONFIG_H
+-#include "config.h"
++#include <config.h>
+ #endif
+ 
+ #include <unistd.h>
+diff --git a/ud_socket.c b/ud_socket.c
+index 1790917..83b2aa9 100644
+--- a/ud_socket.c
++++ b/ud_socket.c
+@@ -4,7 +4,7 @@
+  */
+ 
+ #ifdef HAVE_CONFIG_H
+-#include "config.h"
++#include <config.h>
+ #endif
+ 
+ #include <stdio.h>
+-- 
+2.4.0
+
diff --git a/meta/recipes-bsp/acpid/acpid_2.0.25.bb b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
deleted file mode 100644
index f00d25a..0000000
--- a/meta/recipes-bsp/acpid/acpid_2.0.25.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require acpid.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
-
-SRC_URI[md5sum] = "69bb0cc4a0a89eb2dfecc4851087f568"
-SRC_URI[sha256sum] = "0b700a8072bec162c512f72cbe419195601ab3e0ffd2138f9bd95ed3097a5c68"
diff --git a/meta/recipes-bsp/acpid/acpid_2.0.26.bb b/meta/recipes-bsp/acpid/acpid_2.0.26.bb
new file mode 100644
index 0000000..c3bd51f
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid_2.0.26.bb
@@ -0,0 +1,9 @@
+require acpid.inc
+
+SRC_URI += "file://0001-Fix-out-of-source-build.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
+
+SRC_URI[md5sum] = "f6d772e35ed907f1cc14ad1a546fd473"
+SRC_URI[sha256sum] = "8384f37e4f260f50183e2e20039823d8f06aed9db56924fe92097b7e0b2e0343"
-- 
2.4.0


