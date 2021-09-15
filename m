Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565529"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565529"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597312"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/17] ffmpeg: fix CVE-2021-38291
Date: Thu, 16 Sep 2021 07:15:31 +0800
Message-Id: <cbb7b8cfbd4cfe6115e858e14f415d89d182f550.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiran Surendran <ksurendr@ala-lpggp3.wrs.com>

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38291.patch    | 54 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch
new file mode 100644
index 0000000000..ef1c760286
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2021-38291
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From e908bdb157fa493be2b50e2a11055d19c5254a15 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 21 Jul 2021 01:02:44 -0300
+Subject: [PATCH] avcodec/utils: don't return negative values in
+ av_get_audio_frame_duration()
+
+In some extrme cases, like with adpcm_ms samples with an extremely high channel
+count, get_audio_frame_duration() may return a negative frame duration value.
+Don't propagate it, and instead return 0, signaling that a duration could not
+be determined.
+
+Fixes ticket #9312
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+---
+ libavcodec/utils.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/utils.c b/libavcodec/utils.c
+index 81e34254e8..5fdb10fe09 100644
+--- a/libavcodec/utils.c
++++ b/libavcodec/utils.c
+@@ -1776,20 +1776,22 @@ static int get_audio_frame_duration(enum AVCodecID id, int sr, int ch, int ba,
+ 
+ int av_get_audio_frame_duration(AVCodecContext *avctx, int frame_bytes)
+ {
+-    return get_audio_frame_duration(avctx->codec_id, avctx->sample_rate,
++    int duration = get_audio_frame_duration(avctx->codec_id, avctx->sample_rate,
+                                     avctx->channels, avctx->block_align,
+                                     avctx->codec_tag, avctx->bits_per_coded_sample,
+                                     avctx->bit_rate, avctx->extradata, avctx->frame_size,
+                                     frame_bytes);
++    return FFMAX(0, duration);
+ }
+ 
+ int av_get_audio_frame_duration2(AVCodecParameters *par, int frame_bytes)
+ {
+-    return get_audio_frame_duration(par->codec_id, par->sample_rate,
++    int duration = get_audio_frame_duration(par->codec_id, par->sample_rate,
+                                     par->channels, par->block_align,
+                                     par->codec_tag, par->bits_per_coded_sample,
+                                     par->bit_rate, par->extradata, par->frame_size,
+                                     frame_bytes);
++    return FFMAX(0, duration);
+ }
+ 
+ #if !HAVE_THREADS
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 0a49493abd..3e7ceb859f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
+           file://fix-CVE-2021-38291.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

