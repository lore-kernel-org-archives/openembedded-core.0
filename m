Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0559676128
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:51 +0000 (UTC)
Received: by pacan13 with SMTP id an13so77390575pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zkomvkuQQO6n/twTt/iQB3OCUK6N7m1BxokS4xXbA7E=;
	b=l479GN8yj2hEgLukDNoc9bYrMZKYxfLPFP9fCLWrR0cvLIc8G0pH2tgMQ8wVnFQ1KJ
	yApJZ3I+KEZXvOcdE/r7igjsBmsE3jrhGmGAehPr5fcJO0ZPsJvcz/pYOBXMD7PMMmd1
	O3RHE66r+2wnZp/2WsS+u4+pKly6Z7Et3kKORxZBktE71Gv+djPTUDYmP0xrlSbfJPxM
	ale5LR/zJUymDTMoBJVTXP/1QKAoR4gUjTd/vXlZWhMXAVk+diRSI9Lx3uz9EAKr3dpG
	yNwYg7QtQGxrKDjr3bIt08mtR3yj/l/bjoj0LpNbaPZnvFsWoXdH4Nd8WcK/KrLoq7NQ
	5Ztw==
X-Received: by 10.67.1.226 with SMTP id bj2mr40460502pad.34.1437232612376;
	Sat, 18 Jul 2015 08:16:52 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k5sm14646627pda.34.2015.07.18.08.16.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 158B6FC12FA; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:25 -0700
Message-Id: <2459d9bbc91238e445875b5123567e5cf3f5e21c.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 18/25] unzip: Security Advisory -CVE-2014-9636 and CVE-2015-1315
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:52 -0000

From: Roy Li <rongqing.li@windriver.com>

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9636

unzip 6.0 allows remote attackers to cause a denial of service
(out-of-bounds read or write and crash) via an extra field with
an uncompressed size smaller than the compressed field size in a
zip archive that advertises STORED method compression.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1315

Buffer overflow in the charset_to_intern function in unix/unix.c in
Info-Zip UnZip 6.10b allows remote attackers to execute arbitrary code
via a crafted string, as demonstrated by converting a string from CP866
to UTF-8.

(From OE-Core rev: f86a178fd7036541a45bf31a46bddf634c133802)

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch  | 402 +++++++++++++++++++++
 .../unzip/unzip/unzip-6.0_overflow3.diff           |  45 +++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   5 +-
 3 files changed, 451 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff

diff --git a/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch b/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
new file mode 100644
index 0000000..9ba3c1d
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
@@ -0,0 +1,402 @@
+From: Giovanni Scafora <giovanni.archlinux.org>
+Subject: unzip files encoded with non-latin, non-unicode file names
+Last-Update: 2015-02-11
+
+Upstream-Status: Backport
+
+Updated 2015-02-11 by Marc Deslauriers <marc.deslauriers@canonical.com>
+to fix buffer overflow in charset_to_intern()
+
+Signed-off-by: Marc Deslauriers <marc.deslauriers@canonical.com>
+
+Index: unzip-6.0/unix/unix.c
+===================================================================
+--- unzip-6.0.orig/unix/unix.c	2015-02-11 08:46:43.675324290 -0500
++++ unzip-6.0/unix/unix.c	2015-02-11 09:18:04.902081319 -0500
+@@ -30,6 +30,9 @@
+ #define UNZIP_INTERNAL
+ #include "unzip.h"
+ 
++#include <iconv.h>
++#include <langinfo.h>
++
+ #ifdef SCO_XENIX
+ #  define SYSNDIR
+ #else  /* SCO Unix, AIX, DNIX, TI SysV, Coherent 4.x, ... */
+@@ -1874,3 +1877,102 @@
+     }
+ }
+ #endif /* QLZIP */
++
++
++typedef struct {
++    char *local_charset;
++    char *archive_charset;
++} CHARSET_MAP;
++
++/* A mapping of local <-> archive charsets used by default to convert filenames
++ * of DOS/Windows Zip archives. Currently very basic. */
++static CHARSET_MAP dos_charset_map[] = {
++    { "ANSI_X3.4-1968", "CP850" },
++    { "ISO-8859-1", "CP850" },
++    { "CP1252", "CP850" },
++    { "UTF-8", "CP866" },
++    { "KOI8-R", "CP866" },
++    { "KOI8-U", "CP866" },
++    { "ISO-8859-5", "CP866" }
++};
++
++char OEM_CP[MAX_CP_NAME] = "";
++char ISO_CP[MAX_CP_NAME] = "";
++
++/* Try to guess the default value of OEM_CP based on the current locale.
++ * ISO_CP is left alone for now. */
++void init_conversion_charsets()
++{
++    const char *local_charset;
++    int i;
++
++    /* Make a guess only if OEM_CP not already set. */ 
++    if(*OEM_CP == '\0') {
++    	local_charset = nl_langinfo(CODESET);
++    	for(i = 0; i < sizeof(dos_charset_map)/sizeof(CHARSET_MAP); i++)
++    		if(!strcasecmp(local_charset, dos_charset_map[i].local_charset)) {
++    			strncpy(OEM_CP, dos_charset_map[i].archive_charset,
++    					sizeof(OEM_CP));
++    			break;
++    		}
++    }
++}
++
++/* Convert a string from one encoding to the current locale using iconv().
++ * Be as non-intrusive as possible. If error is encountered during covertion
++ * just leave the string intact. */
++static void charset_to_intern(char *string, char *from_charset)
++{
++    iconv_t cd;
++    char *s,*d, *buf;
++    size_t slen, dlen, buflen;
++    const char *local_charset;
++
++    if(*from_charset == '\0')
++    	return;
++
++    buf = NULL;
++    local_charset = nl_langinfo(CODESET);
++
++    if((cd = iconv_open(local_charset, from_charset)) == (iconv_t)-1)
++        return;
++
++    slen = strlen(string);
++    s = string;
++
++    /*  Make sure OUTBUFSIZ + 1 never ends up smaller than FILNAMSIZ
++     *  as this function also gets called with G.outbuf in fileio.c
++     */
++    buflen = FILNAMSIZ;
++    if (OUTBUFSIZ + 1 < FILNAMSIZ)
++    {
++        buflen = OUTBUFSIZ + 1;
++    }
++
++    d = buf = malloc(buflen);
++    if(!d)
++    	goto cleanup;
++
++    bzero(buf,buflen);
++    dlen = buflen - 1;
++
++    if(iconv(cd, &s, &slen, &d, &dlen) == (size_t)-1)
++    	goto cleanup;
++    strncpy(string, buf, buflen);
++
++    cleanup:
++    free(buf);
++    iconv_close(cd);
++}
++
++/* Convert a string from OEM_CP to the current locale charset. */
++inline void oem_intern(char *string)
++{
++    charset_to_intern(string, OEM_CP);
++}
++
++/* Convert a string from ISO_CP to the current locale charset. */
++inline void iso_intern(char *string)
++{
++    charset_to_intern(string, ISO_CP);
++}
+Index: unzip-6.0/unix/unxcfg.h
+===================================================================
+--- unzip-6.0.orig/unix/unxcfg.h	2015-02-11 08:46:43.675324290 -0500
++++ unzip-6.0/unix/unxcfg.h	2015-02-11 08:46:43.671324260 -0500
+@@ -228,4 +228,30 @@
+ /* wild_dir, dirname, wildname, matchname[], dirnamelen, have_dirname, */
+ /*    and notfirstcall are used by do_wild().                          */
+ 
++
++#define MAX_CP_NAME 25 
++   
++#ifdef SETLOCALE
++#  undef SETLOCALE
++#endif
++#define SETLOCALE(category, locale) setlocale(category, locale)
++#include <locale.h>
++   
++#ifdef _ISO_INTERN
++#  undef _ISO_INTERN
++#endif
++#define _ISO_INTERN(str1) iso_intern(str1)
++
++#ifdef _OEM_INTERN
++#  undef _OEM_INTERN
++#endif
++#ifndef IZ_OEM2ISO_ARRAY
++#  define IZ_OEM2ISO_ARRAY
++#endif
++#define _OEM_INTERN(str1) oem_intern(str1)
++
++void iso_intern(char *);
++void oem_intern(char *);
++void init_conversion_charsets(void);
++   
+ #endif /* !__unxcfg_h */
+Index: unzip-6.0/unzip.c
+===================================================================
+--- unzip-6.0.orig/unzip.c	2015-02-11 08:46:43.675324290 -0500
++++ unzip-6.0/unzip.c	2015-02-11 08:46:43.675324290 -0500
+@@ -327,11 +327,21 @@
+   -2  just filenames but allow -h/-t/-z  -l  long Unix \"ls -l\" format\n\
+                                          -v  verbose, multi-page format\n";
+ 
++#ifndef UNIX
+ static ZCONST char Far ZipInfoUsageLine3[] = "miscellaneous options:\n\
+   -h  print header line       -t  print totals for listed files or for all\n\
+   -z  print zipfile comment   -T  print file times in sortable decimal format\
+ \n  -C  be case-insensitive   %s\
+   -x  exclude filenames that follow from listing\n";
++#else /* UNIX */
++static ZCONST char Far ZipInfoUsageLine3[] = "miscellaneous options:\n\
++  -h  print header line       -t  print totals for listed files or for all\n\
++  -z  print zipfile comment  %c-T%c print file times in sortable decimal format\
++\n %c-C%c be case-insensitive   %s\
++  -x  exclude filenames that follow from listing\n\
++  -O CHARSET  specify a character encoding for DOS, Windows and OS/2 archives\n\
++  -I CHARSET  specify a character encoding for UNIX and other archives\n";
++#endif /* !UNIX */
+ #ifdef MORE
+    static ZCONST char Far ZipInfoUsageLine4[] =
+      "  -M  page output through built-in \"more\"\n";
+@@ -664,6 +674,17 @@
+   -U  use escapes for all non-ASCII Unicode  -UU ignore any Unicode fields\n\
+   -C  match filenames case-insensitively     -L  make (some) names \
+ lowercase\n %-42s  -V  retain VMS version numbers\n%s";
++#elif (defined UNIX)
++static ZCONST char Far UnzipUsageLine4[] = "\
++modifiers:\n\
++  -n  never overwrite existing files         -q  quiet mode (-qq => quieter)\n\
++  -o  overwrite files WITHOUT prompting      -a  auto-convert any text files\n\
++  -j  junk paths (do not make directories)   -aa treat ALL files as text\n\
++  -U  use escapes for all non-ASCII Unicode  -UU ignore any Unicode fields\n\
++  -C  match filenames case-insensitively     -L  make (some) names \
++lowercase\n %-42s  -V  retain VMS version numbers\n%s\
++  -O CHARSET  specify a character encoding for DOS, Windows and OS/2 archives\n\
++  -I CHARSET  specify a character encoding for UNIX and other archives\n\n";
+ #else /* !VMS */
+ static ZCONST char Far UnzipUsageLine4[] = "\
+ modifiers:\n\
+@@ -802,6 +823,10 @@
+ #endif /* UNICODE_SUPPORT */
+ 
+ 
++#ifdef UNIX
++    init_conversion_charsets();
++#endif
++
+ #if (defined(__IBMC__) && defined(__DEBUG_ALLOC__))
+     extern void DebugMalloc(void);
+ 
+@@ -1335,6 +1360,11 @@
+     argc = *pargc;
+     argv = *pargv;
+ 
++#ifdef UNIX
++    extern char OEM_CP[MAX_CP_NAME];
++    extern char ISO_CP[MAX_CP_NAME];
++#endif
++    
+     while (++argv, (--argc > 0 && *argv != NULL && **argv == '-')) {
+         s = *argv + 1;
+         while ((c = *s++) != 0) {    /* "!= 0":  prevent Turbo C warning */
+@@ -1516,6 +1546,35 @@
+                     }
+                     break;
+ #endif  /* MACOS */
++#ifdef UNIX
++    			case ('I'):
++                    if (negative) {
++                        Info(slide, 0x401, ((char *)slide,
++                          "error:  encodings can't be negated"));
++                        return(PK_PARAM);
++    				} else {
++    					if(*s) { /* Handle the -Icharset case */
++    						/* Assume that charsets can't start with a dash to spot arguments misuse */
++    						if(*s == '-') { 
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						strncpy(ISO_CP, s, sizeof(ISO_CP));
++    					} else { /* -I charset */
++    						++argv;
++    						if(!(--argc > 0 && *argv != NULL && **argv != '-')) {
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						s = *argv;
++    						strncpy(ISO_CP, s, sizeof(ISO_CP));
++    					}
++    					while(*(++s)); /* No params straight after charset name */
++    				}
++    				break;
++#endif /* ?UNIX */
+                 case ('j'):    /* junk pathnames/directory structure */
+                     if (negative)
+                         uO.jflag = FALSE, negative = 0;
+@@ -1591,6 +1650,35 @@
+                     } else
+                         ++uO.overwrite_all;
+                     break;
++#ifdef UNIX
++    			case ('O'):
++                    if (negative) {
++                        Info(slide, 0x401, ((char *)slide,
++                          "error:  encodings can't be negated"));
++                        return(PK_PARAM);
++    				} else {
++    					if(*s) { /* Handle the -Ocharset case */
++    						/* Assume that charsets can't start with a dash to spot arguments misuse */
++    						if(*s == '-') { 
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						strncpy(OEM_CP, s, sizeof(OEM_CP));
++    					} else { /* -O charset */
++    						++argv;
++    						if(!(--argc > 0 && *argv != NULL && **argv != '-')) {
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -O argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						s = *argv;
++    						strncpy(OEM_CP, s, sizeof(OEM_CP));
++    					}
++    					while(*(++s)); /* No params straight after charset name */
++    				}
++    				break;
++#endif /* ?UNIX */
+                 case ('p'):    /* pipes:  extract to stdout, no messages */
+                     if (negative) {
+                         uO.cflag = FALSE;
+Index: unzip-6.0/unzpriv.h
+===================================================================
+--- unzip-6.0.orig/unzpriv.h	2015-02-11 08:46:43.675324290 -0500
++++ unzip-6.0/unzpriv.h	2015-02-11 08:46:43.675324290 -0500
+@@ -3008,7 +3008,7 @@
+          !(((islochdr) || (isuxatt)) && \
+            ((hostver) == 25 || (hostver) == 26 || (hostver) == 40))) || \
+         (hostnum) == FS_HPFS_ || \
+-        ((hostnum) == FS_NTFS_ && (hostver) == 50)) { \
++        ((hostnum) == FS_NTFS_ /* && (hostver) == 50 */ )) { \
+         _OEM_INTERN((string)); \
+     } else { \
+         _ISO_INTERN((string)); \
+Index: unzip-6.0/zipinfo.c
+===================================================================
+--- unzip-6.0.orig/zipinfo.c	2015-02-11 08:46:43.675324290 -0500
++++ unzip-6.0/zipinfo.c	2015-02-11 08:46:43.675324290 -0500
+@@ -457,6 +457,10 @@
+     int    tflag_slm=TRUE, tflag_2v=FALSE;
+     int    explicit_h=FALSE, explicit_t=FALSE;
+ 
++#ifdef UNIX
++    extern char OEM_CP[MAX_CP_NAME];
++    extern char ISO_CP[MAX_CP_NAME];
++#endif
+ 
+ #ifdef MACOS
+     uO.lflag = LFLAG;         /* reset default on each call */
+@@ -501,6 +505,35 @@
+                             uO.lflag = 0;
+                     }
+                     break;
++#ifdef UNIX
++    			case ('I'):
++                    if (negative) {
++                        Info(slide, 0x401, ((char *)slide,
++                          "error:  encodings can't be negated"));
++                        return(PK_PARAM);
++    				} else {
++    					if(*s) { /* Handle the -Icharset case */
++    						/* Assume that charsets can't start with a dash to spot arguments misuse */
++    						if(*s == '-') { 
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						strncpy(ISO_CP, s, sizeof(ISO_CP));
++    					} else { /* -I charset */
++    						++argv;
++    						if(!(--argc > 0 && *argv != NULL && **argv != '-')) {
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						s = *argv;
++    						strncpy(ISO_CP, s, sizeof(ISO_CP));
++    					}
++    					while(*(++s)); /* No params straight after charset name */
++    				}
++    				break;
++#endif /* ?UNIX */
+                 case 'l':      /* longer form of "ls -l" type listing */
+                     if (negative)
+                         uO.lflag = -2, negative = 0;
+@@ -521,6 +554,35 @@
+                         G.M_flag = TRUE;
+                     break;
+ #endif
++#ifdef UNIX
++    			case ('O'):
++                    if (negative) {
++                        Info(slide, 0x401, ((char *)slide,
++                          "error:  encodings can't be negated"));
++                        return(PK_PARAM);
++    				} else {
++    					if(*s) { /* Handle the -Ocharset case */
++    						/* Assume that charsets can't start with a dash to spot arguments misuse */
++    						if(*s == '-') { 
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -I argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						strncpy(OEM_CP, s, sizeof(OEM_CP));
++    					} else { /* -O charset */
++    						++argv;
++    						if(!(--argc > 0 && *argv != NULL && **argv != '-')) {
++    	                        Info(slide, 0x401, ((char *)slide,
++        		                  "error:  a valid character encoding should follow the -O argument"));
++    	                        return(PK_PARAM); 
++    						}
++    						s = *argv;
++    						strncpy(OEM_CP, s, sizeof(OEM_CP));
++    					}
++    					while(*(++s)); /* No params straight after charset name */
++    				}
++    				break;
++#endif /* ?UNIX */
+                 case 's':      /* default:  shorter "ls -l" type listing */
+                     if (negative)
+                         uO.lflag = -2, negative = 0;
diff --git a/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff b/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
new file mode 100644
index 0000000..0a0bfbb
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
@@ -0,0 +1,45 @@
+From 190040ebfcf5395a6ccedede2cc9343d34f0a108 Mon Sep 17 00:00:00 2001
+From: mancha <mancha1 AT zoho DOT com>
+Date: Wed, 11 Feb 2015
+Subject: Info-ZIP UnZip buffer overflow
+
+Upstream-Status: Backport
+
+By carefully crafting a corrupt ZIP archive with "extra fields" that
+purport to have compressed blocks larger than the corresponding
+uncompressed blocks in STORED no-compression mode, an attacker can
+trigger a heap overflow that can result in application crash or
+possibly have other unspecified impact.
+
+This patch ensures that when extra fields use STORED mode, the
+"compressed" and uncompressed block sizes match.
+
+Signed-off-by: mancha <mancha1 AT zoho DOT com>
+---
+ extract.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/extract.c
++++ b/extract.c
+@@ -2217,6 +2217,7 @@ static int test_compr_eb(__G__ eb, eb_si
+     ulg eb_ucsize;
+     uch *eb_ucptr;
+     int r;
++    ush method;
+ 
+     if (compr_offset < 4)                /* field is not compressed: */
+         return PK_OK;                    /* do nothing and signal OK */
+@@ -2226,6 +2227,13 @@ static int test_compr_eb(__G__ eb, eb_si
+          eb_size <= (compr_offset + EB_CMPRHEADLEN)))
+         return IZ_EF_TRUNC;               /* no compressed data! */
+ 
++    method = makeword(eb + (EB_HEADSIZE + compr_offset));
++    if ((method == STORED) &&
++        (eb_size - compr_offset - EB_CMPRHEADLEN != eb_ucsize))
++	return PK_ERR;			  /* compressed & uncompressed
++					   * should match in STORED
++					   * method */
++
+     if (
+ #ifdef INT_16BIT
+         (((ulg)(extent)eb_ucsize) != eb_ucsize) ||
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 33c20f8..9653bee 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -8,7 +8,10 @@ PR = "r5"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch \
-	file://define-ldflags.patch"
+	file://define-ldflags.patch \
+	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
+	file://unzip-6.0_overflow3.diff \
+"
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
-- 
1.9.1


