Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5569DC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 16:24:17 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.54125.1748881453146400922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 09:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mKqf42yj;
 spf=pass (domain: konsulko.com, ip: 209.85.214.193, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22c33677183so36414305ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748881452; x=1749486252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVFlLPN8YCPFkuJtFt36MkAGUXnAshbMCrrSXrZQKXs=;
        b=mKqf42yj52+vq/tHZDBJViaHm1ExSYkKDkpkXPYw6z3f0dNSFyhupGo7Om6sYA5pds
         jIX2SiNjXUa4u2adGSLT4241RT57Jh18IA4p39vvNtN1Q7QqY9owEkFZRTR52cTNUP4w
         kLdvCkzFsICDGR1mO3W8/nhM9ZqhGGcipRIlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881452; x=1749486252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVFlLPN8YCPFkuJtFt36MkAGUXnAshbMCrrSXrZQKXs=;
        b=CUT0xyFStg1q90Gaifz/58rBInl0IJiUZzsdql/90bXsbuZllcC/tLClw2Xh89J8oB
         mSWIlo3N8nYYdl7OBK2JVZyvSQtZtIyqJdqtlCfUnb4MTtKuO5VPzyuWJvjTeTK+zFl+
         pZnvW3+dqW6w700sMfRdVbe6tzu/Uc53HDfDmAinHV1mnu9o2St4pi0su5aCL59s11EF
         +T382Iz82SAXV5vByo6zPSBVQxx1+f4CTgEWn69eq90ZWmu0erREXLRVOGIasvTQXV+I
         sEmmQ7d+KlrFFeQU7o/ipl/ij4dYpzE/89GVMJftZDEDG70QinbBhdiz+P6OBAL0CWPm
         xrZg==
X-Gm-Message-State: AOJu0YxrLGiA5hjqrEFYtyHIFUuxsg3pX0dpWOy0W5eqkWGDhb9Tc+xJ
	jMZRHwyf4JM514nrUJV/W6Hu7cA/jIA+AvubYB9uWibvEVS760BsOgF7G6PfvoB5UIpP0zVGmBP
	udTGNfXBcO/Pm
X-Gm-Gg: ASbGncv8pZhigXF89d8bH+oqULdfG+lGcEW6Tr+65hOxAdsrt1KzcPG01A2amweS3F6
	YK7QbnAHeVFbtw/yct73HZX9lELGoaoKJJlK/R1u2k2+wEUCfwPN9S23j3MiqIgBRmpkDbVo2Nm
	JAkded/ckr9+cRybbd2iPqKr9d5QOp9xAJ2RHB5JF4CO17x7cCmTnSGiD63de6UoyeQ6ztteadc
	0TQjPoAGRHasn1rqOzOlLl8CkRRaalpmPRY+LhwSepg0xMB8miYq10QABD3I00ZfCm80x8MVjGs
	3OGt73l6JcjB+6Psvey97+ZCUbF49nVxTJOAsN9K2cpj9T98sy7awrDSiQftvcka13KvhGZ6Ql7
	ZzwjbzzvPz/SHRkXXliFXdGPuuw==
X-Google-Smtp-Source: AGHT+IH3WgkU8MNP7D/sdtbZbkazEYc1jp2LJTTBTuTChDljBaJtIDydzwTAEcf3xGusWVmsAJbmXA==
X-Received: by 2002:a17:902:d2cf:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-235390e3a8amr210773915ad.19.1748881452043;
        Mon, 02 Jun 2025 09:24:12 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm4989672a12.74.2025.06.02.09.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:24:11 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/8] python3-maturin: upgrade 1.8.3 -> 1.8.6
Date: Mon,  2 Jun 2025 09:23:55 -0700
Message-ID: <20250602162355.3097725-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
References: <9d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 16:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217722

From: Tim Orling <tim.orling@konsulko.com>

* Add comment about riscv32gc ioctl codes patch, it is needed until libc
  version is 0.2.172 or greater in Cargo.lock.

Comparing changes since 1.8.3:
https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6

Changelog:

1.8.6
* Print a message when overriding platform tag from _PYTHON_HOST_PLATFORM
  in #2594
* Use the current python interpreter's version when the abi3 feature is set
  with no explicit version in #2597

1.8.5
* Fix release CI build

1.8.4
* Install a Rust toolchain into a temporary directory when building maturin
  itself or a package and a Rust toolchain is missing. Set
  MATURIN_NO_INSTALL_RUST to disable this behavior. #2421
