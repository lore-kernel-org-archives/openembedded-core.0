Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04A2C72EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:41:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P6g1iF011069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 23:42:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 23:42:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 14:13:02 +0800
Message-ID: <24572dfcbe233c6e5680cd200bea0261d88fd3e9.1524636386.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524636386.git.kai.kang@windriver.com>
References: <cover.1524636386.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] gstreamer1.0-libav: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 06:42:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0-libav from 1.12.4 to 1.14.0.

* remove 0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
  which has been fixed by upstream
* add patch to fix host contamination

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...a.c-Fix-build-by-Including-libavcodec-hev.patch | 33 ----------------------
 .../remove-host-contamination.patch                | 22 +++++++++++++++
 ...ibav_1.12.4.bb => gstreamer1.0-libav_1.14.0.bb} |  6 ++--
 3 files changed, 25 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/remove-host-contamination.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.4.bb => gstreamer1.0-libav_1.14.0.bb} (82%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/remove-host-contamination.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/remove-host-contamination.patch
new file mode 100644
index 0000000000..a1f34f05b6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/remove-host-contamination.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [cross build specific]
+
+Remove '-L$(libdir)' to avoid host contamination.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst-libs/ext/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/ext/Makefile.am b/gst-libs/ext/Makefile.am
+index 6cdc048..f45e71f 100644
+--- a/gst-libs/ext/Makefile.am
++++ b/gst-libs/ext/Makefile.am
+@@ -49,7 +49,7 @@ echo "  GEN      $1.la" && \
+  echo "library_names=''" && \
+  echo "old_library='$1.a'" && \
+  echo "inherited_linker_flags=''" && \
+- echo "dependency_libs=' -L$(libdir) $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
++ echo "dependency_libs=' $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
+  echo "weak_library_names=''" &&  \
+  echo "current=" && \
+  echo "age=" && \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
index af547ba602..d501855abe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
@@ -13,9 +13,9 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
-           file://0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch \
+           file://remove-host-contamination.patch \
            "
-SRC_URI[md5sum] = "8a851bf2e475e90a3fdac9506e3e4dbd"
-SRC_URI[sha256sum] = "2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62"
+SRC_URI[md5sum] = "943045b9e937ffc5c6cfa0bd5c44230d"
+SRC_URI[sha256sum] = "fb134b4d3e054746ef8b922ff157b0c7903d1fdd910708a45add66954da7ef89"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.14.1


