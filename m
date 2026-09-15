Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3769C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:05 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4688.1789499007713360431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=BT4SJeCk;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939ca12ab70so11433485a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499007; x=1790103807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFpNoQAAfzqTHHTcLl+tQXgNBHyv41PhyabtFKz8VWo=;
        b=BT4SJeCkR+naiq+B5KMnkI4lmzjLo9d28J/acQjf/IGqk62Atm0Tf5EWQHr712BWrE
         GMMGasLHySBmXVkc7luZXDbUFkLwY/ACr9qjF5xPqsGrx/TF9OsmePMUYW2Fjj+CM/GS
         k1OwsmVeU4C1hn9XyyvaXYgM1JlQ+NO3e/2B/U0h9flCIMc7JlcbU+Rc8vtCUw39gTqf
         2gQCASDXPe+G6OGvAeFWrG391gb6h0YoLgmNetYB7rURtKreDsROt3q2fDLDre/Mc2v2
         0WDo5mKJCAj10T/JrPQ7r26D7vGoGygHBi4kuC4BNh0ZNX8LS1qwupAr4nw1SjSKFk8q
         WkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499007; x=1790103807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFpNoQAAfzqTHHTcLl+tQXgNBHyv41PhyabtFKz8VWo=;
        b=mH63n9A5c9Zd7gR0yhyON7O97PfrccEmftOhy/g2FEaOKAzU3AbAZW25Rya2kxaggc
         /choVfRQuWBPLmrb9RnSFFYtZgj2RM7Wo+T4OTkLti8t/Pd7sNb0y0CqCE81b5CqtOth
         pwoOOTrLWpsmYAtqglJFpTbJeyB1S4ZzJiyaY098gNqIp1EZfynKeSlEGLzGmfvEJtar
         6MN8HkwDsINwG2nJyeAU4XyxjrDoo0FnLDLJI9hA3qxdvMC1J1USl4FgDgTUdWqVogqT
         C9W8v/qZjRe0I1vSeJ0zuoXvrfyPErrJFB4VfDcH4A0g6h30oESlabP+GoMNO+rO2B9w
         SAkw==
X-Gm-Message-State: AFuF++l6ZCSI7eU0CO+sVsZe6gmz1G4YvCPmdW1RuGRTl6Fs08+yPA+0
	E97bXMOcaK2AgwIjQfWNckwbo66B+UrsSO0hgAj6TTR1eFMu/1KJu0FKnDOUIuN/yyc+5PuoNtg
	ZEu6N
X-Gm-Gg: AYBFou1BOS3hXDht1Xm0nOAiypSibrP6k02CGiko00hYlagPgA3oWJcPDWPbsYq+UfJ
	R8yL8P88kVpDdO0gj/uWMzR6wGuxC+4Lm7qlBX1FGJbTwn84vLJDl47Q8E+ibjEe0IOvMSmh3iC
	nW7Q/IwOZnr6y3pi2NLF2INAYIxwBn4gDJXb71v4RtbfmmI6GuzvhQfnaAc6YwEBAKEW5BDE2F7
	SEJNPDobj+gHIyNXzNn0EMlmbqtM4AonxXGvfX+MHV87TvR3BYGqlzGXh3Yv+4Lpe30f/j+QlZV
	JyfHQX5UMmtGHBPi4rYybA8hwuKQEFeSpBmCvGRt/Jn1YWPpCAtkoMLUZfPuWfe0G1VoFiH5l0M
	UF5Cimn4kEFVtoeg+YiRWFs2LEX3pF38iTHLadDqZPBmMZO2Clo/fJJ4SRQAr1z9tgg48sOi6dO
	7ymlMwczV2znFf8DwBd85oupUNd9n7y8kNYcl8nezObM1xfvVLKufPnnHvLrApg2G5qS+jM3/a9
	efYAROcCpEtbihDXndvZFQBb++uLdJ/w6uE63R7SVSI
X-Received: by 2002:a05:620a:890e:b0:939:869:a8bb with SMTP id af79cd13be357-93a29853301mr1127574685a.14.1789499006477;
        Tue, 15 Sep 2026 12:03:26 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781deec2sm28760585a.7.2026.09.15.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:02:55 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 02/14] tune-riscv.inc: add 'riscv64gcv' tune
Date: Tue, 15 Sep 2026 15:02:32 -0400
Message-ID: <20260915190244.2983746-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245877

Add a new RISC-V tune option which adds the 'v' (vector) extension,
compared to the default.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index f55c122fe3..3eb057680a 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${TUNE_RISCV_PKGARCH}"
+
 TUNE_FEATURES:tune-riscv32 := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
 
-- 
2.55.0


