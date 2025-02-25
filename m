Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86303C19777
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9104.1740493833643245943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kH5KB9/Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220f4dd756eso119602715ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493833; x=1741098633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcK+UlkJ9DuzJ7veIu7ZXfJqtlJ76omeUzGDWV1ApI4=;
        b=kH5KB9/ZXbf6/oOSfaVGZhv5u3b8Ov9dJavMA+iUWA58C70kOCjfDU5N5yJjZy/hjn
         /wkXYTx5yEzflJP/D8CVuSP9gPJPXR6iB74HaXFB0+xxsZDFnCLIIJr0pW9NqcZs0qJF
         t/Wz7ULeMy4Iyu6wK/TPhik/1e8zrfqm/U4lwHjOyqoMK1HhO6vkIWWpfonCeokhZTzD
         +Q3bZOejmKtIBI3ijS+Igc+SQOxje7QQjQ/4Q7QVRbilJZ9dVjdXHTB/dN+QP4PBOoBQ
         dk2MqlgSPjSychPQly7z+hqJ/oLvGAjedWeVjk9SjoW1TlmfUHj2ZJiGMcOFKsU/yfCa
         /M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493833; x=1741098633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcK+UlkJ9DuzJ7veIu7ZXfJqtlJ76omeUzGDWV1ApI4=;
        b=tzk/KSsAAJA8sG9p3mrajft7DQMln2gU7D2cmTHRXZ6Rt0uLNevVFCbhQ1pYH/uA48
         /w4aOt768kim/l7GOKARw1TyM5GXHeSVsOZvm6pfICII1xHqoYKXhVyiXP3t+xp4jHxZ
         /kubzVTox5ChM2R4RoioKGZvROhDOvVvzoC9LMMRw9fsASjxvU9yDa1SXmzRsDQ6hkKB
         89kmInpymANIOzCipWMDTbkAgfiHlNX+bl51+04O0qML2NiiYnxzlntxAZG7fpxIqUlY
         MGn1HN+vs/SFoHLcH7bm3qFdm6RRpmO7iy8RnAjXAWh2faLtXFownpRtMVI9RKzoNCt1
         l3HQ==
X-Gm-Message-State: AOJu0Yx5BGChfKyz9Hs/77jpPYoWrWnx7dAa2alMDIXvoDZKeHcQ2bFf
	OnoErl8mWeTmP1aFolWLxO+zazM6g6rPH4Yz06Xo3rI4UQrPQaI+6oPAUKvedV3qTTeBLDgCD0j
	g
X-Gm-Gg: ASbGncsNdw6SGOhKlISopPxg7x2BCxocr3kO+kRmbVU0n0+KtjsDoo8p669qtwXcwF+
	Btt+5qy9iKKic/cQ/N7iY84M2x1nh46moV2UzH/lzWTIncoqPUnu8zweM0r7RGqB5E5+rMOHO9m
	StY0WF4vyi0ME6ZQ89x05usVFUwZ8lxosQtBvwTMAr/C4K7gnVJqsyjM5IFU2uoAOsP90MxIQhg
	wKbywhqdXUBsCbd7ehmcYgPcQIs2YYK8ghJEcXOUJpRw9rk+7Ej5pS9Vgn0bLrrUmBh/79dPDAw
	dG343VZelyHDlPdgOg==
X-Google-Smtp-Source: AGHT+IGVJq093sUAIbslkl7ARF692UvPcmEagfgknWMg/HPcscxQF9TrNL7IbyYpE5pd/0KCHFFGeQ==
X-Received: by 2002:a05:6a21:3985:b0:1f0:f983:6cbe with SMTP id adf61e73a8af0-1f0fbff6980mr6658251637.3.1740493832876;
        Tue, 25 Feb 2025 06:30:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/22] ffmpeg: fix CVE-2024-36618
Date: Tue, 25 Feb 2025 06:29:53 -0800
Message-ID: <46680bed23ef6f529c7e554b5611a7c098fce8a9.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211903

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the AVI demuxer of the libavformat library
which allows for an integer overflow, potentially resulting in a denial-of-service (DoS) condition.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
new file mode 100644
index 0000000000..941b38260a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
@@ -0,0 +1,36 @@
+From 7a089ed8e049e3bfcb22de1250b86f2106060857 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Tue, 12 Mar 2024 23:23:17 +0100
+Subject: [PATCH] avformat/avidec: Fix integer overflow iff ULONG_MAX <
+ INT64_MAX
+
+Affects many FATE-tests, see
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Reviewed-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-36618
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/avidec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/avidec.c b/libavformat/avidec.c
+index 8584b4a..b0fe7df 100644
+--- a/libavformat/avidec.c
++++ b/libavformat/avidec.c
+@@ -1682,7 +1682,7 @@ static int check_stream_max_drift(AVFormatContext *s)
+     int *idx = av_calloc(s->nb_streams, sizeof(*idx));
+     if (!idx)
+         return AVERROR(ENOMEM);
+-    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1LU) {
++    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1ULL) {
+         int64_t max_dts = INT64_MIN / 2;
+         int64_t min_dts = INT64_MAX / 2;
+         int64_t max_buffer = 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 900545a5f0..aa317513a1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36613.patch \
            file://CVE-2024-36616.patch \
            file://CVE-2024-36617.patch \
+           file://CVE-2024-36618.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


