Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1004.1629822353115062713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360200"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360200"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658904"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/28] ffmpeg: fix CVE-2020-22015
Date: Wed, 25 Aug 2021 00:25:05 +0800
Message-Id: <c10b49e2e8de02c1c6e6a57eab526ac9ebec066f.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

avformat/movenc: Check pal_size before use

Fixes: assertion failure
Fixes: out of array read
Fixes: Ticket8190
Fixes: CVE-2020-22015

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-22015
Upstream-Status: Backport [4c1afa292520329eecd1cc7631bc59a8cca95c46]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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

