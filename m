Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ST0qo-00035U-1L
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 03:10:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 18:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142102079"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.40])
	by azsmga001.ch.intel.com with ESMTP; 11 May 2012 18:00:27 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 18:00:26 -0700
Message-Id: <1336784426-22337-1-git-send-email-josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] sanity.bbclass: check user can read and write to SSTATE_DIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 May 2012 01:10:26 -0000

The user needs read and write permissions to SSTATE_DIR, check
whether they have sufficient permissions and if not recommend
use of SSTATE_MIRRORS.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 05545f4..ff3c413 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -96,10 +96,16 @@ def check_conf_exists(fn, data):
 def check_sanity_sstate_dir_change(sstate_dir, data):
     # Sanity checks to be done when the value of SSTATE_DIR changes
 
-    # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = ""
     if sstate_dir != "":
-        testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
+        # Check that the user can read and write to SSTATE_DIR
+        sstatemsg = check_can_read_write_directory(sstate_dir) or None
+        if sstatemsg:
+            sstatemsg = sstatemsg + ". You could try using it as an SSTATE_MIRRORS instead of SSTATE_CACHE.\n"
+            testmsg = testmsg + sstatemsg
+        # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
+        testmsg = testmsg + check_create_long_filename(sstate_dir, "SSTATE_DIR")
+
     return testmsg
 
 def check_sanity_tmpdir_change(tmpdir, data):
@@ -150,7 +156,12 @@ def check_create_long_filename(filepath, pathname):
         if errno == 36: # ENAMETOOLONG
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
-            return "Failed to create a file in %s: %s" % (pathname, strerror)
+            return "Failed to create a file in %s: %s\n" % (pathname, strerror)
+    return ""
+
+def check_can_read_write_directory(directory):
+    if not os.access(directory, os.R_OK|os.W_OK):
+       return "Insufficient permissions for %s" % directory
     return ""
 
 def check_connectivity(d):
-- 
1.7.7.6



