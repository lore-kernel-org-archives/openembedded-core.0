Return-Path: <jurobystricky@hotmail.com>
Received: from BLU004-OMC4S10.hotmail.com (blu004-omc4s10.hotmail.com
	[65.55.111.149])
	by mail.openembedded.org (Postfix) with ESMTP id B92F57229B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:33:10 +0000 (UTC)
Received: from BLU436-SMTP204 ([65.55.111.137]) by BLU004-OMC4S10.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Thu, 27 Nov 2014 10:33:10 -0800
X-TMN: [Xfd4xzEuvrE1vQuathyjL3eBZOlKVD5A]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BLU436-SMTP2049F5D4A9FB2DB21C94FCABB710@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 10:32:59 -0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 27 Nov 2014 18:33:08.0510 (UTC)
	FILETIME=[97521BE0:01D00A70]
MIME-Version: 1.0
Subject: [PATCH] eglibc: modified option-groups.h generation
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
X-List-Received-Date: Thu, 27 Nov 2014 18:33:13 -0000
Content-Type: text/plain

option-groups.h only explicitely #defines options that are enabled.
EGLIBC options are typically pre-processed under the assumption that if
an option is not explicitely defined then it evaluates as 0.
This assumption is correct, but it generates a compiler warning
message each time an undefined symbol is being evaluated.
In order to remove the warnings, each EGLIBC option is now defined
as 1 if the option is enabled or as 0 otherwise.
The consequence is we cannot use #ifdef OPTION_XXX when evaluating
the option, we must always use #if OPTION_XXX.

[YOCTO #7001]

Signed-off-by: Juro Bystricky <jurobystricky@hotmail.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     | 34 +++++++++++-----------
 meta/recipes-core/glibc/glibc/option-groups.patch  |  6 ++--
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 40c7832..7136253 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -5724,7 +5724,7 @@ Index: git/posix/regex.h
  # define RE_INVALID_INTERVAL_ORD (RE_DEBUG << 1)
  
 +/* EGLIBC: Old regex implementation does not support these.  */
-+# ifdef __OPTION_POSIX_REGEXP_GLIBC
++# if __OPTION_POSIX_REGEXP_GLIBC
  /* If this bit is set, then ignore case when matching.
     If not set, then case is significant.  */
  # define RE_ICASE (RE_INVALID_INTERVAL_ORD << 1)
@@ -5740,7 +5740,7 @@ Index: git/posix/regex.h
    (RE_CHAR_CLASSES | RE_DOT_NEWLINE      | RE_DOT_NOT_NULL		\
     | RE_INTERVALS  | RE_NO_EMPTY_RANGES)
  
-+#ifdef __OPTION_POSIX_REGEXP_GLIBC
++#if __OPTION_POSIX_REGEXP_GLIBC
  #define RE_SYNTAX_POSIX_BASIC						\
    (_RE_SYNTAX_POSIX_COMMON | RE_BK_PLUS_QM | RE_CONTEXT_INVALID_DUP)
 +#else
@@ -5754,7 +5754,7 @@ Index: git/posix/regex.h
  /* Like REG_NOTBOL, except for the end-of-line.  */
  #define REG_NOTEOL (1 << 1)
  
-+#ifdef __OPTION_POSIX_REGEXP_GLIBC
++#if __OPTION_POSIX_REGEXP_GLIBC
  /* Use PMATCH[0] to delimit the start and end of the search in the
     buffer.  */
  #define REG_STARTEND (1 << 2)
@@ -15542,7 +15542,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  libc_hidden_proto (__nldbl___isoc99_vsscanf)
  libc_hidden_proto (__nldbl___isoc99_vfscanf)
 +
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
 +libc_hidden_proto (__nldbl_vfwscanf)
 +libc_hidden_proto (__nldbl_vswscanf)
 +libc_hidden_proto (__nldbl_vfwprintf)
@@ -15559,7 +15559,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  }
  weak_alias (__nldbl_fprintf, __nldbl__IO_fprintf)
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section weak_function
  __nldbl_fwprintf (FILE *stream, const wchar_t *fmt, ...)
