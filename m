Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F63C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:21:00 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1114.1716488459436175856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 11:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCJIlYKL;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c996526c69so3700240b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716488458; x=1717093258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeCoWmoVsjzFV+iKPR+9OnNzGm1NnnN02lgPFSXem8k=;
        b=JCJIlYKL3k5kMtJS1nApRaAT1Fu+9YHhFD9NQLXX9fINpWqYkYGkmKFksobyk1EEtL
         J4FfbYp1nWZa5LR1/0rD5+awkyGTuINIQbyawfrJHOn06ibVysJymZ8Ed0OJkavwuEUd
         VCr6dSqlF39fYyXcwWW9rJXWt1Ob8LAnO9+jEmbY4sA0QK50x98JWYpA2OYTinf2hXVD
         l/IWZiUic2okLg8N1o/zq1oNC1hSIu3ivV5FbTjcYwpeO4pVbrM5j0WTPN8hVlwS6gLp
         s0FDsanTs11Sp8e2fpCEBpk2OpQMESf+R0ei/lOH4SpFMWVSTQUsdxW5H41c09xOtSUf
         xnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488458; x=1717093258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeCoWmoVsjzFV+iKPR+9OnNzGm1NnnN02lgPFSXem8k=;
        b=UCZp8uXhY4BRY0HsN1kizAwd2NGQeP4rsofRSqYuKHAFxFws/81Mtlwbm92m6cdJkr
         XqeYEaz+XlFAHxdUotUwIOJdr8132eapcIRDDkTU7Mto75ANbIkB+YIr8ziukcheqxg6
         ISxErwse3QjVnq1HfGeUG23fktqluivsvsZWNBJDxuIGMNlkIy5vxCVLghsJR67NhQGp
         +y8jN/+hcIYjy0Cfd+ts7ZAtkoe8YoihFdI96APN4xsJ+rao9A6vyJREqSth6RUvrR1F
         nKehBDe9bE6BaYN6LTMPqEF+FomAihcr8G/1dLzh8W40crD5QQ/R2Tid9+xWglnSiduV
         smRQ==
X-Gm-Message-State: AOJu0Yy4D/xDL7dlw1NOguBsWwaBZrj6cWJXNzBOSeVpWYXiJGbaR6u3
	TazmtI9HvMSK5b50VL8Gp9H05r+/lCC9NFQI+ye2l9Xzkz5lcdwrPFWNMQ==
X-Google-Smtp-Source: AGHT+IGtokTzR632jhmVdgedTMJrFsrh0h0JzMdGcK3dlxBq/jNCMSfKhto3WlqN6SA2oXtoThJDog==
X-Received: by 2002:aca:2107:0:b0:3c9:963b:7f7f with SMTP id 5614622812f47-3d1a61134admr177638b6e.28.1716488457750;
        Thu, 23 May 2024 11:20:57 -0700 (PDT)
Received: from localhost.localdomain ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3c9b9e8df7bsm3328511b6e.12.2024.05.23.11.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:20:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/image: Add hooks
Date: Thu, 23 May 2024 12:20:54 -0600
Message-ID: <20240523182054.2253490-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 18:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199815

Add variables to add arbitrary hooks into postfuncs and cleandirs. This
is required by SPDX to capture the files created in the image functions.
In addition, report the image type in a similar manner to subimages so
that the hooks can know the original image type

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..f5c8c8caeee 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -351,6 +351,9 @@ python setup_debugfs () {
     setup_debugfs_variables(d)
 }
 
+IMAGE_TASK_POSTFUNCS ?= ""
+IMAGE_TASK_CLEANDIRS ?= ""
+
 python () {
     vardeps = set()
     # We allow CONVERSIONTYPES to have duplicates. That avoids breaking
@@ -507,12 +510,15 @@ python () {
         d.setVar(task, '\n'.join(cmds))
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
+        d.setVarFlag(task, 'imagetype', realt)
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
+        d.appendVarFlag(task, 'postfuncs', ' ' + d.getVar("IMAGE_TASK_POSTFUNCS"))
+        d.appendVarFlag(task, 'cleandirs', ' ' + d.getVar("IMAGE_TASK_CLEANDIRS"))
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
-- 
2.43.2


