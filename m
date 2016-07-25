Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1FC5731D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8GcBe027665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:38 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:28 -0700
Message-ID: <3347390e14139d76e119920eccb434819e7ceb90.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] slang: 2.2.4 -> 2.3.0
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:38 -0000
Content-Type: text/plain

* Removed:
  change-char-type-to-signed-char-in-macros.patch
  sprintf-bug-concerning-8-bit-characters.patch
  They are already in the source.

* Updated:
  fix-check-pcre.patch
  fix-check-pcre.patch
  slang-fix-the-iconv-existence-checking.patch

* Use SECURITY_NO_PIE_CFLAGS for SECURITY_CFLAGS, it can't be built with
  "-pie -fpie":
  tmp/sysroots/qemux86-64/usr/lib64/../lib64/Scrt1.o: In function `_start':
  /usr/src/debug/glibc/2.24-r0/git/csu/../sysdeps/x86_64/start.S:104: undefined reference to `main'
  /tmp/ccMFTA8A.o: In function `smg_char_at':
  /usr/src/debug/slang/2.3.0-r0/slang-2.3.0/modules/slsmg-module.c:134: undefined reference to `SLsmg_char_at'
  /tmp/ccMFTA8A.o: In function `smg_resume_smg':
---
 meta/conf/distro/include/security_flags.inc        |   1 +
 ...change-char-type-to-signed-char-in-macros.patch | 218 ---------------------
 .../slang/slang/fix-check-pcre.patch               |  30 +--
 meta/recipes-extended/slang/slang/rpathfix.patch   |  18 +-
 .../slang-fix-the-iconv-existence-checking.patch   |  31 +--
 .../sprintf-bug-concerning-8-bit-characters.patch  |  42 ----
 .../slang/{slang_2.2.4.bb => slang_2.3.0.bb}       |   9 +-
 7 files changed, 58 insertions(+), 291 deletions(-)
 delete mode 100644 meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
 delete mode 100644 meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
 rename meta/recipes-extended/slang/{slang_2.2.4.bb => slang_2.3.0.bb} (82%)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a7be185..d953161 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -86,6 +86,7 @@ SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 # Revert RPM to using internally supported values
 SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-uclibc = ""
diff --git a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
deleted file mode 100644
index 2ea1ffd..0000000
--- a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-slang: change char type to signed char in macros
-
-C language has 3 distinct char types:
-         char
-         unsigned char
-         signed char
-A char has the same range of values as signed char on X86,
-but same as unsigned char on ARM which made Slang's typecast()
-and array_sort() unable to work for char value on ARM, since
-Slang is assuming "char" as "signed char".
-
-Now we change "char" as "signed char" explicitly in
-util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
-
-Upstream-Status: Submitted
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- src/slarith2.inc       |   72 ++++++++++++++++++++++++-------------------------
- src/util/mkslarith2.sl |    2 -
- 2 files changed, 37 insertions(+), 37 deletions(-)
-
---- a/src/util/mkslarith2.sl
-+++ b/src/util/mkslarith2.sl
-@@ -1,7 +1,7 @@
- #!/usr/bin/env slsh
- 
- private variable CTypes =
--  ["char", "unsigned char", "short", "unsigned short", "int", "unsigned int",
-+  ["signed char", "unsigned char", "short", "unsigned short", "int", "unsigned int",
-    "long", "unsigned long", "long long", "unsigned long long",
-    "float", "double", "long double"];
- private variable Is_Int_Type =
---- a/src/slarith2.inc
-+++ b/src/slarith2.inc
-@@ -1,43 +1,43 @@
- /* DO NOT EDIT -- this file was generated by src/util/mkslarith2.sl */
--/* ------------ char ---------- */
--DEFUN_1(copy_char_to_char,char,char)
-+/* ------------ signed char ---------- */
-+DEFUN_1(copy_char_to_char,signed char,signed char)
- #define char_to_char	NULL
- #define copy_char_to_uchar	copy_char_to_char
- #define char_to_uchar	NULL
--DEFUN_1(copy_char_to_short,char,short)
-+DEFUN_1(copy_char_to_short,signed char,short)
- #define char_to_short	NULL
--DEFUN_1(copy_char_to_ushort,char,unsigned short)
-+DEFUN_1(copy_char_to_ushort,signed char,unsigned short)
- #define char_to_ushort	NULL
--DEFUN_1(copy_char_to_int,char,int)
--DEFUN_2(char_to_int,char,int,copy_char_to_int)
--DEFUN_1(copy_char_to_uint,char,unsigned int)
--DEFUN_2(char_to_uint,char,unsigned int,copy_char_to_uint)
--DEFUN_1(copy_char_to_long,char,long)
--DEFUN_2(char_to_long,char,long,copy_char_to_long)
--DEFUN_1(copy_char_to_ulong,char,unsigned long)
--DEFUN_2(char_to_ulong,char,unsigned long,copy_char_to_ulong)
-+DEFUN_1(copy_char_to_int,signed char,int)
-+DEFUN_2(char_to_int,signed char,int,copy_char_to_int)
-+DEFUN_1(copy_char_to_uint,signed char,unsigned int)
-+DEFUN_2(char_to_uint,signed char,unsigned int,copy_char_to_uint)
-+DEFUN_1(copy_char_to_long,signed char,long)
-+DEFUN_2(char_to_long,signed char,long,copy_char_to_long)
-+DEFUN_1(copy_char_to_ulong,signed char,unsigned long)
-+DEFUN_2(char_to_ulong,signed char,unsigned long,copy_char_to_ulong)
- #if defined(HAVE_LONG_LONG)
--DEFUN_1(copy_char_to_llong,char,long long)
--DEFUN_2(char_to_llong,char,long long,copy_char_to_llong)
-+DEFUN_1(copy_char_to_llong,signed char,long long)
-+DEFUN_2(char_to_llong,signed char,long long,copy_char_to_llong)
- #endif /* defined(HAVE_LONG_LONG) */
- #if defined(HAVE_LONG_LONG)
--DEFUN_1(copy_char_to_ullong,char,unsigned long long)
--DEFUN_2(char_to_ullong,char,unsigned long long,copy_char_to_ullong)
-+DEFUN_1(copy_char_to_ullong,signed char,unsigned long long)
-+DEFUN_2(char_to_ullong,signed char,unsigned long long,copy_char_to_ullong)
- #endif /* defined(HAVE_LONG_LONG) */
- #if SLANG_HAS_FLOAT
--DEFUN_1(copy_char_to_float,char,float)
--DEFUN_2(char_to_float,char,float,copy_char_to_float)
-+DEFUN_1(copy_char_to_float,signed char,float)
-+DEFUN_2(char_to_float,signed char,float,copy_char_to_float)
- #endif /* SLANG_HAS_FLOAT */
- #if SLANG_HAS_FLOAT
--DEFUN_1(copy_char_to_double,char,double)
--DEFUN_2(char_to_double,char,double,copy_char_to_double)
-+DEFUN_1(copy_char_to_double,signed char,double)
-+DEFUN_2(char_to_double,signed char,double,copy_char_to_double)
- #endif /* SLANG_HAS_FLOAT */
- #if defined(HAVE_LONG_DOUBLE)
--DEFUN_1(copy_char_to_ldouble,char,long double)
--DEFUN_2(char_to_ldouble,char,long double,copy_char_to_ldouble)
-+DEFUN_1(copy_char_to_ldouble,signed char,long double)
-+DEFUN_2(char_to_ldouble,signed char,long double,copy_char_to_ldouble)
- #endif /* defined(HAVE_LONG_DOUBLE) */
- #if SLANG_HAS_FLOAT
--TO_DOUBLE_FUN(char_to_one_double,char)
-+TO_DOUBLE_FUN(char_to_one_double,signed char)
- #endif
- 
- /* ------------ unsigned char ---------- */
-@@ -82,7 +82,7 @@ TO_DOUBLE_FUN(uchar_to_one_double,unsign
- #endif
- 
- /* ------------ short ---------- */
--DEFUN_1(copy_short_to_char,short,char)
-+DEFUN_1(copy_short_to_char,short,signed char)
- #define short_to_char	NULL
- DEFUN_1(copy_short_to_uchar,short,unsigned char)
- #define short_to_uchar	NULL
-@@ -123,7 +123,7 @@ TO_DOUBLE_FUN(short_to_one_double,short)
- #endif
- 
- /* ------------ unsigned short ---------- */
--DEFUN_1(copy_ushort_to_char,unsigned short,char)
-+DEFUN_1(copy_ushort_to_char,unsigned short,signed char)
- #define ushort_to_char	NULL
- DEFUN_1(copy_ushort_to_uchar,unsigned short,unsigned char)
- #define ushort_to_uchar	NULL
-@@ -164,7 +164,7 @@ TO_DOUBLE_FUN(ushort_to_one_double,unsig
- #endif
- 
- /* ------------ int ---------- */
--DEFUN_1(copy_int_to_char,int,char)
-+DEFUN_1(copy_int_to_char,int,signed char)
- #define int_to_char	NULL
- DEFUN_1(copy_int_to_uchar,int,unsigned char)
- #define int_to_uchar	NULL
-@@ -205,7 +205,7 @@ TO_DOUBLE_FUN(int_to_one_double,int)
- #endif
- 
- /* ------------ unsigned int ---------- */
--DEFUN_1(copy_uint_to_char,unsigned int,char)
-+DEFUN_1(copy_uint_to_char,unsigned int,signed char)
- #define uint_to_char	NULL
- DEFUN_1(copy_uint_to_uchar,unsigned int,unsigned char)
- #define uint_to_uchar	NULL
-@@ -246,7 +246,7 @@ TO_DOUBLE_FUN(uint_to_one_double,unsigne
- #endif
- 
- /* ------------ long ---------- */
--DEFUN_1(copy_long_to_char,long,char)
-+DEFUN_1(copy_long_to_char,long,signed char)
- #define long_to_char	NULL
- DEFUN_1(copy_long_to_uchar,long,unsigned char)
- #define long_to_uchar	NULL
-@@ -287,7 +287,7 @@ TO_DOUBLE_FUN(long_to_one_double,long)
- #endif
- 
- /* ------------ unsigned long ---------- */
--DEFUN_1(copy_ulong_to_char,unsigned long,char)
-+DEFUN_1(copy_ulong_to_char,unsigned long,signed char)
- #define ulong_to_char	NULL
- DEFUN_1(copy_ulong_to_uchar,unsigned long,unsigned char)
- #define ulong_to_uchar	NULL
-@@ -329,7 +329,7 @@ TO_DOUBLE_FUN(ulong_to_one_double,unsign
- 
- /* ------------ long long ---------- */
- #if defined(HAVE_LONG_LONG)
--DEFUN_1(copy_llong_to_char,long long,char)
-+DEFUN_1(copy_llong_to_char,long long,signed char)
- #define llong_to_char	NULL
- DEFUN_1(copy_llong_to_uchar,long long,unsigned char)
- #define llong_to_uchar	NULL
-@@ -372,7 +372,7 @@ TO_DOUBLE_FUN(llong_to_one_double,long l
- 
- /* ------------ unsigned long long ---------- */
- #if defined(HAVE_LONG_LONG)
--DEFUN_1(copy_ullong_to_char,unsigned long long,char)
-+DEFUN_1(copy_ullong_to_char,unsigned long long,signed char)
- #define ullong_to_char	NULL
- DEFUN_1(copy_ullong_to_uchar,unsigned long long,unsigned char)
- #define ullong_to_uchar	NULL
-@@ -415,7 +415,7 @@ TO_DOUBLE_FUN(ullong_to_one_double,unsig
- 
- /* ------------ float ---------- */
- #if SLANG_HAS_FLOAT
--DEFUN_1(copy_float_to_char,float,char)
-+DEFUN_1(copy_float_to_char,float,signed char)
- #define float_to_char	NULL
- DEFUN_1(copy_float_to_uchar,float,unsigned char)
- #define float_to_uchar	NULL
-@@ -458,7 +458,7 @@ TO_DOUBLE_FUN(float_to_one_double,float)
- 
- /* ------------ double ---------- */
- #if SLANG_HAS_FLOAT
--DEFUN_1(copy_double_to_char,double,char)
-+DEFUN_1(copy_double_to_char,double,signed char)
- #define double_to_char	NULL
- DEFUN_1(copy_double_to_uchar,double,unsigned char)
- #define double_to_uchar	NULL
-@@ -501,7 +501,7 @@ TO_DOUBLE_FUN(double_to_one_double,doubl
- 
- /* ------------ long double ---------- */
- #if defined(HAVE_LONG_DOUBLE)
--DEFUN_1(copy_ldouble_to_char,long double,char)
-+DEFUN_1(copy_ldouble_to_char,long double,signed char)
- #define ldouble_to_char	NULL
- DEFUN_1(copy_ldouble_to_uchar,long double,unsigned char)
- #define ldouble_to_uchar	NULL
-@@ -545,7 +545,7 @@ TO_DOUBLE_FUN(ldouble_to_one_double,long
- #if SLANG_HAS_FLOAT
- static To_Double_Fun_Table_Type To_Double_Fun_Table [MAX_ARITHMETIC_TYPES] =
- {
--   {sizeof(char), char_to_one_double},
-+   {sizeof(signed char), char_to_one_double},
-    {sizeof(unsigned char), uchar_to_one_double},
-    {sizeof(short), short_to_one_double},
-    {sizeof(unsigned short), ushort_to_one_double},
-@@ -583,7 +583,7 @@ static To_Double_Fun_Table_Type To_Doubl
- 
- static Binary_Matrix_Type Binary_Matrix [MAX_ARITHMETIC_TYPES][MAX_ARITHMETIC_TYPES] =
- {
--   /* char */
-+   /* signed char */
-    {
-      {(FVOID_STAR)copy_char_to_char, char_to_char},
-      {(FVOID_STAR)copy_char_to_uchar, char_to_uchar},
diff --git a/meta/recipes-extended/slang/slang/fix-check-pcre.patch b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
index 0c1553a..a0ec0ff 100644
--- a/meta/recipes-extended/slang/slang/fix-check-pcre.patch
+++ b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
@@ -11,14 +11,13 @@ this off.
 Upstream-Status: Inappropriate
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
- configure |   60 ++++++------------------------------------------------------
- 1 files changed, 6 insertions(+), 54 deletions(-)
+ configure |   72 +++++---------------------------------------------------------
+ 1 file changed, 6 insertions(+), 66 deletions(-)
 
 diff --git a/configure b/configure
-index f1586c3..d22814f 100755
 --- a/configure
 +++ b/configure
-@@ -6991,6 +6991,7 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
+@@ -7191,6 +7191,7 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
  	 /usr/include/pcre,/usr/lib \
  	 /usr/pcre/include,/usr/pcre/lib \
  	 /usr/include,/usr/lib \
@@ -26,7 +25,7 @@ index f1586c3..d22814f 100755
  	 /opt/include/pcre,/opt/lib \
  	 /opt/pcre/include,/opt/pcre/lib \
  	 /opt/include,/opt/lib"
-@@ -7021,14 +7022,14 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
+@@ -7221,14 +7222,14 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
          xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
  	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
  	found=0
@@ -45,7 +44,7 @@ index f1586c3..d22814f 100755
  	      jd_with_pcre_library="yes"
  	      found=1
  	      break
-@@ -7054,56 +7055,7 @@ $as_echo "yes: $jd_pcre_library_dir and $jd_pcre_include_dir" >&6; }
+@@ -7255,68 +7255,7 @@ $as_echo "yes: $jd_pcre_library_dir and $jd_pcre_include_dir" >&6; }
      then
        PCRE_LIB=""
      else
@@ -74,7 +73,7 @@ index f1586c3..d22814f 100755
 -      fi
 -    fi
 -  ;;
--  *osf*|*openbsd*)
+-  *osf*|*openbsd*|*freebsd*)
 -    if test "X$GCC" = Xyes
 -    then
 -      RPATH="-Wl,-rpath,"
@@ -95,7 +94,19 @@ index f1586c3..d22814f 100755
 -      RPATH="$RPATH$jd_pcre_library_dir"
 -    fi
 -  else
--    RPATH="$RPATH:$jd_pcre_library_dir"
+-    _already_there=0
+-    for X in `echo $RPATH | sed 's/:/ /g'`
+-    do
+-      if test "$X" = "$jd_pcre_library_dir"
+-      then
+-        _already_there=1
+-	break
+-      fi
+-    done
+-    if test $_already_there = 0
+-    then
+-      RPATH="$RPATH:$jd_pcre_library_dir"
+-    fi
 -  fi
 -fi
 -
@@ -103,6 +114,3 @@ index f1586c3..d22814f 100755
      fi
  
      PCRE_INC=-I$jd_pcre_include_dir
--- 
-1.7.4.1
-
diff --git a/meta/recipes-extended/slang/slang/rpathfix.patch b/meta/recipes-extended/slang/slang/rpathfix.patch
index 50cac92..f82a531 100644
--- a/meta/recipes-extended/slang/slang/rpathfix.patch
+++ b/meta/recipes-extended/slang/slang/rpathfix.patch
@@ -10,7 +10,7 @@ Index: slang-2.2.4/configure
 ===================================================================
 --- slang-2.2.4.orig/configure	2012-03-14 23:40:01.283560679 +0000
 +++ slang-2.2.4/configure	2012-03-14 23:41:18.023558900 +0000
-@@ -6081,56 +6081,7 @@
+@@ -6246,68 +6246,7 @@ esac
  ELF_CFLAGS="$ELF_CFLAGS $IEEE_CFLAGS"
  CFLAGS="$CFLAGS $IEEE_CFLAGS"
  
@@ -39,7 +39,7 @@ Index: slang-2.2.4/configure
 -      fi
 -    fi
 -  ;;
--  *osf*|*openbsd*)
+-  *osf*|*openbsd*|*freebsd*)
 -    if test "X$GCC" = Xyes
 -    then
 -      RPATH="-Wl,-rpath,"
@@ -60,7 +60,19 @@ Index: slang-2.2.4/configure
 -      RPATH="$RPATH$libdir"
 -    fi
 -  else
--    RPATH="$RPATH:$libdir"
+-    _already_there=0
+-    for X in `echo $RPATH | sed 's/:/ /g'`
+-    do
+-      if test "$X" = "$libdir"
+-      then
+-        _already_there=1
+-	break
+-      fi
+-    done
+-    if test $_already_there = 0
+-    then
+-      RPATH="$RPATH:$libdir"
+-    fi
 -  fi
 -fi
 -
diff --git a/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch b/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
index 958fe98..850551e 100644
--- a/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
+++ b/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
@@ -19,14 +19,14 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Zheng Junling <zhengjunling@huawei.com>
 ---
- configure | 60 ++++++------------------------------------------------------
- 1 file changed, 6 insertions(+), 54 deletions(-)
+ configure |   72 +++++---------------------------------------------------------
+ 1 file changed, 6 insertions(+), 66 deletions(-)
 
 diff --git a/configure b/configure
-index 7a96256..91632f3 100755
+index fa395ff..7fa769c 100755
 --- a/configure
 +++ b/configure
-@@ -7909,6 +7909,7 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
+@@ -8259,6 +8259,7 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
  	 /usr/include/iconv,/usr/lib \
  	 /usr/iconv/include,/usr/iconv/lib \
  	 /usr/include,/usr/lib \
@@ -34,7 +34,7 @@ index 7a96256..91632f3 100755
  	 /opt/include/iconv,/opt/lib \
  	 /opt/iconv/include,/opt/iconv/lib \
  	 /opt/include,/opt/lib"
-@@ -7939,14 +7940,14 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
+@@ -8289,14 +8290,14 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
          xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
  	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
  	found=0
@@ -53,7 +53,7 @@ index 7a96256..91632f3 100755
  	      jd_with_iconv_library="yes"
  	      found=1
  	      break
-@@ -7972,56 +7973,7 @@ $as_echo "yes: $jd_iconv_library_dir and $jd_iconv_include_dir" >&6; }
+@@ -8201,68 +8201,7 @@ $as_echo "yes: $jd_iconv_library_dir and $jd_iconv_include_dir" >&6; }
      then
        ICONV_LIB=""
      else
@@ -82,7 +82,7 @@ index 7a96256..91632f3 100755
 -      fi
 -    fi
 -  ;;
--  *osf*|*openbsd*)
+-  *osf*|*openbsd*|*freebsd*)
 -    if test "X$GCC" = Xyes
 -    then
 -      RPATH="-Wl,-rpath,"
@@ -103,7 +103,19 @@ index 7a96256..91632f3 100755
 -      RPATH="$RPATH$jd_iconv_library_dir"
 -    fi
 -  else
--    RPATH="$RPATH:$jd_iconv_library_dir"
+-    _already_there=0
+-    for X in `echo $RPATH | sed 's/:/ /g'`
+-    do
+-      if test "$X" = "$jd_iconv_library_dir"
+-      then
+-        _already_there=1
+-	break
+-      fi
+-    done
+-    if test $_already_there = 0
+-    then
+-      RPATH="$RPATH:$jd_iconv_library_dir"
+-    fi
 -  fi
 -fi
 -
@@ -111,6 +123,3 @@ index 7a96256..91632f3 100755
      fi
  
      ICONV_INC=-I$jd_iconv_include_dir
--- 
-1.8.3.4
-
diff --git a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
deleted file mode 100644
index 420001b..0000000
--- a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Backport
-
-From 3a05d1a920140e9f2c72791c12f664213feb46df Mon Sep 17 00:00:00 2001
-From: Manfred Hanke <Manfred.Hanke@tngtech.com>
-Date: Thu, 20 Jun 2013 10:24:12 +0200
-Subject: [PATCH] sprintf bug (concerning %c for 8-bit character in non-UTF8
- mode) fixed
-
-char *str points to SLuchar_Type utf8_buf[], which had too small scope
-
-src/test/strops.sl failed in the following environment:
- - compiler:  gcc (Debian 4.7.2-5) 4.7.2
- - CFLAGS:    -g -O2
- - libc:      GNU C Library (Debian EGLIBC 2.13-38) stable release version 2.13
- - kernel:    3.2.0-4-686-pae #1 SMP Debian 3.2.39-2 i686 GNU/Linux
----
- src/slstrops.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/slstrops.c b/src/slstrops.c
-index ce6acb0..cbbbb01 100644
---- a/src/slstrops.c
-+++ b/src/slstrops.c
-@@ -1884,6 +1884,7 @@ static char *SLdo_sprintf (char *fmt) /*{{{*/
- #endif
-    unsigned char uch;
-    int use_long = 0, use_alt_format = 0;
-+   SLuchar_Type utf8_buf[SLUTF8_MAX_MBLEN+1];
- 
-    while (1)
-      {
-@@ -2071,7 +2072,6 @@ static char *SLdo_sprintf (char *fmt) /*{{{*/
- #endif
- 	       {
- 		  SLwchar_Type wc;
--		  SLuchar_Type utf8_buf[SLUTF8_MAX_MBLEN+1];
- 
- 		  if (-1 == SLang_pop_wchar (&wc))
- 		    return out;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.3.0.bb
similarity index 82%
rename from meta/recipes-extended/slang/slang_2.2.4.bb
rename to meta/recipes-extended/slang/slang_2.3.0.bb
index 237e9f2..17efbbe 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.3.0.bb
@@ -10,17 +10,14 @@ to recode S-Lang procedures in C if you need to."
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre ncurses"
-PR = "r12"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
 
-SRC_URI = "http://www.jedsoft.org/releases/slang/old/slang-${PV}.tar.bz2 \
+SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
-           file://change-char-type-to-signed-char-in-macros.patch \
-           file://sprintf-bug-concerning-8-bit-characters.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
            file://0001-Fix-error-conflicting-types-for-posix_close.patch \
           "
@@ -30,8 +27,8 @@ inherit autotools-brokensep
 
 CLEANBROKEN = "1"
 
-SRC_URI[md5sum] = "7fcfd447e378f07dd0c0bae671fe6487"
-SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db"
+SRC_URI[md5sum] = "3bcc790460d52db1316c20395b7ac2f1"
+SRC_URI[sha256sum] = "f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129"
 
 EXTRA_OECONF += " --without-z --without-png --without-onig --x-includes=${STAGING_DIR_HOST}/usr/include/X11 --x-libraries=${STAGING_DIR_HOST}/usr/lib"
 
-- 
2.9.0


