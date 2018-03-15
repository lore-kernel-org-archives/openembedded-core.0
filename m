Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9047A788BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:40:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FDeHZf015914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 13:40:21 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7B-0002OJ-Ev; Thu, 15 Mar 2018 06:40:17 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:10 -0700
Message-Id: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [rocko][PATCH 1/5] unfs3: Fix build with musl
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
X-List-Received-Date: Thu, 15 Mar 2018 13:40:23 -0000

From: Khem Raj <raj.khem@gmail.com>

Should also fix build on new build hosts where
with glibc 2.27 rpc support is dropped in favor
of libtirpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/world-broken.inc          |  4 ---
 .../0001-daemon.c-Libtirpc-porting-fixes.patch     | 37 ++++++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb   | 10 ++++--
 3 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 49e9516..42cacfd 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -5,10 +5,6 @@
 # rt-tests needs PI mutex support in libc
 EXCLUDE_FROM_WORLD_pn-rt-tests_libc-musl = "1"
 
-# error: no member named 'sin_port' in 'struct sockaddr_in6'
-# this is due to libtirpc using ipv6 but portmap rpc expecting ipv4
-EXCLUDE_FROM_WORLD_pn-unfs3_libc-musl = "1"
-
 # error: use of undeclared identifier '_STAT_VER'
 EXCLUDE_FROM_WORLD_pn-pseudo_libc-musl = "1"
 
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
new file mode 100644
index 0000000..6eee674
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
@@ -0,0 +1,37 @@
+From c7a2a65d6c2a433312540c207860740d6e4e7629 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Mar 2018 17:32:54 -0700
+Subject: [PATCH] daemon.c: Libtirpc porting fixes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ daemon.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/daemon.c b/daemon.c
+index 22f30f6..028a181 100644
+--- a/daemon.c
++++ b/daemon.c
+@@ -117,7 +117,7 @@ void logmsg(int prio, const char *fmt, ...)
+  */
+ struct in_addr get_remote(struct svc_req *rqstp)
+ {
+-    return (svc_getcaller(rqstp->rq_xprt))->sin_addr;
++    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_addr;
+ }
+ 
+ /*
+@@ -125,7 +125,7 @@ struct in_addr get_remote(struct svc_req *rqstp)
+  */
+ short get_port(struct svc_req *rqstp)
+ {
+-    return (svc_getcaller(rqstp->rq_xprt))->sin_port;
++    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_port;
+ }
+ 
+ /*
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index cebc866..46ac369 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -9,9 +9,11 @@ RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
 CHECK_DATE = "Dec 10, 2015"
 
 DEPENDS = "flex-native bison-native flex"
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS += "libtirpc"
 DEPENDS_append_class-nativesdk = " flex-nativesdk"
 
+ASNEEDED = ""
+
 MOD_PV = "497"
 S = "${WORKDIR}/trunk"
 # Only subversion url left in OE-Core, use a mirror tarball instead since
@@ -26,7 +28,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.ta
            file://rename_fh_cache.patch \
            file://relative_max_socket_path_len.patch \
            file://tcp_no_delay.patch \
-          "
+           file://0001-daemon.c-Libtirpc-porting-fixes.patch \
+           "
 SRC_URI[md5sum] = "2e43e471c77ade0331901c40b8f8e9a3"
 SRC_URI[sha256sum] = "21009468a9ba07b72ea93780d025a63ab4e55bf8fc3127803c296f0900fe1bac"
 
@@ -34,7 +37,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+CFLAGS += " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS += " -ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.7.4


