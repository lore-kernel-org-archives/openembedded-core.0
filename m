Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E88B87FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:10:05 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a33so3061952pgm.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=eGGHqbqpxdb8Zc7umNS8phOzrj6NFo0rsP02V3baXHLwdbJ5RG7jZGeqYwq3aGc1A3
	W04DZMTLd4UlmXJ3LdEnApTcN8ybfsHGlNODZtvfyDux0hI4jOXixBxjduEyEbH2vms1
	p3ldT3MEk0gi3BZq99YBmnEpDvahnWTET89cw9pczICl0yo8qCyY8r4b2T4kqIYSrBrP
	/UfS8nN7hEW1djHVpzolaUma57c4AS1EgstmLM2eJZvWiLYZyUn9E+CqBfFsSA5AKlXO
	tl9y29wl6G2zXSC76RSHxYyipbpAxIROxtcuOIs8ua+pDqcLwIzpnYMthAOW4yU86/Vk
	zbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=P2056AnynK3CmnDl/gtqPdE+3bOnRK/9RE7wQ9rBRvcIoVG3sMhGAcWkLM+xRnnwsu
	vcxQnaQJz6k/vOffHf9wWxh8VWOK/YMm+IzxdAONFgUXNqmle/KNAp98TUYQQvNkiWCJ
	jOIm0MQnEkKmTHLpd/T8Rxmd05q8Ejj4OVRfpIO0GyWjvCCHUaz8ixYN9pjFoMr/b6p1
	DGqtJdQBgrIav35UgnHv1/UUk6zqAfnp17Z/cRAC/vXfvYh82cCjGVLQ+Wx7KOZTHAiX
	PABRV76NalcZK0jl9TI6MFriav/ahJ5gry83XT3LMzJRXc5T2M8s15J2x0XTyqYA3WAf
	wiWA==
X-Gm-Message-State: APjAAAWI1iNXHDMUK/Ulde5eOgN7Tb2nf5ms92PI6veulmkRUW/F4g+/
	tqY6/YwYpqRA4p2/5mQy+a9PSdI9uSc=
X-Google-Smtp-Source: APXvYqwbFR7VUVFYdAHNDkXWGVm1CKWQC1mtOQLSigdN1qxFXoVlh8ARSvRM8kw4J2jDfWKIaIFJqw==
X-Received: by 2002:a63:34c2:: with SMTP id b185mr9079524pga.298.1579680606563;
	Wed, 22 Jan 2020 00:10:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	j17sm45025758pfa.28.2020.01.22.00.10.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 00:10:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 00:10:02 -0800
Message-Id: <20200122081002.694601-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
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
X-List-Received-Date: Wed, 22 Jan 2020 08:10:06 -0000
Content-Transfer-Encoding: 8bit

Use NSS_USE_ARM_HW_CRYPTO to detect USE_ARM_GCM, since there are
dependent, without this we control the crypto code function inclusion in
build but do not control the call sites, which can result in undefined
symbols e.g.

Linux_SINGLE_SHLIB/gcm.o: in function `gcmHash_InitContext':
/usr/src/debug/nss/3.49.1-r0/nss-3.49.1/nss/lib/freebl/gcm.c:112: undefined reference to `gcm_HashInit_hw'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure-option-to-disable-ARM-HW-cryp.patch | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index fe29d19882..803c06b218 100644
--- a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -12,20 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  nss/lib/freebl/Makefile | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 06506f0..a8b015d 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -125,6 +125,8 @@ else
+@@ -125,6 +125,9 @@ else
          DEFINES += -DNSS_X86
  endif
  endif
 +
 +ifdef NSS_USE_ARM_HW_CRYPTO
++    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
      DEFINES += -DUSE_HW_AES
      EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
-@@ -145,6 +147,7 @@ ifeq ($(CPU_ARCH),arm)
+@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
          endif
      endif
  endif
@@ -33,3 +32,21 @@ index 06506f0..a8b015d 100644
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -17,6 +17,7 @@
+ 
+ #include <limits.h>
+ 
++#ifdef NSS_USE_ARM_HW_CRYPTO
+ /* old gcc doesn't support some poly64x2_t intrinsic */
+ #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
+     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+@@ -28,6 +29,7 @@
+  * that compiler uses -mfpu=neon only. */
+ #define USE_ARM_GCM
+ #endif
++#endif
+ 
+ /* Forward declarations */
+ SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
-- 
2.25.0


