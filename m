Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 580E26072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:10 +0000 (UTC)
Received: by qkas77 with SMTP id s77so27966085qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4Emxrp0folBlCdzshK/b/YN0uDCuLXe3R6xTqbRd9HU=;
	b=ePQgl8RSmSm5k3i9ZCfXf9mgC2AsHcyLIDI/nFMQEZC6iWGqYPTpp1QTWG1IhsezgV
	N5Wd6yxyNlkhTaMkbtllxuIdZGCN6TewiFILIB7TSeRvelb/hTw5aCG35vzaCvUUCb+C
	uMRZNfOZBfK4yvKutWncKlGsEOvZb8kge7FYD6fOmNwj8BzUi4Ng/n5gIV1HyYowj5E/
	GXPmoyfpZk1SvbRuipvursGEyq64niji1Ieg9oznSymP/Qheo5nHZcXQxWakqtGPb5gd
	upVxVlhNoHoJXWA8K5UMrYgMcolly33LueoxMwycpO1f8eBsf/+9RrpTG6BwZIxTK7ud
	emuw==
X-Received: by 10.55.42.27 with SMTP id q27mr8276317qkh.33.1447953071222;
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:58 +0000
Message-Id: <735a92e628a555f74641b4acfc64c41a1314d1a8.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 11/13] openssl: Add musl configuration support
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:10 -0000

use termios instead of termio

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openssl/openssl/configure-musl-target.patch    | 27 ++++++++++++++++++++++
 .../openssl/openssl/linux-musl-libc-termios.patch  | 19 +++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  2 ++
 3 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/linux-musl-libc-termios.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
new file mode 100644
index 0000000..613dc7b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
@@ -0,0 +1,27 @@
+Add musl triplet support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openssl-1.0.2a/Configure
+===================================================================
+--- openssl-1.0.2a.orig/Configure
++++ openssl-1.0.2a/Configure
+@@ -431,7 +431,7 @@ my %table=(
+ #
+ #       ./Configure linux-armv4 -march=armv6 -D__ARM_MAX_ARCH__=8
+ #
+-"linux-armv4",	"gcc: -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-armv4", "gcc: -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-aarch64","gcc: -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${aarch64_asm}:linux64:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ # Configure script adds minimally required -march for assembly support,
+ # if no -march was specified at command line. mips32 and mips64 below
+@@ -504,6 +504,8 @@ my %table=(
+ "linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-musleabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-musleabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ 
+ "linux-avr32","$ENV{'CC'}:-O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/linux-musl-libc-termios.patch b/meta/recipes-connectivity/openssl/openssl/linux-musl-libc-termios.patch
new file mode 100644
index 0000000..ee37c1a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/linux-musl-libc-termios.patch
@@ -0,0 +1,19 @@
+http://git.alpinelinux.org/cgit/aports/tree/main/openssl/0003-use-termios.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openssl-1.0.2a/crypto/ui/ui_openssl.c
+===================================================================
+--- openssl-1.0.2a.orig/crypto/ui/ui_openssl.c
++++ openssl-1.0.2a/crypto/ui/ui_openssl.c
+@@ -218,6 +218,9 @@
+ 
+ #endif
+ 
++#define TERMIOS
++#undef TERMIO
++
+ #ifdef TERMIOS
+ # include <termios.h>
+ # define TTY_STRUCT             struct termios
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd56841..a7ef083 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -37,6 +37,8 @@ SRC_URI += "file://configure-targets.patch \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
+            file://configure-musl-target.patch \
+            file://linux-musl-libc-termios.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.6.3


