Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06645C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344618"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918861"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/14] wic: use shutil.which
Date: Wed,  1 Dec 2021 15:16:07 +0800
Message-Id: 
 <17e2839001076f7fc56a7cf62196b087351083f1.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159010

From: Mingli Yu <mingli.yu@windriver.com>

Use shutil.which to find the executable instead to silence the below warning:
 $ cat tmp/work/intel_x86_64-poky-linux/core-image-base/1.0-r5/temp/log.do_image_wic
 [snip]
 DEBUG: Executing shell function do_image_wic
 /path/layers/oe-core/scripts/wic:27: DeprecationWarning: The distutils package is deprecated and slated for removal in Python 3.12. Use setuptools or check PEP 632 for potential alternatives
  from distutils import spawn
 INFO: Creating image(s)...
 [snip]

[RP: Added conversion for missed function reference]
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3966cbf5c8a2dbc3a4f0f3eefdbeeb83f522bf87)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/engine.py | 6 +++---
 scripts/lib/wic/misc.py   | 4 ++--
 scripts/wic               | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 018815b966..674ccfc244 100644
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
 
@@ -283,7 +283,7 @@ class Disk:
                     "resize2fs", "mkswap", "mkdosfs", "debugfs","blkid"):
             aname = "_%s" % name
             if aname not in self.__dict__:
-                setattr(self, aname, find_executable(name, self.paths))
+                setattr(self, aname, shutil.which(name, path=self.paths))
                 if aname not in self.__dict__ or self.__dict__[aname] is None:
                     raise WicError("Can't find executable '{}'".format(name))
             return self.__dict__[aname]
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
index a741aed364..6547abe0e9 100755
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
2.33.1


