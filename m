Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GD1-0000ex-6T
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181480"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:39 +0300
Message-Id: <37e9b554d01778c3a0b8fef861cf12cbbd602a2b.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 52/64] base.bbclass: Expand PNBLACKLIST across multilibs too
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
X-List-Received-Date: Tue, 14 Aug 2012 12:30:13 -0000

From: Peter Seebach <peter.seebach@windriver.com>

The PNBLACKLIST feature does not currently work with multilibs,
because they have different ${PN}. The obvious thing to do is to
do this at the same point that we do the PREFERRED_PROVIDER
and PREFERRED_VERSION fixups. (Making the PNBLACKLIST check
do the for-each-multilib check requires it to do the multilib
list generation repeatedly.)

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8845d81..01ed800 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -161,7 +161,8 @@ def pkgarch_mapping(d):
 
 def preferred_ml_updates(d):
     # If any PREFERRED_PROVIDER or PREFERRED_VERSIONS are set,
-    # we need to mirror these variables in the multilib case
+    # we need to mirror these variables in the multilib case;
+    # likewise the PNBLACKLIST flags.
     multilibs = d.getVar('MULTILIBS', True) or ""
     if not multilibs:
         return
@@ -174,12 +175,19 @@ def preferred_ml_updates(d):
 
     versions = []
     providers = []
+    blacklists = d.getVarFlags('PNBLACKLIST') or []
     for v in d.keys():
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
         if v.startswith("PREFERRED_PROVIDER_"):
             providers.append(v)
 
+    for pkg, reason in blacklists.items():
+        for p in prefixes:
+            newpkg = p + "-" + pkg
+            if not d.getVarFlag('PNBLACKLIST', newpkg, True):
+                d.setVarFlag('PNBLACKLIST', newpkg, reason)
+
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-- 
1.7.7.6



