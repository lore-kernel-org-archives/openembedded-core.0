Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEC9E7718E
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.117201.1734559359744599006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q0CsQdkd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-728f28744c5so165970b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559359; x=1735164159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOqsWV8NpuSqcoKkLSb3BpVNKbp7VsogaCZRYKMZu1g=;
        b=Q0CsQdkdK3/KV8tPfxmvKxvrQGf47VTkhPhb9A/YjGvps4fdhQxvoUDp+L4xY7S/8r
         qVJkdFIkE8HKVaYOFUSp43DEdgofbGZF1j1irePxRlsdvqsSjfS7nRxoSlf6/sQK5ild
         9c+wWGUPM6hl8mziWuY31RjJFVIvmYCdtCuABNDvX9Ys9eSFulA3nwiqew+sq3zUFHqK
         gqyVe1OPdiobHmi3XAcrCjwJUS/Yj56rdCbyNEwU3rrrO789goao0K9HD/YZzgsOKQ9X
         TBVtUmsC15msTTCeaZ1q9l62/T8F/nZbLnjwY5WWlcVX3InHAsBayWhtqQIwUDtdoAZE
         5yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559359; x=1735164159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOqsWV8NpuSqcoKkLSb3BpVNKbp7VsogaCZRYKMZu1g=;
        b=h9m1sXzM+3QSxkwvR3bl3Zk3w59MVHmmt3HLlxp3U5FaiTFOZaEYQOyhPB0krBER0w
         zcv6jYjIm1MyYlp5/XcofTbcIWz4/MYntB1uevlMMHsNvv6PFrxvuwPxBnkohxOsARqj
         mDF6EPzY/xkfYpvqM7h2g0kAU0W9TTzKLeNiXmS0i0xxovbPNhAM4CJZWnSKvlK4mXOq
         CqOAaZhSq9gy9A9/MIT0OUXl0H/W4FrNGMnnmjk4T91VdCHfWLEBAsOytkzP9G5rRjCY
         CCWskduG5B77WVtVK6TWttzV2wRaZ0T8MjEGu+UppX0lTBklSOo7ruuiUtxFkyxLeTTd
         V/kA==
X-Gm-Message-State: AOJu0YyxSs54Ljey3JnGvvIndg0QA3f3RfXo9VmqE6/6MbwSSq8PjvKy
	Y/elRegqmYTLdE0uBQiHOzPvVbuVmz2gduK8795eq9lDLPRj2JkrEfRA4BLIxMI0N2/B6LmqLOU
	+
X-Gm-Gg: ASbGncusOD/XcHVq7MvuJN1WUqe/0ee2I0bqnI9uSYSbfmY3UeVhg7WJKb3TvymP8Do
	azSQK39jcNyy2HnDaAH3DHZd/B7MVyJe8w1jNRhXzuGLUZgxyHTr+NtAV2JY/3+R1+zGYCQ1Zkb
	bXgFtXpwelC9LwIqo4LnXf0S3VltGUnz0Cw4yNoEETB300Ag5+alERMTVgAU/nT8vBAoa8LZC0Z
	BY2G+fwtPVDeM3vIG7z5ALWK+aJ0+sXDNr2dnqnW9Z41w==
X-Google-Smtp-Source: AGHT+IFpyHLVOvqvqfxI4QQ9iYUkQTs5X/VZ7TUF5aIVOkKb16rhUbCTYmlyQ1jxjpVIvourvbwcxg==
X-Received: by 2002:a05:6a20:72a2:b0:1e0:d934:6189 with SMTP id adf61e73a8af0-1e5b487ec2dmr7735493637.31.1734559359008;
        Wed, 18 Dec 2024 14:02:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/10] ffmpeg: fix CVE-2024-35367
Date: Wed, 18 Dec 2024 14:02:08 -0800
Message-Id: <64d77d422d3c99d8a246ab03edfb54d9d185326e.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208884

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an Out-of-bounds Read via libavcodec/ppc/vp8dsp_altivec.c,
static const vec_s8 h_subpel_filters_outer

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
new file mode 100644
index 0000000000..a1bec43c66
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
@@ -0,0 +1,47 @@
+From 09e6840cf7a3ee07a73c3ae88a020bf27ca1a667 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Wed, 13 Mar 2024 02:10:26 +0100
+Subject: [PATCH] avcodec/ppc/vp8dsp_altivec: Fix out-of-bounds access
+
+h_subpel_filters_inner[i] and h_subpel_filters_outer[i / 2]
+belong together and the former allows the range 0..6,
+so the latter needs to support 0..3. But it has only three
+elements. Add another one.
+The value for the last element has been guesstimated
+from subpel_filters in libavcodec/vp8dsp.c.
+
+This is also intended to fix FATE-failures with UBSan here:
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Tested-by: Sean McGovern <gseanmcg@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35367
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/ppc/vp8dsp_altivec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/ppc/vp8dsp_altivec.c b/libavcodec/ppc/vp8dsp_altivec.c
+index 12dac8b..061914f 100644
+--- a/libavcodec/ppc/vp8dsp_altivec.c
++++ b/libavcodec/ppc/vp8dsp_altivec.c
+@@ -50,11 +50,12 @@ static const vec_s8 h_subpel_filters_inner[7] =
+ // for 6tap filters, these are the outer two taps
+ // The zeros mask off pixels 4-7 when filtering 0-3
+ // and vice-versa
+-static const vec_s8 h_subpel_filters_outer[3] =
++static const vec_s8 h_subpel_filters_outer[4] =
+ {
+     REPT4(0, 0, 2, 1),
+     REPT4(0, 0, 3, 3),
+     REPT4(0, 0, 1, 2),
++    REPT4(0, 0, 0, 0),
+ };
+
+ #define LOAD_H_SUBPEL_FILTER(i) \
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index dd95629648..94d4cb82d5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -38,6 +38,7 @@ SRC_URI = " \
     file://CVE-2023-49528.patch \
     file://CVE-2024-7055.patch \
     file://CVE-2024-35366.patch \
+    file://CVE-2024-35367.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


