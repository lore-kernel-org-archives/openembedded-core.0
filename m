Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3082C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:09:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.6191.1752613783569729402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ANHtP/ex;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so266652b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752613783; x=1753218583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urM8T3A47UcaTbPx9siJyNiAyyMmD73FTfsw0sBby/E=;
        b=ANHtP/exWwSwZl/ml3SLJAjJFWXstRNXw7vCxOZaAlnLQcH+zAa3Rn+HEv502zc4p9
         egXEFfkw9exTjTomjJ1d9s9LZViQqTtie3sFmos38fSgUMCsquUui7+HxzHKYwUTJPr6
         z1z7Pg7ihRSW09tecILBW7ZHAC9IsYn/vJj+S1UBNq52pv4u4irdnVDTVcJQo4j3hP9X
         fPX3NEXdo9plqwx6k3yKTqtTEL8iD0uctYTpr1hLXY2RSK/tO6I69Y36TkaziNDB0Lqw
         xQr4wNdrZXTU//7JsqxO3tMaY+oWkiMlqfkjJMxkh0mie/C6l5YOMYWj7CZR6ckQ1EYZ
         aGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752613783; x=1753218583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urM8T3A47UcaTbPx9siJyNiAyyMmD73FTfsw0sBby/E=;
        b=i7n/nwyiKz/fLIP3EwOrixuYTBjaCDZ/CC/cTEARl+cXpbXpU8drE4jGBAO0U+Xorm
         nuyOeMUntUhpcU1HAz2Pnr/V2H0HrJkkq+oUrsrQ5hYCQseSTjI4pWIpkWC29kwze0W9
         a26kTt9KQgdtwWuLqDMhxqZ5/VUqixQ/TncrT0mw8y2ry9VkldE8x2LBp3Nu0zav1PED
         fj9zDaTqKPCYk1fayDg4bijsT/G2Bw16RHx5w6S6NkaP1rW3uTBfNPHQuIyATU9MK7aL
         i/59jrCw6NStC8AkNXbTAeDXbzs7u85Be2g9K7Rj9GtbnjtWzndtCVrvhiNMFmHmaQqk
         lYTQ==
X-Gm-Message-State: AOJu0YyEjh85DR8F6oXPlGrME+YfVH3esJ132hd/cBJ06+bBI85f54aT
	nftr3xVtJ10GKcoJhEtZK/tw7a24rmC8dgin9306VQwdrda62iBZ/5XiOU4/avXu
X-Gm-Gg: ASbGncuCDxvWYKfGTwYMy6VQrdhSoZECTYlojNndUfmZ3mtWJ7nFLx6Fm3MdbJHRuGv
	PDFDrp90E9EWov07wFtpb2dWLdS3Jv9Q95zaOYcMQq+oVamlldNinA7aasNomd5CNNQgdCBP+Ra
	N02M/Fd0tuMITMaZaY/9flK6ApfrGYYtofNIiMSjflbonK0dRs4u64GVoTR1g6qN+r+jnbWbjUO
	uZvFtZWNTgOwbTJE/t4tE+okExSJjeRBeobQoY6tsfsyDgj2dJGghoYX2g5zfoVD8ECF2+KEeNE
	lSqZajz4V1BFb2ao08/Kmg9Z5c/i/ZLRrfNTJ+lYsYBjKQXcq0Gf6cu9sRHHxjxYgxHTFJooNRn
	tfNkIm8XxRLPTIQ==
X-Google-Smtp-Source: AGHT+IGtOcxXesxFA3pxdj1T+AZeVM7rku470JuKBEm93w98KmXVvipvaeGj7L7k7r6CI5sPqakNIg==
X-Received: by 2002:a05:6a20:3948:b0:220:42a0:7f65 with SMTP id adf61e73a8af0-237e345e21cmr893184637.17.1752613782369;
        Tue, 15 Jul 2025 14:09:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a8d6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4b3b5sm12745770b3a.123.2025.07.15.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:09:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] bindgen-cli: Upgrade to 0.72.0
Date: Tue, 15 Jul 2025 14:09:37 -0700
Message-ID: <20250715210939.3226204-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715210939.3226204-1-raj.khem@gmail.com>
References: <20250715210939.3226204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 21:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220427

