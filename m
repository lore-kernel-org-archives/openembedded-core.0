Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPFXJ-0002MR-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 19:07:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2013 09:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="319207779"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2013 09:47:27 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 19:47:36 +0300
Message-Id: <1365439656-29802-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssl: Upgrade to v1.0.1e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 17:07:22 -0000

Dropped obolete patches and pulled updates for debian patches

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../configure-targets.patch                        |   20 +-
 .../debian/c_rehash-compat.patch                   |   14 +-
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |   96 +++++----
 .../debian/make-targets.patch                      |   12 +-
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |  217 +++++++-------------
 .../debian/version-script.patch                    |  207 ++++++++++++++++---
 .../engines-install-in-libdir-ssl.patch            |    0
 .../{openssl-1.0.0j => openssl-1.0.1e}/find.pl     |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |   38 ++--
 .../shared-libs.patch                              |   33 ++-
 .../{openssl_1.0.0j.bb => openssl_1.0.1e.bb}       |    6 +-
 18 files changed, 369 insertions(+), 274 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/configure-targets.patch (63%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/c_rehash-compat.patch (80%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/debian-targets.patch (10%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/make-targets.patch (51%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/pic.patch (37%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/debian/version-script.patch (95%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/openssl_fix_for_x32.patch (70%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1e}/shared-libs.patch (57%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0j.bb => openssl_1.0.1e.bb} (89%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
similarity index 63%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
index e273ab4..8c638b4 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
@@ -7,11 +7,11 @@ The number of colons are important :)
  Configure |   17 +++++++++++++++++
  1 file changed, 17 insertions(+)
 
---- openssl-1.0.0j.orig/Configure
-+++ openssl-1.0.0j/Configure
-@@ -378,10 +378,27 @@ my %table=(
- "linux-alpha-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-alpha+bwx-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+Index: openssl-1.0.1e/Configure
+===================================================================
+--- openssl-1.0.1e.orig/Configure
++++ openssl-1.0.1e/Configure
+@@ -403,6 +403,23 @@ my %table=(
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -22,7 +22,7 @@ The number of colons are important :)
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-aarch64","$ENV{'CC'}:-DL_ENDIAN 	-DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-aarch64","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
@@ -32,8 +32,6 @@ The number of colons are important :)
 +"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
- #### *BSD [do see comment about ${BSDthreads} above!]
- "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "debug-BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wall -g::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ # Android: linux-* but without -DTERMIO and pointers to headers and libs.
+ "android","gcc:-mandroid -I\$(ANDROID_DEV)/include -B\$(ANDROID_DEV)/lib -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "android-x86","gcc:-mandroid -I\$(ANDROID_DEV)/include -B\$(ANDROID_DEV)/lib -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:".eval{my $asm=${x86_elf_asm};$asm=~s/:elf/:android/;$asm}.":dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/c_rehash-compat.patch
similarity index 80%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/c_rehash-compat.patch
index 8f9a034..ac1b19b 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/c_rehash-compat.patch
@@ -9,19 +9,19 @@ Subject: [PATCH] also create old hash for compatibility
  tools/c_rehash.in |    8 +++++++-
  1 files changed, 7 insertions(+), 1 deletions(-)
 
-Index: openssl-1.0.0c/tools/c_rehash.in
+Index: openssl-1.0.0d/tools/c_rehash.in
 ===================================================================
---- openssl-1.0.0c.orig/tools/c_rehash.in	2010-04-14 16:07:28.000000000 -0700
-+++ openssl-1.0.0c/tools/c_rehash.in	2011-08-12 23:06:41.976664773 -0700
-@@ -83,6 +83,7 @@
- 			next;
+--- openssl-1.0.0d.orig/tools/c_rehash.in	2011-04-13 20:41:28.000000000 +0000
++++ openssl-1.0.0d/tools/c_rehash.in	2011-04-13 20:41:28.000000000 +0000
+@@ -86,6 +86,7 @@
+ 			}
  		}
  		link_hash_cert($fname) if($cert);
 +		link_hash_cert_old($fname) if($cert);
  		link_hash_crl($fname) if($crl);
  	}
  }
-@@ -116,8 +117,9 @@
+@@ -119,8 +120,9 @@
  
  sub link_hash_cert {
  		my $fname = $_[0];
@@ -32,7 +32,7 @@ Index: openssl-1.0.0c/tools/c_rehash.in
  		chomp $hash;
  		chomp $fprint;
  		$fprint =~ s/^.*=//;
-@@ -147,6 +149,10 @@
+@@ -150,6 +152,10 @@
  		$hashlist{$hash} = $fprint;
  }
  
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/debian-targets.patch
similarity index 10%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/debian-targets.patch
index 9feae38..8101edf 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/debian-targets.patch
@@ -1,53 +1,65 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.0c/Configure
+Index: openssl-1.0.1/Configure
 ===================================================================
---- openssl-1.0.0c.orig/Configure	2010-12-12 17:27:02.000000000 +0100
-+++ openssl-1.0.0c/Configure	2010-12-12 17:34:47.000000000 +0100
-@@ -331,6 +331,47 @@
+--- openssl-1.0.1.orig/Configure	2012-03-17 15:37:54.000000000 +0000
++++ openssl-1.0.1/Configure	2012-03-17 16:13:49.000000000 +0000
+@@ -105,6 +105,10 @@
+ 
+ my $gcc_devteam_warn = "-Wall -pedantic -DPEDANTIC -Wno-long-long -Wsign-compare -Wmissing-prototypes -Wshadow -Wformat -Werror -DCRYPTO_MDEBUG_ALL -DCRYPTO_MDEBUG_ABORT -DREF_CHECK -DOPENSSL_NO_DEPRECATED";
+ 
++# There are no separate CFLAGS/CPPFLAGS/LDFLAGS, set everything in CFLAGS
++my $debian_cflags = `dpkg-buildflags --get CFLAGS` . `dpkg-buildflags --get CPPFLAGS` . `dpkg-buildflags --get LDFLAGS` . "-Wa,--noexecstack -Wall";
++$debian_cflags =~ s/\n/ /g;
++
+ my $strict_warnings = 0;
+ 
+ my $x86_gcc_des="DES_PTR DES_RISC1 DES_UNROLL";
+@@ -338,6 +342,48 @@
  "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
  "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
  
 +# Debian GNU/* (various architectures)
-+"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev4 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev5 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armhf","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::",
-+"debian-avr32", "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-frame-pointer -g -Wall::-D_REENTRANT::-ldl:BN_LLONG_BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -march=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-alpha","gcc:-DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-alpha-ev4","gcc:-DTERMIO ${debian_cflags} -mcpu=ev4::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-alpha-ev5","gcc:-DTERMIO ${debian_cflags} -mcpu=ev5::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-armeb","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-armel","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-armhf","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO ${debian_cflags} -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::",
++"debian-avr32", "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -fomit-frame-pointer::-D_REENTRANT::-ldl:BN_LLONG_BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS ${debian_cflags} -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -march=i486::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-hppa","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mtune=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_UNROLL DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i486","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i486 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i586 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i686 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}:linux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-powerpcspe","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}:linux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc64_asm}:linux64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
-+"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=v8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv8_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v9 -Wa,--noexecstack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-ia64","gcc:-DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_UNROLL DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i486","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags} -march=i486::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags} -march=i586::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags} -march=i686::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-m68k","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags}::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags} -mv8::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-alpha","gcc:-DTERMIOS ${debian_cflags}::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-mips","gcc:-DL_ENDIAN ${debian_cflags}::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}:linux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-powerpcspe","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}:linux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc64_asm}:linux64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-s390","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
++"debian-s390x","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-m32r","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=v8 -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv8_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=v9 -Wa,-Av8plus -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc64","gcc:-m64 -DB_ENDIAN -DTERMIO ${debian_cflags} -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
  ####
  #### Variety of LINUX:-)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/make-targets.patch
similarity index 51%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/make-targets.patch
index f7a6dfd..ee0a62c 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/make-targets.patch
@@ -1,12 +1,12 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.0c/Makefile.org
+Index: openssl-1.0.1/Makefile.org
 ===================================================================
---- openssl-1.0.0c.orig/Makefile.org	2010-12-12 16:10:12.000000000 +0100
-+++ openssl-1.0.0c/Makefile.org	2010-12-12 16:11:27.000000000 +0100
-@@ -109,7 +109,7 @@
- ZLIB_INCLUDE=
- LIBZLIB=
+--- openssl-1.0.1.orig/Makefile.org	2012-03-17 09:41:07.000000000 +0000
++++ openssl-1.0.1/Makefile.org	2012-03-17 09:41:21.000000000 +0000
+@@ -135,7 +135,7 @@
+ 
+ BASEADDR=
  
 -DIRS=   crypto ssl engines apps test tools
 +DIRS=   crypto ssl engines apps tools
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/pic.patch
similarity index 37%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/pic.patch
index e368241..bfda388 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/pic.patch
@@ -1,47 +1,9 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.0c/crypto/Makefile
+Index: openssl-1.0.1c/crypto/des/asm/desboth.pl
 ===================================================================
---- openssl-1.0.0c.orig/crypto/Makefile	2010-07-27 00:09:59.000000000 +0200
-+++ openssl-1.0.0c/crypto/Makefile	2010-12-12 18:05:36.000000000 +0100
-@@ -58,7 +58,7 @@
- 	echo "  #define DATE \"`LC_ALL=C LC_TIME=C date`\""; \
- 	echo '#endif' ) >buildinf.h
- 
--x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
-+x86cpuid.S:	x86cpuid.pl perlasm/x86asm.pl
- 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
- 
- applink.o:	$(TOP)/ms/applink.c
-@@ -70,7 +70,7 @@
- uplink-cof.s:	$(TOP)/ms/uplink.pl
- 	$(PERL) $(TOP)/ms/uplink.pl coff > $@
- 
--x86_64cpuid.s: x86_64cpuid.pl
-+x86_64cpuid.S: x86_64cpuid.pl
- 	$(PERL) x86_64cpuid.pl $(PERLASM_SCHEME) > $@
- ia64cpuid.s: ia64cpuid.S
- 	$(CC) $(CFLAGS) -E ia64cpuid.S > $@
-Index: openssl-1.0.0c/crypto/x86_64cpuid.pl
-===================================================================
---- openssl-1.0.0c.orig/crypto/x86_64cpuid.pl	2010-04-14 21:25:09.000000000 +0200
-+++ openssl-1.0.0c/crypto/x86_64cpuid.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -14,7 +14,11 @@
- print<<___;
- .extern		OPENSSL_cpuid_setup
- .section	.init
-+#ifdef OPENSSL_PIC
-+	call	OPENSSL_cpuid_setup\@PLT
-+#else
- 	call	OPENSSL_cpuid_setup
-+#endif
- 
- .text
- 
-Index: openssl-1.0.0c/crypto/des/asm/desboth.pl
-===================================================================
---- openssl-1.0.0c.orig/crypto/des/asm/desboth.pl	2001-10-24 23:20:56.000000000 +0200
-+++ openssl-1.0.0c/crypto/des/asm/desboth.pl	2010-12-12 18:05:36.000000000 +0100
+--- openssl-1.0.1c.orig/crypto/des/asm/desboth.pl	2001-10-24 23:20:56.000000000 +0200
++++ openssl-1.0.1c/crypto/des/asm/desboth.pl	2012-07-29 14:15:26.000000000 +0200
 @@ -16,6 +16,11 @@
  
  	&push("edi");
@@ -79,51 +41,10 @@ Index: openssl-1.0.0c/crypto/des/asm/desboth.pl
  
  	&stack_pop(3);
  	&mov($L,&DWP(0,"ebx","",0));
-Index: openssl-1.0.0c/crypto/rc4/Makefile
-===================================================================
---- openssl-1.0.0c.orig/crypto/rc4/Makefile	2009-02-11 11:01:36.000000000 +0100
-+++ openssl-1.0.0c/crypto/rc4/Makefile	2010-12-12 18:05:36.000000000 +0100
-@@ -44,7 +44,7 @@
- rc4-586.s:	asm/rc4-586.pl ../perlasm/x86asm.pl
- 	$(PERL) asm/rc4-586.pl $(PERLASM_SCHEME) $(CFLAGS) > $@
- 
--rc4-x86_64.s: asm/rc4-x86_64.pl
-+rc4-x86_64.S: asm/rc4-x86_64.pl
- 	$(PERL) asm/rc4-x86_64.pl $(PERLASM_SCHEME) > $@
- 
- rc4-ia64.S: asm/rc4-ia64.pl
-Index: openssl-1.0.0c/crypto/rc4/asm/rc4-x86_64.pl
+Index: openssl-1.0.1c/crypto/perlasm/cbc.pl
 ===================================================================
---- openssl-1.0.0c.orig/crypto/rc4/asm/rc4-x86_64.pl	2009-04-27 21:31:04.000000000 +0200
-+++ openssl-1.0.0c/crypto/rc4/asm/rc4-x86_64.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -279,7 +279,11 @@
- 	xor	%r10,%r10
- 	xor	%r11,%r11
- 
-+#ifdef OPENSSL_PIC
-+	mov	OPENSSL_ia32cap_P\@GOTPCREL(%rip),$idx#d
-+#else
- 	mov	OPENSSL_ia32cap_P(%rip),$idx#d
-+#endif
- 	bt	\$20,$idx#d
- 	jnc	.Lw1stloop
- 	bt	\$30,$idx#d
-@@ -346,7 +350,11 @@
- .align	16
- RC4_options:
- 	lea	.Lopts(%rip),%rax
-+#ifdef OPENSSL_PIC
-+	mov	OPENSSL_ia32cap_P\@GOTPCREL(%rip),%edx
-+#else
- 	mov	OPENSSL_ia32cap_P(%rip),%edx
-+#endif
- 	bt	\$20,%edx
- 	jnc	.Ldone
- 	add	\$12,%rax
-Index: openssl-1.0.0c/crypto/perlasm/cbc.pl
-===================================================================
---- openssl-1.0.0c.orig/crypto/perlasm/cbc.pl	2005-05-09 23:48:00.000000000 +0200
-+++ openssl-1.0.0c/crypto/perlasm/cbc.pl	2010-12-12 18:05:36.000000000 +0100
+--- openssl-1.0.1c.orig/crypto/perlasm/cbc.pl	2011-07-13 08:22:46.000000000 +0200
++++ openssl-1.0.1c/crypto/perlasm/cbc.pl	2012-07-29 14:15:26.000000000 +0200
 @@ -122,7 +122,11 @@
  	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
  	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
@@ -137,7 +58,7 @@ Index: openssl-1.0.0c/crypto/perlasm/cbc.pl
  
  	&mov("eax",	&DWP($data_off,"esp","",0));
  	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -187,7 +191,11 @@
+@@ -185,7 +189,11 @@
  	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
  	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
  
@@ -150,7 +71,7 @@ Index: openssl-1.0.0c/crypto/perlasm/cbc.pl
  
  	&mov("eax",	&DWP($data_off,"esp","",0));
  	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -220,7 +228,11 @@
+@@ -218,7 +226,11 @@
  	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
  	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
  
@@ -163,7 +84,7 @@ Index: openssl-1.0.0c/crypto/perlasm/cbc.pl
  
  	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
  	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
-@@ -263,7 +275,11 @@
+@@ -261,7 +273,11 @@
  	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
  	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
  
@@ -176,67 +97,81 @@ Index: openssl-1.0.0c/crypto/perlasm/cbc.pl
  
  	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
  	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
-Index: openssl-1.0.0c/crypto/perlasm/x86_64-xlate.pl
-===================================================================
---- openssl-1.0.0c.orig/crypto/perlasm/x86_64-xlate.pl	2010-12-12 18:05:36.000000000 +0100
-+++ openssl-1.0.0c/crypto/perlasm/x86_64-xlate.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -638,7 +638,7 @@
- 
-     chomp($line);
- 
--    $line =~ s|[#!].*$||;	# get rid of asm-style comments...
-+#    $line =~ s|[#!].*$||;	# get rid of asm-style comments...
-     $line =~ s|/\*.*\*/||;	# ... and C-style comments...
-     $line =~ s|^\s+||;		# ... and skip white spaces in beginning
- 
-Index: openssl-1.0.0c/crypto/perlasm/x86gas.pl
+Index: openssl-1.0.1c/crypto/perlasm/x86gas.pl
 ===================================================================
---- openssl-1.0.0c.orig/crypto/perlasm/x86gas.pl	2008-12-17 20:56:47.000000000 +0100
-+++ openssl-1.0.0c/crypto/perlasm/x86gas.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -209,7 +209,17 @@
-     if ($::elf)
+--- openssl-1.0.1c.orig/crypto/perlasm/x86gas.pl	2011-12-09 20:16:35.000000000 +0100
++++ openssl-1.0.1c/crypto/perlasm/x86gas.pl	2012-07-29 14:15:26.000000000 +0200
+@@ -161,6 +161,7 @@
+ 	if ($::macosx)	{ push (@out,"$tmp,2\n"); }
+ 	elsif ($::elf)	{ push (@out,"$tmp,4\n"); }
+ 	else		{ push (@out,"$tmp\n"); }
++	if ($::elf)	{ push (@out,".hidden\tOPENSSL_ia32cap_P\n"); }
+     }
+     push(@out,$initseg) if ($initseg);
+ }
+@@ -218,8 +219,23 @@
+     elsif ($::elf)
      {	$initseg.=<<___;
  .section	.init
-+#ifdef OPENSSL_PIC
++___
++        if ($::pic)
++	{   $initseg.=<<___;
 +	pushl	%ebx
-+	call    .pic_point0
++	call	.pic_point0
 +.pic_point0:
-+	popl    %ebx
-+	addl    \$_GLOBAL_OFFSET_TABLE_+[.-.pic_point0],%ebx
++	popl	%ebx
++	addl	\$_GLOBAL_OFFSET_TABLE_+[.-.pic_point0],%ebx
 +	call	$f\@PLT
 +	popl	%ebx
-+#else
++___
++	}
++	else
++	{   $initseg.=<<___;
  	call	$f
-+#endif
- 	jmp	.Linitalign
- .align	$align
- .Linitalign:
-Index: openssl-1.0.0c/crypto/aes/asm/aes-x86_64.pl
+ ___
++	}
+     }
+     elsif ($::coff)
+     {   $initseg.=<<___;	# applies to both Cygwin and Mingw
+Index: openssl-1.0.1c/crypto/x86cpuid.pl
 ===================================================================
---- openssl-1.0.0c.orig/crypto/aes/asm/aes-x86_64.pl	2008-12-27 14:32:21.000000000 +0100
-+++ openssl-1.0.0c/crypto/aes/asm/aes-x86_64.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -1669,7 +1669,11 @@
- 	lea	.LAES_Td(%rip),$sbox
- .Lcbc_picked_te:
+--- openssl-1.0.1c.orig/crypto/x86cpuid.pl	2012-02-28 15:20:34.000000000 +0100
++++ openssl-1.0.1c/crypto/x86cpuid.pl	2012-07-29 14:15:26.000000000 +0200
+@@ -8,6 +8,8 @@
  
-+#ifdef OPENSSL_PIC
-+	mov	OPENSSL_ia32cap_P\@GOTPCREL(%rip),%r10d
-+#else
- 	mov	OPENSSL_ia32cap_P(%rip),%r10d
-+#endif
- 	cmp	\$$speed_limit,%rdx
- 	jb	.Lcbc_slow_prologue
- 	test	\$15,%rdx
-Index: openssl-1.0.0c/crypto/aes/Makefile
-===================================================================
---- openssl-1.0.0c.orig/crypto/aes/Makefile	2010-12-12 18:15:06.000000000 +0100
-+++ openssl-1.0.0c/crypto/aes/Makefile	2010-12-12 18:15:30.000000000 +0100
-@@ -51,7 +51,7 @@
- aes-586.s:	asm/aes-586.pl ../perlasm/x86asm.pl
- 	$(PERL) asm/aes-586.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+ for (@ARGV) { $sse2=1 if (/-DOPENSSL_IA32_SSE2/); }
  
--aes-x86_64.s: asm/aes-x86_64.pl
-+aes-x86_64.S: asm/aes-x86_64.pl
- 	$(PERL) asm/aes-x86_64.pl $(PERLASM_SCHEME) > $@
- 
- aes-sparcv9.s: asm/aes-sparcv9.pl
++push(@out, ".hidden OPENSSL_ia32cap_P\n");
++
+ &function_begin("OPENSSL_ia32_cpuid");
+ 	&xor	("edx","edx");
+ 	&pushf	();
+@@ -139,9 +141,7 @@
+ &set_label("nocpuid");
+ &function_end("OPENSSL_ia32_cpuid");
+ 
+-&external_label("OPENSSL_ia32cap_P");
+-
+-&function_begin_B("OPENSSL_rdtsc","EXTRN\t_OPENSSL_ia32cap_P:DWORD");
++&function_begin_B("OPENSSL_rdtsc");
+ 	&xor	("eax","eax");
+ 	&xor	("edx","edx");
+ 	&picmeup("ecx","OPENSSL_ia32cap_P");
+@@ -155,7 +155,7 @@
+ # This works in Ring 0 only [read DJGPP+MS-DOS+privileged DPMI host],
+ # but it's safe to call it on any [supported] 32-bit platform...
+ # Just check for [non-]zero return value...
+-&function_begin_B("OPENSSL_instrument_halt","EXTRN\t_OPENSSL_ia32cap_P:DWORD");
++&function_begin_B("OPENSSL_instrument_halt");
+ 	&picmeup("ecx","OPENSSL_ia32cap_P");
+ 	&bt	(&DWP(0,"ecx"),4);
+ 	&jnc	(&label("nohalt"));	# no TSC
+@@ -222,7 +222,7 @@
+ 	&ret	();
+ &function_end_B("OPENSSL_far_spin");
+ 
+-&function_begin_B("OPENSSL_wipe_cpu","EXTRN\t_OPENSSL_ia32cap_P:DWORD");
++&function_begin_B("OPENSSL_wipe_cpu");
+ 	&xor	("eax","eax");
+ 	&xor	("edx","edx");
+ 	&picmeup("ecx","OPENSSL_ia32cap_P");
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/version-script.patch
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/version-script.patch
index a79c082..ece8b9b 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/version-script.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.0e/Configure
+Index: openssl-1.0.1d/Configure
 ===================================================================
---- openssl-1.0.0e.orig/Configure	2011-10-04 22:49:47.599379260 -0700
-+++ openssl-1.0.0e/Configure	2011-10-04 22:49:53.263407376 -0700
-@@ -1486,6 +1486,8 @@
+--- openssl-1.0.1d.orig/Configure	2013-02-06 19:41:43.000000000 +0100
++++ openssl-1.0.1d/Configure	2013-02-06 19:41:43.000000000 +0100
+@@ -1621,6 +1621,8 @@
  		}
  	}
  
