Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1947.1792480406937562246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=h3kZiaKd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=euO5Q3zs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a158286978-7d258d7e-3ca4-4f6f-a117-aa8422289b67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jEiT2tWqdsm8T6vzOHYRX3akJJTWMX9zdto1igIb83o=;
	b=h3kZiaKdMg8aIwsCi5y0gcOAG//um7p7qghVArH0xGLki9KEIbfq2xjU06ExrSc6
	ZGu0dyLj+dAH+tXwp3rebnfnnfeNuImjgzNlGLdfBHAGHrxqXyM7vdQvRbx7wzdQ7rs
	3wVLd7kuOmLP0xYRW0/8K+EfOWMesOy2Kgj2c+O8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jEiT2tWqdsm8T6vzOHYRX3akJJTWMX9zdto1igIb83o=;
	b=euO5Q3zsCIRoe4JdKz/3EN5DRwqHxZKRXVrktYoZD1pXmgwWkETENp3DkfTqSyqu
	ipPrh7x3SY7kbmBS7A+OR81/4OKy1Vd+hJ9d4dHI8doeiqBFNLvj5JL3G8S0RCqjsBB
	hricICzPZEjGaSTXZTKf9Ca4eLwe43hVIcJGNyyw=
Content-Type: multipart/mixed; boundary="===============8677367641237674411=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.3 SUCCEEDED
Message-ID: <010101a158286978-7d258d7e-3ca4-4f6f-a117-aa8422289b67-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248235

--===============8677367641237674411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.0-0.13.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2fe56120128d6acdc0985a12e3836a7ecaab46e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:54:48 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.0 -> 0.13.3

---
 .../python/python3-uv-build-crates.inc        | 116 ++++++++----------
 ...d_0.13.0.bb => python3-uv-build_0.13.3.bb} |   2 +-
 2 files changed, 51 insertions(+), 67 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.0.bb => python3-uv-build_0.13.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 40087d0541..ac5523926b 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -11,18 +11,19 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.14 \
+    crate://crates.io/archive-trait/0.0.15 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
+    crate://crates.io/astral-mail-headers/0.0.1 \
     crate://crates.io/astral-tokio-tar/0.7.0 \
     crate://crates.io/astral-version-ranges/0.2.2 \
-    crate://crates.io/astral_async_zip/0.0.21 \
-    crate://crates.io/async-compression/0.4.45 \
+    crate://crates.io/astral_async_zip/0.0.22 \
+    crate://crates.io/async-compression/0.4.48 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/boxcar/0.2.14 \
@@ -34,23 +35,21 @@ SRC_URI += " \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.6 \
-    crate://crates.io/clap_builder/4.6.6 \
-    crate://crates.io/clap_derive/4.6.4 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_derive/4.6.7 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/compression-codecs/0.4.45 \
     crate://crates.io/compression-core/0.4.33 \
-    crate://crates.io/console/0.16.4 \
+    crate://crates.io/console/0.16.6 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
-    crate://crates.io/crc32fast/1.5.0 \
+    crate://crates.io/crc32fast/1.5.2 \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.11.1 \
     crate://crates.io/defmt/1.1.0 \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
@@ -66,7 +65,6 @@ SRC_URI += " \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
     crate://crates.io/equivalent/1.0.2 \
-    crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/fixedbitset/0.5.7 \
@@ -103,7 +101,7 @@ SRC_URI += " \
     crate://crates.io/icu_provider/2.1.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.14.1 \
+    crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/insta/1.48.0 \
     crate://crates.io/io-extras/0.19.0 \
@@ -113,11 +111,9 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff/0.2.37 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.35 \
-    crate://crates.io/jiff-tzdb/0.1.8 \
-    crate://crates.io/jiff-tzdb-platform/0.1.3 \
+    crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
@@ -126,7 +122,6 @@ SRC_URI += " \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/maybe-owned/0.3.4 \
     crate://crates.io/memchr/2.8.3 \
@@ -160,7 +155,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
-    crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -174,7 +168,7 @@ SRC_URI += " \
     crate://crates.io/rkyv/0.8.18 \
     crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/rustc-hash/2.1.3 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustix-linux-procfs/0.1.1 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -185,7 +179,6 @@ SRC_URI += " \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
     crate://crates.io/serde/1.0.229 \
-    crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.30.0 \
@@ -199,7 +192,7 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.0 \
+    crate://crates.io/smallvec/1.16.1 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
@@ -207,14 +200,14 @@ SRC_URI += " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.14 \
-    crate://crates.io/tar-framing/0.0.14 \
+    crate://crates.io/tar-codec/0.0.15 \
+    crate://crates.io/tar-framing/0.0.15 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
-    crate://crates.io/textwrap/0.16.2 \
+    crate://crates.io/textwrap/0.16.4 \
     crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
@@ -224,10 +217,10 @@ SRC_URI += " \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/toml/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
@@ -236,7 +229,6 @@ SRC_URI += " \
     crate://crates.io/tracing-subscriber/0.3.23 \
     crate://crates.io/tracing-test/0.2.6 \
     crate://crates.io/tracing-test-macro/0.2.6 \
-    crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
@@ -245,7 +237,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.24.0 \
+    crate://crates.io/uuid/1.26.1 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -294,8 +286,8 @@ SRC_URI += " \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
-    crate://crates.io/zerocopy/0.8.56 \
-    crate://crates.io/zerocopy-derive/0.8.56 \
+    crate://crates.io/zerocopy/0.8.57 \
+    crate://crates.io/zerocopy-derive/0.8.57 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
     crate://crates.io/zerotrie/0.2.3 \
@@ -314,18 +306,19 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.14.sha256sum] = "c6080ea14ccf9019d7ce572c319e581c20a805c9bdc6dbfb9b988da003cbd1a3"
+SRC_URI[archive-trait-0.0.15.sha256sum] = "999bf88cc483664cab77700ca2fdfb0415a73412abe284ef5bc2319d00938e00"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
+SRC_URI[astral-mail-headers-0.0.1.sha256sum] = "dc019ecca82cfc91ffa31ab4ffe705aaa706399840a7152926b7eee736da410a"
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] = "6f2e989b33246fe9240d39accf4dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
 SRC_URI[astral-version-ranges-0.2.2.sha256sum] = "81129e143a7bcea263d5a2c50b8be47ac58365dde618bc1ac50f69f497c9cb63"
-SRC_URI[astral_async_zip-0.0.21.sha256sum] = "13f4a9bc6289d907c8e883d25026a54751d686da9926af271d0fc4cbe58a7f4d"
-SRC_URI[async-compression-0.4.45.sha256sum] = "24a8ec73eb862508b7041723c89386365894b4e7d9f6998bf1b8529e5b0ee254"
+SRC_URI[astral_async_zip-0.0.22.sha256sum] = "0f8508d09c6bc6abd42767d1d43c7702891691484875ce94f7997da1301d95e9"
+SRC_URI[async-compression-0.4.48.sha256sum] = "fb61aea1a7def73ee7c350a184f0e70b32c182344e2e75bf70c9b621b83417fd"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
@@ -337,23 +330,21 @@ SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da7860
 SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
-SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
-SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[compression-codecs-0.4.45.sha256sum] = "98fc98460ba0ad5317075d3632b8dfc45d0be8c4a49347c2a38272019717614a"
 SRC_URI[compression-core-0.4.33.sha256sum] = "6e8ccc4ea9f6acc32d102c0f6d471d11d913ad15f20c04de743374861fa1d414"
-SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
+SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
-SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
+SRC_URI[crc32fast-1.5.2.sha256sum] = "01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
 SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
 SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
@@ -369,7 +360,6 @@ SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db9146
 SRC_URI[enumflags2-0.7.12.sha256sum] = "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] = "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
-SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
@@ -406,7 +396,7 @@ SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.14.1.sha256sum] = "07aa2048142242915a31d35844fb311e0e53fcca590c3a0a40dcf1b841fa09eb"
+SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
@@ -416,11 +406,9 @@ SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
-SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
-SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
+SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
@@ -429,7 +417,6 @@ SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a9155
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[maybe-owned-0.3.4.sha256sum] = "4facc753ae494aeb6e3c22f839b158aebd4f9270f55cd3c79906c45476c47ab4"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
@@ -463,7 +450,6 @@ SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
-SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -477,7 +463,7 @@ SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce
 SRC_URI[rkyv-0.8.18.sha256sum] = "d9776093b7ca170454ab1406954f7b7d97a57c51dc6c0642957fb2ef25c2d399"
 SRC_URI[rkyv_derive-0.8.18.sha256sum] = "1c25ef604ac7dd839d44d64648952ea23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
 SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
@@ -488,7 +474,6 @@ SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01b
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
 SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
-SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
@@ -502,7 +487,7 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.0.sha256sum] = "b9be42f50aa861c555654aa3a37f52f4b1074bacf4e48fe0ef7fa584e80f1f0f"
+SRC_URI[smallvec-1.16.1.sha256sum] = "ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
@@ -510,14 +495,14 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.14.sha256sum] = "7ea42eb144d30fcbf32c26dfea8959175bb8335bfb7b18d20c6ed32edecf0551"
-SRC_URI[tar-framing-0.0.14.sha256sum] = "783223a7a6590be4227cb821e7ce80372575511f67c824921aba0752d8ad5573"
+SRC_URI[tar-codec-0.0.15.sha256sum] = "b9dad615e50d181afea4bafea23dacb8e33ed52dde06503813570634b932d467"
+SRC_URI[tar-framing-0.0.15.sha256sum] = "563e8181b47c9cdcce569eae3ad431eec71543d6269dd60c7bd2350f70bcd233"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
-SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
+SRC_URI[textwrap-0.16.4.sha256sum] = "6ecfad6c3abc80a577f2b91c1e412ee57e7a060d430b553c1b0c940974ebcd49"
 SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
@@ -527,10 +512,10 @@ SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df
 SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
+SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
-SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] = "1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614"
+SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
 SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
@@ -539,7 +524,6 @@ SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54
 SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
 SRC_URI[tracing-test-0.2.6.sha256sum] = "19a4c448db514d4f24c5ddb9f73f2ee71bfb24c526cf0c570ba142d1119e0051"
 SRC_URI[tracing-test-macro-0.2.6.sha256sum] = "ad06847b7afb65c7866a36664b75c40b895e318cea4f71299f013fb22965329d"
-SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
@@ -548,7 +532,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.24.0.sha256sum] = "bf3923a6f5c4c6382e0b653c4117f48d631ea17f38ed86e2a828e6f7412f5239"
+SRC_URI[uuid-1.26.1.sha256sum] = "2ef6dac1e96601b4fb3acccccff2139741fcb757cb9a36089bf5be91cfb285ce"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
@@ -597,8 +581,8 @@ SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
-SRC_URI[zerocopy-0.8.56.sha256sum] = "556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb"
-SRC_URI[zerocopy-derive-0.8.56.sha256sum] = "f2ab42fc20575779bd240faa45f94a74256f755c0fa9e89f0ede20d91d0cdfc1"
+SRC_URI[zerocopy-0.8.57.sha256sum] = "d35102a9f36d089ccae9e4c6802bc118be4487b80aaffc0ab4e0cf5ce92d2873"
+SRC_URI[zerocopy-derive-0.8.57.sha256sum] = "146c01f5ab44258da43cf276c74a2763db2ff3969c9c652c3f2de07041d0b2bc"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
 SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.3.bb
index 2ad38b2054..3561ebd7d8 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e033186a8423b8a3515"
+SRC_URI[sha256sum] = "8bdc4ba30dd8e720129763d3504f5283c2137433154b9824aa78058ee6f80f80"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============8677367641237674411==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.0-0.13.3.patch"

