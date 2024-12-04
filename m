Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A64E77173
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8162.1733294994056905916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePESdGqR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ea29eee1so2635419f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294992; x=1733899792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAP55EyQli00tBW+7OzeFG5j8dxDvdZ+ldx4ZXZYERY=;
        b=ePESdGqRswnqaEb1kefCNq+mtFR8wJeuu52diTXljEn21ff6debzfXN66BvcGcHI7K
         azJVP7XX+PHrj4DTx+zbq9wrIbXSyBckDf3g48mct9viokFy6PqqbmkvXA1uwmRvtyKQ
         9V/2ALXURgBXAfkglAsIpqE/SsrVH37lFCrPprMnzX9yXGnUU1CJHmR1A2jCoogi1qP2
         E1olpNC50ecfH6OkWZhjEzPdXYzqk4BFCxulqxOlSCMrjSFgpFSZHi+6sZl3rg5c0p5L
         HiRq/BLyBcIwJW5qfk6R2Bah6eno/JEevP8BkLmERCnPNwveLMYPCgJWN3FaQbUk1ejp
         +S/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294992; x=1733899792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAP55EyQli00tBW+7OzeFG5j8dxDvdZ+ldx4ZXZYERY=;
        b=YGEvTov2zT1qs6G6NIsDWF4SvCGswtMR/ZiFgsBCoDuX0btV+3QdYl0seDa5FM+eO6
         jYDWFPR9o8hmPM89md9QTo6sNZSHouvX4FeUE6ed9oPB1MuK6LCPw2LblQNq4EK3z8bJ
         eONlqIs7NU0XquG2autxgOE4EkWjkYjfVou8Cd2NLaqfOwN/jeybVQ4rhTa0aYa30leZ
         NtjVUmimJruaHL3irGocMYFh0DVKFQELyZs1XsGbay/exxEtIn3TBShO+/kzD2RfFfRN
         cXLl5YYKArzxQ41an07IPUpOPAwnnJsjIeqLHyGBbrYHTiSSen2UOq5XFe+fvsPb5g1d
         t9+A==
X-Gm-Message-State: AOJu0Ywho1cnm/NVQO4oIn1mG8McjKW2td0UMPBYlKSLqSOEFrK7wW8d
	CMhBEm+D3LlVe853APR4MTpvJaz/hyiL9OkEytVAL6yGna32VcXQTkUsCw==
X-Gm-Gg: ASbGncutYuzEmuOxlEK80iIxdUp2B3Sy6NPow3tjPmGhud6eXfr6JoldqgVXvnfOcip
	c6ELejxwtwa4h9kyrVlc7B6Wb6f263ylo280o44D9hBOe1eTWfdwGMc+ZDS5CypZIM4b5h3xY8q
	0mW6iDR7Oc0a54eDAlYbdhl6Xd7ob0x+xQnrlFq6ZfoS36fZP/qrewkz7BJ4SDbEjA7NIYtR0/1
	Z+YyyR2zxBNWxm2z9stku0OC/XEUwU15xXTMmWLJRxbuEuPbIzpihAkL17Qn3zmPgvzJO0NktTE
	GFI/0nXhIcQ=
X-Google-Smtp-Source: AGHT+IFLgU4IID7ko87hbOcptyoBaiWgP/RqridEWO09rSyjaLqHnBYs4ScwcuLp7zTEXUMK48bVgA==
X-Received: by 2002:a5d:5985:0:b0:385:f8bd:6e80 with SMTP id ffacd0b85a97d-385fd54de4fmr4270921f8f.56.1733294991892;
        Tue, 03 Dec 2024 22:49:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/37] python3-maturin: update 1.7.1 -> 1.7.4
