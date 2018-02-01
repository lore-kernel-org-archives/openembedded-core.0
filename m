Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D8522786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465231"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:08 +0200
Message-Id: <20180201180210.21652-18-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/20] iputils: update to 20161105
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:31 -0000

We've been using obsolete upstream URI for quite a while; meanwhile
a lot of development has happened

Drop all the patches: they are either changing the code that has been refactored,
or are backports.

Add a new musl fix patch from gentoo.

ping6 and tracepath6 variants have been folded into standard versions.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iputils/files/0001-Fix-build-on-MUSL.patch     | 93 ++++++++++++++++++++++
 .../files/0001-Fix-header-inclusion-for-musl.patch | 92 ---------------------
 .../0001-Intialize-struct-elements-by-name.patch   | 52 ------------
 ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ----------
 .../iputils/files/debian/targets.diff              | 15 ----
 .../iputils/files/debian/use_gethostbyname2.diff   | 31 --------
 .../iputils/files/nsgmls-path-fix.patch            | 27 -------
 .../{iputils_s20151218.bb => iputils_s20161105.bb} | 33 +++-----
 8 files changed, 103 insertions(+), 284 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
 delete mode 100644 meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
 delete mode 100644 meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
 delete mode 100644 meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
 delete mode 100644 meta/recipes-extended/iputils/files/debian/targets.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
 delete mode 100644 meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
 rename meta/recipes-extended/iputils/{iputils_s20151218.bb => iputils_s20161105.bb} (56%)

diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
new file mode 100644
index 00000000000..c86dafc0380
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
@@ -0,0 +1,93 @@
+From c6c5966d9fae27bc2f0a34ab59b999555111bd2d Mon Sep 17 00:00:00 2001
+From: Aric Belsito <lluixhi@gmail.com>
+Date: Sun, 29 Oct 2017 23:17:03 +0100
+Subject: [PATCH] Fix build on MUSL
+
+Add missing AI_IDN and NI_IDN declarations.
+
+Bug: https://bugs.gentoo.org/503914
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ arping.c      |  7 +++++++
+ ping.h        | 11 +++++++++++
+ tracepath.c   |  8 ++++++++
+ traceroute6.c |  4 ++++
+ 4 files changed, 30 insertions(+)
+
+diff --git a/arping.c b/arping.c
+index 1a3f40b..531d29d 100644
+--- a/arping.c
++++ b/arping.c
+@@ -45,6 +45,13 @@ struct sysfs_devattr_values;
+ #ifdef USE_IDN
+ #include <idna.h>
+ #include <locale.h>
++
++#ifndef AI_IDN
++#define AI_IDN 0x0040
++#endif
++#ifndef AI_CANONIDN
++#define AI_CANONIDN 0x0080
++#endif
+ #endif
+ 
+ #include "SNAPSHOT.h"
+diff --git a/ping.h b/ping.h
+index 749f3ff..227315f 100644
+--- a/ping.h
++++ b/ping.h
+@@ -38,6 +38,17 @@
+ #include <locale.h>
+ #include <idna.h>
+ #include <stringprep.h>
++
++#ifndef AI_IDN
++#define AI_IDN 0x0040
++#endif
++#ifndef AI_CANONIDN
++#define AI_CANONIDN 0x0080
++#endif
++#ifndef NI_IDN
++#define NI_IDN 32
++#endif
++
+ #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
+ #define getnameinfo_flags NI_IDN
+ #else
+diff --git a/tracepath.c b/tracepath.c
+index 74a829d..dcec5b9 100644
+--- a/tracepath.c
++++ b/tracepath.c
+@@ -30,6 +30,14 @@
+ #ifdef USE_IDN
+ #include <idna.h>
+ #include <locale.h>
++
++#ifndef AI_IDN
++#define AI_IDN 0x0040
++#endif
++#ifndef NI_IDN
++#define NI_IDN 32
++#endif
++
+ #define getnameinfo_flags	NI_IDN
+ #else
+ #define getnameinfo_flags	0
+diff --git a/traceroute6.c b/traceroute6.c
+index 48fc5c5..8d1eebf 100644
+--- a/traceroute6.c
++++ b/traceroute6.c
+@@ -251,6 +251,10 @@
+ #include <idna.h>
+ #include <locale.h>
+ 
++#ifndef NI_IDN
++#define NI_IDN 32
++#endif
++
+ #define getnameinfo_flags	NI_IDN
+ #else
+ #define getnameinfo_flags	0
+-- 
+2.15.1
+
diff --git a/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch b/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
deleted file mode 100644
index 20ef07e44af..00000000000
--- a/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From be0bb81d72fea4d20da74f4f2236aa145684f332 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 6 Jan 2016 14:14:22 -0800
-Subject: [PATCH] Fix header inclusion for musl
-
-Fix errors e.g.
-
-In file included from tracepath.c:17:0:
-/usr/include/linux/errqueue.h:33:18:
-error: array type has incomplete element type 'struct timespec'
-  struct timespec ts[3];
-                  ^
-tracepath.c: In function 'main':
-tracepath.c:329:16: error: 'INT_MAX' undeclared (first use in this
-function)
-      overhead, INT_MAX);
-                ^
-tracepath.c:329:16: note: each undeclared identifier is reported only
-once for each function it appears in
-Makefile:131: recipe for target 'tracepath.o' failed
-make: *** [tracepath.o] Error 1
-
-ping_common.c: In function 'main_loop':
-ping_common.c:756:15: error: 'HZ' undeclared (first use in this
-function)
-    if (1000 % HZ == 0 ? next <= 1000 / HZ : (next < INT_MAX / HZ &&
-next * HZ <= 1000)) {
-
-protocols/timed.h is not needed and is absent in musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- clockdiff.c   | 1 -
- ping_common.c | 1 +
- tracepath.c   | 2 ++
- tracepath6.c  | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/clockdiff.c b/clockdiff.c
-index 7c1ea1b..1d6341e 100644
---- a/clockdiff.c
-+++ b/clockdiff.c
-@@ -14,7 +14,6 @@
- #include <netinet/ip.h>
- #include <netinet/ip_icmp.h>
- #define TSPTYPES
--#include <protocols/timed.h>
- #include <fcntl.h>
- #include <netdb.h>
- #include <arpa/inet.h>
-diff --git a/ping_common.c b/ping_common.c
-index 7f82851..3ce699d 100644
---- a/ping_common.c
-+++ b/ping_common.c
-@@ -2,6 +2,7 @@
- #include <ctype.h>
- #include <sched.h>
- #include <math.h>
-+#include <asm-generic/param.h>
- 
- int options;
- 
-diff --git a/tracepath.c b/tracepath.c
-index 89e6d16..c9d6ddd 100644
---- a/tracepath.c
-+++ b/tracepath.c
-@@ -12,6 +12,8 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-+#include <limits.h>
-+#include <time.h>
- #include <sys/socket.h>
- #include <linux/types.h>
- #include <linux/errqueue.h>
-diff --git a/tracepath6.c b/tracepath6.c
-index 126fadf..9d5745c 100644
---- a/tracepath6.c
-+++ b/tracepath6.c
-@@ -12,6 +12,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-+#include <limits.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <netinet/icmp6.h>
--- 
-2.6.4
-
diff --git a/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch b/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
deleted file mode 100644
index 6da01dc616c..00000000000
--- a/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 000629f74908a2a95f6104444c77ad93cf40d62d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jan 2016 08:50:50 +0000
-Subject: [PATCH] Intialize struct elements by name
-
-makes it portable across glibc and musl
-
-Fixes errors
-
-| ping.c: In function 'send_probe':
-| ping.c:735:19: warning: initialization makes integer from pointer
-without a cast [-Wint-conversion]
-|           &iov, 1, &cmsg, 0, 0 };
-|                    ^
-| ping.c:735:19: note: (near initialization for 'm.__pad1')
-| ping.c:735:19: error: initializer element is not computable at load
-time
-| ping.c:735:19: note: (near initialization for 'm.__pad1')
-| make: *** [ping.o] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- ping.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/ping.c b/ping.c
-index 4989760..e67f381 100644
---- a/ping.c
-+++ b/ping.c
-@@ -731,8 +731,15 @@ int send_probe()
- 
- 	do {
- 		static struct iovec iov = {outpack, 0};
--		static struct msghdr m = { &whereto, sizeof(whereto),
--						   &iov, 1, &cmsg, 0, 0 };
-+		static struct msghdr m = {
-+			.msg_name = &whereto,
-+			.msg_namelen = sizeof(whereto),
-+			.msg_iov = &iov,
-+			.msg_iovlen = 1,
-+			.msg_control = &cmsg,
-+			.msg_controllen = 0,
-+			.msg_flags= 0,
-+		};
- 		m.msg_controllen = cmsg_len;
- 		iov.iov_len = cc;
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch b/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
deleted file mode 100644
index 7b56276b399..00000000000
--- a/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-arping: fix arping hang if SIGALRM is blocked
-
-Unblock SIGALRM so that the previously called alarm() can prevent
-recvfrom() from blocking forever in case the inherited procmask is
-blocking SIGALRM and no packet is received.
-
-Upstream-Status: Backport
-
-Reported-by: Rui Prior <rprior@dcc.fc.up.pt>
-RH-Bugzilla: #1085971
-Signed-off-by: Jan Synacek <jsynacek@redhat.com>
-Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
-
-diff --git a/arping.c.orig b/arping.c
-index 35408c1..2098159 100644
---- a/arping.c.orig
-+++ b/arping.c
-@@ -1215,16 +1215,22 @@ main(int argc, char **argv)
- 		socklen_t alen = sizeof(from);
- 		int cc;
- 
-+		sigemptyset(&sset);
-+		sigaddset(&sset, SIGALRM);
-+		sigaddset(&sset, SIGINT);
-+		/* Unblock SIGALRM so that the previously called alarm()
-+		 * can prevent recvfrom from blocking forever in case the
-+		 * inherited procmask is blocking SIGALRM and no packet
-+		 * is received. */
-+		sigprocmask(SIG_UNBLOCK, &sset, &osset);
-+
- 		if ((cc = recvfrom(s, packet, sizeof(packet), 0,
- 				   (struct sockaddr *)&from, &alen)) < 0) {
- 			perror("arping: recvfrom");
- 			continue;
- 		}
- 
--		sigemptyset(&sset);
--		sigaddset(&sset, SIGALRM);
--		sigaddset(&sset, SIGINT);
--		sigprocmask(SIG_BLOCK, &sset, &osset);
-+		sigprocmask(SIG_BLOCK, &sset, NULL);
- 		recv_pack(packet, cc, (struct sockaddr_ll *)&from);
- 		sigprocmask(SIG_SETMASK, &osset, NULL);
- 	}
diff --git a/meta/recipes-extended/iputils/files/debian/targets.diff b/meta/recipes-extended/iputils/files/debian/targets.diff
deleted file mode 100644
index 2cb5576c628..00000000000
--- a/meta/recipes-extended/iputils/files/debian/targets.diff
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: iputils-s20121221/Makefile
-===================================================================
---- iputils-s20121221.orig/Makefile
-+++ iputils-s20121221/Makefile
-@@ -106,7 +106,7 @@ endif
- endif
- 
- # -------------------------------------
--IPV4_TARGETS=tracepath ping clockdiff rdisc arping tftpd rarpd
-+IPV4_TARGETS=tracepath ping clockdiff arping
- IPV6_TARGETS=tracepath6 traceroute6 ping6
- TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS)
- 
diff --git a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
deleted file mode 100644
index d3b18868c0c..00000000000
--- a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-Index: iputils-s20121221/tracepath.c
-===================================================================
---- iputils-s20121221.orig/tracepath.c
-+++ iputils-s20121221/tracepath.c
-@@ -370,9 +370,9 @@ main(int argc, char **argv)
- 	}
- #endif
- 
--	he = gethostbyname(p);
-+	he = gethostbyname2(argv[0], AF_INET);
- 	if (he == NULL) {
--		herror("gethostbyname");
-+		herror("gethostbyname2");
- 		exit(1);
- 	}
- 
-Index: iputils-s20121221/ping.c
-===================================================================
---- iputils-s20121221.orig/ping.c
-+++ iputils-s20121221/ping.c
-@@ -279,7 +279,7 @@ main(int argc, char **argv)
- #else
- 			idn = target;
- #endif
--			hp = gethostbyname(idn);
-+			hp = gethostbyname2(idn, AF_INET);
- 			if (!hp) {
- 				fprintf(stderr, "ping: unknown host %s\n", target);
- 				exit(2);
diff --git a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch b/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
deleted file mode 100644
index 92bf946f2ab..00000000000
--- a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix nsgmls path issue
-
-Upstream-Status: Pending
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Index: iputils-s20101006/doc/Makefile
-===================================================================
---- iputils-s20101006.orig/doc/Makefile	2011-09-13 20:42:27.000000000 +0800
-+++ iputils-s20101006/doc/Makefile	2011-09-13 21:01:52.000000000 +0800
-@@ -27,10 +27,15 @@
- # docbook2man produces utterly ugly output and I did not find
- # any way to customize this but hacking backend perl script a little.
- # Well, hence...
-+# nsgmls seems append path to search directory according to the sysid path.
-+# e.g. if input ../index.db, it would search $search_directory/../ rather than
-+# $search_directory, which leads searching failure. Fixing nsgmls probably
-+# introduce some side effects, so use this ugly hack: running nsgmls in current
-+# directory, and running docbook2man in tmp directory.
- 
- $(MANFILES): index.db
- 	@-mkdir tmp.db2man
--	@set -e; cd tmp.db2man; nsgmls ../$< | sgmlspl ../docbook2man-spec.pl ;	mv $@ ..
-+	@set -e; nsgmls $< >tmp.db2man/output; cd tmp.db2man; cat output | sgmlspl ../docbook2man-spec.pl ;	mv $@ ..
- 	@-rm -rf tmp.db2man
- 
- clean:
diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
similarity index 56%
rename from meta/recipes-extended/iputils/iputils_s20151218.bb
rename to meta/recipes-extended/iputils/iputils_s20161105.bb
index 46de6fc4446..ad7dbc4d4ad 100644
--- a/meta/recipes-extended/iputils/iputils_s20151218.bb
+++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Network monitoring tools"
 DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
 tracepath, tracepath6, ping, ping6 and arping."
-HOMEPAGE = "http://www.skbuff.net/iputils"
+HOMEPAGE = "https://github.com/iputils/iputils"
 SECTION = "console/network"
 
 LICENSE = "BSD & GPLv2+"
@@ -13,20 +13,13 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
 
 DEPENDS = "gnutls libcap libgcrypt"
 
+SRC_URI = "git://github.com/iputils/iputils \
+           file://0001-Fix-build-on-MUSL.patch \
+           "
+S = "${WORKDIR}/git"
+SRCREV = "bffc0e957b98d626ab4cea218c89251201425442"
 
-SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
-           file://debian/use_gethostbyname2.diff \
-           file://debian/targets.diff \
-           file://nsgmls-path-fix.patch \
-           file://0001-Fix-header-inclusion-for-musl.patch \
-           file://0001-Intialize-struct-elements-by-name.patch \
-           file://arping-fix-arping-hang-if-SIGALRM-is-blocked.patch \
-          "
-
-SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
-SRC_URI[sha256sum] = "549f58d71951e52b46595829134d4e330642f522f50026917fadc349a54825a1"
-
-UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
@@ -38,11 +31,10 @@ do_install () {
 	install -m 0755 -d ${D}${base_bindir}
 	# SUID root programs
 	install -m 4555 ping ${D}${base_bindir}/ping
-	install -m 4555 ping6 ${D}${base_bindir}/ping6
 	install -m 4555 traceroute6 ${D}${base_bindir}/
 	install -m 4555 clockdiff ${D}${base_bindir}/
 	# Other programgs
-	for i in arping tracepath tracepath6; do
+	for i in arping tracepath; do
 	  install -m 0755 $i ${D}${base_bindir}/
 	done
 }
@@ -54,19 +46,14 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-ALTERNATIVE_${PN}-ping6 = "ping6"
-ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
-
-PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
+PACKAGES += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff"
 
 ALLOW_EMPTY_${PN} = "1"
-RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
+RDEPENDS_${PN} += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff"
 
 FILES_${PN}	= ""
 FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
-FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES_${PN}-arping = "${base_bindir}/arping"
 FILES_${PN}-tracepath = "${base_bindir}/tracepath"
-FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
-- 
2.15.1


