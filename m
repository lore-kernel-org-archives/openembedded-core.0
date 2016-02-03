Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EF9D27735C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:08 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id y9so4216449qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=754w4zAObF51epjpXq5TbPpMJoiTNpm6NDShICWaDmg=;
	b=O30cvtNx+O7uTcweTIrQchb08LroUeog9qASa1bCVVB+7ofJDX7kqXm7+iCVgDseNa
	2xtEODs6q16iQvchM/titILPjOGyeGGcgiq05yaLed2dUBn3BrvE59ZbGlIQl9aUMhCQ
	i05r8BcxI6Kwos94ch/CCHIOwlOJoTa7HGCSQlFbNLSRTksW1zWtUbHuorMgFQ51v97G
	W4nIKYjDVedY2tz7+MOmJdyiA0vQcR8m+pMYUbD8s4/KDIugu65i3U6/8cCQkQMScfmH
	8rEBZl1GQlQG+ERrYMZCeLaNrd8ZSB+vsdmHTP781rQJO7olRt4dRTmpLc8QzqSgSZJS
	kM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=754w4zAObF51epjpXq5TbPpMJoiTNpm6NDShICWaDmg=;
	b=TYbB8vr3B5yE0tN0D2gLjvb3CDzw9G/2KpK5J203YttVOZDXoYPfxOvUN++Mf4hbhB
	tCnLbXAkppnK5LKoCtR5nSJ2ykP/owkaWGjwxrJ2q4dgxcgBDrtbrO7U2Vi0wENnAfts
	PEovrpkYW0b2ePPpF6U402ZpNpdsXt+HucPqOldOB37WeOjv1miEIV8Byb4iNOZfh616
	gJUiqhwGr9o+5zx9EzQDhcfA4VARAW7+WllXD4lm68SEcZFmSDvlFb783KiuaseCoqgx
	8LYyraPsmjb/Pd3zckzDG0i1Rh0dwnsUW+5J71HvYi4Bt6zhPw98ZSdiX3jtgaPtv31r
	L9Vw==
X-Gm-Message-State: AG10YORUWQs6pGCnSTiCjSu2VP97zD8qq/h/SlRhF8d49z4XjoIxMdUi3VX23rOhYLPh1w==
X-Received: by 10.140.20.82 with SMTP id 76mr9476619qgi.5.1454480889109;
	Tue, 02 Feb 2016 22:28:09 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:59 +0000
Message-Id: <cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
References: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] gcc: musl related fixes for unwinding, ppc/secure-plt and gthr
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:09 -0000

These issues are fixing building gcc for target, ppc issue
helps in fixing discrepency between gcc cmdline and linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +
 ...-weak-reference-logic-in-gthr.h-for-os-ge.patch | 78 ++++++++++++++++++++++
 ...050-powerpc-pass-secure-plt-to-the-linker.patch | 66 ++++++++++++++++++
 .../gcc-5.3/0051-support-unwinding-on-musl.patch   | 34 ++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 83e061f..372b844 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -78,6 +78,9 @@ SRC_URI = "\
            file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
            file://0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
            file://0048-ssp_nonshared.patch \
