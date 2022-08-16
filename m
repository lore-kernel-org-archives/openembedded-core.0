Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBFC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:57:28 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web09.16114.1660658243841754904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 06:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,241,1654588800";
   d="scan'208";a="84123296"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 16 Aug 2022 05:57:23 -0800
IronPort-SDR: 
 iVq8ntJxNkWGNodjbhAPrkqyuTW4nmHelbmuDn28JcfPlctGc18x4/ZRI5QiVttwEI7nDKij9L
 0+Qr7VvI1UyfCOuxAnl8w1qcau4pcq+MK0YFWehxbcBz7mGYazc/bCAGB95fmvA25fOHLdQuFO
 70m11Stq/rrJumUNWgRMSvg+MNmUGFFud48BJwEZq6G9+rqw24bdsJKwi//El79l/su3PyAHQj
 auOE9pvXV1DgiFWnSwURNU6qGyI1ngMH614yf6bnObN1iWA2iukPecQF6LfxqJI6aHEmsaJkUh
 IV4=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alex Kiernan <alex.kiernan@gmail.com>, Alex Kiernan <alexk@zuma.ai>, Khem
 Raj <raj.khem@gmail.com>, Muhammad Hamza <muhammad_hamza@mentor.com>
Subject: [meta-oe][kirkstone][PATCH] libcoap: Add recipe
Date: Tue, 16 Aug 2022 18:56:49 +0500
Message-ID: <20220816135649.2312716-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 13:57:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169436

From: Alex Kiernan <alex.kiernan@gmail.com>

libcoap implements a lightweight application-protocol for devices that
are constrained their resources such as computing power, RF range,
memory, bandwith, or network packet sizes.

Upstream-Status: Bacport from
https://github.com/openembedded/meta-openembedded/commit/1556da89029c364bea101e782bdd016b69cddb82

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 ...alance-SESSIONS_ADD-and-SESSIONS_DEL.patch | 51 ++++++++++++++++
 ...0001-libcoap-Fix-gnu-configize-error.patch | 44 ++++++++++++++
 .../libcoap/libcoap/run-ptest                 |  7 +++
 .../recipes-devtools/libcoap/libcoap_4.3.0.bb | 58 +++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
new file mode 100644
index 000000000..c8ac8485a
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
@@ -0,0 +1,51 @@
+From c56a64ff4df7eecb6c88ff929497bcd0d65934f2 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Fri, 22 Apr 2022 13:15:39 +0100
+Subject: [PATCH] coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE
+ usage
+
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/7e20aa9ef17277f39203334404e6c776b1171a7d]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ src/coap_session.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/coap_session.c b/src/coap_session.c
+index 77cae598f0af..536e57573361 100644
+--- a/src/coap_session.c
++++ b/src/coap_session.c
+@@ -813,6 +813,12 @@ coap_session_create_client(
+   return session;
+ 
+ error:
++  /*
++   * Need to add in the session as coap_session_release()
++   * will call SESSIONS_DELETE in coap_session_free().
++   */
++  if (session)
++    SESSIONS_ADD(ctx->sessions, session);
+   coap_session_release(session);
+   return NULL;
+ }
+@@ -1133,11 +1139,17 @@ coap_session_t *coap_new_server_session(
+   if (session) {
+     coap_log(LOG_DEBUG, "***%s: new incoming session\n",
+              coap_session_str(session));
++    /* Returned session may already have been released and is now NULL */
+     session = coap_session_accept(session);
+   }
+   return session;
+ 
+ error:
++  /*
++   * Need to add in the session as coap_session_release()
++   * will call SESSIONS_DELETE in coap_session_free().
++   */
++  SESSIONS_ADD(ep->sessions, session);
+   coap_session_free(session);
+   return NULL;
+ }
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
new file mode 100644
index 000000000..64f8d3acc
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
@@ -0,0 +1,44 @@
+From 25f1bebf1bc4c8da47f976d24a7a424253744e2e Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 24 Mar 2021 09:10:17 +0000
+Subject: [PATCH] libcoap: Fix gnu-configize error
+
+Fix:
+
+  autoreconf: running: gnu-configize
+  gnu-configize: 'configure.ac' or 'configure.in' is required
+  autoreconf: gnu-configize failed with exit status: 1
+
+We're not pulling in the ext/tinydtls submodule, so this fails.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ configure.ac | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9f51f4c67557..559808e03aa2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -472,19 +472,6 @@ if test "x$build_dtls" = "xyes"; then
+         have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+     fi
+ 
+-    # The user wants to use explicit TinyDTLS if '--with-tinydtls was set'.
+-    if test "x$with_tinydtls" = "xyes" ; then
+-        if test -d "$srcdir/ext/tinydtls"; then
+-           AC_CONFIG_SUBDIRS([ext/tinydtls])
+-           have_tinydtls="yes"
+-         else
+-           have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         fi
+-         have_gnutls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         have_openssl="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         have_mbedtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-    fi
+-
+     if test "$TLSCOUNT" -eq 0; then
+       # The user hasn't requested the use of a specific cryptography library
+       # we try first GnuTLS for usability ...
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
new file mode 100644
index 000000000..b56ffe68f
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if /usr/lib/libcoap/ptest/testdriver; then
+	echo "PASS: libcoap"
+else
+	echo "FAIL: libcoap"
+fi
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
new file mode 100644
index 000000000..aba81d126
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
@@ -0,0 +1,58 @@
+SUMMARY = "A C implementation of the Constrained Application Protocol"
+DESCRIPTION = "libcoap implements a lightweight application-protocol for \
+devices that are constrained their resources such as computing power, \
+RF range, memory, bandwith, or network packet sizes."
+HOMEPAGE ="https://libcoap.net/"
+
+LICENSE = "BSD-2-Clause & BSD-1-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e44b3af4925ec58e9f49b9ff143b5493"
+
+SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
+           file://0001-libcoap-Fix-gnu-configize-error.patch \
+           file://0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch \
+           file://run-ptest \
+           "
+SRCREV = "1da37b9abbe871675d5939395b498324ccc8ecfe"
+
+S = "${WORKDIR}/git"
+
+inherit autotools manpages pkgconfig ptest
+
+PACKAGECONFIG ?= "\
+    async openssl tcp \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[async] = "--enable-async,--disable-async"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,openssl mbedtls"
+PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,gnutls openssl"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,gnutls mbedtls"
+PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
+PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
+
+EXTRA_OECONF = "\
+    --with-epoll --enable-add-default-names \
+    --without-tinydtls \
+    ${@bb.utils.contains_any('PACKAGECONFIG', 'gnutls openssl mbedtls', '--enable-dtls', '--disable-dtls', d)} \
+"
+
+python () {
+    if d.getVar('PTEST_ENABLED') == "1":
+        d.setVar('DISABLE_STATIC', '')
+}
+
+export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+	install -m 0755 ${B}/tests/testdriver ${D}${PTEST_PATH}/testdriver
+}
+
+PACKAGE_BEFORE_PN += "\
+    ${PN}-bin \
+"
+
+FILES:${PN}-bin = "${bindir}"
+FILES:${PN}-dev += "${datadir}/${BPN}/examples"
-- 
2.25.1


