Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5427CBC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:47:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1M6lLDt016496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 22:47:21 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 21 Feb 2019 22:47:20 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2019 01:47:16 -0500
Message-ID: <20190222064716.191069-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] dpkg: 1.18.25 -> 1.19.4
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
X-List-Received-Date: Fri, 22 Feb 2019 06:47:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Upgrade dpkg from 1.18.25 to 1.19.4:

* update SRC_URI which DEBIAN_MIRROR
* un-export PERL which causes script scripts/dpkg-architecture.pl fails
  to get cpu type and package arch
* add configure option '--disable-update-alternatives' which causes
  installed-vs-shipped issue
* add patch for dpkg-native to resolve host tar may not support
  options --owner=NAME:ID and --group=NAME:ID
* update context of patches
* drop dpkg-configure.service that apt provides a systemd timer to do it

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc           | 25 +++--------------
 ...s-expect-D-to-be-set-when-running-in.patch | 19 ++++++++++---
 .../0005-dpkg-compiler.m4-remove-Wvla.patch   | 16 ++++++-----
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 12 ++++++---
 .../dpkg/dpkg/dpkg-configure.service          | 17 ------------
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch  | 11 +++++---
 .../dpkg/tweak-options-require-tar-1.27.patch | 27 +++++++++++++++++++
 .../dpkg/{dpkg_1.18.25.bb => dpkg_1.19.4.bb}  | 11 ++++----
 8 files changed, 77 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.25.bb => dpkg_1.19.4.bb} (73%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index fe4732d1db..fee7a75814 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -9,15 +9,8 @@ RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
-inherit autotools gettext perlnative pkgconfig systemd perl-version
+inherit autotools gettext perlnative pkgconfig perl-version
 
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN')
-        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
-}
-
-export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
 export PERL_LIBDIR = "${libdir}/perl/${@get_perl_version(d)}"
@@ -29,14 +22,14 @@ EXTRA_OECONF = "\
 		--with-libz \
 		--with-libbz2 \
 		--without-libselinux \
+		TAR=tar \
 		"
 
+EXTRA_OECONF_append_class-target = " --disable-update-alternatives DEB_HOST_ARCH=${DPKG_ARCH}"
+
 PACKAGECONFIG = "liblzma"
 PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
 
-EXTRA_OECONF += "TAR=tar"
-EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
-
 do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
@@ -45,16 +38,6 @@ do_install_append () {
 	else
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/dpkg-configure.service
-	fi
 }
 
 PROV = "virtual/update-alternatives"
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 93d870443c..b88be87490 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -10,15 +10,16 @@ Upstream-Status: Inappropriate [OE Specific]
 RP 2011/12/07
 ALIMON 2016/05/26
 ALIMON 2017/02/21
+KKang 2019/02/20
 ---
  src/script.c | 44 +++-----------------------------------------
  1 file changed, 3 insertions(+), 41 deletions(-)
 
 diff --git a/src/script.c b/src/script.c
-index 2f252ae..768a9d1 100644
+index 0865b95..73ed35d 100644
 --- a/src/script.c
 +++ b/src/script.c
