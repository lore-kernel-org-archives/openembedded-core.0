Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RarCN-0003k6-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 16:56:51 +0100
Received: by lami14 with SMTP id i14so436806lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=6M3t81ezr+8AuCmSKtwFHEL9Vi3wrMLcBb0N3lEhmxs=;
	b=V5sqRmtjYJM4Gu7t4JdIbWoDKq86WBK9gDemwrY653FgoaQaKeIdk7sGbUF0xBv+I9
	gglGeoooG8gbi+KfYClK6B5TkZJpULsSETElXYEV/Nut/hpmTWlggSQ1MyzyKPINYGKu
	z+AaBJtx/GFyMeZffONx3Bw0fEoAtr392KxlE=
Received: by 10.152.104.103 with SMTP id gd7mr3225976lab.34.1323877793287;
	Wed, 14 Dec 2011 07:49:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 14 Dec 2011 07:49:22 -0800 (PST)
In-Reply-To: <1323856946.25491.31.camel@ted>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2011 07:49:22 -0800
Message-ID: <CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 15:56:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Khem,
>
> What's puzzling me is that reading through this patch, we already do
> what this patch is doing?
>
> Where is the difference which this patch is fixing?
>

this does essentially what we were doing earlier but this one is going
to go upstream

> I appreciate that patch adds in the prefix to the --with-gxx-include-dir
> option but it then removes it again during configure so this should be a
> null op. Both versions of the patch set the "1" bit in gcc/cppdefault.c.
>
> So where is the change this patch makes which fixes things?

changing --with-gxx-include-dir to be within sysroot triggers the
relocation code.

