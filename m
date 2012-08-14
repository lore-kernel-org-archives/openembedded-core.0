Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GD5-0001CN-8h
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181490"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:40 +0300
Message-Id: <52c14be8259b694a3a2933dd688feaa12ec9b51c.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 53/64] base.bbclass: Restructure multilib variable cloning
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:00 -0000

From: Peter Seebach <peter.seebach@windriver.com>

The checks for -native/-nativesdk packages, and the iteration over
multilibs, are shared between two (now three) blocks of code, and
nothing ever uses the bare multilib name (instead of the multilib
name plus a hyphen), so restructure this a bit. The checks for
-nativesdk/-native packages are now done before checking whether
something is a PREFERRED_* value, and the iteration over the lists
of preferred versions, preferred providers, and blacklists is done
inside a single iteration over multilibs. Out of sheer paranoia,
limit replacements to one.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |   58 ++++++++++++++++++++++----------------------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 01ed800..ee8b282 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -177,43 +177,43 @@ def preferred_ml_updates(d):
     providers = []
     blacklists = d.getVarFlags('PNBLACKLIST') or []
     for v in d.keys():
+        if v.endswith("-native") or v.endswith("-nativesdk"):
+            continue
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
         if v.startswith("PREFERRED_PROVIDER_"):
             providers.append(v)
 
-    for pkg, reason in blacklists.items():
-        for p in prefixes:
-            newpkg = p + "-" + pkg
+    for p in prefixes:
+        p = p + "-"
+        # Prepend <multilib>- to everything in PNBLACKLIST:
+        for pkg, reason in blacklists.items():
+            newpkg = p + pkg
             if not d.getVarFlag('PNBLACKLIST', newpkg, True):
                 d.setVarFlag('PNBLACKLIST', newpkg, reason)
-
-    for v in versions:
-        val = d.getVar(v, False)
-        pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
-            continue
-        for p in prefixes:
-            newname = "PREFERRED_VERSION_" + p + "-" + pkg
-            if not d.getVar(newname, False):
-                d.setVar(newname, val)
-
-    for prov in providers:
-        val = d.getVar(prov, False)
-        pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
-            continue
-        virt = ""
-        if pkg.startswith("virtual/"):
-             pkg = pkg.replace("virtual/", "")
-             virt = "virtual/"
-        for p in prefixes:
-            newname = "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
+        # Prepend <multilib>- to all PREFERRED_VERSION_ values:
+        for v in versions:
+            val = d.getVar(v, False)
+            name = v.replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p, 1)
+            if not d.getVar(name, False):
+                d.setVar(name, val)
+        # Trickier. We don't want lib32-virtual/foo, we want
+        # virtual/lib32-foo. Also, for recipes other than the
+        # kernel, we want to change the provider. So for instance,
+        # PREFERRED_PROVIDER_virtual/xyzzy = "plugh" yields
+        # PREFERRED_PROVIDER_virtual/lib32-xyzzy = "lib32-plugh"
+        for prov in providers:
+            val = d.getVar(prov, False)
+            pkg = prov.replace("PREFERRED_PROVIDER_", "", 1)
+            virt = ""
+            if pkg.startswith("virtual/"):
+                pkg = pkg.replace("virtual/", "", 1)
+                virt = "virtual/"
             if pkg != "kernel":
-                val = p + "-" + val
-            if not d.getVar(newname, False):
-                d.setVar(newname, val)
-
+                val = p + val
+            name = "PREFERRED_PROVIDER_" + virt + p + pkg
+            if not d.getVar(name, False):
+                d.setVar(name, val)
 
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
-- 
1.7.7.6



