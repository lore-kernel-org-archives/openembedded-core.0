Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.1056.1629822352049364554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360194"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360194"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658881"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/28] ffmpeg: fix CVE-2020-20446
Date: Wed, 25 Aug 2021 00:25:03 +0800
Message-Id: <f95b512e0bd506339c83081071c83000604dd105.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

avcodec/aacpsy: Avoid floating point division by 0 of norm_fac

Fixes: Ticket7995
Fixes: CVE-2020-20446

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-20446
Upstream-Status: Backport [223b5e8ac9f6461bb13ed365419ec485c5b2b002]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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

