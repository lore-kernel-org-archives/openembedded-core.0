Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3943.1629495119285228086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 14:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17KLVw5V029501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 14:31:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 Aug 2021 14:31:57 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 Aug 2021 14:31:57 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id B8D249005A7; Fri, 20 Aug 2021 14:31:57 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tony.tascioglu@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 2/5] ffmpeg: fix CVE-2020-20453
Date: Fri, 20 Aug 2021 14:31:54 -0700
Message-ID: <20210820213157.98104-2-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820213157.98104-1-tony.tascioglu@windriver.com>
References: <20210820213157.98104-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

avcodec/aacenc: Avoid 0 lambda

Fixes: Ticket8003
Fixes: CVE-2020-20453

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-20453
Upstream-Status: Backport [a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
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

