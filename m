Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMU-0008DE-Ni
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195287"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:31 -0700
Message-Id: <5ec678caf6dd2fee0ae6fb64b9abed0a163b92d3.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 15/19] multilib_global.bbclass: Fix non-multilib package provides
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:04 -0000

From: Mark Hatle <mark.hatle@windriver.com>

In non-multilib packages, configured in a multilib configuration we
need to adjust the system provides and rprovides to include the
virtual multilib variant.

This resolves a problem introduced in the
329d864f9bbf94ad3aae8df43d63fe10e4237e4f commit.  Where "allarch"
packages were suddenly providing all variants of an object.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib_global.bbclass |   27 ++++++++++++++++++++++-----
 1 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index ed14565..cd22163 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -6,16 +6,33 @@ python multilib_virtclass_handler_global () {
 
     if isinstance(e, bb.event.RecipeParsed) and not variant:
         if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
-            origprovs = provs = e.data.getVar("PROVIDES", True)
-            rprovs = e.data.getVar("RPROVIDES", True)
             variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
+
+            # Process PROVIDES
+            origprovs = provs = e.data.getVar("PROVIDES", True) or ""
             for variant in variants:
                 provs = provs + " " + multilib_map_variable("PROVIDES", variant, e.data)
-                for pkg in e.data.getVar("PACKAGES", True).split():
-                    rprovs = rprovs + " " + variant + "-" + pkg
+                # Reset to original value so next time around multilib_map_variable works properly
                 e.data.setVar("PROVIDES", origprovs)
             e.data.setVar("PROVIDES", provs)
+
+            # Process RPROVIDES
+            origrprovs = rprovs = e.data.getVar("RPROVIDES", True) or ""
+            for variant in variants:
+                rprovs = rprovs + " " + multilib_map_variable("RPROVIDES", variant, e.data)
+                # Reset to original value so next time around multilib_map_variable works properly
+                e.data.setVar("RPROVIDES", origrprovs)
             e.data.setVar("RPROVIDES", rprovs)
+
+	    # Process RPROVIDES_${PN}...
+            for pkg in (e.data.getVar("PACKAGES", True) or "").split():
+                origrprovs = rprovs = e.data.getVar("RPROVIDES_%s" % pkg, True) or ""
+                for variant in variants:
+                    rprovs = rprovs + " " + multilib_map_variable("RPROVIDES_%s" % pkg, variant, e.data)
+                    rprovs = rprovs + " " + variant + "-" + pkg
+                    # Reset to original value so next time around multilib_map_variable works properly
+                    e.data.setVar("RPROVIDES_%s" % pkg, origrprovs)
+                e.data.setVar("RPROVIDES_%s" % pkg, rprovs)
 }
 
 addhandler multilib_virtclass_handler_global
@@ -35,7 +52,7 @@ def multilib_extend_name(variant, name):
 def multilib_map_variable(varname, variant, d):
     var = d.getVar(varname, True)
     if not var:
-        return
+        return ""
     var = var.split()
     newvar = []
     for v in var:
-- 
1.7.6



