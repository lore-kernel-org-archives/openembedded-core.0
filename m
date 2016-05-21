Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05C5665CBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 10:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LAtdN1003012 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:55:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WmiUDSfGnV_b
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:55:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LAtah5003009
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:55:37 +0100
Message-ID: <1463828136.4578.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 11:55:36 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] nativesdk-glibc: Extend relocation support to locales
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
X-List-Received-Date: Sat, 21 May 2016 10:55:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently locales are not found in a relocated buildtools-tarball
such as that used in eSDK. This breaks bitbake when used under python3.

This patch adds enough relocation magic to nativesdk-glibc so that
the binary locales can be found even in a relocated buildtools-tarball
and bitbake works successfully under python3. The eSDK also works 
correctly after this change too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 2e7971c..7cba6cc 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -24,10 +24,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  sysdeps/generic/dl-cache.h | 4 ----
  6 files changed, 13 insertions(+), 9 deletions(-)
 
-diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index cfa335e..daa12ec 100644
---- a/elf/dl-cache.c
-+++ b/elf/dl-cache.c
+Index: git/elf/dl-cache.c
+===================================================================
+--- git.orig/elf/dl-cache.c
++++ git/elf/dl-cache.c
 @@ -132,6 +132,10 @@ do									      \
  while (0)
  
@@ -39,11 +39,11 @@ index cfa335e..daa12ec 100644
  int
  internal_function
  _dl_cache_libcmp (const char *p1, const char *p2)
-diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c7b8797..37a1beb 100644
---- a/elf/dl-load.c
-+++ b/elf/dl-load.c
-@@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_relro;
+Index: git/elf/dl-load.c
+===================================================================
+--- git.orig/elf/dl-load.c
++++ git/elf/dl-load.c
+@@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_re
  /* Get the generated information about the trusted directories.  */
  #include "trusted-dirs.h"
  
@@ -54,10 +54,10 @@ index c7b8797..37a1beb 100644
  {
    SYSTEM_DIRS_LEN
  };
-diff --git a/elf/interp.c b/elf/interp.c
-index 9448802..e7e8c70 100644
---- a/elf/interp.c
-+++ b/elf/interp.c
+Index: git/elf/interp.c
+===================================================================
+--- git.orig/elf/interp.c
++++ git/elf/interp.c
 @@ -18,5 +18,5 @@
  
  #include <runtime-linker.h>
@@ -65,10 +65,10 @@ index 9448802..e7e8c70 100644
 -const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
-diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 467ca82..631a2a9 100644
---- a/elf/ldconfig.c
-+++ b/elf/ldconfig.c
+Index: git/elf/ldconfig.c
+===================================================================
+--- git.orig/elf/ldconfig.c
++++ git/elf/ldconfig.c
 @@ -168,6 +168,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
@@ -79,10 +79,10 @@ index 467ca82..631a2a9 100644
  /* Check if string corresponds to an important hardware capability or
     a platform.  */
  static int
-diff --git a/elf/rtld.c b/elf/rtld.c
-index 647661c..4e16a43 100644
---- a/elf/rtld.c
-+++ b/elf/rtld.c
+Index: git/elf/rtld.c
+===================================================================
+--- git.orig/elf/rtld.c
++++ git/elf/rtld.c
 @@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
  strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
  #endif
@@ -91,7 +91,7 @@ index 647661c..4e16a43 100644
  
  /* List of auditing DSOs.  */
  static struct audit_list
-@@ -873,12 +874,12 @@ of this helper program; chances are you did not intend to run this program.\n\
+@@ -873,12 +874,12 @@ of this helper program; chances are you
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -106,10 +106,10 @@ index 647661c..4e16a43 100644
  
        ++_dl_skip_args;
        --_dl_argc;
-diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index eb2f900..505804e 100644
---- a/sysdeps/generic/dl-cache.h
-+++ b/sysdeps/generic/dl-cache.h
+Index: git/sysdeps/generic/dl-cache.h
+===================================================================
+--- git.orig/sysdeps/generic/dl-cache.h
++++ git/sysdeps/generic/dl-cache.h
 @@ -27,10 +27,6 @@
    ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
  #endif
@@ -121,9 +121,10 @@ index eb2f900..505804e 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
-diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
---- a/iconv/gconv_conf.c
-+++ b/iconv/gconv_conf.c
+Index: git/iconv/gconv_conf.c
+===================================================================
+--- git.orig/iconv/gconv_conf.c
++++ git/iconv/gconv_conf.c
 @@ -36,7 +36,7 @@
  
  
@@ -133,6 +134,38 @@ diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
  
  /* The path elements, as determined by the __gconv_get_path function.
     All path elements end in a slash.  */
--- 
-2.8.2
-
+Index: git/locale/findlocale.c
+===================================================================
+--- git.orig/locale/findlocale.c
++++ git/locale/findlocale.c
+@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attr
+    which are somehow addressed.  */
+ struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
+ 
+-const char _nl_default_locale_path[] attribute_hidden = COMPLOCALEDIR;
++char _nl_default_locale_path[4096] __attribute__ ((section (".gccrelocprefix"))) attribute_hidden = COMPLOCALEDIR;
+ 
+ /* Checks if the name is actually present, that is, not NULL and not
+    empty.  */
+@@ -168,7 +168,7 @@ _nl_find_locale (const char *locale_path
+ 
+       /* Nothing in the archive.  Set the default path to search below.  */
+       locale_path = _nl_default_locale_path;
+-      locale_path_len = sizeof _nl_default_locale_path;
++      locale_path_len = strlen(_nl_default_locale_path) + 1;
+     }
+   else
+     /* We really have to load some data.  First see whether the name is
+Index: git/locale/localeinfo.h
+===================================================================
+--- git.orig/locale/localeinfo.h
++++ git/locale/localeinfo.h
+@@ -322,7 +322,7 @@ _nl_lookup_word (locale_t l, int categor
+ }
+ 
+ /* Default search path if no LOCPATH environment variable.  */
+-extern const char _nl_default_locale_path[] attribute_hidden;
++extern char _nl_default_locale_path[] attribute_hidden;
+ 
+ /* Load the locale data for CATEGORY from the file specified by *NAME.
+    If *NAME is "", use environment variables as specified by POSIX, and



