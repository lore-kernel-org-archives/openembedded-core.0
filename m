Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 24BFA74806
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612788"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:57 +0800
Message-Id: <20180503081758.4661-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 11/12] gstreamer-libav: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:17 -0000

Drop one patch as the change is now present upstream. For changes,
please see: https://gstreamer.freedesktop.org/releases/1.14/

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-fix-host-contamination.patch              | 36 ++++++++++++++++++++++
 ...a.c-Fix-build-by-Including-libavcodec-hev.patch | 33 --------------------
 .../gstreamer/gstreamer1.0-libav_1.12.4.bb         | 21 -------------
 ...r1.0-libav.inc => gstreamer1.0-libav_1.14.0.bb} | 19 ++++++++++++
 4 files changed, 55 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav.inc => gstreamer1.0-libav_1.14.0.bb} (60%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
new file mode 100644
index 0000000000..120c0798ea
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
@@ -0,0 +1,36 @@
+From c1700f867f876ee33c130a8e28b688e2b1d89663 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Wed, 11 Apr 2018 17:14:55 +0800
+Subject: [PATCH] Prevent host contamination
+
+Remove reference to host $(libdir) from .la files.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gst-libs/ext/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/ext/Makefile.am b/gst-libs/ext/Makefile.am
+index 6cdc048..a19d255 100644
+--- a/gst-libs/ext/Makefile.am
++++ b/gst-libs/ext/Makefile.am
+@@ -49,7 +49,7 @@ echo "  GEN      $1.la" && \
+  echo "library_names=''" && \
+  echo "old_library='$1.a'" && \
+  echo "inherited_linker_flags=''" && \
+- echo "dependency_libs=' -L$(libdir) $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
++ echo "dependency_libs=' -L $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
+  echo "weak_library_names=''" &&  \
+  echo "current=" && \
+  echo "age=" && \
+@@ -58,7 +58,7 @@ echo "  GEN      $1.la" && \
+  echo "shouldnotlink=no" && \
+  echo "dlopen=''" && \
+  echo "dlpreopen=''" && \
+- echo "libdir='$(libdir)'") > $1.la
++ echo "libdir=''") > $1.la
+ endef
+ 
+ libavutil.la:
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
deleted file mode 100644
index afbfc84db5..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b5226c096a0b7049874858e94a59d43e10ba3fd2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 Sep 2017 10:22:56 -0700
-Subject: [PATCH] hevcpred_msa.c: Fix build by Including libavcodec/hevcdec.h
-
-src/libavcodec/mips/hevcpred_msa.c:1913:32: error: unknown type name 'HEVCContext'; did you mean 'HEVCPredContext'?
- void ff_intra_pred_8_16x16_msa(HEVCContext *s, int x0, int y0, int c_idx)
-                                ^~~~~~~~~~~
-                                HEVCPredContext
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c b/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
-index 6a3b281..963c64c 100644
---- a/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
-+++ b/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
-@@ -18,7 +18,7 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
--#include "libavcodec/hevc.h"
-+#include "libavcodec/hevcdec.h"
- #include "libavutil/mips/generic_macros_msa.h"
- #include "hevcpred_mips.h"
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
deleted file mode 100644
index af547ba602..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require gstreamer1.0-libav.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-           file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
-           file://mips64_cpu_detection.patch \
-           file://0001-configure-check-for-armv7ve-variant.patch \
-           file://0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch \
-           "
-SRC_URI[md5sum] = "8a851bf2e475e90a3fdac9506e3e4dbd"
-SRC_URI[sha256sum] = "2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62"
-
-S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
similarity index 60%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
index c2283061cc..ee2a043f81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
@@ -4,6 +4,25 @@ SECTION = "multimedia"
 
 LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+           file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+           file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
+           file://mips64_cpu_detection.patch \
+           file://0001-configure-check-for-armv7ve-variant.patch \
+           file://0001-fix-host-contamination.patch \
+           "
+SRC_URI[md5sum] = "943045b9e937ffc5c6cfa0bd5c44230d"
+SRC_URI[sha256sum] = "fb134b4d3e054746ef8b922ff157b0c7903d1fdd910708a45add66954da7ef89"
+
+S = "${WORKDIR}/gst-libav-${PV}"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
-- 
2.14.1


