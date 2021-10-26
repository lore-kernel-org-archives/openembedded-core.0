Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E362C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 16:00:47 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.14261.1635264046458013187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 09:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783561"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783561"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786720"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 34/37] ffmpeg: fix CVE-2021-38114
Date: Tue, 26 Oct 2021 23:58:05 +0800
Message-Id: 
 <b9a3ca0f4f70ebdb58e59e94e917242b7e9d2111.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 16:00:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157440

From: Kiran Surendran <kiran.surendran@windriver.com>

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe9cdf74f7ef3637ed7c600182f8a0ba40510d2a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
new file mode 100644
index 0000000000..ab3ecfecbb
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
@@ -0,0 +1,67 @@
+CVE: CVE-2021-38114
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From 463dbe4e78cc560ca5b09f23a07add0eb78ccee8 Mon Sep 17 00:00:00 2001
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
+index c78d55aee5..9b475a6979 100644
+--- a/libavcodec/dnxhddec.c
++++ b/libavcodec/dnxhddec.c
+@@ -112,6 +112,7 @@ static av_cold int dnxhd_decode_init(AVCodecContext *avctx)
+ 
+ static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
+ {
++    int ret;
+     if (cid != ctx->cid) {
+         const CIDEntry *cid_table = ff_dnxhd_get_cid_table(cid);
+ 
+@@ -132,19 +133,26 @@ static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 0c6af6549d..c0318ef01d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -31,7 +31,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            file://fix-CVE-2021-33815.patch \
-           file://fix-CVE-2021-38171.patch \ 
+           file://fix-CVE-2021-38171.patch \
+	   file://fix-CVE-2021-38114.patch \ 
           "
 SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
-- 
2.31.1


