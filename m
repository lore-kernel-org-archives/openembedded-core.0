Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C913CFC5E7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:06:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.47649.1728576396605338151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA096DA7
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E688B3F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:06:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/11] insane: use oe.cachedpath.CachedPath instead of os.path
Date: Thu, 10 Oct 2024 17:06:22 +0100
Message-Id: <20241010160623.2880937-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010160623.2880937-1-ross.burton@arm.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205419

The insane QAPATHTESTs make many os.stat() calls, the majority of which
are redundant with caching as the initial sweep does a stat() on every
entry to determine if it is a file or a directory, and from then on each
test that does further stat()s is redundant as the tree doesn't change.

Switch os.stat() and friends (os.path.isfile(), etc) to use a common
oe.cachedpath.CachedPath() instance that is shared between all of the
functions, meaning only one stat is done.

In my test case of ltp:do_package_qa, this reduces the time taken from
44s to 37s.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 42 ++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index bec349e97cc..2d69bdec8d3 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -82,7 +82,9 @@ def package_qa_clean_path(path, d, pkg=3DNone):
=20
 QAPATHTEST[shebang-size] =3D "package_qa_check_shebang_size"
 def package_qa_check_shebang_size(path, name, d, elf):
-    if elf or os.path.islink(path) or not os.path.isfile(path):
+    global cpath
+
+    if elf or cpath.islink(path) or not cpath.isfile(path):
         return
=20
     try:
@@ -167,8 +169,8 @@ def package_qa_check_dev(path, name, d, elf):
     """
     Check for ".so" library symlinks in non-dev packages
     """
-
-    if not name.endswith("-dev") and not name.endswith("-dbg") and not n=
ame.endswith("-ptest") and not name.startswith("nativesdk-") and path.end=
swith(".so") and os.path.islink(path):
+    global cpath
+    if not name.endswith("-dev") and not name.endswith("-dbg") and not n=
ame.endswith("-ptest") and not name.startswith("nativesdk-") and path.end=
swith(".so") and cpath.islink(path):
         oe.qa.handle_error("dev-so", "non -dev/-dbg/nativesdk- package %=
s contains symlink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)), d)
=20
@@ -179,7 +181,8 @@ def package_qa_check_dev_elf(path, name, d, elf):
     check that the file is not a link and is an ELF object as some recip=
es
     install link-time .so files that are linker scripts.
     """
-    if name.endswith("-dev") and path.endswith(".so") and not os.path.is=
link(path) and elf:
+    global cpath
+    if name.endswith("-dev") and path.endswith(".so") and not cpath.isli=
nk(path) and elf:
         oe.qa.handle_error("dev-elf", "-dev package %s contains non-syml=
ink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)), d)
=20
@@ -422,9 +425,9 @@ def package_qa_check_buildpaths(path, name, d, elf):
     explicitly ignored.
     """
     import stat
-
+    global cpath
     # Ignore symlinks/devs/fifos
-    mode =3D os.lstat(path).st_mode
+    mode =3D cpath.lstat(path).st_mode
     if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or stat.S_ISFIFO(mode) o=
r stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
         return
=20
@@ -469,7 +472,8 @@ def package_qa_check_symlink_to_sysroot(path, name, d=
, elf):
     """
     Check that the package doesn't contain any absolute symlinks to the =
sysroot.
     """
-    if os.path.islink(path):
+    global cpath
+    if cpath.islink(path):
         target =3D os.readlink(path)
         if os.path.isabs(target):
             tmpdir =3D d.getVar('TMPDIR')
@@ -760,14 +764,19 @@ def qa_check_staged(path,d):
                         oe.qa.handle_error("pkgconfig", error_msg, d)
=20
             if not skip_shebang_size:
+                global cpath
+                cpath =3D oe.cachedpath.CachedPath()
                 package_qa_check_shebang_size(path, "", d, None)
+                cpath =3D None
=20
 # Walk over all files in a directory and call func
 def package_qa_walk(checkfuncs, package, d):
+    global cpath
+
     elves =3D {}
     for path in pkgfiles[package]:
             elf =3D None
-            if os.path.isfile(path) and not os.path.islink(path):
+            if cpath.isfile(path) and not cpath.islink(path):
                 elf =3D oe.qa.ELFFile(path)
                 try:
                     elf.open()
@@ -915,11 +924,12 @@ def package_qa_check_deps(pkg, pkgdest, d):
=20
 QAPKGTEST[usrmerge] =3D "package_qa_check_usrmerge"
 def package_qa_check_usrmerge(pkg, d):
+    global cpath
     pkgdest =3D d.getVar('PKGDEST')
     pkg_dir =3D pkgdest + os.sep + pkg + os.sep
     merged_dirs =3D ['bin', 'sbin', 'lib'] + d.getVar('MULTILIB_VARIANTS=
').split()
     for f in merged_dirs:
-        if os.path.exists(pkg_dir + f) and not os.path.islink(pkg_dir + =
f):
+        if cpath.exists(pkg_dir + f) and not cpath.islink(pkg_dir + f):
             msg =3D "%s package is not obeying usrmerge distro feature. =
/%s should be relocated to /usr." % (pkg, f)
             oe.qa.handle_error("usrmerge", msg, d)
             return
@@ -985,10 +995,11 @@ def package_qa_check_empty_dirs(pkg, d):
     empty.
     """
=20
+    global cpath
     pkgd =3D oe.path.join(d.getVar('PKGDEST'), pkg)
     for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
         empty_dir =3D oe.path.join(pkgd, dir)
-        if os.path.exists(empty_dir) and os.listdir(empty_dir):
+        if cpath.exists(empty_dir) and os.listdir(empty_dir):
             recommendation =3D (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:'=
 + dir) or
                               "but it is expected to be empty")
             msg =3D "%s installs files in %s, %s" % (pkg, dir, recommend=
ation)
@@ -1018,8 +1029,9 @@ HOST_USER_GID :=3D "${@os.getgid()}"
 QAPATHTEST[host-user-contaminated] =3D "package_qa_check_host_user"
 def package_qa_check_host_user(path, name, d, elf):
     """Check for paths outside of /home which are owned by the user runn=
ing bitbake."""
+    global cpath
=20
-    if not os.path.lexists(path):
+    if not cpath.lexists(path):
         return
=20
     dest =3D d.getVar('PKGDEST')
@@ -1029,7 +1041,7 @@ def package_qa_check_host_user(path, name, d, elf):
         return
=20
     try:
-        stat =3D os.lstat(path)
+        stat =3D cpath.lstat(path)
     except OSError as exc:
         import errno
         if exc.errno !=3D errno.ENOENT:
@@ -1105,13 +1117,14 @@ python do_package_qa () {
     if not packages:
         return
=20
-    global pkgfiles
+    global pkgfiles, cpath
     pkgfiles =3D {}
+    cpath =3D oe.cachedpath.CachedPath()
     pkgdest =3D d.getVar('PKGDEST')
     for pkg in packages:
         pkgdir =3D os.path.join(pkgdest, pkg)
         pkgfiles[pkg] =3D []
-        for walkroot, dirs, files in os.walk(pkgdir):
+        for walkroot, dirs, files in cpath.walk(pkgdir):
             # Don't walk into top-level CONTROL or DEBIAN directories as=
 these
             # are temporary directories created by do_package.
             if walkroot =3D=3D pkgdir:
@@ -1159,6 +1172,7 @@ python do_package_qa () {
=20
     package_qa_check_libdir(d)
=20
+    cpath =3D None
     oe.qa.exit_if_errors(d)
 }
=20
--=20
2.34.1


