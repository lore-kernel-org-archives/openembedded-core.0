Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69000E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.20168.1736256699263280810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gi4ylT3f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166022c5caso201114515ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256698; x=1736861498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7KY+dKQTYVZlPHcDPgnaCm9Q6K8PLj1/Snv4vD4UUs=;
        b=gi4ylT3fxWrI6KHxgcNnNwfySFsK+Tt9MsT2xr97vQngYyxJwtggTJyaOpEQBPz9hV
         sdsP8YP6oa8/B0AYXQUqJNe99Vn50bNe3LYRqwA1/M0sOFubRr54+dU+RiHyLVsTbyod
         84We8FfG0fnf2qRevenqF/DvXJ2uLlRhEqfYi5xdlONmmSKTiFyU9ZRWKQ2QR91ffD3y
         QqabHvVuk2o3f+58U1HMb7l7+sUuM2Ql3RaSPI1q3PnsgOEPKyJVgtCR05qs7T8RmRZS
         EwFfFpP75IJoFYNZswwbZEvb4aioiNPIUJ7kxTeWR3YZj5LAq/84dr6zvEsIBZZVamtv
         3nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256698; x=1736861498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7KY+dKQTYVZlPHcDPgnaCm9Q6K8PLj1/Snv4vD4UUs=;
        b=HIz8XCwGnk3KcjjLXJYlE9KJhkKqSeoycC8PZMx5SO6tJQn/BVwnBwn072Hlt8OBT/
         eqTA0RZVKWwmkXtDaz2Qij+/sfwP/CEk9AXfypxXA+HXpHs5BVrIIrkfdOhkLJ8lMUwe
         EqF6aS1OnhiIAmLLuUIEOjtJxuI9rSXWt8Sp6qtbCJzJnPfuupbLMMBDo9xJ1DpVwF5Z
         VfMAzki7Hc8C+dLjxmW7HlJGpt0G1FunZ+TIX81FqcGDk0cc5Ro7qqL3LQqkPO7mCXjd
         7FF5xt8EwVkqYJ1g4QEqs9HXqDj/OSDevk1GkDtXPSNT2K54rAIPa7Szo2bVAoGSSGW/
         lPgQ==
X-Gm-Message-State: AOJu0Yw5C8WS0aq+cL0bn5uiQKvItqsv5W+MOWqqzba62rUA6Hlt4x4D
	2MxWGTHq+9NbbNTspARhTUV1nWGkULpzpc2+DFvDE8bOR/YZ/U40XPH5Hp+RG6XZnrhGokraR7O
	U
X-Gm-Gg: ASbGncsi9GjCUkTueg5g6qCXWA2LjUXtTSQB3+XFL73cjL4r1nbo5Fo/GhnceZ2FLOa
	V0w27WSwPa/N67l0QsS9LXxVbdHYU0GKIrTn+S/7ix/rk0PXm+oVa8Tw1fiC6GtDdbZRMFlGmaI
	oAUzVTH5oD7kVIhHRGb3+kbJZR2NU0tinfV4smfX9445v4VLL76758f6Aiv/xaWev87Oitqv+as
	yMmamCEqBql7UBNp6TvENjPfTcGKj9b+h0G543k41CHtA==
X-Google-Smtp-Source: AGHT+IFQwvD3pTIEnh9+Mb7zTxc6Cx2GUmXX4oVr84ftWXN5ooblVodwSiSoKMBmALYn89f3OyyUyw==
X-Received: by 2002:a05:6a21:3a85:b0:1e1:c8f5:19ee with SMTP id adf61e73a8af0-1e5e04945e8mr99255533637.25.1736256698502;
        Tue, 07 Jan 2025 05:31:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] ffmpeg: fix CVE-2024-35366
Date: Tue,  7 Jan 2025 05:31:13 -0800
Message-ID: <9acfc54b2707bf04922f153d06ae27ff552fbe23.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209462

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 is Integer Overflow. The vulnerability exists in the parse_options
function of sbgdec.c within the libavformat module. When parsing certain options,
the software does not adequately validate the input. This allows for negative
duration values to be accepted without proper bounds checking.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
new file mode 100644
index 0000000000..f619dd6eac
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
@@ -0,0 +1,37 @@
+From 4db0eb4653efad967ddcf71f564fd2f1169bafcb Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 00:39:49 +0100
+Subject: [PATCH] avformat/sbgdec: Check for negative duration
+
+Fixes: signed integer overflow: 9223372036854775807 - -8000000 cannot be represented in type 'long'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_SBG_fuzzer-5133181743136768
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 0bed22d597b78999151e3bde0768b7fe763fc2a6)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-35366
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/4db0eb4653efad967ddcf71f564fd2f1169bafcb]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/sbgdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/sbgdec.c b/libavformat/sbgdec.c
+index 1ef50e1598..fdcee0b452 100644
+--- a/libavformat/sbgdec.c
++++ b/libavformat/sbgdec.c
+@@ -385,7 +385,7 @@ static int parse_options(struct sbg_parser *p)
+                 case 'L':
+                     FORWARD_ERROR(parse_optarg(p, opt, &oarg));
+                     r = str_to_time(oarg.s, &p->scs.opt_duration);
+-                    if (oarg.e != oarg.s + r) {
++                    if (oarg.e != oarg.s + r || p->scs.opt_duration < 0) {
+                         snprintf(p->err_msg, sizeof(p->err_msg),
+                                  "syntax error for option -L");
+                         return AVERROR_INVALIDDATA;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 7b03b7cbc0..39d79c343d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-50007.patch \
            file://CVE-2023-51796.patch \
            file://CVE-2024-7055.patch \
+           file://CVE-2024-35366.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


