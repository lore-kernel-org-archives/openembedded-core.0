Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qgd5e-0005J3-Bg
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:33:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2011 06:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="26940099"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.183])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2011 06:29:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:29:28 +0100
Message-Id: <901d1d04284eaa806af61557f46bf35c07970b01.1310477287.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310477287.git.paul.eggleton@linux.intel.com>
References: <cover.1310477287.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310477287.git.paul.eggleton@linux.intel.com>
References: <cover.1310477287.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] insane.bbclass: skip rdepends QA checks for kernel / modules
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
X-List-Received-Date: Tue, 12 Jul 2011 13:33:30 -0000

The kernel and module recipes have very few dbg/dev packages, however
they can easily have false positive results from the rdepends QA checks
(e.g. kernel-module-lirc-dev). Thus disable these tests for any recipe
that inherits kernel or module-base.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c1db1ca..aedd55c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -416,6 +416,11 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
     return len(errors) == 0
 
 def package_qa_check_rdepends(pkg, pkgdest, skip, d):
+    # Don't do this check for kernel/module recipes, there aren't too many debug/development
+    # packages and you can get false positives e.g. on kernel-module-lirc-dev
+    if bb.data.inherits_class("kernel", d) or bb.data.inherits_class("module-base", d):
+        return True
+
     sane = True
     if not "-dbg" in pkg and not "task-" in pkg and not "-image" in pkg:
         # Copied from package_ipk.bbclass
-- 
1.7.4.1



