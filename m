Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzX-0001xO-Db
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:16 +0200
Received: by pzk36 with SMTP id 36so927045pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=5SGupulMJdoMvbdBI6ffpwb0BQVuKA1VxchW7q/IPgE=;
	b=EZXyPbIf5d7ZIj44vSIhSnXaVWqWGbSm1inS89X9qduVy38w7N19CgU6GpeiaV1fyL
	WKMWCYyj18hXFBSIU+B0Q+Xd89seBpeoPaCbX+5Ticmm4hl3xFWK+YS/NDvH2SKZLaFK
	AyakQ3y+Euanz+fNW5L9D5/BbJWx4DWLTtGlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JnnnIuDH/1BYW1yxEcuofOcry5ajtTqJmWurUwlAU+gK/Zek/cVyiQVBSSzn8sCYXt
	wuVzAbwTwFU2j/e5DAY9yhRdamZOB2IHmYrvdUI7Uub/4rAachDKHKUQh6lqjOiO9zdb
	25bUV9Xyu+rkNQCoMJcM0BdDC9k1MtvIXx7ns=
Received: by 10.68.38.4 with SMTP id c4mr3363982pbk.336.1305752776213;
	Wed, 18 May 2011 14:06:16 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:15 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:03 -0700
Message-Id: <84e7e11eba12f9fef7021d09918025751bd0ee2b.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] Move packagedata code into oe.packagedata (sync from OE)
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
X-List-Received-Date: Wed, 18 May 2011 21:09:16 -0000

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
index 4eb349d..2c6d30c 100644
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
index 1cf9f79..6d96719 100644
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
1.7.1



