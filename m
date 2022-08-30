Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A60ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 16:51:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14364.1661878310860157442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SLOSmGRq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1558655wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=OGIxRXuDjPiVs3Vlu7dJBerjCj+uX+4WIf2cIq6tNlU=;
        b=SLOSmGRqAbEwvOxrnu1m7Z8PKkEqj8Tpb+JtxeDv8N8lNq4axHAOOds5Ih0wRbXpi9
         +C2G7u0zP7aGW17wpKTyH9KFaDhpLmYIDapBZJzmDnEFtqPh5t/0oxBKxzNUjZsZPRe4
         2GLwHJTDSpJAjoRjzIpB6hOUdztx+hK7w/a3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=OGIxRXuDjPiVs3Vlu7dJBerjCj+uX+4WIf2cIq6tNlU=;
        b=ZBQqa3lAg4jUm+WzRNYTjBu5kwM+BuQzAYSBLUKrOXLnNrAUvjZu2cDGcN+XQx3NAp
         iIFfhakUgRDDyjXKRfrOVC/zxjIHFDRvyDqcCwbY3lHROm6rQ85wRhGAm833TdxcYGQ4
         LlNeyv5Z6CQG3u73PhivTp/bzaNwTft4BEpdM4iwwI5dxX7HnvoevPxmjY9p4Tbk9ko0
         qdO6m6H+TSx2LPn+RhPB0mcxmvSbN7etjKJAbPSZRfUb+b9pkhu3jDbc2lYxArhBOdI1
         sbdWHLw3SUkyulCQiqS8hvAQuX1Knz0/u8hdUWZdC5EaRaS2aqKrbM4y801vAVHjSxrI
         u0Pw==
X-Gm-Message-State: ACgBeo3X6VH+tEimGMpgZk43La4rkHBttaQ3tBn9OkA6RDMRxbOAlC0O
	jwL2199mnnTU7foyv1njof1imchY8xKUlQ==
X-Google-Smtp-Source: 
 AA6agR7ZjiGTQt1VmQGvoe08VfR2Q88+UKMo9Bi9XyKKlDdfl472ugW3eZEBYPTWC8MgcKo2bvwElw==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id
 a13-20020a05600c348d00b003a60b4eff6dmr9748629wmq.95.1661878308878;
        Tue, 30 Aug 2022 09:51:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5ba6:cf0e:f253:2cdf])
        by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b00226332f9275sm9936488wrn.22.2022.08.30.09.51.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:51:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] rust-target-config: Fix qemuppc target cpu option
Date: Tue, 30 Aug 2022 17:51:47 +0100
Message-Id: <20220830165147.124458-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 16:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170080

We see a lot of warnings about incorrect processor types on qemuppc, drowning
out anything else. Fix the option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rust-target-config.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index e30eaa1da30..9e1d81bf5c4 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -272,13 +272,12 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
     trans['riscv32'] = "generic-rv32"
 
-    if target in ["mips", "mipsel"]:
+    if target in ["mips", "mipsel", "powerpc"]:
         feat = frozenset(d.getVar('TUNE_FEATURES').split())
         if "mips32r2" in feat:
             trans['mipsel'] = "mips32r2"
@@ -286,6 +285,8 @@ def llvm_cpu(d):
         elif "mips32" in feat:
             trans['mipsel'] = "mips32"
             trans['mips'] = "mips32"
+        elif "ppc7400" in feat:
+            trans['powerpc'] = "7400"
 
     try:
         return trans[cpu]
-- 
2.34.1


