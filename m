Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6944AC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:02:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.17887.1716886943721516191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0sGmmSu;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-529644ec0ebso877288e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716886941; x=1717491741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RRvI0rOt4CJbBlcit3CV2en8Y1orna0z5BmXfyeNYI=;
        b=f0sGmmSuJ/n8wH8DZ/3eLy3xIPYXLmJMfBq7/We0DwfAwZRNDnsiFibPzq42GWQ2wd
         P0o1LqF8JuTdW95198b5n5z4aHKgr46CPaANWdz0SLQYNQkisuSYxWCXg5kv0xdFGDUN
         NKC+q4/jXdCyhlhKBGJ18A5zWsm8CEpIgO72kODHX6rmO41zXRqpMQEcyYlfP0ZQlsoq
         klQRMl9uGnQjefkeBADzDzMgmGQaqLIVEiPh+US9Bl6OSXdliWsXLQ+pDhKQ7eHuBBPN
         0rIdol3gLABKHYmBNY585Ax/lffF9q/pFQytY/agVYku3iAb0/wTUmbwNe4gxVvhyvHi
         OdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886941; x=1717491741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RRvI0rOt4CJbBlcit3CV2en8Y1orna0z5BmXfyeNYI=;
        b=xEUW6UpH94ZGnWZY5vG7mIUprQ+n9bE2BTtZJ/r5nQUP2tDP4bbt3zfsQ5WM4X3A1p
         z48I648itAeBTaBU3xlr2fqUPMjQNEBl5IGj8QUzBxhmuEjdcWqDiRiaeA2yPzt1u/lO
         ycN0BrL362FuQhhaurLWCBM4s7W6kJDsCZUGDgYgXAzDDmeubDaolI+ZrOX4ofhrrGKR
         31yn9S6XcDUTEbbio49YHaAIZd5BAGyGCgvum+D8t9rgIe8ax0Hl/z5xaMiQXPMwCN6x
         6lVTTYZb2b9CeAZogpFkqukv9rWTrID7OESYCIlDcQqCH5XAUzUYQn31YQ1+DOSKlrmU
         3xPA==
X-Gm-Message-State: AOJu0YxRsUzipEfJ2KQ9cLscby1Vyz+Vf4SZnAe4Oh0oi2xmyXx+Ncli
	IlhxV0PGtNpuhwFlEc7seds9kdA0xgTCcN4KP4Ykrjnfh0wV8g3ekRIRIA==
X-Google-Smtp-Source: AGHT+IHnKMCnpsnJoqP8rnlxAtuNw1w+ML4XpMy4zH+jOIQNKK/iSCtGmLs38azwo1zQpn54hUeonA==
X-Received: by 2002:ac2:4d1b:0:b0:51f:9549:9c0d with SMTP id 2adb3069b0e04-5296736bb92mr9256556e87.48.1716886941111;
        Tue, 28 May 2024 02:02:21 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c3327esm887095e87.196.2024.05.28.02.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:02:20 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
Date: Tue, 28 May 2024 11:08:32 +0200
Message-ID: <20240528090832.725884-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528090832.725884-1-marcus.folkesson@gmail.com>
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199960

image-bootfiles class copy files listed in IMAGE_BOOT_FILES
to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v3:
            - Skip the intermediate bootfiles() function
            - Rename variable names to be consistent
            - Various python optimizations

 meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..79c58f414a
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,38 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Writes IMAGE_BOOT_FILES to the IMAGE_BOOT_FILES_DIR directory
+#
+#
+# Usage: add inherit += "image-bootfiles" to your image
+#
+
+IMAGE_BOOT_FILES_DIR ?= "boot"
+
+python bootfiles_populate() {
+    import shutil
+    from oe.bootfiles import get_boot_files
+
+    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    boot_dir = os.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("IMAGE_BOOT_FILES_DIR"))
+
+    boot_files = d.getVar("IMAGE_BOOT_FILES")
+    if boot_files is None:
+        return
+
+    install_files = get_boot_files(deploy_image_dir, boot_files)
+    if install_files is None:
+        bb.warn("Could not find any boot files to install even though IMAGE_BOOT_FILES is not empty")
+        return
+
+    os.makedirs(boot_dir, exist_ok=True)
+    for src, dst  in install_files:
+        image_src = os.path.join(deploy_image_dir, src)
+        image_dst = os.path.join(boot_dir, dst)
+        shutil.copyfile(image_src, image_dst)
+}
+
+IMAGE_PREPROCESS_COMMAND += "bootfiles_populate;"
-- 
2.45.1


