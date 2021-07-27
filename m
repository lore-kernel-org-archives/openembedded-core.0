Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.9014.1627428050023960322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 16:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16RNKnJT026815
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16RNKmr6012648
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
	id C93A8901409; Tue, 27 Jul 2021 16:20:47 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [PATCH 3/6] ffmpeg: fix CVE-2020-22015
Date: Tue, 27 Jul 2021 16:20:44 -0700
Message-ID: <20210727232047.58238-3-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727232047.58238-1-tony.tascioglu@windriver.com>
References: <20210727232047.58238-1-tony.tascioglu@windriver.com>
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
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
new file mode 100644
index 0000000000..5c911299cb
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
@@ -0,0 +1,44 @@
+From 4c1afa292520329eecd1cc7631bc59a8cca95c46 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 29 May 2021 09:22:27 +0200
+Subject: [PATCH] avformat/movenc: Check pal_size before use
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
+index 2ab507df15..7d839f447b 100644
+--- a/libavformat/movenc.c
++++ b/libavformat/movenc.c
+@@ -2160,11 +2160,13 @@ static int mov_write_video_tag(AVFormatContext *s, AVIOContext *pb, MOVMuxContex
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 198a44efec..786f7abc20 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://fix-CVE-2020-20446.patch \
            file://fix-CVE-2020-20453.patch \
+           file://fix-CVE-2020-22015.patch \
            "
 SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
-- 
2.31.1

