Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05665771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lRfc000791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:27 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:09 +0800
Message-ID: <cb3f20ce59d10f3a8bc99a6f5faf54e7aba8e7a0.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] elfutils: 0.170 -> 0.172
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:27 -0000
Content-Type: text/plain

- Update debian 0.170 patches and rebase them for 0.172;

- Drop 0001-Use-fallthrough-attribute.patch which was
  accepted by upstream;

- Drop 0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch
  which was backported from upstream;

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{elfutils_0.170.bb => elfutils_0.172.bb}       |  22 +-
 .../elfutils/files/0001-dso-link-change.patch      |   8 +-
 ...0001-libasm-may-link-with-libbz2-if-found.patch |  12 +-
 ...-elf_cvt_gunhash-if-dest-and-src-are-same.patch |   4 +-
 .../elfutils/files/0003-fixheadercheck.patch       |   6 +-
 .../0004-Disable-the-test-to-convert-euc-jp.patch  |   4 +-
 .../files/0005-fix-a-stack-usage-warning.patch     |   8 +-
 .../files/0006-Fix-build-on-aarch64-musl.patch     |   4 +-
 ...-path-where-we-have-str-as-uninitialized-.patch |  12 +-
 ...de-alternatives-for-glibc-assumptions-hel.patch | 201 ++++++-------
 ...ferences-between-mips-machine-identifiers.patch |   4 -
 .../{arm_backend.diff => 0001-arm_backend.patch}   | 322 +++++++++++----------
 .../files/debian/0001-disable_werror.patch         |  35 +++
 .../files/debian/0001-fix-gcc7-ftbfs.patch         |  57 ++++
 .../{hppa_backend.diff => 0001-hppa_backend.patch} | 170 ++++++-----
 ...{mips_backend.patch => 0001-mips_backend.patch} |  31 +-
 ...s_readelf_w.patch => 0001-mips_readelf_w.patch} |  24 +-
 .../debian/0001-testsuite-ignore-elflint.patch     |  57 ++++
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   3 -
 .../0003-Add-mips-n64-relocation-format-hack.patch |   5 +-
 .../elfutils/files/debian/hurd_path.patch          |  14 +
 .../elfutils/files/debian/ignore_strmerge.diff     |  11 +
 .../elfutils/files/debian/kfreebsd_path.patch      |  17 ++
 23 files changed, 629 insertions(+), 402 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.170.bb => elfutils_0.172.bb} (79%)
 rename meta/recipes-devtools/elfutils/files/debian/{arm_backend.diff => 0001-arm_backend.patch} (87%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
 rename meta/recipes-devtools/elfutils/files/debian/{hppa_backend.diff => 0001-hppa_backend.patch} (89%)
 rename meta/recipes-devtools/elfutils/files/debian/{mips_backend.patch => 0001-mips_backend.patch} (97%)
 rename meta/recipes-devtools/elfutils/files/debian/{mips_readelf_w.patch => 0001-mips_readelf_w.patch} (48%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.170.bb b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
similarity index 79%
rename from meta/recipes-devtools/elfutils/elfutils_0.170.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.172.bb
index 14ac22e..04f6709 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.170.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 # The Debian patches below are from:
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
@@ -16,19 +16,23 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0006-Fix-build-on-aarch64-musl.patch \
            file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
-           file://debian/hppa_backend.diff \
-           file://debian/arm_backend.diff \
-           file://debian/mips_backend.patch \
-           file://debian/mips_readelf_w.patch \
+           file://debian/0001-hppa_backend.patch \
+           file://debian/0001-arm_backend.patch \
+           file://debian/0001-mips_backend.patch \
+           file://debian/0001-testsuite-ignore-elflint.patch \
+           file://debian/0001-mips_readelf_w.patch \
+           file://debian/kfreebsd_path.patch \
            file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
            file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
            file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
-           file://0001-Use-fallthrough-attribute.patch \
-           file://0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch \
+           file://debian/hurd_path.patch \
+           file://debian/ignore_strmerge.diff \
+           file://debian/0001-fix-gcc7-ftbfs.patch \
+           file://debian/0001-disable_werror.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
-SRC_URI[md5sum] = "03599aee98c9b726c7a732a2dd0245d5"
-SRC_URI[sha256sum] = "1f844775576b79bdc9f9c717a50058d08620323c1e935458223a12f249c9e066"
+SRC_URI[md5sum] = "01e87ab4c5a6a249c04e22a97a4221d3"
+SRC_URI[sha256sum] = "779c99e6344c4982bbab60b8d276cec3d468151c758905f9a44ba6b6edaa0e24"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 28c57f2..4c62dc5 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From 0a69a26c9f7487daca900db87cd1195857a4603f Mon Sep 17 00:00:00 2001
+From c9c6d2414651dbf163dc4963c3c3d6f5cacef898 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH 1/7] dso link change
@@ -35,10 +35,10 @@ index 2b1c0dc..9305b84 100644
  endif
  libebl = ../libebl/libebl.a
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3735084..528615d 100644
+index b45ecdc..dd256fb 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -400,7 +400,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
+@@ -436,7 +436,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
  libelf = ../libelf/libelf.a -lz
  libasm = ../libasm/libasm.a
  else
@@ -48,5 +48,5 @@ index 3735084..528615d 100644
  libasm = ../libasm/libasm.so
  endif
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index fb0b060..a8e9e50 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From 7672e363468271b4c63ff58770c5aac15ab8f722 Mon Sep 17 00:00:00 2001
+From 74629016e76343a4bf39915c9192b6bf26a57c2d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -11,13 +11,11 @@ where indirect libraries may be not found by linker
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
- src/Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ src/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e03bc32..9b7e853 100644
+index 9305b84..9b7e853 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -39,11 +39,11 @@ EXTRA_DIST += make-debug-archive.in
@@ -35,5 +33,5 @@ index e03bc32..9b7e853 100644
  libelf = ../libelf/libelf.so
  endif
 -- 
-2.14.2
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index 2f718eb..86d26bd 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From e98670f7c7b4c73fb65534949716fd8d043960d5 Mon Sep 17 00:00:00 2001
+From 9fd4bb05d3f2b7eaf9fe441bee26d3b1878d7cc7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH 2/7] Fix elf_cvt_gunhash if dest and src are same.
@@ -38,5 +38,5 @@ index 6faf113..04d9ca1 100644
    /* Now the 64 bit words.  */
    Elf64_Xword *dest64 = (Elf64_Xword *) &dest32[4];
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 7c49fce..d1c8e41 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 565d5935abf5b58773f9c8385c00189221980d98 Mon Sep 17 00:00:00 2001
+From 04fb3f65ec186df5231dd0c21780a55dcc03c868 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH 3/7] fixheadercheck
@@ -21,7 +21,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index d83c0b3..a51bf70 100644
+index 3e9ef61..5351518 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
 @@ -339,8 +339,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
@@ -36,5 +36,5 @@ index d83c0b3..a51bf70 100644
  		      __libelf_seterrno (ELF_E_INVALID_ALIGN);
  		      return -1;
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
index d893ad6..bf3a645 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
@@ -1,4 +1,4 @@
-From bb7ed11950101798aae82f7fda8b3dcb05f755c5 Mon Sep 17 00:00:00 2001
+From dbc88349b9eed4268db951df2c3a8387f75a32e7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:24:06 +0800
 Subject: [PATCH 4/7] Disable the test to convert euc-jp
@@ -40,5 +40,5 @@ index a503646..299f1eb 100644
  }]])],
          [am_cv_func_iconv_works=yes],
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
index 22a01cf..e2966cb 100644
--- a/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
+++ b/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
@@ -1,4 +1,4 @@
-From dd6dbf6af396519380f48c0ef1ce6cf4dd77f6d7 Mon Sep 17 00:00:00 2001
+From 4d7ea681932556ad881f6841de90d0bfff56f8d7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:25:16 +0800
 Subject: [PATCH 5/7] fix a stack-usage warning
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
-index 69d623b..de41dec 100644
+index 3e4432f..59c2d97 100644
 --- a/backends/ppc_initreg.c
 +++ b/backends/ppc_initreg.c
-@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
+@@ -94,7 +94,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
  	return false;
      }
    const size_t gprs = sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);
@@ -31,5 +31,5 @@ index 69d623b..de41dec 100644
      dwarf_regs[gpr] = user_regs.r.gpr[gpr];
    if (! setfunc (0, gprs, dwarf_regs, arg))
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 5f29a03..40b8544 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From e57ad47fc8549353ca80c23b9b4f38f31fde13e5 Mon Sep 17 00:00:00 2001
+From b4ec05953f78af26bcd7de45a5bbc5f138d023da Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH 6/7] Fix build on aarch64/musl
@@ -57,5 +57,5 @@ index efcabaf..062bb9e 100644
  # include <sys/ptrace.h>
  /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch b/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
