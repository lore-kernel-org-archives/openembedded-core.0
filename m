Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC8DC001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:14:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40634.1691428492130755056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ADAD1FB;
	Mon,  7 Aug 2023 10:15:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF7A13F59C;
	Mon,  7 Aug 2023 10:14:50 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] librsvg: upgrade to 2.56.3
Date: Mon,  7 Aug 2023 18:14:49 +0100
Message-Id: <20230807171449.4131632-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 17:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185614

From: Ross Burton <ross.burton@arm.com>

This includes the fix for CVE-2023-38633.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg-crates.inc | 414 +++++++++---------
 .../{librsvg_2.56.1.bb =3D> librsvg_2.56.3.bb}  |   2 +-
 2 files changed, 199 insertions(+), 217 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.56.1.bb =3D> librsvg_2.56.3=
.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg-crates.inc b/meta/recipes=
-gnome/librsvg/librsvg-crates.inc
index 8d790c32f83..5886f3dc935 100644
--- a/meta/recipes-gnome/librsvg/librsvg-crates.inc
+++ b/meta/recipes-gnome/librsvg/librsvg-crates.inc
@@ -3,16 +3,16 @@
 # from Cargo.lock
 SRC_URI +=3D " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/aho-corasick/1.0.1 \
+    crate://crates.io/aho-corasick/1.0.2 \
     crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
     crate://crates.io/anes/0.1.6 \
     crate://crates.io/anstream/0.3.2 \
-    crate://crates.io/anstyle/1.0.0 \
-    crate://crates.io/anstyle-parse/0.2.0 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
     crate://crates.io/anstyle-query/1.0.0 \
     crate://crates.io/anstyle-wincon/1.0.1 \
-    crate://crates.io/anyhow/1.0.71 \
+    crate://crates.io/anyhow/1.0.72 \
     crate://crates.io/approx/0.5.1 \
     crate://crates.io/assert_cmd/2.0.11 \
     crate://crates.io/atty/0.2.14 \
@@ -21,26 +21,27 @@ SRC_URI +=3D " \
     crate://crates.io/bit-set/0.5.3 \
     crate://crates.io/bit-vec/0.6.3 \
     crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
     crate://crates.io/block/0.1.6 \
-    crate://crates.io/bstr/1.5.0 \
+    crate://crates.io/bstr/1.6.0 \
     crate://crates.io/bumpalo/3.13.0 \
     crate://crates.io/bytemuck/1.13.1 \
     crate://crates.io/byteorder/1.4.3 \
-    crate://crates.io/cairo-rs/0.17.0 \
-    crate://crates.io/cairo-sys-rs/0.17.0 \
+    crate://crates.io/cairo-rs/0.17.10 \
+    crate://crates.io/cairo-sys-rs/0.17.10 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/cc/1.0.79 \
-    crate://crates.io/cfg-expr/0.15.1 \
+    crate://crates.io/cfg-expr/0.15.3 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.25 \
+    crate://crates.io/chrono/0.4.26 \
     crate://crates.io/ciborium/0.2.1 \
     crate://crates.io/ciborium-io/0.2.1 \
     crate://crates.io/ciborium-ll/0.2.1 \
     crate://crates.io/clap/3.2.25 \
-    crate://crates.io/clap/4.3.0 \
-    crate://crates.io/clap_builder/4.3.0 \
-    crate://crates.io/clap_complete/4.3.0 \
-    crate://crates.io/clap_derive/4.3.0 \
+    crate://crates.io/clap/4.3.17 \
+    crate://crates.io/clap_builder/4.3.17 \
+    crate://crates.io/clap_complete/4.3.2 \
+    crate://crates.io/clap_derive/4.3.12 \
     crate://crates.io/clap_lex/0.2.4 \
     crate://crates.io/clap_lex/0.5.0 \
     crate://crates.io/colorchoice/1.0.0 \
@@ -53,18 +54,18 @@ SRC_URI +=3D " \
     crate://crates.io/criterion-plot/0.5.0 \
     crate://crates.io/crossbeam-channel/0.5.8 \
     crate://crates.io/crossbeam-deque/0.8.3 \
-    crate://crates.io/crossbeam-epoch/0.9.14 \
-    crate://crates.io/crossbeam-utils/0.8.15 \
+    crate://crates.io/crossbeam-epoch/0.9.15 \
+    crate://crates.io/crossbeam-utils/0.8.16 \
     crate://crates.io/cssparser/0.29.6 \
-    crate://crates.io/cssparser-macros/0.6.0 \
+    crate://crates.io/cssparser-macros/0.6.1 \
     crate://crates.io/data-url/0.2.0 \
     crate://crates.io/derive_more/0.99.17 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/discard/1.0.4 \
-    crate://crates.io/dlib/0.5.0 \
+    crate://crates.io/dlib/0.5.2 \
     crate://crates.io/doc-comment/0.3.3 \
-    crate://crates.io/dtoa/0.4.8 \
-    crate://crates.io/dtoa-short/0.3.3 \
+    crate://crates.io/dtoa/1.0.9 \
+    crate://crates.io/dtoa-short/0.3.4 \
     crate://crates.io/either/1.8.1 \
     crate://crates.io/encoding/0.2.33 \
     crate://crates.io/encoding-index-japanese/1.20141219.5 \
@@ -74,14 +75,15 @@ SRC_URI +=3D " \
     crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
     crate://crates.io/encoding_index_tests/0.1.4 \
     crate://crates.io/encoding_rs/0.8.32 \
+    crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/errno/0.3.1 \
     crate://crates.io/errno-dragonfly/0.1.2 \
-    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/fastrand/2.0.0 \
     crate://crates.io/fdeflate/0.3.0 \
     crate://crates.io/flate2/1.0.26 \
     crate://crates.io/float-cmp/0.9.0 \
     crate://crates.io/fnv/1.0.7 \
-    crate://crates.io/form_urlencoded/1.1.0 \
+    crate://crates.io/form_urlencoded/1.2.0 \
     crate://crates.io/futf/0.1.5 \
     crate://crates.io/futures-channel/0.3.28 \
     crate://crates.io/futures-core/0.3.28 \
@@ -91,42 +93,41 @@ SRC_URI +=3D " \
     crate://crates.io/futures-task/0.3.28 \
     crate://crates.io/futures-util/0.3.28 \
     crate://crates.io/fxhash/0.2.1 \
-    crate://crates.io/gdk-pixbuf/0.17.0 \
-    crate://crates.io/gdk-pixbuf-sys/0.17.0 \
+    crate://crates.io/gdk-pixbuf/0.17.10 \
+    crate://crates.io/gdk-pixbuf-sys/0.17.10 \
     crate://crates.io/getrandom/0.1.16 \
-    crate://crates.io/getrandom/0.2.9 \
-    crate://crates.io/gio/0.17.9 \
-    crate://crates.io/gio-sys/0.17.4 \
-    crate://crates.io/glib/0.17.9 \
-    crate://crates.io/glib-macros/0.17.9 \
-    crate://crates.io/glib-sys/0.17.4 \
-    crate://crates.io/gobject-sys/0.17.4 \
+    crate://crates.io/getrandom/0.2.10 \
+    crate://crates.io/gio/0.17.10 \
+    crate://crates.io/gio-sys/0.17.10 \
+    crate://crates.io/glib/0.17.10 \
+    crate://crates.io/glib-macros/0.17.10 \
+    crate://crates.io/glib-sys/0.17.10 \
+    crate://crates.io/gobject-sys/0.17.10 \
     crate://crates.io/half/1.8.2 \
     crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.14.0 \
     crate://crates.io/heck/0.4.1 \
     crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.2.6 \
-    crate://crates.io/hermit-abi/0.3.1 \
-    crate://crates.io/iana-time-zone/0.1.56 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/iana-time-zone/0.1.57 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/idna/0.3.0 \
+    crate://crates.io/idna/0.4.0 \
     crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/io-lifetimes/1.0.11 \
-    crate://crates.io/is-terminal/0.4.7 \
+    crate://crates.io/indexmap/2.0.0 \
+    crate://crates.io/is-terminal/0.4.9 \
     crate://crates.io/itertools/0.10.5 \
-    crate://crates.io/itoa/1.0.6 \
-    crate://crates.io/js-sys/0.3.63 \
+    crate://crates.io/itoa/1.0.9 \
+    crate://crates.io/js-sys/0.3.64 \
     crate://crates.io/language-tags/0.3.2 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.144 \
-    crate://crates.io/libloading/0.7.4 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/libloading/0.8.0 \
     crate://crates.io/libm/0.2.7 \
     crate://crates.io/linked-hash-map/0.5.6 \
-    crate://crates.io/linux-raw-sys/0.3.8 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
     crate://crates.io/locale_config/0.3.0 \
-    crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/log/0.4.18 \
+    crate://crates.io/lock_api/0.4.10 \
+    crate://crates.io/log/0.4.19 \
     crate://crates.io/lopdf/0.29.0 \
     crate://crates.io/mac/0.1.1 \
     crate://crates.io/malloc_buf/0.0.6 \
@@ -134,10 +135,10 @@ SRC_URI +=3D " \
     crate://crates.io/matches/0.1.10 \
     crate://crates.io/matrixmultiply/0.3.7 \
     crate://crates.io/memchr/2.5.0 \
-    crate://crates.io/memoffset/0.8.0 \
+    crate://crates.io/memoffset/0.9.0 \
     crate://crates.io/miniz_oxide/0.7.1 \
-    crate://crates.io/nalgebra/0.32.2 \
-    crate://crates.io/nalgebra-macros/0.2.0 \
+    crate://crates.io/nalgebra/0.32.3 \
+    crate://crates.io/nalgebra-macros/0.2.1 \
     crate://crates.io/new_debug_unreachable/1.0.4 \
     crate://crates.io/nodrop/0.1.14 \
     crate://crates.io/normalize-line-endings/0.3.0 \
@@ -145,21 +146,21 @@ SRC_URI +=3D " \
     crate://crates.io/num-integer/0.1.45 \
     crate://crates.io/num-rational/0.4.1 \
     crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/num_cpus/1.15.0 \
