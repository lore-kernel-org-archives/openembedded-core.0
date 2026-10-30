Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6325.1793344582974042983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ODgUwHCW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gx84Uefk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a18baab1ba-608c401e-6d34-4685-800b-1733bb441464-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TC39ji28Ag3Su8eR5Y3KyagHSOIvJUfN2fKRdt6NMMg=;
	b=ODgUwHCWSIRBFabdLezD4lAFu/RU7i3hnS5ELBB6rVSBoTvfjRFTAvz8mrxHZESw
	OWzYptO7R81DFMYiRQQds5zl46Oh8y62n4dkXCG11mh20UiA00vxajjEPQVFEEHRDQa
	ufl14L4+THvuvXl1HCeT/Nt+GjdXqXaSD9aehiA8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TC39ji28Ag3Su8eR5Y3KyagHSOIvJUfN2fKRdt6NMMg=;
	b=Gx84Uefk74cckZq8b4fhAO7yJsD74wQ01kN6zk7hHJQBQgjZV2g+NCImQKttP1TE
	MPbD6kq2Xf9lFDZnpDc+L4UU8hG0B+x12JVNJbZIMbDYQHgWWcTa3zuaWesN58yusoh
	ijo7wWPXaQOV6/7OahATtHTW2Hs6baZhgFiJioXQ=
Content-Type: multipart/mixed; boundary="===============1873614873508686949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.16.0 SUCCEEDED
Message-ID: <010101a18baab1ba-608c401e-6d34-4685-800b-1733bb441464-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249000

--===============1873614873508686949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.15.0-1.16.0.patch
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
From b1169f7123777ab2caac7935efc4ec11cc703fd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 05:51:20 +0000
Subject: [PATCH] python3-maturin: upgrade 1.15.0 -> 1.16.0

## 1.16.0
---
 .../python/python3-maturin-crates.inc         | 64 ++++++++++---------
 ...01-Cargo.lock-Update-rustix-to-1.1.5.patch | 37 +++++------
 ...in_1.15.0.bb => python3-maturin_1.16.0.bb} |  2 +-
 3 files changed, 50 insertions(+), 53 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.15.0.bb => python3-maturin_1.16.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 68507ad754..a70632bc75 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -38,7 +38,7 @@ SRC_URI += " \
     crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-platform/0.3.2 \
     crate://crates.io/cargo-xwin/0.23.1 \
-    crate://crates.io/cargo-zigbuild/0.23.1 \
+    crate://crates.io/cargo-zigbuild/0.24.0 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cargo_metadata/0.23.1 \
     crate://crates.io/cbindgen/0.29.2 \
@@ -82,7 +82,7 @@ SRC_URI += " \
     crate://crates.io/cyclonedx-bom/0.8.1 \
     crate://crates.io/cyclonedx-bom-macros/0.1.0 \
     crate://crates.io/data-encoding/2.10.0 \
-    crate://crates.io/der/0.8.0 \
+    crate://crates.io/der/0.8.3 \
     crate://crates.io/deranged/0.5.8 \
     crate://crates.io/dialoguer/0.12.0 \
     crate://crates.io/diff/0.1.13 \
@@ -179,10 +179,10 @@ SRC_URI += " \
     crate://crates.io/litrs/1.0.0 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-rust2/0.16.2 \
+    crate://crates.io/lzma-rust2/0.23.0 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.6 \
-    crate://crates.io/mailparse/0.16.1 \
+    crate://crates.io/mailparse/0.18.0 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.8.0 \
     crate://crates.io/memmap2/0.9.11 \
@@ -194,7 +194,7 @@ SRC_URI += " \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/msi/0.10.0 \
     crate://crates.io/native-tls/0.2.18 \
-    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/8.0.0 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/normpath/1.5.0 \
@@ -238,9 +238,9 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
-    crate://crates.io/pyo3-introspection/0.29.0 \
+    crate://crates.io/pyo3-introspection/0.30.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/python-pkginfo/0.6.8 \
+    crate://crates.io/python-pkginfo/0.7.0 \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/quoted_printable/0.5.2 \
     crate://crates.io/r-efi/5.3.0 \
@@ -269,12 +269,12 @@ SRC_URI += " \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustflags/0.1.7 \
     crate://crates.io/rustix/1.1.5 \
-    crate://crates.io/rustls/0.23.38 \
+    crate://crates.io/rustls/0.23.46 \
     crate://crates.io/rustls-native-certs/0.8.3 \
     crate://crates.io/rustls-pki-types/1.14.0 \
     crate://crates.io/rustls-platform-verifier/0.6.2 \
     crate://crates.io/rustls-platform-verifier-android/0.1.1 \
-    crate://crates.io/rustls-webpki/0.103.13 \
+    crate://crates.io/rustls-webpki/0.103.16 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ruzstd/0.8.2 \
     crate://crates.io/same-file/1.0.6 \
@@ -357,6 +357,7 @@ SRC_URI += " \
     crate://crates.io/trycmd/1.2.0 \
     crate://crates.io/twox-hash/2.1.2 \
     crate://crates.io/typed-path/0.12.3 \
+    crate://crates.io/typed-path/0.13.0 \
     crate://crates.io/typenum/1.20.0 \
     crate://crates.io/unicase/2.9.0 \
     crate://crates.io/unicode-ident/1.0.24 \
@@ -394,8 +395,8 @@ SRC_URI += " \
     crate://crates.io/wasm-metadata/0.244.0 \
     crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/webpki-root-certs/1.0.7 \
-    crate://crates.io/webpki-roots/1.0.7 \
+    crate://crates.io/webpki-root-certs/1.0.10 \
+    crate://crates.io/webpki-roots/1.0.10 \
     crate://crates.io/which/8.0.2 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
@@ -467,13 +468,14 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.4 \
     crate://crates.io/zerovec/0.11.6 \
     crate://crates.io/zerovec-derive/0.11.3 \
-    crate://crates.io/zip/8.5.1 \
+    crate://crates.io/zip/8.6.0 \
+    crate://crates.io/zip/9.1.3 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
     crate://crates.io/zopfli/0.8.3 \
-    crate://crates.io/zstd/0.13.3 \
-    crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
+    crate://crates.io/zstd/0.14.3 \
+    crate://crates.io/zstd-safe/8.2.0 \
+    crate://crates.io/zstd-sys/2.1.2+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
@@ -512,7 +514,7 @@ SRC_URI[cargo-options-0.8.1.sha256sum] = "b916a16b2a4b0ce91d46e42c51b7fc42e75422
 SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-platform-0.3.2.sha256sum] = "87a0c0e6148f11f01f32650a2ea02d532b2ad4e81d8bd41e6e565b5adc5e6082"
 SRC_URI[cargo-xwin-0.23.1.sha256sum] = "08fe6fef95319ecc03c40127b2af811522b7918b05502ebb35b2972208993a57"
-SRC_URI[cargo-zigbuild-0.23.1.sha256sum] = "9840ba8824cf43c7efb04a268090199072ad3ca8c65c386132909aee1bd4d4bf"
+SRC_URI[cargo-zigbuild-0.24.0.sha256sum] = "cfd0dbe23ae1b71e74014ba62e3262d6b2fdf76251828644823bdfd21ce5d84e"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cargo_metadata-0.23.1.sha256sum] = "ef987d17b0a113becdd19d3d0022d04d7ef41f9efe4f3fb63ac44ba61df3ade9"
 SRC_URI[cbindgen-0.29.2.sha256sum] = "befbfd072a8e81c02f8c507aefce431fe5e7d051f83d48a23ffc9b9fe5a11799"
@@ -556,7 +558,7 @@ SRC_URI[crypto-common-0.2.1.sha256sum] = "77727bb15fa921304124b128af125e7e3b9682
 SRC_URI[cyclonedx-bom-0.8.1.sha256sum] = "3132b69ba8c13808bd2fa5748ac5b9816eb4f4e1f0bff6b7f9254a5940dcdeef"
 SRC_URI[cyclonedx-bom-macros-0.1.0.sha256sum] = "c50341f21df64b412b4f917e34b7aa786c092d64f3f905f478cb76950c7e980c"
 SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
-SRC_URI[der-0.8.0.sha256sum] = "71fd89660b2dc699704064e59e9dba0147b903e85319429e131620d022be411b"
+SRC_URI[der-0.8.3.sha256sum] = "6a996a108feb8b427a6e12fcf6af4aa83409b79d72c15337d7741368131ee004"
 SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
 SRC_URI[dialoguer-0.12.0.sha256sum] = "25f104b501bf2364e78d0d3974cbc774f738f5865306ed128e1e0d7499c0ad96"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
@@ -653,10 +655,10 @@ SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b368
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-rust2-0.16.2.sha256sum] = "47bb1e988e6fb779cf720ad431242d3f03167c1b3f2b1aae7f1a94b2495b36ae"
+SRC_URI[lzma-rust2-0.23.0.sha256sum] = "f1c46f3fcd2e888afdb01a07efc071cb21300e07c68d32c3e8b01b5c8cb1fcaa"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.6.sha256sum] = "7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9"
-SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
+SRC_URI[mailparse-0.18.0.sha256sum] = "068d4f5d1083883b9e626051dc5bdaa321f5be01093e61ade3ee3ab44dafeadd"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
@@ -668,7 +670,7 @@ SRC_URI[minijinja-2.19.0.sha256sum] = "805bfd7352166bae857ee569628b52bcd85a1cecf
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[msi-0.10.0.sha256sum] = "b0325f8473ef1f5c38ee42345e2cd1678299cbbfa169d1776654a2a682867420"
 SRC_URI[native-tls-0.2.18.sha256sum] = "465500e14ea162429d264d44189adc38b199b62b1c21eea9f69e4b73cb03bbf2"
-SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[normpath-1.5.0.sha256sum] = "bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b"
@@ -712,9 +714,9 @@ SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278f
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
-SRC_URI[pyo3-introspection-0.29.0.sha256sum] = "7775fcc875acdce3872dcb91a4b7bd155ffba6e0ea8be88b8caab7d0b34539a6"
+SRC_URI[pyo3-introspection-0.30.1.sha256sum] = "3b2ac30f128e6ab4ca1c464d6eabd30c84c7adc5955c3bb2eb7d203ea24ebd18"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
+SRC_URI[python-pkginfo-0.7.0.sha256sum] = "ad0f01c29e3af9f28f5cfee9bcd599d8031b8cba40eced8a9ae7aa2d2e5b735c"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[quoted_printable-0.5.2.sha256sum] = "478e0585659a122aa407eb7e3c0e1fa51b1d8a870038bd29f0cf4a8551eea972"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
@@ -743,12 +745,12 @@ SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustflags-0.1.7.sha256sum] = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
 SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
-SRC_URI[rustls-0.23.38.sha256sum] = "69f9466fb2c14ea04357e91413efb882e2a6d4a406e625449bc0a5d360d53a21"
+SRC_URI[rustls-0.23.46.sha256sum] = "48e13bd8c0e9365c43cfa5c9e8f9ad49d3c8444926c9aac819e0e4dc503c8fdf"
 SRC_URI[rustls-native-certs-0.8.3.sha256sum] = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
 SRC_URI[rustls-pki-types-1.14.0.sha256sum] = "be040f8b0a225e40375822a563fa9524378b9d63112f53e19ffff34df5d33fdd"
 SRC_URI[rustls-platform-verifier-0.6.2.sha256sum] = "1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784"
 SRC_URI[rustls-platform-verifier-android-0.1.1.sha256sum] = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
-SRC_URI[rustls-webpki-0.103.13.sha256sum] = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
+SRC_URI[rustls-webpki-0.103.16.sha256sum] = "4443b1b6d39d7c663139942cc4558262562d2c84123bb6282ef177009ca8b281"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ruzstd-0.8.2.sha256sum] = "e5ff0cc5e135c8870a775d3320910cd9b564ec036b4dc0b8741629020be63f01"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
@@ -831,6 +833,7 @@ SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b0441
 SRC_URI[trycmd-1.2.0.sha256sum] = "218889993f76bda9b2ef57c12c3cab0eef4fd54ec7b36d1704849867f69e7bb4"
 SRC_URI[twox-hash-2.1.2.sha256sum] = "9ea3136b675547379c4bd395ca6b938e5ad3c3d20fad76e7fe85f9e0d011419c"
 SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
+SRC_URI[typed-path-0.13.0.sha256sum] = "9ce898823d8cd0f028662d2f349694b1af0a5cc9be83f1d213a00d3147445e1e"
 SRC_URI[typenum-1.20.0.sha256sum] = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
 SRC_URI[unicase-2.9.0.sha256sum] = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
@@ -868,8 +871,8 @@ SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4
 SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
 SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[webpki-root-certs-1.0.7.sha256sum] = "f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c"
-SRC_URI[webpki-roots-1.0.7.sha256sum] = "52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d"
+SRC_URI[webpki-root-certs-1.0.10.sha256sum] = "58ec80e73fd8baf57bf0d9615554c75348bda990d6d5bbeab964dd068319fecb"
+SRC_URI[webpki-roots-1.0.10.sha256sum] = "1c1c8e20c8a38fc7d65abfe74eb7280e4aa667e8eec8bc84996d2874810748d9"
 SRC_URI[which-8.0.2.sha256sum] = "81995fafaaaf6ae47a7d0cc83c67caf92aeb7e5331650ae6ff856f7c0c60c459"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
@@ -941,10 +944,11 @@ SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
 SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
 SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
-SRC_URI[zip-8.5.1.sha256sum] = "dcab981e19633ebcf0b001ddd37dd802996098bc1864f90b7c5d970ce76c1d59"
+SRC_URI[zip-8.6.0.sha256sum] = "2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b"
+SRC_URI[zip-9.1.3.sha256sum] = "1156b39d142a34b999c2310a50455e0cb3760bf7efad0122f796d813bee26ccb"
 SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
 SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
-SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
-SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
+SRC_URI[zstd-0.14.3.sha256sum] = "db3ae9bf90af6e40197bef767eeefc46ad6397420fe873830bd85e5fbbfb3c70"
+SRC_URI[zstd-safe-8.2.0.sha256sum] = "ded520f16b29e1a9b771c722221b2b0a0398c2316d9bb3c42b458a5414d7434b"
+SRC_URI[zstd-sys-2.1.2+zstd.1.5.7.sha256sum] = "481ada9c543b2323cbb7bbdbb5249177fbf0188ed959ed2c15e4b22421c84ed3"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch b/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
index 675cc0c7bb..c6be655319 100644
--- a/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
@@ -1,3 +1,4 @@
+From e1748bf87c6d3be2a165ebbf3a78b31d82e81766 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 22 Oct 2026 17:00:00 -0700
 Subject: [PATCH] Cargo.lock: Update rustix to 1.1.5
