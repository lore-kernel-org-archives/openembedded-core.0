Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIif1-0002zn-OP
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 18:16:00 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TIiSW-0006sH-SN
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 18:03:04 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Oct 2012 17:03:04 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349107384.32611.62.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] recipe_sanity: Don't bother checking LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 16:16:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since e3d7890cace71b0a57d2530bf615a58dcb46d96f or so, base.bbclass has
considered invalid LICENSE settings to be a fatal error.  This means we
will never see them so there is no point checking for that.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/recipe_sanity.bbclass |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index c3bd0d2..bf378ea 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -13,7 +13,7 @@ def bad_runtime_vars(cfgdata, d):
             __note("%s should be %s_${PN}" % (var, var), d)
 
 __recipe_sanity_reqvars = "DESCRIPTION"
-__recipe_sanity_reqdiffvars = "LICENSE"
+__recipe_sanity_reqdiffvars = ""
 def req_vars(cfgdata, d):
     for var in d.getVar("__recipe_sanity_reqvars", True).split():
         if not d.getVar(var, 0):
@@ -23,11 +23,6 @@ def req_vars(cfgdata, d):
         val = d.getVar(var, 0)
         cfgval = cfgdata.get(var)
 
-        # Hardcoding is bad, but I'm lazy.  We don't care about license being
-        # unset if the recipe has no sources!
-        if var == "LICENSE" and d.getVar("SRC_URI", True) == cfgdata.get("SRC_URI"):
-            continue
-
         if not val:
             __note("%s should be set" % var, d)
         elif val == cfgval:
@@ -93,7 +88,7 @@ def can_remove_FILESDIR(cfgdata, d):
             expanded == d.expand(expected))
 
 def can_remove_others(p, cfgdata, d):
-    for k in ["S", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
+    for k in ["S", "PV", "PN", "DESCRIPTION", "DEPENDS",
               "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
     #for k in cfgdata:
         unexpanded = d.getVar(k, 0)
-- 
1.7.10.4





