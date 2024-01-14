Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147B4C47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 05:58:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.34927.1705211928057427377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 21:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3D+GbzL;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3e84fded7so42675115ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 21:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705211927; x=1705816727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qF2vs2a4MByypt6NFd15AXrSVbBL83g5+mjyvvMFmkU=;
        b=G3D+GbzLsC9lCwscUUR57PqjL+3N2MQZ/gOSBRkz69GSzB5hvL34LBuNK1XOvImUQd
         nDYivWusCpNDLcIfHEoymZN7/aBEQQ1kJ3ryI9MPnCEXZwqN5yp5GIM/o8fJaYHJ2WiR
         imcSatYe8l3Ux7PhMpXumCHRZOLrH3FsDFCtbxuFJEBu9+2NPkkryIL4qUqVGPWfwJSd
         xRJSz+rUciu6bjcN/9enF4voWkuAH4oMFut5nDsZIdBBdgKtEgzbjpv7+/Yfc0YR3GzS
         5IZiFcxCfiSx+Dj/Xwtv8YI4NHl09fjUe0QqXn/k7Wk/YD1/nuMiap38GGnRkIyuwpI2
         ciDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705211927; x=1705816727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF2vs2a4MByypt6NFd15AXrSVbBL83g5+mjyvvMFmkU=;
        b=w9lxycSEOtiLCYFCNQx+8XtHL8uiic1E+eEHgqT9PpbWOmMpTfHfR0Dpf+/m6+Gus1
         z1NzYG8UiNzK0GzguOZkl/x0UBW/uIk8F6ZX3B+jZAGSUQR/SGg+OetNuLUZCjv3on0E
         FldodHJgKrfOHkDMORvbpAMtilFvRI94sH/gu7FV8jUlbY6n0Q9oD7LTXb7Vdh+sdkbJ
         xA+NAgIV/c6dLI3VmrY2M3gCl967wpIctNVKaFAyxpWTMpWQBrWlBGMa7816pWJIWXH+
         kQsT29BRpSugH490TBMe9LqxG5Jydsv9DJfukPznzGByZznSL1PDEwcI6RBD+/PLbMb4
         QUcA==
X-Gm-Message-State: AOJu0YxvSVqgpW4Ddi5LnbTe5ybGPHnZaGpliwylhbAydFqHCuxqh3d4
	H3Rv245AswhBBxt6bfI+lyYA81bcdhzWxA==
X-Google-Smtp-Source: AGHT+IG6d7E/7pM9nI7uebLCSHB+5DHOAPxXH4UU2mqVBsar11tYHrvd/Crwi1SZX3QrXosMSaI7KQ==
X-Received: by 2002:a17:902:f684:b0:1d4:ccfd:9cc9 with SMTP id l4-20020a170902f68400b001d4ccfd9cc9mr2350220plg.36.1705211927110;
        Sat, 13 Jan 2024 21:58:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id d19-20020a170903209300b001d0c151d325sm3497244plc.209.2024.01.13.21.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 21:58:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Use llvm-config from native llvm-rust on rust target builds
Date: Sat, 13 Jan 2024 21:58:44 -0800
Message-ID: <20240114055844.2301337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 05:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193611

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
 meta/recipes-devtools/rust/rust_1.74.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
index 30543ada7db..2dffe009827 100644
--- a/meta/recipes-devtools/rust/rust_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
@@ -198,9 +198,13 @@ rust_runx () {
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
-        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
+        tgtdir=`dirname ${RUST_ALTERNATE_EXE_PATH}`
+        mkdir -p ${tgtdir}
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
+            cp ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ${tgtdir}/
+        fi
+        chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE_PATH}
     fi
 
     oe_cargo_fix_env
-- 
2.43.0


