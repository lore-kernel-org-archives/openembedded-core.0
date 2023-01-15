Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB9C67871
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.147210.1673808718549268336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y0n9Mucf;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id o13so23624494pjg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KVr+H2nOvMC9YxQdQk2BOwsmMvtMykaC9C9gTNoGM0=;
        b=Y0n9Mucf40slG+anIlU671WSvGd12qz1e7f/VSMF7RiiLgsQblpQIQT8ijT1RuzjM/
         W8pAkdQbF7FwsAvwjZ3dolnbmgxO3vtc+usyrkMcC0lrn0brQ+Tzu/MY65RR5BpafPNW
         A5kRbPtr6NBXPUS/V7KNA5A2Wwjd8umTi9SVIwSlMFtcfui5Ppv0IbKpvEochCQy47gQ
         t5JT4shNHne2JxShhYxPuT6jKaUlO04if/JBIai7uUHmyNgg3p2EFniI2zEbl8eyVgsX
         6+em92Pw9+11162PyOfdaeH0hh7QptaX3/V6PAe587o2RDEq9KjGYTTGumuwb9rmc1N6
         GxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KVr+H2nOvMC9YxQdQk2BOwsmMvtMykaC9C9gTNoGM0=;
        b=idAtgpyQS/4E1MUolc1mYEIdk1NQ5amzChJfeyXdI9FrtCxWlOfow/5lWVqyFJuCoH
         4BI6loCu5dEmwIbqaGqBzxJtq/lV1mILahWC4NvYL3HHAPrC6wSxU9gbVnyYtPIrjAA8
         BBC7UZCk3+Cdx+Xx/TBed1o6y/J12OdmJZNaKqV3K+31CA9mTWJwAGknzR2l+UAF6ofp
         GC9RF1Jd5C8lO2LKqwT3PuUbwOhaSphGxgufbXoGtpt/k/69J8ZZqxseB7goOEFo4mHa
         G0pk7L4zPdKBlfe+H8yehqGth/toOd+XW/e9b/xlyWqaA90N2RWLNfhqOt+DrvPR+TcM
         Zi1A==
X-Gm-Message-State: AFqh2koMoY8tkUYAUyYMxOJA5HLm4Imc9fmhTEKcMxpcgMDEaVPxbj0C
	YDXtxrX0MLFIe4pAoLwZ6LQ+V3KIRBVjjg==
X-Google-Smtp-Source: AMrXdXvfdSw7W5mrmTUAS7uqo5E4NuYoHCt2I7g2TcDYrA0FaWIuVuvvQcLN1HjeH8/K1CUY0HpW+g==
X-Received: by 2002:a17:902:b613:b0:18f:98bb:c08e with SMTP id b19-20020a170902b61300b0018f98bbc08emr85325478pls.36.1673808717761;
        Sun, 15 Jan 2023 10:51:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] dbus: Use Alignof when using C11 or newer standard
Date: Sun, 15 Jan 2023 10:51:50 -0800
Message-Id: <20230115185153.2277534-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115185153.2277534-1-raj.khem@gmail.com>
References: <20230115185153.2277534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175952

Fixes an UB found with with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...GNOF-using-_Alignof-when-using-C11-o.patch | 42 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.4.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch b/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch
new file mode 100644
index 0000000000..7b4e26f99e
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch
@@ -0,0 +1,42 @@
+From c3e2c873ffa8e89b5f83dccc4e4e35dfcea633cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 12:39:43 -0800
+Subject: [PATCH] Define _DBUS_ALIGNOF using _Alignof when using C11 or newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch changes the implementation of macro
+_DBUS_ALIGNOF to builtin "_Alignof" to avoid undefined behavior.
+
+clang 16+ has started to diagnose this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/389]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dbus/dbus-internals.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dbus/dbus-internals.h b/dbus/dbus-internals.h
+index cc98c92a..2387752d 100644
+--- a/dbus/dbus-internals.h
++++ b/dbus/dbus-internals.h
+@@ -201,8 +201,12 @@ void _dbus_real_assert_not_reached (const char *explanation,
+     ((intptr_t) ((unsigned char*) &((struct_type*) 0)->member))
+ #endif
+ 
++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L && !defined(__cplusplus)
++#define _DBUS_ALIGNOF(type) _Alignof(type)
++#else
+ #define _DBUS_ALIGNOF(type) \
+     (_DBUS_STRUCT_OFFSET (struct { char _1; type _2; }, _2))
++#endif
+ 
+ #if defined(DBUS_DISABLE_CHECKS) || defined(DBUS_DISABLE_ASSERT)
+ /* this is an assert and not an error, but in the typical --disable-checks case (you're trying
+-- 
+2.39.0
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
index 5f91ec2dc1..ee05496203 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
+           file://0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch \
            file://dbus-1.init \
 "
 
-- 
2.39.0


