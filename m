Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F94D10372
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 01:42:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3499.1764121311548213677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 17:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUMK8/JD;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aad4823079so5417371b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 17:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764121310; x=1764726110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pr4Y6CUvNjGa9qwSQxWqCZJFe6mn/jf2JiKazRJ/8U0=;
        b=ZUMK8/JDRktzPRthgwKLrdijYD1kAsG0g06icySgnU9isM0CvZSytNQUzIPFruW+A7
         CXclNfP99Z1ncBbIEbqLLdRwBbIyzoW5Jg49jlite7Wa/AVqW6SrFnBnGe3HBGikI5pU
         EN4Zzhj/GZrWa9Y6wzmpz7E5JobiRNKQAhLAlr+/G7n1L3Xm31Ud0grIcYY8ZmnDs6md
         YPaJKSE5lniU7VYkDcAEKZszLMZTbNwsyYIqIfUtJErvLa7REIHbyRK1NAq8K6VgXxj2
         so3JFf7awot0U0W1BRFklV3Upjqo3ckVnOj+SLetxr68JlM8tUXdTXYHXxbb69ZHXnVg
         6V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764121310; x=1764726110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr4Y6CUvNjGa9qwSQxWqCZJFe6mn/jf2JiKazRJ/8U0=;
        b=tB2spE8u75jKZg0/NQtVHH3mLz4yyQ7XNFGGRfV7fj/rkYWQmOv9rFZY9Uv9eYFIrt
         /9DiAwjONNLmsoyr2hH+BRs8Lu2ZZ02akjfcM00u1ilEDOzRRR7rMAFvcc80O9/fYaBG
         jMxcRtdQBmwUz+nJbb9VeDlNq26NQiBtwR0MU6DHAw9Dob6bu0Rip2SPvsbjjqMjxjHr
         ObIwGg/79jslIds0fvc5q/IyvlYwlV06YvfUKIzIwmjDILMclLGdfhoXwmA9JbZCeRTP
         X5dQRZUhu4PkOsiXp3iHYu2Gs/tvD/lHc12+W0AhUAh7y6E1O7HfGQ7S+pDFzLywDLtB
         i01Q==
X-Gm-Message-State: AOJu0YymXifEAkPPTuvh6cki6ff9a3Q6aytCJ9f70IjsPirqVOnd3LD3
	otTdROPizLrIN1PsrW7ELG3YgCoTl3oP8lHaK+/79UFtb22NA8KApK1qahwdPx+S
X-Gm-Gg: ASbGncvqO5XqRKqnuAPiMpq0VRvPiCanGK2Y0RzLun8f4IxKMiIStNLov/ibSHD5+ck
	leGuIxc1qOura7wzj13jkrMT24Q0a3+e/M8fleyVR2aObo4Kk0gYMO0M56fI9vXdO/6cFWMalGn
	9sLD0maXG44IyjVZ0505XyIUZvGq3L7SNYTwgpP68mzaghj+vI1+/Yr5XMYK3cCFaGR6WPmPDYC
	DWfNEtCM9f2P5bFQmC7FWRh4uZ1jgnHHOpPgK1wmwO+8N3zFvQs9iwZ+cENSySRQnbIL9Ja1KpR
	xNue65zzM6BLgbF7WxT2WZvn1RAx8EBdegsIIJmCuA6Cx10D39V1/mUwZxD/IJtVCktIvpYB2Ey
	DZnqrkKRBDFSZ2SDCuaLgBLcfFK+emj6fVB0HfN3Q00hWFHEVWA4HzUCecYOBhi1EUj8h9oDL9w
	oottQGm7+SkMtAACzcJepNo9nmr9xek0bDD3ftOYK8AUd7y2jP0TdWgTDzdiwi/gm7A2DJjBwIt
	GsvAl2d1uVZ7tCPgs3/4SidCjh6w2H7
X-Google-Smtp-Source: AGHT+IFGaclKxMmi0+YGCC6+OgLboK0b/WLwS696V5MOnHq/pzjXj1v6qdDW0HWhNJavgVVk05heug==
X-Received: by 2002:a05:7022:4397:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-11c9d8703c6mr11622917c88.34.1764121308421;
        Tue, 25 Nov 2025 17:41:48 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm96272478eec.2.2025.11.25.17.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:41:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Upgrade to 2.45.1 release
Date: Tue, 25 Nov 2025 17:41:45 -0800
Message-ID: <20251126014145.423052-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 01:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226796

Regenerate ld/configure

Brings following changes

* e3a18893e1c LoongArch: Use more appropriate assertions for the relocation of TLS LE
* b136efd10a7 Re: dlltool memory leaks
* b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
* ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if known_used is set
* cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale [PR gas/33562]
* 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
* 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
* 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependency
* b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
* d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.45.inc                |    6 +-
 ...-system-directories-when-cross-linki.patch |   48 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
 3 files changed, 832 insertions(+), 1049 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 288475ac390..acc3f17dc13 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.45"
-CVE_VERSION = "2.45"
+PV = "2.45.1"
+CVE_VERSION = "2.45.1"
 SRCBRANCH ?= "binutils-2_45-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 CVE_STATUS[CVE-2025-7545] = "cpe-stable-backport: fix available in used git hash"
 CVE_STATUS[CVE-2025-7546] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "2f028c6bb163a045db95439fb92e1dcbc919413c"
+SRCREV ?= "cb948f3e16a93ff03d0bc5cec6c4e5bdc7e7c17f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index 86ff7fdaa02..e981d14859a 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -62,11 +62,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/lexsup.c     | 15 +++++++++++++++
  9 files changed, 89 insertions(+), 4 deletions(-)
 
-diff --git a/ld/config.in b/ld/config.in
-index 37812241bd9..be89571196c 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -78,6 +78,9 @@
+@@ -86,6 +86,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -76,8 +74,6 @@ index 37812241bd9..be89571196c 100644
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-diff --git a/ld/configure b/ld/configure
-index 4afc58566fc..ca3d58ff618 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -841,6 +841,7 @@ enable_checking
@@ -88,7 +84,7 @@ index 4afc58566fc..ca3d58ff618 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1533,6 +1534,8 @@ Optional Features:
+@@ -1535,6 +1536,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-checking       enable run-time checks
    --enable-targets        alternative target configurations
@@ -97,25 +93,25 @@ index 4afc58566fc..ca3d58ff618 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -11514,7 +11517,7 @@ else
+@@ -11519,7 +11522,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11517 "configure"
-+#line 11520 "configure"
+-#line 11522 "configure"
++#line 11525 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11620,7 +11623,7 @@ else
+@@ -11625,7 +11628,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11623 "configure"
-+#line 11626 "configure"
+-#line 11628 "configure"
++#line 11631 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -15367,6 +15370,19 @@ fi
+@@ -15372,6 +15375,19 @@ fi
  
  
  
@@ -135,8 +131,6 @@ index 4afc58566fc..ca3d58ff618 100755
  # Check whether --enable-gold was given.
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
-diff --git a/ld/configure.ac b/ld/configure.ac
-index 3ee84958b1c..99ea84513da 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
@@ -156,8 +150,6 @@ index 3ee84958b1c..99ea84513da 100644
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-diff --git a/ld/ld.h b/ld/ld.h
-index c8688153bd4..0b16caf347a 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -166,6 +166,14 @@ typedef struct
@@ -175,11 +167,9 @@ index c8688153bd4..0b16caf347a 100644
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff --git a/ld/ld.texi b/ld/ld.texi
-index 413335ad765..7bea7fd7e1f 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -3350,6 +3350,18 @@ creation of the metadata note, if one had been enabled by an earlier
+@@ -3378,6 +3378,18 @@ creation of the metadata note, if one ha
  occurrence of the --package-metadata option.
  If the linker has been built with libjansson, then the JSON string
  will be validated.
@@ -198,11 +188,9 @@ index 413335ad765..7bea7fd7e1f 100644
  @end table
  
  @c man end
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 75fd360d5e3..5a825c52bd3 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -328,6 +328,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
+@@ -328,6 +328,23 @@ ldfile_add_library_path (const char *nam
      new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
@@ -226,8 +214,6 @@ index 75fd360d5e3..5a825c52bd3 100644
  }
  
  static void
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 815da76a4c0..53fabed4ba2 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -151,6 +151,8 @@ enum option_values
@@ -239,11 +225,9 @@ index 815da76a4c0..53fabed4ba2 100644
    OPTION_DEFAULT_SCRIPT,
    OPTION_PRINT_OUTPUT_FORMAT,
    OPTION_PRINT_SYSROOT,
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 7878bd3922f..c9293a3cf41 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -672,6 +672,8 @@ main (int argc, char **argv)
+@@ -671,6 +671,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = true;
    command_line.warn_search_mismatch = true;
    command_line.check_section_addresses = -1;
@@ -252,7 +236,7 @@ index 7878bd3922f..c9293a3cf41 100644
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-@@ -1876,7 +1878,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1875,7 +1877,7 @@ undefined_symbol (struct bfd_link_info *
        argv[1] = "undefined-symbol";
        argv[2] = (char *) name;
        argv[3] = NULL;
@@ -261,7 +245,7 @@ index 7878bd3922f..c9293a3cf41 100644
        if (verbose)
  	einfo (_("%P: About to run error handling script '%s' with arguments: '%s' '%s'\n"),
  	       argv[0], argv[1], argv[2]);
-@@ -1897,7 +1899,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1896,7 +1898,7 @@ undefined_symbol (struct bfd_link_info *
  	 carry on to issue the normal error message.  */
      }
  #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
@@ -270,11 +254,9 @@ index 7878bd3922f..c9293a3cf41 100644
    if (section != NULL)
      {
        if (error_count < MAX_ERRORS_IN_A_ROW)
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index bde20465835..95ab1b7c200 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -652,6 +652,14 @@ static const struct ld_option ld_options[] =
+@@ -652,6 +652,14 @@ static const struct ld_option ld_options
  		   "                                <method> is: share-unconflicted (default),\n"
  		   "                                             share-duplicated"),
      TWO_DASHES },
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index dd26bc61076..91569d2d063 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -45,8 +45,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  zlib/configure                      | 1331 ++++++++----
  34 files changed, 15653 insertions(+), 5737 deletions(-)
 
-diff --git a/bfd/Makefile.in b/bfd/Makefile.in
-index 8a670ad1d05..ec2850a97c0 100644
 --- a/bfd/Makefile.in
 +++ b/bfd/Makefile.in
 @@ -339,6 +339,7 @@ DATADIRNAME = @DATADIRNAME@
@@ -73,8 +71,6 @@ index 8a670ad1d05..ec2850a97c0 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
-diff --git a/bfd/configure b/bfd/configure
-index 86561b30ac4..c5a7ed1ed36 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -710,6 +710,9 @@ OTOOL
@@ -124,7 +120,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5793,8 +5799,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5793,8 +5799,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -260,7 +256,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6201,6 +6302,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6201,6 +6302,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -479,7 +475,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6302,25 +6564,20 @@ ac_tool_warned=yes ;;
+@@ -6302,25 +6564,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -511,11 +507,10 @@ index 86561b30ac4..c5a7ed1ed36 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
  
  
  
-@@ -6331,6 +6588,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6332,6 +6588,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -576,9 +571,10 @@ index 86561b30ac4..c5a7ed1ed36 100755
 +
 +
 +
- 
++
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
 @@ -6671,8 +6985,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -626,7 +622,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
    const char *name;
    void       *address;
  }
-@@ -6786,8 +7113,8 @@ static const void *lt_preloaded_setup() {
+@@ -6786,8 +7113,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -648,7 +644,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6835,6 +7162,14 @@ else
+@@ -6835,6 +7162,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -660,20 +656,17 @@ index 86561b30ac4..c5a7ed1ed36 100755
 +fi
 +
 +
++
++
++
++
  
  
  
-@@ -6853,6 +7188,47 @@ fi
+@@ -6856,6 +7195,43 @@ fi
  
  
  
-+
-+
-+
-+
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -708,9 +701,12 @@ index 86561b30ac4..c5a7ed1ed36 100755
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
- 
- 
- 
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -7062,6 +7438,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -853,7 +849,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8345,6 +8838,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8345,6 +8838,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -866,7 +862,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8407,7 +8906,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8407,7 +8906,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -1027,7 +1023,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9236,7 +9758,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9236,7 +9758,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1085,7 +1081,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9309,20 +9844,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9309,20 +9844,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1163,7 +1159,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9383,7 +9961,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9383,7 +9961,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1172,7 +1168,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9391,7 +9969,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9391,7 +9969,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1181,7 +1177,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9407,7 +9985,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9407,7 +9985,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1190,7 +1186,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9431,10 +10009,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9431,10 +10009,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1248,7 +1244,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9614,7 +10205,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9614,7 +10205,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1257,7 +1253,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9633,9 +10224,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9633,9 +10224,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1407,7 +1403,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
    fi
  fi
  
-@@ -17977,13 +18627,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17977,13 +18627,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1428,7 +1424,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17998,14 +18655,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17998,14 +18655,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1447,7 +1443,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18038,12 +18698,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18038,12 +18698,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1561,7 +1557,7 @@ index 86561b30ac4..c5a7ed1ed36 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19079,6 +19770,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19079,6 +19770,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1822,15 +1818,9 @@ index 86561b30ac4..c5a7ed1ed36 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -1988,14 +1978,15 @@ index 86561b30ac4..c5a7ed1ed36 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 5879a04785d..5ccc499d8d7 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
 @@ -281,7 +281,7 @@ changequote(,)dnl
@@ -2007,8 +1998,6 @@ index 5879a04785d..5ccc499d8d7 100644
    fi
  fi
  
-diff --git a/binutils/Makefile.in b/binutils/Makefile.in
-index 549b5a361c8..e1487641218 100644
 --- a/binutils/Makefile.in
 +++ b/binutils/Makefile.in
 @@ -495,6 +495,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
@@ -2035,8 +2024,6 @@ index 549b5a361c8..e1487641218 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
-diff --git a/binutils/configure b/binutils/configure
-index 0ff4539f458..6dca572ea4b 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -704,8 +704,11 @@ OTOOL
@@ -2088,7 +2075,7 @@ index 0ff4539f458..6dca572ea4b 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5690,8 +5696,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5690,8 +5696,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2224,7 +2211,7 @@ index 0ff4539f458..6dca572ea4b 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6098,6 +6199,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6098,6 +6199,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -2590,7 +2577,7 @@ index 0ff4539f458..6dca572ea4b 100755
    const char *name;
    void       *address;
  }
