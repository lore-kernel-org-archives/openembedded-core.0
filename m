Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4BBC982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:09 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43877.1789974425118345699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9Rh5QCI;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so19216065e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974423; x=1790579223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gq5Lz8zUFeP8RCdXqQi4c78pc/SkdYZAah18zNEgFeI=;
        b=K9Rh5QCIRcpxzY9wat84Qsa8IjTTxhmv7T/nz6clfpn9hYbfNL4xPrQbpWkhElKD0H
         v3wDYOdwkF4DmAbiQ307Y+1GHi/4X/I5x0H0pmF5YrWCNrqmEY4SwJ7lqhgKyDq0Wv8v
         VhD/GAm5LdIulNDcwQm6Wx68Z8/Nu+w2Y8m3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974423; x=1790579223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gq5Lz8zUFeP8RCdXqQi4c78pc/SkdYZAah18zNEgFeI=;
        b=0CnKELLjmvpAQYrtavmSgq4qppHVnetzfm19a5V2OVODsBmuygpUUmQEu36G+0G2X+
         tbpiuK4T3WmAhF90bpUZhzuwhU79JKb7+Wn+vEgEonO2AWyxf8Z8xNiJJTlTE6pGO8EM
         H8s8VqShAALZaA5qBPw/tWk62qaY2aeg8vUdq3Qmct2zDC+z/kq6pIVF6B2iR0OFZFS0
         4Fv2/g3DzjcKn5RZjEwDoqZV1pVCOV9NRaPbjvD3WY4nduluhYdHLvL7wM7LEw67hDOD
         cdDCztvtJ8ScQ47vVmp0K5t4Fe/NSD9VVxlIz6oqQQHva2zhiXdKH/DJkHlFVjxRKdmt
         gGXw==
X-Gm-Message-State: AFuF++lBLpt9u72s8KL9XKXaOel9RKl8UiFtLBMfKlX8s6TzWtOXp7UM
	PqoSEEML4JEe7fxklinSAED/c2dvETnYsCV89uwwdpALhCIkilmr4h6H8kX1M9RGeVz6HZEJZZm
	TZVUBCCI=
X-Gm-Gg: AYBFou0MesYEtAw8A2lVKVBWcKtrLlNu6bSvA3dNt+MUQYqXrO0h7xjIety5Yv67y1w
	cxqP9hxvuYAO32Cmv0T4lyf0LynWxo4Kz37zd+zv1KTxCigKRKzAuRYJgTStIPUUUHG5WHnm3Jt
	Bjrg+Z5pHX8LM3QW+8G9m29pG6JGislx/fP8GWFH8M4ZWUK/NbXJsR7Z9ynJV6WKYj2V1drG4Nz
	aEdwWCypeCjSkwghHl44Qaw5/48tD8gnMCEfa1RByDudsyyQ/9R9ovlhhkUpgWpwV+HUDR8VBRx
	Qyv4f8Cb4oGtUmDfr4VeYKMSRmZD+Gh+23l3UpF4gseYsYX9NJUOXDwAB7WScMnAWbcIU7RA5FU
	BUc+XuNKtTWIpZ56QSui+dNzrXpHQflyr0PwE5G2dXTjNkbzzkcQ7JS9sobC+nNQjqACRtE1jBm
	oLNPJKsyuBinhlG+VAcnKWL97mKfZte7NqW53HEC2yfwmmQbQr/NNS9PzzWv4a4w/DDO5G8G5xn
	P6svCQcMT1tnjW6EYbjHA15LDc=
X-Received: by 2002:a05:600c:6296:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fc5737c43mr135352435e9.16.1789974422866;
        Mon, 21 Sep 2026 00:07:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/20] python3-uv-build: upgrade 0.12.13 -> 0.12.17
Date: Mon, 21 Sep 2026 08:06:40 +0100
Message-ID: <20260921070656.521680-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246291

0.12.17

