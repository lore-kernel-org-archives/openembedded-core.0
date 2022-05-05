Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9D0C4167B
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.7303.1651727178732865086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Chi60rPf;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id gh6so6606224ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GYsasaoDUJG6FKQIudieqQfZ5lhyO3DLPo4FpfSX7I=;
        b=Chi60rPft4llnOsN2loSX0UJRDFiAtTJq+YVe5Y7Rbio6iE3GP48Js/vH8goBzZ1LA
         zRmNXpkVWTChtjAY54UIH1U+632kFGDuyvnRS2JVyl7lQm2daUQ+k1GgxPP+0myLHkM5
         QKw6bqGDv8w2Jn9uPBbEtovB2ZusZE6FDkJDwbw3oBmS7Nb+3pw6FH101cUj4vcZOVJZ
         91cfaD0W2NnJcsvhWK1ReDSKzDqSog9aeFnWLpPvvl8R+/KKL0UE/UB9jfgwbRlaSSEc
         GQVmPq/HmhH0372kMT1OVMbUg2VL5kil0qEozDSazvZvpA7ixT/J/ER4YJU8Hz1jgoIi
         k+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GYsasaoDUJG6FKQIudieqQfZ5lhyO3DLPo4FpfSX7I=;
        b=j6FdaBzvqrgbo5rtQk9DsQ2oovUJUbUDm0XWy4EkxIlH2LlH2eMXAvcPeivBdvenHC
         7EwHQA4pnWP76YPFTeA4G0oVCp0kSaUsNZlfxsXbB84XeCBuzmfshFc/Z41RvlJGq9H8
         sXmC88NnHE8uw1ZhGAqVewfZrug9wG+h98Y87a2HuGmqFq26HWAmbHhGhm3wXqsXPvJj
         sdbrKNY+IWkkYULJ4fl0bFnoo+swI5uzCKThA6bI1JoXfhJDaMbaJTMrBPGtXpDx7whQ
         7yxUbxRxlmIeXk/5q4aJ/XMU7oVgVWlzMSiLXCQ8lezotKL3m/cWb7CYqvLuj/1gZgvz
         604Q==
X-Gm-Message-State: AOAM530Xx8v5oC9WT7tYghIhQe2vpqSUYFQO7a/1KZYItY1NvQXxuM/6
	L5z0U3Lr5NNTFzf1gQHYj/b/8+v7OOk=
X-Google-Smtp-Source: 
 ABdhPJx33Tyg8IelxDt1eDG5YHGPKAlWOw5FFghnh2yIj+2z02ZtsC5XQYrDbnZYhqCv09S3/RsVKw==
X-Received: by 2002:a17:907:d05:b0:6f4:3729:8e36 with SMTP id
 gn5-20020a1709070d0500b006f437298e36mr18611312ejc.475.1651727177303;
        Wed, 04 May 2022 22:06:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/61] python3-jinja2: upgrade 3.1.1 -> 3.1.2
Date: Thu,  5 May 2022 07:05:21 +0200
Message-Id: <20220505050544.651895-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165268

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
index c38686a5c2..80e0b85670 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9"
+SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.30.2


