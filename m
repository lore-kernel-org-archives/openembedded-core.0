Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B7AC04E69
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:26 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.83748.1691927656604896093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KjLXM2yO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9c0391749so53491961fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927654; x=1692532454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZNuP5F70H3aQJ6Yz3JN0JMDDz8augVN6myPcgRjFAk=;
        b=KjLXM2yOu2hPMZyd3Zixr+wJyxLAsQDy31hDRacxCM8sgpBBm/HrJeDUFpzFl7aBZ3
         6LBcNwjbiq4B+j3oDSrujZoWBLhkbIyVHAZ1gFE3NbsFviERtSwQX9IqJ6M2CJi8OANI
         N/ALZtntkLSQLzO4elT+QK+Bm1RwnE9GA2VY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927654; x=1692532454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZNuP5F70H3aQJ6Yz3JN0JMDDz8augVN6myPcgRjFAk=;
        b=C8MURAA6nG+t+136ds8IDtDTjxmemDPn8DlEnAG/SbJ0908+z+9yYdAgpqdcFF0s1i
         8uKYD5LbztkeGoA1XhlNsebOKjwIf8smZNIq9QvxmPE9u1PuMbp7J5hT3sKxOhprsfEH
         vuEsnt2TSqW7RY8quZECtTR7YtL1c9pYkNmq5ClMfxbGygVKlOFWeposfJYbNWva1hkK
         67a9Ppe7EvE1r+STCsCxsNS3iW0G6J6HyQT2cMO60+f8CCAGMDgLEMsAMTOSHqkK0VPJ
         0msVt3lq/mYwxVLOBroAXcJDLeLoa+y6VSJYpLQWuv3wkowhlC1KLYuruARi43maO9Br
         rXqg==
X-Gm-Message-State: AOJu0YwSgo+vebcxLkgp4m1cfLsopRpCpxlFKhipICNdIorR46ISZOjn
	B5Dw+ISaysfA5tVyzHIKE+CsSdo0C+XTZhqr30k=
X-Google-Smtp-Source: AGHT+IFvxkmTRDDUtGewWldd7zRSzoyLmjKEvgliKc1vCOxXmNmV086iC2OoC/4z/jVmOs5gVdmHMg==
X-Received: by 2002:a05:651c:1213:b0:2b7:339c:f791 with SMTP id i19-20020a05651c121300b002b7339cf791mr4972652lja.25.1691927654459;
        Sun, 13 Aug 2023 04:54:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/8] binutils-cross-testsuite: Pass TUNE_LDARGS to tests
Date: Sun, 13 Aug 2023 12:54:07 +0100
Message-Id: <20230813115410.163212-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185877

In some cases we need to pass the linker arguments to the linker, particularly when
the default in LD differs to that which gcc and our compiler flags are using (mips
defaults to 32 bit). Ensure these are passed in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb
index 14480785b4d..630815c7a3e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb
@@ -47,6 +47,8 @@ python check_prepare() {
         content.append(d.expand('set CC "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
         content.append(d.expand('set CXX "${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
         content.append(d.expand('set CFLAGS_FOR_TARGET "--sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+        content.append(d.expand('set LD "${TARGET_PREFIX}ld ${TUNE_LDARGS}"'))
+        content.append(d.expand('set LDFLAGS_FOR_TARGET "${TUNE_LDARGS}"'))
 
         if suite == "ld" and d.getVar("TUNE_ARCH") == "mips64":
             # oe patches binutils to have the default mips64 abi as 64bit, but
-- 
2.39.2


