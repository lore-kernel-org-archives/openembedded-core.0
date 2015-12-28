Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA260731AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7FE92024257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:14 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:46 -0800
Message-ID: <44adc575be5d9b9ad0d87e143467aeeadde2fe89.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 38/40] gcc: Update default Power GCC settings to use secure-plt
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:13 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

The gcc default, bss-plt, will cause errors when using the prelinker.  All
other distributions that I am aware of are using the the secure-plt.  For an
explanation of the differences, the gcc docs:

  Current PowerPC GCC accepts a `-msecure-plt' option that generates code
  capable of using a newer PLT and GOT layout that has the security
  advantage of no executable section ever needing to be writable and no
  writable section ever being executable. PowerPC ld will generate this
  layout, including stubs to access the PLT, if all input files (including
  startup and static libraries) were compiled with `-msecure-plt'.
  `--bss-plt' forces the old BSS PLT (and GOT layout) which can give
  slightly better performance.

The security of the new PLT and ability to run the prelinker outweigh
any performance penalty.

The secure-plt is enabled by default.  The old bss-plt can be enabled by
selecting 'bssplt' in the DISTRO_FEATURES.

(From OE-Core master rev: 70c55aada1101a5c687cdaa79f370fa4530b39d9)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |    5 +++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
 3 files changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index d63c07f..6f2f224 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -25,6 +25,11 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_gcc_ppc_plt_settings(bb, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc' ] and not bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
+        return "--enable-secureplt"
+    return ""
+
 def get_long_double_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'glibc' ]:
         return "--with-long-double-128"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a14be73..cee6f4a 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -47,6 +47,7 @@ EXTRA_OECONF = "\
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
     ${@get_gcc_mips_plt_setting(bb, d)} \
+    ${@get_gcc_ppc_plt_settings(bb, d)} \
     ${@get_long_double_setting(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 7197447..c0fa139 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -26,6 +26,7 @@ EXTRA_OECONF = "\
     ${EXTRA_OECONF_INITIAL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
     ${EXTRA_OECONF_GCC_FLOAT} \
+    ${@get_gcc_ppc_plt_settings(bb, d)} \
 "
 
 EXTRA_OECONF += "--with-native-system-header-dir=${SYSTEMHEADERS}"
-- 
1.7.9.5


