Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C584DC87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 17:23:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.10658.1754760202842235667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 10:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfxhM5zA;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso4826736a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754760201; x=1755365001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxzCN0P9FTcAoTMcPcuOnIbbsocwx84wsL0wzrlrfRk=;
        b=mfxhM5zAaIdNG2RKFDsvEUUWaLF7O4xVysggEQvrx7aUovZ5fSTw/KYYL8nRwZ/E0v
         nN8fseByavHDceD7ASjJvICvWPbRWEnCgkq+99AqZBGPMCun/Lbg7F0Ej5yWNWvT3YzU
         Pv1B3j+hOdxA/pJpZsafBwj9x/s+lHXVSpYEZrUid4YHTUqDs67Aj+Q9vijPJy7eP177
         yrlOnikm2iyprfbJDConM0vmHzV8wI9p5WqhnbwIbBCl82Q3RNI7unpdHt3GKsRUvTdp
         DeCCRlTC7i1tuY4MwANQBjdskUZzBHYd3BpNsJtvieE425Woq+sK00P8bHAqoneSrXFV
         u5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754760201; x=1755365001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxzCN0P9FTcAoTMcPcuOnIbbsocwx84wsL0wzrlrfRk=;
        b=ryAmOrcke8/7NgdWQ7Rsd92CGpkmhYMZ/tER92grd2jEy0Lq0iUlzXX2vwACC8876z
         b3pTf4Zcu/c7TO7y2QCNx2zbGcZmROoISaminECxiAjclBHMY5LASVTgj774J5MocSBa
         D5PlAgH5Ek0KBQ3x8LxUmeeJjDli0M39AcDoV4hRrCxEz7SMa9yc02PNiYv8KgzRJi4E
         8djJgo88AltLmoke6eQQPOou/XCBTqkFVG4KVkPVnojdp1Lw6GoLUXNnmjZMCXqUnq5Y
         0K9DinZvbCg4/IB1boMuWzsKZ6hQTH2Zwt0L6rI1BWkjNFUS7I63czAMjnIDAy0uknqF
         pIfg==
X-Gm-Message-State: AOJu0Yx7SIJ4RZCrhfJOb7/Dm12PpFBe3tGfvxfdqx6Q4lB3aKvcTs35
	2gk0F+9sSquJfO0YYxljMATWdwlDkJ7UcFPfH3m9DhE6W/iNtXm/cTqtTYPypQ==
X-Gm-Gg: ASbGncuOtR92hdOOdPItQIGyFMR3Q9jjyj922Dafd0cgirdWexWVNX2N1i36s6lgBYR
	albqO1+Vd23eh+L+ZX8PmA6wC1/AzMUvQEG5z6Rk6DJCd+9ee6tBTOpAmKLevvgFCOlsUQ3lHgx
	XY2O4YhqEGsDoLBBm9B8pogN8feOBVDZx7FF3DwLv1BSQLLbbdp2qOkLAJTT9bIBfAIINVSV+Ml
	WVuh7ajpLWMSgGEk8/GhUUdvvmwOuJl4hdKv/SuiKou4171imXojC3JIh/IGszQArfl9neWcj2u
	Y7oWRlOyUmMI71KJquq13+4qurQBvtBZdoaGDohWLZcQLknWpUwFxdXssrTfMyww1FjHzEFM1Az
	WMmQ4N/prF/tFvA7YFzuo07c3XCpgyw==
X-Google-Smtp-Source: AGHT+IH635ABYSQ9dybCzhG5PfInMDs1tcUk7G6HVlN+GIN0jIRTqXHa2KczolSRVUnlKyiMhXFg6g==
X-Received: by 2002:a05:6402:50c8:b0:617:cd9d:e2a5 with SMTP id 4fb4d7f45d1cf-617e56474c9mr6032380a12.19.1754760200283;
        Sat, 09 Aug 2025 10:23:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffb8d7sm15446005a12.47.2025.08.09.10.23.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 10:23:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] rpm-sequoia: upgrade 1.7.0 -> 1.9.0
Date: Sat,  9 Aug 2025 19:23:18 +0200
Message-ID: <20250809172318.24794-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 17:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221685

The upstream project has extended the tests slightly, by adding a cargo command
to ensure that the library is built before the tests would be executed. This
doesn't really work for ptests, since it rebuilds the library from scratch on the
target. As an attempt to solve this issue, introduce an environment variable with
a patch, which, if present, will skip building the library before executing the test.

Changelog:
https://github.com/rpm-software-management/rpm-sequoia/compare/v1.7.0...v1.9.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
v3: move run-ptest script content to a file, and add some comments in it

v2: fix run-ptest script file permissions, link: https://lists.openembedded.org/g/openembedded-core/message/221671

v1: https://lists.openembedded.org/g/openembedded-core/message/221665

 ...-lib-for-symbols-tests-conditionally.patch |  41 ++
 .../rpm-sequoia/files/run-ptest               |  15 +
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 522 ++++++++++--------
 ...-sequoia_1.7.0.bb => rpm-sequoia_1.9.0.bb} |   9 +-
 4 files changed, 345 insertions(+), 242 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/files/run-ptest
 rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.7.0.bb => rpm-sequoia_1.9.0.bb} (90%)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
