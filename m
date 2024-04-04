Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46794CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 13:29:34 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.37955.1712237364305193855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 06:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GlJLEw2G;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so8999321fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712237362; x=1712842162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGgyne5KBNpKzxQOYOGWEZLOP3JnLLGyeaC9hdS9+A8=;
        b=GlJLEw2GIfp0jHFSqnmskWZkJ2jOMBizVq291iZ6Z3y/pAUEpDjKvYaNOqu7ppUzYu
         58PCm6YOcsSQy+FmDYQ6bpbKRsANsxOLFuQHp6e415LIegsg2JsFzBuXe84iUsUAfI3j
         Dw9j8qa9lj0gyS1NdPtuKzAaFfFxZE2m+8KJ1BJbEvZLmGsTz/BRWOoC4sPjfBKSjxI5
         ZnnR34q2qCl/qA3C2RKOUTF4a1cBTDpjZPAXi0Xv83yPsGT3npuFlxDUSBus66cMekFw
         hjPxI8lbrcM3FKRI5T7MoGdQtM8eBAoRRwBc2UB9EiYef5/gVwuNZPBJh3sWsyb5M4Ky
         FNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237362; x=1712842162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGgyne5KBNpKzxQOYOGWEZLOP3JnLLGyeaC9hdS9+A8=;
        b=unAC+7Q5DRdZC/U4q9eMU04vJNcN1yfx+w1cFt2T7oDXl4FJlkUUYpEWj4qDQtFLJ0
         uVCxFpYNYgYLyngu4VuU2v39Hw1+1r0br7+rGhTCmyTEk4fWDkTfx3HxRbp7FiqvEr81
         adCxNCOlJ7bc2fdkFvxPlMQiELQJ03+FbWhZdzH29WQAvbR+t/fyeeOpWM2SCAFpAjAy
         DpeC6wj9F09AukZHDF/TY6dlqNLI6mb9o+hcgjDHyeSJseDCiYjAOw728i5atQSG3ez7
         Wse/6kNI4p4E4GJLVqiEGF8jBtgRyJVfJH7vaLAx1TYqndkpHRpVlCFlSab5WkJXsnTx
         DtwQ==
X-Gm-Message-State: AOJu0YxUFkI0gG2OZxo51yNZOCI+BPwBOfn4StKC8evyjSw5NnfM0Rsv
	ADkjNKQO8FwJhCWEBJsbHs7Ed4yV6ozBtzU8yuwb8KD7tEqiYaxZogMeF9yVnfrxeiTUhwPanw+
	kIRs=
X-Google-Smtp-Source: AGHT+IFXvT/ebSnopb8FuMjKAOaSjSTxrF6InUuOVconSJadGRCJw4TUe8wb0PsXNxl1FrDBaCq6SQ==
X-Received: by 2002:a2e:9b48:0:b0:2d8:60ae:f37d with SMTP id o8-20020a2e9b48000000b002d860aef37dmr177942ljj.12.1712237362428;
        Thu, 04 Apr 2024 06:29:22 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yywjht56pm8q3st-3.rev.dnainternet.fi. [2001:14ba:7430:3d00:1239:a19d:315c:6ddf])
        by smtp.gmail.com with ESMTPSA id c2-20020a2ea1c2000000b002d70a5defa5sm2095299ljm.7.2024.04.04.06.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:29:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] linux-yocto-dev: remove duplicate DEPENDS
Date: Thu,  4 Apr 2024 16:29:01 +0300
Message-Id: <20240404132902.68631-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 13:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197963

They are already set in linux-yocto.inc

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 9bd219825e..d5cba42a5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -34,11 +34,6 @@ PV = "${LINUX_VERSION}+git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
 # yaml and dtschema are required for 5.16+ device tree validation, libyaml is checked
 # via pkgconfig, so must always be present, but we can wrap the others to make them
 # conditional
-- 
2.34.1


