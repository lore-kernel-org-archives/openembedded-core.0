Return-Path: <henning.schild@siemens.com>
X-Greylist: delayed 1134 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Jan 2020 14:07:42 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7917FD58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:07:41 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00ODmn0b030741
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 24 Jan 2020 14:48:49 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.69.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00ODmm5o018049;
	Fri, 24 Jan 2020 14:48:48 +0100
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 14:48:47 +0100
Message-Id: <20200124134847.5052-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Henning Schild <henning.schild@siemens.com>, isar-users@googlegroups.com
Subject: [PATCH] lib/oe/path: try hardlinking instead of guessing when it might fail
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
X-List-Received-Date: Fri, 24 Jan 2020 14:07:42 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

The comparison of the stat st_dev is not enough to judge whether
hardlinking will work. One example would be where you try and hardlink
across two bind-mounts of a directory. The st_dev will be the same and
the operation will still fail.

Instead of implementing a check to try and figure out hardlink support
just try hardlinking and fall back to a copy when running into an
exception.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 meta/lib/oe/path.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index fa209b9795..082972457b 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -99,7 +99,22 @@ def copyhardlinktree(src, dst):
     if os.path.isdir(src) and not len(os.listdir(src)):
         return
 
-    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
+    canhard = False
+    testfile = None
+    for root, dirs, files in os.walk(src):
+        if len(files):
+            testfile = os.path.join(root, files[0])
+            break
+
+    if testfile is not None:
+        try:
+            os.link(testfile, os.path.join(dst, 'testfile'))
+            os.unlink(os.path.join(dst, 'testfile'))
+            canhard = True
+        except Exception as e:
+            bb.debug(2, "Hardlink test failed with " + str(e))
+
+    if (canhard):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
         cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
@@ -121,12 +136,9 @@ def copyhardlinktree(src, dst):
 def copyhardlink(src, dst):
     """Make a hard link when possible, otherwise copy."""
 
-    # We need to stat the destination directory as the destination file probably
-    # doesn't exist yet.
-    dstdir = os.path.dirname(dst)
-    if os.stat(src).st_dev == os.stat(dstdir).st_dev:
+    try:
         os.link(src, dst)
-    else:
+    except OSError:
         shutil.copy(src, dst)
 
 def remove(path, recurse=True):
-- 
2.24.1


