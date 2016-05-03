Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7261B6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2016 07:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="967737067"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2016 07:49:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4E2C96A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:21 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:40 +0300
Message-Id: <1462286989-22848-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 01/10] acpid: upgrade to 2.0.27
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
X-List-Received-Date: Tue, 03 May 2016 14:49:46 -0000

2.0.26 -> 2.0.27

Remove upstreamed patch:
0001-Fix-out-of-source-build.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../acpid/acpid/0001-Fix-out-of-source-build.patch | 46 ----------------------
 meta/recipes-bsp/acpid/acpid_2.0.26.bb             |  9 -----
 meta/recipes-bsp/acpid/acpid_2.0.27.bb             |  7 ++++
 3 files changed, 7 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
 delete mode 100644 meta/recipes-bsp/acpid/acpid_2.0.26.bb
 create mode 100644 meta/recipes-bsp/acpid/acpid_2.0.27.bb

diff --git a/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch b/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
deleted file mode 100644
index d1aa3aa..0000000
--- a/meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5d32b65af750e2007730f3d55a552a186aed81a6 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 20 Jan 2016 14:08:29 +0200
-Subject: [PATCH] Fix out of source build
-
-Since the source directory contains another config.h, the build
-directory should be searched first.
-
-Upstream-Status: Submitted
-[https://sourceforge.net/p/acpid2/tickets/10/]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- sock.c      | 2 +-
- ud_socket.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sock.c b/sock.c
-index 644d460..9e04501 100644
---- a/sock.c
-+++ b/sock.c
-@@ -21,7 +21,7 @@
-  */
- 
- #ifdef HAVE_CONFIG_H
--#include "config.h"
-+#include <config.h>
- #endif
- 
- #include <unistd.h>
-diff --git a/ud_socket.c b/ud_socket.c
-index 1790917..83b2aa9 100644
---- a/ud_socket.c
-+++ b/ud_socket.c
-@@ -4,7 +4,7 @@
-  */
- 
- #ifdef HAVE_CONFIG_H
--#include "config.h"
-+#include <config.h>
- #endif
- 
- #include <stdio.h>
--- 
-2.4.0
-
diff --git a/meta/recipes-bsp/acpid/acpid_2.0.26.bb b/meta/recipes-bsp/acpid/acpid_2.0.26.bb
deleted file mode 100644
index c3bd51f..0000000
--- a/meta/recipes-bsp/acpid/acpid_2.0.26.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require acpid.inc
-
-SRC_URI += "file://0001-Fix-out-of-source-build.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
-
-SRC_URI[md5sum] = "f6d772e35ed907f1cc14ad1a546fd473"
-SRC_URI[sha256sum] = "8384f37e4f260f50183e2e20039823d8f06aed9db56924fe92097b7e0b2e0343"
diff --git a/meta/recipes-bsp/acpid/acpid_2.0.27.bb b/meta/recipes-bsp/acpid/acpid_2.0.27.bb
new file mode 100644
index 0000000..509fcfe
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid_2.0.27.bb
@@ -0,0 +1,7 @@
+require acpid.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
+
+SRC_URI[md5sum] = "e41bdf628e122edb4342fca432ea7db9"
+SRC_URI[sha256sum] = "820c223e53cc11d9d7229fb1ffc2c2205f1054082c80f83f5a4ec4df16d3a616"
-- 
2.4.0


