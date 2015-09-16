Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB86E75CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24GAR028053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:11 -0700
Message-ID: <d1e249dde6b887303a1667fb1537957685fa78bc.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] package_manager.py: make rpm install mutilib pkgs corectly
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:17 -0000
Content-Type: text/plain

When configure multilib, "bitbake <image_bb> -c populate_sdk" should
install all arch toolchains (for example, 32 and 64bit), but rpm not
handle the multilib requires correctly, for example:
lib32-packagegroup-core-standalone-sdk-target requires lib32-libc6, rpm
may pull in libc6 rather than lib32-libc6, there are the similar issue
when:

IMAGE_INSTALL_append += "lib32-packagegroup-foo foo"

Use bitbake to expand the RDEPENDS will fix the problem since bitbake
knows mlprefix and handle it well, but rpm doesn't.

This patch only affects when:
IMAGE_INSTALL = "lib32-foo foo"
Doesn't affect:
IMAGE_INSTALL = "lib32-foo1 lib32-foo2"
Or:
IMAGE_INSTALL = "foo1 foo2"

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py |   83 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 292ed44..c51e88b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -605,12 +605,12 @@ class PackageManager(object):
             cmd.extend(['-x', exclude])
         try:
             bb.note("Installing complementary packages ...")
+            bb.note('Running %s' % cmd)
             complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not compute complementary packages list. Command "
                      "'%s' returned %d:\n%s" %
                      (' '.join(cmd), e.returncode, e.output))
-
         self.install(complementary_pkgs.split(), attempt_only=True)
 
     def deploy_dir_lock(self):
@@ -1050,6 +1050,35 @@ class RpmPM(PackageManager):
     def update(self):
         self._invoke_smart('update rpmsys')
 
+    def get_rdepends_recursively(self, pkgs):
+        # pkgs will be changed during the loop, so use [:] to make a copy.
+        for pkg in pkgs[:]:
+            sub_data = oe.packagedata.read_subpkgdata(pkg, self.d)
+            sub_rdep = sub_data.get("RDEPENDS_" + pkg)
+            if not sub_rdep:
+                continue
+            done = bb.utils.explode_dep_versions2(sub_rdep).keys()
+            next = done
+            # Find all the rdepends on dependency chain
+            while next:
+                new = []
+                for sub_pkg in next:
+                    sub_data = oe.packagedata.read_subpkgdata(sub_pkg, self.d)
+                    sub_pkg_rdep = sub_data.get("RDEPENDS_" + sub_pkg)
+                    if not sub_pkg_rdep:
+                        continue
+                    for p in bb.utils.explode_dep_versions2(sub_pkg_rdep):
+                        # Already handled, skip it.
+                        if p in done or p in pkgs:
+                            continue
+                        # It's a new dep
+                        if oe.packagedata.has_subpkgdata(p, self.d):
+                            done.append(p)
+                            new.append(p)
+                next = new
+            pkgs.extend(done)
+        return pkgs
+
     '''
     Install pkgs with smart, the pkg name is oe format
     '''
@@ -1059,8 +1088,58 @@ class RpmPM(PackageManager):
             bb.note("There are no packages to install")
             return
         bb.note("Installing the following packages: %s" % ' '.join(pkgs))
+        if not attempt_only:
+            # Pull in multilib requires since rpm may not pull in them
+            # correctly, for example,
+            # lib32-packagegroup-core-standalone-sdk-target requires
+            # lib32-libc6, but rpm may pull in libc6 rather than lib32-libc6
+            # since it doesn't know mlprefix (lib32-), bitbake knows it and
+            # can handle it well, find out the RDEPENDS on the chain will
+            # fix the problem. Both do_rootfs and do_populate_sdk have this
+            # issue.
+            # The attempt_only packages don't need this since they are
+            # based on the installed ones.
+            #
+            # Separate pkgs into two lists, one is multilib, the other one
+            # is non-multilib.
+            ml_pkgs = []
+            non_ml_pkgs = pkgs[:]
+            for pkg in pkgs:
+                for mlib in (self.d.getVar("MULTILIB_VARIANTS", True) or "").split():
+                    if pkg.startswith(mlib + '-'):
+                        ml_pkgs.append(pkg)
+                        non_ml_pkgs.remove(pkg)
+
+            if len(ml_pkgs) > 0 and len(non_ml_pkgs) > 0:
+                # Found both foo and lib-foo
+                ml_pkgs = self.get_rdepends_recursively(ml_pkgs)
+                non_ml_pkgs = self.get_rdepends_recursively(non_ml_pkgs)
+                # Longer list makes smart slower, so only keep the pkgs
+                # which have the same BPN, and smart can handle others
+                # correctly.
+                pkgs_new = []
+                for pkg in non_ml_pkgs:
+                    for mlib in (self.d.getVar("MULTILIB_VARIANTS", True) or "").split():
+                        mlib_pkg = mlib + "-" + pkg
+                        if mlib_pkg in ml_pkgs:
+                            pkgs_new.append(pkg)
+                            pkgs_new.append(mlib_pkg)
+                for pkg in pkgs:
+                    if pkg not in pkgs_new:
+                        pkgs_new.append(pkg)
+                pkgs = pkgs_new
+                new_depends = {}
+                deps = bb.utils.explode_dep_versions2(" ".join(pkgs))
+                for depend in deps:
+                    data = oe.packagedata.read_subpkgdata(depend, self.d)
+                    key = "PKG_%s" % depend
+                    if key in data:
+                        new_depend = data[key]
+                    else:
+                        new_depend = depend
+                    new_depends[new_depend] = deps[depend]
+                pkgs = bb.utils.join_deps(new_depends, commasep=True).split(', ')
         pkgs = self._pkg_translate_oe_to_smart(pkgs, attempt_only)
-
         if not attempt_only:
             bb.note('to be installed: %s' % ' '.join(pkgs))
             cmd = "%s %s install -y %s" % \
-- 
1.7.9.5


