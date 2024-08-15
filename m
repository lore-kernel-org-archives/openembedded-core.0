Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61FDC52D7C
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 13:36:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.123307.1723729013738315581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 06:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJfmVxr8;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8374e6a6fbso128734066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723729012; x=1724333812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XARHJhsDrP7k+Xku+uYWdw8BZq2uy4oavaGFLp0vSlM=;
        b=EJfmVxr8PF8Q4ti0DiredF53G9pby8XC3fLFVEKloEaW7AeF09wXFJlnO3qWV+x12v
         Li/4Jfl9keZWSK+Ymogadf9ccyfHPu+xwaoFhT8H2i0hzjhZoWZVkbRqd6f3+8B8z+RR
         wMhpDAmZWdYhlQLGodelD6vcLtJa2IhevhFnc1znbB2+Dk3pM6fVCaqejXzZPJnMHj9p
         UrfGHu0X1+1xpX5WJSczt9joFJAvVOU/5APrM/4Sd/X250A4m75BvpRAQl5qLDbi/sd5
         KfTdF5RmC5KZUpNBMVm2mLbMyVjGdEcR9JnjE+PZ9Uk+KaZtRvAB9DwdqYoD5XGkCwRY
         Ssvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723729012; x=1724333812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XARHJhsDrP7k+Xku+uYWdw8BZq2uy4oavaGFLp0vSlM=;
        b=W23WmaeUWXEz8viQlPUF4FJSQdoXq5kYVXAq9WBpcdb/Bdr0kQHks1VUDgwwGHVAgP
         z9LZkkBbmfsIY1PPbQMt9kh+0El/6Lg8qMJQImpKh5DgvTOOtilEsKSGmevtsbP//S07
         C0GH4h2+3xxWYvfAWI1PUHKgz4crgeQLyfdG5AvJ7VOD9cbKANAJ0Qf4bRuEInS8cOI1
         DVI2/OFngWUZ62YNYR0uWFXqIDgUK/HK6HB4kOR2GjpC8mSkeG3AOT3aKjsUW8b4rAdT
         gtLuCTYoPZPrpO6LaxQNWlOqvBenUcmXCdZm6Uzq56tIeNDou+Q+4aTRMVsc1mnomQYK
         NE2g==
X-Gm-Message-State: AOJu0YwrCU+x8LqovP4yFovZYR089HlXeVGhXjr9Epu3rYdxtYfzHlKH
	bXoJaD/tZDxWHjn3altR9RENBUkm3nA5Xjq23Td6QGqoFl94MrNMk0eqkg==
X-Google-Smtp-Source: AGHT+IEzEx4QOCb1ibT3yL+MuWJjs8/EDjY+JEnUvAJ1gGpSbUN5hF2NogYi7uRmGbV9NLjN2BDm9w==
X-Received: by 2002:a17:907:e204:b0:a7a:bad3:e5b9 with SMTP id a640c23a62f3a-a8366c11336mr407186866b.11.1723729011548;
        Thu, 15 Aug 2024 06:36:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c70afsm104856466b.15.2024.08.15.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:36:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] meta-world-pkgdata: Inherit nopackages
Date: Thu, 15 Aug 2024 15:36:43 +0200
Message-ID: <20240815133643.4077749-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 13:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203338

Since this is a recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/meta/meta-world-pkgdata.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 244175ddd4..1bfaf2c1e3 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -27,7 +27,7 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
-inherit nospdx
+inherit nospdx nopackages
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-- 
2.46.0


