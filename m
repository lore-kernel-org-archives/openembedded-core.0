Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1334.1632427824935772260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 13:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ksurendr@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18NKANxR020861
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 13:10:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18NKANXk006459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 13:10:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 23 Sep 2021 13:10:22 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 23 Sep 2021 13:10:22 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22123)
	id 997DD9007EC; Thu, 23 Sep 2021 13:10:22 -0700 (PDT)
From: "Kiran Surendran" <kiran.surendran@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ffmpeg: fix CVE-2021-38171
Date: Thu, 23 Sep 2021 13:09:58 -0700
Message-ID: <20210923200958.6439-1-kiran.surendran@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38171.patch    | 42 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
new file mode 100644
index 0000000000..d82f3a4b63
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
@@ -0,0 +1,42 @@
+CVE: CVE-2021-38171
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From fb993619d1035fa9646506925ea70fb122038999 Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <me22bee@outlook.com>
+Date: Wed, 4 Aug 2021 16:15:18 -0400
+Subject: [PATCH] avformat/adtsenc: return value check for init_get_bits in
+ adts_decode_extradata
+
+As the second argument for init_get_bits (buf) can be crafted, a return value check for this function call is necessary.
+'buf' is  part of  'AVPacket pkt'.
+replace init_get_bits with init_get_bits8.
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 9ffa49496d1aae4cbbb387aac28a9e061a6ab0a6)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libavformat/adtsenc.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/adtsenc.c b/libavformat/adtsenc.c
+index 3595cb3bb2..c35a12a628 100644
+--- a/libavformat/adtsenc.c
++++ b/libavformat/adtsenc.c
+@@ -51,9 +51,11 @@ static int adts_decode_extradata(AVFormatContext *s, ADTSContext *adts, const ui
+     GetBitContext gb;
+     PutBitContext pb;
+     MPEG4AudioConfig m4ac;
+-    int off;
++    int off, ret;
+ 
+-    init_get_bits(&gb, buf, size * 8);
++    ret = init_get_bits8(&gb, buf, size);
++    if (ret < 0)
++        return ret;
+     off = avpriv_mpeg4audio_get_config2(&m4ac, buf, size, 1, s);
+     if (off < 0)
+         return off;
+-- 
+2.31.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index fc1834c00b..0c6af6549d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -31,7 +31,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            file://fix-CVE-2021-33815.patch \
-           "
+           file://fix-CVE-2021-38171.patch \ 
+          "
 SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.31.1

