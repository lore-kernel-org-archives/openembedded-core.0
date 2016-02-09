Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4398A73170
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:46:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2016 09:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="911733533"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2016 09:45:58 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 170C46A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:33:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 19:48:50 +0200
Message-Id: <1455040131-22507-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
References: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] quota: update to version 4.03
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
X-List-Received-Date: Tue, 09 Feb 2016 17:46:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.02 -> 4.03

a) Added PACKAGECONFIG for ldapmail
b) Added the following backported patches
        1. 0001-Fix-build-with-disabled-ldap.patch
        2. 0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch

c) Removed following patch due to changes in buildsystem
        1. config-tcpwrappers.patch
d) Added libnl and dbus in build-deps

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...dentaly-override-commandline-passed-CFLAG.patch | 33 ++++++++
 .../quota/0001-Fix-build-with-disabled-ldap.patch  | 93 ++++++++++++++++++++++
 .../quota/quota/config-tcpwrappers.patch           | 75 -----------------
 .../quota/{quota_4.02.bb => quota_4.03.bb}         | 23 +++---
 4 files changed, 135 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
 create mode 100644 meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
 delete mode 100644 meta/recipes-extended/quota/quota/config-tcpwrappers.patch
 rename meta/recipes-extended/quota/{quota_4.02.bb => quota_4.03.bb} (69%)

