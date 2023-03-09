Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14379C742A7
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16019.1678375211681279958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLddl5sJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e13so2225780wro.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWeU7HB5hEmg90S2eo9/IkI1l8R3CMPySxtfR2lfGVs=;
        b=XLddl5sJ3zSjVkNCf3siz2mvtBZIoUha0kiQehaxuVslbbRoeVKa64xUAPtK+MdbmF
         ral0WiZpBqNrnUAuZDycvjxSHQLKXWW+PK97jt1XsUapc6+nzVuHKxS/Eqlmtcc083td
         d+GPfAb264vNdEuOeyaI2GPE8amWUaRyk/zTV2aJ04hAbsa79KYbTUoCrK67VS02gy9e
         iLfJSMG8ToS7Umws23CWaLkxMPQTfRL7BVO7Wdsd2tCh65nQHllGvuOJ8jfh8nHkXW2b
         ZDQY8nffZbi34HcI+4r7R5bF7YTvhPW5hP/m+SyoV+UK5dzxzRtbyEDC9DppF9VbS/US
         v5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWeU7HB5hEmg90S2eo9/IkI1l8R3CMPySxtfR2lfGVs=;
        b=NUY5jLuR12AuWIGNc8YNKUhmgt7mCZ+mDJTSmzhIt9C6rBklNzN+zFGoT0vyLL4R4p
         2BXkTBq5q7TUM9UW+/2KvqnWoZ4U+8OStGRG69DAlbOfd4HlBn/f0nKUImkzpZk6IB5/
         ulM5KcYceCpHcraKwzszwkTttCYL7NYcGoYLw4V22wuUwHraWGgmukbVcoz4Cl93i40i
         8AyT0ZVmZoFWwSRw5cf/5xvDvmQVapWK41VhYBNdvOaWdJkiBGHVokpP+InH2244UNpD
         zUZMb+zwhb8BAp197AOgcD5Wdq6cDA05tgwi67apE4tcn9NR0qVumdaUx+FXSZk1pYsD
         lZlg==
X-Gm-Message-State: AO0yUKUs3qXff4V7JJLmFz8jIVnEo3g/5Im4qaZrHCu+GaF461mfyt5g
	EFQ2ncujcHLZT3B9OBasvgo8BbTlFxo=
X-Google-Smtp-Source: AK7set9yXkWrTUq79zNzjEDjyvkxWGPvBDNNDzmRQCzrDP1l4OVpsx1Ytey1pJmZIK2l4/LZHuibng==
X-Received: by 2002:a5d:6647:0:b0:2c7:e7e:f2c5 with SMTP id f7-20020a5d6647000000b002c70e7ef2c5mr15352779wrw.8.1678375210210;
        Thu, 09 Mar 2023 07:20:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/26] encodings: update 1.0.6 -> 1.0.7
Date: Thu,  9 Mar 2023 16:19:43 +0100
Message-Id: <20230309151958.3619193-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178236

Drop nocompiler.patch as upstream is now using a macro specifically for data-only items:
https://www.spinics.net/lists/xorg/msg60817.html

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-font/encodings/nocompiler.patch      | 42 -------------------
 ...{encodings_1.0.6.bb => encodings_1.0.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.6.bb => encodings_1.0.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
deleted file mode 100644
index 9ee7abe775..0000000000
--- a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0c0790e90a68bf8290da5c0e57142bf7c620f039 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 17 May 2011 23:03:02 +0000
-Subject: [PATCH] Improve handling of 'all' architecture recipes and their
-
-Upstream-Status: Inappropriate [configuration]
-
-XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
-
-XORG_CWARNFLAGS -> AC_PROG_CC_C99
-XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
-XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host
-
-each of which triggers the use of the host compiler. As an "all"
-architecture package, it shouldn't need a compiler (and doesn't).
-
-RP 17/5/2011
-
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b80e3de..80208bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,12 +3,12 @@ AC_INIT([encodings], [1.0.6],
-         [https://gitlab.freedesktop.org/xorg/font/encodings/issues])
- AM_INIT_AUTOMAKE([foreign dist-xz])
- 
--# Require xorg-macros: XORG_DEFAULT_OPTIONS
- m4_ifndef([XORG_MACROS_VERSION],
- 	  [m4_fatal([must install xorg-macros 1.3 or later before running autoconf/autogen])])
- XORG_MACROS_VERSION(1.3)
--XORG_DEFAULT_OPTIONS
--
-+XORG_RELEASE_VERSION
-+XORG_CHANGELOG
-+XORG_INSTALL
- AC_PROG_INSTALL
- 
- # Require X.Org's font util macros 1.2 or later
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.6.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
index be82414eef..5906da416a 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
@@ -11,8 +11,7 @@ PE = "1"
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS:${PN} = ""
 
-SRC_URI += "file://nocompiler.patch"
-SRC_URI[sha256sum] = "77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26"
+SRC_URI[sha256sum] = "3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4"
 
 SRC_URI_EXT = "xz"
 
-- 
2.30.2


