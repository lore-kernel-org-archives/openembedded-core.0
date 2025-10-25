Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12419CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 17:16:07 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.10045.1761412561460682532
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Oct 2025 10:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWQLYlFp;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89ead335934so139133085a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761412560; x=1762017360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN6oVxzKAXPTu+TFVhroKQwhww2n3VGJj6KBcSDnWKk=;
        b=UWQLYlFpJnfP/W2QbJ345GaZ9ZXDW6R0SGpoYTmwM+2CsTfRzpjF8zh6DfR2ocBgGn
         1mnM/HG4MH7ihFv1zsaQKvRbBa6g1ABWYk5MI90JZBsSuW2z1+xqaeFop4M/LXeptAHT
         zfKIdFfZ/t1VfEmjTLikn3rdnadgr+dpj/goTE5H3QI7FKzIXZP/F0kdqyOWf4OngxdF
         WO5ET/nP2I7EOHFoyD02CAFLrK+B8VZUl0uUAc1ui0U4+GcXHfssQh5BA519tdHzmKZE
         aXI+nanGVeeGPLSbTUQy2UTJ2mUs472zWbjTJI6hJx2Ld5TlMl8EA2yj8S73LvvxfVUj
         CS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761412560; x=1762017360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN6oVxzKAXPTu+TFVhroKQwhww2n3VGJj6KBcSDnWKk=;
        b=sOb6XKD/Z2k2EA288mO0D2eci2kWvFwx1ISeTOwuA5liGGOQgFC6/vNvexJeTBK45/
         B/iZtq0hpwzkFuCzln4aaIA6NJ+YNvlxIT+y4Fiz3zB1lKdvy7GzFovZJsd0Dj8RJNUn
         OCV6TcWXxEgKDrglCg33SSM9epXdxkutRflh9x76KTDjNA19eCnbLEVEg/OeGbA2gpGt
         BoKlvZSI/TFnWGJmqpMypOJVXPtQWxxL9b7tSuCbUCUB6dcVQ4M432j8w5IGdi4hb4lc
         kzr3Rhe2knmpRcRFkiEocujZIaihKCJLh1BrMilO2KT3FLQ96Fnm7q5fyHJjgGsbI+c1
         u1DQ==
X-Gm-Message-State: AOJu0YyaBUGt8ofap+sPG9pTdMrAcpf4h4kJSszN+u/v/elD9qOV5ng9
	cfSEggp8e5zzZHKnlDJmrdH5mrsTbVQedxJoefrTcXvul8tvZEivWLoz
X-Gm-Gg: ASbGncuRI3OoWJzNyqMicUuZZWLaZ6xN/V7nUzoyDU4PXDYEJQIZ6WMayoIbq5tro0N
	tYFKyuG790gOBLLanhtNqBT3CESxWz1Uzc1DioKwQMhBpIf8mA1u7E/4VoxRE6ohjqKR87obZln
	J1kQ0rFwHhwVqmDc2zGjq+TveYQ42tWDSC1gqtjQmgPtCgLsPCNXL9GrgjuUWhV3ySu3hQNn0Yg
	ANoyudk0JodfrnhMCrL3e3dSudDIOjtaXDI1LsUGg4XPO5LVCSuNYuZ7arD+YZMyvKyWADFgHrt
	AL2CrcSBB2dZiRPGdxbjl2l1nK058wQBs4vUm8yfY3wlVQLYQGa77D5P9lpowvNHQMOO/BF5bcC
	nXyJfNAesTH7RHjQDfYSaUKKKuyVLOdtwSQPCSrbcLlJ2rK5AQwSHDdJxU/2PHmjBdq9rV/d20B
	sBMBprz53LwEZOTWf87a2vCM+uSb7AtgZK8WR1qdDUYGkH0UgZx9D3cbkbeErIUhwrGIL1SwTyu
	e9ErhAcVXQUDLI=
X-Google-Smtp-Source: AGHT+IH5rC/lGRSgvpqB69MLeCMfgw5SGTZxc4iO5RIIYCoqyoTWhvoAfy3rQCHz5xjTAxgwf+1wlw==
X-Received: by 2002:a05:620a:4145:b0:891:89a7:d7cb with SMTP id af79cd13be357-89c105a8833mr1411756685a.38.1761412560300;
        Sat, 25 Oct 2025 10:16:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f262716efsm177769885a.59.2025.10.25.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 10:15:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.17: unify qemumips (malta) branches
Date: Sat, 25 Oct 2025 13:15:58 -0400
Message-Id: <20251025171558.2831684-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 17:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225310

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.17+ kernel cache is using a single branch for the mti malta
machines, which are what qemumips* emulate. We update our branch
specification to make them buildable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

When I created the initial 6.17 kernel recipes they were based
off work I was doing on kernel-cache master (6.18+) .. and I
completely forgot that I've reduced the amount of branching, so
we need to adjust the mips branches to make them buildable.

Bruce

 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 2180f0f36f..9d2f51ad41 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -9,14 +9,14 @@ include recipes-kernel/linux/cve-exclusion_6.17.inc
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.17/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.17/standard/base"
-KBRANCH:qemumips ?= "v6.17/standard/mti-malta32"
+KBRANCH:qemumips ?= "v6.17/standard/mti-malta"
 KBRANCH:qemuppc  ?= "v6.17/standard/qemuppc"
 KBRANCH:qemuriscv64  ?= "v6.17/standard/base"
 KBRANCH:qemuriscv32  ?= "v6.17/standard/base"
 KBRANCH:qemux86  ?= "v6.17/standard/base"
 KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
-KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta64"
+KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
 SRCREV_machine:qemuarm ?= "23c78022fc97ea5ebc19ea8fb86d324c23a6fbaa"
 SRCREV_machine:qemuarm64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-- 
2.39.2


