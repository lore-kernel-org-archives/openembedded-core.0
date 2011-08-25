Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qwbwp-0004Wn-2D
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:34:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Aug 2011 08:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41870154"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.243])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2011 08:29:37 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 08:29:30 -0700
Message-Id: <452876f08ee6516713d5a7198e8589953cd35f4b.1314286007.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314286007.git.josh@linux.intel.com>
References: <cover.1314286007.git.josh@linux.intel.com>
In-Reply-To: <cover.1314286007.git.josh@linux.intel.com>
References: <cover.1314286007.git.josh@linux.intel.com>
Subject: [PATCH 1/1] classes/sanity: enhance the network connectivity test
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
X-List-Received-Date: Thu, 25 Aug 2011 15:34:27 -0000

Switch to use the checkstatus fetcher API for the network connectivity test,
this has several advantages:
* we no longer print any messages to the console whilst the check is
being run
* we don't actually download anything, removing the need for tidy up and
making the code more concise

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 16af029..cefe6a4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -95,15 +95,9 @@ def check_connectivity(d):
     network_enabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
     check_enabled = len(test_uris)
     if check_enabled and network_enabled:
-        data = bb.data.createCopy(d)
-        bookmark = os.getcwd()
-        dldir = bb.data.expand('${TMPDIR}/sanity', data)
-        bb.data.setVar('DL_DIR', dldir, data)
-
         try:
-            fetcher = bb.fetch2.Fetch(test_uris, data)
-            fetcher.download()
-            fetcher.clean(test_uris)
+            fetcher = bb.fetch2.Fetch(test_uris, d)
+            fetcher.checkstatus()
         except Exception:
             # Allow the message to be configured so that users can be
             # pointed to a support mechanism.
@@ -111,10 +105,6 @@ def check_connectivity(d):
             if len(msg) == 0:
                 msg = "Failed to fetch test data from the network. Please ensure your network is configured correctly.\n"
             retval = msg
-        finally:
-            # Make sure we tidy up the cruft
-            oe.path.remove(dldir)
-            os.chdir(bookmark)
 
     return retval
 
-- 
1.7.6



