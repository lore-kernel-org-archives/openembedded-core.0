Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QYiuE-0007vP-1f
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 20:09:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2011 11:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,395,1304319600"; d="scan'208";a="17390654"
Received: from vorpal.jf.intel.com ([10.7.199.159])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2011 11:05:29 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 11:09:14 -0700
Message-Id: <909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1308592651.git.josh@linux.intel.com>
References: <cover.1308592651.git.josh@linux.intel.com>
In-Reply-To: <cover.1308593086.git.josh@linux.intel.com>
References: <cover.1308593086.git.josh@linux.intel.com>
Subject: [PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Mon, 20 Jun 2011 18:09:02 -0000

Sanity test to verify files can be fetched from the network using git, http
and https fetchers point users at a page to help get set up in the case of a
failure.

Addresses [YOCTO #933]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   34 ++++++++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index bffa4f5..650df5f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = check_create_long_filename(tmpdir, "TMPDIR")
+    # Check that we can fetch from various network transports
+    testmsg = testmsg + check_connectivity(data)
     return testmsg
         
 def check_sanity_version_change(data):
@@ -75,6 +77,38 @@ def check_create_long_filename(filepath, pathname):
             return "Failed to create a file in %s: %s" % (pathname, strerror)
     return ""
 
+def check_connectivity(d):
+    # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable using
+    # the same syntax as SRC_URI.
+    test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or "").split()
+    # If no URI's set, fallback to some default ones we know of
+    if len(test_uris) == 0:
+        test_uris = ["http://yoctoproject.org/about",
+                     "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
+                     "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
+    retval = ""
+
+    # Only check connectivity if network access and this check enabled.
+    # Because it's a fairly heavy test allow disabling of just this sanity test
+    # by setting DISABLE_NETWORK_SANITY.
+    network_disabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
+    check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', d, True)
+    if check_disabled or network_disabled:
+        data = bb.data.createCopy(d)
+        dldir = bb.data.expand('${TMPDIR}/sanity', data)
+        bb.data.setVar('DL_DIR', dldir, data)
+
+        try:
+            fetcher = bb.fetch2.Fetch(test_uris, data)
+            fetcher.download()
+	    fetcher.clean(test_uris)
+        except Exception:
+            retval = "Error connecting to the network to fetch, http/https and git checked.\nPlease check the wiki (https://wiki.yoctoproject.org/wiki/Connectivity\%20Troubleshooting) for more suggestions.\n"
+        finally:
+            # Make sure we tidy up the cruft
+            oe.path.remove(dldir)
+    return retval
+
 def check_sanity(e):
     from bb import note, error, data, __version__
 
-- 
1.7.5.2