index 2247704..bba420e 100644
--- a/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
+++ b/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
@@ -1,6 +1,6 @@
-From 1e91c1d4e37c05cf95058b4b3c3f352d72886f58 Mon Sep 17 00:00:00 2001
+From 8eb100b2e51be5d473b0748a223e2e7f61ec606c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:31:38 +0800
+Date: Fri, 29 Jun 2018 15:14:28 +0800
 Subject: [PATCH 7/7] Fix control path where we have str as uninitialized
  string
 
@@ -21,7 +21,7 @@ note: 'str' was declared here
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Rebase to 0.170
+Rebase to 0.172
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -29,17 +29,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
-index 831afbe..60fd6d4 100644
+index a7e03f9..837a3a8 100644
 --- a/libcpu/i386_disasm.c
 +++ b/libcpu/i386_disasm.c
 @@ -821,6 +821,7 @@ i386_disasm (Ebl *ebl __attribute__((unused)),
  			    }
- 			  /* Fallthrough */
+ 			  FALLTHROUGH;
  			default:
 +			  str = "";
  			  assert (! "INVALID not handled");
  			}
  		    }
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index a42ce7b..e88f2c0 100644
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -1,16 +1,15 @@
-From ef0981744669149a00dd0439a54dac30de7b56a7 Mon Sep 17 00:00:00 2001
+From 207be05c44da5c4c31179a34660e176145ff8d4b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Aug 2017 10:06:26 +0800
+Date: Mon, 2 Jul 2018 09:52:23 +0800
 Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
  compiling it on musl
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Rebase to 0.170
+Rebase to 0.172
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  Makefile.am                      |  2 +-
  lib/color.c                      |  3 ++-
@@ -24,10 +23,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  libcpu/i386_parse.c              |  2 +-
  libdw/Makefile.am                |  3 ++-
  libdw/libdw_alloc.c              |  2 +-
- libdwfl/dwfl_build_id_find_elf.c |  3 ++-
+ libdwfl/dwfl_build_id_find_elf.c |  1 +
  libdwfl/dwfl_error.c             |  4 +++-
  libdwfl/dwfl_module_getdwarf.c   |  1 +
- libdwfl/find-debuginfo.c         |  2 +-
  libdwfl/libdwfl_crc32_file.c     |  9 +++++++++
  libdwfl/linux-kernel-modules.c   |  1 +
  libebl/eblopenbackend.c          |  2 +-
@@ -75,16 +73,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  tests/getsrc_die.c               |  2 +-
  tests/line2addr.c                |  2 +-
  tests/low_high_pc.c              |  2 +-
- tests/md5-sha1-test.c            |  2 +-
  tests/rdwrmmap.c                 |  2 +-
  tests/saridx.c                   |  2 +-
  tests/sectiondump.c              |  2 +-
  tests/varlocs.c                  |  2 +-
  tests/vdsosyms.c                 |  2 +-
- 69 files changed, 95 insertions(+), 64 deletions(-)
+ 67 files changed, 92 insertions(+), 61 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 2ff444e7..41f77df8 100644
+index 2ff444e..41f77df 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
@@ -97,7 +94,7 @@ index 2ff444e7..41f77df8 100644
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
 diff --git a/lib/color.c b/lib/color.c
-index f62389d5..a2a84b46 100644
+index f62389d..a2a84b4 100644
 --- a/lib/color.c
 +++ b/lib/color.c
 @@ -32,13 +32,14 @@
@@ -117,7 +114,7 @@ index f62389d5..a2a84b46 100644
  /* Prototype for option handler.  */
  static error_t parse_opt (int key, char *arg, struct argp_state *state);
 diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
-index dac2a5f5..43016fc3 100644
+index dac2a5f..43016fc 100644
 --- a/lib/fixedsizehash.h
 +++ b/lib/fixedsizehash.h
 @@ -30,7 +30,6 @@
@@ -129,7 +126,7 @@ index dac2a5f5..43016fc3 100644
  #include <system.h>
  
 diff --git a/lib/system.h b/lib/system.h
-index 92033355..1a601319 100644
+index 9203335..1a60131 100644
 --- a/lib/system.h
 +++ b/lib/system.h
 @@ -50,6 +50,16 @@
@@ -150,7 +147,7 @@ index 92033355..1a601319 100644
  #ifndef MAX
  #define MAX(m, n) ((m) < (n) ? (n) : (m))
 diff --git a/lib/xmalloc.c b/lib/xmalloc.c
-index 0cde384f..217b0541 100644
+index 0cde384..217b054 100644
 --- a/lib/xmalloc.c
 +++ b/lib/xmalloc.c
 @@ -30,7 +30,7 @@
@@ -163,7 +160,7 @@ index 0cde384f..217b0541 100644
  #include <stddef.h>
  #include <stdlib.h>
 diff --git a/libasm/asm_end.c b/libasm/asm_end.c
-index ced24f50..4ad918c4 100644
+index ced24f5..4ad918c 100644
 --- a/libasm/asm_end.c
 +++ b/libasm/asm_end.c
 @@ -32,7 +32,7 @@
@@ -176,7 +173,7 @@ index ced24f50..4ad918c4 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/libasm/asm_newscn.c b/libasm/asm_newscn.c
-index ddbb25df..74a598d9 100644
+index ddbb25d..74a598d 100644
 --- a/libasm/asm_newscn.c
 +++ b/libasm/asm_newscn.c
 @@ -32,7 +32,7 @@
@@ -189,7 +186,7 @@ index ddbb25df..74a598d9 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/libcpu/i386_gendis.c b/libcpu/i386_gendis.c
-index aae5eae6..6d760165 100644
+index aae5eae..6d76016 100644
 --- a/libcpu/i386_gendis.c
 +++ b/libcpu/i386_gendis.c
 @@ -31,7 +31,7 @@
@@ -202,10 +199,10 @@ index aae5eae6..6d760165 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
-index ba5f4aa5..b1e41916 100644
+index facdf71..f13842f 100644
 --- a/libcpu/i386_lex.c
 +++ b/libcpu/i386_lex.c
-@@ -577,7 +577,7 @@ char *i386_text;
+@@ -571,7 +571,7 @@ char *i386_text;
  #endif
  
  #include <ctype.h>
@@ -215,7 +212,7 @@ index ba5f4aa5..b1e41916 100644
  
  #include <libeu.h>
 diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
-index 6fa7ce3d..bb270061 100644
+index 3c5058a..bf402d6 100644
 --- a/libcpu/i386_parse.c
 +++ b/libcpu/i386_parse.c
 @@ -107,7 +107,7 @@
@@ -228,10 +225,10 @@ index 6fa7ce3d..bb270061 100644
  #include <libintl.h>
  #include <math.h>
 diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index ff8c291e..89e792aa 100644
+index 41df4f3..e6b275f 100644
 --- a/libdw/Makefile.am
 +++ b/libdw/Makefile.am
-@@ -105,7 +105,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+@@ -107,7 +107,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
  libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
  	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
  libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
@@ -242,7 +239,7 @@ index ff8c291e..89e792aa 100644
  libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
  # The rpath is necessary for libebl because its $ORIGIN use will
 diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
-index 28a8cf6e..29aeb3f7 100644
+index d6af23a..deb724c 100644
 --- a/libdw/libdw_alloc.c
 +++ b/libdw/libdw_alloc.c
 @@ -31,7 +31,7 @@
@@ -255,7 +252,7 @@ index 28a8cf6e..29aeb3f7 100644
  #include <stdlib.h>
  #include "libdwP.h"
 diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
-index ee0c1646..b06ab596 100644
+index cc6c3f6..b06ab59 100644
 --- a/libdwfl/dwfl_build_id_find_elf.c
 +++ b/libdwfl/dwfl_build_id_find_elf.c
 @@ -31,6 +31,7 @@
@@ -266,17 +263,8 @@ index ee0c1646..b06ab596 100644
  #include <inttypes.h>
  #include <fcntl.h>
  #include <unistd.h>
