Return-Path: <charles-antoine.couret@essensium.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDE67540F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:54:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p9so3321804wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=essensium-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=373o3miz/HFRJroiwSneGQxqVj7k22bgoF+Lk4OWM6c=;
	b=ownQ+86MF3VTAT6SVk9AYij8kU09uLe+sSyY4ToMJ5ZDw7d0SoW8+9LwhTmZyak0cv
	1+vqRC+iEbcMyCZ2Mq9+BIVdU3NW6SjxeI08r5i/RNDCtjtaLfluM8bLFMfvBbMiieWZ
	TcnGn8KHfqHxymd2sd7Tgruut5+ZRCoy1kPNcGZKoFaw/MM7au61h5ylsJQOWimZ1JfA
	36MWbyoxFR17CZKwkv84ULMg78pLK8q7V3aOg9p4qvTkBGr9GtVI6roP2P7k8aoABYIw
	Vy9bJEQeT0G2VID1Iyr3HlcUxQzGnQVGQ5a5R6KhsiZSXkkgHPQ8EcbbzNSBBKjq3cdE
	WOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=373o3miz/HFRJroiwSneGQxqVj7k22bgoF+Lk4OWM6c=;
	b=U2/5q1ysuLP8lZGsH8Lv9vvQ7479m0E32HMOQmT9q0MIVOWhL+vbcJSemMRv//0kh1
	OLj6GZow2ibgtZKtHFFBVTwC5aYEHZV5pjlJcRSmYy1lOIWGmUclpw6XZWO/YFJUja3S
	d/QF4Oc4XnBLx4N0II1uIO5F9VWkFqJgKUqjMciFnpKG9cqYT41JXafMnofULLmFCclq
	afWV0a+KP1bgMoprWL2LLhlE6ldG/zhxQjlIwgnb7esdQqsDWMESfGFabbY5xvyBPwAF
	uU0xsAJ5XVifgPQdJcLiEA1Yg1cTN1RqHl5lCn1GJKzQxG0PNTfGgzijUmR+ZXFG58yb
	2aIg==
X-Gm-Message-State: ALQs6tB5R3CK4BPOpb7GP3fwqDOKecmR23SVzxgaf8d/a7jgN1TKnLWX
	gjSNSMbmYQRCQ1k2FMg2SMD0HSl/q0w=
X-Google-Smtp-Source: AIpwx4+NUey/MJx37rjODOAqoV1sGnsEWiBeBmyuTAKhtu963Buv/yJ3kidm0DXf+7FK0PK861l3LA==
X-Received: by 10.80.241.6 with SMTP id w6mr6689937edl.62.1523019252972;
	Fri, 06 Apr 2018 05:54:12 -0700 (PDT)
Received: from localhost.localdomain
	([2a02:a03f:409a:6e00:7d53:e685:9f84:3421])
	by smtp.gmail.com with ESMTPSA id k8sm3418456edn.13.2018.04.06.05.54.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 05:54:12 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 14:53:53 +0200
Message-Id: <20180406125354.21247-2-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 12:54:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to Fedora 28 change (https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcrypt) and probably glibc upstream change, the nativesdk provides libcrypt from libxcrypt instead of pproviding from glibc itself.

The purpose is to provide one uninative file compatible with Fedora >= 28 and other distros. libxcrypt is backwards compatible with libcrypt but not the converse.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
---
 meta/recipes-core/glibc/glibc-package.inc     |   1 +
 .../0031-nativesdk-deprecate-libcrypt.patch   | 418 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb         |   1 +
 .../recipes-core/libxcrypt/libxcrypt_4.0.0.bb |  24 +
 meta/recipes-core/meta/uninative-tarball.bb   |   1 +
 5 files changed, 445 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ff45dfe35a..1b54dd8880 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -16,6 +16,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