>
> Cheers,
>
> Richard
>
>
>
> On Wed, 2011-12-14 at 00:28 -0800, Khem Raj wrote:
>> Currently we have a problem in our cross compiler since we use
>> /usr/include/c++ to be default gxx-include-dir and then expect
>> the patch we did to do the relocation w.r.t. sysroot however it
>> does not quite work so and we end up gxx-include-dirs not respecting
>> sysroot. A small test case would be
>>
>> tst-unique4.cc
>>
>> and it would fails like
>>
>> tst-unique4.cc:1:18: fatal error: cstdio: No such file or directory
>> compilation terminated.
>>
>> weather we use --sysroot or not it does not matter
>>
>> arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
>> --sysroot=3D/home/kraj/work/angstrom/sources/openembedded-core/build/tmp=
-eglibc/sysroots/qemuarm
>>
>> failed in same way.
>>
>> so we redo the GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch based on upstrea=
m
>> submitted patch which tries to relocate the gxx-include-dir and to
>> achieve the relocation it has to be specified w.r.t to --with-sysroot
>> directory. e.g.
>>
>> --with-sysroot=3D${SYSROOT}
>> --with-gxx-include-dir=3D${SYSROOT}/usr/include/c++
>>
>> if we configure gcc like above then it becomes relocatable when
>> we run the compiler and specify --sysroot=3D<blah> then g++ will search
>> for gxx-headers under <blah>/usr/include/c++
>>
>> if sysroot is not defined then it will use the default sysroot
>> and gxx-include-dir will be w.r.t. default sysroot.
>>
>> Tested on qemuarm
>>
>> /arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
>> --sysroot=3D/home/kraj/work/angstrom/sources/openembedded-core/build/tmp=
-eglibc/sysroots/qemuarm
>> -v
>> ...
>> =C2=A0/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglib=
c/sysroots/qemuarm/usr/include/c++
>> =C2=A0/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglib=
c/sysroots/qemuarm/usr/include/c++/arm-oe-linux-gnueabi
>> =C2=A0/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglib=
c/sysroots/qemuarm/usr/include/c++/backward
>> ...
>>
>> and if I now change --sysroot to something else
>>
>> /arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
>> --sysroot=3D/home/kraj/work/angstrom/sources/openembedded-core/build/tmp=
-eglibc/sysroots/qemuarm4
>> -v
>> ...
>>
>> ignoring nonexistent directory
>> "/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sys=
roots/qemuarm4/usr/include/c++"
>> ignoring nonexistent directory
>> "/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sys=
roots/qemuarm4/usr/include/c++/arm-oe-linux-gnueabi"
>> ignoring nonexistent directory
>> "/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sys=
roots/qemuarm4/usr/include/c++/backward"
>> ...
>>
>> See now its looking for them in 'qemuarm4' sysroot
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
>> =C2=A0.../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0189 ++++++++++++++++++--
>> =C2=A0meta/recipes-devtools/gcc/gcc-configure-cross.inc =C2=A0| =C2=A0 =
=C2=A02 +-
>> =C2=A0.../recipes-devtools/gcc/gcc-configure-runtime.inc | =C2=A0 =C2=A0=
2 +-
>> =C2=A0meta/recipes-devtools/gcc/gcc-configure-sdk.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
>> =C2=A05 files changed, 175 insertions(+), 24 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.6.inc
>> index 18e0536..4bbb2d2 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> @@ -1,6 +1,6 @@
>> =C2=A0require gcc-common.inc
>>
>> -PR =3D "r19"
>> +PR =3D "r20"
>>
>> =C2=A0# Third digit in PV should be incremented after a minor release
>> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
>> @@ -62,7 +62,6 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=
=3D${BRANCH};proto=3Dhttp \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://64bithack.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://optional_libstdc.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_relax_pic_calls_flag.pa=
tch \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COLLECT_GCC_OPTIONS.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatile_access_backpor=
t.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-defaults.h-and-t-oe=
-in-B.patch \
>> @@ -73,6 +72,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=
=3D${BRANCH};proto=3Dhttp \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pr32219.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pr47551.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-arm-set-cost.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> =C2=A0SRC_URI_append_sh3 =C2=A0=3D " file://sh3-installfix-fixheaders.pa=
tch "
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_wit=
h_sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_w=
ith_sysroot.patch
>> index 05b2fa9..6ccbeea 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysro=
ot.patch
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysro=
ot.patch
>> @@ -1,35 +1,186 @@
>> -Upstream-Status: Pending
>> -
>> -# by default c++ include directories are not relative to "--sysroot"
>> -# which brings one trouble when using the toolchain in an environment
>> -# where the build directory generating that toolchain doesn't exist,
>> -# e.g. in sstate, machine specific sysroot and relocatable SDK
>> -# toolchain. This patch now enables c++ include paths under sysroot.
>> -# This way it's enough as long as "--sysroot" is correctly enabled
>> -# in the new environment.
>> -#
>> -# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-12-30
>> -
>> -Index: gcc-4.6.0/gcc/cppdefault.c
>> +source: http://patchwork.ozlabs.org/patch/129800/
>> +Upstream-Status: Submitted
>> +
>> +ChangeLog
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Makefile.in (gcc_gxx_include_dir_add_sysr=
oot): New.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(PREPROCESSOR_DEFINES): Define GPLUS=
PLUS_INCLUDE_DIR_ADD_SYSROOT.
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* cppdefault.c (cpp_include_defaults): repl=
ace hard coded "1" with
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT fo=
r "add_sysroot" field.
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* configure.ac (AC_SUBST): Add gcc_gxx_incl=
ude_dir_add_sysroot to
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0control whether sysroot should be pr=
epended to gxx include dir.
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* configure: Regenerate.
>> +
>> +Hi, this is a follow up for issue "http://codereview.appspot.com/464107=
6".
>> +
>> +The rationale for the patch copied from previous thread:
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +The setup:
>> +
>> +Configuring a toolchain targeting x86-64 GNU Linux (Ubuntu Lucid), as a
>> +cross-compiler. =C2=A0Using a sysroot to provide the Lucid headers+libr=
aries,
>> +with the sysroot path being within the GCC install tree. =C2=A0Want to =
use the
>> +Lucid system libstdc++ and headers, which means that I'm not
>> +building/installing libstdc++-v3.
>> +
>> +So, configuring with:
>> + =C2=A0--with-sysroot=3D"$SYSROOT"
>> + =C2=A0--disable-libstdc++-v3 \
>> + =C2=A0--with-gxx-include-dir=3D"$SYSROOT/usr/include/c++/4.4" \
>> +(among other options).
>> +
>> +Hoping to support two usage models with this configuration, w.r.t. use =
of
>> +the sysroot:
>> +
>> +(1) somebody installs the sysroot in the normal location relative to th=
e
>> +GCC install, and relocates the whole bundle (sysroot+GCC). =C2=A0This w=
orks
>> +great AFAICT, GCC finds its includes (including the C++ includes) thank=
s
>> +to the add_standard_paths iprefix handling.
>> +
>> +(2) somebody installs the sysroot in a non-standard location, and uses
>> +--sysroot to try to access it. =C2=A0This works fine for the C headers,=
 but
