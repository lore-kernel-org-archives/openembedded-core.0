Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 5942571A88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 08:08:53 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id E2FA71C155B;
	Wed,  7 Nov 2018 09:08:54 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed,  7 Nov 2018 09:08:50 +0100
Message-Id: <20181107080850.2489-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] openssl-1.1.1: remove build path from version info
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
X-List-Received-Date: Wed, 07 Nov 2018 08:08:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The openssl build system generates buildinf.h containing the full
compiler command line used to compile objects. This breaks
reproducibility, as the compile command is baked into libcrypto, where
it is used when running `openssl version -f`.

Add stripped build variables for the compiler and cflags lines, and use
those when generating buildinfo.h.

This is based on a similar patch for older openssl versions:
https://patchwork.openembedded.org/patch/147229/

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 ...sysroot-and-debug-prefix-map-from-co.patch | 70 +++++++++++++++++++
 .../openssl/openssl_1.1.1.bb                  |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
new file mode 100644
index 0000000000..80b62ab18c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -0,0 +1,70 @@
+From 3e1d00481093e10775eaf69d619c45b32a4aa7dc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Tue, 6 Nov 2018 14:50:47 +0100
+Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
+ info
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The openssl build system generates buildinf.h containing the full
+compiler command line used to compile objects. This breaks
+reproducibility, as the compile command is baked into libcrypto, where
+it is used when running `openssl version -f`.
+
+Add stripped build variables for the compiler and cflags lines, and use
+those when generating buildinfo.h.
+
+This is based on a similar patch for older openssl versions:
+https://patchwork.openembedded.org/patch/147229/
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+---
+ Configurations/unix-Makefile.tmpl | 10 +++++++++-
+ crypto/build.info                 |  2 +-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 16af4d2087..54c162784c 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -317,13 +317,21 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+                          '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
+ BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
+ 
+-# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
++# *_Q variables are used for one thing only: to build up buildinf.h
+ CPPFLAGS_Q={- $cppflags1 =~ s|([\\"])|\\$1|g;
+               $cppflags2 =~ s|([\\"])|\\$1|g;
+               $lib_cppflags =~ s|([\\"])|\\$1|g;
+               join(' ', $lib_cppflags || (), $cppflags2 || (),
+                         $cppflags1 || ()) -}
+ 
++CFLAGS_Q={- for (@{$config{CFLAGS}}) {
++              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
++            }
++            join(' ', @{$config{CFLAGS}}) -}
++
++CC_Q={- $config{CC} =~ s|--sysroot=[^ ]+|--sysroot=recipe-sysroot|g;
++        join(' ', $config{CC}) -}
++
+ PERLASM_SCHEME= {- $target{perlasm_scheme} -}
+ 
+ # For x86 assembler: Set PROCESSOR to 386 if you want to support
+diff --git a/crypto/build.info b/crypto/build.info
+index b515b7318e..8c9cee2a09 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
+@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+         ppccpuid.pl pariscid.pl alphacpuid.pl arm64cpuid.pl armv4cpuid.pl
+ 
+ DEPEND[cversion.o]=buildinf.h
+-GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
++GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC_Q) $(CFLAGS_Q) $(CPPFLAGS_Q)" "$(PLATFORM)"
+ DEPEND[buildinf.h]=../configdata.pm
+ 
+ GENERATE[uplink-x86.s]=../ms/uplink-x86.pl $(PERLASM_SCHEME)
+-- 
+2.19.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index af9038abd5..93750c3afb 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
+           file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.19.1


