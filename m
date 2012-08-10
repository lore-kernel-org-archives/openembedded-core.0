Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SzyL4-0004gI-3r
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 01:09:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7AMw352014490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 15:58:03 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 10 Aug 2012 15:58:03 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 17:58:00 -0500
Message-ID: <cbfdf92f52f7667406373d78f67cb581a98f592e.1344639098.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1344639098.git.peter.seebach@windriver.com>
References: <cover.1344639098.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base.bbclass: Restructure multilib variable cloning
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
X-List-Received-Date: Fri, 10 Aug 2012 23:09:54 -0000
Content-Type: text/plain

The checks for -native/-nativesdk packages, and the iteration over
multilibs, are shared between two (now three) blocks of code, and
nothing ever uses the bare multilib name (instead of the multilib
name plus a hyphen), so restructure this a bit. The checks for
-nativesdk/-native packages are now done before checking whether
something is a PREFERRED_* value, and the iteration over the lists
of preferred versions, preferred providers, and blacklists is done
inside a single iteration over multilibs. Out of sheer paranoia,
limit replacements to one.
---
 meta/classes/base.bbclass |   58 ++++++++++++++++++++++----------------------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8677a30..dce7427 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -167,43 +167,43 @@ def preferred_ml_updates(d):
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
1.7.0.4



