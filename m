Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1856.1792823002347145133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aAA8ZwG6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dizy0Be4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a16c9400c0-4211cc1b-465c-49ea-8634-2a5d90d23487-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792823001;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=TyI96/hQ+iHGb/Dm3C2ZkxU+abXQfbHX0vwFjwhzlso=;
	b=aAA8ZwG6BfU0Vvts9kSW89Z+S7EFuvV7byIdY3mJ2mJTOl5GVmbWQ342N1XeJgHQ
	4qf0L2Ml82xAmwXPUThD6JyootXf7z3LXQvhIhaROAgJET92h4e6GkJdtaHbgsfYJjd
	p6quufNWC8lnZKXQ7s0Ye/jYMboj+vgpNvvCBogI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792823001;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=TyI96/hQ+iHGb/Dm3C2ZkxU+abXQfbHX0vwFjwhzlso=;
	b=Dizy0Be4E4NQub2GJrsaTUcWLjaylOBLyJ3wxYPUGcIU8KYEIMg03x8z0/6bBUQV
	p2ky9UxZqk15Bw+cl1wvR314bgL1+8Cfiner9gOlW01SpLJ3gdbOBF+gNLnZJLMaxby
	b5/Wx81PdXRb2+7vB38/Lrdt2rxeuXVdjcEEhFng=
Content-Type: multipart/mixed; boundary="===============0932148917141308034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.63.4 SUCCEEDED
Message-ID: <010101a16c9400c0-4211cc1b-465c-49ea-8634-2a5d90d23487-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248582

--===============0932148917141308034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.63.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.63.3-2.63.4.patch
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
From 0f5181f548f58349c61fa10cb5d84d66160614ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:44:10 +0000
Subject: [PATCH] librsvg: upgrade 2.63.3 -> 2.63.4

Version 2.63.4
==============

librsvg crate version 2.63.3
librsvg-rebind crate version 0.3.0

- #1233 - Handle EXIF orientation in images, and handle the
  image-orientation property.  Note that the only values supported
  for this property are 'from-image' (the default) and 'none'.

  Note that this will change the rendering of SVG documents which
  assume the images with EXIF orientation data are not auto-oriented
  correctly.  In this case, please add the following attribute to the
  corresponding image elemnts:

    style="image-orientation: none;"

  Special thanks to Mark de Does for providing the test files for this
  feature.
---
 meta/recipes-gnome/librsvg/librsvg-crates.inc | 76 +++++++++----------
 ...append-RUSTFLAGS-to-rustc-executable.patch |  2 +-
 ...e-care-of-deprecated-assert_cmd-Comm.patch |  2 +-
 .../{librsvg_2.63.3.bb => librsvg_2.63.4.bb}  |  2 +-
 4 files changed, 41 insertions(+), 41 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.63.3.bb => librsvg_2.63.4.bb} (98%)

diff --git a/meta/recipes-gnome/librsvg/librsvg-crates.inc b/meta/recipes-gnome/librsvg/librsvg-crates.inc
index 8574ab937c..25e76f020f 100644
--- a/meta/recipes-gnome/librsvg/librsvg-crates.inc
+++ b/meta/recipes-gnome/librsvg/librsvg-crates.inc
@@ -40,7 +40,7 @@ SRC_URI += " \
     crate://crates.io/cairo-sys-rs/0.22.9 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/cbc/0.2.1 \
-    crate://crates.io/cc/1.8.0 \
+    crate://crates.io/cc/1.10.0 \
     crate://crates.io/cfg-expr/0.20.10 \
     crate://crates.io/cfg-if/1.0.5 \
     crate://crates.io/cfg_aliases/0.2.2 \
@@ -62,7 +62,7 @@ SRC_URI += " \
     crate://crates.io/core_detect/1.0.0 \
     crate://crates.io/cpubits/0.1.1 \
     crate://crates.io/cpufeatures/0.3.1 \
-    crate://crates.io/crc32fast/1.5.2 \
+    crate://crates.io/crc32fast/1.5.3 \
     crate://crates.io/criterion/0.8.2 \
     crate://crates.io/criterion-plot/0.8.2 \
     crate://crates.io/crossbeam-deque/0.8.8 \
@@ -97,7 +97,7 @@ SRC_URI += " \
     crate://crates.io/fallible_collections/0.4.9 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/fdeflate/0.3.7 \
-    crate://crates.io/find-msvc-tools/0.1.14 \
+    crate://crates.io/find-msvc-tools/0.1.15 \
     crate://crates.io/flate2/1.1.10 \
     crate://crates.io/float-cmp/0.10.0 \
     crate://crates.io/fnv/1.0.7 \
@@ -134,19 +134,19 @@ SRC_URI += " \
     crate://crates.io/hybrid-array/0.4.15 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/2.3.0 \
-    crate://crates.io/icu_locale_core/2.3.0 \
-    crate://crates.io/icu_normalizer/2.3.0 \
-    crate://crates.io/icu_normalizer_data/2.3.0 \
-    crate://crates.io/icu_properties/2.3.0 \
-    crate://crates.io/icu_properties_data/2.3.0 \
-    crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/icu_collections/2.4.0 \
+    crate://crates.io/icu_locale_core/2.4.0 \
+    crate://crates.io/icu_normalizer/2.4.0 \
+    crate://crates.io/icu_normalizer_data/2.4.0 \
+    crate://crates.io/icu_properties/2.4.0 \
+    crate://crates.io/icu_properties_data/2.4.0 \
+    crate://crates.io/icu_provider/2.4.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.2 \
     crate://crates.io/image/0.25.10 \
     crate://crates.io/image-webp/0.2.4 \
     crate://crates.io/indexmap/2.14.2 \
-    crate://crates.io/inout/0.2.4 \
+    crate://crates.io/inout/0.2.5 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.15.0 \
@@ -160,7 +160,7 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.106 \
     crate://crates.io/language-tags/0.3.2 \
     crate://crates.io/lazy_static/1.5.1 \
-    crate://crates.io/libc/0.2.190 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/libfuzzer-sys/0.4.13 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -273,7 +273,7 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/siphasher/1.0.4 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.3 \
+    crate://crates.io/smallvec/1.16.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/string_cache/0.9.0 \
@@ -285,7 +285,7 @@ SRC_URI += " \
     crate://crates.io/syn/3.0.9 \
     crate://crates.io/synstructure/0.14.0 \
     crate://crates.io/system-deps/7.0.8 \
-    crate://crates.io/system-deps/9.0.0 \
+    crate://crates.io/system-deps/9.0.1 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/tendril/0.5.1 \
@@ -295,7 +295,7 @@ SRC_URI += " \
     crate://crates.io/time/0.3.55 \
     crate://crates.io/time-core/0.1.9 \
     crate://crates.io/time-macros/0.2.32 \
-    crate://crates.io/tinystr/0.8.4 \
+    crate://crates.io/tinystr/0.8.5 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.13.3 \
     crate://crates.io/toml/1.1.8+spec-1.1.0 \
@@ -307,7 +307,7 @@ SRC_URI += " \
     crate://crates.io/unarray/0.1.4 \
     crate://crates.io/unicode-bidi/0.3.18 \
     crate://crates.io/unicode-ident/1.0.27 \
-    crate://crates.io/unicode-normalization/0.1.25 \
+    crate://crates.io/unicode-normalization/0.1.26 \
     crate://crates.io/unicode-properties/0.1.4 \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
@@ -341,15 +341,15 @@ SRC_URI += " \
     crate://crates.io/xml5ever/0.39.0 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yeslogic-fontconfig-sys/6.0.1 \
-    crate://crates.io/yoke/0.8.3 \
+    crate://crates.io/yoke/0.8.4 \
     crate://crates.io/yoke-derive/0.8.4 \
     crate://crates.io/zerocopy/0.8.63 \
     crate://crates.io/zerocopy-derive/0.8.63 \
     crate://crates.io/zerofrom/0.1.8 \
     crate://crates.io/zerofrom-derive/0.1.8 \
     crate://crates.io/zerotrie/0.2.5 \
-    crate://crates.io/zerovec/0.11.8 \
-    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zerovec/0.11.9 \
+    crate://crates.io/zerovec-derive/0.11.7 \
     crate://crates.io/zlib-rs/0.6.8 \
     crate://crates.io/zmij/1.0.23 \
     crate://crates.io/zune-core/0.5.3 \
@@ -394,7 +394,7 @@ SRC_URI[cairo-rs-0.22.9.sha256sum] = "df683f1d30b457964673a5541a4603208ef95ab687
 SRC_URI[cairo-sys-rs-0.22.9.sha256sum] = "ee548131103ad8f698c6725669647b9c757b3b66992dd6a026037596417bee21"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
 SRC_URI[cbc-0.2.1.sha256sum] = "ce2dc9ee5f88d11e0beb842c88b33c8a5cf0d1329c4b19494af42b07dbfe8896"
-SRC_URI[cc-1.8.0.sha256sum] = "6651c9ed80effdc7db0ff72512157f901af5e3549e341e24b1dd4887d836d838"
+SRC_URI[cc-1.10.0.sha256sum] = "86e055fa6e3e40ad6187ba25b6855eeb635d5271f8e0f0e1e9a5826b8d75bea0"
 SRC_URI[cfg-expr-0.20.10.sha256sum] = "9ba9e9ec16c447027685b1f897b720e18e9a8afd00bd7332c483537e38086c9f"
 SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
 SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
@@ -416,7 +416,7 @@ SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f28077744574
 SRC_URI[core_detect-1.0.0.sha256sum] = "7f8f80099a98041a3d1622845c271458a2d73e688351bf3cb999266764b81d48"
 SRC_URI[cpubits-0.1.1.sha256sum] = "15b85f9c39137c3a891689859392b1bd49812121d0d61c9caf00d46ed5ce06ae"
 SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
-SRC_URI[crc32fast-1.5.2.sha256sum] = "01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78"
+SRC_URI[crc32fast-1.5.3.sha256sum] = "0ba106e844045ddc02c20768ac4b0b7cb45f2cc2ecbd833ac9f5dacb183c2055"
 SRC_URI[criterion-0.8.2.sha256sum] = "950046b2aa2492f9a536f5f4f9a3de7b9e2476e575e05bd6c333371add4d98f3"
 SRC_URI[criterion-plot-0.8.2.sha256sum] = "d8d80a2f4f5b554395e47b5d8305bc3d27813bacb73493eb1001e8f76dae29ea"
 SRC_URI[crossbeam-deque-0.8.8.sha256sum] = "622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a"
@@ -451,7 +451,7 @@ SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda
 SRC_URI[fallible_collections-0.4.9.sha256sum] = "a88c69768c0a15262df21899142bc6df9b9b823546d4b4b9a7bc2d6c448ec6fd"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[fdeflate-0.3.7.sha256sum] = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
-SRC_URI[find-msvc-tools-0.1.14.sha256sum] = "aedcfb3409746eddb02b9e19ebda1c3394f759a152e48ee875a0844d1b955484"
+SRC_URI[find-msvc-tools-0.1.15.sha256sum] = "1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48"
 SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[float-cmp-0.10.0.sha256sum] = "b09cf3155332e944990140d967ff5eceb70df778b34f77d8075db46e4704e6d8"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
@@ -488,19 +488,19 @@ SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7
 SRC_URI[hybrid-array-0.4.15.sha256sum] = "27f864f10dfb56725ce5ce5472bc52252c8f93a4ab86327122cebf62c5f59a17"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-2.3.0.sha256sum] = "fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513"
-SRC_URI[icu_locale_core-2.3.0.sha256sum] = "d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb"
-SRC_URI[icu_normalizer-2.3.0.sha256sum] = "12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f"
-SRC_URI[icu_normalizer_data-2.3.0.sha256sum] = "1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0"
-SRC_URI[icu_properties-2.3.0.sha256sum] = "7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148"
-SRC_URI[icu_properties_data-2.3.0.sha256sum] = "e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa"
-SRC_URI[icu_provider-2.3.1.sha256sum] = "d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[icu_collections-2.4.0.sha256sum] = "fe090a42a0d3140fed8c63263ed1fecc02422cb2f4bfe55cd8de2de1b8e105dd"
+SRC_URI[icu_locale_core-2.4.0.sha256sum] = "25d29b57c17c6528d0dc4c2141cfa2d08200465acb537a3909c8b9b8a4a984c0"
+SRC_URI[icu_normalizer-2.4.0.sha256sum] = "404a3b8c486f205c87fe7f23ab6894d84a4ad76d6e4671ae1981ba7def87c599"
+SRC_URI[icu_normalizer_data-2.4.0.sha256sum] = "20f0088bfb7441f7a37fa0c9e20cb1e9cba1cac6b9ce8cd2a6dc44294f8e8cbc"
+SRC_URI[icu_properties-2.4.0.sha256sum] = "2ea83d991c56158f7cf898bf86436c1dfe7c07ee82fe88951f2695c9f37a379f"
+SRC_URI[icu_properties_data-2.4.0.sha256sum] = "b98f29af82d02b163fe50161388350e743bb3107cc8e8c2f7314cb505faddfcf"
+SRC_URI[icu_provider-2.4.0.sha256sum] = "413099315636c588ee8f011190b329b971a09a8fae9d157e01dcae8379468514"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.2.sha256sum] = "cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714"
 SRC_URI[image-0.25.10.sha256sum] = "85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104"
 SRC_URI[image-webp-0.2.4.sha256sum] = "525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
-SRC_URI[inout-0.2.4.sha256sum] = "3ce983bb6fb399067d101fbfc9e74174e07e9f29a2bc679efefeb8c645819c3f"
+SRC_URI[inout-0.2.5.sha256sum] = "3b5cf4372d022092674a83b8febf5865f7a573cc0c5baec5e49c879b6a20978f"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
@@ -514,7 +514,7 @@ SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf41
 SRC_URI[js-sys-0.3.106.sha256sum] = "7883d941dae510fb2d978fc3fe018c71c9e2892fd38854de3e8b92c2e5ad9cc5"
 SRC_URI[language-tags-0.3.2.sha256sum] = "d4345964bb142484797b161f473a503a434de77149dd8c7427788c6e13379388"
 SRC_URI[lazy_static-1.5.1.sha256sum] = "20870f649af7073d53e38067b2a84312175d56ea15217e1b15bc83506ec50afb"
-SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[libfuzzer-sys-0.4.13.sha256sum] = "a9fd2f41a1cba099f79a0b6b6c35656cf7c03351a7bae8ff0f28f25270f929d2"
 SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -627,7 +627,7 @@ SRC_URI[simd-adler32-0.3.10.sha256sum] = "3a219298ac11a56ea9a6d2120044824d6f01ae
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[siphasher-1.0.4.sha256sum] = "33f4fe9184a62d842c9ef383018f3306d8ba224fd9d836f56d7288308847c256"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.3.sha256sum] = "5b3dc8af474f516a851ff4bd12db780f948b9250ad37211e4eec0bccea54e01b"
+SRC_URI[smallvec-1.16.4.sha256sum] = "d0d5d4b1981b8bbbb7aed204cae5726d683d5d6ac7e74ec54122ea28f315e7c8"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[string_cache-0.9.0.sha256sum] = "a18596f8c785a729f2819c0f6a7eae6ebeebdfffbfe4214ae6b087f690e31901"
@@ -639,7 +639,7 @@ SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862
 SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[synstructure-0.14.0.sha256sum] = "901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02"
 SRC_URI[system-deps-7.0.8.sha256sum] = "396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7"
-SRC_URI[system-deps-9.0.0.sha256sum] = "8a0dae2cbca1f0ff93795713cfe0a4c02f760e3c0b8ae2ab4ec4045808ff429f"
+SRC_URI[system-deps-9.0.1.sha256sum] = "db551ad38aac61d5e0343e0eeeb0163be3115c4e23b6a025959570ee0c03c67d"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[tendril-0.5.1.sha256sum] = "5fed54709c5b3a53d09bb1c113ea4f5ceafd1e772ddcb0030a82e1d56c087b08"
@@ -649,7 +649,7 @@ SRC_URI[thiserror-impl-2.0.21.sha256sum] = "fe5197923287db20a58125f0bc85c062f7f2
 SRC_URI[time-0.3.55.sha256sum] = "cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134"
 SRC_URI[time-core-0.1.9.sha256sum] = "9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109"
 SRC_URI[time-macros-0.2.32.sha256sum] = "7e689342a48d2ea927c87ea50cabf8594854bf940e9310208848d680d668ed85"
-SRC_URI[tinystr-0.8.4.sha256sum] = "b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643"
+SRC_URI[tinystr-0.8.5.sha256sum] = "abc840c238154d58f9e86b2792261edfde565a17696e1cda1a449de27979801a"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.13.3.sha256sum] = "fd3ca314f692efd6c868f8408f53fe444634a845f96c028b97d35f6a1f79f0ee"
 SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] = "20489e00e4d8741d6be680764cc12e270655e375a20d1011e844a9c3379e678d"
@@ -661,7 +661,7 @@ SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b440
 SRC_URI[unarray-0.1.4.sha256sum] = "eaea85b334db583fe3274d12b4cd1880032beab409c0d774be044d4480ab9a94"
 SRC_URI[unicode-bidi-0.3.18.sha256sum] = "5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5"
 SRC_URI[unicode-ident-1.0.27.sha256sum] = "a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563"
-SRC_URI[unicode-normalization-0.1.25.sha256sum] = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
+SRC_URI[unicode-normalization-0.1.26.sha256sum] = "75cd3fb03d5288b3ba9a1ee103ac7e9cbb59f0b03d64f8ddfcc04dd42758a85d"
 SRC_URI[unicode-properties-0.1.4.sha256sum] = "7df058c713841ad818f1dc5d3fd88063241cc61f49f5fbea4b951e8cf5a8d71d"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
@@ -695,15 +695,15 @@ SRC_URI[writeable-0.6.4.sha256sum] = "3ad82d2a33cdc9674dc7465672f271e096168fcdbe
 SRC_URI[xml5ever-0.39.0.sha256sum] = "5ab627f34ff61b80d756180d556f9c68801d836d271b3b8c094504ceca69d221"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[yeslogic-fontconfig-sys-6.0.1.sha256sum] = "1d8b8abf912b9a29ff112e1671c97c33636903d13a69712037190e6805af4f76"
-SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5"
+SRC_URI[yoke-0.8.4.sha256sum] = "417ef3fcf6c300b7dbd25c85531a746931c02ad536f3cf4786ed1e88223340b3"
 SRC_URI[yoke-derive-0.8.4.sha256sum] = "ec8ebde2db3681e8c9980cc27822030e68752690ddfa9473e739aeb4dbde6d71"
 SRC_URI[zerocopy-0.8.63.sha256sum] = "e5fe1f8f1b06191a00962174c61aa5005e0bb391a6d80d07e24d115c01a92ed8"
 SRC_URI[zerocopy-derive-0.8.63.sha256sum] = "863ad3ac83293fb4d740aedbfdc9240dd8d1a50c1099acd76ce80ce7c7230c7f"
 SRC_URI[zerofrom-0.1.8.sha256sum] = "0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272"
 SRC_URI[zerofrom-derive-0.1.8.sha256sum] = "f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a"
 SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
-SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
-SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
+SRC_URI[zerovec-0.11.9.sha256sum] = "f58a2799cfe9a1670c7ea8edbd52ef8edb93cb37a7f83bf31ba9e35d9dae6a40"
+SRC_URI[zerovec-derive-0.11.7.sha256sum] = "c3743ddbf47738d929cd1ae2e199d40d0162979dfe31aef8ae646d2bf00bf97a"
 SRC_URI[zlib-rs-0.6.8.sha256sum] = "b268e58e7c693d7c271f93ffc4ba3b380412554231c85bf61ca7af91042a4112"
 SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
 SRC_URI[zune-core-0.5.3.sha256sum] = "d56377fd46368984a170bc5aac5567e52ca5da874caa60bea39fcbca78fb658b"
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
index d9a7fbf514..a0a6d09897 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
@@ -1,4 +1,4 @@
-From faa062c4bbd9f3678997a90c85ec4efa05156c07 Mon Sep 17 00:00:00 2001
+From 31483d73f4a46f18bb18b149532d89c3b9a7ad11 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Sat, 2 Aug 2025 20:57:49 +0200
 Subject: [PATCH] query-rustc: append RUSTFLAGS to rustc executable
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
index 35ae9a7cd2..22e0f6c103 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
@@ -1,4 +1,4 @@
-From 5fca1f7d88ce817cb532e6b7e7168d3beb1a86f4 Mon Sep 17 00:00:00 2001
+From fe9e7305af55f4f24fa026cb7d4c3925ab6a75d9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 18:43:20 +0100
 Subject: [PATCH] tests: revert 'Take care of deprecated
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.63.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
similarity index 98%
rename from meta/recipes-gnome/librsvg/librsvg_2.63.3.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
index cdf386ad7a..6e88270075 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.63.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
@@ -26,7 +26,7 @@ require ${BPN}-crates.inc
 SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch \
             file://run-ptest"