Date: Wed,  4 Dec 2024 07:49:05 +0100
Message-Id: <20241204064920.817016-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208252

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-maturin-crates.inc         | 188 +++++++++---------
 ...n-architecture-name-resolvation-code.patch | 107 ----------
 ...prove-wheel-reproducibility-by-sorti.patch |   4 +-
 ...ation-issue-with-linux-armv7l-archit.patch |  76 -------
 ...n-ABI-name-resolvation-code-as-helpe.patch |  98 ---------
 ...ation-issue-with-linux-ppc-architect.patch |  68 -------
 ...ation-issue-with-linux-mips64-archit.patch |  82 --------
 ...urin_1.7.1.bb => python3-maturin_1.7.4.bb} |  13 +-
 8 files changed, 96 insertions(+), 540 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch
 rename meta/recipes-devtools/python/{python3-maturin_1.7.1.bb => python3-maturin_1.7.4.bb} (63%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 1e1b573b918..3ff5e4ec51a 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -2,7 +2,7 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/adler/1.0.2 \
+    crate://crates.io/adler2/2.0.0 \
     crate://crates.io/ahash/0.8.11 \
     crate://crates.io/aho-corasick/1.1.3 \
     crate://crates.io/allocator-api2/0.2.18 \
@@ -11,35 +11,33 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/0.2.4 \
     crate://crates.io/anstyle-query/1.1.0 \
     crate://crates.io/anstyle-wincon/3.0.3 \
-    crate://crates.io/anyhow/1.0.86 \
-    crate://crates.io/arbitrary/1.3.2 \
+    crate://crates.io/anyhow/1.0.89 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/automod/1.0.14 \
-    crate://crates.io/base64/0.13.1 \
     crate://crates.io/base64/0.21.7 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.5.0 \
     crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/bstr/1.9.1 \
+    crate://crates.io/bstr/1.10.0 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/bytes/1.6.0 \
+    crate://crates.io/bytes/1.7.1 \
     crate://crates.io/bytesize/1.3.0 \
     crate://crates.io/bzip2/0.4.4 \
     crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
     crate://crates.io/cab/0.5.0 \
-    crate://crates.io/camino/1.1.7 \
+    crate://crates.io/camino/1.1.9 \
     crate://crates.io/cargo-config2/0.1.26 \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
     crate://crates.io/cargo-xwin/0.16.5 \
-    crate://crates.io/cargo-zigbuild/0.18.4 \
+    crate://crates.io/cargo-zigbuild/0.19.3 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cbindgen/0.26.0 \
-    crate://crates.io/cc/1.1.6 \
+    crate://crates.io/cc/1.1.21 \
     crate://crates.io/cfb/0.9.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/charset/0.1.3 \
+    crate://crates.io/charset/0.1.5 \
     crate://crates.io/chumsky/0.9.3 \
     crate://crates.io/clap/4.5.7 \
     crate://crates.io/clap_builder/4.5.7 \
@@ -56,6 +54,8 @@ SRC_URI += " \
     crate://crates.io/core-foundation/0.9.4 \
     crate://crates.io/core-foundation-sys/0.8.6 \
     crate://crates.io/cpufeatures/0.2.12 \
+    crate://crates.io/crc/3.2.1 \
+    crate://crates.io/crc-catalog/2.4.0 \
     crate://crates.io/crc32fast/1.4.2 \
     crate://crates.io/crossbeam-channel/0.5.13 \
     crate://crates.io/crossbeam-deque/0.8.5 \
@@ -65,17 +65,15 @@ SRC_URI += " \
     crate://crates.io/data-encoding/2.6.0 \
     crate://crates.io/deranged/0.3.11 \
     crate://crates.io/derivative/2.2.0 \
-    crate://crates.io/derive_arbitrary/1.3.2 \
     crate://crates.io/dialoguer/0.11.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dirs/5.0.1 \
     crate://crates.io/dirs-sys/0.4.1 \
-    crate://crates.io/displaydoc/0.2.4 \
     crate://crates.io/dissimilar/1.0.9 \
-    crate://crates.io/dunce/1.0.4 \
+    crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.17 \
-    crate://crates.io/either/1.12.0 \
+    crate://crates.io/either/1.13.0 \
     crate://crates.io/encode_unicode/0.3.6 \
     crate://crates.io/encoding_rs/0.8.34 \
     crate://crates.io/equivalent/1.0.1 \
@@ -84,7 +82,7 @@ SRC_URI += " \
     crate://crates.io/fastrand/2.1.0 \
     crate://crates.io/fat-macho/0.4.8 \
     crate://crates.io/filetime/0.2.23 \
-    crate://crates.io/flate2/1.0.30 \
+    crate://crates.io/flate2/1.0.33 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
@@ -103,7 +101,7 @@ SRC_URI += " \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.15 \
     crate://crates.io/glob/0.3.1 \
-    crate://crates.io/globset/0.4.14 \
+    crate://crates.io/globset/0.4.15 \
     crate://crates.io/goblin/0.8.2 \
     crate://crates.io/hashbrown/0.12.3 \
     crate://crates.io/hashbrown/0.14.5 \
@@ -113,9 +111,9 @@ SRC_URI += " \
     crate://crates.io/humantime/2.1.0 \
     crate://crates.io/humantime-serde/1.1.1 \
     crate://crates.io/idna/0.5.0 \
-    crate://crates.io/ignore/0.4.22 \
+    crate://crates.io/ignore/0.4.23 \
     crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/indexmap/2.2.6 \
+    crate://crates.io/indexmap/2.5.0 \
     crate://crates.io/indicatif/0.17.8 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/instant/0.1.13 \
@@ -125,7 +123,7 @@ SRC_URI += " \
     crate://crates.io/keyring/2.3.3 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lddtree/0.3.5 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libc/0.2.158 \
     crate://crates.io/libmimalloc-sys/0.1.38 \
     crate://crates.io/libredox/0.1.3 \
     crate://crates.io/linux-keyutils/0.2.4 \
@@ -141,7 +139,7 @@ SRC_URI += " \
     crate://crates.io/mime_guess/2.0.4 \
     crate://crates.io/minijinja/1.0.21 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.7.3 \
+    crate://crates.io/miniz_oxide/0.8.0 \
     crate://crates.io/msi/0.7.0 \
     crate://crates.io/multipart/0.18.0 \
     crate://crates.io/native-tls/0.2.12 \
@@ -150,8 +148,6 @@ SRC_URI += " \
     crate://crates.io/normpath/1.2.0 \
     crate://crates.io/nu-ansi-term/0.46.0 \
     crate://crates.io/num-conv/0.1.0 \
-    crate://crates.io/num_enum/0.7.2 \
-    crate://crates.io/num_enum_derive/0.7.2 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/openssl/0.10.66 \
@@ -165,8 +161,8 @@ SRC_URI += " \
     crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/paste/1.0.15 \
     crate://crates.io/path-slash/0.2.1 \
-    crate://crates.io/pep440_rs/0.6.0 \
-    crate://crates.io/pep508_rs/0.6.0 \
+    crate://crates.io/pep440_rs/0.6.6 \
+    crate://crates.io/pep508_rs/0.6.1 \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/pin-project-lite/0.2.14 \
     crate://crates.io/pin-utils/0.1.0 \
@@ -176,12 +172,12 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/pretty_assertions/1.4.0 \
+    crate://crates.io/pretty_assertions/1.4.1 \
     crate://crates.io/proc-macro-crate/3.1.0 \
     crate://crates.io/proc-macro2/1.0.85 \
     crate://crates.io/psm/0.1.21 \
     crate://crates.io/pyproject-toml/0.11.0 \
-    crate://crates.io/python-pkginfo/0.6.2 \
+    crate://crates.io/python-pkginfo/0.6.3 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/quoted_printable/0.5.0 \
     crate://crates.io/rand/0.8.5 \
@@ -192,7 +188,7 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/redox_syscall/0.5.1 \
     crate://crates.io/redox_users/0.4.5 \
-    crate://crates.io/regex/1.10.5 \
+    crate://crates.io/regex/1.10.6 \
     crate://crates.io/regex-automata/0.1.10 \
     crate://crates.io/regex-automata/0.4.7 \
     crate://crates.io/regex-syntax/0.6.29 \
@@ -200,12 +196,13 @@ SRC_URI += " \
     crate://crates.io/relative-path/1.9.3 \
     crate://crates.io/rfc2047-decoder/1.0.5 \
     crate://crates.io/ring/0.17.8 \
-    crate://crates.io/rstest/0.21.0 \
-    crate://crates.io/rstest_macros/0.21.0 \
-    crate://crates.io/rustc_version/0.4.0 \
+    crate://crates.io/rstest/0.22.0 \
+    crate://crates.io/rstest_macros/0.22.0 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rustflags/0.1.6 \
     crate://crates.io/rustix/0.38.34 \
     crate://crates.io/rustls/0.22.4 \
-    crate://crates.io/rustls-pemfile/2.1.2 \
+    crate://crates.io/rustls-pemfile/2.1.3 \
     crate://crates.io/rustls-pki-types/1.7.0 \
     crate://crates.io/rustls-webpki/0.102.4 \
     crate://crates.io/rustversion/1.0.17 \
@@ -220,10 +217,10 @@ SRC_URI += " \
     crate://crates.io/security-framework/2.11.0 \
     crate://crates.io/security-framework-sys/2.11.0 \
     crate://crates.io/semver/1.0.23 \
-    crate://crates.io/serde/1.0.204 \
-    crate://crates.io/serde_derive/1.0.204 \
+    crate://crates.io/serde/1.0.210 \
+    crate://crates.io/serde_derive/1.0.210 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.120 \
+    crate://crates.io/serde_json/1.0.128 \
     crate://crates.io/serde_spanned/0.6.6 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -233,8 +230,8 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.9 \
     crate://crates.io/smallvec/1.13.2 \
     crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/snapbox/0.6.10 \
-    crate://crates.io/snapbox-macros/0.3.9 \
+    crate://crates.io/snapbox/0.6.16 \
+    crate://crates.io/snapbox-macros/0.3.10 \
     crate://crates.io/socks/0.3.4 \
     crate://crates.io/spin/0.9.8 \
     crate://crates.io/stacker/0.1.15 \
@@ -242,15 +239,15 @@ SRC_URI += " \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/subtle/2.5.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.66 \
-    crate://crates.io/tar/0.4.41 \
-    crate://crates.io/target-lexicon/0.12.15 \
-    crate://crates.io/tempfile/3.10.1 \
+    crate://crates.io/syn/2.0.76 \
+    crate://crates.io/tar/0.4.42 \
+    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/tempfile/3.11.0 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/terminal_size/0.3.0 \
     crate://crates.io/textwrap/0.16.1 \
-    crate://crates.io/thiserror/1.0.61 \
-    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/thiserror/1.0.64 \
+    crate://crates.io/thiserror-impl/1.0.64 \
     crate://crates.io/thread_local/1.1.8 \
     crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
@@ -258,17 +255,17 @@ SRC_URI += " \
     crate://crates.io/tinyvec/1.7.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.5.11 \
-    crate://crates.io/toml/0.8.14 \
+    crate://crates.io/toml/0.8.15 \
     crate://crates.io/toml_datetime/0.6.6 \
     crate://crates.io/toml_edit/0.21.1 \
-    crate://crates.io/toml_edit/0.22.14 \
+    crate://crates.io/toml_edit/0.22.16 \
     crate://crates.io/tracing/0.1.40 \
     crate://crates.io/tracing-attributes/0.1.27 \
     crate://crates.io/tracing-core/0.1.32 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-serde/0.1.3 \
     crate://crates.io/tracing-subscriber/0.3.18 \
-    crate://crates.io/trycmd/0.15.4 \
+    crate://crates.io/trycmd/0.15.6 \
     crate://crates.io/twox-hash/1.6.3 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicase/2.7.0 \
@@ -277,7 +274,7 @@ SRC_URI += " \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-normalization/0.1.23 \
     crate://crates.io/unicode-width/0.1.13 \
-    crate://crates.io/unicode-xid/0.2.4 \
+    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
     crate://crates.io/ureq/2.9.7 \
@@ -294,7 +291,7 @@ SRC_URI += " \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/webpki-roots/0.26.2 \
     crate://crates.io/which/5.0.0 \
-    crate://crates.io/which/6.0.1 \
+    crate://crates.io/which/6.0.3 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -324,15 +321,14 @@ SRC_URI += " \
     crate://crates.io/winsafe/0.0.19 \
     crate://crates.io/xattr/1.3.1 \
     crate://crates.io/xwin/0.5.1 \
-    crate://crates.io/yansi/0.5.1 \
+    crate://crates.io/yansi/1.0.1 \
     crate://crates.io/zerocopy/0.7.34 \
     crate://crates.io/zerocopy-derive/0.7.34 \
     crate://crates.io/zeroize/1.8.1 \
     crate://crates.io/zip/0.6.6 \
-    crate://crates.io/zip/1.1.4 \
 "
 
-SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
+SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
 SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
 SRC_URI[allocator-api2-0.2.18.sha256sum] = "5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f"
@@ -341,35 +337,33 @@ SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b7
 SRC_URI[anstyle-parse-0.2.4.sha256sum] = "c03a11a9034d92058ceb6ee011ce58af4a9bf61491aa7e1e59ecd24bd40d22d4"
 SRC_URI[anstyle-query-1.1.0.sha256sum] = "ad186efb764318d35165f1758e7dcef3b10628e26d41a44bc5550652e6804391"
 SRC_URI[anstyle-wincon-3.0.3.sha256sum] = "61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19"
-SRC_URI[anyhow-1.0.86.sha256sum] = "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
-SRC_URI[arbitrary-1.3.2.sha256sum] = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b39e8e18a6f05471870e110"
+SRC_URI[anyhow-1.0.89.sha256sum] = "86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[automod-1.0.14.sha256sum] = "edf3ee19dbc0a46d740f6f0926bde8c50f02bdbc7b536842da28f6ac56513a8b"
-SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
 SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[bstr-1.9.1.sha256sum] = "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
+SRC_URI[bstr-1.10.0.sha256sum] = "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[bytes-1.6.0.sha256sum] = "514de17de45fdb8dc022b1a7975556c53c86f9f0aa5f534b98977b171857c2c9"
+SRC_URI[bytes-1.7.1.sha256sum] = "8318a53db07bb3f8dca91a600466bdb3f2eaadeedfdbcf02e1accbad9271ba50"
 SRC_URI[bytesize-1.3.0.sha256sum] = "a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc"
 SRC_URI[bzip2-0.4.4.sha256sum] = "bdb116a6ef3f6c3698828873ad02c3014b3c85cadb88496095628e3ef1e347f8"
 SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] = "736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc"
 SRC_URI[cab-0.5.0.sha256sum] = "9e8636d870cf15918e416b7904f0db1cbd06de0ffe392986c3b16662552df00c"
