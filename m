Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.2187.1610070065377930431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 17:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103292111"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 09:40:43 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 498E94CE602D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 09:40:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 09:40:38 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] tcl: upgrade 8.6.10 -> 8.6.11
Date: Fri, 8 Jan 2021 09:40:33 +0800
Message-ID: <1610070033-6695-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 498E94CE602D.A1EEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
removed since it is included in 8.6.11

refresh alter-includedir.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ailed-to-build-tk-8.6.10-with-cross-.patch | 44 -------------------
 .../tcltk/tcl/alter-includedir.patch          | 29 ++++++------
 .../tcltk/{tcl_8.6.10.bb => tcl_8.6.11.bb}    |  5 +--
 3 files changed, 17 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.10.bb => tcl_8.6.11.bb} (93%)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch b/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
deleted file mode 100644
index 3cd34155ee..0000000000
--- a/meta/recipes-devtools/tcltk/tcl/0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f7fa48c4c75a1e748dc5071e709c0b62ff739eaa Mon Sep 17 00:00:00 2001
-From: "jan.nijtmans" <nijtmans@users.sourceforge.net>
-Date: Mon, 9 Dec 2019 10:02:20 +0000
-Subject: [PATCH] Fix [abd4abedd2]: Failed to build tk 8.6.10 with cross
- compile
-
-Upstream-Status: Backport
-[https://github.com/tcltk/tcl/commit/f7fa48c4c75a1e748dc5071e709c0b62ff739eaa]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- compat/strtol.c  | 2 +-
- compat/strtoul.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/compat/strtol.c b/compat/strtol.c
-index b7f69196c..811006a64 100644
---- a/compat/strtol.c
-+++ b/compat/strtol.c
-@@ -53,7 +53,7 @@ strtol(
-      */
- 
-     p = string;
--    while (TclIsSpaceProc(*p)) {
-+    while (isspace(UCHAR(*p))) {
- 	p += 1;
-     }
- 
-diff --git a/compat/strtoul.c b/compat/strtoul.c
-index e37eb05f8..15587f1da 100644
---- a/compat/strtoul.c
-+++ b/compat/strtoul.c
-@@ -74,7 +74,7 @@ strtoul(
-      */
- 
-     p = string;
--    while (TclIsSpaceProc(*p)) {
-+    while (isspace(UCHAR(*p))) {
- 	p += 1;
-     }
-     if (*p == '-') {
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index 86632d9144..66c395d401 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -1,4 +1,4 @@
-Lets install the include header and private header files into 
+Lets install the include header and private header files into
 usr/include/tcl8.6 when version of tcl is 8.6.x
 
 Upstream-Status: Inappropriate [Configuration Specific]
@@ -9,18 +9,19 @@ Fixed the TCL_INCLUDE_SPEC
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
- Makefile.in  |    2 +-
- configure    |    4 ++--
- configure.in |    4 ++--
+ Makefile.in  | 2 +-
+ configure    | 4 ++--
+ configure.in | 4 ++--
  3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 97b983b..dc2a4df 100644
+index 0370491..daa569a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -53,7 +53,7 @@ DLL_INSTALL_DIR		= @DLL_INSTALL_DIR@
- SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
+@@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
+ MODULE_INSTALL_DIR	= $(SCRIPT_INSTALL_DIR)/../tcl8
  
  # Directory in which to install the include file tcl.h:
 -INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)
@@ -29,10 +30,10 @@ index 97b983b..dc2a4df 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/configure b/configure
-index 3e78b49..24b3f92 100755
+index 181b9b3..f4cc225 100755
 --- a/configure
 +++ b/configure
-@@ -19134,7 +19134,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -10166,7 +10166,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -41,7 +42,7 @@ index 3e78b49..24b3f92 100755
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -19293,7 +19293,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -10323,7 +10323,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
@@ -51,10 +52,10 @@ index 3e78b49..24b3f92 100755
  #------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
 diff --git a/configure.in b/configure.in
-index 0e28b14..62d9b41 100755
+index 9f96e2b..e323e02 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -791,7 +791,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -773,7 +773,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -63,7 +64,7 @@ index 0e28b14..62d9b41 100755
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -912,7 +912,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -894,7 +894,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
@@ -73,5 +74,5 @@ index 0e28b14..62d9b41 100755
  #------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
 -- 
-1.7.10.4
+2.25.1
 
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
similarity index 93%
rename from meta/recipes-devtools/tcltk/tcl_8.6.10.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index e6feb25a7e..717200a6f0 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -22,11 +22,10 @@ SRC_URI = "${BASE_SRC_URI} \
            file://no_packages.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
-           file://0001-Fix-abd4abedd2-Failed-to-build-tk-8.6.10-with-cross-.patch;patchdir=.. \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "97c55573f8520bcab74e21bfd8d0aadc"
-SRC_URI[sha256sum] = "5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed"
+SRC_URI[md5sum] = "8a4c004f48984a03a7747e9ba06e4da4"
+SRC_URI[sha256sum] = "8c0486668586672c5693d7d95817cb05a18c5ecca2f40e2836b9578064088258"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.25.1



