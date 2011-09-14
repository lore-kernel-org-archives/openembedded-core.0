Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R3xjE-0004fW-T3
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 00:14:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2011 15:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48512529"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.158])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2011 15:09:36 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 15:09:28 -0700
Message-Id: <9320024626bed55a7c6058131e1cb6c47944a36d.1316037832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316037832.git.josh@linux.intel.com>
References: <cover.1316037832.git.josh@linux.intel.com>
In-Reply-To: <cover.1316037832.git.josh@linux.intel.com>
References: <cover.1316037832.git.josh@linux.intel.com>
Subject: [PATCH 1/1] sanity: disable mirrors for connectivity check
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
X-List-Received-Date: Wed, 14 Sep 2011 22:14:49 -0000

It's difficult to test a range of fetchers when using mirrors, therefore create a throwaway
copy of the datastore and delete the MIRROR and PREMIRROR variables to ensure they aren't
used in the connectivity check.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 93008cc..6ed43b2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -94,14 +94,18 @@ def check_connectivity(d):
     # CONNECTIVITY_CHECK_URIS are set
     network_enabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
     check_enabled = len(test_uris)
+    # Take a copy of the data store and unset MIRRORS and PREMIRROS
+    data = bb.data.createCopy(d)
+    data.delVar('PREMIRRORS')
+    data.delVar('MIRRORS')
     if check_enabled and network_enabled:
         try:
-            fetcher = bb.fetch2.Fetch(test_uris, d)
+            fetcher = bb.fetch2.Fetch(test_uris, data)
             fetcher.checkstatus()
         except Exception:
             # Allow the message to be configured so that users can be
             # pointed to a support mechanism.
-            msg = bb.data.getVar('CONNECTIVITY_CHECK_MSG', d, True) or ""
+            msg = bb.data.getVar('CONNECTIVITY_CHECK_MSG', data, True) or ""
             if len(msg) == 0:
                 msg = "Failed to fetch test data from the network. Please ensure your network is configured correctly.\n"
             retval = msg
-- 
1.7.6



