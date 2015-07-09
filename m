Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD55C65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:52:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="761101020"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2015 00:52:00 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:43 +0300
Message-Id: <5946300c9c5e9e0be705a2db59c1bd03340a629a.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
References: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/5] xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
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
X-List-Received-Date: Thu, 09 Jul 2015 07:52:01 -0000

Remove backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../always_include_config.h.patch                  | 81 ----------------------
 ...ouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} |  6 +-
 2 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} (79%)

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
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
index 83ea960..676f2ba 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
@@ -8,10 +8,8 @@ standard 'mouse' driver if a VMware virtual machine is not detected."
 
 PR = "${INC_PR}.0"
 
-SRC_URI += "file://always_include_config.h.patch"
-
-SRC_URI[md5sum] = "34f9f64ee6a1a51fc8266a9af24e1e07"
-SRC_URI[sha256sum] = "04cfb60366008d4db815c550d8fb8d0a4270c75fa7a20fa3bddc9ecbd355612c"
+SRC_URI[md5sum] = "85e2e464b7219c495ad3a16465c226ed"
+SRC_URI[sha256sum] = "0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
-- 
2.1.4


