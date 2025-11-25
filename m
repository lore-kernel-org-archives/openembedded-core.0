Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB6CD0EE34
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:20 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4251.1764104114465149082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KY07wi7I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so4030217a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104114; x=1764708914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAQJlYeA4Z3o0tkvXlT1yGfxn+6mIiwAIQhp2urkQEA=;
        b=KY07wi7InEeOXD4ir1SSE0CBHLdnCcyDAGa9npBGcjmx51e4EPaB44p3+3+stkOJGT
         DcQADA/4pvAo8EnjelL3JpbXmFbpJukXDTU2rWuKKEpUffgY/E+df4tTA2zweLy056Ml
         tionrgyUq6Nq5pvX1X0hD+TxgBhyqfFOqq4rJmA4lowjnAcmt6QNtxbAQbzR8YKSuMv0
         88jZXZxq5gysd8mReh9U9FTN1nvX0uMSKdE9RVvFDh0TZIn134dRX3EQrgWd4OZld+7t
         ZBvnkDK+ruCF9E6Jl7vsm7KK210eph2HkkfMHF8OrKm7szjqA9d8c1qxonBojFB0m3/H
         6oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104114; x=1764708914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAQJlYeA4Z3o0tkvXlT1yGfxn+6mIiwAIQhp2urkQEA=;
        b=bAG6Ik3o2ea5rVExxnwsxsN12PoV8ZLErY9c5yUpOUEOdc1l7xKYXLh3ECkpvS7O2P
         oM66Yv/vSmI6eP7Pz4bkESsOSvL5YZMijaEW5FU/EjVuVjvDHpyWc8Ovt+gvcyl5Ut23
         efzJ2Hi92vRz6bat3tZicvR2My7kTQxOe6LLXKxquhLt3I8twp319keCJFSw4fNo3FkS
         7gcwfHKjN1jiayyoJh1OX+u5BDstMbu6ADjtE4bWUFizFdYc8hXAKNmIz8cb3ZbKvBVJ
         WZvwvKSO/bPqTHrWUHiCc9CP5bc/h3EhO7HkrT9ryjhzwhtKgg1V7y1+MxqI5Sta3dGl
         15nw==
X-Gm-Message-State: AOJu0YxJsnyjtfcBnBOaZ3eVTKFMywC8BIS7y8QyxEu8sMZV+LLRRUPO
	e4BUCCydEHOwU1msk7a3w1gqGnM+wMFvI5RW2qlyGBXidAxRxVwEhoYxH2J61uGxbMZdCX9ivH5
	vGnTb
X-Gm-Gg: ASbGncvOGJX49cgebSCpHDQij/H7YokrscZpdBSm3pQYyytO4++Rz2thGrxoPL2p4zL
	15dUqkglSCOPfr+mKZMDZZkSp5vKA85rpCVCQOnE7gaBpsjGLr6uxtTtDWZTeqdAO+phvmlwPQw
	1UIhivytzZmIGPdop/J4+y3RhLIPuwJzPYZJiksAajFQ5ZhOM7MCyezZwtlSok8EhkKMaAxYvRW
	artrg3iebQP39n+Ct22i2i2gx1WxulQNM58Uzp9ZiimgefZ4kjcTy5Mtk99KXR31qL6ZdYXpNsp
	rcs7Q8Z8pzVcM6EdSEUn50G1wpfReIRRLnbfyY0lGC5EoXat8fCVdeTNxDWseMvPGlrIhc2WMmT
	USWwpqheKjtOPmMoVEo5zDflectoXVCctxspml/iH4njLfElQppHuAYNDVo5t8uDrrRFcTQiHt2
	jJXg==
X-Google-Smtp-Source: AGHT+IEHVToGhSS0XUD4eUbWJ2zsY3uGRcWBgM8rraa1jhidj2cP/FgicX3pqkCt2S37FOGgtc8VzQ==
X-Received: by 2002:a17:90b:164c:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3475ebe68f2mr3850192a91.5.1764104113598;
        Tue, 25 Nov 2025 12:55:13 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] flac: patch seeking bug
Date: Tue, 25 Nov 2025 12:54:52 -0800
Message-ID: <ceef3cde9b761b7b5de6f7b6b1fb8e99663af9ca.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226784

From: Gyorgy Sarvari <skandigraun@gmail.com>

While working on audiofile recipe from meta-oe, a test that is using flac
to convert a flac file failed with this particular version of the recipe.

Bisecting the issue pointed to a code snippet that later was modifed with the
patch that is introduced here: in version 1.3.4 there is a bug with seeking
in flac files, returning incorrect pointers.

This backported patch fixes this (and fixes the ptest also, that triggered this).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../flac/files/0001-Fix-seeking-bug.patch     | 34 +++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.4.bb    |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/flac/files/0001-Fix-seeking-bug.patch

diff --git a/meta/recipes-multimedia/flac/files/0001-Fix-seeking-bug.patch b/meta/recipes-multimedia/flac/files/0001-Fix-seeking-bug.patch
new file mode 100644
index 0000000000..dadedcc168
--- /dev/null
+++ b/meta/recipes-multimedia/flac/files/0001-Fix-seeking-bug.patch
@@ -0,0 +1,34 @@
+From 1817916388cd8180f4411e6d0eb89a8c6916dce6 Mon Sep 17 00:00:00 2001
+From: Martijn van Beurden <mvanb1@gmail.com>
+Date: Mon, 25 Apr 2022 20:29:57 +0200
+Subject: [PATCH] Fix seeking bug
+
+Commit 159cd6c introduced a bug that only triggered upon seeking
+from the start of a headerless FLAC file to the first frame (so
+really not a seek at all). Furthermore that commit did nothing
+else in any other circumstance. This commit fixes that, by both
+fixing the problem and the behaviour the commit mentioned earlier
+meant to introduce.
+
+Co-authored-by: Robert Kausch <robert.kausch@freac.org>
+
+Upstream-Status: Backport [https://github.com/xiph/flac/commit/7e785eb9a84f9147246eb2b0e5e35ec01db5a815]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libFLAC/stream_decoder.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
+index ef6da44..bc78645 100644
+--- a/src/libFLAC/stream_decoder.c
++++ b/src/libFLAC/stream_decoder.c
+@@ -3077,7 +3077,8 @@ FLAC__bool seek_to_absolute_sample_(FLAC__StreamDecoder *decoder, FLAC__uint64 s
+ 	upper_bound = stream_length;
+ 	upper_bound_sample = total_samples > 0 ? total_samples : target_sample /*estimate it*/;
+ 
+-	if(decoder->protected_->state == FLAC__STREAM_DECODER_READ_FRAME) {
++	if(decoder->protected_->state == FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC &&
++	   decoder->private_->samples_decoded != 0) {
+ 		if(target_sample < decoder->private_->samples_decoded) {
+ 			if(FLAC__stream_decoder_get_decode_position(decoder, &upper_bound))
+ 				upper_bound_sample = decoder->private_->samples_decoded;
diff --git a/meta/recipes-multimedia/flac/flac_1.3.4.bb b/meta/recipes-multimedia/flac/flac_1.3.4.bb
index 1a44718bba..6df0668783 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.4.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.4.bb
@@ -16,7 +16,8 @@ DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
            file://CVE-2020-22219.patch \
-"
+           file://0001-Fix-seeking-bug.patch \
+           "
 
 SRC_URI[sha256sum] = "8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737"
 
-- 
2.43.0