-SRC_URI[archive.sha256sum] = "55311c2293612e4a2e38cd9bdb6160a1c85c158adc7c97e423e1e65949afb6a4"
+SRC_URI[archive.sha256sum] = "31f07d9350dad3f8964fd613c31309ac160fdef13dfac59df6fd082de78d6e8f"
 
 UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============0932148917141308034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librsvg: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.63/librsvg-2.63.3.tar.xz;name=archive crate://crates.io/adler2/2.0.1 crate://crates.io/aes/0.9.3 crate://crates.io/ahash/0.8.12 crate://crates.io/aho-corasick/1.1.5 crate://crates.io/alloca/0.4.0 crate://crates.io/android_system_properties/0.1.6 crate://crates.io/anes/0.1.6 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/approx/0.5.1 crate://crates.io/arbitrary/1.5.0 crate://crates.io/assert_cmd/2.2.2 crate://crates.io/autocfg/1.5.1 crate://crates.io/av-data/0.4.4 crate://crates.io/bit-set/0.11.1 crate://crates.io/bit-vec/0.10.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/bitreader/0.3.11 crate://crates.io/block/0.1.6 crate://crates.io/block-buffer/0.12.1 crate://crates.io/block-padding/0.
 4.2 crate://crates.io/borsh/1.8.1 crate://crates.io/borsh-derive/1.8.1 crate://crates.io/bstr/1.13.1 crate://crates.io/bumpalo/3.20.3 crate://crates.io/byte-slice-cast/1.2.3 crate://crates.io/bytemuck/1.25.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.12.1 crate://crates.io/cairo-rs/0.22.9 crate://crates.io/cairo-sys-rs/0.22.9 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.2.1 crate://crates.io/cc/1.8.0 crate://crates.io/cfg-expr/0.20.10 crate://crates.io/cfg-if/1.0.5 crate://crates.io/cfg_aliases/0.2.2 crate://crates.io/chacha20/0.10.2 crate://crates.io/chrono/0.4.45 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.5.2 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_complete/4.6.11 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.1 crate://crates.io/color_quant/1.1.0 crate://crates.
 io/colorchoice/1.0.5 crate://crates.io/const-oid/0.10.2 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/core_detect/1.0.0 crate://crates.io/cpubits/0.1.1 crate://crates.io/cpufeatures/0.3.1 crate://crates.io/crc32fast/1.5.2 crate://crates.io/criterion/0.8.2 crate://crates.io/criterion-plot/0.8.2 crate://crates.io/crossbeam-deque/0.8.8 crate://crates.io/crossbeam-epoch/0.9.21 crate://crates.io/crossbeam-utils/0.8.23 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.2.2 crate://crates.io/cssparser/0.37.0 crate://crates.io/cssparser-color/0.5.0 crate://crates.io/cssparser-macros/0.7.1 crate://crates.io/data-url/0.3.2 crate://crates.io/dav1d/0.11.1 crate://crates.io/dav1d-sys/0.8.3 crate://crates.io/defmt/1.2.0 crate://crates.io/defmt-macros/1.2.0 crate://crates.io/defmt-parser/1.1.0 crate://crates.io/deranged/0.5.9 crate://crates.io/derive_more/2.1.1 crate://crates.io/derive_more-impl/2.1.1 crate://crates.io/diff/0.1.13 crate://crates.io/difflib/0.4.0 crat
 e://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.7 crate://crates.io/dlib/0.5.3 crate://crates.io/dtoa/1.0.11 crate://crates.io/dtoa-short/0.3.5 crate://crates.io/ecb/0.2.1 crate://crates.io/either/1.19.0 crate://crates.io/encoding_rs/0.8.42 crate://crates.io/equivalent/1.0.3 crate://crates.io/errno/0.3.14 crate://crates.io/fallible_collections/0.4.9 crate://crates.io/fastrand/2.5.0 crate://crates.io/fdeflate/0.3.7 crate://crates.io/find-msvc-tools/0.1.14 crate://crates.io/flate2/1.1.10 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fnv/1.0.7 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/gdk-pixbuf/0.22.0 crate://crates.io/gdk-pixbuf-sys/0.22.9 crate://crates.io/getrandom/0.4.3 crate://
 crates.io/gif/0.14.2 crate://crates.io/gio/0.22.10 crate://crates.io/gio-sys/0.22.9 crate://crates.io/gio-unix/0.22.8 crate://crates.io/gio-unix-sys/0.22.9 crate://crates.io/gio-win32/0.22.8 crate://crates.io/gio-win32-sys/0.22.9 crate://crates.io/glam/0.30.10 crate://crates.io/glam/0.31.1 crate://crates.io/glam/0.32.1 crate://crates.io/glam/0.33.12 crate://crates.io/glib/0.22.10 crate://crates.io/glib-macros/0.22.9 crate://crates.io/glib-sys/0.22.9 crate://crates.io/gobject-sys/0.22.9 crate://crates.io/half/2.7.1 crate://crates.io/hashbrown/0.13.2 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hybrid-array/0.4.15 crate://crates.io/iana-time-zone/0.1.65 crate://crates.io/iana-time-zone-haiku/0.1.2 crate://crates.io/icu_collections/2.3.0 crate://crates.io/icu_locale_core/2.3.0 crate://crates.io/icu_normalizer/2.3.0 crate://crates.io/icu_normalizer_data/2.3.0 crate://crates.io/icu_properties/2.3.0 crate://crates.io/icu_properties_data/2.3.0 crate://c
 rates.io/icu_provider/2.3.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.2 crate://crates.io/image/0.25.10 crate://crates.io/image-webp/0.2.4 crate://crates.io/indexmap/2.14.2 crate://crates.io/inout/0.2.4 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.15.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.1 crate://crates.io/jiff-static/0.2.38 crate://crates.io/jiff-tzdb/0.1.9 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.106 crate://crates.io/language-tags/0.3.2 crate://crates.io/lazy_static/1.5.1 crate://crates.io/libc/0.2.190 crate://crates.io/libfuzzer-sys/0.4.13 crate://crates.io/libloading/0.8.9 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.3 crate://crates.io/locale_config/0.3.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.34 crate://crates.io/lopdf/0.44.
 0 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/markup5ever/0.39.0 crate://crates.io/matches/0.1.10 crate://crates.io/matrixmultiply/0.3.11 crate://crates.io/md-5/0.11.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/moxcms/0.8.1 crate://crates.io/mp4parse/0.17.0 crate://crates.io/multiversion_no_op/1.0.0 crate://crates.io/mutants/0.0.4 crate://crates.io/nalgebra/0.35.0 crate://crates.io/nalgebra-macros/0.3.0 crate://crates.io/new_debug_unreachable/1.0.6 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/num-bigint/0.4.8 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.2.2 crate://crates.io/num-derive/0.4.2 crate://crates.io/num-integer/0.1.47 crate://crates.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.19 crate://crates.io/objc/0.2.7 crate://crates.io/objc-foundation/0.1.1 crate://crates.io/objc_id/0.1.1 crate://crates.io/once_cell/1.21
 .4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/oorandom/11.1.5 crate://crates.io/page_size/0.6.0 crate://crates.io/pango/0.22.9 crate://crates.io/pango-sys/0.22.9 crate://crates.io/pangocairo/0.22.9 crate://crates.io/pangocairo-sys/0.22.9 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.13.1 crate://crates.io/phf_codegen/0.13.1 crate://crates.io/phf_generator/0.13.1 crate://crates.io/phf_macros/0.13.1 crate://crates.io/phf_shared/0.13.1 crate://crates.io/phf_shared/0.14.0 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.34 crate://crates.io/plotters/0.3.7 crate://crates.io/plotters-backend/0.3.7 crate://crates.io/plotters-svg/0.3.7 crate://crates.io/png/0.18.1 crate://crates.io/portable-atomic/1.15.0 crate://crates.io/portable-atomic-util/0.2.8 crate://crates.io/potential_utf/0.1.6 crate://crates.io/powerfmt/0.2.1 crate://crates.io/precomputed-ha
 sh/0.1.1 crate://crates.io/predicates/3.1.4 crate://crates.io/predicates-core/1.0.10 crate://crates.io/predicates-tree/1.0.13 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/proptest/1.12.0 crate://crates.io/pxfm/0.1.30 crate://crates.io/quick-error/1.2.3 crate://crates.io/quick-error/2.0.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.10.3 crate://crates.io/rand_core/0.10.1 crate://crates.io/rand_xorshift/0.5.0 crate://crates.io/rangemap/1.8.0 crate://crates.io/rawpointer/0.2.1 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/rctree/0.6.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rgb/0.8.53 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustix/1.1.5 cra
 te://crates.io/rustversion/1.0.23 crate://crates.io/rusty-fork/0.3.1 crate://crates.io/safe_arch/1.2.0 crate://crates.io/same-file/1.0.6 crate://crates.io/scopeguard/1.2.0 crate://crates.io/selectors/0.40.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_json/1.0.154 crate://crates.io/serde_spanned/1.1.2 crate://crates.io/servo_arc/0.4.3 crate://crates.io/sha2/0.11.1 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/2.0.1 crate://crates.io/simba/0.10.2 crate://crates.io/simd-adler32/0.3.10 crate://crates.io/simdutf8/0.1.5 crate://crates.io/siphasher/1.0.4 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.3 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/static_assertions/1.1.0 crate://crates.io/string_cache/0.9.0 crate://crates.io/string_cache/0.10.0 crate://crates.io/string_cache_codegen/0.6.1 crate://crates.io/stringprep/0.1.5 crate
 ://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.119 crate://crates.io/syn/3.0.9 crate://crates.io/synstructure/0.14.0 crate://crates.io/system-deps/7.0.8 crate://crates.io/system-deps/9.0.0 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/tendril/0.5.1 crate://crates.io/termtree/0.5.1 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/time/0.3.55 crate://crates.io/time-core/0.1.9 crate://crates.io/time-macros/0.2.32 crate://crates.io/tinystr/0.8.4 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.13.3 crate://crates.io/toml/1.1.8+spec-1.1.0 crate://crates.io/toml_datetime/1.1.2+spec-1.1.0 crate://crates.io/toml_edit/0.25.17+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+spec-1.1.0 crate://crates.io/typenum/1.20.1 crate://crates.io/unarray/0.1.4 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.27 crate://crate
 s.io/unicode-normalization/0.1.25 crate://crates.io/unicode-properties/0.1.4 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/version-compare/0.2.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasm-bindgen/0.2.129 crate://crates.io/wasm-bindgen-macro/0.2.129 crate://crates.io/wasm-bindgen-macro-support/0.2.129 crate://crates.io/wasm-bindgen-shared/0.2.129 crate://crates.io/web-sys/0.3.106 crate://crates.io/web_atoms/0.2.6 crate://crates.io/weezl/0.1.12 crate://crates.io/weezl/0.2.1 crate://crates.io/wide/1.7.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 cra
 te://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.61.2 crate://crates.io/winnow/1.0.4 crate://crates.io/writeable/0.6.4 crate://crates.io/xml5ever/0.39.0 crate://crates.io/yansi/1.0.1 crate://crates.io/yeslogic-fontconfig-sys/6.0.1 crate://crates.io/yoke/0.8.3 crate://crates.io/yoke-derive/0.8.4 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.8 crate://crates.io/zerofrom-derive/0.1.8 crate://crates.io/zerotrie/0.2.5 crate://crates.io/zerovec/0.11.8 crate://crates.io/zerovec-derive/0.11.6 crate://crates.io/zlib-rs/0.6.8 crate://crates.io/zmij/1.0.23 crate://crates.io/zune-core/0.5.3 crate://crates.io/zune-jpeg/0.5.15 file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch file://run-ptest" to "https://download.gnome.org/sources//librsvg/2.63/librsvg-2.63.4.tar.xz;name=archive crate://crate
 s.io/adler2/2.0.1 crate://crates.io/aes/0.9.3 crate://crates.io/ahash/0.8.12 crate://crates.io/aho-corasick/1.1.5 crate://crates.io/alloca/0.4.0 crate://crates.io/android_system_properties/0.1.6 crate://crates.io/anes/0.1.6 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/approx/0.5.1 crate://crates.io/arbitrary/1.5.0 crate://crates.io/assert_cmd/2.2.2 crate://crates.io/autocfg/1.5.1 crate://crates.io/av-data/0.4.4 crate://crates.io/bit-set/0.11.1 crate://crates.io/bit-vec/0.10.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/bitreader/0.3.11 crate://crates.io/block/0.1.6 crate://crates.io/block-buffer/0.12.1 crate://crates.io/block-padding/0.4.2 crate://crates.io/borsh/1.8.1 crate://crates.io/borsh-derive/1.8.1 crate://crates.io/bstr/1.13.1 crate://crates.io/bumpalo/3.20.3 crate://crates.io/byte-
 slice-cast/1.2.3 crate://crates.io/bytemuck/1.25.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.12.1 crate://crates.io/cairo-rs/0.22.9 crate://crates.io/cairo-sys-rs/0.22.9 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.2.1 crate://crates.io/cc/1.10.0 crate://crates.io/cfg-expr/0.20.10 crate://crates.io/cfg-if/1.0.5 crate://crates.io/cfg_aliases/0.2.2 crate://crates.io/chacha20/0.10.2 crate://crates.io/chrono/0.4.45 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.5.2 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_complete/4.6.11 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.1 crate://crates.io/color_quant/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/const-oid/0.10.2 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/core_detect/1.0.0 crate://crates.io/cp
 ubits/0.1.1 crate://crates.io/cpufeatures/0.3.1 crate://crates.io/crc32fast/1.5.3 crate://crates.io/criterion/0.8.2 crate://crates.io/criterion-plot/0.8.2 crate://crates.io/crossbeam-deque/0.8.8 crate://crates.io/crossbeam-epoch/0.9.21 crate://crates.io/crossbeam-utils/0.8.23 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.2.2 crate://crates.io/cssparser/0.37.0 crate://crates.io/cssparser-color/0.5.0 crate://crates.io/cssparser-macros/0.7.1 crate://crates.io/data-url/0.3.2 crate://crates.io/dav1d/0.11.1 crate://crates.io/dav1d-sys/0.8.3 crate://crates.io/defmt/1.2.0 crate://crates.io/defmt-macros/1.2.0 crate://crates.io/defmt-parser/1.1.0 crate://crates.io/deranged/0.5.9 crate://crates.io/derive_more/2.1.1 crate://crates.io/derive_more-impl/2.1.1 crate://crates.io/diff/0.1.13 crate://crates.io/difflib/0.4.0 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.7 crate://crates.io/dlib/0.5.3 crate://crates.io/dtoa/1.0.11 crate://crates.io/dtoa-short/0.3.5
  crate://crates.io/ecb/0.2.1 crate://crates.io/either/1.19.0 crate://crates.io/encoding_rs/0.8.42 crate://crates.io/equivalent/1.0.3 crate://crates.io/errno/0.3.14 crate://crates.io/fallible_collections/0.4.9 crate://crates.io/fastrand/2.5.0 crate://crates.io/fdeflate/0.3.7 crate://crates.io/find-msvc-tools/0.1.15 crate://crates.io/flate2/1.1.10 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fnv/1.0.7 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/gdk-pixbuf/0.22.0 crate://crates.io/gdk-pixbuf-sys/0.22.9 crate://crates.io/getrandom/0.4.3 crate://crates.io/gif/0.14.2 crate://crates.io/gio/0.22.10 crate://crates.io/gio-sys/0.22.9 crate://crates.io/gio-unix/0.22.8 crate://crates.io/gio-unix-sys/0.22.9 
 crate://crates.io/gio-win32/0.22.8 crate://crates.io/gio-win32-sys/0.22.9 crate://crates.io/glam/0.30.10 crate://crates.io/glam/0.31.1 crate://crates.io/glam/0.32.1 crate://crates.io/glam/0.33.12 crate://crates.io/glib/0.22.10 crate://crates.io/glib-macros/0.22.9 crate://crates.io/glib-sys/0.22.9 crate://crates.io/gobject-sys/0.22.9 crate://crates.io/half/2.7.1 crate://crates.io/hashbrown/0.13.2 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hybrid-array/0.4.15 crate://crates.io/iana-time-zone/0.1.65 crate://crates.io/iana-time-zone-haiku/0.1.2 crate://crates.io/icu_collections/2.4.0 crate://crates.io/icu_locale_core/2.4.0 crate://crates.io/icu_normalizer/2.4.0 crate://crates.io/icu_normalizer_data/2.4.0 crate://crates.io/icu_properties/2.4.0 crate://crates.io/icu_properties_data/2.4.0 crate://crates.io/icu_provider/2.4.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.2 crate://crates.io/image/0.25.10 crate://crates.io/image-webp/0
 .2.4 crate://crates.io/indexmap/2.14.2 crate://crates.io/inout/0.2.5 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.15.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.1 crate://crates.io/jiff-static/0.2.38 crate://crates.io/jiff-tzdb/0.1.9 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.106 crate://crates.io/language-tags/0.3.2 crate://crates.io/lazy_static/1.5.1 crate://crates.io/libc/0.2.191 crate://crates.io/libfuzzer-sys/0.4.13 crate://crates.io/libloading/0.8.9 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.3 crate://crates.io/locale_config/0.3.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.34 crate://crates.io/lopdf/0.44.0 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/markup5ever/0.39.0 crate://crates.io/matches/0.1.10 crate://crates.io/matrixmultiply/0.3.11 crate://c
 rates.io/md-5/0.11.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/moxcms/0.8.1 crate://crates.io/mp4parse/0.17.0 crate://crates.io/multiversion_no_op/1.0.0 crate://crates.io/mutants/0.0.4 crate://crates.io/nalgebra/0.35.0 crate://crates.io/nalgebra-macros/0.3.0 crate://crates.io/new_debug_unreachable/1.0.6 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/num-bigint/0.4.8 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.2.2 crate://crates.io/num-derive/0.4.2 crate://crates.io/num-integer/0.1.47 crate://crates.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.19 crate://crates.io/objc/0.2.7 crate://crates.io/objc-foundation/0.1.1 crate://crates.io/objc_id/0.1.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/oorandom/11.1.5 crate://crates.io/page_size/0.6.0 crate://crates.io/pango/0.22.9 crate://cr
 ates.io/pango-sys/0.22.9 crate://crates.io/pangocairo/0.22.9 crate://crates.io/pangocairo-sys/0.22.9 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.13.1 crate://crates.io/phf_codegen/0.13.1 crate://crates.io/phf_generator/0.13.1 crate://crates.io/phf_macros/0.13.1 crate://crates.io/phf_shared/0.13.1 crate://crates.io/phf_shared/0.14.0 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.34 crate://crates.io/plotters/0.3.7 crate://crates.io/plotters-backend/0.3.7 crate://crates.io/plotters-svg/0.3.7 crate://crates.io/png/0.18.1 crate://crates.io/portable-atomic/1.15.0 crate://crates.io/portable-atomic-util/0.2.8 crate://crates.io/potential_utf/0.1.6 crate://crates.io/powerfmt/0.2.1 crate://crates.io/precomputed-hash/0.1.1 crate://crates.io/predicates/3.1.4 crate://crates.io/predicates-core/1.0.10 crate://crates.io/predicates-tree/1.0.13 crate://crates.io/pretty_asser
 tions/1.4.1 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/proptest/1.12.0 crate://crates.io/pxfm/0.1.30 crate://crates.io/quick-error/1.2.3 crate://crates.io/quick-error/2.0.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.10.3 crate://crates.io/rand_core/0.10.1 crate://crates.io/rand_xorshift/0.5.0 crate://crates.io/rangemap/1.8.0 crate://crates.io/rawpointer/0.2.1 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/rctree/0.6.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rgb/0.8.53 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustix/1.1.5 crate://crates.io/rustversion/1.0.23 crate://crates.io/rusty-fork/0.3.1 crate://crates.io/safe_arch/1.2.0 crate://crates.io/same-file/1.0.6 crate://crates.io/s
 copeguard/1.2.0 crate://crates.io/selectors/0.40.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_json/1.0.154 crate://crates.io/serde_spanned/1.1.2 crate://crates.io/servo_arc/0.4.3 crate://crates.io/sha2/0.11.1 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/2.0.1 crate://crates.io/simba/0.10.2 crate://crates.io/simd-adler32/0.3.10 crate://crates.io/simdutf8/0.1.5 crate://crates.io/siphasher/1.0.4 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/static_assertions/1.1.0 crate://crates.io/string_cache/0.9.0 crate://crates.io/string_cache/0.10.0 crate://crates.io/string_cache_codegen/0.6.1 crate://crates.io/stringprep/0.1.5 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.119 crate://crates.io/syn/3.0.9 crate://crates.io/synstructure/0.14.0 crate://crates.io/system-deps/7.0
 .8 crate://crates.io/system-deps/9.0.1 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/tendril/0.5.1 crate://crates.io/termtree/0.5.1 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/time/0.3.55 crate://crates.io/time-core/0.1.9 crate://crates.io/time-macros/0.2.32 crate://crates.io/tinystr/0.8.5 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.13.3 crate://crates.io/toml/1.1.8+spec-1.1.0 crate://crates.io/toml_datetime/1.1.2+spec-1.1.0 crate://crates.io/toml_edit/0.25.17+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+spec-1.1.0 crate://crates.io/typenum/1.20.1 crate://crates.io/unarray/0.1.4 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.27 crate://crates.io/unicode-normalization/0.1.26 crate://crates.io/unicode-properties/0.1.4 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io
 /utf8parse/0.2.2 crate://crates.io/version-compare/0.2.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasm-bindgen/0.2.129 crate://crates.io/wasm-bindgen-macro/0.2.129 crate://crates.io/wasm-bindgen-macro-support/0.2.129 crate://crates.io/wasm-bindgen-shared/0.2.129 crate://crates.io/web-sys/0.3.106 crate://crates.io/web_atoms/0.2.6 crate://crates.io/weezl/0.1.12 crate://crates.io/weezl/0.2.1 crate://crates.io/wide/1.7.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.61.2 crate://crates.io/winnow/1.0.4 crate://crat
 es.io/writeable/0.6.4 crate://crates.io/xml5ever/0.39.0 crate://crates.io/yansi/1.0.1 crate://crates.io/yeslogic-fontconfig-sys/6.0.1 crate://crates.io/yoke/0.8.4 crate://crates.io/yoke-derive/0.8.4 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.8 crate://crates.io/zerofrom-derive/0.1.8 crate://crates.io/zerotrie/0.2.5 crate://crates.io/zerovec/0.11.9 crate://crates.io/zerovec-derive/0.11.7 crate://crates.io/zlib-rs/0.6.8 crate://crates.io/zmij/1.0.23 crate://crates.io/zune-core/0.5.3 crate://crates.io/zune-jpeg/0.5.15 file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch file://run-ptest"
