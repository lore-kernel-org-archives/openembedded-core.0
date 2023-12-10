Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDF8C10F05
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 19:10:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.60848.1702235456437810627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 11:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKsAPCRt;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-333536432e0so3597660f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 11:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702235454; x=1702840254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP60RsMzk8DLIvD2essufn727gTxYfFN++6en5NHkU0=;
        b=nKsAPCRtDvJUUHhKYER0IQK9c9sVpGAfGrYkrDRVuzd5hCL2+yfumspPfnnM52M/dS
         3wxEORGQGt1VsA+ZaIQjZ/6/qO/xgEUSCsWydnHlQNwfTJmsmBJnp7//r4Ows1bQ6rAz
         /45UTs6TPLetKQdTVE4dwzYitAyntLo9y/mr7ku2ZOE3Lmh3ZP9Z10Wx/J9eRdhs9/0P
         J2VgatmHrcGc3lyg33vVhttChmnJA6xWdRVxOwnTdFZKY6guCZbBYsCwUgH+iCRCOwRw
         dQdfdTa+pMimpMDi9EI2+iUH0n3Y9hum9WcxOXTpgbdwl2z0dF2MlnqB38rI6RFTDsU9
         ECMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702235454; x=1702840254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP60RsMzk8DLIvD2essufn727gTxYfFN++6en5NHkU0=;
        b=kpFAxt1VTGhZ77wUtJwRfwEHmc8LTrueLXRuBYSvBZvkxFZnIhRE/O1Ew7n8SlFN7M
         Pab7ChGxoHYJcTVNmcpt/qEYPeaCpxuzc3vp1Ti1KpaIwsJUilMaYxdkxwq0YjAPmJki
         IeFx1UbNNJaqX4mooA8TyLgC08e4WJpnPFR0prVwpiSNjmBK/HaObL96fcO0VzzwGhDs
         LVWBf6M02HycWChL3xw0SlU+OrGmCVu0Z5hqjL/O4EqNswQg31Imu8MCGMvD2k03xJWu
         GRbEzXIu+X2vEW0v9vZmyDjWXLK50GG85ONC5fRMVp6M+FyG9HjNvlSrnvAU8V5OnLr8
         yCZA==
X-Gm-Message-State: AOJu0YwHy+Z4TPHhXqnYBgZx1IFbNfXOFL2hLiFtEve/FxX5PVyPl391
	vCk0B+1tzPSgIGfALm2F9puifukMhBA=
X-Google-Smtp-Source: AGHT+IEpTIWKz8XY+3g+RF0+THSBx5VkOvVzOgiQd44kqk7dzi+SosgsDDyC0VIuNAtLucZYYCWAQQ==
X-Received: by 2002:adf:eed2:0:b0:333:3c99:4b52 with SMTP id a18-20020adfeed2000000b003333c994b52mr1470612wrp.80.1702235452863;
        Sun, 10 Dec 2023 11:10:52 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:81c9:b637:ed55:7895])
        by smtp.gmail.com with ESMTPSA id n13-20020adff08d000000b00333590f3bf9sm6893526wro.19.2023.12.10.11.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:10:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] zvariant: Upgrade 3.12 -> 3.15
Date: Sun, 10 Dec 2023 19:10:46 +0000
Message-Id: <20231210191046.4785-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231210191046.4785-1-alex.kiernan@gmail.com>
References: <20231210191046.4785-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192117

Source repo has moved from gitlab to github. Embed the Cargo.lock file
directly rather than using a patch to ease upgrades. Use the entire
source tree rather than hacking the Cargo.toml about/injecting LICENCE
manually.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../zvariant/zvariant-crates.inc              |  707 +++--
 .../zvariant/zvariant-git-crates.inc          |   14 -
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 --------
 .../zvariant/zvariant/Cargo.lock              | 2667 +++++++++++++++++
 ...{zvariant_3.12.0.bb => zvariant_3.15.0.bb} |   17 +-
 5 files changed, 3165 insertions(+), 1532 deletions(-)
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/Cargo.lock
 rename meta-selftest/recipes-extended/zvariant/{zvariant_3.12.0.bb => zvariant_3.15.0.bb} (66%)

diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
index 3a9759c4a533..fef27200d810 100644
--- a/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
+++ b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
@@ -1,258 +1,535 @@
 # Autogenerated with 'bitbake -c update_crates zvariant'
 
-# from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/anes/0.1.6;name=anes-0.1.6 \
-    crate://crates.io/anyhow/1.0.70;name=anyhow-1.0.70 \
-    crate://crates.io/arrayvec/0.7.2;name=arrayvec-0.7.2 \
-    crate://crates.io/atty/0.2.14;name=atty-0.2.14 \
-    crate://crates.io/autocfg/1.1.0;name=autocfg-1.1.0 \
-    crate://crates.io/bitflags/1.3.2;name=bitflags-1.3.2 \
-    crate://crates.io/bumpalo/3.12.0;name=bumpalo-3.12.0 \
-    crate://crates.io/byteorder/1.4.3;name=byteorder-1.4.3 \
-    crate://crates.io/cast/0.3.0;name=cast-0.3.0 \
-    crate://crates.io/cfg-if/1.0.0;name=cfg-if-1.0.0 \
-    crate://crates.io/chrono/0.4.24;name=chrono-0.4.24 \
-    crate://crates.io/ciborium/0.2.0;name=ciborium-0.2.0 \
-    crate://crates.io/ciborium-io/0.2.0;name=ciborium-io-0.2.0 \
-    crate://crates.io/ciborium-ll/0.2.0;name=ciborium-ll-0.2.0 \
-    crate://crates.io/clap/3.2.23;name=clap-3.2.23 \
-    crate://crates.io/clap_lex/0.2.4;name=clap_lex-0.2.4 \
-    crate://crates.io/criterion/0.4.0;name=criterion-0.4.0 \
-    crate://crates.io/criterion-plot/0.5.0;name=criterion-plot-0.5.0 \
-    crate://crates.io/crossbeam-channel/0.5.7;name=crossbeam-channel-0.5.7 \
-    crate://crates.io/crossbeam-deque/0.8.3;name=crossbeam-deque-0.8.3 \
-    crate://crates.io/crossbeam-epoch/0.9.14;name=crossbeam-epoch-0.9.14 \
-    crate://crates.io/crossbeam-utils/0.8.15;name=crossbeam-utils-0.8.15 \
-    crate://crates.io/either/1.8.1;name=either-1.8.1 \
-    crate://crates.io/enumflags2/0.7.5;name=enumflags2-0.7.5 \
-    crate://crates.io/enumflags2_derive/0.7.4;name=enumflags2_derive-0.7.4 \
-    crate://crates.io/form_urlencoded/1.1.0;name=form_urlencoded-1.1.0 \
-    crate://crates.io/futures-channel/0.3.27;name=futures-channel-0.3.27 \
-    crate://crates.io/futures-core/0.3.27;name=futures-core-0.3.27 \
-    crate://crates.io/futures-executor/0.3.27;name=futures-executor-0.3.27 \
-    crate://crates.io/futures-macro/0.3.27;name=futures-macro-0.3.27 \
-    crate://crates.io/futures-task/0.3.27;name=futures-task-0.3.27 \
-    crate://crates.io/futures-util/0.3.27;name=futures-util-0.3.27 \
-    crate://crates.io/getrandom/0.2.8;name=getrandom-0.2.8 \
-    crate://crates.io/half/1.8.2;name=half-1.8.2 \
-    crate://crates.io/hashbrown/0.12.3;name=hashbrown-0.12.3 \
-    crate://crates.io/heck/0.3.3;name=heck-0.3.3 \
-    crate://crates.io/hermit-abi/0.1.19;name=hermit-abi-0.1.19 \
-    crate://crates.io/hermit-abi/0.2.6;name=hermit-abi-0.2.6 \
-    crate://crates.io/idna/0.3.0;name=idna-0.3.0 \
-    crate://crates.io/indexmap/1.9.2;name=indexmap-1.9.2 \
-    crate://crates.io/itertools/0.9.0;name=itertools-0.9.0 \
-    crate://crates.io/itertools/0.10.5;name=itertools-0.10.5 \
-    crate://crates.io/itoa/1.0.6;name=itoa-1.0.6 \
-    crate://crates.io/js-sys/0.3.61;name=js-sys-0.3.61 \
-    crate://crates.io/lazy_static/1.4.0;name=lazy_static-1.4.0 \
-    crate://crates.io/libc/0.2.140;name=libc-0.2.140 \
-    crate://crates.io/log/0.4.17;name=log-0.4.17 \
-    crate://crates.io/memchr/2.5.0;name=memchr-2.5.0 \
-    crate://crates.io/memoffset/0.8.0;name=memoffset-0.8.0 \
-    crate://crates.io/num-integer/0.1.45;name=num-integer-0.1.45 \
-    crate://crates.io/num-traits/0.2.15;name=num-traits-0.2.15 \
-    crate://crates.io/num_cpus/1.15.0;name=num_cpus-1.15.0 \
-    crate://crates.io/once_cell/1.17.1;name=once_cell-1.17.1 \
-    crate://crates.io/oorandom/11.1.3;name=oorandom-11.1.3 \
-    crate://crates.io/os_str_bytes/6.5.0;name=os_str_bytes-6.5.0 \
-    crate://crates.io/percent-encoding/2.2.0;name=percent-encoding-2.2.0 \
-    crate://crates.io/pin-project-lite/0.2.9;name=pin-project-lite-0.2.9 \
-    crate://crates.io/pin-utils/0.1.0;name=pin-utils-0.1.0 \
-    crate://crates.io/pkg-config/0.3.26;name=pkg-config-0.3.26 \
-    crate://crates.io/plotters/0.3.4;name=plotters-0.3.4 \
-    crate://crates.io/plotters-backend/0.3.4;name=plotters-backend-0.3.4 \
-    crate://crates.io/plotters-svg/0.3.3;name=plotters-svg-0.3.3 \
-    crate://crates.io/ppv-lite86/0.2.17;name=ppv-lite86-0.2.17 \
-    crate://crates.io/proc-macro-crate/0.1.5;name=proc-macro-crate-0.1.5 \
-    crate://crates.io/proc-macro-crate/1.3.1;name=proc-macro-crate-1.3.1 \
-    crate://crates.io/proc-macro-error/1.0.4;name=proc-macro-error-1.0.4 \
-    crate://crates.io/proc-macro-error-attr/1.0.4;name=proc-macro-error-attr-1.0.4 \
-    crate://crates.io/proc-macro2/1.0.53;name=proc-macro2-1.0.53 \
-    crate://crates.io/quote/1.0.26;name=quote-1.0.26 \
-    crate://crates.io/rand/0.8.5;name=rand-0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1;name=rand_chacha-0.3.1 \
-    crate://crates.io/rand_core/0.6.4;name=rand_core-0.6.4 \
-    crate://crates.io/rayon/1.7.0;name=rayon-1.7.0 \
-    crate://crates.io/rayon-core/1.11.0;name=rayon-core-1.11.0 \
-    crate://crates.io/regex/1.7.2;name=regex-1.7.2 \
-    crate://crates.io/regex-syntax/0.6.29;name=regex-syntax-0.6.29 \
-    crate://crates.io/ryu/1.0.13;name=ryu-1.0.13 \
-    crate://crates.io/same-file/1.0.6;name=same-file-1.0.6 \
-    crate://crates.io/scopeguard/1.1.0;name=scopeguard-1.1.0 \
-    crate://crates.io/serde/1.0.158;name=serde-1.0.158 \
-    crate://crates.io/serde_bytes/0.11.9;name=serde_bytes-0.11.9 \
-    crate://crates.io/serde_derive/1.0.158;name=serde_derive-1.0.158 \
-    crate://crates.io/serde_json/1.0.94;name=serde_json-1.0.94 \
-    crate://crates.io/serde_repr/0.1.12;name=serde_repr-0.1.12 \
-    crate://crates.io/slab/0.4.8;name=slab-0.4.8 \
-    crate://crates.io/static_assertions/1.1.0;name=static_assertions-1.1.0 \
-    crate://crates.io/strum/0.18.0;name=strum-0.18.0 \
-    crate://crates.io/strum_macros/0.18.0;name=strum_macros-0.18.0 \
-    crate://crates.io/syn/1.0.109;name=syn-1.0.109 \
-    crate://crates.io/syn/2.0.8;name=syn-2.0.8 \
-    crate://crates.io/system-deps/1.3.2;name=system-deps-1.3.2 \
-    crate://crates.io/textwrap/0.16.0;name=textwrap-0.16.0 \
-    crate://crates.io/thiserror/1.0.40;name=thiserror-1.0.40 \
-    crate://crates.io/thiserror-impl/1.0.40;name=thiserror-impl-1.0.40 \
-    crate://crates.io/time/0.3.20;name=time-0.3.20 \
-    crate://crates.io/time-core/0.1.0;name=time-core-0.1.0 \
-    crate://crates.io/time-macros/0.2.8;name=time-macros-0.2.8 \
-    crate://crates.io/tinytemplate/1.2.1;name=tinytemplate-1.2.1 \
-    crate://crates.io/tinyvec/1.6.0;name=tinyvec-1.6.0 \
-    crate://crates.io/tinyvec_macros/0.1.1;name=tinyvec_macros-0.1.1 \
-    crate://crates.io/toml/0.5.11;name=toml-0.5.11 \
-    crate://crates.io/toml_datetime/0.6.1;name=toml_datetime-0.6.1 \
-    crate://crates.io/toml_edit/0.19.8;name=toml_edit-0.19.8 \
-    crate://crates.io/unicode-bidi/0.3.13;name=unicode-bidi-0.3.13 \
-    crate://crates.io/unicode-ident/1.0.8;name=unicode-ident-1.0.8 \
-    crate://crates.io/unicode-normalization/0.1.22;name=unicode-normalization-0.1.22 \
-    crate://crates.io/unicode-segmentation/1.10.1;name=unicode-segmentation-1.10.1 \
-    crate://crates.io/url/2.3.1;name=url-2.3.1 \
-    crate://crates.io/uuid/1.3.0;name=uuid-1.3.0 \
-    crate://crates.io/version-compare/0.0.10;name=version-compare-0.0.10 \
-    crate://crates.io/version_check/0.9.4;name=version_check-0.9.4 \
-    crate://crates.io/walkdir/2.3.3;name=walkdir-2.3.3 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1;name=wasi-0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.84;name=wasm-bindgen-0.2.84 \
-    crate://crates.io/wasm-bindgen-backend/0.2.84;name=wasm-bindgen-backend-0.2.84 \
-    crate://crates.io/wasm-bindgen-macro/0.2.84;name=wasm-bindgen-macro-0.2.84 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.84;name=wasm-bindgen-macro-support-0.2.84 \
-    crate://crates.io/wasm-bindgen-shared/0.2.84;name=wasm-bindgen-shared-0.2.84 \
-    crate://crates.io/web-sys/0.3.61;name=web-sys-0.3.61 \
-    crate://crates.io/winapi/0.3.9;name=winapi-0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0;name=winapi-i686-pc-windows-gnu-0.4.0 \
-    crate://crates.io/winapi-util/0.1.5;name=winapi-util-0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0;name=winapi-x86_64-pc-windows-gnu-0.4.0 \
-    crate://crates.io/winnow/0.4.0;name=winnow-0.4.0 \
-    crate://crates.io/zvariant_derive/3.12.0;name=zvariant_derive-3.12.0 \
-    crate://crates.io/zvariant_utils/1.0.0;name=zvariant_utils-1.0.0 \
+    crate://crates.io/addr2line/0.21.0 \
+    crate://crates.io/adler/1.0.2 \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/anes/0.1.6 \
+    crate://crates.io/anyhow/1.0.75 \
+    crate://crates.io/arrayvec/0.7.4 \
+    crate://crates.io/async-attributes/1.1.2 \
+    crate://crates.io/async-broadcast/0.5.1 \
+    crate://crates.io/async-channel/1.9.0 \
+    crate://crates.io/async-channel/2.1.1 \
+    crate://crates.io/async-executor/1.8.0 \
+    crate://crates.io/async-fs/1.6.0 \
+    crate://crates.io/async-global-executor/2.4.0 \
+    crate://crates.io/async-io/1.13.0 \
+    crate://crates.io/async-io/2.2.1 \
+    crate://crates.io/async-lock/2.8.0 \
+    crate://crates.io/async-lock/3.2.0 \
+    crate://crates.io/async-process/1.8.1 \
+    crate://crates.io/async-recursion/1.0.5 \
+    crate://crates.io/async-signal/0.2.5 \
+    crate://crates.io/async-std/1.12.0 \
+    crate://crates.io/async-task/4.5.0 \
+    crate://crates.io/async-trait/0.1.74 \
+    crate://crates.io/atomic-waker/1.1.2 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/backtrace/0.3.69 \
+    crate://crates.io/basic-toml/0.1.7 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.1 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/blocking/1.5.1 \
+    crate://crates.io/bumpalo/3.14.0 \
+    crate://crates.io/byteorder/1.5.0 \
+    crate://crates.io/bytes/0.4.12 \
+    crate://crates.io/bytes/1.5.0 \
+    crate://crates.io/cast/0.3.0 \
+    crate://crates.io/cc/1.0.83 \
+    crate://crates.io/cfg-expr/0.15.5 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.31 \
+    crate://crates.io/ciborium/0.2.1 \
+    crate://crates.io/ciborium-io/0.2.1 \
+    crate://crates.io/ciborium-ll/0.2.1 \
+    crate://crates.io/clap/3.2.25 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/concurrent-queue/2.4.0 \
+    crate://crates.io/cpufeatures/0.2.11 \
+    crate://crates.io/criterion/0.4.0 \
+    crate://crates.io/criterion-plot/0.5.0 \
+    crate://crates.io/crossbeam-deque/0.8.3 \
+    crate://crates.io/crossbeam-epoch/0.9.15 \
+    crate://crates.io/crossbeam-utils/0.8.16 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/deranged/0.3.10 \
+    crate://crates.io/derivative/2.2.0 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/doc-comment/0.3.3 \
+    crate://crates.io/either/1.9.0 \
+    crate://crates.io/enumflags2/0.7.8 \
+    crate://crates.io/enumflags2_derive/0.7.8 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/event-listener/2.5.3 \
+    crate://crates.io/event-listener/3.1.0 \
+    crate://crates.io/event-listener/4.0.0 \
+    crate://crates.io/event-listener-strategy/0.4.0 \
+    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/form_urlencoded/1.2.1 \
+    crate://crates.io/futures/0.3.29 \
+    crate://crates.io/futures-channel/0.3.29 \
+    crate://crates.io/futures-core/0.3.29 \
+    crate://crates.io/futures-executor/0.3.29 \
+    crate://crates.io/futures-io/0.3.29 \
+    crate://crates.io/futures-lite/1.13.0 \
+    crate://crates.io/futures-lite/2.1.0 \
+    crate://crates.io/futures-macro/0.3.29 \
+    crate://crates.io/futures-sink/0.3.29 \
+    crate://crates.io/futures-task/0.3.29 \
+    crate://crates.io/futures-util/0.3.29 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.11 \
+    crate://crates.io/gimli/0.28.1 \
+    crate://crates.io/gio-sys/0.17.10 \
+    crate://crates.io/glib/0.17.10 \
+    crate://crates.io/glib-macros/0.17.10 \
+    crate://crates.io/glib-sys/0.17.10 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/gloo-timers/0.2.6 \
+    crate://crates.io/gobject-sys/0.17.10 \
+    crate://crates.io/half/1.8.2 \
+    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.14.3 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hermit-abi/0.3.3 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/idna/0.5.0 \
+    crate://crates.io/indexmap/1.9.3 \
+    crate://crates.io/indexmap/2.1.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/iovec/0.1.4 \
+    crate://crates.io/itertools/0.10.5 \
+    crate://crates.io/itoa/1.0.10 \
+    crate://crates.io/js-sys/0.3.66 \
+    crate://crates.io/kv-log-macro/1.0.7 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.150 \
+    crate://crates.io/linux-raw-sys/0.3.8 \
+    crate://crates.io/linux-raw-sys/0.4.12 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/matchers/0.1.0 \
+    crate://crates.io/memchr/2.6.4 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/memoffset/0.7.1 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/miniz_oxide/0.7.1 \
+    crate://crates.io/mio/0.8.10 \
+    crate://crates.io/nix/0.23.2 \
+    crate://crates.io/nix/0.24.3 \
+    crate://crates.io/nix/0.26.4 \
+    crate://crates.io/ntest/0.9.0 \
+    crate://crates.io/ntest_test_cases/0.9.0 \
+    crate://crates.io/ntest_timeout/0.9.0 \
+    crate://crates.io/nu-ansi-term/0.46.0 \
+    crate://crates.io/num-traits/0.2.17 \
+    crate://crates.io/num_cpus/1.16.0 \
+    crate://crates.io/object/0.32.1 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/oorandom/11.1.3 \
+    crate://crates.io/ordered-stream/0.2.0 \
+    crate://crates.io/os_str_bytes/6.6.1 \
+    crate://crates.io/overload/0.1.1 \
+    crate://crates.io/parking/2.2.0 \
+    crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/pin-project-lite/0.2.13 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/piper/0.2.1 \
+    crate://crates.io/pkg-config/0.3.27 \
+    crate://crates.io/plotters/0.3.5 \
+    crate://crates.io/plotters-backend/0.3.5 \
+    crate://crates.io/plotters-svg/0.3.5 \
+    crate://crates.io/polling/2.8.0 \
+    crate://crates.io/polling/3.3.1 \
+    crate://crates.io/powerfmt/0.2.0 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/proc-macro-crate/1.3.1 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.70 \
+    crate://crates.io/quick-xml/0.27.1 \
+    crate://crates.io/quote/1.0.33 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/rayon/1.8.0 \
+    crate://crates.io/rayon-core/1.12.0 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/regex/1.10.2 \
+    crate://crates.io/regex-automata/0.1.10 \
+    crate://crates.io/regex-automata/0.4.3 \
+    crate://crates.io/regex-syntax/0.6.29 \
+    crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/rustc-demangle/0.1.23 \
+    crate://crates.io/rustix/0.37.27 \
+    crate://crates.io/rustix/0.38.27 \
+    crate://crates.io/rustversion/1.0.14 \
+    crate://crates.io/ryu/1.0.15 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/serde/1.0.193 \
+    crate://crates.io/serde-xml-rs/0.4.1 \
+    crate://crates.io/serde_bytes/0.11.12 \
+    crate://crates.io/serde_derive/1.0.193 \
+    crate://crates.io/serde_json/1.0.108 \
+    crate://crates.io/serde_repr/0.1.17 \
+    crate://crates.io/serde_spanned/0.6.4 \
+    crate://crates.io/sha1/0.10.6 \
+    crate://crates.io/sharded-slab/0.1.7 \
+    crate://crates.io/signal-hook-registry/1.4.1 \
+    crate://crates.io/slab/0.4.9 \
+    crate://crates.io/smallvec/1.11.2 \
+    crate://crates.io/snakecase/0.1.0 \
+    crate://crates.io/socket2/0.4.10 \
+    crate://crates.io/socket2/0.5.5 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.39 \
+    crate://crates.io/system-deps/6.2.0 \
+    crate://crates.io/target-lexicon/0.12.12 \
+    crate://crates.io/tempfile/3.8.1 \
+    crate://crates.io/termcolor/1.4.0 \
+    crate://crates.io/test-log/0.2.14 \
+    crate://crates.io/test-log-macros/0.2.14 \
+    crate://crates.io/textwrap/0.16.0 \
+    crate://crates.io/thiserror/1.0.50 \
+    crate://crates.io/thiserror-impl/1.0.50 \
+    crate://crates.io/thread_local/1.1.7 \
+    crate://crates.io/time/0.3.30 \
+    crate://crates.io/time-core/0.1.2 \
+    crate://crates.io/time-macros/0.2.15 \
+    crate://crates.io/tinytemplate/1.2.1 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.1 \
+    crate://crates.io/tokio/1.35.0 \
+    crate://crates.io/tokio-macros/2.2.0 \
+    crate://crates.io/tokio-vsock/0.3.4 \
+    crate://crates.io/toml/0.8.8 \
+    crate://crates.io/toml_datetime/0.6.5 \
+    crate://crates.io/toml_edit/0.19.15 \
+    crate://crates.io/toml_edit/0.21.0 \
+    crate://crates.io/tracing/0.1.40 \
+    crate://crates.io/tracing-attributes/0.1.27 \
+    crate://crates.io/tracing-core/0.1.32 \
+    crate://crates.io/tracing-subscriber/0.3.18 \
+    crate://crates.io/trybuild/1.0.85 \
+    crate://crates.io/typenum/1.17.0 \
+    crate://crates.io/uds_windows/1.0.2 \
+    crate://crates.io/unicode-bidi/0.3.14 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unicode-normalization/0.1.22 \
+    crate://crates.io/url/2.5.0 \
+    crate://crates.io/uuid/1.6.1 \
+    crate://crates.io/value-bag/1.4.2 \
+    crate://crates.io/version-compare/0.1.1 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/vsock/0.2.6 \
+    crate://crates.io/vsock/0.3.0 \
+    crate://crates.io/waker-fn/1.1.1 \
+    crate://crates.io/walkdir/2.4.0 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.89 \
+    crate://crates.io/wasm-bindgen-backend/0.2.89 \
+    crate://crates.io/wasm-bindgen-futures/0.4.39 \
+    crate://crates.io/wasm-bindgen-macro/0.2.89 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.89 \
+    crate://crates.io/wasm-bindgen-shared/0.2.89 \
+    crate://crates.io/web-sys/0.3.66 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.6 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/winnow/0.5.26 \
+    crate://crates.io/xdg-home/1.0.0 \
+    crate://crates.io/xml-rs/0.8.19 \
 "
 
