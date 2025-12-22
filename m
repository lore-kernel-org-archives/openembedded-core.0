Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036C3E6ADC7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87812.1766434110734110884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R7/cmHmR;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b735487129fso750007766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434109; x=1767038909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnlARcvg9p6TOB8sRL17hWqf/043ew5TJFQlNioZtUA=;
        b=R7/cmHmRH3dz+jVSyPD3+VwNawU/QsGEwh2e0FimBoUFT9+cQDN7jn8ypeXjvL8/Lm
         A4zmfA6GNt/OtOoNVh2zmFnrvNspnYAvJ90aLqtOoufSKnUaw5oVSsbGAj89jnPWg6vT
         JkzUQqWnAoYr0QaEriCZlMUQAqVNlU3cQ33yybYm9bXgrE5fWtmDujGWtpYg2bU6jowH
         0JK4rA9ncctWjsxc2d6uL0zeqPa84NqJQY2RYX/iQZJbKS0SGX3gJmpmpi7NKCrXPKOA
         K0jzqdD10o5ZSNaBUdy8MZnfeK81flO3negWvDHr0d24lA6kg6C32A9OB7FHa1MMS40Q
         EyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434109; x=1767038909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnlARcvg9p6TOB8sRL17hWqf/043ew5TJFQlNioZtUA=;
        b=Cl9PCySoqTrUrSN4uOV9nuBt73RZqvsekHM5mZlOR5EX6kruQwtJv7r6aM+ZRo99pD
         Rxkgu//8w00GFx+gfZVL332CoVYe/5nJa+HhCRoMhQtKLAIEo9xqLotIHOJOOC6mihLo
         F2tL3xQDuHmaidJ0Bxzks7UDAI2f/ZLL993tcPPBANe/NN+cZG64O3F5YiED/G451sA7
         sel5mwuVu3LPK7fRpGTI+3PT7finy4s+9SbeqJ+/UtmQZ2gNzNOAG81/MlcjCZzr6SVJ
         2LQW22mRGsJFz4s3oqwDrdGSPNfT05flw3/JYfYd4Sc7rMowU9rvt2Z7G6wFBd2r/Grb
         if3g==
X-Gm-Message-State: AOJu0Yxdukc4i09khnJu3/t/kXh2okIYEYw8PNG4tKxVD07bxD/yF4m+
	wv4qdcofeJmKqd/NQwzjPCKMKhcGLL+vLpm31XyB7X+Wd02jtXJyc7PpmWOLLg==
X-Gm-Gg: AY/fxX5SFdnkVhq42P39BsFtp4vcIjOW3C8Km8lWxPcditzfaumeE8AIN1jMojyxF0F
	x4SGWQkRYhujzOKKiCW7nl+pXPwP0sLYjDigTC1bCt02X+i5VI6lQuaZ4onReYSELYsJtaMRsFT
	fCdp8uNC4um6YanEuM3cZmxoctSY2YyiTYRMeRdhSXkw2AnY6UC1agU1kDQVHOBQD3FPHHO0EC/
	0l672TFC7G1gGpGze8cEl/Qd9TR04A239DC6yuckN7RQ03XxFIK6+kD0+6dQAr0hg5GVPFDml6z
	qXY/FElyBd4ZzbHHsCcVzvGyDlqUTcIjSyPY4V5qeXNr3XLNxcuj+MaNl+W4H3SvPRTpCIaZ1YM
	GRgP/YrU4Rudo97paB+UPgH6DedGp8CjuBRx17p32c1OwtIAH6CVsUc8nFE+CAqVtWdIIsZbcIh
	zhPW1pMWcR0DuRRBjwa4xJzgapQHk4+X9IEhOvy6tFH0r1szk=
X-Google-Smtp-Source: AGHT+IH6YcX00RDj5QlZ1q/Bf9XPGzImIAbIx9XCcPvyGcduSir9CaR9oOtwYCtX+qPARWZYITBmOg==
X-Received: by 2002:a17:907:7f15:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b8037159828mr1213092366b.42.1766434108283;
        Mon, 22 Dec 2025 12:08:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 061/114] python3-maturin: upgrade 1.9.4 -> 1.10.2
Date: Mon, 22 Dec 2025 21:06:43 +0100
Message-ID: <20251222200739.2278706-61-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228387

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-maturin-crates.inc         | 1028 +++++++++--------
 ...rin_1.9.4.bb => python3-maturin_1.10.2.bb} |    2 +-
 2 files changed, 539 insertions(+), 491 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.4.bb => python3-maturin_1.10.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 28551ff4ca..cc83b59754 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -2,747 +2,795 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/adler2/2.0.0 \
-    crate://crates.io/ahash/0.8.11 \
+    crate://crates.io/adler2/2.0.1 \
+    crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/allocator-api2/0.2.18 \
-    crate://crates.io/anstream/0.6.14 \
-    crate://crates.io/anstyle/1.0.7 \
-    crate://crates.io/anstyle-parse/0.2.4 \
-    crate://crates.io/anstyle-query/1.1.0 \
-    crate://crates.io/anstyle-wincon/3.0.3 \
-    crate://crates.io/anyhow/1.0.89 \
-    crate://crates.io/arbitrary/1.4.1 \
-    crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/automod/1.0.14 \
-    crate://crates.io/base64/0.21.7 \
+    crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.4 \
+    crate://crates.io/anstyle-wincon/3.0.10 \
+    crate://crates.io/anyhow/1.0.100 \
+    crate://crates.io/arbitrary/1.4.2 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/automod/1.0.15 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.5.0 \
+    crate://crates.io/bitflags/2.10.0 \
     crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/boxcar/0.2.8 \
-    crate://crates.io/bstr/1.10.0 \
-    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/boxcar/0.2.14 \
+    crate://crates.io/bstr/1.12.0 \
+    crate://crates.io/bumpalo/3.19.0 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/bytes/1.9.0 \
-    crate://crates.io/bytesize/1.3.0 \
-    crate://crates.io/bzip2/0.5.2 \
-    crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
+    crate://crates.io/bytes/1.10.1 \
+    crate://crates.io/bytesize/1.3.3 \
+    crate://crates.io/bzip2/0.6.1 \
     crate://crates.io/cab/0.6.0 \
-    crate://crates.io/camino/1.1.9 \
-    crate://crates.io/cargo-config2/0.1.26 \
-    crate://crates.io/cargo-options/0.7.4 \
-    crate://crates.io/cargo-platform/0.1.8 \
+    crate://crates.io/camino/1.2.1 \
+    crate://crates.io/cargo-config2/0.1.39 \
+    crate://crates.io/cargo-options/0.7.6 \
+    crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-xwin/0.18.6 \
-    crate://crates.io/cargo-zigbuild/0.20.0 \
-    crate://crates.io/cargo_metadata/0.19.0 \
+    crate://crates.io/cargo-zigbuild/0.20.1 \
+    crate://crates.io/cargo_metadata/0.19.2 \
     crate://crates.io/cbindgen/0.29.0 \
-    crate://crates.io/cc/1.2.16 \
+    crate://crates.io/cc/1.2.41 \
     crate://crates.io/cfb/0.10.0 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
     crate://crates.io/chumsky/0.9.3 \
-    crate://crates.io/clap/4.5.7 \
-    crate://crates.io/clap_builder/4.5.7 \
-    crate://crates.io/clap_complete/4.5.5 \
+    crate://crates.io/clap/4.5.49 \
+    crate://crates.io/clap_builder/4.5.49 \
+    crate://crates.io/clap_complete/4.5.59 \
     crate://crates.io/clap_complete_command/0.6.1 \
-    crate://crates.io/clap_complete_nushell/4.5.2 \
-    crate://crates.io/clap_derive/4.5.5 \
-    crate://crates.io/clap_lex/0.7.1 \
-    crate://crates.io/cli-table/0.4.7 \
-    crate://crates.io/colorchoice/1.0.1 \
+    crate://crates.io/clap_complete_nushell/4.5.9 \
+    crate://crates.io/clap_derive/4.5.49 \
+    crate://crates.io/clap_lex/0.7.6 \
+    crate://crates.io/cli-table/0.4.9 \
+    crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/configparser/3.1.0 \
-    crate://crates.io/console/0.15.8 \
+    crate://crates.io/console/0.15.11 \
+    crate://crates.io/console/0.16.1 \
     crate://crates.io/content_inspector/0.2.4 \
     crate://crates.io/core-foundation/0.9.4 \
