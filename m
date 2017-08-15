Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE427850A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:43:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7FLhdW4021455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Aug 2017 14:43:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:43:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:41:55 -0500
Message-ID: <1502833317-48183-5-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 4/6 v2] package_rpm.bbclass: Filter out unwanted file deps for nativesdk packages
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
X-List-Received-Date: Tue, 15 Aug 2017 21:43:41 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <pkj@axis.com>

Filter out any file dependencies on absolute paths and any
dependencies on Perl modules for nativesdk packages. It is assumed
that they will be provided by the native host if needed, and they mess
up the dependency handling if they are present.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 5562074..1deaf83 100644
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
1.8.3.1


