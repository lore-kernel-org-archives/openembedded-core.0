Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E94C04A6A
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.39383.1690166033465697364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3kuTWqPf;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.178, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-57026f4bccaso48276627b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166032; x=1690770832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8hi0fFIMc7RGotE9zL4OeAXM05v46L0ISABcU6tVrU=;
        b=3kuTWqPfUvaJLGnQ3sRyAxal+3NivibSz3IV4UjPTnoTHNrf/0JhjpEA3q+RD/XCsO
         RindoRzJkE8FV8RIeDEu1Sav4O6+bl2s5zqzgba5B49jnU9KPKUX+G4IOU6KTo9FOYxA
         U1+J/UpO2c3aOVxK0Sds+L8uTerHcLVUnjZ1VoJmS5VFEjA82YaWErTF6EQK0P8yBFI5
         99jyhfwRQyXka/DSPqIKj85T68N+KxIWSUsInKY12UMLWXharg2Jq9n2x+MKwQxFmmLh
         FIk9Opey6yDv0E6mSFdyvmgF1wkq8e9K9E/pMVv1VI5dcP6jRYzzrHqzr3YZTqQmARsd
         0GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166032; x=1690770832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8hi0fFIMc7RGotE9zL4OeAXM05v46L0ISABcU6tVrU=;
        b=Nvo0IQpTkjLazGicpzb2f6N/H8FxWbRtWaRAxPh8qXX2aOf7D8AXRoMEXxcrE1ZN+o
         EZSsGlOV1hrq0vwx8uXHUui5pI2r2LRJ/WinbwqMvCYtCiTwSN54Toa/4DMLPlCL/WFb
         3Y410Haypbiizr/e7/A6fScVsF1gE92LDjUQyBBHOd6wMTmDeC9DzPpif8fAodqRoJzf
         AOqt4rOUhFy40pikTRkVpDLUoAKOs5T0vES0Ye+6PsWMN9QcL7Q1Plyz9KimMjkg8tsk
         7SS14CoU7xWAOCuycNKCWAuOOEdCHA9QzmXcg7XDLxbgXr2QtWGghfPehWatJGYIO+er
         fPbQ==
X-Gm-Message-State: ABy/qLagFNNuqNxSEX+nhsbSRSjC+QrVqC+8D1XwgH51rezJRZwfA1EG
	qM1fJ63N6Zt5UWBnB6MuxTSvL2pu3xL0o6nUwbZJUA==
X-Google-Smtp-Source: APBJJlGvXx8HRLEuYz46ltX1eHYp1J4tSbInFY1WER4cBh7yRleUlethdyssjabKbezyVykbAfLKcA==
X-Received: by 2002:a81:48c7:0:b0:56f:fcf0:2da3 with SMTP id v190-20020a8148c7000000b0056ffcf02da3mr5875396ywa.12.1690166032205;
        Sun, 23 Jul 2023 19:33:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] machine/arch-arm64: add -mbranch-protection=standard
Date: Sun, 23 Jul 2023 16:33:31 -1000
Message-Id: <a1119750e9b3b9fae4fa9698d2ea3710a5a73768.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184775

From: Ross Burton <ross.burton@arm.com>

Enable branch protection (PAC/BTI) for all aarch64 builds.  This was
previously enabled at a global level in the GCC build, but that breaks
the gcc test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8905639d1cdc5ce809cc5ecd9672f5e86bf8a579)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 0e2efb5a40..832d0000ac 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -37,3 +37,8 @@ TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}',
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}', d)}"
 ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}', d)}"
 TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
+
+# Emit branch protection (PAC/BTI) instructions.  On hardware that doesn't
+# support these they're meaningless NOP instructions, so there's very little
+# reason not to.
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mbranch-protection=standard', '', d)}"
-- 
2.34.1


