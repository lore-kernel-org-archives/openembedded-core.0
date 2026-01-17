Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D73BCA5FE0
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 20:57:19 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3398.1768683434390283469
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 12:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 60HKvCha2530176
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 14:57:13 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dpkg: Fix ADMINDIR
Date: Sat, 17 Jan 2026 14:57:11 -0600
Message-Id: <1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 20:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229576

dpkg has a hard coded path (from build time) for the ADMINDIR, for some
reason the "set_root" function was using this hard coded value instead
of the value from apt.conf or the environment.

Follow the example of db_dir.c and use the environment if set.

Adjust the matching oe package_manager functions to set the ADMINDIR,
even though the apt.conf sets --admindir.  Note it's unclear if the
--admindir value that is set is reasonable or not.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---

Recent pseudo work pointed out that this path was not working properly.
Clearly it wasn't causing any functional issues since the value being
used was incorrect and pseudo was masking the path issue.

With the realpath fix in pseudo, deb rootfs was failing with:
  dpkg: error: cannot canonicalize pathname /srv/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86-64-v3-poky-linux/srv/pokybuild/yocto-worker/meta-aws/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.21/recipe-sysroot-native/var/lib/dpkg: Invalid argument

Someone with more knowledge then me should probably review the YP/deb
side of things and ensure this is really correct.  But this does fix
the problem for me.

 meta/lib/oe/package_manager/deb/__init__.py   |  4 ++
 ...-dirs.c-set_rootfs-was-not-checking-.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index eb48f3f982..cdb58bee10 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -213,6 +213,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def update(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         self.deploy_dir_lock()
 
@@ -231,6 +232,7 @@ class DpkgPM(OpkgDpkgPM):
             return
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         extra_args = ""
         if hard_depends_only:
@@ -282,6 +284,7 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         if with_dependencies:
             os.environ['APT_CONFIG'] = self.apt_conf_file
@@ -424,6 +427,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def fix_broken_dependencies(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         cmd = "%s %s --allow-unauthenticated -f install" % (self.apt_get_cmd, self.apt_args)
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
new file mode 100644
index 0000000000..3901b739a6
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
@@ -0,0 +1,46 @@
+From c036cfa1ee53a900b4ed45bc91e45a0792547eea Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@kernel.crashing.org>
+Date: Sat, 17 Jan 2026 20:20:23 +0000
+Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
+ environment
+
+The set_rootfs function was using the hardcoded ADMINDIR (define).  It
+should be checking the environment, and then falling back to the define
+if not set.
+
+This matches the behavior in db_dir.c.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
+---
+ lib/dpkg/options-dirs.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/dpkg/options-dirs.c b/lib/dpkg/options-dirs.c
+index 9b7a122fe..34869d792 100644
+--- a/lib/dpkg/options-dirs.c
++++ b/lib/dpkg/options-dirs.c
+@@ -49,13 +49,18 @@ set_admindir(const struct cmdinfo *cip, const char *value)
+ void
+ set_root(const struct cmdinfo *cip, const char *value)
+ {
++	const char *env;
+ 	char *db_dir;
+ 
+ 	/* Initialize the root directory. */
+ 	dpkg_fsys_set_dir(value);
+ 
+ 	/* Set the database directory based on the new root directory. */
+-	db_dir = dpkg_fsys_get_path(ADMINDIR);
++	env = getenv("DPKG_ADMINDIR");
++	if (env)
++		db_dir = dpkg_fsys_get_path(env);
++	else
++		db_dir = dpkg_fsys_get_path(ADMINDIR);
+ 	dpkg_db_set_dir(db_dir);
+ 	free(db_dir);
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index d793c26d57..20f98d5d2d 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.30.2