@@ -13,11 +13,11 @@ Index: openssl-1.0.0e/Configure
  open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
  unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
  open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
-Index: openssl-1.0.0e/openssl.ld
+Index: openssl-1.0.1d/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/openssl.ld	2011-10-04 22:49:53.295407572 -0700
-@@ -0,0 +1,4461 @@
++++ openssl-1.0.1d/openssl.ld	2013-02-06 19:44:25.000000000 +0100
+@@ -0,0 +1,4620 @@
 +OPENSSL_1.0.0 {
 +	global:
 +		BIO_f_ssl;
@@ -3127,19 +3127,7 @@ Index: openssl-1.0.0e/openssl.ld
 +		FIPS_selftest_failed;
 +		sk_is_sorted;
 +		X509_check_ca;
-+		private_idea_set_encrypt_key;
 +		HMAC_CTX_set_flags;
-+		private_SHA_Init;
-+		private_CAST_set_key;
-+		private_RIPEMD160_Init;
-+		private_RC5_32_set_key;
-+		private_MD5_Init;
-+		private_RC4_set_key;
-+		private_MDC2_Init;
-+		private_RC2_set_key;
-+		private_MD4_Init;
-+		private_BF_set_key;
-+		private_MD2_Init;
 +		d2i_PROXY_CERT_INFO_EXTENSION;
 +		PROXY_POLICY_it;
 +		PROXY_POLICY_it;
@@ -3987,7 +3975,6 @@ Index: openssl-1.0.0e/openssl.ld
 +		FIPS_dsa_sig_encode;
 +		CRYPTO_dbg_remove_all_info;
 +		OPENSSL_init;
-+		private_Camellia_set_key;
 +		CRYPTO_strdup;
 +		JPAKE_STEP3A_process;
 +		JPAKE_STEP1_release;
@@ -4479,10 +4466,182 @@ Index: openssl-1.0.0e/openssl.ld
 +		*;
 +};
 +
