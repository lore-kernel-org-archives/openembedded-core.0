Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7471.1593080525989600401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Sh2K6vx8;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7295; q=dns/txt; s=axis-central1;
  t=1593080533; x=1624616533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vMzbJSA3DV0B0DBFa0dsRqu8h8iFaUddat1fGI7Fts0=;
  b=Sh2K6vx8g8ZuKW1wcZ/z9xHRmG+UJwln1GpiRsgAAnChEM1KCQBY4XtH
   SOS5XJdmm4OpxTk6ibweWF1cUn0bK50Fnsk5WhsLzYk7F6nPAzIPml4Qp
   LQyUgltB/hhzKd9ITrPd4ONqvvFpELSIPVqdMqjFBFYUZMy+kEpCkkZoK
   vWLvkmkohy0nkQznbafGXYTqP8QwUOmJjDIB5NGnLS5U6mSOKysNvH41U
   hUW3Mw4Ir5X9LJXJGLkD2V62tXCeFoOXBaN5DRZLKojPVRRU97vQp3EHS
   +CbWv1dQrQohG2l5ocIJJPAfivBV9EqvhfpUouqE5IDIkTTZT1hdMsKYq
   g==;
IronPort-SDR: rIPoSPnpqFsdaFk2+QGKsoXmc0MNnWEmuKd6yizdjdlJGskcYbzUGvHw+4dMZPWRrYzux4Ylj2
 CAvpU2BwjwU+45PvDMv1FHXF+LAN9lZq27GRwmSps7z3L9fYUlpye/YUG+oxdfqsx9cSgJIMbQ
 pt4THltrM2NAbRs9Dd0go9eh8xefaPNb11QtCGX1GoxJvlgGrBpPQs4oVOGTqIDNuXDgFTdBTT
 7Mmafsf6egdb4gauuM9xXq+M88YlssaUkn0+M0bHSk7aZ89cpQCRIjYbxlGTqJsy1xvstBsJEJ
 37o=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185337"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, "Fredrik
 Gustafsson" <fredrigu@axis.com>
Subject: [PATCH v2 14/26] rootfs.py: Dynamic load of rootfs
Date: Thu, 25 Jun 2020 12:21:33 +0200
Message-ID: <20200625102145.7139-15-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Decide which rootfs we should load in run time without any hard coded
values but look at which package type that is used.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/deb/rootfs.py |   4 +-
 meta/lib/oe/package_managers/ipk/rootfs.py |   4 +-
 meta/lib/oe/package_managers/rpm/rootfs.py |   4 +-
 meta/lib/oe/rootfs.py                      | 135 +--------------------
 4 files changed, 10 insertions(+), 137 deletions(-)

diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
index 321f9c1fa7..ec9821e455 100644
--- a/meta/lib/oe/package_managers/deb/rootfs.py
+++ b/meta/lib/oe/package_managers/deb/rootfs.py
@@ -114,9 +114,9 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
-class DpkgRootfs(DpkgOpkgRootfs):
+class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '^E:'
         self.log_check_expected_regexes = \
         [
diff --git a/meta/lib/oe/package_managers/ipk/rootfs.py b/meta/lib/oe/package_managers/ipk/rootfs.py
index 3e7387467a..caa2920e9a 100644
--- a/meta/lib/oe/package_managers/ipk/rootfs.py
+++ b/meta/lib/oe/package_managers/ipk/rootfs.py
@@ -114,9 +114,9 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
-class OpkgRootfs(DpkgOpkgRootfs):
+class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
         import importlib
diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
index d3b615d03a..7b9e176bcb 100644
--- a/meta/lib/oe/package_managers/rpm/rootfs.py
+++ b/meta/lib/oe/package_managers/rpm/rootfs.py
@@ -4,9 +4,9 @@
 
 from oe.rootfs import *
 
-class RpmRootfs(Rootfs):
+class PkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b3d28c256f..fdfb8efafc 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -352,142 +352,15 @@ class Rootfs(object, metaclass=ABCMeta):
                                   self.image_rootfs, "-D", devtable])
 
 