-@@ -6683,8 +7010,8 @@ static const void *lt_preloaded_setup() {
+@@ -6683,8 +7010,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2612,7 +2599,7 @@ index 0ff4539f458..6dca572ea4b 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6732,6 +7059,18 @@ else
+@@ -6732,6 +7059,15 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2625,18 +2612,13 @@ index 0ff4539f458..6dca572ea4b 100755
 +
 +
 +
-+
-+
-+
  
  
  
-@@ -6748,6 +7087,43 @@ fi
+@@ -6753,6 +7089,46 @@ fi
  
  
  
-+
-+
 +
 +
 +
@@ -2672,9 +2654,14 @@ index 0ff4539f458..6dca572ea4b 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -6959,6 +7335,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -2817,7 +2804,7 @@ index 0ff4539f458..6dca572ea4b 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8273,6 +8766,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8273,6 +8766,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2830,7 +2817,7 @@ index 0ff4539f458..6dca572ea4b 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8335,7 +8834,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8335,7 +8834,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2991,7 +2978,7 @@ index 0ff4539f458..6dca572ea4b 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9164,7 +9686,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9164,7 +9686,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -3049,7 +3036,7 @@ index 0ff4539f458..6dca572ea4b 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9237,20 +9772,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9237,20 +9772,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3127,7 +3114,7 @@ index 0ff4539f458..6dca572ea4b 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9311,7 +9889,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9311,7 +9889,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3136,7 +3123,7 @@ index 0ff4539f458..6dca572ea4b 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3145,7 +3132,7 @@ index 0ff4539f458..6dca572ea4b 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9335,7 +9913,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9335,7 +9913,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3154,7 +3141,7 @@ index 0ff4539f458..6dca572ea4b 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9359,10 +9937,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9359,10 +9937,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3212,7 +3199,7 @@ index 0ff4539f458..6dca572ea4b 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9542,7 +10133,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9542,7 +10133,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3221,7 +3208,7 @@ index 0ff4539f458..6dca572ea4b 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9561,9 +10152,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9561,9 +10152,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3362,7 +3349,7 @@ index 0ff4539f458..6dca572ea4b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17102,13 +17752,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17102,13 +17752,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3383,7 +3370,7 @@ index 0ff4539f458..6dca572ea4b 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17123,14 +17780,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17123,14 +17780,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3402,7 +3389,7 @@ index 0ff4539f458..6dca572ea4b 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17163,12 +17823,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17163,12 +17823,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3516,7 +3503,7 @@ index 0ff4539f458..6dca572ea4b 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18201,6 +18892,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18201,6 +18892,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3777,15 +3764,9 @@ index 0ff4539f458..6dca572ea4b 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -3943,14 +3924,15 @@ index 0ff4539f458..6dca572ea4b 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/gas/Makefile.in b/gas/Makefile.in
-index 1f24d4a5bbc..0147b491612 100644
 --- a/gas/Makefile.in
 +++ b/gas/Makefile.in
 @@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -3977,8 +3959,6 @@ index 1f24d4a5bbc..0147b491612 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
-diff --git a/gas/configure b/gas/configure
-index ca149e79195..ad4377e140a 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -692,8 +692,11 @@ OTOOL
@@ -4030,7 +4010,7 @@ index ca149e79195..ad4377e140a 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5386,8 +5392,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5386,8 +5392,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -4166,7 +4146,7 @@ index ca149e79195..ad4377e140a 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5794,6 +5895,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5794,6 +5895,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -4436,7 +4416,7 @@ index ca149e79195..ad4377e140a 100755
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
-+
+ 
 +int
 +main ()
 +{
@@ -4466,7 +4446,7 @@ index ca149e79195..ad4377e140a 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
- 
++
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
  
@@ -4529,7 +4509,7 @@ index ca149e79195..ad4377e140a 100755
    const char *name;
    void       *address;
  }
-@@ -6379,8 +6706,8 @@ static const void *lt_preloaded_setup() {
+@@ -6379,8 +6706,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4551,7 +4531,7 @@ index ca149e79195..ad4377e140a 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6428,6 +6755,19 @@ else
+@@ -6428,6 +6755,15 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4564,21 +4544,16 @@ index ca149e79195..ad4377e140a 100755
 +
 +
 +
-+
-+
-+
-+
  
  
  
-@@ -6444,6 +6784,42 @@ fi
+@@ -6449,6 +6785,46 @@ fi
  
  
  
 +
 +
 +
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4611,9 +4586,14 @@ index ca149e79195..ad4377e140a 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -6655,6 +7031,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -4756,7 +4736,7 @@ index ca149e79195..ad4377e140a 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7969,6 +8462,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7969,6 +8462,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4769,7 +4749,7 @@ index ca149e79195..ad4377e140a 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8031,7 +8530,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8031,7 +8530,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4930,7 +4910,7 @@ index ca149e79195..ad4377e140a 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8860,7 +9382,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8860,7 +9382,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4988,7 +4968,7 @@ index ca149e79195..ad4377e140a 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8933,20 +9468,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8933,20 +9468,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -5066,7 +5046,7 @@ index ca149e79195..ad4377e140a 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9007,7 +9585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9007,7 +9585,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -5075,7 +5055,7 @@ index ca149e79195..ad4377e140a 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9015,7 +9593,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9015,7 +9593,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -5084,7 +5064,7 @@ index ca149e79195..ad4377e140a 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9031,7 +9609,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9031,7 +9609,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -5093,7 +5073,7 @@ index ca149e79195..ad4377e140a 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9055,10 +9633,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9055,10 +9633,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5151,7 +5131,7 @@ index ca149e79195..ad4377e140a 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9238,7 +9829,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9238,7 +9829,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5160,7 +5140,7 @@ index ca149e79195..ad4377e140a 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9257,9 +9848,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9257,9 +9848,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5301,7 +5281,7 @@ index ca149e79195..ad4377e140a 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -16771,13 +17421,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16771,13 +17421,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5322,7 +5302,7 @@ index ca149e79195..ad4377e140a 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16792,14 +17449,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16792,14 +17449,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5341,7 +5321,7 @@ index ca149e79195..ad4377e140a 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16832,12 +17492,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16832,12 +17492,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5455,7 +5435,7 @@ index ca149e79195..ad4377e140a 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17877,6 +18568,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17877,6 +18568,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5716,15 +5696,9 @@ index ca149e79195..ad4377e140a 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -5882,14 +5856,15 @@ index ca149e79195..ad4377e140a 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/gprof/Makefile.in b/gprof/Makefile.in
-index 719e1810bcd..037f9cd5834 100644
 --- a/gprof/Makefile.in
 +++ b/gprof/Makefile.in
 @@ -327,6 +327,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -5916,8 +5891,6 @@ index 719e1810bcd..037f9cd5834 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
-diff --git a/gprof/configure b/gprof/configure
-index e40de173a1e..82cd6d600b8 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -671,8 +671,11 @@ OTOOL
@@ -5969,7 +5942,7 @@ index e40de173a1e..82cd6d600b8 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5264,8 +5270,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5264,8 +5270,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -6105,7 +6078,7 @@ index e40de173a1e..82cd6d600b8 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5672,6 +5773,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5672,6 +5773,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -6324,7 +6297,7 @@ index e40de173a1e..82cd6d600b8 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5773,25 +6035,19 @@ ac_tool_warned=yes ;;
+@@ -5773,29 +6035,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6356,13 +6329,17 @@ index e40de173a1e..82cd6d600b8 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -5803,6 +6059,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
++
++
++
++
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -6371,11 +6348,11 @@ index e40de173a1e..82cd6d600b8 100755
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
-+
+ 
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -6404,26 +6381,19 @@ index e40de173a1e..82cd6d600b8 100755
 +
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
+ 
+ 
+ 
 @@ -6142,8 +6456,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -6471,7 +6441,7 @@ index e40de173a1e..82cd6d600b8 100755
    const char *name;
    void       *address;
  }
-@@ -6257,8 +6584,8 @@ static const void *lt_preloaded_setup() {
+@@ -6257,8 +6584,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6493,7 +6463,7 @@ index e40de173a1e..82cd6d600b8 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6306,6 +6633,18 @@ else
+@@ -6306,6 +6633,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6507,18 +6477,13 @@ index e40de173a1e..82cd6d600b8 100755
 +
 +
 +
-+
-+
  
  
  
-@@ -6322,6 +6661,43 @@ fi
+@@ -6327,6 +6664,45 @@ fi
  
  
  
-+
-+
-+
 +
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
@@ -6553,9 +6518,14 @@ index e40de173a1e..82cd6d600b8 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -6533,6 +6909,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -6698,7 +6668,7 @@ index e40de173a1e..82cd6d600b8 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7847,6 +8340,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7847,6 +8340,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6711,7 +6681,7 @@ index e40de173a1e..82cd6d600b8 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7909,7 +8408,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7909,7 +8408,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6872,7 +6842,7 @@ index e40de173a1e..82cd6d600b8 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8738,7 +9260,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8738,7 +9260,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6930,7 +6900,7 @@ index e40de173a1e..82cd6d600b8 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8811,20 +9346,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8811,20 +9346,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -7008,7 +6978,7 @@ index e40de173a1e..82cd6d600b8 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8885,7 +9463,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8885,7 +9463,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -7017,7 +6987,7 @@ index e40de173a1e..82cd6d600b8 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8893,7 +9471,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8893,7 +9471,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -7026,7 +6996,7 @@ index e40de173a1e..82cd6d600b8 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8909,7 +9487,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8909,7 +9487,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -7035,7 +7005,7 @@ index e40de173a1e..82cd6d600b8 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8933,10 +9511,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8933,10 +9511,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -7093,7 +7063,7 @@ index e40de173a1e..82cd6d600b8 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9116,7 +9707,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9116,7 +9707,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -7102,7 +7072,7 @@ index e40de173a1e..82cd6d600b8 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9135,9 +9726,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9135,9 +9726,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7243,7 +7213,7 @@ index e40de173a1e..82cd6d600b8 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14478,13 +15128,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14478,13 +15128,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7264,7 +7234,7 @@ index e40de173a1e..82cd6d600b8 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14499,14 +15156,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14499,14 +15156,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7283,7 +7253,7 @@ index e40de173a1e..82cd6d600b8 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14539,12 +15199,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14539,12 +15199,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7397,7 +7367,7 @@ index e40de173a1e..82cd6d600b8 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15578,6 +16269,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15578,6 +16269,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7658,15 +7628,9 @@ index e40de173a1e..82cd6d600b8 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -7824,14 +7788,15 @@ index e40de173a1e..82cd6d600b8 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
-index f770dac57c5..dbdfd96c5ff 100644
 --- a/gprofng/Makefile.in
 +++ b/gprofng/Makefile.in
 @@ -254,6 +254,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -7850,8 +7815,6 @@ index f770dac57c5..dbdfd96c5ff 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/gprofng/configure b/gprofng/configure
-index 3fd5b61c9a7..c2178fc289f 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
 @@ -672,6 +672,8 @@ OTOOL
@@ -7900,7 +7863,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6887,8 +6892,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6887,8 +6892,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -8036,7 +7999,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -8255,7 +8218,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7396,25 +7657,19 @@ ac_tool_warned=yes ;;
+@@ -7396,29 +7657,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8287,13 +8250,17 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -7426,6 +7681,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
++
++
++
++
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -8306,7 +8273,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -8332,29 +8299,22 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
-+
+ 
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
+ 
+ 
+ 
 @@ -7765,8 +8078,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -8402,7 +8362,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
    const char *name;
    void       *address;
  }
-@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {
+@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8424,7 +8384,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7929,6 +8255,14 @@ else
+@@ -7929,6 +8255,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8436,18 +8396,15 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +fi
 +
 +
++
++
  
  
  
-@@ -7947,6 +8281,47 @@ fi
+@@ -7950,6 +8286,45 @@ fi
  
  
  
-+
-+
-+
-+
-+
 +
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
@@ -8484,9 +8441,12 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
- 
- 
- 
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -8156,6 +8531,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -8646,7 +8606,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9441,6 +9943,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9441,6 +9943,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8659,7 +8619,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9503,7 +10011,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9503,7 +10011,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8820,7 +8780,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10332,7 +10863,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10332,7 +10863,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8878,7 +8838,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10405,20 +10949,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10405,20 +10949,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -8956,7 +8916,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10479,7 +11066,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10479,7 +11066,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8965,7 +8925,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10487,7 +11074,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10487,7 +11074,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8974,7 +8934,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10503,7 +11090,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10503,7 +11090,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8983,7 +8943,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10527,10 +11114,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10527,10 +11114,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -9041,7 +9001,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10710,7 +11310,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10710,7 +11310,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -9050,7 +9010,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10729,9 +11329,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10729,9 +11329,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -9207,7 +9167,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -13093,7 +13754,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -13093,7 +13754,13 @@ $as_echo_n "checking whether the $compil
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9265,7 +9225,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -13134,7 +13808,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13134,7 +13808,13 @@ if test -z "$aix_libpath"; then aix_libp
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9323,7 +9283,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13205,29 +13892,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13205,29 +13892,75 @@ if test -z "$aix_libpath"; then aix_libp
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9422,7 +9382,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        darwin* | rhapsody*)
  
  
-@@ -13333,7 +14066,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13333,7 +14066,7 @@ if test -z "$aix_libpath"; then aix_libp
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9431,7 +9391,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13404,10 +14137,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13404,10 +14137,10 @@ if test -z "$aix_libpath"; then aix_libp
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9444,7 +9404,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	            ;;
  	        esac
  	      fi
-@@ -13448,9 +14181,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13448,9 +14181,9 @@ if test -z "$aix_libpath"; then aix_libp
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9456,7 +9416,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13728,7 +14461,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13728,7 +14461,7 @@ if test -z "$aix_libpath"; then aix_libp
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9465,7 +9425,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  		  ;;
  	      esac
  
-@@ -13774,7 +14507,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13774,7 +14507,7 @@ if test -z "$aix_libpath"; then aix_libp
  
        solaris*)
          case $cc_basename in
