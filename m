Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6585FC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:47:05 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.4450.1717062421935841833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 02:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CB3ANKJN;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b0d25b54eso1014870e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717062420; x=1717667220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iagNw60ayZZSHCO1r8EBN754R2NUC8esybVRE2sgaxk=;
        b=CB3ANKJN1y4hsby4/X3iV1DdvDnr5SkH9N2M/tUTnUMtteTzeFUth9Yya3etHLU3dP
         Rm0cD2/gZhsMbqd1MkbQu6lWoksg7IGjiV75l8hF6kf9Clyw0IL1FyIKKZXJ2lvOhdCH
         BSLZQJw2ZEU+GX4vshBA62//NRRrskQBTzahBXYx9QyPOld8L1SShX/srUsE7iPmteRy
         xaBaTbLk7u5zgmL3vjEqFuZdwmWCgYdD1nL1iBqBgEn0bO9g0W1XKNKF14Pds0mEkrMY
         kp8jaMP7xOFE6/HuZmw9XLQwb/pHUE4yPWMQPBZI8MnNd8WL8Jd/hAsSMW64WlwKDIf4
         jnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062420; x=1717667220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iagNw60ayZZSHCO1r8EBN754R2NUC8esybVRE2sgaxk=;
        b=Fwu6DziugbpewmvpXQDr2Y+5T3XSCtHcLzgxEFoyFMIz+h8pBKX6oh0HN2OY/Vj3h7
         xd7GAdl/Dq73dBkaw2offo4PxSWyyMeRJfzorsz8Eis7MMMc80mnhwYBw9IB7uVDlbY8
         PrJKCKKzeTmDuWLG90CqE8TMcD7MRnZGRU5YBRQGpSGaf9KbZ1JuoDMPiqloKiSXSpNH
         2Shu+nsoIAy/yvb4Xc3SkL71C7qLNN9j4AvZr/xy4feUTH16RPPdc9njpgNRO+SNx3uT
         l1eWHRo2ea08YCIbTsD6MuQiw7uS0xhgm8bmDHbMzMgY9xiPMpp/M1wU2o4DWhHCkAq+
         FfkA==
X-Gm-Message-State: AOJu0YyVqW0o85/khVVufFri7WX950yUz4sTC0zfRIveWT/KrJ5qz9GV
	MYVd5XhzX8JZ/SfP/eLeULH9CosJx2G6AKXQSGZDySMGD7rIODPK44b1aA==
X-Google-Smtp-Source: AGHT+IEZUA/2Q3Awnp3UE7/+9HDZejgMF8s1wc4GEC59Pm2xFWDc3viliGq2qAQWcxxbQhBoRLyHEA==
X-Received: by 2002:ac2:5338:0:b0:525:32aa:443e with SMTP id 2adb3069b0e04-52b7d4282demr1269142e87.17.1717062419556;
        Thu, 30 May 2024 02:46:59 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b547f82d8sm344332e87.279.2024.05.30.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:46:59 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
Date: Thu, 30 May 2024 11:53:14 +0200
Message-ID: <20240530095314.407638-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530095314.407638-1-marcus.folkesson@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200018

image-bootfiles class copy files listed in IMAGE_BOOT_FILES
to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..0b95d47e06
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,38 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Writes IMAGE_BOOT_FILES to the IMAGE_BOOT_FILES_DIR directory.
+#
+# Usage: add "inherit image-bootfiles" to your image.
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
+        os.makedirs(os.path.dirname(image_dst), exist_ok=True)
+        shutil.copyfile(image_src, image_dst)
+}
+
+IMAGE_PREPROCESS_COMMAND += "bootfiles_populate;"
-- 
2.45.1


