Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TvURR-000440-E7
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 15:58:20 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob115.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUPa8bWrQBsz+1tSR6/3C9Zpr9uRTo5LG@postini.com;
	Wed, 16 Jan 2013 14:42:53 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 430D8135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 14:15:51 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93B964C62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 14:15:51 +0000 (GMT)
Received: from localhost ([164.130.129.16]) by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AVK49684 (AUTH condorg);
	Wed, 16 Jan 2013 15:15:51 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 15:14:07 +0100
Message-Id: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] eglibc: fix as and ld check in libc dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 14:58:21 -0000

Fix routine to check as and ld version check in the configure, to allow system
to correctly check for version 2.1x.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
---
 .../eglibc-2.16_fix_as_ld_ver_check.patch          |   23 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
new file mode 100644
index 0000000..a8a2344
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
@@ -0,0 +1,23 @@
+Fix as and ld checking steps to allow system to correctly check 2.1x versions.
+
+Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com> 
+--- libc.orig/configure	2013-01-16 12:07:18.146902148 +0100
++++ libc/configure	2013-01-16 12:08:10.598911559 +0100
+@@ -4757,7 +4757,7 @@ $as_echo_n "checking version of $AS... "
+   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -4820,7 +4820,7 @@ $as_echo_n "checking version of $LD... "
+   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 2dcaceb..fbc1499 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://tzselect-sh.patch \
            file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
+	   file://eglibc-2.16_fix_as_ld_ver_check.patch \
           "
 
 SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
@@ -69,7 +70,7 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+#FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
-- 
1.7.7.6



