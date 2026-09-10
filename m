Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA58C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:25 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=R1AYnhK5;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2686; q=dns/txt;
  s=NAESA-Selector1; t=1789047259; x=1820583259;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=As/TyaxsB3ZDtvQlYHLc0Pxj04Yy/BIZ++rYIqRb6uE=;
  b=R1AYnhK51rg7T4qwq/s8UoNIJtpMsIh44upY0LLfP1yoZCCePUvy7Vn+
   0UaW2hvys6HsMf1jm8EszupEV7RDp1m9JyJNVckCHLQGkTEZNtLVbZjE6
   CIIqzWvwBZiWyq/wob3slK+aF2atSo9iecfSlpDtvbLacu4JqP2kjJdzl
   XN+VmdvokaL/7V+1e3YrEDTa0kefdIhA2ylB0/W3WJ7sSnYEEhRqNNr0Z
   VClHDICOVbzvTceXyOyqWql3XFqAtQXIq0mCOw3siFhek3PN+tjpvKUaU
   OzViVuTcvJrIjtrsl628dG7Zs/DpDR9XhrcFEvMB7cvk9/0FLINQS+Jc2
   g==;
X-CSE-ConnectionGUID: Chqg0YviR2a93kAiUkzEGw==
X-CSE-MsgGUID: 6yuRuQxtQqixF2phyE+Eqg==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105818"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:18 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 08/10] ffmpeg: Fix for CVE-2026-65704
Date: Thu, 10 Sep 2026 19:01:42 +0530
Message-ID: <20260910133357.452394-8-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245577

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/de771bd52774a52d45b0e2c82e56995a1ef40df7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65704

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-65704.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch
new file mode 100644
index 0000000000..223fd03c33
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch
@@ -0,0 +1,35 @@
+From e6f2209a3ab20ef0489395697a1882e97658b5b9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 10 Jul 2026 04:07:35 +0200
+Subject: [PATCH 6/9] avformat/ty: don't let the Series2 AC3 trim underflow the
+ packet size
+
+Fixes: negative-size-param
+Fixes: ty-s2-ac3-negative-size-single-file.ffconcat / create_poc.py
+Fixes: g0qeE6KvrjZi
+Found-by: Adrian Junge (vurlo)
+
+CVE: CVE-2026-65704
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/de771bd52774a52d45b0e2c82e56995a1ef40df7]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/ty.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/ty.c b/libavformat/ty.c
+index 596e4cc..1f2b6f8 100644
+--- a/libavformat/ty.c
++++ b/libavformat/ty.c
+@@ -577,7 +577,7 @@ static int demux_audio(AVFormatContext *s, TyRecHdr *rec_hdr, AVPacket *pkt)
+         if (ty->audio_type == TIVO_AUDIO_AC3 &&
+                 ty->tivo_series == TIVO_SERIES2) {
+             if (ty->ac3_pkt_size + pkt->size > AC3_PKT_LENGTH) {
+-                pkt->size -= 2;
++                pkt->size -= FFMIN(pkt->size, 2);
+                 ty->ac3_pkt_size = 0;
+             } else {
+                 ty->ac3_pkt_size += pkt->size;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 7f0cdd4577..da96d63219 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64834.patch \
            file://CVE-2026-64835.patch \
            file://CVE-2026-65703.patch \
+           file://CVE-2026-65704.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


