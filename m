Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F97C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 22:52:07 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.8188.1747695118213194092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 15:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MIDVkElD;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5092849b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 15:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747695117; x=1748299917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOJE64jtUD93AFRsGW/5mA1ssplhi//OPoKm13xgQZE=;
        b=MIDVkElDTTWYIjR5XN4M/sN9239Xku+4e9zidtLrVM70YUilKHlhUhI0aX0hRiUWSg
         RyIf3jv3+LdTe10Frcwrje/S9GmHQ0+8V3a8GJbnOMFaA8aVwAl0kG3swWVxUA+s1JIW
         fiRHcm8JzliGvtGkiwY/99oG++WeVoKnOASbtJsYXJxr9xFQwsfN+a97Ff1QqaGgeetE
         0ec4Or0Z1Y9KuO8qK74yHM92RaFWRmNyCeXbJ8LrpNU2Ispdpuwj/QSy79+fJT7KCUdi
         T9zktwydNKL4VSNhbTs7wpmUu83w6PQMQwi05c1yo+IwwK1fqQzKa5GDi7lIbbj8nL7P
         CjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695117; x=1748299917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOJE64jtUD93AFRsGW/5mA1ssplhi//OPoKm13xgQZE=;
        b=RVuuG/pX5etY5Tmw9flnwK8MIBN4hz0Hhg899zrYtcLFuuhlaGRJQ/6k0VI4skZp7K
         w5rtgRs2YCFB9oCzg0rzitjeiHUNo+V5gh+fSr5J4D9KP61hJdKoXTyf/qdR1I+GVpha
         dfvYZy+y68h5IyCFojcrA3B5dJbryKD7i3DPPAfGCxQYV+5450h3gmnNTBVKGuf8L6Fg
         GOpixcLEOIlvLPoYsg6plLq8sC0wp35BsaZHqWOF0mN7B/xR4QE1q02VfxtRR6CX7+TA
         Y9+LYJ4t0lfCdTLqwRH6NpS+13QkhmadIaQqGtCUUOhCaCBtPA30zzTDlLLsXhB8WUIn
         eBAA==
X-Gm-Message-State: AOJu0YzlVKlRreUMRlXVUxAXEice7cLW6TBPQWjhkyI3pggYIkXMSan3
	N0y+MjB5GSI//QFywadB/fTefg6cunWub0FOTZBGXXWd++DTqW0Wg8ZRpYEN89W1
X-Gm-Gg: ASbGncuKpkFllRjuhcrufd8id1k52IPDnsdpfpadNcQaT8/nVnbihLT6xqKpjwtFsHI
	ybuMXQbOmX1zC279VvnUjMMx07Gzc4jdLqZxy2G9p1Y5z3U5fho/OjvLhhfgYgw5JnD2o2VplqE
	s6W/9I2P98MUIDK0b3DDepS+kLmuLwFij/mU7SjBlunPhhkmBhYwuJAt8TZ3QKt9/i3lN1dsgtH
	3kELWqCT+c4Omu3mp9UTiDQIucsreh0ogJEx/1CQ97V7LSr3VTTPEzfZhQ56QYj4Nxi48vBGIIT
	TVH4SxKowgi9mffId2cTFe2+r89R5ShuKAPSYz4vRUA=
X-Google-Smtp-Source: AGHT+IEHzEAS4lhqAymhTCE3Aq29bLB/rCVMO5n9LexM2wcAwFDchvy+SE2TnFFXSs7ikawFIt+Eaw==
X-Received: by 2002:a05:6a00:21c3:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-742a979672dmr19735019b3a.6.1747695117254;
        Mon, 19 May 2025 15:51:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c86asm6991914b3a.57.2025.05.19.15.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:51:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust: Use patchelf in place of chrpath to edit rpaths
Date: Mon, 19 May 2025 15:51:54 -0700
Message-ID: <20250519225154.1237093-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 22:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216878

chrpath has limitations e.g. the original rpath in ELF have to bigger in size
than the one being edited into it by chrpath, some toolchains do not use RPATH
but emit the RUNPATHs into ELF files and chrpath is not able to handle the
runpaths, this is the case with mips and pp32 build of rust, especially
when using clang compiler to build them.

patchelf can do more:

Modify RUNPATH entries
Add RPATH/RUNPATH where none existed
Set longer paths than the original
Convert between RPATH and RUNPATH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use patchelf-native to provide patchelf instead of assuming uninative

 meta/recipes-devtools/rust/rust_1.85.1.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
index dc4f5648552..b238f207266 100644
--- a/meta/recipes-devtools/rust/rust_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
@@ -64,7 +64,7 @@ do_rust_setup_snapshot () {
     # are used internally by rust and result in symbol mismatches if we don't
     if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
         for bin in cargo rustc rustdoc; do
-            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
+            patchelf ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
         done
     fi
 }
@@ -72,6 +72,7 @@ addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
+do_rust_setup_snapshot[depends] += "patchelf-native:do_populate_sysroot"
 
 RUSTC_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/rustc"
 CARGO_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/cargo"
@@ -207,9 +208,9 @@ rust_runx () {
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
-            chrpath -r \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
+            patchelf --set-rpath \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
         else
-            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+            patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
         fi
     fi
 
@@ -266,7 +267,7 @@ rust_do_install:class-nativesdk() {
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
     chown root:root ${D}/ -R
@@ -301,7 +302,7 @@ rust_do_install:class-target() {
     install -d ${D}${bindir}
     for i in ${EXTRA_TOOLS}; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}

