Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D006CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:29:30 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11518.1782318568456033992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Oeiub0Ih;
 spf=pass (domain: konsulko.com, ip: 209.85.210.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845a3c05e40so767333b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782318568; x=1782923368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YL3Ii+70i2jHlrdMQaFcChpuv/raAhcAza6TqPH07ew=;
        b=Oeiub0IhzyW0/BsPeVVqbCRwTQhwQSJbi1w9PSSLuAFrI79YA+oBErWj2etPDTlBP/
         ndzeTHxxVunqTvip6oDdBrT3ZmQUA003dyFFFNYYi3AaqTWGc8bVgPVCnwk/3HMYy5Cm
         cihOe2zZ9UOUJbFW2MpETf4+7vSxLTgGW1G1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782318568; x=1782923368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL3Ii+70i2jHlrdMQaFcChpuv/raAhcAza6TqPH07ew=;
        b=dmPA+whEoJhx4ajSMw8q8EsEXCpleYvpU8+62mh8r2uWN618jmXY9TImrhsndFiFZ4
         oCeKCJtlxX11+ayw1ayNAEGBTh5E6XsL8uZqd+/Qq6dBisrz8tlCkd4nYao7XgFr6ta7
         Ih7ECe6/jXjZC5OfpNkoY2Sru6nCNW2qF59JjqvqeCIbs8yYiJYUXxTn743luxKX8Cq+
         ZNlgkZQx5mHIzecv5MjvavJpBa+TnZNDPULfQvepcot0eA6DSkGEhSte2aO/9quE+m8I
         BxQmKlvTuD8RqoonXSpdSTHhXeGvvTkRua73eHjFxjLKsmvMElvv+B0KB6z1K9MbsGAA
         3Vzg==
X-Gm-Message-State: AOJu0Yw4rcTU2bH5vTxyTw8o7h3w3KcUQQH8fcoqcum3OkTpau+ZT9tS
	v1BjZj/HbKf9/lkSdTtk/miou+QtVgc3oShZ/3D7DtUxIbNcT7NOWx8nXUe+qCrLUssfATO01em
	c80BO
X-Gm-Gg: AfdE7clXrYxixZQJvkH7sjl4xVIqNa/3eaCjUkD3cvf1Qm5vSU0IJcipQTCIzDnLjAb
	UoDxMnRssK35I1rrzjk56nY8h2POMYscfHcRB0CVvwXnwvhAXiSPDDBclhx+KyhAt6p7PW3MyUU
	eBz2veyZ+xyLpoFo101T2DLLwTG0YaIQqWbEiYqewo7usrdHmTieeu87Bvyj+b5QlmJ/3IoFOiz
	0o0PVDjIhjIm+Gff+GAcCkZeHmQZnRN5FhVrfpaP/rJK3PhW8jWeuYpZVi/GqMQ60JcpFBA5+jq
	6MBLcB1OjxCSczaHMkqMRiQtai2euuRZuPV4s5rGC7TJRB26kW4Wt0jOkDNtQLG33q+GGiNfsyU
	uroCwmdp1dMgiiVKzuUd8UUDYzeRVqmbNXqGAQ2s8L5vBh7ycUgsuNuRVWztwYxNLODv2DN671v
	HnI7Ia+5jBf3oT6WTzOkMNh/XNh8SQ77ESFNf3TdPoXqnVfZwh1wOZ
X-Received: by 2002:a05:6a00:39a6:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-845a2c31740mr5420325b3a.25.1782318567502;
        Wed, 24 Jun 2026 09:29:27 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm3097476b3a.29.2026.06.24.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 09:29:27 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-maturin: upgrade 1.14.0 -> 1.14.1
Date: Wed, 24 Jun 2026 09:28:36 -0700
Message-ID: <20260624162835.3082130-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239524

From: Tim Orling <tim.orling@konsulko.com>

Upstream release notes [1]:

1.14.1

* Bump uraimo/run-on-arch-action to v3 to fix pytest job (#3221)
* Fix platform tag logic to generate the same as cpython on AIX (#3220)
* Bump pyo3-introspection (#3227)
* Upgrade cargo-zigbuild & cargo-xwin (#3228)
* Fix issues around crates enabling abi3 and abi3t features (#3226)
* Add PEP 740 publish attestations to PyPI releases (#3230)
* Set PYO3_PYTHON to run scripts for stable ABI builds (#3233)
* Fix shell quoting in CI scripts (#3231)

For full comparison of changes see [2].

[1] https://www.maturin.rs/changelog.html#1141
[2] https://github.com/PyO3/maturin/compare/v1.14.0...v1.14.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-maturin-crates.inc            | 16 ++++++++--------
 ...turin_1.14.0.bb => python3-maturin_1.14.1.bb} |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.14.0.bb => python3-maturin_1.14.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 3500c19460..d8faf5e18d 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -34,11 +34,11 @@ SRC_URI += " \
     crate://crates.io/cargo-config2/0.1.44 \
     crate://crates.io/cargo-cyclonedx/0.5.9 \
     crate://crates.io/cargo-lock/10.1.0 \
-    crate://crates.io/cargo-options/0.7.6 \
+    crate://crates.io/cargo-options/0.8.1 \
     crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-platform/0.3.2 \
-    crate://crates.io/cargo-xwin/0.22.0 \
-    crate://crates.io/cargo-zigbuild/0.22.2 \
+    crate://crates.io/cargo-xwin/0.23.0 \
+    crate://crates.io/cargo-zigbuild/0.23.0 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cargo_metadata/0.23.1 \
     crate://crates.io/cbindgen/0.29.2 \
@@ -238,7 +238,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
-    crate://crates.io/pyo3-introspection/0.28.3 \
+    crate://crates.io/pyo3-introspection/0.29.0 \
     crate://crates.io/pyproject-toml/0.13.7 \
     crate://crates.io/python-pkginfo/0.6.8 \
     crate://crates.io/quote/1.0.45 \
@@ -509,11 +509,11 @@ SRC_URI[camino-1.2.2.sha256sum] = "e629a66d692cb9ff1a1c664e41771b3dcaf961985a977
 SRC_URI[cargo-config2-0.1.44.sha256sum] = "25ada53f7339c78084fb37d7e17f34e76537541c4fbb02fa3a2baa14b8faad37"
 SRC_URI[cargo-cyclonedx-0.5.9.sha256sum] = "5d162f67705f0f5038759d73bf546a083bf30e8677c2e944b416bca48d9d69a8"
 SRC_URI[cargo-lock-10.1.0.sha256sum] = "c06acb4f71407ba205a07cb453211e0e6a67b21904e47f6ba1f9589e38f2e454"
-SRC_URI[cargo-options-0.7.6.sha256sum] = "f89e1d6d6f65fe04d5e21be9de19d31a074e3b7e43aa39ee5b85f4cee16c3188"
+SRC_URI[cargo-options-0.8.1.sha256sum] = "b916a16b2a4b0ce91d46e42c51b7fc42e754220a4cc8bbfd1947efaafea99af7"
 SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-platform-0.3.2.sha256sum] = "87a0c0e6148f11f01f32650a2ea02d532b2ad4e81d8bd41e6e565b5adc5e6082"
-SRC_URI[cargo-xwin-0.22.0.sha256sum] = "c010a0e90e1dc09a90428c8768808bb4ad8cd7523e4df38719418e14579a9e37"
-SRC_URI[cargo-zigbuild-0.22.2.sha256sum] = "cd6351afb3f950c62e8d36f27d9089d65b91bf09eb1428eda58808557e8d15a9"
+SRC_URI[cargo-xwin-0.23.0.sha256sum] = "22a978d433c17ee532d4cb0a8ec9b7aeb121e658267ac1c637504583b12b2861"
+SRC_URI[cargo-zigbuild-0.23.0.sha256sum] = "68c7df45b9d9934aaed5987fbf422b31419f81827b13a52251a61e1e772c6ff7"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cargo_metadata-0.23.1.sha256sum] = "ef987d17b0a113becdd19d3d0022d04d7ef41f9efe4f3fb63ac44ba61df3ade9"
 SRC_URI[cbindgen-0.29.2.sha256sum] = "befbfd072a8e81c02f8c507aefce431fe5e7d051f83d48a23ffc9b9fe5a11799"
@@ -713,7 +713,7 @@ SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278f
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
-SRC_URI[pyo3-introspection-0.28.3.sha256sum] = "96040524552ac54e645ce08146b24023d720ceb0e788fff758c0beb9fe841736"
+SRC_URI[pyo3-introspection-0.29.0.sha256sum] = "7775fcc875acdce3872dcb91a4b7bd155ffba6e0ea8be88b8caab7d0b34539a6"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
 SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.14.0.bb b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.14.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.14.1.bb
index 6a8a071508..b690a57772 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "f7f82a6aca4a6c402bf00b99200be199d4874d04b9b9e74e825726a3478bba7f"
+SRC_URI[sha256sum] = "9d6577a62cd08e0ceba7a0db06fb098e0c9b1b3429bad747a4f3a18215a1b3df"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


