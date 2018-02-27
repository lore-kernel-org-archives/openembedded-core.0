Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 74BE7787D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:56:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1RJum6s004849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Feb 2018 19:56:49 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eqlMm-0005K9-1d; Tue, 27 Feb 2018 19:56:48 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:56:45 +0000
Message-Id: <1519761405-20421-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519761405-20421-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1519761405-20421-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] sstatesig/staging/package_manager: Create common sstate manifest code
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
X-List-Received-Date: Tue, 27 Feb 2018 19:56:49 -0000

Create a common function for locating task manifest files rather than
several implementations with missing pieces.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass   | 36 +++++-------------------------------
 meta/lib/oe/package_manager.py | 31 +------------------------------
 meta/lib/oe/sstatesig.py       | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 61 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1b9e84d..3fcbc9f 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -470,40 +470,14 @@ python extend_recipe_sysroot() {
 
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
+        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
+        destsysroot = d2.getVar("RECIPE_SYSROOT")
 
         native = False
-        if c.endswith("-native"):
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
+        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
             native = True
-        elif c.startswith("nativesdk-"):
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
-        elif "-cross-" in c:
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
-            native = True
-        elif "-crosssdk" in c:
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
-            native = True
-        else:
-            pkgarchs = ['${MACHINE_ARCH}']
-            pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
-            pkgarchs.append('allarch')
-            for pkgarch in pkgarchs:
-                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.populate_sysroot" % (pkgarch, c))
-                if os.path.exists(manifest):
-                    break
-        if not os.path.exists(manifest):
-            bb.warn("Manifest %s not found?" % manifest)
-        else:
+
+        if manifest:
             newmanifest = collections.OrderedDict()
             if native:
                 fm = fixme['native']
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f59eaf7..8c567be 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -507,37 +507,8 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
 
     for dep in rpmdeps:
         c = taskdepdata[dep][0]
-
-        d2 = d
-        variant = ''
-        if taskdepdata[dep][2].startswith("virtual:multilib"):
-            variant = taskdepdata[dep][2].split(":")[2]
-            if variant not in multilibs:
-                multilibs[variant] = oe.utils.get_multilib_datastore(variant, d)
-            d2 = multilibs[variant]
-
-        if c.endswith("-native"):
-            pkgarchs = ["${BUILD_ARCH}"]
-        elif c.startswith("nativesdk-"):
-            pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
-        elif "-cross-canadian" in c:
-            pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
-        elif "-cross-" in c:
-            pkgarchs = ["${BUILD_ARCH}_${TARGET_ARCH}"]
-        elif "-crosssdk" in c:
-            pkgarchs = ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
-        else:
-            pkgarchs = ['${MACHINE_ARCH}']
-            pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
-            pkgarchs.append('allarch')
-            pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
-
-        for pkgarch in pkgarchs:
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, c, taskname))
-            if os.path.exists(manifest):
-                break
+        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
         if not os.path.exists(manifest):
-            bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
             continue
         with open(manifest, "r") as f:
             for l in f:
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 3a8778e..8ec5f8e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -368,3 +368,37 @@ def sstate_get_manifest_filename(task, d):
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
+
+def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
+    d2 = d
+    variant = ''
+    if taskdata2.startswith("virtual:multilib"):
+        variant = taskdata2.split(":")[2]
+        if variant not in multilibcache:
+            multilibcache[variant] = oe.utils.get_multilib_datastore(variant, d)
+        d2 = multilibcache[variant]
+
+    if taskdata.endswith("-native"):
+        pkgarchs = ["${BUILD_ARCH}"]
+    elif taskdata.startswith("nativesdk-"):
+        pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
+    elif "-cross-canadian" in taskdata:
+        pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
+    elif "-cross-" in taskdata:
+        pkgarchs = ["${BUILD_ARCH}_${TARGET_ARCH}"]
+    elif "-crosssdk" in taskdata:
+        pkgarchs = ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
+    else:
+        pkgarchs = ['${MACHINE_ARCH}']
+        pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
+        pkgarchs.append('allarch')
+        pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
+
+    for pkgarch in pkgarchs:
+        manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
+        if os.path.exists(manifest):
+            return manifest, d2
+    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    return None, d2
+
+
-- 
2.7.4


