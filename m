Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD355CD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16957.1780186697999717736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pItCagun;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso1403545ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186697; x=1780791497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKiMj6vgTS74VLLgmSdjIqV9aw2y3xAAk3TYBNEkbXU=;
        b=pItCagun+rI0T/sL3Itv5Q6TLjgrDEYnWi/Tno3BK1yWp59sY0qBeIOWnDCQPi4Hs5
         ltkE10RzC8dHmx9g3doXsU+rzPsdBHQ9yx/Y61nCDTNjmi8+rqySRh3U6zkUz1kVX3U/
         cFoXiheVxNO+gu/O43M9ot8dNMtNG9CtnuXoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186697; x=1780791497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKiMj6vgTS74VLLgmSdjIqV9aw2y3xAAk3TYBNEkbXU=;
        b=ATyRXdYiv2bnAI9xf60nKKxGJSFP8H4SoUJ4ZYo5gQ/mPBw7oBrdb7BaSQKUcOhnUU
         Zo4gRbOIH7AeLeTlY4coFnOSKz1XFJK6ctLGQrjaH/273/p8J389w1Jy6+oENJeZn8lN
         8c38/3nEBaoEL6oHja1W6rmdL8boDDhnmpE/YgM+H5Yfv5l9u7ZdoL02HvGFuZsn14Gi
         Gh7oTepob79GmvGNd9tzsGtANB58nuMjT/dBSTgXCnAjqqmrfdHy0DC8lFO5RJqc01dq
         lTOVey1/c7MeIxoDLaUjasrDuKmGHhWXgheDGmrAkVe/Zoe8+2SzzqkjXq44i97SeXwa
         +IQQ==
X-Gm-Message-State: AOJu0Yyuy0BX1AjeSzscjnf7hRvi3runzwkFhWAZpd1HNJ/CmfTqNMuy
	kaK+XmE/22mojufShqKAsuj9VOI9WpAT4VmcMWZMP2S1ssmx8dN4aoaVZmu4vLdfCWsxlKBXrk8
	pFxby
X-Gm-Gg: Acq92OEdXhTICO4x0kApA9x8mF8UzRM+8ciXrKU+QD5LkF4fBupAUby/G4xXK/mFtiH
	9kEZtzkaYzD62wzjhTNNNnlsBMuqHOe0PbTHAJ+yLwWMCveW5Spn74ZAGM4xDdQE7OeafWoLSZd
	vUbalQ0jZpvP0S9tBe3ZVrdNGbXWpBx8UQoDAlvQ9bmfTbWBzde4+IqEOmE6tsQm9l2hfBdEOL+
	GeoV7/NACHmKr6NT3Lv8gg96BOLvL58wHrqsZf1px6vnYaSYsrjqY53IFNfCYHRKTtg7HZG/6Dg
	hcMk2CnV1DdWmSB3CxbcuD1lESWFyIsHaip+toiyQUj7Q8WgjUT2nuH5xGskpm5tgkOeoXUQ9ch
	VbQNmUOEZ0S9czcj6kwzr6ncrXzieRG1q08oipk6P+2jF/RDRpdrfUVy6el+nvoZZSbSL5Nu0zs
	BHV8ihuWSi5SH4fL5LolPNdvkq3OhRDLpF4/dAJ+LipLz+NOhLHQkCXUH24j/TwLE0VXtZeyyxs
	g==
X-Received: by 2002:a17:902:fc4b:b0:2c0:a711:53d with SMTP id d9443c01a7336-2c0a7111146mr45799885ad.23.1780186697365;
        Sat, 30 May 2026 17:18:17 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c1e46asm58163925ad.61.2026.05.30.17.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:17 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 6/9] python3-rpds-py: upgrade 0.30.0 -> 2026.5.1
Date: Sat, 30 May 2026 17:17:53 -0700
Message-ID: <20260531001756.1582306-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237785

From: Tim Orling <tim.orling@konsulko.com>

git shortlog (ignoring merge, dependabot and pre-commit-ci commits):

Edgar Ramírez Mondragón (1):
      Update to PyO3 0.28.0

Julian Berman (10):
      Update pre-commit hooks.
      Use regular gh CLI for release notes.
      Run zizmor in pedantic mode and address findings.
      Drop support for 3.10. Add 3.15.
      Use cargo-release for releases, without the chore: prefix on commit messages.
      Run each nox session in its own job with a single Python installed.
      Reserve Mach-O header padding on macOS so install_name_tool can relocate.
      Bump url-py to a version that supports Python 3.15.
      Regenerate uv.lock without user-config artifacts.
      Release rpds-py version 2026.5.1

For a full comparison, see [1].

[1] https://github.com/crate-py/rpds/compare/v0.30.0...v2026.5.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-rpds-py-crates.inc         | 36 ++++++++-----------
 ..._0.30.0.bb => python3-rpds-py_2026.5.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.30.0.bb => python3-rpds-py_2026.5.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index c9e354ac04..9556b6f593 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,56 +3,48 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.2 \
-    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/cc/1.2.48 \
     crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.7 \
     crate://crates.io/libc/0.2.177 \
-    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.27.2 \
-    crate://crates.io/pyo3-build-config/0.27.2 \
-    crate://crates.io/pyo3-ffi/0.27.2 \
-    crate://crates.io/pyo3-macros/0.27.2 \
-    crate://crates.io/pyo3-macros-backend/0.27.2 \
+    crate://crates.io/pyo3/0.28.3 \
+    crate://crates.io/pyo3-build-config/0.28.3 \
+    crate://crates.io/pyo3-ffi/0.28.3 \
+    crate://crates.io/pyo3-macros/0.28.3 \
+    crate://crates.io/pyo3-macros-backend/0.28.3 \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.42 \
-    crate://crates.io/rpds/1.2.0 \
-    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/rpds/1.2.1 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/triomphe/0.1.15 \
     crate://crates.io/unicode-ident/1.0.22 \
-    crate://crates.io/unindent/0.2.4 \
 "
 
 SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
 SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
-SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
-SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
-SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
-SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
+SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
+SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
+SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
-SRC_URI[rpds-1.2.0.sha256sum] = "9e75f485e819d4d3015e6c0d55d02a4fd3db47c1993d9e603e0361fba2bffb34"
-SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[rpds-1.2.1.sha256sum] = "e025feb26210bc196b908e72deb063b1b4000754304341cbc168a1e72c857ebc"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[triomphe-0.1.15.sha256sum] = "dd69c5aa8f924c7519d6372789a74eac5b94fb0f8fcf0d4a97eb0bfc3e785f39"
 SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
-SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb b/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
index 173dabeecd..7f1511589f 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
+SRC_URI[sha256sum] = "07b24fea40541e28570e5b795a4a38fbdcd12550c06bd0748005ecc8116ca256"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


