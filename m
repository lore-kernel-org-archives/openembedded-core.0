Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AC0C77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 22:08:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.108959.1682978879163975367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 15:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=GD1a6wJ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f196e8e2c6so29633525e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682978877; x=1685570877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVdHyqgnrNq8NrsZoFHTyRK+LjhYv9/Od99In+/SGAA=;
        b=GD1a6wJ/lnd70KkTWYpzSNwXy1BByLxPsC+uMToXFsIsQYmPi8Mo1lJs/mYx9YB4At
         nHtSvfvBf9W6MobsAsN4JbAa/yyri6ZaJnVqmHCVwXEizF2TjBzOixF5RPkKIW0N2A1n
         GhhBTp5Pwu9JWvN+juOLu3FGbZzCTM/zJL344=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682978877; x=1685570877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVdHyqgnrNq8NrsZoFHTyRK+LjhYv9/Od99In+/SGAA=;
        b=bGohypgQLVRGesS57CKbbNJKv4DZM3SmpsWW0Ab0hwoYj3+N1ekI9Q8uMqxz1KWYru
         3LeN3/UoSaXj3j+Qm2t0hyUbljeixU4bKjFzRZFmNyA0NA+tZwpiq5A/nb+ydB8s608/
         zWwg5rW+MrQAfHRLoT64wMl3837FBk/J+x9LQ9VZVuPHYQPXLLxPFD3H+bDvqPewbV7Z
         wokoBg8C683e66HBGiW+u7VHpJgqDJqrcNl682TDWMQdOlHLZJVp9PMEy0c+qcIPeQn7
         tZn1b9E5e9EkzuNte2kDf2O3RKgEz55PgQSo2c53a1DhOJyTtLNvKAgUBoeH5t+Oba7V
         drLA==
X-Gm-Message-State: AC+VfDyTgpoqoU5feQKK9S2Red5LOV6YI7MCyjx+TjSq81o9VauoG/hy
	9x3Lj0tv0+iE5QbqWsDjnhBmsTPylko7zaYaQAU=
X-Google-Smtp-Source: ACHHUZ7b6my+O9EVNhPCGqoVgYOgG69zhPDJxJQ6Fvx9HooSRu/p5NErrVoCHr8CDGCy5uqJw4dF1Q==
X-Received: by 2002:a7b:c414:0:b0:3f0:3a57:f01e with SMTP id k20-20020a7bc414000000b003f03a57f01emr10167882wmi.4.1682978877189;
        Mon, 01 May 2023 15:07:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9417:e142:e786:9868])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b003f339b2d06fsm5077648wmi.4.2023.05.01.15.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:07:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gcc/go: Drop crosssdk suffix from virtual provides to improve dependency handling
Date: Mon,  1 May 2023 23:07:55 +0100
Message-Id: <20230501220755.2781191-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501220755.2781191-1-richard.purdie@linuxfoundation.org>
References: <20230501220755.2781191-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 22:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180712

There is little point in having "crosssdk" suffex added to the virtual provider within
gcc/go since the TARGET_PREFIX or SDK_PREFIX already encapsulates this. Remove it
allowing some of the special case overriding to be removed.

This also allows removal of some of the MLPREFIX usage since again, the triplet
also covers this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/go.bbclass                             | 2 +-
 meta/lib/oe/classextend.py                                 | 7 +++----
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 +-
 .../binutils/binutils-cross-testsuite_2.40.bb              | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc                   | 3 +--
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc           | 2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc                 | 2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc           | 2 +-
 meta/recipes-devtools/go/go-cross-canadian.inc             | 4 ++--
 meta/recipes-devtools/go/go-crosssdk.inc                   | 4 ++--
 meta/recipes-devtools/go/go-runtime.inc                    | 2 +-
 meta/recipes-devtools/go/go-target.inc                     | 2 +-
 meta/recipes-devtools/rust/rust-cross-canadian.inc         | 2 +-
 13 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 6b9748406d8..b02a83a5610 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -37,7 +37,7 @@ GOMIPS:mips:class-target[export] = "1"
 
 DEPENDS_GOLANG:class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG:class-native = "go-native"