-SRC_URI[camino-1.1.7.sha256sum] = "e0ec6b951b160caa93cc0c7b209e5a3bff7aae9062213451ac99493cd844c239"
+SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3"
 SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
 SRC_URI[cargo-xwin-0.16.5.sha256sum] = "471f6fff351fc5ab837ce7223637f7c20048e4a846708e7e58fda64db9d3a8b9"
-SRC_URI[cargo-zigbuild-0.18.4.sha256sum] = "65004153e67ac23be88a8e244304a872d727b2aa08654dcabfbecd1fdea4a488"
+SRC_URI[cargo-zigbuild-0.19.3.sha256sum] = "e700178b11124560cdbabc8808e938fe6d77abde036b77a4c03a191b02bac854"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
-SRC_URI[cc-1.1.6.sha256sum] = "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
+SRC_URI[cc-1.1.21.sha256sum] = "07b1695e2c7e8fc85310cde85aeaab7e3097f593c91d209d3f9df76c928100f0"
 SRC_URI[cfb-0.9.0.sha256sum] = "b390793e912300f1aa713429f7fd0c391024e6c18b988962558bc4f96a349b1f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[charset-0.1.3.sha256sum] = "18e9079d1a12a2cc2bffb5db039c43661836ead4082120d5844f02555aca2d46"
+SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
 SRC_URI[chumsky-0.9.3.sha256sum] = "8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9"
 SRC_URI[clap-4.5.7.sha256sum] = "5db83dced34638ad474f39f250d7fea9598bdd239eaced1bdf45d597da0f433f"
 SRC_URI[clap_builder-4.5.7.sha256sum] = "f7e204572485eb3fbf28f871612191521df159bc3e15a9f5064c66dba3a8c05f"
@@ -386,6 +380,8 @@ SRC_URI[content_inspector-0.2.4.sha256sum] = "b7bda66e858c683005a53a9a60c69a4aca
 SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
 SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
 SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