-class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d, progress_reporter=None, logcatcher=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-
-    def _get_pkgs_postinsts(self, status_file):
-        def _get_pkg_depends_list(pkg_depends):
-            pkg_depends_list = []
-            # filter version requirements like libc (>= 1.1)
-            for dep in pkg_depends.split(', '):
-                m_dep = re.match(r"^(.*) \(.*\)$", dep)
-                if m_dep:
-                    dep = m_dep.group(1)
-                pkg_depends_list.append(dep)
-
-            return pkg_depends_list
-
-        pkgs = {}
-        pkg_name = ""
-        pkg_status_match = False
-        pkg_depends = ""
-
-        with open(status_file) as status:
-            data = status.read()
-            status.close()
-            for line in data.split('\n'):
-                m_pkg = re.match(r"^Package: (.*)", line)
-                m_status = re.match(r"^Status:.*unpacked", line)
-                m_depends = re.match(r"^Depends: (.*)", line)
-
-                #Only one of m_pkg, m_status or m_depends is not None at time
-                #If m_pkg is not None, we started a new package
-                if m_pkg is not None:
-                    #Get Package name
-                    pkg_name = m_pkg.group(1)
-                    #Make sure we reset other variables
-                    pkg_status_match = False
-                    pkg_depends = ""
-                elif m_status is not None:
-                    #New status matched
-                    pkg_status_match = True
-                elif m_depends is not None:
-                    #New depends macthed
-                    pkg_depends = m_depends.group(1)
-                else:
-                    pass
-
-                #Now check if we can process package depends and postinst
-                if "" != pkg_name and pkg_status_match:
-                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
-                else:
-                    #Not enough information
-                    pass
-
-        # remove package dependencies not in postinsts
-        pkg_names = list(pkgs.keys())
-        for pkg_name in pkg_names:
-            deps = pkgs[pkg_name][:]
-
-            for d in deps:
-                if d not in pkg_names:
-                    pkgs[pkg_name].remove(d)
-
-        return pkgs
-
-    def _get_delayed_postinsts_common(self, status_file):
-        def _dep_resolve(graph, node, resolved, seen):
-            seen.append(node)
-
-            for edge in graph[node]:
-                if edge not in resolved:
-                    if edge in seen:
-                        raise RuntimeError("Packages %s and %s have " \
-                                "a circular dependency in postinsts scripts." \
-                                % (node, edge))
-                    _dep_resolve(graph, edge, resolved, seen)
-
-            resolved.append(node)
-
-        pkg_list = []
-
-        pkgs = None
-        if not self.d.getVar('PACKAGE_INSTALL').strip():
-            bb.note("Building empty image")
-        else:
-            pkgs = self._get_pkgs_postinsts(status_file)
-        if pkgs:
-            root = "__packagegroup_postinst__"
-            pkgs[root] = list(pkgs.keys())
-            _dep_resolve(pkgs, root, pkg_list, [])
-            pkg_list.remove(root)
-
-        if len(pkg_list) == 0:
-            return None
-
-        return pkg_list
-
-    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
-        if bb.utils.contains("IMAGE_FEATURES", "package-management",
-                         True, False, self.d):
-            return
-        num = 0
-        for p in self._get_delayed_postinsts():
-            bb.utils.mkdirhier(dst_postinst_dir)
-
-            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
-                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
-
-            num += 1
-
-def get_class_for_type(imgtype):
-    from oe.package_managers.rpm.rootfs import RpmRootfs
-    from oe.package_managers.ipk.rootfs import OpkgRootfs
-    from oe.package_managers.deb.rootfs import DpkgRootfs
-    return {"rpm": RpmRootfs,
-            "ipk": OpkgRootfs,
-            "deb": DpkgRootfs}[imgtype]
-
 def variable_depends(d, manifest_dir=None):
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    cls = get_class_for_type(img_type)
-    return cls._depends_list()
+    import importlib
+    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.rootfs').PkgRootfs._depends_list()
 
 def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
     env_bkp = os.environ.copy()
 
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    from oe.package_managers.rpm.rootfs import RpmRootfs
-    from oe.package_managers.ipk.rootfs import OpkgRootfs
-    from oe.package_managers.deb.rootfs import DpkgRootfs
-    if img_type == "rpm":
-        RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "ipk":
-        OpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "deb":
-        DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
+    import importlib
+    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.rootfs').PkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
 
     os.environ.clear()
     os.environ.update(env_bkp)
-- 
2.20.1