+SRC_URI[addr2line-0.21.0.sha256sum] = "8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb"
+SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
+SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
 SRC_URI[anes-0.1.6.sha256sum] = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
-SRC_URI[anyhow-1.0.70.sha256sum] = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
-SRC_URI[arrayvec-0.7.2.sha256sum] = "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
+SRC_URI[anyhow-1.0.75.sha256sum] = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6"
+SRC_URI[arrayvec-0.7.4.sha256sum] = "96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711"
+SRC_URI[async-attributes-1.1.2.sha256sum] = "a3203e79f4dd9bdda415ed03cf14dae5a2bf775c683a00f94e9cd1faf0f596e5"
+SRC_URI[async-broadcast-0.5.1.sha256sum] = "7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b"
+SRC_URI[async-channel-1.9.0.sha256sum] = "81953c529336010edd6d8e358f886d9581267795c61b19475b71314bffa46d35"
+SRC_URI[async-channel-2.1.1.sha256sum] = "1ca33f4bc4ed1babef42cad36cc1f51fa88be00420404e5b1e80ab1b18f7678c"
+SRC_URI[async-executor-1.8.0.sha256sum] = "17ae5ebefcc48e7452b4987947920dac9450be1110cadf34d1b8c116bdbaf97c"
+SRC_URI[async-fs-1.6.0.sha256sum] = "279cf904654eeebfa37ac9bb1598880884924aab82e290aa65c9e77a0e142e06"
+SRC_URI[async-global-executor-2.4.0.sha256sum] = "9b4353121d5644cdf2beb5726ab752e79a8db1ebb52031770ec47db31d245526"
+SRC_URI[async-io-1.13.0.sha256sum] = "0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af"
+SRC_URI[async-io-2.2.1.sha256sum] = "d6d3b15875ba253d1110c740755e246537483f152fa334f91abd7fe84c88b3ff"
+SRC_URI[async-lock-2.8.0.sha256sum] = "287272293e9d8c41773cec55e365490fe034813a2f172f502d6ddcf75b2f582b"
+SRC_URI[async-lock-3.2.0.sha256sum] = "7125e42787d53db9dd54261812ef17e937c95a51e4d291373b670342fa44310c"
+SRC_URI[async-process-1.8.1.sha256sum] = "ea6438ba0a08d81529c69b36700fa2f95837bfe3e776ab39cde9c14d9149da88"
+SRC_URI[async-recursion-1.0.5.sha256sum] = "5fd55a5ba1179988837d24ab4c7cc8ed6efdeff578ede0416b4225a5fca35bd0"
+SRC_URI[async-signal-0.2.5.sha256sum] = "9e47d90f65a225c4527103a8d747001fc56e375203592b25ad103e1ca13124c5"
+SRC_URI[async-std-1.12.0.sha256sum] = "62565bb4402e926b29953c785397c6dc0391b7b446e45008b0049eb43cec6f5d"
+SRC_URI[async-task-4.5.0.sha256sum] = "b4eb2cdb97421e01129ccb49169d8279ed21e829929144f4a22a6e54ac549ca1"
+SRC_URI[async-trait-0.1.74.sha256sum] = "a66537f1bb974b254c98ed142ff995236e81b9d0fe4db0575f46612cb15eb0f9"
+SRC_URI[atomic-waker-1.1.2.sha256sum] = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
 SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[backtrace-0.3.69.sha256sum] = "2089b7e3f35b9dd2d0ed921ead4f6d318c27680d4a5bd167b3ee120edb105837"
+SRC_URI[basic-toml-0.1.7.sha256sum] = "2f2139706359229bfa8f19142ac1155b4b80beafb7a60471ac5dd109d4a19778"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bumpalo-3.12.0.sha256sum] = "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
-SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
+SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
+SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[blocking-1.5.1.sha256sum] = "6a37913e8dc4ddcc604f0c6d3bf2887c995153af3611de9e23c352b44c1b9118"
+SRC_URI[bumpalo-3.14.0.sha256sum] = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+SRC_URI[bytes-0.4.12.sha256sum] = "206fdffcfa2df7cbe15601ef46c813fce0965eb3286db6b56c583b814b51c81c"
+SRC_URI[bytes-1.5.0.sha256sum] = "a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
+SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
+SRC_URI[cfg-expr-0.15.5.sha256sum] = "03915af431787e6ffdcc74c645077518c6b6e01f80b761e0fbbfa288536311b3"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono-0.4.24.sha256sum] = "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
-SRC_URI[ciborium-0.2.0.sha256sum] = "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
-SRC_URI[ciborium-io-0.2.0.sha256sum] = "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
-SRC_URI[ciborium-ll-0.2.0.sha256sum] = "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
-SRC_URI[clap-3.2.23.sha256sum] = "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
+SRC_URI[chrono-0.4.31.sha256sum] = "7f2c685bad3eb3d45a01354cedb7d5faa66194d1d58ba6e267a8de788f79db38"
+SRC_URI[ciborium-0.2.1.sha256sum] = "effd91f6c78e5a4ace8a5d3c0b6bfaec9e2baaef55f3efc00e45fb2e477ee926"
+SRC_URI[ciborium-io-0.2.1.sha256sum] = "cdf919175532b369853f5d5e20b26b43112613fd6fe7aee757e35f7a44642656"
+SRC_URI[ciborium-ll-0.2.1.sha256sum] = "defaa24ecc093c77630e6c15e17c51f5e187bf35ee514f4e2d67baaa96dae22b"
+SRC_URI[clap-3.2.25.sha256sum] = "4ea181bf566f71cb9a5d17a59e1871af638180a18fb0035c92ae62b705207123"
 SRC_URI[clap_lex-0.2.4.sha256sum] = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
+SRC_URI[concurrent-queue-2.4.0.sha256sum] = "d16048cd947b08fa32c24458a22f5dc5e835264f689f4f5653210c69fd107363"
+SRC_URI[cpufeatures-0.2.11.sha256sum] = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
 SRC_URI[criterion-0.4.0.sha256sum] = "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
 SRC_URI[criterion-plot-0.5.0.sha256sum] = "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
