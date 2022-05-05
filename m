Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCC8C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.7347.1651727156894581490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVXwb8dq;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id be20so3875053edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vWymZ8UUMr/Qv9TXZnC/Hpc8CxTadjmknJ5RNAOPlQ=;
        b=KVXwb8dqXzqOTDjOrMzGr3TeuUfsHqEchUfK//EUnMMirEuYIHfxRgU5oPh1FrjLyM
         xAaAar5ikzRXL0jYxX/ONSSPLUC1jZJ1YBUMhWbVlnk9dWguOv9dy+Wy08rQvX8oS2Hr
         STXB6ltu8RDYI1ANBQHTfcLqogwo8mTPWfDxTDRv0gsQU/5UlVYOf8lI9NU5tdhENKvq
         JAXeqihTkWchC7p2VWkOt9+f5+OxFURFuW0i5uvjUnRVUvyInudoyJ5Rccqw3rz96Xv/
         of6NgKQwfttz+paJRFx5aUDzZCFE1SFPGXFi0Meub/zxwsmbTlZ94Yu/yZL5xFpkLAt+
         gUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vWymZ8UUMr/Qv9TXZnC/Hpc8CxTadjmknJ5RNAOPlQ=;
        b=3e7/G1vq63/3VR4c4iQCUJ+kRMnvUU72riwh2r7INh80Y76h645evmUuTFabMhio2f
         auegSkQQ18Ow2OjiUHJfSQVMOBHVKXamwn7p3lYwiTMjt6z/aUoSI7u02vCEkT+xVi8W
         pEK4ocTVBDjlwIZDabsssr7BmHsI3SrFWIOMf90fwH4kFqDhfqtW1WtcbGraxsrvjL7S
         XJjLmpYiQE4NVGMFF8Rpv4+RLEywQve/HYDsPoejMtJosELw4V+YDd6zxs30b7EmfYMC
         r1+F/4/La28oA0dPLVgKeG2XbPg2+HGwBj/BcC4cxL55AoVA4HWklOhIpQM5mUVUHyZv
         7y+w==
X-Gm-Message-State: AOAM530pOgCgFF6hODFqCSi2aFkU38L2VC6qbayXcBfSblR4N/925JU4
	NQwyjGNCedbG2cFV6A5+Fg+IRG+xTP0=
X-Google-Smtp-Source: 
 ABdhPJwLBbJ5ceqYzxoiKp+0I2Dp0yKtMoAqKUHbZ0zH8oCxYzL30PzDvs1HAf4Aw4y79sR7uXYvIQ==
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id
 j4-20020aa7c0c4000000b00425c7766f17mr27212672edp.131.1651727155474;
        Wed, 04 May 2022 22:05:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/61] python3-pygments: upgrade 2.11.2 -> 2.12.0
Date: Thu,  5 May 2022 07:04:54 +0200
Message-Id: <20220505050544.651895-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165240

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-pygments_2.11.2.bb => python3-pygments_2.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.11.2.bb => python3-pygments_2.12.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb b/meta/recipes-devtools/python/python3-pygments_2.12.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pygments_2.11.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.12.0.bb
index 35d288c89e..b47e0aff67 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.12.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
 HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "4e426f72023d88d03b2fa258de560726ce890ff3b630f88c21cbb8b2503b8c6a"
+SRC_URI[sha256sum] = "5eb116118f9612ff1ee89ac96437bb6b49e8f04d8a13b514ba26f620208e26eb"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.30.2


