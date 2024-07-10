Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85063C3DA49
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 08:53:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9632.1720601596712715806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 01:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbqoOlT2;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52eafa1717bso3383784e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720601594; x=1721206394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddDq9eRzyJV2tQY3CzAEsvAUurPxdiq6+FCrsVJ4C8I=;
        b=PbqoOlT2uFL2vauRc6vUfwiI5OOS8PaiOdaHayK14Zpb3O5QaR8+mtEEncx4dxhXLg
         SXBrq0389sZg4NvAWdoxXHitG44YzzIqbQxjcKJ2SRXNSUBE6JSm2c9KfUsgLDf4n8xM
         fpYxI0ps9CdnUHx8/pEdDDDHRqYA26yCruKRoBwCcN9Ji6reMAye5p4vWUNq7fy20/fX
         8kWw1V5WZr8VKR61N8un0bWtlt4fr984S3QUD6zQv795Njr6EDRWIKD9G6+GQN9HQTxb
         8yCp51dmYdE9s2t88nsjkuV5c/nhFxzrwqrvOBDAP2vCKSLbCqIdeu3xpJdNa7y1ZmuO
         pPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601594; x=1721206394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddDq9eRzyJV2tQY3CzAEsvAUurPxdiq6+FCrsVJ4C8I=;
        b=NYv9R91uESlikQyW0o9e3AE9G0/ZU1Uljt59kjOcz28O5m3+9mLBvGnQXJrDkgebOH
         9PDEaFxGSvozHIpXunryqZc/KADyDKBBavCaWpR934bxKf72iM8FITowzYkZKl8hlB7R
         mlA+6V267ncNwcFaK/hZq433/yeBdZWx7Weo8vrDjRScmrdeJXrmUyxcbbv6xQm/Z15x
         gHyRUdx9BuWcTFiajaCNPqS/iIxbOWQx/L26TGpwRNJ4X2raxDom7nYb9n73fCCZ8ZWO
         YULZfLuB5mMI/npJaAFF0TGGSG+uP2Kelcby+W7hA5R1CmY2li0lUQ6GzxM7u8M/w7vh
         hskA==
X-Gm-Message-State: AOJu0YzEZKRa5D9Fh2YOx/2zbmXKwZQw/4F4klCX3a74t0sJ49ewhDEb
	cqoSgGDdssXaGB8aoSx3gub+kWWPfqtGxjLwTqOhK3+CtWRHBXlQE2A9dQ==
X-Google-Smtp-Source: AGHT+IFQnut/Ter7vdnYvi25RI5qRfc31kYX4jTSso2oRYCFm0w+blQHjZGli6fZIfDZZMXPhqvPeQ==
X-Received: by 2002:a05:6512:130a:b0:52e:bdbf:d780 with SMTP id 2adb3069b0e04-52ebdbfd884mr1940015e87.59.1720601593920;
        Wed, 10 Jul 2024 01:53:13 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb906e86esm526621e87.279.2024.07.10.01.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:53:13 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 1/2] bootimg-partition: break out code to a common library.
Date: Wed, 10 Jul 2024 10:53:09 +0200
Message-ID: <20240710085310.147425-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240710085310.147425-1-marcus.folkesson@gmail.com>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201692

Break out the code that parse IMAGE_BOOT_FILES to a common library.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Konrad Weihmann <kweihmann@outlook.com>
---

Notes:
    v3:
       - Removed unnecessary "import glob"
       - Explicitely tell that bootfiles_populate() returns a tuple
    v4:
       - Remove the right "import glob" :-)
    v5:
       - No changes
    v6:
        - Collect tags to make it easier to apply

 meta/lib/oe/bootfiles.py                      | 57 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 2 files changed, 59 insertions(+), 37 deletions(-)
 create mode 100644 meta/lib/oe/bootfiles.py

diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
new file mode 100644
index 0000000000..155fe742db
--- /dev/null
+++ b/meta/lib/oe/bootfiles.py
@@ -0,0 +1,57 @@
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
index 1071d1af3f..589853a439 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -16,7 +16,7 @@ import logging
 import os
 import re
 
-from glob import glob
+from oe.bootfiles import get_boot_files
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -66,42 +66,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
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


