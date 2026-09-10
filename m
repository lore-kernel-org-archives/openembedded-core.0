Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FABC88E40
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:04 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=ChxsoyMQ;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3695; q=dns/txt;
  s=NAESA-Selector1; t=1789047242; x=1820583242;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tdvFdVfuN1sCUmj2I3J81WbeQNikyEPa7zpw8sRwmkk=;
  b=ChxsoyMQBZW/unOAegs60iT5j/IRr2XMF+Zu7N2dBs8mTrKLmcnxYH1w
   NM32bFigfGj8bpsIVtuz/xX6ZBeZ6D4dCk7xgcVLUZPort1DahdAbd+x2
   /ZKmpCFqq86kVoidn4Dsyqqns4UOKt/ZiVX2Nex83AxfgwdWptP4jKdFE
   0m6k1LK0ShR40n1Y3jvgvjDKsGQSzqzFMBS3nc8IVHK7GQQKWcswZM8Jy
   uxD5uxaZHnRnuHLaabnSiCYwm3h51hbAkQpStExDbQq9vNJTF5PPLDeaC
   K4E63LrsBlZTLMkpl7EKKTVJFdsPTPkhGzIXUvCxra+A9Q3cAnpMzcWZD
   A==;
X-CSE-ConnectionGUID: q0uS2uexT4yF4Cq3/zbEzg==
X-CSE-MsgGUID: Ku5o5SJUT1WOUiUmJp0PyQ==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105797"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:00 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 01/10] ffmpeg: Fix for CVE-2026-64830
Date: Thu, 10 Sep 2026 19:01:35 +0530
Message-ID: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245570

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/dbd495f066a85ba96b17433f4306582aa37c3951
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64830

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
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


