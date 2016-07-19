Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDA626080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:41:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6J7fmeO017244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:41:51 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 00:41:47 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 15:39:20 +0800
Message-ID: <1c00af58f5952609a813143a1e4670b6f4f83290.1468913890.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1468913890.git.kai.kang@windriver.com>
References: <cover.1468913890.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] quota: make compile pass when disable rpc
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
X-List-Received-Date: Tue, 19 Jul 2016 07:41:52 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When 'rpc' is not in PACKAGECONFIG, option '--disable-rpc' is passed to
configure and then compile fails. Backport patches to make quota build
successfully.

Update fcntl.patch that part of the patches are added by
0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch  |  83 +++++++++++
 ...ing-on-systems-that-do-not-have-rpc-heade.patch | 153 +++++++++++++++++++++
 ...-rpc.rquotad-when-disable-rpc-was-request.patch |  62 +++++++++
 ...0004-Fix-warnings-due-to-missing-stdlib.h.patch |  46 +++++++
 meta/recipes-extended/quota/quota/fcntl.patch      |  28 ----
 meta/recipes-extended/quota/quota_4.03.bb          |   8 +-
 6 files changed, 350 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
 create mode 100644 meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
 create mode 100644 meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
 create mode 100644 meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch

diff --git a/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch b/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
new file mode 100644
index 0000000..6fb2daf
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
@@ -0,0 +1,83 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From feca6d2e55d992bbe176ee8faa734c105eb1b2e1 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Tue, 29 Mar 2016 20:48:05 -0400
+Subject: [PATCH] Use NGROUPS_MAX instead of NGROUPS
+
+NGRROUPS_MAX is what is defined by SuSv3; NGROUPS is not guaranteed by
+any standard, but is just an ancient BSD'ism.  Since Android's bionic
+libc has the former but not the latter, let's use NGROUPS_MAX instead.
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Jan Kara <jack@suse.cz>
+---
+ quota.c    | 5 +++--
+ quotaops.c | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/quota.c b/quota.c
+index 049dac4..e195ead 100644
+--- a/quota.c
++++ b/quota.c
+@@ -48,6 +48,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <limits.h>
+ #ifdef RPC
+ #include <rpc/rpc.h>
+ #include "rquota.h"
+@@ -296,7 +297,7 @@ static int showquotas(int type, qid_t id, int mntcnt, char **mnt)
+ int main(int argc, char **argv)
+ {
+ 	int ngroups;
+-	gid_t gidset[NGROUPS], *gidsetp;
++	gid_t gidset[NGROUPS_MAX], *gidsetp;
+ 	int i, ret;
+ 	struct option long_opts[] = {
+ 		{ "help", 0, NULL, 'h' },
+@@ -405,7 +406,7 @@ int main(int argc, char **argv)
+ 			ret |= showquotas(USRQUOTA, getuid(), argc, argv);
+ 		if (flags & FL_GROUP) {
+ 			ngroups = sysconf(_SC_NGROUPS_MAX);
+-			if (ngroups > NGROUPS) {
++			if (ngroups > NGROUPS_MAX) {
+ 				gidsetp = malloc(ngroups * sizeof(gid_t));
+ 				if (!gidsetp)
+ 					die(1, _("Gid set allocation (%d): %s\n"), ngroups, strerror(errno));
+diff --git a/quotaops.c b/quotaops.c
+index 136aec3..590dc1b 100644
+--- a/quotaops.c
++++ b/quotaops.c
+@@ -51,6 +51,7 @@
+ #include <unistd.h>
+ #include <time.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #if defined(RPC)
+ #include "rquota.h"
+@@ -97,7 +98,7 @@ struct dquot *getprivs(qid_t id, struct quota_handle **handles, int quiet)
+ #if defined(BSD_BEHAVIOUR)
+ 	int j, ngroups;
+ 	uid_t euid;
+-	gid_t gidset[NGROUPS], *gidsetp;
++	gid_t gidset[NGROUPS_MAX], *gidsetp;
+ #endif
+ 
+ 	for (i = 0; handles[i]; i++) {
+@@ -115,7 +116,7 @@ struct dquot *getprivs(qid_t id, struct quota_handle **handles, int quiet)
+ 				if (geteuid() == 0)
+ 					break;
+ 				ngroups = sysconf(_SC_NGROUPS_MAX);
+-				if (ngroups > NGROUPS) {
++				if (ngroups > NGROUPS_MAX) {
+ 					gidsetp = malloc(ngroups * sizeof(gid_t));
+ 					if (!gidsetp) {
+ 						gid2group(id, name);
+-- 
+2.6.1
+
diff --git a/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch b/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
new file mode 100644
index 0000000..6cea548
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
@@ -0,0 +1,153 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From f30e1ada8326463cc0af048afa058bc2f1dc9370 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Tue, 29 Mar 2016 20:48:04 -0400
+Subject: [PATCH] Allow building on systems that do not have rpc header files
+
+Android's bionic C library doesn't have Sun RPC support.
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Jan Kara <jack@suse.cz>
+---
+ Makefile.am | 30 ++++++++++++++++--------------
+ quotaops.c  |  2 ++
+ setquota.c  |  2 ++
+ 3 files changed, 20 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6d7ea0e..82db99f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,5 @@
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-BUILT_SOURCES = rquota.h rquota.c rquota_clnt.c
+-
+ docdir = $(datadir)/doc/@PACKAGE@
+ doc_DATA = \
+ 	README.mailserver \
+@@ -12,11 +10,6 @@ doc_DATA = \
+ 	doc/quotas.preformated \
+ 	doc/quotas-1.eps
+ 
+-rpcsvcdir = $(includedir)/rpcsvc
+-rpcsvc_DATA = \
+-	rquota.h \
+-	rquota.x
+-
+ sysconf_DATA = \
+ 	warnquota.conf \
+ 	quotatab \
+@@ -35,15 +28,12 @@ man_MANS = \
+ 	quota.1 \
+ 	quot.8 \
+ 	repquota.8 \
+-	rpc.rquotad.8 \
+ 	rquota.3 \
+ 	setquota.8 \
+ 	warnquota.conf.5 \
+ 	warnquota.8 \
+ 	xqmstats.8
+ 
+-CLEANFILES = rquota.c rquota.h rquota_clnt.c
+-
+ SUBDIRS = po
+ 
+ EXTRA_DIST = \
+@@ -55,9 +45,15 @@ EXTRA_DIST = \
+ 	Changelog \
+ 	ldap-scripts
+ 
+-noinst_LIBRARIES = \
+-	libquota.a \
+-	librpcclient.a
++noinst_LIBRARIES = libquota.a
++
++if WITH_RPC
++rpcsvcdir = $(includedir)/rpcsvc
++rpcsvc_DATA = \
++	rquota.h \
++	rquota.x
++
++noinst_LIBRARIES += librpcclient.a
+ 
+ librpcclient_a_SOURCES = \
+ 	rquota.c \
+@@ -67,8 +63,10 @@ librpcclient_a_SOURCES = \
+ 	rquota_clnt.c
+ librpcclient_a_CFLAGS = -Wno-unused
+ 
+-if WITH_RPC
+ RPCLIBS = librpcclient.a
++BUILT_SOURCES = rquota.h rquota.c rquota_clnt.c
++CLEANFILES = rquota.c rquota.h rquota_clnt.c
++man_MANS += rpc.rquotad.8
+ endif
+ 
+ libquota_a_SOURCES = \
+@@ -217,6 +215,7 @@ convertquota_LDADD = \
+ 	libquota.a \
+ 	$(RPCLIBS)
+ 
++if WITH_RPC
+ rpc_rquotad_SOURCES = \
+ 	rquota_server.c \
+ 	rquota_svc.c \
+@@ -225,6 +224,7 @@ rpc_rquotad_LDADD = \
+ 	libquota.a \
+ 	$(WRAP_LIBS) \
+ 	$(RPCLIBS)
++endif
+ 
+ quota_nld_SOURCES = quota_nld.c
+ quota_nld_CFLAGS = \
+@@ -236,6 +236,7 @@ quota_nld_LDADD = \
+ 	$(DBUS_LIBS) \
+ 	$(LIBNL3_LIBS)
+ 
++if WITH_RPC
+ # ------------------
+ # Rpcgen conversions
+ # ------------------
+@@ -250,6 +251,7 @@ quota_nld_LDADD = \
+ rquota_clnt.c: rquota.x
+ 	@rm -f $@
+ 	@$(RPCGEN) -l -o $@ $<
++endif
+ 
+ # --------
+ # Quotaoff
+diff --git a/quotaops.c b/quotaops.c
+index 47ef9a7..136aec3 100644
+--- a/quotaops.c
++++ b/quotaops.c
+@@ -34,7 +34,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+diff --git a/setquota.c b/setquota.c
+index 51d7b3c..8ecd9c3 100644
+--- a/setquota.c
++++ b/setquota.c
+@@ -7,7 +7,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <errno.h>
+ #include <stdio.h>
+-- 
+2.6.1
+
diff --git a/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch b/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
new file mode 100644
index 0000000..1455384
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From c7a76237e7a51a69d0236ebfc191e462f805cf4e Mon Sep 17 00:00:00 2001
+From: Lars Wendler <polynomial-c@gentoo.org>
+Date: Mon, 15 Feb 2016 14:42:14 +0100
+Subject: [PATCH] Don't build rpc.rquotad when --disable-rpc was requested.
+
+This fixes a buch of undefined references:
+
+x86_64-pc-linux-gnu-gcc  -march=native -mtune=native -O2 -pipe -D_GNU_SOURCE -Wa
+ll -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -pie -Wl,-O1 -Wl,--hash-st
+yle=gnu -Wl,--sort-common -Wl,--as-needed -o rpc.rquotad rquota_server.o rquota_
+svc.o svc_socket.o libquota.a
+rquota_svc.o: In function `rquotaprog_2':
+rquota_svc.c:(.text+0x1d3): undefined reference to `xdr_setquota_rslt'
+rquota_svc.c:(.text+0x1da): undefined reference to `xdr_ext_setquota_args'
+rquota_svc.c:(.text+0x2b2): undefined reference to `xdr_setquota_rslt'
+rquota_svc.c:(.text+0x2b9): undefined reference to `xdr_ext_setquota_args'
+rquota_svc.c:(.text+0x2ff): undefined reference to `xdr_getquota_rslt'
+rquota_svc.c:(.text+0x306): undefined reference to `xdr_ext_getquota_args'
+rquota_svc.c:(.text+0x31a): undefined reference to `xdr_getquota_rslt'
+rquota_svc.c:(.text+0x321): undefined reference to `xdr_ext_getquota_args'
+rquota_svc.o: In function `rquotaprog_1':
+rquota_svc.c:(.text+0x3f3): undefined reference to `xdr_setquota_rslt'
+rquota_svc.c:(.text+0x3fa): undefined reference to `xdr_setquota_args'
+rquota_svc.c:(.text+0x4d2): undefined reference to `xdr_setquota_rslt'
+rquota_svc.c:(.text+0x4d9): undefined reference to `xdr_setquota_args'
+rquota_svc.c:(.text+0x51f): undefined reference to `xdr_getquota_rslt'
+rquota_svc.c:(.text+0x526): undefined reference to `xdr_getquota_args'
+rquota_svc.c:(.text+0x53a): undefined reference to `xdr_getquota_rslt'
+rquota_svc.c:(.text+0x541): undefined reference to `xdr_getquota_args'
+collect2: error: ld returned 1 exit status
+Makefile:901: recipe for target 'rpc.rquotad' failed
+
+Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
+Signed-off-by: Jan Kara <jack@suse.cz>
+---
+ Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 77f8400..6d7ea0e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -116,8 +116,11 @@ sbin_PROGRAMS = \
+ 	xqmstats \
+ 	edquota \
+ 	setquota \
+-	convertquota \
++	convertquota
++if WITH_RPC
++sbin_PROGRAMS += \
+ 	rpc.rquotad
++endif
+ if WITH_NETLINK
+ sbin_PROGRAMS += \
+ 	quota_nld
+-- 
+2.6.1
+
diff --git a/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch b/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
new file mode 100644
index 0000000..bdb4cea
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From c4b56ee58b9b76d2598535cf6109a27b22e60abe Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Wed, 30 Mar 2016 10:21:13 +0200
+Subject: [PATCH] Fix warnings due to missing stdlib.h
+
+When compiling without RPC, we do not get stdlib.h automatically
+included via other includes and thus miss some function definitions.
+Include stdlib.h explicitely.
+
+Signed-off-by: Jan Kara <jack@suse.cz>
+---
+ quotaops.c | 1 +
+ setquota.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/quotaops.c b/quotaops.c
+index 590dc1b..56cf622 100644
+--- a/quotaops.c
++++ b/quotaops.c
+@@ -52,6 +52,7 @@
+ #include <time.h>
+ #include <ctype.h>
+ #include <limits.h>
++#include <stdlib.h>
+ 
+ #if defined(RPC)
+ #include "rquota.h"
+diff --git a/setquota.c b/setquota.c
+index 8ecd9c3..421631e 100644
+--- a/setquota.c
++++ b/setquota.c
+@@ -17,6 +17,7 @@
+ #include <getopt.h>
+ #include <time.h>
+ #include <ctype.h>
++#include <stdlib.h>
+ 
+ #if defined(RPC)
+ #include "rquota.h"
+-- 
+2.6.1
+
diff --git a/meta/recipes-extended/quota/quota/fcntl.patch b/meta/recipes-extended/quota/quota/fcntl.patch
index 27e60fd..2d37971 100644
--- a/meta/recipes-extended/quota/quota/fcntl.patch
+++ b/meta/recipes-extended/quota/quota/fcntl.patch
@@ -59,20 +59,6 @@ Index: quota-tools/dqblk_v2.h
  #include <sys/types.h>
  #include "quota_tree.h"
  
-Index: quota-tools/quotaops.c
-===================================================================
---- quota-tools.orig/quotaops.c
-+++ quota-tools/quotaops.c
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
 Index: quota-tools/rquota_client.c
 ===================================================================
 --- quota-tools.orig/rquota_client.c
@@ -97,17 +83,3 @@ Index: quota-tools/rquota_client.c
  #include "common.h"
  #include "quotaio.h"
  #include "quotasys.h"
-Index: quota-tools/setquota.c
-===================================================================
---- quota-tools.orig/setquota.c
-+++ quota-tools/setquota.c
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
diff --git a/meta/recipes-extended/quota/quota_4.03.bb b/meta/recipes-extended/quota/quota_4.03.bb
index 4a98046..22aab41 100644
--- a/meta/recipes-extended/quota/quota_4.03.bb
+++ b/meta/recipes-extended/quota/quota_4.03.bb
@@ -12,6 +12,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV
            file://0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch \
            file://fcntl.patch \
            file://remove_non_posix_types.patch \
+           file://0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch \
+           file://0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch \
+           file://0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch \
+           file://0004-Fix-warnings-due-to-missing-stdlib.h.patch \
           "
 SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 
@@ -25,8 +29,8 @@ DEPENDS = "gettext-native e2fsprogs libnl dbus"
 
 inherit autotools-brokensep gettext pkgconfig
 
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LDFLAGS += "-ltirpc"
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-I${STAGING_INCDIR}/tirpc', '', d)}"
+LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-ltirpc', '', d)}"
 ASNEEDED = ""
 
 PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
-- 
2.6.1