-SRC_URI[crossbeam-channel-0.5.7.sha256sum] = "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
 SRC_URI[crossbeam-deque-0.8.3.sha256sum] = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
-SRC_URI[crossbeam-epoch-0.9.14.sha256sum] = "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
-SRC_URI[crossbeam-utils-0.8.15.sha256sum] = "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
-SRC_URI[either-1.8.1.sha256sum] = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
-SRC_URI[enumflags2-0.7.5.sha256sum] = "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
-SRC_URI[enumflags2_derive-0.7.4.sha256sum] = "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
-SRC_URI[form_urlencoded-1.1.0.sha256sum] = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
-SRC_URI[futures-channel-0.3.27.sha256sum] = "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
-SRC_URI[futures-core-0.3.27.sha256sum] = "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
-SRC_URI[futures-executor-0.3.27.sha256sum] = "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
-SRC_URI[futures-macro-0.3.27.sha256sum] = "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
-SRC_URI[futures-task-0.3.27.sha256sum] = "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
-SRC_URI[futures-util-0.3.27.sha256sum] = "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
-SRC_URI[getrandom-0.2.8.sha256sum] = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
+SRC_URI[crossbeam-epoch-0.9.15.sha256sum] = "ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7"
+SRC_URI[crossbeam-utils-0.8.16.sha256sum] = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294"
+SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[deranged-0.3.10.sha256sum] = "8eb30d70a07a3b04884d2677f06bec33509dc67ca60d92949e5535352d3191dc"
+SRC_URI[derivative-2.2.0.sha256sum] = "fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[doc-comment-0.3.3.sha256sum] = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[enumflags2-0.7.8.sha256sum] = "5998b4f30320c9d93aed72f63af821bfdac50465b75428fce77b48ec482c3939"
+SRC_URI[enumflags2_derive-0.7.8.sha256sum] = "f95e2801cd355d4a1a3e3953ce6ee5ae9603a5c833455343a8bfe3f44d418246"
+SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+SRC_URI[event-listener-2.5.3.sha256sum] = "0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0"
+SRC_URI[event-listener-3.1.0.sha256sum] = "d93877bcde0eb80ca09131a08d23f0a5c18a620b01db137dba666d18cd9b30c2"
+SRC_URI[event-listener-4.0.0.sha256sum] = "770d968249b5d99410d61f5bf89057f3199a077a04d087092f58e7d10692baae"
+SRC_URI[event-listener-strategy-0.4.0.sha256sum] = "958e4d70b6d5e81971bebec42271ec641e7ff4e170a6fa605f2b8a8b65cb97d3"
+SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+SRC_URI[futures-0.3.29.sha256sum] = "da0290714b38af9b4a7b094b8a37086d1b4e61f2df9122c3cad2577669145335"
+SRC_URI[futures-channel-0.3.29.sha256sum] = "ff4dd66668b557604244583e3e1e1eada8c5c2e96a6d0d6653ede395b78bbacb"
+SRC_URI[futures-core-0.3.29.sha256sum] = "eb1d22c66e66d9d72e1758f0bd7d4fd0bee04cad842ee34587d68c07e45d088c"
+SRC_URI[futures-executor-0.3.29.sha256sum] = "0f4fb8693db0cf099eadcca0efe2a5a22e4550f98ed16aba6c48700da29597bc"
+SRC_URI[futures-io-0.3.29.sha256sum] = "8bf34a163b5c4c52d0478a4d757da8fb65cabef42ba90515efee0f6f9fa45aaa"
+SRC_URI[futures-lite-1.13.0.sha256sum] = "49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce"
+SRC_URI[futures-lite-2.1.0.sha256sum] = "aeee267a1883f7ebef3700f262d2d54de95dfaf38189015a74fdc4e0c7ad8143"
+SRC_URI[futures-macro-0.3.29.sha256sum] = "53b153fd91e4b0147f4aced87be237c98248656bb01050b96bf3ee89220a8ddb"
+SRC_URI[futures-sink-0.3.29.sha256sum] = "e36d3378ee38c2a36ad710c5d30c2911d752cb941c00c72dbabfb786a7970817"
+SRC_URI[futures-task-0.3.29.sha256sum] = "efd193069b0ddadc69c46389b740bbccdd97203899b48d09c5f7969591d6bae2"
+SRC_URI[futures-util-0.3.29.sha256sum] = "a19526d624e703a3179b3d322efec918b6246ea0fa51d41124525f00f1cc8104"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
+SRC_URI[gimli-0.28.1.sha256sum] = "4271d37baee1b8c7e4b708028c57d816cf9d2434acb33a549475f78c181f6253"
+SRC_URI[gio-sys-0.17.10.sha256sum] = "0ccf87c30a12c469b6d958950f6a9c09f2be20b7773f7e70d20b867fdf2628c3"
+SRC_URI[glib-0.17.10.sha256sum] = "d3fad45ba8d4d2cea612b432717e834f48031cd8853c8aaf43b2c79fec8d144b"
+SRC_URI[glib-macros-0.17.10.sha256sum] = "eca5c79337338391f1ab8058d6698125034ce8ef31b72a442437fa6c8580de26"
+SRC_URI[glib-sys-0.17.10.sha256sum] = "d80aa6ea7bba0baac79222204aa786a6293078c210abe69ef1336911d4bdc4f0"
+SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[gloo-timers-0.2.6.sha256sum] = "9b995a66bb87bebce9a0f4a95aed01daca4872c050bfcb21653361c03bc35e5c"
+SRC_URI[gobject-sys-0.17.10.sha256sum] = "cd34c3317740a6358ec04572c1bcfd3ac0b5b6529275fae255b237b314bb8062"
 SRC_URI[half-1.8.2.sha256sum] = "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
 SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
-SRC_URI[heck-0.3.3.sha256sum] = "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
+SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.2.6.sha256sum] = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
-SRC_URI[idna-0.3.0.sha256sum] = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
-SRC_URI[indexmap-1.9.2.sha256sum] = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
-SRC_URI[itertools-0.9.0.sha256sum] = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
+SRC_URI[hermit-abi-0.3.3.sha256sum] = "d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7"
+SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
+SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
+SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
+SRC_URI[indexmap-2.1.0.sha256sum] = "d530e1a18b1cb4c484e6e34556a0d948706958449fca0cab753d649f2bce3d1f"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
 SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
-SRC_URI[itoa-1.0.6.sha256sum] = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
-SRC_URI[js-sys-0.3.61.sha256sum] = "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
+SRC_URI[itoa-1.0.10.sha256sum] = "b1a46d1a171d865aa5f83f92695765caa047a9b4cbae2cbf37dbd613a793fd4c"
+SRC_URI[js-sys-0.3.66.sha256sum] = "cee9c64da59eae3b50095c18d3e74f8b73c0b86d2792824ff01bbce68ba229ca"
+SRC_URI[kv-log-macro-1.0.7.sha256sum] = "0de8b303297635ad57c9f5059fd9cee7a47f8e8daa09df0fcd07dd39fb22977f"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.140.sha256sum] = "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
-SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
-SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
-SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[num_cpus-1.15.0.sha256sum] = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
-SRC_URI[once_cell-1.17.1.sha256sum] = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
+SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
+SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
+SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
+SRC_URI[memchr-2.6.4.sha256sum] = "f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167"
+SRC_URI[memoffset-0.6.5.sha256sum] = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
+SRC_URI[memoffset-0.7.1.sha256sum] = "5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4"
+SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[miniz_oxide-0.7.1.sha256sum] = "e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7"
+SRC_URI[mio-0.8.10.sha256sum] = "8f3d0b296e374a4e6f3c7b0a1f5a51d748a0d34c85e7dc48fc3fa9a87657fe09"
+SRC_URI[nix-0.23.2.sha256sum] = "8f3790c00a0150112de0f4cd161e3d7fc4b2d8a5542ffc35f099a2562aecb35c"
+SRC_URI[nix-0.24.3.sha256sum] = "fa52e972a9a719cecb6864fb88568781eb706bac2cd1d4f04a648542dbf78069"
+SRC_URI[nix-0.26.4.sha256sum] = "598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b"
+SRC_URI[ntest-0.9.0.sha256sum] = "da8ec6d2b73d45307e926f5af46809768581044384637af6b3f3fe7c3c88f512"
+SRC_URI[ntest_test_cases-0.9.0.sha256sum] = "be7d33be719c6f4d09e64e27c1ef4e73485dc4cc1f4d22201f89860a7fe22e22"
+SRC_URI[ntest_timeout-0.9.0.sha256sum] = "066b468120587a402f0b47d8f80035c921f6a46f8209efd0632a89a16f5188a4"
+SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
+SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
+SRC_URI[object-0.32.1.sha256sum] = "9cf5f9dd3933bd50a9e1f149ec995f39ae2c496d31fd772c1fd45ebc27e902b0"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[oorandom-11.1.3.sha256sum] = "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
-SRC_URI[os_str_bytes-6.5.0.sha256sum] = "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
-SRC_URI[percent-encoding-2.2.0.sha256sum] = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
-SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
+SRC_URI[ordered-stream-0.2.0.sha256sum] = "9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50"
+SRC_URI[os_str_bytes-6.6.1.sha256sum] = "e2355d85b9a3786f481747ced0e0ff2ba35213a1f9bd406ed906554d7af805a1"
+SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
+SRC_URI[parking-2.2.0.sha256sum] = "bb813b8af86854136c6922af0598d719255ecb2179515e6e7730d468f05c9cae"
+SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[pin-project-lite-0.2.13.sha256sum] = "8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-SRC_URI[plotters-0.3.4.sha256sum] = "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
-SRC_URI[plotters-backend-0.3.4.sha256sum] = "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
-SRC_URI[plotters-svg-0.3.3.sha256sum] = "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
+SRC_URI[piper-0.2.1.sha256sum] = "668d31b1c4eba19242f2088b2bf3316b82ca31082a8335764db4e083db7485d4"
+SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
+SRC_URI[plotters-0.3.5.sha256sum] = "d2c224ba00d7cadd4d5c660deaf2098e5e80e07846537c51f9cfa4be50c1fd45"
+SRC_URI[plotters-backend-0.3.5.sha256sum] = "9e76628b4d3a7581389a35d5b6e2139607ad7c75b17aed325f210aa91f4a9609"
+SRC_URI[plotters-svg-0.3.5.sha256sum] = "38f6d39893cca0701371e3c27294f09797214b86f1fb951b89ade8ec04e2abab"
+SRC_URI[polling-2.8.0.sha256sum] = "4b2d323e8ca7996b3e23126511a523f7e62924d93ecd5ae73b333815b0eb3dce"
+SRC_URI[polling-3.3.1.sha256sum] = "cf63fa624ab313c11656b4cda960bfc46c410187ad493c41f6ba2d8c1e991c9e"
+SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-SRC_URI[proc-macro-crate-0.1.5.sha256sum] = "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
 SRC_URI[proc-macro-crate-1.3.1.sha256sum] = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
 SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.53.sha256sum] = "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
-SRC_URI[quote-1.0.26.sha256sum] = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
+SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
+SRC_URI[quick-xml-0.27.1.sha256sum] = "ffc053f057dd768a56f62cd7e434c42c831d296968997e9ac1f76ea7c2d14c41"
+SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rayon-1.7.0.sha256sum] = "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
-SRC_URI[rayon-core-1.11.0.sha256sum] = "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
-SRC_URI[regex-1.7.2.sha256sum] = "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
+SRC_URI[rayon-1.8.0.sha256sum] = "9c27db03db7734835b3f53954b534c91069375ce6ccaa2e065441e07d9b6cdb1"
+SRC_URI[rayon-core-1.12.0.sha256sum] = "5ce3fb6ad83f861aac485e76e1985cd109d9a3713802152be56c3b1f0e0658ed"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
+SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
+SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
-SRC_URI[ryu-1.0.13.sha256sum] = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
+SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
+SRC_URI[rustc-demangle-0.1.23.sha256sum] = "d626bb9dae77e28219937af045c257c28bfd3f69333c512553507f5f9798cb76"
+SRC_URI[rustix-0.37.27.sha256sum] = "fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2"
+SRC_URI[rustix-0.38.27.sha256sum] = "bfeae074e687625746172d639330f1de242a178bf3189b51e35a7a21573513ac"
+SRC_URI[rustversion-1.0.14.sha256sum] = "7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4"
+SRC_URI[ryu-1.0.15.sha256sum] = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[serde-1.0.158.sha256sum] = "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
-SRC_URI[serde_bytes-0.11.9.sha256sum] = "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
-SRC_URI[serde_derive-1.0.158.sha256sum] = "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
-SRC_URI[serde_json-1.0.94.sha256sum] = "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
-SRC_URI[serde_repr-0.1.12.sha256sum] = "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
-SRC_URI[slab-0.4.8.sha256sum] = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[serde-1.0.193.sha256sum] = "25dd9975e68d0cb5aa1120c288333fc98731bd1dd12f561e468ea4728c042b89"
+SRC_URI[serde-xml-rs-0.4.1.sha256sum] = "f0bf1ba0696ccf0872866277143ff1fd14d22eec235d2b23702f95e6660f7dfa"
+SRC_URI[serde_bytes-0.11.12.sha256sum] = "ab33ec92f677585af6d88c65593ae2375adde54efdbf16d597f2cbc7a6d368ff"
+SRC_URI[serde_derive-1.0.193.sha256sum] = "43576ca501357b9b071ac53cdc7da8ef0cbd9493d8df094cd821777ea6e894d3"
+SRC_URI[serde_json-1.0.108.sha256sum] = "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"
+SRC_URI[serde_repr-0.1.17.sha256sum] = "3081f5ffbb02284dda55132aa26daecedd7372a42417bbbab6f14ab7d6bb9145"
+SRC_URI[serde_spanned-0.6.4.sha256sum] = "12022b835073e5b11e90a14f86838ceb1c8fb0325b72416845c487ac0fa95e80"
+SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
+SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
+SRC_URI[signal-hook-registry-1.4.1.sha256sum] = "d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1"
+SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
+SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
+SRC_URI[snakecase-0.1.0.sha256sum] = "bfa28ca481031c5019449fe13932199d8f5189d49a9ec1abfe00056d7d24637d"
+SRC_URI[socket2-0.4.10.sha256sum] = "9f7916fc008ca5542385b89a3d3ce689953c143e9304a9bf8beec1de48994c0d"
+SRC_URI[socket2-0.5.5.sha256sum] = "7b5fac59a5cb5dd637972e5fca70daf0523c9067fcdc4842f053dae04a18f8e9"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strum-0.18.0.sha256sum] = "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
-SRC_URI[strum_macros-0.18.0.sha256sum] = "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.8.sha256sum] = "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
-SRC_URI[system-deps-1.3.2.sha256sum] = "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
+SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
+SRC_URI[system-deps-6.2.0.sha256sum] = "2a2d580ff6a20c55dfb86be5f9c238f67835d0e81cbdea8bf5680e0897320331"
+SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
+SRC_URI[tempfile-3.8.1.sha256sum] = "7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5"
+SRC_URI[termcolor-1.4.0.sha256sum] = "ff1bc3d3f05aff0403e8ac0d92ced918ec05b666a43f83297ccef5bea8a3d449"
+SRC_URI[test-log-0.2.14.sha256sum] = "6159ab4116165c99fc88cce31f99fa2c9dbe08d3691cb38da02fc3b45f357d2b"
+SRC_URI[test-log-macros-0.2.14.sha256sum] = "7ba277e77219e9eea169e8508942db1bf5d8a41ff2db9b20aab5a5aadc9fa25d"
 SRC_URI[textwrap-0.16.0.sha256sum] = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
