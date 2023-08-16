Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6C2C04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:42:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.154707.1692164540714456818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZMq3sUCH;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so55682345e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 22:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692164539; x=1692769339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=ZMq3sUCHq2oqrlbGrY/Jr0JBEvLFOU1JtGxinaFgYIS+M4YVwq3rFKbQ0wC9uA092R
         PtO26vMFKIfJEg2zoUJ7S8GJGBCZz0e9cgg7025QRZaBm0EGLpCL1Wg+DzvwgZE/uFJB
         wx7TBYrZi5hxW1J6PGR0qF9Ajp3YzxT2dHSU4EZdR3QWm/dtE/KZw8vIWb0KIqJoRKDm
         y6HLMNpBxF74DX/cYypzD24jvkCecxdKyEJLinLiYFJV8dW6FHlcrwgamOMy85dvb4mX
         oJEnGMaJKqMXNGgd3PKyjWUWhB7yFJ5U0dr/Eq8lCZY9WK9b5xYcgWTfvUuZka/yZaXf
         mccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164539; x=1692769339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=EZu+w/Y8Ryj6LICnMcrD0JDss+q+VIFf3KALdUuw5AioR5J0tCWK80Po5OOOOZ361d
         Ph+0MpYeWgq07GESjkLm8OIKA6l2ltk5Rda2RZKFWnttLNRY4XHJ36WEkSuAuxI8Gwtw
         xAd85xj1+NzIKsqKuuPflb4pkBmB3QMtnEpIfxQVSADfAFQ+vysnPizIEH4SWOtjVVgo
         BNAUdvNwSfs2XFQYAgciLGQpmo4lx776Uw+7mTQauKmRttsYLb+nVmnaz0Wpoh4vSiMA
         nbywgJe9edOSQWRGGy41sB6qVXDmrSnN8r0fq2JE6qmMaWhPJnID6+kQNDwXebhGn49G
         JFYQ==
X-Gm-Message-State: AOJu0YwQirKdRS398webGBm3i8XqNvscTpH3HrUlOtd0XqZmuaqWtJsF
	JsEoo9sa8ElP0j0E+YrWC38ireZWkwc=
X-Google-Smtp-Source: AGHT+IHdGAeEjZioGY756wc/BBD+sLQFkFJSDXk37Q8GJJSehYSgFyQlTaP3aFzrGX3hlDibx3bTjA==
X-Received: by 2002:a1c:7c0f:0:b0:3fe:ba7:f1ef with SMTP id x15-20020a1c7c0f000000b003fe0ba7f1efmr518670wmc.30.1692164538861;
        Tue, 15 Aug 2023 22:42:18 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id h18-20020a1ccc12000000b003fbd9e390e1sm23053371wmb.47.2023.08.15.22.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 22:42:18 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V4 2/4] classes-recipe: add cargo_c.bbclass
Date: Wed, 16 Aug 2023 07:42:00 +0200
Message-Id: <d587b4c4d7f52f358bf8352cddd75020bfee784b.1692164369.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692164369.git.frederic.martinsons@gmail.com>
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186111

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This class can be used inside rust recipe to generate
a rust library that can be called by C/C++ code.

The rust recipe which uses this class has to only replace
"inherit cargo" by "inherit cargo_c".

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes-recipe/cargo_c.bbclass

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/cargo_c.bbclass
new file mode 100644
index 0000000000..ef431634a2
--- /dev/null
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -0,0 +1,41 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+##
+## Purpose:
+## This class is used by any recipes that want to compile a C ABI compatible
+## library with header and pkg config file
+
+inherit cargo pkgconfig
+
+# the binaries we will use
+CARGO_C_BUILD = "cargo-cbuild"
+CARGO_C_INSTALL = "cargo-cinstall"
+
+# We need cargo-c to compile for the target
+BASEDEPENDS:append = " cargo-c-native"
+
+do_compile[progress] = "outof:\s+(\d+)/(\d+)"
+cargo_c_do_compile() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "Using rust targets from ${RUST_TARGET_PATH}"
+    bbnote "cargo-cbuild = $(which ${CARGO_C_BUILD})"
+    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
+    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
+}
+
+cargo_c_do_install() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "cargo-cinstall = $(which ${CARGO_C_INSTALL})"
+    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
+        --destdir ${D} \
+        --prefix ${prefix} \
+        --library-type cdylib
+}
+
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1


