Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3Q-0001do-HF
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396916"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:51 -0700
Message-Id: <ad78786035d4b29fd78eb71ac1dec3bf636a297b.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/22] sanity: don't warn about SRC_URI checksums for connectivity test uris
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:44 -0000

From: Joshua Lock <josh@linux.intel.com>

This patch creates the .done files for the CONNECTIVITY_CHECK_URIS in the
sanity DL_DIR so that the user isn't warned about there not being checksums
set for the URI's when sanity checking the network.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c9d37c9..b586de9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -96,10 +96,16 @@ def check_connectivity(d):
         data = bb.data.createCopy(d)
         bookmark = os.getcwd()
         dldir = bb.data.expand('${TMPDIR}/sanity', data)
+        bb.utils.mkdirhier(dldir)
         bb.data.setVar('DL_DIR', dldir, data)
 
         try:
             fetcher = bb.fetch2.Fetch(test_uris, data)
+            # Touch .done files for the CONNECTIVITY_CHECK_URIS so that the user
+            # doesn't see checksum warnings
+            for uri in fetcher.urls:
+	        ud = fetcher.ud[uri]
+		open(ud.donestamp, 'w').close()
             fetcher.download()
             fetcher.clean(test_uris)
         except Exception:
-- 
1.7.3.4



