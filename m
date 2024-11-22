Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FD7E6ADCA
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.35423.1732310834532418872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gp68EWah;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-212776d6449so28610215ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310834; x=1732915634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fueMqMCKDe85k+POB8l5aEAMzTjCgxArBwaFFgllnEk=;
        b=Gp68EWahgC8MgbAC+WEAsEvzqKAxj0SExZd4Y2LroVKHKEDJ4ZtNvMtwzUPdYXOe+E
         eoXZm6obRLy6Ke8Cfss+A1+pKA6SlxbU6SoEYHnYvBRkl2QlcVPP5ICvVqvV5NcO68Sc
         oEuYI0CMfQFFeHeblwiiLs06+I0FI6+u4ojfOu0rovvb6gTd5PZQ+AetvuQ4XygOfkAO
         x8PX9hq2Qn0TZt6ETYkkpuubzaXH99WW5BdMBI7bfi507pV3jHH7ahlxoo9FNchi4Yzg
         +oaHrpWa5qQv01EGXP6oV1JD306vNoTp1VfmNI8TueQoCSswY6uRW1dygUNnGDSTgWf0
         OpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310834; x=1732915634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fueMqMCKDe85k+POB8l5aEAMzTjCgxArBwaFFgllnEk=;
        b=KUQ948tFBznpB2pODB6NLeA/jCk9MVT1MScD/Piry9OTV96CWCU+/tp7VPm9Dvcsma
         uDDXlpUL5i9zji//t39ESzwqmv9lUi5oYKkUAWs3Xfg7pzz/YPPxey9jAcmSj55W+6Eu
         zv0O4HB4o+xvBEbpB730Q6Iph2g7FXZuUxjz6J9tHbtrjeoGT3immSmNU1J45/FTpXIi
         pDZqTRD3m5Bh7TTdgxIT05Ht/rTn8n4gwJeKSncTIAcfrKoGvF8/13lfN/z2MMGJzwlD
         fQbmLuWw3Kt/MozQOTxeRkCXnxPSetPY+d9gjQy4cteN3zlf4phsPSz7u8sDV66MZZBd
         5hpg==
X-Gm-Message-State: AOJu0Yxj8iAIjxqNr/ROC289oKwegjvXnRShjLzAZr/dzyPOwLdbV2QV
	jWCA8iFHofCgbqNdcBeiOeHpput2uN6xlr4ToonxreubZxNyMpLHzJ4WinsqgWw1MyoN7C7f4hz
	+
X-Gm-Gg: ASbGncsFiB3KkVsgISs1ouVoqtE/Zo5FLZfGbdEZt23+L8eNtLaIupeA6FwJSspCh39
	sdCNJMkEhoV2lMDeB51eGylz2s7YCaTiE6O/q4MsgWErW3BgYrDPpAoS0Lw4eeMsfnPIFAODFVf
	wo6JGfGmcDulayiEOxB/UAKh6uwXoxab3VIixFyPCkLC9mfTEIB1Nf6Mpf6QP8302vWjDPvnjBp
	LoRZrPTaLn8oig+Vdr5ycCXyU4pi5BU3s3afvc=
X-Google-Smtp-Source: AGHT+IGIzFRo4UhG2CDNDUD3IoS72bu0qKmhXGZIDGP04p5cqU8UGFlhG0HeNiA+OBM5Ka9RtdndmA==
X-Received: by 2002:a17:902:ebc4:b0:212:5120:f212 with SMTP id d9443c01a7336-2129f51d710mr63040585ad.5.1732310833855;
        Fri, 22 Nov 2024 13:27:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] llvm: reduce size of -dbg package
Date: Fri, 22 Nov 2024 13:26:36 -0800
Message-Id: <13a2f43920c53f9f1bc5ec52eba9eb48da265ef6.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207667

Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
the debug symbols

  Level 1 produces minimal information, enough for making backtraces in
  parts of the program that you don't plan to debug. This includes
  descriptions of functions and external variables, and line number
  tables, but no information about local variables.

This makes the sstate objects a lot more manageable, and packaging
faster.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 6c2e8a5570..8dcd124c71 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -94,6 +94,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
+# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the debug symbols
+DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
 
 do_configure:prepend() {
 # Fix paths in llvm-config
-- 
2.34.1


