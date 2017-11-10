Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CDD2A785CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 04:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; 
   d="scan'208";a="3442004"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 10 Nov 2017 04:00:16 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id C1F985802D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:24 +0200
Message-Id: <1510315228-24186-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] quota: upgrade to 4.04
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.03 -> 4.04

Removed the following backported patches:
        1. 0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
        2. 0001-Fix-build-with-disabled-ldap.patch
        3. 0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
        4. 0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
        5. 0004-Fix-warnings-due-to-missing-stdlib.h.patch

Refreshed the following patch:
        1. replace_getrpcbynumber_r.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...dentaly-override-commandline-passed-CFLAG.patch |  33 -----
 .../quota/0001-Fix-build-with-disabled-ldap.patch  |  93 -------------
 .../0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch  |  83 -----------
 ...ing-on-systems-that-do-not-have-rpc-heade.patch | 153 ---------------------
 ...-rpc.rquotad-when-disable-rpc-was-request.patch |  62 ---------
 ...0004-Fix-warnings-due-to-missing-stdlib.h.patch |  46 -------
 .../quota/quota/replace_getrpcbynumber_r.patch     |  40 ++++--
 .../quota/{quota_4.03.bb => quota_4.04.bb}         |  10 +-
 8 files changed, 28 insertions(+), 492 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
 rename meta/recipes-extended/quota/{quota_4.03.bb => quota_4.04.bb} (73%)

