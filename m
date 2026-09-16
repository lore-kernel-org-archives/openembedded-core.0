Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C079C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:17 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=pCm3sl71;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3000; q=dns/txt;
  s=NAESA-Selector1; t=1789560786; x=1821096786;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=h2RByESo+A2GajYNmvVS+vKjh/Pun1O2OSrNB9uNPjQ=;
  b=pCm3sl71DVfrb0+1V7UIAZIEMz2maTpxmI3UYnN/IP6/HR4GZ7LrbrkV
   ocsv1WC5sUDqtKVmMBkdeY4zwE8uXY/DU8+zvPMAacsvPhfO+9CwWs/53
   o5aEzmFxo2d2pnlGcuPfjtkp5eNGxakdQGbjb45f70xAMt5NbCRJO7Ebr
   kcGuAkM+FXLlRyZdAR/mAtw3ckRNpd8CQ6ehKC5tMyANp2aOIZDfVmB1N
   /uER+W32U96I3efDkmMHfUvDIV+cq7OBHzplx66HhnKi2mADgROeAQwJR
   /PlY/QYe5pCPzWtKTCbFe+HyKI+Il2ggO/SjdSEdqRykif+B3it9sTOzk
   g==;
X-CSE-ConnectionGUID: QizNeJujSKuuAYU/9QvkOQ==
X-CSE-MsgGUID: h/l6jwVUQUWkzdoMGhm3Xw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580012"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:05 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 02/10] ffmpeg: Fix for CVE-2026-64831
Date: Wed, 16 Sep 2026 17:39:25 +0530
Message-ID: <20260916121258.1699611-2-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245956

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/92737390dc133daadce47dd7d2ec8ef3d9ebcbed
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64831

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- previously CVE_STATUS was set, created new patch with proper fix
---
 .../ffmpeg/ffmpeg/CVE-2026-64831.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch
new file mode 100644
index 0000000000..29218b3608
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch
@@ -0,0 +1,36 @@
+From 60044ad2b2dbd9a728a1471b0e36eed3157a6ad5 Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Tue, 30 Jun 2026 21:55:49 +0200
+Subject: [PATCH] avcodec/vulkan_hevc: reject too many VPS HRD parameter sets
+
+Fixes: stack buffer overflow
+Fixes: tD7Mj0ST7ND3
+Fixes: 82864c21112157951ce91b4430a9018edd02f5ab (vulkan_hevc: use VK_KHR_video_maintenance2 if available)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64831
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/92737390dc133daadce47dd7d2ec8ef3d9ebcbed]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/vulkan_hevc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/vulkan_hevc.c b/libavcodec/vulkan_hevc.c
+index 5e15c6b931..34676113a9 100644
+--- a/libavcodec/vulkan_hevc.c
++++ b/libavcodec/vulkan_hevc.c
+@@ -875,6 +875,9 @@ static int vk_hevc_end_frame(AVCodecContext *avctx)
+                 vksps_p.vcl_hdr, &vksps_p.ptl, &vksps_p.dpbm,
+                 &vksps_p.pal, vksps_p.str, &vksps_p.ltr);
+ 
++        if (sps->vps->vps_num_hrd_parameters > HEVC_MAX_SUB_LAYERS)
++            return AVERROR_INVALIDDATA;
++
+         vkvps_p.sls = vkvps_ps;
+         set_vps(sps->vps, &vkvps, &vkvps_p.ptl, &vkvps_p.dpbm,
+                 vkvps_p.hdr, vkvps_p.sls);
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8c1969369b..02b9cf65a5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
+           file://CVE-2026-64831.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