+    crate://crates.io/num_cpus/1.16.0 \
     crate://crates.io/objc/0.2.7 \
     crate://crates.io/objc-foundation/0.1.1 \
     crate://crates.io/objc_id/0.1.1 \
-    crate://crates.io/once_cell/1.17.2 \
+    crate://crates.io/once_cell/1.18.0 \
     crate://crates.io/oorandom/11.1.3 \
-    crate://crates.io/os_str_bytes/6.5.0 \
-    crate://crates.io/pango/0.17.4 \
-    crate://crates.io/pango-sys/0.17.0 \
-    crate://crates.io/pangocairo/0.17.0 \
-    crate://crates.io/pangocairo-sys/0.17.3 \
+    crate://crates.io/os_str_bytes/6.5.1 \
+    crate://crates.io/pango/0.17.10 \
+    crate://crates.io/pango-sys/0.17.10 \
+    crate://crates.io/pangocairo/0.17.10 \
+    crate://crates.io/pangocairo-sys/0.17.10 \
     crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.7 \
-    crate://crates.io/paste/1.0.12 \
-    crate://crates.io/percent-encoding/2.2.0 \
+    crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/paste/1.0.14 \
+    crate://crates.io/percent-encoding/2.3.0 \
     crate://crates.io/phf/0.8.0 \
     crate://crates.io/phf/0.10.1 \
     crate://crates.io/phf_codegen/0.8.0 \
@@ -169,14 +170,14 @@ SRC_URI +=3D " \
     crate://crates.io/phf_macros/0.10.0 \
     crate://crates.io/phf_shared/0.8.0 \
     crate://crates.io/phf_shared/0.10.0 \
-    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-project-lite/0.2.10 \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.27 \
-    crate://crates.io/plotters/0.3.4 \
-    crate://crates.io/plotters-backend/0.3.4 \
-    crate://crates.io/plotters-svg/0.3.3 \
-    crate://crates.io/png/0.17.8 \
-    crate://crates.io/pom/3.2.0 \
+    crate://crates.io/plotters/0.3.5 \
+    crate://crates.io/plotters-backend/0.3.5 \
+    crate://crates.io/plotters-svg/0.3.5 \
+    crate://crates.io/png/0.17.9 \
+    crate://crates.io/pom/3.3.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/precomputed-hash/0.1.1 \
     crate://crates.io/predicates/2.1.5 \
@@ -187,10 +188,10 @@ SRC_URI +=3D " \
     crate://crates.io/proc-macro-error/1.0.4 \
     crate://crates.io/proc-macro-error-attr/1.0.4 \
     crate://crates.io/proc-macro-hack/0.5.20+deprecated \
-    crate://crates.io/proc-macro2/1.0.59 \
+    crate://crates.io/proc-macro2/1.0.66 \
     crate://crates.io/proptest/1.2.0 \
     crate://crates.io/quick-error/1.2.3 \
-    crate://crates.io/quote/1.0.28 \
+    crate://crates.io/quote/1.0.31 \
     crate://crates.io/rand/0.7.3 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.2.2 \
@@ -204,29 +205,28 @@ SRC_URI +=3D " \
     crate://crates.io/rayon/1.7.0 \
     crate://crates.io/rayon-core/1.11.0 \
     crate://crates.io/rctree/0.5.0 \
-    crate://crates.io/redox_syscall/0.2.16 \
     crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/regex/1.8.3 \
-    crate://crates.io/regex-automata/0.1.10 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.3 \
     crate://crates.io/regex-syntax/0.6.29 \
-    crate://crates.io/regex-syntax/0.7.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
     crate://crates.io/rgb/0.8.36 \
     crate://crates.io/rustc_version/0.2.3 \
     crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.37.19 \
+    crate://crates.io/rustix/0.38.4 \
     crate://crates.io/rusty-fork/0.3.0 \
-    crate://crates.io/ryu/1.0.13 \
-    crate://crates.io/safe_arch/0.6.0 \
+    crate://crates.io/ryu/1.0.15 \
+    crate://crates.io/safe_arch/0.7.1 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/selectors/0.24.0 \
     crate://crates.io/semver/0.9.0 \
-    crate://crates.io/semver/1.0.17 \
+    crate://crates.io/semver/1.0.18 \
     crate://crates.io/semver-parser/0.7.0 \
-    crate://crates.io/serde/1.0.163 \
-    crate://crates.io/serde_derive/1.0.163 \
-    crate://crates.io/serde_json/1.0.96 \
-    crate://crates.io/serde_spanned/0.6.2 \
+    crate://crates.io/serde/1.0.173 \
+    crate://crates.io/serde_derive/1.0.173 \
+    crate://crates.io/serde_json/1.0.103 \
+    crate://crates.io/serde_spanned/0.6.3 \
     crate://crates.io/servo_arc/0.2.0 \
     crate://crates.io/sha1/0.6.1 \
     crate://crates.io/sha1_smol/1.0.0 \
@@ -234,7 +234,7 @@ SRC_URI +=3D " \
     crate://crates.io/simd-adler32/0.3.5 \
     crate://crates.io/siphasher/0.3.10 \
     crate://crates.io/slab/0.4.8 \
-    crate://crates.io/smallvec/1.10.0 \
+    crate://crates.io/smallvec/1.11.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/standback/0.2.17 \
     crate://crates.io/stdweb/0.4.20 \
@@ -245,30 +245,30 @@ SRC_URI +=3D " \
     crate://crates.io/string_cache_codegen/0.5.2 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.18 \
-    crate://crates.io/system-deps/6.1.0 \
-    crate://crates.io/target-lexicon/0.12.7 \
-    crate://crates.io/tempfile/3.5.0 \
+    crate://crates.io/syn/2.0.26 \
+    crate://crates.io/system-deps/6.1.1 \
+    crate://crates.io/target-lexicon/0.12.10 \
+    crate://crates.io/tempfile/3.7.0 \
     crate://crates.io/tendril/0.4.3 \
     crate://crates.io/termtree/0.4.1 \
     crate://crates.io/textwrap/0.16.0 \
-    crate://crates.io/thiserror/1.0.40 \
-    crate://crates.io/thiserror-impl/1.0.40 \
+    crate://crates.io/thiserror/1.0.43 \
+    crate://crates.io/thiserror-impl/1.0.43 \
     crate://crates.io/time/0.2.27 \
     crate://crates.io/time-macros/0.1.1 \
     crate://crates.io/time-macros-impl/0.1.2 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.6.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/toml/0.7.4 \
-    crate://crates.io/toml_datetime/0.6.2 \
-    crate://crates.io/toml_edit/0.19.10 \
+    crate://crates.io/toml/0.7.6 \
+    crate://crates.io/toml_datetime/0.6.3 \
+    crate://crates.io/toml_edit/0.19.14 \
     crate://crates.io/typenum/1.16.0 \
     crate://crates.io/unarray/0.1.4 \
     crate://crates.io/unicode-bidi/0.3.13 \
-    crate://crates.io/unicode-ident/1.0.9 \
+    crate://crates.io/unicode-ident/1.0.11 \
     crate://crates.io/unicode-normalization/0.1.22 \
-    crate://crates.io/url/2.3.1 \
+    crate://crates.io/url/2.4.0 \
     crate://crates.io/utf-8/0.7.6 \
     crate://crates.io/utf8parse/0.2.1 \
     crate://crates.io/version-compare/0.1.1 \
@@ -277,53 +277,44 @@ SRC_URI +=3D " \
     crate://crates.io/walkdir/2.3.3 \
     crate://crates.io/wasi/0.9.0+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.86 \
-    crate://crates.io/wasm-bindgen-backend/0.2.86 \
-    crate://crates.io/wasm-bindgen-macro/0.2.86 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.86 \
-    crate://crates.io/wasm-bindgen-shared/0.2.86 \
-    crate://crates.io/web-sys/0.3.63 \
+    crate://crates.io/wasm-bindgen/0.2.87 \
+    crate://crates.io/wasm-bindgen-backend/0.2.87 \
+    crate://crates.io/wasm-bindgen-macro/0.2.87 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
+    crate://crates.io/wasm-bindgen-shared/0.2.87 \
+    crate://crates.io/web-sys/0.3.64 \
     crate://crates.io/weezl/0.1.7 \
-    crate://crates.io/wide/0.7.9 \
+    crate://crates.io/wide/0.7.11 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.5 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows/0.48.0 \
-    crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
-    crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows-targets/0.48.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
+    crate://crates.io/windows-targets/0.48.1 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.42.2 \
     crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.42.2 \
     crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.42.2 \
     crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.42.2 \
     crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.42.2 \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
-    crate://crates.io/winnow/0.4.6 \
+    crate://crates.io/winnow/0.5.0 \
     crate://crates.io/xml5ever/0.17.0 \
     crate://crates.io/yeslogic-fontconfig-sys/4.0.1 \
 "
=20
 SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcbb8=
15e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[aho-corasick-1.0.1.sha256sum] =3D "67fc08ce920c31afb70f013dcce1b=
fc3a3195de6a228474e45e1f145b36f8d04"
+SRC_URI[aho-corasick-1.0.2.sha256sum] =3D "43f6cb1bf222025340178f382c426=
f13757b2960e89779dfcb319c32542a5a41"
 SRC_URI[android-tzdata-0.1.1.sha256sum] =3D "e999941b234f3131b00bc13c22d=
06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043=
ac279b19830f2efc897156490d7fd6ea916720117ee66311"
 SRC_URI[anes-0.1.6.sha256sum] =3D "4b46cbb362ab8752921c97e041f5e366ee629=
7bd428a31275b9fcf1e380f7299"
 SRC_URI[anstream-0.3.2.sha256sum] =3D "0ca84f3628370c59db74ee214b3263d58=
