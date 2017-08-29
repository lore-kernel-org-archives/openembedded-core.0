Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3A77830F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 59E4F18430;
	Tue, 29 Aug 2017 23:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id quOGvuIK7pgl; Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A28EB18449;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C3B71A0B3;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6181C1A0B1;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 54D5E2198;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLglP030275;
	Tue, 29 Aug 2017 23:21:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLgdV030271;
	Tue, 29 Aug 2017 23:21:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:16 +0200
Message-Id: <36182e7b77aec857c27a02d73bd022d825916a07.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 20/25] package_rpm.bbclass: Filter out unwanted file deps for nativesdk packages
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:44 -0000

Filter out any file dependencies on absolute paths and any
dependencies on Perl modules for nativesdk packages. It is assumed
that they will be provided by the native host if needed, and they mess
up the dependency handling if they are present.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 084546f733..62324b30a0 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -7,10 +7,28 @@ RPMBUILD="rpmbuild"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has singificant overhead when writing the 
+# Maintaining the perfile dependencies has singificant overhead when writing the
 # packages. When set, this value merges them for efficiency.
 MERGEPERFILEDEPS = "1"
 
+# Filter dependencies based on a provided function.
+def filter_deps(var, f):
+    import collections
+
+    depends_dict = bb.utils.explode_dep_versions2(var)
+    newdeps_dict = collections.OrderedDict()
+    for dep in depends_dict:
+        if f(dep):
+            newdeps_dict[dep] = depends_dict[dep]
+    return bb.utils.join_deps(newdeps_dict, commasep=False)
+
+# Filter out absolute paths (typically /bin/sh and /usr/bin/env) and any perl
+# dependencies for nativesdk packages.
+def filter_nativesdk_deps(srcname, var):
+    if var and srcname.startswith("nativesdk-"):
+        var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
+    return var
+
 # Construct per file dependencies file
 def write_rpm_perfiledata(srcname, d):
     workdir = d.getVar('WORKDIR')
@@ -26,7 +44,8 @@ def write_rpm_perfiledata(srcname, d):
             dependsflist = (d.getVar(dependsflist_key) or "")
             for dfile in dependsflist.split():
                 key = "FILE" + varname + "_" + dfile + "_" + pkg
-                depends_dict = bb.utils.explode_dep_versions(d.getVar(key) or "")
+                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
+                depends_dict = bb.utils.explode_dep_versions(deps)
                 file = dfile.replace("@underscore@", "_")
                 file = file.replace("@closebrace@", "]")
                 file = file.replace("@openbrace@", "[")
@@ -359,6 +378,8 @@ python write_specfile () {
             splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
             splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
+        splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
+
         # Gather special src/first package data
         if srcname == splitname:
             srcrdepends    = splitrdepends
-- 
2.12.0


