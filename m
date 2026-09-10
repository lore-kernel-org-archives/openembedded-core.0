Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B453AC88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:14 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=G0wMATG2;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2866; q=dns/txt;
  s=NAESA-Selector1; t=1789047251; x=1820583251;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LNWcsSx4XH74db9xu/Qt4MrbuWw+SMoYVariWP2n/7w=;
  b=G0wMATG2gp1tPejfywILdxsYoJuHEUVfIcWnt5zLtq0s13HFciJkSsdC
   ni5adRcjIsQ/oKVbNTnwQOrq8V86Mx7Sxptnrbrk4PMEOsbGZM2z0Y5tb
   +/IBN7fy0fSckyYMmuhvp11Zcmj5EbQK+ec1ejNgIiq/0AC6aMVxMRNnb
   SzQgwVrdpryzMmUCdl+xkuHQsA9o0e9cOOT8L9YHbbunIFDW1o2uwdj3h
   11cV5pC97x1/hkgQYtsBipBJ3Pm2yqXBuc41AAuXL52oADK6nJQdgJn64
   KlisqQF0SjfEA6ZFz9ldkCV/7pBxIynO+Vdz73oJljEsZlh5bS6AyVJ22
   g==;
X-CSE-ConnectionGUID: QcVeOYZjQiOS8K1uyjBzLg==
X-CSE-MsgGUID: epxOdf2DRIOCI5YtaXIGMw==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105805"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:10 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 04/10] ffmpeg: Fix for CVE-2026-64833
Date: Thu, 10 Sep 2026 19:01:38 +0530
Message-ID: <20260910133357.452394-4-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245573

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6f80e2765492700622596af720534cef33dd31b4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64833

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
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
index 68f09c2bc4..df7e218305 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
+           file://CVE-2026-64833.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


