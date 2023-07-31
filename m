Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1514FC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 20:17:41 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.2660.1690834658859567585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 13:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Vx97cZlh;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so7783024e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690834657; x=1691439457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5n/qPhVya1UiIyr+XvN9/mQwPobWv2QEHA3/e+zOHOs=;
        b=Vx97cZlhxlolAuGRIMzkLXbSq2Pt62OQVqxzplYVRdm7iq4/JkEUrluR+JqOLcvvVO
         aaqxVIjkucw8PtrPbI3WxTRaWE5VoGglrMmGSsZYjf+2gYLmAMT4wBNphpT88UaUwYst
         Vbfb2RunQMi5J7qqldLlRP7wSzrOTP+arUL4CvCDFVoxAKHs+o7k3FndhewAXebewNXE
         HiOgVbfOiovNJUDR46h3mfyycm+lhu4j7kqf59YHKerMOl0fMNXNhdCI0B+VCvnN7iu5
         TwH5abGo6rXxtouHwbDqO4SOLYW9k6A3De0Vsf5GTCo5V8P1zL6erojLQQJM55oQoT+d
         Q9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690834657; x=1691439457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n/qPhVya1UiIyr+XvN9/mQwPobWv2QEHA3/e+zOHOs=;
        b=MVT0TXBPA1DeEkmSn7Ftt0q0B1OAompAOimM+eE6P7J1PWGRH0Ax1Jtwm503ijYhSI
         51ykHm6z2Vxgl3SumIH5FzrF0ghHEswXL88iBbt/2UKxc8kpU6JyFP0ITsoWbxltF9JA
         i7R9i9/eZtjt8TJA7HU7EM2LNEwwVrO5ZW03jAjkXDBOPl7GtQ8ZvUZ+vmUG4+EarDoU
         /Y+7g97lvBdCESnl3m014N/cpvK7LFFcsMDLwAZamOD5T5RJTNKXY28PJUS1RFl8918q
         g6ngI0SI3tkV3ynHCuD9bvBRnAIBfSzYWZGNKHCgjc9I6dG+yMG0bhmnHTG024wdQg2/
         W4cw==
X-Gm-Message-State: ABy/qLadl0TgkiMwpvhA0IMJwsmpMQ/ts2f+kT5eTGu4bmW9k3Q5X8PP
	xDDPQvYiUgspAZxyQmcWXstqM6daAlI=
X-Google-Smtp-Source: APBJJlHVVPC/88YXr12tEDjSBc9tVG/UVmX35ILlSq9CHCWddrCSH3UlVobApu3DZaPKbuTQtciIeQ==
X-Received: by 2002:a05:6512:3e09:b0:4fc:3755:37d9 with SMTP id i9-20020a0565123e0900b004fc375537d9mr813068lfv.68.1690834656711;
        Mon, 31 Jul 2023 13:17:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n10-20020aa7c44a000000b0052238bc70ccsm5889820edr.89.2023.07.31.13.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 13:17:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] efivar: drop -fuse-ld=bfd
Date: Mon, 31 Jul 2023 22:17:32 +0200
Message-ID: <20230731201732.973647-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185167

* upstream doesn't use --add-needed since:
  b23aba1 Remove deprecated --add-needed linker flag
  https://github.com/rhboot/efivar/pull/218/commits/b23aba1469de8bb7a115751f9cd294ad3aaa6680

  which is already included in the source since:
  "efivar: Upgrade to tip of trunk"
  https://git.openembedded.org/openembedded-core/commit/?id=4df808c616f847d90203582fd950a49bb8360dd0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/efivar/efivar_38.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 87a1e665ca..411e951a5a 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -19,10 +19,6 @@ inherit pkgconfig
 
 export CCLD_FOR_BUILD = "${BUILD_CCLD}"
 
-# Upstream uses --add-needed in gcc.specs which gold doesn't support, so
-# enforce BFD.
-LDFLAGS += "-fuse-ld=bfd"
-
 do_compile() {
     oe_runmake ERRORS= HOST_CFLAGS="${BUILD_CFLAGS}" HOST_LDFLAGS="${BUILD_LDFLAGS}"
 }
-- 
2.41.0


