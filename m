Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QYW6g-0007c1-6n
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 06:29:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2011 21:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,391,1304319600"; d="scan'208";a="15362775"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2011 21:25:24 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 12:25:03 +0800
Message-Id: <2152759b50cc3acc96ee57b242e0b896e65f5e93.1308543589.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1308543589.git.dexuan.cui@intel.com>
References: <cover.1308543589.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1308543589.git.dexuan.cui@intel.com>
References: <cover.1308543589.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] sanity.bbclass: only run check_pseudo_wrapper for bitbake
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
X-List-Received-Date: Mon, 20 Jun 2011 04:29:03 -0000

This patch eliminates the warning "not been run using the bitbake wrapper..."
when we run bitbake-layers.

Thanks Paul Eggleton for suggesting doing this in sanity.bbclass.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/sanity.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index fc005aa..d296c86 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -42,6 +42,10 @@ def check_sanity_version_change():
     return ""
 
 def check_pseudo_wrapper():
+    import sys
+    if not sys.argv[0].endswith('/bitbake'):
+        return ""
+
     import subprocess as sub
     # Check if bitbake wrapper is being used
     pseudo_build = os.environ.get( 'PSEUDO_BUILD' )
-- 
1.7.1