+SRC_URI[crc-3.2.1.sha256sum] = "69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636"
+SRC_URI[crc-catalog-2.4.0.sha256sum] = "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
 SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
 SRC_URI[crossbeam-channel-0.5.13.sha256sum] = "33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2"
 SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
@@ -395,17 +391,15 @@ SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813
 SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
 SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
 SRC_URI[derivative-2.2.0.sha256sum] = "fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b"
-SRC_URI[derive_arbitrary-1.3.2.sha256sum] = "67e77553c4162a157adbf834ebae5b415acbecbeafc7a74b0e886657506a7611"
 SRC_URI[dialoguer-0.11.0.sha256sum] = "658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dirs-5.0.1.sha256sum] = "44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225"
 SRC_URI[dirs-sys-0.4.1.sha256sum] = "520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c"
-SRC_URI[displaydoc-0.2.4.sha256sum] = "487585f4d0c6655fe74905e2504d8ad6908e4db67f744eb140876906c2f3175d"
 SRC_URI[dissimilar-1.0.9.sha256sum] = "59f8e79d1fbf76bdfbde321e902714bf6c49df88a7dda6fc682fc2979226962d"
-SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
+SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
-SRC_URI[either-1.12.0.sha256sum] = "3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b"
+SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
 SRC_URI[encoding_rs-0.8.34.sha256sum] = "b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
@@ -414,7 +408,7 @@ SRC_URI[expect-test-1.5.0.sha256sum] = "9e0be0a561335815e06dab7c62e50353134c796e
 SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
 SRC_URI[fat-macho-0.4.8.sha256sum] = "0d4c93f393add03d72bc10dd3dea43a1610ecb29e0c0a6459c70b53b82931adf"
 SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
-SRC_URI[flate2-1.0.30.sha256sum] = "5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae"
+SRC_URI[flate2-1.0.33.sha256sum] = "324a1be68054ef05ad64b861cc9eaf1d623d2d8cb25b4bf2cb9cdd902b4bf253"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
@@ -433,7 +427,7 @@ SRC_URI[futures-util-0.3.30.sha256sum] = "3d6401deb83407ab3da39eba7e33987a73c3df
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
-SRC_URI[globset-0.4.14.sha256sum] = "57da3b9b5b85bd66f31093f8c408b90a74431672542466497dcbdfdc02034be1"
+SRC_URI[globset-0.4.15.sha256sum] = "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
 SRC_URI[goblin-0.8.2.sha256sum] = "1b363a30c165f666402fe6a3024d3bec7ebc898f96a4a23bd1c99f8dbf3f4f47"
 SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
@@ -443,9 +437,9 @@ SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b0
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
 SRC_URI[humantime-serde-1.1.1.sha256sum] = "57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c"
 SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
-SRC_URI[ignore-0.4.22.sha256sum] = "b46810df39e66e925525d6e38ce1e7f6e1d208f72dc39757880fcb66e2c58af1"
+SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
 SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
+SRC_URI[indexmap-2.5.0.sha256sum] = "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
 SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[instant-0.1.13.sha256sum] = "e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222"
@@ -455,7 +449,7 @@ SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lddtree-0.3.5.sha256sum] = "735dc8281e12cf7450b3a343c50bccdb15625f41b127d1bd7063949fe367847d"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libc-0.2.158.sha256sum] = "d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"
 SRC_URI[libmimalloc-sys-0.1.38.sha256sum] = "0e7bb23d733dfcc8af652a78b7bf232f0e967710d044732185e561e47c0336b6"
 SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
 SRC_URI[linux-keyutils-0.2.4.sha256sum] = "761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e"
@@ -471,7 +465,7 @@ SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09
 SRC_URI[mime_guess-2.0.4.sha256sum] = "4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef"
 SRC_URI[minijinja-1.0.21.sha256sum] = "55e877d961d4f96ce13615862322df7c0b6d169d40cab71a7ef3f9b9e594451e"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.7.3.sha256sum] = "87dfd01fe195c66b572b37921ad8803d010623c0aca821bea2302239d155cdae"
+SRC_URI[miniz_oxide-0.8.0.sha256sum] = "e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1"
 SRC_URI[msi-0.7.0.sha256sum] = "226b2404f03d2cf47375b9715c8adfae4e388bb2377cff908e8a40f31e421514"
 SRC_URI[multipart-0.18.0.sha256sum] = "00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182"
 SRC_URI[native-tls-0.2.12.sha256sum] = "a8614eb2c83d59d1c8cc974dd3f920198647674a0a035e1af1fa58707e317466"
@@ -480,8 +474,6 @@ SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8
 SRC_URI[normpath-1.2.0.sha256sum] = "5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804"
 SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
-SRC_URI[num_enum-0.7.2.sha256sum] = "02339744ee7253741199f897151b38e72257d13802d4ee837285cc2990a90845"
-SRC_URI[num_enum_derive-0.7.2.sha256sum] = "681030a937600a36906c185595136d26abfebb4aa9c65701cefcaf8578bb982b"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
@@ -495,8 +487,8 @@ SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf
 SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
 SRC_URI[path-slash-0.2.1.sha256sum] = "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
-SRC_URI[pep440_rs-0.6.0.sha256sum] = "ca0a570e7ec9171250cac57614e901f62408094b54b3798bb920d3cf0d4a0e09"
-SRC_URI[pep508_rs-0.6.0.sha256sum] = "581c27e97a3f38c5d691962af7da93c2672b5227d59cf165b87a9b1fd53dd724"
+SRC_URI[pep440_rs-0.6.6.sha256sum] = "466eada3179c2e069ca897b99006cbb33f816290eaeec62464eea907e22ae385"
+SRC_URI[pep508_rs-0.6.1.sha256sum] = "3f8877489a99ccc80012333123e434f84e645fe1ede3b30e9d3b815887a12979"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[pin-project-lite-0.2.14.sha256sum] = "bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
@@ -506,12 +498,12 @@ SRC_URI[platform-info-2.0.3.sha256sum] = "d5ff316b9c4642feda973c18f0decd6c8b0919
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
+SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
 SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
 SRC_URI[proc-macro2-1.0.85.sha256sum] = "22244ce15aa966053a896d1accb3a6e68469b97c7f33f284b99f0d576879fc23"
 SRC_URI[psm-0.1.21.sha256sum] = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874"
 SRC_URI[pyproject-toml-0.11.0.sha256sum] = "ef7061023bcb58a0fc4a4bbe9819c13b0dca7c2abc14da14f5ecc1532ab3a36a"
-SRC_URI[python-pkginfo-0.6.2.sha256sum] = "4320ca452fe003f8a07afb8e30c315bbd813ae8105f454ddefebf15a24021e1f"
+SRC_URI[python-pkginfo-0.6.3.sha256sum] = "ba3f3f0d552c7efdde2b6898bf21b49c4e76b3e6071ff196dfe52109804db896"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
@@ -522,7 +514,7 @@ SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
 SRC_URI[redox_users-0.4.5.sha256sum] = "bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