-    crate://crates.io/core-foundation-sys/0.8.6 \
-    crate://crates.io/cpufeatures/0.2.12 \
-    crate://crates.io/crc/3.2.1 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/crc/3.3.0 \
     crate://crates.io/crc-catalog/2.4.0 \
-    crate://crates.io/crc32fast/1.4.2 \
+    crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/crossbeam-channel/0.5.15 \
-    crate://crates.io/crossbeam-deque/0.8.5 \
+    crate://crates.io/crossbeam-deque/0.8.6 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.20 \
+    crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/data-encoding/2.6.0 \
-    crate://crates.io/deranged/0.3.11 \
-    crate://crates.io/derive_arbitrary/1.4.1 \
+    crate://crates.io/data-encoding/2.9.0 \
+    crate://crates.io/deranged/0.5.4 \
+    crate://crates.io/derive_arbitrary/1.4.2 \
     crate://crates.io/dialoguer/0.11.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dirs/5.0.1 \
     crate://crates.io/dirs-sys/0.4.1 \
     crate://crates.io/displaydoc/0.2.5 \
-    crate://crates.io/dissimilar/1.0.9 \
+    crate://crates.io/dissimilar/1.0.10 \
     crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/dyn-clone/1.0.17 \
-    crate://crates.io/either/1.13.0 \
-    crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/encoding_rs/0.8.34 \
-    crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/errno/0.3.9 \
-    crate://crates.io/expect-test/1.5.0 \
-    crate://crates.io/fastrand/2.1.0 \
+    crate://crates.io/dyn-clone/1.0.20 \
+    crate://crates.io/either/1.15.0 \
+    crate://crates.io/encode_unicode/1.0.0 \
+    crate://crates.io/encoding_rs/0.8.35 \
+    crate://crates.io/env_home/0.1.0 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/expect-test/1.5.1 \
+    crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/fat-macho/0.4.9 \
-    crate://crates.io/filetime/0.2.23 \
-    crate://crates.io/flate2/1.0.33 \
+    crate://crates.io/filetime/0.2.26 \
+    crate://crates.io/find-msvc-tools/0.1.4 \
+    crate://crates.io/flate2/1.1.4 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/form_urlencoded/1.2.1 \
-    crate://crates.io/fs-err/3.0.0 \
+    crate://crates.io/form_urlencoded/1.2.2 \
+    crate://crates.io/fs-err/3.1.3 \
     crate://crates.io/fs4/0.12.0 \
-    crate://crates.io/futures/0.3.30 \
+    crate://crates.io/futures/0.3.31 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
-    crate://crates.io/futures-executor/0.3.30 \
+    crate://crates.io/futures-executor/0.3.31 \
     crate://crates.io/futures-io/0.3.31 \
     crate://crates.io/futures-macro/0.3.31 \
     crate://crates.io/futures-sink/0.3.31 \
     crate://crates.io/futures-task/0.3.31 \
     crate://crates.io/futures-timer/3.0.3 \
     crate://crates.io/futures-util/0.3.31 \
-    crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/generic-array/0.14.9 \
+    crate://crates.io/getrandom/0.2.16 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/glob/0.3.3 \
     crate://crates.io/globset/0.4.16 \
-    crate://crates.io/goblin/0.9.2 \
+    crate://crates.io/goblin/0.9.3 \
     crate://crates.io/hashbrown/0.14.5 \
-    crate://crates.io/hashbrown/0.15.2 \
+    crate://crates.io/hashbrown/0.16.0 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/home/0.5.9 \
-    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/humantime/2.3.0 \
     crate://crates.io/humantime-serde/1.1.1 \
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
-    crate://crates.io/idna/1.0.3 \
-    crate://crates.io/idna_adapter/1.2.0 \
+    crate://crates.io/icu_collections/2.0.0 \
+    crate://crates.io/icu_locale_core/2.0.0 \
+    crate://crates.io/icu_normalizer/2.0.0 \
+    crate://crates.io/icu_normalizer_data/2.0.0 \
+    crate://crates.io/icu_properties/2.0.1 \
+    crate://crates.io/icu_properties_data/2.0.1 \
+    crate://crates.io/icu_provider/2.0.0 \
+    crate://crates.io/idna/1.1.0 \
+    crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/ignore/0.4.23 \
-    crate://crates.io/indexmap/2.6.0 \
-    crate://crates.io/indicatif/0.17.9 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/insta/1.43.1 \
-    crate://crates.io/is_terminal_polyfill/1.70.0 \
-    crate://crates.io/itertools/0.12.1 \
+    crate://crates.io/indexmap/2.12.0 \
+    crate://crates.io/indicatif/0.17.11 \
+    crate://crates.io/indoc/2.0.6 \
+    crate://crates.io/insta/1.43.2 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
     crate://crates.io/itertools/0.13.0 \
-    crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jobserver/0.1.33 \
-    crate://crates.io/js-sys/0.3.73 \
+    crate://crates.io/itertools/0.14.0 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/jobserver/0.1.34 \
+    crate://crates.io/js-sys/0.3.81 \
     crate://crates.io/keyring/2.3.3 \
-    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/lddtree/0.3.7 \
-    crate://crates.io/libc/0.2.172 \
-    crate://crates.io/libmimalloc-sys/0.1.39 \
-    crate://crates.io/libredox/0.1.3 \
+    crate://crates.io/libbz2-rs-sys/0.2.2 \
+    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/libmimalloc-sys/0.1.44 \
+    crate://crates.io/libredox/0.1.10 \
+    crate://crates.io/libz-rs-sys/0.5.2 \
     crate://crates.io/linux-keyutils/0.2.4 \
-    crate://crates.io/linux-raw-sys/0.4.14 \
-    crate://crates.io/litemap/0.7.3 \
-    crate://crates.io/lock_api/0.4.12 \
-    crate://crates.io/lockfree-object-pool/0.1.6 \
-    crate://crates.io/log/0.4.22 \
-    crate://crates.io/lzma-rs/0.3.0 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
+    crate://crates.io/linux-raw-sys/0.11.0 \
+    crate://crates.io/litemap/0.8.0 \
+    crate://crates.io/lock_api/0.4.14 \
+    crate://crates.io/log/0.4.28 \
+    crate://crates.io/lzma-rust2/0.13.0 \
     crate://crates.io/lzma-sys/0.1.20 \
-    crate://crates.io/lzxd/0.2.5 \
-    crate://crates.io/mailparse/0.15.0 \
-    crate://crates.io/matchers/0.1.0 \
-    crate://crates.io/memchr/2.7.4 \
-    crate://crates.io/mimalloc/0.1.43 \
+    crate://crates.io/lzxd/0.2.6 \
+    crate://crates.io/mailparse/0.16.1 \
+    crate://crates.io/matchers/0.2.0 \
+    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/mimalloc/0.1.48 \
     crate://crates.io/mime/0.3.17 \
-    crate://crates.io/mime_guess/2.0.4 \
-    crate://crates.io/minijinja/2.5.0 \
+    crate://crates.io/mime_guess/2.0.5 \
+    crate://crates.io/minijinja/2.12.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.8.0 \
+    crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/msi/0.8.0 \
     crate://crates.io/multipart/0.18.0 \
-    crate://crates.io/native-tls/0.2.12 \
+    crate://crates.io/native-tls/0.2.14 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
-    crate://crates.io/normpath/1.2.0 \
-    crate://crates.io/nu-ansi-term/0.46.0 \
+    crate://crates.io/normpath/1.5.0 \
+    crate://crates.io/nu-ansi-term/0.50.3 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/number_prefix/0.4.0 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.72 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.1 \
+    crate://crates.io/openssl/0.10.74 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-sys/0.9.107 \
+    crate://crates.io/openssl-probe/0.1.6 \
+    crate://crates.io/openssl-sys/0.9.110 \
     crate://crates.io/option-ext/0.2.0 \
