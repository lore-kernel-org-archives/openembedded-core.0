Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D9CC02199
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:56 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.112966.1738663310252474980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=jdoUfJTB;
 spf=pass (domain: foundries.io, ip: 209.85.208.47, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so10074889a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663308; x=1739268108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPV4WaFSg3InX0m3mPZc2/yBjbuWGOVcye7PCfgu2bg=;
        b=jdoUfJTBLSC3nLR35UEcb6Ba0BdYDBkV7+9JuBcV1FiPUUiI3qgDQrxVrCbGPZjTcm
         BQ8Yutf1Ja3OVCMypdfFPGomXMc8vSNPPRRyoQRchXa2gqyJfMiNjCUu7k58cIAXHejX
         1s5g8jZuFvFltedXGXQLHZ0Gf1HR5hSKG6GUHgfmoNKh5WjOamb3cTT4ABVqZloN1Oir
         5QlroDsnts3hJEMB8mB9dAF1lt2vJ+30BpSEq5kAEi8Sc05L8OeT2vqF0HuXXh76sIL9
         EESNvmGAEOd4zSvy7x9nGeZvdl93OboZMS+9E2lOgkTeAI51ZG2BNuxIRlRA7FrAGr7G
         LMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663308; x=1739268108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPV4WaFSg3InX0m3mPZc2/yBjbuWGOVcye7PCfgu2bg=;
        b=ZyHvvgwX1awQW2RCRQHf4B7TRr1JoZMnWN9cmr4cZNoLGbDaEm6aSiTK3dml4HLBSo
         0l4F6vjp5UbLRk+6e60oMAzlhBfYR+ExoCeEVsXtPCDamVAynd3w6QTUAzzRb4wZacD7
         Q7eI4cDmYU+IPOCSGWDzCFwm8jHQBvyR/LxS7G4gBJPMFxUxPDfVB4k49afU3eSMHwc5
         D8JLNeQEpMTEw/G/eTUSNvmZ1NcGoC/Iq8c9CpUZPp74rtwl1wxYa/dHwyWVlET0M06O
         jTvyoqqYxwrEFkNxy69f5pfmnyl1KGIY7Ys7oBze8y6tnzxFbqnLOmn7EqH1wZvXpvxN
         zIXQ==
X-Gm-Message-State: AOJu0YwnG0yWoMM2js1htQGE7PYuc69CmKuyJl2Htj3XakGWDGyGq1PR
	p/qxUk2d0JtP68VItmBeK6KNYJoOKlsdciDGm3z7REmUHkYMVnBXwSPmPvSnkioZ78Z/yZD3/Jg
	WPUlLkw==
X-Gm-Gg: ASbGnctC0rgHzGXTtThaAhxcYqB46VB9TAm+gHxXdK04mUnCvgSTDnG23LcpR8vILLG
	nPppmkqEEBW5I5iBJQFsWBP652ma7nWOf7x/Pmuja753bJjAM9Faif2AmlTv+FQ2JmuEbLm03iM
	QBUTFxkBhBd1jJH9l7PYxSxUfX952+E4md9WUXr+3egMI7KJS0mtAWWMOoA8eZXNg8SO8QNsifM
	NvXN2skkRosIheyF4LMJBSdBpany8UjF9U4C7F02x1QQuf+AufzjviL+BEpO7aB7F4ca31msw5d
	cgmLkGUnzVMf7ae8g1tTeHs=
X-Google-Smtp-Source: AGHT+IFxNC2QNQaeP/KbCXnRCLrSKxFYaUSUBTpB0nuLLvxgWh6dtIh1WlnUNFM62Mn1M319LCzZpA==
X-Received: by 2002:a17:906:15c2:b0:ab3:84b5:19b7 with SMTP id a640c23a62f3a-ab6cfe174ccmr2541148966b.56.1738663308107;
        Tue, 04 Feb 2025 02:01:48 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:46 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 6/6] rust/README-rust.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:14 +0100
Message-ID: <20250204100114.3749576-7-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210761

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:

$ cat ./meta/recipes-devtools/rust/README-rust.md | mdl
(stdin):1: MD002 First header should be a top level header
(stdin):25: MD006 Consider starting bulleted lists at the beginning of the line
(stdin):3: MD009 Trailing spaces
(stdin):11: MD009 Trailing spaces
(stdin):26: MD009 Trailing spaces
(stdin):39: MD012 Multiple consecutive blank lines
(stdin):32: MD032 Lists should be surrounded by blank lines
(stdin):36: MD032 Lists should be surrounded by blank lines

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta/recipes-devtools/rust/README-rust.md | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/rust/README-rust.md b/meta/recipes-devtools/rust/README-rust.md
index 209836ab65..a7e19c506e 100644
--- a/meta/recipes-devtools/rust/README-rust.md
+++ b/meta/recipes-devtools/rust/README-rust.md
@@ -1,14 +1,14 @@
-## Introduction
+# Introduction
 
-This provides the Rust compiler, tools for building packages (cargo), and 
+This provides the Rust compiler, tools for building packages (cargo), and
 a few example projects.
 
 ## Building a rust package
 
 When building a rust package in bitbake, it's usually easiest to build with
 cargo using cargo.bbclass.  If the package already has a Cargo.toml file (most
-rust packages do), then it's especially easy.  Otherwise you should probably
-get the code building in cargo first. 
+rust packages do), then it's especially easy. Otherwise you should probably
+get the code building in cargo first.
 
 Once your package builds in cargo, you can use
 [cargo-bitbake](https://github.com/cardoe/cargo-bitbake) to generate a bitbake
@@ -22,17 +22,19 @@ contained within it
 
 ## Pitfalls
 
- - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust
- configuration options are tracked for different targets. This is the reason 
- we use the Yocto triples instead of the native Rust triples. See rust-lang/cargo#3349.
+`TARGET_SYS` _must_ be different from `BUILD_SYS`. This is due to the way Rust
+configuration options are tracked for different targets. This is the reason
+we use the Yocto triples instead of the native Rust triples. See
+[Add the ability to provide build flags for the build-script-build #3349](https://github.com/rust-lang/cargo/issues/3349)
 
 ## Dependencies
 
 On the host:
- - Any `-sys` packages your project might need must have RDEPENDs for
- the native library.
+
+* Any `-sys` packages your project might need must have RDEPENDs for
+  the native library.
 
 On the target:
- - Any `-sys` packages your project might need must have RDEPENDs for
- the native library.
 
+* Any `-sys` packages your project might need must have RDEPENDs for
+  the native library.
-- 
2.43.0


