Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 402DB60110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:20:49 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 642866137; Thu, 19 Nov 2015 06:20:49 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZzNGe-000E4c-D5; Thu, 19 Nov 2015 11:20:44 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZzNGe-0007jK-Ca; Thu, 19 Nov 2015 11:20:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 11:20:36 +0000
Message-Id: <1447932037-29676-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] image.py: avoid mkdir race when building multiple images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 11:20:50 -0000

If multiple images are being built simultaneously against the same
sysroot then the call to os.makedirs in Image._write_wic_env can fail
with:

File: '.../meta/lib/oe/image.py', lineno: 341, function: _write_wic_env
     0337:        """
     0338:        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
     0339:        outdir = os.path.join(stdir, 'imgdata')
     0340:        if not os.path.exists(outdir):
 *** 0341:            os.makedirs(outdir)
     0342:        basename = self.d.getVar('IMAGE_BASENAME', True)
     0343:        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
     0344:            for var in self.d.getVar('WICVARS', True).split():
     0345:                value = self.d.getVar(var, True)
File: '/usr/lib/python2.7/os.py', lineno: 157, function: makedirs
     0153:            if e.errno != errno.EEXIST:
     0154:                raise
     0155:        if tail == curdir:           # xxx/newdir/. exists if xxx/newdir exists
     0156:            return
 *** 0157:    mkdir(name, mode)
     0158:
     0159:def removedirs(name):
     0160:    """removedirs(path)
     0161:
Exception: OSError: [Errno 17] File exists: '.../tmp-glibc/sysroots/cheetah/imgdata'

os.makedirs protects against racing on parent directories but not on the
final part.

The sysroot directory will already exist so let's just try and make the
imgdata directory and cope with the exception thrown if it already
exists. This stops the race being fatal.

Once the directory has been created, there's no race on the actual file
since the filename contains IMAGE_BASENAME.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/lib/oe/image.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index b9eb3de..8c797ec 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -1,5 +1,6 @@
 from oe.utils import execute_pre_post_process
 import os
+import errno
 import subprocess
 import multiprocessing
 
@@ -337,8 +338,16 @@ class Image(ImageDepGraph):
         """
         stdir = self.d.getVar('STAGING_DIR_TARGET', True)
         outdir = os.path.join(stdir, 'imgdata')
-        if not os.path.exists(outdir):
-            os.makedirs(outdir)
+        try:
+            # This may race against another image being created, so
+            # let's just try and create the directory and just ignore
+            # the error if it already exists. The parent directory
+            # will already exist so there's no benefit to using
+            # os.makedirs (which is also subject to the race.)
+            os.mkdir(outdir)
+        except OSError as e:
+            if e.errno != errno.EEXIST:
+                raise
         basename = self.d.getVar('IMAGE_BASENAME', True)
         with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
             for var in self.d.getVar('WICVARS', True).split():
-- 
2.1.4


