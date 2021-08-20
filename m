Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.4023.1629495119270007540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 14:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17KLVw5W029501
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
	id B7C719005A8; Fri, 20 Aug 2021 14:31:57 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tony.tascioglu@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 5/5] ffmpeg: fix CVE-2020-22019 and CVE-2020-22033
Date: Fri, 20 Aug 2021 14:31:57 -0700
Message-ID: <20210820213157.98104-5-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820213157.98104-1-tony.tascioglu@windriver.com>
References: <20210820213157.98104-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

avfilter/vf_vmafmotion: Check dimensions

Fixes: out of array access
Fixes: Ticket8241
Fixes: Ticket8246
Fixes: CVE-2020-22019
Fixes: CVE-2020-22033

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-22033
CVE: CVE-2020-22019
Upstream-Status: Backport [82ad1b76751bcfad5005440db48c46a4de5d6f02]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../fix-CVE-2020-22033-CVE-2020-22019.patch   | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
new file mode 100644
index 0000000000..e98ddaaede
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
@@ -0,0 +1,39 @@
+From 2f3bf456fa641edf154a99c4586d7bf52c02a495 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 29 May 2021 09:58:31 +0200
+Subject: [PATCH 5/5] avfilter/vf_vmafmotion: Check dimensions
+
+Fixes: out of array access
+Fixes: Ticket8241
+Fixes: Ticket8246
+Fixes: CVE-2020-22019
+Fixes: CVE-2020-22033
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2020-22033
+CVE: CVE-2020-22019
+Upstream-Status: Backport [82ad1b76751bcfad5005440db48c46a4de5d6f02]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavfilter/vf_vmafmotion.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavfilter/vf_vmafmotion.c b/libavfilter/vf_vmafmotion.c
+index 88d0b35095..0730147e7d 100644
+--- a/libavfilter/vf_vmafmotion.c
++++ b/libavfilter/vf_vmafmotion.c
+@@ -238,6 +238,9 @@ int ff_vmafmotion_init(VMAFMotionData *s,
+     int i;
+     const AVPixFmtDescriptor *desc = av_pix_fmt_desc_get(fmt);
+ 
++    if (w < 3 || h < 3)
++        return AVERROR(EINVAL);
++
+     s->width = w;
+     s->height = h;
+     s->stride = FFALIGN(w * sizeof(uint16_t), 32);
+-- 
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index e68589d4c3..0a49493abd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-20453.patch \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
+           file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

