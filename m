Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F06C5B559
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:40 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.37186.1748816797394709084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C0Oj0eG/;
 spf=pass (domain: konsulko.com, ip: 209.85.214.196, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2352400344aso23751385ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816796; x=1749421596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=674Am9N6z1mb0/6EqrrpjkY0HIqyG0kEpWPh2BH51+Y=;
        b=C0Oj0eG/WPrfDW3+jHCLK6k35PbbcCXMdE+LZzk0k7zZy1ggZ6oDhSbuJKpOdr9d6q
         il9fV6y/UaXWGwnJ8ECMRdXpjPctv5kVbnoA5R/YXPGKxfkwzk+UeROv3Tp7AJfOfg26
         X62pGGtf9UjLjbxk7ZLo+ZdCLtb0enoz5Q/Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816796; x=1749421596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=674Am9N6z1mb0/6EqrrpjkY0HIqyG0kEpWPh2BH51+Y=;
        b=Z3LOZp4uprhUZ7B+222s8yPtFFDHVfkhXQZ/fOhB26fiBACUFEDklZ8SwXWV4szNed
         OYrsE4XDJRgwub95ukUg0a33wa7MpHXwNElPlDtxAuP+9IU3x0ZkEv+J9s7JQdu8REQR
         5VZR48VgcJ4CszMj0fWbZMwWqFXqzhWIdkJZFxdhSHb1ewl8cwEIN/qCQdyW+Tgi+ADN
         U1l7x2bt7KM0brQ5PiUAPumGq/Grs+0qff91H9t3F/YKjcweuDYON1XLCWG0fL0BIn0L
         OKlWdgVGdfXNPA4wz9pbzrTIi5GM7yDzZ6Z7y9mVj6vjE/htRH70ehiFR3zL0D1LEy72
         +3AA==
X-Gm-Message-State: AOJu0YyaieCZyT0/3B5uaZ1tbTPYcYoSltAg9OkBNejS4Tdf7D9Ji4sq
	v1hlD/WGNYCY192E4PN6vxoVc/GIWrJp0UuHvnfpEJ70oTlxIfr2J9q1I0MBzZNu6YgKgmjE7Tw
	5INgZnjyNDy+s
X-Gm-Gg: ASbGncvGFAuGhpbJGyRMX/lg9lPfLCFcAwv1p8WXkOyPcAeeOE8pg14yvB8VRmhiFxt
	c6c4m8tJ+Kyjnx4KTqQ680jTTRVg5dR6X0MzGGJbtoUdS25A/+DyvzZPFyQNMa+P2ipLjUIQMB2
	Wl8dDflXqnX/S50xwxMPzrorizcwAQSHy/g74rRZtwpoe9xLKq1wJNfRadgdE8Nlr3M0TOLzBv9
	SfFwcrKjUnsb+vcvszo+paYnMd9box1rFBlPAQttPbL37dg1yHTz3uB6m2MdvJf5+3vuk5mDAz5
	zynWuMvmCOJuevRyiTVgBNCwOZ1CYcQ7SUIUnDwSG7WO62zdb2xQt45lQimS69hh9xzOfQ5C6hx
	xOtV+WBzgMSrkU+s=
X-Google-Smtp-Source: AGHT+IFydrGw4F/1diX1c8LOVgsrtuYQuor9EEHmNMIiE47WDW4r2TODHxRARFm4BFt7Ck65uVfVlQ==
X-Received: by 2002:a17:902:f54b:b0:234:9497:69e3 with SMTP id d9443c01a7336-235293f4ea1mr154150325ad.25.1748816796309;
        Sun, 01 Jun 2025 15:26:36 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8669sm59334845ad.13.2025.06.01.15.26.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:35 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] python3-cryptography,python3-cryptography-vectors: upgrade 44.0.2 -> 45.0.3
Date: Sun,  1 Jun 2025 15:26:17 -0700
Message-ID: <36625066bc7f03658920b35672029b193b77e45c.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217682

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 44.0.2:
https://github.com/pyca/cryptography/compare/44.0.2...45.0.3

Changelogs:
https://cryptography.io/en/latest/changelog/#v44-0-3
https://cryptography.io/en/latest/changelog/#v45-0-1
https://cryptography.io/en/latest/changelog/#v45-0-2
https://cryptography.io/en/latest/changelog/#v45-0-3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass for core-image-ptest-python3-cryptography on qemux86-64

 .../python/python3-cryptography-common.inc    |   2 +-
 .../python/python3-cryptography-crates.inc    | 100 +++++++++---------
 .../python/python3-cryptography-vectors.bb    |   2 +-
 .../python/python3-cryptography.bb            |   2 +-
 ...toml-remove-benchmark-disable-option.patch |   6 +-
 5 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 368a364cf0f..3018d967b2d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.2"
