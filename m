Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.1165.1631734461740709705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 12:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ksurendr@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18FJYKlb032715
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 12:34:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18FJYKIv025976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 12:34:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:34:19 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 12:34:19 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22123)
	id 7EA28900321; Wed, 15 Sep 2021 12:34:19 -0700 (PDT)
From: "Kiran Surendran" <kiran.surendran@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] ffmpeg: fix CVE-2021-38114
Date: Wed, 15 Sep 2021 12:34:17 -0700
Message-ID: <20210915193417.99374-1-kiran.surendran@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
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
index 0a49493abd..7df356946b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -31,7 +31,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
-           "
+           file://fix-CVE-2021-38114.patch \ 
+          "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.31.1

