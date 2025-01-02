Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51073E77198
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5203.1735810887021203995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TdMMhfCu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436341f575fso116043835e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810885; x=1736415685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIQLbFNbjhxNNTzduIwIdIoYGFwOPqggPnQlzW748Gw=;
        b=TdMMhfCuKxUt7QhtjoPcY5G/XZs059DWBtuaCmKPwlJr5XzoHZUj1ElbAl0wegDYc/
         BMh1EFbxcmUQvZRtL4nIQLFX/MyZ61jKiNdj1SZsnFHIuohV8qdmbD8gSMnRiud5bTtv
         TEsGe8rYCsyiuqmwyhFBDzVXbzxZT0xCQyiZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810885; x=1736415685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIQLbFNbjhxNNTzduIwIdIoYGFwOPqggPnQlzW748Gw=;
        b=Ze2gZcZIrqd7D2Ue2XbZz5flrVabIaHpH+yOPQKrSIti6r5OweKdPlafY3j2FCQwMY
         czx5HwTKNjV66aBYmn9SXes3v7Ych0DxjvqfjAaV06ouBSxT7mJ7HnfTqeMxZdfJaUJl
         M/hHriWg1Uj96l60rJu04v4YXZjz47ehdAXGVZFV7cM01i29SihKHjQIMFSVEomhX0gL
         Lsqe3fyL98rJ+PQoRdhdrXBX44wX7n/uZWm1scmglvr/8XwhdakoA42Y6+lzEzSjLXOR
         CH79feOe/liIQkMQzxZ3rLL7Yi6vEZ5IOXSk8gNox60jpjPJhDm58pif/8mE9mV6xLqR
         XlCA==
X-Gm-Message-State: AOJu0Yy0dWPhDGEo+t7BddrXl9XvOZ8WUUi4onQpvJx5AT49E/JPhHN1
	renVF9TcyREV6fxMsNRYsVg67+2tfjtzWWArwT+832IDB1KC8hm1KvnOD+SCknMrBqZtJWHVdvW
	Vy80=
X-Gm-Gg: ASbGncsTazlxhoFV6EXe4Sv1gpyMTCC4HUAG7AO5FZLmqOR2GU+BRzo+C7eVzddskg4
	ypQi26dCPktdaFbKBbUbNd5Wa/adh1nAsqEzFvsh/En5/w4xMAU78yxu7EdUHadKbj7k2tCuph7
	im/4vzT5T1B75biXqt/XhLULD8jTdqrSwaoumbPwPwLR76g6NGDPlm9j68kXk/eMlxOslCjU6aZ
	qCPRNGPpJBElT6oYFNbHFBoo8ftEdYr4ccdsYWavkXqi+5WY8mUMmN9+s8UybyxUL9W0ItAITry
	oGjJCYK+Jw==
X-Google-Smtp-Source: AGHT+IEXbTKfTenvbHKGLHs2Kcykp2NGwcQ/SkC7iQ3sHglKRV2xGo4xvk/373BJs8wetKWYGeo9wA==
X-Received: by 2002:a05:600c:350c:b0:434:9ec0:9e4e with SMTP id 5b1f17b1804b1-43668b5f6f7mr407499625e9.30.1735810884200;
        Thu, 02 Jan 2025 01:41:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/21] python3-maturin: upgrade 1.7.8 -> 1.8.1
Date: Thu,  2 Jan 2025 09:40:47 +0000
Message-ID: <20250102094059.322187-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209276

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-maturin-crates.inc         | 146 +++++++++++-------
 ...urin_1.7.8.bb => python3-maturin_1.8.1.bb} |   2 +-
 2 files changed, 91 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.7.8.bb => python3-maturin_1.8.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index d4642d4b42d..abb8fe4a626 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -29,11 +29,11 @@ SRC_URI += " \
     crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
     crate://crates.io/cab/0.6.0 \
     crate://crates.io/camino/1.1.9 \
