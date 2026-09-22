Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40BFC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1790060539506240679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=nrWLXHCz;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2962; q=dns/txt;
  s=NAESA-Selector1; t=1790060540; x=1821596540;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PaLDfXdM1we6eVWyG33XAKEmfgZajOohT16vPIDOUME=;
  b=nrWLXHCzyQP0Zt9IJIIuTgJ8GVOvBTd3WlIO6V6TvtzoHIdmVdnX6xRl
   S14B5eCvUCnoUuWqPcH3PmOV02sJpcKJ3B0GKNCh3xJsQmeIPrJZVhbFm
   saYFPrfyAKaGxNdL+rdGeJQdZPvF8SUZetxTHA9WiQdpqMKaailnFUl6e
   LYIfEdrwdksJ+FB7rggIi+BK4arW47yuIFTq7r/Xe5B9rUCoe3ovAnGqr
   ku3a5NueuJsJLG0OcOCYtEHfKXG7HeYAqf47Jhtw4NUsvWl8A0oY2Af9q
   r59t6pvkCfbVMmZcmpFARzUaoK5ADaUwzEvpZjeAazHZVfYFuqlVs9c88
   Q==;
X-CSE-ConnectionGUID: 4IyMTYLuSTKp+VCc943i7A==
X-CSE-MsgGUID: lksnmqvxSuaEocXF9UEDRA==
X-IronPort-AV: E=Sophos;i="6.27,116,1787032800"; 
   d="scan'208";a="63995890"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 22 Sep 2026 01:02:15 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 2/5] ffmpeg: Fix for CVE-2026-66037
Date: Tue, 22 Sep 2026 12:31:26 +0530
Message-ID: <20260922070209.2770399-2-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246383

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/86708357d126af84c16f80d9c57335d1e8c845c5
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66037

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-66037.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
new file mode 100644
index 0000000000..1b93c0ca86
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
@@ -0,0 +1,39 @@
+From f02c8cd37dee2b333de229c6ac6834322f56e2c9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 28 Jun 2026 22:05:28 +0200
+Subject: [PATCH] avformat/iamf_parse: check count_label against the available
+ bytes
+
+Fixes: unbounded allocation / denial of service
+Fixes: tP59h4cpaFyg
+Fixes: 4ee05182b7 (avformat: Immersive Audio Model and Formats demuxer)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66037
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/86708357d126af84c16f80d9c57335d1e8c845c5]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/iamf_parse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavformat/iamf_parse.c b/libavformat/iamf_parse.c
+index 29b8acd351..a36759e282 100644
+--- a/libavformat/iamf_parse.c
++++ b/libavformat/iamf_parse.c
+@@ -969,6 +969,11 @@ static int mix_presentation_obu(void *s, IAMFContext *c, AVIOContext *pb, int le
+     mix_presentation->cmix = mix;
+ 
+     mix_presentation->count_label = ffio_read_leb(pbc);
++    if (mix_presentation->count_label > len - avio_tell(pbc)) {
++        mix_presentation->count_label = 0;
++        ret = AVERROR_INVALIDDATA;
++        goto fail;
++    }
+     mix_presentation->language_label = av_calloc(mix_presentation->count_label,
+                                                  sizeof(*mix_presentation->language_label));
+     if (!mix_presentation->language_label) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 42ec15bf81..c0623987f4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65706.patch \
            file://CVE-2026-66036_p1.patch \
            file://CVE-2026-66036_p2.patch \
+           file://CVE-2026-66037.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