-    crate://crates.io/os_pipe/1.2.0 \
-    crate://crates.io/overload/0.1.1 \
-    crate://crates.io/parking_lot/0.12.3 \
-    crate://crates.io/parking_lot_core/0.9.10 \
+    crate://crates.io/os_pipe/1.2.3 \
+    crate://crates.io/parking_lot/0.12.5 \
+    crate://crates.io/parking_lot_core/0.9.12 \
     crate://crates.io/paste/1.0.15 \
     crate://crates.io/path-slash/0.2.1 \
     crate://crates.io/pep440_rs/0.7.3 \
     crate://crates.io/pep508_rs/0.9.2 \
-    crate://crates.io/percent-encoding/2.3.1 \
-    crate://crates.io/pin-project-lite/0.2.15 \
+    crate://crates.io/percent-encoding/2.3.2 \
+    crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/pkg-config/0.3.30 \
+    crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/plain/0.2.3 \
     crate://crates.io/platform-info/2.0.5 \
-    crate://crates.io/portable-atomic/1.6.0 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/potential_utf/0.1.3 \
     crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/pretty_assertions/1.4.1 \
-    crate://crates.io/proc-macro-crate/3.1.0 \
-    crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/psm/0.1.21 \
-    crate://crates.io/pyproject-toml/0.13.5 \
-    crate://crates.io/python-pkginfo/0.6.5 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/quoted_printable/0.5.0 \
-    crate://crates.io/r-efi/5.2.0 \
+    crate://crates.io/proc-macro-crate/3.4.0 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/psm/0.1.27 \
+    crate://crates.io/pyproject-toml/0.13.7 \
+    crate://crates.io/python-pkginfo/0.6.6 \
+    crate://crates.io/quote/1.0.41 \
+    crate://crates.io/quoted_printable/0.5.1 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rayon/1.10.0 \
-    crate://crates.io/rayon-core/1.12.1 \
-    crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/redox_syscall/0.5.1 \
-    crate://crates.io/redox_users/0.4.5 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.1.10 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.6.29 \
-    crate://crates.io/regex-syntax/0.8.5 \
+    crate://crates.io/rayon/1.11.0 \
+    crate://crates.io/rayon-core/1.13.0 \
+    crate://crates.io/redox_syscall/0.5.18 \
+    crate://crates.io/redox_users/0.4.6 \
+    crate://crates.io/ref-cast/1.0.25 \
+    crate://crates.io/ref-cast-impl/1.0.25 \
+    crate://crates.io/regex/1.12.2 \
+    crate://crates.io/regex-automata/0.4.13 \
+    crate://crates.io/regex-syntax/0.8.8 \
     crate://crates.io/relative-path/1.9.3 \
     crate://crates.io/rfc2047-decoder/1.0.6 \
-    crate://crates.io/ring/0.17.13 \
+    crate://crates.io/ring/0.17.14 \
     crate://crates.io/rstest/0.22.0 \
     crate://crates.io/rstest_macros/0.22.0 \
-    crate://crates.io/rustc-hash/2.0.0 \
+    crate://crates.io/rustc-hash/2.1.1 \
     crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustflags/0.1.6 \
-    crate://crates.io/rustix/0.38.41 \
-    crate://crates.io/rustls/0.23.19 \
-    crate://crates.io/rustls-pemfile/2.1.3 \
-    crate://crates.io/rustls-pki-types/1.10.0 \
-    crate://crates.io/rustls-webpki/0.102.8 \
-    crate://crates.io/rustversion/1.0.18 \
-    crate://crates.io/ryu/1.0.18 \
+    crate://crates.io/rustflags/0.1.7 \
+    crate://crates.io/rustix/0.38.44 \
+    crate://crates.io/rustix/1.1.2 \
+    crate://crates.io/rustls/0.23.33 \
+    crate://crates.io/rustls-pemfile/2.2.0 \
+    crate://crates.io/rustls-pki-types/1.12.0 \
+    crate://crates.io/rustls-webpki/0.103.7 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/ryu/1.0.20 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schannel/0.1.23 \
-    crate://crates.io/schemars/0.8.21 \
-    crate://crates.io/schemars_derive/0.8.21 \
+    crate://crates.io/scc/2.4.0 \
+    crate://crates.io/schannel/0.1.28 \
+    crate://crates.io/schemars/1.0.4 \
+    crate://crates.io/schemars_derive/1.0.4 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/scroll/0.12.0 \
-    crate://crates.io/scroll_derive/0.12.0 \
-    crate://crates.io/security-framework/2.11.0 \
-    crate://crates.io/security-framework-sys/2.11.0 \
-    crate://crates.io/semver/1.0.23 \
-    crate://crates.io/serde/1.0.217 \
-    crate://crates.io/serde_derive/1.0.217 \
+    crate://crates.io/scroll_derive/0.12.1 \
+    crate://crates.io/sdd/3.0.10 \
+    crate://crates.io/security-framework/2.11.1 \
+    crate://crates.io/security-framework-sys/2.15.0 \
+    crate://crates.io/semver/1.0.27 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.135 \
-    crate://crates.io/serde_spanned/0.6.8 \
-    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/serde_json/1.0.145 \
+    crate://crates.io/serde_spanned/0.6.9 \
+    crate://crates.io/serde_spanned/1.0.3 \
+    crate://crates.io/serial_test/3.2.0 \
+    crate://crates.io/serial_test_derive/3.2.0 \
+    crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-words/1.1.0 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/simd-adler32/0.3.7 \
-    crate://crates.io/similar/2.5.0 \
-    crate://crates.io/slab/0.4.9 \
-    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/similar/2.7.0 \
+    crate://crates.io/slab/0.4.11 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/snapbox/0.6.16 \
+    crate://crates.io/snapbox/0.6.22 \
     crate://crates.io/snapbox-macros/0.3.10 \
     crate://crates.io/socks/0.3.4 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/stacker/0.1.15 \
+    crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/stacker/0.1.22 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/syn/2.0.90 \
-    crate://crates.io/synstructure/0.13.1 \
-    crate://crates.io/tar/0.4.43 \
-    crate://crates.io/target-lexicon/0.13.1 \
-    crate://crates.io/tempfile/3.11.0 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/syn/2.0.107 \
+    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/tar/0.4.44 \
+    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/tempfile/3.23.0 \
     crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/terminal_size/0.3.0 \
-    crate://crates.io/textwrap/0.16.1 \
+    crate://crates.io/terminal_size/0.4.3 \
+    crate://crates.io/textwrap/0.16.2 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.12 \
+    crate://crates.io/thiserror/2.0.17 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.12 \
-    crate://crates.io/thread_local/1.1.8 \
-    crate://crates.io/time/0.3.36 \
-    crate://crates.io/time-core/0.1.2 \
-    crate://crates.io/time-macros/0.2.18 \
-    crate://crates.io/tinystr/0.7.6 \
-    crate://crates.io/toml/0.8.19 \
-    crate://crates.io/toml_datetime/0.6.8 \
-    crate://crates.io/toml_edit/0.21.1 \
-    crate://crates.io/toml_edit/0.22.22 \
+    crate://crates.io/thiserror-impl/2.0.17 \
+    crate://crates.io/thread_local/1.1.9 \
+    crate://crates.io/time/0.3.44 \
+    crate://crates.io/time-core/0.1.6 \
+    crate://crates.io/time-macros/0.2.24 \
+    crate://crates.io/tinystr/0.8.1 \
+    crate://crates.io/toml/0.8.23 \
+    crate://crates.io/toml/0.9.8 \
+    crate://crates.io/toml_datetime/0.6.11 \
+    crate://crates.io/toml_datetime/0.7.3 \
+    crate://crates.io/toml_edit/0.22.27 \
+    crate://crates.io/toml_edit/0.23.7 \
+    crate://crates.io/toml_parser/1.0.4 \
+    crate://crates.io/toml_write/0.1.2 \
+    crate://crates.io/toml_writer/1.0.4 \
     crate://crates.io/tracing/0.1.41 \
-    crate://crates.io/tracing-attributes/0.1.28 \
-    crate://crates.io/tracing-core/0.1.33 \
+    crate://crates.io/tracing-attributes/0.1.30 \
+    crate://crates.io/tracing-core/0.1.34 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-serde/0.2.0 \
-    crate://crates.io/tracing-subscriber/0.3.19 \
-    crate://crates.io/trycmd/0.15.6 \
+    crate://crates.io/tracing-subscriber/0.3.20 \
+    crate://crates.io/trycmd/0.15.10 \
     crate://crates.io/twox-hash/1.6.3 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicase/2.7.0 \
