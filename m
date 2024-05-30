Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5234AC41513
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:47:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.4449.1717062421245601694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H3l2srJk;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b59f77670so813422e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717062419; x=1717667219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXmAXdZyVnBWeAjP04DROARVdhV2kgvjVbIFMnbvFl0=;
        b=H3l2srJkzEV9Puu6c5qT4mIv4hwc5MVI7vFuVEofSZ9ZNn31h2lW3zgs9RIcfz2tTJ
         +oGof7AKp6FI5UIzF0YBmvvcldTQRDVkAyxBfgj/LQDWHfUyxTn63LnMRMULIml5A+o2
         L9Ym3lUJOCEwbNfHicPnQ8DSwXON3+yBVN4AicIDW9+kA9rd8kjrVxMqKlo5/wHdMF1u
         31/Fup/QeNgMMtnmRxmIChr+ayQUfg9JOp3y++cxrPaQ0TjTBa3Bj6vtze7htJhi7hRU
         G0IUZvs1mRkZGw8bzDgrUyTk6AFiwMhRT5SCZV73naVvF0aTHArTatyE3Q1cG2jny0o4
         I5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062419; x=1717667219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXmAXdZyVnBWeAjP04DROARVdhV2kgvjVbIFMnbvFl0=;
        b=Q/15ODWHpDCVrfsd9mOkgI0E0WwofWtJ98EldZdIhli69qKQ9nWxpoQDjJEC4cO48i
         sUlV5iOOllMFLrzg64d0EyMhBcLC5iwv9ANnXN1+1HETH8u+LKvYuWtGN1Lj9eqMMhT2
         Ka3H7glODZsh6+hYzESpAUXpeihg5rPVZ7Fe9dd+rKUnFUQPtSanVJEGYOCWcP9+vWEF
         fOULcLh8yG/fP97gnFWFOaZW2Q8p+zOgB+38q/NBLG8CPHJfXlVwQ0ZsO+fpiAJ2DDQz
         e/dn9JMGooVpe0ASPYPMUogHqIsh4/EbrszPnbEExX7TOTnceTvN31L5iZWXWmHkcThi
         zUcg==
X-Gm-Message-State: AOJu0YzAA5WAU6bUkZal022DhqqOMS378jTzG0aOReTo3PTQ6gVKJy2H
	Hcg3TKNJ2Sp0r01IBr5MI1pKfJCicMiqyhTMUryJq8GuxWqR9O/BlzVhxQ==
X-Google-Smtp-Source: AGHT+IGRXW013mv3ZlCPqWFWlYDc+31OqHgbXvvZW+y86QCS17TMN7l7urlmMbDekGNs2MVRCWKi9w==
X-Received: by 2002:ac2:43a1:0:b0:51c:d05b:6b8d with SMTP id 2adb3069b0e04-52b7d4263b2mr1756198e87.23.1717062418786;
        Thu, 30 May 2024 02:46:58 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b547f82d8sm344332e87.279.2024.05.30.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:46:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 1/2] bootimg-partition: break out code to a common library.
Date: Thu, 30 May 2024 11:53:13 +0200
Message-ID: <20240530095314.407638-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530095314.407638-1-marcus.folkesson@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200017

Break out the code that parse IMAGE_BOOT_FILES to a common library.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
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