-@@ -99,7 +100,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
- 	{
- 	  if (*file_name != NULL)
- 	    free (*file_name);
--	  *file_name = canonicalize_file_name (name);
-+	  *file_name = realpath (name, NULL);
- 	  if (*file_name == NULL)
- 	    {
- 	      *file_name = name;
 diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
-index 7bcf61cc..c345797a 100644
+index 7bcf61c..c345797 100644
 --- a/libdwfl/dwfl_error.c
 +++ b/libdwfl/dwfl_error.c
 @@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
@@ -298,7 +286,7 @@ index 7bcf61cc..c345797a 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
-index 9775aced..511c4a6a 100644
+index af6838a..c079d6a 100644
 --- a/libdwfl/dwfl_module_getdwarf.c
 +++ b/libdwfl/dwfl_module_getdwarf.c
 @@ -35,6 +35,7 @@
@@ -309,21 +297,8 @@ index 9775aced..511c4a6a 100644
  #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
  #include "../libelf/libelfP.h"
  #include "system.h"
-diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
-index 6d5a42a6..9267788d 100644
---- a/libdwfl/find-debuginfo.c
-+++ b/libdwfl/find-debuginfo.c
-@@ -389,7 +389,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
-       /* If FILE_NAME is a symlink, the debug file might be associated
- 	 with the symlink target name instead.  */
- 
--      char *canon = canonicalize_file_name (file_name);
-+      char *canon = realpath (file_name, NULL);
-       if (canon != NULL && strcmp (file_name, canon))
- 	fd = find_debuginfo_in_path (mod, canon,
- 				     debuglink_file, debuglink_crc,
 diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
-index f849128d..6f0aca1b 100644
+index f849128..6f0aca1 100644
 --- a/libdwfl/libdwfl_crc32_file.c
 +++ b/libdwfl/libdwfl_crc32_file.c
 @@ -29,6 +29,15 @@
@@ -343,7 +318,7 @@ index f849128d..6f0aca1b 100644
  #define crc32 __libdwfl_crc32
  #include <libdwflP.h>
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 9d0fef2c..9fc09b88 100644
+index 9d0fef2..9fc09b8 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -40,6 +40,7 @@
@@ -355,7 +330,7 @@ index 9d0fef2c..9fc09b88 100644
  #include <errno.h>
  #include <stdio.h>
 diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 53713963..2e66dfdd 100644
+index 8b063f4..9bdeead 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
 @@ -32,7 +32,7 @@
@@ -368,7 +343,7 @@ index 53713963..2e66dfdd 100644
  #include <dwarf.h>
  #include <stdlib.h>
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 5cf2b934..990b3afb 100644
+index f774898..be277d0 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -382,9 +357,9 @@ index 5cf2b934..990b3afb 100644
  
  /* Standard ELF types.  */
  
-@@ -3705,6 +3707,8 @@ enum
- #define R_BPF_NONE		0	/* No reloc */
- #define R_BPF_MAP_FD		1	/* Map fd to pointer */
+@@ -3912,6 +3914,8 @@ enum
+ #define R_METAG_TLS_LE_HI16	60
+ #define R_METAG_TLS_LE_LO16	61
  
 -__END_DECLS
 +#ifdef __cplusplus
@@ -393,7 +368,7 @@ index 5cf2b934..990b3afb 100644
  
  #endif	/* elf.h */
 diff --git a/libelf/libelf.h b/libelf/libelf.h
-index 547c0f50..dd78799e 100644
+index 547c0f5..dd78799 100644
 --- a/libelf/libelf.h
 +++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
@@ -405,7 +380,7 @@ index 547c0f50..dd78799e 100644
  #include <sys/types.h>
  
 diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index 7ee6625a..58408997 100644
+index ca805ac..47f25c2 100644
 --- a/libelf/libelfP.h
 +++ b/libelf/libelfP.h
 @@ -32,6 +32,7 @@
@@ -417,7 +392,7 @@ index 7ee6625a..58408997 100644
  #include <errno.h>
  #include <stdbool.h>
 diff --git a/src/addr2line.c b/src/addr2line.c
-index 444ee52c..9596fa67 100644
+index 5acafa0..a4920b3 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
 @@ -23,7 +23,7 @@
@@ -430,7 +405,7 @@ index 444ee52c..9596fa67 100644
  #include <inttypes.h>
  #include <libdwfl.h>
 diff --git a/src/ar.c b/src/ar.c
-index ec32cee5..4efd729c 100644
+index 818115b..2166f1b 100644
 --- a/src/ar.c
 +++ b/src/ar.c
 @@ -22,7 +22,7 @@
@@ -443,7 +418,7 @@ index ec32cee5..4efd729c 100644
  #include <gelf.h>
  #include <libintl.h>
 diff --git a/src/arlib.c b/src/arlib.c
-index e0839aab..1143658f 100644
+index e0839aa..1143658 100644
 --- a/src/arlib.c
 +++ b/src/arlib.c
 @@ -21,7 +21,7 @@
@@ -456,7 +431,7 @@ index e0839aab..1143658f 100644
  #include <inttypes.h>
  #include <libintl.h>
 diff --git a/src/arlib2.c b/src/arlib2.c
-index 553fc57b..46443d0e 100644
+index 553fc57..46443d0 100644
 --- a/src/arlib2.c
 +++ b/src/arlib2.c
 @@ -20,7 +20,7 @@
@@ -469,7 +444,7 @@ index 553fc57b..46443d0e 100644
  #include <limits.h>
  #include <string.h>
 diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 50464207..cff183fa 100644
+index 5046420..cff183f 100644
 --- a/src/elfcmp.c
 +++ b/src/elfcmp.c
 @@ -23,7 +23,7 @@
@@ -482,7 +457,7 @@ index 50464207..cff183fa 100644
  #include <locale.h>
  #include <libintl.h>
 diff --git a/src/elflint.c b/src/elflint.c
-index df1b3a03..67d8d134 100644
+index 0a26d97..e45fb39 100644
 --- a/src/elflint.c
 +++ b/src/elflint.c
 @@ -24,7 +24,7 @@
@@ -495,7 +470,7 @@ index df1b3a03..67d8d134 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/findtextrel.c b/src/findtextrel.c
-index 8f1e239a..71463af3 100644
+index 8f1e239..71463af 100644
 --- a/src/findtextrel.c
 +++ b/src/findtextrel.c
 @@ -23,7 +23,7 @@
@@ -508,7 +483,7 @@ index 8f1e239a..71463af3 100644
  #include <gelf.h>
  #include <libdw.h>
 diff --git a/src/nm.c b/src/nm.c
-index 969c6d35..3113c04c 100644
+index 969c6d3..3113c04 100644
 --- a/src/nm.c
 +++ b/src/nm.c
 @@ -26,7 +26,7 @@
@@ -521,7 +496,7 @@ index 969c6d35..3113c04c 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/objdump.c b/src/objdump.c
-index 0dd9a6aa..9c8bf149 100644
+index 0dd9a6a..9c8bf14 100644
 --- a/src/objdump.c
 +++ b/src/objdump.c
 @@ -21,7 +21,7 @@
@@ -534,7 +509,7 @@ index 0dd9a6aa..9c8bf149 100644
  #include <inttypes.h>
  #include <libintl.h>
 diff --git a/src/ranlib.c b/src/ranlib.c
-index cc0ee233..ae851e40 100644
+index cc0ee23..ae851e4 100644
 --- a/src/ranlib.c
 +++ b/src/ranlib.c
 @@ -24,7 +24,7 @@
@@ -547,10 +522,10 @@ index cc0ee233..ae851e40 100644
  #include <gelf.h>
  #include <libintl.h>
 diff --git a/src/readelf.c b/src/readelf.c
-index 6a27e7e0..4759a965 100644
+index f185897..6623e93 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
-@@ -25,7 +25,7 @@
+@@ -24,7 +24,7 @@
  #include <ctype.h>
  #include <dwarf.h>
  #include <errno.h>
@@ -560,7 +535,7 @@ index 6a27e7e0..4759a965 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/size.c b/src/size.c
-index ad8dbcbb..fd83be06 100644
+index ad8dbcb..fd83be0 100644
 --- a/src/size.c
 +++ b/src/size.c
 @@ -21,7 +21,7 @@
@@ -573,7 +548,7 @@ index ad8dbcbb..fd83be06 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/stack.c b/src/stack.c
-index 6f2ff69f..6da0243d 100644
+index 52ae3a8..0fda285 100644
 --- a/src/stack.c
 +++ b/src/stack.c
 @@ -18,7 +18,7 @@
@@ -586,7 +561,7 @@ index 6f2ff69f..6da0243d 100644
  #include <inttypes.h>
  #include <stdio.h>
 diff --git a/src/strings.c b/src/strings.c
-index 03d0f133..5c311cbd 100644
+index 03d0f13..5c311cb 100644
 --- a/src/strings.c
 +++ b/src/strings.c
 @@ -25,7 +25,7 @@
@@ -599,7 +574,7 @@ index 03d0f133..5c311cbd 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/strip.c b/src/strip.c
-index c7830ec6..0d7f148d 100644
+index 773ed54..ff05f46 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -24,7 +24,7 @@
@@ -612,7 +587,7 @@ index c7830ec6..0d7f148d 100644
  #include <fnmatch.h>
  #include <gelf.h>
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 50749093..3d4f9525 100644
+index f368e69..5ca83d0 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -31,7 +31,7 @@
@@ -625,7 +600,7 @@ index 50749093..3d4f9525 100644
  #include <fnmatch.h>
  #include <libintl.h>
 diff --git a/tests/addrscopes.c b/tests/addrscopes.c
-index 791569f5..54f4311b 100644
+index 791569f..54f4311 100644
 --- a/tests/addrscopes.c
 +++ b/tests/addrscopes.c
 @@ -25,7 +25,7 @@
@@ -638,7 +613,7 @@ index 791569f5..54f4311b 100644
  
  
 diff --git a/tests/allregs.c b/tests/allregs.c
-index 286f7e3c..c9de0897 100644
+index 286f7e3..c9de089 100644
 --- a/tests/allregs.c
 +++ b/tests/allregs.c
 @@ -21,7 +21,7 @@
@@ -651,7 +626,7 @@ index 286f7e3c..c9de0897 100644
  #include <argp.h>
  #include <assert.h>
 diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
-index a387d8ff..955c27d1 100644
+index a387d8f..955c27d 100644
 --- a/tests/backtrace-data.c
 +++ b/tests/backtrace-data.c
 @@ -27,7 +27,7 @@
@@ -664,10 +639,10 @@ index a387d8ff..955c27d1 100644
  #include <dwarf.h>
  #if defined(__x86_64__) && defined(__linux__)
 diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
-index 2dc8a9a2..24ca7fb0 100644
+index 7ff826c..246650b 100644
 --- a/tests/backtrace-dwarf.c
 +++ b/tests/backtrace-dwarf.c
-@@ -22,7 +22,7 @@
+@@ -21,7 +21,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
  #include <errno.h>
@@ -675,9 +650,9 @@ index 2dc8a9a2..24ca7fb0 100644
 +#include <err.h>
  #include <unistd.h>
  #include <sys/types.h>
- #include <sys/wait.h>
+ #include ELFUTILS_HEADER(dwfl)
 diff --git a/tests/backtrace.c b/tests/backtrace.c
-index f5dd761f..a93a8f03 100644
+index f5dd761..a93a8f0 100644
 --- a/tests/backtrace.c
 +++ b/tests/backtrace.c
 @@ -24,7 +24,7 @@
@@ -690,7 +665,7 @@ index f5dd761f..a93a8f03 100644
  #include <dwarf.h>
  #ifdef __linux__
 diff --git a/tests/buildid.c b/tests/buildid.c
-index 87c18773..2953e6bb 100644
+index 87c1877..2953e6b 100644
 --- a/tests/buildid.c
 +++ b/tests/buildid.c
 @@ -23,7 +23,7 @@
@@ -703,7 +678,7 @@ index 87c18773..2953e6bb 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/debugaltlink.c b/tests/debugaltlink.c
-index 6d97d500..ee7e559e 100644
+index 6d97d50..ee7e559 100644
 --- a/tests/debugaltlink.c
 +++ b/tests/debugaltlink.c
 @@ -23,7 +23,7 @@
@@ -716,7 +691,7 @@ index 6d97d500..ee7e559e 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/debuglink.c b/tests/debuglink.c
-index 935d1029..741cb814 100644
+index 935d102..741cb81 100644
 --- a/tests/debuglink.c
 +++ b/tests/debuglink.c
 @@ -21,7 +21,7 @@
@@ -729,7 +704,7 @@ index 935d1029..741cb814 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/deleted.c b/tests/deleted.c
-index 6be35bc2..01907113 100644
+index 6be35bc..0190711 100644
 --- a/tests/deleted.c
 +++ b/tests/deleted.c
 @@ -21,7 +21,7 @@
@@ -742,7 +717,7 @@ index 6be35bc2..01907113 100644
  #ifdef __linux__
  #include <sys/prctl.h>
 diff --git a/tests/dwfl-addr-sect.c b/tests/dwfl-addr-sect.c
-index 21e470a3..1ea1e3b2 100644
+index 21e470a..1ea1e3b 100644
 --- a/tests/dwfl-addr-sect.c
 +++ b/tests/dwfl-addr-sect.c
 @@ -23,7 +23,7 @@
@@ -755,7 +730,7 @@ index 21e470a3..1ea1e3b2 100644
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
 diff --git a/tests/dwfl-bug-addr-overflow.c b/tests/dwfl-bug-addr-overflow.c
-index aa8030e1..02c8bef9 100644
+index aa8030e..02c8bef 100644
 --- a/tests/dwfl-bug-addr-overflow.c
 +++ b/tests/dwfl-bug-addr-overflow.c
 @@ -20,7 +20,7 @@
@@ -768,7 +743,7 @@ index aa8030e1..02c8bef9 100644
  #include ELFUTILS_HEADER(dwfl)
  
 diff --git a/tests/dwfl-bug-fd-leak.c b/tests/dwfl-bug-fd-leak.c
-index 689cdd79..5973da39 100644
+index 689cdd7..5973da3 100644
 --- a/tests/dwfl-bug-fd-leak.c
 +++ b/tests/dwfl-bug-fd-leak.c
 @@ -24,7 +24,7 @@
@@ -781,7 +756,7 @@ index 689cdd79..5973da39 100644
  #include <dwarf.h>
  
 diff --git a/tests/dwfl-bug-getmodules.c b/tests/dwfl-bug-getmodules.c
-index 1ee989f8..fd62e653 100644
+index 1ee989f..fd62e65 100644
 --- a/tests/dwfl-bug-getmodules.c
 +++ b/tests/dwfl-bug-getmodules.c
 @@ -18,7 +18,7 @@
@@ -794,7 +769,7 @@ index 1ee989f8..fd62e653 100644
  static const Dwfl_Callbacks callbacks =
    {
 diff --git a/tests/dwfl-report-elf-align.c b/tests/dwfl-report-elf-align.c
-index a4e97d3c..f471587c 100644
+index a4e97d3..f471587 100644
 --- a/tests/dwfl-report-elf-align.c
 +++ b/tests/dwfl-report-elf-align.c
 @@ -20,7 +20,7 @@
@@ -807,7 +782,7 @@ index a4e97d3c..f471587c 100644
  #include <string.h>
  #include <stdlib.h>
 diff --git a/tests/dwfllines.c b/tests/dwfllines.c
-index 90379dd2..cbdf6c4c 100644
+index 90379dd..cbdf6c4 100644
 --- a/tests/dwfllines.c
 +++ b/tests/dwfllines.c
 @@ -27,7 +27,7 @@
@@ -820,7 +795,7 @@ index 90379dd2..cbdf6c4c 100644
  int
  main (int argc, char *argv[])
 diff --git a/tests/dwflmodtest.c b/tests/dwflmodtest.c
-index 0027f96b..e68d3bca 100644
+index 0027f96..e68d3bc 100644
 --- a/tests/dwflmodtest.c
 +++ b/tests/dwflmodtest.c
 @@ -23,7 +23,7 @@
@@ -833,7 +808,7 @@ index 0027f96b..e68d3bca 100644
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
 diff --git a/tests/dwflsyms.c b/tests/dwflsyms.c
-index 49ac3346..cf078301 100644
+index 49ac334..cf07830 100644
 --- a/tests/dwflsyms.c
 +++ b/tests/dwflsyms.c
 @@ -25,7 +25,7 @@
@@ -846,7 +821,7 @@ index 49ac3346..cf078301 100644
  
  static const char *
 diff --git a/tests/early-offscn.c b/tests/early-offscn.c
-index 924cb9ef..6f60d5a3 100644
+index 924cb9e..6f60d5a 100644
 --- a/tests/early-offscn.c
 +++ b/tests/early-offscn.c
 @@ -19,7 +19,7 @@
@@ -859,7 +834,7 @@ index 924cb9ef..6f60d5a3 100644
  #include <gelf.h>
  #include <stdio.h>
 diff --git a/tests/ecp.c b/tests/ecp.c
-index 38a6859e..743cea5d 100644
+index 38a6859..743cea5 100644
 --- a/tests/ecp.c
 +++ b/tests/ecp.c
 @@ -20,7 +20,7 @@
@@ -872,7 +847,7 @@ index 38a6859e..743cea5d 100644
  #include <gelf.h>
  #include <stdlib.h>
 diff --git a/tests/find-prologues.c b/tests/find-prologues.c
-index ba8ae371..76f5f047 100644
+index ba8ae37..76f5f04 100644
 --- a/tests/find-prologues.c
 +++ b/tests/find-prologues.c
 @@ -25,7 +25,7 @@
@@ -885,7 +860,7 @@ index ba8ae371..76f5f047 100644
  #include <fnmatch.h>
  
 diff --git a/tests/funcretval.c b/tests/funcretval.c
-index 8d19d117..c8aaa93d 100644
+index 8d19d11..c8aaa93 100644
 --- a/tests/funcretval.c
 +++ b/tests/funcretval.c
 @@ -25,7 +25,7 @@
@@ -898,7 +873,7 @@ index 8d19d117..c8aaa93d 100644
  #include <fnmatch.h>
  
 diff --git a/tests/funcscopes.c b/tests/funcscopes.c
-index 9c901858..dbccb89e 100644
+index 9c90185..dbccb89 100644
 --- a/tests/funcscopes.c
 +++ b/tests/funcscopes.c
 @@ -25,7 +25,7 @@
@@ -911,7 +886,7 @@ index 9c901858..dbccb89e 100644
  #include <fnmatch.h>
  
 diff --git a/tests/getsrc_die.c b/tests/getsrc_die.c
-index 055aede0..9c394dd0 100644
+index 055aede..9c394dd 100644
 --- a/tests/getsrc_die.c
 +++ b/tests/getsrc_die.c
 @@ -19,7 +19,7 @@
@@ -924,7 +899,7 @@ index 055aede0..9c394dd0 100644
  #include <inttypes.h>
  #include <libelf.h>
 diff --git a/tests/line2addr.c b/tests/line2addr.c
-index e0d65d3d..9bf0023b 100644
+index e0d65d3..9bf0023 100644
 --- a/tests/line2addr.c
 +++ b/tests/line2addr.c
 @@ -26,7 +26,7 @@
@@ -937,7 +912,7 @@ index e0d65d3d..9bf0023b 100644
  
  static void
 diff --git a/tests/low_high_pc.c b/tests/low_high_pc.c
-index d0f43023..8da4fbdf 100644
+index 5c6b343..fa0c158 100644
 --- a/tests/low_high_pc.c
 +++ b/tests/low_high_pc.c
 @@ -25,7 +25,7 @@
@@ -949,21 +924,8 @@ index d0f43023..8da4fbdf 100644
  #include <string.h>
  #include <fnmatch.h>
  
-diff --git a/tests/md5-sha1-test.c b/tests/md5-sha1-test.c
-index d50355e9..3c41f40b 100644
---- a/tests/md5-sha1-test.c
-+++ b/tests/md5-sha1-test.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- #include "md5.h"
- #include "sha1.h"
 diff --git a/tests/rdwrmmap.c b/tests/rdwrmmap.c
-index 6f027dfe..1ce5e6ed 100644
+index 6f027df..1ce5e6e 100644
 --- a/tests/rdwrmmap.c
 +++ b/tests/rdwrmmap.c
 @@ -19,7 +19,7 @@
@@ -976,7 +938,7 @@ index 6f027dfe..1ce5e6ed 100644
  #include <fcntl.h>
  #include <unistd.h>
 diff --git a/tests/saridx.c b/tests/saridx.c
-index 8a450d82..b3878013 100644
+index 8a450d8..b387801 100644
 --- a/tests/saridx.c
 +++ b/tests/saridx.c
 @@ -17,7 +17,7 @@
@@ -989,7 +951,7 @@ index 8a450d82..b3878013 100644
  #include <gelf.h>
  #include <stdio.h>
 diff --git a/tests/sectiondump.c b/tests/sectiondump.c
-index 3033fedc..8e888db3 100644
+index 3033fed..8e888db 100644
 --- a/tests/sectiondump.c
 +++ b/tests/sectiondump.c
 @@ -18,7 +18,7 @@
@@ -1002,7 +964,7 @@ index 3033fedc..8e888db3 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/tests/varlocs.c b/tests/varlocs.c
-index c3fba89e..e043ea2c 100644
+index f4a711c..1d89a61 100644
 --- a/tests/varlocs.c
 +++ b/tests/varlocs.c
 @@ -25,7 +25,7 @@
@@ -1015,7 +977,7 @@ index c3fba89e..e043ea2c 100644
  #include <sys/types.h>
  #include <sys/stat.h>
 diff --git a/tests/vdsosyms.c b/tests/vdsosyms.c
-index b876c10b..afb28232 100644
+index b876c10..afb2823 100644
 --- a/tests/vdsosyms.c
 +++ b/tests/vdsosyms.c
 @@ -18,7 +18,7 @@
@@ -1027,3 +989,6 @@ index b876c10b..afb28232 100644
  #include <inttypes.h>
  #include <stdio.h>
  #include <string.h>
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
index e0291b4..a9a7210 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -8,10 +8,6 @@ from the elf machine id. Also, the EM_MIPS_RS3_LE machine is dead anyway (the
 kernel will not load binaries containing it).
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  backends/mips_init.c | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
diff --git a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff b/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
similarity index 87%
rename from meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
rename to meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
index 50f4b05..540ba95 100644
--- a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
@@ -1,8 +1,28 @@
-Upstream-Status: Backport [from debian]
+From a95f370bc2690c150c46f215543de278469900eb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jun 2018 15:42:39 +0800
+Subject: [PATCH] arm_backend
+
+Upstream-Status: Backport from debian
+arm_backend.diff and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/arm_init.c                 |  18 ++++-
+ backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
+ backends/arm_retval.c               |  43 +++++++++++-
+ backends/libebl_arm.h               |   9 +++
+ libelf/elf.h                        |  11 +++
+ tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
+ tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
+ tests/run-readelf-mixed-corenote.sh |  11 ++-
+ 8 files changed, 400 insertions(+), 12 deletions(-)
+ create mode 100644 backends/libebl_arm.h
 
-Index: b/backends/arm_init.c
-===================================================================
+diff --git a/backends/arm_init.c b/backends/arm_init.c
+index f2b1b11..1b71f16 100644
 --- a/backends/arm_init.c
 +++ b/backends/arm_init.c
 @@ -35,20 +35,31 @@
@@ -38,7 +58,7 @@ Index: b/backends/arm_init.c
    /* We handle it.  */
    eh->name = "ARM";
    arm_init_reloc (eh);
-@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unuse
+@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unused)),
    HOOK (eh, core_note);
    HOOK (eh, auxv_info);
    HOOK (eh, check_object_attribute);
@@ -50,8 +70,8 @@ Index: b/backends/arm_init.c
    HOOK (eh, abi_cfi);
    HOOK (eh, check_reloc_target_type);
    HOOK (eh, symbol_type_name);
-Index: b/backends/arm_regs.c
-===================================================================
+diff --git a/backends/arm_regs.c b/backends/arm_regs.c
+index a46a4c9..418c931 100644
 --- a/backends/arm_regs.c
 +++ b/backends/arm_regs.c
 @@ -31,6 +31,7 @@
@@ -62,7 +82,7 @@ Index: b/backends/arm_regs.c
  #include <dwarf.h>
  
  #define BACKEND arm_
-@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute_
+@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
        break;
  
      case 16 + 0 ... 16 + 7:
@@ -70,9 +90,9 @@ Index: b/backends/arm_regs.c
 +       * but gcc maps FPA registers here
 +       */
        regno += 96 - 16;
-       /* Fall through.  */
+       FALLTHROUGH;
      case 96 + 0 ... 96 + 7:
-@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute_
+@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
        namelen = 2;
        break;
  
@@ -212,8 +232,8 @@ Index: b/backends/arm_regs.c
        *setname = "VFP";
        *type = DW_ATE_float;
        *bits = 64;
-Index: b/backends/arm_retval.c
-===================================================================
+diff --git a/backends/arm_retval.c b/backends/arm_retval.c
+index 1c28f01..313e4eb 100644
 --- a/backends/arm_retval.c
 +++ b/backends/arm_retval.c
 @@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
@@ -242,7 +262,7 @@ Index: b/backends/arm_retval.c
  {
    /* Start with the function's type, and get the DW_AT_type attribute,
       which is the type of the return value.  */
-@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *fu
+@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
  	    else
  	      return -1;
  	  }
@@ -264,7 +284,7 @@ Index: b/backends/arm_retval.c
  	if (size <= 16)
  	  {
  	  intreg:
-@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *fu
+@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
  	  }
  
        aggregate:
@@ -272,7 +292,7 @@ Index: b/backends/arm_retval.c
  	*locp = loc_aggregate;
  	return nloc_aggregate;
        }
-@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *fu
+@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
       DWARF and might be valid.  */
    return -2;
  }