new file mode 100644
index 0000000000..ddc897b86c
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
@@ -0,0 +1,41 @@
+From aaae1cc05c906b1d413e02f9da0b908e4cf9456d Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 8 Aug 2025 18:17:39 +0200
+Subject: [PATCH] tests: build lib for symbols tests conditionally
+
+When the tests are executed, cargo might not be available,
+however the library could be built already.
+
+An example of when this could happen is cross-compiling for
+embedded systems: when the library is compiled for a different
+(potentially low powered) system, then at runtime frequently
+there is no rust toolchain available to build the library;
+however the library is usually already built and installed.
+
+To be able to run the test on pre-built artifacts, introduce
+an environment variable, "DONT_BUILD_TEST_LIB", which, if
+present with any value, will skip building the library.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm-sequoia/pull/99]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/symbols.rs | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/symbols.rs b/tests/symbols.rs
+index c532a15..0c4d268 100644
+--- a/tests/symbols.rs
++++ b/tests/symbols.rs
+@@ -9,7 +9,10 @@ use assert_cmd::assert::OutputAssertExt;
+ #[test]
+ fn symbols() -> anyhow::Result<()> {
+     // Make sure the library is built.
+-    Command::new("cargo").arg("build").ok()?;
++    let skip_build_library = env::var("TEST_DONT_BUILD_LIB").is_ok();
++    if ! skip_build_library {
++        Command::new("cargo").arg("build").ok()?;
++    }
+ 
+     // We want the location of the build directory (e.g.,
+     // `/tmp/rpm-sequoia/debug`).
diff --git a/meta/recipes-devtools/rpm-sequoia/files/run-ptest b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
new file mode 100644
index 0000000000..83e59b8031
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+# This script doesn't seem to do much, but the recipe uses
+# the ptest-cargo bbclass, which appends its content to
+# the run-ptest script, if it can find an existing one.
+
+# The test that ptest-cargo class generates requires the
+# TEST_DONT_BUILD_LIB environment variable to be set before
+# it would be executed, and this is what this script does.
+# The "rc" variable is used by the script generated by
+# ptest-cargo, and is expected to exist, in case the
+# run-test script exists, and not created by that class.
+
+rc=0
+export TEST_DONT_BUILD_LIB=1
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
index 2764030ec7..b97e27a34f 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -8,49 +8,51 @@ SRC_URI += " \
     crate://crates.io/aho-corasick/1.1.3 \
     crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anstyle/1.0.7 \
-    crate://crates.io/anyhow/1.0.86 \
+    crate://crates.io/anstyle/1.0.11 \
+    crate://crates.io/anyhow/1.0.98 \
+    crate://crates.io/argon2/0.5.3 \
     crate://crates.io/ascii-canvas/3.0.0 \
-    crate://crates.io/assert_cmd/2.0.14 \
-    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/assert_cmd/2.0.17 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base16ct/0.2.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/base64ct/1.6.0 \
-    crate://crates.io/bindgen/0.68.1 \
+    crate://crates.io/base64ct/1.8.0 \
+    crate://crates.io/bindgen/0.70.1 \
     crate://crates.io/bit-set/0.5.3 \
     crate://crates.io/bit-vec/0.6.3 \
-    crate://crates.io/bitflags/2.6.0 \
+    crate://crates.io/bitflags/2.9.1 \
+    crate://crates.io/blake2/0.10.6 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-padding/0.3.3 \
     crate://crates.io/blowfish/0.9.1 \
-    crate://crates.io/botan/0.10.7 \
-    crate://crates.io/botan-sys/0.10.5 \
-    crate://crates.io/bstr/1.9.1 \
-    crate://crates.io/buffered-reader/1.3.1 \
-    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/botan/0.11.1 \
+    crate://crates.io/botan-sys/0.11.1 \
+    crate://crates.io/bstr/1.12.0 \
+    crate://crates.io/buffered-reader/1.4.0 \
+    crate://crates.io/bumpalo/3.19.0 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/camellia/0.1.0 \
     crate://crates.io/cast5/0.11.1 \
-    crate://crates.io/cc/1.0.106 \
+    crate://crates.io/cc/1.2.27 \
     crate://crates.io/cdylib-link-lines/0.1.5 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfb-mode/0.8.2 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.38 \
+    crate://crates.io/cfg-if/1.0.1 \
+    crate://crates.io/chrono/0.4.41 \
     crate://crates.io/cipher/0.4.4 \
     crate://crates.io/clang-sys/1.8.1 \
     crate://crates.io/cmac/0.7.2 \
     crate://crates.io/const-oid/0.9.6 \
-    crate://crates.io/core-foundation-sys/0.8.6 \
-    crate://crates.io/cpufeatures/0.2.12 \
-    crate://crates.io/crunchy/0.2.2 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/crypto-bigint/0.5.5 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/ctr/0.9.2 \
     crate://crates.io/curve25519-dalek/4.1.3 \
     crate://crates.io/curve25519-dalek-derive/0.1.1 \
     crate://crates.io/dbl/0.3.2 \
-    crate://crates.io/der/0.7.9 \
+    crate://crates.io/der/0.7.10 \
     crate://crates.io/des/0.8.1 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/digest/0.10.7 \
@@ -59,189 +61,210 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/doc-comment/0.3.3 \
     crate://crates.io/dsa/0.6.3 \
-    crate://crates.io/dyn-clone/1.0.17 \
+    crate://crates.io/dyn-clone/1.0.19 \
     crate://crates.io/eax/0.5.0 \
     crate://crates.io/ecb/0.1.2 \
     crate://crates.io/ecdsa/0.16.9 \
     crate://crates.io/ed25519/2.2.3 \
     crate://crates.io/ed25519-dalek/2.1.1 \
-    crate://crates.io/either/1.13.0 \
+    crate://crates.io/either/1.15.0 \
     crate://crates.io/elliptic-curve/0.13.8 \
     crate://crates.io/ena/0.14.3 \
-    crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/errno/0.3.9 \
-    crate://crates.io/fastrand/2.1.0 \
-    crate://crates.io/ff/0.13.0 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.13 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/ff/0.13.1 \
     crate://crates.io/fiat-crypto/0.2.9 \
     crate://crates.io/fixedbitset/0.4.2 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/generic-array/1.1.0 \
-    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/getrandom/0.2.16 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/ghash/0.5.1 \
-    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/glob/0.3.2 \
     crate://crates.io/group/0.13.0 \
-    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/hashbrown/0.15.4 \
     crate://crates.io/hkdf/0.12.4 \
     crate://crates.io/hmac/0.12.1 \
-    crate://crates.io/iana-time-zone/0.1.60 \
+    crate://crates.io/iana-time-zone/0.1.63 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/1.5.0 \
-    crate://crates.io/icu_locid/1.5.0 \
-    crate://crates.io/icu_locid_transform/1.5.0 \
-    crate://crates.io/icu_locid_transform_data/1.5.0 \
-    crate://crates.io/icu_normalizer/1.5.0 \
-    crate://crates.io/icu_normalizer_data/1.5.0 \
-    crate://crates.io/icu_properties/1.5.1 \
-    crate://crates.io/icu_properties_data/1.5.0 \
-    crate://crates.io/icu_provider/1.5.0 \
-    crate://crates.io/icu_provider_macros/1.5.0 \
+    crate://crates.io/icu_collections/2.0.0 \
+    crate://crates.io/icu_locale_core/2.0.0 \
+    crate://crates.io/icu_normalizer/2.0.0 \
+    crate://crates.io/icu_normalizer_data/2.0.0 \
+    crate://crates.io/icu_properties/2.0.1 \
+    crate://crates.io/icu_properties_data/2.0.1 \
+    crate://crates.io/icu_provider/2.0.0 \
     crate://crates.io/idea/0.5.1 \
-    crate://crates.io/idna/1.0.2 \
-    crate://crates.io/indexmap/2.2.6 \
-    crate://crates.io/inout/0.1.3 \
+    crate://crates.io/idna/1.0.3 \
+    crate://crates.io/idna_adapter/1.2.1 \
+    crate://crates.io/indexmap/2.10.0 \
+    crate://crates.io/inout/0.1.4 \
     crate://crates.io/itertools/0.11.0 \
-    crate://crates.io/js-sys/0.3.69 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/js-sys/0.3.77 \
+    crate://crates.io/keccak/0.1.5 \
     crate://crates.io/lalrpop/0.20.2 \
     crate://crates.io/lalrpop-util/0.20.2 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.155 \
-    crate://crates.io/libloading/0.8.4 \
-    crate://crates.io/libm/0.2.8 \
-    crate://crates.io/libredox/0.1.3 \
-    crate://crates.io/linux-raw-sys/0.4.14 \
-    crate://crates.io/litemap/0.7.3 \
-    crate://crates.io/lock_api/0.4.12 \
-    crate://crates.io/log/0.4.22 \
+    crate://crates.io/libc/0.2.174 \
+    crate://crates.io/libloading/0.8.8 \
+    crate://crates.io/libm/0.2.15 \
+    crate://crates.io/libredox/0.1.4 \
+    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/litemap/0.8.0 \
+    crate://crates.io/lock_api/0.4.13 \
+    crate://crates.io/log/0.4.27 \
     crate://crates.io/md-5/0.10.6 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/memchr/2.7.5 \
     crate://crates.io/memsec/0.7.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/nettle/7.4.0 \
-    crate://crates.io/nettle-sys/2.3.0 \
+    crate://crates.io/nettle-sys/2.3.1 \
     crate://crates.io/new_debug_unreachable/1.0.6 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-bigint-dig/0.8.4 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-iter/0.1.45 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/ocb3/0.1.0 \
+    crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/opaque-debug/0.3.1 \
-    crate://crates.io/openssl/0.10.64 \
+    crate://crates.io/openssl/0.10.73 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.102 \
+    crate://crates.io/openssl-sys/0.9.109 \
     crate://crates.io/p256/0.13.2 \
-    crate://crates.io/p384/0.13.0 \
+    crate://crates.io/p384/0.13.1 \
     crate://crates.io/p521/0.13.3 \
-    crate://crates.io/parking_lot/0.12.3 \
-    crate://crates.io/parking_lot_core/0.9.10 \
-    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/parking_lot/0.12.4 \
+    crate://crates.io/parking_lot_core/0.9.11 \
+    crate://crates.io/password-hash/0.5.0 \
     crate://crates.io/pem-rfc7468/0.7.0 \
     crate://crates.io/petgraph/0.6.5 \
-    crate://crates.io/phf_shared/0.10.0 \
+    crate://crates.io/phf_shared/0.11.3 \
     crate://crates.io/pkcs1/0.7.5 \
     crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.30 \
+    crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/polyval/0.6.2 \
-    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/potential_utf/0.1.2 \
+    crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/precomputed-hash/0.1.1 \
-    crate://crates.io/predicates/3.1.0 \
-    crate://crates.io/predicates-core/1.0.6 \
-    crate://crates.io/predicates-tree/1.0.9 \
+    crate://crates.io/predicates/3.1.3 \
+    crate://crates.io/predicates-core/1.0.9 \
+    crate://crates.io/predicates-tree/1.0.12 \
     crate://crates.io/primeorder/0.13.6 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/redox_syscall/0.5.2 \
-    crate://crates.io/redox_users/0.4.5 \
-    crate://crates.io/regex/1.10.5 \
-    crate://crates.io/regex-automata/0.4.7 \
-    crate://crates.io/regex-syntax/0.8.4 \
+    crate://crates.io/redox_syscall/0.5.13 \
+    crate://crates.io/redox_users/0.4.6 \
+    crate://crates.io/regex/1.11.1 \
+    crate://crates.io/regex-automata/0.4.9 \
+    crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rfc6979/0.4.0 \
     crate://crates.io/ripemd/0.1.3 \
-    crate://crates.io/rsa/0.9.6 \
+    crate://crates.io/rsa/0.9.8 \
     crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.38.34 \
-    crate://crates.io/rustversion/1.0.17 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rustix/1.0.7 \
+    crate://crates.io/rustversion/1.0.21 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sec1/0.7.3 \
-    crate://crates.io/semver/1.0.23 \
-    crate://crates.io/sequoia-openpgp/1.21.1 \
-    crate://crates.io/sequoia-policy-config/0.6.0 \
-    crate://crates.io/serde/1.0.204 \
-    crate://crates.io/serde_derive/1.0.204 \
+    crate://crates.io/semver/1.0.26 \
+    crate://crates.io/sequoia-openpgp/2.0.0 \
+    crate://crates.io/sequoia-policy-config/0.8.0 \
+    crate://crates.io/serde/1.0.219 \
+    crate://crates.io/serde_derive/1.0.219 \
     crate://crates.io/sha1collisiondetection/0.3.4 \
-    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/sha2/0.10.9 \
+    crate://crates.io/sha3/0.10.8 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signature/2.2.0 \
-    crate://crates.io/siphasher/0.3.11 \
-    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/siphasher/1.0.1 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/spin/0.9.8 \
     crate://crates.io/spki/0.7.3 \
     crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/string_cache/0.8.7 \
+    crate://crates.io/string_cache/0.8.9 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.70 \
-    crate://crates.io/synstructure/0.13.1 \
-    crate://crates.io/tempfile/3.10.1 \
+    crate://crates.io/syn/2.0.104 \
+    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/tempfile/3.20.0 \
     crate://crates.io/term/0.7.0 \
-    crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/thiserror/1.0.61 \
-    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror-impl/1.0.69 \
     crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/tinystr/0.7.6 \
+    crate://crates.io/tinystr/0.8.1 \
     crate://crates.io/toml/0.5.11 \
     crate://crates.io/twofish/0.7.1 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-xid/0.2.4 \
+    crate://crates.io/typenum/1.18.0 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/universal-hash/0.5.1 \
-    crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wait-timeout/0.2.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/wait-timeout/0.2.1 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.92 \
-    crate://crates.io/wasm-bindgen-backend/0.2.92 \
-    crate://crates.io/wasm-bindgen-macro/0.2.92 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.92 \
-    crate://crates.io/wasm-bindgen-shared/0.2.92 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.100 \
+    crate://crates.io/wasm-bindgen-backend/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
+    crate://crates.io/wasm-bindgen-shared/0.2.100 \
     crate://crates.io/win-crypto-ng/0.5.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.8 \
+    crate://crates.io/winapi-util/0.1.9 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-core/0.52.0 \
-    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-core/0.61.2 \
+    crate://crates.io/windows-implement/0.60.0 \
+    crate://crates.io/windows-interface/0.59.1 \
+    crate://crates.io/windows-link/0.1.3 \
+    crate://crates.io/windows-result/0.3.4 \
+    crate://crates.io/windows-strings/0.4.2 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.2 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.0 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.0 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.0 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.0 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.0 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/write16/1.0.0 \
-    crate://crates.io/writeable/0.5.5 \
+    crate://crates.io/windows_x86_64_msvc/0.53.0 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
+    crate://crates.io/writeable/0.6.1 \
     crate://crates.io/x25519-dalek/2.0.1 \
-    crate://crates.io/xxhash-rust/0.8.11 \
-    crate://crates.io/yoke/0.7.4 \
-    crate://crates.io/yoke-derive/0.7.4 \
-    crate://crates.io/zerofrom/0.1.4 \
-    crate://crates.io/zerofrom-derive/0.1.4 \
+    crate://crates.io/xxhash-rust/0.8.15 \
+    crate://crates.io/yoke/0.8.0 \
+    crate://crates.io/yoke-derive/0.8.0 \
+    crate://crates.io/zerocopy/0.8.26 \
+    crate://crates.io/zerocopy-derive/0.8.26 \
+    crate://crates.io/zerofrom/0.1.6 \
+    crate://crates.io/zerofrom-derive/0.1.6 \
     crate://crates.io/zeroize/1.8.1 \
     crate://crates.io/zeroize_derive/1.4.2 \
-    crate://crates.io/zerovec/0.10.4 \
-    crate://crates.io/zerovec-derive/0.10.3 \
+    crate://crates.io/zerotrie/0.2.2 \
+    crate://crates.io/zerovec/0.11.2 \
+    crate://crates.io/zerovec-derive/0.11.1 \
 "
 
 SRC_URI[aead-0.5.2.sha256sum] = "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
@@ -250,49 +273,51 @@ SRC_URI[aes-gcm-0.10.3.sha256sum] = "831010a0f742e1209b3bcea8fab6a8e149051ba6099
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
 SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
-SRC_URI[anyhow-1.0.86.sha256sum] = "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
+SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
+SRC_URI[anyhow-1.0.98.sha256sum] = "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
+SRC_URI[argon2-0.5.3.sha256sum] = "3c3610892ee6e0cbce8ae2700349fcf8f98adb0dbfbee85aec3c9179d29cc072"
 SRC_URI[ascii-canvas-3.0.0.sha256sum] = "8824ecca2e851cec16968d54a01dd372ef8f95b244fb84b84e70128be347c3c6"
-SRC_URI[assert_cmd-2.0.14.sha256sum] = "ed72493ac66d5804837f480ab3766c72bdfab91a65e565fc54fa9e42db0073a8"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[assert_cmd-2.0.17.sha256sum] = "2bd389a4b2970a01282ee455294913c0a43724daedcd1a24c3eb0ec1c1320b66"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[base64ct-1.6.0.sha256sum] = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
-SRC_URI[bindgen-0.68.1.sha256sum] = "726e4313eb6ec35d2730258ad4e15b547ee75d6afaa1361a922e78e59b7d8078"
+SRC_URI[base64ct-1.8.0.sha256sum] = "55248b47b0caf0546f7988906588779981c43bb1bc9d0c44087278f80cdb44ba"
+SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
 SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
 SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
-SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
+SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[blake2-0.10.6.sha256sum] = "46502ad458c9a52b69d4d4d32775c788b7a1b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
-SRC_URI[botan-0.10.7.sha256sum] = "350081af1a3c6883f8a1f863ac553bfe6922589aad60008a70947765ed57c53e"
-SRC_URI[botan-sys-0.10.5.sha256sum] = "9f49dde1b8ebd2996cc41c55c39f6ef8b54e38148d8973aeba0792b87b1621ca"
-SRC_URI[bstr-1.9.1.sha256sum] = "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
-SRC_URI[buffered-reader-1.3.1.sha256sum] = "cd098763fdb64579407a8c83cf0d751e6d4a7e161d0114c89cc181a2ca760ec8"
-SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[botan-0.11.1.sha256sum] = "24d4c7647d67c53194fa0740404c6c508880aef2bfe99a9868dbb4b86f090377"
+SRC_URI[botan-sys-0.11.1.sha256sum] = "04285fa0c094cc9961fe435b1b279183db9394844ad82ce483aa6196c0e6da38"
+SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
+SRC_URI[buffered-reader-1.4.0.sha256sum] = "db26bf1f092fd5e05b5ab3be2f290915aeb6f3f20c4e9f86ce0f07f336c2412f"
+SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[camellia-0.1.0.sha256sum] = "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
 SRC_URI[cast5-0.11.1.sha256sum] = "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
-SRC_URI[cc-1.0.106.sha256sum] = "066fce287b1d4eafef758e89e09d724a24808a9196fe9756b8ca90e86d0719a2"
+SRC_URI[cc-1.2.27.sha256sum] = "d487aa071b5f64da6f19a3e848e3578944b726ee5a4854b82172f02aa876bfdc"
 SRC_URI[cdylib-link-lines-0.1.5.sha256sum] = "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfb-mode-0.8.2.sha256sum] = "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono-0.4.38.sha256sum] = "a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401"
