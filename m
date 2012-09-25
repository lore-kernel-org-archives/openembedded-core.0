Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TGYJL-00055A-My
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 18:48:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Sep 2012 09:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,484,1344236400"; d="scan'208";a="196894889"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 25 Sep 2012 09:35:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 19:35:46 +0300
Message-Id: <1348590946-13319-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] SDK: trap any IO errors in the relocate script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 16:48:40 -0000

If the files being relocated are already used by other processes the
relocate script will fail with a traceback. This patch will trap any IO
errors when opening such a file and gracefully report them to the user.

Also change the exit code from 1 to -1 for a better adt-installer user
experience (like pointing the user to the adt_installer.log).

[YOCTO #3164]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/relocate_sdk.py |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index b247e65..637ffe9 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -29,6 +29,7 @@ import sys
 import stat
 import os
 import re
+import errno
 
 old_prefix = re.compile("##DEFAULT_INSTALL_DIR##")
 
@@ -171,7 +172,7 @@ def change_dl_sysdirs():
 
 # MAIN
 if len(sys.argv) < 4:
-    exit(1)
+    exit(-1)
 
 new_prefix = sys.argv[1]
 new_dl_path = sys.argv[2]
@@ -184,7 +185,16 @@ for e in executables_list:
     else:
         os.chmod(e, perms|stat.S_IRWXU)
 
-    f = open(e, "r+b")
+    try:
+        f = open(e, "r+b")
+    except IOError as ioex:
+        if ioex.errno == errno.ETXTBSY:
+            print("Could not open %s. File used by another process.\nPlease "\
+                  "make sure you exit all processes that might use any SDK "\
+                  "binaries." % e)
+        else:
+            print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
+        exit(-1)
 
     arch = get_arch()
     if arch:
-- 
1.7.9.5



