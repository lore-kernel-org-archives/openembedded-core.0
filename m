Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C96CCF9F1
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 00:08:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.423.1693958920922639773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 17:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TQsHNXvq;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-26d1a17ce06so1783597a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693958920; x=1694563720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8l9L+MkqzM+NWs8fRDpBvAK0RZvTuQ92fBfLPDqRwvA=;
        b=TQsHNXvqLz781TAaKhOqsbBnek8zuZpFvGGxLaz64RGv09Z8rzHXBWj3pKg5UGYsrn
         AjDykEND/mDvTqgBgzaBzLWZLA8nWx3f1ndsrC6rLx6m6Q+uR1mmGKRI+ZbZpWPPXh0q
         U444zcMVMZDVaRJsky8RQL4BxSufIsWOk24kaEp/8AH9qcFK6e3iINyCSnxfQs+ITub5
         99b8CrH3GiuHpnyX82hBoaGx1+KTHJNaQDZHWbN+wDlX9IW1V8cZf+8nQtfvpwa5KnMn
         cuX9FW7I6VfrXIzHYoJzzVmzK1pTej/JtDWMWvnnV+zUzY2uDReK/MEVKzUAJUQ1R5f/
         ZRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693958920; x=1694563720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8l9L+MkqzM+NWs8fRDpBvAK0RZvTuQ92fBfLPDqRwvA=;
        b=Z4n71GbZ3Hf1Uf9jy7yK5DT+LOl0mZmdWI3JMAmUtOMTQGZ4FnwgNX1mTanuSZeF8q
         ao8DGdUG52x0e6hbPh9WoVVs/sv/i9XQZI9tE1i74YPQKvRDkwH+28+P+1WdP4uEn3fa
         DkYjc0AArSsS+3qVMNpRjpJszjQarcA6hL6JlQ9QOnZqPlv7sNZ/lmYWsEp0uwzxBT8w
         KRG3TCccr1YzmcDrbvYiUouIeJm9fpXfGMsPOBncAdEnIBk6c4N4jxWkAnATiu2ArVAE
         2WrYSkRYUjwbMkoNJNo41qOEbpkw10kID1GG4Vcj1lF6/4Yz1EPEV1c1whgRV27vInZp
         9+9w==
X-Gm-Message-State: AOJu0YwuBpEXhDoiy1s87nZxFSmAEgwz0LJpt1ANYT932FKs86hZ5VFK
	BB9W11XWnw9NVImY/KGSEmKAe7ZnVsyXSg==
X-Google-Smtp-Source: AGHT+IFxE/HuCX7r6DhptLj2mD1x4Hm2/URR9I9bZgO+AUwcR2tsx81/kKvIEwFqEd7EmQLO3kPL+w==
X-Received: by 2002:a17:90b:124a:b0:268:420:2e04 with SMTP id gx10-20020a17090b124a00b0026804202e04mr10155035pjb.49.1693958920057;
        Tue, 05 Sep 2023 17:08:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b00268b439a0cbsm9774129pjb.23.2023.09.05.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust-target-config: Map rust target to OE target
Date: Tue,  5 Sep 2023 17:08:36 -0700
Message-ID: <20230906000836.3136078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 00:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187260

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 9aa1fc4da51..926b0630b1f 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -296,6 +296,8 @@ def llvm_cpu(d):
     trans['i586'] = "i586"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
+    trans['powerpc64le'] = "ppc64le"
+    trans['powerpc64'] = "ppc64"
     trans['riscv64'] = "generic-rv64"
     trans['riscv32'] = "generic-rv32"
     trans['loongarch64'] = "la464"
-- 
2.42.0


