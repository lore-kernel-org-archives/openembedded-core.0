Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16497.1792647340700774349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=h6C/xrzb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BmuCIutg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1621b9edc-7fbeed7e-600d-4cae-90f8-91cee31d583b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=murKN0wF/oNcoXDjl9PnlokSxMmTMYgWHvroAke1oYA=;
	b=h6C/xrzbwtAO7FOWumS7Z9UMr0TQl6YPy9R0FZYUuRb+HeuCnTVs/dl+jURMehFH
	unhz+Gxyg8nyvYEpdW+E99tEHPsP9Lxt6Ryo05Qb1QmJjPo7/QSIbN83buD/3I52m4t
	JSUh0ltKjeT8bl1lAbFI1L3ds1Xq6760v5XeA76Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=murKN0wF/oNcoXDjl9PnlokSxMmTMYgWHvroAke1oYA=;
	b=BmuCIutgaTnTLVvZPOMUj+S3YqrPlH+/No3L+ba0WccqR92wbSoTpny3cV0zW3FS
	41jJQFTICULKSRbD0F13yY/e2L1DDX4rbAQd7ZUoPqhIdBC61c2Y7GzwDrBWCukAc9s
	P6nv3kXgfa67lz49Vo6YXqLMq7gxlLAKEgCUTvQg=
Content-Type: multipart/mixed; boundary="===============7936438565017800565=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.5 SUCCEEDED
Message-ID: <010101a1621b9edc-7fbeed7e-600d-4cae-90f8-91cee31d583b-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248411

--===============7936438565017800565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.0-0.13.5.patch
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
From a0d0acf6e5d63cdd61d1a334e081da40fddb1fe0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:16:28 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.0 -> 0.13.5

---
 .../python/python3-uv-build-crates.inc        | 120 ++++++++----------
 ...d_0.13.0.bb => python3-uv-build_0.13.5.bb} |   2 +-
 2 files changed, 53 insertions(+), 69 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.0.bb => python3-uv-build_0.13.5.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 40087d0541..a5746f7693 100644
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
-    crate://crates.io/astral-version-ranges/0.2.2 \
-    crate://crates.io/astral_async_zip/0.0.21 \
-    crate://crates.io/async-compression/0.4.45 \
+    crate://crates.io/astral-version-ranges/0.2.3 \
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
-SRC_URI[astral-version-ranges-0.2.2.sha256sum] = "81129e143a7bcea263d5a2c50b8be47ac58365dde618bc1ac50f69f497c9cb63"
-SRC_URI[astral_async_zip-0.0.21.sha256sum] = "13f4a9bc6289d907c8e883d25026a54751d686da9926af271d0fc4cbe58a7f4d"
-SRC_URI[async-compression-0.4.45.sha256sum] = "24a8ec73eb862508b7041723c89386365894b4e7d9f6998bf1b8529e5b0ee254"
+SRC_URI[astral-version-ranges-0.2.3.sha256sum] = "b315acc4dc7f0d3ccdd557a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
index 2ad38b2054..8b05c79a25 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e033186a8423b8a3515"
+SRC_URI[sha256sum] = "c95a3d092cb8880b37f35013f9f7339f3867bc422abed36776255f34e22bc62c"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============7936438565017800565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.0" to "0.13.5"
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
 /zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.5.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.48 crate://crates.io/autocfg/1.5.0 crate://cra
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
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.0" to "0.13.5"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.0 [default] to 0.13.5 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4371808 to 3822864 (-13%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info

