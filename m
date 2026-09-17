Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC30C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1708.1789682908717042740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FbkYg7Yc;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so782845e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682907; x=1790287707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ruuTStQRB+KjBtaQkrKADrCVYxt6Bjqe/tmPU17X5E8=;
        b=FbkYg7YcVr35yKvtJLoEkWVapVSpuGmoVu3ycinIXqbD54vC2Es8fiwteJtsllwLR1
         BT7O25uAM+CmHyRNlISibQ5RNDFUpFBOwkrhXi29jRUQyc+fOd9Yux7Xj5umpHfeownV
         xlGgbgMxdOn6jH6g2e6cCAPUERS3wPFZDyLnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682907; x=1790287707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ruuTStQRB+KjBtaQkrKADrCVYxt6Bjqe/tmPU17X5E8=;
        b=W7xRQEiLL56O2pcOsH6JSn4hSlEti+jAMCZMuS/XzgIDZwLqWrWdvMG7iggfy6PzKF
         FwNKmFPEDM3np2bqyurtLLXDQIBfjdkRqBzBFI/gLUpl+tye7Ga1m3vYuntYoTxT/ol/
         uqr+UksF1kSjoMx8+R5kXW41lvEMD6oxU6/ZtXJH5dh4Nj8gVvVzR+Sz8p+dgm3bou+j
         O+aedzZxscMz1ASa0oPUGclvABavId34aB5RRNCmQWd8Rhhvjpa/AvjIovh5o8WLD9Dp
         M5ScvM6ZnSVJseEWbyCB4Q5FT7xW51HRuG7rF7jZEY/qcw9WHOi62N3PTivkGSZgDo9I
         hScg==
X-Gm-Message-State: AFuF++l1EcG8CNkcRw+HmeMRhQtokJ5CMkIAYSMUtEuLKk/me0UHDtyq
	D6SyB9FGPtyD0eHqwrI9G08OZ0Wgtkr4+/KJ06Ixe1G9D/cd2BValc0ruXLgVUCWn3l2PR3cCUW
	VPzVQ0Y8=
X-Gm-Gg: AYBFou1BPCJ+uChxmHQRUI88gfa5VZdbE2sAiGwqgpa7TJHH0Gu982wSgn0e+f8o0hN
	ykYF8JMVqZP/YKQgrLKoAT0j5+yCtY1CY/LqrlUzxSuPvXA6X4QqbC5oMDlv/rAwwosReDgZ0ck
	3G7qNSmUAixf2fzSgF8e23f3jFEI3Hi9JWa4vzTmbVTpVyh91cgCbwveKC3ZnYCf1rygNqtfOUP
	hb88kr/1WiDuEv4aSVhHWl1cKOnupf5wSjE8t86x71ec/tLq+bxK7oivSLOPRJLF3hZfMhWoDh0
	L0J4E0yLbOQ1HbpUATdXGj0GWNAYfNsXW1AqmZNL5ifbNrUtiKDY2ZQCksPtURBagYk+Yu9xnoe
	iamkNv5skFBr+OFCiMtoXMXDpZ67Y/csLS4ElouAv7gK3mp2nYv8pdIvLLer398RhcE77xWhHmo
	/98ruF1nseFFrRTjAhtfiM6rFnOPD6ZyTYMNCQS0KKwjCkozDZNxltQ3tH9oDvJNx9ifxpvcgeK
	hCSLN6LsQHjs6cHRmH0ytUx7kgYI8fFlWoDr9fRwcl79J/6cz3vykME81ELfPb9LyXFr9XEykYH
	yh9ciqsKWQ==
X-Received: by 2002:a05:600c:468c:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fc56811dcmr3710355e9.4.1789682906973;
        Thu, 17 Sep 2026 15:08:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 69/79] ffmpeg: Fix for CVE-2026-64830
Date: Fri, 18 Sep 2026 00:06:54 +0200
Message-ID: <6dd7d1ab2558f450885ab6346fc1c1778da09264.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246164

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/dbd495f066a85ba96b17433f4306582aa37c3951
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64830

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64830.patch        | 65 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch
new file mode 100644
index 00000000000..79ed6a45f16
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
index 8a6eb4eb863..8c1969369b6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
            file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
+           file://CVE-2026-64830.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

