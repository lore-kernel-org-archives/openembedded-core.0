Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9542FE7718B
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.117207.1734559368696644468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f9saaYQ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso136002b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559368; x=1735164168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtyWdkrxa89LEFGlzjn4oIiwWesM7fkTrMhbm0lDGWA=;
        b=f9saaYQ1yiis0+mmYPPi7mrKbQ9Pp+oI402hIzm/lpLmZUnzdIAoK4CeZA2b8KM1qc
         ogXrAtdJCE+ntJkiwKObAc8u1a2+/bRrDhwepd2CGhI7c+yKYfm/Vq+XsvivEqdRNqgC
         HT5Fv5GyrqGcgaSOcmtFjDqyMt5M/cb0XfNECLvLPwIcDn6EFW/Yb9MG59G5e/1lJsWV
         3ZmRW4wzGYpuYiQFtdYBmIWYJ3Db77tMSPQeFsRL6NBj2nsT0LOq2xYs6aTSWofFjRFs
         Sqe1dnyxWTvrQxLG7Flo9g0mKi0bG9Iar+z3+CuF4XPWP+8igJ7KI2NGpLuF4kQkDqIl
         wwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559368; x=1735164168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtyWdkrxa89LEFGlzjn4oIiwWesM7fkTrMhbm0lDGWA=;
        b=eDMVBzAzlYlKCXiZIAPSzZCgk0LdXp4L/xBiGkKJRg0E2/H0DiDCPPiEZkg/RdsPUs
         ZmPIzAlcSTNpQ23a7l8CnhN0RooL+ob1RXHr46ZD/QqXJq+ImObdCQNJT3eekfRAT6Tk
         hIKIwx0/zRPCfFdi11riq4z02grCJW3FEU5CO8hwpe+Akml8SOTH/RCzrpMxEpCJS7/O
         dCgl+YFifpDfotZBtYmUbnkuU8pKNEezeI32s9AcU8ozi1GDzkPFnL2vmdaXzNJG5IcT
         Are7DtZUzLRQ2P75l9IpSNu0IFRif9L5H+MGUw3Qe2+9ivwfzFgpuNSL/Za+5erabtxo
         rXVg==
X-Gm-Message-State: AOJu0Yy3t3pw0ffP5svo6ymzsDxvQa9W//3wh2dvylxEgD5Ak0kkksYW
	X/88jSkFCIK1cu252nxBfPEhUmMcGKtZeDSvpafZlRk/SpCtjectqp8Sq4Q0Bn0z+J2ZpRs1tu9
	u
X-Gm-Gg: ASbGncvDaM2vdaDF8J7d+xuLofnpEK0M4lGN8MuHF+TjwrJhC33hA9v8CDviHcYwqGJ
	5dfl9p2VJbZ7YMi6ILP3+UqMTbiFsyuQTDSC+iu0h2XvrBgyWvfL/1ZXWRBsRwhTkkwLgSkZCH4
	qZkacPd3S+88D2AAexnyhkDA1pVkFYLxxs6EKFccjbRcfYYxjDEhkF5wIVGycGAV64vTuwjnLXy
	659VFCUZck03x1FayvupUd5o541Ps4yqDCNqbxa5DaV8g==
X-Google-Smtp-Source: AGHT+IFltMEGlUETpLk/NX2tZqPI7AXzXkePM+Yb1DhD/4vmlQvekZZyUyv5ox8u2z6Yryt6tv3jSQ==
X-Received: by 2002:a05:6a20:9145:b0:1d7:e76:6040 with SMTP id adf61e73a8af0-1e5c6ec6e4amr1460156637.4.1734559367875;
        Wed, 18 Dec 2024 14:02:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] rust: add reproducibility patch to eliminate host leakage
Date: Wed, 18 Dec 2024 14:02:14 -0800
Message-Id: <d87597ebbafa1ec77c21c72c9d3183e00ad9985b.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208890

From: Alexander Kanavin <alex@linutronix.de>

[YOCTO #15185]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 924df18b47e9a69fa295bafe37bdb39d8eaea2bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...te-host-information-into-compilation.patch | 51 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch

diff --git a/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch b/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch
new file mode 100644
index 0000000000..a6ee867605
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch
@@ -0,0 +1,51 @@
+From 065d7c263091118437465d714d8a29dbb6296921 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 13 May 2024 14:57:54 +0200
+Subject: [PATCH] cargo: do not write host information into compilation unit
+ hashes
+
+This breaks reproducibility in cross-builds where the cross-target
+can be the same, but build hosts are different, as seen with
+"rustc --version -v":
+...
+host: x86_64-unknown-linux-gnu
+
+vs.
+
+host: aarch64-unknown-linux-gnu
+
+This can possibly be improved by only hashing host info if the build
+is a native one (e.g. there's no --target option passed to cargo
+invocation) but I'm not sure how.
+
+Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/cargo/issues/13922]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ .../src/cargo/core/compiler/context/compilation_files.rs      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs b/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
+index d83dbf10c..b2ad8d9f3 100644
+--- a/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
+@@ -652,7 +652,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher) {
+     if vers.pre.is_empty() || bcx.config.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+         // testing multiple versions, to avoid recompiles.
+-        bcx.rustc().verbose_version.hash(hasher);
++        //bcx.rustc().verbose_version.hash(hasher);
+         return;
+     }
+     // On "nightly"/"beta"/"dev"/etc, keep each "channel" separate. Don't hash
+@@ -665,7 +665,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher) {
+     // Keep "host" since some people switch hosts to implicitly change
+     // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+     // to consider hashing `unit.kind.short_name()` instead.
+-    bcx.rustc().host.hash(hasher);
++    //bcx.rustc().host.hash(hasher);
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 8a8e48b8ca..55ea1b77e6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://target-build-value.patch;patchdir=${RUSTSRC} \
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
+            file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.34.1