diff --git a/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch b/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
new file mode 100644
index 0000000..6add470
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
@@ -0,0 +1,33 @@
+From 776757a23e9930588950c7fcbc7827ec7a3e51c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Chv=C3=A1tal?= <tchvatal@suse.com>
+Date: Mon, 4 Jan 2016 15:48:19 +0100
+Subject: [PATCH] Do not accidentaly override commandline passed CFLAGS.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+Signed-off-by: Tomáš Chvátal <tchvatal@suse.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3ba1386..1552c15 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,7 +53,7 @@ AS_IF([test "x${prefix}" = "xNONE"], [
+ # ================
+ # Check for cflags
+ # ================
+-CFLAGS="-D_GNU_SOURCE -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
++CFLAGS="$CFLAGS -D_GNU_SOURCE -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
+ AC_ARG_ENABLE([werror],
+     [AS_HELP_STRING([--enable-werror], [Treat all warnings as errors, useful for development])],
+     [enable_werror="$enableval"],
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch b/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
new file mode 100644
index 0000000..a79e477
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
@@ -0,0 +1,93 @@
+From 39fd30ce57e3c34c3649866bf9345a71f0b78667 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Mon, 4 Jan 2016 15:10:53 +0100
+Subject: [PATCH] Fix build with disabled ldap
+
+Upstream-Status: Backport
+
+Reported-by: Tomas Chvatal <tchvatal@suse.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ warnquota.c | 36 ++++++++++++++++++------------------
+ 1 file changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/warnquota.c b/warnquota.c
+index 3734f0e..e9868c1 100644
+--- a/warnquota.c
++++ b/warnquota.c
+@@ -109,13 +109,13 @@ struct configparams {
+ 	char *user_signature;
+ 	char *group_message;
+ 	char *group_signature;
++	time_t cc_before;
++#ifdef USE_LDAP_MAIL_LOOKUP
+ 	int use_ldap_mail; /* 0 */
++	int ldap_is_setup; /* 0 */
+ 	int ldap_starttls; /* 0 */
+ 	int ldap_tls; /* LDAP_OPT_X_TLS_NEVER */
+ 	int ldap_vers; /* LDAP_VERSION3 */
+-	time_t cc_before;
+-#ifdef USE_LDAP_MAIL_LOOKUP
+-	int ldap_is_setup; /* 0 */
+ 	char ldap_host[CNF_BUFFER];
+ 	int ldap_port;
+ 	char ldap_uri[CNF_BUFFER];
+@@ -729,13 +729,13 @@ static int readconfigfile(const char *filename, struct configparams *config)
+ 	}
+ 	maildev[0] = 0;
+ 	config->user_signature = config->user_message = config->group_signature = config->group_message = NULL;
++	config->cc_before = -1;
++
++#ifdef USE_LDAP_MAIL_LOOKUP
+ 	config->use_ldap_mail = 0;
+ 	config->ldap_starttls = 0;
+ 	config->ldap_tls = LDAP_OPT_X_TLS_NEVER;
+ 	config->ldap_vers = LDAP_VERSION3;
+-	config->cc_before = -1;
+-
+-#ifdef USE_LDAP_MAIL_LOOKUP
+ 	config->ldap_port = config->ldap_is_setup = 0;
+ 	config->ldap_host[0] = 0;
+ 	config->ldap_uri[0] = 0;
+@@ -820,6 +820,18 @@ static int readconfigfile(const char *filename, struct configparams *config)
+ 				create_eoln(config->group_signature);
+ 				verify_format(config->group_signature, "GROUP_SIGNATURE");
+ 			}
++			else if (!strcmp(var, "CC_BEFORE")) {
++				int num;
++				char unit[10];
++
++				if (sscanf(value, "%d%s", &num, unit) != 2)
++					goto cc_parse_err;
++				if (str2timeunits(num, unit, &config->cc_before) < 0) {
++cc_parse_err:
++					die(1, _("Cannot parse time at CC_BEFORE variable (line %d).\n"), line);
++				}
++			}
++#ifdef USE_LDAP_MAIL_LOOKUP
+ 			else if (!strcmp(var, "LDAP_MAIL")) {
+ 				if(strcasecmp(value, "true") == 0) 
+ 					config->use_ldap_mail = 1;
+@@ -846,18 +858,6 @@ static int readconfigfile(const char *filename, struct configparams *config)
+ 				else
+ 					config->ldap_starttls = 0;
+ 			}
+-			else if (!strcmp(var, "CC_BEFORE")) {
+-				int num;
+-				char unit[10];
+-
+-				if (sscanf(value, "%d%s", &num, unit) != 2)
+-					goto cc_parse_err;
+-				if (str2timeunits(num, unit, &config->cc_before) < 0) {
+-cc_parse_err:
+-					die(1, _("Cannot parse time at CC_BEFORE variable (line %d).\n"), line);
+-				}
+-			}
+-#ifdef USE_LDAP_MAIL_LOOKUP
+ 			else if (!strcmp(var, "LDAP_HOST"))
+ 				sstrncpy(config->ldap_host, value, CNF_BUFFER);
+ 			else if (!strcmp(var, "LDAP_PORT"))
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/quota/quota/config-tcpwrappers.patch b/meta/recipes-extended/quota/quota/config-tcpwrappers.patch
deleted file mode 100644
index 5f47fbd..0000000
--- a/meta/recipes-extended/quota/quota/config-tcpwrappers.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Upstream-Status: Pending
-
---- quota-tools.orig/configure.in
-+++ quota-tools/configure.in
-@@ -151,33 +151,46 @@ AC_SUBST(QUOTA_NETLINK_PROG)
- AC_SUBST(NETLINKLIBS)
-
- AC_SEARCH_LIBS(gethostbyname, nsl)
--AC_MSG_CHECKING(for host_access in -lwrap)
--AC_CACHE_VAL(ac_cv_lib_wrap_main,
--	saved_LIBS="$LIBS"
--	LIBS="$LIBS -lwrap"
--	[AC_LINK_IFELSE([AC_LANG_PROGRAM([[
--	#include <stdio.h>
--	#include <sys/types.h>
--	#include <sys/socket.h>
--	#include <netinet/in.h>
--	#include <tcpd.h>
--	struct request_info request;
--	int deny_severity, allow_severity;]],[[hosts_access(&request);]])],
--	dnl We always restore LIBS as we add -lwrap in the next check
--	[ac_cv_lib_wrap_main=yes; LIBS="$saved_LIBS"; AC_MSG_RESULT(yes)],
--	[ac_cv_lib_wrap_main=no; LIBS="$saved_LIBS"; AC_MSG_RESULT(no)])
--	])
-
--if test ${ac_cv_lib_wrap_main} = yes; then
--	AC_CHECK_HEADER(tcpd.h,, [
--		echo 'ERROR: could not find tcpd.h - missing TCP wrappers package'
--		exit 1
--	])
--	LIBS="$LIBS -lwrap"
--	AC_DEFINE([HOSTS_ACCESS], 1, [Use hosts.allow and hosts.deny for access checking of rpc.rquotad])
--	COMPILE_OPTS="$COMPILE_OPTS HOSTS_ACCESS"
-+AC_ARG_WITH(tcpwrappers,
-+	[  --with-tcpwrappers=[yes/no/try]   Use hosts.allow and hosts.deny for access checking of rpc.rquota [default=yes, if available.]],
-+	,
-+	with_tcpwrappers="try")
-+
-+if test "x$with_tcpwrappers" != xno; then
-+	AC_MSG_CHECKING(for host_access in -lwrap)
-+	AC_CACHE_VAL(ac_cv_lib_wrap_main,
-+		saved_LIBS="$LIBS"
-+		LIBS="$LIBS -lwrap"
-+		[AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-+		#include <stdio.h>
-+		#include <sys/types.h>
-+		#include <sys/socket.h>
-+		#include <netinet/in.h>
-+		#include <tcpd.h>
-+		struct request_info request;
-+		int deny_severity, allow_severity;]],[[hosts_access(&request);]])],
-+		dnl We always restore LIBS as we add -lwrap in the next try
-+		[ac_cv_lib_wrap_main=yes; LIBS="$saved_LIBS"; AC_MSG_RESULT(yes)],
-+		[ac_cv_lib_wrap_main=no; LIBS="$saved_LIBS"; AC_MSG_RESULT(no)])
-+		])
-+
-+	if test "x$ac_cv_lib_wrap_main" = xyes; then
-+		AC_CHECK_HEADER(tcpd.h,, [
-+			if test "x$with_tcpwrappers" != xtry; then
-+				AC_MSG_ERROR([could not find tcpd.h - missing TCP wrappers package])
-+			fi
-+		])
-+
-+		LIBS="$LIBS -lwrap"
-+		AC_DEFINE([HOSTS_ACCESS], 1, [Use hosts.allow and hosts.deny for access checking of rpc.rquotad])
-+		COMPILE_OPTS="$COMPILE_OPTS HOSTS_ACCESS"
-+	elif test "x$with_tcpwrappers" != xtry; then
-+		AC_MSG_ERROR([could not find libwrap - missing TCP wrappers package])
-+	fi
- fi
-
-+
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- AC_C_INLINE
diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.03.bb
similarity index 69%
rename from meta/recipes-extended/quota/quota_4.02.bb
rename to meta/recipes-extended/quota/quota_4.03.bb
index 319a088..4a98046 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.03.bb
@@ -8,36 +8,31 @@ LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad2
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://config-tcpwrappers.patch \
+           file://0001-Fix-build-with-disabled-ldap.patch \
+           file://0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch \
            file://fcntl.patch \
            file://remove_non_posix_types.patch \
