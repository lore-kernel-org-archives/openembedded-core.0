Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A1AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 07:12:40 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.199609.1672297955055597638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 23:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8iG7Y46;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u7so18148124plq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 23:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Si/HbMatq5HpXjLGrp84fR9IIrk/j1bYZuU+XR1Dlm0=;
        b=G8iG7Y469siaCiqkNdJPOoNP8UrE+MXNJhLV6seaiKZEZglBzySqTMxIXFr8NnyeB6
         TxevI7ERz3yFYTv8oiNXzQJcJCucK1emSDzULymoX0hi8saBhwsEYVAdhQPF980cBR3V
         NWpwo6bAR6DK1bCwb+t6lTO1gqTaTzWRXMnP4/8L6ckSSbZkvqu0x2iddMita+g/D4bU
         dTUOUR6zbWlrTebhlqG3K9nr5sLJ2UXu56h2XngB3/0TdhOKqK0ygYkMXvD6VW+wPb9t
         AKsmcE6QjUsvxyiveSWCjc+qWaVyi51yU/sWjMhNSEHCAfYloFVowJh7SpaCYXCJYybx
         pzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Si/HbMatq5HpXjLGrp84fR9IIrk/j1bYZuU+XR1Dlm0=;
        b=rfuUQ8NXP4g8dyt0nkS+xLY8GoxeybqHo8XLkP2UWwG6UaBUUk/7i3SFoC7Aoo3kCK
         FESWiXXue7HyCWmbG4Qmj/Xp835GftBvJShi710Ze6Vd/x6K9b6EZj7SVprdn8Ja+sb6
         FB0z1/DzFziHBSNlydK6OOLst/iw/KIwBcpJ4X5dntbxvHHFwfqoQ8pQbdGdDDB/uX/L
         2FRHbbAPkM8BppsAQsux617m3WDJZweE9G7cUEyHrl4BNpcWGK/vgwhkQaP8M/1S/YRs
         JlB5aZ2AT0vyiWt18JTFueUmIv/S7dVh5I5+nHzTeM7RnnpLlaxCwNldjeQyGlq6D12F
         /hxw==
X-Gm-Message-State: AFqh2kp8ca8Lf/Mxjquphb3f+cfISc7cufurdVlnR38La7yjw3w+uJMA
	Q4lYX/9LCexlIchZH4UNE7RHiJEG93E=
X-Google-Smtp-Source: AMrXdXuDnJcmDhY4vXJWV3RMBa+pwIsxRHLTJjffKGF7HEP1Iu1JMB0xAACw74XZS9SK5NXU7S6IBw==
X-Received: by 2002:a05:6a21:1707:b0:af:7773:9535 with SMTP id nv7-20020a056a21170700b000af77739535mr32635052pzb.33.1672297953783;
        Wed, 28 Dec 2022 23:12:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id n16-20020a63ee50000000b004812f798a37sm10398347pgk.60.2022.12.28.23.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 23:12:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] rust: Do not use open64 on musl in getrandom crate
Date: Wed, 28 Dec 2022 23:12:29 -0800
Message-Id: <20221229071231.4107849-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175091

LFS64 functions are deprecated in latest musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 .../rust/rust/getrandom-open64.patch          | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust/getrandom-open64.patch

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index b63e18ac95..f94d616d26 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,6 +3,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUS=
T_VERSION}-src.tar.xz;n
 SRC_URI[rust.sha256sum] =3D "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d2=
9281a07419c4950715c"
=20
 SRC_URI:append:class-target:pn-rust =3D " \
+    file://getrandom-open64.patch \
     file://hardcodepaths.patch \
     file://crossbeam_atomic.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepath=