@@ -291,11 +311,26 @@ Index: b/backends/arm_retval.c
 +   return arm_return_value_location_ (functypedie, locp, 0);
 +}
 +
-Index: b/libelf/elf.h
-===================================================================
+diff --git a/backends/libebl_arm.h b/backends/libebl_arm.h
+new file mode 100644
+index 0000000..c00770c
+--- /dev/null
++++ b/backends/libebl_arm.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+diff --git a/libelf/elf.h b/libelf/elf.h
+index 6c9f61e..6d82fef 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
-@@ -2593,6 +2593,9 @@ enum
+@@ -2692,6 +2692,9 @@ enum
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -305,7 +340,7 @@ Index: b/libelf/elf.h
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2610,12 +2613,19 @@ enum
+@@ -2709,12 +2712,19 @@ enum
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -325,7 +360,7 @@ Index: b/libelf/elf.h
  
  /* AArch64 relocs.  */
  
-@@ -2908,6 +2918,7 @@ enum
+@@ -3007,6 +3017,7 @@ enum
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -333,22 +368,119 @@ Index: b/libelf/elf.h
  #define R_ARM_ME_TOO		128	/* Obsolete.  */
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
-Index: b/backends/libebl_arm.h
-===================================================================
---- /dev/null
-+++ b/backends/libebl_arm.h
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_ARM_H
-+#define _LIBEBL_ARM_H 1
-+
-+#include <libdw.h>
-+
-+extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-Index: b/tests/run-allregs.sh
-===================================================================
+diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
+index fd89d02..462d7c5 100755
+--- a/tests/run-addrcfi.sh
++++ b/tests/run-addrcfi.sh
+@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
+ 	FPA reg21 (f5): undefined
+ 	FPA reg22 (f6): undefined
+ 	FPA reg23 (f7): undefined
++	VFP reg64 (s0): undefined
++	VFP reg65 (s1): undefined
++	VFP reg66 (s2): undefined
++	VFP reg67 (s3): undefined
++	VFP reg68 (s4): undefined
++	VFP reg69 (s5): undefined
++	VFP reg70 (s6): undefined
++	VFP reg71 (s7): undefined
++	VFP reg72 (s8): undefined
++	VFP reg73 (s9): undefined
++	VFP reg74 (s10): undefined
++	VFP reg75 (s11): undefined
++	VFP reg76 (s12): undefined
++	VFP reg77 (s13): undefined
++	VFP reg78 (s14): undefined
++	VFP reg79 (s15): undefined
++	VFP reg80 (s16): undefined
++	VFP reg81 (s17): undefined
++	VFP reg82 (s18): undefined
++	VFP reg83 (s19): undefined
++	VFP reg84 (s20): undefined
++	VFP reg85 (s21): undefined
++	VFP reg86 (s22): undefined
++	VFP reg87 (s23): undefined
++	VFP reg88 (s24): undefined
++	VFP reg89 (s25): undefined
++	VFP reg90 (s26): undefined
++	VFP reg91 (s27): undefined
++	VFP reg92 (s28): undefined
++	VFP reg93 (s29): undefined
++	VFP reg94 (s30): undefined
++	VFP reg95 (s31): undefined
+ 	FPA reg96 (f0): undefined
+ 	FPA reg97 (f1): undefined
+ 	FPA reg98 (f2): undefined
+@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
+ 	FPA reg101 (f5): undefined
+ 	FPA reg102 (f6): undefined
+ 	FPA reg103 (f7): undefined
+-	integer reg128 (spsr): undefined
++	MMX reg104 (wcgr0): undefined
++	MMX reg105 (wcgr1): undefined
++	MMX reg106 (wcgr2): undefined
++	MMX reg107 (wcgr3): undefined
++	MMX reg108 (wcgr4): undefined
++	MMX reg109 (wcgr5): undefined
++	MMX reg110 (wcgr6): undefined
++	MMX reg111 (wcgr7): undefined
++	MMX reg112 (wr0): undefined
++	MMX reg113 (wr1): undefined
++	MMX reg114 (wr2): undefined
++	MMX reg115 (wr3): undefined
++	MMX reg116 (wr4): undefined
++	MMX reg117 (wr5): undefined
++	MMX reg118 (wr6): undefined
++	MMX reg119 (wr7): undefined
++	MMX reg120 (wr8): undefined
++	MMX reg121 (wr9): undefined
++	MMX reg122 (wr10): undefined
++	MMX reg123 (wr11): undefined
++	MMX reg124 (wr12): undefined
++	MMX reg125 (wr13): undefined
++	MMX reg126 (wr14): undefined
++	MMX reg127 (wr15): undefined
++	state reg128 (spsr): undefined
++	state reg129 (spsr_fiq): undefined
++	state reg130 (spsr_irq): undefined
++	state reg131 (spsr_abt): undefined
++	state reg132 (spsr_und): undefined
++	state reg133 (spsr_svc): undefined
++	integer reg144 (r8_usr): undefined
++	integer reg145 (r9_usr): undefined
++	integer reg146 (r10_usr): undefined
++	integer reg147 (r11_usr): undefined
++	integer reg148 (r12_usr): undefined
++	integer reg149 (r13_usr): undefined
++	integer reg150 (r14_usr): undefined
++	integer reg151 (r8_fiq): undefined
++	integer reg152 (r9_fiq): undefined
++	integer reg153 (r10_fiq): undefined
++	integer reg154 (r11_fiq): undefined
++	integer reg155 (r12_fiq): undefined
++	integer reg156 (r13_fiq): undefined
++	integer reg157 (r14_fiq): undefined
++	integer reg158 (r13_irq): undefined
++	integer reg159 (r14_irq): undefined
++	integer reg160 (r13_abt): undefined
++	integer reg161 (r14_abt): undefined
++	integer reg162 (r13_und): undefined
++	integer reg163 (r14_und): undefined
++	integer reg164 (r13_svc): undefined
++	integer reg165 (r14_svc): undefined
++	MMX reg192 (wc0): undefined
++	MMX reg193 (wc1): undefined
++	MMX reg194 (wc2): undefined
++	MMX reg195 (wc3): undefined
++	MMX reg196 (wc4): undefined
++	MMX reg197 (wc5): undefined
++	MMX reg198 (wc6): undefined
++	MMX reg199 (wc7): undefined
+ 	VFP reg256 (d0): undefined
+ 	VFP reg257 (d1): undefined
+ 	VFP reg258 (d2): undefined
+diff --git a/tests/run-allregs.sh b/tests/run-allregs.sh
+index 7ddd452..a31dba4 100755
 --- a/tests/run-allregs.sh
 +++ b/tests/run-allregs.sh
 @@ -2672,7 +2672,28 @@ integer registers:
