Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934B8C6FA9D
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3840.1676835069722976077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BglqkAZd;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id s7-20020a05600c45c700b003dc52fed235so780017wmo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzXYs3inpudCeDjhaC9tsilguWCjjKJcnugGlu5xDZ8=;
        b=BglqkAZduKPX60c58XpxE2mhHnaSt4rAZFFyXbIyHQTtWKQHMfOfkTR3HzsqLPOaBf
         iRUUEKV/rsElQJLZbxgR7NL/d1ty8qcJwzaCeTwj3slwTyhy6dwhCiuUUTb/qt+JUSpB
         BwQydQxGXtQXnJR3U7PBGCzJ5zXysuiYRISKdjQV4P76N3rv13z3PjQH4bMSsGH62z1d
         /U6YpR6sc+I9U/T3KoHYSm2P7J0qafmunSwrIEpHDc8mWNFp5D2bFVOMwh+FXGh1SICd
         A0MWJMZQiYfUWxyySUVjpyPMmq6CHZeLZBTORFFrZd5xrMBMxvi4UuJjqfm6CH0hLrSy
         V1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzXYs3inpudCeDjhaC9tsilguWCjjKJcnugGlu5xDZ8=;
        b=NgV9bwmdRP1SqeGmv0lZNUc1IPGOL3O37pSFWCySKl68pDRzpsnOwlnaRRicc+QYBG
         OV3QE75YrYotuyR6gYT8j312Lhp0q9l6U7UCj7wuyWqbScwB+iCB1ITHiJ/2T5Tk7LeD
         bP3cZ8TVE6hrcZT8M79xFoOWeB71IXvAnwAmh+lHKXD2iTZUWiRcAAIpcyElqaRJmisN
         l3BOdC72mQD9jP7moMEngzaLX53Jybdj10Vgu6yIBn0CPW+pMdrRhekDdXQgmQrjh+AM
         IbS5OHn5gi09Ay1Z1y8gXJAfQpZuTkrljMPMrg/w/4ueG0ojoRzCjIIa4K9Lw0EWF9T/
         NSnA==
X-Gm-Message-State: AO0yUKXbDJVmTiwufoFXdXTqBw6Wz1VK805acn6NvaHtK+FKWVlV2kQl
	uAOlHuG36mH3bNCuU1TNT0gt4PyTLv4=
X-Google-Smtp-Source: AK7set+dDJ4jtCtdgJnlVpxOpUVETMAiP/92k4QO7p6HXxDvDkCgVuBZKuB4l+5hA/9A2LOX6NFBmg==
X-Received: by 2002:a05:600c:a695:b0:3df:f7db:9cdf with SMTP id ip21-20020a05600ca69500b003dff7db9cdfmr5231991wmb.0.1676835082132;
        Sun, 19 Feb 2023 11:31:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/39] dbus: upgrade 1.14.4 -> 1.14.6
Date: Sun, 19 Feb 2023 20:30:48 +0100
Message-Id: <20230219193101.338397-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177369

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...GNOF-using-_Alignof-when-using-C11-o.patch | 42 -------------------
 .../dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb}   |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch
 rename meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch b/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch
deleted file mode 100644
index 7b4e26f99e..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c3e2c873ffa8e89b5f83dccc4e4e35dfcea633cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Jan 2023 12:39:43 -0800
-Subject: [PATCH] Define _DBUS_ALIGNOF using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch changes the implementation of macro
-_DBUS_ALIGNOF to builtin "_Alignof" to avoid undefined behavior.
-
-clang 16+ has started to diagnose this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/389]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dbus/dbus-internals.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/dbus/dbus-internals.h b/dbus/dbus-internals.h
-index cc98c92a..2387752d 100644
---- a/dbus/dbus-internals.h
-+++ b/dbus/dbus-internals.h
-@@ -201,8 +201,12 @@ void _dbus_real_assert_not_reached (const char *explanation,
-     ((intptr_t) ((unsigned char*) &((struct_type*) 0)->member))
- #endif
- 
-+#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L && !defined(__cplusplus)
-+#define _DBUS_ALIGNOF(type) _Alignof(type)
-+#else
- #define _DBUS_ALIGNOF(type) \
-     (_DBUS_STRUCT_OFFSET (struct { char _1; type _2; }, _2))
-+#endif
- 
- #if defined(DBUS_DISABLE_CHECKS) || defined(DBUS_DISABLE_ASSERT)
- /* this is an assert and not an error, but in the typical --disable-checks case (you're trying
--- 
-2.39.0
-
diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.6.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.14.4.bb
rename to meta/recipes-core/dbus/dbus_1.14.6.bb
index ee05496203..a6e18a92cb 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.6.bb
@@ -13,11 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
-           file://0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch \
            file://dbus-1.init \
-"
+           "
 
-SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
+SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.30.2


