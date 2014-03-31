Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 904F36F7CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 07:00:29 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2V70N6d005798;
	Mon, 31 Mar 2014 09:00:28 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Mon, 31 Mar 2014 09:00:24 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] [Dora] eglibc 2.18: powerpc: Fix time related syscalls
Thread-Index: AQHPTK7j8igZwgQAx0uPwsRdVt7a8A==
Date: Mon, 31 Mar 2014 07:00:24 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A879D@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [195.84.96.49]
MIME-Version: 1.0
Subject: [PATCH v3] [Dora] eglibc 2.18: powerpc: Fix time related syscalls
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
X-List-Received-Date: Mon, 31 Mar 2014 07:00:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Concatenated fix of PowerPC time related system calls in eglibc 2.18 taken=
=0A=
from upstream glibc. See credits in patch header.=0A=
=0A=
The effect is that some time related system calls returns nothing or garbag=
e.=0A=
Fix tested on PowerPC e300c3.=0A=
=0A=
Eglibc 2.17 does not have this issue and the patches are already part of 2.=
19.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
---=0A=
 .../ppc-fix-time-related-syscalls.patch            |  227 ++++++++++++++++=
++++=0A=
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +=0A=
 2 files changed, 228 insertions(+)=0A=
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-relat=
ed-syscalls.patch=0A=
=0A=
V3: ...and moved it to patch instead of commit header.=0A=
V2: Added upstream status.=0A=
=0A=
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-sysc=
alls.patch b/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-sysc=
alls.patch=0A=
new file mode 100644=0A=
index 0000000..319b826=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.pa=
tch=0A=
@@ -0,0 +1,227 @@=0A=
+Upstream-Status: Backport=0A=
+=0A=
+Concatenated fix of PowerPC time related system calls in eglibc 2.18 taken=
=0A=
+from upstream glibc. Eglibc 2.17 does not have this issue and the patches =
are=0A=
+already part of 2.19.=0A=
+This compilation includes the following committs:=0A=
+=0A=
+=0A=
+PowerPC: Fix vDSO missing ODP entries=0A=
+=0A=
+author	Adhemerval Zanella <azanella@linux.vnet.ibm.com>	=0A=
+	Thu, 7 Nov 2013 11:34:22 +0000 (05:34 -0600)=0A=
+=0A=
+This patch fixes the vDSO symbol used directed in IFUNC resolver where=0A=
+they do not have an associated ODP entry leading to undefined behavior=0A=
+in some cases. It adds an artificial OPD static entry to such cases=0A=
+and set its TOC to non 0 to avoid triggering lazy resolutions.=0A=
+=0A=
+=0A=
+Update copyright notices with scripts/update-copyrights=0A=
+=0A=
+author	Allan McRae <allan@archlinux.org>	=0A=
+	Wed, 1 Jan 2014 11:03:15 +0000 (21:03 +1000)=0A=
+=0A=
+((Only for files otherwise touched by this patch))=0A=
+=0A=
+=0A=
+PowerPC: Fix ftime gettimeofday internal call returning bogus data=0A=
+=0A=
+author	Adhemerval Zanella <azanella@linux.vnet.ibm.com>	=0A=
+	Thu, 16 Jan 2014 12:53:18 +0000 (06:53 -0600)=0A=
+=0A=
+This patches fixes BZ#16430 by setting a different symbol for internal=0A=
+GLIBC calls that points to ifunc resolvers. For PPC32, if the symbol=0A=
+is defined as hidden (which is the case for gettimeofday and time) the=0A=
+compiler will create local branches (symbol@local) and linker will not=0A=
+create PLT calls (required for IFUNC). This will leads to internal symbol=
=0A=
+calling the IFUNC resolver instead of the resolved symbol.=0A=
+For PPC64 this behavior does not occur because a call to a function in=0A=
+another translation unit might use a different toc pointer thus requiring=
=0A=
+a PLT call.=0A=
+=0A=
+=0A=
+PowerPC: Fix gettimeofday ifunc selection=0A=
+=0A=
+author	Adhemerval Zanella <azanella@linux.vnet.ibm.com>	=0A=
+	Mon, 20 Jan 2014 18:29:51 +0000 (12:29 -0600)=0A=
+=0A=
+The IFUNC selector for gettimeofday runs before _libc_vdso_platform_setup =
where=0A=
+__vdso_gettimeofday is set. The selector then sets __gettimeofday (the int=
ernal=0A=
+version used within GLIBC) to use the system call version instead of the v=
DSO one.=0A=
+This patch changes the check if vDSO is available to get its value directl=
y=0A=
+instead of rely on __vdso_gettimeofday.=0A=
+=0A=
+This patch changes it by getting the vDSO value directly.=0A=
+=0A=
+It fixes BZ#16431.=0A=
+=0A=
+=0A=
+---=0A=
+diff -pruN libc.orig/sysdeps/unix/sysv/linux/powerpc/bits/libc-vdso.h libc=
/sysdeps/unix/sysv/linux/powerpc/bits/libc-vdso.h=0A=
+--- libc.orig/sysdeps/unix/sysv/linux/powerpc/bits/libc-vdso.h=0A=
++++ libc/sysdeps/unix/sysv/linux/powerpc/bits/libc-vdso.h=0A=
+@@ -1,5 +1,5 @@=0A=
+ /* Resolve function pointers to VDSO functions.=0A=
+-   Copyright (C) 2005-2013 Free Software Foundation, Inc.=0A=
++   Copyright (C) 2005-2014 Free Software Foundation, Inc.=0A=
+    This file is part of the GNU C Library.=0A=
+ =0A=
+    The GNU C Library is free software; you can redistribute it and/or=0A=
+@@ -34,12 +34,32 @@ extern void *__vdso_getcpu;=0A=
+ =0A=
+ extern void *__vdso_time;=0A=
+ =0A=
+-/* This macro is needed for PPC64 to return a skeleton OPD entry of a vDS=
O=0A=
+-   symbol.  This works because _dl_vdso_vsym always return the function=
=0A=
+-   address, and no vDSO symbols use the TOC or chain pointers from the OP=
D=0A=
+-   so we can allow them to be garbage.  */=0A=
+ #if defined(__PPC64__) || defined(__powerpc64__)=0A=
+-#define VDSO_IFUNC_RET(value)  ((void *) &(value))=0A=
++/* The correct solution is for _dl_vdso_vsym to return the address of the=
 OPD=0A=
++   for the kernel VDSO function.  That address would then be stored in th=
e=0A=
++   __vdso_* variables and returned as the result of the IFUNC resolver fu=
nction.=0A=
++   Yet, the kernel does not contain any OPD entries for the VDSO function=
s=0A=
++   (incomplete implementation).  However, PLT relocations for IFUNCs stil=
l expect=0A=
++   the address of an OPD to be returned from the IFUNC resolver function =
(since=0A=
++   PLT entries on PPC64 are just copies of OPDs).  The solution for now i=
s to=0A=
++   create an artificial static OPD for each VDSO function returned by a r=
esolver=0A=
++   function.  The TOC value is set to a non-zero value to avoid triggerin=
g lazy=0A=
++   symbol resolution via .glink0/.plt0 for a zero TOC (requires thread-sa=
fe PLT=0A=
++   sequences) when the dynamic linker isn't prepared for it e.g. RTLD_NOW=
.  None=0A=
++   of the kernel VDSO routines use the TOC or AUX values so any non-zero =
value=0A=
++   will work.  Note that function pointer comparisons will not use this a=
rtificial=0A=
++   static OPD since those are resolved via ADDR64 relocations and will po=
int at=0A=
++   the non-IFUNC default OPD for the symbol.  Lastly, because the IFUNC r=
elocations=0A=
++   are processed immediately at startup the resolver functions and this c=
ode need=0A=
++   not be thread-safe, but if the caller writes to a PLT slot it must do =
so in a=0A=
++   thread-safe manner with all the required barriers.  */=0A=
++#define VDSO_IFUNC_RET(value)                            \=0A=
++  ({                                                     \=0A=
++    static Elf64_FuncDesc vdso_opd =3D { .fd_toc =3D ~0x0 }; \=0A=
++    vdso_opd.fd_func =3D (Elf64_Addr)value;                \=0A=
++    &vdso_opd;                                           \=0A=
++  })=0A=
++=0A=
+ #else=0A=
+ #define VDSO_IFUNC_RET(value)  ((void *) (value))=0A=
+ #endif=0A=
+diff -pruN libc.orig/sysdeps/unix/sysv/linux/powerpc/gettimeofday.c libc/s=
ysdeps/unix/sysv/linux/powerpc/gettimeofday.c=0A=
+--- libc.orig/sysdeps/unix/sysv/linux/powerpc/gettimeofday.c=0A=
++++ libc/sysdeps/unix/sysv/linux/powerpc/gettimeofday.c=0A=
+@@ -1,4 +1,4 @@=0A=
+-/* Copyright (C) 2005-2013 Free Software Foundation, Inc.=0A=
++/* Copyright (C) 2005-2014 Free Software Foundation, Inc.=0A=
+    This file is part of the GNU C Library.=0A=
+ =0A=
+    The GNU C Library is free software; you can redistribute it and/or=0A=
+@@ -22,6 +22,7 @@=0A=
+ =0A=
+ # include <dl-vdso.h>=0A=
+ # include <bits/libc-vdso.h>=0A=
++# include <dl-machine.h>=0A=
+ =0A=
+ void *gettimeofday_ifunc (void) __asm__ ("__gettimeofday");=0A=
+ =0A=
+@@ -34,17 +35,36 @@ __gettimeofday_syscall (struct timeval *=0A=
+ void *=0A=
+ gettimeofday_ifunc (void)=0A=
+ {=0A=
++  PREPARE_VERSION (linux2615, "LINUX_2.6.15", 123718565);=0A=
++=0A=
+   /* If the vDSO is not available we fall back syscall.  */=0A=
+-  return (__vdso_gettimeofday ? VDSO_IFUNC_RET (__vdso_gettimeofday)=0A=
+-	  : __gettimeofday_syscall);=0A=
++  void *vdso_gettimeofday =3D _dl_vdso_vsym ("__kernel_gettimeofday", &li=
nux2615);=0A=
++  return (vdso_gettimeofday ? VDSO_IFUNC_RET (vdso_gettimeofday)=0A=
++         : (void*)__gettimeofday_syscall);=0A=
+ }=0A=
+ asm (".type __gettimeofday, %gnu_indirect_function");=0A=
+ =0A=
+ /* This is doing "libc_hidden_def (__gettimeofday)" but the compiler won'=
t=0A=
+    let us do it in C because it doesn't know we're defining __gettimeofda=
y=0A=
+    here in this file.  */=0A=
+-asm (".globl __GI___gettimeofday\n"=0A=
+-     "__GI___gettimeofday =3D __gettimeofday");=0A=
++asm (".globl __GI___gettimeofday");=0A=
++=0A=
++/* __GI___gettimeofday is defined as hidden and for ppc32 it enables the=
=0A=
++   compiler make a local call (symbol@local) for internal GLIBC usage. It=
=0A=
++   means the PLT won't be used and the ifunc resolver will be called dire=
ctly.=0A=
++   For ppc64 a call to a function in another translation unit might use a=
=0A=
++   different toc pointer thus disallowing direct branchess and making int=
ernal=0A=
++   ifuncs calls safe.  */=0A=
++#ifdef __powerpc64__=0A=
++asm ("__GI___gettimeofday =3D __gettimeofday");=0A=
++#else=0A=
++int=0A=
++__gettimeofday_vsyscall (struct timeval *tv, struct timezone *tz)=0A=
++{=0A=
++  return INLINE_VSYSCALL (gettimeofday, 2, tv, tz);=0A=
++}=0A=
++asm ("__GI___gettimeofday =3D __gettimeofday_vsyscall");=0A=
++#endif=0A=
+ =0A=
+ #else=0A=
+ =0A=
+diff -pruN libc.orig/sysdeps/unix/sysv/linux/powerpc/time.c libc/sysdeps/u=
nix/sysv/linux/powerpc/time.c=0A=
+--- libc.orig/sysdeps/unix/sysv/linux/powerpc/time.c=0A=
++++ libc/sysdeps/unix/sysv/linux/powerpc/time.c=0A=
+@@ -1,5 +1,5 @@=0A=
+ /* time system call for Linux/PowerPC.=0A=
+-   Copyright (C) 2013 Free Software Foundation, Inc.=0A=
++   Copyright (C) 2013-2014 Free Software Foundation, Inc.=0A=
+    This file is part of the GNU C Library.=0A=
+ =0A=
+    The GNU C Library is free software; you can redistribute it and/or=0A=
+@@ -20,7 +20,9 @@=0A=
+ =0A=
+ # include <time.h>=0A=
+ # include <sysdep.h>=0A=
++# include <dl-vdso.h>=0A=
+ # include <bits/libc-vdso.h>=0A=
++# include <dl-machine.h>=0A=
+ =0A=
+ void *time_ifunc (void) asm ("time");=0A=
+ =0A=
+@@ -43,17 +45,36 @@ time_syscall (time_t *t)=0A=
+ void *=0A=
+ time_ifunc (void)=0A=
+ {=0A=
++  PREPARE_VERSION (linux2615, "LINUX_2.6.15", 123718565);=0A=
++=0A=
+   /* If the vDSO is not available we fall back to the syscall.  */=0A=
+-  return (__vdso_time ? VDSO_IFUNC_RET (__vdso_time)=0A=
+-	  : time_syscall);=0A=
++  void *vdso_time =3D _dl_vdso_vsym ("__kernel_time", &linux2615);=0A=
++  return (vdso_time ? VDSO_IFUNC_RET (vdso_time)=0A=
++         : (void*)time_syscall);=0A=
+ }=0A=
+ asm (".type time, %gnu_indirect_function");=0A=
+ =0A=
+ /* This is doing "libc_hidden_def (time)" but the compiler won't=0A=
+  * let us do it in C because it doesn't know we're defining time=0A=
+  * here in this file.  */=0A=
+-asm (".globl __GI_time\n"=0A=
+-     "__GI_time =3D time");=0A=
++asm (".globl __GI_time");=0A=
++=0A=
++/* __GI_time is defined as hidden and for ppc32 it enables the=0A=
++   compiler make a local call (symbol@local) for internal GLIBC usage. It=
=0A=
++   means the PLT won't be used and the ifunc resolver will be called dire=
ctly.=0A=
++   For ppc64 a call to a function in another translation unit might use a=
=0A=
++   different toc pointer thus disallowing direct branchess and making int=
ernal=0A=
++   ifuncs calls safe.  */=0A=
++#ifdef __powerpc64__=0A=
++asm ("__GI_time =3D time");=0A=
++#else=0A=
++time_t=0A=
++__time_vsyscall (time_t *t)=0A=
++{=0A=
++  return INLINE_VSYSCALL (time, 1, t);=0A=
++}=0A=
++asm ("__GI_time =3D __time_vsyscall");=0A=
++#endif=0A=
+ =0A=
+ #else=0A=
+ =0A=
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eg=
libc/eglibc_2.18.bb=0A=
index 15e5eed..43f43ae 100644=0A=
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb=0A=
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb=0A=
@@ -28,6 +28,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/e=
glibc/eglibc-${PV}-svnr23=0A=
            file://fix-tibetian-locales.patch \=0A=
            file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \=0A=
            file://make-4.patch \=0A=
+           file://ppc-fix-time-related-syscalls.patch \=0A=
           "=0A=
 SRC_URI[md5sum] =3D "b395b021422a027d89884992e91734fc"=0A=
 SRC_URI[sha256sum] =3D "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae=
05d19328539ad4"=0A=
-- =0A=
1.7.10.4=0A=

