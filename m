Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D8C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.18096.1660669142447483395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xr5TgOgw;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d16so9731772pll.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d+/5vUN8A3bB4KEM9Q6Y4CFKJndGcBtMYH/jWsewlRA=;
        b=Xr5TgOgwBi5raLM8eLZyAq/zZwO3Ylw/ZEzrbuaEwDfkXYyNik+DQXx5Lt5v2kfeAO
         bP2V6TqW8gh1EFXgGJs/p9Hlk9Zis4zWDZdp5IpmrxU5uc+nv+emu/8zt925k4k7GQdo
         dPPwiezT+sAj8dYt3xbpqGInt62IhTqgifSqap1822Fr4OsGSKduRFL0EoT1dbKbsYzH
         Hxz5Wh9ggR0RJ4SJ7mUHs0nBFw3jMYO8OJLPsobFce7UryfgekFklmCLxEXndb7iuXV0
         s0FgMIMrWQCFAgTNEHzkgISDfd7EfRUwmc1dWwDMeZftwl14TWx2/uQEOZmqVAtan7+U
         fO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d+/5vUN8A3bB4KEM9Q6Y4CFKJndGcBtMYH/jWsewlRA=;
        b=02YXBLnpmp7Ef9AYSCQQ3W5NQZZ3qzSfLj2Cf0hn3NPYodiaopnHEb3/lS7Ww6Bna+
         aJc2RhdiE3IfDbzOurDHgYMVi8SUkyKxY3V2TRh6AYtdTKkjh14hRtWkNLozF8uVu9KI
         zJuHE+4NVh0rFBidtN9DzKf/Oo68jckUrBTet7U3D4QXbwePWOPHqVvt4gY6A0Q7YS/n
         15ZXuM4wJ9dPtcaLwbs3RZ4yIboQYFgtSpt0q8ikr1paPHgb9Nju55AD3tDzaWkGchTw
         ZBoaPetlEQGH8erspHX3OkMgo/UXpx7HRSyee2k4Ke5xvW0JFwrRFkECbqsscJ9o56Ju
         dGcg==
X-Gm-Message-State: ACgBeo0ePqzOjfnbqh9b5+MQ45cFWwMDjVqd04a1MUnET7pv5SamNPNz
	YHU//XD0ohya1pNPLmT6wqdd62WDMQ/nUg==
X-Google-Smtp-Source: 
 AA6agR6DAhv7Ez6u3GF0vY/PRtiFWXsj9MufRxWxdUeFRn3s8ZlTOoeSFR43+Y4uThlP8fF/eYKJ4Q==
X-Received: by 2002:a17:903:40c4:b0:16d:d2a9:43ae with SMTP id
 t4-20020a17090340c400b0016dd2a943aemr22567968pld.57.1660669142735;
        Tue, 16 Aug 2022 09:59:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:59:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/7] rpm: Remove -Wimplicit-function-declaration warnings
Date: Tue, 16 Aug 2022 09:58:53 -0700
Message-Id: <20220816165857.2342796-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169444

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-lib-rpmchroot.h-for-rpmChrootOut.patch | 26 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.17.1.bb       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch b/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch
new file mode 100644
index 00000000000..2e0665853bf
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch
@@ -0,0 +1,26 @@
+From fee6dd39e7223700cc4f7e073924b18409b645b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 22:45:23 -0700
+Subject: [PATCH] rpmscript: Include lib/rpmchroot.h for rpmChrootOut()
+
+This fixes implicit function declarations warning
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2152]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/rpmscript.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 3e3a0027a..6d6d4c507 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -17,7 +17,7 @@
+ #include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+-
++#include "lib/rpmchroot.h" /* rpmChrootOut */
+ #include "debug.h"
+ 
+ struct scriptNextFileFunc_s {
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
index 9b6446f265f..66955ad98ca 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
+           file://0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch \
            "
 
 PE = "1"
-- 
2.37.2


