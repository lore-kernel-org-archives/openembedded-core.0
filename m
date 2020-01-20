Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 603807FCAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b19so128254wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fVzmlQzbsHbgi5rKxuAd0WEEbzelb++kwjghgOEYlXM=;
	b=pQ67zxyCea3/IHvVvQla80MYl6J6PAHdXuFIhNBEd65xTA9YuM8KJHD1m4sm8bKQQZ
	xZ3yekpQWtDLot1SrZmpgGa6QcBX9CY2o+dTfY1QqcFeL1A6Pf2ylKbz/GSLp0OduqdB
	iPmWVESqgzN+QE+uspYdD/pWwQ+pO00EsIioB3c+eDBnfYnLLqEfN+NonQwQQ79nQa9B
	4JpwpuWZ0UnGQfmvNSPijEdiuOu2VEhlHNAiyfdeZapbeY83szERc/t1JTHEF+VhM/BG
	hWAeeiPdhaIRMsqrxIhSfxBj/WmB0BNdl193KFaMncYNkTSYwZnIwHVE0WQodQiTTTDl
	E4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fVzmlQzbsHbgi5rKxuAd0WEEbzelb++kwjghgOEYlXM=;
	b=bYbNyR9yUFwZG8936SiqPZdqbyRFkXS+qtWBmDlk6UxHg2TwLViW+2GLDk1K6wzhr9
	reHHr4XGZPrNs2d23P0MRmRstImuQ1tVoNOnelXNCF39f7BG+c17+A49bf1ZsxRBwMpS
	4X5ZjT8vIqZVDj7ooApibo9lhdiEuASO1CzKBego3iazAva36S1Ttz/LOTsXdACwSzNF
	vPHeu9MMSU3dwH99JqIad2aBUIYCYcqaW0syO0CVhEecwqPZGPECzFLg1Nrkt/X5zdPO
	FPu8uoFeN2JnquJP3MWBURWuNCCqrhGnbWmheqmtU/Y21ZL8QZmkHmcl1qmn2500mAB3
	dr2w==
X-Gm-Message-State: APjAAAXmDOG/sCFqYxQlIP5FMwnCf7KlmFXuybg7QytARIsG4oh2v/Rd
	i6wzYtPDZqLwAC9G8vwSuvZgZmav
X-Google-Smtp-Source: APXvYqxiq0idKyPujmmb34kSOALWTHhn8y0z33VEyoHQ1hM6tUsaMKltpva+6UXDb9XMOe3MsM5STA==
X-Received: by 2002:a1c:730b:: with SMTP id d11mr11063wmb.30.1579541126868;
	Mon, 20 Jan 2020 09:25:26 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:51 +0100
Message-Id: <20200120172510.22648-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:27 -0000

Drop a backport, and a patch that causes build errors with
the new version.

Add a patch to make ARM HW crypto optional; upstream for some
reason does not allow disabling it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ppc64-inline-assembler-for-clang-r-j.patch | 35 -------------------
 ...figure-option-to-disable-ARM-HW-cryp.patch | 35 +++++++++++++++++++
 .../nss/nss/nss-fix-nsinstall-build.patch     |  2 +-
 .../nss/{nss_3.45.bb => nss_3.49.1.bb}        | 13 ++++---
 4 files changed, 44 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
 create mode 100644 meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
 rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.49.1.bb} (95%)

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
deleted file mode 100644
index 59e44e68418..00000000000
--- a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6b351dbb049b3b3ab6c0d51aa3c1c7fb3c9df80c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
-Date: Mon, 22 Jul 2019 11:07:41 -0700
-Subject: [PATCH] Bug 1493916 - Fix ppc64 inline assembler for clang r=jcj
- Seems clang's inline assembler doesn't want registers to be prefixed with
- "r", while gcc accepts both - r0 and 0 for GPR0.
-
-tested with clang 6.0 and gcc 8.1
-
---HG--
-extra : amend_source : 87e09bb59c78bdb25b9573b9f29511e10b9db6fa
-extra : histedit_source : 9b3fad70ac2851bf7de14d42c34db4a5fba41710
-
-Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/671d89b6c4a6f41707bb044534751098e2e3f211]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nss/lib/freebl/mpi/mpcpucache.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/mpi/mpcpucache.c b/nss/lib/freebl/mpi/mpcpucache.c
-index 336b4cc..2ad291f 100644
---- a/nss/lib/freebl/mpi/mpcpucache.c
-+++ b/nss/lib/freebl/mpi/mpcpucache.c
-@@ -727,7 +727,7 @@ static inline void
- dcbzl(char *array)
- {
-     register char *a asm("r2") = array;
--    __asm__ __volatile__("dcbzl %0,r0"
-+    __asm__ __volatile__("dcbzl %0,0"
-                          : "=r"(a)
-                          : "0"(a));
- }
--- 
-2.24.0
-
diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
new file mode 100644
index 00000000000..fe29d198820
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -0,0 +1,35 @@
+From 5595e9651aca39af945931c73eb524a0f8bd130d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 18 Dec 2019 12:29:50 +0100
+Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
+
+Not all current hardware supports it, particularly anything
+prior to armv8 does not.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ nss/lib/freebl/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 06506f0..a8b015d 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -125,6 +125,8 @@ else
+         DEFINES += -DNSS_X86
+ endif
+ endif
++
++ifdef NSS_USE_ARM_HW_CRYPTO
+ ifeq ($(CPU_ARCH),aarch64)
+     DEFINES += -DUSE_HW_AES
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
+@@ -145,6 +147,7 @@ ifeq ($(CPU_ARCH),arm)
+         endif
+     endif
+ endif
++endif
+ 
+ ifeq ($(OS_TARGET),OSF1)
+     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
diff --git a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
index 181c69adb04..43c09d13eaf 100644
--- a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -29,7 +29,7 @@ Index: nss-3.24/nss/coreconf/nsinstall/Makefile
 +# to clean the '-m64' from ARCHFLAG and LDFLAGS.
 +ARCHFLAG =
 +LDFLAGS =
-+CFLAGS =
++# CFLAGS =
 +
  ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
  PROGRAM		=
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.49.1.bb
similarity index 95%
rename from meta/recipes-support/nss/nss_3.45.bb
rename to meta/recipes-support/nss/nss_3.49.1.bb
index c8005a5b3a5..94f4b88fa53 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.49.1.bb
@@ -25,17 +25,17 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
            file://nss-fix-incorrect-shebang-of-perl.patch \
-           file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch \
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
+           file://nss-fix-nsinstall-build.patch \
+           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "f1752d7223ee9d910d551e57264bafa8"
-SRC_URI[sha256sum] = "112f05223d1fde902c170966bfc6f011b24a838be16969b110ecf2bb7bc24e8b"
+SRC_URI[md5sum] = "6b92ac02dcf9e9e44df5390f6814c157"
+SRC_URI[sha256sum] = "d9aa42e49e02bb0dc0a2f164604cfc718e11a2a06ddb266cd676376ac21b026e"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -69,7 +69,8 @@ do_compile_prepend_class-native() {
 do_compile() {
     export CROSS_COMPILE=1
     export NATIVE_CC="${BUILD_CC}"
-    export NATIVE_FLAGS="${BUILD_CFLAGS}"
+    # Additional defines needed on Centos 7
+    export NATIVE_FLAGS="${BUILD_CFLAGS} -DLINUX -Dlinux"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
@@ -81,6 +82,8 @@ do_compile() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
+    ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_HW_CRYPTO=1", "", d)}
+
     export OS_RELEASE=3.4
     export OS_TARGET=Linux
     export OS_ARCH=Linux
-- 
2.17.1


