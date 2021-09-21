Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.419.1632243845533747474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="287090253"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="287090253"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="549571214"
Received: from vanamadx-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.239.24])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 4/4] ffmpeg: fix CVE-2021-38114
Date: Wed, 22 Sep 2021 01:03:12 +0800
Message-Id: <b1d51e992f658528a4696c02559b7a5e7ee065e2.1632216051.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632216051.git.anuj.mittal@intel.com>
References: <cover.1632216051.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiran Surendran <kiran.surendran@windriver.com>

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
new file mode 100644
index 0000000000..3de7cf7e0f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
@@ -0,0 +1,67 @@
+CVE: CVE-2021-38114
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From 662aef4aacf23b4be4c1cfaebd837e225b357e51 Mon Sep 17 00:00:00 2001
+From: maryam ebr <me22bee@outlook.com>
+Date: Tue, 3 Aug 2021 01:05:47 -0400
+Subject: [PATCH] avcodec/dnxhddec: check and propagate function return value
+
+Similar to CVE-2013-0868, here return value check for 'init_vlc' is needed.
+crafted DNxHD data can cause unspecified impact.
+
+Reviewed-by: Paul B Mahol <onemda@gmail.com>
+Signed-off-by: James Almer <jamrial@gmail.com>
+---
+ libavcodec/dnxhddec.c | 22 +++++++++++++++-------
+ 1 file changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/libavcodec/dnxhddec.c b/libavcodec/dnxhddec.c
+index e5d01e2e71..54f894f81b 100644
+--- a/libavcodec/dnxhddec.c
++++ b/libavcodec/dnxhddec.c
+@@ -110,6 +110,7 @@ static av_cold int dnxhd_decode_init(AVCodecContext *avctx)
+ 
+ static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
+ {
++    int ret;
+     if (cid != ctx->cid) {
+         int index;
+ 
+@@ -129,19 +130,26 @@ static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
+         ff_free_vlc(&ctx->dc_vlc);
+         ff_free_vlc(&ctx->run_vlc);
+ 
+-        init_vlc(&ctx->ac_vlc, DNXHD_VLC_BITS, 257,
++        if ((ret = init_vlc(&ctx->ac_vlc, DNXHD_VLC_BITS, 257,
+                  ctx->cid_table->ac_bits, 1, 1,
+-                 ctx->cid_table->ac_codes, 2, 2, 0);
+-        init_vlc(&ctx->dc_vlc, DNXHD_DC_VLC_BITS, bitdepth > 8 ? 14 : 12,
++                 ctx->cid_table->ac_codes, 2, 2, 0)) < 0)
++            goto out;
++        if ((ret = init_vlc(&ctx->dc_vlc, DNXHD_DC_VLC_BITS, bitdepth > 8 ? 14 : 12,
+                  ctx->cid_table->dc_bits, 1, 1,
+-                 ctx->cid_table->dc_codes, 1, 1, 0);
+-        init_vlc(&ctx->run_vlc, DNXHD_VLC_BITS, 62,
++                 ctx->cid_table->dc_codes, 1, 1, 0)) < 0)
++            goto out;
++        if ((ret = init_vlc(&ctx->run_vlc, DNXHD_VLC_BITS, 62,
+                  ctx->cid_table->run_bits, 1, 1,
+-                 ctx->cid_table->run_codes, 2, 2, 0);
++                 ctx->cid_table->run_codes, 2, 2, 0)) < 0)
++            goto out;
+ 
+         ctx->cid = cid;
+     }
+-    return 0;
++    ret = 0;
++out:
++    if (ret < 0)
++        av_log(ctx->avctx, AV_LOG_ERROR, "init_vlc failed\n");
++    return ret;
+ }
+ 
+ static int dnxhd_get_profile(int cid)
+-- 
+2.31.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 3162617336..2df8fc45cf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            file://fix-CVE-2021-38291.patch \
            file://fix-CVE-2021-38171.patch \
+           file://fix-CVE-2021-38114.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

