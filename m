Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 49924729DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 22:52:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2015 14:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,733,1413270000"; d="scan'208";a="635157260"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.248.119])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2015 14:51:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 14:51:42 -0800
Message-Id: <2d305cab23e64b83ce9a0e0922c24143c4305992.1420843293.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
Subject: [PATCH 5/5] glibc: Fix up minimal build with libc-libm
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
X-List-Received-Date: Fri, 09 Jan 2015 22:52:03 -0000

This addresses 2 issues discovered trying to build a minimal libc with
libm option.  By default nscd was always being built and without inet
enabled there were missing symbols.

The patch got updated changing initgroups to become part of the INET
group. Newer version of quilt added function information.

[YOCTO #7108]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     | 1379 ++++++++++----------
 meta/recipes-core/glibc/glibc_2.20.bb              |    3 +
 2 files changed, 693 insertions(+), 689 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 7136253..7be9b06 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -4,8 +4,8 @@ Upstream-Status: Pending
 
 Index: git/argp/argp-fmtstream.c
 ===================================================================
---- git.orig/argp/argp-fmtstream.c	2014-08-29 20:00:42.976070587 -0700
-+++ git/argp/argp-fmtstream.c	2014-08-29 20:01:15.188070587 -0700
+--- git.orig/argp/argp-fmtstream.c
++++ git/argp/argp-fmtstream.c
 @@ -42,6 +42,7 @@
  #ifdef _LIBC
  # include <wchar.h>
@@ -14,7 +14,7 @@ Index: git/argp/argp-fmtstream.c
  # define __vsnprintf(s, l, f, a) _IO_vsnprintf (s, l, f, a)
  #endif
  
-@@ -100,7 +101,11 @@
+@@ -100,7 +101,11 @@ __argp_fmtstream_free (argp_fmtstream_t
    __argp_fmtstream_update (fs);
    if (fs->p > fs->buf)
      {
@@ -26,7 +26,7 @@ Index: git/argp/argp-fmtstream.c
      }
    free (fs->buf);
    free (fs);
-@@ -145,9 +150,17 @@
+@@ -145,9 +150,17 @@ __argp_fmtstream_update (argp_fmtstream_
  	      size_t i;
  	      for (i = 0; i < pad; i++)
  		{
@@ -45,7 +45,7 @@ Index: git/argp/argp-fmtstream.c
  		    putc_unlocked (' ', fs->stream);
  		}
  	    }
-@@ -308,9 +321,17 @@
+@@ -308,9 +321,17 @@ __argp_fmtstream_update (argp_fmtstream_
  	      *nl++ = ' ';
  	  else
  	    for (i = 0; i < fs->wmargin; ++i)
@@ -66,9 +66,9 @@ Index: git/argp/argp-fmtstream.c
  	  /* Copy the tail of the original buffer into the current buffer
 Index: git/argp/argp-help.c
 ===================================================================
---- git.orig/argp/argp-help.c	2014-08-29 20:00:42.976070587 -0700
-+++ git/argp/argp-help.c	2014-08-29 20:01:15.188070587 -0700
-@@ -51,6 +51,7 @@
+--- git.orig/argp/argp-help.c
++++ git/argp/argp-help.c
+@@ -51,6 +51,7 @@ char *alloca ();
  #ifdef _LIBC
  # include <../libio/libioP.h>
  # include <wchar.h>
@@ -76,7 +76,7 @@ Index: git/argp/argp-help.c
  #endif
  
  #ifndef _
-@@ -1702,7 +1703,7 @@
+@@ -1702,7 +1703,7 @@ char *__argp_basename (char *name)
  }
  
  char *
@@ -85,7 +85,7 @@ Index: git/argp/argp-help.c
  {
  # if HAVE_DECL_PROGRAM_INVOCATION_SHORT_NAME
    return program_invocation_short_name;
-@@ -1873,9 +1874,17 @@
+@@ -1873,9 +1874,17 @@ __argp_failure (const struct argp_state
  #endif
  	    }
  
@@ -106,8 +106,8 @@ Index: git/argp/argp-help.c
  #if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
 Index: git/argp/argp-namefrob.h
 ===================================================================
---- git.orig/argp/argp-namefrob.h	2014-08-29 20:00:42.976070587 -0700
-+++ git/argp/argp-namefrob.h	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/argp/argp-namefrob.h
++++ git/argp/argp-namefrob.h
 @@ -76,10 +76,12 @@
  #undef __argp_fmtstream_wmargin
  #define __argp_fmtstream_wmargin argp_fmtstream_wmargin
@@ -123,8 +123,8 @@ Index: git/argp/argp-namefrob.h
  #undef __flockfile
 Index: git/argp/Makefile
 ===================================================================
---- git.orig/argp/Makefile	2014-08-29 20:00:42.976070587 -0700
-+++ git/argp/Makefile	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/argp/Makefile
++++ git/argp/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for argp.
@@ -136,9 +136,9 @@ Index: git/argp/Makefile
  include ../Makeconfig
 Index: git/catgets/Makefile
 ===================================================================
---- git.orig/catgets/Makefile	2014-08-29 20:00:43.008070587 -0700
-+++ git/catgets/Makefile	2014-08-29 20:01:15.192070587 -0700
-@@ -22,20 +22,23 @@
+--- git.orig/catgets/Makefile
++++ git/catgets/Makefile
+@@ -22,20 +22,23 @@ subdir	:= catgets
  
  include ../Makeconfig
  
@@ -171,8 +171,8 @@ Index: git/catgets/Makefile
  # To find xmalloc.c
 Index: git/crypt/crypt-entry.c
 ===================================================================
---- git.orig/crypt/crypt-entry.c	2014-08-29 20:00:43.028070587 -0700
-+++ git/crypt/crypt-entry.c	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/crypt/crypt-entry.c
++++ git/crypt/crypt-entry.c
 @@ -27,6 +27,7 @@
  #include <stdio.h>
  #endif
@@ -181,7 +181,7 @@ Index: git/crypt/crypt-entry.c
  #include <errno.h>
  #include <fips-private.h>
  
-@@ -76,9 +77,11 @@
+@@ -76,9 +77,11 @@ __crypt_r (key, salt, data)
       const char *salt;
       struct crypt_data * __restrict data;
  {
@@ -193,7 +193,7 @@ Index: git/crypt/crypt-entry.c
  
  #ifdef _LIBC
    /* Try to find out whether we have to use MD5 encryption replacement.  */
-@@ -105,6 +108,7 @@
+@@ -105,6 +108,7 @@ __crypt_r (key, salt, data)
  			     sizeof (struct crypt_data));
  #endif
  
@@ -201,7 +201,7 @@ Index: git/crypt/crypt-entry.c
    /*
     * Hack DES tables according to salt
     */
-@@ -144,6 +148,10 @@
+@@ -144,6 +148,10 @@ __crypt_r (key, salt, data)
     */
    _ufc_output_conversion_r (res[0], res[1], salt, data);
    return data->crypt_3_buf;
@@ -212,7 +212,7 @@ Index: git/crypt/crypt-entry.c
  }
  weak_alias (__crypt_r, crypt_r)
  
-@@ -168,7 +176,12 @@
+@@ -168,7 +176,12 @@ crypt (key, salt)
      return __sha512_crypt (key, salt);
  #endif
  
@@ -227,8 +227,8 @@ Index: git/crypt/crypt-entry.c
  
 Index: git/crypt/Makefile
 ===================================================================
---- git.orig/crypt/Makefile	2014-08-29 20:00:43.024070587 -0700
-+++ git/crypt/Makefile	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/crypt/Makefile
++++ git/crypt/Makefile
 @@ -18,21 +18,25 @@
  #
  #	Sub-makefile for crypt() portion of the library.
@@ -261,7 +261,7 @@ Index: git/crypt/Makefile
  routines += $(libcrypt-routines)
  endif
  
-@@ -44,7 +48,7 @@
+@@ -44,7 +48,7 @@ LDLIBS-crypt.so = -lfreebl3
  else
  libcrypt-routines += md5 sha256 sha512
  
@@ -270,7 +270,7 @@ Index: git/crypt/Makefile
  
  # The test md5test-giant uses up to 400 MB of RSS and runs on a fast
  # machine over a minute.
-@@ -64,8 +68,10 @@
+@@ -64,8 +68,10 @@ $(objpfx)sha256test: $(patsubst %, $(obj
  $(objpfx)sha512test: $(patsubst %, $(objpfx)%.o,$(sha512-routines))
  endif
  
@@ -283,8 +283,8 @@ Index: git/crypt/Makefile
 +endif # eglibc: OPTION_EGLIBC_CRYPT
 Index: git/csu/Makefile
 ===================================================================
---- git.orig/csu/Makefile	2014-08-29 20:00:43.032070587 -0700
-+++ git/csu/Makefile	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/csu/Makefile
++++ git/csu/Makefile
 @@ -22,6 +22,8 @@
  # crtn.o, special "initializer" and "finalizer" files used in the link
  # to make the .init and .fini sections work right.
@@ -296,8 +296,8 @@ Index: git/csu/Makefile
  include ../Makeconfig
 Index: git/debug/Makefile
 ===================================================================
---- git.orig/debug/Makefile	2014-08-29 20:00:43.036070587 -0700
-+++ git/debug/Makefile	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/debug/Makefile
++++ git/debug/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for debug portion of the library.
@@ -307,7 +307,7 @@ Index: git/debug/Makefile
  subdir	:= debug
  
  include ../Makeconfig
-@@ -27,7 +29,7 @@
+@@ -27,7 +29,7 @@ headers	:= execinfo.h
  # Note that ptsname_r_chk and getlogin_r are not here, but in
  # login/Makefile instead.  If that subdir is omitted from the
  # build, its _FORTIFY_SOURCE support will be too.
@@ -316,7 +316,7 @@ Index: git/debug/Makefile
  	    memcpy_chk memmove_chk mempcpy_chk memset_chk stpcpy_chk \
  	    strcat_chk strcpy_chk strncat_chk strncpy_chk stpncpy_chk \
  	    sprintf_chk vsprintf_chk snprintf_chk vsnprintf_chk \
-@@ -36,20 +38,27 @@
+@@ -36,20 +38,27 @@ routines  = backtrace backtracesyms back
  	    read_chk pread_chk pread64_chk recv_chk recvfrom_chk \
  	    readlink_chk readlinkat_chk getwd_chk getcwd_chk \
  	    realpath_chk fread_chk fread_u_chk \
@@ -352,7 +352,7 @@ Index: git/debug/Makefile
  static-only-routines := warning-nop stack_chk_fail_local
  
  CFLAGS-backtrace.c = -fno-omit-frame-pointer
-@@ -129,11 +138,15 @@
+@@ -129,11 +138,15 @@ LDFLAGS-tst-backtrace4 = -rdynamic
  LDFLAGS-tst-backtrace5 = -rdynamic
  LDFLAGS-tst-backtrace6 = -rdynamic
  
@@ -375,8 +375,8 @@ Index: git/debug/Makefile
  tests += $(tests-ifunc)
 Index: git/debug/segfault.c
 ===================================================================
---- git.orig/debug/segfault.c	2014-08-29 20:00:46.280070587 -0700
-+++ git/debug/segfault.c	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/debug/segfault.c
++++ git/debug/segfault.c
 @@ -30,6 +30,7 @@
  #include <unistd.h>
  #include <_itoa.h>
@@ -385,7 +385,7 @@ Index: git/debug/segfault.c
  
  /* This file defines macros to access the content of the sigcontext element
     passed up by the signal handler.  */
-@@ -91,6 +92,7 @@
+@@ -91,6 +92,7 @@ catch_segfault (int signal, SIGCONTEXT c
    REGISTER_DUMP;
  #endif
  
@@ -393,7 +393,7 @@ Index: git/debug/segfault.c
    WRITE_STRING ("\nBacktrace:\n");
  
    /* Get the backtrace.  */
-@@ -113,6 +115,7 @@
+@@ -113,6 +115,7 @@ catch_segfault (int signal, SIGCONTEXT c
  
    /* Now generate nicely formatted output.  */
    __backtrace_symbols_fd (arr + i, cnt - i, fd);
@@ -403,8 +403,8 @@ Index: git/debug/segfault.c
    /* Now the link map.  */
 Index: git/debug/tst-chk1.c
 ===================================================================
---- git.orig/debug/tst-chk1.c	2014-08-29 20:00:46.288070587 -0700
-+++ git/debug/tst-chk1.c	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/debug/tst-chk1.c
++++ git/debug/tst-chk1.c
 @@ -31,6 +31,7 @@
  #include <sys/select.h>
  #include <sys/socket.h>
@@ -413,7 +413,7 @@ Index: git/debug/tst-chk1.c
  
  
  #define obstack_chunk_alloc malloc
-@@ -307,6 +308,7 @@
+@@ -307,6 +308,7 @@ do_test (void)
    snprintf (buf + 8, l0 + 3, "%d", num2);
    CHK_FAIL_END
  
@@ -421,7 +421,7 @@ Index: git/debug/tst-chk1.c
    CHK_FAIL_START
    swprintf (wbuf + 8, 3, L"%d", num1);
    CHK_FAIL_END
-@@ -314,6 +316,7 @@
+@@ -314,6 +316,7 @@ do_test (void)
    CHK_FAIL_START
    swprintf (wbuf + 8, l0 + 3, L"%d", num1);
    CHK_FAIL_END
@@ -429,7 +429,7 @@ Index: git/debug/tst-chk1.c
  # endif
  
    memcpy (buf, str1 + 2, l0 + 9);
-@@ -381,6 +384,7 @@
+@@ -381,6 +384,7 @@ do_test (void)
    CHK_FAIL_END
  #endif
  
@@ -437,7 +437,7 @@ Index: git/debug/tst-chk1.c
  
    /* These ops can be done without runtime checking of object size.  */
    wmemcpy (wbuf, L"abcdefghij", 10);
-@@ -605,6 +609,7 @@
+@@ -605,6 +609,7 @@ do_test (void)
    CHK_FAIL_END
  #endif
  
@@ -445,7 +445,7 @@ Index: git/debug/tst-chk1.c
  
    /* Now checks for %n protection.  */
  
-@@ -1192,6 +1197,7 @@
+@@ -1192,6 +1197,7 @@ do_test (void)
  # endif
  #endif
  
@@ -453,7 +453,7 @@ Index: git/debug/tst-chk1.c
    if (setlocale (LC_ALL, "de_DE.UTF-8") != NULL)
      {
        assert (MB_CUR_MAX <= 10);
-@@ -1348,6 +1354,7 @@
+@@ -1348,6 +1354,7 @@ do_test (void)
        puts ("cannot set locale");
        ret = 1;
      }
@@ -463,8 +463,8 @@ Index: git/debug/tst-chk1.c
    if (fd != -1)
 Index: git/dlfcn/Makefile
 ===================================================================
---- git.orig/dlfcn/Makefile	2014-08-29 20:00:46.312070587 -0700
-+++ git/dlfcn/Makefile	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/dlfcn/Makefile
++++ git/dlfcn/Makefile
 @@ -15,6 +15,8 @@
  # License along with the GNU C Library; if not, see
  # <http://www.gnu.org/licenses/>.
@@ -474,7 +474,7 @@ Index: git/dlfcn/Makefile
  subdir		:= dlfcn
  
  include ../Makeconfig
-@@ -36,7 +38,9 @@
+@@ -36,7 +38,9 @@ endif
  ifeq (yes,$(build-shared))
  tests = glrefmain failtest tst-dladdr default errmsg1 tstcxaatexit \
  	bug-dlopen1 bug-dlsym1 tst-dlinfo bug-atexit1 bug-atexit2 \
@@ -487,8 +487,8 @@ Index: git/dlfcn/Makefile
  		defaultmod2 errmsg1mod modatexit modcxaatexit \
 Index: git/elf/dl-support.c
 ===================================================================
---- git.orig/elf/dl-support.c	2014-08-29 20:00:46.384070587 -0700
-+++ git/elf/dl-support.c	2014-08-29 20:01:15.192070587 -0700
+--- git.orig/elf/dl-support.c
++++ git/elf/dl-support.c
 @@ -19,6 +19,7 @@
  /* This file defines some things that for the dynamic linker are defined in
     rtld.c and dl-sysdep.c in ways appropriate to bootstrap dynamic linking.  */
@@ -497,7 +497,7 @@ Index: git/elf/dl-support.c
  #include <errno.h>
  #include <libintl.h>
  #include <stdlib.h>
-@@ -42,7 +43,9 @@
+@@ -42,7 +43,9 @@ char **_dl_argv = &__progname;	/* This i
  const char *_dl_platform;
  size_t _dl_platformlen;
  
@@ -509,8 +509,8 @@ Index: git/elf/dl-support.c
  int _dl_dynamic_weak;
 Index: git/elf/rtld.c
 ===================================================================
---- git.orig/elf/rtld.c	2014-08-29 20:01:14.708070587 -0700
-+++ git/elf/rtld.c	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/elf/rtld.c
++++ git/elf/rtld.c
 @@ -16,6 +16,7 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -519,7 +519,7 @@ Index: git/elf/rtld.c
  #include <errno.h>
  #include <dlfcn.h>
  #include <fcntl.h>
-@@ -2200,6 +2201,7 @@
+@@ -2200,6 +2201,7 @@ print_missing_version (int errcode __att
  		    objname, errstring);
  }
  
@@ -527,7 +527,7 @@ Index: git/elf/rtld.c
  /* Nonzero if any of the debugging options is enabled.  */
  static int any_debug attribute_relro;
  
-@@ -2309,6 +2311,7 @@
+@@ -2309,6 +2311,7 @@ a filename can be specified using the LD
        _exit (0);
      }
  }
@@ -535,7 +535,7 @@ Index: git/elf/rtld.c
  
  static void
  process_dl_audit (char *str)
-@@ -2376,12 +2379,14 @@
+@@ -2376,12 +2379,14 @@ process_envvars (enum mode *modep)
  	  break;
  
  	case 5:
@@ -550,7 +550,7 @@ Index: git/elf/rtld.c
  	  if (memcmp (envline, "AUDIT", 5) == 0)
  	    process_dl_audit (&envline[6]);
  	  break;
-@@ -2490,7 +2495,9 @@
+@@ -2490,7 +2495,9 @@ process_envvars (enum mode *modep)
  	    {
  	      mode = trace;
  	      GLRO(dl_verbose) = 1;
@@ -560,7 +560,7 @@ Index: git/elf/rtld.c
  	      GLRO(dl_trace_prelink) = &envline[17];
  	    }
  	  break;
-@@ -2537,12 +2544,15 @@
+@@ -2537,12 +2544,15 @@ process_envvars (enum mode *modep)
        if (__access ("/etc/suid-debug", F_OK) != 0)
  	{
  	  unsetenv ("MALLOC_CHECK_");
@@ -576,7 +576,7 @@ Index: git/elf/rtld.c
    /* If we have to run the dynamic linker in debugging mode and the
       LD_DEBUG_OUTPUT environment variable is given, we write the debug
       messages to this file.  */
-@@ -2567,6 +2577,7 @@
+@@ -2567,6 +2577,7 @@ process_envvars (enum mode *modep)
  	/* We use standard output if opening the file failed.  */
  	GLRO(dl_debug_fd) = STDOUT_FILENO;
      }
@@ -586,9 +586,9 @@ Index: git/elf/rtld.c
  
 Index: git/extra-lib.mk
 ===================================================================
---- git.orig/extra-lib.mk	2014-08-29 20:00:46.544070587 -0700
-+++ git/extra-lib.mk	2014-08-29 20:01:15.196070587 -0700
-@@ -25,7 +25,9 @@
+--- git.orig/extra-lib.mk
++++ git/extra-lib.mk
+@@ -25,7 +25,9 @@ install-lib := $(install-lib)
  extra-objs := $(extra-objs)
  
  # The modules that go in $(lib).
@@ -599,7 +599,7 @@ Index: git/extra-lib.mk
  
  # Add each flavor of library to the lists of things to build and install.
  install-lib += $(foreach o,$(object-suffixes-$(lib)),$(lib:lib%=$(libtype$o)))
-@@ -101,7 +103,7 @@
+@@ -101,7 +103,7 @@ endif
  endif
  
  # This will define `libof-ROUTINE := LIB' for each of the routines.
@@ -610,8 +610,8 @@ Index: git/extra-lib.mk
  endif
 Index: git/grp/Makefile
 ===================================================================
---- git.orig/grp/Makefile	2014-08-29 20:00:46.556070587 -0700
-+++ git/grp/Makefile	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/grp/Makefile
++++ git/grp/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for grp portion of the library.
@@ -621,7 +621,7 @@ Index: git/grp/Makefile
  subdir	:= grp
  
  include ../Makeconfig
-@@ -29,6 +31,9 @@
+@@ -29,6 +31,9 @@ routines := fgetgrent initgroups setgrou
  	    getgrent_r getgrgid_r getgrnam_r fgetgrent_r
  
  tests := testgrp
@@ -633,8 +633,8 @@ Index: git/grp/Makefile
  test-srcs :=  tst_fgetgrent
 Index: git/hesiod/Makefile
 ===================================================================
---- git.orig/hesiod/Makefile	2014-08-29 20:00:46.580070587 -0700
-+++ git/hesiod/Makefile	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/hesiod/Makefile
++++ git/hesiod/Makefile
 @@ -18,12 +18,14 @@
  #
  #	Sub-makefile for hesiod portion of the library.
@@ -654,8 +654,8 @@ Index: git/hesiod/Makefile
  vpath %.c nss_hesiod
 Index: git/iconv/gconv_db.c
 ===================================================================
---- git.orig/iconv/gconv_db.c	2014-08-29 20:00:46.604070587 -0700
-+++ git/iconv/gconv_db.c	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/iconv/gconv_db.c
++++ git/iconv/gconv_db.c
 @@ -25,6 +25,7 @@
  #include <sys/param.h>
  #include <bits/libc-lock.h>
@@ -664,7 +664,7 @@ Index: git/iconv/gconv_db.c
  
  #include <dlfcn.h>
  #include <gconv_int.h>
-@@ -828,9 +829,11 @@
+@@ -828,9 +829,11 @@ free_modules_db (struct gconv_module *no
  /* Free all resources if necessary.  */
  libc_freeres_fn (free_mem)
  {
@@ -678,8 +678,8 @@ Index: git/iconv/gconv_db.c
    extern void _nl_finddomain_subfreeres (void) attribute_hidden;
 Index: git/iconv/gconv_trans.c
 ===================================================================
---- git.orig/iconv/gconv_trans.c	2014-08-29 20:00:46.612070587 -0700
-+++ git/iconv/gconv_trans.c	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/iconv/gconv_trans.c
++++ git/iconv/gconv_trans.c
 @@ -23,6 +23,7 @@
  #include <stdint.h>
  #include <string.h>
@@ -688,7 +688,7 @@ Index: git/iconv/gconv_trans.c
  
  #include <bits/libc-lock.h>
  #include "gconv_int.h"
-@@ -59,6 +60,7 @@
+@@ -59,6 +60,7 @@ __gconv_transliterate (struct __gconv_st
      PTR_DEMANGLE (fct);
  #endif
  
@@ -696,7 +696,7 @@ Index: git/iconv/gconv_trans.c
    /* If there is no transliteration information in the locale don't do
       anything and return the error.  */
    size = _NL_CURRENT_WORD (LC_CTYPE, _NL_CTYPE_TRANSLIT_TAB_SIZE);
-@@ -194,6 +196,7 @@
+@@ -194,6 +196,7 @@ __gconv_transliterate (struct __gconv_st
               sorted.  */
  	  break;
      }
@@ -706,8 +706,8 @@ Index: git/iconv/gconv_trans.c
    if (_NL_CURRENT_WORD (LC_CTYPE, _NL_CTYPE_TRANSLIT_DEFAULT_MISSING_LEN) != 0)
 Index: git/iconv/iconv_prog.c
 ===================================================================
---- git.orig/iconv/iconv_prog.c	2014-08-29 20:00:46.612070587 -0700
-+++ git/iconv/iconv_prog.c	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/iconv/iconv_prog.c
++++ git/iconv/iconv_prog.c
 @@ -35,6 +35,7 @@
  #ifdef _POSIX_MAPPED_FILES
  # include <sys/mman.h>
@@ -716,7 +716,7 @@ Index: git/iconv/iconv_prog.c
  #include <charmap.h>
  #include <gconv_int.h>
  #include "iconv_prog.h"
-@@ -221,10 +222,17 @@
+@@ -221,10 +222,17 @@ main (int argc, char *argv[])
  	      bool to_wrong =
  		(iconv_open (to_code, "UTF-8") == (iconv_t) -1
  		 && errno == EINVAL);
@@ -736,8 +736,8 @@ Index: git/iconv/iconv_prog.c
  		{
 Index: git/iconv/Makefile
 ===================================================================
---- git.orig/iconv/Makefile	2014-08-29 20:00:46.600070587 -0700
-+++ git/iconv/Makefile	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/iconv/Makefile
++++ git/iconv/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for iconv.
@@ -747,7 +747,7 @@ Index: git/iconv/Makefile
  subdir	:= iconv
  
  include ../Makeconfig
-@@ -57,6 +59,9 @@
+@@ -57,6 +59,9 @@ CPPFLAGS-linereader = -DNOT_IN_libc
  CPPFLAGS-strtab = -DNOT_IN_libc
  CPPFLAGS-charmap = -DNOT_IN_libc
  CPPFLAGS-charmap-dir = -DNOT_IN_libc
@@ -759,8 +759,8 @@ Index: git/iconv/Makefile
  xtests-special += $(objpfx)test-iconvconfig.out
 Index: git/iconvdata/Makefile
 ===================================================================
---- git.orig/iconvdata/Makefile	2014-08-29 20:00:46.628070587 -0700
-+++ git/iconvdata/Makefile	2014-08-29 20:01:15.196070587 -0700
+--- git.orig/iconvdata/Makefile
++++ git/iconvdata/Makefile
 @@ -18,12 +18,15 @@
  #
  #	Makefile for iconv data and code.
@@ -778,7 +778,7 @@ Index: git/iconvdata/Makefile
  	   ISO8859-6 ISO8859-7 ISO8859-8 ISO8859-9 ISO8859-10		 \
  	   ISO8859-11 ISO8859-13 ISO8859-14 ISO8859-15 ISO8859-16	 \
  	   T.61 ISO_6937 SJIS KOI-8 HP-ROMAN8 HP-ROMAN9 EBCDIC-AT-DE	 \
-@@ -63,11 +66,13 @@
+@@ -63,11 +66,13 @@ modules	:= ISO8859-1 ISO8859-2 ISO8859-3
  	   MAC-CENTRALEUROPE KOI8-RU ISO8859-9E				 \
  	   CP770 CP771 CP772 CP773 CP774
  
@@ -794,7 +794,7 @@ Index: git/iconvdata/Makefile
  ifeq ($(have-thread-library),yes)
  tests += bug-iconv3
  endif
-@@ -130,13 +135,13 @@
+@@ -130,13 +135,13 @@ ifeq (yes,$(build-shared))
  # Rule to generate the shared objects.
  charmaps = ../localedata/charmaps
  -include $(objpfx)iconv-rules
@@ -811,7 +811,7 @@ Index: git/iconvdata/Makefile
  
  # We can build the conversion tables for numerous charsets automatically.
  
-@@ -204,7 +209,7 @@
+@@ -204,7 +209,7 @@ before-compile += $(addprefix $(objpfx),
  ifndef avoid-generated
  $(objpfx)iconv-rules: Makefile
  	$(make-target-directory)
@@ -820,7 +820,7 @@ Index: git/iconvdata/Makefile
  	  echo 8bit $(gen-8bit-modules); \
  	  echo 8bit-gap $(gen-8bit-gap-modules); } | \
  	LC_ALL=C \
-@@ -247,7 +252,7 @@
+@@ -247,7 +252,7 @@ $(addprefix $(inst_gconvdir)/, $(modules
  	$(do-install-program)
  $(inst_gconvdir)/gconv-modules: gconv-modules $(+force)
  	$(do-install)
@@ -829,7 +829,7 @@ Index: git/iconvdata/Makefile
  # Update the $(prefix)/lib/gconv/gconv-modules.cache file. This is necessary
  # if this libc has more gconv modules than the previously installed one.
  	if test -f "$(inst_gconvdir)/gconv-modules.cache"; then \
-@@ -256,9 +261,9 @@
+@@ -256,9 +261,9 @@ ifeq (no,$(cross-compiling))
  	   $(common-objpfx)iconv/iconvconfig \
  	     $(addprefix --prefix=,$(install_root)); \
  	fi
@@ -844,9 +844,9 @@ Index: git/iconvdata/Makefile
  
 Index: git/include/netdb.h
 ===================================================================
---- git.orig/include/netdb.h	2014-08-29 20:00:47.152070587 -0700
-+++ git/include/netdb.h	2014-08-29 20:01:15.196070587 -0700
-@@ -232,6 +232,10 @@
+--- git.orig/include/netdb.h
++++ git/include/netdb.h
+@@ -232,6 +232,10 @@ extern enum nss_status _nss_ ## service
  		       (const char *name, int af, struct hostent *host,	      \
  			char *buffer, size_t buflen, int *errnop,	      \
  			int *h_errnop);					      \
@@ -859,8 +859,8 @@ Index: git/include/netdb.h
  			size_t buflen, int *errnop, int *h_errnop);	      \
 Index: git/inet/Makefile
 ===================================================================
---- git.orig/inet/Makefile	2014-08-29 20:00:47.176070587 -0700
-+++ git/inet/Makefile	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/inet/Makefile
++++ git/inet/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for inet portion of the library.
@@ -870,7 +870,7 @@ Index: git/inet/Makefile
  subdir	:= inet
  
  include ../Makeconfig
-@@ -27,7 +29,8 @@
+@@ -27,7 +29,8 @@ headers	:= netinet/ether.h netinet/in.h
  	   netinet/tcp.h netinet/ip.h $(wildcard arpa/*.h protocols/*.h) \
  	   aliases.h ifaddrs.h netinet/ip6.h netinet/icmp6.h bits/in.h
  
@@ -880,7 +880,7 @@ Index: git/inet/Makefile
  	    inet_lnaof inet_mkadr	\
  	    inet_netof inet_ntoa inet_net herrno herrno-loc \
  	    gethstbyad gethstbyad_r gethstbynm gethstbynm2 gethstbynm2_r \
-@@ -41,18 +44,23 @@
+@@ -41,18 +44,23 @@ routines := htonl htons		\
  	    getrpcent_r getrpcbyname_r getrpcbynumber_r \
  	    ether_aton ether_aton_r ether_hton ether_line \
  	    ether_ntoa ether_ntoa_r ether_ntoh \
@@ -912,9 +912,9 @@ Index: git/inet/Makefile
  
 Index: git/intl/dcigettext.c
 ===================================================================
---- git.orig/intl/dcigettext.c	2014-08-29 20:00:47.224070587 -0700
-+++ git/intl/dcigettext.c	2014-08-29 20:01:15.200070587 -0700
-@@ -77,6 +77,10 @@
+--- git.orig/intl/dcigettext.c
++++ git/intl/dcigettext.c
+@@ -77,6 +77,10 @@ extern int errno;
  #endif
  #include "hash-string.h"
  
@@ -925,7 +925,7 @@ Index: git/intl/dcigettext.c
  /* Thread safetyness.  */
  #ifdef _LIBC
  # include <bits/libc-lock.h>
-@@ -449,9 +453,11 @@
+@@ -449,9 +453,11 @@ DCIGETTEXT (domainname, msgid1, msgid2,
  #endif
  
  #ifdef _LIBC
@@ -937,7 +937,7 @@ Index: git/intl/dcigettext.c
  
    __libc_rwlock_rdlock (_nl_state_lock);
  
-@@ -470,7 +476,11 @@
+@@ -470,7 +476,11 @@ DCIGETTEXT (domainname, msgid1, msgid2,
    search.category = category;
  # ifdef HAVE_PER_THREAD_LOCALE
  #  ifdef _LIBC
@@ -949,7 +949,7 @@ Index: git/intl/dcigettext.c
  #  endif
    search.localename = localename;
  # endif
-@@ -494,7 +504,9 @@
+@@ -494,7 +504,9 @@ DCIGETTEXT (domainname, msgid1, msgid2,
  	retval = (char *) (*foundp)->translation;
  
  # ifdef _LIBC
@@ -959,7 +959,7 @@ Index: git/intl/dcigettext.c
  # endif
        __libc_rwlock_unlock (_nl_state_lock);
        return retval;
-@@ -611,7 +623,9 @@
+@@ -611,7 +623,9 @@ DCIGETTEXT (domainname, msgid1, msgid2,
  	{
  	no_translation:
  	  FREE_BLOCKS (block_list);
@@ -969,7 +969,7 @@ Index: git/intl/dcigettext.c
  	  __libc_rwlock_unlock (_nl_state_lock);
  	  __set_errno (saved_errno);
  	  return (plural == 0
-@@ -730,7 +744,9 @@
+@@ -730,7 +744,9 @@ DCIGETTEXT (domainname, msgid1, msgid2,
  	      if (plural)
  		retval = plural_lookup (domain, n, retval, retlen);
  
@@ -979,7 +979,7 @@ Index: git/intl/dcigettext.c
  	      __libc_rwlock_unlock (_nl_state_lock);
  	      return retval;
  	    }
-@@ -1361,7 +1377,11 @@
+@@ -1361,7 +1377,11 @@ guess_category_value (category, category
       `LC_xxx', and `LANG'.  On some systems this can be done by the
       `setlocale' function itself.  */
  #ifdef _LIBC
@@ -993,8 +993,8 @@ Index: git/intl/dcigettext.c
  #endif
 Index: git/intl/Makefile
 ===================================================================
---- git.orig/intl/Makefile	2014-08-29 20:00:47.220070587 -0700
-+++ git/intl/Makefile	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/intl/Makefile
++++ git/intl/Makefile
 @@ -16,6 +16,7 @@
  # <http://www.gnu.org/licenses/>.
  
@@ -1003,7 +1003,7 @@ Index: git/intl/Makefile
  
  subdir = intl
  
-@@ -48,7 +49,7 @@
+@@ -48,7 +49,7 @@ endif
  $(objpfx)plural.o: plural.c
  
  ifeq ($(run-built-tests),yes)
@@ -1014,8 +1014,8 @@ Index: git/intl/Makefile
  		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
 Index: git/io/Makefile
 ===================================================================
---- git.orig/io/Makefile	2014-08-29 20:00:47.244070587 -0700
-+++ git/io/Makefile	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/io/Makefile
++++ git/io/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for I/O portion of the library.
@@ -1025,7 +1025,7 @@ Index: git/io/Makefile
  subdir	:= io
  
  include ../Makeconfig
-@@ -36,7 +38,7 @@
+@@ -36,7 +38,7 @@ routines :=								\
  	fxstatat fxstatat64						\
  	statfs fstatfs statfs64 fstatfs64				\
  	statvfs fstatvfs statvfs64 fstatvfs64				\
@@ -1034,7 +1034,7 @@ Index: git/io/Makefile
  	mkdir mkdirat							\
  	open open_2 open64 open64_2 openat openat_2 openat64 openat64_2	\
  	read write lseek lseek64 access euidaccess faccessat		\
-@@ -49,11 +51,13 @@
+@@ -49,11 +51,13 @@ routines :=								\
  	ttyname ttyname_r isatty					\
  	link linkat symlink symlinkat readlink readlinkat		\
  	unlink unlinkat rmdir						\
@@ -1049,7 +1049,7 @@ Index: git/io/Makefile
  
  aux := have_o_cloexec
  
-@@ -64,18 +68,22 @@
+@@ -64,18 +68,22 @@ static-only-routines = stat fstat lstat
  		       fstatat fstatat64 mknod mknodat
  
  others		:= pwd
@@ -1077,8 +1077,8 @@ Index: git/io/Makefile
  
 Index: git/libidn/Makefile
 ===================================================================
---- git.orig/libidn/Makefile	2014-08-29 20:00:47.316070587 -0700
-+++ git/libidn/Makefile	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/libidn/Makefile
++++ git/libidn/Makefile
 @@ -16,6 +16,7 @@
  # <http://www.gnu.org/licenses/>.
  
@@ -1087,7 +1087,7 @@ Index: git/libidn/Makefile
  
  subdir	:= libidn
  
-@@ -23,8 +24,8 @@
+@@ -23,8 +24,8 @@ include ../Makeconfig
  
  routines = idn-stub
  
@@ -1100,8 +1100,8 @@ Index: git/libidn/Makefile
  		    iconvme
 Index: git/libidn/toutf8.c
 ===================================================================
---- git.orig/libidn/toutf8.c	2014-08-29 20:00:47.332070587 -0700
-+++ git/libidn/toutf8.c	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/libidn/toutf8.c
++++ git/libidn/toutf8.c
 @@ -33,6 +33,11 @@
  /* Get strlen. */
  #include <string.h>
@@ -1129,8 +1129,8 @@ Index: git/libidn/toutf8.c
   * stringprep_locale_charset - return charset used in current locale
 Index: git/libio/fileops.c
 ===================================================================
---- git.orig/libio/fileops.c	2014-08-29 20:00:47.352070587 -0700
-+++ git/libio/fileops.c	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/libio/fileops.c
++++ git/libio/fileops.c
 @@ -38,6 +38,7 @@
  #include <string.h>
  #include <errno.h>
@@ -1139,7 +1139,7 @@ Index: git/libio/fileops.c
  #include <stdlib.h>
  #if _LIBC
  # include "../wcsmbs/wcsmbsload.h"
-@@ -174,7 +175,7 @@
+@@ -174,7 +175,7 @@ _IO_new_file_close_it (fp)
  
    /* Free buffer. */
  #if defined _LIBC || defined _GLIBCPP_USE_WCHAR_T
@@ -1148,7 +1148,7 @@ Index: git/libio/fileops.c
      {
        if (_IO_have_wbackup (fp))
  	_IO_free_wbackup_area (fp);
-@@ -359,6 +360,7 @@
+@@ -359,6 +360,7 @@ _IO_new_file_fopen (fp, filename, mode,
        cs = strstr (last_recognized + 1, ",ccs=");
        if (cs != NULL)
  	{
@@ -1156,7 +1156,7 @@ Index: git/libio/fileops.c
  	  /* Yep.  Load the appropriate conversions and set the orientation
  	     to wide.  */
  	  struct gconv_fcts fcts;
-@@ -423,6 +425,12 @@
+@@ -423,6 +425,12 @@ _IO_new_file_fopen (fp, filename, mode,
  
  	  /* Set the mode now.  */
  	  result->_mode = 1;
@@ -1171,8 +1171,8 @@ Index: git/libio/fileops.c
  
 Index: git/libio/__fpurge.c
 ===================================================================
---- git.orig/libio/__fpurge.c	2014-08-29 20:00:47.336070587 -0700
-+++ git/libio/__fpurge.c	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/libio/__fpurge.c
++++ git/libio/__fpurge.c
 @@ -21,7 +21,7 @@
  void
  __fpurge (FILE *fp)
@@ -1184,8 +1184,8 @@ Index: git/libio/__fpurge.c
        if (_IO_in_backup (fp))
 Index: git/libio/iofwide.c
 ===================================================================
---- git.orig/libio/iofwide.c	2014-08-29 20:00:47.360070587 -0700
-+++ git/libio/iofwide.c	2014-08-29 20:01:15.200070587 -0700
+--- git.orig/libio/iofwide.c
++++ git/libio/iofwide.c
 @@ -26,6 +26,7 @@
  
  #include <libioP.h>
@@ -1203,7 +1203,7 @@ Index: git/libio/iofwide.c
  /* Prototypes of libio's codecvt functions.  */
  static enum __codecvt_result do_out (struct _IO_codecvt *codecvt,
  				     __mbstate_t *statep,
-@@ -513,3 +516,26 @@
+@@ -513,3 +516,26 @@ do_max_length (struct _IO_codecvt *codec
    return MB_CUR_MAX;
  #endif
  }
@@ -1232,9 +1232,9 @@ Index: git/libio/iofwide.c
 +#endif
 Index: git/libio/ioseekoff.c
 ===================================================================
---- git.orig/libio/ioseekoff.c	2014-08-29 20:00:47.364070587 -0700
-+++ git/libio/ioseekoff.c	2014-08-29 20:01:15.200070587 -0700
-@@ -60,7 +60,7 @@
+--- git.orig/libio/ioseekoff.c
++++ git/libio/ioseekoff.c
+@@ -60,7 +60,7 @@ _IO_seekoff_unlocked (fp, offset, dir, m
  	  else
  	    abort ();
  	}
@@ -1245,9 +1245,9 @@ Index: git/libio/ioseekoff.c
  	_IO_free_wbackup_area (fp);
 Index: git/libio/ioseekpos.c
 ===================================================================
---- git.orig/libio/ioseekpos.c	2014-08-29 20:00:47.364070587 -0700
-+++ git/libio/ioseekpos.c	2014-08-29 20:01:15.200070587 -0700
-@@ -35,7 +35,7 @@
+--- git.orig/libio/ioseekpos.c
++++ git/libio/ioseekpos.c
+@@ -35,7 +35,7 @@ _IO_seekpos_unlocked (fp, pos, mode)
    /* If we have a backup buffer, get rid of it, since the __seekoff
       callback may not know to do the right thing about it.
       This may be over-kill, but it'll do for now. TODO */
@@ -1258,8 +1258,8 @@ Index: git/libio/ioseekpos.c
  	_IO_free_backup_area (fp);
 Index: git/libio/iosetbuffer.c
 ===================================================================
---- git.orig/libio/iosetbuffer.c	2014-08-29 20:00:47.364070587 -0700
-+++ git/libio/iosetbuffer.c	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/libio/iosetbuffer.c
++++ git/libio/iosetbuffer.c
 @@ -24,6 +24,8 @@
     This exception applies to code released by its copyright holders
     in files containing the exception.  */
@@ -1269,7 +1269,7 @@ Index: git/libio/iosetbuffer.c
  #include "libioP.h"
  
  void
-@@ -38,9 +40,11 @@
+@@ -38,9 +40,11 @@ _IO_setbuffer (fp, buf, size)
    if (!buf)
      size = 0;
    (void) _IO_SETBUF (fp, buf, size);
@@ -1283,8 +1283,8 @@ Index: git/libio/iosetbuffer.c
  libc_hidden_def (_IO_setbuffer)
 Index: git/libio/libioP.h
 ===================================================================
---- git.orig/libio/libioP.h	2014-08-29 20:00:47.372070587 -0700
-+++ git/libio/libioP.h	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/libio/libioP.h
++++ git/libio/libioP.h
 @@ -42,6 +42,10 @@
  /*# include <comthread.h>*/
  #endif
@@ -1296,7 +1296,7 @@ Index: git/libio/libioP.h
  #include <math_ldbl_opt.h>
  
  #include "iolibio.h"
-@@ -508,8 +512,20 @@
+@@ -508,8 +512,20 @@ extern void _IO_old_init (_IO_FILE *fp,
  
  
  #if defined _LIBC || defined _GLIBCPP_USE_WCHAR_T
@@ -1320,8 +1320,8 @@ Index: git/libio/libioP.h
     : _IO_wdo_write(_f, (_f)->_wide_data->_IO_write_base,		      \
 Index: git/libio/Makefile
 ===================================================================
---- git.orig/libio/Makefile	2014-08-29 20:00:47.332070587 -0700
-+++ git/libio/Makefile	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/libio/Makefile
++++ git/libio/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Specific makefile for libio.
@@ -1331,7 +1331,7 @@ Index: git/libio/Makefile
  subdir	:= libio
  
  include ../Makeconfig
-@@ -27,16 +29,13 @@
+@@ -27,16 +29,13 @@ headers	:= stdio.h libio.h _G_config.h b
  
  routines	:=							      \
  	filedoalloc iofclose iofdopen iofflush iofgetpos iofgets iofopen      \
@@ -1351,7 +1351,7 @@ Index: git/libio/Makefile
  									      \
  	clearerr feof ferror fileno fputc freopen fseek getc getchar	      \
  	memstream pclose putc putchar rewind setbuf setlinebuf vasprintf      \
-@@ -47,25 +46,48 @@
+@@ -47,25 +46,48 @@ routines	:=							      \
  	__fpurge __fpending __fsetlocking				      \
  									      \
  	libc_fatal fmemopen
@@ -1416,7 +1416,7 @@ Index: git/libio/Makefile
  endif
  test-srcs = test-freopen
  
-@@ -164,13 +186,17 @@
+@@ -164,13 +186,17 @@ shared-only-routines = oldiofopen oldiof
  		       oldiofsetpos64
  
  ifeq ($(run-built-tests),yes)
@@ -1436,8 +1436,8 @@ Index: git/libio/Makefile
  
 Index: git/libio/wdummyfileops.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libio/wdummyfileops.c	2014-08-29 20:01:15.204070587 -0700
+--- /dev/null
++++ git/libio/wdummyfileops.c
 @@ -0,0 +1,161 @@
 +/* Copyright (C) 2007 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -1602,8 +1602,8 @@ Index: git/libio/wdummyfileops.c
 +strong_alias (_IO_wfile_jumps_disabled, _IO_wfile_jumps_maybe_mmap)
 Index: git/locale/catnames.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/locale/catnames.c	2014-08-29 20:01:15.204070587 -0700
+--- /dev/null
++++ git/locale/catnames.c
 @@ -0,0 +1,48 @@
 +/* Copyright (C) 2006  Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -1655,8 +1655,8 @@ Index: git/locale/catnames.c
 +  };
 Index: git/locale/C-ctype.c
 ===================================================================
---- git.orig/locale/C-ctype.c	2014-08-29 20:00:47.396070587 -0700
-+++ git/locale/C-ctype.c	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/locale/C-ctype.c
++++ git/locale/C-ctype.c
 @@ -19,8 +19,11 @@
  #include "localeinfo.h"
  #include <endian.h>
@@ -1669,7 +1669,7 @@ Index: git/locale/C-ctype.c
  
  /* This table's entries are taken from POSIX.2 Table 2-6
     ``LC_CTYPE Category Definition in the POSIX Locale''.
-@@ -647,6 +650,7 @@
+@@ -647,6 +650,7 @@ const struct __locale_data _nl_C_LC_CTYP
      { .word = L'7' },
      { .word = L'8' },
      { .word = L'9' },
@@ -1677,7 +1677,7 @@ Index: git/locale/C-ctype.c
      /* _NL_CTYPE_TRANSLIT_TAB_SIZE */
      { .word = NTRANSLIT },
      /* _NL_CTYPE_TRANSLIT_FROM_IDX */
-@@ -657,6 +661,22 @@
+@@ -657,6 +661,22 @@ const struct __locale_data _nl_C_LC_CTYP
      { .wstr = translit_to_idx },
      /* _NL_CTYPE_TRANSLIT_TO_TBL */
      { .wstr = (uint32_t *) translit_to_tbl },
@@ -1702,8 +1702,8 @@ Index: git/locale/C-ctype.c
      /* _NL_CTYPE_TRANSLIT_DEFAULT_MISSING */
 Index: git/locale/dummy-setlocale.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/locale/dummy-setlocale.c	2014-08-29 20:01:15.204070587 -0700
+--- /dev/null
++++ git/locale/dummy-setlocale.c
 @@ -0,0 +1,33 @@
 +/* Copyright (C) 2006  Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -1740,9 +1740,9 @@ Index: git/locale/dummy-setlocale.c
 +libc_hidden_def (setlocale)
 Index: git/locale/localeinfo.h
 ===================================================================
---- git.orig/locale/localeinfo.h	2014-08-29 20:00:47.404070587 -0700
-+++ git/locale/localeinfo.h	2014-08-29 20:01:15.204070587 -0700
-@@ -224,7 +224,7 @@
+--- git.orig/locale/localeinfo.h
++++ git/locale/localeinfo.h
+@@ -224,7 +224,7 @@ __libc_tsd_define (extern, __locale_t, L
     unused.  We can manage this playing some tricks with weak references.
     But with thread-local locale settings, it becomes quite ungainly unless
     we can use __thread variables.  So only in that case do we attempt this.  */
@@ -1753,8 +1753,8 @@ Index: git/locale/localeinfo.h
  #endif
 Index: git/locale/Makefile
 ===================================================================
---- git.orig/locale/Makefile	2014-08-29 20:00:47.400070587 -0700
-+++ git/locale/Makefile	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/locale/Makefile
++++ git/locale/Makefile
 @@ -18,27 +18,43 @@
  #
  #	Makefile for locales.
@@ -1810,7 +1810,7 @@ Index: git/locale/Makefile
  
  libBrokenLocale-routines = broken_cur_max
  
-@@ -94,6 +110,9 @@
+@@ -94,6 +110,9 @@ CPPFLAGS-locale-programs = -DLOCALE_PATH
  CFLAGS-charmap.c = -Wno-write-strings -Wno-char-subscripts
  CFLAGS-locfile.c = -Wno-write-strings -Wno-char-subscripts
  CFLAGS-charmap-dir.c = -Wno-write-strings
@@ -1822,8 +1822,8 @@ Index: git/locale/Makefile
  cpp-srcs-left := $(addsuffix .c,$(localedef-modules) $(localedef-aux) \
 Index: git/locale/programs/charmap-dir.c
 ===================================================================
---- git.orig/locale/programs/charmap-dir.c	2014-08-29 20:00:47.408070587 -0700
-+++ git/locale/programs/charmap-dir.c	2014-08-29 20:01:15.204070587 -0700
+--- git.orig/locale/programs/charmap-dir.c
++++ git/locale/programs/charmap-dir.c
 @@ -19,7 +19,9 @@
  #include <error.h>
  #include <fcntl.h>
@@ -1834,7 +1834,7 @@ Index: git/locale/programs/charmap-dir.c
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
-@@ -156,6 +158,7 @@
+@@ -156,6 +158,7 @@ charmap_closedir (CHARMAP_DIR *cdir)
    return closedir (dir);
  }
  
@@ -1842,7 +1842,7 @@ Index: git/locale/programs/charmap-dir.c
  /* Creates a subprocess decompressing the given pathname, and returns
     a stream reading its output (the decompressed data).  */
  static
-@@ -204,6 +207,7 @@
+@@ -204,6 +207,7 @@ fopen_uncompressed (const char *pathname
      }
    return NULL;
  }
@@ -1850,7 +1850,7 @@ Index: git/locale/programs/charmap-dir.c
  
  /* Opens a charmap for reading, given its name (not an alias name).  */
  FILE *
-@@ -226,6 +230,7 @@
+@@ -226,6 +230,7 @@ charmap_open (const char *directory, con
    if (stream != NULL)
      return stream;
  
@@ -1858,7 +1858,7 @@ Index: git/locale/programs/charmap-dir.c
    memcpy (p, ".gz", 4);
    stream = fopen_uncompressed (pathname, "gzip");
    if (stream != NULL)
-@@ -235,6 +240,7 @@
+@@ -235,6 +240,7 @@ charmap_open (const char *directory, con
    stream = fopen_uncompressed (pathname, "bzip2");
    if (stream != NULL)
      return stream;
@@ -1866,7 +1866,7 @@ Index: git/locale/programs/charmap-dir.c
  
    return NULL;
  }
-@@ -263,8 +269,8 @@
+@@ -263,8 +269,8 @@ charmap_aliases (const char *directory,
        char *alias = NULL;
        char junk[BUFSIZ];
  
@@ -1879,9 +1879,9 @@ Index: git/locale/programs/charmap-dir.c
                                          (naliases + 2) * sizeof (char *));
 Index: git/locale/programs/ld-collate.c
 ===================================================================
---- git.orig/locale/programs/ld-collate.c	2014-08-29 20:00:47.408070587 -0700
-+++ git/locale/programs/ld-collate.c	2014-08-29 20:01:15.208070587 -0700
-@@ -350,7 +350,7 @@
+--- git.orig/locale/programs/ld-collate.c
++++ git/locale/programs/ld-collate.c
+@@ -350,7 +350,7 @@ new_element (struct locale_collate_t *co
      }
    if (wcs != NULL)
      {
@@ -1890,7 +1890,7 @@ Index: git/locale/programs/ld-collate.c
        uint32_t zero = 0;
        /* Handle <U0000> as a single character.  */
        if (nwcs == 0)
-@@ -1776,8 +1776,7 @@
+@@ -1776,8 +1776,7 @@ symbol `%s' has the same encoding as"),
  
  	      if ((*eptr)->nwcs == runp->nwcs)
  		{
@@ -1900,7 +1900,7 @@ Index: git/locale/programs/ld-collate.c
  
  		  if (c == 0)
  		    {
-@@ -2010,9 +2009,9 @@
+@@ -2010,9 +2009,9 @@ add_to_tablewc (uint32_t ch, struct elem
  	     one consecutive entry.  */
  	  if (runp->wcnext != NULL
  	      && runp->nwcs == runp->wcnext->nwcs
@@ -1913,7 +1913,7 @@ Index: git/locale/programs/ld-collate.c
  	      && (runp->wcs[runp->nwcs - 1]
  		  == runp->wcnext->wcs[runp->nwcs - 1] + 1))
  	    {
-@@ -2036,9 +2035,9 @@
+@@ -2036,9 +2035,9 @@ add_to_tablewc (uint32_t ch, struct elem
  		runp = runp->wcnext;
  	      while (runp->wcnext != NULL
  		     && runp->nwcs == runp->wcnext->nwcs
@@ -1928,9 +1928,9 @@ Index: git/locale/programs/ld-collate.c
  
 Index: git/locale/programs/ld-ctype.c
 ===================================================================
---- git.orig/locale/programs/ld-ctype.c	2014-08-29 20:00:47.408070587 -0700
-+++ git/locale/programs/ld-ctype.c	2014-08-29 20:01:15.208070587 -0700
-@@ -957,7 +957,7 @@
+--- git.orig/locale/programs/ld-ctype.c
++++ git/locale/programs/ld-ctype.c
+@@ -957,7 +957,7 @@ ctype_output (struct localedef_t *locale
    allocate_arrays (ctype, charmap, ctype->repertoire);
  
    default_missing_len = (ctype->default_missing
@@ -1939,7 +1939,7 @@ Index: git/locale/programs/ld-ctype.c
  			 : 0);
  
    init_locale_data (&file, nelems);
-@@ -1968,7 +1968,7 @@
+@@ -1968,7 +1968,7 @@ read_translit_entry (struct linereader *
  	    ignore = 1;
  	  else
  	    /* This value is usable.  */
@@ -1948,7 +1948,7 @@ Index: git/locale/programs/ld-ctype.c
  
  	  first = 0;
  	}
-@@ -2516,8 +2516,8 @@
+@@ -2516,8 +2516,8 @@ with character code range values one mus
  	    }
  
  	handle_tok_digit:
@@ -1959,7 +1959,7 @@ Index: git/locale/programs/ld-ctype.c
  	  handle_digits = 1;
  	  goto read_charclass;
  
-@@ -4001,8 +4001,7 @@
+@@ -4001,8 +4001,7 @@ allocate_arrays (struct locale_ctype_t *
  
  	  while (idx < number)
  	    {
@@ -1969,7 +1969,7 @@ Index: git/locale/programs/ld-ctype.c
  	      if (res == 0)
  		{
  		  replace = 1;
-@@ -4039,11 +4038,11 @@
+@@ -4039,11 +4038,11 @@ allocate_arrays (struct locale_ctype_t *
        for (cnt = 0; cnt < number; ++cnt)
  	{
  	  struct translit_to_t *srunp;
@@ -1983,7 +1983,7 @@ Index: git/locale/programs/ld-ctype.c
  	      srunp = srunp->next;
  	    }
  	  /* Plus one for the extra NUL character marking the end of
-@@ -4067,18 +4066,18 @@
+@@ -4067,18 +4066,18 @@ allocate_arrays (struct locale_ctype_t *
  	  ctype->translit_from_idx[cnt] = from_len;
  	  ctype->translit_to_idx[cnt] = to_len;
  
@@ -2010,8 +2010,8 @@ Index: git/locale/programs/ld-ctype.c
  	    }
 Index: git/locale/programs/ld-messages.c
 ===================================================================
---- git.orig/locale/programs/ld-messages.c	2014-08-29 20:00:47.412070587 -0700
-+++ git/locale/programs/ld-messages.c	2014-08-29 20:01:15.208070587 -0700
+--- git.orig/locale/programs/ld-messages.c
++++ git/locale/programs/ld-messages.c
 @@ -25,6 +25,7 @@
  #include <string.h>
  #include <stdint.h>
@@ -2020,7 +2020,7 @@ Index: git/locale/programs/ld-messages.c
  
  #include <assert.h>
  
-@@ -124,6 +125,7 @@
+@@ -124,6 +125,7 @@ No definition for %s category found"), "
      }
    else
      {
@@ -2028,7 +2028,7 @@ Index: git/locale/programs/ld-messages.c
        int result;
        regex_t re;
  
-@@ -140,6 +142,7 @@
+@@ -140,6 +142,7 @@ No definition for %s category found"), "
  	}
        else if (result != 0)
  	regfree (&re);
@@ -2036,7 +2036,7 @@ Index: git/locale/programs/ld-messages.c
      }
  
    if (messages->noexpr == NULL)
-@@ -158,6 +161,7 @@
+@@ -158,6 +161,7 @@ No definition for %s category found"), "
      }
    else
      {
@@ -2044,7 +2044,7 @@ Index: git/locale/programs/ld-messages.c
        int result;
        regex_t re;
  
-@@ -174,6 +178,7 @@
+@@ -174,6 +178,7 @@ No definition for %s category found"), "
  	}
        else if (result != 0)
  	regfree (&re);
@@ -2054,9 +2054,9 @@ Index: git/locale/programs/ld-messages.c
  
 Index: git/locale/programs/ld-time.c
 ===================================================================
---- git.orig/locale/programs/ld-time.c	2014-08-29 20:00:47.412070587 -0700
-+++ git/locale/programs/ld-time.c	2014-08-29 20:01:15.208070587 -0700
-@@ -215,8 +215,10 @@
+--- git.orig/locale/programs/ld-time.c
++++ git/locale/programs/ld-time.c
+@@ -215,8 +215,10 @@ No definition for %s category found"), "
  	}
        else
  	{
@@ -2068,7 +2068,7 @@ Index: git/locale/programs/ld-time.c
  	}
      }
  
-@@ -226,7 +228,7 @@
+@@ -226,7 +228,7 @@ No definition for %s category found"), "
        const int days_per_month[12] = { 31, 29, 31, 30, 31, 30,
  				       31, 31, 30, 31 ,30, 31 };
        size_t idx;
@@ -2077,7 +2077,7 @@ Index: git/locale/programs/ld-time.c
  
        time->era_entries =
  	(struct era_data *) xmalloc (time->num_era
-@@ -464,18 +466,18 @@
+@@ -464,18 +466,18 @@ No definition for %s category found"), "
  	    }
  
  	  /* Now generate the wide character name and format.  */
@@ -2103,7 +2103,7 @@ Index: git/locale/programs/ld-time.c
  		}
  	      else
  		time->era_entries[idx].wname =
-@@ -530,7 +532,16 @@
+@@ -530,7 +532,16 @@ No definition for %s category found"), "
    if (time->date_fmt == NULL)
      time->date_fmt = "%a %b %e %H:%M:%S %Z %Y";
    if (time->wdate_fmt == NULL)
@@ -2123,9 +2123,9 @@ Index: git/locale/programs/ld-time.c
  
 Index: git/locale/programs/linereader.c
 ===================================================================
---- git.orig/locale/programs/linereader.c	2014-08-29 20:00:47.412070587 -0700
-+++ git/locale/programs/linereader.c	2014-08-29 20:01:15.208070587 -0700
-@@ -595,7 +595,7 @@
+--- git.orig/locale/programs/linereader.c
++++ git/locale/programs/linereader.c
+@@ -595,7 +595,7 @@ get_string (struct linereader *lr, const
  {
    int return_widestr = lr->return_widestr;
    char *buf;
@@ -2136,9 +2136,9 @@ Index: git/locale/programs/linereader.c
  
 Index: git/locale/programs/localedef.c
 ===================================================================
---- git.orig/locale/programs/localedef.c	2014-08-29 20:00:47.416070587 -0700
-+++ git/locale/programs/localedef.c	2014-08-29 20:01:15.208070587 -0700
-@@ -114,6 +114,7 @@
+--- git.orig/locale/programs/localedef.c
++++ git/locale/programs/localedef.c
+@@ -114,6 +114,7 @@ void (*argp_program_version_hook) (FILE
  #define OPT_LIST_ARCHIVE 309
  #define OPT_LITTLE_ENDIAN 400
  #define OPT_BIG_ENDIAN 401
@@ -2146,7 +2146,7 @@ Index: git/locale/programs/localedef.c
  
  /* Definitions of arguments for argp functions.  */
  static const struct argp_option options[] =
-@@ -150,6 +151,8 @@
+@@ -150,6 +151,8 @@ static const struct argp_option options[
      N_("Generate little-endian output") },
    { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
      N_("Generate big-endian output") },
@@ -2155,7 +2155,7 @@ Index: git/locale/programs/localedef.c
    { NULL, 0, NULL, 0, NULL }
  };
  
-@@ -239,12 +242,14 @@
+@@ -239,12 +242,14 @@ main (int argc, char *argv[])
       ctype locale.  (P1003.2 4.35.5.2)  */
    setlocale (LC_CTYPE, "POSIX");
  
@@ -2170,7 +2170,7 @@ Index: git/locale/programs/localedef.c
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -338,6 +343,9 @@
+@@ -338,6 +343,9 @@ parse_opt (int key, char *arg, struct ar
      case OPT_BIG_ENDIAN:
        set_big_endian (true);
        break;
@@ -2182,9 +2182,9 @@ Index: git/locale/programs/localedef.c
        break;
 Index: git/locale/programs/locfile.c
 ===================================================================
---- git.orig/locale/programs/locfile.c	2014-08-29 20:00:47.432070587 -0700
-+++ git/locale/programs/locfile.c	2014-08-29 20:01:15.208070587 -0700
-@@ -544,6 +544,9 @@
+--- git.orig/locale/programs/locfile.c
++++ git/locale/programs/locfile.c
+@@ -544,6 +544,9 @@ compare_files (const char *filename1, co
     machine running localedef.  */
  bool swap_endianness_p;
  
@@ -2194,7 +2194,7 @@ Index: git/locale/programs/locfile.c
  /* When called outside a start_locale_structure/end_locale_structure
     or start_locale_prelude/end_locale_prelude block, record that the
     next byte in FILE's obstack will be the first byte of a new element.
-@@ -621,7 +624,7 @@
+@@ -621,7 +624,7 @@ add_locale_string (struct locale_file *f
  void
  add_locale_wstring (struct locale_file *file, const uint32_t *string)
  {
@@ -2205,9 +2205,9 @@ Index: git/locale/programs/locfile.c
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 Index: git/locale/programs/locfile.h
 ===================================================================
---- git.orig/locale/programs/locfile.h	2014-08-29 20:00:47.432070587 -0700
-+++ git/locale/programs/locfile.h	2014-08-29 20:01:15.208070587 -0700
-@@ -71,6 +71,8 @@
+--- git.orig/locale/programs/locfile.h
++++ git/locale/programs/locfile.h
+@@ -71,6 +71,8 @@ extern void write_all_categories (struct
  
  extern bool swap_endianness_p;
  
@@ -2216,7 +2216,7 @@ Index: git/locale/programs/locfile.h
  /* Change the output to be big-endian if BIG_ENDIAN is true and
     little-endian otherwise.  */
  static inline void
-@@ -275,4 +277,49 @@
+@@ -275,4 +277,49 @@ extern void identification_output (struc
  				   const struct charmap_t *charmap,
  				   const char *output_path);
  
@@ -2268,9 +2268,9 @@ Index: git/locale/programs/locfile.h
  #endif /* locfile.h */
 Index: git/locale/setlocale.c
 ===================================================================
---- git.orig/locale/setlocale.c	2014-08-29 20:00:47.432070587 -0700
-+++ git/locale/setlocale.c	2014-08-29 20:01:15.208070587 -0700
-@@ -64,36 +64,6 @@
+--- git.orig/locale/setlocale.c
++++ git/locale/setlocale.c
+@@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
  #endif
  
  
@@ -2309,8 +2309,8 @@ Index: git/locale/setlocale.c
  #else
 Index: git/locale/xlocale.c
 ===================================================================
---- git.orig/locale/xlocale.c	2014-08-29 20:00:47.436070587 -0700
-+++ git/locale/xlocale.c	2014-08-29 20:01:15.208070587 -0700
+--- git.orig/locale/xlocale.c
++++ git/locale/xlocale.c
 @@ -18,6 +18,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -2319,7 +2319,7 @@ Index: git/locale/xlocale.c
  #include "localeinfo.h"
  
  #define DEFINE_CATEGORY(category, category_name, items, a) \
-@@ -25,6 +26,19 @@
+@@ -25,6 +26,19 @@ extern struct __locale_data _nl_C_##cate
  #include "categories.def"
  #undef	DEFINE_CATEGORY
  
@@ -2339,7 +2339,7 @@ Index: git/locale/xlocale.c
  /* Defined in locale/C-ctype.c.  */
  extern const char _nl_C_LC_CTYPE_class[] attribute_hidden;
  extern const char _nl_C_LC_CTYPE_toupper[] attribute_hidden;
-@@ -52,3 +66,26 @@
+@@ -52,3 +66,26 @@ const struct __locale_struct _nl_C_locob
      .__ctype_tolower = (const int *) _nl_C_LC_CTYPE_tolower + 128,
      .__ctype_toupper = (const int *) _nl_C_LC_CTYPE_toupper + 128
    };
@@ -2368,9 +2368,9 @@ Index: git/locale/xlocale.c
 +#endif /* __OPTION_EGLIBC_LOCALE_CODE */
 Index: git/localedata/Makefile
 ===================================================================
---- git.orig/localedata/Makefile	2014-08-29 20:00:47.444070587 -0700
-+++ git/localedata/Makefile	2014-08-29 20:01:15.212070587 -0700
-@@ -21,12 +21,22 @@
+--- git.orig/localedata/Makefile
++++ git/localedata/Makefile
+@@ -21,12 +21,22 @@ subdir := localedata
  
  include ../Makeconfig
  
@@ -2396,7 +2396,7 @@ Index: git/localedata/Makefile
  
  subdir-dirs = tests-mbwc
  vpath %.c tests-mbwc
-@@ -71,14 +81,20 @@
+@@ -71,14 +81,20 @@ locale_test_suite := tst_iswalnum tst_is
  		     tst_wcsxfrm tst_wctob tst_wctomb tst_wctrans      \
  		     tst_wctype tst_wcwidth
  
@@ -2419,7 +2419,7 @@ Index: git/localedata/Makefile
  ifneq (no,$(PERL))
  tests-special += $(objpfx)mtrace-tst-leaks.out
  endif
-@@ -92,12 +108,14 @@
+@@ -92,12 +108,14 @@ install-others := $(addprefix $(inst_i18
  
  tests: $(objdir)/iconvdata/gconv-modules
  
@@ -2434,7 +2434,7 @@ Index: git/localedata/Makefile
  
  ifeq ($(run-built-tests),yes)
  # We have to generate locales
-@@ -143,9 +161,13 @@
+@@ -143,9 +161,13 @@ generated-dirs += $(LOCALES)
  $(addprefix $(objpfx),$(CTYPE_FILES)): %: \
    gen-locale.sh $(common-objpfx)locale/localedef Makefile \
    $(addprefix charmaps/,$(CHARMAPS)) $(addprefix locales/,$(LOCALE_SRCS))
@@ -2451,7 +2451,7 @@ Index: git/localedata/Makefile
  	$(evaluate-test)
  
  $(addsuffix .out,$(addprefix $(objpfx),$(tests))): %: \
-@@ -213,6 +235,11 @@
+@@ -213,6 +235,11 @@ endif
  
  include SUPPORTED
  
@@ -2465,8 +2465,8 @@ Index: git/localedata/Makefile
  # Sometimes the whole collection of locale files should be installed.
 Index: git/login/Makefile
 ===================================================================
---- git.orig/login/Makefile	2014-08-29 20:00:47.736070587 -0700
-+++ git/login/Makefile	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/login/Makefile
++++ git/login/Makefile
 @@ -18,6 +18,7 @@
  #
  #	Sub-makefile for login portion of the library.
@@ -2475,7 +2475,7 @@ Index: git/login/Makefile
  
  subdir	:= login
  
-@@ -25,14 +26,16 @@
+@@ -25,14 +26,16 @@ include ../Makeconfig
  
  headers	:= utmp.h bits/utmp.h lastlog.h pty.h
  
@@ -2497,7 +2497,7 @@ Index: git/login/Makefile
  
  ifeq (yes,$(build-pt-chown))
  others += pt_chown
-@@ -46,8 +49,8 @@
+@@ -46,8 +49,8 @@ vpath %.c programs
  tests := tst-utmp tst-utmpx tst-grantpt tst-ptsname
  
  # Build the -lutil library with these extra functions.
@@ -2510,9 +2510,9 @@ Index: git/login/Makefile
  
 Index: git/Makeconfig
 ===================================================================
---- git.orig/Makeconfig	2014-08-29 20:00:42.956070587 -0700
-+++ git/Makeconfig	2014-08-29 20:01:15.212070587 -0700
-@@ -582,7 +582,7 @@
+--- git.orig/Makeconfig
++++ git/Makeconfig
+@@ -582,7 +582,7 @@ elf-objpfx = $(common-objpfx)elf/
  # and run on the build system, causes that program with those
  # arguments to be run on the host for which the library is built.
  ifndef test-wrapper
@@ -2521,7 +2521,7 @@ Index: git/Makeconfig
  endif
  # Likewise, but the name of the program is preceded by
  # <variable>=<value> assignments for environment variables.
-@@ -1057,6 +1057,24 @@
+@@ -1057,6 +1057,24 @@ else
  libm = $(common-objpfx)math/libm.a
  endif
  
@@ -2548,9 +2548,9 @@ Index: git/Makeconfig
  # dependencies.
 Index: git/Makerules
 ===================================================================
---- git.orig/Makerules	2014-08-29 20:00:42.960070587 -0700
-+++ git/Makerules	2014-08-29 20:01:15.212070587 -0700
-@@ -379,6 +379,25 @@
+--- git.orig/Makerules
++++ git/Makerules
+@@ -379,6 +379,25 @@ define sed-remove-objpfx
  endef
  endif
  
@@ -2578,8 +2578,8 @@ Index: git/Makerules
  ifeq (yes,$(build-shared))
 Index: git/malloc/Makefile
 ===================================================================
---- git.orig/malloc/Makefile	2014-08-29 20:00:47.760070587 -0700
-+++ git/malloc/Makefile	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/malloc/Makefile
++++ git/malloc/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for malloc routines
@@ -2589,7 +2589,7 @@ Index: git/malloc/Makefile
  subdir	:= malloc
  
  include ../Makeconfig
-@@ -36,9 +38,15 @@
+@@ -36,9 +38,15 @@ install-lib := libmcheck.a
  non-lib.a := libmcheck.a
  
  # Additional library.
@@ -2605,7 +2605,7 @@ Index: git/malloc/Makefile
  libmemusage-routines = memusage
  libmemusage-inhibit-o = $(filter-out .os,$(object-suffixes))
  
-@@ -67,7 +75,7 @@
+@@ -67,7 +75,7 @@ endif
  # Unless we get a test for the availability of libgd which also works
  # for cross-compiling we disable the memusagestat generation in this
  # situation.
@@ -2616,8 +2616,8 @@ Index: git/malloc/Makefile
  others: $(objpfx)memusage
 Index: git/malloc/memusage.c
 ===================================================================
---- git.orig/malloc/memusage.c	2014-08-29 20:00:47.768070587 -0700
-+++ git/malloc/memusage.c	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/malloc/memusage.c
++++ git/malloc/memusage.c
 @@ -33,6 +33,7 @@
  #include <stdint.h>
  #include <sys/mman.h>
@@ -2626,7 +2626,7 @@ Index: git/malloc/memusage.c
  
  #include <memusage.h>
  
-@@ -93,7 +94,11 @@
+@@ -93,7 +94,11 @@ static __thread uintptr_t start_sp;
  #define peak_stack      peak_use[1]
  #define peak_total      peak_use[2]
  
@@ -2641,9 +2641,9 @@ Index: git/malloc/memusage.c
  static int fd = -1;
 Index: git/malloc/memusage.sh
 ===================================================================
---- git.orig/malloc/memusage.sh	2014-08-29 20:00:47.768070587 -0700
-+++ git/malloc/memusage.sh	2014-08-29 20:01:15.212070587 -0700
-@@ -35,7 +35,7 @@
+--- git.orig/malloc/memusage.sh
++++ git/malloc/memusage.sh
+@@ -35,7 +35,7 @@ do_missing_arg() {
  
  # Print help message
  do_help() {
@@ -2654,9 +2654,9 @@ Index: git/malloc/memusage.sh
     -n,--progname=NAME     Name of the program file to profile
 Index: git/math/Makefile
 ===================================================================
---- git.orig/math/Makefile	2014-08-29 20:00:47.836070587 -0700
-+++ git/math/Makefile	2014-08-29 20:01:15.212070587 -0700
-@@ -21,6 +21,8 @@
+--- git.orig/math/Makefile
++++ git/math/Makefile
+@@ -21,6 +21,8 @@ subdir		:= math
  
  include ../Makeconfig
  
@@ -2665,7 +2665,7 @@ Index: git/math/Makefile
  # Installed header files.
  headers		:= math.h bits/mathcalls.h bits/mathinline.h bits/huge_val.h \
  		   bits/huge_valf.h bits/huge_vall.h bits/inf.h bits/nan.h \
-@@ -33,8 +35,8 @@
+@@ -33,8 +35,8 @@ aux		:= setfpucw fpu_control
  
  # Build the -lm library.
  
@@ -2678,8 +2678,8 @@ Index: git/math/Makefile
  	       fclrexcpt fgetexcptflg fraiseexcpt fsetexcptflg		\
 Index: git/misc/err.c
 ===================================================================
---- git.orig/misc/err.c	2014-08-29 20:00:48.232070587 -0700
-+++ git/misc/err.c	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/misc/err.c
++++ git/misc/err.c
 @@ -22,6 +22,7 @@
  #include <errno.h>
  #include <string.h>
@@ -2688,7 +2688,7 @@ Index: git/misc/err.c
  
  #include <wchar.h>
  #define flockfile(s) _IO_flockfile (s)
-@@ -37,6 +38,7 @@
+@@ -37,6 +38,7 @@ extern char *__progname;
    va_end (ap);								      \
  }
  
@@ -2696,7 +2696,7 @@ Index: git/misc/err.c
  static void
  convert_and_print (const char *format, __gnuc_va_list ap)
  {
-@@ -81,6 +83,7 @@
+@@ -81,6 +83,7 @@ convert_and_print (const char *format, _
  
    __vfwprintf (stderr, wformat, ap);
  }
@@ -2704,7 +2704,7 @@ Index: git/misc/err.c
  
  void
  vwarnx (const char *format, __gnuc_va_list ap)
-@@ -88,9 +91,13 @@
+@@ -88,9 +91,13 @@ vwarnx (const char *format, __gnuc_va_li
    flockfile (stderr);
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2718,7 +2718,7 @@ Index: git/misc/err.c
      }
    else
      {
-@@ -111,6 +118,7 @@
+@@ -111,6 +118,7 @@ vwarn (const char *format, __gnuc_va_lis
    flockfile (stderr);
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2726,7 +2726,7 @@ Index: git/misc/err.c
        __fwprintf (stderr, L"%s: ", __progname);
        if (format)
  	{
-@@ -119,6 +127,9 @@
+@@ -119,6 +127,9 @@ vwarn (const char *format, __gnuc_va_lis
  	}
        __set_errno (error);
        __fwprintf (stderr, L"%m\n");
@@ -2738,8 +2738,8 @@ Index: git/misc/err.c
      {
 Index: git/misc/error.c
 ===================================================================
---- git.orig/misc/error.c	2014-08-29 20:00:48.232070587 -0700
-+++ git/misc/error.c	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/misc/error.c
++++ git/misc/error.c
 @@ -35,6 +35,7 @@
  #endif
  
@@ -2748,7 +2748,7 @@ Index: git/misc/error.c
  # include <libintl.h>
  # include <stdbool.h>
  # include <stdint.h>
-@@ -205,6 +206,7 @@
+@@ -205,6 +206,7 @@ error_tail (int status, int errnum, cons
  #if _LIBC
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2756,7 +2756,7 @@ Index: git/misc/error.c
        size_t len = strlen (message) + 1;
        wchar_t *wmessage = NULL;
        mbstate_t st;
-@@ -265,6 +267,9 @@
+@@ -265,6 +267,9 @@ error_tail (int status, int errnum, cons
  
        if (use_malloc)
  	free (wmessage);
@@ -2768,8 +2768,8 @@ Index: git/misc/error.c
  #endif
 Index: git/misc/Makefile
 ===================================================================
---- git.orig/misc/Makefile	2014-08-29 20:00:48.232070587 -0700
-+++ git/misc/Makefile	2014-08-29 20:01:15.212070587 -0700
+--- git.orig/misc/Makefile
++++ git/misc/Makefile
 @@ -19,6 +19,10 @@
  #	Sub-makefile for misc portion of the library.
  #
@@ -2781,7 +2781,7 @@ Index: git/misc/Makefile
  subdir	:= misc
  
  include ../Makeconfig
-@@ -46,40 +50,47 @@
+@@ -46,40 +50,47 @@ routines := brk sbrk sstk ioctl \
  	    select pselect \
  	    acct chroot fsync sync fdatasync syncfs reboot \
  	    gethostid sethostid \
@@ -2838,9 +2838,9 @@ Index: git/misc/Makefile
  CFLAGS-tsearch.c = $(uses-callbacks)
 Index: git/misc/sys/xattr.h
 ===================================================================
---- git.orig/misc/sys/xattr.h	2014-08-29 20:00:52.644070587 -0700
-+++ git/misc/sys/xattr.h	2014-08-29 20:01:15.216070587 -0700
-@@ -26,7 +26,6 @@
+--- git.orig/misc/sys/xattr.h
++++ git/misc/sys/xattr.h
+@@ -26,7 +26,6 @@ __BEGIN_DECLS
  
  /* The following constants should be used for the fifth parameter of
     `*setxattr'.  */
@@ -2848,7 +2848,7 @@ Index: git/misc/sys/xattr.h
  enum
  {
    XATTR_CREATE = 1,	/* set value, fail if attr already exists.  */
-@@ -34,7 +33,6 @@
+@@ -34,7 +33,6 @@ enum
    XATTR_REPLACE = 2	/* set value, fail if attr does not exist.  */
  #define XATTR_REPLACE	XATTR_REPLACE
  };
@@ -2858,9 +2858,9 @@ Index: git/misc/sys/xattr.h
     is SIZE bytes long).  Return 0 on success, -1 for errors.  */
 Index: git/misc/tst-efgcvt.c
 ===================================================================
---- git.orig/misc/tst-efgcvt.c	2014-08-29 20:00:52.652070587 -0700
-+++ git/misc/tst-efgcvt.c	2014-08-29 20:01:15.216070587 -0700
-@@ -59,7 +59,7 @@
+--- git.orig/misc/tst-efgcvt.c
++++ git/misc/tst-efgcvt.c
+@@ -59,7 +59,7 @@ static testcase ecvt_tests[] =
    { 123.01, -4, 3, "" },
    { 126.71, -4, 3, "" },
    { 0.0, 4, 1, "0000" },
@@ -2871,8 +2871,8 @@ Index: git/misc/tst-efgcvt.c
  #endif
 Index: git/nis/Makefile
 ===================================================================
---- git.orig/nis/Makefile	2014-08-29 20:00:52.660070587 -0700
-+++ git/nis/Makefile	2014-08-29 20:01:15.216070587 -0700
+--- git.orig/nis/Makefile
++++ git/nis/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for NIS/NIS+ part.
@@ -2882,7 +2882,7 @@ Index: git/nis/Makefile
  subdir	:= nis
  
  include ../Makeconfig
-@@ -30,19 +32,26 @@
+@@ -30,19 +32,26 @@ endif
  
  # These are the databases available for the nis (and perhaps later nisplus)
  # service.  This must be a superset of the services in nss.
@@ -2915,7 +2915,7 @@ Index: git/nis/Makefile
  vpath %.c $(subdir-dirs)
  
  libnsl-routines = yp_xdr ypclnt ypupdate_xdr \
-@@ -60,11 +69,11 @@
+@@ -60,11 +69,11 @@ libnsl-routines = yp_xdr ypclnt ypupdate
  libnss_compat-routines	:= $(addprefix compat-,grp pwd spwd initgroups)
  libnss_compat-inhibit-o	= $(filter-out .os,$(object-suffixes))
  
@@ -2929,7 +2929,7 @@ Index: git/nis/Makefile
  			   nss-nisplus nisplus-initgroups
  libnss_nisplus-inhibit-o = $(filter-out .os,$(object-suffixes))
  
-@@ -80,12 +89,12 @@
+@@ -80,12 +89,12 @@ libnsl-libc = $(common-objpfx)linkobj/li
  # Target-specific variable setting to link objects using deprecated
  # RPC interfaces with the version of libc.so that makes them available
  # for new links:
@@ -2947,8 +2947,8 @@ Index: git/nis/Makefile
  endif
 Index: git/nptl/Makefile
 ===================================================================
---- git.orig/nptl/Makefile	2014-08-29 20:00:52.704070587 -0700
-+++ git/nptl/Makefile	2014-08-29 20:01:15.216070587 -0700
+--- git.orig/nptl/Makefile
++++ git/nptl/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for NPTL portion of the library.
@@ -2958,7 +2958,7 @@ Index: git/nptl/Makefile
  subdir	:= nptl
  
  include ../Makeconfig
-@@ -116,7 +118,7 @@
+@@ -116,7 +118,7 @@ libpthread-routines = nptl-init vars eve
  		      pt-raise pt-system \
  		      flockfile ftrylockfile funlockfile \
  		      sigaction \
@@ -2967,7 +2967,7 @@ Index: git/nptl/Makefile
  		      pthread_kill_other_threads \
  		      pthread_getaffinity pthread_setaffinity \
  		      pthread_attr_getaffinity pthread_attr_setaffinity \
-@@ -136,6 +138,8 @@
+@@ -136,6 +138,8 @@ libpthread-routines = nptl-init vars eve
  #		      pthread_setgid pthread_setegid pthread_setregid \
  #		      pthread_setresgid
  
@@ -2976,7 +2976,7 @@ Index: git/nptl/Makefile
  libpthread-shared-only-routines = version pt-allocrtsig unwind-forcedunwind
  libpthread-static-only-routines = pthread_atfork
  
-@@ -210,7 +214,7 @@
+@@ -210,7 +214,7 @@ tests = tst-typesizes \
  	tst-mutexpi1 tst-mutexpi2 tst-mutexpi3 tst-mutexpi4 tst-mutexpi5 \
  	tst-mutexpi5a tst-mutexpi6 tst-mutexpi7 tst-mutexpi7a tst-mutexpi8 \
  	tst-mutexpi9 \
@@ -2985,7 +2985,7 @@ Index: git/nptl/Makefile
  	tst-cond1 tst-cond2 tst-cond3 tst-cond4 tst-cond5 tst-cond6 tst-cond7 \
  	tst-cond8 tst-cond9 tst-cond10 tst-cond11 tst-cond12 tst-cond13 \
  	tst-cond14 tst-cond15 tst-cond16 tst-cond17 tst-cond18 tst-cond19 \
-@@ -244,14 +248,14 @@
+@@ -244,14 +248,14 @@ tests = tst-typesizes \
  	tst-cancel6 tst-cancel7 tst-cancel8 tst-cancel9 tst-cancel10 \
  	tst-cancel11 tst-cancel12 tst-cancel13 tst-cancel14 tst-cancel15 \
  	tst-cancel16 tst-cancel17 tst-cancel18 tst-cancel19 tst-cancel20 \
@@ -3002,7 +3002,7 @@ Index: git/nptl/Makefile
  	tst-exit1 tst-exit2 tst-exit3 \
  	tst-stdio1 tst-stdio2 \
  	tst-stack1 tst-stack2 tst-stack3 tst-pthread-getattr \
-@@ -259,13 +263,12 @@
+@@ -259,13 +263,12 @@ tests = tst-typesizes \
  	tst-unload \
  	tst-dlsym1 \
  	tst-sysconf \
@@ -3017,7 +3017,7 @@ Index: git/nptl/Makefile
  	tst-abstime \
  	tst-vfork1 tst-vfork2 tst-vfork1x tst-vfork2x \
  	tst-getpid1 tst-getpid2 tst-getpid3 \
-@@ -275,6 +278,17 @@
+@@ -275,6 +278,17 @@ xtests = tst-setuid1 tst-setuid1-static
  	tst-mutexpp1 tst-mutexpp6 tst-mutexpp10
  test-srcs = tst-oddstacklimit
  
@@ -3037,8 +3037,8 @@ Index: git/nptl/Makefile
  
 Index: git/nptl/pthread_create.c
 ===================================================================
---- git.orig/nptl/pthread_create.c	2014-08-29 20:00:52.764070587 -0700
-+++ git/nptl/pthread_create.c	2014-08-29 20:01:15.216070587 -0700
+--- git.orig/nptl/pthread_create.c
++++ git/nptl/pthread_create.c
 @@ -31,6 +31,7 @@
  #include <kernel-features.h>
  #include <exit-thread.h>
@@ -3047,7 +3047,7 @@ Index: git/nptl/pthread_create.c
  #include <shlib-compat.h>
  
  #include <stap-probe.h>
-@@ -240,8 +241,10 @@
+@@ -240,8 +241,10 @@ start_thread (void *arg)
    THREAD_SETMEM (pd, cpuclock_offset, now);
  #endif
  
@@ -3058,7 +3058,7 @@ Index: git/nptl/pthread_create.c
  
    /* Initialize pointers to locale data.  */
    __ctype_init ();
-@@ -322,8 +325,10 @@
+@@ -322,8 +325,10 @@ start_thread (void *arg)
    /* Run the destructor for the thread-local data.  */
    __nptl_deallocate_tsd ();
  
@@ -3071,8 +3071,8 @@ Index: git/nptl/pthread_create.c
       do not notify the debugger, it might just irritate it if there
 Index: git/nscd/Makefile
 ===================================================================
---- git.orig/nscd/Makefile	2014-08-29 20:00:52.948070587 -0700
-+++ git/nscd/Makefile	2014-08-29 20:01:15.216070587 -0700
+--- git.orig/nscd/Makefile
++++ git/nscd/Makefile
 @@ -18,14 +18,17 @@
  #
  #	Sub-makefile for nscd portion of the library.
@@ -3093,7 +3093,7 @@ Index: git/nscd/Makefile
  endif
  
  # To find xmalloc.c
-@@ -37,14 +40,18 @@
+@@ -37,14 +40,18 @@ nscd-modules := nscd connections pwdcach
  		dbg_log nscd_conf nscd_stat cache mem nscd_setup_thread \
  		xmalloc xstrdup aicache initgrcache gai res_hconf \
  		netgroupcache
@@ -3117,7 +3117,7 @@ Index: git/nscd/Makefile
  
  endif
  
-@@ -101,7 +108,15 @@
+@@ -101,7 +108,15 @@ include $(patsubst %,$(..)cppflags-itera
  $(objpfx)nscd: $(nscd-modules:%=$(objpfx)%.o)
  
  ifeq ($(build-shared),yes)
@@ -3137,16 +3137,16 @@ Index: git/nscd/Makefile
  endif
 Index: git/nscd/nis_hash.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/nscd/nis_hash.c	2014-08-29 20:01:15.216070587 -0700
+--- /dev/null
++++ git/nscd/nis_hash.c
 @@ -0,0 +1,3 @@
 +/* If OPTION_EGLIBC_NIS is disabled, nscd can't get this from libnsl.so;
 +   we need our own copy.  */
 +#include "../nis/nis_hash.c"
 Index: git/nss/fixed-nsswitch.conf
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/nss/fixed-nsswitch.conf	2014-08-29 20:01:15.216070587 -0700
+--- /dev/null
++++ git/nss/fixed-nsswitch.conf
 @@ -0,0 +1,22 @@
 +# /etc/nsswitch.conf
 +#
@@ -3172,8 +3172,8 @@ Index: git/nss/fixed-nsswitch.conf
 +netgroup:       files
 Index: git/nss/fixed-nsswitch.functions
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/nss/fixed-nsswitch.functions	2014-08-29 20:01:15.216070587 -0700
+--- /dev/null
++++ git/nss/fixed-nsswitch.functions
 @@ -0,0 +1,121 @@
 +/* List of functions defined for fixed NSS in GNU C Library.
 +   Copyright (C) 1996, 1997, 1998, 2005 Free Software Foundation, Inc.
@@ -3298,8 +3298,8 @@ Index: git/nss/fixed-nsswitch.functions
 +DEFINE_GET (shadow, files, spnam)
 Index: git/nss/gen-fixed-nsswitch.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/nss/gen-fixed-nsswitch.c	2014-08-29 20:01:15.216070587 -0700
+--- /dev/null
++++ git/nss/gen-fixed-nsswitch.c
 @@ -0,0 +1,803 @@
 +/* gen-fixed-nsswitch.c --- generate fixed name service data structures
 +   Copyright (C) 1996-1999, 2001-2006, 2007 Free Software Foundation, Inc.
@@ -4106,8 +4106,8 @@ Index: git/nss/gen-fixed-nsswitch.c
 +}
 Index: git/nss/getent.c
 ===================================================================
---- git.orig/nss/getent.c	2014-08-29 20:00:52.976070587 -0700
-+++ git/nss/getent.c	2014-08-29 20:01:15.216070587 -0700
+--- git.orig/nss/getent.c
++++ git/nss/getent.c
 @@ -39,6 +39,7 @@
  #include <netinet/ether.h>
  #include <netinet/in.h>
@@ -4116,7 +4116,7 @@ Index: git/nss/getent.c
  
  /* Get libc version number.  */
  #include <version.h>
-@@ -91,6 +92,7 @@
+@@ -91,6 +92,7 @@ warranty; not even for MERCHANTABILITY o
    fprintf (stream, gettext ("Written by %s.\n"), "Thorsten Kukuk");
  }
  
@@ -4124,7 +4124,7 @@ Index: git/nss/getent.c
  /* This is for aliases */
  static void
  print_aliases (struct aliasent *alias)
-@@ -135,7 +137,9 @@
+@@ -135,7 +137,9 @@ aliases_keys (int number, char *key[])
  
    return result;
  }
@@ -4134,7 +4134,7 @@ Index: git/nss/getent.c
  /* This is for ethers */
  static int
  ethers_keys (int number, char *key[])
-@@ -179,6 +183,7 @@
+@@ -179,6 +183,7 @@ ethers_keys (int number, char *key[])
  
    return result;
  }
@@ -4142,7 +4142,7 @@ Index: git/nss/getent.c
  
  /* This is for group */
  static void
-@@ -301,6 +306,7 @@
+@@ -301,6 +306,7 @@ gshadow_keys (int number, char *key[])
    return result;
  }
  
@@ -4150,7 +4150,7 @@ Index: git/nss/getent.c
  /* This is for hosts */
  static void
  print_hosts (struct hostent *host)
-@@ -598,6 +604,7 @@
+@@ -598,6 +604,7 @@ networks_keys (int number, char *key[])
  
    return result;
  }
@@ -4158,7 +4158,7 @@ Index: git/nss/getent.c
  
  /* Now is all for passwd */
  static void
-@@ -650,6 +657,7 @@
+@@ -650,6 +657,7 @@ passwd_keys (int number, char *key[])
    return result;
  }
  
@@ -4166,7 +4166,7 @@ Index: git/nss/getent.c
  /* This is for protocols */
  static void
  print_protocols (struct protoent *proto)
-@@ -805,6 +813,7 @@
+@@ -805,6 +813,7 @@ services_keys (int number, char *key[])
  
    return result;
  }
@@ -4174,7 +4174,7 @@ Index: git/nss/getent.c
  
  /* This is for shadow */
  static void
-@@ -871,21 +880,34 @@
+@@ -871,21 +880,34 @@ struct
    } databases[] =
    {
  #define D(name) { #name, name ## _keys },
@@ -4204,10 +4204,11 @@ Index: git/nss/getent.c
  D(group)
  D(gshadow)
 -D(hosts)
-+DN(hosts)
- D(initgroups)
+-D(initgroups)
 -D(netgroup)
 -D(networks)
++DN(hosts)
++DN(initgroups)
 +DN(netgroup)
 +DN(networks)
  D(passwd)
@@ -4222,8 +4223,8 @@ Index: git/nss/getent.c
      { NULL, NULL }
 Index: git/nss/getnssent_r.c
 ===================================================================
---- git.orig/nss/getnssent_r.c	2014-08-29 20:00:52.976070587 -0700
-+++ git/nss/getnssent_r.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/nss/getnssent_r.c
++++ git/nss/getnssent_r.c
 @@ -16,6 +16,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -4232,7 +4233,7 @@ Index: git/nss/getnssent_r.c
  #include <netdb.h>
  #include "nsswitch.h"
  
-@@ -59,11 +60,13 @@
+@@ -59,11 +60,13 @@ __nss_setent (const char *func_name, db_
    } fct;
    int no_more;
  
@@ -4246,7 +4247,7 @@ Index: git/nss/getnssent_r.c
  
    /* Cycle through the services and run their `setXXent' functions until
       we find an available service.  */
-@@ -101,11 +104,13 @@
+@@ -101,11 +104,13 @@ __nss_endent (const char *func_name, db_
    } fct;
    int no_more;
  
@@ -4260,7 +4261,7 @@ Index: git/nss/getnssent_r.c
  
    /* Cycle through all the services and run their endXXent functions.  */
    no_more = setup (func_name, lookup_fct, &fct.ptr, nip, startp, 1);
-@@ -141,12 +146,14 @@
+@@ -141,12 +146,14 @@ __nss_getent_r (const char *getent_func_
    int no_more;
    enum nss_status status;
  
@@ -4275,7 +4276,7 @@ Index: git/nss/getnssent_r.c
  
    /* Initialize status to return if no more functions are found.  */
    status = NSS_STATUS_NOTFOUND;
-@@ -161,7 +168,7 @@
+@@ -161,7 +168,7 @@ __nss_getent_r (const char *getent_func_
        int is_last_nip = *nip == *last_nip;
  
        status = DL_CALL_FCT (fct.f,
@@ -4286,8 +4287,8 @@ Index: git/nss/getnssent_r.c
  	 provided buffer is too small.  In this case we should give
 Index: git/nss/Makefile
 ===================================================================
---- git.orig/nss/Makefile	2014-08-29 20:00:52.972070587 -0700
-+++ git/nss/Makefile	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/nss/Makefile
++++ git/nss/Makefile
 @@ -18,29 +18,36 @@
  #
  #	Makefile for name service switch.
@@ -4333,7 +4334,7 @@ Index: git/nss/Makefile
  
  # Specify rules for the nss_* modules.  We have some services.
  services		:= files db
-@@ -55,7 +62,7 @@
+@@ -55,7 +62,7 @@ subdir-dirs = $(services:%=nss_%)
  vpath %.c $(subdir-dirs) ../locale/programs ../intl
  
  
@@ -4342,7 +4343,7 @@ Index: git/nss/Makefile
  			   files-initgroups files-have_o_cloexec files-init
  
  libnss_db-dbs		:= $(addprefix db-,\
-@@ -78,6 +85,45 @@
+@@ -78,6 +85,45 @@ tests-static		= tst-nss-static
  tests			+= $(tests-static)
  endif
  
@@ -4390,8 +4391,8 @@ Index: git/nss/Makefile
  ifeq (yes,$(have-selinux))
 Index: git/nss/nsswitch.c
 ===================================================================
---- git.orig/nss/nsswitch.c	2014-08-29 20:00:53.004070587 -0700
-+++ git/nss/nsswitch.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/nss/nsswitch.c
++++ git/nss/nsswitch.c
 @@ -26,6 +26,7 @@
  #include <stdio_ext.h>
  #include <stdlib.h>
@@ -4416,7 +4417,7 @@ Index: git/nss/nsswitch.c
  /* Prototypes for the local functions.  */
  static name_database *nss_parse_file (const char *fname) internal_function;
  static name_database_entry *nss_getline (char *line) internal_function;
-@@ -79,6 +89,9 @@
+@@ -79,6 +89,9 @@ bool __nss_database_custom[NSS_DBSIDX_ma
  
  __libc_lock_define_initialized (static, lock)
  
@@ -4426,7 +4427,7 @@ Index: git/nss/nsswitch.c
  #if !defined DO_STATIC_NSS || defined SHARED
  /* String with revision number of the shared object files.  */
  static const char *const __nss_shlib_revision = LIBNSS_FILES_SO + 15;
-@@ -93,6 +106,20 @@
+@@ -93,6 +106,20 @@ static name_database *service_table;
     __libc_freeres.  */
  static name_database_entry *defconfig_entries;
  
@@ -4447,7 +4448,7 @@ Index: git/nss/nsswitch.c
  
  #ifdef USE_NSCD
  /* Nonzero if this is the nscd process.  */
-@@ -109,20 +136,22 @@
+@@ -109,20 +136,22 @@ __nss_database_lookup (const char *datab
  		       const char *defconfig, service_user **ni)
  {
    /* Prevent multiple threads to change the service table.  */
@@ -4472,7 +4473,7 @@ Index: git/nss/nsswitch.c
  
    /* Test whether configuration data is available.  */
    if (service_table != NULL)
-@@ -144,6 +173,7 @@
+@@ -144,6 +173,7 @@ __nss_database_lookup (const char *datab
  	    *ni = entry->service;
      }
  
@@ -4480,7 +4481,7 @@ Index: git/nss/nsswitch.c
    /* No configuration data is available, either because nsswitch.conf
       doesn't exist or because it doesn't have a line for this database.
  
-@@ -166,13 +196,23 @@
+@@ -166,13 +196,23 @@ __nss_database_lookup (const char *datab
  	    {
  	      entry->next = defconfig_entries;
  	      entry->service = *ni;
@@ -4506,7 +4507,7 @@ Index: git/nss/nsswitch.c
  
    return *ni != NULL ? 0 : -1;
  }
-@@ -252,6 +292,7 @@
+@@ -252,6 +292,7 @@ __nss_next2 (service_user **ni, const ch
  libc_hidden_def (__nss_next2)
  
  
@@ -4514,7 +4515,7 @@ Index: git/nss/nsswitch.c
  int
  attribute_compat_text_section
  __nss_next (service_user **ni, const char *fct_name, void **fctp, int status,
-@@ -300,13 +341,13 @@
+@@ -300,13 +341,13 @@ __nss_configure_lookup (const char *dbna
      }
  
    /* Prevent multiple threads to change the service table.  */
@@ -4530,7 +4531,7 @@ Index: git/nss/nsswitch.c
  
    return 0;
  }
-@@ -402,7 +443,7 @@
+@@ -402,7 +443,7 @@ __nss_lookup_function (service_user *ni,
    void **found, *result;
  
    /* We now modify global data.  Protect it.  */
@@ -4539,7 +4540,7 @@ Index: git/nss/nsswitch.c
  
    /* Search the tree of functions previously requested.  Data in the
       tree are `known_function' structures, whose first member is a
-@@ -413,7 +454,7 @@
+@@ -413,7 +454,7 @@ __nss_lookup_function (service_user *ni,
       enough to a pointer to our structure to use as a lookup key that
       will be passed to `known_compare' (above).  */
  
@@ -4548,7 +4549,7 @@ Index: git/nss/nsswitch.c
    if (found == NULL)
      /* This means out-of-memory.  */
      result = NULL;
-@@ -440,7 +481,7 @@
+@@ -440,7 +481,7 @@ __nss_lookup_function (service_user *ni,
  #endif
  	  /* Oops.  We can't instantiate this node properly.
  	     Remove it from the tree.  */
@@ -4557,7 +4558,7 @@ Index: git/nss/nsswitch.c
  	  free (known);
  	  result = NULL;
  	}
-@@ -520,13 +561,43 @@
+@@ -520,13 +561,43 @@ __nss_lookup_function (service_user *ni,
      }
  
    /* Remove the lock.  */
@@ -4602,7 +4603,7 @@ Index: git/nss/nsswitch.c
  static name_database *
  internal_function
  nss_parse_file (const char *fname)
-@@ -632,8 +703,10 @@
+@@ -632,8 +703,10 @@ nss_parse_service_list (const char *line
  					     + (line - name + 1));
        if (new_service == NULL)
  	return result;
@@ -4614,7 +4615,7 @@ Index: git/nss/nsswitch.c
  
        /* Set default actions.  */
        new_service->actions[2 + NSS_STATUS_TRYAGAIN] = NSS_ACTION_CONTINUE;
-@@ -642,7 +715,7 @@
+@@ -642,7 +715,7 @@ nss_parse_service_list (const char *line
        new_service->actions[2 + NSS_STATUS_SUCCESS] = NSS_ACTION_RETURN;
        new_service->actions[2 + NSS_STATUS_RETURN] = NSS_ACTION_RETURN;
        new_service->library = NULL;
@@ -4623,7 +4624,7 @@ Index: git/nss/nsswitch.c
        new_service->next = NULL;
  
        while (isspace (line[0]))
-@@ -778,9 +851,10 @@
+@@ -778,9 +851,10 @@ nss_getline (char *line)
    result = (name_database_entry *) malloc (sizeof (name_database_entry) + len);
    if (result == NULL)
      return NULL;
@@ -4635,7 +4636,7 @@ Index: git/nss/nsswitch.c
  
    /* Parse the list of services.  */
    result->service = nss_parse_service_list (line);
-@@ -816,6 +890,7 @@
+@@ -816,6 +890,7 @@ nss_new_service (name_database *database
    return *currentp;
  }
  #endif
@@ -4643,7 +4644,7 @@ Index: git/nss/nsswitch.c
  
  
  #if defined SHARED && defined USE_NSCD
-@@ -834,6 +909,7 @@
+@@ -834,6 +909,7 @@ nss_load_all_libraries (const char *serv
  }
  
  
@@ -4651,7 +4652,7 @@ Index: git/nss/nsswitch.c
  /* Called by nscd and nscd alone.  */
  void
  __nss_disable_nscd (void (*cb) (size_t, struct traced_file *))
-@@ -857,8 +933,10 @@
+@@ -857,8 +933,10 @@ __nss_disable_nscd (void (*cb) (size_t,
    __nss_not_use_nscd_services = -1;
    __nss_not_use_nscd_netgroup = -1;
  }
@@ -4662,7 +4663,7 @@ Index: git/nss/nsswitch.c
  static void
  free_database_entries (name_database_entry *entry)
  {
-@@ -871,8 +949,8 @@
+@@ -871,8 +949,8 @@ free_database_entries (name_database_ent
  	{
  	  service_user *olds = service;
  
@@ -4673,16 +4674,16 @@ Index: git/nss/nsswitch.c
  
  	  service = service->next;
  	  free (olds);
-@@ -926,3 +1004,4 @@
+@@ -926,3 +1004,4 @@ libc_freeres_fn (free_mem)
  
    free (top);
  }
 +#endif /* __OPTION_EGLIBC_NSSWITCH */
 Index: git/nss/nsswitch.h
 ===================================================================
---- git.orig/nss/nsswitch.h	2014-08-29 20:00:53.012070587 -0700
-+++ git/nss/nsswitch.h	2014-08-29 20:01:15.220070587 -0700
-@@ -65,10 +65,20 @@
+--- git.orig/nss/nsswitch.h
++++ git/nss/nsswitch.h
+@@ -65,10 +65,20 @@ typedef struct service_user
    lookup_actions actions[5];
    /* Link to the underlying library object.  */
    service_library *library;
@@ -4706,7 +4707,7 @@ Index: git/nss/nsswitch.h
  } service_user;
  
  /* To access the action based on the status value use this macro.  */
-@@ -82,7 +92,7 @@
+@@ -82,7 +92,7 @@ typedef struct name_database_entry
    /* List of service to be used.  */
    service_user *service;
    /* Name of the database.  */
@@ -4717,8 +4718,8 @@ Index: git/nss/nsswitch.h
  
 Index: git/posix/bug-regex1.c
 ===================================================================
---- git.orig/posix/bug-regex1.c	2014-08-29 20:00:53.184070587 -0700
-+++ git/posix/bug-regex1.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/bug-regex1.c
++++ git/posix/bug-regex1.c
 @@ -4,6 +4,7 @@
  #include <string.h>
  #include <regex.h>
@@ -4727,7 +4728,7 @@ Index: git/posix/bug-regex1.c
  
  int
  main (void)
-@@ -17,7 +18,9 @@
+@@ -17,7 +18,9 @@ main (void)
    memset (&regex, '\0', sizeof (regex));
  
    setlocale (LC_ALL, "de_DE.ISO-8859-1");
@@ -4739,8 +4740,8 @@ Index: git/posix/bug-regex1.c
  
 Index: git/posix/bug-regex6.c
 ===================================================================
---- git.orig/posix/bug-regex6.c	2014-08-29 20:00:53.204070587 -0700
-+++ git/posix/bug-regex6.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/bug-regex6.c
++++ git/posix/bug-regex6.c
 @@ -22,6 +22,7 @@
  #include <string.h>
  #include <sys/types.h>
@@ -4749,7 +4750,7 @@ Index: git/posix/bug-regex6.c
  
  
  int
-@@ -30,7 +31,12 @@
+@@ -30,7 +31,12 @@ main (int argc, char *argv[])
    regex_t re;
    regmatch_t mat[10];
    int i, j, ret = 0;
@@ -4765,8 +4766,8 @@ Index: git/posix/bug-regex6.c
      { 0, 48 }, { 0, 5 }, { 0, 4 }, { 5, 20 }, { 7, 20 }, { 20, 42 },
 Index: git/posix/fnmatch.c
 ===================================================================
---- git.orig/posix/fnmatch.c	2014-08-29 20:00:53.208070587 -0700
-+++ git/posix/fnmatch.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/fnmatch.c
++++ git/posix/fnmatch.c
 @@ -30,6 +30,10 @@
  #include <ctype.h>
  #include <string.h>
@@ -4778,7 +4779,7 @@ Index: git/posix/fnmatch.c
  #if defined STDC_HEADERS || defined _LIBC
  # include <stdlib.h>
  #endif
-@@ -131,7 +135,7 @@
+@@ -131,7 +135,7 @@ extern int fnmatch (const char *pattern,
  #   define ISWCTYPE(WC, WT)	iswctype (WC, WT)
  #  endif
  
@@ -4789,8 +4790,8 @@ Index: git/posix/fnmatch.c
  #  endif
 Index: git/posix/fnmatch_loop.c
 ===================================================================
---- git.orig/posix/fnmatch_loop.c	2014-08-29 20:00:53.220070587 -0700
-+++ git/posix/fnmatch_loop.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/fnmatch_loop.c
++++ git/posix/fnmatch_loop.c
 @@ -15,6 +15,8 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -4800,7 +4801,7 @@ Index: git/posix/fnmatch_loop.c
  #include <stdint.h>
  
  struct STRUCT
-@@ -54,10 +56,15 @@
+@@ -54,10 +56,15 @@ FCT (pattern, string, string_end, no_lea
    const char *collseq = (const char *)
      _NL_CURRENT(LC_COLLATE, _NL_COLLATE_COLLSEQWC);
  # else
@@ -4818,7 +4819,7 @@ Index: git/posix/fnmatch_loop.c
  
    while ((c = *p++) != L('\0'))
      {
-@@ -277,7 +284,7 @@
+@@ -277,7 +284,7 @@ FCT (pattern, string, string_end, no_lea
  		    /* Leave room for the null.  */
  		    CHAR str[CHAR_CLASS_MAX_LENGTH + 1];
  		    size_t c1 = 0;
@@ -4827,7 +4828,7 @@ Index: git/posix/fnmatch_loop.c
  		    wctype_t wt;
  #endif
  		    const CHAR *startp = p;
-@@ -307,7 +314,7 @@
+@@ -307,7 +314,7 @@ FCT (pattern, string, string_end, no_lea
  		      }
  		    str[c1] = L('\0');
  
@@ -4836,7 +4837,7 @@ Index: git/posix/fnmatch_loop.c
  		    wt = IS_CHAR_CLASS (str);
  		    if (wt == 0)
  		      /* Invalid character class name.  */
-@@ -681,8 +688,10 @@
+@@ -681,8 +688,10 @@ FCT (pattern, string, string_end, no_lea
  			else
  			  lcollseq = __collseq_table_lookup (collseq, cold);
  # else
@@ -4849,7 +4850,7 @@ Index: git/posix/fnmatch_loop.c
  # endif
  
  			is_seqval = 0;
-@@ -858,7 +867,7 @@
+@@ -858,7 +867,7 @@ FCT (pattern, string, string_end, no_lea
  				    goto matched;
  				  }
  # else
@@ -4860,8 +4861,8 @@ Index: git/posix/fnmatch_loop.c
  
 Index: git/posix/glob.c
 ===================================================================
---- git.orig/posix/glob.c	2014-08-29 20:00:53.232070587 -0700
-+++ git/posix/glob.c	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/glob.c
++++ git/posix/glob.c
 @@ -25,6 +25,9 @@
  #include <sys/types.h>
  #include <sys/stat.h>
@@ -4872,7 +4873,7 @@ Index: git/posix/glob.c
  
  /* Outcomment the following line for production quality code.  */
  /* #define NDEBUG 1 */
-@@ -607,6 +610,7 @@
+@@ -607,6 +610,7 @@ glob (pattern, flags, errfunc, pglob)
  	  if (home_dir == NULL || home_dir[0] == '\0')
  	    home_dir = "c:/users/default"; /* poor default */
  #  else
@@ -4880,7 +4881,7 @@ Index: git/posix/glob.c
  	  if (home_dir == NULL || home_dir[0] == '\0')
  	    {
  	      int success;
-@@ -623,19 +627,19 @@
+@@ -623,19 +627,19 @@ glob (pattern, flags, errfunc, pglob)
  	      if (success)
  		{
  		  struct passwd *p;
@@ -4903,7 +4904,7 @@ Index: git/posix/glob.c
  		  if (__libc_use_alloca (alloca_used + pwbuflen))
  		    pwtmpbuf = alloca_account (pwbuflen, alloca_used);
  		  else
-@@ -682,9 +686,9 @@
+@@ -682,9 +686,9 @@ glob (pattern, flags, errfunc, pglob)
  			}
  		      __set_errno (save);
  		    }
@@ -4915,7 +4916,7 @@ Index: git/posix/glob.c
  		  if (p != NULL)
  		    {
  		      if (!malloc_pwtmpbuf)
-@@ -713,6 +717,7 @@
+@@ -713,6 +717,7 @@ glob (pattern, flags, errfunc, pglob)
  		    }
  		}
  	    }
@@ -4925,8 +4926,8 @@ Index: git/posix/glob.c
  	      if (flags & GLOB_TILDE_CHECK)
 Index: git/posix/Makefile
 ===================================================================
---- git.orig/posix/Makefile	2014-08-29 20:00:53.160070587 -0700
-+++ git/posix/Makefile	2014-08-29 20:01:15.220070587 -0700
+--- git.orig/posix/Makefile
++++ git/posix/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for POSIX portion of the library.
@@ -4936,7 +4937,7 @@ Index: git/posix/Makefile
  subdir	:= posix
  
  include ../Makeconfig
-@@ -43,13 +45,24 @@
+@@ -43,13 +45,24 @@ routines :=								      \
  	getpgid setpgid getpgrp bsd-getpgrp setpgrp getsid setsid	      \
  	getresuid getresgid setresuid setresgid				      \
  	pathconf sysconf fpathconf					      \
@@ -4963,7 +4964,7 @@ Index: git/posix/Makefile
  	spawn_faction_init spawn_faction_destroy spawn_faction_addclose	      \
  	spawn_faction_addopen spawn_faction_adddup2			      \
  	spawnattr_init spawnattr_destroy				      \
-@@ -57,41 +70,53 @@
+@@ -57,41 +70,53 @@ routines :=								      \
  	spawnattr_getflags spawnattr_setflags				      \
  	spawnattr_getpgroup spawnattr_setpgroup spawn spawnp spawni	      \
  	spawnattr_getsigmask spawnattr_getschedpolicy spawnattr_getschedparam \
@@ -5040,7 +5041,7 @@ Index: git/posix/Makefile
  endif
  tests-static	= tst-exec-static tst-spawn-static
  tests		+= $(tests-static)
-@@ -117,7 +142,10 @@
+@@ -117,7 +142,10 @@ generated += $(addprefix wordexp-test-re
  
  ifeq ($(run-built-tests),yes)
  ifeq (yes,$(build-shared))
@@ -5052,7 +5053,7 @@ Index: git/posix/Makefile
  endif
  endif
  
-@@ -125,12 +153,16 @@
+@@ -125,12 +153,16 @@ endif
  # XXX Please note that for now we ignore the result of this test.
  tests-special += $(objpfx)annexc.out
  ifeq ($(run-built-tests),yes)
@@ -5072,7 +5073,7 @@ Index: git/posix/Makefile
  xtests-special += $(objpfx)bug-ga2-mem.out
  endif
  
-@@ -143,6 +175,8 @@
+@@ -143,6 +175,8 @@ $(objpfx)globtest.out: globtest.sh $(obj
  	$(SHELL) $< $(common-objpfx) '$(test-via-rtld-prefix)' \
  		'$(test-program-prefix)' '$(test-wrapper-env)'; \
  	$(evaluate-test)
@@ -5081,7 +5082,7 @@ Index: git/posix/Makefile
  $(objpfx)wordexp-tst.out: wordexp-tst.sh $(objpfx)wordexp-test
  	$(SHELL) $< $(common-objpfx) '$(test-program-prefix-before-env)' \
  		 '$(run-program-env)' '$(test-program-prefix-after-env)'; \
-@@ -205,7 +239,10 @@
+@@ -205,7 +239,10 @@ tst-dir-ARGS = `pwd` `cd $(common-objdir
  tst-chmod-ARGS = $(objdir)
  tst-vfork3-ARGS = --test-dir=$(objpfx)
  
@@ -5095,8 +5096,8 @@ Index: git/posix/Makefile
  tst-boost-ARGS = BOOST.tests
 Index: git/posix/regcomp.c
 ===================================================================
---- git.orig/posix/regcomp.c	2014-08-29 20:00:53.264070587 -0700
-+++ git/posix/regcomp.c	2014-08-29 20:01:15.224070587 -0700
+--- git.orig/posix/regcomp.c
++++ git/posix/regcomp.c
 @@ -18,6 +18,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -5105,7 +5106,7 @@ Index: git/posix/regcomp.c
  
  static reg_errcode_t re_compile_internal (regex_t *preg, const char * pattern,
  					  size_t length, reg_syntax_t syntax);
-@@ -305,7 +306,7 @@
+@@ -305,7 +306,7 @@ re_compile_fastmap_iter (regex_t *bufp,
  {
    re_dfa_t *dfa = (re_dfa_t *) bufp->buffer;
    int node_cnt;
@@ -5114,7 +5115,7 @@ Index: git/posix/regcomp.c
    for (node_cnt = 0; node_cnt < init_state->nodes.nelem; ++node_cnt)
      {
        int node = init_state->nodes.elems[node_cnt];
-@@ -315,9 +316,9 @@
+@@ -315,9 +316,9 @@ re_compile_fastmap_iter (regex_t *bufp,
  	{
  	  re_set_fastmap (fastmap, icase, dfa->nodes[node].opr.c);
  #ifdef RE_ENABLE_I18N
@@ -5126,7 +5127,7 @@ Index: git/posix/regcomp.c
  	      wchar_t wc;
  	      mbstate_t state;
  
-@@ -348,7 +349,11 @@
+@@ -348,7 +349,11 @@ re_compile_fastmap_iter (regex_t *bufp,
  		  re_set_fastmap (fastmap, icase, ch);
  	    }
  	}
@@ -5139,7 +5140,7 @@ Index: git/posix/regcomp.c
        else if (type == COMPLEX_BRACKET)
  	{
  	  re_charset_t *cset = dfa->nodes[node].opr.mbcset;
-@@ -376,7 +381,7 @@
+@@ -376,7 +381,7 @@ re_compile_fastmap_iter (regex_t *bufp,
  	     i.e. where we would not find an invalid sequence.  This only
  	     applies to multibyte character sets; for single byte character
  	     sets, the SIMPLE_BRACKET again suffices.  */
@@ -5148,7 +5149,7 @@ Index: git/posix/regcomp.c
  	      && (cset->nchar_classes || cset->non_match || cset->nranges
  # ifdef _LIBC
  		  || cset->nequiv_classes
-@@ -404,7 +409,7 @@
+@@ -404,7 +409,7 @@ re_compile_fastmap_iter (regex_t *bufp,
  		  memset (&state, '\0', sizeof (state));
  		  if (__wcrtomb (buf, cset->mbchars[i], &state) != (size_t) -1)
  		    re_set_fastmap (fastmap, icase, *(unsigned char *) buf);
@@ -5157,7 +5158,7 @@ Index: git/posix/regcomp.c
  		    {
  		      if (__wcrtomb (buf, towlower (cset->mbchars[i]), &state)
  			  != (size_t) -1)
-@@ -413,7 +418,7 @@
+@@ -413,7 +418,7 @@ re_compile_fastmap_iter (regex_t *bufp,
  		}
  	    }
  	}
@@ -5166,7 +5167,7 @@ Index: git/posix/regcomp.c
        else if (type == OP_PERIOD
  #ifdef RE_ENABLE_I18N
  	       || type == OP_UTF8_PERIOD
-@@ -856,11 +861,15 @@
+@@ -856,11 +861,15 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
  
    dfa->mb_cur_max = MB_CUR_MAX;
  #ifdef _LIBC
@@ -5183,7 +5184,7 @@ Index: git/posix/regcomp.c
  #else
  # ifdef HAVE_LANGINFO_CODESET
    codeset_name = nl_langinfo (CODESET);
-@@ -886,7 +895,7 @@
+@@ -886,7 +895,7 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
  #endif
  
  #ifdef RE_ENABLE_I18N
@@ -5192,7 +5193,7 @@ Index: git/posix/regcomp.c
      {
        if (dfa->is_utf8)
  	dfa->sb_char = (re_bitset_ptr_t) utf8_sb_map;
-@@ -1784,7 +1793,7 @@
+@@ -1784,7 +1793,7 @@ peek_token (re_token_t *token, re_string
    token->word_char = 0;
  #ifdef RE_ENABLE_I18N
    token->mb_partial = 0;
@@ -5201,7 +5202,7 @@ Index: git/posix/regcomp.c
        !re_string_first_byte (input, re_string_cur_idx (input)))
      {
        token->type = CHARACTER;
-@@ -1805,7 +1814,7 @@
+@@ -1805,7 +1814,7 @@ peek_token (re_token_t *token, re_string
        token->opr.c = c2;
        token->type = CHARACTER;
  #ifdef RE_ENABLE_I18N
@@ -5210,7 +5211,7 @@ Index: git/posix/regcomp.c
  	{
  	  wint_t wc = re_string_wchar_at (input,
  					  re_string_cur_idx (input) + 1);
-@@ -1919,7 +1928,7 @@
+@@ -1919,7 +1928,7 @@ peek_token (re_token_t *token, re_string
  
    token->type = CHARACTER;
  #ifdef RE_ENABLE_I18N
@@ -5219,7 +5220,7 @@ Index: git/posix/regcomp.c
      {
        wint_t wc = re_string_wchar_at (input, re_string_cur_idx (input));
        token->word_char = IS_WIDE_WORD_CHAR (wc) != 0;
-@@ -2019,7 +2028,7 @@
+@@ -2019,7 +2028,7 @@ peek_token_bracket (re_token_t *token, r
    token->opr.c = c;
  
  #ifdef RE_ENABLE_I18N
@@ -5228,7 +5229,7 @@ Index: git/posix/regcomp.c
        !re_string_first_byte (input, re_string_cur_idx (input)))
      {
        token->type = CHARACTER;
-@@ -2242,7 +2251,7 @@
+@@ -2242,7 +2251,7 @@ parse_expression (re_string_t *regexp, r
  	  return NULL;
  	}
  #ifdef RE_ENABLE_I18N
@@ -5237,7 +5238,7 @@ Index: git/posix/regcomp.c
  	{
  	  while (!re_string_eoi (regexp)
  		 && !re_string_first_byte (regexp, re_string_cur_idx (regexp)))
-@@ -2380,7 +2389,7 @@
+@@ -2380,7 +2389,7 @@ parse_expression (re_string_t *regexp, r
  	  *err = REG_ESPACE;
  	  return NULL;
  	}
@@ -5246,7 +5247,7 @@ Index: git/posix/regcomp.c
  	dfa->has_mb_node = 1;
        break;
      case OP_WORD:
-@@ -2686,7 +2695,7 @@
+@@ -2686,7 +2695,7 @@ build_range_exp (bitset_t sbcset, bracke
         However, for !_LIBC we have no collation elements: if the
         character set is single byte, the single byte character set
         that we build below suffices.  parse_bracket_exp passes
@@ -5255,7 +5256,7 @@ Index: git/posix/regcomp.c
      if (mbcset)
        {
  	/* Check the space of the arrays.  */
-@@ -2782,7 +2791,13 @@
+@@ -2782,7 +2791,13 @@ parse_bracket_exp (re_string_t *regexp,
  		   reg_syntax_t syntax, reg_errcode_t *err)
  {
  #ifdef _LIBC
@@ -5269,7 +5270,7 @@ Index: git/posix/regcomp.c
    const char *collseqwc;
    uint32_t nrules;
    int32_t table_size;
-@@ -2830,18 +2845,20 @@
+@@ -2830,18 +2845,20 @@ parse_bracket_exp (re_string_t *regexp,
  	  if (MB_CUR_MAX == 1)
  	  */
  	  if (nrules == 0)
@@ -5291,7 +5292,7 @@ Index: git/posix/regcomp.c
        else if (br_elem->type == COLL_SYM)
  	{
  	  size_t sym_name_len = strlen ((char *) br_elem->opr.name);
-@@ -2872,11 +2889,11 @@
+@@ -2872,11 +2889,11 @@ parse_bracket_exp (re_string_t *regexp,
  		{
  		  /* No valid character.  Match it as a single byte
  		     character.  */
@@ -5305,7 +5306,7 @@ Index: git/posix/regcomp.c
  	}
        return UINT_MAX;
      }
-@@ -2916,7 +2933,7 @@
+@@ -2916,7 +2933,7 @@ parse_bracket_exp (re_string_t *regexp,
  	 However, if we have no collation elements, and the character set
  	 is single byte, the single byte character set that we
  	 build below suffices. */
@@ -5314,7 +5315,7 @@ Index: git/posix/regcomp.c
  	{
  	  /* Check the space of the arrays.  */
  	  if (BE (*range_alloc == mbcset->nranges, 0))
-@@ -2953,7 +2970,7 @@
+@@ -2953,7 +2970,7 @@ parse_bracket_exp (re_string_t *regexp,
  	  if (MB_CUR_MAX == 1)
  	  */
  	  if (nrules == 0)
@@ -5323,7 +5324,7 @@ Index: git/posix/regcomp.c
  	  else
  	    ch_collseq = __collseq_table_lookup (collseqwc, __btowc (ch));
  	  if (start_collseq <= ch_collseq && ch_collseq <= end_collseq)
-@@ -3031,7 +3048,10 @@
+@@ -3031,7 +3048,10 @@ parse_bracket_exp (re_string_t *regexp,
    re_bitset_ptr_t sbcset;
  #ifdef RE_ENABLE_I18N
    re_charset_t *mbcset;
@@ -5335,7 +5336,7 @@ Index: git/posix/regcomp.c
    int equiv_class_alloc = 0, char_class_alloc = 0;
  #endif /* not RE_ENABLE_I18N */
    int non_match = 0;
-@@ -3039,9 +3059,15 @@
+@@ -3039,9 +3059,15 @@ parse_bracket_exp (re_string_t *regexp,
    int token_len;
    int first_round = 1;
  #ifdef _LIBC
@@ -5351,7 +5352,7 @@ Index: git/posix/regcomp.c
    if (nrules)
      {
        /*
-@@ -3169,7 +3195,7 @@
+@@ -3169,7 +3195,7 @@ parse_bracket_exp (re_string_t *regexp,
  #else
  # ifdef RE_ENABLE_I18N
  	  *err = build_range_exp (sbcset,
@@ -5360,7 +5361,7 @@ Index: git/posix/regcomp.c
  				  &range_alloc, &start_elem, &end_elem);
  # else
  	  *err = build_range_exp (sbcset, &start_elem, &end_elem);
-@@ -3185,7 +3211,7 @@
+@@ -3185,7 +3211,7 @@ parse_bracket_exp (re_string_t *regexp,
  	    case SB_CHAR:
  	      bitset_set (sbcset, start_elem.opr.ch);
  	      break;
@@ -5369,7 +5370,7 @@ Index: git/posix/regcomp.c
  	    case MB_CHAR:
  	      /* Check whether the array has enough space.  */
  	      if (BE (mbchar_alloc == mbcset->nmbchars, 0))
-@@ -3203,7 +3229,7 @@
+@@ -3203,7 +3229,7 @@ parse_bracket_exp (re_string_t *regexp,
  		}
  	      mbcset->mbchars[mbcset->nmbchars++] = start_elem.opr.wch;
  	      break;
@@ -5378,7 +5379,7 @@ Index: git/posix/regcomp.c
  	    case EQUIV_CLASS:
  	      *err = build_equiv_class (sbcset,
  #ifdef RE_ENABLE_I18N
-@@ -3253,11 +3279,11 @@
+@@ -3253,11 +3279,11 @@ parse_bracket_exp (re_string_t *regexp,
  
  #ifdef RE_ENABLE_I18N
    /* Ensure only single byte characters are set.  */
@@ -5392,7 +5393,7 @@ Index: git/posix/regcomp.c
  						     || mbcset->non_match)))
      {
        bin_tree_t *mbc_tree;
-@@ -3326,7 +3352,7 @@
+@@ -3326,7 +3352,7 @@ parse_bracket_element (bracket_elem_t *e
  		       re_token_t *token, int token_len, re_dfa_t *dfa,
  		       reg_syntax_t syntax, int accept_hyphen)
  {
@@ -5401,7 +5402,7 @@ Index: git/posix/regcomp.c
    int cur_char_size;
    cur_char_size = re_string_char_size_at (regexp, re_string_cur_idx (regexp));
    if (cur_char_size > 1)
-@@ -3336,7 +3362,7 @@
+@@ -3336,7 +3362,7 @@ parse_bracket_element (bracket_elem_t *e
        re_string_skip_bytes (regexp, cur_char_size);
        return REG_NOERROR;
      }
@@ -5410,7 +5411,7 @@ Index: git/posix/regcomp.c
    re_string_skip_bytes (regexp, token_len); /* Skip a token.  */
    if (token->type == OP_OPEN_COLL_ELEM || token->type == OP_OPEN_CHAR_CLASS
        || token->type == OP_OPEN_EQUIV_CLASS)
-@@ -3416,7 +3442,9 @@
+@@ -3416,7 +3442,9 @@ build_equiv_class (bitset_t sbcset, re_c
  build_equiv_class (bitset_t sbcset, const unsigned char *name)
  #endif /* not RE_ENABLE_I18N */
  {
@@ -5421,7 +5422,7 @@ Index: git/posix/regcomp.c
    uint32_t nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
    if (nrules != 0)
      {
-@@ -3488,7 +3516,7 @@
+@@ -3488,7 +3516,7 @@ build_equiv_class (bitset_t sbcset, cons
        mbcset->equiv_classes[mbcset->nequiv_classes++] = idx1;
      }
    else
@@ -5430,7 +5431,7 @@ Index: git/posix/regcomp.c
      {
        if (BE (strlen ((const char *) name) != 1, 0))
  	return REG_ECOLLATE;
-@@ -3522,7 +3550,7 @@
+@@ -3522,7 +3550,7 @@ build_charclass (RE_TRANSLATE_TYPE trans
        && (strcmp (name, "upper") == 0 || strcmp (name, "lower") == 0))
      name = "alpha";
  
@@ -5439,7 +5440,7 @@ Index: git/posix/regcomp.c
    /* Check the space of the arrays.  */
    if (BE (*char_class_alloc == mbcset->nchar_classes, 0))
      {
-@@ -3538,7 +3566,7 @@
+@@ -3538,7 +3566,7 @@ build_charclass (RE_TRANSLATE_TYPE trans
        *char_class_alloc = new_char_class_alloc;
      }
    mbcset->char_classes[mbcset->nchar_classes++] = __wctype (name);
@@ -5448,7 +5449,7 @@ Index: git/posix/regcomp.c
  
  #define BUILD_CHARCLASS_LOOP(ctype_func)	\
    do {						\
-@@ -3649,7 +3677,7 @@
+@@ -3649,7 +3677,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TR
  
  #ifdef RE_ENABLE_I18N
    /* Ensure only single byte characters are set.  */
@@ -5457,7 +5458,7 @@ Index: git/posix/regcomp.c
      bitset_mask (sbcset, dfa->sb_char);
  #endif
  
-@@ -3661,7 +3689,7 @@
+@@ -3661,7 +3689,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TR
      goto build_word_op_espace;
  
  #ifdef RE_ENABLE_I18N
@@ -5468,8 +5469,8 @@ Index: git/posix/regcomp.c
        /* Build a tree for complex bracket.  */
 Index: git/posix/regexec.c
 ===================================================================
---- git.orig/posix/regexec.c	2014-08-29 20:00:53.268070587 -0700
-+++ git/posix/regexec.c	2014-08-29 20:01:15.224070587 -0700
+--- git.orig/posix/regexec.c
++++ git/posix/regexec.c
 @@ -18,6 +18,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -5478,7 +5479,7 @@ Index: git/posix/regexec.c
  
  static reg_errcode_t match_ctx_init (re_match_context_t *cache, int eflags,
  				     int n) internal_function;
-@@ -186,11 +187,11 @@
+@@ -186,11 +187,11 @@ static int build_trtable (const re_dfa_t
  static int check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
  				    const re_string_t *input, int idx)
       internal_function;
@@ -5492,7 +5493,7 @@ Index: git/posix/regexec.c
  #endif /* RE_ENABLE_I18N */
  static int group_nodes_into_DFAstates (const re_dfa_t *dfa,
  				       const re_dfastate_t *state,
-@@ -255,25 +256,9 @@
+@@ -255,25 +256,9 @@ regexec (preg, string, nmatch, pmatch, e
    return err != REG_NOERROR;
  }
  
@@ -5521,7 +5522,7 @@ Index: git/posix/regexec.c
  
  /* Entry points for GNU code.  */
  
-@@ -728,7 +713,7 @@
+@@ -728,7 +713,7 @@ re_search_internal (preg, string, length
    incr = (range < 0) ? -1 : 1;
    left_lim = (range < 0) ? start + range : start;
    right_lim = (range < 0) ? start : start + range;
@@ -5530,7 +5531,7 @@ Index: git/posix/regexec.c
    match_kind =
      (fastmap
       ? ((sb || !(preg->syntax & RE_ICASE || t) ? 4 : 0)
-@@ -3448,7 +3433,7 @@
+@@ -3448,7 +3433,7 @@ out_free:
  	  if (BE (dest_states_word[i] == NULL && err != REG_NOERROR, 0))
  	    goto out_free;
  
@@ -5539,7 +5540,7 @@ Index: git/posix/regexec.c
  	    need_word_trtable = 1;
  
  	  dest_states_nl[i] = re_acquire_state_context (&err, dfa, &follows,
-@@ -3590,7 +3575,7 @@
+@@ -3590,7 +3575,7 @@ group_nodes_into_DFAstates (const re_dfa
        else if (type == OP_PERIOD)
  	{
  #ifdef RE_ENABLE_I18N
@@ -5548,7 +5549,7 @@ Index: git/posix/regexec.c
  	    bitset_merge (accepts, dfa->sb_char);
  	  else
  #endif
-@@ -3641,7 +3626,7 @@
+@@ -3641,7 +3626,7 @@ group_nodes_into_DFAstates (const re_dfa
  		  continue;
  		}
  #ifdef RE_ENABLE_I18N
@@ -5557,7 +5558,7 @@ Index: git/posix/regexec.c
  		for (j = 0; j < BITSET_WORDS; ++j)
  		  any_set |= (accepts[j] &= (dfa->word_char[j] | ~dfa->sb_char[j]));
  	      else
-@@ -3660,7 +3645,7 @@
+@@ -3660,7 +3645,7 @@ group_nodes_into_DFAstates (const re_dfa
  		  continue;
  		}
  #ifdef RE_ENABLE_I18N
@@ -5566,7 +5567,7 @@ Index: git/posix/regexec.c
  		for (j = 0; j < BITSET_WORDS; ++j)
  		  any_set |= (accepts[j] &= ~(dfa->word_char[j] & dfa->sb_char[j]));
  	      else
-@@ -3832,12 +3817,6 @@
+@@ -3832,12 +3817,6 @@ check_node_accept_bytes (const re_dfa_t
    if (node->type == COMPLEX_BRACKET)
      {
        const re_charset_t *cset = node->opr.mbcset;
@@ -5579,7 +5580,7 @@ Index: git/posix/regexec.c
        int match_len = 0;
        wchar_t wc = ((cset->nranges || cset->nchar_classes || cset->nmbchars)
  		    ? re_string_wchar_at (input, str_idx) : 0);
-@@ -3849,6 +3828,7 @@
+@@ -3849,6 +3828,7 @@ check_node_accept_bytes (const re_dfa_t
  	    match_len = char_len;
  	    goto check_node_accept_bytes_match;
  	  }
@@ -5587,7 +5588,7 @@ Index: git/posix/regexec.c
        /* match with character_class?  */
        for (i = 0; i < cset->nchar_classes; ++i)
  	{
-@@ -3859,8 +3839,16 @@
+@@ -3859,8 +3839,16 @@ check_node_accept_bytes (const re_dfa_t
  	      goto check_node_accept_bytes_match;
  	    }
  	}
@@ -5605,7 +5606,7 @@ Index: git/posix/regexec.c
        nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
        if (nrules != 0)
  	{
-@@ -3953,8 +3941,12 @@
+@@ -3953,8 +3941,12 @@ check_node_accept_bytes (const re_dfa_t
  	    }
  	}
        else
@@ -5619,7 +5620,7 @@ Index: git/posix/regexec.c
  	  /* match with range expression?  */
  #if __GNUC__ >= 2
  	  wchar_t cmp_buf[] = {L'\0', L'\0', wc, L'\0', L'\0', L'\0'};
-@@ -3973,6 +3965,7 @@
+@@ -3973,6 +3965,7 @@ check_node_accept_bytes (const re_dfa_t
  		  goto check_node_accept_bytes_match;
  		}
  	    }
@@ -5627,7 +5628,7 @@ Index: git/posix/regexec.c
  	}
      check_node_accept_bytes_match:
        if (!cset->non_match)
-@@ -3988,7 +3981,7 @@
+@@ -3988,7 +3981,7 @@ check_node_accept_bytes (const re_dfa_t
    return 0;
  }
  
@@ -5636,7 +5637,7 @@ Index: git/posix/regexec.c
  static unsigned int
  internal_function
  find_collation_sequence_value (const unsigned char *mbs, size_t mbs_len)
-@@ -4046,7 +4039,7 @@
+@@ -4046,7 +4039,7 @@ find_collation_sequence_value (const uns
        return UINT_MAX;
      }
  }
@@ -5645,7 +5646,7 @@ Index: git/posix/regexec.c
  #endif /* RE_ENABLE_I18N */
  
  /* Check whether the node accepts the byte which is IDX-th
-@@ -4137,7 +4130,7 @@
+@@ -4137,7 +4130,7 @@ extend_buffers (re_match_context_t *mctx
    if (pstr->icase)
      {
  #ifdef RE_ENABLE_I18N
@@ -5654,7 +5655,7 @@ Index: git/posix/regexec.c
  	{
  	  ret = build_wcs_upper_buffer (pstr);
  	  if (BE (ret != REG_NOERROR, 0))
-@@ -4150,7 +4143,7 @@
+@@ -4150,7 +4143,7 @@ extend_buffers (re_match_context_t *mctx
    else
      {
  #ifdef RE_ENABLE_I18N
@@ -5665,8 +5666,8 @@ Index: git/posix/regexec.c
  #endif /* RE_ENABLE_I18N  */
 Index: git/posix/regexec-compat.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/posix/regexec-compat.c	2014-08-29 20:01:15.224070587 -0700
+--- /dev/null
++++ git/posix/regexec-compat.c
 @@ -0,0 +1,39 @@
 +/* Extended regular expression matching and search library.
 +   Copyright (C) 2008 Free Software Foundation, Inc.
@@ -5709,8 +5710,8 @@ Index: git/posix/regexec-compat.c
 +#endif
 Index: git/posix/regex.h
 ===================================================================
---- git.orig/posix/regex.h	2014-08-29 20:00:53.264070587 -0700
-+++ git/posix/regex.h	2014-08-29 20:01:15.224070587 -0700
+--- git.orig/posix/regex.h
++++ git/posix/regex.h
 @@ -21,6 +21,7 @@
  #define _REGEX_H 1
  
@@ -5719,7 +5720,7 @@ Index: git/posix/regex.h
  
  /* Allow the use in C++ code.  */
  #ifdef __cplusplus
-@@ -156,6 +157,8 @@
+@@ -156,6 +157,8 @@ typedef unsigned long int reg_syntax_t;
     treated as 'a\{1'.  */
  # define RE_INVALID_INTERVAL_ORD (RE_DEBUG << 1)
  
@@ -5728,7 +5729,7 @@ Index: git/posix/regex.h
  /* If this bit is set, then ignore case when matching.
     If not set, then case is significant.  */
  # define RE_ICASE (RE_INVALID_INTERVAL_ORD << 1)
-@@ -172,6 +175,7 @@
+@@ -172,6 +175,7 @@ typedef unsigned long int reg_syntax_t;
  /* If this bit is set, then no_sub will be set to 1 during
     re_compile_pattern.  */
  # define RE_NO_SUB (RE_CONTEXT_INVALID_DUP << 1)
@@ -5736,7 +5737,7 @@ Index: git/posix/regex.h
  #endif
  
  /* This global variable defines the particular regexp syntax to use (for
-@@ -231,8 +235,13 @@
+@@ -231,8 +235,13 @@ extern reg_syntax_t re_syntax_options;
    (RE_CHAR_CLASSES | RE_DOT_NEWLINE      | RE_DOT_NOT_NULL		\
     | RE_INTERVALS  | RE_NO_EMPTY_RANGES)
  
@@ -5750,7 +5751,7 @@ Index: git/posix/regex.h
  
  /* Differs from ..._POSIX_BASIC only in that RE_BK_PLUS_QM becomes
     RE_LIMITED_OPS, i.e., \? \+ \| are not recognized.  Actually, this
-@@ -298,9 +307,11 @@
+@@ -298,9 +307,11 @@ extern reg_syntax_t re_syntax_options;
  /* Like REG_NOTBOL, except for the end-of-line.  */
  #define REG_NOTEOL (1 << 1)
  
@@ -5764,9 +5765,9 @@ Index: git/posix/regex.h
  /* If any error codes are removed, changed, or added, update the
 Index: git/posix/regex_internal.c
 ===================================================================
---- git.orig/posix/regex_internal.c	2014-08-29 20:00:53.264070587 -0700
-+++ git/posix/regex_internal.c	2014-08-29 20:01:15.224070587 -0700
-@@ -43,8 +43,8 @@
+--- git.orig/posix/regex_internal.c
++++ git/posix/regex_internal.c
+@@ -43,8 +43,8 @@ re_string_allocate (re_string_t *pstr, c
    int init_buf_len;
  
    /* Ensure at least one character fits into the buffers.  */
@@ -5777,7 +5778,7 @@ Index: git/posix/regex_internal.c
    init_buf_len = (len + 1 < init_len) ? len + 1: init_len;
    re_string_construct_common (str, len, pstr, trans, icase, dfa);
  
-@@ -55,7 +55,7 @@
+@@ -55,7 +55,7 @@ re_string_allocate (re_string_t *pstr, c
    pstr->word_char = dfa->word_char;
    pstr->word_ops_used = dfa->word_ops_used;
    pstr->mbs = pstr->mbs_allocated ? pstr->mbs : (unsigned char *) str;
@@ -5786,7 +5787,7 @@ Index: git/posix/regex_internal.c
    pstr->valid_raw_len = pstr->valid_len;
    return REG_NOERROR;
  }
-@@ -82,7 +82,7 @@
+@@ -82,7 +82,7 @@ re_string_construct (re_string_t *pstr,
    if (icase)
      {
  #ifdef RE_ENABLE_I18N
@@ -5795,7 +5796,7 @@ Index: git/posix/regex_internal.c
  	{
  	  while (1)
  	    {
-@@ -91,7 +91,7 @@
+@@ -91,7 +91,7 @@ re_string_construct (re_string_t *pstr,
  		return ret;
  	      if (pstr->valid_raw_len >= len)
  		break;
@@ -5804,7 +5805,7 @@ Index: git/posix/regex_internal.c
  		break;
  	      ret = re_string_realloc_buffers (pstr, pstr->bufs_len * 2);
  	      if (BE (ret != REG_NOERROR, 0))
-@@ -105,7 +105,7 @@
+@@ -105,7 +105,7 @@ re_string_construct (re_string_t *pstr,
    else
      {
  #ifdef RE_ENABLE_I18N
@@ -5813,7 +5814,7 @@ Index: git/posix/regex_internal.c
  	build_wcs_buffer (pstr);
        else
  #endif /* RE_ENABLE_I18N  */
-@@ -130,7 +130,7 @@
+@@ -130,7 +130,7 @@ internal_function __attribute_warn_unuse
  re_string_realloc_buffers (re_string_t *pstr, int new_buf_len)
  {
  #ifdef RE_ENABLE_I18N
@@ -5822,7 +5823,7 @@ Index: git/posix/regex_internal.c
      {
        wint_t *new_wcs;
  
-@@ -177,7 +177,7 @@
+@@ -177,7 +177,7 @@ re_string_construct_common (const char *
    pstr->trans = trans;
    pstr->icase = icase ? 1 : 0;
    pstr->mbs_allocated = (trans != NULL || icase);
@@ -5831,7 +5832,7 @@ Index: git/posix/regex_internal.c
    pstr->is_utf8 = dfa->is_utf8;
    pstr->map_notascii = dfa->map_notascii;
    pstr->stop = pstr->len;
-@@ -203,7 +203,7 @@
+@@ -203,7 +203,7 @@ build_wcs_buffer (re_string_t *pstr)
  {
  #ifdef _LIBC
    unsigned char buf[MB_LEN_MAX];
@@ -5840,7 +5841,7 @@ Index: git/posix/regex_internal.c
  #else
    unsigned char buf[64];
  #endif
-@@ -226,7 +226,7 @@
+@@ -226,7 +226,7 @@ build_wcs_buffer (re_string_t *pstr)
  	{
  	  int i, ch;
  
@@ -5849,7 +5850,7 @@ Index: git/posix/regex_internal.c
  	    {
  	      ch = pstr->raw_mbs [pstr->raw_mbs_idx + byte_idx + i];
  	      buf[i] = pstr->mbs[byte_idx + i] = pstr->trans[ch];
-@@ -275,7 +275,7 @@
+@@ -275,7 +275,7 @@ build_wcs_upper_buffer (re_string_t *pst
    size_t mbclen;
  #ifdef _LIBC
    char buf[MB_LEN_MAX];
@@ -5858,7 +5859,7 @@ Index: git/posix/regex_internal.c
  #else
    char buf[64];
  #endif
-@@ -369,7 +369,7 @@
+@@ -369,7 +369,7 @@ build_wcs_upper_buffer (re_string_t *pst
  	  {
  	    int i, ch;
  
@@ -5867,7 +5868,7 @@ Index: git/posix/regex_internal.c
  	      {
  		ch = pstr->raw_mbs [pstr->raw_mbs_idx + src_idx + i];
  		buf[i] = pstr->trans[ch];
-@@ -567,8 +567,9 @@
+@@ -567,8 +567,9 @@ re_string_translate_buffer (re_string_t
  }
  
  /* This function re-construct the buffers.
@@ -5879,7 +5880,7 @@ Index: git/posix/regex_internal.c
  
  static reg_errcode_t
  internal_function __attribute_warn_unused_result__
-@@ -579,7 +580,7 @@
+@@ -579,7 +580,7 @@ re_string_reconstruct (re_string_t *pstr
      {
        /* Reset buffer.  */
  #ifdef RE_ENABLE_I18N
@@ -5888,7 +5889,7 @@ Index: git/posix/regex_internal.c
  	memset (&pstr->cur_state, '\0', sizeof (mbstate_t));
  #endif /* RE_ENABLE_I18N */
        pstr->len = pstr->raw_len;
-@@ -670,7 +671,7 @@
+@@ -670,7 +671,7 @@ re_string_reconstruct (re_string_t *pstr
  	      pstr->tip_context = re_string_context_at (pstr, offset - 1,
  							eflags);
  #ifdef RE_ENABLE_I18N
@@ -5897,7 +5898,7 @@ Index: git/posix/regex_internal.c
  		memmove (pstr->wcs, pstr->wcs + offset,
  			 (pstr->valid_len - offset) * sizeof (wint_t));
  #endif /* RE_ENABLE_I18N */
-@@ -699,7 +700,7 @@
+@@ -699,7 +700,7 @@ re_string_reconstruct (re_string_t *pstr
  #endif
  	  pstr->valid_len = 0;
  #ifdef RE_ENABLE_I18N
@@ -5906,7 +5907,7 @@ Index: git/posix/regex_internal.c
  	    {
  	      int wcs_idx;
  	      wint_t wc = WEOF;
-@@ -711,7 +712,7 @@
+@@ -711,7 +712,7 @@ re_string_reconstruct (re_string_t *pstr
  		  /* Special case UTF-8.  Multi-byte chars start with any
  		     byte other than 0x80 - 0xbf.  */
  		  raw = pstr->raw_mbs + pstr->raw_mbs_idx;
@@ -5915,7 +5916,7 @@ Index: git/posix/regex_internal.c
  		  if (end < pstr->raw_mbs)
  		    end = pstr->raw_mbs;
  		  p = raw + offset - 1;
-@@ -803,7 +804,7 @@
+@@ -803,7 +804,7 @@ re_string_reconstruct (re_string_t *pstr
  
    /* Then build the buffers.  */
  #ifdef RE_ENABLE_I18N
@@ -5924,7 +5925,7 @@ Index: git/posix/regex_internal.c
      {
        if (pstr->icase)
  	{
-@@ -841,7 +842,7 @@
+@@ -841,7 +842,7 @@ re_string_peek_byte_case (const re_strin
      return re_string_peek_byte (pstr, idx);
  
  #ifdef RE_ENABLE_I18N
@@ -5933,7 +5934,7 @@ Index: git/posix/regex_internal.c
        && ! re_string_is_single_byte_char (pstr, pstr->cur_idx + idx))
      return re_string_peek_byte (pstr, idx);
  #endif
-@@ -930,7 +931,7 @@
+@@ -930,7 +931,7 @@ re_string_context_at (const re_string_t
      return ((eflags & REG_NOTEOL) ? CONTEXT_ENDBUF
  	    : CONTEXT_NEWLINE | CONTEXT_ENDBUF);
  #ifdef RE_ENABLE_I18N
@@ -5942,7 +5943,7 @@ Index: git/posix/regex_internal.c
      {
        wint_t wc;
        int wc_idx = idx;
-@@ -1444,7 +1445,7 @@
+@@ -1444,7 +1445,7 @@ re_dfa_add_node (re_dfa_t *dfa, re_token
    dfa->nodes[dfa->nodes_len].constraint = 0;
  #ifdef RE_ENABLE_I18N
    dfa->nodes[dfa->nodes_len].accept_mb =
@@ -5953,8 +5954,8 @@ Index: git/posix/regex_internal.c
    re_node_set_init_empty (dfa->edests + dfa->nodes_len);
 Index: git/posix/regex_internal.h
 ===================================================================
---- git.orig/posix/regex_internal.h	2014-08-29 20:00:53.264070587 -0700
-+++ git/posix/regex_internal.h	2014-08-29 20:01:15.224070587 -0700
+--- git.orig/posix/regex_internal.h
++++ git/posix/regex_internal.h
 @@ -26,6 +26,10 @@
  #include <stdlib.h>
  #include <string.h>
@@ -5966,7 +5967,7 @@ Index: git/posix/regex_internal.h
  #if defined HAVE_LANGINFO_H || defined HAVE_LANGINFO_CODESET || defined _LIBC
  # include <langinfo.h>
  #endif
-@@ -370,6 +374,13 @@
+@@ -370,6 +374,13 @@ struct re_string_t
  };
  typedef struct re_string_t re_string_t;
  
@@ -5980,7 +5981,7 @@ Index: git/posix/regex_internal.h
  
  struct re_dfa_t;
  typedef struct re_dfa_t re_dfa_t;
-@@ -655,6 +666,14 @@
+@@ -655,6 +666,14 @@ struct re_dfa_t
    __libc_lock_define (, lock)
  };
  
@@ -5995,7 +5996,7 @@ Index: git/posix/regex_internal.h
  #define re_node_set_init_empty(set) memset (set, '\0', sizeof (re_node_set))
  #define re_node_set_remove(set,id) \
    (re_node_set_remove_at (set, re_node_set_contains (set, id) - 1))
-@@ -715,7 +734,7 @@
+@@ -715,7 +734,7 @@ internal_function __attribute__ ((pure,
  re_string_char_size_at (const re_string_t *pstr, int idx)
  {
    int byte_idx;
@@ -6004,7 +6005,7 @@ Index: git/posix/regex_internal.h
      return 1;
    for (byte_idx = 1; idx + byte_idx < pstr->valid_len; ++byte_idx)
      if (pstr->wcs[idx + byte_idx] != WEOF)
-@@ -727,7 +746,7 @@
+@@ -727,7 +746,7 @@ static wint_t
  internal_function __attribute__ ((pure, unused))
  re_string_wchar_at (const re_string_t *pstr, int idx)
  {
@@ -6015,8 +6016,8 @@ Index: git/posix/regex_internal.h
  }
 Index: git/posix/xregex.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/posix/xregex.c	2014-08-29 20:01:15.228070587 -0700
+--- /dev/null
++++ git/posix/xregex.c
 @@ -0,0 +1,8212 @@
 +/* Extended regular expression matching and search library,
 +   version 0.12.
@@ -14232,8 +14233,8 @@ Index: git/posix/xregex.c
 +# define DEFINED_ONCE
 Index: git/pwd/Makefile
 ===================================================================
---- git.orig/pwd/Makefile	2014-08-29 20:00:53.316070587 -0700
-+++ git/pwd/Makefile	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/pwd/Makefile
++++ git/pwd/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for pwd portion of the library.
@@ -14245,8 +14246,8 @@ Index: git/pwd/Makefile
  include ../Makeconfig
 Index: git/resolv/Makefile
 ===================================================================
---- git.orig/resolv/Makefile	2014-08-29 20:00:53.320070587 -0700
-+++ git/resolv/Makefile	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/resolv/Makefile
++++ git/resolv/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for resolv portion of the library.
@@ -14256,7 +14257,7 @@ Index: git/resolv/Makefile
  subdir	:= resolv
  
  include ../Makeconfig
-@@ -27,20 +29,21 @@
+@@ -27,20 +29,21 @@ headers	:= resolv.h \
  	   arpa/nameser.h arpa/nameser_compat.h \
  	   sys/bitypes.h
  
@@ -14286,7 +14287,7 @@ Index: git/resolv/Makefile
  libresolv-routines := gethnamaddr res_comp res_debug	\
  		      res_data res_mkquery res_query res_send		\
  		      inet_net_ntop inet_net_pton inet_neta base64	\
-@@ -60,7 +63,7 @@
+@@ -60,7 +63,7 @@ routines                += $(libnss_dns-
  static-only-routines    += $(libnss_dns-routines) $(libresolv-routines)
  endif
  
@@ -14297,8 +14298,8 @@ Index: git/resolv/Makefile
  
 Index: git/stdio-common/fxprintf.c
 ===================================================================
---- git.orig/stdio-common/fxprintf.c	2014-08-29 20:00:53.544070587 -0700
-+++ git/stdio-common/fxprintf.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/fxprintf.c
++++ git/stdio-common/fxprintf.c
 @@ -23,6 +23,7 @@
  #include <wchar.h>
  #include <string.h>
@@ -14307,7 +14308,7 @@ Index: git/stdio-common/fxprintf.c
  
  
  int
-@@ -37,6 +38,7 @@
+@@ -37,6 +38,7 @@ __fxprintf (FILE *fp, const char *fmt, .
    int res;
    if (_IO_fwide (fp, 0) > 0)
      {
@@ -14315,7 +14316,7 @@ Index: git/stdio-common/fxprintf.c
        size_t len = strlen (fmt) + 1;
        wchar_t wfmt[len];
        for (size_t i = 0; i < len; ++i)
-@@ -45,6 +47,9 @@
+@@ -45,6 +47,9 @@ __fxprintf (FILE *fp, const char *fmt, .
  	  wfmt[i] = fmt[i];
  	}
        res = __vfwprintf (fp, wfmt, ap);
@@ -14327,8 +14328,8 @@ Index: git/stdio-common/fxprintf.c
      res = _IO_vfprintf (fp, fmt, ap);
 Index: git/stdio-common/_i18n_number.h
 ===================================================================
---- git.orig/stdio-common/_i18n_number.h	2014-08-29 20:00:53.500070587 -0700
-+++ git/stdio-common/_i18n_number.h	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/_i18n_number.h
++++ git/stdio-common/_i18n_number.h
 @@ -19,10 +19,13 @@
  #include <stdbool.h>
  #include <wchar.h>
@@ -14343,7 +14344,7 @@ Index: git/stdio-common/_i18n_number.h
  static CHAR_T *
  _i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
  {
-@@ -115,3 +118,13 @@
+@@ -115,3 +118,13 @@ _i18n_number_rewrite (CHAR_T *w, CHAR_T
  
    return w;
  }
@@ -14359,8 +14360,8 @@ Index: git/stdio-common/_i18n_number.h
 +#endif
 Index: git/stdio-common/Makefile
 ===================================================================
---- git.orig/stdio-common/Makefile	2014-08-29 20:00:53.500070587 -0700
-+++ git/stdio-common/Makefile	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/Makefile
++++ git/stdio-common/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Specific makefile for stdio-common.
@@ -14370,7 +14371,7 @@ Index: git/stdio-common/Makefile
  subdir	:= stdio-common
  
  include ../Makeconfig
-@@ -30,7 +32,7 @@
+@@ -30,7 +32,7 @@ routines	:=							      \
  	vfprintf vprintf printf_fp reg-printf printf-prs printf_fphex	      \
  	reg-modifier reg-type						      \
  	printf_size fprintf printf snprintf sprintf asprintf dprintf	      \
@@ -14379,7 +14380,7 @@ Index: git/stdio-common/Makefile
  	fscanf scanf sscanf						      \
  	perror psignal							      \
  	tmpfile tmpfile64 tmpnam tmpnam_r tempnam tempname		      \
-@@ -41,23 +43,37 @@
+@@ -41,23 +43,37 @@ routines	:=							      \
  	isoc99_vsscanf							      \
  	psiginfo
  
@@ -14429,8 +14430,8 @@ Index: git/stdio-common/Makefile
  
 Index: git/stdio-common/printf_fp.c
 ===================================================================
---- git.orig/stdio-common/printf_fp.c	2014-08-29 20:00:53.548070587 -0700
-+++ git/stdio-common/printf_fp.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/printf_fp.c
++++ git/stdio-common/printf_fp.c
 @@ -39,6 +39,7 @@
  #include <unistd.h>
  #include <stdlib.h>
@@ -14439,7 +14440,7 @@ Index: git/stdio-common/printf_fp.c
  #include <stdbool.h>
  #include <rounding-mode.h>
  
-@@ -148,6 +149,10 @@
+@@ -148,6 +149,10 @@ static wchar_t *group_number (wchar_t *b
  			      wchar_t thousands_sep, int ngroups)
       internal_function;
  
@@ -14450,7 +14451,7 @@ Index: git/stdio-common/printf_fp.c
  
  int
  ___printf_fp (FILE *fp,
-@@ -206,7 +211,14 @@
+@@ -206,7 +211,14 @@ ___printf_fp (FILE *fp,
    mp_limb_t cy;
  
    /* Nonzero if this is output on a wide character stream.  */
@@ -14465,7 +14466,7 @@ Index: git/stdio-common/printf_fp.c
  
    /* Buffer in which we produce the output.  */
    wchar_t *wbuffer = NULL;
-@@ -258,6 +270,7 @@
+@@ -258,6 +270,7 @@ ___printf_fp (FILE *fp,
  
  
    /* Figure out the decimal point character.  */
@@ -14473,7 +14474,7 @@ Index: git/stdio-common/printf_fp.c
    if (info->extra == 0)
      {
        decimal = _NL_CURRENT (LC_NUMERIC, DECIMAL_POINT);
-@@ -277,7 +290,13 @@
+@@ -277,7 +290,13 @@ ___printf_fp (FILE *fp,
    /* The decimal point character must not be zero.  */
    assert (*decimal != '\0');
    assert (decimalwc != L'\0');
@@ -14487,7 +14488,7 @@ Index: git/stdio-common/printf_fp.c
    if (info->group)
      {
        if (info->extra == 0)
-@@ -321,6 +340,9 @@
+@@ -321,6 +340,9 @@ ___printf_fp (FILE *fp,
      }
    else
      grouping = NULL;
@@ -14499,8 +14500,8 @@ Index: git/stdio-common/printf_fp.c
  #ifndef __NO_LONG_DOUBLE_MATH
 Index: git/stdio-common/printf_fphex.c
 ===================================================================
---- git.orig/stdio-common/printf_fphex.c	2014-08-29 20:00:53.548070587 -0700
-+++ git/stdio-common/printf_fphex.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/printf_fphex.c
++++ git/stdio-common/printf_fphex.c
 @@ -28,6 +28,7 @@
  #include <_itoa.h>
  #include <_itowa.h>
@@ -14509,7 +14510,7 @@ Index: git/stdio-common/printf_fphex.c
  #include <stdbool.h>
  #include <rounding-mode.h>
  
-@@ -139,10 +140,18 @@
+@@ -139,10 +140,18 @@ __printf_fphex (FILE *fp,
    int done = 0;
  
    /* Nonzero if this is output on a wide character stream.  */
@@ -14528,7 +14529,7 @@ Index: git/stdio-common/printf_fphex.c
    if (info->extra == 0)
      {
        decimal = _NL_CURRENT (LC_NUMERIC, DECIMAL_POINT);
-@@ -156,6 +165,10 @@
+@@ -156,6 +165,10 @@ __printf_fphex (FILE *fp,
      }
    /* The decimal point character must never be zero.  */
    assert (*decimal != '\0' && decimalwc != L'\0');
@@ -14541,8 +14542,8 @@ Index: git/stdio-common/printf_fphex.c
    /* Fetch the argument value.	*/
 Index: git/stdio-common/printf_size.c
 ===================================================================
---- git.orig/stdio-common/printf_size.c	2014-08-29 20:00:53.548070587 -0700
-+++ git/stdio-common/printf_size.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/printf_size.c
++++ git/stdio-common/printf_size.c
 @@ -23,6 +23,7 @@
  #include <math.h>
  #include <printf.h>
@@ -14551,7 +14552,7 @@ Index: git/stdio-common/printf_size.c
  
  
  /* This defines make it possible to use the same code for GNU C library and
-@@ -116,7 +117,14 @@
+@@ -116,7 +117,14 @@ __printf_size (FILE *fp, const struct pr
  
    struct printf_info fp_info;
    int done = 0;
@@ -14568,8 +14569,8 @@ Index: git/stdio-common/printf_size.c
    /* Fetch the argument value.	*/
 Index: git/stdio-common/scanf14.c
 ===================================================================
---- git.orig/stdio-common/scanf14.c	2014-08-29 20:00:53.548070587 -0700
-+++ git/stdio-common/scanf14.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/scanf14.c
++++ git/stdio-common/scanf14.c
 @@ -2,6 +2,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -14578,7 +14579,7 @@ Index: git/stdio-common/scanf14.c
  
  #define FAIL() \
    do {							\
-@@ -36,6 +37,7 @@
+@@ -36,6 +37,7 @@ main (void)
      FAIL ();
    else if (d != 2.25 || memcmp (c, " x", 2) != 0)
      FAIL ();
@@ -14586,7 +14587,7 @@ Index: git/stdio-common/scanf14.c
    if (sscanf (" 3.25S x", "%4aS%3c", &lsp, c) != 2)
      FAIL ();
    else
-@@ -45,6 +47,7 @@
+@@ -45,6 +47,7 @@ main (void)
        memset (lsp, 'x', sizeof L"3.25");
        free (lsp);
      }
@@ -14596,8 +14597,8 @@ Index: git/stdio-common/scanf14.c
    else
 Index: git/stdio-common/tstdiomisc.c
 ===================================================================
---- git.orig/stdio-common/tstdiomisc.c	2014-08-29 20:00:53.584070587 -0700
-+++ git/stdio-common/tstdiomisc.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/tstdiomisc.c
++++ git/stdio-common/tstdiomisc.c
 @@ -3,6 +3,7 @@
  #include <stdio.h>
  #include <string.h>
@@ -14606,7 +14607,7 @@ Index: git/stdio-common/tstdiomisc.c
  
  static int
  t1 (void)
-@@ -125,6 +126,7 @@
+@@ -125,6 +126,7 @@ F (void)
    printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
  	  buf);
  
@@ -14614,7 +14615,7 @@ Index: git/stdio-common/tstdiomisc.c
    swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]), L"%a %A %e %E %f %F %g %G",
  	    qnanval, qnanval, qnanval, qnanval,
  	    qnanval, qnanval, qnanval, qnanval);
-@@ -162,6 +164,7 @@
+@@ -162,6 +164,7 @@ F (void)
    result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
    printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
  	  wbuf);
@@ -14622,7 +14623,7 @@ Index: git/stdio-common/tstdiomisc.c
  
    lqnanval = NAN;
  
-@@ -206,6 +209,7 @@
+@@ -206,6 +209,7 @@ F (void)
    printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
  	  buf);
  
@@ -14630,7 +14631,7 @@ Index: git/stdio-common/tstdiomisc.c
    swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]),
  	    L"%La %LA %Le %LE %Lf %LF %Lg %LG",
  	    lqnanval, lqnanval, lqnanval, lqnanval,
-@@ -250,6 +254,7 @@
+@@ -250,6 +254,7 @@ F (void)
    result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
    printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
  	  wbuf);
@@ -14640,8 +14641,8 @@ Index: git/stdio-common/tstdiomisc.c
  }
 Index: git/stdio-common/tst-popen.c
 ===================================================================
---- git.orig/stdio-common/tst-popen.c	2014-08-29 20:00:53.576070587 -0700
-+++ git/stdio-common/tst-popen.c	2014-08-29 20:01:15.232070587 -0700
+--- git.orig/stdio-common/tst-popen.c
++++ git/stdio-common/tst-popen.c
 @@ -19,6 +19,7 @@
  #include <stdio.h>
  #include <string.h>
@@ -14650,7 +14651,7 @@ Index: git/stdio-common/tst-popen.c
  
  static int
  do_test (void)
-@@ -34,12 +35,14 @@
+@@ -34,12 +35,14 @@ do_test (void)
        return 1;
      }
  
@@ -14667,8 +14668,8 @@ Index: git/stdio-common/tst-popen.c
      {
 Index: git/stdio-common/tst-sprintf.c
 ===================================================================
---- git.orig/stdio-common/tst-sprintf.c	2014-08-29 20:00:53.580070587 -0700
-+++ git/stdio-common/tst-sprintf.c	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdio-common/tst-sprintf.c
++++ git/stdio-common/tst-sprintf.c
 @@ -2,6 +2,7 @@
  #include <stdlib.h>
  #include <locale.h>
@@ -14677,7 +14678,7 @@ Index: git/stdio-common/tst-sprintf.c
  
  
  int
-@@ -10,12 +11,14 @@
+@@ -10,12 +11,14 @@ main (void)
    char buf[100];
    int result = 0;
  
@@ -14694,8 +14695,8 @@ Index: git/stdio-common/tst-sprintf.c
  #define STR(x) #x
 Index: git/stdio-common/vfprintf.c
 ===================================================================
---- git.orig/stdio-common/vfprintf.c	2014-08-29 20:00:53.588070587 -0700
-+++ git/stdio-common/vfprintf.c	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdio-common/vfprintf.c
++++ git/stdio-common/vfprintf.c
 @@ -29,6 +29,7 @@
  #include <_itoa.h>
  #include <locale/localeinfo.h>
@@ -14723,7 +14724,7 @@ Index: git/stdio-common/vfprintf.c
  #include "_i18n_number.h"
  
  /* Include the shared code for parsing the format string.  */
-@@ -1123,8 +1136,11 @@
+@@ -1123,8 +1136,11 @@ vfprintf (FILE *s, const CHAR_T *format,
  # define process_string_arg(fspec) \
      LABEL (form_character):						      \
        /* Character.  */							      \
@@ -14737,7 +14738,7 @@ Index: git/stdio-common/vfprintf.c
        --width;	/* Account for the character itself.  */		      \
        if (!left)							      \
  	PAD (' ');							      \
-@@ -1137,6 +1153,7 @@
+@@ -1137,6 +1153,7 @@ vfprintf (FILE *s, const CHAR_T *format,
        break;								      \
  									      \
      LABEL (form_wcharacter):						      \
@@ -14745,7 +14746,7 @@ Index: git/stdio-common/vfprintf.c
        {									      \
  	/* Wide character.  */						      \
  	char buf[MB_CUR_MAX];						      \
-@@ -1203,6 +1220,7 @@
+@@ -1203,6 +1220,7 @@ vfprintf (FILE *s, const CHAR_T *format,
  	  }								      \
  	else								      \
  	  {								      \
@@ -14753,7 +14754,7 @@ Index: git/stdio-common/vfprintf.c
  	    const wchar_t *s2 = (const wchar_t *) string;		      \
  	    mbstate_t mbstate;						      \
  									      \
-@@ -1403,7 +1421,9 @@
+@@ -1403,7 +1421,9 @@ vfprintf (FILE *s, const CHAR_T *format,
      LABEL (flag_quote):
        group = 1;
  
@@ -14764,7 +14765,7 @@ Index: git/stdio-common/vfprintf.c
  	{
  #ifdef COMPILE_WPRINTF
  	  thousands_sep = _NL_CURRENT_WORD (LC_NUMERIC,
-@@ -1702,7 +1722,9 @@
+@@ -1702,7 +1722,9 @@ do_positional:
        free (workstart);
      workstart = NULL;
  
@@ -14777,8 +14778,8 @@ Index: git/stdio-common/vfprintf.c
  	thousands_sep = _NL_CURRENT_WORD (LC_NUMERIC,
 Index: git/stdio-common/vfscanf.c
 ===================================================================
---- git.orig/stdio-common/vfscanf.c	2014-08-29 20:00:53.588070587 -0700
-+++ git/stdio-common/vfscanf.c	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdio-common/vfscanf.c
++++ git/stdio-common/vfscanf.c
 @@ -29,6 +29,7 @@
  #include <wctype.h>
  #include <bits/libc-lock.h>
@@ -14800,7 +14801,7 @@ Index: git/stdio-common/vfscanf.c
  #define encode_error() do {						      \
  			  errval = 4;					      \
  			  __set_errno (EILSEQ);				      \
-@@ -316,24 +323,35 @@
+@@ -316,24 +323,35 @@ _IO_vfscanf_internal (_IO_FILE *s, const
    ARGCHECK (s, format);
  
   {
@@ -14843,7 +14844,7 @@ Index: git/stdio-common/vfscanf.c
   }
  
    /* Lock the stream.  */
-@@ -385,6 +403,8 @@
+@@ -385,6 +403,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  #ifndef COMPILE_WSCANF
        if (!isascii ((unsigned char) *f))
  	{
@@ -14852,7 +14853,7 @@ Index: git/stdio-common/vfscanf.c
  	  /* Non-ASCII, may be a multibyte.  */
  	  int len = __mbrlen (f, strlen (f), &state);
  	  if (len > 0)
-@@ -830,6 +850,8 @@
+@@ -830,6 +850,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  	    }
  	  /* FALLTHROUGH */
  	case L_('C'):
@@ -14861,7 +14862,7 @@ Index: git/stdio-common/vfscanf.c
  	  if (width == -1)
  	    width = 1;
  
-@@ -1172,6 +1194,8 @@
+@@ -1172,6 +1194,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  	  /* FALLTHROUGH */
  
  	case L_('S'):
@@ -14870,7 +14871,7 @@ Index: git/stdio-common/vfscanf.c
  	  {
  #ifndef COMPILE_WSCANF
  	    mbstate_t cstate;
-@@ -1419,10 +1443,17 @@
+@@ -1419,10 +1443,17 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  	      const char *mbdigits[10];
  	      const char *mbdigits_extended[10];
  #endif
@@ -14888,7 +14889,7 @@ Index: git/stdio-common/vfscanf.c
  	      int n;
  
  	      from_level = 0;
-@@ -2088,6 +2119,7 @@
+@@ -2088,6 +2119,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  		--width;
  	    }
  
@@ -14896,7 +14897,7 @@ Index: git/stdio-common/vfscanf.c
  	  wctrans_t map;
  	  if (__builtin_expect ((flags & I18N) != 0, 0)
  	      /* Hexadecimal floats make no sense, fixing localized
-@@ -2304,6 +2336,7 @@
+@@ -2304,6 +2336,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  	      ;
  #endif
  	    }
@@ -14904,7 +14905,7 @@ Index: git/stdio-common/vfscanf.c
  
  	  /* Have we read any character?  If we try to read a number
  	     in hexadecimal notation and we have read only the `0x'
-@@ -2343,7 +2376,10 @@
+@@ -2343,7 +2376,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  
  	case L_('['):	/* Character class.  */
  	  if (flags & LONG)
@@ -14916,7 +14917,7 @@ Index: git/stdio-common/vfscanf.c
  	  else
  	    STRING_ARG (str, char, 100);
  
-@@ -2417,6 +2453,7 @@
+@@ -2417,6 +2453,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
  	  if (flags & LONG)
  	    {
  	      size_t now = read_in;
@@ -14926,8 +14927,8 @@ Index: git/stdio-common/vfscanf.c
  		input_error ();
 Index: git/stdlib/Makefile
 ===================================================================
---- git.orig/stdlib/Makefile	2014-08-29 20:00:53.588070587 -0700
-+++ git/stdlib/Makefile	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdlib/Makefile
++++ git/stdlib/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for stdlib routines
@@ -14937,7 +14938,7 @@ Index: git/stdlib/Makefile
  subdir	:= stdlib
  
  include ../Makeconfig
-@@ -30,7 +32,7 @@
+@@ -30,7 +32,7 @@ headers	:= stdlib.h bits/stdlib.h bits/s
  	   alloca.h fmtmsg.h						      \
  	   bits/stdlib-bsearch.h
  
@@ -14946,7 +14947,7 @@ Index: git/stdlib/Makefile
  	atof atoi atol atoll						      \
  	abort								      \
  	bsearch qsort msort						      \
-@@ -39,7 +41,6 @@
+@@ -39,7 +41,6 @@ routines	:=							      \
  	quick_exit at_quick_exit cxa_at_quick_exit cxa_thread_atexit_impl     \
  	abs labs llabs							      \
  	div ldiv lldiv							      \
@@ -14954,7 +14955,7 @@ Index: git/stdlib/Makefile
  	random random_r rand rand_r					      \
  	drand48 erand48 lrand48 nrand48 mrand48 jrand48			      \
  	srand48 seed48 lcong48						      \
-@@ -52,9 +53,18 @@
+@@ -52,9 +53,18 @@ routines	:=							      \
  	strtof_l strtod_l strtold_l					      \
  	system canonicalize						      \
  	a64l l64a							      \
@@ -14975,7 +14976,7 @@ Index: git/stdlib/Makefile
  aux =	grouping groupingwc tens_in_limb
  
  # These routines will be omitted from the libc shared object.
-@@ -62,20 +72,22 @@
+@@ -62,20 +72,22 @@ aux =	grouping groupingwc tens_in_limb
  # linked against when the shared library will be used.
  static-only-routines = atexit at_quick_exit
  
@@ -15006,7 +15007,7 @@ Index: git/stdlib/Makefile
  modules-names	= tst-tls-atexit-lib
  
  ifeq ($(build-shared),yes)
-@@ -115,8 +127,10 @@
+@@ -115,8 +127,10 @@ CFLAGS-tst-makecontext2.c = $(stack-alig
  tests-special += $(objpfx)isomac.out
  
  ifeq ($(run-built-tests),yes)
@@ -15019,8 +15020,8 @@ Index: git/stdlib/Makefile
  
 Index: git/stdlib/strtod_l.c
 ===================================================================
---- git.orig/stdlib/strtod_l.c	2014-08-29 20:00:53.648070587 -0700
-+++ git/stdlib/strtod_l.c	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdlib/strtod_l.c
++++ git/stdlib/strtod_l.c
 @@ -17,6 +17,7 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -15029,7 +15030,7 @@ Index: git/stdlib/strtod_l.c
  #include <xlocale.h>
  
  extern double ____strtod_l_internal (const char *, char **, int, __locale_t);
-@@ -548,6 +549,7 @@
+@@ -548,6 +549,7 @@ ____STRTOF_INTERNAL (nptr, endptr, group
    /* Used in several places.  */
    int cnt;
  
@@ -15037,7 +15038,7 @@ Index: git/stdlib/strtod_l.c
    struct __locale_data *current = loc->__locales[LC_NUMERIC];
  
    if (__glibc_unlikely (group))
-@@ -586,6 +588,17 @@
+@@ -586,6 +588,17 @@ ____STRTOF_INTERNAL (nptr, endptr, group
    decimal_len = strlen (decimal);
    assert (decimal_len > 0);
  #endif
@@ -15057,8 +15058,8 @@ Index: git/stdlib/strtod_l.c
    exponent = 0;
 Index: git/stdlib/tst-strtod.c
 ===================================================================
---- git.orig/stdlib/tst-strtod.c	2014-08-29 20:00:53.700070587 -0700
-+++ git/stdlib/tst-strtod.c	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/stdlib/tst-strtod.c
++++ git/stdlib/tst-strtod.c
 @@ -23,6 +23,7 @@
  #include <errno.h>
  #include <string.h>
@@ -15067,7 +15068,7 @@ Index: git/stdlib/tst-strtod.c
  
  struct ltest
    {
-@@ -176,7 +177,9 @@
+@@ -176,7 +177,9 @@ main (int argc, char ** argv)
  
    status |= long_dbl ();
  
@@ -15077,7 +15078,7 @@ Index: git/stdlib/tst-strtod.c
  
    return status ? EXIT_FAILURE : EXIT_SUCCESS;
  }
-@@ -219,6 +222,7 @@
+@@ -219,6 +222,7 @@ long_dbl (void)
    return 0;
  }
  
@@ -15085,15 +15086,15 @@ Index: git/stdlib/tst-strtod.c
  /* Perform a few tests in a locale with thousands separators.  */
  static int
  locale_test (void)
-@@ -276,3 +280,4 @@
+@@ -276,3 +280,4 @@ locale_test (void)
  
    return result;
  }
 +#endif /* __OPTION_EGLIBC_LOCALE_CODE */
 Index: git/streams/Makefile
 ===================================================================
---- git.orig/streams/Makefile	2014-08-29 20:00:53.712070587 -0700
-+++ git/streams/Makefile	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/streams/Makefile
++++ git/streams/Makefile
 @@ -18,11 +18,14 @@
  #
  #	Makefile for streams.
@@ -15112,8 +15113,8 @@ Index: git/streams/Makefile
  include ../Rules
 Index: git/string/Makefile
 ===================================================================
---- git.orig/string/Makefile	2014-08-29 20:00:53.716070587 -0700
-+++ git/string/Makefile	2014-08-29 20:01:15.236070587 -0700
+--- git.orig/string/Makefile
++++ git/string/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for string portion of library.
@@ -15123,7 +15124,7 @@ Index: git/string/Makefile
  subdir	:= string
  
  include ../Makeconfig
-@@ -39,10 +41,12 @@
+@@ -39,10 +41,12 @@ routines	:= strcat strchr strcmp strcoll
  		   $(addprefix argz-,append count create ctsep next	\
  				     delete extract insert stringify	\
  				     addsep replace)			\
@@ -15137,7 +15138,7 @@ Index: git/string/Makefile
  strop-tests	:= memchr memcmp memcpy memmove mempcpy memset memccpy	\
  		   stpcpy stpncpy strcat strchr strcmp strcpy strcspn	\
  		   strlen strncmp strncpy strpbrk strrchr strspn memmem	\
-@@ -51,10 +55,12 @@
+@@ -51,10 +55,12 @@ strop-tests	:= memchr memcmp memcpy memm
  tests		:= tester inl-tester noinl-tester testcopy test-ffs	\
  		   tst-strlen stratcliff tst-svc tst-inlcall		\
  		   bug-strncat1 bug-strspn1 bug-strpbrk1 tst-bswap	\
@@ -15155,8 +15156,8 @@ Index: git/string/Makefile
  
 Index: git/string/strcoll_l.c
 ===================================================================
---- git.orig/string/strcoll_l.c	2014-08-29 20:00:53.744070587 -0700
-+++ git/string/strcoll_l.c	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/string/strcoll_l.c
++++ git/string/strcoll_l.c
 @@ -25,6 +25,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -15165,7 +15166,7 @@ Index: git/string/strcoll_l.c
  
  #ifndef STRING_TYPE
  # define STRING_TYPE char
-@@ -472,7 +473,11 @@
+@@ -472,7 +473,11 @@ int
  STRCOLL (const STRING_TYPE *s1, const STRING_TYPE *s2, __locale_t l)
  {
    struct __locale_data *current = l->__locales[LC_COLLATE];
@@ -15179,8 +15180,8 @@ Index: git/string/strcoll_l.c
    const unsigned char *rulesets;
 Index: git/string/strerror_l.c
 ===================================================================
---- git.orig/string/strerror_l.c	2014-08-29 20:00:53.744070587 -0700
-+++ git/string/strerror_l.c	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/string/strerror_l.c
++++ git/string/strerror_l.c
 @@ -21,6 +21,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -15189,7 +15190,7 @@ Index: git/string/strerror_l.c
  
  
  static __thread char *last_value;
-@@ -29,10 +30,14 @@
+@@ -29,10 +30,14 @@ static __thread char *last_value;
  static const char *
  translate (const char *str, locale_t loc)
  {
@@ -15206,8 +15207,8 @@ Index: git/string/strerror_l.c
  
 Index: git/string/strxfrm_l.c
 ===================================================================
---- git.orig/string/strxfrm_l.c	2014-08-29 20:00:53.748070587 -0700
-+++ git/string/strxfrm_l.c	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/string/strxfrm_l.c
++++ git/string/strxfrm_l.c
 @@ -24,6 +24,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -15216,7 +15217,7 @@ Index: git/string/strxfrm_l.c
  
  #ifndef STRING_TYPE
  # define STRING_TYPE char
-@@ -85,7 +86,11 @@
+@@ -85,7 +86,11 @@ size_t
  STRXFRM (STRING_TYPE *dest, const STRING_TYPE *src, size_t n, __locale_t l)
  {
    struct __locale_data *current = l->__locales[LC_COLLATE];
@@ -15230,9 +15231,9 @@ Index: git/string/strxfrm_l.c
    const unsigned char *rulesets;
 Index: git/string/test-strcmp.c
 ===================================================================
---- git.orig/string/test-strcmp.c	2014-08-29 20:00:53.752070587 -0700
-+++ git/string/test-strcmp.c	2014-08-29 20:01:15.240070587 -0700
-@@ -329,34 +329,6 @@
+--- git.orig/string/test-strcmp.c
++++ git/string/test-strcmp.c
+@@ -329,34 +329,6 @@ check (void)
  		FOR_EACH_IMPL (impl, 0)
  		check_result (impl, s1 + i1, s2 + i2, exp_result);
        }
@@ -15269,8 +15270,8 @@ Index: git/string/test-strcmp.c
  
 Index: git/string/tst-strxfrm2.c
 ===================================================================
---- git.orig/string/tst-strxfrm2.c	2014-08-29 20:00:53.756070587 -0700
-+++ git/string/tst-strxfrm2.c	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/string/tst-strxfrm2.c
++++ git/string/tst-strxfrm2.c
 @@ -1,6 +1,7 @@
  #include <locale.h>
  #include <stdio.h>
@@ -15279,7 +15280,7 @@ Index: git/string/tst-strxfrm2.c
  
  static int
  do_test (void)
-@@ -38,6 +39,7 @@
+@@ -38,6 +39,7 @@ do_test (void)
        res = 1;
      }
  
@@ -15287,7 +15288,7 @@ Index: git/string/tst-strxfrm2.c
    if (setlocale (LC_ALL, "de_DE.UTF-8") == NULL)
      {
        puts ("setlocale failed");
-@@ -75,6 +77,7 @@
+@@ -75,6 +77,7 @@ do_test (void)
  	  res = 1;
  	}
      }
@@ -15297,8 +15298,8 @@ Index: git/string/tst-strxfrm2.c
  }
 Index: git/string/tst-strxfrm.c
 ===================================================================
---- git.orig/string/tst-strxfrm.c	2014-08-29 20:00:53.756070587 -0700
-+++ git/string/tst-strxfrm.c	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/string/tst-strxfrm.c
++++ git/string/tst-strxfrm.c
 @@ -3,6 +3,7 @@
  #include <stdio.h>
  #include <stdlib.h>
@@ -15307,7 +15308,7 @@ Index: git/string/tst-strxfrm.c
  
  
  char const string[] = "";
-@@ -64,8 +65,10 @@
+@@ -64,8 +65,10 @@ main (void)
    int result = 0;
  
    result |= test ("C");
@@ -15320,8 +15321,8 @@ Index: git/string/tst-strxfrm.c
  }
 Index: git/sunrpc/Makefile
 ===================================================================
---- git.orig/sunrpc/Makefile	2014-08-29 20:00:53.760070587 -0700
-+++ git/sunrpc/Makefile	2014-08-29 20:01:15.240070587 -0700
+--- git.orig/sunrpc/Makefile
++++ git/sunrpc/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for sunrpc portion of the library.
@@ -15331,7 +15332,7 @@ Index: git/sunrpc/Makefile
  subdir	:= sunrpc
  
  include ../Makeconfig
-@@ -55,7 +57,6 @@
+@@ -55,7 +57,6 @@ headers-in-tirpc = $(addprefix rpc/,auth
  headers-not-in-tirpc = $(addprefix rpc/,key_prot.h rpc_des.h) \
  		       $(rpcsvc:%=rpcsvc/%) rpcsvc/bootparam.h
  headers = rpc/netdb.h
@@ -15339,7 +15340,7 @@ Index: git/sunrpc/Makefile
  generated += $(rpcsvc:%.x=rpcsvc/%.h) $(rpcsvc:%.x=x%.c) $(rpcsvc:%.x=x%.stmp) \
  	     $(rpcsvc:%.x=rpcsvc/%.stmp) rpcgen
  generated-dirs += rpcsvc
-@@ -65,18 +66,28 @@
+@@ -65,18 +66,28 @@ headers += $(headers-in-tirpc) $(headers
  endif
  
  ifeq ($(build-shared),yes)
@@ -15373,7 +15374,7 @@ Index: git/sunrpc/Makefile
  ifneq ($(link-obsolete-rpc),yes)
  # We only add the RPC for compatibility to libc.so.
  shared-only-routines = $(routines)
-@@ -85,25 +96,28 @@
+@@ -85,25 +96,28 @@ endif
  
  # We do not build rpcinfo anymore.  It is not needed for a bootstrap
  # and not wanted on complete systems.
@@ -15414,9 +15415,9 @@ Index: git/sunrpc/Makefile
  omit-deps = $(librpcsvc-routines)
 Index: git/sysdeps/generic/ldsodefs.h
 ===================================================================
---- git.orig/sysdeps/generic/ldsodefs.h	2014-08-29 20:00:53.904070587 -0700
-+++ git/sysdeps/generic/ldsodefs.h	2014-08-29 20:01:15.240070587 -0700
-@@ -425,6 +425,12 @@
+--- git.orig/sysdeps/generic/ldsodefs.h
++++ git/sysdeps/generic/ldsodefs.h
+@@ -425,6 +425,12 @@ extern struct rtld_global _rtld_global _
  # undef __rtld_global_attribute__
  #endif
  
@@ -15429,7 +15430,7 @@ Index: git/sysdeps/generic/ldsodefs.h
  #ifndef SHARED
  # define GLRO(name) _##name
  #else
-@@ -437,8 +443,10 @@
+@@ -437,8 +443,10 @@ struct rtld_global_ro
  {
  #endif
  
@@ -15442,9 +15443,9 @@ Index: git/sysdeps/generic/ldsodefs.h
  #define DL_DEBUG_BINDINGS   (1 << 2)
 Index: git/sysdeps/gnu/Makefile
 ===================================================================
---- git.orig/sysdeps/gnu/Makefile	2014-08-29 20:00:53.924070587 -0700
-+++ git/sysdeps/gnu/Makefile	2014-08-29 20:01:15.240070587 -0700
-@@ -57,7 +57,8 @@
+--- git.orig/sysdeps/gnu/Makefile
++++ git/sysdeps/gnu/Makefile
+@@ -57,7 +57,8 @@ $(foreach o,$(object-suffixes) $(object-
  endif
  
  ifeq ($(subdir),login)
@@ -15456,9 +15457,9 @@ Index: git/sysdeps/gnu/Makefile
  sysdep_headers += utmpx.h bits/utmpx.h
 Index: git/sysdeps/ieee754/ldbl-opt/Makefile
 ===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/Makefile	2014-08-29 20:00:54.452070587 -0700
-+++ git/sysdeps/ieee754/ldbl-opt/Makefile	2014-08-29 20:01:15.244070587 -0700
-@@ -11,19 +11,18 @@
+--- git.orig/sysdeps/ieee754/ldbl-opt/Makefile
++++ git/sysdeps/ieee754/ldbl-opt/Makefile
+@@ -11,19 +11,18 @@ libm-routines += s_nexttowardfd
  routines += math_ldbl_opt nldbl-compat
  
  extra-libs += libnldbl
@@ -15487,7 +15488,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/Makefile
  		 strtold strtold_l strtoldint wcstold wcstold_l wcstoldint \
  		 qecvt qfcvt qgcvt qecvt_r qfcvt_r \
  		 isinf isnan finite signbit scalb log2 lgamma_r ceil \
-@@ -38,9 +37,15 @@
+@@ -38,9 +37,15 @@ libnldbl-calls = asprintf dprintf fprint
  		 casinh cexp clog cproj csin csinh csqrt ctan ctanh cpow \
  		 cabs carg cimag creal clog10 \
  		 isoc99_scanf isoc99_fscanf isoc99_sscanf \
@@ -15506,8 +15507,8 @@ Index: git/sysdeps/ieee754/ldbl-opt/Makefile
  libnldbl-static-only-routines = $(libnldbl-routines)
 Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
 ===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.c	2014-08-29 20:00:54.468070587 -0700
-+++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
++++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
 @@ -26,6 +26,7 @@
  #include <locale/localeinfo.h>
  #include <sys/syslog.h>
@@ -15516,7 +15517,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  #include "nldbl-compat.h"
  
-@@ -33,20 +34,14 @@
+@@ -33,20 +34,14 @@ libc_hidden_proto (__nldbl_vfprintf)
  libc_hidden_proto (__nldbl_vsscanf)
  libc_hidden_proto (__nldbl_vsprintf)
  libc_hidden_proto (__nldbl_vfscanf)
@@ -15537,7 +15538,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  libc_hidden_proto (__nldbl___vasprintf_chk)
  libc_hidden_proto (__nldbl___vdprintf_chk)
  libc_hidden_proto (__nldbl___obstack_vprintf_chk)
-@@ -54,8 +49,17 @@
+@@ -54,8 +49,17 @@ libc_hidden_proto (__nldbl___vstrfmon)
  libc_hidden_proto (__nldbl___vstrfmon_l)
  libc_hidden_proto (__nldbl___isoc99_vsscanf)
  libc_hidden_proto (__nldbl___isoc99_vfscanf)
@@ -15555,7 +15556,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  static void
  __nldbl_cleanup (void *arg)
-@@ -117,6 +121,7 @@
+@@ -117,6 +121,7 @@ __nldbl_fprintf (FILE *stream, const cha
  }
  weak_alias (__nldbl_fprintf, __nldbl__IO_fprintf)
  
@@ -15563,7 +15564,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_fwprintf (FILE *stream, const wchar_t *fmt, ...)
-@@ -130,6 +135,7 @@
+@@ -130,6 +135,7 @@ __nldbl_fwprintf (FILE *stream, const wc
  
    return done;
  }
@@ -15571,7 +15572,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -226,6 +232,7 @@
+@@ -226,6 +232,7 @@ __nldbl_snprintf (char *s, size_t maxlen
    return done;
  }
  
@@ -15579,7 +15580,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl_swprintf (wchar_t *s, size_t n, const wchar_t *fmt, ...)
-@@ -239,6 +246,7 @@
+@@ -239,6 +246,7 @@ __nldbl_swprintf (wchar_t *s, size_t n,
  
    return done;
  }
@@ -15587,7 +15588,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section weak_function
-@@ -264,6 +272,7 @@
+@@ -264,6 +272,7 @@ __nldbl_vdprintf (int d, const char *fmt
  }
  libc_hidden_def (__nldbl_vdprintf)
  
@@ -15595,7 +15596,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_vfwprintf (FILE *s, const wchar_t *fmt, va_list ap)
-@@ -275,6 +284,7 @@
+@@ -275,6 +284,7 @@ __nldbl_vfwprintf (FILE *s, const wchar_
    return res;
  }
  libc_hidden_def (__nldbl_vfwprintf)
@@ -15603,7 +15604,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -297,6 +307,7 @@
+@@ -297,6 +307,7 @@ __nldbl_vsnprintf (char *string, size_t
  libc_hidden_def (__nldbl_vsnprintf)
  weak_alias (__nldbl_vsnprintf, __nldbl___vsnprintf)
  
@@ -15611,7 +15612,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_vswprintf (wchar_t *string, size_t maxlen, const wchar_t *fmt,
-@@ -330,6 +341,7 @@
+@@ -330,6 +341,7 @@ __nldbl_wprintf (const wchar_t *fmt, ...
  
    return done;
  }
@@ -15619,7 +15620,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -419,6 +431,7 @@
+@@ -419,6 +431,7 @@ __nldbl_scanf (const char *fmt, ...)
    return done;
  }
  
@@ -15627,7 +15628,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl_vfwscanf (FILE *s, const wchar_t *fmt, va_list ap)
-@@ -491,6 +504,7 @@
+@@ -491,6 +504,7 @@ __nldbl_wscanf (const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15635,7 +15636,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -506,6 +520,7 @@
+@@ -506,6 +520,7 @@ __nldbl___fprintf_chk (FILE *stream, int
    return done;
  }
  
@@ -15643,7 +15644,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___fwprintf_chk (FILE *stream, int flag, const wchar_t *fmt, ...)
-@@ -519,6 +534,7 @@
+@@ -519,6 +534,7 @@ __nldbl___fwprintf_chk (FILE *stream, in
  
    return done;
  }
@@ -15651,7 +15652,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -563,6 +579,7 @@
+@@ -563,6 +579,7 @@ __nldbl___sprintf_chk (char *s, int flag
    return done;
  }
  
@@ -15659,7 +15660,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___swprintf_chk (wchar_t *s, size_t n, int flag, size_t slen,
-@@ -577,6 +594,7 @@
+@@ -577,6 +594,7 @@ __nldbl___swprintf_chk (wchar_t *s, size
  
    return done;
  }
@@ -15667,7 +15668,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -590,6 +608,7 @@
+@@ -590,6 +608,7 @@ __nldbl___vfprintf_chk (FILE *s, int fla
  }
  libc_hidden_def (__nldbl___vfprintf_chk)
  
@@ -15675,7 +15676,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___vfwprintf_chk (FILE *s, int flag, const wchar_t *fmt, va_list ap)
-@@ -601,6 +620,7 @@
+@@ -601,6 +620,7 @@ __nldbl___vfwprintf_chk (FILE *s, int fl
    return res;
  }
  libc_hidden_def (__nldbl___vfwprintf_chk)
@@ -15683,7 +15684,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -635,6 +655,7 @@
+@@ -635,6 +655,7 @@ __nldbl___vsprintf_chk (char *string, in
  }
  libc_hidden_def (__nldbl___vsprintf_chk)
  
@@ -15691,7 +15692,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___vswprintf_chk (wchar_t *string, size_t maxlen, int flag, size_t slen,
-@@ -668,6 +689,7 @@
+@@ -668,6 +689,7 @@ __nldbl___wprintf_chk (int flag, const w
  
    return done;
  }
@@ -15699,7 +15700,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -775,6 +797,7 @@
+@@ -775,6 +797,7 @@ __nldbl___printf_fp (FILE *fp, const str
    return ___printf_fp (fp, &info_no_ldbl, args);
  }
  
@@ -15707,7 +15708,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  ssize_t
  attribute_compat_text_section
  __nldbl_strfmon (char *s, size_t maxsize, const char *format, ...)
-@@ -829,6 +852,7 @@
+@@ -829,6 +852,7 @@ __nldbl___vstrfmon_l (char *s, size_t ma
    return res;
  }
  libc_hidden_def (__nldbl___vstrfmon_l)
@@ -15715,7 +15716,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  void
  attribute_compat_text_section
-@@ -941,6 +965,7 @@
+@@ -941,6 +965,7 @@ __nldbl___isoc99_scanf (const char *fmt,
    return done;
  }
  
@@ -15723,7 +15724,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___isoc99_vfwscanf (FILE *s, const wchar_t *fmt, va_list ap)
-@@ -1014,6 +1039,7 @@
+@@ -1014,6 +1039,7 @@ __nldbl___isoc99_wscanf (const wchar_t *
  
    return done;
  }
@@ -15731,7 +15732,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_0)
  compat_symbol (libc, __nldbl__IO_printf, _IO_printf, GLIBC_2_0);
-@@ -1057,6 +1083,7 @@
+@@ -1057,6 +1083,7 @@ compat_symbol (libc, __nldbl_printf_size
  compat_symbol (libc, __nldbl___strfmon_l, __strfmon_l, GLIBC_2_1);
  #endif
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_2)
@@ -15739,7 +15740,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  compat_symbol (libc, __nldbl_swprintf, swprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vwprintf, vwprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_wprintf, wprintf, GLIBC_2_2);
-@@ -1069,6 +1096,7 @@
+@@ -1069,6 +1096,7 @@ compat_symbol (libc, __nldbl_vfwscanf, v
  compat_symbol (libc, __nldbl_vswscanf, vswscanf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vwscanf, vwscanf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_wscanf, wscanf, GLIBC_2_2);
@@ -15749,8 +15750,8 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  compat_symbol (libc, __nldbl_strfmon_l, strfmon_l, GLIBC_2_3);
 Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
 ===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.h	2014-08-29 20:00:54.468070587 -0700
-+++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
++++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
 @@ -30,6 +30,7 @@
  #include <math.h>
  #include <monetary.h>
@@ -15779,7 +15780,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  NLDBL_DECL (__asprintf);
  NLDBL_DECL (asprintf);
  NLDBL_DECL (__printf_fp);
-@@ -66,12 +63,18 @@
+@@ -66,12 +63,18 @@ NLDBL_DECL (__isoc99_sscanf);
  NLDBL_DECL (__isoc99_vscanf);
  NLDBL_DECL (__isoc99_vfscanf);
  NLDBL_DECL (__isoc99_vsscanf);
@@ -15798,7 +15799,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  
  /* This one does not exist in the normal interface, only
     __nldbl___vstrfmon really exists.  */
-@@ -82,22 +85,23 @@
+@@ -82,22 +85,23 @@ extern ssize_t __nldbl___vstrfmon (char
     since we don't compile with _FORTIFY_SOURCE.  */
  extern int __nldbl___vfprintf_chk (FILE *__restrict, int,
  				   const char *__restrict, _G_va_list);
@@ -15830,8 +15831,8 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  #endif /* __NLDBL_COMPAT_H */
 Index: git/sysdeps/unix/sysv/linux/gethostid.c
 ===================================================================
---- git.orig/sysdeps/unix/sysv/linux/gethostid.c	2014-08-29 20:00:58.840070587 -0700
-+++ git/sysdeps/unix/sysv/linux/gethostid.c	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/sysdeps/unix/sysv/linux/gethostid.c
++++ git/sysdeps/unix/sysv/linux/gethostid.c
 @@ -21,6 +21,7 @@
  #include <unistd.h>
  #include <netdb.h>
@@ -15840,7 +15841,7 @@ Index: git/sysdeps/unix/sysv/linux/gethostid.c
  
  #define HOSTIDFILE "/etc/hostid"
  
-@@ -89,6 +90,7 @@
+@@ -89,6 +90,7 @@ gethostid (void)
  	return id;
      }
  
@@ -15848,7 +15849,7 @@ Index: git/sysdeps/unix/sysv/linux/gethostid.c
    /* Getting from the file was not successful.  An intelligent guess for
       a unique number of a host is its IP address.  Return this.  */
    if (__gethostname (hostname, MAXHOSTNAMELEN) < 0 || hostname[0] == '\0')
-@@ -115,5 +117,9 @@
+@@ -115,5 +117,9 @@ gethostid (void)
    /* For the return value to be not exactly the IP address we do some
       bit fiddling.  */
    return (int32_t) (in.s_addr << 16 | in.s_addr >> 16);
@@ -15860,8 +15861,8 @@ Index: git/sysdeps/unix/sysv/linux/gethostid.c
  #endif
 Index: git/sysdeps/unix/sysv/linux/libc_fatal.c
 ===================================================================
---- git.orig/sysdeps/unix/sysv/linux/libc_fatal.c	2014-08-29 20:00:58.980070587 -0700
-+++ git/sysdeps/unix/sysv/linux/libc_fatal.c	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/sysdeps/unix/sysv/linux/libc_fatal.c
++++ git/sysdeps/unix/sysv/linux/libc_fatal.c
 @@ -23,6 +23,7 @@
  #include <string.h>
  #include <sys/mman.h>
@@ -15870,7 +15871,7 @@ Index: git/sysdeps/unix/sysv/linux/libc_fatal.c
  
  static bool
  writev_for_fatal (int fd, const struct iovec *iov, size_t niov, size_t total)
-@@ -40,6 +41,7 @@
+@@ -40,6 +41,7 @@ writev_for_fatal (int fd, const struct i
  static void
  backtrace_and_maps (int do_abort, bool written, int fd)
  {
@@ -15878,7 +15879,7 @@ Index: git/sysdeps/unix/sysv/linux/libc_fatal.c
    if (do_abort > 1 && written)
      {
        void *addrs[64];
-@@ -62,6 +64,7 @@
+@@ -62,6 +64,7 @@ backtrace_and_maps (int do_abort, bool w
            close_not_cancel_no_status (fd2);
          }
      }
@@ -15888,8 +15889,8 @@ Index: git/sysdeps/unix/sysv/linux/libc_fatal.c
  
 Index: git/time/Makefile
 ===================================================================
---- git.orig/time/Makefile	2014-08-29 20:00:59.504070587 -0700
-+++ git/time/Makefile	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/time/Makefile
++++ git/time/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for time routines
@@ -15899,7 +15900,7 @@ Index: git/time/Makefile
  subdir	:= time
  
  include ../Makeconfig
-@@ -30,14 +32,20 @@
+@@ -30,14 +32,20 @@ routines := offtime asctime clock ctime
  	    tzfile getitimer setitimer			 \
  	    stime dysize timegm ftime			 \
  	    getdate strptime strptime_l			 \
@@ -15926,8 +15927,8 @@ Index: git/time/Makefile
  
 Index: git/time/strftime_l.c
 ===================================================================
---- git.orig/time/strftime_l.c	2014-08-29 20:00:59.528070587 -0700
-+++ git/time/strftime_l.c	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/time/strftime_l.c
++++ git/time/strftime_l.c
 @@ -35,6 +35,10 @@
  # include "../locale/localeinfo.h"
  #endif
@@ -15939,7 +15940,7 @@ Index: git/time/strftime_l.c
  #if defined emacs && !defined HAVE_BCOPY
  # define HAVE_MEMCPY 1
  #endif
-@@ -882,7 +886,7 @@
+@@ -882,7 +886,7 @@ __strftime_internal (s, maxsize, format,
  	case L_('C'):
  	  if (modifier == L_('E'))
  	    {
@@ -15948,7 +15949,7 @@ Index: git/time/strftime_l.c
  	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
  	      if (era)
  		{
-@@ -955,7 +959,7 @@
+@@ -955,7 +959,7 @@ __strftime_internal (s, maxsize, format,
  
  	  if (modifier == L_('O') && 0 <= number_value)
  	    {
@@ -15957,7 +15958,7 @@ Index: git/time/strftime_l.c
  	      /* Get the locale specific alternate representation of
  		 the number NUMBER_VALUE.  If none exist NULL is returned.  */
  	      const CHAR_T *cp = nl_get_alt_digit (number_value
-@@ -1260,7 +1264,7 @@
+@@ -1260,7 +1264,7 @@ __strftime_internal (s, maxsize, format,
  	case L_('Y'):
  	  if (modifier == 'E')
  	    {
@@ -15966,7 +15967,7 @@ Index: git/time/strftime_l.c
  	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
  	      if (era)
  		{
-@@ -1285,7 +1289,7 @@
+@@ -1285,7 +1289,7 @@ __strftime_internal (s, maxsize, format,
  	case L_('y'):
  	  if (modifier == L_('E'))
  	    {
@@ -15977,8 +15978,8 @@ Index: git/time/strftime_l.c
  		{
 Index: git/time/strptime_l.c
 ===================================================================
---- git.orig/time/strptime_l.c	2014-08-29 20:00:59.528070587 -0700
-+++ git/time/strptime_l.c	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/time/strptime_l.c
++++ git/time/strptime_l.c
 @@ -29,6 +29,7 @@
  
  #ifdef _LIBC
@@ -15987,7 +15988,7 @@ Index: git/time/strptime_l.c
  # include "../locale/localeinfo.h"
  #endif
  
-@@ -84,7 +85,7 @@
+@@ -84,7 +85,7 @@ localtime_r (t, tp)
      if (val < from || val > to)						      \
        return NULL;							      \
    } while (0)
@@ -15996,7 +15997,7 @@ Index: git/time/strptime_l.c
  # define get_alt_number(from, to, n) \
    ({									      \
       __label__ do_normal;						      \
-@@ -820,6 +821,7 @@
+@@ -820,6 +821,7 @@ __strptime_internal (rp, fmt, tmp, state
  	      s.want_xday = 1;
  	      break;
  	    case 'C':
@@ -16004,7 +16005,7 @@ Index: git/time/strptime_l.c
  	      if (s.decided != raw)
  		{
  		  if (s.era_cnt >= 0)
-@@ -856,10 +858,12 @@
+@@ -856,10 +858,12 @@ __strptime_internal (rp, fmt, tmp, state
  
  		  s.decided = raw;
  		}
@@ -16017,7 +16018,7 @@ Index: git/time/strptime_l.c
  	      if (s.decided != raw)
  		{
  		  get_number(0, 9999, 4);
-@@ -918,9 +922,10 @@
+@@ -918,9 +922,10 @@ __strptime_internal (rp, fmt, tmp, state
  
  		  s.decided = raw;
  		}
@@ -16029,7 +16030,7 @@ Index: git/time/strptime_l.c
  	      if (s.decided != raw)
  		{
  		  num_eras = _NL_CURRENT_WORD (LC_TIME,
-@@ -948,6 +953,7 @@
+@@ -948,6 +953,7 @@ __strptime_internal (rp, fmt, tmp, state
  
  		  s.decided = raw;
  		}
@@ -16037,7 +16038,7 @@ Index: git/time/strptime_l.c
  	      get_number (0, 9999, 4);
  	      tm->tm_year = val - 1900;
  	      s.want_century = 0;
-@@ -1118,6 +1124,7 @@
+@@ -1118,6 +1124,7 @@ __strptime_internal (rp, fmt, tmp, state
  	tm->tm_year = (s.century - 19) * 100;
      }
  
@@ -16045,7 +16046,7 @@ Index: git/time/strptime_l.c
    if (s.era_cnt != -1)
      {
        era = _nl_select_era_entry (s.era_cnt HELPER_LOCALE_ARG);
-@@ -1132,6 +1139,7 @@
+@@ -1132,6 +1139,7 @@ __strptime_internal (rp, fmt, tmp, state
  	tm->tm_year = era->start_date[0];
      }
    else
@@ -16055,9 +16056,9 @@ Index: git/time/strptime_l.c
  	/* No era found but we have seen an E modifier.  Rectify some
 Index: git/timezone/Makefile
 ===================================================================
---- git.orig/timezone/Makefile	2014-08-29 20:01:14.044070587 -0700
-+++ git/timezone/Makefile	2014-08-29 20:01:15.244070587 -0700
-@@ -115,7 +115,7 @@
+--- git.orig/timezone/Makefile
++++ git/timezone/Makefile
+@@ -115,7 +115,7 @@ $(testdata)/Asia/Tokyo: asia $(zic-deps)
  
  $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	sed -e 's|/bin/bash|/bin/sh|' \
@@ -16068,8 +16069,8 @@ Index: git/timezone/Makefile
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
 Index: git/wcsmbs/Makefile
 ===================================================================
---- git.orig/wcsmbs/Makefile	2014-08-29 20:00:59.548070587 -0700
-+++ git/wcsmbs/Makefile	2014-08-29 20:01:15.244070587 -0700
+--- git.orig/wcsmbs/Makefile
++++ git/wcsmbs/Makefile
 @@ -18,15 +18,21 @@
  #
  #	Sub-makefile for wcsmbs portion of the library.
@@ -16094,7 +16095,7 @@ Index: git/wcsmbs/Makefile
  	    btowc wctob mbsinit \
  	    mbrlen mbrtowc wcrtomb mbsrtowcs wcsrtombs \
  	    mbsnrtowcs wcsnrtombs wcsnlen wcschrnul \
-@@ -38,14 +44,19 @@
+@@ -38,14 +44,19 @@ routines := wcscat wcschr wcscmp wcscpy
  	    wcscoll_l wcsxfrm_l \
  	    wcscasecmp wcsncase wcscasecmp_l wcsncase_l \
  	    wcsmbsload mbsrtowcs_l \
@@ -16120,8 +16121,8 @@ Index: git/wcsmbs/Makefile
  
 Index: git/wcsmbs/wcsmbsload.c
 ===================================================================
---- git.orig/wcsmbs/wcsmbsload.c	2014-08-29 20:00:59.580070587 -0700
-+++ git/wcsmbs/wcsmbsload.c	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/wcsmbs/wcsmbsload.c
++++ git/wcsmbs/wcsmbsload.c
 @@ -21,6 +21,7 @@
  #include <limits.h>
  #include <stdlib.h>
@@ -16130,7 +16131,7 @@ Index: git/wcsmbs/wcsmbsload.c
  
  #include <locale/localeinfo.h>
  #include <wcsmbsload.h>
-@@ -143,6 +144,7 @@
+@@ -143,6 +144,7 @@ __wcsmbs_getfct (const char *to, const c
    })
  
  
@@ -16138,7 +16139,7 @@ Index: git/wcsmbs/wcsmbsload.c
  /* Some of the functions here must not be used while setlocale is called.  */
  __libc_rwlock_define (extern, __libc_setlocale_lock attribute_hidden)
  
-@@ -211,6 +213,17 @@
+@@ -211,6 +213,17 @@ __wcsmbs_load_conv (struct __locale_data
  
    __libc_rwlock_unlock (__libc_setlocale_lock);
  }
@@ -16158,8 +16159,8 @@ Index: git/wcsmbs/wcsmbsload.c
  /* Clone the current conversion function set.  */
 Index: git/wctype/Makefile
 ===================================================================
---- git.orig/wctype/Makefile	2014-08-29 20:00:59.584070587 -0700
-+++ git/wctype/Makefile	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/wctype/Makefile
++++ git/wctype/Makefile
 @@ -18,14 +18,20 @@
  #
  #	Sub-makefile for wctype portion of the library.
@@ -16186,8 +16187,8 @@ Index: git/wctype/Makefile
  include ../Rules
 Index: git/sysdeps/nptl/Makefile
 ===================================================================
---- git.orig/sysdeps/nptl/Makefile	2014-08-29 20:00:58.036070587 -0700
-+++ git/sysdeps/nptl/Makefile	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/sysdeps/nptl/Makefile
++++ git/sysdeps/nptl/Makefile
 @@ -18,6 +18,9 @@
  
  ifeq ($(subdir),nptl)
@@ -16200,8 +16201,8 @@ Index: git/sysdeps/nptl/Makefile
  ifeq ($(subdir),rt)
 Index: git/sysdeps/nptl/bits/libc-lock.h
 ===================================================================
---- git.orig/sysdeps/nptl/bits/libc-lock.h	2014-08-29 20:00:58.036070587 -0700
-+++ git/sysdeps/nptl/bits/libc-lock.h	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/sysdeps/nptl/bits/libc-lock.h
++++ git/sysdeps/nptl/bits/libc-lock.h
 @@ -24,6 +24,14 @@
  #include <stddef.h>
  
@@ -16217,7 +16218,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  /* Mutex type.  */
  #if defined _LIBC || defined _IO_MTSAFE_IO
  # if (defined NOT_IN_libc && !defined IS_IN_libpthread) || !defined _LIBC
-@@ -87,6 +95,14 @@
+@@ -87,6 +95,14 @@ typedef struct __libc_lock_recursive_opa
  
  /* Lock the recursive named lock variable.  */
  #if defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)
@@ -16232,7 +16233,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  # define __libc_lock_lock_recursive(NAME) \
    do {									      \
      void *self = THREAD_SELF;						      \
-@@ -97,6 +113,10 @@
+@@ -97,6 +113,10 @@ typedef struct __libc_lock_recursive_opa
        }									      \
      ++(NAME).cnt;							      \
    } while (0)
@@ -16243,7 +16244,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  #else
  # define __libc_lock_lock_recursive(NAME) \
    __libc_maybe_call (__pthread_mutex_lock, (&(NAME).mutex), 0)
-@@ -104,6 +124,14 @@
+@@ -104,6 +124,14 @@ typedef struct __libc_lock_recursive_opa
  
  /* Try to lock the recursive named lock variable.  */
  #if defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)
@@ -16258,7 +16259,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  # define __libc_lock_trylock_recursive(NAME) \
    ({									      \
      int result = 0;							      \
-@@ -122,6 +150,10 @@
+@@ -122,6 +150,10 @@ typedef struct __libc_lock_recursive_opa
        ++(NAME).cnt;							      \
      result;								      \
    })
@@ -16269,7 +16270,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  #else
  # define __libc_lock_trylock_recursive(NAME) \
    __libc_maybe_call (__pthread_mutex_trylock, (&(NAME).mutex), 0)
-@@ -129,6 +161,14 @@
+@@ -129,6 +161,14 @@ typedef struct __libc_lock_recursive_opa
  
  /* Unlock the recursive named lock variable.  */
  #if defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)
@@ -16284,7 +16285,7 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
  /* We do no error checking here.  */
  # define __libc_lock_unlock_recursive(NAME) \
    do {									      \
-@@ -138,6 +178,10 @@
+@@ -138,6 +178,10 @@ typedef struct __libc_lock_recursive_opa
  	lll_unlock ((NAME).lock, LLL_PRIVATE);				      \
        }									      \
    } while (0)
@@ -16297,8 +16298,8 @@ Index: git/sysdeps/nptl/bits/libc-lock.h
    __libc_maybe_call (__pthread_mutex_unlock, (&(NAME).mutex), 0)
 Index: git/sysdeps/nptl/bits/libc-lockP.h
 ===================================================================
---- git.orig/sysdeps/nptl/bits/libc-lockP.h	2014-08-29 20:00:58.044070587 -0700
-+++ git/sysdeps/nptl/bits/libc-lockP.h	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/sysdeps/nptl/bits/libc-lockP.h
++++ git/sysdeps/nptl/bits/libc-lockP.h
 @@ -33,6 +33,8 @@
  #include <lowlevellock.h>
  #include <tls.h>
@@ -16308,7 +16309,7 @@ Index: git/sysdeps/nptl/bits/libc-lockP.h
  
  /* Mutex type.  */
  #if defined NOT_IN_libc && !defined IS_IN_libpthread
-@@ -159,10 +161,22 @@
+@@ -159,10 +161,22 @@ typedef pthread_key_t __libc_key_t;
  
  /* Lock the named lock variable.  */
  #if !defined NOT_IN_libc || defined IS_IN_libpthread
@@ -16334,7 +16335,7 @@ Index: git/sysdeps/nptl/bits/libc-lockP.h
  #else
  # undef __libc_lock_lock
  # define __libc_lock_lock(NAME) \
-@@ -175,10 +189,22 @@
+@@ -175,10 +189,22 @@ typedef pthread_key_t __libc_key_t;
  
  /* Try to lock the named lock variable.  */
  #if !defined NOT_IN_libc || defined IS_IN_libpthread
@@ -16360,7 +16361,7 @@ Index: git/sysdeps/nptl/bits/libc-lockP.h
  #else
  # undef __libc_lock_trylock
  # define __libc_lock_trylock(NAME) \
-@@ -194,8 +220,20 @@
+@@ -194,8 +220,20 @@ typedef pthread_key_t __libc_key_t;
  
  /* Unlock the named lock variable.  */
  #if !defined NOT_IN_libc || defined IS_IN_libpthread
@@ -16383,8 +16384,8 @@ Index: git/sysdeps/nptl/bits/libc-lockP.h
    __libc_maybe_call (__pthread_mutex_unlock, (&(NAME)), 0)
 Index: git/sysdeps/nptl/small-macros-fns.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/nptl/small-macros-fns.c	2014-08-29 20:01:15.248070587 -0700
+--- /dev/null
++++ git/sysdeps/nptl/small-macros-fns.c
 @@ -0,0 +1,72 @@
 +/* EGLIBC: function wrappers for big macros.
 +   Copyright (C) 2009 Free Software Foundation, Inc.
@@ -16460,8 +16461,8 @@ Index: git/sysdeps/nptl/small-macros-fns.c
 +#endif /*defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)*/
 Index: git/include/libc-symbols.h
 ===================================================================
---- git.orig/include/libc-symbols.h	2014-08-29 20:00:47.144070587 -0700
-+++ git/include/libc-symbols.h	2014-08-29 20:01:15.248070587 -0700
+--- git.orig/include/libc-symbols.h
++++ git/include/libc-symbols.h
 @@ -60,8 +60,11 @@
  /* Define these macros for the benefit of portable GNU code that wants to check
     them.  Of course, STDC_HEADERS is never false when building libc!  */
@@ -16478,8 +16479,8 @@ Index: git/include/libc-symbols.h
  #define HAVE_ISWCTYPE	1
 Index: git/crypt/crypt_common.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/crypt/crypt_common.c	2014-08-29 20:01:15.248070587 -0700
+--- /dev/null
++++ git/crypt/crypt_common.c
 @@ -0,0 +1,42 @@
 +/*
 + * crypt: crypt(3) implementation
@@ -16525,9 +16526,9 @@ Index: git/crypt/crypt_common.c
 +}
 Index: git/crypt/crypt_util.c
 ===================================================================
---- git.orig/crypt/crypt_util.c	2014-08-29 20:00:43.028070587 -0700
-+++ git/crypt/crypt_util.c	2014-08-29 20:01:15.248070587 -0700
-@@ -242,10 +242,6 @@
+--- git.orig/crypt/crypt_util.c
++++ git/crypt/crypt_util.c
+@@ -242,10 +242,6 @@ static ufc_long eperm32tab[4][256][2];
   */
  static ufc_long efp[16][64][2];
  
@@ -16538,7 +16539,7 @@ Index: git/crypt/crypt_util.c
  /*
   * For use by the old, non-reentrant routines
   * (crypt/encrypt/setkey)
-@@ -949,17 +945,3 @@
+@@ -949,17 +945,3 @@ setkey(__key)
  {
    __setkey_r(__key, &_ufc_foobar);
  }
@@ -16558,9 +16559,9 @@ Index: git/crypt/crypt_util.c
 -}
 Index: git/sysdeps/arm/Makefile
 ===================================================================
---- git.orig/sysdeps/arm/Makefile	2014-08-29 20:29:37.000000000 -0700
-+++ git/sysdeps/arm/Makefile	2014-08-29 20:31:09.904070587 -0700
-@@ -37,10 +37,13 @@
+--- git.orig/sysdeps/arm/Makefile
++++ git/sysdeps/arm/Makefile
+@@ -37,10 +37,13 @@ ifeq ($(subdir),csu)
  # get offset to rtld_global._dl_hwcap
  gen-as-const-headers += rtld-global-offsets.sym tlsdesc.sym
  aeabi_constants = aeabi_lcsts aeabi_sighandlers aeabi_math
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 9dd5e67..f67fbfd 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -90,9 +90,12 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-selinux \
                 --enable-obsolete-rpc \
                 --with-kconfig=${STAGING_BINDIR_NATIVE} \
+                --disable-nscd \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl', '--enable-nscd', '--disable-nscd', d)}"
+
 
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
-- 
2.1.0


