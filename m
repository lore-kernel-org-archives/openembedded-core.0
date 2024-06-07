Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D1C27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38220.1717754829002627864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0519A2F4
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43CE83F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] site: move ac_cv_func_fnmatch_works to libc files
Date: Fri,  7 Jun 2024 10:07:01 +0000
Message-Id: <20240607100706.3174227-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200428

ac_cv_func_fnmatch_works (as set by AC_FUNC_FNMATCH) checks if the libc
has a POSIX-compliant fnmatch() implementation. This isn't architecture
specific, so move the definition to common-glibc and common-musl after
verifying the correct result.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arm-common          | 3 ---
 meta/site/common-glibc        | 1 +
 meta/site/common-musl         | 1 +
 meta/site/ix86-common         | 3 ---
 meta/site/mips-linux          | 3 ---
 meta/site/mips64-linux        | 3 ---
 meta/site/mips64el-linux      | 3 ---
 meta/site/mipsel-linux        | 3 ---
 meta/site/mipsisa32r6-linux   | 3 ---
 meta/site/mipsisa32r6el-linux | 3 ---
 meta/site/mipsisa64r6-linux   | 3 ---
 meta/site/mipsisa64r6el-linux | 3 ---
 meta/site/nios2-linux         | 3 ---
 meta/site/sh-common           | 3 ---
 meta/site/x86_64-linux        | 3 ---
 15 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 18c6d422008..d1dd8848118 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -35,9 +35,6 @@ compat_cv_func_snprintf_works=3D${compat_cv_func_snprin=
tf_works=3Dyes}
 compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
 compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
=20
-# fnmatch
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 958699b143f..822e30d3c7f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -14,6 +14,7 @@ ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwu=
id_r=3Dyes}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
 ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
 ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
+ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
=20
 # bash
 bash_cv_getcwd_malloc=3D${bash_cv_getcwd_malloc=3Dyes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 0fd0413819e..4c2c4092a88 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -17,6 +17,7 @@ ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_=
mapped=3Dyes}
 ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
 # off_t is always 64bit on musl systems
 ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}
+ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
=20
 #dbus-glib
 ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index eae5670d937..a0e57caadf5 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -75,9 +75,6 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
 ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
 ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # jikes-native
 ac_cv_sizeof_wchar_t=3D4
=20
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 91570ec3098..dbd2ae5d1f4 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -44,9 +44,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index 7e05b94a093..da804d4ae6f 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -44,9 +44,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 1e1d7687c28..060bf81807e 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -45,9 +45,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 #lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index a3077f21610..ae190b74f38 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -45,9 +45,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 #lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index 91570ec3098..dbd2ae5d1f4 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -44,9 +44,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linu=
x
index a3077f21610..ae190b74f38 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -45,9 +45,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 #lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index 7e05b94a093..da804d4ae6f 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -44,9 +44,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linu=
x
index 1e1d7687c28..060bf81807e 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -45,9 +45,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 # vim
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
-# intercom
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 #lmbench
 ac_cv_uint=3D${ac_cv_unit=3Dyes}
=20
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 58ffcbc7e2f..57c3f5b988d 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -47,9 +47,6 @@ compat_cv_func_snprintf_works=3D${compat_cv_func_snprin=
tf_works=3Dyes}
 compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
 compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
=20
-# fnmatch
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 720d4543518..f2481652c98 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -150,9 +150,6 @@ mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=
=3Dno}
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-# fnmatch
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
-
 # rsync
 rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
 rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index ed9c88fa20f..b9ee141fd5c 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -83,6 +83,3 @@ ac_cv_func__restgpr_14_x=3Dno
=20
 # cvs
 cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
-
-# cabextract
-ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
--=20
2.34.1


