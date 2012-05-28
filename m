Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SYzfa-0006na-9B
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:07:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2012 05:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149243393"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by orsmga002.jf.intel.com with ESMTP; 28 May 2012 05:57:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 13:57:12 +0100
Message-Id: <c8a933748f02987afb7d68f38ff4c48ed6c9ae48.1338209763.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338209763.git.paul.eggleton@linux.intel.com>
References: <cover.1338209763.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338209763.git.paul.eggleton@linux.intel.com>
References: <cover.1338209763.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/buildhistory-diff: add GitPython version check
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
X-List-Received-Date: Mon, 28 May 2012 13:07:34 -0000

Display an error if the user does not have at least version 0.3.1 of
GitPython installed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-diff |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 9936a4b..3f27eab 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -7,16 +7,20 @@
 
 import sys
 import os
+from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
 try:
     import git
 except ImportError:
-    print("Please install PythonGit 0.3.1 or later in order to use this script")
+    print("Please install GitPython (python-git) 0.3.1 or later in order to use this script")
     sys.exit(1)
 
-
 def main():
+    if LooseVersion(git.__version__) < '0.3.1':
+        print("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script")
+        sys.exit(1)
+
     if (len(sys.argv) < 3):
         print("Report significant differences in the buildhistory repository")
         print("Syntax: %s <buildhistory-path> <since-revision> [to-revision]" % os.path.basename(sys.argv[0]))
-- 
1.7.9.5



