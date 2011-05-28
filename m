Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QQBS7-00014v-5Z
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 06:49:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 May 2011 21:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,284,1304319600"; d="log'?scan'208";a="3250117"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.142])
	([10.238.154.142])
	by azsmga001.ch.intel.com with ESMTP; 27 May 2011 21:45:24 -0700
Message-ID: <4DE07DE3.1090303@intel.com>
Date: Sat, 28 May 2011 12:45:23 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306530446.git.sgw@linux.intel.com>	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>	<1306531463.3120.124.camel@lenovo.internal.reciva.com>
	<1306534987.27470.307.camel@rex>
In-Reply-To: <1306534987.27470.307.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Sat, 28 May 2011 04:49:34 -0000
X-Groupsio-MsgNum: 3255
Content-Type: multipart/mixed; boundary="------------020305060100000500050709"

--------------020305060100000500050709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-5-28 6:23, Richard Purdie wrote:
> On Fri, 2011-05-27 at 22:24 +0100, Phil Blundell wrote:
>> On Fri, 2011-05-27 at 14:09 -0700, Saul Wold wrote:
>>> From: Yu Ke<ke.yu@intel.com>
>>>
>>> [YOCTO #737]
>>>
>>> The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
>>> macro seems not work well in ppc arch, so this patch force the DLOPEN_LIBS="-ldl"
>>>
>>
>> That's a bit of a weird report.  Do we know why it doesn't work?  I
>> guess we don't care all that much about Solaris targets, but equally I
>> can't think of any reason why ppc should be special.
>
> Seconded. I'd like to see the config.log of that failing on ppc...
>
> Cheers,
>
> Richard
>

The marco in question is in xorg-server-1.10.1/configure.ac
"
AC_CHECK_FUNC([dlopen], [],
     AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
AC_SUBST(DLOPEN_LIBS)
"

Ideally, the dlopen test should fail since dlopen is not available in 
libc, and then DLOPEN_LIBS="-ldl" is executed. In this case, the later 
build will correctly link libdl. qemux86 fall into this case.

But in ppc case, the dlopen test unfortunately pass, and DLOPEN_LIBS 
become "", which caused later linker error of unresolved dlopen 
reference. but I did not yet understand why ppc is so special.

For detail, I've attached two config.log, one for ppc, one for qemux86.
in ppc,
configure:15235: checking for dlopen
configure:15235: result: yes

in qemux86:
configure:15235: checking for dlopen
configure:15235: i586-poky-linux-gcc -march=i586 
--sysroot=/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=gnu99 -o 
conftest -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 
-Wl,--as-needed conftest.c  >&5
/tmp/ccaQGSPX.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xorg-server-1.10.1/conftest.c:74: 
undefined reference to `dlopen'
collect2: ld returned 1 exit status
configure:15235: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT 
"https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| /* Define dlopen to an innocuous variant, in case <limits.h> declares 
dlopen.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define dlopen innocuous_dlopen
|
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char dlopen (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|
| #undef dlopen
|
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char dlopen ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_dlopen || defined __stub___dlopen
| choke me
| #endif
|
| int
| main ()
| {
| return dlopen ();
|   ;
|   return 0;
| }
configure:15235: result: no
configure:15239: checking for dlopen in -ldl
configure:15264: i586-poky-linux-gcc -march=i586 
--sysroot=/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=gnu99 -o 
conftest -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 
-Wl,--as-needed conftest.c -ldl   >&5
configure:15264: $? = 0
configure:15273: result: yes

--------------020305060100000500050709
Content-Type: text/plain;
 name="xserver-ppc-config.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="xserver-ppc-config.log"

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by xorg-server configure 1.10.1, which was
generated by GNU Autoconf 2.65.  Invocation command line was

  $ /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.=
1-r0/xorg-server-1.10.1/configure --build=3Dx86_64-linux --host=3Dpowerpc-p=
oky-linux --target=3Dpowerpc-poky-linux --prefix=3D/usr --exec_prefix=3D/us=
r --bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/libexec --d=
atadir=3D/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com --localstat=
edir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/include --oldincludedir=
=3D/usr/include --infodir=3D/usr/share/info --mandir=3D/usr/share/man --dis=
able-silent-rules --with-libtool-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots=
/qemuppc --with-fop=3Dno --disable-static --disable-acfb --disable-ccfb --d=
isable-mcfb --disable-dga --disable-xinerama --disable-xf86misc --disable-x=
orgcfg --disable-record --disable-dmx --disable-xnest --disable-xvfb --enab=
le-composite --disable-dri --disable-glx --sysconfdir=3D/etc/X11 --localsta=
tedir=3D/var --with-fontdir=3D/usr/share/fonts/X11 --with-xkb-output=3D/var=
/lib/xkb ac_cv_file__usr_share_sgml_X11_defs_ent=3Dno

## --------- ##
## Platform. ##
## --------- ##

hostname =3D kyu3-ubuntu
uname -m =3D x86_64
uname -r =3D 2.6.35-25-server
uname -s =3D Linux
uname -v =3D #44~lucid1-Ubuntu SMP Tue Jan 25 19:34:09 UTC 2011

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/ppc603e-poky-li=
nux
PATH: /home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/bin/crossscripts
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/sbin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/sbin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux//bin
PATH: /home/kyu3/src/poky/scripts
PATH: /home/kyu3/src/poky/bitbake/bin/
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games
PATH: /home/kyu3/bin
PATH: /home/kyu3/src/poky/scripts


## ----------- ##
## Core tests. ##
## ----------- ##

configure:3349: loading site script /home/kyu3/src/poky/meta/site/endian-bi=
g
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dno}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dyes}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dbig}
configure:3349: loading site script /home/kyu3/src/poky/meta/site/common-gl=
ibc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| ac_cv_check_sjlj=3Dssjlj
|=20
| # m4
| gt_cv_locale_fr=3D${gt_cv_locale_fr=3Dfr_FR}
| gl_cv_func_btowc_eof=3D${gl_cv_func_btowc_eof=3Dyes}
| gl_cv_func_wcrtomb_retval=3D${gl_cv_func_wcrtomb_retval=3Dyes}
| gl_cv_func_wctob_works=3D${gl_cv_func_wctob_works=3Dyes}
| gl_cv_func_mbrtowc_incomplete_state=3D${gl_cv_func_mbrtowc_incomplete_sta=
te=3Dyes}
| gl_cv_func_mbrtowc_sanitycheck=3D${gl_cv_func_mbrtowc_sanitycheck=3Dyes}
| gl_cv_func_mbrtowc_null_arg=3D${gl_cv_func_mbrtowc_null_arg=3Dyes}
| gl_cv_func_mbrtowc_retval=3D${gl_cv_func_mbrtowc_retval=3Dyes}
| gl_cv_func_mbrtowc_nul_retval=3D${gl_cv_func_mbrtowc_nul_retval=3Dyes}
|=20
configure:3349: loading site script /home/kyu3/src/poky/meta/site/powerpc-c=
ommon
| ac_cv_func_getpgrp_void=3Dyes
| ac_cv_func_setpgrp_void=3Dyes
| ac_cv_func_setgrent_void=3Dyes
| ac_cv_func_malloc_0_nonnull=3Dyes
| ac_cv_func_malloc_works=3Dyes
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_setvbuf_reversed=3Dno
| ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
| ac_cv_sizeof_bool=3D${ac_cv_sizeof_bool=3D1}
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_wchar_t=3D${ac_cv_sizeof_wchar_t=3D4}
| ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_type___int64=3D${ac_cv_type___int64=3Dno}
| ac_cv_type_size_t=3D${ac_cv_type_size_t=3Dyes}
| ac_cv_type_void_p=3D${ac_cv_type_void_p=3Dyes}
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
| ac_cv_time_r_type=3D${ac_cv_time_r_type=3DPOSIX}
| cookie_io_functions_use_off64_t=3D${cookie_io_functions_use_off64_t=3Dyes=
}
|=20
|=20
| # apache
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # coreutils
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1019}
|=20
| # libpcap
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
|=20
| # nano
| ac_cv_regexec_segfault_emptystr=3D${ac_cv_regexec_segfault_emptystr=3Dno}
| nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_emptystr=
=3Dno}
|=20
|=20
| # libnet
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| # socat
| ac_cv_ispeed_offset=3D${ac_cv_ispeed_offset=3D13}
| sc_cv_termios_ispeed=3D${sc_cv_termios_ispeed=3Dyes}
|=20
| # links
| ac_cv_lib_png_png_create_info_struct=3D${ac_cv_lib_png_png_create_info_st=
ruct=3Dyes}
|=20
| # sleepycat db
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_mutex=3D${db_cv_mutex=3Dno}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dno}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # libesmtp
| acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| # glib 2.0
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
| glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
| glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_s=
urrogate=3Dyes}
|=20
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
|=20
| # httppc
| ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # edb
| db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
|=20
| # fget
| compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
| compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
| compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
| ac_cv_func_realloc_works=3D${ac_cv_func_realloc_works=3Dyes}
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
|=20
| # openssh
| ac_cv_have_broken_dirname=3D${ac_cv_have_broken_dirname=3D'yes'}
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3D'no'}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3D'no'}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3D'yes'}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3D'no'}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3D'yes'}
|=20
| # vim
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D'4'}
|=20
| #modphp=20
| ac_cv_c_bigendian_php=3D${ac_cv_c_bigendian_php=3Dyes}
| ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
| ac_cv_func_dlopen=3D${ac_cv_func_dlopen=3Dyes}
| lt_cv_dlopen_self=3D${lt_cv_dlopen_self=3Dyes}
|=20
| # apache2 (note other apache stanza in this file)
| ap_void_ptr_lt_long=3D${ap_void_ptr_lt_long=3Dno}
| apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}
| apr_cv_epoll=3D${apr_cv_epoll=3Dyes}
| apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
| apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}
| apr_cv_mutex_recursive=3D${apr_cv_mutex_recursive=3Dyes}
| ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
| ac_cv_sizeof_pid_t=3D${ac_cv_sizeof_pid_t=3D4}
| ac_cv_socklen_t=3D${ac_cv_socklen_t=3Dyes}
| ac_cv_struct_rlimit=3D${ac_cv_struct_rlimit=3Dyes}
| ac_cv_negative_eai=3D${ac_cv_negative_eai=3Dyes}
| apr_cv_gai_addrconfig=3D${apr_cv_gai_addrconfig=3Dno}
| ac_cv_o_nonblock_inherited=3D${ac_cv_o_nonblock_inherited=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| # binutils (libiberty)
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_type_int=3D${ac_cv_type_int=3Dyes}
| ac_cv_type_uintptr_t=3D${ac_cv_type_uintptr_t=3Dyes}
| liberty_cv_uint64=3D${liberty_cv_uint64=3Duint64_t}
|=20
| #samba
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| fu_cv_sys_stat_statvfs64=3D${fu_cv_sys_stat_statvfs64=3Dyes}
| samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=
=3Dno}
| samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dno}
| samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dyes}
| samba_cv_HAVE_BROKEN_READDIR_NAME=3D${samba_cv_HAVE_BROKEN_READDIR_NAME=
=3Dno}
| samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
| samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
| samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
| samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
| samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
| samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes}
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
| samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=
=3Dyes}
| samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=
=3Dyes}
| samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=3Dy=
es}
| samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
| samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
| samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
| samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
| samba_cv_HAVE_SENDFILE=3D${samba_cv_HAVE_SENDFILE=3Dyes}
| samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
| samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
| samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dyes}
| samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dyes}
| samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
| samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dyes}
| samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
| samba_cv_REPLACE_READDIR=3D${samba_cv_REPLACE_READDIR=3Dno}
| samba_cv_SIZEOF_DEV_T=3D${samba_cv_SIZEOF_DEV_T=3Dyes}
| samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
| samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
| samba_cv_STAT_STATVFS64=3D${samba_cv_STAT_STATVFS64=3Dyes}
| samba_cv_USE_SETEUID=3D${samba_cv_USE_SETEUID=3Dyes}
| samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
| samba_cv_USE_SETREUID=3D${samba_cv_USE_SETREUID=3Dyes}
| samba_cv_USE_SETUIDX=3D${samba_cv_USE_SETUIDX=3Dyes}
| samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
| samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
| samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
|=20
| #monotone
| ac_cv_sync_with_stdio=3D${ac_cv_sync_with_stdio=3Dyes}=20
| ac_cv_sync_with_stdio_2=3D${ac_cv_sync_with_stdio_2=3Dyes}
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dno}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dno}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # dpkg
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
configure:3349: loading site script /home/kyu3/src/poky/meta/site/powerpc-l=
inux
| # libc
| libc_cv_ppc_machine=3D${libc_cv_ppc_machine=3Dyes}
| libc_cv_mlong_double_128ibm=3D${libc_cv_mlong_double_128ibm=3Dyes}
| libc_cv_mabi_ibmlongdouble=3D${libc_cv_mabi_ibmlongdouble=3Dyes}
| libc_cv_mlong_double_128=3D${libc_cv_mlong_double_128=3Dyes}
|=20
| # popt
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
configure:3349: loading site script /home/kyu3/src/poky/meta/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # Avoid sudo to assume void for unsetenv in cross environment, or else it=
 conflicts with
| # target stdlib.h prototype which follows POSIX compiliance. Mark for ups=
tream.
| sudo_cv_func_unsetenv_void=3Dno
|=20
| # shadow dir info, to avoid searching build system
| shadow_cv_maildir=3D${localstatedir}/spool/mail
| shadow_cv_mailfile=3DMailbox
| shadow_cv_utmpdir=3D${localstatedir}/run
| shadow_cv_logdir=3D${localstatedir}/log
| shadow_cv_passwd_dir=3D${bindir}
|=20
configure:3349: loading site script /home/kyu3/sdb/test/tmp/sysroots/qemupp=
c/usr/share/powerpc-poky-linux_config_site.d/zlib_config
| ac_cv_header_inttypes_h=3D${ac_cv_header_inttypes_h=3Dyes}
| ac_cv_header_memory_h=3D${ac_cv_header_memory_h=3Dyes}
| ac_cv_header_stdc=3D${ac_cv_header_stdc=3Dyes}
| ac_cv_header_stdint_h=3D${ac_cv_header_stdint_h=3Dyes}
| ac_cv_header_stdlib_h=3D${ac_cv_header_stdlib_h=3Dyes}
| ac_cv_header_string_h=3D${ac_cv_header_string_h=3Dyes}
| ac_cv_header_strings_h=3D${ac_cv_header_strings_h=3Dyes}
| ac_cv_header_sys_stat_h=3D${ac_cv_header_sys_stat_h=3Dyes}
| ac_cv_header_sys_types_h=3D${ac_cv_header_sys_types_h=3Dyes}
| ac_cv_header_unistd_h=3D${ac_cv_header_unistd_h=3Dyes}
| ac_cv_header_zlib_h=3D${ac_cv_header_zlib_h=3Dyes}
configure:3349: loading site script /home/kyu3/sdb/test/tmp/sysroots/qemupp=
c/usr/share/powerpc-poky-linux_config_site.d/eglibc_config
| ac_cv_func___adjtimex=3D${ac_cv_func___adjtimex=3Dyes}
| ac_cv_func___argz_count=3D${ac_cv_func___argz_count=3Dyes}
| ac_cv_func___argz_next=3D${ac_cv_func___argz_next=3Dyes}
| ac_cv_func___argz_stringify=3D${ac_cv_func___argz_stringify=3Dyes}
| ac_cv_func___fpending=3D${ac_cv_func___fpending=3Dyes}
| ac_cv_func___fsetlocking=3D${ac_cv_func___fsetlocking=3Dyes}
| ac_cv_func___progname=3D${ac_cv_func___progname=3Dyes}
| ac_cv_func___secure_getenv=3D${ac_cv_func___secure_getenv=3Dyes}
| ac_cv_func__obstack_free=3D${ac_cv_func__obstack_free=3Dyes}
| ac_cv_func__setjmp=3D${ac_cv_func__setjmp=3Dyes}
| ac_cv_func__sys_siglist=3D${ac_cv_func__sys_siglist=3Dyes}
| ac_cv_func_a64l=3D${ac_cv_func_a64l=3Dyes}
| ac_cv_func_abs=3D${ac_cv_func_abs=3Dyes}
| ac_cv_func_access=3D${ac_cv_func_access=3Dyes}
| ac_cv_func_alarm=3D${ac_cv_func_alarm=3Dyes}
| ac_cv_func_alphasort=3D${ac_cv_func_alphasort=3Dyes}
| ac_cv_func_argz_append=3D${ac_cv_func_argz_append=3Dyes}
| ac_cv_func_argz_create_sep=3D${ac_cv_func_argz_create_sep=3Dyes}
| ac_cv_func_argz_insert=3D${ac_cv_func_argz_insert=3Dyes}
| ac_cv_func_argz_next=3D${ac_cv_func_argz_next=3Dyes}
| ac_cv_func_argz_stringify=3D${ac_cv_func_argz_stringify=3Dyes}
| ac_cv_func_asprintf=3D${ac_cv_func_asprintf=3Dyes}
| ac_cv_func_atexit=3D${ac_cv_func_atexit=3Dyes}
| ac_cv_func_atof=3D${ac_cv_func_atof=3Dyes}
| ac_cv_func_atoi=3D${ac_cv_func_atoi=3Dyes}
| ac_cv_func_bcmp=3D${ac_cv_func_bcmp=3Dyes}
| ac_cv_func_bcopy=3D${ac_cv_func_bcopy=3Dyes}
| ac_cv_func_bind_textdomain_codeset=3D${ac_cv_func_bind_textdomain_codeset=
=3Dyes}
| ac_cv_func_bindresvport=3D${ac_cv_func_bindresvport=3Dyes}
| ac_cv_func_btowc=3D${ac_cv_func_btowc=3Dyes}
| ac_cv_func_bzero=3D${ac_cv_func_bzero=3Dyes}
| ac_cv_func_calloc=3D${ac_cv_func_calloc=3Dyes}
| ac_cv_func_canonicalize_file_name=3D${ac_cv_func_canonicalize_file_name=
=3Dyes}
| ac_cv_func_catgets=3D${ac_cv_func_catgets=3Dyes}
| ac_cv_func_cfgetospeed=3D${ac_cv_func_cfgetospeed=3Dyes}
| ac_cv_func_cfsetispeed=3D${ac_cv_func_cfsetispeed=3Dyes}
| ac_cv_func_cfsetspeed=3D${ac_cv_func_cfsetspeed=3Dyes}
| ac_cv_func_chmod=3D${ac_cv_func_chmod=3Dyes}
| ac_cv_func_chown=3D${ac_cv_func_chown=3Dyes}
| ac_cv_func_chroot=3D${ac_cv_func_chroot=3Dyes}
| ac_cv_func_clock=3D${ac_cv_func_clock=3Dyes}
| ac_cv_func_close=3D${ac_cv_func_close=3Dyes}
| ac_cv_func_closedir=3D${ac_cv_func_closedir=3Dyes}
| ac_cv_func_closelog=3D${ac_cv_func_closelog=3Dyes}
| ac_cv_func_confstr=3D${ac_cv_func_confstr=3Dyes}
| ac_cv_func_connect=3D${ac_cv_func_connect=3Dyes}
| ac_cv_func_daemon=3D${ac_cv_func_daemon=3Dyes}
| ac_cv_func_dcgettext=3D${ac_cv_func_dcgettext=3Dyes}
| ac_cv_func_difftime=3D${ac_cv_func_difftime=3Dyes}
| ac_cv_func_dirfd=3D${ac_cv_func_dirfd=3Dyes}
| ac_cv_func_dirname=3D${ac_cv_func_dirname=3Dyes}
| ac_cv_func_dngettext=3D${ac_cv_func_dngettext=3Dyes}
| ac_cv_func_dup2=3D${ac_cv_func_dup2=3Dyes}
| ac_cv_func_ecvt=3D${ac_cv_func_ecvt=3Dyes}
| ac_cv_func_endgrent=3D${ac_cv_func_endgrent=3Dyes}
| ac_cv_func_endmntent=3D${ac_cv_func_endmntent=3Dyes}
| ac_cv_func_endpwent=3D${ac_cv_func_endpwent=3Dyes}
| ac_cv_func_endutent=3D${ac_cv_func_endutent=3Dyes}
| ac_cv_func_endutxent=3D${ac_cv_func_endutxent=3Dyes}
| ac_cv_func_epoll_ctl=3D${ac_cv_func_epoll_ctl=3Dyes}
| ac_cv_func_err=3D${ac_cv_func_err=3Dyes}
| ac_cv_func_ether_hostton=3D${ac_cv_func_ether_hostton=3Dyes}
| ac_cv_func_ether_ntohost=3D${ac_cv_func_ether_ntohost=3Dyes}
| ac_cv_func_euidaccess=3D${ac_cv_func_euidaccess=3Dyes}
| ac_cv_func_execv=3D${ac_cv_func_execv=3Dyes}
| ac_cv_func_fchdir=3D${ac_cv_func_fchdir=3Dyes}
| ac_cv_func_fchmod=3D${ac_cv_func_fchmod=3Dyes}
| ac_cv_func_fchmodat=3D${ac_cv_func_fchmodat=3Dyes}
| ac_cv_func_fchown=3D${ac_cv_func_fchown=3Dyes}
| ac_cv_func_fchownat=3D${ac_cv_func_fchownat=3Dyes}
| ac_cv_func_fcntl=3D${ac_cv_func_fcntl=3Dyes}
| ac_cv_func_fcvt=3D${ac_cv_func_fcvt=3Dyes}
| ac_cv_func_fdatasync=3D${ac_cv_func_fdatasync=3Dyes}
| ac_cv_func_fdopendir=3D${ac_cv_func_fdopendir=3Dyes}
| ac_cv_func_feof_unlocked=3D${ac_cv_func_feof_unlocked=3Dyes}
| ac_cv_func_fgets_unlocked=3D${ac_cv_func_fgets_unlocked=3Dyes}
| ac_cv_func_fgetxattr=3D${ac_cv_func_fgetxattr=3Dyes}
| ac_cv_func_finite=3D${ac_cv_func_finite=3Dyes}
| ac_cv_func_flistxattr=3D${ac_cv_func_flistxattr=3Dyes}
| ac_cv_func_flock=3D${ac_cv_func_flock=3Dyes}
| ac_cv_func_flockfile=3D${ac_cv_func_flockfile=3Dyes}
| ac_cv_func_fnmatch=3D${ac_cv_func_fnmatch=3Dyes}
| ac_cv_func_fork=3D${ac_cv_func_fork=3Dyes}
| ac_cv_func_fpathconf=3D${ac_cv_func_fpathconf=3Dyes}
| ac_cv_func_fprintf=3D${ac_cv_func_fprintf=3Dyes}
| ac_cv_func_free=3D${ac_cv_func_free=3Dyes}
| ac_cv_func_freeaddrinfo=3D${ac_cv_func_freeaddrinfo=3Dyes}
| ac_cv_func_freeifaddrs=3D${ac_cv_func_freeifaddrs=3Dyes}
| ac_cv_func_fseeko=3D${ac_cv_func_fseeko=3Dyes}
| ac_cv_func_fsetxattr=3D${ac_cv_func_fsetxattr=3Dyes}
| ac_cv_func_fstat64=3D${ac_cv_func_fstat64=3Dyes}
| ac_cv_func_fstat=3D${ac_cv_func_fstat=3Dyes}
| ac_cv_func_fstatfs=3D${ac_cv_func_fstatfs=3Dyes}
| ac_cv_func_fsync=3D${ac_cv_func_fsync=3Dyes}
| ac_cv_func_ftello=3D${ac_cv_func_ftello=3Dyes}
| ac_cv_func_ftime=3D${ac_cv_func_ftime=3Dyes}
| ac_cv_func_ftruncate=3D${ac_cv_func_ftruncate=3Dyes}
| ac_cv_func_funlockfile=3D${ac_cv_func_funlockfile=3Dyes}
| ac_cv_func_futimes=3D${ac_cv_func_futimes=3Dyes}
| ac_cv_func_futimesat=3D${ac_cv_func_futimesat=3Dyes}
| ac_cv_func_gai_strerror=3D${ac_cv_func_gai_strerror=3Dyes}
| ac_cv_func_gcvt=3D${ac_cv_func_gcvt=3Dyes}
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
| ac_cv_func_getc_unlocked=3D${ac_cv_func_getc_unlocked=3Dyes}
| ac_cv_func_getcwd=3D${ac_cv_func_getcwd=3Dyes}
| ac_cv_func_getdelim=3D${ac_cv_func_getdelim=3Dyes}
| ac_cv_func_getdomainname=3D${ac_cv_func_getdomainname=3Dyes}
| ac_cv_func_getdtablesize=3D${ac_cv_func_getdtablesize=3Dyes}
| ac_cv_func_getegid=3D${ac_cv_func_getegid=3Dyes}
| ac_cv_func_getenv=3D${ac_cv_func_getenv=3Dyes}
| ac_cv_func_geteuid=3D${ac_cv_func_geteuid=3Dyes}
| ac_cv_func_getgid=3D${ac_cv_func_getgid=3Dyes}
| ac_cv_func_getgrent=3D${ac_cv_func_getgrent=3Dyes}
| ac_cv_func_getgrent_r=3D${ac_cv_func_getgrent_r=3Dyes}
| ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
| ac_cv_func_getgrnam=3D${ac_cv_func_getgrnam=3Dyes}
| ac_cv_func_getgrnam_r=3D${ac_cv_func_getgrnam_r=3Dyes}
| ac_cv_func_getgrouplist=3D${ac_cv_func_getgrouplist=3Dyes}
| ac_cv_func_getgroups=3D${ac_cv_func_getgroups=3Dyes}
| ac_cv_func_gethostbyaddr_r=3D${ac_cv_func_gethostbyaddr_r=3Dyes}
| ac_cv_func_gethostbyname2=3D${ac_cv_func_gethostbyname2=3Dyes}
| ac_cv_func_gethostbyname=3D${ac_cv_func_gethostbyname=3Dyes}
| ac_cv_func_gethostbyname_r=3D${ac_cv_func_gethostbyname_r=3Dyes}
| ac_cv_func_gethostent=3D${ac_cv_func_gethostent=3Dyes}
| ac_cv_func_gethostid=3D${ac_cv_func_gethostid=3Dyes}
| ac_cv_func_gethostname=3D${ac_cv_func_gethostname=3Dyes}
| ac_cv_func_getifaddrs=3D${ac_cv_func_getifaddrs=3Dyes}
| ac_cv_func_getline=3D${ac_cv_func_getline=3Dyes}
| ac_cv_func_getloadavg=3D${ac_cv_func_getloadavg=3Dyes}
| ac_cv_func_getmntent=3D${ac_cv_func_getmntent=3Dyes}
| ac_cv_func_getmsg=3D${ac_cv_func_getmsg=3Dyes}
| ac_cv_func_getnameinfo=3D${ac_cv_func_getnameinfo=3Dyes}
| ac_cv_func_getnetbyaddr_r=3D${ac_cv_func_getnetbyaddr_r=3Dyes}
| ac_cv_func_getnetgrent_r=3D${ac_cv_func_getnetgrent_r=3Dyes}
| ac_cv_func_getopt=3D${ac_cv_func_getopt=3Dyes}
| ac_cv_func_getopt_long=3D${ac_cv_func_getopt_long=3Dyes}
| ac_cv_func_getopt_long_only=3D${ac_cv_func_getopt_long_only=3Dyes}
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_getpass=3D${ac_cv_func_getpass=3Dyes}
| ac_cv_func_getpeername=3D${ac_cv_func_getpeername=3Dyes}
| ac_cv_func_getpgrp=3D${ac_cv_func_getpgrp=3Dyes}
| ac_cv_func_getpid=3D${ac_cv_func_getpid=3Dyes}
| ac_cv_func_getppid=3D${ac_cv_func_getppid=3Dyes}
| ac_cv_func_getprotoent_r=3D${ac_cv_func_getprotoent_r=3Dyes}
| ac_cv_func_getpwent=3D${ac_cv_func_getpwent=3Dyes}
| ac_cv_func_getpwent_r=3D${ac_cv_func_getpwent_r=3Dyes}
| ac_cv_func_getpwnam=3D${ac_cv_func_getpwnam=3Dyes}
| ac_cv_func_getpwnam_r=3D${ac_cv_func_getpwnam_r=3Dyes}
| ac_cv_func_getpwuid=3D${ac_cv_func_getpwuid=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_getresuid=3D${ac_cv_func_getresuid=3Dyes}
| ac_cv_func_getrlimit=3D${ac_cv_func_getrlimit=3Dyes}
| ac_cv_func_getrusage=3D${ac_cv_func_getrusage=3Dyes}
| ac_cv_func_getservbyname=3D${ac_cv_func_getservbyname=3Dyes}
| ac_cv_func_getservbyname_r=3D${ac_cv_func_getservbyname_r=3Dyes}
| ac_cv_func_getservbyport_r=3D${ac_cv_func_getservbyport_r=3Dyes}
| ac_cv_func_getservent=3D${ac_cv_func_getservent=3Dyes}
| ac_cv_func_getservent_r=3D${ac_cv_func_getservent_r=3Dyes}
| ac_cv_func_getspnam=3D${ac_cv_func_getspnam=3Dyes}
| ac_cv_func_getspnam_r=3D${ac_cv_func_getspnam_r=3Dyes}
| ac_cv_func_gettimeofday=3D${ac_cv_func_gettimeofday=3Dyes}
| ac_cv_func_getttyent=3D${ac_cv_func_getttyent=3Dyes}
| ac_cv_func_getttynam=3D${ac_cv_func_getttynam=3Dyes}
| ac_cv_func_getuid=3D${ac_cv_func_getuid=3Dyes}
| ac_cv_func_getusershell=3D${ac_cv_func_getusershell=3Dyes}
| ac_cv_func_getutent=3D${ac_cv_func_getutent=3Dyes}
| ac_cv_func_getutid=3D${ac_cv_func_getutid=3Dyes}
| ac_cv_func_getutline=3D${ac_cv_func_getutline=3Dyes}
| ac_cv_func_getutmp=3D${ac_cv_func_getutmp=3Dyes}
| ac_cv_func_getutmpx=3D${ac_cv_func_getutmpx=3Dyes}
| ac_cv_func_getutxent=3D${ac_cv_func_getutxent=3Dyes}
| ac_cv_func_getutxid=3D${ac_cv_func_getutxid=3Dyes}
| ac_cv_func_getutxline=3D${ac_cv_func_getutxline=3Dyes}
| ac_cv_func_getwd=3D${ac_cv_func_getwd=3Dyes}
| ac_cv_func_getxattr=3D${ac_cv_func_getxattr=3Dyes}
| ac_cv_func_glob=3D${ac_cv_func_glob=3Dyes}
| ac_cv_func_gmtime=3D${ac_cv_func_gmtime=3Dyes}
| ac_cv_func_gmtime_r=3D${ac_cv_func_gmtime_r=3Dyes}
| ac_cv_func_grantpt=3D${ac_cv_func_grantpt=3Dyes}
| ac_cv_func_group_member=3D${ac_cv_func_group_member=3Dyes}
| ac_cv_func_herror=3D${ac_cv_func_herror=3Dyes}
| ac_cv_func_hstrerror=3D${ac_cv_func_hstrerror=3Dyes}
| ac_cv_func_iconv=3D${ac_cv_func_iconv=3Dyes}
| ac_cv_func_iconv_open=3D${ac_cv_func_iconv_open=3Dyes}
| ac_cv_func_if_freenameindex=3D${ac_cv_func_if_freenameindex=3Dyes}
| ac_cv_func_if_indextoname=3D${ac_cv_func_if_indextoname=3Dyes}
| ac_cv_func_if_nameindex=3D${ac_cv_func_if_nameindex=3Dyes}
| ac_cv_func_if_nametoindex=3D${ac_cv_func_if_nametoindex=3Dyes}
| ac_cv_func_index=3D${ac_cv_func_index=3Dyes}
| ac_cv_func_inet_addr=3D${ac_cv_func_inet_addr=3Dyes}
| ac_cv_func_inet_aton=3D${ac_cv_func_inet_aton=3Dyes}
| ac_cv_func_inet_ntoa=3D${ac_cv_func_inet_ntoa=3Dyes}
| ac_cv_func_inet_ntop=3D${ac_cv_func_inet_ntop=3Dyes}
| ac_cv_func_inet_pton=3D${ac_cv_func_inet_pton=3Dyes}
| ac_cv_func_initgroups=3D${ac_cv_func_initgroups=3Dyes}
| ac_cv_func_innetgr=3D${ac_cv_func_innetgr=3Dyes}
| ac_cv_func_iruserok=3D${ac_cv_func_iruserok=3Dyes}
| ac_cv_func_isascii=3D${ac_cv_func_isascii=3Dyes}
| ac_cv_func_isatty=3D${ac_cv_func_isatty=3Dyes}
| ac_cv_func_isblank=3D${ac_cv_func_isblank=3Dyes}
| ac_cv_func_isgraph=3D${ac_cv_func_isgraph=3Dyes}
| ac_cv_func_isinf=3D${ac_cv_func_isinf=3Dyes}
| ac_cv_func_isnan=3D${ac_cv_func_isnan=3Dyes}
| ac_cv_func_isprint=3D${ac_cv_func_isprint=3Dyes}
| ac_cv_func_isspace=3D${ac_cv_func_isspace=3Dyes}
| ac_cv_func_iswalnum=3D${ac_cv_func_iswalnum=3Dyes}
| ac_cv_func_iswcntrl=3D${ac_cv_func_iswcntrl=3Dyes}
| ac_cv_func_iswctype=3D${ac_cv_func_iswctype=3Dyes}
| ac_cv_func_iswprint=3D${ac_cv_func_iswprint=3Dyes}
| ac_cv_func_iswspace=3D${ac_cv_func_iswspace=3Dyes}
| ac_cv_func_iswupper=3D${ac_cv_func_iswupper=3Dyes}
| ac_cv_func_isxdigit=3D${ac_cv_func_isxdigit=3Dyes}
| ac_cv_func_kill=3D${ac_cv_func_kill=3Dyes}
| ac_cv_func_killpg=3D${ac_cv_func_killpg=3Dyes}
| ac_cv_func_lchown=3D${ac_cv_func_lchown=3Dyes}
| ac_cv_func_lckpwdf=3D${ac_cv_func_lckpwdf=3Dyes}
| ac_cv_func_lgetxattr=3D${ac_cv_func_lgetxattr=3Dyes}
| ac_cv_func_link=3D${ac_cv_func_link=3Dyes}
| ac_cv_func_listxattr=3D${ac_cv_func_listxattr=3Dyes}
| ac_cv_func_llistxattr=3D${ac_cv_func_llistxattr=3Dyes}
| ac_cv_func_localtime=3D${ac_cv_func_localtime=3Dyes}
| ac_cv_func_localtime_r=3D${ac_cv_func_localtime_r=3Dyes}
| ac_cv_func_lockf=3D${ac_cv_func_lockf=3Dyes}
| ac_cv_func_lrand48=3D${ac_cv_func_lrand48=3Dyes}
| ac_cv_func_lsearch=3D${ac_cv_func_lsearch=3Dyes}
| ac_cv_func_lseek64=3D${ac_cv_func_lseek64=3Dyes}
| ac_cv_func_lsetxattr=3D${ac_cv_func_lsetxattr=3Dyes}
| ac_cv_func_lstat=3D${ac_cv_func_lstat=3Dyes}
| ac_cv_func_mallinfo=3D${ac_cv_func_mallinfo=3Dyes}
| ac_cv_func_malloc=3D${ac_cv_func_malloc=3Dyes}
| ac_cv_func_mblen=3D${ac_cv_func_mblen=3Dyes}
| ac_cv_func_mbrlen=3D${ac_cv_func_mbrlen=3Dyes}
| ac_cv_func_mbrtowc=3D${ac_cv_func_mbrtowc=3Dyes}
| ac_cv_func_mbsinit=3D${ac_cv_func_mbsinit=3Dyes}
| ac_cv_func_mbsrtowcs=3D${ac_cv_func_mbsrtowcs=3Dyes}
| ac_cv_func_mbtowc=3D${ac_cv_func_mbtowc=3Dyes}
| ac_cv_func_memalign=3D${ac_cv_func_memalign=3Dyes}
| ac_cv_func_memchr=3D${ac_cv_func_memchr=3Dyes}
| ac_cv_func_memcmp=3D${ac_cv_func_memcmp=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_memmove=3D${ac_cv_func_memmove=3Dyes}
| ac_cv_func_mempcpy=3D${ac_cv_func_mempcpy=3Dyes}
| ac_cv_func_memrchr=3D${ac_cv_func_memrchr=3Dyes}
| ac_cv_func_memset=3D${ac_cv_func_memset=3Dyes}
| ac_cv_func_mkdir=3D${ac_cv_func_mkdir=3Dyes}
| ac_cv_func_mkdirat=3D${ac_cv_func_mkdirat=3Dyes}
| ac_cv_func_mkdtemp=3D${ac_cv_func_mkdtemp=3Dyes}
| ac_cv_func_mkfifo=3D${ac_cv_func_mkfifo=3Dyes}
| ac_cv_func_mknod=3D${ac_cv_func_mknod=3Dyes}
| ac_cv_func_mkstemp64=3D${ac_cv_func_mkstemp64=3Dyes}
| ac_cv_func_mkstemp=3D${ac_cv_func_mkstemp=3Dyes}
| ac_cv_func_mktime=3D${ac_cv_func_mktime=3Dyes}
| ac_cv_func_mlock=3D${ac_cv_func_mlock=3Dyes}
| ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
| ac_cv_func_mtrace=3D${ac_cv_func_mtrace=3Dyes}
| ac_cv_func_munlock=3D${ac_cv_func_munlock=3Dyes}
| ac_cv_func_munmap=3D${ac_cv_func_munmap=3Dyes}
| ac_cv_func_nanosleep=3D${ac_cv_func_nanosleep=3Dyes}
| ac_cv_func_nice=3D${ac_cv_func_nice=3Dyes}
| ac_cv_func_nl_langinfo=3D${ac_cv_func_nl_langinfo=3Dyes}
| ac_cv_func_ntp_adjtime=3D${ac_cv_func_ntp_adjtime=3Dyes}
| ac_cv_func_ntp_gettime=3D${ac_cv_func_ntp_gettime=3Dyes}
| ac_cv_func_on_exit=3D${ac_cv_func_on_exit=3Dyes}
| ac_cv_func_open64=3D${ac_cv_func_open64=3Dyes}
| ac_cv_func_open=3D${ac_cv_func_open=3Dyes}
| ac_cv_func_openat=3D${ac_cv_func_openat=3Dyes}
| ac_cv_func_opendir=3D${ac_cv_func_opendir=3Dyes}
| ac_cv_func_openlog=3D${ac_cv_func_openlog=3Dyes}
| ac_cv_func_pathconf=3D${ac_cv_func_pathconf=3Dyes}
| ac_cv_func_pipe=3D${ac_cv_func_pipe=3Dyes}
| ac_cv_func_poll=3D${ac_cv_func_poll=3Dyes}
| ac_cv_func_popen=3D${ac_cv_func_popen=3Dyes}
| ac_cv_func_posix_memalign=3D${ac_cv_func_posix_memalign=3Dyes}
| ac_cv_func_prctl=3D${ac_cv_func_prctl=3Dyes}
| ac_cv_func_pread=3D${ac_cv_func_pread=3Dyes}
| ac_cv_func_printf=3D${ac_cv_func_printf=3Dyes}
| ac_cv_func_pselect=3D${ac_cv_func_pselect=3Dyes}
| ac_cv_func_pthread_mutex_lock=3D${ac_cv_func_pthread_mutex_lock=3Dyes}
| ac_cv_func_ptsname=3D${ac_cv_func_ptsname=3Dyes}
| ac_cv_func_putenv=3D${ac_cv_func_putenv=3Dyes}
| ac_cv_func_putgrent=3D${ac_cv_func_putgrent=3Dyes}
| ac_cv_func_putpwent=3D${ac_cv_func_putpwent=3Dyes}
| ac_cv_func_putspent=3D${ac_cv_func_putspent=3Dyes}
| ac_cv_func_pututline=3D${ac_cv_func_pututline=3Dyes}
| ac_cv_func_pututxline=3D${ac_cv_func_pututxline=3Dyes}
| ac_cv_func_putwc=3D${ac_cv_func_putwc=3Dyes}
| ac_cv_func_pwrite=3D${ac_cv_func_pwrite=3Dyes}
| ac_cv_func_qsort=3D${ac_cv_func_qsort=3Dyes}
| ac_cv_func_raise=3D${ac_cv_func_raise=3Dyes}
| ac_cv_func_rand=3D${ac_cv_func_rand=3Dyes}
| ac_cv_func_rand_r=3D${ac_cv_func_rand_r=3Dyes}
| ac_cv_func_random=3D${ac_cv_func_random=3Dyes}
| ac_cv_func_re_comp=3D${ac_cv_func_re_comp=3Dyes}
| ac_cv_func_re_exec=3D${ac_cv_func_re_exec=3Dyes}
| ac_cv_func_re_search=3D${ac_cv_func_re_search=3Dyes}
| ac_cv_func_read=3D${ac_cv_func_read=3Dyes}
| ac_cv_func_readdir=3D${ac_cv_func_readdir=3Dyes}
| ac_cv_func_readdir_r=3D${ac_cv_func_readdir_r=3Dyes}
| ac_cv_func_readlink=3D${ac_cv_func_readlink=3Dyes}
| ac_cv_func_realloc=3D${ac_cv_func_realloc=3Dyes}
| ac_cv_func_realpath=3D${ac_cv_func_realpath=3Dyes}
| ac_cv_func_recvmsg=3D${ac_cv_func_recvmsg=3Dyes}
| ac_cv_func_regcomp=3D${ac_cv_func_regcomp=3Dyes}
| ac_cv_func_regexec=3D${ac_cv_func_regexec=3Dyes}
| ac_cv_func_remove=3D${ac_cv_func_remove=3Dyes}
| ac_cv_func_rename=3D${ac_cv_func_rename=3Dyes}
| ac_cv_func_rmdir=3D${ac_cv_func_rmdir=3Dyes}
| ac_cv_func_rpmatch=3D${ac_cv_func_rpmatch=3Dyes}
| ac_cv_func_rresvport_af=3D${ac_cv_func_rresvport_af=3Dyes}
| ac_cv_func_ruserok=3D${ac_cv_func_ruserok=3Dyes}
| ac_cv_func_ruserok_af=3D${ac_cv_func_ruserok_af=3Dyes}
| ac_cv_func_sbrk=3D${ac_cv_func_sbrk=3Dyes}
| ac_cv_func_scandir=3D${ac_cv_func_scandir=3Dyes}
| ac_cv_func_sched_setscheduler=3D${ac_cv_func_sched_setscheduler=3Dyes}
| ac_cv_func_sched_yield=3D${ac_cv_func_sched_yield=3Dyes}
| ac_cv_func_select=3D${ac_cv_func_select=3Dyes}
| ac_cv_func_semctl=3D${ac_cv_func_semctl=3Dyes}
| ac_cv_func_semget=3D${ac_cv_func_semget=3Dyes}
| ac_cv_func_sendmsg=3D${ac_cv_func_sendmsg=3Dyes}
| ac_cv_func_setbuf=3D${ac_cv_func_setbuf=3Dyes}
| ac_cv_func_setbuffer=3D${ac_cv_func_setbuffer=3Dyes}
| ac_cv_func_setegid=3D${ac_cv_func_setegid=3Dyes}
| ac_cv_func_setenv=3D${ac_cv_func_setenv=3Dyes}
| ac_cv_func_seteuid=3D${ac_cv_func_seteuid=3Dyes}
| ac_cv_func_setgid=3D${ac_cv_func_setgid=3Dyes}
| ac_cv_func_setgroups=3D${ac_cv_func_setgroups=3Dyes}
| ac_cv_func_sethostname=3D${ac_cv_func_sethostname=3Dyes}
| ac_cv_func_setitimer=3D${ac_cv_func_setitimer=3Dyes}
| ac_cv_func_setjmp=3D${ac_cv_func_setjmp=3Dyes}
| ac_cv_func_setlinebuf=3D${ac_cv_func_setlinebuf=3Dyes}
| ac_cv_func_setlocale=3D${ac_cv_func_setlocale=3Dyes}
| ac_cv_func_setmntent=3D${ac_cv_func_setmntent=3Dyes}
| ac_cv_func_setpgid=3D${ac_cv_func_setpgid=3Dyes}
| ac_cv_func_setpgrp=3D${ac_cv_func_setpgrp=3Dyes}
| ac_cv_func_setpriority=3D${ac_cv_func_setpriority=3Dyes}
| ac_cv_func_setregid=3D${ac_cv_func_setregid=3Dyes}
| ac_cv_func_setresgid=3D${ac_cv_func_setresgid=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_setreuid=3D${ac_cv_func_setreuid=3Dyes}
| ac_cv_func_setrlimit=3D${ac_cv_func_setrlimit=3Dyes}
| ac_cv_func_setsid=3D${ac_cv_func_setsid=3Dyes}
| ac_cv_func_setsockopt=3D${ac_cv_func_setsockopt=3Dyes}
| ac_cv_func_settimeofday=3D${ac_cv_func_settimeofday=3Dyes}
| ac_cv_func_setuid=3D${ac_cv_func_setuid=3Dyes}
| ac_cv_func_setutent=3D${ac_cv_func_setutent=3Dyes}
| ac_cv_func_setutxent=3D${ac_cv_func_setutxent=3Dyes}
| ac_cv_func_setvbuf=3D${ac_cv_func_setvbuf=3Dyes}
| ac_cv_func_setxattr=3D${ac_cv_func_setxattr=3Dyes}
| ac_cv_func_sgetspent=3D${ac_cv_func_sgetspent=3Dyes}
| ac_cv_func_shmat=3D${ac_cv_func_shmat=3Dyes}
| ac_cv_func_shmctl=3D${ac_cv_func_shmctl=3Dyes}
| ac_cv_func_shmdt=3D${ac_cv_func_shmdt=3Dyes}
| ac_cv_func_shmget=3D${ac_cv_func_shmget=3Dyes}
| ac_cv_func_shutdown=3D${ac_cv_func_shutdown=3Dyes}
| ac_cv_func_sigaction=3D${ac_cv_func_sigaction=3Dyes}
| ac_cv_func_sigaddset=3D${ac_cv_func_sigaddset=3Dyes}
| ac_cv_func_sigaltstack=3D${ac_cv_func_sigaltstack=3Dyes}
| ac_cv_func_sigblock=3D${ac_cv_func_sigblock=3Dyes}
| ac_cv_func_sigemptyset=3D${ac_cv_func_sigemptyset=3Dyes}
| ac_cv_func_sighold=3D${ac_cv_func_sighold=3Dyes}
| ac_cv_func_siginterrupt=3D${ac_cv_func_siginterrupt=3Dyes}
| ac_cv_func_signal=3D${ac_cv_func_signal=3Dyes}
| ac_cv_func_sigprocmask=3D${ac_cv_func_sigprocmask=3Dyes}
| ac_cv_func_sigset=3D${ac_cv_func_sigset=3Dyes}
| ac_cv_func_sigsetmask=3D${ac_cv_func_sigsetmask=3Dyes}
| ac_cv_func_sigstack=3D${ac_cv_func_sigstack=3Dyes}
| ac_cv_func_sigsuspend=3D${ac_cv_func_sigsuspend=3Dyes}
| ac_cv_func_sigvec=3D${ac_cv_func_sigvec=3Dyes}
| ac_cv_func_snprintf=3D${ac_cv_func_snprintf=3Dyes}
| ac_cv_func_socket=3D${ac_cv_func_socket=3Dyes}
| ac_cv_func_socketpair=3D${ac_cv_func_socketpair=3Dyes}
| ac_cv_func_sprintf=3D${ac_cv_func_sprintf=3Dyes}
| ac_cv_func_srand48=3D${ac_cv_func_srand48=3Dyes}
| ac_cv_func_srand=3D${ac_cv_func_srand=3Dyes}
| ac_cv_func_srandom=3D${ac_cv_func_srandom=3Dyes}
| ac_cv_func_sscanf=3D${ac_cv_func_sscanf=3Dyes}
| ac_cv_func_stat=3D${ac_cv_func_stat=3Dyes}
| ac_cv_func_statfs=3D${ac_cv_func_statfs=3Dyes}
| ac_cv_func_statvfs=3D${ac_cv_func_statvfs=3Dyes}
| ac_cv_func_stime=3D${ac_cv_func_stime=3Dyes}
| ac_cv_func_stpcpy=3D${ac_cv_func_stpcpy=3Dyes}
| ac_cv_func_strcasecmp=3D${ac_cv_func_strcasecmp=3Dyes}
| ac_cv_func_strcasestr=3D${ac_cv_func_strcasestr=3Dyes}
| ac_cv_func_strchr=3D${ac_cv_func_strchr=3Dyes}
| ac_cv_func_strchrnul=3D${ac_cv_func_strchrnul=3Dyes}
| ac_cv_func_strcmp=3D${ac_cv_func_strcmp=3Dyes}
| ac_cv_func_strcspn=3D${ac_cv_func_strcspn=3Dyes}
| ac_cv_func_strdup=3D${ac_cv_func_strdup=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
| ac_cv_func_strerror_r=3D${ac_cv_func_strerror_r=3Dyes}
| ac_cv_func_strftime=3D${ac_cv_func_strftime=3Dyes}
| ac_cv_func_strlen=3D${ac_cv_func_strlen=3Dyes}
| ac_cv_func_strncasecmp=3D${ac_cv_func_strncasecmp=3Dyes}
| ac_cv_func_strncmp=3D${ac_cv_func_strncmp=3Dyes}
| ac_cv_func_strndup=3D${ac_cv_func_strndup=3Dyes}
| ac_cv_func_strnlen=3D${ac_cv_func_strnlen=3Dyes}
| ac_cv_func_strpbrk=3D${ac_cv_func_strpbrk=3Dyes}
| ac_cv_func_strptime=3D${ac_cv_func_strptime=3Dyes}
| ac_cv_func_strrchr=3D${ac_cv_func_strrchr=3Dyes}
| ac_cv_func_strsep=3D${ac_cv_func_strsep=3Dyes}
| ac_cv_func_strsignal=3D${ac_cv_func_strsignal=3Dyes}
| ac_cv_func_strspn=3D${ac_cv_func_strspn=3Dyes}
| ac_cv_func_strstr=3D${ac_cv_func_strstr=3Dyes}
| ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
| ac_cv_func_strtoimax=3D${ac_cv_func_strtoimax=3Dyes}
| ac_cv_func_strtok_r=3D${ac_cv_func_strtok_r=3Dyes}
| ac_cv_func_strtol=3D${ac_cv_func_strtol=3Dyes}
| ac_cv_func_strtoll=3D${ac_cv_func_strtoll=3Dyes}
| ac_cv_func_strtoul=3D${ac_cv_func_strtoul=3Dyes}
| ac_cv_func_strtoull=3D${ac_cv_func_strtoull=3Dyes}
| ac_cv_func_strtoumax=3D${ac_cv_func_strtoumax=3Dyes}
| ac_cv_func_strverscmp=3D${ac_cv_func_strverscmp=3Dyes}
| ac_cv_func_strxfrm=3D${ac_cv_func_strxfrm=3Dyes}
| ac_cv_func_symlink=3D${ac_cv_func_symlink=3Dyes}
| ac_cv_func_sync=3D${ac_cv_func_sync=3Dyes}
| ac_cv_func_sys_siglist=3D${ac_cv_func_sys_siglist=3Dyes}
| ac_cv_func_sysconf=3D${ac_cv_func_sysconf=3Dyes}
| ac_cv_func_sysctl=3D${ac_cv_func_sysctl=3Dyes}
| ac_cv_func_sysinfo=3D${ac_cv_func_sysinfo=3Dyes}
| ac_cv_func_syslog=3D${ac_cv_func_syslog=3Dyes}
| ac_cv_func_system=3D${ac_cv_func_system=3Dyes}
| ac_cv_func_tcgetattr=3D${ac_cv_func_tcgetattr=3Dyes}
| ac_cv_func_tcgetpgrp=3D${ac_cv_func_tcgetpgrp=3Dyes}
| ac_cv_func_tcsetattr=3D${ac_cv_func_tcsetattr=3Dyes}
| ac_cv_func_tcsetpgrp=3D${ac_cv_func_tcsetpgrp=3Dyes}
| ac_cv_func_time=3D${ac_cv_func_time=3Dyes}
| ac_cv_func_timegm=3D${ac_cv_func_timegm=3Dyes}
| ac_cv_func_times=3D${ac_cv_func_times=3Dyes}
| ac_cv_func_timezone=3D${ac_cv_func_timezone=3Dyes}
| ac_cv_func_tmpnam=3D${ac_cv_func_tmpnam=3Dyes}
| ac_cv_func_towlower=3D${ac_cv_func_towlower=3Dyes}
| ac_cv_func_towupper=3D${ac_cv_func_towupper=3Dyes}
| ac_cv_func_truncate=3D${ac_cv_func_truncate=3Dyes}
| ac_cv_func_tsearch=3D${ac_cv_func_tsearch=3Dyes}
| ac_cv_func_ttyname=3D${ac_cv_func_ttyname=3Dyes}
| ac_cv_func_tzset=3D${ac_cv_func_tzset=3Dyes}
| ac_cv_func_ulimit=3D${ac_cv_func_ulimit=3Dyes}
| ac_cv_func_umask=3D${ac_cv_func_umask=3Dyes}
| ac_cv_func_uname=3D${ac_cv_func_uname=3Dyes}
| ac_cv_func_unlink=3D${ac_cv_func_unlink=3Dyes}
| ac_cv_func_unsetenv=3D${ac_cv_func_unsetenv=3Dyes}
| ac_cv_func_unshare=3D${ac_cv_func_unshare=3Dyes}
| ac_cv_func_updwtmp=3D${ac_cv_func_updwtmp=3Dyes}
| ac_cv_func_updwtmpx=3D${ac_cv_func_updwtmpx=3Dyes}
| ac_cv_func_usleep=3D${ac_cv_func_usleep=3Dyes}
| ac_cv_func_ustat=3D${ac_cv_func_ustat=3Dyes}
| ac_cv_func_utime=3D${ac_cv_func_utime=3Dyes}
| ac_cv_func_utimes=3D${ac_cv_func_utimes=3Dyes}
| ac_cv_func_utmpname=3D${ac_cv_func_utmpname=3Dyes}
| ac_cv_func_utmpxname=3D${ac_cv_func_utmpxname=3Dyes}
| ac_cv_func_valloc=3D${ac_cv_func_valloc=3Dyes}
| ac_cv_func_vasprintf=3D${ac_cv_func_vasprintf=3Dyes}
| ac_cv_func_verrx=3D${ac_cv_func_verrx=3Dyes}
| ac_cv_func_vfork=3D${ac_cv_func_vfork=3Dyes}
| ac_cv_func_vfprintf=3D${ac_cv_func_vfprintf=3Dyes}
| ac_cv_func_vfscanf=3D${ac_cv_func_vfscanf=3Dyes}
| ac_cv_func_vhangup=3D${ac_cv_func_vhangup=3Dyes}
| ac_cv_func_vprintf=3D${ac_cv_func_vprintf=3Dyes}
| ac_cv_func_vsnprintf=3D${ac_cv_func_vsnprintf=3Dyes}
| ac_cv_func_vsprintf=3D${ac_cv_func_vsprintf=3Dyes}
| ac_cv_func_wait3=3D${ac_cv_func_wait3=3Dyes}
| ac_cv_func_wait4=3D${ac_cv_func_wait4=3Dyes}
| ac_cv_func_waitpid=3D${ac_cv_func_waitpid=3Dyes}
| ac_cv_func_wcrtomb=3D${ac_cv_func_wcrtomb=3Dyes}
| ac_cv_func_wcscoll=3D${ac_cv_func_wcscoll=3Dyes}
| ac_cv_func_wcsdup=3D${ac_cv_func_wcsdup=3Dyes}
| ac_cv_func_wcslen=3D${ac_cv_func_wcslen=3Dyes}
| ac_cv_func_wctob=3D${ac_cv_func_wctob=3Dyes}
| ac_cv_func_wctomb=3D${ac_cv_func_wctomb=3Dyes}
| ac_cv_func_wctype=3D${ac_cv_func_wctype=3Dyes}
| ac_cv_func_wcwidth=3D${ac_cv_func_wcwidth=3Dyes}
| ac_cv_func_wmemchr=3D${ac_cv_func_wmemchr=3Dyes}
| ac_cv_func_wmemcpy=3D${ac_cv_func_wmemcpy=3Dyes}
| ac_cv_func_wmempcpy=3D${ac_cv_func_wmempcpy=3Dyes}
| ac_cv_header_aio_h=3D${ac_cv_header_aio_h=3Dyes}
| ac_cv_header_alloca_h=3D${ac_cv_header_alloca_h=3Dyes}
| ac_cv_header_argz_h=3D${ac_cv_header_argz_h=3Dyes}
| ac_cv_header_arpa_inet_h=3D${ac_cv_header_arpa_inet_h=3Dyes}
| ac_cv_header_arpa_nameser_h=3D${ac_cv_header_arpa_nameser_h=3Dyes}
| ac_cv_header_asm_byteorder_h=3D${ac_cv_header_asm_byteorder_h=3Dyes}
| ac_cv_header_asm_ioctls_h=3D${ac_cv_header_asm_ioctls_h=3Dyes}
| ac_cv_header_asm_page_h=3D${ac_cv_header_asm_page_h=3Dno}
| ac_cv_header_asm_types_h=3D${ac_cv_header_asm_types_h=3Dyes}
| ac_cv_header_assert_h=3D${ac_cv_header_assert_h=3Dyes}
| ac_cv_header_byteswap_h=3D${ac_cv_header_byteswap_h=3Dyes}
| ac_cv_header_crypt_h=3D${ac_cv_header_crypt_h=3Dyes}
| ac_cv_header_ctype_h=3D${ac_cv_header_ctype_h=3Dyes}
| ac_cv_header_dirent_h=3D${ac_cv_header_dirent_h=3Dyes}
| ac_cv_header_dlfcn_h=3D${ac_cv_header_dlfcn_h=3Dyes}
| ac_cv_header_elf_h=3D${ac_cv_header_elf_h=3Dyes}
| ac_cv_header_endian_h=3D${ac_cv_header_endian_h=3Dyes}
| ac_cv_header_err_h=3D${ac_cv_header_err_h=3Dyes}
| ac_cv_header_errno_h=3D${ac_cv_header_errno_h=3Dyes}
| ac_cv_header_execinfo_h=3D${ac_cv_header_execinfo_h=3Dyes}
| ac_cv_header_fcntl_h=3D${ac_cv_header_fcntl_h=3Dyes}
| ac_cv_header_features_h=3D${ac_cv_header_features_h=3Dyes}
| ac_cv_header_float_h=3D${ac_cv_header_float_h=3Dyes}
| ac_cv_header_fstab_h=3D${ac_cv_header_fstab_h=3Dyes}
| ac_cv_header_ftw_h=3D${ac_cv_header_ftw_h=3Dyes}
| ac_cv_header_getopt_h=3D${ac_cv_header_getopt_h=3Dyes}
| ac_cv_header_glob_h=3D${ac_cv_header_glob_h=3Dyes}
| ac_cv_header_grp_h=3D${ac_cv_header_grp_h=3Dyes}
| ac_cv_header_iconv_h=3D${ac_cv_header_iconv_h=3Dyes}
| ac_cv_header_ifaddrs_h=3D${ac_cv_header_ifaddrs_h=3Dyes}
| ac_cv_header_inttypes_h=3D${ac_cv_header_inttypes_h=3Dyes}
| ac_cv_header_langinfo_h=3D${ac_cv_header_langinfo_h=3Dyes}
| ac_cv_header_lastlog_h=3D${ac_cv_header_lastlog_h=3Dyes}
| ac_cv_header_libgen_h=3D${ac_cv_header_libgen_h=3Dyes}
| ac_cv_header_libintl_h=3D${ac_cv_header_libintl_h=3Dyes}
| ac_cv_header_limits_h=3D${ac_cv_header_limits_h=3Dyes}
| ac_cv_header_linux_capability_h=3D${ac_cv_header_linux_capability_h=3Dyes=
}
| ac_cv_header_linux_fd_h=3D${ac_cv_header_linux_fd_h=3Dyes}
| ac_cv_header_linux_fs_h=3D${ac_cv_header_linux_fs_h=3Dyes}
| ac_cv_header_linux_hayesesp_h=3D${ac_cv_header_linux_hayesesp_h=3Dno}
| ac_cv_header_linux_hdreg_h=3D${ac_cv_header_linux_hdreg_h=3Dyes}
| ac_cv_header_linux_icmp_h=3D${ac_cv_header_linux_icmp_h=3Dyes}
| ac_cv_header_linux_in6_h=3D${ac_cv_header_linux_in6_h=3Dyes}
| ac_cv_header_linux_joystick_h=3D${ac_cv_header_linux_joystick_h=3Dyes}
| ac_cv_header_linux_ptrace_h=3D${ac_cv_header_linux_ptrace_h=3Dyes}
| ac_cv_header_linux_serial_h=3D${ac_cv_header_linux_serial_h=3Dyes}
| ac_cv_header_linux_sonypi_h=3D${ac_cv_header_linux_sonypi_h=3Dyes}
| ac_cv_header_linux_unistd_h=3D${ac_cv_header_linux_unistd_h=3Dyes}
| ac_cv_header_linux_utsname_h=3D${ac_cv_header_linux_utsname_h=3Dyes}
| ac_cv_header_linux_version_h=3D${ac_cv_header_linux_version_h=3Dyes}
| ac_cv_header_locale_h=3D${ac_cv_header_locale_h=3Dyes}
| ac_cv_header_malloc_h=3D${ac_cv_header_malloc_h=3Dyes}
| ac_cv_header_math_h=3D${ac_cv_header_math_h=3Dyes}
| ac_cv_header_mcheck_h=3D${ac_cv_header_mcheck_h=3Dyes}
| ac_cv_header_memory_h=3D${ac_cv_header_memory_h=3Dyes}
| ac_cv_header_mntent_h=3D${ac_cv_header_mntent_h=3Dyes}
| ac_cv_header_mqueue_h=3D${ac_cv_header_mqueue_h=3Dyes}
| ac_cv_header_net_if_h=3D${ac_cv_header_net_if_h=3Dyes}
| ac_cv_header_net_route_h=3D${ac_cv_header_net_route_h=3Dyes}
| ac_cv_header_netdb_h=3D${ac_cv_header_netdb_h=3Dyes}
| ac_cv_header_netinet_ether_h=3D${ac_cv_header_netinet_ether_h=3Dyes}
| ac_cv_header_netinet_in_h=3D${ac_cv_header_netinet_in_h=3Dyes}
| ac_cv_header_netinet_ip6_h=3D${ac_cv_header_netinet_ip6_h=3Dyes}
| ac_cv_header_netinet_ip_h=3D${ac_cv_header_netinet_ip_h=3Dyes}
| ac_cv_header_netinet_tcp_h=3D${ac_cv_header_netinet_tcp_h=3Dyes}
| ac_cv_header_netinet_udp_h=3D${ac_cv_header_netinet_udp_h=3Dyes}
| ac_cv_header_netipx_ipx_h=3D${ac_cv_header_netipx_ipx_h=3Dyes}
| ac_cv_header_paths_h=3D${ac_cv_header_paths_h=3Dyes}
| ac_cv_header_poll_h=3D${ac_cv_header_poll_h=3Dyes}
| ac_cv_header_pthread_h=3D${ac_cv_header_pthread_h=3Dyes}
| ac_cv_header_pty_h=3D${ac_cv_header_pty_h=3Dyes}
| ac_cv_header_pwd_h=3D${ac_cv_header_pwd_h=3Dyes}
| ac_cv_header_regex_h=3D${ac_cv_header_regex_h=3Dyes}
| ac_cv_header_resolv_h=3D${ac_cv_header_resolv_h=3Dyes}
| ac_cv_header_rpc_rpc_h=3D${ac_cv_header_rpc_rpc_h=3Dyes}
| ac_cv_header_rpc_types_h=3D${ac_cv_header_rpc_types_h=3Dyes}
| ac_cv_header_sched_h=3D${ac_cv_header_sched_h=3Dyes}
| ac_cv_header_scsi_scsi_h=3D${ac_cv_header_scsi_scsi_h=3Dyes}
| ac_cv_header_search_h=3D${ac_cv_header_search_h=3Dyes}
| ac_cv_header_semaphore_h=3D${ac_cv_header_semaphore_h=3Dyes}
| ac_cv_header_setjmp_h=3D${ac_cv_header_setjmp_h=3Dyes}
| ac_cv_header_sgtty_h=3D${ac_cv_header_sgtty_h=3Dyes}
| ac_cv_header_shadow_h=3D${ac_cv_header_shadow_h=3Dyes}
| ac_cv_header_signal_h=3D${ac_cv_header_signal_h=3Dyes}
| ac_cv_header_stdarg_h=3D${ac_cv_header_stdarg_h=3Dyes}
| ac_cv_header_stdbool_h=3D${ac_cv_header_stdbool_h=3Dyes}
| ac_cv_header_stdc=3D${ac_cv_header_stdc=3Dyes}
| ac_cv_header_stddef_h=3D${ac_cv_header_stddef_h=3Dyes}
| ac_cv_header_stdint_h=3D${ac_cv_header_stdint_h=3Dyes}
| ac_cv_header_stdio_h=3D${ac_cv_header_stdio_h=3Dyes}
| ac_cv_header_stdlib_h=3D${ac_cv_header_stdlib_h=3Dyes}
| ac_cv_header_string_h=3D${ac_cv_header_string_h=3Dyes}
| ac_cv_header_strings_h=3D${ac_cv_header_strings_h=3Dyes}
| ac_cv_header_stropts_h=3D${ac_cv_header_stropts_h=3Dyes}
| ac_cv_header_sys_bitypes_h=3D${ac_cv_header_sys_bitypes_h=3Dyes}
| ac_cv_header_sys_cdefs_h=3D${ac_cv_header_sys_cdefs_h=3Dyes}
| ac_cv_header_sys_dir_h=3D${ac_cv_header_sys_dir_h=3Dyes}
| ac_cv_header_sys_epoll_h=3D${ac_cv_header_sys_epoll_h=3Dyes}
| ac_cv_header_sys_fcntl_h=3D${ac_cv_header_sys_fcntl_h=3Dyes}
| ac_cv_header_sys_file_h=3D${ac_cv_header_sys_file_h=3Dyes}
| ac_cv_header_sys_fsuid_h=3D${ac_cv_header_sys_fsuid_h=3Dyes}
| ac_cv_header_sys_ioctl_h=3D${ac_cv_header_sys_ioctl_h=3Dyes}
| ac_cv_header_sys_ipc_h=3D${ac_cv_header_sys_ipc_h=3Dyes}
| ac_cv_header_sys_mman_h=3D${ac_cv_header_sys_mman_h=3Dyes}
| ac_cv_header_sys_mount_h=3D${ac_cv_header_sys_mount_h=3Dyes}
| ac_cv_header_sys_mtio_h=3D${ac_cv_header_sys_mtio_h=3Dyes}
| ac_cv_header_sys_param_h=3D${ac_cv_header_sys_param_h=3Dyes}
| ac_cv_header_sys_poll_h=3D${ac_cv_header_sys_poll_h=3Dyes}
| ac_cv_header_sys_prctl_h=3D${ac_cv_header_sys_prctl_h=3Dyes}
| ac_cv_header_sys_ptrace_h=3D${ac_cv_header_sys_ptrace_h=3Dyes}
| ac_cv_header_sys_queue_h=3D${ac_cv_header_sys_queue_h=3Dyes}
| ac_cv_header_sys_reg_h=3D${ac_cv_header_sys_reg_h=3Dno}
| ac_cv_header_sys_resource_h=3D${ac_cv_header_sys_resource_h=3Dyes}
| ac_cv_header_sys_select_h=3D${ac_cv_header_sys_select_h=3Dyes}
| ac_cv_header_sys_sem_h=3D${ac_cv_header_sys_sem_h=3Dyes}
| ac_cv_header_sys_shm_h=3D${ac_cv_header_sys_shm_h=3Dyes}
| ac_cv_header_sys_signal_h=3D${ac_cv_header_sys_signal_h=3Dyes}
| ac_cv_header_sys_socket_h=3D${ac_cv_header_sys_socket_h=3Dyes}
| ac_cv_header_sys_socketvar_h=3D${ac_cv_header_sys_socketvar_h=3Dyes}
| ac_cv_header_sys_soundcard_h=3D${ac_cv_header_sys_soundcard_h=3Dyes}
| ac_cv_header_sys_stat_h=3D${ac_cv_header_sys_stat_h=3Dyes}
| ac_cv_header_sys_statfs_h=3D${ac_cv_header_sys_statfs_h=3Dyes}
| ac_cv_header_sys_statvfs_h=3D${ac_cv_header_sys_statvfs_h=3Dyes}
| ac_cv_header_sys_stropts_h=3D${ac_cv_header_sys_stropts_h=3Dyes}
| ac_cv_header_sys_swap_h=3D${ac_cv_header_sys_swap_h=3Dyes}
| ac_cv_header_sys_sysctl_h=3D${ac_cv_header_sys_sysctl_h=3Dyes}
| ac_cv_header_sys_sysinfo_h=3D${ac_cv_header_sys_sysinfo_h=3Dyes}
| ac_cv_header_sys_sysmacros_h=3D${ac_cv_header_sys_sysmacros_h=3Dyes}
| ac_cv_header_sys_termios_h=3D${ac_cv_header_sys_termios_h=3Dyes}
| ac_cv_header_sys_time_h=3D${ac_cv_header_sys_time_h=3Dyes}
| ac_cv_header_sys_timeb_h=3D${ac_cv_header_sys_timeb_h=3Dyes}
| ac_cv_header_sys_times_h=3D${ac_cv_header_sys_times_h=3Dyes}
| ac_cv_header_sys_timex_h=3D${ac_cv_header_sys_timex_h=3Dyes}
| ac_cv_header_sys_types_h=3D${ac_cv_header_sys_types_h=3Dyes}
| ac_cv_header_sys_uio_h=3D${ac_cv_header_sys_uio_h=3Dyes}
| ac_cv_header_sys_un_h=3D${ac_cv_header_sys_un_h=3Dyes}
| ac_cv_header_sys_unistd_h=3D${ac_cv_header_sys_unistd_h=3Dyes}
| ac_cv_header_sys_user_h=3D${ac_cv_header_sys_user_h=3Dyes}
| ac_cv_header_sys_utsname_h=3D${ac_cv_header_sys_utsname_h=3Dyes}
| ac_cv_header_sys_vfs_h=3D${ac_cv_header_sys_vfs_h=3Dyes}
| ac_cv_header_sys_wait_h=3D${ac_cv_header_sys_wait_h=3Dyes}
| ac_cv_header_sysexits_h=3D${ac_cv_header_sysexits_h=3Dyes}
| ac_cv_header_syslog_h=3D${ac_cv_header_syslog_h=3Dyes}
| ac_cv_header_termio_h=3D${ac_cv_header_termio_h=3Dyes}
| ac_cv_header_termios_h=3D${ac_cv_header_termios_h=3Dyes}
| ac_cv_header_time_h=3D${ac_cv_header_time_h=3Dyes}
| ac_cv_header_ttyent_h=3D${ac_cv_header_ttyent_h=3Dyes}
| ac_cv_header_ulimit_h=3D${ac_cv_header_ulimit_h=3Dyes}
| ac_cv_header_unistd_h=3D${ac_cv_header_unistd_h=3Dyes}
| ac_cv_header_ustat_h=3D${ac_cv_header_ustat_h=3Dyes}
| ac_cv_header_utime_h=3D${ac_cv_header_utime_h=3Dyes}
| ac_cv_header_utmp_h=3D${ac_cv_header_utmp_h=3Dyes}
| ac_cv_header_utmpx_h=3D${ac_cv_header_utmpx_h=3Dyes}
| ac_cv_header_values_h=3D${ac_cv_header_values_h=3Dyes}
| ac_cv_header_wchar_h=3D${ac_cv_header_wchar_h=3Dyes}
| ac_cv_header_wctype_h=3D${ac_cv_header_wctype_h=3Dyes}
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D16}
| ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_long_long_int=3D${ac_cv_sizeof_long_long_int=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
| ac_cv_sizeof_signed_char=3D${ac_cv_sizeof_signed_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_unsigned_long_int=3D${ac_cv_sizeof_unsigned_long_int=3D4}
| ac_cv_sizeof_unsigned_long_long_int=3D${ac_cv_sizeof_unsigned_long_long_i=
nt=3D8}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_unsigned_short_int=3D${ac_cv_sizeof_unsigned_short_int=3D2}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
configure:3482: checking for a BSD-compatible install
configure:3550: result: /usr/bin/install -c
configure:3561: checking whether build environment is sane
configure:3611: result: yes
configure:3660: checking for powerpc-poky-linux-strip
configure:3687: result: powerpc-poky-linux-strip
configure:3752: checking for a thread-safe mkdir -p
configure:3791: result: /bin/mkdir -p
configure:3804: checking for gawk
configure:3820: found /usr/bin/gawk
configure:3831: result: gawk
configure:3842: checking whether make sets $(MAKE)
configure:3864: result: yes
configure:3945: checking whether to enable maintainer-specific portions of =
Makefiles
configure:3954: result: no
configure:3992: checking for style of include used by make
configure:4020: result: GNU
configure:4050: checking for powerpc-poky-linux-gcc
configure:4077: result: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float -=
-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc
configure:4346: checking for C compiler version
configure:4355: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc --version >&5
powerpc-poky-linux-gcc (GCC) 4.6.0
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:4366: $? =3D 0
configure:4355: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -v >&5
Using built-in specs.
COLLECT_GCC=3Dpowerpc-poky-linux-gcc
COLLECT_LTO_WRAPPER=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/lib=
exec/ppc603e-poky-linux/gcc/powerpc-poky-linux/4.6.0/lto-wrapper
Target: powerpc-poky-linux
Configured with: /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/gcc-cross-=
4.6.0-r2/gcc-4.6.0/configure --build=3Dx86_64-linux --host=3Dx86_64-linux -=
-target=3Dpowerpc-poky-linux --prefix=3D/home/kyu3/sdb/test/tmp/sysroots/x8=
6_64-linux/usr --exec_prefix=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linu=
x/usr --bindir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/ppc6=
03e-poky-linux --sbindir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/us=
r/bin/ppc603e-poky-linux --libexecdir=3D/home/kyu3/sdb/test/tmp/sysroots/x8=
6_64-linux/usr/libexec/ppc603e-poky-linux --datadir=3D/home/kyu3/sdb/test/t=
mp/sysroots/x86_64-linux/usr/share --sysconfdir=3D/home/kyu3/sdb/test/tmp/s=
ysroots/x86_64-linux/etc --sharedstatedir=3D/home/kyu3/sdb/test/tmp/sysroot=
s/x86_64-linux/com --localstatedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_6=
4-linux/var --libdir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/li=
b/ppc603e-poky-linux --includedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64=
-linux/usr/include --oldincludedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_6=
4-linux/usr/include --infodir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-lin=
ux/usr/share/info --mandir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/=
usr/share/man --disable-silent-rules --with-libtool-sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/x86_64-linux --with-gnu-ld --enable-shared --enable-lan=
guages=3Dc,c++ --enable-threads=3Dposix --disable-multilib --enable-c99 --e=
nable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch --program-pre=
fix=3Dpowerpc-poky-linux- --enable-lto --enable-libssp --disable-bootstrap =
--disable-libgomp --disable-libmudflap --enable-cheaders=3Dc_global --with-=
local-prefix=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr --with-gxx-incl=
ude-dir=3D/usr/include/c++ --with-sysroot=3D/home/kyu3/sdb/test/tmp/sysroot=
s/qemuppc --with-build-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -=
-enable-poison-system-directories --disable-libunwind-exceptions --with-mpf=
r=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr --with-system-zlib --=
enable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.6.0 (GCC)=20
configure:4366: $? =3D 0
configure:4355: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -V >&5
powerpc-poky-linux-gcc: error: unrecognized option '-V'
powerpc-poky-linux-gcc: fatal error: no input files
compilation terminated.
configure:4366: $? =3D 1
configure:4355: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -qversion >&5
powerpc-poky-linux-gcc: error: unrecognized option '-qversion'
powerpc-poky-linux-gcc: fatal error: no input files
compilation terminated.
configure:4366: $? =3D 1
configure:4386: checking whether the C compiler works
configure:4408: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -O2 -pipe -g -feliminate-unused=
-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:4412: $? =3D 0
configure:4461: result: yes
configure:4464: checking for C compiler default output file name
configure:4466: result: a.out
configure:4472: checking for suffix of executables
configure:4479: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -o conftest -O2 -pipe -g -felim=
inate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:4483: $? =3D 0
configure:4505: result:=20
configure:4527: checking whether we are cross compiling
configure:4565: result: yes
configure:4570: checking for suffix of object files
configure:4592: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -c -O2 -pipe -g -feliminate-unu=
sed-debug-types  conftest.c >&5
configure:4596: $? =3D 0
configure:4617: result: o
configure:4621: checking whether we are using the GNU C compiler
configure:4640: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -c -O2 -pipe -g -feliminate-unu=
sed-debug-types  conftest.c >&5
configure:4640: $? =3D 0
configure:4649: result: yes
configure:4658: checking whether powerpc-poky-linux-gcc -mcpu=3D603e  -mhar=
d-float --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc accepts -g
configure:4678: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -c -g  conftest.c >&5
configure:4678: $? =3D 0
configure:4719: result: yes
configure:4736: checking for powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc option to accept I=
SO C89
configure:4800: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc  -c -O2 -pipe -g -feliminate-un=
used-debug-types  conftest.c >&5
configure:4800: $? =3D 0
configure:4813: result: none needed
configure:4835: checking dependency style of powerpc-poky-linux-gcc -mcpu=
=3D603e  -mhard-float --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc
configure:4945: result: gcc3
configure:4960: checking for powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc option to accept I=
SO C99
configure:5109: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc  -c -O2 -pipe -g -feliminate-un=
used-debug-types  conftest.c >&5
conftest.c:61:29: error: expected ';', ',' or ')' before 'text'
conftest.c: In function 'main':
conftest.c:115:18: error: expected '=3D', ',', ';', 'asm' or '__attribute__=
' before 'newvar'
conftest.c:115:18: error: 'newvar' undeclared (first use in this function)
conftest.c:115:18: note: each undeclared identifier is reported only once f=
or each function it appears in
conftest.c:125:3: error: 'for' loop initial declarations are only allowed i=
n C99 mode
conftest.c:125:3: note: use option -std=3Dc99 or -std=3Dgnu99 to compile yo=
ur code
configure:5109: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| /* end confdefs.h.  */
| #include <stdarg.h>
| #include <stdbool.h>
| #include <stdlib.h>
| #include <wchar.h>
| #include <stdio.h>
|=20
| // Check varargs macros.  These examples are taken from C99 6.10.3.5.
| #define debug(...) fprintf (stderr, __VA_ARGS__)
| #define showlist(...) puts (#__VA_ARGS__)
| #define report(test,...) ((test) ? puts (#test) : printf (__VA_ARGS__))
| static void
| test_varargs_macros (void)
| {
|   int x =3D 1234;
|   int y =3D 5678;
|   debug ("Flag");
|   debug ("X =3D %d\n", x);
|   showlist (The first, second, and third items.);
|   report (x>y, "x is %d but y is %d", x, y);
| }
|=20
| // Check long long types.
| #define BIG64 18446744073709551615ull
| #define BIG32 4294967295ul
| #define BIG_OK (BIG64 / BIG32 =3D=3D 4294967297ull && BIG64 % BIG32 =3D=
=3D 0)
| #if !BIG_OK
|   your preprocessor is broken;
| #endif
| #if BIG_OK
| #else
|   your preprocessor is broken;
| #endif
| static long long int bignum =3D -9223372036854775807LL;
| static unsigned long long int ubignum =3D BIG64;
|=20
| struct incomplete_array
| {
|   int datasize;
|   double data[];
| };
|=20
| struct named_init {
|   int number;
|   const wchar_t *name;
|   double average;
| };
|=20
| typedef const char *ccp;
|=20
| static inline int
| test_restrict (ccp restrict text)
| {
|   // See if C++-style comments work.
|   // Iterate through items via the restricted pointer.
|   // Also check for declarations in for loops.
|   for (unsigned int i =3D 0; *(text+i) !=3D '\0'; ++i)
|     continue;
|   return 0;
| }
|=20
| // Check varargs and va_copy.
| static void
| test_varargs (const char *format, ...)
| {
|   va_list args;
|   va_start (args, format);
|   va_list args_copy;
|   va_copy (args_copy, args);
|=20
|   const char *str;
|   int number;
|   float fnumber;
|=20
|   while (*format)
|     {
|       switch (*format++)
| 	{
| 	case 's': // string
| 	  str =3D va_arg (args_copy, const char *);
| 	  break;
| 	case 'd': // int
| 	  number =3D va_arg (args_copy, int);
| 	  break;
| 	case 'f': // float
| 	  fnumber =3D va_arg (args_copy, double);
| 	  break;
| 	default:
| 	  break;
| 	}
|     }
|   va_end (args_copy);
|   va_end (args);
| }
|=20
| int
| main ()
| {
|=20
|   // Check bool.
|   _Bool success =3D false;
|=20
|   // Check restrict.
|   if (test_restrict ("String literal") =3D=3D 0)
|     success =3D true;
|   char *restrict newvar =3D "Another string";
|=20
|   // Check varargs.
|   test_varargs ("s, d' f .", "string", 65, 34.234);
|   test_varargs_macros ();
|=20
|   // Check flexible array members.
|   struct incomplete_array *ia =3D
|     malloc (sizeof (struct incomplete_array) + (sizeof (double) * 10));
|   ia->datasize =3D 10;
|   for (int i =3D 0; i < ia->datasize; ++i)
|     ia->data[i] =3D i * 1.234;
|=20
|   // Check named initializers.
|   struct named_init ni =3D {
|     .number =3D 34,
|     .name =3D L"Test wide string",
|     .average =3D 543.34343,
|   };
|=20
|   ni.number =3D 58;
|=20
|   int dynamic_array[ni.number];
|   dynamic_array[ni.number - 1] =3D 543;
|=20
|   // work around unused variable warnings
|   return (!success || bignum =3D=3D 0LL || ubignum =3D=3D 0uLL || newvar[=
0] =3D=3D 'x'
| 	  || dynamic_array[ni.number - 1] !=3D 543);
|=20
|   ;
|   return 0;
| }
configure:5109: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -f=
eliminate-unused-debug-types  conftest.c >&5
configure:5109: $? =3D 0
configure:5129: result: -std=3Dgnu99
configure:5143: checking how to run the C preprocessor
configure:5213: result: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemuppc
configure:5233: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/t=
mp/sysroots/qemuppc  conftest.c
configure:5233: $? =3D 0
configure:5247: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/t=
mp/sysroots/qemuppc  conftest.c
conftest.c:11:28: fatal error: ac_nonexistent.h: No such file or directory
compilation terminated.
configure:5247: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:5276: checking for grep that handles long lines and -e
configure:5334: result: /bin/grep
configure:5339: checking for egrep
configure:5401: result: /bin/grep -E
configure:5406: checking for ANSI C header files
configure:5510: result: yes
configure:5523: checking for sys/types.h
configure:5523: result: yes
configure:5523: checking for sys/stat.h
configure:5523: result: yes
configure:5523: checking for stdlib.h
configure:5523: result: yes
configure:5523: checking for string.h
configure:5523: result: yes
configure:5523: checking for memory.h
configure:5523: result: yes
configure:5523: checking for strings.h
configure:5523: result: yes
configure:5523: checking for inttypes.h
configure:5523: result: yes
configure:5523: checking for stdint.h
configure:5523: result: yes
configure:5523: checking for unistd.h
configure:5523: result: yes
configure:5546: checking for powerpc-poky-linux-pkg-config
configure:5579: result: no
configure:5589: checking for pkg-config
configure:5607: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin=
/pkg-config
configure:5619: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/b=
in/pkg-config
configure:5631: WARNING: using cross tools not prefixed with host triplet
configure:5644: checking pkg-config is at least version 0.9.0
configure:5647: result: yes
configure:5659: checking build system type
configure:5673: result: x86_64-pc-linux-gnu
configure:5693: checking host system type
configure:5706: result: powerpc-poky-linux-gnu
configure:5726: checking for a sed that does not truncate output
configure:5790: result: /bin/sed
configure:6020: checking for doxygen
configure:6053: result: no
configure:6059: WARNING: doxygen not found - documentation targets will be =
skipped
configure:6156: checking for X.Org SGML entities >=3D 1.5
configure:6160: $PKG_CONFIG --exists --print-errors "xorg-sgml-doctools >=
=3D 1.5"
Package xorg-sgml-doctools was not found in the pkg-config search path.
Perhaps you should add the directory containing `xorg-sgml-doctools.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xorg-sgml-doctools' found
configure:6163: $? =3D 1
configure:6179: result: no
configure:6234: checking dependency style of powerpc-poky-linux-gcc -mcpu=
=3D603e  -mhard-float --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc =
-std=3Dgnu99
configure:6342: result: gcc3
configure:6357: checking whether ln -s works
configure:6361: result: yes
configure:6748: checking how to print strings
configure:6775: result: printf
configure:6796: checking for a sed that does not truncate output
configure:6860: result: /bin/sed
configure:6878: checking for fgrep
configure:6940: result: /bin/grep -F
configure:6975: checking for ld used by powerpc-poky-linux-gcc -mcpu=3D603e=
  -mhard-float --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3D=
gnu99
configure:7042: result: powerpc-poky-linux-ld --sysroot=3D/home/kyu3/sdb/te=
st/tmp/sysroots/qemuppc
configure:7049: checking if the linker (powerpc-poky-linux-ld --sysroot=3D/=
home/kyu3/sdb/test/tmp/sysroots/qemuppc) is GNU ld
configure:7064: result: yes
configure:7076: checking for BSD- or MS-compatible name lister (nm)
configure:7125: result: powerpc-poky-linux-nm
configure:7255: checking the name lister (powerpc-poky-linux-nm) interface
configure:7262: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -f=
eliminate-unused-debug-types  conftest.c >&5
configure:7265: powerpc-poky-linux-nm "conftest.o"
configure:7268: output
00000000 S some_variable
configure:7275: result: BSD nm
configure:7279: checking the maximum length of command line arguments
configure:7404: result: 1572864
configure:7421: checking whether the shell understands some XSI constructs
configure:7431: result: yes
configure:7435: checking whether the shell understands "+=3D"
configure:7441: result: yes
configure:7476: checking how to convert x86_64-pc-linux-gnu file names to p=
owerpc-poky-linux-gnu format
configure:7516: result: func_convert_file_noop
configure:7523: checking how to convert x86_64-pc-linux-gnu file names to t=
oolchain format
configure:7543: result: func_convert_file_noop
configure:7550: checking for powerpc-poky-linux-ld --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemuppc option to reload object files
configure:7557: result: -r
configure:7591: checking for powerpc-poky-linux-objdump
configure:7618: result: powerpc-poky-linux-objdump
configure:7687: checking how to recognize dependent libraries
configure:7889: result: pass_all
configure:7934: checking for powerpc-poky-linux-dlltool
configure:7961: result: dlltool
configure:8031: checking how to associate runtime and link libraries
configure:8058: result: printf %s\n
configure:8074: checking for powerpc-poky-linux-ar
configure:8101: result: powerpc-poky-linux-ar
configure:8182: checking for archiver @FILE support
configure:8199: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -f=
eliminate-unused-debug-types  conftest.c >&5
configure:8199: $? =3D 0
configure:8202: powerpc-poky-linux-ar cru libconftest.a @conftest.lst >&5
configure:8205: $? =3D 0
configure:8210: powerpc-poky-linux-ar cru libconftest.a @conftest.lst >&5
powerpc-poky-linux-ar: conftest.o: No such file or directory
configure:8213: $? =3D 1
configure:8225: result: @
configure:8243: checking for powerpc-poky-linux-strip
configure:8270: result: powerpc-poky-linux-strip
configure:8342: checking for powerpc-poky-linux-ranlib
configure:8369: result: powerpc-poky-linux-ranlib
configure:8511: checking command to parse powerpc-poky-linux-nm output from=
 powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemuppc -std=3Dgnu99 object
configure:8630: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -f=
eliminate-unused-debug-types  conftest.c >&5
configure:8633: $? =3D 0
configure:8637: powerpc-poky-linux-nm conftest.o \| sed -n -e 's/^.*[ ]\([A=
BCDGIRSTW][ABCDGIRSTW]*\)[ ][ ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | s=
ed '/ __gnu_lto/d' \> conftest.nm
configure:8640: $? =3D 0
configure:8706: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -p=
ipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c =
conftstm.o >&5
configure:8709: $? =3D 0
configure:8747: result: ok
configure:8784: checking for sysroot
configure:8814: result: /home/kyu3/sdb/test/tmp/sysroots/qemuppc
configure:8891: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -f=
eliminate-unused-debug-types  conftest.c >&5
configure:8894: $? =3D 0
configure:9017: checking for powerpc-poky-linux-mt
configure:9047: result: no
configure:9057: checking for mt
configure:9073: found /bin/mt
configure:9084: result: mt
configure:9107: checking if mt is a manifest tool
configure:9113: mt '-?'
mt: invalid option -- ?
configure:9121: result: no
configure:9750: checking for dlfcn.h
configure:9750: result: yes
configure:9906: checking for objdir
configure:9921: result: .libs
configure:10188: checking if powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 suppo=
rts -fno-rtti -fno-exceptions
configure:10206: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  -fno-rtti -fno-exceptions conftest.c >&5
cc1: warning: command line option '-fno-rtti' is valid for C++/ObjC++ but n=
ot for C [enabled by default]
configure:10210: $? =3D 0
configure:10223: result: no
configure:10533: checking for powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-f=
loat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 opti=
on to produce PIC
configure:10540: result: -fPIC -DPIC
configure:10548: checking if powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 PIC f=
lag -fPIC -DPIC works
configure:10566: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  -fPIC -DPIC -DPIC conftest.c >&5
configure:10570: $? =3D 0
configure:10583: result: yes
configure:10612: checking if powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 stati=
c flag -static works
configure:10640: result: yes
configure:10655: checking if powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 suppo=
rts -c -o file.o
configure:10676: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  -o out/conftest2.o conftest.c >&5
configure:10680: $? =3D 0
configure:10702: result: yes
configure:10710: checking if powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-fl=
oat --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 suppo=
rts -c -o file.o
configure:10757: result: yes
configure:10790: checking whether the powerpc-poky-linux-gcc -mcpu=3D603e  =
-mhard-float --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgn=
u99 linker (powerpc-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/sysro=
ots/qemuppc) supports shared libraries
configure:11948: result: yes
configure:11985: checking whether -lc should be explicitly linked in
configure:11993: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:11996: $? =3D 0
configure:12011: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -shared  -fPIC -D=
PIC conftest.o  -v -Wl,-soname -Wl,conftest -o conftest 2\>\&1 \| /bin/grep=
  -lc  \>/dev/null 2\>\&1
configure:12014: $? =3D 0
configure:12028: result: no
configure:12193: checking dynamic linker characteristics
configure:12707: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed -Wl,-rpath=
 -Wl,/foo conftest.c  >&5
configure:12707: $? =3D 0
configure:12929: result: GNU/Linux ld.so
configure:13036: checking how to hardcode library paths into programs
configure:13061: result: immediate
configure:13601: checking whether stripping libraries is possible
configure:13606: result: yes
configure:13641: checking if libtool supports shared libraries
configure:13643: result: yes
configure:13646: checking whether to build shared libraries
configure:13667: result: yes
configure:13670: checking whether to build static libraries
configure:13674: result: no
configure:13709: checking whether make sets $(MAKE)
configure:13731: result: yes
configure:13750: checking for powerpc-poky-linux-pkg-config
configure:13780: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/=
bin/pkg-config
configure:13848: checking pkg-config is at least version 0.9.0
configure:13851: result: yes
configure:13863: checking for flex
configure:13879: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/flex
configure:13890: result: flex
configure:13927: flex conftest.l
configure:13931: $? =3D 0
configure:13933: checking lex output file root
configure:13947: result: lex.yy
configure:13952: checking lex library
configure:13966: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
   >&5
/tmp/ccUXiqbu.o: In function `input':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/lex.yy.c:1168: undefined reference to `yywrap'
/tmp/ccUXiqbu.o: In function `yylex':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/lex.yy.c:867: undefined reference to `yywrap'
/tmp/ccUXiqbu.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.l:17: undefined reference to `yywrap'
collect2: ld returned 1 exit status
configure:13966: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
|=20
| #line 3 "lex.yy.c"
|=20
| #define  YY_INT_ALIGNED short int
|=20
| /* A lexical scanner generated by flex */
|=20
| #define FLEX_SCANNER
| #define YY_FLEX_MAJOR_VERSION 2
| #define YY_FLEX_MINOR_VERSION 5
| #define YY_FLEX_SUBMINOR_VERSION 35
| #if YY_FLEX_SUBMINOR_VERSION > 0
| #define FLEX_BETA
| #endif
|=20
| /* First, we deal with  platform-specific or compiler-specific issues. */
|=20
| /* begin standard C headers. */
| #include <stdio.h>
| #include <string.h>
| #include <errno.h>
| #include <stdlib.h>
|=20
| /* end standard C headers. */
|=20
| /* flex integer type definitions */
|=20
| #ifndef FLEXINT_H
| #define FLEXINT_H
|=20
| /* C99 systems have <inttypes.h>. Non-C99 systems may or may not. */
|=20
| #if defined (__STDC_VERSION__) && __STDC_VERSION__ >=3D 199901L
|=20
| /* C99 says to define __STDC_LIMIT_MACROS before including stdint.h,
|  * if you want the limit (max/min) macros for int types.=20
|  */
| #ifndef __STDC_LIMIT_MACROS
| #define __STDC_LIMIT_MACROS 1
| #endif
|=20
| #include <inttypes.h>
| typedef int8_t flex_int8_t;
| typedef uint8_t flex_uint8_t;
| typedef int16_t flex_int16_t;
| typedef uint16_t flex_uint16_t;
| typedef int32_t flex_int32_t;
| typedef uint32_t flex_uint32_t;
| #else
| typedef signed char flex_int8_t;
| typedef short int flex_int16_t;
| typedef int flex_int32_t;
| typedef unsigned char flex_uint8_t;=20
| typedef unsigned short int flex_uint16_t;
| typedef unsigned int flex_uint32_t;
| #endif /* ! C99 */
|=20
| /* Limits of integral types. */
| #ifndef INT8_MIN
| #define INT8_MIN               (-128)
| #endif
| #ifndef INT16_MIN
| #define INT16_MIN              (-32767-1)
| #endif
| #ifndef INT32_MIN
| #define INT32_MIN              (-2147483647-1)
| #endif
| #ifndef INT8_MAX
| #define INT8_MAX               (127)
| #endif
| #ifndef INT16_MAX
| #define INT16_MAX              (32767)
| #endif
| #ifndef INT32_MAX
| #define INT32_MAX              (2147483647)
| #endif
| #ifndef UINT8_MAX
| #define UINT8_MAX              (255U)
| #endif
| #ifndef UINT16_MAX
| #define UINT16_MAX             (65535U)
| #endif
| #ifndef UINT32_MAX
| #define UINT32_MAX             (4294967295U)
| #endif
|=20
| #endif /* ! FLEXINT_H */
|=20
| #ifdef __cplusplus
|=20
| /* The "const" storage-class-modifier is valid. */
| #define YY_USE_CONST
|=20
| #else	/* ! __cplusplus */
|=20
| /* C99 requires __STDC__ to be defined as 1. */
| #if defined (__STDC__)
|=20
| #define YY_USE_CONST
|=20
| #endif	/* defined (__STDC__) */
| #endif	/* ! __cplusplus */
|=20
| #ifdef YY_USE_CONST
| #define yyconst const
| #else
| #define yyconst
| #endif
|=20
| /* Returned upon end-of-file. */
| #define YY_NULL 0
|=20
| /* Promotes a possibly negative, possibly signed char to an unsigned
|  * integer for use as an array index.  If the signed char is negative,
|  * we want to instead treat it as an 8-bit unsigned char, hence the
|  * double cast.
|  */
| #define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
|=20
| /* Enter a start condition.  This macro really ought to take a parameter,
|  * but we do it the disgusting crufty way forced on us by the ()-less
|  * definition of BEGIN.
|  */
| #define BEGIN (yy_start) =3D 1 + 2 *
|=20
| /* Translate the current start state into a value that can be later hande=
d
|  * to BEGIN to return to the state.  The YYSTATE alias is for lex
|  * compatibility.
|  */
| #define YY_START (((yy_start) - 1) / 2)
| #define YYSTATE YY_START
|=20
| /* Action number for EOF rule of a given start state. */
| #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
|=20
| /* Special action meaning "start processing a new file". */
| #define YY_NEW_FILE yyrestart(yyin  )
|=20
| #define YY_END_OF_BUFFER_CHAR 0
|=20
| /* Size of default input buffer. */
| #ifndef YY_BUF_SIZE
| #define YY_BUF_SIZE 16384
| #endif
|=20
| /* The state buf must be large enough to hold one state per character in =
the main buffer.
|  */
| #define YY_STATE_BUF_SIZE   ((YY_BUF_SIZE + 2) * sizeof(yy_state_type))
|=20
| #ifndef YY_TYPEDEF_YY_BUFFER_STATE
| #define YY_TYPEDEF_YY_BUFFER_STATE
| typedef struct yy_buffer_state *YY_BUFFER_STATE;
| #endif
|=20
| extern int yyleng;
|=20
| extern FILE *yyin, *yyout;
|=20
| #define EOB_ACT_CONTINUE_SCAN 0
| #define EOB_ACT_END_OF_FILE 1
| #define EOB_ACT_LAST_MATCH 2
|=20
|     #define YY_LESS_LINENO(n)
|    =20
| /* Return all but the first "n" matched characters back to the input stre=
am. */
| #define yyless(n) \
| 	do \
| 		{ \
| 		/* Undo effects of setting up yytext. */ \
|         int yyless_macro_arg =3D (n); \
|         YY_LESS_LINENO(yyless_macro_arg);\
| 		*yy_cp =3D (yy_hold_char); \
| 		YY_RESTORE_YY_MORE_OFFSET \
| 		(yy_c_buf_p) =3D yy_cp =3D yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
| 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
| 		} \
| 	while ( 0 )
|=20
| #define unput(c) yyunput( c, (yytext_ptr)  )
|=20
| #ifndef YY_TYPEDEF_YY_SIZE_T
| #define YY_TYPEDEF_YY_SIZE_T
| typedef size_t yy_size_t;
| #endif
|=20
| #ifndef YY_STRUCT_YY_BUFFER_STATE
| #define YY_STRUCT_YY_BUFFER_STATE
| struct yy_buffer_state
| 	{
| 	FILE *yy_input_file;
|=20
| 	char *yy_ch_buf;		/* input buffer */
| 	char *yy_buf_pos;		/* current position in input buffer */
|=20
| 	/* Size of input buffer in bytes, not including room for EOB
| 	 * characters.
| 	 */
| 	yy_size_t yy_buf_size;
|=20
| 	/* Number of characters read into yy_ch_buf, not including EOB
| 	 * characters.
| 	 */
| 	int yy_n_chars;
|=20
| 	/* Whether we "own" the buffer - i.e., we know we created it,
| 	 * and can realloc() it to grow it, and should free() it to
| 	 * delete it.
| 	 */
| 	int yy_is_our_buffer;
|=20
| 	/* Whether this is an "interactive" input source; if so, and
| 	 * if we're using stdio for input, then we want to use getc()
| 	 * instead of fread(), to make sure we stop fetching input after
| 	 * each newline.
| 	 */
| 	int yy_is_interactive;
|=20
| 	/* Whether we're considered to be at the beginning of a line.
| 	 * If so, '^' rules will be active on the next match, otherwise
| 	 * not.
| 	 */
| 	int yy_at_bol;
|=20
|     int yy_bs_lineno; /**< The line count. */
|     int yy_bs_column; /**< The column count. */
|    =20
| 	/* Whether to try to fill the input buffer when we reach the
| 	 * end of it.
| 	 */
| 	int yy_fill_buffer;
|=20
| 	int yy_buffer_status;
|=20
| #define YY_BUFFER_NEW 0
| #define YY_BUFFER_NORMAL 1
| 	/* When an EOF's been seen but there's still some text to process
| 	 * then we mark the buffer as YY_EOF_PENDING, to indicate that we
| 	 * shouldn't try reading from the input source any more.  We might
| 	 * still have a bunch of tokens to match, though, because of
| 	 * possible backing-up.
| 	 *
| 	 * When we actually see the EOF, we change the status to "new"
| 	 * (via yyrestart()), so that the user can continue scanning by
| 	 * just pointing yyin at a new input file.
| 	 */
| #define YY_BUFFER_EOF_PENDING 2
|=20
| 	};
| #endif /* !YY_STRUCT_YY_BUFFER_STATE */
|=20
| /* Stack of input buffers. */
| static size_t yy_buffer_stack_top =3D 0; /**< index of top of stack. */
| static size_t yy_buffer_stack_max =3D 0; /**< capacity of stack. */
| static YY_BUFFER_STATE * yy_buffer_stack =3D 0; /**< Stack as an array. *=
/
|=20
| /* We provide macros for accessing buffer states in case in the
|  * future we want to put the buffer states in a more general
|  * "scanner state".
|  *
|  * Returns the top of the stack, or NULL.
|  */
| #define YY_CURRENT_BUFFER ( (yy_buffer_stack) \
|                           ? (yy_buffer_stack)[(yy_buffer_stack_top)] \
|                           : NULL)
|=20
| /* Same as previous macro, but useful when we know that the buffer stack =
is not
|  * NULL or when we need an lvalue. For internal use only.
|  */
| #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
|=20
| /* yy_hold_char holds the character lost when yytext is formed. */
| static char yy_hold_char;
| static int yy_n_chars;		/* number of characters read into yy_ch_buf */
| int yyleng;
|=20
| /* Points to current character in buffer. */
| static char *yy_c_buf_p =3D (char *) 0;
| static int yy_init =3D 0;		/* whether we need to initialize */
| static int yy_start =3D 0;	/* start state number */
|=20
| /* Flag which is used to allow yywrap()'s to do buffer switches
|  * instead of setting up a fresh yyin.  A bit of a hack ...
|  */
| static int yy_did_buffer_switch_on_eof;
|=20
| void yyrestart (FILE *input_file  );
| void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
| YY_BUFFER_STATE yy_create_buffer (FILE *file,int size  );
| void yy_delete_buffer (YY_BUFFER_STATE b  );
| void yy_flush_buffer (YY_BUFFER_STATE b  );
| void yypush_buffer_state (YY_BUFFER_STATE new_buffer  );
| void yypop_buffer_state (void );
|=20
| static void yyensure_buffer_stack (void );
| static void yy_load_buffer_state (void );
| static void yy_init_buffer (YY_BUFFER_STATE b,FILE *file  );
|=20
| #define YY_FLUSH_BUFFER yy_flush_buffer(YY_CURRENT_BUFFER )
|=20
| YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
| YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
| YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,int len  );
|=20
| void *yyalloc (yy_size_t  );
| void *yyrealloc (void *,yy_size_t  );
| void yyfree (void *  );
|=20
| #define yy_new_buffer yy_create_buffer
|=20
| #define yy_set_interactive(is_interactive) \
| 	{ \
| 	if ( ! YY_CURRENT_BUFFER ){ \
|         yyensure_buffer_stack (); \
| 		YY_CURRENT_BUFFER_LVALUE =3D    \
|             yy_create_buffer(yyin,YY_BUF_SIZE ); \
| 	} \
| 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive =3D is_interactive; \
| 	}
|=20
| #define yy_set_bol(at_bol) \
| 	{ \
| 	if ( ! YY_CURRENT_BUFFER ){\
|         yyensure_buffer_stack (); \
| 		YY_CURRENT_BUFFER_LVALUE =3D    \
|             yy_create_buffer(yyin,YY_BUF_SIZE ); \
| 	} \
| 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol =3D at_bol; \
| 	}
|=20
| #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
|=20
| /* Begin user sect3 */
|=20
| typedef unsigned char YY_CHAR;
|=20
| FILE *yyin =3D (FILE *) 0, *yyout =3D (FILE *) 0;
|=20
| typedef int yy_state_type;
|=20
| extern int yylineno;
|=20
| int yylineno =3D 1;
|=20
| extern char *yytext;
| #define yytext_ptr yytext
|=20
| static yy_state_type yy_get_previous_state (void );
| static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
| static int yy_get_next_buffer (void );
| static void yy_fatal_error (yyconst char msg[]  );
|=20
| /* Done after the current pattern has been matched and before the
|  * corresponding action - sets up yytext.
|  */
| #define YY_DO_BEFORE_ACTION \
| 	(yytext_ptr) =3D yy_bp; \
| 	(yytext_ptr) -=3D (yy_more_len); \
| 	yyleng =3D (size_t) (yy_cp - (yytext_ptr)); \
| 	(yy_hold_char) =3D *yy_cp; \
| 	*yy_cp =3D '\0'; \
| 	(yy_c_buf_p) =3D yy_cp;
|=20
| #define YY_NUM_RULES 8
| #define YY_END_OF_BUFFER 9
| /* This struct is not used in this scanner,
|    but its presence is necessary. */
| struct yy_trans_info
| 	{
| 	flex_int32_t yy_verify;
| 	flex_int32_t yy_nxt;
| 	};
| static yyconst flex_int16_t yy_acclist[23] =3D
|     {   0,
|         9,    7,    8,    8,    1,    7,    8,    2,    7,    8,
|         3,    7,    8,    4,    7,    8,    5,    7,    8,    6,
|         7,    8
|     } ;
|=20
| static yyconst flex_int16_t yy_accept[14] =3D
|     {   0,
|         1,    1,    1,    2,    4,    5,    8,   11,   14,   17,
|        20,   23,   23
|     } ;
|=20
| static yyconst flex_int32_t yy_ec[256] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    3,    4,    5,    6,
|=20
|         7,    8,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|=20
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1
|     } ;
|=20
| static yyconst flex_int32_t yy_meta[9] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1
|     } ;
|=20
| static yyconst flex_int16_t yy_base[13] =3D
|     {   0,
|         0,    0,    9,   10,   10,   10,   10,   10,   10,   10,
|        10,   10
|     } ;
|=20
| static yyconst flex_int16_t yy_def[13] =3D
|     {   0,
|        12,    1,   12,   12,   12,   12,   12,   12,   12,   12,
|        12,    0
|     } ;
|=20
| static yyconst flex_int16_t yy_nxt[19] =3D
|     {   0,
|         4,    5,    6,    7,    8,    9,   10,   11,   12,    3,
|        12,   12,   12,   12,   12,   12,   12,   12
|     } ;
|=20
| static yyconst flex_int16_t yy_chk[19] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1,    3,   12,
|        12,   12,   12,   12,   12,   12,   12,   12
|     } ;
|=20
| extern int yy_flex_debug;
| int yy_flex_debug =3D 0;
|=20
| static yy_state_type *yy_state_buf=3D0, *yy_state_ptr=3D0;
| static char *yy_full_match;
| static int yy_lp;
| #define REJECT \
| { \
| *yy_cp =3D (yy_hold_char); /* undo effects of setting up yytext */ \
| yy_cp =3D (yy_full_match); /* restore poss. backed-over text */ \
| ++(yy_lp); \
| goto find_rule; \
| }
|=20
| static int yy_more_flag =3D 0;
| static int yy_more_len =3D 0;
| #define yymore() ((yy_more_flag) =3D 1)
| #define YY_MORE_ADJ (yy_more_len)
| #define YY_RESTORE_YY_MORE_OFFSET
| char *yytext;
| #line 1 "conftest.l"
| #line 468 "lex.yy.c"
|=20
| #define INITIAL 0
|=20
| #ifndef YY_NO_UNISTD_H
| /* Special case for "unistd.h", since it is non-ANSI. We include it way
|  * down here because we want the user's section 1 to have been scanned fi=
rst.
|  * The user has a chance to override it with an option.
|  */
| #include <unistd.h>
| #endif
|=20
| #ifndef YY_EXTRA_TYPE
| #define YY_EXTRA_TYPE void *
| #endif
|=20
| static int yy_init_globals (void );
|=20
| /* Accessor methods to globals.
|    These are made visible to non-reentrant scanners for convenience. */
|=20
| int yylex_destroy (void );
|=20
| int yyget_debug (void );
|=20
| void yyset_debug (int debug_flag  );
|=20
| YY_EXTRA_TYPE yyget_extra (void );
|=20
| void yyset_extra (YY_EXTRA_TYPE user_defined  );
|=20
| FILE *yyget_in (void );
|=20
| void yyset_in  (FILE * in_str  );
|=20
| FILE *yyget_out (void );
|=20
| void yyset_out  (FILE * out_str  );
|=20
| int yyget_leng (void );
|=20
| char *yyget_text (void );
|=20
| int yyget_lineno (void );
|=20
| void yyset_lineno (int line_number  );
|=20
| /* Macros after this point can all be overridden by user definitions in
|  * section 1.
|  */
|=20
| #ifndef YY_SKIP_YYWRAP
| #ifdef __cplusplus
| extern "C" int yywrap (void );
| #else
| extern int yywrap (void );
| #endif
| #endif
|=20
|     static void yyunput (int c,char *buf_ptr  );
|    =20
| #ifndef yytext_ptr
| static void yy_flex_strncpy (char *,yyconst char *,int );
| #endif
|=20
| #ifdef YY_NEED_STRLEN
| static int yy_flex_strlen (yyconst char * );
| #endif
|=20
| #ifndef YY_NO_INPUT
|=20
| #ifdef __cplusplus
| static int yyinput (void );
| #else
| static int input (void );
| #endif
|=20
| #endif
|=20
| /* Amount of stuff to slurp up with each read. */
| #ifndef YY_READ_BUF_SIZE
| #define YY_READ_BUF_SIZE 8192
| #endif
|=20
| /* Copy whatever the last rule matched to the standard output. */
| #ifndef ECHO
| /* This used to be an fputs(), but since the string might contain NUL's,
|  * we now use fwrite().
|  */
| #define ECHO fwrite( yytext, yyleng, 1, yyout )
| #endif
|=20
| /* Gets input and stuffs it into "buf".  number of characters read, or YY=
_NULL,
|  * is returned in "result".
|  */
| #ifndef YY_INPUT
| #define YY_INPUT(buf,result,max_size) \
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
| 		{ \
| 		int c =3D '*'; \
| 		int n; \
| 		for ( n =3D 0; n < max_size && \
| 			     (c =3D getc( yyin )) !=3D EOF && c !=3D '\n'; ++n ) \
| 			buf[n] =3D (char) c; \
| 		if ( c =3D=3D '\n' ) \
| 			buf[n++] =3D (char) c; \
| 		if ( c =3D=3D EOF && ferror( yyin ) ) \
| 			YY_FATAL_ERROR( "input in flex scanner failed" ); \
| 		result =3D n; \
| 		} \
| 	else \
| 		{ \
| 		errno=3D0; \
| 		while ( (result =3D fread(buf, 1, max_size, yyin))=3D=3D0 && ferror(yyi=
n)) \
| 			{ \
| 			if( errno !=3D EINTR) \
| 				{ \
| 				YY_FATAL_ERROR( "input in flex scanner failed" ); \
| 				break; \
| 				} \
| 			errno=3D0; \
| 			clearerr(yyin); \
| 			} \
| 		}\
| \
|=20
| #endif
|=20
| /* No semi-colon after return; correct usage is to write "yyterminate();"=
 -
|  * we don't want an extra ';' after the "return" because that will cause
|  * some compilers to complain about unreachable statements.
|  */
| #ifndef yyterminate
| #define yyterminate() return YY_NULL
| #endif
|=20
| /* Number of entries by which start-condition stack grows. */
| #ifndef YY_START_STACK_INCR
| #define YY_START_STACK_INCR 25
| #endif
|=20
| /* Report a fatal error. */
| #ifndef YY_FATAL_ERROR
| #define YY_FATAL_ERROR(msg) yy_fatal_error( msg )
| #endif
|=20
| /* end tables serialization structures and prototypes */
|=20
| /* Default declaration of generated scanner - a define so the user can
|  * easily add parameters.
|  */
| #ifndef YY_DECL
| #define YY_DECL_IS_OURS 1
|=20
| extern int yylex (void);
|=20
| #define YY_DECL int yylex (void)
| #endif /* !YY_DECL */
|=20
| /* Code executed at the beginning of each rule, after yytext and yyleng
|  * have been set up.
|  */
| #ifndef YY_USER_ACTION
| #define YY_USER_ACTION
| #endif
|=20
| /* Code executed at the end of each rule. */
| #ifndef YY_BREAK
| #define YY_BREAK break;
| #endif
|=20
| #define YY_RULE_SETUP \
| 	YY_USER_ACTION
|=20
| /** The main scanner function which does all the work.
|  */
| YY_DECL
| {
| 	register yy_state_type yy_current_state;
| 	register char *yy_cp, *yy_bp;
| 	register int yy_act;
|    =20
| #line 1 "conftest.l"
|=20
| #line 652 "lex.yy.c"
|=20
| 	if ( !(yy_init) )
| 		{
| 		(yy_init) =3D 1;
|=20
| #ifdef YY_USER_INIT
| 		YY_USER_INIT;
| #endif
|=20
|         /* Create the reject buffer large enough to save one state per al=
lowed character. */
|         if ( ! (yy_state_buf) )
|             (yy_state_buf) =3D (yy_state_type *)yyalloc(YY_STATE_BUF_SIZE=
  );
|             if ( ! (yy_state_buf) )
|                 YY_FATAL_ERROR( "out of dynamic memory in yylex()" );
|=20
| 		if ( ! (yy_start) )
| 			(yy_start) =3D 1;	/* first start state */
|=20
| 		if ( ! yyin )
| 			yyin =3D stdin;
|=20
| 		if ( ! yyout )
| 			yyout =3D stdout;
|=20
| 		if ( ! YY_CURRENT_BUFFER ) {
| 			yyensure_buffer_stack ();
| 			YY_CURRENT_BUFFER_LVALUE =3D
| 				yy_create_buffer(yyin,YY_BUF_SIZE );
| 		}
|=20
| 		yy_load_buffer_state( );
| 		}
|=20
| 	while ( 1 )		/* loops until end-of-file is reached */
| 		{
| 		(yy_more_len) =3D 0;
| 		if ( (yy_more_flag) )
| 			{
| 			(yy_more_len) =3D (yy_c_buf_p) - (yytext_ptr);
| 			(yy_more_flag) =3D 0;
| 			}
| 		yy_cp =3D (yy_c_buf_p);
|=20
| 		/* Support of yytext. */
| 		*yy_cp =3D (yy_hold_char);
|=20
| 		/* yy_bp points to the position in yy_ch_buf of the start of
| 		 * the current run.
| 		 */
| 		yy_bp =3D yy_cp;
|=20
| 		yy_current_state =3D (yy_start);
|=20
| 		(yy_state_ptr) =3D (yy_state_buf);
| 		*(yy_state_ptr)++ =3D yy_current_state;
|=20
| yy_match:
| 		do
| 			{
| 			register YY_CHAR yy_c =3D yy_ec[YY_SC_TO_UI(*yy_cp)];
| 			while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state=
 )
| 				{
| 				yy_current_state =3D (int) yy_def[yy_current_state];
| 				if ( yy_current_state >=3D 13 )
| 					yy_c =3D yy_meta[(unsigned int) yy_c];
| 				}
| 			yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int)=
 yy_c];
| 			*(yy_state_ptr)++ =3D yy_current_state;
| 			++yy_cp;
| 			}
| 		while ( yy_base[yy_current_state] !=3D 10 );
|=20
| yy_find_action:
| 		yy_current_state =3D *--(yy_state_ptr);
| 		(yy_lp) =3D yy_accept[yy_current_state];
| find_rule: /* we branch to this label when backing up */
| 		for ( ; ; ) /* until we find what rule we matched */
| 			{
| 			if ( (yy_lp) && (yy_lp) < yy_accept[yy_current_state + 1] )
| 				{
| 				yy_act =3D yy_acclist[(yy_lp)];
| 					{
| 					(yy_full_match) =3D yy_cp;
| 					break;
| 					}
| 				}
| 			--yy_cp;
| 			yy_current_state =3D *--(yy_state_ptr);
| 			(yy_lp) =3D yy_accept[yy_current_state];
| 			}
|=20
| 		YY_DO_BEFORE_ACTION;
|=20
| do_action:	/* This label is used only to access EOF actions. */
|=20
| 		switch ( yy_act )
| 	{ /* beginning of action switch */
| case 1:
| YY_RULE_SETUP
| #line 2 "conftest.l"
| { ECHO; }
| 	YY_BREAK
| case 2:
| YY_RULE_SETUP
| #line 3 "conftest.l"
| { REJECT; }
| 	YY_BREAK
| case 3:
| YY_RULE_SETUP
| #line 4 "conftest.l"
| { yymore (); }
| 	YY_BREAK
| case 4:
| YY_RULE_SETUP
| #line 5 "conftest.l"
| { yyless (1); }
| 	YY_BREAK
| case 5:
| YY_RULE_SETUP
| #line 6 "conftest.l"
| { yyless (input () !=3D 0); }
| 	YY_BREAK
| case 6:
| YY_RULE_SETUP
| #line 7 "conftest.l"
| { unput (yytext[0]); }
| 	YY_BREAK
| case 7:
| YY_RULE_SETUP
| #line 8 "conftest.l"
| { BEGIN INITIAL; }
| 	YY_BREAK
| case 8:
| YY_RULE_SETUP
| #line 9 "conftest.l"
| ECHO;
| 	YY_BREAK
| #line 790 "lex.yy.c"
| 			case YY_STATE_EOF(INITIAL):
| 				yyterminate();
|=20
| 	case YY_END_OF_BUFFER:
| 		{
| 		/* Amount of text matched not including the EOB char. */
| 		int yy_amount_of_matched_text =3D (int) (yy_cp - (yytext_ptr)) - 1;
|=20
| 		/* Undo the effects of YY_DO_BEFORE_ACTION. */
| 		*yy_cp =3D (yy_hold_char);
| 		YY_RESTORE_YY_MORE_OFFSET
|=20
| 		if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D=3D YY_BUFFER_NEW )
| 			{
| 			/* We're scanning a new file or input source.  It's
| 			 * possible that this happened because the user
| 			 * just pointed yyin at a new source and called
| 			 * yylex().  If so, then we have to assure
| 			 * consistency between YY_CURRENT_BUFFER and our
| 			 * globals.  Here is the right place to do so, because
| 			 * this is the first action (other than possibly a
| 			 * back-up) that will match for the new input source.
| 			 */
| 			(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
| 			YY_CURRENT_BUFFER_LVALUE->yy_input_file =3D yyin;
| 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D YY_BUFFER_NORMAL;
| 			}
|=20
| 		/* Note that here we test for yy_c_buf_p "<=3D" to the position
| 		 * of the first EOB in the buffer, since yy_c_buf_p will
| 		 * already have been incremented past the NUL character
| 		 * (since all states make transitions on EOB to the
| 		 * end-of-buffer state).  Contrast this with the test
| 		 * in input().
| 		 */
| 		if ( (yy_c_buf_p) <=3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars=
)] )
| 			{ /* This was really a NUL. */
| 			yy_state_type yy_next_state;
|=20
| 			(yy_c_buf_p) =3D (yytext_ptr) + yy_amount_of_matched_text;
|=20
| 			yy_current_state =3D yy_get_previous_state(  );
|=20
| 			/* Okay, we're now positioned to make the NUL
| 			 * transition.  We couldn't have
| 			 * yy_get_previous_state() go ahead and do it
| 			 * for us because it doesn't know how to deal
| 			 * with the possibility of jamming (and we don't
| 			 * want to build jamming into it because then it
| 			 * will run more slowly).
| 			 */
|=20
| 			yy_next_state =3D yy_try_NUL_trans( yy_current_state );
|=20
| 			yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
|=20
| 			if ( yy_next_state )
| 				{
| 				/* Consume the NUL. */
| 				yy_cp =3D ++(yy_c_buf_p);
| 				yy_current_state =3D yy_next_state;
| 				goto yy_match;
| 				}
|=20
| 			else
| 				{
| 				yy_cp =3D (yy_c_buf_p);
| 				goto yy_find_action;
| 				}
| 			}
|=20
| 		else switch ( yy_get_next_buffer(  ) )
| 			{
| 			case EOB_ACT_END_OF_FILE:
| 				{
| 				(yy_did_buffer_switch_on_eof) =3D 0;
|=20
| 				if ( yywrap( ) )
| 					{
| 					/* Note: because we've taken care in
| 					 * yy_get_next_buffer() to have set up
| 					 * yytext, we can now set up
| 					 * yy_c_buf_p so that if some total
| 					 * hoser (like flex itself) wants to
| 					 * call the scanner after we return the
| 					 * YY_NULL, it'll still work - another
| 					 * YY_NULL will get returned.
| 					 */
| 					(yy_c_buf_p) =3D (yytext_ptr) + YY_MORE_ADJ;
|=20
| 					yy_act =3D YY_STATE_EOF(YY_START);
| 					goto do_action;
| 					}
|=20
| 				else
| 					{
| 					if ( ! (yy_did_buffer_switch_on_eof) )
| 						YY_NEW_FILE;
| 					}
| 				break;
| 				}
|=20
| 			case EOB_ACT_CONTINUE_SCAN:
| 				(yy_c_buf_p) =3D
| 					(yytext_ptr) + yy_amount_of_matched_text;
|=20
| 				yy_current_state =3D yy_get_previous_state(  );
|=20
| 				yy_cp =3D (yy_c_buf_p);
| 				yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
| 				goto yy_match;
|=20
| 			case EOB_ACT_LAST_MATCH:
| 				(yy_c_buf_p) =3D
| 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)];
|=20
| 				yy_current_state =3D yy_get_previous_state(  );
|=20
| 				yy_cp =3D (yy_c_buf_p);
| 				yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
| 				goto yy_find_action;
| 			}
| 		break;
| 		}
|=20
| 	default:
| 		YY_FATAL_ERROR(
| 			"fatal flex scanner internal error--no action found" );
| 	} /* end of action switch */
| 		} /* end of scanning one token */
| } /* end of yylex */
|=20
| /* yy_get_next_buffer - try to read in a new buffer
|  *
|  * Returns a code representing an action:
|  *	EOB_ACT_LAST_MATCH -
|  *	EOB_ACT_CONTINUE_SCAN - continue scanning from current position
|  *	EOB_ACT_END_OF_FILE - end of file
|  */
| static int yy_get_next_buffer (void)
| {
|     	register char *dest =3D YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
| 	register char *source =3D (yytext_ptr);
| 	register int number_to_move, i;
| 	int ret_val;
|=20
| 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + =
1] )
| 		YY_FATAL_ERROR(
| 		"fatal flex scanner internal error--end of buffer missed" );
|=20
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_fill_buffer =3D=3D 0 )
| 		{ /* Don't try to fill the buffer, so this is an EOF. */
| 		if ( (yy_c_buf_p) - (yytext_ptr) - YY_MORE_ADJ =3D=3D 1 )
| 			{
| 			/* We matched a single character, the EOB, so
| 			 * treat this as a final EOF.
| 			 */
| 			return EOB_ACT_END_OF_FILE;
| 			}
|=20
| 		else
| 			{
| 			/* We matched some text prior to the EOB, first
| 			 * process it.
| 			 */
| 			return EOB_ACT_LAST_MATCH;
| 			}
| 		}
|=20
| 	/* Try to read more data. */
|=20
| 	/* First move last chars to start of buffer. */
| 	number_to_move =3D (int) ((yy_c_buf_p) - (yytext_ptr)) - 1;
|=20
| 	for ( i =3D 0; i < number_to_move; ++i )
| 		*(dest++) =3D *(source++);
|=20
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D=3D YY_BUFFER_EOF_PEN=
DING )
| 		/* don't do the read, it's not guaranteed to return an EOF,
| 		 * just force an EOF
| 		 */
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars) =3D 0;
|=20
| 	else
| 		{
| 			int num_to_read =3D
| 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
|=20
| 		while ( num_to_read <=3D 0 )
| 			{ /* Not enough room in the buffer - grow it. */
|=20
| 			YY_FATAL_ERROR(
| "input buffer overflow, can't enlarge buffer because scanner uses REJECT"=
 );
|=20
| 			}
|=20
| 		if ( num_to_read > YY_READ_BUF_SIZE )
| 			num_to_read =3D YY_READ_BUF_SIZE;
|=20
| 		/* Read in more data. */
| 		YY_INPUT( (&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move]),
| 			(yy_n_chars), (size_t) num_to_read );
|=20
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	if ( (yy_n_chars) =3D=3D 0 )
| 		{
| 		if ( number_to_move =3D=3D YY_MORE_ADJ )
| 			{
| 			ret_val =3D EOB_ACT_END_OF_FILE;
| 			yyrestart(yyin  );
| 			}
|=20
| 		else
| 			{
| 			ret_val =3D EOB_ACT_LAST_MATCH;
| 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D
| 				YY_BUFFER_EOF_PENDING;
| 			}
| 		}
|=20
| 	else
| 		ret_val =3D EOB_ACT_CONTINUE_SCAN;
|=20
| 	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVAL=
UE->yy_buf_size) {
| 		/* Extend the array by 50%, plus the number we really need. */
| 		yy_size_t new_size =3D (yy_n_chars) + number_to_move + ((yy_n_chars) >>=
 1);
| 		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf =3D (char *) yyrealloc((void *) YY_=
CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
| 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
| 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
| 	}
|=20
| 	(yy_n_chars) +=3D number_to_move;
| 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] =3D YY_END_OF_BUFFER_C=
HAR;
| 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] =3D YY_END_OF_BUFF=
ER_CHAR;
|=20
| 	(yytext_ptr) =3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[0];
|=20
| 	return ret_val;
| }
|=20
| /* yy_get_previous_state - get the state just before the EOB char was rea=
ched */
|=20
|     static yy_state_type yy_get_previous_state (void)
| {
| 	register yy_state_type yy_current_state;
| 	register char *yy_cp;
|    =20
| 	yy_current_state =3D (yy_start);
|=20
| 	(yy_state_ptr) =3D (yy_state_buf);
| 	*(yy_state_ptr)++ =3D yy_current_state;
|=20
| 	for ( yy_cp =3D (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_c=
p )
| 		{
| 		register YY_CHAR yy_c =3D (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
| 		while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state =
)
| 			{
| 			yy_current_state =3D (int) yy_def[yy_current_state];
| 			if ( yy_current_state >=3D 13 )
| 				yy_c =3D yy_meta[(unsigned int) yy_c];
| 			}
| 		yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int) =
yy_c];
| 		*(yy_state_ptr)++ =3D yy_current_state;
| 		}
|=20
| 	return yy_current_state;
| }
|=20
| /* yy_try_NUL_trans - try to make a transition on the NUL character
|  *
|  * synopsis
|  *	next_state =3D yy_try_NUL_trans( current_state );
|  */
|     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_stat=
e )
| {
| 	register int yy_is_jam;
|    =20
| 	register YY_CHAR yy_c =3D 1;
| 	while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state )
| 		{
| 		yy_current_state =3D (int) yy_def[yy_current_state];
| 		if ( yy_current_state >=3D 13 )
| 			yy_c =3D yy_meta[(unsigned int) yy_c];
| 		}
| 	yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int) y=
y_c];
| 	yy_is_jam =3D (yy_current_state =3D=3D 12);
| 	if ( ! yy_is_jam )
| 		*(yy_state_ptr)++ =3D yy_current_state;
|=20
| 	return yy_is_jam ? 0 : yy_current_state;
| }
|=20
|     static void yyunput (int c, register char * yy_bp )
| {
| 	register char *yy_cp;
|    =20
|     yy_cp =3D (yy_c_buf_p);
|=20
| 	/* undo effects of setting up yytext */
| 	*yy_cp =3D (yy_hold_char);
|=20
| 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
| 		{ /* need to shift things up to make room */
| 		/* +2 for EOB chars. */
| 		register int number_to_move =3D (yy_n_chars) + 2;
| 		register char *dest =3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
| 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
| 		register char *source =3D
| 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
|=20
| 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
| 			*--dest =3D *--source;
|=20
| 		yy_cp +=3D (int) (dest - source);
| 		yy_bp +=3D (int) (dest - source);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D
| 			(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
|=20
| 		if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
| 			YY_FATAL_ERROR( "flex scanner push-back overflow" );
| 		}
|=20
| 	*--yy_cp =3D (char) c;
|=20
| 	(yytext_ptr) =3D yy_bp;
| 	(yy_hold_char) =3D *yy_cp;
| 	(yy_c_buf_p) =3D yy_cp;
| }
|=20
| #ifndef YY_NO_INPUT
| #ifdef __cplusplus
|     static int yyinput (void)
| #else
|     static int input  (void)
| #endif
|=20
| {
| 	int c;
|    =20
| 	*(yy_c_buf_p) =3D (yy_hold_char);
|=20
| 	if ( *(yy_c_buf_p) =3D=3D YY_END_OF_BUFFER_CHAR )
| 		{
| 		/* yy_c_buf_p now points to the character we want to return.
| 		 * If this occurs *before* the EOB characters, then it's a
| 		 * valid NUL; if not, then we've hit the end of the buffer.
| 		 */
| 		if ( (yy_c_buf_p) < &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] =
)
| 			/* This was really a NUL. */
| 			*(yy_c_buf_p) =3D '\0';
|=20
| 		else
| 			{ /* need more input */
| 			int offset =3D (yy_c_buf_p) - (yytext_ptr);
| 			++(yy_c_buf_p);
|=20
| 			switch ( yy_get_next_buffer(  ) )
| 				{
| 				case EOB_ACT_LAST_MATCH:
| 					/* This happens because yy_g_n_b()
| 					 * sees that we've accumulated a
| 					 * token and flags that we need to
| 					 * try matching the token before
| 					 * proceeding.  But for input(),
| 					 * there's no matching to consider.
| 					 * So convert the EOB_ACT_LAST_MATCH
| 					 * to EOB_ACT_END_OF_FILE.
| 					 */
|=20
| 					/* Reset buffer status. */
| 					yyrestart(yyin );
|=20
| 					/*FALLTHROUGH*/
|=20
| 				case EOB_ACT_END_OF_FILE:
| 					{
| 					if ( yywrap( ) )
| 						return EOF;
|=20
| 					if ( ! (yy_did_buffer_switch_on_eof) )
| 						YY_NEW_FILE;
| #ifdef __cplusplus
| 					return yyinput();
| #else
| 					return input();
| #endif
| 					}
|=20
| 				case EOB_ACT_CONTINUE_SCAN:
| 					(yy_c_buf_p) =3D (yytext_ptr) + offset;
| 					break;
| 				}
| 			}
| 		}
|=20
| 	c =3D *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
| 	*(yy_c_buf_p) =3D '\0';	/* preserve yytext */
| 	(yy_hold_char) =3D *++(yy_c_buf_p);
|=20
| 	return c;
| }
| #endif	/* ifndef YY_NO_INPUT */
|=20
| /** Immediately switch to a different input stream.
|  * @param input_file A readable stream.
|  *=20
|  * @note This function does not reset the start condition to @c INITIAL .
|  */
|     void yyrestart  (FILE * input_file )
| {
|    =20
| 	if ( ! YY_CURRENT_BUFFER ){
|         yyensure_buffer_stack ();
| 		YY_CURRENT_BUFFER_LVALUE =3D
|             yy_create_buffer(yyin,YY_BUF_SIZE );
| 	}
|=20
| 	yy_init_buffer(YY_CURRENT_BUFFER,input_file );
| 	yy_load_buffer_state( );
| }
|=20
| /** Switch to a different input buffer.
|  * @param new_buffer The new input buffer.
|  *=20
|  */
|     void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
| {
|    =20
| 	/* TODO. We should be able to replace this entire function body
| 	 * with
| 	 *		yypop_buffer_state();
| 	 *		yypush_buffer_state(new_buffer);
|      */
| 	yyensure_buffer_stack ();
| 	if ( YY_CURRENT_BUFFER =3D=3D new_buffer )
| 		return;
|=20
| 	if ( YY_CURRENT_BUFFER )
| 		{
| 		/* Flush out information for old buffer. */
| 		*(yy_c_buf_p) =3D (yy_hold_char);
| 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos =3D (yy_c_buf_p);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	YY_CURRENT_BUFFER_LVALUE =3D new_buffer;
| 	yy_load_buffer_state( );
|=20
| 	/* We don't actually know whether we did this switch during
| 	 * EOF (yywrap()) processing, but the only time this flag
| 	 * is looked at is after yywrap() is called, so it's safe
| 	 * to go ahead and always set it.
| 	 */
| 	(yy_did_buffer_switch_on_eof) =3D 1;
| }
|=20
| static void yy_load_buffer_state  (void)
| {
|     	(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
| 	(yytext_ptr) =3D (yy_c_buf_p) =3D YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
| 	yyin =3D YY_CURRENT_BUFFER_LVALUE->yy_input_file;
| 	(yy_hold_char) =3D *(yy_c_buf_p);
| }
|=20
| /** Allocate and initialize an input buffer state.
|  * @param file A readable stream.
|  * @param size The character buffer size in bytes. When in doubt, use @c =
YY_BUF_SIZE.
|  *=20
|  * @return the allocated buffer state.
|  */
|     YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
| {
| 	YY_BUFFER_STATE b;
|    =20
| 	b =3D (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
|=20
| 	b->yy_buf_size =3D size;
|=20
| 	/* yy_ch_buf has to be 2 characters longer than the size given because
| 	 * we need to put in 2 end-of-buffer characters.
| 	 */
| 	b->yy_ch_buf =3D (char *) yyalloc(b->yy_buf_size + 2  );
| 	if ( ! b->yy_ch_buf )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
|=20
| 	b->yy_is_our_buffer =3D 1;
|=20
| 	yy_init_buffer(b,file );
|=20
| 	return b;
| }
|=20
| /** Destroy the buffer.
|  * @param b a buffer created with yy_create_buffer()
|  *=20
|  */
|     void yy_delete_buffer (YY_BUFFER_STATE  b )
| {
|    =20
| 	if ( ! b )
| 		return;
|=20
| 	if ( b =3D=3D YY_CURRENT_BUFFER ) /* Not sure if we should pop here. */
| 		YY_CURRENT_BUFFER_LVALUE =3D (YY_BUFFER_STATE) 0;
|=20
| 	if ( b->yy_is_our_buffer )
| 		yyfree((void *) b->yy_ch_buf  );
|=20
| 	yyfree((void *) b  );
| }
|=20
| #ifndef __cplusplus
| extern int isatty (int );
| #endif /* __cplusplus */
|    =20
| /* Initializes or reinitializes a buffer.
|  * This function is sometimes called more than once on the same buffer,
|  * such as during a yyrestart() or at EOF.
|  */
|     static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
|=20
| {
| 	int oerrno =3D errno;
|    =20
| 	yy_flush_buffer(b );
|=20
| 	b->yy_input_file =3D file;
| 	b->yy_fill_buffer =3D 1;
|=20
|     /* If b is the current buffer, then yy_init_buffer was _probably_
|      * called from yyrestart() or through yy_get_next_buffer.
|      * In that case, we don't want to reset the lineno or column.
|      */
|     if (b !=3D YY_CURRENT_BUFFER){
|         b->yy_bs_lineno =3D 1;
|         b->yy_bs_column =3D 0;
|     }
|=20
|         b->yy_is_interactive =3D file ? (isatty( fileno(file) ) > 0) : 0;
|    =20
| 	errno =3D oerrno;
| }
|=20
| /** Discard all buffered characters. On the next scan, YY_INPUT will be c=
alled.
|  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
|  *=20
|  */
|     void yy_flush_buffer (YY_BUFFER_STATE  b )
| {
|     	if ( ! b )
| 		return;
|=20
| 	b->yy_n_chars =3D 0;
|=20
| 	/* We always need two end-of-buffer characters.  The first causes
| 	 * a transition to the end-of-buffer state.  The second causes
| 	 * a jam in that state.
| 	 */
| 	b->yy_ch_buf[0] =3D YY_END_OF_BUFFER_CHAR;
| 	b->yy_ch_buf[1] =3D YY_END_OF_BUFFER_CHAR;
|=20
| 	b->yy_buf_pos =3D &b->yy_ch_buf[0];
|=20
| 	b->yy_at_bol =3D 1;
| 	b->yy_buffer_status =3D YY_BUFFER_NEW;
|=20
| 	if ( b =3D=3D YY_CURRENT_BUFFER )
| 		yy_load_buffer_state( );
| }
|=20
| /** Pushes the new state onto the stack. The new state becomes
|  *  the current state. This function will allocate the stack
|  *  if necessary.
|  *  @param new_buffer The new state.
|  * =20
|  */
| void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
| {
|     	if (new_buffer =3D=3D NULL)
| 		return;
|=20
| 	yyensure_buffer_stack();
|=20
| 	/* This block is copied from yy_switch_to_buffer. */
| 	if ( YY_CURRENT_BUFFER )
| 		{
| 		/* Flush out information for old buffer. */
| 		*(yy_c_buf_p) =3D (yy_hold_char);
| 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos =3D (yy_c_buf_p);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	/* Only push if top exists. Otherwise, replace top. */
| 	if (YY_CURRENT_BUFFER)
| 		(yy_buffer_stack_top)++;
| 	YY_CURRENT_BUFFER_LVALUE =3D new_buffer;
|=20
| 	/* copied from yy_switch_to_buffer. */
| 	yy_load_buffer_state( );
| 	(yy_did_buffer_switch_on_eof) =3D 1;
| }
|=20
| /** Removes and deletes the top of the stack, if present.
|  *  The next element becomes the new top.
|  * =20
|  */
| void yypop_buffer_state (void)
| {
|     	if (!YY_CURRENT_BUFFER)
| 		return;
|=20
| 	yy_delete_buffer(YY_CURRENT_BUFFER );
| 	YY_CURRENT_BUFFER_LVALUE =3D NULL;
| 	if ((yy_buffer_stack_top) > 0)
| 		--(yy_buffer_stack_top);
|=20
| 	if (YY_CURRENT_BUFFER) {
| 		yy_load_buffer_state( );
| 		(yy_did_buffer_switch_on_eof) =3D 1;
| 	}
| }
|=20
| /* Allocates the stack if it does not exist.
|  *  Guarantees space for at least one push.
|  */
| static void yyensure_buffer_stack (void)
| {
| 	int num_to_alloc;
|    =20
| 	if (!(yy_buffer_stack)) {
|=20
| 		/* First allocation is just for 2 elements, since we don't know if this
| 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
| 		 * immediate realloc on the next call.
|          */
| 		num_to_alloc =3D 1;
| 		(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
| 								(num_to_alloc * sizeof(struct yy_buffer_state*)
| 								);
| 		if ( ! (yy_buffer_stack) )
| 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
| 								 =20
| 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_sta=
te*));
| 			=09
| 		(yy_buffer_stack_max) =3D num_to_alloc;
| 		(yy_buffer_stack_top) =3D 0;
| 		return;
| 	}
|=20
| 	if ((yy_buffer_stack_top) >=3D ((yy_buffer_stack_max)) - 1){
|=20
| 		/* Increase the buffer to prepare for a possible push. */
| 		int grow_size =3D 8 /* arbitrary grow size */;
|=20
| 		num_to_alloc =3D (yy_buffer_stack_max) + grow_size;
| 		(yy_buffer_stack) =3D (struct yy_buffer_state**)yyrealloc
| 								((yy_buffer_stack),
| 								num_to_alloc * sizeof(struct yy_buffer_state*)
| 								);
| 		if ( ! (yy_buffer_stack) )
| 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
|=20
| 		/* zero only the new slots.*/
| 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof=
(struct yy_buffer_state*));
| 		(yy_buffer_stack_max) =3D num_to_alloc;
| 	}
| }
|=20
| /** Setup the input buffer state to scan directly from a user-specified c=
haracter buffer.
|  * @param base the character buffer
|  * @param size the size in bytes of the character buffer
|  *=20
|  * @return the newly allocated buffer state object.=20
|  */
| YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
| {
| 	YY_BUFFER_STATE b;
|    =20
| 	if ( size < 2 ||
| 	     base[size-2] !=3D YY_END_OF_BUFFER_CHAR ||
| 	     base[size-1] !=3D YY_END_OF_BUFFER_CHAR )
| 		/* They forgot to leave room for the EOB's. */
| 		return 0;
|=20
| 	b =3D (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
|=20
| 	b->yy_buf_size =3D size - 2;	/* "- 2" to take care of EOB's */
| 	b->yy_buf_pos =3D b->yy_ch_buf =3D base;
| 	b->yy_is_our_buffer =3D 0;
| 	b->yy_input_file =3D 0;
| 	b->yy_n_chars =3D b->yy_buf_size;
| 	b->yy_is_interactive =3D 0;
| 	b->yy_at_bol =3D 1;
| 	b->yy_fill_buffer =3D 0;
| 	b->yy_buffer_status =3D YY_BUFFER_NEW;
|=20
| 	yy_switch_to_buffer(b  );
|=20
| 	return b;
| }
|=20
| /** Setup the input buffer state to scan a string. The next call to yylex=
() will
|  * scan from a @e copy of @a str.
|  * @param yystr a NUL-terminated string to scan
|  *=20
|  * @return the newly allocated buffer state object.
|  * @note If you want to scan bytes that may contain NUL values, then use
|  *       yy_scan_bytes() instead.
|  */
| YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
| {
|    =20
| 	return yy_scan_bytes(yystr,strlen(yystr) );
| }
|=20
| /** Setup the input buffer state to scan the given bytes. The next call t=
o yylex() will
|  * scan from a @e copy of @a bytes.
|  * @param bytes the byte buffer to scan
|  * @param len the number of bytes in the buffer pointed to by @a bytes.
|  *=20
|  * @return the newly allocated buffer state object.
|  */
| YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len=
 )
| {
| 	YY_BUFFER_STATE b;
| 	char *buf;
| 	yy_size_t n;
| 	int i;
|    =20
| 	/* Get memory for full buffer, including space for trailing EOB's. */
| 	n =3D _yybytes_len + 2;
| 	buf =3D (char *) yyalloc(n  );
| 	if ( ! buf )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
|=20
| 	for ( i =3D 0; i < _yybytes_len; ++i )
| 		buf[i] =3D yybytes[i];
|=20
| 	buf[_yybytes_len] =3D buf[_yybytes_len+1] =3D YY_END_OF_BUFFER_CHAR;
|=20
| 	b =3D yy_scan_buffer(buf,n );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
|=20
| 	/* It's okay to grow etc. this buffer, and we should throw it
| 	 * away when we're done.
| 	 */
| 	b->yy_is_our_buffer =3D 1;
|=20
| 	return b;
| }
|=20
| #ifndef YY_EXIT_FAILURE
| #define YY_EXIT_FAILURE 2
| #endif
|=20
| static void yy_fatal_error (yyconst char* msg )
| {
|     	(void) fprintf( stderr, "%s\n", msg );
| 	exit( YY_EXIT_FAILURE );
| }
|=20
| /* Redefine yyless() so it works in section 3 code. */
|=20
| #undef yyless
| #define yyless(n) \
| 	do \
| 		{ \
| 		/* Undo effects of setting up yytext. */ \
|         int yyless_macro_arg =3D (n); \
|         YY_LESS_LINENO(yyless_macro_arg);\
| 		yytext[yyleng] =3D (yy_hold_char); \
| 		(yy_c_buf_p) =3D yytext + yyless_macro_arg; \
| 		(yy_hold_char) =3D *(yy_c_buf_p); \
| 		*(yy_c_buf_p) =3D '\0'; \
| 		yyleng =3D yyless_macro_arg; \
| 		} \
| 	while ( 0 )
|=20
| /* Accessor  methods (get/set functions) to struct members. */
|=20
| /** Get the current line number.
|  *=20
|  */
| int yyget_lineno  (void)
| {
|        =20
|     return yylineno;
| }
|=20
| /** Get the input stream.
|  *=20
|  */
| FILE *yyget_in  (void)
| {
|         return yyin;
| }
|=20
| /** Get the output stream.
|  *=20
|  */
| FILE *yyget_out  (void)
| {
|         return yyout;
| }
|=20
| /** Get the length of the current token.
|  *=20
|  */
| int yyget_leng  (void)
| {
|         return yyleng;
| }
|=20
| /** Get the current token.
|  *=20
|  */
|=20
| char *yyget_text  (void)
| {
|         return yytext;
| }
|=20
| /** Set the current line number.
|  * @param line_number
|  *=20
|  */
| void yyset_lineno (int  line_number )
| {
|    =20
|     yylineno =3D line_number;
| }
|=20
| /** Set the input stream. This does not discard the current
|  * input buffer.
|  * @param in_str A readable stream.
|  *=20
|  * @see yy_switch_to_buffer
|  */
| void yyset_in (FILE *  in_str )
| {
|         yyin =3D in_str ;
| }
|=20
| void yyset_out (FILE *  out_str )
| {
|         yyout =3D out_str ;
| }
|=20
| int yyget_debug  (void)
| {
|         return yy_flex_debug;
| }
|=20
| void yyset_debug (int  bdebug )
| {
|         yy_flex_debug =3D bdebug ;
| }
|=20
| static int yy_init_globals (void)
| {
|         /* Initialization is the same as for the non-reentrant scanner.
|      * This function is called from yylex_destroy(), so don't allocate he=
re.
|      */
|=20
|     (yy_buffer_stack) =3D 0;
|     (yy_buffer_stack_top) =3D 0;
|     (yy_buffer_stack_max) =3D 0;
|     (yy_c_buf_p) =3D (char *) 0;
|     (yy_init) =3D 0;
|     (yy_start) =3D 0;
|=20
|     (yy_state_buf) =3D 0;
|     (yy_state_ptr) =3D 0;
|     (yy_full_match) =3D 0;
|     (yy_lp) =3D 0;
|=20
| /* Defined in main.c */
| #ifdef YY_STDINIT
|     yyin =3D stdin;
|     yyout =3D stdout;
| #else
|     yyin =3D (FILE *) 0;
|     yyout =3D (FILE *) 0;
| #endif
|=20
|     /* For future reference: Set errno on error, since we are called by
|      * yylex_init()
|      */
|     return 0;
| }
|=20
| /* yylex_destroy is for both reentrant and non-reentrant scanners. */
| int yylex_destroy  (void)
| {
|    =20
|     /* Pop the buffer stack, destroying each element. */
| 	while(YY_CURRENT_BUFFER){
| 		yy_delete_buffer(YY_CURRENT_BUFFER  );
| 		YY_CURRENT_BUFFER_LVALUE =3D NULL;
| 		yypop_buffer_state();
| 	}
|=20
| 	/* Destroy the stack itself. */
| 	yyfree((yy_buffer_stack) );
| 	(yy_buffer_stack) =3D NULL;
|=20
|     yyfree ( (yy_state_buf) );
|     (yy_state_buf)  =3D NULL;
|=20
|     /* Reset the globals. This is important in a non-reentrant scanner so=
 the next time
|      * yylex() is called, initialization will occur. */
|     yy_init_globals( );
|=20
|     return 0;
| }
|=20
| /*
|  * Internal utility routines.
|  */
|=20
| #ifndef yytext_ptr
| static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
| {
| 	register int i;
| 	for ( i =3D 0; i < n; ++i )
| 		s1[i] =3D s2[i];
| }
| #endif
|=20
| #ifdef YY_NEED_STRLEN
| static int yy_flex_strlen (yyconst char * s )
| {
| 	register int n;
| 	for ( n =3D 0; s[n]; ++n )
| 		;
|=20
| 	return n;
| }
| #endif
|=20
| void *yyalloc (yy_size_t  size )
| {
| 	return (void *) malloc( size );
| }
|=20
| void *yyrealloc  (void * ptr, yy_size_t  size )
| {
| 	/* The cast to (char *) in the following accommodates both
| 	 * implementations that use char* generic pointers, and those
| 	 * that use void* generic pointers.  It works with the latter
| 	 * because both ANSI C and C++ allow castless assignment from
| 	 * any pointer type to void*, and deal with argument conversions
| 	 * as though doing an assignment.
| 	 */
| 	return (void *) realloc( (char *) ptr, size );
| }
|=20
| void yyfree (void * ptr )
| {
| 	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
| }
|=20
| #define YYTABLES_NAME "yytables"
|=20
| #line 9 "conftest.l"
|=20
|=20
| #ifdef YYTEXT_POINTER
| extern char *yytext;
| #endif
| int
| main (void)
| {
|   return ! yylex () + ! yywrap ();
| }
configure:13966: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lfl  >&5
configure:13966: $? =3D 0
configure:13976: result: -lfl
configure:13982: checking whether yytext is a pointer
configure:13998: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lfl  >&5
configure:13998: $? =3D 0
configure:14006: result: yes
configure:14020: checking for bison
configure:14036: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/bison
configure:14047: result: bison -y
configure:14066: checking for special C compiler options needed for large f=
iles
configure:14111: result: no
configure:14117: checking for _FILE_OFFSET_BITS value needed for large file=
s
configure:14142: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:33:3: warning: left shift count >=3D width of type [enabled by d=
efault]
conftest.c:33:3: warning: left shift count >=3D width of type [enabled by d=
efault]
conftest.c:34:10: warning: left shift count >=3D width of type [enabled by =
default]
conftest.c:34:10: warning: left shift count >=3D width of type [enabled by =
default]
conftest.c:33:7: error: size of array 'off_t_is_large' is negative
conftest.c:35:9: warning: variably modified 'off_t_is_large' at file scope =
[enabled by default]
configure:14142: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| /* end confdefs.h.  */
| #include <sys/types.h>
|  /* Check that off_t can represent 2**63 - 1 correctly.
|     We can't simply define LARGE_OFF_T to be 9223372036854775807,
|     since some C++ compilers masquerading as C compilers
|     incorrectly reject 9223372036854775807.  */
| #define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
|   int off_t_is_large[(LARGE_OFF_T % 2147483629 =3D=3D 721
| 		       && LARGE_OFF_T % 2147483647 =3D=3D 1)
| 		      ? 1 : -1];
| int
| main ()
| {
|=20
|   ;
|   return 0;
| }
configure:14166: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:14166: $? =3D 0
configure:14174: result: 64
configure:14263: checking for cpp
configure:14282: found /usr/bin/cpp
configure:14294: result: /usr/bin/cpp
configure:14310: checking if /usr/bin/cpp requires -undef
configure:14322: result: yes
configure:14335: checking if /usr/bin/cpp requires -traditional
configure:14347: result: yes
configure:14372: checking for dtrace
configure:14404: result: not_found
configure:14470: checking for dirent.h that defines DIR
configure:14489: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:14489: $? =3D 0
configure:14497: result: yes
configure:14511: checking for library containing opendir
configure:14542: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
configure:14542: $? =3D 0
configure:14559: result: none required
configure:14626: checking for ANSI C header files
configure:14730: result: yes
configure:14741: checking for fcntl.h
configure:14741: result: yes
configure:14741: checking for stdlib.h
configure:14741: result: yes
configure:14741: checking for string.h
configure:14741: result: yes
configure:14741: checking for unistd.h
configure:14741: result: yes
configure:14741: checking for dlfcn.h
configure:14741: result: yes
configure:14741: checking for stropts.h
configure:14741: result: yes
configure:14741: checking fnmatch.h usability
configure:14741: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:14741: $? =3D 0
configure:14741: result: yes
configure:14741: checking fnmatch.h presence
configure:14741: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
configure:14741: $? =3D 0
configure:14741: result: yes
configure:14741: checking for fnmatch.h
configure:14741: result: yes
configure:14741: checking for sys/utsname.h
configure:14741: result: yes
configure:14753: checking for an ANSI C-conforming const
configure:14818: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:14818: $? =3D 0
configure:14825: result: yes
configure:14833: checking whether byte ordering is bigendian
configure:15039: result: yes
configure:15061: checking size of unsigned long
configure:15081: result: 4
configure:15097: checking for pid_t
configure:15097: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:15097: $? =3D 0
configure:15097: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:75:20: error: expected expression before ')' token
configure:15097: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| int
| main ()
| {
| if (sizeof ((pid_t)))
| 	    return 0;
|   ;
|   return 0;
| }
configure:15097: result: yes
configure:15119: checking for byteswap.h
configure:15119: result: yes
configure:15131: checking sys/endian.h usability
configure:15131: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:73:24: fatal error: sys/endian.h: No such file or directory
compilation terminated.
configure:15131: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/endian.h>
configure:15131: result: no
configure:15131: checking sys/endian.h presence
configure:15131: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:40:24: fatal error: sys/endian.h: No such file or directory
compilation terminated.
configure:15131: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| #include <sys/endian.h>
configure:15131: result: no
configure:15131: checking for sys/endian.h
configure:15131: result: no
configure:15235: checking for dlopen
configure:15235: result: yes
configure:15285: checking for vprintf
configure:15285: result: yes
configure:15291: checking for _doprnt
configure:15291: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccBQkkuG.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:75: undefined reference to `_doprnt'
collect2: ld returned 1 exit status
configure:15291: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| /* end confdefs.h.  */
| /* Define _doprnt to an innocuous variant, in case <limits.h> declares _d=
oprnt.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define _doprnt innocuous__doprnt
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char _doprnt (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef _doprnt
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char _doprnt ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub__doprnt || defined __stub____doprnt
| choke me
| #endif
|=20
| int
| main ()
| {
| return _doprnt ();
|   ;
|   return 0;
| }
configure:15291: result: no
configure:15307: checking for geteuid
configure:15307: result: yes
configure:15307: checking for getuid
configure:15307: result: yes
configure:15307: checking for link
configure:15307: result: yes
configure:15307: checking for memmove
configure:15307: result: yes
configure:15307: checking for memset
configure:15307: result: yes
configure:15307: checking for mkstemp
configure:15307: result: yes
configure:15307: checking for strchr
configure:15307: result: yes
configure:15307: checking for strrchr
configure:15307: result: yes
configure:15307: checking for strtol
configure:15307: result: yes
configure:15307: checking for getopt
configure:15307: result: yes
configure:15307: checking for getopt_long
configure:15307: result: yes
configure:15307: checking for vsnprintf
configure:15307: result: yes
configure:15307: checking for walkcontext
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccvd3Q7P.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:87: undefined reference to `walkcontext'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| /* end confdefs.h.  */
| /* Define walkcontext to an innocuous variant, in case <limits.h> declare=
s walkcontext.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define walkcontext innocuous_walkcontext
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char walkcontext (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef walkcontext
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char walkcontext ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_walkcontext || defined __stub___walkcontext
| choke me
| #endif
|=20
| int
| main ()
| {
| return walkcontext ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for backtrace
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
configure:15307: $? =3D 0
configure:15307: result: yes
configure:15307: checking for getisax
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccRHIKWT.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:88: undefined reference to `getisax'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define getisax to an innocuous variant, in case <limits.h> declares ge=
tisax.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getisax innocuous_getisax
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getisax (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getisax
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getisax ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getisax || defined __stub___getisax
| choke me
| #endif
|=20
| int
| main ()
| {
| return getisax ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for getzoneid
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccRinmSW.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:88: undefined reference to `getzoneid'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define getzoneid to an innocuous variant, in case <limits.h> declares =
getzoneid.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getzoneid innocuous_getzoneid
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getzoneid (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getzoneid
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getzoneid ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getzoneid || defined __stub___getzoneid
| choke me
| #endif
|=20
| int
| main ()
| {
| return getzoneid ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for shmctl64
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccRPn9c2.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:88: undefined reference to `shmctl64'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define shmctl64 to an innocuous variant, in case <limits.h> declares s=
hmctl64.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define shmctl64 innocuous_shmctl64
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char shmctl64 (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef shmctl64
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shmctl64 ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_shmctl64 || defined __stub___shmctl64
| choke me
| #endif
|=20
| int
| main ()
| {
| return shmctl64 ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for strcasestr
configure:15307: result: yes
configure:15307: checking for ffs
configure:15307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
conftest.c:78:6: warning: conflicting types for built-in function 'ffs' [en=
abled by default]
configure:15307: $? =3D 0
configure:15307: result: yes
configure:15307: checking for vasprintf
configure:15307: result: yes
configure:15319: checking for working alloca.h
configure:15336: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
configure:15336: $? =3D 0
configure:15344: result: yes
configure:15352: checking for alloca
configure:15389: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
configure:15389: $? =3D 0
configure:15397: result: yes
configure:15507: checking for getdtablesize
configure:15507: result: yes
configure:15514: checking for getifaddrs
configure:15514: result: yes
configure:15521: checking for getpeereid
configure:15521: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/cc9jYJQe.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:95: undefined reference to `getpeereid'
collect2: ld returned 1 exit status
configure:15521: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define getpeereid to an innocuous variant, in case <limits.h> declares=
 getpeereid.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getpeereid innocuous_getpeereid
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getpeereid (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getpeereid
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getpeereid ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getpeereid || defined __stub___getpeereid
| choke me
| #endif
|=20
| int
| main ()
| {
| return getpeereid ();
|   ;
|   return 0;
| }
configure:15521: result: no
configure:15528: checking for getpeerucred
configure:15528: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/cc5Jpqvh.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:95: undefined reference to `getpeerucred'
collect2: ld returned 1 exit status
configure:15528: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define getpeerucred to an innocuous variant, in case <limits.h> declar=
es getpeerucred.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getpeerucred innocuous_getpeerucred
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getpeerucred (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getpeerucred
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getpeerucred ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getpeerucred || defined __stub___getpeerucred
| choke me
| #endif
|=20
| int
| main ()
| {
| return getpeerucred ();
|   ;
|   return 0;
| }
configure:15528: result: no
configure:15535: checking for strlcat
configure:15535: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccrnWdgi.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:95: undefined reference to `strlcat'
collect2: ld returned 1 exit status
configure:15535: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define strlcat to an innocuous variant, in case <limits.h> declares st=
rlcat.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define strlcat innocuous_strlcat
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char strlcat (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef strlcat
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char strlcat ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_strlcat || defined __stub___strlcat
| choke me
| #endif
|=20
| int
| main ()
| {
| return strlcat ();
|   ;
|   return 0;
| }
configure:15535: result: no
configure:15550: checking for strlcpy
configure:15550: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
  >&5
/tmp/ccC9QJrl.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:95: undefined reference to `strlcpy'
collect2: ld returned 1 exit status
configure:15550: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define strlcpy to an innocuous variant, in case <limits.h> declares st=
rlcpy.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define strlcpy innocuous_strlcpy
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char strlcpy (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef strlcpy
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char strlcpy ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_strlcpy || defined __stub___strlcpy
| choke me
| #endif
|=20
| int
| main ()
| {
| return strlcpy ();
|   ;
|   return 0;
| }
configure:15550: result: no
configure:15567: checking for mmap
configure:15567: result: yes
configure:15575: checking for sqrt in -lm
configure:15600: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm   >&5
conftest.c:69:6: warning: conflicting types for built-in function 'sqrt' [e=
nabled by default]
configure:15600: $? =3D 0
configure:15609: result: yes
configure:15620: checking for cbrt in -lm
configure:15645: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  -lm  >&5
conftest.c:70:6: warning: conflicting types for built-in function 'cbrt' [e=
nabled by default]
configure:15645: $? =3D 0
configure:15654: result: yes
configure:15666: checking ndbm.h usability
configure:15666: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:97:18: fatal error: ndbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <ndbm.h>
configure:15666: result: no
configure:15666: checking ndbm.h presence
configure:15666: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:64:18: fatal error: ndbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <ndbm.h>
configure:15666: result: no
configure:15666: checking for ndbm.h
configure:15666: result: no
configure:15666: checking dbm.h usability
configure:15666: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:97:17: fatal error: dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <dbm.h>
configure:15666: result: no
configure:15666: checking dbm.h presence
configure:15666: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:64:17: fatal error: dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <dbm.h>
configure:15666: result: no
configure:15666: checking for dbm.h
configure:15666: result: no
configure:15666: checking rpcsvc/dbm.h usability
configure:15666: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:97:24: fatal error: rpcsvc/dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <rpcsvc/dbm.h>
configure:15666: result: no
configure:15666: checking rpcsvc/dbm.h presence
configure:15666: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:64:24: fatal error: rpcsvc/dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <rpcsvc/dbm.h>
configure:15666: result: no
configure:15666: checking for rpcsvc/dbm.h
configure:15666: result: no
configure:15681: checking linux/agpgart.h usability
configure:15681: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:15681: $? =3D 0
configure:15681: result: yes
configure:15681: checking linux/agpgart.h presence
configure:15681: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
configure:15681: $? =3D 0
configure:15681: result: yes
configure:15681: checking for linux/agpgart.h
configure:15681: result: yes
configure:15681: checking sys/agpio.h usability
configure:15681: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:98:23: fatal error: sys/agpio.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/agpio.h>
configure:15681: result: no
configure:15681: checking sys/agpio.h presence
configure:15681: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:65:23: fatal error: sys/agpio.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <sys/agpio.h>
configure:15681: result: no
configure:15681: checking for sys/agpio.h
configure:15681: result: no
configure:15681: checking sys/agpgart.h usability
configure:15681: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:98:25: fatal error: sys/agpgart.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/agpgart.h>
configure:15681: result: no
configure:15681: checking sys/agpgart.h presence
configure:15681: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:65:25: fatal error: sys/agpgart.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <sys/agpgart.h>
configure:15681: result: no
configure:15681: checking for sys/agpgart.h
configure:15681: result: no
configure:15703: checking linux/apm_bios.h usability
configure:15703: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:15703: $? =3D 0
configure:15703: result: yes
configure:15703: checking linux/apm_bios.h presence
configure:15703: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
configure:15703: $? =3D 0
configure:15703: result: yes
configure:15703: checking for linux/apm_bios.h
configure:15703: result: yes
configure:15724: checking linux/fb.h usability
configure:15724: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:15724: $? =3D 0
configure:15724: result: yes
configure:15724: checking linux/fb.h presence
configure:15724: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
configure:15724: $? =3D 0
configure:15724: result: yes
configure:15724: checking for linux/fb.h
configure:15724: result: yes
configure:15745: checking asm/mtrr.h usability
configure:15745: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:100:22: fatal error: asm/mtrr.h: No such file or directory
compilation terminated.
configure:15745: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <asm/mtrr.h>
configure:15745: result: no
configure:15745: checking asm/mtrr.h presence
configure:15745: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:67:22: fatal error: asm/mtrr.h: No such file or directory
compilation terminated.
configure:15745: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <asm/mtrr.h>
configure:15745: result: no
configure:15745: checking for asm/mtrr.h
configure:15745: result: no
configure:15761: checking sys/memrange.h usability
configure:15761: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:100:26: fatal error: sys/memrange.h: No such file or directory
compilation terminated.
configure:15761: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/memrange.h>
configure:15761: result: no
configure:15761: checking sys/memrange.h presence
configure:15761: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:67:26: fatal error: sys/memrange.h: No such file or directory
compilation terminated.
configure:15761: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <sys/memrange.h>
configure:15761: result: no
configure:15761: checking for sys/memrange.h
configure:15761: result: no
configure:15783: checking machine/mtrr.h usability
configure:15783: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:100:26: fatal error: machine/mtrr.h: No such file or directory
compilation terminated.
configure:15783: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <machine/mtrr.h>
configure:15783: result: no
configure:15783: checking machine/mtrr.h presence
configure:15783: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:67:26: fatal error: machine/mtrr.h: No such file or directory
compilation terminated.
configure:15783: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <machine/mtrr.h>
configure:15783: result: no
configure:15783: checking for machine/mtrr.h
configure:15783: result: no
configure:15801: checking for sys/linker.h
configure:15801: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:69:24: fatal error: sys/linker.h: No such file or directory
compilation terminated.
configure:15801: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| /* end confdefs.h.  */
| #include <sys/param.h>
|=20
| #include <sys/linker.h>
configure:15801: result: no
configure:15823: checking for SYSV IPC
configure:15849: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
configure:15849: $? =3D 0
configure:15857: result: yes
configure:15871: checking machine/apmvar.h usability
configure:15871: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c:101:28: fatal error: machine/apmvar.h: No such file or directory
compilation terminated.
configure:15871: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <machine/apmvar.h>
configure:15871: result: no
configure:15871: checking machine/apmvar.h presence
configure:15871: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
conftest.c:68:28: fatal error: machine/apmvar.h: No such file or directory
compilation terminated.
configure:15871: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| /* end confdefs.h.  */
| #include <machine/apmvar.h>
configure:15871: result: no
configure:15871: checking for machine/apmvar.h
configure:15871: result: no
configure:15903: checking for execinfo.h
configure:15903: result: yes
configure:15906: checking for backtrace in -lc
configure:15931: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lc  -lm  >&5
configure:15931: $? =3D 0
configure:15940: result: yes
configure:15971: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -mapcs-frame  =
conftest.c >&5
cc1: error: unrecognized command line option '-mapcs-frame'
configure:15971: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| /* end confdefs.h.  */
|=20
| int
| main ()
| {
|=20
|   ;
|   return 0;
| }
configure:16290: checking for root directory for font files
configure:16307: result: /usr/share/fonts/X11
configure:16313: checking for directory for misc files
configure:16324: result: ${FONTROOTDIR}/misc
configure:16330: checking for directory for OTF files
configure:16341: result: ${FONTROOTDIR}/OTF
configure:16347: checking for directory for TTF files
configure:16358: result: ${FONTROOTDIR}/TTF
configure:16364: checking for directory for Type1 files
configure:16375: result: ${FONTROOTDIR}/Type1
configure:16381: checking for directory for 75dpi files
configure:16392: result: ${FONTROOTDIR}/75dpi
configure:16398: checking for directory for 100dpi files
configure:16409: result: ${FONTROOTDIR}/100dpi
configure:16426: checking for default font path
configure:16428: result: ${FONTROOTDIR}/misc/,${FONTROOTDIR}/TTF/,${FONTROO=
TDIR}/OTF/,${FONTROOTDIR}/Type1/,${FONTROOTDIR}/100dpi/,${FONTROOTDIR}/75dp=
i/
configure:16565: checking for thread local storage (TLS) class
configure:16592: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:16592: $? =3D 0
configure:16612: result: __thread
configure:16975: checking to see if we can install the Xorg server as root
configure:16993: result: no
configure:17007: checking return type of signal handlers
configure:17025: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:78:1: error: void value not ignored as it ought to be
configure:17025: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| /* end confdefs.h.  */
| #include <sys/types.h>
| #include <signal.h>
|=20
| int
| main ()
| {
| return *(signal (0, 0)) (0) =3D=3D 1;
|   ;
|   return 0;
| }
configure:17032: result: void
configure:17054: checking if Xtrans should support UNIX socket connections
configure:17061: result: yes
configure:17070: checking if Xtrans should support TCP socket connections
configure:17072: result: yes
configure:17080: checking for library containing socket
configure:17111: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
configure:17111: $? =3D 0
configure:17128: result: none required
configure:17136: checking for library containing gethostbyname
configure:17167: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
configure:17167: $? =3D 0
configure:17184: result: none required
configure:17240: checking for getaddrinfo
configure:17240: result: yes
configure:17249: checking if IPv6 support should be built
configure:17256: result: yes
configure:17260: checking for struct sockaddr_in.sin_len
configure:17260: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:86:12: error: 'struct sockaddr_in' has no member named 'sin_len'
configure:17260: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <sys/types.h>
| #include <sys/socket.h>
| #include <netinet/in.h>
|=20
|=20
| int
| main ()
| {
| static struct sockaddr_in ac_aggr;
| if (ac_aggr.sin_len)
| return 0;
|   ;
|   return 0;
| }
configure:17260: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:86:19: error: 'struct sockaddr_in' has no member named 'sin_len'
configure:17260: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <sys/types.h>
| #include <sys/socket.h>
| #include <netinet/in.h>
|=20
|=20
| int
| main ()
| {
| static struct sockaddr_in ac_aggr;
| if (sizeof ac_aggr.sin_len)
| return 0;
|   ;
|   return 0;
| }
configure:17260: result: no
configure:17274: checking for socklen_t
configure:17274: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:17274: $? =3D 0
configure:17274: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:115:24: error: expected expression before ')' token
configure:17274: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/socket.h>
|=20
| int
| main ()
| {
| if (sizeof ((socklen_t)))
| 	    return 0;
|   ;
|   return 0;
| }
configure:17274: result: yes
configure:17301: checking if Xtrans should support os-specific local connec=
tions
configure:17303: result: no
configure:17328: checking for authdes_seccreate
configure:17328: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
/tmp/cctBhK3v.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:111: undefined reference to `authdes_seccrea=
te'
collect2: ld returned 1 exit status
configure:17328: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| /* end confdefs.h.  */
| /* Define authdes_seccreate to an innocuous variant, in case <limits.h> d=
eclares authdes_seccreate.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define authdes_seccreate innocuous_authdes_seccreate
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char authdes_seccreate (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef authdes_seccreate
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char authdes_seccreate ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_authdes_seccreate || defined __stub___authdes_seccreat=
e
| choke me
| #endif
|=20
| int
| main ()
| {
| return authdes_seccreate ();
|   ;
|   return 0;
| }
configure:17328: result: no
configure:17328: checking for authdes_create
configure:17328: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
configure:17328: $? =3D 0
configure:17328: result: yes
configure:17344: checking for library containing getsecretkey
configure:17375: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
configure:17375: $? =3D 0
configure:17392: result: none required
configure:17403: checking if Secure RPC authentication ("SUN-DES-1") should=
 be supported
configure:17410: result: yes
configure:17481: checking whether to build documentation
configure:17483: result: yes
configure:17504: checking whether to build developer documentation
configure:17506: result: yes
configure:17525: checking for xmlto
configure:17543: found /usr/bin/xmlto
configure:17555: result: /usr/bin/xmlto
configure:17628: checking the xmlto version
configure:17631: result: 0.0.23
configure:17918: checking for PIXMAN
configure:17925: $PKG_CONFIG --exists --print-errors "$LIBPIXMAN"
configure:17928: $? =3D 0
configure:17941: $PKG_CONFIG --exists --print-errors "$LIBPIXMAN"
configure:17944: $? =3D 0
configure:18001: result: yes
configure:18016: checking for UDEV
configure:18023: $PKG_CONFIG --exists --print-errors "$LIBUDEV"
configure:18026: $? =3D 0
configure:18039: $PKG_CONFIG --exists --print-errors "$LIBUDEV"
configure:18042: $? =3D 0
configure:18079: result: yes
configure:18107: checking for DBUS
configure:18114: $PKG_CONFIG --exists --print-errors "$LIBDBUS"
configure:18117: $? =3D 0
configure:18130: $PKG_CONFIG --exists --print-errors "$LIBDBUS"
configure:18133: $? =3D 0
configure:18170: result: yes
configure:18212: checking for HAL
configure:18219: $PKG_CONFIG --exists --print-errors "hal"
configure:18222: $? =3D 0
configure:18235: $PKG_CONFIG --exists --print-errors "hal"
configure:18238: $? =3D 0
configure:18275: result: yes
configure:18326: checking for glibc...
configure:18337: powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemuppc  conftest.c
configure:18337: $? =3D 0
configure:18343: result: yes
configure:18348: checking for clock_gettime
configure:18348: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
/tmp/ccDW8E0D.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:116: undefined reference to `clock_gettime'
collect2: ld returned 1 exit status
configure:18348: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| /* end confdefs.h.  */
| /* Define clock_gettime to an innocuous variant, in case <limits.h> decla=
res clock_gettime.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define clock_gettime innocuous_clock_gettime
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char clock_gettime (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef clock_gettime
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char clock_gettime ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_clock_gettime || defined __stub___clock_gettime
| choke me
| #endif
|=20
| int
| main ()
| {
| return clock_gettime ();
|   ;
|   return 0;
| }
configure:18348: result: no
configure:18355: checking for clock_gettime in -lrt
configure:18380: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lrt  -lm  >&5
configure:18380: $? =3D 0
configure:18389: result: yes
configure:18401: checking for a useful monotonic clock ...
configure:18453: result: cross compiling
configure:19006: checking for DRI2PROTO
configure:19013: $PKG_CONFIG --exists --print-errors "$DRI2PROTO"
Package dri2proto was not found in the pkg-config search path.
Perhaps you should add the directory containing `dri2proto.pc'
to the PKG_CONFIG_PATH environment variable
No package 'dri2proto' found
configure:19016: $? =3D 1
configure:19029: $PKG_CONFIG --exists --print-errors "$DRI2PROTO"
Package dri2proto was not found in the pkg-config search path.
Perhaps you should add the directory containing `dri2proto.pc'
to the PKG_CONFIG_PATH environment variable
No package 'dri2proto' found
configure:19032: $? =3D 1
configure:19045: result: no
No package 'dri2proto' found
configure:19702: checking for strcasecmp
configure:19702: result: yes
configure:19711: checking for strncasecmp
configure:19711: result: yes
configure:19720: checking for strcasestr
configure:19720: result: yes
configure:19732: checking for XDMCP
configure:19739: $PKG_CONFIG --exists --print-errors "xdmcp"
configure:19742: $? =3D 0
configure:19755: $PKG_CONFIG --exists --print-errors "xdmcp"
configure:19758: $? =3D 0
configure:19795: result: yes
configure:19800: checking for XdmcpWrap in -lXdmcp
configure:19825: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lXdmcp -lXdmcp   -lm  >&5
configure:19825: $? =3D 0
configure:19834: result: yes
configure:20068: checking for GLIB
configure:20075: $PKG_CONFIG --exists --print-errors "$LIBGLIB"
configure:20078: $? =3D 0
configure:20091: $PKG_CONFIG --exists --print-errors "$LIBGLIB"
configure:20094: $? =3D 0
configure:20131: result: yes
configure:20139: checking whether the linker supports -wrap
configure:20170: result: no
configure:20248: checking for SHA1Init
configure:20248: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
/tmp/cc7mrPxR.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:166: undefined reference to `SHA1Init'
collect2: ld returned 1 exit status
configure:20248: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH ""
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
| /* Define SHA1Init to an innocuous variant, in case <limits.h> declares S=
HA1Init.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define SHA1Init innocuous_SHA1Init
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char SHA1Init (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef SHA1Init
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char SHA1Init ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_SHA1Init || defined __stub___SHA1Init
| choke me
| #endif
|=20
| int
| main ()
| {
| return SHA1Init ();
|   ;
|   return 0;
| }
configure:20248: result: no
configure:20265: checking for CC_SHA1_Init
configure:20265: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lm  >&5
/tmp/cczilO8T.o: In function `main':
/home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-xf86-lite-1.10.1-r0=
/xorg-server-1.10.1/conftest.c:166: undefined reference to `CC_SHA1_Init'
collect2: ld returned 1 exit status
configure:20265: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH ""
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
| /* Define CC_SHA1_Init to an innocuous variant, in case <limits.h> declar=
es CC_SHA1_Init.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define CC_SHA1_Init innocuous_CC_SHA1_Init
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char CC_SHA1_Init (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef CC_SHA1_Init
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char CC_SHA1_Init ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_CC_SHA1_Init || defined __stub___CC_SHA1_Init
| choke me
| #endif
|=20
| int
| main ()
| {
| return CC_SHA1_Init ();
|   ;
|   return 0;
| }
configure:20265: result: no
configure:20282: checking for SHA1Init in -lmd
configure:20307: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lmd  -lm  >&5
/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/libexec/ppc603e-poky-linu=
x/gcc/powerpc-poky-linux/4.6.0/ld: cannot find -lmd
collect2: ld returned 1 exit status
configure:20307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH ""
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char SHA1Init ();
| int
| main ()
| {
| return SHA1Init ();
|   ;
|   return 0;
| }
configure:20316: result: no
configure:20336: checking for LIBSHA1
configure:20343: $PKG_CONFIG --exists --print-errors "libsha1"
Package libsha1 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsha1.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsha1' found
configure:20346: $? =3D 1
configure:20359: $PKG_CONFIG --exists --print-errors "libsha1"
Package libsha1 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsha1.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsha1' found
configure:20362: $? =3D 1
configure:20375: result: no
No package 'libsha1' found
configure:20415: checking for gcry_md_open in -lgcrypt
configure:20440: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lgcrypt  -lm  >&5
configure:20440: $? =3D 0
configure:20449: result: yes
configure:20468: checking for SHA1_Init in -lcrypto
configure:20493: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest -O2 -=
pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c=
 -lcrypto  -lm  >&5
configure:20493: $? =3D 0
configure:20502: result: yes
configure:20510: checking for OPENSSL
configure:20517: $PKG_CONFIG --exists --print-errors "openssl"
configure:20520: $? =3D 0
configure:20533: $PKG_CONFIG --exists --print-errors "openssl"
configure:20536: $? =3D 0
configure:20573: result: yes
configure:20594: checking for SHA1 implementation
configure:20599: result: libgcrypt
configure:20606: checking for XSERVERCFLAGS
configure:20613: $PKG_CONFIG --exists --print-errors "$REQUIRED_MODULES $RE=
QUIRED_LIBS"
configure:20616: $? =3D 0
configure:20629: $PKG_CONFIG --exists --print-errors "$REQUIRED_MODULES $RE=
QUIRED_LIBS"
configure:20632: $? =3D 0
configure:20689: result: yes
configure:20695: checking for XSERVERLIBS
configure:20702: $PKG_CONFIG --exists --print-errors "$REQUIRED_LIBS"
configure:20705: $? =3D 0
configure:20718: $PKG_CONFIG --exists --print-errors "$REQUIRED_LIBS"
configure:20721: $? =3D 0
configure:20778: result: yes
configure:20813: checking if SVR4 needs to be defined
configure:20832: result: no
configure:20842: checking whether to build Xvfb DDX
configure:20844: result: no
configure:20866: checking for XNESTMODULES
configure:20873: $PKG_CONFIG --exists --print-errors "$LIBXEXT x11 xau $XDM=
CP_MODULES"
configure:20876: $? =3D 0
configure:20889: $PKG_CONFIG --exists --print-errors "$LIBXEXT x11 xau $XDM=
CP_MODULES"
configure:20892: $? =3D 0
configure:20929: result: yes
configure:20933: checking whether to build Xnest DDX
configure:20938: result: no
configure:20961: checking whether to build Xorg DDX
configure:20970: result: yes
configure:20987: checking for symbol visibility support
configure:21023: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types -fvisibility=3Dhidden  conftest.c >&5
configure:21023: $? =3D 0
configure:21031: result: yes
configure:21043: checking for PCIACCESS
configure:21050: $PKG_CONFIG --exists --print-errors "$LIBPCIACCESS"
configure:21053: $? =3D 0
configure:21066: $PKG_CONFIG --exists --print-errors "$LIBPCIACCESS"
configure:21069: $? =3D 0
configure:21126: result: yes
configure:21136: checking for pci_system_init_dev_mem
configure:21136: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest    -W=
l,-O1  -Wl,--as-needed conftest.c -lpciaccess   >&5
configure:21136: $? =3D 0
configure:21136: result: yes
configure:21147: checking for pci_device_enable
configure:21147: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest    -W=
l,-O1  -Wl,--as-needed conftest.c -lpciaccess   >&5
configure:21147: $? =3D 0
configure:21147: result: yes
configure:21158: checking for pci_device_is_boot_vga
configure:21158: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest    -W=
l,-O1  -Wl,--as-needed conftest.c -lpciaccess   >&5
configure:21158: $? =3D 0
configure:21158: result: yes
configure:21169: checking for pci_device_vgaarb_init
configure:21169: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -o conftest    -W=
l,-O1  -Wl,--as-needed conftest.c -lpciaccess   >&5
configure:21169: $? =3D 0
configure:21169: result: yes
configure:21530: checking for XF86VIDMODE
configure:21537: $PKG_CONFIG --exists --print-errors "$VIDMODEPROTO"
configure:21540: $? =3D 0
configure:21553: $PKG_CONFIG --exists --print-errors "$VIDMODEPROTO"
configure:21556: $? =3D 0
configure:21593: result: yes
configure:21602: checking for XF86VIDMODE
configure:21685: result: yes
configure:21697: checking for XORG_MODULES
configure:21704: $PKG_CONFIG --exists --print-errors "$XORG_MODULES"
configure:21707: $? =3D 0
configure:21720: $PKG_CONFIG --exists --print-errors "$XORG_MODULES"
configure:21723: $? =3D 0
configure:21780: result: yes
configure:21796: checking for perl
configure:21814: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/perl
configure:21827: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/=
bin/perl
configure:22103: checking whether to build XWin DDX
configure:22112: result: no
configure:22737: checking dependency style of $(CC)
configure:22845: result: none
configure:22887: checking for DMXMODULES
configure:22894: $PKG_CONFIG --exists --print-errors "xmuu $LIBXEXT x11 xre=
nder xfixes $LIBXI $DMXPROTO xau $XDMCP_MODULES"
configure:22897: $? =3D 0
configure:22910: $PKG_CONFIG --exists --print-errors "xmuu $LIBXEXT x11 xre=
nder xfixes $LIBXI $DMXPROTO xau $XDMCP_MODULES"
configure:22913: $? =3D 0
configure:22950: result: yes
configure:22954: checking for XDMXCONFIG_DEP
configure:22961: $PKG_CONFIG --exists --print-errors "xaw7 xmu xt xpm x11"
Package xaw7 was not found in the pkg-config search path.
Perhaps you should add the directory containing `xaw7.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xaw7' found
Package xpm was not found in the pkg-config search path.
Perhaps you should add the directory containing `xpm.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xpm' found
configure:22964: $? =3D 1
configure:22977: $PKG_CONFIG --exists --print-errors "xaw7 xmu xt xpm x11"
Package xaw7 was not found in the pkg-config search path.
Perhaps you should add the directory containing `xaw7.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xaw7' found
Package xpm was not found in the pkg-config search path.
Perhaps you should add the directory containing `xpm.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xpm' found
configure:22980: $? =3D 1
configure:22993: result: no
No package 'xaw7' found
No package 'xpm' found
configure:23022: checking whether to build Xdmx DDX
configure:23031: result: no
configure:24095: powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99 -c -O2 -pipe -g -=
feliminate-unused-debug-types  conftest.c >&5
configure:24095: $? =3D 0
configure:24674: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by xorg-server config.status 1.10.1, which was
generated by GNU Autoconf 2.65.  Invocation command line was

  CONFIG_FILES    =3D=20
  CONFIG_HEADERS  =3D=20
  CONFIG_LINKS    =3D=20
  CONFIG_COMMANDS =3D=20
  $ ./config.status=20

on kyu3-ubuntu

config.status:1752: creating Makefile
config.status:1752: creating glx/Makefile
config.status:1752: creating include/Makefile
config.status:1752: creating composite/Makefile
config.status:1752: creating damageext/Makefile
config.status:1752: creating dbe/Makefile
config.status:1752: creating dix/Makefile
config.status:1752: creating doc/Makefile
config.status:1752: creating doc/man/Makefile
config.status:1752: creating doc/xml/Makefile
config.status:1752: creating doc/xml/dtrace/Makefile
config.status:1752: creating doc/xml/xserver.ent
config.status:1752: creating fb/Makefile
config.status:1752: creating record/Makefile
config.status:1752: creating config/Makefile
config.status:1752: creating mi/Makefile
config.status:1752: creating miext/Makefile
config.status:1752: creating miext/sync/Makefile
config.status:1752: creating miext/damage/Makefile
config.status:1752: creating miext/shadow/Makefile
config.status:1752: creating miext/cw/Makefile
config.status:1752: creating miext/rootless/Makefile
config.status:1752: creating os/Makefile
config.status:1752: creating randr/Makefile
config.status:1752: creating render/Makefile
config.status:1752: creating xkb/Makefile
config.status:1752: creating Xext/Makefile
config.status:1752: creating Xi/Makefile
config.status:1752: creating xfixes/Makefile
config.status:1752: creating exa/Makefile
config.status:1752: creating hw/Makefile
config.status:1752: creating hw/xfree86/Makefile
config.status:1752: creating hw/xfree86/common/Makefile
config.status:1752: creating hw/xfree86/common/xf86Build.h
config.status:1752: creating hw/xfree86/ddc/Makefile
config.status:1752: creating hw/xfree86/dixmods/Makefile
config.status:1752: creating hw/xfree86/dixmods/extmod/Makefile
config.status:1752: creating hw/xfree86/doc/Makefile
config.status:1752: creating hw/xfree86/doc/devel/Makefile
config.status:1752: creating hw/xfree86/doc/man/Makefile
config.status:1752: creating hw/xfree86/doc/sgml/Makefile
config.status:1752: creating hw/xfree86/dri/Makefile
config.status:1752: creating hw/xfree86/dri2/Makefile
config.status:1752: creating hw/xfree86/exa/Makefile
config.status:1752: creating hw/xfree86/exa/man/Makefile
config.status:1752: creating hw/xfree86/fbdevhw/Makefile
config.status:1752: creating hw/xfree86/fbdevhw/man/Makefile
config.status:1752: creating hw/xfree86/i2c/Makefile
config.status:1752: creating hw/xfree86/int10/Makefile
config.status:1752: creating hw/xfree86/loader/Makefile
config.status:1752: creating hw/xfree86/modes/Makefile
config.status:1752: creating hw/xfree86/os-support/Makefile
config.status:1752: creating hw/xfree86/os-support/bsd/Makefile
config.status:1752: creating hw/xfree86/os-support/bus/Makefile
config.status:1752: creating hw/xfree86/os-support/hurd/Makefile
config.status:1752: creating hw/xfree86/os-support/misc/Makefile
config.status:1752: creating hw/xfree86/os-support/linux/Makefile
config.status:1752: creating hw/xfree86/os-support/solaris/Makefile
config.status:1752: creating hw/xfree86/parser/Makefile
config.status:1752: creating hw/xfree86/ramdac/Makefile
config.status:1752: creating hw/xfree86/shadowfb/Makefile
config.status:1752: creating hw/xfree86/vbe/Makefile
config.status:1752: creating hw/xfree86/vgahw/Makefile
config.status:1752: creating hw/xfree86/x86emu/Makefile
config.status:1752: creating hw/xfree86/xaa/Makefile
config.status:1752: creating hw/xfree86/utils/Makefile
config.status:1752: creating hw/xfree86/utils/man/Makefile
config.status:1752: creating hw/xfree86/utils/cvt/Makefile
config.status:1752: creating hw/xfree86/utils/gtf/Makefile
config.status:1752: creating hw/dmx/config/Makefile
config.status:1752: creating hw/dmx/config/man/Makefile
config.status:1752: creating hw/dmx/doc/Makefile
config.status:1752: creating hw/dmx/doc/doxygen.conf
config.status:1752: creating hw/dmx/examples/Makefile
config.status:1752: creating hw/dmx/input/Makefile
config.status:1752: creating hw/dmx/glxProxy/Makefile
config.status:1752: creating hw/dmx/Makefile
config.status:1752: creating hw/dmx/man/Makefile
config.status:1752: creating hw/vfb/Makefile
config.status:1752: creating hw/vfb/man/Makefile
config.status:1752: creating hw/xnest/Makefile
config.status:1752: creating hw/xnest/man/Makefile
config.status:1752: creating hw/xwin/Makefile
config.status:1752: creating hw/xwin/glx/Makefile
config.status:1752: creating hw/xwin/man/Makefile
config.status:1752: creating hw/xquartz/Makefile
config.status:1752: creating hw/xquartz/GL/Makefile
config.status:1752: creating hw/xquartz/bundle/Makefile
config.status:1752: creating hw/xquartz/man/Makefile
config.status:1752: creating hw/xquartz/mach-startup/Makefile
config.status:1752: creating hw/xquartz/pbproxy/Makefile
config.status:1752: creating hw/xquartz/xpr/Makefile
config.status:1752: creating hw/kdrive/Makefile
config.status:1752: creating hw/kdrive/ephyr/Makefile
config.status:1752: creating hw/kdrive/ephyr/man/Makefile
config.status:1752: creating hw/kdrive/fake/Makefile
config.status:1752: creating hw/kdrive/fbdev/Makefile
config.status:1752: creating hw/kdrive/linux/Makefile
config.status:1752: creating hw/kdrive/src/Makefile
config.status:1752: creating test/Makefile
config.status:1752: creating test/xi2/Makefile
config.status:1752: creating xorg-server.pc
config.status:1752: creating include/do-not-use-config.h
config.status:1752: creating include/xorg-server.h
config.status:1752: creating include/dix-config.h
config.status:1752: creating include/xorg-config.h
config.status:1752: creating include/xkb-config.h
config.status:1752: creating include/xwin-config.h
config.status:1752: creating include/kdrive-config.h
config.status:1752: creating include/version-config.h
config.status:1972: executing depfiles commands
config.status:1972: executing libtool commands
config.status:1972: executing sdksyms commands
configure:27006: WARNING: unrecognized options: --disable-acfb, --disable-c=
cfb, --disable-mcfb, --disable-xf86misc, --disable-xorgcfg, --with-fontdir

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv___va_copy=3Dyes
ac_cv_af_unix_large_dgram=3Dyes
ac_cv_alignof_CORBA_boolean=3D1
ac_cv_alignof_CORBA_char=3D1
ac_cv_alignof_CORBA_double=3D4
ac_cv_alignof_CORBA_float=3D4
ac_cv_alignof_CORBA_long=3D4
ac_cv_alignof_CORBA_long_double=3D4
ac_cv_alignof_CORBA_long_long=3D4
ac_cv_alignof_CORBA_octet=3D1
ac_cv_alignof_CORBA_pointer=3D4
ac_cv_alignof_CORBA_short=3D2
ac_cv_alignof_CORBA_struct=3D4
ac_cv_alignof_CORBA_wchar=3D2
ac_cv_build=3Dx86_64-pc-linux-gnu
ac_cv_c_bigendian=3Dyes
ac_cv_c_bigendian_php=3Dyes
ac_cv_c_compiler_gnu=3Dyes
ac_cv_c_const=3Dyes
ac_cv_c_littleendian=3Dno
ac_cv_c_long_double=3Dyes
ac_cv_check_sjlj=3Dssjlj
ac_cv_conv_longlong_to_float=3Dyes
ac_cv_dirent_have_space_d_name=3Dyes
ac_cv_env_CCASFLAGS_set=3D
ac_cv_env_CCASFLAGS_value=3D
ac_cv_env_CCAS_set=3D
ac_cv_env_CCAS_value=3D
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3D'powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --s=
ysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc'
ac_cv_env_CFLAGS_set=3Dset
ac_cv_env_CFLAGS_value=3D'-O2 -pipe -g -feliminate-unused-debug-types'
ac_cv_env_CPPFLAGS_set=3D
ac_cv_env_CPPFLAGS_value=3D
ac_cv_env_CPP_set=3Dset
ac_cv_env_CPP_value=3D'powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb=
/test/tmp/sysroots/qemuppc'
ac_cv_env_DBUS_CFLAGS_set=3D
ac_cv_env_DBUS_CFLAGS_value=3D
ac_cv_env_DBUS_LIBS_set=3D
ac_cv_env_DBUS_LIBS_value=3D
ac_cv_env_DGA_CFLAGS_set=3D
ac_cv_env_DGA_CFLAGS_value=3D
ac_cv_env_DGA_LIBS_set=3D
ac_cv_env_DGA_LIBS_value=3D
ac_cv_env_DMXEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DMXMODULES_CFLAGS_set=3D
ac_cv_env_DMXMODULES_CFLAGS_value=3D
ac_cv_env_DMXMODULES_LIBS_set=3D
ac_cv_env_DMXMODULES_LIBS_value=3D
ac_cv_env_DMXXIEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXXIEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXXIEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXXIEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DOXYGEN_set=3D
ac_cv_env_DOXYGEN_value=3D
ac_cv_env_DRI2PROTO_CFLAGS_set=3D
ac_cv_env_DRI2PROTO_CFLAGS_value=3D
ac_cv_env_DRI2PROTO_LIBS_set=3D
ac_cv_env_DRI2PROTO_LIBS_value=3D
ac_cv_env_DRIPROTO_CFLAGS_set=3D
ac_cv_env_DRIPROTO_CFLAGS_value=3D
ac_cv_env_DRIPROTO_LIBS_set=3D
ac_cv_env_DRIPROTO_LIBS_value=3D
ac_cv_env_DRI_CFLAGS_set=3D
ac_cv_env_DRI_CFLAGS_value=3D
ac_cv_env_DRI_LIBS_set=3D
ac_cv_env_DRI_LIBS_value=3D
ac_cv_env_FOP_set=3D
ac_cv_env_FOP_value=3D
ac_cv_env_GLIB_CFLAGS_set=3D
ac_cv_env_GLIB_CFLAGS_value=3D
ac_cv_env_GLIB_LIBS_set=3D
ac_cv_env_GLIB_LIBS_value=3D
ac_cv_env_GL_CFLAGS_set=3D
ac_cv_env_GL_CFLAGS_value=3D
ac_cv_env_GL_LIBS_set=3D
ac_cv_env_GL_LIBS_value=3D
ac_cv_env_HAL_CFLAGS_set=3D
ac_cv_env_HAL_CFLAGS_value=3D
ac_cv_env_HAL_LIBS_set=3D
ac_cv_env_HAL_LIBS_value=3D
ac_cv_env_LDFLAGS_set=3Dset
ac_cv_env_LDFLAGS_value=3D'-Wl,-O1  -Wl,--as-needed'
ac_cv_env_LIBDRM_CFLAGS_set=3D
ac_cv_env_LIBDRM_CFLAGS_value=3D
ac_cv_env_LIBDRM_LIBS_set=3D
ac_cv_env_LIBDRM_LIBS_value=3D
ac_cv_env_LIBSHA1_CFLAGS_set=3D
ac_cv_env_LIBSHA1_CFLAGS_value=3D
ac_cv_env_LIBSHA1_LIBS_set=3D
ac_cv_env_LIBSHA1_LIBS_value=3D
ac_cv_env_LIBS_set=3D
ac_cv_env_LIBS_value=3D
ac_cv_env_OPENSSL_CFLAGS_set=3D
ac_cv_env_OPENSSL_CFLAGS_value=3D
ac_cv_env_OPENSSL_LIBS_set=3D
ac_cv_env_OPENSSL_LIBS_value=3D
ac_cv_env_PCIACCESS_CFLAGS_set=3D
ac_cv_env_PCIACCESS_CFLAGS_value=3D
ac_cv_env_PCIACCESS_LIBS_set=3D
ac_cv_env_PCIACCESS_LIBS_value=3D
ac_cv_env_PIXMAN_CFLAGS_set=3D
ac_cv_env_PIXMAN_CFLAGS_value=3D
ac_cv_env_PIXMAN_LIBS_set=3D
ac_cv_env_PIXMAN_LIBS_value=3D
ac_cv_env_PKG_CONFIG_LIBDIR_set=3Dset
ac_cv_env_PKG_CONFIG_LIBDIR_value=3D/home/kyu3/sdb/test/tmp/sysroots/qemupp=
c//usr/lib/pkgconfig
ac_cv_env_PKG_CONFIG_PATH_set=3Dset
ac_cv_env_PKG_CONFIG_PATH_value=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc/=
/usr/lib/pkgconfig:/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/share/pkgco=
nfig
ac_cv_env_PKG_CONFIG_set=3D
ac_cv_env_PKG_CONFIG_value=3D
ac_cv_env_SELINUX_CFLAGS_set=3D
ac_cv_env_SELINUX_CFLAGS_value=3D
ac_cv_env_SELINUX_LIBS_set=3D
ac_cv_env_SELINUX_LIBS_value=3D
ac_cv_env_TSLIB_CFLAGS_set=3D
ac_cv_env_TSLIB_CFLAGS_value=3D
ac_cv_env_TSLIB_LIBS_set=3D
ac_cv_env_TSLIB_LIBS_value=3D
ac_cv_env_UDEV_CFLAGS_set=3D
ac_cv_env_UDEV_CFLAGS_value=3D
ac_cv_env_UDEV_LIBS_set=3D
ac_cv_env_UDEV_LIBS_value=3D
ac_cv_env_WINDOWSWM_CFLAGS_set=3D
ac_cv_env_WINDOWSWM_CFLAGS_value=3D
ac_cv_env_WINDOWSWM_LIBS_set=3D
ac_cv_env_WINDOWSWM_LIBS_value=3D
ac_cv_env_X11EXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_X11EXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_X11EXAMPLES_DEP_LIBS_set=3D
ac_cv_env_X11EXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XDMCP_CFLAGS_set=3D
ac_cv_env_XDMCP_CFLAGS_value=3D
ac_cv_env_XDMCP_LIBS_set=3D
ac_cv_env_XDMCP_LIBS_value=3D
ac_cv_env_XDMXCONFIG_DEP_CFLAGS_set=3D
ac_cv_env_XDMXCONFIG_DEP_CFLAGS_value=3D
ac_cv_env_XDMXCONFIG_DEP_LIBS_set=3D
ac_cv_env_XDMXCONFIG_DEP_LIBS_value=3D
ac_cv_env_XEPHYR_CFLAGS_set=3D
ac_cv_env_XEPHYR_CFLAGS_value=3D
ac_cv_env_XEPHYR_LIBS_set=3D
ac_cv_env_XEPHYR_LIBS_value=3D
ac_cv_env_XF86VIDMODE_CFLAGS_set=3D
ac_cv_env_XF86VIDMODE_CFLAGS_value=3D
ac_cv_env_XF86VIDMODE_LIBS_set=3D
ac_cv_env_XF86VIDMODE_LIBS_value=3D
ac_cv_env_XLIB_CFLAGS_set=3D
ac_cv_env_XLIB_CFLAGS_value=3D
ac_cv_env_XLIB_LIBS_set=3D
ac_cv_env_XLIB_LIBS_value=3D
ac_cv_env_XMLTO_set=3D
ac_cv_env_XMLTO_value=3D
ac_cv_env_XNESTMODULES_CFLAGS_set=3D
ac_cv_env_XNESTMODULES_CFLAGS_value=3D
ac_cv_env_XNESTMODULES_LIBS_set=3D
ac_cv_env_XNESTMODULES_LIBS_value=3D
ac_cv_env_XORG_MODULES_CFLAGS_set=3D
ac_cv_env_XORG_MODULES_CFLAGS_value=3D
ac_cv_env_XORG_MODULES_LIBS_set=3D
ac_cv_env_XORG_MODULES_LIBS_value=3D
ac_cv_env_XPBPROXY_CFLAGS_set=3D
ac_cv_env_XPBPROXY_CFLAGS_value=3D
ac_cv_env_XPBPROXY_LIBS_set=3D
ac_cv_env_XPBPROXY_LIBS_value=3D
ac_cv_env_XRESEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_XRESEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_XRESEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_XRESEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XSERVERCFLAGS_CFLAGS_set=3D
ac_cv_env_XSERVERCFLAGS_CFLAGS_value=3D
ac_cv_env_XSERVERCFLAGS_LIBS_set=3D
ac_cv_env_XSERVERCFLAGS_LIBS_value=3D
ac_cv_env_XSERVERLIBS_CFLAGS_set=3D
ac_cv_env_XSERVERLIBS_CFLAGS_value=3D
ac_cv_env_XSERVERLIBS_LIBS_set=3D
ac_cv_env_XSERVERLIBS_LIBS_value=3D
ac_cv_env_XTSTEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_XTSTEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_XTSTEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_XTSTEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XWINMODULES_CFLAGS_set=3D
ac_cv_env_XWINMODULES_CFLAGS_value=3D
ac_cv_env_XWINMODULES_LIBS_set=3D
ac_cv_env_XWINMODULES_LIBS_value=3D
ac_cv_env_YACC_set=3D
ac_cv_env_YACC_value=3D
ac_cv_env_YFLAGS_set=3D
ac_cv_env_YFLAGS_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Dx86_64-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Dpowerpc-poky-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Dpowerpc-poky-linux
ac_cv_epoll_works=3Dyes
ac_cv_file__dev_random=3Dyes
ac_cv_file__dev_zero=3Dyes
ac_cv_file__usr_share_sgml_X11_defs_ent=3Dno
ac_cv_func_CC_SHA1_Init=3Dno
ac_cv_func_SHA1Init=3Dno
ac_cv_func___adjtimex=3Dyes
ac_cv_func___argz_count=3Dyes
ac_cv_func___argz_next=3Dyes
ac_cv_func___argz_stringify=3Dyes
ac_cv_func___fpending=3Dyes
ac_cv_func___fsetlocking=3Dyes
ac_cv_func___progname=3Dyes
ac_cv_func___secure_getenv=3Dyes
ac_cv_func___va_copy=3Dyes
ac_cv_func__doprnt=3Dno
ac_cv_func__obstack_free=3Dyes
ac_cv_func__setjmp=3Dyes
ac_cv_func__sys_siglist=3Dyes
ac_cv_func_a64l=3Dyes
ac_cv_func_abs=3Dyes
ac_cv_func_access=3Dyes
ac_cv_func_alarm=3Dyes
ac_cv_func_alloca_works=3Dyes
ac_cv_func_alphasort=3Dyes
ac_cv_func_argz_append=3Dyes
ac_cv_func_argz_create_sep=3Dyes
ac_cv_func_argz_insert=3Dyes
ac_cv_func_argz_next=3Dyes
ac_cv_func_argz_stringify=3Dyes
ac_cv_func_asprintf=3Dyes
ac_cv_func_atexit=3Dyes
ac_cv_func_atof=3Dyes
ac_cv_func_atoi=3Dyes
ac_cv_func_authdes_create=3Dyes
ac_cv_func_authdes_seccreate=3Dno
ac_cv_func_backtrace=3Dyes
ac_cv_func_bcmp=3Dyes
ac_cv_func_bcopy=3Dyes
ac_cv_func_bind_textdomain_codeset=3Dyes
ac_cv_func_bindresvport=3Dyes
ac_cv_func_btowc=3Dyes
ac_cv_func_bzero=3Dyes
ac_cv_func_calloc=3Dyes
ac_cv_func_canonicalize_file_name=3Dyes
ac_cv_func_catgets=3Dyes
ac_cv_func_cfgetospeed=3Dyes
ac_cv_func_cfsetispeed=3Dyes
ac_cv_func_cfsetspeed=3Dyes
ac_cv_func_chmod=3Dyes
ac_cv_func_chown=3Dyes
ac_cv_func_chroot=3Dyes
ac_cv_func_clock=3Dyes
ac_cv_func_clock_gettime=3Dno
ac_cv_func_close=3Dyes
ac_cv_func_closedir=3Dyes
ac_cv_func_closelog=3Dyes
ac_cv_func_confstr=3Dyes
ac_cv_func_connect=3Dyes
ac_cv_func_daemon=3Dyes
ac_cv_func_dcgettext=3Dyes
ac_cv_func_difftime=3Dyes
ac_cv_func_dirfd=3Dyes
ac_cv_func_dirname=3Dyes
ac_cv_func_dlopen=3Dyes
ac_cv_func_dngettext=3Dyes
ac_cv_func_dup2=3Dyes
ac_cv_func_ecvt=3Dyes
ac_cv_func_endgrent=3Dyes
ac_cv_func_endmntent=3Dyes
ac_cv_func_endpwent=3Dyes
ac_cv_func_endutent=3Dyes
ac_cv_func_endutxent=3Dyes
ac_cv_func_epoll_ctl=3Dyes
ac_cv_func_err=3Dyes
ac_cv_func_ether_hostton=3Dyes
ac_cv_func_ether_ntohost=3Dyes
ac_cv_func_euidaccess=3Dyes
ac_cv_func_execv=3Dyes
ac_cv_func_fchdir=3Dyes
ac_cv_func_fchmod=3Dyes
ac_cv_func_fchmodat=3Dyes
ac_cv_func_fchown=3Dyes
ac_cv_func_fchownat=3Dyes
ac_cv_func_fcntl=3Dyes
ac_cv_func_fcvt=3Dyes
ac_cv_func_fdatasync=3Dyes
ac_cv_func_fdopendir=3Dyes
ac_cv_func_feof_unlocked=3Dyes
ac_cv_func_ffs=3Dyes
ac_cv_func_fgets_unlocked=3Dyes
ac_cv_func_fgetxattr=3Dyes
ac_cv_func_finite=3Dyes
ac_cv_func_flistxattr=3Dyes
ac_cv_func_flock=3Dyes
ac_cv_func_flockfile=3Dyes
ac_cv_func_fnmatch=3Dyes
ac_cv_func_fork=3Dyes
ac_cv_func_fpathconf=3Dyes
ac_cv_func_fprintf=3Dyes
ac_cv_func_free=3Dyes
ac_cv_func_freeaddrinfo=3Dyes
ac_cv_func_freeifaddrs=3Dyes
ac_cv_func_fseeko=3Dyes
ac_cv_func_fsetxattr=3Dyes
ac_cv_func_fstat64=3Dyes
ac_cv_func_fstat=3Dyes
ac_cv_func_fstatfs=3Dyes
ac_cv_func_fsync=3Dyes
ac_cv_func_ftello=3Dyes
ac_cv_func_ftime=3Dyes
ac_cv_func_ftruncate=3Dyes
ac_cv_func_funlockfile=3Dyes
ac_cv_func_futimes=3Dyes
ac_cv_func_futimesat=3Dyes
ac_cv_func_gai_strerror=3Dyes
ac_cv_func_gcvt=3Dyes
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_getc_unlocked=3Dyes
ac_cv_func_getcwd=3Dyes
ac_cv_func_getdelim=3Dyes
ac_cv_func_getdomainname=3Dyes
ac_cv_func_getdtablesize=3Dyes
ac_cv_func_getegid=3Dyes
ac_cv_func_getenv=3Dyes
ac_cv_func_geteuid=3Dyes
ac_cv_func_getgid=3Dyes
ac_cv_func_getgrent=3Dyes
ac_cv_func_getgrent_r=3Dyes
ac_cv_func_getgrgid_r=3Dyes
ac_cv_func_getgrnam=3Dyes
ac_cv_func_getgrnam_r=3Dyes
ac_cv_func_getgrouplist=3Dyes
ac_cv_func_getgroups=3Dyes
ac_cv_func_gethostbyaddr_r=3Dyes
ac_cv_func_gethostbyname2=3Dyes
ac_cv_func_gethostbyname=3Dyes
ac_cv_func_gethostbyname_r=3Dyes
ac_cv_func_gethostent=3Dyes
ac_cv_func_gethostid=3Dyes
ac_cv_func_gethostname=3Dyes
ac_cv_func_getifaddrs=3Dyes
ac_cv_func_getisax=3Dno
ac_cv_func_getline=3Dyes
ac_cv_func_getloadavg=3Dyes
ac_cv_func_getmntent=3Dyes
ac_cv_func_getmsg=3Dyes
ac_cv_func_getnameinfo=3Dyes
ac_cv_func_getnetbyaddr_r=3Dyes
ac_cv_func_getnetgrent_r=3Dyes
ac_cv_func_getopt=3Dyes
ac_cv_func_getopt_long=3Dyes
ac_cv_func_getopt_long_only=3Dyes
ac_cv_func_getpagesize=3Dyes
ac_cv_func_getpass=3Dyes
ac_cv_func_getpeereid=3Dno
ac_cv_func_getpeername=3Dyes
ac_cv_func_getpeerucred=3Dno
ac_cv_func_getpgrp=3Dyes
ac_cv_func_getpgrp_void=3Dyes
ac_cv_func_getpid=3Dyes
ac_cv_func_getppid=3Dyes
ac_cv_func_getprotoent_r=3Dyes
ac_cv_func_getpwent=3Dyes
ac_cv_func_getpwent_r=3Dyes
ac_cv_func_getpwnam=3Dyes
ac_cv_func_getpwnam_r=3Dyes
ac_cv_func_getpwuid=3Dyes
ac_cv_func_getpwuid_r=3Dyes
ac_cv_func_getresuid=3Dyes
ac_cv_func_getrlimit=3Dyes
ac_cv_func_getrusage=3Dyes
ac_cv_func_getservbyname=3Dyes
ac_cv_func_getservbyname_r=3Dyes
ac_cv_func_getservbyport_r=3Dyes
ac_cv_func_getservent=3Dyes
ac_cv_func_getservent_r=3Dyes
ac_cv_func_getspnam=3Dyes
ac_cv_func_getspnam_r=3Dyes
ac_cv_func_gettimeofday=3Dyes
ac_cv_func_getttyent=3Dyes
ac_cv_func_getttynam=3Dyes
ac_cv_func_getuid=3Dyes
ac_cv_func_getusershell=3Dyes
ac_cv_func_getutent=3Dyes
ac_cv_func_getutid=3Dyes
ac_cv_func_getutline=3Dyes
ac_cv_func_getutmp=3Dyes
ac_cv_func_getutmpx=3Dyes
ac_cv_func_getutxent=3Dyes
ac_cv_func_getutxid=3Dyes
ac_cv_func_getutxline=3Dyes
ac_cv_func_getwd=3Dyes
ac_cv_func_getxattr=3Dyes
ac_cv_func_getzoneid=3Dno
ac_cv_func_glob=3Dyes
ac_cv_func_gmtime=3Dyes
ac_cv_func_gmtime_r=3Dyes
ac_cv_func_grantpt=3Dyes
ac_cv_func_group_member=3Dyes
ac_cv_func_herror=3Dyes
ac_cv_func_hstrerror=3Dyes
ac_cv_func_iconv=3Dyes
ac_cv_func_iconv_open=3Dyes
ac_cv_func_if_freenameindex=3Dyes
ac_cv_func_if_indextoname=3Dyes
ac_cv_func_if_nameindex=3Dyes
ac_cv_func_if_nametoindex=3Dyes
ac_cv_func_index=3Dyes
ac_cv_func_inet_addr=3Dyes
ac_cv_func_inet_aton=3Dyes
ac_cv_func_inet_ntoa=3Dyes
ac_cv_func_inet_ntop=3Dyes
ac_cv_func_inet_pton=3Dyes
ac_cv_func_initgroups=3Dyes
ac_cv_func_innetgr=3Dyes
ac_cv_func_iruserok=3Dyes
ac_cv_func_isascii=3Dyes
ac_cv_func_isatty=3Dyes
ac_cv_func_isblank=3Dyes
ac_cv_func_isgraph=3Dyes
ac_cv_func_isinf=3Dyes
ac_cv_func_isnan=3Dyes
ac_cv_func_isprint=3Dyes
ac_cv_func_isspace=3Dyes
ac_cv_func_iswalnum=3Dyes
ac_cv_func_iswcntrl=3Dyes
ac_cv_func_iswctype=3Dyes
ac_cv_func_iswprint=3Dyes
ac_cv_func_iswspace=3Dyes
ac_cv_func_iswupper=3Dyes
ac_cv_func_isxdigit=3Dyes
ac_cv_func_kill=3Dyes
ac_cv_func_killpg=3Dyes
ac_cv_func_lchown=3Dyes
ac_cv_func_lckpwdf=3Dyes
ac_cv_func_lgetxattr=3Dyes
ac_cv_func_link=3Dyes
ac_cv_func_listxattr=3Dyes
ac_cv_func_llistxattr=3Dyes
ac_cv_func_localtime=3Dyes
ac_cv_func_localtime_r=3Dyes
ac_cv_func_lockf=3Dyes
ac_cv_func_lrand48=3Dyes
ac_cv_func_lsearch=3Dyes
ac_cv_func_lseek64=3Dyes
ac_cv_func_lsetxattr=3Dyes
ac_cv_func_lstat=3Dyes
ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
ac_cv_func_lstat_empty_string_bug=3Dno
ac_cv_func_mallinfo=3Dyes
ac_cv_func_malloc=3Dyes
ac_cv_func_malloc_0_nonnull=3Dyes
ac_cv_func_malloc_works=3Dyes
ac_cv_func_mblen=3Dyes
ac_cv_func_mbrlen=3Dyes
ac_cv_func_mbrtowc=3Dyes
ac_cv_func_mbsinit=3Dyes
ac_cv_func_mbsrtowcs=3Dyes
ac_cv_func_mbtowc=3Dyes
ac_cv_func_memalign=3Dyes
ac_cv_func_memchr=3Dyes
ac_cv_func_memcmp=3Dyes
ac_cv_func_memcmp_working=3Dyes
ac_cv_func_memcpy=3Dyes
ac_cv_func_memmove=3Dyes
ac_cv_func_mempcpy=3Dyes
ac_cv_func_memrchr=3Dyes
ac_cv_func_memset=3Dyes
ac_cv_func_mkdir=3Dyes
ac_cv_func_mkdirat=3Dyes
ac_cv_func_mkdtemp=3Dyes
ac_cv_func_mkfifo=3Dyes
ac_cv_func_mknod=3Dyes
ac_cv_func_mkstemp64=3Dyes
ac_cv_func_mkstemp=3Dyes
ac_cv_func_mktime=3Dyes
ac_cv_func_mlock=3Dyes
ac_cv_func_mmap=3Dyes
ac_cv_func_mmap_fixed_mapped=3Dyes
ac_cv_func_mtrace=3Dyes
ac_cv_func_munlock=3Dyes
ac_cv_func_munmap=3Dyes
ac_cv_func_nanosleep=3Dyes
ac_cv_func_nice=3Dyes
ac_cv_func_nl_langinfo=3Dyes
ac_cv_func_ntp_adjtime=3Dyes
ac_cv_func_ntp_gettime=3Dyes
ac_cv_func_on_exit=3Dyes
ac_cv_func_open64=3Dyes
ac_cv_func_open=3Dyes
ac_cv_func_openat=3Dyes
ac_cv_func_opendir=3Dyes
ac_cv_func_openlog=3Dyes
ac_cv_func_pathconf=3Dyes
ac_cv_func_pci_device_enable=3Dyes
ac_cv_func_pci_device_is_boot_vga=3Dyes
ac_cv_func_pci_device_vgaarb_init=3Dyes
ac_cv_func_pci_system_init_dev_mem=3Dyes
ac_cv_func_pipe=3Dyes
ac_cv_func_poll=3Dyes
ac_cv_func_popen=3Dyes
ac_cv_func_posix_getgrgid_r=3Dyes
ac_cv_func_posix_getpwnam_r=3Dyes
ac_cv_func_posix_getpwuid_r=3Dyes
ac_cv_func_posix_memalign=3Dyes
ac_cv_func_prctl=3Dyes
ac_cv_func_pread=3Dyes
ac_cv_func_printf=3Dyes
ac_cv_func_printf_unix98=3Dyes
ac_cv_func_pselect=3Dyes
ac_cv_func_pthread_attr_getstack=3Dyes
ac_cv_func_pthread_key_delete=3Dyes
ac_cv_func_pthread_mutex_lock=3Dyes
ac_cv_func_ptsname=3Dyes
ac_cv_func_putenv=3Dyes
ac_cv_func_putgrent=3Dyes
ac_cv_func_putpwent=3Dyes
ac_cv_func_putspent=3Dyes
ac_cv_func_pututline=3Dyes
ac_cv_func_pututxline=3Dyes
ac_cv_func_putwc=3Dyes
ac_cv_func_pwrite=3Dyes
ac_cv_func_qsort=3Dyes
ac_cv_func_raise=3Dyes
ac_cv_func_rand=3Dyes
ac_cv_func_rand_r=3Dyes
ac_cv_func_random=3Dyes
ac_cv_func_re_comp=3Dyes
ac_cv_func_re_exec=3Dyes
ac_cv_func_re_search=3Dyes
ac_cv_func_read=3Dyes
ac_cv_func_readdir=3Dyes
ac_cv_func_readdir_r=3Dyes
ac_cv_func_readlink=3Dyes
ac_cv_func_realloc=3Dyes
ac_cv_func_realloc_0_nonnull=3Dyes
ac_cv_func_realloc_works=3Dyes
ac_cv_func_realpath=3Dyes
ac_cv_func_recvmsg=3Dyes
ac_cv_func_regcomp=3Dyes
ac_cv_func_regexec=3Dyes
ac_cv_func_remove=3Dyes
ac_cv_func_rename=3Dyes
ac_cv_func_rmdir=3Dyes
ac_cv_func_rpmatch=3Dyes
ac_cv_func_rresvport_af=3Dyes
ac_cv_func_ruserok=3Dyes
ac_cv_func_ruserok_af=3Dyes
ac_cv_func_sbrk=3Dyes
ac_cv_func_scandir=3Dyes
ac_cv_func_sched_setscheduler=3Dyes
ac_cv_func_sched_yield=3Dyes
ac_cv_func_select=3Dyes
ac_cv_func_semctl=3Dyes
ac_cv_func_semget=3Dyes
ac_cv_func_sendmsg=3Dyes
ac_cv_func_setbuf=3Dyes
ac_cv_func_setbuffer=3Dyes
ac_cv_func_setegid=3Dyes
ac_cv_func_setenv=3Dyes
ac_cv_func_seteuid=3Dyes
ac_cv_func_setgid=3Dyes
ac_cv_func_setgrent_void=3Dyes
ac_cv_func_setgroups=3Dyes
ac_cv_func_sethostname=3Dyes
ac_cv_func_setitimer=3Dyes
ac_cv_func_setjmp=3Dyes
ac_cv_func_setlinebuf=3Dyes
ac_cv_func_setlocale=3Dyes
ac_cv_func_setmntent=3Dyes
ac_cv_func_setpgid=3Dyes
ac_cv_func_setpgrp=3Dyes
ac_cv_func_setpgrp_void=3Dyes
ac_cv_func_setpriority=3Dyes
ac_cv_func_setregid=3Dyes
ac_cv_func_setresgid=3Dyes
ac_cv_func_setresuid=3Dyes
ac_cv_func_setreuid=3Dyes
ac_cv_func_setrlimit=3Dyes
ac_cv_func_setsid=3Dyes
ac_cv_func_setsockopt=3Dyes
ac_cv_func_settimeofday=3Dyes
ac_cv_func_setuid=3Dyes
ac_cv_func_setutent=3Dyes
ac_cv_func_setutxent=3Dyes
ac_cv_func_setvbuf=3Dyes
ac_cv_func_setvbuf_reversed=3Dno
ac_cv_func_setxattr=3Dyes
ac_cv_func_sgetspent=3Dyes
ac_cv_func_shmat=3Dyes
ac_cv_func_shmctl64=3Dno
ac_cv_func_shmctl=3Dyes
ac_cv_func_shmdt=3Dyes
ac_cv_func_shmget=3Dyes
ac_cv_func_shutdown=3Dyes
ac_cv_func_sigaction=3Dyes
ac_cv_func_sigaddset=3Dyes
ac_cv_func_sigaltstack=3Dyes
ac_cv_func_sigblock=3Dyes
ac_cv_func_sigemptyset=3Dyes
ac_cv_func_sighold=3Dyes
ac_cv_func_siginterrupt=3Dyes
ac_cv_func_signal=3Dyes
ac_cv_func_sigprocmask=3Dyes
ac_cv_func_sigset=3Dyes
ac_cv_func_sigsetmask=3Dyes
ac_cv_func_sigstack=3Dyes
ac_cv_func_sigsuspend=3Dyes
ac_cv_func_sigvec=3Dyes
ac_cv_func_snprintf=3Dyes
ac_cv_func_snprintf_c99=3Dyes
ac_cv_func_socket=3Dyes
ac_cv_func_socketpair=3Dyes
ac_cv_func_sprintf=3Dyes
ac_cv_func_srand48=3Dyes
ac_cv_func_srand=3Dyes
ac_cv_func_srandom=3Dyes
ac_cv_func_sscanf=3Dyes
ac_cv_func_stat=3Dyes
ac_cv_func_stat_empty_string_bug=3Dno
ac_cv_func_stat_ignores_trailing_slash=3Dno
ac_cv_func_statfs=3Dyes
ac_cv_func_statvfs=3Dyes
ac_cv_func_stime=3Dyes
ac_cv_func_stpcpy=3Dyes
ac_cv_func_strcasecmp=3Dyes
ac_cv_func_strcasestr=3Dyes
ac_cv_func_strchr=3Dyes
ac_cv_func_strchrnul=3Dyes
ac_cv_func_strcmp=3Dyes
ac_cv_func_strcspn=3Dyes
ac_cv_func_strdup=3Dyes
ac_cv_func_strerror=3Dyes
ac_cv_func_strerror_r=3Dyes
ac_cv_func_strftime=3Dyes
ac_cv_func_strlcat=3Dno
ac_cv_func_strlcpy=3Dno
ac_cv_func_strlen=3Dyes
ac_cv_func_strncasecmp=3Dyes
ac_cv_func_strncmp=3Dyes
ac_cv_func_strndup=3Dyes
ac_cv_func_strnlen=3Dyes
ac_cv_func_strpbrk=3Dyes
ac_cv_func_strptime=3Dyes
ac_cv_func_strrchr=3Dyes
ac_cv_func_strsep=3Dyes
ac_cv_func_strsignal=3Dyes
ac_cv_func_strspn=3Dyes
ac_cv_func_strstr=3Dyes
ac_cv_func_strtod=3Dyes
ac_cv_func_strtoimax=3Dyes
ac_cv_func_strtok_r=3Dyes
ac_cv_func_strtol=3Dyes
ac_cv_func_strtoll=3Dyes
ac_cv_func_strtoul=3Dyes
ac_cv_func_strtoull=3Dyes
ac_cv_func_strtoumax=3Dyes
ac_cv_func_strverscmp=3Dyes
ac_cv_func_strxfrm=3Dyes
ac_cv_func_symlink=3Dyes
ac_cv_func_sync=3Dyes
ac_cv_func_sys_siglist=3Dyes
ac_cv_func_sysconf=3Dyes
ac_cv_func_sysctl=3Dyes
ac_cv_func_sysinfo=3Dyes
ac_cv_func_syslog=3Dyes
ac_cv_func_system=3Dyes
ac_cv_func_tcgetattr=3Dyes
ac_cv_func_tcgetpgrp=3Dyes
ac_cv_func_tcsetattr=3Dyes
ac_cv_func_tcsetpgrp=3Dyes
ac_cv_func_time=3Dyes
ac_cv_func_timegm=3Dyes
ac_cv_func_times=3Dyes
ac_cv_func_timezone=3Dyes
ac_cv_func_tmpnam=3Dyes
ac_cv_func_towlower=3Dyes
ac_cv_func_towupper=3Dyes
ac_cv_func_truncate=3Dyes
ac_cv_func_tsearch=3Dyes
ac_cv_func_ttyname=3Dyes
ac_cv_func_tzset=3Dyes
ac_cv_func_ulimit=3Dyes
ac_cv_func_umask=3Dyes
ac_cv_func_uname=3Dyes
ac_cv_func_unlink=3Dyes
ac_cv_func_unsetenv=3Dyes
ac_cv_func_unshare=3Dyes
ac_cv_func_updwtmp=3Dyes
ac_cv_func_updwtmpx=3Dyes
ac_cv_func_usleep=3Dyes
ac_cv_func_ustat=3Dyes
ac_cv_func_utime=3Dyes
ac_cv_func_utimes=3Dyes
ac_cv_func_utmpname=3Dyes
ac_cv_func_utmpxname=3Dyes
ac_cv_func_va_copy=3Dyes
ac_cv_func_valloc=3Dyes
ac_cv_func_vasprintf=3Dyes
ac_cv_func_verrx=3Dyes
ac_cv_func_vfork=3Dyes
ac_cv_func_vfprintf=3Dyes
ac_cv_func_vfscanf=3Dyes
ac_cv_func_vhangup=3Dyes
ac_cv_func_vprintf=3Dyes
ac_cv_func_vsnprintf=3Dyes
ac_cv_func_vsnprintf_c99=3Dyes
ac_cv_func_vsprintf=3Dyes
ac_cv_func_wait3=3Dyes
ac_cv_func_wait4=3Dyes
ac_cv_func_waitpid=3Dyes
ac_cv_func_walkcontext=3Dno
ac_cv_func_wcrtomb=3Dyes
ac_cv_func_wcscoll=3Dyes
ac_cv_func_wcsdup=3Dyes
ac_cv_func_wcslen=3Dyes
ac_cv_func_wctob=3Dyes
ac_cv_func_wctomb=3Dyes
ac_cv_func_wctype=3Dyes
ac_cv_func_wcwidth=3Dyes
ac_cv_func_wmemchr=3Dyes
ac_cv_func_wmemcpy=3Dyes
ac_cv_func_wmempcpy=3Dyes
ac_cv_have_abstract_sockets=3Dyes
ac_cv_have_accrights_in_msghdr=3Dno
ac_cv_have_broken_dirname=3Dyes
ac_cv_have_broken_snprintf=3Dno
ac_cv_have_control_in_msghdr=3Dyes
ac_cv_have_decl_sys_siglist=3Dyes
ac_cv_have_openpty_ctty_bug=3Dyes
ac_cv_have_space_d_name_in_struct_dirent=3Dyes
ac_cv_header_aio_h=3Dyes
ac_cv_header_alloca_h=3Dyes
ac_cv_header_argz_h=3Dyes
ac_cv_header_arpa_inet_h=3Dyes
ac_cv_header_arpa_nameser_h=3Dyes
ac_cv_header_asm_byteorder_h=3Dyes
ac_cv_header_asm_ioctls_h=3Dyes
ac_cv_header_asm_mtrr_h=3Dno
ac_cv_header_asm_page_h=3Dno
ac_cv_header_asm_types_h=3Dyes
ac_cv_header_assert_h=3Dyes
ac_cv_header_byteswap_h=3Dyes
ac_cv_header_crypt_h=3Dyes
ac_cv_header_ctype_h=3Dyes
ac_cv_header_dbm_h=3Dno
ac_cv_header_dirent_dirent_h=3Dyes
ac_cv_header_dirent_h=3Dyes
ac_cv_header_dlfcn_h=3Dyes
ac_cv_header_elf_h=3Dyes
ac_cv_header_endian_h=3Dyes
ac_cv_header_err_h=3Dyes
ac_cv_header_errno_h=3Dyes
ac_cv_header_execinfo_h=3Dyes
ac_cv_header_fcntl_h=3Dyes
ac_cv_header_features_h=3Dyes
ac_cv_header_float_h=3Dyes
ac_cv_header_fnmatch_h=3Dyes
ac_cv_header_fstab_h=3Dyes
ac_cv_header_ftw_h=3Dyes
ac_cv_header_getopt_h=3Dyes
ac_cv_header_glob_h=3Dyes
ac_cv_header_grp_h=3Dyes
ac_cv_header_iconv_h=3Dyes
ac_cv_header_ifaddrs_h=3Dyes
ac_cv_header_inttypes_h=3Dyes
ac_cv_header_langinfo_h=3Dyes
ac_cv_header_lastlog_h=3Dyes
ac_cv_header_libgen_h=3Dyes
ac_cv_header_libintl_h=3Dyes
ac_cv_header_limits_h=3Dyes
ac_cv_header_linux_agpgart_h=3Dyes
ac_cv_header_linux_apm_bios_h=3Dyes
ac_cv_header_linux_capability_h=3Dyes
ac_cv_header_linux_fb_h=3Dyes
ac_cv_header_linux_fd_h=3Dyes
ac_cv_header_linux_fs_h=3Dyes
ac_cv_header_linux_hayesesp_h=3Dno
ac_cv_header_linux_hdreg_h=3Dyes
ac_cv_header_linux_icmp_h=3Dyes
ac_cv_header_linux_in6_h=3Dyes
ac_cv_header_linux_joystick_h=3Dyes
ac_cv_header_linux_ptrace_h=3Dyes
ac_cv_header_linux_serial_h=3Dyes
ac_cv_header_linux_sonypi_h=3Dyes
ac_cv_header_linux_unistd_h=3Dyes
ac_cv_header_linux_utsname_h=3Dyes
ac_cv_header_linux_version_h=3Dyes
ac_cv_header_locale_h=3Dyes
ac_cv_header_machine_apmvar_h=3Dno
ac_cv_header_machine_mtrr_h=3Dno
ac_cv_header_malloc_h=3Dyes
ac_cv_header_math_h=3Dyes
ac_cv_header_mcheck_h=3Dyes
ac_cv_header_memory_h=3Dyes
ac_cv_header_mntent_h=3Dyes
ac_cv_header_mqueue_h=3Dyes
ac_cv_header_ndbm_h=3Dno
ac_cv_header_net_if_h=3Dyes
ac_cv_header_net_route_h=3Dyes
ac_cv_header_netdb_h=3Dyes
ac_cv_header_netinet_ether_h=3Dyes
ac_cv_header_netinet_in_h=3Dyes
ac_cv_header_netinet_ip6_h=3Dyes
ac_cv_header_netinet_ip_h=3Dyes
ac_cv_header_netinet_sctp_h=3Dno
ac_cv_header_netinet_sctp_uio_h=3Dno
ac_cv_header_netinet_tcp_h=3Dyes
ac_cv_header_netinet_udp_h=3Dyes
ac_cv_header_netipx_ipx_h=3Dyes
ac_cv_header_paths_h=3Dyes
ac_cv_header_poll_h=3Dyes
ac_cv_header_pthread_h=3Dyes
ac_cv_header_pty_h=3Dyes
ac_cv_header_pwd_h=3Dyes
ac_cv_header_regex_h=3Dyes
ac_cv_header_resolv_h=3Dyes
ac_cv_header_rpc_rpc_h=3Dyes
ac_cv_header_rpc_types_h=3Dyes
ac_cv_header_rpcsvc_dbm_h=3Dno
ac_cv_header_sched_h=3Dyes
ac_cv_header_scsi_scsi_h=3Dyes
ac_cv_header_search_h=3Dyes
ac_cv_header_semaphore_h=3Dyes
ac_cv_header_setjmp_h=3Dyes
ac_cv_header_sgtty_h=3Dyes
ac_cv_header_shadow_h=3Dyes
ac_cv_header_signal_h=3Dyes
ac_cv_header_stdarg_h=3Dyes
ac_cv_header_stdbool_h=3Dyes
ac_cv_header_stdc=3Dyes
ac_cv_header_stddef_h=3Dyes
ac_cv_header_stdint_h=3Dyes
ac_cv_header_stdio_h=3Dyes
ac_cv_header_stdlib_h=3Dyes
ac_cv_header_string_h=3Dyes
ac_cv_header_strings_h=3Dyes
ac_cv_header_stropts_h=3Dyes
ac_cv_header_sys_agpgart_h=3Dno
ac_cv_header_sys_agpio_h=3Dno
ac_cv_header_sys_bitypes_h=3Dyes
ac_cv_header_sys_cdefs_h=3Dyes
ac_cv_header_sys_dir_h=3Dyes
ac_cv_header_sys_endian_h=3Dno
ac_cv_header_sys_epoll_h=3Dyes
ac_cv_header_sys_fcntl_h=3Dyes
ac_cv_header_sys_file_h=3Dyes
ac_cv_header_sys_fsuid_h=3Dyes
ac_cv_header_sys_ioctl_h=3Dyes
ac_cv_header_sys_ipc_h=3Dyes
ac_cv_header_sys_linker_h=3Dno
ac_cv_header_sys_memrange_h=3Dno
ac_cv_header_sys_mman_h=3Dyes
ac_cv_header_sys_mount_h=3Dyes
ac_cv_header_sys_mtio_h=3Dyes
ac_cv_header_sys_param_h=3Dyes
ac_cv_header_sys_poll_h=3Dyes
ac_cv_header_sys_prctl_h=3Dyes
ac_cv_header_sys_ptrace_h=3Dyes
ac_cv_header_sys_queue_h=3Dyes
ac_cv_header_sys_reg_h=3Dno
ac_cv_header_sys_resource_h=3Dyes
ac_cv_header_sys_select_h=3Dyes
ac_cv_header_sys_sem_h=3Dyes
ac_cv_header_sys_shm_h=3Dyes
ac_cv_header_sys_signal_h=3Dyes
ac_cv_header_sys_socket_h=3Dyes
ac_cv_header_sys_socketvar_h=3Dyes
ac_cv_header_sys_soundcard_h=3Dyes
ac_cv_header_sys_stat_h=3Dyes
ac_cv_header_sys_statfs_h=3Dyes
ac_cv_header_sys_statvfs_h=3Dyes
ac_cv_header_sys_stropts_h=3Dyes
ac_cv_header_sys_swap_h=3Dyes
ac_cv_header_sys_sysctl_h=3Dyes
ac_cv_header_sys_sysinfo_h=3Dyes
ac_cv_header_sys_sysmacros_h=3Dyes
ac_cv_header_sys_termios_h=3Dyes
ac_cv_header_sys_time_h=3Dyes
ac_cv_header_sys_timeb_h=3Dyes
ac_cv_header_sys_times_h=3Dyes
ac_cv_header_sys_timex_h=3Dyes
ac_cv_header_sys_types_h=3Dyes
ac_cv_header_sys_uio_h=3Dyes
ac_cv_header_sys_un_h=3Dyes
ac_cv_header_sys_unistd_h=3Dyes
ac_cv_header_sys_user_h=3Dyes
ac_cv_header_sys_utsname_h=3Dyes
ac_cv_header_sys_vfs_h=3Dyes
ac_cv_header_sys_wait_h=3Dyes
ac_cv_header_sysexits_h=3Dyes
ac_cv_header_syslog_h=3Dyes
ac_cv_header_termio_h=3Dyes
ac_cv_header_termios_h=3Dyes
ac_cv_header_time_h=3Dyes
ac_cv_header_ttyent_h=3Dyes
ac_cv_header_ulimit_h=3Dyes
ac_cv_header_unistd_h=3Dyes
ac_cv_header_ustat_h=3Dyes
ac_cv_header_utime_h=3Dyes
ac_cv_header_utmp_h=3Dyes
ac_cv_header_utmpx_h=3Dyes
ac_cv_header_values_h=3Dyes
ac_cv_header_wchar_h=3Dyes
ac_cv_header_wctype_h=3Dyes
ac_cv_header_zlib_h=3Dyes
ac_cv_host=3Dpowerpc-poky-linux-gnu
ac_cv_ispeed_offset=3D13
ac_cv_lib_Xdmcp_XdmcpWrap=3Dyes
ac_cv_lib_c_backtrace=3Dyes
ac_cv_lib_crypto_SHA1_Init=3Dyes
ac_cv_lib_gcrypt_gcry_md_open=3Dyes
ac_cv_lib_lex=3D-lfl
ac_cv_lib_m_cbrt=3Dyes
ac_cv_lib_m_sqrt=3Dyes
ac_cv_lib_md_SHA1Init=3Dno
ac_cv_lib_png_png_create_info_struct=3Dyes
ac_cv_lib_rt_clock_gettime=3Dyes
ac_cv_libnet_endianess=3Dbig
ac_cv_linux_vers=3D2
ac_cv_member_struct_sockaddr_in_sin_len=3Dno
ac_cv_need_trio=3Dno
ac_cv_negative_eai=3Dyes
ac_cv_o_nonblock_inherited=3Dno
ac_cv_objext=3Do
ac_cv_path_DTRACE=3Dnot_found
ac_cv_path_EGREP=3D'/bin/grep -E'
ac_cv_path_FGREP=3D'/bin/grep -F'
ac_cv_path_GREP=3D/bin/grep
ac_cv_path_PERL=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/per=
l
ac_cv_path_PKG_CONFIG=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/b=
in/pkg-config
ac_cv_path_RAWCPP=3D/usr/bin/cpp
ac_cv_path_SED=3D/bin/sed
ac_cv_path_XMLTO=3D/usr/bin/xmlto
ac_cv_path_ac_pt_PKG_CONFIG=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux=
/usr/bin/pkg-config
ac_cv_path_install=3D'/usr/bin/install -c'
ac_cv_path_mkdir=3D/bin/mkdir
ac_cv_pread=3Dno
ac_cv_prog_AR=3Dpowerpc-poky-linux-ar
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_CC=3D'powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemuppc'
ac_cv_prog_CPP=3D'powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test=
/tmp/sysroots/qemuppc'
ac_cv_prog_DLLTOOL=3Ddlltool
ac_cv_prog_LEX=3Dflex
ac_cv_prog_OBJDUMP=3Dpowerpc-poky-linux-objdump
ac_cv_prog_RANLIB=3Dpowerpc-poky-linux-ranlib
ac_cv_prog_STRIP=3Dpowerpc-poky-linux-strip
ac_cv_prog_YACC=3D'bison -y'
ac_cv_prog_ac_ct_MANIFEST_TOOL=3Dmt
ac_cv_prog_cc_c89=3D
ac_cv_prog_cc_c99=3D-std=3Dgnu99
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_lex_root=3Dlex.yy
ac_cv_prog_lex_yytext_pointer=3Dyes
ac_cv_prog_make_make_set=3Dyes
ac_cv_pwrite=3Dno
ac_cv_regexec_segfault_emptystr=3Dno
ac_cv_sctp=3Dno
ac_cv_search_gethostbyname=3D'none required'
ac_cv_search_getsecretkey=3D'none required'
ac_cv_search_opendir=3D'none required'
ac_cv_search_socket=3D'none required'
ac_cv_sizeof___int64=3D0
ac_cv_sizeof_bool=3D1
ac_cv_sizeof_char=3D1
ac_cv_sizeof_char_p=3D4
ac_cv_sizeof_double=3D8
ac_cv_sizeof_float=3D4
ac_cv_sizeof_int=3D4
ac_cv_sizeof_int_p=3D4
ac_cv_sizeof_long=3D4
ac_cv_sizeof_long_double=3D8
ac_cv_sizeof_long_int=3D4
ac_cv_sizeof_long_long=3D8
ac_cv_sizeof_long_long_int=3D8
ac_cv_sizeof_long_p=3D4
ac_cv_sizeof_off_t=3D4
ac_cv_sizeof_pid_t=3D4
ac_cv_sizeof_ptrdiff_t=3D4
ac_cv_sizeof_short=3D2
ac_cv_sizeof_short_int=3D2
ac_cv_sizeof_signed_char=3D1
ac_cv_sizeof_size_t=3D4
ac_cv_sizeof_ssize_t=3D4
ac_cv_sizeof_unsigned_char=3D1
ac_cv_sizeof_unsigned_int=3D4
ac_cv_sizeof_unsigned_long=3D4
ac_cv_sizeof_unsigned_long_int=3D4
ac_cv_sizeof_unsigned_long_long_int=3D8
ac_cv_sizeof_unsigned_short=3D2
ac_cv_sizeof_unsigned_short_int=3D2
ac_cv_sizeof_void_p=3D4
ac_cv_sizeof_wchar_t=3D4
ac_cv_socklen_t=3Dyes
ac_cv_strerror_r_SUSv3=3Dno
ac_cv_struct_rlimit=3Dyes
ac_cv_sync_with_stdio=3Dyes
ac_cv_sync_with_stdio_2=3Dyes
ac_cv_sys_file_offset_bits=3D64
ac_cv_sys_largefile_CC=3Dno
ac_cv_sys_linker_h=3Dno
ac_cv_sys_restartable_syscalls=3Dyes
ac_cv_sysv_ipc=3Dyes
ac_cv_time_r_type=3DPOSIX
ac_cv_tls=3D__thread
ac_cv_type___int64=3Dno
ac_cv_type_int=3Dyes
ac_cv_type_pid_t=3Dyes
ac_cv_type_signal=3Dvoid
ac_cv_type_size_t=3Dyes
ac_cv_type_socklen_t=3Dyes
ac_cv_type_struct_timespec=3Dyes
ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
ac_cv_type_uintptr_t=3Dyes
ac_cv_type_void_p=3Dyes
ac_cv_uchar=3Dno
ac_cv_uint=3Dyes
ac_cv_ulong=3Dyes
ac_cv_ushort=3Dyes
ac_cv_va_copy=3Dyes
ac_cv_working_alloca_h=3Dyes
am_cv_CCAS_dependencies_compiler_type=3Dgcc3
am_cv_CC_dependencies_compiler_type=3Dgcc3
am_cv_OBJC_dependencies_compiler_type=3Dnone
am_cv_func_working_getline=3Dyes
am_cv_scanf_lld=3Dyes
apr_cv_epoll=3Dyes
apr_cv_gai_addrconfig=3Dno
apr_cv_mutex_recursive=3Dyes
apr_cv_process_shared_works=3Dno
apr_cv_pthreads_cflags=3D-pthread
apr_cv_pthreads_lib=3D-lpthread
apr_cv_tcp_nodelay_with_cork=3Dyes
apr_cv_use_lfs64=3Dyes
bash_cv_dup2_broken=3Dno
bash_cv_func_sigsetjmp=3Dmissing
bash_cv_func_strcoll_broken=3Dno
bash_cv_getcwd_calls_popen=3Dno
bash_cv_getenv_redef=3Dyes
bash_cv_have_mbstate_t=3Dyes
bash_cv_job_control_missing=3Dpresent
bash_cv_must_reinstall_sighandlers=3Dno
bash_cv_opendir_not_robust=3Dno
bash_cv_pgrp_pipe=3Dno
bash_cv_printf_a_format=3Dyes
bash_cv_sys_named_pipes=3Dpresent
bash_cv_sys_siglist=3Dyes
bash_cv_type_rlimit=3Drlim_t
bash_cv_ulimit_maxfds=3Dyes
bash_cv_under_sys_siglist=3Dyes
bash_cv_unusable_rtsigs=3Dno
compat_cv_func_basename_works=3Dno
compat_cv_func_dirname_works=3Dno
compat_cv_func_snprintf_works=3Dyes
cvs_cv_func_printf_ptr=3Dyes
db_cv_align_t=3D'unsigned long long'
db_cv_alignp_t=3D'unsigned long'
db_cv_fcntl_f_setfd=3Dyes
db_cv_mutex=3Dno
db_cv_path_ar=3D/usr/bin/ar
db_cv_path_chmod=3D/bin/chmod
db_cv_path_cp=3D/bin/cp
db_cv_path_ln=3D/bin/ln
db_cv_path_mkdir=3D/bin/mkdir
db_cv_path_ranlib=3D/usr/bin/ranlib
db_cv_path_rm=3D/bin/rm
db_cv_path_sh=3D/bin/sh
db_cv_path_strip=3D/usr/bin/strip
db_cv_posixmutexes=3Dno
db_cv_spinlocks=3Dno
db_cv_sprintf_count=3Dyes
db_cv_uimutexes=3Dno
dpkg_cv___va_copy=3Dyes
dpkg_cv_va_copy=3Dyes
ettercap_cv_type_socklen_t=3Dyes
fu_cv_sys_stat_statvfs64=3Dyes
gl_cv_func_btowc_eof=3Dyes
gl_cv_func_mbrtowc_incomplete_state=3Dyes
gl_cv_func_mbrtowc_nul_retval=3Dyes
gl_cv_func_mbrtowc_null_arg=3Dyes
gl_cv_func_mbrtowc_retval=3Dyes
gl_cv_func_mbrtowc_sanitycheck=3Dyes
gl_cv_func_wcrtomb_retval=3Dyes
gl_cv_func_wctob_works=3Dyes
glib_cv___va_copy=3Dyes
glib_cv_compliant_posix_memalign=3D1
glib_cv_has__inline=3Dyes
glib_cv_has__inline__=3Dyes
glib_cv_hasinline=3Dyes
glib_cv_long_long_format=3Dll
glib_cv_rtldglobal_broken=3Dno
glib_cv_sane_realloc=3Dyes
glib_cv_sizeof_gmutex=3D24
glib_cv_sizeof_intmax_t=3D8
glib_cv_sizeof_ptrdiff_t=3D4
glib_cv_sizeof_size_t=3D4
glib_cv_sizeof_system_thread=3D4
glib_cv_stack_grows=3Dno
glib_cv_strlcpy=3Dno
glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
glib_cv_sys_pthread_getspecific_posix=3Dyes
glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
glib_cv_sys_use_pid_niceness_surrogate=3Dyes
glib_cv_uscore=3Dno
glib_cv_use_pid_surrogate=3Dyes
glib_cv_va_copy=3Dno
glib_cv_va_val_copy=3Dyes
gt_cv_locale_fr=3Dfr_FR
lf_cv_sane_realloc=3Dyes
lftp_cv___va_copy=3Dyes
lftp_cv_va_copy=3Dno
lftp_cv_va_val_copy=3Dyes
libIDL_cv_long_long_format=3Dll
libc_cv_mabi_ibmlongdouble=3Dyes
libc_cv_mlong_double_128=3Dyes
libc_cv_mlong_double_128ibm=3Dyes
libc_cv_ppc_machine=3Dyes
liberty_cv_uint64=3Duint64_t
lt_cv_ar_at_file=3D@
lt_cv_archive_cmds_need_lc=3Dno
lt_cv_deplibs_check_method=3Dpass_all
lt_cv_dlopen_self=3Dyes
lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
lt_cv_file_magic_test_file=3D
lt_cv_ld_reload_flag=3D-r
lt_cv_nm_interface=3D'BSD nm'
lt_cv_objdir=3D.libs
lt_cv_path_LD=3D'powerpc-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/=
sysroots/qemuppc'
lt_cv_path_NM=3Dpowerpc-poky-linux-nm
lt_cv_path_mainfest_tool=3Dno
lt_cv_prog_compiler_c_o=3Dyes
lt_cv_prog_compiler_pic=3D'-fPIC -DPIC'
lt_cv_prog_compiler_pic_works=3Dyes
lt_cv_prog_compiler_rtti_exceptions=3Dno
lt_cv_prog_compiler_static_works=3Dyes
lt_cv_prog_gnu_ld=3Dyes
lt_cv_sharedlib_from_linklib_cmd=3D'printf %s\n'
lt_cv_shlibpath_overrides_runpath=3Dno
lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABCDG=
IRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'' | sed '\''/ __=
gnu_lto/d'\'''
lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \([^ ]*\)[ =
]*$/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]*=
\)$/  {"\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'sed -n -e '\''s/^: =
\([^ ]*\)[ ]*$/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]=
*\) \(lib[^ ]*\)$/  {"\2", (void *) \&\2},/p'\'' -e '\''s/^[ABCDGIRSTW]* \(=
[^ ]*\) \([^ ]*\)$/  {"lib\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^T .* \(.*\)$/extern in=
t \1();/p'\'' -e '\''s/^[ABCDGIRSTW]* .* \(.*\)$/extern char \1;/p'\'''
lt_cv_sys_max_cmd_len=3D1572864
lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
mono_cv_uscore=3Dno
mr_cv_target_elf=3Dyes
mysql_cv_func_atomic_add=3Dno
mysql_cv_func_atomic_sub=3Dno
nano_cv_func_regexec_segv_emptystr=3Dno
php_cv_lib_cookie_io_functions_use_off64_t=3Dyes
pkg_cv_DBUS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/includ=
e/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/dbus-1.0/incl=
ude  '
pkg_cv_DBUS_LIBS=3D'-ldbus-1 -lpthread -lrt  '
pkg_cv_DMXMODULES_CFLAGS=3D' '
pkg_cv_DMXMODULES_LIBS=3D'-lXmuu -lXext -lXrender -lX11 -lXfixes -lXi -lXau=
 -lXdmcp  '
pkg_cv_GLIB_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/includ=
e/glib-2.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/glib-2.0/incl=
ude  '
pkg_cv_GLIB_LIBS=3D'-lglib-2.0  '
pkg_cv_HAL_CFLAGS=3D'-DDBUS_API_SUBJECT_TO_CHANGE -I/home/kyu3/sdb/test/tmp=
/sysroots/qemuppc/usr/include/hal -I/home/kyu3/sdb/test/tmp/sysroots/qemupp=
c/usr/include/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/d=
bus-1.0/include  '
pkg_cv_HAL_LIBS=3D'-lhal -ldbus-1 -lpthread -lrt  '
pkg_cv_OPENSSL_CFLAGS=3D' '
pkg_cv_OPENSSL_LIBS=3D'-lssl -lcrypto  '
pkg_cv_PCIACCESS_CFLAGS=3D' '
pkg_cv_PCIACCESS_LIBS=3D'-lpciaccess  '
pkg_cv_PIXMAN_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/incl=
ude/pixman-1  '
pkg_cv_PIXMAN_LIBS=3D'-lpixman-1  '
pkg_cv_UDEV_CFLAGS=3D' '
pkg_cv_UDEV_LIBS=3D'-ludev  '
pkg_cv_XDMCP_CFLAGS=3D' '
pkg_cv_XDMCP_LIBS=3D'-lXdmcp  '
pkg_cv_XF86VIDMODE_CFLAGS=3D' '
pkg_cv_XF86VIDMODE_LIBS=3D' '
pkg_cv_XNESTMODULES_CFLAGS=3D' '
pkg_cv_XNESTMODULES_LIBS=3D'-lXext -lX11 -lXau -lXdmcp  '
pkg_cv_XORG_MODULES_CFLAGS=3D' '
pkg_cv_XORG_MODULES_LIBS=3D' '
pkg_cv_XSERVERCFLAGS_CFLAGS=3D'-D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_=
BIT -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/pixman-1 -I/home=
/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/freetype2  '
pkg_cv_XSERVERCFLAGS_LIBS=3D'-lxkbfile -lpixman-1 -lXfont -lXau -lXdmcp  '
pkg_cv_XSERVERLIBS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr=
/include/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/fr=
eetype2  '
pkg_cv_XSERVERLIBS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp  '
samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3Dno
samba_cv_HAVE_BROKEN_GETGROUPS=3Dno
samba_cv_HAVE_BROKEN_READDIR=3Dyes
samba_cv_HAVE_BROKEN_READDIR_NAME=3Dno
samba_cv_HAVE_C99_VSNPRINTF=3Dyes
samba_cv_HAVE_DEV64_T=3Dno
samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes
samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes
samba_cv_HAVE_FCNTL_LOCK=3Dyes
samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes
samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
samba_cv_HAVE_IFACE_AIX=3Dno
samba_cv_HAVE_IFACE_IFCONF=3Dyes
samba_cv_HAVE_IFACE_IFREQ=3Dyes
samba_cv_HAVE_INO64_T=3Dno
samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3Dyes
samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3Dyes
samba_cv_HAVE_KERNEL_SHARE_MODES=3Dyes
samba_cv_HAVE_MAKEDEV=3Dyes
samba_cv_HAVE_MMAP=3Dyes
samba_cv_HAVE_OFF64_T=3Dno
samba_cv_HAVE_SECURE_MKSTEMP=3Dyes
samba_cv_HAVE_SENDFILE64=3Dyes
samba_cv_HAVE_SENDFILE=3Dyes
samba_cv_HAVE_STRUCT_FLOCK64=3Dyes
samba_cv_HAVE_TRUNCATED_SALT=3Dno
samba_cv_HAVE_UNSIGNED_CHAR=3Dyes
samba_cv_HAVE_WORKING_AF_LOCAL=3Dyes
samba_cv_LINUX_LFS_SUPPORT=3Dyes
samba_cv_REALPATH_TAKES_NULL=3Dyes
samba_cv_REPLACE_INET_NTOA=3Dno
samba_cv_REPLACE_READDIR=3Dno
samba_cv_SIZEOF_DEV_T=3Dyes
samba_cv_SIZEOF_INO_T=3Dyes
samba_cv_SIZEOF_OFF_T=3Dyes
samba_cv_STAT_STATVFS64=3Dyes
samba_cv_USE_SETEUID=3Dyes
samba_cv_USE_SETRESUID=3Dyes
samba_cv_USE_SETREUID=3Dyes
samba_cv_USE_SETUIDX=3Dyes
samba_cv_have_longlong=3Dyes
samba_cv_have_setresgid=3Dyes
samba_cv_have_setresuid=3Dyes
sc_cv_termios_ispeed=3Dyes
screen_cv_sys_bcopy_overlap=3Dno
screen_cv_sys_fifo_broken_impl=3Dyes
screen_cv_sys_fifo_usable=3Dyes
screen_cv_sys_memcpy_overlap=3Dno
screen_cv_sys_memmove_overlap=3Dno
screen_cv_sys_select_broken_retval=3Dno
screen_cv_sys_sockets_nofs=3Dno
screen_cv_sys_sockets_usable=3Dyes
screen_cv_sys_terminfo_used=3Dyes
shadow_cv_logdir=3D/var/log
shadow_cv_maildir=3D/var/spool/mail
shadow_cv_mailfile=3DMailbox
shadow_cv_passwd_dir=3D/usr/bin
shadow_cv_utmpdir=3D/var/run
slrn_cv___va_copy=3Dyes
slrn_cv_va_copy=3Dno
slrn_cv_va_val_copy=3Dyes
sudo_cv_func_unsetenv_void=3Dno
sudo_cv_uid_t_len=3D10
utils_cv_sys_open_max=3D1019

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver=
-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run aclocal-1.11'
ADMIN_MAN_DIR=3D'$(mandir)/man$(ADMIN_MAN_SUFFIX)'
ADMIN_MAN_SUFFIX=3D'8'
AGP_FALSE=3D'#'
AGP_TRUE=3D''
AIGLX_FALSE=3D''
AIGLX_TRUE=3D'#'
ALLOCA=3D''
ALPHA_VIDEO_FALSE=3D''
ALPHA_VIDEO_TRUE=3D'#'
AMDEPBACKSLASH=3D'\'
AMDEP_FALSE=3D'#'
AMDEP_TRUE=3D''
AMTAR=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserver-x=
f86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run tar'
AM_BACKSLASH=3D'\'
AM_DEFAULT_VERBOSITY=3D'1'
APPLE_APPLICATIONS_DIR=3D'/Applications/Utilities'
APPLE_APPLICATION_NAME=3D'X11'
APP_MAN_DIR=3D'$(mandir)/man$(APP_MAN_SUFFIX)'
APP_MAN_SUFFIX=3D'1'
AR=3D'powerpc-poky-linux-ar'
ARM_BACKTRACE_CFLAGS=3D''
ARM_VIDEO_FALSE=3D''
ARM_VIDEO_TRUE=3D'#'
AS=3D'powerpc-poky-linux-as'
AUTOCONF=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserve=
r-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run autoconf'
AUTOHEADER=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xser=
ver-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run autoheader'
AUTOMAKE=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserve=
r-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run automake-1.11'
AWK=3D'gawk'
BASE_FONT_PATH=3D'/usr/share/fonts/X11'
BSD_APM_FALSE=3D''
BSD_APM_TRUE=3D'#'
BSD_KQUEUE_APM_FALSE=3D''
BSD_KQUEUE_APM_TRUE=3D'#'
BUILD_DATE=3D'20110528'
BUILD_KDRIVEFBDEVLIB_FALSE=3D''
BUILD_KDRIVEFBDEVLIB_TRUE=3D'#'
BUILD_TIME=3D'1095557'
CC=3D'powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=3D/home/k=
yu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99'
CCAS=3D'powerpc-poky-linux-gcc -mcpu=3D603e  -mhard-float --sysroot=3D/home=
/kyu3/sdb/test/tmp/sysroots/qemuppc -std=3Dgnu99'
CCASDEPMODE=3D'depmode=3Dgcc3'
CCASFLAGS=3D'-O2 -pipe -g -feliminate-unused-debug-types'
CCDEPMODE=3D'depmode=3Dgcc3'
CFLAGS=3D'-O2 -pipe -g -feliminate-unused-debug-types'
CHANGELOG_CMD=3D'(GIT_DIR=3D$(top_srcdir)/.git git log > $(top_srcdir)/.cha=
ngelog.tmp && mv $(top_srcdir)/.changelog.tmp $(top_srcdir)/ChangeLog) || (=
rm -f $(top_srcdir)/.changelog.tmp; touch $(top_srcdir)/ChangeLog; echo '\'=
'git directory not found: installing possibly empty changelog.'\'' >&2)'
COMPILEDDEFAULTFONTPATH=3D'/usr/share/fonts/X11/misc/,/usr/share/fonts/X11/=
TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/share/fonts=
/X11/100dpi/,/usr/share/fonts/X11/75dpi/'
COMPOSITE_FALSE=3D'#'
COMPOSITE_TRUE=3D''
CONFIG_DBUS_API_FALSE=3D''
CONFIG_DBUS_API_TRUE=3D'#'
CONFIG_HAL_FALSE=3D''
CONFIG_HAL_TRUE=3D'#'
CONFIG_NEED_DBUS_FALSE=3D''
CONFIG_NEED_DBUS_TRUE=3D'#'
CONFIG_UDEV_FALSE=3D'#'
CONFIG_UDEV_TRUE=3D''
CPP=3D'powerpc-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp/sysroo=
ts/qemuppc'
CPPFLAGS=3D''
CWARNFLAGS=3D'-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototype=
s -Wmissing-declarations -Wnested-externs -fno-strict-aliasing -Wbad-functi=
on-cast -Wformat=3D2 -Wold-style-definition -Wdeclaration-after-statement '
CYGPATH_W=3D'echo'
DARWIN_LIBS=3D''
DBE_FALSE=3D'#'
DBE_TRUE=3D''
DBUS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/dbus-=
1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/dbus-1.0/include  '
DBUS_LIBS=3D'-ldbus-1 -lpthread -lrt  '
DEBUG_FALSE=3D''
DEBUG_TRUE=3D'#'
DEFAULT_LIBRARY_PATH=3D'/usr/lib'
DEFAULT_LOGDIR=3D''
DEFAULT_LOGPREFIX=3D'/var/log/Xorg.'
DEFAULT_MODULE_PATH=3D'/usr/lib/xorg/modules'
DEFS=3D'-DHAVE_CONFIG_H'
DEPDIR=3D'.deps'
DGA_CFLAGS=3D''
DGA_FALSE=3D''
DGA_LIBS=3D''
DGA_TRUE=3D'#'
DIX_CFLAGS=3D'-DHAVE_DIX_CONFIG_H $(CWARNFLAGS) -D_BSD_SOURCE -DHAS_FCHOWN =
-DHAS_STICKY_DIR_BIT -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include=
/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/freetype2 =
  -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)/Xext -I=
$(top_srcdir)/composite -I$(top_srcdir)/damageext -I$(top_srcdir)/xfixes -I=
$(top_srcdir)/Xi -I$(top_srcdir)/mi -I$(top_srcdir)/miext/sync -I$(top_srcd=
ir)/miext/shadow  -I$(top_srcdir)/miext/damage -I$(top_srcdir)/render -I$(t=
op_srcdir)/randr -I$(top_srcdir)/fb -fvisibility=3Dhidden'
DIX_LIB=3D'$(top_builddir)/dix/libdix.la'
DLLTOOL=3D'dlltool'
DLOPEN_LIBS=3D''
DMXEXAMPLES_DEP_CFLAGS=3D''
DMXEXAMPLES_DEP_LIBS=3D''
DMXMODULES_CFLAGS=3D' '
DMXMODULES_LIBS=3D'-lXmuu -lXext -lXrender -lX11 -lXfixes -lXi -lXau -lXdmc=
p  '
DMXXIEXAMPLES_DEP_CFLAGS=3D''
DMXXIEXAMPLES_DEP_LIBS=3D''
DMXXMUEXAMPLES_DEP_CFLAGS=3D''
DMXXMUEXAMPLES_DEP_LIBS=3D''
DMX_BUILD_LNX_FALSE=3D''
DMX_BUILD_LNX_TRUE=3D'#'
DMX_BUILD_USB_FALSE=3D''
DMX_BUILD_USB_TRUE=3D'#'
DMX_FALSE=3D''
DMX_TRUE=3D'#'
DOXYGEN=3D''
DPMSExtension_FALSE=3D'#'
DPMSExtension_TRUE=3D''
DRI2PROTO_CFLAGS=3D''
DRI2PROTO_LIBS=3D''
DRI2_AIGLX_FALSE=3D''
DRI2_AIGLX_TRUE=3D'#'
DRI2_FALSE=3D''
DRI2_TRUE=3D'#'
DRIPROTO_CFLAGS=3D''
DRIPROTO_LIBS=3D''
DRIVER_MAN_DIR=3D'$(mandir)/man$(DRIVER_MAN_SUFFIX)'
DRIVER_MAN_SUFFIX=3D'4'
DRI_CFLAGS=3D''
DRI_DRIVER_PATH=3D''
DRI_FALSE=3D''
DRI_LIBS=3D''
DRI_TRUE=3D'#'
DSYMUTIL=3D''
DTRACE=3D'not_found'
DUMPBIN=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EGREP=3D'/bin/grep -E'
ENABLE_DEVEL_DOCS_FALSE=3D'#'
ENABLE_DEVEL_DOCS_TRUE=3D''
ENABLE_DOCS_FALSE=3D'#'
ENABLE_DOCS_TRUE=3D''
EXEEXT=3D''
FBDEVHW_FALSE=3D'#'
FBDEVHW_TRUE=3D''
FGREP=3D'/bin/grep -F'
FILE_MAN_DIR=3D'$(mandir)/man$(FILE_MAN_SUFFIX)'
FILE_MAN_SUFFIX=3D'5'
FONT100DPIDIR=3D'${FONTROOTDIR}/100dpi'
FONT75DPIDIR=3D'${FONTROOTDIR}/75dpi'
FONTMISCDIR=3D'${FONTROOTDIR}/misc'
FONTOTFDIR=3D'${FONTROOTDIR}/OTF'
FONTROOTDIR=3D'/usr/share/fonts/X11'
FONTTTFDIR=3D'${FONTROOTDIR}/TTF'
FONTTYPE1DIR=3D'${FONTROOTDIR}/Type1'
FOP=3D''
FREEBSD_KLDLOAD_FALSE=3D''
FREEBSD_KLDLOAD_TRUE=3D'#'
GLIB_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/glib-=
2.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/glib-2.0/include  '
GLIB_LIBS=3D'-lglib-2.0  '
GLX_ARCH_DEFINES=3D''
GLX_DEFINES=3D'-DGLX_USE_TLS -DPTHREADS'
GLX_FALSE=3D''
GLX_TLS=3D'yes'
GLX_TRUE=3D'#'
GL_CFLAGS=3D''
GL_LIBS=3D''
GREP=3D'/bin/grep'
HAL_CFLAGS=3D'-DDBUS_API_SUBJECT_TO_CHANGE -I/home/kyu3/sdb/test/tmp/sysroo=
ts/qemuppc/usr/include/hal -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/i=
nclude/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/lib/dbus-1.0=
/include  '
HAL_LIBS=3D'-lhal -ldbus-1 -lpthread -lrt  '
HAVE_DBUS_FALSE=3D'#'
HAVE_DBUS_TRUE=3D''
HAVE_DOXYGEN_FALSE=3D''
HAVE_DOXYGEN_TRUE=3D'#'
HAVE_FOP_FALSE=3D''
HAVE_FOP_TRUE=3D'#'
HAVE_STYLESHEETS_FALSE=3D''
HAVE_STYLESHEETS_TRUE=3D'#'
HAVE_XMLTO_FALSE=3D'#'
HAVE_XMLTO_TEXT_FALSE=3D'#'
HAVE_XMLTO_TEXT_TRUE=3D''
HAVE_XMLTO_TRUE=3D''
I386_VIDEO_FALSE=3D''
I386_VIDEO_TRUE=3D'#'
INSTALL_CMD=3D'(cp -f /usr/share/util-macros/INSTALL $(top_srcdir)/.INSTALL=
.tmp && mv $(top_srcdir)/.INSTALL.tmp $(top_srcdir)/INSTALL) || (rm -f $(to=
p_srcdir)/.INSTALL.tmp; touch $(top_srcdir)/INSTALL; echo '\''util-macros "=
pkgdatadir" from xorg-macros.pc not found: installing possibly empty INSTAL=
L.'\'' >&2)'
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_LIBXF86CONFIG_FALSE=3D''
INSTALL_LIBXF86CONFIG_TRUE=3D'#'
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_SCRIPT=3D'${INSTALL}'
INSTALL_SETUID_FALSE=3D''
INSTALL_SETUID_TRUE=3D'#'
INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
INT10MODULE_FALSE=3D'#'
INT10MODULE_TRUE=3D''
INT10_STUB_FALSE=3D''
INT10_STUB_TRUE=3D'#'
INT10_VM86_FALSE=3D''
INT10_VM86_TRUE=3D'#'
INT10_X86EMU_FALSE=3D'#'
INT10_X86EMU_TRUE=3D''
KDRIVEFBDEV_FALSE=3D''
KDRIVEFBDEV_TRUE=3D'#'
KDRIVELINUX_FALSE=3D''
KDRIVELINUX_TRUE=3D'#'
KDRIVE_CFLAGS=3D''
KDRIVE_EVDEV_FALSE=3D''
KDRIVE_EVDEV_TRUE=3D'#'
KDRIVE_FALSE=3D''
KDRIVE_INCS=3D''
KDRIVE_KBD_FALSE=3D''
KDRIVE_KBD_TRUE=3D'#'
KDRIVE_LIBS=3D''
KDRIVE_LOCAL_LIBS=3D''
KDRIVE_MOUSE_FALSE=3D''
KDRIVE_MOUSE_TRUE=3D'#'
KDRIVE_PURE_INCS=3D''
KDRIVE_PURE_LIBS=3D''
KDRIVE_TRUE=3D'#'
LAUNCHD_ID_PREFIX=3D'org.x'
LD=3D'powerpc-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qe=
muppc'
LDFLAGS=3D'-Wl,-O1  -Wl,--as-needed'
LD_EXPORT_SYMBOLS_FLAG=3D'-export-dynamic'
LEX=3D'flex'
LEXLIB=3D'-lfl'
LEX_OUTPUT_ROOT=3D'lex.yy'
LIBDRM_CFLAGS=3D''
LIBDRM_LIBS=3D''
LIBOBJS=3D''
LIBS=3D'-lm '
LIBSHA1_CFLAGS=3D''
LIBSHA1_LIBS=3D''
LIBTOOL=3D'$(SHELL) $(top_builddir)/powerpc-poky-linux-libtool'
LIB_MAN_DIR=3D'$(mandir)/man$(LIB_MAN_SUFFIX)'
LIB_MAN_SUFFIX=3D'3'
LINUX_ALPHA_FALSE=3D''
LINUX_ALPHA_TRUE=3D'#'
LINUX_IA64_FALSE=3D''
LINUX_IA64_TRUE=3D'#'
LIPO=3D''
LNXACPI_FALSE=3D''
LNXACPI_TRUE=3D'#'
LNXAPM_FALSE=3D'#'
LNXAPM_TRUE=3D''
LN_S=3D'ln -s'
LTLIBOBJS=3D''
MAINT=3D'#'
MAINTAINER_MODE_FALSE=3D''
MAINTAINER_MODE_TRUE=3D'#'
MAIN_LIB=3D'$(top_builddir)/dix/libmain.la'
MAKEINFO=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xserve=
r-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run makeinfo'
MANIFEST_TOOL=3D':'
MAN_SUBSTS=3D'	-e '\''s|__vendorversion__|"$(PACKAGE_STRING)" "$(XORG_MAN_P=
AGE)"|'\'' 	-e '\''s|__xorgversion__|"$(PACKAGE_STRING)" "$(XORG_MAN_PAGE)"=
|'\'' 	-e '\''s|__xservername__|Xorg|g'\'' 	-e '\''s|__xconfigfile__|xorg.c=
onf|g'\'' 	-e '\''s|__projectroot__|$(prefix)|g'\'' 	-e '\''s|__apploaddir_=
_|$(appdefaultdir)|g'\'' 	-e '\''s|__appmansuffix__|$(APP_MAN_SUFFIX)|g'\''=
 	-e '\''s|__drivermansuffix__|$(DRIVER_MAN_SUFFIX)|g'\'' 	-e '\''s|__admin=
mansuffix__|$(ADMIN_MAN_SUFFIX)|g'\'' 	-e '\''s|__libmansuffix__|$(LIB_MAN_=
SUFFIX)|g'\'' 	-e '\''s|__miscmansuffix__|$(MISC_MAN_SUFFIX)|g'\'' 	-e '\''=
s|__filemansuffix__|$(FILE_MAN_SUFFIX)|g'\'''
MISC_MAN_DIR=3D'$(mandir)/man$(MISC_MAN_SUFFIX)'
MISC_MAN_SUFFIX=3D'7'
MITSHM_FALSE=3D'#'
MITSHM_TRUE=3D''
MKDIR_P=3D'/bin/mkdir -p'
NEED_STRLCAT_FALSE=3D'#'
NEED_STRLCAT_TRUE=3D''
NEED_VSNPRINTF_FALSE=3D''
NEED_VSNPRINTF_TRUE=3D'#'
NM=3D'powerpc-poky-linux-nm'
NMEDIT=3D''
OBJC=3D'$(CC)'
OBJCCLD=3D''
OBJCDEPMODE=3D'depmode=3Dnone'
OBJCFLAGS=3D'$(CFLAGS)'
OBJCLINK=3D'$(LINK)'
OBJDUMP=3D'powerpc-poky-linux-objdump'
OBJEXT=3D'o'
OPENSSL_CFLAGS=3D' '
OPENSSL_LIBS=3D'-lssl -lcrypto  '
OS_LIB=3D'$(top_builddir)/os/libos.la'
OTOOL64=3D''
OTOOL=3D''
PACKAGE=3D'xorg-server'
PACKAGE_BUGREPORT=3D'https://bugs.freedesktop.org/enter_bug.cgi?product=3Dx=
org'
PACKAGE_NAME=3D'xorg-server'
PACKAGE_STRING=3D'xorg-server 1.10.1'
PACKAGE_TARNAME=3D'xorg-server'
PACKAGE_URL=3D''
PACKAGE_VERSION=3D'1.10.1'
PATH_SEPARATOR=3D':'
PCIACCESS_CFLAGS=3D' '
PCIACCESS_LIBS=3D'-lpciaccess  '
PCI_TXT_IDS_PATH=3D''
PERL=3D'/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/perl'
PIXMAN_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/pix=
man-1  '
PIXMAN_LIBS=3D'-lpixman-1  '
PKG_CONFIG=3D'/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/pkg-con=
fig'
PKG_CONFIG_LIBDIR=3D'/home/kyu3/sdb/test/tmp/sysroots/qemuppc//usr/lib/pkgc=
onfig'
PKG_CONFIG_PATH=3D'/home/kyu3/sdb/test/tmp/sysroots/qemuppc//usr/lib/pkgcon=
fig:/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/share/pkgconfig'
PPC_VIDEO_FALSE=3D'#'
PPC_VIDEO_TRUE=3D''
PROJECTROOT=3D'/usr'
RANLIB=3D'powerpc-poky-linux-ranlib'
RAWCPP=3D'/usr/bin/cpp'
RAWCPPFLAGS=3D'-undef -traditional'
RECORD_FALSE=3D''
RECORD_TRUE=3D'#'
RELEASE_DATE=3D'2011-04-15'
RES_FALSE=3D'#'
RES_TRUE=3D''
SCREENSAVER_FALSE=3D'#'
SCREENSAVER_TRUE=3D''
SDK_REQUIRED_MODULES=3D'xproto >=3D 7.0.17 randrproto >=3D 1.2.99.3 renderp=
roto >=3D 0.11 xextproto >=3D 7.1.99 inputproto >=3D 1.9.99.902 kbproto >=
=3D 1.0.3 fontsproto videoproto'
SECURE_RPC_FALSE=3D'#'
SECURE_RPC_TRUE=3D''
SED=3D'/bin/sed'
SELINUX_CFLAGS=3D''
SELINUX_LIBS=3D''
SERVER_MISC_CONFIG_PATH=3D'/usr/lib/xorg'
SET_MAKE=3D''
SHA1_CFLAGS=3D''
SHA1_LIBS=3D'-lgcrypt'
SHELL=3D'/bin/sh'
SOLARIS_ASM_CFLAGS=3D''
SOLARIS_ASM_INLINE_FALSE=3D''
SOLARIS_ASM_INLINE_TRUE=3D'#'
SOLARIS_INOUT_ARCH=3D''
SOLARIS_VT_FALSE=3D''
SOLARIS_VT_TRUE=3D'#'
SPARC64_VIDEO_FALSE=3D''
SPARC64_VIDEO_TRUE=3D'#'
SPECIAL_DTRACE_OBJECTS_FALSE=3D''
SPECIAL_DTRACE_OBJECTS_TRUE=3D'#'
STANDALONE_XPBPROXY_FALSE=3D''
STANDALONE_XPBPROXY_TRUE=3D'#'
STRIP=3D'powerpc-poky-linux-strip'
STYLESHEET_SRCDIR=3D''
SYSCONFDIR=3D''
TSLIB_CFLAGS=3D''
TSLIB_FALSE=3D''
TSLIB_LIBS=3D''
TSLIB_TRUE=3D'#'
UDEV_CFLAGS=3D' '
UDEV_LIBS=3D'-ludev  '
UNITTESTS_FALSE=3D''
UNITTESTS_TRUE=3D'#'
UTILS_SYS_LIBS=3D''
VBE_FALSE=3D'#'
VBE_TRUE=3D''
VENDOR_NAME_SHORT=3D'X.Org'
VERSION=3D'1.10.1'
VGAHW_FALSE=3D'#'
VGAHW_TRUE=3D''
WINDOWSWM_CFLAGS=3D''
WINDOWSWM_LIBS=3D''
WINDRES=3D''
X11EXAMPLES_DEP_CFLAGS=3D''
X11EXAMPLES_DEP_LIBS=3D''
XAA_FALSE=3D'#'
XAA_TRUE=3D''
XACE_FALSE=3D'#'
XACE_TRUE=3D''
XCALIBRATE_FALSE=3D''
XCALIBRATE_TRUE=3D'#'
XCSECURITY_FALSE=3D''
XCSECURITY_TRUE=3D'#'
XDMAUTH_FALSE=3D'#'
XDMAUTH_TRUE=3D''
XDMCP_CFLAGS=3D' '
XDMCP_FALSE=3D'#'
XDMCP_LIBS=3D'-lXdmcp  '
XDMCP_TRUE=3D''
XDMXCONFIG_DEP_CFLAGS=3D''
XDMXCONFIG_DEP_LIBS=3D''
XDMX_CFLAGS=3D''
XDMX_LIBS=3D''
XDMX_SYS_LIBS=3D''
XEPHYR_CFLAGS=3D''
XEPHYR_FALSE=3D''
XEPHYR_INCS=3D''
XEPHYR_LIBS=3D''
XEPHYR_TRUE=3D'#'
XF86BIGFONT_FALSE=3D''
XF86BIGFONT_TRUE=3D'#'
XF86CONFIGDIR=3D'xorg.conf.d'
XF86CONFIGFILE=3D'xorg.conf'
XF86UTILS_FALSE=3D'#'
XF86UTILS_TRUE=3D''
XF86VIDMODE_CFLAGS=3D' '
XF86VIDMODE_FALSE=3D'#'
XF86VIDMODE_LIBS=3D' '
XF86VIDMODE_TRUE=3D''
XFAKESERVER_FALSE=3D''
XFAKESERVER_TRUE=3D'#'
XINERAMA_FALSE=3D''
XINERAMA_TRUE=3D'#'
XKB_BASE_DIRECTORY=3D'/usr/share/X11/xkb'
XKB_BIN_DIRECTORY=3D'/usr/bin'
XKB_COMPILED_DIR=3D'/var/lib/xkb'
XKM_OUTPUT_DIR=3D'/var/lib/xkb/'
XLIB_CFLAGS=3D''
XLIB_LIBS=3D''
XMLTO=3D'/usr/bin/xmlto'
XNESTMODULES_CFLAGS=3D' '
XNESTMODULES_LIBS=3D'-lXext -lX11 -lXau -lXdmcp  '
XNEST_FALSE=3D''
XNEST_LIBS=3D''
XNEST_SYS_LIBS=3D''
XNEST_TRUE=3D'#'
XORG_BUS_BSDPCI_FALSE=3D''
XORG_BUS_BSDPCI_TRUE=3D'#'
XORG_BUS_LINUXPCI_FALSE=3D'#'
XORG_BUS_LINUXPCI_TRUE=3D''
XORG_BUS_SPARC_FALSE=3D''
XORG_BUS_SPARC_TRUE=3D'#'
XORG_CFLAGS=3D' -DHAVE_XORG_CONFIG_H -fvisibility=3Dhidden   -DXF86PM  '
XORG_FALSE=3D'#'
XORG_INCS=3D'-I$(top_srcdir)/hw/xfree86 -I$(top_srcdir)/hw/xfree86/include =
-I$(top_srcdir)/hw/xfree86/common -I$(top_srcdir)/hw/xfree86/os-support -I$=
(top_srcdir)/hw/xfree86/os-support/bus -I$(top_srcdir)/os'
XORG_LIBS=3D'$(top_builddir)/composite/libcomposite.la $(top_builddir)/xfix=
es/libxfixes.la $(top_builddir)/Xext/libXextbuiltin.la  $(top_builddir)/ran=
dr/librandr.la $(top_builddir)/render/librender.la $(top_builddir)/damageex=
t/libdamageext.la $(top_builddir)/miext/sync/libsync.la $(top_builddir)/mie=
xt/damage/libdamage.la $(top_builddir)/miext/shadow/libshadow.la $(top_buil=
ddir)/Xi/libXi.la $(top_builddir)/xkb/libxkb.la'
XORG_MAN_PAGE=3D'X Version 11'
XORG_MODULES_CFLAGS=3D' '
XORG_MODULES_LIBS=3D' '
XORG_OS=3D'linux'
XORG_OS_SUBDIR=3D'linux'
XORG_SGML_PATH=3D''
XORG_SYS_LIBS=3D' -lpciaccess    -lpthread  '
XORG_TRUE=3D''
XPBPROXY_CFLAGS=3D''
XPBPROXY_LIBS=3D''
XQUARTZ_FALSE=3D''
XQUARTZ_SPARKLE=3D'no'
XQUARTZ_SPARKLE_FALSE=3D''
XQUARTZ_SPARKLE_TRUE=3D'#'
XQUARTZ_TRUE=3D'#'
XREGISTRY_FALSE=3D'#'
XREGISTRY_TRUE=3D''
XRESEXAMPLES_DEP_CFLAGS=3D''
XRESEXAMPLES_DEP_LIBS=3D''
XSELINUX_FALSE=3D''
XSELINUX_TRUE=3D'#'
XSERVERCFLAGS_CFLAGS=3D'-D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -I/=
home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/pixman-1 -I/home/kyu3/s=
db/test/tmp/sysroots/qemuppc/usr/include/freetype2  '
XSERVERCFLAGS_LIBS=3D'-lxkbfile -lpixman-1 -lXfont -lXau -lXdmcp  '
XSERVERLIBS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/includ=
e/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemuppc/usr/include/freetype2=
  '
XSERVERLIBS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp  '
XSERVER_DTRACE_FALSE=3D''
XSERVER_DTRACE_TRUE=3D'#'
XSERVER_LIBS=3D'$(top_builddir)/dix/libdix.la $(top_builddir)/mi/libmi.la $=
(top_builddir)/os/libos.la'
XSERVER_SYS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp    -lm '
XSL_STYLESHEET=3D''
XTSTEXAMPLES_DEP_CFLAGS=3D''
XTSTEXAMPLES_DEP_LIBS=3D''
XVFB_FALSE=3D''
XVFB_LIBS=3D''
XVFB_SYS_LIBS=3D''
XVFB_TRUE=3D'#'
XVMC_FALSE=3D'#'
XVMC_TRUE=3D''
XV_FALSE=3D'#'
XV_TRUE=3D''
XWINMODULES_CFLAGS=3D''
XWINMODULES_LIBS=3D''
XWIN_CLIPBOARD_FALSE=3D''
XWIN_CLIPBOARD_TRUE=3D'#'
XWIN_FALSE=3D''
XWIN_GLX_WINDOWS_FALSE=3D''
XWIN_GLX_WINDOWS_TRUE=3D'#'
XWIN_LIBS=3D''
XWIN_MULTIWINDOWEXTWM_FALSE=3D''
XWIN_MULTIWINDOWEXTWM_TRUE=3D'#'
XWIN_MULTIWINDOW_FALSE=3D''
XWIN_MULTIWINDOW_TRUE=3D'#'
XWIN_NATIVEGDI_FALSE=3D''
XWIN_NATIVEGDI_TRUE=3D'#'
XWIN_PRIMARYFB_FALSE=3D''
XWIN_PRIMARYFB_TRUE=3D'#'
XWIN_RANDR_FALSE=3D''
XWIN_RANDR_TRUE=3D'#'
XWIN_SERVER_NAME=3D''
XWIN_SYS_LIBS=3D''
XWIN_TRUE=3D'#'
XWIN_XV_FALSE=3D''
XWIN_XV_TRUE=3D'#'
YACC=3D'bison -y'
YFLAGS=3D''
__XCONFIGDIR__=3D'xorg.conf.d'
__XCONFIGFILE__=3D'xorg.conf'
abi_ansic=3D'0.4'
abi_extension=3D'5.0'
abi_videodrv=3D'10.0'
abi_xinput=3D'12.2'
ac_ct_AR=3D''
ac_ct_CC=3D''
ac_ct_DUMPBIN=3D''
am__EXEEXT_FALSE=3D''
am__EXEEXT_TRUE=3D'#'
am__fastdepCCAS_FALSE=3D'#'
am__fastdepCCAS_TRUE=3D''
am__fastdepCC_FALSE=3D'#'
am__fastdepCC_TRUE=3D''
am__fastdepOBJC_FALSE=3D''
am__fastdepOBJC_TRUE=3D'#'
am__include=3D'include'
am__isrc=3D''
am__leading_dot=3D'.'
am__quote=3D''
am__tar=3D'${AMTAR} chof - "$$tardir"'
am__untar=3D'${AMTAR} xf -'
bindir=3D'/usr/bin'
build=3D'x86_64-pc-linux-gnu'
build_alias=3D'x86_64-linux'
build_cpu=3D'x86_64'
build_os=3D'linux-gnu'
build_vendor=3D'pc'
datadir=3D'/usr/share'
datarootdir=3D'${prefix}/share'
docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
driverdir=3D'/usr/lib/xorg/modules/drivers'
dvidir=3D'${docdir}'
exec_prefix=3D'/usr'
extdir=3D'/usr/include/X11/extensions'
host=3D'powerpc-poky-linux-gnu'
host_alias=3D'powerpc-poky-linux'
host_cpu=3D'powerpc'
host_os=3D'linux-gnu'
host_vendor=3D'poky'
htmldir=3D'${docdir}'
includedir=3D'/usr/include'
infodir=3D'/usr/share/info'
install_sh=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/ppc603e-poky-linux/xser=
ver-xf86-lite-1.10.1-r0/xorg-server-1.10.1/install-sh'
libdir=3D'/usr/lib'
libexecdir=3D'/usr/libexec'
localedir=3D'${datarootdir}/locale'
localstatedir=3D'/var'
logdir=3D'/var/log'
mandir=3D'/usr/share/man'
mkdir_p=3D'/bin/mkdir -p'
moduledir=3D'/usr/lib/xorg/modules'
oldincludedir=3D'/usr/include'
pdfdir=3D'${docdir}'
prefix=3D'/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
sbindir=3D'/usr/sbin'
sdkdir=3D'/usr/include/xorg'
sharedstatedir=3D'/com'
symbol_visibility=3D'-fvisibility=3Dhidden'
sysconfdir=3D'/etc/X11'
sysconfigdir=3D'/usr/share/X11/xorg.conf.d'
target_alias=3D'powerpc-poky-linux'

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "xorg-server"
#define PACKAGE_TARNAME "xorg-server"
#define PACKAGE_VERSION "1.10.1"
#define PACKAGE_STRING "xorg-server 1.10.1"
#define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?produ=
ct=3Dxorg"
#define PACKAGE_URL ""
#define PACKAGE "xorg-server"
#define VERSION "1.10.1"
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define PACKAGE_VERSION_MAJOR 1
#define PACKAGE_VERSION_MINOR 10
#define PACKAGE_VERSION_PATCHLEVEL 1
#define HAVE_DLFCN_H 1
#define LT_OBJDIR ".libs/"
#define YYTEXT_POINTER 1
#define _FILE_OFFSET_BITS 64
#define HAVE_DIRENT_H 1
#define STDC_HEADERS 1
#define HAVE_FCNTL_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_UNISTD_H 1
#define HAVE_DLFCN_H 1
#define HAVE_STROPTS_H 1
#define HAVE_FNMATCH_H 1
#define HAVE_SYS_UTSNAME_H 1
#define SIZEOF_UNSIGNED_LONG 4
#define HAVE_BYTESWAP_H 1
#define HAVE_VPRINTF 1
#define HAVE_GETEUID 1
#define HAVE_GETUID 1
#define HAVE_LINK 1
#define HAVE_MEMMOVE 1
#define HAVE_MEMSET 1
#define HAVE_MKSTEMP 1
#define HAVE_STRCHR 1
#define HAVE_STRRCHR 1
#define HAVE_STRTOL 1
#define HAVE_GETOPT 1
#define HAVE_GETOPT_LONG 1
#define HAVE_VSNPRINTF 1
#define HAVE_BACKTRACE 1
#define HAVE_STRCASESTR 1
#define HAVE_FFS 1
#define HAVE_VASPRINTF 1
#define HAVE_ALLOCA_H 1
#define HAVE_ALLOCA 1
#define HAS_GETDTABLESIZE 1
#define HAS_GETIFADDRS 1
#define HAS_MMAP 1
#define HAVE_LIBM 1
#define HAVE_CBRT 1
#define HAVE_LINUX_AGPGART_H 1
#define HAVE_LINUX_APM_BIOS_H 1
#define HAVE_LINUX_FB_H 1
#define HAVE_SYSV_IPC 1
#define HAVE_BACKTRACE 1
#define HAVE_EXECINFO_H 1
#define LAUNCHD_ID_PREFIX "org.x"
#define TLS __thread
#define RETSIGTYPE void
#define UNIXCONN 1
#define TCPCONN 1
#define IPv6 1
#define HAVE_SOCKLEN_T 1
#define HAVE_AUTHDES_CREATE 1
#define SECURE_RPC 1
#define CONFIG_UDEV 1
#define HAVE_DBUS 1
#define USE_SIGIO_BY_DEFAULT TRUE
#define XV 1
#define XvExtension 1
#define XvMCExtension 1
#define XREGISTRY 1
#define COMPOSITE 1
#define MITSHM 1
#define HAS_SHM 1
#define SCREENSAVER 1
#define RES 1
#define XACE 1
#define DBE 1
#define DPMSExtension 1
#define RENDER 1
#define RANDR 1
#define XFIXES 1
#define DAMAGE 1
#define XINPUT 1
#define SHAPE 1
#define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
#define XKB_BIN_DIRECTORY "/usr/bin"
#define XKM_OUTPUT_DIR "/var/lib/xkb/"
#define XKB_DFLT_RULES "base"
#define XKB_DFLT_MODEL "pc105"
#define XKB_DFLT_LAYOUT "us"
#define XKB_DFLT_VARIANT ""
#define XKB_DFLT_OPTIONS ""
#define XDMCP 1
#define HASXDMAUTH 1
#define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/font=
s/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/share=
/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
#define PCI_TXT_IDS_PATH ""
#define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
#define BASE_FONT_PATH "/usr/share/fonts/X11"
#define DRI_DRIVER_PATH ""
#define XVENDORNAME "The X.Org Foundation"
#define XVENDORNAMESHORT "X.Org"
#define XORG_DATE "2011-04-15"
#define XORG_MAN_VERSION "Version 1.10.1"
#define BUILDERADDR "xorg@lists.freedesktop.org"
#define OSNAME "Linux 2.6.35-25-server x86_64"
#define OSVENDOR ""
#define BUILDERSTRING ""
#define VENDOR_NAME "The X.Org Foundation"
#define VENDOR_NAME_SHORT "X.Org"
#define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000) +=
 0)
#define VENDOR_MAN_VERSION "Version 1.10.1"
#define NO_LIBCWRAPPER 1
#define XTEST 1
#define XSYNC 1
#define XCMISC 1
#define BIGREQS 1
#define HAVE_SHA1_IN_LIBGCRYPT 1
#define HAVE_PCI_SYSTEM_INIT_DEV_MEM 1
#define HAVE_PCI_DEVICE_ENABLE 1
#define HAVE_PCI_DEVICE_IS_BOOT_VGA 1
#define HAVE_PCI_DEVICE_VGAARB_INIT 1
#define XF86VIDMODE 1
#define XORG_SERVER 1
#define XORGSERVER 1
#define XFree86Server 1
#define XFree86LOADER 1
#define XORG_VERSION_CURRENT (((1) * 10000000) + ((10) * 100000) + ((1) * 1=
000) + 0)
#define NEED_XF86_TYPES 1
#define NEED_XF86_PROTOTYPES 1
#define __XSERVERNAME__ "Xorg"
#define __XCONFIGFILE__ "xorg.conf"
#define XF86CONFIGFILE "xorg.conf"
#define __XCONFIGDIR__ "xorg.conf.d"
#define DEFAULT_MODULE_PATH "/usr/lib/xorg/modules"
#define DEFAULT_LIBRARY_PATH "/usr/lib"
#define DEFAULT_LOGPREFIX "/var/log/Xorg."
#define __VENDORDWEBSUPPORT__ "http://wiki.x.org"
#define XSERVER_LIBPCIACCESS 1
#define WITH_VGAHW 1
#define _GNU_SOURCE 1
#define PROJECTROOT "/usr"

configure: exit 0

--------------020305060100000500050709
Content-Type: text/plain;
 name="xserver-i586-config.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="xserver-i586-config.log"

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by xorg-server configure 1.10.1, which was
generated by GNU Autoconf 2.65.  Invocation command line was

  $ /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r=
0/xorg-server-1.10.1/configure --build=3Dx86_64-linux --host=3Di586-poky-li=
nux --target=3Di586-poky-linux --prefix=3D/usr --exec_prefix=3D/usr --bindi=
r=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/libexec --datadir=3D=
/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com --localstatedir=3D/v=
ar --libdir=3D/usr/lib --includedir=3D/usr/include --oldincludedir=3D/usr/i=
nclude --infodir=3D/usr/share/info --mandir=3D/usr/share/man --disable-sile=
nt-rules --with-libtool-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 =
--with-fop=3Dno --disable-static --disable-acfb --disable-ccfb --disable-mc=
fb --disable-dga --disable-xinerama --disable-xf86misc --disable-xorgcfg --=
disable-record --disable-dmx --disable-xnest --disable-xvfb --enable-compos=
ite --disable-dri --disable-glx --sysconfdir=3D/etc/X11 --localstatedir=3D/=
var --with-fontdir=3D/usr/share/fonts/X11 --with-xkb-output=3D/var/lib/xkb =
ac_cv_file__usr_share_sgml_X11_defs_ent=3Dno

## --------- ##
## Platform. ##
## --------- ##

hostname =3D kyu3-ubuntu
uname -m =3D x86_64
uname -r =3D 2.6.35-25-server
uname -s =3D Linux
uname -v =3D #44~lucid1-Ubuntu SMP Tue Jan 25 19:34:09 UTC 2011

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux
PATH: /home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/bin/crossscripts
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/sbin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/sbin
PATH: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux//bin
PATH: /home/kyu3/src/poky/scripts
PATH: /home/kyu3/src/poky/bitbake/bin/
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games
PATH: /home/kyu3/bin
PATH: /home/kyu3/src/poky/scripts


## ----------- ##
## Core tests. ##
## ----------- ##

configure:3349: loading site script /home/kyu3/src/poky/meta/site/endian-li=
ttle
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
configure:3349: loading site script /home/kyu3/src/poky/meta/site/common-gl=
ibc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| ac_cv_check_sjlj=3Dssjlj
|=20
| # m4
| gt_cv_locale_fr=3D${gt_cv_locale_fr=3Dfr_FR}
| gl_cv_func_btowc_eof=3D${gl_cv_func_btowc_eof=3Dyes}
| gl_cv_func_wcrtomb_retval=3D${gl_cv_func_wcrtomb_retval=3Dyes}
| gl_cv_func_wctob_works=3D${gl_cv_func_wctob_works=3Dyes}
| gl_cv_func_mbrtowc_incomplete_state=3D${gl_cv_func_mbrtowc_incomplete_sta=
te=3Dyes}
| gl_cv_func_mbrtowc_sanitycheck=3D${gl_cv_func_mbrtowc_sanitycheck=3Dyes}
| gl_cv_func_mbrtowc_null_arg=3D${gl_cv_func_mbrtowc_null_arg=3Dyes}
| gl_cv_func_mbrtowc_retval=3D${gl_cv_func_mbrtowc_retval=3Dyes}
| gl_cv_func_mbrtowc_nul_retval=3D${gl_cv_func_mbrtowc_nul_retval=3Dyes}
|=20
configure:3349: loading site script /home/kyu3/src/poky/meta/site/ix86-comm=
on
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_int=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_unsigned_char_p=3D${ac_cv_sizeof_unsigned_char_p=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
| ac_cv_sizeof_uid_t=3D${ac_cv_sizeof_uid_t=3D4}
| ac_cv_sizeof_gid_t=3D${ac_cv_sizeof_gid_t=3D4}
| ac_cv_sizeof_ino_t=3D${ac_cv_sizeof_ino_t=3D4}
| ac_cv_sizeof_dev_t=3D${ac_cv_sizeof_dev_t=3D8}
| ac_cv_func_getpgrp_void=3D${ac_cv_func_getpgrp_void=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| ac_cv_func_setpgrp_void=3D${ac_cv_func_setpgrp_void=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| ac_cv_path_ESD_CONFIG=3Dno
| lf_cv_sane_realloc=3Dyes
| jm_cv_func_gettimeofday_clobber=3Dno
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
| bf_lsbf=3D1
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # audacity
| ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_src_libmad_frame_h=
=3Dno}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # db
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_mutex=3D${db_cv_mutex=3Dx86/gcc-assembly}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
| # enca
| yeti_cv_func_scanf_modif_size_t=3Dyes
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
|=20
| # glib-2.0
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
|=20
| # guile
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # intercom
| ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
|=20
| # ipsec-tools
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
| racoon_cv_bug_getaddrinfo=3D${racoon_cv_bug_getaddrinfo=3Dno}
|=20
| # jikes-native
| ac_cv_sizeof_wchar_t=3D4
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # libnet=20
| ac_cv_lbl_unaligned_fail=3D${ac_cv_lbl_unaligned_fail=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # libxfce4util
| with_broken_putenv=3D${with_broken_putenv=3Dno}
|=20
| # mono
| cv_mono_sizeof_sunpath=3D108
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dyes}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # p3scan
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # rp-pppoe
| rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
|=20
| # rsync
| rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
| rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
| rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
| rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
| rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
| rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
| rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
| rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
| rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
| rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
|=20
| # samba
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # xffm
| jm_cv_func_working_readdir=3Dyes
|=20
| # xorg X11R7
| ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
| ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sgm=
l_defs_ent=3Dno}
|=20
| # eds-dbus
| ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
|=20
| #dbus
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| #libpciaccess
| have_mtrr_h=3Dyes
|=20
| #mozilla
| moz_cv_size_of_JS_BYTES_PER_WORD=3D4
| moz_cv_align_of_JS_ALIGN_OF_POINTER=3D4
| moz_cv_size_of_JS_BYTES_PER_DOUBLE=3D8
|=20
| #ofono
| ac_cv_lib_c_signalfd=3D${ac_cv_lib_c_signalfd=3Dyes}
|=20
| #unfs-server
| nfsd_cv_broken_setfsuid=3D${nfsd_cv_broken_setfsuid=3D0}
| nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
| nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
configure:3349: loading site script /home/kyu3/src/poky/meta/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # Avoid sudo to assume void for unsetenv in cross environment, or else it=
 conflicts with
| # target stdlib.h prototype which follows POSIX compiliance. Mark for ups=
tream.
| sudo_cv_func_unsetenv_void=3Dno
|=20
| # shadow dir info, to avoid searching build system
| shadow_cv_maildir=3D${localstatedir}/spool/mail
| shadow_cv_mailfile=3DMailbox
| shadow_cv_utmpdir=3D${localstatedir}/run
| shadow_cv_logdir=3D${localstatedir}/log
| shadow_cv_passwd_dir=3D${bindir}
|=20
configure:3349: loading site script /home/kyu3/sdb/test/tmp/sysroots/qemux8=
6/usr/share/i586-poky-linux_config_site.d/zlib_config
| ac_cv_header_inttypes_h=3D${ac_cv_header_inttypes_h=3Dyes}
| ac_cv_header_memory_h=3D${ac_cv_header_memory_h=3Dyes}
| ac_cv_header_stdc=3D${ac_cv_header_stdc=3Dyes}
| ac_cv_header_stdint_h=3D${ac_cv_header_stdint_h=3Dyes}
| ac_cv_header_stdlib_h=3D${ac_cv_header_stdlib_h=3Dyes}
| ac_cv_header_string_h=3D${ac_cv_header_string_h=3Dyes}
| ac_cv_header_strings_h=3D${ac_cv_header_strings_h=3Dyes}
| ac_cv_header_sys_stat_h=3D${ac_cv_header_sys_stat_h=3Dyes}
| ac_cv_header_sys_types_h=3D${ac_cv_header_sys_types_h=3Dyes}
| ac_cv_header_unistd_h=3D${ac_cv_header_unistd_h=3Dyes}
| ac_cv_header_zlib_h=3D${ac_cv_header_zlib_h=3Dyes}
configure:3349: loading site script /home/kyu3/sdb/test/tmp/sysroots/qemux8=
6/usr/share/i586-poky-linux_config_site.d/eglibc_config
| ac_cv_func___adjtimex=3D${ac_cv_func___adjtimex=3Dyes}
| ac_cv_func___argz_count=3D${ac_cv_func___argz_count=3Dyes}
| ac_cv_func___argz_next=3D${ac_cv_func___argz_next=3Dyes}
| ac_cv_func___argz_stringify=3D${ac_cv_func___argz_stringify=3Dyes}
| ac_cv_func___fpending=3D${ac_cv_func___fpending=3Dyes}
| ac_cv_func___fsetlocking=3D${ac_cv_func___fsetlocking=3Dyes}
| ac_cv_func___progname=3D${ac_cv_func___progname=3Dyes}
| ac_cv_func___secure_getenv=3D${ac_cv_func___secure_getenv=3Dyes}
| ac_cv_func__obstack_free=3D${ac_cv_func__obstack_free=3Dyes}
| ac_cv_func__setjmp=3D${ac_cv_func__setjmp=3Dyes}
| ac_cv_func__sys_siglist=3D${ac_cv_func__sys_siglist=3Dyes}
| ac_cv_func_a64l=3D${ac_cv_func_a64l=3Dyes}
| ac_cv_func_abs=3D${ac_cv_func_abs=3Dyes}
| ac_cv_func_access=3D${ac_cv_func_access=3Dyes}
| ac_cv_func_alarm=3D${ac_cv_func_alarm=3Dyes}
| ac_cv_func_alphasort=3D${ac_cv_func_alphasort=3Dyes}
| ac_cv_func_argz_append=3D${ac_cv_func_argz_append=3Dyes}
| ac_cv_func_argz_create_sep=3D${ac_cv_func_argz_create_sep=3Dyes}
| ac_cv_func_argz_insert=3D${ac_cv_func_argz_insert=3Dyes}
| ac_cv_func_argz_next=3D${ac_cv_func_argz_next=3Dyes}
| ac_cv_func_argz_stringify=3D${ac_cv_func_argz_stringify=3Dyes}
| ac_cv_func_asprintf=3D${ac_cv_func_asprintf=3Dyes}
| ac_cv_func_atexit=3D${ac_cv_func_atexit=3Dyes}
| ac_cv_func_atof=3D${ac_cv_func_atof=3Dyes}
| ac_cv_func_atoi=3D${ac_cv_func_atoi=3Dyes}
| ac_cv_func_bcmp=3D${ac_cv_func_bcmp=3Dyes}
| ac_cv_func_bcopy=3D${ac_cv_func_bcopy=3Dyes}
| ac_cv_func_bind_textdomain_codeset=3D${ac_cv_func_bind_textdomain_codeset=
=3Dyes}
| ac_cv_func_bindresvport=3D${ac_cv_func_bindresvport=3Dyes}
| ac_cv_func_btowc=3D${ac_cv_func_btowc=3Dyes}
| ac_cv_func_bzero=3D${ac_cv_func_bzero=3Dyes}
| ac_cv_func_calloc=3D${ac_cv_func_calloc=3Dyes}
| ac_cv_func_canonicalize_file_name=3D${ac_cv_func_canonicalize_file_name=
=3Dyes}
| ac_cv_func_catgets=3D${ac_cv_func_catgets=3Dyes}
| ac_cv_func_cfgetospeed=3D${ac_cv_func_cfgetospeed=3Dyes}
| ac_cv_func_cfsetispeed=3D${ac_cv_func_cfsetispeed=3Dyes}
| ac_cv_func_cfsetspeed=3D${ac_cv_func_cfsetspeed=3Dyes}
| ac_cv_func_chmod=3D${ac_cv_func_chmod=3Dyes}
| ac_cv_func_chown=3D${ac_cv_func_chown=3Dyes}
| ac_cv_func_chroot=3D${ac_cv_func_chroot=3Dyes}
| ac_cv_func_clock=3D${ac_cv_func_clock=3Dyes}
| ac_cv_func_close=3D${ac_cv_func_close=3Dyes}
| ac_cv_func_closedir=3D${ac_cv_func_closedir=3Dyes}
| ac_cv_func_closelog=3D${ac_cv_func_closelog=3Dyes}
| ac_cv_func_confstr=3D${ac_cv_func_confstr=3Dyes}
| ac_cv_func_connect=3D${ac_cv_func_connect=3Dyes}
| ac_cv_func_daemon=3D${ac_cv_func_daemon=3Dyes}
| ac_cv_func_dcgettext=3D${ac_cv_func_dcgettext=3Dyes}
| ac_cv_func_difftime=3D${ac_cv_func_difftime=3Dyes}
| ac_cv_func_dirfd=3D${ac_cv_func_dirfd=3Dyes}
| ac_cv_func_dirname=3D${ac_cv_func_dirname=3Dyes}
| ac_cv_func_dngettext=3D${ac_cv_func_dngettext=3Dyes}
| ac_cv_func_dup2=3D${ac_cv_func_dup2=3Dyes}
| ac_cv_func_ecvt=3D${ac_cv_func_ecvt=3Dyes}
| ac_cv_func_endgrent=3D${ac_cv_func_endgrent=3Dyes}
| ac_cv_func_endmntent=3D${ac_cv_func_endmntent=3Dyes}
| ac_cv_func_endpwent=3D${ac_cv_func_endpwent=3Dyes}
| ac_cv_func_endutent=3D${ac_cv_func_endutent=3Dyes}
| ac_cv_func_endutxent=3D${ac_cv_func_endutxent=3Dyes}
| ac_cv_func_epoll_ctl=3D${ac_cv_func_epoll_ctl=3Dyes}
| ac_cv_func_err=3D${ac_cv_func_err=3Dyes}
| ac_cv_func_ether_hostton=3D${ac_cv_func_ether_hostton=3Dyes}
| ac_cv_func_ether_ntohost=3D${ac_cv_func_ether_ntohost=3Dyes}
| ac_cv_func_euidaccess=3D${ac_cv_func_euidaccess=3Dyes}
| ac_cv_func_execv=3D${ac_cv_func_execv=3Dyes}
| ac_cv_func_fchdir=3D${ac_cv_func_fchdir=3Dyes}
| ac_cv_func_fchmod=3D${ac_cv_func_fchmod=3Dyes}
| ac_cv_func_fchmodat=3D${ac_cv_func_fchmodat=3Dyes}
| ac_cv_func_fchown=3D${ac_cv_func_fchown=3Dyes}
| ac_cv_func_fchownat=3D${ac_cv_func_fchownat=3Dyes}
| ac_cv_func_fcntl=3D${ac_cv_func_fcntl=3Dyes}
| ac_cv_func_fcvt=3D${ac_cv_func_fcvt=3Dyes}
| ac_cv_func_fdatasync=3D${ac_cv_func_fdatasync=3Dyes}
| ac_cv_func_fdopendir=3D${ac_cv_func_fdopendir=3Dyes}
| ac_cv_func_feof_unlocked=3D${ac_cv_func_feof_unlocked=3Dyes}
| ac_cv_func_fgets_unlocked=3D${ac_cv_func_fgets_unlocked=3Dyes}
| ac_cv_func_fgetxattr=3D${ac_cv_func_fgetxattr=3Dyes}
| ac_cv_func_finite=3D${ac_cv_func_finite=3Dyes}
| ac_cv_func_flistxattr=3D${ac_cv_func_flistxattr=3Dyes}
| ac_cv_func_flock=3D${ac_cv_func_flock=3Dyes}
| ac_cv_func_flockfile=3D${ac_cv_func_flockfile=3Dyes}
| ac_cv_func_fnmatch=3D${ac_cv_func_fnmatch=3Dyes}
| ac_cv_func_fork=3D${ac_cv_func_fork=3Dyes}
| ac_cv_func_fpathconf=3D${ac_cv_func_fpathconf=3Dyes}
| ac_cv_func_fprintf=3D${ac_cv_func_fprintf=3Dyes}
| ac_cv_func_free=3D${ac_cv_func_free=3Dyes}
| ac_cv_func_freeaddrinfo=3D${ac_cv_func_freeaddrinfo=3Dyes}
| ac_cv_func_freeifaddrs=3D${ac_cv_func_freeifaddrs=3Dyes}
| ac_cv_func_fseeko=3D${ac_cv_func_fseeko=3Dyes}
| ac_cv_func_fsetxattr=3D${ac_cv_func_fsetxattr=3Dyes}
| ac_cv_func_fstat64=3D${ac_cv_func_fstat64=3Dyes}
| ac_cv_func_fstat=3D${ac_cv_func_fstat=3Dyes}
| ac_cv_func_fstatfs=3D${ac_cv_func_fstatfs=3Dyes}
| ac_cv_func_fsync=3D${ac_cv_func_fsync=3Dyes}
| ac_cv_func_ftello=3D${ac_cv_func_ftello=3Dyes}
| ac_cv_func_ftime=3D${ac_cv_func_ftime=3Dyes}
| ac_cv_func_ftruncate=3D${ac_cv_func_ftruncate=3Dyes}
| ac_cv_func_funlockfile=3D${ac_cv_func_funlockfile=3Dyes}
| ac_cv_func_futimes=3D${ac_cv_func_futimes=3Dyes}
| ac_cv_func_futimesat=3D${ac_cv_func_futimesat=3Dyes}
| ac_cv_func_gai_strerror=3D${ac_cv_func_gai_strerror=3Dyes}
| ac_cv_func_gcvt=3D${ac_cv_func_gcvt=3Dyes}
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
| ac_cv_func_getc_unlocked=3D${ac_cv_func_getc_unlocked=3Dyes}
| ac_cv_func_getcwd=3D${ac_cv_func_getcwd=3Dyes}
| ac_cv_func_getdelim=3D${ac_cv_func_getdelim=3Dyes}
| ac_cv_func_getdomainname=3D${ac_cv_func_getdomainname=3Dyes}
| ac_cv_func_getdtablesize=3D${ac_cv_func_getdtablesize=3Dyes}
| ac_cv_func_getegid=3D${ac_cv_func_getegid=3Dyes}
| ac_cv_func_getenv=3D${ac_cv_func_getenv=3Dyes}
| ac_cv_func_geteuid=3D${ac_cv_func_geteuid=3Dyes}
| ac_cv_func_getgid=3D${ac_cv_func_getgid=3Dyes}
| ac_cv_func_getgrent=3D${ac_cv_func_getgrent=3Dyes}
| ac_cv_func_getgrent_r=3D${ac_cv_func_getgrent_r=3Dyes}
| ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
| ac_cv_func_getgrnam=3D${ac_cv_func_getgrnam=3Dyes}
| ac_cv_func_getgrnam_r=3D${ac_cv_func_getgrnam_r=3Dyes}
| ac_cv_func_getgrouplist=3D${ac_cv_func_getgrouplist=3Dyes}
| ac_cv_func_getgroups=3D${ac_cv_func_getgroups=3Dyes}
| ac_cv_func_gethostbyaddr_r=3D${ac_cv_func_gethostbyaddr_r=3Dyes}
| ac_cv_func_gethostbyname2=3D${ac_cv_func_gethostbyname2=3Dyes}
| ac_cv_func_gethostbyname=3D${ac_cv_func_gethostbyname=3Dyes}
| ac_cv_func_gethostbyname_r=3D${ac_cv_func_gethostbyname_r=3Dyes}
| ac_cv_func_gethostent=3D${ac_cv_func_gethostent=3Dyes}
| ac_cv_func_gethostid=3D${ac_cv_func_gethostid=3Dyes}
| ac_cv_func_gethostname=3D${ac_cv_func_gethostname=3Dyes}
| ac_cv_func_getifaddrs=3D${ac_cv_func_getifaddrs=3Dyes}
| ac_cv_func_getline=3D${ac_cv_func_getline=3Dyes}
| ac_cv_func_getloadavg=3D${ac_cv_func_getloadavg=3Dyes}
| ac_cv_func_getmntent=3D${ac_cv_func_getmntent=3Dyes}
| ac_cv_func_getmsg=3D${ac_cv_func_getmsg=3Dyes}
| ac_cv_func_getnameinfo=3D${ac_cv_func_getnameinfo=3Dyes}
| ac_cv_func_getnetbyaddr_r=3D${ac_cv_func_getnetbyaddr_r=3Dyes}
| ac_cv_func_getnetgrent_r=3D${ac_cv_func_getnetgrent_r=3Dyes}
| ac_cv_func_getopt=3D${ac_cv_func_getopt=3Dyes}
| ac_cv_func_getopt_long=3D${ac_cv_func_getopt_long=3Dyes}
| ac_cv_func_getopt_long_only=3D${ac_cv_func_getopt_long_only=3Dyes}
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_getpass=3D${ac_cv_func_getpass=3Dyes}
| ac_cv_func_getpeername=3D${ac_cv_func_getpeername=3Dyes}
| ac_cv_func_getpgrp=3D${ac_cv_func_getpgrp=3Dyes}
| ac_cv_func_getpid=3D${ac_cv_func_getpid=3Dyes}
| ac_cv_func_getppid=3D${ac_cv_func_getppid=3Dyes}
| ac_cv_func_getprotoent_r=3D${ac_cv_func_getprotoent_r=3Dyes}
| ac_cv_func_getpwent=3D${ac_cv_func_getpwent=3Dyes}
| ac_cv_func_getpwent_r=3D${ac_cv_func_getpwent_r=3Dyes}
| ac_cv_func_getpwnam=3D${ac_cv_func_getpwnam=3Dyes}
| ac_cv_func_getpwnam_r=3D${ac_cv_func_getpwnam_r=3Dyes}
| ac_cv_func_getpwuid=3D${ac_cv_func_getpwuid=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_getresuid=3D${ac_cv_func_getresuid=3Dyes}
| ac_cv_func_getrlimit=3D${ac_cv_func_getrlimit=3Dyes}
| ac_cv_func_getrusage=3D${ac_cv_func_getrusage=3Dyes}
| ac_cv_func_getservbyname=3D${ac_cv_func_getservbyname=3Dyes}
| ac_cv_func_getservbyname_r=3D${ac_cv_func_getservbyname_r=3Dyes}
| ac_cv_func_getservbyport_r=3D${ac_cv_func_getservbyport_r=3Dyes}
| ac_cv_func_getservent=3D${ac_cv_func_getservent=3Dyes}
| ac_cv_func_getservent_r=3D${ac_cv_func_getservent_r=3Dyes}
| ac_cv_func_getspnam=3D${ac_cv_func_getspnam=3Dyes}
| ac_cv_func_getspnam_r=3D${ac_cv_func_getspnam_r=3Dyes}
| ac_cv_func_gettimeofday=3D${ac_cv_func_gettimeofday=3Dyes}
| ac_cv_func_getttyent=3D${ac_cv_func_getttyent=3Dyes}
| ac_cv_func_getttynam=3D${ac_cv_func_getttynam=3Dyes}
| ac_cv_func_getuid=3D${ac_cv_func_getuid=3Dyes}
| ac_cv_func_getusershell=3D${ac_cv_func_getusershell=3Dyes}
| ac_cv_func_getutent=3D${ac_cv_func_getutent=3Dyes}
| ac_cv_func_getutid=3D${ac_cv_func_getutid=3Dyes}
| ac_cv_func_getutline=3D${ac_cv_func_getutline=3Dyes}
| ac_cv_func_getutmp=3D${ac_cv_func_getutmp=3Dyes}
| ac_cv_func_getutmpx=3D${ac_cv_func_getutmpx=3Dyes}
| ac_cv_func_getutxent=3D${ac_cv_func_getutxent=3Dyes}
| ac_cv_func_getutxid=3D${ac_cv_func_getutxid=3Dyes}
| ac_cv_func_getutxline=3D${ac_cv_func_getutxline=3Dyes}
| ac_cv_func_getwd=3D${ac_cv_func_getwd=3Dyes}
| ac_cv_func_getxattr=3D${ac_cv_func_getxattr=3Dyes}
| ac_cv_func_glob=3D${ac_cv_func_glob=3Dyes}
| ac_cv_func_gmtime=3D${ac_cv_func_gmtime=3Dyes}
| ac_cv_func_gmtime_r=3D${ac_cv_func_gmtime_r=3Dyes}
| ac_cv_func_grantpt=3D${ac_cv_func_grantpt=3Dyes}
| ac_cv_func_group_member=3D${ac_cv_func_group_member=3Dyes}
| ac_cv_func_herror=3D${ac_cv_func_herror=3Dyes}
| ac_cv_func_hstrerror=3D${ac_cv_func_hstrerror=3Dyes}
| ac_cv_func_iconv=3D${ac_cv_func_iconv=3Dyes}
| ac_cv_func_iconv_open=3D${ac_cv_func_iconv_open=3Dyes}
| ac_cv_func_if_freenameindex=3D${ac_cv_func_if_freenameindex=3Dyes}
| ac_cv_func_if_indextoname=3D${ac_cv_func_if_indextoname=3Dyes}
| ac_cv_func_if_nameindex=3D${ac_cv_func_if_nameindex=3Dyes}
| ac_cv_func_if_nametoindex=3D${ac_cv_func_if_nametoindex=3Dyes}
| ac_cv_func_index=3D${ac_cv_func_index=3Dyes}
| ac_cv_func_inet_addr=3D${ac_cv_func_inet_addr=3Dyes}
| ac_cv_func_inet_aton=3D${ac_cv_func_inet_aton=3Dyes}
| ac_cv_func_inet_ntoa=3D${ac_cv_func_inet_ntoa=3Dyes}
| ac_cv_func_inet_ntop=3D${ac_cv_func_inet_ntop=3Dyes}
| ac_cv_func_inet_pton=3D${ac_cv_func_inet_pton=3Dyes}
| ac_cv_func_initgroups=3D${ac_cv_func_initgroups=3Dyes}
| ac_cv_func_innetgr=3D${ac_cv_func_innetgr=3Dyes}
| ac_cv_func_iruserok=3D${ac_cv_func_iruserok=3Dyes}
| ac_cv_func_isascii=3D${ac_cv_func_isascii=3Dyes}
| ac_cv_func_isatty=3D${ac_cv_func_isatty=3Dyes}
| ac_cv_func_isblank=3D${ac_cv_func_isblank=3Dyes}
| ac_cv_func_isgraph=3D${ac_cv_func_isgraph=3Dyes}
| ac_cv_func_isinf=3D${ac_cv_func_isinf=3Dyes}
| ac_cv_func_isnan=3D${ac_cv_func_isnan=3Dyes}
| ac_cv_func_isprint=3D${ac_cv_func_isprint=3Dyes}
| ac_cv_func_isspace=3D${ac_cv_func_isspace=3Dyes}
| ac_cv_func_iswalnum=3D${ac_cv_func_iswalnum=3Dyes}
| ac_cv_func_iswcntrl=3D${ac_cv_func_iswcntrl=3Dyes}
| ac_cv_func_iswctype=3D${ac_cv_func_iswctype=3Dyes}
| ac_cv_func_iswprint=3D${ac_cv_func_iswprint=3Dyes}
| ac_cv_func_iswspace=3D${ac_cv_func_iswspace=3Dyes}
| ac_cv_func_iswupper=3D${ac_cv_func_iswupper=3Dyes}
| ac_cv_func_isxdigit=3D${ac_cv_func_isxdigit=3Dyes}
| ac_cv_func_kill=3D${ac_cv_func_kill=3Dyes}
| ac_cv_func_killpg=3D${ac_cv_func_killpg=3Dyes}
| ac_cv_func_lchown=3D${ac_cv_func_lchown=3Dyes}
| ac_cv_func_lckpwdf=3D${ac_cv_func_lckpwdf=3Dyes}
| ac_cv_func_lgetxattr=3D${ac_cv_func_lgetxattr=3Dyes}
| ac_cv_func_link=3D${ac_cv_func_link=3Dyes}
| ac_cv_func_listxattr=3D${ac_cv_func_listxattr=3Dyes}
| ac_cv_func_llistxattr=3D${ac_cv_func_llistxattr=3Dyes}
| ac_cv_func_localtime=3D${ac_cv_func_localtime=3Dyes}
| ac_cv_func_localtime_r=3D${ac_cv_func_localtime_r=3Dyes}
| ac_cv_func_lockf=3D${ac_cv_func_lockf=3Dyes}
| ac_cv_func_lrand48=3D${ac_cv_func_lrand48=3Dyes}
| ac_cv_func_lsearch=3D${ac_cv_func_lsearch=3Dyes}
| ac_cv_func_lseek64=3D${ac_cv_func_lseek64=3Dyes}
| ac_cv_func_lsetxattr=3D${ac_cv_func_lsetxattr=3Dyes}
| ac_cv_func_lstat=3D${ac_cv_func_lstat=3Dyes}
| ac_cv_func_mallinfo=3D${ac_cv_func_mallinfo=3Dyes}
| ac_cv_func_malloc=3D${ac_cv_func_malloc=3Dyes}
| ac_cv_func_mblen=3D${ac_cv_func_mblen=3Dyes}
| ac_cv_func_mbrlen=3D${ac_cv_func_mbrlen=3Dyes}
| ac_cv_func_mbrtowc=3D${ac_cv_func_mbrtowc=3Dyes}
| ac_cv_func_mbsinit=3D${ac_cv_func_mbsinit=3Dyes}
| ac_cv_func_mbsrtowcs=3D${ac_cv_func_mbsrtowcs=3Dyes}
| ac_cv_func_mbtowc=3D${ac_cv_func_mbtowc=3Dyes}
| ac_cv_func_memalign=3D${ac_cv_func_memalign=3Dyes}
| ac_cv_func_memchr=3D${ac_cv_func_memchr=3Dyes}
| ac_cv_func_memcmp=3D${ac_cv_func_memcmp=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_memmove=3D${ac_cv_func_memmove=3Dyes}
| ac_cv_func_mempcpy=3D${ac_cv_func_mempcpy=3Dyes}
| ac_cv_func_memrchr=3D${ac_cv_func_memrchr=3Dyes}
| ac_cv_func_memset=3D${ac_cv_func_memset=3Dyes}
| ac_cv_func_mkdir=3D${ac_cv_func_mkdir=3Dyes}
| ac_cv_func_mkdirat=3D${ac_cv_func_mkdirat=3Dyes}
| ac_cv_func_mkdtemp=3D${ac_cv_func_mkdtemp=3Dyes}
| ac_cv_func_mkfifo=3D${ac_cv_func_mkfifo=3Dyes}
| ac_cv_func_mknod=3D${ac_cv_func_mknod=3Dyes}
| ac_cv_func_mkstemp64=3D${ac_cv_func_mkstemp64=3Dyes}
| ac_cv_func_mkstemp=3D${ac_cv_func_mkstemp=3Dyes}
| ac_cv_func_mktime=3D${ac_cv_func_mktime=3Dyes}
| ac_cv_func_mlock=3D${ac_cv_func_mlock=3Dyes}
| ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
| ac_cv_func_mtrace=3D${ac_cv_func_mtrace=3Dyes}
| ac_cv_func_munlock=3D${ac_cv_func_munlock=3Dyes}
| ac_cv_func_munmap=3D${ac_cv_func_munmap=3Dyes}
| ac_cv_func_nanosleep=3D${ac_cv_func_nanosleep=3Dyes}
| ac_cv_func_nice=3D${ac_cv_func_nice=3Dyes}
| ac_cv_func_nl_langinfo=3D${ac_cv_func_nl_langinfo=3Dyes}
| ac_cv_func_ntp_adjtime=3D${ac_cv_func_ntp_adjtime=3Dyes}
| ac_cv_func_ntp_gettime=3D${ac_cv_func_ntp_gettime=3Dyes}
| ac_cv_func_on_exit=3D${ac_cv_func_on_exit=3Dyes}
| ac_cv_func_open64=3D${ac_cv_func_open64=3Dyes}
| ac_cv_func_open=3D${ac_cv_func_open=3Dyes}
| ac_cv_func_openat=3D${ac_cv_func_openat=3Dyes}
| ac_cv_func_opendir=3D${ac_cv_func_opendir=3Dyes}
| ac_cv_func_openlog=3D${ac_cv_func_openlog=3Dyes}
| ac_cv_func_pathconf=3D${ac_cv_func_pathconf=3Dyes}
| ac_cv_func_pipe=3D${ac_cv_func_pipe=3Dyes}
| ac_cv_func_poll=3D${ac_cv_func_poll=3Dyes}
| ac_cv_func_popen=3D${ac_cv_func_popen=3Dyes}
| ac_cv_func_posix_memalign=3D${ac_cv_func_posix_memalign=3Dyes}
| ac_cv_func_prctl=3D${ac_cv_func_prctl=3Dyes}
| ac_cv_func_pread=3D${ac_cv_func_pread=3Dyes}
| ac_cv_func_printf=3D${ac_cv_func_printf=3Dyes}
| ac_cv_func_pselect=3D${ac_cv_func_pselect=3Dyes}
| ac_cv_func_pthread_mutex_lock=3D${ac_cv_func_pthread_mutex_lock=3Dyes}
| ac_cv_func_ptsname=3D${ac_cv_func_ptsname=3Dyes}
| ac_cv_func_putenv=3D${ac_cv_func_putenv=3Dyes}
| ac_cv_func_putgrent=3D${ac_cv_func_putgrent=3Dyes}
| ac_cv_func_putpwent=3D${ac_cv_func_putpwent=3Dyes}
| ac_cv_func_putspent=3D${ac_cv_func_putspent=3Dyes}
| ac_cv_func_pututline=3D${ac_cv_func_pututline=3Dyes}
| ac_cv_func_pututxline=3D${ac_cv_func_pututxline=3Dyes}
| ac_cv_func_putwc=3D${ac_cv_func_putwc=3Dyes}
| ac_cv_func_pwrite=3D${ac_cv_func_pwrite=3Dyes}
| ac_cv_func_qsort=3D${ac_cv_func_qsort=3Dyes}
| ac_cv_func_raise=3D${ac_cv_func_raise=3Dyes}
| ac_cv_func_rand=3D${ac_cv_func_rand=3Dyes}
| ac_cv_func_rand_r=3D${ac_cv_func_rand_r=3Dyes}
| ac_cv_func_random=3D${ac_cv_func_random=3Dyes}
| ac_cv_func_re_comp=3D${ac_cv_func_re_comp=3Dyes}
| ac_cv_func_re_exec=3D${ac_cv_func_re_exec=3Dyes}
| ac_cv_func_re_search=3D${ac_cv_func_re_search=3Dyes}
| ac_cv_func_read=3D${ac_cv_func_read=3Dyes}
| ac_cv_func_readdir=3D${ac_cv_func_readdir=3Dyes}
| ac_cv_func_readdir_r=3D${ac_cv_func_readdir_r=3Dyes}
| ac_cv_func_readlink=3D${ac_cv_func_readlink=3Dyes}
| ac_cv_func_realloc=3D${ac_cv_func_realloc=3Dyes}
| ac_cv_func_realpath=3D${ac_cv_func_realpath=3Dyes}
| ac_cv_func_recvmsg=3D${ac_cv_func_recvmsg=3Dyes}
| ac_cv_func_regcomp=3D${ac_cv_func_regcomp=3Dyes}
| ac_cv_func_regexec=3D${ac_cv_func_regexec=3Dyes}
| ac_cv_func_remove=3D${ac_cv_func_remove=3Dyes}
| ac_cv_func_rename=3D${ac_cv_func_rename=3Dyes}
| ac_cv_func_rmdir=3D${ac_cv_func_rmdir=3Dyes}
| ac_cv_func_rpmatch=3D${ac_cv_func_rpmatch=3Dyes}
| ac_cv_func_rresvport_af=3D${ac_cv_func_rresvport_af=3Dyes}
| ac_cv_func_ruserok=3D${ac_cv_func_ruserok=3Dyes}
| ac_cv_func_ruserok_af=3D${ac_cv_func_ruserok_af=3Dyes}
| ac_cv_func_sbrk=3D${ac_cv_func_sbrk=3Dyes}
| ac_cv_func_scandir=3D${ac_cv_func_scandir=3Dyes}
| ac_cv_func_sched_setscheduler=3D${ac_cv_func_sched_setscheduler=3Dyes}
| ac_cv_func_sched_yield=3D${ac_cv_func_sched_yield=3Dyes}
| ac_cv_func_select=3D${ac_cv_func_select=3Dyes}
| ac_cv_func_semctl=3D${ac_cv_func_semctl=3Dyes}
| ac_cv_func_semget=3D${ac_cv_func_semget=3Dyes}
| ac_cv_func_sendmsg=3D${ac_cv_func_sendmsg=3Dyes}
| ac_cv_func_setbuf=3D${ac_cv_func_setbuf=3Dyes}
| ac_cv_func_setbuffer=3D${ac_cv_func_setbuffer=3Dyes}
| ac_cv_func_setegid=3D${ac_cv_func_setegid=3Dyes}
| ac_cv_func_setenv=3D${ac_cv_func_setenv=3Dyes}
| ac_cv_func_seteuid=3D${ac_cv_func_seteuid=3Dyes}
| ac_cv_func_setgid=3D${ac_cv_func_setgid=3Dyes}
| ac_cv_func_setgroups=3D${ac_cv_func_setgroups=3Dyes}
| ac_cv_func_sethostname=3D${ac_cv_func_sethostname=3Dyes}
| ac_cv_func_setitimer=3D${ac_cv_func_setitimer=3Dyes}
| ac_cv_func_setjmp=3D${ac_cv_func_setjmp=3Dyes}
| ac_cv_func_setlinebuf=3D${ac_cv_func_setlinebuf=3Dyes}
| ac_cv_func_setlocale=3D${ac_cv_func_setlocale=3Dyes}
| ac_cv_func_setmntent=3D${ac_cv_func_setmntent=3Dyes}
| ac_cv_func_setpgid=3D${ac_cv_func_setpgid=3Dyes}
| ac_cv_func_setpgrp=3D${ac_cv_func_setpgrp=3Dyes}
| ac_cv_func_setpriority=3D${ac_cv_func_setpriority=3Dyes}
| ac_cv_func_setregid=3D${ac_cv_func_setregid=3Dyes}
| ac_cv_func_setresgid=3D${ac_cv_func_setresgid=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_setreuid=3D${ac_cv_func_setreuid=3Dyes}
| ac_cv_func_setrlimit=3D${ac_cv_func_setrlimit=3Dyes}
| ac_cv_func_setsid=3D${ac_cv_func_setsid=3Dyes}
| ac_cv_func_setsockopt=3D${ac_cv_func_setsockopt=3Dyes}
| ac_cv_func_settimeofday=3D${ac_cv_func_settimeofday=3Dyes}
| ac_cv_func_setuid=3D${ac_cv_func_setuid=3Dyes}
| ac_cv_func_setutent=3D${ac_cv_func_setutent=3Dyes}
| ac_cv_func_setutxent=3D${ac_cv_func_setutxent=3Dyes}
| ac_cv_func_setvbuf=3D${ac_cv_func_setvbuf=3Dyes}
| ac_cv_func_setxattr=3D${ac_cv_func_setxattr=3Dyes}
| ac_cv_func_sgetspent=3D${ac_cv_func_sgetspent=3Dyes}
| ac_cv_func_shmat=3D${ac_cv_func_shmat=3Dyes}
| ac_cv_func_shmctl=3D${ac_cv_func_shmctl=3Dyes}
| ac_cv_func_shmdt=3D${ac_cv_func_shmdt=3Dyes}
| ac_cv_func_shmget=3D${ac_cv_func_shmget=3Dyes}
| ac_cv_func_shutdown=3D${ac_cv_func_shutdown=3Dyes}
| ac_cv_func_sigaction=3D${ac_cv_func_sigaction=3Dyes}
| ac_cv_func_sigaddset=3D${ac_cv_func_sigaddset=3Dyes}
| ac_cv_func_sigaltstack=3D${ac_cv_func_sigaltstack=3Dyes}
| ac_cv_func_sigblock=3D${ac_cv_func_sigblock=3Dyes}
| ac_cv_func_sigemptyset=3D${ac_cv_func_sigemptyset=3Dyes}
| ac_cv_func_sighold=3D${ac_cv_func_sighold=3Dyes}
| ac_cv_func_siginterrupt=3D${ac_cv_func_siginterrupt=3Dyes}
| ac_cv_func_signal=3D${ac_cv_func_signal=3Dyes}
| ac_cv_func_sigprocmask=3D${ac_cv_func_sigprocmask=3Dyes}
| ac_cv_func_sigset=3D${ac_cv_func_sigset=3Dyes}
| ac_cv_func_sigsetmask=3D${ac_cv_func_sigsetmask=3Dyes}
| ac_cv_func_sigstack=3D${ac_cv_func_sigstack=3Dyes}
| ac_cv_func_sigsuspend=3D${ac_cv_func_sigsuspend=3Dyes}
| ac_cv_func_sigvec=3D${ac_cv_func_sigvec=3Dyes}
| ac_cv_func_snprintf=3D${ac_cv_func_snprintf=3Dyes}
| ac_cv_func_socket=3D${ac_cv_func_socket=3Dyes}
| ac_cv_func_socketpair=3D${ac_cv_func_socketpair=3Dyes}
| ac_cv_func_sprintf=3D${ac_cv_func_sprintf=3Dyes}
| ac_cv_func_srand48=3D${ac_cv_func_srand48=3Dyes}
| ac_cv_func_srand=3D${ac_cv_func_srand=3Dyes}
| ac_cv_func_srandom=3D${ac_cv_func_srandom=3Dyes}
| ac_cv_func_sscanf=3D${ac_cv_func_sscanf=3Dyes}
| ac_cv_func_stat=3D${ac_cv_func_stat=3Dyes}
| ac_cv_func_statfs=3D${ac_cv_func_statfs=3Dyes}
| ac_cv_func_statvfs=3D${ac_cv_func_statvfs=3Dyes}
| ac_cv_func_stime=3D${ac_cv_func_stime=3Dyes}
| ac_cv_func_stpcpy=3D${ac_cv_func_stpcpy=3Dyes}
| ac_cv_func_strcasecmp=3D${ac_cv_func_strcasecmp=3Dyes}
| ac_cv_func_strcasestr=3D${ac_cv_func_strcasestr=3Dyes}
| ac_cv_func_strchr=3D${ac_cv_func_strchr=3Dyes}
| ac_cv_func_strchrnul=3D${ac_cv_func_strchrnul=3Dyes}
| ac_cv_func_strcmp=3D${ac_cv_func_strcmp=3Dyes}
| ac_cv_func_strcspn=3D${ac_cv_func_strcspn=3Dyes}
| ac_cv_func_strdup=3D${ac_cv_func_strdup=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
| ac_cv_func_strerror_r=3D${ac_cv_func_strerror_r=3Dyes}
| ac_cv_func_strftime=3D${ac_cv_func_strftime=3Dyes}
| ac_cv_func_strlen=3D${ac_cv_func_strlen=3Dyes}
| ac_cv_func_strncasecmp=3D${ac_cv_func_strncasecmp=3Dyes}
| ac_cv_func_strncmp=3D${ac_cv_func_strncmp=3Dyes}
| ac_cv_func_strndup=3D${ac_cv_func_strndup=3Dyes}
| ac_cv_func_strnlen=3D${ac_cv_func_strnlen=3Dyes}
| ac_cv_func_strpbrk=3D${ac_cv_func_strpbrk=3Dyes}
| ac_cv_func_strptime=3D${ac_cv_func_strptime=3Dyes}
| ac_cv_func_strrchr=3D${ac_cv_func_strrchr=3Dyes}
| ac_cv_func_strsep=3D${ac_cv_func_strsep=3Dyes}
| ac_cv_func_strsignal=3D${ac_cv_func_strsignal=3Dyes}
| ac_cv_func_strspn=3D${ac_cv_func_strspn=3Dyes}
| ac_cv_func_strstr=3D${ac_cv_func_strstr=3Dyes}
| ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
| ac_cv_func_strtoimax=3D${ac_cv_func_strtoimax=3Dyes}
| ac_cv_func_strtok_r=3D${ac_cv_func_strtok_r=3Dyes}
| ac_cv_func_strtol=3D${ac_cv_func_strtol=3Dyes}
| ac_cv_func_strtoll=3D${ac_cv_func_strtoll=3Dyes}
| ac_cv_func_strtoul=3D${ac_cv_func_strtoul=3Dyes}
| ac_cv_func_strtoull=3D${ac_cv_func_strtoull=3Dyes}
| ac_cv_func_strtoumax=3D${ac_cv_func_strtoumax=3Dyes}
| ac_cv_func_strverscmp=3D${ac_cv_func_strverscmp=3Dyes}
| ac_cv_func_strxfrm=3D${ac_cv_func_strxfrm=3Dyes}
| ac_cv_func_symlink=3D${ac_cv_func_symlink=3Dyes}
| ac_cv_func_sync=3D${ac_cv_func_sync=3Dyes}
| ac_cv_func_sys_siglist=3D${ac_cv_func_sys_siglist=3Dyes}
| ac_cv_func_sysconf=3D${ac_cv_func_sysconf=3Dyes}
| ac_cv_func_sysctl=3D${ac_cv_func_sysctl=3Dyes}
| ac_cv_func_sysinfo=3D${ac_cv_func_sysinfo=3Dyes}
| ac_cv_func_syslog=3D${ac_cv_func_syslog=3Dyes}
| ac_cv_func_system=3D${ac_cv_func_system=3Dyes}
| ac_cv_func_tcgetattr=3D${ac_cv_func_tcgetattr=3Dyes}
| ac_cv_func_tcgetpgrp=3D${ac_cv_func_tcgetpgrp=3Dyes}
| ac_cv_func_tcsetattr=3D${ac_cv_func_tcsetattr=3Dyes}
| ac_cv_func_tcsetpgrp=3D${ac_cv_func_tcsetpgrp=3Dyes}
| ac_cv_func_time=3D${ac_cv_func_time=3Dyes}
| ac_cv_func_timegm=3D${ac_cv_func_timegm=3Dyes}
| ac_cv_func_times=3D${ac_cv_func_times=3Dyes}
| ac_cv_func_timezone=3D${ac_cv_func_timezone=3Dyes}
| ac_cv_func_tmpnam=3D${ac_cv_func_tmpnam=3Dyes}
| ac_cv_func_towlower=3D${ac_cv_func_towlower=3Dyes}
| ac_cv_func_towupper=3D${ac_cv_func_towupper=3Dyes}
| ac_cv_func_truncate=3D${ac_cv_func_truncate=3Dyes}
| ac_cv_func_tsearch=3D${ac_cv_func_tsearch=3Dyes}
| ac_cv_func_ttyname=3D${ac_cv_func_ttyname=3Dyes}
| ac_cv_func_tzset=3D${ac_cv_func_tzset=3Dyes}
| ac_cv_func_ulimit=3D${ac_cv_func_ulimit=3Dyes}
| ac_cv_func_umask=3D${ac_cv_func_umask=3Dyes}
| ac_cv_func_uname=3D${ac_cv_func_uname=3Dyes}
| ac_cv_func_unlink=3D${ac_cv_func_unlink=3Dyes}
| ac_cv_func_unsetenv=3D${ac_cv_func_unsetenv=3Dyes}
| ac_cv_func_unshare=3D${ac_cv_func_unshare=3Dyes}
| ac_cv_func_updwtmp=3D${ac_cv_func_updwtmp=3Dyes}
| ac_cv_func_updwtmpx=3D${ac_cv_func_updwtmpx=3Dyes}
| ac_cv_func_usleep=3D${ac_cv_func_usleep=3Dyes}
| ac_cv_func_ustat=3D${ac_cv_func_ustat=3Dyes}
| ac_cv_func_utime=3D${ac_cv_func_utime=3Dyes}
| ac_cv_func_utimes=3D${ac_cv_func_utimes=3Dyes}
| ac_cv_func_utmpname=3D${ac_cv_func_utmpname=3Dyes}
| ac_cv_func_utmpxname=3D${ac_cv_func_utmpxname=3Dyes}
| ac_cv_func_valloc=3D${ac_cv_func_valloc=3Dyes}
| ac_cv_func_vasprintf=3D${ac_cv_func_vasprintf=3Dyes}
| ac_cv_func_verrx=3D${ac_cv_func_verrx=3Dyes}
| ac_cv_func_vfork=3D${ac_cv_func_vfork=3Dyes}
| ac_cv_func_vfprintf=3D${ac_cv_func_vfprintf=3Dyes}
| ac_cv_func_vfscanf=3D${ac_cv_func_vfscanf=3Dyes}
| ac_cv_func_vhangup=3D${ac_cv_func_vhangup=3Dyes}
| ac_cv_func_vprintf=3D${ac_cv_func_vprintf=3Dyes}
| ac_cv_func_vsnprintf=3D${ac_cv_func_vsnprintf=3Dyes}
| ac_cv_func_vsprintf=3D${ac_cv_func_vsprintf=3Dyes}
| ac_cv_func_wait3=3D${ac_cv_func_wait3=3Dyes}
| ac_cv_func_wait4=3D${ac_cv_func_wait4=3Dyes}
| ac_cv_func_waitpid=3D${ac_cv_func_waitpid=3Dyes}
| ac_cv_func_wcrtomb=3D${ac_cv_func_wcrtomb=3Dyes}
| ac_cv_func_wcscoll=3D${ac_cv_func_wcscoll=3Dyes}
| ac_cv_func_wcsdup=3D${ac_cv_func_wcsdup=3Dyes}
| ac_cv_func_wcslen=3D${ac_cv_func_wcslen=3Dyes}
| ac_cv_func_wctob=3D${ac_cv_func_wctob=3Dyes}
| ac_cv_func_wctomb=3D${ac_cv_func_wctomb=3Dyes}
| ac_cv_func_wctype=3D${ac_cv_func_wctype=3Dyes}
| ac_cv_func_wcwidth=3D${ac_cv_func_wcwidth=3Dyes}
| ac_cv_func_wmemchr=3D${ac_cv_func_wmemchr=3Dyes}
| ac_cv_func_wmemcpy=3D${ac_cv_func_wmemcpy=3Dyes}
| ac_cv_func_wmempcpy=3D${ac_cv_func_wmempcpy=3Dyes}
| ac_cv_header_aio_h=3D${ac_cv_header_aio_h=3Dyes}
| ac_cv_header_alloca_h=3D${ac_cv_header_alloca_h=3Dyes}
| ac_cv_header_argz_h=3D${ac_cv_header_argz_h=3Dyes}
| ac_cv_header_arpa_inet_h=3D${ac_cv_header_arpa_inet_h=3Dyes}
| ac_cv_header_arpa_nameser_h=3D${ac_cv_header_arpa_nameser_h=3Dyes}
| ac_cv_header_asm_byteorder_h=3D${ac_cv_header_asm_byteorder_h=3Dyes}
| ac_cv_header_asm_ioctls_h=3D${ac_cv_header_asm_ioctls_h=3Dyes}
| ac_cv_header_asm_page_h=3D${ac_cv_header_asm_page_h=3Dno}
| ac_cv_header_asm_types_h=3D${ac_cv_header_asm_types_h=3Dyes}
| ac_cv_header_assert_h=3D${ac_cv_header_assert_h=3Dyes}
| ac_cv_header_byteswap_h=3D${ac_cv_header_byteswap_h=3Dyes}
| ac_cv_header_crypt_h=3D${ac_cv_header_crypt_h=3Dyes}
| ac_cv_header_ctype_h=3D${ac_cv_header_ctype_h=3Dyes}
| ac_cv_header_dirent_h=3D${ac_cv_header_dirent_h=3Dyes}
| ac_cv_header_dlfcn_h=3D${ac_cv_header_dlfcn_h=3Dyes}
| ac_cv_header_elf_h=3D${ac_cv_header_elf_h=3Dyes}
| ac_cv_header_endian_h=3D${ac_cv_header_endian_h=3Dyes}
| ac_cv_header_err_h=3D${ac_cv_header_err_h=3Dyes}
| ac_cv_header_errno_h=3D${ac_cv_header_errno_h=3Dyes}
| ac_cv_header_execinfo_h=3D${ac_cv_header_execinfo_h=3Dyes}
| ac_cv_header_fcntl_h=3D${ac_cv_header_fcntl_h=3Dyes}
| ac_cv_header_features_h=3D${ac_cv_header_features_h=3Dyes}
| ac_cv_header_float_h=3D${ac_cv_header_float_h=3Dyes}
| ac_cv_header_fstab_h=3D${ac_cv_header_fstab_h=3Dyes}
| ac_cv_header_ftw_h=3D${ac_cv_header_ftw_h=3Dyes}
| ac_cv_header_getopt_h=3D${ac_cv_header_getopt_h=3Dyes}
| ac_cv_header_glob_h=3D${ac_cv_header_glob_h=3Dyes}
| ac_cv_header_grp_h=3D${ac_cv_header_grp_h=3Dyes}
| ac_cv_header_iconv_h=3D${ac_cv_header_iconv_h=3Dyes}
| ac_cv_header_ifaddrs_h=3D${ac_cv_header_ifaddrs_h=3Dyes}
| ac_cv_header_inttypes_h=3D${ac_cv_header_inttypes_h=3Dyes}
| ac_cv_header_langinfo_h=3D${ac_cv_header_langinfo_h=3Dyes}
| ac_cv_header_lastlog_h=3D${ac_cv_header_lastlog_h=3Dyes}
| ac_cv_header_libgen_h=3D${ac_cv_header_libgen_h=3Dyes}
| ac_cv_header_libintl_h=3D${ac_cv_header_libintl_h=3Dyes}
| ac_cv_header_limits_h=3D${ac_cv_header_limits_h=3Dyes}
| ac_cv_header_linux_capability_h=3D${ac_cv_header_linux_capability_h=3Dyes=
}
| ac_cv_header_linux_fd_h=3D${ac_cv_header_linux_fd_h=3Dyes}
| ac_cv_header_linux_fs_h=3D${ac_cv_header_linux_fs_h=3Dyes}
| ac_cv_header_linux_hayesesp_h=3D${ac_cv_header_linux_hayesesp_h=3Dno}
| ac_cv_header_linux_hdreg_h=3D${ac_cv_header_linux_hdreg_h=3Dyes}
| ac_cv_header_linux_icmp_h=3D${ac_cv_header_linux_icmp_h=3Dyes}
| ac_cv_header_linux_in6_h=3D${ac_cv_header_linux_in6_h=3Dyes}
| ac_cv_header_linux_joystick_h=3D${ac_cv_header_linux_joystick_h=3Dyes}
| ac_cv_header_linux_ptrace_h=3D${ac_cv_header_linux_ptrace_h=3Dyes}
| ac_cv_header_linux_serial_h=3D${ac_cv_header_linux_serial_h=3Dyes}
| ac_cv_header_linux_sonypi_h=3D${ac_cv_header_linux_sonypi_h=3Dyes}
| ac_cv_header_linux_unistd_h=3D${ac_cv_header_linux_unistd_h=3Dyes}
| ac_cv_header_linux_utsname_h=3D${ac_cv_header_linux_utsname_h=3Dyes}
| ac_cv_header_linux_version_h=3D${ac_cv_header_linux_version_h=3Dyes}
| ac_cv_header_locale_h=3D${ac_cv_header_locale_h=3Dyes}
| ac_cv_header_malloc_h=3D${ac_cv_header_malloc_h=3Dyes}
| ac_cv_header_math_h=3D${ac_cv_header_math_h=3Dyes}
| ac_cv_header_mcheck_h=3D${ac_cv_header_mcheck_h=3Dyes}
| ac_cv_header_memory_h=3D${ac_cv_header_memory_h=3Dyes}
| ac_cv_header_mntent_h=3D${ac_cv_header_mntent_h=3Dyes}
| ac_cv_header_mqueue_h=3D${ac_cv_header_mqueue_h=3Dyes}
| ac_cv_header_net_if_h=3D${ac_cv_header_net_if_h=3Dyes}
| ac_cv_header_net_route_h=3D${ac_cv_header_net_route_h=3Dyes}
| ac_cv_header_netdb_h=3D${ac_cv_header_netdb_h=3Dyes}
| ac_cv_header_netinet_ether_h=3D${ac_cv_header_netinet_ether_h=3Dyes}
| ac_cv_header_netinet_in_h=3D${ac_cv_header_netinet_in_h=3Dyes}
| ac_cv_header_netinet_ip6_h=3D${ac_cv_header_netinet_ip6_h=3Dyes}
| ac_cv_header_netinet_ip_h=3D${ac_cv_header_netinet_ip_h=3Dyes}
| ac_cv_header_netinet_tcp_h=3D${ac_cv_header_netinet_tcp_h=3Dyes}
| ac_cv_header_netinet_udp_h=3D${ac_cv_header_netinet_udp_h=3Dyes}
| ac_cv_header_netipx_ipx_h=3D${ac_cv_header_netipx_ipx_h=3Dyes}
| ac_cv_header_paths_h=3D${ac_cv_header_paths_h=3Dyes}
| ac_cv_header_poll_h=3D${ac_cv_header_poll_h=3Dyes}
| ac_cv_header_pthread_h=3D${ac_cv_header_pthread_h=3Dyes}
| ac_cv_header_pty_h=3D${ac_cv_header_pty_h=3Dyes}
| ac_cv_header_pwd_h=3D${ac_cv_header_pwd_h=3Dyes}
| ac_cv_header_regex_h=3D${ac_cv_header_regex_h=3Dyes}
| ac_cv_header_resolv_h=3D${ac_cv_header_resolv_h=3Dyes}
| ac_cv_header_rpc_rpc_h=3D${ac_cv_header_rpc_rpc_h=3Dyes}
| ac_cv_header_rpc_types_h=3D${ac_cv_header_rpc_types_h=3Dyes}
| ac_cv_header_sched_h=3D${ac_cv_header_sched_h=3Dyes}
| ac_cv_header_scsi_scsi_h=3D${ac_cv_header_scsi_scsi_h=3Dyes}
| ac_cv_header_search_h=3D${ac_cv_header_search_h=3Dyes}
| ac_cv_header_semaphore_h=3D${ac_cv_header_semaphore_h=3Dyes}
| ac_cv_header_setjmp_h=3D${ac_cv_header_setjmp_h=3Dyes}
| ac_cv_header_sgtty_h=3D${ac_cv_header_sgtty_h=3Dyes}
| ac_cv_header_shadow_h=3D${ac_cv_header_shadow_h=3Dyes}
| ac_cv_header_signal_h=3D${ac_cv_header_signal_h=3Dyes}
| ac_cv_header_stdarg_h=3D${ac_cv_header_stdarg_h=3Dyes}
| ac_cv_header_stdbool_h=3D${ac_cv_header_stdbool_h=3Dyes}
| ac_cv_header_stdc=3D${ac_cv_header_stdc=3Dyes}
| ac_cv_header_stddef_h=3D${ac_cv_header_stddef_h=3Dyes}
| ac_cv_header_stdint_h=3D${ac_cv_header_stdint_h=3Dyes}
| ac_cv_header_stdio_h=3D${ac_cv_header_stdio_h=3Dyes}
| ac_cv_header_stdlib_h=3D${ac_cv_header_stdlib_h=3Dyes}
| ac_cv_header_string_h=3D${ac_cv_header_string_h=3Dyes}
| ac_cv_header_strings_h=3D${ac_cv_header_strings_h=3Dyes}
| ac_cv_header_stropts_h=3D${ac_cv_header_stropts_h=3Dyes}
| ac_cv_header_sys_bitypes_h=3D${ac_cv_header_sys_bitypes_h=3Dyes}
| ac_cv_header_sys_cdefs_h=3D${ac_cv_header_sys_cdefs_h=3Dyes}
| ac_cv_header_sys_dir_h=3D${ac_cv_header_sys_dir_h=3Dyes}
| ac_cv_header_sys_epoll_h=3D${ac_cv_header_sys_epoll_h=3Dyes}
| ac_cv_header_sys_fcntl_h=3D${ac_cv_header_sys_fcntl_h=3Dyes}
| ac_cv_header_sys_file_h=3D${ac_cv_header_sys_file_h=3Dyes}
| ac_cv_header_sys_fsuid_h=3D${ac_cv_header_sys_fsuid_h=3Dyes}
| ac_cv_header_sys_ioctl_h=3D${ac_cv_header_sys_ioctl_h=3Dyes}
| ac_cv_header_sys_ipc_h=3D${ac_cv_header_sys_ipc_h=3Dyes}
| ac_cv_header_sys_mman_h=3D${ac_cv_header_sys_mman_h=3Dyes}
| ac_cv_header_sys_mount_h=3D${ac_cv_header_sys_mount_h=3Dyes}
| ac_cv_header_sys_mtio_h=3D${ac_cv_header_sys_mtio_h=3Dyes}
| ac_cv_header_sys_param_h=3D${ac_cv_header_sys_param_h=3Dyes}
| ac_cv_header_sys_poll_h=3D${ac_cv_header_sys_poll_h=3Dyes}
| ac_cv_header_sys_prctl_h=3D${ac_cv_header_sys_prctl_h=3Dyes}
| ac_cv_header_sys_ptrace_h=3D${ac_cv_header_sys_ptrace_h=3Dyes}
| ac_cv_header_sys_queue_h=3D${ac_cv_header_sys_queue_h=3Dyes}
| ac_cv_header_sys_reg_h=3D${ac_cv_header_sys_reg_h=3Dyes}
| ac_cv_header_sys_resource_h=3D${ac_cv_header_sys_resource_h=3Dyes}
| ac_cv_header_sys_select_h=3D${ac_cv_header_sys_select_h=3Dyes}
| ac_cv_header_sys_sem_h=3D${ac_cv_header_sys_sem_h=3Dyes}
| ac_cv_header_sys_shm_h=3D${ac_cv_header_sys_shm_h=3Dyes}
| ac_cv_header_sys_signal_h=3D${ac_cv_header_sys_signal_h=3Dyes}
| ac_cv_header_sys_socket_h=3D${ac_cv_header_sys_socket_h=3Dyes}
| ac_cv_header_sys_socketvar_h=3D${ac_cv_header_sys_socketvar_h=3Dyes}
| ac_cv_header_sys_soundcard_h=3D${ac_cv_header_sys_soundcard_h=3Dyes}
| ac_cv_header_sys_stat_h=3D${ac_cv_header_sys_stat_h=3Dyes}
| ac_cv_header_sys_statfs_h=3D${ac_cv_header_sys_statfs_h=3Dyes}
| ac_cv_header_sys_statvfs_h=3D${ac_cv_header_sys_statvfs_h=3Dyes}
| ac_cv_header_sys_stropts_h=3D${ac_cv_header_sys_stropts_h=3Dyes}
| ac_cv_header_sys_swap_h=3D${ac_cv_header_sys_swap_h=3Dyes}
| ac_cv_header_sys_sysctl_h=3D${ac_cv_header_sys_sysctl_h=3Dyes}
| ac_cv_header_sys_sysinfo_h=3D${ac_cv_header_sys_sysinfo_h=3Dyes}
| ac_cv_header_sys_sysmacros_h=3D${ac_cv_header_sys_sysmacros_h=3Dyes}
| ac_cv_header_sys_termios_h=3D${ac_cv_header_sys_termios_h=3Dyes}
| ac_cv_header_sys_time_h=3D${ac_cv_header_sys_time_h=3Dyes}
| ac_cv_header_sys_timeb_h=3D${ac_cv_header_sys_timeb_h=3Dyes}
| ac_cv_header_sys_times_h=3D${ac_cv_header_sys_times_h=3Dyes}
| ac_cv_header_sys_timex_h=3D${ac_cv_header_sys_timex_h=3Dyes}
| ac_cv_header_sys_types_h=3D${ac_cv_header_sys_types_h=3Dyes}
| ac_cv_header_sys_uio_h=3D${ac_cv_header_sys_uio_h=3Dyes}
| ac_cv_header_sys_un_h=3D${ac_cv_header_sys_un_h=3Dyes}
| ac_cv_header_sys_unistd_h=3D${ac_cv_header_sys_unistd_h=3Dyes}
| ac_cv_header_sys_user_h=3D${ac_cv_header_sys_user_h=3Dyes}
| ac_cv_header_sys_utsname_h=3D${ac_cv_header_sys_utsname_h=3Dyes}
| ac_cv_header_sys_vfs_h=3D${ac_cv_header_sys_vfs_h=3Dyes}
| ac_cv_header_sys_wait_h=3D${ac_cv_header_sys_wait_h=3Dyes}
| ac_cv_header_sysexits_h=3D${ac_cv_header_sysexits_h=3Dyes}
| ac_cv_header_syslog_h=3D${ac_cv_header_syslog_h=3Dyes}
| ac_cv_header_termio_h=3D${ac_cv_header_termio_h=3Dyes}
| ac_cv_header_termios_h=3D${ac_cv_header_termios_h=3Dyes}
| ac_cv_header_time_h=3D${ac_cv_header_time_h=3Dyes}
| ac_cv_header_ttyent_h=3D${ac_cv_header_ttyent_h=3Dyes}
| ac_cv_header_ulimit_h=3D${ac_cv_header_ulimit_h=3Dyes}
| ac_cv_header_unistd_h=3D${ac_cv_header_unistd_h=3Dyes}
| ac_cv_header_ustat_h=3D${ac_cv_header_ustat_h=3Dyes}
| ac_cv_header_utime_h=3D${ac_cv_header_utime_h=3Dyes}
| ac_cv_header_utmp_h=3D${ac_cv_header_utmp_h=3Dyes}
| ac_cv_header_utmpx_h=3D${ac_cv_header_utmpx_h=3Dyes}
| ac_cv_header_values_h=3D${ac_cv_header_values_h=3Dyes}
| ac_cv_header_wchar_h=3D${ac_cv_header_wchar_h=3Dyes}
| ac_cv_header_wctype_h=3D${ac_cv_header_wctype_h=3Dyes}
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D12}
| ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_long_long_int=3D${ac_cv_sizeof_long_long_int=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
| ac_cv_sizeof_signed_char=3D${ac_cv_sizeof_signed_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_unsigned_long_int=3D${ac_cv_sizeof_unsigned_long_int=3D4}
| ac_cv_sizeof_unsigned_long_long_int=3D${ac_cv_sizeof_unsigned_long_long_i=
nt=3D8}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_unsigned_short_int=3D${ac_cv_sizeof_unsigned_short_int=3D2}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
configure:3482: checking for a BSD-compatible install
configure:3550: result: /usr/bin/install -c
configure:3561: checking whether build environment is sane
configure:3611: result: yes
configure:3660: checking for i586-poky-linux-strip
configure:3687: result: i586-poky-linux-strip
configure:3752: checking for a thread-safe mkdir -p
configure:3791: result: /bin/mkdir -p
configure:3804: checking for gawk
configure:3820: found /usr/bin/gawk
configure:3831: result: gawk
configure:3842: checking whether make sets $(MAKE)
configure:3864: result: yes
configure:3945: checking whether to enable maintainer-specific portions of =
Makefiles
configure:3954: result: no
configure:3992: checking for style of include used by make
configure:4020: result: GNU
configure:4050: checking for i586-poky-linux-gcc
configure:4077: result: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home=
/kyu3/sdb/test/tmp/sysroots/qemux86
configure:4346: checking for C compiler version
configure:4355: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 --version >&5
i586-poky-linux-gcc (GCC) 4.6.0
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:4366: $? =3D 0
configure:4355: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -v >&5
Using built-in specs.
COLLECT_GCC=3Di586-poky-linux-gcc
COLLECT_LTO_WRAPPER=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/lib=
exec/i586-poky-linux/gcc/i586-poky-linux/4.6.0/lto-wrapper
Target: i586-poky-linux
Configured with: /home/kyu3/sdb/test/tmp/work/i586-poky-linux/gcc-cross-4.6=
.0-r2/gcc-4.6.0/configure --build=3Dx86_64-linux --host=3Dx86_64-linux --ta=
rget=3Di586-poky-linux --prefix=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-l=
inux/usr --exec_prefix=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr =
--bindir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-=
linux --sbindir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/i58=
6-poky-linux --libexecdir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/u=
sr/libexec/i586-poky-linux --datadir=3D/home/kyu3/sdb/test/tmp/sysroots/x86=
_64-linux/usr/share --sysconfdir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-=
linux/etc --sharedstatedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/=
com --localstatedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/var --l=
ibdir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-lin=
ux --includedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/include=
 --oldincludedir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/includ=
e --infodir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/share/info =
--mandir=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/share/man --di=
sable-silent-rules --with-libtool-sysroot=3D/home/kyu3/sdb/test/tmp/sysroot=
s/x86_64-linux --with-gnu-ld --enable-shared --enable-languages=3Dc,c++ --e=
nable-threads=3Dposix --disable-multilib --enable-c99 --enable-long-long --=
enable-symvers=3Dgnu --enable-libstdcxx-pch --program-prefix=3Di586-poky-li=
nux- --enable-target-optspace --enable-lto --enable-libssp --disable-bootst=
rap --disable-libgomp --disable-libmudflap --enable-cheaders=3Dc_global --w=
ith-local-prefix=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr --with-gxx-=
include-dir=3D/usr/include/c++ --with-sysroot=3D/home/kyu3/sdb/test/tmp/sys=
roots/qemux86 --with-build-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux=
86 --enable-poison-system-directories --disable-libunwind-exceptions --with=
-mpfr=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr --with-system-zli=
b --enable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.6.0 (GCC)=20
configure:4366: $? =3D 0
configure:4355: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -V >&5
i586-poky-linux-gcc: error: unrecognized option '-V'
i586-poky-linux-gcc: fatal error: no input files
compilation terminated.
configure:4366: $? =3D 1
configure:4355: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -qversion >&5
i586-poky-linux-gcc: error: unrecognized option '-qversion'
i586-poky-linux-gcc: fatal error: no input files
compilation terminated.
configure:4366: $? =3D 1
configure:4386: checking whether the C compiler works
configure:4408: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -O2 -pipe -g -feliminate-unused-debug-types  -W=
l,-O1  -Wl,--as-needed conftest.c  >&5
configure:4412: $? =3D 0
configure:4461: result: yes
configure:4464: checking for C compiler default output file name
configure:4466: result: a.out
configure:4472: checking for suffix of executables
configure:4479: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -o conftest -O2 -pipe -g -feliminate-unused-deb=
ug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:4483: $? =3D 0
configure:4505: result:=20
configure:4527: checking whether we are cross compiling
configure:4565: result: yes
configure:4570: checking for suffix of object files
configure:4592: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -c -O2 -pipe -g -feliminate-unused-debug-types =
 conftest.c >&5
configure:4596: $? =3D 0
configure:4617: result: o
configure:4621: checking whether we are using the GNU C compiler
configure:4640: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -c -O2 -pipe -g -feliminate-unused-debug-types =
 conftest.c >&5
configure:4640: $? =3D 0
configure:4649: result: yes
configure:4658: checking whether i586-poky-linux-gcc -march=3Di586 --sysroo=
t=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 accepts -g
configure:4678: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -c -g  conftest.c >&5
configure:4678: $? =3D 0
configure:4719: result: yes
configure:4736: checking for i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 option to accept ISO C89
configure:4800: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86  -c -O2 -pipe -g -feliminate-unused-debug-types=
  conftest.c >&5
configure:4800: $? =3D 0
configure:4813: result: none needed
configure:4835: checking dependency style of i586-poky-linux-gcc -march=3Di=
586 --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86
configure:4945: result: gcc3
configure:4960: checking for i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 option to accept ISO C99
configure:5109: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86  -c -O2 -pipe -g -feliminate-unused-debug-types=
  conftest.c >&5
conftest.c:61:29: error: expected ';', ',' or ')' before 'text'
conftest.c: In function 'main':
conftest.c:115:18: error: expected '=3D', ',', ';', 'asm' or '__attribute__=
' before 'newvar'
conftest.c:115:18: error: 'newvar' undeclared (first use in this function)
conftest.c:115:18: note: each undeclared identifier is reported only once f=
or each function it appears in
conftest.c:125:3: error: 'for' loop initial declarations are only allowed i=
n C99 mode
conftest.c:125:3: note: use option -std=3Dc99 or -std=3Dgnu99 to compile yo=
ur code
configure:5109: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| /* end confdefs.h.  */
| #include <stdarg.h>
| #include <stdbool.h>
| #include <stdlib.h>
| #include <wchar.h>
| #include <stdio.h>
|=20
| // Check varargs macros.  These examples are taken from C99 6.10.3.5.
| #define debug(...) fprintf (stderr, __VA_ARGS__)
| #define showlist(...) puts (#__VA_ARGS__)
| #define report(test,...) ((test) ? puts (#test) : printf (__VA_ARGS__))
| static void
| test_varargs_macros (void)
| {
|   int x =3D 1234;
|   int y =3D 5678;
|   debug ("Flag");
|   debug ("X =3D %d\n", x);
|   showlist (The first, second, and third items.);
|   report (x>y, "x is %d but y is %d", x, y);
| }
|=20
| // Check long long types.
| #define BIG64 18446744073709551615ull
| #define BIG32 4294967295ul
| #define BIG_OK (BIG64 / BIG32 =3D=3D 4294967297ull && BIG64 % BIG32 =3D=
=3D 0)
| #if !BIG_OK
|   your preprocessor is broken;
| #endif
| #if BIG_OK
| #else
|   your preprocessor is broken;
| #endif
| static long long int bignum =3D -9223372036854775807LL;
| static unsigned long long int ubignum =3D BIG64;
|=20
| struct incomplete_array
| {
|   int datasize;
|   double data[];
| };
|=20
| struct named_init {
|   int number;
|   const wchar_t *name;
|   double average;
| };
|=20
| typedef const char *ccp;
|=20
| static inline int
| test_restrict (ccp restrict text)
| {
|   // See if C++-style comments work.
|   // Iterate through items via the restricted pointer.
|   // Also check for declarations in for loops.
|   for (unsigned int i =3D 0; *(text+i) !=3D '\0'; ++i)
|     continue;
|   return 0;
| }
|=20
| // Check varargs and va_copy.
| static void
| test_varargs (const char *format, ...)
| {
|   va_list args;
|   va_start (args, format);
|   va_list args_copy;
|   va_copy (args_copy, args);
|=20
|   const char *str;
|   int number;
|   float fnumber;
|=20
|   while (*format)
|     {
|       switch (*format++)
| 	{
| 	case 's': // string
| 	  str =3D va_arg (args_copy, const char *);
| 	  break;
| 	case 'd': // int
| 	  number =3D va_arg (args_copy, int);
| 	  break;
| 	case 'f': // float
| 	  fnumber =3D va_arg (args_copy, double);
| 	  break;
| 	default:
| 	  break;
| 	}
|     }
|   va_end (args_copy);
|   va_end (args);
| }
|=20
| int
| main ()
| {
|=20
|   // Check bool.
|   _Bool success =3D false;
|=20
|   // Check restrict.
|   if (test_restrict ("String literal") =3D=3D 0)
|     success =3D true;
|   char *restrict newvar =3D "Another string";
|=20
|   // Check varargs.
|   test_varargs ("s, d' f .", "string", 65, 34.234);
|   test_varargs_macros ();
|=20
|   // Check flexible array members.
|   struct incomplete_array *ia =3D
|     malloc (sizeof (struct incomplete_array) + (sizeof (double) * 10));
|   ia->datasize =3D 10;
|   for (int i =3D 0; i < ia->datasize; ++i)
|     ia->data[i] =3D i * 1.234;
|=20
|   // Check named initializers.
|   struct named_init ni =3D {
|     .number =3D 34,
|     .name =3D L"Test wide string",
|     .average =3D 543.34343,
|   };
|=20
|   ni.number =3D 58;
|=20
|   int dynamic_array[ni.number];
|   dynamic_array[ni.number - 1] =3D 543;
|=20
|   // work around unused variable warnings
|   return (!success || bignum =3D=3D 0LL || ubignum =3D=3D 0uLL || newvar[=
0] =3D=3D 'x'
| 	  || dynamic_array[ni.number - 1] !=3D 543);
|=20
|   ;
|   return 0;
| }
configure:5109: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unused=
-debug-types  conftest.c >&5
configure:5109: $? =3D 0
configure:5129: result: -std=3Dgnu99
configure:5143: checking how to run the C preprocessor
configure:5213: result: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/t=
est/tmp/sysroots/qemux86
configure:5233: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp/=
sysroots/qemux86  conftest.c
configure:5233: $? =3D 0
configure:5247: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp/=
sysroots/qemux86  conftest.c
conftest.c:11:28: fatal error: ac_nonexistent.h: No such file or directory
compilation terminated.
configure:5247: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:5276: checking for grep that handles long lines and -e
configure:5334: result: /bin/grep
configure:5339: checking for egrep
configure:5401: result: /bin/grep -E
configure:5406: checking for ANSI C header files
configure:5510: result: yes
configure:5523: checking for sys/types.h
configure:5523: result: yes
configure:5523: checking for sys/stat.h
configure:5523: result: yes
configure:5523: checking for stdlib.h
configure:5523: result: yes
configure:5523: checking for string.h
configure:5523: result: yes
configure:5523: checking for memory.h
configure:5523: result: yes
configure:5523: checking for strings.h
configure:5523: result: yes
configure:5523: checking for inttypes.h
configure:5523: result: yes
configure:5523: checking for stdint.h
configure:5523: result: yes
configure:5523: checking for unistd.h
configure:5523: result: yes
configure:5546: checking for i586-poky-linux-pkg-config
configure:5579: result: no
configure:5589: checking for pkg-config
configure:5607: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin=
/pkg-config
configure:5619: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/b=
in/pkg-config
configure:5631: WARNING: using cross tools not prefixed with host triplet
configure:5644: checking pkg-config is at least version 0.9.0
configure:5647: result: yes
configure:5659: checking build system type
configure:5673: result: x86_64-pc-linux-gnu
configure:5693: checking host system type
configure:5706: result: i586-poky-linux-gnu
configure:5726: checking for a sed that does not truncate output
configure:5790: result: /bin/sed
configure:6020: checking for doxygen
configure:6053: result: no
configure:6059: WARNING: doxygen not found - documentation targets will be =
skipped
configure:6156: checking for X.Org SGML entities >=3D 1.5
configure:6160: $PKG_CONFIG --exists --print-errors "xorg-sgml-doctools >=
=3D 1.5"
Package xorg-sgml-doctools was not found in the pkg-config search path.
Perhaps you should add the directory containing `xorg-sgml-doctools.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xorg-sgml-doctools' found
configure:6163: $? =3D 1
configure:6179: result: no
configure:6234: checking dependency style of i586-poky-linux-gcc -march=3Di=
586 --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99
configure:6342: result: gcc3
configure:6357: checking whether ln -s works
configure:6361: result: yes
configure:6748: checking how to print strings
configure:6775: result: printf
configure:6796: checking for a sed that does not truncate output
configure:6860: result: /bin/sed
configure:6878: checking for fgrep
configure:6940: result: /bin/grep -F
configure:6975: checking for ld used by i586-poky-linux-gcc -march=3Di586 -=
-sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99
configure:7042: result: i586-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/=
tmp/sysroots/qemux86
configure:7049: checking if the linker (i586-poky-linux-ld --sysroot=3D/hom=
e/kyu3/sdb/test/tmp/sysroots/qemux86) is GNU ld
configure:7064: result: yes
configure:7076: checking for BSD- or MS-compatible name lister (nm)
configure:7125: result: i586-poky-linux-nm
configure:7255: checking the name lister (i586-poky-linux-nm) interface
configure:7262: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unused=
-debug-types  conftest.c >&5
configure:7265: i586-poky-linux-nm "conftest.o"
configure:7268: output
00000000 B some_variable
configure:7275: result: BSD nm
configure:7279: checking the maximum length of command line arguments
configure:7404: result: 1572864
configure:7421: checking whether the shell understands some XSI constructs
configure:7431: result: yes
configure:7435: checking whether the shell understands "+=3D"
configure:7441: result: yes
configure:7476: checking how to convert x86_64-pc-linux-gnu file names to i=
586-poky-linux-gnu format
configure:7516: result: func_convert_file_noop
configure:7523: checking how to convert x86_64-pc-linux-gnu file names to t=
oolchain format
configure:7543: result: func_convert_file_noop
configure:7550: checking for i586-poky-linux-ld --sysroot=3D/home/kyu3/sdb/=
test/tmp/sysroots/qemux86 option to reload object files
configure:7557: result: -r
configure:7591: checking for i586-poky-linux-objdump
configure:7618: result: i586-poky-linux-objdump
configure:7687: checking how to recognize dependent libraries
configure:7889: result: pass_all
configure:7934: checking for i586-poky-linux-dlltool
configure:7961: result: dlltool
configure:8031: checking how to associate runtime and link libraries
configure:8058: result: printf %s\n
configure:8074: checking for i586-poky-linux-ar
configure:8101: result: i586-poky-linux-ar
configure:8182: checking for archiver @FILE support
configure:8199: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unused=
-debug-types  conftest.c >&5
configure:8199: $? =3D 0
configure:8202: i586-poky-linux-ar cru libconftest.a @conftest.lst >&5
configure:8205: $? =3D 0
configure:8210: i586-poky-linux-ar cru libconftest.a @conftest.lst >&5
i586-poky-linux-ar: conftest.o: No such file or directory
configure:8213: $? =3D 1
configure:8225: result: @
configure:8243: checking for i586-poky-linux-strip
configure:8270: result: i586-poky-linux-strip
configure:8342: checking for i586-poky-linux-ranlib
configure:8369: result: i586-poky-linux-ranlib
configure:8511: checking command to parse i586-poky-linux-nm output from i5=
86-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sdb/test/tmp/sysroot=
s/qemux86 -std=3Dgnu99 object
configure:8630: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unused=
-debug-types  conftest.c >&5
configure:8633: $? =3D 0
configure:8637: i586-poky-linux-nm conftest.o \| sed -n -e 's/^.*[ ]\([ABCD=
GIRSTW][ABCDGIRSTW]*\)[ ][ ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | sed =
'/ __gnu_lto/d' \> conftest.nm
configure:8640: $? =3D 0
configure:8706: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sd=
b/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimina=
te-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c conftstm.o >&5
configure:8709: $? =3D 0
configure:8747: result: ok
configure:8784: checking for sysroot
configure:8814: result: /home/kyu3/sdb/test/tmp/sysroots/qemux86
configure:9017: checking for i586-poky-linux-mt
configure:9047: result: no
configure:9057: checking for mt
configure:9073: found /bin/mt
configure:9084: result: mt
configure:9107: checking if mt is a manifest tool
configure:9113: mt '-?'
mt: invalid option -- ?
configure:9121: result: no
configure:9750: checking for dlfcn.h
configure:9750: result: yes
configure:9906: checking for objdir
configure:9921: result: .libs
configure:10188: checking if i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 supports -fno-rtti -f=
no-exceptions
configure:10206: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  -fno-rtti -fno-exceptions conftest.c >&5
cc1: warning: command line option '-fno-rtti' is valid for C++/ObjC++ but n=
ot for C [enabled by default]
configure:10210: $? =3D 0
configure:10223: result: no
configure:10533: checking for i586-poky-linux-gcc -march=3Di586 --sysroot=
=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 option to produce =
PIC
configure:10540: result: -fPIC -DPIC
configure:10548: checking if i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 PIC flag -fPIC -DPIC =
works
configure:10566: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  -fPIC -DPIC -DPIC conftest.c >&5
configure:10570: $? =3D 0
configure:10583: result: yes
configure:10612: checking if i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 static flag -static w=
orks
configure:10640: result: yes
configure:10655: checking if i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 supports -c -o file.o
configure:10676: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  -o out/conftest2.o conftest.c >&5
configure:10680: $? =3D 0
configure:10702: result: yes
configure:10710: checking if i586-poky-linux-gcc -march=3Di586 --sysroot=3D=
/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 supports -c -o file.o
configure:10757: result: yes
configure:10790: checking whether the i586-poky-linux-gcc -march=3Di586 --s=
ysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86 -std=3Dgnu99 linker (i586=
-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86) suppor=
ts shared libraries
configure:11948: result: yes
configure:11985: checking whether -lc should be explicitly linked in
configure:11993: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:11996: $? =3D 0
configure:12011: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -shared  -fPIC -DPIC conftest.o  =
-v -Wl,-soname -Wl,conftest -o conftest 2\>\&1 \| /bin/grep  -lc  \>/dev/nu=
ll 2\>\&1
configure:12014: $? =3D 0
configure:12028: result: no
configure:12193: checking dynamic linker characteristics
configure:12707: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed -Wl,-rpath -Wl,/foo confte=
st.c  >&5
configure:12707: $? =3D 0
configure:12929: result: GNU/Linux ld.so
configure:13036: checking how to hardcode library paths into programs
configure:13061: result: immediate
configure:13601: checking whether stripping libraries is possible
configure:13606: result: yes
configure:13641: checking if libtool supports shared libraries
configure:13643: result: yes
configure:13646: checking whether to build shared libraries
configure:13667: result: yes
configure:13670: checking whether to build static libraries
configure:13674: result: no
configure:13709: checking whether make sets $(MAKE)
configure:13731: result: yes
configure:13750: checking for i586-poky-linux-pkg-config
configure:13780: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/=
bin/pkg-config
configure:13848: checking pkg-config is at least version 0.9.0
configure:13851: result: yes
configure:13863: checking for flex
configure:13879: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/flex
configure:13890: result: flex
configure:13927: flex conftest.l
configure:13931: $? =3D 0
configure:13933: checking lex output file root
configure:13947: result: lex.yy
configure:13952: checking lex library
configure:13966: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c   >&5
/tmp/ccoVD2wA.o: In function `input':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/lex.yy.c:1168: undefined reference to `yywrap'
/tmp/ccoVD2wA.o: In function `yylex':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/lex.yy.c:867: undefined reference to `yywrap'
/tmp/ccoVD2wA.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.l:17: undefined reference to `yywrap'
collect2: ld returned 1 exit status
configure:13966: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
|=20
| #line 3 "lex.yy.c"
|=20
| #define  YY_INT_ALIGNED short int
|=20
| /* A lexical scanner generated by flex */
|=20
| #define FLEX_SCANNER
| #define YY_FLEX_MAJOR_VERSION 2
| #define YY_FLEX_MINOR_VERSION 5
| #define YY_FLEX_SUBMINOR_VERSION 35
| #if YY_FLEX_SUBMINOR_VERSION > 0
| #define FLEX_BETA
| #endif
|=20
| /* First, we deal with  platform-specific or compiler-specific issues. */
|=20
| /* begin standard C headers. */
| #include <stdio.h>
| #include <string.h>
| #include <errno.h>
| #include <stdlib.h>
|=20
| /* end standard C headers. */
|=20
| /* flex integer type definitions */
|=20
| #ifndef FLEXINT_H
| #define FLEXINT_H
|=20
| /* C99 systems have <inttypes.h>. Non-C99 systems may or may not. */
|=20
| #if defined (__STDC_VERSION__) && __STDC_VERSION__ >=3D 199901L
|=20
| /* C99 says to define __STDC_LIMIT_MACROS before including stdint.h,
|  * if you want the limit (max/min) macros for int types.=20
|  */
| #ifndef __STDC_LIMIT_MACROS
| #define __STDC_LIMIT_MACROS 1
| #endif
|=20
| #include <inttypes.h>
| typedef int8_t flex_int8_t;
| typedef uint8_t flex_uint8_t;
| typedef int16_t flex_int16_t;
| typedef uint16_t flex_uint16_t;
| typedef int32_t flex_int32_t;
| typedef uint32_t flex_uint32_t;
| #else
| typedef signed char flex_int8_t;
| typedef short int flex_int16_t;
| typedef int flex_int32_t;
| typedef unsigned char flex_uint8_t;=20
| typedef unsigned short int flex_uint16_t;
| typedef unsigned int flex_uint32_t;
| #endif /* ! C99 */
|=20
| /* Limits of integral types. */
| #ifndef INT8_MIN
| #define INT8_MIN               (-128)
| #endif
| #ifndef INT16_MIN
| #define INT16_MIN              (-32767-1)
| #endif
| #ifndef INT32_MIN
| #define INT32_MIN              (-2147483647-1)
| #endif
| #ifndef INT8_MAX
| #define INT8_MAX               (127)
| #endif
| #ifndef INT16_MAX
| #define INT16_MAX              (32767)
| #endif
| #ifndef INT32_MAX
| #define INT32_MAX              (2147483647)
| #endif
| #ifndef UINT8_MAX
| #define UINT8_MAX              (255U)
| #endif
| #ifndef UINT16_MAX
| #define UINT16_MAX             (65535U)
| #endif
| #ifndef UINT32_MAX
| #define UINT32_MAX             (4294967295U)
| #endif
|=20
| #endif /* ! FLEXINT_H */
|=20
| #ifdef __cplusplus
|=20
| /* The "const" storage-class-modifier is valid. */
| #define YY_USE_CONST
|=20
| #else	/* ! __cplusplus */
|=20
| /* C99 requires __STDC__ to be defined as 1. */
| #if defined (__STDC__)
|=20
| #define YY_USE_CONST
|=20
| #endif	/* defined (__STDC__) */
| #endif	/* ! __cplusplus */
|=20
| #ifdef YY_USE_CONST
| #define yyconst const
| #else
| #define yyconst
| #endif
|=20
| /* Returned upon end-of-file. */
| #define YY_NULL 0
|=20
| /* Promotes a possibly negative, possibly signed char to an unsigned
|  * integer for use as an array index.  If the signed char is negative,
|  * we want to instead treat it as an 8-bit unsigned char, hence the
|  * double cast.
|  */
| #define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
|=20
| /* Enter a start condition.  This macro really ought to take a parameter,
|  * but we do it the disgusting crufty way forced on us by the ()-less
|  * definition of BEGIN.
|  */
| #define BEGIN (yy_start) =3D 1 + 2 *
|=20
| /* Translate the current start state into a value that can be later hande=
d
|  * to BEGIN to return to the state.  The YYSTATE alias is for lex
|  * compatibility.
|  */
| #define YY_START (((yy_start) - 1) / 2)
| #define YYSTATE YY_START
|=20
| /* Action number for EOF rule of a given start state. */
| #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
|=20
| /* Special action meaning "start processing a new file". */
| #define YY_NEW_FILE yyrestart(yyin  )
|=20
| #define YY_END_OF_BUFFER_CHAR 0
|=20
| /* Size of default input buffer. */
| #ifndef YY_BUF_SIZE
| #define YY_BUF_SIZE 16384
| #endif
|=20
| /* The state buf must be large enough to hold one state per character in =
the main buffer.
|  */
| #define YY_STATE_BUF_SIZE   ((YY_BUF_SIZE + 2) * sizeof(yy_state_type))
|=20
| #ifndef YY_TYPEDEF_YY_BUFFER_STATE
| #define YY_TYPEDEF_YY_BUFFER_STATE
| typedef struct yy_buffer_state *YY_BUFFER_STATE;
| #endif
|=20
| extern int yyleng;
|=20
| extern FILE *yyin, *yyout;
|=20
| #define EOB_ACT_CONTINUE_SCAN 0
| #define EOB_ACT_END_OF_FILE 1
| #define EOB_ACT_LAST_MATCH 2
|=20
|     #define YY_LESS_LINENO(n)
|    =20
| /* Return all but the first "n" matched characters back to the input stre=
am. */
| #define yyless(n) \
| 	do \
| 		{ \
| 		/* Undo effects of setting up yytext. */ \
|         int yyless_macro_arg =3D (n); \
|         YY_LESS_LINENO(yyless_macro_arg);\
| 		*yy_cp =3D (yy_hold_char); \
| 		YY_RESTORE_YY_MORE_OFFSET \
| 		(yy_c_buf_p) =3D yy_cp =3D yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
| 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
| 		} \
| 	while ( 0 )
|=20
| #define unput(c) yyunput( c, (yytext_ptr)  )
|=20
| #ifndef YY_TYPEDEF_YY_SIZE_T
| #define YY_TYPEDEF_YY_SIZE_T
| typedef size_t yy_size_t;
| #endif
|=20
| #ifndef YY_STRUCT_YY_BUFFER_STATE
| #define YY_STRUCT_YY_BUFFER_STATE
| struct yy_buffer_state
| 	{
| 	FILE *yy_input_file;
|=20
| 	char *yy_ch_buf;		/* input buffer */
| 	char *yy_buf_pos;		/* current position in input buffer */
|=20
| 	/* Size of input buffer in bytes, not including room for EOB
| 	 * characters.
| 	 */
| 	yy_size_t yy_buf_size;
|=20
| 	/* Number of characters read into yy_ch_buf, not including EOB
| 	 * characters.
| 	 */
| 	int yy_n_chars;
|=20
| 	/* Whether we "own" the buffer - i.e., we know we created it,
| 	 * and can realloc() it to grow it, and should free() it to
| 	 * delete it.
| 	 */
| 	int yy_is_our_buffer;
|=20
| 	/* Whether this is an "interactive" input source; if so, and
| 	 * if we're using stdio for input, then we want to use getc()
| 	 * instead of fread(), to make sure we stop fetching input after
| 	 * each newline.
| 	 */
| 	int yy_is_interactive;
|=20
| 	/* Whether we're considered to be at the beginning of a line.
| 	 * If so, '^' rules will be active on the next match, otherwise
| 	 * not.
| 	 */
| 	int yy_at_bol;
|=20
|     int yy_bs_lineno; /**< The line count. */
|     int yy_bs_column; /**< The column count. */
|    =20
| 	/* Whether to try to fill the input buffer when we reach the
| 	 * end of it.
| 	 */
| 	int yy_fill_buffer;
|=20
| 	int yy_buffer_status;
|=20
| #define YY_BUFFER_NEW 0
| #define YY_BUFFER_NORMAL 1
| 	/* When an EOF's been seen but there's still some text to process
| 	 * then we mark the buffer as YY_EOF_PENDING, to indicate that we
| 	 * shouldn't try reading from the input source any more.  We might
| 	 * still have a bunch of tokens to match, though, because of
| 	 * possible backing-up.
| 	 *
| 	 * When we actually see the EOF, we change the status to "new"
| 	 * (via yyrestart()), so that the user can continue scanning by
| 	 * just pointing yyin at a new input file.
| 	 */
| #define YY_BUFFER_EOF_PENDING 2
|=20
| 	};
| #endif /* !YY_STRUCT_YY_BUFFER_STATE */
|=20
| /* Stack of input buffers. */
| static size_t yy_buffer_stack_top =3D 0; /**< index of top of stack. */
| static size_t yy_buffer_stack_max =3D 0; /**< capacity of stack. */
| static YY_BUFFER_STATE * yy_buffer_stack =3D 0; /**< Stack as an array. *=
/
|=20
| /* We provide macros for accessing buffer states in case in the
|  * future we want to put the buffer states in a more general
|  * "scanner state".
|  *
|  * Returns the top of the stack, or NULL.
|  */
| #define YY_CURRENT_BUFFER ( (yy_buffer_stack) \
|                           ? (yy_buffer_stack)[(yy_buffer_stack_top)] \
|                           : NULL)
|=20
| /* Same as previous macro, but useful when we know that the buffer stack =
is not
|  * NULL or when we need an lvalue. For internal use only.
|  */
| #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
|=20
| /* yy_hold_char holds the character lost when yytext is formed. */
| static char yy_hold_char;
| static int yy_n_chars;		/* number of characters read into yy_ch_buf */
| int yyleng;
|=20
| /* Points to current character in buffer. */
| static char *yy_c_buf_p =3D (char *) 0;
| static int yy_init =3D 0;		/* whether we need to initialize */
| static int yy_start =3D 0;	/* start state number */
|=20
| /* Flag which is used to allow yywrap()'s to do buffer switches
|  * instead of setting up a fresh yyin.  A bit of a hack ...
|  */
| static int yy_did_buffer_switch_on_eof;
|=20
| void yyrestart (FILE *input_file  );
| void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
| YY_BUFFER_STATE yy_create_buffer (FILE *file,int size  );
| void yy_delete_buffer (YY_BUFFER_STATE b  );
| void yy_flush_buffer (YY_BUFFER_STATE b  );
| void yypush_buffer_state (YY_BUFFER_STATE new_buffer  );
| void yypop_buffer_state (void );
|=20
| static void yyensure_buffer_stack (void );
| static void yy_load_buffer_state (void );
| static void yy_init_buffer (YY_BUFFER_STATE b,FILE *file  );
|=20
| #define YY_FLUSH_BUFFER yy_flush_buffer(YY_CURRENT_BUFFER )
|=20
| YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
| YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
| YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,int len  );
|=20
| void *yyalloc (yy_size_t  );
| void *yyrealloc (void *,yy_size_t  );
| void yyfree (void *  );
|=20
| #define yy_new_buffer yy_create_buffer
|=20
| #define yy_set_interactive(is_interactive) \
| 	{ \
| 	if ( ! YY_CURRENT_BUFFER ){ \
|         yyensure_buffer_stack (); \
| 		YY_CURRENT_BUFFER_LVALUE =3D    \
|             yy_create_buffer(yyin,YY_BUF_SIZE ); \
| 	} \
| 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive =3D is_interactive; \
| 	}
|=20
| #define yy_set_bol(at_bol) \
| 	{ \
| 	if ( ! YY_CURRENT_BUFFER ){\
|         yyensure_buffer_stack (); \
| 		YY_CURRENT_BUFFER_LVALUE =3D    \
|             yy_create_buffer(yyin,YY_BUF_SIZE ); \
| 	} \
| 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol =3D at_bol; \
| 	}
|=20
| #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
|=20
| /* Begin user sect3 */
|=20
| typedef unsigned char YY_CHAR;
|=20
| FILE *yyin =3D (FILE *) 0, *yyout =3D (FILE *) 0;
|=20
| typedef int yy_state_type;
|=20
| extern int yylineno;
|=20
| int yylineno =3D 1;
|=20
| extern char *yytext;
| #define yytext_ptr yytext
|=20
| static yy_state_type yy_get_previous_state (void );
| static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
| static int yy_get_next_buffer (void );
| static void yy_fatal_error (yyconst char msg[]  );
|=20
| /* Done after the current pattern has been matched and before the
|  * corresponding action - sets up yytext.
|  */
| #define YY_DO_BEFORE_ACTION \
| 	(yytext_ptr) =3D yy_bp; \
| 	(yytext_ptr) -=3D (yy_more_len); \
| 	yyleng =3D (size_t) (yy_cp - (yytext_ptr)); \
| 	(yy_hold_char) =3D *yy_cp; \
| 	*yy_cp =3D '\0'; \
| 	(yy_c_buf_p) =3D yy_cp;
|=20
| #define YY_NUM_RULES 8
| #define YY_END_OF_BUFFER 9
| /* This struct is not used in this scanner,
|    but its presence is necessary. */
| struct yy_trans_info
| 	{
| 	flex_int32_t yy_verify;
| 	flex_int32_t yy_nxt;
| 	};
| static yyconst flex_int16_t yy_acclist[23] =3D
|     {   0,
|         9,    7,    8,    8,    1,    7,    8,    2,    7,    8,
|         3,    7,    8,    4,    7,    8,    5,    7,    8,    6,
|         7,    8
|     } ;
|=20
| static yyconst flex_int16_t yy_accept[14] =3D
|     {   0,
|         1,    1,    1,    2,    4,    5,    8,   11,   14,   17,
|        20,   23,   23
|     } ;
|=20
| static yyconst flex_int32_t yy_ec[256] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    3,    4,    5,    6,
|=20
|         7,    8,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|=20
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
|         1,    1,    1,    1,    1
|     } ;
|=20
| static yyconst flex_int32_t yy_meta[9] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1
|     } ;
|=20
| static yyconst flex_int16_t yy_base[13] =3D
|     {   0,
|         0,    0,    9,   10,   10,   10,   10,   10,   10,   10,
|        10,   10
|     } ;
|=20
| static yyconst flex_int16_t yy_def[13] =3D
|     {   0,
|        12,    1,   12,   12,   12,   12,   12,   12,   12,   12,
|        12,    0
|     } ;
|=20
| static yyconst flex_int16_t yy_nxt[19] =3D
|     {   0,
|         4,    5,    6,    7,    8,    9,   10,   11,   12,    3,
|        12,   12,   12,   12,   12,   12,   12,   12
|     } ;
|=20
| static yyconst flex_int16_t yy_chk[19] =3D
|     {   0,
|         1,    1,    1,    1,    1,    1,    1,    1,    3,   12,
|        12,   12,   12,   12,   12,   12,   12,   12
|     } ;
|=20
| extern int yy_flex_debug;
| int yy_flex_debug =3D 0;
|=20
| static yy_state_type *yy_state_buf=3D0, *yy_state_ptr=3D0;
| static char *yy_full_match;
| static int yy_lp;
| #define REJECT \
| { \
| *yy_cp =3D (yy_hold_char); /* undo effects of setting up yytext */ \
| yy_cp =3D (yy_full_match); /* restore poss. backed-over text */ \
| ++(yy_lp); \
| goto find_rule; \
| }
|=20
| static int yy_more_flag =3D 0;
| static int yy_more_len =3D 0;
| #define yymore() ((yy_more_flag) =3D 1)
| #define YY_MORE_ADJ (yy_more_len)
| #define YY_RESTORE_YY_MORE_OFFSET
| char *yytext;
| #line 1 "conftest.l"
| #line 468 "lex.yy.c"
|=20
| #define INITIAL 0
|=20
| #ifndef YY_NO_UNISTD_H
| /* Special case for "unistd.h", since it is non-ANSI. We include it way
|  * down here because we want the user's section 1 to have been scanned fi=
rst.
|  * The user has a chance to override it with an option.
|  */
| #include <unistd.h>
| #endif
|=20
| #ifndef YY_EXTRA_TYPE
| #define YY_EXTRA_TYPE void *
| #endif
|=20
| static int yy_init_globals (void );
|=20
| /* Accessor methods to globals.
|    These are made visible to non-reentrant scanners for convenience. */
|=20
| int yylex_destroy (void );
|=20
| int yyget_debug (void );
|=20
| void yyset_debug (int debug_flag  );
|=20
| YY_EXTRA_TYPE yyget_extra (void );
|=20
| void yyset_extra (YY_EXTRA_TYPE user_defined  );
|=20
| FILE *yyget_in (void );
|=20
| void yyset_in  (FILE * in_str  );
|=20
| FILE *yyget_out (void );
|=20
| void yyset_out  (FILE * out_str  );
|=20
| int yyget_leng (void );
|=20
| char *yyget_text (void );
|=20
| int yyget_lineno (void );
|=20
| void yyset_lineno (int line_number  );
|=20
| /* Macros after this point can all be overridden by user definitions in
|  * section 1.
|  */
|=20
| #ifndef YY_SKIP_YYWRAP
| #ifdef __cplusplus
| extern "C" int yywrap (void );
| #else
| extern int yywrap (void );
| #endif
| #endif
|=20
|     static void yyunput (int c,char *buf_ptr  );
|    =20
| #ifndef yytext_ptr
| static void yy_flex_strncpy (char *,yyconst char *,int );
| #endif
|=20
| #ifdef YY_NEED_STRLEN
| static int yy_flex_strlen (yyconst char * );
| #endif
|=20
| #ifndef YY_NO_INPUT
|=20
| #ifdef __cplusplus
| static int yyinput (void );
| #else
| static int input (void );
| #endif
|=20
| #endif
|=20
| /* Amount of stuff to slurp up with each read. */
| #ifndef YY_READ_BUF_SIZE
| #define YY_READ_BUF_SIZE 8192
| #endif
|=20
| /* Copy whatever the last rule matched to the standard output. */
| #ifndef ECHO
| /* This used to be an fputs(), but since the string might contain NUL's,
|  * we now use fwrite().
|  */
| #define ECHO fwrite( yytext, yyleng, 1, yyout )
| #endif
|=20
| /* Gets input and stuffs it into "buf".  number of characters read, or YY=
_NULL,
|  * is returned in "result".
|  */
| #ifndef YY_INPUT
| #define YY_INPUT(buf,result,max_size) \
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
| 		{ \
| 		int c =3D '*'; \
| 		int n; \
| 		for ( n =3D 0; n < max_size && \
| 			     (c =3D getc( yyin )) !=3D EOF && c !=3D '\n'; ++n ) \
| 			buf[n] =3D (char) c; \
| 		if ( c =3D=3D '\n' ) \
| 			buf[n++] =3D (char) c; \
| 		if ( c =3D=3D EOF && ferror( yyin ) ) \
| 			YY_FATAL_ERROR( "input in flex scanner failed" ); \
| 		result =3D n; \
| 		} \
| 	else \
| 		{ \
| 		errno=3D0; \
| 		while ( (result =3D fread(buf, 1, max_size, yyin))=3D=3D0 && ferror(yyi=
n)) \
| 			{ \
| 			if( errno !=3D EINTR) \
| 				{ \
| 				YY_FATAL_ERROR( "input in flex scanner failed" ); \
| 				break; \
| 				} \
| 			errno=3D0; \
| 			clearerr(yyin); \
| 			} \
| 		}\
| \
|=20
| #endif
|=20
| /* No semi-colon after return; correct usage is to write "yyterminate();"=
 -
|  * we don't want an extra ';' after the "return" because that will cause
|  * some compilers to complain about unreachable statements.
|  */
| #ifndef yyterminate
| #define yyterminate() return YY_NULL
| #endif
|=20
| /* Number of entries by which start-condition stack grows. */
| #ifndef YY_START_STACK_INCR
| #define YY_START_STACK_INCR 25
| #endif
|=20
| /* Report a fatal error. */
| #ifndef YY_FATAL_ERROR
| #define YY_FATAL_ERROR(msg) yy_fatal_error( msg )
| #endif
|=20
| /* end tables serialization structures and prototypes */
|=20
| /* Default declaration of generated scanner - a define so the user can
|  * easily add parameters.
|  */
| #ifndef YY_DECL
| #define YY_DECL_IS_OURS 1
|=20
| extern int yylex (void);
|=20
| #define YY_DECL int yylex (void)
| #endif /* !YY_DECL */
|=20
| /* Code executed at the beginning of each rule, after yytext and yyleng
|  * have been set up.
|  */
| #ifndef YY_USER_ACTION
| #define YY_USER_ACTION
| #endif
|=20
| /* Code executed at the end of each rule. */
| #ifndef YY_BREAK
| #define YY_BREAK break;
| #endif
|=20
| #define YY_RULE_SETUP \
| 	YY_USER_ACTION
|=20
| /** The main scanner function which does all the work.
|  */
| YY_DECL
| {
| 	register yy_state_type yy_current_state;
| 	register char *yy_cp, *yy_bp;
| 	register int yy_act;
|    =20
| #line 1 "conftest.l"
|=20
| #line 652 "lex.yy.c"
|=20
| 	if ( !(yy_init) )
| 		{
| 		(yy_init) =3D 1;
|=20
| #ifdef YY_USER_INIT
| 		YY_USER_INIT;
| #endif
|=20
|         /* Create the reject buffer large enough to save one state per al=
lowed character. */
|         if ( ! (yy_state_buf) )
|             (yy_state_buf) =3D (yy_state_type *)yyalloc(YY_STATE_BUF_SIZE=
  );
|             if ( ! (yy_state_buf) )
|                 YY_FATAL_ERROR( "out of dynamic memory in yylex()" );
|=20
| 		if ( ! (yy_start) )
| 			(yy_start) =3D 1;	/* first start state */
|=20
| 		if ( ! yyin )
| 			yyin =3D stdin;
|=20
| 		if ( ! yyout )
| 			yyout =3D stdout;
|=20
| 		if ( ! YY_CURRENT_BUFFER ) {
| 			yyensure_buffer_stack ();
| 			YY_CURRENT_BUFFER_LVALUE =3D
| 				yy_create_buffer(yyin,YY_BUF_SIZE );
| 		}
|=20
| 		yy_load_buffer_state( );
| 		}
|=20
| 	while ( 1 )		/* loops until end-of-file is reached */
| 		{
| 		(yy_more_len) =3D 0;
| 		if ( (yy_more_flag) )
| 			{
| 			(yy_more_len) =3D (yy_c_buf_p) - (yytext_ptr);
| 			(yy_more_flag) =3D 0;
| 			}
| 		yy_cp =3D (yy_c_buf_p);
|=20
| 		/* Support of yytext. */
| 		*yy_cp =3D (yy_hold_char);
|=20
| 		/* yy_bp points to the position in yy_ch_buf of the start of
| 		 * the current run.
| 		 */
| 		yy_bp =3D yy_cp;
|=20
| 		yy_current_state =3D (yy_start);
|=20
| 		(yy_state_ptr) =3D (yy_state_buf);
| 		*(yy_state_ptr)++ =3D yy_current_state;
|=20
| yy_match:
| 		do
| 			{
| 			register YY_CHAR yy_c =3D yy_ec[YY_SC_TO_UI(*yy_cp)];
| 			while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state=
 )
| 				{
| 				yy_current_state =3D (int) yy_def[yy_current_state];
| 				if ( yy_current_state >=3D 13 )
| 					yy_c =3D yy_meta[(unsigned int) yy_c];
| 				}
| 			yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int)=
 yy_c];
| 			*(yy_state_ptr)++ =3D yy_current_state;
| 			++yy_cp;
| 			}
| 		while ( yy_base[yy_current_state] !=3D 10 );
|=20
| yy_find_action:
| 		yy_current_state =3D *--(yy_state_ptr);
| 		(yy_lp) =3D yy_accept[yy_current_state];
| find_rule: /* we branch to this label when backing up */
| 		for ( ; ; ) /* until we find what rule we matched */
| 			{
| 			if ( (yy_lp) && (yy_lp) < yy_accept[yy_current_state + 1] )
| 				{
| 				yy_act =3D yy_acclist[(yy_lp)];
| 					{
| 					(yy_full_match) =3D yy_cp;
| 					break;
| 					}
| 				}
| 			--yy_cp;
| 			yy_current_state =3D *--(yy_state_ptr);
| 			(yy_lp) =3D yy_accept[yy_current_state];
| 			}
|=20
| 		YY_DO_BEFORE_ACTION;
|=20
| do_action:	/* This label is used only to access EOF actions. */
|=20
| 		switch ( yy_act )
| 	{ /* beginning of action switch */
| case 1:
| YY_RULE_SETUP
| #line 2 "conftest.l"
| { ECHO; }
| 	YY_BREAK
| case 2:
| YY_RULE_SETUP
| #line 3 "conftest.l"
| { REJECT; }
| 	YY_BREAK
| case 3:
| YY_RULE_SETUP
| #line 4 "conftest.l"
| { yymore (); }
| 	YY_BREAK
| case 4:
| YY_RULE_SETUP
| #line 5 "conftest.l"
| { yyless (1); }
| 	YY_BREAK
| case 5:
| YY_RULE_SETUP
| #line 6 "conftest.l"
| { yyless (input () !=3D 0); }
| 	YY_BREAK
| case 6:
| YY_RULE_SETUP
| #line 7 "conftest.l"
| { unput (yytext[0]); }
| 	YY_BREAK
| case 7:
| YY_RULE_SETUP
| #line 8 "conftest.l"
| { BEGIN INITIAL; }
| 	YY_BREAK
| case 8:
| YY_RULE_SETUP
| #line 9 "conftest.l"
| ECHO;
| 	YY_BREAK
| #line 790 "lex.yy.c"
| 			case YY_STATE_EOF(INITIAL):
| 				yyterminate();
|=20
| 	case YY_END_OF_BUFFER:
| 		{
| 		/* Amount of text matched not including the EOB char. */
| 		int yy_amount_of_matched_text =3D (int) (yy_cp - (yytext_ptr)) - 1;
|=20
| 		/* Undo the effects of YY_DO_BEFORE_ACTION. */
| 		*yy_cp =3D (yy_hold_char);
| 		YY_RESTORE_YY_MORE_OFFSET
|=20
| 		if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D=3D YY_BUFFER_NEW )
| 			{
| 			/* We're scanning a new file or input source.  It's
| 			 * possible that this happened because the user
| 			 * just pointed yyin at a new source and called
| 			 * yylex().  If so, then we have to assure
| 			 * consistency between YY_CURRENT_BUFFER and our
| 			 * globals.  Here is the right place to do so, because
| 			 * this is the first action (other than possibly a
| 			 * back-up) that will match for the new input source.
| 			 */
| 			(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
| 			YY_CURRENT_BUFFER_LVALUE->yy_input_file =3D yyin;
| 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D YY_BUFFER_NORMAL;
| 			}
|=20
| 		/* Note that here we test for yy_c_buf_p "<=3D" to the position
| 		 * of the first EOB in the buffer, since yy_c_buf_p will
| 		 * already have been incremented past the NUL character
| 		 * (since all states make transitions on EOB to the
| 		 * end-of-buffer state).  Contrast this with the test
| 		 * in input().
| 		 */
| 		if ( (yy_c_buf_p) <=3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars=
)] )
| 			{ /* This was really a NUL. */
| 			yy_state_type yy_next_state;
|=20
| 			(yy_c_buf_p) =3D (yytext_ptr) + yy_amount_of_matched_text;
|=20
| 			yy_current_state =3D yy_get_previous_state(  );
|=20
| 			/* Okay, we're now positioned to make the NUL
| 			 * transition.  We couldn't have
| 			 * yy_get_previous_state() go ahead and do it
| 			 * for us because it doesn't know how to deal
| 			 * with the possibility of jamming (and we don't
| 			 * want to build jamming into it because then it
| 			 * will run more slowly).
| 			 */
|=20
| 			yy_next_state =3D yy_try_NUL_trans( yy_current_state );
|=20
| 			yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
|=20
| 			if ( yy_next_state )
| 				{
| 				/* Consume the NUL. */
| 				yy_cp =3D ++(yy_c_buf_p);
| 				yy_current_state =3D yy_next_state;
| 				goto yy_match;
| 				}
|=20
| 			else
| 				{
| 				yy_cp =3D (yy_c_buf_p);
| 				goto yy_find_action;
| 				}
| 			}
|=20
| 		else switch ( yy_get_next_buffer(  ) )
| 			{
| 			case EOB_ACT_END_OF_FILE:
| 				{
| 				(yy_did_buffer_switch_on_eof) =3D 0;
|=20
| 				if ( yywrap( ) )
| 					{
| 					/* Note: because we've taken care in
| 					 * yy_get_next_buffer() to have set up
| 					 * yytext, we can now set up
| 					 * yy_c_buf_p so that if some total
| 					 * hoser (like flex itself) wants to
| 					 * call the scanner after we return the
| 					 * YY_NULL, it'll still work - another
| 					 * YY_NULL will get returned.
| 					 */
| 					(yy_c_buf_p) =3D (yytext_ptr) + YY_MORE_ADJ;
|=20
| 					yy_act =3D YY_STATE_EOF(YY_START);
| 					goto do_action;
| 					}
|=20
| 				else
| 					{
| 					if ( ! (yy_did_buffer_switch_on_eof) )
| 						YY_NEW_FILE;
| 					}
| 				break;
| 				}
|=20
| 			case EOB_ACT_CONTINUE_SCAN:
| 				(yy_c_buf_p) =3D
| 					(yytext_ptr) + yy_amount_of_matched_text;
|=20
| 				yy_current_state =3D yy_get_previous_state(  );
|=20
| 				yy_cp =3D (yy_c_buf_p);
| 				yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
| 				goto yy_match;
|=20
| 			case EOB_ACT_LAST_MATCH:
| 				(yy_c_buf_p) =3D
| 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)];
|=20
| 				yy_current_state =3D yy_get_previous_state(  );
|=20
| 				yy_cp =3D (yy_c_buf_p);
| 				yy_bp =3D (yytext_ptr) + YY_MORE_ADJ;
| 				goto yy_find_action;
| 			}
| 		break;
| 		}
|=20
| 	default:
| 		YY_FATAL_ERROR(
| 			"fatal flex scanner internal error--no action found" );
| 	} /* end of action switch */
| 		} /* end of scanning one token */
| } /* end of yylex */
|=20
| /* yy_get_next_buffer - try to read in a new buffer
|  *
|  * Returns a code representing an action:
|  *	EOB_ACT_LAST_MATCH -
|  *	EOB_ACT_CONTINUE_SCAN - continue scanning from current position
|  *	EOB_ACT_END_OF_FILE - end of file
|  */
| static int yy_get_next_buffer (void)
| {
|     	register char *dest =3D YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
| 	register char *source =3D (yytext_ptr);
| 	register int number_to_move, i;
| 	int ret_val;
|=20
| 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + =
1] )
| 		YY_FATAL_ERROR(
| 		"fatal flex scanner internal error--end of buffer missed" );
|=20
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_fill_buffer =3D=3D 0 )
| 		{ /* Don't try to fill the buffer, so this is an EOF. */
| 		if ( (yy_c_buf_p) - (yytext_ptr) - YY_MORE_ADJ =3D=3D 1 )
| 			{
| 			/* We matched a single character, the EOB, so
| 			 * treat this as a final EOF.
| 			 */
| 			return EOB_ACT_END_OF_FILE;
| 			}
|=20
| 		else
| 			{
| 			/* We matched some text prior to the EOB, first
| 			 * process it.
| 			 */
| 			return EOB_ACT_LAST_MATCH;
| 			}
| 		}
|=20
| 	/* Try to read more data. */
|=20
| 	/* First move last chars to start of buffer. */
| 	number_to_move =3D (int) ((yy_c_buf_p) - (yytext_ptr)) - 1;
|=20
| 	for ( i =3D 0; i < number_to_move; ++i )
| 		*(dest++) =3D *(source++);
|=20
| 	if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D=3D YY_BUFFER_EOF_PEN=
DING )
| 		/* don't do the read, it's not guaranteed to return an EOF,
| 		 * just force an EOF
| 		 */
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars) =3D 0;
|=20
| 	else
| 		{
| 			int num_to_read =3D
| 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
|=20
| 		while ( num_to_read <=3D 0 )
| 			{ /* Not enough room in the buffer - grow it. */
|=20
| 			YY_FATAL_ERROR(
| "input buffer overflow, can't enlarge buffer because scanner uses REJECT"=
 );
|=20
| 			}
|=20
| 		if ( num_to_read > YY_READ_BUF_SIZE )
| 			num_to_read =3D YY_READ_BUF_SIZE;
|=20
| 		/* Read in more data. */
| 		YY_INPUT( (&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move]),
| 			(yy_n_chars), (size_t) num_to_read );
|=20
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	if ( (yy_n_chars) =3D=3D 0 )
| 		{
| 		if ( number_to_move =3D=3D YY_MORE_ADJ )
| 			{
| 			ret_val =3D EOB_ACT_END_OF_FILE;
| 			yyrestart(yyin  );
| 			}
|=20
| 		else
| 			{
| 			ret_val =3D EOB_ACT_LAST_MATCH;
| 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =3D
| 				YY_BUFFER_EOF_PENDING;
| 			}
| 		}
|=20
| 	else
| 		ret_val =3D EOB_ACT_CONTINUE_SCAN;
|=20
| 	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVAL=
UE->yy_buf_size) {
| 		/* Extend the array by 50%, plus the number we really need. */
| 		yy_size_t new_size =3D (yy_n_chars) + number_to_move + ((yy_n_chars) >>=
 1);
| 		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf =3D (char *) yyrealloc((void *) YY_=
CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
| 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
| 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
| 	}
|=20
| 	(yy_n_chars) +=3D number_to_move;
| 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] =3D YY_END_OF_BUFFER_C=
HAR;
| 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] =3D YY_END_OF_BUFF=
ER_CHAR;
|=20
| 	(yytext_ptr) =3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[0];
|=20
| 	return ret_val;
| }
|=20
| /* yy_get_previous_state - get the state just before the EOB char was rea=
ched */
|=20
|     static yy_state_type yy_get_previous_state (void)
| {
| 	register yy_state_type yy_current_state;
| 	register char *yy_cp;
|    =20
| 	yy_current_state =3D (yy_start);
|=20
| 	(yy_state_ptr) =3D (yy_state_buf);
| 	*(yy_state_ptr)++ =3D yy_current_state;
|=20
| 	for ( yy_cp =3D (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_c=
p )
| 		{
| 		register YY_CHAR yy_c =3D (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
| 		while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state =
)
| 			{
| 			yy_current_state =3D (int) yy_def[yy_current_state];
| 			if ( yy_current_state >=3D 13 )
| 				yy_c =3D yy_meta[(unsigned int) yy_c];
| 			}
| 		yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int) =
yy_c];
| 		*(yy_state_ptr)++ =3D yy_current_state;
| 		}
|=20
| 	return yy_current_state;
| }
|=20
| /* yy_try_NUL_trans - try to make a transition on the NUL character
|  *
|  * synopsis
|  *	next_state =3D yy_try_NUL_trans( current_state );
|  */
|     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_stat=
e )
| {
| 	register int yy_is_jam;
|    =20
| 	register YY_CHAR yy_c =3D 1;
| 	while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state )
| 		{
| 		yy_current_state =3D (int) yy_def[yy_current_state];
| 		if ( yy_current_state >=3D 13 )
| 			yy_c =3D yy_meta[(unsigned int) yy_c];
| 		}
| 	yy_current_state =3D yy_nxt[yy_base[yy_current_state] + (unsigned int) y=
y_c];
| 	yy_is_jam =3D (yy_current_state =3D=3D 12);
| 	if ( ! yy_is_jam )
| 		*(yy_state_ptr)++ =3D yy_current_state;
|=20
| 	return yy_is_jam ? 0 : yy_current_state;
| }
|=20
|     static void yyunput (int c, register char * yy_bp )
| {
| 	register char *yy_cp;
|    =20
|     yy_cp =3D (yy_c_buf_p);
|=20
| 	/* undo effects of setting up yytext */
| 	*yy_cp =3D (yy_hold_char);
|=20
| 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
| 		{ /* need to shift things up to make room */
| 		/* +2 for EOB chars. */
| 		register int number_to_move =3D (yy_n_chars) + 2;
| 		register char *dest =3D &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
| 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
| 		register char *source =3D
| 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
|=20
| 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
| 			*--dest =3D *--source;
|=20
| 		yy_cp +=3D (int) (dest - source);
| 		yy_bp +=3D (int) (dest - source);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D
| 			(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
|=20
| 		if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
| 			YY_FATAL_ERROR( "flex scanner push-back overflow" );
| 		}
|=20
| 	*--yy_cp =3D (char) c;
|=20
| 	(yytext_ptr) =3D yy_bp;
| 	(yy_hold_char) =3D *yy_cp;
| 	(yy_c_buf_p) =3D yy_cp;
| }
|=20
| #ifndef YY_NO_INPUT
| #ifdef __cplusplus
|     static int yyinput (void)
| #else
|     static int input  (void)
| #endif
|=20
| {
| 	int c;
|    =20
| 	*(yy_c_buf_p) =3D (yy_hold_char);
|=20
| 	if ( *(yy_c_buf_p) =3D=3D YY_END_OF_BUFFER_CHAR )
| 		{
| 		/* yy_c_buf_p now points to the character we want to return.
| 		 * If this occurs *before* the EOB characters, then it's a
| 		 * valid NUL; if not, then we've hit the end of the buffer.
| 		 */
| 		if ( (yy_c_buf_p) < &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] =
)
| 			/* This was really a NUL. */
| 			*(yy_c_buf_p) =3D '\0';
|=20
| 		else
| 			{ /* need more input */
| 			int offset =3D (yy_c_buf_p) - (yytext_ptr);
| 			++(yy_c_buf_p);
|=20
| 			switch ( yy_get_next_buffer(  ) )
| 				{
| 				case EOB_ACT_LAST_MATCH:
| 					/* This happens because yy_g_n_b()
| 					 * sees that we've accumulated a
| 					 * token and flags that we need to
| 					 * try matching the token before
| 					 * proceeding.  But for input(),
| 					 * there's no matching to consider.
| 					 * So convert the EOB_ACT_LAST_MATCH
| 					 * to EOB_ACT_END_OF_FILE.
| 					 */
|=20
| 					/* Reset buffer status. */
| 					yyrestart(yyin );
|=20
| 					/*FALLTHROUGH*/
|=20
| 				case EOB_ACT_END_OF_FILE:
| 					{
| 					if ( yywrap( ) )
| 						return EOF;
|=20
| 					if ( ! (yy_did_buffer_switch_on_eof) )
| 						YY_NEW_FILE;
| #ifdef __cplusplus
| 					return yyinput();
| #else
| 					return input();
| #endif
| 					}
|=20
| 				case EOB_ACT_CONTINUE_SCAN:
| 					(yy_c_buf_p) =3D (yytext_ptr) + offset;
| 					break;
| 				}
| 			}
| 		}
|=20
| 	c =3D *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
| 	*(yy_c_buf_p) =3D '\0';	/* preserve yytext */
| 	(yy_hold_char) =3D *++(yy_c_buf_p);
|=20
| 	return c;
| }
| #endif	/* ifndef YY_NO_INPUT */
|=20
| /** Immediately switch to a different input stream.
|  * @param input_file A readable stream.
|  *=20
|  * @note This function does not reset the start condition to @c INITIAL .
|  */
|     void yyrestart  (FILE * input_file )
| {
|    =20
| 	if ( ! YY_CURRENT_BUFFER ){
|         yyensure_buffer_stack ();
| 		YY_CURRENT_BUFFER_LVALUE =3D
|             yy_create_buffer(yyin,YY_BUF_SIZE );
| 	}
|=20
| 	yy_init_buffer(YY_CURRENT_BUFFER,input_file );
| 	yy_load_buffer_state( );
| }
|=20
| /** Switch to a different input buffer.
|  * @param new_buffer The new input buffer.
|  *=20
|  */
|     void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
| {
|    =20
| 	/* TODO. We should be able to replace this entire function body
| 	 * with
| 	 *		yypop_buffer_state();
| 	 *		yypush_buffer_state(new_buffer);
|      */
| 	yyensure_buffer_stack ();
| 	if ( YY_CURRENT_BUFFER =3D=3D new_buffer )
| 		return;
|=20
| 	if ( YY_CURRENT_BUFFER )
| 		{
| 		/* Flush out information for old buffer. */
| 		*(yy_c_buf_p) =3D (yy_hold_char);
| 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos =3D (yy_c_buf_p);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	YY_CURRENT_BUFFER_LVALUE =3D new_buffer;
| 	yy_load_buffer_state( );
|=20
| 	/* We don't actually know whether we did this switch during
| 	 * EOF (yywrap()) processing, but the only time this flag
| 	 * is looked at is after yywrap() is called, so it's safe
| 	 * to go ahead and always set it.
| 	 */
| 	(yy_did_buffer_switch_on_eof) =3D 1;
| }
|=20
| static void yy_load_buffer_state  (void)
| {
|     	(yy_n_chars) =3D YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
| 	(yytext_ptr) =3D (yy_c_buf_p) =3D YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
| 	yyin =3D YY_CURRENT_BUFFER_LVALUE->yy_input_file;
| 	(yy_hold_char) =3D *(yy_c_buf_p);
| }
|=20
| /** Allocate and initialize an input buffer state.
|  * @param file A readable stream.
|  * @param size The character buffer size in bytes. When in doubt, use @c =
YY_BUF_SIZE.
|  *=20
|  * @return the allocated buffer state.
|  */
|     YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
| {
| 	YY_BUFFER_STATE b;
|    =20
| 	b =3D (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
|=20
| 	b->yy_buf_size =3D size;
|=20
| 	/* yy_ch_buf has to be 2 characters longer than the size given because
| 	 * we need to put in 2 end-of-buffer characters.
| 	 */
| 	b->yy_ch_buf =3D (char *) yyalloc(b->yy_buf_size + 2  );
| 	if ( ! b->yy_ch_buf )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
|=20
| 	b->yy_is_our_buffer =3D 1;
|=20
| 	yy_init_buffer(b,file );
|=20
| 	return b;
| }
|=20
| /** Destroy the buffer.
|  * @param b a buffer created with yy_create_buffer()
|  *=20
|  */
|     void yy_delete_buffer (YY_BUFFER_STATE  b )
| {
|    =20
| 	if ( ! b )
| 		return;
|=20
| 	if ( b =3D=3D YY_CURRENT_BUFFER ) /* Not sure if we should pop here. */
| 		YY_CURRENT_BUFFER_LVALUE =3D (YY_BUFFER_STATE) 0;
|=20
| 	if ( b->yy_is_our_buffer )
| 		yyfree((void *) b->yy_ch_buf  );
|=20
| 	yyfree((void *) b  );
| }
|=20
| #ifndef __cplusplus
| extern int isatty (int );
| #endif /* __cplusplus */
|    =20
| /* Initializes or reinitializes a buffer.
|  * This function is sometimes called more than once on the same buffer,
|  * such as during a yyrestart() or at EOF.
|  */
|     static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
|=20
| {
| 	int oerrno =3D errno;
|    =20
| 	yy_flush_buffer(b );
|=20
| 	b->yy_input_file =3D file;
| 	b->yy_fill_buffer =3D 1;
|=20
|     /* If b is the current buffer, then yy_init_buffer was _probably_
|      * called from yyrestart() or through yy_get_next_buffer.
|      * In that case, we don't want to reset the lineno or column.
|      */
|     if (b !=3D YY_CURRENT_BUFFER){
|         b->yy_bs_lineno =3D 1;
|         b->yy_bs_column =3D 0;
|     }
|=20
|         b->yy_is_interactive =3D file ? (isatty( fileno(file) ) > 0) : 0;
|    =20
| 	errno =3D oerrno;
| }
|=20
| /** Discard all buffered characters. On the next scan, YY_INPUT will be c=
alled.
|  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
|  *=20
|  */
|     void yy_flush_buffer (YY_BUFFER_STATE  b )
| {
|     	if ( ! b )
| 		return;
|=20
| 	b->yy_n_chars =3D 0;
|=20
| 	/* We always need two end-of-buffer characters.  The first causes
| 	 * a transition to the end-of-buffer state.  The second causes
| 	 * a jam in that state.
| 	 */
| 	b->yy_ch_buf[0] =3D YY_END_OF_BUFFER_CHAR;
| 	b->yy_ch_buf[1] =3D YY_END_OF_BUFFER_CHAR;
|=20
| 	b->yy_buf_pos =3D &b->yy_ch_buf[0];
|=20
| 	b->yy_at_bol =3D 1;
| 	b->yy_buffer_status =3D YY_BUFFER_NEW;
|=20
| 	if ( b =3D=3D YY_CURRENT_BUFFER )
| 		yy_load_buffer_state( );
| }
|=20
| /** Pushes the new state onto the stack. The new state becomes
|  *  the current state. This function will allocate the stack
|  *  if necessary.
|  *  @param new_buffer The new state.
|  * =20
|  */
| void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
| {
|     	if (new_buffer =3D=3D NULL)
| 		return;
|=20
| 	yyensure_buffer_stack();
|=20
| 	/* This block is copied from yy_switch_to_buffer. */
| 	if ( YY_CURRENT_BUFFER )
| 		{
| 		/* Flush out information for old buffer. */
| 		*(yy_c_buf_p) =3D (yy_hold_char);
| 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos =3D (yy_c_buf_p);
| 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =3D (yy_n_chars);
| 		}
|=20
| 	/* Only push if top exists. Otherwise, replace top. */
| 	if (YY_CURRENT_BUFFER)
| 		(yy_buffer_stack_top)++;
| 	YY_CURRENT_BUFFER_LVALUE =3D new_buffer;
|=20
| 	/* copied from yy_switch_to_buffer. */
| 	yy_load_buffer_state( );
| 	(yy_did_buffer_switch_on_eof) =3D 1;
| }
|=20
| /** Removes and deletes the top of the stack, if present.
|  *  The next element becomes the new top.
|  * =20
|  */
| void yypop_buffer_state (void)
| {
|     	if (!YY_CURRENT_BUFFER)
| 		return;
|=20
| 	yy_delete_buffer(YY_CURRENT_BUFFER );
| 	YY_CURRENT_BUFFER_LVALUE =3D NULL;
| 	if ((yy_buffer_stack_top) > 0)
| 		--(yy_buffer_stack_top);
|=20
| 	if (YY_CURRENT_BUFFER) {
| 		yy_load_buffer_state( );
| 		(yy_did_buffer_switch_on_eof) =3D 1;
| 	}
| }
|=20
| /* Allocates the stack if it does not exist.
|  *  Guarantees space for at least one push.
|  */
| static void yyensure_buffer_stack (void)
| {
| 	int num_to_alloc;
|    =20
| 	if (!(yy_buffer_stack)) {
|=20
| 		/* First allocation is just for 2 elements, since we don't know if this
| 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
| 		 * immediate realloc on the next call.
|          */
| 		num_to_alloc =3D 1;
| 		(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
| 								(num_to_alloc * sizeof(struct yy_buffer_state*)
| 								);
| 		if ( ! (yy_buffer_stack) )
| 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
| 								 =20
| 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_sta=
te*));
| 			=09
| 		(yy_buffer_stack_max) =3D num_to_alloc;
| 		(yy_buffer_stack_top) =3D 0;
| 		return;
| 	}
|=20
| 	if ((yy_buffer_stack_top) >=3D ((yy_buffer_stack_max)) - 1){
|=20
| 		/* Increase the buffer to prepare for a possible push. */
| 		int grow_size =3D 8 /* arbitrary grow size */;
|=20
| 		num_to_alloc =3D (yy_buffer_stack_max) + grow_size;
| 		(yy_buffer_stack) =3D (struct yy_buffer_state**)yyrealloc
| 								((yy_buffer_stack),
| 								num_to_alloc * sizeof(struct yy_buffer_state*)
| 								);
| 		if ( ! (yy_buffer_stack) )
| 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
|=20
| 		/* zero only the new slots.*/
| 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof=
(struct yy_buffer_state*));
| 		(yy_buffer_stack_max) =3D num_to_alloc;
| 	}
| }
|=20
| /** Setup the input buffer state to scan directly from a user-specified c=
haracter buffer.
|  * @param base the character buffer
|  * @param size the size in bytes of the character buffer
|  *=20
|  * @return the newly allocated buffer state object.=20
|  */
| YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
| {
| 	YY_BUFFER_STATE b;
|    =20
| 	if ( size < 2 ||
| 	     base[size-2] !=3D YY_END_OF_BUFFER_CHAR ||
| 	     base[size-1] !=3D YY_END_OF_BUFFER_CHAR )
| 		/* They forgot to leave room for the EOB's. */
| 		return 0;
|=20
| 	b =3D (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
|=20
| 	b->yy_buf_size =3D size - 2;	/* "- 2" to take care of EOB's */
| 	b->yy_buf_pos =3D b->yy_ch_buf =3D base;
| 	b->yy_is_our_buffer =3D 0;
| 	b->yy_input_file =3D 0;
| 	b->yy_n_chars =3D b->yy_buf_size;
| 	b->yy_is_interactive =3D 0;
| 	b->yy_at_bol =3D 1;
| 	b->yy_fill_buffer =3D 0;
| 	b->yy_buffer_status =3D YY_BUFFER_NEW;
|=20
| 	yy_switch_to_buffer(b  );
|=20
| 	return b;
| }
|=20
| /** Setup the input buffer state to scan a string. The next call to yylex=
() will
|  * scan from a @e copy of @a str.
|  * @param yystr a NUL-terminated string to scan
|  *=20
|  * @return the newly allocated buffer state object.
|  * @note If you want to scan bytes that may contain NUL values, then use
|  *       yy_scan_bytes() instead.
|  */
| YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
| {
|    =20
| 	return yy_scan_bytes(yystr,strlen(yystr) );
| }
|=20
| /** Setup the input buffer state to scan the given bytes. The next call t=
o yylex() will
|  * scan from a @e copy of @a bytes.
|  * @param bytes the byte buffer to scan
|  * @param len the number of bytes in the buffer pointed to by @a bytes.
|  *=20
|  * @return the newly allocated buffer state object.
|  */
| YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len=
 )
| {
| 	YY_BUFFER_STATE b;
| 	char *buf;
| 	yy_size_t n;
| 	int i;
|    =20
| 	/* Get memory for full buffer, including space for trailing EOB's. */
| 	n =3D _yybytes_len + 2;
| 	buf =3D (char *) yyalloc(n  );
| 	if ( ! buf )
| 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
|=20
| 	for ( i =3D 0; i < _yybytes_len; ++i )
| 		buf[i] =3D yybytes[i];
|=20
| 	buf[_yybytes_len] =3D buf[_yybytes_len+1] =3D YY_END_OF_BUFFER_CHAR;
|=20
| 	b =3D yy_scan_buffer(buf,n );
| 	if ( ! b )
| 		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
|=20
| 	/* It's okay to grow etc. this buffer, and we should throw it
| 	 * away when we're done.
| 	 */
| 	b->yy_is_our_buffer =3D 1;
|=20
| 	return b;
| }
|=20
| #ifndef YY_EXIT_FAILURE
| #define YY_EXIT_FAILURE 2
| #endif
|=20
| static void yy_fatal_error (yyconst char* msg )
| {
|     	(void) fprintf( stderr, "%s\n", msg );
| 	exit( YY_EXIT_FAILURE );
| }
|=20
| /* Redefine yyless() so it works in section 3 code. */
|=20
| #undef yyless
| #define yyless(n) \
| 	do \
| 		{ \
| 		/* Undo effects of setting up yytext. */ \
|         int yyless_macro_arg =3D (n); \
|         YY_LESS_LINENO(yyless_macro_arg);\
| 		yytext[yyleng] =3D (yy_hold_char); \
| 		(yy_c_buf_p) =3D yytext + yyless_macro_arg; \
| 		(yy_hold_char) =3D *(yy_c_buf_p); \
| 		*(yy_c_buf_p) =3D '\0'; \
| 		yyleng =3D yyless_macro_arg; \
| 		} \
| 	while ( 0 )
|=20
| /* Accessor  methods (get/set functions) to struct members. */
|=20
| /** Get the current line number.
|  *=20
|  */
| int yyget_lineno  (void)
| {
|        =20
|     return yylineno;
| }
|=20
| /** Get the input stream.
|  *=20
|  */
| FILE *yyget_in  (void)
| {
|         return yyin;
| }
|=20
| /** Get the output stream.
|  *=20
|  */
| FILE *yyget_out  (void)
| {
|         return yyout;
| }
|=20
| /** Get the length of the current token.
|  *=20
|  */
| int yyget_leng  (void)
| {
|         return yyleng;
| }
|=20
| /** Get the current token.
|  *=20
|  */
|=20
| char *yyget_text  (void)
| {
|         return yytext;
| }
|=20
| /** Set the current line number.
|  * @param line_number
|  *=20
|  */
| void yyset_lineno (int  line_number )
| {
|    =20
|     yylineno =3D line_number;
| }
|=20
| /** Set the input stream. This does not discard the current
|  * input buffer.
|  * @param in_str A readable stream.
|  *=20
|  * @see yy_switch_to_buffer
|  */
| void yyset_in (FILE *  in_str )
| {
|         yyin =3D in_str ;
| }
|=20
| void yyset_out (FILE *  out_str )
| {
|         yyout =3D out_str ;
| }
|=20
| int yyget_debug  (void)
| {
|         return yy_flex_debug;
| }
|=20
| void yyset_debug (int  bdebug )
| {
|         yy_flex_debug =3D bdebug ;
| }
|=20
| static int yy_init_globals (void)
| {
|         /* Initialization is the same as for the non-reentrant scanner.
|      * This function is called from yylex_destroy(), so don't allocate he=
re.
|      */
|=20
|     (yy_buffer_stack) =3D 0;
|     (yy_buffer_stack_top) =3D 0;
|     (yy_buffer_stack_max) =3D 0;
|     (yy_c_buf_p) =3D (char *) 0;
|     (yy_init) =3D 0;
|     (yy_start) =3D 0;
|=20
|     (yy_state_buf) =3D 0;
|     (yy_state_ptr) =3D 0;
|     (yy_full_match) =3D 0;
|     (yy_lp) =3D 0;
|=20
| /* Defined in main.c */
| #ifdef YY_STDINIT
|     yyin =3D stdin;
|     yyout =3D stdout;
| #else
|     yyin =3D (FILE *) 0;
|     yyout =3D (FILE *) 0;
| #endif
|=20
|     /* For future reference: Set errno on error, since we are called by
|      * yylex_init()
|      */
|     return 0;
| }
|=20
| /* yylex_destroy is for both reentrant and non-reentrant scanners. */
| int yylex_destroy  (void)
| {
|    =20
|     /* Pop the buffer stack, destroying each element. */
| 	while(YY_CURRENT_BUFFER){
| 		yy_delete_buffer(YY_CURRENT_BUFFER  );
| 		YY_CURRENT_BUFFER_LVALUE =3D NULL;
| 		yypop_buffer_state();
| 	}
|=20
| 	/* Destroy the stack itself. */
| 	yyfree((yy_buffer_stack) );
| 	(yy_buffer_stack) =3D NULL;
|=20
|     yyfree ( (yy_state_buf) );
|     (yy_state_buf)  =3D NULL;
|=20
|     /* Reset the globals. This is important in a non-reentrant scanner so=
 the next time
|      * yylex() is called, initialization will occur. */
|     yy_init_globals( );
|=20
|     return 0;
| }
|=20
| /*
|  * Internal utility routines.
|  */
|=20
| #ifndef yytext_ptr
| static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
| {
| 	register int i;
| 	for ( i =3D 0; i < n; ++i )
| 		s1[i] =3D s2[i];
| }
| #endif
|=20
| #ifdef YY_NEED_STRLEN
| static int yy_flex_strlen (yyconst char * s )
| {
| 	register int n;
| 	for ( n =3D 0; s[n]; ++n )
| 		;
|=20
| 	return n;
| }
| #endif
|=20
| void *yyalloc (yy_size_t  size )
| {
| 	return (void *) malloc( size );
| }
|=20
| void *yyrealloc  (void * ptr, yy_size_t  size )
| {
| 	/* The cast to (char *) in the following accommodates both
| 	 * implementations that use char* generic pointers, and those
| 	 * that use void* generic pointers.  It works with the latter
| 	 * because both ANSI C and C++ allow castless assignment from
| 	 * any pointer type to void*, and deal with argument conversions
| 	 * as though doing an assignment.
| 	 */
| 	return (void *) realloc( (char *) ptr, size );
| }
|=20
| void yyfree (void * ptr )
| {
| 	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
| }
|=20
| #define YYTABLES_NAME "yytables"
|=20
| #line 9 "conftest.l"
|=20
|=20
| #ifdef YYTEXT_POINTER
| extern char *yytext;
| #endif
| int
| main (void)
| {
|   return ! yylex () + ! yywrap ();
| }
configure:13966: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lfl  >&5
configure:13966: $? =3D 0
configure:13976: result: -lfl
configure:13982: checking whether yytext is a pointer
configure:13998: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lfl  >&5
configure:13998: $? =3D 0
configure:14006: result: yes
configure:14020: checking for bison
configure:14036: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/bison
configure:14047: result: bison -y
configure:14066: checking for special C compiler options needed for large f=
iles
configure:14111: result: no
configure:14117: checking for _FILE_OFFSET_BITS value needed for large file=
s
configure:14142: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:33:3: warning: left shift count >=3D width of type [enabled by d=
efault]
conftest.c:33:3: warning: left shift count >=3D width of type [enabled by d=
efault]
conftest.c:34:10: warning: left shift count >=3D width of type [enabled by =
default]
conftest.c:34:10: warning: left shift count >=3D width of type [enabled by =
default]
conftest.c:33:7: error: size of array 'off_t_is_large' is negative
conftest.c:35:9: warning: variably modified 'off_t_is_large' at file scope =
[enabled by default]
configure:14142: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| /* end confdefs.h.  */
| #include <sys/types.h>
|  /* Check that off_t can represent 2**63 - 1 correctly.
|     We can't simply define LARGE_OFF_T to be 9223372036854775807,
|     since some C++ compilers masquerading as C compilers
|     incorrectly reject 9223372036854775807.  */
| #define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
|   int off_t_is_large[(LARGE_OFF_T % 2147483629 =3D=3D 721
| 		       && LARGE_OFF_T % 2147483647 =3D=3D 1)
| 		      ? 1 : -1];
| int
| main ()
| {
|=20
|   ;
|   return 0;
| }
configure:14166: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:14166: $? =3D 0
configure:14174: result: 64
configure:14263: checking for cpp
configure:14282: found /usr/bin/cpp
configure:14294: result: /usr/bin/cpp
configure:14310: checking if /usr/bin/cpp requires -undef
configure:14322: result: yes
configure:14335: checking if /usr/bin/cpp requires -traditional
configure:14347: result: yes
configure:14372: checking for dtrace
configure:14404: result: not_found
configure:14470: checking for dirent.h that defines DIR
configure:14489: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:14489: $? =3D 0
configure:14497: result: yes
configure:14511: checking for library containing opendir
configure:14542: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:14542: $? =3D 0
configure:14559: result: none required
configure:14626: checking for ANSI C header files
configure:14730: result: yes
configure:14741: checking for fcntl.h
configure:14741: result: yes
configure:14741: checking for stdlib.h
configure:14741: result: yes
configure:14741: checking for string.h
configure:14741: result: yes
configure:14741: checking for unistd.h
configure:14741: result: yes
configure:14741: checking for dlfcn.h
configure:14741: result: yes
configure:14741: checking for stropts.h
configure:14741: result: yes
configure:14741: checking fnmatch.h usability
configure:14741: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:14741: $? =3D 0
configure:14741: result: yes
configure:14741: checking fnmatch.h presence
configure:14741: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:14741: $? =3D 0
configure:14741: result: yes
configure:14741: checking for fnmatch.h
configure:14741: result: yes
configure:14741: checking for sys/utsname.h
configure:14741: result: yes
configure:14753: checking for an ANSI C-conforming const
configure:14818: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:14818: $? =3D 0
configure:14825: result: yes
configure:14833: checking whether byte ordering is bigendian
configure:15039: result: no
configure:15061: checking size of unsigned long
configure:15081: result: 4
configure:15097: checking for pid_t
configure:15097: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:15097: $? =3D 0
configure:15097: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:75:20: error: expected expression before ')' token
configure:15097: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| int
| main ()
| {
| if (sizeof ((pid_t)))
| 	    return 0;
|   ;
|   return 0;
| }
configure:15097: result: yes
configure:15119: checking for byteswap.h
configure:15119: result: yes
configure:15131: checking sys/endian.h usability
configure:15131: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:73:24: fatal error: sys/endian.h: No such file or directory
compilation terminated.
configure:15131: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/endian.h>
configure:15131: result: no
configure:15131: checking sys/endian.h presence
configure:15131: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:40:24: fatal error: sys/endian.h: No such file or directory
compilation terminated.
configure:15131: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| #include <sys/endian.h>
configure:15131: result: no
configure:15131: checking for sys/endian.h
configure:15131: result: no
configure:15235: checking for dlopen
configure:15235: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccaQGSPX.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:74: undefined reference to `dlopen'
collect2: ld returned 1 exit status
configure:15235: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| /* end confdefs.h.  */
| /* Define dlopen to an innocuous variant, in case <limits.h> declares dlo=
pen.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define dlopen innocuous_dlopen
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char dlopen (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef dlopen
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char dlopen ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_dlopen || defined __stub___dlopen
| choke me
| #endif
|=20
| int
| main ()
| {
| return dlopen ();
|   ;
|   return 0;
| }
configure:15235: result: no
configure:15239: checking for dlopen in -ldl
configure:15264: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -ldl   >&5
configure:15264: $? =3D 0
configure:15273: result: yes
configure:15285: checking for vprintf
configure:15285: result: yes
configure:15291: checking for _doprnt
configure:15291: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccJax1v1.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:75: undefined reference to `_doprnt'
collect2: ld returned 1 exit status
configure:15291: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| /* end confdefs.h.  */
| /* Define _doprnt to an innocuous variant, in case <limits.h> declares _d=
oprnt.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define _doprnt innocuous__doprnt
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char _doprnt (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef _doprnt
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char _doprnt ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub__doprnt || defined __stub____doprnt
| choke me
| #endif
|=20
| int
| main ()
| {
| return _doprnt ();
|   ;
|   return 0;
| }
configure:15291: result: no
configure:15307: checking for geteuid
configure:15307: result: yes
configure:15307: checking for getuid
configure:15307: result: yes
configure:15307: checking for link
configure:15307: result: yes
configure:15307: checking for memmove
configure:15307: result: yes
configure:15307: checking for memset
configure:15307: result: yes
configure:15307: checking for mkstemp
configure:15307: result: yes
configure:15307: checking for strchr
configure:15307: result: yes
configure:15307: checking for strrchr
configure:15307: result: yes
configure:15307: checking for strtol
configure:15307: result: yes
configure:15307: checking for getopt
configure:15307: result: yes
configure:15307: checking for getopt_long
configure:15307: result: yes
configure:15307: checking for vsnprintf
configure:15307: result: yes
configure:15307: checking for walkcontext
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccxWTvk4.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:87: undefined reference to `walkcontext'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| /* end confdefs.h.  */
| /* Define walkcontext to an innocuous variant, in case <limits.h> declare=
s walkcontext.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define walkcontext innocuous_walkcontext
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char walkcontext (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef walkcontext
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char walkcontext ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_walkcontext || defined __stub___walkcontext
| choke me
| #endif
|=20
| int
| main ()
| {
| return walkcontext ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for backtrace
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:15307: $? =3D 0
configure:15307: result: yes
configure:15307: checking for getisax
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccgTedSa.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:88: undefined reference to `getisax'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define getisax to an innocuous variant, in case <limits.h> declares ge=
tisax.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getisax innocuous_getisax
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getisax (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getisax
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getisax ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getisax || defined __stub___getisax
| choke me
| #endif
|=20
| int
| main ()
| {
| return getisax ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for getzoneid
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/cci9hzId.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:88: undefined reference to `getzoneid'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define getzoneid to an innocuous variant, in case <limits.h> declares =
getzoneid.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getzoneid innocuous_getzoneid
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getzoneid (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getzoneid
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getzoneid ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getzoneid || defined __stub___getzoneid
| choke me
| #endif
|=20
| int
| main ()
| {
| return getzoneid ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for shmctl64
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/cc9yMCXe.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:88: undefined reference to `shmctl64'
collect2: ld returned 1 exit status
configure:15307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| /* end confdefs.h.  */
| /* Define shmctl64 to an innocuous variant, in case <limits.h> declares s=
hmctl64.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define shmctl64 innocuous_shmctl64
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char shmctl64 (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef shmctl64
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shmctl64 ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_shmctl64 || defined __stub___shmctl64
| choke me
| #endif
|=20
| int
| main ()
| {
| return shmctl64 ();
|   ;
|   return 0;
| }
configure:15307: result: no
configure:15307: checking for strcasestr
configure:15307: result: yes
configure:15307: checking for ffs
configure:15307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
conftest.c:78:6: warning: conflicting types for built-in function 'ffs' [en=
abled by default]
configure:15307: $? =3D 0
configure:15307: result: yes
configure:15307: checking for vasprintf
configure:15307: result: yes
configure:15319: checking for working alloca.h
configure:15336: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:15336: $? =3D 0
configure:15344: result: yes
configure:15352: checking for alloca
configure:15389: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
configure:15389: $? =3D 0
configure:15397: result: yes
configure:15507: checking for getdtablesize
configure:15507: result: yes
configure:15514: checking for getifaddrs
configure:15514: result: yes
configure:15521: checking for getpeereid
configure:15521: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccXfBGor.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:95: undefined reference to `getpeereid'
collect2: ld returned 1 exit status
configure:15521: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define getpeereid to an innocuous variant, in case <limits.h> declares=
 getpeereid.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getpeereid innocuous_getpeereid
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getpeereid (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getpeereid
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getpeereid ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getpeereid || defined __stub___getpeereid
| choke me
| #endif
|=20
| int
| main ()
| {
| return getpeereid ();
|   ;
|   return 0;
| }
configure:15521: result: no
configure:15528: checking for getpeerucred
configure:15528: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccvQ3uOw.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:95: undefined reference to `getpeerucred'
collect2: ld returned 1 exit status
configure:15528: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define getpeerucred to an innocuous variant, in case <limits.h> declar=
es getpeerucred.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define getpeerucred innocuous_getpeerucred
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char getpeerucred (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef getpeerucred
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char getpeerucred ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_getpeerucred || defined __stub___getpeerucred
| choke me
| #endif
|=20
| int
| main ()
| {
| return getpeerucred ();
|   ;
|   return 0;
| }
configure:15528: result: no
configure:15535: checking for strlcat
configure:15535: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/ccdieNWz.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:95: undefined reference to `strlcat'
collect2: ld returned 1 exit status
configure:15535: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define strlcat to an innocuous variant, in case <limits.h> declares st=
rlcat.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define strlcat innocuous_strlcat
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char strlcat (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef strlcat
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char strlcat ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_strlcat || defined __stub___strlcat
| choke me
| #endif
|=20
| int
| main ()
| {
| return strlcat ();
|   ;
|   return 0;
| }
configure:15535: result: no
configure:15550: checking for strlcpy
configure:15550: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c  >&5
/tmp/cclpSavC.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:95: undefined reference to `strlcpy'
collect2: ld returned 1 exit status
configure:15550: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| /* end confdefs.h.  */
| /* Define strlcpy to an innocuous variant, in case <limits.h> declares st=
rlcpy.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define strlcpy innocuous_strlcpy
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char strlcpy (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef strlcpy
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char strlcpy ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_strlcpy || defined __stub___strlcpy
| choke me
| #endif
|=20
| int
| main ()
| {
| return strlcpy ();
|   ;
|   return 0;
| }
configure:15550: result: no
configure:15567: checking for mmap
configure:15567: result: yes
configure:15575: checking for sqrt in -lm
configure:15600: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm   >&5
conftest.c:69:6: warning: conflicting types for built-in function 'sqrt' [e=
nabled by default]
configure:15600: $? =3D 0
configure:15609: result: yes
configure:15620: checking for cbrt in -lm
configure:15645: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  -lm  >&5
conftest.c:70:6: warning: conflicting types for built-in function 'cbrt' [e=
nabled by default]
configure:15645: $? =3D 0
configure:15654: result: yes
configure:15666: checking ndbm.h usability
configure:15666: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:97:18: fatal error: ndbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <ndbm.h>
configure:15666: result: no
configure:15666: checking ndbm.h presence
configure:15666: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:64:18: fatal error: ndbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <ndbm.h>
configure:15666: result: no
configure:15666: checking for ndbm.h
configure:15666: result: no
configure:15666: checking dbm.h usability
configure:15666: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:97:17: fatal error: dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <dbm.h>
configure:15666: result: no
configure:15666: checking dbm.h presence
configure:15666: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:64:17: fatal error: dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <dbm.h>
configure:15666: result: no
configure:15666: checking for dbm.h
configure:15666: result: no
configure:15666: checking rpcsvc/dbm.h usability
configure:15666: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:97:24: fatal error: rpcsvc/dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <rpcsvc/dbm.h>
configure:15666: result: no
configure:15666: checking rpcsvc/dbm.h presence
configure:15666: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:64:24: fatal error: rpcsvc/dbm.h: No such file or directory
compilation terminated.
configure:15666: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| /* end confdefs.h.  */
| #include <rpcsvc/dbm.h>
configure:15666: result: no
configure:15666: checking for rpcsvc/dbm.h
configure:15666: result: no
configure:15681: checking linux/agpgart.h usability
configure:15681: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:15681: $? =3D 0
configure:15681: result: yes
configure:15681: checking linux/agpgart.h presence
configure:15681: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:15681: $? =3D 0
configure:15681: result: yes
configure:15681: checking for linux/agpgart.h
configure:15681: result: yes
configure:15681: checking sys/agpio.h usability
configure:15681: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:98:23: fatal error: sys/agpio.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/agpio.h>
configure:15681: result: no
configure:15681: checking sys/agpio.h presence
configure:15681: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:65:23: fatal error: sys/agpio.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <sys/agpio.h>
configure:15681: result: no
configure:15681: checking for sys/agpio.h
configure:15681: result: no
configure:15681: checking sys/agpgart.h usability
configure:15681: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:98:25: fatal error: sys/agpgart.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/agpgart.h>
configure:15681: result: no
configure:15681: checking sys/agpgart.h presence
configure:15681: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:65:25: fatal error: sys/agpgart.h: No such file or directory
compilation terminated.
configure:15681: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| /* end confdefs.h.  */
| #include <sys/agpgart.h>
configure:15681: result: no
configure:15681: checking for sys/agpgart.h
configure:15681: result: no
configure:15703: checking linux/apm_bios.h usability
configure:15703: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:15703: $? =3D 0
configure:15703: result: yes
configure:15703: checking linux/apm_bios.h presence
configure:15703: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:15703: $? =3D 0
configure:15703: result: yes
configure:15703: checking for linux/apm_bios.h
configure:15703: result: yes
configure:15724: checking linux/fb.h usability
configure:15724: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:15724: $? =3D 0
configure:15724: result: yes
configure:15724: checking linux/fb.h presence
configure:15724: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:15724: $? =3D 0
configure:15724: result: yes
configure:15724: checking for linux/fb.h
configure:15724: result: yes
configure:15745: checking asm/mtrr.h usability
configure:15745: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:15745: $? =3D 0
configure:15745: result: yes
configure:15745: checking asm/mtrr.h presence
configure:15745: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:15745: $? =3D 0
configure:15745: result: yes
configure:15745: checking for asm/mtrr.h
configure:15745: result: yes
configure:15761: checking sys/memrange.h usability
configure:15761: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:101:26: fatal error: sys/memrange.h: No such file or directory
compilation terminated.
configure:15761: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/memrange.h>
configure:15761: result: no
configure:15761: checking sys/memrange.h presence
configure:15761: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:68:26: fatal error: sys/memrange.h: No such file or directory
compilation terminated.
configure:15761: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| /* end confdefs.h.  */
| #include <sys/memrange.h>
configure:15761: result: no
configure:15761: checking for sys/memrange.h
configure:15761: result: no
configure:15783: checking machine/mtrr.h usability
configure:15783: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:102:26: fatal error: machine/mtrr.h: No such file or directory
compilation terminated.
configure:15783: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <machine/mtrr.h>
configure:15783: result: no
configure:15783: checking machine/mtrr.h presence
configure:15783: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:69:26: fatal error: machine/mtrr.h: No such file or directory
compilation terminated.
configure:15783: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| /* end confdefs.h.  */
| #include <machine/mtrr.h>
configure:15783: result: no
configure:15783: checking for machine/mtrr.h
configure:15783: result: no
configure:15801: checking for sys/linker.h
configure:15801: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:71:24: fatal error: sys/linker.h: No such file or directory
compilation terminated.
configure:15801: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| /* end confdefs.h.  */
| #include <sys/param.h>
|=20
| #include <sys/linker.h>
configure:15801: result: no
configure:15823: checking for SYSV IPC
configure:15849: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
configure:15849: $? =3D 0
configure:15857: result: yes
configure:15871: checking machine/apmvar.h usability
configure:15871: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c:103:28: fatal error: machine/apmvar.h: No such file or directory
compilation terminated.
configure:15871: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <machine/apmvar.h>
configure:15871: result: no
configure:15871: checking machine/apmvar.h presence
configure:15871: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
conftest.c:70:28: fatal error: machine/apmvar.h: No such file or directory
compilation terminated.
configure:15871: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| /* end confdefs.h.  */
| #include <machine/apmvar.h>
configure:15871: result: no
configure:15871: checking for machine/apmvar.h
configure:15871: result: no
configure:15903: checking for execinfo.h
configure:15903: result: yes
configure:15906: checking for backtrace in -lc
configure:15931: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lc  -lm  >&5
configure:15931: $? =3D 0
configure:15940: result: yes
configure:15971: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -mapcs-frame  conftest.c >&5
cc1: error: unrecognized command line option '-mapcs-frame'
configure:15971: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| /* end confdefs.h.  */
|=20
| int
| main ()
| {
|=20
|   ;
|   return 0;
| }
configure:16290: checking for root directory for font files
configure:16307: result: /usr/share/fonts/X11
configure:16313: checking for directory for misc files
configure:16324: result: ${FONTROOTDIR}/misc
configure:16330: checking for directory for OTF files
configure:16341: result: ${FONTROOTDIR}/OTF
configure:16347: checking for directory for TTF files
configure:16358: result: ${FONTROOTDIR}/TTF
configure:16364: checking for directory for Type1 files
configure:16375: result: ${FONTROOTDIR}/Type1
configure:16381: checking for directory for 75dpi files
configure:16392: result: ${FONTROOTDIR}/75dpi
configure:16398: checking for directory for 100dpi files
configure:16409: result: ${FONTROOTDIR}/100dpi
configure:16426: checking for default font path
configure:16428: result: ${FONTROOTDIR}/misc/,${FONTROOTDIR}/TTF/,${FONTROO=
TDIR}/OTF/,${FONTROOTDIR}/Type1/,${FONTROOTDIR}/100dpi/,${FONTROOTDIR}/75dp=
i/
configure:16565: checking for thread local storage (TLS) class
configure:16592: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:16592: $? =3D 0
configure:16612: result: __thread
configure:16975: checking to see if we can install the Xorg server as root
configure:16993: result: no
configure:17007: checking return type of signal handlers
configure:17025: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:80:1: error: void value not ignored as it ought to be
configure:17025: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| /* end confdefs.h.  */
| #include <sys/types.h>
| #include <signal.h>
|=20
| int
| main ()
| {
| return *(signal (0, 0)) (0) =3D=3D 1;
|   ;
|   return 0;
| }
configure:17032: result: void
configure:17054: checking if Xtrans should support UNIX socket connections
configure:17061: result: yes
configure:17070: checking if Xtrans should support TCP socket connections
configure:17072: result: yes
configure:17080: checking for library containing socket
configure:17111: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
configure:17111: $? =3D 0
configure:17128: result: none required
configure:17136: checking for library containing gethostbyname
configure:17167: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
configure:17167: $? =3D 0
configure:17184: result: none required
configure:17240: checking for getaddrinfo
configure:17240: result: yes
configure:17249: checking if IPv6 support should be built
configure:17256: result: yes
configure:17260: checking for struct sockaddr_in.sin_len
configure:17260: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:88:12: error: 'struct sockaddr_in' has no member named 'sin_len'
configure:17260: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <sys/types.h>
| #include <sys/socket.h>
| #include <netinet/in.h>
|=20
|=20
| int
| main ()
| {
| static struct sockaddr_in ac_aggr;
| if (ac_aggr.sin_len)
| return 0;
|   ;
|   return 0;
| }
configure:17260: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:88:19: error: 'struct sockaddr_in' has no member named 'sin_len'
configure:17260: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <sys/types.h>
| #include <sys/socket.h>
| #include <netinet/in.h>
|=20
|=20
| int
| main ()
| {
| static struct sockaddr_in ac_aggr;
| if (sizeof ac_aggr.sin_len)
| return 0;
|   ;
|   return 0;
| }
configure:17260: result: no
configure:17274: checking for socklen_t
configure:17274: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:17274: $? =3D 0
configure:17274: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
conftest.c: In function 'main':
conftest.c:117:24: error: expected expression before ')' token
configure:17274: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| /* end confdefs.h.  */
|=20
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <sys/socket.h>
|=20
| int
| main ()
| {
| if (sizeof ((socklen_t)))
| 	    return 0;
|   ;
|   return 0;
| }
configure:17274: result: yes
configure:17301: checking if Xtrans should support os-specific local connec=
tions
configure:17303: result: no
configure:17328: checking for authdes_seccreate
configure:17328: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
/tmp/ccnvSGpW.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:113: undefined reference to `authdes_seccreate'
collect2: ld returned 1 exit status
configure:17328: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| /* end confdefs.h.  */
| /* Define authdes_seccreate to an innocuous variant, in case <limits.h> d=
eclares authdes_seccreate.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define authdes_seccreate innocuous_authdes_seccreate
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char authdes_seccreate (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef authdes_seccreate
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char authdes_seccreate ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_authdes_seccreate || defined __stub___authdes_seccreat=
e
| choke me
| #endif
|=20
| int
| main ()
| {
| return authdes_seccreate ();
|   ;
|   return 0;
| }
configure:17328: result: no
configure:17328: checking for authdes_create
configure:17328: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
configure:17328: $? =3D 0
configure:17328: result: yes
configure:17344: checking for library containing getsecretkey
configure:17375: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
configure:17375: $? =3D 0
configure:17392: result: none required
configure:17403: checking if Secure RPC authentication ("SUN-DES-1") should=
 be supported
configure:17410: result: yes
configure:17481: checking whether to build documentation
configure:17483: result: yes
configure:17504: checking whether to build developer documentation
configure:17506: result: yes
configure:17525: checking for xmlto
configure:17543: found /usr/bin/xmlto
configure:17555: result: /usr/bin/xmlto
configure:17628: checking the xmlto version
configure:17631: result: 0.0.23
configure:17918: checking for PIXMAN
configure:17925: $PKG_CONFIG --exists --print-errors "$LIBPIXMAN"
configure:17928: $? =3D 0
configure:17941: $PKG_CONFIG --exists --print-errors "$LIBPIXMAN"
configure:17944: $? =3D 0
configure:18001: result: yes
configure:18016: checking for UDEV
configure:18023: $PKG_CONFIG --exists --print-errors "$LIBUDEV"
configure:18026: $? =3D 0
configure:18039: $PKG_CONFIG --exists --print-errors "$LIBUDEV"
configure:18042: $? =3D 0
configure:18079: result: yes
configure:18107: checking for DBUS
configure:18114: $PKG_CONFIG --exists --print-errors "$LIBDBUS"
configure:18117: $? =3D 0
configure:18130: $PKG_CONFIG --exists --print-errors "$LIBDBUS"
configure:18133: $? =3D 0
configure:18170: result: yes
configure:18212: checking for HAL
configure:18219: $PKG_CONFIG --exists --print-errors "hal"
configure:18222: $? =3D 0
configure:18235: $PKG_CONFIG --exists --print-errors "hal"
configure:18238: $? =3D 0
configure:18275: result: yes
configure:18326: checking for glibc...
configure:18337: i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86  conftest.c
configure:18337: $? =3D 0
configure:18343: result: yes
configure:18348: checking for clock_gettime
configure:18348: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
/tmp/ccYGza2o.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:118: undefined reference to `clock_gettime'
collect2: ld returned 1 exit status
configure:18348: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| /* end confdefs.h.  */
| /* Define clock_gettime to an innocuous variant, in case <limits.h> decla=
res clock_gettime.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define clock_gettime innocuous_clock_gettime
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char clock_gettime (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef clock_gettime
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char clock_gettime ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_clock_gettime || defined __stub___clock_gettime
| choke me
| #endif
|=20
| int
| main ()
| {
| return clock_gettime ();
|   ;
|   return 0;
| }
configure:18348: result: no
configure:18355: checking for clock_gettime in -lrt
configure:18380: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lrt  -lm  >&5
configure:18380: $? =3D 0
configure:18389: result: yes
configure:18401: checking for a useful monotonic clock ...
configure:18453: result: cross compiling
configure:19006: checking for DRI2PROTO
configure:19013: $PKG_CONFIG --exists --print-errors "$DRI2PROTO"
configure:19016: $? =3D 0
configure:19029: $PKG_CONFIG --exists --print-errors "$DRI2PROTO"
configure:19032: $? =3D 0
configure:19069: result: yes
configure:19101: checking for LIBDRM
configure:19108: $PKG_CONFIG --exists --print-errors "$LIBDRM"
configure:19111: $? =3D 0
configure:19124: $PKG_CONFIG --exists --print-errors "$LIBDRM"
configure:19127: $? =3D 0
configure:19184: result: yes
configure:19202: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c  -I/home/kyu3/sdb/test/tmp/sys=
roots/qemux86/usr/include/libdrm    conftest.c >&5
configure:19202: $? =3D 0
configure:19702: checking for strcasecmp
configure:19702: result: yes
configure:19711: checking for strncasecmp
configure:19711: result: yes
configure:19720: checking for strcasestr
configure:19720: result: yes
configure:19732: checking for XDMCP
configure:19739: $PKG_CONFIG --exists --print-errors "xdmcp"
configure:19742: $? =3D 0
configure:19755: $PKG_CONFIG --exists --print-errors "xdmcp"
configure:19758: $? =3D 0
configure:19795: result: yes
configure:19800: checking for XdmcpWrap in -lXdmcp
configure:19825: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lXdmcp -lXdmcp=
   -lm  >&5
configure:19825: $? =3D 0
configure:19834: result: yes
configure:20068: checking for GLIB
configure:20075: $PKG_CONFIG --exists --print-errors "$LIBGLIB"
configure:20078: $? =3D 0
configure:20091: $PKG_CONFIG --exists --print-errors "$LIBGLIB"
configure:20094: $? =3D 0
configure:20131: result: yes
configure:20139: checking whether the linker supports -wrap
configure:20170: result: no
configure:20248: checking for SHA1Init
configure:20248: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
/tmp/ccga2HBO.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:171: undefined reference to `SHA1Init'
collect2: ld returned 1 exit status
configure:20248: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define DRI2 1
| #define WITH_LIBDRM 1
| #define DRI2_AIGLX 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH "/usr/lib/dri"
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
| /* Define SHA1Init to an innocuous variant, in case <limits.h> declares S=
HA1Init.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define SHA1Init innocuous_SHA1Init
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char SHA1Init (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef SHA1Init
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char SHA1Init ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_SHA1Init || defined __stub___SHA1Init
| choke me
| #endif
|=20
| int
| main ()
| {
| return SHA1Init ();
|   ;
|   return 0;
| }
configure:20248: result: no
configure:20265: checking for CC_SHA1_Init
configure:20265: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lm  >&5
/tmp/ccWsDBFR.o: In function `main':
/home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86-lite-1.10.1-r0/xo=
rg-server-1.10.1/conftest.c:171: undefined reference to `CC_SHA1_Init'
collect2: ld returned 1 exit status
configure:20265: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define DRI2 1
| #define WITH_LIBDRM 1
| #define DRI2_AIGLX 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH "/usr/lib/dri"
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
| /* Define CC_SHA1_Init to an innocuous variant, in case <limits.h> declar=
es CC_SHA1_Init.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define CC_SHA1_Init innocuous_CC_SHA1_Init
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char CC_SHA1_Init (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef CC_SHA1_Init
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char CC_SHA1_Init ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_CC_SHA1_Init || defined __stub___CC_SHA1_Init
| choke me
| #endif
|=20
| int
| main ()
| {
| return CC_SHA1_Init ();
|   ;
|   return 0;
| }
configure:20265: result: no
configure:20282: checking for SHA1Init in -lmd
configure:20307: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lmd  -lm  >&5
/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/g=
cc/i586-poky-linux/4.6.0/ld: cannot find -lmd
collect2: ld returned 1 exit status
configure:20307: $? =3D 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "xorg-server"
| #define PACKAGE_TARNAME "xorg-server"
| #define PACKAGE_VERSION "1.10.1"
| #define PACKAGE_STRING "xorg-server 1.10.1"
| #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?pro=
duct=3Dxorg"
| #define PACKAGE_URL ""
| #define PACKAGE "xorg-server"
| #define VERSION "1.10.1"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define PACKAGE_VERSION_MAJOR 1
| #define PACKAGE_VERSION_MINOR 10
| #define PACKAGE_VERSION_PATCHLEVEL 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define YYTEXT_POINTER 1
| #define _FILE_OFFSET_BITS 64
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STROPTS_H 1
| #define HAVE_FNMATCH_H 1
| #define HAVE_SYS_UTSNAME_H 1
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_BYTESWAP_H 1
| #define HAVE_VPRINTF 1
| #define HAVE_GETEUID 1
| #define HAVE_GETUID 1
| #define HAVE_LINK 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_MKSTEMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRTOL 1
| #define HAVE_GETOPT 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_BACKTRACE 1
| #define HAVE_STRCASESTR 1
| #define HAVE_FFS 1
| #define HAVE_VASPRINTF 1
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define HAS_GETDTABLESIZE 1
| #define HAS_GETIFADDRS 1
| #define HAS_MMAP 1
| #define HAVE_LIBM 1
| #define HAVE_CBRT 1
| #define HAVE_LINUX_AGPGART_H 1
| #define HAVE_LINUX_APM_BIOS_H 1
| #define HAVE_LINUX_FB_H 1
| #define HAVE_ASM_MTRR_H 1
| #define HAS_MTRR_SUPPORT 1
| #define HAVE_SYSV_IPC 1
| #define HAVE_BACKTRACE 1
| #define HAVE_EXECINFO_H 1
| #define LAUNCHD_ID_PREFIX "org.x"
| #define TLS __thread
| #define RETSIGTYPE void
| #define UNIXCONN 1
| #define TCPCONN 1
| #define IPv6 1
| #define HAVE_SOCKLEN_T 1
| #define HAVE_AUTHDES_CREATE 1
| #define SECURE_RPC 1
| #define CONFIG_UDEV 1
| #define HAVE_DBUS 1
| #define USE_SIGIO_BY_DEFAULT TRUE
| #define XV 1
| #define XvExtension 1
| #define XvMCExtension 1
| #define XREGISTRY 1
| #define COMPOSITE 1
| #define MITSHM 1
| #define HAS_SHM 1
| #define SCREENSAVER 1
| #define RES 1
| #define DRI2 1
| #define WITH_LIBDRM 1
| #define DRI2_AIGLX 1
| #define XACE 1
| #define DBE 1
| #define DPMSExtension 1
| #define RENDER 1
| #define RANDR 1
| #define XFIXES 1
| #define DAMAGE 1
| #define XINPUT 1
| #define SHAPE 1
| #define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
| #define XKB_BIN_DIRECTORY "/usr/bin"
| #define XKM_OUTPUT_DIR "/var/lib/xkb/"
| #define XKB_DFLT_RULES "base"
| #define XKB_DFLT_MODEL "pc105"
| #define XKB_DFLT_LAYOUT "us"
| #define XKB_DFLT_VARIANT ""
| #define XKB_DFLT_OPTIONS ""
| #define XDMCP 1
| #define HASXDMAUTH 1
| #define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/fo=
nts/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/sha=
re/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
| #define PCI_TXT_IDS_PATH ""
| #define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
| #define BASE_FONT_PATH "/usr/share/fonts/X11"
| #define DRI_DRIVER_PATH "/usr/lib/dri"
| #define XVENDORNAME "The X.Org Foundation"
| #define XVENDORNAMESHORT "X.Org"
| #define XORG_DATE "2011-04-15"
| #define XORG_MAN_VERSION "Version 1.10.1"
| #define BUILDERADDR "xorg@lists.freedesktop.org"
| #define OSNAME "Linux 2.6.35-25-server x86_64"
| #define OSVENDOR ""
| #define BUILDERSTRING ""
| #define VENDOR_NAME "The X.Org Foundation"
| #define VENDOR_NAME_SHORT "X.Org"
| #define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000)=
 + 0)
| #define VENDOR_MAN_VERSION "Version 1.10.1"
| #define NO_LIBCWRAPPER 1
| #define XTEST 1
| #define XSYNC 1
| #define XCMISC 1
| #define BIGREQS 1
| /* end confdefs.h.  */
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char SHA1Init ();
| int
| main ()
| {
| return SHA1Init ();
|   ;
|   return 0;
| }
configure:20316: result: no
configure:20336: checking for LIBSHA1
configure:20343: $PKG_CONFIG --exists --print-errors "libsha1"
Package libsha1 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsha1.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsha1' found
configure:20346: $? =3D 1
configure:20359: $PKG_CONFIG --exists --print-errors "libsha1"
Package libsha1 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsha1.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsha1' found
configure:20362: $? =3D 1
configure:20375: result: no
No package 'libsha1' found
configure:20415: checking for gcry_md_open in -lgcrypt
configure:20440: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lgcrypt  -lm  =
>&5
configure:20440: $? =3D 0
configure:20449: result: yes
configure:20468: checking for SHA1_Init in -lcrypto
configure:20493: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest -O2 -pipe -g -felimin=
ate-unused-debug-types  -Wl,-O1  -Wl,--as-needed conftest.c -lcrypto  -lm  =
>&5
configure:20493: $? =3D 0
configure:20502: result: yes
configure:20510: checking for OPENSSL
configure:20517: $PKG_CONFIG --exists --print-errors "openssl"
configure:20520: $? =3D 0
configure:20533: $PKG_CONFIG --exists --print-errors "openssl"
configure:20536: $? =3D 0
configure:20573: result: yes
configure:20594: checking for SHA1 implementation
configure:20599: result: libgcrypt
configure:20606: checking for XSERVERCFLAGS
configure:20613: $PKG_CONFIG --exists --print-errors "$REQUIRED_MODULES $RE=
QUIRED_LIBS"
configure:20616: $? =3D 0
configure:20629: $PKG_CONFIG --exists --print-errors "$REQUIRED_MODULES $RE=
QUIRED_LIBS"
configure:20632: $? =3D 0
configure:20689: result: yes
configure:20695: checking for XSERVERLIBS
configure:20702: $PKG_CONFIG --exists --print-errors "$REQUIRED_LIBS"
configure:20705: $? =3D 0
configure:20718: $PKG_CONFIG --exists --print-errors "$REQUIRED_LIBS"
configure:20721: $? =3D 0
configure:20778: result: yes
configure:20813: checking if SVR4 needs to be defined
configure:20832: result: no
configure:20842: checking whether to build Xvfb DDX
configure:20844: result: no
configure:20866: checking for XNESTMODULES
configure:20873: $PKG_CONFIG --exists --print-errors "$LIBXEXT x11 xau $XDM=
CP_MODULES"
configure:20876: $? =3D 0
configure:20889: $PKG_CONFIG --exists --print-errors "$LIBXEXT x11 xau $XDM=
CP_MODULES"
configure:20892: $? =3D 0
configure:20929: result: yes
configure:20933: checking whether to build Xnest DDX
configure:20938: result: no
configure:20961: checking whether to build Xorg DDX
configure:20970: result: yes
configure:20987: checking for symbol visibility support
configure:21023: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types -fvisibility=3Dhidden  conftest.c >&5
configure:21023: $? =3D 0
configure:21031: result: yes
configure:21043: checking for PCIACCESS
configure:21050: $PKG_CONFIG --exists --print-errors "$LIBPCIACCESS"
configure:21053: $? =3D 0
configure:21066: $PKG_CONFIG --exists --print-errors "$LIBPCIACCESS"
configure:21069: $? =3D 0
configure:21126: result: yes
configure:21136: checking for pci_system_init_dev_mem
configure:21136: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest    -Wl,-O1  -Wl,--as-=
needed conftest.c -lpciaccess   >&5
configure:21136: $? =3D 0
configure:21136: result: yes
configure:21147: checking for pci_device_enable
configure:21147: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest    -Wl,-O1  -Wl,--as-=
needed conftest.c -lpciaccess   >&5
configure:21147: $? =3D 0
configure:21147: result: yes
configure:21158: checking for pci_device_is_boot_vga
configure:21158: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest    -Wl,-O1  -Wl,--as-=
needed conftest.c -lpciaccess   >&5
configure:21158: $? =3D 0
configure:21158: result: yes
configure:21169: checking for pci_device_vgaarb_init
configure:21169: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -o conftest    -Wl,-O1  -Wl,--as-=
needed conftest.c -lpciaccess   >&5
configure:21169: $? =3D 0
configure:21169: result: yes
configure:21530: checking for XF86VIDMODE
configure:21537: $PKG_CONFIG --exists --print-errors "$VIDMODEPROTO"
configure:21540: $? =3D 0
configure:21553: $PKG_CONFIG --exists --print-errors "$VIDMODEPROTO"
configure:21556: $? =3D 0
configure:21593: result: yes
configure:21602: checking for XF86VIDMODE
configure:21685: result: yes
configure:21697: checking for XORG_MODULES
configure:21704: $PKG_CONFIG --exists --print-errors "$XORG_MODULES"
configure:21707: $? =3D 0
configure:21720: $PKG_CONFIG --exists --print-errors "$XORG_MODULES"
configure:21723: $? =3D 0
configure:21780: result: yes
configure:21796: checking for perl
configure:21814: found /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bi=
n/perl
configure:21827: result: /home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/=
bin/perl
configure:22103: checking whether to build XWin DDX
configure:22112: result: no
configure:22737: checking dependency style of $(CC)
configure:22845: result: none
configure:22887: checking for DMXMODULES
configure:22894: $PKG_CONFIG --exists --print-errors "xmuu $LIBXEXT x11 xre=
nder xfixes $LIBXI $DMXPROTO xau $XDMCP_MODULES"
configure:22897: $? =3D 0
configure:22910: $PKG_CONFIG --exists --print-errors "xmuu $LIBXEXT x11 xre=
nder xfixes $LIBXI $DMXPROTO xau $XDMCP_MODULES"
configure:22913: $? =3D 0
configure:22950: result: yes
configure:22954: checking for XDMXCONFIG_DEP
configure:22961: $PKG_CONFIG --exists --print-errors "xaw7 xmu xt xpm x11"
Package xaw7 was not found in the pkg-config search path.
Perhaps you should add the directory containing `xaw7.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xaw7' found
Package xpm was not found in the pkg-config search path.
Perhaps you should add the directory containing `xpm.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xpm' found
configure:22964: $? =3D 1
configure:22977: $PKG_CONFIG --exists --print-errors "xaw7 xmu xt xpm x11"
Package xaw7 was not found in the pkg-config search path.
Perhaps you should add the directory containing `xaw7.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xaw7' found
Package xpm was not found in the pkg-config search path.
Perhaps you should add the directory containing `xpm.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xpm' found
configure:22980: $? =3D 1
configure:22993: result: no
No package 'xaw7' found
No package 'xpm' found
configure:23022: checking whether to build Xdmx DDX
configure:23031: result: no
configure:24095: i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86 -std=3Dgnu99 -c -O2 -pipe -g -feliminate-unuse=
d-debug-types  conftest.c >&5
configure:24095: $? =3D 0
configure:24674: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by xorg-server config.status 1.10.1, which was
generated by GNU Autoconf 2.65.  Invocation command line was

  CONFIG_FILES    =3D=20
  CONFIG_HEADERS  =3D=20
  CONFIG_LINKS    =3D=20
  CONFIG_COMMANDS =3D=20
  $ ./config.status=20

on kyu3-ubuntu

config.status:1759: creating Makefile
config.status:1759: creating glx/Makefile
config.status:1759: creating include/Makefile
config.status:1759: creating composite/Makefile
config.status:1759: creating damageext/Makefile
config.status:1759: creating dbe/Makefile
config.status:1759: creating dix/Makefile
config.status:1759: creating doc/Makefile
config.status:1759: creating doc/man/Makefile
config.status:1759: creating doc/xml/Makefile
config.status:1759: creating doc/xml/dtrace/Makefile
config.status:1759: creating doc/xml/xserver.ent
config.status:1759: creating fb/Makefile
config.status:1759: creating record/Makefile
config.status:1759: creating config/Makefile
config.status:1759: creating mi/Makefile
config.status:1759: creating miext/Makefile
config.status:1759: creating miext/sync/Makefile
config.status:1759: creating miext/damage/Makefile
config.status:1759: creating miext/shadow/Makefile
config.status:1759: creating miext/cw/Makefile
config.status:1759: creating miext/rootless/Makefile
config.status:1759: creating os/Makefile
config.status:1759: creating randr/Makefile
config.status:1759: creating render/Makefile
config.status:1759: creating xkb/Makefile
config.status:1759: creating Xext/Makefile
config.status:1759: creating Xi/Makefile
config.status:1759: creating xfixes/Makefile
config.status:1759: creating exa/Makefile
config.status:1759: creating hw/Makefile
config.status:1759: creating hw/xfree86/Makefile
config.status:1759: creating hw/xfree86/common/Makefile
config.status:1759: creating hw/xfree86/common/xf86Build.h
config.status:1759: creating hw/xfree86/ddc/Makefile
config.status:1759: creating hw/xfree86/dixmods/Makefile
config.status:1759: creating hw/xfree86/dixmods/extmod/Makefile
config.status:1759: creating hw/xfree86/doc/Makefile
config.status:1759: creating hw/xfree86/doc/devel/Makefile
config.status:1759: creating hw/xfree86/doc/man/Makefile
config.status:1759: creating hw/xfree86/doc/sgml/Makefile
config.status:1759: creating hw/xfree86/dri/Makefile
config.status:1759: creating hw/xfree86/dri2/Makefile
config.status:1759: creating hw/xfree86/exa/Makefile
config.status:1759: creating hw/xfree86/exa/man/Makefile
config.status:1759: creating hw/xfree86/fbdevhw/Makefile
config.status:1759: creating hw/xfree86/fbdevhw/man/Makefile
config.status:1759: creating hw/xfree86/i2c/Makefile
config.status:1759: creating hw/xfree86/int10/Makefile
config.status:1759: creating hw/xfree86/loader/Makefile
config.status:1759: creating hw/xfree86/modes/Makefile
config.status:1759: creating hw/xfree86/os-support/Makefile
config.status:1759: creating hw/xfree86/os-support/bsd/Makefile
config.status:1759: creating hw/xfree86/os-support/bus/Makefile
config.status:1759: creating hw/xfree86/os-support/hurd/Makefile
config.status:1759: creating hw/xfree86/os-support/misc/Makefile
config.status:1759: creating hw/xfree86/os-support/linux/Makefile
config.status:1759: creating hw/xfree86/os-support/solaris/Makefile
config.status:1759: creating hw/xfree86/parser/Makefile
config.status:1759: creating hw/xfree86/ramdac/Makefile
config.status:1759: creating hw/xfree86/shadowfb/Makefile
config.status:1759: creating hw/xfree86/vbe/Makefile
config.status:1759: creating hw/xfree86/vgahw/Makefile
config.status:1759: creating hw/xfree86/x86emu/Makefile
config.status:1759: creating hw/xfree86/xaa/Makefile
config.status:1759: creating hw/xfree86/utils/Makefile
config.status:1759: creating hw/xfree86/utils/man/Makefile
config.status:1759: creating hw/xfree86/utils/cvt/Makefile
config.status:1759: creating hw/xfree86/utils/gtf/Makefile
config.status:1759: creating hw/dmx/config/Makefile
config.status:1759: creating hw/dmx/config/man/Makefile
config.status:1759: creating hw/dmx/doc/Makefile
config.status:1759: creating hw/dmx/doc/doxygen.conf
config.status:1759: creating hw/dmx/examples/Makefile
config.status:1759: creating hw/dmx/input/Makefile
config.status:1759: creating hw/dmx/glxProxy/Makefile
config.status:1759: creating hw/dmx/Makefile
config.status:1759: creating hw/dmx/man/Makefile
config.status:1759: creating hw/vfb/Makefile
config.status:1759: creating hw/vfb/man/Makefile
config.status:1759: creating hw/xnest/Makefile
config.status:1759: creating hw/xnest/man/Makefile
config.status:1759: creating hw/xwin/Makefile
config.status:1759: creating hw/xwin/glx/Makefile
config.status:1759: creating hw/xwin/man/Makefile
config.status:1759: creating hw/xquartz/Makefile
config.status:1759: creating hw/xquartz/GL/Makefile
config.status:1759: creating hw/xquartz/bundle/Makefile
config.status:1759: creating hw/xquartz/man/Makefile
config.status:1759: creating hw/xquartz/mach-startup/Makefile
config.status:1759: creating hw/xquartz/pbproxy/Makefile
config.status:1759: creating hw/xquartz/xpr/Makefile
config.status:1759: creating hw/kdrive/Makefile
config.status:1759: creating hw/kdrive/ephyr/Makefile
config.status:1759: creating hw/kdrive/ephyr/man/Makefile
config.status:1759: creating hw/kdrive/fake/Makefile
config.status:1759: creating hw/kdrive/fbdev/Makefile
config.status:1759: creating hw/kdrive/linux/Makefile
config.status:1759: creating hw/kdrive/src/Makefile
config.status:1759: creating test/Makefile
config.status:1759: creating test/xi2/Makefile
config.status:1759: creating xorg-server.pc
config.status:1759: creating include/do-not-use-config.h
config.status:1759: creating include/xorg-server.h
config.status:1759: creating include/dix-config.h
config.status:1759: creating include/xorg-config.h
config.status:1759: creating include/xkb-config.h
config.status:1759: creating include/xwin-config.h
config.status:1759: creating include/kdrive-config.h
config.status:1759: creating include/version-config.h
config.status:1979: executing depfiles commands
config.status:1979: executing libtool commands
config.status:1979: executing sdksyms commands
configure:27006: WARNING: unrecognized options: --disable-acfb, --disable-c=
cfb, --disable-mcfb, --disable-xf86misc, --disable-xorgcfg, --with-fontdir

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv___va_copy=3Dyes
ac_cv_af_unix_large_dgram=3Dyes
ac_cv_alignof_CORBA_boolean=3D1
ac_cv_alignof_CORBA_char=3D1
ac_cv_alignof_CORBA_double=3D4
ac_cv_alignof_CORBA_float=3D4
ac_cv_alignof_CORBA_long=3D4
ac_cv_alignof_CORBA_long_double=3D4
ac_cv_alignof_CORBA_long_long=3D4
ac_cv_alignof_CORBA_octet=3D1
ac_cv_alignof_CORBA_pointer=3D4
ac_cv_alignof_CORBA_short=3D2
ac_cv_alignof_CORBA_struct=3D4
ac_cv_alignof_CORBA_wchar=3D2
ac_cv_asm_mtrr_h=3Dyes
ac_cv_build=3Dx86_64-pc-linux-gnu
ac_cv_c_bigendian=3Dno
ac_cv_c_compiler_gnu=3Dyes
ac_cv_c_const=3Dyes
ac_cv_c_littleendian=3Dyes
ac_cv_c_long_double=3Dyes
ac_cv_check_sjlj=3Dssjlj
ac_cv_conv_longlong_to_float=3Dyes
ac_cv_dirent_have_space_d_name=3Dyes
ac_cv_env_CCASFLAGS_set=3D
ac_cv_env_CCASFLAGS_value=3D
ac_cv_env_CCAS_set=3D
ac_cv_env_CCAS_value=3D
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3D'i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/k=
yu3/sdb/test/tmp/sysroots/qemux86'
ac_cv_env_CFLAGS_set=3Dset
ac_cv_env_CFLAGS_value=3D'-O2 -pipe -g -feliminate-unused-debug-types'
ac_cv_env_CPPFLAGS_set=3D
ac_cv_env_CPPFLAGS_value=3D
ac_cv_env_CPP_set=3Dset
ac_cv_env_CPP_value=3D'i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/te=
st/tmp/sysroots/qemux86'
ac_cv_env_DBUS_CFLAGS_set=3D
ac_cv_env_DBUS_CFLAGS_value=3D
ac_cv_env_DBUS_LIBS_set=3D
ac_cv_env_DBUS_LIBS_value=3D
ac_cv_env_DGA_CFLAGS_set=3D
ac_cv_env_DGA_CFLAGS_value=3D
ac_cv_env_DGA_LIBS_set=3D
ac_cv_env_DGA_LIBS_value=3D
ac_cv_env_DMXEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DMXMODULES_CFLAGS_set=3D
ac_cv_env_DMXMODULES_CFLAGS_value=3D
ac_cv_env_DMXMODULES_LIBS_set=3D
ac_cv_env_DMXMODULES_LIBS_value=3D
ac_cv_env_DMXXIEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXXIEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXXIEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXXIEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_DMXXMUEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_DOXYGEN_set=3D
ac_cv_env_DOXYGEN_value=3D
ac_cv_env_DRI2PROTO_CFLAGS_set=3D
ac_cv_env_DRI2PROTO_CFLAGS_value=3D
ac_cv_env_DRI2PROTO_LIBS_set=3D
ac_cv_env_DRI2PROTO_LIBS_value=3D
ac_cv_env_DRIPROTO_CFLAGS_set=3D
ac_cv_env_DRIPROTO_CFLAGS_value=3D
ac_cv_env_DRIPROTO_LIBS_set=3D
ac_cv_env_DRIPROTO_LIBS_value=3D
ac_cv_env_DRI_CFLAGS_set=3D
ac_cv_env_DRI_CFLAGS_value=3D
ac_cv_env_DRI_LIBS_set=3D
ac_cv_env_DRI_LIBS_value=3D
ac_cv_env_FOP_set=3D
ac_cv_env_FOP_value=3D
ac_cv_env_GLIB_CFLAGS_set=3D
ac_cv_env_GLIB_CFLAGS_value=3D
ac_cv_env_GLIB_LIBS_set=3D
ac_cv_env_GLIB_LIBS_value=3D
ac_cv_env_GL_CFLAGS_set=3D
ac_cv_env_GL_CFLAGS_value=3D
ac_cv_env_GL_LIBS_set=3D
ac_cv_env_GL_LIBS_value=3D
ac_cv_env_HAL_CFLAGS_set=3D
ac_cv_env_HAL_CFLAGS_value=3D
ac_cv_env_HAL_LIBS_set=3D
ac_cv_env_HAL_LIBS_value=3D
ac_cv_env_LDFLAGS_set=3Dset
ac_cv_env_LDFLAGS_value=3D'-Wl,-O1  -Wl,--as-needed'
ac_cv_env_LIBDRM_CFLAGS_set=3D
ac_cv_env_LIBDRM_CFLAGS_value=3D
ac_cv_env_LIBDRM_LIBS_set=3D
ac_cv_env_LIBDRM_LIBS_value=3D
ac_cv_env_LIBSHA1_CFLAGS_set=3D
ac_cv_env_LIBSHA1_CFLAGS_value=3D
ac_cv_env_LIBSHA1_LIBS_set=3D
ac_cv_env_LIBSHA1_LIBS_value=3D
ac_cv_env_LIBS_set=3D
ac_cv_env_LIBS_value=3D
ac_cv_env_OPENSSL_CFLAGS_set=3D
ac_cv_env_OPENSSL_CFLAGS_value=3D
ac_cv_env_OPENSSL_LIBS_set=3D
ac_cv_env_OPENSSL_LIBS_value=3D
ac_cv_env_PCIACCESS_CFLAGS_set=3D
ac_cv_env_PCIACCESS_CFLAGS_value=3D
ac_cv_env_PCIACCESS_LIBS_set=3D
ac_cv_env_PCIACCESS_LIBS_value=3D
ac_cv_env_PIXMAN_CFLAGS_set=3D
ac_cv_env_PIXMAN_CFLAGS_value=3D
ac_cv_env_PIXMAN_LIBS_set=3D
ac_cv_env_PIXMAN_LIBS_value=3D
ac_cv_env_PKG_CONFIG_LIBDIR_set=3Dset
ac_cv_env_PKG_CONFIG_LIBDIR_value=3D/home/kyu3/sdb/test/tmp/sysroots/qemux8=
6//usr/lib/pkgconfig
ac_cv_env_PKG_CONFIG_PATH_set=3Dset
ac_cv_env_PKG_CONFIG_PATH_value=3D/home/kyu3/sdb/test/tmp/sysroots/qemux86/=
/usr/lib/pkgconfig:/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/share/pkgco=
nfig
ac_cv_env_PKG_CONFIG_set=3D
ac_cv_env_PKG_CONFIG_value=3D
ac_cv_env_SELINUX_CFLAGS_set=3D
ac_cv_env_SELINUX_CFLAGS_value=3D
ac_cv_env_SELINUX_LIBS_set=3D
ac_cv_env_SELINUX_LIBS_value=3D
ac_cv_env_TSLIB_CFLAGS_set=3D
ac_cv_env_TSLIB_CFLAGS_value=3D
ac_cv_env_TSLIB_LIBS_set=3D
ac_cv_env_TSLIB_LIBS_value=3D
ac_cv_env_UDEV_CFLAGS_set=3D
ac_cv_env_UDEV_CFLAGS_value=3D
ac_cv_env_UDEV_LIBS_set=3D
ac_cv_env_UDEV_LIBS_value=3D
ac_cv_env_WINDOWSWM_CFLAGS_set=3D
ac_cv_env_WINDOWSWM_CFLAGS_value=3D
ac_cv_env_WINDOWSWM_LIBS_set=3D
ac_cv_env_WINDOWSWM_LIBS_value=3D
ac_cv_env_X11EXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_X11EXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_X11EXAMPLES_DEP_LIBS_set=3D
ac_cv_env_X11EXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XDMCP_CFLAGS_set=3D
ac_cv_env_XDMCP_CFLAGS_value=3D
ac_cv_env_XDMCP_LIBS_set=3D
ac_cv_env_XDMCP_LIBS_value=3D
ac_cv_env_XDMXCONFIG_DEP_CFLAGS_set=3D
ac_cv_env_XDMXCONFIG_DEP_CFLAGS_value=3D
ac_cv_env_XDMXCONFIG_DEP_LIBS_set=3D
ac_cv_env_XDMXCONFIG_DEP_LIBS_value=3D
ac_cv_env_XEPHYR_CFLAGS_set=3D
ac_cv_env_XEPHYR_CFLAGS_value=3D
ac_cv_env_XEPHYR_LIBS_set=3D
ac_cv_env_XEPHYR_LIBS_value=3D
ac_cv_env_XF86VIDMODE_CFLAGS_set=3D
ac_cv_env_XF86VIDMODE_CFLAGS_value=3D
ac_cv_env_XF86VIDMODE_LIBS_set=3D
ac_cv_env_XF86VIDMODE_LIBS_value=3D
ac_cv_env_XLIB_CFLAGS_set=3D
ac_cv_env_XLIB_CFLAGS_value=3D
ac_cv_env_XLIB_LIBS_set=3D
ac_cv_env_XLIB_LIBS_value=3D
ac_cv_env_XMLTO_set=3D
ac_cv_env_XMLTO_value=3D
ac_cv_env_XNESTMODULES_CFLAGS_set=3D
ac_cv_env_XNESTMODULES_CFLAGS_value=3D
ac_cv_env_XNESTMODULES_LIBS_set=3D
ac_cv_env_XNESTMODULES_LIBS_value=3D
ac_cv_env_XORG_MODULES_CFLAGS_set=3D
ac_cv_env_XORG_MODULES_CFLAGS_value=3D
ac_cv_env_XORG_MODULES_LIBS_set=3D
ac_cv_env_XORG_MODULES_LIBS_value=3D
ac_cv_env_XPBPROXY_CFLAGS_set=3D
ac_cv_env_XPBPROXY_CFLAGS_value=3D
ac_cv_env_XPBPROXY_LIBS_set=3D
ac_cv_env_XPBPROXY_LIBS_value=3D
ac_cv_env_XRESEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_XRESEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_XRESEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_XRESEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XSERVERCFLAGS_CFLAGS_set=3D
ac_cv_env_XSERVERCFLAGS_CFLAGS_value=3D
ac_cv_env_XSERVERCFLAGS_LIBS_set=3D
ac_cv_env_XSERVERCFLAGS_LIBS_value=3D
ac_cv_env_XSERVERLIBS_CFLAGS_set=3D
ac_cv_env_XSERVERLIBS_CFLAGS_value=3D
ac_cv_env_XSERVERLIBS_LIBS_set=3D
ac_cv_env_XSERVERLIBS_LIBS_value=3D
ac_cv_env_XTSTEXAMPLES_DEP_CFLAGS_set=3D
ac_cv_env_XTSTEXAMPLES_DEP_CFLAGS_value=3D
ac_cv_env_XTSTEXAMPLES_DEP_LIBS_set=3D
ac_cv_env_XTSTEXAMPLES_DEP_LIBS_value=3D
ac_cv_env_XWINMODULES_CFLAGS_set=3D
ac_cv_env_XWINMODULES_CFLAGS_value=3D
ac_cv_env_XWINMODULES_LIBS_set=3D
ac_cv_env_XWINMODULES_LIBS_value=3D
ac_cv_env_YACC_set=3D
ac_cv_env_YACC_value=3D
ac_cv_env_YFLAGS_set=3D
ac_cv_env_YFLAGS_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Dx86_64-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Di586-poky-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Di586-poky-linux
ac_cv_epoll_works=3Dyes
ac_cv_file__dev_random=3Dyes
ac_cv_file__usr_share_X11_sgml_defs_ent=3Dno
ac_cv_file__usr_share_sgml_X11_defs_ent=3Dno
ac_cv_file_lib_src_libmad_frame_h=3Dno
ac_cv_func_CC_SHA1_Init=3Dno
ac_cv_func_SHA1Init=3Dno
ac_cv_func___adjtimex=3Dyes
ac_cv_func___argz_count=3Dyes
ac_cv_func___argz_next=3Dyes
ac_cv_func___argz_stringify=3Dyes
ac_cv_func___fpending=3Dyes
ac_cv_func___fsetlocking=3Dyes
ac_cv_func___progname=3Dyes
ac_cv_func___secure_getenv=3Dyes
ac_cv_func___va_copy=3Dyes
ac_cv_func__doprnt=3Dno
ac_cv_func__obstack_free=3Dyes
ac_cv_func__setjmp=3Dyes
ac_cv_func__sys_siglist=3Dyes
ac_cv_func_a64l=3Dyes
ac_cv_func_abs=3Dyes
ac_cv_func_access=3Dyes
ac_cv_func_alarm=3Dyes
ac_cv_func_alloca_works=3Dyes
ac_cv_func_alphasort=3Dyes
ac_cv_func_argz_append=3Dyes
ac_cv_func_argz_create_sep=3Dyes
ac_cv_func_argz_insert=3Dyes
ac_cv_func_argz_next=3Dyes
ac_cv_func_argz_stringify=3Dyes
ac_cv_func_asprintf=3Dyes
ac_cv_func_atexit=3Dyes
ac_cv_func_atof=3Dyes
ac_cv_func_atoi=3Dyes
ac_cv_func_authdes_create=3Dyes
ac_cv_func_authdes_seccreate=3Dno
ac_cv_func_backtrace=3Dyes
ac_cv_func_bcmp=3Dyes
ac_cv_func_bcopy=3Dyes
ac_cv_func_bind_textdomain_codeset=3Dyes
ac_cv_func_bindresvport=3Dyes
ac_cv_func_btowc=3Dyes
ac_cv_func_bzero=3Dyes
ac_cv_func_calloc=3Dyes
ac_cv_func_canonicalize_file_name=3Dyes
ac_cv_func_catgets=3Dyes
ac_cv_func_cfgetospeed=3Dyes
ac_cv_func_cfsetispeed=3Dyes
ac_cv_func_cfsetspeed=3Dyes
ac_cv_func_chmod=3Dyes
ac_cv_func_chown=3Dyes
ac_cv_func_chroot=3Dyes
ac_cv_func_clock=3Dyes
ac_cv_func_clock_gettime=3Dno
ac_cv_func_close=3Dyes
ac_cv_func_closedir=3Dyes
ac_cv_func_closelog=3Dyes
ac_cv_func_confstr=3Dyes
ac_cv_func_connect=3Dyes
ac_cv_func_daemon=3Dyes
ac_cv_func_dcgettext=3Dyes
ac_cv_func_difftime=3Dyes
ac_cv_func_dirfd=3Dyes
ac_cv_func_dirname=3Dyes
ac_cv_func_dlopen=3Dno
ac_cv_func_dngettext=3Dyes
ac_cv_func_dup2=3Dyes
ac_cv_func_ecvt=3Dyes
ac_cv_func_endgrent=3Dyes
ac_cv_func_endmntent=3Dyes
ac_cv_func_endpwent=3Dyes
ac_cv_func_endutent=3Dyes
ac_cv_func_endutxent=3Dyes
ac_cv_func_epoll_ctl=3Dyes
ac_cv_func_err=3Dyes
ac_cv_func_ether_hostton=3Dyes
ac_cv_func_ether_ntohost=3Dyes
ac_cv_func_euidaccess=3Dyes
ac_cv_func_execv=3Dyes
ac_cv_func_fchdir=3Dyes
ac_cv_func_fchmod=3Dyes
ac_cv_func_fchmodat=3Dyes
ac_cv_func_fchown=3Dyes
ac_cv_func_fchownat=3Dyes
ac_cv_func_fcntl=3Dyes
ac_cv_func_fcvt=3Dyes
ac_cv_func_fdatasync=3Dyes
ac_cv_func_fdopendir=3Dyes
ac_cv_func_feof_unlocked=3Dyes
ac_cv_func_ffs=3Dyes
ac_cv_func_fgets_unlocked=3Dyes
ac_cv_func_fgetxattr=3Dyes
ac_cv_func_finite=3Dyes
ac_cv_func_flistxattr=3Dyes
ac_cv_func_flock=3Dyes
ac_cv_func_flockfile=3Dyes
ac_cv_func_fnmatch=3Dyes
ac_cv_func_fnmatch_works=3Dyes
ac_cv_func_fork=3Dyes
ac_cv_func_fpathconf=3Dyes
ac_cv_func_fprintf=3Dyes
ac_cv_func_free=3Dyes
ac_cv_func_freeaddrinfo=3Dyes
ac_cv_func_freeifaddrs=3Dyes
ac_cv_func_fseeko=3Dyes
ac_cv_func_fsetxattr=3Dyes
ac_cv_func_fstat64=3Dyes
ac_cv_func_fstat=3Dyes
ac_cv_func_fstatfs=3Dyes
ac_cv_func_fsync=3Dyes
ac_cv_func_ftello=3Dyes
ac_cv_func_ftime=3Dyes
ac_cv_func_ftruncate=3Dyes
ac_cv_func_funlockfile=3Dyes
ac_cv_func_futimes=3Dyes
ac_cv_func_futimesat=3Dyes
ac_cv_func_gai_strerror=3Dyes
ac_cv_func_gcvt=3Dyes
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_getc_unlocked=3Dyes
ac_cv_func_getcwd=3Dyes
ac_cv_func_getdelim=3Dyes
ac_cv_func_getdomainname=3Dyes
ac_cv_func_getdtablesize=3Dyes
ac_cv_func_getegid=3Dyes
ac_cv_func_getenv=3Dyes
ac_cv_func_geteuid=3Dyes
ac_cv_func_getgid=3Dyes
ac_cv_func_getgrent=3Dyes
ac_cv_func_getgrent_r=3Dyes
ac_cv_func_getgrgid_r=3Dyes
ac_cv_func_getgrnam=3Dyes
ac_cv_func_getgrnam_r=3Dyes
ac_cv_func_getgrouplist=3Dyes
ac_cv_func_getgroups=3Dyes
ac_cv_func_gethostbyaddr_r=3Dyes
ac_cv_func_gethostbyname2=3Dyes
ac_cv_func_gethostbyname=3Dyes
ac_cv_func_gethostbyname_r=3Dyes
ac_cv_func_gethostent=3Dyes
ac_cv_func_gethostid=3Dyes
ac_cv_func_gethostname=3Dyes
ac_cv_func_getifaddrs=3Dyes
ac_cv_func_getisax=3Dno
ac_cv_func_getline=3Dyes
ac_cv_func_getloadavg=3Dyes
ac_cv_func_getmntent=3Dyes
ac_cv_func_getmsg=3Dyes
ac_cv_func_getnameinfo=3Dyes
ac_cv_func_getnetbyaddr_r=3Dyes
ac_cv_func_getnetgrent_r=3Dyes
ac_cv_func_getopt=3Dyes
ac_cv_func_getopt_long=3Dyes
ac_cv_func_getopt_long_only=3Dyes
ac_cv_func_getpagesize=3Dyes
ac_cv_func_getpass=3Dyes
ac_cv_func_getpeereid=3Dno
ac_cv_func_getpeername=3Dyes
ac_cv_func_getpeerucred=3Dno
ac_cv_func_getpgrp=3Dyes
ac_cv_func_getpgrp_void=3Dyes
ac_cv_func_getpid=3Dyes
ac_cv_func_getppid=3Dyes
ac_cv_func_getprotoent_r=3Dyes
ac_cv_func_getpwent=3Dyes
ac_cv_func_getpwent_r=3Dyes
ac_cv_func_getpwnam=3Dyes
ac_cv_func_getpwnam_r=3Dyes
ac_cv_func_getpwuid=3Dyes
ac_cv_func_getpwuid_r=3Dyes
ac_cv_func_getresuid=3Dyes
ac_cv_func_getrlimit=3Dyes
ac_cv_func_getrusage=3Dyes
ac_cv_func_getservbyname=3Dyes
ac_cv_func_getservbyname_r=3Dyes
ac_cv_func_getservbyport_r=3Dyes
ac_cv_func_getservent=3Dyes
ac_cv_func_getservent_r=3Dyes
ac_cv_func_getspnam=3Dyes
ac_cv_func_getspnam_r=3Dyes
ac_cv_func_gettimeofday=3Dyes
ac_cv_func_getttyent=3Dyes
ac_cv_func_getttynam=3Dyes
ac_cv_func_getuid=3Dyes
ac_cv_func_getusershell=3Dyes
ac_cv_func_getutent=3Dyes
ac_cv_func_getutid=3Dyes
ac_cv_func_getutline=3Dyes
ac_cv_func_getutmp=3Dyes
ac_cv_func_getutmpx=3Dyes
ac_cv_func_getutxent=3Dyes
ac_cv_func_getutxid=3Dyes
ac_cv_func_getutxline=3Dyes
ac_cv_func_getwd=3Dyes
ac_cv_func_getxattr=3Dyes
ac_cv_func_getzoneid=3Dno
ac_cv_func_glob=3Dyes
ac_cv_func_gmtime=3Dyes
ac_cv_func_gmtime_r=3Dyes
ac_cv_func_grantpt=3Dyes
ac_cv_func_group_member=3Dyes
ac_cv_func_herror=3Dyes
ac_cv_func_hstrerror=3Dyes
ac_cv_func_iconv=3Dyes
ac_cv_func_iconv_open=3Dyes
ac_cv_func_if_freenameindex=3Dyes
ac_cv_func_if_indextoname=3Dyes
ac_cv_func_if_nameindex=3Dyes
ac_cv_func_if_nametoindex=3Dyes
ac_cv_func_index=3Dyes
ac_cv_func_inet_addr=3Dyes
ac_cv_func_inet_aton=3Dyes
ac_cv_func_inet_ntoa=3Dyes
ac_cv_func_inet_ntop=3Dyes
ac_cv_func_inet_pton=3Dyes
ac_cv_func_initgroups=3Dyes
ac_cv_func_innetgr=3Dyes
ac_cv_func_iruserok=3Dyes
ac_cv_func_isascii=3Dyes
ac_cv_func_isatty=3Dyes
ac_cv_func_isblank=3Dyes
ac_cv_func_isgraph=3Dyes
ac_cv_func_isinf=3Dyes
ac_cv_func_isnan=3Dyes
ac_cv_func_isprint=3Dyes
ac_cv_func_isspace=3Dyes
ac_cv_func_iswalnum=3Dyes
ac_cv_func_iswcntrl=3Dyes
ac_cv_func_iswctype=3Dyes
ac_cv_func_iswprint=3Dyes
ac_cv_func_iswspace=3Dyes
ac_cv_func_iswupper=3Dyes
ac_cv_func_isxdigit=3Dyes
ac_cv_func_kill=3Dyes
ac_cv_func_killpg=3Dyes
ac_cv_func_lchown=3Dyes
ac_cv_func_lckpwdf=3Dyes
ac_cv_func_lgetxattr=3Dyes
ac_cv_func_link=3Dyes
ac_cv_func_listxattr=3Dyes
ac_cv_func_llistxattr=3Dyes
ac_cv_func_localtime=3Dyes
ac_cv_func_localtime_r=3Dyes
ac_cv_func_lockf=3Dyes
ac_cv_func_lrand48=3Dyes
ac_cv_func_lsearch=3Dyes
ac_cv_func_lseek64=3Dyes
ac_cv_func_lsetxattr=3Dyes
ac_cv_func_lstat=3Dyes
ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
ac_cv_func_lstat_empty_string_bug=3Dno
ac_cv_func_mallinfo=3Dyes
ac_cv_func_malloc=3Dyes
ac_cv_func_malloc_0_nonnull=3Dyes
ac_cv_func_malloc_works=3Dyes
ac_cv_func_mblen=3Dyes
ac_cv_func_mbrlen=3Dyes
ac_cv_func_mbrtowc=3Dyes
ac_cv_func_mbsinit=3Dyes
ac_cv_func_mbsrtowcs=3Dyes
ac_cv_func_mbtowc=3Dyes
ac_cv_func_memalign=3Dyes
ac_cv_func_memchr=3Dyes
ac_cv_func_memcmp=3Dyes
ac_cv_func_memcmp_working=3Dyes
ac_cv_func_memcpy=3Dyes
ac_cv_func_memmove=3Dyes
ac_cv_func_mempcpy=3Dyes
ac_cv_func_memrchr=3Dyes
ac_cv_func_memset=3Dyes
ac_cv_func_mkdir=3Dyes
ac_cv_func_mkdirat=3Dyes
ac_cv_func_mkdtemp=3Dyes
ac_cv_func_mkfifo=3Dyes
ac_cv_func_mknod=3Dyes
ac_cv_func_mkstemp64=3Dyes
ac_cv_func_mkstemp=3Dyes
ac_cv_func_mktime=3Dyes
ac_cv_func_mlock=3Dyes
ac_cv_func_mmap=3Dyes
ac_cv_func_mmap_fixed_mapped=3Dyes
ac_cv_func_mtrace=3Dyes
ac_cv_func_munlock=3Dyes
ac_cv_func_munmap=3Dyes
ac_cv_func_nanosleep=3Dyes
ac_cv_func_nice=3Dyes
ac_cv_func_nl_langinfo=3Dyes
ac_cv_func_ntp_adjtime=3Dyes
ac_cv_func_ntp_gettime=3Dyes
ac_cv_func_on_exit=3Dyes
ac_cv_func_open64=3Dyes
ac_cv_func_open=3Dyes
ac_cv_func_openat=3Dyes
ac_cv_func_opendir=3Dyes
ac_cv_func_openlog=3Dyes
ac_cv_func_pathconf=3Dyes
ac_cv_func_pci_device_enable=3Dyes
ac_cv_func_pci_device_is_boot_vga=3Dyes
ac_cv_func_pci_device_vgaarb_init=3Dyes
ac_cv_func_pci_system_init_dev_mem=3Dyes
ac_cv_func_pipe=3Dyes
ac_cv_func_poll=3Dyes
ac_cv_func_popen=3Dyes
ac_cv_func_posix_getgrgid_r=3Dyes
ac_cv_func_posix_getpwnam_r=3Dyes
ac_cv_func_posix_getpwuid_r=3Dyes
ac_cv_func_posix_memalign=3Dyes
ac_cv_func_prctl=3Dyes
ac_cv_func_pread=3Dyes
ac_cv_func_printf=3Dyes
ac_cv_func_printf_unix98=3Dyes
ac_cv_func_pselect=3Dyes
ac_cv_func_pthread_attr_getstack=3Dyes
ac_cv_func_pthread_key_delete=3Dyes
ac_cv_func_pthread_mutex_lock=3Dyes
ac_cv_func_ptsname=3Dyes
ac_cv_func_putenv=3Dyes
ac_cv_func_putgrent=3Dyes
ac_cv_func_putpwent=3Dyes
ac_cv_func_putspent=3Dyes
ac_cv_func_pututline=3Dyes
ac_cv_func_pututxline=3Dyes
ac_cv_func_putwc=3Dyes
ac_cv_func_pwrite=3Dyes
ac_cv_func_qsort=3Dyes
ac_cv_func_raise=3Dyes
ac_cv_func_rand=3Dyes
ac_cv_func_rand_r=3Dyes
ac_cv_func_random=3Dyes
ac_cv_func_re_comp=3Dyes
ac_cv_func_re_exec=3Dyes
ac_cv_func_re_search=3Dyes
ac_cv_func_read=3Dyes
ac_cv_func_readdir=3Dyes
ac_cv_func_readdir_r=3Dyes
ac_cv_func_readlink=3Dyes
ac_cv_func_realloc=3Dyes
ac_cv_func_realloc_0_nonnull=3Dyes
ac_cv_func_realpath=3Dyes
ac_cv_func_recvmsg=3Dyes
ac_cv_func_regcomp=3Dyes
ac_cv_func_regexec=3Dyes
ac_cv_func_remove=3Dyes
ac_cv_func_rename=3Dyes
ac_cv_func_rmdir=3Dyes
ac_cv_func_rpmatch=3Dyes
ac_cv_func_rresvport_af=3Dyes
ac_cv_func_ruserok=3Dyes
ac_cv_func_ruserok_af=3Dyes
ac_cv_func_sbrk=3Dyes
ac_cv_func_scandir=3Dyes
ac_cv_func_sched_setscheduler=3Dyes
ac_cv_func_sched_yield=3Dyes
ac_cv_func_select=3Dyes
ac_cv_func_semctl=3Dyes
ac_cv_func_semget=3Dyes
ac_cv_func_sendmsg=3Dyes
ac_cv_func_setbuf=3Dyes
ac_cv_func_setbuffer=3Dyes
ac_cv_func_setegid=3Dyes
ac_cv_func_setenv=3Dyes
ac_cv_func_seteuid=3Dyes
ac_cv_func_setgid=3Dyes
ac_cv_func_setgroups=3Dyes
ac_cv_func_sethostname=3Dyes
ac_cv_func_setitimer=3Dyes
ac_cv_func_setjmp=3Dyes
ac_cv_func_setlinebuf=3Dyes
ac_cv_func_setlocale=3Dyes
ac_cv_func_setmntent=3Dyes
ac_cv_func_setpgid=3Dyes
ac_cv_func_setpgrp=3Dyes
ac_cv_func_setpgrp_void=3Dyes
ac_cv_func_setpriority=3Dyes
ac_cv_func_setregid=3Dyes
ac_cv_func_setresgid=3Dyes
ac_cv_func_setresuid=3Dyes
ac_cv_func_setreuid=3Dyes
ac_cv_func_setrlimit=3Dyes
ac_cv_func_setsid=3Dyes
ac_cv_func_setsockopt=3Dyes
ac_cv_func_settimeofday=3Dyes
ac_cv_func_setuid=3Dyes
ac_cv_func_setutent=3Dyes
ac_cv_func_setutxent=3Dyes
ac_cv_func_setvbuf=3Dyes
ac_cv_func_setvbuf_reversed=3Dno
ac_cv_func_setxattr=3Dyes
ac_cv_func_sgetspent=3Dyes
ac_cv_func_shmat=3Dyes
ac_cv_func_shmctl64=3Dno
ac_cv_func_shmctl=3Dyes
ac_cv_func_shmdt=3Dyes
ac_cv_func_shmget=3Dyes
ac_cv_func_shutdown=3Dyes
ac_cv_func_sigaction=3Dyes
ac_cv_func_sigaddset=3Dyes
ac_cv_func_sigaltstack=3Dyes
ac_cv_func_sigblock=3Dyes
ac_cv_func_sigemptyset=3Dyes
ac_cv_func_sighold=3Dyes
ac_cv_func_siginterrupt=3Dyes
ac_cv_func_signal=3Dyes
ac_cv_func_sigprocmask=3Dyes
ac_cv_func_sigset=3Dyes
ac_cv_func_sigsetmask=3Dyes
ac_cv_func_sigstack=3Dyes
ac_cv_func_sigsuspend=3Dyes
ac_cv_func_sigvec=3Dyes
ac_cv_func_snprintf=3Dyes
ac_cv_func_snprintf_c99=3Dyes
ac_cv_func_socket=3Dyes
ac_cv_func_socketpair=3Dyes
ac_cv_func_sprintf=3Dyes
ac_cv_func_srand48=3Dyes
ac_cv_func_srand=3Dyes
ac_cv_func_srandom=3Dyes
ac_cv_func_sscanf=3Dyes
ac_cv_func_stat=3Dyes
ac_cv_func_stat_empty_string_bug=3Dno
ac_cv_func_stat_ignores_trailing_slash=3Dno
ac_cv_func_statfs=3Dyes
ac_cv_func_statvfs=3Dyes
ac_cv_func_stime=3Dyes
ac_cv_func_stpcpy=3Dyes
ac_cv_func_strcasecmp=3Dyes
ac_cv_func_strcasestr=3Dyes
ac_cv_func_strchr=3Dyes
ac_cv_func_strchrnul=3Dyes
ac_cv_func_strcmp=3Dyes
ac_cv_func_strcspn=3Dyes
ac_cv_func_strdup=3Dyes
ac_cv_func_strerror=3Dyes
ac_cv_func_strerror_r=3Dyes
ac_cv_func_strftime=3Dyes
ac_cv_func_strlcat=3Dno
ac_cv_func_strlcpy=3Dno
ac_cv_func_strlen=3Dyes
ac_cv_func_strncasecmp=3Dyes
ac_cv_func_strncmp=3Dyes
ac_cv_func_strndup=3Dyes
ac_cv_func_strnlen=3Dyes
ac_cv_func_strpbrk=3Dyes
ac_cv_func_strptime=3Dyes
ac_cv_func_strrchr=3Dyes
ac_cv_func_strsep=3Dyes
ac_cv_func_strsignal=3Dyes
ac_cv_func_strspn=3Dyes
ac_cv_func_strstr=3Dyes
ac_cv_func_strtod=3Dyes
ac_cv_func_strtoimax=3Dyes
ac_cv_func_strtok_r=3Dyes
ac_cv_func_strtol=3Dyes
ac_cv_func_strtoll=3Dyes
ac_cv_func_strtoul=3Dyes
ac_cv_func_strtoull=3Dyes
ac_cv_func_strtoumax=3Dyes
ac_cv_func_strverscmp=3Dyes
ac_cv_func_strxfrm=3Dyes
ac_cv_func_symlink=3Dyes
ac_cv_func_sync=3Dyes
ac_cv_func_sys_siglist=3Dyes
ac_cv_func_sysconf=3Dyes
ac_cv_func_sysctl=3Dyes
ac_cv_func_sysinfo=3Dyes
ac_cv_func_syslog=3Dyes
ac_cv_func_system=3Dyes
ac_cv_func_tcgetattr=3Dyes
ac_cv_func_tcgetpgrp=3Dyes
ac_cv_func_tcsetattr=3Dyes
ac_cv_func_tcsetpgrp=3Dyes
ac_cv_func_time=3Dyes
ac_cv_func_timegm=3Dyes
ac_cv_func_times=3Dyes
ac_cv_func_timezone=3Dyes
ac_cv_func_tmpnam=3Dyes
ac_cv_func_towlower=3Dyes
ac_cv_func_towupper=3Dyes
ac_cv_func_truncate=3Dyes
ac_cv_func_tsearch=3Dyes
ac_cv_func_ttyname=3Dyes
ac_cv_func_tzset=3Dyes
ac_cv_func_ulimit=3Dyes
ac_cv_func_umask=3Dyes
ac_cv_func_uname=3Dyes
ac_cv_func_unlink=3Dyes
ac_cv_func_unsetenv=3Dyes
ac_cv_func_unshare=3Dyes
ac_cv_func_updwtmp=3Dyes
ac_cv_func_updwtmpx=3Dyes
ac_cv_func_usleep=3Dyes
ac_cv_func_ustat=3Dyes
ac_cv_func_utime=3Dyes
ac_cv_func_utimes=3Dyes
ac_cv_func_utmpname=3Dyes
ac_cv_func_utmpxname=3Dyes
ac_cv_func_va_copy=3Dyes
ac_cv_func_valloc=3Dyes
ac_cv_func_vasprintf=3Dyes
ac_cv_func_verrx=3Dyes
ac_cv_func_vfork=3Dyes
ac_cv_func_vfprintf=3Dyes
ac_cv_func_vfscanf=3Dyes
ac_cv_func_vhangup=3Dyes
ac_cv_func_vprintf=3Dyes
ac_cv_func_vsnprintf=3Dyes
ac_cv_func_vsnprintf_c99=3Dyes
ac_cv_func_vsprintf=3Dyes
ac_cv_func_wait3=3Dyes
ac_cv_func_wait4=3Dyes
ac_cv_func_waitpid=3Dyes
ac_cv_func_walkcontext=3Dno
ac_cv_func_wcrtomb=3Dyes
ac_cv_func_wcscoll=3Dyes
ac_cv_func_wcsdup=3Dyes
ac_cv_func_wcslen=3Dyes
ac_cv_func_wctob=3Dyes
ac_cv_func_wctomb=3Dyes
ac_cv_func_wctype=3Dyes
ac_cv_func_wcwidth=3Dyes
ac_cv_func_wmemchr=3Dyes
ac_cv_func_wmemcpy=3Dyes
ac_cv_func_wmempcpy=3Dyes
ac_cv_have_abstract_sockets=3Dyes
ac_cv_have_accrights_in_msghdr=3Dno
ac_cv_have_broken_snprintf=3Dno
ac_cv_have_control_in_msghdr=3Dyes
ac_cv_have_decl_sys_siglist=3Dyes
ac_cv_have_openpty_ctty_bug=3Dyes
ac_cv_have_space_d_name_in_struct_dirent=3Dyes
ac_cv_header_aio_h=3Dyes
ac_cv_header_alloca_h=3Dyes
ac_cv_header_argz_h=3Dyes
ac_cv_header_arpa_inet_h=3Dyes
ac_cv_header_arpa_nameser_h=3Dyes
ac_cv_header_asm_byteorder_h=3Dyes
ac_cv_header_asm_ioctls_h=3Dyes
ac_cv_header_asm_mtrr_h=3Dyes
ac_cv_header_asm_page_h=3Dno
ac_cv_header_asm_types_h=3Dyes
ac_cv_header_assert_h=3Dyes
ac_cv_header_byteswap_h=3Dyes
ac_cv_header_crypt_h=3Dyes
ac_cv_header_ctype_h=3Dyes
ac_cv_header_dbm_h=3Dno
ac_cv_header_dirent_dirent_h=3Dyes
ac_cv_header_dirent_h=3Dyes
ac_cv_header_dlfcn_h=3Dyes
ac_cv_header_elf_h=3Dyes
ac_cv_header_endian_h=3Dyes
ac_cv_header_err_h=3Dyes
ac_cv_header_errno_h=3Dyes
ac_cv_header_execinfo_h=3Dyes
ac_cv_header_fcntl_h=3Dyes
ac_cv_header_features_h=3Dyes
ac_cv_header_float_h=3Dyes
ac_cv_header_fnmatch_h=3Dyes
ac_cv_header_fstab_h=3Dyes
ac_cv_header_ftw_h=3Dyes
ac_cv_header_getopt_h=3Dyes
ac_cv_header_glob_h=3Dyes
ac_cv_header_grp_h=3Dyes
ac_cv_header_iconv_h=3Dyes
ac_cv_header_ifaddrs_h=3Dyes
ac_cv_header_inttypes_h=3Dyes
ac_cv_header_langinfo_h=3Dyes
ac_cv_header_lastlog_h=3Dyes
ac_cv_header_libgen_h=3Dyes
ac_cv_header_libintl_h=3Dyes
ac_cv_header_limits_h=3Dyes
ac_cv_header_linux_agpgart_h=3Dyes
ac_cv_header_linux_apm_bios_h=3Dyes
ac_cv_header_linux_capability_h=3Dyes
ac_cv_header_linux_fb_h=3Dyes
ac_cv_header_linux_fd_h=3Dyes
ac_cv_header_linux_fs_h=3Dyes
ac_cv_header_linux_hayesesp_h=3Dno
ac_cv_header_linux_hdreg_h=3Dyes
ac_cv_header_linux_icmp_h=3Dyes
ac_cv_header_linux_in6_h=3Dyes
ac_cv_header_linux_joystick_h=3Dyes
ac_cv_header_linux_ptrace_h=3Dyes
ac_cv_header_linux_serial_h=3Dyes
ac_cv_header_linux_sonypi_h=3Dyes
ac_cv_header_linux_unistd_h=3Dyes
ac_cv_header_linux_utsname_h=3Dyes
ac_cv_header_linux_version_h=3Dyes
ac_cv_header_locale_h=3Dyes
ac_cv_header_machine_apmvar_h=3Dno
ac_cv_header_machine_mtrr_h=3Dno
ac_cv_header_malloc_h=3Dyes
ac_cv_header_math_h=3Dyes
ac_cv_header_mcheck_h=3Dyes
ac_cv_header_memory_h=3Dyes
ac_cv_header_mntent_h=3Dyes
ac_cv_header_mqueue_h=3Dyes
ac_cv_header_ndbm_h=3Dno
ac_cv_header_net_if_h=3Dyes
ac_cv_header_net_route_h=3Dyes
ac_cv_header_netdb_h=3Dyes
ac_cv_header_netinet_ether_h=3Dyes
ac_cv_header_netinet_in_h=3Dyes
ac_cv_header_netinet_ip6_h=3Dyes
ac_cv_header_netinet_ip_h=3Dyes
ac_cv_header_netinet_sctp_h=3Dno
ac_cv_header_netinet_sctp_uio_h=3Dno
ac_cv_header_netinet_tcp_h=3Dyes
ac_cv_header_netinet_udp_h=3Dyes
ac_cv_header_netipx_ipx_h=3Dyes
ac_cv_header_paths_h=3Dyes
ac_cv_header_poll_h=3Dyes
ac_cv_header_pthread_h=3Dyes
ac_cv_header_pty_h=3Dyes
ac_cv_header_pwd_h=3Dyes
ac_cv_header_regex_h=3Dyes
ac_cv_header_resolv_h=3Dyes
ac_cv_header_rpc_rpc_h=3Dyes
ac_cv_header_rpc_types_h=3Dyes
ac_cv_header_rpcsvc_dbm_h=3Dno
ac_cv_header_sched_h=3Dyes
ac_cv_header_scsi_scsi_h=3Dyes
ac_cv_header_search_h=3Dyes
ac_cv_header_semaphore_h=3Dyes
ac_cv_header_setjmp_h=3Dyes
ac_cv_header_sgtty_h=3Dyes
ac_cv_header_shadow_h=3Dyes
ac_cv_header_signal_h=3Dyes
ac_cv_header_stdarg_h=3Dyes
ac_cv_header_stdbool_h=3Dyes
ac_cv_header_stdc=3Dyes
ac_cv_header_stddef_h=3Dyes
ac_cv_header_stdint_h=3Dyes
ac_cv_header_stdio_h=3Dyes
ac_cv_header_stdlib_h=3Dyes
ac_cv_header_string_h=3Dyes
ac_cv_header_strings_h=3Dyes
ac_cv_header_stropts_h=3Dyes
ac_cv_header_sys_agpgart_h=3Dno
ac_cv_header_sys_agpio_h=3Dno
ac_cv_header_sys_bitypes_h=3Dyes
ac_cv_header_sys_cdefs_h=3Dyes
ac_cv_header_sys_dir_h=3Dyes
ac_cv_header_sys_endian_h=3Dno
ac_cv_header_sys_epoll_h=3Dyes
ac_cv_header_sys_fcntl_h=3Dyes
ac_cv_header_sys_file_h=3Dyes
ac_cv_header_sys_fsuid_h=3Dyes
ac_cv_header_sys_ioctl_h=3Dyes
ac_cv_header_sys_ipc_h=3Dyes
ac_cv_header_sys_linker_h=3Dno
ac_cv_header_sys_memrange_h=3Dno
ac_cv_header_sys_mman_h=3Dyes
ac_cv_header_sys_mount_h=3Dyes
ac_cv_header_sys_mtio_h=3Dyes
ac_cv_header_sys_param_h=3Dyes
ac_cv_header_sys_poll_h=3Dyes
ac_cv_header_sys_prctl_h=3Dyes
ac_cv_header_sys_ptrace_h=3Dyes
ac_cv_header_sys_queue_h=3Dyes
ac_cv_header_sys_reg_h=3Dyes
ac_cv_header_sys_resource_h=3Dyes
ac_cv_header_sys_select_h=3Dyes
ac_cv_header_sys_sem_h=3Dyes
ac_cv_header_sys_shm_h=3Dyes
ac_cv_header_sys_signal_h=3Dyes
ac_cv_header_sys_socket_h=3Dyes
ac_cv_header_sys_socketvar_h=3Dyes
ac_cv_header_sys_soundcard_h=3Dyes
ac_cv_header_sys_stat_h=3Dyes
ac_cv_header_sys_statfs_h=3Dyes
ac_cv_header_sys_statvfs_h=3Dyes
ac_cv_header_sys_stropts_h=3Dyes
ac_cv_header_sys_swap_h=3Dyes
ac_cv_header_sys_sysctl_h=3Dyes
ac_cv_header_sys_sysinfo_h=3Dyes
ac_cv_header_sys_sysmacros_h=3Dyes
ac_cv_header_sys_termios_h=3Dyes
ac_cv_header_sys_time_h=3Dyes
ac_cv_header_sys_timeb_h=3Dyes
ac_cv_header_sys_times_h=3Dyes
ac_cv_header_sys_timex_h=3Dyes
ac_cv_header_sys_types_h=3Dyes
ac_cv_header_sys_uio_h=3Dyes
ac_cv_header_sys_un_h=3Dyes
ac_cv_header_sys_unistd_h=3Dyes
ac_cv_header_sys_user_h=3Dyes
ac_cv_header_sys_utsname_h=3Dyes
ac_cv_header_sys_vfs_h=3Dyes
ac_cv_header_sys_wait_h=3Dyes
ac_cv_header_sysexits_h=3Dyes
ac_cv_header_syslog_h=3Dyes
ac_cv_header_termio_h=3Dyes
ac_cv_header_termios_h=3Dyes
ac_cv_header_time_h=3Dyes
ac_cv_header_ttyent_h=3Dyes
ac_cv_header_ulimit_h=3Dyes
ac_cv_header_unistd_h=3Dyes
ac_cv_header_ustat_h=3Dyes
ac_cv_header_utime_h=3Dyes
ac_cv_header_utmp_h=3Dyes
ac_cv_header_utmpx_h=3Dyes
ac_cv_header_values_h=3Dyes
ac_cv_header_wchar_h=3Dyes
ac_cv_header_wctype_h=3Dyes
ac_cv_header_zlib_h=3Dyes
ac_cv_host=3Di586-poky-linux-gnu
ac_cv_lbl_unaligned_fail=3Dno
ac_cv_lib_Xdmcp_XdmcpWrap=3Dyes
ac_cv_lib_c_backtrace=3Dyes
ac_cv_lib_c_signalfd=3Dyes
ac_cv_lib_crypto_SHA1_Init=3Dyes
ac_cv_lib_dl_dlopen=3Dyes
ac_cv_lib_gcrypt_gcry_md_open=3Dyes
ac_cv_lib_lex=3D-lfl
ac_cv_lib_m_cbrt=3Dyes
ac_cv_lib_m_sqrt=3Dyes
ac_cv_lib_md_SHA1Init=3Dno
ac_cv_lib_rt_clock_gettime=3Dyes
ac_cv_libiconv_utf8=3Dyes
ac_cv_libnet_endianess=3Dlil
ac_cv_linux_vers=3D2
ac_cv_member_struct_sockaddr_in_sin_len=3Dno
ac_cv_need_trio=3Dno
ac_cv_objext=3Do
ac_cv_path_DTRACE=3Dnot_found
ac_cv_path_EGREP=3D'/bin/grep -E'
ac_cv_path_ESD_CONFIG=3Dno
ac_cv_path_FGREP=3D'/bin/grep -F'
ac_cv_path_GREP=3D/bin/grep
ac_cv_path_PERL=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/per=
l
ac_cv_path_PKG_CONFIG=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/b=
in/pkg-config
ac_cv_path_RAWCPP=3D/usr/bin/cpp
ac_cv_path_SED=3D/bin/sed
ac_cv_path_XMLTO=3D/usr/bin/xmlto
ac_cv_path_ac_pt_PKG_CONFIG=3D/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux=
/usr/bin/pkg-config
ac_cv_path_install=3D'/usr/bin/install -c'
ac_cv_path_mkdir=3D/bin/mkdir
ac_cv_pread=3Dno
ac_cv_prog_AR=3Di586-poky-linux-ar
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_CC=3D'i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/s=
db/test/tmp/sysroots/qemux86'
ac_cv_prog_CPP=3D'i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tm=
p/sysroots/qemux86'
ac_cv_prog_DLLTOOL=3Ddlltool
ac_cv_prog_LEX=3Dflex
ac_cv_prog_OBJDUMP=3Di586-poky-linux-objdump
ac_cv_prog_RANLIB=3Di586-poky-linux-ranlib
ac_cv_prog_STRIP=3Di586-poky-linux-strip
ac_cv_prog_YACC=3D'bison -y'
ac_cv_prog_ac_ct_MANIFEST_TOOL=3Dmt
ac_cv_prog_cc_c89=3D
ac_cv_prog_cc_c99=3D-std=3Dgnu99
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_lex_root=3Dlex.yy
ac_cv_prog_lex_yytext_pointer=3Dyes
ac_cv_prog_make_make_set=3Dyes
ac_cv_pwrite=3Dno
ac_cv_sctp=3Dno
ac_cv_search_gethostbyname=3D'none required'
ac_cv_search_getsecretkey=3D'none required'
ac_cv_search_opendir=3D'none required'
ac_cv_search_socket=3D'none required'
ac_cv_sizeof_char=3D1
ac_cv_sizeof_char_p=3D4
ac_cv_sizeof_dev_t=3D8
ac_cv_sizeof_double=3D8
ac_cv_sizeof_float=3D4
ac_cv_sizeof_gid_t=3D4
ac_cv_sizeof_ino_t=3D4
ac_cv_sizeof_int=3D4
ac_cv_sizeof_int_p=3D4
ac_cv_sizeof_long=3D4
ac_cv_sizeof_long_double=3D12
ac_cv_sizeof_long_int=3D4
ac_cv_sizeof_long_long=3D8
ac_cv_sizeof_long_long_int=3D8
ac_cv_sizeof_long_p=3D4
ac_cv_sizeof_off_t=3D4
ac_cv_sizeof_short=3D2
ac_cv_sizeof_short_int=3D2
ac_cv_sizeof_signed_char=3D1
ac_cv_sizeof_size_t=3D4
ac_cv_sizeof_ssize_t=3D4
ac_cv_sizeof_uid_t=3D4
ac_cv_sizeof_unsigned_char=3D1
ac_cv_sizeof_unsigned_char_p=3D4
ac_cv_sizeof_unsigned_int=3D1
ac_cv_sizeof_unsigned_long=3D4
ac_cv_sizeof_unsigned_long_int=3D4
ac_cv_sizeof_unsigned_long_long=3D8
ac_cv_sizeof_unsigned_long_long_int=3D8
ac_cv_sizeof_unsigned_short=3D2
ac_cv_sizeof_unsigned_short_int=3D2
ac_cv_sizeof_void_p=3D4
ac_cv_sizeof_wchar_t=3D4
ac_cv_sys_file_offset_bits=3D64
ac_cv_sys_largefile_CC=3Dno
ac_cv_sys_linker_h=3Dno
ac_cv_sys_restartable_syscalls=3Dyes
ac_cv_sysv_ipc=3Dyes
ac_cv_tls=3D__thread
ac_cv_type_pid_t=3Dyes
ac_cv_type_signal=3Dvoid
ac_cv_type_socklen_t=3Dyes
ac_cv_type_struct_timespec=3Dyes
ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
ac_cv_uchar=3Dno
ac_cv_uint=3Dyes
ac_cv_ulong=3Dyes
ac_cv_ushort=3Dyes
ac_cv_va_copy=3Dno
ac_cv_va_val_copy=3Dyes
ac_cv_working_alloca_h=3Dyes
am_cv_CCAS_dependencies_compiler_type=3Dgcc3
am_cv_CC_dependencies_compiler_type=3Dgcc3
am_cv_OBJC_dependencies_compiler_type=3Dnone
am_cv_func_working_getline=3Dyes
am_cv_scanf_lld=3Dyes
apr_cv_process_shared_works=3Dno
apr_cv_tcp_nodelay_with_cork=3Dyes
bash_cv_dup2_broken=3Dno
bash_cv_func_sigsetjmp=3Dmissing
bash_cv_func_strcoll_broken=3Dno
bash_cv_getcwd_calls_popen=3Dno
bash_cv_getenv_redef=3Dyes
bash_cv_have_mbstate_t=3Dyes
bash_cv_job_control_missing=3Dpresent
bash_cv_must_reinstall_sighandlers=3Dno
bash_cv_opendir_not_robust=3Dno
bash_cv_pgrp_pipe=3Dno
bash_cv_printf_a_format=3Dyes
bash_cv_sys_named_pipes=3Dpresent
bash_cv_sys_siglist=3Dyes
bash_cv_type_rlimit=3Drlim_t
bash_cv_ulimit_maxfds=3Dyes
bash_cv_under_sys_siglist=3Dyes
bash_cv_unusable_rtsigs=3Dno
cvs_cv_func_printf_ptr=3Dyes
db_cv_align_t=3D'unsigned long long'
db_cv_alignp_t=3D'unsigned long'
db_cv_fcntl_f_setfd=3Dyes
db_cv_mutex=3Dx86/gcc-assembly
db_cv_path_ar=3D/usr/bin/ar
db_cv_path_chmod=3D/bin/chmod
db_cv_path_cp=3D/bin/cp
db_cv_path_ln=3D/bin/ln
db_cv_path_mkdir=3D/bin/mkdir
db_cv_path_ranlib=3D/usr/bin/ranlib
db_cv_path_rm=3D/bin/rm
db_cv_path_sh=3D/bin/sh
db_cv_path_strip=3D/usr/bin/strip
db_cv_posixmutexes=3Dno
db_cv_sprintf_count=3Dyes
db_cv_uimutexes=3Dno
dpkg_cv___va_copy=3Dyes
dpkg_cv_va_copy=3Dno
ettercap_cv_type_socklen_t=3Dyes
gl_cv_func_btowc_eof=3Dyes
gl_cv_func_mbrtowc_incomplete_state=3Dyes
gl_cv_func_mbrtowc_nul_retval=3Dyes
gl_cv_func_mbrtowc_null_arg=3Dyes
gl_cv_func_mbrtowc_retval=3Dyes
gl_cv_func_mbrtowc_sanitycheck=3Dyes
gl_cv_func_wcrtomb_retval=3Dyes
gl_cv_func_wctob_works=3Dyes
glib_cv___va_copy=3Dyes
glib_cv_compliant_posix_memalign=3D1
glib_cv_has__inline=3Dyes
glib_cv_has__inline__=3Dyes
glib_cv_hasinline=3Dyes
glib_cv_long_long_format=3Dll
glib_cv_rtldglobal_broken=3Dyes
glib_cv_sane_realloc=3Dyes
glib_cv_sizeof_gmutex=3D24
glib_cv_sizeof_system_thread=3D4
glib_cv_stack_grows=3Dno
glib_cv_strlcpy=3Dno
glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
glib_cv_sys_pthread_getspecific_posix=3Dyes
glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
glib_cv_uscore=3Dno
glib_cv_use_pid_surrogate=3Dyes
glib_cv_va_copy=3Dyes
glib_cv_va_val_copy=3Dyes
gt_cv_locale_fr=3Dfr_FR
jm_cv_func_gettimeofday_clobber=3Dno
jm_cv_func_working_readdir=3Dyes
lf_cv_sane_realloc=3Dyes
lftp_cv___va_copy=3Dyes
lftp_cv_va_copy=3Dno
libIDL_cv_long_long_format=3Dll
lt_cv_ar_at_file=3D@
lt_cv_archive_cmds_need_lc=3Dno
lt_cv_deplibs_check_method=3Dpass_all
lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
lt_cv_file_magic_test_file=3D
lt_cv_ld_reload_flag=3D-r
lt_cv_nm_interface=3D'BSD nm'
lt_cv_objdir=3D.libs
lt_cv_path_LD=3D'i586-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/sys=
roots/qemux86'
lt_cv_path_NM=3Di586-poky-linux-nm
lt_cv_path_mainfest_tool=3Dno
lt_cv_prog_compiler_c_o=3Dyes
lt_cv_prog_compiler_pic=3D'-fPIC -DPIC'
lt_cv_prog_compiler_pic_works=3Dyes
lt_cv_prog_compiler_rtti_exceptions=3Dno
lt_cv_prog_compiler_static_works=3Dyes
lt_cv_prog_gnu_ld=3Dyes
lt_cv_sharedlib_from_linklib_cmd=3D'printf %s\n'
lt_cv_shlibpath_overrides_runpath=3Dno
lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABCDG=
IRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'' | sed '\''/ __=
gnu_lto/d'\'''
lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \([^ ]*\)[ =
]*$/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]*=
\)$/  {"\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'sed -n -e '\''s/^: =
\([^ ]*\)[ ]*$/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]=
*\) \(lib[^ ]*\)$/  {"\2", (void *) \&\2},/p'\'' -e '\''s/^[ABCDGIRSTW]* \(=
[^ ]*\) \([^ ]*\)$/  {"lib\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^T .* \(.*\)$/extern in=
t \1();/p'\'' -e '\''s/^[ABCDGIRSTW]* .* \(.*\)$/extern char \1;/p'\'''
lt_cv_sys_max_cmd_len=3D1572864
lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
mono_cv_uscore=3Dno
moz_cv_align_of_JS_ALIGN_OF_POINTER=3D4
moz_cv_size_of_JS_BYTES_PER_DOUBLE=3D8
moz_cv_size_of_JS_BYTES_PER_WORD=3D4
mr_cv_target_elf=3Dyes
mysql_cv_func_atomic_add=3Dyes
mysql_cv_func_atomic_sub=3Dyes
nfsd_cv_broken_setfsuid=3D0
nfsd_cv_bsd_signals=3Dyes
nfsd_cv_func_statfs=3Dstatfs2_bsize
php_cv_lib_cookie_io_functions_use_off64_t=3Dyes
pkg_cv_DBUS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/includ=
e/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/dbus-1.0/incl=
ude  '
pkg_cv_DBUS_LIBS=3D'-ldbus-1 -lpthread -lrt  '
pkg_cv_DMXMODULES_CFLAGS=3D' '
pkg_cv_DMXMODULES_LIBS=3D'-lXmuu -lXext -lXrender -lX11 -lXfixes -lXi -lXau=
 -lXdmcp  '
pkg_cv_DRI2PROTO_CFLAGS=3D' '
pkg_cv_DRI2PROTO_LIBS=3D' '
pkg_cv_GLIB_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/includ=
e/glib-2.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/glib-2.0/incl=
ude  '
pkg_cv_GLIB_LIBS=3D'-lglib-2.0  '
pkg_cv_HAL_CFLAGS=3D'-DDBUS_API_SUBJECT_TO_CHANGE -I/home/kyu3/sdb/test/tmp=
/sysroots/qemux86/usr/include/hal -I/home/kyu3/sdb/test/tmp/sysroots/qemux8=
6/usr/include/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/d=
bus-1.0/include  '
pkg_cv_HAL_LIBS=3D'-lhal -ldbus-1 -lpthread -lrt  '
pkg_cv_LIBDRM_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/incl=
ude/libdrm  '
pkg_cv_LIBDRM_LIBS=3D'-ldrm  '
pkg_cv_OPENSSL_CFLAGS=3D' '
pkg_cv_OPENSSL_LIBS=3D'-lssl -lcrypto  '
pkg_cv_PCIACCESS_CFLAGS=3D' '
pkg_cv_PCIACCESS_LIBS=3D'-lpciaccess  '
pkg_cv_PIXMAN_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/incl=
ude/pixman-1  '
pkg_cv_PIXMAN_LIBS=3D'-lpixman-1  '
pkg_cv_UDEV_CFLAGS=3D' '
pkg_cv_UDEV_LIBS=3D'-ludev  '
pkg_cv_XDMCP_CFLAGS=3D' '
pkg_cv_XDMCP_LIBS=3D'-lXdmcp  '
pkg_cv_XF86VIDMODE_CFLAGS=3D' '
pkg_cv_XF86VIDMODE_LIBS=3D' '
pkg_cv_XNESTMODULES_CFLAGS=3D' '
pkg_cv_XNESTMODULES_LIBS=3D'-lXext -lX11 -lXau -lXdmcp  '
pkg_cv_XORG_MODULES_CFLAGS=3D' '
pkg_cv_XORG_MODULES_LIBS=3D' '
pkg_cv_XSERVERCFLAGS_CFLAGS=3D'-D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_=
BIT -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/pixman-1 -I/home=
/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/freetype2  '
pkg_cv_XSERVERCFLAGS_LIBS=3D'-lxkbfile -lpixman-1 -lXfont -lXau -lXdmcp  '
pkg_cv_XSERVERLIBS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr=
/include/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/fr=
eetype2  '
pkg_cv_XSERVERLIBS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp  '
racoon_cv_bug_getaddrinfo=3Dno
rpppoe_cv_pack_bitfields=3Drev
rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno
rsync_cv_HAVE_BROKEN_READDIR=3Dno
rsync_cv_HAVE_C99_VSNPRINTF=3Dyes
rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
rsync_cv_HAVE_LONGLONG=3Dyes
rsync_cv_HAVE_OFF64_T=3Dno
rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes
rsync_cv_HAVE_SHORT_INO_T=3Dno
rsync_cv_HAVE_SOCKETPAIR=3Dyes
rsync_cv_HAVE_UNSIGNED_CHAR=3Dno
rsync_cv_REPLACE_INET_ATON=3Dno
rsync_cv_REPLACE_INET_NTOA=3Dno
samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
screen_cv_sys_bcopy_overlap=3Dno
screen_cv_sys_fifo_broken_impl=3Dyes
screen_cv_sys_fifo_usable=3Dyes
screen_cv_sys_memcpy_overlap=3Dno
screen_cv_sys_memmove_overlap=3Dno
screen_cv_sys_select_broken_retval=3Dno
screen_cv_sys_sockets_nofs=3Dno
screen_cv_sys_sockets_usable=3Dyes
screen_cv_sys_terminfo_used=3Dyes
shadow_cv_logdir=3D/var/log
shadow_cv_maildir=3D/var/spool/mail
shadow_cv_mailfile=3DMailbox
shadow_cv_passwd_dir=3D/usr/bin
shadow_cv_utmpdir=3D/var/run
slrn_cv___va_copy=3Dyes
slrn_cv_va_copy=3Dno
slrn_cv_va_val_copy=3Dyes
sudo_cv_func_unsetenv_void=3Dno
sudo_cv_uid_t_len=3D10
utils_cv_sys_open_max=3D1015
yeti_cv_func_scanf_modif_size_t=3Dyes

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf=
86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run aclocal-1.11'
ADMIN_MAN_DIR=3D'$(mandir)/man$(ADMIN_MAN_SUFFIX)'
ADMIN_MAN_SUFFIX=3D'8'
AGP_FALSE=3D'#'
AGP_TRUE=3D''
AIGLX_FALSE=3D''
AIGLX_TRUE=3D'#'
ALLOCA=3D''
ALPHA_VIDEO_FALSE=3D''
ALPHA_VIDEO_TRUE=3D'#'
AMDEPBACKSLASH=3D'\'
AMDEP_FALSE=3D'#'
AMDEP_TRUE=3D''
AMTAR=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-xf86=
-lite-1.10.1-r0/xorg-server-1.10.1/missing --run tar'
AM_BACKSLASH=3D'\'
AM_DEFAULT_VERBOSITY=3D'1'
APPLE_APPLICATIONS_DIR=3D'/Applications/Utilities'
APPLE_APPLICATION_NAME=3D'X11'
APP_MAN_DIR=3D'$(mandir)/man$(APP_MAN_SUFFIX)'
APP_MAN_SUFFIX=3D'1'
AR=3D'i586-poky-linux-ar'
ARM_BACKTRACE_CFLAGS=3D''
ARM_VIDEO_FALSE=3D''
ARM_VIDEO_TRUE=3D'#'
AS=3D'i586-poky-linux-as'
AUTOCONF=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-x=
f86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run autoconf'
AUTOHEADER=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver=
-xf86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run autoheader'
AUTOMAKE=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-x=
f86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run automake-1.11'
AWK=3D'gawk'
BASE_FONT_PATH=3D'/usr/share/fonts/X11'
BSD_APM_FALSE=3D''
BSD_APM_TRUE=3D'#'
BSD_KQUEUE_APM_FALSE=3D''
BSD_KQUEUE_APM_TRUE=3D'#'
BUILD_DATE=3D'20110528'
BUILD_KDRIVEFBDEVLIB_FALSE=3D''
BUILD_KDRIVEFBDEVLIB_TRUE=3D'#'
BUILD_TIME=3D'1114940'
CC=3D'i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sdb/test/tmp=
/sysroots/qemux86 -std=3Dgnu99'
CCAS=3D'i586-poky-linux-gcc -march=3Di586 --sysroot=3D/home/kyu3/sdb/test/t=
mp/sysroots/qemux86 -std=3Dgnu99'
CCASDEPMODE=3D'depmode=3Dgcc3'
CCASFLAGS=3D'-O2 -pipe -g -feliminate-unused-debug-types'
CCDEPMODE=3D'depmode=3Dgcc3'
CFLAGS=3D'-O2 -pipe -g -feliminate-unused-debug-types'
CHANGELOG_CMD=3D'(GIT_DIR=3D$(top_srcdir)/.git git log > $(top_srcdir)/.cha=
ngelog.tmp && mv $(top_srcdir)/.changelog.tmp $(top_srcdir)/ChangeLog) || (=
rm -f $(top_srcdir)/.changelog.tmp; touch $(top_srcdir)/ChangeLog; echo '\'=
'git directory not found: installing possibly empty changelog.'\'' >&2)'
COMPILEDDEFAULTFONTPATH=3D'/usr/share/fonts/X11/misc/,/usr/share/fonts/X11/=
TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/share/fonts=
/X11/100dpi/,/usr/share/fonts/X11/75dpi/'
COMPOSITE_FALSE=3D'#'
COMPOSITE_TRUE=3D''
CONFIG_DBUS_API_FALSE=3D''
CONFIG_DBUS_API_TRUE=3D'#'
CONFIG_HAL_FALSE=3D''
CONFIG_HAL_TRUE=3D'#'
CONFIG_NEED_DBUS_FALSE=3D''
CONFIG_NEED_DBUS_TRUE=3D'#'
CONFIG_UDEV_FALSE=3D'#'
CONFIG_UDEV_TRUE=3D''
CPP=3D'i586-poky-linux-gcc -E --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/=
qemux86'
CPPFLAGS=3D''
CWARNFLAGS=3D'-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototype=
s -Wmissing-declarations -Wnested-externs -fno-strict-aliasing -Wbad-functi=
on-cast -Wformat=3D2 -Wold-style-definition -Wdeclaration-after-statement '
CYGPATH_W=3D'echo'
DARWIN_LIBS=3D''
DBE_FALSE=3D'#'
DBE_TRUE=3D''
DBUS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/dbus-=
1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/dbus-1.0/include  '
DBUS_LIBS=3D'-ldbus-1 -lpthread -lrt  '
DEBUG_FALSE=3D''
DEBUG_TRUE=3D'#'
DEFAULT_LIBRARY_PATH=3D'/usr/lib'
DEFAULT_LOGDIR=3D''
DEFAULT_LOGPREFIX=3D'/var/log/Xorg.'
DEFAULT_MODULE_PATH=3D'/usr/lib/xorg/modules'
DEFS=3D'-DHAVE_CONFIG_H'
DEPDIR=3D'.deps'
DGA_CFLAGS=3D''
DGA_FALSE=3D''
DGA_LIBS=3D''
DGA_TRUE=3D'#'
DIX_CFLAGS=3D'-DHAVE_DIX_CONFIG_H $(CWARNFLAGS) -D_BSD_SOURCE -DHAS_FCHOWN =
-DHAS_STICKY_DIR_BIT -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include=
/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/freetype2 =
  -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)/Xext -I=
$(top_srcdir)/composite -I$(top_srcdir)/damageext -I$(top_srcdir)/xfixes -I=
$(top_srcdir)/Xi -I$(top_srcdir)/mi -I$(top_srcdir)/miext/sync -I$(top_srcd=
ir)/miext/shadow  -I$(top_srcdir)/miext/damage -I$(top_srcdir)/render -I$(t=
op_srcdir)/randr -I$(top_srcdir)/fb -fvisibility=3Dhidden'
DIX_LIB=3D'$(top_builddir)/dix/libdix.la'
DLLTOOL=3D'dlltool'
DLOPEN_LIBS=3D'-ldl'
DMXEXAMPLES_DEP_CFLAGS=3D''
DMXEXAMPLES_DEP_LIBS=3D''
DMXMODULES_CFLAGS=3D' '
DMXMODULES_LIBS=3D'-lXmuu -lXext -lXrender -lX11 -lXfixes -lXi -lXau -lXdmc=
p  '
DMXXIEXAMPLES_DEP_CFLAGS=3D''
DMXXIEXAMPLES_DEP_LIBS=3D''
DMXXMUEXAMPLES_DEP_CFLAGS=3D''
DMXXMUEXAMPLES_DEP_LIBS=3D''
DMX_BUILD_LNX_FALSE=3D''
DMX_BUILD_LNX_TRUE=3D'#'
DMX_BUILD_USB_FALSE=3D''
DMX_BUILD_USB_TRUE=3D'#'
DMX_FALSE=3D''
DMX_TRUE=3D'#'
DOXYGEN=3D''
DPMSExtension_FALSE=3D'#'
DPMSExtension_TRUE=3D''
DRI2PROTO_CFLAGS=3D' '
DRI2PROTO_LIBS=3D' '
DRI2_AIGLX_FALSE=3D'#'
DRI2_AIGLX_TRUE=3D''
DRI2_FALSE=3D'#'
DRI2_TRUE=3D''
DRIPROTO_CFLAGS=3D''
DRIPROTO_LIBS=3D''
DRIVER_MAN_DIR=3D'$(mandir)/man$(DRIVER_MAN_SUFFIX)'
DRIVER_MAN_SUFFIX=3D'4'
DRI_CFLAGS=3D''
DRI_DRIVER_PATH=3D'/usr/lib/dri'
DRI_FALSE=3D''
DRI_LIBS=3D''
DRI_TRUE=3D'#'
DSYMUTIL=3D''
DTRACE=3D'not_found'
DUMPBIN=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EGREP=3D'/bin/grep -E'
ENABLE_DEVEL_DOCS_FALSE=3D'#'
ENABLE_DEVEL_DOCS_TRUE=3D''
ENABLE_DOCS_FALSE=3D'#'
ENABLE_DOCS_TRUE=3D''
EXEEXT=3D''
FBDEVHW_FALSE=3D'#'
FBDEVHW_TRUE=3D''
FGREP=3D'/bin/grep -F'
FILE_MAN_DIR=3D'$(mandir)/man$(FILE_MAN_SUFFIX)'
FILE_MAN_SUFFIX=3D'5'
FONT100DPIDIR=3D'${FONTROOTDIR}/100dpi'
FONT75DPIDIR=3D'${FONTROOTDIR}/75dpi'
FONTMISCDIR=3D'${FONTROOTDIR}/misc'
FONTOTFDIR=3D'${FONTROOTDIR}/OTF'
FONTROOTDIR=3D'/usr/share/fonts/X11'
FONTTTFDIR=3D'${FONTROOTDIR}/TTF'
FONTTYPE1DIR=3D'${FONTROOTDIR}/Type1'
FOP=3D''
FREEBSD_KLDLOAD_FALSE=3D''
FREEBSD_KLDLOAD_TRUE=3D'#'
GLIB_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/glib-=
2.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/glib-2.0/include  '
GLIB_LIBS=3D'-lglib-2.0  '
GLX_ARCH_DEFINES=3D''
GLX_DEFINES=3D'-DGLX_USE_TLS -DPTHREADS'
GLX_FALSE=3D''
GLX_TLS=3D'yes'
GLX_TRUE=3D'#'
GL_CFLAGS=3D''
GL_LIBS=3D''
GREP=3D'/bin/grep'
HAL_CFLAGS=3D'-DDBUS_API_SUBJECT_TO_CHANGE -I/home/kyu3/sdb/test/tmp/sysroo=
ts/qemux86/usr/include/hal -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/i=
nclude/dbus-1.0 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/lib/dbus-1.0=
/include  '
HAL_LIBS=3D'-lhal -ldbus-1 -lpthread -lrt  '
HAVE_DBUS_FALSE=3D'#'
HAVE_DBUS_TRUE=3D''
HAVE_DOXYGEN_FALSE=3D''
HAVE_DOXYGEN_TRUE=3D'#'
HAVE_FOP_FALSE=3D''
HAVE_FOP_TRUE=3D'#'
HAVE_STYLESHEETS_FALSE=3D''
HAVE_STYLESHEETS_TRUE=3D'#'
HAVE_XMLTO_FALSE=3D'#'
HAVE_XMLTO_TEXT_FALSE=3D'#'
HAVE_XMLTO_TEXT_TRUE=3D''
HAVE_XMLTO_TRUE=3D''
I386_VIDEO_FALSE=3D'#'
I386_VIDEO_TRUE=3D''
INSTALL_CMD=3D'(cp -f /usr/share/util-macros/INSTALL $(top_srcdir)/.INSTALL=
.tmp && mv $(top_srcdir)/.INSTALL.tmp $(top_srcdir)/INSTALL) || (rm -f $(to=
p_srcdir)/.INSTALL.tmp; touch $(top_srcdir)/INSTALL; echo '\''util-macros "=
pkgdatadir" from xorg-macros.pc not found: installing possibly empty INSTAL=
L.'\'' >&2)'
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_LIBXF86CONFIG_FALSE=3D''
INSTALL_LIBXF86CONFIG_TRUE=3D'#'
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_SCRIPT=3D'${INSTALL}'
INSTALL_SETUID_FALSE=3D''
INSTALL_SETUID_TRUE=3D'#'
INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
INT10MODULE_FALSE=3D'#'
INT10MODULE_TRUE=3D''
INT10_STUB_FALSE=3D''
INT10_STUB_TRUE=3D'#'
INT10_VM86_FALSE=3D''
INT10_VM86_TRUE=3D'#'
INT10_X86EMU_FALSE=3D'#'
INT10_X86EMU_TRUE=3D''
KDRIVEFBDEV_FALSE=3D''
KDRIVEFBDEV_TRUE=3D'#'
KDRIVELINUX_FALSE=3D''
KDRIVELINUX_TRUE=3D'#'
KDRIVE_CFLAGS=3D''
KDRIVE_EVDEV_FALSE=3D''
KDRIVE_EVDEV_TRUE=3D'#'
KDRIVE_FALSE=3D''
KDRIVE_INCS=3D''
KDRIVE_KBD_FALSE=3D''
KDRIVE_KBD_TRUE=3D'#'
KDRIVE_LIBS=3D''
KDRIVE_LOCAL_LIBS=3D''
KDRIVE_MOUSE_FALSE=3D''
KDRIVE_MOUSE_TRUE=3D'#'
KDRIVE_PURE_INCS=3D''
KDRIVE_PURE_LIBS=3D''
KDRIVE_TRUE=3D'#'
LAUNCHD_ID_PREFIX=3D'org.x'
LD=3D'i586-poky-linux-ld --sysroot=3D/home/kyu3/sdb/test/tmp/sysroots/qemux=
86'
LDFLAGS=3D'-Wl,-O1  -Wl,--as-needed'
LD_EXPORT_SYMBOLS_FLAG=3D'-export-dynamic'
LEX=3D'flex'
LEXLIB=3D'-lfl'
LEX_OUTPUT_ROOT=3D'lex.yy'
LIBDRM_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/lib=
drm  '
LIBDRM_LIBS=3D'-ldrm  '
LIBOBJS=3D''
LIBS=3D'-lm '
LIBSHA1_CFLAGS=3D''
LIBSHA1_LIBS=3D''
LIBTOOL=3D'$(SHELL) $(top_builddir)/i586-poky-linux-libtool'
LIB_MAN_DIR=3D'$(mandir)/man$(LIB_MAN_SUFFIX)'
LIB_MAN_SUFFIX=3D'3'
LINUX_ALPHA_FALSE=3D''
LINUX_ALPHA_TRUE=3D'#'
LINUX_IA64_FALSE=3D''
LINUX_IA64_TRUE=3D'#'
LIPO=3D''
LNXACPI_FALSE=3D'#'
LNXACPI_TRUE=3D''
LNXAPM_FALSE=3D'#'
LNXAPM_TRUE=3D''
LN_S=3D'ln -s'
LTLIBOBJS=3D''
MAINT=3D'#'
MAINTAINER_MODE_FALSE=3D''
MAINTAINER_MODE_TRUE=3D'#'
MAIN_LIB=3D'$(top_builddir)/dix/libmain.la'
MAKEINFO=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver-x=
f86-lite-1.10.1-r0/xorg-server-1.10.1/missing --run makeinfo'
MANIFEST_TOOL=3D':'
MAN_SUBSTS=3D'	-e '\''s|__vendorversion__|"$(PACKAGE_STRING)" "$(XORG_MAN_P=
AGE)"|'\'' 	-e '\''s|__xorgversion__|"$(PACKAGE_STRING)" "$(XORG_MAN_PAGE)"=
|'\'' 	-e '\''s|__xservername__|Xorg|g'\'' 	-e '\''s|__xconfigfile__|xorg.c=
onf|g'\'' 	-e '\''s|__projectroot__|$(prefix)|g'\'' 	-e '\''s|__apploaddir_=
_|$(appdefaultdir)|g'\'' 	-e '\''s|__appmansuffix__|$(APP_MAN_SUFFIX)|g'\''=
 	-e '\''s|__drivermansuffix__|$(DRIVER_MAN_SUFFIX)|g'\'' 	-e '\''s|__admin=
mansuffix__|$(ADMIN_MAN_SUFFIX)|g'\'' 	-e '\''s|__libmansuffix__|$(LIB_MAN_=
SUFFIX)|g'\'' 	-e '\''s|__miscmansuffix__|$(MISC_MAN_SUFFIX)|g'\'' 	-e '\''=
s|__filemansuffix__|$(FILE_MAN_SUFFIX)|g'\'''
MISC_MAN_DIR=3D'$(mandir)/man$(MISC_MAN_SUFFIX)'
MISC_MAN_SUFFIX=3D'7'
MITSHM_FALSE=3D'#'
MITSHM_TRUE=3D''
MKDIR_P=3D'/bin/mkdir -p'
NEED_STRLCAT_FALSE=3D'#'
NEED_STRLCAT_TRUE=3D''
NEED_VSNPRINTF_FALSE=3D''
NEED_VSNPRINTF_TRUE=3D'#'
NM=3D'i586-poky-linux-nm'
NMEDIT=3D''
OBJC=3D'$(CC)'
OBJCCLD=3D''
OBJCDEPMODE=3D'depmode=3Dnone'
OBJCFLAGS=3D'$(CFLAGS)'
OBJCLINK=3D'$(LINK)'
OBJDUMP=3D'i586-poky-linux-objdump'
OBJEXT=3D'o'
OPENSSL_CFLAGS=3D' '
OPENSSL_LIBS=3D'-lssl -lcrypto  '
OS_LIB=3D'$(top_builddir)/os/libos.la'
OTOOL64=3D''
OTOOL=3D''
PACKAGE=3D'xorg-server'
PACKAGE_BUGREPORT=3D'https://bugs.freedesktop.org/enter_bug.cgi?product=3Dx=
org'
PACKAGE_NAME=3D'xorg-server'
PACKAGE_STRING=3D'xorg-server 1.10.1'
PACKAGE_TARNAME=3D'xorg-server'
PACKAGE_URL=3D''
PACKAGE_VERSION=3D'1.10.1'
PATH_SEPARATOR=3D':'
PCIACCESS_CFLAGS=3D' '
PCIACCESS_LIBS=3D'-lpciaccess  '
PCI_TXT_IDS_PATH=3D''
PERL=3D'/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/perl'
PIXMAN_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/pix=
man-1  '
PIXMAN_LIBS=3D'-lpixman-1  '
PKG_CONFIG=3D'/home/kyu3/sdb/test/tmp/sysroots/x86_64-linux/usr/bin/pkg-con=
fig'
PKG_CONFIG_LIBDIR=3D'/home/kyu3/sdb/test/tmp/sysroots/qemux86//usr/lib/pkgc=
onfig'
PKG_CONFIG_PATH=3D'/home/kyu3/sdb/test/tmp/sysroots/qemux86//usr/lib/pkgcon=
fig:/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/share/pkgconfig'
PPC_VIDEO_FALSE=3D''
PPC_VIDEO_TRUE=3D'#'
PROJECTROOT=3D'/usr'
RANLIB=3D'i586-poky-linux-ranlib'
RAWCPP=3D'/usr/bin/cpp'
RAWCPPFLAGS=3D'-undef -traditional'
RECORD_FALSE=3D''
RECORD_TRUE=3D'#'
RELEASE_DATE=3D'2011-04-15'
RES_FALSE=3D'#'
RES_TRUE=3D''
SCREENSAVER_FALSE=3D'#'
SCREENSAVER_TRUE=3D''
SDK_REQUIRED_MODULES=3D'xproto >=3D 7.0.17 randrproto >=3D 1.2.99.3 renderp=
roto >=3D 0.11 xextproto >=3D 7.1.99 inputproto >=3D 1.9.99.902 kbproto >=
=3D 1.0.3 fontsproto videoproto dri2proto >=3D 2.3'
SECURE_RPC_FALSE=3D'#'
SECURE_RPC_TRUE=3D''
SED=3D'/bin/sed'
SELINUX_CFLAGS=3D''
SELINUX_LIBS=3D''
SERVER_MISC_CONFIG_PATH=3D'/usr/lib/xorg'
SET_MAKE=3D''
SHA1_CFLAGS=3D''
SHA1_LIBS=3D'-lgcrypt'
SHELL=3D'/bin/sh'
SOLARIS_ASM_CFLAGS=3D''
SOLARIS_ASM_INLINE_FALSE=3D''
SOLARIS_ASM_INLINE_TRUE=3D'#'
SOLARIS_INOUT_ARCH=3D''
SOLARIS_VT_FALSE=3D''
SOLARIS_VT_TRUE=3D'#'
SPARC64_VIDEO_FALSE=3D''
SPARC64_VIDEO_TRUE=3D'#'
SPECIAL_DTRACE_OBJECTS_FALSE=3D''
SPECIAL_DTRACE_OBJECTS_TRUE=3D'#'
STANDALONE_XPBPROXY_FALSE=3D''
STANDALONE_XPBPROXY_TRUE=3D'#'
STRIP=3D'i586-poky-linux-strip'
STYLESHEET_SRCDIR=3D''
SYSCONFDIR=3D''
TSLIB_CFLAGS=3D''
TSLIB_FALSE=3D''
TSLIB_LIBS=3D''
TSLIB_TRUE=3D'#'
UDEV_CFLAGS=3D' '
UDEV_LIBS=3D'-ludev  '
UNITTESTS_FALSE=3D''
UNITTESTS_TRUE=3D'#'
UTILS_SYS_LIBS=3D''
VBE_FALSE=3D'#'
VBE_TRUE=3D''
VENDOR_NAME_SHORT=3D'X.Org'
VERSION=3D'1.10.1'
VGAHW_FALSE=3D'#'
VGAHW_TRUE=3D''
WINDOWSWM_CFLAGS=3D''
WINDOWSWM_LIBS=3D''
WINDRES=3D''
X11EXAMPLES_DEP_CFLAGS=3D''
X11EXAMPLES_DEP_LIBS=3D''
XAA_FALSE=3D'#'
XAA_TRUE=3D''
XACE_FALSE=3D'#'
XACE_TRUE=3D''
XCALIBRATE_FALSE=3D''
XCALIBRATE_TRUE=3D'#'
XCSECURITY_FALSE=3D''
XCSECURITY_TRUE=3D'#'
XDMAUTH_FALSE=3D'#'
XDMAUTH_TRUE=3D''
XDMCP_CFLAGS=3D' '
XDMCP_FALSE=3D'#'
XDMCP_LIBS=3D'-lXdmcp  '
XDMCP_TRUE=3D''
XDMXCONFIG_DEP_CFLAGS=3D''
XDMXCONFIG_DEP_LIBS=3D''
XDMX_CFLAGS=3D''
XDMX_LIBS=3D''
XDMX_SYS_LIBS=3D''
XEPHYR_CFLAGS=3D''
XEPHYR_FALSE=3D''
XEPHYR_INCS=3D''
XEPHYR_LIBS=3D''
XEPHYR_TRUE=3D'#'
XF86BIGFONT_FALSE=3D''
XF86BIGFONT_TRUE=3D'#'
XF86CONFIGDIR=3D'xorg.conf.d'
XF86CONFIGFILE=3D'xorg.conf'
XF86UTILS_FALSE=3D'#'
XF86UTILS_TRUE=3D''
XF86VIDMODE_CFLAGS=3D' '
XF86VIDMODE_FALSE=3D'#'
XF86VIDMODE_LIBS=3D' '
XF86VIDMODE_TRUE=3D''
XFAKESERVER_FALSE=3D''
XFAKESERVER_TRUE=3D'#'
XINERAMA_FALSE=3D''
XINERAMA_TRUE=3D'#'
XKB_BASE_DIRECTORY=3D'/usr/share/X11/xkb'
XKB_BIN_DIRECTORY=3D'/usr/bin'
XKB_COMPILED_DIR=3D'/var/lib/xkb'
XKM_OUTPUT_DIR=3D'/var/lib/xkb/'
XLIB_CFLAGS=3D''
XLIB_LIBS=3D''
XMLTO=3D'/usr/bin/xmlto'
XNESTMODULES_CFLAGS=3D' '
XNESTMODULES_LIBS=3D'-lXext -lX11 -lXau -lXdmcp  '
XNEST_FALSE=3D''
XNEST_LIBS=3D''
XNEST_SYS_LIBS=3D''
XNEST_TRUE=3D'#'
XORG_BUS_BSDPCI_FALSE=3D''
XORG_BUS_BSDPCI_TRUE=3D'#'
XORG_BUS_LINUXPCI_FALSE=3D'#'
XORG_BUS_LINUXPCI_TRUE=3D''
XORG_BUS_SPARC_FALSE=3D''
XORG_BUS_SPARC_TRUE=3D'#'
XORG_CFLAGS=3D' -DHAVE_XORG_CONFIG_H -fvisibility=3Dhidden   -DXF86PM  '
XORG_FALSE=3D'#'
XORG_INCS=3D'-I$(top_srcdir)/hw/xfree86 -I$(top_srcdir)/hw/xfree86/include =
-I$(top_srcdir)/hw/xfree86/common -I$(top_srcdir)/hw/xfree86/os-support -I$=
(top_srcdir)/hw/xfree86/os-support/bus -I$(top_srcdir)/os'
XORG_LIBS=3D'$(top_builddir)/composite/libcomposite.la $(top_builddir)/xfix=
es/libxfixes.la $(top_builddir)/Xext/libXextbuiltin.la  $(top_builddir)/ran=
dr/librandr.la $(top_builddir)/render/librender.la $(top_builddir)/damageex=
t/libdamageext.la $(top_builddir)/miext/sync/libsync.la $(top_builddir)/mie=
xt/damage/libdamage.la $(top_builddir)/miext/shadow/libshadow.la $(top_buil=
ddir)/Xi/libXi.la $(top_builddir)/xkb/libxkb.la'
XORG_MAN_PAGE=3D'X Version 11'
XORG_MODULES_CFLAGS=3D' '
XORG_MODULES_LIBS=3D' '
XORG_OS=3D'linux'
XORG_OS_SUBDIR=3D'linux'
XORG_SGML_PATH=3D''
XORG_SYS_LIBS=3D' -lpciaccess    -lpthread  '
XORG_TRUE=3D''
XPBPROXY_CFLAGS=3D''
XPBPROXY_LIBS=3D''
XQUARTZ_FALSE=3D''
XQUARTZ_SPARKLE=3D'no'
XQUARTZ_SPARKLE_FALSE=3D''
XQUARTZ_SPARKLE_TRUE=3D'#'
XQUARTZ_TRUE=3D'#'
XREGISTRY_FALSE=3D'#'
XREGISTRY_TRUE=3D''
XRESEXAMPLES_DEP_CFLAGS=3D''
XRESEXAMPLES_DEP_LIBS=3D''
XSELINUX_FALSE=3D''
XSELINUX_TRUE=3D'#'
XSERVERCFLAGS_CFLAGS=3D'-D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -I/=
home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/pixman-1 -I/home/kyu3/s=
db/test/tmp/sysroots/qemux86/usr/include/freetype2  '
XSERVERCFLAGS_LIBS=3D'-lxkbfile -lpixman-1 -lXfont -lXau -lXdmcp  '
XSERVERLIBS_CFLAGS=3D'-I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/includ=
e/pixman-1 -I/home/kyu3/sdb/test/tmp/sysroots/qemux86/usr/include/freetype2=
  '
XSERVERLIBS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp  '
XSERVER_DTRACE_FALSE=3D''
XSERVER_DTRACE_TRUE=3D'#'
XSERVER_LIBS=3D'$(top_builddir)/dix/libdix.la $(top_builddir)/mi/libmi.la $=
(top_builddir)/os/libos.la'
XSERVER_SYS_LIBS=3D'-lpixman-1 -lXfont -lXau -lXdmcp    -lm '
XSL_STYLESHEET=3D''
XTSTEXAMPLES_DEP_CFLAGS=3D''
XTSTEXAMPLES_DEP_LIBS=3D''
XVFB_FALSE=3D''
XVFB_LIBS=3D''
XVFB_SYS_LIBS=3D''
XVFB_TRUE=3D'#'
XVMC_FALSE=3D'#'
XVMC_TRUE=3D''
XV_FALSE=3D'#'
XV_TRUE=3D''
XWINMODULES_CFLAGS=3D''
XWINMODULES_LIBS=3D''
XWIN_CLIPBOARD_FALSE=3D''
XWIN_CLIPBOARD_TRUE=3D'#'
XWIN_FALSE=3D''
XWIN_GLX_WINDOWS_FALSE=3D''
XWIN_GLX_WINDOWS_TRUE=3D'#'
XWIN_LIBS=3D''
XWIN_MULTIWINDOWEXTWM_FALSE=3D''
XWIN_MULTIWINDOWEXTWM_TRUE=3D'#'
XWIN_MULTIWINDOW_FALSE=3D''
XWIN_MULTIWINDOW_TRUE=3D'#'
XWIN_NATIVEGDI_FALSE=3D''
XWIN_NATIVEGDI_TRUE=3D'#'
XWIN_PRIMARYFB_FALSE=3D''
XWIN_PRIMARYFB_TRUE=3D'#'
XWIN_RANDR_FALSE=3D''
XWIN_RANDR_TRUE=3D'#'
XWIN_SERVER_NAME=3D''
XWIN_SYS_LIBS=3D''
XWIN_TRUE=3D'#'
XWIN_XV_FALSE=3D''
XWIN_XV_TRUE=3D'#'
YACC=3D'bison -y'
YFLAGS=3D''
__XCONFIGDIR__=3D'xorg.conf.d'
__XCONFIGFILE__=3D'xorg.conf'
abi_ansic=3D'0.4'
abi_extension=3D'5.0'
abi_videodrv=3D'10.0'
abi_xinput=3D'12.2'
ac_ct_AR=3D''
ac_ct_CC=3D''
ac_ct_DUMPBIN=3D''
am__EXEEXT_FALSE=3D''
am__EXEEXT_TRUE=3D'#'
am__fastdepCCAS_FALSE=3D'#'
am__fastdepCCAS_TRUE=3D''
am__fastdepCC_FALSE=3D'#'
am__fastdepCC_TRUE=3D''
am__fastdepOBJC_FALSE=3D''
am__fastdepOBJC_TRUE=3D'#'
am__include=3D'include'
am__isrc=3D''
am__leading_dot=3D'.'
am__quote=3D''
am__tar=3D'${AMTAR} chof - "$$tardir"'
am__untar=3D'${AMTAR} xf -'
bindir=3D'/usr/bin'
build=3D'x86_64-pc-linux-gnu'
build_alias=3D'x86_64-linux'
build_cpu=3D'x86_64'
build_os=3D'linux-gnu'
build_vendor=3D'pc'
datadir=3D'/usr/share'
datarootdir=3D'${prefix}/share'
docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
driverdir=3D'/usr/lib/xorg/modules/drivers'
dvidir=3D'${docdir}'
exec_prefix=3D'/usr'
extdir=3D'/usr/include/X11/extensions'
host=3D'i586-poky-linux-gnu'
host_alias=3D'i586-poky-linux'
host_cpu=3D'i586'
host_os=3D'linux-gnu'
host_vendor=3D'poky'
htmldir=3D'${docdir}'
includedir=3D'/usr/include'
infodir=3D'/usr/share/info'
install_sh=3D'${SHELL} /home/kyu3/sdb/test/tmp/work/i586-poky-linux/xserver=
-xf86-lite-1.10.1-r0/xorg-server-1.10.1/install-sh'
libdir=3D'/usr/lib'
libexecdir=3D'/usr/libexec'
localedir=3D'${datarootdir}/locale'
localstatedir=3D'/var'
logdir=3D'/var/log'
mandir=3D'/usr/share/man'
mkdir_p=3D'/bin/mkdir -p'
moduledir=3D'/usr/lib/xorg/modules'
oldincludedir=3D'/usr/include'
pdfdir=3D'${docdir}'
prefix=3D'/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
sbindir=3D'/usr/sbin'
sdkdir=3D'/usr/include/xorg'
sharedstatedir=3D'/com'
symbol_visibility=3D'-fvisibility=3Dhidden'
sysconfdir=3D'/etc/X11'
sysconfigdir=3D'/usr/share/X11/xorg.conf.d'
target_alias=3D'i586-poky-linux'

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "xorg-server"
#define PACKAGE_TARNAME "xorg-server"
#define PACKAGE_VERSION "1.10.1"
#define PACKAGE_STRING "xorg-server 1.10.1"
#define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi?produ=
ct=3Dxorg"
#define PACKAGE_URL ""
#define PACKAGE "xorg-server"
#define VERSION "1.10.1"
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define PACKAGE_VERSION_MAJOR 1
#define PACKAGE_VERSION_MINOR 10
#define PACKAGE_VERSION_PATCHLEVEL 1
#define HAVE_DLFCN_H 1
#define LT_OBJDIR ".libs/"
#define YYTEXT_POINTER 1
#define _FILE_OFFSET_BITS 64
#define HAVE_DIRENT_H 1
#define STDC_HEADERS 1
#define HAVE_FCNTL_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_UNISTD_H 1
#define HAVE_DLFCN_H 1
#define HAVE_STROPTS_H 1
#define HAVE_FNMATCH_H 1
#define HAVE_SYS_UTSNAME_H 1
#define SIZEOF_UNSIGNED_LONG 4
#define HAVE_BYTESWAP_H 1
#define HAVE_VPRINTF 1
#define HAVE_GETEUID 1
#define HAVE_GETUID 1
#define HAVE_LINK 1
#define HAVE_MEMMOVE 1
#define HAVE_MEMSET 1
#define HAVE_MKSTEMP 1
#define HAVE_STRCHR 1
#define HAVE_STRRCHR 1
#define HAVE_STRTOL 1
#define HAVE_GETOPT 1
#define HAVE_GETOPT_LONG 1
#define HAVE_VSNPRINTF 1
#define HAVE_BACKTRACE 1
#define HAVE_STRCASESTR 1
#define HAVE_FFS 1
#define HAVE_VASPRINTF 1
#define HAVE_ALLOCA_H 1
#define HAVE_ALLOCA 1
#define HAS_GETDTABLESIZE 1
#define HAS_GETIFADDRS 1
#define HAS_MMAP 1
#define HAVE_LIBM 1
#define HAVE_CBRT 1
#define HAVE_LINUX_AGPGART_H 1
#define HAVE_LINUX_APM_BIOS_H 1
#define HAVE_LINUX_FB_H 1
#define HAVE_ASM_MTRR_H 1
#define HAS_MTRR_SUPPORT 1
#define HAVE_SYSV_IPC 1
#define HAVE_BACKTRACE 1
#define HAVE_EXECINFO_H 1
#define LAUNCHD_ID_PREFIX "org.x"
#define TLS __thread
#define RETSIGTYPE void
#define UNIXCONN 1
#define TCPCONN 1
#define IPv6 1
#define HAVE_SOCKLEN_T 1
#define HAVE_AUTHDES_CREATE 1
#define SECURE_RPC 1
#define CONFIG_UDEV 1
#define HAVE_DBUS 1
#define USE_SIGIO_BY_DEFAULT TRUE
#define XV 1
#define XvExtension 1
#define XvMCExtension 1
#define XREGISTRY 1
#define COMPOSITE 1
#define MITSHM 1
#define HAS_SHM 1
#define SCREENSAVER 1
#define RES 1
#define DRI2 1
#define WITH_LIBDRM 1
#define DRI2_AIGLX 1
#define XACE 1
#define DBE 1
#define DPMSExtension 1
#define RENDER 1
#define RANDR 1
#define XFIXES 1
#define DAMAGE 1
#define XINPUT 1
#define SHAPE 1
#define XKB_BASE_DIRECTORY "/usr/share/X11/xkb"
#define XKB_BIN_DIRECTORY "/usr/bin"
#define XKM_OUTPUT_DIR "/var/lib/xkb/"
#define XKB_DFLT_RULES "base"
#define XKB_DFLT_MODEL "pc105"
#define XKB_DFLT_LAYOUT "us"
#define XKB_DFLT_VARIANT ""
#define XKB_DFLT_OPTIONS ""
#define XDMCP 1
#define HASXDMAUTH 1
#define COMPILEDDEFAULTFONTPATH "/usr/share/fonts/X11/misc/,/usr/share/font=
s/X11/TTF/,/usr/share/fonts/X11/OTF/,/usr/share/fonts/X11/Type1/,/usr/share=
/fonts/X11/100dpi/,/usr/share/fonts/X11/75dpi/"
#define PCI_TXT_IDS_PATH ""
#define SERVER_MISC_CONFIG_PATH "/usr/lib/xorg"
#define BASE_FONT_PATH "/usr/share/fonts/X11"
#define DRI_DRIVER_PATH "/usr/lib/dri"
#define XVENDORNAME "The X.Org Foundation"
#define XVENDORNAMESHORT "X.Org"
#define XORG_DATE "2011-04-15"
#define XORG_MAN_VERSION "Version 1.10.1"
#define BUILDERADDR "xorg@lists.freedesktop.org"
#define OSNAME "Linux 2.6.35-25-server x86_64"
#define OSVENDOR ""
#define BUILDERSTRING ""
#define VENDOR_NAME "The X.Org Foundation"
#define VENDOR_NAME_SHORT "X.Org"
#define VENDOR_RELEASE (((1) * 10000000) + ((10) * 100000) + ((1) * 1000) +=
 0)
#define VENDOR_MAN_VERSION "Version 1.10.1"
#define NO_LIBCWRAPPER 1
#define XTEST 1
#define XSYNC 1
#define XCMISC 1
#define BIGREQS 1
#define HAVE_SHA1_IN_LIBGCRYPT 1
#define HAVE_PCI_SYSTEM_INIT_DEV_MEM 1
#define HAVE_PCI_DEVICE_ENABLE 1
#define HAVE_PCI_DEVICE_IS_BOOT_VGA 1
#define HAVE_PCI_DEVICE_VGAARB_INIT 1
#define SUPPORT_PC98 1
#define XF86VIDMODE 1
#define XORG_SERVER 1
#define XORGSERVER 1
#define XFree86Server 1
#define XFree86LOADER 1
#define XORG_VERSION_CURRENT (((1) * 10000000) + ((10) * 100000) + ((1) * 1=
000) + 0)
#define NEED_XF86_TYPES 1
#define NEED_XF86_PROTOTYPES 1
#define __XSERVERNAME__ "Xorg"
#define __XCONFIGFILE__ "xorg.conf"
#define XF86CONFIGFILE "xorg.conf"
#define __XCONFIGDIR__ "xorg.conf.d"
#define DEFAULT_MODULE_PATH "/usr/lib/xorg/modules"
#define DEFAULT_LIBRARY_PATH "/usr/lib"
#define DEFAULT_LOGPREFIX "/var/log/Xorg."
#define __VENDORDWEBSUPPORT__ "http://wiki.x.org"
#define XSERVER_LIBPCIACCESS 1
#define WITH_VGAHW 1
#define _GNU_SOURCE 1
#define PROJECTROOT "/usr"

configure: exit 0

--------------020305060100000500050709--
