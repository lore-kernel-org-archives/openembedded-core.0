Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SMR4t-0000JZ-PU
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 23:45:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132996177"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.56])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 14:36:09 -0700
Message-Id: <7146d9f171e6527a3cf92c5ab18c24939dc9f897.1335216873.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335216873.git.josh@linux.intel.com>
References: <cover.1335216873.git.josh@linux.intel.com>
In-Reply-To: <cover.1335216873.git.josh@linux.intel.com>
References: <cover.1335216873.git.josh@linux.intel.com>
Subject: [PATCH 1/2] sanity.bbclass: add variable to disable the sanity checks
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
X-List-Received-Date: Mon, 23 Apr 2012 21:45:48 -0000

It's useful for Hob to be able to disable the sanity checks completely
without marking them as passed so that the user can get into the GUI to
configure their settings, etc.

Add a variable, DISABLE_SANITY_CHECKS, to do so.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9cd04c4..c3d4e58 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -453,7 +453,7 @@ def check_sanity(e):
 
 addhandler check_sanity_eventhandler
 python check_sanity_eventhandler() {
-    if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1":
+    if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
         check_sanity(e)
 
     return
-- 
1.7.7.6