* Fix broken maturin develop with latest uv in #2584
* Add PYO3_PYTHON env var support in #2534
* Sort RECORD file in wheel archives to make them deterministic in #2550
* Publish wheel for loongarch64 in #2548
* Add --compression-level option to build command in #2572

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-maturin-crates.inc         | 20 +++++++++----------
 ...urin_1.8.3.bb => python3-maturin_1.8.6.bb} |  3 ++-
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.8.3.bb => python3-maturin_1.8.6.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 2f196f56570..5c939a09a8e 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -34,7 +34,7 @@ SRC_URI += " \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
     crate://crates.io/cargo-xwin/0.18.4 \
-    crate://crates.io/cargo-zigbuild/0.19.7 \
+    crate://crates.io/cargo-zigbuild/0.20.0 \
     crate://crates.io/cargo_metadata/0.19.0 \
     crate://crates.io/cbindgen/0.28.0 \
     crate://crates.io/cc/1.2.16 \
@@ -60,7 +60,7 @@ SRC_URI += " \
     crate://crates.io/crc/3.2.1 \
     crate://crates.io/crc-catalog/2.4.0 \
     crate://crates.io/crc32fast/1.4.2 \
-    crate://crates.io/crossbeam-channel/0.5.13 \
+    crate://crates.io/crossbeam-channel/0.5.15 \
     crate://crates.io/crossbeam-deque/0.8.5 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
     crate://crates.io/crossbeam-utils/0.8.20 \
@@ -169,10 +169,10 @@ SRC_URI += " \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.70 \
+    crate://crates.io/openssl/0.10.72 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-sys/0.9.105 \
+    crate://crates.io/openssl-sys/0.9.107 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/os_pipe/1.2.0 \
     crate://crates.io/overload/0.1.1 \
@@ -362,7 +362,7 @@ SRC_URI += " \
     crate://crates.io/zeroize/1.8.1 \
     crate://crates.io/zerovec/0.10.4 \
     crate://crates.io/zerovec-derive/0.10.3 \
-    crate://crates.io/zip/2.2.3 \
+    crate://crates.io/zip/2.3.0 \
     crate://crates.io/zopfli/0.8.1 \
 "
 
@@ -398,7 +398,7 @@ SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
 SRC_URI[cargo-xwin-0.18.4.sha256sum] = "60f1954e4ffa0f4c47b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326"
-SRC_URI[cargo-zigbuild-0.19.7.sha256sum] = "04cc649328f39bbf1ef92ef753406e1785ff1074941c398e5214b6c74d318a9e"
+SRC_URI[cargo-zigbuild-0.20.0.sha256sum] = "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
 SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
 SRC_URI[cbindgen-0.28.0.sha256sum] = "eadd868a2ce9ca38de7eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff"
 SRC_URI[cc-1.2.16.sha256sum] = "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
@@ -424,7 +424,7 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c
 SRC_URI[crc-3.2.1.sha256sum] = "69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636"
 SRC_URI[crc-catalog-2.4.0.sha256sum] = "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
 SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
-SRC_URI[crossbeam-channel-0.5.13.sha256sum] = "33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2"
+SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
 SRC_URI[crossbeam-utils-0.8.20.sha256sum] = "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
@@ -533,10 +533,10 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.70.sha256sum] = "61cfb4e166a8bb8c9b55c500bc2308550148ece889be90f609377e58140f42c6"
+SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-sys-0.9.105.sha256sum] = "8b22d5b84be05a8d6947c7cb71f7c849aa0f112acd4bf51c2a7c1c988ac0a9dc"
+SRC_URI[openssl-sys-0.9.107.sha256sum] = "8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
 SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
@@ -726,5 +726,5 @@ SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
 SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
-SRC_URI[zip-2.2.3.sha256sum] = "b280484c454e74e5fff658bbf7df8fdbe7a07c6b2de4a53def232c15ef138f3a"
+SRC_URI[zip-2.3.0.sha256sum] = "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
 SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-maturin_1.8.3.bb
rename to meta/recipes-devtools/python/python3-maturin_1.8.6.bb
index 08975e177f0..ab509331c36 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
@@ -5,8 +5,9 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
+# This is needed until Cargo.lock has libc-0.2.172+
 SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
-SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc0152e1e12"
+SRC_URI[sha256sum] = "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.43.0


