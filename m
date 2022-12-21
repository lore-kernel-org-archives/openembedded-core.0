Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2D8C3DA7B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.17931.1671627197569508716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MIXrukrF;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id ay40so11098728wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHqatNsqcFxI50LPeZTo5jfd2/mA6woHq+ctiPQac0I=;
        b=MIXrukrFACmToGu0Lz46rC+kRAWQmN82O+ClFKNkApYU5HhwktulGGqibc7U29zj1i
         iuhHlzbgGVugKWIXml1Sk3yCw93MsYwGVIrApV1I1ZfD8/UA9kxCYCMtreCdMKZvcwEp
         FEw8snybwo7PEfWmgvqIozw78s3WgeSFgHA2s4R/qIZGy7t0QhSQihDUTxRTSR56SN0j
         GbioToEJyJrgn+CBywyRk9FFbetA29JOXRB34n8Hk9xk7DvMPGlc62N+cjuU5JsT2B+w
         unV+z35fc4aDXTVWZJu7OLidiecvv4uQzSlw2GDegHlxNmKpeN3m5k07b2lRl3h2QomE
         Q4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHqatNsqcFxI50LPeZTo5jfd2/mA6woHq+ctiPQac0I=;
        b=nbgZgy8/h3Km4ibT+yQqfHNnDFrSEU6Tj5ksularK3O9zBJ0x0573oCbG/m2Yo9VkF
         CM4H6mP/7vaxsf2D8pJcJcbsRYilSzY+vTQy0SFGytYtystQITE3afyGTq1MBFYWApce
         eTuaVXlPAVGj2c6QlRkPiSjSoSMDL4j6r+2mLF8AARvMMyexOFby3QYGtz8SxwW5mbAZ
         qUHSTE4NU9CP4mrOfp/nGGvbyNL5FvFfNMqBbvTkPCcWZp3tor/ZTJ0PjrA1p1jJxg/X
         jBR7ynvTaRNkz3OjQz0xx43AJ48SLErmUpFpvkT3hWvIOduzKkIhaUWVTqr4fZM7L5BW
         t1yw==
X-Gm-Message-State: AFqh2krAaGigO8UmXdsfW+oaQ0joBXTLvieJZinh6UrqdCg1wICZogDX
	LCG78qqBsU3y/zeynhe7YF8r7grOH6w=
X-Google-Smtp-Source: AMrXdXsVXvTQJp293VX/eMjRZ4OsQZYuVdcxYr0XNeYF+w92kmokb8ul2CzvRaXJ2kSJRvtdCx+KBw==
X-Received: by 2002:a05:600c:2e54:b0:3cf:ceac:94d3 with SMTP id q20-20020a05600c2e5400b003cfceac94d3mr1649453wmf.13.1671627195931;
        Wed, 21 Dec 2022 04:53:15 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:15 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 02/10] libstd-rs: Merge .inc into .bb
Date: Wed, 21 Dec 2022 12:52:57 +0000
Message-Id: <20221221125306.13779-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174908

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

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