f9aadd9b4fe7e711fd87dc452b7f163"
-SRC_URI[anstyle-1.0.0.sha256sum] =3D "41ed9a86bf92ae6580e0a31281f65a1b1d=
867c0cc68d5346e2ae128dddfa6a7d"
-SRC_URI[anstyle-parse-0.2.0.sha256sum] =3D "e765fd216e48e067936442276d1d=
57399e37bce53c264d6fefbe298080cb57ee"
+SRC_URI[anstyle-1.0.1.sha256sum] =3D "3a30da5c5f2d5e72842e00bcb57657162c=
dabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] =3D "938874ff5980b03a87c5524b3ae5=
b59cf99b1d6bc836848df7bc5ada9643c333"
 SRC_URI[anstyle-query-1.0.0.sha256sum] =3D "5ca11d4be1bab0c8bc8734a9aa7b=
f4ee8316d462a08c6ac5052f888fef5b494b"
 SRC_URI[anstyle-wincon-1.0.1.sha256sum] =3D "180abfa45703aebe0093f79bada=
cc01b8fd4ea2e35118747e5811127f926e188"
-SRC_URI[anyhow-1.0.71.sha256sum] =3D "9c7d0618f0e0b7e8ff11427422b64564d5=
fb0be1940354bfe2e0529b18a9d9b8"
+SRC_URI[anyhow-1.0.72.sha256sum] =3D "3b13c32d80ecc7ab747b80c3784bce54ee=
8a7a0cc4fbda9bf4cda2cf6fe90854"
 SRC_URI[approx-0.5.1.sha256sum] =3D "cab112f0a86d568ea0e627cc1d6be74a1e9=
cd55214684db5561995f6dad897c6"
 SRC_URI[assert_cmd-2.0.11.sha256sum] =3D "86d6b683edf8d1119fe420a94f8a7e=
389239666aa72e65495d91c00462510151"
 SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
@@ -332,26 +323,27 @@ SRC_URI[base-x-0.2.11.sha256sum] =3D "4cbbc9d096416=
5b47557570cce6c952866c2678457ac
 SRC_URI[bit-set-0.5.3.sha256sum] =3D "0700ddab506f33b20a03b13996eccd309a=
48e5ff77d0d95926aa0210fb4e95f1"
 SRC_URI[bit-vec-0.6.3.sha256sum] =3D "349f9b6a179ed607305526ca489b34ad0a=
41aed5f7980fa90eb03160b69598fb"
 SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] =3D "630be753d4e58660abd17930c71b647fe=
46c27ea6b63cc59e1e3851406972e42"
 SRC_URI[block-0.1.6.sha256sum] =3D "0d8c1fef690941d3e7788d328517591fecc6=
84c084084702d6ff1641e993699a"
-SRC_URI[bstr-1.5.0.sha256sum] =3D "a246e68bb43f6cd9db24bea052a53e4040541=
7c5fb372e3d1a8a7f770a564ef5"
+SRC_URI[bstr-1.6.0.sha256sum] =3D "6798148dccfbff0fae41c7574d2fa8f1ef349=
2fba0face179de5d8d447d67b05"
 SRC_URI[bumpalo-3.13.0.sha256sum] =3D "a3e2c3daef883ecc1b5d58c15adae9347=
0a91d425f3532ba1695849656af3fc1"
 SRC_URI[bytemuck-1.13.1.sha256sum] =3D "17febce684fd15d89027105661fec94a=
fb475cb995fbc59d2865198446ba2eea"
 SRC_URI[byteorder-1.4.3.sha256sum] =3D "14c189c53d098945499cdfa7ecc63567=
cf3886b3332b312a5b4585d8d3a6a610"
-SRC_URI[cairo-rs-0.17.0.sha256sum] =3D "a8af54f5d48af1226928adc1f57edd22=
f5df1349e7da1fc96ae15cf43db0e871"
-SRC_URI[cairo-sys-rs-0.17.0.sha256sum] =3D "f55382a01d30e5e53f185eee2691=
24f5e21ab526595b872751278dfbb463594e"
+SRC_URI[cairo-rs-0.17.10.sha256sum] =3D "ab3603c4028a5e368d09b51c8b624b9=
a46edcd7c3778284077a6125af73c9f0a"
+SRC_URI[cairo-sys-rs-0.17.10.sha256sum] =3D "691d0c66b1fb4881be80a760cb8=
fe76ea97218312f9dfe2c9cc0f496ca279cb1"
 SRC_URI[cast-0.3.0.sha256sum] =3D "37b2a672a2cb129a2e41c10b1224bb368f9f3=
7a2b16b612598138befd7b37eb5"
 SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
-SRC_URI[cfg-expr-0.15.1.sha256sum] =3D "c8790cf1286da485c72cf5fc7aeba308=
438800036ec67d89425924c4807268c9"
+SRC_URI[cfg-expr-0.15.3.sha256sum] =3D "215c0072ecc28f92eeb0eea38ba63ddf=
cb65c2828c46311d646f1a3ff5f9841c"
 SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono-0.4.25.sha256sum] =3D "fdbc37d37da9e5bce8173f3a41b71d9bf3=
c674deebbaceacd0ebdabde76efb03"
+SRC_URI[chrono-0.4.26.sha256sum] =3D "ec837a71355b28f6556dbd569b37b3f363=
091c0bd4b2e735674521b4c5fd9bc5"
 SRC_URI[ciborium-0.2.1.sha256sum] =3D "effd91f6c78e5a4ace8a5d3c0b6bfaec9=
e2baaef55f3efc00e45fb2e477ee926"
 SRC_URI[ciborium-io-0.2.1.sha256sum] =3D "cdf919175532b369853f5d5e20b26b=
43112613fd6fe7aee757e35f7a44642656"
 SRC_URI[ciborium-ll-0.2.1.sha256sum] =3D "defaa24ecc093c77630e6c15e17c51=
f5e187bf35ee514f4e2d67baaa96dae22b"
 SRC_URI[clap-3.2.25.sha256sum] =3D "4ea181bf566f71cb9a5d17a59e1871af6381=
80a18fb0035c92ae62b705207123"
-SRC_URI[clap-4.3.0.sha256sum] =3D "93aae7a4192245f70fe75dd9157fc7b4a5bf5=
3e88d30bd4396f7d8f9284d5acc"
-SRC_URI[clap_builder-4.3.0.sha256sum] =3D "4f423e341edefb78c9caba2d9c7f7=
687d0e72e89df3ce3394554754393ac3990"
-SRC_URI[clap_complete-4.3.0.sha256sum] =3D "a04ddfaacc3bc9e6ea67d024575f=
afc2a813027cf374b8f24f7bc233c6b6be12"
-SRC_URI[clap_derive-4.3.0.sha256sum] =3D "191d9573962933b4027f932c600cd2=
52ce27a8ad5979418fe78e43c07996f27b"
+SRC_URI[clap-4.3.17.sha256sum] =3D "5b0827b011f6f8ab38590295339817b0d26f=
344aa4932c3ced71b45b0c54b4a9"
+SRC_URI[clap_builder-4.3.17.sha256sum] =3D "9441b403be87be858db6a23edb49=
3e7f694761acdc3343d5a0fcaafd304cbc9e"
+SRC_URI[clap_complete-4.3.2.sha256sum] =3D "5fc443334c81a804575546c5a8a7=
9b4913b50e28d69232903604cada1de817ce"
+SRC_URI[clap_derive-4.3.12.sha256sum] =3D "54a9bb5758fc5dfe728d101994168=
1eccaf0cf8a4189b692a0ee2f2ecf90a050"
 SRC_URI[clap_lex-0.2.4.sha256sum] =3D "2850f2f5a82cbf437dd5af4d49848fbdf=
c27c157c3d010345776f952765261c5"
 SRC_URI[clap_lex-0.5.0.sha256sum] =3D "2da6da31387c7e4ef160ffab6d5e7f00c=
42626fe39aea70a7b0f1773f7dd6c1b"
 SRC_URI[colorchoice-1.0.0.sha256sum] =3D "acbf1af155f9b9ef647e42cdc158db=
4b64a1b61f743629225fde6f3e0be2a7c7"
@@ -364,18 +356,18 @@ SRC_URI[criterion-0.4.0.sha256sum] =3D "e7c76e09c1a=
ae2bc52b3d2f29e13c6572553b30c4a
 SRC_URI[criterion-plot-0.5.0.sha256sum] =3D "6b50826342786a51a89e2da3a28=
f1c32b06e387201bc2d19791f622c673706b1"
 SRC_URI[crossbeam-channel-0.5.8.sha256sum] =3D "a33c2bf77f2df06183c3aa30=
d1e96c0695a313d4f9c453cc3762a6db39f99200"
 SRC_URI[crossbeam-deque-0.8.3.sha256sum] =3D "ce6fd6f855243022dcecf8702f=
ef0c297d4338e226845fe067f6341ad9fa0cef"
-SRC_URI[crossbeam-epoch-0.9.14.sha256sum] =3D "46bd5f3f85273295a9d14aedf=
b86f6aadbff6d8f5295c4a9edb08e819dcf5695"
-SRC_URI[crossbeam-utils-0.8.15.sha256sum] =3D "3c063cd8cc95f5c377ed0d4b4=
9a4b21f632396ff690e8470c29b3359b346984b"
+SRC_URI[crossbeam-epoch-0.9.15.sha256sum] =3D "ae211234986c545741a7dc064=
309f67ee1e5ad243d0e48335adc0484d960bcc7"
+SRC_URI[crossbeam-utils-0.8.16.sha256sum] =3D "5a22b2d63d4d1dc0b7f1b6b27=
47dd0088008a9be28b6ddf0b1e7d335e3037294"
 SRC_URI[cssparser-0.29.6.sha256sum] =3D "f93d03419cb5950ccfd3daf3ff1c7a3=
6ace64609a1a8746d493df1ca0afde0fa"
-SRC_URI[cssparser-macros-0.6.0.sha256sum] =3D "dfae75de57f2b2e85e8768c3e=
a840fd159c8f33e2b6522c7835b7abac81be16e"
+SRC_URI[cssparser-macros-0.6.1.sha256sum] =3D "13b588ba4ac1a99f7f2964d24=
b3d896ddc6bf847ee3855dbd4366f058cfcd331"
 SRC_URI[data-url-0.2.0.sha256sum] =3D "8d7439c3735f405729d52c3fbbe4de140=
eaf938a1fe47d227c27f8254d4302a5"
 SRC_URI[derive_more-0.99.17.sha256sum] =3D "4fb810d30a7c1953f91334de7244=
