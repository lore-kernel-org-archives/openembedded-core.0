Return-Path: <pespin@sysmocom.de>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB387F89B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:57:36 +0000 (UTC)
Received: from public-mail (mail.sysmocom.de [144.76.43.93])
	by mail.sysmocom.de (Postfix) with ESMTP id F35155005AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at sysmocom.de
Received: from mail.sysmocom.de ([144.76.43.93])
	by public-mail (mail.sysmocom.de [144.76.43.93]) (amavisd-new,
	port 10024)
	with ESMTP id rdYJnRdgN8jD; Tue, 14 Jan 2020 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [93.176.188.146])
	by mail.sysmocom.de (Postfix) with ESMTPSA id A4A40500593;
	Tue, 14 Jan 2020 13:57:30 +0000 (UTC)
From: Pau Espin Pedrol <pespin@sysmocom.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:57:13 +0100
Message-Id: <20200114135713.10567-1-pespin@sysmocom.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114131758.9938-1-pespin@sysmocom.de>
References: <20200114131758.9938-1-pespin@sysmocom.de>
MIME-Version: 1.0
Cc: Pau Espin Pedrol <pespin@sysmocom.de>
Subject: [PATCH] site: Remove sctp related configs
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
X-List-Received-Date: Tue, 14 Jan 2020 13:57:36 -0000
Content-Transfer-Encoding: 8bit

They are preventing autotools from checking netinet/sctp.h existence
successfuly which in turn makes configure.ac files with lines similar to
this to fail, even if DEPENDS="lksctp-tools" and netinet/sctp.h is
clearly available under recipe-sysroot/:
AC_CHECK_HEADERS(netinet/sctp.h,,AC_MSG_ERROR(netinet/sctp.h not found))

This is the case for new libosmo-netif versionsi (meta-telephony branch
laforge/nightly), which expects netinet/sctp.h to be available if default
flag --enable-libsctp is used.

Without this patch, do_configure will fail unless following line is used
in the recipe:
CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'libsctp', 'ac_cv_header_netinet_sctp_h=yes', '',d)}"

So removing ac_cv_header_netinet_sctp_h would be enough, but I couldn't
find any good information on why the other 2 variables were set in site
config files, hence no good reason to keep them.

Signed-off-by: Pau Espin Pedrol <pespin@sysmocom.de>
---
 meta/site/arm-common      | 3 ---
 meta/site/ix86-common     | 3 ---
 meta/site/nios2-linux     | 3 ---
 meta/site/powerpc32-linux | 4 ----
 meta/site/sh-common       | 4 ----
 5 files changed, 17 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 198c98c6a7..8c37f3fc24 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -4,9 +4,6 @@ ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_sl
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
-ac_cv_sctp=${ac_cv_sctp=no}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index c5e354c073..a2384372db 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -27,10 +27,7 @@ ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
 ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
 
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_sctp=${ac_cv_sctp=no}
 
 ac_cv_path_ESD_CONFIG=no
 lf_cv_sane_realloc=yes
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 67a3fc8a75..8ac198a0cd 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -2,9 +2,6 @@ ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_sl
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
-ac_cv_sctp=${ac_cv_sctp=no}
 
 # apache
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index f37e915cb3..172a06cc46 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -39,10 +39,6 @@ cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
 # apache
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
-ac_cv_sctp=${ac_cv_sctp=no}
-
 # ssh
 ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_dirent_have_space_d_name=yes}
 ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 97c96934d7..6bda1c237c 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -31,10 +31,6 @@ ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
 # apache
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
-ac_cv_sctp=${ac_cv_sctp=no}
-
 # ssh
 ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_dirent_have_space_d_name=yes}
 ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-- 
2.24.1


