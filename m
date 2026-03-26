Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C83F109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47401.1774529487812801215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vi+lowz2;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso9739985e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529486; x=1775134286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=Vi+lowz2V5kZBNmlaPqiZpsQfu9BdzUwGWlzb6D3o7g9vflGKmB9TVBYRiBG7k9puE
         fkwOseuFvZByjzzmZIXwcKt/RvC1mbiAOFEm1GMlp7VwdJ3XrWrfvvIdaTmE2tYaUaCs
         IuxTcLzFSR76jKq4WcDMIYMu33vi5xuhXcJh9mEakwYGnc9bBfJ0/dW6KdnOvekZ/dk0
         LYNvcADZnKYRaMH7YiprfEOPNtyMw/JdMQbzBCbWxEd2Bj5Z2FzeARvIVny2Z2eQPQEg
         Upc4g1jZhWcvIF1LCUHSzOXyP7dW1Zh+qs2fyzeiUNV7FyQ3LXpVVx5Kn/UZOKuyMzrH
         YXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529486; x=1775134286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=aF7F7tpdXWbguAHIz5vweWArwHRf8u0gEOlLhsLQXCrzoGWH1sEpyu7yjbjOzK5i3c
         YqFJdklYb4bHhY2h1v0C7clQ5ND1hSFBr8CVZ2tFLqfcSqaA0UFAl43XpIY7++OkMWVN
         bXNxe0hjunzwCXnW8qS8inQRDGFBBqtczi/krax33fKvpVRIYIk/wIo2FD7FNyt6wPZX
         HARDjFf18KJd8Ka8a5l9yrBjF6QzS61RoBZcio+vjrV6zUV5tDcaVBMH+V9Bx1v07hJm
         WHTrYnRWpoAKyQ+FI8DTWx3Mnq7+Mv3THiAafPlupxuQxZ3iBmeC3AJbpRXRFOE9SatQ
         12Sg==
X-Gm-Message-State: AOJu0YyuoXXw4m/23XXuu/ceBSNYk1wKLfAC6kxNqwbcNZbYPWiJg3RE
	Tl0+ipuizm4WBNrPw0vt3mX9NujPcZYbo3QPFhTPxBCvT5LEXmz80D51lMs2Pw==
X-Gm-Gg: ATEYQzx7/wjR4LZzktusO33qkdzzJBTfAzq29v8a1FbMRYuHHZht5k0E7uW6xyTcIn1
	c4HEbkzzEvEfuPzj8qO8WBPs2XmHIcv2LgdeLGLlJRfI2QpZnbRI2MnCrynUaq8R1dieLprwU4L
	79VzwboUXhUTzt/KW97sm0pgEY/JbGLMg3n9S6PKyn9lPltkDiL299HDAgfVta7Sw2Fkh9gLaoo
	+D8v1B+dWBmaShRU/phSMQ7tpDU9b8UMon2KSyVSlhPMM/EVmAokOQHsO/bWvaNbO6ScV2xt+Dt
	JLqgGz3XZLdXMfapEhcPyleUDErnZlUvbiyrra65vTbxkJtmaozVTAVgdGsNr0AY63gXelEpZEC
	aMdUjt1Y+X/bLfgVDWPK+nlnNZHERuC1JUhNdDd84XsXwKhn70kj3Q/oYKl7byqQvINGNLTVMty
	bjoV74DQOesy8/NA==
X-Received: by 2002:a05:6000:381:b0:43b:4212:2ee8 with SMTP id ffacd0b85a97d-43b889c861emr11946429f8f.24.1774529485797;
        Thu, 26 Mar 2026 05:51:25 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 07/13] gdb, gdb-cross-canadian: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 13:42:28 +0100
Message-ID: <20260326125113.1853869-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233992

PYTHON_DIR now contains PYTHON_ABI, don't use the latter.
Simplify the linked library name to use -l${PYTHON_DIR}.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 4 ++--
 meta/recipes-devtools/gdb/gdb_17.1.bb            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 7b4a7719e4..c4c62d02af 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -22,8 +22,8 @@ do_configure:prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
         --exec-prefix) echo "${exec_prefix}" ;;
         *) exit 1 ;;
 esac
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
index 9c6db4ca2c..a5d96f01eb 100644
--- a/meta/recipes-devtools/gdb/gdb_17.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_17.1.bb
@@ -26,8 +26,8 @@ do_configure:prepend() {
 		cat > ${WORKDIR}/python << EOF
 #!/bin/sh
 case "\$2" in
-	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
 	--exec-prefix) echo "${exec_prefix}" ;;
 	*) exit 1 ;;
 esac
-- 
2.53.0


