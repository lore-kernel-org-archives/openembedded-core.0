Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2A3C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3290.1739304563336664938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gQ1As0vH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f5a224544so53139015ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304562; x=1739909362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxkYoN8zpOAZzSXpy7vmD4cknyWCZxCMHVDaY3FAmlo=;
        b=gQ1As0vHDwGySE9xL35zmajVyxv6XWh3maNa87E4RV0ssHv7OG1I3u6KRxwd4gifZ6
         EOXEG+4SLsOuhcivdnPeg0Cvw5yhfIhCpvFtEZJDFh+O+mjW6M6KBw8hhqPoZTnPXtvk
         GuTQGMDQGDN027eC+2UvQXaiOoUAVsjLp6N3qw270XrP9fmGEXBctsYHQ4dMw/UYn5rR
         nJ0K/H92Qs7Oq2YpC0kF2kLcerwtGS5mCHr+EDsVAk+C382zelVumItm2sGInM1hbsB3
         sYZMpbCefNYVV/Z5mrbvy1tGhpzJ/49JdB9i0uREx0FcW304jIcPT05AVM3OEdW/isL0
         ktHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304562; x=1739909362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxkYoN8zpOAZzSXpy7vmD4cknyWCZxCMHVDaY3FAmlo=;
        b=DzS1kXgf4CwyVMMz36zh2D1IWfPanVoTjVUX3bBCrMO+1mATUsawLc8Uf6Y55d9L9V
         bOI24bl1UqpIGOKQ07mDdheyZ/eMA33hkwYiKkV9TQ5plw3uLMQI/xIgMk5dBM+riOg+
         n00Pmf1HlhR7CkzS52q6kO9o4lpdSI8vFDUB9fBAX6hZrrje6nqfIoi3wo5miVSjxgjC
         phvD4Jv4J2uo4J0UKIBvg81jIZZiPE7YidZSR1kt+qKkPhgBBZc55mgtntlRMweIpkS/
         PTnGW9GAG8Rlm6CkzhflvXHwfeghBepHDwl1Xef/PM43rbfvOQwxommspmgC8bLfl5AZ
         mK3w==
X-Gm-Message-State: AOJu0YxUeKSXM+eNX3594V7LXkaafPJ77rjKM5rMudD8ERkczdUeh9WT
	KBNJ1hUTguk93z559k70Hr+Jp+K97ENvNDaBGfSnxqZu0bKqhbiCFfw8DW4UjshTfyraoMauDYH
	i
X-Gm-Gg: ASbGncsA4KY9gBjc83ksBvvPB63vaJG25Fl/0J3rBvYLumiaaSK39JX//HpeZIm8JUt
	M5C5NIc88RhaJOLm/c9i3beirGs1QrcrHjPHIF6B9gRz3EIuTQpn7H5bFdMvPYMkQbYxcVII+X5
	P7jbQ+LDeuntY2OyJtUfEW5A0aIQouya/hvOJU7mvTIx+PMDGTZ9S9YxCctGQgqTr8ebPfh9pLy
	JCRKER6HXSvNo2VkP9/nPM/woaWAb252bpOidFXztD+l437TCpo3WUuYEJDWRndGfC1UbdR5cL3
	JUYe
X-Google-Smtp-Source: AGHT+IEkEtD2XtRT9X9AlCuLeT34x7Jf4T9PjaPXVLvoCa1aCcy0n7xTbL9zhzx36ki9U5g8wXjqRw==
X-Received: by 2002:a17:902:d4c7:b0:21f:7077:2aaf with SMTP id d9443c01a7336-220bbc7b10emr11497405ad.44.1739304562548;
        Tue, 11 Feb 2025 12:09:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/14] ffmpeg: fix CVE-2024-35365
Date: Tue, 11 Feb 2025 12:09:00 -0800
Message-ID: <051bc7afc01e72d5ef0fc14683689ab45e4eaab8.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211170

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 has a double-free vulnerability in the fftools/ffmpeg_mux_init.c
component of FFmpeg, specifically within the new_stream_audio function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        | 62 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
new file mode 100644
index 0000000000..2b5646e07c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
@@ -0,0 +1,62 @@
+From ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Mon, 25 Mar 2024 16:54:25 +0100
+Subject: [PATCH] fftools/ffmpeg_mux_init: Fix double-free on error
+
+MATCH_PER_STREAM_OPT iterates over all options of a given
+OptionDef and tests whether they apply to the current stream;
+if so, they are set to ost->apad, otherwise, the code errors
+out. If no error happens, ost->apad is av_strdup'ed in order
+to take ownership of this pointer.
+
+But this means that setting it originally was premature,
+as it leads to double-frees when an error happens lateron.
+This can simply be reproduced with
+ffmpeg -filter_complex anullsrc  -apad bar -apad:n baz -f null -
+This is a regression since 83ace80bfd80fcdba2c65fa1d554923ea931d5bd.
+
+Fix this by using a temporary variable instead of directly
+setting ost->apad. Also only strdup the string if it actually
+is != NULL.
+
+Reviewed-by: Marth64 <marth64@proxyid.net>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35365
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ fftools/ffmpeg_mux_init.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/fftools/ffmpeg_mux_init.c b/fftools/ffmpeg_mux_init.c
+index 63a25a3..685c064 100644
+--- a/fftools/ffmpeg_mux_init.c
++++ b/fftools/ffmpeg_mux_init.c
+@@ -845,6 +845,7 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
+         int channels = 0;
+         char *layout = NULL;
+         char *sample_fmt = NULL;
++        const char *apad = NULL;
+
+         MATCH_PER_STREAM_OPT(audio_channels, i, channels, oc, st);
+         if (channels) {
+@@ -882,8 +883,12 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
+
+         MATCH_PER_STREAM_OPT(audio_sample_rate, i, audio_enc->sample_rate, oc, st);
+
+-        MATCH_PER_STREAM_OPT(apad, str, ost->apad, oc, st);
+-        ost->apad = av_strdup(ost->apad);
++        MATCH_PER_STREAM_OPT(apad, str, apad, oc, st);
++        if (apad) {
++            ost->apad = av_strdup(apad);
++            if (!ost->apad)
++                return AVERROR(ENOMEM);
++        }
+
+ #if FFMPEG_OPT_MAP_CHANNEL
+         /* check for channel mapping for this audio stream */
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index c3cfc87669..fb3f954904 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://CVE-2024-35366.patch \
     file://CVE-2024-35367.patch \
     file://CVE-2024-35368.patch \
+    file://CVE-2024-35365.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


