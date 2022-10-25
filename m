Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65947C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 18:44:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.1863.1666723480570315131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 11:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fSB0jDCG;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a14so19845822wru.5
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRPjHzIRujiJlOYuWv0paCS4vJUNJuVn2p/NJ5urmV8=;
        b=fSB0jDCGCXY3zGNFieJ0ld+RlYbMxD2fkbLegB63al/RhTB73caGH9qvYzsZyVkDPR
         c4ckqjtZMVHFYiPsryPqe1BTq/zG9xbd0mymWG7mnTe+D6KX8lSq6+219SNYlsziDlV2
         qXyICw//rOP/TW5nqYRhv5YuXgzBqxnKW5czfhCCMtoy4G3pA2/p3IxSVSCppQFV4ie7
         KhzQyjWiaoDC3FQjYoX3xXhC0EB7n8fHu3QL8CBiTz/WbcdTVKDelAX20uIvJQadx/K/
         tkKJn/naozLQg2Lolt72b7raJ2FtsnL7jn1mtCPPRDKM3lfHXo8GAhfryae9/9/NZTRH
         mq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRPjHzIRujiJlOYuWv0paCS4vJUNJuVn2p/NJ5urmV8=;
        b=5V9cEgMmravKghETXIF0/5W2g6q7gOmf7LXB0DyYuBTCpzhsFoVtPgfBISMWea7ANY
         HKc8vU17mC0jVYfGKSj9nQrTpZ1Fq5VrAUSNnteAkgeiBc69TDQDO98dZw1ZKJMJfFp9
         94zrr578bmQt2mWJzr4VxkOHgOc+r75WDp8gHGSxoa2ldSbDjzJfMz/QeerTr4FuXJbb
         XP0zRA/0DqW2cb5Dn/4ENTbEdXyMZ/sZmo2OZfCODxLJtfEKre8saiwnzUyKJAB68k7a
         PUkGv+niOPL5ebO+kGw7cZyE8A2PxBfuYsY3UCdLsh7/VoDQHjy9JHeyusa9JMDJl1sq
         siYA==
X-Gm-Message-State: ACrzQf3k5L4uGPcgQ49b5sx2Dnjrodiipvd4ZfIbcBEGPW9C0jqqiZgI
	8sMy3D7iFH/tsP7iMyn8ycYSJJPpl8s=
X-Google-Smtp-Source: AMsMyM6JuaFrl3dApO+m512Gh/DR8Vu6IrAowDxuOOGs90EhVZyjPVB+mTEJucYvWf7wHMbGCTc/Qg==
X-Received: by 2002:a5d:598d:0:b0:230:f238:a485 with SMTP id n13-20020a5d598d000000b00230f238a485mr27389477wri.71.1666723478904;
        Tue, 25 Oct 2022 11:44:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z2-20020adff742000000b00236705daefesm3294310wrp.39.2022.10.25.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 11:44:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] rust: install rustfmt for riscv32 as well
Date: Tue, 25 Oct 2022 20:44:27 +0200
Message-Id: <20221025184427.399850-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221025184427.399850-1-alex@linutronix.de>
References: <20221025184427.399850-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 18:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172142

With the above rust arch fixes it builds just fine.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.64.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.64.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
index 1f9dbd3cce..dbf74cec8f 100644
--- a/meta/recipes-devtools/rust/rust_1.64.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.64.0.bb
@@ -57,7 +57,6 @@ rust_do_install:class-nativesdk() {
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
-EXTRA_TOOLS:remove:riscv32 = "rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
     rust_runx install
-- 
2.30.2