@@ -15575,7 +15575,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
    return done;
  }
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl_swprintf (wchar_t *s, size_t n, const wchar_t *fmt, ...)
@@ -15591,7 +15591,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  }
  libc_hidden_def (__nldbl_vdprintf)
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section weak_function
  __nldbl_vfwprintf (FILE *s, const wchar_t *fmt, va_list ap)
@@ -15607,7 +15607,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  libc_hidden_def (__nldbl_vsnprintf)
  weak_alias (__nldbl_vsnprintf, __nldbl___vsnprintf)
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section weak_function
  __nldbl_vswprintf (wchar_t *string, size_t maxlen, const wchar_t *fmt,
@@ -15623,7 +15623,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
    return done;
  }
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl_vfwscanf (FILE *s, const wchar_t *fmt, va_list ap)
@@ -15639,7 +15639,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
    return done;
  }
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl___fwprintf_chk (FILE *stream, int flag, const wchar_t *fmt, ...)
@@ -15655,7 +15655,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
    return done;
  }
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl___swprintf_chk (wchar_t *s, size_t n, int flag, size_t slen,
@@ -15671,7 +15671,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  }
  libc_hidden_def (__nldbl___vfprintf_chk)
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl___vfwprintf_chk (FILE *s, int flag, const wchar_t *fmt, va_list ap)
@@ -15687,7 +15687,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  }
  libc_hidden_def (__nldbl___vsprintf_chk)
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl___vswprintf_chk (wchar_t *string, size_t maxlen, int flag, size_t slen,
@@ -15719,7 +15719,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
    return done;
  }
  
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  int
  attribute_compat_text_section
  __nldbl___isoc99_vfwscanf (FILE *s, const wchar_t *fmt, va_list ap)
@@ -15735,7 +15735,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  compat_symbol (libc, __nldbl___strfmon_l, __strfmon_l, GLIBC_2_1);
  #endif
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_2)
-+# ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++# if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  compat_symbol (libc, __nldbl_swprintf, swprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vwprintf, vwprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_wprintf, wprintf, GLIBC_2_2);
@@ -15783,7 +15783,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  NLDBL_DECL (__isoc99_vscanf);
  NLDBL_DECL (__isoc99_vfscanf);
  NLDBL_DECL (__isoc99_vsscanf);
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
 +NLDBL_DECL (vfwscanf);
 +NLDBL_DECL (vfwprintf);
 +NLDBL_DECL (vswprintf);
@@ -15819,7 +15819,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  					  _G_va_list) __THROW;
  extern void __nldbl___vsyslog_chk (int, int, const char *, va_list);
 -
-+#ifdef __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
 +extern int __nldbl___vfwprintf_chk (FILE *__restrict, int,
 +				    const wchar_t *__restrict, __gnuc_va_list);
 +extern int __nldbl___vswprintf_chk (wchar_t *__restrict, size_t, int, size_t,
diff --git a/meta/recipes-core/glibc/glibc/option-groups.patch b/meta/recipes-core/glibc/glibc/option-groups.patch
index 693bd2f..198be73 100644
--- a/meta/recipes-core/glibc/glibc/option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/option-groups.patch
@@ -1358,8 +1358,8 @@ Index: git/scripts/option-groups.awk
 +    print "   It defines macros that indicate which EGLIBC option groups were"
 +    print "   configured in 'option-groups.config' when this C library was"
 +    print "   built.  For each option group named OPTION_foo, it #defines"
-+    print "   __OPTION_foo to be 1 if the group is enabled, or leaves that"
-+    print "   symbol undefined if the group is disabled.  */"
++    print "   __OPTION_foo to be 1 if the group is enabled, or #defines that"
++    print "   symbol to be 0 if the group is disabled.  */"
 +    print ""
 +    print "#ifndef __GNU_OPTION_GROUPS_H"
 +    print "#define __GNU_OPTION_GROUPS_H"
@@ -1379,7 +1379,7 @@ Index: git/scripts/option-groups.awk
 +            if (vars[var] == "y")
 +                print "#define __" var " 1"
 +            else if (vars[var] == "n")
-+                print "/* #undef __" var " */"
++                print "#define __" var " 0"
 +	    else if (vars[var] ~ /^[0-9]+/ ||
 +		     vars[var] ~ /^0x[0-9aAbBcCdDeEfF]+/ ||
 +		     vars[var] ~ /^\"/)
-- 
1.9.1


