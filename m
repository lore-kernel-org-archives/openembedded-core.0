Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QesVJ-0000bn-Ri
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 19:36:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2011 10:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,494,1304319600"; d="scan'208";a="23980078"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 10:32:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 18:32:46 +0100
Message-Id: <1a05c3912102db584004ac343abaf80b337ef75f.1310059749.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] insane.bbclass: allow dev-deps to be skipped via INSANE_SKIP
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
X-List-Received-Date: Thu, 07 Jul 2011 17:36:46 -0000

Add the missing check in package_qa_check_rdepends to allow dependencies
from non-development packages on development packages to be skipped.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c1db1ca..1cf7014 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -443,7 +443,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
             if "-dbg" in rdepend and "debug-deps" not in skip:
                 error_msg = "%s rdepends on %s" % (pkgname,rdepend)
                 sane = package_qa_handle_error("debug-deps", error_msg, d)
-            if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev"):
+            if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
                 error_msg = "%s rdepends on %s" % (pkgname, rdepend)
                 sane = package_qa_handle_error("dev-deps", error_msg, d)
 
-- 
1.7.4.1



