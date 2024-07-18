Return-Path: <simit.ghane@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D13C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:15:10 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.11994.1721297706276621895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: simit.ghane@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 18 Jul 2024 19:15:04 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: simit.ghane@lge.com
Received: from unknown (HELO si-rd23-bld64.lge.net) (10.221.31.64)
	by 156.147.1.126 with ESMTP; 18 Jul 2024 19:15:03 +0900
X-Original-SENDERIP: 10.221.31.64
X-Original-MAILFROM: simit.ghane@lge.com
From: "simit.ghane" <simit.ghane@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: "simit.ghane" <simit.ghane@lge.com>
Subject: [PATCHv1] libgcrypt: upgrade 1.10.3 -> 1.11.0
Date: Thu, 18 Jul 2024 15:44:57 +0530
Message-Id: <20240718101457.4078289-1-simit.ghane@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202201

Changelog:
==========
- Add Kyber algorithm according to FIPS 203 ipd 2023-08-24
- Fix AESWRAP padding length check.

License-Update: Add 3-clause BSD license for poly1305-amd64-avx512.S.
                Add 'cipher/keccak-amd64-avx512.S'.
                Update license docs for FSF new address and update gcrypt.texi.

Apart from upgrade also refreshed the patches like
0001-libgcrypt-fix-m4-file-for-oe-core.patch
0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
no-bench-slope.patch

In 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
reverted back the change in cipher/Makefile.am related to o_flag_munging

Signed-off-by: simit.ghane <simit.ghane@lge.com>
---
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch | 17 ++++++++------
 ...ilding-error-with-O2-in-sysroot-path.patch | 23 ++++++++++---------
 .../libgcrypt/files/no-bench-slope.patch      | 12 ++++++----
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.11.0.bb} |  8 +++----
 4 files changed, 34 insertions(+), 26 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.11.0.bb} (85%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index cbfa30f0ad..9615611f6e 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -17,13 +17,13 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index cd4249e..e53a36f 100644
+index 353df81b6d..b195e22894 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
-@@ -29,41 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
- dnl
+@@ -116,41 +116,6 @@ dnl
  AC_DEFUN([AM_PATH_LIBGCRYPT],
- [ AC_REQUIRE([AC_CANONICAL_HOST])
+ [ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+   AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
 -  AC_ARG_WITH(libgcrypt-prefix,
 -            AS_HELP_STRING([--with-libgcrypt-prefix=PFX],
 -                           [prefix where LIBGCRYPT is installed (optional)]),
@@ -62,7 +62,7 @@ index cd4249e..e53a36f 100644
  
    tmp=ifelse([$1], ,1:1.2.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -74,56 +39,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+@@ -161,56 +126,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       min_libgcrypt_version="$tmp"
    fi
  
@@ -122,7 +122,7 @@ index cd4249e..e53a36f 100644
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([LIBGCRYPT API version])
             if test "$req_libgcrypt_api" -eq "$tmp" ; then
-@@ -136,11 +58,9 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+@@ -223,11 +145,9 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       fi
    fi
    if test $ok = yes; then
@@ -135,7 +135,7 @@ index cd4249e..e53a36f 100644
      else
        libgcrypt_config_host=`$LIBGCRYPT_CONFIG --variable=host 2>/dev/null || echo none`
      fi
-@@ -158,8 +78,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+@@ -245,8 +165,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
        fi
      fi
    else
@@ -144,3 +144,6 @@ index cd4249e..e53a36f 100644
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBGCRYPT_CFLAGS)
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
index ea5bba8891..c93c9dad85 100644
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -1,11 +1,9 @@
-From 7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 Mon Sep 17 00:00:00 2001
+From 5fc6ab73bb077da123a4fbce3169e3dbe25ad46c Mon Sep 17 00:00:00 2001
 From: "simit.ghane" <simit.ghane@lge.com>
 Date: Tue, 7 May 2024 14:09:03 +0530
-Subject: [PATCHV2] Fix building error with '-O2' in sysroot path
+Subject: [PATCH] Fix building error with '-O2' in sysroot path
 
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=5afadba008918d651afefb842ae123cc18454c74]
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14]
 
 * cipher/Makefile.am (o_flag_munging): Tweak the sed script.
 * random/Makefile.am (o_flag_munging): Ditto.
@@ -43,28 +41,31 @@ Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index c3d642b2ac..f1c3971c40 100644
+index ea9014cc98..149c9f2101 100644
 --- a/cipher/Makefile.am
 +++ b/cipher/Makefile.am
-@@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
+@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
  
  
  if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
  else
  o_flag_munging = cat
  endif
 diff --git a/random/Makefile.am b/random/Makefile.am
-index 0c935a0595..340df38a79 100644
+index c7100ef8b8..a42e430649 100644
 --- a/random/Makefile.am
 +++ b/random/Makefile.am
 @@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
  
  # The rndjent module needs to be compiled without optimization.  */
  if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
 +o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
  else
  o_flag_munging = cat
  endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 8de3c6713b..ed65ed4e67 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -5,9 +5,12 @@ Until this has been root-caused, disable the test.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/testdrv.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 0ccde326..d3455186 100644
+index bfca4c2314..5a755f512e 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -77,7 +77,6 @@ static struct {
@@ -15,6 +18,7 @@ index 0ccde326..d3455186 100644
     { "t-ed448"     },
     { "benchmark"   },
 -   { "bench-slope" },
-    { "hashtest-256g",  "hashtest", "--gigs 256 SHA1 SHA256 SHA512 SM3",
-      LONG_RUNNING },
-    { NULL }
+    { "hashtest-6g", "hashtest", "--hugeblock --gigs 6 SHA1 SHA256 SHA512 "
+                                                      "SHA3-512 SM3 BLAKE2S_256 "
+                                                      "BLAKE2B_512 CRC32 "
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
similarity index 85%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
index 5a76201ab5..1235c2f64d 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
@@ -11,9 +11,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://LICENSES;md5=ef545b6cc717747072616519a1256d69 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
                     "
 
 DEPENDS = "libgpg-error"
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