diff --git a/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch b/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
deleted file mode 100644
index 6add470..0000000
--- a/meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 776757a23e9930588950c7fcbc7827ec7a3e51c4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Chv=C3=A1tal?= <tchvatal@suse.com>
-Date: Mon, 4 Jan 2016 15:48:19 +0100
-Subject: [PATCH] Do not accidentaly override commandline passed CFLAGS.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-Signed-off-by: Tomáš Chvátal <tchvatal@suse.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3ba1386..1552c15 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,7 +53,7 @@ AS_IF([test "x${prefix}" = "xNONE"], [
- # ================
- # Check for cflags
- # ================
--CFLAGS="-D_GNU_SOURCE -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-+CFLAGS="$CFLAGS -D_GNU_SOURCE -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
- AC_ARG_ENABLE([werror],
-     [AS_HELP_STRING([--enable-werror], [Treat all warnings as errors, useful for development])],
-     [enable_werror="$enableval"],
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch b/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
deleted file mode 100644
index a79e477..0000000
--- a/meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 39fd30ce57e3c34c3649866bf9345a71f0b78667 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Mon, 4 Jan 2016 15:10:53 +0100
-Subject: [PATCH] Fix build with disabled ldap
-
-Upstream-Status: Backport
-
-Reported-by: Tomas Chvatal <tchvatal@suse.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- warnquota.c | 36 ++++++++++++++++++------------------
- 1 file changed, 18 insertions(+), 18 deletions(-)
-
-diff --git a/warnquota.c b/warnquota.c
-index 3734f0e..e9868c1 100644
---- a/warnquota.c
-+++ b/warnquota.c
-@@ -109,13 +109,13 @@ struct configparams {
- 	char *user_signature;
- 	char *group_message;
- 	char *group_signature;
-+	time_t cc_before;
-+#ifdef USE_LDAP_MAIL_LOOKUP
- 	int use_ldap_mail; /* 0 */
-+	int ldap_is_setup; /* 0 */
- 	int ldap_starttls; /* 0 */
- 	int ldap_tls; /* LDAP_OPT_X_TLS_NEVER */
- 	int ldap_vers; /* LDAP_VERSION3 */
--	time_t cc_before;
--#ifdef USE_LDAP_MAIL_LOOKUP
--	int ldap_is_setup; /* 0 */
- 	char ldap_host[CNF_BUFFER];
- 	int ldap_port;
- 	char ldap_uri[CNF_BUFFER];
-@@ -729,13 +729,13 @@ static int readconfigfile(const char *filename, struct configparams *config)
- 	}
- 	maildev[0] = 0;
- 	config->user_signature = config->user_message = config->group_signature = config->group_message = NULL;
-+	config->cc_before = -1;
-+
-+#ifdef USE_LDAP_MAIL_LOOKUP
- 	config->use_ldap_mail = 0;
- 	config->ldap_starttls = 0;
- 	config->ldap_tls = LDAP_OPT_X_TLS_NEVER;
- 	config->ldap_vers = LDAP_VERSION3;
--	config->cc_before = -1;
--
--#ifdef USE_LDAP_MAIL_LOOKUP
- 	config->ldap_port = config->ldap_is_setup = 0;
- 	config->ldap_host[0] = 0;
- 	config->ldap_uri[0] = 0;
-@@ -820,6 +820,18 @@ static int readconfigfile(const char *filename, struct configparams *config)
- 				create_eoln(config->group_signature);
- 				verify_format(config->group_signature, "GROUP_SIGNATURE");
- 			}
-+			else if (!strcmp(var, "CC_BEFORE")) {
-+				int num;
-+				char unit[10];
-+
-+				if (sscanf(value, "%d%s", &num, unit) != 2)
-+					goto cc_parse_err;
-+				if (str2timeunits(num, unit, &config->cc_before) < 0) {
-+cc_parse_err:
-+					die(1, _("Cannot parse time at CC_BEFORE variable (line %d).\n"), line);
-+				}
-+			}
-+#ifdef USE_LDAP_MAIL_LOOKUP
- 			else if (!strcmp(var, "LDAP_MAIL")) {
- 				if(strcasecmp(value, "true") == 0) 
- 					config->use_ldap_mail = 1;
-@@ -846,18 +858,6 @@ static int readconfigfile(const char *filename, struct configparams *config)
- 				else
- 					config->ldap_starttls = 0;
- 			}
--			else if (!strcmp(var, "CC_BEFORE")) {
--				int num;
--				char unit[10];
--
--				if (sscanf(value, "%d%s", &num, unit) != 2)
--					goto cc_parse_err;
--				if (str2timeunits(num, unit, &config->cc_before) < 0) {
--cc_parse_err:
--					die(1, _("Cannot parse time at CC_BEFORE variable (line %d).\n"), line);
--				}
--			}
--#ifdef USE_LDAP_MAIL_LOOKUP
- 			else if (!strcmp(var, "LDAP_HOST"))
- 				sstrncpy(config->ldap_host, value, CNF_BUFFER);
- 			else if (!strcmp(var, "LDAP_PORT"))
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch b/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
deleted file mode 100644
index 6fb2daf..0000000
--- a/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From feca6d2e55d992bbe176ee8faa734c105eb1b2e1 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Tue, 29 Mar 2016 20:48:05 -0400
-Subject: [PATCH] Use NGROUPS_MAX instead of NGROUPS
-
-NGRROUPS_MAX is what is defined by SuSv3; NGROUPS is not guaranteed by
-any standard, but is just an ancient BSD'ism.  Since Android's bionic
-libc has the former but not the latter, let's use NGROUPS_MAX instead.
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- quota.c    | 5 +++--
- quotaops.c | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/quota.c b/quota.c
-index 049dac4..e195ead 100644
---- a/quota.c
-+++ b/quota.c
-@@ -48,6 +48,7 @@
- #include <errno.h>
- #include <string.h>
- #include <unistd.h>
-+#include <limits.h>
- #ifdef RPC
- #include <rpc/rpc.h>
- #include "rquota.h"
-@@ -296,7 +297,7 @@ static int showquotas(int type, qid_t id, int mntcnt, char **mnt)
- int main(int argc, char **argv)
- {
- 	int ngroups;
--	gid_t gidset[NGROUPS], *gidsetp;
-+	gid_t gidset[NGROUPS_MAX], *gidsetp;
- 	int i, ret;
- 	struct option long_opts[] = {
- 		{ "help", 0, NULL, 'h' },
-@@ -405,7 +406,7 @@ int main(int argc, char **argv)
- 			ret |= showquotas(USRQUOTA, getuid(), argc, argv);
- 		if (flags & FL_GROUP) {
- 			ngroups = sysconf(_SC_NGROUPS_MAX);
--			if (ngroups > NGROUPS) {
-+			if (ngroups > NGROUPS_MAX) {
- 				gidsetp = malloc(ngroups * sizeof(gid_t));
- 				if (!gidsetp)
- 					die(1, _("Gid set allocation (%d): %s\n"), ngroups, strerror(errno));
-diff --git a/quotaops.c b/quotaops.c
-index 136aec3..590dc1b 100644
---- a/quotaops.c
-+++ b/quotaops.c
-@@ -51,6 +51,7 @@
- #include <unistd.h>
- #include <time.h>
- #include <ctype.h>
-+#include <limits.h>
- 
- #if defined(RPC)
- #include "rquota.h"
-@@ -97,7 +98,7 @@ struct dquot *getprivs(qid_t id, struct quota_handle **handles, int quiet)
- #if defined(BSD_BEHAVIOUR)
- 	int j, ngroups;
- 	uid_t euid;
--	gid_t gidset[NGROUPS], *gidsetp;
-+	gid_t gidset[NGROUPS_MAX], *gidsetp;
- #endif
- 
- 	for (i = 0; handles[i]; i++) {
-@@ -115,7 +116,7 @@ struct dquot *getprivs(qid_t id, struct quota_handle **handles, int quiet)
- 				if (geteuid() == 0)
- 					break;
- 				ngroups = sysconf(_SC_NGROUPS_MAX);
--				if (ngroups > NGROUPS) {
-+				if (ngroups > NGROUPS_MAX) {
- 					gidsetp = malloc(ngroups * sizeof(gid_t));
- 					if (!gidsetp) {
- 						gid2group(id, name);
--- 
-2.6.1
-
diff --git a/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch b/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
deleted file mode 100644
index 6cea548..0000000
--- a/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From f30e1ada8326463cc0af048afa058bc2f1dc9370 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Tue, 29 Mar 2016 20:48:04 -0400
-Subject: [PATCH] Allow building on systems that do not have rpc header files
-
-Android's bionic C library doesn't have Sun RPC support.
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- Makefile.am | 30 ++++++++++++++++--------------
- quotaops.c  |  2 ++
- setquota.c  |  2 ++
- 3 files changed, 20 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6d7ea0e..82db99f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,5 @@
- ACLOCAL_AMFLAGS = -I m4
- 
--BUILT_SOURCES = rquota.h rquota.c rquota_clnt.c
--
- docdir = $(datadir)/doc/@PACKAGE@
- doc_DATA = \
- 	README.mailserver \
-@@ -12,11 +10,6 @@ doc_DATA = \
- 	doc/quotas.preformated \
- 	doc/quotas-1.eps
- 
--rpcsvcdir = $(includedir)/rpcsvc
--rpcsvc_DATA = \
--	rquota.h \
--	rquota.x
--
- sysconf_DATA = \
- 	warnquota.conf \
- 	quotatab \
-@@ -35,15 +28,12 @@ man_MANS = \
- 	quota.1 \
- 	quot.8 \
- 	repquota.8 \
--	rpc.rquotad.8 \
- 	rquota.3 \
- 	setquota.8 \
- 	warnquota.conf.5 \
- 	warnquota.8 \
- 	xqmstats.8
- 
--CLEANFILES = rquota.c rquota.h rquota_clnt.c
--
- SUBDIRS = po
- 
- EXTRA_DIST = \
-@@ -55,9 +45,15 @@ EXTRA_DIST = \
- 	Changelog \
- 	ldap-scripts
- 
--noinst_LIBRARIES = \
--	libquota.a \
--	librpcclient.a
-+noinst_LIBRARIES = libquota.a
-+
-+if WITH_RPC
-+rpcsvcdir = $(includedir)/rpcsvc
-+rpcsvc_DATA = \
-+	rquota.h \
-+	rquota.x
-+
-+noinst_LIBRARIES += librpcclient.a
- 
- librpcclient_a_SOURCES = \
- 	rquota.c \
-@@ -67,8 +63,10 @@ librpcclient_a_SOURCES = \
- 	rquota_clnt.c
- librpcclient_a_CFLAGS = -Wno-unused
- 
--if WITH_RPC
- RPCLIBS = librpcclient.a
-+BUILT_SOURCES = rquota.h rquota.c rquota_clnt.c
-+CLEANFILES = rquota.c rquota.h rquota_clnt.c
-+man_MANS += rpc.rquotad.8
- endif
- 
- libquota_a_SOURCES = \
-@@ -217,6 +215,7 @@ convertquota_LDADD = \
- 	libquota.a \
- 	$(RPCLIBS)
- 
-+if WITH_RPC
- rpc_rquotad_SOURCES = \
- 	rquota_server.c \
- 	rquota_svc.c \
-@@ -225,6 +224,7 @@ rpc_rquotad_LDADD = \
- 	libquota.a \
- 	$(WRAP_LIBS) \
- 	$(RPCLIBS)
-+endif
- 
- quota_nld_SOURCES = quota_nld.c
- quota_nld_CFLAGS = \
-@@ -236,6 +236,7 @@ quota_nld_LDADD = \
- 	$(DBUS_LIBS) \
- 	$(LIBNL3_LIBS)
- 
-+if WITH_RPC
- # ------------------
- # Rpcgen conversions
- # ------------------
-@@ -250,6 +251,7 @@ quota_nld_LDADD = \
- rquota_clnt.c: rquota.x
- 	@rm -f $@
- 	@$(RPCGEN) -l -o $@ $<
-+endif
- 
- # --------
- # Quotaoff
-diff --git a/quotaops.c b/quotaops.c
-index 47ef9a7..136aec3 100644
---- a/quotaops.c
-+++ b/quotaops.c
-@@ -34,7 +34,9 @@
- 
- #include "config.h"
- 
-+#if defined(RPC)
- #include <rpc/rpc.h>
-+#endif
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-diff --git a/setquota.c b/setquota.c
-index 51d7b3c..8ecd9c3 100644
---- a/setquota.c
-+++ b/setquota.c
-@@ -7,7 +7,9 @@
- 
- #include "config.h"
- 
-+#if defined(RPC)
- #include <rpc/rpc.h>
-+#endif
- #include <sys/types.h>
- #include <errno.h>
- #include <stdio.h>
--- 
-2.6.1
-
diff --git a/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch b/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
deleted file mode 100644
index 1455384..0000000
--- a/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From c7a76237e7a51a69d0236ebfc191e462f805cf4e Mon Sep 17 00:00:00 2001
-From: Lars Wendler <polynomial-c@gentoo.org>
-Date: Mon, 15 Feb 2016 14:42:14 +0100
-Subject: [PATCH] Don't build rpc.rquotad when --disable-rpc was requested.
-
-This fixes a buch of undefined references:
-
-x86_64-pc-linux-gnu-gcc  -march=native -mtune=native -O2 -pipe -D_GNU_SOURCE -Wa
-ll -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -pie -Wl,-O1 -Wl,--hash-st
-yle=gnu -Wl,--sort-common -Wl,--as-needed -o rpc.rquotad rquota_server.o rquota_
-svc.o svc_socket.o libquota.a
-rquota_svc.o: In function `rquotaprog_2':
-rquota_svc.c:(.text+0x1d3): undefined reference to `xdr_setquota_rslt'
-rquota_svc.c:(.text+0x1da): undefined reference to `xdr_ext_setquota_args'
-rquota_svc.c:(.text+0x2b2): undefined reference to `xdr_setquota_rslt'
-rquota_svc.c:(.text+0x2b9): undefined reference to `xdr_ext_setquota_args'
-rquota_svc.c:(.text+0x2ff): undefined reference to `xdr_getquota_rslt'
-rquota_svc.c:(.text+0x306): undefined reference to `xdr_ext_getquota_args'
-rquota_svc.c:(.text+0x31a): undefined reference to `xdr_getquota_rslt'
-rquota_svc.c:(.text+0x321): undefined reference to `xdr_ext_getquota_args'
-rquota_svc.o: In function `rquotaprog_1':
-rquota_svc.c:(.text+0x3f3): undefined reference to `xdr_setquota_rslt'
-rquota_svc.c:(.text+0x3fa): undefined reference to `xdr_setquota_args'
-rquota_svc.c:(.text+0x4d2): undefined reference to `xdr_setquota_rslt'
-rquota_svc.c:(.text+0x4d9): undefined reference to `xdr_setquota_args'
-rquota_svc.c:(.text+0x51f): undefined reference to `xdr_getquota_rslt'
-rquota_svc.c:(.text+0x526): undefined reference to `xdr_getquota_args'
-rquota_svc.c:(.text+0x53a): undefined reference to `xdr_getquota_rslt'
-rquota_svc.c:(.text+0x541): undefined reference to `xdr_getquota_args'
-collect2: error: ld returned 1 exit status
-Makefile:901: recipe for target 'rpc.rquotad' failed
-
-Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- Makefile.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 77f8400..6d7ea0e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -116,8 +116,11 @@ sbin_PROGRAMS = \
- 	xqmstats \
- 	edquota \
- 	setquota \
--	convertquota \
-+	convertquota
-+if WITH_RPC
-+sbin_PROGRAMS += \
- 	rpc.rquotad
-+endif
- if WITH_NETLINK
- sbin_PROGRAMS += \
- 	quota_nld
--- 
-2.6.1
-
diff --git a/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch b/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
deleted file mode 100644
index bdb4cea..0000000
--- a/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From c4b56ee58b9b76d2598535cf6109a27b22e60abe Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Wed, 30 Mar 2016 10:21:13 +0200
-Subject: [PATCH] Fix warnings due to missing stdlib.h
-
-When compiling without RPC, we do not get stdlib.h automatically
-included via other includes and thus miss some function definitions.
-Include stdlib.h explicitely.
-
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- quotaops.c | 1 +
- setquota.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/quotaops.c b/quotaops.c
-index 590dc1b..56cf622 100644
---- a/quotaops.c
-+++ b/quotaops.c
-@@ -52,6 +52,7 @@
- #include <time.h>
- #include <ctype.h>
- #include <limits.h>
-+#include <stdlib.h>
- 
- #if defined(RPC)
- #include "rquota.h"
-diff --git a/setquota.c b/setquota.c
-index 8ecd9c3..421631e 100644
---- a/setquota.c
-+++ b/setquota.c
-@@ -17,6 +17,7 @@
- #include <getopt.h>
- #include <time.h>
- #include <ctype.h>
-+#include <stdlib.h>
- 
- #if defined(RPC)
- #include "rquota.h"
--- 
-2.6.1
-
diff --git a/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch b/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
index 9ca2ffc..4687ca0 100644
--- a/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
+++ b/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
@@ -1,20 +1,32 @@
-Replace getrpcbynumber_r with getrpcbynumber
+From a3808fd165847298d025971eb3c7be7d11caba9d Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 8 Nov 2017 11:56:55 +0200
+Subject: [PATCH] Replace getrpcbynumber_r with getrpcbynumber
+
 musl and uclibc dont implement it
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: quota-tools/svc_socket.c
-===================================================================
---- quota-tools.orig/svc_socket.c
-+++ quota-tools/svc_socket.c
-@@ -55,7 +55,8 @@ static int svc_socket (u_long number, in
- 	addr.sin_family = AF_INET;
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ svc_socket.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/svc_socket.c b/svc_socket.c
+index 8a44604..5bdaaa0 100644
+--- a/svc_socket.c
++++ b/svc_socket.c
+@@ -36,7 +36,8 @@ static int get_service_port(u_long number, const char *proto)
+ 	struct servent servbuf, *servp = NULL;
+ 	int ret;
  
- 	if (!port) {
--		ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
-+		rpcp = getrpcbynumber(number);
-+		ret = 0;
- 		if (ret == 0 && rpcp != NULL) {
- 			/* First try name */
- 			ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
+-	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
++    rpcp = getrpcbynumber(number);
++    ret = 0;
+ 	if (ret == 0 && rpcp != NULL) {
+ 		/* First try name */
+ 		ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/quota/quota_4.03.bb b/meta/recipes-extended/quota/quota_4.04.bb
similarity index 73%
rename from meta/recipes-extended/quota/quota_4.03.bb
rename to meta/recipes-extended/quota/quota_4.04.bb
index 28b3854..93f3762 100644
--- a/meta/recipes-extended/quota/quota_4.03.bb
+++ b/meta/recipes-extended/quota/quota_4.04.bb
@@ -8,19 +8,13 @@ LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad2
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-Fix-build-with-disabled-ldap.patch \
-           file://0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch \
            file://fcntl.patch \
            file://remove_non_posix_types.patch \
-           file://0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch \
-           file://0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch \
-           file://0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch \
-           file://0004-Fix-warnings-due-to-missing-stdlib.h.patch \
           "
 SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 
-SRC_URI[md5sum] = "6b09f9c93515c25a528be5754cdfb6f5"
-SRC_URI[sha256sum] = "9c6c4d9ae7bf30506dd2aa3d8056c4ff2f8d087930d7c721616f5c093bdc674b"
+SRC_URI[md5sum] = "f46f3b0b5141f032f25684005dac49d3"
+SRC_URI[sha256sum] = "735be1887e7f51f54165e778ae43fc859c04e44d88834ecb2f470e91d4ef8edf"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.4.0


