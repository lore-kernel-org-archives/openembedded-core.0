Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BDAD6D224
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.79047.1732733419436883398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kb334IUq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-723f37dd76cso103333b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733419; x=1733338219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWWaUv2S0ZFtwcxnhN4KxEwoAgYmfiuky8uvvv0AJwk=;
        b=Kb334IUq3ztsoG9VaUGgT1SzIhMZ8pRH/Yt75RHyG7i6qn9Hv4s3YcQBSt1+HqhNIP
         7UpzC9W9AahshVPW9dtfPQ1fkkidMln2aWFckGRlObaHwmeX3Kxa0wzoQVh/P78L0ci9
         kro+sVHhoR0Zpt2qd37Fb8W9tHZuyb2pBB3gryslMwQ893f8QoRSOYY8T7M80aG7sFhr
         sJrKXjntlJNigbceLbCiWdQj+lJrjIP47psSNNL5Owqp5qSKqiOa4csmWV7a+5NStKJk
         oGVOIK4yeposWz6iyzP61/eqE3ffIIQ+/8PDDC21naQpzsiyD/tkDc6FbgmitIrZJJxa
         nzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733419; x=1733338219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWWaUv2S0ZFtwcxnhN4KxEwoAgYmfiuky8uvvv0AJwk=;
        b=aBKCCoNLjm7nLlOfq8jqcJaG7kfScBwOBvaE2TvN/CcHbrCG+3poP7S+6Gn/PH+9s0
         IKUIzC+B4SmqwjoJPcyDkCbusHeYZ+MlG+ZascerBWCDpLE7RtqlhH7zIZ/slMQwHEA6
         uMYpZOv9muH0y7btArPmTMfqWg8Wsbe/uFWc68sr/nqSK3mxgiRJEAi82ZLWOYlcnhti
         B807iWuzAF7fb7wW4tTfHfQBhJ6LsSq6PgEVNs2mc6dYJ9hlXf/ouSqR9qrHXD93Li+z
         9s7BcSbj09PpApf2z3R+zBmfvXlSQ6ZxvwFZnEa2Sngpauynj0tk+TbemGZ9qhkmEyHs
         PPDQ==
X-Gm-Message-State: AOJu0YxPJpUcw+5NeQIRBe4NqHLNheRysKQblqo2PiQOuz+/v2aVJgN8
	cuRPpS1/7MZrT41aM1Bb/w75embW+NXm4+JOOaDY7v1M5F7PxgBhkDEbp43O1TxZNt8oVP7e13x
	y
X-Gm-Gg: ASbGncvN1v1iD2WMvoVS18X607ffBRvOsc/VmR5VArVkVgphJPC0xyyooStkXiHV+b8
	FNm/Xhb2zjmBYcDLi2DSq3yGVf0vClWA2JBaRkhmMvb+dRu13gBnJx5lR9i+wl9Nb+IbrH5hqrP
	rnR2WptjiXmi+eYPwro6mVgOgajhdcSNrrd/4x/tEVJz+tL/WSRTXs9fMSQ3FbBConP872gM/CD
	2kpEpbEB1MC83mgNrCGVK6HXxFUf1icnC3pGKU=
X-Google-Smtp-Source: AGHT+IELRJBKcsRXLftfkfPN6//V2rlVRP+WPcvf3mCRv3IFn7QJi/4u8FA9aomAOvR6oYES6yM+fw==
X-Received: by 2002:a05:6a00:b47:b0:725:99f:9732 with SMTP id d2e1a72fcca58-72530041cd1mr5547516b3a.13.1732733418634;
        Wed, 27 Nov 2024 10:50:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/14] ffmpeg: fix CVE-2023-51798
Date: Wed, 27 Nov 2024 10:49:58 -0800
Message-Id: <b6c00d2c64036b2b851cdbb3b6efd60bc839fa5b.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207947

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker
to execute arbitrary code via a floating point exception (FPE) error at
libavfilter/vf_minterpolate.c:1078:60 in interpolate.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51798.patch        | 45 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch
new file mode 100644
index 0000000000..6250486c05
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch
@@ -0,0 +1,45 @@
+From c9e6162554cc7d04a56e2edd1f6f1479c6f8b62f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Dec 2023 02:51:32 +0100
+Subject: [PATCH] avfilter/vf_minterpolate: Check pts before division
+
+Fixes: FPE
+Fixes: tickets/10758/poc20ffmpeg
+
+Discovered by Zeng Yunxiang
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 68146f06f852078866b3ef1564556e3a272920c7)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51798
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/c9e6162554cc7d04a56e2edd1f6f1479c6f8b62f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_minterpolate.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavfilter/vf_minterpolate.c b/libavfilter/vf_minterpolate.c
+index 97d0e96..9296e67 100644
+--- a/libavfilter/vf_minterpolate.c
++++ b/libavfilter/vf_minterpolate.c
+@@ -1078,8 +1078,13 @@ static void interpolate(AVFilterLink *inlink, AVFrame *avf_out)
+     pts = av_rescale(avf_out->pts, (int64_t) ALPHA_MAX * outlink->time_base.num * inlink->time_base.den,
+                                    (int64_t)             outlink->time_base.den * inlink->time_base.num);
+
+-    alpha = (pts - mi_ctx->frames[1].avf->pts * ALPHA_MAX) / (mi_ctx->frames[2].avf->pts - mi_ctx->frames[1].avf->pts);
+-    alpha = av_clip(alpha, 0, ALPHA_MAX);
++    if (mi_ctx->frames[2].avf->pts > mi_ctx->frames[1].avf->pts) {
++        alpha = (pts - mi_ctx->frames[1].avf->pts * ALPHA_MAX) / (mi_ctx->frames[2].avf->pts - mi_ctx->frames[1].avf->pts);
++        alpha = av_clip(alpha, 0, ALPHA_MAX);
++    } else {
++        av_log(ctx, AV_LOG_DEBUG, "duplicate input PTS detected\n");
++        alpha = 0;
++    }
+
+     if (alpha == 0 || alpha == ALPHA_MAX) {
+         av_frame_copy(avf_out, alpha ? mi_ctx->frames[2].avf : mi_ctx->frames[1].avf);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 80a4e5b96f..b8bd77972b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-31582.patch \
            file://CVE-2024-31578.patch \
            file://CVE-2023-51794.patch \
+           file://CVE-2023-51798.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


