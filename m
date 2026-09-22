Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C664DC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1790060539506240679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=kJ8puNlr;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3238; q=dns/txt;
  s=NAESA-Selector1; t=1790060541; x=1821596541;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M428ofpeM1XIFZWmtCySgP+x5829pz4I9scjp0+sOMs=;
  b=kJ8puNlrt1XqF3dMsiKeL049Wv8rKflEFSbFjSNhM+/gG+R+hRB5yI3w
   RlQTE5oJqTOBZw9AXB6iWtCgttCaBqJx5IgWlhIoqAMvoxyrwMXfinZmw
   65ZZyce0CqRzaQv+zfNdFY5NUvtwotXNmDqCbXQjGWzULWuj7S11kpT6W
   EI0Gb5zUkfAFAXZhgM/hSJDvmukWhygHEnAGilb5KMicdJPvOABef5YF9
   pmsr9Ecu+LRZ2dA9HMGufBD8U7Vq25KThgmqTFxkL3ThA3kjjP38Eh+WA
   aKA2X1FjgNh73X8KM01WRHaLmRiRgIq9ScmahrtrMPt5ftsxTcCCnFAKm
   Q==;
X-CSE-ConnectionGUID: zxxGmLW/SS6pTL4kcucF/g==
X-CSE-MsgGUID: dsjwdqTPSJK9y/tFv9DEJg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787032800"; 
   d="scan'208";a="63995894"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 22 Sep 2026 01:02:20 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 3/5] ffmpeg: Fix for CVE-2026-66038
Date: Tue, 22 Sep 2026 12:31:27 +0530
Message-ID: <20260922070209.2770399-3-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246384

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e7cbfd1c507b57a806a5825b87d609963e862c8c
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66038

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-66038.patch        | 50 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
new file mode 100644
index 0000000000..4c2be95590
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
@@ -0,0 +1,50 @@
+From 5fc1e9d8af5019a83a5683e30d92c41c7a606c2d Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 28 Jun 2026 19:04:07 +0200
+Subject: [PATCH] avcodec/lcldec: zero the not-decoded tail to avoid heap
+ disclosure
+
+Fixes: use of uninitialized memory
+Fixes: CsNDKB1K1U0C
+Fixes: e2c3aa8e2b (avcodec/lcldec: More space for rgb24)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66038
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e7cbfd1c507b57a806a5825b87d609963e862c8c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/lcldec.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/lcldec.c b/libavcodec/lcldec.c
+index e9d4283eef..71c6d070e2 100644
+--- a/libavcodec/lcldec.c
++++ b/libavcodec/lcldec.c
+@@ -119,6 +119,9 @@ static unsigned int mszh_decomp(const unsigned char * srcptr, int srclen, unsign
+         }
+     }
+ 
++    if (destptr < destptr_end)
++        memset(destptr, 0, destptr_end - destptr);
++
+     return destptr - destptr_bak;
+ }
+ 
+@@ -152,8 +155,11 @@ static int zlib_decomp(AVCodecContext *avctx, const uint8_t *src, int src_len, i
+     if (expected != (unsigned int)zstream->total_out) {
+         av_log(avctx, AV_LOG_ERROR, "Decoded size differs (%d != %lu)\n",
+                expected, zstream->total_out);
+-        if (expected > (unsigned int)zstream->total_out)
++        if (expected > (unsigned int)zstream->total_out) {
++            memset(c->decomp_buf + offset + zstream->total_out, 0,
++                   c->decomp_size - offset - zstream->total_out);
+             return (unsigned int)zstream->total_out;
++        }
+         return AVERROR_UNKNOWN;
+     }
+     return zstream->total_out;
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index c0623987f4..cbb436a9a1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66036_p1.patch \
            file://CVE-2026-66036_p2.patch \
            file://CVE-2026-66037.patch \
+           file://CVE-2026-66038.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


