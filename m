Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RuQdH-0003l1-L0
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 16:37:31 +0100
Received: by wibhq7 with SMTP id hq7so4550373wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 07:29:30 -0800 (PST)
Received: by 10.180.95.1 with SMTP id dg1mr27972194wib.21.1328542170249;
	Mon, 06 Feb 2012 07:29:30 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id ep3sm29877722wib.10.2012.02.06.07.29.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 07:29:29 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 17:29:19 +0200
Message-Id: <1328542159-8365-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] socat: Update to version 2.0.0 beta4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 15:37:31 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../recipes-connectivity/socat/files/compile.patch |   45 ++++++++++++++-----
 meta/recipes-connectivity/socat/socat_1.7.2.0.bb   |   28 ------------
 meta/recipes-connectivity/socat/socat_2.0.0-b4.bb  |   28 ++++++++++++
 3 files changed, 61 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat_1.7.2.0.bb
 create mode 100644 meta/recipes-connectivity/socat/socat_2.0.0-b4.bb

diff --git a/meta/recipes-connectivity/socat/files/compile.patch b/meta/recipes-connectivity/socat/files/compile.patch
index 4d1a0b6..6b980b9 100644
--- a/meta/recipes-connectivity/socat/files/compile.patch
+++ b/meta/recipes-connectivity/socat/files/compile.patch
@@ -9,7 +9,7 @@ Fri Dec 16 17:12:17 CST 2011
 diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 --- socat-1.7.2.0.orig/configure.in	2011-12-04 21:34:16.000000000 +0800
 +++ socat-1.7.2.0/configure.in	2011-12-16 17:08:59.698367071 +0800
-@@ -88,7 +88,7 @@
+@@ -76,7 +76,7 @@
  
  
  dnl Check for extra socket library (for Solaris)
@@ -18,7 +18,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  AC_CHECK_FUNC(gethostent, , AC_CHECK_LIB(nsl, gethostent))
  AC_CHECK_FUNC(setsockopt, , AC_CHECK_LIB(socket, setsockopt))
  
-@@ -102,7 +102,7 @@
+@@ -90,7 +90,7 @@
   [sc_cv_have_prototype_hstrerror=yes]);
   CFLAGS="$CFLAGS1"])
  if test $sc_cv_have_prototype_hstrerror = yes; then
@@ -27,7 +27,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
  
-@@ -111,83 +111,83 @@
+@@ -99,99 +99,99 @@
  AC_ARG_ENABLE(help, [  --disable-help          disable help],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -37,6 +37,26 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 -	       [AC_DEFINE(WITH_HELP) AC_MSG_RESULT(yes)])
 +	       [AC_DEFINE(WITH_HELP, [1], [With help]) AC_MSG_RESULT(yes)])
  
+ AC_MSG_CHECKING(whether to include nop address support)
+ AC_ARG_ENABLE(nop, [  --disable-nop           disable nop support],
+ 	      [case "$enableval" in
+ 	       no) AC_MSG_RESULT(no);;
+-	       *) AC_DEFINE(WITH_NOP) AC_MSG_RESULT(yes);;
++	       *) AC_DEFINE(WITH_NOP, [1], [With nop]) AC_MSG_RESULT(yes);;
+ 	       esac],
+-	       [AC_DEFINE(WITH_NOP) AC_MSG_RESULT(yes)])
++	       [AC_DEFINE(WITH_nop, [1], [With nop]) AC_MSG_RESULT(yes)])
+ 
+ AC_MSG_CHECKING(whether to include test address support)
+ AC_ARG_ENABLE(test, [  --disable-test           disable test support],
+ 	      [case "$enableval" in
+ 	       no) AC_MSG_RESULT(no);;
+-	       *) AC_DEFINE(WITH_TEST) AC_MSG_RESULT(yes);;
++	       *) AC_DEFINE(WITH_TEST, [1], [With test]) AC_MSG_RESULT(yes);;
+ 	       esac],
+-	       [AC_DEFINE(WITH_TEST) AC_MSG_RESULT(yes)])
++	       [AC_DEFINE(WITH_TEST, [1], [With test]) AC_MSG_RESULT(yes)])
+ 
  AC_MSG_CHECKING(whether to include STDIO support)
  AC_ARG_ENABLE(stdio, [  --disable-stdio         disable STDIO support],
  	      [case "$enableval" in
@@ -131,7 +151,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  		*)
  		    AC_MSG_RESULT(no);;
  		esac])