packages/x86-64-v3-poky-linux/librsvg: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: FILELIST: removed "/usr/lib/librsvg/ptest/.debug/rsvg-7696e2d64927f503 /usr/lib/librsvg/ptest/.debug/rsvg_convert-b43cca1a9cc4a434 /usr/lib/librsvg/ptest/.debug/intrinsic_dimensions-8847940f49d4d4d1 /usr/lib/librsvg/ptest/.debug/shapes-523a056828c7532b /usr/lib/librsvg/ptest/.debug/text-3364e73fc27d20f1 /usr/lib/librsvg/ptest/.debug/loading_disallowed-0e55ddd4e471b088 /usr/lib/librsvg/ptest/.debug/primitives-63276127cd7e42d5 /usr/lib/librsvg/ptest/.debug/primitive_geometries-7913b73195a3505c /usr/lib/librsvg/ptest/.debug/rsvg_convert-ee48ad974bfc6603 /usr/lib/librsvg/ptest/.debug/rsvg_convert-a16f48cfd6475cb7 /usr/lib/librsvg/ptest/.debug/errors-64a57bdd3160e931 /usr/lib/librsvg/ptest/.debug/render_crash-5cc01229cc2f4396 /usr/lib/librsvg/ptest/.debug/geometries-e9828bd2a4fc03eb /usr/lib/librsvg/ptest/.debug/filters-4d2a55154c57f338 /usr/lib/librsvg/ptest/.debug/api-cfc4bef40c758bac /usr/lib/librsvg/ptest/.debug/reference-a7e1a77545f6
 99d9 /usr/lib/librsvg/ptest/.debug/loading_crash-9361a6df475f980a /usr/lib/.debug/librsvg-2.so.2.63.3 /usr/lib/librsvg/ptest/.debug/bugs-8cf9b6bda3aa4298", added "/usr/lib/librsvg/ptest/.debug/rsvg_convert-ec8b8e2623c8dc07 /usr/lib/librsvg/ptest/.debug/primitives-9ab65435af055ea5 /usr/lib/librsvg/ptest/.debug/loading_disallowed-03bbc849cce7fa7f /usr/lib/librsvg/ptest/.debug/shapes-4888622986219e05 /usr/lib/librsvg/ptest/.debug/rsvg-2c6b1a904f00786c /usr/lib/librsvg/ptest/.debug/filters-3435a6c7a7bfa6e4 /usr/lib/librsvg/ptest/.debug/geometries-f48f03f18485a505 /usr/lib/librsvg/ptest/.debug/bugs-0d83e5bec99816b0 /usr/lib/librsvg/ptest/.debug/errors-b2a9d9851c78b30c /usr/lib/librsvg/ptest/.debug/reference-70e1ffc5666fa18b /usr/lib/librsvg/ptest/.debug/intrinsic_dimensions-6131b8f3f2da4632 /usr/lib/librsvg/ptest/.debug/primitive_geometries-70207cf9abb9d350 /usr/lib/librsvg/ptest/.debug/render_crash-6e5ca0dc8311b25a /usr/lib/librsvg/ptest/.debug/loading_crash-7a18a4df0cc5843f /usr/lib/li
 brsvg/ptest/.debug/api-75ace24344b19474 /usr/lib/.debug/librsvg-2.so.2.63.4 /usr/lib/librsvg/ptest/.debug/rsvg_convert-4ea95c88e256d09f /usr/lib/librsvg/ptest/.debug/rsvg_convert-fd2f8fa4ea5eeb65 /usr/lib/librsvg/ptest/.debug/text-dd5e3933803f4b1f"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 51545696 to 51787704 (+0%)
packages/x86-64-v3-poky-linux/librsvg/librsvg-dev: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-doc: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-gtk: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-locale: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: FILELIST: removed "/usr/lib/librsvg/ptest/reference-a7e1a77545f699d9 /usr/lib/librsvg/ptest/filters-4d2a55154c57f338 /usr/lib/librsvg/ptest/rsvg-7696e2d64927f503 /usr/lib/librsvg/ptest/shapes-523a056828c7532b /usr/lib/librsvg/ptest/primitives-63276127cd7e42d5 /usr/lib/librsvg/ptest/bugs-8cf9b6bda3aa4298 /usr/lib/librsvg/ptest/rsvg_convert-b43cca1a9cc4a434 /usr/lib/librsvg/ptest/api-cfc4bef40c758bac /usr/lib/librsvg/ptest/render_crash-5cc01229cc2f4396 /usr/lib/librsvg/ptest/geometries-e9828bd2a4fc03eb /usr/lib/librsvg/ptest/loading_disallowed-0e55ddd4e471b088 /usr/lib/librsvg/ptest/rsvg_convert-a16f48cfd6475cb7 /usr/lib/librsvg/ptest/loading_crash-9361a6df475f980a /usr/lib/librsvg/ptest/primitive_geometries-7913b73195a3505c /usr/lib/librsvg/ptest/text-3364e73fc27d20f1 /usr/lib/librsvg/ptest/errors-64a57bdd3160e931 /usr/lib/librsvg/ptest/intrinsic_dimensions-8847940f49d4d4d1 /usr/lib/librsvg/ptest/rsvg_convert-ee48ad974bfc6603", adde
 d "/usr/lib/librsvg/ptest/rsvg-2c6b1a904f00786c /usr/lib/librsvg/ptest/bugs-0d83e5bec99816b0 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=8.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=5.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=3.jpg /usr/lib/librsvg/ptest/loading_crash-7a18a4df0cc5843f /usr/lib/librsvg/ptest/filters-3435a6c7a7bfa6e4 /usr/lib/librsvg/ptest/loading_disallowed-03bbc849cce7fa7f /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=7.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=1.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=4.jpg /usr/lib/librsvg/ptest/api-75ace24344b19474 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/bug1233-exif-orientations.svg /usr/lib/librsvg/ptest/geometries-f48f03f18485a505 /usr/lib/librsvg/ptest/text-dd5e3933803f4b1f /usr/lib/librsvg/ptest/rsvg_convert-fd2f8fa4ea5
 eeb65 /usr/lib/librsvg/ptest/primitive_geometries-70207cf9abb9d350 /usr/lib/librsvg/ptest/intrinsic_dimensions-6131b8f3f2da4632 /usr/lib/librsvg/ptest/render_crash-6e5ca0dc8311b25a /usr/lib/librsvg/ptest/primitives-9ab65435af055ea5 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=2.jpg /usr/lib/librsvg/ptest/rsvg_convert-4ea95c88e256d09f /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/bug1233-exif-orientations-ref.png /usr/lib/librsvg/ptest/reference-70e1ffc5666fa18b /usr/lib/librsvg/ptest/errors-b2a9d9851c78b30c /usr/lib/librsvg/ptest/rsvg_convert-ec8b8e2623c8dc07 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=6.jpg /usr/lib/librsvg/ptest/shapes-4888622986219e05"
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PKGSIZE changed from 110732816 to 111335268 (+1%)
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: FILELIST: directory renamed /usr/src/debug/librsvg/2.63.3/include/librsvg -> /usr/src/debug/librsvg/2.63.4/include/librsvg
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg: FILELIST: removed "/usr/lib/librsvg-2.so.2.63.3", added "/usr/lib/librsvg-2.so.2.63.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg: PKGSIZE changed from 5703515 to 5740379 (+1%)
packages/x86-64-v3-poky-linux/librsvg/rsvg: PV changed from "2.63.3" to "2.63.4"
packages/x86-64-v3-poky-linux/librsvg/rsvg: PKGV changed from 2.63.3 [default] to 2.63.4 [default]
packages/x86-64-v3-poky-linux/librsvg/rsvg: PKGSIZE changed from 6358256 to 6403312 (+1%)
Changes to packages/x86-64-v3-poky-linux/librsvg (sysroot):
  /usr/lib/librsvg-2.so.2 changed symlink target from librsvg-2.so.2.63.3 to librsvg-2.so.2.63.4
  /usr/lib/librsvg-2.so.2.63.3 moved to /usr/lib/librsvg-2.so.2.63.4

--===============0932148917141308034==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.63.3-2.63.4.patch"

