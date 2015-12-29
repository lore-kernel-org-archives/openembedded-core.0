Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF7C60118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 13:10:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2015 05:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,495,1444719600"; d="scan'208";a="850106675"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Dec 2015 05:10:22 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EECE36A4087
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 05:58:20 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Dec 2015 15:11:59 +0200
Message-Id: <1451394719-3758-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] iptables: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 29 Dec 2015 13:10:26 -0000

1.4.21 -> 1.6.0

xtables_globals structure layout has changed.

* Refreshed below listed patches to work with this release:
        1. 0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
        2. 0001-fix-build-with-musl.patch

* Added PACKAGECONFIG for libnftnl

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...Add-option-to-enable-disable-libnfnetlink.patch | 50 +++++++---------
 .../iptables/0001-fix-build-with-musl.patch        | 69 ++++------------------
 .../{iptables_1.4.21.bb => iptables_1.6.0.bb}      |  9 ++-
 3 files changed, 39 insertions(+), 89 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.21.bb => iptables_1.6.0.bb} (84%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index ab609e2..b711b7a 100644
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -1,47 +1,37 @@
-From 5c47cf5061b852c02178f01e23690bfe38a99d93 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 17 Mar 2013 11:21:35 -0700
-Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
+[PATCH] configure: Add option to enable/disable libnfnetlink
 
 This changes the configure behaviour from autodetecting
 for libnfnetlink to having an option to disable it explicitly
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Pending
----
- configure.ac |   11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index ba616ab..ce2d315 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,6 +53,9 @@ AC_ARG_ENABLE([libipq],
- AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
- 	[Path to the pkgconfig directory [[LIBDIR/pkgconfig]]]),
- 	[pkgconfigdir="$withval"], [pkgconfigdir='${libdir}/pkgconfig'])
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur iptables-1.6.0-old/configure.ac iptables-1.6.0/configure.ac
+--- iptables-1.6.0-old/configure.ac	2015-12-28 18:40:35.255417976 +0200
++++ iptables-1.6.0/configure.ac	2015-12-29 13:01:12.388840200 +0200
+@@ -63,6 +63,9 @@
+ AC_ARG_ENABLE([nftables],
+ 	AS_HELP_STRING([--disable-nftables], [Do not build nftables compat]),
+ 	[enable_nftables="$enableval"], [enable_nftables="yes"])
 +AC_ARG_ENABLE([libnfnetlink],
-+	AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
-+	[enable_libnfnetlink="$enableval"], [enable_libnfnetlink="yes"])
++    AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
++    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="yes"])
  
  libiptc_LDFLAGS2="";
  AX_CHECK_LINKER_FLAGS([-Wl,--no-as-needed],
-@@ -89,9 +92,11 @@ AM_CONDITIONAL([ENABLE_LARGEFILE], [test "$enable_largefile" = "yes"])
- AM_CONDITIONAL([ENABLE_DEVEL], [test "$enable_devel" = "yes"])
- AM_CONDITIONAL([ENABLE_LIBIPQ], [test "$enable_libipq" = "yes"])
+@@ -123,9 +126,10 @@
+ 	AC_CHECK_LIB(pcap, pcap_compile,, AC_MSG_ERROR(missing libpcap library required by bpf compiler or nfsynproxy tool))
+ fi
  
 -PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
 -	[nfnetlink=1], [nfnetlink=0])
 -AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
 +AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
-+  PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0])
-+  ])
-+
++    PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0])
++    ])
 +AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "x$enable_libnfnetlink" = "xyes"])
  
- regular_CFLAGS="-Wall -Waggregate-return -Wmissing-declarations \
- 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes \
--- 
-1.7.9.5
-
+ if test "x$enable_nftables" = "xyes"; then
+ 	PKG_CHECK_MODULES([libmnl], [libmnl >= 1.0], [mnl=1], [mnl=0])
diff --git a/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch b/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
index 7a003d9..f1f85a6 100644
--- a/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
@@ -1,81 +1,41 @@
-From 7c07b7fd4fdd7844dd032af822306f08e4422c34 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 20:47:29 -0700
-Subject: [PATCH] fix build with musl
+[PATCH] fix build with musl
 
-Add needed headers they are just not needed for glibc6+ but also
-for musl
 Define additional TCOPTS if not there
