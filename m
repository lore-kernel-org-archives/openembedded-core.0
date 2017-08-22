Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B0B7678294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:19:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 10:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,413,1498546800"; d="scan'208";a="127046058"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2017 10:19:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 12:20:38 -0500
Message-Id: <20170822172039.16682-1-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: jagadeesh.krishnanjanappa@caviumnetworks.com
Subject: [PATCHv2 1/2] dpkg: Upgrade to 1.18.24
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
X-List-Received-Date: Tue, 22 Aug 2017 17:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches rebased due to don't apply, no major changes,

  - 0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
  - arch_pm.patch
  - noman.patch

Patches related to move ostable/triplettable insida data/ostable and
data/tupletable instead also needs to comply the new format of the
tables for arch detection.

  - 0006-add-musleabi-to-known-target-tripets.patch
  - add_armeb_triplet_entry.patch

And finally a patch to avoid usage --clamp-mtime in tar needs to be
modified because the dpkg-deb internal API changed.

  - 0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...nux-wrs-kernel-version-which-has-characte.patch | 12 ++---
 ...0006-add-musleabi-to-known-target-tripets.patch | 57 +++++++++++-----------
 ...uild.c-Remove-usage-of-clamp-mtime-in-tar.patch | 21 ++++----
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 30 ++++++------
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch      | 19 +++++---
 meta/recipes-devtools/dpkg/dpkg/noman.patch        | 18 +++++--
 .../dpkg/{dpkg_1.18.10.bb => dpkg_1.18.24.bb}      |  6 +--
 7 files changed, 89 insertions(+), 74 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.10.bb => dpkg_1.18.24.bb} (77%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index 231a6a2909d..9fe0ca76002 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -13,13 +13,13 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 79b2908..7758aa5 100644
+index 453077fd9..f42ea2882 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -235,14 +235,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
- 
-   /* XXX: Would be faster to use something like cisversion and cisrevision. */
+@@ -243,14 +243,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
    ptr = rversion->version;
+   if (!*ptr)
+     return dpkg_put_error(err, _("version number is empty"));
 -  if (*ptr && !c_isdigit(*ptr++))
 -    return dpkg_put_warn(err, _("version number does not start with digit"));
    for (; *ptr; ptr++) {
@@ -33,6 +33,6 @@ index 79b2908..7758aa5 100644
        return dpkg_put_warn(err, _("invalid character in revision number"));
    }
  
--- 
-2.1.4
 
+-- 
+2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index a6b00880ced..d929466b702 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -6,37 +6,36 @@ Subject: [PATCH] add musleabi to known target tripets
 helps compiling dpkg for musl/arm-softfloat
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
-Upstream-Status: Pending
-
- ostable      | 1 +
- triplettable | 1 +
+ data/ostable    | 1 +
+ data/tupletable | 1 +
  2 files changed, 2 insertions(+)
 
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
+diff --git a/data/ostable b/data/ostable
+index 99c1f889d..be6434271 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -17,6 +17,7 @@
+ eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
++eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/data/tupletable b/data/tupletable
+index 5f500f6ca..28f00bfe6 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -8,6 +8,7 @@
+ eabi-uclibc-linux-arm		uclibc-linux-armel
+ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
++eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
 -- 
-2.6.4
+2.11.0
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 8bfaad14d8d..1b985df0f5b 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -23,18 +23,17 @@ Upstream-Status: Inappropriate [Configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 655aa55..927f56f 100644
+index a92b58e..a3d1912 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -447,7 +447,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-     snprintf(mtime, sizeof(mtime), "@%ld", timestamp);
+@@ -450,7 +450,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
-     execlp(TAR, "tar", "-cf", "-", "--format=gnu",
--                       "--mtime", mtime, "--clamp-mtime",
-+                       "--mtime", mtime,
-                        "--null", "--no-unquote",
-                        "--no-recursion", "-T", "-", NULL);
-     ohshite(_("unable to execute %s (%s)"), "tar -cf", TAR);
+     command_init(&cmd, TAR, "tar -cf");
+     command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
+-                           "--mtime", mtime, "--clamp-mtime", NULL);
++                           "--mtime", mtime, NULL);
+     /* Mode might become a positional argument, pass it before -T. */
+     if (mode)
+       command_add_args(&cmd, "--mode", mode, NULL);
 -- 
-2.1.4
-
+2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index dc69eb2d1cd..d165616a191 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -24,23 +24,25 @@ empty in configure script.
 Upstream-Status: Pending
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
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
+index b7802bec3..5f500f6ca 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -12,6 +12,7 @@ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
++eabi-gnu-linux-armeb		armeb
+ abin32-gnu-linux-mips64r6el	mipsn32r6el
+ abin32-gnu-linux-mips64r6	mipsn32r6
+ abin32-gnu-linux-mips64el	mipsn32el
 -- 
-2.1.4
+2.11.0
+
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index cad4c0f0a1c..4e0d22acbbf 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -7,16 +7,23 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+---
+ scripts/Dpkg/Arch.pm | 3 ---
+ 1 file changed, 3 deletions(-)
 
+diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
+index 1720847b8..6345ce3b9 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -233,9 +233,6 @@ sub read_triplettable()
- 		    (my $dt = $debtriplet) =~ s/<cpu>/$_cpu/;
+@@ -323,9 +323,6 @@ sub _load_tupletable()
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
+-- 
+2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index d30c15018a9..a7f3cb8f453 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,14 +1,22 @@
 Upstream-Status: Inappropriate [disable feature]
 
-diff -ruN dpkg-1.15.8.5-orig/Makefile.am dpkg-1.15.8.5/Makefile.am
---- dpkg-1.15.8.5-orig/Makefile.am	2010-10-08 12:27:15.042083703 +0800
-+++ dpkg-1.15.8.5/Makefile.am	2010-10-08 12:27:27.755148228 +0800
-@@ -12,8 +12,7 @@
- 	utils \
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0da52cb16..a1f79e0a2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,8 +13,7 @@ SUBDIRS = \
  	$(MAYBE_DSELECT) \
  	scripts \
+ 	t-func \
 -	po \
 -	man
 +	po
  
  ACLOCAL_AMFLAGS = -I m4
+ 
+-- 
+2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
similarity index 77%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
index 21385af8780..f06b604ebb2 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -16,5 +16,5 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-SRC_URI[md5sum] = "ccff17730c0964428fc186ded2f2f401"
-SRC_URI[sha256sum] = "025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5"
+SRC_URI[md5sum] = "02e8af8faf1e689228da806c3e8c6882"
+SRC_URI[sha256sum] = "d853081d3e06bfd46a227056e591f094e42e78fa8a5793b0093bad30b710d7b4"
-- 
2.11.0


