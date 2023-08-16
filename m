Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824C8C001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:33:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.157837.1692182025380105499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 03:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DazafLmS;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31972944f30so2811042f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692182023; x=1692786823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=DazafLmSKX9G4YFarp/q0EaMPAIq6B4VSyQUG6wnpGPYGKO1ITHQY8e7+jfGsRZ3F7
         K3cKfeoeNoN8j3wSGArn+WtR/vdb30oWipu17Aes6DhJW8HAqYk/uBKJ8aZoIqi0e/cO
         PnQ0UqFOZys3cYlHA2nY+GRZRk3b76s1S2MkAI6LflEZG4bBY9XApwp1uG0H35bgIBel
         Pdpw74EiLSHkX1A5j3HXRpz4wbs+o9ytHakEuq7evSGF8fbcf2qlP1p6lhfwMVJhWaz8
         eMwSWBqkxErKXXxEXb7FN/TB7sb0WwNOwas7JLCP8obv6/kRUh423JoP7fKNmeab08WZ
         3OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182023; x=1692786823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=RMlFfMEhgZQxnyOtA1zahr/7yUVb5gliRqbBdP6m0wDCA4wAvsBaznUkpIaAaWa08i
         TT1etf3Go2rcGFuyG6OntcwNawRkTAxegJGV3M4lFHnLnzGaNn2YXZJCi7dIo7Y1hfMy
         nhhTWbgqO7gnsd8G6sGIsgG8ieonJD6Pl2WNfFu1nBh8JipvvneyQwm/uXZzryphSmCP
         5YFmUzFcXOWT7dW0mpRZ99V8VhmDoduyA0cJekHGHIs9ZAwLruP7CGC0CEGrTmQlsXuH
         Ec11kCY2vAhiywPaEQ3GKs5gWl2XmBnUjiGcTYrByt2D+OE6nCEj9y8z/0Q9JJEnZYDz
         vepg==
X-Gm-Message-State: AOJu0YwTZoC/jBJjkVf7PbZztHQK53s9ipe5eZ7tbl3PzLUo97O77KVU
	LW/Kr0y57vTHKxIVdsaw1UV3SOTVsbU=
X-Google-Smtp-Source: AGHT+IEtfgSn9Xx5RJLjQ+hGuh5pj1aGKUlbX76GY6FXHT0Eh5jdMxWvjkpIDWhQ1sNb0iM+RDwGzQ==
X-Received: by 2002:adf:de06:0:b0:315:8f4f:81b2 with SMTP id b6-20020adfde06000000b003158f4f81b2mr1062395wrm.64.1692182023571;
        Wed, 16 Aug 2023 03:33:43 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm20889582wrz.27.2023.08.16.03.33.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:33:43 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V5 2/4] classes-recipe: add cargo_c.bbclass
Date: Wed, 16 Aug 2023 12:33:31 +0200
Message-Id: <a16c71354e3c2aef86028659453970bc09256ae5.1692181166.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692181166.git.frederic.martinsons@gmail.com>
References: <cover.1692181166.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186126

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


