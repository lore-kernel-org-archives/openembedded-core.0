Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.1057.1629822352109126146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360197"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360197"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658892"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/28] ffmpeg: fix CVE-2020-20453
Date: Wed, 25 Aug 2021 00:25:04 +0800
Message-Id: <5e460d2c5d9d4d62cb3fcf090040f4bd1fe30e1f.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

avcodec/aacenc: Avoid 0 lambda

Fixes: Ticket8003
Fixes: CVE-2020-20453

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-20453
Upstream-Status: Backport [a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2020-20453.patch    | 42 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
new file mode 100644
index 0000000000..4e430726b0
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
@@ -0,0 +1,42 @@
+From 80f9cbee46757430af0769ec999ca702be652f7f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 28 May 2021 21:37:26 +0200
+Subject: [PATCH 2/5] avcodec/aacenc: Avoid 0 lambda
+
+Fixes: Ticket8003
+Fixes: CVE-2020-20453
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2020-20453
+Upstream-Status: Backport [a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavcodec/aacenc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/aacenc.c b/libavcodec/aacenc.c
+index db11e0ca29..9c6cb75be4 100644
+--- a/libavcodec/aacenc.c
++++ b/libavcodec/aacenc.c
+@@ -28,6 +28,7 @@
+  *              TODOs:
+  * add sane pulse detection
+  ***********************************/
++#include <float.h>
+ 
+ #include "libavutil/libm.h"
+ #include "libavutil/thread.h"
+@@ -856,7 +857,7 @@ static int aac_encode_frame(AVCodecContext *avctx, AVPacket *avpkt,
+                 /* Not so fast though */
+                 ratio = sqrtf(ratio);
+             }
+-            s->lambda = FFMIN(s->lambda * ratio, 65536.f);
++            s->lambda = av_clipf(s->lambda * ratio, FLT_MIN, 65536.f);
+ 
+             /* Keep iterating if we must reduce and lambda is in the sky */
+             if (ratio > 0.9f && ratio < 1.1f) {
+-- 
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index b4fbebe414..3917ad9c2c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://fix-CVE-2020-20446.patch \
+           file://fix-CVE-2020-20453.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