Released on 2026-09-18.
Enhancements

    Reject unsupported Git archive paths in lockfiles with a clear error instead of panicking during frozen exports (#21780)

Preview features

    Set minimum glibc and musl versions that universal resolutions must support with minimum-libc-version (#21651)
    Reject pylock.toml files whose wheel filenames do not match their declared package names or versions (#20746)
    Keep uv workspace metadata read-only unless --sync is provided (#21821)
    Apply uv check lock modes when retrieving workspace metadata (#21821)

Performance

    Speed up builds with many exclusion patterns by avoiding quadratic deduplication (#21650)
    Reduce resolver allocations when deduplicating package and distribution requests (#21810)

Bug fixes

    Prevent required-environments from selecting package versions whose wheels require a newer macOS version than the configured Darwin baseline (#21825)

0.12.16

Released on 2026-09-17.
Python

    Add Pyodide 314.0.7, 0.29.5, and 0.27.8 (#21741)

Enhancements

    Verify downloaded wheels and source distributions against hashes supplied by package indexes (#21562)
    Allow build-constraint-dependencies entries to include hashes for verifying downloaded build dependencies (#21467)
    Honor Darwin platform_release markers in required-environments using macOS wheel deployment targets (#21766)
    Reject unsupported Git URL schemes while parsing lockfiles instead of panicking during frozen exports (#21779)

Preview features

    Support lock-without-metadata across all dependency types while retaining package.metadata for remote URL dependencies to enable offline validation (#21163)
    Honor configured and command-line index settings, including credentials, in uv upgrade (#21776)
    Allow uv check to run in projects that are not managed by uv and outside workspaces (#21777)
    Respect --python and UV_PYTHON when selecting the Python version for uv check (#21744)

Bug fixes

    Redact Azure shared access signatures from displayed and logged URLs (#21755)
    Check archive sizes from pylock.toml before reusing cached distributions (#21609)
    Keep user-authored local dependency paths relative in lockfiles when backend metadata reports absolute paths (#20631)
    Use the bundled uv_build backend only when its version matches active version pins (#21742)
    Handle malformed index URLs without panicking when credentials are configured (#21784)
    Report a configuration error instead of panicking for proxy URLs without a host (#21781)
    Return a credential-redacted error instead of panicking when a URL cannot be converted to a path (#21783)

0.12.15

Released on 2026-09-15.
Performance

    Speed up cold-cache resolution and HTTP cache revalidation by batching cache writes (#21675)

Bug fixes

    Fix regressions in 0.12.14 when installing to symlinked destinations or using uv pip install --target . (#21699)

0.12.14

Released on 2026-09-15.
Enhancements

    Resume interrupted downloads with HTTP Range requests when supported (#21570)
    Use a consistent format for error rendering (#17110)
    Render error and warning causes with compact cause: labels (#21599, #21603)
    Show underlying causes and hints in user warnings (#21565)
    Show resolver hints for failed uv tool upgrade operations (#21566)

Preview features

    Export multiple dependency selections from a shared lockfile in one uv export --batch invocation with the batch-export preview feature (#21618)

Performance

    Speed up dependency resolution from local wheelhouses by reading wheel metadata in a single blocking task (#21619)
    Speed up cold resolution against large package indexes by parsing Simple API responses in bounded background workers (#21593)
    Speed up warm-cache resolution by decoding fresh HTTP cache entries in the cache-read task (#21621)

Bug fixes

    Select releases that satisfy required-environments within each resolver fork instead of combining incompatible wheel coverage across forks (#21672)
    Install packages with paths longer than MAX_PATH on Windows systems without long-path support enabled (#21625)
    Prevent uv python install from overwriting valid unmanaged Python symlinks with relative targets on Unix (#21639)
    Redact credentials and signatures from missing-path-segment URL errors (#21616)
    Avoid exceeding the configured retry budget when cached HTTP responses fail revalidation (#21640)
    Prefer bin/python over bin/python3 when discovering interpreters in Unix environments (#21559)
    Classify package-operation exit codes by their underlying cause: return 1 for expected failures and 2 for recognized operational and internal failures (#17110)
    Suppress managed-Python fallback warnings under --quiet (#21565)
    Keep failed uv tool upgrade errors visible with -q while suppressing them with -qq (#21566)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 66 +++++++------------
 ...0.12.13.bb => python3-uv-build_0.12.17.bb} |  2 +-
 2 files changed, 25 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.13.bb => python3-uv-build_0.12.17.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 02e8f9a8abe..486d993c327 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -4,7 +4,6 @@
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aho-corasick/1.1.4 \
-    crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/ambient-authority/0.0.2 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
@@ -43,7 +42,6 @@ SRC_URI += " \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.4 \
-    crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
     crate://crates.io/crc32fast/1.5.0 \
@@ -78,21 +76,19 @@ SRC_URI += " \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
     crate://crates.io/fs-set-times/0.20.3 \
-    crate://crates.io/futures/0.3.33 \
-    crate://crates.io/futures-channel/0.3.33 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-executor/0.3.33 \
-    crate://crates.io/futures-io/0.3.33 \
+    crate://crates.io/futures/0.3.34 \
+    crate://crates.io/futures-channel/0.3.34 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-executor/0.3.34 \
+    crate://crates.io/futures-io/0.3.34 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.33 \
-    crate://crates.io/futures-sink/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-macro/0.3.34 \
+    crate://crates.io/futures-sink/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.20 \
-    crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
@@ -167,7 +163,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -209,6 +204,7 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
+    crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
@@ -222,8 +218,8 @@ SRC_URI += " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/thiserror/2.0.19 \
-    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -231,7 +227,6 @@ SRC_URI += " \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/tokio-util/0.7.19 \
     crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
@@ -248,7 +243,6 @@ SRC_URI += " \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
@@ -260,7 +254,6 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -301,9 +294,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
-    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
-    crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
     crate://crates.io/zerocopy/0.8.56 \
@@ -322,7 +313,6 @@ SRC_URI += " \
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
-SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[ambient-authority-0.0.2.sha256sum] = "e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
@@ -361,7 +351,6 @@ SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba9
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
-SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
@@ -396,21 +385,19 @@ SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac1917768
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
 SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
-SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
-SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-executor-0.3.33.sha256sum] = "6754879cc9f2c66f88c6e5c35344bb0bdb0708b0352b1201815667c7eabc7458"
-SRC_URI[futures-io-0.3.33.sha256sum] = "4577ecaa3c4f96589d473f679a71b596316f6641bc350038b962a5daf0085d7a"
+SRC_URI[futures-0.3.34.sha256sum] = "9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3"
+SRC_URI[futures-channel-0.3.34.sha256sum] = "b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-executor-0.3.34.sha256sum] = "031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432"
+SRC_URI[futures-io-0.3.34.sha256sum] = "53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed"
 SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
-SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8ca209b4510f7f94242c647e307"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-macro-0.3.34.sha256sum] = "9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44"
+SRC_URI[futures-sink-0.3.34.sha256sum] = "1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
-SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
@@ -485,7 +472,6 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -527,6 +513,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
+SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
@@ -540,8 +527,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
-SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
@@ -549,7 +536,6 @@ SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df
 SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[tokio-util-0.7.19.sha256sum] = "494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52"
 SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
@@ -566,7 +552,6 @@ SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc2
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
@@ -578,7 +563,6 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -619,9 +603,7 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
-SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
-SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
 SRC_URI[zerocopy-0.8.56.sha256sum] = "556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
index 51e85d5a857..322ac35f488 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "46936ab24c8674be28df2784a9ca2878478a84a98e6ce3df5cb976102e99b8f1"
+SRC_URI[sha256sum] = "ae5cd835cf479a76efb161ddb9c6411acf63f5687dacd3d56d15e9a5783f740f"
 
 require ${BPN}-crates.inc
 

