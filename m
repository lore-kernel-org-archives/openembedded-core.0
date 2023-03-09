Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10553C76186
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.16125.1678375211185558952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HM6t0w2e;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e13so2225753wro.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae9+b77lw4soxnlSrsQ5z/FruT7M4ct4LldTnINKFhA=;
        b=HM6t0w2eoMwO5bZ//3H4TukGw/zjgtb3gwqmTzzmTvkcACqyiahf+wlMT+M5tiFSlQ
         pd5qT096RSETQUAj2IrKUa5XF3+95+Eif0Z/vqdWcnShBwjMyfRb1e8qf2cYwrpBP6zE
         aabaZ97gCVMRPHf4fvzo+cwA14m/uNoaUBpZ08zh6FN4wVARJfWNuhW5aUeZ0AHBzqRI
         +k8PvZmfVR2rsrxOxo8/fo/40NcG76pYLW2ztn24w02Y3Lr8EfaLJxbg4jlPie1VtLyA
         JxYp5zi5J2lrVX9l/LoSZy6cVE30OZNsM6lI6mWqq7cmzlZ5X1Fa/zXUyOkf80Apx1/G
         McNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae9+b77lw4soxnlSrsQ5z/FruT7M4ct4LldTnINKFhA=;
        b=MBRG4gf7UD6iCpyfRSPkoS2k/Ug5lS8vJMByMKOhX6EO+tV0EWFMJPAd0daE7GYG0I
         sMrTJo2nuk+y2oWsjs9Snp/5KozSPWzUOSH1eHUQozUZ41AAceajTa6AvtvQDg9IAGZU
         mrkhCzAKpUy2VtD1amaWBkqKVShJ5MVuGDey9gxYDJ7nNk8XeWub9TNOxgi6Q/GqFXrV
         sxwLjnEJMieKWsRJPg0251LmH12JwVfy7Z4N3VqIi7C8WbEFivgSbRxhpmMWcYIvAasu
         LFHp+DLVFPos9LgWiNnUgtrLxB3oSGL3EkuuhXIpHKeMtEjCzTzPF2747fZZRAlsKHRU
         XjSw==
X-Gm-Message-State: AO0yUKX4YQH3Rr943JhUv0QF46P7QKJ1Ll24cs2xkSskZ3uA3885OjR/
	+0nTZRdxO84a15GWe5KWClq/aMaCLG8=
X-Google-Smtp-Source: AK7set8+Q/DT+mVwuUsMF89fk7w6KK8O7LAiQmhzC9Ygve+fVVwvhHz/U/wxIDqYcVmrXdJpueY2+A==
X-Received: by 2002:adf:f048:0:b0:2c7:1757:3a8e with SMTP id t8-20020adff048000000b002c717573a8emr15051236wro.34.1678375209688;
        Thu, 09 Mar 2023 07:20:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/26] util-macros: do not probe into host triplet when checking manpage section names
Date: Thu,  9 Mar 2023 16:19:42 +0100
Message-Id: <20230309151958.3619193-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178235

This does not work for allarch recipes in particular
(config.sub rejects allarch-poky-linux).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n-do-not-run-AC_CANONICAL_HOST-in-ma.patch | 28 +++++++++++++++++++
 .../xorg-util/util-macros_1.20.0.bb           |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch

diff --git a/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch b/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch
new file mode 100644
index 0000000000..e08b586bf0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch
@@ -0,0 +1,28 @@
+From 6afaaf164ab9370204856961a92ad8ee523a8293 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 3 Mar 2023 13:24:58 +0100
+Subject: [PATCH] xorg-macros.m4.in: do not run AC_CANONICAL_HOST in manpage
+ section macro
+
+This doesn't work when building allarch items, as it calls into
+config.sub with the host triplet, and config.sub can't match
+it against any architeture it knows.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ xorg-macros.m4.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/xorg-macros.m4.in b/xorg-macros.m4.in
+index 3b8b8e9..6541236 100644
+--- a/xorg-macros.m4.in
++++ b/xorg-macros.m4.in
+@@ -111,7 +111,6 @@ AC_SUBST(TRADITIONALCPPFLAGS)
+ # Added AC_PROG_SED in version 1.8
+ 
+ AC_DEFUN([XORG_MANPAGE_SECTIONS],[
+-AC_REQUIRE([AC_CANONICAL_HOST])
+ AC_REQUIRE([AC_PROG_SED])
+ 
+ case $host_os in
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
index 60495ad0c8..cd4bc387a2 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42ba50748cb7ccf8739424e5e2072b02"
 
 PE = "1"
 
+SRC_URI += "file://0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch"
+
 SRC_URI[sha256sum] = "8daf36913d551a90fd1013cb078401375dabae021cb4713b9b256a70f00eeb74"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-- 
2.30.2


