Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20C9C41513
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 17:53:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.437.1713549204023503020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 10:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vmd2ZxzU;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-349545c3eb8so1599365f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 10:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713549202; x=1714154002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l565lOL62z8UK67vIszLHShQzhB6uKbTpSb2A49TshU=;
        b=Vmd2ZxzUX7CzmOpWlk73onW5EkiYvcmtxegO6duWtBwCkNpY3AvXoRCRkEDJRuhed1
         vYhHnqbdURHLv9GoA9piVzgpcpwDiTG/s/Co9GCkIaFysc5OLKCIwSTeM7HDNyHC+V09
         BRvanYVAvXCyV/MsbouoJyhAQc4lEmPesalh2R6B88urZAbozyTjDShws8WkIUnHeYmj
         9q3LMUqoh4q7pRweDZRE9uN4jszemMWU9I6dJ7Y9u3pB4bUXrrM2VJHjoiWg6B4rucoy
         U+CB3Qwb1LomApgZf/GoEjfCPEf8e9qtSLqWOXRcHHTI8l49io2WwXBJlyykGrKmb5fC
         jsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713549202; x=1714154002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l565lOL62z8UK67vIszLHShQzhB6uKbTpSb2A49TshU=;
        b=qOj1QQSRhw3DeNyeubpLebdnnrAoXK1amWL9bT7gUdYetrSnGYLqq4GztLD3Hpi3wm
         n+c973wqm3hYHwH2TrqBVOoIN/97K5ZN3qLSAr/xDvwPry+lp+6/oO4bW7m5wkD6BG8h
         JeQabvssrrKsHSuQsQlive8aNQjFAMlkiOi2q6owbE+F74ea8Rsb+9ktTlyie2SKY0pB
         8EbCESsB/1MhDBe0rsscGYQJio8ULYydZXYVcXgZODoLgZLg8eiLubrQe/ZMaX839czM
         RgDTdcHDmqFuVOA+9OmT2MHC1d+zDBXsZWmVYhYr359e1nL73WZl2nDZNFkpriSd9MVS
         ZE7Q==
X-Gm-Message-State: AOJu0YzQz1dmgeYwpHs0b70s0h6JFtfJByMDi056fpzoqXm+EtuGmu5f
	vOPWbY6EtgvVhsH/u1gAsBO82cGtjKKBPr8tp4ZIA77jhG1I8WlVFJw6tN7o
X-Google-Smtp-Source: AGHT+IFYP062B5gkBEZ3LieNvFhl8C6ktgxAuEHUBgWpmDRX+HuvoKroqEGBTcb87xqIxDjgCXKM1A==
X-Received: by 2002:adf:ed49:0:b0:345:a899:61c2 with SMTP id u9-20020adfed49000000b00345a89961c2mr1864477wro.65.1713549202028;
        Fri, 19 Apr 2024 10:53:22 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id fk4-20020a05600c0cc400b00419c8e2bc3csm1405841wmb.6.2024.04.19.10.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 10:53:21 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] Revert "goarch: disable dynamic linking globally"
Date: Fri, 19 Apr 2024 18:53:09 +0100
Message-ID: <20240419175309.214181-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419175309.214181-1-jose.quaresma@foundries.io>
References: <20240419175309.214181-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 17:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198559

This reverts commit 827c60b79e7fcafd14e68870f6b69dcc48ac9c39.

Fixed with the drop of the linkmode

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/goarch.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 6899ec28e4..1ebe03864f 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -38,13 +38,13 @@ BASE_GOARM:armv5 = '5'
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
-GO_DYNLINK:arm = ""
-GO_DYNLINK:aarch64 = ""
-GO_DYNLINK:x86 = ""
-GO_DYNLINK:x86-64 = ""
-GO_DYNLINK:powerpc64 = ""
-GO_DYNLINK:powerpc64le = ""
-GO_DYNLINK:class-native = ""
+GO_DYNLINK:arm ?= "1"
+GO_DYNLINK:aarch64 ?= "1"
+GO_DYNLINK:x86 ?= "1"
+GO_DYNLINK:x86-64 ?= "1"
+GO_DYNLINK:powerpc64 ?= "1"
+GO_DYNLINK:powerpc64le ?= "1"
+GO_DYNLINK:class-native ?= ""
 GO_DYNLINK:class-nativesdk = ""
 
 # define here because everybody inherits this class
-- 
2.44.0


