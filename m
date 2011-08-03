Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjk-0004Tu-Gw
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912967"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:14 -0700
Message-Id: <ed918d6a64d05089dcb0c30b7cc70fb1767fff67.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 30/33] Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:32 -0000

From: Tom Rini <tom_rini@mentor.com>

Providing va_copy / __va_copy come down to the libc.  va_val_copy
comes down to the architecture.  Unfortunately it's assumed true
if not set, so we need to make sure to set this to false for
x86_64 where it is not true.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common          |   17 ++---------------
 meta/site/common-glibc        |    5 +++++
 meta/site/common-uclibc       |    6 ++++++
 meta/site/ix86-common         |   17 +++--------------
 meta/site/mips-common         |   18 +++++++++++++-----
 meta/site/mips-linux          |   12 +-----------
 meta/site/mips-linux-uclibc   |   12 +-----------
 meta/site/mipsel-linux        |   12 +-----------
 meta/site/mipsel-linux-uclibc |    8 +-------
 meta/site/powerpc-linux       |   12 +++++++++---
 meta/site/powerpc32-linux     |    9 ---------
 meta/site/sh-common           |   13 ++-----------
 meta/site/x86_64-linux        |   13 +++++++------
 meta/site/x86_64-linux-uclibc |   11 ++++++++---
 14 files changed, 59 insertions(+), 106 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 65ebd06..d5a55b6 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -1,3 +1,5 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
@@ -60,9 +62,7 @@ glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
@@ -83,19 +83,12 @@ as_cv_unaligned_access=${as_cv_unaligned_access=no}
 # httppc
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 
-# ipsec-tools
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-
 # jikes
 ac_cv_sizeof_wchar_t=4
 
 # lftp
 ac_cv_need_trio=${ac_cv_need_trio=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=yes}
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-lftp_cv___va_copy=${lftp_cv___va_copy=yes}
 
 # libesmtp
 acx_working_snprintf=${acx_working_snprintf=yes}
@@ -168,8 +161,6 @@ screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
 screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
 # slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
 # socat
@@ -189,9 +180,5 @@ lf_cv_sane_realloc=yes
 # xffm
 jm_cv_func_working_readdir=yes
 
-# dpkg
-dpkg_cv_va_copy=${ac_cv_va_copy=yes}
-dpkg_cv___va_copy=${ac_cv___va_copy=yes}
-
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 7946023..15bd8dd 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -67,3 +67,8 @@ gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
 gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
 gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
 
+# va_copy and _va_copy
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
+ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
+ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index f6e0b44..178015f 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -27,3 +27,9 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
+
+# va_copy and _va_copy
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
+ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
+ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index f89835d..0aa54c7 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -1,3 +1,4 @@
+# general
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
 ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
@@ -27,6 +28,7 @@ ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
 
 ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
 ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