@@ -9474,7 +9434,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13815,9 +14548,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13815,9 +14548,9 @@ if test -z "$aix_libpath"; then aix_libp
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9500,7 +9460,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13966,7 +14706,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13966,7 +14706,7 @@ if { { eval echo "\"\$as_me\":${as_linen
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9509,7 +9469,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13975,13 +14715,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13975,13 +14715,22 @@ if { { eval echo "\"\$as_me\":${as_linen
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9536,7 +9496,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -14001,8 +14750,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -14001,8 +14750,10 @@ if { { eval echo "\"\$as_me\":${as_linen
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9573,7 +9533,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14244,6 +14994,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14244,6 +14994,11 @@ $as_echo_n "checking for $compiler optio
  	  ;;
  	esac
  	;;
@@ -9585,7 +9545,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14396,7 +15151,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14396,7 +15151,7 @@ $as_echo_n "checking for $compiler optio
  	;;
        solaris*)
  	case $cc_basename in
@@ -9632,7 +9592,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14713,15 +15478,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14713,15 +15478,20 @@ $as_echo_n "checking whether the $compil
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9751,7 +9711,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18025,13 +18855,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18025,13 +18855,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9772,7 +9732,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18046,14 +18883,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18046,14 +18883,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9791,7 +9751,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18086,12 +18926,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18086,12 +18926,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9805,7 +9765,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18130,8 +18970,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18130,8 +18970,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9815,7 +9775,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18158,12 +18998,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18158,12 +18998,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9957,7 +9917,7 @@ index 3fd5b61c9a7..c2178fc289f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19218,6 +20089,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19218,6 +20089,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -10218,15 +10178,9 @@ index 3fd5b61c9a7..c2178fc289f 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -10384,8 +10338,11 @@ index 3fd5b61c9a7..c2178fc289f 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
@@ -10426,8 +10383,6 @@ index 3fd5b61c9a7..c2178fc289f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
-index 162ae4b19c1..9e6017aa0ff 100644
 --- a/gprofng/doc/Makefile.in
 +++ b/gprofng/doc/Makefile.in
 @@ -238,6 +238,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10446,8 +10401,6 @@ index 162ae4b19c1..9e6017aa0ff 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-html/Makefile.in
-index 2b8580f40f9..a01e34702d7 100644
 --- a/gprofng/gp-display-html/Makefile.in
 +++ b/gprofng/gp-display-html/Makefile.in
 @@ -198,6 +198,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10466,8 +10419,6 @@ index 2b8580f40f9..a01e34702d7 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/gprofng/libcollector/Makefile.in b/gprofng/libcollector/Makefile.in
-index 4448745f17e..ff20f8f0715 100644
 --- a/gprofng/libcollector/Makefile.in
 +++ b/gprofng/libcollector/Makefile.in
 @@ -316,6 +316,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10486,8 +10437,6 @@ index 4448745f17e..ff20f8f0715 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index afdf3966baf..877afeb7c01 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -640,6 +640,8 @@ OTOOL
@@ -10536,7 +10485,7 @@ index afdf3966baf..877afeb7c01 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6702,8 +6707,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6702,8 +6707,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -10672,7 +10621,7 @@ index afdf3966baf..877afeb7c01 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7110,6 +7210,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7110,6 +7210,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -10891,7 +10840,7 @@ index afdf3966baf..877afeb7c01 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7211,25 +7472,19 @@ ac_tool_warned=yes ;;
+@@ -7211,29 +7472,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -10923,13 +10872,17 @@ index afdf3966baf..877afeb7c01 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -7241,6 +7496,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
++
++
++
++
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -10942,7 +10895,7 @@ index afdf3966baf..877afeb7c01 100755
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -10968,29 +10921,22 @@ index afdf3966baf..877afeb7c01 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
-+
+ 
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
+ 
+ 
+ 
 @@ -7580,8 +7893,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -11038,7 +10984,7 @@ index afdf3966baf..877afeb7c01 100755
    const char *name;
    void       *address;
  }
-@@ -7695,8 +8021,8 @@ static const void *lt_preloaded_setup() {
+@@ -7695,8 +8021,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -11060,7 +11006,7 @@ index afdf3966baf..877afeb7c01 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7744,6 +8070,13 @@ else
+@@ -7744,6 +8070,25 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -11071,13 +11017,6 @@ index afdf3966baf..877afeb7c01 100755
 +  nm_file_list_spec='@'
 +fi
 +
- 
- 
- 
-@@ -7763,6 +8096,48 @@ fi
- 
- 
- 
 +
 +
 +
@@ -11085,9 +11024,21 @@ index afdf3966baf..877afeb7c01 100755
 +
 +
 +
++
++
++
++
++
+ 
+ 
+ 
+@@ -7758,8 +8103,38 @@ fi
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
-+
+ 
 +# Check whether --with-libtool-sysroot was given.
 +if test "${with_libtool_sysroot+set}" = set; then :
 +  withval=$with_libtool_sysroot;
@@ -11114,15 +11065,12 @@ index afdf3966baf..877afeb7c01 100755
 +   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
-+
+ 
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
  
  
- # Check whether --enable-libtool-lock was given.
+ 
 @@ -7971,6 +8346,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -11282,7 +11230,7 @@ index afdf3966baf..877afeb7c01 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9286,6 +9788,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9286,6 +9788,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11295,7 +11243,7 @@ index afdf3966baf..877afeb7c01 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9348,7 +9856,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9348,7 +9856,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11456,7 +11404,7 @@ index afdf3966baf..877afeb7c01 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10177,7 +10708,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10177,7 +10708,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11514,7 +11462,7 @@ index afdf3966baf..877afeb7c01 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10250,20 +10794,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10250,20 +10794,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -11592,7 +11540,7 @@ index afdf3966baf..877afeb7c01 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10324,7 +10911,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10324,7 +10911,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -11601,7 +11549,7 @@ index afdf3966baf..877afeb7c01 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10332,7 +10919,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10332,7 +10919,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -11610,7 +11558,7 @@ index afdf3966baf..877afeb7c01 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10348,7 +10935,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10348,7 +10935,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -11619,7 +11567,7 @@ index afdf3966baf..877afeb7c01 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10372,10 +10959,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10372,10 +10959,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -11677,7 +11625,7 @@ index afdf3966baf..877afeb7c01 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10555,7 +11155,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10555,7 +11155,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -11686,7 +11634,7 @@ index afdf3966baf..877afeb7c01 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10574,9 +11174,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10574,9 +11174,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -11843,7 +11791,7 @@ index afdf3966baf..877afeb7c01 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12938,7 +13599,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12938,7 +13599,13 @@ $as_echo_n "checking whether the $compil
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11901,7 +11849,7 @@ index afdf3966baf..877afeb7c01 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12979,7 +13653,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12979,7 +13653,13 @@ if test -z "$aix_libpath"; then aix_libp
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11959,7 +11907,7 @@ index afdf3966baf..877afeb7c01 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13050,29 +13737,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13050,29 +13737,75 @@ if test -z "$aix_libpath"; then aix_libp
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -12058,7 +12006,7 @@ index afdf3966baf..877afeb7c01 100755
        darwin* | rhapsody*)
  
  
-@@ -13178,7 +13911,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13178,7 +13911,7 @@ if test -z "$aix_libpath"; then aix_libp
              ;;
            *)
              if test "$GXX" = yes; then
@@ -12067,7 +12015,7 @@ index afdf3966baf..877afeb7c01 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13249,10 +13982,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13249,10 +13982,10 @@ if test -z "$aix_libpath"; then aix_libp
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -12080,7 +12028,7 @@ index afdf3966baf..877afeb7c01 100755
  	            ;;
  	        esac
  	      fi
-@@ -13293,9 +14026,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13293,9 +14026,9 @@ if test -z "$aix_libpath"; then aix_libp
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -12092,7 +12040,7 @@ index afdf3966baf..877afeb7c01 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13573,7 +14306,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13573,7 +14306,7 @@ if test -z "$aix_libpath"; then aix_libp
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -12101,7 +12049,7 @@ index afdf3966baf..877afeb7c01 100755
  		  ;;
  	      esac
  
-@@ -13619,7 +14352,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13619,7 +14352,7 @@ if test -z "$aix_libpath"; then aix_libp
  
        solaris*)
          case $cc_basename in
@@ -12110,7 +12058,7 @@ index afdf3966baf..877afeb7c01 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13660,9 +14393,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13660,9 +14393,9 @@ if test -z "$aix_libpath"; then aix_libp
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -12136,7 +12084,7 @@ index afdf3966baf..877afeb7c01 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13811,7 +14551,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13811,7 +14551,7 @@ if { { eval echo "\"\$as_me\":${as_linen
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -12145,7 +12093,7 @@ index afdf3966baf..877afeb7c01 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13820,13 +14560,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13820,13 +14560,22 @@ if { { eval echo "\"\$as_me\":${as_linen
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -12172,7 +12120,7 @@ index afdf3966baf..877afeb7c01 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13846,8 +14595,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13846,8 +14595,10 @@ if { { eval echo "\"\$as_me\":${as_linen
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -12209,7 +12157,7 @@ index afdf3966baf..877afeb7c01 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14089,6 +14839,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14089,6 +14839,11 @@ $as_echo_n "checking for $compiler optio
  	  ;;
  	esac
  	;;
@@ -12221,7 +12169,7 @@ index afdf3966baf..877afeb7c01 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14241,7 +14996,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14241,7 +14996,7 @@ $as_echo_n "checking for $compiler optio
  	;;
        solaris*)
  	case $cc_basename in
@@ -12268,7 +12216,7 @@ index afdf3966baf..877afeb7c01 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14558,15 +15323,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14558,15 +15323,20 @@ $as_echo_n "checking whether the $compil
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -12387,7 +12335,7 @@ index afdf3966baf..877afeb7c01 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -16359,13 +17189,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16359,13 +17189,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -12408,7 +12356,7 @@ index afdf3966baf..877afeb7c01 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16380,14 +17217,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16380,14 +17217,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -12427,7 +12375,7 @@ index afdf3966baf..877afeb7c01 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16420,12 +17260,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16420,12 +17260,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -12441,7 +12389,7 @@ index afdf3966baf..877afeb7c01 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16464,8 +17304,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -16464,8 +17304,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -12451,7 +12399,7 @@ index afdf3966baf..877afeb7c01 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -16492,12 +17332,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -16492,12 +17332,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -12593,7 +12541,7 @@ index afdf3966baf..877afeb7c01 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17549,6 +18420,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17549,6 +18420,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -12854,15 +12802,9 @@ index afdf3966baf..877afeb7c01 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -13020,8 +12962,11 @@ index afdf3966baf..877afeb7c01 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
@@ -13062,8 +13007,6 @@ index afdf3966baf..877afeb7c01 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
-index 0cdd4443670..07fdb4cfc6f 100644
 --- a/gprofng/src/Makefile.in
 +++ b/gprofng/src/Makefile.in
 @@ -322,6 +322,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -13082,8 +13025,6 @@ index 0cdd4443670..07fdb4cfc6f 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/ld/Makefile.in b/ld/Makefile.in
-index c3d08edbef1..7ee6acd3e03 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -390,6 +390,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -13110,8 +13051,6 @@ index c3d08edbef1..7ee6acd3e03 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
-diff --git a/ld/configure b/ld/configure
-index ca3d58ff618..3cbf90b055f 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -703,8 +703,11 @@ OTOOL
@@ -13134,7 +13073,7 @@ index ca3d58ff618..3cbf90b055f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1582,6 +1586,8 @@ Optional Packages:
+@@ -1587,6 +1591,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -13143,7 +13082,7 @@ index ca3d58ff618..3cbf90b055f 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
-@@ -5391,8 +5397,8 @@ esac
+@@ -5396,8 +5402,8 @@ esac
  
  
  
@@ -13154,7 +13093,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  
  
-@@ -5432,7 +5438,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5437,7 +5443,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -13163,7 +13102,7 @@ index ca3d58ff618..3cbf90b055f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6125,8 +6131,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -13174,7 +13113,7 @@ index ca3d58ff618..3cbf90b055f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6175,6 +6181,80 @@ esac
+@@ -6180,6 +6186,80 @@ esac
  
  
  
@@ -13255,7 +13194,7 @@ index ca3d58ff618..3cbf90b055f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6191,6 +6271,11 @@ case $reload_flag in
+@@ -6196,6 +6276,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -13267,7 +13206,7 @@ index ca3d58ff618..3cbf90b055f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6359,7 +6444,8 @@ mingw* | pw32*)
+@@ -6364,7 +6449,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -13277,7 +13216,7 @@ index ca3d58ff618..3cbf90b055f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6518,6 +6604,21 @@ esac
+@@ -6523,6 +6609,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -13299,7 +13238,7 @@ index ca3d58ff618..3cbf90b055f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6533,6 +6634,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6538,6 +6639,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -13457,7 +13396,7 @@ index ca3d58ff618..3cbf90b055f 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6547,8 +6799,10 @@ for plugin in $plugin_names; do
+@@ -6552,8 +6804,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -13470,7 +13409,7 @@ index ca3d58ff618..3cbf90b055f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6564,7 +6818,7 @@ do
+@@ -6569,7 +6823,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13479,7 +13418,7 @@ index ca3d58ff618..3cbf90b055f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6584,11 +6838,15 @@ $as_echo "no" >&6; }
+@@ -6589,11 +6843,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -13498,7 +13437,7 @@ index ca3d58ff618..3cbf90b055f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6604,7 +6862,7 @@ do
+@@ -6609,7 +6867,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13507,7 +13446,7 @@ index ca3d58ff618..3cbf90b055f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6623,6 +6881,10 @@ else
+@@ -6628,6 +6886,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -13518,7 +13457,7 @@ index ca3d58ff618..3cbf90b055f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6634,29 +6896,81 @@ ac_tool_warned=yes ;;
+@@ -6639,25 +6901,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -13550,16 +13489,12 @@ index ca3d58ff618..3cbf90b055f 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
+ 
+ 
+ 
+@@ -6669,6 +6925,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
@@ -13573,7 +13508,7 @@ index ca3d58ff618..3cbf90b055f 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -13602,20 +13537,27 @@ index ca3d58ff618..3cbf90b055f 100755
 +
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
++
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
- 
++
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -7003,8 +7317,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -7008,8 +7322,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -13626,7 +13568,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7040,6 +7354,7 @@ for ac_symprfx in "" "_"; do
+@@ -7045,6 +7359,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -13634,7 +13576,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7081,6 +7396,18 @@ _LT_EOF
+@@ -7086,6 +7401,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -13653,7 +13595,7 @@ index ca3d58ff618..3cbf90b055f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7092,7 +7419,7 @@ _LT_EOF
+@@ -7097,7 +7424,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -13662,7 +13604,7 @@ index ca3d58ff618..3cbf90b055f 100755
    const char *name;
    void       *address;
  }
-@@ -7118,8 +7445,8 @@ static const void *lt_preloaded_setup() {
+@@ -7123,8 +7450,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -13673,7 +13615,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7129,8 +7456,8 @@ _LT_EOF
+@@ -7134,8 +7461,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -13684,7 +13626,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7167,6 +7494,27 @@ else
+@@ -7172,6 +7499,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -13702,31 +13644,24 @@ index ca3d58ff618..3cbf90b055f 100755
 +
 +
 +
-+
-+
-+
-+
-+
-+
-+
  
  
  
-@@ -7179,10 +7527,38 @@ fi
+@@ -7191,6 +7532,41 @@ fi
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
- 
++
 +# Check whether --with-libtool-sysroot was given.
 +if test "${with_libtool_sysroot+set}" = set; then :
 +  withval=$with_libtool_sysroot;
 +else
 +  with_libtool_sysroot=no
 +fi
- 
- 
++
++
 +lt_sysroot=
 +case ${with_libtool_sysroot} in #(
 + yes)
@@ -13745,13 +13680,16 @@ index ca3d58ff618..3cbf90b055f 100755
 +   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
- 
++
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
  
  
- 
-@@ -7394,6 +7770,123 @@ esac
+ # Check whether --enable-libtool-lock was given.
+@@ -7399,6 +7775,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -13875,7 +13813,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7957,6 +8450,8 @@ _LT_EOF
+@@ -7962,6 +8455,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13884,7 +13822,7 @@ index ca3d58ff618..3cbf90b055f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8027,6 +8522,16 @@ done
+@@ -8032,6 +8527,16 @@ done
  
  
  
@@ -13901,7 +13839,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  
  # Set options
-@@ -8542,8 +9047,6 @@ fi
+@@ -8547,8 +9052,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13910,7 +13848,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8709,6 +9212,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8714,6 +9217,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13923,7 +13861,7 @@ index ca3d58ff618..3cbf90b055f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8771,7 +9280,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8776,7 +9285,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13932,7 +13870,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8828,13 +9337,17 @@ case $host_os in
+@@ -8833,13 +9342,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13956,7 +13894,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8895,6 +9408,11 @@ fi
+@@ -8900,6 +9413,11 @@ fi
  
  
  
@@ -13968,7 +13906,7 @@ index ca3d58ff618..3cbf90b055f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9245,7 +9763,8 @@ _LT_EOF
+@@ -9250,7 +9768,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -13978,7 +13916,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9344,12 +9863,12 @@ _LT_EOF
+@@ -9349,12 +9868,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -13993,7 +13931,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	  fi
  	  ;;
  	esac
-@@ -9363,8 +9882,8 @@ _LT_EOF
+@@ -9368,8 +9887,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -14004,7 +13942,7 @@ index ca3d58ff618..3cbf90b055f 100755
        fi
        ;;
  
-@@ -9382,8 +9901,8 @@ _LT_EOF
+@@ -9387,8 +9906,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14015,7 +13953,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9429,8 +9948,8 @@ _LT_EOF
+@@ -9434,8 +9953,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14026,7 +13964,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9560,7 +10079,13 @@ _LT_EOF
+@@ -9565,7 +10084,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -14041,7 +13979,7 @@ index ca3d58ff618..3cbf90b055f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9573,22 +10098,29 @@ main ()
+@@ -9578,22 +10103,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14084,7 +14022,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9600,7 +10132,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9605,7 +10137,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -14099,7 +14037,7 @@ index ca3d58ff618..3cbf90b055f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9613,22 +10151,29 @@ main ()
+@@ -9618,22 +10156,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14142,7 +14080,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9673,20 +10218,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9678,20 +10223,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -14220,7 +14158,7 @@ index ca3d58ff618..3cbf90b055f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9747,7 +10335,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9752,7 +10340,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14229,7 +14167,7 @@ index ca3d58ff618..3cbf90b055f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9755,7 +10343,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9760,7 +10348,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14238,7 +14176,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9771,7 +10359,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9776,7 +10364,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14247,7 +14185,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9795,10 +10383,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9800,10 +10388,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14260,7 +14198,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	  ;;
  	esac
        else
-@@ -9877,23 +10465,36 @@ fi
+@@ -9882,23 +10470,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14305,7 +14243,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9978,7 +10579,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9983,7 +10584,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14314,7 +14252,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9997,9 +10598,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10002,9 +10603,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14326,7 +14264,7 @@ index ca3d58ff618..3cbf90b055f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10575,8 +11176,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10580,8 +11181,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14338,7 +14276,7 @@ index ca3d58ff618..3cbf90b055f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10609,13 +11211,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10614,13 +11216,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14411,16 +14349,16 @@ index ca3d58ff618..3cbf90b055f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11517,7 +12177,7 @@ else
+@@ -11522,7 +12182,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11520 "configure"
+-#line 11525 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11561,10 +12221,10 @@ else
+@@ -11566,10 +12226,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14433,16 +14371,16 @@ index ca3d58ff618..3cbf90b055f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11623,7 +12283,7 @@ else
+@@ -11628,7 +12288,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11626 "configure"
+-#line 11631 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11667,10 +12327,10 @@ else
+@@ -11672,10 +12332,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14455,7 +14393,7 @@ index ca3d58ff618..3cbf90b055f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12062,6 +12722,7 @@ $RM -r conftest*
+@@ -12067,6 +12727,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -14463,7 +14401,7 @@ index ca3d58ff618..3cbf90b055f 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12079,6 +12740,7 @@ $RM -r conftest*
+@@ -12084,6 +12745,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -14471,7 +14409,7 @@ index ca3d58ff618..3cbf90b055f 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12361,7 +13023,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12366,7 +13028,13 @@ $as_echo_n "checking whether the $compil
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -14486,7 +14424,7 @@ index ca3d58ff618..3cbf90b055f 100755
  /* end confdefs.h.  */
  
  int
-@@ -12374,22 +13042,29 @@ main ()
+@@ -12379,22 +13047,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14529,7 +14467,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12402,7 +13077,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12407,7 +13082,13 @@ if test -z "$aix_libpath"; then aix_libp
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -14544,7 +14482,7 @@ index ca3d58ff618..3cbf90b055f 100755
  /* end confdefs.h.  */
  
  int
-@@ -12415,22 +13096,29 @@ main ()
+@@ -12420,22 +13101,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14587,7 +14525,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12473,29 +13161,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12478,29 +13166,75 @@ if test -z "$aix_libpath"; then aix_libp
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -14686,7 +14624,7 @@ index ca3d58ff618..3cbf90b055f 100755
        darwin* | rhapsody*)
  
  
-@@ -12601,7 +13335,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12606,7 +13340,7 @@ if test -z "$aix_libpath"; then aix_libp
              ;;
            *)
              if test "$GXX" = yes; then
@@ -14695,7 +14633,7 @@ index ca3d58ff618..3cbf90b055f 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12672,10 +13406,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12677,10 +13411,10 @@ if test -z "$aix_libpath"; then aix_libp
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -14708,7 +14646,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	            ;;
  	        esac
  	      fi
-@@ -12716,9 +13450,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12721,9 +13455,9 @@ if test -z "$aix_libpath"; then aix_libp
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -14720,7 +14658,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12996,7 +13730,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13001,7 +13735,7 @@ if test -z "$aix_libpath"; then aix_libp
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -14729,7 +14667,7 @@ index ca3d58ff618..3cbf90b055f 100755
  		  ;;
  	      esac
  
-@@ -13042,7 +13776,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13047,7 +13781,7 @@ if test -z "$aix_libpath"; then aix_libp
  
        solaris*)
          case $cc_basename in
@@ -14738,7 +14676,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13083,9 +13817,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13088,9 +13822,9 @@ if test -z "$aix_libpath"; then aix_libp
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -14750,7 +14688,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13221,6 +13955,13 @@ private:
+@@ -13226,6 +13960,13 @@ private:
  };
  _LT_EOF
  