--===============7936438565017800565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4371808 to 3822864 (-13%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info

--===============7936438565017800565==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.0-0.13.5.patch"

RnJvbSBhMGQwYWNmNmU1ZDYzY2RkNjFkMWEzMzRlMDgxZGE0MGZkZGIxZmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MTY6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuMCAtPiAwLjEzLjUKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgMTIwICsrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEzLjAuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjUuYmJ9IHwgICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
My4wLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMy41LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5p
bmMKaW5kZXggNDAwODdkMDU0MS4uYTU3NDZmNzY5MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAgLTEx
LDE4ICsxMSwxOSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5
bGUtcXVlcnkvMS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtd2luY29uLzMu
MC4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC4xMDQgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2FyY2hpdmUtdHJhaXQvMC4wLjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9hcmNoaXZlLXRyYWl0LzAuMC4xNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJjc3RyLzEu
Mi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJheXZlYy8wLjcuOCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXN0cmFsLW1haWwtaGVhZGVycy8wLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjcuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0
cmFsLXZlcnNpb24tcmFuZ2VzLzAuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxf
YXN5bmNfemlwLzAuMC4yMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN5bmMtY29tcHJlc3Np
b24vMC40LjQ1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lvbi1yYW5nZXMv
MC4yLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4wLjIyIFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuNDggXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jh
Y2tvbi8xLjYuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjIuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMS4zLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2JpdGZsYWdzLzIuMTMuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi4xMy4y
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMC40IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9ib3hjYXIvMC4yLjE0IFwKQEAgLTM0LDIzICszNSwyMSBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NhcC1wcmltaXRpdmVzLzQuMC4zIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jYXAtc3RkLzQuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4w
LjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NoYXJzZXQvMC4xLjUgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NsYXAvNC42LjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfYnVpbGRl
ci80LjYuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJpdmUvNC42LjQgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Ns
YXBfYnVpbGRlci80LjYuNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJpdmUvNC42
LjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfbGV4LzEuMS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29t
cHJlc3Npb24tY29kZWNzLzAuNC40NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29tcHJlc3Np
b24tY29yZS8wLjQuMzMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnNvbGUvMC4xNi40IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25zb2xlLzAuMTYuNiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY3B1ZmVhdHVyZXMvMC4yLjE3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcHVmZWF0
dXJlcy8wLjMuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3JjMzJmYXN0LzEuNS4wIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jcmMzMmZhc3QvMS41LjIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NyeXB0by1jb21tb24vMC4xLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyeXB0by1j
b21tb24vMC4yLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nzdi8xLjQuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY3N2LWNvcmUvMC4xLjEzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9k
YXRhLWVuY29kaW5nLzIuMTEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGVmbXQvMS4xLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RlZm10LW1hY3Jvcy8xLjEuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZGVmbXQtcGFyc2VyLzEuMC4wIFwKQEAgLTY2LDcgKzY1LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbnVtZmxhZ3MyLzAuNy4xMiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZW51bWZsYWdzMl9kZXJpdmUvMC43LjEyIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9lcXVpdmFsZW50LzEuMC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9lcmFz
ZWQtc2VyZGUvMC40LjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lcnJuby8wLjMuMTQgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Zhc3RyYW5kLzIuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9maXhlZGJpdHNldC8wLjUuNyBcCkBAIC0xMDMsNyArMTAxLDcgQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvdmlkZXIvMi4xLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2lkbmEvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lkbmFfYWRh
cHRlci8xLjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kZXhtYXAvMi4xNC4xIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9pbmRleG1hcC8yLjE0LjIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2luZG9jLzIuMC43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ4LjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lvLWV4dHJhcy8wLjE5LjAgXApAQCAtMTEzLDExICsxMTEs
OSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3Bv
bHlmaWxsLzEuNzAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2ppZmYvMC4yLjM1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4zNyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1jb3JlLzAuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9qaWZmLXN0YXRpYy8wLjIuMzUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpk
Yi8wLjEuOCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLXBsYXRmb3JtLzAuMS4z
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMzcgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2pzLXN5cy8wLjMuOTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2p1bmN0
aW9uLzIuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUuMCBcCkBA
IC0xMjYsNyArMTIyLDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9s
aXRlbWFwLzAuOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sb2NrX2FwaS8wLjQuMTQgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvZy8wLjQuMjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L21haWxwYXJzZS8wLjE2LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAuMi4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYXliZS1vd25lZC8wLjMuNCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuOC4zIFwKQEAgLTE2MCw3ICsxNTUsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B0cl9tZXRhLzAuMy4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9wdHJfbWV0YV9kZXJpdmUvMC4zLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3F1b3RlLzEuMC40NyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJsZS8w
LjUuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vci1lZmkvNi4wLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JhbmNvci8wLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lz
Y2FsbC8wLjUuMTUgXApAQCAtMTc0LDcgKzE2OCw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZf
ZGVyaXZlLzAuOC4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMyBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LzEuMS40IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9ydXN0aXgvMS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC1saW51eC1w
cm9jZnMvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3R2ZXJzaW9uLzEuMC4yMiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnl1LzEuMC4yMyBcCkBAIC0xODUsNyArMTc5LDYgQEAg
U1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWFoYXNoLzQuMS4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zZWxmLXJlcGxhY2UvMS41LjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NlcmRlLzEuMC4yMjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlLXVudGFn
Z2VkLzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9jb3JlLzEuMC4yMjkgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2Rlcml2ZS8xLjAuMjI5IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zZXJkZV9kZXJpdmVfaW50ZXJuYWxzLzAuMzAuMCBcCkBAIC0xOTksNyArMTky
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1kdXRmOC8wLjEu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltaWxhci8yLjcuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2xhYi8wLjQuMTIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEu
MTYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xNi4xIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zbWF3ay8wLjMuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc29ja2V0
Mi8wLjYuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3BkeC8wLjEzLjUgXApAQCAtMjA3LDE0
ICsyMDAsMTQgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdHJpcC1h
bnNpLWVzY2FwZXMvMC4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cnNpbS8wLjExLjEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTE4IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9zeW4vMy4wLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8zLjAuNiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc3luc3RydWN0dXJlLzAuMTMuMiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGFyLWNvZGVjLzAuMC4xNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWZyYW1p
bmcvMC4wLjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90YXItY29kZWMvMC4wLjE1IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby90YXItZnJhbWluZy8wLjAuMTUgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RlbXAtZW52LzAuMy42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZW1wZmlsZS8z
LjI3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rlcm1pbmFsX3NpemUvMC40LjQgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3RleHR3cmFwLzAuMTYuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdGV4dHdyYXAvMC4xNi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3IvMi4w
LjIwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8yLjAuMjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3RocmVhZF9sb2NhbC8xLjEuOSBcCkBAIC0yMjQsMTAgKzIxNywx
MCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLzEuNTMuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tbWFjcm9zLzIuNy4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90b2tpby1zdHJlYW0vMC4xLjE5IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90
b21sLzEuMS4zK3NwZWMtMS4xLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWwvMS4xLjYr
c3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9kYXRldGltZS8xLjEuMStz
cGVjLTEuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2VkaXQvMC4yNS4xMytzcGVj
LTEuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX3BhcnNlci8xLjEuMitzcGVjLTEu
MS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2VkaXQvMC4yNS4xNStzcGVjLTEuMS4w
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX3BhcnNlci8xLjEuNStzcGVjLTEuMS4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX3dyaXRlci8xLjEuMitzcGVjLTEuMS4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLzAuMS40NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdHJhY2luZy1hdHRyaWJ1dGVzLzAuMS4zMSBcCkBAIC0yMzYsNyArMjI5LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXN1YnNjcmliZXIvMC4zLjIz
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXRlc3QvMC4yLjYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RyYWNpbmctdGVzdC1tYWNyby8wLjIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdHlwZWlkLzEuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90eXBlbnVtLzEuMjAu
MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdWNkLXRyaWUvMC4xLjcgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjI0IFwKQEAgLTI0NSw3ICsyMzcsNyBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8yLjUuOCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4
cGFyc2UvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS4yNC4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjYuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmFs
dWFibGUvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZlcnNpb25fY2hlY2svMC45LjUg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXApAQCAtMjk0LDggKzI4Niw4IEBA
IFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd3JpdGVhYmxlLzAuNi4yIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLzAuOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by95b2tlLWRlcml2ZS8wLjguMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2NvcHkvMC44
LjU2IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS1kZXJpdmUvMC44LjU2IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjguNTcgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3plcm9jb3B5LWRlcml2ZS8wLjguNTcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9m
cm9tLzAuMS42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvZnJvbS1kZXJpdmUvMC4xLjYg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm90cmllLzAuMi4zIFwKQEAgLTMxNCwxOCArMzA2
LDE5IEBAIFNSQ19VUklbYW5zdHlsZS1wYXJzZS0xLjAuMC5zaGEyNTZzdW1dID0gIjUyY2U3ZjM4
YjI0MjMxOWY3Y2FiYWE2ODEzMDU1NDY3MDYzZWNkCiBTUkNfVVJJW2Fuc3R5bGUtcXVlcnktMS4x
LjUuc2hhMjU2c3VtXSA9ICI0MGM0OGY3MmZkNTNjZDI4OTEwNGZjNjQwOTlhYmNhNzNkYjQxNjZh
ZDg2ZWEwYjQzNDFhYmU2NWFmODNkYWRjIgogU1JDX1VSSVthbnN0eWxlLXdpbmNvbi0zLjAuMTEu
c2hhMjU2c3VtXSA9ICIyOTFlNmEyNTBmZjg2Y2Q0YTgyMDExMmZiODg5ODgwOGEzNjZkOGY5ZjU4
Y2UxNmQxZjUzODM1M2FkNTU3NDdkIgogU1JDX1VSSVthbnlob3ctMS4wLjEwNC5zaGEyNTZzdW1d
ID0gIjMzMGE1ZWQwN2ZhNTRlNDcwMmM5ZDZjNDE3NGY3NDQyN2ZjMGVmNmUyMTRiYmQ2NzdhZTUw
YTUwOTk5NDY0NzAiCi1TUkNfVVJJW2FyY2hpdmUtdHJhaXQtMC4wLjE0LnNoYTI1NnN1bV0gPSAi
YzYwODBlYTE0Y2NmOTAxOWQ3Y2U1NzJjMzE5ZTU4MWMyMGE4MDVjOWJkYzZkYmZiOWI5ODhkYTAw
M2NiZDFhMyIKK1NSQ19VUklbYXJjaGl2ZS10cmFpdC0wLjAuMTUuc2hhMjU2c3VtXSA9ICI5OTli
Zjg4Y2M0ODM2NjRjYWI3NzcwMGNhMmZkZmIwNDE1YTczNDEyYWJlMjg0ZWY1YmMyMzE5ZDAwOTM4
ZTAwIgogU1JDX1VSSVthcmNzdHItMS4yLjAuc2hhMjU2c3VtXSA9ICIwMzkxOGMzZGJkNzcwMWE4
NWM2Yjk4ODc3MzJlMjkyMTE3NWYyNmMzNTBiNDU2Mzg0MWQwOTU4YzIxZDU3ZTZkIgogU1JDX1VS
SVthcnJheXZlYy0wLjcuOC5zaGEyNTZzdW1dID0gImQzZmI2N2E2ZTA4YWNmMjRmZGVjY2JhYzJj
YjZhYzQzMDU4MjViZDFmMTE3NDYyZTBlNmYyZjE5MzM0NWFkNTYiCitTUkNfVVJJW2FzdHJhbC1t
YWlsLWhlYWRlcnMtMC4wLjEuc2hhMjU2c3VtXSA9ICJkYzAxOWVjY2E4MmNmYzkxZmZhMzFhYjRm
ZmU3MDVhYWE3MDYzOTk4NDBhNzE1MjkyNmI3ZWVlNzM2ZGE0MTBhIgogU1JDX1VSSVthc3RyYWwt
dG9raW8tdGFyLTAuNy4wLnNoYTI1NnN1bV0gPSAiNmYyZTk4OWIzMzI0NmZlOTI0MGQzOWFjY2Y0
ZGQ5YTAxZTBiNmMxZjNjZTlkZDA5NWUwYTQ3ZmEwMjUwNTUyMyIKLVNSQ19VUklbYXN0cmFsLXZl
cnNpb24tcmFuZ2VzLTAuMi4yLnNoYTI1NnN1bV0gPSAiODExMjllMTQzYTdiY2VhMjYzZDVhMmM1
MGI4YmU0N2FjNTgzNjVkZGU2MThiYzFhYzUwZjY5ZjQ5N2M5Y2I2MyIKLVNSQ19VUklbYXN0cmFs
X2FzeW5jX3ppcC0wLjAuMjEuc2hhMjU2c3VtXSA9ICIxM2Y0YTliYzYyODlkOTA3YzhlODgzZDI1
MDI2YTU0NzUxZDY4NmRhOTkyNmFmMjcxZDBmYzRjYmU1OGE3ZjRkIgotU1JDX1VSSVthc3luYy1j
b21wcmVzc2lvbi0wLjQuNDUuc2hhMjU2c3VtXSA9ICIyNGE4ZWM3M2ViODYyNTA4YjcwNDE3MjNj
ODkzODYzNjU4OTRiNGU3ZDlmNjk5OGJmMWI4NTI5ZTViMGVlMjU0IgorU1JDX1VSSVthc3RyYWwt
dmVyc2lvbi1yYW5nZXMtMC4yLjMuc2hhMjU2c3VtXSA9ICJiMzE1YWNjNGRjN2YwZDNjY2RkNTU3
YTAxYjZhODlmYTJkODk2ZTk5YTQ1MGI5OGU4MjlmYzgxNTJmMGIyZjk4IgorU1JDX1VSSVthc3Ry
YWxfYXN5bmNfemlwLTAuMC4yMi5zaGEyNTZzdW1dID0gIjBmODUwOGQwOWM2YmM2YWJkNDI3Njdk
MWQ0M2M3NzAyODkxNjkxNDg0ODc1Y2U5NGY3OTk3ZGExMzAxZDk1ZTkiCitTUkNfVVJJW2FzeW5j
LWNvbXByZXNzaW9uLTAuNC40OC5zaGEyNTZzdW1dID0gImZiNjFhZWExYTdkZWY3M2VlN2MzNTBh
MTg0ZjBlNzBiMzJjMTgyMzQ0ZTJlNzViZjcwYzliNjIxYjgzNDE3ZmQiCiBTUkNfVVJJW2F1dG9j
ZmctMS41LjAuc2hhMjU2c3VtXSA9ICJjMDg2MDZmOGMzY2JmNGNlNmVjOGUyOGZiMDAxNGEyYzA4
NjcwOGZlOTU0ZWFhODg1Mzg0YTYxNjUxNzJlN2U4IgogU1JDX1VSSVtiYWNrb24tMS42LjAuc2hh
MjU2c3VtXSA9ICJjZmZiMGU5MzE4NzViNjY2ZmM0ZmNiMjBmZWU1MmU5YmJkMWVmODM2ZmQ5ZTll
MDRlYzIxNTU1ZjlmODVmN2VmIgogU1JDX1VSSVtiYXNlNjQtMC4yMi4xLnNoYTI1NnN1bV0gPSAi
NzJiMzI1NGYxNjI1MWE4MzgxYWExMmU0MGUzYzRkMmYwMTk5ZjhjNjUwOGZiZWNiOWQ5MWY1NzVl
MGZiYjhjNiIKIFNSQ19VUklbYml0ZmxhZ3MtMS4zLjIuc2hhMjU2c3VtXSA9ICJiZWYzOGQ0NTE2
M2MyZjFkZGUwOTRhN2RmZDMzY2NmNTk1YzkyOTA1YzhmOGY0ZmRjMThkMDZmYjEwMzc3MThhIgot
U1JDX1VSSVtiaXRmbGFncy0yLjEzLjEuc2hhMjU2c3VtXSA9ICJiNTg4Yjc2ZDAwZmRlNzk2ODdk
NzY0NmE5YjViZGYzY2MwZjY1NWUwYmJkMDgwMzM1YTk1ZDdlOTZmMzU4N2RhIgorU1JDX1VSSVti
aXRmbGFncy0yLjEzLjIuc2hhMjU2c3VtXSA9ICIzZGVkNDA1N2MyNThiYTE5OWUyZDI2Mzg2ZDNh
ZjM3ODA5NTdlY2FlZTZjNGVmNDA0MWM2YjRiOGI5N2MwYjA2IgogU1JDX1VSSVtibG9jay1idWZm
ZXItMC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYyZDNmMDQzOTUxN2ZhMzk0OTk2YWNh
Y2M1Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKIFNSQ19VUklbYmxvY2stYnVmZmVyLTAu
MTIuMS5zaGEyNTZzdW1dID0gImQyZjZjN2RiZTk1YTZlZDY3YWQ5ZjE4ZTU3ZGFmOTNhMmYwMzRj
NTI0Yjk5ZmQyYjc2ZDE4ZmRmZWI2NjYwYWEiCiBTUkNfVVJJW2JveGNhci0wLjIuMTQuc2hhMjU2
c3VtXSA9ICIzNmY2NGJlYWU0MGE4NGRhMWI0YjI2ZmYyNzYxYTViODk1YzEyYWRjNDFkYzI1YWFl
ZTFjNGYyYmJmZTk3YTZlIgpAQCAtMzM3LDIzICszMzAsMjEgQEAgU1JDX1VSSVtieXRlcy0xLjEy
LjEuc2hhMjU2c3VtXSA9ICJmYzY1MmE0OGMzNTJhZWYzZWEzYWVkMzIwODA1MDFjZjNlZjZlZDVk
YTc4NjAKIFNSQ19VUklbY2FwLXByaW1pdGl2ZXMtNC4wLjMuc2hhMjU2c3VtXSA9ICI4YjVmNzQ3
MjlmZDJmNDQ3MDFkMWE4ZWI0N2U5MDZjZGIzY2NkOWVjMGYwMmJhYWQ4NWE3NDRiNzkxOTQwYjE4
IgogU1JDX1VSSVtjYXAtc3RkLTQuMC4zLnNoYTI1NnN1bV0gPSAiYzFlYzc4ZTI0MmNmYTJjZmUy
NzY4MDdhYzJlY2MwMDMxNWE2Yzk3Nzg2OTc3NDE0YmNkMWMzOTYzYjZjOTFiOCIKIFNSQ19VUklb
Y2ZnLWlmLTEuMC40LnNoYTI1NnN1bV0gPSAiOTMzMGY4YjJmZjEzZjM0NTQwYjQ0ZTk0NmVmMzUx
MTE4MjU3MjdiMzhkMzMyODZlZjk4NjE0MjYxNTEyMTgwMSIKLVNSQ19VUklbY2hhcnNldC0wLjEu
NS5zaGEyNTZzdW1dID0gImYxZjkyN2IwN2M3NGJhODRjN2U1ZmU0ZGIyYmFlYjNlOTk2YWIyNjg4
OTkyZTM5YWM2OGNlMzIyMGE2NzdjN2UiCi1TUkNfVVJJW2NsYXAtNC42LjYuc2hhMjU2c3VtXSA9
ICI0NzNjN2UwN2Y0MDlhOGQ3NzIxNjE3MjRhYThkYjZhNzY1YTI1MzJhNzBmOTY2N2VlYjdiNDlk
M2QwMmZiZGNhIgotU1JDX1VSSVtjbGFwX2J1aWxkZXItNC42LjYuc2hhMjU2c3VtXSA9ICI3YjQ4
ZmVhNWE4OGU5YWU3MjhhMmRjYmVkYmZjMGU3MzBmN2Q2MGRhNDJlMWNiMDQ5YTgzYzlmYjhiNzg5
ODg5IgotU1JDX1VSSVtjbGFwX2Rlcml2ZS00LjYuNC5zaGEyNTZzdW1dID0gImQwMTJkMmI5ZDY1
YWNhN2YxOGY0ZDk4NzhhMDQ1YmMxNzg5OWJiYTk1MTU2MWJhNWVjM2MyYmExZWVkOWEwNjEiCitT
UkNfVVJJW2NsYXAtNC42Ljcuc2hhMjU2c3VtXSA9ICJhYTg4NzZiMzAwYWIzNWJhOTIxYWRlYTNk
ZmQ3MDE1N2E0NjI0OWIzM2Y5NWM5MDg0YWU1NzA5Nzg1NDc4OTQ2IgorU1JDX1VSSVtjbGFwX2J1
aWxkZXItNC42Ljcuc2hhMjU2c3VtXSA9ICJlYzA3OTdmYjdhZWIxNDA2Yzg0ZWZhYzUyNjkwMWY3
ZWMzZWFkMjEyNGY5NDZiNDk0ZTcyODc5ZDRiNTQ3MDRkIgorU1JDX1VSSVtjbGFwX2Rlcml2ZS00
LjYuNy5zaGEyNTZzdW1dID0gImY5Yzc1MWI3OTQxNWQ0ZTU1OWUzZDFmY2YxMjhlMDllNzIwZWI2
NzNhMDZkMjZjZjZmMzkyZDM3ZDc1YjY2ZTAiCiBTUkNfVVJJW2NsYXBfbGV4LTEuMS4wLnNoYTI1
NnN1bV0gPSAiYzhkNGEzYmI4YjFlMGMxMDUwNDk5ZDE4MTVmNWFiMTZkMDRmMDk1OWIyMzMwODVm
YjMxNjUzZmJmYzlkOThmOSIKIFNSQ19VUklbY29sb3JjaG9pY2UtMS4wLjUuc2hhMjU2c3VtXSA9
ICIxZDA3NTUwYzkwMzZiZjJhZTBjNjg0YzQyOTdkNTAzZjgzODI4N2M4M2M1MzY4NmQwNTM3MGQw
ZTEzOWFlNTcwIgogU1JDX1VSSVtjb21wcmVzc2lvbi1jb2RlY3MtMC40LjQ1LnNoYTI1NnN1bV0g
PSAiOThmYzk4NDYwYmEwYWQ1MzE3MDc1ZDM2MzJiOGRmYzQ1ZDBiZThjNGE0OTM0N2MyYTM4Mjcy
MDE5NzE3NjE0YSIKIFNSQ19VUklbY29tcHJlc3Npb24tY29yZS0wLjQuMzMuc2hhMjU2c3VtXSA9
ICI2ZThjY2M0ZWE5ZjZhY2MzMmQxMDJjMGY2ZDQ3MWQxMWQ5MTNhZDE1ZjIwYzA0ZGU3NDMzNzQ4
NjFmYTFkNDE0IgotU1JDX1VSSVtjb25zb2xlLTAuMTYuNC5zaGEyNTZzdW1dID0gIjRmZTVmNDY1
YTRmNmZlZTg4ZmFkNDFiODVkOTkwZjg0YzgzNTMzNWU4NWI1ZDllNmU2M2UwZDA2ZDI4Y2JhN2Mi
CitTUkNfVVJJW2NvbnNvbGUtMC4xNi42LnNoYTI1NnN1bV0gPSAiZTk2YTQ5NTY3NzRjMTNjMTI2
YThiNWFmNGRhYTc5Mzg0ZjRkODI2NTM0Yzk1YTAyZDc2YWZiMzllMmFiNjRlMyIKIFNSQ19VUklb
Y3B1ZmVhdHVyZXMtMC4yLjE3LnNoYTI1NnN1bV0gPSAiNTllZDU4MzhlZWJiMjZhMmJiMmU1OGY2
ZDViNTMxNjk4OWFlOWQwOGJhYjEwZTBlNmQxMDNlNjU2ZDFiMDI4MCIKIFNSQ19VUklbY3B1ZmVh
dHVyZXMtMC4zLjAuc2hhMjU2c3VtXSA9ICI4YjJhNDEzOTNmNjZmMTZiMDgyM2JiNzkwOTRkNTRh
YzVmYmQzNGFiMjkyZGRhZmI5YTA0NTZhYzlmODdkMjAxIgotU1JDX1VSSVtjcmMzMmZhc3QtMS41
LjAuc2hhMjU2c3VtXSA9ICI5NDgxYzFjOTBjYmYyYWM5NTNmMDdjOGQ0YTU4YWEzOTQ1YzQyNWI3
MTg1YzkxNTRkNjdhNjVlNDIzMGRhNTExIgorU1JDX1VSSVtjcmMzMmZhc3QtMS41LjIuc2hhMjU2
c3VtXSA9ICIwMWE3Nzk5ZmQ2Yjg1MmRiMGU2MTcyOGRkZTlhMjA0YzQyM2I0NGQ2ODlkYmQ0MzI1
MjI1NDM2MTRiNDkwZTc4IgogU1JDX1VSSVtjcnlwdG8tY29tbW9uLTAuMS43LnNoYTI1NnN1bV0g
PSAiNzhjODI5MjA1NWQxYzFkZjBjY2U1ZDE4MDM5M2RjOGNjZTBhYmVjMGE3MTAyYWRiNmM3YjFl
ZWY2MDE2ZDYwYSIKIFNSQ19VUklbY3J5cHRvLWNvbW1vbi0wLjIuMi5zaGEyNTZzdW1dID0gImNl
NmU0Yzk2MWQ2Y2Q2YzlhODZkYjQxODM4NzQyNWU4YmRlYWYwNWIzYzhiYzE0MTFlNmRjYTRjMjUy
ZjE0NTMiCiBTUkNfVVJJW2Nzdi0xLjQuMC5zaGEyNTZzdW1dID0gIjUyY2Q5ZDY4Y2Y3ZWZjNmRk
ZmFhZWU0MmU3Mjg4ZDNhOTlkNjEzZDRiNTBmNzZjZTk4MjdhZTBjNmUxNGY5MzgiCiBTUkNfVVJJ
W2Nzdi1jb3JlLTAuMS4xMy5zaGEyNTZzdW1dID0gIjcwNGEzYzI2OTk2YTgwNDcxMTg5MjY1ODE0
ZGJjMmMyNTc1OThiOTZiOGE3ZmVhZTJkMzFhY2U2NDZiYjk3ODIiCi1TUkNfVVJJW2RhdGEtZW5j
b2RpbmctMi4xMS4xLnNoYTI1NnN1bV0gPSAiNDU4M2E0NTUxZGY0NmUyNzkyZjgyY2VlYWM0NWU4
NTBkMmUyZDVkZWJiYTBiOTFmMTAyMzg1Y2RhNWIxMWYwNiIKIFNSQ19VUklbZGVmbXQtMS4xLjAu
c2hhMjU2c3VtXSA9ICJhNmU1MjQ1MDY0OTBhMTk1M2QyMzdjYjg3YjFjZmMxZTQ2Zjg4YzE4ZjEw
YTIyZGZlMGY1MDdkYzZiZmM3ZjdmIgogU1JDX1VSSVtkZWZtdC1tYWNyb3MtMS4xLjAuc2hhMjU2
c3VtXSA9ICJmMGEyNzc3MGU5YzhmNzE5YTc5ZDhiNjM4MjgxZjRkODI4Zjc3ZDhmZDYxZTBiZDk0
NDUxYjliODVlNTc2YTBiIgogU1JDX1VSSVtkZWZtdC1wYXJzZXItMS4wLjAuc2hhMjU2c3VtXSA9
ICIxMGQ2MDMzNGIzYjJlN2M5ZDkxZWY4MTUwYWJmYjZmYTRjMWMzOWViYmNmNGE4MWMyZTM0NmFh
ZDkzOWZlZTNlIgpAQCAtMzY5LDcgKzM2MCw2IEBAIFNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4x
Ljguc2hhMjU2c3VtXSA9ICJmYmEzZmU4NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgwZGI5MTQ2CiBT
UkNfVVJJW2VudW1mbGFnczItMC43LjEyLnNoYTI1NnN1bV0gPSAiMTAyN2Y3NjgwYzg1M2UwNTZl
YmNlYzY4MzYxNWZiNmZiYmMwN2RiYWExM2I0ZDVkOTQ0MmIxNDZkZWQ0ZWNlZiIKIFNSQ19VUklb
ZW51bWZsYWdzMl9kZXJpdmUtMC43LjEyLnNoYTI1NnN1bV0gPSAiNjdjNzhhNGQ4ZmRmOTk1M2E1
YzlkNDU4ZjllZmU5NDBmZDk3YTBjYWIwOTQxYzA3NWE4MTNhYzU5NDczMzgyNyIKIFNSQ19VUklb
ZXF1aXZhbGVudC0xLjAuMi5zaGEyNTZzdW1dID0gIjg3N2E0YWNlODcxM2IwYmNmMmE0ZTdlZWM4
MjUyOWMwMjlmMWQwNjE5ODg2ZDE4MTQ1ZmVhOTZjM2ZmZTVjMGYiCi1TUkNfVVJJW2VyYXNlZC1z
ZXJkZS0wLjQuMTAuc2hhMjU2c3VtXSA9ICJkMmFkZDhhMDdkZDZhOGQ5M2ZmNjI3MDI5YzUxZGUx
NDVlMTI2ODZmYmMzNmVjYjI5OGFjMjJlNzRjZjAyZGVjIgogU1JDX1VSSVtlcnJuby0wLjMuMTQu
c2hhMjU2c3VtXSA9ICIzOWNhYjcxNjE3YWUwZDYzZjUxYTM2ZDY5Zjg2NjM5MTczNWI1MTY5MWRi
ZGE2M2NmNmY5NmQwNDJiNjNlZmViIgogU1JDX1VSSVtmYXN0cmFuZC0yLjUuMC5zaGEyNTZzdW1d
ID0gImRhN2M2MmNlYWUyMDdkZDM3ZWE1Yjg0NWRhNmEwNjk2Yzc5OWY4NWU5N2RhMWFiNWI3OTEw
YmUzYzFjODAyMjMiCiBTUkNfVVJJW2ZpeGVkYml0c2V0LTAuNS43LnNoYTI1NnN1bV0gPSAiMWQ2
NzRlODEzOTFkMWUxYWI2ODFhMjhkOTlkZjA3OTI3YzZkNGFhNWIwMjdkN2RhMTZiYTMyZDFkMjFl
Y2Q5OSIKQEAgLTQwNiw3ICszOTYsNyBAQCBTUkNfVVJJW2ljdV9wcm9wZXJ0aWVzX2RhdGEtMi4x
LjIuc2hhMjU2c3VtXSA9ICI2MTZjMjk0Y2Y4ZDcyNWM2YWZjZDhmNTVhYmMxN2M1NgogU1JDX1VS
SVtpY3VfcHJvdmlkZXItMi4xLjEuc2hhMjU2c3VtXSA9ICI4NTk2MmNmMGNlMDJlMWUwYTYyOWNj
MzRlN2NhM2UzNzNjZTIwZGRhNGM0ZDcyOTRiYmQwYmYxZmRiNTllNjE0IgogU1JDX1VSSVtpZG5h
LTEuMS4wLnNoYTI1NnN1bV0gPSAiM2IwODc1ZjIzY2FhMDM4OTg5OTRmNmRkYzUwMTg4NmE0NWM3
ZDNkNjJkMDRkMmQ5MDc4OGQ0N2JlMWIxZTRkZSIKIFNSQ19VUklbaWRuYV9hZGFwdGVyLTEuMi4x
LnNoYTI1NnN1bV0gPSAiM2FjYWU5NjA5NTQwYWEzMThkMWJjNTg4NDU1MjI1ZmIyMDg1YjllZDBj
NGY2YmQwZDlkNWJjZDg2ZjFhMDM0NCIKLVNSQ19VUklbaW5kZXhtYXAtMi4xNC4xLnNoYTI1NnN1
bV0gPSAiMDdhYTIwNDgxNDIyNDI5MTVhMzFkMzU4NDRmYjMxMWUwZTUzZmNjYTU5MGMzYTBhNDBk
Y2YxYjg0MWZhMDllYiIKK1NSQ19VUklbaW5kZXhtYXAtMi4xNC4yLnNoYTI1NnN1bV0gPSAiY2M0
ZTE5MGY1ZDI2Y2E3MDUxNjQyNjI5ZGEyYzUyZmMwM2JkZTg1YTAzMTk3Yzk5NDA4ZGNkMjkxNzM0
Yzg1NSIKIFNSQ19VUklbaW5kb2MtMi4wLjcuc2hhMjU2c3VtXSA9ICI3OWNmNWM5M2Y5MzIyOGNm
OGVmYjNiYTM2MjUzNWZiMTExOTlhYzU0OGEwOWNlMTE3YzliMWFkYzMwMzBkNzA2IgogU1JDX1VS
SVtpbnN0YS0xLjQ4LjAuc2hhMjU2c3VtXSA9ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0M2Ew
ODUyM2EyNmZhY2NiMjMyM2Y1ZTZiNjQ0ZmU3ZGQ0ZWY2YjgyIgogU1JDX1VSSVtpby1leHRyYXMt
MC4xOS4wLnNoYTI1NnN1bV0gPSAiMjBmZDZkZTRjY2ZjYzE4N2UzOGJjMjFjZmE1NDNjYjVhMzAy
Y2I4NmE4YjExNGViN2YwYmYwZGM5ZjhhYzAwZiIKQEAgLTQxNiwxMSArNDA2LDkgQEAgU1JDX1VS
SVtpcG5ldC0yLjEyLjAuc2hhMjU2c3VtXSA9ICJkOThmNmZlZDFmZGUzZjhjMjFiYzQwYTFhYmI4
OGRkNzVlNjc5MjRmOWNmZmMKIFNSQ19VUklbaXNfdGVybWluYWxfcG9seWZpbGwtMS43MC4yLnNo
YTI1NnN1bV0gPSAiYTZjYjEzOGJiNzlhMTQ2YzFiZDQ2MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5
Y2I0OTNlMDJmN2QwOGEzNTY5NSIKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1d
ID0gIjJiMTkyYzc4MjAzN2ZhZGQ5Y2ZhNzU1NDgzMTA0ODhhYWJkYmYzZDJkYTczODg1YjMxYmQw
YWJkMDMzNTEyODUiCiBTUkNfVVJJW2l0b2EtMS4wLjE3LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4
MTgxZGVmMDQ1NzM5MmNjZDBlZTUxMTk4ZTA2NWUwMTZkMWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIK
LVNSQ19VUklbamlmZi0wLjIuMzUuc2hhMjU2c3VtXSA9ICI2NjhiNzE4M2JkMDdhZjlhNDg4NWY1
YzM1YjBjYzVjODNjNDYwN2E5MTNjMTZiN2UxNzI5MTgzMjkxMGQyZGNjIgorU1JDX1VSSVtqaWZm
LTAuMi4zNy5zaGEyNTZzdW1dID0gIjBhYjFiYWY3MmYwODc5NmRlMDI2MDYwOTUxNTEzMDY5OWI4
OTBhYzI1ZjMwZTYxMGFkODk0YmM1ODU2Y2FmZGIiCiBTUkNfVVJJW2ppZmYtY29yZS0wLjEuMC5z
aGEyNTZzdW1dID0gIjdmZWNhODg0MzllZmU1M2RhMzc1NDUwMGMxODUxZGVkZjNjYjM2YzUyNGRk
NWNmODIyNWNjMDc5NGRlOTVkMDkiCi1TUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4zNS5zaGEyNTZz
dW1dID0gIjNhNjlkY2IzYTIxY2ZiMzJjZTFjZDA1NjE2OTMzN2NhMjg0YWYwNzY2ZGQ3NjZlNzg3
ODgxOWIyNTFhNDkyMDQiCi1TUkNfVVJJW2ppZmYtdHpkYi0wLjEuOC5zaGEyNTZzdW1dID0gIjE0
MmJkMzk5MzJhZDIzMWYxMDUxM2RmOWFiNjI2NjFmZWFkODcxOTg3MjE1MGI3YWQwMmEyZGY3OWY0
ZTE0MWUiCi1TUkNfVVJJW2ppZmYtdHpkYi1wbGF0Zm9ybS0wLjEuMy5zaGEyNTZzdW1dID0gIjg3
NWE1YTY5YWMyYmFiMWE4OTE3MTFjZjVlY2NiZWMxY2UwMzQxZWE4MDU1NjBkY2Q5MGI3YTJlOTI1
MTMyZTgiCitTUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4zNy5zaGEyNTZzdW1dID0gIjM3ODI2OGEx
MTE2YWQ2N2FlNjIyODcwMTExOGFjOWY0OTFkNzhmZGEzOGE0MGExZjFhOWUxMzQ4ZGU2ZjcyMTIi
CiBTUkNfVVJJW2pzLXN5cy0wLjMuOTEuc2hhMjU2c3VtXSA9ICJiNDk3MTViNzA3M2YzODViYTRi
YzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2ZWZiNjZiNzgxZjEzMWYwZmIzOTljIgogU1JDX1VSSVtq
dW5jdGlvbi0yLjAuMC5zaGEyNTZzdW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhhYWU1ZGVi
MTJhZDM0OWM5MDliYWE3MTBmYTI0YjkyYzkwOTBiMmUwMDYiCiBTUkNfVVJJW2xhenlfc3RhdGlj
LTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEy
NDczYzUwYzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIKQEAgLTQyOSw3ICs0MTcsNiBAQCBTUkNfVVJJ
W2xpbnV4LXJhdy1zeXMtMC4xMi4xLnNoYTI1NnN1bV0gPSAiMzJhNjY5NDllMDMwZGEwMGU4Yzdk
NDQzNGIyNTE2NzBhOTE1NQogU1JDX1VSSVtsaXRlbWFwLTAuOC4xLnNoYTI1NnN1bV0gPSAiNjM3
MzYwN2E1OWYwYmU3M2EzOWI2ZmU0NTZiODE5MmZjYzM1ODVmNjAyYWYyMDc1MTYwMGU5NzRkZDQ1
NWU3NyIKIFNSQ19VUklbbG9ja19hcGktMC40LjE0LnNoYTI1NnN1bV0gPSAiMjI0Mzk5ZTc0Yjg3
YjVmMzU1NzUxMWQ5OGRmZjhiMTQwODliM2RhZGFmY2FiNmJiOTNlYWI2N2QzYWFjZTk2NSIKIFNS
Q19VUklbbG9nLTAuNC4yOS5zaGEyNTZzdW1dID0gIjVlNTAzMmUyNDAxOTA0NWM3NjJkM2MwZjI4
ZjViNmI4YmJmMzg1NjNhNjU5MDgzODliZjc5Nzg3NTg5MjA4OTciCi1TUkNfVVJJW21haWxwYXJz
ZS0wLjE2LjEuc2hhMjU2c3VtXSA9ICI2MDgxOWE5N2RkY2I4MzFhNTYxNGViM2IwMTc0ZjM2MjBl
NzkzZTk3ZTA5MTk1YTM5NWJmYTk0OGZkNjhlZDJmIgogU1JDX1VSSVttYXRjaGVycy0wLjIuMC5z
aGEyNTZzdW1dID0gImQxNTI1YTJhMjhjN2Y0ZmEwZmM5OGJiOTFhZTc1NWQxZTJkMTUwNTA3OWUw
NTUzOWUzNWJjODc2YjVkNjVhZTkiCiBTUkNfVVJJW21heWJlLW93bmVkLTAuMy40LnNoYTI1NnN1
bV0gPSAiNGZhY2M3NTNhZTQ5NGFlYjZlM2MyMmY4MzliMTU4YWViZDRmOTI3MGY1NWNkM2M3OTkw
NmM0NTQ3NmM0N2FiNCIKIFNSQ19VUklbbWVtY2hyLTIuOC4zLnNoYTI1NnN1bV0gPSAiY2Y4YmFm
MWM1NWU2MmZmY2FjZTdhOWYwNmY0YmQ5Y2QzZjBjNGJlYjAyMmQzYjM2NzI1NmI5MWI4NzUxM2Q5
OCIKQEAgLTQ2Myw3ICs0NTAsNiBAQCBTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4xMDcuc2hhMjU2
c3VtXSA9ICI5ODVlN2VjOWJiNzQ1ZTZjZTY1MzViNTQ0ZDg0ZDZjZDZmN2FkOAogU1JDX1VSSVtw
dHJfbWV0YS0wLjMuMS5zaGEyNTZzdW1dID0gIjBiOWEwY2Y5NWExMTk2YWY2MWQ0ZjFjYmRhYjk2
NzE3OTUxNmQ5YTRhNDMxMmFmMWYzMTk0OGY4ZjYyMjRhNzkiCiBTUkNfVVJJW3B0cl9tZXRhX2Rl
cml2ZS0wLjMuMS5zaGEyNTZzdW1dID0gIjczNDc4NjdkMGE3ZTEyMDhkOTNiNDY3NjdiZTgzZTJi
OGY5NzhjM2RhZDM1Zjc3NWFjOGQ4ODQ3NTUxZDZmZTEiCiBTUkNfVVJJW3F1b3RlLTEuMC40Ny5z
aGEyNTZzdW1dID0gIjFmYmY0ZGIxNDJhNDczYThkODBjMjZiYmYxODQ1NGVkNDU4YmY4ZDI2Yzgy
MTljMzMxZGFlY2ZkYmQwNzkwMDEiCi1TUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjEuc2hh
MjU2c3VtXSA9ICI2NDBjOWJkODQ5N2IwMjQ2NWFlZWY1Mzc1MTQ0YzI2MDYyZTBkY2Q1OTM5ZGZj
YmIwZjVkYjc2Y2I4YzE3YzczIgogU1JDX1VSSVtyLWVmaS02LjAuMC5zaGEyNTZzdW1dID0gImY4
ZGNjOWM3ZDUyYTgxMTY5N2QyMTUxYzcwMWUwZDA4OTU2ZjkyYjBlMjQxMzZjZjRjZjI3YjU3YTZh
MGQ5YmYiCiBTUkNfVVJJW3JhbmNvci0wLjEuMS5zaGEyNTZzdW1dID0gImEwNjNlYTcyMzgxNTI3
YzJhMDU2MWRhOWM4MDAwMGVmODIyYmRkN2MzMjQxYjFjYzFiMTIxMDBlM2RmMDgxZWUiCiBTUkNf
VVJJW3JlZG94X3N5c2NhbGwtMC41LjE1LnNoYTI1NnN1bV0gPSAiN2U4YWYwZGRlMDk0MDA2MDEx
ZTZhNzQwZDQ4NzkzMTk0Mzk0ODk4MTNiZDBiY2RjN2Q4MjFiZWFlZWZmNDhlYyIKQEAgLTQ3Nyw3
ICs0NjMsNyBAQCBTUkNfVVJJW3JlbmQtMC41LjMuc2hhMjU2c3VtXSA9ICJjYWRhZGVmMzE3YzJm
MjA3NTVhNjRkN2ZkYzQ4ZjllNzE3OGVlNmIwZTFmN2ZjZQogU1JDX1VSSVtya3l2LTAuOC4xOC5z
aGEyNTZzdW1dID0gImQ5Nzc2MDkzYjdjYTE3MDQ1NGFiMTQwNjk1NGY3YjdkOTdhNTdjNTFkYzZj
MDY0Mjk1N2ZiMmVmMjVjMmQzOTkiCiBTUkNfVVJJW3JreXZfZGVyaXZlLTAuOC4xOC5zaGEyNTZz
dW1dID0gIjFjMjVlZjYwNGFjN2RkODM5ZDQ0ZDY0NjQ4OTUyZWEyM2M5Nzg2NmYxMjRmZjY3MWIw
ZWQyY2YzYWQ5YmIwNmUiCiBTUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjMuc2hhMjU2c3VtXSA9ICI2
YjFlN2Y5YTQyODU3MWJlMmRjNWJjMDUwNWMxM2ZiNmJmOTM2ODIyYjg5NGVjODdhYmY4YTA4YTRl
NTE3NDJkIgotU1JDX1VSSVtydXN0aXgtMS4xLjQuc2hhMjU2c3VtXSA9ICJiNmZlNDU2NWI5NTE4
YjgzZWY0ZjkxYmI0N2NlMjk2MjBjYTgyOGJkMzJjYjdlNDA4ZjAwNjJlOTkzMGJhMTkwIgorU1JD
X1VSSVtydXN0aXgtMS4xLjUuc2hhMjU2c3VtXSA9ICI4OTFlZmFiYWJlNDE4NjcwNzc1ZjE5OWYw
ZDIzM2Q4NDg0M2MyMjdhMDk0OWE4ODNjZTE1YjM3Yzc4ZDY2MjlkIgogU1JDX1VSSVtydXN0aXgt
bGludXgtcHJvY2ZzLTAuMS4xLnNoYTI1NnN1bV0gPSAiMmZjODRiZjdlOWFhMTZjNGYyYzc1OGYy
NzQxMmRjOTg0MTM0MWUxNmFhNjgyZDljN2FjMzA4ZmUzZWUxMjA1NiIKIFNSQ19VUklbcnVzdHZl
cnNpb24tMS4wLjIyLnNoYTI1NnN1bV0gPSAiYjM5Y2RlZjBmYTgwMGZjNDQ1MjVjODRjY2I1NGEw
Mjk5NjFhODIxNWY5NjE5NzUzNjM1YTljMGQyNTM4ZDQ2ZCIKIFNSQ19VUklbcnl1LTEuMC4yMy5z
aGEyNTZzdW1dID0gIjk3NzRiYTRhNzRkZTVmN2IxYzE0NTFlZDZjZDUyODVhMzJlZGRiNWNjY2I4
Y2M2NTVhNGU1MDAwOWUwNjQ3N2YiCkBAIC00ODgsNyArNDc0LDYgQEAgU1JDX1VSSVtzY29wZWd1
YXJkLTEuMi4wLnNoYTI1NnN1bV0gPSAiOTQxNDNmMzc3MjUxMDlmOTJjMjYyZWQyY2Y1ZTU5YmNl
NzQ5OGMwMWIKIFNSQ19VUklbc2VhaGFzaC00LjEuMC5zaGEyNTZzdW1dID0gIjFjMTA3YjZmNDc4
MDg1NGM4YjEyNmUyMjhlYTg4NjlmNGQ3YjcxMjYwZjk2MmZlZmI1N2I5OTZiODk1OWJhNmIiCiBT
UkNfVVJJW3NlbGYtcmVwbGFjZS0xLjUuMC5zaGEyNTZzdW1dID0gIjAzZWM4MTViNWVhYjQyMGFi
ODkzZjYzMzkzODc4ZDg5YzkwZmRkOTRjMGJjYzQ0YzA3YWJiOGFkOTU1NTJmYjciCiBTUkNfVVJJ
W3NlcmRlLTEuMC4yMjkuc2hhMjU2c3VtXSA9ICI0MTQ4NTkwYWZlYmFkYTM4NjY4OGYxODc3M2Rh
NjE3NzkyYmYyZWYwM2ZmYzFlNGNiZDJiMWQ0NWIwMjNlMGJhIgotU1JDX1VSSVtzZXJkZS11bnRh
Z2dlZC0wLjEuOS5zaGEyNTZzdW1dID0gImY5ZmFmNDhhNGEyZDI2OTNiZTI0YzYyODlkYmUyNjU1
Mjc3NmViNzczNzA3NGU2NzIyODkxZmFkYmU2YzUwNTgiCiBTUkNfVVJJW3NlcmRlX2NvcmUtMS4w
LjIyOS5zaGEyNTZzdW1dID0gIjY3ZGNhMmM5YzUxZTU4YTQ3OTFhNGIxZWQ1ODMwOGIzOWM2NDIy
NGQzNDlhOTM1YWI1MDM5YWEzNjA5NDJhNDgiCiBTUkNfVVJJW3NlcmRlX2Rlcml2ZS0xLjAuMjI5
LnNoYTI1NnN1bV0gPSAiZTdhNWQ3MTI2M2E1YTdkNDdiNDFmNmIzZjA2YmEyNzZmMTBjYzE4YjA5
MzFmMTc5OWY3MTA1NzhlMjMwOTM0OCIKIFNSQ19VUklbc2VyZGVfZGVyaXZlX2ludGVybmFscy0w
LjMwLjAuc2hhMjU2c3VtXSA9ICJmODUyMTM3Y2NlMDM1ZDZhNGRmNjdjY2NlNTA1ZmY2YjNlOWZk
M2ExMGUzZTUyYjI0ZGM3MWU2NTBiYjFhOWJkIgpAQCAtNTAyLDcgKzQ4Nyw3IEBAIFNSQ19VUklb
c2ltZC1hZGxlcjMyLTAuMy44LnNoYTI1NnN1bV0gPSAiZTMyMGE2YzVhZDMxZDI3MWFkNTIzZGNm
M2FkMTNlMjc2N2FkOGIxCiBTUkNfVVJJW3NpbWR1dGY4LTAuMS41LnNoYTI1NnN1bV0gPSAiZTNh
OWZlMzRlM2U3YTUwMzE2MDYwMzUxZjM3MTg3YTNmNTQ2YmNlOTU0OTYxNTY3NTRiNjAxYTVmYTcx
Yjc2ZSIKIFNSQ19VUklbc2ltaWxhci0yLjcuMC5zaGEyNTZzdW1dID0gImJiYmI1ZDk2NTkxNDE2
NDZhZTY0N2I0MmZlMDk0ZGFmNmM2MTkyZDE2MjA4NzBiNDQ5ZDk1NTdmNzQ4YjJkYWEiCiBTUkNf
VVJJW3NsYWItMC40LjEyLnNoYTI1NnN1bV0gPSAiMGM3OTBkZTIzMTI0ZjlhYjQ0NTQ0ZDdhYzA1
ZDYwNDQwYWRjNTg2NDc5Y2U1MDFjMWQ2ZDdkYTNjZDhjOWNmNSIKLVNSQ19VUklbc21hbGx2ZWMt
MS4xNi4wLnNoYTI1NnN1bV0gPSAiYjliZTQyZjUwYWE4NjFjNTU1NjU0YWEzYTM3ZjUyZjRiMTA3
NGJhY2Y0ZTQ4ZmUwZWY3ZmE1ODRlODBmMWYwZiIKK1NSQ19VUklbc21hbGx2ZWMtMS4xNi4xLnNo
YTI1NnN1bV0gPSAiYmE0NjcwNTZmMWI1NDdlZDUyMDc3OTExMTYxZmM4Njk4NWJlY2JjNjBlOGUx
ODU3YzhhMTQ0ZGFiMGRlZjg5MSIKIFNSQ19VUklbc21hd2stMC4zLjIuc2hhMjU2c3VtXSA9ICJi
N2MzODhjMWI1ZTkzNzU2ZDBjNzQwOTY1YzQxZTg4MjJmODY2NjIxZDQxYWNiZGY2MzM2YTZhMTY4
Zjg4NDBjIgogU1JDX1VSSVtzb2NrZXQyLTAuNi4zLnNoYTI1NnN1bV0gPSAiM2E3NjZlMTExMDc4
OGMzNmY0ZmExYzJiNzFiMzg3YTc4MTVhYTY1Zjg4Y2UwMjI5ODQxODI2NjMzZDkzNzIzZSIKIFNS
Q19VUklbc3BkeC0wLjEzLjUuc2hhMjU2c3VtXSA9ICIwODE2NzBjMjMzZGZiZWQ1NTY5MGNjMGNk
Mzg0MjRlMGUyNGFjMWIyNjczZDBiNDA4YjNmN2I2ODQ3MzhkZmE5IgpAQCAtNTEwLDE0ICs0OTUs
MTQgQEAgU1JDX1VSSVtzdGFibGVfZGVyZWZfdHJhaXQtMS4yLjEuc2hhMjU2c3VtXSA9ICI2Y2Uy
YmU4ZGMyNTQ1NWUxZjkxZGY3MWJmYTEyYWQzN2QKIFNSQ19VUklbc3RyaXAtYW5zaS1lc2NhcGVz
LTAuMi4xLnNoYTI1NnN1bV0gPSAiMmE4ZjgwMzhlN2U3OTY5YWJiM2YxYjdjMmE4MTEyMjVlOTI5
NmRhMjA4NTM5ZTBmNzljNTI1MWQ2Y2FjMDAyNSIKIFNSQ19VUklbc3Ryc2ltLTAuMTEuMS5zaGEy
NTZzdW1dID0gIjdkYThiNTczNjg0NWQ5ZjJmY2I4MzdlYTVkOWUyNjI4NTY0YjNiMDQzYTcwOTQ4
YTNmMGI3Nzg4MzhjNWZiNGYiCiBTUkNfVVJJW3N5bi0yLjAuMTE4LnNoYTI1NnN1bV0gPSAiMWI5
YWU1N2Y5MDQyMTNlYmI2NDljZTY4OTViOGE2NmM2NmYwMjAzYjkzMTk3MThmNjlhNTYxMmEwNjVi
MTQyMiIKLVNSQ19VUklbc3luLTMuMC41LnNoYTI1NnN1bV0gPSAiMTJkZjJlMDExMGY2NWI3NzVm
NzY5YmIxN2VmOTg5MDY3YTFkOTMxYjJlYjgyMmJkNDM0NjYzMWVlYWRhODlmOSIKK1NSQ19VUklb
c3luLTMuMC42LnNoYTI1NnN1bV0gPSAiODU5M2U4ZTcyMTU5ZWQyMjU3ZDA4M2M3YTQ1NGE4NWNi
Zjg1NGYzN2EwOTY2ZDhkNDgzYWZmOGM4YTNlYmNlZSIKIFNSQ19VUklbc3luc3RydWN0dXJlLTAu
MTMuMi5zaGEyNTZzdW1dID0gIjcyOGE3MGYzZGJhZjViYWI3ZjBjNGIxYWM4ZDdhZTVlYTYwYTRi
NTU0OWM4YTU5MTQzNjFjOTkxNDdhNzA5ZDIiCi1TUkNfVVJJW3Rhci1jb2RlYy0wLjAuMTQuc2hh
MjU2c3VtXSA9ICI3ZWE0MmViMTQ0ZDMwZmNiZjMyYzI2ZGZlYTg5NTkxNzViYjgzMzViZmI3YjE4
ZDIwYzZlZDMyZWRlY2YwNTUxIgotU1JDX1VSSVt0YXItZnJhbWluZy0wLjAuMTQuc2hhMjU2c3Vt
XSA9ICI3ODMyMjNhN2E2NTkwYmU0MjI3Y2I4MjFlN2NlODAzNzI1NzU1MTFmNjdjODI0OTIxYWJh
MDc1MmQ4YWQ1NTczIgorU1JDX1VSSVt0YXItY29kZWMtMC4wLjE1LnNoYTI1NnN1bV0gPSAiYjlk
YWQ2MTVlNTBkMTgxYWZlYTRiYWZlYTIzZGFjYjhlMzNlZDUyZGRlMDY1MDM4MTM1NzA2MzRiOTMy
ZDQ2NyIKK1NSQ19VUklbdGFyLWZyYW1pbmctMC4wLjE1LnNoYTI1NnN1bV0gPSAiNTYzZTgxODFi
NDdjOWNkY2NlNTY5ZWFlM2FkNDMxZWVjNzE1NDNkNjI2OWRkNjBjN2JkMjM1MGY3MGJjZDIzMyIK
IFNSQ19VUklbdGVtcC1lbnYtMC4zLjYuc2hhMjU2c3VtXSA9ICI5NjM3NDg1NTA2OGY0NzQwMmMz
MTIxYzZlZWQ4OGQyOWNiMWRlOGYzYWIyNzA5MGUyNzNlNDIwYmRhYmNmMDUwIgogU1JDX1VSSVt0
ZW1wZmlsZS0zLjI3LjAuc2hhMjU2c3VtXSA9ICIzMjQ5N2U5YTRjN2IzODUzMmVmY2RlYmVlZjg3
OTcwN2FhOWY3OTQyOTZhNGYwMjQ0ZjZmNjllOWJjODU3NGJkIgogU1JDX1VSSVt0ZXJtaW5hbF9z
aXplLTAuNC40LnNoYTI1NnN1bV0gPSAiMjMwYTFiODIxY2NiZDc1YjE4NTgyMGExZjFmZjdiMTRk
MjFkYTFlNDQyZTIyYzA4NjNlYTVmMDg3NzFhODg3NCIKLVNSQ19VUklbdGV4dHdyYXAtMC4xNi4y
LnNoYTI1NnN1bV0gPSAiYzEzNTQ3NjE1YTQ0ZGM5YzQ1MmE4YTUzNDYzOGFjZGYwNzEyMGQ0YjY4
NDdjODE3ODcwNWRhMDYzMDZhMzA1NyIKK1NSQ19VUklbdGV4dHdyYXAtMC4xNi40LnNoYTI1NnN1
bV0gPSAiNmVjZmFkNmMzYWJjODBhNTc3ZjJiOTFjMWU0MTJlZTU3ZTdhMDYwZDQzMGI1NTNjMWIw
Yzk0MDk3NGViY2Q0OSIKIFNSQ19VUklbdGhpc2Vycm9yLTIuMC4yMC5zaGEyNTZzdW1dID0gImVj
ODYyMzVmNWZjYzJhNzM2NTAzMTA3NTZkMmFjNWIxMzhhNTc4MGJiYmRmYWUzZWVjY2VjOTkyYzQz
NWJhNGYiCiBTUkNfVVJJW3RoaXNlcnJvci1pbXBsLTIuMC4yMC5zaGEyNTZzdW1dID0gImJjMDRj
ZDNlMTIzNmRkNGE5OGFmY2E0NTY5ZjJkZWIzZjEyMGU1NDIyYTQwMjNiZTJjYjY4M2Y4NDg2Mjky
YWYiCiBTUkNfVVJJW3RocmVhZF9sb2NhbC0xLjEuOS5zaGEyNTZzdW1dID0gImY2MDI0NmE0OTQ0
ZjI0ZjZlMDE4YWExN2NkZWZmYjc4MThiNzYzNTY5NjVkMDNiMDdkNmE5ODg2ZTg5NjIxODUiCkBA
IC01MjcsMTAgKzUxMiwxMCBAQCBTUkNfVVJJW3Rpbnl2ZWNfbWFjcm9zLTAuMS4xLnNoYTI1NnN1
bV0gPSAiMWYzY2NiYWMzMTFmZWEwNWY4NmY2MTkwNGI0NjJiNTVmYjNkZgogU1JDX1VSSVt0b2tp
by0xLjUzLjEuc2hhMjU2c3VtXSA9ICIyMDJjYWVhODcxYjY5NjY4MjUwZDI0MjA3MDg0OWViNDk1
YmUxNzhlZDY5N2EzZTk4YWViY2U1YmM4MWEwYmVkIgogU1JDX1VSSVt0b2tpby1tYWNyb3MtMi43
LjAuc2hhMjU2c3VtXSA9ICIzODVhNmNiNzFhYjlhYjc5MGM1ZmU4ZDY3ZjE2NDVlNmM0NTBhN2Nl
MDA2YTMzZGUwM2RhYTk1NmNmNzBhNDk2IgogU1JDX1VSSVt0b2tpby1zdHJlYW0tMC4xLjE5LnNo
YTI1NnN1bV0gPSAiYTNkMDZmMGIwODJiYTU3YzI2Yjc5NDA3MzcyZTU3Y2YyYTFlMjgxMjRmNzhl
OTQ3OWZlODAzMjJjZjUzNDIwYiIKLVNSQ19VUklbdG9tbC0xLjEuMytzcGVjLTEuMS4wLnNoYTI1
NnN1bV0gPSAiNTNjOTZlY2RmYTk0MWM4ZmM0ZmNhZWQxNGY5OWFkYThlYmVkNTAyZWVmNTMzMDE1
MDk1YTA3ZTMzMDFkNGMzYyIKK1NSQ19VUklbdG9tbC0xLjEuNitzcGVjLTEuMS4wLnNoYTI1NnN1
bV0gPSAiOTIwNjAyNTQzZjA5MTFhYjcxZGExMmM1MGQ1OTcwMWRhNTRjMTk2ZDFhMmJmNWNiNGI3
NTY2N2YxMzdhNDA2YSIKIFNSQ19VUklbdG9tbF9kYXRldGltZS0xLjEuMStzcGVjLTEuMS4wLnNo
YTI1NnN1bV0gPSAiMzE2NWY2NWY2MmUyOGUwMTE1YTAwYjJlYmRkMzdlYjZmM2I2NDE4NTVmOWQ2
MzZkM2NkNDEwMzc2NzE1OWFkNyIKLVNSQ19VUklbdG9tbF9lZGl0LTAuMjUuMTMrc3BlYy0xLjEu
MC5zaGEyNTZzdW1dID0gIjY5NzUzNjdlNGQyZWY3NjZkODZhZjAxZmZhZDE0YjYyMmZlY2M4ZDQz
NTdhOTk4ZmJjNGRlYjZlOWJhY2FmOWIiCi1TUkNfVVJJW3RvbWxfcGFyc2VyLTEuMS4yK3NwZWMt
MS4xLjAuc2hhMjU2c3VtXSA9ICJhMmFiZTliODYxOTM2NTY2MzVkMjQxMWRjNDMwNTAyODJjYTQ4
YWEzMWMyNDUxMjEwZjQyMDI1NTBhZmI3NTI2IgorU1JDX1VSSVt0b21sX2VkaXQtMC4yNS4xNStz
cGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMTM0MGVhOTRhNTg1NjMzMzQ5MmM5MDY0YjAyYzc3OGIx
OTFkZDJjODUzNzc4ZDk2MDlkZWJkY2RmZWEzYTYxNCIKK1NSQ19VUklbdG9tbF9wYXJzZXItMS4x
LjUrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gImJhYTY5M2E4MDMyZDdlMWNhZGE3ZDAwNDFlOTYx
MjZkZjI0MzE3OWZmMDYxNDU2NzgzYWM3ZjEyYmRhNDc0NGMiCiBTUkNfVVJJW3RvbWxfd3JpdGVy
LTEuMS4yK3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICI3ZDU2MzUzYTJhNjY1YWQwZjQxYTQyMTE4
NzE4MGFhYjc0NmM4YzMyNTYyMDYxN2FkODgzYTk5YTFjYmU2NmQyIgogU1JDX1VSSVt0cmFjaW5n
LTAuMS40NC5zaGEyNTZzdW1dID0gIjYzZTcxNjYyZmE0YjJhMmMzYTI2ZjU3MGYwMzdlYjk1YmIx
Zjg1Mzk3ZjNjZDgwNzZjYWVkMmYwMjZhNmQxMDAiCiBTUkNfVVJJW3RyYWNpbmctYXR0cmlidXRl
cy0wLjEuMzEuc2hhMjU2c3VtXSA9ICI3NDkwY2ZhNWVjOTYzNzQ2NTY4NzQwNjUxYWM2NzgxZjcw
MWM5YzVlYTI1N2M1OGUwNTdmM2JhOGNmNjllOGRhIgpAQCAtNTM5LDcgKzUyNCw2IEBAIFNSQ19V
UklbdHJhY2luZy1sb2ctMC4yLjAuc2hhMjU2c3VtXSA9ICJlZTg1NWYxZjQwMGJkMGU1YzAyZDE1
MGFlNWRlMzg0MDAzOWEzZjU0CiBTUkNfVVJJW3RyYWNpbmctc3Vic2NyaWJlci0wLjMuMjMuc2hh
MjU2c3VtXSA9ICJjYjdmNTc4ZTU5NDVmYjI0MjUzODk2NWMyZDBiMDQ0MThkMzhlYzI1Yzc5ZDE2
MGNkMjc5YmYwNzMxYzhkMzE5IgogU1JDX1VSSVt0cmFjaW5nLXRlc3QtMC4yLjYuc2hhMjU2c3Vt
XSA9ICIxOWE0YzQ0OGRiNTE0ZDRmMjRjNWRkYjlmNzNmMmVlNzFiZmIyNGM1MjZjZjBjNTcwYmEx
NDJkMTExOWUwMDUxIgogU1JDX1VSSVt0cmFjaW5nLXRlc3QtbWFjcm8tMC4yLjYuc2hhMjU2c3Vt
XSA9ICJhZDA2ODQ3YjdhZmI2NWM3ODY2YTM2NjY0Yjc1YzQwYjg5NWUzMThjZWE0ZjcxMjk5ZjAx
M2ZiMjI5NjUzMjlkIgotU1JDX1VSSVt0eXBlaWQtMS4wLjMuc2hhMjU2c3VtXSA9ICJiYzdkNjIz
MjU4NjAyMzIwZDVjNTVkMWJjMjI3OTNiNTdkYWZmMGVjN2VmYzI3MGVhN2Q1NWNlMWQ1ZjU0NzFj
IgogU1JDX1VSSVt0eXBlbnVtLTEuMjAuMS5zaGEyNTZzdW1dID0gImI2ZjVlODcwYmU2YzNiMzcx
Yjc3ZmUwZWUwYmFmYjg1OWZhNDk2NGI0NDA0YzI3ZGUxZDM4MDA0M2M0ZGRhMjAiCiBTUkNfVVJJ
W3VjZC10cmllLTAuMS43LnNoYTI1NnN1bV0gPSAiMjg5NmQ5NWMwMmE4MGM2ZDZhNWQ2ZTk1M2Q0
NzlmNWRkZjJkZmRiNmEyNDQ0NDEwMTBlMzczYWMwZmI4ODk3MSIKIFNSQ19VUklbdW5pY29kZS1p
ZGVudC0xLjAuMjQuc2hhMjU2c3VtXSA9ICJlNmU0MzEzY2Q1ZmNkM2RhZDVjYWZhMTc5NzAyZTJi
MjQ0Zjc2MDk5MWY0NTM5N2QxNGQ0ZWJmMzgyNDdkYTc1IgpAQCAtNTQ4LDcgKzUzMiw3IEBAIFNS
Q19VUklbdW5zY2FubnktMC4xLjAuc2hhMjU2c3VtXSA9ICJlOWRmMmFmMDY3YTc5NTNlOWMzODMx
MzIwZjM1YzFjYzA2MDBjMzBkNDRkCiBTUkNfVVJJW3VybC0yLjUuOC5zaGEyNTZzdW1dID0gImZm
NjdhOGE0Mzk3MzczYzNlZjY2MDgxMmFjYWIzMjY4MjIyMDM1MDEwYWI4NjgwZWM0MjE1ZjM4YmEz
ZDBlZWQiCiBTUkNfVVJJW3V0ZjhfaXRlci0xLjAuNC5zaGEyNTZzdW1dID0gImI2YzE0MDYyMGU3
ZmZiYjIyYzJkZWU1OWNhZmU2MDg0YTU5YjVmZmMyN2E4ODU5YTVmMGQ0OTRiNWQ1MmI2YmUiCiBT
UkNfVVJJW3V0ZjhwYXJzZS0wLjIuMi5zaGEyNTZzdW1dID0gIjA2YWJkZTM2MTE2NTdhZGY2NmQz
ODNmMDBiMDkzZDdmYWVjYzdmYTU3MDcxY2NlMjU3ODY2MGM5ZjEwMTA4MjEiCi1TUkNfVVJJW3V1
aWQtMS4yNC4wLnNoYTI1NnN1bV0gPSAiYmYzOTIzYTZmNWM0YzYzODJlMGI2NTNjNDExN2Y0OGQ2
MzFlYTE3ZjM4ZWQ4NmUyYTgyOGU2Zjc0MTJmNTIzOSIKK1NSQ19VUklbdXVpZC0xLjI2LjEuc2hh
MjU2c3VtXSA9ICIyZWY2ZGFjMWU5NjYwMWI0ZmIzYWNjY2NjZmYyMTM5NzQxZmNiNzU3Y2I5YTM2
MDg5YmY1YmU5MWNmYjI4NWNlIgogU1JDX1VSSVt2YWx1YWJsZS0wLjEuMS5zaGEyNTZzdW1dID0g
ImJhNzNlYTljZjE2YTI1ZGYwYzhjYWExNmM1MWFjYjkzN2Q1NzEyYTg0MjlkYjc4YTNlZTI5ZDVk
Y2FjZDNhNjUiCiBTUkNfVVJJW3ZlcnNpb25fY2hlY2stMC45LjUuc2hhMjU2c3VtXSA9ICIwYjky
OGYzM2Q5NzVmYzZhZDlmODZjOGYyODM4NTNhZDI2YmRkNWIxMGI3ZjE1NDJhYTJmYTE1ZTIyODkx
MDVhIgogU1JDX1VSSVt2dGUtMC4xNC4xLnNoYTI1NnN1bV0gPSAiMjMxZmRjZDdlZjMwMzdlODMz
MGQ4ZTE3ZTYxMDExYTJjMjQ0MTI2YWNjMGE5ODJmNDA0MGFjM2Y5ZjBiYzA3NyIKQEAgLTU5Nyw4
ICs1ODEsOCBAQCBTUkNfVVJJW3dpbngtMC4zNi40LnNoYTI1NnN1bV0gPSAiM2YzZmQzNzZmNzE5
NThiODYyZTdhZmIyMGNmZTVhMjI4MzBlMTk2MzQ2MmYzYQogU1JDX1VSSVt3cml0ZWFibGUtMC42
LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBkYjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUw
ZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5IgogU1JDX1VSSVt5b2tlLTAuOC4xLnNoYTI1NnN1bV0g
PSAiNzJkNmU1YzZhZmI4NGQ3Mzk0NGU1Y2VkYjA1MmM0NjgwZDU2NTczMzcyMDE1NTVmOWYyYTE2
Yjc0MDZkNDk1NCIKIFNSQ19VUklbeW9rZS1kZXJpdmUtMC44LjEuc2hhMjU2c3VtXSA9ICJiNjU5
MDUyODc0ZWI2OThlZmU1YjllOGNmMzgyMjA0Njc4YTAwODZlYmY0Njk4MmI3OWQ2Y2EzMTgyOTI3
ZTVkIgotU1JDX1VSSVt6ZXJvY29weS0wLjguNTYuc2hhMjU2c3VtXSA9ICI1NTY3NjRlNTgzYWRi
NDVhOWY4ZDQxM2MyYTE0N2ZhN2U4ZDgyMWU0OGUxMmIxNGZkNTYwYjYwNzk5OGI3NWViIgotU1JD
X1VSSVt6ZXJvY29weS1kZXJpdmUtMC44LjU2LnNoYTI1NnN1bV0gPSAiZjJhYjQyZmMyMDU3NTc3
OWJkMjQwZmFhNDVmOTRhNzQyNTZmNzU1YzBmYTllODlmMGVkZTIwZDkxZDBjZGZjMSIKK1NSQ19V
UklbemVyb2NvcHktMC44LjU3LnNoYTI1NnN1bV0gPSAiZDM1MTAyYTlmMzZkMDg5Y2NhZTllNGM2
ODAyYmMxMThiZTQ0ODdiODBhYWZmYzBhYjRlMGNmNWNlOTJkMjg3MyIKK1NSQ19VUklbemVyb2Nv
cHktZGVyaXZlLTAuOC41Ny5zaGEyNTZzdW1dID0gIjE0NmMwMWY1YWI0NDI1OGRhNDNjZjI3NmM3
NGEyNzYzZGIyZmYzOTY5YzljNjUyYzNmMmRlMDcwNDFkMGIyYmMiCiBTUkNfVVJJW3plcm9mcm9t
LTAuMS42LnNoYTI1NnN1bV0gPSAiNTBjYzQyZTAzMzNlMDU2NjBjMzU4N2YzYmY5ZDA0Nzg2ODhl
MTVkODcwZmFiMzM0NjQ1MWNlN2Y4YzlmYmVhNSIKIFNSQ19VUklbemVyb2Zyb20tZGVyaXZlLTAu
MS42LnNoYTI1NnN1bV0gPSAiZDcxZTVkNmUwNmFiMDkwYzY3YjVlNDQ5OTNlYzE2YjcyZGNiYWFi
YzUyNmRiODgzYTM2MDA1NzY3OGI0ODUwMiIKIFNSQ19VUklbemVyb3RyaWUtMC4yLjMuc2hhMjU2
c3VtXSA9ICIyYTU5YzE3YTU1NjJkNTA3ZTRiNTQ5NjBlODU2OWViZWUzM2JlZTg5MGM3MGFhM2Zl
N2I5N2U4NWE5ZmQ3ODUxIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEzLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTMu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1
aWxkXzAuMTMuNS5iYgppbmRleCAyYWQzOGIyMDU0Li44YjA1Yzc5YTI1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjUu
YmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS1B
UEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1BcGFjaGU7bWQ1PWUyM2Zh
ZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7bWQ1PWVmN2E2MDI3ZGM0YzIzODliOWFmYWQ3
ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQyNjE0ZjI0YTU4ZGNjZDQ4NjVk
NGY4NmRkZDkxZGQwMWZkMGVmYWI0NjMyZTAzMzE4NmE4NDIzYjhhMzUxNSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjOTVhM2QwOTJjYjg4ODBiMzdmMzUwMTNmOWY3MzM5ZjM4NjdiYzQyMmFiZWQz
Njc3NjI1NWYzNGUyMmJjNjJjIgogCiByZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIu
NDcuMQoK

--===============7936438565017800565==--