@@ -71,9 +73,6 @@ db_cv_sprintf_count=${db_cv_sprintf_count=yes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
-dpkg_cv_va_copy=${ac_cv_va_copy=no}
-dpkg_cv___va_copy=${ac_cv___va_copy=yes}
-
 # ettercap
 ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
 
@@ -91,8 +90,6 @@ glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_po
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
 
@@ -110,18 +107,12 @@ ac_cv_ushort=${ac_cv_ushort=yes}
 # intercom
 ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 
-# ipsec-tools
-ac_cv_va_copy=${ac_cv_va_copy=no}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-
 # jikes-native
 ac_cv_sizeof_wchar_t=4
 
 # lftp
 ac_cv_need_trio=${ac_cv_need_trio=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=no}
-lftp_cv___va_copy=${lftp_cv___va_copy=yes}
+lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
 
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
@@ -188,8 +179,6 @@ screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
 screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
 # slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
 # ssh
diff --git a/meta/site/mips-common b/meta/site/mips-common
index e7eb3af..df8da05 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -1,3 +1,6 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
+
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
@@ -26,9 +29,14 @@ ac_cv_alignof_CORBA_long_double=8
 ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_struct=1
 
-# dpkg
-dpkg_cv_va_copy=${ac_cv_va_copy=yes}
-dpkg_cv___va_copy=${ac_cv___va_copy=yes}
-
-# apr
+# apache
+ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
+apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
+ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
+
+# glib
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# slrn
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index e90b983..b1f8be2 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -1,3 +1,4 @@
+# general
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 
 # bash
@@ -26,8 +27,6 @@ glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
@@ -37,11 +36,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
@@ -84,10 +78,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
-# popt
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
 
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index e90b983..b1f8be2 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -1,3 +1,4 @@
+# general
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 
 # bash
@@ -26,8 +27,6 @@ glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
@@ -37,11 +36,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
@@ -84,10 +78,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
-# popt
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
 
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 7292f6f..3c70af0 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -1,4 +1,4 @@
-
+# general
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 
 # bash
@@ -27,8 +27,6 @@ glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
@@ -38,11 +36,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
@@ -84,9 +77,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-# popt
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
 
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index ed426a9..cdf4757 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -1,3 +1,4 @@
+# general
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 
 # bash
@@ -26,17 +27,10 @@ glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index 74eb0a7..ac681b2 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -1,11 +1,17 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
+
 # startup-notification
 lf_cv_sane_realloc=yes
 
 # glib
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 
-# popt/rpm
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
+# lftp
+lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
+
+# slrn
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 60dad35..4550df3 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -114,9 +114,7 @@ glib_cv_has__inline__=${glib_cv_has__inline__=yes}
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_va_copy=${glib_cv_va_copy=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
@@ -147,9 +145,7 @@ ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 
 # lftp
 ac_cv_need_trio=${ac_cv_need_trio=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=no}
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-lftp_cv___va_copy=${lftp_cv___va_copy=yes}
 
 # edb
 db_cv_spinlocks=${db_cv_spinlocks=no}
@@ -160,8 +156,6 @@ compat_cv_func_basename_works=${compat_cv_func_basename_works=no}
 compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 
 # slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
 # libidl
@@ -275,9 +269,6 @@ samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 
-# dpkg
-dpkg_cv_va_copy=${ac_cv_va_copy=yes}
-dpkg_cv___va_copy=${ac_cv___va_copy=yes}
 
 # libc
 libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 6d57a08..d2db0c6 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -1,3 +1,5 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
@@ -120,9 +122,7 @@ glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
@@ -156,9 +156,7 @@ ac_cv_sizeof_wchar_t=4
 
 # lftp
 ac_cv_need_trio=${ac_cv_need_trio=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=no}
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-lftp_cv___va_copy=${lftp_cv___va_copy=yes}
 
 # edb
 db_cv_spinlocks=${db_cv_spinlocks=no}
@@ -169,8 +167,6 @@ compat_cv_func_basename_works=${compat_cv_func_basename_works=no}
 compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 
 # slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
 # startup-notification
@@ -227,11 +223,6 @@ rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
 
-# ipsec-tools
-ac_cv_va_copy=${ac_cv_va_copy=no}
-ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-
 # libxfce4util
 with_broken_putenv=${with_broken_putenv=no}
 
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 91965b9..f3a6ea1 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -1,3 +1,5 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=no}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
@@ -49,10 +51,8 @@ glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_po
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=yes}
+
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
 screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
@@ -103,7 +103,8 @@ nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
 #apr
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
-# rpm
-rpm_ac_cv_va_copy=${ac_cv_va_copy=yes}
-rpm_ac_cv___va_copy=${ac_cv___va_copy=yes}
+# lftp
+lftp_cv_va_val_copy=${lftp_cv_va_val_copy=no}
 
+# slrn
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=no}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index 6eb5285..bad2ed9 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -1,3 +1,5 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=no}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
@@ -39,10 +41,7 @@ glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_po
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
-lftp_cv_va_copy=${lftp_cv_va_copy=yes}
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
 screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
@@ -81,3 +80,9 @@ ac_cv_alignof_CORBA_wchar=2
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# lftp
+lftp_cv_va_val_copy=${lftp_cv_va_val_copy=no}
+
+# slrn
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=no}
-- 
1.7.3.4



