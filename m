Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7600E787DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:56:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1RJulsc004848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Feb 2018 19:56:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eqlMl-0005K4-Bd; Tue, 27 Feb 2018 19:56:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:56:44 +0000
Message-Id: <1519761405-20421-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] package_manager: Filter to only rpms we depend upon
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
X-List-Received-Date: Tue, 27 Feb 2018 19:56:50 -0000

Currently do_rootfs gets to see all rpms in the deploy directory. This filters
that view to only rpms which the image recipe has actual depends upon which
potentially removes some sources of confusion in the image construction.

This makes builds more reproducibile and also fixes contamination issues
where dnf picks up packages it shouldn't be able to 'see'.

[YOCTO #12039]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py         | 114 ++++++++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/package_manager.py |   3 +-
 2 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f7e0134..f59eaf7 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -454,6 +454,114 @@ class PackageManager(object, metaclass=ABCMeta):
             return res
         return _append(uris, base_paths)
 
+def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependencies):
+    """
+    Go through our do_package_write_X dependencies and hardlink the packages we depend
+    upon into the repo directory. This prevents us seeing other packages that may
+    have been built that we don't depend upon and also packages for architectures we don't
+    support.
+    """
+    import errno
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    mytaskname = d.getVar("BB_RUNTASK")
+    pn = d.getVar("PN")
+    seendirs = set()
+    multilibs = {}
+   
+    rpm_subrepo_dir = oe.path.join(rpm_repo_dir, "rpm")
+
+    bb.utils.remove(rpm_subrepo_dir, recurse=True)
+    bb.utils.mkdirhier(rpm_subrepo_dir)
+
+    # Detect bitbake -b usage
+    nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    if nodeps or not filterbydependencies:
+        oe.path.symlink(deploydir, rpm_subrepo_dir, True)
+        return
+
+    start = None
+    for dep in taskdepdata:
+        data = taskdepdata[dep]
+        if data[1] == mytaskname and data[0] == pn:
+            start = dep
+            break
+    if start is None:
+        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
+    rpmdeps = set()
+    start = [start]
+    seen = set(start)
+    # Support direct dependencies (do_rootfs -> rpms)
+    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs -> rpms)
+    while start:
+        next = []
+        for dep2 in start:
+            for dep in taskdepdata[dep2][3]:
+                if taskdepdata[dep][0] != pn:
+                    if "do_" + taskname in dep:
+                        rpmdeps.add(dep)
+                elif dep not in seen:
+                    next.append(dep)
+                    seen.add(dep)
+        start = next
+
+    for dep in rpmdeps:
+        c = taskdepdata[dep][0]
+
+        d2 = d
+        variant = ''
+        if taskdepdata[dep][2].startswith("virtual:multilib"):
+            variant = taskdepdata[dep][2].split(":")[2]
+            if variant not in multilibs:
+                multilibs[variant] = oe.utils.get_multilib_datastore(variant, d)
+            d2 = multilibs[variant]
+
+        if c.endswith("-native"):
+            pkgarchs = ["${BUILD_ARCH}"]
+        elif c.startswith("nativesdk-"):
+            pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
+        elif "-cross-canadian" in c:
+            pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
+        elif "-cross-" in c:
+            pkgarchs = ["${BUILD_ARCH}_${TARGET_ARCH}"]
+        elif "-crosssdk" in c:
+            pkgarchs = ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
+        else:
+            pkgarchs = ['${MACHINE_ARCH}']
+            pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
+            pkgarchs.append('allarch')
+            pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
+
+        for pkgarch in pkgarchs:
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, c, taskname))
+            if os.path.exists(manifest):
+                break
+        if not os.path.exists(manifest):
+            bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+            continue
+        with open(manifest, "r") as f:
+            for l in f:
+                l = l.strip()
+                dest = l.replace(deploydir, "")
+                dest = rpm_subrepo_dir + dest
+                if l.endswith("/"):
+                    if dest not in seendirs:
+                        bb.utils.mkdirhier(dest)
+                        seendirs.add(dest)
+                    continue
+                # Try to hardlink the file, copy if that fails
+                destdir = os.path.dirname(dest)
+                if destdir not in seendirs:
+                    bb.utils.mkdirhier(destdir)
+                    seendirs.add(destdir)
+                try:
+                    os.link(l, dest)
+                except OSError as err:
+                    if err.errno == errno.EXDEV:
+                        bb.utils.copyfile(l, dest)
+                    else:
+                        raise
+
 class RpmPM(PackageManager):
     def __init__(self,
                  d,
@@ -462,7 +570,8 @@ class RpmPM(PackageManager):
                  task_name='target',
                  arch_var=None,
                  os_var=None,
-                 rpm_repo_workdir="oe-rootfs-repo"):
+                 rpm_repo_workdir="oe-rootfs-repo",
+                 filterbydependencies=True):
         super(RpmPM, self).__init__(d)
         self.target_rootfs = target_rootfs
         self.target_vendor = target_vendor
@@ -477,8 +586,7 @@ class RpmPM(PackageManager):
             self.primary_arch = self.d.getVar('MACHINE_ARCH')
 
         self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
-        bb.utils.mkdirhier(self.rpm_repo_dir)
-        oe.path.symlink(self.d.getVar('DEPLOY_DIR_RPM'), oe.path.join(self.rpm_repo_dir, "rpm"), True)
+        create_packages_dir(self.d, self.rpm_repo_dir, d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
 
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 724afb2..afd5b8e 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -14,7 +14,8 @@ def get_package_manager(d, root_path):
     if pkg_class == "rpm":
         pm = RpmPM(d,
                    root_path,
-                   d.getVar('TARGET_VENDOR'))
+                   d.getVar('TARGET_VENDOR'),
+                   filterbydependencies=False)
         pm.create_configs()
 
     elif pkg_class == "ipk":
-- 
2.7.4


