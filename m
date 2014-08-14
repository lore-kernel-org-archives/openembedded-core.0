Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2405160424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 17:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7EHvsda015424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:57:55 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 10:57:54 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 13:03:36 -0500
Message-ID: <f0d789d9b4c8bff5538d2b1d48c999f03f1b1dd7.1408038028.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1408038028.git.peter.seebach@windriver.com>
References: <cover.1408038028.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib_global.bbclass: PREFERRED_PROVIDERS for multilibs
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
X-List-Received-Date: Thu, 14 Aug 2014 17:57:56 -0000
Content-Type: text/plain

The code in base.bbclass to spread PREFERRED_PROVIDERS values
to multilibs doesn't work for things which rely on TARGET_PREFIX,
such as virtual/${TARGET_PREFIX}gcc. This is because the expansion
of TARGET_PREFIX produces the wrong value if executed prior to
the assignment of TARGET_VENDOR_virtclass-multilib-libxx, which
will always happen since that assignment doesn't happen until recipe
parsing, but the PREFERRED_PROVIDERS expansion is happening
around ConfigParsed.

To solve this, we make a couple of changes. First, the creation
of the TARGET_VENDOR override values is moved into a new ConfigParsed
event handler in multilib_global. Second, the preferred_ml_updates()
function's code is moved into that function too. It seems safe to
assume that PREFERRED_PROVIDER values only need to be spread to
other multilibs when multilibs are in use.

I don't think this directly affects any use cases that don't involve
third-party or alternative toolchains.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/base.bbclass            |  108 -------------------------------
 meta/classes/multilib_global.bbclass |  117 +++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 111 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2c007ab..c0d61fe 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,113 +133,6 @@ def pkgarch_mapping(d):
         if d.getVar("TUNE_PKGARCH", True) == "armv7a-vfp-neon":
             d.setVar("TUNE_PKGARCH", "armv7a")
 
-def preferred_ml_updates(d):
-    # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
-    # we need to mirror these variables in the multilib case;
-    multilibs = d.getVar('MULTILIBS', True) or ""
-    if not multilibs:
-        return
-
-    prefixes = []
-    for ext in multilibs.split():
-        eext = ext.split(':')
-        if len(eext) > 1 and eext[0] == 'multilib':
-            prefixes.append(eext[1])
-
-    versions = []
-    providers = []
-    for v in d.keys():
-        if v.startswith("PREFERRED_VERSION_"):
-            versions.append(v)
-        if v.startswith("PREFERRED_PROVIDER_"):
-            providers.append(v)
-
-    for v in versions:
-        val = d.getVar(v, False)
-        pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
-            continue
-        if '-cross-' in pkg and '${' in pkg:
-            for p in prefixes:
-                localdata = bb.data.createCopy(d)
-                override = ":virtclass-multilib-" + p
-                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-                bb.data.update_data(localdata)
-                newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
-                if newname != v:
-                    newval = localdata.expand(val)
-                    d.setVar(newname, newval)
-            # Avoid future variable key expansion
-            vexp = d.expand(v)
-            if v != vexp and d.getVar(v, False):
-                d.renameVar(v, vexp)
-            continue
-        for p in prefixes:
-            newname = "PREFERRED_VERSION_" + p + "-" + pkg
-            if not d.getVar(newname, False):
-                d.setVar(newname, val)
-
-    for prov in providers:
-        val = d.getVar(prov, False)
-        pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
-            continue
-        if 'cross-canadian' in pkg:
-            for p in prefixes:
-                localdata = bb.data.createCopy(d)
-                override = ":virtclass-multilib-" + p
-                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-                bb.data.update_data(localdata)
-                newname = localdata.expand(prov)
-                if newname != prov:
-                    newval = localdata.expand(val)
-                    d.setVar(newname, newval)
-            # Avoid future variable key expansion
-            provexp = d.expand(prov)
-            if prov != provexp and d.getVar(prov, False):
-                d.renameVar(prov, provexp)
-            continue
-        virt = ""
-        if pkg.startswith("virtual/"):
-            pkg = pkg.replace("virtual/", "")
-            virt = "virtual/"
-        for p in prefixes:
-            if pkg != "kernel":
-                newval = p + "-" + val
-
-            # implement variable keys
-            localdata = bb.data.createCopy(d)
-            override = ":virtclass-multilib-" + p
-            localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-            bb.data.update_data(localdata)
-            newname = localdata.expand(prov)
-            if newname != prov and not d.getVar(newname, False):
-                d.setVar(newname, localdata.expand(newval))
-
-            # implement alternative multilib name
-            newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
-            if not d.getVar(newname, False):
-                d.setVar(newname, newval)
-        # Avoid future variable key expansion
-        provexp = d.expand(prov)
-        if prov != provexp and d.getVar(prov, False):
-            d.renameVar(prov, provexp)
-
-
-    mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
-    extramp = []
-    for p in mp:
-        if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
-            continue
-        virt = ""
-        if p.startswith("virtual/"):
-            p = p.replace("virtual/", "")
-            virt = "virtual/"
-        for pref in prefixes:
-            extramp.append(virt + pref + "-" + p)
-    d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
-
-
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS", True) or "").split()
     layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