+PV = "45.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b3aa66002e6..e1787904489 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,75 +2,75 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.20.0 \
-    crate://crates.io/asn1_derive/0.20.0 \
+    crate://crates.io/asn1/0.21.3 \
+    crate://crates.io/asn1_derive/0.21.3 \
     crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cc/1.2.1 \
+    crate://crates.io/bitflags/2.9.1 \
+    crate://crates.io/cc/1.2.23 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/itoa/1.0.14 \
-    crate://crates.io/libc/0.2.166 \
+    crate://crates.io/indoc/2.0.6 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/libc/0.2.172 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.68 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/openssl/0.10.72 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.104 \
-    crate://crates.io/pem/3.0.4 \
-    crate://crates.io/pkg-config/0.3.31 \
-    crate://crates.io/portable-atomic/1.10.0 \
-    crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/pyo3/0.23.5 \
-    crate://crates.io/pyo3-build-config/0.23.5 \
-    crate://crates.io/pyo3-ffi/0.23.5 \
-    crate://crates.io/pyo3-macros/0.23.5 \
-    crate://crates.io/pyo3-macros-backend/0.23.5 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/self_cell/1.0.4 \
+    crate://crates.io/openssl-sys/0.9.108 \
+    crate://crates.io/pem/3.0.5 \
+    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/pyo3/0.25.0 \
+    crate://crates.io/pyo3-build-config/0.25.0 \
+    crate://crates.io/pyo3-ffi/0.25.0 \
+    crate://crates.io/pyo3-macros/0.25.0 \
+    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/self_cell/1.2.0 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.89 \
-    crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/unicode-ident/1.0.14 \
-    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/syn/2.0.101 \
+    crate://crates.io/target-lexicon/0.13.2 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/unindent/0.2.4 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.20.0.sha256sum] = "2d8b84b4ea1de2bf1dcd2a759737ddb328fb6695b2a95eb7e44fed67e3406f32"
-SRC_URI[asn1_derive-0.20.0.sha256sum] = "a200809d0138620b3dba989f1d08d0620e76248bc1e62a2ec1b2df5eb1ee08ad"
+SRC_URI[asn1-0.21.3.sha256sum] = "2d9c3502a6f1b50a2c69b97b71638a81ad3b21b9874604880401b9b2b0bf758f"
+SRC_URI[asn1_derive-0.21.3.sha256sum] = "1766ebcb519d8dd186d60dfa912571edcaa2c1f995e2e56643a261a87df69a61"
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cc-1.2.1.sha256sum] = "fd9de9f2205d5ef3fd67e685b0df337994ddd4495e2a28d185500d0e1edfea47"
+SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[cc-1.2.23.sha256sum] = "5f4ac86a9e5bc1e2b3449ab9d7d3a6a405e3d1bb28d7b9be8614f55846ae3766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
-SRC_URI[libc-0.2.166.sha256sum] = "c2ccc108bbc0b1331bd061864e7cd823c0cab660bbe6970e66e2c0614decde36"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
-SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
-SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
-SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
-SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
-SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
-SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
-SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
-SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
-SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
-SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
+SRC_URI[openssl-sys-0.9.108.sha256sum] = "e145e1651e858e820e4860f7b9c5e169bc1d8ce1c86043be79fa7b7634821847"
+SRC_URI[pem-3.0.5.sha256sum] = "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
+SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
+SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
+SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
+SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
+SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[self_cell-1.2.0.sha256sum] = "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.89.sha256sum] = "44d46482f1c1c87acd84dea20c1bf5ebff4c757009ed6bf19cfd36fb10e92c4e"
-SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 075115f3f9f..46597134b6d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ab32e156b6e7eaf6d8c727a32245967dcce049487301482fca38c0c5fdc84e4b"
+SRC_URI[sha256sum] = "b65cebdc334c6b9db8c79081a08253fddf262d009d2c914398edd24a4321db21"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 566e80c4f98..e40e62f6265 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "c63454aa261a0cf0c5b4718349629793e9e634993538db841165b3df74f37ec0"
+SRC_URI[sha256sum] = "ec21313dd335c51d7877baf2972569f40a4291b76a0ce51391523ae358d05899"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 19ade60c035..42876e34899 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 682c99345a7c8cba87e9cea1187aa007eed962fa Mon Sep 17 00:00:00 2001
+From 7da554d52bfed4370766d5afd94bc7865791231d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 13d8b2c..e93dee9 100644
+index d94a1f5..c0f87a7 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -118,7 +118,7 @@ exclude = [
+@@ -129,7 +129,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.43.0


