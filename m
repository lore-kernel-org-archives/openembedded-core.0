Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 834C66B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 10:48:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2013 03:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,750,1367996400"; d="scan'208";a="337272031"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.182])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2013 03:48:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 11:48:23 +0100
Message-Id: <1374835703-9222-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/sanity: check for suid root command evility
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
X-List-Received-Date: Fri, 26 Jul 2013 10:48:39 -0000

Some users have been found to have an unnamed third-party piece of
software installed which sets chmod, chown and mknod as suid root as
part of its installation process. This interferes with the operation of
pseudo and can result in files really being owned by root within the
build output, and therefore breaks the build, apart from being a
security issue. Check for this and bail out early if it is found.

Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a505a5d..0546293 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -569,6 +569,16 @@ def check_sanity_everybuild(status, d):
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", d)
 
+    # Some third-party software apparently relies on chmod etc. being suid root (!!)
+    import stat
+    suid_check_bins = "chown chmod mknod".split()
+    for bin_cmd in suid_check_bins:
+        bin_path = bb.utils.which(os.environ["PATH"], bin_cmd)
+        if bin_path:
+            bin_stat = os.stat(bin_path)
+            if bin_stat.st_uid == 0 and bin_stat.st_mode & stat.S_ISUID:
+                status.addresult('%s has the setuid bit set. This interferes with pseudo and may cause other issues that break the build process.\n' % bin_path)
+
     # Check the Python version, we now have a minimum of Python 2.7.3
     import sys
     if sys.hexversion < 0x020703F0:
-- 
1.8.1.2