Changes are here [1]

[1] https://github.com/rust-lang/rust-bindgen/compare/v0.71.1...v0.72.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bindgen-cli/bindgen-cli-crates.inc         | 18 +++++++++---------
 ...gen-cli_0.71.1.bb => bindgen-cli_0.72.0.bb} |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/bindgen-cli/{bindgen-cli_0.71.1.bb => bindgen-cli_0.72.0.bb} (86%)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc b/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
index a758440c9d3..084e26df321 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
@@ -18,8 +18,8 @@ SRC_URI += " \
     crate://crates.io/clap_derive/4.1.0 \
     crate://crates.io/clap_lex/0.3.1 \
     crate://crates.io/either/1.13.0 \
-    crate://crates.io/env_logger/0.10.0 \
     crate://crates.io/env_logger/0.8.4 \
+    crate://crates.io/env_logger/0.10.0 \
     crate://crates.io/errno/0.3.10 \
     crate://crates.io/fastrand/1.9.0 \
     crate://crates.io/getrandom/0.2.15 \
@@ -45,17 +45,17 @@ SRC_URI += " \
     crate://crates.io/os_str_bytes/6.4.1 \
     crate://crates.io/owo-colors/4.1.0 \
     crate://crates.io/prettyplease/0.2.25 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
     crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
     crate://crates.io/proc-macro2/1.0.92 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/regex/1.11.1 \
     crate://crates.io/regex-automata/0.4.9 \
     crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/regex/1.11.1 \
     crate://crates.io/rustc-hash/2.1.0 \
     crate://crates.io/rustix/0.37.27 \
     crate://crates.io/shlex/1.3.0 \
@@ -69,10 +69,10 @@ SRC_URI += " \
     crate://crates.io/unicode-width/0.1.14 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.5 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-targets/0.48.5 \
@@ -110,8 +110,8 @@ SRC_URI[clap_complete-4.2.0.sha256sum] = "01c22dcfb410883764b29953103d9ef7bb8fe2
 SRC_URI[clap_derive-4.1.0.sha256sum] = "684a277d672e91966334af371f1a7b5833f9aa00b07c84e92fbce95e00208ce8"
 SRC_URI[clap_lex-0.3.1.sha256sum] = "783fe232adfca04f90f56201b26d79682d4cd2625e0bc7290b95123afe558ade"
 SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
-SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
 SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
 SRC_URI[errno-0.3.10.sha256sum] = "33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d"
 SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
@@ -137,17 +137,17 @@ SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391
 SRC_URI[os_str_bytes-6.4.1.sha256sum] = "9b7820b9daea5457c9f21c69448905d723fbd21136ccf521748f23fd49e723ee"
 SRC_URI[owo-colors-4.1.0.sha256sum] = "fb37767f6569cd834a413442455e0f066d0d522de8630436e2a1761d9726ba56"
 SRC_URI[prettyplease-0.2.25.sha256sum] = "64d1ec885c64d0457d564db4ec299b2dae3f9c02808b8ad9c3a089c591b18033"
-SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
 SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
 SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
 SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
 SRC_URI[rustc-hash-2.1.0.sha256sum] = "c7fb8039b3032c191086b10f11f319a6e99e1e82889c5cc6046f515c9db1d497"
 SRC_URI[rustix-0.37.27.sha256sum] = "fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
@@ -161,10 +161,10 @@ SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6
 SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
@@ -183,4 +183,4 @@ SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de3
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
\ No newline at end of file
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
similarity index 86%
rename from meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb
rename to meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
index 79f24887271..b95faeabc0c 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0b9a98cb3dcdefcceb145324693fda9b"
 
 inherit rust cargo cargo-update-recipe-crates
 
-SRC_URI += "git://github.com/rust-lang/rust-bindgen.git;protocol=https;branch=main"
-SRCREV = "af7fd38d5e80514406fb6a8bba2d407d252c30b9"
+SRC_URI += "git://github.com/rust-lang/rust-bindgen.git;protocol=https;nobranch=1;tag=v${PV}"
+SRCREV = "d0e7d6b5b763e93dd38f9ece05230979ede95a0a"
 
 require ${BPN}-crates.inc
 

