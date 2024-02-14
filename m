Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207EAC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 13:43:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.41219.1707918211991779608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 05:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OC4dVYET;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3394b892691so541281f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707918210; x=1708523010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hY5OEPjHKK4Xu5EprhCUhyclX36yJbhE6CGhm+ahFOs=;
        b=OC4dVYETQmjcZoflfbHkJk4iDkmus8pD1VgwP/1qaDMKhbsldkfh1glolNYCTLzBEw
         31PzFFt15JCaH+efcaiQyqy8PoCkPoMb16Hh5410yCCeDDYfb/HFyNRHYzRLLDP0roV+
         ZqCa6+1OgmE7H+3yMgvAdu/jG9YMwBRbM7gs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918210; x=1708523010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hY5OEPjHKK4Xu5EprhCUhyclX36yJbhE6CGhm+ahFOs=;
        b=nQTro7g8sjjiNkNayAAiDCsSZKVjfumgHjsW7ze0rBmGdM+Se01wJFQuKHCXhuuIyn
         8qyr7oNp4hPzU62dPXLF7sv4xOGB/nzJi9eYAnuuD+Aj+/cEuUiF9797n9JIIZ8UQVQ+
         Uzv/Sp1iq+gh6wgjU7/zDoBG+Oe3CgpMISCOHvdQKzs2srsU36pkeSdtKiPtxYlBO5Oj
         BMLfwkEUVZ5hgkjntZ8/2oQ1QPotw7n6WK9PGJQEd7cAeIzMFw5pbJtw2LaNwOcDYLzL
         oZnSNrc4ul8u6GEOXvRdymw5BeKl7z/aIMck85Zth63nZ3CgG+dHWhia5GiwGYb7oafd
         V7DQ==
X-Gm-Message-State: AOJu0YxFiB0xhrJOUPOJBVsdR0u9LbK8zrFuTDhieaj6iZNOqshc8Xy1
	UWyXnDPfaD8ogMtBLpd0Qe1Qj7d+ikyZFIL1+ATUY4fbxDAlw7LVEHC57RM9mPBJ8jWwyIFns9y
	8
X-Google-Smtp-Source: AGHT+IHWiGjFLBwIZEzkxbs3E3ylIEm3km2Lb+j+dASKSWKIyeR6T6oFSExsLz0uYCc5Emfj2Kx4Ow==
X-Received: by 2002:adf:f7c1:0:b0:33c:e075:b075 with SMTP id a1-20020adff7c1000000b0033ce075b075mr1714434wrq.33.1707918210020;
        Wed, 14 Feb 2024 05:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSkQqbbiHWCKEpFJonpXud9tEkYKKxVdVCL+SZWtPB51/tfb+Zu++FCc/epmt8UxL6JcWFh85K2Oi6iDV6xkmJ1pwhsgAYxA==
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:61c2:9b19:f62a:921b])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4c87000000b0033cf4a10359sm241983wrs.61.2024.02.14.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:43:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography: upgrade 41.0.7 to 42.0.2
Date: Wed, 14 Feb 2024 13:43:28 +0000
Message-Id: <20240214134328.4094839-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 13:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195474

From: Tim Orling <ticotimo@gmail.com>

* Also upgrade python3-cryptography-vectors
* Drop patch for 9129, fixed upstream
* Refresh pyproject.toml --benchmark-disable patch
* Refresh -crates.inc

Changes:
https://cryptography.io/en/latest/changelog/#v42-0-2
https://cryptography.io/en/latest/changelog/#v42-0-1
https://cryptography.io/en/latest/changelog/#v42-0-0
https://github.com/pyca/cryptography/compare/41.0.7...42.0.2

