Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D557C47DA9
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.51506.1705270483822562154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZ3F08DQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e775695c6so3928895e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270482; x=1705875282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9nEmZRmXAXgJYwk+3uizUuvD61oxAZpP1cypbq4aKU=;
        b=QZ3F08DQwLKZKwQqT+5V75dtenjEpWZ26spthuAJ0eDGs7MXDO4xv0hraZbI2wpE1/
         wBHazNYfdBwm9R1GAsZHxvPaRTmpOvSYZXtx6ibPbmZBt2W9l+KwGzQXgMIpkVAM98J/
         QbgAAZe9/TtRSyA1gEgMJeii6V3f7CYRrdU/IMAxIpBOfrRQqBolXsYpFbRpCtIeDyje
         5hCql4hhlIJP1ycISkwiwh7TS+6p4121GKh59ze0IcOViUKh8trRBeqOmOK1izcKszlR
         CEUt/QM/EgAROM06psteblxRG7HFk682EMUVW3rsrby8p7Y2gZMUe/Vxhym9A+B0AsaS
         fJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270482; x=1705875282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9nEmZRmXAXgJYwk+3uizUuvD61oxAZpP1cypbq4aKU=;
        b=hHHH8qkSQGqIbqSzuXojmxQkcgejrzpxqVzWEqk/slTXWl3McJL6NlwJd5RtC/b2iW
         2yCxGiil/bg91EMudPeycRSCLRNyuc78eP2mG6lfu6VeCCHAofQgcOZpTw40Le8zQrY0
         dgGCAeaZ1Cqt3SaYe581+7FlXUXhyhCCLRr3yH64npemGZfhr+V1g5I9WIHFlrBeiuqm
         lkSWp4aAqWcE824VztUgXb+Hq7O1AuPU+vlgj/BXTbWmilMmNwtKdSgTgdkldo5qncO8
         qVhgwD9iatt9VEM4diKJacLzeMFqr4qjh5DDfjE13S10woOuHH+iAVVsgmsAzqHD4qea
         VLmA==
X-Gm-Message-State: AOJu0Yy6e6As3ckDH84SJ19PnBVZD77nvrxGaudxhv2njWD2BiGokPLD
	tkPm1D4PVA2cjEN/DWnRQs7RNaO4QpA=
X-Google-Smtp-Source: AGHT+IGXrWNyF9wLL+KVI4e/Hqznju4aGxV/xaIn5WS9ZQ+rV8RjzOvJ+B1VJhes9nZEe1MSQNVYYQ==
X-Received: by 2002:a05:600c:3147:b0:40e:4338:79cc with SMTP id h7-20020a05600c314700b0040e433879ccmr2845770wmo.8.1705270481878;
        Sun, 14 Jan 2024 14:14:41 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 1/9] cmake.bbclass: use --install
Date: Sun, 14 Jan 2024 23:14:13 +0100
Message-ID: <20240114221437.1255866-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193619

Since version 3.15 CMake provides a command-line signature to install an
already-generated project binary tree. This may be used after building a
project to run installation without using the generated build system or
the native build tool.

This is a small improvement, for regular bitbake calls. CMake does not
check the dependencies again which is expected to be faster.

The main motivation for this change is using CMake from an SDK context.
With this change it is possible to initiate the compile step from an
IDE and later on initiating the install step via bitbake which runs the
install step on pseudo.

This is also what the meson.bbclass already does with the --no-rebuild
option.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d978b889440..ff96f61c0eb 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -222,12 +222,24 @@ cmake_runcmake_build() {
 	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
+# Install an already-generated project binary tree. Not checking the compile
+# dependencies again is particularly important for SDK use cases.
+cmake_runcmake_install() {
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --install '${B}'
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --install '${B}'
+}
+
 cmake_do_compile()  {
 	cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
 }
 
 cmake_do_install() {
-	DESTDIR='${D}' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+	if [ "${OECMAKE_TARGET_INSTALL}" = "install" ]; then
+		DESTDIR='${D}' cmake_runcmake_install
+	else
+		# Legacy path which supports also custom install targets
+		DESTDIR='${D}' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+	fi
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.43.0


