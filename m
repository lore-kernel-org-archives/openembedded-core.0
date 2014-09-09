Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 78AC760167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 23:15:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Sep 2014 16:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,494,1406617200"; d="scan'208";a="588869293"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.5])
	by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2014 16:15:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 16:15:11 -0700
Message-Id: <1410304511-11778-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] nspr: Upgrade to 4.10.7
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
X-List-Received-Date: Tue, 09 Sep 2014 23:15:57 -0000

Remove patch that was directly modifing the configure script
since we can now use autoreconf to configure.  This also allowed
for the removal of the do_configure() functions.

Added patch to remove an undefined ${srcdir}.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../nspr/nspr/fix-build-on-x86_64.patch            | 31 +++++------
 .../nspr/remove-srcdir-from-configure-in.patch     | 19 +++++++
 .../nspr/nspr/trickly-fix-build-on-x86_64.patch    | 62 ----------------------
 .../nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb}        | 13 ++---
 4 files changed, 38 insertions(+), 87 deletions(-)
 create mode 100644 meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch
 rename meta/recipes-support/nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb} (91%)

diff --git a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch b/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
index a6fa1ea..c2b7258 100644
--- a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
+++ b/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
@@ -11,23 +11,27 @@ Upstream-Status: Pending
  configure.in |   12 ++++++------
  1 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 39c96a3..99a03ac 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1778,24 +1778,24 @@ tools are selected during the Xcode/Developer Tools installation.])
+Index: nspr/configure.in
+===================================================================
+--- nspr.orig/configure.in
++++ nspr/configure.in
+@@ -1875,28 +1875,24 @@ tools are selected during the Xcode/Deve
          PR_MD_ASFILES=os_Linux_ia64.s
          ;;
      x86_64)
 -        if test -n "$USE_64"; then
 -            PR_MD_ASFILES=os_Linux_x86_64.s
--        else
-+        if test -n "$USE_N32"; then
-             AC_DEFINE(i386)
-             PR_MD_ASFILES=os_Linux_x86.s
-             CC="$CC -m32"
-             CXX="$CXX -m32"
-+        else
+-        elif test -n "$USE_X32"; then
++        if test -n "$USE_X32"; then
++            AC_DEFINE(i386)
+             PR_MD_ASFILES=os_Linux_x86_64.s
+             CC="$CC -mx32"
+             CXX="$CXX -mx32"
+         else
+-            AC_DEFINE(i386)
+-            PR_MD_ASFILES=os_Linux_x86.s
+-            CC="$CC -m32"
+-            CXX="$CXX -m32"
 +            PR_MD_ASFILES=os_Linux_x86_64.s
          fi
          ;;
@@ -46,6 +50,3 @@ index 39c96a3..99a03ac 100644
          fi
          ;;
      m68k)
--- 
-1.7.1
-
diff --git a/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch b/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
new file mode 100644
index 0000000..bde715c
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
@@ -0,0 +1,19 @@
+the $srcdir is not defined at the time of gnu-configurize.
+
+Upstream-Status: Inappropriate [OE-Core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: nspr/configure.in
+===================================================================
+--- nspr.orig/configure.in
++++ nspr/configure.in
+@@ -8,7 +8,7 @@ AC_PREREQ(2.61)
+ AC_INIT
+ AC_CONFIG_SRCDIR([pr/include/nspr.h])
+ 
+-AC_CONFIG_AUX_DIR(${srcdir}/build/autoconf)
++AC_CONFIG_AUX_DIR(build/autoconf)
+ AC_CANONICAL_TARGET
+ 
+ dnl ========================================================
diff --git a/meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch b/meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch
deleted file mode 100644
index 8ca51e4..0000000
--- a/meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-trickily fix build failure on x86_64
-
-It seems that we can not run the 'autoreconf -f -i' for the nspr, I met
-several strange problems while trying to do that, and the previous
-author seemed had noticed this, so he wrote:
-
-do_configure() {
-       oe_runconf
-}
-
-to avoid running the "autoreconf". But we must modify configure.in to
-fix the build failure on x86_64, so both modify configure and
-configure.in, once the "autoreconf" can work correctly, we can remove
-this patch.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- configure |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -4366,9 +4366,7 @@ EOF
-         PR_MD_ASFILES=os_Linux_ia64.s
-         ;;
-     x86_64)
--        if test -n "$USE_64"; then
--            PR_MD_ASFILES=os_Linux_x86_64.s
--        else
-+        if test -n "$USE_N32"; then
-             cat >> confdefs.h <<\EOF
- #define i386 1
- EOF
-@@ -4376,17 +4374,19 @@ EOF
-             PR_MD_ASFILES=os_Linux_x86.s
-             CC="$CC -m32"
-             CXX="$CXX -m32"
-+        else
-+            PR_MD_ASFILES=os_Linux_x86_64.s
-         fi
-         ;;
-     ppc|powerpc)
-         PR_MD_ASFILES=os_Linux_ppc.s
-         ;;
-     powerpc64)
--        if test -n "$USE_64"; then
-+        if test -n "$USE_N32"; then
-+            PR_MD_ASFILES=os_Linux_ppc.s
-+        else
-             CC="$CC -m64"
-             CXX="$CXX -m64"
--        else
--            PR_MD_ASFILES=os_Linux_ppc.s
-         fi
-         ;;
-     m68k)
--- 
-1.7.1
-
diff --git a/meta/recipes-support/nspr/nspr_4.10.3.bb b/meta/recipes-support/nspr/nspr_4.10.7.bb
similarity index 91%
rename from meta/recipes-support/nspr/nspr_4.10.3.bb
rename to meta/recipes-support/nspr/nspr_4.10.7.bb
index 60e1bfa..69e9dfa 100644
--- a/meta/recipes-support/nspr/nspr_4.10.3.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.7.bb
@@ -8,14 +8,13 @@ SECTION = "libs/network"
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
-           file://trickly-fix-build-on-x86_64.patch \
-           file://nspr-CVE-2014-1545.patch \
+           file://remove-srcdir-from-configure-in.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
 
-SRC_URI[md5sum] = "bf298e874cf454a3c2f8fe7e671c5d2e"
-SRC_URI[sha256sum] = "f25779b1a665dab0090b9c977dc6c29a63320f442956ed78629b66b405cb01e5"
+SRC_URI[md5sum] = "6e06919e4b56efed501e05d8b45ec10e"
+SRC_URI[sha256sum] = "389af5cfa863ea9bc6de7b30c15f8a4f9bddd8002f8c6fdc8b33caef43893938"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
@@ -141,12 +140,6 @@ TESTS = "runtests.pl \
 
 inherit autotools-brokensep
 
-do_configure() {
-	gnu-configize --force
-	mv config.sub config.guess build/autoconf
-	oe_runconf
-}
-
 do_compile_prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
 }
-- 
1.8.3.2


