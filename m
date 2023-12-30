Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2038CC47074
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:50:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.186685.1703951400190052996
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehvGcpMA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367632ce7bso6626743f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703951398; x=1704556198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbMhsO3kIaREYG11mNoz5eRBtA4aAVRzQ5bBlCHbdDA=;
        b=ehvGcpMAk/4ze+J0yNn38fS8TnCo+aZ3bpNV+yyevZUZ/IEHCvvvp5+7DmSwqcIx6h
         XVRGlFmXPo3ESNtJhmtZFAG9Fo762XdfmH+JEUud14XAdZUAtrW/SCdoTAr7tLzrA83K
         MmiCf+5P0ibXMELx2qviDyXKPPWXR/fMvf5XY/nBtQz7ClWe6q9OXYI0wh07xf+ah4ej
         xl/eDRs7mpHSa1Hy/a76EON8D9UErUPkpJkAg/NvUe4w15YFGrxKLZ+Zc3CDaN//AkQT
         lCdJQxnkNokxPnfgj1YeKAh75arxvfyuo+ytD7JbGiiezGUs9zHJiHRZ0b+/iGMnl5iU
         Cupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703951398; x=1704556198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbMhsO3kIaREYG11mNoz5eRBtA4aAVRzQ5bBlCHbdDA=;
        b=jcAIfEBGEEXEy7VYUArSgmzHR1dbVxyhvb/Y/pDcbjz/uT5EaHeSMWQ02ZXV68EVFY
         nrBmc8iUn4dZ9PJ0Wv5modmE9zLC3pDPoNeYEtz6AZ0nGI/Fu+qkuTdN3bkepsg25aVD
         V76Yc3BBW6J/hMGsefFPjUWwDJFwAxm0qoDxzGCwvezwIvtoZVck0fp2eBSRQIl2Qenj
         r4aB5J9vJXMpqkpCCFw+UZ6RZntwWLFJFVpxoGA+KFLtNac42cfzbR7nzSXM97fCTiOO
         BMm72oGXIGR/Dot0CNr01t9P99ohHiWgOQlPIUhGguOdhhs+I0IKhy/z+qOQjIUM2S+A
         y/wQ==
X-Gm-Message-State: AOJu0Yyar3EndIBsszMKfcR8+A8Eqe1ZDiXzh09lgkz0vHEfb4dQwAjC
	JaFk8Ggww2elcTIQqMvCqSKFbI2sYuM=
X-Google-Smtp-Source: AGHT+IHhi85MfWltBEMdib8X7F0lLVmREF6PEzf8AUOrx3NhZcBKjoOT8AHZR4Q/75N9JDPfAUaLhA==
X-Received: by 2002:a5d:4f08:0:b0:336:74ce:68a7 with SMTP id c8-20020a5d4f08000000b0033674ce68a7mr6423368wru.84.1703951398074;
        Sat, 30 Dec 2023 07:49:58 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0033660f75d08sm21777428wrv.116.2023.12.30.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 07:49:57 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/4] rust: Move RUST_DIST_SERVER to rust-config.inc
Date: Sat, 30 Dec 2023 15:49:50 +0000
Message-Id: <20231230154953.8135-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193074

Overriding the location of RUST_DIST_SERVER is useful for testing rust
pre-releases, but we need it in rust-source and rust-snapshot; move
RUST_DIST_SERVER to rust-config.inc so we can set it to
`dev-static.rust-lang.org` and use it from both locations.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust-config.inc   |  1 +
 meta/recipes-devtools/rust/rust-snapshot.inc |  2 --
 meta/recipes-devtools/rust/rust-source.inc   |  4 +++-
 meta/recipes-devtools/rust/rust_1.74.1.bb    | 11 ++++++++---
 4 files changed, 12 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/rust-config.inc

diff --git a/meta/recipes-devtools/rust/rust-config.inc b/meta/recipes-devtools/rust/rust-config.inc
new file mode 100644
index 000000000000..9fd360616bc4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-config.inc
@@ -0,0 +1 @@
+RUST_DIST_SERVER ??= "https://static.rust-lang.org"
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index ffc1aed2957c..b67e42d27063 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -52,8 +52,6 @@ SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
 "
 
-RUST_DIST_SERVER = "https://static.rust-lang.org"
-
 RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15fae..fdac009c6d20 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,6 +1,8 @@
+require rust-config.inc
+
 RUST_VERSION ?= "${@d.getVar('PV').split('-')[0]}"
 
-SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust \
+SRC_URI += "${RUST_DIST_SERVER}/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust \
             file://hardcodepaths.patch;patchdir=${RUSTSRC} \
             file://0001-Don-t-use-LFS64-symbols-on-musl.patch;patchdir=${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
index 30543ada7dbc..dd931a42717c 100644
--- a/meta/recipes-devtools/rust/rust_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
@@ -316,6 +316,10 @@ python do_update_snapshot() {
             arch = m.group('arch')
             src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
 
+    config = """\
+RUST_DIST_SERVER ??= "%s"
+""" % config_dist_server
+
     snapshot = """\
 ## This is information on the rust-snapshot (binary) used to build our current release.
 ## snapshot info is taken from rust/src/stage0.json
@@ -337,12 +341,13 @@ SRC_URI += " \\
     ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
 "
 
-RUST_DIST_SERVER = "%s"
-
 RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-""" % config_dist_server
+"""
+
+    with open(os.path.join(d.getVar("THISDIR"), "rust-config.inc"), "w") as f:
+        f.write(config)
 
     with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
         f.write(snapshot)
-- 
2.39.0


