Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5Z-0000wQ-8Y
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:02:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129610"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:38 +0000
Message-Id: <3dd638cdc46847b64d4397ffd5b0fa1190f0b2c8.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] scripts/combo-layer: fix dirty repo check
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
X-List-Received-Date: Fri, 04 Nov 2011 18:02:01 -0000

Fix the dirty repository check to detect any changes, including
untracked files and uncommitted changes in the index.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 4cb9ee0..f3480dc 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -138,12 +138,8 @@ def check_repo_clean(repodir):
         check if the repo is clean
         exit if repo is dirty
     """
-    try:
-        runcmd("git diff --quiet", repodir)
-        #TODO: also check the index using "git diff --cached"
-        #      but this will fail in just initialized git repo
-        #      so need figure out a way
-    except:
+    output=runcmd("git status --porcelain", repodir)
+    if output:
         logger.error("git repo %s is dirty, please fix it first", repodir)
         sys.exit(1)
 
-- 
1.7.5.4



