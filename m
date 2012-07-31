Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A5-0004FO-5Q
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049391"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:22 +0100
Message-Id: <87925a43a3653c8f10ea4d0d8d8b051217488c11.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] combo-layer: ignore patch-* temp directories in dirty check
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:09 -0000

Make the dirty repo check somewhat less strict by ignoring old
patch directories created by this tool.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 554ac06..a93fb9b 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -25,6 +25,7 @@ import optparse
 import logging
 import subprocess
 import ConfigParser
+import re
 
 __version__ = "0.2.1"
 
@@ -140,7 +141,9 @@ def check_repo_clean(repodir):
         exit if repo is dirty
     """
     output=runcmd("git status --porcelain", repodir)
-    if output:
+    r = re.compile('\?\? patch-.*/')
+    dirtyout = [item for item in output.splitlines() if not r.match(item)]
+    if dirtyout:
         logger.error("git repo %s is dirty, please fix it first", repodir)
         sys.exit(1)
 
-- 
1.7.9.5



