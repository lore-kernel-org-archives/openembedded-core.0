Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04834C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 20:41:24 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.95193.1705351277513166148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 12:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wodl0gw4;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5990d6ade7eso297373eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 12:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705351276; x=1705956076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKxFy60cNzM1Gxw3TUbWV43xNqc6cb68ARrm24h3dcc=;
        b=Wodl0gw4krpfErx1SHGrshBaEMsZZb7fRBcuNLYTV8M/9cHDl1zbjxUU8cGrUWl13h
         67MEavloPVdX39lgUuQhLlg5Ssc6hhwdeCl3tyy0lWkjFFJhY2A1ZeMIBkRDNlEpaUcP
         ppC55NAYCcQXn+xj1WQuiI41doxqmmlwfMN/eaLaHjq1bQQjAxdDWqH+UoC2cHSL4tfa
         Q0WQVDUq6PPx0yw41pw5G5wMmXdgY/CWkjg0tygOs5IXhM6eU/464PzQBOaL4LG337Ji
         idX01OuUTcuyehGPJgYV0YndmCSlPOpjHsvcaV2/TFXaKyOw2pKA5Yxd1vW4hbN7TVKR
         P+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705351276; x=1705956076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKxFy60cNzM1Gxw3TUbWV43xNqc6cb68ARrm24h3dcc=;
        b=LPxLwIQUrtCcnXeRQ9prCCIp5pzitXGq24fuYeFGA5mChHhFSSAWU4cIi+bXyFrHWk
         9lSpE2zv/UiYALAob87pFV3Vlgqtz/fOGw9I0qisCf4ZM+B/hIn+5pgZFLPAfCpiDoV7
         YPCglPNsOOpDnfY5oxzR3VaK59g5tVwawMVc+dfaSTiHSEzrdBd+hEwg0zOperIbXuUx
         BoF/uyDMpgeVpkIHsnqFnwo915l07eOsWCMqB+yRdv28GeadxbywLEddQ8incVJGIbfg
         UiX/U9XHzura9rBs8ts6Nblzs8SEaa/Q8dCyaZzhtzNEcs7O1nDrc1YCaaiBPhaq6M2a
         jejw==
X-Gm-Message-State: AOJu0Yzd2HDnDUKbsexLV/iMylMidkdqOHMy7LYeHiGabCOjZ9VPsFSA
	z34v1c1hf+zjT/UU9N7z0qM0kQss+t2yXg==
X-Google-Smtp-Source: AGHT+IGdDK2NF+kjJGAFsITToiKgEAFO8IMEfh2EK2Qok+WwpdFzeMmXhCJt4UNOXNeENFwfkhLUYw==
X-Received: by 2002:a05:6358:5204:b0:175:c0eb:eb30 with SMTP id b4-20020a056358520400b00175c0ebeb30mr7509090rwa.42.1705351276245;
        Mon, 15 Jan 2024 12:41:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8cf3])
        by smtp.gmail.com with ESMTPSA id r14-20020a62e40e000000b006cecaff9e29sm8051819pfh.128.2024.01.15.12.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 12:41:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCHv2] rust: Re-write RPATHs in the copies llvm-config
Date: Mon, 15 Jan 2024 12:41:12 -0800
Message-ID: <20240115204112.181248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193799

Ensure that it can still access the native-sysroot for dependencies,
use ORIGIN to indicate this relative its install location, this also
helps in this not getting into the output of llvm-config which could
otherwise provide incorrect library paths

target rust recipe builds ( cross compile ) calls llvm-config from
target sysroot which works ok as long as C++ runtime it needs is
available on build host e.g. libstdc++ etc. which is commonly the
case, however when using clang and llvm runtime this falters since
it should be using libc++ from native sysroot and if this does not
exist on build machine this fails to find libc++ shared object and
llvm-config fails to run. This ensures that llvm-config version in
use is correctly relocated and can use shared libraries from native
sysroot correctly. Adding ORIGIN to sysroot will look for the .so in
same dir as the binary and there is the libc++.so.1 copied in place

Fixes rust build with clang compiler.

| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config: error while loading shared libraries: libc++.so.1: cannot open shared object file: No such file or director
y
| thread 'main' panicked at llvm.rs:551:19:
| command did not execute successfully: "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config" "--version"
| expected success, got: exit status: 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust_1.74.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
index 30543ada7db..2faa2d7e4d2 100644
--- a/meta/recipes-devtools/rust/rust_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
@@ -200,7 +200,11 @@ rust_runx () {
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
+            chrpath -r \$ORIGIN/../../../../../recipe-sysroot-native/usr/lib ${RUST_ALTERNATE_EXE_PATH}
+        else
+            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+        fi
     fi
 
     oe_cargo_fix_env
-- 
2.43.0


