Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.134342.1598016497100242387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 06:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Eb4D4R89;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f18so1268287wmc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YeHn6+f+4KTOyUynnzQwzH8+pBnWydj08SMNEeewr5U=;
        b=Eb4D4R89JN04jVKMfj7KPZQNA3QZP5Jh6sGsBTOz27rGEKMgi+Ms32I6YvVWthw0Zt
         voNeuon2qcIiP3yglhDDY875dFRTZLJIF65yxtYHpCmdoFh/sqS5pwvKGHurM7upwWcz
         d0eFAf1+ExSJbBln8nVdugRx6Zg3DNS4/JhuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YeHn6+f+4KTOyUynnzQwzH8+pBnWydj08SMNEeewr5U=;
        b=EftR/9tekGePkSyY3ILTJGLgBUi2PmSj9tmqmDj/en5/yuaKVn9+b/jErQJGswLwIa
         TzYrpbWRXqxGyXnxMPOINIMQpPm0Mh+qsqhEyUMibpQrtdtpYZKI0rHpvw1RRaFR56fu
         X60yX7fodYnrjpRFqBmKEHHOQfkGoqTRPdvmXpyaqOZNirWz+Gz+KhSvfll5pkVUdRYE
         V5iegKhaKncOv4U70HNimPvF7q/7ZCKokAMr9WCgWfR+rBXEgWNTi/q/L5jtQXgMSUFc
         uEsHHU+ktjsTTBUB/ucd1cV/wonO0IhNLlzvHcKDLpW4QjW3xXvhS1aqcQj6e6ER7AHI
         rXGA==
X-Gm-Message-State: AOAM533Pcg7bfmr78GobxxtOwT8aeh7EAtHVSXGbhPRwazun9HyCdCjS
	RL5nsFJbbcE9KM7j62WFM7KFqH62LTRTPRQl
X-Google-Smtp-Source: ABdhPJwnKl/MOf9n78mbLBI1f9+qVILg7WglwpwirLdLp61IDRXQYKCjLYI/B0d+OnrqRdoHM4ubEg==
X-Received: by 2002:a1c:9952:: with SMTP id b79mr3898336wme.68.1598016495030;
        Fri, 21 Aug 2020 06:28:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id i11sm643261wmi.5.2020.08.21.06.28.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 06:28:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nativesdk-sdk-provides-dummy: Add /bin/sh
Date: Fri, 21 Aug 2020 14:28:13 +0100
Message-Id: <20200821132813.1274123-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By doing this we can revert b18c32ab6bc9c4f1953e9f79aa39bc92d1c4e30d which
was a pretty ugly hack anyway and now means the different providers are all
being handled consistently.

Anyone with SDK recipes will need to ensure nativesdk-sdk-provides-dummy
is included in those builds (or an equivalent). This is a good thing to
do anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass                       | 2 +-
 meta/recipes-core/meta/buildtools-tarball.bb           | 1 +
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 2 +-
 meta/recipes-core/meta/testexport-tarball.bb           | 2 +-
 meta/recipes-core/meta/uninative-tarball.bb            | 1 +
 5 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 519c22be472..53b4700cddb 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -557,7 +557,7 @@ python write_specfile () {
 
     print_deps(srcrrecommends, "Recommends", spec_preamble_top, d)
     print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
-    print_deps(srcrprovides + (" /bin/sh" if srcname.startswith("nativesdk-") else ""), "Provides", spec_preamble_top, d)
+    print_deps(srcrprovides, "Provides", spec_preamble_top, d)
     print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
     print_deps(srcrconflicts, "Conflicts", spec_preamble_top, d)
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 3785941c2cf..75b71f55327 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "\
+    nativesdk-sdk-provides-dummy \
     nativesdk-python3-core \
     nativesdk-python3-modules \
     nativesdk-python3-misc \
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 29f4dd36339..1d71f373a4e 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -4,8 +4,8 @@ DUMMYPROVIDES_PACKAGES = "\
     pkgconfig \
 "
 
-# Add /bin/sh?
 DUMMYPROVIDES = "\
+    /bin/sh \
     /bin/bash \
     /usr/bin/env \
     libGL.so()(64bit) \
diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index c38ac902a06..daedd78cb44 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -8,7 +8,7 @@ TEST_EXPORT_SDK_PACKAGES ??= ""
 
 TOOLCHAIN_TARGET_TASK ?= ""
 
-TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES}"
+TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES} nativesdk-sdk-provides-dummy"
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 39638eb8c55..c4a6c96b4dc 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -18,6 +18,7 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-libxcrypt \
     nativesdk-libxcrypt-compat \
     nativesdk-libnss-nis \
+    nativesdk-sdk-provides-dummy \
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.25.1