-    crate://crates.io/cargo-config2/0.1.26 \
+    crate://crates.io/cargo-config2/0.1.30 \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
-    crate://crates.io/cargo-xwin/0.17.5 \
-    crate://crates.io/cargo-zigbuild/0.19.5 \
+    crate://crates.io/cargo-xwin/0.18.3 \
+    crate://crates.io/cargo-zigbuild/0.19.7 \
     crate://crates.io/cargo_metadata/0.19.0 \
     crate://crates.io/cbindgen/0.27.0 \
     crate://crates.io/cc/1.1.21 \
@@ -91,9 +91,8 @@ SRC_URI += " \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
-    crate://crates.io/fs-err/2.11.0 \
     crate://crates.io/fs-err/3.0.0 \
-    crate://crates.io/fs4/0.11.1 \
+    crate://crates.io/fs4/0.12.0 \
     crate://crates.io/futures/0.3.30 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
@@ -115,7 +114,18 @@ SRC_URI += " \
     crate://crates.io/home/0.5.9 \
     crate://crates.io/humantime/2.1.0 \
     crate://crates.io/humantime-serde/1.1.1 \
-    crate://crates.io/idna/0.5.0 \
+    crate://crates.io/icu_collections/1.5.0 \
+    crate://crates.io/icu_locid/1.5.0 \
+    crate://crates.io/icu_locid_transform/1.5.0 \
+    crate://crates.io/icu_locid_transform_data/1.5.0 \
+    crate://crates.io/icu_normalizer/1.5.0 \
+    crate://crates.io/icu_normalizer_data/1.5.0 \
+    crate://crates.io/icu_properties/1.5.1 \
+    crate://crates.io/icu_properties_data/1.5.0 \
+    crate://crates.io/icu_provider/1.5.0 \
+    crate://crates.io/icu_provider_macros/1.5.0 \
+    crate://crates.io/idna/1.0.3 \
+    crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/ignore/0.4.23 \
     crate://crates.io/indexmap/2.5.0 \
     crate://crates.io/indicatif/0.17.8 \
@@ -136,6 +146,7 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.12 \
     crate://crates.io/lockfree-object-pool/0.1.6 \
     crate://crates.io/log/0.4.21 \
+    crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.5 \
     crate://crates.io/mailparse/0.15.0 \
     crate://crates.io/matchers/0.1.0 \
@@ -183,7 +194,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.85 \
     crate://crates.io/psm/0.1.21 \
     crate://crates.io/pyproject-toml/0.11.0 \
-    crate://crates.io/python-pkginfo/0.6.3 \
+    crate://crates.io/python-pkginfo/0.6.5 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/quoted_printable/0.5.0 \
     crate://crates.io/rand/0.8.5 \
@@ -200,7 +211,7 @@ SRC_URI += " \
     crate://crates.io/regex-syntax/0.6.29 \
     crate://crates.io/regex-syntax/0.8.4 \
     crate://crates.io/relative-path/1.9.3 \
-    crate://crates.io/rfc2047-decoder/1.0.5 \
+    crate://crates.io/rfc2047-decoder/1.0.6 \
     crate://crates.io/ring/0.17.8 \
     crate://crates.io/rstest/0.22.0 \
     crate://crates.io/rstest_macros/0.22.0 \
@@ -223,10 +234,10 @@ SRC_URI += " \
     crate://crates.io/security-framework/2.11.0 \
     crate://crates.io/security-framework-sys/2.11.0 \
     crate://crates.io/semver/1.0.23 \
-    crate://crates.io/serde/1.0.210 \
-    crate://crates.io/serde_derive/1.0.210 \
+    crate://crates.io/serde/1.0.216 \
+    crate://crates.io/serde_derive/1.0.216 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.128 \
+    crate://crates.io/serde_json/1.0.133 \
     crate://crates.io/serde_spanned/0.6.6 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -248,8 +259,9 @@ SRC_URI += " \
     crate://crates.io/subtle/2.5.0 \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.87 \
-    crate://crates.io/tar/0.4.42 \
-    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/synstructure/0.13.1 \
+    crate://crates.io/tar/0.4.43 \
+    crate://crates.io/target-lexicon/0.13.0 \
     crate://crates.io/tempfile/3.11.0 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/terminal_size/0.3.0 \
@@ -262,8 +274,7 @@ SRC_URI += " \
     crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
     crate://crates.io/time-macros/0.2.18 \
