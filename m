Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD3B71BE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 19:13:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 02 Dec 2016 11:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,288,1477983600"; d="scan'208";a="908094770"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2016 11:14:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2016 21:14:07 +0200
Message-Id: <20161202191407.9892-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH v2] grub2: enforce -no-pie if supported by compiler
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
X-List-Received-Date: Fri, 02 Dec 2016 19:14:00 -0000

Recent distros are enabling -pie by default; in case of grub
we need to turn it off.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...nforce-no-pie-if-the-compiler-supports-it.patch | 45 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch b/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
new file mode 100644
index 0000000..ccdbee2
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
@@ -0,0 +1,45 @@
+From 6186bcf1bcaaa0f16e79339e07c64c841d4d957d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 2 Dec 2016 20:52:40 +0200
+Subject: [PATCH] Enforce -no-pie, if the compiler supports it.
+
+Add a -no-pie as recent (2 Dec 2016) Debian testing compiler
+seems to default to enabling PIE when linking. See
+https://wiki.ubuntu.com/SecurityTeam/PIE
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ acinclude.m4 | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 19200b0..a713923 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -416,7 +416,7 @@ int main() {
+ 
+ [# `$CC -c -o ...' might not be portable.  But, oh, well...  Is calling
+ # `ac_compile' like this correct, after all?
+-if eval "$ac_compile -S -o conftest.s" 2> /dev/null; then]
++if eval "$ac_compile -S -o conftest.s" 2> /dev/null && eval "$CC -dumpspecs 2>/dev/null | grep -e no-pie" ; then]
+   AC_MSG_RESULT([yes])
+   [# Should we clear up other files as well, having called `AC_LANG_CONFTEST'?
+   rm -f conftest.s
+diff --git a/configure.ac b/configure.ac
+index df20991..506c6b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -603,7 +603,7 @@ grub_CHECK_PIE
+ [# Need that, because some distributions ship compilers that include
+ # `-fPIE' in the default specs.
+ if [ x"$pie_possible" = xyes ]; then
+-  TARGET_CFLAGS="$TARGET_CFLAGS -fno-PIE"
++  TARGET_CFLAGS="$TARGET_CFLAGS -fno-PIE -no-pie"
+ fi]
+ 
+ # Position independent executable.
+-- 
+2.10.2
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b10f633..f64198d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
            file://fix-texinfo.patch \
            file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
+           file://0001-Enforce-no-pie-if-the-compiler-supports-it.patch \
             "
 
 DEPENDS = "flex-native bison-native autogen-native"
-- 
2.10.2