+libc_baselibs_remove_class_sdk = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
diff --git a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
new file mode 100644
index 0000000000..6b34c70829
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
@@ -0,0 +1,418 @@
+Background information:
+
+https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
+https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcrypt
+
+Upstream-Status: Submitted [libc-alpha@sourceware.org]
+
+From: Zack Weinberg <zackw@panix.com>
+Subject: [PATCH] Deprecate libcrypt and don't build it by default
+
+Back in June, Björn Esser proposed to add OpenBSD-compatible bcrypt
+support to our implementation of crypt(3), and Zack Weinberg replied
+that it might actually make more sense to _remove_ libcrypt from
+glibc, freeing up libcrypt.so.1 and crypt.h to be provided by a
+separate project that could move faster.  (For instance, libxcrypt:
+https://github.com/besser82/libxcrypt)
+
+This patch disables build and installation of libcrypt by default.  It
+can be re-enabled with --enable-obsolete-crypt to configure.  Unlike
+libnsl, we do *not* install a runtime shared library; that's left to
+the replacement.  (Unlike the SunRPC situation, I think we can
+probably drop this code altogether in a release or two.)
+
+The function prototypes for crypt and encrypt are removed from
+unistd.h, and the function prototype for setkey is removed from
+stdlib.h; they do *not* come back with --enable-obsolete-crypt.  This
+means glibc no longer provides the POSIX CRYPT option, and the macro
+_XOPEN_CRYPT is also removed from unistd.h to indicate that.
+(_SC_XOPEN_CRYPT is still defined, but sysconf(_SC_XOPEN_CRYPT) will
+return -1 at runtime.)  These functions are also unconditionally
+removed from conform/data/{stdlib,unistd}.h-data.
+
+	* posix/unistd.h (_XOPEN_CRYPT, crypt, encrypt): Don't declare.
+	* stdlib/stdlib.h (setkey): Don't declare.
+
+	* configure.ac (--enable-obsolete-crypt): New configure option.
+	* configure: Regenerate.
+	* config.make.in (build-obsolete-crypt): New makefile variable.
+	* crypt/Banner: Delete file.
+	* crypt/Makefile: Don't build anything unless
+	$(build-obsolete-crypt) is 'yes'.
+	* sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile: Only add things
+	to libcrypt-sysdep_routines when $(build-obsolete-crypt) is 'yes'.
+	* sysdeps/sparc/sparc64/multiarch/Makefile: Likewise.
+	* sysdeps/unix/sysv/linux/arm/Makefile: Likewise.
+
+	* conform/Makefile: Only include libcrypt.a in linknamespace tests
+	when $(build-obsolete-crypt) is 'yes'.
+	* conform/data/stdlib.h-data (setkey): Don't expect.
+	* conform/data/unistd.h-data (crypt, encrypt): Don't expect.
+	* elf/Makefile: Only perform various tests of libcrypt.so/libcrypt.a
+	when $(build-obsolete-crypt) is 'yes'.
+	* elf/tst-linkall-static.c: Don't include crypt.h when USE_CRYPT
+	is false.
+---
+ NEWS                                             | 18 ++++++++++++++++++
+ config.make.in                                   |  1 +
+ configure                                        | 13 +++++++++++++
+ configure.ac                                     |  8 ++++++++
+ conform/Makefile                                 | 14 ++++++++++----
+ conform/data/stdlib.h-data                       |  3 ---
+ conform/data/unistd.h-data                       |  6 ------
+ crypt/Makefile                                   |  5 +++++
+ elf/Makefile                                     | 16 ++++++++++++----
+ elf/tst-linkall-static.c                         |  2 ++
+ posix/unistd.h                                   | 16 ----------------
+ stdlib/stdlib.h                                  |  6 ------
+ sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile |  2 ++
+ sysdeps/sparc/sparc64/multiarch/Makefile         |  2 ++
+ sysdeps/unix/sysv/linux/arm/Makefile             |  2 ++
+ 15 files changed, 75 insertions(+), 39 deletions(-)
+
+diff --git a/config.make.in b/config.make.in
+index 9e5e24b2c6..8fe610d04d 100644
+--- a/config.make.in
++++ b/config.make.in
+@@ -82,6 +82,7 @@ mach-interface-list = @mach_interface_list@
+ 
+ experimental-malloc = @experimental_malloc@
+ 
++build-obsolete-crypt = @build_obsolete_crypt@
+ nss-crypt = @libc_cv_nss_crypt@
+ static-nss-crypt = @libc_cv_static_nss_crypt@
+ 
+diff --git a/configure b/configure
+index 7a8bd3f817..46f6bd7f86 100755
+--- a/configure
++++ b/configure
+@@ -672,6 +672,7 @@ base_machine
+ have_tunables
+ build_pt_chown
+ build_nscd
++build_obsolete_crypt
+ build_obsolete_nsl
+ link_obsolete_rpc
+ libc_cv_static_nss_crypt
+@@ -782,6 +783,7 @@ enable_experimental_malloc
+ enable_nss_crypt
+ enable_obsolete_rpc
+ enable_obsolete_nsl
++enable_obsolete_crypt
+ enable_systemtap
+ enable_build_nscd
+ enable_nscd
+@@ -1453,6 +1455,7 @@ Optional Features:
+                           link-time usage
+   --enable-obsolete-nsl   build and install the obsolete libnsl library and
+                           depending NSS modules
++  --enable-obsolete-crypt build and install the obsolete libcrypt library
+   --enable-systemtap      enable systemtap static probe points [default=no]
+   --disable-build-nscd    disable building and installing the nscd daemon
+   --disable-nscd          library functions will not contact the nscd daemon
+@@ -3632,6 +3635,16 @@ if test "$build_obsolete_nsl" = yes; then
+ 
+ fi
+ 
++# Check whether --enable-obsolete-crypt was given.
++if test "${enable_obsolete_crypt+set}" = set; then :
++  enableval=$enable_obsolete_crypt; build_obsolete_crypt=$enableval
++else
++  build_obsolete_crypt=no
++fi
++
++
++
++
+ # Check whether --enable-systemtap was given.
+ if test "${enable_systemtap+set}" = set; then :
+   enableval=$enable_systemtap; systemtap=$enableval
+diff --git a/configure.ac b/configure.ac
+index ca1282a6b3..0142353740 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -378,6 +378,14 @@ if test "$build_obsolete_nsl" = yes; then
+   AC_DEFINE(LINK_OBSOLETE_NSL)
+ fi
+ 
++AC_ARG_ENABLE([obsolete-crypt],
++              AC_HELP_STRING([--enable-obsolete-crypt],
++                             [build and install the obsolete libcrypt library]),
++              [build_obsolete_crypt=$enableval],
++              [build_obsolete_crypt=no])
++AC_SUBST(build_obsolete_crypt)
++
++
+ AC_ARG_ENABLE([systemtap],
+               [AS_HELP_STRING([--enable-systemtap],
+ 	       [enable systemtap static probe points @<:@default=no@:>@])],
+diff --git a/conform/Makefile b/conform/Makefile
+index 864fdeca21..5ef474fb24 100644
+--- a/conform/Makefile
++++ b/conform/Makefile
+@@ -193,22 +193,28 @@ linknamespace-libs-thr = $(linknamespace-libs-isoc) \
+ 			 $(common-objpfx)rt/librt.a $(static-thread-library)
+ linknamespace-libs-posix = $(linknamespace-libs-thr) \
+ 			   $(common-objpfx)dlfcn/libdl.a
+-linknamespace-libs-xsi = $(linknamespace-libs-posix) \
+-			 $(common-objpfx)crypt/libcrypt.a
++linknamespace-libs-xsi = $(linknamespace-libs-posix)
+ linknamespace-libs-ISO = $(linknamespace-libs-isoc)
+ linknamespace-libs-ISO99 = $(linknamespace-libs-isoc)
+ linknamespace-libs-ISO11 = $(linknamespace-libs-isoc)
+-linknamespace-libs-XPG4 = $(linknamespace-libs-isoc) \
+-			  $(common-objpfx)crypt/libcrypt.a
++linknamespace-libs-XPG4 = $(linknamespace-libs-isoc)
+ linknamespace-libs-XPG42 = $(linknamespace-libs-XPG4)
+ linknamespace-libs-POSIX = $(linknamespace-libs-thr)
+ linknamespace-libs-UNIX98 = $(linknamespace-libs-xsi)
+ linknamespace-libs-XOPEN2K = $(linknamespace-libs-xsi)
+ linknamespace-libs-POSIX2008 = $(linknamespace-libs-posix)
+ linknamespace-libs-XOPEN2K8 = $(linknamespace-libs-xsi)
++
++ifeq ($(build-obsolete-crypt),yes)
++linknamespace-libs-xsi += $(common-objpfx)crypt/libcrypt.a
++linknamespace-libs-XPG4 += $(common-objpfx)crypt/libcrypt.a
++endif
++
+ linknamespace-libs = $(foreach std,$(conformtest-standards),\
+ 				   $(linknamespace-libs-$(std)))
+ 
++
++
+ $(linknamespace-symlist-stdlibs-tests): $(objpfx)symlist-stdlibs-%: \
+ 					$(linknamespace-libs)
+ 	LC_ALL=C $(READELF) -W -s $(linknamespace-libs-$*) > $@; \
+diff --git a/conform/data/stdlib.h-data b/conform/data/stdlib.h-data
+index d8fcccc2fb..6913828196 100644
+--- a/conform/data/stdlib.h-data
++++ b/conform/data/stdlib.h-data
+@@ -149,9 +149,6 @@ function {unsigned short int*} seed48 (unsigned short int[3])
+ #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX && !defined XPG4 && !defined XPG42 && !defined UNIX98
+ function int setenv (const char*, const char*, int)
+ #endif
+-#if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX && !defined POSIX2008
+-function void setkey (const char*)
+-#endif
+ #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined XPG4 && !defined POSIX && !defined POSIX2008
+ function {char*} setstate (char*)
+ #endif
+diff --git a/conform/data/unistd.h-data b/conform/data/unistd.h-data
+index ddf4f25132..aa070528e8 100644
+--- a/conform/data/unistd.h-data
++++ b/conform/data/unistd.h-data
+@@ -437,9 +437,6 @@ function int chroot (const char*)
+ function int chown (const char*, uid_t, gid_t)
+ function int close (int)
+ function size_t confstr (int, char*, size_t)
+-#if !defined POSIX && !defined POSIX2008
+-function {char*} crypt (const char*, const char*)
+-#endif
+ #if defined XPG4 || defined XPG42 || defined UNIX98
+ function {char*} ctermid (char*)
+ function {char*} cuserid (char*)
+@@ -449,9 +446,6 @@ allow cuserid
+ #endif
+ function int dup (int)
+ function int dup2 (int, int)
+-#if !defined POSIX && !defined POSIX2008
+-function void encrypt (char[64], int)
+-#endif
+ function int execl (const char*, const char*, ...)
+ function int execle (const char*, const char*, ...)
+ function int execlp (const char*, const char*, ...)
+diff --git a/crypt/Makefile b/crypt/Makefile
+index 303800df73..024ec2c6ab 100644
+--- a/crypt/Makefile
++++ b/crypt/Makefile
+@@ -22,6 +22,8 @@ subdir	:= crypt
+ 
+ include ../Makeconfig
+ 
++ifeq ($(build-obsolete-crypt),yes)
++
+ headers := crypt.h
+ 
+ extra-libs := libcrypt
+@@ -52,9 +54,11 @@ tests += md5test sha256test sha512test
+ # machine over a minute.
+ xtests = md5test-giant
+ endif
++endif
+ 
+ include ../Rules
+ 
++ifeq ($(build-obsolete-crypt),yes)
+ ifneq ($(nss-crypt),yes)
+ md5-routines := md5 $(filter md5%,$(libcrypt-sysdep_routines))
+ sha256-routines := sha256 $(filter sha256%,$(libcrypt-sysdep_routines))
+@@ -71,3 +75,4 @@ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
+ else
+ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
+ endif
++endif
+diff --git a/elf/Makefile b/elf/Makefile
+index 2a432d8bee..366f7b80ec 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -385,15 +385,19 @@ $(objpfx)tst-_dl_addr_inside_object: $(objpfx)dl-addr-obj.os
+ CFLAGS-tst-_dl_addr_inside_object.c += $(PIE-ccflag)
+ endif
+ 
+-# By default tst-linkall-static should try to use crypt routines to test
+-# static libcrypt use.
+-CFLAGS-tst-linkall-static.c += -DUSE_CRYPT=1
++ifeq ($(build-obsolete-crypt),yes)
++# If the libcrypt library is being built, tst-linkall-static should
++# try to use crypt routines to test static libcrypt use.
++CFLAGS-tst-linkall-static.c = -DUSE_CRYPT=1
+ # However, if we are using NSS crypto and we don't have a static
+ # library, then we exclude the use of crypt functions in the test.
+ # We similarly exclude libcrypt.a from the static link (see below).
+ ifeq (yesno,$(nss-crypt)$(static-nss-crypt))
+ CFLAGS-tst-linkall-static.c += -UUSE_CRYPT -DUSE_CRYPT=0
+ endif
++else
++CFLAGS-tst-linkall-static.c = -DUSE_CRYPT=0
++endif
+ 
+ include ../Rules
+ 
+@@ -1113,8 +1117,10 @@ localplt-built-dso := $(addprefix $(common-objpfx),\
+ 				  rt/librt.so \
+ 				  dlfcn/libdl.so \
+ 				  resolv/libresolv.so \
+-				  crypt/libcrypt.so \
+ 		       )
++ifeq ($(build-obsolete-crypt),yes)
++localplt-built-dso += $(addprefix $(common-objpfx), crypt/libcrypt.so)
++endif
+ ifeq ($(build-mathvec),yes)
+ localplt-built-dso += $(addprefix $(common-objpfx), mathvec/libmvec.so)
+ endif
+@@ -1395,6 +1401,7 @@ $(objpfx)tst-linkall-static: \
+   $(common-objpfx)resolv/libanl.a \
+   $(static-thread-library)
+ 
++ifeq ($(build-obsolete-crypt),yes)
+ # If we are using NSS crypto and we have the ability to link statically
+ # then we include libcrypt.a, otherwise we leave out libcrypt.a and
+ # link as much as we can into the tst-linkall-static test.  This assumes
+@@ -1410,6 +1417,7 @@ ifeq (no,$(nss-crypt))
+ $(objpfx)tst-linkall-static: \
+   $(common-objpfx)crypt/libcrypt.a
+ endif
++endif
+ 
+ # The application depends on the DSO, and the DSO loads the plugin.
+ # The plugin also depends on the DSO. This creates the circular
+diff --git a/elf/tst-linkall-static.c b/elf/tst-linkall-static.c
+index e8df38f74e..0ffae7c723 100644
+--- a/elf/tst-linkall-static.c
++++ b/elf/tst-linkall-static.c
+@@ -18,7 +18,9 @@
+ 
+ #include <math.h>
+ #include <pthread.h>
++#if USE_CRYPT
+ #include <crypt.h>
++#endif
+ #include <resolv.h>
+ #include <dlfcn.h>
+ #include <utmp.h>
+diff --git a/posix/unistd.h b/posix/unistd.h
+index 4d149f9945..e75ce4d4ec 100644
+--- a/posix/unistd.h
++++ b/posix/unistd.h
+@@ -107,9 +107,6 @@ __BEGIN_DECLS
+ /* The X/Open Unix extensions are available.  */
+ #define _XOPEN_UNIX	1
+ 
+-/* Encryption is present.  */
+-#define	_XOPEN_CRYPT	1
+-
+ /* The enhanced internationalization capabilities according to XPG4.2
+    are present.  */
+ #define	_XOPEN_ENH_I18N	1
+@@ -1118,20 +1115,7 @@ ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
+ extern int fdatasync (int __fildes);
+ #endif /* Use POSIX199309 */
+ 
+-
+-/* XPG4.2 specifies that prototypes for the encryption functions must
+-   be defined here.  */
+ #ifdef	__USE_XOPEN
+-/* Encrypt at most 8 characters from KEY using salt to perturb DES.  */
+-extern char *crypt (const char *__key, const char *__salt)
+-     __THROW __nonnull ((1, 2));
+-
+-/* Encrypt data in BLOCK in place if EDFLAG is zero; otherwise decrypt
+-   block in place.  */
+-extern void encrypt (char *__glibc_block, int __edflag)
+-     __THROW __nonnull ((1));
+-
+-
+ /* Swab pairs bytes in the first N bytes of the area pointed to by
+    FROM and copy the result to TO.  The value of TO must not be in the
+    range [FROM - N + 1, FROM - 1].  If N is odd the first byte in FROM
+diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h
+index 6b1ead31e0..8e23e93557 100644
+--- a/stdlib/stdlib.h
++++ b/stdlib/stdlib.h
+@@ -958,12 +958,6 @@ extern int getsubopt (char **__restrict __optionp,
+ #endif
+ 
+ 
+-#ifdef __USE_XOPEN
+-/* Setup DES tables according KEY.  */
+-extern void setkey (const char *__key) __THROW __nonnull ((1));
+-#endif
+-
+-
+ /* X/Open pseudo terminal handling.  */
+ 
+ #ifdef __USE_XOPEN2KXSI
+diff --git a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
+index a6d08f3a00..d8b8297fb0 100644
+--- a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
++++ b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
+@@ -1,6 +1,8 @@
+ ifeq ($(subdir),crypt)
++ifeq ($(build-obsolete-crypt),yes)
+ libcrypt-sysdep_routines += md5-crop sha256-crop sha512-crop
+ endif
++endif
+ 
+ ifeq ($(subdir),locale)
+ localedef-aux += md5-crop
+diff --git a/sysdeps/sparc/sparc64/multiarch/Makefile b/sysdeps/sparc/sparc64/multiarch/Makefile
+index eaf758e7aa..0198f9886f 100644
+--- a/sysdeps/sparc/sparc64/multiarch/Makefile
++++ b/sysdeps/sparc/sparc64/multiarch/Makefile
+@@ -1,6 +1,8 @@
+ ifeq ($(subdir),crypt)
++ifeq ($(build-obsolete-crypt),yes)
+ libcrypt-sysdep_routines += md5-crop sha256-crop sha512-crop
+ endif
++endif
+ 
+ ifeq ($(subdir),locale)
+ localedef-aux += md5-crop
+diff --git a/sysdeps/unix/sysv/linux/arm/Makefile b/sysdeps/unix/sysv/linux/arm/Makefile
+index 4adc35de04..6cab4f3a31 100644
+--- a/sysdeps/unix/sysv/linux/arm/Makefile
++++ b/sysdeps/unix/sysv/linux/arm/Makefile
+@@ -19,8 +19,10 @@ endif
+ # Add a syscall function to each library that needs one.
+ 
+ ifeq ($(subdir),crypt)
++ifeq ($(build-obsolete-crypt),yes)
+ libcrypt-sysdep_routines += libc-do-syscall
+ endif
++endif
+ 
+ ifeq ($(subdir),rt)
+ librt-sysdep_routines += libc-do-syscall
+-- 
+2.16.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index 772351ad46..c814798bbd 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -54,6 +54,7 @@ NATIVESDKFIXES_class-nativesdk = "\
            file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
            file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
            file://relocate-locales.patch \
+           file://0031-nativesdk-deprecate-libcrypt.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
new file mode 100644
index 0000000000..638e387a15
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Extended cryptographic library (from glibc)"
+DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
+HOMEPAGE = "https://github.com/besser82/libxcrypt"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=d1cc18f512ded3bd6000f3729f31be08 \
+      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+inherit autotools
+
+SRCREV ?= "215b32aa4e0b255c3356a96bd6d257661bad73ca"
+SRCBRANCH ?= "master"
+
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+
+FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so"
+
+S = "${WORKDIR}/git"
+
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 5fabf7fa39..38c3a314e1 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -13,6 +13,7 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc-gconv-utf-16 \
     nativesdk-glibc-gconv-cp1252 \
     nativesdk-patchelf \
+    nativesdk-libxcrypt \
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.17.0


