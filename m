Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CAD817888A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 15:32:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 07:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,397,1508828400"; 
   d="scan'208";a="2474973"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 13 Dec 2017 07:32:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 17:33:01 +0200
Message-Id: <20171213153307.26576-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171213153307.26576-1-alexander.kanavin@linux.intel.com>
References: <20171213153307.26576-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/15] ffmpeg: update to 3.4
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
X-List-Received-Date: Wed, 13 Dec 2017 15:32:35 -0000

Schroedinger support has been dropped:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/220b24c7c9

Remove upstreamed patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    | 44 ----------------------
 .../ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb}      |  8 ++--
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
deleted file mode 100644
index 3f8224aa079..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f34c567045bea5a7ded9bcfa8e785cfd24cc7dde Mon Sep 17 00:00:00 2001
-From: Shivraj Patil <shivraj.patil@imgtec.com>
-Date: Tue, 4 Apr 2017 18:56:01 +0530
-Subject: [PATCH] build fix for mips
-
-Signed-off-by: Shivraj Patil <shivraj.patil@imgtec.com>
-Signed-off-by: Ronald S. Bultje <rsbultje@gmail.com>
----
-Upstream-Status: Backport
-
- libavcodec/mips/hevcpred_init_mips.c | 3 ++-
- libavcodec/mips/hevcpred_msa.c       | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/mips/hevcpred_init_mips.c b/libavcodec/mips/hevcpred_init_mips.c
-index 331cfac115..e987698d66 100644
---- a/libavcodec/mips/hevcpred_init_mips.c
-+++ b/libavcodec/mips/hevcpred_init_mips.c
-@@ -18,7 +18,8 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
--#include "libavcodec/hevc.h"
-+#include "config.h"
-+#include "libavutil/attributes.h"
- #include "libavcodec/mips/hevcpred_mips.h"
- 
- #if HAVE_MSA
-diff --git a/libavcodec/mips/hevcpred_msa.c b/libavcodec/mips/hevcpred_msa.c
-index 6a3b2815fd..963c64c861 100644
---- a/libavcodec/mips/hevcpred_msa.c
-+++ b/libavcodec/mips/hevcpred_msa.c
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
-2.13.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
index 57e0ac04115..42dbe5582f3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
@@ -25,10 +25,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
-           file://0001-build-fix-for-mips.patch \
-          "
-SRC_URI[md5sum] = "e14a0200c78ce5c918427e57cd406a0d"
-SRC_URI[sha256sum] = "98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957"
+           "
+SRC_URI[md5sum] = "c64ba7247bb91e516f6a5789348fd5b5"
+SRC_URI[sha256sum] = "aeee06e4d8b18d852c61ebbfe5e1bb7014b1e118e8728c1c2115f91e51bffbef"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
@@ -64,7 +63,6 @@ PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
-- 
2.15.0


