Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70A7E605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:13:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2MCD2dL005411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 05:13:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 05:13:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Tue, 22 Mar 2016 08:12:33 -0400
Message-ID: <77d9ece3fa34cb37f841bd1d61e5dedb74ec6d57.1458638728.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/16] icu: fix buildpaths QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 12:13:21 -0000
Content-Type: text/plain

- Define new variable U_CC and U_CXX which do not have build path.
  The output of icuinfo will not have build path in it:
  ...
  root@qemux86-64:~# icuinfo
   <icuSystemParams type="icu4c">
      [snip]
      <param name="build.cc">x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
      <param name="build.cxx">x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
      [snip]
   </icuSystemParams>
  ...

- Remove build paths in pkgdata.inc, Makefile.inc and
  icu-config.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../icu/icu/add-variable-U_CC-and-U_CXX.patch      | 61 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_56.1.bb               | 12 +++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

diff --git a/meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch b/meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch
new file mode 100644
index 0000000..826d934
--- /dev/null
+++ b/meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch
@@ -0,0 +1,61 @@
+From 3221b108a18edeff5424bc5c66589eb20148d9b2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 2 Mar 2016 21:18:34 -0500
+Subject: [PATCH] add variable U_CC and U_CXX
+
+Define new variable U_CC and U_CXX which do not have build path.
+The output of icuinfo will not have build path in it:
+...
+root@qemux86-64:~# icuinfo
+ <icuSystemParams type="icu4c">
+    [snip]
+    <param name="build.cc">x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
+    <param name="build.cxx">x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
+    [snip]
+ </icuSystemParams>
+...
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac               | 9 +++++++++
+ tools/toolutil/Makefile.in | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 595bd12..ec05c19 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -673,6 +673,15 @@ AC_SUBST(GENCCODE_ASSEMBLY)
+ 
+ AC_MSG_RESULT($GENCCODE_ASSEMBLY)
+ 
++# U_CC and U_CXX are used for icuinfo which remove
++# --sysroot for cross-compilation
++U_CC=${U_CC}
++AC_SUBST(U_CC)
++AC_MSG_RESULT(U_CC)
++U_CXX=${U_CXX}
++AC_SUBST(U_CXX)
++AC_MSG_RESULT(U_CXX)
++
+ # Checks for header files
+ AC_CHECK_HEADERS(inttypes.h)
+ if test $ac_cv_header_inttypes_h = no; then
+diff --git a/tools/toolutil/Makefile.in b/tools/toolutil/Makefile.in
+index 1fb42ed..a083522 100644
+--- a/tools/toolutil/Makefile.in
++++ b/tools/toolutil/Makefile.in
+@@ -46,7 +46,7 @@ CXXFLAGS += $(LIBCXXFLAGS)
+ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n $(LIBCPPFLAGS)
+ 
+ # from icuinfo
+-CPPFLAGS+=  "-DU_BUILD=\"@build@\"" "-DU_HOST=\"@host@\"" "-DU_CC=\"@CC@\"" "-DU_CXX=\"@CXX@\""
++CPPFLAGS+=  "-DU_BUILD=\"@build@\"" "-DU_HOST=\"@host@\"" "-DU_CC=\"@U_CC@\"" "-DU_CXX=\"@U_CXX@\""
+ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit
+ 
+ DEFS += -DU_TOOLUTIL_IMPLEMENTATION
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/icu/icu_56.1.bb b/meta/recipes-support/icu/icu_56.1.bb
index db0de10..1fd4dfc 100644
--- a/meta/recipes-support/icu/icu_56.1.bb
+++ b/meta/recipes-support/icu/icu_56.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://icu-release-56-1-flagparser-fix.patch \
+           file://add-variable-U_CC-and-U_CXX.patch \
           "
 
 SRC_URI_append_class-target = "\
@@ -27,3 +28,14 @@ SRC_URI[sha256sum] = "3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
+
+inherit fix_buildpaths
+CACHED_CONFIGUREVARS += "U_CC="${@remove_buildpath_variable(d, 'CC')}" \
+                         U_CXX="${@remove_buildpath_variable(d, 'CXX')}" \
+"
+PACKAGE_BUILDPATH_TEXT_FILES_${PN}-dev ?= " \
+    ${libdir}/${BPN}/${PV}/pkgdata.inc \
+    ${libdir}/${BPN}/${PV}/Makefile.inc \
+    ${bindir}/icu-config \
+"
+
-- 
1.9.1


