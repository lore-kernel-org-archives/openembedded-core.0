Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id 587A770CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:06 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j67Jo; Thu, 14 Aug 2014 12:06:08 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:57 -0500
Message-Id: <1408043159-8108-8-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 7/9] gcc: Abstract long double configuration into python function
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:06 -0000

From: Khem Raj <raj.khem@gmail.com>

musl does not support IBM 128 long double for ppc, instead of
doing complex overrides move it into a pythong snippet which
is easier to read and more compact.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           | 5 +++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 4c55542..497d06a 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -25,6 +25,11 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_long_double_setting(bb, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'eglibc' ]:
+        return "--with-long-double-128"
+    return ""
+
 def get_gcc_multiarch_setting(bb, d):
     target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     multiarch_options = {
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 3f9d03f..71dce12 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -47,6 +47,7 @@ EXTRA_OECONF = "\
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
     ${@get_gcc_mips_plt_setting(bb, d)} \
+    ${@get_long_double_setting(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
 
@@ -66,10 +67,6 @@ EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
 
-# powerpc needs this to comply with the ABI
-EXTRA_OECONF_append_powerpc = " --with-long-double-128"
-EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
-
 SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
-- 
1.8.5.5


