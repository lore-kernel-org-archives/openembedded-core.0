Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 459F678443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:42:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8gVOY022962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:42:32 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLmpr-0000P9-L3; Fri, 16 Jun 2017 09:42:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:42:27 +0100
Message-Id: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:42:32 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/4] meta: Remove further uclibc remnants (inc. patches and site files)
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
X-List-Received-Date: Fri, 16 Jun 2017 08:42:35 -0000

Some of these are clearly dead, e.g. one binutils patch reverts the effects
of the earlier one.

This also removes the uclibc site files. We now have mechanisms to allow these
to be extended from another layer should someone ever wish to do that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross-canadian.bbclass                |   6 +-
 meta/classes/icecc.bbclass                         |   2 +-
 meta/classes/insane.bbclass                        |  24 -----
 meta/classes/siteinfo.bbclass                      |   8 --
 meta/recipes-bsp/pciutils/pciutils/configure.patch |  12 +--
 meta/recipes-bsp/pciutils/pciutils/guess-fix.patch |  12 +--
 meta/recipes-connectivity/openssl/openssl.inc      |   3 -
 .../openssl/openssl/configure-musl-target.patch    |   4 +-
 .../openssl/openssl/configure-targets.patch        |   4 +-
 ...heck-for-additional-features-that-uclibc-.patch |  48 ---------
 ...pper-instead-of-looking-for-relative-opti.patch |  25 +++--
 ...wn-Use-execvpe-only-when-libc-supports-it.patch |  41 --------
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |  49 ----------
 meta/recipes-core/systemd/systemd_232.bb           |   3 -
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   2 -
 ...003-gprof-add-uclibc-support-to-configure.patch |  31 ------
 .../0006-Explicitly-link-with-libm-on-uclibc.patch |  52 ----------
 .../binutils/binutils/0007-Use-libtool-2.4.patch   |  12 ---
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   4 +-
 meta/recipes-devtools/gcc/libgcc.inc               |   4 +-
 .../correct_rpl_gettimeofday_signature.patch       |  68 -------------
 meta/recipes-support/gnutls/gnutls_3.5.13.bb       |   3 +-
 meta/site/arm-linux-uclibc                         | 105 --------------------
 meta/site/armeb-linux-uclibc                       |  38 --------
 meta/site/common-uclibc                            |  52 ----------
 meta/site/mips-linux-uclibc                        |  80 ---------------
 meta/site/mips64-linux-uclibc                      |  83 ----------------
 meta/site/mips64el-linux-uclibc                    | 108 ---------------------
 meta/site/mipsel-linux-uclibc                      | 100 -------------------
 meta/site/x86_64-linux-uclibc                      |  91 -----------------
 31 files changed, 24 insertions(+), 1052 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
 delete mode 100644 meta/site/arm-linux-uclibc
 delete mode 100644 meta/site/armeb-linux-uclibc
 delete mode 100644 meta/site/common-uclibc
 delete mode 100644 meta/site/mips-linux-uclibc
 delete mode 100644 meta/site/mips64-linux-uclibc
 delete mode 100644 meta/site/mips64el-linux-uclibc
 delete mode 100644 meta/site/mipsel-linux-uclibc
 delete mode 100644 meta/site/x86_64-linux-uclibc

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 49388d4..8554e87 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -15,7 +15,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
-BASECANADIANEXTRAOS ?= "linux-uclibc linux-musl"
+BASECANADIANEXTRAOS ?= "linux-musl"
 CANADIANEXTRAOS = "${BASECANADIANEXTRAOS}"
 CANADIANEXTRAVENDOR = ""
 MODIFYTOS ??= "1"
