Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBTIz-0002Ln-VZ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:27:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 09:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="220783476"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 09:14:45 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 18:19:50 +0300
Message-Id: <187519ae2a3e5d27a329657c825d9bbe415e0838.1347376068.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
Subject: [PATCH 5/5] openssl: upgrade to 1.0.1c
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
X-List-Received-Date: Tue, 11 Sep 2012 16:27:21 -0000

- Remove old debian.org patches
- Add new patches from debian.org
- Adapt shared-libs.patch and openssl_fix_for_x32.patch

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../openssl-1.0.0j/debian/debian-targets.patch     |   54 -----
 .../openssl/openssl-1.0.0j/debian/pic.patch        |  242 --------------------
 .../configure-targets.patch                        |    0
 .../debian/block_digicert_malaysia.patch           |   29 +++
 .../openssl-1.0.1c/debian/block_diginotar.patch    |   67 ++++++
 .../debian/c_rehash-compat.patch                   |   15 +-
 .../openssl-1.0.1c/debian/c_rehash-multi.patch     |   89 +++++++
 .../debian/ca.patch                                |    1 +
 .../openssl-1.0.1c/debian/config-hurd.patch        |   18 ++
 .../openssl-1.0.1c/debian/debian-targets.patch     |   67 ++++++
 .../openssl-1.0.1c/debian/default_bits.patch       |   14 ++
 .../openssl/openssl-1.0.1c/debian/dgst_hmac.patch  |   54 +++++
 .../openssl/openssl-1.0.1c/debian/gnu_source.patch |   27 +++
 .../debian/libdoc-manpgs-pod-spell.patch           |  239 +++++++++++++++++++
 .../openssl-1.0.1c/debian/libssl-misspell.patch    |   14 ++
 .../debian/make-targets.patch                      |   13 +-
 .../debian/man-dir.patch                           |    1 +
 .../debian/man-section.patch                       |    1 +
 .../debian/no-rpath.patch                          |    1 +
 .../debian/no-symbolic.patch                       |    1 +
 .../debian/openssl-pod-misspell.patch              |  125 ++++++++++
 .../openssl/openssl-1.0.1c/debian/pic.patch        |  178 ++++++++++++++
 .../openssl/openssl-1.0.1c/debian/pkcs12-doc.patch |   39 ++++
 .../openssl-1.0.1c/debian/pod_ec.misspell.patch    |   14 ++
 .../debian/pod_pksc12.misspell.patch               |   14 ++
 .../openssl-1.0.1c/debian/pod_req_misspell2.patch  |   15 ++
 .../debian/pod_s_server.misspell.patch             |   14 ++
 .../debian/pod_x509setflags.misspell.patch         |   14 ++
 .../openssl/openssl-1.0.1c/debian/rehash-crt.patch |   36 +++
 .../openssl/openssl-1.0.1c/debian/rehash_pod.patch |   63 +++++
 .../openssl-1.0.1c/debian/renegiotate_tls.patch    |   13 ++
 .../openssl-1.0.1c/debian/shared-lib-ext.patch     |   17 ++
 .../openssl/openssl-1.0.1c/debian/stddef.patch     |   15 ++
 .../openssl/openssl-1.0.1c/debian/valgrind.patch   |   23 ++
 .../debian/version-script.patch                    |  203 ++++++++++++++--
 .../engines-install-in-libdir-ssl.patch            |    0
 .../{openssl-1.0.0j => openssl-1.0.1c}/find.pl     |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |   38 ++-
 .../shared-libs.patch                              |   33 +--
 .../{openssl_1.0.0j.bb => openssl_1.0.1c.bb}       |   37 ++-
 42 files changed, 1450 insertions(+), 388 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/configure-targets.patch (100%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_digicert_malaysia.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_diginotar.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/c_rehash-compat.patch (77%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-multi.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/ca.patch (93%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/config-hurd.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/debian-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/default_bits.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/dgst_hmac.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/gnu_source.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libdoc-manpgs-pod-spell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libssl-misspell.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/make-targets.patch (46%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/man-dir.patch (86%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/man-section.patch (95%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/no-rpath.patch (91%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/no-symbolic.patch (91%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/openssl-pod-misspell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pic.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pkcs12-doc.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_ec.misspell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_pksc12.misspell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_req_misspell2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_s_server.misspell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_x509setflags.misspell.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash-crt.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash_pod.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/renegiotate_tls.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/shared-lib-ext.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/stddef.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/valgrind.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/version-script.patch (95%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/openssl_fix_for_x32.patch (63%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/shared-libs.patch (43%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0j.bb => openssl_1.0.1c.bb} (53%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
deleted file mode 100644
index 9feae38..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-1.0.0c/Configure
-===================================================================
---- openssl-1.0.0c.orig/Configure	2010-12-12 17:27:02.000000000 +0100
-+++ openssl-1.0.0c/Configure	2010-12-12 17:34:47.000000000 +0100
-@@ -331,6 +331,47 @@
- "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
- "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
- 
-+# Debian GNU/* (various architectures)
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
-+"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mtune=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
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
-+
- ####
- #### Variety of LINUX:-)
- ####
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
deleted file mode 100644
index e368241..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
+++ /dev/null
@@ -1,242 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-1.0.0c/crypto/Makefile
-===================================================================
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
-@@ -16,6 +16,11 @@
- 
- 	&push("edi");
- 
-+	&call   (&label("pic_point0"));
-+	&set_label("pic_point0");
-+	&blindpop("ebp");
-+	&add    ("ebp", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
-+
- 	&comment("");
- 	&comment("Load the data words");
- 	&mov($L,&DWP(0,"ebx","",0));
-@@ -47,15 +52,21 @@
- 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
- 	&mov(&swtmp(1),	"eax");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 	&mov(&swtmp(2),	(DWC(($enc)?"0":"1")));
- 	&mov(&swtmp(1),	"edi");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
- 	&mov(&swtmp(1),	"esi");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 
- 	&stack_pop(3);
- 	&mov($L,&DWP(0,"ebx","",0));
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
-===================================================================
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
-@@ -122,7 +122,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($enc_func);
-+	&call	(&label("pic_point0"));
-+	&set_label("pic_point0");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
-+	&call("$enc_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -187,7 +191,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($enc_func);
-+	&call	(&label("pic_point1"));
-+	&set_label("pic_point1");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point1") . "]");
-+	&call("$enc_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -220,7 +228,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($dec_func);
-+	&call	(&label("pic_point2"));
-+	&set_label("pic_point2");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point2") . "]");
-+	&call("$dec_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
-@@ -263,7 +275,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($dec_func);
-+	&call	(&label("pic_point3"));
-+	&set_label("pic_point3");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point3") . "]");
-+	&call("$dec_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
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
-===================================================================
---- openssl-1.0.0c.orig/crypto/perlasm/x86gas.pl	2008-12-17 20:56:47.000000000 +0100
-+++ openssl-1.0.0c/crypto/perlasm/x86gas.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -209,7 +209,17 @@
-     if ($::elf)
-     {	$initseg.=<<___;
- .section	.init
-+#ifdef OPENSSL_PIC
-+	pushl	%ebx
-+	call    .pic_point0
-+.pic_point0:
-+	popl    %ebx
-+	addl    \$_GLOBAL_OFFSET_TABLE_+[.-.pic_point0],%ebx
-+	call	$f\@PLT
-+	popl	%ebx
-+#else
- 	call	$f
-+#endif
- 	jmp	.Linitalign
- .align	$align
- .Linitalign:
-Index: openssl-1.0.0c/crypto/aes/asm/aes-x86_64.pl
-===================================================================
---- openssl-1.0.0c.orig/crypto/aes/asm/aes-x86_64.pl	2008-12-27 14:32:21.000000000 +0100
-+++ openssl-1.0.0c/crypto/aes/asm/aes-x86_64.pl	2010-12-12 18:05:36.000000000 +0100
-@@ -1669,7 +1669,11 @@
- 	lea	.LAES_Td(%rip),$sbox
- .Lcbc_picked_te:
- 
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
- 
--aes-x86_64.s: asm/aes-x86_64.pl
-+aes-x86_64.S: asm/aes-x86_64.pl
- 	$(PERL) asm/aes-x86_64.pl $(PERLASM_SCHEME) > $@
- 
- aes-sparcv9.s: asm/aes-sparcv9.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_digicert_malaysia.patch
new file mode 100644
index 0000000..d5ad707
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_digicert_malaysia.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+From: Raphael Geissert <geissert@debian.org>
+Description: make X509_verify_cert indicate that any certificate whose
+ name contains "Digicert Sdn. Bhd." (from Malaysia) is revoked.
+Forwarded: not-needed
+Origin: vendor
+Last-Update: 2011-11-05
+
+Index: openssl-1.0.0e/crypto/x509/x509_vfy.c
+===================================================================
+--- openssl-1.0.0e.orig/crypto/x509/x509_vfy.c
++++ openssl-1.0.0e/crypto/x509/x509_vfy.c
+@@ -833,10 +833,11 @@ static int check_ca_blacklist(X509_STORE
+ 	for (i = sk_X509_num(ctx->chain) - 1; i >= 0; i--)
+ 		{
+ 		x = sk_X509_value(ctx->chain, i);
+-		/* Mark DigiNotar certificates as revoked, no matter
+-		 * where in the chain they are.
++		/* Mark certificates containing the following names as
++		 * revoked, no matter where in the chain they are.
+ 		 */
+-		if (x->name && strstr(x->name, "DigiNotar"))
++		if (x->name && (strstr(x->name, "DigiNotar") ||
++			strstr(x->name, "Digicert Sdn. Bhd.")))
+ 			{
+ 			ctx->error = X509_V_ERR_CERT_REVOKED;
+ 			ctx->error_depth = i;
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_diginotar.patch
new file mode 100644
index 0000000..a82af59
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_diginotar.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+From: Raphael Geissert <geissert@debian.org>
+Description: make X509_verify_cert indicate that any certificate whose
+ name contains "DigiNotar" is revoked.
+Forwarded: not-needed
+Origin: vendor
+Last-Update: 2011-09-08
+Bug: http://bugs.debian.org/639744
+Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
+Reviewed-by: Dr Stephen N Henson <shenson@drh-consultancy.co.uk>
+
+This is not meant as final patch.  
+
+Index: openssl-1.0.0d/crypto/x509/x509_vfy.c
+===================================================================
+--- openssl-1.0.0d.orig/crypto/x509/x509_vfy.c
++++ openssl-1.0.0d/crypto/x509/x509_vfy.c
+@@ -117,6 +117,7 @@ static int check_trust(X509_STORE_CTX *c
+ static int check_revocation(X509_STORE_CTX *ctx);
+ static int check_cert(X509_STORE_CTX *ctx);
+ static int check_policy(X509_STORE_CTX *ctx);
++static int check_ca_blacklist(X509_STORE_CTX *ctx);
+ 
+ static int get_crl_score(X509_STORE_CTX *ctx, X509 **pissuer,
+ 			unsigned int *preasons,
+@@ -374,6 +375,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
+ 		ok=internal_verify(ctx);
+ 	if(!ok) goto end;
+ 
++	ok = check_ca_blacklist(ctx);
++	if(!ok) goto end;
++
+ #ifndef OPENSSL_NO_RFC3779
+ 	/* RFC 3779 path validation, now that CRL check has been done */
+ 	ok = v3_asid_validate_path(ctx);
+@@ -820,6 +824,29 @@ static int check_crl_time(X509_STORE_CTX
+ 	return 1;
+ 	}
+ 
++static int check_ca_blacklist(X509_STORE_CTX *ctx)
++	{
++	X509 *x;
++	int i;
++	/* Check all certificates against the blacklist */
++	for (i = sk_X509_num(ctx->chain) - 1; i >= 0; i--)
++		{
++		x = sk_X509_value(ctx->chain, i);
++		/* Mark DigiNotar certificates as revoked, no matter
++		 * where in the chain they are.
++		 */
++		if (x->name && strstr(x->name, "DigiNotar"))
++			{
++			ctx->error = X509_V_ERR_CERT_REVOKED;
++			ctx->error_depth = i;
++			ctx->current_cert = x;
++			if (!ctx->verify_cb(0,ctx))
++				return 0;
++			}
++		}
++	return 1;
++	}
++
+ static int get_crl_sk(X509_STORE_CTX *ctx, X509_CRL **pcrl, X509_CRL **pdcrl,
+ 			X509 **pissuer, int *pscore, unsigned int *preasons,
+ 			STACK_OF(X509_CRL) *crls)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-compat.patch
similarity index 77%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-compat.patch
index 8f9a034..d9470a3 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-compat.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 From 83f318d68bbdab1ca898c94576a838cc97df4700 Mon Sep 17 00:00:00 2001
 From: Ludwig Nussel <ludwig.nussel@suse.de>
@@ -9,19 +10,19 @@ Subject: [PATCH] also create old hash for compatibility
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
@@ -32,7 +33,7 @@ Index: openssl-1.0.0c/tools/c_rehash.in
  		chomp $hash;
  		chomp $fprint;
  		$fprint =~ s/^.*=//;
-@@ -147,6 +149,10 @@
+@@ -150,6 +152,10 @@
  		$hashlist{$hash} = $fprint;
  }
  
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-multi.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-multi.patch
new file mode 100644
index 0000000..45141df
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-multi.patch
@@ -0,0 +1,89 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+From: Klaus Ethgen <Klaus@Ethgen.de>
+Subject: Generate hashes for all certs in a file
+Bug: http://bugs.debian.org/628780
+Forwared: no
+
+--- a/tools/c_rehash.in
++++ b/tools/c_rehash.in
+@@ -122,34 +122,50 @@ sub link_hash_cert {
+ 		my $fname = $_[0];
+ 		my $hashopt = $_[1] || '-subject_hash';
+ 		$fname =~ s/'/'\\''/g;
+-		my ($hash, $fprint) = `"$openssl" x509 $hashopt -fingerprint -noout -in "$fname"`;
+-		chomp $hash;
+-		chomp $fprint;
+-		$fprint =~ s/^.*=//;
+-		$fprint =~ tr/://d;
+-		my $suffix = 0;
+-		# Search for an unused hash filename
+-		while(exists $hashlist{"$hash.$suffix"}) {
+-			# Hash matches: if fingerprint matches its a duplicate cert
+-			if($hashlist{"$hash.$suffix"} eq $fprint) {
+-				print STDERR "WARNING: Skipping duplicate certificate $fname\n";
+-				return;
+-			}
+-			$suffix++;
+-		}
+-		$hash .= ".$suffix";
+-		print "$fname => $hash\n";
+-		$symlink_exists=eval {symlink("",""); 1};
+-		if ($symlink_exists) {
+-			symlink $fname, $hash;
+-		} else {
+-			open IN,"<$fname" or die "can't open $fname for read";
+-			open OUT,">$hash" or die "can't open $hash for write";
+-			print OUT <IN>;	# does the job for small text files
+-			close OUT;
+-			close IN;
+-		}
+-		$hashlist{$hash} = $fprint;
++		open my $in_fh, '<', $fname or die "can't open $fname for read";
++		my $cert = eval {local $/ = undef; <$in_fh>};
++		close $in_fh;
++		OUTERLOOP:
++		while ($cert =~ /^(-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----)$/gms)
++		{
++		   my $part = $1;
++		   my $tfile = `tempfile`;
++		   chomp $tfile;
++		   open my $tfile_fh, '>', $tfile or die "can't open $tfile for write";
++		   print {$tfile_fh} "$part\n";
++		   close $tfile_fh;
++
++		   my ($hash, $fprint) = `"$openssl" x509 $hashopt -fingerprint -noout -in "$tfile"`;
++		   chomp $hash;
++		   chomp $fprint;
++		   $fprint =~ s/^.*=//;
++		   $fprint =~ tr/://d;
++		   my $suffix = 0;
++		   # Search for an unused hash filename
++		   while(exists $hashlist{"$hash.$suffix"}) {
++			   # Hash matches: if fingerprint matches its a duplicate cert
++			   if($hashlist{"$hash.$suffix"} eq $fprint) {
++				   print STDERR "WARNING: Skipping duplicate certificate $fname\n";
++				   unlink $tfile;
++				   next OUTERLOOP;
++			   }
++			   $suffix++;
++		   }
++		   $hash .= ".$suffix";
++		   print "$fname => $hash\n";
++		   $symlink_exists=eval {symlink("",""); 1};
++		   if ($symlink_exists) {
++			   symlink $fname, $hash;
++		   } else {
++			   open IN,"<$tfile" or die "can't open $tfile for read";
++			   open OUT,">$hash" or die "can't open $hash for write";
++			   print OUT <IN>;	# does the job for small text files
++			   close OUT;
++			   close IN;
++		   }
++		   $hashlist{$hash} = $fprint;
++		   unlink $tfile;
++		} ## end while ($cert =~ /^(-----BEGIN ...
+ }
+ 
+ sub link_hash_cert_old {
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/ca.patch
similarity index 93%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/ca.patch
index aba4d42..569329d 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/ca.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 Index: openssl-0.9.8m/apps/CA.pl.in
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/config-hurd.patch
new file mode 100644
index 0000000..8fdfc6c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/config-hurd.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.0c/config
+===================================================================
+--- openssl-1.0.0c.orig/config	2010-12-12 16:09:43.000000000 +0100
++++ openssl-1.0.0c/config	2010-12-12 16:09:48.000000000 +0100
+@@ -170,8 +170,8 @@
+ 	echo "${MACHINE}-whatever-linux1"; exit 0
+ 	;;
+ 
+-    GNU*)
+-	echo "hurd-x86"; exit 0;
++    GNU:*|GNU/*:*)
++	echo "${MACHINE}-gnuish"; exit 0;
+ 	;;
+ 
+     LynxOS:*)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/debian-targets.patch
new file mode 100644
index 0000000..86703d0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/debian-targets.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.1/Configure
+===================================================================
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
+ "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
+ "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
+ 
++# Debian GNU/* (various architectures)
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
++"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mtune=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
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
++"debian-sparc","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=v8 -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv8_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=v9 -Wa,-Av8plus -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc64","gcc:-m64 -DB_ENDIAN -DTERMIO ${debian_cflags} -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++
+ ####
+ #### Variety of LINUX:-)
+ ####
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/default_bits.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/default_bits.patch
new file mode 100644
index 0000000..1f10926
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/default_bits.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- openssl/apps/openssl.cnf	2012-06-06 00:51:47.000000000 +0200
++++ openssl/apps/openssl.cnf	2012-06-06 00:53:48.000000000 +0200
+@@ -105,7 +105,7 @@
+ 
+ ####################################################################
+ [ req ]
+-default_bits		= 1024
++default_bits		= 2048
+ default_keyfile 	= privkey.pem
+ distinguished_name	= req_distinguished_name
+ attributes		= req_attributes
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/dgst_hmac.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/dgst_hmac.patch
new file mode 100644
index 0000000..3b67dda
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/dgst_hmac.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+From: Thorsten Glaser <tg@mirbsd.de>
+Date: Fri, 22 May 2009 16:28:05 +0000 (UTC)
+Subject: Document openssl dgst -hmac option
+
+I've committed the thing below in MirBSD; since the apps code
+changes very little between OpenSSL versions, it will probably
+apply to the Debian package as well. I'm open for better wor-
+ding though, especially considering the FIPS option, which I
+found as undocumented too.
+
+Index: openssl-1.0.0d/doc/apps/dgst.pod
+===================================================================
+--- openssl-1.0.0d.orig/doc/apps/dgst.pod	2009-04-10 16:42:27.000000000 +0000
++++ openssl-1.0.0d/doc/apps/dgst.pod	2011-06-13 11:00:04.000000000 +0000
+@@ -12,6 +12,8 @@
+ [B<-d>]
+ [B<-hex>]
+ [B<-binary>]
++[B<-hmac arg>]
++[B<-non-fips-allow>]
+ [B<-out filename>]
+ [B<-sign filename>]
+ [B<-keyform arg>]
+@@ -54,6 +56,14 @@
+ 
+ output the digest or signature in binary form.
+ 
++=item B<-hmac arg>
++
++set the HMAC key to "arg".
++
++=item B<-non-fips-allow>
++
++allow use of non FIPS digest.
++
+ =item B<-out filename>
+ 
+ filename to output to, or standard output by default.
+Index: openssl-1.0.0d/apps/dgst.c
+===================================================================
+--- openssl-1.0.0d.orig/apps/dgst.c	2010-02-12 17:07:24.000000000 +0000
++++ openssl-1.0.0d/apps/dgst.c	2011-06-13 11:00:04.000000000 +0000
+@@ -268,6 +268,8 @@
+ 		BIO_printf(bio_err,"-d              to output debug info\n");
+ 		BIO_printf(bio_err,"-hex            output as hex dump\n");
+ 		BIO_printf(bio_err,"-binary         output in binary form\n");
++		BIO_printf(bio_err,"-hmac arg       set the HMAC key to arg\n");
++		BIO_printf(bio_err,"-non-fips-allow allow use of non FIPS digest\n");
+ 		BIO_printf(bio_err,"-sign   file    sign digest using private key in file\n");
+ 		BIO_printf(bio_err,"-verify file    verify a signature using public key in file\n");
+ 		BIO_printf(bio_err,"-prverify file  verify a signature using private key in file\n");
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/gnu_source.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/gnu_source.patch
new file mode 100644
index 0000000..fe159e7
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/gnu_source.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+From: Kurt Roeckx <kurt@roeckx.be>
+Subject: Always define _GNU_SOURCE
+
+We need this atleast for kfreebsd because they also use glibc.
+There shouldn't be a problem defining this on systems not using
+glibc.
+
+Index: openssl-1.0.0c.obsolete.0.297891860202984/crypto/dso/dso_dlfcn.c
+===================================================================
+--- openssl-1.0.0c.obsolete.0.297891860202984.orig/crypto/dso/dso_dlfcn.c	2010-12-19 16:18:36.000000000 +0100
++++ openssl-1.0.0c.obsolete.0.297891860202984/crypto/dso/dso_dlfcn.c	2010-12-19 16:19:01.000000000 +0100
+@@ -60,10 +60,8 @@
+    that handle _GNU_SOURCE and other similar macros.  Defining it later
+    is simply too late, because those headers are protected from re-
+    inclusion.  */
+-#ifdef __linux
+-# ifndef _GNU_SOURCE
+-#  define _GNU_SOURCE	/* make sure dladdr is declared */
+-# endif
++#ifndef _GNU_SOURCE
++# define _GNU_SOURCE	/* make sure dladdr is declared */
+ #endif
+ 
+ #include <stdio.h>
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libdoc-manpgs-pod-spell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libdoc-manpgs-pod-spell.patch
new file mode 100644
index 0000000..99f6728
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libdoc-manpgs-pod-spell.patch
@@ -0,0 +1,239 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/doc/crypto/ASN1_generate_nconf.pod
++++ b/doc/crypto/ASN1_generate_nconf.pod
+@@ -61,7 +61,7 @@
+ =item B<INTEGER>, B<INT>
+ 
+ Encodes an ASN1 B<INTEGER> type. The B<value> string represents
+-the value of the integer, it can be preceeded by a minus sign and
++the value of the integer, it can be preceded by a minus sign and
+ is normally interpreted as a decimal value unless the prefix B<0x>
+ is included.
+ 
+--- a/doc/crypto/BN_BLINDING_new.pod
++++ b/doc/crypto/BN_BLINDING_new.pod
+@@ -48,7 +48,7 @@
+ 
+ BN_BLINDING_convert_ex() multiplies B<n> with the blinding factor B<A>.
+ If B<r> is not NULL a copy the inverse blinding factor B<Ai> will be
+-returned in B<r> (this is useful if a B<RSA> object is shared amoung
++returned in B<r> (this is useful if a B<RSA> object is shared among
+ several threads). BN_BLINDING_invert_ex() multiplies B<n> with the
+ inverse blinding factor B<Ai>. If B<r> is not NULL it will be used as
+ the inverse blinding.
+--- a/doc/crypto/EVP_BytesToKey.pod
++++ b/doc/crypto/EVP_BytesToKey.pod
+@@ -17,7 +17,7 @@
+ 
+ EVP_BytesToKey() derives a key and IV from various parameters. B<type> is
+ the cipher to derive the key and IV for. B<md> is the message digest to use.
+-The B<salt> paramter is used as a salt in the derivation: it should point to
++The B<salt> parameter is used as a salt in the derivation: it should point to
+ an 8 byte buffer or NULL if no salt is used. B<data> is a buffer containing
+ B<datal> bytes which is used to derive the keying data. B<count> is the
+ iteration count to use. The derived key and IV will be written to B<key>
+--- a/doc/crypto/EVP_EncryptInit.pod
++++ b/doc/crypto/EVP_EncryptInit.pod
+@@ -152,7 +152,7 @@
+ 
+ EVP_EncryptInit(), EVP_DecryptInit() and EVP_CipherInit() behave in a
+ similar way to EVP_EncryptInit_ex(), EVP_DecryptInit_ex and
+-EVP_CipherInit_ex() except the B<ctx> paramter does not need to be
++EVP_CipherInit_ex() except the B<ctx> parameter does not need to be
+ initialized and they always use the default cipher implementation.
+ 
+ EVP_EncryptFinal(), EVP_DecryptFinal() and EVP_CipherFinal() behave in a
+--- a/doc/crypto/EVP_PKEY_cmp.pod
++++ b/doc/crypto/EVP_PKEY_cmp.pod
+@@ -26,7 +26,7 @@
+ The funcion EVP_PKEY_cmp_parameters() compares the parameters of keys
+ B<a> and B<b>.
+ 
+-The funcion EVP_PKEY_cmp() compares the public key components and paramters
++The funcion EVP_PKEY_cmp() compares the public key components and parameters
+ (if present) of keys B<a> and B<b>.
+ 
+ =head1 NOTES
+--- a/doc/crypto/X509_STORE_CTX_get_error.pod
++++ b/doc/crypto/X509_STORE_CTX_get_error.pod
+@@ -278,6 +278,8 @@
+ an application specific error. This will never be returned unless explicitly
+ set by an application.
+ 
++=back
++
+ =head1 NOTES
+ 
+ The above functions should be used instead of directly referencing the fields
+--- a/doc/crypto/pem.pod
++++ b/doc/crypto/pem.pod
+@@ -201,7 +201,7 @@
+ PEM_write_bio_PKCS8PrivateKey() and PEM_write_PKCS8PrivateKey()
+ write a private key in an EVP_PKEY structure in PKCS#8
+ EncryptedPrivateKeyInfo format using PKCS#5 v2.0 password based encryption
+-algorithms. The B<cipher> argument specifies the encryption algoritm to
++algorithms. The B<cipher> argument specifies the encryption algorithm to
+ use: unlike all other PEM routines the encryption is applied at the
+ PKCS#8 level and not in the PEM headers. If B<cipher> is NULL then no
+ encryption is used and a PKCS#8 PrivateKeyInfo structure is used instead.
+--- a/doc/ssl/SSL_CTX_set_client_CA_list.pod
++++ b/doc/ssl/SSL_CTX_set_client_CA_list.pod
+@@ -70,6 +70,10 @@
+ 
+ The operation succeeded.
+ 
++=back
++
++=over 4
++
+ =item 0
+ 
+ A failure while manipulating the STACK_OF(X509_NAME) object occurred or
+--- a/doc/ssl/SSL_CTX_set_verify.pod
++++ b/doc/ssl/SSL_CTX_set_verify.pod
+@@ -169,8 +169,8 @@
+ failure, if wished. The callback realizes a verification depth limit with
+ more informational output.
+ 
+-All verification errors are printed, informations about the certificate chain
+-are printed on request.
++All verification errors are printed; information about the certificate chain
++is printed on request.
+ The example is realized for a server that does allow but not require client
+ certificates.
+ 
+--- a/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
++++ b/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
+@@ -81,6 +81,8 @@
+ 
+ Return values from the server callback are interpreted as follows:
+ 
++=over 4
++
+ =item > 0
+ 
+ PSK identity was found and the server callback has provided the PSK
+@@ -94,9 +96,15 @@
+ connection will fail with decryption_error before it will be finished
+ completely.
+ 
++=back
++
++=over 4
++
+ =item 0
+ 
+ PSK identity was not found. An "unknown_psk_identity" alert message
+ will be sent and the connection setup fails.
+ 
++=back
++
+ =cut
+--- a/doc/ssl/SSL_accept.pod
++++ b/doc/ssl/SSL_accept.pod
+@@ -49,12 +49,20 @@
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+ 
++=back
++
++=over 4
++
+ =item 0
+ 
+ The TLS/SSL handshake was not successful but was shut down controlled and
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+ return value B<ret> to find out the reason.
+ 
++=back
++
++=over 4
++
+ =item E<lt>0
+ 
+ The TLS/SSL handshake was not successful because a fatal error occurred either
+--- a/doc/ssl/SSL_connect.pod
++++ b/doc/ssl/SSL_connect.pod
+@@ -41,10 +41,13 @@
+ 
+ =over 4
+ 
+-=item 1
++=item E<lt>0
+ 
+-The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+-established.
++The TLS/SSL handshake was not successful, because a fatal error occurred either
++at the protocol level or a connection failure occurred. The shutdown was
++not clean. It can also occur of action is need to continue the operation
++for non-blocking BIOs. Call SSL_get_error() with the return value B<ret>
++to find out the reason.
+ 
+ =item 0
+ 
+@@ -52,13 +55,10 @@
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+ return value B<ret> to find out the reason.
+ 
+-=item E<lt>0
++=item 1
+ 
+-The TLS/SSL handshake was not successful, because a fatal error occurred either
+-at the protocol level or a connection failure occurred. The shutdown was
+-not clean. It can also occur of action is need to continue the operation
+-for non-blocking BIOs. Call SSL_get_error() with the return value B<ret>
+-to find out the reason.
++The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
++established.
+ 
+ =back
+ 
+--- a/doc/ssl/SSL_do_handshake.pod
++++ b/doc/ssl/SSL_do_handshake.pod
+@@ -50,12 +50,20 @@
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+ 
++=back
++
++=over 4
++
+ =item 0
+ 
+ The TLS/SSL handshake was not successful but was shut down controlled and
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+ return value B<ret> to find out the reason.
+ 
++=back
++
++=over 4
++
+ =item E<lt>0
+ 
+ The TLS/SSL handshake was not successful because a fatal error occurred either
+--- a/doc/ssl/SSL_shutdown.pod
++++ b/doc/ssl/SSL_shutdown.pod
+@@ -97,6 +97,10 @@
+ The shutdown was successfully completed. The "close notify" alert was sent
+ and the peer's "close notify" alert was received.
+ 
++=back
++
++=over 4
++
+ =item 0
+ 
+ The shutdown is not yet finished. Call SSL_shutdown() for a second time,
+@@ -104,6 +108,10 @@
+ The output of L<SSL_get_error(3)|SSL_get_error(3)> may be misleading, as an
+ erroneous SSL_ERROR_SYSCALL may be flagged even though no error occurred.
+ 
++=back
++
++=over 4
++
+ =item -1
+ 
+ The shutdown was not successful because a fatal error occurred either
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libssl-misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libssl-misspell.patch
new file mode 100644
index 0000000..e072b2f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libssl-misspell.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/crypto/asn1/asn1_err.c
++++ b/crypto/asn1/asn1_err.c
+@@ -302,7 +302,7 @@
+ {ERR_REASON(ASN1_R_UNKNOWN_PUBLIC_KEY_TYPE),"unknown public key type"},
+ {ERR_REASON(ASN1_R_UNKNOWN_SIGNATURE_ALGORITHM),"unknown signature algorithm"},
+ {ERR_REASON(ASN1_R_UNKNOWN_TAG)          ,"unknown tag"},
+-{ERR_REASON(ASN1_R_UNKOWN_FORMAT)        ,"unkown format"},
++{ERR_REASON(ASN1_R_UNKOWN_FORMAT)        ,"unknown format"},
+ {ERR_REASON(ASN1_R_UNSUPPORTED_ANY_DEFINED_BY_TYPE),"unsupported any defined by type"},
+ {ERR_REASON(ASN1_R_UNSUPPORTED_CIPHER)   ,"unsupported cipher"},
+ {ERR_REASON(ASN1_R_UNSUPPORTED_ENCRYPTION_ALGORITHM),"unsupported encryption algorithm"},
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/make-targets.patch
similarity index 46%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/make-targets.patch
index f7a6dfd..dc7288a 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/make-targets.patch
@@ -1,12 +1,13 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
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
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-dir.patch
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-dir.patch
index 4085e3b..8e79ccd 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-dir.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 Index: openssl-1.0.0c/Makefile.org
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-section.patch
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-section.patch
index e8b9268..bf286fb 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/man-section.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 Index: openssl-1.0.0c/Makefile.org
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-rpath.patch
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-rpath.patch
index 1ccb3b8..2b1af7d 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-rpath.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 Index: openssl-1.0.0c/Makefile.shared
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-symbolic.patch
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-symbolic.patch
index cc4408a..11cda48 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/no-symbolic.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
 Index: openssl-1.0.0c/Makefile.shared
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/openssl-pod-misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/openssl-pod-misspell.patch
new file mode 100644
index 0000000..d2f6042
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/openssl-pod-misspell.patch
@@ -0,0 +1,125 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.1/apps/ca.c
+===================================================================
+--- openssl-1.0.1.orig/apps/ca.c	2012-01-12 16:28:02.000000000 +0000
++++ openssl-1.0.1/apps/ca.c	2012-03-17 09:31:48.000000000 +0000
+@@ -148,7 +148,7 @@
+ static const char *ca_usage[]={
+ "usage: ca args\n",
+ "\n",
+-" -verbose        - Talk alot while doing things\n",
++" -verbose        - Talk a lot while doing things\n",
+ " -config file    - A config file\n",
+ " -name arg       - The particular CA definition to use\n",
+ " -gencrl         - Generate a new CRL\n",
+Index: openssl-1.0.1/apps/ecparam.c
+===================================================================
+--- openssl-1.0.1.orig/apps/ecparam.c	2010-06-15 17:25:02.000000000 +0000
++++ openssl-1.0.1/apps/ecparam.c	2012-03-17 09:31:48.000000000 +0000
+@@ -105,7 +105,7 @@
+  *                    in the asn1 der encoding
+  *                    possible values: named_curve (default)
+  *                                     explicit
+- * -no_seed         - if 'explicit' parameters are choosen do not use the seed
++ * -no_seed         - if 'explicit' parameters are chosen do not use the seed
+  * -genkey          - generate ec key
+  * -rand file       - files to use for random number input
+  * -engine e        - use engine e, possibly a hardware device
+@@ -286,7 +286,7 @@
+ 		BIO_printf(bio_err, "                                   "
+ 				" explicit\n");
+ 		BIO_printf(bio_err, " -no_seed          if 'explicit'"
+-				" parameters are choosen do not"
++				" parameters are chosen do not"
+ 				" use the seed\n");
+ 		BIO_printf(bio_err, " -genkey           generate ec"
+ 				" key\n");
+Index: openssl-1.0.1/crypto/evp/encode.c
+===================================================================
+--- openssl-1.0.1.orig/crypto/evp/encode.c	2010-06-15 17:25:09.000000000 +0000
++++ openssl-1.0.1/crypto/evp/encode.c	2012-03-17 09:31:48.000000000 +0000
+@@ -250,7 +250,7 @@
+ 	/* We parse the input data */
+ 	for (i=0; i<inl; i++)
+ 		{
+-		/* If the current line is > 80 characters, scream alot */
++		/* If the current line is > 80 characters, scream a lot */
+ 		if (ln >= 80) { rv= -1; goto end; }
+ 
+ 		/* Get char and put it into the buffer */
+Index: openssl-1.0.1/doc/apps/config.pod
+===================================================================
+--- openssl-1.0.1.orig/doc/apps/config.pod	2004-11-25 17:47:29.000000000 +0000
++++ openssl-1.0.1/doc/apps/config.pod	2012-03-17 09:31:48.000000000 +0000
+@@ -119,7 +119,7 @@
+ information.
+ 
+ The section pointed to by B<engines> is a table of engine names (though see
+-B<engine_id> below) and further sections containing configuration informations
++B<engine_id> below) and further sections containing configuration information
+ specific to each ENGINE.
+ 
+ Each ENGINE specific section is used to set default algorithms, load
+Index: openssl-1.0.1/doc/apps/req.pod
+===================================================================
+--- openssl-1.0.1.orig/doc/apps/req.pod	2009-04-10 16:42:28.000000000 +0000
++++ openssl-1.0.1/doc/apps/req.pod	2012-03-17 09:31:48.000000000 +0000
+@@ -159,7 +159,7 @@
+ the algorithm is determined by the parameters. B<algname:file> use algorithm
+ B<algname> and parameter file B<file>: the two algorithms must match or an
+ error occurs. B<algname> just uses algorithm B<algname>, and parameters,
+-if neccessary should be specified via B<-pkeyopt> parameter.
++if necessary should be specified via B<-pkeyopt> parameter.
+ 
+ B<dsa:filename> generates a DSA key using the parameters
+ in the file B<filename>. B<ec:filename> generates EC key (usable both with
+Index: openssl-1.0.1/doc/apps/ts.pod
+===================================================================
+--- openssl-1.0.1.orig/doc/apps/ts.pod	2009-04-10 11:25:54.000000000 +0000
++++ openssl-1.0.1/doc/apps/ts.pod	2012-03-17 09:31:48.000000000 +0000
+@@ -352,7 +352,7 @@
+ 
+ This is the main section and it specifies the name of another section
+ that contains all the options for the B<-reply> command. This default
+-section can be overriden with the B<-section> command line switch. (Optional)
++section can be overridden with the B<-section> command line switch. (Optional)
+ 
+ =item B<oid_file>
+ 
+@@ -453,7 +453,7 @@
+ =head1 ENVIRONMENT VARIABLES
+ 
+ B<OPENSSL_CONF> contains the path of the configuration file and can be
+-overriden by the B<-config> command line option.
++overridden by the B<-config> command line option.
+ 
+ =head1 EXAMPLES
+ 
+Index: openssl-1.0.1/doc/apps/tsget.pod
+===================================================================
+--- openssl-1.0.1.orig/doc/apps/tsget.pod	2010-01-05 17:17:20.000000000 +0000
++++ openssl-1.0.1/doc/apps/tsget.pod	2012-03-17 09:31:48.000000000 +0000
+@@ -124,7 +124,7 @@
+ =item [request]...
+ 
+ List of files containing B<RFC 3161> DER-encoded time stamp requests. If no
+-requests are specifed only one request will be sent to the server and it will be
++requests are specified only one request will be sent to the server and it will be
+ read from the standard input. (Optional)
+ 
+ =back
+Index: openssl-1.0.1/doc/apps/x509v3_config.pod
+===================================================================
+--- openssl-1.0.1.orig/doc/apps/x509v3_config.pod	2006-11-07 13:44:03.000000000 +0000
++++ openssl-1.0.1/doc/apps/x509v3_config.pod	2012-03-17 09:31:48.000000000 +0000
+@@ -174,7 +174,7 @@
+ 
+ The value of B<dirName> should point to a section containing the distinguished
+ name to use as a set of name value pairs. Multi values AVAs can be formed by
+-preceeding the name with a B<+> character.
++preceding the name with a B<+> character.
+ 
+ otherName can include arbitrary data associated with an OID: the value
+ should be the OID followed by a semicolon and the content in standard
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pic.patch
new file mode 100644
index 0000000..33304e5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pic.patch
@@ -0,0 +1,178 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.1c/crypto/des/asm/desboth.pl
+===================================================================
+--- openssl-1.0.1c.orig/crypto/des/asm/desboth.pl	2001-10-24 23:20:56.000000000 +0200
++++ openssl-1.0.1c/crypto/des/asm/desboth.pl	2012-07-29 14:15:26.000000000 +0200
+@@ -16,6 +16,11 @@
+ 
+ 	&push("edi");
+ 
++	&call   (&label("pic_point0"));
++	&set_label("pic_point0");
++	&blindpop("ebp");
++	&add    ("ebp", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
++
+ 	&comment("");
+ 	&comment("Load the data words");
+ 	&mov($L,&DWP(0,"ebx","",0));
+@@ -47,15 +52,21 @@
+ 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
+ 	&mov(&swtmp(1),	"eax");
+ 	&mov(&swtmp(0),	"ebx");
+-	&call("DES_encrypt2");
++	&exch("ebx", "ebp");
++	&call("DES_encrypt2\@PLT");
++	&exch("ebx", "ebp");
+ 	&mov(&swtmp(2),	(DWC(($enc)?"0":"1")));
+ 	&mov(&swtmp(1),	"edi");
+ 	&mov(&swtmp(0),	"ebx");
+-	&call("DES_encrypt2");
++	&exch("ebx", "ebp");
++	&call("DES_encrypt2\@PLT");
++	&exch("ebx", "ebp");
+ 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
+ 	&mov(&swtmp(1),	"esi");
+ 	&mov(&swtmp(0),	"ebx");
+-	&call("DES_encrypt2");
++	&exch("ebx", "ebp");
++	&call("DES_encrypt2\@PLT");
++	&exch("ebx", "ebp");
+ 
+ 	&stack_pop(3);
+ 	&mov($L,&DWP(0,"ebx","",0));
+Index: openssl-1.0.1c/crypto/perlasm/cbc.pl
+===================================================================
+--- openssl-1.0.1c.orig/crypto/perlasm/cbc.pl	2011-07-13 08:22:46.000000000 +0200
++++ openssl-1.0.1c/crypto/perlasm/cbc.pl	2012-07-29 14:15:26.000000000 +0200
+@@ -122,7 +122,11 @@
+ 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
+ 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
+ 
+-	&call($enc_func);
++	&call	(&label("pic_point0"));
++	&set_label("pic_point0");
++	&blindpop("ebx");
++	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
++	&call("$enc_func\@PLT");
+ 
+ 	&mov("eax",	&DWP($data_off,"esp","",0));
+ 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
+@@ -185,7 +189,11 @@
+ 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
+ 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
+ 
+-	&call($enc_func);
++	&call	(&label("pic_point1"));
++	&set_label("pic_point1");
++	&blindpop("ebx");
++	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point1") . "]");
++	&call("$enc_func\@PLT");
+ 
+ 	&mov("eax",	&DWP($data_off,"esp","",0));
+ 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
+@@ -218,7 +226,11 @@
+ 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
+ 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
+ 
+-	&call($dec_func);
++	&call	(&label("pic_point2"));
++	&set_label("pic_point2");
++	&blindpop("ebx");
++	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point2") . "]");
++	&call("$dec_func\@PLT");
+ 
+ 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
+ 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
+@@ -261,7 +273,11 @@
+ 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
+ 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
+ 
+-	&call($dec_func);
++	&call	(&label("pic_point3"));
++	&set_label("pic_point3");
++	&blindpop("ebx");
++	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point3") . "]");
++	&call("$dec_func\@PLT");
+ 
+ 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
+ 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
+Index: openssl-1.0.1c/crypto/perlasm/x86gas.pl
+===================================================================
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
+     {	$initseg.=<<___;
+ .section	.init
++___
++        if ($::pic)
++	{   $initseg.=<<___;
++	pushl	%ebx
++	call	.pic_point0
++.pic_point0:
++	popl	%ebx
++	addl	\$_GLOBAL_OFFSET_TABLE_+[.-.pic_point0],%ebx
++	call	$f\@PLT
++	popl	%ebx
++___
++	}
++	else
++	{   $initseg.=<<___;
+ 	call	$f
+ ___
++	}
+     }
+     elsif ($::coff)
+     {   $initseg.=<<___;	# applies to both Cygwin and Mingw
+Index: openssl-1.0.1c/crypto/x86cpuid.pl
+===================================================================
+--- openssl-1.0.1c.orig/crypto/x86cpuid.pl	2012-02-28 15:20:34.000000000 +0100
++++ openssl-1.0.1c/crypto/x86cpuid.pl	2012-07-29 14:15:26.000000000 +0200
+@@ -8,6 +8,8 @@
+ 
+ for (@ARGV) { $sse2=1 if (/-DOPENSSL_IA32_SSE2/); }
+ 
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
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pkcs12-doc.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pkcs12-doc.patch
new file mode 100644
index 0000000..00240ac
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pkcs12-doc.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+This is another documentation issue ...
+
+apps/pkcs12.c accepts -password as an argument.  The document author 
+almost certainly meant to write "-password, -passin".
+
+However, that is not correct, either.  Actually the code treats 
+-password as equivalent to -passin, EXCEPT when -export is also 
+specified, in which case -password as equivalent to -passout.  The patch 
+below makes this explicit.
+
+
+Index: openssl-1.0.0d/doc/apps/pkcs12.pod
+===================================================================
+--- openssl-1.0.0d.orig/doc/apps/pkcs12.pod	2011-06-13 10:46:06.000000000 +0000
++++ openssl-1.0.0d/doc/apps/pkcs12.pod	2011-06-13 10:47:36.000000000 +0000
+@@ -67,7 +67,7 @@
+ The filename to write certificates and private keys to, standard output by
+ default.  They are all written in PEM format.
+ 
+-=item B<-pass arg>, B<-passin arg>
++=item B<-passin arg>
+ 
+ the PKCS#12 file (i.e. input file) password source. For more information about
+ the format of B<arg> see the B<PASS PHRASE ARGUMENTS> section in
+@@ -79,6 +79,11 @@
+ information about the format of B<arg> see the B<PASS PHRASE ARGUMENTS> section
+ in L<openssl(1)|openssl(1)>.
+ 
++=item B<-password arg>
++
++With -export, -password is equivalent to -passout.
++Otherwise, -password is equivalent to -passin.
++
+ =item B<-noout>
+ 
+ this option inhibits output of the keys and certificates to the output file
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_ec.misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_ec.misspell.patch
new file mode 100644
index 0000000..f146c0b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_ec.misspell.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/doc/apps/ec.pod
++++ b/doc/apps/ec.pod
+@@ -41,7 +41,7 @@
+ 
+ This specifies the input format. The B<DER> option with a private key uses
+ an ASN.1 DER encoded SEC1 private key. When used with a public key it
+-uses the SubjectPublicKeyInfo structur as specified in RFC 3280.
++uses the SubjectPublicKeyInfo structure as specified in RFC 3280.
+ The B<PEM> form is the default format: it consists of the B<DER> format base64
+ encoded with additional header and footer lines. In the case of a private key
+ PKCS#8 format is also accepted.
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_pksc12.misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_pksc12.misspell.patch
new file mode 100644
index 0000000..2d9293b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_pksc12.misspell.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/doc/apps/pkcs12.pod
++++ b/doc/apps/pkcs12.pod
+@@ -75,7 +75,7 @@
+ 
+ =item B<-passout arg>
+ 
+-pass phrase source to encrypt any outputed private keys with. For more
++pass phrase source to encrypt any outputted private keys with. For more
+ information about the format of B<arg> see the B<PASS PHRASE ARGUMENTS> section
+ in L<openssl(1)|openssl(1)>.
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_req_misspell2.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_req_misspell2.patch
new file mode 100644
index 0000000..1d0ec52
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_req_misspell2.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+diff --git a/doc/apps/req.pod b/doc/apps/req.pod
+--- a/doc/apps/req.pod
++++ b/doc/apps/req.pod
+@@ -303,7 +303,7 @@
+ 
+ =item B<-newhdr>
+ 
+-Adds the word B<NEW> to the PEM file header and footer lines on the outputed
++Adds the word B<NEW> to the PEM file header and footer lines on the outputted
+ request. Some software (Netscape certificate server) and some CAs need this.
+ 
+ =item B<-batch>
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_s_server.misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_s_server.misspell.patch
new file mode 100644
index 0000000..849cdc2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_s_server.misspell.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/doc/apps/s_server.pod
++++ b/doc/apps/s_server.pod
+@@ -111,7 +111,7 @@
+ 
+ =item B<-dcertform format>, B<-dkeyform format>, B<-dpass arg>
+ 
+-addtional certificate and private key format and passphrase respectively.
++additional certificate and private key format and passphrase respectively.
+ 
+ =item B<-nocert>
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_x509setflags.misspell.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_x509setflags.misspell.patch
new file mode 100644
index 0000000..a0a2cee
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_x509setflags.misspell.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/doc/crypto/X509_VERIFY_PARAM_set_flags.pod
++++ b/doc/crypto/X509_VERIFY_PARAM_set_flags.pod
+@@ -113,7 +113,7 @@
+ to examine the valid policy tree and perform additional checks or simply
+ log it for debugging purposes.
+ 
+-By default some addtional features such as indirect CRLs and CRLs signed by
++By default some additional features such as indirect CRLs and CRLs signed by
+ different keys are disabled. If B<X509_V_FLAG_EXTENDED_CRL_SUPPORT> is set
+ they are enabled.
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash-crt.patch
new file mode 100644
index 0000000..73bf25c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash-crt.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.0c/tools/c_rehash.in
+===================================================================
+--- openssl-1.0.0c.orig/tools/c_rehash.in	2010-04-15 01:07:28.000000000 +0200
++++ openssl-1.0.0c/tools/c_rehash.in	2010-12-12 17:10:51.000000000 +0100
+@@ -75,12 +75,15 @@
+ 		}
+ 	}
+ 	closedir DIR;
+-	FILE: foreach $fname (grep {/\.pem$/} @flist) {
++	FILE: foreach $fname (grep {/\.pem$|\.crt$/} @flist) {
+ 		# Check to see if certificates and/or CRLs present.
+ 		my ($cert, $crl) = check_file($fname);
+ 		if(!$cert && !$crl) {
+-			print STDERR "WARNING: $fname does not contain a certificate or CRL: skipping\n";
+-			next;
++			($cert, $crl) = check_file("$openssl x509 -in \"$fname\" -inform der  -outform pem | ");
++			if(!$cert && !$crl) {
++				print STDERR "WARNING: $fname does not contain a certificate or CRL: skipping\n";
++				next;
++			}
+ 		}
+ 		link_hash_cert($fname) if($cert);
+ 		link_hash_crl($fname) if($crl);
+@@ -153,6 +156,9 @@
+ 		my $fname = $_[0];
+ 		$fname =~ s/'/'\\''/g;
+ 		my ($hash, $fprint) = `"$openssl" crl -hash -fingerprint -noout -in '$fname'`;
++		if(!$hash || !fprint) {
++			($hash, $fprint) = `"$openssl" crl -hash -fingerprint -noout -in '$fname' -inform der`;
++		}
+ 		chomp $hash;
+ 		chomp $fprint;
+ 		$fprint =~ s/^.*=//;
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash_pod.patch
new file mode 100644
index 0000000..8187aae
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash_pod.patch
@@ -0,0 +1,63 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-0.9.8k/doc/apps/c_rehash.pod
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ openssl-0.9.8k/doc/apps/c_rehash.pod	2009-07-19 11:36:27.000000000 +0200
+@@ -0,0 +1,55 @@
++
++=pod
++
++=head1 NAME
++
++c_rehash - Create symbolic links to files named by the hash values
++
++=head1 SYNOPSIS
++
++B<c_rehash>
++[directory] ...
++
++=head1 DESCRIPTION
++
++c_rehash scans directories and takes a hash value of each .pem and .crt file in the directory. It then creates symbolic links for each of the files named by the hash value. This is useful as many programs require directories to be set up like this in order to find the certificates they require. 
++
++If any directories are named on the command line then these directories are processed in turn. If not then and the environment variable SSL_CERT_DIR is defined then that is consulted. This variable should be a colon (:) separated list of directories, all of which will be processed. If neither of these conditions are true then /usr/lib/ssl/certs is processed. 
++
++For each directory that is to be processed he user must have write permissions on the directory, if they do not then nothing will be printed for that directory.
++
++Note that this program deletes all the symbolic links that look like ones that it creates before processing a directory. Beware that if you run the program on a directory that contains symbolic links for other purposes that are named in the same format as those created by this program they will be lost.
++
++The hashes for certificate files are of the form <hash>.<n> where n is an integer. If the hash value already exists then n will be incremented, unless the file is a duplicate. Duplicates are detected using the fingerprint of the certificate. A warning will be printed if a duplicate is detected. The hashes for CRL files are of the form <hash>.r<n> and have the same behavior.
++
++The program will also warn if there are files with extension .pem which are not certificate or CRL files.
++
++The program uses the openssl program to compute the hashes and fingerprints. It expects the executable to be named openssl and be on the PATH, or in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is defined then this is used instead as the executable that provides the hashes and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -in $file it must output the hash of $file on the first line followed by the fingerprint on the second line, optionally prefixed with some text and an equals sign (=). 
++
++=head1 OPTIONS
++
++None
++
++=head1 ENVIRONMENT
++
++=over 4
++
++=item B<OPENSSL>
++
++The name (and path) of an executable to use to generate hashes and fingerprints (see above).
++
++=item B<SSL_CERT_DIR>
++
++Colon separated list of directories to operate on. Ignored if directories are listed on the command line.
++
++=back
++
++=head1 SEE ALSO
++
++L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
++
++=head1 BUGS
++
++No known bugs
++
++=cut
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/renegiotate_tls.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/renegiotate_tls.patch
new file mode 100644
index 0000000..6dfda22
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/renegiotate_tls.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+--- openssl/ssl/s3_pkt.c	2012/04/17 13:21:19	1.95
++++ openssl/ssl/s3_pkt.c	2012/05/11 13:34:29	1.96
+@@ -744,6 +744,7 @@
+ 	 * bytes and record version number > TLS 1.0
+ 	 */
+ 	if (s->state == SSL3_ST_CW_CLNT_HELLO_B
++				&& !s->renegotiate
+ 				&& TLS1_get_version(s) > TLS1_VERSION)
+ 		*(p++) = 0x1;
+ 	else
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/shared-lib-ext.patch
new file mode 100644
index 0000000..0b7c426
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/shared-lib-ext.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.0c/Configure
+===================================================================
+--- openssl-1.0.0c.orig/Configure	2010-12-12 16:10:12.000000000 +0100
++++ openssl-1.0.0c/Configure	2010-12-12 17:12:38.000000000 +0100
+@@ -1605,7 +1605,8 @@
+ 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
+ 		{
+ 		my $sotmp = $1;
+-		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
++#		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
++		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp/;
+ 		}
+ 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.[^\.]*\.[^\.]*\.dylib$/)
+ 		{
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/stddef.patch
new file mode 100644
index 0000000..026a84d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/stddef.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-0.9.8k/crypto/sha/sha.h
+===================================================================
+--- openssl-0.9.8k.orig/crypto/sha/sha.h	2008-09-16 12:47:28.000000000 +0200
++++ openssl-0.9.8k/crypto/sha/sha.h	2009-07-19 11:36:28.000000000 +0200
+@@ -59,6 +59,7 @@
+ #ifndef HEADER_SHA_H
+ #define HEADER_SHA_H
+ 
++#include <stddef.h>
+ #include <openssl/e_os2.h>
+ #include <stddef.h>
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/valgrind.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/valgrind.patch
new file mode 100644
index 0000000..93670fb
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/valgrind.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
+
+Index: openssl-1.0.0c/crypto/rand/md_rand.c
+===================================================================
+--- openssl-1.0.0c.orig/crypto/rand/md_rand.c	2010-06-16 15:17:22.000000000 +0200
++++ openssl-1.0.0c/crypto/rand/md_rand.c	2010-12-12 17:02:50.000000000 +0100
+@@ -476,6 +476,7 @@
+ 		MD_Update(&m,(unsigned char *)&(md_c[0]),sizeof(md_c));
+ 
+ #ifndef PURIFY /* purify complains */
++#if 0
+ 		/* The following line uses the supplied buffer as a small
+ 		 * source of entropy: since this buffer is often uninitialised
+ 		 * it may cause programs such as purify or valgrind to
+@@ -485,6 +486,7 @@
+ 		 */
+ 		MD_Update(&m,buf,j);
+ #endif
++#endif
+ 
+ 		k=(st_idx+MD_DIGEST_LENGTH/2)-st_num;
+ 		if (k > 0)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/version-script.patch
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/version-script.patch
index a79c082..7fdda4a 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/version-script.patch
@@ -1,10 +1,11 @@
 Upstream-Status: Backport [debian]
+Signed-Off-By: Constantin Musca <constantinx.musca@intel.com>
 
-Index: openssl-1.0.0e/Configure
+Index: openssl-1.0.1/Configure
 ===================================================================
---- openssl-1.0.0e.orig/Configure	2011-10-04 22:49:47.599379260 -0700
-+++ openssl-1.0.0e/Configure	2011-10-04 22:49:53.263407376 -0700
-@@ -1486,6 +1486,8 @@
+--- openssl-1.0.1.orig/Configure	2012-03-17 11:25:15.000000000 +0000
++++ openssl-1.0.1/Configure	2012-03-17 11:48:15.000000000 +0000
+@@ -1616,6 +1616,8 @@
  		}
  	}
  
@@ -13,11 +14,11 @@ Index: openssl-1.0.0e/Configure
  open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
  unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
  open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
-Index: openssl-1.0.0e/openssl.ld
+Index: openssl-1.0.1/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/openssl.ld	2011-10-04 22:49:53.295407572 -0700
-@@ -0,0 +1,4461 @@
++++ openssl-1.0.1/openssl.ld	2012-03-17 11:46:37.000000000 +0000
+@@ -0,0 +1,4615 @@
 +OPENSSL_1.0.0 {
 +	global:
 +		BIO_f_ssl;
@@ -3127,19 +3128,7 @@ Index: openssl-1.0.0e/openssl.ld
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
@@ -3987,7 +3976,6 @@ Index: openssl-1.0.0e/openssl.ld
 +		FIPS_dsa_sig_encode;
 +		CRYPTO_dbg_remove_all_info;
 +		OPENSSL_init;
-+		private_Camellia_set_key;
 +		CRYPTO_strdup;
 +		JPAKE_STEP3A_process;
 +		JPAKE_STEP1_release;
@@ -4479,10 +4467,177 @@ Index: openssl-1.0.0e/openssl.ld
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
+Index: openssl-1.0.1/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/engines/openssl.ld	2011-10-04 22:49:53.295407572 -0700
++++ openssl-1.0.1/engines/openssl.ld	2012-03-17 11:25:15.000000000 +0000
 @@ -0,0 +1,10 @@
 +OPENSSL_1.0.0 {
 +	global:
@@ -4494,10 +4649,10 @@ Index: openssl-1.0.0e/engines/openssl.ld
 +		*;
 +};
 +
-Index: openssl-1.0.0e/engines/ccgost/openssl.ld
+Index: openssl-1.0.1/engines/ccgost/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0e/engines/ccgost/openssl.ld	2011-10-04 22:49:53.339407745 -0700
++++ openssl-1.0.1/engines/ccgost/openssl.ld	2012-03-17 11:25:15.000000000 +0000
 @@ -0,0 +1,10 @@
 +OPENSSL_1.0.0 {
 +	global:
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.1c/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/openssl_fix_for_x32.patch
similarity index 63%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/openssl_fix_for_x32.patch
index 3191ce9..1036020 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/openssl_fix_for_x32.patch
@@ -6,22 +6,18 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
 
 ported the patch to the 1.0.0e version
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
-Index: openssl-1.0.0e/Configure
-===================================================================
---- openssl-1.0.0e.orig/Configure
-+++ openssl-1.0.0e/Configure
-@@ -393,6 +393,7 @@ my %table=(
+--- a/Configure
++++ b/Configure
+@@ -400,6 +400,7 @@ my %table=(
  "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
 +"linux-x32", "gcc:-mx32 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::x32",
- "linux-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
- #### SPARC Linux setups
- # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
-Index: openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
-===================================================================
---- openssl-1.0.0e.orig/crypto/bn/asm/x86_64-gcc.c
-+++ openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
+ "linux64-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ #### So called "highgprs" target for z/Architecture CPUs
+ # "Highgprs" is kernel feature first implemented in Linux 2.6.32, see
+--- a/crypto/bn/asm/x86_64-gcc.c
++++ b/crypto/bn/asm/x86_64-gcc.c
 @@ -55,7 +55,7 @@
   *    machine.
   */
@@ -57,10 +53,8 @@ Index: openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
  	"	leaq	1(%2),%2	\n"
  	"	loop	1b		\n"
  	"	sbbq	%0,%0		\n"
-Index: openssl-1.0.0e/crypto/bn/bn.h
-===================================================================
---- openssl-1.0.0e.orig/crypto/bn/bn.h
-+++ openssl-1.0.0e/crypto/bn/bn.h
+--- a/crypto/bn/bn.h
++++ b/crypto/bn/bn.h
 @@ -172,6 +172,13 @@ extern "C" {
  # endif
  #endif
@@ -75,15 +69,13 @@ Index: openssl-1.0.0e/crypto/bn/bn.h
  /* assuming long is 64bit - this is the DEC Alpha
   * unsigned long long is only 64 bits :-(, don't define
   * BN_LLONG for the DEC Alpha */
-Index: openssl-1.0.0e/crypto/bn/bn_exp.c
-===================================================================
---- openssl-1.0.0e.orig/crypto/bn/bn_exp.c
-+++ openssl-1.0.0e/crypto/bn/bn_exp.c
-@@ -561,7 +561,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
+--- a/crypto/bn/bn_exp.c
++++ b/crypto/bn/bn_exp.c
+@@ -567,7 +567,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
  
  /* Given a pointer value, compute the next address that is a cache line multiple. */
  #define MOD_EXP_CTIME_ALIGN(x_) \
--	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ULONG)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
+-	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((size_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
 +	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
  
  /* This variant of BN_mod_exp_mont() uses fixed windows and the special
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1c/shared-libs.patch
similarity index 43%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.1c/shared-libs.patch
index 0998673..1028541 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1c/shared-libs.patch
@@ -1,10 +1,8 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: openssl-1.0.0/crypto/Makefile
-===================================================================
---- openssl-1.0.0.orig/crypto/Makefile
-+++ openssl-1.0.0/crypto/Makefile
-@@ -104,7 +104,7 @@
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -108,7 +108,7 @@ $(LIB):	$(LIBOBJ)
  
  shared: buildinf.h lib subdirs
  	if [ -n "$(SHARED_LIBS)" ]; then \
@@ -13,20 +11,9 @@ Index: openssl-1.0.0/crypto/Makefile
  	fi
  
  libs:
-Index: openssl-1.0.0/Makefile.org
-===================================================================
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
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -310,7 +310,7 @@ libcrypto$(SHLIB_EXT): libcrypto.a fips_
  
  libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
  	@if [ "$(SHLIB_TARGET)" != "" ]; then \
@@ -35,11 +22,9 @@ Index: openssl-1.0.0/Makefile.org
  	else \
  		echo "There's no support for shared libraries on this platform" >&2; \
  		exit 1; \
-Index: openssl-1.0.0/ssl/Makefile
-===================================================================
---- openssl-1.0.0.orig/ssl/Makefile
-+++ openssl-1.0.0/ssl/Makefile
-@@ -62,7 +62,7 @@
+--- a/ssl/Makefile
++++ b/ssl/Makefile
+@@ -62,7 +62,7 @@ lib:	$(LIBOBJ)
  
  shared: lib
  	if [ -n "$(SHARED_LIBS)" ]; then \
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1c.bb
similarity index 53%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1c.bb
index 7dac79c..2e8897b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1c.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -18,22 +18,43 @@ SRC_URI += "file://configure-targets.patch \
             file://oe-ldflags.patch \
             file://engines-install-in-libdir-ssl.patch \
             file://openssl-fix-link.patch \
-            file://debian/version-script.patch \
-            file://debian/pic.patch \
-            file://debian/c_rehash-compat.patch \
             file://debian/ca.patch \
+            file://debian/config-hurd.patch \
+            file://debian/debian-targets.patch \
             file://debian/make-targets.patch \
-            file://debian/no-rpath.patch \
             file://debian/man-dir.patch \
             file://debian/man-section.patch \
+            file://debian/no-rpath.patch \
             file://debian/no-symbolic.patch \
-            file://debian/debian-targets.patch \
+            file://debian/pic.patch \
+            file://debian/valgrind.patch \
+            file://debian/rehash-crt.patch \
+            file://debian/rehash_pod.patch \
+            file://debian/shared-lib-ext.patch \
+            file://debian/stddef.patch \
+            file://debian/version-script.patch \
+            file://debian/gnu_source.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/libdoc-manpgs-pod-spell.patch \
+            file://debian/libssl-misspell.patch \
+            file://debian/pod_req_misspell2.patch \
+            file://debian/pod_pksc12.misspell.patch \
+            file://debian/pod_s_server.misspell.patch \
+            file://debian/pod_x509setflags.misspell.patch \
+            file://debian/pod_ec.misspell.patch \
+            file://debian/pkcs12-doc.patch \
+            file://debian/dgst_hmac.patch \
+            file://debian/block_diginotar.patch \
+            file://debian/block_digicert_malaysia.patch \
+            file://debian/c_rehash-multi.patch \
+            file://debian/renegiotate_tls.patch \
+            file://debian/default_bits.patch \
             file://openssl_fix_for_x32.patch \
             file://find.pl \
            "
 
-SRC_URI[md5sum] = "cbe4ac0d8f598680f68a951e04b0996b"
-SRC_URI[sha256sum] = "626fb8fcb3eb7e966edbe71553ff993d137f6e8a87b05051a3695e621098b8af"
+SRC_URI[md5sum] = "ae412727c8c15b67880aef7bd2999b2e"
+SRC_URI[sha256sum] = "2a9eb3cd4e8b114eb9179c0d3884d61658e7d8e8bf4984798a5f5bd48e325ebe"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.9.5



