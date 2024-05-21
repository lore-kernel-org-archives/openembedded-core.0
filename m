Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D53C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:28:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1877.1716312507527243424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aM1n4PRk;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52388d9ca98so7986004e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716312505; x=1716917305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8+w02dJucNbP0Ce+8WYuEQvWonMU+PmXL/RRXTsezE=;
        b=aM1n4PRkth8uD3k+hO+xtKlE6LUcVjr4jL5pSGwfW58zhCG3gQEywt62k26Hj1upQp
         FOD4YwuppjxAPJvrCMKVcS/G031tWRIZ+YIlUkZ1fSxhatg9dbE5e19tR+FPEpfWD6hz
         A59klJvfvcSY5YAG693s6HvrlyYEr6FGXp16B+iIpUaJD7l4bP1/nsToSklIjHV8toFB
         t3J4YzHKVaNFrrkXvf6WZDxfcoaw+kQcCJTKNTSvwuWiUV647bZVH3sqMdeCJnTMskeY
         VW0r+cC+wjuPTVrTnGcYX/PurCqYU5eq2uvkc0g8iKeeNzPbLjHWiXHSmbPwcqK2fjBu
         8xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312505; x=1716917305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8+w02dJucNbP0Ce+8WYuEQvWonMU+PmXL/RRXTsezE=;
        b=CSOuOKx4JN7/2yJ2MN+z8Bd0ou0ojOJ+ZWWdgwwAvOk393d0OXXE7uTxBZ87nZYggv
         jEKcVvbua1Jp4/M5EileOAorZ+ztNfMpIVd5X4hoKqzMaYXo41xAit2ZyrnqxIITKL5B
         80GGgGRqLimEQkVtgYtN/xJxbjCw8ErL9Tk/saNWTWbbY0MsCaId9n8aDMzNVjnnJ3op
         t87vaUt5MePSDST6bM5PySLrDQLhRssh/p5RcnDzlEvhuWfwSJCzMWhv9a7BDxcCSk9M
         PGaKzFKHu/q6tZ9N45hFKCcD1DMpjxkCyENSQjU7tpv5bU/pAweqkuerNsJkUMf9jFK7
         tv3w==
X-Gm-Message-State: AOJu0YxyYSoyRgwzdJQ4jaYDR2xhsYBthjYjZCLmyJe0bPb+F4x5QZ5s
	3WsSTBpEeGjOdZZtxRVOKmAa1JoGrKinAnXocukpwj995J9E5q8ajXHSxQ==
X-Google-Smtp-Source: AGHT+IG7/gJ3K6wlmsuGbGvXLxI9wTf12tIokeGKwjQhQ2sf7v44A0pRHgER/vuMEAeXbSP5Oaiakw==
X-Received: by 2002:ac2:5f59:0:b0:521:92f6:3d34 with SMTP id 2adb3069b0e04-5220fd7c838mr24816400e87.22.1716312504909;
        Tue, 21 May 2024 10:28:24 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad4dbsm4727167e87.50.2024.05.21.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:28:24 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 1/2] image-bootfiles.bbclass: new class, copy boot files to /boot on rfs
Date: Tue, 21 May 2024 19:33:42 +0200
Message-ID: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199667

image-bootfiles class copy files listed IMAGE_BOOT_FILES
to the /boot directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..850e14e4bb
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,69 @@
+#
+# Writes IMAGE_BOOT_FILES to the /boot directory
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+# Inspired of bootimg-partition.py
+#
+# Usage: add INHERIT += "image-bootfiles" to your conf file
+#
+
+def bootfiles_populate(d):
+    import re
+    from glob import glob
+    import shutil
+
+    boot_files = d.getVar("IMAGE_BOOT_FILES")
+    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
+    install_files = []
+
+    if boot_files is None:
+        return
+
+    # list of tuples (src_name, dst_name)
+    deploy_files = []
+    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+        if ';' in src_entry:
+            dst_entry = tuple(src_entry.split(';'))
+            if not dst_entry[0] or not dst_entry[1]:
+                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
+        else:
+            dst_entry = (src_entry, src_entry)
+
+        deploy_files.append(dst_entry)
+
+    for deploy_entry in deploy_files:
+        src, dst = deploy_entry
+        if '*' in src:
+            # by default install files under their basename
+            entry_name_fn = os.path.basename
+            if dst != src:
+                # unless a target name was given, then treat name
+                # as a directory and append a basename
+                entry_name_fn = lambda name: \
+                                os.path.join(dst,
+                                             os.path.basename(name))
+
+
+                srcs = glob(os.path.join(deploy_image_dir, src))
+                for entry in srcs:
+                    src = os.path.relpath(entry, deploy_mage_dir)
+                    entry_dst_name = entry_name_fn(entry)
+                    install_files.append((src, entry_dst_name))
+            else:
+                install_files.append((src, dst))
+
+    for entry in install_files:
+        src, dst = entry
+        image_src = os.path.join(deploy_image_dir, src)
+        image_dst = os.path.join(boot_dir, dst)
+        shutil.copyfile(image_src, image_dst)
+
+python bootfiles () {
+   bootfiles_populate(d),
+}
+
+IMAGE_PREPROCESS_COMMAND += "bootfiles;"
-- 
2.44.0


