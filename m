Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 72E6774505
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:09:00 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w3C791H2010870
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 09:09:01 +0200
Received: from dev.vm6.ccp.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w3C791kI009869;
	Thu, 12 Apr 2018 09:09:01 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C84B69D9EE0;
	Thu, 12 Apr 2018 09:09:00 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 09:08:57 +0200
Message-Id: <20180412070857.29235-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180410113605.28238-1-andrej.valek@siemens.com>
References: <20180410113605.28238-1-andrej.valek@siemens.com>
Subject: [PATCH v2] dropbear: update to 2018.76
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
X-List-Received-Date: Thu, 12 Apr 2018 07:09:01 -0000

- update dropbear to version 2018.76
- refresh and drop obsolete patches
- add option to use localoptions.h header file
- do not use harden stuff, which leads to QA warning

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |   8 +-
 .../0001-urandom-xauth-changes-to-options.h.patch  |  16 +--
 .../dropbear/dropbear/0003-configure.patch         |  43 -------
 .../dropbear/0005-dropbear-enable-pam.patch        |  40 +++---
 .../dropbear/0007-dropbear-fix-for-x32-abi.patch   | 140 ---------------------
 .../0007-fix-localoptions-search-path.patch        |  51 ++++++++
 .../fix-libtomcrypt-libtommath-ordering.patch      |  49 --------
 meta/recipes-core/dropbear/dropbear_2017.75.bb     |   5 -
 meta/recipes-core/dropbear/dropbear_2018.76.bb     |   5 +
 9 files changed, 92 insertions(+), 265 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0003-configure.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2017.75.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2018.76.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index b6b436c584..16ac6442f8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -14,10 +14,8 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
-           file://0007-dropbear-fix-for-x32-abi.patch \
-           file://fix-libtomcrypt-libtommath-ordering.patch \
+           file://0007-fix-localoptions-search-path.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
@@ -52,6 +50,10 @@ PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom
 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