+SRC_URI[cfg-if-1.0.1.sha256sum] = "9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268"
+SRC_URI[chrono-0.4.41.sha256sum] = "c469d952047f47f91b68d1cba3f10d63c11d73e4636f24f08daf0278abf01c4d"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
 SRC_URI[cmac-0.7.2.sha256sum] = "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
 SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
-SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
-SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
-SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[ctr-0.9.2.sha256sum] = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
 SRC_URI[curve25519-dalek-4.1.3.sha256sum] = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
 SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
 SRC_URI[dbl-0.3.2.sha256sum] = "bd2735a791158376708f9347fe8faba9667589d82427ef3aed6794a8981de3d9"
-SRC_URI[der-0.7.9.sha256sum] = "f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0"
+SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
 SRC_URI[des-0.8.1.sha256sum] = "ffdd80ce8ce993de27e9f063a444a4d53ce8e8db4c1f00cc03af5ad5a9867a1e"
 SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
@@ -301,186 +326,207 @@ SRC_URI[dirs-sys-next-0.1.2.sha256sum] = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580a
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[doc-comment-0.3.3.sha256sum] = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
 SRC_URI[dsa-0.6.3.sha256sum] = "48bc224a9084ad760195584ce5abb3c2c34a225fa312a128ad245a6b412b7689"
-SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
+SRC_URI[dyn-clone-1.0.19.sha256sum] = "1c7a8fb8a9fbf66c1f703fe16184d10ca0ee9d23be5b4436400408ba54a95005"
 SRC_URI[eax-0.5.0.sha256sum] = "9954fabd903b82b9d7a68f65f97dc96dd9ad368e40ccc907a7c19d53e6bfac28"
 SRC_URI[ecb-0.1.2.sha256sum] = "1a8bfa975b1aec2145850fcaa1c6fe269a16578c44705a532ae3edc92b8881c7"
 SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
 SRC_URI[ed25519-2.2.3.sha256sum] = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
 SRC_URI[ed25519-dalek-2.1.1.sha256sum] = "4a3daa8e81a3963a60642bcc1f90a670680bd4a77535faa384e9d1c79d620871"
-SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
+SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
 SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
 SRC_URI[ena-0.14.3.sha256sum] = "3d248bdd43ce613d87415282f69b9bb99d947d290b10962dd6c56233312c2ad5"
-SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
-SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
-SRC_URI[ff-0.13.0.sha256sum] = "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
+SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[ff-0.13.1.sha256sum] = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
 SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[generic-array-1.1.0.sha256sum] = "96512db27971c2c3eece70a1e106fbe6c87760234e31e8f7e5634912fe52794a"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[ghash-0.5.1.sha256sum] = "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
-SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[glob-0.3.2.sha256sum] = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
 SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
-SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[hashbrown-0.15.4.sha256sum] = "5971ac85611da7067dbfcabef3c70ebb5606018acd9e2a3903a0da507521e0d5"
 SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
-SRC_URI[iana-time-zone-0.1.60.sha256sum] = "e7ffbb5a1b541ea2561f8c41c087286cc091e21e556a4f09a8f6cbf17b69b141"
+SRC_URI[iana-time-zone-0.1.63.sha256sum] = "b0c919e5debc312ad217002b8048a17b7d83f80703865bbfcfebb0458b0b27d8"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
-SRC_URI[icu_locid-1.5.0.sha256sum] = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
-SRC_URI[icu_locid_transform-1.5.0.sha256sum] = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
-SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
-SRC_URI[icu_normalizer-1.5.0.sha256sum] = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
-SRC_URI[icu_normalizer_data-1.5.0.sha256sum] = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
-SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
-SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
-SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
-SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
+SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
+SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
+SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
+SRC_URI[icu_normalizer_data-2.0.0.sha256sum] = "00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3"
+SRC_URI[icu_properties-2.0.1.sha256sum] = "016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b"
+SRC_URI[icu_properties_data-2.0.1.sha256sum] = "298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632"
+SRC_URI[icu_provider-2.0.0.sha256sum] = "03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af"
 SRC_URI[idea-0.5.1.sha256sum] = "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
