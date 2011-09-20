Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R67zm-0002GM-VH
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:36:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KLVWhs018545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:31:32 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 14:31:31 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 16:33:40 -0500
Message-ID: <f800392c540a0e9ea9131c219bced20f9145a2b9.1316553828.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316553828.git.mark.hatle@windriver.com>
References: <cover.1316553828.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/7] multilib_global.bbclass: Fix non-multilib package provides
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
X-List-Received-Date: Tue, 20 Sep 2011 21:36:51 -0000
Content-Type: text/plain

In non-multilib packages, configured in a multilib configuration we
need to adjust the system provides and rprovides to include the
virtual multilib variant.

This resolves a problem introduced in the
329d864f9bbf94ad3aae8df43d63fe10e4237e4f commit.  Where "allarch"
packages were suddenly providing all variants of an object.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib_global.bbclass |   30 +++++++++++++++++++++++++-----
 1 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index ed14565..c9bbe8f 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -6,16 +6,36 @@ python multilib_virtclass_handler_global () {
 
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
+            bb.warn("PROVIDES: %s" % (provs))
             e.data.setVar("PROVIDES", provs)
+
+            # Process RPROVIDES
+            origrprovs = rprovs = e.data.getVar("RPROVIDES", True) or ""
+            for variant in variants:
+                rprovs = rprovs + " " + multilib_map_variable("RPROVIDES", variant, e.data)
+                # Reset to original value so next time around multilib_map_variable works properly
+                e.data.setVar("RPROVIDES", origrprovs)
+            bb.warn("RPROVIDES: %s" % (rprovs))
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
+                bb.warn("RPROVIDES_%s: %s" % (pkg, rprovs))
+                e.data.setVar("RPROVIDES_%s" % pkg, rprovs)
 }
 
 addhandler multilib_virtclass_handler_global
@@ -35,7 +55,7 @@ def multilib_extend_name(variant, name):
 def multilib_map_variable(varname, variant, d):
     var = d.getVar(varname, True)
     if not var:
-        return
+        return ""
     var = var.split()
     newvar = []
     for v in var:
-- 
1.7.3.4



