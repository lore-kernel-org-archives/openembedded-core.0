Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1523CD6E49
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 22:43:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15769.1780180997954729063
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 15:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nCMlnqD2;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf114b0cf9so15742125ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 15:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780180997; x=1780785797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgQ48vO2OPEYozpdTh/bahdjImSHXDZSmqJmSjUKd7g=;
        b=nCMlnqD2Sm0l6IJrZ/gJrdI2rZAmYhhZnk5MqZ9AV+pICDj+wkhAADM6MZbeXyFj5O
         j4OBZ5aF61D8+A+Bf/XGRDozB2MPZqhuCLrRIlHud+KMmELQdl+1lE6Dpf7jb4abX/ki
         C4nrMipcjamdRW4wOh2S41Q63YaiWP5coRMlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780180997; x=1780785797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xgQ48vO2OPEYozpdTh/bahdjImSHXDZSmqJmSjUKd7g=;
        b=USJOL/eabLlsWydyHN4rc2Wc71A54hlhGvaU1yqy8UMqe9c7etINGe1rA4dSb0vjJs
         GYzppx2LvcdHH+mGRlxlY5/RZ+QLevr0FUX97bLcRENdBXKwFaXRT5GQzPOXplzj4gJA
         lfcD+/YoZ+f6m7RzWHx9hJeZPElreowRrm14dQzMT5/1WSVN9qgaLT+x3eQyTgiDqy66
         8cxQntKCOyuSFiFX+ZSxwdIZwPAAE8kwvdaMoM0T8kAnpWFZ0vgbRmqxCtYPgLhn6EVj
         zZZwHNRm9ER2FLGyM5d7Q+0z9z6Jl8uVCcJiy0ZRSCojIuAnXQfra9dBNtQPS3BBlx5q
         znJg==
X-Gm-Message-State: AOJu0YxS78usNPx9Q3mQ08TWRP67Qs3zWUF1JvU2FTGv0BAlAV5t/Isk
	294fgaaAwB5sJ89FwBWqZ8NV5P6CBKjqja5y8eV0hLsUrnSjR8feT68Ho1ahK74Sd9JJhcWeYO0
	PDJjt
X-Gm-Gg: Acq92OF1MaFNT8iEgswfDp2njgEITnnMbt/tpMwJLf2WO2FDAPA9TzBcLBscaBDaVtm
	8d8kQ7+xjEFgWrB9dU1+hM56XkzQwDUR8McRQBbaPIeChbLjf7uuY4Ipe8G0pqQg62pWEK/b2OT
	6t9ZvzGBQjF35Nh5P4dfyYkW1Lbg2g0Ee3ADSzU8h20QsrmkC3tfVgdeOW5plh1QH2NemY/5gXJ
	iofLTH6pRfU/NFY5ZDWmlWjNtgGwwfGON4O88GHolYJjTuDpSYBUOTOOZi0K//h4NnoaCBTtAoM
	sp2Bwja/cGifB3J81dE+o8FRHMduxdETlcaeAyYjcl/P0HPUMKO7HKx/6AxHLxNe2vrRKj0TEpv
	t6/DEcIT8PA6jmHXfHLephR14xZRRZVSNTw6F57bTngH7MyAHBFepcZv+3zXss6kub5ys3ybkpN
	r+QNCQgFZPYJ7BVmJs85bBK1vzgTWQonLf5ac2dAen3FUyfE7pYWnpiTM3oLIbfce/jDh1FQLLR
	g==
X-Received: by 2002:a17:903:28d:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2c0a5559517mr40867915ad.2.1780180996910;
        Sat, 30 May 2026 15:43:16 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c26b3bsm58930145ad.64.2026.05.30.15.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:43:16 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] python3-uv-build: upgrade 0.11.14 -> 0.11.17
Date: Sat, 30 May 2026 15:42:32 -0700
Message-ID: <20260530224301.1456167-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530224301.1456167-1-tim.orling@konsulko.com>
References: <20260530224301.1456167-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 22:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237777

From: Tim Orling <tim.orling@konsulko.com>

0.11.17 [1]
Released on 2026-05-28.