@@ -36,8 +36,6 @@ python () {
     tos = d.getVar("TARGET_OS")
     whitelist = []
     extralibcs = [""]
-    if "uclibc" in d.getVar("BASECANADIANEXTRAOS"):
-        extralibcs.append("uclibc")
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
     for variant in ["", "spe", "x32", "eabi", "n32"]:
@@ -80,7 +78,7 @@ python () {
         for extraos in d.getVar("BASECANADIANEXTRAOS").split():
             d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
     if tarch == "arm" or tarch == "armeb":
-        d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi linux-uclibceabi")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi")
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a351cf..8a3308b 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -115,7 +115,7 @@ def use_icecc(bb,d):
     # for one reason or the other
     # this is the old list (which doesn't seem to be valid anymore, because I was able to build
     # all these with icecc enabled)
-    # system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
+    # system_package_blacklist = [ "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
     # when adding new entry, please document why (how it failed) so that we can re-evaluate it later
     # e.g. when there is new version
     # building libgcc-initial with icecc fails with CPP sanity check error if host sysroot contains cross gcc built for another target tune/variant
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f6fd7c7..7444c58 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -103,23 +103,6 @@ def package_qa_get_machine_dict(d):
                         "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                       },
-            "linux-uclibc" : { 
-                        "arm" :       (  40,    97,    0,          True,          32),
-                        "armeb":      (  40,    97,    0,          False,         32),
-                        "powerpc":    (  20,     0,    0,          False,         32),
-                        "i386":       (   3,     0,    0,          True,          32),
-                        "i486":       (   3,     0,    0,          True,          32),
-                        "i586":       (   3,     0,    0,          True,          32),
-                        "i686":       (   3,     0,    0,          True,          32),
-                        "x86_64":     (  62,     0,    0,          True,          64),
-                        "mips":       (   8,     0,    0,          False,         32),
-                        "mipsel":     (   8,     0,    0,          True,          32),
-                        "mips64":     (   8,     0,    0,          False,         64),
-                        "mips64el":   (   8,     0,    0,          True,          64),
-                        "avr32":      (6317,     0,    0,          False,         32),
-                        "sh4":        (42,       0,    0,          True,          32),
-
-                      },
             "linux-musl" : { 
                         "aarch64" :   (183,    0,    0,            True,          64),
                         "aarch64_be" :(183,    0,    0,            False,         64),
@@ -151,19 +134,12 @@ def package_qa_get_machine_dict(d):
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
-            "linux-uclibceabi" : {
-                        "arm" :       (40,     0,    0,          True,          32),
-                        "armeb" :     (40,     0,    0,          False,         32),
-                      },
             "linux-gnuspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
             "linux-muslspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
-            "linux-uclibcspe" : {
-                        "powerpc":    (20,     0,    0,          False,         32),
-                      },
             "linux-gnu" :       {
                         "powerpc":    (20,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 2c33732..90ea5ba 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -62,9 +62,6 @@ def siteinfo_data(d):
         "linux-gnun32": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
-        "linux-uclibc": "common-linux common-uclibc",
-        "linux-uclibceabi": "common-linux common-uclibc",
-        "linux-uclibcspe": "common-linux common-uclibc",
         "linux-musl": "common-linux common-musl",
         "linux-musleabi": "common-linux common-musl",
         "linux-muslspe": "common-linux common-musl",
@@ -79,9 +76,7 @@ def siteinfo_data(d):
         "aarch64_be-linux-musl": "aarch64_be-linux",
         "arm-linux-gnueabi": "arm-linux",
         "arm-linux-musleabi": "arm-linux",
-        "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
-        "armeb-linux-uclibceabi": "armeb-linux-uclibc",
         "armeb-linux-musleabi": "armeb-linux",
         "mips-linux-musl": "mips-linux",
         "mipsel-linux-musl": "mipsel-linux",
@@ -93,10 +88,8 @@ def siteinfo_data(d):
         "mipsisa64r6el-linux-gnun32": "mipsisa32r6el-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
         "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
@@ -106,7 +99,6 @@ def siteinfo_data(d):
         "x86_64-darwin9": "bit-64",
         "x86_64-linux": "bit-64",
         "x86_64-linux-musl": "x86_64-linux bit-64",
-        "x86_64-linux-uclibc": "bit-64",
         "x86_64-elf": "bit-64",
         "x86_64-linux-gnu": "bit-64 x86_64-linux",
         "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index 66c9f91..c87b350 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -80,7 +80,7 @@ diff -r af2b10cc3c14 lib/configure
  fi
  [ -n "$RELEASE" ] && rel="${RELEASE}"
  # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise harmless.
-@@ -49,6 +53,21 @@
+@@ -49,6 +53,11 @@
  sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
  echo " $host $rel $cpu $sys"
  
@@ -89,16 +89,6 @@ diff -r af2b10cc3c14 lib/configure
 +	sys=linux
 +fi
 +
-+if [ "$host" = "linux--uclibc" ]
-+then
-+	sys=linux
-+fi
-+
-+if [ "$host" = "linux--uclibceabi" ]
-+then
-+	sys=linux
-+fi
-+
  c=config.h
  m=config.mk
  echo >$c '#define PCI_CONFIG_H'
diff --git a/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
index 540b4a0..f918e3b 100644
--- a/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
@@ -13,7 +13,7 @@ diff --git a/lib/configure b/lib/configure
 index 4318b05..84f6acb 100755
 --- a/lib/configure
 +++ b/lib/configure
-@@ -53,20 +53,7 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
+@@ -53,10 +53,7 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
  sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
  echo " $host $rel $cpu $sys"
  
@@ -21,16 +21,6 @@ index 4318b05..84f6acb 100755
 -then
 -	sys=linux
 -fi
--
--if [ "$host" = "linux--uclibc" ]
--then
--	sys=linux
--fi
--
--if [ "$host" = "linux--uclibceabi" ]
--then
--	sys=linux
--fi
 +{ echo "$host" | grep linux; } && sys=linux
  
  c=config.h
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 8f2a797..3980ec2 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -64,10 +64,7 @@ do_configure () {
 
 	os=${HOST_OS}
 	case $os in
-	linux-uclibc |\
-	linux-uclibceabi |\
 	linux-gnueabi |\
-	linux-uclibcspe |\
 	linux-gnuspe |\
 	linux-musl*)
 		os=linux
diff --git a/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
index 613dc7b..f357b3f 100644
--- a/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
+++ b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
@@ -16,10 +16,8 @@ Index: openssl-1.0.2a/Configure
  "linux-aarch64","gcc: -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${aarch64_asm}:linux64:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  # Configure script adds minimally required -march for assembly support,
  # if no -march was specified at command line. mips32 and mips64 below
-@@ -504,6 +504,8 @@ my %table=(
+@@ -504,4 +504,6 @@ my %table=(
  "linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-musleabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-musleabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  
diff --git a/meta/recipes-connectivity/openssl/openssl/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
index 691e74a..1e01589 100644
--- a/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
@@ -11,7 +11,7 @@ Index: openssl-1.0.2a/Configure
 ===================================================================
 --- openssl-1.0.2a.orig/Configure
 +++ openssl-1.0.2a/Configure
-@@ -443,6 +443,23 @@ my %table=(
+@@ -443,6 +443,21 @@ my %table=(
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -21,8 +21,6 @@ Index: openssl-1.0.2a/Configure
 +"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
diff --git a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
deleted file mode 100644
index 43a0d3f..0000000
--- a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 82d837b76618a773485b96e38b7b91083a7437e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:05:45 +0000
-Subject: [PATCH 06/19] configure: Check for additional features that uclibc
- doesnt support
-
-This helps in supporting uclibc which does not have all features that
-glibc might have
-
-Upstream-Status: Denied [no desire for uclibc support]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 7f6b3b9..7c4b5a2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
- 
- AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
- 
-+# check for few functions not implemented in uClibc
-+
-+AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
-+
-+# check for %ms format support - assume always no if cross compiling
-+
-+AC_MSG_CHECKING([whether %ms format is supported by *scanf])
-+
-+AC_LINK_IFELSE(
-+	[AC_LANG_PROGRAM([
-+	 #include <stdio.h>
-+	 ],[
-+	    char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
-+	    int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
-+	    return (rc==3)?0:1;])],
-+	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by *scanf.])],
-+	[AC_MSG_RESULT([no])])
-+
- M4_DEFINES=
- 
- AC_CHECK_TOOL(OBJCOPY, objcopy)
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
index fad69a5..bc92db7 100644
--- a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 2 --
  2 files changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index 29ed1dd..02f4017 100644
---- a/Makefile.am
-+++ b/Makefile.am
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
 @@ -320,7 +320,7 @@ define install-relative-aliases
  	while [ -n "$$1" ]; do \
  		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
@@ -25,19 +25,16 @@ index 29ed1dd..02f4017 100644
  		shift 2 || exit $$?; \
  	done
  endef
-diff --git a/configure.ac b/configure.ac
-index 7c4b5a2..b10c952 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -108,8 +108,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr
  AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
  AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
  
 -AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
 -
- # check for few functions not implemented in uClibc
+ M4_DEFINES=
  
- AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
--- 
-2.10.2
-
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
diff --git a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
deleted file mode 100644
index 586b5aa..0000000
--- a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 96026a3763264eb41a2c3e374f232f6e543284a8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:33:49 -0800
-Subject: [PATCH 08/19] nspawn: Use execvpe only when libc supports it
-
-Upstream-Status: Denied [no desire for uclibc support]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nspawn/nspawn.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 9b9ae90..19b47cd 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -123,6 +123,8 @@ typedef enum LinkJournal {
-         LINK_GUEST
- } LinkJournal;
- 
-+#include "config.h"
-+
- static char *arg_directory = NULL;
- static char *arg_template = NULL;
- static char *arg_chdir = NULL;
-@@ -2871,7 +2873,12 @@ static int inner_child(
-                 a[0] = (char*) "/sbin/init";
-                 execve(a[0], a, env_use);
-         } else if (!strv_isempty(arg_parameters))
-+#ifdef HAVE_EXECVPE
-                 execvpe(arg_parameters[0], arg_parameters, env_use);
-+#else
-+                environ = env_use;
-+                execvp(arg_parameters[0], arg_parameters);
-+#endif /* HAVE_EXECVPE */
-         else {
-                 if (!arg_chdir)
-                         /* If we cannot change the directory, we'll end up in /, that is expected. */
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
deleted file mode 100644
index f150bb0..0000000
--- a/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 085c8b6f253726ad547e7be84ff3f2b99701488b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:38:07 -0800
-Subject: [PATCH 09/19] util: bypass unimplemented _SC_PHYS_PAGES system
- configuration API on uclibc
-
-Upstream-Status: Inappropriate [uclibc-specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/util.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/basic/util.c b/src/basic/util.c
-index c1b5ca1..4c62d43 100644
---- a/src/basic/util.c
-+++ b/src/basic/util.c
-@@ -742,6 +742,20 @@ uint64_t physical_memory(void) {
-          * In order to support containers nicely that have a configured memory limit we'll take the minimum of the
-          * physically reported amount of memory and the limit configured for the root cgroup, if there is any. */
- 
-+#ifdef __UCLIBC__
-+        char line[128];
-+        FILE *f = fopen("/proc/meminfo", "r");
-+        if (f == NULL)
-+                return 0;
-+        while (!feof(f) && fgets(line, sizeof(line)-1, f)) {
-+                if (sscanf(line, "MemTotal: %li kB", &mem) == 1) {
-+                        mem *= 1024;
-+                        break;
-+                }
-+        }
-+        fclose(f);
-+        return (uint64_t) mem;
-+#else
-         sc = sysconf(_SC_PHYS_PAGES);
-         assert(sc > 0);
- 
-@@ -762,6 +776,7 @@ uint64_t physical_memory(void) {
-         lim *= ps;
- 
-         return MIN(mem, lim);
-+#endif
- }
- 
- uint64_t physical_memory_scale(uint64_t v, uint64_t max) {
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index a6e6401..d54e927 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -18,10 +18,7 @@ SRC_URI += " \
            file://0003-define-exp10-if-missing.patch \
            file://0004-Use-getenv-when-secure-versions-are-not-available.patch \
            file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0006-configure-Check-for-additional-features-that-uclibc-.patch \
            file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
-           file://0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
-           file://0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
            file://0010-implment-systemd-sysv-install-for-OE.patch \
            file://0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
            file://0012-rules-whitelist-hd-devices.patch \
diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index b37bb0e..47bfa1a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -21,10 +21,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
-     file://0003-gprof-add-uclibc-support-to-configure.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-     file://0006-Explicitly-link-with-libm-on-uclibc.patch \
      file://0007-Use-libtool-2.4.patch \
      file://0008-Add-the-armv5e-architecture-to-binutils.patch \
      file://0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch b/meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
deleted file mode 100644
index eddb42b..0000000
--- a/meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7893d2b24d0303bda3a0049846489619ffd1387b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 03/15] gprof: add uclibc support to configure
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gprof/configure | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gprof/configure b/gprof/configure
-index 9e6b8f3525..38a4c0b0e5 100755
---- a/gprof/configure
-+++ b/gprof/configure
-@@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd*)
-   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch b/meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
deleted file mode 100644
index 9770ca7..0000000
--- a/meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6a46bf151d7e53df8b5e7645a2d241967688368a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:32:49 +0000
-Subject: [PATCH 06/15] Explicitly link with libm on uclibc
-
-Description:
-
-We do not need to have the libtool patch anymore for binutils after
-libtool has been updated upstream it include support for it. However
-for building gas natively on uclibc systems we have to link it with
--lm so that it picks up missing symbols.
-
-/local/build_area/BUILD/arm_v5t_le_uclibc/binutils-2.17.50/objdir/libiberty/pic/libiberty.a(floatformat.o):
-In function `floatformat_from_double':
-floatformat.c:(.text+0x1ec): undefined reference to `frexp'
-floatformat.c:(.text+0x2f8): undefined reference to `ldexp'
-/local/build_area/BUILD/arm_v5t_le_uclibc/binutils-2.17.50/objdir/libiberty/pic/libiberty.a(floatformat.o):
-In function `floatformat_to_double':
-floatformat.c:(.text+0x38a): undefined reference to `ldexp'
-floatformat.c:(.text+0x3d2): undefined reference to `ldexp'
-floatformat.c:(.text+0x43e): undefined reference to `ldexp'
-floatformat.c:(.text+0x4e2): undefined reference to `ldexp'
-collect2: ld returned 1 exit status
-make[4]: *** [as-new] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gas/configure.tgt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/gas/configure.tgt b/gas/configure.tgt
-index 711d537e95..7cd2dc176a 100644
---- a/gas/configure.tgt
-+++ b/gas/configure.tgt
-@@ -494,6 +494,12 @@ case ${generic_target} in
-   *-*-netware)				fmt=elf em=netware ;;
- esac
- 
-+case ${generic_target} in
-+  arm-*-*uclibc*)
-+    need_libm=yes
-+    ;;
-+esac
-+
- case ${cpu_type} in
-   aarch64 | alpha | arm | i386 | ia64 | microblaze | mips | ns32k | or1k | or1knd | pdp11 | ppc | riscv | sparc | z80 | z8k)
-     bfd_gas=yes
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
index 6b7f753..4f0ef10 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
@@ -5894,18 +5894,6 @@ index 38a4c0b0e5..38d1f699c7 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5874,11 +5960,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
--linux-uclibc*)
--  lt_cv_deplibs_check_method=pass_all
--  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
--  ;;
--
- netbsd*)
-   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 @@ -5956,6 +6037,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 18dc3a6..3d484ef 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -41,7 +41,7 @@ def get_gcc_ppc_plt_settings(bb, d):
     return ""
 
 def get_long_double_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'uclibc', 'glibc' ]:
+    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'glibc' ]:
         return "--with-long-double-128"
     else:
         return "--without-long-double-128"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 8430ae0..ee08529 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -101,8 +101,8 @@ do_install_append_class-target () {
 
 	if [ "${TCLIBC}" != "glibc" ]; then
 		case "${TARGET_OS}" in
-			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
-			"linux-musleabi" | "linux-uclibceabi") extra_target_os="linux-gnueabi";;
+			"linux-musl" | "linux-*spe") extra_target_os="linux";;
+			"linux-musleabi") extra_target_os="linux-gnueabi";;
 			*) extra_target_os="linux";;
 		esac
 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 38d1643..1500fb5 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -5,8 +5,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 do_install_append_class-target () {
 	if [ "${TCLIBC}" != "glibc" ]; then
 		case "${TARGET_OS}" in
-			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
-			"linux-musleabi" | "linux-uclibceabi") extra_target_os="linux-gnueabi";;
+			"linux-musl" | "linux-*spe") extra_target_os="linux";;
+			"linux-musleabi") extra_target_os="linux-gnueabi";;
 			*) extra_target_os="linux";;
 		esac
 		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
