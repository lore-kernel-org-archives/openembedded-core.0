Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1004.1629822353115062713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360213"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658925"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:40 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/28] ffmpeg: fix CVE-2020-22019 and CVE-2020-22033
Date: Wed, 25 Aug 2021 00:25:07 +0800
Message-Id: <7423421005816ab75ff0a08813054f7e03075cd2.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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

