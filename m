Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCn-0000ex-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181406"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:27 +0300
Message-Id: <1b3e82cb22f5c9d0bbe562327f8c90c26ca12b1c.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [CONSOLIDATED REQUEST 40/64] base.bbclass: allow specifying an lsb distro hook via the metadata
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is useful when you have a rather large set of compatible distros. For
example: Centos 5.4, 5.5, 5.6, etc, RHEL server 5.x, RHEL workstation 5.x.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3e6a7de..8845d81 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -34,11 +34,21 @@ def oe_import(d):
 python oe_import_eh () {
     if isinstance(e, bb.event.ConfigParsed):
         oe_import(e.data)
-        e.data.setVar("NATIVELSBSTRING", oe.lsb.distro_identifier())
+        e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
 }
 
 addhandler oe_import_eh
 
+def lsb_distro_identifier(d):
+    adjust = d.getVar('LSB_DISTRO_ADJUST', True)
+    adjust_func = None
+    if adjust:
+        try:
+            adjust_func = globals()[adjust]
+        except KeyError:
+            pass
+    return oe.lsb.distro_identifier(adjust_func)
+
 die() {
 	bbfatal "$*"
 }
-- 
1.7.7.6



