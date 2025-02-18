Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394AFC021B0
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.7200.1739913024803973346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jdus+86q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c92c857aso3750985ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913024; x=1740517824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUC/dHQEIQ15VzbMeKDjQNqWP/TVjuhdebFBH84lcp4=;
        b=Jdus+86qTFPCbynMK1BbDSr4U6skAkjdQMesQ52iCTNdghe2CgytWILrc7GAjpnrjj
         w3LbbmjNTM53fTsw7CyHFAGhtJylyM1kLRCWvDrd8BBvtoZRgYSlHNip5Jm0AivUppR4
         9Tc/ysnCKV4brcPk1v1deM4CSdkUJ9thU45hrwqix9C14gvAkUIN2kXFhPldiOlSHGtt
         A1kCuVTZQI99EUWDWGZrS/gwOd5T1+Wjftt2MNJGpOEvuLJjWmonuilhu+R7HR6o686r
         9csIUzABwoJCT01vhqNkRbhMu0JK9mkuzaDCBp/naXIFKLkSY3bJJ+/8EqXDIfZvtX27
         3xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913024; x=1740517824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUC/dHQEIQ15VzbMeKDjQNqWP/TVjuhdebFBH84lcp4=;
        b=D2oyt2Ut2fR7bIrAyIy2B5vVPFGpuZrcK34rmjAOl7lDXxivZdpbPrbY+UsjuGeUti
         J4o52nzxVt2nNOnHf1vNRj0+Wn72iR9xe79LR/yzsqzadO8fs66EKgjuaaGsyW9fij0M
         eGoDa740j0Qu3RJdYyzUJFcypSFAPqK//s/U3e66DIchl/P9c7keY8zYswo1cxg25Gr3
         FNz67aX44oWS/IUUbVSV4G+8D/Ek2d5/dKBaPnzUpZE+ljDzUnNkmZAz30mJjHFBPzpP
         XvC68uwjvBs7Lh96A87kiqZ1/eLeTf9zWPzApl+6TCWq3oLFrss/fMwfJh2Ov6EjhwyJ
         Xtgw==
X-Gm-Message-State: AOJu0Yx5L2DS6wbbL0Y9TladPdJ96XJbm1bP+tA0skoDKFP6fh3VomLI
	sqmIf+OgZelvz/qU31y/8uzIWSo5cK7VSLPyNWtu8OLK0cqPqsq9kLuYBMF5r4JShjtwfOHYbxg
	r
X-Gm-Gg: ASbGncs57fnP6MhiBo/O4K0n2dIz/7tD2+m72V00Hn5SPLPy1Kp6HzMrBwgWeOrV7Vw
	tHISegyMsHKrxS1m0p9F4Ln94QMonkuACO8uEila+h6FgxjzC0zjuWWgnOA5D921fEODXvh2fMW
	OgpZApCTPE3IbvD4qskRRAmqz2P6L/hDcn/WX4Fdo/3Xgl94kyDUhDb/q9+iEE8XqFlJb12emRJ
	KVDdgUGgOKL5j72zgxgi382nXglyJ0jUhkTjwFGvintwH1lfGP369R5Gqqq3FS25J4iPdt3GJ2l
	jPpMax0=
X-Google-Smtp-Source: AGHT+IEJdVtzfQEJbnngrNveXz9LUbFdfaiBYRVy0KLdl7s3wKqcTsy2kAo6N8t29WOd02dfjFfjDg==
X-Received: by 2002:a17:90b:2e03:b0:2f6:e47c:1750 with SMTP id 98e67ed59e1d1-2fcb4d699c6mr1933286a91.13.1739913023953;
        Tue, 18 Feb 2025 13:10:23 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/12] ffmpeg: fix CVE-2024-36617
Date: Tue, 18 Feb 2025 13:10:02 -0800
Message-ID: <d1234410663bf4ec8ef72c7ba929a984402503d1.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211648

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an integer overflow vulnerability in the FFmpeg CAF decoder.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
new file mode 100644
index 0000000000..8b4928d1ca
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
@@ -0,0 +1,38 @@
+From f0e780370cc1c437d64f10d326b1d656ef490b5f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Sep 2023 00:38:17 +0200
+Subject: [PATCH 4/4] avformat/cafdec: dont seek beyond 64bit
+
+Fixes: signed integer overflow: 64 + 9223372036854775807 cannot be represented in type 'long long'
+Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit d973fcbcc2f944752ff10e6a76b0b2d9329937a7)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36617
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/f0e780370cc1c437d64f10d326b1d656ef490b5f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/cafdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/cafdec.c b/libavformat/cafdec.c
+index d5668bf..aa56a5e 100644
+--- a/libavformat/cafdec.c
++++ b/libavformat/cafdec.c
+@@ -220,7 +220,7 @@ static int read_pakt_chunk(AVFormatContext *s, int64_t size)
+         }
+     }
+
+-    if (avio_tell(pb) - ccount > size) {
++    if (avio_tell(pb) - ccount > size || size > INT64_MAX - ccount) {
+         av_log(s, AV_LOG_ERROR, "error reading packet table\n");
+         return AVERROR_INVALIDDATA;
+     }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index fc92bb2ec0..b5b11496f4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-0518.patch \
            file://CVE-2024-36613.patch \
            file://CVE-2024-36616.patch \
+           file://CVE-2024-36617.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