diff --git a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
deleted file mode 100644
index 96b023a..0000000
--- a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 81b0f04c14f673b99778d2e7d8e85461e0bf2018 Mon Sep 17 00:00:00 2001
-From: Valentin Popa <valentin.popa@intel.com>
-Date: Fri, 25 Apr 2014 13:58:55 +0300
-Subject: [PATCH 1/3] Correct rpl_gettimeofday signature
-
-Currently we fail on uclibc like below
-
-| In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/ucontext.h:26,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/signal.h:392,
-|                  from ../../gl/signal.h:52,
-|                  from ../../gl/sys/select.h:58,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/types.h:220,
-|                  from ../../gl/sys/types.h:28,
-|                  from ../../lib/includes/gnutls/gnutls.h:46,
-|                  from ex-cxx.cpp:3:
-| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* restrict'
-| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declaration as 'timeval* restrict'
-| make[4]: *** [ex-cxx.o] Error 1
-| make[4]: *** Waiting for unfinished jobs....
-
-GCC detects that we call 'restrict' as param name in function
-signatures and complains since both params are called 'restrict'
-therefore we use __restrict to denote the C99 keywork
-
-This only happens of uclibc since this code is not excercised with
-eglibc otherwise we will have same issue there too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
----
- gl/sys_time.in.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gl/sys_time.in.h b/gl/sys_time.in.h
-index 5a8caf3..2dc5718 100644
---- a/gl/sys_time.in.h
-+++ b/gl/sys_time.in.h
-@@ -93,20 +93,20 @@ struct timeval
- #   define gettimeofday rpl_gettimeofday
- #  endif
- _GL_FUNCDECL_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- _GL_CXXALIAS_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict));
-+                  (struct timeval *__restrict, void *__restrict));
- # else
- #  if !@HAVE_GETTIMEOFDAY@
- _GL_FUNCDECL_SYS (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- #  endif
- /* Need to cast, because on glibc systems, by default, the second argument is
-                                                   struct timezone *.  */
- _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
--                       (struct timeval *restrict, void *restrict));
-+                       (struct timeval *__restrict, void *__restrict));
- # endif
- _GL_CXXALIASWARN (gettimeofday);
- # if defined __cplusplus && defined GNULIB_NAMESPACE
--- 
-2.10.2
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.13.bb b/meta/recipes-support/gnutls/gnutls_3.5.13.bb
index 1115500..35d7d09 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.13.bb
@@ -1,7 +1,6 @@
 require gnutls.inc
 
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-            file://0001-configure.ac-fix-sed-command.patch \
+SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
diff --git a/meta/site/arm-linux-uclibc b/meta/site/arm-linux-uclibc
deleted file mode 100644
index 6ae7c6e..0000000
--- a/meta/site/arm-linux-uclibc
+++ /dev/null
@@ -1,105 +0,0 @@
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-
-# samba
-samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=${samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=yes}
-samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=${samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=no}
-samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_LINUX_SENDFILE=${samba_cv_HAVE_BROKEN_LINUX_SENDFILE=yes}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_DQB_FSOFTLIMIT=${samba_cv_HAVE_DQB_FSOFTLIMIT=no}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_FUNCTION_MACRO=${samba_cv_HAVE_FUNCTION_MACRO=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_INT16_FROM_RPC_RPC_H=${samba_cv_HAVE_INT16_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_INT32_FROM_RPC_RPC_H=${samba_cv_HAVE_INT32_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_NATIVE_ICONV=${samba_cv_HAVE_NATIVE_ICONV=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
-samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=${samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=no}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=no}
-samba_cv_HAVE_SOCK_SIN_LEN=${samba_cv_HAVE_SOCK_SIN_LEN=no}
-samba_cv_HAVE_STAT_ST_BLKSIZE=${samba_cv_HAVE_STAT_ST_BLKSIZE=yes}
-samba_cv_HAVE_STAT_ST_BLOCKS=${samba_cv_HAVE_STAT_ST_BLOCKS=yes}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=no}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_STRUCT_IF_DQBLK=${samba_cv_HAVE_STRUCT_IF_DQBLK=no}
-samba_cv_HAVE_STRUCT_MEM_DQBLK=${samba_cv_HAVE_STRUCT_MEM_DQBLK=no}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=yes}
-samba_cv_HAVE_UTIMBUF=${samba_cv_HAVE_UTIMBUF=yes}
-samba_cv_HAVE_UT_UT_ADDR=${samba_cv_HAVE_UT_UT_ADDR=yes}
-samba_cv_HAVE_UT_UT_EXIT=${samba_cv_HAVE_UT_UT_EXIT=yes}
-samba_cv_HAVE_UT_UT_HOST=${samba_cv_HAVE_UT_UT_HOST=yes}
-samba_cv_HAVE_UT_UT_ID=${samba_cv_HAVE_UT_UT_ID=yes}
-samba_cv_HAVE_UT_UT_NAME=${samba_cv_HAVE_UT_UT_NAME=yes}
-samba_cv_HAVE_UT_UT_PID=${samba_cv_HAVE_UT_UT_PID=yes}
-samba_cv_HAVE_UT_UT_TIME=${samba_cv_HAVE_UT_UT_TIME=yes}
-samba_cv_HAVE_UT_UT_TV=${samba_cv_HAVE_UT_UT_TV=yes}
-samba_cv_HAVE_UT_UT_TYPE=${samba_cv_HAVE_UT_UT_TYPE=yes}
-samba_cv_HAVE_UT_UT_USER=${samba_cv_HAVE_UT_UT_USER=yes}
-samba_cv_HAVE_UX_UT_SYSLEN=${samba_cv_HAVE_UX_UT_SYSLEN=no}
-samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_PUTUTLINE_RETURNS_UTMP=${samba_cv_PUTUTLINE_RETURNS_UTMP=yes}
-samba_cv_QUOTA_WORKS=${samba_cv_QUOTA_WORKS=yes}
-samba_cv_REPLACE_GETPASS=${samba_cv_REPLACE_GETPASS=yes}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_RUN_QUOTA_TESTS=${samba_cv_RUN_QUOTA_TESTS=auto}
-samba_cv_SEEKDIR_RETURNS_VOID=${samba_cv_SEEKDIR_RETURNS_VOID=yes}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_TRY_QUOTAS=${samba_cv_TRY_QUOTAS=no}
-samba_cv_TRY_SYS_QUOTAS=${samba_cv_TRY_SYS_QUOTAS=no}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_WITH_QUOTAS=${samba_cv_WITH_QUOTAS=auto}
-samba_cv_WITH_SYS_QUOTAS=${samba_cv_WITH_SYS_QUOTAS=auto}
-samba_cv_compiler_supports_ll=${samba_cv_compiler_supports_ll=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_immediate_structures=${samba_cv_immediate_structures=yes}
-samba_cv_optimize_out_funcation_calls=${samba_cv_optimize_out_funcation_calls=yes}
-samba_cv_sig_atomic_t=${samba_cv_sig_atomic_t=yes}
-samba_cv_socklen_t=${samba_cv_socklen_t=yes}
-samba_cv_unixsocket=${samba_cv_unixsocket=yes}
-samba_cv_volatile=${samba_cv_volatile=yes}
diff --git a/meta/site/armeb-linux-uclibc b/meta/site/armeb-linux-uclibc
deleted file mode 100644
index 731e857..0000000
--- a/meta/site/armeb-linux-uclibc
+++ /dev/null
@@ -1,38 +0,0 @@
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
-ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
-ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
-
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
-samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
deleted file mode 100644
index 26fc103..0000000
--- a/meta/site/common-uclibc
+++ /dev/null
@@ -1,52 +0,0 @@
-# general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-
-# glib
-glib_cv_strlcpy=${glib_cv_strlcpy=no}
-ac_cv_func_printf_unix98=${ac_cv_func_printf_unix98=yes}
-ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
-ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
-glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
-
-#dbus-glib
-ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-
-# bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
-
-# coreutils
-fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
-gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
-gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
-gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
-ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
-ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
-
-# va_copy and _va_copy
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
-ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
-
-# posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# Xorg
-xorg_cv_malloc0_returns_null=${xorg_cv_malloc0_returns_null=yes}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
deleted file mode 100644
index b23363e..0000000
--- a/meta/site/mips-linux-uclibc
+++ /dev/null
@@ -1,80 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips64-linux-uclibc b/meta/site/mips64-linux-uclibc
deleted file mode 100644
index cbba552..0000000
--- a/meta/site/mips64-linux-uclibc
+++ /dev/null
@@ -1,83 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips64el-linux-uclibc b/meta/site/mips64el-linux-uclibc
deleted file mode 100644
index 6a0499d..0000000
--- a/meta/site/mips64el-linux-uclibc
+++ /dev/null
@@ -1,108 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-# from samba 3.0.14a on 5/29/2005
-ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
-ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
-ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
-ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
-samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
-# This cached value needs a local patch to pick it up, upstream 3.0.14a
-# doesn't cache it.
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
deleted file mode 100644
index f921cda..0000000
--- a/meta/site/mipsel-linux-uclibc
+++ /dev/null
@@ -1,100 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-# from samba 3.0.14a on 5/29/2005
-ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
-ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
-ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
-ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
-samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
-# This cached value needs a local patch to pick it up, upstream 3.0.14a
-# doesn't cache it.
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
deleted file mode 100644
index 2d269f7..0000000
--- a/meta/site/x86_64-linux-uclibc
+++ /dev/null
@@ -1,91 +0,0 @@
-# general
-ac_cv_va_val_copy=${ac_cv_va_val_copy=no}
-ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
-ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
-ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
-ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_need_trio=${ac_cv_need_trio=no}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
-ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=40}
-glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
-glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=8}
-glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=8}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=8}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
-glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
-glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
-nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
-samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
-screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
-screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
-screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
-screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
-screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
-screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
-screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
-screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# glib-2.0
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=4
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=8
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# lftp
-lftp_cv_va_val_copy=${lftp_cv_va_val_copy=no}
-
-# slrn
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=no}
-- 
2.7.4


