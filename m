Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCADE6ADE2
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87823.1766434121129455785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvO5i8/F;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79e7112398so703544366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434119; x=1767038919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFzdixjM9CFNVRvLSOhB3zx1GoKm7/g+MDU2/lUAyUY=;
        b=GvO5i8/FNVVO1VNOGKOEy+4Pqh7CWt267A0PsO7h1KN2XUy7WCNjRJUx5VhS0J2XOx
         GWAhNz+m7TLrZn2nHo+lbb0clJYVnkRceigbN4erzuIZJ8OTDi/h0IGxyoG1/HUPmAkH
         isxh2YorgMgSwj6JfH8onWMTaJdhrM2T78HMKD+W2RZTBIaWq+zXMqAsRzkP8jkkWzKW
         GKfvwLbdIJyE3kvlk4s5ZAtC+ixkmYDKqAyZms4OEkhHpv8h0B6LgasPjNld9DNRkB6M
         cw+qeDmT8KFr2/qeOiiMlvlDf5s8IW18GSCx6Bl+PyPHDIsTgr7ubHd1TdbXWdFWHr45
         eH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434119; x=1767038919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFzdixjM9CFNVRvLSOhB3zx1GoKm7/g+MDU2/lUAyUY=;
        b=IKbtVNbEmnNi+8QL4agrad4Uff9zv4qzfF5tOT+gnQitsCQzdMR0Ct/t2jjp4wUVF3
         cQM2tpKyFn+AwIFbXQx7N9nEmLMgBa3dDCo83fLXM97STzebeEnZDqwLexnuNyfDjD8c
         /wqanMsEV5Iz2JFDfohP3bF8i7oGOnD3cZqV8r4UizzfEguAsiO86RxjuFJEL82pYXfu
         wo8KboN6KyKj92pqi3I2oWasrMeJ3Z+X3qlR53CUGPSrDIjWVu0CwY09KdRF0DAalrVM
         iwliMMX1CIeCoMmPlJ2SH9CddJGKtf5NrHun85OYoqrDRrKZhUY0hullXzNyQUwsRm8P
         pWkg==
X-Gm-Message-State: AOJu0Yws0uyALTBY2M4SVUjNfyZ+bswBNGNziSfImq1Ynr8WQr0WNY6O
	m61kCvPcrNhg4KHrpx+tSj0TkRXEKbG5la5oQQPxB/BOk9oRDhOj1UcEehdwsw==
X-Gm-Gg: AY/fxX6B/xBPUasDduDZWG0ayv8zDHLUtGYnZRv4z0cckCdp9u75mEcKVahHtDyYAqM
	Zztz2XFQK3H/WZPKQnZTZiDYp9Vev/WPVvQ7daUWwSacR0h5cxPzl0RViW7mjnvflS6R7fN6/fo
	58fueqAj2N7FlNtQPEJ0tM8H7klR4stJFwbIDOiJDj+5mopgmhzp9aryfo2G1U1KFTJEnnjv8Ja
	8AudToHtwszwk6eT5ZicEt1wPNpHpezn2YwM63a5MwOfjq9sw+nr8o34ySde32jKgiB9sRzHJDG
	1HBnYvmIjWzcTExctG35mUxlTUty76WHbQKDpgG11h9LsQkgUxzbAs+7ct1mQtbTOLtJXvBL6mN
	02sWV0j1Nv7mVdMVJeUCAB0GcgCF289AeTv6Z4y1quv5ehOeo+234jKKjl0Fi8Yqub3K912nU0z
	8c384y/o7xAcDWwZ37ymqEIn1uv9iEE1nQq0lEMYLfg6BskE0=
X-Google-Smtp-Source: AGHT+IGct3ao7itT6ZjakfvCB2mzY7wfQ+AyKwY7Lo9jzvf7cyyB0DpRqh+kf5Uwa9czU1KkBDmv+g==
X-Received: by 2002:a17:907:720f:b0:b73:79e9:7d3b with SMTP id a640c23a62f3a-b8036f29b57mr1300536266b.25.1766434119248;
        Mon, 22 Dec 2025 12:08:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 078/114] python3-rpds-py: upgrade 0.27.1 -> 0.30.0
Date: Mon, 22 Dec 2025 21:07:00 +0100
Message-ID: <20251222200739.2278706-78-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228403

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-rpds-py-crates.inc         | 76 ++++++++++---------
 ...py_0.27.1.bb => python3-rpds-py_0.30.0.bb} |  2 +-
 2 files changed, 41 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.27.1.bb => python3-rpds-py_0.30.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index a0b669df2d..c9e354ac04 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,53 +2,57 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.1 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/cc/1.2.25 \
+    crate://crates.io/archery/1.2.2 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/cc/1.2.48 \
+    crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.6 \
-    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/libc/0.2.177 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.1 \
-    crate://crates.io/pyo3-build-config/0.25.1 \
-    crate://crates.io/pyo3-ffi/0.25.1 \
-    crate://crates.io/pyo3-macros/0.25.1 \
-    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/pyo3/0.27.2 \
+    crate://crates.io/pyo3-build-config/0.27.2 \
+    crate://crates.io/pyo3-ffi/0.27.2 \
+    crate://crates.io/pyo3-macros/0.27.2 \
+    crate://crates.io/pyo3-macros-backend/0.27.2 \
     crate://crates.io/python3-dll-a/0.2.14 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/rpds/1.1.1 \
+    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/rpds/1.2.0 \
+    crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.101 \
-    crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/triomphe/0.1.14 \
-    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/syn/2.0.111 \
+    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/triomphe/0.1.15 \
+    crate://crates.io/unicode-ident/1.0.22 \
     crate://crates.io/unindent/0.2.4 \
 "
 
-SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[cc-1.2.25.sha256sum] = "d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951"
+SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
+SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
-SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
-SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
-SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
-SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
+SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
+SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
+SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
+SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
+SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
+SRC_URI[rpds-1.2.0.sha256sum] = "9e75f485e819d4d3015e6c0d55d02a4fd3db47c1993d9e603e0361fba2bffb34"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[triomphe-0.1.14.sha256sum] = "ef8f7726da4807b58ea5c96fdc122f80702030edc33b35aff9190a51148ccc85"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[triomphe-0.1.15.sha256sum] = "dd69c5aa8f924c7519d6372789a74eac5b94fb0f8fcf0d4a97eb0bfc3e785f39"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
index dfaffb6546..bef2cf52d2 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "26a1c73171d10b7acccbded82bf6a586ab8203601e565badc74bbbf8bc5a10f8"
+SRC_URI[sha256sum] = "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
 
 require ${BPN}-crates.inc
 
-- 
2.47.3