+SRC_URI[regex-1.10.6.sha256sum] = "4219d74c6b67a3654a9fbebc4b419e22126d13d2f3c4a07ee0cb61ff79a79619"
 SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
 SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
@@ -530,12 +522,13 @@ SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec2017689
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
 SRC_URI[rfc2047-decoder-1.0.5.sha256sum] = "e90a668c463c412c3118ae1883e18b53d812c349f5af7a06de3ba4bb0c17cc73"
 SRC_URI[ring-0.17.8.sha256sum] = "c17fa4cb658e3583423e915b9f3acc01cceaee1860e33d59ebae66adc3a2dc0d"
-SRC_URI[rstest-0.21.0.sha256sum] = "9afd55a67069d6e434a95161415f5beeada95a01c7b815508a82dcb0e1593682"
-SRC_URI[rstest_macros-0.21.0.sha256sum] = "4165dfae59a39dd41d8dec720d3cbfbc71f69744efb480a3920f5d4e0cc6798d"
-SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
+SRC_URI[rstest-0.22.0.sha256sum] = "7b423f0e62bdd61734b67cd21ff50871dfaeb9cc74f869dcd6af974fbcb19936"
+SRC_URI[rstest_macros-0.22.0.sha256sum] = "c5e1711e7d14f74b12a58411c542185ef7fb7f2e7f8ee6e2940a883628522b42"
+SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rustflags-0.1.6.sha256sum] = "d7fc92159fb50a431c5da366f7627751fe7263cf867f8a30f27fa6063ba02ac0"
 SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
 SRC_URI[rustls-0.22.4.sha256sum] = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
-SRC_URI[rustls-pemfile-2.1.2.sha256sum] = "29993a25686778eb88d4189742cd713c9bce943bc54251a33509dc63cbacf73d"
+SRC_URI[rustls-pemfile-2.1.3.sha256sum] = "196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425"
 SRC_URI[rustls-pki-types-1.7.0.sha256sum] = "976295e77ce332211c0d24d92c0e83e50f5c5f046d11082cea19f3df13a3562d"
 SRC_URI[rustls-webpki-0.102.4.sha256sum] = "ff448f7e92e913c4b7d4c6d8e4540a1724b319b4152b8aef6d4cf8339712b33e"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
@@ -550,10 +543,10 @@ SRC_URI[scroll_derive-0.12.0.sha256sum] = "7f81c2fde025af7e69b1d1420531c8a8811ca
 SRC_URI[security-framework-2.11.0.sha256sum] = "c627723fd09706bacdb5cf41499e95098555af3c3c29d014dc3c458ef6be11c0"
 SRC_URI[security-framework-sys-2.11.0.sha256sum] = "317936bbbd05227752583946b9e66d7ce3b489f84e11a94a510b4437fef407d7"
 SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
-SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
-SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
+SRC_URI[serde-1.0.210.sha256sum] = "c8e3592472072e6e22e0a54d5904d9febf8508f65fb8552499a1abc7d1078c3a"
+SRC_URI[serde_derive-1.0.210.sha256sum] = "243902eda00fad750862fc144cea25caca5e20d615af0a81bee94ca738f1df1f"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.120.sha256sum] = "4e0d21c9a8cae1235ad58a00c11cb40d4b1e5c784f1ef2c537876ed6ffd8b7c5"
+SRC_URI[serde_json-1.0.128.sha256sum] = "6ff5456707a1de34e7e37f2a6fd3d3f808c318259cbd01ab6377795054b483d8"
 SRC_URI[serde_spanned-0.6.6.sha256sum] = "79e674e01f999af37c49f70a6ede167a8a60b2503e56c5599532a65baa5969a0"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -563,8 +556,8 @@ SRC_URI[similar-2.5.0.sha256sum] = "fa42c91313f1d05da9b26f267f931cf178d4aba455b4
 SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
-SRC_URI[snapbox-0.6.10.sha256sum] = "40e14d10e4c2b4331ac24c33baa5a03e1fbca81c045b285b53b2a612d28569fb"
-SRC_URI[snapbox-macros-0.3.9.sha256sum] = "b1f4c14672714436c09254801c934b203196a51182a5107fb76591c7cc56424d"
+SRC_URI[snapbox-0.6.16.sha256sum] = "027c936207f85d10d015e21faf5c676c7e08c453ed371adf55c0874c443ca77a"
+SRC_URI[snapbox-macros-0.3.10.sha256sum] = "16569f53ca23a41bb6f62e0a5084aa1661f4814a67fa33696a79073e03a664af"
 SRC_URI[socks-0.3.4.sha256sum] = "f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
 SRC_URI[stacker-0.1.15.sha256sum] = "c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce"
@@ -572,15 +565,15 @@ SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c5
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.66.sha256sum] = "c42f3f41a2de00b01c0aaad383c5a45241efc8b2d1eda5661812fda5f3cdcff5"
-SRC_URI[tar-0.4.41.sha256sum] = "cb797dad5fb5b76fcf519e702f4a589483b5ef06567f160c392832c1f5e44909"
-SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
-SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
+SRC_URI[syn-2.0.76.sha256sum] = "578e081a14e0cefc3279b0472138c513f37b41a08d5a3cca9b6e4e8ceb6cd525"
+SRC_URI[tar-0.4.42.sha256sum] = "4ff6c40d3aedb5e06b57c6f669ad17ab063dd1e63d977c6a88e7f4dfa4f04020"
+SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[tempfile-3.11.0.sha256sum] = "b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
 SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
-SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
-SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[thiserror-1.0.64.sha256sum] = "d50af8abc119fb8bb6dbabcfa89656f46f84aa0ac7688088608076ad2b459a84"
+SRC_URI[thiserror-impl-1.0.64.sha256sum] = "08904e7672f5eb876eaaf87e0ce17857500934f4981c4a0ab2b4aa98baac7fc3"
 SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
 SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
@@ -588,17 +581,17 @@ SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a6
 SRC_URI[tinyvec-1.7.0.sha256sum] = "ce6b6a2fb3a985e99cebfaefa9faa3024743da73304ca1c683a36429613d3d22"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
-SRC_URI[toml-0.8.14.sha256sum] = "6f49eb2ab21d2f26bd6db7bf383edc527a7ebaee412d17af4d40fdccd442f335"
+SRC_URI[toml-0.8.15.sha256sum] = "ac2caab0bf757388c6c0ae23b3293fdb463fee59434529014f85e3263b995c28"
 SRC_URI[toml_datetime-0.6.6.sha256sum] = "4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf"
 SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
