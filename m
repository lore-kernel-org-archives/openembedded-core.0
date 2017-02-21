Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A58072FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:31:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 10:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132982308"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 10:31:29 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 12:34:52 -0600
Message-Id: <1487702092-9174-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487702092-9174-1-git-send-email-anibal.limon@linux.intel.com>
References: <1487702092-9174-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dpkg: Upgrade to 1.18.10
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
X-List-Received-Date: Tue, 21 Feb 2017 18:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a patch to don't use --clamp-time when call tar because
isn't supported in tar hosts versions. See
0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
patch for details.

Rebased patch:

-  0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc                |  6 ++--
 ...tinsts-expect-D-to-be-set-when-running-in.patch | 31 ++++++++++-------
 ...uild.c-Remove-usage-of-clamp-mtime-in-tar.patch | 40 ++++++++++++++++++++++
 .../dpkg/{dpkg_1.18.7.bb => dpkg_1.18.10.bb}       |  7 ++--
 4 files changed, 65 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.7.bb => dpkg_1.18.10.bb} (69%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index ff88318..bd1fc9e 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -26,10 +26,10 @@ PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
 EXTRA_OECONF = "\
 		--disable-dselect \
 		--enable-start-stop-daemon \
-		--with-zlib \
-		--with-bz2 \
+		--with-libz \
+		--with-libbz2 \
 		--without-liblzma \
-		--without-selinux \
+		--without-libselinux \
 		"
 
 EXTRA_OECONF += "TAR=tar"
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 80504ce..93d8704 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -9,27 +9,32 @@ Upstream-Status: Inappropriate [OE Specific]
 
 RP 2011/12/07
 ALIMON 2016/05/26
-
+ALIMON 2017/02/21
 ---
- src/script.c | 39 +++------------------------------------
- 1 file changed, 3 insertions(+), 36 deletions(-)
+ src/script.c | 44 +++-----------------------------------------
+ 1 file changed, 3 insertions(+), 41 deletions(-)
 
 diff --git a/src/script.c b/src/script.c
-index 3c88be8..ce66a86 100644
+index 2f252ae..768a9d1 100644
 --- a/src/script.c
 +++ b/src/script.c
-@@ -97,43 +97,10 @@ setexecute(const char *path, struct stat *stab)
+@@ -97,48 +97,10 @@ setexecute(const char *path, struct stat *stab)
  static const char *
  maintscript_pre_exec(struct command *cmd)
  {
 -	const char *admindir = dpkg_db_get_dir();
--	const char *changedir = fc_script_chrootless ? instdir : "/";
--	size_t instdirl = strlen(instdir);
+-	const char *changedir;
+-	size_t instdirlen = strlen(instdir);
+-
+-	if (instdirlen > 0 && fc_script_chrootless)
+-		changedir = instdir;
+-	else
+-		changedir = "/";
 -
--	if (*instdir && !fc_script_chrootless) {
--		if (strncmp(admindir, instdir, instdirl) != 0)
+-	if (instdirlen > 0 && !fc_script_chrootless) {
+-		if (strncmp(admindir, instdir, instdirlen) != 0)
 -			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
--		if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1) < 0)
+-		if (setenv("DPKG_ADMINDIR", admindir + instdirlen, 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
 -		if (setenv("DPKG_ROOT", "", 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
@@ -56,11 +61,11 @@ index 3c88be8..ce66a86 100644
 -		      args.buf);
 -		varbuf_destroy(&args);
 -	}
--	if (!instdirl || fc_script_chrootless)
+-	if (instdirlen == 0 || fc_script_chrootless)
 -		return cmd->filename;
 -
--	assert(strlen(cmd->filename) >= instdirl);
--	return cmd->filename + instdirl;
+-	assert(strlen(cmd->filename) >= instdirlen);
+-	return cmd->filename + instdirlen;
 +	return cmd->filename;
  }
  
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
new file mode 100644
index 0000000..8bfaad1
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -0,0 +1,40 @@
+From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Tue, 21 Feb 2017 11:23:27 -0600
+Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recently dpkg added --clamp-mtime to tar to create reproducible
+build tarballs [1].
+
+But host tools doesn't support this option because is new on tar
+so disable in our builds.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-Status: Inappropriate [Configuration]
+
+[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=759999#20
+[2] https://lists.gnu.org/archive/html/help-tar/2016-01/msg00000.html
+---
+ dpkg-deb/build.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
+index 655aa55..927f56f 100644
+--- a/dpkg-deb/build.c
++++ b/dpkg-deb/build.c
+@@ -447,7 +447,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+     snprintf(mtime, sizeof(mtime), "@%ld", timestamp);
+ 
+     execlp(TAR, "tar", "-cf", "-", "--format=gnu",
+-                       "--mtime", mtime, "--clamp-mtime",
++                       "--mtime", mtime,
+                        "--null", "--no-unquote",
+                        "--no-recursion", "-T", "-", NULL);
+     ohshite(_("unable to execute %s (%s)"), "tar -cf", TAR);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
similarity index 69%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
index 28fdc13..21385af 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -12,8 +12,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
            file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
+           file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
-SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
+SRC_URI[md5sum] = "ccff17730c0964428fc186ded2f2f401"
+SRC_URI[sha256sum] = "025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5"
-- 
2.1.4


