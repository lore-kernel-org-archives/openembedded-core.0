Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SzrxS-0001V9-7t
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 18:21:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 09:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,745,1336374000"; d="scan'208";a="184530440"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.78])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2012 09:09:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Fri, 10 Aug 2012 17:09:06 +0100
Message-Id: <a46db428f16d697375b5caf46c1d7c42af584639.1344614803.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344614803.git.paul.eggleton@linux.intel.com>
References: <cover.1344614803.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1344614803.git.paul.eggleton@linux.intel.com>
References: <cover.1344614803.git.paul.eggleton@linux.intel.com>
Subject: [denzil][PATCH 3/4] scripts/buildhistory-diff: add GitPython version check
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
X-List-Received-Date: Fri, 10 Aug 2012 16:21:06 -0000

Display an error if the user does not have at least version 0.3.1 of
GitPython installed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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