-    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/typenum/1.19.0 \
+    crate://crates.io/unicase/2.8.1 \
+    crate://crates.io/unicode-ident/1.0.19 \
     crate://crates.io/unicode-linebreak/0.1.5 \
-    crate://crates.io/unicode-width/0.1.13 \
-    crate://crates.io/unicode-width/0.2.0 \
+    crate://crates.io/unicode-width/0.1.14 \
+    crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/ureq/2.11.0 \
-    crate://crates.io/url/2.5.4 \
+    crate://crates.io/ureq/2.12.1 \
+    crate://crates.io/url/2.5.7 \
     crate://crates.io/urlencoding/2.1.3 \
-    crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.8.0 \
-    crate://crates.io/valuable/0.1.0 \
+    crate://crates.io/uuid/1.18.1 \
+    crate://crates.io/valuable/0.1.1 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version-ranges/0.1.1 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/versions/6.2.0 \
-    crate://crates.io/wait-timeout/0.2.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/versions/6.3.2 \
+    crate://crates.io/wait-timeout/0.2.1 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
-    crate://crates.io/wasm-bindgen/0.2.96 \
-    crate://crates.io/wasm-bindgen-backend/0.2.96 \
-    crate://crates.io/wasm-bindgen-macro/0.2.96 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.96 \
-    crate://crates.io/wasm-bindgen-shared/0.2.96 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.104 \
+    crate://crates.io/wasm-bindgen-backend/0.2.104 \
+    crate://crates.io/wasm-bindgen-macro/0.2.104 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.104 \
+    crate://crates.io/wasm-bindgen-shared/0.2.104 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/webpki-roots/0.26.2 \
-    crate://crates.io/which/7.0.0 \
+    crate://crates.io/webpki-roots/0.26.11 \
+    crate://crates.io/webpki-roots/1.0.3 \
+    crate://crates.io/which/7.0.3 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.8 \
+    crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.5 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.5 \
-    crate://crates.io/windows_i686_gnullvm/0.52.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.5 \
-    crate://crates.io/winnow/0.5.40 \
-    crate://crates.io/winnow/0.6.20 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
+    crate://crates.io/winnow/0.7.13 \
     crate://crates.io/winsafe/0.0.19 \
-    crate://crates.io/wit-bindgen-rt/0.39.0 \
-    crate://crates.io/write16/1.0.0 \
-    crate://crates.io/writeable/0.5.5 \
-    crate://crates.io/xattr/1.3.1 \
+    crate://crates.io/wit-bindgen/0.46.0 \
+    crate://crates.io/writeable/0.6.1 \
+    crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xwin/0.6.5 \
     crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yansi/1.0.1 \
-    crate://crates.io/yoke/0.7.4 \
-    crate://crates.io/yoke-derive/0.7.5 \
-    crate://crates.io/zerocopy/0.7.35 \
-    crate://crates.io/zerocopy-derive/0.7.35 \
-    crate://crates.io/zerofrom/0.1.4 \
-    crate://crates.io/zerofrom-derive/0.1.5 \
-    crate://crates.io/zeroize/1.8.1 \
-    crate://crates.io/zerovec/0.10.4 \
-    crate://crates.io/zerovec-derive/0.10.3 \
-    crate://crates.io/zip/2.3.0 \
-    crate://crates.io/zopfli/0.8.1 \
+    crate://crates.io/yoke/0.8.0 \
+    crate://crates.io/yoke-derive/0.8.0 \
+    crate://crates.io/zerocopy/0.8.27 \
+    crate://crates.io/zerocopy-derive/0.8.27 \
+    crate://crates.io/zerofrom/0.1.6 \
+    crate://crates.io/zerofrom-derive/0.1.6 \
+    crate://crates.io/zeroize/1.8.2 \
+    crate://crates.io/zerotrie/0.2.2 \
+    crate://crates.io/zerovec/0.11.4 \
+    crate://crates.io/zerovec-derive/0.11.1 \
+    crate://crates.io/zip/2.4.2 \
+    crate://crates.io/zip/6.0.0 \
+    crate://crates.io/zlib-rs/0.5.2 \
+    crate://crates.io/zopfli/0.8.2 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
+    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
 "
 
-SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
-SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
+SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
+SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[allocator-api2-0.2.18.sha256sum] = "5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f"
-SRC_URI[anstream-0.6.14.sha256sum] = "418c75fa768af9c03be99d17643f93f79bbba589895012a80e3452a19ddda15b"
-SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
-SRC_URI[anstyle-parse-0.2.4.sha256sum] = "c03a11a9034d92058ceb6ee011ce58af4a9bf61491aa7e1e59ecd24bd40d22d4"
-SRC_URI[anstyle-query-1.1.0.sha256sum] = "ad186efb764318d35165f1758e7dcef3b10628e26d41a44bc5550652e6804391"
-SRC_URI[anstyle-wincon-3.0.3.sha256sum] = "61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19"
-SRC_URI[anyhow-1.0.89.sha256sum] = "86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6"
-SRC_URI[arbitrary-1.4.1.sha256sum] = "dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[automod-1.0.14.sha256sum] = "edf3ee19dbc0a46d740f6f0926bde8c50f02bdbc7b536842da28f6ac56513a8b"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
+SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
+SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.4.sha256sum] = "9e231f6134f61b71076a3eab506c379d4f36122f2af15a9ff04415ea4c3339e2"
+SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a"
+SRC_URI[anyhow-1.0.100.sha256sum] = "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
+SRC_URI[arbitrary-1.4.2.sha256sum] = "c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[automod-1.0.15.sha256sum] = "ebb4bd301db2e2ca1f5be131c24eb8ebf2d9559bc3744419e93baf8ddea7e670"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[boxcar-0.2.8.sha256sum] = "2721c3c5a6f0e7f7e607125d963fedeb765f545f67adc9d71ed934693881eb42"
-SRC_URI[bstr-1.10.0.sha256sum] = "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
-SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
+SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
+SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[bytes-1.9.0.sha256sum] = "325918d6fe32f23b19878fe4b34794ae41fc19ddbe53b10571a4874d44ffd39b"
-SRC_URI[bytesize-1.3.0.sha256sum] = "a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc"
-SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
-SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
+SRC_URI[bytes-1.10.1.sha256sum] = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a"
+SRC_URI[bytesize-1.3.3.sha256sum] = "2e93abca9e28e0a1b9877922aacb20576e05d4679ffa78c3d6dc22a26a216659"
+SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c"
 SRC_URI[cab-0.6.0.sha256sum] = "171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2"
-SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3"
-SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
-SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
-SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
+SRC_URI[camino-1.2.1.sha256sum] = "276a59bf2b2c967788139340c9f0c5b12d7fd6630315c15c217e559de85d2609"
+SRC_URI[cargo-config2-0.1.39.sha256sum] = "3795d3a48839a46854805f56c8fe9c558f10804bcf57df53925ca843d87c788f"
+SRC_URI[cargo-options-0.7.6.sha256sum] = "f89e1d6d6f65fe04d5e21be9de19d31a074e3b7e43aa39ee5b85f4cee16c3188"
+SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-xwin-0.18.6.sha256sum] = "5dff83aad332bd6ee29072dd874b48892cd22c58e233c25735eb4417b3999685"
-SRC_URI[cargo-zigbuild-0.20.0.sha256sum] = "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
-SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
+SRC_URI[cargo-zigbuild-0.20.1.sha256sum] = "a9584d77470f7ffea2fb67fbcc9e8dbe9fa79a80dafd579a83507c0a08d1f658"
+SRC_URI[cargo_metadata-0.19.2.sha256sum] = "dd5eb614ed4c27c5d706420e4320fbe3216ab31fa1c33cd8246ac36dae4479ba"
 SRC_URI[cbindgen-0.29.0.sha256sum] = "975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684"
-SRC_URI[cc-1.2.16.sha256sum] = "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
+SRC_URI[cc-1.2.41.sha256sum] = "ac9fe6cdbb24b6ade63616c0a0688e45bb56732262c158df3c0c4bea4ca47cb7"
 SRC_URI[cfb-0.10.0.sha256sum] = "d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
 SRC_URI[chumsky-0.9.3.sha256sum] = "8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9"