>> +doesn't work.
>> +
>> +For the C headers, add_standard_paths prepends the sysroot location to
>> +the /usr/include path (since that's what's specified in cppdefault.c fo=
r
>> +that path). =C2=A0It doesn't do the same for the C++ include path, thou=
gh
>> +(again, as specified in cppdefault.c).
>> +
>> +add_standard_paths doesn't attempt to relocate built-in include paths t=
hat
>> +start with the compiled-in sysroot location (e.g., the g++ include dir,=
 in
>> +this case). =C2=A0This isn't surprising really: normally you either pre=
pend the
>> +sysroot location or you don't (as specified by cppdefault.c); none of t=
he
>> +built-in paths normally *start* with the sysroot location and need to b=
e
>> +relocated. =C2=A0However, in this odd-ball case of trying to use the C+=
+ headers
>> +from the sysroot, one of the paths *does* need to be relocated in this =
way.
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +Index: gcc-4_6-branch/gcc/Makefile.in
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4_6-branch.orig/gcc/Makefile.in =C2=A0 =C2=A0 =C2=A02011-12-13 =
22:52:15.000000000 -0800
>> ++++ gcc-4_6-branch/gcc/Makefile.in =C2=A0 2011-12-13 22:52:21.933635767=
 -0800
>> +@@ -587,6 +587,7 @@
>> + build_tooldir =3D $(exec_prefix)/$(target_noncanonical)
>> + # Directory in which the compiler finds target-independent g++ include=
s.
>> + gcc_gxx_include_dir =3D @gcc_gxx_include_dir@
>> ++gcc_gxx_include_dir_add_sysroot =3D @gcc_gxx_include_dir_add_sysroot@
>> + # Directory to search for site-specific includes.
>> + local_includedir =3D $(local_prefix)/include
>> + includedir =3D $(prefix)/include
>> +@@ -3964,6 +3965,7 @@
>> + =C2=A0 -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
>> + =C2=A0 -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
>> + =C2=A0 -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
>> ++ =C2=A0-DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add=
_sysroot) \
>> + =C2=A0 -DGPLUSPLUS_TOOL_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)/$(targe=
t_noncanonical)\" \
>> + =C2=A0 -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)/bac=
kward\" \
>> + =C2=A0 -DLOCAL_INCLUDE_DIR=3D\"$(local_includedir)\" \
>> +Index: gcc-4_6-branch/gcc/configure.ac
>> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- gcc-4.6.0.orig/gcc/cppdefault.c
>> -+++ gcc-4.6.0/gcc/cppdefault.c
>> -@@ -48,15 +48,15 @@ const struct default_include cpp_include
>> +--- gcc-4_6-branch.orig/gcc/configure.ac =C2=A0 =C2=A0 2011-12-13 22:52=
:15.000000000 -0800
>> ++++ gcc-4_6-branch/gcc/configure.ac =C2=A02011-12-13 22:52:21.937635526=
 -0800
