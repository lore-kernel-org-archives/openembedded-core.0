Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3FECAC583
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.130.1757090537318151594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HLByQDeR;
 spf=pass (domain: underview.tech, ip: 209.85.219.48, mailfrom: vince@underview.tech)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-71b9d805f2fso21803496d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090536; x=1757695336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdpDUPDLztMtIDTj0lJa2dehuwTfcBO0wGysqlJh+Yg=;
        b=HLByQDeRXWXUBHh1A/gkWS8+CtuB48wl+lgLi4e1V6ic/KgGBPRAaZLOK3iZlOTelX
         iqpCkE46yNHhv85IRqpwoMhU7pqlDRuJrjetIBs8gq/i5GwIP8WVbTXn/zpH8UJrhLUd
         4TtR7xEoR51cNvydYbw1Ant23VTmbePRvqSjgwXR1SQF4XOD3fPvsj10ovsMJKpfEeDV
         hswGgk9aM7EaZ31D5UURauhvoNfqFVsjFAMCIvYlrS8HQfjesIfg00bzbzL+w++cHXM8
         LgOMLUSQY/l0npsPDOOzSqKspJjUwY696l9V20gleNohTdwXOTgaPa84Xc5X9ILXK0n+
         tmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090536; x=1757695336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdpDUPDLztMtIDTj0lJa2dehuwTfcBO0wGysqlJh+Yg=;
        b=BVv9Hlecgo41CKpiZ+JXJwSL+t1HCuxaGpDYAI9OrTUlPRx7Ko6CH+G1DzE8JCc7P9
         0OYOfPRCGT9tf06CFTJYPtvXSGhxjjORRz3pMV4ufgXJtvfkmTYaPIExvcEEMtUqGxAJ
         RuWFwDO3faFvnZRHt/kQYWgH4dqe+VZyBHdeultwrBj3iNfAbTwyXN8Bc65bV3A3oEer
         vVIxNNE8WHvGxs/79i6b7o1pRtuXloDsCAZ9E3CGeuQVatAGA18RkN7x/S/PEH1+P0JR
         BYr12i/0U6zpRfeEc//im4O9lda6JemwGKn0vTkJrXd8aSvzgRjuKX9ILwxrElDCTr/y
         mPrQ==
X-Gm-Message-State: AOJu0YxdvmF0++01m50aIUvXiIZZcPUN4Wk4O5PMbuvMeuBHvlJMA75x
	sScogW8mO0Qfc8M0HPKyB/1k11NkxybcuFIeaH70d5nTInV9w1TtUCHzyHXzwqCJioaS0ahMgJS
	zzZR+
X-Gm-Gg: ASbGncsXnFr5VpbWCXHRDdR/SZHbSF3JR+1iOVQRX/SWy5SP45wWnDkHeOXXz4smJdD
	HI+5EA+u4xkI/kbZIFIulR7ObmHbZsCHio5Ec8W20wEnvqIhqSVkbOxLKvLFsKAnW4gzQH6Lv5H
	8XzfioPUoteKtE/EA84x48npRu9rLtEjqvWAbjIYo9BFV6KWlxugysIHYOdmZFDLt3/k9e/5gL9
	EhrSeFM/LczyXwJ+DOEnkaZk3YLnCkN1kYMdKR+y+ss1kb/3H57MpGwDEIsfXkrrieWqbxewPgp
	YYCdDFw4hpD4jIHKScRYFBWnfdMfBhdvDRTkt0Mv5z6hi279N+9S32Pgo0jno8TSdLrhELMNIC+
	sTPjS5kRJLlg=
X-Google-Smtp-Source: AGHT+IFT9QCu8JmOYA2oEOcRQngAXvAHMYF8+i1bj15yZzhddF6MtDbJ/4310ankkot7RP5Zq29LVQ==
X-Received: by 2002:a05:6214:1cc4:b0:709:8665:f839 with SMTP id 6a1803df08f44-70fac89df73mr262595766d6.43.1757090535795;
        Fri, 05 Sep 2025 09:42:15 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:15 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 4/8] bootimg_pcbios: update default boot timeout to zero
Date: Fri,  5 Sep 2025 12:41:32 -0400
Message-ID: <20250905164136.2896809-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223020

If caller doesn't specify a timeout more than likely
because caller doesn't want one. Set it to zero.

This also fixes boot time issues related to
OE selftest that leverage boot testing with
qemu.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 scripts/lib/wic/plugins/source/bootimg_pcbios.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index a7fb2eca4e..2fdca98848 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -208,7 +208,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             # 'None' being the value placed within the configuration
             # file.
             if not bootloader.timeout:
-                bootloader.timeout = 500
+                bootloader.timeout = 0
 
             # Set a default kernel params string if none specified
             # to avoid 'None' being the value placed within the
@@ -364,7 +364,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             # 'None' being the value placed within the configuration
             # file.
             if not bootloader.timeout:
-                bootloader.timeout = 500
+                bootloader.timeout = 0
 
             # Set a default kernel params string if none specified
             # to avoid 'None' being the value placed within the
-- 
2.43.0


