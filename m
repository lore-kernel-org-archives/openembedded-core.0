Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DE5D33A28
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.28084.1730832353350766130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pszsnyxk;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso4424827a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832352; x=1731437152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbF+xcNQXofFd0whDS0A0m489IPKgOQ+H3AXb4Qolgw=;
        b=Pszsnyxksfb1jtssUKmxalyxP1qkWwz+wPMuZa21O0/upmu7BvdKnijBWxu9CoLGgA
         ZJfGK7mQ6davyRmCzjoJNoHdQb3Lu03tRgV6ZtiXqZLzyOOJKMT/1ekR8Q2Ch9OZiD9R
         5Ux5PPCF1zvCeyXNNjJrZvLZfGBAzmQajx5bZ7Jvs+ziL/9/4YEFkth2s1A+kvr2eRVB
         HuQ11zEUdLmZejlMuPhousv2s+OL1wFHEXf3VVMLcTWwJ4cky3neZvj2uiHF7f0pO3N+
         2+QTrLE+HP/uyPafEVxNDypvYNn3zPQwhzrOiCWM8zsnjKUzrbBoel+3CZTjXm1W3Btk
         CBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832352; x=1731437152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbF+xcNQXofFd0whDS0A0m489IPKgOQ+H3AXb4Qolgw=;
        b=nGiSVUm3f46DlPuPK2GWX5K7I2NtG4ikGQ6STfciONM+klH3IO9YdTvEKxNTIs/BW9
         OAOenltCHwPjYP3koOQlu8FUhgzCnRwqVmD41i2fQfv2wXVPzPyheUuYINqOl2aldP1O
         i0FAOVafNYsdojW49SnTeUbOSnROJoA+O6DNOmJenHja4GxjLG+2ExYlhYb47Dr2hb3w
         Gs9HhmbFjklOtnnfW8LxtpuwbJBvQ3G5amNj3vNwZZfA7T6iLLg35vURvtvSXG4dvK+6
         rfM1/Jq6lZkrqek5+ie8qeSno9WVg2TNqBRgPKpvAf3J74hV74ZCHXuD8OIq+GQWJpiY
         9ppQ==
X-Gm-Message-State: AOJu0YxvhgMoLpXZeo7w7aEMqgwm7M0b4fYOW3vzAYPpqMar7JL77kQ6
	2ZeKOBeeeMIHx7vg8wlZTmq1bv1kLhSTXtrlu+0gTjIe+Q9YpxdxjbZlIg==
X-Google-Smtp-Source: AGHT+IFuTymRN1agndj3oJtlbqFHr60ONyRi4KImyy0b1o6paAhv5X3eYDF+VvLjLY8lhHpWycaIeA==
X-Received: by 2002:a17:90b:33cf:b0:2e0:f896:9d6d with SMTP id 98e67ed59e1d1-2e94c2b6c6cmr24209338a91.16.1730832352577;
        Tue, 05 Nov 2024 10:45:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 10/19] spirv-llvm-translator: Add recipe
Date: Tue,  5 Nov 2024 10:45:29 -0800
Message-ID: <20241105184540.3450302-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206738

Bring it from meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../spirv-llvm-translator_git.bb              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator_git.bb

diff --git a/meta/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator_git.bb b/meta/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator_git.bb
new file mode 100644
index 00000000000..204d472dac1
--- /dev/null
+++ b/meta/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A tool and a library for bi-directional translation between SPIR-V and LLVM IR"
+HOMEPAGE = "https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
+
+BRANCH = "llvm_release_190"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${BRANCH} \
+           git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=git/SPIRV-Headers;name=headers;branch=main \
+          "
+
+PV = "19.1.0+git"
+SRCREV = "d65c25a166531b2efb744358ad1dc5283e1cc72f"
+SRCREV_headers = "efb6b4099ddb8fa60f62956dee592c4b94ec6a49"
+
+SRCREV_FORMAT = "default_headers"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "spirv-tools clang"
+
+inherit cmake pkgconfig python3native
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+# for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
+EXTRA_OECMAKE = "\
+        -DBUILD_SHARED_LIBS=OFF \
+        -DCMAKE_BUILD_TYPE=Release \
+        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+        -DCMAKE_SKIP_RPATH=ON \
+        -DLLVM_EXTERNAL_LIT=lit \
+        -DLLVM_INCLUDE_TESTS=ON \
+        -Wno-dev \
+        -DCCACHE_ALLOWED=FALSE \
+        -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/SPIRV-Headers \
+"
+
+BBCLASSEXTEND = "native nativesdk"