>> +@@ -144,6 +144,15 @@
>> + =C2=A0 fi
>> + fi
>> +
>> ++gcc_gxx_include_dir_add_sysroot=3D0
>> ++if test "${with_sysroot+set}" =3D set; then :
>> ++ =C2=A0gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : "${w=
ith_sysroot}"'\(.*\)'`
>> ++ =C2=A0if test "${gcc_gxx_without_sysroot}"; then :
>> ++ =C2=A0 =C2=A0gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
>> ++ =C2=A0 =C2=A0gcc_gxx_include_dir_add_sysroot=3D1
>> ++ =C2=A0fi
>> ++fi
>> ++
>> + AC_ARG_WITH(cpp_install_dir,
>> + [ =C2=A0--with-cpp-install-dir=3DDIR
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 install the user visible C preprocessor in DIR
>> +@@ -4737,6 +4746,7 @@
>> + AC_SUBST(float_h_file)
>> + AC_SUBST(gcc_config_arguments)
>> + AC_SUBST(gcc_gxx_include_dir)
>> ++AC_SUBST(gcc_gxx_include_dir_add_sysroot)
>> + AC_SUBST(host_exeext)
>> + AC_SUBST(host_xm_file_list)
>> + AC_SUBST(host_xm_include_list)
>> +Index: gcc-4_6-branch/gcc/cppdefault.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4_6-branch.orig/gcc/cppdefault.c =C2=A0 =C2=A0 2011-12-13 22:51=
:28.000000000 -0800
>> ++++ gcc-4_6-branch/gcc/cppdefault.c =C2=A02011-12-13 22:52:21.937635526=
 -0800
>> +@@ -48,15 +48,18 @@
>> =C2=A0 =3D {
>> =C2=A0 #ifdef GPLUSPLUS_INCLUDE_DIR
>> =C2=A0 =C2=A0 =C2=A0 /* Pick up GNU C++ generic include files. =C2=A0*/
>> =C2=A0- =C2=A0 =C2=A0{ GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
>> -+ =C2=A0 =C2=A0{ GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
>> ++ =C2=A0 =C2=A0{ GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
>> ++ =C2=A0 =C2=A0 =C2=A0GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
>> =C2=A0 #endif
>> =C2=A0 #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
>> =C2=A0 =C2=A0 =C2=A0 /* Pick up GNU C++ target-dependent include files. =
=C2=A0*/
>> =C2=A0- =C2=A0 =C2=A0{ GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 0, 1 },
>> -+ =C2=A0 =C2=A0{ GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 1, 1 },
>> ++ =C2=A0 =C2=A0{ GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
>> ++ =C2=A0 =C2=A0 =C2=A0GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
>> =C2=A0 #endif
>> =C2=A0 #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
>> =C2=A0 =C2=A0 =C2=A0 /* Pick up GNU C++ backward and deprecated include =
files. =C2=A0*/
>> =C2=A0- =C2=A0 =C2=A0{ GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 0, 0=
 },
>> -+ =C2=A0 =C2=A0{ GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
>> ++ =C2=A0 =C2=A0{ GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
>> ++ =C2=A0 =C2=A0 =C2=A0GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
>> =C2=A0 #endif
>> =C2=A0 #ifdef GCC_INCLUDE_DIR
>> =C2=A0 =C2=A0 =C2=A0 /* This is the dir for gcc's private headers. =C2=
=A0*/
>> +Index: gcc-4_6-branch/gcc/configure
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4_6-branch.orig/gcc/configure =C2=A0 =C2=A0 =C2=A0 =C2=A02011-1=
2-13 22:52:15.000000000 -0800
>> ++++ gcc-4_6-branch/gcc/configure =C2=A0 =C2=A0 2011-12-13 22:52:33.1856=
90436 -0800
>> +@@ -636,6 +636,7 @@
>> + host_xm_include_list
>> + host_xm_file_list
>> + host_exeext
>> ++gcc_gxx_include_dir_add_sysroot
>> + gcc_gxx_include_dir
>> + gcc_config_arguments
>> + float_h_file
>> +@@ -3313,6 +3314,15 @@
>> + =C2=A0 fi
>> + fi
>> +
>> ++gcc_gxx_include_dir_add_sysroot=3D0
>> ++if test "${with_sysroot+set}" =3D set; then :
>> ++ =C2=A0gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : "${w=
ith_sysroot}"'\(.*\)'`
>> ++ =C2=A0if test "${gcc_gxx_without_sysroot}"; then :
>> ++ =C2=A0 =C2=A0gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
>> ++ =C2=A0 =C2=A0gcc_gxx_include_dir_add_sysroot=3D1
>> ++ =C2=A0fi
>> ++fi
>> ++
>> +
>> + # Check whether --with-cpp_install_dir was given.
>> + if test "${with_cpp_install_dir+set}" =3D set; then :
>> +@@ -17514,7 +17524,7 @@
>> + =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>> + =C2=A0 lt_status=3D$lt_dlunknown
>> + =C2=A0 cat > conftest.$ac_ext <<_LT_EOF
>> +-#line 17517 "configure"
>> ++#line 17527 "configure"
>> + #include "confdefs.h"
>> +
>> + #if HAVE_DLFCN_H
>> +@@ -17620,7 +17630,7 @@
>> + =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>> + =C2=A0 lt_status=3D$lt_dlunknown
>> + =C2=A0 cat > conftest.$ac_ext <<_LT_EOF
>> +-#line 17623 "configure"
>> ++#line 17633 "configure"
>> + #include "confdefs.h"
>> +
>> + #if HAVE_DLFCN_H
>> +@@ -26151,6 +26161,7 @@
>> +
>> +
>> +
>> ++
>> +
>> +
>> +
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-cross.inc
>> index d2d9081..5816768 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
>> @@ -10,7 +10,7 @@ EXTRA_OECONF +=3D " --enable-poison-system-directories=
 \
>> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> =C2=A0EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET=
}${target_exec_prefix} \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-=
gxx-include-dir=3D${target_includedir}/c++ \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-=
gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++ \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-sysroot=3D${STAGING_DIR_TARGET} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/=
recipes-devtools/gcc/gcc-configure-runtime.inc
>> index 34bfaeb..3b440ff 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> @@ -4,7 +4,7 @@ CXXFLAGS :=3D "${@oe_filter_out('-fvisibility-inlines-hi=
dden', '${CXXFLAGS}', d)}"
>>
>> =C2=A0EXTRA_OECONF_PATHS =3D " \
>> =C2=A0 =C2=A0 =C2=A0--with-local-prefix=3D${STAGING_DIR_TARGET}${prefix}=
 \
>> - =C2=A0 =C2=A0--with-gxx-include-dir=3D${includedir}/c++/ \
>> + =C2=A0 =C2=A0--with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_in=
cludedir}/c++/ \
>> =C2=A0 =C2=A0 =C2=A0--with-sysroot=3D${STAGING_DIR_TARGET} \
>> =C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/reci=
pes-devtools/gcc/gcc-configure-sdk.inc
>> index f130b47..eb6757c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> @@ -5,7 +5,7 @@ USE_NLS =3D '${@base_conditional( "TARGET_OS", "linux-uc=
libc", "no", "", d )}'
>> =C2=A0USE_NLS =3D '${@base_conditional( "TARGET_OS", "linux-uclibceabi",=
 "no", "", d )}'
>>
>> =C2=A0EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${SDKPATH}/sysroots/=
${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_exec_prefix} \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--with-gxx-include-dir=3D${target_includedir}/c++ \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--with-gxx-include-dir=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_=
VENDOR}-${TARGET_OS}${target_includedir}/c++ \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native=
}/${TARGET_SYS}/bin \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_V=
ENDOR}-${TARGET_OS} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET}"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