-
 u_initX types are in sys/types.h be explicit about it
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- extensions/libxt_TCPOPTSTRIP.c           | 15 +++++++++++++++
- include/libiptc/ipt_kernel_headers.h     | 12 ------------
- include/linux/netfilter_ipv4/ip_tables.h |  1 +
- 3 files changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/extensions/libxt_TCPOPTSTRIP.c b/extensions/libxt_TCPOPTSTRIP.c
-index 6897857..8a170b2 100644
---- a/extensions/libxt_TCPOPTSTRIP.c
-+++ b/extensions/libxt_TCPOPTSTRIP.c
+diff -Naur iptables-1.6.0-origin/extensions/libxt_TCPOPTSTRIP.c iptables-1.6.0/extensions/libxt_TCPOPTSTRIP.c
+--- iptables-1.6.0-origin/extensions/libxt_TCPOPTSTRIP.c	2015-12-09 14:55:06.000000000 +0200
++++ iptables-1.6.0/extensions/libxt_TCPOPTSTRIP.c	2015-12-29 14:44:32.585327077 +0200
 @@ -12,6 +12,21 @@
  #ifndef TCPOPT_MD5SIG
  #	define TCPOPT_MD5SIG 19
  #endif
 +#ifndef TCPOPT_MAXSEG
-+#	define TCPOPT_MAXSEG 2
++#define TCPOPT_MAXSEG 2
 +#endif
 +#ifndef TCPOPT_WINDOW
-+#	define TCPOPT_WINDOW 3
++#define TCPOPT_WINDOW 3
 +#endif
 +#ifndef TCPOPT_SACK_PERMITTED
-+#	define TCPOPT_SACK_PERMITTED 4
++#define TCPOPT_SACK_PERMITTED 4
 +#endif
 +#ifndef TCPOPT_SACK
-+#	define TCPOPT_SACK 5
++#define TCPOPT_SACK 5
 +#endif
 +#ifndef TCPOPT_TIMESTAMP
-+#	define TCPOPT_TIMESTAMP 8
++#define TCPOPT_TIMESTAMP 8
 +#endif
  
  enum {
  	O_STRIP_OPTION = 0,
-diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
-index 18861fe..a5963e9 100644
---- a/include/libiptc/ipt_kernel_headers.h
-+++ b/include/libiptc/ipt_kernel_headers.h
-@@ -5,7 +5,6 @@
- 
- #include <limits.h>
- 
--#if defined(__GLIBC__) && __GLIBC__ == 2
- #include <netinet/ip.h>
- #include <netinet/in.h>
- #include <netinet/ip_icmp.h>
-@@ -13,15 +12,4 @@
- #include <netinet/udp.h>
- #include <net/if.h>
- #include <sys/types.h>
--#else /* libc5 */
--#include <sys/socket.h>
--#include <linux/ip.h>
--#include <linux/in.h>
--#include <linux/if.h>
--#include <linux/icmp.h>
--#include <linux/tcp.h>
--#include <linux/udp.h>
--#include <linux/types.h>
--#include <linux/in6.h>
--#endif
- #endif
-diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
-index 57fd82a..4807246 100644
---- a/include/linux/netfilter_ipv4/ip_tables.h
-+++ b/include/linux/netfilter_ipv4/ip_tables.h
+diff -Naur iptables-1.6.0-origin/include/linux/netfilter_ipv4/ip_tables.h iptables-1.6.0/include/linux/netfilter_ipv4/ip_tables.h
+--- iptables-1.6.0-origin/include/linux/netfilter_ipv4/ip_tables.h	2015-12-09 14:55:06.000000000 +0200
++++ iptables-1.6.0/include/linux/netfilter_ipv4/ip_tables.h	2015-12-29 14:40:21.250469195 +0200
 @@ -15,6 +15,7 @@
  #ifndef _IPTABLES_H
  #define _IPTABLES_H
@@ -84,6 +44,3 @@ index 57fd82a..4807246 100644
  #include <linux/types.h>
  
  #include <linux/netfilter_ipv4.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.6.0.bb
similarity index 84%
rename from meta/recipes-extended/iptables/iptables_1.4.21.bb
rename to meta/recipes-extended/iptables/iptables_1.6.0.bb
index 4118f54..fbbe418 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.0.bb
@@ -21,12 +21,12 @@ FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0001-fix-build-with-musl.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
           "
+SRC_URI_append_libc-musl = " file://0001-fix-build-with-musl.patch"
 
-SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
-SRC_URI[sha256sum] = "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
+SRC_URI[md5sum] = "27ba3451cb622467fc9267a176f19a31"
+SRC_URI[sha256sum] = "4bb72a0a0b18b5a9e79e87631ddc4084528e5df236bc7624472dcaa8480f1c60"
 
 inherit autotools pkgconfig
 
@@ -40,6 +40,9 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libnfnetlink recipe is in meta-networking layer
 PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libnfnetlink libnetfilter-conntrack"
 
+# libnftnl recipe is in meta-networking layer(previously known as libnftables)
+PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
+
 do_configure_prepend() {
 	# Remove some libtool m4 files
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
-- 
2.4.0