s.patch"
diff --git a/meta/recipes-devtools/rust/rust/getrandom-open64.patch b/meta/=
recipes-devtools/rust/rust/getrandom-open64.patch
new file mode 100644
index 0000000000..6fc981e2aa
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust/getrandom-open64.patch
@@ -0,0 +1,29 @@
+Do not use open64 on linux with musl
+
+glibc is providing open64 and other lfs64 functions but musl aliases
+them to normal equivalents since off_t is always 64-bit on musl,
+therefore check for target env along when target OS is linux before
+using open64, this is more available. Latest Musl has made these
+namespace changes [1]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b41=
cd8df8d0ef9736d95f4
+
+Upstream-Status: Submitted [https://github.com/rust-random/getrandom/pull/=
326]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/vendor/getrandom-0.2.0/.cargo-checksum.json
++++ b/vendor/getrandom-0.2.0/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CHANGELOG.md":"4a5b61c82668507beffc7ad33f602257013263d7847cf17=
a246ef1128ba27950","Cargo.toml":"b59322815506cf16acd6e0cbe2634dec1be0886e68=
6b51fa5cdf5a5ac9fdcf32","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"e0bacefbe4310c23578c659=
26bda6e4318750f6718bb6b97ff9a4fa9056af6a6","benches/mod.rs":"5495735ff210a5=
0cab23c2cc84191ed910af7c30395a3d9d6095b722765b3864","build.rs":"90355b5e76d=
edd97d604cd83b4a0a5ab074bbd4dde9632ee2b56c87c175b1e14","src/bsd_arandom.rs"=
:"d2ee195acd80c7d1364a369ad0d2dad46f5f9f973f9d3960367413fd87acfcd6","src/cl=
oudabi.rs":"9201af65a607587aa8615ec92cfab9d176f4199f6799dad9ca743c51d175028=
b","src/custom.rs":"f75ef80ec024fe3c97c7faff79de9f7d457993ed3c5f69f21593e14=
0c8b62790","src/error.rs":"f40aa6cb36bc024285dc2e40349fdd3754db949a307ec738=
31ec253549d2b0a3","src/error_impls.rs":"733ed75ab89a9d0d5a7cc7abd85f31a23d7=
72ea9c1e7c10def1477207d19fd8b","src/fuchsia.rs":"470d8509deb5b06fa6417f294c=
0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"cc46ee9c48ab746d2af34=
2a242e383b8de840045d3f52fd77ee337161367a1a1","src/lib.rs":"6aff4b429e4b1a07=
aad2ab7148d7cc9d0987b230597649af42041508320592e0","src/linux_android.rs":"3=
9cb80999c8534145240a350976d261b8924436bf9a4563960c7bd8c2c83c773","src/macos=
.rs":"b692f2fcc2319a5195f47751d5bd7dd87c7c24a61d14fa4e3dbc992ae66212b7","sr=
c/openbsd.rs":"066b2dd395c190444a658bb0b52a052eabbd68ea5a534fb729c7e5373abc=
0a6a","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed750d3339e342ab1=
44e1709827e4","src/solaris_illumos.rs":"9c7004446fabe5a7a21c73d5a65d7e2115b=
5bd1d1dbb735c984cab3dba239785","src/stdweb.rs":"f140081e47cfbb61937212e7840=
391bce5adf7829039d732d62b82a19e567dfa","src/test_common.rs":"895d71c06722e3=
a6f365999d29430f37f571aeb1eb4a525777b760005c9818be","src/test_rdrand.rs":"8=
c8df6de836463a41808396016428bf0a2a69c715ae96e7e0e7598fcea61ace8","src/use_f=
ile.rs":"c9fe635a83614be6f303e40f98b8e678c36ac6d9724b024430d3ea1ad1510add",=
"src/util.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72c=
da8b","src/util_libc.rs":"d851394bc9c43dc09afde1e03401aa6c207858ec58fdffbc5=
131911b116418c7","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af311=
1e4bacd2e12505a8d50a3505","src/wasi.rs":"3413e5a391b156f5d05600f4651f7f8eb4=
df2c8984fca7766ca50c0cfe0b2e9c","src/wasm-bindgen.rs":"0648388724c46697a9b3=
c654b8d931b2bf187a3193ca1888221d4529f764e376","src/windows.rs":"39dfae2814d=
958993619c3654bb39745de897971aea7a414fa32f90770850ce2","src/windows_uwp.rs"=
:"672f41a0fac79a71bfaaecad59826c948b8538f69a0133ab1c09a1865ecd6114"},"packa=
ge":"ee8025cf36f917e6a52cce185b7c7177689b838b7ec138364e50cc2277a56cf4"}
+\ No newline at end of file
++{"files":{"CHANGELOG.md":"4a5b61c82668507beffc7ad33f602257013263d7847cf17=
a246ef1128ba27950","Cargo.toml":"b59322815506cf16acd6e0cbe2634dec1be0886e68=
6b51fa5cdf5a5ac9fdcf32","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"e0bacefbe4310c23578c659=
26bda6e4318750f6718bb6b97ff9a4fa9056af6a6","benches/mod.rs":"5495735ff210a5=
0cab23c2cc84191ed910af7c30395a3d9d6095b722765b3864","build.rs":"90355b5e76d=
edd97d604cd83b4a0a5ab074bbd4dde9632ee2b56c87c175b1e14","src/bsd_arandom.rs"=
:"d2ee195acd80c7d1364a369ad0d2dad46f5f9f973f9d3960367413fd87acfcd6","src/cl=
oudabi.rs":"9201af65a607587aa8615ec92cfab9d176f4199f6799dad9ca743c51d175028=
b","src/custom.rs":"f75ef80ec024fe3c97c7faff79de9f7d457993ed3c5f69f21593e14=
0c8b62790","src/error.rs":"f40aa6cb36bc024285dc2e40349fdd3754db949a307ec738=
31ec253549d2b0a3","src/error_impls.rs":"733ed75ab89a9d0d5a7cc7abd85f31a23d7=
72ea9c1e7c10def1477207d19fd8b","src/fuchsia.rs":"470d8509deb5b06fa6417f294c=
0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"cc46ee9c48ab746d2af34=
2a242e383b8de840045d3f52fd77ee337161367a1a1","src/lib.rs":"6aff4b429e4b1a07=
aad2ab7148d7cc9d0987b230597649af42041508320592e0","src/linux_android.rs":"3=
9cb80999c8534145240a350976d261b8924436bf9a4563960c7bd8c2c83c773","src/macos=
.rs":"b692f2fcc2319a5195f47751d5bd7dd87c7c24a61d14fa4e3dbc992ae66212b7","sr=
c/openbsd.rs":"066b2dd395c190444a658bb0b52a052eabbd68ea5a534fb729c7e5373abc=
0a6a","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed750d3339e342ab1=
44e1709827e4","src/solaris_illumos.rs":"9c7004446fabe5a7a21c73d5a65d7e2115b=
5bd1d1dbb735c984cab3dba239785","src/stdweb.rs":"f140081e47cfbb61937212e7840=
391bce5adf7829039d732d62b82a19e567dfa","src/test_common.rs":"895d71c06722e3=
a6f365999d29430f37f571aeb1eb4a525777b760005c9818be","src/test_rdrand.rs":"8=
c8df6de836463a41808396016428bf0a2a69c715ae96e7e0e7598fcea61ace8","src/use_f=
ile.rs":"c9fe635a83614be6f303e40f98b8e678c36ac6d9724b024430d3ea1ad1510add",=
"src/util.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72c=
da8b","src/util_libc.rs":"c602b47e2958fa94443b3690faddf52a8c545689d18579c86=
dd8a07927c145b1","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af311=
1e4bacd2e12505a8d50a3505","src/wasi.rs":"3413e5a391b156f5d05600f4651f7f8eb4=
df2c8984fca7766ca50c0cfe0b2e9c","src/wasm-bindgen.rs":"0648388724c46697a9b3=
c654b8d931b2bf187a3193ca1888221d4529f764e376","src/windows.rs":"39dfae2814d=
958993619c3654bb39745de897971aea7a414fa32f90770850ce2","src/windows_uwp.rs"=
:"672f41a0fac79a71bfaaecad59826c948b8538f69a0133ab1c09a1865ecd6114"},"packa=
ge":"ee8025cf36f917e6a52cce185b7c7177689b838b7ec138364e50cc2277a56cf4"}
+--- a/vendor/getrandom-0.2.0/src/util_libc.rs
++++ b/vendor/getrandom-0.2.0/src/util_libc.rs
+@@ -97,7 +97,7 @@ impl Weak {
+ }
+=20
+ cfg_if! {
+-    if #[cfg(any(target_os =3D "linux", target_os =3D "emscripten"))] {
++    if #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")), =
target_os =3D "emscripten"))] {
+         use libc::open64 as open;
+     } else {
+         use libc::open;
--=20
2.39.0


