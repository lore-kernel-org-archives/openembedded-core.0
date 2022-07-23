Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32928CCA483
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 11:10:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.5150.1658574649363512947
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xt/iyxLm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id l15so5567728wro.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tlGea58qS3qP9mLek7eDrOC3/fXBJlIt5unSJhUpD04=;
        b=Xt/iyxLmvwy1luXB78SuOm9+Q4phyHCWxTU7uYIg7sDMNozP7irygow3XHVcwHAJgy
         Pn+tt50TkJMUShZ/jzozRJUIkUsJWWK/06FGs0AKgqEhyQ+k2S4pKUr+CVybUl+MvvYy
         G1OGgkBEPrInHeYN2PrIXlIZO2Lqq424F36jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tlGea58qS3qP9mLek7eDrOC3/fXBJlIt5unSJhUpD04=;
        b=meooJqE26GbAnFVtjN2ArLq5WC9Wb2YKZrbG0l2nUZgGgxeSJ/bx+EIZvNvcJQbxfN
         KSHV9lXpw+oag9wnKthvStPG8eDeovaA7SnpQbb7H7Uz3urdFUmhmqUtdirkT+ne2yGD
         PwVxFwGycsf80qKK3e/4LIO3eysoJGi4wnTRIsDyoP5Wcpg7VCRCSw14Q2zWOoqw7lDn
         tDV3sMCXBcEZb9EzvOfy4tPqVZStPdlUZTlNxX7F9lO4h8GVb8KGKSFT8gz1sxJ5wzkg
         tB78tXlulYCOuU5U1lsWYG4paoL+UyaoMVJNLVw3aSXb3HTv8HEbB6gvYYKLbagkmXgL
         VFyw==
X-Gm-Message-State: AJIora9tphMQO8UGWjfAr+A1QL5ESvHGrX0lunZI8mIyWHXuMIOMPDS4
	gEuNamWupKzRIgOuE6mtFdkAuP3GtQ9FaA==
X-Google-Smtp-Source: 
 AGRyM1tMWVEBSz9iYP7CYMVMqt/9eXqn1Mhykxk/r9mZQ3RTwkwxJEPAcGXAQ/+2R9Fz00W9i43WRA==
X-Received: by 2002:a5d:6b50:0:b0:21e:298c:caad with SMTP id
 x16-20020a5d6b50000000b0021e298ccaadmr2483819wrw.509.1658574647272;
        Sat, 23 Jul 2022 04:10:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm3430181wrp.68.2022.07.23.04.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 04:10:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] rust-common: Set llvm-target correctly for cross SDK
 targets
Date: Sat, 23 Jul 2022 12:10:42 +0100
Message-Id: <20220723111045.1775562-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 11:10:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168429

When a 'BUILD' target is requested we shouldn't be looking at TARGET_SYS but
at BUILD_SYS. Due to the way rust mangles triplets, we need the HOST_SYS triplet
to work with existing code - fixing that issue is a separate patch.

Also drop the arch_abi argument, it doens't make any sense to a getVar() call
and was a copy and paste error.

Based on a patch from Otavio Salvador <otavio@ossystems.com.br> but separated out
and tweaked.

Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-common.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ef70c48d0f4..37abd2cd26d 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -307,9 +307,13 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
+    llvm_target = d.getVar('RUST_TARGET_SYS')
+    if thing == "BUILD":
+        llvm_target = d.getVar('RUST_HOST_SYS')
+
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = llvm_target
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
-- 
2.34.1


