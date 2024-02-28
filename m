Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3C2C54E5B
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.4488.1709145040868404378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2GkM8Se;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d22b8c6e0dso165891fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145039; x=1709749839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfCJLp/3IBf/BM5izmTEG5GoIlEpRHsw1bU8tuH7Tk=;
        b=H2GkM8SeX/lAQV+UHgw0A5GdIfoVE3qyGCWfilmNtsbUjvaeWKMp9QYvH3MaQpOiG2
         dG/+dvfPGgbBzsNihE+104JLzCXNbgTWYCfJAeX8bLAXtftL3+bVOvcZlMYxmAJIcG3m
         2hXlM1uD8x0P3I7mSPS6j8KjR/k5pb5uQ4M6O0VsmUzgZMlIEzWIFYzG9YWnqg6dDfFf
         O7tsnWYxUJXWHdbobMYPVs95PvICyG2n4RcldYC2JbTsYqOGAcgdhEAATF4xOapLHGiU
         WmiIdQXUV2hLTPycMYuVX9gNsJ2pdbyqZpM1AEOh7NSeh1LfGtB/K+6RDgD18PdtlwCT
         +ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145039; x=1709749839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QfCJLp/3IBf/BM5izmTEG5GoIlEpRHsw1bU8tuH7Tk=;
        b=P5JVlTA9g1VrN6Iu8xtBMSqxNj2IpYMS6/xi5SQWrofsOCm40Mloqzlx7ZNkAbFsHv
         +S/Q7h1+huV1P10xlJrjABRh/g5nwuRTUTPU9Zj2dtU2xRcdZy4iSiySv0Z1N+Z3C8i9
         jvoaKdZeauDfVOqX6QaOLkU1oyLA3Bzj3urg2qkNqRC2bjHYEneGg/oZ3N3vTfz7/vxB
         1VVj1aV+hfPdcPcqKl3I2fex4UueRtmrGNDU1om3jfgkhnWGmEEYRr+/ayJnnL6sZze3
         Uq5ecnuLAcurd+1EuIzxQRPC0qiutlBgxqEt6DwL/ARa5EjW8NnisUAcdDR9mFC0npsv
         W6bQ==
X-Gm-Message-State: AOJu0Yw+4qnB9Zw+iKc/bYehCcXHNrCjr13hupzJITmknihlG1HYKjbE
	JvgNR2YF8NI8KUigj3gSAXPEzDb4LIK4EZcIbkX55Rw/fsTh8S3iJDRRIuMy
X-Google-Smtp-Source: AGHT+IFBQuC2wb6M9vuAr1KSuwDAX2g4J/iFmMaMA+641FLTTT/pI42QiywAER0zs73qp+Q1lFUv/A==
X-Received: by 2002:a05:6512:4009:b0:512:fc60:38e4 with SMTP id br9-20020a056512400900b00512fc6038e4mr445327lfb.54.1709145038667;
        Wed, 28 Feb 2024 10:30:38 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm2005454wrb.20.2024.02.28.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:30:38 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH v2 3/7] goarch: disable dynamic linking globally
Date: Wed, 28 Feb 2024 18:30:07 +0000
Message-ID: <20240228183011.1495807-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228183011.1495807-1-jose.quaresma@foundries.io>
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196402

With go-1.21 dynamic linking cause a runtime panic:

| root@qemux86-64:~# go-helloworld
| panic: runtime error: index out of range [0] with length 0
|
| goroutine 1 [running]:
| flag.init()
|         /usr/lib/go/src/flag/flag.go:1199 +0xf9

In my opinion, this would be a good trade-off so that we can update and
leave the version 1.20 for the next LTS 5.0 since we are already quite
behind on the version available upstream which already has the 1.22 available.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/goarch.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 1ebe03864f..6899ec28e4 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -38,13 +38,13 @@ BASE_GOARM:armv5 = '5'
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
-GO_DYNLINK:arm ?= "1"
-GO_DYNLINK:aarch64 ?= "1"
-GO_DYNLINK:x86 ?= "1"
-GO_DYNLINK:x86-64 ?= "1"
-GO_DYNLINK:powerpc64 ?= "1"
-GO_DYNLINK:powerpc64le ?= "1"
-GO_DYNLINK:class-native ?= ""
+GO_DYNLINK:arm = ""
+GO_DYNLINK:aarch64 = ""
+GO_DYNLINK:x86 = ""
+GO_DYNLINK:x86-64 = ""
+GO_DYNLINK:powerpc64 = ""
+GO_DYNLINK:powerpc64le = ""
+GO_DYNLINK:class-native = ""
 GO_DYNLINK:class-nativesdk = ""
 
 # define here because everybody inherits this class
-- 
2.44.0


