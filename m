Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7596E648
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:43:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Jul 2015 03:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="758988069"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.21.252])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 03:43:21 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:43:13 +0300
Message-Id: <95ffeac6a06e92a7e530ae6c903626535185ac60.1436438063.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 1/3] speexdsp: initial recipe
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
X-List-Received-Date: Thu, 09 Jul 2015 10:43:23 -0000

speexdsp was split off from speex in 1.2rc2, so we need a separate
recipe for speexdsp when before we can upgrade speex.

The speex recipe has so far used the --enable-fixed-point configure
option unconditionally, but I believe that was a mistake, so I
dropped that. The option is still enabled if TARGET_FPU is set to
"soft". Commit e8f707f16a38d85535593a32efff6dcbf4ddb203 added the
TARGET_FPU check, and I think that commit should have removed
--enable-fixed-point from the static configure options, like it
removed --disable-float-api.

The NEON code caused a build failure on qemuarm64. As a workaround,
I disabled NEON optimizations when building for aarch64.

I added a patch that fixes a build failure in alsa-plugins. Compiling
alsa-plugins against the new speexdsp version without the patch
resulted in this error:

In file included from .../usr/include/speex/speexdsp_types.h:122:0,
                 from .../usr/include/speex/speex_preprocess.h:46,
                 from .../alsa-plugins-1.0.29/speex/pcm_speex.c:23:

.../usr/include/speex/speexdsp_config_types.h:13:9: error: unknown type name 'uint16_t'
 typedef uint16_t spx_uint16_t;
         ^

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 ...ely-on-HAVE_STDINT_H-et-al.-being-defined.patch | 63 ++++++++++++++++++++++
 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb   | 39 ++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
 create mode 100644 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb

diff --git a/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch b/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
new file mode 100644
index 0000000..c7067da
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
@@ -0,0 +1,63 @@
+From c73370ceafd138becee8ca3c688ba75756830bfe Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+Date: Sun, 5 Jul 2015 17:48:16 +0300
+Subject: [PATCH] Don't rely on HAVE_STDINT_H et al. being defined
+
+Not everyone who includes speexdsp_config_types.h will have a test
+which defines those, and if we've chosen to use the stdint types at
+configure time then we know exactly which header(s) are available, so
+just choose the best one then and generate the header to use it.
+
+This patch, including the above text, is copied from a commit in the
+speex repository[1]. The original commit for speex was made by Ron
+<ron@debian.org>.
+
+[1] https://git.xiph.org/?p=speex.git;a=commitdiff;h=774c87d6cb7dd8dabdd17677fc6da753ecf4aa87
+
+Upstream-Status: Backport
+
+Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+---
+ configure.ac                             | 6 ++++++
+ include/speex/speexdsp_config_types.h.in | 8 +-------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2cd2d1e..1de0c23 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -334,6 +334,12 @@ AC_SUBST([USIZE16])
+ AC_SUBST([SIZE32])
+ AC_SUBST([USIZE32])
+ 
++AS_IF([test "$ac_cv_header_stdint_h" = "yes"],    [INCLUDE_STDINT="#include <stdint.h>"],
++      [test "$ac_cv_header_inttypes_h" = "yes"],  [INCLUDE_STDINT="#include <inttypes.h>"],
++      [test "$ac_cv_header_sys_types_h" = "yes"], [INCLUDE_STDINT="#include <sys/types.h>"])
++
++AC_SUBST([INCLUDE_STDINT])
++
+ AC_CONFIG_FILES([
+            Makefile libspeexdsp/Makefile doc/Makefile SpeexDSP.spec
+            include/Makefile include/speex/Makefile speexdsp.pc
+diff --git a/include/speex/speexdsp_config_types.h.in b/include/speex/speexdsp_config_types.h.in
+index 02b82fd..5ea7b55 100644
+--- a/include/speex/speexdsp_config_types.h.in
++++ b/include/speex/speexdsp_config_types.h.in
+@@ -1,13 +1,7 @@
+ #ifndef __SPEEX_TYPES_H__
+ #define __SPEEX_TYPES_H__
+ 
+-#if defined HAVE_STDINT_H
+-#  include <stdint.h>
+-#elif defined HAVE_INTTYPES_H
+-#  include <inttypes.h>
+-#elif defined HAVE_SYS_TYPES_H
+-#  include <sys/types.h>
+-#endif
++@INCLUDE_STDINT@
+ 
+ typedef @SIZE16@ spx_int16_t;
+ typedef @USIZE16@ spx_uint16_t;
+-- 
+1.9.3
+
diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb b/meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb
new file mode 100644
index 0000000..6b1aced
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A patent-free DSP library"
+DESCRIPTION = "SpeexDSP is a patent-free, Open Source/Free Software DSP library."
+HOMEPAGE = "http://www.speex.org"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8"
+
+SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz \
+           file://0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch"
+
+SRC_URI[md5sum] = "70d9d31184f7eb761192fd1ef0b73333"
+SRC_URI[sha256sum] = "4ae688600039f5d224bdf2e222d2fbde65608447e4c2f681585e4dca6df692f1"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "\
+        --disable-examples \
+        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api', '', d)} \
+"
+
+# Workaround for a build failure when building with MACHINE=qemuarm64. I think
+# aarch64 is supposed to support NEON just fine, but building for qemuarm64
+# fails in NEON code:
+#
+# .../speexdsp-1.2rc3/libspeexdsp/resample_neon.h:148:5: error: impossible constraint in 'asm'
+#      asm volatile ("  cmp %[len], #0\n"
+#      ^
+#
+# I sent an email about the issue to speex-dev. At the time of writing there
+# are no responses yet:
+# http://thread.gmane.org/gmane.comp.audio.compression.speex.devel/7360
+EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '--disable-neon', '', d)}"
+
+# speexdsp was split off from speex in 1.2rc2. Older versions of speex can't
+# be installed together with speexdsp, since they contain overlapping files.
+RCONFLICTS_${PN} = "speex (< 1.2rc2)"
+RCONFLICTS_${PN}-dbg = "speex-dbg (< 1.2rc2)"
+RCONFLICTS_${PN}-dev = "speex-dev (< 1.2rc2)"
+RCONFLICTS_${PN}-staticdev = "speex-staticdev (< 1.2rc2)"
-- 
1.9.3


