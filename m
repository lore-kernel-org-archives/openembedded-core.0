Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6918371E08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 11:53:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Feb 2017 03:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,189,1484035200"; d="scan'208";a="227884017"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2017 03:53:37 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 860D06A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 03:53:36 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 13:55:07 +0200
Message-Id: <1487678107-30737-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1487678107-30737-1-git-send-email-maxin.john@intel.com>
References: <1487678107-30737-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] iptables: upgrade to 1.6.1
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
X-List-Received-Date: Tue, 21 Feb 2017 11:53:36 -0000

1.6.0 -> 1.6.1

Refreshed the following patches:
 a) 0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
 b) 0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...Add-option-to-enable-disable-libnfnetlink.patch | 28 ++++++++----
 ...check-conntrack-when-libnfnetlink-enabled.patch | 53 ++++++++++++++--------
 .../{iptables_1.6.0.bb => iptables_1.6.1.bb}       |  4 +-
 3 files changed, 56 insertions(+), 29 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.6.0.bb => iptables_1.6.1.bb} (93%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index b711b7a..03c36cc 100644
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -1,4 +1,7 @@
-[PATCH] configure: Add option to enable/disable libnfnetlink
+From c46db7c2e1f63ec525835553587e70c635565310 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 21 Feb 2017 11:16:31 +0200
+Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
 
 This changes the configure behaviour from autodetecting
 for libnfnetlink to having an option to disable it explicitly
@@ -8,20 +11,24 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
-diff -Naur iptables-1.6.0-old/configure.ac iptables-1.6.0/configure.ac
---- iptables-1.6.0-old/configure.ac	2015-12-28 18:40:35.255417976 +0200
-+++ iptables-1.6.0/configure.ac	2015-12-29 13:01:12.388840200 +0200
-@@ -63,6 +63,9 @@
+ configure.ac | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eda7871..03ddc50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
  AC_ARG_ENABLE([nftables],
  	AS_HELP_STRING([--disable-nftables], [Do not build nftables compat]),
  	[enable_nftables="$enableval"], [enable_nftables="yes"])
 +AC_ARG_ENABLE([libnfnetlink],
 +    AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
 +    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="yes"])
- 
- libiptc_LDFLAGS2="";
- AX_CHECK_LINKER_FLAGS([-Wl,--no-as-needed],
-@@ -123,9 +126,10 @@
+ AC_ARG_ENABLE([connlabel],
+ 	AS_HELP_STRING([--disable-connlabel],
+ 	[Do not build libnetfilter_conntrack]),
+@@ -115,9 +118,10 @@ if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
  	AC_CHECK_LIB(pcap, pcap_compile,, AC_MSG_ERROR(missing libpcap library required by bpf compiler or nfsynproxy tool))
  fi
  
@@ -35,3 +42,6 @@ diff -Naur iptables-1.6.0-old/configure.ac iptables-1.6.0/configure.ac
  
  if test "x$enable_nftables" = "xyes"; then
  	PKG_CHECK_MODULES([libmnl], [libmnl >= 1.0], [mnl=1], [mnl=0])
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch b/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
index 89ad8f6..7842c64 100644
--- a/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
+++ b/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
@@ -1,34 +1,51 @@
+From 26090b3dbcdf6a11e60535da949b726a6e86426d Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 21 Feb 2017 11:49:07 +0200
+Subject: [PATCH] configure.ac:
+ only-check-conntrack-when-libnfnetlink-enabled.patch
+
 Package libnetfilter-conntrack depends on package libnfnetlink. iptables
 checks package libnetfilter-conntrack whatever its package config
 libnfnetlink is enabled or not. When libnfnetlink is disabled but
 package libnetfilter-conntrack exists, it fails randomly with:
 
-| In file included from .../iptables/1.4.21-r0/iptables-1.4.21/extensions/libxt_connlabel.c:8:0:
-| .../tmp/sysroots/qemumips/usr/include/libnetfilter_conntrack/libnetfilter_conntrack.h:14:42: fatal error: libnfnetlink/linux_nfnetlink.h: No such file or directory
-| compilation terminated.
-| GNUmakefile:96: recipe for target 'libxt_connlabel.oo' failed
+In file included from
+.../iptables/1.4.21-r0/iptables-1.4.21/extensions/libxt_connlabel.c:8:0:
+
+.../tmp/sysroots/qemumips/usr/include/libnetfilter_conntrack/libnetfilter_conntrack.h:14:42:
+fatal error: libnfnetlink/linux_nfnetlink.h: No such file or directory
 
+compilation terminated.
+GNUmakefile:96: recipe for target 'libxt_connlabel.oo' failed
 Only check libnetfilter-conntrack when libnfnetlink is enabled to fix it.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5d7e62b..e331ee7 100644
+index 03ddc50..523caea 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -88,8 +88,12 @@ if test "$ac_cv_header_linux_ip_vs_h" != "yes"; then
- 	blacklist_modules="$blacklist_modules ipvs";
- fi;
+@@ -172,10 +172,12 @@ if test "$nftables" != 1; then
+ fi
  
--PKG_CHECK_MODULES([libnetfilter_conntrack], [libnetfilter_conntrack >= 1.0.4],
-+nfconntrack=0
-+AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
-+  PKG_CHECK_MODULES([libnetfilter_conntrack], [libnetfilter_conntrack >= 1.0.4],
- 	[nfconntrack=1], [nfconntrack=0])
-+  ])
-+
- AM_CONDITIONAL([HAVE_LIBNETFILTER_CONNTRACK], [test "$nfconntrack" = 1])
- 
- if test "$nfconntrack" -ne 1; then
+ if test "x$enable_connlabel" = "xyes"; then
+-	PKG_CHECK_MODULES([libnetfilter_conntrack],
++    nfconntrack=0
++    AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
++    PKG_CHECK_MODULES([libnetfilter_conntrack],
+ 		[libnetfilter_conntrack >= 1.0.6],
+ 		[nfconntrack=1], [nfconntrack=0])
+-
++    ])
+ 	if test "$nfconntrack" -ne 1; then
+ 		blacklist_modules="$blacklist_modules connlabel";
+ 		echo "WARNING: libnetfilter_conntrack not found, connlabel match will not be built";
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/iptables/iptables_1.6.0.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
similarity index 93%
rename from meta/recipes-extended/iptables/iptables_1.6.0.bb
rename to meta/recipes-extended/iptables/iptables_1.6.1.bb
index fbbe418..9b4c050 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.0.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
           "
 SRC_URI_append_libc-musl = " file://0001-fix-build-with-musl.patch"
 
-SRC_URI[md5sum] = "27ba3451cb622467fc9267a176f19a31"
-SRC_URI[sha256sum] = "4bb72a0a0b18b5a9e79e87631ddc4084528e5df236bc7624472dcaa8480f1c60"
+SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
+SRC_URI[sha256sum] = "0fc2d7bd5d7be11311726466789d4c65fb4c8e096c9182b56ce97440864f0cf5"
 
 inherit autotools pkgconfig
 
-- 
2.4.0


