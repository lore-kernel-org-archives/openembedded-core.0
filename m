Return-Path: <raphael.freudiger@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 69B12700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:23:26 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w1SANQsd019771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 11:23:27 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.38.206])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w1SANQmc022406;
	Wed, 28 Feb 2018 11:23:26 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 21EE73605BBD;
	Wed, 28 Feb 2018 11:23:26 +0100 (CET)
From: Raphael Freudiger <raphael.freudiger@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 11:20:56 +0100
Message-Id: <20180228102056.13754-1-raphael.freudiger@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] staging: remove files from multilib workdir
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
X-List-Received-Date: Wed, 28 Feb 2018 10:23:28 -0000

Packages with a different architecture will be installed in a different multilib workdir.
When those packages are updated, it will remove the files from the default workdir,
but not from the multilib workdir.
This will throw a file exists error later on.
Remove the files from the multilib workdir for packages that are installed into the multilib workdir.

Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
---
 meta/classes/staging.bbclass | 47 ++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 984051d6aa..2e836adce4 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -470,6 +470,10 @@ python extend_recipe_sysroot() {
     multilibs = {}
     manifests = {}
 
+    multilib_variants = (d.getVar("MULTILIBS") or "").split()
+    if multilib_variants:
+        multilib_variants = [variant.split(":")[1] for variant in multilib_variants]
+
     for f in os.listdir(depdir):
         if not f.endswith(".complete"):
             continue
@@ -477,7 +481,15 @@ python extend_recipe_sysroot() {
         if os.path.islink(f) and not os.path.exists(f):
             bb.note("%s no longer exists, removing from sysroot" % f)
             lnk = os.readlink(f.replace(".complete", ""))
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            dep = os.path.basename(f).replace(".complete", "")
+            d2 = d
+            for variant in multilib_variants:
+                if dep.startswith(variant+"-"):
+                    if variant not in multilibs:
+                        multilibs[variant] = get_multilib_datastore(variant, d)
+                    d2 = multilibs[variant]
+                    break
+            sstate_clean_manifest(depdir + "/" + lnk, d2, d2.getVar("WORKDIR"))
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
 
@@ -517,7 +529,14 @@ python extend_recipe_sysroot() {
             fl = depdir + "/" + l
             bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
             lnk = os.readlink(fl)
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            d2 = d
+            for variant in multilib_variants:
+                if l.startswith(variant+"-"):
+                    if variant not in multilibs:
+                        multilibs[variant] = get_multilib_datastore(variant, d)
+                    d2 = multilibs[variant]
+                    break
+            sstate_clean_manifest(depdir + "/" + lnk, d2, d2.getVar("WORKDIR"))
             os.unlink(fl)
             os.unlink(fl + ".complete")
 
@@ -528,6 +547,18 @@ python extend_recipe_sysroot() {
         taskhash = setscenedeps[dep][5]
         taskmanifest = depdir + "/" + c + "." + taskhash
 
+        d2 = d
+        destsysroot = recipesysroot
+        variant = ''
+        # get multilib datastore if needed
+        if setscenedeps[dep][2].startswith("virtual:multilib"):
+            variant = setscenedeps[dep][2].split(":")[2]
+            if variant != current_variant:
+                if variant not in multilibs:
+                    multilibs[variant] = get_multilib_datastore(variant, d)
+                d2 = multilibs[variant]
+                destsysroot = d2.getVar("RECIPE_SYSROOT")
+
         if os.path.exists(depdir + "/" + c):
             lnk = os.readlink(depdir + "/" + c)
             if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
@@ -535,7 +566,7 @@ python extend_recipe_sysroot() {
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
-                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+                sstate_clean_manifest(depdir + "/" + lnk, d2, d2.getVar("WORKDIR"))
                 os.unlink(depdir + "/" + c)
                 if os.path.lexists(depdir + "/" + c + ".complete"):
                     os.unlink(depdir + "/" + c + ".complete")
@@ -544,16 +575,6 @@ python extend_recipe_sysroot() {
 
         os.symlink(c + "." + taskhash, depdir + "/" + c)
 
-        d2 = d
-        destsysroot = recipesysroot
-        variant = ''
-        if setscenedeps[dep][2].startswith("virtual:multilib"):
-            variant = setscenedeps[dep][2].split(":")[2]
-            if variant != current_variant:
-                if variant not in multilibs:
-                    multilibs[variant] = get_multilib_datastore(variant, d)
-                d2 = multilibs[variant]
-                destsysroot = d2.getVar("RECIPE_SYSROOT")
 
         native = False
         if c.endswith("-native"):
-- 
2.11.0


