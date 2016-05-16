Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BEF10731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:23:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873529"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:23:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:46 +0300
Message-Id: <8dbac16927dd17cc07d0958c6364f04bd1b8aa65.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/13] expat: Upgrade 2.1.0 -> 2.1.1
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
X-List-Received-Date: Mon, 16 May 2016 13:23:02 -0000

* Remove backported CVE patch
* Update autotools patch
* Update SRC_URI to match current archive type

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../expat/expat-2.1.0/expat-CVE-2015-1283.patch    | 62 ----------------------
 meta/recipes-core/expat/expat.inc                  |  3 +-
 .../expat/{expat-2.1.0 => expat}/autotools.patch   |  4 +-
 meta/recipes-core/expat/expat_2.1.0.bb             |  5 --
 meta/recipes-core/expat/expat_2.1.1.bb             |  5 ++
 5 files changed, 8 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
 rename meta/recipes-core/expat/{expat-2.1.0 => expat}/autotools.patch (79%)
 delete mode 100644 meta/recipes-core/expat/expat_2.1.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.1.1.bb

diff --git a/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch b/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
deleted file mode 100644
index 1d0acb6..0000000
--- a/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Multiple integer overflows in the XML_GetBuffer function in Expat 
-through 2.1.0, allow remote attackers to cause a denial of service 
-(heap-based buffer overflow) or possibly have unspecified other 
-impact via crafted XML data.
-
-CVSSv2:  (AV:N/AC:M/Au:N/C:P/I:P/A:P)
-
-CVE: CVE-2015-1283
-Upstream-Status: Backport
-
-Signed-off-by: Eric Rahm <erahm@mozilla.com>
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windirver.com>
-
-Index: expat-2.1.0/lib/xmlparse.c
-===================================================================
---- expat-2.1.0.orig/lib/xmlparse.c	2012-03-11 13:13:12.000000000 +0800
-+++ expat-2.1.0/lib/xmlparse.c	2015-12-23 10:29:07.347361329 +0800
-@@ -1678,6 +1678,12 @@
- void * XMLCALL
- XML_GetBuffer(XML_Parser parser, int len)
- {
-+/* BEGIN MOZILLA CHANGE (sanity check len) */
-+  if (len < 0) {
-+    errorCode = XML_ERROR_NO_MEMORY;
-+    return NULL;
-+  }
-+/* END MOZILLA CHANGE */
-   switch (ps_parsing) {
-   case XML_SUSPENDED:
-     errorCode = XML_ERROR_SUSPENDED;
-@@ -1689,8 +1695,13 @@
-   }
- 
-   if (len > bufferLim - bufferEnd) {
--    /* FIXME avoid integer overflow */
-     int neededSize = len + (int)(bufferEnd - bufferPtr);
-+/* BEGIN MOZILLA CHANGE (sanity check neededSize) */
-+    if (neededSize < 0) {
-+      errorCode = XML_ERROR_NO_MEMORY;
-+      return NULL;
-+    }
-+/* END MOZILLA CHANGE */
- #ifdef XML_CONTEXT_BYTES
-     int keep = (int)(bufferPtr - buffer);
- 
-@@ -1719,7 +1730,15 @@
-         bufferSize = INIT_BUFFER_SIZE;
-       do {
-         bufferSize *= 2;
--      } while (bufferSize < neededSize);
-+/* BEGIN MOZILLA CHANGE (prevent infinite loop on overflow) */
-+      } while (bufferSize < neededSize && bufferSize > 0);
-+/* END MOZILLA CHANGE */
-+/* BEGIN MOZILLA CHANGE (sanity check bufferSize) */
-+      if (bufferSize <= 0) {
-+        errorCode = XML_ERROR_NO_MEMORY;
-+        return NULL;
-+      }
-+/* END MOZILLA CHANGE */
-       newBuf = (char *)MALLOC(bufferSize);
-       if (newBuf == 0) {
-         errorCode = XML_ERROR_NO_MEMORY;
diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 4bd60a2..fe9d7e7 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -4,9 +4,8 @@ HOMEPAGE = "http://expat.sourceforge.net/"
 SECTION = "libs"
 LICENSE = "MIT"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
-           file://expat-CVE-2015-1283.patch \
 	  "
 
 inherit autotools lib_package gzipnative
diff --git a/meta/recipes-core/expat/expat-2.1.0/autotools.patch b/meta/recipes-core/expat/expat/autotools.patch
similarity index 79%
rename from meta/recipes-core/expat/expat-2.1.0/autotools.patch
rename to meta/recipes-core/expat/expat/autotools.patch
index 0e59969..3d3c5ba 100644
--- a/meta/recipes-core/expat/expat-2.1.0/autotools.patch
+++ b/meta/recipes-core/expat/expat/autotools.patch
@@ -11,8 +11,8 @@ Updated to apply over expat 2.1.0
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 
 diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
---- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
-+++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
+--- expat-2.1.0/configure.ac	2012-03-04 01:45:53.000000000 +0200
++++ expat-2.1.0/configure.ac	2012-05-10 21:04:44.000000000 +0300
 @@ -51,8 +51,6 @@
  
  AC_CONFIG_HEADER(expat_config.h)
diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
deleted file mode 100644
index b958742..0000000
--- a/meta/recipes-core/expat/expat_2.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
-
-SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
-SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"
diff --git a/meta/recipes-core/expat/expat_2.1.1.bb b/meta/recipes-core/expat/expat_2.1.1.bb
new file mode 100644
index 0000000..75c80de
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.1.1.bb
@@ -0,0 +1,5 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
+
+SRC_URI[md5sum] = "7380a64a8e3a9d66a9887b01d0d7ea81"
+SRC_URI[sha256sum] = "aff584e5a2f759dcfc6d48671e9529f6afe1e30b0cd6a4cec200cbe3f793de67"
-- 
2.1.4


