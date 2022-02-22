Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4CCC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.1910.1645557445326240512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l/kr0sAq;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 139so17841586pge.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=l/kr0sAqlzaUzgCH62Fk3OkuZ8okDTD5ESgxTAsdsC8c/piIuswIhMpqJyksMAZahN
         m11aAM7yfHlMO+9RZ1Z9oIywSS9gKlu+vWzupKniraT3paei/pwVuUfeJLSloOZ4RzAo
         TO47bb5eKkHP5ay/PjF8h8shKb3tkG8zF7xqPhDzEFTIdTDtd1kcDqQ0S9+HEWGR9dq3
         3zjUrhz2mVdRh8MbehABpZCPxj9Mczq6ZvgE0pS0XAUJBmc4Lkr2XLOHWIWUik1GZTvf
         ymcm6NNd/d0J/2g6wrjXYLwRrgc9cDHGNiF5HZZUCn8Y/VGd7ozoi3+TFQSv7X2oeq/i
         q+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=050+3IUZ4fml3fGwlTv8vdSWMLRu1nQs6wEcIHbknPwuxq5+1dkNayhvH9V7AOuXP2
         zFKOmKTL2fKr3+5n4ya8MZJZLuWEHUPs4gVgp9I16JcA+9fFC2MrOx+0dTnAIa1kz9aq
         oPzxXRiGTfVgWAYFHAUC60OrV7NpF3DprcvSu61IhOXusLQEwBJ+eEMo99Ru4/146ZeH
         0ZHnWReYYseuAb+hpeioID0LuUyJXSQRefv2izFdN6M/V0fOW5/64WxQJQpgVO1IWqOe
         oWydKgWv0fNye62RTl8p1H66Ag2pKthve81uOcz4S50BdY1aTADKBlUb2OtgM2ADVUYP
         +HPA==
X-Gm-Message-State: AOAM532G9iiWC8cOJdth8no1+lmGnTAJYLDedxfjaj+Y0FwA2TMnOYYT
	rvchtHx/JdzlZwOPgxpz1L4bVfouoK4saQ==
X-Google-Smtp-Source: 
 ABdhPJykPvK/YG6HuAYEf94dNd5weyn3CPRMx6bhFAeN93BFVnA5VYSMLZHS1kbvoppo5ebbjqH4Aw==
X-Received: by 2002:a63:4809:0:b0:365:1426:8702 with SMTP id
 v9-20020a634809000000b0036514268702mr20812657pga.170.1645557444369;
        Tue, 22 Feb 2022 11:17:24 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 13/32] python3-iniconfig: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:39 -0800
Message-Id: 
 <9bf296126a0d27b217c6ef65b5411815255f64f3.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162204

Upstream provides a pyproject.toml which decalres the
setuptools.build_meta backend for PEP-517 packaging.

DEPENDS on python3-setuptools-scm-native (as declared in the
pyproject.toml build-system.requires).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 6b3359712f5..5338980e699 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -7,4 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
 SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi setuptools_build_meta
-- 
2.30.2