-@@ -196,9 +196,9 @@
+@@ -200,9 +200,9 @@
  AC_ARG_ENABLE(ip4, [  --disable-ip4           disable IPv4 support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -143,7 +163,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  AC_MSG_CHECKING(whether to include IPv6 support)
  AC_ARG_ENABLE(ip6, [  --disable-ip6           disable IPv6 support],
-@@ -209,7 +209,7 @@
+@@ -213,7 +213,7 @@
  	      [ AC_MSG_RESULT(yes);  WITH_IP6=1 ])
  if test "$WITH_IP6"; then
    AC_CHECK_HEADERS([netinet/ip6.h],
@@ -152,7 +172,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
      [AC_MSG_WARN([include file netinet/ip6.h not found, disabling IP6])],
      [AC_INCLUDES_DEFAULT
       #ifdef HAVE_NETINET_IN_H
-@@ -242,17 +242,17 @@
+@@ -245,17 +245,17 @@
  AC_ARG_ENABLE(rawip, [  --disable-rawip         disable raw IP support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -174,7 +194,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  AC_MSG_CHECKING(whether to include raw network interface support)
  AC_ARG_ENABLE(interface, [  --disable-interface  disable network interface support],
  	      [case "$enableval" in
-@@ -262,35 +262,35 @@
+@@ -293,35 +293,35 @@
  	       [AC_MSG_RESULT(yes);  WITH_INTERFACE=1 ])
  if test "$WITH_INTERFACE"; then
    AC_CHECK_HEADER(netpacket/packet.h,
@@ -847,17 +867,18 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($ac_cv_have_z_modifier)
  
-@@ -1334,7 +1335,8 @@
+@@ -1334,8 +1335,9 @@
   [$2=-1]
+  [AC_MSG_RESULT(please determine $1_SHIFT manually)]
  )
   LIBS="$LIBS1"])
 -AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
 +SHIFT_NAME="$1"_SHIFT
 +AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
- if test "$2" = -1; then
- AC_MSG_WARN(please determine $1_SHIFT manually)
- fi
-@@ -1374,7 +1376,7 @@
+ ])
+ 
+ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
+@@ -1332,7 +1332,7 @@
          [$4="0 /* unknown, taking default */"
  ]) ]) ]) ]) ]) ]) ]) ])
   CFLAGS="$CFLAGS1" ])
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
deleted file mode 100644
index 1273dcf..0000000
--- a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Socat is a relay for bidirectional data \
-transfer between two independent data channels."
-HOMEPAGE = "http://www.dest-unreach.org/socat/"
-
-SECTION = "console/network"
-
-DEPENDS = "openssl"
-
-LICENSE = "GPL-2.0+-with-OpenSSL-exception"
-
-PR = "r0"
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=src \
-           file://compile.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
-
-SRC_URI[src.md5sum] = "eb563dd00b9d39a49fb62a677fc941fe"
-SRC_URI[src.sha256sum] = "59b3bde927c14fbc3f9e42c782971710da8a89bbf46f7531f09a681754041802"
-
-EXTRA_OECONF = " --disable-termios "
-
-inherit autotools
-
-do_install_prepend () {
-    mkdir -p ${D}${bindir}
-    install -d ${D}${bindir} ${D}${mandir}/man1
-}
diff --git a/meta/recipes-connectivity/socat/socat_2.0.0-b4.bb b/meta/recipes-connectivity/socat/socat_2.0.0-b4.bb
new file mode 100644
index 0000000..bb413a8
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat_2.0.0-b4.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Socat is a relay for bidirectional data \
+               transfer between two independent data channels."
+HOMEPAGE = "http://www.dest-unreach.org/socat/"
+SECTION = "console/network"
+
+DEPENDS = "readline openssl"
+
+LICENSE = "GPL-2.0 & MIT & OpenSSL"
+
+PR = "r0"
+
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=src \
+           file://compile.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
+                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
+
+SRC_URI[src.md5sum] = "b51a00937d0a56fc8eccd36175e9d068"
+SRC_URI[src.sha256sum] = "1272133a0b2aef0045f1b71a2f49194e6fbc37ed5c0d0c683d98b52740dbcd9c"
+
+EXTRA_OECONF = " --disable-termios "
+
+inherit autotools
+
+do_install_prepend () {
+    mkdir -p ${D}${bindir}
+    install -d ${D}${bindir} ${D}${mandir}/man1
+}
-- 
1.7.5.4



