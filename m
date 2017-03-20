Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23234779E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:47:43 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b5so20939263pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y7sUbiccK9gtm7BqvQ+6wDfxqGXg6s9K+bQDfwNpMQg=;
	b=TKECPvBm+sTgcaQ85z0UgLk39Oi6MrUESoPNfsTzk554KtO4oZELsqFDy70wIcVU0R
	NqiM9LF/ZzAvQ9X5LwEH9QmeiLokcZhFQhQNvI8RXMoDvXrkee2Nl6/lKJ+Hp4BjatwK
	vWD9mw7ihGZob8hzH9lCZxGiiAEdyAD1sfapxElWFDBlkWGytmlc1wC7MuZq2lmwvsNr
	lAcXcdCTuVMi3jGO/PLIwt172NOFLyaw061BooDNC5ujN7mCmJNzZ8aZ8LYRjWaOKrDf
	9Xgb8a2IIamSa45KkIf7l9mRhpOD+ji1pWWYaDcB2iTzwH6cL65BqEd63UaqFYZTE4VG
	Mr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y7sUbiccK9gtm7BqvQ+6wDfxqGXg6s9K+bQDfwNpMQg=;
	b=iOCXBKU57PDCyReuzhoD9nqzhFzxhXRLIm7mE52/jMFPMUz2lsn3GmJTy585zTyJy3
	4deK/AcTowodiKztRg4jz4UTutjNBYkbZV5sMmZU01ULyaJGLzSmyRKIQHVUd4lTQnCu
	ofjwBggCv2fmVW99RMJ/hjooVkRF2xTnlP57R20NMUp9oP7wzfOE7UxXoExkMLwTvAvp
	J6NvaTev0DYw0ik8UMgJ/h+iKlnSWLq1kZ8GHrprT5Lu/yuxGgzEY8je6/m3qLlgYPKZ
	8ThcBMpbLMd2IPowu8V07ccaKs5y2vjguK2HP5OdxcIvW87rMdyt2EDxTXVNP1Vr7XSN
	L+EQ==
X-Gm-Message-State: AFeK/H1Tp+xLsg5AkgrFuTsOgWOeyE26VXST9w3wNP9/YUnw+kQpsxvRj1RESpIhJFDeVA==
X-Received: by 10.84.194.195 with SMTP id h61mr19159069pld.56.1490028464740;
	Mon, 20 Mar 2017 09:47:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k2sm34536513pga.29.2017.03.20.09.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 09:47:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 09:47:33 -0700
Message-Id: <4fc23dd9c0d1dc198d2dec0a8277e2b96f014c32.1490028304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490028304.git.raj.khem@gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] openssl: Fix build with clang
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
X-List-Received-Date: Mon, 20 Mar 2017 16:47:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...build-with-clang-using-external-assembler.patch | 49 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2k.bb |  5 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
new file mode 100644
index 0000000000..47b83a5896
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
@@ -0,0 +1,49 @@
+From 2f6026cb8b16cf00726e3c5625c023f196680f07 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 17 Mar 2017 12:52:08 -0700
+Subject: [PATCH] Fix build with clang using external assembler
+
+Cherry-picked from
+https://github.com/openssl/openssl/commit/11208dcfb9105e8afa37233185decefd45e89e17
+https://github.com/openssl/openssl/commit/fbab8baddef8d3346ae40ff068871e2ddaf10270
+https://github.com/openssl/openssl/commit/6cf412c473d8145562b76219ce3da73b201b3255
+
+Fixes
+
+| ghash-armv4.S: Assembler messages:
+| ghash-armv4.S:81: Error: bad instruction `ldrbpl r12,[r2,r3]'
+| ghash-armv4.S:91: Error: bad instruction `ldrbpl r8,[r0,r3]'
+| ghash-armv4.S:137: Error: bad instruction `ldrbne r12,[r2,#15]'
+| ghash-armv4.S:224: Error: bad instruction `ldrbpl r12,[r0,r3]'
+| clang-4.0: error: assembler command failed with exit code 1 (use -v to see invocation)
+| make[2]: *** [<builtin>: ghash-armv4.o] Error 1
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crypto/modes/asm/ghash-armv4.pl | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/crypto/modes/asm/ghash-armv4.pl b/crypto/modes/asm/ghash-armv4.pl
+index 8ccc963ef..442fed4da 100644
+--- a/crypto/modes/asm/ghash-armv4.pl
++++ b/crypto/modes/asm/ghash-armv4.pl
+@@ -124,7 +124,14 @@ $code=<<___;
+ #include "arm_arch.h"
+ 
+ .text
++#if defined(__thumb2__) || defined(__clang__)
++.syntax	unified
++#endif
++#if defined(__thumb2__)
++.thumb
++#else
+ .code	32
++#endif
+ 
+ #ifdef __clang__
+ #define ldrplb	ldrbpl
+-- 
+2.12.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
index 922819b3d5..1c1041428c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
@@ -37,12 +37,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
             file://openssl-1.0.2a-x32-asm.patch \
-            file://ptest_makefile_deps.patch  \
+            file://ptest_makefile_deps.patch \
             file://configure-musl-target.patch \
             file://parallel.patch \
             file://openssl-util-perlpath.pl-cwd.patch \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
-           "
+            file://0001-Fix-build-with-clang-using-external-assembler.patch \
+            "
 SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
 SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
 
-- 
2.12.0


