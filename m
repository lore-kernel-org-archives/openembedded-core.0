Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9237F3EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:33:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U9XxeV004400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:33:59 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 30 Aug 2019 02:33:58 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 17:33:56 +0800
Message-ID: <1567157636-12184-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [PATCH] nfs-utils: fix nfsidmap compile error with gcc9 when enable PACKAGECONFIG[nfsv4]
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
X-List-Received-Date: Fri, 30 Aug 2019 09:33:58 -0000
Content-Type: text/plain

Fixes:
nfsidmap.c:404:4: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
  404 |    xlog_warn(usage, progname);
      |    ^~~~~~~~~
nfsidmap.c:436:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
  436 |   xlog_warn(usage, progname);
      |   ^~~~~~~~~
nfsidmap.c:454:23: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'key_serial_t' {aka 'int'} [-Werror=format=]
  454 |   xlog_warn("key: 0x%lx type: %s value: %s timeout %ld",
      |                     ~~^
      |                       |
      |                       long unsigned int
      |                     %x
  455 |    key, type, value, timeout);
      |    ~~~
      |    |
      |    key_serial_t {aka int}
nfsidmap.c:454:54: error: format '%ld' expects argument of type 'long
int', but argument 5 has type 'int' [-Werror=format=]
  454 |   xlog_warn("key: 0x%lx type: %s value: %s timeout %ld",
      |                                                    ~~^
      |                                                      |
      |                                                      long int
      |                                                    %d
  455 |    key, type, value, timeout);
      |                      ~~~~~~~
      |                      |
      |                      int

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...x-compile-error-with-Werror-format-2-and-.patch | 87 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_2.3.3.bb                   |  5 +-
 2 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfsidmap-fix-compile-error-with-Werror-format-2-and-.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfsidmap-fix-compile-error-with-Werror-format-2-and-.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfsidmap-fix-compile-error-with-Werror-format-2-and-.patch
new file mode 100644
index 0000000..711942e
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfsidmap-fix-compile-error-with-Werror-format-2-and-.patch
@@ -0,0 +1,87 @@
+From 37a007d01e901fd88829ccfce74ffdfca353f071 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 30 Aug 2019 16:01:16 +0800
+Subject: [PATCH] nfsidmap: fix compile error with -Werror=format=2 and
+ -Werror=format-nonliteral
+
+Fixes:
+nfsidmap.c:404:4: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
+  404 |    xlog_warn(usage, progname);
+      |    ^~~~~~~~~
+nfsidmap.c:436:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
+  436 |   xlog_warn(usage, progname);
+      |   ^~~~~~~~~
+nfsidmap.c:454:23: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'key_serial_t' {aka 'int'} [-Werror=format=]
+  454 |   xlog_warn("key: 0x%lx type: %s value: %s timeout %ld",
+      |                     ~~^
+      |                       |
+      |                       long unsigned int
+      |                     %x
+  455 |    key, type, value, timeout);
+      |    ~~~
+      |    |
+      |    key_serial_t {aka int}
+nfsidmap.c:454:54: error: format '%ld' expects argument of type 'long
+int', but argument 5 has type 'int' [-Werror=format=]
+  454 |   xlog_warn("key: 0x%lx type: %s value: %s timeout %ld",
+      |                                                    ~~^
+      |                                                      |
+      |                                                      long int
+      |                                                    %d
+  455 |    key, type, value, timeout);
+      |                      ~~~~~~~
+      |                      |
+      |                      int
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ utils/nfsidmap/nfsidmap.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/utils/nfsidmap/nfsidmap.c b/utils/nfsidmap/nfsidmap.c
+index d3967a3..2052b9b 100644
+--- a/utils/nfsidmap/nfsidmap.c
++++ b/utils/nfsidmap/nfsidmap.c
+@@ -18,7 +18,7 @@
+ #include "xcommon.h"
+ 
+ int verbose = 0;
+-char *usage = "Usage: %s [-vh] [-c || [-u|-g|-r key] || -d || -l || [-t timeout] key desc]";
++char *usage = "[-vh] [-c || [-u|-g|-r key] || -d || -l || [-t timeout] key desc]";
+ 
+ #define MAX_ID_LEN   11
+ #define IDMAP_NAMESZ 128
+@@ -401,7 +401,7 @@ int main(int argc, char **argv)
+ 			break;
+ 		case 'h':
+ 		default:
+-			xlog_warn(usage, progname);
++			xlog_warn("Usage: %s %s", progname, usage);
+ 			exit(opt == 'h' ? 0 : 1);
+ 		}
+ 	}
+@@ -433,7 +433,7 @@ int main(int argc, char **argv)
+ 	xlog_stderr(verbose);
+ 	if ((argc - optind) != 2) {
+ 		xlog_warn("Bad arg count. Check /etc/request-key.conf");
+-		xlog_warn(usage, progname);
++		xlog_warn("Usage: %s %s", progname, usage);
+ 		return EXIT_FAILURE;
+ 	}
+ 
+@@ -451,8 +451,8 @@ int main(int argc, char **argv)
+ 		return EXIT_FAILURE;
+ 	}
+ 	if (verbose) {
+-		xlog_warn("key: 0x%lx type: %s value: %s timeout %ld",
+-			key, type, value, timeout);
++		xlog_warn("key: 0x%x type: %s value: %s timeout %d",
++			(unsigned int)key, type, value, timeout);
+ 	}
+ 
+ 	/* Become a possesor of the to-be-instantiated key to set the key's timeout */
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 28f9898..e68703f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-update-the-path-of-libnfs.a.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
+           file://0001-nfsidmap-fix-compile-error-with-Werror-format-2-and-.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
@@ -77,7 +78,7 @@ PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wr
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
-# keyutils is available in meta-security
+# keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
@@ -103,7 +104,7 @@ FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
 RDEPENDS_${PN}-stats = "python3-core"
 
-FILES_${PN} += "${systemd_unitdir}"
+FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
 
 do_configure_prepend() {
         sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-- 
2.7.4


