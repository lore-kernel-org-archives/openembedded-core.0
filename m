Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD77C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:32:53 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.19809.1718800364555474024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0rzyWmj;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c85a7f834so8256155e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718800362; x=1719405162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIOEMMgj54vIUlMv/AXgE2zNDST1X6/V8oKGPH9Wsxo=;
        b=D0rzyWmjcr6zkwF6cN7mio2o5DTRm5k/nnp6uC205xLtdEIFHqimfpuKdN/HS5VlpP
         v/ZY5JkykFRfqAujyqFwlclXhFqn9nfa5h8n8IV1QdiE5USGumieAicp9RXADxe8fq2d
         VP2HWU8XlL//1vNHIbdBLD47T9QJyss52fgciYS4fxj47635InVdjnkVJo7xE/8RduKK
         HGU+bFHEIs8amfNwPB1gry8FVVDn6NKDGTn75h6o1/IfU4hoASq/uMJGuyp+VGw+2roB
         xtp6RblQNgWMrT3er4jdv0ESeb/vf2mLRIVDxrGKM1EYWrT8B/WIRjzgAu1fPKro1WWv
         laPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800362; x=1719405162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIOEMMgj54vIUlMv/AXgE2zNDST1X6/V8oKGPH9Wsxo=;
        b=mS7QNVqIxW/S+XYI4sWPQTvtuONuDvyJUv/DLM3pzxMhMtm2gm0no16N7Ycot7gehU
         OVuz7J5CbZfc8U9Ew3t13S1KzrsQQ04wdoJUjFXP23IKyoIvNR8TBOE9BV/8w8qesixV
         xQCOzaV9W67tuJ0MHWmSMeCffEGN09qsqWtECTkwZMG3dxFYquzOSx8N4E8WM90bid4O
         q5TIzR7gKGHI9LcZwDKo66IAg4g8OlpyX4LauAljDAFYdFctX4M1v4lWdk2wBhLkWvGF
         J5txafQSP2bpTw+6v6Et6B/hbibM8dOw+ubxtvpCPdIZm0kAx4hYpII+wnBfKAerISxX
         boSg==
X-Gm-Message-State: AOJu0YxNqZcdc4bhL6UftRF/Y1mdDWvDJpzlTIYkQmAX7+CfBhGyQHGx
	AMLF/2MEqW70ZiH1cStWzQD/UaEpNbZUUJ4TJzMQ4P31fJH0apy6iMbsWA==
X-Google-Smtp-Source: AGHT+IGmBZ9L+aM5gsy0W5foUDhazzTLrYCeZdPmLUtsz/dmgPS6brV0YK4uRtvM8jSbmmFWeAG9yg==
X-Received: by 2002:a05:6512:114b:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-52ccaa61388mr1472541e87.40.1718800362036;
        Wed, 19 Jun 2024 05:32:42 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872274sm1748092e87.140.2024.06.19.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:32:41 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
Date: Wed, 19 Jun 2024 14:38:53 +0200
Message-ID: <20240619123853.2144538-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
References: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 12:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200911

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
    v4:
            - Correct usage description
            - Create image_dst before copy
    v5:
            - Check if install_files is [] rather than None
            - Print warning if overwriting files
            - run as ROOTFS_POSTPROCESS_COMMAND instead

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


