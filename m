Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E68DC43217
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1198.1650348964070674359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 23:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYTbgcEh;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id k29so23038674pgm.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y46y9nnM1+5Gc3RT7erUGCwzfjdKd7HLlGBGL9P0ufA=;
        b=gYTbgcEhmCM+dGtTm+KgOoHXbnjgSyqR7lIBAhSmhOLDW5IIQlRPfUwRyL+jfflu4C
         lKYtqqumVlbB06TRhAclAQlfMQFSA+aLEJEPZ8Y4/0yEJ5Do0XjkaSDCqHWizI3iuAry
         KgblklwVGx2FJ5VAmAMfgw9gZBNtOsKCNYjJ2UZEwkLwBSznO+YY3zkpUGgyQWYBlwDB
         FW7bDM1dUMT7wziYic+ZR6ftztMcPYdNXq+MB0ZD8/OCUr054qacluaiwnesIaxJM4Uf
         14HaO1oTJ/gf53NJVThJRCd/+jF7C4RGiq+2UHNau/yIq8hqPHUmHS+4CqRsZNej4h1d
         GAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y46y9nnM1+5Gc3RT7erUGCwzfjdKd7HLlGBGL9P0ufA=;
        b=PhVbYm2wPnI7RnKuYDvUMWf29FYeNbVt0a+nOtf+KcNdWsqWXlmVt2Pxe2afWjho0/
         BG3Dzj1oD8diJdFeZNUWnUjEF7TIP/PGNZp/8Q+sr/q9l8SSu6s+z3gbGzQS1LdFZpY0
         SQNL4P9KL6+el4reYryW4wmBW3DKCk3A2m733uXsPhdOp4b+Bpb/ZJi8JVoz1TV7dqbZ
         8Sw2exFQ7aY6znKF54q7WoaXFYIkD+w+kI8t8RgiQ3N8ugUHfpT79i+nqXsdEXubsHZQ
         6b2jd0QNpbobpdbOD0+QAopjL39STI3QTGEr4rQ4PRGAmse2QI90d5Tjt8ySFjCQ8B4f
         ME4A==
X-Gm-Message-State: AOAM530Ac9egJN2/qMp9X2/Rg85yvX0jhzuNO4oLE84xukikFCVXASFk
	zfakBapDk/CgaoFatZeTr5qHITQUqJM=
X-Google-Smtp-Source: 
 ABdhPJzmVU7eeLmGoebXjDj6u1DzhdiwusC25VgpbP366yCFXwpdjfOlD/Ee/Ju2+3d+hE7CFbwjVQ==
X-Received: by 2002:a62:6d47:0:b0:4fe:15fa:301d with SMTP id
 i68-20020a626d47000000b004fe15fa301dmr16073234pfc.29.1650348962970;
        Mon, 18 Apr 2022 23:16:02 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 a15-20020a62e20f000000b00508363eee44sm14508689pfi.219.2022.04.18.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 23:16:01 -0700 (PDT)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v3] glibc: ptest: Fix glibc-tests package issue
Date: Mon, 18 Apr 2022 23:15:56 -0700
Message-Id: <20220419061556.115181-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164615

Run glibc-tests only when its enabled in the DISTRO_FEATURES.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 8c7ecf89ba..414f8660de 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -1,7 +1,8 @@
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-inherit ptest
+inherit ptest features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI:append = " \
 	file://run-ptest \
-- 
2.35.1


