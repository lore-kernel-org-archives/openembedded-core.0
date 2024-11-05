Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8AFD33A38
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.28095.1730832359252787270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+4Y7HGs;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso4631216a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832358; x=1731437158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t865dY0gstbc9bVlcWYKwM9wyM2OAjL1+XgM/yI9MVE=;
        b=J+4Y7HGsny+WbSoMFg3HiAXC4XpQpl3gUSFj+8gHZmJZlaNnXEe+9TjtAYc2sXmUOI
         h9HOV9+N6lD7oZ5vb+pGTY1sxSohCmhCoaH+abHzGVH6A+eUcaCif/2e9JR5Tz7XerJC
         DnBbdoxlKErPbpdALnX3yB7tk/zq+1I2atgnxeZ9RtTa9ho/cxdKt/zZ5VzyMaNUPzuj
         HJreWUkHsm1GZWnVN7m4l1lT1wvRSywO2AzXtap9InwKtCL1hzRXOAl62EmDj8bQ9xzF
         hsAGYvsEyHpd+YtUFIOsyBgUDjTiKawL5kTvrxz90MDWkZ9hFSciFZu/L/kHVomRY4c3
         +FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832358; x=1731437158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t865dY0gstbc9bVlcWYKwM9wyM2OAjL1+XgM/yI9MVE=;
        b=xGLxwfIM5xvtnhsq3dK6jhpe+dtA+oLtUxLCyEpYjgY0q7qUgncYLb1mNid6VTvX8c
         eICWcYL8iGazM6JPjhG3JwBrmaSG+PtP/Y0nYPvn0OyQ/FCZD0khBA7sxgn2604wvf1S
         dxWMieFM2OFvpCNTZP7nRk+xNX2s1un/VMvcWCByn7DRVUH47bsYSI4oEf1+PLQ7qXRI
         C7yG1uG9Cqj/TjwLXTF+SL5LgmTzhlB7u6dQEi+SQ59LxvhSK3/WyyjgcMPrjEo/UJiK
         r+gsI0jrFysbPSXRNOvJq3Be8zQE7n0lkEskOjn+Q0ENnHE+S27zB+2tfU94fSm+Hc9N
         /0/g==
X-Gm-Message-State: AOJu0YxzCOziL2QvwDwEyxTZ7vV5XB1eFnISX8yyuqqxQrEWS2vYYfHy
	IQc0wg2EUThQMWkGe1tPnDq1L8ZYm1v+cc/IlKvzprDGRQ/U9l8wKz0y6g==
X-Google-Smtp-Source: AGHT+IFpJDrTdvKfFSQCZTrXY+VKUiZKRqNKoqtVk+NlCycdwVm8dJc1F1ubPcsXFD8pDuFo6iKEcg==
X-Received: by 2002:a17:90a:b706:b0:2e2:a097:bb02 with SMTP id 98e67ed59e1d1-2e8f105e828mr42355491a91.11.1730832358550;
        Tue, 05 Nov 2024 10:45:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 17/19] toolchain-scripts.bbclass: Add env variables in SDK to use clang/clang++
Date: Tue,  5 Nov 2024 10:45:36 -0800
Message-ID: <20241105184540.3450302-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206745

Make CLANGCC/CLANGCXX/CLANG_TIDY available in SDK

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index b59a295abcc..f17905d5284 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -11,6 +11,17 @@ inherit toolchain-scripts-base siteinfo kernel-arch
 REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 TARGET_CC_ARCH:append:libc-musl = " -mmusl"
 
+# Adjustments for clang in SDK
+export TARGET_CLANGCC_ARCH = "${TARGET_CC_ARCH}"
+TARGET_CLANGCC_ARCH:remove = "-mthumb-interwork"
+TARGET_CLANGCC_ARCH:remove = "-mmusl"
+TARGET_CLANGCC_ARCH:remove = "-muclibc"
+TARGET_CLANGCC_ARCH:remove = "-meb"
+TARGET_CLANGCC_ARCH:remove = "-mel"
+TARGET_CLANGCC_ARCH:append = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"
+TARGET_CLANGCC_ARCH:remove:powerpc = "-mhard-float"
+TARGET_CLANGCC_ARCH:remove:powerpc = "-mno-spe"
+
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""
 
@@ -147,7 +158,10 @@ toolchain_shared_env_script () {
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 	echo 'export OECORE_TUNE_CCARGS="${TUNE_CCARGS}"' >> $script
-
+	echo 'export CLANGCC="${TARGET_PREFIX}clang --target=${TARGET_SYS} ${TARGET_CLANGCC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+    echo 'export CLANGCXX="${TARGET_PREFIX}clang++ --target=${TARGET_SYS} ${TARGET_CLANGCC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+    echo 'export CLANGCPP="${TARGET_PREFIX}clang -E --target=${TARGET_SYS} ${TARGET_CLANGCC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+    echo 'export CLANG_TIDY_EXE="${TARGET_PREFIX}clang-tidy"' >> $script
     cat >> $script <<EOF
 
 # Append environment subscripts

