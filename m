Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCl-0000ne-VB
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181393"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:25 +0300
Message-Id: <5a538d26fcd0e7e9cf80037f6dac43f0496bd818.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 38/64] base.bbclass: fix PACKAGECONFIG handling code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:40 -0000

From: Yao Zhao <yao.zhao@windriver.com>

PACKAGECONFIG flag code only handles that when it has 3 or 4 items in flag,
it may have a stale data if some flags doesn't need DEPENDS and RDEPENDS.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e15fa26..3e6a7de 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -364,20 +364,19 @@ python () {
             if flag == "defaultval":
                 continue
             items = flagval.split(",")
-            if len(items) == 3:
-                enable, disable, depend = items
-                rdepend = ""
-            elif len(items) == 4:
-                enable, disable, depend, rdepend = items
+            num = len(items)
+            if num > 4:
+                bb.error("Only enable,disable,depend,rdepend can be specified!")
+
             if flag in pkgconfig:
-                if depend:
-                    extradeps.append(depend)
-                if rdepend:
-                    extrardeps.append(rdepend)
-                if enable:
-                    extraconf.append(enable)
-            elif disable:
-                    extraconf.append(disable)
+                if num >= 3 and items[2]:
+                    extradeps.append(items[2])
+                if num >= 4 and items[3]:
+                    extrardeps.append(items[3])
+                if num >= 1 and items[0]:
+                    extraconf.append(items[0])
+            elif num >= 2 and items[1]:
+                    extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('EXTRA_OECONF', extraconf)
-- 
1.7.7.6