RnJvbSAwZjUxODFmNTQ4ZjU4MzQ5YzYxZmExMGNiNWQ4NGQ2NjE2MDYxNGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6NDQ6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyc3ZnOiB1cGdyYWRlIDIuNjMuMyAtPiAyLjYzLjQKClZlcnNpb24gMi42My40Cj09PT09PT09
PT09PT09CgpsaWJyc3ZnIGNyYXRlIHZlcnNpb24gMi42My4zCmxpYnJzdmctcmViaW5kIGNyYXRl
IHZlcnNpb24gMC4zLjAKCi0gIzEyMzMgLSBIYW5kbGUgRVhJRiBvcmllbnRhdGlvbiBpbiBpbWFn
ZXMsIGFuZCBoYW5kbGUgdGhlCiAgaW1hZ2Utb3JpZW50YXRpb24gcHJvcGVydHkuICBOb3RlIHRo
YXQgdGhlIG9ubHkgdmFsdWVzIHN1cHBvcnRlZAogIGZvciB0aGlzIHByb3BlcnR5IGFyZSAnZnJv
bS1pbWFnZScgKHRoZSBkZWZhdWx0KSBhbmQgJ25vbmUnLgoKICBOb3RlIHRoYXQgdGhpcyB3aWxs
IGNoYW5nZSB0aGUgcmVuZGVyaW5nIG9mIFNWRyBkb2N1bWVudHMgd2hpY2gKICBhc3N1bWUgdGhl
IGltYWdlcyB3aXRoIEVYSUYgb3JpZW50YXRpb24gZGF0YSBhcmUgbm90IGF1dG8tb3JpZW50ZWQK
ICBjb3JyZWN0bHkuICBJbiB0aGlzIGNhc2UsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyBhdHRy
aWJ1dGUgdG8gdGhlCiAgY29ycmVzcG9uZGluZyBpbWFnZSBlbGVtbnRzOgoKICAgIHN0eWxlPSJp
bWFnZS1vcmllbnRhdGlvbjogbm9uZTsiCgogIFNwZWNpYWwgdGhhbmtzIHRvIE1hcmsgZGUgRG9l
cyBmb3IgcHJvdmlkaW5nIHRoZSB0ZXN0IGZpbGVzIGZvciB0aGlzCiAgZmVhdHVyZS4KLS0tCiBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnLWNyYXRlcy5pbmMgfCA3NiArKysrKysr
KystLS0tLS0tLS0tCiAuLi5hcHBlbmQtUlVTVEZMQUdTLXRvLXJ1c3RjLWV4ZWN1dGFibGUucGF0
Y2ggfCAgMiArLQogLi4uZS1jYXJlLW9mLWRlcHJlY2F0ZWQtYXNzZXJ0X2NtZC1Db21tLnBhdGNo
IHwgIDIgKy0KIC4uLi97bGlicnN2Z18yLjYzLjMuYmIgPT4gbGlicnN2Z18yLjYzLjQuYmJ9ICB8
ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL3tsaWJyc3ZnXzIuNjMuMy5iYiA9
PiBsaWJyc3ZnXzIuNjMuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25v
bWUvbGlicnN2Zy9saWJyc3ZnLWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2
Zy9saWJyc3ZnLWNyYXRlcy5pbmMKaW5kZXggODU3NGFiOTM3Yy4uMjVlNzZmMDIwZiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy1jcmF0ZXMuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmctY3JhdGVzLmluYwpAQCAtNDAsNyAr
NDAsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhaXJvLXN5cy1y
cy8wLjIyLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nhc3QvMC4zLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NiYy8wLjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS44LjAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMTAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2ZnLWV4cHIvMC4yMC4xMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEuMC41
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmdfYWxpYXNlcy8wLjIuMiBcCkBAIC02Miw3ICs2
Miw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29yZV9kZXRlY3Qv
MS4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NwdWJpdHMvMC4xLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMy4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9j
cmMzMmZhc3QvMS41LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYzMyZmFzdC8xLjUuMyBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3JpdGVyaW9uLzAuOC4yIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jcml0ZXJpb24tcGxvdC8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3Jv
c3NiZWFtLWRlcXVlLzAuOC44IFwKQEAgLTk3LDcgKzk3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9mYWxsaWJsZV9jb2xsZWN0aW9ucy8wLjQuOSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZmFzdHJhbmQvMi41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Zk
ZWZsYXRlLzAuMy43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9maW5kLW1zdmMtdG9vbHMvMC4x
LjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9maW5kLW1zdmMtdG9vbHMvMC4xLjE1IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9mbGF0ZTIvMS4xLjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9mbG9hdC1jbXAvMC4xMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mbnYvMS4wLjcgXApA
QCAtMTM0LDE5ICsxMzQsMTkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9oeWJyaWQtYXJyYXkvMC40LjE1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pYW5hLXRpbWUt
em9uZS8wLjEuNjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lhbmEtdGltZS16b25lLWhhaWt1
LzAuMS4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfY29sbGVjdGlvbnMvMi4zLjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9sb2NhbGVfY29yZS8yLjMuMCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaWN1X25vcm1hbGl6ZXIvMi4zLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2ljdV9ub3JtYWxpemVyX2RhdGEvMi4zLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9w
cm9wZXJ0aWVzLzIuMy4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvcGVydGllc19k
YXRhLzIuMy4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvdmlkZXIvMi4zLjEgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9jb2xsZWN0aW9ucy8yLjQuMCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaWN1X2xvY2FsZV9jb3JlLzIuNC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9pY3Vfbm9ybWFsaXplci8yLjQuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X25vcm1h
bGl6ZXJfZGF0YS8yLjQuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X3Byb3BlcnRpZXMv
Mi40LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm9wZXJ0aWVzX2RhdGEvMi40LjAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm92aWRlci8yLjQuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaWRuYS8xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWRuYV9hZGFw
dGVyLzEuMi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbWFnZS8wLjI1LjEwIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pbWFnZS13ZWJwLzAuMi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pbmRleG1hcC8yLjE0LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lub3V0LzAuMi40IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9pbm91dC8wLjIuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vaXNfdGVybWluYWxfcG9seWZpbGwvMS43MC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9p
dGVydG9vbHMvMC4xMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pdGVydG9vbHMvMC4xNS4w
IFwKQEAgLTE2MCw3ICsxNjAsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2pzLXN5cy8wLjMuMTA2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYW5ndWFnZS10YWdz
LzAuMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUuMSBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTkwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9s
aWJjLzAuMi4xOTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmZ1enplci1zeXMvMC40LjEz
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJsb2FkaW5nLzAuOC45IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuMTIuMSBcCkBAIC0yNzMsNyArMjczLDcgQEAgU1JD
X1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1kdXRmOC8wLjEuNSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2lwaGFzaGVyLzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9zbGFiLzAuNC4xMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xNi4zIFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE2LjQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3N0YWJsZV9kZXJlZl90cmFpdC8xLjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c3RhdGljX2Fzc2VydGlvbnMvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cmluZ19j
YWNoZS8wLjkuMCBcCkBAIC0yODUsNyArMjg1LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zeW4vMy4wLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVj
dHVyZS8wLjE0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5c3RlbS1kZXBzLzcuMC44IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9zeXN0ZW0tZGVwcy85LjAuMCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc3lzdGVtLWRlcHMvOS4wLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhcmdl
dC1sZXhpY29uLzAuMTMuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZpbGUvMy4yNy4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZW5kcmlsLzAuNS4xIFwKQEAgLTI5NSw3ICsyOTUs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbWUvMC4zLjU1IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW1lLWNvcmUvMC4xLjkgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RpbWUtbWFjcm9zLzAuMi4zMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXN0
ci8wLjguNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXN0ci8wLjguNSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdGlueXRlbXBsYXRlLzEuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by90aW55dmVjLzEuMTMuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbC8xLjEuOCtzcGVj
LTEuMS4wIFwKQEAgLTMwNyw3ICszMDcsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3VuYXJyYXkvMC4xLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUt
YmlkaS8wLjMuMTggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjI3
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLW5vcm1hbGl6YXRpb24vMC4xLjI1IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLW5vcm1hbGl6YXRpb24vMC4xLjI2IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLXByb3BlcnRpZXMvMC4xLjQgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3VybC8yLjUuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOF9pdGVy
LzEuMC40IFwKQEAgLTM0MSwxNSArMzQxLDE1IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8veG1sNWV2ZXIvMC4zOS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby95YW5z
aS8xLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veWVzbG9naWMtZm9udGNvbmZpZy1zeXMv
Ni4wLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UvMC44LjMgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3lva2UvMC44LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UtZGVyaXZl
LzAuOC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjguNjMgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3plcm9jb3B5LWRlcml2ZS8wLjguNjMgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3plcm9mcm9tLzAuMS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvZnJvbS1k
ZXJpdmUvMC4xLjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm90cmllLzAuMi41IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLzAuMTEuOCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vemVyb3ZlYy1kZXJpdmUvMC4xMS42IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVj
LzAuMTEuOSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb3ZlYy1kZXJpdmUvMC4xMS43IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby96bGliLXJzLzAuNi44IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby96bWlqLzEuMC4yMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8venVuZS1jb3JlLzAuNS4z
IFwKQEAgLTM5NCw3ICszOTQsNyBAQCBTUkNfVVJJW2NhaXJvLXJzLTAuMjIuOS5zaGEyNTZzdW1d
ID0gImRmNjgzZjFkMzBiNDU3OTY0NjczYTU1NDFhNDYwMzIwOGVmOTVhYjY4NwogU1JDX1VSSVtj
YWlyby1zeXMtcnMtMC4yMi45LnNoYTI1NnN1bV0gPSAiZWU1NDgxMzExMDNhZDhmNjk4YzY3MjU2
Njk2NDdiOWM3NTdiM2I2Njk5MmRkNmEwMjYwMzc1OTY0MTdiZWUyMSIKIFNSQ19VUklbY2FzdC0w
LjMuMC5zaGEyNTZzdW1dID0gIjM3YjJhNjcyYTJjYjEyOWEyZTQxYzEwYjEyMjRiYjM2OGY5ZjM3
YTJiMTZiNjEyNTk4MTM4YmVmZDdiMzdlYjUiCiBTUkNfVVJJW2NiYy0wLjIuMS5zaGEyNTZzdW1d
ID0gImNlMmRjOWVlNWY4OGQxMWUwYmViODQyYzg4YjMzYzhhNWNmMGQxMzI5YzRiMTk0OTRhZjQy
YjA3ZGJmZTg4OTYiCi1TUkNfVVJJW2NjLTEuOC4wLnNoYTI1NnN1bV0gPSAiNjY1MWM5ZWQ4MGVm
ZmRjN2RiMGZmNzI1MTIxNTdmOTAxYWY1ZTM1NDllMzQxZTI0YjFkZDQ4ODdkODM2ZDgzOCIKK1NS
Q19VUklbY2MtMS4xMC4wLnNoYTI1NnN1bV0gPSAiODZlMDU1ZmE2ZTNlNDBhZDYxODdiYTI1YjY4
NTVlZWI2MzVkNTI3MWY4ZTBmMGUxZTlhNTgyNmI4ZDc1YmVhMCIKIFNSQ19VUklbY2ZnLWV4cHIt
MC4yMC4xMC5zaGEyNTZzdW1dID0gIjliYTllOWVjMTZjNDQ3MDI3Njg1YjFmODk3YjcyMGUxOGU5
YThhZmQwMGJkNzMzMmM0ODM1MzdlMzgwODZjOWYiCiBTUkNfVVJJW2NmZy1pZi0xLjAuNS5zaGEy
NTZzdW1dID0gIjRlNzY0ODE3NWI0NWE5YTQ4NTM2ZDY3NmY2OGQ5MTgyNzA2OTkxMDJhYThkYWI1
NDk2ZGYwNjkwNGM5MTQ2MDAiCiBTUkNfVVJJW2NmZ19hbGlhc2VzLTAuMi4yLnNoYTI1NnN1bV0g
PSAiZjA3OWU4M2EyODg3ODdiY2QxNGE2YWVhODRjZWU1Yzg3YTY3YzVhM2U2NjBjMzBmNTU3YTNk
MjQ3NjFiMzUyNyIKQEAgLTQxNiw3ICs0MTYsNyBAQCBTUkNfVVJJW2NvcmUtZm91bmRhdGlvbi1z
eXMtMC44Ljcuc2hhMjU2c3VtXSA9ICI3NzM2NDhiOTRkMGU1ZDYyMGY2NGYyODA3Nzc0NDU3NAog
U1JDX1VSSVtjb3JlX2RldGVjdC0xLjAuMC5zaGEyNTZzdW1dID0gIjdmOGY4MDA5OWE5ODA0MWEz
ZDE2MjI4NDVjMjcxNDU4YTJkNzNlNjg4MzUxYmYzY2I5OTkyNjY3NjRiODFkNDgiCiBTUkNfVVJJ
W2NwdWJpdHMtMC4xLjEuc2hhMjU2c3VtXSA9ICIxNWI4NWY5YzM5MTM3YzNhODkxNjg5ODU5Mzky
YjFiZDQ5ODEyMTIxZDBkNjFjOWNhZjAwZDQ2ZWQ1Y2UwNmFlIgogU1JDX1VSSVtjcHVmZWF0dXJl
cy0wLjMuMS5zaGEyNTZzdW1dID0gIjVjYTI4YjBhZTMxMTViODg0NjYwZGI0MTE4ZDgwMzc5MWZk
Njc1NmI2ZTg4ZjM5YzBmM2Y3ODU5MDYwZDc1NjYiCi1TUkNfVVJJW2NyYzMyZmFzdC0xLjUuMi5z
aGEyNTZzdW1dID0gIjAxYTc3OTlmZDZiODUyZGIwZTYxNzI4ZGRlOWEyMDRjNDIzYjQ0ZDY4OWRi
ZDQzMjUyMjU0MzYxNGI0OTBlNzgiCitTUkNfVVJJW2NyYzMyZmFzdC0xLjUuMy5zaGEyNTZzdW1d
ID0gIjBiYTEwNmU4NDQwNDVkZGMwMmMyMDc2OGFjNGIwYjdjYjQ1ZjJjYzJlY2JkODMzYWM5ZjVk
YWNiMTgzYzIwNTUiCiBTUkNfVVJJW2NyaXRlcmlvbi0wLjguMi5zaGEyNTZzdW1dID0gIjk1MDA0
NmIyYWEyNDkyZjlhNTM2ZjVmNGY5YTNkZTdiOWUyNDc2ZTU3NWUwNWJkNmMzMzMzNzFhZGQ0ZDk4
ZjMiCiBTUkNfVVJJW2NyaXRlcmlvbi1wbG90LTAuOC4yLnNoYTI1NnN1bV0gPSAiZDhkODBhMmY0
ZjViNTU0Mzk1ZTQ3YjVkODMwNWJjM2QyNzgxM2JhY2I3MzQ5M2ViMTAwMWU4Zjc2ZGFlMjllYSIK
IFNSQ19VUklbY3Jvc3NiZWFtLWRlcXVlLTAuOC44LnNoYTI1NnN1bV0gPSAiNjIyZjNmYzczNjkw
YmUzODNjNzIxNDMxMDQwNmYyOGE5MGU2ZWRlYWRjM2NlYTg4MmY5ZDcxZTQ5NWI5NzExYSIKQEAg
LTQ1MSw3ICs0NTEsNyBAQCBTUkNfVVJJW2Vycm5vLTAuMy4xNC5zaGEyNTZzdW1dID0gIjM5Y2Fi
NzE2MTdhZTBkNjNmNTFhMzZkNjlmODY2MzkxNzM1YjUxNjkxZGJkYQogU1JDX1VSSVtmYWxsaWJs
ZV9jb2xsZWN0aW9ucy0wLjQuOS5zaGEyNTZzdW1dID0gImE4OGM2OTc2OGMwYTE1MjYyZGYyMTg5
OTE0MmJjNmRmOWI5YjgyMzU0NmQ0YjRiOWE3YmMyZDZjNDQ4ZWM2ZmQiCiBTUkNfVVJJW2Zhc3Ry
YW5kLTIuNS4wLnNoYTI1NnN1bV0gPSAiZGE3YzYyY2VhZTIwN2RkMzdlYTViODQ1ZGE2YTA2OTZj
Nzk5Zjg1ZTk3ZGExYWI1Yjc5MTBiZTNjMWM4MDIyMyIKIFNSQ19VUklbZmRlZmxhdGUtMC4zLjcu
c2hhMjU2c3VtXSA9ICIxZTY4NTNiNTI2NDlkNGFjNWMwYmQwMjMyMGNkZGM1YmE5NTZiZGI0MDdj
NGI3NWEyYzZiNzViZjUxNTAwZjhjIgotU1JDX1VSSVtmaW5kLW1zdmMtdG9vbHMtMC4xLjE0LnNo
YTI1NnN1bV0gPSAiYWVkY2ZiMzQwOTc0NmVkZGIwMmI5ZTE5ZWJkYTFjMzM5NGY3NTlhMTUyZTQ4
ZWU4NzVhMDg0NGQxYjk1NTQ4NCIKK1NSQ19VUklbZmluZC1tc3ZjLXRvb2xzLTAuMS4xNS5zaGEy
NTZzdW1dID0gIjFjNjY5MTVjYzUzOTEwOTdkZTdhMmIwYjk3MmU4NTA1YWEzM2MwZGY0MDFmZDNh
NjgxMWRiZGIzMjg4MWJhNDgiCiBTUkNfVVJJW2ZsYXRlMi0xLjEuMTAuc2hhMjU2c3VtXSA9ICI2
ZTYzNGUyZTBlYmFjMWVlMDM0MDIwZGExY2E1ODJlMTdmZmU0ZTBmNWU5ODU4MjM3MjFlMTY4OTI4
MTM2ZGNiIgogU1JDX1VSSVtmbG9hdC1jbXAtMC4xMC4wLnNoYTI1NnN1bV0gPSAiYjA5Y2YzMTU1
MzMyZTk0NDk5MDE0MGQ5NjdmZjVlY2ViNzBkZjc3OGIzNGY3N2Q4MDc1ZGI0NmU0NzA0ZTZkOCIK
IFNSQ19VUklbZm52LTEuMC43LnNoYTI1NnN1bV0gPSAiM2Y5ZWVjOTE4ZDNmMjQwNjlkZWNiOWFm
MTU1NGNhZDdjODgwZTJkYTI0YTlhZmQ4OGFjYTAwMDUzMWFiODJjMSIKQEAgLTQ4OCwxOSArNDg4
LDE5IEBAIFNSQ19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0gIjIzMDRlMDA5ODNmODdmZmIz
OGI1NWI0NDRiNWUzYjYwYTg4NGI1ZDMwYzBmY2E3CiBTUkNfVVJJW2h5YnJpZC1hcnJheS0wLjQu
MTUuc2hhMjU2c3VtXSA9ICIyN2Y4NjRmMTBkZmI1NjcyNWNlNWNlNTQ3MmJjNTIyNTJjOGY5M2E0
YWI4NjMyNzEyMmNlYmY2MmM1ZjU5YTE3IgogU1JDX1VSSVtpYW5hLXRpbWUtem9uZS0wLjEuNjUu
c2hhMjU2c3VtXSA9ICJlMzFiYzlhZDk5NGJhMDBlNDQwYThhYTVjOWVmMGVjNjdkNWNiNWU1Y2Iw
Y2M3ZjhiNzQ0YTM1YjM4OWNjNDcwIgogU1JDX1VSSVtpYW5hLXRpbWUtem9uZS1oYWlrdS0wLjEu
Mi5zaGEyNTZzdW1dID0gImYzMTgyN2EyMDZmNTZhZjMyZTU5MGJhNTZkNWQyZDA4NWY1NTg1MDgx
OTI1OTM3NDNmMTZiMjMwNjQ5NTI2OWYiCi1TUkNfVVJJW2ljdV9jb2xsZWN0aW9ucy0yLjMuMC5z
aGEyNTZzdW1dID0gImZhNjhkMjEwODFjNGEwNWQ1YTkwMWExYzYyYWRkNTc0Yzc3MDQ4YjZhMWM2
N2JlM2I1MGNlMGI2MGQ0Y2E1MTMiCi1TUkNfVVJJW2ljdV9sb2NhbGVfY29yZS0yLjMuMC5zaGEy
NTZzdW1dID0gImQ1NmUyODU4OGRhOTJlZWU1YzMyMDFhNmVmZjMzZmFiZGQ0OWI2MjI2OWM4OTM4
ZDRmZjA1MGNlNGQ5MDBkZWIiCi1TUkNfVVJJW2ljdV9ub3JtYWxpemVyLTIuMy4wLnNoYTI1NnN1
bV0gPSAiMTJmOWNmNWYyMzU2NDFlZDI3NDY0MWRkODFjM2YyOGQ4NzBlMjc2NzYzZDA3OTdhZWVh
YjcyMzE3YjFjNjQ2ZiIKLVNSQ19VUklbaWN1X25vcm1hbGl6ZXJfZGF0YS0yLjMuMC5zaGEyNTZz
dW1dID0gIjE1NjNkYTFlZDNlMGIzYmYzZDc0YzliODU5MTdhYzljNTY0NjRkMmY1NzI0MjI3MGMw
OWM5ZTc1MmY4MDIxYTAiCi1TUkNfVVJJW2ljdV9wcm9wZXJ0aWVzLTIuMy4wLnNoYTI1NnN1bV0g
PSAiN2U3Y2EyNzZhZDMxNDU2NjFhNjU5MTRlNmRhZjEzMWNhNTEyMGNkM2RjZWU4ZjhmMzIxNGI4
ODc1MTg0YTE0OCIKLVNSQ19VUklbaWN1X3Byb3BlcnRpZXNfZGF0YS0yLjMuMC5zaGEyNTZzdW1d
ID0gImU1OTBmMDM4YzE0NjRhOTY4OTRmZDZkMTAxMjdlOTBhOGJlNDUwOWY1NmZmN2VjZWY4NTFi
MTVjZWUwYjdjYWEiCi1TUkNfVVJJW2ljdV9wcm92aWRlci0yLjMuMS5zaGEyNTZzdW1dID0gImQy
N2JiYjlkM2FiYmVmYWM0NWQ1NWY2NDdjOWRlMWQ0NGFhZmNkMTE4NmViOTE4NzlhZmVmMTdjMzk2
YzNlNzMiCitTUkNfVVJJW2ljdV9jb2xsZWN0aW9ucy0yLjQuMC5zaGEyNTZzdW1dID0gImZlMDkw
YTQyYTBkMzE0MGZlZDhjNjMyNjNlZDFmZWNjMDI0MjJjYjJmNGJmZTU1Y2Q4ZGUyZGUxYjhlMTA1
ZGQiCitTUkNfVVJJW2ljdV9sb2NhbGVfY29yZS0yLjQuMC5zaGEyNTZzdW1dID0gIjI1ZDI5YjU3
YzE3YzY1MjhkMGRjNGMyMTQxY2ZhMmQwODIwMDQ2NWFjYjUzN2EzOTA5YzhiOWI4YTRhOTg0YzAi
CitTUkNfVVJJW2ljdV9ub3JtYWxpemVyLTIuNC4wLnNoYTI1NnN1bV0gPSAiNDA0YTNiOGM0ODZm
MjA1Yzg3ZmU3ZjIzYWI2ODk0ZDg0YTRhZDc2ZDZlNDY3MWFlMTk4MWJhN2RlZjg3YzU5OSIKK1NS
Q19VUklbaWN1X25vcm1hbGl6ZXJfZGF0YS0yLjQuMC5zaGEyNTZzdW1dID0gIjIwZjAwODhiZmI3
NDQxZjdhMzdmYTBjOWUyMGNiMWU5Y2JhMWNhYzZiOWNlOGNkMmE2ZGM0NDI5NGY4ZThjYmMiCitT
UkNfVVJJW2ljdV9wcm9wZXJ0aWVzLTIuNC4wLnNoYTI1NnN1bV0gPSAiMmVhODNkOTkxYzU2MTU4
ZjdjZjg5OGJmODY0MzZjMWRmZTdjMDdlZTgyZmU4ODk1MWYyNjk1YzlmMzdhMzc5ZiIKK1NSQ19V
UklbaWN1X3Byb3BlcnRpZXNfZGF0YS0yLjQuMC5zaGEyNTZzdW1dID0gImI5OGYyOWFmODJkMDJi
MTYzZmU1MDE2MTM4ODM1MGU3NDNiYjMxMDdjYzhlOGMyZjczMTRjYjUwNWZhZGRmY2YiCitTUkNf
VVJJW2ljdV9wcm92aWRlci0yLjQuMC5zaGEyNTZzdW1dID0gIjQxMzA5OTMxNTYzNmM1ODhlZThm
MDExMTkwYjMyOWI5NzFhMDlhOGZhZTlkMTU3ZTAxZGNhZTgzNzk0Njg1MTQiCiBTUkNfVVJJW2lk
bmEtMS4xLjAuc2hhMjU2c3VtXSA9ICIzYjA4NzVmMjNjYWEwMzg5ODk5NGY2ZGRjNTAxODg2YTQ1
YzdkM2Q2MmQwNGQyZDkwNzg4ZDQ3YmUxYjFlNGRlIgogU1JDX1VSSVtpZG5hX2FkYXB0ZXItMS4y
LjIuc2hhMjU2c3VtXSA9ICJjYjY4MzczYzBkNjYyMGVmODEwNWU4NTVlNzc0NWUxOGIwZDAwZDNi
ZGIwN2ZiNTMyZTQzNDI0NGNkYjlhNzE0IgogU1JDX1VSSVtpbWFnZS0wLjI1LjEwLnNoYTI1NnN1
bV0gPSAiODVhYjgwMzk0MzMzYzAyZmU2ODllYWY5MDBhYjUwMGZiZDBjMjIxM2RhNDE0Njg3ZWJm
OTk1YTY1ZDVhNjEwNCIKIFNSQ19VUklbaW1hZ2Utd2VicC0wLjIuNC5zaGEyNTZzdW1dID0gIjUy
NWU5ZmYzZTFhNGJlMmZiZWExZmRmMGU5ODY4NmE2ZDk4YjRkOGY5MzdlMWJmNzQwMjI0NWFmMTkw
OWU4YzMiCiBTUkNfVVJJW2luZGV4bWFwLTIuMTQuMi5zaGEyNTZzdW1dID0gImNjNGUxOTBmNWQy
NmNhNzA1MTY0MjYyOWRhMmM1MmZjMDNiZGU4NWEwMzE5N2M5OTQwOGRjZDI5MTczNGM4NTUiCi1T
UkNfVVJJW2lub3V0LTAuMi40LnNoYTI1NnN1bV0gPSAiM2NlOTgzYmI2ZmIzOTkwNjdkMTAxZmJm
YzllNzQxNzRlMDdlOWYyOWEyYmM2NzllZmVmZWI4YzY0NTgxOWMzZiIKK1NSQ19VUklbaW5vdXQt
MC4yLjUuc2hhMjU2c3VtXSA9ICIzYjVjZjQzNzJkMDIyMDkyNjc0YTgzYjhmZWJmNTg2NWY3YTU3
M2NjMGM1YmFlYzVlNDljODc5YjZhMjA5NzhmIgogU1JDX1VSSVtpc190ZXJtaW5hbF9wb2x5Zmls
bC0xLjcwLjIuc2hhMjU2c3VtXSA9ICJhNmNiMTM4YmI3OWExNDZjMWJkNDYwMDA1NjIzZTE0MmVm
MDE4MWUzZDAyMTljYjQ5M2UwMmY3ZDA4YTM1Njk1IgogU1JDX1VSSVtpdGVydG9vbHMtMC4xMy4w
LnNoYTI1NnN1bV0gPSAiNDEzZWU3ZGZjNTJlZTFhNDk0OWNlZWI3ZGJjOGEzM2YyZDZjMDg4MTk0
ZDlmOTIyZmI4MzE4ZmFmMWYwMTE4NiIKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTUuMC5zaGEyNTZz
dW1dID0gIjhiNGJhZjkzZjU4ZDQ0MjU3NDljYTQ5YTUxYzUwZWJhYjA3MmM1ZGY2OTk0ZDA4ZmVk
OTM1NDFjMzMxNDgxZGMiCkBAIC01MTQsNyArNTE0LDcgQEAgU1JDX1VSSVtqb2JzZXJ2ZXItMC4x
LjM1LnNoYTI1NnN1bV0gPSAiMWMwMGFjYmQyOWVhYmFkNGEyMzkyZmEwZTkyMWM4NzQ5MzRkYmJm
NDEKIFNSQ19VUklbanMtc3lzLTAuMy4xMDYuc2hhMjU2c3VtXSA9ICI3ODgzZDk0MWRhZTUxMGZi
MmQ5NzhmYzNmZTAxOGM3MWM5ZTI4OTJmZDM4ODU0ZGUzZThiOTJjMmU1YWQ5Y2M1IgogU1JDX1VS
SVtsYW5ndWFnZS10YWdzLTAuMy4yLnNoYTI1NnN1bV0gPSAiZDQzNDU5NjRiYjE0MjQ4NDc5N2Ix
NjFmNDczYTUwM2E0MzRkZTc3MTQ5ZGQ4Yzc0Mjc3ODhjNmUxMzM3OTM4OCIKIFNSQ19VUklbbGF6
eV9zdGF0aWMtMS41LjEuc2hhMjU2c3VtXSA9ICIyMDg3MGY2NDlhZjcwNzNkNTNlMzgwNjdiMmE4
NDMxMjE3NWQ1NmVhMTUyMTdlMWIxNWJjODM1MDZlYzUwYWZiIgotU1JDX1VSSVtsaWJjLTAuMi4x
OTAuc2hhMjU2c3VtXSA9ICJjZTVkM2RkYzZkM2ZhMDAwZWIxNTM2ZDg1ZTE0N2JmZTMxYWFjYWJh
NjkyZWQ2YTg3NmY5NWNiN2M4NTViZTc4IgorU1JDX1VSSVtsaWJjLTAuMi4xOTEuc2hhMjU2c3Vt
XSA9ICI2NWNkODdjOWE2ZDYwNTM2NTgwYjMxNmFkOTg1NzI2MTA0NzMwYTUxNTFjOTk4NDVmMjQ5
MDQyOGVmOTEyNDBhIgogU1JDX1VSSVtsaWJmdXp6ZXItc3lzLTAuNC4xMy5zaGEyNTZzdW1dID0g
ImE5ZmQyZjQxYTFjYmEwOTlmNzlhMGI2YjZjMzU2NTZjZjdjMDMzNTFhN2JhZThmZjBmMjhmMjUy
NzBmOTI5ZDIiCiBTUkNfVVJJW2xpYmxvYWRpbmctMC44Ljkuc2hhMjU2c3VtXSA9ICJkN2M0YjAy
MTk5ZmVlN2M1ZDIxYTVhZTdkOGNmYTc5YTZlZjViYjJmYzgzNGQ2ZTkwNThlODljODI1ZWZkYzU1
IgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZzdW1dID0gIjMyYTY2OTQ5ZTAz
MGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0NTI3NjljMjVkNThhNTMiCkBA
IC02MjcsNyArNjI3LDcgQEAgU1JDX1VSSVtzaW1kLWFkbGVyMzItMC4zLjEwLnNoYTI1NnN1bV0g
PSAiM2EyMTkyOThhYzExYTU2ZWE5YTZkMjEyMDA0NDgyNGQ2ZjAxYWUKIFNSQ19VUklbc2ltZHV0
ZjgtMC4xLjUuc2hhMjU2c3VtXSA9ICJlM2E5ZmUzNGUzZTdhNTAzMTYwNjAzNTFmMzcxODdhM2Y1
NDZiY2U5NTQ5NjE1Njc1NGI2MDFhNWZhNzFiNzZlIgogU1JDX1VSSVtzaXBoYXNoZXItMS4wLjQu
c2hhMjU2c3VtXSA9ICIzM2Y0ZmU5MTg0YTYyZDg0MmM5ZWYzODMwMThmMzMwNmQ4YmEyMjRmZDlk
ODM2ZjU2ZDcyODgzMDg4NDdjMjU2IgogU1JDX1VSSVtzbGFiLTAuNC4xMi5zaGEyNTZzdW1dID0g
IjBjNzkwZGUyMzEyNGY5YWI0NDU0NGQ3YWMwNWQ2MDQ0MGFkYzU4NjQ3OWNlNTAxYzFkNmQ3ZGEz
Y2Q4YzljZjUiCi1TUkNfVVJJW3NtYWxsdmVjLTEuMTYuMy5zaGEyNTZzdW1dID0gIjViM2RjOGFm
NDc0ZjUxNmE4NTFmZjRiZDEyZGI3ODBmOTQ4YjkyNTBhZDM3MjExZTRlZWMwYmNjZWE1NGUwMWIi
CitTUkNfVVJJW3NtYWxsdmVjLTEuMTYuNC5zaGEyNTZzdW1dID0gImQwZDVkNGIxOTgxYjhiYmJi
N2FlZDIwNGNhZTU3MjZkNjgzZDVkNmFjN2U3NGVjNTQxMjJlYTI4ZjMxNWU3YzgiCiBTUkNfVVJJ
W3N0YWJsZV9kZXJlZl90cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFm
OTFkZjcxYmZhMTJhZDM3ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1OTYiCiBTUkNfVVJJ
W3N0YXRpY19hc3NlcnRpb25zLTEuMS4wLnNoYTI1NnN1bV0gPSAiYTJlYjkzNDliNjQ0NGIzMjY4
NzJlMTQwZWIxY2Y1ZTdjNTIyMTU0ZDY5ZTdhMGZmYjBmYjgxYzA2YjM3NTQzZiIKIFNSQ19VUklb
c3RyaW5nX2NhY2hlLTAuOS4wLnNoYTI1NnN1bV0gPSAiYTE4NTk2ZjhjNzg1YTcyOWYyODE5YzBm
NmE3ZWFlNmViZWViZGZmZmJmZTQyMTRhZTZiMDg3ZjY5MGUzMTkwMSIKQEAgLTYzOSw3ICs2Mzks
NyBAQCBTUkNfVVJJW3N5bi0yLjAuMTE5LnNoYTI1NnN1bV0gPSAiODcyODMxYjY0MmQxYTA3OTk5
YTk2MmEzNTFlZDM1Yjk1NWVhMmNmYzhmMzg2MgogU1JDX1VSSVtzeW4tMy4wLjkuc2hhMjU2c3Vt
XSA9ICJkNzhjOGRlZTRjN2JmMGUxNDY3MzA5NzI1NmZlZDYxNDJjZTlkM2I4NWE0MDgxODlkMDc0
ODI0NDIxNDU4MjNiIgogU1JDX1VSSVtzeW5zdHJ1Y3R1cmUtMC4xNC4wLnNoYTI1NnN1bV0gPSAi
OTAxNzA0ZWRkMGRmZTEzN2YxOTg3ODM4ZWU0ZjI1OWU0ZTA2M2MzMTM3MWJkYjQyM2Y3YWUzOGVj
NmY3N2YwMiIKIFNSQ19VUklbc3lzdGVtLWRlcHMtNy4wLjguc2hhMjU2c3VtXSA9ICIzOTZhMzVm
ZWI2NzMzNTM3N2UwMjUxZmNiYzEwOTJmYzg1YzQ4NGJkNGUzYTdhNTQzMTkzOTlkYTEyNzc5NmU3
IgotU1JDX1VSSVtzeXN0ZW0tZGVwcy05LjAuMC5zaGEyNTZzdW1dID0gIjhhMGRhZTJjYmNhMWYw
ZmY5Mzc5NTcxM2NmZTBhNGMwMmY3NjBlM2MwYjhhZTJhYjRlYzQwNDU4MDhmZjQyOWYiCitTUkNf
VVJJW3N5c3RlbS1kZXBzLTkuMC4xLnNoYTI1NnN1bV0gPSAiZGI1NTFhZDM4YWFjNjFkNWUwMzQz
ZTBlZWViMDE2M2JlMzExNWM0ZTIzYjZhMDI1OTU5NTcwZWUwYzAzYzY3ZCIKIFNSQ19VUklbdGFy
Z2V0LWxleGljb24tMC4xMy41LnNoYTI1NnN1bV0gPSAiYWRiNjkzNWE2ZjVjMjAxNzBlZWNlYjFh
MzgzNWE0OWUxMmUxOWQ3OTJmNmRkMzQ0Y2NjNzZhOTg1Y2E1YTZjYSIKIFNSQ19VUklbdGVtcGZp
bGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4Nzk3MDdh
YTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklbdGVuZHJpbC0wLjUuMS5z
aGEyNTZzdW1dID0gIjVmZWQ1NDcwOWM1YjNhNTNkMDliYjFjMTEzZWE0ZjVjZWFmZDFlNzcyZGRj
YjAwMzBhODJlMWQ1NmMwODdiMDgiCkBAIC02NDksNyArNjQ5LDcgQEAgU1JDX1VSSVt0aGlzZXJy
b3ItaW1wbC0yLjAuMjEuc2hhMjU2c3VtXSA9ICJmZTUxOTc5MjMyODdkYjIwYTU4MTI1ZjBiYzg1
YzA2MmY3ZjIKIFNSQ19VUklbdGltZS0wLjMuNTUuc2hhMjU2c3VtXSA9ICJjZGI4N2I5NWVjNTBk
ZGZhNDQwODE2ZDIyN2ExN2IyY2NiZGRhOTYzYTMxNmE3MjdmZGEwZmM0MzM0ZjdkMTM0IgogU1JD
X1VSSVt0aW1lLWNvcmUtMC4xLjkuc2hhMjU2c3VtXSA9ICI5ZTFjOTA2NzY5YWQ5OWM4OGVhYTU0
ZTcyODA2MGVkZWYwODJmOGUzNThmZjMyMDMwY2I3YzdkMzE1ZTgxMTA5IgogU1JDX1VSSVt0aW1l
LW1hY3Jvcy0wLjIuMzIuc2hhMjU2c3VtXSA9ICI3ZTY4OTM0MmE0OGQyZWE5MjdjODdlYTUwY2Fi
Zjg1OTQ4NTRiZjk0MGU5MzEwMjA4ODQ4ZDY4MGQ2NjhlZDg1IgotU1JDX1VSSVt0aW55c3RyLTAu
OC40LnNoYTI1NnN1bV0gPSAiYjFlMjdjOTE0NTkyMDljMjk4NmFmM2RjZjYwM2E1YTc0YTQzNjg3
NTRjZTM3NDE0ZjU5YWNjOTcxMTY3ZjY0MyIKK1NSQ19VUklbdGlueXN0ci0wLjguNS5zaGEyNTZz
dW1dID0gImFiYzg0MGMyMzgxNTRkNThmOWU4NmIyNzkyMjYxZWRmZGU1NjVhMTc2OTZlMWNkYTFh
NDQ5ZGUyNzk3OTgwMWEiCiBTUkNfVVJJW3Rpbnl0ZW1wbGF0ZS0xLjIuMS5zaGEyNTZzdW1dID0g
ImJlNGQ2YjVmMTlmZjc2NjRlOGM5OGQwM2UyMTM5Y2I1MTBkYjliMGE2MGI1NWY4ZTg3MDliNjg5
ZDkzOWI2YmMiCiBTUkNfVVJJW3Rpbnl2ZWMtMS4xMy4zLnNoYTI1NnN1bV0gPSAiZmQzY2EzMTRm
NjkyZWZkNmM4NjhmODQwOGY1M2ZlNDQ0NjM0YTg0NWY5NmMwMjhiOTdkMzVmNmExZjc5ZjBlZSIK
IFNSQ19VUklbdG9tbC0xLjEuOCtzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMjA0ODllMDBlNGQ4
NzQxZDZiZTY4MDc2NGNjMTJlMjcwNjU1ZTM3NWEyMGQxMDExZTg0NGE5YzMzNzllNjc4ZCIKQEAg
LTY2MSw3ICs2NjEsNyBAQCBTUkNfVVJJW3R5cGVudW0tMS4yMC4xLnNoYTI1NnN1bV0gPSAiYjZm
NWU4NzBiZTZjM2IzNzFiNzdmZTBlZTBiYWZiODU5ZmE0OTY0YjQ0MAogU1JDX1VSSVt1bmFycmF5
LTAuMS40LnNoYTI1NnN1bV0gPSAiZWFlYTg1YjMzNGRiNTgzZmUzMjc0ZDEyYjRjZDE4ODAwMzJi
ZWFiNDA5YzBkNzc0YmUwNDRkNDQ4MGFiOWE5NCIKIFNSQ19VUklbdW5pY29kZS1iaWRpLTAuMy4x
OC5zaGEyNTZzdW1dID0gIjVjMWNiNWRiMzkxNTI4OThhNzkxNjg5NzE1NDNiMWNiNTAyMGRmZjdm
ZTQzYzhkYzQ2OGIwODg1ZjVlMjlkZjUiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjI3LnNo
YTI1NnN1bV0gPSAiYTJjNzU0ZDZjMzM3OTVhMWMzMjQ3Mjc0MjhlNWE3ZGVkYjViMDYxOTVmOTg5
MGJkYmNiYTc2MGQzZTI0NjU2MyIKLVNSQ19VUklbdW5pY29kZS1ub3JtYWxpemF0aW9uLTAuMS4y
NS5zaGEyNTZzdW1dID0gIjVmZDRmNjg3OGM5Y2IyOGQ4NzRiMDA5ZGE5ZThkMTgzYjVhYmM4MDEx
N2M0MGJiZDE4N2ExZmRlMzM2YmU2ZTgiCitTUkNfVVJJW3VuaWNvZGUtbm9ybWFsaXphdGlvbi0w
LjEuMjYuc2hhMjU2c3VtXSA9ICI3NWNkM2ZiMDNkNTI4OGIzYmE5YTFlZTEwM2FjN2U5Y2JiNTlm
MGIwM2Q2NGY4ZGRmY2MwNGRkNDI3NThhODVkIgogU1JDX1VSSVt1bmljb2RlLXByb3BlcnRpZXMt
MC4xLjQuc2hhMjU2c3VtXSA9ICI3ZGYwNThjNzEzODQxYWQ4MThmMWRjNWQzZmQ4ODA2MzI0MWNj
NjFmNDlmNWZiZWE0Yjk1MWU4Y2Y1YThkNzFkIgogU1JDX1VSSVt1cmwtMi41Ljguc2hhMjU2c3Vt
XSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2FiMzI2ODIyMjAzNTAxMGFiODY4MGVjNDIx
NWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXItMS4wLjQuc2hhMjU2c3VtXSA9ICJiNmMx
NDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1ZmZjMjdhODg1OWE1ZjBkNDk0YjVkNTJi
NmJlIgpAQCAtNjk1LDE1ICs2OTUsMTUgQEAgU1JDX1VSSVt3cml0ZWFibGUtMC42LjQuc2hhMjU2
c3VtXSA9ICIzYWQ4MmQyYTMzY2RjOTY3NGRjNzQ2NTY3MmYyNzFlMDk2MTY4ZmNkYmUKIFNSQ19V
UklbeG1sNWV2ZXItMC4zOS4wLnNoYTI1NnN1bV0gPSAiNWFiNjI3ZjM0ZmY2MWI4MGQ3NTYxODBk
NTU2ZjljNjg4MDFkODM2ZDI3MWIzYjhjMDk0NTA0Y2VjYTY5ZDIyMSIKIFNSQ19VUklbeWFuc2kt
MS4wLjEuc2hhMjU2c3VtXSA9ICJjZmU1M2E2NjU3ZmQyODBlYWE4OTBhM2JjNTkxNTI4OTJmZmEz
ZTMwMTAxMzE5ZDE2OGI3ODFlZDY1MjliMDQ5IgogU1JDX1VSSVt5ZXNsb2dpYy1mb250Y29uZmln
LXN5cy02LjAuMS5zaGEyNTZzdW1dID0gIjFkOGI4YWJmOTEyYjlhMjlmZjExMmUxNjcxYzk3YzMz
NjM2OTAzZDEzYTY5NzEyMDM3MTkwZTY4MDVhZjRmNzYiCi1TUkNfVVJJW3lva2UtMC44LjMuc2hh
MjU2c3VtXSA9ICI3MDlmZTIzYTA0MjRiNmE0MzVkODIxNTJiMWJkM2ZkZmIwODMzNDg3ZDVmYTkw
ZDA1ZDQyNzYyYTk4OTFmZWY1IgorU1JDX1VSSVt5b2tlLTAuOC40LnNoYTI1NnN1bV0gPSAiNDE3
ZWYzZmNmNmMzMDBiN2RiZDI1Yzg1NTMxYTc0NjkzMWMwMmFkNTM2ZjNjZjQ3ODZlZDFlODgyMjMz
NDBiMyIKIFNSQ19VUklbeW9rZS1kZXJpdmUtMC44LjQuc2hhMjU2c3VtXSA9ICJlYzhlYmRlMmRi
MzY4MWU4Yzk5ODBjYzI3ODIyMDMwZTY4NzUyNjkwZGRmYTk0NzNlNzM5YWViNGRiZGU2ZDcxIgog
U1JDX1VSSVt6ZXJvY29weS0wLjguNjMuc2hhMjU2c3VtXSA9ICJlNWZlMWY4ZjFiMDYxOTFhMDA5
NjIxNzRjNjFhYTUwMDVlMGJiMzkxYTZkODBkMDdlMjRkMTE1YzAxYTkyZWQ4IgogU1JDX1VSSVt6
ZXJvY29weS1kZXJpdmUtMC44LjYzLnNoYTI1NnN1bV0gPSAiODYzYWQzYWM4MzI5M2ZiNGQ3NDBh
ZWRiZmRjOTI0MGRkOGQxYTUwYzEwOTlhY2Q3NmNlODBjZTdjNzIzMGM3ZiIKIFNSQ19VUklbemVy
b2Zyb20tMC4xLjguc2hhMjU2c3VtXSA9ICIwZWMwNWExMTgxM2VhODAxZmY2ZDc1MTEwYWQwOWNk
MDgyNGRkYmExN2RmZTE3MTI4ZWEwZDVmNjhlNmM1MjcyIgogU1JDX1VSSVt6ZXJvZnJvbS1kZXJp
dmUtMC4xLjguc2hhMjU2c3VtXSA9ICJmNzViNDY4M2Y2YzdmNDUyNDhkNGQ2NDA1NmEyNDI5OGM2
MjgxZTA5OTMzNTZkN2QxYjRhMWE5NjJlZjEwZDRhIgogU1JDX1VSSVt6ZXJvdHJpZS0wLjIuNS5z
aGEyNTZzdW1dID0gIjRlYTI2OWMzYmQzMmYwYTMyYzMyMTkwN2EyYWU5MTJiYTZmNDY0OWJiMGZj
NzY0YTE1NjI3ZTk5YTcwOTVhM2YiCi1TUkNfVVJJW3plcm92ZWMtMC4xMS44LnNoYTI1NnN1bV0g
PSAiYmIwNDY0ZTE3ODA2YzFkOTc2ZDVjYmEyOTM5OWM3ZjA4ZTUxNmUyNzllMmJhNDkzZjYzMTIz
YjVmY2E2N2RkOCIKLVNSQ19VUklbemVyb3ZlYy1kZXJpdmUtMC4xMS42LnNoYTI1NnN1bV0gPSAi
MzRkZjZmYzM5ZGJkMjZkZGM5YzEwZTZhMjk4NDQ3NmUxM2FjY2UyMmU2NGU0NDg3NjM2ZWY0OTQz
NjkyMjVkYSIKK1NSQ19VUklbemVyb3ZlYy0wLjExLjkuc2hhMjU2c3VtXSA9ICJmNThhMjc5OWNm
ZTlhMTY3MGM3ZWE4ZWRiZDUyZWY4ZWRiOTNjYjM3YTdmODNiZjMxYmE5ZTM1ZDlkYWU2YTQwIgor
U1JDX1VSSVt6ZXJvdmVjLWRlcml2ZS0wLjExLjcuc2hhMjU2c3VtXSA9ICJjMzc0M2RkYmY0Nzcz
OGQ5MjljZDFhZTJlMTk5ZDQwZDAxNjI5NzlkZmUzMWFlZjhhZTY0NmQyYmYwMGJmOTdhIgogU1JD
X1VSSVt6bGliLXJzLTAuNi44LnNoYTI1NnN1bV0gPSAiYjI2OGU1OGU3YzY5M2Q3YzI3MWY5M2Zm
YzRiYTNiMzgwNDEyNTU0MjMxYzg1YmY2MWNhN2FmOTEwNDJhNDExMiIKIFNSQ19VUklbem1pai0x
LjAuMjMuc2hhMjU2c3VtXSA9ICIyOTY2NmQwYWJiZmFkMWUzZGM0ZGNmNjE0NDczMGRkM2EzYWIy
MjViYmJkYWM4MzMxOTM0NWIxYjQ0Y2NmYzFiIgogU1JDX1VSSVt6dW5lLWNvcmUtMC41LjMuc2hh
MjU2c3VtXSA9ICJkNTYzNzdmZDQ2MzY4OTg0YTE3MGJjNWFhYzU1NjdlNTJjYTVkYTg3NGNhYTYw
YmVhMzlmY2JjYTc4ZmI2NThiIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJz
dmcvbGlicnN2Zy8wMDAxLXF1ZXJ5LXJ1c3RjLWFwcGVuZC1SVVNURkxBR1MtdG8tcnVzdGMtZXhl
Y3V0YWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmcvMDAwMS1x
dWVyeS1ydXN0Yy1hcHBlbmQtUlVTVEZMQUdTLXRvLXJ1c3RjLWV4ZWN1dGFibGUucGF0Y2gKaW5k
ZXggZDlhN2ZiZjUxNC4uYTBhNmQwOTg5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnJzdmcvbGlicnN2Zy8wMDAxLXF1ZXJ5LXJ1c3RjLWFwcGVuZC1SVVNURkxBR1MtdG8tcnVz
dGMtZXhlY3V0YWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJy
c3ZnLzAwMDEtcXVlcnktcnVzdGMtYXBwZW5kLVJVU1RGTEFHUy10by1ydXN0Yy1leGVjdXRhYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYWEwNjJjNGJiZDlmMzY3ODk5N2E5MGM4NWVj
NGVmYTA1MTU2YzA3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMTQ4M2Q3M2Y0YTQ2
ZjE4YmIxOGIxNDk1MzJkODljM2I5YTdhZDExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMiBB
dWcgMjAyNSAyMDo1Nzo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBxdWVyeS1ydXN0YzogYXBw
ZW5kIFJVU1RGTEFHUyB0byBydXN0YyBleGVjdXRhYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnLzAwMDEtdGVzdHMtcmV2ZXJ0LVRha2UtY2FyZS1vZi1k
ZXByZWNhdGVkLWFzc2VydF9jbWQtQ29tbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJy
c3ZnL2xpYnJzdmcvMDAwMS10ZXN0cy1yZXZlcnQtVGFrZS1jYXJlLW9mLWRlcHJlY2F0ZWQtYXNz
ZXJ0X2NtZC1Db21tLnBhdGNoCmluZGV4IDM1YWU5YTdjZDIuLjIyZTBmNmMxMDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmcvMDAwMS10ZXN0cy1yZXZlcnQt
VGFrZS1jYXJlLW9mLWRlcHJlY2F0ZWQtYXNzZXJ0X2NtZC1Db21tLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmcvMDAwMS10ZXN0cy1yZXZlcnQtVGFrZS1jYXJl
LW9mLWRlcHJlY2F0ZWQtYXNzZXJ0X2NtZC1Db21tLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA1ZmNhMWY3ZDg4Y2U4MTdjYjUzMmU2YjdlNzE2OGQzYmViMWE4NmY0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBmZTllNzMwNWFmNTVmNGYyNGZhMDI2Y2I3ZDRjMzkyNWFiNmE3NWQ5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhA
bGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMTggRGVjIDIwMjUgMTg6NDM6MjAgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJldmVydCAnVGFrZSBjYXJlIG9mIGRlcHJlY2F0ZWQKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmdfMi42My4zLmJiIGIv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjYzLjQuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18y
LjYzLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmdfMi42
My40LmJiCmluZGV4IGNkZjM4NmFkN2EuLjZlODgyNzAwNzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmdfMi42My4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
bm9tZS9saWJyc3ZnL2xpYnJzdmdfMi42My40LmJiCkBAIC0yNiw3ICsyNiw3IEBAIHJlcXVpcmUg
JHtCUE59LWNyYXRlcy5pbmMKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXF1ZXJ5LXJ1c3RjLWFw
cGVuZC1SVVNURkxBR1MtdG8tcnVzdGMtZXhlY3V0YWJsZS5wYXRjaCBcCiAgICAgICAgICAgICBm
aWxlOi8vMDAwMS10ZXN0cy1yZXZlcnQtVGFrZS1jYXJlLW9mLWRlcHJlY2F0ZWQtYXNzZXJ0X2Nt
ZC1Db21tLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QiCi1TUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICI1NTMxMWMyMjkzNjEyZTRhMmUzOGNkOWJkYjYxNjBhMWM4NWMx
NThhZGM3Yzk3ZTQyM2UxZTY1OTQ5YWZiNmE0IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMzFmMDdkOTM1MGRhZDNmODk2NGZkNjEzYzMxMzA5YWMxNjBmZGVmMTNkZmFjNTlkZjZmZDA4
MmRlNzhkNmU4ZiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGlicnN2Zy0oP1A8cHZlcj5c
ZCtcLlxkK1wuKD8hOVxkKylcZCspIgogCi0tIAoyLjQ3LjEKCg==