-    crate://crates.io/tinyvec/1.7.0 \
-    crate://crates.io/tinyvec_macros/0.1.1 \
+    crate://crates.io/tinystr/0.7.6 \
     crate://crates.io/toml/0.8.15 \
     crate://crates.io/toml_datetime/0.6.6 \
     crate://crates.io/toml_edit/0.21.1 \
@@ -278,17 +289,17 @@ SRC_URI += " \
     crate://crates.io/twox-hash/1.6.3 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicase/2.7.0 \
-    crate://crates.io/unicode-bidi/0.3.15 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unicode-linebreak/0.1.5 \
-    crate://crates.io/unicode-normalization/0.1.23 \
     crate://crates.io/unicode-width/0.1.13 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
     crate://crates.io/ureq/2.11.0 \
-    crate://crates.io/url/2.5.2 \
+    crate://crates.io/url/2.5.4 \
     crate://crates.io/urlencoding/2.1.3 \
+    crate://crates.io/utf16_iter/1.0.5 \
+    crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/uuid/1.8.0 \
     crate://crates.io/valuable/0.1.0 \
@@ -308,34 +319,40 @@ SRC_URI += " \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.5 \
+    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.5 \
-    crate://crates.io/windows_i686_gnullvm/0.52.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/0.5.40 \
     crate://crates.io/winnow/0.6.13 \
     crate://crates.io/winsafe/0.0.19 \
+    crate://crates.io/write16/1.0.0 \
+    crate://crates.io/writeable/0.5.5 \
     crate://crates.io/xattr/1.3.1 \
     crate://crates.io/xwin/0.6.5 \
+    crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yoke/0.7.4 \
+    crate://crates.io/yoke-derive/0.7.5 \
     crate://crates.io/zerocopy/0.7.34 \
     crate://crates.io/zerocopy-derive/0.7.34 \
     crate://crates.io/zerofrom/0.1.4 \
+    crate://crates.io/zerofrom-derive/0.1.5 \
     crate://crates.io/zeroize/1.8.1 \
-    crate://crates.io/zip/0.6.6 \
+    crate://crates.io/zerovec/0.10.4 \
+    crate://crates.io/zerovec-derive/0.10.3 \
     crate://crates.io/zip/2.1.6 \
     crate://crates.io/zopfli/0.8.1 \
 "
@@ -367,11 +384,11 @@ SRC_URI[bzip2-0.4.4.sha256sum] = "bdb116a6ef3f6c3698828873ad02c3014b3c85cadb8849
 SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] = "736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc"
 SRC_URI[cab-0.6.0.sha256sum] = "171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2"
 SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3"
-SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
+SRC_URI[cargo-config2-0.1.30.sha256sum] = "163a7be36509388c7bf7eb492a05431df28a2ee519087e287566c11e40d35e33"
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
-SRC_URI[cargo-xwin-0.17.5.sha256sum] = "9cfe03fae5d4f7192f1a573f84d12b11f20877d43941ea3730289cc7af050531"
-SRC_URI[cargo-zigbuild-0.19.5.sha256sum] = "5eb13fbc2ba490ac9eb0b359cf46ba265255424c04a172f1c1772a8b9532283d"
+SRC_URI[cargo-xwin-0.18.3.sha256sum] = "76ddeb44d5109bca38ed11f0400b0385b5ba3fc03e737d188d9b86d784daeb49"
+SRC_URI[cargo-zigbuild-0.19.7.sha256sum] = "04cc649328f39bbf1ef92ef753406e1785ff1074941c398e5214b6c74d318a9e"
 SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
 SRC_URI[cbindgen-0.27.0.sha256sum] = "3fce8dd7fcfcbf3a0a87d8f515194b49d6135acab73e18bd380d1d93bb1a15eb"
 SRC_URI[cc-1.1.21.sha256sum] = "07b1695e2c7e8fc85310cde85aeaab7e3097f593c91d209d3f9df76c928100f0"
@@ -429,9 +446,8 @@ SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd8
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
-SRC_URI[fs-err-2.11.0.sha256sum] = "88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41"
 SRC_URI[fs-err-3.0.0.sha256sum] = "8bb60e7409f34ef959985bc9d9c5ee8f5db24ee46ed9775850548021710f807f"