-SRC_URI[clap-4.5.7.sha256sum] = "5db83dced34638ad474f39f250d7fea9598bdd239eaced1bdf45d597da0f433f"
-SRC_URI[clap_builder-4.5.7.sha256sum] = "f7e204572485eb3fbf28f871612191521df159bc3e15a9f5064c66dba3a8c05f"
-SRC_URI[clap_complete-4.5.5.sha256sum] = "d2020fa13af48afc65a9a87335bda648309ab3d154cd03c7ff95b378c7ed39c4"
+SRC_URI[clap-4.5.49.sha256sum] = "f4512b90fa68d3a9932cea5184017c5d200f5921df706d45e853537dea51508f"
+SRC_URI[clap_builder-4.5.49.sha256sum] = "0025e98baa12e766c67ba13ff4695a887a1eba19569aad00a472546795bd6730"
+SRC_URI[clap_complete-4.5.59.sha256sum] = "2348487adcd4631696ced64ccdb40d38ac4d31cae7f2eec8817fcea1b9d1c43c"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
-SRC_URI[clap_complete_nushell-4.5.2.sha256sum] = "1accf1b463dee0d3ab2be72591dccdab8bef314958340447c882c4c72acfe2a3"
-SRC_URI[clap_derive-4.5.5.sha256sum] = "c780290ccf4fb26629baa7a1081e68ced113f1d3ec302fa5948f1c381ebf06c6"
-SRC_URI[clap_lex-0.7.1.sha256sum] = "4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70"
-SRC_URI[cli-table-0.4.7.sha256sum] = "adfbb116d9e2c4be7011360d0c0bee565712c11e969c9609b25b619366dc379d"
-SRC_URI[colorchoice-1.0.1.sha256sum] = "0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422"
+SRC_URI[clap_complete_nushell-4.5.9.sha256sum] = "811159f339691baacdf7d534df2946b9d217014081099e23d31d887d99521e70"
+SRC_URI[clap_derive-4.5.49.sha256sum] = "2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671"
+SRC_URI[clap_lex-0.7.6.sha256sum] = "a1d728cc89cf3aee9ff92b05e62b19ee65a02b5702cff7d5a377e32c6ae29d8d"
+SRC_URI[cli-table-0.4.9.sha256sum] = "b53f9241f288a7b12c56565f04aaeaeeab6b8923d42d99255d4ca428b4d97f89"
+SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[configparser-3.1.0.sha256sum] = "e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b"
-SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
+SRC_URI[console-0.15.11.sha256sum] = "054ccb5b10f9f2cbf51eb355ca1d05c2d279ce1804688d0db74b4733a5aeafd8"
+SRC_URI[console-0.16.1.sha256sum] = "b430743a6eb14e9764d4260d4c0d8123087d504eeb9c48f2b2a5e810dd369df4"
 SRC_URI[content_inspector-0.2.4.sha256sum] = "b7bda66e858c683005a53a9a60c69a4aca7eeaa45d124526e389f7aec8e62f38"
 SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
-SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
-SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
-SRC_URI[crc-3.2.1.sha256sum] = "69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[crc-3.3.0.sha256sum] = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
 SRC_URI[crc-catalog-2.4.0.sha256sum] = "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
-SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
+SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
 SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
-SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
+SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.20.sha256sum] = "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
-SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
-SRC_URI[derive_arbitrary-1.4.1.sha256sum] = "30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800"
+SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476"
+SRC_URI[deranged-0.5.4.sha256sum] = "a41953f86f8a05768a6cda24def994fd2f424b04ec5c719cf89989779f199071"
+SRC_URI[derive_arbitrary-1.4.2.sha256sum] = "1e567bd82dcff979e4b03460c307b3cdc9e96fde3d73bed1496d2bc75d9dd62a"
 SRC_URI[dialoguer-0.11.0.sha256sum] = "658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dirs-5.0.1.sha256sum] = "44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225"
 SRC_URI[dirs-sys-0.4.1.sha256sum] = "520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
-SRC_URI[dissimilar-1.0.9.sha256sum] = "59f8e79d1fbf76bdfbde321e902714bf6c49df88a7dda6fc682fc2979226962d"
+SRC_URI[dissimilar-1.0.10.sha256sum] = "8975ffdaa0ef3661bfe02dbdcc06c9f829dfafe6a3c474de366a8d5e44276921"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
-SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
-SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
-SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[encoding_rs-0.8.34.sha256sum] = "b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59"
-SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
-SRC_URI[expect-test-1.5.0.sha256sum] = "9e0be0a561335815e06dab7c62e50353134c796e7a6155402a64bcff66b6a5e0"
-SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
+SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
+SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
+SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
+SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
+SRC_URI[env_home-0.1.0.sha256sum] = "c7f84e12ccf0a7ddc17a6c41c93326024c42920d7ee630d04950e6926645c0fe"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[expect-test-1.5.1.sha256sum] = "63af43ff4431e848fb47472a920f14fa71c24de13255a5692e93d4e90302acb0"
+SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[fat-macho-0.4.9.sha256sum] = "4c9c45caa6c6edfaee4cb3bd84ea9686e115df7f0efb530e15fb466eccb0b345"
-SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
-SRC_URI[flate2-1.0.33.sha256sum] = "324a1be68054ef05ad64b861cc9eaf1d623d2d8cb25b4bf2cb9cdd902b4bf253"
+SRC_URI[filetime-0.2.26.sha256sum] = "bc0505cd1b6fa6580283f6bdf70a73fcf4aba1184038c90902b92b3dd0df63ed"
+SRC_URI[find-msvc-tools-0.1.4.sha256sum] = "52051878f80a721bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
+SRC_URI[flate2-1.1.4.sha256sum] = "dc5a4e564e38c699f2880d3fda590bedc2e69f3f84cd48b457bd892ce61d0aa9"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
-SRC_URI[fs-err-3.0.0.sha256sum] = "8bb60e7409f34ef959985bc9d9c5ee8f5db24ee46ed9775850548021710f807f"
+SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
+SRC_URI[fs-err-3.1.3.sha256sum] = "6ad492b2cf1d89d568a43508ab24f98501fe03f2f31c01e1d0fe7366a71745d2"
 SRC_URI[fs4-0.12.0.sha256sum] = "c29c30684418547d476f0b48e84f4821639119c483b1eccd566c8cd0cd05f521"
-SRC_URI[futures-0.3.30.sha256sum] = "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
+SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
-SRC_URI[futures-executor-0.3.30.sha256sum] = "a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
+SRC_URI[futures-executor-0.3.31.sha256sum] = "1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f"
 SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
 SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
 SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
 SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
 SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
 SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
-SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[generic-array-0.14.9.sha256sum] = "4bb6743198531e02858aeaea5398fcc883e71851fcbcb5a2f773e2fb6cb1edf2"
+SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[globset-0.4.16.sha256sum] = "54a1028dfc5f5df5da8a56a73e6c153c9a9708ec57232470703592a3f18e49f5"
-SRC_URI[goblin-0.9.2.sha256sum] = "53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923"
+SRC_URI[goblin-0.9.3.sha256sum] = "daa0a64d21a7eb230583b4c5f4e23b7e4e57974f96620f42a7e75e08ae66d745"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
-SRC_URI[hashbrown-0.15.2.sha256sum] = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
+SRC_URI[hashbrown-0.16.0.sha256sum] = "5419bdc4f6a9207fbeba6d11b604d481addf78ecd10c11ad51e76c2f6482748d"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
-SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[humantime-2.3.0.sha256sum] = "135b12329e5e3ce057a9f972339ea52bc954fe1e9358ef27f95e89716fbc5424"
 SRC_URI[humantime-serde-1.1.1.sha256sum] = "57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c"
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
-SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
-SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
+SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
+SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
+SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
+SRC_URI[icu_normalizer_data-2.0.0.sha256sum] = "00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3"
+SRC_URI[icu_properties-2.0.1.sha256sum] = "016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b"
+SRC_URI[icu_properties_data-2.0.1.sha256sum] = "298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632"
+SRC_URI[icu_provider-2.0.0.sha256sum] = "03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af"
+SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
+SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
-SRC_URI[indexmap-2.6.0.sha256sum] = "707907fe3c25f5424cce2cb7e1cbcafee6bdbe735ca90ef77c29e84591e5b9da"
-SRC_URI[indicatif-0.17.9.sha256sum] = "cbf675b85ed934d3c67b5c5469701eec7db22689d0a2139d856e0925fa28b281"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[insta-1.43.1.sha256sum] = "154934ea70c58054b556dd430b99a98c2a7ff5309ac9891597e339b5c28f4371"
-SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] = "f8478577c03552c21db0e2724ffb8986a5ce7af88107e6be5d2ee6e158c12800"
-SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
+SRC_URI[indexmap-2.12.0.sha256sum] = "6717a8d2a5a929a1a2eb43a12812498ed141a0bcfb7e8f7844fbdbe4303bba9f"
+SRC_URI[indicatif-0.17.11.sha256sum] = "183b3088984b400f4cfac3620d5e076c84da5364016b4f49473de574b2586235"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
+SRC_URI[insta-1.43.2.sha256sum] = "46fdb647ebde000f43b5b53f773c30cf9b0cb4300453208713fa38b2c70935a0"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
-SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jobserver-0.1.33.sha256sum] = "38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a"
-SRC_URI[js-sys-0.3.73.sha256sum] = "fb15147158e79fd8b8afd0252522769c4f48725460b37338544d8379d94fc8f9"
+SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
+SRC_URI[js-sys-0.3.81.sha256sum] = "ec48937a97411dcb524a265206ccd4c90bb711fca92b2792c407f268825b9305"
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
-SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[lddtree-0.3.7.sha256sum] = "e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
-SRC_URI[libmimalloc-sys-0.1.39.sha256sum] = "23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44"
-SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
+SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
+SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
+SRC_URI[libredox-0.1.10.sha256sum] = "416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb"
+SRC_URI[libz-rs-sys-0.5.2.sha256sum] = "840db8cf39d9ec4dd794376f38acc40d0fc65eec2a8f484f7fd375b84602becd"
 SRC_URI[linux-keyutils-0.2.4.sha256sum] = "761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
-SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
-SRC_URI[lockfree-object-pool-0.1.6.sha256sum] = "9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e"
-SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
-SRC_URI[lzma-rs-0.3.0.sha256sum] = "297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
+SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
+SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
+SRC_URI[lzma-rust2-0.13.0.sha256sum] = "c60a23ffb90d527e23192f1246b14746e2f7f071cb84476dd879071696c18a4a"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
-SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
-SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
-SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
-SRC_URI[mimalloc-0.1.43.sha256sum] = "68914350ae34959d83f732418d51e2427a794055d0b9529f48259ac07af65633"
+SRC_URI[lzxd-0.2.6.sha256sum] = "7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9"
+SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
+SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[mimalloc-0.1.48.sha256sum] = "e1ee66a4b64c74f4ef288bcbb9192ad9c3feaad75193129ac8509af543894fd8"
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
-SRC_URI[mime_guess-2.0.4.sha256sum] = "4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef"
-SRC_URI[minijinja-2.5.0.sha256sum] = "2c37e1b517d1dcd0e51dc36c4567b9d5a29262b3ec8da6cb5d35e27a8fb529b5"
+SRC_URI[mime_guess-2.0.5.sha256sum] = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
+SRC_URI[minijinja-2.12.0.sha256sum] = "a9f264d75233323f4b7d2f03aefe8a990690cdebfbfe26ea86bcbaec5e9ac990"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.8.0.sha256sum] = "e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1"
+SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[msi-0.8.0.sha256sum] = "4a2332f87a064dea9cce571408c879e0da8dc193b3af06a2b3b2604ee4182a32"
 SRC_URI[multipart-0.18.0.sha256sum] = "00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182"
-SRC_URI[native-tls-0.2.12.sha256sum] = "a8614eb2c83d59d1c8cc974dd3f920198647674a0a035e1af1fa58707e317466"
+SRC_URI[native-tls-0.2.14.sha256sum] = "87de3442987e9dbec73158d5c715e7ad9072fda936bb03d19d7fa10e00520f0e"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
-SRC_URI[normpath-1.2.0.sha256sum] = "5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804"
-SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
+SRC_URI[normpath-1.5.0.sha256sum] = "bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b"
+SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
+SRC_URI[openssl-0.10.74.sha256sum] = "24ad14dd45412269e1a30f52ad8f0664f0f4f4a89ee8fe28c3b3527021ebb654"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-sys-0.9.107.sha256sum] = "8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07"
+SRC_URI[openssl-probe-0.1.6.sha256sum] = "d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e"
+SRC_URI[openssl-sys-0.9.110.sha256sum] = "0a9f0075ba3c21b09f8e8b2026584b1d18d49388648f2fbbf3c97ea8deced8e2"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
-SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
-SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
-SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
-SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
+SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
+SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
+SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
 SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
 SRC_URI[path-slash-0.2.1.sha256sum] = "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
 SRC_URI[pep440_rs-0.7.3.sha256sum] = "31095ca1f396e3de32745f42b20deef7bc09077f918b085307e8eab6ddd8fb9c"
 SRC_URI[pep508_rs-0.9.2.sha256sum] = "faee7227064121fcadcd2ff788ea26f0d8f2bd23a0574da11eca23bc935bcc05"
-SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
-SRC_URI[pin-project-lite-0.2.15.sha256sum] = "915a1e146535de9163f3987b8944ed8cf49a18bb0056bcebcdcece385cece4ff"
+SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
+SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
+SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
 SRC_URI[platform-info-2.0.5.sha256sum] = "7539aeb3fdd8cb4f6a331307cf71a1039cee75e94e8a71725b9484f4a0d9451a"
-SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[potential_utf-0.1.3.sha256sum] = "84df19adbe5b5a0782edcab45899906947ab039ccf4573713735ee7de1e6b08a"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
-SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
-SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
-SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[psm-0.1.21.sha256sum] = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874"
-SRC_URI[pyproject-toml-0.13.5.sha256sum] = "7b0f6160dc48298b9260d9b958ad1d7f96f6cd0b9df200b22329204e09334663"
-SRC_URI[python-pkginfo-0.6.5.sha256sum] = "c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600"
-SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
-SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
-SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
+SRC_URI[proc-macro-crate-3.4.0.sha256sum] = "219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[psm-0.1.27.sha256sum] = "e66fcd288453b748497d8fb18bccc83a16b0518e3906d4b8df0a8d42d93dbb1c"
+SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
+SRC_URI[python-pkginfo-0.6.6.sha256sum] = "464e5e2e0fb6c8c2c7aedc0cd6615258a3def4e34b417f6bf8835e76e7d441d4"
+SRC_URI[quote-1.0.41.sha256sum] = "ce25767e7b499d1b604768e7cde645d14cc8584231ea6b295e9c9eb22c02e1d1"
+SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rayon-1.10.0.sha256sum] = "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
-SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
-SRC_URI[redox_users-0.4.5.sha256sum] = "bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
-SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[rayon-1.11.0.sha256sum] = "368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f"
+SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
+SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
+SRC_URI[redox_users-0.4.6.sha256sum] = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
+SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
+SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
+SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
 SRC_URI[rfc2047-decoder-1.0.6.sha256sum] = "bc36545d1021456a751b573517cb52e8c339b2f662e6b2778ef629282678de29"
-SRC_URI[ring-0.17.13.sha256sum] = "70ac5d832aa16abd7d1def883a8545280c20a60f523a370aa3a9617c2b8550ee"
+SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
 SRC_URI[rstest-0.22.0.sha256sum] = "7b423f0e62bdd61734b67cd21ff50871dfaeb9cc74f869dcd6af974fbcb19936"
 SRC_URI[rstest_macros-0.22.0.sha256sum] = "c5e1711e7d14f74b12a58411c542185ef7fb7f2e7f8ee6e2940a883628522b42"
