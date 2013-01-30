Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YcU-0002FG-JA
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662t007211; Wed, 30 Jan 2013 14:06:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7641okerebPE; Wed, 30 Jan 2013 14:06:10 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE63fD007188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:05 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE0-00083Y-1A; Wed, 30 Jan 2013 14:01:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:04 +0000
Message-Id: <61320cb73d2e573199e129ff355494f9ef47a6c2.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/17] package.bbclass: Split out package_fixsymlinks function
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
X-List-Received-Date: Wed, 30 Jan 2013 14:36:18 -0000

The symlink handling code doesn't need to being part of populate_packages
and is logically separate so split it out into a separate function,
package_fixsymlinks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 858afbd..8bf80f5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -919,7 +919,7 @@ python split_and_strip_files () {
 }
 
 python populate_packages () {
-    import glob, stat, errno, re, subprocess
+    import glob, re, subprocess
 
     workdir = d.getVar('WORKDIR', True)
     outdir = d.getVar('DEPLOY_DIR', True)
@@ -1037,10 +1037,17 @@ python populate_packages () {
             package_qa_handle_error("installed_vs_shipped", msg, d)
 
     bb.build.exec_func("package_name_hook", d)
+}
+populate_packages[dirs] = "${D}"
+
+python package_fixsymlinks () {
+    import errno
+    pkgdest = d.getVar('PKGDEST', True)
+    packages = d.getVar("PACKAGES").split()
 
     dangling_links = {}
     pkg_files = {}
-    for pkg in package_list:
+    for pkg in packages:
         dangling_links[pkg] = []
         pkg_files[pkg] = []
         inst_root = os.path.join(pkgdest, pkg)
@@ -1059,13 +1066,13 @@ python populate_packages () {
                         target = os.path.join(root[len(inst_root):], target)
                     dangling_links[pkg].append(os.path.normpath(target))
 
-    for pkg in package_list:
+    for pkg in packages:
         rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
 
         for l in dangling_links[pkg]:
             found = False
             bb.debug(1, "%s contains dangling link %s" % (pkg, l))
-            for p in package_list:
+            for p in packages:
                 for f in pkg_files[p]:
                     if f == l:
                         found = True
@@ -1079,7 +1086,6 @@ python populate_packages () {
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
-populate_packages[dirs] = "${D}"
 
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
@@ -1842,6 +1848,7 @@ PACKAGEFUNCS ?= "package_get_auto_pr \
                 split_and_strip_files \
                 fixup_perms \
                 populate_packages \
+                package_fixsymlinks \
                 package_do_filedeps \
                 package_do_shlibs \
                 package_do_pkgconfig \
-- 
1.7.10.4



