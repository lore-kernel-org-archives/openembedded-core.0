Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1611EC001DB
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:36:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.137399.1692113765910455561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZMRdApXT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31965c94001so3111623f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692113764; x=1692718564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=ZMRdApXTapz1LG/9h/kgGjs2mcTyvwfps0+kPSMbGvX/reiPTPqqwleIB4h1P+RtQz
         HxYo4EvBsVRAlVw3E/GkwXkYRDvlZNK44CPaNwtTpWU1ITqTnbFMp04OECGq0FM2GHQR
         7jUrw0WGz+gSmy0GDvaCArdhzQDAtxXHiEbJvY9BuG3TD0R3eVwV0r3D2G2llCxyVWEk
         MM57HtRPhmRxwvPJXLC8XrEuR7AZmirIsXf77NE5O6BuSZP8Yg2P6GyAmbD6spE2CUyA
         Z/Z1P7Epu4NlBnC89Yf0JoA1bKl8zJGBnkoB0rDQgX3ebQgFDmR2YnpEkJFvW8g5GYyA
         fJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692113764; x=1692718564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=McvlUwgwnfIEFf7gexT+3Cz6vEgYP3RN088rt9qW7fnzK3pdzPCfqGNEC74qC+gUhY
         O6ZRRnALht0HNOFyDmCz4jQUqy7077AZIOOY8XK50Av997wpnCqLAQJ0Y1ABsVtvQWS9
         wGnorQ/RVhr4f14OxIc29kyUE6fzTSqNNpue3Mv+7jrZbo0cg0OIBZteGSs+Xd5+oG4M
         GVO1ntGuLmfUw34Jcp/hVrXrJ0Hd4Og/V94rZmzjCoM/GP357ZZ9gt/INMVVj0C3yNRI
         diN5DwlahNZzCnKZmVMdGUWVKqqY4DQ+UfJEhKWZOhYuYuXEQJcN4JOp1K+vHdlby2QG
         vgdg==
X-Gm-Message-State: AOJu0YxxKyTI/w03qw9Axp/ILM1Bnz0r2lfJf691m1WKNF42Npdqm6yo
	OKD2IHVwiIuQHiXKqr1Jcn5eBRGIpUU=
X-Google-Smtp-Source: AGHT+IGnG5AHRLKqVvc6AX8mcW6+5RabjpxklGJ+e6qECdkBgDLrc7KBO0LUkJVLkoyE6IB3sxx4mQ==
X-Received: by 2002:adf:e706:0:b0:319:6d3c:c5e5 with SMTP id c6-20020adfe706000000b003196d3cc5e5mr6829172wrm.58.1692113764138;
        Tue, 15 Aug 2023 08:36:04 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:fa4d:a159:cb9e:8fc4])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b0031984b370f2sm3046241wrs.47.2023.08.15.08.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:36:03 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
Date: Tue, 15 Aug 2023 17:35:35 +0200
Message-Id: <fde568774cf2bd9174d1ecb4d9378a362a254f29.1692099121.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692099121.git.frederic.martinsons@gmail.com>
References: <cover.1692099121.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186074

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This class can be used inside rust recipe to generate
a rust library that can be called by C/C++ code.

The rust recipe which uses this class has to only replace
"inherit cargo" by "inherit cargo-c".

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes-recipe/cargo_c.bbclass

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/cargo_c.bbclass
new file mode 100644
index 0000000000..c083f69c08
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
+        --prefix /usr \
+        --library-type cdylib
+}
+
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1


