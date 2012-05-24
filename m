Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2k-00056a-31
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:53:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034688"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:25 -0700
Message-Id: <015ff58011b386644af0b722a9948166cf60f38a.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 22/28] Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
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
X-List-Received-Date: Thu, 24 May 2012 04:53:03 -0000

From: Joshua Lock <josh@linux.intel.com>

This has caused problems for several users, including the Yocto Project
autobuilder. Since the message was added in order to be more user friendly
revert the change.

This reverts commit 0c0c4efbf92bcf0f8942f17c18525a4b4ed1798c.
---
 meta/classes/sanity.bbclass |   17 +++--------------
 1 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ff3c413..05545f4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -96,16 +96,10 @@ def check_conf_exists(fn, data):
 def check_sanity_sstate_dir_change(sstate_dir, data):
     # Sanity checks to be done when the value of SSTATE_DIR changes
 
+    # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = ""
     if sstate_dir != "":
-        # Check that the user can read and write to SSTATE_DIR
-        sstatemsg = check_can_read_write_directory(sstate_dir) or None
-        if sstatemsg:
-            sstatemsg = sstatemsg + ". You could try using it as an SSTATE_MIRRORS instead of SSTATE_CACHE.\n"
-            testmsg = testmsg + sstatemsg
-        # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
-        testmsg = testmsg + check_create_long_filename(sstate_dir, "SSTATE_DIR")
-
+        testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
     return testmsg
 
 def check_sanity_tmpdir_change(tmpdir, data):
@@ -156,12 +150,7 @@ def check_create_long_filename(filepath, pathname):
         if errno == 36: # ENAMETOOLONG
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
-            return "Failed to create a file in %s: %s\n" % (pathname, strerror)
-    return ""
-
-def check_can_read_write_directory(directory):
-    if not os.access(directory, os.R_OK|os.W_OK):
-       return "Insufficient permissions for %s" % directory
+            return "Failed to create a file in %s: %s" % (pathname, strerror)
     return ""
 
 def check_connectivity(d):
-- 
1.7.7.6



