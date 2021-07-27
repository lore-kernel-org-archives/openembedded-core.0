Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.9015.1627428050203620564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 16:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16RNKnlC026806
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16RNKmr3012648
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
	id C8623901F3A; Tue, 27 Jul 2021 16:20:47 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [PATCH 5/6] ffmpeg: fix CVE-2020-22033 and CVE-2020-22019
Date: Tue, 27 Jul 2021 16:20:46 -0700
Message-ID: <20210727232047.58238-5-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727232047.58238-1-tony.tascioglu@windriver.com>
References: <20210727232047.58238-1-tony.tascioglu@windriver.com>
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
 .../fix-CVE-2020-22033-CVE-2020-22019.patch   | 40 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
new file mode 100644
index 0000000000..5d979ca3f2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
@@ -0,0 +1,40 @@
+From 82ad1b76751bcfad5005440db48c46a4de5d6f02 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 29 May 2021 09:58:31 +0200
+Subject: [PATCH] avfilter/vf_vmafmotion: Check dimensions
+
+Fixes: out of array access
+Fixes: Ticket8241
+Fixes: Ticket8246
+Fixes: CVE-2020-22019
+Fixes: CVE-2020-22033
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
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
+index 2db4783d8d..454ebb8afa 100644
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index f1b3c027e3..70b1513048 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-20453.patch \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
+           file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            "
 SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
-- 
2.31.1