--===============0932148917141308034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: FILELIST: removed "/usr/lib/librsvg/ptest/rsvg_convert-a16f48cfd6475cb7 /usr/lib/librsvg/ptest/render_crash-5cc01229cc2f4396 /usr/lib/librsvg/ptest/intrinsic_dimensions-8847940f49d4d4d1 /usr/lib/librsvg/ptest/primitive_geometries-7913b73195a3505c /usr/lib/librsvg/ptest/api-cfc4bef40c758bac /usr/lib/librsvg/ptest/text-3364e73fc27d20f1 /usr/lib/librsvg/ptest/loading_disallowed-0e55ddd4e471b088 /usr/lib/librsvg/ptest/errors-64a57bdd3160e931 /usr/lib/librsvg/ptest/reference-a7e1a77545f699d9 /usr/lib/librsvg/ptest/loading_crash-9361a6df475f980a /usr/lib/librsvg/ptest/shapes-523a056828c7532b /usr/lib/librsvg/ptest/rsvg_convert-b43cca1a9cc4a434 /usr/lib/librsvg/ptest/primitives-63276127cd7e42d5 /usr/lib/librsvg/ptest/rsvg_convert-ee48ad974bfc6603 /usr/lib/librsvg/ptest/filters-4d2a55154c57f338 /usr/lib/librsvg/ptest/geometries-e9828bd2a4fc03eb /usr/lib/librsvg/ptest/rsvg-7696e2d64927f503 /usr/lib/librsvg/ptest/bugs-8cf9b6bda3aa4298", adde
 d "/usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/bug1233-exif-orientations-ref.png /usr/lib/librsvg/ptest/filters-3435a6c7a7bfa6e4 /usr/lib/librsvg/ptest/rsvg_convert-fd2f8fa4ea5eeb65 /usr/lib/librsvg/ptest/loading_crash-7a18a4df0cc5843f /usr/lib/librsvg/ptest/text-dd5e3933803f4b1f /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/bug1233-exif-orientations.svg /usr/lib/librsvg/ptest/shapes-4888622986219e05 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=8.jpg /usr/lib/librsvg/ptest/primitives-9ab65435af055ea5 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=1.jpg /usr/lib/librsvg/ptest/bugs-0d83e5bec99816b0 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=5.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=6.jpg /usr/lib/librsvg/ptest/rsvg_convert-ec8b8e2623c8dc07 /usr/lib/librsvg/ptest/api-75ace24344b19474 /usr/lib/librsvg/ptest/loading_disallowed-03bbc849cce7fa7f /usr/lib/li
 brsvg/ptest/geometries-f48f03f18485a505 /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=3.jpg /usr/lib/librsvg/ptest/reference-70e1ffc5666fa18b /usr/lib/librsvg/ptest/rsvg_convert-4ea95c88e256d09f /usr/lib/librsvg/ptest/rsvg-2c6b1a904f00786c /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=4.jpg /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=2.jpg /usr/lib/librsvg/ptest/render_crash-6e5ca0dc8311b25a /usr/lib/librsvg/ptest/intrinsic_dimensions-6131b8f3f2da4632 /usr/lib/librsvg/ptest/primitive_geometries-70207cf9abb9d350 /usr/lib/librsvg/ptest/errors-b2a9d9851c78b30c /usr/lib/librsvg/ptest/tests/fixtures/reftests/bugs/exif-orientations/or=7.jpg"
packages/x86-64-v3-poky-linux/librsvg/librsvg: FILELIST: removed "/usr/lib/librsvg-2.so.2.63.3", added "/usr/lib/librsvg-2.so.2.63.4"
Changes to packages/x86-64-v3-poky-linux/librsvg (sysroot):
  /usr/lib/librsvg-2.so.2 changed symlink target from librsvg-2.so.2.63.3 to librsvg-2.so.2.63.4
  /usr/lib/librsvg-2.so.2.63.3 moved to /usr/lib/librsvg-2.so.2.63.4

--===============0932148917141308034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="librsvg-changelog.txt"

Version 2.63.4
==============

librsvg crate version 2.63.3
librsvg-rebind crate version 0.3.0

- #1233 - Handle EXIF orientation in images, and handle the
  image-orientation property.  Note that the only values supported
  for this property are 'from-image' (the default) and 'none'.

  Note that this will change the rendering of SVG documents which
  assume the images with EXIF orientation data are not auto-oriented
  correctly.  In this case, please add the following attribute to the
  corresponding image elemnts:

    style="image-orientation: none;"

  Special thanks to Mark de Does for providing the test files for this
  feature.

--===============0932148917141308034==--
