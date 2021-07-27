Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.9383.1627428049983399651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 16:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16RNKnBe026811
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16RNKmr4012648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 27 Jul 2021 16:20:48 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 27 Jul 2021 16:20:48 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id C8D84901E87; Tue, 27 Jul 2021 16:20:47 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [PATCH 2/6] ffmpeg: fix CVE-2020-20453
Date: Tue, 27 Jul 2021 16:20:43 -0700
Message-ID: <20210727232047.58238-2-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727232047.58238-1-tony.tascioglu@windriver.com>
References: <20210727232047.58238-1-tony.tascioglu@windriver.com>
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
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
new file mode 100644
index 0000000000..b1c94057a3
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
@@ -0,0 +1,42 @@
+From a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 28 May 2021 21:37:26 +0200
+Subject: [PATCH] avcodec/aacenc: Avoid 0 lambda
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
+index aa223cf25f..e80591ba86 100644
+--- a/libavcodec/aacenc.c
++++ b/libavcodec/aacenc.c
+@@ -28,6 +28,7 @@
+  *              TODOs:
+  * add sane pulse detection
+  ***********************************/
++#include <float.h>
+ 
+ #include "libavutil/libm.h"
+ #include "libavutil/float_dsp.h"
+@@ -852,7 +853,7 @@ static int aac_encode_frame(AVCodecContext *avctx, AVPacket *avpkt,
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 00640f3cb3..198a44efec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://fix-CVE-2020-20446.patch \
+           file://fix-CVE-2020-20453.patch \
            "
 SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
-- 
2.31.1

