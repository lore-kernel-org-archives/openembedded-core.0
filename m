Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48170C77B7C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 22:08:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.108958.1682978878591046709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 15:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=CpgYZEo/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f19ab99540so28840775e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682978877; x=1685570877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVQgG4FE8AjjIznF0RtBNeSPNeK+hqYslClxGJs9Bfg=;
        b=CpgYZEo/8R3OcjhgvHROM+rbVyeST86GiATIigk/ujTnHw+y31Lg+jdTw9wNdAX5Bc
         3LcJyOD2thkAZc9Lezx/X9l8YAsGmwJ36gzdt47IjtEDMb11d7uwJtNjOFs5kS8ih70B
         imijFPvvFoyryLv3r97ZG/vJZGjmogKy0mMZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682978877; x=1685570877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVQgG4FE8AjjIznF0RtBNeSPNeK+hqYslClxGJs9Bfg=;
        b=BgeJcmdQJvDQnGCQGrLxexl4MeH4jOW/NXGTt7mIL0NQaVHwZMxKEsn4zJK2Z+EYAX
         Uy0w1DzuHYhvJBRDa78l0ULwlBTkAB6tnI4+pIyLSuAKroGTbg9YsAXAmLPhxCbodaTz
         5cjE20GJk0jGCbxEZytHWvKZIJnSQ1e9cL1jkc8WVJ7cWeom6/t8zxP4Qih67LU5aC16
         KefaHSE7lUHZWwWmYe3h8osj0kTfYNvD7cMDUzG9oaPkzPigJEjmDQe7T1O5E7Iydz2w
         L8BRO9uoIVdjM7e/Kg2seiVfu1zwN+kbpNaoC6zH9Vd6rwbiL0fP7ZlXX/SsRlVbRKKh
         35YQ==
X-Gm-Message-State: AC+VfDxnrZetd2MP0dJeXHOdjUGNw9reLtIY2wPh+kyJhfGZ8G/a019q
	r2bfbNLzdSF8H6ZwdhlwtefZIM5Gmk6RXrJdXbE=
X-Google-Smtp-Source: ACHHUZ7nQXA8ewL13o3/WX9PhU39QF+pfVR0/wCC7PNlbvMPEQ75sAXRO9evoaYy6UB92nmRQrSOPg==
X-Received: by 2002:a7b:c5da:0:b0:3f1:72d4:b271 with SMTP id n26-20020a7bc5da000000b003f172d4b271mr12057049wmk.3.1682978876524;
        Mon, 01 May 2023 15:07:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9417:e142:e786:9868])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b003f339b2d06fsm5077648wmi.4.2023.05.01.15.07.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:07:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] binutils: Drop crosssdk suffix from virtual provides to improve dependency handling
Date: Mon,  1 May 2023 23:07:54 +0100
Message-Id: <20230501220755.2781191-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 22:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180711

There is little point in having "crosssdk" suffex added to the virtual provider within
binutils since the TARGET_PREFIX or SDK_PREFIX already encapsulates this. Remove it
allowing some of the special case overriding to be removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/staging.bbclass                           | 4 ++--
 meta/conf/distro/include/tcmode-default.inc                   | 2 +-
 meta/lib/oe/classextend.py                                    | 2 ++
 meta/recipes-core/glibc/glibc.inc                             | 4 +---
 .../binutils/binutils-cross-testsuite_2.40.bb                 | 2 +-
 meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb      | 2 --
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc              | 2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc                    | 2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc              | 2 +-
 meta/recipes-devtools/go/go-crosssdk.inc                      | 2 +-
 10 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index a058d344fde..6eefba4d733 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -125,8 +125,8 @@ do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
 do_populate_sysroot[vardepsexclude] += "BB_MULTI_PROVIDER_ALLOWED"
 
 POPULATESYSROOTDEPS = ""
-POPULATESYSROOTDEPS:class-target = "virtual/${MLPREFIX}${HOST_PREFIX}binutils:do_populate_sysroot"
-POPULATESYSROOTDEPS:class-nativesdk = "virtual/${HOST_PREFIX}binutils-crosssdk:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-target = "virtual/${HOST_PREFIX}binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-nativesdk = "virtual/${HOST_PREFIX}binutils:do_populate_sysroot"
 do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 
 SSTATETASKS += "do_populate_sysroot"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f9e88ca4269..7c6399da458 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?= "binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils ?= "binutils-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 2013b29711b..8d7e428d8a9 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -32,6 +32,8 @@ class ClassExtender(object):
         if name.endswith("-" + self.extname):
             name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):
+            if "binutils" in name:
+                return name
             subs = name.split("/", 1)[1]
             if not subs.startswith(self.extname):
                 return "virtual/" + self.extname + "-" + subs
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 3b940b8ab29..b08a70aa46a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,9 +1,7 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils${BUSUFFIX} libgcc-initial linux-libc-headers"
-BUSUFFIX= ""
-BUSUFFIX:class-nativesdk = "-crosssdk"
+DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
index ca99e911302..4385343df67 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
@@ -18,7 +18,7 @@ do_configure() {
 }
 
 # target depends
-DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils"
 DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}gcc"
 DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs"
 DEPENDS += "virtual/${MLPREFIX}libc"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb
index 5bd036fd467..6752659304e 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb
@@ -4,8 +4,6 @@ inherit crosssdk
 
 PN = "binutils-crosssdk-${SDK_SYS}"
 
-PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
-
 SRC_URI += "file://0001-binutils-crosssdk-Generate-relocatable-SDKs.patch"
 
 do_configure:prepend () {
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index c36e4cba810..ebeee9f3512 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index bd2e71d63f1..4e99c220a45 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -8,5 +8,5 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 
 GCCMULTILIB = "--disable-multilib"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 8e926e81e16..6bdfeae5a6f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -7,7 +7,7 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 766938670a3..7413acb7b39 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,6 +1,6 @@
 inherit crosssdk
 
-DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
+DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils"
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
-- 
2.39.2