-Index: openssl-1.0.0e/engines/openssl.ld
++
++OPENSSL_1.0.1 {
++	global:
++		SSL_renegotiate_abbreviated;
++		TLSv1_1_method;
++		TLSv1_1_client_method;
++		TLSv1_1_server_method;
++		SSL_CTX_set_srp_client_pwd_callback;
++		SSL_CTX_set_srp_client_pwd_cb;
++		SSL_get_srp_g;
++		SSL_CTX_set_srp_username_callback;
++		SSL_CTX_set_srp_un_cb;
++		SSL_get_srp_userinfo;
++		SSL_set_srp_server_param;
++		SSL_set_srp_server_param_pw;
++		SSL_get_srp_N;
++		SSL_get_srp_username;
++		SSL_CTX_set_srp_password;
++		SSL_CTX_set_srp_strength;
++		SSL_CTX_set_srp_verify_param_callback;
++		SSL_CTX_set_srp_vfy_param_cb;
++		SSL_CTX_set_srp_cb_arg;
++		SSL_CTX_set_srp_username;
++		SSL_CTX_SRP_CTX_init;
++		SSL_SRP_CTX_init;
++		SRP_Calc_A_param;
++		SRP_generate_server_master_secret;
++		SRP_gen_server_master_secret;
++		SSL_CTX_SRP_CTX_free;
++		SRP_generate_client_master_secret;
++		SRP_gen_client_master_secret;
++		SSL_srp_server_param_with_username;
++		SSL_srp_server_param_with_un;
++		SSL_SRP_CTX_free;
++		SSL_set_debug;
++		SSL_SESSION_get0_peer;
++		TLSv1_2_client_method;
++		SSL_SESSION_set1_id_context;
++		TLSv1_2_server_method;
++		SSL_cache_hit;
++		SSL_get0_kssl_ctx;
++		SSL_set0_kssl_ctx;
++		SSL_set_state;
++		SSL_CIPHER_get_id;
++		TLSv1_2_method;
++		kssl_ctx_get0_client_princ;
++		SSL_export_keying_material;
++		SSL_set_tlsext_use_srtp;
++		SSL_CTX_set_next_protos_advertised_cb;
++		SSL_CTX_set_next_protos_adv_cb;
++		SSL_get0_next_proto_negotiated;
++		SSL_get_selected_srtp_profile;
++		SSL_CTX_set_tlsext_use_srtp;
++		SSL_select_next_proto;
++		SSL_get_srtp_profiles;
++		SSL_CTX_set_next_proto_select_cb;
++		SSL_CTX_set_next_proto_sel_cb;
++		SSL_SESSION_get_compress_id;
++
++		SRP_VBASE_get_by_user;
++		SRP_Calc_server_key;
++		SRP_create_verifier;
++		SRP_create_verifier_BN;
++		SRP_Calc_u;
++		SRP_VBASE_free;
++		SRP_Calc_client_key;
++		SRP_get_default_gN;
++		SRP_Calc_x;
++		SRP_Calc_B;
++		SRP_VBASE_new;
++		SRP_check_known_gN_param;
++		SRP_Calc_A;
++		SRP_Verify_A_mod_N;
++		SRP_VBASE_init;
++		SRP_Verify_B_mod_N;
++		EC_KEY_set_public_key_affine_coordinates;
++		EC_KEY_set_pub_key_aff_coords;
++		EVP_aes_192_ctr;
++		EVP_PKEY_meth_get0_info;
++		EVP_PKEY_meth_copy;
++		ERR_add_error_vdata;
++		EVP_aes_128_ctr;
++		EVP_aes_256_ctr;
++		EC_GFp_nistp224_method;
++		EC_KEY_get_flags;
++		RSA_padding_add_PKCS1_PSS_mgf1;
++		EVP_aes_128_xts;
++		EVP_aes_256_xts;
++		EVP_aes_128_gcm;
++		EC_KEY_clear_flags;
++		EC_KEY_set_flags;
++		EVP_aes_256_ccm;
++		RSA_verify_PKCS1_PSS_mgf1;
++		EVP_aes_128_ccm;
++		EVP_aes_192_gcm;
++		X509_ALGOR_set_md;
++		RAND_init_fips;
++		EVP_aes_256_gcm;
++		EVP_aes_192_ccm;
++		CMAC_CTX_copy;
++		CMAC_CTX_free;
++		CMAC_CTX_get0_cipher_ctx;
++		CMAC_CTX_cleanup;
++		CMAC_Init;
++		CMAC_Update;
++		CMAC_resume;
++		CMAC_CTX_new;
++		CMAC_Final;
++		CRYPTO_ctr128_encrypt_ctr32;
++		CRYPTO_gcm128_release;
++		CRYPTO_ccm128_decrypt_ccm64;
++		CRYPTO_ccm128_encrypt;
++		CRYPTO_gcm128_encrypt;
++		CRYPTO_xts128_encrypt;
++		EVP_rc4_hmac_md5;
++		CRYPTO_nistcts128_decrypt_block;
++		CRYPTO_gcm128_setiv;
++		CRYPTO_nistcts128_encrypt;
++		EVP_aes_128_cbc_hmac_sha1;
++		CRYPTO_gcm128_tag;
++		CRYPTO_ccm128_encrypt_ccm64;
++		ENGINE_load_rdrand;
++		CRYPTO_ccm128_setiv;
++		CRYPTO_nistcts128_encrypt_block;
++		CRYPTO_gcm128_aad;
++		CRYPTO_ccm128_init;
++		CRYPTO_nistcts128_decrypt;
++		CRYPTO_gcm128_new;
++		CRYPTO_ccm128_tag;
++		CRYPTO_ccm128_decrypt;
++		CRYPTO_ccm128_aad;
++		CRYPTO_gcm128_init;
++		CRYPTO_gcm128_decrypt;
++		ENGINE_load_rsax;
++		CRYPTO_gcm128_decrypt_ctr32;
++		CRYPTO_gcm128_encrypt_ctr32;
++		CRYPTO_gcm128_finish;
++		EVP_aes_256_cbc_hmac_sha1;
++		PKCS5_pbkdf2_set;
++		CMS_add0_recipient_password;
++		CMS_decrypt_set1_password;
++		CMS_RecipientInfo_set0_password;
++		RAND_set_fips_drbg_type;
++		X509_REQ_sign_ctx;
++		RSA_PSS_PARAMS_new;
++		X509_CRL_sign_ctx;
++		X509_signature_dump;
++		d2i_RSA_PSS_PARAMS;
++		RSA_PSS_PARAMS_it;
++		RSA_PSS_PARAMS_it;
++		RSA_PSS_PARAMS_free;
++		X509_sign_ctx;
++		i2d_RSA_PSS_PARAMS;
++		ASN1_item_sign_ctx;
++		EC_GFp_nistp521_method;
++		EC_GFp_nistp256_method;
++		OPENSSL_stderr;
++		OPENSSL_cpuid_setup;
++		OPENSSL_showfatal;
++		BIO_new_dgram_sctp;
++		BIO_dgram_sctp_msg_waiting;
++		BIO_dgram_sctp_wait_for_dry;
++		BIO_s_datagram_sctp;
++		BIO_dgram_is_sctp;
++		BIO_dgram_sctp_notification_cb;
++} OPENSSL_1.0.0;
++
++OPENSSL_1.0.1d {
++	global:
++		CRYPTO_memcmp;
++} OPENSSL_1.0.1;
++
+Index: openssl-1.0.1d/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/engines/openssl.ld	2011-10-04 22:49:53.295407572 -0700
++++ openssl-1.0.1d/engines/openssl.ld	2013-02-06 19:41:43.000000000 +0100
 @@ -0,0 +1,10 @@
 +OPENSSL_1.0.0 {
 +	global:
@@ -4494,10 +4653,10 @@ Index: openssl-1.0.0e/engines/openssl.ld
 +		*;
 +};
 +
