Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED40C001DE
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 08:24:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.81910.1691915061222614163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 01:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eH3bIIoX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31792ac0fefso2866627f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691915059; x=1692519859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhnkw33eqH+WP6HFEVZeIVBQQO9Lr1WRZ33UxXeHD3Y=;
        b=eH3bIIoXOKAZxQUEv/SEK5Io9iEYsa83GmB9Az8REoX+LoS7pZ3GLvgCBdOE5DlGPY
         u9dx0SFOXWojW1kmpgciE6ZJZdIP9pYLGsTrNG3uKuZvQHNXEolKRLXP+KWctwavqnoA
         jDfVbSCaHCp+fh2km25RmPtjDfiH/hbayUI50Ng24Qs3wZ04RK3o7XzeabDXFwX7pZxI
         or+Tbog5pqmcvsuhunH5uqMoQy2+ieLDI3yzRBrWl4kpqouTckO+zJFjXPAcCsWkr4Eu
         MWMfdtyfdPiPFp+x2qm7jiM/r+9vBnRfGLfcvNEiq8mzTA7z+cmcBuanODpsLqsb34Eg
         arbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691915059; x=1692519859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhnkw33eqH+WP6HFEVZeIVBQQO9Lr1WRZ33UxXeHD3Y=;
        b=a8+nTCo8L++u25XLTJL3uNP9Bts0Qk/r/pm0j815ymcLeP1DwrhkhuugX54YETczVj
         BD09J7sljxaa3x2JOwNd248r9C7ayu4G8GwvdRDzAHOmjhQSi9Z4jHLhsD12TwUexyae
         215rDLyXBPeKj1bOKqY2l7wCHIeUY5PuDR/f7yY6TkNS5QYbFEeIlsK2khcUjhe8R/6b
         quT0TaJgrlVIfTAiUKTXhY3TpWbYkbo01OSc5lp/Irw+y7aaaWPgTetqJYAtyRXXxqcR
         mCopBQp1O7NZ94Diz/1//AwI4hQ48bPAQ7J4p52TT8gB2moRF9VIWebcV9eAWKg1yG0b
         y+Uw==
X-Gm-Message-State: AOJu0YwnLzIFuoWh1/4WdMvgfVFG2PjwtAd2lc1adW20344llBa8DIaM
	VvYSf25v14U4E8k2s3eY+mfI1DVka78=
X-Google-Smtp-Source: AGHT+IEYoEtaCtTmcWiUXprx6VXU/3eauHS/qxdhnPEOszi97EfzYM/wEKJ7PzO7lzI2kMVRmOCKSw==
X-Received: by 2002:a5d:6b88:0:b0:317:67bf:3387 with SMTP id n8-20020a5d6b88000000b0031767bf3387mr4391746wrx.60.1691915057674;
        Sun, 13 Aug 2023 01:24:17 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:e135:6fa3:a98f:aed0])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b00318147fd2d3sm10601450wrq.41.2023.08.13.01.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 01:24:17 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 3/4] rust: provide examples for C library generation in rust
Date: Sun, 13 Aug 2023 10:23:56 +0200
Message-Id: <33c2cfcecf6e01b265e9e35e65e4e2ee34cb2f00.1691914589.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691914589.git.frederic.martinsons@gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185866

From: Frederic Martinsons <frederic.martinsons@gmail.com>

rust-c-lib-example is a little rust code which provide
a single function to print a formatted date (via the chrono crate)
from an input timestamp in millisecond. It has the necessary FFI
annotation and inherit cargo_c class for the C ABI compatible
library generation.

rust-c-lib-example is meson project for the C code which
will call the print_date function from rust-c-lib-example
if no argument is provided, if any argument is provided
it will print "Hello world in rust from C!"

add a runtime test case to check if all went well.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../rust/rust-c-lib-example-bin_git.bb        | 16 ++++
 .../rust/rust-c-lib-example-crates.inc        | 79 +++++++++++++++++++
 .../rust/rust-c-lib-example_git.bb            | 15 ++++
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/lib/oeqa/runtime/cases/rust.py           | 12 +++
 5 files changed, 124 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb

diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
new file mode 100644
index 0000000000..47d878597a
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A simple example for C wrapper around a rust library"
+HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
+
+SRC_URI = " \
+	git://gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https \
+"
+
+SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
+S = "${WORKDIR}/git"
+
+DEPENDS = "rust-c-lib-example"
+
+inherit meson pkgconfig
+
diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
new file mode 100644
index 0000000000..05f5949203
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
@@ -0,0 +1,79 @@
+SRC_URI += " \
+    crate://crates.io/android-tzdata/0.1.1 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bumpalo/3.13.0 \
+    crate://crates.io/cc/1.0.82 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.26 \
+    crate://crates.io/core-foundation-sys/0.8.4 \
+    crate://crates.io/iana-time-zone/0.1.57 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/js-sys/0.3.64 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/num-traits/0.2.16 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/proc-macro2/1.0.66 \
+    crate://crates.io/quote/1.0.32 \
+    crate://crates.io/syn/2.0.28 \
+    crate://crates.io/time/0.1.45 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.87 \
+    crate://crates.io/wasm-bindgen-backend/0.2.87 \
+    crate://crates.io/wasm-bindgen-macro/0.2.87 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
+    crate://crates.io/wasm-bindgen-shared/0.2.87 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+"
+
+SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bumpalo-3.13.0.sha256sum] = "a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1"
+SRC_URI[cc-1.0.82.sha256sum] = "305fe645edc1442a0fa8b6726ba61d422798d37a52e12eaecf4b022ebbb88f01"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[chrono-0.4.26.sha256sum] = "ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5fd9bc5"
+SRC_URI[core-foundation-sys-0.8.4.sha256sum] = "e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa"
+SRC_URI[iana-time-zone-0.1.57.sha256sum] = "2fad5b825842d2b38bd206f3e81d6957625fd7f0a361e345c30e01a0ae2dd613"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[js-sys-0.3.64.sha256sum] = "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[num-traits-0.2.16.sha256sum] = "f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
+SRC_URI[quote-1.0.32.sha256sum] = "50f3b39ccfb720540debaa0164757101c08ecb8d326b15358ce76a62c7e85965"
+SRC_URI[syn-2.0.28.sha256sum] = "04361975b3f5e348b2189d8dc55bc942f278b2d482a6a0365de5bdd62d351567"
+SRC_URI[time-0.1.45.sha256sum] = "1b797afad3f312d1c66a56d11d0316f916356d11bd158fbc6ca6389ff6bf805a"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] = "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
+SRC_URI[wasm-bindgen-0.2.87.sha256sum] = "7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf60499a342"
+SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] = "5ef2b6d3c510e9625e5fe6f509ab07d66a760f0885d858736483c32ed7809abd"
+SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] = "dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
+SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] = "54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
+SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] = "ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.48.0.sha256sum] = "e686886bc078bc1b0b600cac0147aadb815089b6e4da64016cbd754b6342700f"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
new file mode 100644
index 0000000000..6e7c250b92
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A simple example for rust C library"
+HOMEPAGE = "https://gitlab.com/fmartinsonsHome/rust-c-lib-example"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb9c441273ed8a029701a086befbfc63"
+
+SRC_URI = " \
+	git://gitlab.com/fmartinsonsHome/rust-c-lib-example.git;branch=main;protocol=https \
+"
+
+SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
+S = "${WORKDIR}/git"
+
+inherit cargo_c
+
+require ${BPN}-crates.inc
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 202e5739a0..b9fda0db09 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -734,6 +734,8 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-c-lib-example = "Frederic Martinsons <frederic.martinsons@gmail.com>"
+RECIPE_MAINTAINER:pn-rust-c-lib-example-bin = "Frederic Martinsons <frederic.martinsons@gmail.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index 9bf0312669..e709e4f8aa 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -48,3 +48,15 @@ class RustCompileTest(OERuntimeTestCase):
         status, output = self.target.run('cargo run --manifest-path=/tmp/hello/Cargo.toml')
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
+
+class RustCLibExampleTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['rust-c-lib-example-bin'])
+    def test_rust_c_lib_example(self):
+        cmd = "rust-c-lib-example-bin test"
+        status, output = self.target.run(cmd)
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "Hello world in rust from C!", msg=msg)
-- 
2.34.1


