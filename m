Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB83772E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 15:09:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 16 Dec 2016 07:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="18996059"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2016 07:09:56 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 09:11:12 -0600
Message-Id: <1481901072-25196-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] dpkg: upgrade to 1.18.15
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
X-List-Received-Date: Fri, 16 Dec 2016 15:09:55 -0000

triplets file is no longer available.
As of now using files data/tupletable and data/ostable

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 ...tinsts-expect-D-to-be-set-when-running-in.patch | 30 ++++++++--------
 ...0006-add-musleabi-to-known-target-tripets.patch | 42 ----------------------
 .../0006-add-musleabi-to-known-target-tuples.patch | 40 +++++++++++++++++++++
 ...let_entry.patch => add_armeb_tuple_entry.patch} | 27 +++++++-------
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch      | 12 +++----
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |  9 ++---
 .../dpkg/{dpkg_1.18.7.bb => dpkg_1.18.15.bb}       | 10 +++---
 7 files changed, 85 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tuples.patch
 rename meta/recipes-devtools/dpkg/dpkg/{add_armeb_triplet_entry.patch => add_armeb_tuple_entry.patch} (69%)
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.7.bb => dpkg_1.18.15.bb} (63%)

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
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
deleted file mode 100644
index a6b0088..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Dec 2015 23:05:41 +0000
-Subject: [PATCH] add musleabi to known target tripets
-
-helps compiling dpkg for musl/arm-softfloat
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- ostable      | 1 +
- triplettable | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ostable b/ostable
-index 3bb6819..d0ffdc7 100644
---- a/ostable
-+++ b/ostable
-@@ -15,6 +15,7 @@
- uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
- uclibc-linux		linux-uclibc		linux[^-]*-uclibc
- musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
-+musleabi-linux		linux-musleabi		linux[^-]*-musleabi
- musl-linux		linux-musl		linux[^-]*-musl
- gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
- gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
-diff --git a/triplettable b/triplettable
-index 1213584..70d24c1 100644
---- a/triplettable
-+++ b/triplettable
-@@ -6,6 +6,7 @@
- uclibceabi-linux-arm	uclibc-linux-armel
- uclibc-linux-<cpu>	uclibc-linux-<cpu>
- musleabihf-linux-arm	musl-linux-armhf
-+musleabi-linux-arm	musl-linux-armel
- musl-linux-<cpu>	musl-linux-<cpu>
- gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
--- 
-2.6.4
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tuples.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tuples.patch
new file mode 100644
index 0000000..ccf0ca4
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tuples.patch
@@ -0,0 +1,40 @@
+From 6be4743d9a04c27a592acdc3fd3d6f3dd6f4ae9a Mon Sep 17 00:00:00 2001
+From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+Date: Thu, 15 Dec 2016 19:29:25 -0600
+Subject: [PATCH] add musleabi to known target tripets
+
+helps compiling dpkg for musl/arm-softfloat
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ data/ostable    | 1 +
+ data/tupletable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/data/ostable b/data/ostable
+index 09007da..6be797a 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -17,6 +17,7 @@
+ eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
++eabi-musl-linux         linux-musleabi          linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/dpkg-1.18.15/data/tupletable b/dpkg-1.18.15/data/tupletable
+index 63cca14..3c215a9 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -8,6 +8,7 @@
+ eabi-uclibc-linux-arm		uclibc-linux-armel
+ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
++eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
similarity index 69%
rename from meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
rename to meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
index dc69eb2..b7d5547 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_tuple_entry.patch
@@ -24,23 +24,22 @@ empty in configure script.
 Upstream-Status: Pending
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
-
 ---
- triplettable | 1 +
+ data/tupletable | 1 +
  1 file changed, 1 insertion(+)
 
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
+diff --git a/data/tupletable b/data/tupletable
+index 2692f2d..63cca14 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -13,6 +13,7 @@ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
+ abin32-gnu-linux-mips64r6el	mipsn32r6el
+ abin32-gnu-linux-mips64r6	mipsn32r6
++eabi-gnu-linux-armeb            armeb
+ abin32-gnu-linux-mips64el	mipsn32el
+ abin32-gnu-linux-mips64		mipsn32
+ abi64-gnu-linux-mips64r6el	mips64r6el
 -- 
 2.1.4
 
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
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
similarity index 63%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
index 28fdc13..2ec9100 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.15.bb
@@ -1,19 +1,19 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://ftp.debian.org/debian/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
            file://dpkg-configure.service \
-           file://add_armeb_triplet_entry.patch \
+           file://add_armeb_tuple_entry.patch \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
            file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
            file://0005-dpkg-compiler.m4-remove-Wvla.patch \
-           file://0006-add-musleabi-to-known-target-tripets.patch \
+           file://0006-add-musleabi-to-known-target-tuples.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
-SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
+SRC_URI[md5sum] = "7aa1b61da5bff4cbc5a1d2cb5a30d546"
+SRC_URI[sha256sum] = "aee936653b9c39403160c0a331ee7934563fbfa4e1f5adbc14a289c803cda371"
-- 
2.1.4


