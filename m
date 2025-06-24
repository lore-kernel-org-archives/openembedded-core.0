Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9C7C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2794.1750806850235707462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ts386//7;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ef62066eso16351785ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806849; x=1751411649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIiDsglaMdgfsVpZvlDvbrrAXK3DaZh3RGDy8XusSa0=;
        b=ts386//7xDeg62N0HY4BRlTb6HX54sxoauJJxrwWjsuhzOCK4VFk7AVTt1bagvLazY
         69JkLThJy1GVnusTgP0sM4DPE42O6yh2C5MkSAWEw2mL5iG2hoL1DP2ccaDwiDlb4JhQ
         VWuMYJ/rDvOUNfNJEargV69Tfpf0OIHIh5AOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806849; x=1751411649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIiDsglaMdgfsVpZvlDvbrrAXK3DaZh3RGDy8XusSa0=;
        b=ehgAE6C1Cq1FQbdvrnEw0evTAjFjN0+IDP0TTambl5qFav+fxB2igUwaoMa0aYt+bg
         kC6n4Hr3tS0KBzmle3pi2exdm1O0IognMjnPMJq/W9+IhrntRmsrWlM/8CMYU3pbA/n6
         ljbHZD4KySgT6d4WYfkM30v1TWV1zaGCAadL0sCqLcZVA+6H7nLfOXe+dFGzPjTGauOw
         ey9tbglVuQ12FO/1UgAHXfHPcEGjJDd2qrwId2DHH7CJUuJYzI4vb6yxSpQoV5fki2wJ
         v489pzFR46Eqoo0anELkmtoazKbIrBKM3MBIVwdyw7FdiCuR7dviJNWzRxSJp+DpL4Yk
         XR8g==
X-Gm-Message-State: AOJu0YxV2bnb2Cfgf6BSAIHqp5s7+iBrwyM/Iy5VP8rl5mmk5R3Md2tK
	XwL2EdV1d5s8rd3c0oR/7fG9qGuVnXe7ROGHCxXBoj4lYN8I5MLgq3EeyvyZOnufBTxviOtRC4r
	rde6Uulo=
X-Gm-Gg: ASbGncsz39ogF7Zg0IyMGfgVzwgN3DdvTxWRDrZJ50fxai8OQopyu7jhLs6Ez2EYllt
	0kyi2NdvKD1pqpEH4eniaSGW7YIIXuk26TIrtSaJyjFptDKxmPZ4BXiKvtwKXK6wjDonH3hPvVk
	VR+Tg7qKCaYQ/QF2yc0hnebIUbvF+2miUxAFL+x8hQXt/MBoM9fphW4ObHoW5loDvQ2Qk/JxVS2
	v8QJH35NSZS0mMYOkIsFcvzjXVKKE9BHzi2S/OAJsk4dSRBZ+nyiNFxX6kL8gXWS7SVN+UludOE
	uCFzVffjXT5MBiz+nEc3bIN6g5sJgzeCBFFBebOXWrnxSahCyDZzN1EbTsukOl62op2A/+zSEEe
	WkUnRydwPlzmng/gvRPartN/2zA==
X-Google-Smtp-Source: AGHT+IEJvkKlOTYBTAGMGOtV0xIbs/Jhm/YzJuq/HOoE89r/DfBUSpUpWv0wSL7+MeNl60GvNSbDIg==
X-Received: by 2002:a17:903:988:b0:235:f459:69c7 with SMTP id d9443c01a7336-2382408fde0mr14226925ad.52.1750806849075;
        Tue, 24 Jun 2025 16:14:09 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-238072314basm22963485ad.145.2025.06.24.16.14.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:08 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] python3-maturin: upgrade 1.8.7 -> 1.9.0
Date: Tue, 24 Jun 2025 16:13:53 -0700
Message-ID: <fc19f1ce2a63c3f07c20e8da974b47c3155e486c.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750806216.git.tim.orling@konsulko.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219292

From: Tim Orling <tim.orling@konsulko.com>

* Update crates

1.9.0
* Add full PEP 639 support for project.license and project.license-files
  in #2647.
* Add --compatiblity pypi to only build wheels with platform tags that can
  also be uploaded to PyPI. This blocks e.g. building for riscv64, which is
  supported by manylinux, but not by PyPI.

Comparing changes from v1.8.7 -> v1.9.0:
https://github.com/pyo3/maturin/compare/v1.8.7...v1.9.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Separated out in case stable branches want to take 1.8.7
Tested with "oe-selftest --run-tests recipetool.RecipetoolCreateTests.test_recipetool_create_python3_pep517_maturin"

 .../python/python3-maturin-crates.inc         | 22 ++++++++++---------
 ...urin_1.8.7.bb => python3-maturin_1.9.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.8.7.bb => python3-maturin_1.9.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index ea7bd488e6b..28551ff4cab 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -107,7 +107,7 @@ SRC_URI += " \
     crate://crates.io/getrandom/0.2.15 \
     crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/glob/0.3.1 \
-    crate://crates.io/globset/0.4.15 \
+    crate://crates.io/globset/0.4.16 \
     crate://crates.io/goblin/0.9.2 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/hashbrown/0.15.2 \
@@ -131,6 +131,7 @@ SRC_URI += " \
     crate://crates.io/indexmap/2.6.0 \
     crate://crates.io/indicatif/0.17.9 \
     crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/insta/1.43.1 \
     crate://crates.io/is_terminal_polyfill/1.70.0 \
     crate://crates.io/itertools/0.12.1 \
     crate://crates.io/itertools/0.13.0 \
