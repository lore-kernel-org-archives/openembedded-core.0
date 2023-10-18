Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9810CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:37:45 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.278736.1697625458488864386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IToitmf5;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bhstalel@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so1019115666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697625457; x=1698230257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQBgkLeFojET/fzKvogHvUFuW4f7jC/JpacUIOf/Xt4=;
        b=IToitmf5BsjQthK2endIGRaVSpnbmnZlmexn32lNNoe3zPXJPRsj3XFLXQWzEVQcxr
         1s5BsIO4HC0vqc9MgNbQA3lD0bshWyE4vffAUbjybFtvvAqt7Gewp1qsFLGPyCWbEXuK
         ivSUUfMe31PJDaMfIeI1sKkWEB4l3AD93JBILjaUTFJDJdp51WzIjz48SHqXuD3p/bm5
         hneP/qxemQptOFIIG9CdPfTALZVz/fxAHOqCCCuzTe8xYes7lipw/FzBFmo2K4prf4yZ
         i8se/CDQkcQCXSgyOb7lavf0BNB2C7VGO4zmY420pRO9KGVLHwW2v87STiFCPdJXQuKD
         Bbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625457; x=1698230257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQBgkLeFojET/fzKvogHvUFuW4f7jC/JpacUIOf/Xt4=;
        b=rARvC5qBNyRFTD2KP2QHE5PXnDCLOUqh3cqQiNtFvmeSS+COBPmgj6eg9rL9LQcDDb
         vMeBreRaQY62Mvfcz4N1dYAu7Af/yxisuWwDEB8CS76iMAcwUYmNg7MNZvDs7CCC2ZZv
         ZRFQy6VhTB43CX0lwLx+yumvfzRpxBNihcf2dhC4p9mO5X39Cq2S4r7h9TXDdnEuMl5B
         iOrz+kwf3K2sNq8RytQ4X54UEr4v6b5VOFvVaXD7tPId7BhIrjRe36e+GORf8k/1I+Io
         BHiIBWvjmnAmaWHMHO1WPsB2rtq/IKlF+uSH7ebcnR9M4lVJ3pEVnjpyIzAQwEIiBkVR
         II6g==
X-Gm-Message-State: AOJu0YxEvgOUKTC6sQIrmKrTnQJr7+GikyDkYu/8aV5w2ZTaFsheNw9G
	yTQlYDkn5kBAUTCOzHXrh0zQZWz+oVs=
X-Google-Smtp-Source: AGHT+IE43bD6GTCurmLcbVAZ+4eN6FITKDh4g1kwLx2XMrgQc3DD/GMcRXyNlNb4aC7crDzzbNbIvg==
X-Received: by 2002:a17:907:6e8b:b0:9bf:63b2:b6f0 with SMTP id sh11-20020a1709076e8b00b009bf63b2b6f0mr4063295ejc.29.1697625456498;
        Wed, 18 Oct 2023 03:37:36 -0700 (PDT)
Received: from talel.sofia.local ([196.203.207.106])
        by smtp.gmail.com with ESMTPSA id u26-20020a170906c41a00b00988e953a586sm1428128ejz.61.2023.10.18.03.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:37:36 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] bitbake.conf: Drop DEPLOY_DIR_TAR
Date: Wed, 18 Oct 2023 11:36:54 +0100
Message-Id: <20231018103654.3887796-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189375

DEPLOY_DIR_TAR is never used since package_tar.bbclass is removed.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 meta/conf/bitbake.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 77ff494523..2900a8bdba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -444,7 +444,6 @@ STAGING_DIR_TARGET = "${RECIPE_SYSROOT}"
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
 # packaged staging and/or multimachine.
 DEPLOY_DIR ?= "${TMPDIR}/deploy"
-DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
-- 
2.25.1


