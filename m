Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3934.1629495119582347899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 14:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17KLVw5T029501
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
	id A75FE9005CD; Fri, 20 Aug 2021 14:31:57 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tony.tascioglu@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 1/5] ffmpeg: fix CVE-2020-20446
Date: Fri, 20 Aug 2021 14:31:53 -0700
Message-ID: <20210820213157.98104-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

avcodec/aacpsy: Avoid floating point division by 0 of norm_fac

Fixes: Ticket7995
Fixes: CVE-2020-20446

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-20446
Upstream-Status: Backport [223b5e8ac9f6461bb13ed365419ec485c5b2b002]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2020-20446.patch    | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
new file mode 100644
index 0000000000..4fe80cffa1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
@@ -0,0 +1,35 @@
+From 073bad2fcae5be78c11a1623a20319107dfae9f8 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 28 May 2021 20:18:25 +0200
+Subject: [PATCH 1/5] avcodec/aacpsy: Avoid floating point division by 0 of
+ norm_fac
+
+Fixes: Ticket7995
+Fixes: CVE-2020-20446
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2020-20446
+Upstream-Status: Backport [223b5e8ac9f6461bb13ed365419ec485c5b2b002]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavcodec/aacpsy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/aacpsy.c b/libavcodec/aacpsy.c
+index fca692cb15..bd444fecdc 100644
+--- a/libavcodec/aacpsy.c
++++ b/libavcodec/aacpsy.c
+@@ -794,7 +794,7 @@ static void psy_3gpp_analyze_channel(FFPsyContext *ctx, int channel,
+ 
+         if (pe < 1.15f * desired_pe) {
+             /* 6.6.1.3.6 "Final threshold modification by linearization" */
+-            norm_fac = 1.0f / norm_fac;
++            norm_fac = norm_fac ? 1.0f / norm_fac : 0;
+             for (w = 0; w < wi->num_windows*16; w += 16) {
+                 for (g = 0; g < num_bands; g++) {
+                     AacPsyBand *band = &pch->band[w+g];
+-- 
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 08be38ca50..b4fbebe414 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+           file://fix-CVE-2020-20446.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

