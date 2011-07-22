Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkIem-0007jI-5v
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:32:56 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MGSkMn010603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:28:47 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 09:28:43 -0700
Message-Id: <f97cab1707748199655f5476d35e6a0c83328d06.1311352057.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
Subject: [PATCH 8/8] siteinfo: Move (getpgrp|setpgrp|setgrent|*get{pwuid, grgid}) to common-libc
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
X-List-Received-Date: Fri, 22 Jul 2011 16:32:56 -0000

These functions are determined by the C library so move them to common-glibc
and common-uclibc

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common          |    4 ----
 meta/site/arm-linux           |    5 -----
 meta/site/arm-linux-uclibc    |    5 -----
 meta/site/armeb-linux         |    5 -----
 meta/site/armeb-linux-uclibc  |    5 -----
 meta/site/common-glibc        |    7 +++++++
 meta/site/common-uclibc       |    7 +++++++
 meta/site/ix86-common         |    6 ------
 meta/site/mips-linux          |    6 ------
 meta/site/mips-linux-uclibc   |    6 ------
 meta/site/mipsel-linux        |    6 ------
 meta/site/mipsel-linux-uclibc |    4 ----
 meta/site/powerpc-common      |    6 ------
 meta/site/powerpc-linux       |    6 ------
 meta/site/sh-common           |    4 ----
 meta/site/sparc-linux         |    4 ----
 meta/site/x86_64-linux        |    6 ------
 meta/site/x86_64-linux-uclibc |    5 -----
 18 files changed, 14 insertions(+), 83 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index c216b57..04d1164 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -48,9 +48,6 @@ ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 # gettext
 am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
-# gio
-ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
-
 # glib
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
@@ -67,7 +64,6 @@ glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 69d251d..762d489 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -1,8 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
diff --git a/meta/site/arm-linux-uclibc b/meta/site/arm-linux-uclibc
index 1e283ef..c5c430c 100644
--- a/meta/site/arm-linux-uclibc
+++ b/meta/site/arm-linux-uclibc
@@ -1,8 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
index ecff3da..6521ff5 100644
--- a/meta/site/armeb-linux
+++ b/meta/site/armeb-linux
@@ -1,8 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
diff --git a/meta/site/armeb-linux-uclibc b/meta/site/armeb-linux-uclibc
index 8365810..731e857 100644
--- a/meta/site/armeb-linux-uclibc
+++ b/meta/site/armeb-linux-uclibc
@@ -1,8 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 9339655..8cfa695 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -5,6 +5,13 @@ ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
+ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
 
 # bash
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 8ea192c..093f60e 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -4,6 +4,13 @@ ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
+ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index ea8937e..2ead4e1 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -21,15 +21,11 @@ ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
 ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
 ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=4}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
 
 ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
@@ -106,9 +102,7 @@ glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # guile
 ac_cv_uchar=${ac_cv_uchar=no}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index a8e52ae..86d396e 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -1,7 +1,4 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
@@ -35,9 +32,7 @@ glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
@@ -55,7 +50,6 @@ lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
 # ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index a8e52ae..86d396e 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -1,7 +1,4 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
@@ -35,9 +32,7 @@ glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
@@ -55,7 +50,6 @@ lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
 # ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index fc2a9c0..4070055 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -1,7 +1,5 @@
 
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
@@ -35,10 +33,7 @@ glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
@@ -56,7 +51,6 @@ lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
 # ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index c589cfd..aaf47c0 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -1,7 +1,4 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
@@ -48,7 +45,6 @@ lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
 # ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
index e5b9f54..67602fd 100644
--- a/meta/site/powerpc-common
+++ b/meta/site/powerpc-common
@@ -1,8 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
@@ -117,7 +112,6 @@ glib_cv_va_copy=${glib_cv_va_copy=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index 93a94f5..74eb0a7 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -1,9 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
 # startup-notification
 lf_cv_sane_realloc=yes
 
diff --git a/meta/site/sh-common b/meta/site/sh-common
index ce7c41b..3fe00f0 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -1,6 +1,3 @@
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
@@ -127,7 +124,6 @@ glib_cv_va_copy=${glib_cv_va_copy=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
index a0ac8d1..49d0d9a 100644
--- a/meta/site/sparc-linux
+++ b/meta/site/sparc-linux
@@ -1,7 +1,3 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 48e94da..968dedc 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -1,10 +1,6 @@
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
@@ -96,8 +92,6 @@ ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=1
 ac_cv_alignof_CORBA_wchar=2
 
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
 sudo_cv_uid_t=${sudo_cv_uid_t_len=10}
 lf_cv_sane_realloc=yes
 as_cv_unaligned_access=${as_cv_unaligned_access=yes}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index be74642..4699240 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -1,10 +1,6 @@
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
@@ -65,7 +61,6 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
 # glib-2.0
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-- 
1.7.0.4