Bug fixes
---------
* Improve the performance of large entries in tool.uv.conflicts
  (#19538)
* Avoid modifying the parent process' env with --env-file in uv
  run (#19567)
* Fix script environment creation for scripts with long filenames
  (#19539)
* Fix transitive Git archive dependencies in lockfiles (#19589)
* Preserve Git repository URLs in direct URL metadata (#19590)
* Support redirects in --check-url (#19594)
* Accept case-insensitive HTML tags in --find-links parsing (#19537)
* Reject duplicate script metadata blocks (#19544)
* Ban names like "python3" as script entry points (#19535, #19536)
* Validate Git LFS artifacts for Git archives (#19592)
* Use a relative path when creating symlinks in cache to improve
  relocatability (#19033)

See [1] for the rest of 0.11.17 changes.

0.11.16 [2]
Released on 2026-05-21.

Bug fixes
---------
* Allow environment variables that take a list to be empty (#19503)
* Ensure that incompatible wheel hints do not leak secrets (#19504)
* Reject unsafe entry points in uv-build (#19495)
* Restrict delimiters in entry point parsing (#19471)
* uv-netrc: fix multi-word no-space comment lines causing parse errors
  (#19494)

See [2] for the rest of 0.11.16 changes.

0.11.15 [3]
Released on 2026-05-18.

Security
--------
* Fix a TAR parser differential, see GHSA-3cv2-h65g-fgmm (#19463)
* Enforce that entry points cannot escape in the scripts directory, see
  GHSA-4gg8-gxpx-9rph (#19464)

Bug fixes
---------
* Apply workspace-member [tool.uv.sources] credentials under uv sync
  --frozen (#19423)
* Skip empty directories in uv build outputs (#19437)
* Fix Git submodule handling when using relative paths (#12156)
* Fix line number reporting in netrc parsing (#19452)

See [3] for the rest of 0.11.15 changes.

For full comparison of changes, see [4].

[1] https://github.com/astral-sh/uv/blob/main/CHANGELOG.md#01117
[2] https://github.com/astral-sh/uv/blob/main/CHANGELOG.md#01116
[3] https://github.com/astral-sh/uv/blob/main/CHANGELOG.md#01115
[4] https://github.com/astral-sh/uv/compare/0.11.14...0.11.17

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-uv-build-crates.inc        | 112 +++++++++++-------
 ...0.11.14.bb => python3-uv-build_0.11.17.bb} |   2 +-
 2 files changed, 71 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.14.bb => python3-uv-build_0.11.17.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 28706b0a3a..6c4d4ac473 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -13,7 +13,10 @@ SRC_URI += " \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.6 \
+    crate://crates.io/astral-tokio-tar/0.6.2 \
     crate://crates.io/astral-version-ranges/0.1.4 \
+    crate://crates.io/astral_async_zip/0.0.18-rc4 \
+    crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
@@ -25,7 +28,8 @@ SRC_URI += " \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.11.1 \
-    crate://crates.io/bzip2/0.6.1 \
+    crate://crates.io/bzip2/0.5.2 \
+    crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
@@ -55,7 +59,7 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.4.1 \
-    crate://crates.io/filetime/0.2.27 \
+    crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.9 \
@@ -68,6 +72,7 @@ SRC_URI += " \
     crate://crates.io/futures-core/0.3.32 \
     crate://crates.io/futures-executor/0.3.32 \
     crate://crates.io/futures-io/0.3.32 \
+    crate://crates.io/futures-lite/2.6.1 \
     crate://crates.io/futures-macro/0.3.32 \
     crate://crates.io/futures-sink/0.3.32 \
     crate://crates.io/futures-task/0.3.32 \
@@ -78,7 +83,7 @@ SRC_URI += " \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.17.0 \
+    crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/icu_collections/2.1.1 \
@@ -106,14 +111,12 @@ SRC_URI += " \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libbz2-rs-sys/0.2.2 \
     crate://crates.io/libc/0.2.183 \
-    crate://crates.io/libredox/0.1.14 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-rust2/0.16.2 \
+    crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.8.0 \
@@ -125,6 +128,7 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/owo-colors/4.3.0 \
+    crate://crates.io/parking/2.2.1 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
     crate://crates.io/path-slash/0.2.1 \
@@ -134,9 +138,10 @@ SRC_URI += " \
     crate://crates.io/pest_generator/2.8.6 \
     crate://crates.io/pest_meta/2.8.6 \
     crate://crates.io/petgraph/0.8.3 \
+    crate://crates.io/pin-project/1.1.11 \
+    crate://crates.io/pin-project-internal/1.1.11 \
     crate://crates.io/pin-project-lite/0.2.17 \
     crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/plain/0.2.3 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
@@ -149,7 +154,6 @@ SRC_URI += " \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
-    crate://crates.io/redox_syscall/0.7.0 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.29 \
@@ -168,6 +172,7 @@ SRC_URI += " \
     crate://crates.io/schemars_derive/1.2.1 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
+    crate://crates.io/self-replace/1.5.0 \
     crate://crates.io/semver/1.0.27 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde-untagged/0.1.9 \
@@ -175,7 +180,7 @@ SRC_URI += " \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
     crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/serde_spanned/1.0.4 \
+    crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shlex/1.3.0 \
@@ -191,7 +196,6 @@ SRC_URI += " \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar/0.4.45 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.3 \
@@ -202,13 +206,15 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.52.1 \
+    crate://crates.io/tokio/1.52.3 \
     crate://crates.io/tokio-macros/2.7.0 \
-    crate://crates.io/toml/0.9.10+spec-1.1.0 \
-    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.24.0+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.0.9+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
+    crate://crates.io/tokio-stream/0.1.18 \
+    crate://crates.io/tokio-util/0.7.18 \
+    crate://crates.io/toml/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.11+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
@@ -216,7 +222,6 @@ SRC_URI += " \
     crate://crates.io/tracing-subscriber/0.3.23 \
     crate://crates.io/tracing-test/0.2.6 \
     crate://crates.io/tracing-test-macro/0.2.6 \
-    crate://crates.io/typed-path/0.12.3 \
     crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.19.0 \
     crate://crates.io/ucd-trie/0.1.7 \
@@ -228,7 +233,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.0 \
+    crate://crates.io/uuid/1.23.1 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/walkdir/2.5.0 \
@@ -255,19 +260,29 @@ SRC_URI += " \
     crate://crates.io/windows-numerics/0.2.0 \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
+    crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.53.1 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.53.1 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_gnullvm/0.53.1 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.53.1 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.53.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
-    crate://crates.io/winnow/0.7.15 \
+    crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
     crate://crates.io/wit-bindgen-core/0.51.0 \
     crate://crates.io/wit-bindgen-rust/0.51.0 \
@@ -276,6 +291,7 @@ SRC_URI += " \
     crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
+    crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
     crate://crates.io/zerofrom/0.1.6 \
@@ -283,10 +299,8 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.3 \
     crate://crates.io/zerovec/0.11.5 \
     crate://crates.io/zerovec-derive/0.11.2 \
-    crate://crates.io/zip/8.1.0 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
-    crate://crates.io/zopfli/0.8.3 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
     crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
@@ -303,7 +317,10 @@ SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
+SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
+SRC_URI[astral_async_zip-0.0.18-rc4.sha256sum] = "9d523231a4339307c7699aa5d9492fe6873906afefc9d7853b5e7ffbfee3c7f1"
+SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
@@ -315,7 +332,8 @@ SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
-SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c"
+SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
+SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
@@ -345,7 +363,7 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
-SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
+SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
@@ -358,6 +376,7 @@ SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb7
 SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
 SRC_URI[futures-executor-0.3.32.sha256sum] = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
 SRC_URI[futures-io-0.3.32.sha256sum] = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
+SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
 SRC_URI[futures-macro-0.3.32.sha256sum] = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
 SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
 SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
@@ -368,7 +387,7 @@ SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.17.0.sha256sum] = "4f467dd6dccf739c208452f8014c75c18bb8301b050ad1cfb27153803edb0f51"
+SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[icu_collections-2.1.1.sha256sum] = "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
@@ -396,14 +415,12 @@ SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146e
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
 SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
-SRC_URI[libredox-0.1.14.sha256sum] = "1744e39d1d6a9948f4f388969627434e31128196de472883b39f148769bfe30a"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-rust2-0.16.2.sha256sum] = "47bb1e988e6fb779cf720ad431242d3f03167c1b3f2b1aae7f1a94b2495b36ae"
+SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
@@ -415,6 +432,7 @@ SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491b
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[owo-colors-4.3.0.sha256sum] = "d211803b9b6b570f68772237e415a029d5a50c65d382910b879fb19d3271f94d"
+SRC_URI[parking-2.2.1.sha256sum] = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
 SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
 SRC_URI[path-slash-0.2.1.sha256sum] = "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
@@ -424,9 +442,10 @@ SRC_URI[pest_derive-2.8.6.sha256sum] = "11f486f1ea21e6c10ed15d5a7c77165d0ee44340
 SRC_URI[pest_generator-2.8.6.sha256sum] = "8040c4647b13b210a963c1ed407c1ff4fdfa01c31d6d2a098218702e6664f94f"
 SRC_URI[pest_meta-2.8.6.sha256sum] = "89815c69d36021a140146f26659a81d6c2afa33d216d736dd4be5381a7362220"
 SRC_URI[petgraph-0.8.3.sha256sum] = "8701b58ea97060d5e5b155d383a69952a60943f0e6dfe30b04c287beb0b27455"
+SRC_URI[pin-project-1.1.11.sha256sum] = "f1749c7ed4bcaf4c3d0a3efc28538844fb29bcdd7d2b67b2be7e20ba861ff517"
+SRC_URI[pin-project-internal-1.1.11.sha256sum] = "d9b20ed30f105399776b9c883e68e536ef602a16ae6f596d2c473591d6ad64c6"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
@@ -439,7 +458,6 @@ SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
-SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00e4697b356fb1f74173a5e0ee27"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
@@ -458,6 +476,7 @@ SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a
 SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d81715d0420f8bc77a18c6260b307f"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
+SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
@@ -465,7 +484,7 @@ SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
 SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
+SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
@@ -481,7 +500,6 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-0.4.45.sha256sum] = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
@@ -492,13 +510,15 @@ SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.52.1.sha256sum] = "b67dee974fe86fd92cc45b7a95fdd2f99a36a6d7b0d431a231178d3d670bbcc6"
+SRC_URI[tokio-1.52.3.sha256sum] = "8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
-SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
-SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
-SRC_URI[toml_edit-0.24.0+spec-1.1.0.sha256sum] = "8c740b185920170a6d9191122cafef7010bd6270a3824594bff6784c04d7f09e"
-SRC_URI[toml_parser-1.0.9+spec-1.1.0.sha256sum] = "702d4415e08923e7e1ef96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4"
-SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] = "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
+SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
+SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
+SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
+SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_edit-0.25.11+spec-1.1.0.sha256sum] = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
+SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
@@ -506,7 +526,6 @@ SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54
 SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
 SRC_URI[tracing-test-0.2.6.sha256sum] = "19a4c448db514d4f24c5ddb9f73f2ee71bfb24c526cf0c570ba142d1119e0051"
 SRC_URI[tracing-test-macro-0.2.6.sha256sum] = "ad06847b7afb65c7866a36664b75c40b895e318cea4f71299f013fb22965329d"
-SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
@@ -518,7 +537,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.0.sha256sum] = "5ac8b6f42ead25368cf5b098aeb3dc8a1a2c05a3eee8a9a1a68c640edbfc79d9"
+SRC_URI[uuid-1.23.1.sha256sum] = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
@@ -545,19 +564,29 @@ SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
 SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
-SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
+SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
 SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
 SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
@@ -566,6 +595,7 @@ SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2
 SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
+SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
@@ -573,10 +603,8 @@ SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcb
 SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
 SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
 SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
-SRC_URI[zip-8.1.0.sha256sum] = "6e499faf5c6b97a0d086f4a8733de6d47aee2252b8127962439d8d4311a73f72"
 SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
-SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
 SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
index f443342e6b..4241f66586 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "89755665ec50d7f14dc4886cb88528990f00a6cd6b793b48c7bf17d86f29341e"
+SRC_URI[sha256sum] = "98fd71027ba123126ef586b681efece5f6e71b05c3ea58c27866853bba1966b9"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