RnJvbSAyZmU1NjEyMDEyOGQ2YWNkYzA5ODVhMTJlMzgzNmE3ZWNhYWI0NmU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6NTQ6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuMCAtPiAwLjEzLjMKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgMTE2ICsrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEzLjAuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjMuYmJ9IHwgICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
My4wLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMy4zLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5p
bmMKaW5kZXggNDAwODdkMDU0MS4uYWM1NTIzOTI2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAgLTEx
LDE4ICsxMSwxOSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5
bGUtcXVlcnkvMS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtd2luY29uLzMu
MC4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC4xMDQgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2FyY2hpdmUtdHJhaXQvMC4wLjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9hcmNoaXZlLXRyYWl0LzAuMC4xNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJjc3RyLzEu
Mi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJheXZlYy8wLjcuOCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXN0cmFsLW1haWwtaGVhZGVycy8wLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0
cmFsLXZlcnNpb24tcmFuZ2VzLzAuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxf
YXN5bmNfemlwLzAuMC4yMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN5bmMtY29tcHJlc3Np
b24vMC40LjQ1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxfYXN5bmNfemlwLzAuMC4y
MiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN5bmMtY29tcHJlc3Npb24vMC40LjQ4IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9iYWNrb24vMS42LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzEuMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9iaXRmbGFncy8yLjEzLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIu
MTMuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmxvY2stYnVmZmVyLzAuMTAuNCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vYmxvY2stYnVmZmVyLzAuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYm94Y2FyLzAuMi4xNCBcCkBAIC0zNCwyMyArMzUsMjEgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXAtcHJpbWl0aXZlcy80LjAuMyBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2FwLXN0ZC80LjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlm
LzEuMC40IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jaGFyc2V0LzAuMS41IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9jbGFwLzQuNi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2J1
aWxkZXIvNC42LjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfZGVyaXZlLzQuNi40IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwLzQuNi43IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9jbGFwX2J1aWxkZXIvNC42LjcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfZGVyaXZl
LzQuNi43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2xleC8xLjEuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY29sb3JjaG9pY2UvMS4wLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NvbXByZXNzaW9uLWNvZGVjcy8wLjQuNDUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbXBy
ZXNzaW9uLWNvcmUvMC40LjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25zb2xlLzAuMTYu
NCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29uc29sZS8wLjE2LjYgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMi4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1
ZmVhdHVyZXMvMC4zLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYzMyZmFzdC8xLjUuMCBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3JjMzJmYXN0LzEuNS4yIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jcnlwdG8tY29tbW9uLzAuMS43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcnlw
dG8tY29tbW9uLzAuMi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jc3YvMS40LjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2Nzdi1jb3JlLzAuMS4xMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZGF0YS1lbmNvZGluZy8yLjExLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RlZm10LzEu
MS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9kZWZtdC1tYWNyb3MvMS4xLjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2RlZm10LXBhcnNlci8xLjAuMCBcCkBAIC02Niw3ICs2NSw2IEBAIFNS
Q19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW51bWZsYWdzMi8wLjcuMTIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VudW1mbGFnczJfZGVyaXZlLzAuNy4xMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZXF1aXZhbGVudC8xLjAuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZXJhc2VkLXNlcmRlLzAuNC4xMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXJybm8vMC4zLjE0
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mYXN0cmFuZC8yLjUuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZml4ZWRiaXRzZXQvMC41LjcgXApAQCAtMTAzLDcgKzEwMSw3IEBAIFNSQ19VUkkg
Kz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X3Byb3ZpZGVyLzIuMS4xIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pZG5hLzEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pZG5h
X2FkYXB0ZXIvMS4yLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZGV4bWFwLzIuMTQuMSBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kZXhtYXAvMi4xNC4yIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pbmRvYy8yLjAuNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5zdGEvMS40OC4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pby1leHRyYXMvMC4xOS4wIFwKQEAgLTExMywxMSAr
MTExLDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pc190ZXJtaW5h
bF9wb2x5ZmlsbC8xLjcwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0ZXJ0b29scy8wLjE0
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0b2EvMS4wLjE3IFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9qaWZmLzAuMi4zNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi8wLjIuMzcg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtY29yZS8wLjEuMCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjM1IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZm
LXR6ZGIvMC4xLjggXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpkYi1wbGF0Zm9ybS8w
LjEuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjM3IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9q
dW5jdGlvbi8yLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6eV9zdGF0aWMvMS41LjAg
XApAQCAtMTI2LDcgKzEyMiw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbGl0ZW1hcC8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9ja19hcGkvMC40LjE0
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sb2cvMC40LjI5IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9tYWlscGFyc2UvMC4xNi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYXRjaGVycy8w
LjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWF5YmUtb3duZWQvMC4zLjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjguMyBcCkBAIC0xNjAsNyArMTU1LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wdHJfbWV0YS8wLjMuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGFfZGVyaXZlLzAuMy4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9xdW90ZS8xLjAuNDcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlZF9wcmludGFi
bGUvMC41LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ItZWZpLzYuMC4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9yYW5jb3IvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZG94
X3N5c2NhbGwvMC41LjE1IFwKQEAgLTE3NCw3ICsxNjgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE4IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
a3l2X2Rlcml2ZS8wLjguMTggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RjLWhhc2gvMi4x
LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC8xLjEuNCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcnVzdGl4LzEuMS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgtbGlu
dXgtcHJvY2ZzLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0dmVyc2lvbi8xLjAu
MjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J5dS8xLjAuMjMgXApAQCAtMTg1LDcgKzE3OSw2
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VhaGFzaC80LjEuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VsZi1yZXBsYWNlLzEuNS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zZXJkZS8xLjAuMjI5IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZS11
bnRhZ2dlZC8wLjEuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfY29yZS8xLjAuMjI5
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9kZXJpdmUvMS4wLjIyOSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlX2ludGVybmFscy8wLjMwLjAgXApAQCAtMTk5LDcg
KzE5Miw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZHV0Zjgv
MC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWlsYXIvMi43LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NsYWIvMC40LjEyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZl
Yy8xLjE2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTYuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc21hd2svMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Nv
Y2tldDIvMC42LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgvMC4xMy41IFwKQEAgLTIw
NywxNCArMjAwLDE0IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3Ry
aXAtYW5zaS1lc2NhcGVzLzAuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdHJzaW0vMC4x
MS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjExOCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc3luLzMuMC41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMy4wLjYgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVjdHVyZS8wLjEzLjIgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3Rhci1jb2RlYy8wLjAuMTQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1m
cmFtaW5nLzAuMC4xNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWNvZGVjLzAuMC4xNSBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWZyYW1pbmcvMC4wLjE1IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90ZW1wLWVudi8wLjMuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZp
bGUvMy4yNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtaW5hbF9zaXplLzAuNC40IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXh0d3JhcC8wLjE2LjIgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RleHR3cmFwLzAuMTYuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9y
LzIuMC4yMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMi4wLjIwIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90aHJlYWRfbG9jYWwvMS4xLjkgXApAQCAtMjI0LDEwICsy
MTcsMTAgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8xLjUz
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLW1hY3Jvcy8yLjcuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdG9raW8tc3RyZWFtLzAuMS4xOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9tbC8xLjEuMytzcGVjLTEuMS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sLzEu
MS42K3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZGF0ZXRpbWUvMS4x
LjErc3BlYy0xLjEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9lZGl0LzAuMjUuMTMr
c3BlYy0xLjEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9wYXJzZXIvMS4xLjIrc3Bl
Yy0xLjEuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9lZGl0LzAuMjUuMTUrc3BlYy0x
LjEuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9wYXJzZXIvMS4xLjUrc3BlYy0xLjEu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF93cml0ZXIvMS4xLjIrc3BlYy0xLjEuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy8wLjEuNDQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RyYWNpbmctYXR0cmlidXRlcy8wLjEuMzEgXApAQCAtMjM2LDcgKzIyOSw2IEBAIFNS
Q19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1zdWJzY3JpYmVyLzAu
My4yMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy10ZXN0LzAuMi42IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXRlc3QtbWFjcm8vMC4yLjYgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3R5cGVpZC8xLjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZW51bS8x
LjIwLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VjZC10cmllLzAuMS43IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4yNCBcCkBAIC0yNDUsNyArMjM3LDcgQEAg
U1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91cmwvMi41LjggXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3V0ZjhfaXRlci8xLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dXRmOHBhcnNlLzAuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjQuMCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjI2LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3ZhbHVhYmxlLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAu
OS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92dGUvMC4xNC4xIFwKQEAgLTI5NCw4ICsyODYs
OCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dyaXRlYWJsZS8wLjYu
MiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veW9rZS8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8veW9rZS1kZXJpdmUvMC44LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9jb3B5
LzAuOC41NiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2NvcHktZGVyaXZlLzAuOC41NiBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2NvcHkvMC44LjU3IFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby96ZXJvY29weS1kZXJpdmUvMC44LjU3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96
ZXJvZnJvbS8wLjEuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2Zyb20tZGVyaXZlLzAu
MS42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdHJpZS8wLjIuMyBcCkBAIC0zMTQsMTgg
KzMwNiwxOSBAQCBTUkNfVVJJW2Fuc3R5bGUtcGFyc2UtMS4wLjAuc2hhMjU2c3VtXSA9ICI1MmNl
N2YzOGIyNDIzMTlmN2NhYmFhNjgxMzA1NTQ2NzA2M2VjZAogU1JDX1VSSVthbnN0eWxlLXF1ZXJ5
LTEuMS41LnNoYTI1NnN1bV0gPSAiNDBjNDhmNzJmZDUzY2QyODkxMDRmYzY0MDk5YWJjYTczZGI0
MTY2YWQ4NmVhMGI0MzQxYWJlNjVhZjgzZGFkYyIKIFNSQ19VUklbYW5zdHlsZS13aW5jb24tMy4w
LjExLnNoYTI1NnN1bV0gPSAiMjkxZTZhMjUwZmY4NmNkNGE4MjAxMTJmYjg4OTg4MDhhMzY2ZDhm
OWY1OGNlMTZkMWY1MzgzNTNhZDU1NzQ3ZCIKIFNSQ19VUklbYW55aG93LTEuMC4xMDQuc2hhMjU2
c3VtXSA9ICIzMzBhNWVkMDdmYTU0ZTQ3MDJjOWQ2YzQxNzRmNzQ0MjdmYzBlZjZlMjE0YmJkNjc3
YWU1MGE1MDk5OTQ2NDcwIgotU1JDX1VSSVthcmNoaXZlLXRyYWl0LTAuMC4xNC5zaGEyNTZzdW1d
ID0gImM2MDgwZWExNGNjZjkwMTlkN2NlNTcyYzMxOWU1ODFjMjBhODA1YzliZGM2ZGJmYjliOTg4
ZGEwMDNjYmQxYTMiCitTUkNfVVJJW2FyY2hpdmUtdHJhaXQtMC4wLjE1LnNoYTI1NnN1bV0gPSAi
OTk5YmY4OGNjNDgzNjY0Y2FiNzc3MDBjYTJmZGZiMDQxNWE3MzQxMmFiZTI4NGVmNWJjMjMxOWQw
MDkzOGUwMCIKIFNSQ19VUklbYXJjc3RyLTEuMi4wLnNoYTI1NnN1bV0gPSAiMDM5MThjM2RiZDc3
MDFhODVjNmI5ODg3NzMyZTI5MjExNzVmMjZjMzUwYjQ1NjM4NDFkMDk1OGMyMWQ1N2U2ZCIKIFNS
Q19VUklbYXJyYXl2ZWMtMC43Ljguc2hhMjU2c3VtXSA9ICJkM2ZiNjdhNmUwOGFjZjI0ZmRlY2Ni
YWMyY2I2YWM0MzA1ODI1YmQxZjExNzQ2MmUwZTZmMmYxOTMzNDVhZDU2IgorU1JDX1VSSVthc3Ry
YWwtbWFpbC1oZWFkZXJzLTAuMC4xLnNoYTI1NnN1bV0gPSAiZGMwMTllY2NhODJjZmM5MWZmYTMx
YWI0ZmZlNzA1YWFhNzA2Mzk5ODQwYTcxNTI5MjZiN2VlZTczNmRhNDEwYSIKIFNSQ19VUklbYXN0
cmFsLXRva2lvLXRhci0wLjcuMC5zaGEyNTZzdW1dID0gIjZmMmU5ODliMzMyNDZmZTkyNDBkMzlh
Y2NmNGRkOWEwMWUwYjZjMWYzY2U5ZGQwOTVlMGE0N2ZhMDI1MDU1MjMiCiBTUkNfVVJJW2FzdHJh
bC12ZXJzaW9uLXJhbmdlcy0wLjIuMi5zaGEyNTZzdW1dID0gIjgxMTI5ZTE0M2E3YmNlYTI2M2Q1
YTJjNTBiOGJlNDdhYzU4MzY1ZGRlNjE4YmMxYWM1MGY2OWY0OTdjOWNiNjMiCi1TUkNfVVJJW2Fz
dHJhbF9hc3luY196aXAtMC4wLjIxLnNoYTI1NnN1bV0gPSAiMTNmNGE5YmM2Mjg5ZDkwN2M4ZTg4
M2QyNTAyNmE1NDc1MWQ2ODZkYTk5MjZhZjI3MWQwZmM0Y2JlNThhN2Y0ZCIKLVNSQ19VUklbYXN5
bmMtY29tcHJlc3Npb24tMC40LjQ1LnNoYTI1NnN1bV0gPSAiMjRhOGVjNzNlYjg2MjUwOGI3MDQx
NzIzYzg5Mzg2MzY1ODk0YjRlN2Q5ZjY5OThiZjFiODUyOWU1YjBlZTI1NCIKK1NSQ19VUklbYXN0
cmFsX2FzeW5jX3ppcC0wLjAuMjIuc2hhMjU2c3VtXSA9ICIwZjg1MDhkMDljNmJjNmFiZDQyNzY3
ZDFkNDNjNzcwMjg5MTY5MTQ4NDg3NWNlOTRmNzk5N2RhMTMwMWQ5NWU5IgorU1JDX1VSSVthc3lu
Yy1jb21wcmVzc2lvbi0wLjQuNDguc2hhMjU2c3VtXSA9ICJmYjYxYWVhMWE3ZGVmNzNlZTdjMzUw
YTE4NGYwZTcwYjMyYzE4MjM0NGUyZTc1YmY3MGM5YjYyMWI4MzQxN2ZkIgogU1JDX1VSSVthdXRv
Y2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4NjA2ZjhjM2NiZjRjZTZlYzhlMjhmYjAwMTRhMmMw
ODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcyZTdlOCIKIFNSQ19VUklbYmFja29uLTEuNi4wLnNo
YTI1NnN1bV0gPSAiY2ZmYjBlOTMxODc1YjY2NmZjNGZjYjIwZmVlNTJlOWJiZDFlZjgzNmZkOWU5
ZTA0ZWMyMTU1NWY5Zjg1ZjdlZiIKIFNSQ19VUklbYmFzZTY0LTAuMjIuMS5zaGEyNTZzdW1dID0g
IjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1MDhmYmVjYjlkOTFmNTc1
ZTBmYmI4YzYiCiBTUkNfVVJJW2JpdGZsYWdzLTEuMy4yLnNoYTI1NnN1bV0gPSAiYmVmMzhkNDUx
NjNjMmYxZGRlMDk0YTdkZmQzM2NjZjU5NWM5MjkwNWM4ZjhmNGZkYzE4ZDA2ZmIxMDM3NzE4YSIK
LVNSQ19VUklbYml0ZmxhZ3MtMi4xMy4xLnNoYTI1NnN1bV0gPSAiYjU4OGI3NmQwMGZkZTc5Njg3
ZDc2NDZhOWI1YmRmM2NjMGY2NTVlMGJiZDA4MDMzNWE5NWQ3ZTk2ZjM1ODdkYSIKK1NSQ19VUklb
Yml0ZmxhZ3MtMi4xMy4yLnNoYTI1NnN1bV0gPSAiM2RlZDQwNTdjMjU4YmExOTllMmQyNjM4NmQz
YWYzNzgwOTU3ZWNhZWU2YzRlZjQwNDFjNmI0YjhiOTdjMGIwNiIKIFNSQ19VUklbYmxvY2stYnVm
ZmVyLTAuMTAuNC5zaGEyNTZzdW1dID0gIjMwNzhjNzYyOWI2MmQzZjA0Mzk1MTdmYTM5NDk5NmFj
YWNjNWNiYzkxYzVhMjBkOGM2NThlNzdhYmQ1MDNhNzEiCiBTUkNfVVJJW2Jsb2NrLWJ1ZmZlci0w
LjEyLjEuc2hhMjU2c3VtXSA9ICJkMmY2YzdkYmU5NWE2ZWQ2N2FkOWYxOGU1N2RhZjkzYTJmMDM0
YzUyNGI5OWZkMmI3NmQxOGZkZmViNjY2MGFhIgogU1JDX1VSSVtib3hjYXItMC4yLjE0LnNoYTI1
NnN1bV0gPSAiMzZmNjRiZWFlNDBhODRkYTFiNGIyNmZmMjc2MWE1Yjg5NWMxMmFkYzQxZGMyNWFh
ZWUxYzRmMmJiZmU5N2E2ZSIKQEAgLTMzNywyMyArMzMwLDIxIEBAIFNSQ19VUklbYnl0ZXMtMS4x
Mi4xLnNoYTI1NnN1bV0gPSAiZmM2NTJhNDhjMzUyYWVmM2VhM2FlZDMyMDgwNTAxY2YzZWY2ZWQ1
ZGE3ODYwCiBTUkNfVVJJW2NhcC1wcmltaXRpdmVzLTQuMC4zLnNoYTI1NnN1bV0gPSAiOGI1Zjc0
NzI5ZmQyZjQ0NzAxZDFhOGViNDdlOTA2Y2RiM2NjZDllYzBmMDJiYWFkODVhNzQ0Yjc5MTk0MGIx
OCIKIFNSQ19VUklbY2FwLXN0ZC00LjAuMy5zaGEyNTZzdW1dID0gImMxZWM3OGUyNDJjZmEyY2Zl
Mjc2ODA3YWMyZWNjMDAzMTVhNmM5Nzc4Njk3NzQxNGJjZDFjMzk2M2I2YzkxYjgiCiBTUkNfVVJJ
W2NmZy1pZi0xLjAuNC5zaGEyNTZzdW1dID0gIjkzMzBmOGIyZmYxM2YzNDU0MGI0NGU5NDZlZjM1
MTExODI1NzI3YjM4ZDMzMjg2ZWY5ODYxNDI2MTUxMjE4MDEiCi1TUkNfVVJJW2NoYXJzZXQtMC4x
LjUuc2hhMjU2c3VtXSA9ICJmMWY5MjdiMDdjNzRiYTg0YzdlNWZlNGRiMmJhZWIzZTk5NmFiMjY4
ODk5MmUzOWFjNjhjZTMyMjBhNjc3YzdlIgotU1JDX1VSSVtjbGFwLTQuNi42LnNoYTI1NnN1bV0g
PSAiNDczYzdlMDdmNDA5YThkNzcyMTYxNzI0YWE4ZGI2YTc2NWEyNTMyYTcwZjk2NjdlZWI3YjQ5
ZDNkMDJmYmRjYSIKLVNSQ19VUklbY2xhcF9idWlsZGVyLTQuNi42LnNoYTI1NnN1bV0gPSAiN2I0
OGZlYTVhODhlOWFlNzI4YTJkY2JlZGJmYzBlNzMwZjdkNjBkYTQyZTFjYjA0OWE4M2M5ZmI4Yjc4
OTg4OSIKLVNSQ19VUklbY2xhcF9kZXJpdmUtNC42LjQuc2hhMjU2c3VtXSA9ICJkMDEyZDJiOWQ2
NWFjYTdmMThmNGQ5ODc4YTA0NWJjMTc4OTliYmE5NTE1NjFiYTVlYzNjMmJhMWVlZDlhMDYxIgor
U1JDX1VSSVtjbGFwLTQuNi43LnNoYTI1NnN1bV0gPSAiYWE4ODc2YjMwMGFiMzViYTkyMWFkZWEz
ZGZkNzAxNTdhNDYyNDliMzNmOTVjOTA4NGFlNTcwOTc4NTQ3ODk0NiIKK1NSQ19VUklbY2xhcF9i
dWlsZGVyLTQuNi43LnNoYTI1NnN1bV0gPSAiZWMwNzk3ZmI3YWViMTQwNmM4NGVmYWM1MjY5MDFm
N2VjM2VhZDIxMjRmOTQ2YjQ5NGU3Mjg3OWQ0YjU0NzA0ZCIKK1NSQ19VUklbY2xhcF9kZXJpdmUt
NC42Ljcuc2hhMjU2c3VtXSA9ICJmOWM3NTFiNzk0MTVkNGU1NTllM2QxZmNmMTI4ZTA5ZTcyMGVi
NjczYTA2ZDI2Y2Y2ZjM5MmQzN2Q3NWI2NmUwIgogU1JDX1VSSVtjbGFwX2xleC0xLjEuMC5zaGEy
NTZzdW1dID0gImM4ZDRhM2JiOGIxZTBjMTA1MDQ5OWQxODE1ZjVhYjE2ZDA0ZjA5NTliMjMzMDg1
ZmIzMTY1M2ZiZmM5ZDk4ZjkiCiBTUkNfVVJJW2NvbG9yY2hvaWNlLTEuMC41LnNoYTI1NnN1bV0g
PSAiMWQwNzU1MGM5MDM2YmYyYWUwYzY4NGM0Mjk3ZDUwM2Y4MzgyODdjODNjNTM2ODZkMDUzNzBk
MGUxMzlhZTU3MCIKIFNSQ19VUklbY29tcHJlc3Npb24tY29kZWNzLTAuNC40NS5zaGEyNTZzdW1d
ID0gIjk4ZmM5ODQ2MGJhMGFkNTMxNzA3NWQzNjMyYjhkZmM0NWQwYmU4YzRhNDkzNDdjMmEzODI3
MjAxOTcxNzYxNGEiCiBTUkNfVVJJW2NvbXByZXNzaW9uLWNvcmUtMC40LjMzLnNoYTI1NnN1bV0g
PSAiNmU4Y2NjNGVhOWY2YWNjMzJkMTAyYzBmNmQ0NzFkMTFkOTEzYWQxNWYyMGMwNGRlNzQzMzc0
ODYxZmExZDQxNCIKLVNSQ19VUklbY29uc29sZS0wLjE2LjQuc2hhMjU2c3VtXSA9ICI0ZmU1ZjQ2
NWE0ZjZmZWU4OGZhZDQxYjg1ZDk5MGY4NGM4MzUzMzVlODViNWQ5ZTZlNjNlMGQwNmQyOGNiYTdj
IgorU1JDX1VSSVtjb25zb2xlLTAuMTYuNi5zaGEyNTZzdW1dID0gImU5NmE0OTU2Nzc0YzEzYzEy
NmE4YjVhZjRkYWE3OTM4NGY0ZDgyNjUzNGM5NWEwMmQ3NmFmYjM5ZTJhYjY0ZTMiCiBTUkNfVVJJ
W2NwdWZlYXR1cmVzLTAuMi4xNy5zaGEyNTZzdW1dID0gIjU5ZWQ1ODM4ZWViYjI2YTJiYjJlNThm
NmQ1YjUzMTY5ODlhZTlkMDhiYWIxMGUwZTZkMTAzZTY1NmQxYjAyODAiCiBTUkNfVVJJW2NwdWZl
YXR1cmVzLTAuMy4wLnNoYTI1NnN1bV0gPSAiOGIyYTQxMzkzZjY2ZjE2YjA4MjNiYjc5MDk0ZDU0
YWM1ZmJkMzRhYjI5MmRkYWZiOWEwNDU2YWM5Zjg3ZDIwMSIKLVNSQ19VUklbY3JjMzJmYXN0LTEu
NS4wLnNoYTI1NnN1bV0gPSAiOTQ4MWMxYzkwY2JmMmFjOTUzZjA3YzhkNGE1OGFhMzk0NWM0MjVi
NzE4NWM5MTU0ZDY3YTY1ZTQyMzBkYTUxMSIKK1NSQ19VUklbY3JjMzJmYXN0LTEuNS4yLnNoYTI1
NnN1bV0gPSAiMDFhNzc5OWZkNmI4NTJkYjBlNjE3MjhkZGU5YTIwNGM0MjNiNDRkNjg5ZGJkNDMy
NTIyNTQzNjE0YjQ5MGU3OCIKIFNSQ19VUklbY3J5cHRvLWNvbW1vbi0wLjEuNy5zaGEyNTZzdW1d
ID0gIjc4YzgyOTIwNTVkMWMxZGYwY2NlNWQxODAzOTNkYzhjY2UwYWJlYzBhNzEwMmFkYjZjN2Ix
ZWVmNjAxNmQ2MGEiCiBTUkNfVVJJW2NyeXB0by1jb21tb24tMC4yLjIuc2hhMjU2c3VtXSA9ICJj
ZTZlNGM5NjFkNmNkNmM5YTg2ZGI0MTgzODc0MjVlOGJkZWFmMDViM2M4YmMxNDExZTZkY2E0YzI1
MmYxNDUzIgogU1JDX1VSSVtjc3YtMS40LjAuc2hhMjU2c3VtXSA9ICI1MmNkOWQ2OGNmN2VmYzZk
ZGZhYWVlNDJlNzI4OGQzYTk5ZDYxM2Q0YjUwZjc2Y2U5ODI3YWUwYzZlMTRmOTM4IgogU1JDX1VS
SVtjc3YtY29yZS0wLjEuMTMuc2hhMjU2c3VtXSA9ICI3MDRhM2MyNjk5NmE4MDQ3MTE4OTI2NTgx
NGRiYzJjMjU3NTk4Yjk2YjhhN2ZlYWUyZDMxYWNlNjQ2YmI5NzgyIgotU1JDX1VSSVtkYXRhLWVu
Y29kaW5nLTIuMTEuMS5zaGEyNTZzdW1dID0gIjQ1ODNhNDU1MWRmNDZlMjc5MmY4MmNlZWFjNDVl
ODUwZDJlMmQ1ZGViYmEwYjkxZjEwMjM4NWNkYTViMTFmMDYiCiBTUkNfVVJJW2RlZm10LTEuMS4w
LnNoYTI1NnN1bV0gPSAiYTZlNTI0NTA2NDkwYTE5NTNkMjM3Y2I4N2IxY2ZjMWU0NmY4OGMxOGYx
MGEyMmRmZTBmNTA3ZGM2YmZjN2Y3ZiIKIFNSQ19VUklbZGVmbXQtbWFjcm9zLTEuMS4wLnNoYTI1
NnN1bV0gPSAiZjBhMjc3NzBlOWM4ZjcxOWE3OWQ4YjYzODI4MWY0ZDgyOGY3N2Q4ZmQ2MWUwYmQ5
NDQ1MWI5Yjg1ZTU3NmEwYiIKIFNSQ19VUklbZGVmbXQtcGFyc2VyLTEuMC4wLnNoYTI1NnN1bV0g
PSAiMTBkNjAzMzRiM2IyZTdjOWQ5MWVmODE1MGFiZmI2ZmE0YzFjMzllYmJjZjRhODFjMmUzNDZh
YWQ5MzlmZWUzZSIKQEAgLTM2OSw3ICszNjAsNiBAQCBTUkNfVVJJW2VuY29kaW5nX3JzX2lvLTAu
MS44LnNoYTI1NnN1bV0gPSAiZmJhM2ZlODQ3MDQ1ZWNmZjc5NGI5YzEzODI5M2E4MGRiOTE0Ngog
U1JDX1VSSVtlbnVtZmxhZ3MyLTAuNy4xMi5zaGEyNTZzdW1dID0gIjEwMjdmNzY4MGM4NTNlMDU2
ZWJjZWM2ODM2MTVmYjZmYmJjMDdkYmFhMTNiNGQ1ZDk0NDJiMTQ2ZGVkNGVjZWYiCiBTUkNfVVJJ
W2VudW1mbGFnczJfZGVyaXZlLTAuNy4xMi5zaGEyNTZzdW1dID0gIjY3Yzc4YTRkOGZkZjk5NTNh
NWM5ZDQ1OGY5ZWZlOTQwZmQ5N2EwY2FiMDk0MWMwNzVhODEzYWM1OTQ3MzM4MjciCiBTUkNfVVJJ
W2VxdWl2YWxlbnQtMS4wLjIuc2hhMjU2c3VtXSA9ICI4NzdhNGFjZTg3MTNiMGJjZjJhNGU3ZWVj
ODI1MjljMDI5ZjFkMDYxOTg4NmQxODE0NWZlYTk2YzNmZmU1YzBmIgotU1JDX1VSSVtlcmFzZWQt
c2VyZGUtMC40LjEwLnNoYTI1NnN1bV0gPSAiZDJhZGQ4YTA3ZGQ2YThkOTNmZjYyNzAyOWM1MWRl
MTQ1ZTEyNjg2ZmJjMzZlY2IyOThhYzIyZTc0Y2YwMmRlYyIKIFNSQ19VUklbZXJybm8tMC4zLjE0
LnNoYTI1NnN1bV0gPSAiMzljYWI3MTYxN2FlMGQ2M2Y1MWEzNmQ2OWY4NjYzOTE3MzViNTE2OTFk
YmRhNjNjZjZmOTZkMDQyYjYzZWZlYiIKIFNSQ19VUklbZmFzdHJhbmQtMi41LjAuc2hhMjU2c3Vt
XSA9ICJkYTdjNjJjZWFlMjA3ZGQzN2VhNWI4NDVkYTZhMDY5NmM3OTlmODVlOTdkYTFhYjViNzkx
MGJlM2MxYzgwMjIzIgogU1JDX1VSSVtmaXhlZGJpdHNldC0wLjUuNy5zaGEyNTZzdW1dID0gIjFk
Njc0ZTgxMzkxZDFlMWFiNjgxYTI4ZDk5ZGYwNzkyN2M2ZDRhYTViMDI3ZDdkYTE2YmEzMmQxZDIx
ZWNkOTkiCkBAIC00MDYsNyArMzk2LDcgQEAgU1JDX1VSSVtpY3VfcHJvcGVydGllc19kYXRhLTIu
MS4yLnNoYTI1NnN1bV0gPSAiNjE2YzI5NGNmOGQ3MjVjNmFmY2Q4ZjU1YWJjMTdjNTYKIFNSQ19V
UklbaWN1X3Byb3ZpZGVyLTIuMS4xLnNoYTI1NnN1bV0gPSAiODU5NjJjZjBjZTAyZTFlMGE2Mjlj
YzM0ZTdjYTNlMzczY2UyMGRkYTRjNGQ3Mjk0YmJkMGJmMWZkYjU5ZTYxNCIKIFNSQ19VUklbaWRu
YS0xLjEuMC5zaGEyNTZzdW1dID0gIjNiMDg3NWYyM2NhYTAzODk4OTk0ZjZkZGM1MDE4ODZhNDVj
N2QzZDYyZDA0ZDJkOTA3ODhkNDdiZTFiMWU0ZGUiCiBTUkNfVVJJW2lkbmFfYWRhcHRlci0xLjIu
MS5zaGEyNTZzdW1dID0gIjNhY2FlOTYwOTU0MGFhMzE4ZDFiYzU4ODQ1NTIyNWZiMjA4NWI5ZWQw
YzRmNmJkMGQ5ZDViY2Q4NmYxYTAzNDQiCi1TUkNfVVJJW2luZGV4bWFwLTIuMTQuMS5zaGEyNTZz
dW1dID0gIjA3YWEyMDQ4MTQyMjQyOTE1YTMxZDM1ODQ0ZmIzMTFlMGU1M2ZjY2E1OTBjM2EwYTQw
ZGNmMWI4NDFmYTA5ZWIiCitTUkNfVVJJW2luZGV4bWFwLTIuMTQuMi5zaGEyNTZzdW1dID0gImNj
NGUxOTBmNWQyNmNhNzA1MTY0MjYyOWRhMmM1MmZjMDNiZGU4NWEwMzE5N2M5OTQwOGRjZDI5MTcz
NGM4NTUiCiBTUkNfVVJJW2luZG9jLTIuMC43LnNoYTI1NnN1bV0gPSAiNzljZjVjOTNmOTMyMjhj
ZjhlZmIzYmEzNjI1MzVmYjExMTk5YWM1NDhhMDljZTExN2M5YjFhZGMzMDMwZDcwNiIKIFNSQ19V
UklbaW5zdGEtMS40OC4wLnNoYTI1NnN1bV0gPSAiODZmMGY4ZmVlOGM5MjY0MTVjNThkNmFlNDNh
MDg1MjNhMjZmYWNjYjIzMjNmNWU2YjY0NGZlN2RkNGVmNmI4MiIKIFNSQ19VUklbaW8tZXh0cmFz
LTAuMTkuMC5zaGEyNTZzdW1dID0gIjIwZmQ2ZGU0Y2NmY2MxODdlMzhiYzIxY2ZhNTQzY2I1YTMw
MmNiODZhOGIxMTRlYjdmMGJmMGRjOWY4YWMwMGYiCkBAIC00MTYsMTEgKzQwNiw5IEBAIFNSQ19V
UklbaXBuZXQtMi4xMi4wLnNoYTI1NnN1bV0gPSAiZDk4ZjZmZWQxZmRlM2Y4YzIxYmM0MGExYWJi
ODhkZDc1ZTY3OTI0ZjljZmZjCiBTUkNfVVJJW2lzX3Rlcm1pbmFsX3BvbHlmaWxsLTEuNzAuMi5z
aGEyNTZzdW1dID0gImE2Y2IxMzhiYjc5YTE0NmMxYmQ0NjAwMDU2MjNlMTQyZWYwMTgxZTNkMDIx
OWNiNDkzZTAyZjdkMDhhMzU2OTUiCiBTUkNfVVJJW2l0ZXJ0b29scy0wLjE0LjAuc2hhMjU2c3Vt
XSA9ICIyYjE5MmM3ODIwMzdmYWRkOWNmYTc1NTQ4MzEwNDg4YWFiZGJmM2QyZGE3Mzg4NWIzMWJk
MGFiZDAzMzUxMjg1IgogU1JDX1VSSVtpdG9hLTEuMC4xNy5zaGEyNTZzdW1dID0gIjkyZWNjNjYx
ODE4MWRlZjA0NTczOTJjY2QwZWU1MTE5OGUwNjVlMDE2ZDFkNTI3YTdhYzFiNmRjN2MxZjA5ZDIi
Ci1TUkNfVVJJW2ppZmYtMC4yLjM1LnNoYTI1NnN1bV0gPSAiNjY4YjcxODNiZDA3YWY5YTQ4ODVm
NWMzNWIwY2M1YzgzYzQ2MDdhOTEzYzE2YjdlMTcyOTE4MzI5MTBkMmRjYyIKK1NSQ19VUklbamlm
Zi0wLjIuMzcuc2hhMjU2c3VtXSA9ICIwYWIxYmFmNzJmMDg3OTZkZTAyNjA2MDk1MTUxMzA2OTli
ODkwYWMyNWYzMGU2MTBhZDg5NGJjNTg1NmNhZmRiIgogU1JDX1VSSVtqaWZmLWNvcmUtMC4xLjAu
c2hhMjU2c3VtXSA9ICI3ZmVjYTg4NDM5ZWZlNTNkYTM3NTQ1MDBjMTg1MWRlZGYzY2IzNmM1MjRk
ZDVjZjgyMjVjYzA3OTRkZTk1ZDA5IgotU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMzUuc2hhMjU2
c3VtXSA9ICIzYTY5ZGNiM2EyMWNmYjMyY2UxY2QwNTYxNjkzMzdjYTI4NGFmMDc2NmRkNzY2ZTc4
Nzg4MTliMjUxYTQ5MjA0IgotU1JDX1VSSVtqaWZmLXR6ZGItMC4xLjguc2hhMjU2c3VtXSA9ICIx
NDJiZDM5OTMyYWQyMzFmMTA1MTNkZjlhYjYyNjYxZmVhZDg3MTk4NzIxNTBiN2FkMDJhMmRmNzlm
NGUxNDFlIgotU1JDX1VSSVtqaWZmLXR6ZGItcGxhdGZvcm0tMC4xLjMuc2hhMjU2c3VtXSA9ICI4
NzVhNWE2OWFjMmJhYjFhODkxNzExY2Y1ZWNjYmVjMWNlMDM0MWVhODA1NTYwZGNkOTBiN2EyZTky
NTEzMmU4IgorU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMzcuc2hhMjU2c3VtXSA9ICIzNzgyNjhh
MTExNmFkNjdhZTYyMjg3MDExMThhYzlmNDkxZDc4ZmRhMzhhNDBhMWYxYTllMTM0OGRlNmY3MjEy
IgogU1JDX1VSSVtqcy1zeXMtMC4zLjkxLnNoYTI1NnN1bV0gPSAiYjQ5NzE1YjcwNzNmMzg1YmE0
YmM1MjhlNTc0N2QwMmU2NmNiMzljNjE0NmVmYjY2Yjc4MWYxMzFmMGZiMzk5YyIKIFNSQ19VUklb
anVuY3Rpb24tMi4wLjAuc2hhMjU2c3VtXSA9ICIxNjBmMmVhZGUwOTdmMzAyNjNiNTQ4YWFlNWRl
YjEyYWQzNDljOTA5YmFhNzEwZmEyNGI5MmM5MDkwYjJlMDA2IgogU1JDX1VSSVtsYXp5X3N0YXRp
Yy0xLjUuMC5zaGEyNTZzdW1dID0gImJiZDJiY2I0Yzk2M2YyZGRhZTA2YTJlZmM3ZTlmMzU5MTMx
MjQ3M2M1MGM2Njg1ZTFmMjk4MDY4MzE2ZTY2ZmUiCkBAIC00MjksNyArNDE3LDYgQEAgU1JDX1VS
SVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZzdW1dID0gIjMyYTY2OTQ5ZTAzMGRhMDBlOGM3
ZDQ0MzRiMjUxNjcwYTkxNTUKIFNSQ19VUklbbGl0ZW1hcC0wLjguMS5zaGEyNTZzdW1dID0gIjYz
NzM2MDdhNTlmMGJlNzNhMzliNmZlNDU2YjgxOTJmY2MzNTg1ZjYwMmFmMjA3NTE2MDBlOTc0ZGQ0
NTVlNzciCiBTUkNfVVJJW2xvY2tfYXBpLTAuNC4xNC5zaGEyNTZzdW1dID0gIjIyNDM5OWU3NGI4
N2I1ZjM1NTc1MTFkOThkZmY4YjE0MDg5YjNkYWRhZmNhYjZiYjkzZWFiNjdkM2FhY2U5NjUiCiBT
UkNfVVJJW2xvZy0wLjQuMjkuc2hhMjU2c3VtXSA9ICI1ZTUwMzJlMjQwMTkwNDVjNzYyZDNjMGYy
OGY1YjZiOGJiZjM4NTYzYTY1OTA4Mzg5YmY3OTc4NzU4OTIwODk3IgotU1JDX1VSSVttYWlscGFy
c2UtMC4xNi4xLnNoYTI1NnN1bV0gPSAiNjA4MTlhOTdkZGNiODMxYTU2MTRlYjNiMDE3NGYzNjIw
ZTc5M2U5N2UwOTE5NWEzOTViZmE5NDhmZDY4ZWQyZiIKIFNSQ19VUklbbWF0Y2hlcnMtMC4yLjAu
c2hhMjU2c3VtXSA9ICJkMTUyNWEyYTI4YzdmNGZhMGZjOThiYjkxYWU3NTVkMWUyZDE1MDUwNzll
MDU1MzllMzViYzg3NmI1ZDY1YWU5IgogU1JDX1VSSVttYXliZS1vd25lZC0wLjMuNC5zaGEyNTZz
dW1dID0gIjRmYWNjNzUzYWU0OTRhZWI2ZTNjMjJmODM5YjE1OGFlYmQ0ZjkyNzBmNTVjZDNjNzk5
MDZjNDU0NzZjNDdhYjQiCiBTUkNfVVJJW21lbWNoci0yLjguMy5zaGEyNTZzdW1dID0gImNmOGJh
ZjFjNTVlNjJmZmNhY2U3YTlmMDZmNGJkOWNkM2YwYzRiZWIwMjJkM2IzNjcyNTZiOTFiODc1MTNk
OTgiCkBAIC00NjMsNyArNDUwLDYgQEAgU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuMTA3LnNoYTI1
NnN1bV0gPSAiOTg1ZTdlYzliYjc0NWU2Y2U2NTM1YjU0NGQ4NGQ2Y2Q2ZjdhZDgKIFNSQ19VUklb
cHRyX21ldGEtMC4zLjEuc2hhMjU2c3VtXSA9ICIwYjlhMGNmOTVhMTE5NmFmNjFkNGYxY2JkYWI5
NjcxNzk1MTZkOWE0YTQzMTJhZjFmMzE5NDhmOGY2MjI0YTc5IgogU1JDX1VSSVtwdHJfbWV0YV9k
ZXJpdmUtMC4zLjEuc2hhMjU2c3VtXSA9ICI3MzQ3ODY3ZDBhN2UxMjA4ZDkzYjQ2NzY3YmU4M2Uy
YjhmOTc4YzNkYWQzNWY3NzVhYzhkODg0NzU1MWQ2ZmUxIgogU1JDX1VSSVtxdW90ZS0xLjAuNDcu
c2hhMjU2c3VtXSA9ICIxZmJmNGRiMTQyYTQ3M2E4ZDgwYzI2YmJmMTg0NTRlZDQ1OGJmOGQyNmM4
MjE5YzMzMWRhZWNmZGJkMDc5MDAxIgotU1JDX1VSSVtxdW90ZWRfcHJpbnRhYmxlLTAuNS4xLnNo
YTI1NnN1bV0gPSAiNjQwYzliZDg0OTdiMDI0NjVhZWVmNTM3NTE0NGMyNjA2MmUwZGNkNTkzOWRm
Y2JiMGY1ZGI3NmNiOGMxN2M3MyIKIFNSQ19VUklbci1lZmktNi4wLjAuc2hhMjU2c3VtXSA9ICJm
OGRjYzljN2Q1MmE4MTE2OTdkMjE1MWM3MDFlMGQwODk1NmY5MmIwZTI0MTM2Y2Y0Y2YyN2I1N2E2
YTBkOWJmIgogU1JDX1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9ICJhMDYzZWE3MjM4MTUy
N2MyYTA1NjFkYTljODAwMDBlZjgyMmJkZDdjMzI0MWIxY2MxYjEyMTAwZTNkZjA4MWVlIgogU1JD
X1VSSVtyZWRveF9zeXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjdlOGFmMGRkZTA5NDAwNjAx
MWU2YTc0MGQ0ODc5MzE5NDM5NDg5ODEzYmQwYmNkYzdkODIxYmVhZWVmZjQ4ZWMiCkBAIC00Nzcs
NyArNDYzLDcgQEAgU1JDX1VSSVtyZW5kLTAuNS4zLnNoYTI1NnN1bV0gPSAiY2FkYWRlZjMxN2My
ZjIwNzU1YTY0ZDdmZGM0OGY5ZTcxNzhlZTZiMGUxZjdmY2UKIFNSQ19VUklbcmt5di0wLjguMTgu
c2hhMjU2c3VtXSA9ICJkOTc3NjA5M2I3Y2ExNzA0NTRhYjE0MDY5NTRmN2I3ZDk3YTU3YzUxZGM2
YzA2NDI5NTdmYjJlZjI1YzJkMzk5IgogU1JDX1VSSVtya3l2X2Rlcml2ZS0wLjguMTguc2hhMjU2
c3VtXSA9ICIxYzI1ZWY2MDRhYzdkZDgzOWQ0NGQ2NDY0ODk1MmVhMjNjOTc4NjZmMTI0ZmY2NzFi
MGVkMmNmM2FkOWJiMDZlIgogU1JDX1VSSVtydXN0Yy1oYXNoLTIuMS4zLnNoYTI1NnN1bV0gPSAi
NmIxZTdmOWE0Mjg1NzFiZTJkYzViYzA1MDVjMTNmYjZiZjkzNjgyMmI4OTRlYzg3YWJmOGEwOGE0
ZTUxNzQyZCIKLVNSQ19VUklbcnVzdGl4LTEuMS40LnNoYTI1NnN1bV0gPSAiYjZmZTQ1NjViOTUx
OGI4M2VmNGY5MWJiNDdjZTI5NjIwY2E4MjhiZDMyY2I3ZTQwOGYwMDYyZTk5MzBiYTE5MCIKK1NS
Q19VUklbcnVzdGl4LTEuMS41LnNoYTI1NnN1bV0gPSAiODkxZWZhYmFiZTQxODY3MDc3NWYxOTlm
MGQyMzNkODQ4NDNjMjI3YTA5NDlhODgzY2UxNWIzN2M3OGQ2NjI5ZCIKIFNSQ19VUklbcnVzdGl4
LWxpbnV4LXByb2Nmcy0wLjEuMS5zaGEyNTZzdW1dID0gIjJmYzg0YmY3ZTlhYTE2YzRmMmM3NThm
Mjc0MTJkYzk4NDEzNDFlMTZhYTY4MmQ5YzdhYzMwOGZlM2VlMTIwNTYiCiBTUkNfVVJJW3J1c3R2
ZXJzaW9uLTEuMC4yMi5zaGEyNTZzdW1dID0gImIzOWNkZWYwZmE4MDBmYzQ0NTI1Yzg0Y2NiNTRh
MDI5OTYxYTgyMTVmOTYxOTc1MzYzNWE5YzBkMjUzOGQ0NmQiCiBTUkNfVVJJW3J5dS0xLjAuMjMu
c2hhMjU2c3VtXSA9ICI5Nzc0YmE0YTc0ZGU1ZjdiMWMxNDUxZWQ2Y2Q1Mjg1YTMyZWRkYjVjY2Ni
OGNjNjU1YTRlNTAwMDllMDY0NzdmIgpAQCAtNDg4LDcgKzQ3NCw2IEBAIFNSQ19VUklbc2NvcGVn
dWFyZC0xLjIuMC5zaGEyNTZzdW1dID0gIjk0MTQzZjM3NzI1MTA5ZjkyYzI2MmVkMmNmNWU1OWJj
ZTc0OThjMDFiCiBTUkNfVVJJW3NlYWhhc2gtNC4xLjAuc2hhMjU2c3VtXSA9ICIxYzEwN2I2ZjQ3
ODA4NTRjOGIxMjZlMjI4ZWE4ODY5ZjRkN2I3MTI2MGY5NjJmZWZiNTdiOTk2Yjg5NTliYTZiIgog
U1JDX1VSSVtzZWxmLXJlcGxhY2UtMS41LjAuc2hhMjU2c3VtXSA9ICIwM2VjODE1YjVlYWI0MjBh
Yjg5M2Y2MzM5Mzg3OGQ4OWM5MGZkZDk0YzBiY2M0NGMwN2FiYjhhZDk1NTUyZmI3IgogU1JDX1VS
SVtzZXJkZS0xLjAuMjI5LnNoYTI1NnN1bV0gPSAiNDE0ODU5MGFmZWJhZGEzODY2ODhmMTg3NzNk
YTYxNzc5MmJmMmVmMDNmZmMxZTRjYmQyYjFkNDViMDIzZTBiYSIKLVNSQ19VUklbc2VyZGUtdW50
YWdnZWQtMC4xLjkuc2hhMjU2c3VtXSA9ICJmOWZhZjQ4YTRhMmQyNjkzYmUyNGM2Mjg5ZGJlMjY1
NTI3NzZlYjc3MzcwNzRlNjcyMjg5MWZhZGJlNmM1MDU4IgogU1JDX1VSSVtzZXJkZV9jb3JlLTEu
MC4yMjkuc2hhMjU2c3VtXSA9ICI2N2RjYTJjOWM1MWU1OGE0NzkxYTRiMWVkNTgzMDhiMzljNjQy
MjRkMzQ5YTkzNWFiNTAzOWFhMzYwOTQyYTQ4IgogU1JDX1VSSVtzZXJkZV9kZXJpdmUtMS4wLjIy
OS5zaGEyNTZzdW1dID0gImU3YTVkNzEyNjNhNWE3ZDQ3YjQxZjZiM2YwNmJhMjc2ZjEwY2MxOGIw
OTMxZjE3OTlmNzEwNTc4ZTIzMDkzNDgiCiBTUkNfVVJJW3NlcmRlX2Rlcml2ZV9pbnRlcm5hbHMt
MC4zMC4wLnNoYTI1NnN1bV0gPSAiZjg1MjEzN2NjZTAzNWQ2YTRkZjY3Y2NjZTUwNWZmNmIzZTlm
ZDNhMTBlM2U1MmIyNGRjNzFlNjUwYmIxYTliZCIKQEAgLTUwMiw3ICs0ODcsNyBAQCBTUkNfVVJJ
W3NpbWQtYWRsZXIzMi0wLjMuOC5zaGEyNTZzdW1dID0gImUzMjBhNmM1YWQzMWQyNzFhZDUyM2Rj
ZjNhZDEzZTI3NjdhZDhiMQogU1JDX1VSSVtzaW1kdXRmOC0wLjEuNS5zaGEyNTZzdW1dID0gImUz
YTlmZTM0ZTNlN2E1MDMxNjA2MDM1MWYzNzE4N2EzZjU0NmJjZTk1NDk2MTU2NzU0YjYwMWE1ZmE3
MWI3NmUiCiBTUkNfVVJJW3NpbWlsYXItMi43LjAuc2hhMjU2c3VtXSA9ICJiYmJiNWQ5NjU5MTQx
NjQ2YWU2NDdiNDJmZTA5NGRhZjZjNjE5MmQxNjIwODcwYjQ0OWQ5NTU3Zjc0OGIyZGFhIgogU1JD
X1VSSVtzbGFiLTAuNC4xMi5zaGEyNTZzdW1dID0gIjBjNzkwZGUyMzEyNGY5YWI0NDU0NGQ3YWMw
NWQ2MDQ0MGFkYzU4NjQ3OWNlNTAxYzFkNmQ3ZGEzY2Q4YzljZjUiCi1TUkNfVVJJW3NtYWxsdmVj
LTEuMTYuMC5zaGEyNTZzdW1dID0gImI5YmU0MmY1MGFhODYxYzU1NTY1NGFhM2EzN2Y1MmY0YjEw
NzRiYWNmNGU0OGZlMGVmN2ZhNTg0ZTgwZjFmMGYiCitTUkNfVVJJW3NtYWxsdmVjLTEuMTYuMS5z
aGEyNTZzdW1dID0gImJhNDY3MDU2ZjFiNTQ3ZWQ1MjA3NzkxMTE2MWZjODY5ODViZWNiYzYwZThl
MTg1N2M4YTE0NGRhYjBkZWY4OTEiCiBTUkNfVVJJW3NtYXdrLTAuMy4yLnNoYTI1NnN1bV0gPSAi
YjdjMzg4YzFiNWU5Mzc1NmQwYzc0MDk2NWM0MWU4ODIyZjg2NjYyMWQ0MWFjYmRmNjMzNmE2YTE2
OGY4ODQwYyIKIFNSQ19VUklbc29ja2V0Mi0wLjYuMy5zaGEyNTZzdW1dID0gIjNhNzY2ZTExMTA3
ODhjMzZmNGZhMWMyYjcxYjM4N2E3ODE1YWE2NWY4OGNlMDIyOTg0MTgyNjYzM2Q5MzcyM2UiCiBT
UkNfVVJJW3NwZHgtMC4xMy41LnNoYTI1NnN1bV0gPSAiMDgxNjcwYzIzM2RmYmVkNTU2OTBjYzBj
ZDM4NDI0ZTBlMjRhYzFiMjY3M2QwYjQwOGIzZjdiNjg0NzM4ZGZhOSIKQEAgLTUxMCwxNCArNDk1
LDE0IEBAIFNSQ19VUklbc3RhYmxlX2RlcmVmX3RyYWl0LTEuMi4xLnNoYTI1NnN1bV0gPSAiNmNl
MmJlOGRjMjU0NTVlMWY5MWRmNzFiZmExMmFkMzdkCiBTUkNfVVJJW3N0cmlwLWFuc2ktZXNjYXBl
cy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNmMWI3YzJhODExMjI1ZTky
OTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCiBTUkNfVVJJW3N0cnNpbS0wLjExLjEuc2hh
MjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYyODU2NGIzYjA0M2E3MDk0
OGEzZjBiNzc4ODM4YzVmYjRmIgogU1JDX1VSSVtzeW4tMi4wLjExOC5zaGEyNTZzdW1dID0gIjFi
OWFlNTdmOTA0MjEzZWJiNjQ5Y2U2ODk1YjhhNjZjNjZmMDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1
YjE0MjIiCi1TUkNfVVJJW3N5bi0zLjAuNS5zaGEyNTZzdW1dID0gIjEyZGYyZTAxMTBmNjViNzc1
Zjc2OWJiMTdlZjk4OTA2N2ExZDkzMWIyZWI4MjJiZDQzNDY2MzFlZWFkYTg5ZjkiCitTUkNfVVJJ
W3N5bi0zLjAuNi5zaGEyNTZzdW1dID0gIjg1OTNlOGU3MjE1OWVkMjI1N2QwODNjN2E0NTRhODVj
YmY4NTRmMzdhMDk2NmQ4ZDQ4M2FmZjhjOGEzZWJjZWUiCiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0w
LjEzLjIuc2hhMjU2c3VtXSA9ICI3MjhhNzBmM2RiYWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0
YjU1NDljOGE1OTE0MzYxYzk5MTQ3YTcwOWQyIgotU1JDX1VSSVt0YXItY29kZWMtMC4wLjE0LnNo
YTI1NnN1bV0gPSAiN2VhNDJlYjE0NGQzMGZjYmYzMmMyNmRmZWE4OTU5MTc1YmI4MzM1YmZiN2Ix
OGQyMGM2ZWQzMmVkZWNmMDU1MSIKLVNSQ19VUklbdGFyLWZyYW1pbmctMC4wLjE0LnNoYTI1NnN1
bV0gPSAiNzgzMjIzYTdhNjU5MGJlNDIyN2NiODIxZTdjZTgwMzcyNTc1NTExZjY3YzgyNDkyMWFi
YTA3NTJkOGFkNTU3MyIKK1NSQ19VUklbdGFyLWNvZGVjLTAuMC4xNS5zaGEyNTZzdW1dID0gImI5
ZGFkNjE1ZTUwZDE4MWFmZWE0YmFmZWEyM2RhY2I4ZTMzZWQ1MmRkZTA2NTAzODEzNTcwNjM0Yjkz
MmQ0NjciCitTUkNfVVJJW3Rhci1mcmFtaW5nLTAuMC4xNS5zaGEyNTZzdW1dID0gIjU2M2U4MTgx
YjQ3YzljZGNjZTU2OWVhZTNhZDQzMWVlYzcxNTQzZDYyNjlkZDYwYzdiZDIzNTBmNzBiY2QyMzMi
CiBTUkNfVVJJW3RlbXAtZW52LTAuMy42LnNoYTI1NnN1bV0gPSAiOTYzNzQ4NTUwNjhmNDc0MDJj
MzEyMWM2ZWVkODhkMjljYjFkZThmM2FiMjcwOTBlMjczZTQyMGJkYWJjZjA1MCIKIFNSQ19VUklb
dGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4
Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklbdGVybWluYWxf
c2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3YjE0
ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCi1TUkNfVVJJW3RleHR3cmFwLTAuMTYu
Mi5zaGEyNTZzdW1dID0gImMxMzU0NzYxNWE0NGRjOWM0NTJhOGE1MzQ2MzhhY2RmMDcxMjBkNGI2
ODQ3YzgxNzg3MDVkYTA2MzA2YTMwNTciCitTUkNfVVJJW3RleHR3cmFwLTAuMTYuNC5zaGEyNTZz
dW1dID0gIjZlY2ZhZDZjM2FiYzgwYTU3N2YyYjkxYzFlNDEyZWU1N2U3YTA2MGQ0MzBiNTUzYzFi
MGM5NDA5NzRlYmNkNDkiCiBTUkNfVVJJW3RoaXNlcnJvci0yLjAuMjAuc2hhMjU2c3VtXSA9ICJl
Yzg2MjM1ZjVmY2MyYTczNjUwMzEwNzU2ZDJhYzViMTM4YTU3ODBiYmJkZmFlM2VlY2NlYzk5MmM0
MzViYTRmIgogU1JDX1VSSVt0aGlzZXJyb3ItaW1wbC0yLjAuMjAuc2hhMjU2c3VtXSA9ICJiYzA0
Y2QzZTEyMzZkZDRhOThhZmNhNDU2OWYyZGViM2YxMjBlNTQyMmE0MDIzYmUyY2I2ODNmODQ4NjI5
MmFmIgogU1JDX1VSSVt0aHJlYWRfbG9jYWwtMS4xLjkuc2hhMjU2c3VtXSA9ICJmNjAyNDZhNDk0
NGYyNGY2ZTAxOGFhMTdjZGVmZmI3ODE4Yjc2MzU2OTY1ZDAzYjA3ZDZhOTg4NmU4OTYyMTg1IgpA
QCAtNTI3LDEwICs1MTIsMTAgQEAgU1JDX1VSSVt0aW55dmVjX21hY3Jvcy0wLjEuMS5zaGEyNTZz
dW1dID0gIjFmM2NjYmFjMzExZmVhMDVmODZmNjE5MDRiNDYyYjU1ZmIzZGYKIFNSQ19VUklbdG9r
aW8tMS41My4xLnNoYTI1NnN1bV0gPSAiMjAyY2FlYTg3MWI2OTY2ODI1MGQyNDIwNzA4NDllYjQ5
NWJlMTc4ZWQ2OTdhM2U5OGFlYmNlNWJjODFhMGJlZCIKIFNSQ19VUklbdG9raW8tbWFjcm9zLTIu
Ny4wLnNoYTI1NnN1bV0gPSAiMzg1YTZjYjcxYWI5YWI3OTBjNWZlOGQ2N2YxNjQ1ZTZjNDUwYTdj
ZTAwNmEzM2RlMDNkYWE5NTZjZjcwYTQ5NiIKIFNSQ19VUklbdG9raW8tc3RyZWFtLTAuMS4xOS5z
aGEyNTZzdW1dID0gImEzZDA2ZjBiMDgyYmE1N2MyNmI3OTQwNzM3MmU1N2NmMmExZTI4MTI0Zjc4
ZTk0NzlmZTgwMzIyY2Y1MzQyMGIiCi1TUkNfVVJJW3RvbWwtMS4xLjMrc3BlYy0xLjEuMC5zaGEy
NTZzdW1dID0gIjUzYzk2ZWNkZmE5NDFjOGZjNGZjYWVkMTRmOTlhZGE4ZWJlZDUwMmVlZjUzMzAx
NTA5NWEwN2UzMzAxZDRjM2MiCitTUkNfVVJJW3RvbWwtMS4xLjYrc3BlYy0xLjEuMC5zaGEyNTZz
dW1dID0gIjkyMDYwMjU0M2YwOTExYWI3MWRhMTJjNTBkNTk3MDFkYTU0YzE5NmQxYTJiZjVjYjRi
NzU2NjdmMTM3YTQwNmEiCiBTUkNfVVJJW3RvbWxfZGF0ZXRpbWUtMS4xLjErc3BlYy0xLjEuMC5z
aGEyNTZzdW1dID0gIjMxNjVmNjVmNjJlMjhlMDExNWEwMGIyZWJkZDM3ZWI2ZjNiNjQxODU1Zjlk
NjM2ZDNjZDQxMDM3NjcxNTlhZDciCi1TUkNfVVJJW3RvbWxfZWRpdC0wLjI1LjEzK3NwZWMtMS4x
LjAuc2hhMjU2c3VtXSA9ICI2OTc1MzY3ZTRkMmVmNzY2ZDg2YWYwMWZmYWQxNGI2MjJmZWNjOGQ0
MzU3YTk5OGZiYzRkZWI2ZTliYWNhZjliIgotU1JDX1VSSVt0b21sX3BhcnNlci0xLjEuMitzcGVj
LTEuMS4wLnNoYTI1NnN1bV0gPSAiYTJhYmU5Yjg2MTkzNjU2NjM1ZDI0MTFkYzQzMDUwMjgyY2E0
OGFhMzFjMjQ1MTIxMGY0MjAyNTUwYWZiNzUyNiIKK1NSQ19VUklbdG9tbF9lZGl0LTAuMjUuMTUr
c3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjEzNDBlYTk0YTU4NTYzMzM0OTJjOTA2NGIwMmM3Nzhi
MTkxZGQyYzg1Mzc3OGQ5NjA5ZGViZGNkZmVhM2E2MTQiCitTUkNfVVJJW3RvbWxfcGFyc2VyLTEu
MS41K3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICJiYWE2OTNhODAzMmQ3ZTFjYWRhN2QwMDQxZTk2
MTI2ZGYyNDMxNzlmZjA2MTQ1Njc4M2FjN2YxMmJkYTQ3NDRjIgogU1JDX1VSSVt0b21sX3dyaXRl
ci0xLjEuMitzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiN2Q1NjM1M2EyYTY2NWFkMGY0MWE0MjEx
ODcxODBhYWI3NDZjOGMzMjU2MjA2MTdhZDg4M2E5OWExY2JlNjZkMiIKIFNSQ19VUklbdHJhY2lu
Zy0wLjEuNDQuc2hhMjU2c3VtXSA9ICI2M2U3MTY2MmZhNGIyYTJjM2EyNmY1NzBmMDM3ZWI5NWJi
MWY4NTM5N2YzY2Q4MDc2Y2FlZDJmMDI2YTZkMTAwIgogU1JDX1VSSVt0cmFjaW5nLWF0dHJpYnV0
ZXMtMC4xLjMxLnNoYTI1NnN1bV0gPSAiNzQ5MGNmYTVlYzk2Mzc0NjU2ODc0MDY1MWFjNjc4MWY3
MDFjOWM1ZWEyNTdjNThlMDU3ZjNiYThjZjY5ZThkYSIKQEAgLTUzOSw3ICs1MjQsNiBAQCBTUkNf
VVJJW3RyYWNpbmctbG9nLTAuMi4wLnNoYTI1NnN1bV0gPSAiZWU4NTVmMWY0MDBiZDBlNWMwMmQx
NTBhZTVkZTM4NDAwMzlhM2Y1NAogU1JDX1VSSVt0cmFjaW5nLXN1YnNjcmliZXItMC4zLjIzLnNo
YTI1NnN1bV0gPSAiY2I3ZjU3OGU1OTQ1ZmIyNDI1Mzg5NjVjMmQwYjA0NDE4ZDM4ZWMyNWM3OWQx
NjBjZDI3OWJmMDczMWM4ZDMxOSIKIFNSQ19VUklbdHJhY2luZy10ZXN0LTAuMi42LnNoYTI1NnN1
bV0gPSAiMTlhNGM0NDhkYjUxNGQ0ZjI0YzVkZGI5ZjczZjJlZTcxYmZiMjRjNTI2Y2YwYzU3MGJh
MTQyZDExMTllMDA1MSIKIFNSQ19VUklbdHJhY2luZy10ZXN0LW1hY3JvLTAuMi42LnNoYTI1NnN1
bV0gPSAiYWQwNjg0N2I3YWZiNjVjNzg2NmEzNjY2NGI3NWM0MGI4OTVlMzE4Y2VhNGY3MTI5OWYw
MTNmYjIyOTY1MzI5ZCIKLVNSQ19VUklbdHlwZWlkLTEuMC4zLnNoYTI1NnN1bV0gPSAiYmM3ZDYy
MzI1ODYwMjMyMGQ1YzU1ZDFiYzIyNzkzYjU3ZGFmZjBlYzdlZmMyNzBlYTdkNTVjZTFkNWY1NDcx
YyIKIFNSQ19VUklbdHlwZW51bS0xLjIwLjEuc2hhMjU2c3VtXSA9ICJiNmY1ZTg3MGJlNmMzYjM3
MWI3N2ZlMGVlMGJhZmI4NTlmYTQ5NjRiNDQwNGMyN2RlMWQzODAwNDNjNGRkYTIwIgogU1JDX1VS
SVt1Y2QtdHJpZS0wLjEuNy5zaGEyNTZzdW1dID0gIjI4OTZkOTVjMDJhODBjNmQ2YTVkNmU5NTNk
NDc5ZjVkZGYyZGZkYjZhMjQ0NDQxMDEwZTM3M2FjMGZiODg5NzEiCiBTUkNfVVJJW3VuaWNvZGUt
aWRlbnQtMS4wLjI0LnNoYTI1NnN1bV0gPSAiZTZlNDMxM2NkNWZjZDNkYWQ1Y2FmYTE3OTcwMmUy
YjI0NGY3NjA5OTFmNDUzOTdkMTRkNGViZjM4MjQ3ZGE3NSIKQEAgLTU0OCw3ICs1MzIsNyBAQCBT
UkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUzZTljMzgz
MTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZAogU1JDX1VSSVt1cmwtMi41Ljguc2hhMjU2c3VtXSA9ICJm
ZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2FiMzI2ODIyMjAzNTAxMGFiODY4MGVjNDIxNWYzOGJh
M2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXItMS4wLjQuc2hhMjU2c3VtXSA9ICJiNmMxNDA2MjBl
N2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1ZmZjMjdhODg1OWE1ZjBkNDk0YjVkNTJiNmJlIgog
U1JDX1VSSVt1dGY4cGFyc2UtMC4yLjIuc2hhMjU2c3VtXSA9ICIwNmFiZGUzNjExNjU3YWRmNjZk
MzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1NzA3MWNjZTI1Nzg2NjBjOWYxMDEwODIxIgotU1JDX1VSSVt1
dWlkLTEuMjQuMC5zaGEyNTZzdW1dID0gImJmMzkyM2E2ZjVjNGM2MzgyZTBiNjUzYzQxMTdmNDhk
NjMxZWExN2YzOGVkODZlMmE4MjhlNmY3NDEyZjUyMzkiCitTUkNfVVJJW3V1aWQtMS4yNi4xLnNo
YTI1NnN1bV0gPSAiMmVmNmRhYzFlOTY2MDFiNGZiM2FjY2NjY2ZmMjEzOTc0MWZjYjc1N2NiOWEz
NjA4OWJmNWJlOTFjZmIyODVjZSIKIFNSQ19VUklbdmFsdWFibGUtMC4xLjEuc2hhMjU2c3VtXSA9
ICJiYTczZWE5Y2YxNmEyNWRmMGM4Y2FhMTZjNTFhY2I5MzdkNTcxMmE4NDI5ZGI3OGEzZWUyOWQ1
ZGNhY2QzYTY1IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5
MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5
MTA1YSIKIFNSQ19VUklbdnRlLTAuMTQuMS5zaGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgz
MzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBhOTgyZjQwNDBhYzNmOWYwYmMwNzciCkBAIC01OTcs
OCArNTgxLDggQEAgU1JDX1VSSVt3aW54LTAuMzYuNC5zaGEyNTZzdW1dID0gIjNmM2ZkMzc2Zjcx
OTU4Yjg2MmU3YWZiMjBjZmU1YTIyODMwZTE5NjM0NjJmM2EKIFNSQ19VUklbd3JpdGVhYmxlLTAu
Ni4yLnNoYTI1NnN1bV0gPSAiOWVkZGUwZGI0NzY5ZDJkYzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJl
MGVmNDk5YjAxM2Q3MzFiN2I5MjQ3ZTBiOSIKIFNSQ19VUklbeW9rZS0wLjguMS5zaGEyNTZzdW1d
ID0gIjcyZDZlNWM2YWZiODRkNzM5NDRlNWNlZGIwNTJjNDY4MGQ1NjU3MzM3MjAxNTU1ZjlmMmEx
NmI3NDA2ZDQ5NTQiCiBTUkNfVVJJW3lva2UtZGVyaXZlLTAuOC4xLnNoYTI1NnN1bV0gPSAiYjY1
OTA1Mjg3NGViNjk4ZWZlNWI5ZThjZjM4MjIwNDY3OGEwMDg2ZWJmNDY5ODJiNzlkNmNhMzE4Mjky
N2U1ZCIKLVNSQ19VUklbemVyb2NvcHktMC44LjU2LnNoYTI1NnN1bV0gPSAiNTU2NzY0ZTU4M2Fk
YjQ1YTlmOGQ0MTNjMmExNDdmYTdlOGQ4MjFlNDhlMTJiMTRmZDU2MGI2MDc5OThiNzVlYiIKLVNS
Q19VUklbemVyb2NvcHktZGVyaXZlLTAuOC41Ni5zaGEyNTZzdW1dID0gImYyYWI0MmZjMjA1NzU3
NzliZDI0MGZhYTQ1Zjk0YTc0MjU2Zjc1NWMwZmE5ZTg5ZjBlZGUyMGQ5MWQwY2RmYzEiCitTUkNf
VVJJW3plcm9jb3B5LTAuOC41Ny5zaGEyNTZzdW1dID0gImQzNTEwMmE5ZjM2ZDA4OWNjYWU5ZTRj
NjgwMmJjMTE4YmU0NDg3YjgwYWFmZmMwYWI0ZTBjZjVjZTkyZDI4NzMiCitTUkNfVVJJW3plcm9j
b3B5LWRlcml2ZS0wLjguNTcuc2hhMjU2c3VtXSA9ICIxNDZjMDFmNWFiNDQyNThkYTQzY2YyNzZj
NzRhMjc2M2RiMmZmMzk2OWM5YzY1MmMzZjJkZTA3MDQxZDBiMmJjIgogU1JDX1VSSVt6ZXJvZnJv
bS0wLjEuNi5zaGEyNTZzdW1dID0gIjUwY2M0MmUwMzMzZTA1NjYwYzM1ODdmM2JmOWQwNDc4Njg4
ZTE1ZDg3MGZhYjMzNDY0NTFjZTdmOGM5ZmJlYTUiCiBTUkNfVVJJW3plcm9mcm9tLWRlcml2ZS0w
LjEuNi5zaGEyNTZzdW1dID0gImQ3MWU1ZDZlMDZhYjA5MGM2N2I1ZTQ0OTkzZWMxNmI3MmRjYmFh
YmM1MjZkYjg4M2EzNjAwNTc2NzhiNDg1MDIiCiBTUkNfVVJJW3plcm90cmllLTAuMi4zLnNoYTI1
NnN1bV0gPSAiMmE1OWMxN2E1NTYyZDUwN2U0YjU0OTYwZTg1NjllYmVlMzNiZWU4OTBjNzBhYTNm
ZTdiOTdlODVhOWZkNzg1MSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEz
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1i
dWlsZF8wLjEzLjMuYmIKaW5kZXggMmFkMzhiMjA1NC4uMzU2MWViZDdkOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTMuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4z
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Ut
QVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNm
YWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFk
N2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkMjYxNGYyNGE1OGRjY2Q0ODY1
ZDRmODZkZGQ5MWRkMDFmZDBlZmFiNDYzMmUwMzMxODZhODQyM2I4YTM1MTUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOGJkYzRiYTMwZGQ4ZTcyMDEyOTc2M2QzNTA0ZjUyODNjMjEzNzQzMzE1NGI5
ODI0YWE3ODA1OGVlNmY4MGY4MCIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoy
LjQ3LjEKCg==

--===============8677367641237674411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.0.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.21 crate://crates.io/async-compression/0.4.45 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://c
 rates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser
 /1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite
 /2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.1 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crate
 s.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate:/
 /crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cas
 t/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/s
 ha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.0 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.5 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate
 ://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version
 _check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windo
 ws-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io
 /zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.3.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.48 crate://crates.io/autocfg/1.5.0 crate://cra
 tes.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.
 0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crate
 s.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras
 /0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.37 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.37 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parkin
 g/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://cr
 ates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crat
 e://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.1 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.15 crate://crates.io/tar-framing/0.0.15 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1
 .19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.26.1 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 c
 rate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://cra
 tes.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.57 crate://crates.io/zerocopy-derive/0.8.57 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate:
 //crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.0" to "0.13.3"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4371808 to 3851536 (-12%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.0 [default] to 0.13.3 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info

--===============8677367641237674411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4371808 to 3851536 (-12%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.3.dist-info

--===============8677367641237674411==--
