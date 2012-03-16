Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8cXC-0004u5-LX
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140089233"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 12:01:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:00:59 +0000
Message-Id: <83d62e96580652f9b17dfa0227805d123a25492c.1331924409.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] buildhistory: avoid reruns of do_package
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:54 -0000

Avoid triggering a rerun of all do_package* tasks when OEBasicHash
signature generator is being used and the buildhistory package code or
any of the package related variables change.

Note that adding and removing INHERIT of buildhistory will still force
this rebuild - use the newly added BUILDHISTORY_FEATURES variable to
enable and disable buildhistory instead in order to avoid this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3a68d8d..f99aa7f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -19,6 +19,11 @@ BUILDHISTORY_PUSH_REPO ?= ""
 inherit package
 PACKAGEFUNCS += "buildhistory_emit_pkghistory"
 
+# We don't want to force a rerun of do_package for everything
+# if the buildhistory_emit_pkghistory function or any of the
+# variables it refers to changes
+do_package[vardepsexclude] += "buildhistory_emit_pkghistory"
+
 #
 # Called during do_package to write out metadata about this package
 # for comparision when writing future packages
-- 
1.7.5.4



