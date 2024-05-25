Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1F5C25B79
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 08:44:25 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.7682.1716626658177358807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 01:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejYhZl67;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e8a8ff4083so36744301fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716626656; x=1717231456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKkTAfGJshFym1qqoZcy1s3uGlSWamquC/pMjQUJ7ks=;
        b=ejYhZl67te6S/yxqJIGwyEmgIweSE+aiA982v18yBA5XBnrFG7ei3YhqYZUzxaf9h+
         yoNyow/apcgPTWeEq2/Gt96+nvyYdmUQ+1JZ5/B2ZN1z2HzsqmUgaNPPIrgmZIytDfes
         +jrqHQEnfURCZSyZwYscv1p6IhohjrziRFXu7IEyHk1C1pQj2/W2obuyZZCdQ9mTBiWw
         nIoKEjacgMmp0U/VY6/OzdWp+lIBGzeDBQKzQz/NZKaDmGXM5Sb86E+uBdtJ+rZVCA9t
         B9jVVCUyrSG/Exo0ad9/wREsD7pUI9PXOXsY6HiEHY/sM2nsWk4kqtw/2jd2eCCXdvnE
         dcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716626656; x=1717231456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKkTAfGJshFym1qqoZcy1s3uGlSWamquC/pMjQUJ7ks=;
        b=udPAU/pn+WEZY+Lks7bndUTX1pSkA34Dl07DBQSPWr/zIj/kTjdZNazQRQTm7BAR9+
         VOk5ukjAWiH7q1L8xqN1aJ7Mwc25t+mOgrIb08p+O5stB9gzqpej6t3ddfP9CKJj3ZZ0
         pLdB5DTCNbziI7MxeEamV8JlDQFxErjr4pFs2MNPCfFOVh5s0pZrI6YxVTIZwedH0YRq
         l1lys/WagxIBkwOkyP/yNAJvv0J3V5JSaDIY+us7+Pv2Dtdnyuk2blIRnV05dOmFWZL8
         Alw4OLN6aHoOpi4QduJp0+0dpUEA+6O9qkKEJ8wFGak2O2mP/p8PKhLqbB8yhHRtvKu2
         E8BA==
X-Gm-Message-State: AOJu0YyGdGIE/9GMdO0am8GJwkc3nUP+f5T/eDHuUp14NAOyL0SKqQ0d
	FKvA492yuL/DbbwUf5S7lecRuWzxgAAmklxYCSZJPx7S95jV+WaOdhMZNg==
X-Google-Smtp-Source: AGHT+IEM9GszHPBbdcSdZsBxNxw3q6iNlyZmmWizRp/48ZV235iFBaYj2lWOCbxLQFy2LK0nrTFYwg==
X-Received: by 2002:a2e:7316:0:b0:2e6:d1fb:446e with SMTP id 38308e7fff4ca-2e95a095f03mr13369161fa.3.1716626655353;
        Sat, 25 May 2024 01:44:15 -0700 (PDT)
Received: from localhost.localdomain (c80-216-168-104.bredband.tele2.se. [80.216.168.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd1cb0sm6197871fa.91.2024.05.25.01.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 01:44:14 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 1/2] bootimg-partition: break out code to a common library.
Date: Sat, 25 May 2024 10:50:22 +0200
Message-ID: <20240525085023.6042-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525085023.6042-1-marcus.folkesson@gmail.com>
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199866

Break out the code that parse IMAGE_BOOT_FILES to a common library.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 2 files changed, 59 insertions(+), 36 deletions(-)
 create mode 100644 meta/lib/oe/bootfiles.py

diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
new file mode 100644
index 0000000000..81e09f138e
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
+
+# Look into deploy_dir and search for boot_files.
+# Returns a list with files to copy.
+#
+# Heavily inspired of bootimg-partition.py
+#
+def get_boot_files(deploy_dir, boot_files):
+    import re
+    import os
+    from glob import glob
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
2.44.0


