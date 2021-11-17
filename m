Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E80C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 02:18:37 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.1573.1637115515992442447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 18:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AH2IYjj005707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 18:18:34 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 16 Nov 2021 18:18:33 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 16 Nov 2021 18:18:33 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] wic: use shutil.which
Date: Wed, 17 Nov 2021 10:16:23 +0800
Message-ID: <20211117021623.40351-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 02:18:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158375

From: Mingli Yu <mingli.yu@windriver.com>

Use shutil.which to find the executable instead to silence the below warning:
 $ cat tmp/work/intel_x86_64-poky-linux/core-image-base/1.0-r5/temp/log.do_image_wic
 [snip]
 DEBUG: Executing shell function do_image_wic
 /path/layers/oe-core/scripts/wic:27: DeprecationWarning: The distutils package is deprecated and slated for removal in Python 3.12. Use setuptools or check PEP 632 for potential alternatives
  from distutils import spawn
 INFO: Creating image(s)...
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 scripts/lib/wic/engine.py | 4 ++--
 scripts/lib/wic/misc.py   | 4 ++--
 scripts/wic               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 018815b966..eb1e921854 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -19,10 +19,10 @@ import os
 import tempfile
 import json
 import subprocess
+import shutil
 import re
 
 from collections import namedtuple, OrderedDict
-from distutils.spawn import find_executable
 
 from wic import WicError
 from wic.filemap import sparse_copy
@@ -245,7 +245,7 @@ class Disk:
             for path in pathlist.split(':'):
                 self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
 
-        self.parted = find_executable("parted", self.paths)
+        self.parted = shutil.which("parted", path=self.paths)
         if not self.parted:
             raise WicError("Can't find executable parted")
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 57c042c503..3e11822996 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -16,9 +16,9 @@ import logging
 import os
 import re
 import subprocess
+import shutil
 
 from collections import defaultdict
-from distutils import spawn
 
 from wic import WicError
 
@@ -122,7 +122,7 @@ def find_executable(cmd, paths):
     if provided and "%s-native" % recipe in provided:
         return True
 
-    return spawn.find_executable(cmd, paths)
+    return shutil.which(cmd, path=paths)
 
 def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     """
diff --git a/scripts/wic b/scripts/wic
index 57197c2048..4bcff8f79c 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -22,9 +22,9 @@ import sys
 import argparse
 import logging
 import subprocess
+import shutil
 
 from collections import namedtuple
-from distutils import spawn
 
 # External modules
 scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -47,7 +47,7 @@ if os.environ.get('SDKTARGETSYSROOT'):
             break
         sdkroot = os.path.dirname(sdkroot)
 
-bitbake_exe = spawn.find_executable('bitbake')
+bitbake_exe = shutil.which('bitbake')
 if bitbake_exe:
     bitbake_path = scriptpath.add_bitbake_lib_path()
     import bb
-- 
2.17.1