+           file://0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch \
+           file://0050-powerpc-pass-secure-plt-to-the-linker.patch \
+           file://0051-support-unwinding-on-musl.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch b/meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
new file mode 100644
index 0000000..0ea5143
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
@@ -0,0 +1,78 @@
+From 553d8e3b9073ff3e0a9d2fac9b1823fb17ad247c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 21:00:18 -0800
+Subject: [PATCH 49/51] Disable the weak reference logic in gthr.h for
+ os/generic
+
+It does not work unless work arounds are there in gthr-posix.h
+
+origin of patch
+http://port70.net/~nsz/musl/gcc-5.3.0/0004-gthr.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libgfortran/acinclude.m4                    | 2 +-
+ libgfortran/configure                       | 2 +-
+ libstdc++-v3/config/os/generic/os_defines.h | 5 +++++
+ libstdc++-v3/configure.host                 | 3 +++
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/libgfortran/acinclude.m4 b/libgfortran/acinclude.m4
+index ba890f9..30b8b1a6 100644
+--- a/libgfortran/acinclude.m4
++++ b/libgfortran/acinclude.m4
+@@ -100,7 +100,7 @@ void foo (void);
+ 	      [Define to 1 if the target supports #pragma weak])
+   fi
+   case "$host" in
+-    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
++    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
+       AC_DEFINE(GTHREAD_USE_WEAK, 0,
+ 		[Define to 0 if the target shouldn't use #pragma weak])
+       ;;
+diff --git a/libgfortran/configure b/libgfortran/configure
+index 5d47e65..cdf9695 100755
+--- a/libgfortran/configure
++++ b/libgfortran/configure
+@@ -26456,7 +26456,7 @@ $as_echo "#define SUPPORTS_WEAK 1" >>confdefs.h
+ 
+   fi
+   case "$host" in
+-    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
++    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
+ 
+ $as_echo "#define GTHREAD_USE_WEAK 0" >>confdefs.h
+ 
+diff --git a/libstdc++-v3/config/os/generic/os_defines.h b/libstdc++-v3/config/os/generic/os_defines.h
+index 45bf52a..103ec0e 100644
+--- a/libstdc++-v3/config/os/generic/os_defines.h
++++ b/libstdc++-v3/config/os/generic/os_defines.h
+@@ -33,4 +33,9 @@
+ // System-specific #define, typedefs, corrections, etc, go here.  This
+ // file will come before all others.
+ 
++// Disable the weak reference logic in gthr.h for os/generic because it
++// is broken on every platform unless there is implementation specific
++// workaround in gthr-posix.h and at link-time for static linking.
++#define _GLIBCXX_GTHREAD_USE_WEAK 0
++
+ #endif
+diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
+index 1756444..2a87bb8 100644
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
+@@ -273,6 +273,9 @@ case "${host_os}" in
+   freebsd*)
+     os_include_dir="os/bsd/freebsd"
+     ;;
++  linux-musl*)
++    os_include_dir="os/generic"
++    ;;
+   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
+     # check for musl by target
+     case "${host_os}" in
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch b/meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
new file mode 100644
index 0000000..b2f2bbd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
@@ -0,0 +1,66 @@
+From 4fa0cf03678f849917dcc3d149989b7fecdbe276 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 21:10:00 -0800
+Subject: [PATCH 50/51] powerpc pass --secure-plt to the linker
+
+Secure-plt when enabled does not pass right options to linker
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ gcc/config/rs6000/linux64.h | 4 ++++
+ gcc/config/rs6000/sysv4.h   | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 679da4b..3ca7cd7 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -174,20 +174,24 @@ extern int dot_symbols;
+ #undef	ASM_DEFAULT_SPEC
+ #undef	ASM_SPEC
+ #undef	LINK_OS_LINUX_SPEC
++#undef	LINK_SECURE_PLT_SPEC
+ 
+ #ifndef	RS6000_BI_ARCH
+ #define	ASM_DEFAULT_SPEC "-mppc64"
+ #define	ASM_SPEC	 "%(asm_spec64) %(asm_spec_common)"
+ #define	LINK_OS_LINUX_SPEC "%(link_os_linux_spec64)"
++#define	LINK_SECURE_PLT_SPEC ""
+ #else
+ #if DEFAULT_ARCH64_P
+ #define	ASM_DEFAULT_SPEC "-mppc%{!m32:64}"
+ #define	ASM_SPEC	 "%{m32:%(asm_spec32)}%{!m32:%(asm_spec64)} %(asm_spec_common)"
+ #define	LINK_OS_LINUX_SPEC "%{m32:%(link_os_linux_spec32)}%{!m32:%(link_os_linux_spec64)}"
++#define	LINK_SECURE_PLT_SPEC "%{m32: " LINK_SECURE_PLT_DEFAULT_SPEC "}"
+ #else
+ #define	ASM_DEFAULT_SPEC "-mppc%{m64:64}"
+ #define	ASM_SPEC	 "%{!m64:%(asm_spec32)}%{m64:%(asm_spec64)} %(asm_spec_common)"
+ #define	LINK_OS_LINUX_SPEC "%{!m64:%(link_os_linux_spec32)}%{m64:%(link_os_linux_spec64)}"
++#define	LINK_SECURE_PLT_SPEC "%{!m64: " LINK_SECURE_PLT_DEFAULT_SPEC "}"
+ #endif
+ #endif
+ 
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index 8794fa5..0835551 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -571,6 +571,7 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
+                : %(link_start_default)     }"
+ 
+ #define LINK_START_DEFAULT_SPEC ""
++#define LINK_SECURE_PLT_SPEC LINK_SECURE_PLT_DEFAULT_SPEC
+ 
+ #undef	LINK_SPEC
+ #define	LINK_SPEC "\
+@@ -578,6 +579,7 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
+ %{R*} \
+ %(link_shlib) \
+ %{!T*: %(link_start) } \
++%{!static: %{!mbss-plt: %(link_secure_plt_default)}} \
+ %(link_os)"
+ 
+ /* Shared libraries are not default.  */
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch b/meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch
new file mode 100644
index 0000000..b0480b3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch
@@ -0,0 +1,34 @@
+From 2ed1e7da8b4367af28588131ff510a1d238131b2 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 1 Aug 2015 22:37:27 +0000
+Subject: [PATCH 51/51] support unwinding on musl
+
+musl does not define __GLIBC__ so we need
+to take care of that case
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ libgcc/unwind-dw2-fde-dip.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libgcc/unwind-dw2-fde-dip.c b/libgcc/unwind-dw2-fde-dip.c
+index e1e566b..137dced 100644
+--- a/libgcc/unwind-dw2-fde-dip.c
++++ b/libgcc/unwind-dw2-fde-dip.c
+@@ -59,6 +59,12 @@
+ 
+ #if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
+     && defined(TARGET_DL_ITERATE_PHDR) \
++    && defined(__linux__)
++# define USE_PT_GNU_EH_FRAME
++#endif
++
++#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
++    && defined(TARGET_DL_ITERATE_PHDR) \
+     && (defined(__DragonFly__) || defined(__FreeBSD__))
+ # define ElfW __ElfN
+ # define USE_PT_GNU_EH_FRAME
+-- 
+2.7.0
+
-- 
2.7.0