@@ -14764,7 +14702,7 @@ index ca3d58ff618..3cbf90b055f 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13234,7 +13975,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13239,7 +13980,7 @@ if { { eval echo "\"\$as_me\":${as_linen
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -14773,7 +14711,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13243,13 +13984,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13248,13 +13989,22 @@ if { { eval echo "\"\$as_me\":${as_linen
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -14800,7 +14738,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13269,8 +14019,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13274,8 +14024,10 @@ if { { eval echo "\"\$as_me\":${as_linen
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -14811,7 +14749,7 @@ index ca3d58ff618..3cbf90b055f 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13306,6 +14058,7 @@ else
+@@ -13311,6 +14063,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -14819,7 +14757,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13341,7 +14094,7 @@ linux*)
+@@ -13346,7 +14099,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -14828,7 +14766,7 @@ index ca3d58ff618..3cbf90b055f 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13406,8 +14159,6 @@ fi
+@@ -13411,8 +14164,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -14837,7 +14775,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13512,6 +14263,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13517,6 +14268,11 @@ $as_echo_n "checking for $compiler optio
  	  ;;
  	esac
  	;;
@@ -14849,7 +14787,7 @@ index ca3d58ff618..3cbf90b055f 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13664,7 +14420,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13669,7 +14425,7 @@ $as_echo_n "checking for $compiler optio
  	;;
        solaris*)
  	case $cc_basename in
@@ -14858,7 +14796,7 @@ index ca3d58ff618..3cbf90b055f 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13729,10 +14485,17 @@ case $host_os in
+@@ -13734,10 +14490,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -14879,7 +14817,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13790,6 +14553,8 @@ fi
+@@ -13795,6 +14558,8 @@ fi
  
  
  
@@ -14888,7 +14826,7 @@ index ca3d58ff618..3cbf90b055f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -13967,6 +14732,7 @@ fi
+@@ -13972,6 +14737,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -14896,7 +14834,7 @@ index ca3d58ff618..3cbf90b055f 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -13981,15 +14747,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -13986,15 +14752,20 @@ $as_echo_n "checking whether the $compil
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -14922,7 +14860,7 @@ index ca3d58ff618..3cbf90b055f 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14252,8 +15023,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14257,8 +15028,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14934,7 +14872,7 @@ index ca3d58ff618..3cbf90b055f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14285,13 +15057,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14290,13 +15062,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -15007,7 +14945,7 @@ index ca3d58ff618..3cbf90b055f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14855,6 +15685,7 @@ fi
+@@ -14860,6 +15690,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -15015,7 +14953,7 @@ index ca3d58ff618..3cbf90b055f 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -19900,13 +20731,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -19949,13 +20780,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -15036,7 +14974,7 @@ index ca3d58ff618..3cbf90b055f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -19921,14 +20759,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -19970,14 +20808,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -15055,7 +14993,7 @@ index ca3d58ff618..3cbf90b055f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -19961,12 +20802,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -20010,12 +20851,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -15069,7 +15007,7 @@ index ca3d58ff618..3cbf90b055f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -20005,8 +20846,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -20054,8 +20895,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15079,7 +15017,7 @@ index ca3d58ff618..3cbf90b055f 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20033,12 +20874,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -20082,12 +20923,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15093,7 +15031,7 @@ index ca3d58ff618..3cbf90b055f 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20076,8 +20917,13 @@ reload_flag \
+@@ -20125,8 +20966,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -15107,7 +15045,7 @@ index ca3d58ff618..3cbf90b055f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -20087,12 +20933,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -20136,12 +20982,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -15123,7 +15061,7 @@ index ca3d58ff618..3cbf90b055f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -20108,7 +20956,6 @@ no_undefined_flag \
+@@ -20157,7 +21005,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -15131,7 +15069,7 @@ index ca3d58ff618..3cbf90b055f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -20130,8 +20977,8 @@ LD_CXX \
+@@ -20179,8 +21026,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -15141,7 +15079,7 @@ index ca3d58ff618..3cbf90b055f 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -20143,7 +20990,6 @@ no_undefined_flag_CXX \
+@@ -20192,7 +21039,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -15149,7 +15087,7 @@ index ca3d58ff618..3cbf90b055f 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -20177,6 +21023,7 @@ module_cmds \
+@@ -20226,6 +21072,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -15157,7 +15095,7 @@ index ca3d58ff618..3cbf90b055f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -20191,7 +21038,8 @@ archive_expsym_cmds_CXX \
+@@ -20240,7 +21087,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -15167,7 +15105,7 @@ index ca3d58ff618..3cbf90b055f 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -20956,7 +21804,8 @@ $as_echo X"$file" |
+@@ -21005,7 +21853,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -15177,7 +15115,7 @@ index ca3d58ff618..3cbf90b055f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -21059,19 +21908,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -21108,19 +21957,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -15221,7 +15159,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -21101,6 +21973,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -21150,6 +22022,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -15234,7 +15172,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -21110,6 +21988,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -21159,6 +22037,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -15244,7 +15182,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -21224,12 +22105,12 @@ with_gcc=$GCC
+@@ -21273,12 +22154,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -15260,7 +15198,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -21316,9 +22197,6 @@ inherit_rpath=$inherit_rpath
+@@ -21365,9 +22246,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -15270,7 +15208,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -21334,6 +22212,9 @@ include_expsyms=$lt_include_expsyms
+@@ -21383,6 +22261,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -15280,7 +15218,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -21380,210 +22261,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -21429,210 +22310,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -15482,15 +15420,9 @@ index ca3d58ff618..3cbf90b055f 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -15648,13 +15580,16 @@ index ca3d58ff618..3cbf90b055f 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -21611,12 +22451,12 @@ with_gcc=$GCC_CXX
+@@ -21660,12 +22500,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -15670,7 +15605,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -21703,9 +22543,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -21752,9 +22592,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -15680,7 +15615,7 @@ index ca3d58ff618..3cbf90b055f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -21721,6 +22558,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -21770,6 +22607,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -15690,8 +15625,6 @@ index ca3d58ff618..3cbf90b055f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-diff --git a/libbacktrace/Makefile.in b/libbacktrace/Makefile.in
-index 49852a21d37..d371dda2d34 100644
 --- a/libbacktrace/Makefile.in
 +++ b/libbacktrace/Makefile.in
 @@ -1,7 +1,7 @@
@@ -15742,7 +15675,7 @@ index 49852a21d37..d371dda2d34 100644
  @NATIVE_TRUE@am__EXEEXT_1 = allocfail$(EXEEXT)
  @HAVE_BUILDID_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2 = b2test$(EXEEXT)
  @HAVE_BUILDID_TRUE@@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_3 = b3test$(EXEEXT)
-@@ -253,6 +222,37 @@ am__EXEEXT_16 = $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
+@@ -253,6 +222,37 @@ am__EXEEXT_16 = $(am__EXEEXT_4) $(am__EX
  	$(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
  	$(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
  	$(am__EXEEXT_13) $(am__EXEEXT_14) $(am__EXEEXT_15)
@@ -15754,7 +15687,7 @@ index 49852a21d37..d371dda2d34 100644
 +AM_V_lt = $(am__v_lt_@AM_V@)
 +am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@)
 +am__v_lt_0 = --silent
-+am__v_lt_1 = 
++am__v_lt_1 =
 +am__objects_1 = atomic.lo dwarf.lo fileline.lo posix.lo print.lo \
 +	sort.lo state.lo
 +@NATIVE_TRUE@am_libbacktrace_alloc_la_OBJECTS = $(am__objects_1)
@@ -15818,7 +15751,7 @@ index 49852a21d37..d371dda2d34 100644
  RECHECK_LOGS = $(TEST_LOGS)
  TEST_SUITE_LOG = test-suite.log
  TEST_EXTENSIONS = @EXEEXT@ .test
-@@ -861,8 +859,11 @@ CLOCK_GETTIME_LINK = @CLOCK_GETTIME_LINK@
+@@ -861,8 +859,11 @@ CLOCK_GETTIME_LINK = @CLOCK_GETTIME_LINK
  COMM = @COMM@
  CPP = @CPP@
  CPPFLAGS = @CPPFLAGS@
@@ -15854,7 +15787,7 @@ index 49852a21d37..d371dda2d34 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__leading_dot = @am__leading_dot@
-@@ -1267,8 +1271,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
+@@ -1267,8 +1271,8 @@ Makefile: $(srcdir)/Makefile.in $(top_bu
  	    echo ' $(SHELL) ./config.status'; \
  	    $(SHELL) ./config.status;; \
  	  *) \
@@ -15865,7 +15798,7 @@ index 49852a21d37..d371dda2d34 100644
  	esac;
  $(top_srcdir)/../multilib.am $(am__empty):
  
-@@ -1300,6 +1304,15 @@ backtrace-supported.h: $(top_builddir)/config.status $(srcdir)/backtrace-support
+@@ -1300,6 +1304,15 @@ backtrace-supported.h: $(top_builddir)/c
  install-debuginfo-for-buildid.sh: $(top_builddir)/config.status $(srcdir)/install-debuginfo-for-buildid.sh.in
  	cd $(top_builddir) && $(SHELL) ./config.status $@
  
@@ -15881,7 +15814,7 @@ index 49852a21d37..d371dda2d34 100644
  clean-checkLTLIBRARIES:
  	-test -z "$(check_LTLIBRARIES)" || rm -f $(check_LTLIBRARIES)
  	@list='$(check_LTLIBRARIES)'; \
-@@ -1337,15 +1350,6 @@ libbacktrace_instrumented_alloc.la: $(libbacktrace_instrumented_alloc_la_OBJECTS
+@@ -1337,15 +1350,6 @@ libbacktrace_instrumented_alloc.la: $(li
  libbacktrace_noformat.la: $(libbacktrace_noformat_la_OBJECTS) $(libbacktrace_noformat_la_DEPENDENCIES) $(EXTRA_libbacktrace_noformat_la_DEPENDENCIES) 
  	$(AM_V_CCLD)$(LINK) $(am_libbacktrace_noformat_la_rpath) $(libbacktrace_noformat_la_OBJECTS) $(libbacktrace_noformat_la_LIBADD) $(LIBS)
  
@@ -15933,8 +15866,6 @@ index 49852a21d37..d371dda2d34 100644
  	  $(check_DATA)
  	$(MAKE) $(AM_MAKEFLAGS) check-TESTS
  check: check-am
-diff --git a/libbacktrace/aclocal.m4 b/libbacktrace/aclocal.m4
-index 528e6173930..d88a5ec84f2 100644
 --- a/libbacktrace/aclocal.m4
 +++ b/libbacktrace/aclocal.m4
 @@ -1,6 +1,6 @@
@@ -15946,7 +15877,7 @@ index 528e6173930..d88a5ec84f2 100644
  
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
-@@ -20,7 +20,7 @@ You have another version of autoconf.  It may work, but is not guaranteed to.
+@@ -20,7 +20,7 @@ You have another version of autoconf.  I
  If you have problems, you may need to regenerate the build system entirely.
  To do so, use the procedure documented by the package, typically 'autoreconf'.])])
  
@@ -15955,7 +15886,7 @@ index 528e6173930..d88a5ec84f2 100644
  #
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
-@@ -32,10 +32,10 @@ To do so, use the procedure documented by the package, typically 'autoreconf'.])
+@@ -32,10 +32,10 @@ To do so, use the procedure documented b
  # generated from the m4 files accompanying Automake X.Y.
  # (This private macro should not be called outside this file.)
  AC_DEFUN([AM_AUTOMAKE_VERSION],
@@ -16014,7 +15945,7 @@ index 528e6173930..d88a5ec84f2 100644
  dnl Autoconf wants to disallow AM_ names.  We explicitly allow
  dnl the ones we care about.
  m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
-@@ -207,7 +211,7 @@ m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
+@@ -207,7 +211,7 @@ m4_ifval([$3], [_AM_SET_OPTION([no-defin
  [_AM_SET_OPTIONS([$1])dnl
  dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
  m4_if(
@@ -16082,7 +16013,7 @@ index 528e6173930..d88a5ec84f2 100644
  #
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
-@@ -399,7 +417,7 @@ AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
+@@ -399,7 +417,7 @@ AC_MSG_CHECKING([whether to enable maint
  
  # Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-
  
@@ -16168,7 +16099,7 @@ index 528e6173930..d88a5ec84f2 100644
  #
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
-@@ -721,7 +734,7 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])
+@@ -721,7 +734,7 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_
  
  # Check how to create a tarball.                            -*- Autoconf -*-
  
@@ -16177,8 +16108,6 @@ index 528e6173930..d88a5ec84f2 100644
  #
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
-diff --git a/libbacktrace/configure b/libbacktrace/configure
-index 4ab612dc780..68f6b8566e9 100755
 --- a/libbacktrace/configure
 +++ b/libbacktrace/configure
 @@ -686,7 +686,10 @@ OTOOL
@@ -16242,7 +16171,7 @@ index 4ab612dc780..68f6b8566e9 100755
  fi
  # Use eval to expand $SHELL
  if eval "$MISSING --is-lightweight"; then
-@@ -4558,8 +4562,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
+@@ -4558,8 +4562,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}ma
  
  # For better backward compatibility.  To be removed once Automake 1.9.x
  # dies out for good.  For more background, see:
@@ -16253,7 +16182,7 @@ index 4ab612dc780..68f6b8566e9 100755
  mkdir_p='$(MKDIR_P)'
  
  # We need awk for the "check" target (and possibly the TAP driver).  The
-@@ -4578,6 +4582,20 @@ am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
+@@ -4578,6 +4582,20 @@ am__tar='$${TAR-tar} chof - "$$tardir"'
  
  
  
@@ -16303,7 +16232,7 @@ index 4ab612dc780..68f6b8566e9 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6187,8 +6205,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6187,8 +6205,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -16439,7 +16368,7 @@ index 4ab612dc780..68f6b8566e9 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6595,6 +6708,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6595,6 +6708,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -16658,7 +16587,7 @@ index 4ab612dc780..68f6b8566e9 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6696,31 +6970,83 @@ ac_tool_warned=yes ;;
+@@ -6696,25 +6970,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -16690,14 +16619,10 @@ index 4ab612dc780..68f6b8566e9 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
  
  
  
+@@ -6726,6 +6994,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -16754,9 +16679,14 @@ index 4ab612dc780..68f6b8566e9 100755
 +fi
 +
 +
- 
- 
- 
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
 @@ -7065,8 +7391,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -16804,7 +16734,7 @@ index 4ab612dc780..68f6b8566e9 100755
    const char *name;
    void       *address;
  }
-@@ -7180,8 +7519,8 @@ static const void *lt_preloaded_setup() {
+@@ -7180,8 +7519,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -16826,7 +16756,7 @@ index 4ab612dc780..68f6b8566e9 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7229,6 +7568,18 @@ else
+@@ -7229,6 +7568,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -16842,18 +16772,14 @@ index 4ab612dc780..68f6b8566e9 100755
 +
 +
 +
++
  
  
  
-@@ -7245,6 +7596,43 @@ fi
+@@ -7249,6 +7601,42 @@ fi
  
  
  
-+
-+
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -16886,59 +16812,17 @@ index 4ab612dc780..68f6b8566e9 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
++
  
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+@@ -7456,6 +7844,123 @@ esac
  
+ need_locks="$enable_libtool_lock"
  
-@@ -7411,50 +7799,167 @@ _ACEOF
- if ac_fn_c_try_link "$LINENO"; then :
-   lt_cv_cc_needs_belf=yes
- else
--  lt_cv_cc_needs_belf=no
-+  lt_cv_cc_needs_belf=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext \
-+    conftest$ac_exeext conftest.$ac_ext
-+     ac_ext=c
-+ac_cpp='$CPP $CPPFLAGS'
-+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-+ac_compiler_gnu=$ac_cv_c_compiler_gnu
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" >&5
-+$as_echo "$lt_cv_cc_needs_belf" >&6; }
-+  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
-+    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
-+    CFLAGS="$SAVE_CFLAGS"
-+  fi
-+  ;;
-+sparc*-*solaris*)
-+  # Find out which ABI we are using.
-+  echo 'int i;' > conftest.$ac_ext
-+  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
-+  (eval $ac_compile) 2>&5
-+  ac_status=$?
-+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-+  test $ac_status = 0; }; then
-+    case `/usr/bin/file conftest.o` in
-+    *64-bit*)
-+      case $lt_cv_prog_gnu_ld in
-+      yes*) LD="${LD-ld} -m elf64_sparc" ;;
-+      *)
-+	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
-+	  LD="${LD-ld} -64"
-+	fi
-+	;;
-+      esac
-+      ;;
-+    esac
-+  fi
-+  rm -rf conftest*
-+  ;;
-+esac
-+
-+need_locks="$enable_libtool_lock"
-+
 +if test -n "$ac_tool_prefix"; then
 +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
@@ -17014,21 +16898,8 @@ index 4ab612dc780..68f6b8566e9 100755
 +else
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
 +$as_echo "no" >&6; }
- fi
--rm -f core conftest.err conftest.$ac_objext \
--    conftest$ac_exeext conftest.$ac_ext
--     ac_ext=c
--ac_cpp='$CPP $CPPFLAGS'
--ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
--ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
--ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
--fi
--{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" >&5
--$as_echo "$lt_cv_cc_needs_belf" >&6; }
--  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
--    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
--    CFLAGS="$SAVE_CFLAGS"
++fi
++
 +  if test "x$ac_ct_MANIFEST_TOOL" = x; then
 +    MANIFEST_TOOL=":"
 +  else
@@ -17039,28 +16910,7 @@ index 4ab612dc780..68f6b8566e9 100755
 +ac_tool_warned=yes ;;
 +esac
 +    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
-   fi
--  ;;
--sparc*-*solaris*)
--  # Find out which ABI we are using.
--  echo 'int i;' > conftest.$ac_ext
--  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
--  (eval $ac_compile) 2>&5
--  ac_status=$?
--  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
--  test $ac_status = 0; }; then
--    case `/usr/bin/file conftest.o` in
--    *64-bit*)
--      case $lt_cv_prog_gnu_ld in
--      yes*) LD="${LD-ld} -m elf64_sparc" ;;
--      *)
--	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
--	  LD="${LD-ld} -64"
--	fi
--	;;
--      esac
--      ;;
--    esac
++  fi
 +else
 +  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
 +fi