-SRC_URI[fs4-0.11.1.sha256sum] = "e871a4cfa68bb224863b53149d973df1ac8d1ed2fa1d1bfc37ac1bb65dd37207"
+SRC_URI[fs4-0.12.0.sha256sum] = "c29c30684418547d476f0b48e84f4821639119c483b1eccd566c8cd0cd05f521"
 SRC_URI[futures-0.3.30.sha256sum] = "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
@@ -453,7 +469,18 @@ SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7
 SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
 SRC_URI[humantime-serde-1.1.1.sha256sum] = "57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c"
-SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
+SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
+SRC_URI[icu_locid-1.5.0.sha256sum] = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
+SRC_URI[icu_locid_transform-1.5.0.sha256sum] = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
+SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
+SRC_URI[icu_normalizer-1.5.0.sha256sum] = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
+SRC_URI[icu_normalizer_data-1.5.0.sha256sum] = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
+SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
+SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
+SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
+SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
+SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
 SRC_URI[indexmap-2.5.0.sha256sum] = "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
 SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
@@ -474,6 +501,7 @@ SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e
 SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
 SRC_URI[lockfree-object-pool-0.1.6.sha256sum] = "9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e"
 SRC_URI[log-0.4.21.sha256sum] = "90ed8c1e510134f979dbc4f070f87d4313098b704861a105fe34231c70a3901c"
+SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
 SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
 SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
@@ -521,7 +549,7 @@ SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675
 SRC_URI[proc-macro2-1.0.85.sha256sum] = "22244ce15aa966053a896d1accb3a6e68469b97c7f33f284b99f0d576879fc23"
 SRC_URI[psm-0.1.21.sha256sum] = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874"
 SRC_URI[pyproject-toml-0.11.0.sha256sum] = "ef7061023bcb58a0fc4a4bbe9819c13b0dca7c2abc14da14f5ecc1532ab3a36a"
-SRC_URI[python-pkginfo-0.6.3.sha256sum] = "ba3f3f0d552c7efdde2b6898bf21b49c4e76b3e6071ff196dfe52109804db896"
+SRC_URI[python-pkginfo-0.6.5.sha256sum] = "c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
@@ -538,7 +566,7 @@ SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
 SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
-SRC_URI[rfc2047-decoder-1.0.5.sha256sum] = "e90a668c463c412c3118ae1883e18b53d812c349f5af7a06de3ba4bb0c17cc73"
+SRC_URI[rfc2047-decoder-1.0.6.sha256sum] = "bc36545d1021456a751b573517cb52e8c339b2f662e6b2778ef629282678de29"
 SRC_URI[ring-0.17.8.sha256sum] = "c17fa4cb658e3583423e915b9f3acc01cceaee1860e33d59ebae66adc3a2dc0d"
 SRC_URI[rstest-0.22.0.sha256sum] = "7b423f0e62bdd61734b67cd21ff50871dfaeb9cc74f869dcd6af974fbcb19936"
 SRC_URI[rstest_macros-0.22.0.sha256sum] = "c5e1711e7d14f74b12a58411c542185ef7fb7f2e7f8ee6e2940a883628522b42"
@@ -561,10 +589,10 @@ SRC_URI[scroll_derive-0.12.0.sha256sum] = "7f81c2fde025af7e69b1d1420531c8a8811ca
 SRC_URI[security-framework-2.11.0.sha256sum] = "c627723fd09706bacdb5cf41499e95098555af3c3c29d014dc3c458ef6be11c0"
 SRC_URI[security-framework-sys-2.11.0.sha256sum] = "317936bbbd05227752583946b9e66d7ce3b489f84e11a94a510b4437fef407d7"
 SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
