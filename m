Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1BF57E71B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 01:41:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7M1eYNA024246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 18:40:44 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 18:40:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 22 Aug 2019 09:40:18 +0800
Message-ID: <1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Thu, 22 Aug 2019 01:41:14 -0000
Content-Type: text/plain

- Update Debian patches
  http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz

- Rebase Debian patches to 0.177
  debian/hppa_backend.diff
  debian/mips_backend.diff
  debian/arm_backend.diff
  debian/mips_readelf_w.patch
  debian/testsuite-ignore-elflint.diff
  debian/mips_cfi.patch

- Fix build failure while applying debian patches
  0001-fix-compile-failure-with-debian-patches.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{elfutils_0.176.bb => elfutils_0.177.bb}       |   8 +-
 ...ferences-between-mips-machine-identifiers.patch |  12 +-
 ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
 ...-support-for-mips64-abis-in-mips_retval.c.patch |  13 +-
 .../0003-Add-mips-n64-relocation-format-hack.patch |  60 +++++-----
 .../elfutils/files/debian/arm_backend.diff         |  39 +++---
 .../elfutils/files/debian/disable_werror.patch     |  19 +--
 .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
 .../elfutils/files/debian/hurd_path.patch          |  17 +--
 .../elfutils/files/debian/ignore_strmerge.diff     |  15 +--
 .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
 .../elfutils/files/debian/mips_backend.diff        |  42 ++++---
 .../elfutils/files/debian/mips_cfi.patch           | 131 +++++++++++++++++++++
 .../elfutils/files/debian/mips_readelf_w.patch     |  22 ++--
 .../files/debian/testsuite-ignore-elflint.diff     |  22 ++--
 15 files changed, 340 insertions(+), 178 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.176.bb => elfutils_0.177.bb} (95%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.176.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.177.bb
index d98457e..fcebb4b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.175-1.debian.tar.xz
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
@@ -28,6 +28,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/ignore_strmerge.diff \
            file://debian/disable_werror.patch \
            file://debian/testsuite-ignore-elflint.diff \
+           file://debian/mips_cfi.patch \
+           file://debian/0001-fix-compile-failure-with-debian-patches.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://run-ptest \
            file://ptest.patch \
@@ -38,8 +40,8 @@ SRC_URI_append_libc-musl = " \
            file://musl-utils.patch \
            file://musl-tests.patch \
            "
-SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
-SRC_URI[sha256sum] = "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
+SRC_URI[md5sum] = "0b583722f911e1632544718d502aab87"
+SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc05042e"
 
 inherit autotools gettext ptest
 
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
index 892b8e8..a2983c5 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -1,25 +1,25 @@
-From 46d2c2f8fecad85baeed9fe211f5285820220442 Mon Sep 17 00:00:00 2001
+From 77cb4a53c270d5854d3af24f19547bc3de825233 Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:16:58 +0000
-Subject: [PATCH] Ignore differences between mips machine identifiers
+Subject: [PATCH 1/3] Ignore differences between mips machine identifiers
 
 Little endian binaries actually use EM_MIPS so you can't tell the endianness
 from the elf machine id. Also, the EM_MIPS_RS3_LE machine is dead anyway (the
 kernel will not load binaries containing it).
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  backends/mips_init.c | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-index 975c04e..8482e7f 100644
+Index: b/backends/mips_init.c
+===================================================================
 --- a/backends/mips_init.c
 +++ b/backends/mips_init.c
-@@ -45,11 +45,7 @@ mips_init (Elf *elf __attribute__ ((unused)),
+@@ -45,11 +45,7 @@ mips_init (Elf *elf __attribute__ ((unus
      return NULL;
  
    /* We handle it.  */
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch b/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
new file mode 100644
index 0000000..19a2015
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
@@ -0,0 +1,48 @@
+From 3f3e7b16934ec58ab47d2bdc9982f54a55b07534 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 Aug 2019 16:25:33 +0800
+Subject: [PATCH] fix compile failure with debian patches
+
+While applying debian patches, there is a compile failure
+...
+elfutils-0.177/backends/mips_init.c:48:5: error: 'Ebl' {aka 'struct ebl'} has no member named 'name'
+...
+
+Since upstream applied commit [b323391 libdwelf: Add dwelf_elf_e_machine_string
+and use it in readelf], it remove 'name' from 'struct ebl'
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/mips_init.c   | 1 -
+ backends/parisc_init.c | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/backends/mips_init.c b/backends/mips_init.c
+index bce5abe..e1c65c8 100644
+--- a/backends/mips_init.c
++++ b/backends/mips_init.c
+@@ -45,7 +45,6 @@ mips_init (Elf *elf __attribute__ ((unused)),
+     return NULL;
+ 
+   /* We handle it.  */
+-  eh->name = "MIPS";
+   mips_init_reloc (eh);
+   HOOK (eh, reloc_simple_type);
+   HOOK (eh, return_value_location);
+diff --git a/backends/parisc_init.c b/backends/parisc_init.c
+index f1e401c..97b4a8c 100644
+--- a/backends/parisc_init.c
++++ b/backends/parisc_init.c
+@@ -56,7 +56,6 @@ parisc_init (Elf *elf __attribute__ ((unused)),
+       pa64 = 1;
+   }
+   /* We handle it.  */
+-  eh->name = "PA-RISC";
+   parisc_init_reloc (eh);
+   HOOK (eh, reloc_simple_type);
+   HOOK (eh, machine_flag_check);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
index 7c0b9c6..aee00cb 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
@@ -1,18 +1,18 @@
-From 93ae9bb7d25a1adbcbab23a9b8493f370a93f0a3 Mon Sep 17 00:00:00 2001
+From fdaab18a65ed2529656baa64cb6169f34d7e507b Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:01 +0000
-Subject: [PATCH] Add support for mips64 abis in mips_retval.c
+Subject: [PATCH 2/3] Add support for mips64 abis in mips_retval.c
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
- backends/mips_retval.c | 104 +++++++++++++++++++++++++++++++++++++----
+ backends/mips_retval.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-----
  1 file changed, 94 insertions(+), 10 deletions(-)
 
 diff --git a/backends/mips_retval.c b/backends/mips_retval.c
-index 656cd1f..57487bb 100644
+index 33f12a7..d5c6ef0 100644
 --- a/backends/mips_retval.c
 +++ b/backends/mips_retval.c
 @@ -91,6 +91,8 @@ enum mips_abi find_mips_abi(Elf *elf)
@@ -166,3 +166,6 @@ index 656cd1f..57487bb 100644
        *locp = loc_aggregate;
        return nloc_aggregate;
      }
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
index 17b98a7..c949e96 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
@@ -1,7 +1,7 @@
-From bce44aece915698a224a8aefa66784b27455675b Mon Sep 17 00:00:00 2001
+From 59d4b8c48e5040af7e02b34eb26ea602ec82a38e Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:02 +0000
-Subject: [PATCH] Add mips n64 relocation format hack
+Subject: [PATCH 3/3] Add mips n64 relocation format hack
 
 MIPSEL N64 ELF files use a slightly different format for storing relocation
 entries which is incompatible with the normal R_SYM / R_INFO macros.
@@ -12,9 +12,9 @@ This patch also ensures that strip.c sets the correct value of e_machine
 before manipulating relocations so that these changes take effect.
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  libelf/gelf_getrel.c      | 25 +++++++++++++++++++++++--
  libelf/gelf_getrela.c     | 25 +++++++++++++++++++++++--
@@ -23,10 +23,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/strip.c               | 17 +++++++++++++++++
  5 files changed, 101 insertions(+), 6 deletions(-)
 
-diff --git a/libelf/gelf_getrel.c b/libelf/gelf_getrel.c
-index 309e3d3..2a81a97 100644
---- a/libelf/gelf_getrel.c
-+++ b/libelf/gelf_getrel.c
+Index: elfutils-0.175/libelf/gelf_getrel.c
+===================================================================
+--- elfutils-0.175.orig/libelf/gelf_getrel.c
++++ elfutils-0.175/libelf/gelf_getrel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -35,7 +35,7 @@ index 309e3d3..2a81a97 100644
  
  GElf_Rel *
  gelf_getrel (Elf_Data *data, int ndx, GElf_Rel *dst)
-@@ -89,8 +90,28 @@ gelf_getrel (Elf_Data *data, int ndx, GElf_Rel *dst)
+@@ -89,8 +90,28 @@ gelf_getrel (Elf_Data *data, int ndx, GE
  	  result = NULL;
  	}
        else
@@ -66,10 +66,10 @@ index 309e3d3..2a81a97 100644
      }
  
    rwlock_unlock (scn->elf->lock);
-diff --git a/libelf/gelf_getrela.c b/libelf/gelf_getrela.c
-index d695f65..1f42a80 100644
---- a/libelf/gelf_getrela.c
-+++ b/libelf/gelf_getrela.c
+Index: elfutils-0.175/libelf/gelf_getrela.c
+===================================================================
+--- elfutils-0.175.orig/libelf/gelf_getrela.c
++++ elfutils-0.175/libelf/gelf_getrela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -78,7 +78,7 @@ index d695f65..1f42a80 100644
  
  GElf_Rela *
  gelf_getrela (Elf_Data *data, int ndx, GElf_Rela *dst)
-@@ -90,8 +91,28 @@ gelf_getrela (Elf_Data *data, int ndx, GElf_Rela *dst)
+@@ -90,8 +91,28 @@ gelf_getrela (Elf_Data *data, int ndx, G
  	  result = NULL;
  	}
        else
@@ -109,10 +109,10 @@ index d695f65..1f42a80 100644
      }
  
    rwlock_unlock (scn->elf->lock);
-diff --git a/libelf/gelf_update_rel.c b/libelf/gelf_update_rel.c
-index 14f62e9..9095556 100644
---- a/libelf/gelf_update_rel.c
-+++ b/libelf/gelf_update_rel.c
+Index: elfutils-0.175/libelf/gelf_update_rel.c
+===================================================================
+--- elfutils-0.175.orig/libelf/gelf_update_rel.c
++++ elfutils-0.175/libelf/gelf_update_rel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -121,7 +121,7 @@ index 14f62e9..9095556 100644
  
  int
  gelf_update_rel (Elf_Data *dst, int ndx, GElf_Rel *src)
-@@ -86,6 +87,9 @@ gelf_update_rel (Elf_Data *dst, int ndx, GElf_Rel *src)
+@@ -86,6 +87,9 @@ gelf_update_rel (Elf_Data *dst, int ndx,
      }
    else
      {
@@ -131,7 +131,7 @@ index 14f62e9..9095556 100644
        /* Check whether we have to resize the data buffer.  */
        if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
  	{
-@@ -93,7 +97,21 @@ gelf_update_rel (Elf_Data *dst, int ndx, GElf_Rel *src)
+@@ -93,7 +97,21 @@ gelf_update_rel (Elf_Data *dst, int ndx,
  	  goto out;
  	}
  
@@ -154,10 +154,10 @@ index 14f62e9..9095556 100644
      }
  
    result = 1;
-diff --git a/libelf/gelf_update_rela.c b/libelf/gelf_update_rela.c
-index 8825270..4caa85f 100644
---- a/libelf/gelf_update_rela.c
-+++ b/libelf/gelf_update_rela.c
+Index: elfutils-0.175/libelf/gelf_update_rela.c
+===================================================================
+--- elfutils-0.175.orig/libelf/gelf_update_rela.c
++++ elfutils-0.175/libelf/gelf_update_rela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -166,7 +166,7 @@ index 8825270..4caa85f 100644
  
  int
  gelf_update_rela (Elf_Data *dst, int ndx, GElf_Rela *src)
-@@ -89,6 +90,9 @@ gelf_update_rela (Elf_Data *dst, int ndx, GElf_Rela *src)
+@@ -89,6 +90,9 @@ gelf_update_rela (Elf_Data *dst, int ndx
      }
    else
      {
@@ -176,7 +176,7 @@ index 8825270..4caa85f 100644
        /* Check whether we have to resize the data buffer.  */
        if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
  	{
-@@ -96,7 +100,21 @@ gelf_update_rela (Elf_Data *dst, int ndx, GElf_Rela *src)
+@@ -96,7 +100,21 @@ gelf_update_rela (Elf_Data *dst, int ndx
  	  goto out;
  	}
  
@@ -199,11 +199,11 @@ index 8825270..4caa85f 100644
      }
  
    result = 1;
-diff --git a/src/strip.c b/src/strip.c
-index a73009d..75bd7ba 100644
---- a/src/strip.c
-+++ b/src/strip.c
-@@ -1062,6 +1062,23 @@ handle_elf (int fd, Elf *elf, const char *prefix, const char *fname,
+Index: elfutils-0.175/src/strip.c
+===================================================================
+--- elfutils-0.175.orig/src/strip.c
++++ elfutils-0.175/src/strip.c
+@@ -1062,6 +1062,23 @@ handle_elf (int fd, Elf *elf, const char
        goto fail;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
index 9904f24..ba0ce33 100644
--- a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
@@ -1,25 +1,25 @@
-From f3384466475eab373c0f1cb79c61d45709913b00 Mon Sep 17 00:00:00 2001
+From 4e6fededb3d8c90694c44214c862ac216a69ecae Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 28 May 2014 16:49:57 +0800
-Subject: [PATCH] elfutils: upgrade to 0.158
+Date: Wed, 21 Aug 2019 16:50:33 +0800
+Subject: [PATCH] arm_backend
 
 Upstream-Status: Pending [from debian]
+Rebase to 0.177
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
- backends/arm_init.c                 |  18 +++-
- backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++
- backends/arm_retval.c               |  43 ++++++++-
- backends/libebl_arm.h               |   9 ++
+ backends/arm_init.c                 |  18 ++++-
+ backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
+ backends/arm_retval.c               |  43 +++++++++++-
+ backends/libebl_arm.h               |   9 +++
  libelf/elf.h                        |  11 +++
- tests/run-addrcfi.sh                |  93 +++++++++++++++++++-
- tests/run-allregs.sh                |  95 +++++++++++++++++++-
+ tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
+ tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
  tests/run-readelf-mixed-corenote.sh |  11 ++-
  8 files changed, 400 insertions(+), 12 deletions(-)
  create mode 100644 backends/libebl_arm.h
 
 diff --git a/backends/arm_init.c b/backends/arm_init.c
-index f2b1b11..1b71f16 100644
+index af023f0..ea2bcb7 100644
 --- a/backends/arm_init.c
 +++ b/backends/arm_init.c
 @@ -35,20 +35,31 @@
@@ -53,9 +53,9 @@ index f2b1b11..1b71f16 100644
 +  }
 +
    /* We handle it.  */
-   eh->name = "ARM";
    arm_init_reloc (eh);
-@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unused)),
+   HOOK (eh, segment_type_name);
+@@ -59,7 +70,10 @@ arm_init (Elf *elf __attribute__ ((unused)),
    HOOK (eh, core_note);
    HOOK (eh, auxv_info);
    HOOK (eh, check_object_attribute);
@@ -324,10 +324,10 @@ index 0000000..c00770c
 +
 +#endif
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 6310054..5dc632b 100644
+index 01648bd..05b7e7e 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
-@@ -2694,6 +2694,9 @@ enum
+@@ -2690,6 +2690,9 @@ enum
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -337,7 +337,7 @@ index 6310054..5dc632b 100644
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2711,12 +2714,19 @@ enum
+@@ -2707,12 +2710,19 @@ enum
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -357,7 +357,7 @@ index 6310054..5dc632b 100644
  
  /* AArch64 relocs.  */
  
-@@ -3009,6 +3019,7 @@ enum
+@@ -3005,6 +3015,7 @@ enum
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -366,7 +366,7 @@ index 6310054..5dc632b 100644
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
 diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
-index fd89d02..462d7c5 100755
+index 64fa24d..1c2aa4d 100755
 --- a/tests/run-addrcfi.sh
 +++ b/tests/run-addrcfi.sh
 @@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
@@ -619,3 +619,6 @@ index c960f1d..e4bf074 100755
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch b/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
index bb5670a..bd98dae 100644
--- a/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
@@ -1,23 +1,16 @@
-From dece09fb8c59dbdab356b63fbe6b7554dd2461a4 Mon Sep 17 00:00:00 2001
 From: Helmut Grohne <helmut@subdivi.de>
-Date: Fri, 23 Nov 2018 15:47:20 +0800
-Subject: [PATCH] disable -Werror as it tends to break with new gcc versions
-
+Subject: disable -Werror as it tends to break with new gcc versions
 Bug-Debian: https://bugs.debian.org/886004
 Last-Update: 2018-01-01
 
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
----
- config/eu.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/config/eu.am b/config/eu.am
-index 82acda3..dede5c6 100644
---- a/config/eu.am
-+++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+Index: elfutils-0.176/config/eu.am
+===================================================================
+--- elfutils-0.176.orig/config/eu.am
++++ elfutils-0.176/config/eu.am
+@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -W
  	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
index afcc30a..4460d58 100644
--- a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
@@ -1,21 +1,21 @@
-From 8fe468682c550606ea961a1f996a8618940eb084 Mon Sep 17 00:00:00 2001
+From 8efad9105b38985bea373416ae8fcacf21d1d129 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 16 Jul 2010 12:26:46 +0800
-Subject: [PATCH] elfutils: upgrade to version 0.148
+Date: Wed, 21 Aug 2019 15:44:18 +0800
+Subject: [PATCH] hppa backend
 
+Rebase to 0.177
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
- backends/Makefile.am      |   8 +-
+ backends/Makefile.am      |   7 +-
  backends/libebl_parisc.h  |   9 ++
- backends/parisc_init.c    |  73 +++++++++++++
- backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++
- backends/parisc_reloc.def | 128 +++++++++++++++++++++++
- backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++
- backends/parisc_symbol.c  | 113 ++++++++++++++++++++
- libelf/elf.h              |  11 ++
- 8 files changed, 712 insertions(+), 2 deletions(-)
+ backends/parisc_init.c    |  73 ++++++++++++++++
+ backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++++++++
+ backends/parisc_reloc.def | 128 ++++++++++++++++++++++++++++
+ backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++++++++++
+ backends/parisc_symbol.c  | 113 ++++++++++++++++++++++++
+ libelf/elf.h              |  11 +++
+ 8 files changed, 711 insertions(+), 2 deletions(-)
  create mode 100644 backends/libebl_parisc.h
  create mode 100644 backends/parisc_init.c
  create mode 100644 backends/parisc_regs.c
@@ -24,35 +24,31 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 backends/parisc_symbol.c
 
 diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 2126a2e..5671a32 100644
+index 175468f..91a38e2 100644
 --- a/backends/Makefile.am
 +++ b/backends/Makefile.am
-@@ -33,12 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+@@ -33,16 +33,19 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv
-+	  tilegx m68k bpf riscv parisc
+-	  tilegx m68k bpf riscv csky
++	  tilegx m68k bpf riscv csky parisc
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
  	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
  	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a
-+	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
-+	     libebl_parisc_pic.a
+ 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a    \
+-	     libebl_csky_pic.a
++	     libebl_csky_pic.a libebl_parisc_pic.a
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -136,6 +137,9 @@ riscv_SRCS = riscv_init.c riscv_symbol.c riscv_cfi.c riscv_regs.c \
- libebl_riscv_pic_a_SOURCES = $(riscv_SRCS)
- am_libebl_riscv_pic_a_OBJECTS = $(riscv_SRCS:.c=.os)
- 
 +parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
 +libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
 +am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
- 	@rm -f $(@:.so=.map)
+ libelf = ../libelf/libelf.so
+ libdw = ../libdw/libdw.so
 diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
 new file mode 100644
 index 0000000..f473b79
@@ -785,10 +781,10 @@ index 0000000..5754bd8
 +    }
 +}
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 75043bc..6310054 100644
+index 01648bd..218ceb2 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
-@@ -2155,16 +2155,24 @@ enum
+@@ -2162,16 +2162,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -813,7 +809,7 @@ index 75043bc..6310054 100644
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -2173,6 +2181,7 @@ enum
+@@ -2180,6 +2188,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -821,7 +817,7 @@ index 75043bc..6310054 100644
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -2198,6 +2207,8 @@ enum
+@@ -2205,6 +2214,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
@@ -830,3 +826,6 @@ index 75043bc..6310054 100644
  #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
  #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
  #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
index f014ae2..62a960f 100644
--- a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
@@ -1,19 +1,10 @@
-From 2f54a8cf959ea83c452b1a22acbc47d2738b5fa0 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 23 Nov 2018 15:47:20 +0800
-Subject: [PATCH] elfutils: 0.170 -> 0.172
-
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
----
- tests/run-native-test.sh | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/run-native-test.sh b/tests/run-native-test.sh
-index 5351e02..70f6681 100755
---- a/tests/run-native-test.sh
-+++ b/tests/run-native-test.sh
+Index: elfutils-0.165/tests/run-native-test.sh
+===================================================================
+--- elfutils-0.165.orig/tests/run-native-test.sh
++++ elfutils-0.165/tests/run-native-test.sh
 @@ -83,6 +83,9 @@ native_test()
  # "cannot attach to process: Function not implemented".
  [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
diff --git a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
index 5333246..55513ee 100644
--- a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
@@ -1,19 +1,8 @@
-From d326ad99be856815260a04e573fc97044c02f444 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 2 Jul 2018 13:57:09 +0800
-Subject: [PATCH] elfutils: 0.170 -> 0.172
-
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
----
- tests/run-strip-strmerge.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/run-strip-strmerge.sh b/tests/run-strip-strmerge.sh
-index aa9c1eb..2bab8ec 100755
---- a/tests/run-strip-strmerge.sh
-+++ b/tests/run-strip-strmerge.sh
+--- elfutils-0.165.orig/tests/run-strip-strmerge.sh
++++ elfutils-0.165/tests/run-strip-strmerge.sh
 @@ -30,7 +30,7 @@ remerged=remerged.elf
  tempfiles $merged $stripped $debugfile $remerged
  
diff --git a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
index 805da80..e85a2fe 100644
--- a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
@@ -1,17 +1,8 @@
-From bac45996ece75900e0cde97f3889eaf6c1b286f8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 23 Nov 2018 15:47:20 +0800
-Subject: [PATCH] elfutils: 0.170 -> 0.172
-
 Upstream-Status: Pending [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
----
- tests/run-native-test.sh | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/tests/run-native-test.sh b/tests/run-native-test.sh
-index d19007f..5351e02 100755
+Index: b/tests/run-native-test.sh
+===================================================================
 --- a/tests/run-native-test.sh
 +++ b/tests/run-native-test.sh
 @@ -77,6 +77,12 @@ native_test()
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
index 697306f..1097b0e 100644
--- a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
@@ -1,18 +1,19 @@
-From 10a75fd2beefafe2043163f85426d0e575de58d8 Mon Sep 17 00:00:00 2001
+From 68b497668cde5171880d073a7ea50d11c3bddbfc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 16 Jul 2010 12:26:46 +0800
-Subject: [PATCH] elfutils: upgrade to version 0.148
+Date: Wed, 21 Aug 2019 15:49:52 +0800
+Subject: [PATCH] mips backend
 
+Rebase to 0.177
 Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/Makefile.am    |   8 +-
- backends/mips_init.c    |  59 ++++++++
- backends/mips_regs.c    | 104 +++++++++++++
- backends/mips_reloc.def |  79 ++++++++++
- backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++
- backends/mips_symbol.c  |  53 +++++++
+ backends/mips_init.c    |  59 +++++++++
+ backends/mips_regs.c    | 104 ++++++++++++++++
+ backends/mips_reloc.def |  79 ++++++++++++
+ backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++++++
+ backends/mips_symbol.c  |  53 ++++++++
  libebl/eblopenbackend.c |   2 +
  7 files changed, 624 insertions(+), 2 deletions(-)
  create mode 100644 backends/mips_init.c
@@ -22,28 +23,28 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 backends/mips_symbol.c
 
 diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 5671a32..ba84da6 100644
+index 91a38e2..aba8a4a 100644
 --- a/backends/Makefile.am
 +++ b/backends/Makefile.am
 @@ -33,13 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv parisc
-+	  tilegx m68k bpf riscv parisc mips
+-	  tilegx m68k bpf riscv csky parisc
++	  tilegx m68k bpf riscv csky parisc mips
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
  	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
  	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
- 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
--	     libebl_parisc_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a
+ 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a    \
+-	     libebl_csky_pic.a libebl_parisc_pic.a
++	     libebl_csky_pic.a libebl_parisc_pic.a libebl_mips_pic.a
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -141,6 +141,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
- libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
- am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+@@ -145,6 +145,10 @@ csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
+ libebl_csky_pic_a_SOURCES = $(csky_SRCS)
+ am_libebl_csky_pic_a_OBJECTS = $(csky_SRCS:.c=.os)
  
 +mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
 +libebl_mips_pic_a_SOURCES = $(mips_SRCS)
@@ -699,7 +700,7 @@ index 0000000..261b05d
 +    }
 +}
 diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index d54b720..6cf766f 100644
+index 01711f5..d0c3589 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
 @@ -71,6 +71,8 @@ static const struct
@@ -711,3 +712,6 @@ index d54b720..6cf766f 100644
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
    { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch b/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
new file mode 100644
index 0000000..fda4f68
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
@@ -0,0 +1,131 @@
+From 96e38289f2887ddb8e6d2fb91ea04bdbdf034ab5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 Aug 2019 17:00:30 +0800
+Subject: [PATCH 2/2] mips_cfi
+
+Upstream-Status: Pending [from debian]
+
+Rebase to 0.177
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/Makefile.am |  2 +-
+ backends/mips_cfi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ backends/mips_init.c |  1 +
+ 3 files changed, 82 insertions(+), 1 deletion(-)
+ create mode 100644 backends/mips_cfi.c
+
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index aba8a4a..6ac0eec 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -145,7 +145,7 @@ csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
+ libebl_csky_pic_a_SOURCES = $(csky_SRCS)
+ am_libebl_csky_pic_a_OBJECTS = $(csky_SRCS:.c=.os)
+ 
+-mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c mips_cfi.c
+ libebl_mips_pic_a_SOURCES = $(mips_SRCS)
+ am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
+ 
+diff --git a/backends/mips_cfi.c b/backends/mips_cfi.c
+new file mode 100644
+index 0000000..9ffdab5
+--- /dev/null
++++ b/backends/mips_cfi.c
+@@ -0,0 +1,80 @@
++/* MIPS ABI-specified defaults for DWARF CFI.
++   Copyright (C) 2018 Kurt Roeckx, Inc.
++   This file is part of elfutils.
++
++   This file is free software; you can redistribute it and/or modify
++   it under the terms of either
++
++     * the GNU Lesser General Public License as published by the Free
++       Software Foundation; either version 3 of the License, or (at
++       your option) any later version
++
++   or
++
++     * the GNU General Public License as published by the Free
++       Software Foundation; either version 2 of the License, or (at
++       your option) any later version
++
++   or both in parallel, as here.
++
++   elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received copies of the GNU General Public License and
++   the GNU Lesser General Public License along with this program.  If
++   not, see <http://www.gnu.org/licenses/>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <dwarf.h>
++
++#define BACKEND mips_
++#include "libebl_CPU.h"
++
++int
++mips_abi_cfi (Ebl *ebl __attribute__ ((unused)), Dwarf_CIE *abi_info)
++{
++  static const uint8_t abi_cfi[] =
++    {
++      /* Call-saved regs.  */
++      DW_CFA_same_value, ULEB128_7 (16), /* $16 */
++      DW_CFA_same_value, ULEB128_7 (17), /* $17 */
++      DW_CFA_same_value, ULEB128_7 (18), /* $18 */
++      DW_CFA_same_value, ULEB128_7 (19), /* $19 */
++      DW_CFA_same_value, ULEB128_7 (20), /* $20 */
++      DW_CFA_same_value, ULEB128_7 (21), /* $21 */
++      DW_CFA_same_value, ULEB128_7 (22), /* $22 */
++      DW_CFA_same_value, ULEB128_7 (23), /* $23 */
++      DW_CFA_same_value, ULEB128_7 (28), /* $28 */
++      DW_CFA_same_value, ULEB128_7 (29), /* $29 */
++      DW_CFA_same_value, ULEB128_7 (30), /* $30 */
++
++      DW_CFA_same_value, ULEB128_7 (52), /* $f20 */
++      DW_CFA_same_value, ULEB128_7 (53), /* $f21 */
++      DW_CFA_same_value, ULEB128_7 (54), /* $f22 */
++      DW_CFA_same_value, ULEB128_7 (55), /* $f23 */
++      DW_CFA_same_value, ULEB128_7 (56), /* $f24 */
++      DW_CFA_same_value, ULEB128_7 (57), /* $f25 */
++      DW_CFA_same_value, ULEB128_7 (58), /* $f26 */
++      DW_CFA_same_value, ULEB128_7 (59), /* $f27 */
++      DW_CFA_same_value, ULEB128_7 (60), /* $f28 */
++      DW_CFA_same_value, ULEB128_7 (61), /* $f29 */
++      DW_CFA_same_value, ULEB128_7 (62), /* $f30 */
++      DW_CFA_same_value, ULEB128_7 (63), /* $f31 */
++
++      /* The CFA is the SP.  */
++      DW_CFA_def_cfa, ULEB128_7 (29), ULEB128_7 (0),
++    };
++
++  abi_info->initial_instructions = abi_cfi;
++  abi_info->initial_instructions_end = &abi_cfi[sizeof abi_cfi];
++  abi_info->data_alignment_factor = 4;
++
++  abi_info->return_address_register = 31; /* $31 */
++
++  return 0;
++}
+diff --git a/backends/mips_init.c b/backends/mips_init.c
+index 8482e7f..bce5abe 100644
+--- a/backends/mips_init.c
++++ b/backends/mips_init.c
+@@ -50,6 +50,7 @@ mips_init (Elf *elf __attribute__ ((unused)),
+   HOOK (eh, reloc_simple_type);
+   HOOK (eh, return_value_location);
+   HOOK (eh, register_info);
++  HOOK (eh, abi_cfi);
+ 
+   return MODVERSION;
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
index 1737e0d..c6d42e1 100644
--- a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
@@ -1,23 +1,22 @@
-From 33da4b4347aacdfb8b1b42e06e29e68a4b882d96 Mon Sep 17 00:00:00 2001
-From: Kurt Roeckx <kurt@roeckx.be>
-Date: Mon, 4 Mar 2019 09:45:00 +0000
-Subject: [PATCH] Make readelf -w output debug information on mips
-
-Upstreams wants a change where this is handled by a hook that needs
-to be filled in by the backend for the arch.
+From 7bdc83296865cf2b2a5615dbdb7ac0d441fb1849 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 Aug 2019 16:55:01 +0800
+Subject: [PATCH] mips_readelf_w
 
 Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
+Rebase to 0.177
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/readelf.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/readelf.c b/src/readelf.c
-index 33706bd..ef13159 100644
+index 2084fb1..5c02a9b 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
-@@ -11148,7 +11148,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *ebl, GElf_Ehdr *ehdr)
+@@ -11256,7 +11256,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *ebl, GElf_Ehdr *ehdr)
        GElf_Shdr shdr_mem;
        GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
  
@@ -27,3 +26,6 @@ index 33706bd..ef13159 100644
  	{
  	  static const struct
  	  {
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
index c4ce20c..e37a6f6 100644
--- a/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
@@ -1,16 +1,19 @@
-From 03a343c6b1b72598fce654b8a638f106da44abfb Mon Sep 17 00:00:00 2001
-From: OpenEmbedded <oe.patch@oe>
-Date: Fri, 12 Apr 2019 08:05:50 +0000
-Subject: [PATCH] On many architectures this test fails because binaries/libs
- produced by binutils don't pass elflint. However elfutils shouldn't FTBFS
- because of this.
+From 6393b0e57872b3ffedf0dbd6784cd29694010878 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 Aug 2019 16:59:01 +0800
+Subject: [PATCH 1/2] testsuite-ignore-elflint
+
+On many architectures this test fails because binaries/libs produced by
+binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
 
 So we run the tests on all archs to see what breaks, but if it breaks we ignore
 the result (exitcode 77 means: this test was skipped).
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Pending [from debian]
+
+Rebase to 0.177
 
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  tests/run-elflint-self.sh |  2 +-
  tests/test-subr.sh        | 15 +++++++++++++++
@@ -50,3 +53,6 @@ index 09f428d..26f61f1 100644
 +  if test $exit_status != 0; then exit $exit_status; fi
 +}
 +
+-- 
+2.7.4
+
-- 
2.7.4


