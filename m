Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.2367.1585247210053234933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dkm16+Ls;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id i13so3213211pfe.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXs7FRgV/EaS/iNPh+o2hkx+iMBxIP6bd/Q0uyEnwrE=;
        b=Dkm16+LswufpuRP04M62jGFMWnnh/m5oR3DqQ5Hvc7aaurUNEy1VB3H5pKXlybXIRw
         VCDP1bSbAsy2LSEH+2iJY3ROiv7fRCFxKpebsruf8LOENxANK8HvVgoT98fMxLAvhgw4
         714A2/77AQLSCRWjhWh/T3ebRoJC3w0ixfPqyE+9kJ1+4HJb2LNareNlFxpIWSJu29gv
         5aeQ8aHFNEBnsGaPbZSco1ZWQOVM8vz3FV1DI4A34V2mCJHqgQiONa+Wm9GYxz0WfSQZ
         QV1/0XMARofmAAvg+vnyyGbHcrCMLkrP86BbP44qLWKa1tF9k7MPvFLszAD8sEUfL5HW
         6eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXs7FRgV/EaS/iNPh+o2hkx+iMBxIP6bd/Q0uyEnwrE=;
        b=Z8EPZQHw43467tAOQM8bnnv1OVn2cjMwAwqxcA8Iu7SUMSVAw4trQbF71LMJ11uVB8
         Qmzhd2VPTRoanLaVUYm77g1TvX3AAWHCdgJGyaMaxNJuhYLV51Zoh70MnEJDumhAxXWr
         GmUZ8MujheOddtjG5lGWbFWjGrwgOBH6xgGqQEPpz5fnYD9DRkE6tmhCZb7EhA5x8ZO6
         aK/x8PS7W1RrbFAuLHoI6By+Kg0K5obB8bqZQRB3Ct93B85y4OG2F5taj88mq/7H3ZGy
         XWPCOEJarAQLY9YMiZpSMatxJOJETnb0ZpnwQ8WmQzcEzB5W+WRbCb8HbJ7bMvpl3uPR
         iR4A==
X-Gm-Message-State: ANhLgQ08UAZXwC8wXUdJH9PjgY8jKVAgE5CvQVaNMsLndgTNIp8Ak8Ah
	cugBN6IBYd9x6GqqKWAZTUyQ5mx4cdY=
X-Google-Smtp-Source: ADFU+vsBZpxZkW7mXgcbMKI9VjXlOZfYTUtQRlzxmql8m0zEAS4xSeGn4PQoPlVl9vNO50YNvVWG+g==
X-Received: by 2002:a63:f113:: with SMTP id f19mr10342460pgi.168.1585247208681;
        Thu, 26 Mar 2020 11:26:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6809])
        by smtp.gmail.com with ESMTPSA id 21sm2182645pgf.41.2020.03.26.11.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 11:26:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Drop patching configure scripts
Date: Thu, 26 Mar 2020 11:26:58 -0700
Message-Id: <20200326182658.2898982-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It can cause million problems due to timestamp reversals
if they are patched, system will regen the confgure reliably
if we do not do this

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...igure.ac-handle-correctly-libc_cv_ro.patch |  13 --
 ...the-path-sets-wrong-config-variables.patch | 133 ------------------
 .../0030-Improve-IFUNC-check-BZ-25506.patch   |  14 --
 3 files changed, 160 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 0cdd0567df..f3bf66e4fd 100644
--- a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -9,22 +9,9 @@ Upstream-Status:Pending
 Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/gnu/configure    | 2 +-
  sysdeps/gnu/configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
-index c15d1087e8..37cc983f2a 100644
---- a/sysdeps/gnu/configure
-+++ b/sysdeps/gnu/configure
-@@ -32,6 +32,6 @@ case "$prefix" in
-   else
-     libc_cv_localstatedir=$localstatedir
-    fi
--  libc_cv_rootsbindir=/sbin
-+  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
-   ;;
- esac
 diff --git a/sysdeps/gnu/configure.ac b/sysdeps/gnu/configure.ac
 index 634fe4de2a..3db1697f4f 100644
 --- a/sysdeps/gnu/configure.ac
diff --git a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
index 49089af41e..f4dadd11a0 100644
--- a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
@@ -14,39 +14,14 @@ Upstream-Status: Submitted [libc-alpha@sourceware.org]
 Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/configure                              | 4 ++--
  sysdeps/aarch64/configure.ac                           | 4 ++--
- sysdeps/arm/configure                                  | 4 ++--
  sysdeps/arm/configure.ac                               | 4 ++--
- sysdeps/mips/configure                                 | 4 ++--
  sysdeps/mips/configure.ac                              | 4 ++--
- sysdeps/nios2/configure                                | 4 ++--
  sysdeps/nios2/configure.ac                             | 4 ++--
- sysdeps/unix/sysv/linux/mips/configure                 | 4 ++--
  sysdeps/unix/sysv/linux/mips/configure.ac              | 4 ++--
- sysdeps/unix/sysv/linux/powerpc/powerpc64/configure    | 8 ++++----
  sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac | 8 ++++----
  12 files changed, 28 insertions(+), 28 deletions(-)
 
-diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 5bd355a691..3bc5537bc0 100644
---- a/sysdeps/aarch64/configure
-+++ b/sysdeps/aarch64/configure
-@@ -148,12 +148,12 @@ else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #ifdef __AARCH64EB__
--                      yes
-+                      is_aarch64_be
-                      #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_aarch64_be" >/dev/null 2>&1; then :
-   libc_cv_aarch64_be=yes
- else
-   libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
 index 7851dd4dac..6e9238171f 100644
 --- a/sysdeps/aarch64/configure.ac
@@ -62,25 +37,6 @@ index 7851dd4dac..6e9238171f 100644
                       #endif
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
-diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 431e843b2b..e152461138 100644
---- a/sysdeps/arm/configure
-+++ b/sysdeps/arm/configure
-@@ -151,12 +151,12 @@ else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #ifdef __ARM_PCS_VFP
--		      yes
-+		      use_arm_pcs_vfp
- 		     #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_arm_pcs_vfp" >/dev/null 2>&1; then :
-   libc_cv_arm_pcs_vfp=yes
- else
-   libc_cv_arm_pcs_vfp=no
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
 index 90cdd69c75..05a262ba00 100644
 --- a/sysdeps/arm/configure.ac
@@ -96,24 +52,6 @@ index 90cdd69c75..05a262ba00 100644
  		     #endif
    ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
  if test $libc_cv_arm_pcs_vfp = yes; then
-diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
-index 4e13248c03..f14af952d0 100644
---- a/sysdeps/mips/configure
-+++ b/sysdeps/mips/configure
-@@ -143,11 +143,11 @@ else
- /* end confdefs.h.  */
- dnl
- #ifdef __mips_nan2008
--yes
-+use_mips_nan2008
- #endif
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
-   libc_cv_mips_nan2008=yes
- else
-   libc_cv_mips_nan2008=no
 diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
 index bcbdaffd9f..ad3057f4cc 100644
 --- a/sysdeps/mips/configure.ac
@@ -130,25 +68,6 @@ index bcbdaffd9f..ad3057f4cc 100644
  #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
-diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-index 14c8a3a014..dde3814ef2 100644
---- a/sysdeps/nios2/configure
-+++ b/sysdeps/nios2/configure
-@@ -142,12 +142,12 @@ else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #ifdef __nios2_big_endian__
--                      yes
-+                      is_nios2_be
-                      #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_nios2_be" >/dev/null 2>&1; then :
-   libc_cv_nios2_be=yes
- else
-   libc_cv_nios2_be=no
 diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
 index f05f43802b..dc8639902d 100644
 --- a/sysdeps/nios2/configure.ac
@@ -164,24 +83,6 @@ index f05f43802b..dc8639902d 100644
                       #endif
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
-diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index 25f98e0c7b..e95bfae359 100644
---- a/sysdeps/unix/sysv/linux/mips/configure
-+++ b/sysdeps/unix/sysv/linux/mips/configure
-@@ -414,11 +414,11 @@ else
- /* end confdefs.h.  */
- dnl
- #ifdef __mips_nan2008
--yes
-+use_mips_nan2008
- #endif
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
-   libc_cv_mips_nan2008=yes
- else
-   libc_cv_mips_nan2008=no
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
 index 3db1b32b08..f8cd375ebc 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
@@ -198,40 +99,6 @@ index 3db1b32b08..f8cd375ebc 100644
  #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
  
  libc_mips_nan=
-diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-index ae7f254da4..874519000b 100644
---- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-@@ -155,12 +155,12 @@ else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #if _CALL_ELF == 2
--                      yes
-+                      use_ppc_elfv2_abi
-                      #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_ppc_elfv2_abi" >/dev/null 2>&1; then :
-   libc_cv_ppc64_elfv2_abi=yes
- else
-   libc_cv_ppc64_elfv2_abi=no
-@@ -188,12 +188,12 @@ else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #ifdef _CALL_ELF
--                         yes
-+                         is_def_call_elf
-                        #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_def_call_elf" >/dev/null 2>&1; then :
-   libc_cv_ppc64_def_call_elf=yes
- else
-   libc_cv_ppc64_def_call_elf=no
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
 index f9cba6e15d..b21f72f1e4 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
diff --git a/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch b/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
index 1cb398d2bc..33e234dc3e 100644
--- a/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
+++ b/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
@@ -12,23 +12,9 @@ Tested-by: Aurelien Jarno <aurelien@aurel32.net>
 Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure    | 2 +-
  configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure b/configure
-index b959d2d988..3b98ec312f 100755
---- a/configure
-+++ b/configure
-@@ -4035,7 +4035,7 @@ if ${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS \
- 	    -o conftest conftest.S 1>&5 2>&5; then
-   # Do a link to see if the backend supports IFUNC relocs.
-   $READELF -r conftest 1>&5
--  LC_ALL=C $READELF -r conftest | grep 'no relocations' >/dev/null || {
-+  LC_ALL=C $READELF -Wr conftest | grep -q 'IRELATIVE\|R_SPARC_JMP_IREL' && {
-     libc_cv_ld_gnu_indirect_function=yes
-   }
- fi
 diff --git a/configure.ac b/configure.ac
 index 49b900c1ed..e20034f301 100644
 --- a/configure.ac
-- 
2.26.0