731fc3f3c10d7fe163338a35b9f640960321"
 SRC_URI[difflib-0.4.0.sha256sum] =3D "6184e33543162437515c2e2b48714794e3=
7845ec9851711914eec9d308f6ebe8"
 SRC_URI[discard-1.0.4.sha256sum] =3D "212d0f5754cb6769937f4501cc0e67f4f4=
483c8d2c3e1e922ee9edbe4ab4c7c0"
-SRC_URI[dlib-0.5.0.sha256sum] =3D "ac1b7517328c04c2aa68422fc60a41b922081=
82142ed04a25879c26c8f878794"
+SRC_URI[dlib-0.5.2.sha256sum] =3D "330c60081dcc4c72131f8eb70510f1ac07223=
e5d4163db481a04a0befcffa412"
 SRC_URI[doc-comment-0.3.3.sha256sum] =3D "fea41bba32d969b513997752735605=
054bc0dfa92b4c56bf1189f2e174be7a10"
-SRC_URI[dtoa-0.4.8.sha256sum] =3D "56899898ce76aaf4a0f24d914c97ea6ed976d=
42fec6ad33fcbb0a1103e07b2b0"
-SRC_URI[dtoa-short-0.3.3.sha256sum] =3D "bde03329ae10e79ede66c9ce4dc930a=
a8599043b0743008548680f25b91502d6"
+SRC_URI[dtoa-1.0.9.sha256sum] =3D "dcbb2bf8e87535c23f7a8a321e364ce21462d=
0ff10cb6407820e8e96dfff6653"
+SRC_URI[dtoa-short-0.3.4.sha256sum] =3D "dbaceec3c6e4211c79e7b1800fb9680=
527106beb2f9c51904a3210c03a448c74"
 SRC_URI[either-1.8.1.sha256sum] =3D "7fcaabb2fef8c910e7f4c7ce9f67a1283a1=
715879a7c230ca9d6d1ae31f16d91"
 SRC_URI[encoding-0.2.33.sha256sum] =3D "6b0d943856b990d12d3b55b359144ff3=
41533e516d94098b1d3fc1ac666d36ec"
 SRC_URI[encoding-index-japanese-1.20141219.5.sha256sum] =3D "04e8b2ff42e=
9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91"
@@ -385,14 +377,15 @@ SRC_URI[encoding-index-singlebyte-1.20141219.5.sha2=
56sum] =3D "3351d5acffb224af9ca
 SRC_URI[encoding-index-tradchinese-1.20141219.5.sha256sum] =3D "fd0e20d5=
688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18"
 SRC_URI[encoding_index_tests-0.1.4.sha256sum] =3D "a246d82be1c9d791c5dfd=
e9a2bd045fc3cbba3fa2b11ad558f27d01712f00569"
 SRC_URI[encoding_rs-0.8.32.sha256sum] =3D "071a31f4ee85403370b58aca746f0=
1041ede6f0da2730960ad001edc2b71b394"
+SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378a=
d8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[errno-0.3.1.sha256sum] =3D "4bcfec3a70f97c962c307b2d2c56e358cf1d=
00b558d74262b5f929ee8cc7e73a"
 SRC_URI[errno-dragonfly-0.1.2.sha256sum] =3D "aa68f1b12764fab894d2755d25=
18754e71b4fd80ecfb822714a1206c2aab39bf"
-SRC_URI[fastrand-1.9.0.sha256sum] =3D "e51093e27b0797c359783294ca4f0a911=
c270184cb10f85783b118614a1501be"
+SRC_URI[fastrand-2.0.0.sha256sum] =3D "6999dc1837253364c2ebb0704ba97994b=
d874e8f195d665c50b7548f6ea92764"
 SRC_URI[fdeflate-0.3.0.sha256sum] =3D "d329bdeac514ee06249dabc27877490f1=
7f5d371ec693360768b838e19f3ae10"
 SRC_URI[flate2-1.0.26.sha256sum] =3D "3b9429470923de8e8cbd4d2dc513535400=
b4b3fef0319fb5c4e1f520a7bef743"
 SRC_URI[float-cmp-0.9.0.sha256sum] =3D "98de4bbd547a563b716d8dfa9aad1cb1=
9bfab00f4fa09a6a4ed21dbcf44ce9c4"
 SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2=
da24a9afd88aca000531ab82c1"
-SRC_URI[form_urlencoded-1.1.0.sha256sum] =3D "a9c384f161156f5260c24a097c=
56119f9be8c798586aecc13afbcbe7b7e26bf8"
+SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D "a62bc1cf6f830c2ec14a513a9f=
b124d0a213a629668a4186f329db21fe045652"
 SRC_URI[futf-0.1.5.sha256sum] =3D "df420e2e84819663797d1ec6544b13c5be846=
29e7bb00dc960d6917db2987843"
 SRC_URI[futures-channel-0.3.28.sha256sum] =3D "955518d47e09b25bbebc7a18d=
f10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
 SRC_URI[futures-core-0.3.28.sha256sum] =3D "4bca583b7e26f571124fe5b7561d=
49cb2868d79116cfa0eefce955557c6fee8c"
@@ -402,42 +395,41 @@ SRC_URI[futures-macro-0.3.28.sha256sum] =3D "89ca54=
5a94061b6365f2c7355b4b32bd20df3
 SRC_URI[futures-task-0.3.28.sha256sum] =3D "76d3d132be6c0e6aa1534069c705=
a74a5997a356c0dc2f86a47765e5617c5b65"
 SRC_URI[futures-util-0.3.28.sha256sum] =3D "26b01e40b772d54cf6c6d721c1d1=
abd0647a0106a12ecaa1c186273392a69533"
 SRC_URI[fxhash-0.2.1.sha256sum] =3D "c31b6d751ae2c7f11320402d34e41349dd1=
016f8d5d45e48c4312bc8625af50c"
-SRC_URI[gdk-pixbuf-0.17.0.sha256sum] =3D "b023fbe0c6b407bd3d9805d107d980=
0da3829dc5a676653210f1d5f16d7f59bf"
-SRC_URI[gdk-pixbuf-sys-0.17.0.sha256sum] =3D "7b41bd2b44ed49d99277d39256=
52a163038bd5ed943ec9809338ffb2f4391e3b"
+SRC_URI[gdk-pixbuf-0.17.10.sha256sum] =3D "695d6bc846438c5708b07007537b9=
274d883373dd30858ca881d7d71b5540717"
+SRC_URI[gdk-pixbuf-sys-0.17.10.sha256sum] =3D "9285ec3c113c66d7d0ab56765=
99176f1f42f4944ca1b581852215bf5694870cb"
 SRC_URI[getrandom-0.1.16.sha256sum] =3D "8fc3cb4d91f53b50155bdcfd23f6a4c=
39ae1969c2ae85982b135750cccaf5fce"
-SRC_URI[getrandom-0.2.9.sha256sum] =3D "c85e1d9ab2eadba7e5040d4e09cbd6d0=
72b76a557ad64e797c2cb9d4da21d7e4"
-SRC_URI[gio-0.17.9.sha256sum] =3D "d14522e56c6bcb6f7a3aebc25cbcfb06776af=
4c0c25232b601b4383252d7cb92"
-SRC_URI[gio-sys-0.17.4.sha256sum] =3D "6b1d43b0d7968b48455244ecafe411928=
71257f5740aa6b095eb19db78e362a5"
-SRC_URI[glib-0.17.9.sha256sum] =3D "a7f1de7cbde31ea4f0a919453a2dcece5d54=
d5b70e08f8ad254dc4840f5f09b6"
-SRC_URI[glib-macros-0.17.9.sha256sum] =3D "0a7206c5c03851ef126ea1444990e=
81fdd6765fb799d5bc694e4897ca01bb97f"
-SRC_URI[glib-sys-0.17.4.sha256sum] =3D "49f00ad0a1bf548e61adfff15d834309=
41d9e1bb620e334f779edd1c745680a5"
-SRC_URI[gobject-sys-0.17.4.sha256sum] =3D "15e75b0000a64632b2d8ca3cf856a=
f9308e3a970844f6e9659bd197f026793d0"
+SRC_URI[getrandom-0.2.10.sha256sum] =3D "be4136b2a15dd319360be1c07d99335=
17ccf0be8f16bf62a3bee4f0d618df427"
+SRC_URI[gio-0.17.10.sha256sum] =3D "a6973e92937cf98689b6a054a9e56c657ed4=
ff76de925e36fc331a15f0c5d30a"
+SRC_URI[gio-sys-0.17.10.sha256sum] =3D "0ccf87c30a12c469b6d958950f6a9c09=
f2be20b7773f7e70d20b867fdf2628c3"
+SRC_URI[glib-0.17.10.sha256sum] =3D "d3fad45ba8d4d2cea612b432717e834f480=
31cd8853c8aaf43b2c79fec8d144b"
+SRC_URI[glib-macros-0.17.10.sha256sum] =3D "eca5c79337338391f1ab8058d669=
8125034ce8ef31b72a442437fa6c8580de26"
+SRC_URI[glib-sys-0.17.10.sha256sum] =3D "d80aa6ea7bba0baac79222204aa786a=
6293078c210abe69ef1336911d4bdc4f0"
+SRC_URI[gobject-sys-0.17.10.sha256sum] =3D "cd34c3317740a6358ec04572c1bc=
fd3ac0b5b6529275fae255b237b314bb8062"
 SRC_URI[half-1.8.2.sha256sum] =3D "eabb4a44450da02c90444cf74558da904edde=
8fb4e9035a9a6a4e15445af0bd7"
 SRC_URI[hashbrown-0.12.3.sha256sum] =3D "8a9ee70c43aaf417c914396645a0fa8=
52624801b24ebb7ae78fe8272889ac888"
+SRC_URI[hashbrown-0.14.0.sha256sum] =3D "2c6201b9ff9fd90a5a3bac2e56a830d=
0caa509576f0e503818ee82c181b3437a"
 SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.2.6.sha256sum] =3D "ee512640fe35acbfb4bb779db6f0d80=
