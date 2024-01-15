Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14478C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 20:55:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.95624.1705352120905961875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 12:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ezci6yCB;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6db0fdd2b8fso3103087b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705352120; x=1705956920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skJUN1OwJb4NZmKpCeGNyHYavQ0FNmO0npH8xZecGnc=;
        b=Ezci6yCBCTtQItYGH2vYn/072ZjmZvzN+cvsx7aQv/x4lkrMz0VwrIgF5I5zJ3mOhC
         83o/VDzcmnsPXz1McpCtlyeuhBi0lTy/BYla2SbIsCHpGoNyynCBE7qSxBvRsx77U8EZ
         MxjSoMxHKYOB5cJZ0wSIw7siVmYsZtEwwjbCeaEAOaJ8cc1M/Cvax9zHZrPuhvDQhCsd
         iVjfkB9qMlfxZp6x5mV7Kja1T4ZWi/VEhzoXaq8d4Ru0VFoudeNsspzIxByCFqsM9/di
         RXyKWFRf/fFqB803b83rmrSgziKMSvthuRrbfMzkwExQGS9DvJmDiRoSEF0ZjsGPXUVG
         dieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705352120; x=1705956920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skJUN1OwJb4NZmKpCeGNyHYavQ0FNmO0npH8xZecGnc=;
        b=Qq7VipBys7cxl9RrkyJ9g7VVUY89ef26tKwwzfcTPBHxCV5F5e66WY1slrZIWbcy+L
         8yQuFeA0TzmiFR5VQ0LglxMFvZP4nPZsVc++SuV7b9/HmA2mJ5rJDlVz2E0SYth3gQ7I
         dQzG37EIYrxDuJ67Y7D3rYfB+KFCHMeIILQwU2YGTXSgrsDXB5n9oUVzS1NPobbB5uOm
         /9cZ8Z7KEpT84sRm7T+ylbfcuvGb6h/MRcJUDioA9e94e9bBbW6Q+Dhlz/P69QwRJwqA
         3ItXyy6Fdp10c3XGJpX1CQ4ABCP6utF14IVcMjcGhotFo9iT+BwGOuNXZIufCBzmU/i0
         oGLA==
X-Gm-Message-State: AOJu0Yx0OQeNBu5X7BIV3i7nrBgqEgQZZ/JMYln03fGUvsBkf6WhKekp
	m4Ub9Ro+69CNJIu8wf+HqEdkjrzbxtSQzg==
X-Google-Smtp-Source: AGHT+IFPud7Kfs4pvZv1eoWYBitzJe1TrlnUjqWe+LrkpdUTFjv3lYXSXESpEPWW0TTIxG5LBRByKw==
X-Received: by 2002:aa7:88c7:0:b0:6d9:be17:999 with SMTP id k7-20020aa788c7000000b006d9be170999mr3883078pff.67.1705352119974;
        Mon, 15 Jan 2024 12:55:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8cf3])
        by smtp.gmail.com with ESMTPSA id z10-20020aa791ca000000b006d70b0d4639sm7965589pfa.107.2024.01.15.12.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 12:55:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCHv3] rust: Re-write RPATHs in the copies llvm-config
Date: Mon, 15 Jan 2024 12:55:17 -0800
Message-ID: <20240115205517.212644-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193801

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
v2: Use RPATH instead of copied libc++ to target sysroot
v3: Use bitbake variables to compute the native paths

 meta/recipes-devtools/rust/rust_1.74.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
index 30543ada7db..f8db186890c 100644
--- a/meta/recipes-devtools/rust/rust_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
@@ -200,7 +200,11 @@ rust_runx () {
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
+            chrpath -r \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
+        else
+            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+        fi
     fi
 
     oe_cargo_fix_env
-- 
2.43.0