-SRC_URI[rustc-hash-2.0.0.sha256sum] = "583034fd73374156e66797ed8e5b0d5690409c9226b22d87cb7f19821c05d152"
+SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustflags-0.1.6.sha256sum] = "d7fc92159fb50a431c5da366f7627751fe7263cf867f8a30f27fa6063ba02ac0"
-SRC_URI[rustix-0.38.41.sha256sum] = "d7f649912bc1495e167a6edee79151c84b1bad49748cb4f1f1167f459f6224f6"
-SRC_URI[rustls-0.23.19.sha256sum] = "934b404430bb06b3fae2cba809eb45a1ab1aecd64491213d7c3301b88393f8d1"
-SRC_URI[rustls-pemfile-2.1.3.sha256sum] = "196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425"
-SRC_URI[rustls-pki-types-1.10.0.sha256sum] = "16f1201b3c9a7ee8039bcadc17b7e605e2945b27eee7631788c1bd2b0643674b"
-SRC_URI[rustls-webpki-0.102.8.sha256sum] = "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
-SRC_URI[rustversion-1.0.18.sha256sum] = "0e819f2bc632f285be6d7cd36e25940d45b2391dd6d9b939e79de557f7014248"
-SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
+SRC_URI[rustflags-0.1.7.sha256sum] = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
+SRC_URI[rustix-1.1.2.sha256sum] = "cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e"
+SRC_URI[rustls-0.23.33.sha256sum] = "751e04a496ca00bb97a5e043158d23d66b5aabf2e1d5aa2a0aaebb1aafe6f82c"
+SRC_URI[rustls-pemfile-2.2.0.sha256sum] = "dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50"
+SRC_URI[rustls-pki-types-1.12.0.sha256sum] = "229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79"
+SRC_URI[rustls-webpki-0.103.7.sha256sum] = "e10b3f4191e8a80e6b43eebabfac91e5dcecebb27a71f04e820c47ec41d314bf"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schannel-0.1.23.sha256sum] = "fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534"
-SRC_URI[schemars-0.8.21.sha256sum] = "09c024468a378b7e36765cd36702b7a90cc3cba11654f6685c8f233408e89e92"
-SRC_URI[schemars_derive-0.8.21.sha256sum] = "b1eee588578aff73f856ab961cd2f79e36bc45d7ded33a7562adba4667aecc0e"
+SRC_URI[scc-2.4.0.sha256sum] = "46e6f046b7fef48e2660c57ed794263155d713de679057f2d0c169bfc6e756cc"
+SRC_URI[schannel-0.1.28.sha256sum] = "891d81b926048e76efe18581bf793546b4c0eaf8448d72be8de2bbee5fd166e1"
+SRC_URI[schemars-1.0.4.sha256sum] = "82d20c4491bc164fa2f6c5d44565947a52ad80b9505d8e36f8d54c27c739fcd0"
+SRC_URI[schemars_derive-1.0.4.sha256sum] = "33d020396d1d138dc19f1165df7545479dcd58d93810dc5d646a16e55abefa80"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[scroll-0.12.0.sha256sum] = "6ab8598aa408498679922eff7fa985c25d58a90771bd6be794434c5277eab1a6"
-SRC_URI[scroll_derive-0.12.0.sha256sum] = "7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141a85313b1cb932"
-SRC_URI[security-framework-2.11.0.sha256sum] = "c627723fd09706bacdb5cf41499e95098555af3c3c29d014dc3c458ef6be11c0"
-SRC_URI[security-framework-sys-2.11.0.sha256sum] = "317936bbbd05227752583946b9e66d7ce3b489f84e11a94a510b4437fef407d7"
-SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
-SRC_URI[serde-1.0.217.sha256sum] = "02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70"
-SRC_URI[serde_derive-1.0.217.sha256sum] = "5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0"
+SRC_URI[scroll_derive-0.12.1.sha256sum] = "1783eabc414609e28a5ba76aee5ddd52199f7107a0b24c2e9746a1ecc34a683d"
+SRC_URI[sdd-3.0.10.sha256sum] = "490dcfcbfef26be6800d11870ff2df8774fa6e86d047e3e8c8a76b25655e41ca"
+SRC_URI[security-framework-2.11.1.sha256sum] = "897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02"
+SRC_URI[security-framework-sys-2.15.0.sha256sum] = "cc1f0cbffaac4852523ce30d8bd3c5cdc873501d96ff467ca09b6767bb8cd5c0"
+SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.135.sha256sum] = "2b0d7ba2887406110130a978386c4e1befb98c674b4fba677954e4db976630d9"
-SRC_URI[serde_spanned-0.6.8.sha256sum] = "87607cb1398ed59d48732e575a4c28a7a8ebf2454b964fe3f224f2afc07909e1"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[serde_spanned-0.6.9.sha256sum] = "bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3"
+SRC_URI[serde_spanned-1.0.3.sha256sum] = "e24345aa0fe688594e73770a5f6d1b216508b4f93484c0026d521acd30134392"
+SRC_URI[serial_test-3.2.0.sha256sum] = "1b258109f244e1d6891bf1053a55d63a5cd4f8f4c30cf9a1280989f80e7a1fa9"
+SRC_URI[serial_test_derive-3.2.0.sha256sum] = "5d69265a08751de7844521fd15003ae0a888e035773ba05695c5c759a6f89eef"
+SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-words-1.1.0.sha256sum] = "24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[simd-adler32-0.3.7.sha256sum] = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
-SRC_URI[similar-2.5.0.sha256sum] = "fa42c91313f1d05da9b26f267f931cf178d4aba455b4c4622dd7355eb80c6640"
-SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
+SRC_URI[slab-0.4.11.sha256sum] = "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
-SRC_URI[snapbox-0.6.16.sha256sum] = "027c936207f85d10d015e21faf5c676c7e08c453ed371adf55c0874c443ca77a"
+SRC_URI[snapbox-0.6.22.sha256sum] = "805d09a74586d9b17061e5be6ee5f8cc37e5982c349948114ffc5f68093fe5ec"
 SRC_URI[snapbox-macros-0.3.10.sha256sum] = "16569f53ca23a41bb6f62e0a5084aa1661f4814a67fa33696a79073e03a664af"
 SRC_URI[socks-0.3.4.sha256sum] = "f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b"
-SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
-SRC_URI[stacker-0.1.15.sha256sum] = "c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce"
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[stacker-0.1.22.sha256sum] = "e1f8b29fb42aafcea4edeeb6b2f2d7ecd0d969c48b4cf0d2e64aafc471dd6e59"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-2.0.90.sha256sum] = "919d3b74a5dd0ccd15aeb8f93e7006bd9e14c295087c9896a110f490752bcf31"
-SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
-SRC_URI[tar-0.4.43.sha256sum] = "c65998313f8e17d0d553d28f91a0df93e4dbbbf770279c7bc21ca0f09ea1a1f6"
-SRC_URI[target-lexicon-0.13.1.sha256sum] = "dc12939a1c9b9d391e0b7135f72fd30508b73450753e28341fed159317582a77"
-SRC_URI[tempfile-3.11.0.sha256sum] = "b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53"
+SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+SRC_URI[syn-2.0.107.sha256sum] = "2a26dbd934e5451d21ef060c018dae56fc073894c5a7896f882928a76e6d081b"
+SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[tempfile-3.23.0.sha256sum] = "2d31c77bdf42a745371d260a26ca7163f1e0924b64afa0b688e61b5a9fa02f16"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
-SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
+SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
+SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.12.sha256sum] = "567b8a2dae586314f7be2a752ec7474332959c6460e02bde30d702a66d488708"
+SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.12.sha256sum] = "7f7cf42b4507d8ea322120659672cf1b9dbb93f8f2d4ecfd6e51350ff5b17a1d"
-SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
-SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
-SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
-SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
-SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
-SRC_URI[toml-0.8.19.sha256sum] = "a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e"
-SRC_URI[toml_datetime-0.6.8.sha256sum] = "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
-SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
-SRC_URI[toml_edit-0.22.22.sha256sum] = "4ae48d6208a266e853d946088ed816055e556cc6028c5e8e2b84d9fa5dd7c7f5"
+SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
+SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
+SRC_URI[time-0.3.44.sha256sum] = "91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d"
+SRC_URI[time-core-0.1.6.sha256sum] = "40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b"
+SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3"
+SRC_URI[tinystr-0.8.1.sha256sum] = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
+SRC_URI[toml-0.8.23.sha256sum] = "dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362"
+SRC_URI[toml-0.9.8.sha256sum] = "f0dc8b1fb61449e27716ec0e1bdf0f6b8f3e8f6b05391e8497b8b6d7804ea6d8"
+SRC_URI[toml_datetime-0.6.11.sha256sum] = "22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
+SRC_URI[toml_datetime-0.7.3.sha256sum] = "f2cdb639ebbc97961c51720f858597f7f24c4fc295327923af55b74c3c724533"
+SRC_URI[toml_edit-0.22.27.sha256sum] = "41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a"
+SRC_URI[toml_edit-0.23.7.sha256sum] = "6485ef6d0d9b5d0ec17244ff7eb05310113c3f316f2d14200d4de56b3cb98f8d"
+SRC_URI[toml_parser-1.0.4.sha256sum] = "c0cbe268d35bdb4bb5a56a2de88d0ad0eb70af5384a99d648cd4b3d04039800e"
+SRC_URI[toml_write-0.1.2.sha256sum] = "5d99f8c9a7727884afe522e9bd5edbfc91a3312b36a77b5fb8926e4c31a41801"
+SRC_URI[toml_writer-1.0.4.sha256sum] = "df8b2b54733674ad286d16267dcfc7a71ed5c776e4ac7aa3c3e2561f7c637bf2"
 SRC_URI[tracing-0.1.41.sha256sum] = "784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0"
