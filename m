Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DF1C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:39:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19081.1693913989854219434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YaA92BVJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: xmdy61@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c1ff5b741cso18092195ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693913989; x=1694518789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkv6y1LjRC2RZpD1EWk+ls5jUkxkfqLUZP+egKIQLSI=;
        b=YaA92BVJTOnQJA1/FqmN71+NuNcn8aV74e1eiIGLBoVwP6Hb2SB1PSHmW5MkWxO+Nb
         K995Bubtx+HwOrToUdwaaAFhnUQp6Vkj8SzG0ReKlk97P/0zmcsesEhmMfHP9ZBKHw4W
         xW0vB0ONotmOf8pOYrUpKTODlKzBve551knNL8h5dr0/QJf6ZlckOvCN0H+tuhKdLlvi
         gFuqHmuQemf437J2SFSna58+tSw06VpGOG27M7Z81M8ghbBP/ov+YKOX15l/i/tZuXUl
         P9Gp4cd7mWFz+gAjW3P7hHVpGaxJlc1AZ4Wv+biB4Kzf6ZI4q1xYOvuF1sSS1/iC9DqR
         GQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913989; x=1694518789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkv6y1LjRC2RZpD1EWk+ls5jUkxkfqLUZP+egKIQLSI=;
        b=X6QJaE8moaEAEV58a8EmmWFYyfwJH6BwXUsZVVtg/6c/aFJOIOoDG7rCVEaZFvuFsk
         58E3GdKX3+ZQba000ULeqq3Fij15RLu4wBILlGn3zLfNVQLf4WgdDaKa6dx+33jjHGH6
         Rtg7EnxfoDzUG+gRxPQawp+5RmAhVqChBOUdzTvTp04lqf0xe3lgpEvmvomYTplnfwaC
         zkc8kSprx9wqlsknqLPxfrzz8cX7C6+nU+B+Om4UTDjSCg05usDo0mE8O+51OxY+kbAj
         /AIsQbjH2aAUXMWcjGsvGtQhhESs6NXwFTv+MWCQh8jjDdpvrxqsEwGxpK4J1A6Wznjy
         ZhNw==
X-Gm-Message-State: AOJu0Ywiv7oc3iInAH7yKmoqjYYBK0ZOJH9aDsz+Q/5HrUu1B5QGkNCx
	hhQEnf5Fp8vcxgVfjFrrzhmenGVsY1eKEaro
X-Google-Smtp-Source: AGHT+IFUOtUWx1jbAX6qd4ZJ12xGGzaknBD3DEZGFJ/HfHdUjtGz+JaXA8EXIhzORv2OJC66vEARug==
X-Received: by 2002:a17:902:e551:b0:1b6:6f12:502e with SMTP id n17-20020a170902e55100b001b66f12502emr15721260plf.49.1693913989050;
        Tue, 05 Sep 2023 04:39:49 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902d34900b001bdcde49bc3sm9128500plk.119.2023.09.05.04.39.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:39:48 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] [OE-core][PATCH] gcc-sanitizers: Add loongarch as a compatible architecture.
Date: Tue,  5 Sep 2023 19:39:42 +0800
Message-Id: <20230905113942.18660-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187208

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=600413c4f3d70392285192fb99634bcbeb97f83f

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 9016f7f937..524ebd4ba4 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -78,8 +78,8 @@ do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlib
 do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 
-# Only x86, powerpc, sparc, s390, arm, and aarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
+# Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.20.1


