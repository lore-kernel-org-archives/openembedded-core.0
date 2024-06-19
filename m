Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913D9C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:32:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.19548.1718800363111780572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcKgYvr4;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cc148159dso2441507e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718800361; x=1719405161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR/l70oZOl7p/Bp/Ua/au6sBpDLwiTGpenamXcgD9NQ=;
        b=AcKgYvr4vPh2z4RuOMV4nWssw49V6DUxZzQtBxn0Yifs0cgJgoiaGdUKXRoEmgboHy
         KN58WRjDzjzU2GEHC3n1441JgTpyYuOwc4ojs+WM3jbqIiNBjLHoAmSKCDlFdbs2+VMb
         cb+3jqt18uK5KjT9dVdd183s6RpfMszhzjDo6N1z/Gh8FYXmk4eUGHTA02A+kcFhJwTQ
         +KXCd5Q5y/DIzCzdneWRlhqyboTZD2Bpct809wCzGGPLTfok06KCYnClbkRVRhL/1miZ
         ooizNLnQlA6qGdfoKFVOXwHpNWk05B/gFwjUFwgM9vb8KcSIBtbwgx4guHHLtjjEu2wo
         LXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800361; x=1719405161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR/l70oZOl7p/Bp/Ua/au6sBpDLwiTGpenamXcgD9NQ=;
        b=ZVoSpGQyTfHnc7ncAMvARo8fBjtbtyImzwNfRDZKSYd9H76NTNRQqqv/W3+Yv3rCa5
         rGAHcNYnsN5YVeEECBxrmua4L9SJEGmKOSR865vi6FTI1sZIJs+98jSdpXKKwfkG2t6x
         Kz8sOsoORU4/CgsmFLuv1Hi2SR2sCjRaUXAx/Sa0B36jDMpclBsD9d3746UI7gxixPcH
         6Yv9+w9NGQkKpcQIOk5kTcVAc7Tl7ybTrHtVXx1e4msbrcSNRel/JN/qX6X2VCFV8QJT
         JeY1UwJu8dlsXgJJu0p8CTbn1t46aPW8qwiNZEZpeECwurw0z6wyo4DgEIaa1WXk53hF
         8JBA==
X-Gm-Message-State: AOJu0YxtvSRb8XFwtgYCSqjKU5l8E+73pncoXQ3ACr1WkiyJc3FZlFPT
	fAIg9LUYnLYbE3EB4jDgxYlFgQ46XanzyR8IV1oOq8ubS7IWX/C1FqrzEQ==
X-Google-Smtp-Source: AGHT+IHl6TrctQZFYAtrCIvxNfQAfrKdXW7zkvy3/QVFPsRVg5zsk+c9TUVpQ+nkDLN9YrTUHnasOQ==
X-Received: by 2002:a05:6512:3107:b0:52c:8c85:cb46 with SMTP id 2adb3069b0e04-52ccaa98d48mr1488184e87.64.1718800360790;
        Wed, 19 Jun 2024 05:32:40 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872274sm1748092e87.140.2024.06.19.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:32:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 1/2] bootimg-partition: break out code to a common library.
Date: Wed, 19 Jun 2024 14:38:52 +0200
Message-ID: <20240619123853.2144538-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
References: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 12:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200910

Break out the code that parse IMAGE_BOOT_FILES to a common library.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---

Notes:
    v3:
       - Removed unnecessary "import glob"
       - Explicitely tell that bootfiles_populate() returns a tuple
    v4:
       - Remove the right "import glob" :-)
    v5:
       - No changes

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


