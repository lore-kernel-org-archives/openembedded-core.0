Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1C6C72320
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 23:18:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Dec 2014 15:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,518,1413270000"; d="scan'208";a="618869983"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.148])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2014 15:18:19 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 17:18:15 -0600
Message-Id: <58b850958a6efc52c1c73f106b25f4f0d4e319c1.1417734782.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 23:18:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable man pages creation because it needs to download docbook.xsl from
upstream site and sometimes can't (resource unavailable) and this cause
build fails.

Remove GNU_SOURCE_definition patch it's already integrated in upstream.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc               |  1 +
 .../drm/libdrm/GNU_SOURCE_definition.patch         | 30 ----------------------
 meta/recipes-graphics/drm/libdrm_2.4.54.bb         |  8 ------
 meta/recipes-graphics/drm/libdrm_2.4.58.bb         |  7 +++++
 4 files changed, 8 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.54.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.58.bb

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 5ec6307..cfac9e2 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -23,6 +23,7 @@ EXTRA_OECONF += "--disable-cairo-tests \
                  --enable-omap-experimental-api \
                  --enable-freedreno-experimental-api \
                  --enable-install-test-programs \
+                 --disable-manpages \
                 "
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
diff --git a/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch b/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
deleted file mode 100644
index 8eb1d5e..0000000
--- a/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-uclibc headers need to know if _GNU_SOURCE is defined or not and its defined
-in config.h so include it first to get the definition if its there fixed build
-problems on uclibc
-
-test_decode.c:107:2: error: implicit declaration of function 'open_memstream' [-Werror=implicit-function-declaration]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: libdrm-2.4.30/intel/test_decode.c
-===================================================================
---- libdrm-2.4.30.orig/intel/test_decode.c	2012-02-03 14:28:46.409355918 -0800
-+++ libdrm-2.4.30/intel/test_decode.c	2012-02-03 14:29:02.357356689 -0800
-@@ -21,6 +21,8 @@
-  * IN THE SOFTWARE.
-  */
- 
-+#include "config.h"
-+
- #include <string.h>
- #include <stdlib.h>
- #include <stdio.h>
-@@ -31,7 +33,6 @@
- #include <sys/mman.h>
- #include <err.h>
- 
--#include "config.h"
- #include "intel_bufmgr.h"
- #include "intel_chipset.h"
- 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.54.bb b/meta/recipes-graphics/drm/libdrm_2.4.54.bb
deleted file mode 100644
index 12eefc7..0000000
--- a/meta/recipes-graphics/drm/libdrm_2.4.54.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libdrm.inc
-
-SRC_URI += "file://installtests.patch \
-            file://GNU_SOURCE_definition.patch \
-           "
-SRC_URI[md5sum] = "56e98a9c2073c3fab7f95e003b657f46"
-SRC_URI[sha256sum] = "d94001ebfbe80e1523d1228ee2df57294698d1c734fad9ccf53efde8932fe4e9"
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.58.bb b/meta/recipes-graphics/drm/libdrm_2.4.58.bb
new file mode 100644
index 0000000..e199935
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm_2.4.58.bb
@@ -0,0 +1,7 @@
+require libdrm.inc
+
+SRC_URI += "file://installtests.patch"
+
+SRC_URI[md5sum] = "24213913333d72b36c16463ed92e522a"
+SRC_URI[sha256sum] = "b155fae6b9c9a3b02ef8b77f58c7c219194c996a4018dc55ba66c03996a365dd"
+
-- 
1.9.1