@@ -189,7 +190,7 @@ SRC_URI += " \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.30 \
     crate://crates.io/plain/0.2.3 \
-    crate://crates.io/platform-info/2.0.3 \
+    crate://crates.io/platform-info/2.0.5 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
@@ -197,7 +198,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro-crate/3.1.0 \
     crate://crates.io/proc-macro2/1.0.92 \
     crate://crates.io/psm/0.1.21 \
-    crate://crates.io/pyproject-toml/0.13.4 \
+    crate://crates.io/pyproject-toml/0.13.5 \
     crate://crates.io/python-pkginfo/0.6.5 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/quoted_printable/0.5.0 \
@@ -271,9 +272,9 @@ SRC_URI += " \
     crate://crates.io/terminal_size/0.3.0 \
     crate://crates.io/textwrap/0.16.1 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.3 \
+    crate://crates.io/thiserror/2.0.12 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.3 \
+    crate://crates.io/thiserror-impl/2.0.12 \
     crate://crates.io/thread_local/1.1.8 \
     crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
@@ -479,7 +480,7 @@ SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c2882
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
-SRC_URI[globset-0.4.15.sha256sum] = "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
+SRC_URI[globset-0.4.16.sha256sum] = "54a1028dfc5f5df5da8a56a73e6c153c9a9708ec57232470703592a3f18e49f5"
 SRC_URI[goblin-0.9.2.sha256sum] = "53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[hashbrown-0.15.2.sha256sum] = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
@@ -503,6 +504,7 @@ SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42
 SRC_URI[indexmap-2.6.0.sha256sum] = "707907fe3c25f5424cce2cb7e1cbcafee6bdbe735ca90ef77c29e84591e5b9da"
 SRC_URI[indicatif-0.17.9.sha256sum] = "cbf675b85ed934d3c67b5c5469701eec7db22689d0a2139d856e0925fa28b281"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[insta-1.43.1.sha256sum] = "154934ea70c58054b556dd430b99a98c2a7ff5309ac9891597e339b5c28f4371"
 SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] = "f8478577c03552c21db0e2724ffb8986a5ce7af88107e6be5d2ee6e158c12800"
 SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
@@ -561,7 +563,7 @@ SRC_URI[pin-project-lite-0.2.15.sha256sum] = "915a1e146535de9163f3987b8944ed8cf4
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
 SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
-SRC_URI[platform-info-2.0.3.sha256sum] = "d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217"
+SRC_URI[platform-info-2.0.5.sha256sum] = "7539aeb3fdd8cb4f6a331307cf71a1039cee75e94e8a71725b9484f4a0d9451a"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
@@ -569,7 +571,7 @@ SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839
 SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
 SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
 SRC_URI[psm-0.1.21.sha256sum] = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874"
-SRC_URI[pyproject-toml-0.13.4.sha256sum] = "643af57c3f36ba90a8b53e972727d8092f7408a9ebfbaf4c3d2c17b07c58d835"
+SRC_URI[pyproject-toml-0.13.5.sha256sum] = "7b0f6160dc48298b9260d9b958ad1d7f96f6cd0b9df200b22329204e09334663"
 SRC_URI[python-pkginfo-0.6.5.sha256sum] = "c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
@@ -643,9 +645,9 @@ SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c7
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
 SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.3.sha256sum] = "c006c85c7651b3cf2ada4584faa36773bd07bac24acfb39f3c431b36d7e667aa"
+SRC_URI[thiserror-2.0.12.sha256sum] = "567b8a2dae586314f7be2a752ec7474332959c6460e02bde30d702a66d488708"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.3.sha256sum] = "f077553d607adc1caf65430528a576c757a71ed73944b66ebb58ef2bbd243568"
+SRC_URI[thiserror-impl-2.0.12.sha256sum] = "7f7cf42b4507d8ea322120659672cf1b9dbb93f8f2d4ecfd6e51350ff5b17a1d"
 SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
 SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.7.bb b/meta/recipes-devtools/python/python3-maturin_1.9.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.8.7.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.0.bb
index 0037ce60ad5..e4147b93217 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.7.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "96c76353f94a153c5dc1a9d3916e75fcd17e6bf216a06dcdc2f84b9f98f374af"
+SRC_URI[sha256sum] = "ccb9cb87f8df88d1bab8f49efe3fc77f0abb0639ea4b4ebf4f35549200d16b9e"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