@@ -17077,10 +16927,7 @@ index 4ab612dc780..68f6b8566e9 100755
 +  cat conftest.err >&5
 +  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
 +    lt_cv_path_mainfest_tool=yes
-   fi
--  rm -rf conftest*
--  ;;
--esac
++  fi
 +  rm -f conftest*
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
@@ -17091,11 +16938,11 @@ index 4ab612dc780..68f6b8566e9 100755
 +
 +
 +
- 
--need_locks="$enable_libtool_lock"
- 
++
++
  
    case $host_os in
+     rhapsody* | darwin*)
 @@ -8019,6 +8524,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
@@ -17114,7 +16961,7 @@ index 4ab612dc780..68f6b8566e9 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8770,6 +9275,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8770,6 +9275,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -17127,7 +16974,7 @@ index 4ab612dc780..68f6b8566e9 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8832,7 +9343,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8832,7 +9343,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -17288,7 +17135,7 @@ index 4ab612dc780..68f6b8566e9 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9661,7 +10195,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9661,7 +10195,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -17346,7 +17193,7 @@ index 4ab612dc780..68f6b8566e9 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9734,20 +10281,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9734,20 +10281,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -17424,7 +17271,7 @@ index 4ab612dc780..68f6b8566e9 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9808,7 +10398,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9808,7 +10398,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -17433,7 +17280,7 @@ index 4ab612dc780..68f6b8566e9 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9816,7 +10406,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9816,7 +10406,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -17442,7 +17289,7 @@ index 4ab612dc780..68f6b8566e9 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9832,7 +10422,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9832,7 +10422,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -17451,7 +17298,7 @@ index 4ab612dc780..68f6b8566e9 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9856,10 +10446,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9856,10 +10446,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -17509,7 +17356,7 @@ index 4ab612dc780..68f6b8566e9 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10039,7 +10642,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10039,7 +10642,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -17518,7 +17365,7 @@ index 4ab612dc780..68f6b8566e9 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10058,9 +10661,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10058,9 +10661,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -17659,7 +17506,7 @@ index 4ab612dc780..68f6b8566e9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15191,13 +15853,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15191,13 +15853,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -17680,7 +17527,7 @@ index 4ab612dc780..68f6b8566e9 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15212,14 +15881,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15212,14 +15881,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -17699,7 +17546,7 @@ index 4ab612dc780..68f6b8566e9 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15252,12 +15924,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15252,12 +15924,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -17813,7 +17660,7 @@ index 4ab612dc780..68f6b8566e9 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16223,6 +16926,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16223,6 +16926,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18074,15 +17921,9 @@ index 4ab612dc780..68f6b8566e9 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -18240,14 +18081,15 @@ index 4ab612dc780..68f6b8566e9 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/libctf/Makefile.in b/libctf/Makefile.in
-index 5d9587766dc..146b7a71685 100644
 --- a/libctf/Makefile.in
 +++ b/libctf/Makefile.in
 @@ -442,6 +442,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -18266,8 +18108,6 @@ index 5d9587766dc..146b7a71685 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-diff --git a/libctf/configure b/libctf/configure