704c2cacfa2e39b601ef3e3f47d1ae4c7"
-SRC_URI[hermit-abi-0.3.1.sha256sum] =3D "fed44880c466736ef9a5c5b5facefb5=
ed0785676d0c02d612db14e54f0d84286"
-SRC_URI[iana-time-zone-0.1.56.sha256sum] =3D "0722cd7114b7de04316e7ea545=
6a0bbb20e4adb46fd27a3697adb812cff0f37c"
+SRC_URI[hermit-abi-0.3.2.sha256sum] =3D "443144c8cdadd93ebf52ddb4056d257=
f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[iana-time-zone-0.1.57.sha256sum] =3D "2fad5b825842d2b38bd206f3e8=
1d6957625fd7f0a361e345c30e01a0ae2dd613"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590=
ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[idna-0.3.0.sha256sum] =3D "e14ddfc70884202db2244c223200c204c2bda=
1bc6e0998d11b5e024d657209e6"
+SRC_URI[idna-0.4.0.sha256sum] =3D "7d20d6b07bfbc108882d88ed8e37d39636dcc=
260e15e30c45e6ba089610b917c"
 SRC_URI[indexmap-1.9.3.sha256sum] =3D "bd070e393353796e801d209ad339e8959=
6eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[instant-0.1.12.sha256sum] =3D "7a5bbe824c507c5da5956355e86a746d8=
2e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[io-lifetimes-1.0.11.sha256sum] =3D "eae7b9aee968036d54dce06cebae=
fd919e4472e753296daccd6d344e3e2df0c2"
-SRC_URI[is-terminal-0.4.7.sha256sum] =3D "adcf93614601c8129ddf72e2d5633d=
f827ba6551541c6d8c59520a371475be1f"
+SRC_URI[indexmap-2.0.0.sha256sum] =3D "d5477fe2230a79769d8dc68e0eabf5437=
907c0457a5614a9e8dddb67f65eb65d"
+SRC_URI[is-terminal-0.4.9.sha256sum] =3D "cb0889898416213fab133e1d33a0e5=
858a48177452750691bde3666d0fdbaf8b"
 SRC_URI[itertools-0.10.5.sha256sum] =3D "b0fd2260e829bddf4cb6ea802289de2=
f86d6a7a690192fbe91b3f46e0f2c8473"
-SRC_URI[itoa-1.0.6.sha256sum] =3D "453ad9f582a441959e5f0d088b02ce04cfe8d=
51a8eaf077f12ac6d3e94164ca6"
-SRC_URI[js-sys-0.3.63.sha256sum] =3D "2f37a4a5928311ac501dee68b3c7613a10=
37d0edb30c8e5427bd832d55d1b790"
+SRC_URI[itoa-1.0.9.sha256sum] =3D "af150ab688ff2122fcef229be89cb50dd66af=
9e01a4ff320cc137eecc9bacc38"
+SRC_URI[js-sys-0.3.64.sha256sum] =3D "c5f195fe497f702db0f318b07fdd68edb1=
6955aed830df8363d837542f8f935a"
 SRC_URI[language-tags-0.3.2.sha256sum] =3D "d4345964bb142484797b161f473a=
503a434de77149dd8c7427788c6e13379388"
 SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.144.sha256sum] =3D "2b00cc1c228a6782d0f076e7b232802e0c5=
689d41bb5df366f2a6b6621cfdfe1"
-SRC_URI[libloading-0.7.4.sha256sum] =3D "b67380fd3b2fbe7527a606e18729d21=
c6f3951633d0500574c4dc22d2d638b9f"
+SRC_URI[libc-0.2.147.sha256sum] =3D "b4668fb0ea861c1df094127ac5f1da3409a=
82116a4ba74fca2e58ef927159bb3"
+SRC_URI[libloading-0.8.0.sha256sum] =3D "d580318f95776505201b28cf98eb1fa=
5e4be3b689633ba6a3e6cd880ff22d8cb"
 SRC_URI[libm-0.2.7.sha256sum] =3D "f7012b1bbb0719e1097c47611d3898568c546=
d597c2e74d66f6087edd5233ff4"
 SRC_URI[linked-hash-map-0.5.6.sha256sum] =3D "0717cef1bc8b636c6e1c1bbdef=
c09e6322da8a9321966e8928ef80d20f7f770f"
-SRC_URI[linux-raw-sys-0.3.8.sha256sum] =3D "ef53942eb7bf7ff43a617b3e2c1c=
4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] =3D "09fc20d2ca12cb9f044c93e3bd6d=
32d523e6e2ec3db4f7b2939cd99026ecd3f0"
 SRC_URI[locale_config-0.3.0.sha256sum] =3D "08d2c35b16f4483f6c26f0e4e955=
0717a2f6575bcd6f12a53ff0c490a94a6934"
-SRC_URI[lock_api-0.4.9.sha256sum] =3D "435011366fe56583b16cf956f9df0095b=
405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[log-0.4.18.sha256sum] =3D "518ef76f2f87365916b142844c16d8fefd850=
39bc5699050210a7778ee1cd1de"
+SRC_URI[lock_api-0.4.10.sha256sum] =3D "c1cc9717a20b1bb222f333e6a92fd32f=
7d8a18ddc5a3191a11af45dcbf4dcd16"
+SRC_URI[log-0.4.19.sha256sum] =3D "b06a4cde4c0f271a446782e3eff8de789548c=
e57dbc8eca9292c27f4a42004b4"
 SRC_URI[lopdf-0.29.0.sha256sum] =3D "de0f69c40d6dbc68ebac4bf5aec3d9978e0=
94e22e29fcabd045acd9cec74a9dc"
 SRC_URI[mac-0.1.1.sha256sum] =3D "c41e0c4fef86961ac6d6f8a82609f55f31b05e=
4fce149ac5710e439df7619ba4"
 SRC_URI[malloc_buf-0.0.6.sha256sum] =3D "62bb907fe88d54d8d9ce32a3cceab42=
18ed2f6b7d35617cafe9adf84e43919cb"
@@ -445,10 +437,10 @@ SRC_URI[markup5ever-0.11.0.sha256sum] =3D "7a2629bb=
1404f3d34c2e921f21fd34ba00b2061
 SRC_URI[matches-0.1.10.sha256sum] =3D "2532096657941c2fea9c289d370a25097=
1c689d4f143798ff67113ec042024a5"
 SRC_URI[matrixmultiply-0.3.7.sha256sum] =3D "090126dc04f95dc0d1c1c91f61b=
dd474b3930ca064c1edc8a849da2c6cbe1e77"
 SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
-SRC_URI[memoffset-0.8.0.sha256sum] =3D "d61c719bcfbcf5d62b3a09efa6088de8=
c54bc0bfcd3ea7ae39fcc186108b8de1"
+SRC_URI[memoffset-0.9.0.sha256sum] =3D "5a634b1c61a95585bd15607c6ab0c4e5=
b226e695ff2800ba0cdccddf208c406c"
 SRC_URI[miniz_oxide-0.7.1.sha256sum] =3D "e7810e0be55b428ada41041c41f32c=
9f1a42817901b4ccf45fa3d4b6561e74c7"
-SRC_URI[nalgebra-0.32.2.sha256sum] =3D "d68d47bba83f9e2006d117a9a33af152=
4e655516b8919caac694427a6fb1e511"
-SRC_URI[nalgebra-macros-0.2.0.sha256sum] =3D "d232c68884c0c99810a5a4d333=
ef7e47689cfd0edc85efc9e54e1e6bf5212766"
+SRC_URI[nalgebra-0.32.3.sha256sum] =3D "307ed9b18cc2423f29e83f84fd23a8e7=
3628727990181f18641a8b5dc2ab1caa"
+SRC_URI[nalgebra-macros-0.2.1.sha256sum] =3D "91761aed67d03ad966ef783ae9=
62ef9bbaca728d2dd7ceb7939ec110fffad998"
 SRC_URI[new_debug_unreachable-1.0.4.sha256sum] =3D "e4a24736216ec316047a=
1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54"
 SRC_URI[nodrop-0.1.14.sha256sum] =3D "72ef4a56884ca558e5ddb05a1d1e7e1bfd=
9a68d9ed024c21704cc98872dae1bb"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] =3D "61807f77802ff30975e=
01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
@@ -456,21 +448,21 @@ SRC_URI[num-complex-0.4.3.sha256sum] =3D "02e0d2125=
5c828d6f128a1e41534206671e8c3ea
 SRC_URI[num-integer-0.1.45.sha256sum] =3D "225d3389fb3509a24c93f5c29eb6b=
de2586b98d9f016636dff58d7c6f7569cd9"
 SRC_URI[num-rational-0.4.1.sha256sum] =3D "0638a1c9d0a3c0914158145bc76cf=
f373a75a627e6ecbfb71cbe6f453a5a19b0"
 SRC_URI[num-traits-0.2.15.sha256sum] =3D "578ede34cf02f8924ab9447f50c280=
75b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[num_cpus-1.15.0.sha256sum] =3D "0fac9e2da13b5eb447a6ce3d392f23a2=
9d8694bff781bf03a16cd9ac8697593b"
+SRC_URI[num_cpus-1.16.0.sha256sum] =3D "4161fcb6d602d4d2081af7c3a45852d8=
75a03dd337a6bfdd6e06407b61342a43"
 SRC_URI[objc-0.2.7.sha256sum] =3D "915b1b472bc21c53464d6c8461c9d3af805ba=
1ef837e1cac254428f4a77177b1"
 SRC_URI[objc-foundation-0.1.1.sha256sum] =3D "1add1b659e36c9607c7aab864a=
76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9"
 SRC_URI[objc_id-0.1.1.sha256sum] =3D "c92d4ddb4bd7b50d730c215ff871754d0d=
a6b2178849f8a2a2ab69712d0c073b"
-SRC_URI[once_cell-1.17.2.sha256sum] =3D "9670a07f94779e00908f3e686eab508=
878ebb390ba6e604d3a284c00e8d0487b"
+SRC_URI[once_cell-1.18.0.sha256sum] =3D "dd8b5dd2ae5ed71462c540258bedcb5=
1965123ad7e7ccf4b9a8cafaa4a63576d"
 SRC_URI[oorandom-11.1.3.sha256sum] =3D "0ab1bc2a289d34bd04a330323ac98a1b=
