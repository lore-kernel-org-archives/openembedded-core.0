Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9040F73C3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:11 +0000 (UTC)
Received: by ierf6 with SMTP id f6so26627135ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9b5Ikwosqz9wsE0/n24C4pEoSjV7TQ+Jvq0FM/5qmG8=;
	b=fYCtXY694j1dxVoUnumWiIXE8kZ38cDIanoOzUQlyYBCbZXG8zD7dZ2hQOLxeXJrYz
	y9ns5VDvqrfn4ACCdyUCscyZBwN/IG5UEv16UAdxtIUhqfeDcpXsPse0DUaLrRdNoUsa
	TfnthsRGBJAHO4brbsNHQtuc6Y8xC0Dnj/ynyFOeXWq0Vb5d5xJ3Xf8deziK73yQH1vG
	dsPMc8aGmGp8PuAMOwGDeBZqr9DAETdCOO58PBimhvnDMMEleOxNmeyeQeMqHP9Tq/J9
	Z81Dxiu8hSdWEc/1kSN9byK0Eb21NpF9TtlbbY4Loaplst1h559kYIno6KphTCz7L+dR
	1dtA==
X-Received: by 10.50.253.12 with SMTP id zw12mr47944971igc.24.1428341832845;
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:44 +0000
Message-Id: <80dba0ffc5b5f57bf0fce1c8da10237db6847f3e.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 16/24] quota: Fix build with musl
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:11 -0000

add more packageconfigs so we can disable
certain features on demand

Add patches to make it more portable
by making posix compliant and libc agnostic code

Change-Id: Ifa1c7f7923322fd22368538310685cd5c440516d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/quota/quota/fcntl.patch      | 113 +++++++++++++
 .../quota/quota/remove_non_posix_types.patch       | 185 +++++++++++++++++++++
 .../quota/quota/replace_getrpcbynumber_r.patch     |  20 +++
 meta/recipes-extended/quota/quota_4.02.bb          |  17 +-
 4 files changed, 333 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/fcntl.patch
 create mode 100644 meta/recipes-extended/quota/quota/remove_non_posix_types.patch
 create mode 100644 meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch

