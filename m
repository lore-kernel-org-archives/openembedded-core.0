Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGqRC-0005cG-Tl for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:09:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QBv8ef018813
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:57:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18696-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:57:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QBuw4c018807
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:56:59 +0100
Message-ID: <1348660618.8662.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 12:56:58 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: packagedata/multilib: Fix search patch for multilib builds
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
X-List-Received-Date: Wed, 26 Sep 2012 12:09:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current multilib search path code for packagedata is flawed since it
doesn't correctly handle changes in the TARGET_VENDOR/TARGET_OS that
multilib may make. This patch enhances the code to correctly build the
search paths so multilib packagedata is found correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b1a593e..73ccf3a 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -32,8 +32,6 @@ python multilib_virtclass_handler () {
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
-    if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, False) is None:
-	    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 }
 
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index b76fd94..f55e3a2 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -2,6 +2,11 @@ python multilib_virtclass_handler_global () {
     if not e.data:
         return
 
+    if isinstance(e, bb.event.RecipePreFinalise):
+        for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
+            if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, False) is None:
+	       e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
+
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
     if isinstance(e, bb.event.RecipeParsed) and not variant:
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 5f897ff..ce92a7e 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -23,21 +23,39 @@ def read_pkgdatafile(fn):
 
     return pkgdata
 
+def all_pkgdatadirs(d):
+    archs = []
+    tos = []
+    tvs = []
+
+    archs.append(d.getVar("PACKAGE_ARCHS", True).split())
+    tos.append(d.getVar("TARGET_OS", True))
+    tvs.append(d.getVar("TARGET_VENDOR", True))
+
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        bb.data.update_data(localdata)
+
+        archs.append(localdata.getVar("PACKAGE_ARCHS", True).split())
+        tos.append(localdata.getVar("TARGET_OS", True))
+        tvs.append(localdata.getVar("TARGET_VENDOR", True))
+
+    dirs = []
+    for i in range(len(archs)):
+        for arch in archs[i]:
+            dirs.append(arch + tvs[i] + "-" + tos[i] + "/runtime/")
+    dirs.reverse()
+    return dirs 
+ 
 def get_subpkgedata_fn(pkg, d):
-    archs = d.expand("${PACKAGE_ARCHS}").split(" ")
-    mlarchs = d.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
+    dirs = all_pkgdatadirs(d)
 
-    if mlarchs:
-        for mlarch in mlarchs.split(" "):
-            if "_" in mlarch:
-                prefix, split, new_arch = mlarch.partition("_")
-                archs.append(new_arch)
-
-    archs.reverse()
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
-    targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
-    for arch in archs:
-        fn = pkgdata + arch + targetdir + pkg
+    for dir in dirs:
+        fn = pkgdata + dir + pkg
         if os.path.exists(fn):
             return fn
     return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)




