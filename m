Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QlYP8-00035b-Vb
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 05:33:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6Q3TjpP004531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jul 2011 20:29:45 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 25 Jul 2011 20:29:44 -0700
Message-ID: <da5e1f617eb655c8043ed99efad98e46cfab1401.1311648798.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311648798.git.kai.kang@windriver.com>
References: <cover.1311648798.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 10:29:22 +0800
Date: Tue, 26 Jul 2011 11:29:40 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] at: enable pam support
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
X-List-Received-Date: Tue, 26 Jul 2011 03:33:59 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

add patches to make at enable pam support

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 ++++++++++++++++++++
 meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   21 ++++++++++++++++++
 meta/recipes-extended/at/at_3.1.12.bb              |   21 ++++++++++++++---
 3 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
 create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch

diff --git a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
new file mode 100644
index 0000000..1f73cdd
--- /dev/null
+++ b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
@@ -0,0 +1,23 @@
+--- at-3.1.12/configure.ac	2011-06-23 14:51:03.653572945 +0800
++++ at-3.1.12/configure.ac.new	2011-06-27 16:12:14.903572945 +0800
+@@ -81,10 +81,18 @@
+ AC_FUNC_VPRINTF
+ AC_FUNC_GETLOADAVG
+ AC_CHECK_FUNCS(getcwd mktime strftime setreuid setresuid sigaction waitpid)
++
++AC_ARG_WITH([pam],
++  [AS_HELP_STRING([--without-pam], [without PAM support])])
++
++if test "x$with_pam" != xno; then
+ AC_CHECK_HEADERS(security/pam_appl.h, [
+   PAMLIB="-lpam"
+-  AC_DEFINE(HAVE_PAM, 1, [Define to 1 for PAM support])
+-])
++  AC_DEFINE(HAVE_PAM, 1, [Define to 1 for PAM support])],
++   [if test "x$with_pam" = xyes; then
++   AC_MSG_ERROR([PAM selected but security/pam_misc.h not found])
++   fi])
++fi
+
+ dnl Checking for programs
+
diff --git a/meta/recipes-extended/at/at-3.1.12/pam.conf.patch b/meta/recipes-extended/at/at-3.1.12/pam.conf.patch
new file mode 100644
index 0000000..dfe76d7
--- /dev/null
+++ b/meta/recipes-extended/at/at-3.1.12/pam.conf.patch
@@ -0,0 +1,21 @@
+oe doesn't support "@include", use the concrete directive instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+--- at-3.1.12/pam.conf.orig	2009-11-23 23:11:52.000000000 +0800
++++ at-3.1.12/pam.conf	2011-07-15 11:14:04.132818950 +0800
+@@ -2,8 +2,8 @@
+ # The PAM configuration file for the at daemon
+ #
+
+-auth	required	pam_env.so
+-@include common-auth
+-@include common-account
+-@include common-session-noninteractive
+-session    required   pam_limits.so
++auth    required    pam_env.so
++auth    include     common-auth
++account include     common-account
++session include     common-session-noninteractive
++session required    pam_limits.so
diff --git a/meta/recipes-extended/at/at_3.1.12.bb b/meta/recipes-extended/at/at_3.1.12.bb
index 3a94497..c76b50e 100644
--- a/meta/recipes-extended/at/at_3.1.12.bb
+++ b/meta/recipes-extended/at/at_3.1.12.bb
@@ -4,10 +4,11 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex libpam initscripts"
+DEPENDS = "flex libpam initscripts \
+	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
@@ -17,7 +18,11 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://posixtm.c \
     file://posixtm.h \
     file://file_replacement_with_gplv2.patch \
-    file://S99at"
+    file://S99at \
+    ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://pam.conf.patch \
+               file://configure-add-enable-pam.patch"
 
 SRC_URI[md5sum] = "1e67991776148fb319fd77a2e599a765"
 SRC_URI[sha256sum] = "7c55c6ab4fbe8add9e68f31b2b0ebf3fe805c9a4e7cfb2623a3d8a4789cc18f3"
@@ -26,7 +31,8 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
                  --with-daemon_groupname=root \
                  --with-jobdir=/var/spool/at/jobs \
-                 --with-atspool=/var/spool/at/spool"
+                 --with-atspool=/var/spool/at/spool \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} "
 
 inherit autotools
 
@@ -41,6 +47,13 @@ do_install () {
 	install -d ${D}${sysconfdir}/rcS.d
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
 	ln -sf		../init.d/atd		${D}${sysconfdir}/rcS.d/S99at
+
+	for feature in ${DISTRO_FEATURES}; do
+		if [ "$feature" = "pam" ]; then
+			install -D -m 0644 ${WORKDIR}/${P}/pam.conf ${D}${sysconfdir}/pam.d/atd
+			break
+		fi
+	done
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.5.1.300.gc565c



