Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AEDE68978
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 11:40:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10284.1730374827198750930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 04:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027F11063
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 04:40:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E23C63F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 04:40:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/package: remove PACKAGE_SNAP_LIB_SYMLINKS
Date: Thu, 31 Oct 2024 11:40:17 +0000
Message-Id: <20241031114017.3239870-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 11:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206578

This was added to OpenEmbedded in 2011[1] for the micro distro[2] and
subsequently ported to oe-core[3].  This feature aims to improve runtime
link speed by removing intermediate symlinks, i.e. libstdc++.so.6 is not
a symlink but the actual library.

However, there are several issues here:
- The meta-micro distribution has been unmaintained since 2012[4]
- The original creator of this function has confirmed that it is not in
  use anymore because the renaming doesn't affect the -dev packages, so
  on-target development or use of SDKs isn't possible.

Whilst the latter is possible to fix, the performance impact of removing
a single symlink resolution is negliable at best and the packaging code
is already very complex.

So, remove this functionality as it is known to be broken, isn't tested,
and removing it reduces complexity.

[1] https://git.openembedded.org/openembedded/commit/?id=3Dcf7114179ead8d=
dff8f66e84d630811920ac9add
[2] https://git.openembedded.org/openembedded/tree/conf/distro/micro.conf
[3] https://git.openembedded.org/openembedded-core/commit/?id=3D600dbb7cb=
384c2290af38b993a9bea3a4dfc4494
[4] https://git.openembedded.org/meta-micro/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/documentation.conf |  1 -
 meta/lib/oe/package.py       | 25 +++++--------------------
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3f130120c0c..d16520a371a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -317,7 +317,6 @@ PACKAGE_EXCLUDE[doc] =3D "Packages to exclude from th=
e installation. If a listed p
 PACKAGE_EXTRA_ARCHS[doc] =3D "Specifies the list of architectures compat=
ible with the device CPU. This variable is useful when you build for seve=
ral different devices that use miscellaneous processors."
 PACKAGE_INSTALL[doc] =3D "List of the packages to be installed into the =
image. The variable is generally not user-defined and uses IMAGE_INSTALL =
as part of the list."
 PACKAGE_INSTALL_ATTEMPTONLY[doc] =3D "List of packages attempted to be i=
nstalled. If a listed package fails to install, the build system does not=
 generate an error. This variable is generally not user-defined."
-PACKAGE_SNAP_LIB_SYMLINKS[doc] =3D "Rename library files based on their =
SONAME to avoid an extra layer of indirection through a symlink. Only sui=
table for a read-only rootfs where libraries are not upgraded in place."
 PACKAGECONFIG[doc] =3D "This variable provides a means of enabling or di=
sabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] =3D "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] =3D "A promise that your recipe satisfies runtime =
dependencies for optional modules that are found in other recipes."
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 16359232ecd..1af10b7eb0e 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1623,7 +1623,6 @@ def process_shlibs(pkgfiles, d):
         needs_ldconfig =3D False
         needed =3D set()
         sonames =3D set()
-        renames =3D []
         ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd =3D d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/=
dev/null"
         fd =3D os.popen(cmd)
@@ -1651,11 +1650,9 @@ def process_shlibs(pkgfiles, d):
                         sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig =3D True
-                if needs_ldconfig and snap_symlinks and (os.path.basenam=
e(file) !=3D this_soname):
-                    renames.append((file, os.path.join(os.path.dirname(f=
ile), this_soname)))
-        return (needs_ldconfig, needed, sonames, renames)
+        return (needs_ldconfig, needed, sonames)
=20
-    def darwin_so(file, needed, sonames, renames, pkgver):
+    def darwin_so(file, needed, sonames, pkgver):
         if not os.path.exists(file):
             return
         ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
@@ -1707,7 +1704,7 @@ def process_shlibs(pkgfiles, d):
                 if name and name not in needed[pkg]:
                      needed[pkg].add((name, file, tuple()))
=20
-    def mingw_dll(file, needed, sonames, renames, pkgver):
+    def mingw_dll(file, needed, sonames, pkgver):
         if not os.path.exists(file):
             return
=20
@@ -1726,11 +1723,6 @@ def process_shlibs(pkgfiles, d):
                     if dllname:
                         needed[pkg].add((dllname, file, tuple()))
=20
-    if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS') =3D=3D "1":
-        snap_symlinks =3D True
-    else:
-        snap_symlinks =3D False
-
     needed =3D {}
=20
     shlib_provider =3D oe.package.read_shlib_providers(d)
@@ -1749,16 +1741,15 @@ def process_shlibs(pkgfiles, d):
=20
         needed[pkg] =3D set()
         sonames =3D set()
-        renames =3D []
         linuxlist =3D []
         for file in pkgfiles[pkg]:
                 soname =3D None
                 if cpath.islink(file):
                     continue
                 if hostos.startswith("darwin"):
-                    darwin_so(file, needed, sonames, renames, pkgver)
+                    darwin_so(file, needed, sonames, pkgver)
                 elif hostos.startswith("mingw"):
-                    mingw_dll(file, needed, sonames, renames, pkgver)
+                    mingw_dll(file, needed, sonames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
                     linuxlist.append(file)
=20
@@ -1768,14 +1759,8 @@ def process_shlibs(pkgfiles, d):
                 ldconfig =3D r[0]
                 needed[pkg] |=3D r[1]
                 sonames |=3D r[2]
-                renames.extend(r[3])
                 needs_ldconfig =3D needs_ldconfig or ldconfig
=20
-        for (old, new) in renames:
-            bb.note("Renaming %s to %s" % (old, new))
-            bb.utils.rename(old, new)
-            pkgfiles[pkg].remove(old)
-
         shlibs_file =3D os.path.join(shlibswork_dir, pkg + ".list")
         if len(sonames):
             with open(shlibs_file, 'w') as fd:
--=20
2.34.1


