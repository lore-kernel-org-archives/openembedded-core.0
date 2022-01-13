Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAA7C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:51 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.9623.1642084671159191440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=l/zxXpYE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id t32so37989pgm.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V8+GkmlnccS/U8LpL5o0s9jLPTKIG63qo4DutjImI6c=;
        b=l/zxXpYEJe4sB6sQh9rf/7t9GaChmQPN1Lwb8nZGRXvqC6gtNcOliQcERB1tbQTjys
         D5h2hnYZuVn9gCFdesXuyxxxvScjP2gNstRKmtxfMbYryjAr29fbXhpK9/r+P13SIHa0
         LKxR0NQP1BjkywSZ5/H7ciDH6OuF4I+d1AeeMRUWjKickBMB02W6PYT9kKi0TsZQCzUJ
         6KPntWkfdclGtd9uhA4QQZhBLlmnhR46Ei+UHmZQi3Vrpi7DU7bPX1ORPfnfW53f5ND1
         GBsx94GcaqAu2UbvyTiOyrPcDzpmFCWGlsbbbBRoTnJ6Oc1o3NLBwesAjjh9kr88aRzT
         1VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V8+GkmlnccS/U8LpL5o0s9jLPTKIG63qo4DutjImI6c=;
        b=iaiq+0tQnVUhYN7zCaUKjC1Py2ITSgiO4esCLe1UVsrHxRTqaP5ayPJ2eUXxE9YAry
         fAIle1I0D3tcN8FnsEzSt6DJw521g4dFo1dIVA988ulJCt9NxBZ8OPCIXRVLwmWZz1kh
         PnmwMk30AImS1pV7ZzVX5D5IYkH6HmGjMZDtuRImtb95cFU7xKTYa5WUgDwtwwNqouFg
         IvcLgbCQCVkkI245gEOELON4On3suMGmmHSHRWxVPPeGa8Ie6z8xl7tWxRzhB3TmH8Di
         gRsW226Wzwb167HlqyXfWu1Ovt67aLKWJBnOMYIUwdCKaUGZTtAqqSk/2JQXEKUMxy0k
         IqvQ==
X-Gm-Message-State: AOAM530nniR5O1pVzO8cSTnQhAMP5gDEqioKeV/0xEXYMQ/yxe1+YnCI
	/KCO9N++PefcyNphAZQCiJ3SSCrBdycKeL3vsvI=
X-Google-Smtp-Source: 
 ABdhPJz3sR4KAkBRuwWVcTwTwuLlBPNIZP8FwcDLyB+ZxFeaKqjdnkzxRVMUKTxmp+PzKrEqCOvj3w==
X-Received: by 2002:a63:7d4e:: with SMTP id m14mr4190332pgn.514.1642084670079;
        Thu, 13 Jan 2022 06:37:50 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] wic: use shutil.which
Date: Thu, 13 Jan 2022 04:37:11 -1000
Message-Id: 
 <488815681466d5e4c7640df5281fa6e1f9b4c75e.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160518

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/engine.py | 6 +++---
 scripts/lib/wic/misc.py   | 4 ++--
 scripts/wic               | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9ff4394757..7dbde85696 100644
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
                     "resize2fs", "mkswap", "mkdosfs", "debugfs"):
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
2.25.1