-index 7466d56a18b..0325e438a47 100755
 --- a/libctf/configure
 +++ b/libctf/configure
 @@ -669,6 +669,8 @@ OTOOL
@@ -18316,7 +18156,7 @@ index 7466d56a18b..0325e438a47 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -8235,8 +8240,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -8235,8 +8240,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -18452,7 +18292,7 @@ index 7466d56a18b..0325e438a47 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -8643,6 +8743,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -8643,6 +8743,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -18818,7 +18658,7 @@ index 7466d56a18b..0325e438a47 100755
    const char *name;
    void       *address;
  }
-@@ -9228,8 +9554,8 @@ static const void *lt_preloaded_setup() {
+@@ -9228,8 +9554,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -18840,7 +18680,7 @@ index 7466d56a18b..0325e438a47 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -9277,6 +9603,17 @@ else
+@@ -9277,6 +9603,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -18855,19 +18695,16 @@ index 7466d56a18b..0325e438a47 100755
 +
 +
 +
++
++
++
  
  
  
-@@ -9293,6 +9630,44 @@ fi
+@@ -9296,6 +9636,41 @@ fi
  
  
  
-+
-+
-+
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -18900,9 +18737,12 @@ index 7466d56a18b..0325e438a47 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
  
  
- 
+ # Check whether --enable-libtool-lock was given.
 @@ -9504,6 +9879,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -19045,7 +18885,7 @@ index 7466d56a18b..0325e438a47 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -10788,6 +11280,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -10788,6 +11280,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -19058,7 +18898,7 @@ index 7466d56a18b..0325e438a47 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -10850,7 +11348,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -10850,7 +11348,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -19219,7 +19059,7 @@ index 7466d56a18b..0325e438a47 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -11679,7 +12200,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11679,7 +12200,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -19277,7 +19117,7 @@ index 7466d56a18b..0325e438a47 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -11752,20 +12286,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11752,20 +12286,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -19355,7 +19195,7 @@ index 7466d56a18b..0325e438a47 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -11826,7 +12403,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11826,7 +12403,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -19364,7 +19204,7 @@ index 7466d56a18b..0325e438a47 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -11834,7 +12411,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11834,7 +12411,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -19373,7 +19213,7 @@ index 7466d56a18b..0325e438a47 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -11850,7 +12427,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11850,7 +12427,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -19382,7 +19222,7 @@ index 7466d56a18b..0325e438a47 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -11874,10 +12451,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11874,10 +12451,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -19440,7 +19280,7 @@ index 7466d56a18b..0325e438a47 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -12057,7 +12647,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -12057,7 +12647,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -19449,7 +19289,7 @@ index 7466d56a18b..0325e438a47 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -12076,9 +12666,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -12076,9 +12666,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -19590,7 +19430,7 @@ index 7466d56a18b..0325e438a47 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17813,13 +18462,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17821,13 +18470,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -19611,7 +19451,7 @@ index 7466d56a18b..0325e438a47 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17834,14 +18490,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17842,14 +18498,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -19630,7 +19470,7 @@ index 7466d56a18b..0325e438a47 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17874,12 +18533,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17882,12 +18541,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -19644,7 +19484,7 @@ index 7466d56a18b..0325e438a47 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17934,8 +18593,13 @@ reload_flag \
+@@ -17942,8 +18601,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -19658,7 +19498,7 @@ index 7466d56a18b..0325e438a47 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17945,12 +18609,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17953,12 +18617,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -19674,7 +19514,7 @@ index 7466d56a18b..0325e438a47 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17966,7 +18632,6 @@ no_undefined_flag \
+@@ -17974,7 +18640,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -19682,7 +19522,7 @@ index 7466d56a18b..0325e438a47 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18002,6 +18667,7 @@ module_cmds \
+@@ -18010,6 +18675,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -19690,7 +19530,7 @@ index 7466d56a18b..0325e438a47 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18861,7 +19527,8 @@ $as_echo X"$file" |
+@@ -18869,7 +19535,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -19700,7 +19540,7 @@ index 7466d56a18b..0325e438a47 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18964,19 +19631,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18972,19 +19639,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -19744,7 +19584,7 @@ index 7466d56a18b..0325e438a47 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19006,6 +19696,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19014,6 +19704,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -19757,7 +19597,7 @@ index 7466d56a18b..0325e438a47 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19015,6 +19711,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19023,6 +19719,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -19767,7 +19607,7 @@ index 7466d56a18b..0325e438a47 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19129,12 +19828,12 @@ with_gcc=$GCC
+@@ -19137,12 +19836,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -19783,7 +19623,7 @@ index 7466d56a18b..0325e438a47 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19221,9 +19920,6 @@ inherit_rpath=$inherit_rpath
+@@ -19229,9 +19928,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -19793,7 +19633,7 @@ index 7466d56a18b..0325e438a47 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19239,6 +19935,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19247,6 +19943,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -19803,7 +19643,7 @@ index 7466d56a18b..0325e438a47 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19271,210 +19970,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19279,210 +19978,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -20005,15 +19845,9 @@ index 7466d56a18b..0325e438a47 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -20171,14 +20005,15 @@ index 7466d56a18b..0325e438a47 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
-index fa705dd9f13..d6ab725f71d 100644
 --- a/libsframe/Makefile.in
 +++ b/libsframe/Makefile.in
 @@ -404,6 +404,7 @@ CPPFLAGS = @CPPFLAGS@
@@ -20197,8 +20032,6 @@ index fa705dd9f13..d6ab725f71d 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-diff --git a/libsframe/configure b/libsframe/configure
-index 4727eff533a..ff7a4ab5c7a 100755
 --- a/libsframe/configure
 +++ b/libsframe/configure
 @@ -658,6 +658,8 @@ OTOOL
@@ -20247,7 +20080,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6202,8 +6207,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6202,8 +6207,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -20383,7 +20216,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6610,6 +6710,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6610,6 +6710,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -20602,7 +20435,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6711,25 +6972,19 @@ ac_tool_warned=yes ;;
+@@ -6711,29 +6972,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -20634,13 +20467,17 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -6741,6 +6996,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
++
++
++
++
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -20653,7 +20490,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -20679,29 +20516,22 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
-+
+ 
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
+ 
+ 
+ 
 @@ -7080,8 +7393,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -20749,7 +20579,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
    const char *name;
    void       *address;
  }
