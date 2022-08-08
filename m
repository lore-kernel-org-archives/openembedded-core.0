Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BB2C25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.22276.1659940975209834636
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=em1TZkmR;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gb36so14772060ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oh+vinziCULFIAYSY2X7oZd0y0nnr4iUONRUUGKxBpY=;
        b=em1TZkmRvrMjMhQ6/oMZdkzIr4lrQe9mkiFgt9KpvWHI348InDHJTakRXGYgT2pHkB
         RNAiLoKiY6z+eJ08ruyrV/YCvZrNmCkYEYnQEEHYKepJoNL3SasnbTlYS9c0s0oGCbIq
         YsNYK8EaFbt+wOHK2YootLqwtoNSnJO36fpkosUBwHsis6hgXtyf5QldaR2hwhvebAtM
         ND2aE6r2cObHosYUu63m23nCcS9igTlqm1+n3/Ui9XhjUqG7QAFlQ1Jw27PdR89jH3zd
         +touVZS/pTC+Zx6p1jIMG/q4EAPTfGG6gt0RrKjbegUc9I1RQUasd5TpNIjfAiq34BBx
         OjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oh+vinziCULFIAYSY2X7oZd0y0nnr4iUONRUUGKxBpY=;
        b=WsY/S03hQze1uo4e7IsoQmtu8f0yXRMW/Rp7mD5yVT2zyYOazA/r+qW9B3idejelBL
         rh18b0wyJL8eUcpscnYsCjqLWwQmW9bCGY3sxbtxecEmO1OdWSnMplvt972AIZQw/Wwx
         u/po/iwMTRAK304IbLE/jWk8G92Jtwi6gly4iiGqzZ8Bqep1m8GSGmMEvpMm+2VE4bzM
         lXX+resrmPG18+75tSPRZYre2FQVLyGgl3vwm+bsIlQE1D2lB2HiA8Ki0rMbA9mOzdjs
         wjHyldfesq9sFHplIqDkkPLMoAx3U7A/utSfUlFNGX0iDOjbx3cQJMa5sm9FF6uu5Kqz
         vK7w==
X-Gm-Message-State: ACgBeo2m6tj9YGdy5G5kJUEoaF8aenSj2lAWc3lVh17WSFERPCKwyUyh
	+Q0SwhRkkukywcSr6nzBHDbIu2uuTcI=
X-Google-Smtp-Source: 
 AA6agR41fNtPb4WgojreR2XLjpl9pMYSnTYZFHaosAQ0DBD6HAauzytyBlfN9uqKuNJ1klyUFxSb4Q==
X-Received: by 2002:a17:906:5a6a:b0:730:bc8a:57dd with SMTP id
 my42-20020a1709065a6a00b00730bc8a57ddmr12433100ejc.301.1659940973789;
        Sun, 07 Aug 2022 23:42:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 14/44] libwpe: upgrade 1.12.0 -> 1.12.2
Date: Mon,  8 Aug 2022 08:42:07 +0200
Message-Id: <20220808064237.3975347-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169039

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ure-due-to-libc-using-libc-functions.patch | 42 +++++++++++++++++++
 .../{libwpe_1.12.0.bb => libwpe_1.12.2.bb}    |  6 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.0.bb => libwpe_1.12.2.bb} (72%)

diff --git a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
new file mode 100644
index 0000000000..6d27b4835d
--- /dev/null
+++ b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
@@ -0,0 +1,42 @@
+From ccf8a58c3536ca0e62748e0ea477514e14d821bc Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 4 Aug 2022 12:19:05 +0300
+Subject: [PATCH] Fix build failure due to libc++ using libc functions
+
+Include the "alloc-private.h" header after the C++ standard library
+headers. This sidesteps build failures caused by implementations of
+std::map and std::string which use libc memory allocation functions
+in expanded templates after they have been marked with the "poison"
+pragma.
+
+Fixes #115
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/pasteboard-generic.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/pasteboard-generic.cpp b/src/pasteboard-generic.cpp
+index 86fe4ee..a357027 100644
+--- a/src/pasteboard-generic.cpp
++++ b/src/pasteboard-generic.cpp
+@@ -26,12 +26,15 @@
+ 
+ #include "pasteboard-private.h"
+ 
+-#include "alloc-private.h"
+-#include <cstdlib>
+-#include <cstring>
+ #include <map>
+ #include <string>
+ 
++// We need to include this header last, in order to avoid template expansions
++// from the C++ standard library happening after it forbids usage of the libc
++// memory functions.
++#include "alloc-private.h"
++#include <cstring>
++
+ namespace Generic {
+ using Pasteboard = std::map<std::string, std::string>;
+ }
diff --git a/meta/recipes-sato/webkit/libwpe_1.12.0.bb b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
similarity index 72%
rename from meta/recipes-sato/webkit/libwpe_1.12.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.12.2.bb
index ac4ee3eb23..e23a9ac32d 100644
--- a/meta/recipes-sato/webkit/libwpe_1.12.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
@@ -10,8 +10,10 @@ inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch \
+           "
+SRC_URI[sha256sum] = "4ac4fd0a8b562b721bffd0f46ae9f06c2b5a3114407581978be875a9d651642a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.30.2


