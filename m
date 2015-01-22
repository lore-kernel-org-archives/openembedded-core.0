Return-Path: <brendan.le.foll@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 790D872C30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:34:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2015 06:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,449,1418112000"; d="scan'208";a="654921488"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2015 06:33:50 -0800
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 14:33:29 +0000
Message-Id: <1421937209-24231-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.2.1
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [PATCH][daisy] update-rc.d: Allow to use different initscripts provider
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
X-List-Received-Date: Thu, 22 Jan 2015 14:34:27 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* until now all recipes were respecting VIRTUAL-RUNTIME_initscripts
  variable but commit bba835fed88c3bd5bb5bd58962034aef57c408d8
  hardcoded "initscripts" runtime dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/update-rc.d.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e8debdf..2553afa 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,7 +1,8 @@
 UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
-DEPENDS_append_class-target = " initscripts"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
-- 
2.2.1


