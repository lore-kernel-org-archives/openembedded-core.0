Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C022BC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 10:40:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7114.1715251252753135995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 03:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b5yCwSia;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41fc53252ceso5428575e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715251251; x=1715856051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEQiR0DNo0EKBRIZJXf6uIGlb+6Ja94wrG36uBr+scU=;
        b=b5yCwSiaE5eC7afHb+0yf9vY/tEVb8NDiL1zqnDx1cwW1zbOfJvyYWmlWwvgojBWX+
         MPB4IRG8ZY+cztaXq4FFz9Hlxy0cnLe6adRvVw2HGD4HApqsO1J/sNPDrotODlnQyx6z
         b9mt01RVjHx213b9KDlImHC8xQAwhTyIF9XXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251251; x=1715856051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEQiR0DNo0EKBRIZJXf6uIGlb+6Ja94wrG36uBr+scU=;
        b=vjaUqplgrgPBW+udlTWWOU1TnS3REo2TlaFM8ZB/YuJ/eoXVhMNg0OsQk0OmmMQStq
         4jol0ZkYRFQ8iifALnNUtIwAzISCvgTUZFfBqVH1MGqU2TfHbbyT3b3APMjczc+Ow/SM
         RaxKCxacDEVKD6Rkc0i6rAQHq42dKY/KEi7EVVoL3Fbx9VZxy/CcNKLMtYT+2BBz6wWh
         hB5vmjnt092PdX+BDyn+A0zuPcoYKxUEzAoiU9/pI7sHRFcjjei0vmTSZIEBHcQ6okur
         fugRIeZ0rOYncmC/lOQhTE9L7obfg8zGLtU5adyUlG7KmaxrVGPJFb91MilWguyBURn+
         bi4Q==
X-Gm-Message-State: AOJu0YwVeDnDF42xKfjDs5CSpc5lFGReDm7X2eaB+pbeWbPKAo5VwdIu
	UfowSXJAPKTM/1dT5PXEN4S0Hzw3fmQqlqfcr7gs7/qur5bz+Pf4plcCzoEw99jcHoGloqre5pZ
	d0bU=
X-Google-Smtp-Source: AGHT+IE+z2bkIJBNmU7q4RsSA4zKxbukz+b7UryMidOW2ZfleVGha4U03dAsn/uXpzzber9HG0722A==
X-Received: by 2002:a05:600c:384a:b0:415:4b4b:1e28 with SMTP id 5b1f17b1804b1-41f71ec27e1mr40695055e9.20.1715251250828;
        Thu, 09 May 2024 03:40:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a95b:1bc1:5128:ffbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9318sm21116965e9.30.2024.05.09.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:40:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jookia <contact@jookia.org>
Subject: [PATCH] populate_sdk_ext.bbclass: Fix undefined variable error
Date: Thu,  9 May 2024 11:40:49 +0100
Message-Id: <20240509104049.3912261-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 10:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199144

From: Jookia <contact@jookia.org>

The variable uninative_checksum is returned without being set, causing a
build error. Set it to None by default instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index f5687e58997..09d5e2aeb66 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -276,6 +276,8 @@ def write_bblayers_conf(d, baseoutpath, sdkbblayers):
 def copy_uninative(d, baseoutpath):
     import shutil
 
+    uninative_checksum = None
+
     # Copy uninative tarball
     # For now this is where uninative.bbclass expects the tarball
     if bb.data.inherits_class('uninative', d):
-- 
2.40.1


