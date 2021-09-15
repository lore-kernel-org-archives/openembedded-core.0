Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.9490.1631719469931732589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ksurendr@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18FFOSfb008178
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 08:24:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18FFOSu7009784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 08:24:28 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 08:24:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 15 Sep 2021 08:24:27 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 08:24:27 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22123)
	id 7FCBB900854; Wed, 15 Sep 2021 08:24:27 -0700 (PDT)
From: "Kiran Surendran" <kiran.surendran@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] ffmpeg: fix CVE-2021-38171
Date: Wed, 15 Sep 2021 08:24:24 -0700
Message-ID: <20210915152424.179836-1-kiran.surendran@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kiran Surendran <Kiran.Surendran@windriver.com>

backport from upstream

Signed-off-by: Kiran Surendran <Kiran.Surendran@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38171.patch    | 40 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
new file mode 100644
index 0000000000..8775acd8c5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
@@ -0,0 +1,40 @@
+CVE: CVE-2021-38171
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From d5373a9efb10c1fa87698ee41370fb04dc2e410b Mon Sep 17 00:00:00 2001
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
+---
+ libavformat/adtsenc.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/adtsenc.c b/libavformat/adtsenc.c
+index d937e2bea9..a1593515e1 100644
+--- a/libavformat/adtsenc.c
++++ b/libavformat/adtsenc.c
+@@ -50,9 +50,11 @@ static int adts_decode_extradata(AVFormatContext *s, ADTSContext *adts, const ui
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 0a49493abd..7a027d43b9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -31,7 +31,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
-           "
+           file://fix-CVE-2021-38171.patch \
+          "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.31.1

