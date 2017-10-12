Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D2A5D60603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 01:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC8DB20AD6;
	Thu, 12 Oct 2017 01:09:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PQRee5OYdMcr; Thu, 12 Oct 2017 01:09:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 91092203A8;
	Thu, 12 Oct 2017 01:09:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 21C311626ED; Wed, 11 Oct 2017 21:09:09 -0400 (EDT)
Date: Wed, 11 Oct 2017 21:09:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20171012010909.GH9221@denix.org>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<cf33ac88e28b8e91f25d750de9a1385808d5e1f7.1507735448.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cf33ac88e28b8e91f25d750de9a1385808d5e1f7.1507735448.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/50] oprofile: remove the recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 01:09:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2017 at 06:33:53PM +0300, Alexander Kanavin wrote:
> Perf is the preferred solution, and oprofile is difficult to
> maintain against musl.

Can we consider moving it to meta-openembedded and maybe relaxing 
requirements, such as musl compatibility?


> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc          |   1 -
>  meta/conf/layer.conf                               |   1 -
>  meta/recipes-kernel/oprofile/oprofile.inc          |  65 ---
>  ...Add-rmb-definition-for-NIOS2-architecture.patch |  30 --
>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |  51 --
>  meta/recipes-kernel/oprofile/oprofile/acinclude.m4 | 581 ---------------------
>  .../oprofile/oprofile/automake-foreign.patch       |  12 -
>  meta/recipes-kernel/oprofile/oprofile/musl.patch   |  46 --
>  .../oprofile/oprofile-cross-compile-tests.patch    |  98 ----
>  .../oprofile/oprofile/root-home-dir.patch          |  44 --
>  meta/recipes-kernel/oprofile/oprofile/run-ptest    |  19 -
>  meta/recipes-kernel/oprofile/oprofile_1.1.0.bb     |  10 -
>  12 files changed, 958 deletions(-)
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile.inc
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/acinclude.m4
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/musl.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> 
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index f7c8b4a6bda..3b0411c3547 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -278,7 +278,6 @@ DISTRO_PN_ALIAS_pn-opkg-collateral = "OE-Core"
>  DISTRO_PN_ALIAS_pn-opkg-keyrings = "OSPDT upstream=git://git.yoctoproject.org/opkg-utils"
>  DISTRO_PN_ALIAS_pn-opkg-nogpg = "OSPDT upstream=git://git.yoctoproject.org/opkg-utils"
>  DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=git://git.yoctoproject.org/opkg-utils"
> -DISTRO_PN_ALIAS_pn-oprofile = "Debian=oprofile Fedora=oprofile"
>  DISTRO_PN_ALIAS_pn-os-release = "OE-Core"
>  DISTRO_PN_ALIAS_pn-packagegroup-base = "OE-Core"
>  DISTRO_PN_ALIAS_pn-packagegroup-core = "OE-Core"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 6be2a57a70a..034232474fe 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -63,7 +63,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    font-alias->font-util \
>    weston-init->weston \
>    weston-init->kbd \
> -  oprofile->virtual/kernel \
>  "
>  
>  # We need to keep bitbake tools in PATH
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
> deleted file mode 100644
> index 4b01654fa3e..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -SUMMARY = "System-Wide Profiler"
> -DESCRIPTION = "OProfile is a system-wide profiler for Linux systems, capable \
> -of profiling all running code at low overhead."
> -HOMEPAGE = "http://oprofile.sourceforge.net/news/"
> -BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16191&atid=116191"
> -
> -LICENSE = "LGPLv2.1+ & GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://libopagent/opagent.h;beginline=5;endline=26;md5=4f16f72c7a493d8a4704aa18d03d15c6 \
> -                   "
> -SECTION = "devel"
> -
> -DEPENDS = "popt binutils"
> -RDEPENDS_${PN} = "binutils-symlinks"
> -RRECOMMENDS_${PN} = "kernel-vmlinux"
> -
> -FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
> -FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
> -FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
> -           file://acinclude.m4 \
> -           file://automake-foreign.patch \
> -           file://oprofile-cross-compile-tests.patch \
> -           file://run-ptest \
> -           file://root-home-dir.patch \
> -           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
> -           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
> -"
> -UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
> -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
> -
> -SRC_URI_append_libc-musl = " file://musl.patch"
> -
> -inherit autotools pkgconfig ptest
> -
> -EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix} --without-x ac_cv_prog_XSLTPROC="
> -do_configure () {
> -	cp ${WORKDIR}/acinclude.m4 ${S}/
> -	autotools_do_configure
> -}
> -
> -EXTRA_OEMAKE = "SRCDIR=${PTEST_PATH}/libutil++/tests"
> -do_compile_ptest() {
> -	oe_runmake check
> -}
> -
> -do_install_ptest() {
> -	subdirs="libdb/tests libutil++/tests libregex/tests libutil/tests libop/tests libdb/tests "
> -	for tooltest in ${subdirs}
> -	do
> -		find ${tooltest} -perm /u=x -type f| cpio -pvdu ${D}${PTEST_PATH}
> -	done
> -
> -	# needed by some libop tests
> -	cp -r events ${D}${PTEST_PATH}
> -
> -	# needed by libregex regex_test
> -	cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
> -	cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
> -
> -	# needed by litutil++ file_manip_tests
> -	cp ${S}/libutil++/tests/file_manip_tests.cpp \
> -		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
> -}
> diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
> deleted file mode 100644
> index ae8562a231a..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 34b0d9b1a32fb404a30327a7ae8931c7c75583bf Mon Sep 17 00:00:00 2001
> -From: Marek Vasut <marex@denx.de>
> -Date: Tue, 9 Feb 2016 02:00:29 +0100
> -Subject: [PATCH] Add rmb() definition for NIOS2 architecture
> -
> -Signed-off-by: Marek Vasut <marex@denx.de>
> -Upstream-Status: Submitted [ http://marc.info/?l=oprofile-list&m=145501915931874&w=2 ]
> ----
> - libperf_events/operf_utils.h | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
> -index 32954cc..8270e53 100644
> ---- a/libperf_events/operf_utils.h
> -+++ b/libperf_events/operf_utils.h
> -@@ -178,6 +178,11 @@ void op_release_resources(void);
> - #define cpu_relax()	asm volatile("" ::: "memory")
> - #endif
> - 
> -+#ifdef __nios2__
> -+#define rmb()		asm volatile("" ::: "memory")
> -+#define cpu_relax()	asm volatile("" ::: "memory")
> -+#endif
> -+
> - #ifdef __tile__
> - #include <asm/unistd.h>
> - #define rmb()		__insn_mf()
> --- 
> -2.7.0
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
> deleted file mode 100644
> index d372fd527ba..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
> -From: William Cohen <wcohen@redhat.com>
> -Date: Fri, 5 Feb 2016 17:30:19 -0500
> -Subject: [PATCH] Fix FTBFS problem with GCC-6
> -
> -GCC-6 is pickier about some of the type conversions causing the Fedora
> -24 mass rebuild the build of oprofile failed with:
> -
> -make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
> -g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
> -op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
> -op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
> -  bool const verbose = cverb << (vbfd & vlevel1);
> -                                               ^
> -op_bfd.cpp:546:7: error: in argument to unary !
> -  if (!verbose)
> -       ^~~~~~~
> -
> -Avoid the intermediate bool type to make GCC-6 happy.
> -
> -Signed-off-by: William Cohen <wcohen@redhat.com>
> ----
> -Upstream-Status: Backport
> -
> - libutil++/op_bfd.cpp | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
> -index 389c920..f2eb42b 100644
> ---- a/libutil++/op_bfd.cpp
> -+++ b/libutil++/op_bfd.cpp
> -@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
> - {
> - 	op_bfd_symbol const & sym = syms[sym_idx];
> - 
> --	bool const verbose = cverb << (vbfd & vlevel1);
> --
> - 	if (anon_obj)
> - 		start = sym.vma();
> - 	else
> - 		start = sym.filepos();
> - 	end = start + sym.size();
> - 
> --	if (!verbose)
> -+	if (!(cverb << (vbfd & vlevel1)))
> - 		return;
> - 
> - 	io_state state(cverb << (vbfd & vlevel1));
> --- 
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4 b/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
> deleted file mode 100644
> index 95ecd91b5e2..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
> +++ /dev/null
> @@ -1,581 +0,0 @@
> -dnl AX_KERNEL_OPTION(option, action-if-found, action-if-not-found)
> -dnl see if autoconf.h defines the option
> -AC_DEFUN([AX_KERNEL_OPTION], [
> -SAVE_CFLAGS=$CFLAGS
> -CFLAGS="-I$KINC -O2 -D__KERNEL__"
> -AC_TRY_COMPILE( [#include <linux/config.h>],
> -[
> -#ifndef $1
> -break_me_hard(\\\);
> -#endif
> -],[$2],[$3],)
> -CFLAGS=$SAVE_CFLAGS
> -])
> -
> -dnl Handle the 2.4 module inside module/
> -AC_DEFUN([AX_CONFIG_MODULE],
> -[
> -if test ! -f $KINC/linux/autoconf.h; then
> -	AC_MSG_ERROR([no suitably configured kernel include tree found])
> -fi
> -
> -dnl  --- Get Linux kernel version and compile parameters ---
> -
> -AC_SUBST(KVERS)
> -AC_MSG_CHECKING([for kernel version])
> -dnl it's like this to handle mandrake's fubar version.h - bug #471448
> -eval KVERS=`gcc -I$KINC -E -dM $KINC/linux/version.h | grep -w UTS_RELEASE | awk '{print $[]3}'`
> -AC_MSG_RESULT([$KVERS])
> -case "$KVERS" in
> -2.2.*|2.4.*) ;;
> -*) AC_MSG_ERROR([Unsupported kernel version])
> -esac
> -
> -dnl Check for the minimal kernel version supported
> -AC_MSG_CHECKING([kernel version])
> -AX_KERNEL_VERSION(2, 2, 10, <=, AC_MSG_RESULT([ok]), AC_MSG_ERROR([check html documentation install section]))
> -
> -dnl linux/spinlock.h added at some point in past
> -AC_MSG_CHECKING([for $KINC/linux/spinlock.h])
> -if test -f $KINC/linux/spinlock.h; then
> -	EXTRA_CFLAGS_MODULE="$EXTRA_CFLAGS_MODULE -DHAVE_LINUX_SPINLOCK_HEADER"
> -	AC_MSG_RESULT([yes])
> -else
> -	AC_MSG_RESULT([no])
> -fi
> -
> -AC_MSG_CHECKING([for rtc_lock])
> -gcc -I$KINC -E $KINC/linux/mc146818rtc.h | grep rtc_lock >/dev/null
> -if test "$?" -eq 0; then
> -	EXTRA_CFLAGS_MODULE="$EXTRA_CFLAGS_MODULE -DRTC_LOCK"
> -	AC_MSG_RESULT([yes])
> -else
> -	AC_MSG_RESULT([no])
> -fi
> -	 
> -arch="unknown"
> -AC_MSG_CHECKING(for x86-64 architecture)
> -AX_KERNEL_OPTION(CONFIG_X86_64, x8664=1, x8664=0)
> -AX_MSG_RESULT_YN($x8664)
> -BUILD_HAMMER=no
> -if test "$x8664" -eq 1; then
> -	arch="x86"
> -	BUILD_HAMMER=yes
> -else
> -	AC_MSG_CHECKING(for x86 architecture)
> -	AX_KERNEL_OPTION(CONFIG_X86, x86=1, x86=0)
> -	AX_KERNEL_OPTION(CONFIG_X86_WP_WORKS_OK, x86=1, x86=$x86)
> -	AX_MSG_RESULT_YN($x86)
> -	test "$x86" = 1 && arch="x86"
> -	
> -	if test "$arch" = "unknown"; then
> -  		AC_MSG_CHECKING(for ia64 architecture)
> -  		AX_KERNEL_OPTION(CONFIG_IA64, ia64=1, ia64=0)
> -  		AX_MSG_RESULT_YN($ia64)
> -  		test "$ia64" = 1 && arch="ia64"
> -	fi
> -
> -fi
> -AC_SUBST(BUILD_HAMMER)
> -
> -test "$arch" = "unknown" && AC_MSG_ERROR(Unsupported architecture)
> -
> -dnl check to see if kernel verion appropriate for arch
> -AC_MSG_CHECKING(arch/kernel version combination)
> -case "$arch" in
> -ia64)
> -	AX_KERNEL_VERSION(2, 4, 18, <, AC_MSG_RESULT([ok]),
> -		AC_MSG_ERROR([unsupported arch/kernel])) ;;
> -*) AC_MSG_RESULT([ok])
> -esac
> -
> -dnl for now we do not support PREEMPT patch
> -AC_MSG_CHECKING([for preempt patch])
> -AX_KERNEL_OPTION(CONFIG_PREEMPT,preempt=1,preempt=0)
> -AX_MSG_RESULT_YN([$preempt])
> -test "$preempt" = 0 || AC_MSG_ERROR([unsupported kernel configuration : CONFIG_PREEMPT])
> -
> -AC_SUBST(KINC)
> -
> -MODINSTALLDIR=/lib/modules/$KVERS
> - 
> -OPROFILE_MODULE_ARCH=$arch
> -AC_SUBST(OPROFILE_MODULE_ARCH)
> -]
> -)
> -
> -dnl AX_MSG_RESULT_YN(a)
> -dnl results "yes" iff a==1, "no" else
> -AC_DEFUN([AX_MSG_RESULT_YN], [x=no
> -test "x$1" = "x1" && x=yes
> -AC_MSG_RESULT($x)])
> -
> -dnl AX_MALLOC_ATTRIBUTE - see if gcc will take __attribute__((malloc))
> -AC_DEFUN([AX_MALLOC_ATTRIBUTE],
> -[
> -AC_MSG_CHECKING([whether malloc attribute is understood])
> -SAVE_CFLAGS=$CFLAGS
> -CFLAGS="-Werror $CFLAGS"
> -AC_TRY_COMPILE(,[
> -void monkey() __attribute__((malloc));
> -],AC_MSG_RESULT([yes]); AC_DEFINE(MALLOC_ATTRIBUTE_OK, 1, [whether malloc attribute is understood]), AC_MSG_RESULT([no]))
> -CFLAGS=$SAVE_CFLAGS 
> -]
> -)
> -
> -dnl builtin_expect is used in module we can't add that in config.h
> -AC_DEFUN([AX_BUILTIN_EXPECT],
> -[
> -AC_MSG_CHECKING([whether __builtin_expect is understood])
> -SAVE_CFLAGS=$CFLAGS
> -CFLAGS="-Werror $CFLAGS"
> -AC_TRY_LINK(,[
> -int i;
> -if (__builtin_expect(i, 0)) { }
> -],
> -AC_MSG_RESULT([yes]); EXTRA_CFLAGS_MODULE="$EXTRA_CFLAGS_MODULE -DEXPECT_OK",
> -AC_MSG_RESULT([no]);)
> -CFLAGS=$SAVE_CFLAGS 
> -]
> -) 
> -
> -dnl AX_EXTRA_DIRS - Let user specify extra dirs for include/libs
> -AC_DEFUN([AX_EXTRA_DIRS],
> -[
> -AC_ARG_WITH(extra-includes,
> -[  --with-extra-includes=DIR    add extra include paths],
> -  use_extra_includes="$withval",
> -  use_extra_includes=NO
> -)
> -if test -n "$use_extra_includes" && \
> -        test "$use_extra_includes" != "NO"; then
> -  ac_save_ifs=$IFS
> -  IFS=':'
> -  for dir in $use_extra_includes; do
> -    extra_includes="$extra_includes -I$dir"
> -  done
> -  IFS=$ac_save_ifs
> -  CPPFLAGS="$CPPFLAGS $extra_includes"
> -fi
> -
> -AC_ARG_WITH(extra-libs,
> -[  --with-extra-libs=DIR        add extra library paths],
> -  use_extra_libs=$withval,
> -  use_extra_libs=NO
> -)
> -if test -n "$use_extra_libs" && \
> -        test "$use_extra_libs" != "NO"; then
> -   ac_save_ifs=$IFS
> -   IFS=':'
> -   for dir in $use_extra_libs; do
> -     extra_libraries="$extra_libraries -L$dir"
> -   done
> -   IFS=$ac_save_ifs
> -   LDFLAGS="$LDFLAGS $extra_libraries"
> -fi
> -]
> -)
> -
> -dnl AX_POPT_CONST - check popt prototype
> -AC_DEFUN([AX_POPT_CONST],
> -[
> -AC_MSG_CHECKING([popt prototype])
> -SAVE_CXXFLAGS=$CXXFLAGS
> -CXXFLAGS="-Werror $CXXFLAGS"
> -AC_TRY_COMPILE([#include <popt.h>],
> -[
> -int c; char **v;
> -poptGetContext(0, c, v, 0, 0);
> -],
> -AC_MSG_RESULT([takes char **]);,
> -AC_MSG_RESULT([takes const char **]); AC_DEFINE(CONST_POPT, 1, [whether popt prototype takes a const char **]))
> -CXXFLAGS="$SAVE_CXXFLAGS"
> -]
> -)
> -
> -dnl AX_CHECK_SSTREAM - check if local sstream is needed to compile OK
> -AC_DEFUN([AX_CHECK_SSTREAM],
> -[
> -AC_MSG_CHECKING([whether to use included sstream])
> -AC_TRY_COMPILE([#include <sstream>], [], 
> -AC_MSG_RESULT([no]);,
> -AC_MSG_RESULT([yes]); OP_CXXFLAGS="$OP_CXXFLAGS -I\${top_srcdir}/include")
> -]
> -)
> -
> -dnl AX_CHECK_TYPEDEF(typedef_name, type, action-if-true, action-if-false)
> -dnl exec action-if-true if typedef_name is a typedef to type else exec 
> -dnl action-if-false
> -dnl currently work only with type typedef'ed in stddef.h
> -AC_DEFUN([AX_CHECK_TYPEDEF], [
> -dnl AC_LANG_PUSH(C) not in autoconf 2.13
> -AC_LANG_SAVE
> -AC_LANG_C
> -SAVE_CFLAGS=$CFLAGS
> -CFLAGS="-Werror $CFLAGS"
> -
> -AC_TRY_COMPILE(
> -  [
> -  #include <stddef.h>
> -  ],
> -  [
> -  typedef void (*fct1)($1);
> -  typedef void (*fct2)($2);
> -  fct1 f1 = 0;
> -  fct2 f2 = 0;
> -  if (f1 == f2) {}
> -  ],
> -[$3],[$4])
> -
> -CFLAGS=$SAVE_CFLAGS
> -AC_LANG_RESTORE
> -])
> -
> -
> -dnl AX_TYPEDEFED_NAME(typedef_name, candidate_list, var_name)
> -dnl set var_name to the typedef name of $1 which must be in canditate_list
> -dnl else produce a fatal error
> -AC_DEFUN([AX_TYPEDEFED_NAME], [
> -	AC_MSG_CHECKING([type of $1])
> -	for f in $2; do
> -		AX_CHECK_TYPEDEF($1, $f, $3="$f", $3="")
> -		if test -n "${$3}"; then
> -			break
> -		fi
> -	done
> -	if test -n "${$3}"; then
> -		AC_MSG_RESULT([${$3}])
> -	else
> -		AC_MSG_ERROR([not found])
> -	fi
> -])
> -
> -dnl find a binary in the path
> -AC_DEFUN([QT_FIND_PATH],
> -[
> -	AC_MSG_CHECKING([for $1])
> -	AC_CACHE_VAL(qt_cv_path_$1,
> -	[
> -		qt_cv_path_$1="NONE"
> -		if test -n "$$2"; then
> -			qt_cv_path_$1="$$2";
> -		else
> -			dirs="$3"
> -			qt_save_IFS=$IFS
> -			IFS=':'
> -			for dir in $PATH; do
> -				dirs="$dirs $dir"
> -			done
> -			IFS=$qt_save_IFS
> - 
> -			for dir in $dirs; do
> -				if test -x "$dir/$1"; then
> -					if test -n "$5"; then
> -						evalstr="$dir/$1 $5 2>&1 "
> -						if eval $evalstr; then
> -							qt_cv_path_$1="$dir/$1"
> -							break
> -						fi
> -					else
> -						qt_cv_path_$1="$dir/$1"
> -						break
> -					fi
> -				fi
> -			done
> -		fi
> -	])
> - 
> -	if test -z "$qt_cv_path_$1" || test "$qt_cv_path_$1" = "NONE"; then
> -		AC_MSG_RESULT(not found)
> -		$4
> -	else
> -		AC_MSG_RESULT($qt_cv_path_$1)
> -		$2=$qt_cv_path_$1
> -	fi
> -])
> -
> -dnl Find the uic compiler on the path or in qt_cv_dir
> -AC_DEFUN([QT_FIND_UIC],
> -[
> -	QT_FIND_PATH(uic, ac_uic, $qt_cv_dir/bin)
> -	if test -z "$ac_uic" -a "$FATAL" = 1; then
> -		AC_MSG_ERROR([uic binary not found in \$PATH or $qt_cv_dir/bin !])
> -	fi
> -])
> - 
> -dnl Find the right moc in path/qt_cv_dir
> -AC_DEFUN([QT_FIND_MOC],
> -[
> -	QT_FIND_PATH(moc2, ac_moc2, $qt_cv_dir/bin)
> -	QT_FIND_PATH(moc, ac_moc1, $qt_cv_dir/bin)
> -
> -	if test -n "$ac_moc1" -a -n "$ac_moc2"; then
> -		dnl found both. Prefer Qt3's if it exists else moc2
> -		$ac_moc1 -v 2>&1 | grep "Qt 3" >/dev/null
> -		if test "$?" = 0; then
> -			ac_moc=$ac_moc1;
> -		else
> -			ac_moc=$ac_moc2;
> -		fi
> -	else
> -		if test -n "$ac_moc1"; then
> -			ac_moc=$ac_moc1;
> -		else
> -			ac_moc=$ac_moc2;
> -		fi
> -	fi
> -
> -	if test -z "$ac_moc"  -a "$FATAL" = 1; then
> -		AC_MSG_ERROR([moc binary not found in \$PATH or $qt_cv_dir/bin !])
> -	fi
> -])
> -
> -dnl check a particular libname
> -AC_DEFUN([QT_TRY_LINK],
> -[
> -	SAVE_LIBS="$LIBS"
> -	LIBS="$LIBS $1"
> -	AC_TRY_LINK([
> -	#include <qglobal.h>
> -	#include <qstring.h>
> -		],
> -	[
> -	QString s("mangle_failure");
> -	#if (QT_VERSION < 221)
> -	break_me_(\\\);
> -	#endif
> -	],
> -	qt_cv_libname=$1,
> -	)
> -	LIBS="$SAVE_LIBS"
> -])
> - 
> -dnl check we can do a compile
> -AC_DEFUN([QT_CHECK_COMPILE],
> -[
> -	AC_MSG_CHECKING([for Qt library name])
> - 
> -	AC_CACHE_VAL(qt_cv_libname,
> -	[
> -		AC_LANG_CPLUSPLUS
> -		SAVE_CXXFLAGS=$CXXFLAGS
> -		CXXFLAGS="$CXXFLAGS $QT_INCLUDES $QT_LDFLAGS" 
> -
> -		for libname in -lqt-mt -lqt3 -lqt2 -lqt;
> -		do
> -			QT_TRY_LINK($libname)
> -			if test -n "$qt_cv_libname"; then
> -				break;
> -			fi
> -		done
> -
> -		CXXFLAGS=$SAVE_CXXFLAGS
> -	])
> -
> -	if test -z "$qt_cv_libname"; then
> -		AC_MSG_RESULT([failed]) 
> -		if test "$FATAL" = 1 ; then
> -			AC_MSG_ERROR([Cannot compile a simple Qt executable. Check you have the right \$QTDIR !])
> -		fi
> -	else
> -		AC_MSG_RESULT([$qt_cv_libname])
> -	fi
> -])
> -
> -dnl get Qt version we're using
> -AC_DEFUN([QT_GET_VERSION],
> -[
> -	AC_CACHE_CHECK([Qt version],lyx_cv_qtversion,
> -	[
> -		AC_LANG_CPLUSPLUS
> -		SAVE_CPPFLAGS=$CPPFLAGS
> -		CPPFLAGS="$CPPFLAGS $QT_INCLUDES"
> -
> -		cat > conftest.$ac_ext <<EOF
> -#line __oline__ "configure"
> -#include "confdefs.h"
> -#include <qglobal.h>
> -"%%%"QT_VERSION_STR"%%%"
> -EOF
> -		lyx_cv_qtversion=`(eval "$ac_cpp conftest.$ac_ext") 2>&5 | \
> -			grep '^"%%%"'  2>/dev/null | \
> -			sed -e 's/"%%%"//g' -e 's/"//g'`
> -		rm -f conftest.$ac_ext
> -		CPPFLAGS=$SAVE_CPPFLAGS
> -	])
> - 
> -	QT_VERSION=$lyx_cv_qtversion
> -	AC_SUBST(QT_VERSION)
> -])
> - 
> -dnl start here 
> -AC_DEFUN([QT_DO_IT_ALL],
> -[
> -	dnl Please leave this alone. I use this file in
> -	dnl oprofile.
> -	FATAL=0
> -
> -	AC_ARG_WITH(qt-dir, [  --with-qt-dir           where the root of Qt is installed ],
> -		[ qt_cv_dir=`eval echo "$withval"/` ])
> -	 
> -	AC_ARG_WITH(qt-includes, [  --with-qt-includes      where the Qt includes are. ],
> -		[ qt_cv_includes=`eval echo "$withval"` ])
> - 
> -	AC_ARG_WITH(qt-libraries, [  --with-qt-libraries     where the Qt library is installed.],
> -		[  qt_cv_libraries=`eval echo "$withval"` ])
> -
> -	dnl pay attention to $QTDIR unless overridden
> -	if test -z "$qt_cv_dir"; then
> -		qt_cv_dir=$QTDIR
> -	fi
> - 
> -	dnl derive inc/lib if needed
> -	if test -n "$qt_cv_dir"; then
> -		if test -z "$qt_cv_includes"; then
> -			qt_cv_includes=$qt_cv_dir/include
> -		fi
> -		if test -z "$qt_cv_libraries"; then
> -			qt_cv_libraries=$qt_cv_dir/lib
> -		fi
> -	fi
> -
> -	dnl flags for compilation
> -	QT_INCLUDES=
> -	QT_LDFLAGS=
> -	if test -n "$qt_cv_includes"; then
> -		QT_INCLUDES="-I$qt_cv_includes"
> -	fi
> -	if test -n "$qt_cv_libraries"; then
> -		QT_LDFLAGS="-L$qt_cv_libraries"
> -	fi
> -	AC_SUBST(QT_INCLUDES)
> -	AC_SUBST(QT_LDFLAGS)
> - 
> -	QT_FIND_MOC
> -	MOC=$ac_moc
> -	AC_SUBST(MOC)
> -	QT_FIND_UIC
> -	UIC=$ac_uic
> -	AC_SUBST(UIC)
> -
> -	QT_CHECK_COMPILE
> - 
> -	QT_LIB=$qt_cv_libname;
> -	AC_SUBST(QT_LIB)
> -
> -	if test -n "$qt_cv_libname"; then
> -		QT_GET_VERSION
> -	fi
> -])
> -
> -dnl AX_CXXFLAGS_OPTIONS(var-name, option)
> -dnl add option to var-name if $CXX support it.
> -AC_DEFUN([AX_CHECK_PRECOMPILED_HEADER], [
> -AC_MSG_CHECKING([whether ${CXX} support precompiled header])
> -AC_LANG_SAVE
> -AC_LANG_CPLUSPLUS
> -SAVE_CXXFLAGS=$CXXFLAGS
> -dnl we consider than if -Winvalid-pch is accepted pch will works ...
> -CXXFLAGS=-Winvalid-pch
> -dnl but we don't want -Winvalid-pch else compilation will fail due -Werror and
> -dnl the fact than some pch will be invalid for the given compilation option
> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1="${$1} -include bits/stdc++.h", AC_MSG_RESULT([no]))
> -CXXFLAGS=$SAVE_CXXFLAGS
> -AC_LANG_RESTORE
> -])
> -
> -dnl AX_CHECK_DOCBOOK
> -AC_DEFUN([AX_CHECK_DOCBOOK], [
> -# It's just rude to go over the net to build
> -XSLTPROC_FLAGS=--nonet
> -DOCBOOK_ROOT=
> -if test ! -f /etc/xml/catalog; then
> -	for i in /usr/share/sgml/docbook/stylesheet/xsl/nwalsh /usr/share/sgml/docbook/xsl-stylesheets/;
> -	do
> -		if test -d "$i"; then
> -			DOCBOOK_ROOT=$i
> -		fi
> -	done
> -
> -	# Last resort - try net
> -	if test -z "$DOCBOOK_ROOT"; then
> -		XSLTPROC_FLAGS=
> -	fi
> -else
> -	XML_CATALOG=/etc/xml/catalog
> -	CAT_ENTRY_START='<!--'
> -	CAT_ENTRY_END='-->'
> -fi
> -
> -AC_CHECK_PROG(XSLTPROC,xsltproc,xsltproc,)
> -XSLTPROC_WORKS=no
> -if test -n "$XSLTPROC"; then
> -	AC_MSG_CHECKING([whether xsltproc works])
> -
> -	if test -n "$XML_CATALOG"; then
> -		DB_FILE="http://docbook.sourceforge.net/release/xsl/current/xhtml/docbook.xsl"
> -	else
> -		DB_FILE="$DOCBOOK_ROOT/docbook.xsl"
> -	fi
> -
> -	$XSLTPROC $XSLTPROC_FLAGS $DB_FILE >/dev/null 2>&1 << END
> -<?xml version="1.0" encoding='ISO-8859-1'?>
> -<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN" "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
> -<book id="test">
> -</book>
> -END
> -	if test "$?" = 0; then
> -		XSLTPROC_WORKS=yes
> -	fi
> -	AC_MSG_RESULT($XSLTPROC_WORKS)
> -fi
> -AM_CONDITIONAL(have_xsltproc, test "$XSLTPROC_WORKS" = "yes")
> -
> -AC_SUBST(XML_CATALOG)
> -AC_SUBST(XSLTPROC_FLAGS)
> -AC_SUBST(DOCBOOK_ROOT)
> -AC_SUBST(CAT_ENTRY_START)
> -AC_SUBST(CAT_ENTRY_END)
> -])
> -
> -dnl AX_CFLAGS_OPTIONS(var-name, option)
> -dnl add option to var-name if $CC support it.
> -AC_DEFUN([AX_CFLAGS_OPTION], [
> -AC_MSG_CHECKING([whether ${CC} $2 is understood])
> -AC_LANG_SAVE
> -AC_LANG_C
> -SAVE_CFLAGS=$CFLAGS
> -CFLAGS=$2
> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1="${$1} $2",AC_MSG_RESULT([no]))
> -CFLAGS=$SAVE_CFLAGS
> -AC_LANG_RESTORE
> -])
> -
> -
> -dnl AX_CXXFLAGS_OPTIONS(var-name, option)
> -dnl add option to var-name if $CXX support it.
> -AC_DEFUN([AX_CXXFLAGS_OPTION], [
> -AC_MSG_CHECKING([whether ${CXX} $2 is understood])
> -AC_LANG_SAVE
> -AC_LANG_CPLUSPLUS
> -SAVE_CXXFLAGS=$CXXFLAGS
> -CXXFLAGS=$2
> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1="${$1} $2",AC_MSG_RESULT([no]))
> -CXXFLAGS=$SAVE_CXXFLAGS
> -AC_LANG_RESTORE
> -])
> -
> -dnl AX_COPY_IF_CHANGE(source, dest)
> -dnl copy source to dest if they don't compare equally or if dest doesn't exist
> -AC_DEFUN([AX_COPY_IF_CHANGE], [
> -if test -r $2; then
> -	if cmp $1 $2 > /dev/null; then
> -		echo $2 is unchanged
> -	else
> -		cp -f $1 $2
> -	fi
> -else
> -	cp -f $1 $2
> -fi
> -])
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
> deleted file mode 100644
> index b9bb6c57799..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -oprofile doesn't want GNU-levels of automake strictness so tell it to be "foreign".
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 5740585..cf6c316 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -16 +16 @@ AC_CONFIG_SRCDIR([libop/op_config.h])
> --AM_INIT_AUTOMAKE
> -+AM_INIT_AUTOMAKE([foreign])
> diff --git a/meta/recipes-kernel/oprofile/oprofile/musl.patch b/meta/recipes-kernel/oprofile/oprofile/musl.patch
> deleted file mode 100644
> index 51db408454a..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/musl.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Fix glibc-isms so that oprofile builds with musl.
> -
> -Patch taken from openwrt (https://github.com/openwrt-mirror/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch)
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> ---- a/pe_profiling/operf.cpp
> -+++ b/pe_profiling/operf.cpp
> -@@ -857,11 +857,14 @@ static int __delete_old_previous_sample_
> -                                 int tflag  __attribute__((unused)),
> -                                 struct FTW *ftwbuf __attribute__((unused)))
> - {
> -+	int err;
> -+
> - 	if (remove(fpath)) {
> -+		err = errno;
> - 		perror("sample data removal error");
> --		return FTW_STOP;
> -+		return err;
> - 	} else {
> --		return FTW_CONTINUE;
> -+		return 0;
> - 	}
> - }
> - 
> -@@ -896,7 +899,7 @@ static void convert_sample_data(void)
> - 		return;
> - 
> - 	if (!operf_options::append) {
> --                int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
> -+                int flags = FTW_DEPTH;
> - 		errno = 0;
> - 		if (nftw(previous_sampledir.c_str(), __delete_old_previous_sample_data, 32, flags) !=0 &&
> - 				errno != ENOENT) {
> ---- a/libop/op_events.c
> -+++ b/libop/op_events.c
> -@@ -83,7 +83,7 @@ static int parse_hex(char const * str)
> - static u64 parse_long_hex(char const * str)
> - {
> - 	u64 value;
> --	if (sscanf(str, "%Lx", &value) != 1)
> -+	if (sscanf(str, "0x%llx", &value) != 1)
> - 		parse_error("expected long hexadecimal value");
> - 
> - 	fflush(stderr);
> diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
> deleted file mode 100644
> index aefa9548e1d..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -Prevent running check tests on host if cross compiling
> -
> -This patch enables running the 'make check' tests on the target
> -in a cross-compiled environment. If not cross-compiling, then 'make
> - check' builds and executes the tests; no change from this patch.
> -In a cross-compiling environment, the make variable CROSS_COMPILE is
> -set which bypasses assiging tests to the makekfile variable TESTS.
> -Since TESTS is empty, the 'make check' process never tries to run the
> -tests on the hosts.  On the target, the tests must be run manually.
> -
> -Also, in the libutil++ tests, a makefile variable SRCDIR is passed into
> -the compilation phase, pointing to the runtime location of the test
> -'file-manip-tests'.  The mechanism used for a host test, based on
> -'topdir' doesn't work.  Instead, if CROSS_COMPILE is set, the
> -makefile takes the path of SRCDIR from the build environment and not
> -from an expression based on the host path 'topdir'.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 41ece64..ce5a16f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -392,6 +392,7 @@ AC_ARG_ENABLE(account-check,
> - 	enable_account_check=$enableval, enable_account_check=yes)
> - 
> - AM_CONDITIONAL(CHECK_ACCOUNT, test "x$enable_account_check" = "xyes")
> -+AM_CONDITIONAL(CROSS_COMPILE, test "x$cross_compiling" = "xyes")
> - 
> - AC_SUBST(OP_CFLAGS)
> - AC_SUBST(OP_CXXFLAGS)
> -diff --git a/libdb/tests/Makefile.am b/libdb/tests/Makefile.am
> -index 8a69003..d820090 100644
> ---- a/libdb/tests/Makefile.am
> -+++ b/libdb/tests/Makefile.am
> -@@ -13,4 +13,6 @@ check_PROGRAMS = db_test
> - db_test_SOURCES = db_test.c
> - db_test_LDADD = ../libodb.a ../../libutil/libutil.a
> - 
> -+if ! CROSS_COMPILE
> - TESTS = ${check_PROGRAMS}
> -+endif
> -diff --git a/libop/tests/Makefile.am b/libop/tests/Makefile.am
> -index 8a79eb5..6d417c4 100644
> ---- a/libop/tests/Makefile.am
> -+++ b/libop/tests/Makefile.am
> -@@ -33,4 +33,6 @@ load_events_files_tests_LDADD = ${COMMON_LIBS}
> - mangle_tests_SOURCES = mangle_tests.c
> - mangle_tests_LDADD = ${COMMON_LIBS}
> - 
> -+if ! CROSS_COMPILE
> - TESTS = ${check_PROGRAMS} utf8_checker.sh
> -+endif
> -diff --git a/libregex/tests/Makefile.am b/libregex/tests/Makefile.am
> -index 6f19838..1d176f9 100644
> ---- a/libregex/tests/Makefile.am
> -+++ b/libregex/tests/Makefile.am
> -@@ -18,4 +18,6 @@ java_test_LDADD = \
> - 
> - EXTRA_DIST = mangled-name.in
> - 
> -+if ! CROSS_COMPILE
> - TESTS = ${check_PROGRAMS}
> -+endif
> -diff --git a/libutil++/tests/Makefile.am b/libutil++/tests/Makefile.am
> -index 51af031..a01ea2d 100644
> ---- a/libutil++/tests/Makefile.am
> -+++ b/libutil++/tests/Makefile.am
> -@@ -1,7 +1,9 @@
> - 
> - REALPATH= readlink -f
> - 
> -+if ! CROSS_COMPILE
> - SRCDIR := $(shell $(REALPATH) $(topdir)/libutil++/tests/ )
> -+endif
> - 
> - AM_CPPFLAGS = \
> - 	-I ${top_srcdir}/libutil++ -D SRCDIR="\"$(SRCDIR)/\"" @OP_CPPFLAGS@
> -@@ -46,4 +48,6 @@ cached_value_tests_LDADD = ${COMMON_LIBS}
> - utility_tests_SOURCES = utility_tests.cpp
> - utility_tests_LDADD = ${COMMON_LIBS}
> - 
> -+if ! CROSS_COMPILE
> - TESTS = ${check_PROGRAMS}
> -+endif
> -diff --git a/libutil/tests/Makefile.am b/libutil/tests/Makefile.am
> -index dfcd6ec..e8831b5 100644
> ---- a/libutil/tests/Makefile.am
> -+++ b/libutil/tests/Makefile.am
> -@@ -12,4 +12,6 @@ file_tests_LDADD = ../libutil.a
> - string_tests_SOURCES = string_tests.c
> - string_tests_LDADD = ../libutil.a
> - 
> -+if ! CROSS_COMPILE
> - TESTS = ${check_PROGRAMS}
> -+endif
> diff --git a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch b/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
> deleted file mode 100644
> index 3eaf6a794ad..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -oprofile: Determine the root home directory dynamically
> -
> -This commit detects the root home directory dynamically with changes to
> -the oprofile gui app source.
> -
> -The commit replaces an earlier fix that detected and adjusted a
> -'non-standard' root home directory at build time.  The advantage of this
> -patch is that the oprofile tools are adjusted to the current run-time
> -path to ~root, not the build time path.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
> -
> -Index: oprofile-1.0.0/doc/oprofile.html
> -===================================================================
> ---- oprofile-1.0.0.orig/doc/oprofile.html	2014-11-03 17:55:31.511034857 +0000
> -+++ oprofile-1.0.0/doc/oprofile.html	2014-11-03 17:57:26.415037988 +0000
> -@@ -1563,8 +1563,8 @@
> - 		<span class="emphasis"><em>must</em></span> stop it in a controlled manner in order to process
> - 		the profile data it has collected.  Use <code class="code">kill -SIGINT &lt;operf-PID&gt;</code>
> - 		for this purpose. It is recommended that when running <span class="command"><strong>operf</strong></span>
> --		with this option, your current working directory should be <code class="filename">/root</code> or a subdirectory
> --		of <code class="filename">/root</code> to avoid storing sample data files in locations accessible by regular users.
> -+		with this option, your current working directory should be <code class="filename">~root</code> or a subdirectory
> -+		of <code class="filename">~root</code> to avoid storing sample data files in locations accessible by regular users.
> - 		</p>
> -               </dd>
> -               <dt>
> -Index: oprofile-1.0.0/doc/oprofile.xml
> -===================================================================
> ---- oprofile-1.0.0.orig/doc/oprofile.xml	2014-11-03 17:55:31.515034857 +0000
> -+++ oprofile-1.0.0/doc/oprofile.xml	2014-11-03 17:58:03.719039005 +0000
> -@@ -654,8 +654,8 @@
> - 		<emphasis>must</emphasis> stop it in a controlled manner in order to process
> - 		the profile data it has collected.  Use <code>kill -SIGINT &lt;operf-PID&gt;</code>
> - 		for this purpose. It is recommended that when running <command>operf</command>
> --		with this option, your current working directory should be <filename>/root</filename> or a subdirectory
> --		of <filename>/root</filename> to avoid storing sample data files in locations accessible by regular users.
> -+		with this option, your current working directory should be <filename>~root</filename> or a subdirectory
> -+		of <filename>~root</filename> to avoid storing sample data files in locations accessible by regular users.
> - 		</para></listitem>
> - 	</varlistentry>
> - 	<varlistentry>
> diff --git a/meta/recipes-kernel/oprofile/oprofile/run-ptest b/meta/recipes-kernel/oprofile/oprofile/run-ptest
> deleted file mode 100644
> index 4814be652a7..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/run-ptest
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/sh
> -
> -saved_dir=$PWD
> -for dir in */tests ; do
> -	cd $dir
> -	for atest in * ; do
> -		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
> -			./$atest > ${atest}.stdout 2> ${atest}.stderr
> -			if [ $? = 0 ] ; then
> -				echo "PASS: $dir $atest"
> -				rm ${atest}.stdout ${atest}.stderr
> -			else
> -				echo "FAIL: ${dir}/${atest}"
> -			fi
> -		fi
> -	done
> -	cd $saved_dir
> -done
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> deleted file mode 100644
> index 92a94ad0d4d..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require oprofile.inc
> -
> -DEPENDS += "virtual/kernel"
> -DEPENDS_append_powerpc64 = " libpfm4"
> -
> -SRC_URI[md5sum] = "248c4c069f9476f427fa7195563f9867"
> -SRC_URI[sha256sum] = "cf759a6de1a6033d5dfc93bda129a9f2e128aecc4238cc657feb0801d1b0366c"
> -
> -S = "${WORKDIR}/oprofile-${PV}"
> -
> -- 
> 2.14.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

