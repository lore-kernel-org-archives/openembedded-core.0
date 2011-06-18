Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QXluH-0002j0-Lp
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 05:09:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2011 20:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,384,1304319600"; d="scan'208";a="17699122"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.73])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2011 20:05:33 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 20:04:22 -0700
Message-Id: <f0a7d48483260e9251d74216d7569de1a029d035.1308365562.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1308365562.git.josh@linux.intel.com>
References: <cover.1308365562.git.josh@linux.intel.com>
In-Reply-To: <cover.1308365562.git.josh@linux.intel.com>
References: <cover.1308365562.git.josh@linux.intel.com>
Subject: [RFC PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Sat, 18 Jun 2011 03:09:09 -0000

Sanity test to verify files can be fetched from the network using git, http and
https fetchers point users at a page to help get set up in the case of a failure

Addresses [YOCTO #933]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index bffa4f5..83a9887 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = check_create_long_filename(tmpdir, "TMPDIR")
+    # Check that we can fetch from various network transports
+    testmsg = testmsg + check_connectivity(data)
     return testmsg
         
 def check_sanity_version_change(data):
@@ -75,6 +77,33 @@ def check_create_long_filename(filepath, pathname):
             return "Failed to create a file in %s: %s" % (pathname, strerror)
     return ""
 
+def check_connectivity(d):
+    test_uris= ["http://yoctoproject.org/about",
+                "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
+                "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
+    retval = ""
+
+    # Only check connectivity if network and this check enabled
+    # Because it's a fairy heavy test allow disabling of just this sanity test
+    # by setting DISABLE_NETWORK_SANITY
+    data = bb.data.createCopy(d)
+    network_disabled = not bb.data.getVar('BB_NO_NETWORK', data, True)
+    check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', data, True)
+    if check_disabled or network_disabled:
+        dldir = bb.data.expand('${TMPDIR}/sanity', data)
+        bb.data.setVar('DL_DIR', dldir, data)
+
+        try:
+            fetcher = bb.fetch2.Fetch(test_uris, data)
+            fetcher.download()
+	    fetcher.clean(test_uris)
+        except Exception, e:
+            retval = "Error connecting to the network to fetch, http/https and git checked.\nPlease check the wiki (https://wiki.yoctoproject.org/wiki/Connectivity%20Troubleshooting) for more suggestions.\n" % e
+        finally:
+            # Make sure we tidy up the cruft
+            oe.path.remove(dldir)
+    return retval
+
 def check_sanity(e):
     from bb import note, error, data, __version__
 
-- 
1.7.5.4



