Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED58C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.30955.1671657436449879373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WrLk5t6P;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id a17so15038304wrt.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHqatNsqcFxI50LPeZTo5jfd2/mA6woHq+ctiPQac0I=;
        b=WrLk5t6PmEoAAWqjWjj032pLpcEUIDyG7BNNXXrCIo1BWALm5yXAD8GaiRXPbrmHwx
         UzbbjheTkckvVsCH5rOugjT9x1BM5wGFkIcudZMwlF83mpPKRedtbbI7/sYsuLPB8Diy
         qiPg17HOYw+TBvjNK0PWs+cSs61dq1Ssj3kUjNqPzwxigT+W9BklwLjy5qREKblde6I5
         BEkvl9/Ok5vhsuhwvGFEPgD4QFKu1LMRynH3qOL2kYziHpQgzfjmcUXcrumzjyZxG0pX
         0MA9JzhWiQIeCW8V0CVo2mLzFrxWZxNcgOFN74T2yd0+ddSqui8U3od9ED0oWrO+6HTu
         W7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHqatNsqcFxI50LPeZTo5jfd2/mA6woHq+ctiPQac0I=;
        b=2Qg+kFi1e4Z/4ZQX3Zv1iVnW2lnEGGMBHXcaR1PJoAstSIUbwd27uGXpOPtEBSYs0d
         H+zyrHTo6akgFO2YWUmktx7OwAki4+t82TOOacZGuMJb3nDU3USPLnBHFi4OFAjzWsdZ
         ZOhrPnQwAw3sL82uR3Mx4qV1+Jn82XXPvjdvNwI2vJgIcNXog75vNlpGUU80abeV/roc
         wMaPfjVGN1GkclmhjnvdULnFGcjeskTJ5+JDKGZVCn2QNyptLSSU6e4G6Xpm/m/NlZyz
         Vq6ylutJi94Lp+yZnrm6XgIpr0pQ4C2P3HZRHc1hUz1YztQf0HtUbs6rN6QUQfKEV8H1
         aObQ==
X-Gm-Message-State: AFqh2kq2ZNk5SZUsP1Qu2pE6kBE1m6j7IqZdaZLInOWGQ027ucID8rNc
	O0oCQmnkhRit8HkwfmehkjJ6DbV8vIk=
X-Google-Smtp-Source: AMrXdXs9x3Yjc93afocm4q1DeyFpxeUAWB8DVQ3fnFsAOU+F/sZ5ybGWZH7X3sH3PCjYHYJQj+8djA==
X-Received: by 2002:adf:f983:0:b0:24d:cac0:96bb with SMTP id f3-20020adff983000000b0024dcac096bbmr2064007wrr.67.1671657434786;
        Wed, 21 Dec 2022 13:17:14 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:13 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 02/10] libstd-rs: Merge .inc into .bb
Date: Wed, 21 Dec 2022 21:16:58 +0000
Message-Id: <20221221211706.25347-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174942

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


