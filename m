Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id ED1DB771E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:55:29 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id b35so54679634qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=754w4zAObF51epjpXq5TbPpMJoiTNpm6NDShICWaDmg=;
	b=ue0mKM/u2QUQE/rS5m5QqxM7/FblHeOqY9e+Azu6bOP2J2TTzBmh03IAqZVdLOCJwb
	iwlZDRt68pgpGavo/wrIXSKj4fcaxl7Df4eJfVPW5yO5W11l5grN9ffLPBg/E4OdGfts
	fkCjbjipW9nTLewURpcZvQZBAP03bOGMfg1OwtIkIsJ+zetc8WkS4fymsjwVPeEb09up
	rysbKMhjG8FFcYF4Ow7UpnZ2mThXOyUnl4fpi6NiPYPmR35XNgS0i9lFa0jKniFixdn6
	XwpRsR2zICUwQ1dYEVvj7iKi5Hk6Q8TeM+KmVkvPK1kPUfaO6xJ/mTUphtP+0wHEXSr6
	R14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=754w4zAObF51epjpXq5TbPpMJoiTNpm6NDShICWaDmg=;
	b=cw+/JqfNd+c+NyAzTbaXwu5pSoctGy9GnMnCWdY5Mw0L49NMMwkEIWGppTxDety1hM
	X9iskl0R2NURrlW5KPFTWFFvUtjnWJd8jE+lxoAHU2BOIxkssLLMLz7CFxt34L/1kblg
	eosJ8I0oJcwJRF0vyKt+i1exIU6xQbsmw2wryw7AhJCKx2LSlm0Q7ZCf9WMjZc+GqWO1
	80QMoV88ftMIt27RGNeebd9/5GQvXcsIHysUcC5N+BOcFNYFP21EcPLIhrqmWbwfKD2M
	BY/ZKIJ4BgDJHNeB+BfpybeJmO/aceQMQj24bV5x2HEhETYxL+Thm8EXy4M+VLrS7Byx
	r1gA==
X-Gm-Message-State: AG10YOSrkXt16sP//PbpSVDmhMCrUZ2F5rwWqHARGrgn9UJbnqwuR3Ky5ExmaszwQ1wSNg==
X-Received: by 10.140.217.67 with SMTP id n64mr13415552qhb.26.1454626530237;
	Thu, 04 Feb 2016 14:55:30 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w16sm6327876qka.35.2016.02.04.14.55.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:55:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:55:20 +0000
Message-Id: <98d3fcda28a76498323a5daf631e8596bc1f96f5.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
References: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 04 Feb 2016 22:55:30 -0000

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


