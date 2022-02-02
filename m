Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455BDC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.2288.1643826513410161740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ijEqHCdt;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id s13so275714ejy.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnuSxB4O3//kYhrbQfWXeT8VKGFV/k+FtVWHWzsPtKc=;
        b=ijEqHCdtxBNY19CTb9llwblQomHpcL4kzlo+pTY4z7cPuKzTGsPUnZYU3TQjLqKnJx
         F3YnZndtL6Ec2WhXgFtaROIMCIBnbKJ/jNcg4ZOf9ogWy3L1uSJOI8V0HNHHL183yU7Z
         DbUyoO5rNvyfUAIEqAl9IA4TSZ+KRwiFcSJCzLIV0er0MA3KjExNebYmwbrEnccGYmFp
         UWfqmvFjnApajjI43KIW1lEpIL/rrCRJenRnMLVJqLyCdt3XxeQE2PogYdxBLsDm/fcJ
         6sRP4Q/zjePzaOTVfy0cjhanhGjfQOFfQlU0MZVAEwmVFgpa8dt+EVzOr1fIanuGMV73
         suig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AnuSxB4O3//kYhrbQfWXeT8VKGFV/k+FtVWHWzsPtKc=;
        b=wPI+cQsM4fqc65TayBsWrMbDRjtZwPu10bpD57ubQyLrhhhLZRDL6SjV/aOKYVZIgy
         L7JtrwEmEUEzAZr4E7FNHE8icegDlf8Ncp7fo1GzJfypgEMc3ydyRV7AI9GMdw50Y3xx
         GsSifkGmLZrDEJt8fzOiAeWWkP8bvh+lyCHxeR4FvBbi+hld+B17TMrS0Y3WX2FJp7F3
         VO4oPPn64nMACByEoJ01TftBkuiC4Ey4BuI5OHyah0AroxI3QjeIU+8fHnH3azgK22+E
         pwm6FcY9DMuqpv3H1AgEcdLSxtsLMAOmEJfXXfGYcmsMAsnxAyRCnY/+ya3A6JUewn+J
         SAcw==
X-Gm-Message-State: AOAM531GeKkxL0PvAFgm2Y+cvz6opTxWCf50c7O6B9aXAzMZnkyh0yHL
	vmlPBGFDTqWCd+PrVJsQ8zX1Iu+gQZ8=
X-Google-Smtp-Source: 
 ABdhPJyYukKlLui9kZ1fqu2h5lA5j1HOs41CZqc3zPmg+e4BN1exHw1qFTXCLyQVEppIAeFcGwpjAw==
X-Received: by 2002:a17:907:3e27:: with SMTP id
 hp39mr27024871ejc.761.1643826511973;
        Wed, 02 Feb 2022 10:28:31 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/33] re2c: upgrade 2.2 -> 3.0
Date: Wed,  2 Feb 2022 19:27:58 +0100
Message-Id: <20220202182758.919991-33-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161258

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/re2c/{re2c_2.2.bb => re2c_3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_2.2.bb => re2c_3.0.bb} (91%)

diff --git a/meta/recipes-support/re2c/re2c_2.2.bb b/meta/recipes-support/re2c/re2c_3.0.bb
similarity index 91%
rename from meta/recipes-support/re2c/re2c_2.2.bb
rename to meta/recipes-support/re2c/re2c_3.0.bb
index 9a0968a984..ab047601ae 100644
--- a/meta/recipes-support/re2c/re2c_2.2.bb
+++ b/meta/recipes-support/re2c/re2c_3.0.bb
@@ -8,7 +8,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0fc45e4130a8a555d68e230d1795de0216dfe99096b61b28e67c86dfd7d86bda"
+SRC_URI[sha256sum] = "b3babbbb1461e13fe22c630a40c43885efcfbbbb585830c6f4c0d791cf82ba0b"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


