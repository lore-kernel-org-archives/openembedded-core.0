Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3944.1629495119583033375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 14:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17KLVw5U029501
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
	id B83AA90063C; Fri, 20 Aug 2021 14:31:57 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tony.tascioglu@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 3/5] ffmpeg: fix CVE-2020-22015
Date: Fri, 20 Aug 2021 14:31:55 -0700
Message-ID: <20210820213157.98104-3-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820213157.98104-1-tony.tascioglu@windriver.com>
References: <20210820213157.98104-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

avformat/movenc: Check pal_size before use

Fixes: assertion failure
Fixes: out of array read
Fixes: Ticket8190
Fixes: CVE-2020-22015

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-22015
Upstream-Status: Backport [4c1afa292520329eecd1cc7631bc59a8cca95c46]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2020-22015.patch    | 44 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
new file mode 100644
index 0000000000..1fdb31de7d
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
@@ -0,0 +1,44 @@
+From dce5d2c2ee991f8cd96ab74d51a2d1a134a1a645 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 29 May 2021 09:22:27 +0200
+Subject: [PATCH 3/5] avformat/movenc: Check pal_size before use
+
+Fixes: assertion failure
+Fixes: out of array read
+Fixes: Ticket8190
+Fixes: CVE-2020-22015
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+
+CVE: CVE-2020-22015
+Upstream-Status: Backport [4c1afa292520329eecd1cc7631bc59a8cca95c46]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavformat/movenc.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/movenc.c b/libavformat/movenc.c
+index c34d86522a..9603704083 100644
+--- a/libavformat/movenc.c
++++ b/libavformat/movenc.c
+@@ -2094,11 +2094,13 @@ static int mov_write_video_tag(AVFormatContext *s, AVIOContext *pb, MOVMuxContex
+         avio_wb16(pb, 0x18); /* Reserved */
+ 
+     if (track->mode == MODE_MOV && track->par->format == AV_PIX_FMT_PAL8) {
+-        int pal_size = 1 << track->par->bits_per_coded_sample;
+-        int i;
++        int pal_size, i;
+         avio_wb16(pb, 0);             /* Color table ID */
+         avio_wb32(pb, 0);             /* Color table seed */
+         avio_wb16(pb, 0x8000);        /* Color table flags */
++        if (track->par->bits_per_coded_sample < 0 || track->par->bits_per_coded_sample > 8)
++            return AVERROR(EINVAL);
++        pal_size = 1 << track->par->bits_per_coded_sample;
+         avio_wb16(pb, pal_size - 1);  /* Color table size (zero-relative) */
+         for (i = 0; i < pal_size; i++) {
+             uint32_t rgb = track->palette[i];
+-- 
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 3917ad9c2c..c9c82b0398 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://fix-CVE-2020-20446.patch \
            file://fix-CVE-2020-20453.patch \
+           file://fix-CVE-2020-22015.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