@@ -468,11 +600,11 @@ Index: b/tests/run-allregs.sh
  EOF
  
  # See run-readelf-mixed-corenote.sh for instructions to regenerate
-Index: b/tests/run-readelf-mixed-corenote.sh
-===================================================================
+diff --git a/tests/run-readelf-mixed-corenote.sh b/tests/run-readelf-mixed-corenote.sh
+index 86171c4..018612f 100755
 --- a/tests/run-readelf-mixed-corenote.sh
 +++ b/tests/run-readelf-mixed-corenote.sh
-@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x27
+@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x274:
      pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
      utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
      orig_r0: -1, fpvalid: 1
@@ -490,114 +622,6 @@ Index: b/tests/run-readelf-mixed-corenote.sh
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
-Index: b/tests/run-addrcfi.sh
-===================================================================
---- a/tests/run-addrcfi.sh
-+++ b/tests/run-addrcfi.sh
-@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matc
- 	FPA reg21 (f5): undefined
- 	FPA reg22 (f6): undefined
- 	FPA reg23 (f7): undefined
-+	VFP reg64 (s0): undefined
-+	VFP reg65 (s1): undefined
-+	VFP reg66 (s2): undefined
-+	VFP reg67 (s3): undefined
-+	VFP reg68 (s4): undefined
-+	VFP reg69 (s5): undefined
-+	VFP reg70 (s6): undefined
-+	VFP reg71 (s7): undefined
-+	VFP reg72 (s8): undefined
-+	VFP reg73 (s9): undefined
-+	VFP reg74 (s10): undefined
-+	VFP reg75 (s11): undefined
-+	VFP reg76 (s12): undefined
-+	VFP reg77 (s13): undefined
-+	VFP reg78 (s14): undefined
-+	VFP reg79 (s15): undefined
-+	VFP reg80 (s16): undefined
-+	VFP reg81 (s17): undefined
-+	VFP reg82 (s18): undefined
-+	VFP reg83 (s19): undefined
-+	VFP reg84 (s20): undefined
-+	VFP reg85 (s21): undefined
-+	VFP reg86 (s22): undefined
-+	VFP reg87 (s23): undefined
-+	VFP reg88 (s24): undefined
-+	VFP reg89 (s25): undefined
-+	VFP reg90 (s26): undefined
-+	VFP reg91 (s27): undefined
-+	VFP reg92 (s28): undefined
-+	VFP reg93 (s29): undefined
-+	VFP reg94 (s30): undefined
-+	VFP reg95 (s31): undefined
- 	FPA reg96 (f0): undefined
- 	FPA reg97 (f1): undefined
- 	FPA reg98 (f2): undefined
-@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matc
- 	FPA reg101 (f5): undefined
- 	FPA reg102 (f6): undefined
- 	FPA reg103 (f7): undefined
--	integer reg128 (spsr): undefined
-+	MMX reg104 (wcgr0): undefined
-+	MMX reg105 (wcgr1): undefined
-+	MMX reg106 (wcgr2): undefined
-+	MMX reg107 (wcgr3): undefined
-+	MMX reg108 (wcgr4): undefined
-+	MMX reg109 (wcgr5): undefined
-+	MMX reg110 (wcgr6): undefined
-+	MMX reg111 (wcgr7): undefined
-+	MMX reg112 (wr0): undefined
-+	MMX reg113 (wr1): undefined
-+	MMX reg114 (wr2): undefined
-+	MMX reg115 (wr3): undefined
-+	MMX reg116 (wr4): undefined
-+	MMX reg117 (wr5): undefined
-+	MMX reg118 (wr6): undefined
-+	MMX reg119 (wr7): undefined
-+	MMX reg120 (wr8): undefined
-+	MMX reg121 (wr9): undefined
-+	MMX reg122 (wr10): undefined
-+	MMX reg123 (wr11): undefined
-+	MMX reg124 (wr12): undefined
-+	MMX reg125 (wr13): undefined
-+	MMX reg126 (wr14): undefined
-+	MMX reg127 (wr15): undefined
-+	state reg128 (spsr): undefined
-+	state reg129 (spsr_fiq): undefined
-+	state reg130 (spsr_irq): undefined
-+	state reg131 (spsr_abt): undefined
-+	state reg132 (spsr_und): undefined
-+	state reg133 (spsr_svc): undefined
-+	integer reg144 (r8_usr): undefined
-+	integer reg145 (r9_usr): undefined
-+	integer reg146 (r10_usr): undefined
-+	integer reg147 (r11_usr): undefined
-+	integer reg148 (r12_usr): undefined
-+	integer reg149 (r13_usr): undefined
-+	integer reg150 (r14_usr): undefined
-+	integer reg151 (r8_fiq): undefined
-+	integer reg152 (r9_fiq): undefined
-+	integer reg153 (r10_fiq): undefined
-+	integer reg154 (r11_fiq): undefined
-+	integer reg155 (r12_fiq): undefined
-+	integer reg156 (r13_fiq): undefined
-+	integer reg157 (r14_fiq): undefined
-+	integer reg158 (r13_irq): undefined
-+	integer reg159 (r14_irq): undefined
-+	integer reg160 (r13_abt): undefined
-+	integer reg161 (r14_abt): undefined
-+	integer reg162 (r13_und): undefined
-+	integer reg163 (r14_und): undefined
-+	integer reg164 (r13_svc): undefined
-+	integer reg165 (r14_svc): undefined
-+	MMX reg192 (wc0): undefined
-+	MMX reg193 (wc1): undefined
-+	MMX reg194 (wc2): undefined
-+	MMX reg195 (wc3): undefined
-+	MMX reg196 (wc4): undefined
-+	MMX reg197 (wc5): undefined
-+	MMX reg198 (wc6): undefined
-+	MMX reg199 (wc7): undefined
- 	VFP reg256 (d0): undefined
- 	VFP reg257 (d1): undefined
- 	VFP reg258 (d2): undefined
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch b/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
new file mode 100644
index 0000000..66de238
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
@@ -0,0 +1,35 @@
+From 5d45565e71ddab3d7848077b61eb0ca73c0bcbcc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jun 2018 16:01:14 +0800
+Subject: [PATCH] disable -Werror as it tends to break with new gcc versions
+
+Bug-Debian: https://bugs.debian.org/886004
+Last-Update: 2018-01-01
+
+Signed-off-by: Helmut Grohne <helmut@subdivi.de>
+
+Upstream-Status: Backport from debian
+mdisable_werror.patc and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ config/eu.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/config/eu.am b/config/eu.am
+index c2cc349..99b368e 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    -Wold-style-definition -Wstrict-prototypes \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch b/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
new file mode 100644
index 0000000..226ec7f
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
@@ -0,0 +1,57 @@
+From 91c0a0da2a8932f163d57db5d9d847bed6822502 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jun 2018 15:59:57 +0800
+Subject: [PATCH] fix gcc7 ftbfs
+
+Upstream-Status: Backport from debian
+fix-gcc7-ftbfs.diff and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/mips_retval.c   | 1 +
+ backends/parisc_retval.c | 1 +
+ src/ar.c                 | 2 +-
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+index 57487bb..e7973a8 100644
+--- a/backends/mips_retval.c
++++ b/backends/mips_retval.c
+@@ -390,6 +390,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+         }
+ 
+       /* Fallthrough to handle large types */
++      /* Fall through.  */
+ 
+     case DW_TAG_array_type:
+     large:
+diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
+index df7ec3a..988e1fe 100644
+--- a/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
+@@ -167,6 +167,7 @@ parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, in
+ 
+ 	/* Else fall through.  */
+       }
++      /* Fall through.  */
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+diff --git a/src/ar.c b/src/ar.c
+index 818115b..c77e9f4 100644
+--- a/src/ar.c
++++ b/src/ar.c
+@@ -1073,7 +1073,7 @@ do_oper_delete (const char *arfname, char **argv, int argc,
+ static bool
+ no0print (bool ofmt, char *buf, int bufsize, long int val)
+ {
+-  char tmpbuf[bufsize + 1];
++  char tmpbuf[bufsize + 1 + 4];
+   int ret = snprintf (tmpbuf, sizeof (tmpbuf), ofmt ? "%-*lo" : "%-*ld",
+ 		      bufsize, val);
+   if (ret >= (int) sizeof (tmpbuf))
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
similarity index 89%
rename from meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
index 56f852a..c0dbed7 100644
--- a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
@@ -1,10 +1,84 @@
-Upstream-Status: Backport [from debian]
+From c510c6c8523246dd79c6ea28d1646b153c23e491 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jun 2018 15:39:46 +0800
+Subject: [PATCH] hppa_backend
+
+Upstream-Status: Backport from debian
+hppa_backend.diff and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/Makefile.am      |   9 +-
+ backends/libebl_parisc.h  |   9 ++
+ backends/parisc_init.c    |  73 ++++++++++++++++
+ backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++++++++
+ backends/parisc_reloc.def | 128 ++++++++++++++++++++++++++++
+ backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++++++++++
+ backends/parisc_symbol.c  | 112 ++++++++++++++++++++++++
+ libelf/elf.h              |  11 +++
+ 8 files changed, 711 insertions(+), 3 deletions(-)
+ create mode 100644 backends/libebl_parisc.h
+ create mode 100644 backends/parisc_init.c
+ create mode 100644 backends/parisc_regs.c
+ create mode 100644 backends/parisc_reloc.def
+ create mode 100644 backends/parisc_retval.c
+ create mode 100644 backends/parisc_symbol.c
 
-Index: elfutils-0.170/backends/parisc_init.c
-===================================================================
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index 80aa00e..1e4b8e9 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -33,16 +33,16 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx m68k bpf riscv
++	  tilegx m68k bpf riscv parisc
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a
++	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
++	     libebl_parisc_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+-
+ libelf = ../libelf/libelf.so
+ libdw = ../libdw/libdw.so
+ libeu = ../lib/libeu.a
+@@ -135,6 +135,9 @@ riscv_SRCS = riscv_init.c riscv_symbol.c
+ libebl_riscv_pic_a_SOURCES = $(riscv_SRCS)
+ am_libebl_riscv_pic_a_OBJECTS = $(riscv_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
+ 	@rm -f $(@:.so=.map)
+diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
+new file mode 100644
+index 0000000..f473b79
+--- /dev/null
++++ b/backends/libebl_parisc.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_HPPA_H
++#define _LIBEBL_HPPA_H 1
++
++#include <libdw.h>
++
++extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
++extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+diff --git a/backends/parisc_init.c b/backends/parisc_init.c
+new file mode 100644
+index 0000000..f1e401c
 --- /dev/null
-+++ elfutils-0.170/backends/parisc_init.c
++++ b/backends/parisc_init.c
 @@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
@@ -79,10 +153,11 @@ Index: elfutils-0.170/backends/parisc_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.170/backends/parisc_regs.c
-===================================================================
+diff --git a/backends/parisc_regs.c b/backends/parisc_regs.c
+new file mode 100644
+index 0000000..3895f8e
 --- /dev/null
-+++ elfutils-0.170/backends/parisc_regs.c
++++ b/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -243,10 +318,11 @@ Index: elfutils-0.170/backends/parisc_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.170/backends/parisc_reloc.def
-===================================================================
+diff --git a/backends/parisc_reloc.def b/backends/parisc_reloc.def
+new file mode 100644
+index 0000000..1f875ba
 --- /dev/null
-+++ elfutils-0.170/backends/parisc_reloc.def
++++ b/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -376,10 +452,11 @@ Index: elfutils-0.170/backends/parisc_reloc.def
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-Index: elfutils-0.170/backends/parisc_retval.c
-===================================================================
+diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
+new file mode 100644
+index 0000000..df7ec3a
 --- /dev/null
-+++ elfutils-0.170/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -594,10 +671,11 @@ Index: elfutils-0.170/backends/parisc_retval.c
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-Index: elfutils-0.170/backends/parisc_symbol.c
-===================================================================
+diff --git a/backends/parisc_symbol.c b/backends/parisc_symbol.c
+new file mode 100644
+index 0000000..d111a76
 --- /dev/null
-+++ elfutils-0.170/backends/parisc_symbol.c
++++ b/backends/parisc_symbol.c
 @@ -0,0 +1,112 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
@@ -711,54 +789,11 @@ Index: elfutils-0.170/backends/parisc_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.170/backends/libebl_parisc.h
-===================================================================
---- /dev/null
-+++ elfutils-0.170/backends/libebl_parisc.h
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_HPPA_H
-+#define _LIBEBL_HPPA_H 1
-+
-+#include <libdw.h>
-+
-+extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-Index: elfutils-0.170/backends/Makefile.am
-===================================================================
---- elfutils-0.170.orig/backends/Makefile.am
-+++ elfutils-0.170/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf
-+	  tilegx m68k bpf parisc
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_m68k_pic.a libebl_bpf_pic.a
-+	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -124,6 +124,9 @@ cpu_bpf = ../libcpu/libcpu_bpf.a
- libebl_bpf_pic_a_SOURCES = $(bpf_SRCS)
- am_libebl_bpf_pic_a_OBJECTS = $(bpf_SRCS:.c=.os)
- 
-+parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
-+libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
-+am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
- 	@rm -f $(@:.so=.map)
-Index: elfutils-0.170/libelf/elf.h
-===================================================================
---- elfutils-0.170.orig/libelf/elf.h
-+++ elfutils-0.170/libelf/elf.h
-@@ -2056,16 +2056,24 @@ enum
+diff --git a/libelf/elf.h b/libelf/elf.h
+index f774898..6c9f61e 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -2153,16 +2153,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -783,7 +818,7 @@ Index: elfutils-0.170/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -2074,6 +2082,7 @@ enum
+@@ -2171,6 +2179,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -791,7 +826,7 @@ Index: elfutils-0.170/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -2099,6 +2108,8 @@ enum
+@@ -2196,6 +2205,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
@@ -800,3 +835,6 @@ Index: elfutils-0.170/libelf/elf.h
  #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
  #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
  #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_backend.patch b/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
similarity index 97%
rename from meta/recipes-devtools/elfutils/files/debian/mips_backend.patch
rename to meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
index 2e0e54b..3004e19 100644
--- a/meta/recipes-devtools/elfutils/files/debian/mips_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
@@ -1,11 +1,13 @@
-From 46d0d0ca718093486eeeedf1b44134e9e29b56f7 Mon Sep 17 00:00:00 2001
+From 59ffb86bda845a68d3686afa7bc784131df678f7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 16 Aug 2017 09:18:59 +0800
-Subject: [PATCH] mips backends
+Date: Fri, 29 Jun 2018 15:45:58 +0800
+Subject: [PATCH] mips_backend
 
-Upstream-Status: Backport [from debian]
+Upstream-Status: Backport from debian
+mips_backend.diff and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 
-Rebase to 0.170
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/Makefile.am    |   8 +-
@@ -23,25 +25,26 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 backends/mips_symbol.c
 
 diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 7f1f5d4..91baf6e 100644
+index 1e4b8e9..e7bccf8 100644
 --- a/backends/Makefile.am
 +++ b/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+@@ -33,13 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf parisc
-+	  tilegx m68k bpf parisc mips
+-	  tilegx m68k bpf riscv parisc
++	  tilegx m68k bpf riscv parisc mips
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
  	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
  	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
-+	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a libebl_mips_pic.a
+ 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
+-	     libebl_parisc_pic.a
++	     libebl_parisc_pic.a libebl_mips_pic.a
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -128,6 +128,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
+@@ -139,6 +139,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
  libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
  am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
@@ -698,7 +701,7 @@ index 0000000..ba465fe
 +    }
 +}
 diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 1f81477..5371396 100644
+index 8b063f4..5405b0c 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
 @@ -72,6 +72,8 @@ static const struct
@@ -711,5 +714,5 @@ index 1f81477..5371396 100644
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
    { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
similarity index 48%
rename from meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
index 790930c..294944e 100644
--- a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
@@ -1,19 +1,30 @@
+From a188ea1ada6b990b72b91266ae02da058dcd9523 Mon Sep 17 00:00:00 2001
 From: Kurt Roeckx <kurt@roeckx.be>
-Subject: Make readelf -w output debug information on mips
+Date: Fri, 29 Jun 2018 15:49:32 +0800
+Subject: [PATCH] Make readelf -w output debug information on mips
+
 Bug-Debian: http://bugs.debian.org/662041
 Forwarded: not-needed
 
 Upstreams wants a change where this is handled by a hook that needs
 to be filled in by the backend for the arch.
 
-Upstream-Status: Backport [from debian]
+Signed-off-by: Kurt Roeckx <kurt@roeckx.be>
+
+Upstream-Status: Backport from debian
+mips_readelf_w.patch and rebase to 0.172
+
+http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/readelf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: b/src/readelf.c
-===================================================================
+diff --git a/src/readelf.c b/src/readelf.c
+index f185897..0db197c 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
-@@ -8343,7 +8343,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *
+@@ -10979,7 +10979,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *ebl, GElf_Ehdr *ehdr)
        GElf_Shdr shdr_mem;
        GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
  
@@ -23,3 +34,6 @@ Index: b/src/readelf.c
  	{
  	  static const struct
  	  {
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch b/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
new file mode 100644
index 0000000..14f6909
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
@@ -0,0 +1,57 @@
+From fe7613a3b9f2443cc11917826348d4521f267c96 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jun 2018 15:48:33 +0800
+Subject: [PATCH] testsuite ignore elflint
+
+On many architectures this test fails because binaries/libs produced by
+binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
+
+So we run the tests on all archs to see what breaks, but if it breaks we ignore
+the result (exitcode 77 means: this test was skipped).
+
+Upstream-Status: Backport from debian
+testsuite-ignore-elflint.diff and rebase to 0.172
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/run-elflint-self.sh |  2 +-
+ tests/test-subr.sh        | 15 +++++++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/tests/run-elflint-self.sh b/tests/run-elflint-self.sh
+index 58fa7d0..85d21a5 100755
+--- a/tests/run-elflint-self.sh
++++ b/tests/run-elflint-self.sh
+@@ -18,5 +18,5 @@
+ 
+ . $srcdir/test-subr.sh
+ 
+-testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
++testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+ testrun_on_self_compressed ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+diff --git a/tests/test-subr.sh b/tests/test-subr.sh
+index 09f428d..26f61f1 100644
+--- a/tests/test-subr.sh
++++ b/tests/test-subr.sh
+@@ -201,3 +201,18 @@ testrun_on_self_quiet()
+   # Only exit if something failed
+   if test $exit_status != 0; then exit $exit_status; fi
+ }
++
++# Same as testrun_on_self(), but skip on failure.
++testrun_on_self_skip()
++{
++  exit_status=0
++
++  for file in $self_test_files; do
++      testrun $* $file \
++	  || { echo "*** failure in $* $file"; exit_status=77; }
++  done
++
++  # Only exit if something failed
++  if test $exit_status != 0; then exit $exit_status; fi
++}
++
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
index b17498f..72125c9 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
@@ -4,9 +4,6 @@ Date: Mon, 5 Jan 2015 15:17:01 +0000
 Subject: [PATCH 2/3] Add support for mips64 abis in mips_retval.c
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/mips_retval.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-----
  1 file changed, 94 insertions(+), 10 deletions(-)
diff --git a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
index 2a5f862..6c0ae37 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
@@ -12,9 +12,6 @@ This patch also ensures that strip.c sets the correct value of e_machine
 before manipulating relocations so that these changes take effect.
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  libelf/gelf_getrel.c      | 25 +++++++++++++++++++++++--
  libelf/gelf_getrela.c     | 25 +++++++++++++++++++++++--
@@ -203,7 +200,7 @@ Index: b/src/strip.c
 ===================================================================
 --- a/src/strip.c
 +++ b/src/strip.c
-@@ -532,6 +532,23 @@ handle_elf (int fd, Elf *elf, const char
+@@ -598,6 +598,23 @@ handle_elf (int fd, Elf *elf, const char
        goto fail;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
new file mode 100644
index 0000000..4440e39
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
@@ -0,0 +1,14 @@
+Index: elfutils-0.165/tests/run-native-test.sh
+===================================================================
+--- elfutils-0.165.orig/tests/run-native-test.sh
++++ elfutils-0.165/tests/run-native-test.sh
+@@ -83,6 +83,9 @@ native_test()
+ # "cannot attach to process: Function not implemented".
+ [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
+ 
++# hurd's /proc/$PID/maps does not give paths yet.
++[ "$(uname)" = "GNU" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
diff --git a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
new file mode 100644
index 0000000..1e6d7a2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
@@ -0,0 +1,11 @@
+--- elfutils-0.165.orig/tests/run-strip-strmerge.sh
++++ elfutils-0.165/tests/run-strip-strmerge.sh
+@@ -30,7 +30,7 @@ remerged=remerged.elf
+ tempfiles $merged $stripped $debugfile $remerged
+ 
+ echo elflint $input
+-testrun ${abs_top_builddir}/src/elflint --gnu $input
++testrun_on_self_skip ${abs_top_builddir}/src/elflint --gnu $input
+ echo elfstrmerge
+ testrun ${abs_top_builddir}/tests/elfstrmerge -o $merged $input
+ echo elflint $merged
diff --git a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
new file mode 100644
index 0000000..9a19b58
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
@@ -0,0 +1,17 @@
+Index: b/tests/run-native-test.sh
+===================================================================
+--- a/tests/run-native-test.sh
++++ b/tests/run-native-test.sh
+@@ -77,6 +77,12 @@ native_test()
+   test $native -eq 0 || testrun "$@" -p $native > /dev/null
+ }
+ 
++# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
++# not give absolute paths due to sbuild's bind mounts (bug #570805)
++# therefore the next two test programs are expected to fail with
++# "cannot attach to process: Function not implemented".
++[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
-- 
2.7.4


