Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A9CD33A3A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.28094.1730832358479910312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkE3wlOV;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbcd71012so67185495ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832358; x=1731437158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLC++yM0KemcbNPsRQUxlf4rKIqEGLQVKJAVLtZ/sOU=;
        b=bkE3wlOVnoTKtgCPJ5V/NxLKWa3sBIDSSUO/uh9aoa/krx1EJfoDazp104jKfSSMcU
         tZgaguVHI3gHA6bCMhhlbMCiS6tM3G9ZTx8R+ghTBPgVjAsVDGjqgesVfKFW5a0f1X9K
         7H0Eqx36UFmECNDGTFHPi/f5Kt9f85tImngXjX/NlYX+R/tKj5aUxAk3l4rFJ6k9y0/o
         +NsJvx3zQNinw6NKpnV0j2/UdZ4F1+ISZRTyVaGG/a5D5n8zfAGi81yB2dEIwVTgoHPF
         Yb6MM5Gcc9Y+K5jFnWO8ET8Mw0Q4QNK/hv84rOafMNap7vXo/w4cGnTY7ViZQ9sfhACq
         TrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832358; x=1731437158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLC++yM0KemcbNPsRQUxlf4rKIqEGLQVKJAVLtZ/sOU=;
        b=ViA3KTCCEpJKCFzbDsvW0iXGX0YEvfp/Autna3n1pL2WekkEUYMQE7f2bo0UgjbaT9
         chl26ez10hTybH9zpikz8DHkiTm4/MG5m2n7JPW4pFFYXcFnQXsGZIUmERqbFyaRKQdD
         kynNxey6UfqhJ4UUuF4Gjfh7Rhyj9pRy7vbnOA35QOpwYp+CX9BvZpv/p18NM97tbEEm
         S3dxy2XAJDRA3ZaREu0140VblO0ONy4ezknOyfwjWHbk4sJ8hklnhueRBXeAjIrOvuJP
         CRIq8KVm9KEgqHnjQ4myirHDJBV/ZX/fLqftYDmf9WUwwvlHY3lCO05GpMf040S6tbqq
         PqMA==
X-Gm-Message-State: AOJu0YwsoUFNW35l4uUs7HHY2ZgPQdxii5TsdY3WO14NCpmBW2VY0PWB
	5J+NgfhgpNRY5efx7K3vYAekFQFX5aWvv74OeJZydL2y8B7IVQVLXrhZQw==
X-Google-Smtp-Source: AGHT+IFLL43I0hcZYPSbCLWeozEp0Of8GtavTkhzLRrD7ZYCSaat4NSbHIYJ9/jY2HoqbSTqFfmsGQ==
X-Received: by 2002:a17:90b:1649:b0:2cb:5aaf:c12e with SMTP id 98e67ed59e1d1-2e94c53a75emr25465360a91.37.1730832357636;
        Tue, 05 Nov 2024 10:45:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 16/19] sdks: Add clang toolchain to SDKs
Date: Tue,  5 Nov 2024 10:45:35 -0800
Message-ID: <20241105184540.3450302-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206744

Use SDK_TOOLCHAINS_LANGS to tether clang toolchain into SDKs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 documentation/ref-manual/variables.rst         |  2 +-
 meta/classes-recipe/populate_sdk_base.bbclass  |  2 ++
 .../packagegroup-clang-cross-canadian.bb       | 18 ++++++++++++++++++
 .../packagegroup-clang-sdk-target.bb           | 15 +++++++++++++++
 .../packagegroup-core-buildessential.bb        |  5 +++++
 .../packagegroups/packagegroup-core-sdk.bb     |  1 +
 6 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07ed143ac56..77dbe2814cb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7715,7 +7715,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_TOOLCHAIN_LANGS`
       Specifies programming languages to support in the SDK, as a
-      space-separated list. Currently supported items are ``rust`` and ``go``.
+      space-separated list. Currently supported items are ``clang``, ``rust`` and ``go``.
 
    :term:`SDK_UPDATE_URL`
       An optional URL for an update server for the extensible SDK. If set,
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 031c65f05f3..68a772c3bd2 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -64,12 +64,14 @@ SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
     packagegroup-cross-canadian-${MACHINE} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'clang', 'packagegroup-clang-cross-canadian-${MACHINE}', '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
 "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= " \
     ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'clang', multilib_pkg_extend(d, 'packagegroup-clang-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
     target-sdk-provides-dummy \
diff --git a/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
new file mode 100644
index 00000000000..2a6303cc824
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Host SDK package for Clang cross canadian toolchain"
+PN = "packagegroup-clang-cross-canadian-${MACHINE}"
+
+inherit cross-canadian packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
+CLANG="clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+RDEPENDS:${PN} = " \
+    ${@all_multilib_tune_values(d, 'CLANG')} \
+    nativesdk-binutils \
+    nativesdk-clang \
+    nativesdk-glibc-dev \
+    nativesdk-libgcc-dev \
+    nativesdk-compiler-rt-dev \
+    nativesdk-libcxx-dev \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb
new file mode 100644
index 00000000000..2b30642427c
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb
@@ -0,0 +1,15 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Target packages for the Clang SDK"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+    clang \
+    libcxx \
+    compiler-rt \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 2cd67ad05f8..d140f1f54af 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -29,3 +29,8 @@ RDEPENDS:packagegroup-core-buildessential = "\
     pkgconfig \
     "
 
+RDEPENDS:packagegroup-core-buildessential:append:toolchain-clang = "\
+    clang \
+    libcxx \
+    compiler-rt \
+    "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 84e1a41d9a0..c2385a97b44 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -30,6 +30,7 @@ RDEPENDS:packagegroup-core-sdk = "\
     tcl \
     ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
     ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'clang', 'packagegroup-clang-sdk-target', '', d)} \
 "
 
 SANITIZERS = "libasan-dev libubsan-dev"

