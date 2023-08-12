Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9E6C04A6A
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 14:50:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.66757.1691851806381367089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 07:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MPcqUIgZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so2432927f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691851804; x=1692456604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=MPcqUIgZS7ow9wSLhWxkcnE9jcc4xFecwp7yvSkAoZrfw4HxhbS3NGu2LKa06qtmnD
         hzS956d09hJ8khYQvKTSWrJXMTGTXuBTFrPNcV9yeEbkJGBGXucaRc/SOnAd2J918wR7
         /lzREsovoP3dgigcYUCKCBwxfHoY4w+5fNxgjidlc9tXLNhcjOWJbSxT7E5iR0n5bJt7
         jxElhKL5f+YwpnaC3M+SZgO9OeXV+uP8on7miHtu1KIulthjUL+hO6kPXOorZfYbO3jP
         IUYX/dHySayUNCHdDjci+dSUlKlH2Vpq/rQJQ2Y/Dt+MDuls446h08ryeQepA+katoMw
         nRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691851804; x=1692456604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=ONLztru98MTF0LlO3qQb66iggQvHcIE4tpd0NdShRapPntgbcPLjiN7/hsVHP+rFRi
         1lrn61lOjdKeQ37Z7WV/u6HBmz3D9uL0FlKoRDhmOkpFKcAhZiftR5oOc7xlkg0xgwqJ
         bqkE23aFmPCi2aNq7YokSqPHhIediQx4drrTtiAKoIg2PS++DQSO6rDJwiy3a7Q/YcrM
         1NwRPQeUnA0KP5KHeH1V37KpqkEHPaIMRxsrFbVkZa54FQubOFHG2A9CMgVP1MUtMLuH
         hrEUJVA9z5neHAj2vlfUjrSpgLmxeJKkRTnj/Uf+mSFZ7SOXnxwdpqCOYWBcRmBgM9JL
         2WUQ==
X-Gm-Message-State: AOJu0YxfE7jRk9BLrIYcIvCZXFfNutr5bctaKQQk+pdNTkEjAR5f/ZEW
	S8Pm1hZctfI37+CHejsCwNXjpfDdgKQ=
X-Google-Smtp-Source: AGHT+IE1bCUjeryErZNWWVZRoiRgsDCy9lV7gllKaix40TvZZP1YWrO+guJ/TUJhvc7yfG06JCR9fQ==
X-Received: by 2002:a5d:5347:0:b0:317:5eb8:b1c4 with SMTP id t7-20020a5d5347000000b003175eb8b1c4mr3531306wrv.2.1691851804618;
        Sat, 12 Aug 2023 07:50:04 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:d87f:1a4a:4f88:2c3f])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003fe1ca92151sm8455717wmk.26.2023.08.12.07.50.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 07:50:04 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 2/3] classes-recipe: add cargo_c.bbclass
Date: Sat, 12 Aug 2023 16:49:53 +0200
Message-Id: <62228d31921d705665a7f313033af7851aedc08e.1691851365.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691851365.git.frederic.martinsons@gmail.com>
References: <cover.1691851365.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 14:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185858

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