-SRC_URI[idna-1.0.2.sha256sum] = "bd69211b9b519e98303c015e21a007e293db403b6c85b9b124e133d25e242cdd"
-SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
-SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
+SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
+SRC_URI[indexmap-2.10.0.sha256sum] = "fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661"
+SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
 SRC_URI[itertools-0.11.0.sha256sum] = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
-SRC_URI[js-sys-0.3.69.sha256sum] = "29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d"
+SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+SRC_URI[keccak-0.1.5.sha256sum] = "ecc2af9a1119c51f12a14607e783cb977bde58bc069ff0c3da1095e635d70654"
 SRC_URI[lalrpop-0.20.2.sha256sum] = "55cb077ad656299f160924eb2912aa147d7339ea7d69e1b5517326fdcec3c1ca"
 SRC_URI[lalrpop-util-0.20.2.sha256sum] = "507460a910eb7b32ee961886ff48539633b788a36b65692b95f225b844c82553"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
-SRC_URI[libloading-0.8.4.sha256sum] = "e310b3a6b5907f99202fcdb4960ff45b93735d7c7d96b760fcff8db2dc0e103d"
-SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
-SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
-SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
-SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
+SRC_URI[libc-0.2.174.sha256sum] = "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
+SRC_URI[libloading-0.8.8.sha256sum] = "07033963ba89ebaf1584d767badaa2e8fcec21aedea6b8c0346d487d49c28667"
+SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
+SRC_URI[libredox-0.1.4.sha256sum] = "1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638"
+SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
+SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
+SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[memchr-2.7.5.sha256sum] = "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
 SRC_URI[memsec-0.7.0.sha256sum] = "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[nettle-7.4.0.sha256sum] = "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
