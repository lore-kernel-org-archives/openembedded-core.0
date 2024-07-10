Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B643BC3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 08:53:18 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.9633.1720601597329328392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 01:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0bxH7Z+;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e99060b41so6543432e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720601595; x=1721206395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31Iaif4FZebn4UJz3CQDME7mXRHasCRI7xM/6EyT8Vk=;
        b=Q0bxH7Z+FToOHz+kzlHkaGOg5bgzSv56lxYnhnPyMm5gulgD9tImStpssrKURXpAHt
         t/eb/hOsYL9J5TX9th30sD99Mtn7PD5tKfeRk48BYAPE0Ff46wR3h4C6C3DhYlh9t9kI
         Cu6V2eUSAVo9oplExH9s1sO25uYU23gd3SvGZyi6H5rGdoSFIRTjOA+izL+piHSqopzO
         KUnJYr3HFN30yX9fOq+kNvcHUX25BcO8jmuF/JUfhgiYIqDZBAfCvGgP227YQMYRcQsF
         2bdUecmCywP2pL+O/bJJTgz22rOg87uufAXAoBoeRqQExQRkkiiVtsWmark+TmjOYyad
         956w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601595; x=1721206395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31Iaif4FZebn4UJz3CQDME7mXRHasCRI7xM/6EyT8Vk=;
        b=EnKp9Iql3xAHsTWGonRUT2OeuvyGep4n34/ZWl4lCPhJygmz5Nh9+jfgJPRPpVp1RB
         CCRKoFP9B1xhQOsMqvYwFsSPYW66VsucYXBEkeZdHKLLckfOfsEh8jMF8wDDo0acBHTp
         QOtdvzHuSOtWwCwOUej87/+ZvwOTt3giTAO5ZrCLcRQXRHVLgU6DPVB2fidrBDvz0L7m
         EoijWMJ3Nj0STf0218Wse6XwTK4uNRf43mI8ERdlaK42CE7H6s08PLKf/yQnGzFRo+QP
         pWSxa/02+B4b2haUHpgfi06k3wG/44XuxLpjYZuz+veV2cAw7H6M6339WwplArqekTxb
         RJ5Q==
X-Gm-Message-State: AOJu0Yz4z1xhDlBwUQpo6tu0s0qFzWPOwFeQthA9shDY/WeHL1yw/jDP
	K1XIbom4BFlYOhPDV3KTgxuA9E9gK7BytyE8MZr02roU2hk0gCEq9yhk5w==
X-Google-Smtp-Source: AGHT+IF5nGvUYuKxpf0hz7u92a7lfVWrPcX1NpJ3lKrxsHC4O3MXSDXSpcQnwqkb74ZLszprY6qeGA==
X-Received: by 2002:a05:6512:3618:b0:52d:b0a5:cf3c with SMTP id 2adb3069b0e04-52eb99a2915mr2657580e87.40.1720601595024;
        Wed, 10 Jul 2024 01:53:15 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb906e86esm526621e87.279.2024.07.10.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:53:14 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
Date: Wed, 10 Jul 2024 10:53:10 +0200
Message-ID: <20240710085310.147425-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240710085310.147425-1-marcus.folkesson@gmail.com>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201693

image-bootfiles class copy files listed in IMAGE_BOOT_FILES
to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Konrad Weihmann <kweihmann@outlook.com>
---

Notes:
    v3:
            - Skip the intermediate bootfiles() function
            - Rename variable names to be consistent
            - Various python optimizations
    v4:
            - Correct usage description
            - Create image_dst before copy
    v5:
            - Check if install_files is [] rather than None
            - Print warning if overwriting files
            - run as ROOTFS_POSTPROCESS_COMMAND instead
    v6:
            - Collect tags to make it easier to apply

 meta/classes/image-bootfiles.bbclass | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..a17c92f66b
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,41 @@
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
+    if not install_files:
+        bb.warn("Could not find any boot files to install even though IMAGE_BOOT_FILES is not empty")
+        return
+
+    os.makedirs(boot_dir, exist_ok=True)
+    for src, dst  in install_files:
+        image_src = os.path.join(deploy_image_dir, src)
+        image_dst = os.path.join(boot_dir, dst)
+        if os.path.exists(image_dst):
+            bb.warn("%s does already exist and will be overwritten" % image_dst)
+
+        os.makedirs(os.path.dirname(image_dst), exist_ok=True)
+        shutil.copyfile(image_src, image_dst)
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "bootfiles_populate;"
-- 
2.45.1


