Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06F1C001DC
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.11716.1690052240985295411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Z94YtklP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6687096c6ddso1764066b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052240; x=1690657040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8hi0fFIMc7RGotE9zL4OeAXM05v46L0ISABcU6tVrU=;
        b=Z94YtklPhacMkwUyeQLijk4ZkOev4b8Z8/0lgrUlgh8tKsgedWD0066AiCt/JJ9+8j
         +ng/lgg2Tzwl3/Dv4Nya3IhCHvGSrklhLdvEOpYULQj7zCqiNYwiaKiBYG6DCyIh2VzL
         E4rYKqmlh52YZU48wpV8Vm+iG1hk7GJJZZ0xUuFO1xoftbJQMp291+OIuefymDGlxWIe
         tgQ2e4SNiHkPlf8YqiKv6zTOwvhYZTAoAFVBE3pUUJz/llFIEc2FwiQreQN70oTkgpHD
         KDh1U2PdhggzA3bIfZsYNlwMUocwaPup0XGpWj//Q+CG8LOqh575jNQYtejh1NJDHI8u
         DUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052240; x=1690657040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8hi0fFIMc7RGotE9zL4OeAXM05v46L0ISABcU6tVrU=;
        b=MKMndncZfhxQBm8cqfogPOGMWCydqWDTRxTHUcOUm0QCB7+eNwJWsF9ETJQqQKnJsK
         YJxa2MGcsrjFtMK+GalzPgvEtjj+/0XCl+UJRB0PDX3dyeO+bh3BHcfYIXmaZS+GNgv7
         54GkHVOOoT9LWKNmiJx6k/wraPfAdrHin9VPfoWmT727JaoaaQpg5IAiHt2fd7me10IG
         hHKb+cboWpCff2MgYGUFCtS+lrj/bh7I77Kr6cLTc3eP1huP+CZRqHg0wgqR7g4DxdQo
         6spSYnEJEtqQH7Io1HAWkCnjiXWrpSTTxc4v00XdCgJEIuX0ngvpyqQRa+IXNjLNI8Mj
         Jz7A==
X-Gm-Message-State: ABy/qLZEP9CviQ97aIyzMtIQIoix3oCiH83Yy2YCvg/1d/RIyLfUxB4x
	10AzvRVp7U0OcuDHt+NOQPRe2QmmMSXqePsuD44=
X-Google-Smtp-Source: APBJJlE+ljvIB9GyMS5qZr4v3257ctsr5pL/fnP6L5bu2dcQ2k3Q9FPe5kVsno7rCw34GvATgMFlJA==
X-Received: by 2002:a05:6a21:7890:b0:132:cb97:83e2 with SMTP id bf16-20020a056a21789000b00132cb9783e2mr4884300pzc.50.1690052240073;
        Sat, 22 Jul 2023 11:57:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/11] machine/arch-arm64: add -mbranch-protection=standard
Date: Sat, 22 Jul 2023 08:56:53 -1000
Message-Id: <63ce207e15bdee7708754a178a19fca64c4c0ee9.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184732

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