-@@ -7195,8 +7521,8 @@ static const void *lt_preloaded_setup() {
+@@ -7195,8 +7521,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -20771,7 +20601,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7244,6 +7570,14 @@ else
+@@ -7244,6 +7570,13 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -20782,11 +20612,10 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +  nm_file_list_spec='@'
 +fi
 +
-+
  
  
  
-@@ -7262,6 +7596,47 @@ fi
+@@ -7265,6 +7598,48 @@ fi
  
  
  
@@ -20795,8 +20624,6 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +
 +
 +
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -20831,9 +20658,12 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
- 
- 
- 
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -7471,6 +7846,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -20976,7 +20806,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8755,6 +9247,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8755,6 +9247,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -20989,7 +20819,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8817,7 +9315,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8817,7 +9315,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -21150,7 +20980,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9646,7 +10167,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9646,7 +10167,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -21208,7 +21038,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9719,20 +10253,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9719,20 +10253,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -21286,7 +21116,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9793,7 +10370,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9793,7 +10370,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -21295,7 +21125,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9801,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9801,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -21304,7 +21134,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9817,7 +10394,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9817,7 +10394,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -21313,7 +21143,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9841,10 +10418,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9841,10 +10418,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -21371,7 +21201,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10024,7 +10614,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10024,7 +10614,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -21380,7 +21210,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10043,9 +10633,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10043,9 +10633,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -21521,7 +21351,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13579,13 +14228,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13579,13 +14228,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -21542,7 +21372,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13600,14 +14256,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13600,14 +14256,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -21561,7 +21391,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13640,12 +14299,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13640,12 +14299,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -21675,7 +21505,7 @@ index 4727eff533a..ff7a4ab5c7a 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14669,6 +15359,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14669,6 +15359,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -21936,15 +21766,9 @@ index 4727eff533a..ff7a4ab5c7a 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -22102,14 +21926,15 @@ index 4727eff533a..ff7a4ab5c7a 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/libtool.m4 b/libtool.m4
-index e36fdd3c0e2..4acf9d67956 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -22141,7 +21966,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  
  
  # LT_PREREQ(VERSION)
-@@ -166,10 +168,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
+@@ -166,10 +168,13 @@ _LT_DECL([], [exeext], [0], [Executable
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -22155,7 +21980,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  
  _LT_CONFIG_LIBTOOL_INIT([
  # See if we are running on zsh, and set the options which allow our
-@@ -632,7 +637,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
+@@ -632,7 +637,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -22260,7 +22085,7 @@ index e36fdd3c0e2..4acf9d67956 100644
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1163,6 +1178,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
+@@ -1163,6 +1178,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -22528,7 +22353,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3225,7 +3382,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -3225,7 +3382,11 @@ test -z "$deplibs_check_method" && depli
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -22656,7 +22481,7 @@ index e36fdd3c0e2..4acf9d67956 100644
    const char *name;
    void       *address;
  }
-@@ -3569,15 +3804,15 @@ static const void *lt_preloaded_setup() {
+@@ -3569,15 +3804,15 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -22690,7 +22515,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3620,6 +3862,8 @@ _LT_DECL([global_symbol_to_c_name_address],
+@@ -3620,6 +3862,8 @@ _LT_DECL([global_symbol_to_c_name_addres
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -22775,7 +22600,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4272,6 +4531,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
+@@ -4272,6 +4531,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -23097,7 +22922,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5546,6 +5872,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5546,6 +5872,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -23105,7 +22930,7 @@ index e36fdd3c0e2..4acf9d67956 100644
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5563,6 +5890,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5563,6 +5890,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -23113,7 +22938,7 @@ index e36fdd3c0e2..4acf9d67956 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5726,7 +6054,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5726,7 +6054,7 @@ if test "$_lt_caught_CXX_error" != yes;
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -23122,7 +22947,7 @@ index e36fdd3c0e2..4acf9d67956 100644
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5738,7 +6066,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5738,7 +6066,7 @@ if test "$_lt_caught_CXX_error" != yes;
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -23131,7 +22956,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5780,29 +6108,75 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5780,29 +6108,75 @@ if test "$_lt_caught_CXX_error" != yes;
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -23230,7 +23055,7 @@ index e36fdd3c0e2..4acf9d67956 100644
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5877,7 +6251,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5877,7 +6251,7 @@ if test "$_lt_caught_CXX_error" != yes;
              ;;
            *)
              if test "$GXX" = yes; then
@@ -23239,7 +23064,7 @@ index e36fdd3c0e2..4acf9d67956 100644
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5948,10 +6322,10 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5948,10 +6322,10 @@ if test "$_lt_caught_CXX_error" != yes;
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -23252,7 +23077,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  	            ;;
  	        esac
  	      fi
-@@ -5992,9 +6366,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5992,9 +6366,9 @@ if test "$_lt_caught_CXX_error" != yes;
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -23264,7 +23089,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6272,7 +6646,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6272,7 +6646,7 @@ if test "$_lt_caught_CXX_error" != yes;
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -23273,7 +23098,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  		  ;;
  	      esac
  
-@@ -6318,7 +6692,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6318,7 +6692,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
        solaris*)
          case $cc_basename in
@@ -23282,7 +23107,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6359,9 +6733,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6359,9 +6733,9 @@ if test "$_lt_caught_CXX_error" != yes;
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -23294,7 +23119,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6491,6 +6865,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6491,6 +6865,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -23502,7 +23327,7 @@ index e36fdd3c0e2..4acf9d67956 100644
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7161,6 +7591,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+@@ -7161,6 +7591,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object
  AC_SUBST([OBJDUMP])
  ])
  
@@ -23529,7 +23354,7 @@ index e36fdd3c0e2..4acf9d67956 100644
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7294,206 +7733,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
+@@ -7294,206 +7733,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -23627,6 +23452,31 @@ index e36fdd3c0e2..4acf9d67956 100644
 -{
 -  func_len_result=${#1}
 -}
+-
+-_LT_EOF
+-    ;;
+-  *) # Bourne compatible functions.
+-    cat << \_LT_EOF >> "$cfgfile"
+-
+-# func_dirname file append nondir_replacement
+-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+-# otherwise set result to NONDIR_REPLACEMENT.
+-func_dirname ()
+-{
+-  # Extract subdirectory from the argument.
+-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
+-  if test "X$func_dirname_result" = "X${1}"; then
+-    func_dirname_result="${3}"
+-  else
+-    func_dirname_result="$func_dirname_result${2}"
+-  fi
+-}
+-
+-# func_basename file
+-func_basename ()
+-{
+-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
+-}
 +# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
 +# ------------------------------------------------------
 +# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
@@ -23643,23 +23493,22 @@ index e36fdd3c0e2..4acf9d67956 100644
 +test 0 -eq $? || _lt_function_replace_fail=:
 +])
  
--_LT_EOF
--    ;;
--  *) # Bourne compatible functions.
--    cat << \_LT_EOF >> "$cfgfile"
+-dnl func_dirname_and_basename
+-dnl A portable version of this function is already defined in general.m4sh
+-dnl so there is no need for it here.
  
--# func_dirname file append nondir_replacement
--# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
--# otherwise set result to NONDIR_REPLACEMENT.
--func_dirname ()
+-# func_stripname prefix suffix name
+-# strip PREFIX and SUFFIX off of NAME.
+-# PREFIX and SUFFIX must not contain globbing or regex special
+-# characters, hashes, percent signs, but SUFFIX may contain a leading
+-# dot (in which case that matches only a dot).
+-# func_strip_suffix prefix name
+-func_stripname ()
 -{
--  # Extract subdirectory from the argument.
--  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
--  if test "X$func_dirname_result" = "X${1}"; then
--    func_dirname_result="${3}"
--  else
--    func_dirname_result="$func_dirname_result${2}"
--  fi
+-  case ${2} in
+-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
+-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
+-  esac
 -}
 +# _LT_PROG_REPLACE_SHELLFNS
 +# -------------------------
@@ -23683,45 +23532,24 @@ index e36fdd3c0e2..4acf9d67956 100644
 +    esac
 +    func_basename_result="${1##*/}"])
  
--# func_basename file
--func_basename ()
--{
--  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
--}
+-# sed scripts:
+-my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
+-my_sed_long_arg='1s/^-[[^=]]*=//'
 +  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
 +    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
 +    # positional parameters, so assign one to ordinary parameter first.
 +    func_stripname_result=${3}
 +    func_stripname_result=${func_stripname_result#"${1}"}
 +    func_stripname_result=${func_stripname_result%"${2}"}])
- 
--dnl func_dirname_and_basename
--dnl A portable version of this function is already defined in general.m4sh
--dnl so there is no need for it here.
++
 +  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
 +    func_split_long_opt_name=${1%%=*}
 +    func_split_long_opt_arg=${1#*=}])
- 
--# func_stripname prefix suffix name
--# strip PREFIX and SUFFIX off of NAME.
--# PREFIX and SUFFIX must not contain globbing or regex special
--# characters, hashes, percent signs, but SUFFIX may contain a leading
--# dot (in which case that matches only a dot).
--# func_strip_suffix prefix name
--func_stripname ()
--{
--  case ${2} in
--    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
--    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
--  esac
--}
++
 +  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
 +    func_split_short_opt_arg=${1#??}
 +    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
- 
--# sed scripts:
--my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
--my_sed_long_arg='1s/^-[[^=]]*=//'
++
 +  _LT_PROG_FUNCTION_REPLACE([func_lo2o], [dnl
 +    case ${1} in
 +      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
@@ -23769,9 +23597,7 @@ index e36fdd3c0e2..4acf9d67956 100644
 +    func_quote_for_eval "${2}"
 +dnl m4 expansion turns \\\\ into \\, and then the shell eval turns that into \
 +    eval "${1}+=\\\\ \\$func_quote_for_eval_result"])
- 
--_LT_EOF
--esac
++
 +  # Save a `func_append' function call where possible by direct use of '+='
 +  sed -e 's%func_append \([[a-zA-Z_]]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
 +    && mv -f "$cfgfile.tmp" "$cfgfile" \
@@ -23785,14 +23611,17 @@ index e36fdd3c0e2..4acf9d67956 100644
 +  test 0 -eq $? || _lt_function_replace_fail=:
 +fi
  
--case $lt_shell_append in
--  yes)
--    cat << \_LT_EOF >> "$cfgfile"
+-_LT_EOF
+-esac
 +if test x"$_lt_function_replace_fail" = x":"; then
 +  AC_MSG_WARN([Unable to substitute extended shell functions in $ofile])
 +fi
 +])
  
+-case $lt_shell_append in
+-  yes)
+-    cat << \_LT_EOF >> "$cfgfile"
+-
 -# func_append var value
 -# Append VALUE to the end of shell variable VAR.
 -func_append ()
@@ -23878,8 +23707,6 @@ index e36fdd3c0e2..4acf9d67956 100644
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-diff --git a/ltmain.sh b/ltmain.sh
-index 1a710177fb2..09693d7b99b 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -24311,31 +24138,7 @@ index 1a710177fb2..09693d7b99b 100644
 +$progname: of $PACKAGE $VERSION and run autoconf again.
 +_LT_EOF
 +    fi
- 
--  # Shorthand for --mode=foo, only valid as the first argument
--  case $1 in
--  clean|clea|cle|cl)
--    shift; set dummy --mode clean ${1+"$@"}; shift
--    ;;
--  compile|compil|compi|comp|com|co|c)
--    shift; set dummy --mode compile ${1+"$@"}; shift
--    ;;
--  execute|execut|execu|exec|exe|ex|e)
--    shift; set dummy --mode execute ${1+"$@"}; shift
--    ;;
--  finish|finis|fini|fin|fi|f)
--    shift; set dummy --mode finish ${1+"$@"}; shift
--    ;;
--  install|instal|insta|inst|ins|in|i)
--    shift; set dummy --mode install ${1+"$@"}; shift
--    ;;
--  link|lin|li|l)
--    shift; set dummy --mode link ${1+"$@"}; shift
--    ;;
--  uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
--    shift; set dummy --mode uninstall ${1+"$@"}; shift
--    ;;
--  esac
++
 +    exit $EXIT_MISMATCH
 +  fi
 +}
