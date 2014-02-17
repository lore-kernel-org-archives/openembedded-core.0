Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 61D386EFCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 06:22:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,860,1384329600"; d="scan'208";a="484721938"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 06:22:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 14:22:30 +0000
Message-Id: <f37ab1438c543848bc626ab4ee39fa00c60ef607.1392646768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/populate_sdk_base: optimise task dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 14:22:46 -0000

We don't need to depend on do_package anymore after the split out of
do_packagedata (which happened a while back in OE-Core commit
6107ee294afde395e39d084c33e8e94013c625a9). We do need dependencies on
do_packagedata though since the SDK construction needs to make use of
the pkgdata files.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e2e013a..235d672 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -333,5 +333,5 @@ populate_sdk_log_check() {
 do_populate_sdk[dirs] = "${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
-do_populate_sdk[recrdeptask] = "do_package_write"
+do_populate_sdk[recrdeptask] += "do_packagedata"
 addtask populate_sdk
-- 
1.8.5.3


