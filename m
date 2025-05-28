Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2AFC5B543
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17466.1748443417716839878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sUghfHZW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2347b7d6aeeso31771005ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443417; x=1749048217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xt8AOhIxnzKX3d+dhcIMui3uDInPFRFG1qujt5o3h4=;
        b=sUghfHZWePHbRAaw+uk2ObLAEKAAzYlq6LLyLKWN/YipeNtDr2eiv743u5NerGqeCY
         Ec6VPoi+wC8kaB0PSSNobmsqOcly53HTug2qeUcMZu6ea6TnZsLqVrJS8Kx96Si13fBk
         Rw8/5Qq//aLChOIa/8/dpvtpTzeSOovJAafDJoIUMOVwRUeutQw/pH/CABAQX/CyhTPc
         XylrQz1gGta3chjJb1KFjFyRBOo6gt+43ZEpVXJOz05IlkbeqF+wvEuxMt/RqbWtYi5I
         OQhgbUCLhmV90iaFu6RqGSk/HAZGk6dOtqq12vhbuiUWNLZKTT8MKekEKPo1cFJgd9uF
         a5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443417; x=1749048217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xt8AOhIxnzKX3d+dhcIMui3uDInPFRFG1qujt5o3h4=;
        b=TfC2dOJwhbgkUWjKziuJxXRW78M8Lad6Jdqm2iapbbAAOthT9ZeuDxH7Y+GMrje4ed
         793uhhzjiX2vpvUG9TlzQZGPeQ79vKncPJHThhsEjdAg1B8TSsOVut/DqACMe8uwNOeQ
         4CQUTWw7CilBE8XuQ/+SpAhSO44LoE1OHuKN/Aa3qGAvJeWdi27Lk/7lCu7EEX9wOHKe
         8TyV6oY385yRfGGCr0dBadamj0WjPNINfF7ISPUQ3crbgczkil37c93K8Jt+rxb9Fyo0
         W7QWydsQAGMmjZqtIPeIt8+ImfGJCUrLScTiINpTkiNJeZ8VmjRub/yTQMVJdCRP3NIf
         PTXA==
X-Gm-Message-State: AOJu0YzRS6DC6Ib5goqNGHg4DYwMoFC4tSAR1wT8hrn+s+oAEe+6pLfv
	H9cxUh9ebfO2eE3B6q0GnNlHvn6NcBrAIe12+elu6x7CwN5jvwWWa3uxqpNw/V27VXnLlRUgKmq
	DC1Zj
X-Gm-Gg: ASbGncsj/yG6EoHpdUWAPpZHpHnW7lhghcKrgQpnV0Ms3d7fQwlGPkHk4FFFNdfuwVT
	HddFgFoTofMZrjRoLP2nOyq0Op+nmwHc3GWlFmcjdkB+gyPD/7QTudtI/iU0yvJy381l3YR1q1g
	64ErVoRc6pfUkP+V+VXdQ22HB1QdPIWy0rX1AcA6wWe9OBYF4EaylZBezoiE4CWhalg6tLTZb+c
	WGMLdAfZyyJOS07B1Ku/+wuimzROyz1Tk9lz7X9rcpgQdeubyM0JQqz8hXFvwMPvtxJS8DK0YmG
	8+aZpNaaexS/MhQMTrITHKCf3Ou8GZJNEidyRnxDeRiFiqgzHEqsUw==
X-Google-Smtp-Source: AGHT+IHFJUMDQGw0waIeSjJcTVHQ1dZWblYnsq6k2QxX+V1WWlsGecZl8qiwdykQy8gx7AJcoro0iA==
X-Received: by 2002:a17:902:d485:b0:234:9094:3fb1 with SMTP id d9443c01a7336-23490943fc3mr141208765ad.35.1748443416760;
        Wed, 28 May 2025 07:43:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] ffmpeg: upgrade 6.1.1 -> 6.1.2
Date: Wed, 28 May 2025 07:43:12 -0700
Message-ID: <57e25585abf34677451c68d581374245e5b4b418.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217361

From: Divyanshu Rathore <divyanshurathore2022@gmail.com>

ffmpeg_6.1.2 is the newest available stable release for 6.1.
It introduces quite a few bug and CVE fixes, which should help all.