4bc82c9d9fcb1e66b63caa84da26b575"
-SRC_URI[os_str_bytes-6.5.0.sha256sum] =3D "ceedf44fb00f2d1984b0bc9810262=
7ce622e083e49a5bacdb3e514fa4238e267"
-SRC_URI[pango-0.17.4.sha256sum] =3D "52c280b82a881e4208afb3359a8e7fde27a=
1b272280981f1f34610bed5770d37"
-SRC_URI[pango-sys-0.17.0.sha256sum] =3D "4293d0f0b5525eb5c24734d30b0ed02=
cd02aa734f216883f376b54de49625de8"
-SRC_URI[pangocairo-0.17.0.sha256sum] =3D "2feeb7ea7874507f83f5e7ba869c54=
e321959431c8fbd70d4b735c8b15d90506"
-SRC_URI[pangocairo-sys-0.17.3.sha256sum] =3D "f60f1be8ef08087ddcbdcc1350=
e06073bff11113d425d12b622b716d96b9611c"
+SRC_URI[os_str_bytes-6.5.1.sha256sum] =3D "4d5d9eb14b174ee9aa2ef96dc2b94=
637a2d4b6e7cb873c7e171f0c20c6cf3eac"
+SRC_URI[pango-0.17.10.sha256sum] =3D "35be456fc620e61f62dff7ff70fbd54dcb=
af0a4b920c0f16de1107c47d921d48"
+SRC_URI[pango-sys-0.17.10.sha256sum] =3D "3da69f9f3850b0d8990d462f8c7095=
61975e95f689c1cdf0fecdebde78b35195"
+SRC_URI[pangocairo-0.17.10.sha256sum] =3D "86bf29cb1c2e73817944f66011fb1=
2135e1c6d268e8e4c5cfc689101c25822cf"
+SRC_URI[pangocairo-sys-0.17.10.sha256sum] =3D "94dfd38d9bf8ff5f881be2107=
ba49fcb22090d247aa00133f8dadf96b122b97a"
 SRC_URI[parking_lot-0.12.1.sha256sum] =3D "3742b2c103b9f06bc9fff0a37ff49=
12935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.7.sha256sum] =3D "9069cbb9f99e3a5083476ccb2=
9ceb1de18b9118cafa53e90c9551235de2b9521"
-SRC_URI[paste-1.0.12.sha256sum] =3D "9f746c4065a8fa3fe23974dd82f15431cc8=
d40779821001404d10d2e79ca7d79"
-SRC_URI[percent-encoding-2.2.0.sha256sum] =3D "478c572c3d73181ff3c253904=
5f6eb99e5491218eae919370993b890cdbdd98e"
+SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D "93f00c865fe7cabf650081aff=
ecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[paste-1.0.14.sha256sum] =3D "de3145af08024dea9fa9914f381a17b8fc6=
034dfb00f3a84013f7ff43f29ed4c"
+SRC_URI[percent-encoding-2.3.0.sha256sum] =3D "9b2a4787296e9989611394c33=
f193f676704af1686e70b8f8033ab5ba9a35a94"
 SRC_URI[phf-0.8.0.sha256sum] =3D "3dfb61232e34fcb633f43d12c58f83c1df8296=
2dcdfa565a4e866ffc17dafe12"
 SRC_URI[phf-0.10.1.sha256sum] =3D "fabbf1ead8a5bcbc20f5f8b939ee3f5b0f6f2=
81b6ad3468b84656b658b455259"
 SRC_URI[phf_codegen-0.8.0.sha256sum] =3D "cbffee61585b0411840d3ece935cce=
9cb6321f01c45477d30066498cd5e1a815"
@@ -480,14 +472,14 @@ SRC_URI[phf_generator-0.10.0.sha256sum] =3D "5d5285=
893bb5eb82e6aaf5d59ee909a06a167
 SRC_URI[phf_macros-0.10.0.sha256sum] =3D "58fdf3184dd560f160dd73922bea2d=
5cd6e8f064bf4b13110abd81b03697b4e0"
 SRC_URI[phf_shared-0.8.0.sha256sum] =3D "c00cf8b9eafe68dde5e9eaa2cef8ee8=
4a9336a47d566ec55ca16589633b65af7"
 SRC_URI[phf_shared-0.10.0.sha256sum] =3D "b6796ad771acdc0123d2a88dc428b5=
e38ef24456743ddb1744ed628f9815c096"
-SRC_URI[pin-project-lite-0.2.9.sha256sum] =3D "e0a7ae3ac2f1173085d398531=
c705756c94a4c56843785df85a60c1a0afac116"
+SRC_URI[pin-project-lite-0.2.10.sha256sum] =3D "4c40d25201921e5ff0c862a5=
05c6557ea88568a4e3ace775ab55e93f2f4f9d57"
 SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.27.sha256sum] =3D "26072860ba924cbfa98ea39c8c19b4=
dd6a4a25423dbdf219c1eca91aa0cf6964"
-SRC_URI[plotters-0.3.4.sha256sum] =3D "2538b639e642295546c50fcd545198c9d=
64ee2a38620a628724a3b266d5fbf97"
-SRC_URI[plotters-backend-0.3.4.sha256sum] =3D "193228616381fecdc1224c62e=
96946dfbc73ff4384fba576e052ff8c1bea8142"
-SRC_URI[plotters-svg-0.3.3.sha256sum] =3D "f9a81d2759aae1dae668f783c308b=
c5c8ebd191ff4184aaa1b37f65a6ae5a56f"
-SRC_URI[png-0.17.8.sha256sum] =3D "aaeebc51f9e7d2c150d3f3bfeb667f2aa985d=
b5ef1e3d212847bdedb488beeaa"
-SRC_URI[pom-3.2.0.sha256sum] =3D "07e2192780e9f8e282049ff9bffcaa28171e1c=
b0844f49ed5374e518ae6024ec"
+SRC_URI[plotters-0.3.5.sha256sum] =3D "d2c224ba00d7cadd4d5c660deaf2098e5=
e80e07846537c51f9cfa4be50c1fd45"
+SRC_URI[plotters-backend-0.3.5.sha256sum] =3D "9e76628b4d3a7581389a35d5b=
6e2139607ad7c75b17aed325f210aa91f4a9609"
+SRC_URI[plotters-svg-0.3.5.sha256sum] =3D "38f6d39893cca0701371e3c27294f=
09797214b86f1fb951b89ade8ec04e2abab"
+SRC_URI[png-0.17.9.sha256sum] =3D "59871cc5b6cce7eaccca5a802b4173377a1c2=
ba90654246789a8fa2334426d11"
+SRC_URI[pom-3.3.0.sha256sum] =3D "5c2d73a5fe10d458e77534589512104e5aa8ac=
480aa9ac30b74563274235cce4"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D "5b40af805b3121feab8a3c29f04d8a=
d262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[precomputed-hash-0.1.1.sha256sum] =3D "925383efa346730478fb4838d=
be9137d2a47675ad789c546d150a6e1dd4ab31c"
 SRC_URI[predicates-2.1.5.sha256sum] =3D "59230a63c37f3e18569bdb90e4a89cb=
f5bf8b06fea0b84e65ea10cc4df47addd"
@@ -498,10 +490,10 @@ SRC_URI[proc-macro-crate-1.3.1.sha256sum] =3D "7f4c=
021e1093a56626774e81216a4ce732a
 SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
 SRC_URI[proc-macro-hack-0.5.20+deprecated.sha256sum] =3D "dc375e1527247f=
e1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068"
-SRC_URI[proc-macro2-1.0.59.sha256sum] =3D "6aeca18b86b413c660b781aa319e4=
e2648a3e6f9eadc9b47e9038e6fe9f3451b"
+SRC_URI[proc-macro2-1.0.66.sha256sum] =3D "18fb31db3f9bddb2ea821cde30a9f=
70117e3f119938b5ee630b7403aa6e2ead9"
 SRC_URI[proptest-1.2.0.sha256sum] =3D "4e35c06b98bf36aba164cc17cb25f7e23=
2f5c4aeea73baa14b8a9f0d92dbfa65"
 SRC_URI[quick-error-1.2.3.sha256sum] =3D "a1d01941d82fa2ab50be1e79e67142=
89dd7cde78eba4c074bc5a4374f650dfe0"
-SRC_URI[quote-1.0.28.sha256sum] =3D "1b9ab9c7eadfd8df19006f1cf1a4aed1354=
0ed5cbc047010ece5826e10825488"
+SRC_URI[quote-1.0.31.sha256sum] =3D "5fe8a65d69dd0808184ebb5f836ab526bb2=
59db23c657efa38711b1072ee47f0"
 SRC_URI[rand-0.7.3.sha256sum] =3D "6a6b1679d49b24bbfe0c803429aa1874472f5=
0d9b363131f0e89fc356b544d03"
 SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.2.2.sha256sum] =3D "f4c8ed856279c9737206bf725bf369=
35d8666ead7aa69b52be55af369d193402"
@@ -515,29 +507,28 @@ SRC_URI[rawpointer-0.2.1.sha256sum] =3D "60a3577939=
50651c4ed0f3f52338f53b2f809f32d
 SRC_URI[rayon-1.7.0.sha256sum] =3D "1d2df5196e37bcc87abebc0053e20787d738=
47bb33134a69841207dd0a47f03b"
 SRC_URI[rayon-core-1.11.0.sha256sum] =3D "4b8f95bd6966f5c87776639160a66b=
d8ab9895d9d4ab01ddba9fc60661aebe8d"
 SRC_URI[rctree-0.5.0.sha256sum] =3D "3b42e27ef78c35d3998403c1d26f3efd9e1=
35d3e5121b0a4845cc5cc27547f4f"
-SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d59012155=
603f0b22ad30cad752600aadfcb695265519a"
 SRC_URI[redox_syscall-0.3.5.sha256sum] =3D "567664f262709473930a4bf9e51b=