+# This option appends to CFLAGS and LDFLAGS from OE
+# This is causing [textrel] QA warning
+EXTRA_OECONF += "--disable-harden"
+
 do_install() {
 	install -d ${D}${sysconfdir} \
 		${D}${sysconfdir}/init.d \
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index dc9d5782e8..684641dcbd 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -2,20 +2,20 @@ Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
 
 Upstream-Status: Inappropriate [configuration]
 ---
- options.h | 2 +-
+ default_options.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/options.h b/options.h
-index 7d06322..71a21c2 100644
---- a/options.h
-+++ b/options.h
-@@ -247,7 +247,7 @@ much traffic. */
+diff --git a/default_options.h b/default_options.h
+index 3b75eb8..1fd8082 100644
+--- a/default_options.h
++++ b/default_options.h
+@@ -243,7 +243,7 @@ Homedir is prepended unless path begins with / */
+ 
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
- #ifndef XAUTH_COMMAND
 -#define XAUTH_COMMAND "/usr/bin/xauth -q"
 +#define XAUTH_COMMAND "xauth -q"
- #endif
+ 
  
  /* if you want to enable running an sftp server (such as the one included with
 -- 
diff --git a/meta/recipes-core/dropbear/dropbear/0003-configure.patch b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
deleted file mode 100644
index 8469a50eff..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0003-configure.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 58dd24a80ca0f400d0761afd9ce2b7f684fc9125 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Thu, 25 Apr 2013 00:27:25 +0200
-Subject: [PATCH] configure: add a variable to allow openpty check to be cached
-
-Upstream-Status: Submitted [ https://github.com/mkj/dropbear/pull/48 ]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- configure.ac | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 893b904..245408d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -177,15 +177,20 @@ AC_ARG_ENABLE(openpty,
- 			AC_MSG_NOTICE(Not using openpty)
- 		else
- 			AC_MSG_NOTICE(Using openpty if available)
--			AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)])
-+			AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
- 		fi
- 	],
- 	[
- 		AC_MSG_NOTICE(Using openpty if available)
--		AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY)])
-+		AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
- 	]
- )
--		
-+
-+if test "x$dropbear_cv_func_have_openpty" = "xyes"; then
-+	AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)
-+	no_ptc_check=yes
-+	no_ptmx_check=yes
-+fi
- 
- AC_ARG_ENABLE(syslog,
- 	[  --disable-syslog        Don't include syslog support],
--- 
-2.8.1
-
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 539cb12e91..857681520c 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -3,7 +3,7 @@ From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: Enable pam
 
-We need modify file option.h besides enabling pam in
+We need modify file default_options.h besides enabling pam in
 configure if we want dropbear to support pam.
 
 Upstream-Status: Pending
@@ -11,26 +11,32 @@ Upstream-Status: Pending
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- options.h | 4 ++--
+ default_options.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/options.h b/options.h
-index 94261f6..90bfe2f 100644
---- a/options.h
-+++ b/options.h
-@@ -208,10 +208,10 @@ If you test it please contact the Dropbear author */
+diff --git a/default_options.h b/default_options.h
+index 3b75eb8..8617cd0 100644
+--- a/default_options.h
++++ b/default_options.h
+@@ -179,7 +179,7 @@ group1 in Dropbear server too */
  
- /* This requires crypt() */
- #ifdef HAVE_CRYPT
--#define ENABLE_SVR_PASSWORD_AUTH
-+/*#define ENABLE_SVR_PASSWORD_AUTH*/
- #endif
- /* PAM requires ./configure --enable-pam */
--/*#define ENABLE_SVR_PAM_AUTH */
-+#define ENABLE_SVR_PAM_AUTH
- #define ENABLE_SVR_PUBKEY_AUTH
+ /* Authentication Types - at least one required.
+    RFC Draft requires pubkey auth, and recommends password */
+-#define DROPBEAR_SVR_PASSWORD_AUTH 1
++#define DROPBEAR_SVR_PASSWORD_AUTH 0
+ 
+ /* Note: PAM auth is quite simple and only works for PAM modules which just do
+  * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
+@@ -187,7 +187,7 @@ group1 in Dropbear server too */
+  * but there's an interface via a PAM module. It won't work for more complex
+  * PAM challenge/response.
+  * You can't enable both PASSWORD and PAM. */
+-#define DROPBEAR_SVR_PAM_AUTH 0
++#define DROPBEAR_SVR_PAM_AUTH 1
+ 
+ /* ~/.ssh/authorized_keys authentication */
+ #define DROPBEAR_SVR_PUBKEY_AUTH 1
  
- /* Whether to take public key options in 
 -- 
 2.1.4
 
diff --git a/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch b/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
deleted file mode 100644
index 60b302b5cd..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-Upstream-Status: Pending
-
-The dropbearkey utility built in x32 abi format, when generating ssh
-keys, was getting lost in the infinite loop.
-
-This patch fixes the issue by fixing types of variables and
-parameters of functions used in the code, which were getting
-undesired size, when compiled with the x32 abi toolchain.
-
-2013/05/23
-Received this fix from H J Lu.
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-# HG changeset patch
-# User H.J. Lu <hjl.tools@gmail.com>
-# Date 1369344079 25200
-# Node ID a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
-# Parent  e76614145aea67f66e4a4257685c771efba21aa1
-Typdef mp_digit to unsigned long long for MP_64BIT
-
-When GCC is used with MP_64BIT, we should typedef mp_digit to unsigned
-long long instead of unsigned long since for x32, unsigned long is
-32-bit and unsigned long long is 64-bit and it is safe to use unsigned
-long long for 64-bit integer with GCC.
-
-diff -r e76614145aea -r a10a1c46b857 libtommath/tommath.h
---- a/libtommath/tommath.h	Thu Apr 18 22:57:47 2013 +0800
-+++ b/libtommath/tommath.h	Thu May 23 14:21:19 2013 -0700
-@@ -73,7 +73,7 @@
-    typedef signed long long   long64;
- #endif
-
--   typedef unsigned long      mp_digit;
-+   typedef unsigned long long mp_digit;
-    typedef unsigned long      mp_word __attribute__ ((mode(TI)));
-
-    #define DIGIT_BIT          60
-# HG changeset patch
-# User H.J. Lu <hjl.tools@gmail.com>
-# Date 1369344241 25200
-# Node ID c7555a4cb7ded3a88409ba85f4027baa7af5f536
-# Parent  a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
-Cast to mp_digit when updating *rho
-
-There is
-
-int
-mp_montgomery_setup (mp_int * n, mp_digit * rho)
-
-We should cast to mp_digit instead of unsigned long when updating
-*rho since mp_digit may be unsigned long long and unsigned long long
-may be different from unsigned long, like in x32.
-
-diff -r a10a1c46b857 -r c7555a4cb7de libtommath/bn_mp_montgomery_setup.c
---- a/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:21:19 2013 -0700
-+++ b/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:24:01 2013 -0700
-@@ -48,7 +48,7 @@
- #endif
-
-   /* rho = -1/m mod b */
--  *rho = (unsigned long)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
-+  *rho = (mp_digit)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
-
-   return MP_OKAY;
- }
-# HG changeset patch
-# User H.J. Lu <hjl.tools@gmail.com>
-# Date 1369344541 25200
-# Node ID 7c656e7071a6412688b2f30a529a9afac6c7bf5a
-# Parent  c7555a4cb7ded3a88409ba85f4027baa7af5f536
-Define LTC_FAST_TYPE to unsigned long long for __x86_64__
-
-We should define LTC_FAST_TYPE to unsigned long long instead of unsigned
-long if __x86_64__ to support x32 where unsigned long long is 64-bit
-and unsigned long is 32-bit.
-
-diff -r c7555a4cb7de -r 7c656e7071a6 libtomcrypt/src/headers/tomcrypt_cfg.h
---- a/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:24:01 2013 -0700
-+++ b/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:29:01 2013 -0700
-@@ -74,7 +74,7 @@
-    #define ENDIAN_LITTLE
-    #define ENDIAN_64BITWORD
-    #define LTC_FAST
--   #define LTC_FAST_TYPE    unsigned long
-+   #define LTC_FAST_TYPE    unsigned long long
- #endif
-
- /* detect PPC32 */
-# HG changeset patch
-# User H.J. Lu <hjl.tools@gmail.com>
-# Date 1369344730 25200
-# Node ID a7d4690158fae4ede2c4e5b56233e83730bf38ee
-# Parent  7c656e7071a6412688b2f30a529a9afac6c7bf5a
-Use unsigned long long aas unsigned 64-bit integer for x86-64 GCC
-
-We should use unsigned long long instead of unsigned long as unsigned
-64-bit integer for x86-64 GCC to support x32 where unsigned long is
-32-bit.
-
-diff -r 7c656e7071a6 -r a7d4690158fa libtomcrypt/src/headers/tomcrypt_macros.h
---- a/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:29:01 2013 -0700
-+++ b/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:32:10 2013 -0700
-@@ -343,7 +343,7 @@
- /* 64-bit Rotates */
- #if !defined(__STRICT_ANSI__) && defined(__GNUC__) && defined(__x86_64__) && !defined(LTC_NO_ASM)
-
--static inline unsigned long ROL64(unsigned long word, int i)
-+static inline unsigned long long ROL64(unsigned long long word, int i)
- {
-    asm("rolq %%cl,%0"
-       :"=r" (word)
-@@ -351,7 +351,7 @@
-    return word;
- }
-
--static inline unsigned long ROR64(unsigned long word, int i)
-+static inline unsigned long long ROR64(unsigned long long word, int i)
- {
-    asm("rorq %%cl,%0"
-       :"=r" (word)
-@@ -361,7 +361,7 @@
-
- #ifndef LTC_NO_ROLC
-
--static inline unsigned long ROL64c(unsigned long word, const int i)
-+static inline unsigned long long ROL64c(unsigned long long word, const int i)
- {
-    asm("rolq %2,%0"
-       :"=r" (word)
-@@ -369,7 +369,7 @@
-    return word;
- }
-
--static inline unsigned long ROR64c(unsigned long word, const int i)
-+static inline unsigned long long ROR64c(unsigned long long word, const int i)
- {
-    asm("rorq %2,%0"
-       :"=r" (word)
-
diff --git a/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch b/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch
new file mode 100644
index 0000000000..02a6cf9268
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch
@@ -0,0 +1,51 @@
+From a63288c4d203850110a5a72d27fa0d7202ceadbc Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Tue, 10 Apr 2018 12:30:09 +0200
+Subject: [PATCH] fix localoptions.h searching in out of tree building
+
+When dropbear is build out of tree, is necessary to search for localoptions
+header file is source directory.
+
+Upstream-Status: Submitted [https://github.com/mkj/dropbear/pull/62]
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e7d52a2..a615896 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -17,6 +17,9 @@ STATIC_LTM=libtommath/libtommath.a
+ 
+ LIBTOM_LIBS=@LIBTOM_LIBS@
+ 
++VPATH=@srcdir@
++srcdir=@srcdir@
++
+ ifeq (@BUNDLED_LIBTOM@, 1)
+ LIBTOM_DEPS=$(STATIC_LTC) $(STATIC_LTM) 
+ LIBTOM_CLEAN=ltc-clean ltm-clean
+@@ -25,7 +28,7 @@ LIBTOM_LIBS=$(STATIC_LTC) $(STATIC_LTM)
+ endif
+ 
+ OPTION_HEADERS = default_options_guard.h sysoptions.h
+-ifneq ($(wildcard localoptions.h),)
++ifneq ($(wildcard $(srcdir)/localoptions.h),)
+ CFLAGS+=-DLOCALOPTIONS_H_EXISTS
+ OPTION_HEADERS += localoptions.h
+ endif
+@@ -65,9 +68,6 @@ dropbearkeyobjs=$(COMMONOBJS) $(KEYOBJS)
+ dropbearconvertobjs=$(COMMONOBJS) $(CONVERTOBJS)
+ scpobjs=$(SCPOBJS)
+ 
+-VPATH=@srcdir@
+-srcdir=@srcdir@
+-
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ datarootdir = @datarootdir@
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch b/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
deleted file mode 100644
index 2b05e1893d..0000000000
--- a/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f37fa9a41f248fa41dd74a41c66cb41a291c03d2 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 16 Sep 2016 12:18:23 -0700
-Subject: [PATCH] fix libtomcrypt/libtommath ordering
-
-To prevent build failures when using system libtom libraries and
-linking with --as-needed, LIBTOM_LIBS should be in the order
--ltomcrypt -ltommath, not the other way around, ie libs should be
-prepended to LIBTOM_LIBS as they are found, not appended.
-
-Note that LIBTOM_LIBS is not used when linking with the bundled
-libtom libs.
-
-Upstream-Status: Backport [ https://github.com/mkj/dropbear/commit/f9e6bc2aecab0f4b5b529e07a92cc63c8a66cd4b ]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 245408d..d624853 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -393,16 +393,16 @@ AC_ARG_ENABLE(bundled-libtom,
- 			AC_MSG_NOTICE(Forcing bundled libtom*)
- 		else
- 			BUNDLED_LIBTOM=0
--			AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="$LIBTOM_LIBS -ltommath", 
-+			AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="-ltommath $LIBTOM_LIBS",
- 				[AC_MSG_ERROR([Missing system libtommath and --disable-bundled-libtom was specified])] )
--			AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="$LIBTOM_LIBS -ltomcrypt", 
-+			AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="-ltomcrypt $LIBTOM_LIBS",
- 				[AC_MSG_ERROR([Missing system libtomcrypt and --disable-bundled-libtom was specified])] )
- 		fi
- 	],
- 	[
- 		BUNDLED_LIBTOM=0
--		AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="$LIBTOM_LIBS -ltommath", BUNDLED_LIBTOM=1)
--		AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="$LIBTOM_LIBS -ltomcrypt", BUNDLED_LIBTOM=1)
-+		AC_CHECK_LIB(tommath, mp_exptmod, LIBTOM_LIBS="-ltommath $LIBTOM_LIBS", BUNDLED_LIBTOM=1)
-+		AC_CHECK_LIB(tomcrypt, register_cipher, LIBTOM_LIBS="-ltomcrypt $LIBTOM_LIBS", BUNDLED_LIBTOM=1)
- 	]
- )
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-core/dropbear/dropbear_2017.75.bb b/meta/recipes-core/dropbear/dropbear_2017.75.bb
deleted file mode 100644
index cfb0d199b3..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2017.75.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "e57e9b9d25705dcb073ba15c416424fd"
-SRC_URI[sha256sum] = "6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2018.76.bb b/meta/recipes-core/dropbear/dropbear_2018.76.bb
new file mode 100644
index 0000000000..36a58d5cef
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2018.76.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "c3912f7fcdcc57c99937e4a79480d2c2"
+SRC_URI[sha256sum] = "f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65"
+
-- 
2.11.0


