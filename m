Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66D7A7FA1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 20so13834081wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SryW1a59cDvUQnrm4RXslsRJ8+cVb6Mdq/yUyJp/Si0=;
	b=pOucbhfYQGtmkV4kaMGgX/g/1m3zyFnFTEagUvXe8TykE12W/U+2LO2a82/hg8c3k8
	3+lbaqrRlgYVxof8DBmhmKQqz5O5pGYxAMbz2gwLK6qu0R1ogtyCbYvL2/7FZxNT7O7Q
	nUmC+ADuImXqAayntSwuF2VU/9o3PxvLQcwn4H6GKqUjgbhgz18EeHsuUI0v1bzDtQab
	uDsrIN2jf0gMRSWv2N5JWM/ujaB3bB1C+lzS2Wk3H4WdTwZ/UfeWKpadYl0HzWYQos0g
	zKR3PDKm5Cn+zmbooA678EcLp9N3+aw84AM8mQUoHTmIdovdRTvsaK+L3+UgLQ1V4nOq
	zBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SryW1a59cDvUQnrm4RXslsRJ8+cVb6Mdq/yUyJp/Si0=;
	b=n0jz3FSkMheSerjAT2iOqz7Wh9Qah9oOsQXw1AOVTvhjKwCO6DbqFVC9os2Osu9AFU
	mOsVQ1wjC9sFdKY6DN5CqBQD/tZa7j+ZJpwsI+OqILYtZLrun0FDyv5r/Oc5QFVFlEHW
	KGThOr74onv3PBvGlv83yONLJbbgVKT1scx867R81s47+XmJrgD7GRGIPn4ZSrY3ptKk
	5IFo+Fb3YoVImr9aM9FWAv7UTY4pz8YfAMlWufi6gPDxaC8KSwaqsRuKMMuG3PQvGXGd
	vdMWmRpe/o81ly21UnBmN6dvCoEUI95aA9iq3J9XvUju4+WZkuek5cb4//+3YMODV8lh
	z9BA==
X-Gm-Message-State: APjAAAVZGNEz7wzGDP1GQT+LOe2CWioZoIrVgbsHvp3c+qP35ESh5MT/
	xF04E9Fcau/9LPQvxyszoRW0xA7u
X-Google-Smtp-Source: APXvYqyEhKaEeLn+Di0OlMcXnCQjNav8kgCewVGYBWm91k31nCOWZOvI2uvT3FZ1TaRXwCwdQKnqOQ==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
	r4mr26334315wmg.140.1579010414638; 
	Tue, 14 Jan 2020 06:00:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:50 +0100
Message-Id: <20200114140007.36622-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/20] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:14 -0000

Drop a backport, and a patch that causes build errors with
the new version.

Add a patch to make ARM HW crypto optional; upstream for some
reason does not allow disabling it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ppc64-inline-assembler-for-clang-r-j.patch | 35 ------------------
 ...figure-option-to-disable-ARM-HW-cryp.patch | 35 ++++++++++++++++++
 .../nss/nss/nss-fix-nsinstall-build.patch     | 36 -------------------
 .../nss/{nss_3.45.bb => nss_3.49.1.bb}        | 12 ++++---
 4 files changed, 43 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
 create mode 100644 meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
 delete mode 100644 meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
 rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.49.1.bb} (94%)

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
deleted file mode 100644
index 181c69adb04..00000000000
--- a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix nss multilib build on openSUSE 11.x 32bit
-
-While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
-fail with error:
-
-* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
-
-It caused by the '-m64' option which passed to host gcc.
-
-The nsinstall was built first while nss starting to build, it only runs
-on host to install built files, it doesn't need any cross-compling or
-multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
-error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-===================================================
-Index: nss-3.24/nss/coreconf/nsinstall/Makefile
-===================================================================
---- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
-+++ nss-3.24/nss/coreconf/nsinstall/Makefile
-@@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
- 
- include $(DEPTH)/coreconf/config.mk
- 
-+# nsinstall is unfit for cross-compiling/multilib-build since it was
-+# always run on local host to install built files. This change intends
-+# to clean the '-m64' from ARCHFLAG and LDFLAGS.
-+ARCHFLAG =
-+LDFLAGS =
-+CFLAGS =
-+
- ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
- PROGRAM		=
- else
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.49.1.bb
similarity index 94%
rename from meta/recipes-support/nss/nss_3.45.bb
rename to meta/recipes-support/nss/nss_3.49.1.bb
index c8005a5b3a5..b27080f5aef 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.49.1.bb
@@ -25,17 +25,16 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
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
+           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "f1752d7223ee9d910d551e57264bafa8"
-SRC_URI[sha256sum] = "112f05223d1fde902c170966bfc6f011b24a838be16969b110ecf2bb7bc24e8b"
+SRC_URI[md5sum] = "6b92ac02dcf9e9e44df5390f6814c157"
+SRC_URI[sha256sum] = "d9aa42e49e02bb0dc0a2f164604cfc718e11a2a06ddb266cd676376ac21b026e"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -47,6 +46,9 @@ TDS = "${S}/tentative-dist-staging"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+# Needed on Centos 7, as nss auto-detection fails there due to non-standard uname output
+CFLAGS_append_class-native = " -DLINUX -Dlinux"
+
 do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
 }
@@ -81,6 +83,8 @@ do_compile() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
+    ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_HW_CRYPTO=1", "", d)}
+
     export OS_RELEASE=3.4
     export OS_TARGET=Linux
     export OS_ARCH=Linux
-- 
2.17.1


