Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwt-000277-9b
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:19 +0100
Received: by mail-yx0-f175.google.com with SMTP id 22so1175247yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=VOXGAR7QFn6g4786rcDLaEjBCeF4YSf1v8C0xfuzAg8=;
	b=it4tg4BmEh7B66jZ9IovVeocDsPM9zZlvSXBONofOLqTftBCQ3pwD7DPKNc5JWtubB
	4gnJop838D8vWahqS8dR/c9WGHEceIj4OL7h0FSx6+ByvlCtvr2CWP9ZPqzwVGNunZ6W
	vuvADEM/F/wNiGXGD8yt2S5tslSsiuztgyU+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IeXkqb6gmHtv1Za7HqvXjBzezQYxAbY0EnJxlCu5oKm019TooSTTEa0yN/m25MIX1B
	a3lKBZIzg7jfmgcSpazENrmPlaZ40sIAMB8Rm3ziDiOyJ5ydpPP0ZOhD+1P5y0Evm+Es
	Bd4FkPFVtfXElEy+91lMygPDtlANHWVSubMh0=
Received: by 10.91.33.1 with SMTP id l1mr1821agj.207.1300378767010;
	Thu, 17 Mar 2011 09:19:27 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:26 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:07 -0700
Message-Id: <702b7498ab0facdc489a8e974a00e54f3518744f.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 09/12] Move packagedata code into oe.packagedata (sync from OE)
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:19 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass     |    4 +-
 meta/classes/package_rpm.bbclass |    3 +-
 meta/classes/packagedata.bbclass |   68 ++-----------------------
 meta/lib/oe/packagedata.py       |  106 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+), 66 deletions(-)
 create mode 100644 meta/lib/oe/packagedata.py

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6b3df7..fddf5b1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -295,7 +295,9 @@ def runstrip(file, elftype, d):
 #
 
 def get_package_mapping (pkg, d):