f2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[regex-1.8.3.sha256sum] =3D "81ca098a9821bd52d6b24fd8b10bd081f47d=
39c22778cafaa75a2857a62c6390"
-SRC_URI[regex-automata-0.1.10.sha256sum] =3D "6c230d73fb8d8c1b9c0b3135c5=
142a8acee3a0558fb8db5cf1cb65f8d7862132"
+SRC_URI[regex-1.9.1.sha256sum] =3D "b2eae68fc220f7cf2532e4494aded17545fc=
e192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.3.sha256sum] =3D "39354c10dd07468c2e73926b23b=
b9c2caca74c5501e38a35da70406f1d923310"
 SRC_URI[regex-syntax-0.6.29.sha256sum] =3D "f162c6dd7b008981e4d40210aca2=
0b4bd0f9b60ca9271061b07f78537722f2e1"
-SRC_URI[regex-syntax-0.7.2.sha256sum] =3D "436b050e76ed2903236f032a59761=
c1eb99e1b0aead2c257922771dab1fc8c78"
+SRC_URI[regex-syntax-0.7.4.sha256sum] =3D "e5ea92a5b6195c6ef2a0295ea818b=
312502c6fc94dde986c5553242e18fd4ce2"
 SRC_URI[rgb-0.8.36.sha256sum] =3D "20ec2d3e3fc7a92ced357df9cebd5a10b6fb2=
aa1ee797bf7e9ce2f17dffc8f59"
 SRC_URI[rustc_version-0.2.3.sha256sum] =3D "138e3e0acb6c9fb258b19b67cb8a=
bd63c00679d2851805ea151465464fe9030a"
 SRC_URI[rustc_version-0.4.0.sha256sum] =3D "bfa0f585226d2e68097d4f95d113=
b15b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.37.19.sha256sum] =3D "acf8729d8542766f1b2cf77eb034d52f4=
0d375bb8b615d0b147089946e16613d"
+SRC_URI[rustix-0.38.4.sha256sum] =3D "0a962918ea88d644592894bc6dc55acc6c=
0956488adcebbfb6e273506b7fd6e5"
 SRC_URI[rusty-fork-0.3.0.sha256sum] =3D "cb3dcc6e454c328bb824492db107ab7=
c0ae8fcffe4ad210136ef014458c1bc4f"
-SRC_URI[ryu-1.0.13.sha256sum] =3D "f91339c0467de62360649f8d3e185ca8de422=
4ff281f66000de5eb2a77a79041"
-SRC_URI[safe_arch-0.6.0.sha256sum] =3D "794821e4ccb0d9f979512f9c19734801=
23f9bd62a90d74ab0f9426fcf8f4a529"
+SRC_URI[ryu-1.0.15.sha256sum] =3D "1ad4cc8da4ef723ed60bced201181d83791ad=
433213d8c24efffda1eec85d741"
+SRC_URI[safe_arch-0.7.1.sha256sum] =3D "f398075ce1e6a179b46f51bd88d0598b=
92b00d3551f1a2d4ac49e771b56ac354"
 SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[selectors-0.24.0.sha256sum] =3D "0c37578180969d00692904465fb7f6b=
3d50b9a2b952b87c23d0e2e5cb5013416"
 SRC_URI[semver-0.9.0.sha256sum] =3D "1d7eb9ef2c18661902cc47e535f9bc51b78=
acd254da71d375c2f6720d9a40403"
-SRC_URI[semver-1.0.17.sha256sum] =3D "bebd363326d05ec3e2f532ab7660680f3b=
02130d780c299bca73469d521bc0ed"
+SRC_URI[semver-1.0.18.sha256sum] =3D "b0293b4b29daaf487284529cc2f5675b8e=
57c61f70167ba415a463651fd6a918"
 SRC_URI[semver-parser-0.7.0.sha256sum] =3D "388a1df253eca08550bef6c72392=
cfe7c30914bf41df5269b68cbd6ff8f570a3"
-SRC_URI[serde-1.0.163.sha256sum] =3D "2113ab51b87a539ae008b5c6c02dc020ff=
a39afd2d83cffcb3f4eb2722cebec2"
-SRC_URI[serde_derive-1.0.163.sha256sum] =3D "8c805777e3930c8883389c60231=
5a24224bcc738b63905ef87cd1420353ea93e"
-SRC_URI[serde_json-1.0.96.sha256sum] =3D "057d394a50403bcac12672b2b18fb3=
87ab6d289d957dab67dd201875391e52f1"
-SRC_URI[serde_spanned-0.6.2.sha256sum] =3D "93107647184f6027e3b7dcb2e110=
34cf95ffa1e3a682c67951963ac69c1c007d"
+SRC_URI[serde-1.0.173.sha256sum] =3D "e91f70896d6720bc714a4a57d22fc91f1d=
b634680e65c8efe13323f1fa38d53f"
+SRC_URI[serde_derive-1.0.173.sha256sum] =3D "a6250dde8342e0232232be9ca3d=
b7aa40aceb5a3e5dd9bddbc00d99a007cde49"
+SRC_URI[serde_json-1.0.103.sha256sum] =3D "d03b412469450d4404fe8499a268e=
dd7f8b79fecb074b0d812ad64ca21f4031b"
+SRC_URI[serde_spanned-0.6.3.sha256sum] =3D "96426c9936fd7a0124915f9185ea=
1d20aa9445cc9821142f0a73bc9207a2e186"
 SRC_URI[servo_arc-0.2.0.sha256sum] =3D "d52aa42f8fdf0fed91e5ce7f23d81384=
41002fa31dca008acf47e6fd4721f741"
 SRC_URI[sha1-0.6.1.sha256sum] =3D "c1da05c97445caa12d05e848c4a4fcbbea29e=
748ac28f7e80e9b010392063770"
 SRC_URI[sha1_smol-1.0.0.sha256sum] =3D "ae1a47186c03a32177042e55dbc5fd5a=
ee900b8e0069a8d70fba96a9375cd012"
@@ -545,7 +536,7 @@ SRC_URI[simba-0.8.1.sha256sum] =3D "061507c94fc6ab4ba=
1c9a0305018408e312e17c041eb63
 SRC_URI[simd-adler32-0.3.5.sha256sum] =3D "238abfbb77c1915110ad968465608=
b68e869e0772622c9656714e73e5a1a522f"
 SRC_URI[siphasher-0.3.10.sha256sum] =3D "7bd3e3206899af3f8b12af284fafc03=
8cc1dc2b41d1b89dd17297221c5d225de"
 SRC_URI[slab-0.4.8.sha256sum] =3D "6528351c9bc8ab22353f9d776db39a20288e8=
d6c37ef8cfe3317cf875eecfc2d"
-SRC_URI[smallvec-1.10.0.sha256sum] =3D "a507befe795404456341dfab10cef66e=
ad4c041f62b8b11bbb92bffe5d0953e0"
+SRC_URI[smallvec-1.11.0.sha256sum] =3D "62bb4feee49fdd9f707ef802e22365a3=
5de4b7b299de4763d44bfea899442ff9"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] =3D "a8f112729512f8e442d81f9=
5a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[standback-0.2.17.sha256sum] =3D "e113fb6f3de07a243d434a56ec6f186=
dfd51cb08448239fe7bcae73f87ff28ff"
 SRC_URI[stdweb-0.4.20.sha256sum] =3D "d022496b16281348b52d0e30ae99e01a73=
d737b2f45d38fed4edf79f9325a1d5"
@@ -556,30 +547,30 @@ SRC_URI[string_cache-0.8.7.sha256sum] =3D "f91138e7=
6242f575eb1d3b38b4f1362f10d3a43
 SRC_URI[string_cache_codegen-0.5.2.sha256sum] =3D "6bb30289b722be4ff74a4=
08c3cc27edeaad656e06cb1fe8fa9231fa59c728988"
 SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a644494=
9f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.18.sha256sum] =3D "32d41677bcbe24c20c52e7c70b0d8db04134c=
5d1066bf98662e2871ad200ea3e"
-SRC_URI[system-deps-6.1.0.sha256sum] =3D "e5fa6fb9ee296c0dc2df41a656ca79=
48546d061958115ddb0bcaae43ad0d17d2"
-SRC_URI[target-lexicon-0.12.7.sha256sum] =3D "fd1ba337640d60c3e96bc6f063=
8a939b9c9a7f2c316a1598c279828b3d1dc8c5"
-SRC_URI[tempfile-3.5.0.sha256sum] =3D "b9fbec84f381d5795b08656e4912bec60=
4d162bff9291d6189a78f4c8ab87998"
+SRC_URI[syn-2.0.26.sha256sum] =3D "45c3457aacde3c65315de5031ec191ce46604=
304d2446e803d71ade03308d970"
+SRC_URI[system-deps-6.1.1.sha256sum] =3D "30c2de8a4d8f4b823d634affc9cd2a=
74ec98c53a756f317e529a48046cbf71f3"
+SRC_URI[target-lexicon-0.12.10.sha256sum] =3D "1d2faeef5759ab89935255b1a=
4cd98e0baf99d1085e37d36599c625dac49ae8e"
+SRC_URI[tempfile-3.7.0.sha256sum] =3D "5486094ee78b2e5038a6382ed7645bc08=
4dc2ec433426ca4c3cb61e2007b8998"
 SRC_URI[tendril-0.4.3.sha256sum] =3D "d24a120c5fc464a3458240ee02c299ebcb=
9d67b5249c8848b09d639dca8d7bb0"
 SRC_URI[termtree-0.4.1.sha256sum] =3D "3369f5ac52d5eb6ab48c6b4ffdc8efbca=
d6b89c765749064ba298f2c68a16a76"
 SRC_URI[textwrap-0.16.0.sha256sum] =3D "222a222a5bfe1bba4a77b45ec488a741=
