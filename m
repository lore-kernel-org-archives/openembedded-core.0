Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B972E724DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 17:20:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2015 10:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,523,1422950400"; d="scan'208";a="703427570"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2015 10:20:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 1E9846A408F;
	Sat,  4 Apr 2015 10:20:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Apr 2015 20:20:28 +0300
Message-Id: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Sat, 04 Apr 2015 17:20:45 -0000

wic requires tools that are not always possible to find in $PATH.
This causes wic to fail with confusing errors like this:
 External command 'parted' not found, exiting.
   (Please install 'parted' on your host system)

Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
/sbin and /bin to the list of paths makes find_binary_path to
produce more reliable results.

[YOCTO #7122]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/fs_related.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index ea9f85c..832a44a 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -32,13 +32,16 @@ from wic.utils.errors import *
 from wic.utils.oe.misc import *
 
 def find_binary_path(binary):
+    paths = []
     if os.environ.has_key("PATH"):
         paths = os.environ["PATH"].split(":")
-    else:
-        paths = []
-        if os.environ.has_key("HOME"):
-            paths += [os.environ["HOME"] + "/bin"]
-        paths += ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]
+    if os.environ.has_key("HOME"):
+        path = os.path.join(os.environ["HOME"], "bin")
+        if path not in paths:
+            paths.append(path)
+    for path in ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]:
+        if path not in paths:
+            paths.append(path)
 
     for path in paths:
         bin_path = "%s/%s" % (path, binary)
-- 
2.1.4


