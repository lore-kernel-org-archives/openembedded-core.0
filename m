Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2005.1614135755960386579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O32Okd009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:09 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:09 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/8] libssh2: pull in additional commits from meta-oe
Date: Tue, 23 Feb 2021 22:01:55 -0500
Message-ID: <20210224030201.349588-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

b24ef04ae libssh2: Fix build with autoconf 2.70+
d7aa71734 libssh2: enhance ptest
b3e9b51c9 libssh2: fix ptest
f5df715e2 libssh2: enable ptest
c1d1697c5 libssh2: add nativesdk support
3a6cbf246 libssh2: Security Advisory - libssh2 - CVE-2019-17498
40ea4c939 libssh2: upgrade 1.8.2 -> 1.9.0
5a7e65cbf libssh2: Clarify BSD license variant

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch |  46 ++++++
 ...ditionally-undefine-backend-m4-macro.patch |  30 ++++
 .../libssh2/files/CVE-2019-17498.patch        | 131 ++++++++++++++++++
 meta/recipes-support/libssh2/files/run-ptest  |   8 ++
 meta/recipes-support/libssh2/libssh2_1.8.2.bb |  27 ----
 meta/recipes-support/libssh2/libssh2_1.9.0.bb |  53 +++++++
 6 files changed, 268 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
 create mode 100644 meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
 create mode 100644 meta/recipes-support/libssh2/files/CVE-2019-17498.patch
 create mode 100644 meta/recipes-support/libssh2/files/run-ptest
 delete mode 100644 meta/recipes-support/libssh2/libssh2_1.8.2.bb
 create mode 100644 meta/recipes-support/libssh2/libssh2_1.9.0.bb

diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
new file mode 100644
index 0000000000..5ff9bf8462
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
@@ -0,0 +1,46 @@
+From f9e3e2ee7b18ba5bb8efe083171f3e701eb0a663 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Mon, 28 Dec 2020 02:08:03 +0000
+Subject: [PATCH] Don't let host enviroment to decide if a test is build
+
+test ssh2.sh need sshd, for cross compile, we need it on target, so
+don't use SSHD on host to decide weither to build a test
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/Makefile.am | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index dc0922f..6cbc35d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,16 +1,12 @@
+ AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
+ LDADD = ../src/libssh2.la
+ 
+-if SSHD
+ noinst_PROGRAMS = ssh2
+ ssh2_SOURCES = ssh2.c
+-endif
+ 
+ ctests = simple$(EXEEXT)
+ TESTS = $(ctests) mansyntax.sh
+-if SSHD
+ TESTS += ssh2.sh
+-endif
+ check_PROGRAMS = $(ctests)
+ 
+ TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
+@@ -38,4 +34,4 @@ if OPENSSL
+ # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
+ # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
+ EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
+-endif
+\ No newline at end of file
++endif
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch b/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
new file mode 100644
index 0000000000..1128c7ea0c
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
@@ -0,0 +1,30 @@
+From efe7101786193eaddb749c0583af6b54aec6f289 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2021 18:45:16 -0800
+Subject: [PATCH] configure: Conditionally undefine backend m4 macro
+
+Unlike the M4 builtin, this macro fails if macro is not defined
+therefore recover the behavior of the builtin.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fe5054a..758f8c2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -127,7 +127,7 @@ fi
+ m4_set_foreach([crypto_backends], [backend],
+   [AM_CONDITIONAL(m4_toupper(backend), test "$found_crypto" = "backend")]
+ )
+-m4_undefine([backend])
++m4_ifdef([backend], [m4_undefine([backend])])
+ 
+ 
+ # libz
+-- 
+2.30.0
+
diff --git a/meta/recipes-support/libssh2/files/CVE-2019-17498.patch b/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
new file mode 100644
index 0000000000..001080072b
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
@@ -0,0 +1,131 @@
+From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 30 Aug 2019 09:57:38 -0700
+Subject: [PATCH] packet.c: improve message parsing (#402)
+
+* packet.c: improve parsing of packets
+
+file: packet.c
+
+notes:
+Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
+
+Upstream-Status: Backport
+CVE: CVE-2019-17498
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/packet.c | 68 ++++++++++++++++++++++------------------------------
+ 1 file changed, 29 insertions(+), 39 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 38ab629..2e01bfc 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                     size_t datalen, int macstate)
+ {
+     int rc = 0;
+-    char *message = NULL;
+-    char *language = NULL;
++    unsigned char *message = NULL;
++    unsigned char *language = NULL;
+     size_t message_len = 0;
+     size_t language_len = 0;
+     LIBSSH2_CHANNEL *channelp = NULL;
+@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+         case SSH_MSG_DISCONNECT:
+             if(datalen >= 5) {
+-                size_t reason = _libssh2_ntohu32(data + 1);
++                uint32_t reason = 0;
++                struct string_buf buf;
++                buf.data = (unsigned char *)data;
++                buf.dataptr = buf.data;
++                buf.len = datalen;
++                buf.dataptr++; /* advance past type */
+ 
+-                if(datalen >= 9) {
+-                    message_len = _libssh2_ntohu32(data + 5);
++                _libssh2_get_u32(&buf, &reason);
++                _libssh2_get_string(&buf, &message, &message_len);
++                _libssh2_get_string(&buf, &language, &language_len);
+ 
+-                    if(message_len < datalen-13) {
+-                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
+-                        message = (char *) data + 9;
+-
+-                        language_len =
+-                            _libssh2_ntohu32(data + 9 + message_len);
+-                        language = (char *) data + 9 + message_len + 4;
+-
+-                        if(language_len > (datalen-13-message_len)) {
+-                            /* bad input, clear info */
+-                            language = message = NULL;
+-                            language_len = message_len = 0;
+-                        }
+-                    }
+-                    else
+-                        /* bad size, clear it */
+-                        message_len = 0;
+-                }
+                 if(session->ssh_msg_disconnect) {
+-                    LIBSSH2_DISCONNECT(session, reason, message,
+-                                       message_len, language, language_len);
++                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
++                                       message_len, (const char *)language,
++                                       language_len);
+                 }
++
+                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
+                                "Disconnect(%d): %s(%s)", reason,
+                                message, language);
+@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                 int always_display = data[1];
+ 
+                 if(datalen >= 6) {
+-                    message_len = _libssh2_ntohu32(data + 2);
+-
+-                    if(message_len <= (datalen - 10)) {
+-                        /* 6 = packet_type(1) + display(1) + message_len(4) */
+-                        message = (char *) data + 6;
+-                        language_len = _libssh2_ntohu32(data + 6 +
+-                                                        message_len);
+-
+-                        if(language_len <= (datalen - 10 - message_len))
+-                            language = (char *) data + 10 + message_len;
+-                    }
++                    struct string_buf buf;
++                    buf.data = (unsigned char *)data;
++                    buf.dataptr = buf.data;
++                    buf.len = datalen;
++                    buf.dataptr += 2; /* advance past type & always display */
++
++                    _libssh2_get_string(&buf, &message, &message_len);
++                    _libssh2_get_string(&buf, &language, &language_len);
+                 }
+ 
+                 if(session->ssh_msg_debug) {
+-                    LIBSSH2_DEBUG(session, always_display, message,
+-                                  message_len, language, language_len);
++                    LIBSSH2_DEBUG(session, always_display,
++                                  (const char *)message,
++                                  message_len, (const char *)language,
++                                  language_len);
+                 }
+             }
++
+             /*
+              * _libssh2_debug will actually truncate this for us so
+              * that it's not an inordinate about of data
+@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                 uint32_t len = 0;
+                 unsigned char want_reply = 0;
+                 len = _libssh2_ntohu32(data + 1);
+-                if(datalen >= (6 + len)) {
++                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
+                     want_reply = data[5 + len];
+                     _libssh2_debug(session,
+                                    LIBSSH2_TRACE_CONN,
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libssh2/files/run-ptest b/meta/recipes-support/libssh2/files/run-ptest
new file mode 100644
index 0000000000..5fd7ec65f6
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd tests
+for test in simple ssh2.sh mansyntax.sh
+do
+	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
+done
diff --git a/meta/recipes-support/libssh2/libssh2_1.8.2.bb b/meta/recipes-support/libssh2/libssh2_1.8.2.bb
deleted file mode 100644
index fe853cde4f..0000000000
--- a/meta/recipes-support/libssh2/libssh2_1.8.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "A client-side C library implementing the SSH2 protocol"
-HOMEPAGE = "http://www.libssh2.org/"
-SECTION = "libs"
-
-DEPENDS = "zlib"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
-
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "616efd99af3d9ef731a26bed6cee9593"
-SRC_URI[sha256sum] = "088307d9f6b6c4b8c13f34602e8ff65d21c2dc4d55284dfe15d502c4ee190d67"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "\
-                 --with-libz \
-                 --with-libz-prefix=${STAGING_LIBDIR} \
-                "
-
-# only one of openssl and gcrypt could be set
-PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
-PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
new file mode 100644
index 0000000000..0b8ccbd217
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -0,0 +1,53 @@
+SUMMARY = "A client-side C library implementing the SSH2 protocol"
+HOMEPAGE = "http://www.libssh2.org/"
+SECTION = "libs"
+
+DEPENDS = "zlib"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
+
+SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+           file://CVE-2019-17498.patch \
+           file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
+           file://run-ptest \
+"
+
+SRC_URI_append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
+
+SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
+SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
+
+inherit autotools pkgconfig ptest
+
+EXTRA_OECONF += "\
+                 --with-libz \
+                 --with-libz-prefix=${STAGING_LIBDIR} \
+                "
+
+# only one of openssl and gcrypt could be set
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_LIBDIR}, , openssl"
+PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# required for ptest on documentation
+RDEPENDS_${PN}-ptest = "man-db openssh"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
+
+do_compile_ptest() {
+	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
+	oe_runmake check
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
+	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
+	mkdir -p ${D}${PTEST_PATH}/docs
+	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
+}
-- 
2.27.0

