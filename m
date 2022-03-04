Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB66C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 04:46:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.3818.1646369199805357818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 20:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pq4Zw6Bz;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id q11so6714835pln.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 20:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYGJqAN+ZWyPkQJssoq/Jg/R88XQXYI0MvjHvCMHcLI=;
        b=Pq4Zw6BzfTWD5DrxCSr1hLcG/mraDBb5iCv4BpWRXnlb0Ijwrsf2AYdT4MhH4VJ/LM
         07tWmIChnnFDjrYOO1YTDE7UjKOGY85Iux5a/NjHLhw4+GtlMlKjI9GP4nYY8Ca39Ui8
         NYdO5RSGI6aWTiu/Zo94bqYvzkuYW1m0MHYJS8YXm1A6GZfOK/wh9P81SBBtxJV5Xcnw
         17akPHHYycExDwAGnczTfmpCWniiRKE/mvsTds0nCyDNYac4Br+Hv+xP8iUWqRkQGJw0
         TygfkNXL5lqVizxsIqMb+rKYE3nB8kc3mOiFBfRQvw5yJI6v30T2TQCxgip7n5sWyxXW
         93gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYGJqAN+ZWyPkQJssoq/Jg/R88XQXYI0MvjHvCMHcLI=;
        b=NgQHP8JsS5zRVV9QEc24gM6uW8zWsFT7egslrFMKa87QAMc3jIDFggbEb4uYyUZp3o
         JKeeDdOMWW5wYKsgL1+L8OhVzV2kr1zFrptyuX3I8X7jeWSqWgFiwuE9P4nW6QWlviAo
         gL2Kv08O/FfKcRjVRUUzKRfNK6KNIerrBYD/+M6edMDu1iUGxYdJIKlJ8YZ1Mkh3DlII
         1K55888IYm71T4mFtqxlvk9K2pt/Mp39o7r5dYT13karxatLUe8SxQOLMzPxQ1ZLOQdO
         4ARW+Py0CWQ2LFQpQrfEj7ySas37koAjWvnadO85Y1gQ6r4+UPSvlhU/j2MeFGAW1dpq
         VTAg==
X-Gm-Message-State: AOAM530Y3phC7UQvRuwFEPUOXLxOTxY9q8J4ozumGLXdGiIC3qvPV1io
	LQdtJE4Uo5IxHW/GIcjPZieOlwEGUQBLRQ==
X-Google-Smtp-Source: 
 ABdhPJwfjvypBcSZOzcBmzFLlINRZqviurlebKVAp7en3TC7XD0OL4WSkBREPRPVEJJ8pZcEUVqFJQ==
X-Received: by 2002:a17:90b:38ce:b0:1bf:a34:5bad with SMTP id
 nn14-20020a17090b38ce00b001bf0a345badmr8091418pjb.129.1646369198753;
        Thu, 03 Mar 2022 20:46:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm4358837pfh.143.2022.03.03.20.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 20:46:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libical: Do not set CC explicitly for gir compiler
Date: Thu,  3 Mar 2022 20:46:35 -0800
Message-Id: <20220304044635.1625747-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 04:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162707

This ensures that right sysroot is used during build, otherwise we see
warnings in build about using wrong sysroot and it fails explicitly with
clang

x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86_6
4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for cross-compilation

x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/libc
lang_rt.builtins-x86_64.a: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Do-not-export-CC-into-gir-compiler.patch | 33 +++++++++++++++++++
 .../recipes-support/libical/libical_3.0.14.bb |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
new file mode 100644
index 00000000000..3841c060eeb
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -0,0 +1,33 @@
+From c06d8a8990c996cbb854508a944202ba70ba7a7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Mar 2022 20:10:04 -0800
+Subject: [PATCH] cmake: Do not export CC into gir compiler
+
+this helps cross compilers where full compiler commandline defines the
+compiler rather than just CC variable, therefore let it use the default
+values from environment and not synthesize it from CMAKE_C_COMPILER just
+for this case.
+
+Upstream-Status: Submitted [https://github.com/libical/libical/pull/552]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/modules/GObjectIntrospectionMacros.cmake | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/cmake/modules/GObjectIntrospectionMacros.cmake b/cmake/modules/GObjectIntrospectionMacros.cmake
+index 83aff931..d7d3f898 100644
+--- a/cmake/modules/GObjectIntrospectionMacros.cmake
++++ b/cmake/modules/GObjectIntrospectionMacros.cmake
+@@ -50,8 +50,7 @@ macro(gir_add_introspections introspections_girs)
+     set(_gir_libtool "--no-libtool")
+ 
+     add_custom_command(
+-      COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'"
+-              ${GObjectIntrospection_SCANNER}
++      COMMAND ${GObjectIntrospection_SCANNER}
+               ${GObjectIntrospection_SCANNER_ARGS}
+               --namespace=${_gir_namespace}
+               --nsversion=${_gir_version}
+-- 
+2.35.1
+
diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
index 717eb11e125..58baf3f32f7 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     "
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+           file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
+          "
 SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
-- 
2.35.1


