Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E64DC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.1974.1645557448561655168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P25K6muT;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id ay3so7669335plb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=P25K6muTIuu/MWW5BGsPpSOG1Z/3MGcdgk4ym9STsT/A2tBRVt9m3N76CStxp4TjWQ
         ZaF391AN2eihayypZ569GUmZ5i2V90pDQ/0he5ALMS0DnCppRX9VeX/mFd8DE0QPD0x4
         LeCUSedtQXTA9J1QW2b1CLS3OMfxe4T2u34P8WTVIt1DwxVlet88F7fCaRhMao9bmiFu
         JT3MjI0bryNpXOiabEx0CayPgo/xeIlDNNRppiV6SDXaVG4QLiA1YnXbGQwkc0OGtjvF
         RJNg2AHf5kZO2t/7PrJ+Z9iD1LynxQ1DKmIBoMCJ3lDtdr3EYfiWcRwwNywcZ1YdsIiF
         Qjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=7f1I4lRJoxNGRFJ9sJP5RQ0FRAI0POeOQHGdB7PzB50lmU8aTRHphLlBrxSNS2e6a0
         2dEY5xrf16IjI11+WnI08qnTtBnbChOr9VDfsevPgWgPSTLd9FSYcft2MVQzoyap1rYI
         k90J8WlBEQ/vblkx6WfvJDX7mEjyAxOjMqAaIrMMUAlG4fbZaBszj7yxyNgPc+vq58Kf
         kta3ogbIwtgSMSMqmMJ+Zh6aqdEHek1q/2MsniWnDzLKEGrxdOCsGFwyyAE9zo/rKn8q
         jWjohp+hjUC12kW2yU3wNKN8lptv+mwFTZ62FLHTbki5I9fu97AoSA+WdJLmDorUrayL
         ztzA==
X-Gm-Message-State: AOAM5335Eqa51CUx4vJYw/0dcvGT5jizPh5Q8aVRw+i9jwVdPQTO7xAs
	VJOTOmw4HfPZfH7zdje2w1tiPTQ3XvLd2w==
X-Google-Smtp-Source: 
 ABdhPJzxMPUk3rkNPWzWJ08POFzU87V8LfMGMyQVEmis+ooj6TgYrwVn6ule1kqtzmzJOCSNPIh68A==
X-Received: by 2002:a17:90a:5291:b0:1bb:ef4d:947d with SMTP id
 w17-20020a17090a529100b001bbef4d947dmr5611173pjh.243.1645557447719;
        Tue, 22 Feb 2022 11:17:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 15/32] python3-pluggy: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:41 -0800
Message-Id: 
 <342ac208b36ae7e85761f9d35d0571354135cb12.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162206

Upstream provides a pyproject.toml which while it does not declare the
setuptools.build_meta backend is compatible with it.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pluggy_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
index 14a7ccb0b0d..73bbcb02697 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
                    ${PYTHON_PN}-more-itertools \
 "
 
-inherit pypi ptest setuptools3
+inherit pypi ptest setuptools_build_meta
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.30.2