RP: Add new REPENDS on python3-mmap for ptest
RP: Increase memory in ptest image to avoid test failures

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/core-image-ptest.bb  |   2 +-
 .../python/python3-cryptography-crates.inc    | 170 ++++++++----------
 ...=> python3-cryptography-vectors_42.0.2.bb} |   2 +-
 ...-directory-when-cross-compiling-9129.patch |  52 ------
 ...toml-remove-benchmark-disable-option.patch |  22 ++-
 ....0.7.bb => python3-cryptography_42.0.2.bb} |   4 +-
 6 files changed, 92 insertions(+), 160 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.7.bb => python3-cryptography-vectors_42.0.2.bb} (91%)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.7.bb => python3-cryptography_42.0.2.bb} (92%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 7f7b4381d4a..72081f938de 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -31,7 +31,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3 = "-m 2048"
-QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
+QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 3a5edaa3494..4714c76bd2b 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,113 +2,99 @@
 
 # from src/rust/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/asn1/0.15.2 \
-    crate://crates.io/asn1_derive/0.15.2 \
+    crate://crates.io/asn1/0.15.5 \
+    crate://crates.io/asn1_derive/0.15.5 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.13.1 \
+    crate://crates.io/base64/0.21.7 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.1 \
-    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/cc/1.0.83 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/indoc/1.0.9 \
-    crate://crates.io/libc/0.2.144 \
-    crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/memoffset/0.8.0 \
-    crate://crates.io/once_cell/1.17.2 \
-    crate://crates.io/openssl/0.10.60 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/indoc/2.0.4 \
+    crate://crates.io/libc/0.2.152 \
+    crate://crates.io/lock_api/0.4.11 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/openssl/0.10.63 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.96 \
-    crate://crates.io/ouroboros/0.15.6 \
-    crate://crates.io/ouroboros_macro/0.15.6 \
+    crate://crates.io/openssl-sys/0.9.99 \
     crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.7 \
-    crate://crates.io/pem/1.1.1 \
-    crate://crates.io/pkg-config/0.3.27 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.64 \
-    crate://crates.io/pyo3/0.18.3 \
-    crate://crates.io/pyo3-build-config/0.18.3 \
-    crate://crates.io/pyo3-ffi/0.18.3 \
-    crate://crates.io/pyo3-macros/0.18.3 \
-    crate://crates.io/pyo3-macros-backend/0.18.3 \
-    crate://crates.io/quote/1.0.28 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.10.0 \
-    crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.18 \
-    crate://crates.io/target-lexicon/0.12.7 \
-    crate://crates.io/unicode-ident/1.0.9 \
-    crate://crates.io/unindent/0.1.11 \
+    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/pem/3.0.3 \
+    crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/proc-macro2/1.0.78 \
+    crate://crates.io/pyo3/0.20.2 \
+    crate://crates.io/pyo3-build-config/0.20.2 \
+    crate://crates.io/pyo3-ffi/0.20.2 \
+    crate://crates.io/pyo3-macros/0.20.2 \
+    crate://crates.io/pyo3-macros-backend/0.20.2 \
+    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/self_cell/1.0.3 \
+    crate://crates.io/smallvec/1.13.1 \
+    crate://crates.io/syn/2.0.48 \
+    crate://crates.io/target-lexicon/0.12.13 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unindent/0.2.3 \
     crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/windows-sys/0.45.0 \
-    crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
-    crate://crates.io/windows_aarch64_msvc/0.42.2 \
-    crate://crates.io/windows_i686_gnu/0.42.2 \
-    crate://crates.io/windows_i686_msvc/0.42.2 \
-    crate://crates.io/windows_x86_64_gnu/0.42.2 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
-    crate://crates.io/windows_x86_64_msvc/0.42.2 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
 "
 
-SRC_URI[Inflector-0.11.4.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
-SRC_URI[aliasable-0.1.3.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
-SRC_URI[asn1-0.15.2.sha256sum] = "28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973"
-SRC_URI[asn1_derive-0.15.2.sha256sum] = "a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407"
+SRC_URI[asn1-0.15.5.sha256sum] = "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
+SRC_URI[asn1_derive-0.15.5.sha256sum] = "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
+SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[indoc-1.0.9.sha256sum] = "bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306"
-SRC_URI[libc-0.2.144.sha256sum] = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"
-SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
-SRC_URI[once_cell-1.17.2.sha256sum] = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
-SRC_URI[openssl-0.10.60.sha256sum] = "79a4c6c3a2b158f7f8f2a2fc5a969fa3a068df6fc9dbb4a43845436e3af7c800"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
+SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
+SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
+SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.96.sha256sum] = "3812c071ba60da8b5677cc12bcb1d42989a65553772897a7e0355545a819838f"
-SRC_URI[ouroboros-0.15.6.sha256sum] = "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
-SRC_URI[ouroboros_macro-0.15.6.sha256sum] = "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
+SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.7.sha256sum] = "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"
-SRC_URI[pem-1.1.1.sha256sum] = "a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8"
-SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
-SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.64.sha256sum] = "78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da"
-SRC_URI[pyo3-0.18.3.sha256sum] = "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
-SRC_URI[pyo3-build-config-0.18.3.sha256sum] = "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
-SRC_URI[pyo3-ffi-0.18.3.sha256sum] = "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
-SRC_URI[pyo3-macros-0.18.3.sha256sum] = "a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d"
-SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] = "97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918"
-SRC_URI[quote-1.0.28.sha256sum] = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.18.sha256sum] = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e"
-SRC_URI[target-lexicon-0.12.7.sha256sum] = "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5"
-SRC_URI[unicode-ident-1.0.9.sha256sum] = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0"
-SRC_URI[unindent-0.1.11.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
+SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
+SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
+SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
+SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
+SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
+SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
+SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[self_cell-1.0.3.sha256sum] = "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
+SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
+SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
+SRC_URI[target-lexicon-0.12.13.sha256sum] = "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
-SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
index eda492d312a..46778e426f5 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
+SRC_URI[sha256sum] = "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce79835994e208bab0e16"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
deleted file mode 100644
index d720359ded7..00000000000
--- a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2f9cd402d3293f6efe0f3ac06f17c6c14edbed86 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sun, 25 Jun 2023 17:39:19 -0600
-Subject: [PATCH] Fix include directory when cross compiling (#9129)
-
-Upstream-Status: Backport [https://github.com/pyca/cryptography/pull/9129]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/rust/cryptography-cffi/build.rs | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/src/rust/cryptography-cffi/build.rs b/src/rust/cryptography-cffi/build.rs
-index 07590ad2e..384af1ddb 100644
---- a/src/rust/cryptography-cffi/build.rs
-+++ b/src/rust/cryptography-cffi/build.rs
-@@ -47,9 +47,14 @@ fn main() {
-     )
-     .unwrap();
-     println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
--    let python_include = run_python_script(
-+    let python_includes = run_python_script(
-         &python,
--        "import sysconfig; print(sysconfig.get_path('include'), end='')",
-+        "import os; \
-+         import setuptools.dist; \
-+         import setuptools.command.build_ext; \
-+         b = setuptools.command.build_ext.build_ext(setuptools.dist.Distribution()); \
-+         b.finalize_options(); \
-+         print(os.pathsep.join(b.include_dirs), end='')",
-     )
-     .unwrap();
-     let openssl_include =
-@@ -59,12 +64,15 @@ fn main() {
-     let mut build = cc::Build::new();
-     build
-         .file(openssl_c)
--        .include(python_include)
-         .include(openssl_include)
-         .flag_if_supported("-Wconversion")
-         .flag_if_supported("-Wno-error=sign-conversion")
-         .flag_if_supported("-Wno-unused-parameter");
- 
-+    for python_include in env::split_paths(&python_includes) {
-+        build.include(python_include);
-+    }
-+
-     // Enable abi3 mode if we're not using PyPy.
-     if python_impl != "PyPy" {
-         // cp37 (Python 3.7 to help our grep when we some day drop 3.7 support)
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 69cf451d576..f9c8d1393d2 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -19,16 +19,18 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
+Refresh for 42.02
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index b2e511f..4a285af 100644
+index c9a7979bd..dec4b7157 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -85,7 +85,7 @@ line-length = 79
- target-version = ["py37"]
+@@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
+ 
  
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
@@ -36,10 +38,6 @@ index b2e511f..4a285af 100644
  console_output_style = "progress-even-when-capture-no"
  markers = [
      "skip_fips: this test is not executed in FIPS mode",
-@@ -151,4 +151,4 @@ git-only = [
-     "ci-constraints-requirements.txt",
-     ".gitattributes",
-     ".gitignore",
--]
-\ No newline at end of file
-+]
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
index 45856774403..7ac0225a391 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "13f93ce9bea8016c253b34afc6bd6a75993e5c40672ed5405a9c832f0d4a00bc"
+SRC_URI[sha256sum] = "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
-            file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
@@ -38,6 +37,7 @@ RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
     ${PYTHON_PN}-hypothesis \
     ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-mmap \
     ${PYTHON_PN}-pretend \
     ${PYTHON_PN}-psutil \
     ${PYTHON_PN}-pytest \
-- 
2.40.1