-SRC_URI[thiserror-1.0.40.sha256sum] = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
-SRC_URI[thiserror-impl-1.0.40.sha256sum] = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
-SRC_URI[time-0.3.20.sha256sum] = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
-SRC_URI[time-core-0.1.0.sha256sum] = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
-SRC_URI[time-macros-0.2.8.sha256sum] = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
+SRC_URI[thiserror-1.0.50.sha256sum] = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
+SRC_URI[thiserror-impl-1.0.50.sha256sum] = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
+SRC_URI[thread_local-1.1.7.sha256sum] = "3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152"
+SRC_URI[time-0.3.30.sha256sum] = "c4a34ab300f2dee6e562c10a046fc05e358b29f9bf92277f30c3c8d82275f6f5"
+SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
+SRC_URI[time-macros-0.2.15.sha256sum] = "4ad70d68dba9e1f8aceda7aa6711965dfec1cac869f311a51bd08b3a2ccbce20"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
-SRC_URI[toml_datetime-0.6.1.sha256sum] = "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
-SRC_URI[toml_edit-0.19.8.sha256sum] = "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
-SRC_URI[unicode-bidi-0.3.13.sha256sum] = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
-SRC_URI[unicode-ident-1.0.8.sha256sum] = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
+SRC_URI[tokio-1.35.0.sha256sum] = "841d45b238a16291a4e1584e61820b8ae57d696cc5015c459c229ccc6990cc1c"
+SRC_URI[tokio-macros-2.2.0.sha256sum] = "5b8a1e28f2deaa14e508979454cb3a223b10b938b45af148bc0986de36f1923b"
+SRC_URI[tokio-vsock-0.3.4.sha256sum] = "9b33556828911d16e24d8b5d336446b0bf6b4b9bfda52cbdc2fa35b7a2862ebc"
+SRC_URI[toml-0.8.8.sha256sum] = "a1a195ec8c9da26928f773888e0742ca3ca1040c6cd859c919c9f59c1954ab35"
+SRC_URI[toml_datetime-0.6.5.sha256sum] = "3550f4e9685620ac18a50ed434eb3aec30db8ba93b0287467bca5826ea25baf1"
+SRC_URI[toml_edit-0.19.15.sha256sum] = "1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421"
+SRC_URI[toml_edit-0.21.0.sha256sum] = "d34d383cd00a163b4a5b85053df514d45bc330f6de7737edfe0a93311d1eaa03"
+SRC_URI[tracing-0.1.40.sha256sum] = "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
+SRC_URI[tracing-attributes-0.1.27.sha256sum] = "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
+SRC_URI[tracing-core-0.1.32.sha256sum] = "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
+SRC_URI[tracing-subscriber-0.3.18.sha256sum] = "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
+SRC_URI[trybuild-1.0.85.sha256sum] = "196a58260a906cedb9bf6d8034b6379d0c11f552416960452f267402ceeddff1"
+SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+SRC_URI[uds_windows-1.0.2.sha256sum] = "ce65604324d3cce9b966701489fbd0cf318cb1f7bd9dd07ac9a4ee6fb791930d"
+SRC_URI[unicode-bidi-0.3.14.sha256sum] = "6f2528f27a9eb2b21e69c95319b30bd0efd85d09c379741b0f78ea1d86be2416"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
-SRC_URI[unicode-segmentation-1.10.1.sha256sum] = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
-SRC_URI[url-2.3.1.sha256sum] = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
-SRC_URI[uuid-1.3.0.sha256sum] = "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
-SRC_URI[version-compare-0.0.10.sha256sum] = "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
+SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
+SRC_URI[uuid-1.6.1.sha256sum] = "5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560"
+SRC_URI[value-bag-1.4.2.sha256sum] = "4a72e1902dde2bd6441347de2b70b7f5d59bf157c6c62f0c44572607a1d55bbe"
+SRC_URI[version-compare-0.1.1.sha256sum] = "579a42fc0b8e0c63b76519a339be31bed574929511fa53c1a3acae26eb258f29"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[walkdir-2.3.3.sha256sum] = "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
+SRC_URI[vsock-0.2.6.sha256sum] = "e32675ee2b3ce5df274c0ab52d19b28789632406277ca26bffee79a8e27dc133"
+SRC_URI[vsock-0.3.0.sha256sum] = "4c8e1df0bf1e1b28095c24564d1b90acae64ca69b097ed73896e342fa6649c57"
+SRC_URI[waker-fn-1.1.1.sha256sum] = "f3c4517f54858c779bbcbf228f4fca63d121bf85fbecb2dc578cdf4a39395690"
+SRC_URI[walkdir-2.4.0.sha256sum] = "d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasm-bindgen-0.2.84.sha256sum] = "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
-SRC_URI[wasm-bindgen-backend-0.2.84.sha256sum] = "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
-SRC_URI[wasm-bindgen-macro-0.2.84.sha256sum] = "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
-SRC_URI[wasm-bindgen-macro-support-0.2.84.sha256sum] = "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
-SRC_URI[wasm-bindgen-shared-0.2.84.sha256sum] = "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
-SRC_URI[web-sys-0.3.61.sha256sum] = "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
+SRC_URI[wasm-bindgen-0.2.89.sha256sum] = "0ed0d4f68a3015cc185aff4db9506a015f4b96f95303897bfa23f846db54064e"
+SRC_URI[wasm-bindgen-backend-0.2.89.sha256sum] = "1b56f625e64f3a1084ded111c4d5f477df9f8c92df113852fa5a374dbda78826"
+SRC_URI[wasm-bindgen-futures-0.4.39.sha256sum] = "ac36a15a220124ac510204aec1c3e5db8a22ab06fd6706d881dc6149f8ed9a12"
+SRC_URI[wasm-bindgen-macro-0.2.89.sha256sum] = "0162dbf37223cd2afce98f3d0785506dcb8d266223983e4b5b525859e6e182b2"
+SRC_URI[wasm-bindgen-macro-support-0.2.89.sha256sum] = "f0eb82fcb7930ae6219a7ecfd55b217f5f0893484b7a13022ebb2b2bf20b5283"
+SRC_URI[wasm-bindgen-shared-0.2.89.sha256sum] = "7ab9b36309365056cd639da3134bf87fa8f3d86008abf99e612384a6eecd459f"
+SRC_URI[web-sys-0.3.66.sha256sum] = "50c24a44ec86bb68fbecd1b3efed7e85ea5621b39b35ef2766b66cd984f8010f"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-util-0.1.6.sha256sum] = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[winnow-0.4.0.sha256sum] = "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
-SRC_URI[zvariant_derive-3.12.0.sha256sum] = "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
-SRC_URI[zvariant_utils-1.0.0.sha256sum] = "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[winnow-0.5.26.sha256sum] = "b67b5f0a4e7a27a64c651977932b9dc5667ca7fc31ac44b03ed37a0cf42fdfff"
+SRC_URI[xdg-home-1.0.0.sha256sum] = "2769203cd13a0c6015d515be729c526d041e9cf2c0cc478d57faee85f40c6dcd"
+SRC_URI[xml-rs-0.8.19.sha256sum] = "0fcb9cbac069e033553e8bb871be2fbdffcab578eb25bd0f7c508cedc6dcd75a"
diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc b/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
deleted file mode 100644
index f24cfe8e7c5b..000000000000
--- a/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SRC_URI += "\
-    git://github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib;type=git-dependency \
-    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys;type=git-dependency \
-    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys;type=git-dependency \
-"
-
-SRCREV_FORMAT .= "_glib"
-SRCREV_glib = "c9ee583cea07830c099cdcccd33eda9ef705ea93"
-
-SRCREV_FORMAT .= "_glib-sys"
-SRCREV_glib-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
-
-SRCREV_FORMAT .= "_gobject-sys"
-SRCREV_gobject-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
diff --git a/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
deleted file mode 100644
index ac6c5117bbf4..000000000000
--- a/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
+++ /dev/null
@@ -1,1292 +0,0 @@
-From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 2001
-From: Frederic Martinsons <frederic.martinsons@gmail.com>
-Date: Thu, 23 Mar 2023 07:12:37 +0100
-Subject: [PATCH] Tweak zvariant crate config
-
-This library crate is a part of zbus project, and is aimed to
-be published amongst the whole project.
-
-Nevertheless, this recipe is for showing example of real
-code which uses a local registry via git url inside yocto
-environment.
-
-I didn't find a real example of binary crate that uses git
-dependency but it seems to me a very common use case
-when we are working on multiple local crates that are not
-aimed to be published on public registry.
-
-Long story short, this patch add a modified Cargo.toml
-to use the zvariant_derive dependency from crates.io instead
-of zbus local one and a pre generated Cargo.lock in order
-to make cargo patch process inside cargo_common.bbclass work
-
-It also copied the LICENCE file from zbus project instead
-of symlink to it.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
----
- zvariant/Cargo.lock | 1198 +++++++++++++++++++++++++++++++++++++++++++
- zvariant/Cargo.toml |    2 +-
- zvariant/LICENSE    |   24 +-
- 3 files changed, 1222 insertions(+), 2 deletions(-)
- create mode 100644 zvariant/Cargo.lock
- mode change 120000 => 100644 zvariant/LICENSE
-
-diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
-new file mode 100644
-index 00000000..02a83d42
---- /dev/null
-+++ b/zvariant/Cargo.lock
-@@ -0,0 +1,1198 @@
-+# This file is automatically @generated by Cargo.
-+# It is not intended for manual editing.
-+version = 3
-+
-+[[package]]
-+name = "anes"
-+version = "0.1.6"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
-+
-+[[package]]
-+name = "anyhow"
-+version = "1.0.70"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
-+
-+[[package]]
-+name = "arrayvec"
-+version = "0.7.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
-+dependencies = [
-+ "serde",
-+]
-+
-+[[package]]
-+name = "atty"
-+version = "0.2.14"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
-+dependencies = [
-+ "hermit-abi 0.1.19",
-+ "libc",
-+ "winapi",
-+]
-+
-+[[package]]
-+name = "autocfg"
-+version = "1.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-+
-+[[package]]
-+name = "bitflags"
-+version = "1.3.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-+
-+[[package]]
-+name = "bumpalo"
-+version = "3.12.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
-+
-+[[package]]
-+name = "byteorder"
-+version = "1.4.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
-+
-+[[package]]
-+name = "cast"
-+version = "0.3.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
-+
-+[[package]]
-+name = "cfg-if"
-+version = "1.0.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-+
-+[[package]]
-+name = "chrono"
-+version = "0.4.24"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
-+dependencies = [
-+ "num-integer",
-+ "num-traits",
-+ "serde",
-+]
-+
-+[[package]]
-+name = "ciborium"
-+version = "0.2.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
-+dependencies = [
-+ "ciborium-io",
-+ "ciborium-ll",
-+ "serde",
-+]
-+
-+[[package]]
-+name = "ciborium-io"
-+version = "0.2.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
-+
-+[[package]]
-+name = "ciborium-ll"
-+version = "0.2.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
-+dependencies = [
-+ "ciborium-io",
-+ "half",
-+]
-+
-+[[package]]
-+name = "clap"
-+version = "3.2.23"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
-+dependencies = [
-+ "bitflags",
-+ "clap_lex",
-+ "indexmap",
-+ "textwrap",
-+]
-+
-+[[package]]
-+name = "clap_lex"
-+version = "0.2.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
-+dependencies = [
-+ "os_str_bytes",
-+]
-+
-+[[package]]
-+name = "criterion"
-+version = "0.4.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
-+dependencies = [
-+ "anes",
-+ "atty",
-+ "cast",
-+ "ciborium",
-+ "clap",
-+ "criterion-plot",
-+ "itertools 0.10.5",
-+ "lazy_static",
-+ "num-traits",
-+ "oorandom",
-+ "plotters",
-+ "rayon",
-+ "regex",
-+ "serde",
-+ "serde_derive",
-+ "serde_json",
-+ "tinytemplate",
-+ "walkdir",
-+]
-+
-+[[package]]
-+name = "criterion-plot"
-+version = "0.5.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
-+dependencies = [
-+ "cast",
-+ "itertools 0.10.5",
-+]
-+
-+[[package]]
-+name = "crossbeam-channel"
-+version = "0.5.7"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
-+dependencies = [
-+ "cfg-if",
-+ "crossbeam-utils",
-+]
-+
-+[[package]]
-+name = "crossbeam-deque"
-+version = "0.8.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
-+dependencies = [
-+ "cfg-if",
-+ "crossbeam-epoch",
-+ "crossbeam-utils",
-+]
-+
-+[[package]]
-+name = "crossbeam-epoch"
-+version = "0.9.14"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
-+dependencies = [
-+ "autocfg",
-+ "cfg-if",
-+ "crossbeam-utils",
-+ "memoffset",
-+ "scopeguard",
-+]
-+
-+[[package]]
-+name = "crossbeam-utils"
-+version = "0.8.15"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
-+dependencies = [
-+ "cfg-if",
-+]
-+
-+[[package]]
-+name = "either"
-+version = "1.8.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
-+
-+[[package]]
-+name = "enumflags2"
-+version = "0.7.5"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
-+dependencies = [
-+ "enumflags2_derive",
-+ "serde",
-+]
-+
-+[[package]]
-+name = "enumflags2_derive"
-+version = "0.7.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+]
-+
-+[[package]]
-+name = "form_urlencoded"
-+version = "1.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
-+dependencies = [
-+ "percent-encoding",
-+]
-+
-+[[package]]
-+name = "futures-channel"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
-+dependencies = [
-+ "futures-core",
-+]
-+
-+[[package]]
-+name = "futures-core"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
-+
-+[[package]]
-+name = "futures-executor"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
-+dependencies = [
-+ "futures-core",
-+ "futures-task",
-+ "futures-util",
-+]
-+
-+[[package]]
-+name = "futures-macro"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+]
-+
-+[[package]]
-+name = "futures-task"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
-+
-+[[package]]
-+name = "futures-util"
-+version = "0.3.27"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
-+dependencies = [
-+ "futures-core",
-+ "futures-macro",
-+ "futures-task",
-+ "pin-project-lite",
-+ "pin-utils",
-+ "slab",
-+]
-+
-+[[package]]
-+name = "getrandom"
-+version = "0.2.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
-+dependencies = [
-+ "cfg-if",
-+ "libc",
-+ "wasi",
-+]
-+
-+[[package]]
-+name = "glib"
-+version = "0.10.0"
-+source = "git+https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93"
-+dependencies = [
-+ "bitflags",
-+ "futures-channel",
-+ "futures-core",
-+ "futures-executor",
-+ "futures-task",
-+ "futures-util",
-+ "glib-macros",
-+ "glib-sys",
-+ "gobject-sys",
-+ "libc",
-+ "once_cell",
-+]
-+
-+[[package]]
-+name = "glib-macros"
-+version = "0.10.0"
-+source = "git+https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93"
-+dependencies = [
-+ "anyhow",
-+ "heck",
-+ "itertools 0.9.0",
-+ "proc-macro-crate 0.1.5",
-+ "proc-macro-error",
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+]
-+
-+[[package]]
-+name = "glib-sys"
-+version = "0.10.0"
-+source = "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
-+dependencies = [
-+ "libc",
-+ "system-deps",
-+]
-+
-+[[package]]
-+name = "gobject-sys"
-+version = "0.10.0"
-+source = "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
-+dependencies = [
-+ "glib-sys",
-+ "libc",
-+ "system-deps",
-+]
-+
-+[[package]]
-+name = "half"
-+version = "1.8.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
-+
-+[[package]]
-+name = "hashbrown"
-+version = "0.12.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
-+
-+[[package]]
-+name = "heck"
-+version = "0.3.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
-+dependencies = [
-+ "unicode-segmentation",
-+]
-+
-+[[package]]
-+name = "hermit-abi"
-+version = "0.1.19"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-+dependencies = [
-+ "libc",
-+]
-+
-+[[package]]
-+name = "hermit-abi"
-+version = "0.2.6"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
-+dependencies = [
-+ "libc",
-+]
-+
-+[[package]]
-+name = "idna"
-+version = "0.3.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
-+dependencies = [
-+ "unicode-bidi",
-+ "unicode-normalization",
-+]
-+
-+[[package]]
-+name = "indexmap"
-+version = "1.9.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
-+dependencies = [
-+ "autocfg",
-+ "hashbrown",
-+]
-+
-+[[package]]
-+name = "itertools"
-+version = "0.9.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
-+dependencies = [
-+ "either",
-+]
-+
-+[[package]]
-+name = "itertools"
-+version = "0.10.5"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
-+dependencies = [
-+ "either",
-+]
-+
-+[[package]]
-+name = "itoa"
-+version = "1.0.6"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
-+
-+[[package]]
-+name = "js-sys"
-+version = "0.3.61"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
-+dependencies = [
-+ "wasm-bindgen",
-+]
-+
-+[[package]]
-+name = "lazy_static"
-+version = "1.4.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-+
-+[[package]]
-+name = "libc"
-+version = "0.2.140"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
-+
-+[[package]]
-+name = "log"
-+version = "0.4.17"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-+dependencies = [
-+ "cfg-if",
-+]
-+
-+[[package]]
-+name = "memchr"
-+version = "2.5.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
-+
-+[[package]]
-+name = "memoffset"
-+version = "0.8.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
-+dependencies = [
-+ "autocfg",
-+]
-+
-+[[package]]
-+name = "num-integer"
-+version = "0.1.45"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-+dependencies = [
-+ "autocfg",
-+ "num-traits",
-+]
-+
-+[[package]]
-+name = "num-traits"
-+version = "0.2.15"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-+dependencies = [
-+ "autocfg",
-+]
-+
-+[[package]]
-+name = "num_cpus"
-+version = "1.15.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
-+dependencies = [
-+ "hermit-abi 0.2.6",
-+ "libc",
-+]
-+
-+[[package]]
-+name = "once_cell"
-+version = "1.17.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
-+
-+[[package]]
-+name = "oorandom"
-+version = "11.1.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
-+
-+[[package]]
-+name = "os_str_bytes"
-+version = "6.5.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
-+
-+[[package]]
-+name = "percent-encoding"
-+version = "2.2.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
-+
-+[[package]]
-+name = "pin-project-lite"
-+version = "0.2.9"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
-+
-+[[package]]
-+name = "pin-utils"
-+version = "0.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-+
-+[[package]]
-+name = "pkg-config"
-+version = "0.3.26"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-+
-+[[package]]
-+name = "plotters"
-+version = "0.3.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
-+dependencies = [
-+ "num-traits",
-+ "plotters-backend",
-+ "plotters-svg",
-+ "wasm-bindgen",
-+ "web-sys",
-+]
-+
-+[[package]]
-+name = "plotters-backend"
-+version = "0.3.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
-+
-+[[package]]
-+name = "plotters-svg"
-+version = "0.3.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
-+dependencies = [
-+ "plotters-backend",
-+]
-+
-+[[package]]
-+name = "ppv-lite86"
-+version = "0.2.17"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-+
-+[[package]]
-+name = "proc-macro-crate"
-+version = "0.1.5"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
-+dependencies = [
-+ "toml",
-+]
-+
-+[[package]]
-+name = "proc-macro-crate"
-+version = "1.3.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
-+dependencies = [
-+ "once_cell",
-+ "toml_edit",
-+]
-+
-+[[package]]
-+name = "proc-macro-error"
-+version = "1.0.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-+dependencies = [
-+ "proc-macro-error-attr",
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+ "version_check",
-+]
-+
-+[[package]]
-+name = "proc-macro-error-attr"
-+version = "1.0.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "version_check",
-+]
-+
-+[[package]]
-+name = "proc-macro2"
-+version = "1.0.53"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
-+dependencies = [
-+ "unicode-ident",
-+]
-+
-+[[package]]
-+name = "quote"
-+version = "1.0.26"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
-+dependencies = [
-+ "proc-macro2",
-+]
-+
-+[[package]]
-+name = "rand"
-+version = "0.8.5"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-+dependencies = [
-+ "libc",
-+ "rand_chacha",
-+ "rand_core",
-+]
-+
-+[[package]]
-+name = "rand_chacha"
-+version = "0.3.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
-+dependencies = [
-+ "ppv-lite86",
-+ "rand_core",
-+]
-+
-+[[package]]
-+name = "rand_core"
-+version = "0.6.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-+dependencies = [
-+ "getrandom",
-+]
-+
-+[[package]]
-+name = "rayon"
-+version = "1.7.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
-+dependencies = [
-+ "either",
-+ "rayon-core",
-+]
-+
-+[[package]]
-+name = "rayon-core"
-+version = "1.11.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
-+dependencies = [
-+ "crossbeam-channel",
-+ "crossbeam-deque",
-+ "crossbeam-utils",
-+ "num_cpus",
-+]
-+
-+[[package]]
-+name = "regex"
-+version = "1.7.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
-+dependencies = [
-+ "regex-syntax",
-+]
-+
-+[[package]]
-+name = "regex-syntax"
-+version = "0.6.29"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
-+
-+[[package]]
-+name = "ryu"
-+version = "1.0.13"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
-+
-+[[package]]
-+name = "same-file"
-+version = "1.0.6"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-+dependencies = [
-+ "winapi-util",
-+]
-+
-+[[package]]
-+name = "scopeguard"
-+version = "1.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-+
-+[[package]]
-+name = "serde"
-+version = "1.0.158"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
-+dependencies = [
-+ "serde_derive",
-+]
-+
-+[[package]]
-+name = "serde_bytes"
-+version = "0.11.9"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
-+dependencies = [
-+ "serde",
-+]
-+
-+[[package]]
-+name = "serde_derive"
-+version = "1.0.158"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 2.0.8",
-+]
-+
-+[[package]]
-+name = "serde_json"
-+version = "1.0.94"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
-+dependencies = [
-+ "itoa",
-+ "ryu",
-+ "serde",
-+]
-+
-+[[package]]
-+name = "serde_repr"
-+version = "0.1.12"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 2.0.8",
-+]
-+
-+[[package]]
-+name = "slab"
-+version = "0.4.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
-+dependencies = [
-+ "autocfg",
-+]
-+
-+[[package]]
-+name = "static_assertions"
-+version = "1.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-+
-+[[package]]
-+name = "strum"
-+version = "0.18.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
-+
-+[[package]]
-+name = "strum_macros"
-+version = "0.18.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
-+dependencies = [
-+ "heck",
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+]
-+
-+[[package]]
-+name = "syn"
-+version = "1.0.109"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "unicode-ident",
-+]
-+
-+[[package]]
-+name = "syn"
-+version = "2.0.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "unicode-ident",
-+]
-+
-+[[package]]
-+name = "system-deps"
-+version = "1.3.2"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
-+dependencies = [
-+ "heck",
-+ "pkg-config",
-+ "strum",
-+ "strum_macros",
-+ "thiserror",
-+ "toml",
-+ "version-compare",
-+]
-+
-+[[package]]
-+name = "textwrap"
-+version = "0.16.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
-+
-+[[package]]
-+name = "thiserror"
-+version = "1.0.40"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
-+dependencies = [
-+ "thiserror-impl",
-+]
-+
-+[[package]]
-+name = "thiserror-impl"
-+version = "1.0.40"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 2.0.8",
-+]
-+
-+[[package]]
-+name = "time"
-+version = "0.3.20"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
-+dependencies = [
-+ "serde",
-+ "time-core",
-+ "time-macros",
-+]
-+
-+[[package]]
-+name = "time-core"
-+version = "0.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
-+
-+[[package]]
-+name = "time-macros"
-+version = "0.2.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
-+dependencies = [
-+ "time-core",
-+]
-+
-+[[package]]
-+name = "tinytemplate"
-+version = "1.2.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
-+dependencies = [
-+ "serde",
-+ "serde_json",
-+]
-+
-+[[package]]
-+name = "tinyvec"
-+version = "1.6.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
-+dependencies = [
-+ "tinyvec_macros",
-+]
-+
-+[[package]]
-+name = "tinyvec_macros"
-+version = "0.1.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-+
-+[[package]]
-+name = "toml"
-+version = "0.5.11"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
-+dependencies = [
-+ "serde",
-+]
-+
-+[[package]]
-+name = "toml_datetime"
-+version = "0.6.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
-+
-+[[package]]
-+name = "toml_edit"
-+version = "0.19.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
-+dependencies = [
-+ "indexmap",
-+ "toml_datetime",
-+ "winnow",
-+]
-+
-+[[package]]
-+name = "unicode-bidi"
-+version = "0.3.13"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
-+
-+[[package]]
-+name = "unicode-ident"
-+version = "1.0.8"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
-+
-+[[package]]
-+name = "unicode-normalization"
-+version = "0.1.22"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
-+dependencies = [
-+ "tinyvec",
-+]
-+
-+[[package]]
-+name = "unicode-segmentation"
-+version = "1.10.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
-+
-+[[package]]
-+name = "url"
-+version = "2.3.1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
-+dependencies = [
-+ "form_urlencoded",
-+ "idna",
-+ "percent-encoding",
-+ "serde",
-+]
-+
-+[[package]]
-+name = "uuid"
-+version = "1.3.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
-+dependencies = [
-+ "serde",
-+]
-+
-+[[package]]
-+name = "version-compare"
-+version = "0.0.10"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
-+
-+[[package]]
-+name = "version_check"
-+version = "0.9.4"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-+
-+[[package]]
-+name = "walkdir"
-+version = "2.3.3"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
-+dependencies = [
-+ "same-file",
-+ "winapi-util",
-+]
-+
-+[[package]]
-+name = "wasi"
-+version = "0.11.0+wasi-snapshot-preview1"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-+
-+[[package]]
-+name = "wasm-bindgen"
-+version = "0.2.84"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
-+dependencies = [
-+ "cfg-if",
-+ "wasm-bindgen-macro",
-+]
-+
-+[[package]]
-+name = "wasm-bindgen-backend"
-+version = "0.2.84"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
-+dependencies = [
-+ "bumpalo",
-+ "log",
-+ "once_cell",
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+ "wasm-bindgen-shared",
-+]
-+
-+[[package]]
-+name = "wasm-bindgen-macro"
-+version = "0.2.84"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
-+dependencies = [
-+ "quote",
-+ "wasm-bindgen-macro-support",
-+]
-+
-+[[package]]
-+name = "wasm-bindgen-macro-support"
-+version = "0.2.84"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+ "wasm-bindgen-backend",
-+ "wasm-bindgen-shared",
-+]
-+
-+[[package]]
-+name = "wasm-bindgen-shared"
-+version = "0.2.84"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
-+
-+[[package]]
-+name = "web-sys"
-+version = "0.3.61"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
-+dependencies = [
-+ "js-sys",
-+ "wasm-bindgen",
-+]
-+
-+[[package]]
-+name = "winapi"
-+version = "0.3.9"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-+dependencies = [
-+ "winapi-i686-pc-windows-gnu",
-+ "winapi-x86_64-pc-windows-gnu",
-+]
-+
-+[[package]]
-+name = "winapi-i686-pc-windows-gnu"
-+version = "0.4.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-+
-+[[package]]
-+name = "winapi-util"
-+version = "0.1.5"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
-+dependencies = [
-+ "winapi",
-+]
-+
-+[[package]]
-+name = "winapi-x86_64-pc-windows-gnu"
-+version = "0.4.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-+
-+[[package]]
-+name = "winnow"
-+version = "0.4.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
-+dependencies = [
-+ "memchr",
-+]
-+
-+[[package]]
-+name = "zvariant"
-+version = "3.12.0"
-+dependencies = [
-+ "arrayvec",
-+ "byteorder",
-+ "chrono",
-+ "criterion",
-+ "enumflags2",
-+ "glib",
-+ "libc",
-+ "rand",
-+ "serde",
-+ "serde_bytes",
-+ "serde_json",
-+ "serde_repr",
-+ "static_assertions",
-+ "time",
-+ "url",
-+ "uuid",
-+ "zvariant_derive",
-+]
-+
-+[[package]]
-+name = "zvariant_derive"
-+version = "3.12.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
-+dependencies = [
-+ "proc-macro-crate 1.3.1",
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+ "zvariant_utils",
-+]
-+
-+[[package]]
-+name = "zvariant_utils"
-+version = "1.0.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
-+dependencies = [
-+ "proc-macro2",
-+ "quote",
-+ "syn 1.0.109",
-+]
-diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
-index 45367729..6981862a 100644
---- a/zvariant/Cargo.toml
-+++ b/zvariant/Cargo.toml
-@@ -27,7 +27,7 @@ byteorder = "1.4.3"
- serde = { version = "1.0", features = ["derive"] }
- arrayvec = { version = "0.7.2", features = ["serde"], optional = true }
- enumflags2 = { version = "0.7.5", features = ["serde"], optional = true }
--zvariant_derive = { version = "=3.12.0", path = "../zvariant_derive" }
-+zvariant_derive = "3.12.0"
- serde_bytes = { version = "0.11", optional = true }
- static_assertions = "1.1.0"
- libc = "0.2.137"
-diff --git a/zvariant/LICENSE b/zvariant/LICENSE
-deleted file mode 120000
-index ea5b6064..00000000
---- a/zvariant/LICENSE
-+++ /dev/null
-@@ -1 +0,0 @@
--../LICENSE
-\ No newline at end of file
-diff --git a/zvariant/LICENSE b/zvariant/LICENSE
-new file mode 100644
-index 00000000..31aa7938
---- /dev/null
-+++ b/zvariant/LICENSE
-@@ -0,0 +1,23 @@
-+Permission is hereby granted, free of charge, to any
-+person obtaining a copy of this software and associated
-+documentation files (the "Software"), to deal in the
-+Software without restriction, including without
-+limitation the rights to use, copy, modify, merge,
-+publish, distribute, sublicense, and/or sell copies of
-+the Software, and to permit persons to whom the Software
-+is furnished to do so, subject to the following
-+conditions:
-+
-+The above copyright notice and this permission notice
-+shall be included in all copies or substantial portions
-+of the Software.
-+
-+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
-+ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
-+TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-+PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
-+SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
-+IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+DEALINGS IN THE SOFTWARE.
--- 
-2.34.1
-
diff --git a/meta-selftest/recipes-extended/zvariant/zvariant/Cargo.lock b/meta-selftest/recipes-extended/zvariant/zvariant/Cargo.lock
new file mode 100644
index 000000000000..a0c8ce338686
--- /dev/null
+++ b/meta-selftest/recipes-extended/zvariant/zvariant/Cargo.lock
@@ -0,0 +1,2667 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "addr2line"
+version = "0.21.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb"
+dependencies = [
+ "gimli",
+]
+
+[[package]]
+name = "adler"
+version = "1.0.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
+
+[[package]]
+name = "aho-corasick"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "anes"
+version = "0.1.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
+
+[[package]]
+name = "anyhow"
+version = "1.0.75"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6"
+
+[[package]]
+name = "arrayvec"
+version = "0.7.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "async-attributes"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a3203e79f4dd9bdda415ed03cf14dae5a2bf775c683a00f94e9cd1faf0f596e5"
+dependencies = [
+ "quote",
+ "syn 1.0.109",
+]
+
+[[package]]
+name = "async-broadcast"
+version = "0.5.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b"
+dependencies = [
+ "event-listener 2.5.3",
+ "futures-core",
+]
+
+[[package]]
+name = "async-channel"
+version = "1.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "81953c529336010edd6d8e358f886d9581267795c61b19475b71314bffa46d35"
+dependencies = [
+ "concurrent-queue",
+ "event-listener 2.5.3",
+ "futures-core",
+]
+
+[[package]]
+name = "async-channel"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1ca33f4bc4ed1babef42cad36cc1f51fa88be00420404e5b1e80ab1b18f7678c"
+dependencies = [
+ "concurrent-queue",
+ "event-listener 4.0.0",
+ "event-listener-strategy",
+ "futures-core",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "async-executor"
+version = "1.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "17ae5ebefcc48e7452b4987947920dac9450be1110cadf34d1b8c116bdbaf97c"
+dependencies = [
+ "async-lock 3.2.0",
+ "async-task",
+ "concurrent-queue",
+ "fastrand 2.0.1",
+ "futures-lite 2.1.0",
+ "slab",
+]
+
+[[package]]
+name = "async-fs"
+version = "1.6.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "279cf904654eeebfa37ac9bb1598880884924aab82e290aa65c9e77a0e142e06"
+dependencies = [
+ "async-lock 2.8.0",
+ "autocfg",
+ "blocking",
+ "futures-lite 1.13.0",
+]
+
+[[package]]
+name = "async-global-executor"
+version = "2.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b4353121d5644cdf2beb5726ab752e79a8db1ebb52031770ec47db31d245526"
+dependencies = [
+ "async-channel 2.1.1",
+ "async-executor",
+ "async-io 2.2.1",
+ "async-lock 3.2.0",
+ "blocking",
+ "futures-lite 2.1.0",
+ "once_cell",
+]
+
+[[package]]
+name = "async-io"
+version = "1.13.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af"
+dependencies = [
+ "async-lock 2.8.0",
+ "autocfg",
+ "cfg-if",
+ "concurrent-queue",
+ "futures-lite 1.13.0",
+ "log",
+ "parking",
+ "polling 2.8.0",
+ "rustix 0.37.27",
+ "slab",
+ "socket2 0.4.10",
+ "waker-fn",
+]
+
+[[package]]
+name = "async-io"
+version = "2.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d6d3b15875ba253d1110c740755e246537483f152fa334f91abd7fe84c88b3ff"
+dependencies = [
+ "async-lock 3.2.0",
+ "cfg-if",
+ "concurrent-queue",
+ "futures-io",
+ "futures-lite 2.1.0",
+ "parking",
+ "polling 3.3.1",
+ "rustix 0.38.27",
+ "slab",
+ "tracing",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "async-lock"
+version = "2.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "287272293e9d8c41773cec55e365490fe034813a2f172f502d6ddcf75b2f582b"
+dependencies = [
+ "event-listener 2.5.3",
+]
+
+[[package]]
+name = "async-lock"
+version = "3.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7125e42787d53db9dd54261812ef17e937c95a51e4d291373b670342fa44310c"
+dependencies = [
+ "event-listener 4.0.0",
+ "event-listener-strategy",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "async-process"
+version = "1.8.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ea6438ba0a08d81529c69b36700fa2f95837bfe3e776ab39cde9c14d9149da88"
+dependencies = [
+ "async-io 1.13.0",
+ "async-lock 2.8.0",
+ "async-signal",
+ "blocking",
+ "cfg-if",
+ "event-listener 3.1.0",
+ "futures-lite 1.13.0",
+ "rustix 0.38.27",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "async-recursion"
+version = "1.0.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5fd55a5ba1179988837d24ab4c7cc8ed6efdeff578ede0416b4225a5fca35bd0"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "async-signal"
+version = "0.2.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9e47d90f65a225c4527103a8d747001fc56e375203592b25ad103e1ca13124c5"
+dependencies = [
+ "async-io 2.2.1",
+ "async-lock 2.8.0",
+ "atomic-waker",
+ "cfg-if",
+ "futures-core",
+ "futures-io",
+ "rustix 0.38.27",
+ "signal-hook-registry",
+ "slab",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "async-std"
+version = "1.12.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "62565bb4402e926b29953c785397c6dc0391b7b446e45008b0049eb43cec6f5d"
+dependencies = [
+ "async-attributes",
+ "async-channel 1.9.0",
+ "async-global-executor",
+ "async-io 1.13.0",
+ "async-lock 2.8.0",
+ "crossbeam-utils",
+ "futures-channel",
+ "futures-core",
+ "futures-io",
+ "futures-lite 1.13.0",
+ "gloo-timers",
+ "kv-log-macro",
+ "log",
+ "memchr",
+ "once_cell",
+ "pin-project-lite",
+ "pin-utils",
+ "slab",
+ "wasm-bindgen-futures",
+]
+
+[[package]]
+name = "async-task"
+version = "4.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b4eb2cdb97421e01129ccb49169d8279ed21e829929144f4a22a6e54ac549ca1"
+
+[[package]]
+name = "async-trait"
+version = "0.1.74"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a66537f1bb974b254c98ed142ff995236e81b9d0fe4db0575f46612cb15eb0f9"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "atomic-waker"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
+
+[[package]]
+name = "atty"
+version = "0.2.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
+dependencies = [
+ "hermit-abi 0.1.19",
+ "libc",
+ "winapi",
+]
+
+[[package]]
+name = "autocfg"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+
+[[package]]
+name = "backtrace"
+version = "0.3.69"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2089b7e3f35b9dd2d0ed921ead4f6d318c27680d4a5bd167b3ee120edb105837"
+dependencies = [
+ "addr2line",
+ "cc",
+ "cfg-if",
+ "libc",
+ "miniz_oxide",
+ "object",
+ "rustc-demangle",
+]
+
+[[package]]
+name = "basic-toml"
+version = "0.1.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2f2139706359229bfa8f19142ac1155b4b80beafb7a60471ac5dd109d4a19778"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "bitflags"
+version = "1.3.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+
+[[package]]
+name = "bitflags"
+version = "2.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
+
+[[package]]
+name = "block-buffer"
+version = "0.10.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+dependencies = [
+ "generic-array",
+]
+
+[[package]]
+name = "blocking"
+version = "1.5.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6a37913e8dc4ddcc604f0c6d3bf2887c995153af3611de9e23c352b44c1b9118"
+dependencies = [
+ "async-channel 2.1.1",
+ "async-lock 3.2.0",
+ "async-task",
+ "fastrand 2.0.1",
+ "futures-io",
+ "futures-lite 2.1.0",
+ "piper",
+ "tracing",
+]
+
+[[package]]
+name = "bumpalo"
+version = "3.14.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
+
+[[package]]
+name = "byteorder"
+version = "1.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+
+[[package]]
+name = "bytes"
+version = "0.4.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "206fdffcfa2df7cbe15601ef46c813fce0965eb3286db6b56c583b814b51c81c"
+dependencies = [
+ "byteorder",
+ "iovec",
+]
+
+[[package]]
+name = "bytes"
+version = "1.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223"
+
+[[package]]
+name = "cast"
+version = "0.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
+
+[[package]]
+name = "cc"
+version = "1.0.83"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "cfg-expr"
+version = "0.15.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "03915af431787e6ffdcc74c645077518c6b6e01f80b761e0fbbfa288536311b3"
+dependencies = [
+ "smallvec",
+ "target-lexicon",
+]
+
+[[package]]
+name = "cfg-if"
+version = "1.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+
+[[package]]
+name = "chrono"
+version = "0.4.31"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7f2c685bad3eb3d45a01354cedb7d5faa66194d1d58ba6e267a8de788f79db38"
+dependencies = [
+ "num-traits",
+ "serde",
+]
+
+[[package]]
+name = "ciborium"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "effd91f6c78e5a4ace8a5d3c0b6bfaec9e2baaef55f3efc00e45fb2e477ee926"
+dependencies = [
+ "ciborium-io",
+ "ciborium-ll",
+ "serde",
+]
+
+[[package]]
+name = "ciborium-io"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cdf919175532b369853f5d5e20b26b43112613fd6fe7aee757e35f7a44642656"
+
+[[package]]
+name = "ciborium-ll"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "defaa24ecc093c77630e6c15e17c51f5e187bf35ee514f4e2d67baaa96dae22b"
+dependencies = [
+ "ciborium-io",
+ "half",
+]
+
+[[package]]
+name = "clap"
+version = "3.2.25"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4ea181bf566f71cb9a5d17a59e1871af638180a18fb0035c92ae62b705207123"
+dependencies = [
+ "bitflags 1.3.2",
+ "clap_lex",
+ "indexmap 1.9.3",
+ "textwrap",
+]
+
+[[package]]
+name = "clap_lex"
+version = "0.2.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
+dependencies = [
+ "os_str_bytes",
+]
+
+[[package]]
+name = "concurrent-queue"
+version = "2.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d16048cd947b08fa32c24458a22f5dc5e835264f689f4f5653210c69fd107363"
+dependencies = [
+ "crossbeam-utils",
+]
+
+[[package]]
+name = "cpufeatures"
+version = "0.2.11"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "criterion"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
+dependencies = [
+ "anes",
+ "atty",
+ "cast",
+ "ciborium",
+ "clap",
+ "criterion-plot",
+ "itertools",
+ "lazy_static",
+ "num-traits",
+ "oorandom",
+ "plotters",
+ "rayon",
+ "regex",
+ "serde",
+ "serde_derive",
+ "serde_json",
+ "tinytemplate",
+ "walkdir",
+]
+
+[[package]]
+name = "criterion-plot"
+version = "0.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
+dependencies = [
+ "cast",
+ "itertools",
+]
+
+[[package]]
+name = "crossbeam-deque"
+version = "0.8.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
+dependencies = [
+ "cfg-if",
+ "crossbeam-epoch",
+ "crossbeam-utils",
+]
+
+[[package]]
+name = "crossbeam-epoch"
+version = "0.9.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7"
+dependencies = [
+ "autocfg",
+ "cfg-if",
+ "crossbeam-utils",
+ "memoffset 0.9.0",
+ "scopeguard",
+]
+
+[[package]]
+name = "crossbeam-utils"
+version = "0.8.16"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294"
+dependencies = [
+ "cfg-if",
+]
+
+[[package]]
+name = "crypto-common"
+version = "0.1.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+dependencies = [
+ "generic-array",
+ "typenum",
+]
+
+[[package]]
+name = "deranged"
+version = "0.3.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8eb30d70a07a3b04884d2677f06bec33509dc67ca60d92949e5535352d3191dc"
+dependencies = [
+ "powerfmt",
+ "serde",
+]
+
+[[package]]
+name = "derivative"
+version = "2.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+]
+
+[[package]]
+name = "digest"
+version = "0.10.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+dependencies = [
+ "block-buffer",
+ "crypto-common",
+]
+
+[[package]]
+name = "doc-comment"
+version = "0.3.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+
+[[package]]
+name = "either"
+version = "1.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+
+[[package]]
+name = "enumflags2"
+version = "0.7.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5998b4f30320c9d93aed72f63af821bfdac50465b75428fce77b48ec482c3939"
+dependencies = [
+ "enumflags2_derive",
+ "serde",
+]
+
+[[package]]
+name = "enumflags2_derive"
+version = "0.7.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f95e2801cd355d4a1a3e3953ce6ee5ae9603a5c833455343a8bfe3f44d418246"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "equivalent"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+
+[[package]]
+name = "errno"
+version = "0.3.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+dependencies = [
+ "libc",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "event-listener"
+version = "2.5.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0"
+
+[[package]]
+name = "event-listener"
+version = "3.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d93877bcde0eb80ca09131a08d23f0a5c18a620b01db137dba666d18cd9b30c2"
+dependencies = [
+ "concurrent-queue",
+ "parking",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "event-listener"
+version = "4.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "770d968249b5d99410d61f5bf89057f3199a077a04d087092f58e7d10692baae"
+dependencies = [
+ "concurrent-queue",
+ "parking",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "event-listener-strategy"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "958e4d70b6d5e81971bebec42271ec641e7ff4e170a6fa605f2b8a8b65cb97d3"
+dependencies = [
+ "event-listener 4.0.0",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "fastrand"
+version = "1.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+dependencies = [
+ "instant",
+]
+
+[[package]]
+name = "fastrand"
+version = "2.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+
+[[package]]
+name = "form_urlencoded"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+dependencies = [
+ "percent-encoding",
+]
+
+[[package]]
+name = "futures"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "da0290714b38af9b4a7b094b8a37086d1b4e61f2df9122c3cad2577669145335"
+dependencies = [
+ "futures-channel",
+ "futures-core",
+ "futures-executor",
+ "futures-io",
+ "futures-sink",
+ "futures-task",
+ "futures-util",
+]
+
+[[package]]
+name = "futures-channel"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ff4dd66668b557604244583e3e1e1eada8c5c2e96a6d0d6653ede395b78bbacb"
+dependencies = [
+ "futures-core",
+ "futures-sink",
+]
+
+[[package]]
+name = "futures-core"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eb1d22c66e66d9d72e1758f0bd7d4fd0bee04cad842ee34587d68c07e45d088c"
+
+[[package]]
+name = "futures-executor"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0f4fb8693db0cf099eadcca0efe2a5a22e4550f98ed16aba6c48700da29597bc"
+dependencies = [
+ "futures-core",
+ "futures-task",
+ "futures-util",
+]
+
+[[package]]
+name = "futures-io"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8bf34a163b5c4c52d0478a4d757da8fb65cabef42ba90515efee0f6f9fa45aaa"
+
+[[package]]
+name = "futures-lite"
+version = "1.13.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce"
+dependencies = [
+ "fastrand 1.9.0",
+ "futures-core",
+ "futures-io",
+ "memchr",
+ "parking",
+ "pin-project-lite",
+ "waker-fn",
+]
+
+[[package]]
+name = "futures-lite"
+version = "2.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "aeee267a1883f7ebef3700f262d2d54de95dfaf38189015a74fdc4e0c7ad8143"
+dependencies = [
+ "fastrand 2.0.1",
+ "futures-core",
+ "futures-io",
+ "parking",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "futures-macro"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "53b153fd91e4b0147f4aced87be237c98248656bb01050b96bf3ee89220a8ddb"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "futures-sink"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e36d3378ee38c2a36ad710c5d30c2911d752cb941c00c72dbabfb786a7970817"
+
+[[package]]
+name = "futures-task"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "efd193069b0ddadc69c46389b740bbccdd97203899b48d09c5f7969591d6bae2"
+
+[[package]]
+name = "futures-util"
+version = "0.3.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a19526d624e703a3179b3d322efec918b6246ea0fa51d41124525f00f1cc8104"
+dependencies = [
+ "futures-channel",
+ "futures-core",
+ "futures-io",
+ "futures-macro",
+ "futures-sink",
+ "futures-task",
+ "memchr",
+ "pin-project-lite",
+ "pin-utils",
+ "slab",
+]
+
+[[package]]
+name = "generic-array"
+version = "0.14.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+dependencies = [
+ "typenum",
+ "version_check",
+]
+
+[[package]]
+name = "getrandom"
+version = "0.2.11"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
+dependencies = [
+ "cfg-if",
+ "libc",
+ "wasi",
+]
+
+[[package]]
+name = "gimli"
+version = "0.28.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4271d37baee1b8c7e4b708028c57d816cf9d2434acb33a549475f78c181f6253"
+
+[[package]]
+name = "gio-sys"
+version = "0.17.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0ccf87c30a12c469b6d958950f6a9c09f2be20b7773f7e70d20b867fdf2628c3"
+dependencies = [
+ "glib-sys",
+ "gobject-sys",
+ "libc",
+ "system-deps",
+ "winapi",
+]
+
+[[package]]
+name = "glib"
+version = "0.17.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d3fad45ba8d4d2cea612b432717e834f48031cd8853c8aaf43b2c79fec8d144b"
+dependencies = [
+ "bitflags 1.3.2",
+ "futures-channel",
+ "futures-core",
+ "futures-executor",
+ "futures-task",
+ "futures-util",
+ "gio-sys",
+ "glib-macros",
+ "glib-sys",
+ "gobject-sys",
+ "libc",
+ "memchr",
+ "once_cell",
+ "smallvec",
+ "thiserror",
+]
+
+[[package]]
+name = "glib-macros"
+version = "0.17.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eca5c79337338391f1ab8058d6698125034ce8ef31b72a442437fa6c8580de26"
+dependencies = [
+ "anyhow",
+ "heck",
+ "proc-macro-crate",
+ "proc-macro-error",
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+]
+
+[[package]]
+name = "glib-sys"
+version = "0.17.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d80aa6ea7bba0baac79222204aa786a6293078c210abe69ef1336911d4bdc4f0"
+dependencies = [
+ "libc",
+ "system-deps",
+]
+
+[[package]]
+name = "glob"
+version = "0.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+
+[[package]]
+name = "gloo-timers"
+version = "0.2.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b995a66bb87bebce9a0f4a95aed01daca4872c050bfcb21653361c03bc35e5c"
+dependencies = [
+ "futures-channel",
+ "futures-core",
+ "js-sys",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "gobject-sys"
+version = "0.17.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cd34c3317740a6358ec04572c1bcfd3ac0b5b6529275fae255b237b314bb8062"
+dependencies = [
+ "glib-sys",
+ "libc",
+ "system-deps",
+]
+
+[[package]]
+name = "half"
+version = "1.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
+
+[[package]]
+name = "hashbrown"
+version = "0.12.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+
+[[package]]
+name = "hashbrown"
+version = "0.14.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
+
+[[package]]
+name = "heck"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+
+[[package]]
+name = "hermit-abi"
+version = "0.1.19"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "hermit-abi"
+version = "0.3.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7"
+
+[[package]]
+name = "hex"
+version = "0.4.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
+
+[[package]]
+name = "idna"
+version = "0.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
+dependencies = [
+ "unicode-bidi",
+ "unicode-normalization",
+]
+
+[[package]]
+name = "indexmap"
+version = "1.9.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
+dependencies = [
+ "autocfg",
+ "hashbrown 0.12.3",
+]
+
+[[package]]
+name = "indexmap"
+version = "2.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d530e1a18b1cb4c484e6e34556a0d948706958449fca0cab753d649f2bce3d1f"
+dependencies = [
+ "equivalent",
+ "hashbrown 0.14.3",
+]
+
+[[package]]
+name = "instant"
+version = "0.1.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+dependencies = [
+ "cfg-if",
+]
+
+[[package]]
+name = "io-lifetimes"
+version = "1.0.11"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+dependencies = [
+ "hermit-abi 0.3.3",
+ "libc",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "iovec"
+version = "0.1.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "itertools"
+version = "0.10.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
+dependencies = [
+ "either",
+]
+
+[[package]]
+name = "itoa"
+version = "1.0.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b1a46d1a171d865aa5f83f92695765caa047a9b4cbae2cbf37dbd613a793fd4c"
+
+[[package]]
+name = "js-sys"
+version = "0.3.66"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cee9c64da59eae3b50095c18d3e74f8b73c0b86d2792824ff01bbce68ba229ca"
+dependencies = [
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "kv-log-macro"
+version = "1.0.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0de8b303297635ad57c9f5059fd9cee7a47f8e8daa09df0fcd07dd39fb22977f"
+dependencies = [
+ "log",
+]
+
+[[package]]
+name = "lazy_static"
+version = "1.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+
+[[package]]
+name = "libc"
+version = "0.2.150"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
+
+[[package]]
+name = "linux-raw-sys"
+version = "0.3.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+
+[[package]]
+name = "linux-raw-sys"
+version = "0.4.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
+
+[[package]]
+name = "log"
+version = "0.4.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+dependencies = [
+ "value-bag",
+]
+
+[[package]]
+name = "matchers"
+version = "0.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
+dependencies = [
+ "regex-automata 0.1.10",
+]
+
+[[package]]
+name = "memchr"
+version = "2.6.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167"
+
+[[package]]
+name = "memoffset"
+version = "0.6.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "memoffset"
+version = "0.7.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "memoffset"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "miniz_oxide"
+version = "0.7.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7"
+dependencies = [
+ "adler",
+]
+
+[[package]]
+name = "mio"
+version = "0.8.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8f3d0b296e374a4e6f3c7b0a1f5a51d748a0d34c85e7dc48fc3fa9a87657fe09"
+dependencies = [
+ "libc",
+ "wasi",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "nix"
+version = "0.23.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8f3790c00a0150112de0f4cd161e3d7fc4b2d8a5542ffc35f099a2562aecb35c"
+dependencies = [
+ "bitflags 1.3.2",
+ "cc",
+ "cfg-if",
+ "libc",
+ "memoffset 0.6.5",
+]
+
+[[package]]
+name = "nix"
+version = "0.24.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fa52e972a9a719cecb6864fb88568781eb706bac2cd1d4f04a648542dbf78069"
+dependencies = [
+ "bitflags 1.3.2",
+ "cfg-if",
+ "libc",
+ "memoffset 0.6.5",
+]
+
+[[package]]
+name = "nix"
+version = "0.26.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b"
+dependencies = [
+ "bitflags 1.3.2",
+ "cfg-if",
+ "libc",
+ "memoffset 0.7.1",
+]
+
+[[package]]
+name = "ntest"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "da8ec6d2b73d45307e926f5af46809768581044384637af6b3f3fe7c3c88f512"
+dependencies = [
+ "ntest_test_cases",
+ "ntest_timeout",
+]
+
+[[package]]
+name = "ntest_test_cases"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "be7d33be719c6f4d09e64e27c1ef4e73485dc4cc1f4d22201f89860a7fe22e22"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+]
+
+[[package]]
+name = "ntest_timeout"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "066b468120587a402f0b47d8f80035c921f6a46f8209efd0632a89a16f5188a4"
+dependencies = [
+ "proc-macro-crate",
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+]
+
+[[package]]
+name = "nu-ansi-term"
+version = "0.46.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
+dependencies = [
+ "overload",
+ "winapi",
+]
+
+[[package]]
+name = "num-traits"
+version = "0.2.17"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "num_cpus"
+version = "1.16.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
+dependencies = [
+ "hermit-abi 0.3.3",
+ "libc",
+]
+
+[[package]]
+name = "object"
+version = "0.32.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9cf5f9dd3933bd50a9e1f149ec995f39ae2c496d31fd772c1fd45ebc27e902b0"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "once_cell"
+version = "1.19.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+
+[[package]]
+name = "oorandom"
+version = "11.1.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
+
+[[package]]
+name = "ordered-stream"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50"
+dependencies = [
+ "futures-core",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "os_str_bytes"
+version = "6.6.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e2355d85b9a3786f481747ced0e0ff2ba35213a1f9bd406ed906554d7af805a1"
+
+[[package]]
+name = "overload"
+version = "0.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
+
+[[package]]
+name = "parking"
+version = "2.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bb813b8af86854136c6922af0598d719255ecb2179515e6e7730d468f05c9cae"
+
+[[package]]
+name = "percent-encoding"
+version = "2.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+
+[[package]]
+name = "pin-project-lite"
+version = "0.2.13"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58"
+
+[[package]]
+name = "pin-utils"
+version = "0.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
+
+[[package]]
+name = "piper"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "668d31b1c4eba19242f2088b2bf3316b82ca31082a8335764db4e083db7485d4"
+dependencies = [
+ "atomic-waker",
+ "fastrand 2.0.1",
+ "futures-io",
+]
+
+[[package]]
+name = "pkg-config"
+version = "0.3.27"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
+
+[[package]]
+name = "plotters"
+version = "0.3.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d2c224ba00d7cadd4d5c660deaf2098e5e80e07846537c51f9cfa4be50c1fd45"
+dependencies = [
+ "num-traits",
+ "plotters-backend",
+ "plotters-svg",
+ "wasm-bindgen",
+ "web-sys",
+]
+
+[[package]]
+name = "plotters-backend"
+version = "0.3.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9e76628b4d3a7581389a35d5b6e2139607ad7c75b17aed325f210aa91f4a9609"
+
+[[package]]
+name = "plotters-svg"
+version = "0.3.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "38f6d39893cca0701371e3c27294f09797214b86f1fb951b89ade8ec04e2abab"
+dependencies = [
+ "plotters-backend",
+]
+
+[[package]]
+name = "polling"
+version = "2.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4b2d323e8ca7996b3e23126511a523f7e62924d93ecd5ae73b333815b0eb3dce"
+dependencies = [
+ "autocfg",
+ "bitflags 1.3.2",
+ "cfg-if",
+ "concurrent-queue",
+ "libc",
+ "log",
+ "pin-project-lite",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "polling"
+version = "3.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cf63fa624ab313c11656b4cda960bfc46c410187ad493c41f6ba2d8c1e991c9e"
+dependencies = [
+ "cfg-if",
+ "concurrent-queue",
+ "pin-project-lite",
+ "rustix 0.38.27",
+ "tracing",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "powerfmt"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
+
+[[package]]
+name = "ppv-lite86"
+version = "0.2.17"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+
+[[package]]
+name = "proc-macro-crate"
+version = "1.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
+dependencies = [
+ "once_cell",
+ "toml_edit 0.19.15",
+]
+
+[[package]]
+name = "proc-macro-error"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+dependencies = [
+ "proc-macro-error-attr",
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+ "version_check",
+]
+
+[[package]]
+name = "proc-macro-error-attr"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "version_check",
+]
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.70"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "quick-xml"
+version = "0.27.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ffc053f057dd768a56f62cd7e434c42c831d296968997e9ac1f76ea7c2d14c41"
+dependencies = [
+ "memchr",
+ "serde",
+]
+
+[[package]]
+name = "quote"
+version = "1.0.33"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "rand"
+version = "0.8.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+dependencies = [
+ "libc",
+ "rand_chacha",
+ "rand_core",
+]
+
+[[package]]
+name = "rand_chacha"
+version = "0.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+dependencies = [
+ "ppv-lite86",
+ "rand_core",
+]
+
+[[package]]
+name = "rand_core"
+version = "0.6.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+dependencies = [
+ "getrandom",
+]
+
+[[package]]
+name = "rayon"
+version = "1.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9c27db03db7734835b3f53954b534c91069375ce6ccaa2e065441e07d9b6cdb1"
+dependencies = [
+ "either",
+ "rayon-core",
+]
+
+[[package]]
+name = "rayon-core"
+version = "1.12.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5ce3fb6ad83f861aac485e76e1985cd109d9a3713802152be56c3b1f0e0658ed"
+dependencies = [
+ "crossbeam-deque",
+ "crossbeam-utils",
+]
+
+[[package]]
+name = "redox_syscall"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+dependencies = [
+ "bitflags 1.3.2",
+]
+
+[[package]]
+name = "regex"
+version = "1.10.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-automata 0.4.3",
+ "regex-syntax 0.8.2",
+]
+
+[[package]]
+name = "regex-automata"
+version = "0.1.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
+dependencies = [
+ "regex-syntax 0.6.29",
+]
+
+[[package]]
+name = "regex-automata"
+version = "0.4.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-syntax 0.8.2",
+]
+
+[[package]]
+name = "regex-syntax"
+version = "0.6.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
+
+[[package]]
+name = "regex-syntax"
+version = "0.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
+
+[[package]]
+name = "rustc-demangle"
+version = "0.1.23"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d626bb9dae77e28219937af045c257c28bfd3f69333c512553507f5f9798cb76"
+
+[[package]]
+name = "rustix"
+version = "0.37.27"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2"
+dependencies = [
+ "bitflags 1.3.2",
+ "errno",
+ "io-lifetimes",
+ "libc",
+ "linux-raw-sys 0.3.8",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "rustix"
+version = "0.38.27"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bfeae074e687625746172d639330f1de242a178bf3189b51e35a7a21573513ac"
+dependencies = [
+ "bitflags 2.4.1",
+ "errno",
+ "libc",
+ "linux-raw-sys 0.4.12",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "rustversion"
+version = "1.0.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4"
+
+[[package]]
+name = "ryu"
+version = "1.0.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741"
+
+[[package]]
+name = "same-file"
+version = "1.0.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
+dependencies = [
+ "winapi-util",
+]
+
+[[package]]
+name = "scopeguard"
+version = "1.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+
+[[package]]
+name = "serde"
+version = "1.0.193"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "25dd9975e68d0cb5aa1120c288333fc98731bd1dd12f561e468ea4728c042b89"
+dependencies = [
+ "serde_derive",
+]
+
+[[package]]
+name = "serde-xml-rs"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f0bf1ba0696ccf0872866277143ff1fd14d22eec235d2b23702f95e6660f7dfa"
+dependencies = [
+ "log",
+ "serde",
+ "thiserror",
+ "xml-rs",
+]
+
+[[package]]
+name = "serde_bytes"
+version = "0.11.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ab33ec92f677585af6d88c65593ae2375adde54efdbf16d597f2cbc7a6d368ff"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "serde_derive"
+version = "1.0.193"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "43576ca501357b9b071ac53cdc7da8ef0cbd9493d8df094cd821777ea6e894d3"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "serde_json"
+version = "1.0.108"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"
+dependencies = [
+ "itoa",
+ "ryu",
+ "serde",
+]
+
+[[package]]
+name = "serde_repr"
+version = "0.1.17"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3081f5ffbb02284dda55132aa26daecedd7372a42417bbbab6f14ab7d6bb9145"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "serde_spanned"
+version = "0.6.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "12022b835073e5b11e90a14f86838ceb1c8fb0325b72416845c487ac0fa95e80"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "sha1"
+version = "0.10.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
+dependencies = [
+ "cfg-if",
+ "cpufeatures",
+ "digest",
+]
+
+[[package]]
+name = "sharded-slab"
+version = "0.1.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
+dependencies = [
+ "lazy_static",
+]
+
+[[package]]
+name = "signal-hook-registry"
+version = "1.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "slab"
+version = "0.4.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "smallvec"
+version = "1.11.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
+
+[[package]]
+name = "snakecase"
+version = "0.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bfa28ca481031c5019449fe13932199d8f5189d49a9ec1abfe00056d7d24637d"
+
+[[package]]
+name = "socket2"
+version = "0.4.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9f7916fc008ca5542385b89a3d3ce689953c143e9304a9bf8beec1de48994c0d"
+dependencies = [
+ "libc",
+ "winapi",
+]
+
+[[package]]
+name = "socket2"
+version = "0.5.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7b5fac59a5cb5dd637972e5fca70daf0523c9067fcdc4842f053dae04a18f8e9"
+dependencies = [
+ "libc",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "static_assertions"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
+
+[[package]]
+name = "syn"
+version = "1.0.109"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "syn"
+version = "2.0.39"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "system-deps"
+version = "6.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2a2d580ff6a20c55dfb86be5f9c238f67835d0e81cbdea8bf5680e0897320331"
+dependencies = [
+ "cfg-expr",
+ "heck",
+ "pkg-config",
+ "toml",
+ "version-compare",
+]
+
+[[package]]
+name = "target-lexicon"
+version = "0.12.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
+
+[[package]]
+name = "tempfile"
+version = "3.8.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5"
+dependencies = [
+ "cfg-if",
+ "fastrand 2.0.1",
+ "redox_syscall",
+ "rustix 0.38.27",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "termcolor"
+version = "1.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ff1bc3d3f05aff0403e8ac0d92ced918ec05b666a43f83297ccef5bea8a3d449"
+dependencies = [
+ "winapi-util",
+]
+
+[[package]]
+name = "test-log"
+version = "0.2.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6159ab4116165c99fc88cce31f99fa2c9dbe08d3691cb38da02fc3b45f357d2b"
+dependencies = [
+ "test-log-macros",
+ "tracing-subscriber",
+]
+
+[[package]]
+name = "test-log-macros"
+version = "0.2.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7ba277e77219e9eea169e8508942db1bf5d8a41ff2db9b20aab5a5aadc9fa25d"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "textwrap"
+version = "0.16.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
+
+[[package]]
+name = "thiserror"
+version = "1.0.50"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
+dependencies = [
+ "thiserror-impl",
+]
+
+[[package]]
+name = "thiserror-impl"
+version = "1.0.50"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "thread_local"
+version = "1.1.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152"
+dependencies = [
+ "cfg-if",
+ "once_cell",
+]
+
+[[package]]
+name = "time"
+version = "0.3.30"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c4a34ab300f2dee6e562c10a046fc05e358b29f9bf92277f30c3c8d82275f6f5"
+dependencies = [
+ "deranged",
+ "powerfmt",
+ "serde",
+ "time-core",
+ "time-macros",
+]
+
+[[package]]
+name = "time-core"
+version = "0.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
+
+[[package]]
+name = "time-macros"
+version = "0.2.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4ad70d68dba9e1f8aceda7aa6711965dfec1cac869f311a51bd08b3a2ccbce20"
+dependencies = [
+ "time-core",
+]
+
+[[package]]
+name = "tinytemplate"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
+dependencies = [
+ "serde",
+ "serde_json",
+]
+
+[[package]]
+name = "tinyvec"
+version = "1.6.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
+dependencies = [
+ "tinyvec_macros",
+]
+
+[[package]]
+name = "tinyvec_macros"
+version = "0.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
+
+[[package]]
+name = "tokio"
+version = "1.35.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "841d45b238a16291a4e1584e61820b8ae57d696cc5015c459c229ccc6990cc1c"
+dependencies = [
+ "backtrace",
+ "bytes 1.5.0",
+ "libc",
+ "mio",
+ "num_cpus",
+ "pin-project-lite",
+ "signal-hook-registry",
+ "socket2 0.5.5",
+ "tokio-macros",
+ "tracing",
+ "windows-sys 0.48.0",
+]
+
+[[package]]
+name = "tokio-macros"
+version = "2.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5b8a1e28f2deaa14e508979454cb3a223b10b938b45af148bc0986de36f1923b"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "tokio-vsock"
+version = "0.3.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b33556828911d16e24d8b5d336446b0bf6b4b9bfda52cbdc2fa35b7a2862ebc"
+dependencies = [
+ "bytes 0.4.12",
+ "futures",
+ "libc",
+ "tokio",
+ "vsock 0.2.6",
+]
+
+[[package]]
+name = "toml"
+version = "0.8.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a1a195ec8c9da26928f773888e0742ca3ca1040c6cd859c919c9f59c1954ab35"
+dependencies = [
+ "serde",
+ "serde_spanned",
+ "toml_datetime",
+ "toml_edit 0.21.0",
+]
+
+[[package]]
+name = "toml_datetime"
+version = "0.6.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3550f4e9685620ac18a50ed434eb3aec30db8ba93b0287467bca5826ea25baf1"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "toml_edit"
+version = "0.19.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421"
+dependencies = [
+ "indexmap 2.1.0",
+ "toml_datetime",
+ "winnow",
+]
+
+[[package]]
+name = "toml_edit"
+version = "0.21.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d34d383cd00a163b4a5b85053df514d45bc330f6de7737edfe0a93311d1eaa03"
+dependencies = [
+ "indexmap 2.1.0",
+ "serde",
+ "serde_spanned",
+ "toml_datetime",
+ "winnow",
+]
+
+[[package]]
+name = "tracing"
+version = "0.1.40"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
+dependencies = [
+ "pin-project-lite",
+ "tracing-attributes",
+ "tracing-core",
+]
+
+[[package]]
+name = "tracing-attributes"
+version = "0.1.27"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+]
+
+[[package]]
+name = "tracing-core"
+version = "0.1.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
+dependencies = [
+ "once_cell",
+]
+
+[[package]]
+name = "tracing-subscriber"
+version = "0.3.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
+dependencies = [
+ "matchers",
+ "nu-ansi-term",
+ "once_cell",
+ "regex",
+ "sharded-slab",
+ "thread_local",
+ "tracing",
+ "tracing-core",
+]
+
+[[package]]
+name = "trybuild"
+version = "1.0.85"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "196a58260a906cedb9bf6d8034b6379d0c11f552416960452f267402ceeddff1"
+dependencies = [
+ "basic-toml",
+ "glob",
+ "once_cell",
+ "serde",
+ "serde_derive",
+ "serde_json",
+ "termcolor",
+]
+
+[[package]]
+name = "typenum"
+version = "1.17.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+
+[[package]]
+name = "uds_windows"
+version = "1.0.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ce65604324d3cce9b966701489fbd0cf318cb1f7bd9dd07ac9a4ee6fb791930d"
+dependencies = [
+ "tempfile",
+ "winapi",
+]
+
+[[package]]
+name = "unicode-bidi"
+version = "0.3.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6f2528f27a9eb2b21e69c95319b30bd0efd85d09c379741b0f78ea1d86be2416"
+
+[[package]]
+name = "unicode-ident"
+version = "1.0.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+
+[[package]]
+name = "unicode-normalization"
+version = "0.1.22"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
+dependencies = [
+ "tinyvec",
+]
+
+[[package]]
+name = "url"
+version = "2.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
+dependencies = [
+ "form_urlencoded",
+ "idna",
+ "percent-encoding",
+ "serde",
+]
+
+[[package]]
+name = "uuid"
+version = "1.6.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "value-bag"
+version = "1.4.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4a72e1902dde2bd6441347de2b70b7f5d59bf157c6c62f0c44572607a1d55bbe"
+
+[[package]]
+name = "version-compare"
+version = "0.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "579a42fc0b8e0c63b76519a339be31bed574929511fa53c1a3acae26eb258f29"
+
+[[package]]
+name = "version_check"
+version = "0.9.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+
+[[package]]
+name = "vsock"
+version = "0.2.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e32675ee2b3ce5df274c0ab52d19b28789632406277ca26bffee79a8e27dc133"
+dependencies = [
+ "libc",
+ "nix 0.23.2",
+]
+
+[[package]]
+name = "vsock"
+version = "0.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4c8e1df0bf1e1b28095c24564d1b90acae64ca69b097ed73896e342fa6649c57"
+dependencies = [
+ "libc",
+ "nix 0.24.3",
+]
+
+[[package]]
+name = "waker-fn"
+version = "1.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f3c4517f54858c779bbcbf228f4fca63d121bf85fbecb2dc578cdf4a39395690"
+
+[[package]]
+name = "walkdir"
+version = "2.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee"
+dependencies = [
+ "same-file",
+ "winapi-util",
+]
+
+[[package]]
+name = "wasi"
+version = "0.11.0+wasi-snapshot-preview1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+
+[[package]]
+name = "wasm-bindgen"
+version = "0.2.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0ed0d4f68a3015cc185aff4db9506a015f4b96f95303897bfa23f846db54064e"
+dependencies = [
+ "cfg-if",
+ "wasm-bindgen-macro",
+]
+
+[[package]]
+name = "wasm-bindgen-backend"
+version = "0.2.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1b56f625e64f3a1084ded111c4d5f477df9f8c92df113852fa5a374dbda78826"
+dependencies = [
+ "bumpalo",
+ "log",
+ "once_cell",
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+ "wasm-bindgen-shared",
+]
+
+[[package]]
+name = "wasm-bindgen-futures"
+version = "0.4.39"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ac36a15a220124ac510204aec1c3e5db8a22ab06fd6706d881dc6149f8ed9a12"
+dependencies = [
+ "cfg-if",
+ "js-sys",
+ "wasm-bindgen",
+ "web-sys",
+]
+
+[[package]]
+name = "wasm-bindgen-macro"
+version = "0.2.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0162dbf37223cd2afce98f3d0785506dcb8d266223983e4b5b525859e6e182b2"
+dependencies = [
+ "quote",
+ "wasm-bindgen-macro-support",
+]
+
+[[package]]
+name = "wasm-bindgen-macro-support"
+version = "0.2.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f0eb82fcb7930ae6219a7ecfd55b217f5f0893484b7a13022ebb2b2bf20b5283"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.39",
+ "wasm-bindgen-backend",
+ "wasm-bindgen-shared",
+]
+
+[[package]]
+name = "wasm-bindgen-shared"
+version = "0.2.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7ab9b36309365056cd639da3134bf87fa8f3d86008abf99e612384a6eecd459f"
+
+[[package]]
+name = "web-sys"
+version = "0.3.66"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "50c24a44ec86bb68fbecd1b3efed7e85ea5621b39b35ef2766b66cd984f8010f"
+dependencies = [
+ "js-sys",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "winapi"
+version = "0.3.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+dependencies = [
+ "winapi-i686-pc-windows-gnu",
+ "winapi-x86_64-pc-windows-gnu",
+]
+
+[[package]]
+name = "winapi-i686-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+
+[[package]]
+name = "winapi-util"
+version = "0.1.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596"
+dependencies = [
+ "winapi",
+]
+
+[[package]]
+name = "winapi-x86_64-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+
+[[package]]
+name = "windows-sys"
+version = "0.48.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+dependencies = [
+ "windows-targets 0.48.5",
+]
+
+[[package]]
+name = "windows-sys"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+dependencies = [
+ "windows-targets 0.52.0",
+]
+
+[[package]]
+name = "windows-targets"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+dependencies = [
+ "windows_aarch64_gnullvm 0.48.5",
+ "windows_aarch64_msvc 0.48.5",
+ "windows_i686_gnu 0.48.5",
+ "windows_i686_msvc 0.48.5",
+ "windows_x86_64_gnu 0.48.5",
+ "windows_x86_64_gnullvm 0.48.5",
+ "windows_x86_64_msvc 0.48.5",
+]
+
+[[package]]
+name = "windows-targets"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+dependencies = [
+ "windows_aarch64_gnullvm 0.52.0",
+ "windows_aarch64_msvc 0.52.0",
+ "windows_i686_gnu 0.52.0",
+ "windows_i686_msvc 0.52.0",
+ "windows_x86_64_gnu 0.52.0",
+ "windows_x86_64_gnullvm 0.52.0",
+ "windows_x86_64_msvc 0.52.0",
+]
+
+[[package]]
+name = "windows_aarch64_gnullvm"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+
+[[package]]
+name = "windows_aarch64_gnullvm"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+
+[[package]]
+name = "windows_aarch64_msvc"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+
+[[package]]
+name = "windows_aarch64_msvc"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+
+[[package]]
+name = "windows_i686_gnu"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+
+[[package]]
+name = "windows_i686_gnu"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+
+[[package]]
+name = "windows_i686_msvc"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+
+[[package]]
+name = "windows_i686_msvc"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+
+[[package]]
+name = "windows_x86_64_gnu"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+
+[[package]]
+name = "windows_x86_64_gnu"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+
+[[package]]
+name = "windows_x86_64_gnullvm"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+
+[[package]]
+name = "windows_x86_64_gnullvm"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+
+[[package]]
+name = "windows_x86_64_msvc"
+version = "0.48.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+
+[[package]]
+name = "windows_x86_64_msvc"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+
+[[package]]
+name = "winnow"
+version = "0.5.26"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b67b5f0a4e7a27a64c651977932b9dc5667ca7fc31ac44b03ed37a0cf42fdfff"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "xdg-home"
+version = "1.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2769203cd13a0c6015d515be729c526d041e9cf2c0cc478d57faee85f40c6dcd"
+dependencies = [
+ "nix 0.26.4",
+ "winapi",
+]
+
+[[package]]
+name = "xml-rs"
+version = "0.8.19"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0fcb9cbac069e033553e8bb871be2fbdffcab578eb25bd0f7c508cedc6dcd75a"
+
+[[package]]
+name = "zbus"
+version = "3.13.1"
+dependencies = [
+ "async-broadcast",
+ "async-executor",
+ "async-fs",
+ "async-io 1.13.0",
+ "async-lock 2.8.0",
+ "async-process",
+ "async-recursion",
+ "async-std",
+ "async-task",
+ "async-trait",
+ "blocking",
+ "byteorder",
+ "derivative",
+ "doc-comment",
+ "enumflags2",
+ "event-listener 2.5.3",
+ "futures-core",
+ "futures-sink",
+ "futures-util",
+ "hex",
+ "nix 0.26.4",
+ "ntest",
+ "once_cell",
+ "ordered-stream",
+ "quick-xml",
+ "rand",
+ "serde",
+ "serde-xml-rs",
+ "serde_repr",
+ "sha1",
+ "static_assertions",
+ "tempfile",
+ "test-log",
+ "tokio",
+ "tokio-vsock",
+ "tracing",
+ "tracing-subscriber",
+ "uds_windows",
+ "vsock 0.3.0",
+ "winapi",
+ "xdg-home",
+ "zbus_macros",
+ "zbus_names",
+ "zvariant",
+]
+
+[[package]]
+name = "zbus_macros"
+version = "3.13.1"
+dependencies = [
+ "async-io 1.13.0",
+ "futures-util",
+ "proc-macro-crate",
+ "proc-macro2",
+ "quote",
+ "regex",
+ "rustversion",
+ "serde",
+ "syn 1.0.109",
+ "trybuild",
+ "zbus",
+ "zvariant_utils",
+]
+
+[[package]]
+name = "zbus_names"
+version = "2.5.1"
+dependencies = [
+ "serde",
+ "static_assertions",
+ "zvariant",
+]
+
+[[package]]
+name = "zbus_polkit"
+version = "3.0.1"
+dependencies = [
+ "async-std",
+ "byteorder",
+ "enumflags2",
+ "serde",
+ "serde_repr",
+ "static_assertions",
+ "zbus",
+ "zvariant",
+]
+
+[[package]]
+name = "zbus_xmlgen"
+version = "3.1.1"
+dependencies = [
+ "snakecase",
+ "zbus",
+ "zvariant",
+]
+
+[[package]]
+name = "zvariant"
+version = "3.15.0"
+dependencies = [
+ "arrayvec",
+ "byteorder",
+ "chrono",
+ "criterion",
+ "enumflags2",
+ "glib",
+ "libc",
+ "rand",
+ "serde",
+ "serde_bytes",
+ "serde_json",
+ "serde_repr",
+ "static_assertions",
+ "time",
+ "url",
+ "uuid",
+ "zvariant_derive",
+]
+
+[[package]]
+name = "zvariant_derive"
+version = "3.15.0"
+dependencies = [
+ "byteorder",
+ "enumflags2",
+ "proc-macro-crate",
+ "proc-macro2",
+ "quote",
+ "serde",
+ "serde_repr",
+ "syn 1.0.109",
+ "zvariant",
+ "zvariant_utils",
+]
+
+[[package]]
+name = "zvariant_utils"
+version = "1.0.1"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 1.0.109",
+]
diff --git a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb b/meta-selftest/recipes-extended/zvariant/zvariant_3.15.0.bb
similarity index 66%
rename from meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
rename to meta-selftest/recipes-extended/zvariant/zvariant_3.15.0.bb
index 36f2a07ecfa4..2176e1331362 100644
--- a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
+++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.15.0.bb
@@ -5,23 +5,19 @@ A modified form of this format, GVariant is very commonly used for efficient sto
 data and is also supported by this crate."
 HOMEPAGE = "https://gitlab.freedesktop.org/dbus/zbus/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b377b220f43d747efdec40d69fcaa69d"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'glib-2.0', '', d)}"
 
 SRC_URI = " \
-    git://gitlab.freedesktop.org/dbus/zbus;protocol=https;branch=main;subpath=zvariant \
-    file://0001-Tweak-zvariant-crate-config.patch;striplevel=2 \
+    git://github.com/dbus2/zbus;protocol=https;branch=main \
+    file://Cargo.lock;subdir=git \
 "
 
-SRCREV = "07506776fab5f58e029760bb4b288f670c7eecd6"
-S = "${WORKDIR}/zvariant"
+SRCREV = "a2e3d17358942b893d74bf593ffb95f5484b3b97"
+S = "${WORKDIR}/git/zvariant"
 
-python do_clean_lic_file_symlink() {
-    bb.utils.remove("LICENCE")
-}
-
-addtask clean_lic_file_symlink after do_unpack before do_patch
+CARGO_LOCK_PATH = "${WORKDIR}/git/Cargo.lock"
 
 inherit ptest-cargo pkgconfig cargo-update-recipe-crates
 
@@ -29,7 +25,6 @@ inherit ptest-cargo pkgconfig cargo-update-recipe-crates
 EXCLUDE_FROM_WORLD = "1"
 
 require ${BPN}-crates.inc
-require ${BPN}-git-crates.inc
 
 # zvariant is an indermediate product for the zbus project
 # and so, it provided only a static lib (rlib) which fall only
-- 
2.39.0


