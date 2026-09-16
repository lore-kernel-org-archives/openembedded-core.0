Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAB4C982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:17 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=OhgYJBlG;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2827; q=dns/txt;
  s=NAESA-Selector1; t=1789560791; x=1821096791;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QJE4wRst3Tv+8V9j8Dobc2C2q23zUqDlPMlIRNiLlpI=;
  b=OhgYJBlGPngVD2bpDC3AjPZMcKh42vmJhwvKph3j9/si8TdVPQuEla/q
   u7vjvntYTh4XEKefUR0WXLOXQo5H5MOBf/7pnhgUYJuJAybrEfw6zPkdN
   dsbiKr5RQE+lYMekh2Kk83ABhrryuf6RBsx+cQiv9V1izhGUMs7ZGhv3P
   QRNRutgwNa6pptvybNDrrJK3FY0Rr9zmrL3pxHRfH8pDdJQKV1Tne78qH
   O+KfS3h/c9ucS4wd8lKDb10Suo6yp2mxPNXMFLGRwJFTJBoXw67ZOQnQd
   32z8CpAFnzTw0fcDnWilV88kmen+cfZfk60wi7IhFxbiHR2B0iLKjP/mD
   Q==;
X-CSE-ConnectionGUID: c3wLPcuTRfujEQj5vgAcmg==
X-CSE-MsgGUID: W/U5h5HLTvSehSJDHw0Lcg==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580020"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:10 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 04/10] ffmpeg: Fix for CVE-2026-64833
Date: Wed, 16 Sep 2026 17:39:27 +0530
Message-ID: <20260916121258.1699611-4-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245958

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6f80e2765492700622596af720534cef33dd31b4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64833

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- rebased on new CVE fix
---
 .../ffmpeg/ffmpeg/CVE-2026-64833.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch
new file mode 100644
index 0000000000..407ebf0ece
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch
@@ -0,0 +1,36 @@
+From 9d412e4715b17404b5e4c6d9f0d2b5c1a100aa74 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 30 Jun 2026 00:11:50 +0200
+Subject: [PATCH 2/9] avformat/spdifenc: bound DTS core_size against the packet
+ size in the HD path
+
+Fixes: out of array read
+Fixes: yBSax492UIB9
+Fixes: 482d98f69b2 (spdifenc: IEC 61937 encapsulation of DTS-HD for HDMI)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64833
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6f80e2765492700622596af720534cef33dd31b4]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/spdifenc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/spdifenc.c b/libavformat/spdifenc.c
+index ab3f73d..16eebda 100644
+--- a/libavformat/spdifenc.c
++++ b/libavformat/spdifenc.c
+@@ -225,7 +225,7 @@ static int spdif_header_dts4(AVFormatContext *s, AVPacket *pkt, int core_size,
+              * (dtshd_fallback == 0) */
+             ctx->dtshd_skip = 1;
+     }
+-    if (ctx->dtshd_skip && core_size) {
++    if (ctx->dtshd_skip && core_size && core_size <= pkt->size) {
+         pkt_size = core_size;
+         if (ctx->dtshd_fallback >= 0)
+             --ctx->dtshd_skip;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 4192b1a5c9..35153b81a9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64831.patch \
            file://CVE-2026-64832.patch \
+           file://CVE-2026-64833.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


