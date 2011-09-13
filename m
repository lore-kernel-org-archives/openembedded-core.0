Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3RXQ-0003a7-Km
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:52:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2011 04:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="47724871"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2011 04:47:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 19:52:44 +0800
Message-Id: <2346bd3780c5f864d5682dd86a223ddc16254468.1315914682.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315914682.git.dongxiao.xu@intel.com>
References: <cover.1315914682.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315914682.git.dongxiao.xu@intel.com>
References: <cover.1315914682.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] base.bbclass: do not expand PREFERRED_PROVIDER for kernel recipe
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
X-List-Received-Date: Tue, 13 Sep 2011 11:52:30 -0000

With Richard's commit f9c36392, we only build one kernel for a system,
thus we shouldn't extend PREFERRED_PROVIDER for virtual/kernel.

[YOCTO #1471]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 104bec8..4ca04e2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -181,8 +181,10 @@ def preferred_ml_updates(d):
              virt = "virtual/"
         for p in prefixes:
             newname = "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
+            if pkg != "kernel":
+                val = p + "-" + val
             if not d.getVar(newname, False):
-                d.setVar(newname, p + "-" + val)
+                d.setVar(newname, val)
 
 
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
-- 
1.7.1