@@ -290,7 +183,6 @@ python base_eventhandler() {
         e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
         e.data.setVar('BB_VERSION', bb.__version__)
         pkgarch_mapping(e.data)
-        preferred_ml_updates(e.data)
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
 
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 3315ba9..8ea2a5a 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -1,11 +1,122 @@
-python multilib_virtclass_handler_global () {
-    if not e.data:
+def preferred_ml_updates(d):
+    # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
+    # we need to mirror these variables in the multilib case;
+    multilibs = d.getVar('MULTILIBS', True) or ""
+    if not multilibs:
         return
 
-    if isinstance(e, bb.event.RecipePreFinalise):
+    prefixes = []
+    for ext in multilibs.split():
+        eext = ext.split(':')
+        if len(eext) > 1 and eext[0] == 'multilib':
+            prefixes.append(eext[1])
+
+    versions = []
+    providers = []
+    for v in d.keys():
+        if v.startswith("PREFERRED_VERSION_"):
+            versions.append(v)
+        if v.startswith("PREFERRED_PROVIDER_"):
+            providers.append(v)
+
+    for v in versions:
+        val = d.getVar(v, False)
+        pkg = v.replace("PREFERRED_VERSION_", "")
+        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
+            continue
+        if '-cross-' in pkg and '${' in pkg:
+            for p in prefixes:
+                localdata = bb.data.createCopy(d)
+                override = ":virtclass-multilib-" + p
+                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+                bb.data.update_data(localdata)
+                newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
+                if newname != v:
+                    newval = localdata.expand(val)
+                    d.setVar(newname, newval)
+            # Avoid future variable key expansion
+            vexp = d.expand(v)
+            if v != vexp and d.getVar(v, False):
+                d.renameVar(v, vexp)
+            continue
+        for p in prefixes:
+            newname = "PREFERRED_VERSION_" + p + "-" + pkg
+            if not d.getVar(newname, False):
+                d.setVar(newname, val)
+
+    for prov in providers:
+        val = d.getVar(prov, False)
+        pkg = prov.replace("PREFERRED_PROVIDER_", "")
+        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
+            continue
+        if 'cross-canadian' in pkg:
+            for p in prefixes:
+                localdata = bb.data.createCopy(d)
+                override = ":virtclass-multilib-" + p
+                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+                bb.data.update_data(localdata)
+                newname = localdata.expand(prov)
+                if newname != prov:
+                    newval = localdata.expand(val)
+                    d.setVar(newname, newval)
+            # Avoid future variable key expansion
+            provexp = d.expand(prov)
+            if prov != provexp and d.getVar(prov, False):
+                d.renameVar(prov, provexp)
+            continue
+        virt = ""
+        if pkg.startswith("virtual/"):
+            pkg = pkg.replace("virtual/", "")
+            virt = "virtual/"
+        for p in prefixes:
+            if pkg != "kernel":
+                newval = p + "-" + val
+
+            # implement variable keys
+            localdata = bb.data.createCopy(d)
+            override = ":virtclass-multilib-" + p
+            localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+            bb.data.update_data(localdata)
+            newname = localdata.expand(prov)
+            if newname != prov and not d.getVar(newname, False):
+                d.setVar(newname, localdata.expand(newval))
+
+            # implement alternative multilib name
+            newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
+            if not d.getVar(newname, False):
+                d.setVar(newname, newval)
+        # Avoid future variable key expansion
+        provexp = d.expand(prov)
+        if prov != provexp and d.getVar(prov, False):
+            d.renameVar(prov, provexp)
+
+
+    mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
+    extramp = []
+    for p in mp:
+        if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
+            continue
+        virt = ""
+        if p.startswith("virtual/"):
+            p = p.replace("virtual/", "")
+            virt = "virtual/"
+        for pref in prefixes:
+            extramp.append(virt + pref + "-" + p)
+    d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
+
+python multilib_virtclass_handler_vendor () {
+    if isinstance(e, bb.event.ConfigParsed):
         for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
             if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, False) is None:
                 e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
+        preferred_ml_updates(e.data)
+}
+addhandler multilib_virtclass_handler_vendor
+multilib_virtclass_handler_vendor[eventmask] = "bb.event.ConfigParsed"
+
+python multilib_virtclass_handler_global () {
+    if not e.data:
+        return
 
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
-- 
1.7.1


