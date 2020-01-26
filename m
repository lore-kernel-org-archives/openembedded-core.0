Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 331827FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:49 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a6so2103277pjh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=LS35oScYhi2Bh1EPySxO6ECjHwfyi6WmZrFfcw5wjtMeBsudEs8tMJYTw8sZr/e2Xl
	IXKaML6bsLWpmydaQ12nyHGOsgfQMaTWT0FHEL10q0hKXpX0if/h5szdJCRIC5qvxp10
	kpw60k8lPmEoGfh6wBm4Ztqw4k9PN0bf4fSpDZbpX8ZxAd/jkKcjy5JhFtY9dkWf232W
	qfCPjsH4ZzGiXVwGlIMCLJrbuigNj19NLMRzb7qQO50QR462lNjWm40c4k8E0iJAWMMi
	+bLWeOEdkpf5nQH8hTIrR7Lf0Qm5XJA3AVwT/484dCilRHeWGaPezyVtWQMm+CmtrvFR
	xUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=oDN3xlKN2hJ9USI+ZPvH8tyHYCYUIezqOMm1RYQJRJsXzvBL7zNjlUV4YhDRpPqxC/
	hzdHqVFNHAzJZG9Qv/UcwdGJgFHGjRo7rA0Tz6nrOVjppRV9NA/gnuAO6muveJpVwlig
	p5fTqKInzhAVU749AzmYwjTiezBh0ojQQFdR+yn//KvP2QUw8bTgiVi47dpBdaEbl+n5
	BvIRzrZHf6od8TK2SjR6hqIDb1Q76NvhUgj/e/6uLK6dizbggwkntiinmtyn2b21urgW
	9lyoaWTSkVW70YJO3ejysXynvnQpCl+EfY5Q4aw3PrE6xW15qZzcYipETrnwzm4QtVu7
	wJ7g==
X-Gm-Message-State: APjAAAWyNaYjhWDl73n+itJ1h553RgKimPGen6Uu4F/IfAaYrHlsILnK
	mpuxwfLvUriwOusMd4TPvxvR8YZHV9U=
X-Google-Smtp-Source: APXvYqwoZY6m/xSWXrDJE+NDKUwzgAgpGPRDtI7+7Cy7yvUs+o9gceMjRuOcxZUGrhObry1uu4NnDw==
X-Received: by 2002:a17:902:444:: with SMTP id
	62mr13042094ple.209.1580066869987; 
	Sun, 26 Jan 2020 11:27:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:39 -0800
Message-Id: <2cf7cfb39ed4762159d593b71e7c233cf8f90c27.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:49 -0000
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


