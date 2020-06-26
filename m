Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.2882.1593155949445370530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZATN+tl9;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id d18so476236edv.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYhKaq+EwHbEO7Cem3zOvgKmq65+atsxqk+4p914FBk=;
        b=ZATN+tl90TQpBslfkmDm0EkgpwwBdHcUjdvS61v82psPIotQkkNYY+mfmAsYi5qh42
         OYSZCH/TX0It+plaQ3IdjruNNrbZHP95E8eQHy5xhWGo04wPo/5iYWCUDbimI2RWLi//
         qv/0Kfp1upqs2CjI6xX4V8PrMw+4nhf0a/ruX1gLi0veJDH2bzfUsXac+hpTYTQgL/mH
         WnGg2s1H6zmnosWShRe8TqEzBFY3QqK7+AOrAWdE4icJwA7ehr0HRRkowzysgGYQTLLM
         5dxSEKS5StPOSo050q6vHgEHTPsE1+vUyTdmq9lteYLaucqIwJPIEGp+zL8tP5KWejyG
         poiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYhKaq+EwHbEO7Cem3zOvgKmq65+atsxqk+4p914FBk=;
        b=HByWhh/sP+JyAENxFCNSd05oh2Eg8bLwcZz2l2bxEuRtARClv3Vqmq/mCL5isRbq1p
         9IbypjqYAxVQPH2OH0c9gEmeF3Sh3gTxmMCa/K7Ts5mVMP4V4Lty8jJ5gSjulCIR5fN6
         ZOvBx4MG7EedeSGH+Nsmzy88bmLTLw2HtMN8zOOPRCwqC0ip15tJv+5OdAtv+my9tbEW
         C4LE3LkLOiHlFsovjel1YhR+u6qNQ45rRVrR0tlCNO46TYFUDcIw0cTuyIuSYgpYq4ql
         dXp2OAkoMluZm9l5iz8yns6I9ToZJrKz8VrepsLXB85E3Xix/oKx7wpCLUsDCktdZSn2
         5wuA==
X-Gm-Message-State: AOAM532eRa0J2qhDxd9tQHZiYl2QSS+ql4/P/zL6o+5BeRjlWoJ5WKFW
	3lFX4C5FE7kiDl2iyMd6xd4H0s/iGP0=
X-Google-Smtp-Source: ABdhPJzlQYdihVATyese20mDuJtkhPJrsTRlgJYQOqWOoURuIOku/j+6LdwA+8gm3yinLmjsVw6rsw==
X-Received: by 2002:aa7:c6d1:: with SMTP id b17mr2069922eds.39.1593155945698;
        Fri, 26 Jun 2020 00:19:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/30] elfutils: upgrade 0.179 -> 0.180
Date: Fri, 26 Jun 2020 09:18:20 +0200
Message-Id: <20200626071844.29134-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop all the debian patches: they are very invasive, the use case is unclear,
and rebasing them is just too hard.

Refresh 0002-musl-libs.patch

Add a new musl fix: 0015-config-eu.am-do-not-use-Werror.patch

Add a reproducibility fix: 0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{elfutils_0.179.bb => elfutils_0.180.bb}  |  19 +-
 .../files/0001-musl-obstack-fts.patch         |  11 +-
 ...m-compile-test_nlist-with-standard-C.patch |  27 +
 .../elfutils/files/0002-musl-libs.patch       |  17 +-
 .../elfutils/files/0003-musl-utils.patch      |   7 +-
 .../files/0004-Fix-error-on-musl.patch        |   7 +-
 .../0015-config-eu.am-do-not-use-Werror.patch |  36 +
 ...ces-between-mips-machine-identifiers.patch |  34 -
 ...-compile-failure-with-debian-patches.patch |  48 -
 ...ort-for-mips64-abis-in-mips_retval.c.patch | 171 ----
 ...-Add-mips-n64-relocation-format-hack.patch | 229 -----
 .../elfutils/files/debian/arm_backend.diff    | 624 -------------
 .../files/debian/disable_werror.patch         |  20 -
 .../elfutils/files/debian/hppa_backend.diff   | 828 ------------------
 .../elfutils/files/debian/hurd_path.patch     |  17 -
 .../files/debian/ignore_strmerge.diff         |  14 -
 .../elfutils/files/debian/kfreebsd_path.patch |  20 -
 .../elfutils/files/debian/mips_backend.diff   | 724 ---------------
 .../elfutils/files/debian/mips_cfi.patch      | 129 ---
 .../files/debian/mips_readelf_w.patch         |  31 -
 .../debian/testsuite-ignore-elflint.diff      |  52 --
 21 files changed, 81 insertions(+), 2984 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.179.bb => elfutils_0.180.bb} (86%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.179.bb b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
similarity index 86%
rename from meta/recipes-devtools/elfutils/elfutils_0.179.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.180.bb
index 1da95ec1de..9f8bfc24f3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.179.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
@@ -15,33 +15,20 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0006-Fix-build-on-aarch64-musl.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
-           file://debian/hppa_backend.diff \
-           file://debian/arm_backend.diff \
-           file://debian/mips_backend.diff \
-           file://debian/mips_readelf_w.patch \
-           file://debian/kfreebsd_path.patch \
-           file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
-           file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
-           file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
-           file://debian/hurd_path.patch \
-           file://debian/ignore_strmerge.diff \
-           file://debian/disable_werror.patch \
-           file://debian/testsuite-ignore-elflint.diff \
-           file://debian/mips_cfi.patch \
-           file://debian/0001-fix-compile-failure-with-debian-patches.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
            file://run-ptest \
            file://ptest.patch \
+           file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
            file://0002-musl-libs.patch \
            file://0003-musl-utils.patch \
            file://0004-Fix-error-on-musl.patch \
+           file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[md5sum] = "8ee56b371b5a7ea081284c44e5164600"
-SRC_URI[sha256sum] = "25a545566cbacaa37ae6222e58f1c48ea4570f53ba991886e2f5ce96e22a23a2"
+SRC_URI[sha256sum] = "b827b6e35c59d188ba97d7cf148fa8dc6f5c68eb6c5981888dfdbb758c0b569d"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
index f751a2ecdb..2450b0d6b8 100644
--- a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
@@ -1,7 +1,7 @@
-From 8ccf3d92b8766b53f203df7e01b489604ef851f3 Mon Sep 17 00:00:00 2001
+From 1ec7b2208803e0fbdcbe6c07b849e7dc4d9fa8a2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:17:25 +0800
-Subject: [PATCH 1/4] musl-obstack-fts
+Subject: [PATCH] musl-obstack-fts
 
 Look for libfts and libobstack during configure, these
 libraries are external to libc when using musl, whereas
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cad7b2b..6d4229b 100644
+index e9649c2..03643c8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -529,6 +529,60 @@ else
+@@ -538,6 +538,60 @@ else
  fi
  AC_SUBST([argp_LDADD])
  
@@ -122,6 +122,3 @@ index 13d9bda..d5a4f7d 100644
  unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
  stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) $(demanglelib)
  elfcompress_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
new file mode 100644
index 0000000000..481b912387
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -0,0 +1,27 @@
+From 1ca86294ee5454592c9ad855e13080509d8a92d3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 23 Jun 2020 07:49:35 +0000
+Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
+
+Otherwise, it will contain build paths in it and wont
+be reproducible.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 8048b69..d2b28a4 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -86,7 +86,7 @@ backtrace-child-biarch$(EXEEXT): backtrace-child.c
+ test-nlist$(EXEEXT): test-nlist.c
+ 	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+ 	  $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	  $(test_nlist_CFLAGS) $(test_nlist_LDADD) -o $@ $<
++	  $(CFLAGS) $(test_nlist_LDADD) -o $@ $<
+ 
+ TESTS = run-arextract.sh run-arsymtest.sh run-ar.sh newfile test-nlist \
+ 	update1 update2 update3 update4 \
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index cf14683864..d5ec0ec9e5 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,7 +1,7 @@
-From ea908c7009de5a208383abf4bec4c6b3d9519ca3 Mon Sep 17 00:00:00 2001
+From 9a57efb0f826a70ae360aa55504ee2de656b92b6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
-Subject: [PATCH 2/4] musl-libs
+Subject: [PATCH] musl-libs
 
 Collection of fixes needed to compile libelf and other libraries
 provided by elfutils for musl targets
@@ -104,7 +104,7 @@ index 7bcf61c..11dcc8b 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index d46ab5a..1c3faee 100644
+index 0434f1e..5afaee8 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -50,6 +50,7 @@
@@ -116,7 +116,7 @@ index d46ab5a..1c3faee 100644
  /* If fts.h is included before config.h, its indirect inclusions may not
     give us the right LFS aliases of these functions, so map them manually.  */
 diff --git a/libelf/elf.h b/libelf/elf.h
-index bed273d..be228e6 100644
+index 197b557..8e5b94c 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -130,9 +130,9 @@ index bed273d..be228e6 100644
  
  /* Standard ELF types.  */
  
-@@ -4029,6 +4031,7 @@ enum
- #define R_NDS32_TLS_TPOFF	102
- #define R_NDS32_TLS_DESC	119
+@@ -4103,6 +4105,7 @@ enum
+ #define R_ARC_TLS_LE_S9		0x4a
+ #define R_ARC_TLS_LE_32		0x4b
  
 -__END_DECLS
 -
@@ -140,6 +140,3 @@ index bed273d..be228e6 100644
 +}
 +#endif
  #endif	/* elf.h */
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 79c9d9ad57..4f28d9d027 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,7 +1,7 @@
-From 94028b16e56c8eef1aa02dcc4da268a0e471b4ea Mon Sep 17 00:00:00 2001
+From 6923400b777d4ba6f040c4006413bf997326460f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
-Subject: [PATCH 3/4] musl-utils
+Subject: [PATCH] musl-utils
 
 Provide missing defines which otherwise are available on glibc system headers
 
@@ -161,6 +161,3 @@ index 9b8c09a..1fb5063 100644
  /* Name and version of program.  */
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index 1b2f9ed98b..481e4b38eb 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,7 +1,7 @@
-From 7ff8cbecde7455b530fa7894a78d2326799f2556 Mon Sep 17 00:00:00 2001
+From 48b769ab692c8f02c1ae467229fe3404f662098a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
-Subject: [PATCH 4/4] Fix error on musl:
+Subject: [PATCH] Fix error on musl:
 
 | ../../elfutils-0.176/tests/elfstrmerge.c: In function 'main':
 | ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: 'ALLPERMS' undeclared (first use in this function); did you mean 'EPERM'?
