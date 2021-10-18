Return-Path: <kiran.surendran@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E62C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:20:24 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.40244.1634577622866123723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ksurendr@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19IHKK6O030772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:20:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 10:20:20 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 10:20:20 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22123)
	id 1DCF8900436; Mon, 18 Oct 2021 10:20:20 -0700 (PDT)
From: Kiran Surendran <kiran.surendran@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ffmpeg: fix CVE-2021-38114
Date: Mon, 18 Oct 2021 10:20:18 -0700
Message-ID: <20211018172018.192136-1-kiran.surendran@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 17:20:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157088

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
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


