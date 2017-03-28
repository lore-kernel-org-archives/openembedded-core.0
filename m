Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 47F3D77A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 071472E303
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id J0s5eHGOTiax
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:48 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id CB28E2E2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B32D31A075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7C7A1A072
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9A834212D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2SCUlNe023962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:30:47 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2SCUlSY023961
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Mar 2017 14:30:47 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 14:30:43 +0200
Message-Id: <c03b3d4d91d37d2b620230fe29158478fe985afe.1490704144.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490704144.git.pkj@axis.com>
References: <cover.1490704144.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] fetch2: Create/replace symbolic links atomically
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
X-List-Received-Date: Tue, 28 Mar 2017 12:30:50 -0000

Under rare circumstances, creating symbolic links could fail because
the link already exists. At first glance the code seemed to protect
against this, but there was a small window where two separate tasks
could decide that a symbolic link needed to be created and then the
first task would create it and the second task would fail.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 464e66b98a..f891e34eab 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -25,7 +25,7 @@ BitBake build tools.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os, re, tempfile
 import signal
 import logging
 import urllib.request, urllib.parse, urllib.error
@@ -946,6 +946,16 @@ def rename_bad_checksum(ud, suffix):
     bb.warn("Renaming %s to %s" % (ud.localpath, new_localpath))
     bb.utils.movefile(ud.localpath, new_localpath)
 
+def atomic_symlink(src, dst):
+    """Create/replace a symbolic link atomically."""
+
+    tmpname = tempfile.mktemp(prefix=dst)
+    os.symlink(src, tmpname)
+    try:
+        os.rename(tmpname, dst)
+    except OSError:
+        os.remove(tmpname)
+        raise
 
 def try_mirror_url(fetch, origud, ud, ld, check = False):
     # Return of None or a value means we're finished
@@ -983,7 +993,7 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
                 open(ud.donestamp, 'w').close()
             dest = os.path.join(dldir, os.path.basename(ud.localpath))
             if not os.path.exists(dest):
-                os.symlink(ud.localpath, dest)
+                atomic_symlink(ud.localpath, dest)
             if not verify_donestamp(origud, ld) or origud.method.need_update(origud, ld):
                 origud.method.download(origud, ld)
                 if hasattr(origud.method,"build_mirror_data"):
@@ -991,11 +1001,7 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
             return origud.localpath
         # Otherwise the result is a local file:// and we symlink to it
         if not os.path.exists(origud.localpath):
-            if os.path.islink(origud.localpath):
-                # Broken symbolic link
-                os.unlink(origud.localpath)
-
-            os.symlink(ud.localpath, origud.localpath)
+            atomic_symlink(ud.localpath, origud.localpath)
         update_stamp(origud, ld)
         return ud.localpath
 
-- 
2.12.0