-SRC_URI[serde-1.0.210.sha256sum] = "c8e3592472072e6e22e0a54d5904d9febf8508f65fb8552499a1abc7d1078c3a"
-SRC_URI[serde_derive-1.0.210.sha256sum] = "243902eda00fad750862fc144cea25caca5e20d615af0a81bee94ca738f1df1f"
+SRC_URI[serde-1.0.216.sha256sum] = "0b9781016e935a97e8beecf0c933758c97a5520d32930e460142b4cd80c6338e"
+SRC_URI[serde_derive-1.0.216.sha256sum] = "46f859dbbf73865c6627ed570e78961cd3ac92407a2d117204c49232485da55e"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.128.sha256sum] = "6ff5456707a1de34e7e37f2a6fd3d3f808c318259cbd01ab6377795054b483d8"
+SRC_URI[serde_json-1.0.133.sha256sum] = "c7fceb2473b9166b2294ef05efcb65a3db80803f0b03ef86a5fc88a2b85ee377"
 SRC_URI[serde_spanned-0.6.6.sha256sum] = "79e674e01f999af37c49f70a6ede167a8a60b2503e56c5599532a65baa5969a0"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -586,8 +614,9 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.87.sha256sum] = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
-SRC_URI[tar-0.4.42.sha256sum] = "4ff6c40d3aedb5e06b57c6f669ad17ab063dd1e63d977c6a88e7f4dfa4f04020"
-SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
+SRC_URI[tar-0.4.43.sha256sum] = "c65998313f8e17d0d553d28f91a0df93e4dbbbf770279c7bc21ca0f09ea1a1f6"
+SRC_URI[target-lexicon-0.13.0.sha256sum] = "4ff4a4048091358129767b8a200d6927f58876c8b5ea16fb7b0222d43b79bfa8"
 SRC_URI[tempfile-3.11.0.sha256sum] = "b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
@@ -600,8 +629,7 @@ SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465b
 SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
 SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
-SRC_URI[tinyvec-1.7.0.sha256sum] = "ce6b6a2fb3a985e99cebfaefa9faa3024743da73304ca1c683a36429613d3d22"
-SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
+SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
 SRC_URI[toml-0.8.15.sha256sum] = "ac2caab0bf757388c6c0ae23b3293fdb463fee59434529014f85e3263b995c28"
 SRC_URI[toml_datetime-0.6.6.sha256sum] = "4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf"
 SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
@@ -616,17 +644,17 @@ SRC_URI[trycmd-0.15.6.sha256sum] = "3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84
 SRC_URI[twox-hash-1.6.3.sha256sum] = "97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicase-2.7.0.sha256sum] = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
-SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
-SRC_URI[unicode-normalization-0.1.23.sha256sum] = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
 SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
 SRC_URI[ureq-2.11.0.sha256sum] = "b30e6f97efe1fa43535ee241ee76967d3ff6ff3953ebb430d8d55c5393029e7b"
-SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
+SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
 SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
+SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
+SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[uuid-1.8.0.sha256sum] = "a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0"
 SRC_URI[valuable-0.1.0.sha256sum] = "830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d"
@@ -646,33 +674,39 @@ SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2f
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
-SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 SRC_URI[winnow-0.6.13.sha256sum] = "59b5e5f6c299a3c7890b876a2a587f3115162487e704907d9b6cd29473052ba1"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
+SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
+SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
 SRC_URI[xwin-0.6.5.sha256sum] = "ca7e4546db1514c186778f0a257d89732ed9ed75587d0953ac25be7519d9f0d1"
+SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
+SRC_URI[yoke-derive-0.7.5.sha256sum] = "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154"
 SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
 SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
 SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
+SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
-SRC_URI[zip-0.6.6.sha256sum] = "760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261"
+SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
+SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
 SRC_URI[zip-2.1.6.sha256sum] = "40dd8c92efc296286ce1fbd16657c5dbefff44f1b4ca01cc5f517d8b7b3d3e2e"
 SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.7.8.bb b/meta/recipes-devtools/python/python3-maturin_1.8.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.7.8.bb
rename to meta/recipes-devtools/python/python3-maturin_1.8.1.bb
index 539fd6d9eef..d0f0b381a54 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.7.8.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "649c6ef3f0fa4c5f596140d761dc5a4d577c485cc32fb5b9b344a8280352880d"
+SRC_URI[sha256sum] = "49cd964aabf59f8b0a6969f9860d2cdf194ac331529caae14c884f5659568857"
 
 S = "${WORKDIR}/maturin-${PV}"
 

