Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570DDC41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:02:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.17886.1716886942848314911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wv1JTc+T;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52961b77655so697098e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716886941; x=1717491741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR07whPwSvLTZKyPK1fPpOg6D/SS5V6eCQDwuFCn1xY=;
        b=Wv1JTc+TMVvmCRUoyMScoRnSWcl0J/69byR7bIy8vf3p72p9FeQ1BaVHB9Q3E0nHm/
         7BGTJURNdrnxvVDhGd038YbPPiZQCJv2djYqvoyPYk0+AEc+4D9VMF4GineCGHM+eb21
         rbNKLYVYiknKmLoYlMR9vijpKYozY+wA6hTTMXOQFZa3/lApH8uHQIRGVV+c34q8c1W1
         mukJNK48WtgYYeWKTfWwE+ASheW29Kc17TJIsivheO1dBJS/NvRX8e/9E12MsNgG2geP
         eRxiXLEyiRWrFtJkYEVIPVX/qU3tcWeJV/XukeUgEaZ7cN7jskf8IOteQXO6sQ1zFwVF
         RCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886941; x=1717491741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR07whPwSvLTZKyPK1fPpOg6D/SS5V6eCQDwuFCn1xY=;
        b=Qt5mjDvejMYKCLNxagohlzwHUh43I3EEdJ96RH4U2NP2AMA9iLaFCxub0E5cpzjjwK
         O26yCnlh0iEDMd4WbHYZD8Ow9y0aTMuhSGcIglORvwgiEnLv0g0fzhvyDxEIywRA5eHk
         Ws4ZtgSSku9ZTFdMmO53+g9OFySZElqFEhXRdjCGxZvelZmzHb4hbCU+Ga8PRmVAsXYt
         CbgVYFyqWj2t2tDGQwwQNYylYjMcEvNOJk0qRE8IMD4tses9ZmlFIRaw6knfvx3TyVyy
         IpI3C7Vbau8/37xTaZz/TmAUP3TkKjkiYjM6rCB/VWC0KUjBItcs09oT/PpgduBty2d/
         BsKg==
X-Gm-Message-State: AOJu0Yx8QKlav2mR/HerxO9qt7v827WhMbiJlUqPtK0lXALwJDD//9NY
	zkgOC/9+4Cs9/Le2Iofnvs1GBlrkNJ5Ddfa4p1Q5tmiIlYWwyPm+C96JgQ==
X-Google-Smtp-Source: AGHT+IGNFv3R8x2Y5eHfaAokJIdbJbwaTtnOABptA87cBESSVN4+7+pDkcPvBFORIkewSq0p9CVarg==
X-Received: by 2002:ac2:4432:0:b0:51d:8d56:6b15 with SMTP id 2adb3069b0e04-529644ec1b3mr6476760e87.1.1716886940290;
        Tue, 28 May 2024 02:02:20 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c3327esm887095e87.196.2024.05.28.02.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:02:19 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 1/2] bootimg-partition: break out code to a common library.
Date: Tue, 28 May 2024 11:08:31 +0200
Message-ID: <20240528090832.725884-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528090832.725884-1-marcus.folkesson@gmail.com>
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199959

Break out the code that parse IMAGE_BOOT_FILES to a common library.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---

Notes:
    v3:
       - Removed unnecessary "import glob"
       - Explicitely tell that bootfiles_populate() returns a tuple

 meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 2 files changed, 59 insertions(+), 36 deletions(-)
 create mode 100644 meta/lib/oe/bootfiles.py

diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
new file mode 100644
index 0000000000..666141df4e
--- /dev/null
+++ b/meta/lib/oe/bootfiles.py
@@ -0,0 +1,56 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Utility functions handling boot files
+#
+# Look into deploy_dir and search for boot_files.
+# Returns a list of tuples with (original filepath relative to
+# deploy_dir, desired filepath renaming)
+#
+# Heavily inspired of bootimg-partition.py
+#
+def get_boot_files(deploy_dir, boot_files):
+    import re
+    import os
+
+    if boot_files is None:
+        return None
+
+    # list of tuples (src_name, dst_name)
+    deploy_files = []
+    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+        if ';' in src_entry:
+            dst_entry = tuple(src_entry.split(';'))
+            if not dst_entry[0] or not dst_entry[1]:
+                raise ValueError('Malformed boot file entry: %s' % src_entry)
+        else:
+            dst_entry = (src_entry, src_entry)
+
+        deploy_files.append(dst_entry)
+
+    install_files = []
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
+            srcs = glob(os.path.join(deploy_dir, src))
+
+            for entry in srcs:
+                src = os.path.relpath(entry, deploy_dir)
+                entry_dst_name = entry_name_fn(entry)
+                install_files.append((src, entry_dst_name))
+        else:
+            install_files.append((src, dst))
+
+    return install_files
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 1071d1af3f..b22a448b65 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -18,6 +18,8 @@ import re
 
 from glob import glob
 
+from oe.bootfiles import get_boot_files
+
 from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
@@ -66,42 +68,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         logger.debug('Boot files: %s', boot_files)
 
-        # list of tuples (src_name, dst_name)
-        deploy_files = []
-        for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
-            if ';' in src_entry:
-                dst_entry = tuple(src_entry.split(';'))
-                if not dst_entry[0] or not dst_entry[1]:
-                    raise WicError('Malformed boot file entry: %s' % src_entry)
-            else:
-                dst_entry = (src_entry, src_entry)
-
-            logger.debug('Destination entry: %r', dst_entry)
-            deploy_files.append(dst_entry)
-
-        cls.install_task = [];
-        for deploy_entry in deploy_files:
-            src, dst = deploy_entry
-            if '*' in src:
-                # by default install files under their basename
-                entry_name_fn = os.path.basename
-                if dst != src:
-                    # unless a target name was given, then treat name
-                    # as a directory and append a basename
-                    entry_name_fn = lambda name: \
-                                    os.path.join(dst,
-                                                 os.path.basename(name))
-
-                srcs = glob(os.path.join(kernel_dir, src))
-
-                logger.debug('Globbed sources: %s', ', '.join(srcs))
-                for entry in srcs:
-                    src = os.path.relpath(entry, kernel_dir)
-                    entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
-            else:
-                cls.install_task.append((src, dst))
-
+        cls.install_task = get_boot_files(kernel_dir, boot_files)
         if source_params.get('loader') != "u-boot":
             return
 
-- 
2.45.1