-SRC_URI[tracing-attributes-0.1.28.sha256sum] = "395ae124c09f9e6918a2310af6038fba074bcf474ac352496d5910dd59a2226d"
-SRC_URI[tracing-core-0.1.33.sha256sum] = "e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c"
+SRC_URI[tracing-attributes-0.1.30.sha256sum] = "81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903"
+SRC_URI[tracing-core-0.1.34.sha256sum] = "b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee5088f83d1dd7ee6f6246fc6ff1"
-SRC_URI[tracing-subscriber-0.3.19.sha256sum] = "e8189decb5ac0fa7bc8b96b7cb9b2701d60d48805aca84a238004d665fcc4008"
-SRC_URI[trycmd-0.15.6.sha256sum] = "3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84237ce83d5a28e2befa12"
+SRC_URI[tracing-subscriber-0.3.20.sha256sum] = "2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5"
+SRC_URI[trycmd-0.15.10.sha256sum] = "659488a954e37cc663704c169f829952c49b315e2fe5fd375508baffa698f106"
 SRC_URI[twox-hash-1.6.3.sha256sum] = "97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicase-2.7.0.sha256sum] = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
+SRC_URI[unicase-2.8.1.sha256sum] = "75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539"
+SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
-SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
-SRC_URI[unicode-width-0.2.0.sha256sum] = "1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd"
+SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
+SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[ureq-2.11.0.sha256sum] = "b30e6f97efe1fa43535ee241ee76967d3ff6ff3953ebb430d8d55c5393029e7b"
-SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
+SRC_URI[ureq-2.12.1.sha256sum] = "02d1a66277ed75f640d608235660df48c8e3c19f3b4edb6a263315626cc3c01d"
+SRC_URI[url-2.5.7.sha256sum] = "08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b"
 SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
-SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.8.0.sha256sum] = "a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0"
-SRC_URI[valuable-0.1.0.sha256sum] = "830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d"
+SRC_URI[uuid-1.18.1.sha256sum] = "2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2"
+SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[versions-6.2.0.sha256sum] = "38a8931f8d167b6448076020e70b9de46dcf5ea1731212481a092d0071c4ac5b"
-SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[versions-6.3.2.sha256sum] = "f25d498b63d1fdb376b4250f39ab3a5ee8d103957346abacd911e2d8b612c139"
+SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
-SRC_URI[wasm-bindgen-0.2.96.sha256sum] = "21d3b25c3ea1126a2ad5f4f9068483c2af1e64168f847abe863a526b8dbfe00b"
-SRC_URI[wasm-bindgen-backend-0.2.96.sha256sum] = "52857d4c32e496dc6537646b5b117081e71fd2ff06de792e3577a150627db283"
-SRC_URI[wasm-bindgen-macro-0.2.96.sha256sum] = "920b0ffe069571ebbfc9ddc0b36ba305ef65577c94b06262ed793716a1afd981"
-SRC_URI[wasm-bindgen-macro-support-0.2.96.sha256sum] = "bf59002391099644be3524e23b781fa43d2be0c5aa0719a18c0731b9d195cab6"
-SRC_URI[wasm-bindgen-shared-0.2.96.sha256sum] = "e5047c5392700766601942795a436d7d2599af60dcc3cc1248c9120bfb0827b0"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wasm-bindgen-0.2.104.sha256sum] = "c1da10c01ae9f1ae40cbfac0bac3b1e724b320abfcf52229f80b547c0d250e2d"
+SRC_URI[wasm-bindgen-backend-0.2.104.sha256sum] = "671c9a5a66f49d8a47345ab942e2cb93c7d1d0339065d4f8139c486121b43b19"
+SRC_URI[wasm-bindgen-macro-0.2.104.sha256sum] = "7ca60477e4c59f5f2986c50191cd972e3a50d8a95603bc9434501cf156a9a119"
+SRC_URI[wasm-bindgen-macro-support-0.2.104.sha256sum] = "9f07d2f20d4da7b26400c9f4a0511e6e0345b040694e8a75bd41d578fa4421d7"
+SRC_URI[wasm-bindgen-shared-0.2.104.sha256sum] = "bad67dc8b2a1a6e5448428adec4c3e84c43e561d8c9ee8a9e5aabeb193ec41d1"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[webpki-roots-0.26.2.sha256sum] = "3c452ad30530b54a4d8e71952716a212b08efd0f3562baa66c29a618b07da7c3"
-SRC_URI[which-7.0.0.sha256sum] = "c9cad3279ade7346b96e38731a641d7343dd6a53d55083dd54eadfa5a1b38c6b"
+SRC_URI[webpki-roots-0.26.11.sha256sum] = "521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9"
+SRC_URI[webpki-roots-1.0.3.sha256sum] = "32b130c0d2d49f8b6889abc456e795e82525204f27c42cf767cf0d7734e089b8"
+SRC_URI[which-7.0.3.sha256sum] = "24d643ce3fd3e5b54854602a080f34fb10ab75e0b813ee32d00ca2b44fa74762"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
+SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
-SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
-SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
-SRC_URI[winnow-0.6.20.sha256sum] = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
+SRC_URI[winnow-0.7.13.sha256sum] = "21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
-SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
-SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
-SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
-SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
+SRC_URI[writeable-0.6.1.sha256sum] = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
+SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[xwin-0.6.5.sha256sum] = "ca7e4546db1514c186778f0a257d89732ed9ed75587d0953ac25be7519d9f0d1"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
-SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
-SRC_URI[yoke-derive-0.7.5.sha256sum] = "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154"
-SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
-SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
-SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
-SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808"
-SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
-SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
-SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
-SRC_URI[zip-2.3.0.sha256sum] = "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
-SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
+SRC_URI[yoke-0.8.0.sha256sum] = "5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc"
+SRC_URI[yoke-derive-0.8.0.sha256sum] = "38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6"
+SRC_URI[zerocopy-0.8.27.sha256sum] = "0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c"
+SRC_URI[zerocopy-derive-0.8.27.sha256sum] = "88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831"
+SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
+SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
+SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
+SRC_URI[zerotrie-0.2.2.sha256sum] = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
+SRC_URI[zerovec-0.11.4.sha256sum] = "e7aa2bd55086f1ab526693ecbe444205da57e25f4489879da80635a46d90e73b"
+SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
+SRC_URI[zip-2.4.2.sha256sum] = "fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50"
+SRC_URI[zip-6.0.0.sha256sum] = "eb2a05c7c36fde6c09b08576c9f7fb4cda705990f73b58fe011abf7dfb24168b"
+SRC_URI[zlib-rs-0.5.2.sha256sum] = "2f06ae92f42f5e5c42443fd094f245eb656abf56dd7cce9b8b263236565e00f2"
+SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.15+zstd.1.5.7.sha256sum] = "eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237"
+SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.4.bb b/meta/recipes-devtools/python/python3-maturin_1.10.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.4.bb
rename to meta/recipes-devtools/python/python3-maturin_1.10.2.bb
index f47c8061bb..889fc6e6aa 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.10.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "235163a0c99bc6f380fb8786c04fd14dcf6cd622ff295ea3de525015e6ac40cf"
+SRC_URI[sha256sum] = "259292563da89850bf8f7d37aa4ddba22905214c1e180b1c8f55505dfd8c0e81"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.3


