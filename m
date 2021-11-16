Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C129C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649298"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649298"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023995"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/14] scripts/convert-srcuri: Backport SRC_URI
 conversion script from master branch
Date: Tue, 16 Nov 2021 11:24:16 +0800
Message-Id: 
 <b0667c83c65c9900d63a7d8a2ce88384dcc2ccc5.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158333

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This script handles two emerging issues:

1. There is uncertainty about the default branch name in git going forward.
To try and cover the different possible outcomes, add branch names to all
git:// and gitsm:// SRC_URI entries.

2. Github are dropping support for git:// protocol fetching, so remap github
 urls as needed. For more details see:

https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.33.1


