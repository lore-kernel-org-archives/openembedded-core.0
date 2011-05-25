Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QPNbT-0007Gq-6M
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:35:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 16:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,270,1304319600"; 
   d="scan'208";a="7714134"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:30:55 -0700
Message-ID: <4DDD912E.6060503@intel.com>
Date: Wed, 25 May 2011 16:30:54 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] license.bbclass: Fixing LICENSE modifiers.
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
X-List-Received-Date: Wed, 25 May 2011 23:35:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I support two license type modifiers. + meaning "or greater"
and * meaning "with exceptions" for licenses that don't have
a generic "with exceptions" (as some do).

For now, I'm stripping them out and doing the base generic

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
  meta/classes/license.bbclass |    8 +++++++-
  1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6a2998a..c20be98 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -64,7 +64,13 @@ python do_populate_lic() {
              ast.NodeVisitor.generic_visit(self, node)

          def visit_Str(self, node):
-            find_license(node.s)
+            #
+            # Until I figure out what to do with
+            # the two modifiers I support (or greater = +
+            # and "with exceptions" being *
+            # we'll just strip out the modifier and put
+            # the base license.
+            find_license(node.s.replace("+", "").replace("*", ""))
              ast.NodeVisitor.generic_visit(self, node)

          def visit_BinOp(self, node):
-- 
1.7.1