-Index: openssl-1.0.0e/engines/ccgost/openssl.ld
+Index: openssl-1.0.1d/engines/ccgost/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/engines/ccgost/openssl.ld	2011-10-04 22:49:53.339407745 -0700
++++ openssl-1.0.1d/engines/ccgost/openssl.ld	2013-02-06 19:41:43.000000000 +0100
 @@ -0,0 +1,10 @@
 +OPENSSL_1.0.0 {
 +	global:
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.1e/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl_fix_for_x32.patch
similarity index 70%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl_fix_for_x32.patch
index 3191ce9..93ce034 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl_fix_for_x32.patch
@@ -6,22 +6,22 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
 
 ported the patch to the 1.0.0e version
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
-Index: openssl-1.0.0e/Configure
+Index: openssl-1.0.1e/Configure
 ===================================================================
---- openssl-1.0.0e.orig/Configure
-+++ openssl-1.0.0e/Configure
-@@ -393,6 +393,7 @@ my %table=(
+--- openssl-1.0.1e.orig/Configure
++++ openssl-1.0.1e/Configure
+@@ -402,6 +402,7 @@ my %table=(
  "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
 +"linux-x32", "gcc:-mx32 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::x32",
- "linux-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
- #### SPARC Linux setups
- # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
-Index: openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
+ "linux64-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ #### So called "highgprs" target for z/Architecture CPUs
+ # "Highgprs" is kernel feature first implemented in Linux 2.6.32, see
+Index: openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
 ===================================================================
---- openssl-1.0.0e.orig/crypto/bn/asm/x86_64-gcc.c
-+++ openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
+--- openssl-1.0.1e.orig/crypto/bn/asm/x86_64-gcc.c
++++ openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
 @@ -55,7 +55,7 @@
   *    machine.
   */
@@ -57,10 +57,10 @@ Index: openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
  	"	leaq	1(%2),%2	\n"
  	"	loop	1b		\n"
  	"	sbbq	%0,%0		\n"
-Index: openssl-1.0.0e/crypto/bn/bn.h
+Index: openssl-1.0.1e/crypto/bn/bn.h
 ===================================================================
---- openssl-1.0.0e.orig/crypto/bn/bn.h
-+++ openssl-1.0.0e/crypto/bn/bn.h
+--- openssl-1.0.1e.orig/crypto/bn/bn.h
++++ openssl-1.0.1e/crypto/bn/bn.h
 @@ -172,6 +172,13 @@ extern "C" {
  # endif
  #endif
@@ -75,15 +75,15 @@ Index: openssl-1.0.0e/crypto/bn/bn.h
  /* assuming long is 64bit - this is the DEC Alpha
   * unsigned long long is only 64 bits :-(, don't define
   * BN_LLONG for the DEC Alpha */
-Index: openssl-1.0.0e/crypto/bn/bn_exp.c
+Index: openssl-1.0.1e/crypto/bn/bn_exp.c
 ===================================================================
---- openssl-1.0.0e.orig/crypto/bn/bn_exp.c
-+++ openssl-1.0.0e/crypto/bn/bn_exp.c
-@@ -561,7 +561,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
+--- openssl-1.0.1e.orig/crypto/bn/bn_exp.c
++++ openssl-1.0.1e/crypto/bn/bn_exp.c
+@@ -567,7 +567,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
  
  /* Given a pointer value, compute the next address that is a cache line multiple. */
  #define MOD_EXP_CTIME_ALIGN(x_) \
--	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ULONG)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
+-	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((size_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
 +	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
  
  /* This variant of BN_mod_exp_mont() uses fixed windows and the special
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/shared-libs.patch
similarity index 57%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1e/shared-libs.patch
index 0998673..a7ca0a3 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/shared-libs.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: openssl-1.0.0/crypto/Makefile
+Index: openssl-1.0.1e/crypto/Makefile
 ===================================================================
---- openssl-1.0.0.orig/crypto/Makefile
-+++ openssl-1.0.0/crypto/Makefile
-@@ -104,7 +104,7 @@
+--- openssl-1.0.1e.orig/crypto/Makefile
++++ openssl-1.0.1e/crypto/Makefile
+@@ -108,7 +108,7 @@ $(LIB):	$(LIBOBJ)
  
  shared: buildinf.h lib subdirs
  	if [ -n "$(SHARED_LIBS)" ]; then \
@@ -13,20 +13,11 @@ Index: openssl-1.0.0/crypto/Makefile
  	fi
  
  libs:
-Index: openssl-1.0.0/Makefile.org
+Index: openssl-1.0.1e/Makefile.org
 ===================================================================
---- openssl-1.0.0.orig/Makefile.org
-+++ openssl-1.0.0/Makefile.org
-@@ -260,7 +260,7 @@
- 
- libcrypto$(SHLIB_EXT): libcrypto.a
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
--		$(MAKE) SHLIBDIRS=crypto build-shared; \
-+		$(MAKE) -e SHLIBDIRS=crypto build-shared; \
- 	else \
- 		echo "There's no support for shared libraries on this platform" >&2; \
- 		exit 1; \
-@@ -268,7 +268,7 @@
+--- openssl-1.0.1e.orig/Makefile.org
++++ openssl-1.0.1e/Makefile.org
+@@ -310,7 +310,7 @@ libcrypto$(SHLIB_EXT): libcrypto.a fips_
  
  libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
  	@if [ "$(SHLIB_TARGET)" != "" ]; then \
@@ -35,11 +26,11 @@ Index: openssl-1.0.0/Makefile.org
  	else \
  		echo "There's no support for shared libraries on this platform" >&2; \
  		exit 1; \
-Index: openssl-1.0.0/ssl/Makefile
+Index: openssl-1.0.1e/ssl/Makefile
 ===================================================================
---- openssl-1.0.0.orig/ssl/Makefile
-+++ openssl-1.0.0/ssl/Makefile
-@@ -62,7 +62,7 @@
+--- openssl-1.0.1e.orig/ssl/Makefile
++++ openssl-1.0.1e/ssl/Makefile
+@@ -62,7 +62,7 @@ lib:	$(LIBOBJ)
  
  shared: lib
  	if [ -n "$(SHARED_LIBS)" ]; then \
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
similarity index 89%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 8c0166a..47c13a4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -32,8 +32,8 @@ SRC_URI += "file://configure-targets.patch \
             file://find.pl \
            "
 
-SRC_URI[md5sum] = "cbe4ac0d8f598680f68a951e04b0996b"
-SRC_URI[sha256sum] = "626fb8fcb3eb7e966edbe71553ff993d137f6e8a87b05051a3695e621098b8af"
+SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
+SRC_URI[sha256sum] = "f74f15e8c8ff11aa3d5bb5f276d202ec18d7246e95f961db76054199c69c1ae3"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.9.5