-	   "
+          "
 SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 
-SRC_URI[md5sum] = "a8a5df262261e659716ccad2a5d6df0d"
-SRC_URI[sha256sum] = "f4c2f48abf94bbdc396df33d276f2e9d19af58c232cb85eef9c174a747c33795"
+SRC_URI[md5sum] = "6b09f9c93515c25a528be5754cdfb6f5"
+SRC_URI[sha256sum] = "9c6c4d9ae7bf30506dd2aa3d8056c4ff2f8d087930d7c721616f5c093bdc674b"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
-S = "${WORKDIR}/quota-tools"
-
-DEPENDS = "gettext-native e2fsprogs"
+DEPENDS = "gettext-native e2fsprogs libnl dbus"
 
 inherit autotools-brokensep gettext pkgconfig
 
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 ASNEEDED = ""
-EXTRA_OEMAKE += 'STRIP=""'
 
 PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
 PACKAGECONFIG_libc-musl = "tcp-wrappers rpc"
 
-PACKAGECONFIG[tcp-wrappers] = "--with-tcpwrappers,--without-tcpwrappers,tcp-wrappers"
-PACKAGECONFIG[rpc] = "--enable-rpc=yes,--enable-rpc=no,libtirpc"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
-
-do_install() {
-	oe_runmake ROOTDIR=${D} install
-}
+PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
-- 
2.4.0


