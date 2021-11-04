Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3A8C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:07:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.12103.1636034838153996610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rsG3e+Se;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id g18so1187070pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iAIJuYCdrGuzT5KQTsg9LpjpdCV66NsJODy3dGL2vx0=;
        b=rsG3e+Se2HsNWO6bq+83lRBaXQOCzwN1llMmQLXGVfnw/BBoUY6hUNMgmOcli9Me9o
         zDfUVQ9z7jOJlV6HfQrC9BgKc2ndKNlElCcxHRpAy+KzuQc1/dnI3GN+Mct4Wwkr0jki
         aTsZMRGxVJZ8aBLzS/RMHki1Un+hqT70iyVsnn3x6ZDCNxaaW8iXiGip7de2Mt3jJwVp
         yfvzhqY5ah5YUVHSj7pVF2ymneqvBS0m2YeT4md+koDcPDlWs9KEJA7+HUqLYSVuDQiQ
         rMYbvlgxoEYG6MpTQK3wnoPjNKY3xg+cRnuzYerJSpmTO6FxTu6nEr9jmpoIKCrdV5Yk
         D0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAIJuYCdrGuzT5KQTsg9LpjpdCV66NsJODy3dGL2vx0=;
        b=gJLBTEGS71u2aTgh29xqScKZsKH1R5k/l0UWPlY6RF4QmlY+nx/EgC8rZPraKZTDjs
         UI6cHMedwbkptzVy61DMjHdLcTDT/7zvI5r18AaxxfTl20YM+VyvcYUyNYhc+Z1ExQDw
         85oU4P0ndYP6DKRtT7dnV0dcL2HujHVCDhmY67hcdnuV6Y4NIlJJXboHQQjaS2LJw5QW
         /cZEY3Mcf3TBpz0UPlth5+lA80/ZF4oR1VZSuMFUVHSbsqklXibskt/tOnjdA3xX0cqk
         sPwSS7zWnruMUY5TI599WWQWDpvSmFjtDhc2SUwym0Xpa6h2GsmGkpmLb1XaXhuIjKFu
         MoGg==
X-Gm-Message-State: AOAM5333MIWHxDVzoQ0GZXEvFbshI0b8YqAhXCRCJxOf7H1oO7ofQ90R
	jqG4+0uFJGpRRUSGTn3PXSD38KTh3+4ep/VZs/g=
X-Google-Smtp-Source: 
 ABdhPJwc+rnwM8xlsYMhvzpWmHuvbUFEhipvpU8qmi83DDqIKVEl3aa6nF1EFXRNqXVSJ5PK1eXJ8Q==
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr51736133pfl.82.1636034836975;
        Thu, 04 Nov 2021 07:07:16 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m22sm4973291pfo.71.2021.11.04.07.07.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:07:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] scripts/convert-srcuri: Backport SRC_URI
 conversion script from master branch
Date: Thu,  4 Nov 2021 04:06:47 -1000
Message-Id: 
 <904bdbab712e2f3c332c4d85d08ed83c957e249f.1636034660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636034660.git.steve@sakoman.com>
References: <cover.1636034660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:07:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157846

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This script handles two emerging issues:

1. There is uncertainty about the default branch name in git going forward.
To try and cover the different possible outcomes, add branch names to all
git:// and gitsm:// SRC_URI entries.

2. Github are dropping support for git:// protocol fetching, so remap github
 urls as needed. For more details see:

https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/contrib/convert-srcuri.py | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 scripts/contrib/convert-srcuri.py

diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
new file mode 100755
index 0000000000..5b362ea2e8
--- /dev/null
+++ b/scripts/contrib/convert-srcuri.py
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+#
+# Conversion script to update SRC_URI to add branch to git urls
+#
+# Copyright (C) 2021 Richard Purdie
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import re
+import os
+import sys
+import tempfile
+import shutil
+import mimetypes
+
+if len(sys.argv) < 2:
+    print("Please specify a directory to run the conversion script against.")
+    sys.exit(1)
+
+def processfile(fn):
+    def matchline(line):
+        if "MIRROR" in line or ".*" in line or "GNOME_GIT" in line:
+            return False
+        return True
+    print("processing file '%s'" % fn)
+    try:
+        if "distro_alias.inc" in fn or "linux-yocto-custom.bb" in fn:
+            return
+        fh, abs_path = tempfile.mkstemp()
+        modified = False
+        with os.fdopen(fh, 'w') as new_file:
+            with open(fn, "r") as old_file:
+                for line in old_file:
+                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and matchline(line):
+                        if line.endswith('"\n'):
+                            line = line.replace('"\n', ';branch=master"\n')
+                        elif line.endswith(" \\\n"):
+                            line = line.replace(' \\\n', ';branch=master \\\n')
+                        modified = True
+                    if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
+                        if "protocol=git" in line:
+                            line = line.replace('protocol=git', 'protocol=https')
+                        elif line.endswith('"\n'):
+                            line = line.replace('"\n', ';protocol=https"\n')
+                        elif line.endswith(" \\\n"):
+                            line = line.replace(' \\\n', ';protocol=https \\\n')
+                        modified = True
+                    new_file.write(line)
+        if modified:
+            shutil.copymode(fn, abs_path)
+            os.remove(fn)
+            shutil.move(abs_path, fn)
+    except UnicodeDecodeError:
+        pass
+
+ourname = os.path.basename(sys.argv[0])
+ourversion = "0.1"
+
+if os.path.isfile(sys.argv[1]):
+    processfile(sys.argv[1])
+    sys.exit(0)
+
+for targetdir in sys.argv[1:]:
+    print("processing directory '%s'" % targetdir)
+    for root, dirs, files in os.walk(targetdir):
+        for name in files:
+            if name == ourname:
+                continue
+            fn = os.path.join(root, name)
+            if os.path.islink(fn):
+                continue
+            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
+                continue
+            processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.25.1


