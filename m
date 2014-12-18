Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0147278B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rhu0021966
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:44 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:43 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:50:59 +0800
Message-ID: <08f94eb2eadf05e2f8846a9c786daf2f11345134.1418885577.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/19] siteinfo: account for 32 and 64 bit arm
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:51 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Pull wordsize related items from arm-common and put in
arm-32.  Leave them as they were.  Copy arm-32 to arm-64
and comment out all variables.  Re-define to correct
values leaving items which do not appear to be used
undefined.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/siteinfo.bbclass |  8 ++++----
 meta/site/arm-32              | 47 +++++++++++++++++++++++++++++++++++++++++++
 meta/site/arm-64              | 46 ++++++++++++++++++++++++++++++++++++++++++
 meta/site/arm-common          | 38 ----------------------------------
 4 files changed, 97 insertions(+), 42 deletions(-)
 create mode 100644 meta/site/arm-32
 create mode 100644 meta/site/arm-64

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index e90632a..b41db46 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -18,10 +18,10 @@
 def siteinfo_data(d):
     archinfo = {
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
-        "aarch64": "endian-little bit-64 arm-common",
-        "aarch64_be": "endian-big bit-64 arm-common",
-        "arm": "endian-little bit-32 arm-common",
-        "armeb": "endian-big bit-32 arm-common",
+        "aarch64": "endian-little bit-64 arm-common arm-64",
+        "aarch64_be": "endian-big bit-64 arm-common arm-64",
+        "arm": "endian-little bit-32 arm-common arm-32",
+        "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
         "bfin": "endian-little bit-32 bfin-common",
         "i386": "endian-little bit-32 ix86-common",
diff --git a/meta/site/arm-32 b/meta/site/arm-32
new file mode 100644
index 0000000..81fd8d3
--- /dev/null
+++ b/meta/site/arm-32
@@ -0,0 +1,47 @@
+# definitions assuming 32-bit arm architecture
+
+# apache
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
+
+# glib
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+
+# glib-2.0
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
+
+# jikes
+ac_cv_sizeof_wchar_t=4
+
+# ORBit2
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_double=8
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_long=4
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_pointer=4
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_struct=1
+ac_cv_alignof_CORBA_wchar=2
+
+# at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
diff --git a/meta/site/arm-64 b/meta/site/arm-64
new file mode 100644
index 0000000..90c09b2d54
--- /dev/null
+++ b/meta/site/arm-64
@@ -0,0 +1,46 @@
+# definitions assuming 64-bit arm architecture
+
+# general
+ac_cv_sizeof_wchar_t=4
+ac_cv_sizeof_size_t=8
+ac_cv_sizeof_ssize_t=8
+ac_cv_alignof_char=1
+ac_cv_alignof_double=8
+
+# glib
+#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+#glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+
+# glib-2.0
+#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+#glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+#glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+#glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
+#glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# ORBit2 (should be in meta-gnome/site/arm-64)
+#ac_cv_alignof_CORBA_boolean=1
+#ac_cv_alignof_CORBA_char=1
+#ac_cv_alignof_CORBA_double=8
+#ac_cv_alignof_CORBA_float=4
+#ac_cv_alignof_CORBA_long=4
+#ac_cv_alignof_CORBA_long_double=8
+#ac_cv_alignof_CORBA_long_long=8
+#ac_cv_alignof_CORBA_octet=1
+#ac_cv_alignof_CORBA_pointer=4
+#ac_cv_alignof_CORBA_short=2
+#ac_cv_alignof_CORBA_struct=1
+#ac_cv_alignof_CORBA_wchar=2
+
+# at-spi2-core
+ac_cv_alignof_dbind_pointer=8
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+
diff --git a/meta/site/arm-common b/meta/site/arm-common
index 1893dc0..12e5d45 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -11,7 +11,6 @@ ac_cv_sctp=${ac_cv_sctp=no}
 # apache
 ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
 apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # bash
@@ -51,8 +50,6 @@ ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
 # glib
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
@@ -60,7 +57,6 @@ glib_cv_has__inline=${glib_cv_has__inline=yes}
 glib_cv_has__inline__=${glib_cv_has__inline__=yes}
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
@@ -70,15 +66,7 @@ glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_po
 
 # glib-2.0
 glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
-glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
-glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=4
 
 #gstreamer
 as_cv_unaligned_access=${as_cv_unaligned_access=no}
@@ -86,9 +74,6 @@ as_cv_unaligned_access=${as_cv_unaligned_access=no}
 # httppc
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 
-# jikes
-ac_cv_sizeof_wchar_t=4
-
 # lftp
 ac_cv_need_trio=${ac_cv_need_trio=no}
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
@@ -119,20 +104,6 @@ mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 ac_cv_regexec_segfault_emptystr=${ac_cv_regexec_segfault_emptystr=no}
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-
 # php
 ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
@@ -186,12 +157,3 @@ jm_cv_func_working_readdir=yes
 # evolution-data-server
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
 
-# at-spi2-core
-ac_cv_alignof_char=1
-ac_cv_alignof_dbind_pointer=4
-ac_cv_alignof_dbind_struct=1
-ac_cv_alignof_dbus_bool_t=4
-ac_cv_alignof_dbus_int16_t=2
-ac_cv_alignof_dbus_int32_t=4
-ac_cv_alignof_dbus_int64_t=8
-ac_cv_alignof_double=8
-- 
1.9.1