CVEs that are fixed in the upgrade:
CVE-2024-32230
CVE-2024-35366
CVE-2024-36613
CVE-2024-36616
CVE-2024-36617
CVE-2024-36619
CVE-2024-7055

During upgrade it was noticed that the CVE scan doesn't pick up the CVEs as unpatched
(CVE-2025-0518, CVE-2025-22919, CVE-2025-22921, CVE-2025-25473,
CVE-2024-36618, CVE-2024-35369, CVE-2024-35368, CVE-2024-35367,
CVE-2024-35365, CVE-2024-28661, CVE-2023-50007, CVE-2023-49528,
CVE-2023-49501), due to improper versioning in NVD,
they are affecting 6.1.2 and hence we are leaving the patches in.

check the changelog mention below for information about fixes.
changelog: https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n6.1.2

This upgrade fixes CVE's hence remove those patches.
Refresh vulkan_av1_stable_API.patch as per new codebase.

Signed-off-by: Divyanshu Rathore <divyanshurathore2022@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 36 -----------------
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 35 ----------------
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 37 -----------------
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 ----------------
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 36 -----------------
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 -----------------
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 ------------------
 .../ffmpeg/ffmpeg/vulkan_av1_stable_API.patch | 40 +++++++++----------
 .../{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb}      |  9 +----
 9 files changed, 21 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
