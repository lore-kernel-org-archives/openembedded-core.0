Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFDEC0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.22.1687143351645100927
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HTCOP/Ob;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6686c74183cso1292891b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143351; x=1689735351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN8vq1NjhUNfom4XWg/Yl3pwLinDO7j1Zif5tQ/zqpk=;
        b=HTCOP/ObOrZd1nL2zLz0SYNPGxRXjRyy78v8pbtjV1z61alnWlKxPXJSZ0v6VPpxvf
         ZpUafsGgafNrifD4cHtd3hIGvClcCHwf9JNOLfLxWrkff3w0PXpoV2f6a5HiVkLECUHv
         X7Od1MNTh3lBJ2YH4SQK3ouxMfVwS0j5I0iKgCamYeHN1HmDedvxilIh8ZDYDrzjZ2Nk
         xmqBap2F5APMX58gEw5nPoyDRvmUgNyiroiRYb6u1u3wuv/hs9XJoleTZXDfylAlG9gZ
         G6wytr12qsLbcULRyvjnAkHlUW58j5zmC1MCbrVPDFHyD9gFhlKb50jp3p3ZiFMup78M
         bh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143351; x=1689735351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN8vq1NjhUNfom4XWg/Yl3pwLinDO7j1Zif5tQ/zqpk=;
        b=V2irecxExCfDrASzsIIR+gjYHQF8Hv9Zzpz8khRtJVcTfsCEiBbvsVTJQLFaQKw+jX
         oVD4sYKe033R2XdraDMKYyF7NgWKNKI2oKxQSFAyafUGvs+wxz6BcOStzI5YeczSKbQV
         yVvzS1oOPQklN+yOLIvHF0iGayK3JI6FUFz8+fQK6OBOK9OPKKq7Ek4+AVZm6nH3R/GP
         moDc6UAdOWpMQW6cDRNNnBKUwUfRyRx0eJu2LmxAIFCDcZJSC/D+uzxkoj66mry9ZTGP
         a4yyHs5P1r3aZnV5yT4ROEKOnMgkshsKoJ6fNevlKnjG+M8b/cNWzoDxX7Whd3WTbHaa
         a5cQ==
X-Gm-Message-State: AC+VfDx+gttEjmCwrIGqAiPcj77i8Fp6IyXxGCSCpwbUf1a186146d7t
	+K1ZUBmFIIAl2WPo2cj2ZXZrhIawHr4mDhRWepY=
X-Google-Smtp-Source: ACHHUZ4sDiPU/y2SQAGoXqkDKtVoia5gw0/7ZFirGQZbnrXOT2m1Q6ZsVisAnDDU+h9tecYN5ERD1A==
X-Received: by 2002:a05:6a00:24d1:b0:666:efce:5989 with SMTP id d17-20020a056a0024d100b00666efce5989mr8548422pfv.27.1687143350666;
        Sun, 18 Jun 2023 19:55:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/18] webkitgtk: fix CVE-2022-46691
Date: Sun, 18 Jun 2023 16:55:23 -1000
Message-Id: <15603261034610b6606df99996d065c254d8f8f9.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183070

From: Yogita Urade <yogita.urade@windriver.com>

A memory consumption issue was addressed with improved memory handling.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing
maliciously crafted web content may lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46691
https://support.apple.com/en-us/HT213531

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2022-46691.patch     | 43 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
new file mode 100644
index 0000000000..ff9df40433
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
@@ -0,0 +1,43 @@
+From fd57a49d07c9c285780495344073350182fd7c7c Mon Sep 17 00:00:00 2001
+From: Yijia Huang <hyjorc1@gmail.com>
+Date: Mon, 10 Oct 2022 15:42:34 -0700
+Subject: [PATCH] [JSC] Should model BigInt with side effects
+ https://bugs.webkit.org/show_bug.cgi?id=246291 rdar://100494823
+
+Reviewed by Yusuke Suzuki.
+
+Operations with two BigInt operands have side effects,
+which should not be hoisted from loops.
+
+* Source/JavaScriptCore/dfg/DFGClobberize.cpp:
+(JSC::DFG::doesWrites):
+* Source/JavaScriptCore/dfg/DFGClobberize.h:
+(JSC::DFG::clobberize):
+
+Canonical link: https://commits.webkit.org/255368@main
+
+CVE: CVE-2022-46691
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/fd57a49d07c9c285780495344073350182fd7c7c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ Source/JavaScriptCore/dfg/DFGClobberize.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/JavaScriptCore/dfg/DFGClobberize.h b/Source/JavaScriptCore/dfg/DFGClobberize.h
+index 0363ab20dcd8..4b1bcfea1fd7 100644
+--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
+@@ -811,6 +811,8 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+     case ValueBitRShift:
+         // FIXME: this use of single-argument isBinaryUseKind would prevent us from specializing (for example) for a HeapBigInt left-operand and a BigInt32 right-operand.
+         if (node->isBinaryUseKind(AnyBigIntUse) || node->isBinaryUseKind(BigInt32Use) || node->isBinaryUseKind(HeapBigIntUse)) {
++            read(World);
++            write(SideState);
+             def(PureValue(node));
+             return;
+         }
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..02258f84e4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-46691.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


