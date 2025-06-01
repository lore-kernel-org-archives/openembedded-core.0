Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B3C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:50 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.37013.1748816801600103700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=STepMsFa;
 spf=pass (domain: konsulko.com, ip: 209.85.214.195, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2349f096605so46587545ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816800; x=1749421600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQRQwlR4uhRW+1vd5kiGCzzS4TQ5I6Mv4DtV9dHFoEc=;
        b=STepMsFacNhCTF4fR5QXp8Zus84lcag74+1USXuceJyhw+g+8HuRZXCaj9dLAGNK9C
         OilgCNXqERM6xNGPb9/qpStpDg6+ij9P3SYjwemE/rSZ72De6u4Sn1asQcXVQ/84hKBe
         Q4CpMft8LbWa7huj7QtPpkOpE058nJ0AEJ1z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816800; x=1749421600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQRQwlR4uhRW+1vd5kiGCzzS4TQ5I6Mv4DtV9dHFoEc=;
        b=iYSOnFC0sd5THjs1ErT54h/Q29kJlkwwXbvyrVcX4Ic0ihRJ9DLqB1/GgTN02hZbLp
         kKY5rnlYI0REeZwL0b04XjKpV6EM7+ZTS9V5NQjBXtOXnWZf0ScmdAv8CkaQcC7GFDtn
         unHatOJ4ipbjZ2coIu5eJ5de5JgNh8+HZE1MXU0wPrBvnJ6Pykqyrd8xpSRjOGZPdM73
         Uge/PFJs9phXFcc+LTuWZ0Ck9HBodOQzZlCmw8nOnbWbBydup0R9xsg4dXK5nCCa/Tp2
         HVCSPS6c1ftsd4K9jigPaS1/bJpbiZNXRKle2gvQ+B8CXhvVzugE0116EVX7l7Ecdb25
         kJwQ==
X-Gm-Message-State: AOJu0YxEeIv07mdKCc837wc5AN47aaH/T9Cm/07sTI/hn0pXFFIVmCx/
	M6qusH9IuY8o9Q7/ORvbRLT0ofdwpHqdBxf9bXjiWcs748rc/icWDiLoSiCLOPJyP5tYCZ8ouLl
	BX7usg395vl/j
X-Gm-Gg: ASbGncsCuIDDTOLB1v5EU5PQ+ndHTWjPYFjx1wAb9vMP/OawnypufkY8H0/979B3uWP
	7kdIxkzHUGm6p0sZZE4oPu8ysKAKdZrIAjqtaFz+Y7S9dbUgjqymFlVaP4h/e2JuF0Q6vs3iico
	JTdzTcaWlpcFi5oLtIH7dlcw6eFGMXy7FotF4cp/k7UPQI3LGxmo2uJcjNKcErsxm3i4kOtXhdw
	8PBw++6LVZhxaIj22f4xBued8Lkfv90/6htgTfeIGns+XYZTj+Rafuq3ua/2tjnZCXHREmMTxHs
	ucHTMXxmMTEPzvZ1Ql2gWozawjJbse3FzTvCFIH+DR6/Q6AXXpp1RyRoKboS9lDOzrmfLxiEokB
	N9OQo6iEndQnUS4TE7ZUa+c64VA==
X-Google-Smtp-Source: AGHT+IEYpWmmTbWHq/IXHIacgaHK1FfX1caPYVakyiqTqR+a7c59BMPBx4jxh6V2fA4W6uSSLjfmJg==
X-Received: by 2002:a17:902:e849:b0:234:b123:b4ff with SMTP id d9443c01a7336-2355f7832e1mr93318855ad.21.1748816800513;
        Sun, 01 Jun 2025 15:26:40 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9543sm58856265ad.209.2025.06.01.15.26.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:39 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] python3-rpds-py: upgrade 0.24.0 -> 0.25.1
Date: Sun,  1 Jun 2025 15:26:19 -0700
Message-ID: <5230daa723ecaae7abd8f687cc3eb5f41fd778c6.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217684

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 0.24.0:
https://github.com/crate-py/rpds/compare/v0.24.0...v0.25.1

Changelog:

v0.25.1
What's Changed
* Add windows arm64 wheel build by @finnagin in #133

v0.25.0
What's Changed
* Bump PyO3 to 0.25 by @edgarrmondragon in #135

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass for core-image-ptest-python3-rpds-py on qemux86-64

 .../python/python3-rpds-py-crates.inc         | 80 +++++++++----------
 ...py_0.24.0.bb => python3-rpds-py_0.25.1.bb} |  2 +-
 2 files changed, 41 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.24.0.bb => python3-rpds-py_0.25.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index df58e20862d..0a6fbb1bd68 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,52 +3,52 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.1 \
-    crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/cc/1.0.90 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/cc/1.2.22 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/indoc/2.0.6 \
+    crate://crates.io/libc/0.2.172 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.24.0 \
-    crate://crates.io/pyo3-build-config/0.24.0 \
-    crate://crates.io/pyo3-ffi/0.24.0 \
-    crate://crates.io/pyo3-macros/0.24.0 \
-    crate://crates.io/pyo3-macros-backend/0.24.0 \
-    crate://crates.io/python3-dll-a/0.2.12 \
-    crate://crates.io/quote/1.0.36 \
-    crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/syn/2.0.69 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/pyo3/0.25.0 \
+    crate://crates.io/pyo3-build-config/0.25.0 \
+    crate://crates.io/pyo3-ffi/0.25.0 \
+    crate://crates.io/pyo3-macros/0.25.0 \
+    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/python3-dll-a/0.2.13 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/rpds/1.1.1 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.101 \
     crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/triomphe/0.1.13 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/triomphe/0.1.14 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/unindent/0.2.4 \
 "
 
 SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[cc-1.0.90.sha256sum] = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[cc-1.2.22.sha256sum] = "32db95edf998450acc7881c932f94cd9b05c87b4b2599e8bab064753da4acfd1"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.24.0.sha256sum] = "7f1c6c3591120564d64db2261bec5f910ae454f01def849b9c22835a84695e86"
-SRC_URI[pyo3-build-config-0.24.0.sha256sum] = "e9b6c2b34cf71427ea37c7001aefbaeb85886a074795e35f161f5aecc7620a7a"
-SRC_URI[pyo3-ffi-0.24.0.sha256sum] = "5507651906a46432cdda02cd02dd0319f6064f1374c9147c45b978621d2c3a9c"
-SRC_URI[pyo3-macros-0.24.0.sha256sum] = "b0d394b5b4fd8d97d48336bb0dd2aebabad39f1d294edd6bcd2cccf2eefe6f42"
-SRC_URI[pyo3-macros-backend-0.24.0.sha256sum] = "fd72da09cfa943b1080f621f024d2ef7e2773df7badd51aa30a2be1f8caa7c8e"
-SRC_URI[python3-dll-a-0.2.12.sha256sum] = "9b66f9171950e674e64bad3456e11bb3cca108e5c34844383cfe277f45c8a7a8"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
+SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
+SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
+SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
+SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
 SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[triomphe-0.1.14.sha256sum] = "ef8f7726da4807b58ea5c96fdc122f80702030edc33b35aff9190a51148ccc85"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
index 730688876a4..efc1d4c01c0 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "772cc1b2cd963e7e17e6cc55fe0371fb9c704d63e44cacec7b9b7f523b78919e"
+SRC_URI[sha256sum] = "8960b6dac09b62dac26e75d7e2c4a22efb835d827a7278c34f72b2b84fa160e3"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