diff --git a/meta/recipes-extended/quota/quota/fcntl.patch b/meta/recipes-extended/quota/quota/fcntl.patch
new file mode 100644
index 0000000..27e60fd
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/fcntl.patch
@@ -0,0 +1,113 @@
+Include fcntl.h to pacify compiler errors on musl
+like
+
+error: unknown type name 'loff_t'
+Cover rpc headers under proper conditional
+Dont use __P its undefined
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ndex: quota-tools/quota.h
+===================================================================
+Index: quota-tools/quota.h
+===================================================================
+--- quota-tools.orig/quota.h
++++ quota-tools/quota.h
+@@ -165,6 +165,6 @@ enum {
+ 	#endif
+ #endif
+ 
+-long quotactl __P((int, const char *, qid_t, caddr_t));
++long quotactl (int, const char *, qid_t, caddr_t);
+ 
+ #endif /* _QUOTA_ */
+Index: quota-tools/quotacheck.c
+===================================================================
+--- quota-tools.orig/quotacheck.c
++++ quota-tools/quotacheck.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <fcntl.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+Index: quota-tools/quotaio.c
+===================================================================
+--- quota-tools.orig/quotaio.c
++++ quota-tools/quotaio.c
+@@ -12,6 +12,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+Index: quota-tools/dqblk_v2.h
+===================================================================
+--- quota-tools.orig/dqblk_v2.h
++++ quota-tools/dqblk_v2.h
+@@ -7,6 +7,7 @@
+ #ifndef GUARD_DQBLK_V2_H
+ #define GUARD_DQBLK_V2_H
+ 
++#include <fcntl.h>
+ #include <sys/types.h>
+ #include "quota_tree.h"
+ 
+Index: quota-tools/quotaops.c
+===================================================================
+--- quota-tools.orig/quotaops.c
++++ quota-tools/quotaops.c
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
+Index: quota-tools/rquota_client.c
+===================================================================
+--- quota-tools.orig/rquota_client.c
++++ quota-tools/rquota_client.c
+@@ -19,7 +19,9 @@
+ 
+ #include "config.h"
+ 
++#if defined(RPC)
+ #include <rpc/rpc.h>
++#endif
+ #include <sys/types.h>
+ #include <sys/param.h>
+ #include <sys/stat.h>
+@@ -35,7 +37,9 @@
+ #include <stdint.h>
+ 
+ #include "mntopt.h"
++#if defined(RPC)
+ #include "rquota.h"
++#endif
+ #include "common.h"
+ #include "quotaio.h"
+ #include "quotasys.h"
+Index: quota-tools/setquota.c
+===================================================================
+--- quota-tools.orig/setquota.c
++++ quota-tools/setquota.c
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
diff --git a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
new file mode 100644
index 0000000..5442d98
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
@@ -0,0 +1,185 @@
+Use proper C99 integer types
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: quota-tools/bylabel.c
+===================================================================
+--- quota-tools.orig/bylabel.c
++++ quota-tools/bylabel.c
+@@ -20,6 +20,7 @@
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <stdint.h>
+ 
+ #include "bylabel.h"
+ #include "common.h"
+@@ -37,32 +38,32 @@ static struct uuidCache_s {
+ 
+ #define EXT2_SUPER_MAGIC	0xEF53
+ struct ext2_super_block {
+-	u_char s_dummy1[56];
+-	u_char s_magic[2];
+-	u_char s_dummy2[46];
+-	u_char s_uuid[16];
+-	u_char s_volume_name[16];
++	uint8_t s_dummy1[56];
++	uint8_t s_magic[2];
++	uint8_t s_dummy2[46];
++	uint8_t s_uuid[16];
++	uint8_t s_volume_name[16];
+ };
+ 
+-#define ext2magic(s)	((uint) s.s_magic[0] + (((uint) s.s_magic[1]) << 8))
++#define ext2magic(s)	((uint32_t) s.s_magic[0] + (((uint32_t) s.s_magic[1]) << 8))
+ 
+ #define XFS_SUPER_MAGIC "XFSB"
+ #define XFS_SUPER_MAGIC2 "BSFX"
+ struct xfs_super_block {
+-	u_char s_magic[4];
+-	u_char s_dummy[28];
+-	u_char s_uuid[16];
+-	u_char s_dummy2[60];
+-	u_char s_fsname[12];
++	uint8_t s_magic[4];
++	uint8_t s_dummy[28];
++	uint8_t s_uuid[16];
++	uint8_t s_dummy2[60];
++	uint8_t s_fsname[12];
+ };
+ 
+ #define REISER_SUPER_MAGIC	"ReIsEr2Fs"
+ struct reiserfs_super_block {
+-	u_char s_dummy1[52];
+-	u_char s_magic[10];
+-	u_char s_dummy2[22];
+-	u_char s_uuid[16];
+-	u_char s_volume_name[16];
++	uint8_t s_dummy1[52];
++	uint8_t s_magic[10];
++	uint8_t s_dummy2[22];
++	uint8_t s_uuid[16];
++	uint8_t s_volume_name[16];
+ };
+ 
+ static inline unsigned short swapped(unsigned short a)
+@@ -222,7 +223,7 @@ static char *get_spec_by_x(int n, const
+ 	return NULL;
+ }
+ 
+-static u_char fromhex(char c)
++static uint8_t fromhex(char c)
+ {
+ 	if (isdigit(c))
+ 		return (c - '0');
+@@ -234,7 +235,7 @@ static u_char fromhex(char c)
+ 
+ static char *get_spec_by_uuid(const char *s)
+ {
+-	u_char uuid[16];
++	uint8_t uuid[16];
+ 	int i;
+ 
+ 	if (strlen(s) != 36 || s[8] != '-' || s[13] != '-' || s[18] != '-' || s[23] != '-')
+Index: quota-tools/quot.c
+===================================================================
+--- quota-tools.orig/quot.c
++++ quota-tools/quot.c
+@@ -47,6 +47,7 @@
+ #include <utmp.h>
+ #include <pwd.h>
+ #include <grp.h>
++#include <stdint.h>
+ 
+ #include "pot.h"
+ #include "quot.h"
+@@ -56,8 +57,8 @@
+ #include "quotasys.h"
+ 
+ #define	TSIZE	500
+-static __uint64_t sizes[TSIZE];
+-static __uint64_t overflow;
++static uint64_t sizes[TSIZE];
++static uint64_t overflow;
+ 
+ static int aflag;
+ static int cflag;
+@@ -72,7 +73,7 @@ static time_t now;
+ char *progname;
+ 
+ static void mounttable(void);
+-static char *idname(__uint32_t, int);
++static char *idname(uint32_t, int);
+ static void report(const char *, const char *, int);
+ static void creport(const char *, const char *);
+ 
+@@ -173,7 +174,7 @@ static int qcmp(du_t * p1, du_t * p2)
+ static void creport(const char *file, const char *fsdir)
+ {
+ 	int i;
+-	__uint64_t t = 0;
++	uint64_t t = 0;
+ 
+ 	printf(_("%s (%s):\n"), file, fsdir);
+ 	for (i = 0; i < TSIZE - 1; i++)
+@@ -219,7 +220,7 @@ static void report(const char *file, con
+ 	}
+ }
+ 
+-static idcache_t *getnextent(int type, __uint32_t id, int byid)
++static idcache_t *getnextent(int type, uint32_t id, int byid)
+ {
+ 	struct passwd *pw;
+ 	struct group  *gr;
+@@ -240,7 +241,7 @@ static idcache_t *getnextent(int type, _
+ 	return &idc;
+ }
+ 
+-static char *idname(__uint32_t id, int type)
++static char *idname(uint32_t id, int type)
+ {
+ 	idcache_t *ncp, *idp;
+ 	static idcache_t nc[2][NID];
+@@ -286,8 +287,8 @@ static void acctXFS(xfs_bstat_t *p)
+ {
+ 	register du_t *dp;
+ 	du_t **hp;
+-	__uint64_t size;
+-	__uint32_t i, id;
++	uint64_t size;
++	uint32_t i, id;
+ 
+ 	if ((p->bs_mode & S_IFMT) == 0)
+ 		return;
+Index: quota-tools/quot.h
+===================================================================
+--- quota-tools.orig/quot.h
++++ quota-tools/quot.h
+@@ -35,18 +35,18 @@
+ #define	SEC24HR	(60*60*24)	/* seconds per day */
+ 
+ typedef struct {
+-	__uint32_t id;
++	uint32_t id;
+ 	char name[UT_NAMESIZE + 1];
+ } idcache_t;
+ 
+ typedef struct du {
+ 	struct du *next;
+-	__uint64_t blocks;
+-	__uint64_t blocks30;
+-	__uint64_t blocks60;
+-	__uint64_t blocks90;
+-	__uint64_t nfiles;
+-	__uint32_t id;
++	uint64_t blocks;
++	uint64_t blocks30;
++	uint64_t blocks60;
++	uint64_t blocks90;
++	uint64_t nfiles;
++	uint32_t id;
+ } du_t;
+ 
+ #define	NDU	60000
diff --git a/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch b/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
new file mode 100644
index 0000000..9ca2ffc
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
@@ -0,0 +1,20 @@
+Replace getrpcbynumber_r with getrpcbynumber
+musl and uclibc dont implement it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: quota-tools/svc_socket.c
+===================================================================
+--- quota-tools.orig/svc_socket.c
++++ quota-tools/svc_socket.c
+@@ -55,7 +55,8 @@ static int svc_socket (u_long number, in
+ 	addr.sin_family = AF_INET;
+ 
+ 	if (!port) {
+-		ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
++		rpcp = getrpcbynumber(number);
++		ret = 0;
+ 		if (ret == 0 && rpcp != NULL) {
+ 			/* First try name */
+ 			ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.02.bb
index 020ed35..96ff4b5 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -6,8 +6,14 @@ LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
                     file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://config-tcpwrappers.patch"
+           file://config-tcpwrappers.patch \
+           file://fcntl.patch \
+           file://remove_non_posix_types.patch \
+	   "
+SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
+
 SRC_URI[md5sum] = "a8a5df262261e659716ccad2a5d6df0d"
 SRC_URI[sha256sum] = "f4c2f48abf94bbdc396df33d276f2e9d19af58c232cb85eef9c174a747c33795"
 
@@ -17,10 +23,17 @@ DEPENDS = "gettext-native e2fsprogs"
 
 inherit autotools-brokensep gettext pkgconfig
 
+CFLAGS += "-I=${includedir}/tirpc"
+LDFLAGS += "-ltirpc"
+ASNEEDED = ""
 EXTRA_OEMAKE += 'STRIP=""'
 
-PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
+PACKAGECONFIG_libc-musl = "tcp-wrappers rpc"
+
 PACKAGECONFIG[tcp-wrappers] = "--with-tcpwrappers,--without-tcpwrappers,tcp-wrappers"
+PACKAGECONFIG[rpc] = "--enable-rpc=yes,--enable-rpc=no,libtirpc"
+PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 
 do_install() {
 	oe_runmake prefix=${D}${prefix} install
-- 
2.1.4


