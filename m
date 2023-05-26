Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD45C7EE37
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.105.1685068175922039092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PLIQETdo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae40dcdc18so1717895ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068175; x=1687660175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hY7+Aygn/5XaIKrT64r2viNcP/z5hrhYzi79YOcpr4Y=;
        b=PLIQETdomWBDdWtK2oL9FO3HN0MrATM8LT9zFUC+eQeIjRE/nJYrFRgJXr3j1tesZD
         dtl47piEA/IE7q/siax8+W+4cZBvpX2omDwEfVUn5/Izk/USRBl75JYP+5aIztU523jR
         dc8KMG72dWurhAnmaCW6zivtZ0CchBcg1G7Q8Cy5NPBMfjDpUN+kyWm8yKuBuWqdTroH
         gt1abdo3C+ZtmI+mOdByEj6ZVtWuxkD4MK1ys6tZvRCRex1ZIuO8od85baKAWm5F0FZ4
         1oXjhPoAtAg1trBGOCO7KWNG+Kbvef+ulaajEAoj2dvS2KQNY9JeJ4rZKqCb1tGQ62hc
         hV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068175; x=1687660175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY7+Aygn/5XaIKrT64r2viNcP/z5hrhYzi79YOcpr4Y=;
        b=hPx+55khj98grRvYsxLgXJQ+Gz6GRNViPoV0OlUn1yINg0nXEO+STawt4WI8m2w+NN
         wHpbHaueulOxA17GI3C1i3YnoKYSejYghZpnzlSKcl+FFX1FrqFUyZE1/HOVAVHVyxom
         cNeYMsLq2Q1rm2FQdaT3+wd6u8GawztAEE+xx5oPST6ZGaAGRJR/UPcgaFqwzbKkBkAO
         cFdY0cDPWvBnur9fAG+WKeMqX36+BFu0smPZ4B/x7FlELe5+RvsPIt2Ww/p6p0aZFOl9
         tAWJShCkgyXvACIP5LOXz8ZRX4RX5Wjs+hxKRp99vmaKzUp8+igYBP06XPGl/ViWIF3h
         kjOw==
X-Gm-Message-State: AC+VfDxq2gO12675elkKW5VEO6e6HZXtYTAZzoWtiYWtUslH5LQRWlyT
	boQX1HO3EdYxbe/mgHp6UPkqm1ULoWQ5cvPVrP4=
X-Google-Smtp-Source: ACHHUZ5mlaw+6Q1Mfvuvm5lPBelr5vDpWjQArkDRd8Zpasdjk753MNPBVepX9fCMjP+qCPVIXaR4/Q==
X-Received: by 2002:a17:902:ed54:b0:1ac:8ee4:5e1b with SMTP id y20-20020a170902ed5400b001ac8ee45e1bmr875694plb.14.1685068174982;
        Thu, 25 May 2023 19:29:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/21] llvm: backport a fix for build with gcc-13
Date: Thu, 25 May 2023 16:28:55 -1000
Message-Id: <3382759cb6c5cee42151e72fd94e99a3060317f5.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181739

From: Martin Jansa <martin.jansa@gmail.com>

* needed for llvm-native on hosts with gcc-13

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-missing-cstdint-header-to-Signals.h.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch
new file mode 100644
index 0000000000..fdb6307ab5
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch
@@ -0,0 +1,31 @@
+From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 23 May 2022 08:03:23 +0100
+Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
+
+Without the change llvm build fails on this week's gcc-13 snapshot as:
+
+    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
+    In file included from llvm/lib/Support/Signals.cpp:14:
+    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
+      119 |   void CleanupOnSignal(uintptr_t Context);
+          |        ^~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f7f5f3f3435b48a1983]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ llvm/include/llvm/Support/Signals.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/llvm/Support/Signals.h
+index 44f5a750ff5c..937e0572d4a7 100644
+--- a/llvm/include/llvm/Support/Signals.h
++++ b/llvm/include/llvm/Support/Signals.h
+@@ -14,6 +14,7 @@
+ #ifndef LLVM_SUPPORT_SIGNALS_H
+ #define LLVM_SUPPORT_SIGNALS_H
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace llvm {
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 9400bf0821..cedbfb138e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