@@ -19,9 +20,11 @@ rustix 1.1.5 imports them explicitly instead [1]. Update it with
 Upstream-Status: Submitted [https://github.com/PyO3/maturin/pull/3344]
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- Cargo.lock | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
+ Cargo.lock | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
 
+diff --git a/Cargo.lock b/Cargo.lock
+index 8b8984b..0a3622d 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -59,7 +59,7 @@ version = "1.1.5"
@@ -42,7 +45,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -879,7 +879,7 @@ dependencies = [
+@@ -880,7 +880,7 @@ dependencies = [
   "libc",
   "option-ext",
   "redox_users",
@@ -51,7 +54,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -967,7 +967,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -968,7 +968,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
  dependencies = [
   "libc",
@@ -60,7 +63,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -1478,7 +1478,7 @@ checksum = "3640c1c38b8e4e43584d8df18be5fc6b0aa314ce6ebf51b53313d4306cca8e46"
+@@ -1481,7 +1481,7 @@ checksum = "3640c1c38b8e4e43584d8df18be5fc6b0aa314ce6ebf51b53313d4306cca8e46"
  dependencies = [
   "hermit-abi",
   "libc",
@@ -69,7 +72,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -1961,7 +1961,7 @@ version = "0.50.3"
+@@ -1964,7 +1964,7 @@ version = "0.50.3"
  source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
  dependencies = [
@@ -78,7 +81,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -2079,7 +2079,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -2082,7 +2082,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
  dependencies = [
   "libc",
@@ -87,17 +90,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -2629,15 +2629,15 @@ checksum = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
- 
- [[package]]
- name = "rustix"
--version = "1.1.4"
-+version = "1.1.5"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
-+checksum = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
- dependencies = [
-  "bitflags",
+@@ -2640,7 +2640,7 @@ dependencies = [
   "errno",
   "libc",
   "linux-raw-sys",
@@ -106,7 +99,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -2694,7 +2694,7 @@ dependencies = [
+@@ -2697,7 +2697,7 @@ dependencies = [
   "security-framework 3.7.0",
   "security-framework-sys",
   "webpki-root-certs",
@@ -115,7 +108,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -3185,7 +3185,7 @@ dependencies = [
+@@ -3188,7 +3188,7 @@ dependencies = [
   "getrandom 0.4.2",
   "once_cell",
   "rustix",
@@ -124,7 +117,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -3204,7 +3204,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -3207,7 +3207,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
  dependencies = [
   "rustix",
@@ -133,7 +126,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  ]
  
  [[package]]
-@@ -3921,7 +3921,7 @@ version = "0.1.11"
+@@ -3930,7 +3930,7 @@ version = "0.1.11"
  source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
  dependencies = [
diff --git a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb b/meta/recipes-devtools/python/python3-maturin_1.16.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.15.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.16.0.bb
index a29e29bda9..905db4a61c 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.16.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
 
 SRC_URI += "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch"
 
-SRC_URI[sha256sum] = "94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408b38761263954228a"
+SRC_URI[sha256sum] = "13e69ca12542999d8c5467131de72a49bb76e4c284b9a45c5783df7c0fcb3a8a"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============1873614873508686949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.15.0.tar.gz file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 crate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates
 .io/bumpalo/3.20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.8.1 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.23.1 crate://crates.io/cargo-zigbuild/0.23.1 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 crate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 c
 rate://crates.io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.20 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx
 -bom/0.8.1 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.0 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io
 /fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.i
 o/humantime-serde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://c
 rates.io/keyring/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.189 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.11 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31
 .2 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.80 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.116 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crates.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generato
 r/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.29.0 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io
 /redox_syscall/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.5 crate://crates.io/rustls/0.23.38 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.13 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzst
 d/0.8.2 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate:/
 /crates.io/simd-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.46 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crat
 e://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://c
 rates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/validator/0.19.0 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crate
 s.io/wasm-bindgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.7 crate://crates.io/webpki-roots/1.0.7 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://cra
 tes.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i68
 6_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.10.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crate
 s.io/yoke-derive/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/8.5.1 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.16.0.tar.gz file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 cr
 ate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.8.1 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.23.1 crate://crates.io/cargo-zigbuild/0.24.0 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 cra
 te://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 c
 rate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.20 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx-bom/0.8.1 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.3 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0
  crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 cra
 te://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/ins
 ta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://crates.io/keyring/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.189 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.23.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailpar
 se/0.18.0 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.11 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31.3 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.80 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.116 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crate
 s.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.3
 0.1 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.7.0 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscall/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_vers
 ion/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.5 crate://crates.io/rustls/0.23.46 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.16 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzstd/0.8.2 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://c
 rates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2
  crate://crates.io/tar/0.4.46 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate:/
 /crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typed-path/0.13.0 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate
 ://crates.io/validator/0.19.0 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.10 crate://crates.io/webpki-roots/1.0.10 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/w
 inapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch6
 4_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.5
 7.1 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.10.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crates.io/yoke-derive/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/8.6.0 crate://crates.io/zip/9.1.3 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.14.3 crate://crates.io/zstd-safe/8.2.0 crate://crates.io/zstd-sys/2.1.2+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 7277744 to 7316024 (+1%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.15.0" to "1.16.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 15004616 to 15082536 (+1%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.15.0" to "1.16.0"
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info

--===============1873614873508686949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-maturin-changelog.txt"

## 1.16.0

--===============1873614873508686949==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.15.0-1.16.0.patch"

RnJvbSBiMTE2OWY3MTIzNzc3YWIyY2FhYzc5MzVlZmM0ZWMxMWNjNzAzZmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDU6NTE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hdHVyaW46IHVwZ3JhZGUgMS4xNS4wIC0+IDEuMTYuMAoKIyMgMS4xNi4wCi0tLQog
Li4uL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmluYyAgICAgICAgIHwgNjQgKysrKysr
KysrKy0tLS0tLS0tLQogLi4uMDEtQ2FyZ28ubG9jay1VcGRhdGUtcnVzdGl4LXRvLTEuMS41LnBh
dGNoIHwgMzcgKysrKystLS0tLS0KIC4uLmluXzEuMTUuMC5iYiA9PiBweXRob24zLW1hdHVyaW5f
MS4xNi4wLmJifSB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDUz
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtbWF0dXJpbl8xLjE1LjAuYmIgPT4gcHl0aG9uMy1tYXR1cmluXzEuMTYuMC5iYn0gKDkyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJp
bi1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVy
aW4tY3JhdGVzLmluYwppbmRleCA2ODUwN2FkNzU0Li5hNzA2MzJiYzc1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5p
bmMKQEAgLTM4LDcgKzM4LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9jYXJnby1wbGF0Zm9ybS8wLjEuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28tcGxh
dGZvcm0vMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXh3aW4vMC4yMy4xIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby16aWdidWlsZC8wLjIzLjEgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NhcmdvLXppZ2J1aWxkLzAuMjQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2FyZ29fbWV0YWRhdGEvMC4xOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnb19t
ZXRhZGF0YS8wLjIzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NiaW5kZ2VuLzAuMjkuMiBc
CkBAIC04Miw3ICs4Miw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Y3ljbG9uZWR4LWJvbS8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3ljbG9uZWR4LWJv
bS1tYWNyb3MvMC4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RhdGEtZW5jb2RpbmcvMi4x
MC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9kZXIvMC44LjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2Rlci8wLjguMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGVyYW5nZWQvMC41Ljgg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpYWxvZ3Vlci8wLjEyLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2RpZmYvMC4xLjEzIFwKQEAgLTE3OSwxMCArMTc5LDEwIEBAIFNSQ19VUkkgKz0g
IiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0cnMvMS4wLjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2xvY2tfYXBpLzAuNC4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9nLzAuNC4y
OSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbHptYS1ydXN0Mi8wLjE2LjIgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2x6bWEtcnVzdDIvMC4yMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9s
em1hLXN5cy8wLjEuMjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6eGQvMC4yLjYgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL21haWxwYXJzZS8wLjE2LjEgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL21haWxwYXJzZS8wLjE4LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAu
Mi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1jaHIvMi44LjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL21lbW1hcDIvMC45LjExIFwKQEAgLTE5NCw3ICsxOTQsNyBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOC45IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9tc2kvMC4xMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9uYXRpdmUt
dGxzLzAuMi4xOCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbml4LzAuMzEuMiBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbml4LzAuMzEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9tLzgu
MC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub3JtYWxpemUtbGluZS1lbmRpbmdzLzAuMy4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub3JtcGF0aC8xLjUuMCBcCkBAIC0yMzgsOSArMjM4
LDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8x
LjAuMTA2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wc20vMC4xLjMwIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9wdXJsLzAuMS42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWludHJv
c3BlY3Rpb24vMC4yOS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWludHJvc3BlY3Rp
b24vMC4zMC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9weXByb2plY3QtdG9tbC8wLjEzLjcg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5dGhvbi1wa2dpbmZvLzAuNi44IFwKKyAgICBjcmF0
ZTovL2NyYXRlcy5pby9weXRob24tcGtnaW5mby8wLjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcXVvdGUvMS4wLjQ1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZWRfcHJpbnRhYmxl
LzAuNS4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMuMCBcCkBAIC0yNjksMTIg
KzI2OSwxMiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RjX3Zl
cnNpb24vMC40LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RmbGFncy8wLjEuNyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LzEuMS41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9ydXN0bHMvMC4yMy4zOCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGxzLzAuMjMuNDYg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rscy1uYXRpdmUtY2VydHMvMC44LjMgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rscy1wa2ktdHlwZXMvMS4xNC4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9ydXN0bHMtcGxhdGZvcm0tdmVyaWZpZXIvMC42LjIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3J1c3Rscy1wbGF0Zm9ybS12ZXJpZmllci1hbmRyb2lkLzAuMS4xIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9ydXN0bHMtd2VicGtpLzAuMTAzLjEzIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9ydXN0bHMtd2VicGtpLzAuMTAzLjE2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
dXN0dmVyc2lvbi8xLjAuMjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1enN0ZC8wLjguMiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2FtZS1maWxlLzEuMC42IFwKQEAgLTM1Nyw2ICszNTcs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyeWNtZC8xLjIuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHdveC1oYXNoLzIuMS4yIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90eXBlZC1wYXRoLzAuMTIuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZWQt
cGF0aC8wLjEzLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3R5cGVudW0vMS4yMC4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby91bmljYXNlLzIuOS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by91bmljb2RlLWlkZW50LzEuMC4yNCBcCkBAIC0zOTQsOCArMzk1LDggQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLW1ldGFkYXRhLzAuMjQ0LjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dhc21wYXJzZXIvMC4yNDQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2ViLXRpbWUvMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dlYnBraS1yb290LWNl
cnRzLzEuMC43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93ZWJwa2ktcm9vdHMvMS4wLjcgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dlYnBraS1yb290LWNlcnRzLzEuMC4xMCBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2VicGtpLXJvb3RzLzEuMC4xMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2hpY2gvOC4wLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbGQvMi4yLjEgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmFwaS8wLjMuOSBcCkBAIC00NjcsMTMgKzQ2OCwxNCBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm90cmllLzAuMi40IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLzAuMTEuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vemVyb3ZlYy1kZXJpdmUvMC4xMS4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96aXAvOC41
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ppcC84LjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vemlwLzkuMS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96bGliLXJzLzAuNi4zIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby96bWlqLzEuMC4yMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vem9wZmxpLzAuOC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96c3RkLzAuMTMuMyBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8venN0ZC1zYWZlLzcuMi40IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby96c3RkLXN5cy8yLjAuMTYrenN0ZC4xLjUuNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
enN0ZC8wLjE0LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3pzdGQtc2FmZS84LjIuMCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8venN0ZC1zeXMvMi4xLjIrenN0ZC4xLjUuNyBcCiAiCiAKIFNS
Q19VUklbYWRsZXIyLTIuMC4xLnNoYTI1NnN1bV0gPSAiMzIwMTE5NTc5ZmNhZDljMjE4ODRmNWM0
ODYxZDE2MTc0ZDBlMDYyNTA2MjUyNjZmNTBmZTY4OTgzNDBhYmVmYSIKQEAgLTUxMiw3ICs1MTQs
NyBAQCBTUkNfVVJJW2NhcmdvLW9wdGlvbnMtMC44LjEuc2hhMjU2c3VtXSA9ICJiOTE2YTE2YjJh
NGIwY2U5MWQ0NmU0MmM1MWI3ZmM0MmU3NTQyMgogU1JDX1VSSVtjYXJnby1wbGF0Zm9ybS0wLjEu
OS5zaGEyNTZzdW1dID0gImUzNWFmMTg5MDA2YjljMGYwMGEwNjQ2ODVjNzI3MDMxZTNlZDJkODAy
MGY3YmEyODRkNzhjYzI2NzFiZDM2ZWEiCiBTUkNfVVJJW2NhcmdvLXBsYXRmb3JtLTAuMy4yLnNo
YTI1NnN1bV0gPSAiODdhMGMwZTYxNDhmMTFmMDFmMzI2NTBhMmVhMDJkNTMyYjJhZDRlODFkOGJk
NDFlNmU1NjViNWFkYzVlNjA4MiIKIFNSQ19VUklbY2FyZ28teHdpbi0wLjIzLjEuc2hhMjU2c3Vt
XSA9ICIwOGZlNmZlZjk1MzE5ZWNjMDNjNDAxMjdiMmFmODExNTIyYjc5MThiMDU1MDJlYmIzNWIy
OTcyMjA4OTkzYTU3IgotU1JDX1VSSVtjYXJnby16aWdidWlsZC0wLjIzLjEuc2hhMjU2c3VtXSA9
ICI5ODQwYmE4ODI0Y2Y0M2M3ZWZiMDRhMjY4MDkwMTk5MDcyYWQzY2E4YzY1YzM4NjEzMjkwOWFl
ZTFiZDRkNGJmIgorU1JDX1VSSVtjYXJnby16aWdidWlsZC0wLjI0LjAuc2hhMjU2c3VtXSA9ICJj
ZmQwZGJlMjNhZTFiNzFlNzQwMTRiYTYyZTMyNjJkNmIyZmRmNzYyNTE4Mjg2NDQ4MjNiZGZkMjFj
ZTVkODRlIgogU1JDX1VSSVtjYXJnb19tZXRhZGF0YS0wLjE4LjEuc2hhMjU2c3VtXSA9ICIyZDg4
NjU0N2U0MWY3NDBjNjE2YWU3MzEwOGY2ZWI3MGFmZTZkOTQwYzdiYzY5N2NiMzBmMTNkYWVjMDcz
MDM3IgogU1JDX1VSSVtjYXJnb19tZXRhZGF0YS0wLjIzLjEuc2hhMjU2c3VtXSA9ICJlZjk4N2Qx
N2IwYTExM2JlY2RkMTlkM2QwMDIyZDA0ZDdlZjQxZjllZmU0ZjNmYjYzYWM0NGJhNjFkZjNhZGU5
IgogU1JDX1VSSVtjYmluZGdlbi0wLjI5LjIuc2hhMjU2c3VtXSA9ICJiZWZiZmQwNzJhOGU4MWMw
MmY4YzUwN2FlZmNlNDMxZmU1ZTdkMDUxZjgzZDQ4YTIzZmZjOWI5ZmU1YTExNzk5IgpAQCAtNTU2
LDcgKzU1OCw3IEBAIFNSQ19VUklbY3J5cHRvLWNvbW1vbi0wLjIuMS5zaGEyNTZzdW1dID0gIjc3
NzI3YmIxNWZhOTIxMzA0MTI0YjEyOGFmMTI1ZTdlM2I5NjgyCiBTUkNfVVJJW2N5Y2xvbmVkeC1i
b20tMC44LjEuc2hhMjU2c3VtXSA9ICIzMTMyYjY5YmE4YzEzODA4YmQyZmE1NzQ4YWM1Yjk4MTZl
YjRmNGUxZjBiZmY2YjdmOTI1NGE1OTQwZGNkZWVmIgogU1JDX1VSSVtjeWNsb25lZHgtYm9tLW1h
Y3Jvcy0wLjEuMC5zaGEyNTZzdW1dID0gImM1MDM0MWYyMWRmNjRiNDEyYjRmOTE3ZTM0YjdhYTc4
NmMwOTJkNjRmM2Y5MDVmNDc4Y2I3Njk1MGM3ZTk4MGMiCiBTUkNfVVJJW2RhdGEtZW5jb2Rpbmct
Mi4xMC4wLnNoYTI1NnN1bV0gPSAiZDdhMWUyZjI3NjM2ZjExNjQ5M2I4Yjg2MGY1NTQ2ZWRiNDdj
OGQ4ZjhlYTczZTFkMmEyMGJlODhlMjhkMWZlYSIKLVNSQ19VUklbZGVyLTAuOC4wLnNoYTI1NnN1
bV0gPSAiNzFmZDg5NjYwYjJkYzY5OTcwNDA2NGU1OWU5ZGJhMDE0N2I5MDNlODUzMTk0MjllMTMx
NjIwZDAyMmJlNDExYiIKK1NSQ19VUklbZGVyLTAuOC4zLnNoYTI1NnN1bV0gPSAiNmE5OTZhMTA4
ZmViOGI0MjdhNmUxMmZjZjZhZjRhYTgzNDA5Yjc5ZDcyYzE1MzM3ZDc3NDEzNjgxMzFlZTAwNCIK
IFNSQ19VUklbZGVyYW5nZWQtMC41Ljguc2hhMjU2c3VtXSA9ICI3Y2Q4MTJjYzJiYzFkNjlkNDc2
NGJkODBkZjg4YjQzMTdlYWVmOWU3NzNjNzUyMjY0MDdkOWJjMDg3NmIyMTFjIgogU1JDX1VSSVtk
aWFsb2d1ZXItMC4xMi4wLnNoYTI1NnN1bV0gPSAiMjVmMTA0YjUwMWJmMjM2NGU3OGQwZDM5NzRj
YmM3NzRmNzM4ZjU4NjUzMDZlZDEyOGUxZTBkNzQ5OWMwYWQ5NiIKIFNSQ19VUklbZGlmZi0wLjEu
MTMuc2hhMjU2c3VtXSA9ICI1NjI1NDk4Njc3NWUzMjMzZmZhOWM0ZDdkM2ZhYWY2ZDM2YTJjMDlk
MzBiMjA2ODdlOWY4OGJjOGJhZmMxNmM4IgpAQCAtNjUzLDEwICs2NTUsMTAgQEAgU1JDX1VSSVts
aXRlbWFwLTAuOC4yLnNoYTI1NnN1bV0gPSAiOTJkYWY0NDM1MjVjNGNjZTY3YjE1MDQwMGJjMjMx
NjA3NjEwMGNlMGIzNjgKIFNSQ19VUklbbGl0cnMtMS4wLjAuc2hhMjU2c3VtXSA9ICIxMWQzZDdm
MjQzZDVjNWE4YjliYjVkNmRkMmIxNjAyYzBjYjBiOWRiMTYyMWJhZmM3ZWQ2NmUzNWZmOWZlMDky
IgogU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTQuc2hhMjU2c3VtXSA9ICIyMjQzOTllNzRiODdiNWYz
NTU3NTExZDk4ZGZmOGIxNDA4OWIzZGFkYWZjYWI2YmI5M2VhYjY3ZDNhYWNlOTY1IgogU1JDX1VS
SVtsb2ctMC40LjI5LnNoYTI1NnN1bV0gPSAiNWU1MDMyZTI0MDE5MDQ1Yzc2MmQzYzBmMjhmNWI2
YjhiYmYzODU2M2E2NTkwODM4OWJmNzk3ODc1ODkyMDg5NyIKLVNSQ19VUklbbHptYS1ydXN0Mi0w
LjE2LjIuc2hhMjU2c3VtXSA9ICI0N2JiMWU5ODhlNmZiNzc5Y2Y3MjBhZDQzMTI0MmQzZjAzMTY3
YzFiM2YyYjFhYWU3ZjFhOTRiMjQ5NWIzNmFlIgorU1JDX1VSSVtsem1hLXJ1c3QyLTAuMjMuMC5z
aGEyNTZzdW1dID0gImYxYzQ2ZjNmY2QyZTg4OGFmZGIwMWEwN2VmYzA3MWNiMjEzMDBlMDdjNjhk
MzJjM2U4YjAxYjVjOGNiMWZjYWEiCiBTUkNfVVJJW2x6bWEtc3lzLTAuMS4yMC5zaGEyNTZzdW1d
ID0gIjVmZGEwNGFiMzc2NGU2Y2RlNzhiOTk3NGVlYzRmNzc5YWNhYmE3YzRlODRiMzZlY2EzY2Y3
N2M1ODFiODVkMjciCiBTUkNfVVJJW2x6eGQtMC4yLjYuc2hhMjU2c3VtXSA9ICI3YjI5ZGZmYWI3
OTcyMThlMTJlNGRmMDhlZjVkMTVhYjllZmNhMjUwNDAzOGIxYjMyYjliMzJmYzg0NGIzOWM5Igot
U1JDX1VSSVttYWlscGFyc2UtMC4xNi4xLnNoYTI1NnN1bV0gPSAiNjA4MTlhOTdkZGNiODMxYTU2
MTRlYjNiMDE3NGYzNjIwZTc5M2U5N2UwOTE5NWEzOTViZmE5NDhmZDY4ZWQyZiIKK1NSQ19VUklb
bWFpbHBhcnNlLTAuMTguMC5zaGEyNTZzdW1dID0gIjA2OGQ0ZjVkMTA4Mzg4M2I5ZTYyNjA1MWRj
NWJkYWEzMjFmNWJlMDEwOTNlNjFhZGUzZWUzYWI0NGRhZmVhZGQiCiBTUkNfVVJJW21hdGNoZXJz
LTAuMi4wLnNoYTI1NnN1bV0gPSAiZDE1MjVhMmEyOGM3ZjRmYTBmYzk4YmI5MWFlNzU1ZDFlMmQx
NTA1MDc5ZTA1NTM5ZTM1YmM4NzZiNWQ2NWFlOSIKIFNSQ19VUklbbWVtY2hyLTIuOC4wLnNoYTI1
NnN1bV0gPSAiZjhjYTU4ZjQ0N2YwNmVkMTdkNWZjNDA0M2NlMWIxMGRkMjA1ZTA2MGZiM2NlNWI5
NzliOGVkOGU1OWZmM2Y3OSIKIFNSQ19VUklbbWVtbWFwMi0wLjkuMTEuc2hhMjU2c3VtXSA9ICJk
MTIxOWVkMWI3ZjIyOWVlNzEwNGQyODFkZDAxZDY4MDJmZTI4YmI2ZTk1ZDI5Mjk0MmM0ZGFhY2Rl
Yjc5OGMwIgpAQCAtNjY4LDcgKzY3MCw3IEBAIFNSQ19VUklbbWluaWppbmphLTIuMTkuMC5zaGEy
NTZzdW1dID0gIjgwNWJmZDczNTIxNjZiYWU4NTdlZTU2OTYyOGI1MmJjZDg1YTFjZWNmCiBTUkNf
VVJJW21pbml6X294aWRlLTAuOC45LnNoYTI1NnN1bV0gPSAiMWZhNzZhMmM4NmY3MDRiZGIyMjJk
NjY5NjVmYjNkNjMyNjljZTM4NTE4YjgzY2IwNTc1ZmNhODU1ZWJiNjMxNiIKIFNSQ19VUklbbXNp
LTAuMTAuMC5zaGEyNTZzdW1dID0gImIwMzI1Zjg0NzNlZjFmNWMzOGVlNDIzNDVlMmNkMTY3ODI5
OWNiYmZhMTY5ZDE3NzY2NTRhMmE2ODI4Njc0MjAiCiBTUkNfVVJJW25hdGl2ZS10bHMtMC4yLjE4
LnNoYTI1NnN1bV0gPSAiNDY1NTAwZTE0ZWExNjI0MjlkMjY0ZDQ0MTg5YWRjMzhiMTk5YjYyYjFj
MjFlZWE5ZjY5ZTRiNzNjYjAzYmJmMiIKLVNSQ19VUklbbml4LTAuMzEuMi5zaGEyNTZzdW1dID0g
IjVkNmQwNzA1MzIwYzFlNmJhMWQ5MTJiNWUzN2NmMTgwNzFiNmMyZTliN2ZhODIxNWExZThhNzY1
MTk2NmY1ZDMiCitTUkNfVVJJW25peC0wLjMxLjMuc2hhMjU2c3VtXSA9ICJjZjIwZDJmZGU4ZmYz
ODYzMmM0MjZmMTE2NWVkNzQzNjI3MGI0NGYxOTlmYzU1Mjg0YzM4Mjc2ZjlkYjQ3YzNkIgogU1JD
X1VSSVtub20tOC4wLjAuc2hhMjU2c3VtXSA9ICJkZjk3NjE3NzU4NzFiZGVmODNiZWU1MzBlNjAw
NTBmN2U1NGIxMTA1MzUwZDY4ODRlYjBmYjRmNDZjMmY5NDA1IgogU1JDX1VSSVtub3JtYWxpemUt
bGluZS1lbmRpbmdzLTAuMy4wLnNoYTI1NnN1bV0gPSAiNjE4MDdmNzc4MDJmZjMwOTc1ZTAxZjRm
MDcxYzhiYTEwYzAyMjA1MmY5OGIzMjk0MTE5ZjNlNjE1ZDEzZTViZSIKIFNSQ19VUklbbm9ybXBh
dGgtMS41LjAuc2hhMjU2c3VtXSA9ICJiZjIzYWIyYjkwNTY1NGI0Y2IxNzdlMzBiNjI5OTM3YjM4
NjgzMTFkNGUxY2JhODU5Zjg5OWMwNDEwNDZlNjliIgpAQCAtNzEyLDkgKzcxNCw5IEBAIFNSQ19V
UklbcHJvYy1tYWNyby1jcmF0ZS0zLjUuMC5zaGEyNTZzdW1dID0gImU2N2JhN2U5YjJiNTY0NDZm
MWQ0MTliMWQ4MDc5MDYyNzhmCiBTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4xMDYuc2hhMjU2c3Vt
XSA9ICI4ZmQwMGYwYmIyZTkwZDgxZDEwNDRjMmIzMjYxN2Y2OGZjYjlmYTNiYjc2NDBjMjNlOWM3
NDhlNTNmYjMwOTM0IgogU1JDX1VSSVtwc20tMC4xLjMwLnNoYTI1NnN1bV0gPSAiMzg1Mjc2NjQ2
N2RmNjM0ZDc0ZjBiMmQ3ODE5YmY4ZGM0ODNhMGViMmUzYjBmNTBmNzU2ZjljZmU4YjBkMThkOCIK
IFNSQ19VUklbcHVybC0wLjEuNi5zaGEyNTZzdW1dID0gIjYwZWJlNDI2MmFlOTFkZGQyOGM4NzIx
MTExYTBhNmU5ZTU4ODYwZTIxMWZjOTIxMTZjNGJiODVjOThmZDk2YWQiCi1TUkNfVVJJW3B5bzMt
aW50cm9zcGVjdGlvbi0wLjI5LjAuc2hhMjU2c3VtXSA9ICI3Nzc1ZmNjODc1YWNkY2UzODcyZGNi
OTFhNGI3YmQxNTVmZmJhNmUwZWE4YmU4OGI4Y2FhYjdkMGIzNDUzOWE2IgorU1JDX1VSSVtweW8z
LWludHJvc3BlY3Rpb24tMC4zMC4xLnNoYTI1NnN1bV0gPSAiM2IyYWMzMGYxMjhlNmFiNGNhMWM0
NjRkNmVhYmQzMGM4NGM3YWRjNTk1NWMzYmIyZWI3ZDIwM2VhMjRlYmQxOCIKIFNSQ19VUklbcHlw
cm9qZWN0LXRvbWwtMC4xMy43LnNoYTI1NnN1bV0gPSAiZjZkNzU1NDgzYWQxNGI0OWU3NjcxM2I1
MjI4NTIzNTQ2MWE1YjRmNzNmMTc2MTIzNTNlMTFhNWRlMzZhNWZkMiIKLVNSQ19VUklbcHl0aG9u
LXBrZ2luZm8tMC42Ljguc2hhMjU2c3VtXSA9ICIyMjlmZTQ3NjQ3ZDY2MDJiOWIwOTM0YjIxZmFi
OGFlY2UxYzVhNWFlYjBhOTM0MTk2YTE0MzU1ZmVjNjU2NjIzIgorU1JDX1VSSVtweXRob24tcGtn
aW5mby0wLjcuMC5zaGEyNTZzdW1dID0gImFkMGYwMWMyOWUzYWY5ZjI4ZjVjZmVlOWJjZDU5OWQ4
MDMxYjhjYmE0MGVjZWQ4YTlhZTdhYTJkMmU1YjczNWMiCiBTUkNfVVJJW3F1b3RlLTEuMC40NS5z
aGEyNTZzdW1dID0gIjQxZjI2MTk5NjYwNTA2ODkzODJkMmI0NGY2NjRmNGJjNTkzZTEyOTc4NWEz
NmQ2ZWUzNzZkZGYzNzI1OWI5MjQiCiBTUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjIuc2hh
MjU2c3VtXSA9ICI0NzhlMDU4NTY1OWExMjJhYTQwN2ViN2UzYzBlMWZhNTFiMWQ4YTg3MDAzOGJk
MjlmMGNmNGE4NTUxZWVhOTcyIgogU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0gIjY5
Y2RiMzRjMTU4Y2ViMjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2YzNDY3
NTRiMGYiCkBAIC03NDMsMTIgKzc0NSwxMiBAQCBTUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjIuc2hh
MjU2c3VtXSA9ICI5NDMwMGFiZjNmMWFlMmUyYjhmZmI3YjU4MDQzZGUzZDM5OWM3M2ZhNgogU1JD
X1VSSVtydXN0Y192ZXJzaW9uLTAuNC4xLnNoYTI1NnN1bV0gPSAiY2ZjYjNhMjJlZjQ2ZTg1YjQ1
ZGU2ZWU3ZTc5ZDA2MzMxOWViYjY1OTRmYWFmY2YxYzIyNWVhOTJhYjZlOWI5MiIKIFNSQ19VUklb
cnVzdGZsYWdzLTAuMS43LnNoYTI1NnN1bV0gPSAiYTM5ZTBlOTEzNWQ3YTcyMDhlZTgwYWE0ZTNl
NGI4OGYwZjVhZDdiZTkyMTUzZWQ3MDY4NmMzOGEwM2RiMmU2MyIKIFNSQ19VUklbcnVzdGl4LTEu
MS41LnNoYTI1NnN1bV0gPSAiODkxZWZhYmFiZTQxODY3MDc3NWYxOTlmMGQyMzNkODQ4NDNjMjI3
YTA5NDlhODgzY2UxNWIzN2M3OGQ2NjI5ZCIKLVNSQ19VUklbcnVzdGxzLTAuMjMuMzguc2hhMjU2
c3VtXSA9ICI2OWY5NDY2ZmIyYzE0ZWEwNDM1N2U5MTQxM2VmYjg4MmUyYTZkNGE0MDZlNjI1NDQ5
YmMwYTVkMzYwZDUzYTIxIgorU1JDX1VSSVtydXN0bHMtMC4yMy40Ni5zaGEyNTZzdW1dID0gIjQ4
ZTEzYmQ4YzBlOTM2NWM0M2NmYTVjOWU4ZjlhZDQ5ZDNjODQ0NDkyNmM5YWFjODE5ZTBlNGRjNTAz
YzhmZGYiCiBTUkNfVVJJW3J1c3Rscy1uYXRpdmUtY2VydHMtMC44LjMuc2hhMjU2c3VtXSA9ICI2
MTI0NjBkNWY3YmVhNTQwYzQ5MGIyYjYzOTVkOGUzNGE5NTNlNTJiNDkxYWNjZDZjODZjODE2NGM1
OTMyYTYzIgogU1JDX1VSSVtydXN0bHMtcGtpLXR5cGVzLTEuMTQuMC5zaGEyNTZzdW1dID0gImJl
MDQwZjhiMGEyMjVlNDAzNzU4MjJhNTYzZmE5NTI0Mzc4YjlkNjMxMTJmNTNlMTlmZmZmMzRkZjVk
MzNmZGQiCiBTUkNfVVJJW3J1c3Rscy1wbGF0Zm9ybS12ZXJpZmllci0wLjYuMi5zaGEyNTZzdW1d
ID0gIjFkOTlmZWViYzcyYmFlN2FiNzZiYTk5NGJiNWUxMjFiOGQ4M2Q5MTBjYTQwYjM2ZTA5MjFm
NTNiZWNjNDE3ODQiCiBTUkNfVVJJW3J1c3Rscy1wbGF0Zm9ybS12ZXJpZmllci1hbmRyb2lkLTAu
MS4xLnNoYTI1NnN1bV0gPSAiZjg3MTY1ZjA5OTVmNjNhOWZiZWVhNjJiNjRkMTBiNGQ5ZDhlNzhl
YzZkN2Q1MWZiMjEyNWZkYTdiYjM2Nzg4ZiIKLVNSQ19VUklbcnVzdGxzLXdlYnBraS0wLjEwMy4x
My5zaGEyNTZzdW1dID0gIjYxYzQyOWE4NjQ5ZjExMGRkZGVmNjVlMmE1YWQyNDBmNzQ3ZTg1Zjc3
NThhNmJjY2M3ZTU3NzdiZDMzZjc1NmUiCitTUkNfVVJJW3J1c3Rscy13ZWJwa2ktMC4xMDMuMTYu
c2hhMjU2c3VtXSA9ICI0NDQzYjFiNmQzOWQ3YzY2MzEzOTk0MmNjNDU1ODI2MjU2MmQyYzg0MTIz
YmI2MjgyZWYxNzcwMDljYThiMjgxIgogU1JDX1VSSVtydXN0dmVyc2lvbi0xLjAuMjIuc2hhMjU2
c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0NDUyNWM4NGNjYjU0YTAyOTk2MWE4MjE1Zjk2MTk3NTM2
MzVhOWMwZDI1MzhkNDZkIgogU1JDX1VSSVtydXpzdGQtMC44LjIuc2hhMjU2c3VtXSA9ICJlNWZm
MGNjNWUxMzVjODg3MGE3NzVkMzMyMDkxMGNkOWI1NjRlYzAzNmI0ZGMwYjg3NDE2MjkwMjBiZTYz
ZjAxIgogU1JDX1VSSVtzYW1lLWZpbGUtMS4wLjYuc2hhMjU2c3VtXSA9ICI5M2ZjMWRjM2FhYTli
ZmVkOTVlMDJlNmVhZGFiYjRiYWY3ZTMwNzhiMGJkMWI0ZDdiNmIwYjY4Mzc4OTAwNTAyIgpAQCAt
ODMxLDYgKzgzMyw3IEBAIFNSQ19VUklbdHJhY2luZy1zdWJzY3JpYmVyLTAuMy4yMy5zaGEyNTZz
dW1dID0gImNiN2Y1NzhlNTk0NWZiMjQyNTM4OTY1YzJkMGIwNDQxCiBTUkNfVVJJW3RyeWNtZC0x
LjIuMC5zaGEyNTZzdW1dID0gIjIxODg4OTk5M2Y3NmJkYTliMmVmNTdjMTJjM2NhYjBlZWY0ZmQ1
NGVjN2IzNmQxNzA0ODQ5ODY3ZjY5ZTdiYjQiCiBTUkNfVVJJW3R3b3gtaGFzaC0yLjEuMi5zaGEy
NTZzdW1dID0gIjllYTMxMzZiNjc1NTQ3Mzc5YzRiZDM5NWNhNmI5MzhlNWFkM2MzZDIwZmFkNzZl
N2ZlODVmOWUwZDAxMTQxOWMiCiBTUkNfVVJJW3R5cGVkLXBhdGgtMC4xMi4zLnNoYTI1NnN1bV0g
PSAiOGUyOGY4OWI4MGM4N2I4ZmIwY2YwNGFiNDQ4ZDVkZDBkZDBhZGUyZjg4OTFiYWU4NzhkZTY2
YTc1YTI4NjAwZSIKK1NSQ19VUklbdHlwZWQtcGF0aC0wLjEzLjAuc2hhMjU2c3VtXSA9ICI5Y2U4
OTg4MjNkOGNkMGYwMjg2NjJkMmYzNDk2OTRiMWFmMGE1Y2M5YmU4M2YxZDIxM2EwMGQzMTQ3NDQ1
ZTFlIgogU1JDX1VSSVt0eXBlbnVtLTEuMjAuMC5zaGEyNTZzdW1dID0gIjQwY2UxMDJhYjY3NzAx
Yjg1MjZjMTIzYzFiYWI1Y2JlNDJkNzA0MGNjZmQwZjY0YWYxYTM4NTgwOGQyZjQzZGUiCiBTUkNf
VVJJW3VuaWNhc2UtMi45LjAuc2hhMjU2c3VtXSA9ICJkYmM0YmMzYTlmNzQ2ZDg2MmM0NWNiODlk
NzA1YWExMGYxODdiYjk2Yzc2MDAxYWZhYjA3YTBkMzVjZTYwMTQyIgogU1JDX1VSSVt1bmljb2Rl
LWlkZW50LTEuMC4yNC5zaGEyNTZzdW1dID0gImU2ZTQzMTNjZDVmY2QzZGFkNWNhZmExNzk3MDJl
MmIyNDRmNzYwOTkxZjQ1Mzk3ZDE0ZDRlYmYzODI0N2RhNzUiCkBAIC04NjgsOCArODcxLDggQEAg
U1JDX1VSSVt3YXNtLWVuY29kZXItMC4yNDQuMC5zaGEyNTZzdW1dID0gIjk5MDA2NWYyZmU2MzAw
M2ZlMzM3YjkzMmNmYjVlM2I4MGUwYjQKIFNSQ19VUklbd2FzbS1tZXRhZGF0YS0wLjI0NC4wLnNo
YTI1NnN1bV0gPSAiYmIwZTM1M2U2YTJmYmRjMTc2OTMyYmJhYWI0OTM3NjJlYjEyNTVhNzkwMGZl
MGZlYTFhMmY5NmMyOTZjYzkwOSIKIFNSQ19VUklbd2FzbXBhcnNlci0wLjI0NC4wLnNoYTI1NnN1
bV0gPSAiNDdiODA3YzcyZTFiYWM2OTM4MmIzYTZmYjNkYmU4ZWE0YzBlZDg3ZmY1NjI5Yjg2ODVh
ZTZiOWE2MTEwMjhmZSIKIFNSQ19VUklbd2ViLXRpbWUtMS4xLjAuc2hhMjU2c3VtXSA9ICI1YTY1
ODBmMzA4YjFmYWQ5MjA3NjE4MDg3YTY1YzA0ZTdhMTBiYzc3ZTAyYzhlODRlOWIwMGRkNGIxMmZh
MGJiIgotU1JDX1VSSVt3ZWJwa2ktcm9vdC1jZXJ0cy0xLjAuNy5zaGEyNTZzdW1dID0gImYzMTE0
MWNlM2ZjM2UzMDBhZTg5Yjc4YzBkZDY3Zjk3MDgwNjFkMWQyZWRhNTRiODIwOTM0NmZkNmJlOWE5
MmMiCi1TUkNfVVJJW3dlYnBraS1yb290cy0xLjAuNy5zaGEyNTZzdW1dID0gIjUyZjVlZTQ0Yzk2
Y2Y1NWYxYjM0OTYwMDc2OGUzZWNlM2E4ZjI2MDEwYzA1MjY1YWI3M2Y5NDViYjFhMmViOWQiCitT
UkNfVVJJW3dlYnBraS1yb290LWNlcnRzLTEuMC4xMC5zaGEyNTZzdW1dID0gIjU4ZWM4MGU3M2Zk
OGJhZjU3YmYwZDk2MTU1NTRjNzUzNDhiZGE5OTBkNmQ1YmJlYWI5NjRkZDA2ODMxOWZlY2IiCitT
UkNfVVJJW3dlYnBraS1yb290cy0xLjAuMTAuc2hhMjU2c3VtXSA9ICIxYzFjOGUyMGM4YTM4ZmM3
ZDY1YWJmZTc0ZWI3MjgwZTRhYTY2N2U4ZWVjOGJjODQ5OTZkMjg3NDgxMDc0OGQ5IgogU1JDX1VS
SVt3aGljaC04LjAuMi5zaGEyNTZzdW1dID0gIjgxOTk1ZmFmYWFhZjZhZTQ3YTdkMGNjODNjNjdj
YWY5MmFlYjdlNTMzMTY1MGFlNmZmODU2ZjdjMGM2MGM0NTkiCiBTUkNfVVJJW3dpbGQtMi4yLjEu
c2hhMjU2c3VtXSA9ICJhMzEzMWFmYzhjNTc1MjgxZTFlODBmMzZlZDZhMDkyYWE1MDJjMDhiMThl
ZDc1MjRlODZmYmJiMTJiYjQxMGUxIgogU1JDX1VSSVt3aW5hcGktMC4zLjkuc2hhMjU2c3VtXSA9
ICI1YzgzOWE2NzRmY2Q3YTk4OTUyZTU5MzI0MmVhNDAwYWJlOTM5OTI3NDY3NjFlMzg2NDE0MDVk
MjhiMDBmNDE5IgpAQCAtOTQxLDEwICs5NDQsMTEgQEAgU1JDX1VSSVt6ZXJvaXplLTEuOC4yLnNo
YTI1NnN1bV0gPSAiYjk3MTU0ZTY3ZTMyYzg1NDY1ODI2ZThiY2MxYzU5NDI5YWFhZjEwN2MxZTQK
IFNSQ19VUklbemVyb3RyaWUtMC4yLjQuc2hhMjU2c3VtXSA9ICIwZjkxNTJkMzFkYjA3OTJmYTgz
ZjcwZmIyZjgzMTQ4ZWZmYjVjMWY1YjhjNzY4NmMzNDU5ZTM2MWQ5YmMyMGJmIgogU1JDX1VSSVt6
ZXJvdmVjLTAuMTEuNi5zaGEyNTZzdW1dID0gIjkwZjkxMWNiYzM1OWFiNmFmMTczNzdkMjQyMjI1
ZjRkNzUxMTlhZWM4N2VhNzExYTg4MDk4N2IxOGNkN2IyMzkiCiBTUkNfVVJJW3plcm92ZWMtZGVy
aXZlLTAuMTEuMy5zaGEyNTZzdW1dID0gIjYyNWRjNDI1Y2FiMGRjYTZkYzNjMzMxOTUwNmU2NTkz
ZGNiMDhhOWYzODdlYTNiMjg0ZGJkNTJhOTJjNDA1NTUiCi1TUkNfVVJJW3ppcC04LjUuMS5zaGEy
NTZzdW1dID0gImRjYWI5ODFlMTk2MzNlYmNmMGIwMDFkZGQzN2RkODAyOTk2MDk4YmMxODY0Zjkw
YjdjNWQ5NzBjZTc2YzFkNTkiCitTUkNfVVJJW3ppcC04LjYuMC5zaGEyNTZzdW1dID0gIjJkMDRh
NmI1MzgxNTAyYWE2MDg3Yzk0YzY2OTQ5OWViMTYwMmViOWM1ZTgxOThlNTM0ZGU1NzFmNzE1NDgw
OWIiCitTUkNfVVJJW3ppcC05LjEuMy5zaGEyNTZzdW1dID0gIjExNTZiMzlkMTQyYTM0Yjk5OWMy
MzEwYTUwNDU1ZTBjYjM3NjBiZjdlZmFkMDEyMmY3OTZkODEzYmVlMjZjY2IiCiBTUkNfVVJJW3ps
aWItcnMtMC42LjMuc2hhMjU2c3VtXSA9ICIzYmUzZDQwZTQwYTEzM2Y5YzkxNmVlM2Y5ZjRmYTJk
OWQ2MzQzNWI1ZmJlMWJmYzZkOWRhZTBhYTBhZGExNTEzIgogU1JDX1VSSVt6bWlqLTEuMC4yMS5z
aGEyNTZzdW1dID0gImI4ODQ4ZWU2N2VjYzhhZWRiYWYzZTQxMjIyMTdhZmY4OTI2MzkyMzFiZWZj
NmExYjU4ZDI5ZmZmNGMyY2FiYWEiCiBTUkNfVVJJW3pvcGZsaS0wLjguMy5zaGEyNTZzdW1dID0g
ImYwNWNkODc5N2Q2Mzg2NTQyNWZmODliNWM0YTQ4ODA0ZjM1YmEwY2U4ZDEyNTgwMDAyN2FkNjAx
N2QyYjUyNDkiCi1TUkNfVVJJW3pzdGQtMC4xMy4zLnNoYTI1NnN1bV0gPSAiZTkxZWUzMTFhNTY5
YzMyNzE3MTY1MTU2NmUwNzk3MjIwMGU3NmZjZmUyMjQyYTRmYTQ0NjE0OWEzODgxYzA4YSIKLVNS
Q19VUklbenN0ZC1zYWZlLTcuMi40LnNoYTI1NnN1bV0gPSAiOGY0OWM0ZDVmMGFiYjYwMmE5M2Zi
ODczNmFmMmE0ZjRkZDk1MTJlMzZmN2Y1NzBkNjZlNjVmZjg2N2VkM2I5ZCIKLVNSQ19VUklbenN0
ZC1zeXMtMi4wLjE2K3pzdGQuMS41Ljcuc2hhMjU2c3VtXSA9ICI5MWUxOWViYzJhZGM4ZjgzZTQz
MDM5ZTc5Nzc2ZTNmZGE4Y2E5MTkxMzJkNjhhMWZlZDZhNWZhY2EyNjgzNzQ4IgorU1JDX1VSSVt6
c3RkLTAuMTQuMy5zaGEyNTZzdW1dID0gImRiM2FlOWJmOTBhZjZlNDAxOTdiZWY3NjdlZWVmYzQ2
YWQ2Mzk3NDIwZmU4NzM4MzBiZDg1ZTVmYmJmYjNjNzAiCitTUkNfVVJJW3pzdGQtc2FmZS04LjIu
MC5zaGEyNTZzdW1dID0gImRlZDUyMGYxNmIyOWUxYTliNzcxYzcyMjIyMWIyYjBhMDM5OGMyMzE2
ZDliYjNjNDJiNDU4YTU0MTRkNzQzNGIiCitTUkNfVVJJW3pzdGQtc3lzLTIuMS4yK3pzdGQuMS41
Ljcuc2hhMjU2c3VtXSA9ICI0ODFhZGE5YzU0M2IyMzIzY2JiN2JiZGJiNTI0OTE3N2ZiZjAxODhl
ZDk1OWVkMmMxNWU0YjIyNDIxYzg0ZWQzIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4vMDAwMS1DYXJnby5sb2NrLVVwZGF0ZS1ydXN0aXgt
dG8tMS4xLjUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0
dXJpbi8wMDAxLUNhcmdvLmxvY2stVXBkYXRlLXJ1c3RpeC10by0xLjEuNS5wYXRjaAppbmRleCA2
NzVjYzBjN2JiLi5jNmJlNjU1MzE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLUNhcmdvLmxvY2stVXBkYXRlLXJ1c3RpeC10by0x
LjEuNS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0
dXJpbi8wMDAxLUNhcmdvLmxvY2stVXBkYXRlLXJ1c3RpeC10by0xLjEuNS5wYXRjaApAQCAtMSwz
ICsxLDQgQEAKK0Zyb20gZTE3NDhiZjg3YzZkM2JlMmExNjVlYmJmM2E3OGIzMWQ4MmU4MTc2NiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVh
bGNvbW0uY29tPgogRGF0ZTogVGh1LCAyMiBPY3QgMjAyNiAxNzowMDowMCAtMDcwMAogU3ViamVj
dDogW1BBVENIXSBDYXJnby5sb2NrOiBVcGRhdGUgcnVzdGl4IHRvIDEuMS41CkBAIC0xOSw5ICsy
MCwxMSBAQCBydXN0aXggMS4xLjUgaW1wb3J0cyB0aGVtIGV4cGxpY2l0bHkgaW5zdGVhZCBbMV0u
IFVwZGF0ZSBpdCB3aXRoCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRo
dWIuY29tL1B5TzMvbWF0dXJpbi9wdWxsLzMzNDRdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KIC0tLQotIENhcmdvLmxvY2sgfCAyOCArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQorIENhcmdvLmxvY2sgfCAyNCArKysrKysrKysrKystLS0tLS0tLS0t
LS0KKyAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiAK
K2RpZmYgLS1naXQgYS9DYXJnby5sb2NrIGIvQ2FyZ28ubG9jaworaW5kZXggOGI4OTg0Yi4uMGEz
NjIyZCAxMDA2NDQKIC0tLSBhL0NhcmdvLmxvY2sKICsrKyBiL0NhcmdvLmxvY2sKIEBAIC01OSw3
ICs1OSw3IEBAIHZlcnNpb24gPSAiMS4xLjUiCkBAIC00Miw3ICs0NSw3IEBAIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogIF0KICAKICBbW3BhY2th
Z2VdXQotQEAgLTg3OSw3ICs4NzksNyBAQCBkZXBlbmRlbmNpZXMgPSBbCitAQCAtODgwLDcgKzg4
MCw3IEBAIGRlcGVuZGVuY2llcyA9IFsKICAgImxpYmMiLAogICAib3B0aW9uLWV4dCIsCiAgICJy
ZWRveF91c2VycyIsCkBAIC01MSw3ICs1NCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxr
aGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogIF0KICAKICBbW3BhY2thZ2VdXQotQEAgLTk2Nyw3
ICs5NjcsNyBAQCBzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFu
Zy9jcmF0ZXMuaW8taW5kZXgiCitAQCAtOTY4LDcgKzk2OCw3IEBAIHNvdXJjZSA9ICJyZWdpc3Ry
eStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKICBjaGVja3N1
bSA9ICIzOWNhYjcxNjE3YWUwZDYzZjUxYTM2ZDY5Zjg2NjM5MTczNWI1MTY5MWRiZGE2M2NmNmY5
NmQwNDJiNjNlZmViIgogIGRlcGVuZGVuY2llcyA9IFsKICAgImxpYmMiLApAQCAtNjAsNyArNjMs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4K
ICBdCiAgCiAgW1twYWNrYWdlXV0KLUBAIC0xNDc4LDcgKzE0NzgsNyBAQCBjaGVja3N1bSA9ICIz
NjQwYzFjMzhiOGU0ZTQzNTg0ZDhkZjE4YmU1ZmM2YjBhYTMxNGNlNmViZjUxYjUzMzEzZDQzMDZj
Y2E4ZTQ2IgorQEAgLTE0ODEsNyArMTQ4MSw3IEBAIGNoZWNrc3VtID0gIjM2NDBjMWMzOGI4ZTRl
NDM1ODRkOGRmMThiZTVmYzZiMGFhMzE0Y2U2ZWJmNTFiNTMzMTNkNDMwNmNjYThlNDYiCiAgZGVw
ZW5kZW5jaWVzID0gWwogICAiaGVybWl0LWFiaSIsCiAgICJsaWJjIiwKQEAgLTY5LDcgKzcyLDcg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiAg
XQogIAogIFtbcGFja2FnZV1dCi1AQCAtMTk2MSw3ICsxOTYxLDcgQEAgdmVyc2lvbiA9ICIwLjUw
LjMiCitAQCAtMTk2NCw3ICsxOTY0LDcgQEAgdmVyc2lvbiA9ICIwLjUwLjMiCiAgc291cmNlID0g
InJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4Igog
IGNoZWNrc3VtID0gIjc5NTdiOTc0MDc0NDg5MmYxMTQ5MzZhYjRhNTdiM2Y0ODc0OTFiYmVhZmFm
ODA4MzY4OGIxNjg0MWE0MjQwZTUiCiAgZGVwZW5kZW5jaWVzID0gWwpAQCAtNzgsNyArODEsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KICBd
CiAgCiAgW1twYWNrYWdlXV0KLUBAIC0yMDc5LDcgKzIwNzksNyBAQCBzb3VyY2UgPSAicmVnaXN0
cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitAQCAtMjA4
Miw3ICsyMDgyLDcgQEAgc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0
LWxhbmcvY3JhdGVzLmlvLWluZGV4IgogIGNoZWNrc3VtID0gIjdkOGZhZTg0YjQzMTM4NGI2ODYy
N2QwZjliM2IxMjQ1ZmNmOWY0NmY2YzBlM2RjOTAyZTlkY2U2NGVkZDE5NjciCiAgZGVwZW5kZW5j
aWVzID0gWwogICAibGliYyIsCkBAIC04NywxNyArOTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KICBdCiAgCiAgW1twYWNrYWdlXV0KLUBA
IC0yNjI5LDE1ICsyNjI5LDE1IEBAIGNoZWNrc3VtID0gImEzOWUwZTkxMzVkN2E3MjA4ZWU4MGFh
NGUzZTRiODhmMGY1YWQ3YmU5MjE1M2VkNzA2ODZjMzhhMDNkYjJlNjMiCi0gCi0gW1twYWNrYWdl
XV0KLSBuYW1lID0gInJ1c3RpeCIKLS12ZXJzaW9uID0gIjEuMS40IgotK3ZlcnNpb24gPSAiMS4x
LjUiCi0gc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3Jh
dGVzLmlvLWluZGV4IgotLWNoZWNrc3VtID0gImI2ZmU0NTY1Yjk1MThiODNlZjRmOTFiYjQ3Y2Uy
OTYyMGNhODI4YmQzMmNiN2U0MDhmMDA2MmU5OTMwYmExOTAiCi0rY2hlY2tzdW0gPSAiODkxZWZh
YmFiZTQxODY3MDc3NWYxOTlmMGQyMzNkODQ4NDNjMjI3YTA5NDlhODgzY2UxNWIzN2M3OGQ2NjI5
ZCIKLSBkZXBlbmRlbmNpZXMgPSBbCi0gICJiaXRmbGFncyIsCitAQCAtMjY0MCw3ICsyNjQwLDcg
QEAgZGVwZW5kZW5jaWVzID0gWwogICAiZXJybm8iLAogICAibGliYyIsCiAgICJsaW51eC1yYXct
c3lzIiwKQEAgLTEwNiw3ICs5OSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxraGVtLnJh
akBvc3MucXVhbGNvbW0uY29tPgogIF0KICAKICBbW3BhY2thZ2VdXQotQEAgLTI2OTQsNyArMjY5
NCw3IEBAIGRlcGVuZGVuY2llcyA9IFsKK0BAIC0yNjk3LDcgKzI2OTcsNyBAQCBkZXBlbmRlbmNp
ZXMgPSBbCiAgICJzZWN1cml0eS1mcmFtZXdvcmsgMy43LjAiLAogICAic2VjdXJpdHktZnJhbWV3
b3JrLXN5cyIsCiAgICJ3ZWJwa2ktcm9vdC1jZXJ0cyIsCkBAIC0xMTUsNyArMTA4LDcgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiAgXQogIAog
IFtbcGFja2FnZV1dCi1AQCAtMzE4NSw3ICszMTg1LDcgQEAgZGVwZW5kZW5jaWVzID0gWworQEAg
LTMxODgsNyArMzE4OCw3IEBAIGRlcGVuZGVuY2llcyA9IFsKICAgImdldHJhbmRvbSAwLjQuMiIs
CiAgICJvbmNlX2NlbGwiLAogICAicnVzdGl4IiwKQEAgLTEyNCw3ICsxMTcsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KICBdCiAgCiAgW1tw
YWNrYWdlXV0KLUBAIC0zMjA0LDcgKzMyMDQsNyBAQCBzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6
Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitAQCAtMzIwNyw3ICszMjA3
LDcgQEAgc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3Jh
dGVzLmlvLWluZGV4IgogIGNoZWNrc3VtID0gIjIzMGExYjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3
YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCiAgZGVwZW5kZW5jaWVzID0gWwog
ICAicnVzdGl4IiwKQEAgLTEzMyw3ICsxMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KICBdCiAgCiAgW1twYWNrYWdlXV0KLUBAIC0zOTIx
LDcgKzM5MjEsNyBAQCB2ZXJzaW9uID0gIjAuMS4xMSIKK0BAIC0zOTMwLDcgKzM5MzAsNyBAQCB2
ZXJzaW9uID0gIjAuMS4xMSIKICBzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29t
L3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCiAgY2hlY2tzdW0gPSAiYzJhN2IxYzAzYzg3NjEy
MmFhNDNmMzAyMGU2YzNjM2VlNWMwNTA4MWM5YTAwNzM5ZmFmNzUwM2FlYmExMGQyMiIKICBkZXBl
bmRlbmNpZXMgPSBbCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbl8xLjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbl8xLjE2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xNS4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjE2
LjAuYmIKaW5kZXggYTI5ZTI5YmRhOS4uOTA1ZGI0YTYxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xNS4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTYuMC5iYgpAQCAtNyw3
ICs3LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbGljZW5zZS1hcGFjaGU7bWQ1PTE4
MzZlZmIyZWI3Nzk5NjY2OTZmNDczZWU4NTQwNTQyIFwKIAogU1JDX1VSSSArPSAiZmlsZTovLzAw
MDEtQ2FyZ28ubG9jay1VcGRhdGUtcnVzdGl4LXRvLTEuMS41LnBhdGNoIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTRiMjZjYzhlOGFiYTYxYTVmMjA5OTcxNWZlNjQwZTE4YzVmNjc4ZTlhNTAw
NDA4YjM4NzYxMjYzOTU0MjI4YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxM2U2OWNhMTI1NDI5
OTlkOGM1NDY3MTMxZGU3MmE0OWJiNzZlNGMyODRiOWE0NWM1NzgzZGY3YzBmY2IzYThhIgogCiBT
ID0gIiR7VU5QQUNLRElSfS9tYXR1cmluLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============1873614873508686949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.15.0.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.16.0.dist-info

--===============1873614873508686949==--
