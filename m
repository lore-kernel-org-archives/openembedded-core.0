Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0E160881
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 15:08:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2013 08:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,807,1363158000"; d="scan'208";a="348557447"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2013 08:08:05 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 18:09:07 +0300
Message-Id: <1370444947-24578-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpcap: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 05 Jun 2013 15:08:08 -0000

0001-Fix-disable-canusb.patch,
0001-The-leading-comma-looked-weird-remove-it.patch,
0001-canusb-needs-lpthread.patch patches included in
upstream, no longer needed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libpcap-1.3.0/0001-Fix-disable-canusb.patch    |   30 -----------
 ...-The-leading-comma-looked-weird-remove-it.patch |   54 --------------------
 .../libpcap-1.3.0/0001-canusb-needs-lpthread.patch |   32 ------------
 .../{libpcap-1.3.0 => libpcap}/aclocal.patch       |    0
 .../ieee80215-arphrd.patch                         |    0
 .../libpcap/{libpcap_1.3.0.bb => libpcap_1.4.0.bb} |   13 +++--
 6 files changed, 8 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-Fix-disable-canusb.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-The-leading-comma-looked-weird-remove-it.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-canusb-needs-lpthread.patch
 rename meta/recipes-connectivity/libpcap/{libpcap-1.3.0 => libpcap}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.3.0 => libpcap}/ieee80215-arphrd.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.3.0.bb => libpcap_1.4.0.bb} (56%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-Fix-disable-canusb.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-Fix-disable-canusb.patch
deleted file mode 100644
index 1e5e287..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-Fix-disable-canusb.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-
-From ccf671f5b7fbbef53d9cfd3091229b0b2a25159d Mon Sep 17 00:00:00 2001
-From: Edward Sheldrake <ejs1920@sourceforge.net>
-Date: Wed, 13 Jun 2012 12:09:21 -0700
-Subject: [PATCH] Fix --disable-canusb.
-
-Reviewed-By: Guy Harris <guy@alum.mit.edu>
-
-sgw - Removed configure part of the patch since it could change
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- config.h.in  |    3 -
- configure    |10672 ++++++++++++++++++++++++++++++++++++++++------------------
- 3 files changed, 7308 insertions(+), 3369 deletions(-)
-
-diff --git a/config.h.in b/config.h.in
-index bd5177c..aed5c37 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -232,9 +232,6 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
--/* Define to the home page for this package. */
--#undef PACKAGE_URL
--
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-The-leading-comma-looked-weird-remove-it.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-The-leading-comma-looked-weird-remove-it.patch
deleted file mode 100644
index e077a29..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-The-leading-comma-looked-weird-remove-it.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Backport
-
-From fffa60a0693182085a7d4351150137eda26dbf82 Mon Sep 17 00:00:00 2001
-From: Guy Harris <guy@alum.mit.edu>
-Date: Wed, 13 Jun 2012 12:20:19 -0700
-Subject: [PATCH] The leading comma looked weird; remove it.
-
-That might be how the --disable-canusb bug got in.  Hopefully this will
-make the code look a little clearer and possibly avoid future bugs of
-that sort.
-
-sgw - Cleaned up the patch based on another patch
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- configure.in |    9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-Index: libpcap-1.3.0/configure.in
-===================================================================
---- libpcap-1.3.0.orig/configure.in
-+++ libpcap-1.3.0/configure.in
-@@ -1371,7 +1371,8 @@ AC_SUBST(NETFILTER_SRC)
- 
- AC_ARG_ENABLE([bluetooth],
- [AC_HELP_STRING([--enable-bluetooth],[enable Bluetooth support @<:@default=yes, if support available@:>@])],
--,enable_bluetooth=yes)
-+    [],
-+    [enable_bluetooth=yes])
- 
- if test "x$enable_bluetooth" != "xno" ; then
- 	dnl check for Bluetooth sniffing support
-@@ -1395,8 +1396,10 @@ if test "x$enable_bluetooth" != "xno" ;
- fi
- 
- AC_ARG_ENABLE([canusb],
--[AC_HELP_STRING([--enable-canusb],[enable canusb support @<:@default=yes, if support available@:>@])]
--,enable_canusb=yes)
-+[AC_HELP_STRING([--enable-canusb],[enable canusb support @<:@default=yes, if support available@:>@])],
-+    [],
-+    [enable_canusb=yes])
-+
- 
- if test "x$enable_canusb" != "xno" ; then
- 	dnl check for canusb support
-@@ -1422,7 +1425,8 @@ fi
- 
- AC_ARG_ENABLE([can],
- [AC_HELP_STRING([--enable-can],[enable CAN support @<:@default=yes, if support available@:>@])],
--,enable_can=yes)
-+    [],
-+    [enable_can=yes])
- 
- if test "x$enable_can" != "xno" ; then
- 	dnl check for CAN sniffing support
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-canusb-needs-lpthread.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-canusb-needs-lpthread.patch
deleted file mode 100644
index e7456b7..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-canusb-needs-lpthread.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Backport
-
-From 2259a62edaf667d4bc9d1a28e612e3a7c0011545 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 30 Jun 2012 10:48:14 -0700
-Subject: [PATCH] canusb: needs -lpthread
-
-canusb uses pthreads, but -lpthread is never added to LIBS hence missing
-from pcap-config, causing build failures. Fix this.
-
-sgw - Removed configure part of the patch since it could change
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index ba5b64e..47e0b70 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1408,7 +1408,7 @@ if test "x$enable_canusb" != "xno" ; then
- 		[
- 		    AC_DEFINE(PCAP_SUPPORT_CANUSB, 1, [target host supports canusb])
- 		    CANUSB_SRC=pcap-canusb-linux.c
--		    LIBS="-lusb-1.0 $LIBS"
-+		    LIBS="-lusb-1.0 -lpthread $LIBS"
- 		    AC_MSG_NOTICE(canusb sniffing is supported)
- 		],
- 		AC_MSG_NOTICE(canusb sniffing is not supported; install libusb1.0 lib devel to enable it)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
rename to meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arphrd.patch
rename to meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb
similarity index 56%
rename from meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb
index efbe2bc..75a540e 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb
@@ -4,18 +4,21 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch \
-            file://0001-Fix-disable-canusb.patch \
-            file://0001-The-leading-comma-looked-weird-remove-it.patch \
-            file://0001-canusb-needs-lpthread.patch \
            "
 
-SRC_URI[md5sum] = "f78455a92622b7a3c05c58b6ad1cec7e"
-SRC_URI[sha256sum] = "41cbd9ed68383afd9f1fda279cb78427d36879d9e34ee707e31a16a1afd872b9"
+SRC_URI[md5sum] = "56e88a5aabdd1e04414985ac24f7e76c"
+SRC_URI[sha256sum] = "7c6a2a4f71e8ab09804e6b4fb3aff998c5583108ac42c0e2967eee8e1dbc7406"
 
 #
 # make install doesn't cover the shared lib
 # make install-shared is just broken (no symlinks)
 #
+
+do_configure_prepend () {
+    #remove hardcoded references to /usr/include
+    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.in
+}
+
 do_install_prepend () {
     install -d ${D}${libdir}
     install -d ${D}${bindir}
-- 
1.7.10.4