-SRC_URI[toml_edit-0.22.14.sha256sum] = "f21c7aaf97f1bd9ca9d4f9e73b0a6c74bd5afef56f2bc931943a6e1c37e04e38"
+SRC_URI[toml_edit-0.22.16.sha256sum] = "278f3d518e152219c994ce877758516bca5e118eaed6996192a774fb9fbf0788"
 SRC_URI[tracing-0.1.40.sha256sum] = "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
 SRC_URI[tracing-attributes-0.1.27.sha256sum] = "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
 SRC_URI[tracing-core-0.1.32.sha256sum] = "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-serde-0.1.3.sha256sum] = "bc6b213177105856957181934e4920de57730fc69bf42c37ee5bb664d406d9e1"
 SRC_URI[tracing-subscriber-0.3.18.sha256sum] = "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
-SRC_URI[trycmd-0.15.4.sha256sum] = "59709bd8eccada6a3fded26d22a7f2dcee406c18d3bd7ad2605ca3eeb8f6f6ec"
+SRC_URI[trycmd-0.15.6.sha256sum] = "3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84237ce83d5a28e2befa12"
 SRC_URI[twox-hash-1.6.3.sha256sum] = "97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicase-2.7.0.sha256sum] = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
@@ -607,7 +600,7 @@ SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb66163
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-normalization-0.1.23.sha256sum] = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
 SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
-SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
+SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
 SRC_URI[ureq-2.9.7.sha256sum] = "d11a831e3c0b56e438a28308e7c810799e3c118417f342d30ecec080105395cd"
@@ -624,7 +617,7 @@ SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[webpki-roots-0.26.2.sha256sum] = "3c452ad30530b54a4d8e71952716a212b08efd0f3562baa66c29a618b07da7c3"
 SRC_URI[which-5.0.0.sha256sum] = "9bf3ea8596f3a0dd5980b46430f2058dfe2c36a27ccfbb1845d6fbfcd9ba6e14"
-SRC_URI[which-6.0.1.sha256sum] = "8211e4f58a2b2805adfbefbc07bab82958fc91e3836339b1ab7ae32465dce0d7"
+SRC_URI[which-6.0.3.sha256sum] = "b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a868418ac1b39cf1f"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -654,9 +647,8 @@ SRC_URI[winnow-0.6.13.sha256sum] = "59b5e5f6c299a3c7890b876a2a587f3115162487e704
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
 SRC_URI[xwin-0.5.1.sha256sum] = "c13f18103ecd54342d0f923b33fff9ed595e5813e5af85620f1a8e7622474acb"
-SRC_URI[yansi-0.5.1.sha256sum] = "09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec"
+SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
 SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
 SRC_URI[zip-0.6.6.sha256sum] = "760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261"
