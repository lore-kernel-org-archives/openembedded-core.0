Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3CFCF3963
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:52:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11911.1763571161933119963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5wSYXha;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47755a7652eso47256355e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 08:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763571160; x=1764175960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y9IEZudQRIzPZEYXHBFW8Dh1aE3pYx7WU1m+JuYUDw=;
        b=Y5wSYXhaHGndQjJP6Nl4+aExIUyl+/wC4J1JUJb2sICsdZLf5wuFu9/qMGjasKSNJv
         /fbchVjiu1OVUwk+OlH4/AOMs+mFFDNAmBH7mAUaVt1wTjCLc9GXn9FDiMMbZZ07B59A
         aDp6XKqteL2cUTPgdSUoZhzT7HgbQ5HD7WdV1mE9Oplru2Qwt4Q1nRsbRWMbpCvwP7zI
         mNLQ2zTV2j9W588K4h6Gf4LEZFmUgxgJgjwbPIJGIdW6tmzMPOMa4VkxepSiiVSN7GWd
         gbJ/b5suBJvhtobOLMX1zOOUu+ntdncnSGMQLt2z+NsnEHXchop1g/8V1N0FEhM+7roa
         dwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571160; x=1764175960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y9IEZudQRIzPZEYXHBFW8Dh1aE3pYx7WU1m+JuYUDw=;
        b=bjSJ86vX/TPLz+5nyJ916Vd4vvgWYPmX35QqL4jgCzbbyQGEtwckwenHntXfn1FHoP
         SAAYba6UEo4IRr/gSy6XYFxxKJE6cmQEz0s/G7yYB5kgQIkBQGmWGdWf2wUIVJNEZYls
         WyFR5Auc2NgtRpaKTBEjPxvcWjvx/7ViTRnmTYKg3LPzaC/Z+jBpDwiLnAMM8CkSXTox
         HGBVYZjKb2CeeEgrmWmVLUJMPtxig7K/FO5DCTd30drPM16K7y58h0Ff6oG5Rxw8DHrw
         JFxQZboyqcZDsOpMr/cjmv9DSWo4q5lTJHfYhqTtwwpAYbXmcyDFp2bzop+cBUK8tJM2
         HHZg==
X-Gm-Message-State: AOJu0YwBAGanQl/ePXLUGhg64UNlliKZ+4mKkvEJYl4mG3bV7g5dYpYj
	yo6wuImmLGhWoiszSWqj6neCzVwFTlTCl/U4swjFpS0ibh7tVQP4KDy/R3K/1dC+
X-Gm-Gg: ASbGncuqEIu0SMrAI+CTUUaVSSkqjClrWPjW+0B1ryJ4upztKPtUQN7Rr5HUa4nzpDW
	RPQROuyJ2QE9oM6sEVfhL0fY/KSVlzmYhdUUGnBVEMmqlqd9B93j6amzYfw8+lOt24l7LwPddbG
	B6an0S++HjfJ/A4uosKLL0GRl4y5oF4Xfbhcdt0jY3/t6S60AitPXTMWeuDV4rCvGWQ67oo6NdI
	ltbIpJOexS9b5sa2Bpd6y6RT48YudxPuuyVOjdDWCt4OrOh4KO8CCnplEVBYpw1Wmf1ZKLRyfDs
	MU3YyJXZDE8D5sgKqfvWKa/13z1Q2F/7PSsDQcZpCOEaPmnXSkYtPIhTKLA2ZnOGI7kFV7dyF/n
	wmBlUPtUAGAhYGkDGufrTXnoIr5zNH7YEef/aBHK08B3sZhHnAeNVl0O5ZuvKBFNPCmsu15IUTb
	3L2v6Ox6yuTBeJovUluM4=
X-Google-Smtp-Source: AGHT+IEZSO5x0TMnyZdAqy7PmpMtGDvgrBGzTNB3w6s59mQjextg2Mxs8w50ry7EX5lmeAWAmquVGg==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr208249715e9.5.1763571160041;
        Wed, 19 Nov 2025 08:52:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0faf295sm60961555e9.0.2025.11.19.08.52.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:52:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] flac: patch seeking bug
Date: Wed, 19 Nov 2025 17:52:38 +0100
Message-ID: <20251119165238.442767-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226572

While working on audiofile recipe from meta-oe, a test that is using flac
to convert a flac file failed with this particular version of the recipe.

Bisecting the issue pointed to a code snippet that later was modifed with the
patch that is introduced here: in version 1.3.4 there is a bug with seeking
in flac files, returning incorrect pointers.

This backported patch fixes this (and fixes the ptest also, that triggered this).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