@@ -34,6 +34,3 @@ index ba0d68d..1d2447f 100644
  /* The original ELF file.  */
  static int fd = -1;
  static Elf *elf = NULL;
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
new file mode 100644
index 0000000000..c3ae357265
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -0,0 +1,36 @@
+From dce2187dd8f592316357b200ebbe8dbed9ee65cb Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 22 Jun 2020 21:35:16 +0000
+Subject: [PATCH] config/eu.am: do not use -Werror
+
+Due to re-definition of error() on musl, gcc starts throwing
+errors where none happen with glibc. Since upstream is not
+likely to be interested in musl builds, lets just disable
+Werror.
+
+Upstream-Status: Inappropriate [oe core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ config/eu.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/eu.am b/config/eu.am
+index 6c3c444..3bc0dc9 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+@@ -83,7 +82,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   -Wtrampolines \
+ 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	   $(if $($(*F)_no_Werror),,-Werror) \
+ 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
deleted file mode 100644
index a2983c5770..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 77cb4a53c270d5854d3af24f19547bc3de825233 Mon Sep 17 00:00:00 2001
-From: James Cowgill <james410@cowgill.org.uk>
-Date: Mon, 5 Jan 2015 15:16:58 +0000
-Subject: [PATCH 1/3] Ignore differences between mips machine identifiers
-
-Little endian binaries actually use EM_MIPS so you can't tell the endianness
-from the elf machine id. Also, the EM_MIPS_RS3_LE machine is dead anyway (the
-kernel will not load binaries containing it).
-
-Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/mips_init.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-Index: b/backends/mips_init.c
-===================================================================
---- a/backends/mips_init.c
-+++ b/backends/mips_init.c
-@@ -45,11 +45,7 @@ mips_init (Elf *elf __attribute__ ((unus
-     return NULL;
- 
-   /* We handle it.  */
--  if (machine == EM_MIPS)
--    eh->name = "MIPS R3000 big-endian";
--  else if (machine == EM_MIPS_RS3_LE)
--    eh->name = "MIPS R3000 little-endian";
--
-+  eh->name = "MIPS";
-   mips_init_reloc (eh);
-   HOOK (eh, reloc_simple_type);
-   HOOK (eh, return_value_location);
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch b/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
deleted file mode 100644
index 19a2015062..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/0001-fix-compile-failure-with-debian-patches.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3f3e7b16934ec58ab47d2bdc9982f54a55b07534 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 16:25:33 +0800
-Subject: [PATCH] fix compile failure with debian patches
-
-While applying debian patches, there is a compile failure
-...
-elfutils-0.177/backends/mips_init.c:48:5: error: 'Ebl' {aka 'struct ebl'} has no member named 'name'
-...
-
-Since upstream applied commit [b323391 libdwelf: Add dwelf_elf_e_machine_string
-and use it in readelf], it remove 'name' from 'struct ebl'
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/mips_init.c   | 1 -
- backends/parisc_init.c | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-index bce5abe..e1c65c8 100644
---- a/backends/mips_init.c
-+++ b/backends/mips_init.c
-@@ -45,7 +45,6 @@ mips_init (Elf *elf __attribute__ ((unused)),
-     return NULL;
- 
-   /* We handle it.  */
--  eh->name = "MIPS";
-   mips_init_reloc (eh);
-   HOOK (eh, reloc_simple_type);
-   HOOK (eh, return_value_location);
-diff --git a/backends/parisc_init.c b/backends/parisc_init.c
-index f1e401c..97b4a8c 100644
---- a/backends/parisc_init.c
-+++ b/backends/parisc_init.c
-@@ -56,7 +56,6 @@ parisc_init (Elf *elf __attribute__ ((unused)),
-       pa64 = 1;
-   }
-   /* We handle it.  */
--  eh->name = "PA-RISC";
-   parisc_init_reloc (eh);
-   HOOK (eh, reloc_simple_type);
-   HOOK (eh, machine_flag_check);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
deleted file mode 100644
index aee00cba14..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From fdaab18a65ed2529656baa64cb6169f34d7e507b Mon Sep 17 00:00:00 2001
-From: James Cowgill <james410@cowgill.org.uk>
-Date: Mon, 5 Jan 2015 15:17:01 +0000
-Subject: [PATCH 2/3] Add support for mips64 abis in mips_retval.c
-
-Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/mips_retval.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-----
- 1 file changed, 94 insertions(+), 10 deletions(-)
-
-diff --git a/backends/mips_retval.c b/backends/mips_retval.c
-index 33f12a7..d5c6ef0 100644
---- a/backends/mips_retval.c
-+++ b/backends/mips_retval.c
-@@ -91,6 +91,8 @@ enum mips_abi find_mips_abi(Elf *elf)
-     default:
-       if ((elf_flags & EF_MIPS_ABI2))
- 	return MIPS_ABI_N32;
-+      else if ((ehdr->e_ident[EI_CLASS] == ELFCLASS64))
-+	return MIPS_ABI_N64;
-     }
- 
-   /* GCC creates a pseudo-section whose name describes the ABI.  */
-@@ -195,6 +197,57 @@ static const Dwarf_Op loc_aggregate[] =
-   };
- #define nloc_aggregate 1
- 
-+/* Test if a struct member is a float */
-+static int is_float_child(Dwarf_Die *childdie)
-+{
-+  /* Test if this is actually a struct member */
-+  if (dwarf_tag(childdie) != DW_TAG_member)
-+    return 0;
-+
-+  /* Get type of member */
-+  Dwarf_Attribute attr_mem;
-+  Dwarf_Die child_type_mem;
-+  Dwarf_Die *child_typedie =
-+    dwarf_formref_die(dwarf_attr_integrate(childdie,
-+                                           DW_AT_type,
-+                                           &attr_mem), &child_type_mem);
-+
-+  if (dwarf_tag(child_typedie) != DW_TAG_base_type)
-+    return 0;
-+
-+  /* Get base subtype */
-+  Dwarf_Word encoding;
-+  if (dwarf_formudata (dwarf_attr_integrate (child_typedie,
-+                                             DW_AT_encoding,
-+                                             &attr_mem), &encoding) != 0)
-+    return 0;
-+
-+  return encoding == DW_ATE_float;
-+}
-+
-+/* Returns the number of fpregs which can be returned in the given struct */
-+static int get_struct_fpregs(Dwarf_Die *structtypedie)
-+{
-+  Dwarf_Die child_mem;
-+  int fpregs = 0;
-+
-+  /* Get first structure member */
-+  if (dwarf_child(structtypedie, &child_mem) != 0)
-+    return 0;
-+
-+  do
-+    {
-+      /* Ensure this register is a float */
-+      if (!is_float_child(&child_mem))
-+        return 0;
-+
-+      fpregs++;
-+    }
-+  while (dwarf_siblingof (&child_mem, &child_mem) == 0);
-+
-+  return fpregs;
-+}
-+
- int
- mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
- {
-@@ -240,6 +293,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-       tag = dwarf_tag (typedie);
-     }
- 
-+  Dwarf_Word size;
-   switch (tag)
-     {
-     case -1:
-@@ -258,8 +312,6 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-     case DW_TAG_enumeration_type:
-     case DW_TAG_pointer_type:
-     case DW_TAG_ptr_to_member_type:
--      {
--        Dwarf_Word size;
- 	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
- 					 &attr_mem), &size) != 0)
- 	  {
-@@ -289,7 +341,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
- 		if (size <= 4*regsize && abi == MIPS_ABI_O32)
-                   return nloc_fpregquad;
- 
--		goto aggregate;
-+		goto large;
- 	      }
- 	  }
- 	*locp = ABI_LOC(loc_intreg, regsize);
-@@ -298,18 +350,50 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
- 	if (size <= 2*regsize)
- 	  return nloc_intregpair;
- 
--	/* Else fall through. Shouldn't happen though (at least with gcc) */
--      }
-+	/* Else pass in memory. Shouldn't happen though (at least with gcc) */
-+	goto large;
- 
-     case DW_TAG_structure_type:
-     case DW_TAG_class_type:
-     case DW_TAG_union_type:
--    case DW_TAG_array_type:
--    aggregate:
--      /* XXX TODO: Can't handle structure return with other ABI's yet :-/ */
--      if ((abi != MIPS_ABI_O32) && (abi != MIPS_ABI_O64))
--        return -2;
-+      /* Handle special cases for structures <= 128 bytes in newer ABIs */
-+      if (abi == MIPS_ABI_EABI32 || abi == MIPS_ABI_EABI64 ||
-+          abi == MIPS_ABI_N32 || abi == MIPS_ABI_N64)
-+        {
-+          if (dwarf_aggregate_size (typedie, &size) == 0 && size <= 16)
-+            {
-+              /*
-+               * Special case in N64 / N32 -
-+               * structures containing only floats are returned in fp regs.
-+               * Everything else is returned in integer regs.
-+               */
-+              if (tag != DW_TAG_union_type &&
-+                  (abi == MIPS_ABI_N32 || abi == MIPS_ABI_N64))
-+                {
-+                  int num_fpregs = get_struct_fpregs(typedie);
-+                  if (num_fpregs == 1 || num_fpregs == 2)
-+                    {
-+                      *locp = loc_fpreg;
-+                      if (num_fpregs == 1)
-+                        return nloc_fpreg;
-+                      else
-+                        return nloc_fpregpair;
-+                    }
-+                }
-+
-+              *locp = loc_intreg;
-+              if (size <= 8)
-+                return nloc_intreg;
-+              else
-+                return nloc_intregpair;
-+            }
-+        }
-+
-+      /* Fallthrough to handle large types */
- 
-+    case DW_TAG_array_type:
-+    large:
-+      /* Return large structures in memory */
-       *locp = loc_aggregate;
-       return nloc_aggregate;
-     }
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
deleted file mode 100644
index c949e96533..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From 59d4b8c48e5040af7e02b34eb26ea602ec82a38e Mon Sep 17 00:00:00 2001
-From: James Cowgill <james410@cowgill.org.uk>
-Date: Mon, 5 Jan 2015 15:17:02 +0000
-Subject: [PATCH 3/3] Add mips n64 relocation format hack
-
-MIPSEL N64 ELF files use a slightly different format for storing relocation
-entries which is incompatible with the normal R_SYM / R_INFO macros.
-To workaround this, we rearrange the bytes in the relocation's r_info field
-when reading and writing the relocations.
-
-This patch also ensures that strip.c sets the correct value of e_machine
-before manipulating relocations so that these changes take effect.
-
-Signed-off-by: James Cowgill <james410@cowgill.org.uk>
-
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libelf/gelf_getrel.c      | 25 +++++++++++++++++++++++--
- libelf/gelf_getrela.c     | 25 +++++++++++++++++++++++--
- libelf/gelf_update_rel.c  | 20 +++++++++++++++++++-
- libelf/gelf_update_rela.c | 20 +++++++++++++++++++-
- src/strip.c               | 17 +++++++++++++++++
- 5 files changed, 101 insertions(+), 6 deletions(-)
-
-Index: elfutils-0.175/libelf/gelf_getrel.c
-===================================================================
---- elfutils-0.175.orig/libelf/gelf_getrel.c
-+++ elfutils-0.175/libelf/gelf_getrel.c
-@@ -36,6 +36,7 @@
- 
- #include "libelfP.h"
- 
-+#define EF_MIPS_ABI	0x0000F000
- 
- GElf_Rel *
- gelf_getrel (Elf_Data *data, int ndx, GElf_Rel *dst)
-@@ -89,8 +90,28 @@ gelf_getrel (Elf_Data *data, int ndx, GE
- 	  result = NULL;
- 	}
-       else
--	result = memcpy (dst, &((Elf64_Rel *) data_scn->d.d_buf)[ndx],
--			 sizeof (Elf64_Rel));
-+        {
-+          GElf_Ehdr hdr;
-+          result = memcpy (dst, &((Elf64_Rel *) data_scn->d.d_buf)[ndx],
-+                           sizeof (Elf64_Rel));
-+
-+          if (gelf_getehdr(scn->elf, &hdr) != NULL &&
-+              hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
-+              hdr.e_machine == EM_MIPS &&
-+              (hdr.e_flags & EF_MIPS_ABI) == 0)
-+            {
-+              /*
-+               * The relocation format is mangled on MIPSEL N64
-+               *  We'll adjust it so at least R_SYM will work on it
-+               */
-+              GElf_Xword r_info = dst->r_info;
-+              dst->r_info = (r_info << 32) |
-+                            ((r_info >> 8) & 0xFF000000) |
-+                            ((r_info >> 24) & 0x00FF0000) |
-+                            ((r_info >> 40) & 0x0000FF00) |
-+                            ((r_info >> 56) & 0x000000FF);
-+            }
-+        }
-     }
- 
-   rwlock_unlock (scn->elf->lock);
-Index: elfutils-0.175/libelf/gelf_getrela.c
-===================================================================
---- elfutils-0.175.orig/libelf/gelf_getrela.c
-+++ elfutils-0.175/libelf/gelf_getrela.c
-@@ -36,6 +36,7 @@
- 
- #include "libelfP.h"
- 
-+#define EF_MIPS_ABI	0x0000F000
- 
- GElf_Rela *
- gelf_getrela (Elf_Data *data, int ndx, GElf_Rela *dst)
-@@ -90,8 +91,28 @@ gelf_getrela (Elf_Data *data, int ndx, G
- 	  result = NULL;
- 	}
-       else
--	result = memcpy (dst, &((Elf64_Rela *) data_scn->d.d_buf)[ndx],
--			 sizeof (Elf64_Rela));
-+        {
-+          GElf_Ehdr hdr;
-+          result = memcpy (dst, &((Elf64_Rela *) data_scn->d.d_buf)[ndx],
-+                           sizeof (Elf64_Rela));
-+
-+          if (gelf_getehdr(scn->elf, &hdr) != NULL &&
-+              hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
-+              hdr.e_machine == EM_MIPS &&
-+              (hdr.e_flags & EF_MIPS_ABI) == 0)
-+            {
-+              /*
-+               * The relocation format is mangled on MIPSEL N64
-+               *  We'll adjust it so at least R_SYM will work on it
-+               */
-+              GElf_Xword r_info = dst->r_info;
-+              dst->r_info = (r_info << 32) |
-+                            ((r_info >> 8) & 0xFF000000) |
-+                            ((r_info >> 24) & 0x00FF0000) |
-+                            ((r_info >> 40) & 0x0000FF00) |
-+                            ((r_info >> 56) & 0x000000FF);
-+            }
-+        }
-     }
- 
-   rwlock_unlock (scn->elf->lock);
-Index: elfutils-0.175/libelf/gelf_update_rel.c
-===================================================================
---- elfutils-0.175.orig/libelf/gelf_update_rel.c
-+++ elfutils-0.175/libelf/gelf_update_rel.c
-@@ -36,6 +36,7 @@
- 
- #include "libelfP.h"
- 
-+#define EF_MIPS_ABI	0x0000F000
- 
- int
- gelf_update_rel (Elf_Data *dst, int ndx, GElf_Rel *src)
-@@ -86,6 +87,9 @@ gelf_update_rel (Elf_Data *dst, int ndx,
-     }
-   else
-     {
-+      GElf_Ehdr hdr;
-+      GElf_Rel value = *src;
-+
-       /* Check whether we have to resize the data buffer.  */
-       if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
- 	{
-@@ -93,7 +97,21 @@ gelf_update_rel (Elf_Data *dst, int ndx,
- 	  goto out;
- 	}
- 
--      ((Elf64_Rel *) data_scn->d.d_buf)[ndx] = *src;
-+      if (gelf_getehdr(scn->elf, &hdr) != NULL &&
-+          hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
-+          hdr.e_machine == EM_MIPS &&
-+          (hdr.e_flags & EF_MIPS_ABI) == 0)
-+        {
-+          /* Undo the MIPSEL N64 hack from gelf_getrel */
-+          GElf_Xword r_info = value.r_info;
-+          value.r_info = (r_info >> 32) |
-+                         ((r_info << 8) &  0x000000FF00000000) |
-+                         ((r_info << 24) & 0x0000FF0000000000) |
-+                         ((r_info << 40) & 0x00FF000000000000) |
-+                         ((r_info << 56) & 0xFF00000000000000);
-+        }
-+
-+      ((Elf64_Rel *) data_scn->d.d_buf)[ndx] = value;
-     }
- 
-   result = 1;
-Index: elfutils-0.175/libelf/gelf_update_rela.c
-===================================================================
---- elfutils-0.175.orig/libelf/gelf_update_rela.c
-+++ elfutils-0.175/libelf/gelf_update_rela.c
-@@ -36,6 +36,7 @@
- 
- #include "libelfP.h"
- 
-+#define EF_MIPS_ABI	0x0000F000
- 
- int
- gelf_update_rela (Elf_Data *dst, int ndx, GElf_Rela *src)
-@@ -89,6 +90,9 @@ gelf_update_rela (Elf_Data *dst, int ndx
-     }
-   else
-     {
-+      GElf_Ehdr hdr;
-+      GElf_Rela value = *src;
-+
-       /* Check whether we have to resize the data buffer.  */
-       if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
- 	{
-@@ -96,7 +100,21 @@ gelf_update_rela (Elf_Data *dst, int ndx
- 	  goto out;
- 	}
- 
--      ((Elf64_Rela *) data_scn->d.d_buf)[ndx] = *src;
-+      if (gelf_getehdr(scn->elf, &hdr) != NULL &&
-+          hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
-+          hdr.e_machine == EM_MIPS &&
-+          (hdr.e_flags & EF_MIPS_ABI) == 0)
-+        {
-+          /* Undo the MIPSEL N64 hack from gelf_getrel */
-+          GElf_Xword r_info = value.r_info;
-+          value.r_info = (r_info >> 32) |
-+                         ((r_info << 8) &  0x000000FF00000000) |
-+                         ((r_info << 24) & 0x0000FF0000000000) |
-+                         ((r_info << 40) & 0x00FF000000000000) |
-+                         ((r_info << 56) & 0xFF00000000000000);
-+        }
-+
-+      ((Elf64_Rela *) data_scn->d.d_buf)[ndx] = value;
-     }
- 
-   result = 1;
-Index: elfutils-0.175/src/strip.c
-===================================================================
---- elfutils-0.175.orig/src/strip.c
-+++ elfutils-0.175/src/strip.c
-@@ -1062,6 +1062,23 @@ handle_elf (int fd, Elf *elf, const char
-       goto fail;
-     }
- 
-+  /* Copy identity part of the ELF header now */
-+  newehdr = gelf_getehdr (newelf, &newehdr_mem);
-+  if (newehdr == NULL)
-+    INTERNAL_ERROR (fname);
-+
-+  memcpy (newehdr->e_ident, ehdr->e_ident, EI_NIDENT);
-+  newehdr->e_type = ehdr->e_type;
-+  newehdr->e_machine = ehdr->e_machine;
-+  newehdr->e_version = ehdr->e_version;
-+
-+  if (gelf_update_ehdr (newelf, newehdr) == 0)
-+    {
-+      error (0, 0, gettext ("%s: error while creating ELF header: %s"),
-+	     fname, elf_errmsg (-1));
-+      return 1;
-+    }
-+
-   /* Copy over the old program header if needed.  */
-   if (phnum > 0)
-     {
diff --git a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
deleted file mode 100644
index ba0ce33bd4..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
+++ /dev/null
@@ -1,624 +0,0 @@
-From 4e6fededb3d8c90694c44214c862ac216a69ecae Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 16:50:33 +0800
-Subject: [PATCH] arm_backend
-
-Upstream-Status: Pending [from debian]
-Rebase to 0.177
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/arm_init.c                 |  18 ++++-
- backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
- backends/arm_retval.c               |  43 +++++++++++-
- backends/libebl_arm.h               |   9 +++
- libelf/elf.h                        |  11 +++
- tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
- tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
- tests/run-readelf-mixed-corenote.sh |  11 ++-
- 8 files changed, 400 insertions(+), 12 deletions(-)
- create mode 100644 backends/libebl_arm.h
-
-diff --git a/backends/arm_init.c b/backends/arm_init.c
-index af023f0..ea2bcb7 100644
---- a/backends/arm_init.c
-+++ b/backends/arm_init.c
-@@ -35,20 +35,31 @@
- #define RELOC_PREFIX	R_ARM_
- #include "libebl_CPU.h"
- 
-+#include "libebl_arm.h"
-+
- /* This defines the common reloc hooks based on arm_reloc.def.  */
- #include "common-reloc.c"
- 
- 
- const char *
--arm_init (Elf *elf __attribute__ ((unused)),
-+arm_init (Elf *elf,
- 	  GElf_Half machine __attribute__ ((unused)),
- 	  Ebl *eh,
- 	  size_t ehlen)
- {
-+  int soft_float = 0;
-+
-   /* Check whether the Elf_BH object has a sufficent size.  */
-   if (ehlen < sizeof (Ebl))
-     return NULL;
- 
-+  if (elf) {
-+    GElf_Ehdr ehdr_mem;
-+    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
-+    if (ehdr && (ehdr->e_flags & EF_ARM_SOFT_FLOAT))
-+      soft_float = 1;
-+  }
-+
-   /* We handle it.  */
-   arm_init_reloc (eh);
-   HOOK (eh, segment_type_name);
-@@ -59,7 +70,10 @@ arm_init (Elf *elf __attribute__ ((unused)),
-   HOOK (eh, core_note);
-   HOOK (eh, auxv_info);
-   HOOK (eh, check_object_attribute);
--  HOOK (eh, return_value_location);
-+  if (soft_float)
-+    eh->return_value_location = arm_return_value_location_soft;
-+  else
-+    eh->return_value_location = arm_return_value_location_hard;
-   HOOK (eh, abi_cfi);
-   HOOK (eh, check_reloc_target_type);
-   HOOK (eh, symbol_type_name);
-diff --git a/backends/arm_regs.c b/backends/arm_regs.c
-index a46a4c9..418c931 100644
---- a/backends/arm_regs.c
-+++ b/backends/arm_regs.c
-@@ -31,6 +31,7 @@
- #endif
- 
- #include <string.h>
-+#include <stdio.h>
- #include <dwarf.h>
- 
- #define BACKEND arm_
-@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
-       break;
- 
-     case 16 + 0 ... 16 + 7:
-+      /* AADWARF says that there are no registers in that range,
-+       * but gcc maps FPA registers here
-+       */
-       regno += 96 - 16;
-       FALLTHROUGH;
-     case 96 + 0 ... 96 + 7:
-@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
-       namelen = 2;
-       break;
- 
-+    case 64 + 0 ... 64 + 9:
-+      *setname = "VFP";
-+      *bits = 32;
-+      *type = DW_ATE_float;
-+      name[0] = 's';
-+      name[1] = regno - 64 + '0';
-+      namelen = 2;
-+      break;
-+
-+    case 64 + 10 ... 64 + 31:
-+      *setname = "VFP";
-+      *bits = 32;
-+      *type = DW_ATE_float;
-+      name[0] = 's';
-+      name[1] = (regno - 64) / 10 + '0';
-+      name[2] = (regno - 64) % 10 + '0';
-+      namelen = 3;
-+      break;
-+
-+    case 104 + 0 ... 104 + 7:
-+      /* XXX TODO:
-+       * This can be either intel wireless MMX general purpose/control
-+       * registers or xscale accumulator, which have different usage.
-+       * We only have the intel wireless MMX here now.
-+       * The name needs to be changed for the xscale accumulator too. */
-+      *setname = "MMX";
-+      *type = DW_ATE_unsigned;
-+      *bits = 32;
-+      memcpy(name, "wcgr", 4);
-+      name[4] = regno - 104 + '0';
-+      namelen = 5;
-+      break;
-+
-+    case 112 + 0 ... 112 + 9:
-+      *setname = "MMX";
-+      *type = DW_ATE_unsigned;
-+      *bits = 64;
-+      name[0] = 'w';
-+      name[1] = 'r';
-+      name[2] = regno - 112 + '0';
-+      namelen = 3;
-+      break;
-+
-+    case 112 + 10 ... 112 + 15:
-+      *setname = "MMX";
-+      *type = DW_ATE_unsigned;
-+      *bits = 64;
-+      name[0] = 'w';
-+      name[1] = 'r';
-+      name[2] = '1';
-+      name[3] = regno - 112 - 10 + '0';
-+      namelen = 4;
-+      break;
-+
-     case 128:
-+      *setname = "state";
-       *type = DW_ATE_unsigned;
-       return stpcpy (name, "spsr") + 1 - name;
- 
-+    case 129:
-+      *setname = "state";
-+      *type = DW_ATE_unsigned;
-+      return stpcpy(name, "spsr_fiq") + 1 - name;
-+
-+    case 130:
-+      *setname = "state";
-+      *type = DW_ATE_unsigned;
-+      return stpcpy(name, "spsr_irq") + 1 - name;
-+
-+    case 131:
-+      *setname = "state";
-+      *type = DW_ATE_unsigned;
-+      return stpcpy(name, "spsr_abt") + 1 - name;
-+
-+    case 132:
-+      *setname = "state";
-+      *type = DW_ATE_unsigned;
-+      return stpcpy(name, "spsr_und") + 1 - name;
-+
-+    case 133:
-+      *setname = "state";
-+      *type = DW_ATE_unsigned;
-+      return stpcpy(name, "spsr_svc") + 1 - name;
-+
-+    case 144 ... 150:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_usr", regno - 144 + 8) + 1;
-+
-+    case 151 ... 157:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_fiq", regno - 151 + 8) + 1;
-+
-+    case 158 ... 159:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_irq", regno - 158 + 13) + 1;
-+
-+    case 160 ... 161:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_abt", regno - 160 + 13) + 1;
-+
-+    case 162 ... 163:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_und", regno - 162 + 13) + 1;
-+
-+    case 164 ... 165:
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      return sprintf(name, "r%d_svc", regno - 164 + 13) + 1;
-+
-+    case 192 ... 199:
-+     *setname = "MMX";
-+      *bits = 32;
-+      *type = DW_ATE_unsigned;
-+      name[0] = 'w';
-+      name[1] = 'c';
-+      name[2] = regno - 192 + '0';
-+      namelen = 3;
-+      break;
-+
-     case 256 + 0 ... 256 + 9:
-+      /* XXX TODO: Neon also uses those registers and can contain
-+       * both float and integers */
-       *setname = "VFP";
-       *type = DW_ATE_float;
-       *bits = 64;
-diff --git a/backends/arm_retval.c b/backends/arm_retval.c
-index 1c28f01..313e4eb 100644
---- a/backends/arm_retval.c
-+++ b/backends/arm_retval.c
-@@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
- #define nloc_intreg	1
- #define nloc_intregs(n)	(2 * (n))
- 
-+/* f1  */ /* XXX TODO: f0 can also have number 96 if program was compiled with -mabi=aapcs */
-+static const Dwarf_Op loc_fpreg[] =
-+  {
-+    { .atom = DW_OP_reg16 },
-+  };
-+#define nloc_fpreg  1
-+
- /* The return value is a structure and is actually stored in stack space
-    passed in a hidden argument by the caller.  But, the compiler
-    helpfully returns the address of that space in r0.  */
-@@ -58,8 +65,9 @@ static const Dwarf_Op loc_aggregate[] =
- #define nloc_aggregate 1
- 
- 
--int
--arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+static int
-+arm_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp,
-+		            int soft_float)
- {
-   /* Start with the function's type, and get the DW_AT_type attribute,
-      which is the type of the return value.  */
-@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
- 	    else
- 	      return -1;
- 	  }
-+	if (tag == DW_TAG_base_type)
-+	  {
-+	    Dwarf_Word encoding;
-+	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+				 &attr_mem), &encoding) != 0)
-+	      return -1;
-+
-+	    if ((encoding == DW_ATE_float) && !soft_float)
-+	      {
-+		*locp = loc_fpreg;
-+		if (size <= 8)
-+		  return nloc_fpreg;
-+		goto aggregate;
-+	      }
-+	  }
- 	if (size <= 16)
- 	  {
- 	  intreg:
-@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
- 	  }
- 
-       aggregate:
-+	/* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
- 	*locp = loc_aggregate;
- 	return nloc_aggregate;
-       }
-@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-      DWARF and might be valid.  */
-   return -2;
- }
-+
-+/* return location for -mabi=apcs-gnu -msoft-float */
-+int
-+arm_return_value_location_soft (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+   return arm_return_value_location_ (functypedie, locp, 1);
-+}
-+
-+/* return location for -mabi=apcs-gnu -mhard-float (current default) */
-+int
-+arm_return_value_location_hard (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+   return arm_return_value_location_ (functypedie, locp, 0);
-+}
-+
-diff --git a/backends/libebl_arm.h b/backends/libebl_arm.h
-new file mode 100644
-index 0000000..c00770c
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
-diff --git a/libelf/elf.h b/libelf/elf.h
-index 01648bd..05b7e7e 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2690,6 +2690,9 @@ enum
- #define EF_ARM_EABI_VER4	0x04000000
- #define EF_ARM_EABI_VER5	0x05000000
- 
-+/* EI_OSABI values */
-+#define ELFOSABI_ARM_AEABI    64      /* Contains symbol versioning. */
-+
- /* Additional symbol types for Thumb.  */
- #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
- #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2707,12 +2710,19 @@ enum
- 
- /* Processor specific values for the Phdr p_type field.  */
- #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
-+#define PT_ARM_UNWIND		PT_ARM_EXIDX
- 
- /* Processor specific values for the Shdr sh_type field.  */
- #define SHT_ARM_EXIDX		(SHT_LOPROC + 1) /* ARM unwind section.  */
- #define SHT_ARM_PREEMPTMAP	(SHT_LOPROC + 2) /* Preemption details.  */
- #define SHT_ARM_ATTRIBUTES	(SHT_LOPROC + 3) /* ARM attributes section.  */
- 
-+/* Processor specific values for the Dyn d_tag field.  */
-+#define DT_ARM_RESERVED1	(DT_LOPROC + 0)
-+#define DT_ARM_SYMTABSZ		(DT_LOPROC + 1)
-+#define DT_ARM_PREEMTMAB	(DT_LOPROC + 2)
-+#define DT_ARM_RESERVED2	(DT_LOPROC + 3)
-+#define DT_ARM_NUM		4
- 
- /* AArch64 relocs.  */
- 
-@@ -3005,6 +3015,7 @@ enum
- 					   TLS block (LDR, STR).  */
- #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
- 					   to GOT origin (LDR).  */
-+/* 112 - 127 private range */
- #define R_ARM_ME_TOO		128	/* Obsolete.  */
- #define R_ARM_THM_TLS_DESCSEQ	129
- #define R_ARM_THM_TLS_DESCSEQ16	129
-diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
-index 64fa24d..1c2aa4d 100755
---- a/tests/run-addrcfi.sh
-+++ b/tests/run-addrcfi.sh
-@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
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
-@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
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
-diff --git a/tests/run-allregs.sh b/tests/run-allregs.sh
-index 1422bd6..dc0fc99 100755
---- a/tests/run-allregs.sh
-+++ b/tests/run-allregs.sh
-@@ -2672,7 +2672,28 @@ integer registers:
- 	 13: sp (sp), address 32 bits
- 	 14: lr (lr), address 32 bits
- 	 15: pc (pc), address 32 bits
--	128: spsr (spsr), unsigned 32 bits
-+	144: r8_usr (r8_usr), signed 32 bits
-+	145: r9_usr (r9_usr), signed 32 bits
-+	146: r10_usr (r10_usr), signed 32 bits
-+	147: r11_usr (r11_usr), signed 32 bits
-+	148: r12_usr (r12_usr), signed 32 bits
-+	149: r13_usr (r13_usr), signed 32 bits
-+	150: r14_usr (r14_usr), signed 32 bits
-+	151: r8_fiq (r8_fiq), signed 32 bits
-+	152: r9_fiq (r9_fiq), signed 32 bits
-+	153: r10_fiq (r10_fiq), signed 32 bits
-+	154: r11_fiq (r11_fiq), signed 32 bits
-+	155: r12_fiq (r12_fiq), signed 32 bits
-+	156: r13_fiq (r13_fiq), signed 32 bits
-+	157: r14_fiq (r14_fiq), signed 32 bits
-+	158: r13_irq (r13_irq), signed 32 bits
-+	159: r14_irq (r14_irq), signed 32 bits
-+	160: r13_abt (r13_abt), signed 32 bits
-+	161: r14_abt (r14_abt), signed 32 bits
-+	162: r13_und (r13_und), signed 32 bits
-+	163: r14_und (r14_und), signed 32 bits
-+	164: r13_svc (r13_svc), signed 32 bits
-+	165: r14_svc (r14_svc), signed 32 bits
- FPA registers:
- 	 16: f0 (f0), float 96 bits
- 	 17: f1 (f1), float 96 bits
-@@ -2690,7 +2711,72 @@ FPA registers:
- 	101: f5 (f5), float 96 bits
- 	102: f6 (f6), float 96 bits
- 	103: f7 (f7), float 96 bits
-+MMX registers:
-+	104: wcgr0 (wcgr0), unsigned 32 bits
-+	105: wcgr1 (wcgr1), unsigned 32 bits
-+	106: wcgr2 (wcgr2), unsigned 32 bits
-+	107: wcgr3 (wcgr3), unsigned 32 bits
-+	108: wcgr4 (wcgr4), unsigned 32 bits
-+	109: wcgr5 (wcgr5), unsigned 32 bits
-+	110: wcgr6 (wcgr6), unsigned 32 bits
-+	111: wcgr7 (wcgr7), unsigned 32 bits
-+	112: wr0 (wr0), unsigned 64 bits
-+	113: wr1 (wr1), unsigned 64 bits
-+	114: wr2 (wr2), unsigned 64 bits
-+	115: wr3 (wr3), unsigned 64 bits
-+	116: wr4 (wr4), unsigned 64 bits
-+	117: wr5 (wr5), unsigned 64 bits
-+	118: wr6 (wr6), unsigned 64 bits
-+	119: wr7 (wr7), unsigned 64 bits
-+	120: wr8 (wr8), unsigned 64 bits
-+	121: wr9 (wr9), unsigned 64 bits
-+	122: wr10 (wr10), unsigned 64 bits
-+	123: wr11 (wr11), unsigned 64 bits
-+	124: wr12 (wr12), unsigned 64 bits
-+	125: wr13 (wr13), unsigned 64 bits
-+	126: wr14 (wr14), unsigned 64 bits
-+	127: wr15 (wr15), unsigned 64 bits
-+	192: wc0 (wc0), unsigned 32 bits
-+	193: wc1 (wc1), unsigned 32 bits
-+	194: wc2 (wc2), unsigned 32 bits
-+	195: wc3 (wc3), unsigned 32 bits
-+	196: wc4 (wc4), unsigned 32 bits
-+	197: wc5 (wc5), unsigned 32 bits
-+	198: wc6 (wc6), unsigned 32 bits
-+	199: wc7 (wc7), unsigned 32 bits
- VFP registers:
-+	 64: s0 (s0), float 32 bits
-+	 65: s1 (s1), float 32 bits
-+	 66: s2 (s2), float 32 bits
-+	 67: s3 (s3), float 32 bits
-+	 68: s4 (s4), float 32 bits
-+	 69: s5 (s5), float 32 bits
-+	 70: s6 (s6), float 32 bits
-+	 71: s7 (s7), float 32 bits
-+	 72: s8 (s8), float 32 bits
-+	 73: s9 (s9), float 32 bits
-+	 74: s10 (s10), float 32 bits
-+	 75: s11 (s11), float 32 bits
-+	 76: s12 (s12), float 32 bits
-+	 77: s13 (s13), float 32 bits
-+	 78: s14 (s14), float 32 bits
-+	 79: s15 (s15), float 32 bits
-+	 80: s16 (s16), float 32 bits
-+	 81: s17 (s17), float 32 bits
-+	 82: s18 (s18), float 32 bits
-+	 83: s19 (s19), float 32 bits
-+	 84: s20 (s20), float 32 bits
-+	 85: s21 (s21), float 32 bits
-+	 86: s22 (s22), float 32 bits
-+	 87: s23 (s23), float 32 bits
-+	 88: s24 (s24), float 32 bits
-+	 89: s25 (s25), float 32 bits
-+	 90: s26 (s26), float 32 bits
-+	 91: s27 (s27), float 32 bits
-+	 92: s28 (s28), float 32 bits
-+	 93: s29 (s29), float 32 bits
-+	 94: s30 (s30), float 32 bits
-+	 95: s31 (s31), float 32 bits
- 	256: d0 (d0), float 64 bits
- 	257: d1 (d1), float 64 bits
- 	258: d2 (d2), float 64 bits
-@@ -2723,6 +2809,13 @@ VFP registers:
- 	285: d29 (d29), float 64 bits
- 	286: d30 (d30), float 64 bits
- 	287: d31 (d31), float 64 bits
-+state registers:
-+	128: spsr (spsr), unsigned 32 bits
-+	129: spsr_fiq (spsr_fiq), unsigned 32 bits
-+	130: spsr_irq (spsr_irq), unsigned 32 bits
-+	131: spsr_abt (spsr_abt), unsigned 32 bits
-+	132: spsr_und (spsr_und), unsigned 32 bits
-+	133: spsr_svc (spsr_svc), unsigned 32 bits
- EOF
- 
- # See run-readelf-mixed-corenote.sh for instructions to regenerate
-diff --git a/tests/run-readelf-mixed-corenote.sh b/tests/run-readelf-mixed-corenote.sh
-index c960f1d..e4bf074 100755
---- a/tests/run-readelf-mixed-corenote.sh
-+++ b/tests/run-readelf-mixed-corenote.sh
-@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x274:
-     pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
-     utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
-     orig_r0: -1, fpvalid: 1
--    r0:             1  r1:   -1091672508  r2:   -1091672500
--    r3:             0  r4:             0  r5:             0
--    r6:         33728  r7:             0  r8:             0
--    r9:             0  r10:  -1225703496  r11:  -1091672844
--    r12:            0  sp:    0xbeee64f4  lr:    0xb6dc3f48
--    pc:    0x00008500  spsr:  0x60000010
-+    r0:            1  r1:  -1091672508  r2:  -1091672500  r3:            0
-+    r4:            0  r5:            0  r6:        33728  r7:            0
-+    r8:            0  r9:            0  r10: -1225703496  r11: -1091672844
-+    r12:           0  sp:   0xbeee64f4  lr:   0xb6dc3f48  pc:   0x00008500
-+    spsr:  0x60000010
-   CORE                 124  PRPSINFO
-     state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
-     uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch b/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
deleted file mode 100644
index bd98dae4b2..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From: Helmut Grohne <helmut@subdivi.de>
-Subject: disable -Werror as it tends to break with new gcc versions
-Bug-Debian: https://bugs.debian.org/886004
-Last-Update: 2018-01-01
-
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: elfutils-0.176/config/eu.am
-===================================================================
---- elfutils-0.176.orig/config/eu.am
-+++ elfutils-0.176/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -W
- 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
- 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
- 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
--	    $(if $($(*F)_no_Werror),,-Werror) \
- 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
- 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
deleted file mode 100644
index 53fa2f435b..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
+++ /dev/null
@@ -1,828 +0,0 @@
-From ffb811e18d7046d5bbe54ede5b1b7e14eaac0146 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 15:44:18 +0800
-Subject: [PATCH] hppa backend
-
-Rebase to 0.177
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- backends/Makefile.am      |   7 +-
- backends/libebl_parisc.h  |   9 ++
- backends/parisc_init.c    |  73 +++++++++++++
- backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++
- backends/parisc_reloc.def | 128 +++++++++++++++++++++++
- backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++
- backends/parisc_symbol.c  | 113 ++++++++++++++++++++
- libelf/elf.h              |  11 ++
- 8 files changed, 711 insertions(+), 2 deletions(-)
- create mode 100644 backends/libebl_parisc.h
- create mode 100644 backends/parisc_init.c
- create mode 100644 backends/parisc_regs.c
- create mode 100644 backends/parisc_reloc.def
- create mode 100644 backends/parisc_retval.c
- create mode 100644 backends/parisc_symbol.c
-
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index f405212..4755f61 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -37,7 +37,9 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
- noinst_LIBRARIES = libebl_backends.a libebl_backends_pic.a
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv csky
-+	  tilegx m68k bpf riscv csky parisc
-+
-+parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
- 
- i386_SRCS = i386_init.c i386_symbol.c i386_corenote.c i386_cfi.c \
- 	    i386_retval.c i386_regs.c i386_auxv.c i386_syscall.c \
-@@ -102,7 +104,8 @@ libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
- 			    $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
- 			    $(aarch64_SRCS) $(sparc_SRCS) $(ppc_SRCS) \
- 			    $(ppc64_SRCS) $(s390_SRCS) $(tilegx_SRCS) \
--			    $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS)
-+			    $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS) \
-+                            $(parisc_SRCS)
- 
- libebl_backends_pic_a_SOURCES =
- am_libebl_backends_pic_a_OBJECTS = $(libebl_backends_a_SOURCES:.c=.os)
-diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
-new file mode 100644
-index 0000000..f473b79
---- /dev/null
-+++ b/backends/libebl_parisc.h
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
-diff --git a/backends/parisc_init.c b/backends/parisc_init.c
-new file mode 100644
-index 0000000..f1e401c
---- /dev/null
-+++ b/backends/parisc_init.c
-@@ -0,0 +1,73 @@
-+/* Initialization of PA-RISC specific backend library.
-+   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#define BACKEND		parisc_
-+#define RELOC_PREFIX	R_PARISC_
-+#include "libebl_CPU.h"
-+#include "libebl_parisc.h"
-+
-+/* This defines the common reloc hooks based on parisc_reloc.def.  */
-+#include "common-reloc.c"
-+
-+
-+const char *
-+parisc_init (Elf *elf __attribute__ ((unused)),
-+     GElf_Half machine __attribute__ ((unused)),
-+     Ebl *eh,
-+     size_t ehlen)
-+{
-+  int pa64 = 0;
-+
-+  /* Check whether the Elf_BH object has a sufficent size.  */
-+  if (ehlen < sizeof (Ebl))
-+    return NULL;
-+
-+  if (elf) {
-+    GElf_Ehdr ehdr_mem;
-+    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
-+    if (ehdr && (ehdr->e_flags & EF_PARISC_WIDE))
-+      pa64 = 1;
-+  }
-+  /* We handle it.  */
-+  eh->name = "PA-RISC";
-+  parisc_init_reloc (eh);
-+  HOOK (eh, reloc_simple_type);
-+  HOOK (eh, machine_flag_check);
-+  HOOK (eh, symbol_type_name);
-+  HOOK (eh, segment_type_name);
-+  HOOK (eh, section_type_name);
-+  HOOK (eh, register_info);
-+  if (pa64)
-+    eh->return_value_location = parisc_return_value_location_64;
-+  else
-+    eh->return_value_location = parisc_return_value_location_32;
-+
-+  return MODVERSION;
-+}
-diff --git a/backends/parisc_regs.c b/backends/parisc_regs.c
-new file mode 100644
-index 0000000..3895f8e
---- /dev/null
-+++ b/backends/parisc_regs.c
-@@ -0,0 +1,159 @@
-+/* Register names and numbers for PA-RISC DWARF.
-+   Copyright (C) 2005, 2006 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <dwarf.h>
-+
-+#define BACKEND parisc_
-+#include "libebl_CPU.h"
-+
-+ssize_t
-+parisc_register_info (Ebl *ebl, int regno, char *name, size_t namelen,
-+		     const char **prefix, const char **setname,
-+		     int *bits, int *type)
-+{
-+  int pa64 = 0;
-+
-+  if (ebl->elf) {
-+    GElf_Ehdr ehdr_mem;
-+    GElf_Ehdr *ehdr = gelf_getehdr (ebl->elf, &ehdr_mem);
-+    if (ehdr->e_flags & EF_PARISC_WIDE)
-+      pa64 = 1;
-+  }
-+
-+  int nregs = pa64 ? 127 : 128;
-+
-+  if (name == NULL)
-+    return nregs;
-+
-+  if (regno < 0 || regno >= nregs || namelen < 6)
-+    return -1;
-+
-+  *prefix = "%";
-+
-+  if (regno < 32)
-+  {
-+    *setname = "integer";
-+    *type = DW_ATE_signed;
-+    if (pa64)
-+    {
-+	*bits = 64;
-+    }
-+    else
-+    {
-+    	*bits = 32;
-+    }
-+  }
-+  else if (regno == 32)
-+  {
-+    *setname = "special";
-+    if (pa64)
-+    {
-+	*bits = 6;
-+    }
-+    else
-+    {
-+    	*bits = 5;
-+    }
-+    *type = DW_ATE_unsigned;
-+  }
-+  else
-+  {
-+    *setname = "FPU";
-+    *type = DW_ATE_float;
-+    if (pa64)
-+    {
-+	*bits = 64;
-+    }
-+    else
-+    {
-+    	*bits = 32;
-+    }
-+  }
-+
-+  if (regno < 33) {
-+    switch (regno)
-+      {
-+      case 0 ... 9:
-+        name[0] = 'r';
-+        name[1] = regno + '0';
-+        namelen = 2;
-+        break;
-+      case 10 ... 31:
-+        name[0] = 'r';
-+        name[1] = regno / 10 + '0';
-+        name[2] = regno % 10 + '0';
-+        namelen = 3;
-+        break;
-+      case 32:
-+	*prefix = NULL;
-+	name[0] = 'S';
-+	name[1] = 'A';
-+	name[2] = 'R';
-+	namelen = 3;
-+	break;
-+      }
-+  }
-+  else {
-+    if (pa64 && ((regno - 72) % 2)) {
-+      *setname = NULL;
-+      return 0;
-+    }
-+
-+    switch (regno)
-+      {
-+      case 72 + 0 ... 72 + 11:
-+        name[0] = 'f';
-+	name[1] = 'r';
-+        name[2] = (regno + 8 - 72) / 2 + '0';
-+        namelen = 3;
-+        if ((regno + 8 - 72) % 2) {
-+	  name[3] = 'R';
-+	  namelen++;
-+        }
-+        break;
-+      case 72 + 12 ... 72 + 55:
-+        name[0] = 'f';
-+	name[1] = 'r';
-+        name[2] = (regno + 8 - 72) / 2 / 10 + '0';
-+        name[3] = (regno + 8 - 72) / 2 % 10 + '0';
-+        namelen = 4;
-+        if ((regno + 8 - 72) % 2) {
-+	  name[4] = 'R';
-+	  namelen++;
-+        }
-+        break;
-+      default:
-+        *setname = NULL;
-+        return 0;
-+      }
-+  }
-+  name[namelen++] = '\0';
-+  return namelen;
-+}
-diff --git a/backends/parisc_reloc.def b/backends/parisc_reloc.def
-new file mode 100644
-index 0000000..1f875ba
---- /dev/null
-+++ b/backends/parisc_reloc.def
-@@ -0,0 +1,128 @@
-+/* List the relocation types for PA-RISC.  -*- C -*-
-+   Copyright (C) 2005 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+/*	    NAME,		REL|EXEC|DYN	*/
-+
-+RELOC_TYPE (NONE,		EXEC|DYN)
-+RELOC_TYPE (DIR32,		REL|EXEC|DYN)
-+RELOC_TYPE (DIR21L,		REL|EXEC|DYN)
-+RELOC_TYPE (DIR17R,		REL)
-+RELOC_TYPE (DIR17F,		REL)
-+RELOC_TYPE (DIR14R,		REL|DYN)
-+RELOC_TYPE (PCREL32,		REL)
-+RELOC_TYPE (PCREL21L,		REL)
-+RELOC_TYPE (PCREL17R,		REL)
-+RELOC_TYPE (PCREL17F,		REL)
-+RELOC_TYPE (PCREL14R,		REL|EXEC)
-+RELOC_TYPE (DPREL21L,		REL)
-+RELOC_TYPE (DPREL14WR,		REL)
-+RELOC_TYPE (DPREL14DR,          REL)
-+RELOC_TYPE (DPREL14R,		REL)
-+RELOC_TYPE (GPREL21L,		0)
-+RELOC_TYPE (GPREL14R,		0)
-+RELOC_TYPE (LTOFF21L,		REL)
-+RELOC_TYPE (LTOFF14R,		REL)
-+RELOC_TYPE (DLTIND14F,		0)
-+RELOC_TYPE (SETBASE,		0)
-+RELOC_TYPE (SECREL32,		REL)
-+RELOC_TYPE (BASEREL21L,		0)
-+RELOC_TYPE (BASEREL17R,		0)
-+RELOC_TYPE (BASEREL14R,		0)
-+RELOC_TYPE (SEGBASE,		0)
-+RELOC_TYPE (SEGREL32,		REL)
-+RELOC_TYPE (PLTOFF21L,		0)
-+RELOC_TYPE (PLTOFF14R,		0)
-+RELOC_TYPE (PLTOFF14F,		0)
-+RELOC_TYPE (LTOFF_FPTR32,	0)
-+RELOC_TYPE (LTOFF_FPTR21L,	0)
-+RELOC_TYPE (LTOFF_FPTR14R,	0)
-+RELOC_TYPE (FPTR64,		0)
-+RELOC_TYPE (PLABEL32,		REL|DYN)
-+RELOC_TYPE (PCREL64,		0)
-+RELOC_TYPE (PCREL22C,		0)
-+RELOC_TYPE (PCREL22F,		0)
-+RELOC_TYPE (PCREL14WR,		0)
-+RELOC_TYPE (PCREL14DR,		0)
-+RELOC_TYPE (PCREL16F,		0)
-+RELOC_TYPE (PCREL16WF,		0)
-+RELOC_TYPE (PCREL16DF,		0)
-+RELOC_TYPE (DIR64,		REL|DYN)
-+RELOC_TYPE (DIR14WR,		REL)
-+RELOC_TYPE (DIR14DR,		REL)
-+RELOC_TYPE (DIR16F,		REL)
-+RELOC_TYPE (DIR16WF,		REL)
-+RELOC_TYPE (DIR16DF,		REL)
-+RELOC_TYPE (GPREL64,		0)
-+RELOC_TYPE (GPREL14WR,		0)
-+RELOC_TYPE (GPREL14DR,		0)
-+RELOC_TYPE (GPREL16F,		0)
-+RELOC_TYPE (GPREL16WF,		0)
-+RELOC_TYPE (GPREL16DF,		0)
-+RELOC_TYPE (LTOFF64,		0)
-+RELOC_TYPE (LTOFF14WR,		0)
-+RELOC_TYPE (LTOFF14DR,		0)
-+RELOC_TYPE (LTOFF16F,		0)
-+RELOC_TYPE (LTOFF16WF,		0)
-+RELOC_TYPE (LTOFF16DF,		0)
-+RELOC_TYPE (SECREL64,		0)
-+RELOC_TYPE (BASEREL14WR,	0)
-+RELOC_TYPE (BASEREL14DR,	0)
-+RELOC_TYPE (SEGREL64,		0)
-+RELOC_TYPE (PLTOFF14WR,		0)
-+RELOC_TYPE (PLTOFF14DR,		0)
-+RELOC_TYPE (PLTOFF16F,		0)
-+RELOC_TYPE (PLTOFF16WF,		0)
-+RELOC_TYPE (PLTOFF16DF,		0)
-+RELOC_TYPE (LTOFF_FPTR64,	0)
-+RELOC_TYPE (LTOFF_FPTR14WR,	0)
-+RELOC_TYPE (LTOFF_FPTR14DR,	0)
-+RELOC_TYPE (LTOFF_FPTR16F,	0)
-+RELOC_TYPE (LTOFF_FPTR16WF,	0)
-+RELOC_TYPE (LTOFF_FPTR16DF,	0)
-+RELOC_TYPE (COPY,		EXEC)
-+RELOC_TYPE (IPLT,		EXEC|DYN)
-+RELOC_TYPE (EPLT,		0)
-+RELOC_TYPE (TPREL32,		DYN)
-+RELOC_TYPE (TPREL21L,		0)
-+RELOC_TYPE (TPREL14R,		0)
-+RELOC_TYPE (LTOFF_TP21L,	0)
-+RELOC_TYPE (LTOFF_TP14R,	0)
-+RELOC_TYPE (LTOFF_TP14F,	0)
-+RELOC_TYPE (TPREL64,		0)
-+RELOC_TYPE (TPREL14WR,		0)
-+RELOC_TYPE (TPREL14DR,		0)
-+RELOC_TYPE (TPREL16F,		0)
-+RELOC_TYPE (TPREL16WF,		0)
-+RELOC_TYPE (TPREL16DF,		0)
-+RELOC_TYPE (LTOFF_TP64,		0)
-+RELOC_TYPE (LTOFF_TP14WR,	0)
-+RELOC_TYPE (LTOFF_TP14DR,	0)
-+RELOC_TYPE (LTOFF_TP16F,	0)
-+RELOC_TYPE (LTOFF_TP16WF,	0)
-+RELOC_TYPE (LTOFF_TP16DF,	0)
-+RELOC_TYPE (TLS_DTPMOD32,	DYN)
-+RELOC_TYPE (TLS_DTPMOD64,	DYN)
-+
-+#define NO_RELATIVE_RELOC       1
-diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
-new file mode 100644
-index 0000000..df7ec3a
---- /dev/null
-+++ b/backends/parisc_retval.c
-@@ -0,0 +1,213 @@
-+/* Function return value location for Linux/PA-RISC ABI.
-+   Copyright (C) 2005 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <assert.h>
-+#include <dwarf.h>
-+
-+#define BACKEND parisc_
-+#include "libebl_CPU.h"
-+#include "libebl_parisc.h"
-+
-+/* %r28, or pair %r28, %r29.  */
-+static const Dwarf_Op loc_intreg32[] =
-+  {
-+    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+
-+static const Dwarf_Op loc_intreg[] =
-+  {
-+    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 8 },
-+    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 8 },
-+  };
-+#define nloc_intreg	1
-+#define nloc_intregpair	4
-+
-+/* %fr4L, or pair %fr4L, %fr4R on pa-32 */
-+static const Dwarf_Op loc_fpreg32[] =
-+  {
-+    { .atom = DW_OP_regx, .number = 72 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_regx, .number = 73 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+#define nloc_fpreg32 2
-+#define nloc_fpregpair32 4
-+
-+/* $fr4 */
-+static const Dwarf_Op loc_fpreg[] =
-+  {
-+    { .atom = DW_OP_regx, .number = 72 },
-+  };
-+#define nloc_fpreg  1
-+
-+#if 0
-+/* The return value is a structure and is actually stored in stack space
-+   passed in a hidden argument by the caller. Address of the location is stored
-+   in %r28 before function call, but it may be changed by function. */
-+static const Dwarf_Op loc_aggregate[] =
-+  {
-+    { .atom = DW_OP_breg28 },
-+  };
-+#define nloc_aggregate 1
-+#endif
-+
-+static int
-+parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, int pa64)
-+{
-+  Dwarf_Word regsize = pa64 ? 8 : 4;
-+
-+  /* Start with the function's type, and get the DW_AT_type attribute,
-+     which is the type of the return value.  */
-+
-+  Dwarf_Attribute attr_mem;
-+  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
-+  if (attr == NULL)
-+    /* The function has no return value, like a `void' function in C.  */
-+    return 0;
-+
-+  Dwarf_Die die_mem;
-+  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
-+  int tag = dwarf_tag (typedie);
-+
-+  /* Follow typedefs and qualifiers to get to the actual type.  */
-+  while (tag == DW_TAG_typedef
-+	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type)
-+    {
-+      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+      typedie = dwarf_formref_die (attr, &die_mem);
-+      tag = dwarf_tag (typedie);
-+    }
-+
-+  switch (tag)
-+    {
-+    case -1:
-+      return -1;
-+
-+    case DW_TAG_subrange_type:
-+      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
-+	{
-+	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+	  typedie = dwarf_formref_die (attr, &die_mem);
-+	  tag = dwarf_tag (typedie);
-+	}
-+      /* Fall through.  */
-+
-+    case DW_TAG_base_type:
-+    case DW_TAG_enumeration_type:
-+    case DW_TAG_pointer_type:
-+    case DW_TAG_ptr_to_member_type:
-+      {
-+        Dwarf_Word size;
-+	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
-+					 &attr_mem), &size) != 0)
-+	  {
-+	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	      size = 4;
-+	    else
-+	      return -1;
-+	  }
-+	if (tag == DW_TAG_base_type)
-+	  {
-+	    Dwarf_Word encoding;
-+	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+					     &attr_mem), &encoding) != 0)
-+	      return -1;
-+
-+	    if (encoding == DW_ATE_float)
-+	      {
-+		if (pa64) {
-+		  *locp = loc_fpreg;
-+		  if (size <= 8)
-+		      return nloc_fpreg;
-+		}
-+		else {
-+		  *locp = loc_fpreg32;
-+		  if (size <= 4)
-+		    return nloc_fpreg32;
-+		  else if (size <= 8)
-+		    return nloc_fpregpair32;
-+		}
-+		goto aggregate;
-+	      }
-+	  }
-+	if (pa64)
-+	  *locp = loc_intreg;
-+	else
-+	  *locp = loc_intreg32;
-+	if (size <= regsize)
-+	  return nloc_intreg;
-+	if (size <= 2 * regsize)
-+	  return nloc_intregpair;
-+
-+	/* Else fall through.  */
-+      }
-+
-+    case DW_TAG_structure_type:
-+    case DW_TAG_class_type:
-+    case DW_TAG_union_type:
-+    case DW_TAG_array_type:
-+    aggregate: {
-+        Dwarf_Word size;
-+	if (dwarf_aggregate_size (typedie, &size) != 0)
-+	  return -1;
-+	if (pa64)
-+          *locp = loc_intreg;
-+	else
-+	  *locp = loc_intreg32;
-+        if (size <= regsize)
-+	  return nloc_intreg;
-+        if (size <= 2 * regsize)
-+	  return nloc_intregpair;
-+#if 0
-+	/* there should be some way to know this location... But I do not see it. */
-+        *locp = loc_aggregate;
-+        return nloc_aggregate;
-+#endif
-+	/* fall through.  */
-+      }
-+    }
-+
-+  /* XXX We don't have a good way to return specific errors from ebl calls.
-+     This value means we do not understand the type, but it is well-formed
-+     DWARF and might be valid.  */
-+  return -2;
-+}
-+
-+int
-+parisc_return_value_location_32 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+  return parisc_return_value_location_ (functypedie, locp, 0);
-+}
-+
-+int
-+parisc_return_value_location_64 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+  return parisc_return_value_location_ (functypedie, locp, 1);
-+}
-+
-diff --git a/backends/parisc_symbol.c b/backends/parisc_symbol.c
-new file mode 100644
-index 0000000..5754bd8
---- /dev/null
-+++ b/backends/parisc_symbol.c
-@@ -0,0 +1,113 @@
-+/* PA-RISC specific symbolic name handling.
-+   Copyright (C) 2002, 2005 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <elf.h>
-+#include <stddef.h>
-+
-+#define BACKEND		parisc_
-+#include "libebl_CPU.h"
-+
-+const char *
-+parisc_segment_type_name (int segment, char *buf __attribute__ ((unused)),
-+			size_t len __attribute__ ((unused)))
-+{
-+  switch (segment)
-+    {
-+    case PT_PARISC_ARCHEXT:
-+      return "PARISC_ARCHEXT";
-+    case PT_PARISC_UNWIND:
-+      return "PARISC_UNWIND";
-+    default:
-+      break;
-+    }
-+  return NULL;
-+}
-+
-+/* Return symbolic representation of symbol type.  */
-+const char *
-+parisc_symbol_type_name(int symbol, char *buf __attribute__ ((unused)),
-+    size_t len __attribute__ ((unused)))
-+{
-+	if (symbol == STT_PARISC_MILLICODE)
-+	  return "PARISC_MILLI";
-+	return NULL;
-+}
-+
-+/* Return symbolic representation of section type.  */
-+const char *
-+parisc_section_type_name (int type,
-+			char *buf __attribute__ ((unused)),
-+			size_t len __attribute__ ((unused)))
-+{
-+  switch (type)
-+    {
-+    case SHT_PARISC_EXT:
-+      return "PARISC_EXT";
-+    case SHT_PARISC_UNWIND:
-+      return "PARISC_UNWIND";
-+    case SHT_PARISC_DOC:
-+      return "PARISC_DOC";
-+    }
-+
-+  return NULL;
-+}
-+
-+/* Check whether machine flags are valid.  */
-+bool
-+parisc_machine_flag_check (GElf_Word flags)
-+{
-+  if (flags &~ (EF_PARISC_TRAPNIL | EF_PARISC_EXT | EF_PARISC_LSB |
-+	EF_PARISC_WIDE | EF_PARISC_NO_KABP |
-+	EF_PARISC_LAZYSWAP | EF_PARISC_ARCH))
-+    return 0;
-+
-+  GElf_Word arch = flags & EF_PARISC_ARCH;
-+
-+  return ((arch == EFA_PARISC_1_0) || (arch == EFA_PARISC_1_1) ||
-+      (arch == EFA_PARISC_2_0));
-+}
-+
-+/* Check for the simple reloc types.  */
-+Elf_Type
-+parisc_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type,
-+                          int *addsub __attribute__ ((unused)))
-+{
-+  switch (type)
-+    {
-+    case R_PARISC_DIR64:
-+    case R_PARISC_SECREL64:
-+      return ELF_T_XWORD;
-+    case R_PARISC_DIR32:
-+    case R_PARISC_SECREL32:
-+      return ELF_T_WORD;
-+    default:
-+      return ELF_T_NUM;
-+    }
-+}
-diff --git a/libelf/elf.h b/libelf/elf.h
-index 01648bd..218ceb2 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2162,16 +2162,24 @@ enum
- #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
- #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
- #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
-+#define R_PARISC_DPREL14WR	19
-+#define R_PARISC_DPREL14DR	20
- #define R_PARISC_DPREL14R	22	/* Right 14 bits of rel. address.  */
- #define R_PARISC_GPREL21L	26	/* GP-relative, left 21 bits.  */
- #define R_PARISC_GPREL14R	30	/* GP-relative, right 14 bits.  */
- #define R_PARISC_LTOFF21L	34	/* LT-relative, left 21 bits.  */
- #define R_PARISC_LTOFF14R	38	/* LT-relative, right 14 bits.  */
-+#define R_PARISC_DLTIND14F	39
-+#define R_PARISC_SETBASE	40
- #define R_PARISC_SECREL32	41	/* 32 bits section rel. address.  */
-+#define R_PARISC_BASEREL21L	42
-+#define R_PARISC_BASEREL17R	43
-+#define R_PARISC_BASEREL14R	46
- #define R_PARISC_SEGBASE	48	/* No relocation, set segment base.  */
- #define R_PARISC_SEGREL32	49	/* 32 bits segment rel. address.  */
- #define R_PARISC_PLTOFF21L	50	/* PLT rel. address, left 21 bits.  */
- #define R_PARISC_PLTOFF14R	54	/* PLT rel. address, right 14 bits.  */
-+#define R_PARISC_PLTOFF14F	55
- #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
- #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
- #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -2180,6 +2188,7 @@ enum
- #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
- #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
- #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
-+#define R_PARISC_PCREL22C	73
- #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
- #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
- #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -2205,6 +2214,8 @@ enum
- #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
- #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
- #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
-+#define R_PARISC_BASEREL14WR	107
-+#define R_PARISC_BASEREL14DR	108
- #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
- #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
- #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
diff --git a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
deleted file mode 100644
index 62a960f3a8..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: elfutils-0.165/tests/run-native-test.sh
-===================================================================
---- elfutils-0.165.orig/tests/run-native-test.sh
-+++ elfutils-0.165/tests/run-native-test.sh
-@@ -83,6 +83,9 @@ native_test()
- # "cannot attach to process: Function not implemented".
- [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
- 
-+# hurd's /proc/$PID/maps does not give paths yet.
-+[ "$(uname)" = "GNU" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
diff --git a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
deleted file mode 100644
index 55513eeddc..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
---- elfutils-0.165.orig/tests/run-strip-strmerge.sh
-+++ elfutils-0.165/tests/run-strip-strmerge.sh
-@@ -30,7 +30,7 @@ remerged=remerged.elf
- tempfiles $merged $stripped $debugfile $remerged
- 
- echo elflint $input
--testrun ${abs_top_builddir}/src/elflint --gnu $input
-+testrun_on_self_skip ${abs_top_builddir}/src/elflint --gnu $input
- echo elfstrmerge
- testrun ${abs_top_builddir}/tests/elfstrmerge -o $merged $input
- echo elflint $merged
diff --git a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
deleted file mode 100644
index e85a2fed9d..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: b/tests/run-native-test.sh
-===================================================================
---- a/tests/run-native-test.sh
-+++ b/tests/run-native-test.sh
-@@ -77,6 +77,12 @@ native_test()
-   test $native -eq 0 || testrun "$@" -p $native > /dev/null
- }
- 
-+# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
-+# not give absolute paths due to sbuild's bind mounts (bug #570805)
-+# therefore the next two test programs are expected to fail with
-+# "cannot attach to process: Function not implemented".
-+[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
deleted file mode 100644
index 749faa403f..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
+++ /dev/null
@@ -1,724 +0,0 @@
-From 7e0b036d087dfff7f5e306f52fc78745f99454c3 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 15:49:52 +0800
-Subject: [PATCH] mips backend
-
-Rebase to 0.177
-Upstream-Status: Pending [from debian]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- backends/Makefile.am    |   6 +-
- backends/mips_init.c    |  59 ++++++++
- backends/mips_regs.c    | 104 +++++++++++++
- backends/mips_reloc.def |  79 ++++++++++
- backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++
- backends/mips_symbol.c  |  53 +++++++
- libebl/eblopenbackend.c |   3 +
- 7 files changed, 623 insertions(+), 2 deletions(-)
- create mode 100644 backends/mips_init.c
- create mode 100644 backends/mips_regs.c
- create mode 100644 backends/mips_reloc.def
- create mode 100644 backends/mips_retval.c
- create mode 100644 backends/mips_symbol.c
-
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 4755f61..07d45d7 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -37,7 +37,7 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
- noinst_LIBRARIES = libebl_backends.a libebl_backends_pic.a
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv csky parisc
-+	  tilegx m68k bpf riscv csky parisc mips
- 
- parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
- 
-@@ -100,12 +100,14 @@ riscv_SRCS = riscv_init.c riscv_symbol.c riscv_cfi.c riscv_regs.c \
- csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
- 	    csky_regs.c csky_initreg.c csky_corenote.c
- 
-+mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
-+
- libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
- 			    $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
- 			    $(aarch64_SRCS) $(sparc_SRCS) $(ppc_SRCS) \
- 			    $(ppc64_SRCS) $(s390_SRCS) $(tilegx_SRCS) \
- 			    $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS) \
--                            $(parisc_SRCS)
-+                            $(parisc_SRCS) $(mips_SRCS)
- 
- libebl_backends_pic_a_SOURCES =
- am_libebl_backends_pic_a_OBJECTS = $(libebl_backends_a_SOURCES:.c=.os)
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-new file mode 100644
-index 0000000..975c04e
---- /dev/null
-+++ b/backends/mips_init.c
-@@ -0,0 +1,59 @@
-+/* Initialization of mips specific backend library.
-+   Copyright (C) 2006 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#define BACKEND		mips_
-+#define RELOC_PREFIX	R_MIPS_
-+#include "libebl_CPU.h"
-+
-+/* This defines the common reloc hooks based on mips_reloc.def.  */
-+#include "common-reloc.c"
-+
-+const char *
-+mips_init (Elf *elf __attribute__ ((unused)),
-+     GElf_Half machine __attribute__ ((unused)),
-+     Ebl *eh,
-+     size_t ehlen)
-+{
-+  /* Check whether the Elf_BH object has a sufficent size.  */
-+  if (ehlen < sizeof (Ebl))
-+    return NULL;
-+
-+  /* We handle it.  */
-+  if (machine == EM_MIPS)
-+    eh->name = "MIPS R3000 big-endian";
-+  else if (machine == EM_MIPS_RS3_LE)
-+    eh->name = "MIPS R3000 little-endian";
-+
-+  mips_init_reloc (eh);
-+  HOOK (eh, reloc_simple_type);
-+  HOOK (eh, return_value_location);
-+  HOOK (eh, register_info);
-+
-+  return MODVERSION;
-+}
-diff --git a/backends/mips_regs.c b/backends/mips_regs.c
-new file mode 100644
-index 0000000..44f86cb
---- /dev/null
-+++ b/backends/mips_regs.c
-@@ -0,0 +1,104 @@
-+/* Register names and numbers for MIPS DWARF.
-+   Copyright (C) 2006 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <dwarf.h>
-+
-+#define BACKEND mips_
-+#include "libebl_CPU.h"
-+
-+ssize_t
-+mips_register_info (Ebl *ebl __attribute__((unused)),
-+		    int regno, char *name, size_t namelen,
-+		    const char **prefix, const char **setname,
-+		    int *bits, int *type)
-+{
-+  if (name == NULL)
-+    return 66;
-+
-+  if (regno < 0 || regno > 65 || namelen < 4)
-+    return -1;
-+
-+  *prefix = "$";
-+
-+  if (regno < 32)
-+    {
-+      *setname = "integer";
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      if (regno < 32 + 10)
-+        {
-+          name[0] = regno + '0';
-+          namelen = 1;
-+        }
-+      else
-+        {
-+          name[0] = (regno / 10) + '0';
-+          name[1] = (regno % 10) + '0';
-+          namelen = 2;
-+        }
-+    }
-+  else if (regno < 64)
-+    {
-+      *setname = "FPU";
-+      *type = DW_ATE_float;
-+      *bits = 32;
-+      name[0] = 'f';
-+      if (regno < 32 + 10)
-+	{
-+	  name[1] = (regno - 32) + '0';
-+	  namelen = 2;
-+	}
-+      else
-+	{
-+	  name[1] = (regno - 32) / 10 + '0';
-+	  name[2] = (regno - 32) % 10 + '0';
-+	  namelen = 3;
-+	}
-+    }
-+  else if (regno == 64)
-+    {
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      name[0] = 'h';
-+      name[1] = 'i';
-+      namelen = 2;
-+    }
-+  else
-+    {
-+      *type = DW_ATE_signed;
-+      *bits = 32;
-+      name[0] = 'l';
-+      name[1] = 'o';
-+      namelen = 2;
-+    }
-+
-+  name[namelen++] = '\0';
-+  return namelen;
-+}
-diff --git a/backends/mips_reloc.def b/backends/mips_reloc.def
-new file mode 100644
-index 0000000..4579970
---- /dev/null
-+++ b/backends/mips_reloc.def
-@@ -0,0 +1,79 @@
-+/* List the relocation types for mips.  -*- C -*-
-+   Copyright (C) 2006 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+/* 	    NAME,		REL|EXEC|DYN	*/
-+
-+RELOC_TYPE (NONE,               0)
-+RELOC_TYPE (16,                 0)
-+RELOC_TYPE (32,                 0)
-+RELOC_TYPE (REL32,              0)
-+RELOC_TYPE (26,                 0)
-+RELOC_TYPE (HI16,               0)
-+RELOC_TYPE (LO16,               0)
-+RELOC_TYPE (GPREL16,            0)
-+RELOC_TYPE (LITERAL,            0)
-+RELOC_TYPE (GOT16,              0)
-+RELOC_TYPE (PC16,               0)
-+RELOC_TYPE (CALL16,             0)
-+RELOC_TYPE (GPREL32,            0)
-+
-+RELOC_TYPE (SHIFT5,             0)
-+RELOC_TYPE (SHIFT6,             0)
-+RELOC_TYPE (64,                 0)
-+RELOC_TYPE (GOT_DISP,           0)
-+RELOC_TYPE (GOT_PAGE,           0)
-+RELOC_TYPE (GOT_OFST,           0)
-+RELOC_TYPE (GOT_HI16,           0)
-+RELOC_TYPE (GOT_LO16,           0)
-+RELOC_TYPE (SUB,                0)
-+RELOC_TYPE (INSERT_A,           0)
-+RELOC_TYPE (INSERT_B,           0)
-+RELOC_TYPE (DELETE,             0)
-+RELOC_TYPE (HIGHER,             0)
-+RELOC_TYPE (HIGHEST,            0)
-+RELOC_TYPE (CALL_HI16,          0)
-+RELOC_TYPE (CALL_LO16,          0)
-+RELOC_TYPE (SCN_DISP,           0)
-+RELOC_TYPE (REL16,              0)
-+RELOC_TYPE (ADD_IMMEDIATE,      0)
-+RELOC_TYPE (PJUMP,              0)
-+RELOC_TYPE (RELGOT,             0)
-+RELOC_TYPE (JALR,               0)
-+RELOC_TYPE (TLS_DTPMOD32,       0)
-+RELOC_TYPE (TLS_DTPREL32,       0)
-+RELOC_TYPE (TLS_DTPMOD64,       0)
-+RELOC_TYPE (TLS_DTPREL64,       0)
-+RELOC_TYPE (TLS_GD,             0)
-+RELOC_TYPE (TLS_LDM,            0)
-+RELOC_TYPE (TLS_DTPREL_HI16,    0)
-+RELOC_TYPE (TLS_DTPREL_LO16,    0)
-+RELOC_TYPE (TLS_GOTTPREL,       0)
-+RELOC_TYPE (TLS_TPREL32,        0)
-+RELOC_TYPE (TLS_TPREL64,        0)
-+RELOC_TYPE (TLS_TPREL_HI16,     0)
-+RELOC_TYPE (TLS_TPREL_LO16,     0)
-+
-+#define NO_COPY_RELOC 1
-+#define NO_RELATIVE_RELOC 1
-diff --git a/backends/mips_retval.c b/backends/mips_retval.c
-new file mode 100644
-index 0000000..656cd1f
---- /dev/null
-+++ b/backends/mips_retval.c
-@@ -0,0 +1,321 @@
-+/* Function return value location for Linux/mips ABI.
-+   Copyright (C) 2005 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <assert.h>
-+#include <dwarf.h>
-+#include <elf.h>
-+
-+#include "../libebl/libeblP.h"
-+#include "../libdw/libdwP.h"
-+
-+#define BACKEND mips_
-+#include "libebl_CPU.h"
-+
-+/* The ABI of the file.  Also see EF_MIPS_ABI2 above. */
-+#define EF_MIPS_ABI		0x0000F000
-+
-+/* The original o32 abi. */
-+#define E_MIPS_ABI_O32          0x00001000
-+
-+/* O32 extended to work on 64 bit architectures */
-+#define E_MIPS_ABI_O64          0x00002000
-+
-+/* EABI in 32 bit mode */
-+#define E_MIPS_ABI_EABI32       0x00003000
-+
-+/* EABI in 64 bit mode */
-+#define E_MIPS_ABI_EABI64       0x00004000
-+
-+/* All the possible MIPS ABIs. */
-+enum mips_abi
-+  {
-+    MIPS_ABI_UNKNOWN = 0,
-+    MIPS_ABI_N32,
-+    MIPS_ABI_O32,
-+    MIPS_ABI_N64,
-+    MIPS_ABI_O64,
-+    MIPS_ABI_EABI32,
-+    MIPS_ABI_EABI64,
-+    MIPS_ABI_LAST
-+  };
-+
-+/* Find the mips ABI of the current file */
-+enum mips_abi find_mips_abi(Elf *elf)
-+{
-+  GElf_Ehdr ehdr_mem;
-+  GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
-+
-+  if (ehdr == NULL)
-+    return MIPS_ABI_LAST;
-+
-+  GElf_Word elf_flags = ehdr->e_flags;
-+
-+  /* Check elf_flags to see if it specifies the ABI being used.  */
-+  switch ((elf_flags & EF_MIPS_ABI))
-+    {
-+    case E_MIPS_ABI_O32:
-+      return MIPS_ABI_O32;
-+    case E_MIPS_ABI_O64:
-+      return MIPS_ABI_O64;
-+    case E_MIPS_ABI_EABI32:
-+      return MIPS_ABI_EABI32;
-+    case E_MIPS_ABI_EABI64:
-+      return MIPS_ABI_EABI64;
-+    default:
-+      if ((elf_flags & EF_MIPS_ABI2))
-+	return MIPS_ABI_N32;
-+    }
-+
-+  /* GCC creates a pseudo-section whose name describes the ABI.  */
-+  size_t shstrndx;
-+  if (elf_getshdrstrndx (elf, &shstrndx) < 0)
-+    return MIPS_ABI_LAST;
-+
-+  const char *name;
-+  Elf_Scn *scn = NULL;
-+  while ((scn = elf_nextscn (elf, scn)) != NULL)
-+    {
-+      GElf_Shdr shdr_mem;
-+      GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
-+      if (shdr == NULL)
-+        return MIPS_ABI_LAST;
-+
-+      name = elf_strptr (elf, shstrndx, shdr->sh_name) ?: "";
-+      if (strncmp (name, ".mdebug.", 8) != 0)
-+        continue;
-+
-+      if (strcmp (name, ".mdebug.abi32") == 0)
-+        return MIPS_ABI_O32;
-+      else if (strcmp (name, ".mdebug.abiN32") == 0)
-+        return MIPS_ABI_N32;
-+      else if (strcmp (name, ".mdebug.abi64") == 0)
-+        return MIPS_ABI_N64;
-+      else if (strcmp (name, ".mdebug.abiO64") == 0)
-+        return MIPS_ABI_O64;
-+      else if (strcmp (name, ".mdebug.eabi32") == 0)
-+        return MIPS_ABI_EABI32;
-+      else if (strcmp (name, ".mdebug.eabi64") == 0)
-+        return MIPS_ABI_EABI64;
-+      else
-+        return MIPS_ABI_UNKNOWN;
-+    }
-+
-+  return MIPS_ABI_UNKNOWN;
-+}
-+
-+unsigned int
-+mips_abi_regsize (enum mips_abi abi)
-+{
-+  switch (abi)
-+    {
-+    case MIPS_ABI_EABI32:
-+    case MIPS_ABI_O32:
-+      return 4;
-+    case MIPS_ABI_N32:
-+    case MIPS_ABI_N64:
-+    case MIPS_ABI_O64:
-+    case MIPS_ABI_EABI64:
-+      return 8;
-+    case MIPS_ABI_UNKNOWN:
-+    case MIPS_ABI_LAST:
-+    default:
-+      return 0;
-+    }
-+}
-+
-+
-+/* $v0 or pair $v0, $v1 */
-+static const Dwarf_Op loc_intreg_o32[] =
-+  {
-+    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+
-+static const Dwarf_Op loc_intreg[] =
-+  {
-+    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 8 },
-+    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 8 },
-+  };
-+#define nloc_intreg	1
-+#define nloc_intregpair	4
-+
-+/* $f0 (float), or pair $f0, $f1 (double).
-+ * f2/f3 are used for COMPLEX (= 2 doubles) returns in Fortran */
-+static const Dwarf_Op loc_fpreg_o32[] =
-+  {
-+    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_regx, .number = 33 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_regx, .number = 35 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+
-+/* $f0, or pair $f0, $f2.  */
-+static const Dwarf_Op loc_fpreg[] =
-+  {
-+    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 8 },
-+    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 8 },
-+  };
-+#define nloc_fpreg  1
-+#define nloc_fpregpair 4
-+#define nloc_fpregquad 8
-+
-+/* The return value is a structure and is actually stored in stack space
-+   passed in a hidden argument by the caller.  But, the compiler
-+   helpfully returns the address of that space in $v0.  */
-+static const Dwarf_Op loc_aggregate[] =
-+  {
-+    { .atom = DW_OP_breg2, .number = 0 }
-+  };
-+#define nloc_aggregate 1
-+
-+int
-+mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+  /* First find the ABI used by the elf object */
-+  enum mips_abi abi = find_mips_abi(functypedie->cu->dbg->elf);
-+
-+  /* Something went seriously wrong while trying to figure out the ABI */
-+  if (abi == MIPS_ABI_LAST)
-+    return -1;
-+
-+  /* We couldn't identify the ABI, but the file seems valid */
-+  if (abi == MIPS_ABI_UNKNOWN)
-+    return -2;
-+
-+  /* Can't handle EABI variants */
-+  if ((abi == MIPS_ABI_EABI32) || (abi == MIPS_ABI_EABI64))
-+    return -2;
-+
-+  unsigned int regsize = mips_abi_regsize (abi);
-+  if (!regsize)
-+    return -2;
-+
-+  /* Start with the function's type, and get the DW_AT_type attribute,
-+     which is the type of the return value.  */
-+
-+  Dwarf_Attribute attr_mem;
-+  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
-+  if (attr == NULL)
-+    /* The function has no return value, like a `void' function in C.  */
-+    return 0;
-+
-+  Dwarf_Die die_mem;
-+  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
-+  int tag = dwarf_tag (typedie);
-+
-+  /* Follow typedefs and qualifiers to get to the actual type.  */
-+  while (tag == DW_TAG_typedef
-+	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type)
-+    {
-+      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+      typedie = dwarf_formref_die (attr, &die_mem);
-+      tag = dwarf_tag (typedie);
-+    }
-+
-+  switch (tag)
-+    {
-+    case -1:
-+      return -1;
-+
-+    case DW_TAG_subrange_type:
-+      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
-+	{
-+	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+	  typedie = dwarf_formref_die (attr, &die_mem);
-+	  tag = dwarf_tag (typedie);
-+	}
-+      /* Fall through.  */
-+
-+    case DW_TAG_base_type:
-+    case DW_TAG_enumeration_type:
-+    case DW_TAG_pointer_type:
-+    case DW_TAG_ptr_to_member_type:
-+      {
-+        Dwarf_Word size;
-+	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
-+					 &attr_mem), &size) != 0)
-+	  {
-+	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	      size = regsize;
-+	    else
-+	      return -1;
-+	  }
-+	if (tag == DW_TAG_base_type)
-+	  {
-+	    Dwarf_Word encoding;
-+	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+					     &attr_mem), &encoding) != 0)
-+	      return -1;
-+
-+#define ABI_LOC(loc, regsize) ((regsize) == 4 ? (loc ## _o32) : (loc))
-+
-+	    if (encoding == DW_ATE_float)
-+	      {
-+		*locp = ABI_LOC(loc_fpreg, regsize);
-+		if (size <= regsize)
-+		    return nloc_fpreg;
-+
-+		if (size <= 2*regsize)
-+                  return nloc_fpregpair;
-+
-+		if (size <= 4*regsize && abi == MIPS_ABI_O32)
-+                  return nloc_fpregquad;
-+
-+		goto aggregate;
-+	      }
-+	  }
-+	*locp = ABI_LOC(loc_intreg, regsize);
-+	if (size <= regsize)
-+	  return nloc_intreg;
-+	if (size <= 2*regsize)
-+	  return nloc_intregpair;
-+
-+	/* Else fall through. Shouldn't happen though (at least with gcc) */
-+      }
-+
-+    case DW_TAG_structure_type:
-+    case DW_TAG_class_type:
-+    case DW_TAG_union_type:
-+    case DW_TAG_array_type:
-+    aggregate:
-+      /* XXX TODO: Can't handle structure return with other ABI's yet :-/ */
-+      if ((abi != MIPS_ABI_O32) && (abi != MIPS_ABI_O64))
-+        return -2;
-+
-+      *locp = loc_aggregate;
-+      return nloc_aggregate;
-+    }
-+
-+  /* XXX We don't have a good way to return specific errors from ebl calls.
-+     This value means we do not understand the type, but it is well-formed
-+     DWARF and might be valid.  */
-+  return -2;
-+}
-diff --git a/backends/mips_symbol.c b/backends/mips_symbol.c
-new file mode 100644
-index 0000000..261b05d
---- /dev/null
-+++ b/backends/mips_symbol.c
-@@ -0,0 +1,53 @@
-+/* MIPS specific symbolic name handling.
-+   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
-+   This file is part of Red Hat elfutils.
-+   Written by Jakub Jelinek <jakub@redhat.com>, 2002.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <elf.h>
-+#include <stddef.h>
-+
-+#define BACKEND		mips_
-+#include "libebl_CPU.h"
-+
-+/* Check for the simple reloc types.  */
-+Elf_Type
-+mips_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type,
-+                        int *addsub __attribute__ ((unused)))
-+{
-+  switch (type)
-+    {
-+    case R_MIPS_16:
-+      return ELF_T_HALF;
-+    case R_MIPS_32:
-+      return ELF_T_WORD;
-+    case R_MIPS_64:
-+      return ELF_T_XWORD;
-+    default:
-+      return ELF_T_NUM;
-+    }
-+}
-diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 210b47e..1feac13 100644
---- a/libebl/eblopenbackend.c
-+++ b/libebl/eblopenbackend.c
-@@ -57,6 +57,7 @@ const char *m68k_init (Elf *, GElf_Half, Ebl *, size_t);
- const char *bpf_init (Elf *, GElf_Half, Ebl *, size_t);
- const char *riscv_init (Elf *, GElf_Half, Ebl *, size_t);
- const char *csky_init (Elf *, GElf_Half, Ebl *, size_t);
-+const char *mips_init (Elf *, GElf_Half, Ebl *, size_t);
- 
- /* This table should contain the complete list of architectures as far
-    as the ELF specification is concerned.  */
-@@ -87,6 +88,8 @@ static const struct
-   { sparc_init, "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
-   { sparc_init, "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
-   { s390_init, "ebl_s390", "s390", 4, EM_S390, 0, 0 },
-+  { mips_init, "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
-+  { mips_init, "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
- 
-   { NULL, "elf_m32", "m32", 3, EM_M32, 0, 0 },
-   { m68k_init, "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch b/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
deleted file mode 100644
index dd8f88a454..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 5bf6117a6eaf9007ce80adbb8b66a95ca98047a4 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 17:00:30 +0800
-Subject: [PATCH] mips_cfi
-
-Upstream-Status: Pending [from debian]
-
-Rebase to 0.177
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- backends/Makefile.am |  2 +-
- backends/mips_cfi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
- backends/mips_init.c |  1 +
- 3 files changed, 82 insertions(+), 1 deletion(-)
- create mode 100644 backends/mips_cfi.c
-
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 07d45d7..dec3080 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -100,7 +100,7 @@ riscv_SRCS = riscv_init.c riscv_symbol.c riscv_cfi.c riscv_regs.c \
- csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
- 	    csky_regs.c csky_initreg.c csky_corenote.c
- 
--mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
-+mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c mips_cfi.c
- 
- libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
- 			    $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
-diff --git a/backends/mips_cfi.c b/backends/mips_cfi.c
-new file mode 100644
-index 0000000..9ffdab5
---- /dev/null
-+++ b/backends/mips_cfi.c
-@@ -0,0 +1,80 @@
-+/* MIPS ABI-specified defaults for DWARF CFI.
-+   Copyright (C) 2018 Kurt Roeckx, Inc.
-+   This file is part of elfutils.
-+
-+   This file is free software; you can redistribute it and/or modify
-+   it under the terms of either
-+
-+     * the GNU Lesser General Public License as published by the Free
-+       Software Foundation; either version 3 of the License, or (at
-+       your option) any later version
-+
-+   or
-+
-+     * the GNU General Public License as published by the Free
-+       Software Foundation; either version 2 of the License, or (at
-+       your option) any later version
-+
-+   or both in parallel, as here.
-+
-+   elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received copies of the GNU General Public License and
-+   the GNU Lesser General Public License along with this program.  If
-+   not, see <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <dwarf.h>
-+
-+#define BACKEND mips_
-+#include "libebl_CPU.h"
-+
-+int
-+mips_abi_cfi (Ebl *ebl __attribute__ ((unused)), Dwarf_CIE *abi_info)
-+{
-+  static const uint8_t abi_cfi[] =
-+    {
-+      /* Call-saved regs.  */
-+      DW_CFA_same_value, ULEB128_7 (16), /* $16 */
-+      DW_CFA_same_value, ULEB128_7 (17), /* $17 */
-+      DW_CFA_same_value, ULEB128_7 (18), /* $18 */
-+      DW_CFA_same_value, ULEB128_7 (19), /* $19 */
-+      DW_CFA_same_value, ULEB128_7 (20), /* $20 */
-+      DW_CFA_same_value, ULEB128_7 (21), /* $21 */
-+      DW_CFA_same_value, ULEB128_7 (22), /* $22 */
-+      DW_CFA_same_value, ULEB128_7 (23), /* $23 */
-+      DW_CFA_same_value, ULEB128_7 (28), /* $28 */
-+      DW_CFA_same_value, ULEB128_7 (29), /* $29 */
-+      DW_CFA_same_value, ULEB128_7 (30), /* $30 */
-+
-+      DW_CFA_same_value, ULEB128_7 (52), /* $f20 */
-+      DW_CFA_same_value, ULEB128_7 (53), /* $f21 */
-+      DW_CFA_same_value, ULEB128_7 (54), /* $f22 */
-+      DW_CFA_same_value, ULEB128_7 (55), /* $f23 */
-+      DW_CFA_same_value, ULEB128_7 (56), /* $f24 */
-+      DW_CFA_same_value, ULEB128_7 (57), /* $f25 */
-+      DW_CFA_same_value, ULEB128_7 (58), /* $f26 */
-+      DW_CFA_same_value, ULEB128_7 (59), /* $f27 */
-+      DW_CFA_same_value, ULEB128_7 (60), /* $f28 */
-+      DW_CFA_same_value, ULEB128_7 (61), /* $f29 */
-+      DW_CFA_same_value, ULEB128_7 (62), /* $f30 */
-+      DW_CFA_same_value, ULEB128_7 (63), /* $f31 */
-+
-+      /* The CFA is the SP.  */
-+      DW_CFA_def_cfa, ULEB128_7 (29), ULEB128_7 (0),
-+    };
-+
-+  abi_info->initial_instructions = abi_cfi;
-+  abi_info->initial_instructions_end = &abi_cfi[sizeof abi_cfi];
-+  abi_info->data_alignment_factor = 4;
-+
-+  abi_info->return_address_register = 31; /* $31 */
-+
-+  return 0;
-+}
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-index 8482e7f..bce5abe 100644
---- a/backends/mips_init.c
-+++ b/backends/mips_init.c
-@@ -50,6 +50,7 @@ mips_init (Elf *elf __attribute__ ((unused)),
-   HOOK (eh, reloc_simple_type);
-   HOOK (eh, return_value_location);
-   HOOK (eh, register_info);
-+  HOOK (eh, abi_cfi);
- 
-   return MODVERSION;
- }
diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
deleted file mode 100644
index c6d42e163a..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7bdc83296865cf2b2a5615dbdb7ac0d441fb1849 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 16:55:01 +0800
-Subject: [PATCH] mips_readelf_w
-
-Upstream-Status: Pending [from debian]
-
-Rebase to 0.177
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/readelf.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/readelf.c b/src/readelf.c
-index 2084fb1..5c02a9b 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -11256,7 +11256,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *ebl, GElf_Ehdr *ehdr)
-       GElf_Shdr shdr_mem;
-       GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
- 
--      if (shdr != NULL && shdr->sh_type == SHT_PROGBITS)
-+      if (shdr != NULL && (
-+	 (shdr->sh_type == SHT_PROGBITS) || (shdr->sh_type == SHT_MIPS_DWARF)))
- 	{
- 	  static const struct
- 	  {
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
deleted file mode 100644
index e6d7948c67..0000000000
--- a/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6393b0e57872b3ffedf0dbd6784cd29694010878 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 Aug 2019 16:59:01 +0800
-Subject: [PATCH 1/2] testsuite-ignore-elflint
-
-Upstream-Status: Pending [from debian]
-
-Rebase to 0.177
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/run-elflint-self.sh |  2 +-
- tests/test-subr.sh        | 15 +++++++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/tests/run-elflint-self.sh b/tests/run-elflint-self.sh
-index 58fa7d0..85d21a5 100755
---- a/tests/run-elflint-self.sh
-+++ b/tests/run-elflint-self.sh
-@@ -18,5 +18,5 @@
- 
- . $srcdir/test-subr.sh
- 
--testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-+testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
- testrun_on_self_compressed ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-diff --git a/tests/test-subr.sh b/tests/test-subr.sh
-index 09f428d..26f61f1 100644
---- a/tests/test-subr.sh
-+++ b/tests/test-subr.sh
-@@ -201,3 +201,18 @@ testrun_on_self_quiet()
-   # Only exit if something failed
-   if test $exit_status != 0; then exit $exit_status; fi
- }
-+
-+# Same as testrun_on_self(), but skip on failure.
-+testrun_on_self_skip()
-+{
-+  exit_status=0
-+
-+  for file in $self_test_files; do
-+      testrun $* $file \
-+	  || { echo "*** failure in $* $file"; exit_status=77; }
-+  done
-+
-+  # Only exit if something failed
-+  if test $exit_status != 0; then exit $exit_status; fi
-+}
-+
--- 
-2.7.4
-
-- 
2.27.0

