Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B2DC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 11:25:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9562.1720697125598291714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 04:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ijuwQpsc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so4806685e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720697124; x=1721301924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJmiTR7pUwkLS7eoBXTzvcmlprtkhxcdzK6+rXS50sY=;
        b=ijuwQpscgMPqhlrUaItCMiQAdNxev/eVL01ZJpjJiNEnFKF19GweUh4SvxN+eRawN/
         nyyB883N7Y3YP6sLQqoPj1ofIubtYZVNDI+rBsU6WH4AzX+lCoiPzXOGU6jcSIvCIqAA
         xhrWYBMNEXy2g5IM1xytSigLIYfjZCOlEp+Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697124; x=1721301924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJmiTR7pUwkLS7eoBXTzvcmlprtkhxcdzK6+rXS50sY=;
        b=fTpVyZQQYJgde84g8Ja1E//pZkM5JcCV2zGzUBLOMppyXbkdS1eCu79isMwdHZpXZG
         fk9/KReOCNUVGo7p6o6C6lv/JA0DBXv4Gzr6fEzTB9R7vTtDBJUr1g8GNXzEhkhAt2Hd
         bodOs8hUQf7a3ENKcL9q3JKBfQWRLj4lqGsXNqe8N61B+HDf47ccp0W7uwEv55/mtToQ
         Af/xL5qApiOsuWz82vXObJEr1yjOAeJLlBLuQfrO+r57mK9s2Zts9GEUabL1czn8SIXm
         VhWFrW5NgU8/E5EgCg+16K4+U+xl5zLXkdn0eW2Fat90S2QqsFKcSAWs3KlyTtSEOpol
         tdCw==
X-Gm-Message-State: AOJu0YzzeLzFbRzu3GYWhEugB3b9mpRD5QcBAHGgVqxIjhNY1FYp9wjH
	7DTSF5A3xs3lqiis/w3jGL8xn9u4ifeIrOiiiDP+MWWbWAWXw6laQmdKuSzN7MW4ZL6U3z3xaUK
	P
X-Google-Smtp-Source: AGHT+IGQPMVMO1nJrtwPl5obRwmmsjof+r+9WGtdeeEb/rZh4Ry5JnNiJjdtlZApVYflyDq2HDl2Lw==
X-Received: by 2002:a05:600c:4316:b0:426:5269:9824 with SMTP id 5b1f17b1804b1-42670197e6cmr76625105e9.0.1720697123770;
        Thu, 11 Jul 2024 04:25:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426740d88bcsm69817005e9.1.2024.07.11.04.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:25:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: Drop generating a static libpython
Date: Thu, 11 Jul 2024 12:25:22 +0100
Message-ID: <20240711112522.1211884-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 11:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201774

This currently puts a 60MB binary into the recipe sysroots in the native
case as well as the impliations for the target. Since as far as I know,
we don't need/use this, stop generating it by adding a PACKAGECONFIG. It
can be enabled by anyone who does actually need to use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 1 +
 meta/recipes-devtools/python/python3_3.12.4.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index ffc121e440a..16af07511ed 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -1,3 +1,4 @@
 DEBUG_FLAGS:remove:pn-llvm = "-g"
+DEBUG_FLAGS:append:pn-llvm = "-g1"
 DEBUG_FLAGS:remove:pn-qemu = "-g"
 DEBUG_FLAGS:remove:pn-openssl = "-g"
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 77bbfaa069e..743ba0b1f1f 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -107,6 +107,7 @@ PACKAGECONFIG[tk] = ",,tk"
 PACKAGECONFIG[tcl] = ",,tcl"
 PACKAGECONFIG[gdbm] = ",,gdbm"
 PACKAGECONFIG[lto] = "--with-lto,--without-lto"
+PACKAGECONFIG[staticlibpython] = "--with-static-libpython,--without-static-libpython"
 
 do_configure:prepend () {
     mkdir -p ${B}/Modules