-SRC_URI[zip-1.1.4.sha256sum] = "9cc23c04387f4da0374be4533ad1208cbb091d5c11d070dfef13676ad6497164"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch b/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
deleted file mode 100644
index f75d5a1ba84..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 42a97ee7100ad158d4b1ba6133ea13cc864a567f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
- <vesa.jaaskelainen@vaisala.com>
-Date: Sun, 1 Sep 2024 09:23:10 +0300
-Subject: [PATCH 1/5] Extract extension architecture name resolvation code as
- helper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This commit introduces helper InterpreterConfig.get_python_ext_arch() that
-can be used to determine the extension architecture name python uses in
-`ext_suffix` for this architecture.
-
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/42a97ee7100ad158d4b1ba6133ea13cc864a567f]
-
-Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
----
- src/python_interpreter/config.rs | 18 ++++++------------
- src/target.rs                    | 16 ++++++++++++++++
- 2 files changed, 22 insertions(+), 12 deletions(-)
-
-diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
-index 912f9218..d76606f2 100644
---- a/src/python_interpreter/config.rs
-+++ b/src/python_interpreter/config.rs
-@@ -47,15 +47,7 @@ impl InterpreterConfig {
-             // Python 2 is not supported
-             return None;
-         }
--        let python_arch = if matches!(target.target_arch(), Arch::Armv6L | Arch::Armv7L) {
--            "arm"
--        } else if matches!(target.target_arch(), Arch::Powerpc64Le) && python_impl == PyPy {
--            "ppc_64"
--        } else if matches!(target.target_arch(), Arch::X86) && python_impl == PyPy {
--            "x86"
--        } else {
--            target.get_python_arch()
--        };
-+        let python_ext_arch = target.get_python_ext_arch(python_impl);
-         // See https://github.com/pypa/auditwheel/issues/349
-         let target_env = match python_impl {
-             CPython => {
-@@ -77,7 +69,7 @@ impl InterpreterConfig {
-                 let ldversion = format!("{}{}{}", major, minor, abiflags);
-                 let ext_suffix = format!(
-                     ".cpython-{}-{}-linux-{}.so",
--                    ldversion, python_arch, target_env
-+                    ldversion, python_ext_arch, target_env
-                 );
-                 Some(Self {
-                     major,
-@@ -90,7 +82,8 @@ impl InterpreterConfig {
-             }
-             (Os::Linux, PyPy) => {
-                 let abi_tag = format!("pypy{}{}-{}", major, minor, PYPY_ABI_TAG);
--                let ext_suffix = format!(".{}-{}-linux-{}.so", abi_tag, python_arch, target_env);
-+                let ext_suffix =
-+                    format!(".{}-{}-linux-{}.so", abi_tag, python_ext_arch, target_env);
-                 Some(Self {
-                     major,
-                     minor,
-@@ -204,7 +197,8 @@ impl InterpreterConfig {
-             }
-             (Os::Emscripten, CPython) => {
-                 let ldversion = format!("{}{}", major, minor);
--                let ext_suffix = format!(".cpython-{}-{}-emscripten.so", ldversion, python_arch);
-+                let ext_suffix =
-+                    format!(".cpython-{}-{}-emscripten.so", ldversion, python_ext_arch);
-                 Some(Self {
-                     major,
-                     minor,
-diff --git a/src/target.rs b/src/target.rs
-index dc7df0cf..84bae559 100644
---- a/src/target.rs
-+++ b/src/target.rs
-@@ -1,4 +1,5 @@
- use crate::cross_compile::is_cross_compiling;
-+use crate::python_interpreter::InterpreterKind;
- use crate::PlatformTag;
- use anyhow::{anyhow, bail, format_err, Result};
- use platform_info::*;
-@@ -368,6 +369,21 @@ impl Target {
-         }
-     }
- 
-+    /// Returns the extension architecture name python uses in `ext_suffix` for this architecture.
-+    pub fn get_python_ext_arch(&self, python_impl: InterpreterKind) -> &str {
-+        if matches!(self.target_arch(), Arch::Armv6L | Arch::Armv7L) {
-+            "arm"
-+        } else if matches!(self.target_arch(), Arch::Powerpc64Le)
-+            && python_impl == InterpreterKind::PyPy
-+        {
-+            "ppc_64"
-+        } else if matches!(self.target_arch(), Arch::X86) && python_impl == InterpreterKind::PyPy {
-+            "x86"
-+        } else {
-+            self.get_python_arch()
-+        }
-+    }
-+
-     /// Returns the name python uses in `sys.platform` for this os
-     pub fn get_python_os(&self) -> &str {
-         match self.os {
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch b/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
index 83b586ff727..bcbe7b87eaf 100644
--- a/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
+++ b/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
@@ -1,4 +1,4 @@
-From 49b985d7f5a4582bf9e2c58b6220124e2b7aa395 Mon Sep 17 00:00:00 2001
+From 672dca922397016720eae2a3f0fb79613971c56e Mon Sep 17 00:00:00 2001
 From: Yoann Congal <yoann.congal@smile.fr>
 Date: Thu, 17 Oct 2024 22:17:20 +0200
 Subject: [PATCH] build_context: improve wheel reproducibility by sorting libs
@@ -32,7 +32,7 @@ Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/61d54809776e1c
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/build_context.rs b/src/build_context.rs
-index 2e498537..6fbd25c1 100644
+index a98d233..09ca090 100644
 --- a/src/build_context.rs
 +++ b/src/build_context.rs
 @@ -24,7 +24,7 @@ use normpath::PathExt;
diff --git a/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch b/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
deleted file mode 100644
index 4366dde1114..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 0c6b8cc84eff72ed21098029aaba079b899dbee2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
- <vesa.jaaskelainen@vaisala.com>
-Date: Sun, 1 Sep 2024 09:23:40 +0300
-Subject: [PATCH 2/5] Fix cross compilation issue with linux-armv7l
- architecture
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When compiling under Yocto project for linux-armv7l target architecture
-.so files were generated incorrectly as:
-
-  rpds.cpython-312-armv7l-linux-gnueabihf.so
-
-Where as platform and EXT_SUFFIX are defined as:
-
-  >>> sysconfig.get_platform()
-  'linux-armv7l'
-  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
-  '.cpython-312-arm-linux-gnueabihf.so'
-
-Which should have caused the .so files as:
-
-  rpds.cpython-312-arm-linux-gnueabihf.so
-
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/0c6b8cc84eff72ed21098029aaba079b899dbee2]
-
-Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
----
- src/python_interpreter/config.rs | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
-index d76606f2..5736aedc 100644
---- a/src/python_interpreter/config.rs
-+++ b/src/python_interpreter/config.rs
-@@ -306,7 +306,7 @@ impl InterpreterConfig {
-                     format!(
-                         ".cpython-{}-{}-{}-{}.{}",
-                         abi_tag,
--                        target.get_python_arch(),
-+                        target.get_python_ext_arch(interpreter_kind),
-                         target.get_python_os(),
-                         target_env,
-                         file_ext,
-@@ -319,7 +319,7 @@ impl InterpreterConfig {
-                         major,
-                         minor,
-                         abi_tag,
--                        target.get_python_arch(),
-+                        target.get_python_ext_arch(interpreter_kind),
-                         target.get_python_os(),
-                         target_env,
-                         file_ext,
-@@ -330,7 +330,7 @@ impl InterpreterConfig {
-                     format!(
-                         ".{}-{}-{}.{}",
-                         abi_tag.replace('_', "-"),
--                        target.get_python_arch(),
-+                        target.get_python_ext_arch(interpreter_kind),
-                         target.get_python_os(),
-                         file_ext,
-                     )
-@@ -341,7 +341,7 @@ impl InterpreterConfig {
-                 format!(
-                     ".cpython-{}-{}-{}.{}",
-                     abi_tag,
--                    target.get_python_arch(),
-+                    target.get_python_ext_arch(interpreter_kind),
-                     target.get_python_os(),
-                     file_ext
-                 )
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch b/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
deleted file mode 100644
index b4a7f69492a..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From fa64426f3a98a0455721c23ec86bd2240708b45e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
- <vesa.jaaskelainen@vaisala.com>
-Date: Sun, 1 Sep 2024 15:55:07 +0300
-Subject: [PATCH 3/5] Extract extension ABI name resolvation code as helper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This commit introduces helper InterpreterConfig.get_python_target_env()
-that can be used to determine the extension ABI python uses in
-`ext_suffix` for this architecture.
-
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/fa64426f3a98a0455721c23ec86bd2240708b45e]
-
-Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
----
- src/python_interpreter/config.rs | 19 ++-----------------
- src/target.rs                    | 20 ++++++++++++++++++++
- 2 files changed, 22 insertions(+), 17 deletions(-)
-
-diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
-index 5736aedc..938e9955 100644
---- a/src/python_interpreter/config.rs
-+++ b/src/python_interpreter/config.rs
-@@ -48,17 +48,7 @@ impl InterpreterConfig {
-             return None;
-         }
-         let python_ext_arch = target.get_python_ext_arch(python_impl);
--        // See https://github.com/pypa/auditwheel/issues/349
--        let target_env = match python_impl {
--            CPython => {
--                if python_version >= (3, 11) {
--                    target.target_env().to_string()
--                } else {
--                    target.target_env().to_string().replace("musl", "gnu")
--                }
--            }
--            PyPy | GraalPy => "gnu".to_string(),
--        };
-+        let target_env = target.get_python_target_env(python_impl, python_version);
-         match (target.target_os(), python_impl) {
-             (Os::Linux, CPython) => {
-                 let abiflags = if python_version < (3, 8) {
-@@ -294,12 +284,7 @@ impl InterpreterConfig {
-         };
-         let file_ext = if target.is_windows() { "pyd" } else { "so" };
-         let ext_suffix = if target.is_linux() || target.is_macos() {
--            // See https://github.com/pypa/auditwheel/issues/349
--            let target_env = if (major, minor) >= (3, 11) {
--                target.target_env().to_string()
--            } else {
--                target.target_env().to_string().replace("musl", "gnu")
--            };
-+            let target_env = target.get_python_target_env(interpreter_kind, (major, minor));
-             match interpreter_kind {
-                 InterpreterKind::CPython => ext_suffix.unwrap_or_else(|| {
-                     // Eg: .cpython-38-x86_64-linux-gnu.so
-diff --git a/src/target.rs b/src/target.rs
-index 84bae559..ad8ebaba 100644
---- a/src/target.rs
-+++ b/src/target.rs
-@@ -1,5 +1,6 @@
- use crate::cross_compile::is_cross_compiling;
- use crate::python_interpreter::InterpreterKind;
-+use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
- use crate::PlatformTag;
- use anyhow::{anyhow, bail, format_err, Result};
- use platform_info::*;
-@@ -384,6 +385,25 @@ impl Target {
-         }
-     }
- 
-+    /// Returns the environment python uses in `ext_suffix` for this architecture.
-+    pub fn get_python_target_env(
-+        &self,
-+        python_impl: InterpreterKind,
-+        python_version: (usize, usize),
-+    ) -> String {
-+        match python_impl {
-+            CPython => {
-+                // For musl handling see https://github.com/pypa/auditwheel/issues/349
-+                if python_version >= (3, 11) {
-+                    self.target_env().to_string()
-+                } else {
-+                    self.target_env().to_string().replace("musl", "gnu")
-+                }
-+            }
-+            PyPy | GraalPy => "gnu".to_string(),
-+        }
-+    }
-+
-     /// Returns the name python uses in `sys.platform` for this os
-     pub fn get_python_os(&self) -> &str {
-         match self.os {
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch b/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
deleted file mode 100644
index bda5dca8f62..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f2c892109a05db144e8b18bcbcf9c24fe8d977c4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
- <vesa.jaaskelainen@vaisala.com>
-Date: Sun, 1 Sep 2024 15:55:16 +0300
-Subject: [PATCH 4/5] Fix cross compilation issue with linux-ppc architecture
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When compiling under Yocto project for linux-ppc target architecture
-.so files were generated incorrectly as:
-
-  rpds.cpython-312-ppc-linux-gnu.so
-
-Where as platform and EXT_SUFFIX are defined as:
-
-  >>> sysconfig.get_platform()
-  'linux-ppc'
-  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
-  '.cpython-312-powerpc-linux-gnu.so'
-
-Which should have caused the .so files as:
-
-  rpds.cpython-312-powerpc-linux-gnu.so
-
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/f2c892109a05db144e8b18bcbcf9c24fe8d977c4]
-
-Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
----
- src/python_interpreter/config.rs | 8 ++++++++
- src/target.rs                    | 2 ++
- 2 files changed, 10 insertions(+)
-
-diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
-index 938e9955..8f883887 100644
---- a/src/python_interpreter/config.rs
-+++ b/src/python_interpreter/config.rs
-@@ -424,6 +424,14 @@ mod test {
-             ".cpython-310-powerpc64le-linux-gnu.so"
-         );
- 
-+        let sysconfig = InterpreterConfig::lookup_one(
-+            &Target::from_target_triple(Some("powerpc-unknown-linux-gnu".to_string())).unwrap(),
-+            InterpreterKind::CPython,
-+            (3, 10),
-+        )
-+        .unwrap();
-+        assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.so");
-+
-         let sysconfig = InterpreterConfig::lookup_one(
-             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to_string())).unwrap(),
-             InterpreterKind::CPython,
-diff --git a/src/target.rs b/src/target.rs
-index ad8ebaba..93afd9bb 100644
---- a/src/target.rs
-+++ b/src/target.rs
-@@ -380,6 +380,8 @@ impl Target {
-             "ppc_64"
-         } else if matches!(self.target_arch(), Arch::X86) && python_impl == InterpreterKind::PyPy {
-             "x86"
-+        } else if matches!(self.target_arch(), Arch::Powerpc) {
-+            "powerpc"
-         } else {
-             self.get_python_arch()
-         }
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch b/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch
deleted file mode 100644
index b24196d5dda..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 5fe643579bcc63d824f6a0f0936fff451c622903 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
- <vesa.jaaskelainen@vaisala.com>
-Date: Sun, 1 Sep 2024 15:55:54 +0300
-Subject: [PATCH 5/5] Fix cross compilation issue with linux-mips64
- architecture
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When compiling under Yocto project for linux-mips64 target architecture
-.so files were generated incorrectly as:
-
-  rpds.cpython-312-mips64-linux-gnu.so
-
-Where as platform and EXT_SUFFIX are defined as:
-
-  >>> sysconfig.get_platform()
-  'linux-mips64'
-  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
-  '.cpython-312-mips64-linux-gnuabi64.so'
-
-Which should have caused the .so files as:
-
-  rpds.cpython-312-mips64-linux-gnuabi64.so
-
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/5fe643579bcc63d824f6a0f0936fff451c622903]
-
-Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
----
- src/python_interpreter/config.rs | 19 +++++++++++++++++++
- src/target.rs                    |  4 +++-
- 2 files changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
-index 8f883887..ef656010 100644
---- a/src/python_interpreter/config.rs
-+++ b/src/python_interpreter/config.rs
-@@ -432,6 +432,25 @@ mod test {
-         .unwrap();
-         assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.so");
- 
-+        let sysconfig = InterpreterConfig::lookup_one(
-+            &Target::from_target_triple(Some("mips64-unknown-linux-gnu".to_string())).unwrap(),
-+            InterpreterKind::CPython,
-+            (3, 10),
-+        )
-+        .unwrap();
-+        assert_eq!(
-+            sysconfig.ext_suffix,
-+            ".cpython-310-mips64-linux-gnuabi64.so"
-+        );
-+
-+        let sysconfig = InterpreterConfig::lookup_one(
-+            &Target::from_target_triple(Some("mips-unknown-linux-gnu".to_string())).unwrap(),
-+            InterpreterKind::CPython,
-+            (3, 10),
-+        )
-+        .unwrap();
-+        assert_eq!(sysconfig.ext_suffix, ".cpython-310-mips-linux-gnu.so");
-+
-         let sysconfig = InterpreterConfig::lookup_one(
-             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to_string())).unwrap(),
-             InterpreterKind::CPython,
-diff --git a/src/target.rs b/src/target.rs
-index 93afd9bb..25fc6c07 100644
---- a/src/target.rs
-+++ b/src/target.rs
-@@ -396,7 +396,9 @@ impl Target {
-         match python_impl {
-             CPython => {
-                 // For musl handling see https://github.com/pypa/auditwheel/issues/349
--                if python_version >= (3, 11) {
-+                if matches!(self.target_arch(), Arch::Mips64 | Arch::Mips64el) && self.is_linux() {
-+                    "gnuabi64".to_string()
-+                } else if python_version >= (3, 11) {
-                     self.target_env().to_string()
-                 } else {
-                     self.target_env().to_string().replace("musl", "gnu")
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-maturin_1.7.1.bb b/meta/recipes-devtools/python/python3-maturin_1.7.4.bb
similarity index 63%
rename from meta/recipes-devtools/python/python3-maturin_1.7.1.bb
rename to meta/recipes-devtools/python/python3-maturin_1.7.4.bb
index 88371288966..d9891b6a097 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.7.4.bb
@@ -5,15 +5,10 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "147754cb3d81177ee12d9baf575d93549e76121dacd3544ad6a50ab718de2b9c"
-SRC_URI:append = "\
-    file://0001-Extract-extension-architecture-name-resolvation-code.patch \
-    file://0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch \
-    file://0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch \
-    file://0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch \
-    file://0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch \
-    file://0001-build_context-improve-wheel-reproducibility-by-sorti.patch \
-"
+SRC_URI += " \
+           file://0001-build_context-improve-wheel-reproducibility-by-sorti.patch \
+           "
+SRC_URI[sha256sum] = "2b349d742a07527d236f0b4b6cab26f53ebecad0ceabfc09ec4c6a396e3176f9"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.39.5


