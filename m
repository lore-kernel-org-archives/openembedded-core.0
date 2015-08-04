Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E3A4873237
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 10:59:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2015 03:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,608,1432623600"; d="scan'208";a="741836113"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2015 03:59:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 14:01:14 +0300
Message-Id: <1438686074-14691-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
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
X-List-Received-Date: Tue, 04 Aug 2015 10:59:55 -0000

* Remove backported patch
* Remove PR
* Use ${nonarch_base_libdir} for udev files.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes from V1:
* Use ${nonarch_base_libdir} for udev files: this should make the
  recipe multilib safe



 .../always_include_config.h.patch                  | 81 ----------------------
 ...ouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} | 12 ++--
 2 files changed, 5 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch
deleted file mode 100644
index 12fb9df..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 336f8633837abe4a1e5ba84b53ac8b9dac5d29a2 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Date: Thu, 28 Nov 2013 11:59:53 -0800
-Subject: Always include config.h first
-
-This fixes some build warnings about CSRG_BASED being redefined due to
-incorrect header include ordering.
-
-Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-
-Upstream-Status: Backport
-
-Index: xf86-input-vmmouse-13.0.0/shared/vmmouse_client.c
-===================================================================
---- xf86-input-vmmouse-13.0.0.orig/shared/vmmouse_client.c	2014-08-28 18:33:16.168070587 -0700
-+++ xf86-input-vmmouse-13.0.0/shared/vmmouse_client.c	2014-08-28 18:33:16.152070587 -0700
-@@ -39,6 +39,10 @@
- #endif
- 
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
- #include "vmmouse_client.h"
- #include "vmmouse_proto.h"
- 
-Index: xf86-input-vmmouse-13.0.0/shared/vmmouse_proto.c
-===================================================================
---- xf86-input-vmmouse-13.0.0.orig/shared/vmmouse_proto.c	2014-08-28 18:33:16.168070587 -0700
-+++ xf86-input-vmmouse-13.0.0/shared/vmmouse_proto.c	2014-08-28 18:33:16.156070587 -0700
-@@ -33,6 +33,10 @@
-  */
- 
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
- #include "vmmouse_proto.h"
- 
- 
-Index: xf86-input-vmmouse-13.0.0/shared/vmmouse_proto.h
-===================================================================
---- xf86-input-vmmouse-13.0.0.orig/shared/vmmouse_proto.h	2014-08-28 18:33:16.168070587 -0700
-+++ xf86-input-vmmouse-13.0.0/shared/vmmouse_proto.h	2014-08-28 18:33:16.156070587 -0700
-@@ -36,11 +36,6 @@
- #ifndef _VMMOUSE_PROTO_H_
- #define _VMMOUSE_PROTO_H_
- 
--
--#ifdef HAVE_CONFIG_H
--#include "config.h"
--#endif
--
- #include <stdint.h>
- 
- #ifdef HAVE_XORG_SERVER_1_1_0
-Index: xf86-input-vmmouse-13.0.0/tools/vmmouse_detect.c
-===================================================================
---- xf86-input-vmmouse-13.0.0.orig/tools/vmmouse_detect.c	2014-08-28 18:33:16.168070587 -0700
-+++ xf86-input-vmmouse-13.0.0/tools/vmmouse_detect.c	2014-08-28 18:33:16.160070587 -0700
-@@ -26,14 +26,14 @@
-  */
- 
- 
--#include <stdlib.h>
--#include <signal.h>
--#include "vmmouse_client.h"
--
- #ifdef HAVE_CONFIG_H
- #include "config.h"
- #endif
- 
-+#include <stdlib.h>
-+#include <signal.h>
-+#include "vmmouse_client.h"
-+
- void
- segvCB(int sig)
- {
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
index 83ea960..8615b48 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
@@ -6,12 +6,8 @@ protocol that is provided by VMware virtual machines to give absolute \
 pointer positioning. The vmmouse driver is capable of falling back to the \
 standard 'mouse' driver if a VMware virtual machine is not detected."
 
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://always_include_config.h.patch"
-
-SRC_URI[md5sum] = "34f9f64ee6a1a51fc8266a9af24e1e07"
-SRC_URI[sha256sum] = "04cfb60366008d4db815c550d8fb8d0a4270c75fa7a20fa3bddc9ecbd355612c"
+SRC_URI[md5sum] = "85e2e464b7219c495ad3a16465c226ed"
+SRC_URI[sha256sum] = "0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
@@ -25,4 +21,6 @@ do_install_append () {
 	rm -rf ${D}${libdir}/hal/
 }
 
-FILES_${PN} += "${base_libdir}/udev/ ${datadir}/X11/xorg.conf.d"
+EXTRA_OECONF = "--with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
+
+FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ ${datadir}/X11/xorg.conf.d"
-- 
2.1.4


