Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29089C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 18:57:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.62843.1697828215926559957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 11:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=If690ZLo;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b709048d8eso1003590b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697828215; x=1698433015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19raeEM3PkF3qz4oVgTKiZEiV7AkuFduLuOe8ShTmjI=;
        b=If690ZLoY0r65w8TLkifaj5KqQDo9pWXEqOgh8XEMhhPqeFn4Ejostegnj+b+2DLV9
         GhbPDT3bwwzpbFVcogQ2yHSKEPDsLFbc3NLLrYb9zYg6Tbm1ulzj4Op2JT4YyQ0i9MWE
         rl3J5ZENXlkRefdtBRHYvK8yCSPtikXftVu/U5E9gdrBenhxAIxoPKk8ZKAAAiWrKh4f
         E0B27bEoPSldAOw9AZO6IQBv3kNaDvDr+bdh9uNQ/6Z6ejVRA+fdYwmI6LZh1vTe/EG8
         /w36/4+GKGDHUxS5DLGoF6P7Qi3zkE2wDVlNhhWCDFgTJN+/d2Z1x6wjlTCKdSwImDfF
         rVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697828215; x=1698433015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19raeEM3PkF3qz4oVgTKiZEiV7AkuFduLuOe8ShTmjI=;
        b=dg6c6kOVz1nT2k88cTSOacM5saw4q3qo20OshaluHPFSfWcGm1pMeSMEi6eA7n2+EI
         FyRQJNd1zg+TAr+YnFGkVoUv3s48Z3XTJypqQcvoDBclCNyI7JfELNLKojQQjF9cflKS
         BP6m6cjSyeNuuZBsVTsp4lVXEodrJM4oXND7M7moQ8W8OnXLmxWBwlicuZMizBR8lWbu
         HksbH1wSend5okfvXFmrpJyEluci41xzG9I8RuQgoffKuNq1uvFZ14kT5rRmbclAtSM9
         Fqua2Br04K8EMJEk0xiUgwi5iCA/kyPn4i0BNx3fl6InUX0l2hdzEVThG9IHY7X6bcdT
         kwmA==
X-Gm-Message-State: AOJu0YyUMxnPdsWx91q+3WNaQ29jiZRilzuXv9ZPWkVxibSOl9pbd5Pb
	KAfKy4ktw43ePYb36pHE2TpURWkJc3I=
X-Google-Smtp-Source: AGHT+IEtcRf20KKKOMxnhGDQiO3/lGcKkjRD8b4AcOpxIJiR2zL4LK990xCfot9bNqZmJPOuy2XZaQ==
X-Received: by 2002:a05:6a00:1ad1:b0:6be:2649:8c6b with SMTP id f17-20020a056a001ad100b006be26498c6bmr3053248pfv.32.1697828214989;
        Fri, 20 Oct 2023 11:56:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id e28-20020aa7981c000000b006a7083f9f6esm1877657pfl.23.2023.10.20.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 11:56:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Match target name for riscv64/riscv32
Date: Fri, 20 Oct 2023 11:56:31 -0700
Message-ID: <20231020185631.2867906-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 18:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189579

This is updated in openssl [1] [2] since opensssl 3.2 onwards

[1] https://github.com/openssl/openssl/commit/42ee6e7be43c57136d71e5612fed22a06f7f5d0e
[2] https://github.com/openssl/openssl/commit/c29554245ae107c87d71c8463eef0134391da318

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.1.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index 5bbafcfd3f6..5432d9dd8c2 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -119,10 +119,10 @@ do_configure () {
 		target=linux-ppc64le
 		;;
 	linux-riscv32)
-		target=linux-latomic
+		target=linux32-riscv32
 		;;
 	linux-riscv64)
-		target=linux-generic64
+		target=linux64-riscv64
 		;;
 	linux-sparc | linux-supersparc)
 		target=linux-sparcv9
-- 
2.42.0


