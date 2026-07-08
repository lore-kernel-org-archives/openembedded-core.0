Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A584C44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6242.1783510829116751574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LWDqF5Ce;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c7902f47so4081725e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510827; x=1784115627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oblMy0M0dDwEnnlhN7J1hK+KVCwL1TJBaoJJ5V077Q=;
        b=LWDqF5Ce5WwcqvOkjM/E2VJdpfE38eR75u2S07Szdb45JQ39jg5BdwSGrXT/QGCXOe
         O6zsS8rwGRUvgI26l30u1XS4027LXm4rZJKwO+Uq6KU/9+ZrLR8E+cxblXtAy7CvIL6R
         HJejG+zdiHscvO8wPUUm4J/qQ8WtM9p90uLJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510827; x=1784115627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+oblMy0M0dDwEnnlhN7J1hK+KVCwL1TJBaoJJ5V077Q=;
        b=HUb2361Z/NwTmLIOdvQY9YuAzXP/IxwSFP646gY+dwuX4Sh9f/+o+N1RtC+uZo+O7r
         2C+kss1u5fkK4DVvCFER23xuhhkXLG7TfZYUa9UOWm6WWH0Ehw+jrIQRhqDE/ZUQG0gN
         GaWo/csiXFtI4fNZPDiUimOeEZYuvZ18Aiza2DRNZZhCkPgWup0u+Pag0ws4YNWRSFj9
         A8kZ9HEnspWEQP+QTOokq/UVkB1zUTcnugVy4oK+uKn6QbBbSplnHVz2pb5HReUBYLzu
         QEWhj2RaJAXxB5Mu/lQ0RPRYboWSpSItpBUOOCnXyhMIicslJGnNkowE37q4WmTqE96H
         MRIw==
X-Gm-Message-State: AOJu0YwGdePmTny+IW90QEuUO7SHxCbL4hKPvsqWuv+4dBv7bOG9P7Lq
	BV5lKIBMZ/4hWqMwT7YCxVCmhSCW2wFqghX3Un4VpHjL3TIXxPZtJwboYyQE5mH4l4mxANehW4Y
	CYTs9M3Q=
X-Gm-Gg: AfdE7cnucdranz++R72RIaS1mMWDI7YGcgRiCvbtCdtSoOsSL+ZV2yHt/A/L7NQqnNM
	AzoIwiE6pJKJAFEA8XcSWPsvMetozCcjar1X93YYeWsBuAvJ5QsOWQVkLDr36knfqjCRjbuxGFi
	SGjoSyo/cS+lJRdKiwer733YKCIofcqLuwNQGcm42MRucuD2BFXg64wUgnDCOgrMRQn/cpEjbGH
	9uQiBdhSkIQYj6yANwrFr87LYAOT5P+xyD7+jVDjJeQlTdw7tqbaNewGCA/6Z7vyKIROGw3fsqW
	aHzh8Iq3RQceOgHEILZI8fMSTSRwLHE8iXj5PuCOJgju/dJ4PXX8e3NClenAQAWk0XxFDhWnBQn
	e5kO2uqBAhccKQSz9Vzm645JqL5p1M6wP58kY6X3/k4rlx9qgeku9JzRRi2NZ/hPop/riV7iyYl
	+1PniRqO+O6qEIf8a8YSl0rCW4Xxfd+7rIUhl51g4IBA==
X-Received: by 2002:a05:600c:c8a:b0:493:b730:8d78 with SMTP id 5b1f17b1804b1-493e68730cdmr22611295e9.31.1783510827138;
        Wed, 08 Jul 2026 04:40:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] python3-uv-build: upgrade 0.11.26 -> 0.11.28
Date: Wed,  8 Jul 2026 12:40:14 +0100
Message-ID: <20260708114021.3484868-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240467

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc           | 16 ++++++++--------
 ...ld_0.11.26.bb => python3-uv-build_0.11.28.bb} |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.26.bb => python3-uv-build_0.11.28.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 5f8b1b11834..97225725c2f 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -10,12 +10,12 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.103 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.7 \
     crate://crates.io/astral-tokio-tar/0.6.3 \
     crate://crates.io/astral-version-ranges/0.2.0 \
-    crate://crates.io/astral_async_zip/0.0.18 \
+    crate://crates.io/astral_async_zip/0.0.20 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
@@ -155,7 +155,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/quote/1.0.46 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.1 \
@@ -241,7 +241,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.3 \
+    crate://crates.io/uuid/1.23.4 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -313,12 +313,12 @@ SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
 SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
 SRC_URI[astral-version-ranges-0.2.0.sha256sum] = "086f936efdefab117f5a72367fb3d68c4fded8ba5a7008e3c63365eecf723822"
-SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
+SRC_URI[astral_async_zip-0.0.20.sha256sum] = "bd939d79959c3f49a648a1d7857d63cc62548725a6b060b8dbf0ea5c92470b63"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
@@ -458,7 +458,7 @@ SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d709
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
@@ -544,7 +544,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
+SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
index 5256edaeae3..08ab0974826 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "4ec58a93d29967a07b8de466b7fe35e0e0cb0ca2bcab8b61d80403b5a9b7a34b"
+SRC_URI[sha256sum] = "daba66fd25a9a82caa23949686e967cbb69fd056177e991650643186057adaef"
 
 require ${BPN}-crates.inc
 

