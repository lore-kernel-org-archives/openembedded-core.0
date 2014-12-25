Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 341BE72644
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:49:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBP1n6ff020349
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 24 Dec 2014 17:49:06 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Dec 2014 17:49:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Dec 2014 09:48:56 +0800
Message-ID: <749c7fdb97b46a3dd2d9896fd280427e2b112ee4.1419471695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419471695.git.hongxu.jia@windriver.com>
References: <cover.1419471695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] insane.bbclass: add QA check: package-missing
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
X-List-Received-Date: Thu, 25 Dec 2014 01:49:09 -0000
Content-Type: text/plain

During packaging, check if there are any dependencies (RDEPENDS)
on packages that have ended up empty and not produced; and if so
produce an warn/error as soon as possible, instead of allowing
the build to proceed up to do_rootfs and then the package manager
reporting the package as missing.

At the moment, we use packageinfo which saved in $PKGDATA_DIR to
collect all available packages rdepends and rprovides. So in the
do_package_qa task, while package not produced, we could compute
rdepends chain, and report warn/error immediately.

[YOCTO #5531]
[YOCTO #6420]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/insane.bbclass | 100 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b45374..59129b7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps file-rdeps \
+            pn-overrides infodir build-deps file-rdeps package-missing \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -868,6 +868,15 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                             (pkg, ', '.join(str(e) for e in filerdepends))
                 sane = package_qa_handle_error("file-rdeps", error_msg, d)
 
+        if "package-missing" not in skip and \
+               not pkg.endswith("-dev") and not pkg.endswith("-staticdev") and \
+               not pkg.endswith("-locale") and not pkg.endswith("-dbg") and \
+               not pkg.endswith("-doc"):
+            if not oe.packagedata.packaged(pkg, d):
+                error_msg = "package %s not generated, but listed in PACKAGES\n" % pkg
+                error_msg += compute_rdepends_chain(pkg, d)
+                sane = package_qa_handle_error("package-missing", error_msg, d)
+
     return sane
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
@@ -1152,3 +1161,92 @@ python () {
     for i in issues:
         package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE", True), i), d)
 }
+
+# It collects all available packages rdepends and rprovides,
+# except the "-dev, -staticdev, -locale, -dbg, -doc" packages.
+# Such as:
+# RDEPENDS_pkg1 = "pkg2 pkg3"
+# RDEPENDS_pkg4 = "pkg3 pkg5"
+# equals:
+# rdeps_dict = {'pkg2': 'pkg1', 'pkg3': 'pkg1 pkg4', 'pkg5':'pkg4'}
+#
+# RPROVIDES_pkg6 = "pkg2 pkg7"
+# RPROVIDES_pkg7 = "pkg5"
+# equals:
+# rprovides_dict = {'pkg6': 'pkg2 pkg7', 'pkg7': 'pkg5'}
+def collect_packageinfo(d):
+    import re
+    rdeps_dict = dict()
+    rprovides_dict = dict()
+    pkgdata_dir = d.getVar("PKGDATA_DIR", True) + '/runtime/'
+    if os.path.exists(pkgdata_dir):
+        for root, dirs, files in os.walk(pkgdata_dir):
+            for pkgname in files:
+                if pkgname.endswith('.packaged') or \
+                   pkgname.endswith("-dev") or \
+                   pkgname.endswith("-staticdev") or \
+                   pkgname.endswith("-locale") or \
+                   pkgname.endswith("-dbg") or pkgname.endswith("-doc"):
+                    continue
+
+                pkgdatafile = root + pkgname
+                try:
+                    sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
+                    rdepends = sdata.get('RDEPENDS_%s' % pkgname)
+                    if rdepends:
+                        # Filter out sub string "(***)" in RDEPENDS
+                        p = re.compile('\([^\)]*\)')
+                        for rdep in p.sub('', rdepends).split():
+                            # Filter out pkg which rdepends itself
+                            if pkgname == rdep:
+                                continue
+
+                            if rdep in rdeps_dict and \
+                               pkgname not in rdeps_dict[rdep].split():
+                                rdeps_dict[rdep] += ' %s' % pkgname
+                            elif rdep not in rdeps_dict:
+                                rdeps_dict[rdep] = '%s' % pkgname
+
+                    rprovides = sdata.get('RPROVIDES_%s' % pkgname)
+                    if rprovides:
+                        rprovides_dict[pkgname] = rprovides
+
+                except Exception as e:
+                    bb.warn("%s: Failed to read pkgdata file %s: %s: %s" % (pkgname, pkgdatafile, e.__class__, str(e)))
+
+    return rdeps_dict, rprovides_dict
+
+def compute_rdepends_chain(pkg, d):
+    rdeps_dict, rprovides_dict = collect_packageinfo(d)
+    def get_parents(pkg, messages):
+        parents = []
+
+        if pkg not in rdeps_dict and pkg in rprovides_dict:
+            for rprovide in rprovides_dict[pkg].split():
+                # Use rprovide to instead of pkg
+                if rprovide in rdeps_dict:
+                    messages.append('("%s" rprovides "%s")' % (pkg, rprovide))
+                    pkg = rprovide
+                    break
+
+        if pkg in rdeps_dict:
+            parents = rdeps_dict[pkg].split()
+            for parent in parents:
+                message = '"%s" -> "%s"' % (parent, pkg)
+                if message in messages:
+                    return
+                messages.append(message)
+
+            for parent in parents:
+                get_parents(parent, messages)
+
+        return
+
+    messages = []
+    get_parents(pkg, messages)
+    if messages:
+        message = "Compute rdepends chains, '-->' means 'runtime depends'\n" \
+                  + '\n'.join(messages)
+        return message
+    return ''
+
-- 
1.9.1


