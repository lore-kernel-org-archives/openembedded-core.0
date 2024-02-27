Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D2AC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:07:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9222.1709028472186834428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXyzPSXr;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412aeac6f2cso1936555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709028470; x=1709633270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfCJLp/3IBf/BM5izmTEG5GoIlEpRHsw1bU8tuH7Tk=;
        b=JXyzPSXrnWFJ/x13GLwyjPKnvcaQWxL29CBGZvB/HgBDE2l5hfiqNEY3k4UnlfIdA3
         wECGxaKJQ8nBMAbnZ4IQF2oB3/dYnKRmEWoPPjRnq5YQOg24NHE3W9BRmpefitgbwupk
         mtif2x6TwNdOa0ceyPD8o0HrzTVO3cCneoWTLk0ii0+AFou++QlZde12bIiXFbNXLhC+
         bQiTKG84qJunIMNU/L/biiQ6+RxA2lqiTUkyIpOriM6Fp/U8Tlk6+OOPe+EXrumE7+e+
         DBVRsIFP6YO3WuMimaX7pqFPLiB9zunv/OzXkRO4zRg7UZv2LO2zPKNHp1Jl95rAhxQW
         ij5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028470; x=1709633270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QfCJLp/3IBf/BM5izmTEG5GoIlEpRHsw1bU8tuH7Tk=;
        b=UlR9BfFQ5OhMFZFD+MEGmi43wZbvXdCgAn6/V64yfhkX4oMnBkRPsp5ov0tto5205e
         yqtjRmIcy5yU+6QsdC6MbGRUEVBpT6ZCLNkCzaJHDdC6tWWNyBGrt6AdvKO8aU25xohU
         5L1Bwt3UUYnzsbSC1ocKZ5Zq10c70pGPaiLyqY4QMNrPnobgN7HtibBhxLkixtK/vKQy
         k94nCNfLtOduOsRYs9oHBFxUVuhb+ioveFlYPn58sMU06AT66rGCQt6IvPi+RIeJrvw3
         N/RhHgqTwuVQAWST95gkZ3UFONd9dgT1rMxdL6ZR38fbd/SifXtJ4n3T+1y9AY9CI5Nd
         lrtQ==
X-Gm-Message-State: AOJu0YwJignjMiRC9mSX9c+bYkKIRlLgHgSFHSzSs/xzoMZHB4VyhHHs
	bi3JHbWzGZuEG6Qp2+XvE03fI4ltQM+zX/1wsPkzR1RkFUUEFI4rM4TnlL7r
X-Google-Smtp-Source: AGHT+IGmnKJOTbkA4TJIxTcpFtzTBuiwNM68SkqF7hzdmUESJKd9GmFePPt3a4B+BhKZg+IWMwjK5Q==
X-Received: by 2002:adf:f605:0:b0:33d:1427:5274 with SMTP id t5-20020adff605000000b0033d14275274mr6119799wrp.52.1709028470340;
        Tue, 27 Feb 2024 02:07:50 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b0033d97bd5ddasm10857918wrq.85.2024.02.27.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 02:07:50 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 3/3] goarch: disable dynamic linking globally
Date: Tue, 27 Feb 2024 10:07:09 +0000
Message-ID: <20240227100709.1154-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227100709.1154-1-jose.quaresma@foundries.io>
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196251

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