deleted file mode 100644
index 0f30c9ecf5..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Mon, 8 Apr 2024 18:38:42 +0200
-Subject: [PATCH]  avcodec/mpegvideo_enc: Fix 1 line and one column images
-
-Fixes: Ticket10952
-Fixes: poc21ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-32230
-
-Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/mpegvideo_enc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/mpegvideo_enc.c b/libavcodec/mpegvideo_enc.c
-index e460ca4..fb4aaa2 100644
---- a/libavcodec/mpegvideo_enc.c
-+++ b/libavcodec/mpegvideo_enc.c
-@@ -1198,8 +1198,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
-                 int dst_stride = i ? s->uvlinesize : s->linesize;
-                 int h_shift = i ? s->chroma_x_shift : 0;
-                 int v_shift = i ? s->chroma_y_shift : 0;
--                int w = s->width  >> h_shift;
--                int h = s->height >> v_shift;
-+                int w = AV_CEIL_RSHIFT(s->width , h_shift);
-+                int h = AV_CEIL_RSHIFT(s->height, v_shift);
-                 const uint8_t *src = pic_arg->data[i];
-                 uint8_t *dst = pic->f->data[i];
-                 int vpad = 16;
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
deleted file mode 100644
index f7f16a5b92..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0bed22d597b78999151e3bde0768b7fe763fc2a6 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 26 Mar 2024 00:39:49 +0100
-Subject: [PATCH] avformat/sbgdec: Check for negative duration
-
-Fixes: signed integer overflow: 9223372036854775807 - -8000000 cannot be represented in type 'long'
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_SBG_fuzzer-5133181743136768
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-35366
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0bed22d597b78999151e3bde0768b7fe763fc2a6]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/sbgdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/sbgdec.c b/libavformat/sbgdec.c
-index b2662ea..281fe62 100644
---- a/libavformat/sbgdec.c
-+++ b/libavformat/sbgdec.c
-@@ -386,7 +386,7 @@ static int parse_options(struct sbg_parser *p)
-                 case 'L':
-                     FORWARD_ERROR(parse_optarg(p, opt, &oarg));
-                     r = str_to_time(oarg.s, &p->scs.opt_duration);
--                    if (oarg.e != oarg.s + r) {
-+                    if (oarg.e != oarg.s + r || p->scs.opt_duration < 0) {
-                         snprintf(p->err_msg, sizeof(p->err_msg),
-                                  "syntax error for option -L");
-                         return AVERROR_INVALIDDATA;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
deleted file mode 100644
index 0061b7ad98..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 50d8e4f27398fd5778485a827d7a2817921f8540 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 30 Sep 2023 00:51:29 +0200
-Subject: [PATCH] avformat/dxa: Adjust order of operations around block align
-
-Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
-Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-(cherry picked from commit 50d8e4f27398fd5778485a827d7a2817921f8540)
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36613
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/50d8e4f27398fd5778485a827d7a2817921f8540]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/dxa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/dxa.c b/libavformat/dxa.c
-index 474b852..b4d9d00 100644
---- a/libavformat/dxa.c
-+++ b/libavformat/dxa.c
-@@ -122,7 +122,7 @@ static int dxa_read_header(AVFormatContext *s)
-         if(ast->codecpar->block_align) {
-             if (c->bpc > INT_MAX - ast->codecpar->block_align + 1)
-                 return AVERROR_INVALIDDATA;
--            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
-+            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
-         }
-         c->bytes_left = fsize;
-         c->wavpos = avio_tell(pb);
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
deleted file mode 100644
index 3f02c45b33..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 86f73277bf014e2ce36dd2594f1e0fb8b3bd6661 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 26 Mar 2024 01:00:13 +0100
-Subject: [PATCH] avformat/westwood_vqa: Fix 2g packets
-
-Fixes: signed integer overflow: 2147483424 * 2 cannot be represented in type 'int'
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_WSVQA_fuzzer-4576211411795968
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36616
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/86f73277bf014e2ce36dd2594f1e0fb8b3bd6661]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/westwood_vqa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/westwood_vqa.c b/libavformat/westwood_vqa.c
-index 03b2d9e..024f5d3 100644
---- a/libavformat/westwood_vqa.c
-+++ b/libavformat/westwood_vqa.c
-@@ -262,7 +262,7 @@ static int wsvqa_read_packet(AVFormatContext *s,
-                     break;
-                 case SND2_TAG:
-                     /* 2 samples/byte, 1 or 2 samples per frame depending on stereo */
--                    pkt->duration = (chunk_size * 2) / wsvqa->channels;
-+                    pkt->duration = (chunk_size * 2LL) / wsvqa->channels;
-                     break;
-                 }
-                 break;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
deleted file mode 100644
index 5d751213e3..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d973fcbcc2f944752ff10e6a76b0b2d9329937a7 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 30 Sep 2023 00:38:17 +0200
-Subject: [PATCH] avformat/cafdec: dont seek beyond 64bit
-
-Fixes: signed integer overflow: 64 + 9223372036854775807 cannot be represented in type 'long long'
-Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36617
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/d973fcbcc2f944752ff10e6a76b0b2d9329937a7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/cafdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/cafdec.c b/libavformat/cafdec.c
-index f5ba0f4..e92e327 100644
---- a/libavformat/cafdec.c
-+++ b/libavformat/cafdec.c
-@@ -271,7 +271,7 @@ static int read_pakt_chunk(AVFormatContext *s, int64_t size)
-         }
-     }
-
--    if (avio_tell(pb) - ccount > size) {
-+    if (avio_tell(pb) - ccount > size || size > INT64_MAX - ccount) {
-         av_log(s, AV_LOG_ERROR, "error reading packet table\n");
-         return AVERROR_INVALIDDATA;
-     }
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
deleted file mode 100644
index 63d08eabcc..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 28c7094b25b689185155a6833caf2747b94774a4 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Thu, 4 Apr 2024 00:15:27 +0200
-Subject: [PATCH] avcodec/wavarc: fix signed integer overflow in block type
- 6/19
-
-Fixes: signed integer overflow: -2088796289 + -91276551 cannot be represented in type 'int'
-Fixes: 67772/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_WAVARC_fuzzer-6533568953122816
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36619
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/28c7094b25b689185155a6833caf2747b94774a4]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/wavarc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/wavarc.c b/libavcodec/wavarc.c
-index 09ed4d4..51d91a4 100644
---- a/libavcodec/wavarc.c
-+++ b/libavcodec/wavarc.c
-@@ -648,7 +648,7 @@ static int decode_5elp(AVCodecContext *avctx,
-                 for (int o = 0; o < order; o++)
-                     sum += s->filter[ch][o] * (unsigned)samples[n + 70 - o - 1];
-
--                samples[n + 70] += ac_out[n] + (sum >> 4);
-+                samples[n + 70] += ac_out[n] + (unsigned)(sum >> 4);
-             }
-
-             for (int n = 0; n < 70; n++)
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
deleted file mode 100644
index afd857ceac..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 587acd0d4020859e67d1f07aeff2c885797ebcce Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Thu, 18 Jul 2024 21:12:54 +0200
-Subject: [PATCH] avcodec/pnmdec: Use 64bit for input size check
-
-Fixes: out of array read
-Fixes: poc3
-
-Reported-by: VulDB CNA Team
-Found-by: CookedMelon
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-(cherry picked from commit 3faadbe2a27e74ff5bb5f7904ec27bb1f5287dc8)
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-7055
-
-Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=587acd0d4020859e67d1f07aeff2c885797ebcce]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/pnmdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
-index acd77ea..40cc2ae 100644
---- a/libavcodec/pnmdec.c
-+++ b/libavcodec/pnmdec.c
-@@ -264,7 +264,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, AVFrame *p,
-         break;
-     case AV_PIX_FMT_GBRPF32:
-         if (!s->half) {
--            if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
-+            if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
-                 return AVERROR_INVALIDDATA;
-             scale = 1.f / s->scale;
-             if (s->endian) {
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
index 74db148b3b..be6c6b7416 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
@@ -6,6 +6,9 @@ Subject: [PATCH] vulkan_av1: port to the new stable API
 Co-Authored-by: Dave Airlie <airlied@redhat.com>
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/ecdc94b97f809d5f2b88640842fd0541951ad295]
+
+Comment: Patch is refreshed as per codebase of 6.1.2
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@kpit.com>
 ---
  configure                                     |   4 +-
  libavcodec/Makefile                           |   5 +-
@@ -26,7 +29,7 @@ diff --git a/configure b/configure
 index e853deb51d..9fa639fca6 100755
 --- a/configure
 +++ b/configure
-@@ -7300,8 +7300,8 @@ enabled vdpau &&
+@@ -7160,8 +7160,8 @@ enabled crystalhd && check_lib crystalhd
           "in maintaining it."
  
  if enabled vulkan; then
@@ -41,21 +44,19 @@ diff --git a/libavcodec/Makefile b/libavcodec/Makefile
 index 7ef2e03ca6..9ce6d445c1 100644
 --- a/libavcodec/Makefile
 +++ b/libavcodec/Makefile
-@@ -1258,8 +1258,7 @@ SKIPHEADERS                            += %_tablegen.h                  \
+@@ -1284,7 +1284,6 @@ SKIPHEADERS                            +
                                            aacenc_quantization.h         \
                                            aacenc_quantization_misc.h    \
                                            bitstream_template.h          \
--                                          vulkan_video_codec_av1std.h   \
--                                          $(ARCH)/vpx_arith.h          \
-+                                          $(ARCH)/vpx_arith.h           \
+-                                          vulkan_video_codec_av1std_mesa.h \
+                                           $(ARCH)/vpx_arith.h          \
  
  SKIPHEADERS-$(CONFIG_AMF)              += amfenc.h
- SKIPHEADERS-$(CONFIG_D3D11VA)          += d3d11va.h dxva2_internal.h
-@@ -1280,7 +1279,7 @@ SKIPHEADERS-$(CONFIG_QSVENC)           += qsvenc.h
+@@ -1306,7 +1305,7 @@ SKIPHEADERS-$(CONFIG_XVMC)             +
  SKIPHEADERS-$(CONFIG_VAAPI)            += vaapi_decode.h vaapi_hevc.h vaapi_encode.h
  SKIPHEADERS-$(CONFIG_VDPAU)            += vdpau.h vdpau_internal.h
  SKIPHEADERS-$(CONFIG_VIDEOTOOLBOX)     += videotoolbox.h vt_internal.h
--SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h vulkan_video_codec_av1std_decode.h
+-SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h vulkan_video_codec_av1std_decode_mesa.h
 +SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h
  SKIPHEADERS-$(CONFIG_V4L2_M2M)         += v4l2_buffers.h v4l2_context.h v4l2_m2m.h
  SKIPHEADERS-$(CONFIG_ZLIB)             += zlib_wrapper.h
@@ -866,19 +867,19 @@ diff --git a/libavcodec/vulkan_video.h b/libavcodec/vulkan_video.h
 index bb69e920bb..01a1de7d9d 100644
 --- a/libavcodec/vulkan_video.h
 +++ b/libavcodec/vulkan_video.h
-@@ -22,8 +22,6 @@
+@@ -23,8 +23,6 @@
  #include "vulkan.h"
  
  #include <vk_video/vulkan_video_codecs_common.h>
--#include "vulkan_video_codec_av1std.h"
--#include "vulkan_video_codec_av1std_decode.h"
+-#include "vulkan_video_codec_av1std_mesa.h"
+-#include "vulkan_video_codec_av1std_decode_mesa.h"
  
  #define CODEC_VER_MAJ(ver) (ver >> 22)
  #define CODEC_VER_MIN(ver) ((ver >> 12) & ((1 << 10) - 1))
-diff --git a/libavcodec/vulkan_video_codec_av1std_decode.h b/libavcodec/vulkan_video_codec_av1std_decode.h
+diff --git a/libavcodec/vulkan_video_codec_av1std_decode_mesa.h b/libavcodec/vulkan_video_codec_av1std_decode_mesa.h
 deleted file mode 100644
 index e2f37b4e6e..0000000000
---- a/libavcodec/vulkan_video_codec_av1std_decode.h
+--- a/libavcodec/vulkan_video_codec_av1std_decode_mesa.h
 +++ /dev/null
 @@ -1,36 +0,0 @@
 -/* Copyright 2023 Lynne
@@ -897,8 +898,8 @@ index e2f37b4e6e..0000000000
 - * limitations under the License.
 - */
 -
--#ifndef VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_
--#define VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_ 1
+-#ifndef VULKAN_VIDEO_CODEC_AV1STD_DECODE_MESA_H_
+-#define VULKAN_VIDEO_CODEC_AV1STD_DECODE_MESA_H_ 1
 -
 -/*
 -** This header is NOT YET generated from the Khronos Vulkan XML API Registry.
@@ -917,10 +918,10 @@ index e2f37b4e6e..0000000000
 -#endif
 -
 -#endif
-diff --git a/libavcodec/vulkan_video_codec_av1std.h b/libavcodec/vulkan_video_codec_av1std.h
+diff --git a/libavcodec/vulkan_video_codec_av1std_mesa.h b/libavcodec/vulkan_video_codec_av1std_mesa.h
 deleted file mode 100644
 index c91589eee2..0000000000
---- a/libavcodec/vulkan_video_codec_av1std.h
+--- a/libavcodec/vulkan_video_codec_av1std_mesa.h
 +++ /dev/null
 @@ -1,403 +0,0 @@
 -/* Copyright 2023 Lynne
@@ -939,8 +940,8 @@ index c91589eee2..0000000000
 - * limitations under the License.
 - */
 -
--#ifndef VULKAN_VIDEO_CODEC_AV1STD_H_
--#define VULKAN_VIDEO_CODEC_AV1STD_H_ 1
+-#ifndef VULKAN_VIDEO_CODEC_AV1STD_MESA_H_
+-#define VULKAN_VIDEO_CODEC_AV1STD_MESA_H_ 1
 -
 -/*
 -** This header is NOT YET generated from the Khronos Vulkan XML API Registry.
@@ -1379,4 +1380,3 @@ diff --git a/libavcodec/vulkan_video.c b/libavcodec/vulkan_video.c
  
 -- 
 2.25.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
index 3d766c3fc7..04356b9932 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
@@ -31,21 +31,14 @@ SRC_URI = " \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
-    file://CVE-2024-32230.patch \
     file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
     file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
-    file://CVE-2024-7055.patch \
-    file://CVE-2024-35366.patch \
     file://CVE-2024-35367.patch \
     file://CVE-2024-35368.patch \
     file://CVE-2024-35365.patch \
-    file://CVE-2024-36613.patch \
-    file://CVE-2024-36616.patch \
-    file://CVE-2024-36617.patch \
     file://CVE-2024-36618.patch \
-    file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22919.patch \
@@ -53,7 +46,7 @@ SRC_URI = " \
     file://CVE-2025-0518.patch \
 "
 
-SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
+SRC_URI[sha256sum] = "3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.43.0