-SRC_URI[nettle-sys-2.3.0.sha256sum] = "b495053a10a19a80e3a26bf1212e92e29350797b5f5bdc58268c3f3f818e66ec"
+SRC_URI[nettle-sys-2.3.1.sha256sum] = "61a3f5406064d310d59b1a219d3c5c9a49caf4047b6496032e3f930876488c34"
 SRC_URI[new_debug_unreachable-1.0.6.sha256sum] = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[num-bigint-dig-0.8.4.sha256sum] = "dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[ocb3-0.1.0.sha256sum] = "c196e0276c471c843dd5777e7543a36a298a4be942a2a688d8111cd43390dedb"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[opaque-debug-0.3.1.sha256sum] = "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
-SRC_URI[openssl-0.10.64.sha256sum] = "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
+SRC_URI[openssl-0.10.73.sha256sum] = "8505734d46c8ab1e19a1dce3aef597ad87dcb4c37e7188231769bd6bd51cebf8"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.102.sha256sum] = "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
+SRC_URI[openssl-sys-0.9.109.sha256sum] = "90096e2e47630d78b7d1c20952dc621f957103f8bc2c8359ec81290d75238571"
 SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
-SRC_URI[p384-0.13.0.sha256sum] = "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
+SRC_URI[p384-0.13.1.sha256sum] = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
 SRC_URI[p521-0.13.3.sha256sum] = "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
-SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
-SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
-SRC_URI[peeking_take_while-0.1.2.sha256sum] = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[parking_lot-0.12.4.sha256sum] = "70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13"
+SRC_URI[parking_lot_core-0.9.11.sha256sum] = "bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5"
+SRC_URI[password-hash-0.5.0.sha256sum] = "346f04948ba92c43e8469c1ee6736c7563d71012b17d40745260fe106aac2166"
 SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
 SRC_URI[petgraph-0.6.5.sha256sum] = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
-SRC_URI[phf_shared-0.10.0.sha256sum] = "b6796ad771acdc0123d2a88dc428b5e38ef24456743ddb1744ed628f9815c096"
+SRC_URI[phf_shared-0.11.3.sha256sum] = "67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5"
 SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
-SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
+SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[polyval-0.6.2.sha256sum] = "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
-SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[potential_utf-0.1.2.sha256sum] = "e5a7c30837279ca13e7c867e9e40053bc68740f988cb07f7ca6df43cc734b585"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[precomputed-hash-0.1.1.sha256sum] = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
-SRC_URI[predicates-3.1.0.sha256sum] = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
-SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
-SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
+SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
+SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
+SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
 SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[redox_syscall-0.5.2.sha256sum] = "c82cf8cff14456045f55ec4241383baeff27af886adb72ffb2162f99911de0fd"
-SRC_URI[redox_users-0.4.5.sha256sum] = "bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
-SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
-SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
+SRC_URI[redox_syscall-0.5.13.sha256sum] = "0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6"
+SRC_URI[redox_users-0.4.6.sha256sum] = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
+SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
+SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
 SRC_URI[ripemd-0.1.3.sha256sum] = "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
-SRC_URI[rsa-0.9.6.sha256sum] = "5d0e5124fcb30e76a7e79bfee683a2746db83784b86289f6251b54b7950a0dfc"
+SRC_URI[rsa-0.9.8.sha256sum] = "78928ac1ed176a5ca1d17e578a1825f3d81ca54cf41053a592584b020cfd691b"
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
-SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
-SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
+SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rustix-1.0.7.sha256sum] = "c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266"
+SRC_URI[rustversion-1.0.21.sha256sum] = "8a0d197bd2c9dc6e53b84da9556a69ba4cdfab8619eb41a8bd1cc2027a0f6b1d"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
-SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
-SRC_URI[sequoia-openpgp-1.21.1.sha256sum] = "b870b0275eeae174058fcf0ce5affccaaafeb7eceeabce8d6c7f51fbe6a41e2a"
-SRC_URI[sequoia-policy-config-0.6.0.sha256sum] = "757d45d308f2bd9c0d6fdd640f320998ad24856bdf2890ddd28d3c3b85808274"
-SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
-SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
+SRC_URI[semver-1.0.26.sha256sum] = "56e6fa9c48d24d85fb3de5ad847117517440f6beceb7798af16b4a87d616b8d0"
+SRC_URI[sequoia-openpgp-2.0.0.sha256sum] = "015e5fc3d023418b9db98ca9a7f3e90b305872eeafe5ca45c5c32b5eb335c1e8"
+SRC_URI[sequoia-policy-config-0.8.0.sha256sum] = "8e016b708d64857b6a97e1a331d9471b73e30ed450d247628e1a0ce236b1e597"
+SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
+SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
 SRC_URI[sha1collisiondetection-0.3.4.sha256sum] = "1f606421e4a6012877e893c399822a4ed4b089164c5969424e1b9d1e66e6964b"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
+SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949862c0d4dcb291eba60"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
-SRC_URI[siphasher-0.3.11.sha256sum] = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
 SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
-SRC_URI[string_cache-0.8.7.sha256sum] = "f91138e76242f575eb1d3b38b4f1362f10d3a43f47d182a5b359af488a02293b"
+SRC_URI[string_cache-0.8.9.sha256sum] = "bf776ba3fa74f83bf4b63c3dcbbf82173db2632ed8452cb2d891d33f459de70f"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.70.sha256sum] = "2f0209b68b3613b093e0ec905354eccaedcfe83b8cb37cbdeae64026c3064c16"
-SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
-SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
+SRC_URI[syn-2.0.104.sha256sum] = "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
+SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
 SRC_URI[term-0.7.0.sha256sum] = "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f"
-SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
-SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
-SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
+SRC_URI[tinystr-0.8.1.sha256sum] = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
 SRC_URI[twofish-0.7.1.sha256sum] = "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
+SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[universal-hash-0.5.1.sha256sum] = "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
-SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasm-bindgen-0.2.92.sha256sum] = "4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8"
-SRC_URI[wasm-bindgen-backend-0.2.92.sha256sum] = "614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da"
-SRC_URI[wasm-bindgen-macro-0.2.92.sha256sum] = "a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726"
-SRC_URI[wasm-bindgen-macro-support-0.2.92.sha256sum] = "e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7"
-SRC_URI[wasm-bindgen-shared-0.2.92.sha256sum] = "af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
+SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
+SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
 SRC_URI[win-crypto-ng-0.5.1.sha256sum] = "99abfb435a71e54ab2971d8d8c32f1a7e006cdbf527f71743b1d45b93517bb92"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
+SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-core-0.61.2.sha256sum] = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
+SRC_URI[windows-implement-0.60.0.sha256sum] = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
+SRC_URI[windows-interface-0.59.1.sha256sum] = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
+SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
+SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
+SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.2.sha256sum] = "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.0.sha256sum] = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.0.sha256sum] = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
-SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
+SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
+SRC_URI[writeable-0.6.1.sha256sum] = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
 SRC_URI[x25519-dalek-2.0.1.sha256sum] = "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
-SRC_URI[xxhash-rust-0.8.11.sha256sum] = "63658493314859b4dfdf3fb8c1defd61587839def09582db50b8a4e93afca6bb"
-SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
-SRC_URI[yoke-derive-0.7.4.sha256sum] = "28cc31741b18cb6f1d5ff12f5b7523e3d6eb0852bbbad19d73905511d9849b95"
-SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
-SRC_URI[zerofrom-derive-0.1.4.sha256sum] = "0ea7b4a3637ea8669cedf0f1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5"
+SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
+SRC_URI[yoke-0.8.0.sha256sum] = "5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc"
+SRC_URI[yoke-derive-0.8.0.sha256sum] = "38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6"
+SRC_URI[zerocopy-0.8.26.sha256sum] = "1039dd0d3c310cf05de012d8a39ff557cb0d23087fd44cad61df08fc31907a2f"
+SRC_URI[zerocopy-derive-0.8.26.sha256sum] = "9ecf5b4cc5364572d7f4c329661bcc82724222973f2cab6f050a4e5c22f75181"
+SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
+SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
 SRC_URI[zeroize_derive-1.4.2.sha256sum] = "ce36e65b0d2999d2aafac989fb249189a141aee1f53c612c1f37d72631959f69"
-SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
-SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
+SRC_URI[zerotrie-0.2.2.sha256sum] = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
+SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350f99f34e338d5fdd294428"
+SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
similarity index 90%
rename from meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
rename to meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
index 46f9ee8548..577acfdc86 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
@@ -12,11 +12,12 @@ DEPENDS = "openssl"
 
 inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
 
-SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main \
-	file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
+SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
+           file://0001-tests-build-lib-for-symbols-tests-conditionally.patch \
+           file://run-ptest \
 "
-
-SRCREV = "0667e04ae7fb8cf0490919978d69883d16400e41"
+SRCREV = "cd090b02119565c6d171fa9a892790c966cf10ef"
 
 require ${BPN}-crates.inc
 