b3cb8872e5e499451fd7d0129c9c7c3d"
-SRC_URI[thiserror-1.0.40.sha256sum] =3D "978c9a314bd8dc99be594bc3c175faa=
a9794be04a5a5e153caba6915336cebac"
-SRC_URI[thiserror-impl-1.0.40.sha256sum] =3D "f9456a42c5b0d803c8cd86e73d=
d7cc9edd429499f37a3550d286d5e86720569f"
+SRC_URI[thiserror-1.0.43.sha256sum] =3D "a35fc5b8971143ca348fa6df4f024d4=
d55264f3468c71ad1c2f365b0a4d58c42"
+SRC_URI[thiserror-impl-1.0.43.sha256sum] =3D "463fe12d7993d3b327787537ce=
8dd4dfa058de32fc2b195ef3cde03dc4771e8f"
 SRC_URI[time-0.2.27.sha256sum] =3D "4752a97f8eebd6854ff91f1c1824cd616062=
6ac4bd44287f7f4ea2035a02a242"
 SRC_URI[time-macros-0.1.1.sha256sum] =3D "957e9c6e26f12cb6d0dd7fc776bb67=
a706312e7299aed74c8dd5b17ebb27e2f1"
 SRC_URI[time-macros-impl-0.1.2.sha256sum] =3D "fd3c141a1b43194f3f56a1411=
225df8646c55781d5f26db825b3d98507eb482f"
 SRC_URI[tinytemplate-1.2.1.sha256sum] =3D "be4d6b5f19ff7664e8c98d03e2139=
cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b4=
62b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[toml-0.7.4.sha256sum] =3D "d6135d499e69981f9ff0ef2167955a5333c35=
e36f6937d382974566b3d5b94ec"
-SRC_URI[toml_datetime-0.6.2.sha256sum] =3D "5a76a9312f5ba4c2dec6b9161fdf=
25d87ad8a09256ccea5a556fef03c706a10f"
-SRC_URI[toml_edit-0.19.10.sha256sum] =3D "2380d56e8670370eee6566b0bfd426=
5f65b3f432e8c6d85623f728d4fa31f739"
+SRC_URI[toml-0.7.6.sha256sum] =3D "c17e963a819c331dcacd7ab957d80bc2b9a9c=
1e71c804826d2f283dd65306542"
+SRC_URI[toml_datetime-0.6.3.sha256sum] =3D "7cda73e2f1397b1262d6dfdcef8a=
afae14d1de7748d66822d3bfeeb6d03e5e4b"
+SRC_URI[toml_edit-0.19.14.sha256sum] =3D "f8123f27e969974a3dfba720fdb560=
be359f57b44302d280ba72e76a74480e8a"
 SRC_URI[typenum-1.16.0.sha256sum] =3D "497961ef93d974e23eb6f433eb5fe1b79=
30b659f06d12dec6fc44a8f554c0bba"
 SRC_URI[unarray-0.1.4.sha256sum] =3D "eaea85b334db583fe3274d12b4cd188003=
2beab409c0d774be044d4480ab9a94"
 SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D "92888ba5573ff080736b3648696b=
70cafad7d250551175acbaa4e0385b3e1460"
-SRC_URI[unicode-ident-1.0.9.sha256sum] =3D "b15811caf2415fb889178633e772=
4bad2509101cde276048e013b9def5e51fa0"
+SRC_URI[unicode-ident-1.0.11.sha256sum] =3D "301abaae475aa91687eb82514b3=
28ab47a211a533026cb25fc3e519b86adfc3c"
 SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
-SRC_URI[url-2.3.1.sha256sum] =3D "0d68c799ae75762b8c3fe375feb6600ef5602c=
883c5d21eb51c09f22b83c4643"
+SRC_URI[url-2.4.0.sha256sum] =3D "50bff7831e19200a85b17131d085c25d7811bc=
4e186efdaf54bbd132994a88cb"
 SRC_URI[utf-8-0.7.6.sha256sum] =3D "09cc8ee72d2a9becf2f2febe0205bbed8fc6=
615b7cb429ad062dc7b7ddd036a9"
 SRC_URI[utf8parse-0.2.1.sha256sum] =3D "711b9620af191e0cdc7468a8d14e709c=
3dcdb115b36f838e601583af800a370a"
 SRC_URI[version-compare-0.1.1.sha256sum] =3D "579a42fc0b8e0c63b76519a339=
be31bed574929511fa53c1a3acae26eb258f29"
@@ -588,37 +579,28 @@ SRC_URI[wait-timeout-0.2.0.sha256sum] =3D "9f200f5b=
12eb75f8c1ed65abd4b2db8a6e1b138
 SRC_URI[walkdir-2.3.3.sha256sum] =3D "36df944cda56c7d8d8b7496af378e6b16d=
e9284591917d307c9b4d313c44e698"
 SRC_URI[wasi-0.9.0+wasi-snapshot-preview1.sha256sum] =3D "cccddf32554fec=
c6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasm-bindgen-0.2.86.sha256sum] =3D "5bba0e8cb82ba49ff4e229459ff2=
2a191bbe9a1cb3a341610c9c33efc27ddf73"
-SRC_URI[wasm-bindgen-backend-0.2.86.sha256sum] =3D "19b04bc93f9d6bdee709=
f6bd2118f57dd6679cf1176a1af464fca3ab0d66d8fb"
-SRC_URI[wasm-bindgen-macro-0.2.86.sha256sum] =3D "14d6b024f1a526bb0234f5=
2840389927257beb670610081360e5a03c5df9c258"
-SRC_URI[wasm-bindgen-macro-support-0.2.86.sha256sum] =3D "e128beba882dd1=
eb6200e1dc92ae6c5dbaa4311aa7bb211ca035779e5efc39f8"
-SRC_URI[wasm-bindgen-shared-0.2.86.sha256sum] =3D "ed9d5b4305409d1fc9482=
fee2d7f9bcbf24b3972bf59817ef757e23982242a93"
-SRC_URI[web-sys-0.3.63.sha256sum] =3D "3bdd9ef4e984da1187bf8110c5cf5b845=
fbc87a23602cdf912386a76fcd3a7c2"
+SRC_URI[wasm-bindgen-0.2.87.sha256sum] =3D "7706a72ab36d8cb1f80ffbf0e071=
533974a60d0a308d01a5d0375bf60499a342"
+SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =3D "5ef2b6d3c510e9625e5f=
e6f509ab07d66a760f0885d858736483c32ed7809abd"
+SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =3D "dee495e55982a3bd48105a=
7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
+SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =3D "54681b18a46765=
f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
+SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =3D "ca6ad05a4870b2bf5fe99=
5117d3728437bd27d7cd5f06f13c17443ef369775a1"
+SRC_URI[web-sys-0.3.64.sha256sum] =3D "9b85cbef8c220a6abc02aefd892dfc0fc=
23afb1c6a426316ec33253a3877249b"
 SRC_URI[weezl-0.1.7.sha256sum] =3D "9193164d4de03a926d909d3bc7c30543cecb=
35400c02114792c2cae20d5e2dbb"
-SRC_URI[wide-0.7.9.sha256sum] =3D "5cd0496a71f3cc6bc4bf0ed91346426a5099e=
93d89807e663162dc5a1069ff65"
+SRC_URI[wide-0.7.11.sha256sum] =3D "aa469ffa65ef7e0ba0f164183697b89b8542=
53fd31aeb92358b7b6155177d62f"
 SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a=
8e97d2c0c4b001223f33a334e3ce5de178"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-0.48.0.sha256sum] =3D "e686886bc078bc1b0b600cac0147aadb8=
15089b6e4da64016cbd754b6342700f"
-SRC_URI[windows-sys-0.45.0.sha256sum] =3D "75283be5efb2831d37ea142365f00=
9c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
-SRC_URI[windows-targets-0.42.2.sha256sum] =3D "8e5180c00cd44c9b1c88adb36=
93291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows-targets-0.48.0.sha256sum] =3D "7b1eb6f0cd7c80c79759c9291=
14ef071b87354ce476d9d94271031c0497adfd5"
-SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] =3D "597a5118570b68bc0=
8d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
+SRC_URI[windows-targets-0.48.1.sha256sum] =3D "05d4b17490f70499f20b9e791=
dcf6a299785ce8af4d709018206dc5b4953e95f"
 SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D "91ae572e1b79dba88=
3e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] =3D "e08e8864a60f06ef0d0f=
f4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
 SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D "b2ef27e0d7bdfcfc7b86=
8b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.42.2.sha256sum] =3D "c61d927d8da41da96a81f029=
489353e68739737d3beca43145c8afec9a31a84f"
 SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D "622a1962a7db830d6fd0a696=
83c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.42.2.sha256sum] =3D "44d840b6ec649f480a41c8d=
80f9c65108b92d89345dd94027bfe06ac444d1060"
 SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D "4542c6e364ce21bf45d69fd=
d2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] =3D "8de912b8b8feb55c064867=
cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
 SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D "ca2b8a661f7628cbd23440=
e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] =3D "26d41b46a36d453748=
aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
 SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D "7896dbc1f41e08872e=
9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] =3D "9aec5da331524158c6d1a=
4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
 SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D "1a515f5799fe4961cb532=
f983ce2b23082366b898e52ffbce459c86f67c8378a"
-SRC_URI[winnow-0.4.6.sha256sum] =3D "61de7bac303dc551fe038e2b3cef0f57108=
7a47571ea6e79a87692ac99b99699"
+SRC_URI[winnow-0.5.0.sha256sum] =3D "81fac9742fd1ad1bd9643b991319f72dd03=
1016d44b77039a26977eb667141e7"
 SRC_URI[xml5ever-0.17.0.sha256sum] =3D "4034e1d05af98b51ad7214527730626f=
019682d797ba38b51689212118d8e650"
 SRC_URI[yeslogic-fontconfig-sys-4.0.1.sha256sum] =3D "ec657fd32bbcbeaef5=
c7bc8e10b3db95b143fab8db0a50079773dbf936fd4f73"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.56.3.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.56.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
index 76fd5ae2d51..4b9aaeecbe7 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -21,7 +21,7 @@ require ${BPN}-crates.inc
 SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-whe=
n-not-.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "1685aeacae9a441dcb12c0c3ec63706172a2f527=
05dafbefb8e7311d4d5e430b"
+SRC_URI[archive.sha256sum] =3D "5a328048a02d014645cd27f61140f4e0b11280fb=
2c7f2a21864fe0c59ac1ce88"
=20
 UPSTREAM_CHECK_REGEX =3D "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
--=20
2.34.1


