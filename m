Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F8AC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:07 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=glOqY0V4;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3863; q=dns/txt;
  s=NAESA-Selector1; t=1789560784; x=1821096784;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pY3nH7zdKuSqVDiH00XsD6za1yrrEKsjwwKsTsW3ONY=;
  b=glOqY0V45jVCB0k80f24oi7XykHobl5R0n1phW5Bf4Aj1gbn5XO4UADn
   SpgVLDFV17/p0uwlJigmjIlLzI7XHQq8svJqsauExkq58To9CL9Wxvqfh
   Tj2rfU7598CDyE5qzVivpCI/t1cUKqGWatUSPNxCsnDp3We4uNBJeambJ
   3pPeiCmDC8Wkf8GOxP4n6SP4rBK1+RwK5uXGz20OQnrvorO4/9zt4TlR8
   xXDnt46sEdfctAsjE1tC6piexYRntmaBRoeTa2qGX3g7oJoPWMQcSa9jK
   2RG5HfwkMEO+VO3NcHXP1oE9RhrKWtqixzhKVkyqFcJCjQI4nS52CS7J3
   w==;
X-CSE-ConnectionGUID: nmW014ubSVGjWCuGUJTAtA==
X-CSE-MsgGUID: mCy1Qmm0RV+HgWdT4w8QTQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580008"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:03 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 01/10] ffmpeg: Fix for CVE-2026-64830
Date: Wed, 16 Sep 2026 17:39:24 +0530
Message-ID: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245955

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/dbd495f066a85ba96b17433f4306582aa37c3951
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64830

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- this patch does not have any changes, but later patches in this series
  has some changes or are rebased. Hence created v2 for this patch also.
---
 .../ffmpeg/ffmpeg/CVE-2026-64830.patch        | 65 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch
new file mode 100644
index 0000000000..79ed6a45f1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch
@@ -0,0 +1,65 @@
+From 0ae68ee7e1bc6e2bfde10c78ccc59aa9d99f4d43 Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Mon, 29 Jun 2026 23:30:41 +0200
+Subject: [PATCH 1/9] avformat/vobsub: reuse subtitle streams and bound the
+ stream count
+
+Fixes: heap buffer overflow
+Fixes: lqaO5R1BaZGO
+Fixes: dbfe61100b (avformat/vobsub: fix several issues.)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64830
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/dbd495f066a85ba96b17433f4306582aa37c3951]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/mpeg.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/mpeg.c b/libavformat/mpeg.c
+index a7a2ef7..1ce4bf9 100644
+--- a/libavformat/mpeg.c
++++ b/libavformat/mpeg.c
+@@ -841,6 +841,20 @@ static int vobsub_read_header(AVFormatContext *s)
+             }
+ 
+             if (!st || st->id != stream_id) {
++                st = NULL;
++                for (i = 0; i < s->nb_streams; i++) {
++                    if (s->streams[i]->id == stream_id) {
++                        st = s->streams[i];
++                        break;
++                    }
++                }
++            }
++            if (!st) {
++                if (s->nb_streams >= FF_ARRAY_ELEMS(vobsub->q)) {
++                    av_log(s, AV_LOG_ERROR, "Maximum number of subtitle streams reached\n");
++                    ret = AVERROR_INVALIDDATA;
++                    goto end;
++                }
+                 st = avformat_new_stream(s, NULL);
+                 if (!st) {
+                     ret = AVERROR(ENOMEM);
+@@ -865,14 +879,14 @@ static int vobsub_read_header(AVFormatContext *s)
+             timestamp = (hh*3600LL + mm*60LL + ss) * 1000LL + ms + delay;
+             timestamp = av_rescale_q(timestamp, av_make_q(1, 1000), st->time_base);
+ 
+-            sub = ff_subtitles_queue_insert(&vobsub->q[s->nb_streams - 1], "", 0, 0);
++            sub = ff_subtitles_queue_insert(&vobsub->q[st->index], "", 0, 0);
+             if (!sub) {
+                 ret = AVERROR(ENOMEM);
+                 goto end;
+             }
+             sub->pos = pos;
+             sub->pts = timestamp;
+-            sub->stream_index = s->nb_streams - 1;
++            sub->stream_index = st->index;
+ 
+         } else if (!strncmp(line, "alt:", 4)) {
+             const char *p = line + 4;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8a6eb4eb86..8c1969369b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
            file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
+           file://CVE-2026-64830.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


