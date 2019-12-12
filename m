Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A70CA7F688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 05:55:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBC5tZWN018948
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 21:55:35 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 11 Dec 2019 21:55:34 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Dec 2019 13:55:32 +0800
Message-ID: <20191212055532.15720-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] tcl: upgrade 8.6.9 -> 8.6.10
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
X-List-Received-Date: Thu, 12 Dec 2019 05:55:34 -0000
Content-Type: text/plain

Refresh patches:
  alter-includedir.patch
  tcl-remove-hardcoded-install-path.patch

Backport a patch to fix tk build failure with cross compile:
  0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
See:
https://core.tcl-lang.org/tk/tktview/abd4abedd2f01c12839f0ad94564ae31137f7af5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ailed-to-build-tk-8.6.10-with-cross-.patch | 44 +++++++++++++++++++
 .../tcltk/tcl/alter-includedir.patch          |  5 ++-
 .../tcl-remove-hardcoded-install-path.patch   | 15 ++++---
 .../tcltk/{tcl_8.6.9.bb => tcl_8.6.10.bb}     |  5 ++-
 4 files changed, 58 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.9.bb => tcl_8.6.10.bb} (93%)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch b/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
new file mode 100644
index 0000000000..3cd34155ee
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
@@ -0,0 +1,44 @@
+From f7fa48c4c75a1e748dc5071e709c0b62ff739eaa Mon Sep 17 00:00:00 2001
+From: "jan.nijtmans" <nijtmans@users.sourceforge.net>
+Date: Mon, 9 Dec 2019 10:02:20 +0000
+Subject: [PATCH] Fix [abd4abedd2]: Failed to build tk 8.6.10 with cross
+ compile
+
+Upstream-Status: Backport
+[https://github.com/tcltk/tcl/commit/f7fa48c4c75a1e748dc5071e709c0b62ff739eaa]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ compat/strtol.c  | 2 +-
+ compat/strtoul.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/compat/strtol.c b/compat/strtol.c
+index b7f69196c..811006a64 100644
+--- a/compat/strtol.c
++++ b/compat/strtol.c
+@@ -53,7 +53,7 @@ strtol(
+      */
+ 
+     p = string;
+-    while (TclIsSpaceProc(*p)) {
++    while (isspace(UCHAR(*p))) {
+ 	p += 1;
+     }
+ 
+diff --git a/compat/strtoul.c b/compat/strtoul.c
+index e37eb05f8..15587f1da 100644
+--- a/compat/strtoul.c
++++ b/compat/strtoul.c
+@@ -74,7 +74,7 @@ strtoul(
+      */
+ 
+     p = string;
+-    while (TclIsSpaceProc(*p)) {
++    while (isspace(UCHAR(*p))) {
+ 	p += 1;
+     }
+     if (*p == '-') {
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index c8530e1f58..86632d9144 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -8,6 +8,7 @@ Signed-off-by: Khem Raj <raj.khem@gmai.com>
 Fixed the TCL_INCLUDE_SPEC
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  Makefile.in  |    2 +-
  configure    |    4 ++--
@@ -34,7 +35,7 @@ index 3e78b49..24b3f92 100755
 @@ -19134,7 +19134,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
- TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+ test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
 -PRIVATE_INCLUDE_DIR='$(includedir)'
 +PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
  HTML_DIR='$(DISTDIR)/html'
@@ -56,7 +57,7 @@ index 0e28b14..62d9b41 100755
 @@ -791,7 +791,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
- TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+ test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
 -PRIVATE_INCLUDE_DIR='$(includedir)'
 +PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
  HTML_DIR='$(DISTDIR)/html'
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
index 16f7c80516..17d251d554 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
@@ -14,10 +14,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure    | 2 +-
+ configure.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 Index: unix/configure
 ===================================================================
@@ -27,8 +28,8 @@ Index: unix/configure
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
--TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
-+TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+-test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
++test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
  PRIVATE_INCLUDE_DIR='$(includedir)'
  HTML_DIR='$(DISTDIR)/html'
  
@@ -40,8 +41,8 @@ Index: unix/configure.in
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
--TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
-+TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+-test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
++test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
  PRIVATE_INCLUDE_DIR='$(includedir)'
  HTML_DIR='$(DISTDIR)/html'
  
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.9.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
similarity index 93%
rename from meta/recipes-devtools/tcltk/tcl_8.6.9.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index 7f3778153a..284f20e27a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -22,10 +22,11 @@ SRC_URI = "${BASE_SRC_URI} \
            file://no_packages.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
+           file://0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch;patchdir=.. \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "aa0a121d95a0e7b73a036f26028538d4"
-SRC_URI[sha256sum] = "ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e"
+SRC_URI[md5sum] = "97c55573f8520bcab74e21bfd8d0aadc"
+SRC_URI[sha256sum] = "5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.17.1


