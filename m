Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C60276FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:44:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 05:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="960442761"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 05:44:12 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 15:44:05 +0300
Message-Id: <fa00254f4b3f882acadd1b83505a05c0d5815c10.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
References: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464004128.git.jussi.kukkonen@intel.com>
References: <cover.1464004128.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/5] dropbear: Upgrade 2015.71 -> 2016.73
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
X-List-Received-Date: Mon, 23 May 2016 12:44:14 -0000

Backport a patch to fix out-of-tree build.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../dropbear/support-out-of-tree-builds.patch      | 43 ++++++++++++++++++++++
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |  5 ---
 meta/recipes-core/dropbear/dropbear_2016.73.bb     |  7 ++++
 3 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.73.bb

diff --git a/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch b/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
new file mode 100644
index 0000000..df6efb4
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
@@ -0,0 +1,43 @@
+From: =?UTF-8?q?Henrik=20Nordstr=C3=B6m?= <henrik@knc.nu>
+Date: Wed, 11 May 2016 12:35:06 +0200
+Subject: [PATCH] Support out-of-tree builds usign bundled libtom
+
+When building out-of-tree we need both source and generated
+folders in include paths to find both distributed and generated
+headers.
+
+
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport
+---
+ libtomcrypt/Makefile.in | 2 +-
+ libtommath/Makefile.in  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libtomcrypt/Makefile.in b/libtomcrypt/Makefile.in
+index 3056ef0..7970700 100644
+--- a/libtomcrypt/Makefile.in
++++ b/libtomcrypt/Makefile.in
+@@ -19,7 +19,7 @@ srcdir=@srcdir@
+ 
+ # Compilation flags. Note the += does not write over the user's CFLAGS!
+ # The rest of the flags come from the parent Dropbear makefile
+-CFLAGS += -c -I$(srcdir)/src/headers/ -I$(srcdir)/../ -DLTC_SOURCE -I$(srcdir)/../libtommath/
++CFLAGS += -c -Isrc/headers/ -I$(srcdir)/src/headers/ -I../ -I$(srcdir)/../ -DLTC_SOURCE -I../libtommath/ -I$(srcdir)/../libtommath/
+ 
+ # additional warnings (newer GCC 3.4 and higher)
+ ifdef GCC_34
+diff --git a/libtommath/Makefile.in b/libtommath/Makefile.in
+index 06aba68..019c50b 100644
+--- a/libtommath/Makefile.in
++++ b/libtommath/Makefile.in
+@@ -9,7 +9,7 @@ VPATH=@srcdir@
+ srcdir=@srcdir@
+ 
+ # So that libtommath can include Dropbear headers for options and m_burn()
+-CFLAGS += -I$(srcdir)/../libtomcrypt/src/headers/ -I$(srcdir)/../
++CFLAGS += -I. -I$(srcdir) -I../libtomcrypt/src/headers/ -I$(srcdir)/../libtomcrypt/src/headers/ -I../ -I$(srcdir)/../
+ 
+ ifndef IGNORE_SPEED
+ 
diff --git a/meta/recipes-core/dropbear/dropbear_2015.71.bb b/meta/recipes-core/dropbear/dropbear_2015.71.bb
deleted file mode 100644
index 6332579..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.71.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
-SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2016.73.bb b/meta/recipes-core/dropbear/dropbear_2016.73.bb
new file mode 100644
index 0000000..71a36bd
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2016.73.bb
@@ -0,0 +1,7 @@
+require dropbear.inc
+
+SRC_URI += "file://support-out-of-tree-builds.patch"
+
+SRC_URI[md5sum] = "8d6d78ce60ca52350ec04fcbd711ce9b"
+SRC_URI[sha256sum] = "5c61a4f69b093b688629cd365be38701485ff63cfb23642dab7a05ad250aefd7"
+
-- 
2.1.4