@@ -24365,9 +24168,7 @@ index 1a710177fb2..09693d7b99b 100644
 +  shift; set dummy --mode uninstall ${1+"$@"}; shift
 +  ;;
 +esac
- 
--  # Parse non-mode specific arguments:
--  while test "$#" -gt 0; do
++
 +
 +
 +# Option defaults:
@@ -24383,8 +24184,34 @@ index 1a710177fb2..09693d7b99b 100644
 +opt_verbose=:
 +opt_silent=false
 +opt_verbose=false
-+
-+
+ 
+-  # Shorthand for --mode=foo, only valid as the first argument
+-  case $1 in
+-  clean|clea|cle|cl)
+-    shift; set dummy --mode clean ${1+"$@"}; shift
+-    ;;
+-  compile|compil|compi|comp|com|co|c)
+-    shift; set dummy --mode compile ${1+"$@"}; shift
+-    ;;
+-  execute|execut|execu|exec|exe|ex|e)
+-    shift; set dummy --mode execute ${1+"$@"}; shift
+-    ;;
+-  finish|finis|fini|fin|fi|f)
+-    shift; set dummy --mode finish ${1+"$@"}; shift
+-    ;;
+-  install|instal|insta|inst|ins|in|i)
+-    shift; set dummy --mode install ${1+"$@"}; shift
+-    ;;
+-  link|lin|li|l)
+-    shift; set dummy --mode link ${1+"$@"}; shift
+-    ;;
+-  uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
+-    shift; set dummy --mode uninstall ${1+"$@"}; shift
+-    ;;
+-  esac
+ 
+-  # Parse non-mode specific arguments:
+-  while test "$#" -gt 0; do
 +# Parse options once, thoroughly.  This comes as soon as possible in the
 +# script to make things like `--version' happen as quickly as we can.
 +{
@@ -24628,13 +24455,13 @@ index 1a710177fb2..09693d7b99b 100644
 -  fi
 -}
 -
-+    # Darwin sucks
-+    eval std_shrext=\"$shrext_cmds\"
- 
+-
 -## ----------- ##
 -##    Main.    ##
 -## ----------- ##
--
++    # Darwin sucks
++    eval std_shrext=\"$shrext_cmds\"
+ 
 -$opt_help || {
 -  # Sanity checks first:
 -  func_check_version_match
@@ -25355,7 +25182,7 @@ index 1a710177fb2..09693d7b99b 100644
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@ This mode accepts the following additional options:
+@@ -1659,8 +2327,8 @@ This mode accepts the following addition
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -25366,7 +25193,7 @@ index 1a710177fb2..09693d7b99b 100644
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted using RM."
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
          ;;
  
        *)
@@ -25468,7 +25295,7 @@ index 1a710177fb2..09693d7b99b 100644
 +    do
 +      if test -d "$opt"; then
 +	func_append libdirs " $opt"
- 
++
 +      elif test -f "$opt"; then
 +	if func_lalib_unsafe_p "$opt"; then
 +	  func_append libs " $opt"
@@ -25488,7 +25315,7 @@ index 1a710177fb2..09693d7b99b 100644
 +      else
 +        sysroot_cmd=
 +      fi
-+
+ 
 +      # Remove sysroot references
 +      if $opt_dry_run; then
 +        for lib in $libs; do
@@ -25900,7 +25727,7 @@ index 1a710177fb2..09693d7b99b 100644
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() {
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup()
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -26411,7 +26238,7 @@ index 1a710177fb2..09693d7b99b 100644
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, int);
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *,
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -26438,7 +26265,7 @@ index 1a710177fb2..09693d7b99b 100644
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathspec);
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -26766,7 +26593,7 @@ index 1a710177fb2..09693d7b99b 100644
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const char *mode,
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
  }
  
  void
@@ -26804,7 +26631,7 @@ index 1a710177fb2..09693d7b99b 100644
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, const char *add, int to_end)
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -26817,7 +26644,7 @@ index 1a710177fb2..09693d7b99b 100644
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, const char *value)
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -29070,8 +28897,6 @@ index 1a710177fb2..09693d7b99b 100644
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-diff --git a/ltoptions.m4 b/ltoptions.m4
-index 5ef12ced2a8..17cfd51c0b3 100644
 --- a/ltoptions.m4
 +++ b/ltoptions.m4
 @@ -8,7 +8,7 @@
@@ -29083,8 +28908,6 @@ index 5ef12ced2a8..17cfd51c0b3 100644
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-diff --git a/ltversion.m4 b/ltversion.m4
-index bf87f77132d..9c7b5d41185 100644
 --- a/ltversion.m4
 +++ b/ltversion.m4
 @@ -7,17 +7,17 @@
@@ -29111,8 +28934,6 @@ index bf87f77132d..9c7b5d41185 100644
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
-index bf92b5e0790..c573da90c5c 100644
 --- a/lt~obsolete.m4
 +++ b/lt~obsolete.m4
 @@ -7,7 +7,7 @@
@@ -29124,8 +28945,6 @@ index bf92b5e0790..c573da90c5c 100644
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
-index 4399354e5a9..4b1625febf3 100644
 --- a/opcodes/Makefile.in
 +++ b/opcodes/Makefile.in
 @@ -298,6 +298,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -29152,8 +28971,6 @@ index 4399354e5a9..4b1625febf3 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
-diff --git a/opcodes/configure b/opcodes/configure
-index 3dd6b692f89..64e9ba9b587 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -686,6 +686,9 @@ OTOOL
@@ -29203,7 +29020,7 @@ index 3dd6b692f89..64e9ba9b587 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5542,8 +5548,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5542,8 +5548,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -29339,7 +29156,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5950,6 +6051,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5950,6 +6051,157 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -29558,7 +29375,7 @@ index 3dd6b692f89..64e9ba9b587 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6051,25 +6313,20 @@ ac_tool_warned=yes ;;
+@@ -6051,29 +6313,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -29591,11 +29408,14 @@ index 3dd6b692f89..64e9ba9b587 100755
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
- 
- 
- 
-@@ -6080,6 +6337,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
++
++
++
++
++
++
++
++
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
@@ -29639,25 +29459,19 @@ index 3dd6b692f89..64e9ba9b587 100755
 +
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
  
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ 
+ 
 @@ -6420,8 +6734,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -29705,7 +29519,7 @@ index 3dd6b692f89..64e9ba9b587 100755
    const char *name;
    void       *address;
  }
-@@ -6535,8 +6862,8 @@ static const void *lt_preloaded_setup() {
+@@ -6535,8 +6862,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -29727,7 +29541,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6584,6 +6911,14 @@ else
+@@ -6584,6 +6911,12 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -29737,12 +29551,10 @@ index 3dd6b692f89..64e9ba9b587 100755
 +elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
 +  nm_file_list_spec='@'
 +fi
-+
-+
  
  
  
-@@ -6602,6 +6937,47 @@ fi
+@@ -6605,6 +6938,49 @@ fi
  
  
  
@@ -29752,7 +29564,6 @@ index 3dd6b692f89..64e9ba9b587 100755
 +
 +
 +
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -29787,9 +29598,12 @@ index 3dd6b692f89..64e9ba9b587 100755
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
- 
- 
- 
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -6811,6 +7187,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -29932,7 +29746,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8095,6 +8588,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8095,6 +8588,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -29945,7 +29759,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8157,7 +8656,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8157,7 +8656,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -30106,7 +29920,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8986,7 +9508,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8986,7 +9508,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -30164,7 +29978,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9059,20 +9594,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9059,20 +9594,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -30242,7 +30056,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9133,7 +9711,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9133,7 +9711,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -30251,7 +30065,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9141,7 +9719,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9141,7 +9719,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -30260,7 +30074,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9157,7 +9735,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9157,7 +9735,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -30269,7 +30083,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9181,10 +9759,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9181,10 +9759,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -30327,7 +30141,7 @@ index 3dd6b692f89..64e9ba9b587 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9364,7 +9955,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9364,7 +9955,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -30336,7 +30150,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9383,9 +9974,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9383,9 +9974,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -30477,7 +30291,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14846,13 +15496,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14846,13 +15496,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -30498,7 +30312,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14867,14 +15524,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14867,14 +15524,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -30517,7 +30331,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14907,12 +15567,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14907,12 +15567,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -30631,7 +30445,7 @@ index 3dd6b692f89..64e9ba9b587 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15945,6 +16636,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15945,6 +16636,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -30892,15 +30706,9 @@ index 3dd6b692f89..64e9ba9b587 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -31058,14 +30866,15 @@ index 3dd6b692f89..64e9ba9b587 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/zlib/Makefile.in b/zlib/Makefile.in
-index 951260ac4c5..9398823cc09 100644
 --- a/zlib/Makefile.in
 +++ b/zlib/Makefile.in
 @@ -281,6 +281,7 @@ CPPFLAGS = @CPPFLAGS@
@@ -31092,8 +30901,6 @@ index 951260ac4c5..9398823cc09 100644
  ac_ct_CC = @ac_ct_CC@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
-diff --git a/zlib/configure b/zlib/configure
-index cae55c5ca49..24193ee5db7 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -648,8 +648,11 @@ OTOOL
@@ -31145,7 +30952,7 @@ index cae55c5ca49..24193ee5db7 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5053,8 +5059,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5053,8 +5059,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -31281,7 +31088,7 @@ index cae55c5ca49..24193ee5db7 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5461,6 +5562,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5461,6 +5562,158 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -31501,7 +31308,7 @@ index cae55c5ca49..24193ee5db7 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5562,25 +5825,19 @@ ac_tool_warned=yes ;;
+@@ -5562,29 +5825,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -31533,13 +31340,17 @@ index cae55c5ca49..24193ee5db7 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -5592,6 +5849,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
++
++
++
++
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -31548,11 +31359,11 @@ index cae55c5ca49..24193ee5db7 100755
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
-+
+ 
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -31581,26 +31392,19 @@ index cae55c5ca49..24193ee5db7 100755
 +
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
+ 
+ 
+ 
 @@ -5931,8 +6246,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -31648,7 +31452,7 @@ index cae55c5ca49..24193ee5db7 100755
    const char *name;
    void       *address;
  }
-@@ -6046,8 +6374,8 @@ static const void *lt_preloaded_setup() {
+@@ -6046,8 +6374,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -31670,7 +31474,7 @@ index cae55c5ca49..24193ee5db7 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6095,6 +6423,17 @@ else
+@@ -6095,6 +6423,15 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -31683,18 +31487,13 @@ index cae55c5ca49..24193ee5db7 100755
 +
 +
 +
-+
-+
  
  
  
-@@ -6112,6 +6451,43 @@ fi
+@@ -6117,6 +6454,45 @@ fi
  
  
  
-+
-+
-+
 +
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
@@ -31729,9 +31528,14 @@ index cae55c5ca49..24193ee5db7 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -6326,6 +6702,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -31874,7 +31678,7 @@ index cae55c5ca49..24193ee5db7 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7910,6 +8403,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7910,6 +8403,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -31887,7 +31691,7 @@ index cae55c5ca49..24193ee5db7 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7972,7 +8471,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7972,7 +8471,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -32048,7 +31852,7 @@ index cae55c5ca49..24193ee5db7 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8804,7 +9326,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8804,7 +9326,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -32106,7 +31910,7 @@ index cae55c5ca49..24193ee5db7 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8880,20 +9415,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8880,20 +9415,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -32184,7 +31988,7 @@ index cae55c5ca49..24193ee5db7 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8954,7 +9532,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8954,7 +9532,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -32193,7 +31997,7 @@ index cae55c5ca49..24193ee5db7 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8962,7 +9540,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8962,7 +9540,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -32202,7 +32006,7 @@ index cae55c5ca49..24193ee5db7 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8978,7 +9556,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8978,7 +9556,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -32211,7 +32015,7 @@ index cae55c5ca49..24193ee5db7 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9002,10 +9580,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9002,10 +9580,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -32272,7 +32076,7 @@ index cae55c5ca49..24193ee5db7 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9188,7 +9779,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9188,7 +9779,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -32281,7 +32085,7 @@ index cae55c5ca49..24193ee5db7 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9207,9 +9798,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9207,9 +9798,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -32422,7 +32226,7 @@ index cae55c5ca49..24193ee5db7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12377,13 +13027,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -12377,13 +13027,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -32443,7 +32247,7 @@ index cae55c5ca49..24193ee5db7 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12398,14 +13055,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12398,14 +13055,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -32462,7 +32266,7 @@ index cae55c5ca49..24193ee5db7 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12438,12 +13098,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12438,12 +13098,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -32576,7 +32380,7 @@ index cae55c5ca49..24193ee5db7 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13309,6 +14000,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -13309,6 +14000,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -32837,15 +32641,9 @@ index cae55c5ca49..24193ee5db7 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -33003,8 +32801,11 @@ index cae55c5ca49..24193ee5db7 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"

