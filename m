Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D28E471B58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 01:43:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 15 Dec 2016 17:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,355,1477983600"; d="scan'208";a="203146798"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2016 17:43:12 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 19:44:28 -0600
Message-Id: <1481852668-23967-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] dpkg: upgrade to 1.18.15
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
X-List-Received-Date: Fri, 16 Dec 2016 01:43:12 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 ...tinsts-expect-D-to-be-set-when-running-in.patch | 30 +++++++-------
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 46 ----------------------
 .../dpkg/dpkg/add_armeb_tuple_entry.patch          | 46 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch      | 12 +++---
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |  9 +++--
 meta/recipes-devtools/dpkg/dpkg_1.18.15.bb         | 17 ++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb          | 19 ---------
 7 files changed, 90 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb

diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 80504ce..673e3f3 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -18,26 +18,31 @@ diff --git a/src/script.c b/src/script.c
 index 3c88be8..ce66a86 100644
 --- a/src/script.c
 +++ b/src/script.c
-@@ -97,43 +97,10 @@ setexecute(const char *path, struct stat *stab)
+@@ -97,48 +97,10 @@
  static const char *
  maintscript_pre_exec(struct command *cmd)
  {
 -	const char *admindir = dpkg_db_get_dir();
--	const char *changedir = fc_script_chrootless ? instdir : "/";
--	size_t instdirl = strlen(instdir);
+-	const char *changedir;
+-	size_t instdirlen = strlen(instdir);
 -
--	if (*instdir && !fc_script_chrootless) {
--		if (strncmp(admindir, instdir, instdirl) != 0)
+-	if (instdirlen > 0 && fc_script_chrootless)
+-		changedir = instdir;
+-	else
+-		changedir = "/";
+-
+-	if (instdirlen > 0 && !fc_script_chrootless) {
+-		if (strncmp(admindir, instdir, instdirlen) != 0)
 -			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
--		if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1) < 0)
+-		if (setenv("DPKG_ADMINDIR", admindir + instdirlen, 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
 -		if (setenv("DPKG_ROOT", "", 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
 -
 -		if (chroot(instdir))
 -			ohshite(_("failed to chroot to '%.250s'"), instdir);
-+	if (*instdir) {
-+		setenv("D", instdir, 1);
++       if (*instdir) {
++              setenv("D", instdir, 1);
  	}
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
@@ -56,15 +61,12 @@ index 3c88be8..ce66a86 100644
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
  
  /**
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
deleted file mode 100644
index dc69eb2..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
-Date:   Wed Apr 8 18:08:14 2015 +0530
-
-[PATCH] add armeb triplet entry into triplettable.
-
-Cross-compling dpkg application for armeb fails with below error
-during configure task,
-
-(snip)
- configure:23141: checking dpkg cpu type
- configure:23148: result: armeb
- configure:23150: WARNING: armeb not found in cputable
- configure:23162: checking dpkg operating system type
- configure:23169: result: linux-gnueabi
- configure:23171: WARNING: linux-gnueabi not found in ostable
- configure:23183: checking dpkg architecture name
- configure:23189: error: cannot determine host dpkg architecture
--- CUT --
-
-the required combination of "gnueabi-linux-armeb" was not found in
-the triplettable file thereby returning dpkg_arch as
-empty in configure script.
-
-Upstream-Status: Pending
-
-Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
-
----
- triplettable | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/triplettable b/triplettable
-index abe4726..1e9c247 100644
---- a/triplettable
-+++ b/triplettable
-@@ -11,6 +11,7 @@ gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
- gnuabin32-linux-mips64r6el	mipsn32r6el
- gnuabin32-linux-mips64r6	mipsn32r6
-+gnueabi-linux-armeb	armeb
- gnuabin32-linux-mips64el	mipsn32el
- gnuabin32-linux-mips64	mipsn32
- gnuabi64-linux-mips64r6el	mips64r6el
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
new file mode 100644
index 0000000..dc69eb2
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
@@ -0,0 +1,46 @@
+Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date:   Wed Apr 8 18:08:14 2015 +0530
+
+[PATCH] add armeb triplet entry into triplettable.
+
+Cross-compling dpkg application for armeb fails with below error
+during configure task,
+
+(snip)
+ configure:23141: checking dpkg cpu type
+ configure:23148: result: armeb
+ configure:23150: WARNING: armeb not found in cputable
+ configure:23162: checking dpkg operating system type
+ configure:23169: result: linux-gnueabi
+ configure:23171: WARNING: linux-gnueabi not found in ostable
+ configure:23183: checking dpkg architecture name
+ configure:23189: error: cannot determine host dpkg architecture
+-- CUT --
+
+the required combination of "gnueabi-linux-armeb" was not found in
+the triplettable file thereby returning dpkg_arch as
+empty in configure script.
+
+Upstream-Status: Pending
+
+Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+
+---
+ triplettable | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/triplettable b/triplettable
+index abe4726..1e9c247 100644
+--- a/triplettable
++++ b/triplettable
+@@ -11,6 +11,7 @@ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
+ gnuabin32-linux-mips64r6el	mipsn32r6el
+ gnuabin32-linux-mips64r6	mipsn32r6
++gnueabi-linux-armeb	armeb
+ gnuabin32-linux-mips64el	mipsn32el
+ gnuabin32-linux-mips64	mipsn32
+ gnuabi64-linux-mips64r6el	mips64r6el
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index cad4c0f..922df98 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -10,13 +10,13 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
 
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -233,9 +233,6 @@ sub read_triplettable()
- 		    (my $dt = $debtriplet) =~ s/<cpu>/$_cpu/;
+@@ -286,9 +286,6 @@
+ 		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
  		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
  
--		    next if exists $debarch_to_debtriplet{$da}
--		         or exists $debtriplet_to_debarch{$dt};
+-		    next if exists $debarch_to_debtuple{$da}
+-		         or exists $debtuple_to_debarch{$dt};
 -
- 		    $debarch_to_debtriplet{$da} = $dt;
- 		    $debtriplet_to_debarch{$dt} = $da;
+ 		    $debarch_to_debtuple{$da} = $dt;
+ 		    $debtuple_to_debarch{$dt} = $da;
  		}
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index d30c150..0012401 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,14 +1,15 @@
 Upstream-Status: Inappropriate [disable feature]
 
 diff -ruN dpkg-1.15.8.5-orig/Makefile.am dpkg-1.15.8.5/Makefile.am
---- dpkg-1.15.8.5-orig/Makefile.am	2010-10-08 12:27:15.042083703 +0800
-+++ dpkg-1.15.8.5/Makefile.am	2010-10-08 12:27:27.755148228 +0800
-@@ -12,8 +12,7 @@
- 	utils \
+--- dpkg-1.15.8.5-orig/Makefile.am      2010-10-08 12:27:15.042083703 +0800
++++ dpkg-1.15.8.5/Makefile.am   2010-10-08 12:27:27.755148228 +0800
+@@ -13,8 +13,7 @@
  	$(MAYBE_DSELECT) \
  	scripts \
+ 	t-func \
 -	po \
 -	man
 +	po
  
  ACLOCAL_AMFLAGS = -I m4
+ 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.15.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
new file mode 100644
index 0000000..701543d
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
@@ -0,0 +1,17 @@
+require dpkg.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "http://ftp.debian.org/debian/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+           file://noman.patch \
+           file://remove-tar-no-timestamp.patch \
+           file://arch_pm.patch \
+           file://dpkg-configure.service \
+           file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
+           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+           file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
+           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+           "
+SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
+
+SRC_URI[md5sum] = "7aa1b61da5bff4cbc5a1d2cb5a30d546"
+SRC_URI[sha256sum] = "aee936653b9c39403160c0a331ee7934563fbfa4e1f5adbc14a289c803cda371"
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
deleted file mode 100644
index 28fdc13..0000000
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require dpkg.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
-           file://noman.patch \
-           file://remove-tar-no-timestamp.patch \
-           file://arch_pm.patch \
-           file://dpkg-configure.service \
-           file://add_armeb_triplet_entry.patch \
-           file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
-           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
-           file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
-           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
-           file://0006-add-musleabi-to-known-target-tripets.patch \
-           "
-SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
-
-SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
-SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
-- 
2.1.4


