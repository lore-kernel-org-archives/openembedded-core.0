Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F691EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.26.1687143356317305745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fdzi2jMo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2304533a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143355; x=1689735355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoavW9Qmieb88P7m7Hl7sXPBcdg5H86uumEr6gwpnAQ=;
        b=fdzi2jMo8QGsc+EYUw4oZkVffE9BjJScNWCA/QBcMhHsdG88mB8w97KAK/HeOIeRrZ
         uuGZwgj1g2UHwKgEuH2qj3XDSl2CuWrqzTBjzNy1Z/1cqhAluvBxznn30UiEUMQL8YbT
         hGcyvY2nTHxm4FcY4Q3WK83gR78W+yKjfCXfgMPatF8nydnH4akUQgALrS6Q/jpLqZDu
         XIvCTEH80dXJTtGqvVK5N/mRwXLvl6FrPIVHHYwwfCONok2AOMfR/2SpuY9T7naDy0WF
         IWZ9hVMB6qKLxZHZrPuAnGMOfeBiiH/jlGHO+rc5EzB9u69ii5JmHcxr05ZxFozwBt/p
         c9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143355; x=1689735355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoavW9Qmieb88P7m7Hl7sXPBcdg5H86uumEr6gwpnAQ=;
        b=CS6SKvYvwlDeRaDEEJ0a2Ax7FduRb2KHWa0qXtcSR8N/l/+ie3Oamn/e1iakgZ0l49
         xRb2/vKBlLM5QqQ3Md3iWqiKC00fADQiGuFnZXWY3FXgEeVcRA9gg42OSa6lkVQHnH7e
         ZrM/KG+zqZf39VUnVyk+RhwgNAGr16d4ppMXSAIqfNIrIRpdMNg/kjanYQ8ouomJnFr4
         3jPGcXnin+LoRjqu/CNvjE0F3E8J1+S4yfPhvfkcb/47X7HPWts8zeKW3b/J14K64Tmp
         xa8PQtHlRZUBmzMNjtByEZNMNDakvfjvvjusZIHJwZ264uMyOlqX/hDUkt1WQEQw6WDl
         t14A==
X-Gm-Message-State: AC+VfDzrcquFak8QeIHEwoqrCRaZvHkb/AjlABztx8w1t8SLsdvxO8JM
	mit42HfGAf1BcSaey82vLHBu3SWcNEKphHYvRCU=
X-Google-Smtp-Source: ACHHUZ67KJ4OktFfkR5meVNOnjAWjkKxB9wJ4yt8EOmAFoscIKzKgUYjiTwVZfkYDh2ZQMrcAv7Zpg==
X-Received: by 2002:a05:6a20:12d1:b0:121:b440:2820 with SMTP id v17-20020a056a2012d100b00121b4402820mr2707518pzg.19.1687143355290;
        Sun, 18 Jun 2023 19:55:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/18] webkitgtk: fix CVE-2022-46700
Date: Sun, 18 Jun 2023 16:55:26 -1000
Message-Id: <da1e7adf33b86cd818a39091043817e21ff8bbbd.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183073

From: Yogita Urade <yogita.urade@windriver.com>

A memory corruption issue was addressed with improved input validation.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing
maliciously crafted web content may lead to arbitrary code execution.

References:
https://support.apple.com/en-us/HT213531
https://bugs.webkit.org/show_bug.cgi?id=247562
https://github.com/WebKit/WebKit/pull/6266

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2022-46700.patch     | 67 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch
new file mode 100644
index 0000000000..242b8337fa
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch
@@ -0,0 +1,67 @@
+From 86fbeb6fcd638e2350b09a43dde355f9830e75da Mon Sep 17 00:00:00 2001
+From: David Degazio <d_degazio@apple.com>
+Date: Tue, 8 Nov 2022 19:54:33 -0800
+Subject: [PATCH] Intl.Locale.prototype.hourCycles leaks empty JSValue to
+ script https://bugs.webkit.org/show_bug.cgi?id=247562 rdar://102031379
+
+Reviewed by Mark Lam.
+
+We currently don't check if IntlLocale::hourCycles returns a null JSArray, which allows it
+to be encoded as an empty JSValue and exposed to user code. This patch throws a TypeError
+when udatpg_open returns a failed status.
+
+* JSTests/stress/intl-locale-invalid-hourCycles.js: Added.
+(main):
+* Source/JavaScriptCore/runtime/IntlLocale.cpp:
+(JSC::IntlLocale::hourCycles):
+
+Canonical link: https://commits.webkit.org/256473@main
+
+CVE:CVE-2022-46700
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/86fbeb6fcd638e2350b09a43dde355f9830e75da]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ JSTests/stress/intl-locale-invalid-hourCycles.js | 12 ++++++++++++
+ Source/JavaScriptCore/runtime/IntlLocale.cpp     |  4 +++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 JSTests/stress/intl-locale-invalid-hourCycles.js
+
+diff --git a/JSTests/stress/intl-locale-invalid-hourCycles.js b/JSTests/stress/intl-locale-invalid-hourCycles.js
+new file mode 100644
+index 000000000000..7b94eb844764
+--- /dev/null
++++ b/JSTests/stress/intl-locale-invalid-hourCycles.js
+@@ -0,0 +1,12 @@
++function main() {
++    const v24 = new Intl.Locale("trimEnd", { 'numberingSystem': "foobar" });
++    let empty = v24.hourCycles;
++    print(empty);
++}
++
++try {
++    main();
++} catch (e) {
++    if (!(e instanceof TypeError))
++        throw e;
++}
+diff --git a/Source/JavaScriptCore/runtime/IntlLocale.cpp b/Source/JavaScriptCore/runtime/IntlLocale.cpp
+index c3c346163a18..bef424727a8a 100644
+--- a/Source/JavaScriptCore/runtime/IntlLocale.cpp
++++ b/Source/JavaScriptCore/runtime/IntlLocale.cpp
+@@ -632,8 +632,10 @@ JSArray* IntlLocale::hourCycles(JSGlobalObject* globalObject)
+
+     UErrorCode status = U_ZERO_ERROR;
+     auto generator = std::unique_ptr<UDateTimePatternGenerator, ICUDeleter<udatpg_close>>(udatpg_open(m_localeID.data(), &status));
+-    if (U_FAILURE(status))
++    if (U_FAILURE(status)) {
++        throwTypeError(globalObject, scope, "invalid locale"_s);
+         return nullptr;
++    }
+
+     // Use "j" skeleton and parse pattern to retrieve the configured hour-cycle information.
+     constexpr const UChar skeleton[] = { 'j', 0 };
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 062f209932..edd64b7b11 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-46691.patch \
            file://CVE-2022-46699.patch \
            file://CVE-2022-42867.patch \
+           file://CVE-2022-46700.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