-@@ -97,48 +97,10 @@ setexecute(const char *path, struct stat *stab)
+@@ -96,58 +96,11 @@ setexecute(const char *path, struct stat *stab)
  static const char *
  maintscript_pre_exec(struct command *cmd)
  {
@@ -32,6 +33,8 @@ index 2f252ae..768a9d1 100644
 -		changedir = "/";
 -
 -	if (instdirlen > 0 && !fc_script_chrootless) {
+-		int rc;
+-
 -		if (strncmp(admindir, instdir, instdirlen) != 0)
 -			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
 -		if (setenv("DPKG_ADMINDIR", admindir + instdirlen, 1) < 0)
@@ -39,7 +42,12 @@ index 2f252ae..768a9d1 100644
 -		if (setenv("DPKG_ROOT", "", 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
 -
--		if (chroot(instdir))
+-		rc = chroot(instdir);
+-		if (rc && fc_nonroot && errno == EPERM)
+-			ohshit(_("not enough privileges to change root "
+-			         "directory with --force-not-root, consider "
+-			         "using --force-script-chrootless?"));
+-		else if (rc)
 -			ohshite(_("failed to chroot to '%.250s'"), instdir);
 +	if (*instdir) {
 +		setenv("D", instdir, 1);
@@ -64,7 +72,10 @@ index 2f252ae..768a9d1 100644
 -	if (instdirlen == 0 || fc_script_chrootless)
 -		return cmd->filename;
 -
--	assert(strlen(cmd->filename) >= instdirlen);
+-	if (strlen(cmd->filename) < instdirlen)
+-		internerr("maintscript name '%s' length < instdir length %zd",
+-		          cmd->filename, instdirlen);
+ 
 -	return cmd->filename + instdirlen;
 +	return cmd->filename;
  }
diff --git a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch b/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
index 96e96f277b..b368508862 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
@@ -15,22 +15,26 @@ Upstream-Status: Pending
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Update patch context for dpkg 1.19.4.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  m4/dpkg-compiler.m4 | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
-index 682857c..23ed7d0 100644
+index a6192f6..4c7bf2e 100644
 --- a/m4/dpkg-compiler.m4
 +++ b/m4/dpkg-compiler.m4
-@@ -52,7 +52,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
-   DPKG_CHECK_COMPILER_FLAG([-Wlogical-op])
-   DPKG_CHECK_COMPILER_FLAG([-Wlogical-not-parentheses])
+@@ -67,7 +67,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
+   DPKG_CHECK_COMPILER_FLAG([-Wshift-negative-value])
+   DPKG_CHECK_COMPILER_FLAG([-Wsizeof-array-argument])
    DPKG_CHECK_COMPILER_FLAG([-Wswitch-bool])
 -  DPKG_CHECK_COMPILER_FLAG([-Wvla])
-   DPKG_CHECK_COMPILER_FLAG([-Winit-self])
    DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
-   DPKG_CHECK_COMPILER_FLAG([-Wcast-align])
+ 
+   AC_LANG_CASE(
 -- 
 2.1.4
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 1b985df0f5..4f79a40d8b 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -18,22 +18,26 @@ Upstream-Status: Inappropriate [Configuration]
 
 [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=759999#20
 [2] https://lists.gnu.org/archive/html/help-tar/2016-01/msg00000.html
+
+Update patch context for dpkg 1.19.4.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  dpkg-deb/build.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index a92b58e..a3d1912 100644
+index 68d1875..053fcb7 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -450,7 +450,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -457,7 +457,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
      command_init(&cmd, TAR, "tar -cf");
      command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
 -                           "--mtime", mtime, "--clamp-mtime", NULL);
 +                           "--mtime", mtime, NULL);
      /* Mode might become a positional argument, pass it before -T. */
-     if (mode)
-       command_add_args(&cmd, "--mode", mode, NULL);
+     if (options->mode)
+       command_add_args(&cmd, "--mode", options->mode, NULL);
 -- 
 2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service b/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
deleted file mode 100644
index 9a248ccb4a..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
+++ /dev/null
@@ -1,17 +0,0 @@
-[Unit]
-Description=dpkg first boot configure
-DefaultDependencies=no
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
-Before=sysinit.target
-
-[Service]
-Type=oneshot
-EnvironmentFile=-@SYSCONFDIR@/default/postinst
-ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/dpkg --configure -a > $LOGFILE 2>&1; else @BINDIR@/dpkg --configure -a; fi"
-ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable dpkg-configure.service
-StandardOutput=syslog
-RemainAfterExit=No
-
-[Install]
-WantedBy=basic.target
-WantedBy=sysinit.target
diff --git a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
index d48386647e..5debcc5209 100644
--- a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
@@ -66,15 +66,18 @@ Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Lei Liu <lei.liu2@windriver.com>
 
+Update patch context for dpkg 1.19.4.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  src/archives.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/archives.c b/src/archives.c
-index 4b2fc92..a92b795 100644
+index 8476a5c..b05a63f 100644
 --- a/src/archives.c
 +++ b/src/archives.c
-@@ -69,7 +69,7 @@ fd_writeback_init(int fd)
+@@ -68,7 +68,7 @@ fd_writeback_init(int fd)
    /* Ignore the return code as it should be considered equivalent to an
     * asynchronous hint for the kernel, we are doing an fsync() later on
     * anyway. */
@@ -83,14 +86,14 @@ index 4b2fc92..a92b795 100644
    sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
  #elif defined(HAVE_POSIX_FADVISE)
    posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
-@@ -1078,7 +1078,7 @@ tarobject(void *ctx, struct tar_entry *ti)
+@@ -1093,7 +1093,7 @@ tarobject(struct tar_archive *tar, struct tar_entry *ti)
    return 0;
  }
  
 -#if defined(SYNC_FILE_RANGE_WAIT_BEFORE)
 +#if defined(SYNC_FILE_RANGE_WAIT_BEFORE) && __GLIBC_PREREQ(2, 6)
  static void
- tar_writeback_barrier(struct fileinlist *files, struct pkginfo *pkg)
+ tar_writeback_barrier(struct fsys_namenode_list *files, struct pkginfo *pkg)
  {
 -- 
 2.16.2
diff --git a/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch b/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
new file mode 100644
index 0000000000..e9119918b1
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
@@ -0,0 +1,27 @@
+GNU tar >= 1.27 is required for --owner=NAME:ID and --group=NAME:ID. And fails
+to build .deb packages with error:
+
+| dpkg-deb: building package 'linux-libc-headers-dbg' in '.../tmp/work/i586-poky-linux/linux-libc-headers/4.19-r0/deploy-debs/i586/linux-libc-headers-dbg_ 4.19-r0.0_i386.deb'.
+| tar: root\:0: Invalid owner
+| tar: Error is not recoverable: exiting now
+| dpkg-deb: error: tar -cf subprocess returned error exit status 2
+
+Tweak tar options in dpkg-deb source code to make it work on old machines.
+
+Upstream-Status: Inappropriate [cross build specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
+index 68d187511..86fe22e25 100644
+--- a/dpkg-deb/build.c
++++ b/dpkg-deb/build.c
+@@ -462,7 +462,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+     if (options->mode)
+       command_add_args(&cmd, "--mode", options->mode, NULL);
+     if (options->root_owner_group)
+-      command_add_args(&cmd, "--owner", "root:0", "--group", "root:0", NULL);
++      command_add_args(&cmd, "--owner", "root", "--group", "root", NULL);
+     command_add_args(&cmd, "--null", "--no-unquote", "--no-recursion",
+                            "-T", "-", NULL);
+     command_exec(&cmd);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.25.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
similarity index 73%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.25.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index 350bd94f54..c3dbda77a4 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.25.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -1,11 +1,10 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20181228T152949Z/pool/main/d/dpkg/dpkg_1.18.25.tar.xz \
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
-           file://dpkg-configure.service \
            file://add_armeb_triplet_entry.patch \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
            file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
@@ -15,7 +14,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20181228T152949Z/pool/main/
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            "
-SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
+SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
+                                file://tweak-options-require-tar-1.27.patch \
+"
 
-SRC_URI[md5sum] = "e463f58b04acb23659df23d2a7a05cff"
-SRC_URI[sha256sum] = "c49c371953aea03f543814dcae37c069e86069333fb2e24e9252e76647663492"
+SRC_URI[md5sum] = "1e4420409426d8c58bbe13a8e07c0c0b"
+SRC_URI[sha256sum] = "c15234e98655689586bff2d517a6fdc6135d139c54d52ae9cfa6a90007fee0ae"
-- 
2.20.0