-DEPENDS_GOLANG:class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
+DEPENDS_GOLANG:class-nativesdk = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
 
 DEPENDS:append = " ${DEPENDS_GOLANG}"
 
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 8d7e428d8a9..5161d33d2d2 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -32,7 +32,8 @@ class ClassExtender(object):
         if name.endswith("-" + self.extname):
             name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):
-            if "binutils" in name:
+            # Assume large numbers of dashes means a triplet is present and we don't need to convert
+            if name.count("-") >= 3 and name.endswith(("-go", "-binutils", "-gcc", "-g++")):
                 return name
             subs = name.split("/", 1)[1]
             if not subs.startswith(self.extname):
@@ -152,9 +153,7 @@ class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
         if dep.startswith(self.extname):
             return dep
-        if dep.endswith(("-gcc", "-g++")):
-            return dep + "-crosssdk"
-        elif dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):
+        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):
             return dep
         else:
             return self.extend_name(dep)
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 12e7d77d8d8..62ebb3f5bc4 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -4,7 +4,7 @@ SUMMARY = "GNU binary utilities (cross-canadian for ${TARGET_ARCH} target)"
 PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
-DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
+DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --enable-poison-system-directories \
                 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
index 4385343df67..14480785b4d 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.40.bb
@@ -19,7 +19,7 @@ do_configure() {
 
 # target depends
 DEPENDS += "virtual/${TARGET_PREFIX}binutils"
-DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}gcc"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc"
 DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs"
 DEPENDS += "virtual/${MLPREFIX}libc"
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index d3b36937bf4..5ac82b1b577 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -11,8 +11,7 @@ CVE_PRODUCT = "gcc"
 inherit autotools gettext texinfo
 
 BPN = "gcc"
-COMPILERDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}gcc:do_gcc_stash_builddir"
-COMPILERDEP:class-nativesdk = "virtual/${TARGET_PREFIX}gcc-crosssdk:do_gcc_stash_builddir"
+COMPILERDEP = "virtual/${TARGET_PREFIX}gcc:do_gcc_stash_builddir"
 
 python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ebeee9f3512..ec87b462193 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 4e99c220a45..bd65b1fed20 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -9,4 +9,4 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 GCCMULTILIB = "--disable-multilib"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 6bdfeae5a6f..81dc572be0d 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -7,7 +7,7 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
+           virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 5a80ceffa38..45758f33615 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -1,7 +1,7 @@
 inherit cross-canadian
 
-DEPENDS = "go-native virtual/${HOST_PREFIX}go-crosssdk virtual/nativesdk-${HOST_PREFIX}go-runtime \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc \
+DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go-runtime \
+           virtual/${HOST_PREFIX}gcc virtual/nativesdk-libc \
            virtual/nativesdk-${HOST_PREFIX}compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 7413acb7b39..12939005c06 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,8 +1,8 @@
 inherit crosssdk
 
-DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils"
+DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils"
 PN = "go-crosssdk-${SDK_SYS}"
-PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
+PROVIDES = "virtual/${TARGET_PREFIX}go"
 
 export GOCACHE = "${B}/.cache"
 
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 02601f79925..3f1e795dd9e 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -1,5 +1,5 @@
 DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
-DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
+DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
 DEBUG_PREFIX_MAP = "\
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index ed09cfe8061..a4b55ad3d89 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,5 +1,5 @@
 DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
-DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
+DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go go-native"
 
 DEBUG_PREFIX_MAP = "\
                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8d0dc6a4e26..d569ac59f52 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
-DEPENDS += "virtual/${SDK_PREFIX}gcc-crosssdk virtual/nativesdk-libc virtual/nativesdk-${SDK_PREFIX}compilerlibs"
+DEPENDS += "virtual/${SDK_PREFIX}gcc virtual/nativesdk-libc virtual/nativesdk-${SDK_PREFIX}compilerlibs"
 
 SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-- 
2.39.2


