Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc2mn-00081e-JU
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:59:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 14:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="22073370"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.240])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 14:55:11 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:55:03 -0700
Message-Id: <dba23bdca8e1eec8eae537bf563fd26e148614df.1309383978.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1309383978.git.josh@linux.intel.com>
References: <cover.1309383978.git.josh@linux.intel.com>
In-Reply-To: <cover.1309383978.git.josh@linux.intel.com>
References: <cover.1309383978.git.josh@linux.intel.com>
Subject: [RFC 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Wed, 29 Jun 2011 21:59:06 -0000

Sanity test to verify files can be fetched from the network using git, http
and https fetchers point users at a page to help get set up in the case of a
failure.

Requires a variable CONNECTIVITY_CHECK_URIS to be set, using the same pattern
as SRC_URI, of URI's to test against.
The variable CONNECTIVITY_CHECK_MSG can be set to provide a custom error
message, such as a pointer to some help, when this check fails.

Addresses [YOCTO #933]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 720777a..c9d37c9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = check_create_long_filename(tmpdir, "TMPDIR")
+    # Check that we can fetch from various network transports
+    testmsg = testmsg + check_connectivity(data)
     return testmsg
         
 def check_sanity_version_change(data):
@@ -79,6 +81,41 @@ def check_create_long_filename(filepath, pathname):
             return "Failed to create a file in %s: %s" % (pathname, strerror)
     return ""
 
+def check_connectivity(d):
+    # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
+    # using the same syntax as for SRC_URI. If the variable is not set
+    # the check is skipped
+    test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or "").split()
+    retval = ""
+
+    # Only check connectivity if network enabled and the
+    # CONNECTIVITY_CHECK_URIS are set
+    network_enabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
+    check_enabled = len(test_uris)
+    if check_enabled and network_enabled:
+        data = bb.data.createCopy(d)
+        bookmark = os.getcwd()
+        dldir = bb.data.expand('${TMPDIR}/sanity', data)
+        bb.data.setVar('DL_DIR', dldir, data)
+
+        try:
+            fetcher = bb.fetch2.Fetch(test_uris, data)
+            fetcher.download()
+            fetcher.clean(test_uris)
+        except Exception:
+            # Allow the message to be configured so that users can be
+            # pointed to a support mechanism.
+            msg = bb.data.getVar('CONNECTIVITY_CHECK_MSG', d, True) or ""
+            if len(msg) == 0:
+                msg = "Failed to fetch test data from the network. Please ensure your network is configured correctly.\n"
+            retval = msg
+        finally:
+            # Make sure we tidy up the cruft
+            oe.path.remove(dldir)
+            os.chdir(bookmark)
+
+    return retval
+
 def check_sanity(e):
     from bb import note, error, data, __version__
 
-- 
1.7.5.4



