Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EC9C5479D
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.57097.1671559636978449023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AbilzMuY;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso9503689wmb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thRuJtmTssIyG7l2IJePOzLYheC6XwEfWOGtbQPzcbQ=;
        b=AbilzMuYSsY5jjn66PMXY1cxASYqVzN3WA3ZWKMhJsayZO4kb3F74TSVw2nMzS7yAg
         ysMyU1N6G8JKupebrY+nXnP8UTx2jhjbIw8JwbCkpg3yGmVxDKJh0ffDPh5Og+pNlMln
         sTxw7dWZ0xHdqj00gFkeGL3RDo9ntGe09fFZprW+uUZvz6LgNv84FIFDW/P1CuRGqJpZ
         CEpkXaCn37a43CK/hPTZUdg1iIgqI0QkGHiupSQrr/6f/FMeWM5fhCEt+kh9YNhW8khi
         6aBzaNZceJuFoVmageHUffYJq9eNIP5QzxnH5A67oLC1PQPrSy/ieqfxWEIGP2mNe2C3
         392A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thRuJtmTssIyG7l2IJePOzLYheC6XwEfWOGtbQPzcbQ=;
        b=UVaC2P6ku0zwptORY/1xPVlbfDvd75AOUh9/wwELbPd5XY2+/s48UplAr4TqK4Kv9h
         vzGTT/nNhuYNIYBwKVrxBxf7Tpm2rmWF4OwoI/HOzdlHLIO7k6sw8oN8Q6Eet9UNwmVr
         Y8pd9Ynp+NlpdIF1VYMA4qfjiEFaTJnuEvAHlMADm1YlnGCETU76T6NNWvD/4DQzIQvH
         73Y7M81NHtWOEONWrlyg0btWkIynqc6iNc9grPnOiZLnTD2pSaOytXY8CZUlJbFdnQzB
         bXYcqMRE0K/Xwaxz3HoMEbnrdUML/ECwCzot42mvdtPPvA1jfwk6oRb4r8xyNXd9zqGV
         HkPQ==
X-Gm-Message-State: AFqh2krsd6mfE1nV+DMPX9x3rrkjDcOEvMH0RoGrWzVk1qZAjRK5y4C0
	n6a1CRgoKIx9Fp8WBIIZ89I4HrqQ2uE=
X-Google-Smtp-Source: AMrXdXt9cn5dkneZjrlrlXx4Y9yaWg9HelOUjij5VAR8DGb8UAhASmOSz1nBDEXebqFsMrEFJnK/Og==
X-Received: by 2002:a05:600c:34cb:b0:3d5:79bb:d7da with SMTP id d11-20020a05600c34cb00b003d579bbd7damr2631861wmq.18.1671559635345;
        Tue, 20 Dec 2022 10:07:15 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:14 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 02/11] libstd-rs: Merge .inc into .bb
Date: Tue, 20 Dec 2022 18:06:03 +0000
Message-Id: <20221220180612.24555-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174862

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/libstd-rs.inc      | 40 -------------------
 .../recipes-devtools/rust/libstd-rs_1.66.0.bb | 40 ++++++++++++++++++-
 2 files changed, 39 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc

diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
deleted file mode 100644
index 44cf683837db..000000000000
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Rust standard libaries"
-HOMEPAGE = "http://www.rust-lang.org"
-SECTION = "devel"
-LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
-
-RUSTLIB_DEP = ""
-inherit cargo
-
-DEPENDS:append:libc-musl = " libunwind"
-# rv32 does not have libunwind ported yet
-DEPENDS:remove:riscv32 = "libunwind"
-DEPENDS:remove:riscv64 = "libunwind"
-
-# Embed bitcode in order to allow compiling both with and without LTO
-RUSTFLAGS += "-Cembed-bitcode=yes"
-# Needed so cargo can find libbacktrace
-RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
-
-S = "${RUSTSRC}/src/libstd"
-
-CARGO_FEATURES ?= "panic-unwind backtrace"
-CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
-CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
-
-do_compile:prepend () {
-    export CARGO_TARGET_DIR="${B}"
-    # For Rust 1.13.0 and newer
-    export RUSTC_BOOTSTRAP="1"
-}
-
-do_install () {
-    mkdir -p ${D}${rustlibdir}
-
-    # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
-    # files that get installed. Those are really only needed to incrementally rebuild the libstd library
-    # itself and don't need to be installed.
-    rm -f ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
-}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
index eec0245ae19b..6c5a979f4f23 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
@@ -1,7 +1,45 @@
+SUMMARY = "Rust standard libaries"
+HOMEPAGE = "http://www.rust-lang.org"
+SECTION = "devel"
+LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
+LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
+
 require rust-source.inc
-require libstd-rs.inc
 
 # libstd moved from src/libstd to library/std in 1.47+
 S = "${RUSTSRC}/library/std"
 
+RUSTLIB_DEP = ""
+inherit cargo
+
+DEPENDS:append:libc-musl = " libunwind"
+# rv32 does not have libunwind ported yet
+DEPENDS:remove:riscv32 = "libunwind"
+DEPENDS:remove:riscv64 = "libunwind"
+
+# Embed bitcode in order to allow compiling both with and without LTO
+RUSTFLAGS += "-Cembed-bitcode=yes"
+# Needed so cargo can find libbacktrace
+RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
+
+CARGO_FEATURES ?= "panic-unwind backtrace"
+CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
+
+do_compile:prepend () {
+    export CARGO_TARGET_DIR="${B}"
+    # For Rust 1.13.0 and newer
+    export RUSTC_BOOTSTRAP="1"
+}
+
+do_install () {
+    mkdir -p ${D}${rustlibdir}
+
+    # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
+    # files that get installed. Those are really only needed to incrementally rebuild the libstd library
+    # itself and don't need to be installed.
+    rm -f ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+}
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.39.0