-	data = read_subpkgdata(pkg, d)
+	import oe.packagedata
+
+	data = oe.packagedata.read_subpkgdata(pkg, d)
 	key = "PKG_%s" % pkg
 
 	if key in data:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4647116..236e613 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -316,6 +316,7 @@ package_install_internal_rpm () {
 
 python write_specfile () {
 	import textwrap
+	import oe.packagedata
 
 	# We need to change '-' in a version field to '+'
 	# This needs to be done BEFORE the mapping_rename_hook
@@ -328,7 +329,7 @@ python write_specfile () {
 				ver = depends_dict[dep]
 				if dep and ver:
 					if '-' in ver:
-						subd = read_subpkgdata_dict(dep, d)
+						subd = oe.packagedata.read_subpkgdata_dict(dep, d)
 						pv = subd['PV']
 						reppv = pv.replace('-', '+')
 						ver = ver.replace(pv, reppv)
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 86f18a9..bf051fe 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -1,73 +1,13 @@
-def packaged(pkg, d):
-	return os.access(get_subpkgedata_fn(pkg, d) + '.packaged', os.R_OK)
-
-def read_pkgdatafile(fn):
-	pkgdata = {}
-
-	def decode(str):
-		import codecs
-		c = codecs.getdecoder("string_escape")
-		return c(str)[0]
-
-	if os.access(fn, os.R_OK):
-		import re
-		f = file(fn, 'r')
-		lines = f.readlines()
-		f.close()
-		r = re.compile("([^:]+):\s*(.*)")
-		for l in lines:
-			m = r.match(l)
-			if m:
-				pkgdata[m.group(1)] = decode(m.group(2))
-
-	return pkgdata
-
-def get_subpkgedata_fn(pkg, d):
-	archs = bb.data.expand("${PACKAGE_ARCHS}", d).split(" ")
-	archs.reverse()
-	pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
-	targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
-	for arch in archs:
-		fn = pkgdata + arch + targetdir + pkg
-		if os.path.exists(fn):
-			return fn
-	return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
-
-def has_subpkgdata(pkg, d):
-	return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
-
-def read_subpkgdata(pkg, d):
-	return read_pkgdatafile(get_subpkgedata_fn(pkg, d))
-
-def has_pkgdata(pn, d):
-	fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
-	return os.access(fn, os.R_OK)
-
-def read_pkgdata(pn, d):
-	fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
-	return read_pkgdatafile(fn)
-
 python read_subpackage_metadata () {
-	data = read_pkgdata(bb.data.getVar('PN', d, 1), d)
+	import oe.packagedata
+
+	data = oe.packagedata.read_pkgdata(bb.data.getVar('PN', d, 1), d)
 
 	for key in data.keys():
 		bb.data.setVar(key, data[key], d)
 
 	for pkg in bb.data.getVar('PACKAGES', d, 1).split():
-		sdata = read_subpkgdata(pkg, d)
+		sdata = oe.packagedata.read_subpkgdata(pkg, d)
 		for key in sdata.keys():
 			bb.data.setVar(key, sdata[key], d)
 }
-
-
-#
-# Collapse FOO_pkg variables into FOO
-#
-def read_subpkgdata_dict(pkg, d):
-	ret = {}
-	subd = read_pkgdatafile(get_subpkgedata_fn(pkg, d))
-	for var in subd:
-		newvar = var.replace("_" + pkg, "")
-		ret[newvar] = subd[var]
-	return ret
-
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
new file mode 100644
index 0000000..7f0a89d
--- /dev/null
+++ b/meta/lib/oe/packagedata.py
@@ -0,0 +1,106 @@
+import os
+import bb.data
+import codecs
+
+def packaged(pkg, d):
+    return os.access(get_subpkgedata_fn(pkg, d) + '.packaged', os.R_OK)
+
+def read_pkgdatafile(fn):
+    pkgdata = {}
+
+    def decode(str):
+        c = codecs.getdecoder("string_escape")
+        return c(str)[0]
+
+    if os.access(fn, os.R_OK):
+        import re
+        f = file(fn, 'r')
+        lines = f.readlines()
+        f.close()
+        r = re.compile("([^:]+):\s*(.*)")
+        for l in lines:
+            m = r.match(l)
+            if m:
+                pkgdata[m.group(1)] = decode(m.group(2))
+
+    return pkgdata
+
+def get_subpkgedata_fn(pkg, d):
+    archs = bb.data.expand("${PACKAGE_ARCHS}", d).split(" ")
+    archs.reverse()
+    pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
+    targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
+    for arch in archs:
+        fn = pkgdata + arch + targetdir + pkg
+        if os.path.exists(fn):
+            return fn
+    return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
+
+def has_subpkgdata(pkg, d):
+    return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
+
+def read_subpkgdata(pkg, d):
+    return read_pkgdatafile(get_subpkgedata_fn(pkg, d))
+
+def has_pkgdata(pn, d):
+    fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
+    return os.access(fn, os.R_OK)
+
+def read_pkgdata(pn, d):
+    fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
+    return read_pkgdatafile(fn)
+
+#
+# Collapse FOO_pkg variables into FOO
+#
+def read_subpkgdata_dict(pkg, d):
+    ret = {}
+    subd = read_pkgdatafile(get_subpkgedata_fn(pkg, d))
+    for var in subd:
+        newvar = var.replace("_" + pkg, "")
+        ret[newvar] = subd[var]
+    return ret
+
+def _pkgmap(d):
+    """Return a dictionary mapping package to recipe name."""
+
+    target_os = d.getVar("TARGET_OS", True)
+    target_vendor = d.getVar("TARGET_VENDOR", True)
+    basedir = os.path.dirname(d.getVar("PKGDATA_DIR", True))
+
+    dirs = ("%s%s-%s" % (arch, target_vendor, target_os)
+            for arch in d.getVar("PACKAGE_ARCHS", True).split())
+
+    pkgmap = {}
+    for pkgdatadir in (os.path.join(basedir, sys) for sys in dirs):
+        try:
+            files = os.listdir(pkgdatadir)
+        except OSError:
+            continue
+
+        for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdatadir, f)), files):
+            try:
+                pkgdata = read_pkgdatafile(os.path.join(pkgdatadir, pn))
+            except OSError:
+                continue
+
+            for pkg in pkgdata["PACKAGES"].split():
+                pkgmap[pkg] = pn
+
+    return pkgmap
+
+def pkgmap(d):
+    """Return a dictionary mapping package to recipe name.
+    Cache the mapping in the metadata"""
+
+    pkgmap_data = d.getVar("__pkgmap_data", False)
+    if pkgmap_data is None:
+        pkgmap_data = _pkgmap(d)
+        d.setVar("__pkgmap_data", pkgmap_data)
+
+    return pkgmap_data
+
+def recipename(pkg, d):
+    """Return the recipe name for the given binary package name."""
+
+    return pkgmap(d).get(pkg)
-- 
1.7.2.3



