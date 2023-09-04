Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42757C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:49:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.44315.1693817385617970807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d5YoR32m;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so11360475e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693817384; x=1694422184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Awx1Sqmn0ChHk7fkXyW+DR6idhsPMsE0kWEu0rR/rg4=;
        b=d5YoR32mI3ioCZRJm1ARQzSHE6KHcertGsU8tqYSPfEpctB0FnB9qy6m5180ZwUYaI
         W2BEnAxAhMee/B0WNvoS4mBLDdPbL9i0HMY4/XVbwpbKpOxfHcWA0ycWY79UtH6HRXhW
         2tz2xNp/4l0XtmjsPTeeu81KNCcWyMbJeaDWZZSy9NV4m25UUUsyshIwdnCUyYlN6mXS
         x9pVZXwkJ4/6DB5msB6xUCbRI/VceGjhSJhqp+BDY8Y0IhZ4mJ9H+izajdyfQd/7I4UV
         5NE4gmLL3jlNgIfeh8QwIbPYdic+RYKqKOyuRGU5n7ZByLQl80ACKqtBk800wtasZeOG
         9bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817384; x=1694422184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Awx1Sqmn0ChHk7fkXyW+DR6idhsPMsE0kWEu0rR/rg4=;
        b=LJo/BwLkzuSVeic4n/bPQge6zwJN8TLhjy0DrrCY1MQef7qRWCbuPwIaX3uWym7sZg
         yjIH1ciBp7Mfc8c9eYQxeEFEcZSMtc3k25WYf0pc3Sk1BhsnhvFbditXbHPnL6/WdGUZ
         kaAAOAgKkBDuPrWYKnv1f7kv+PNQP+0G2GWHmbFwxVGkM8RARZYlKukojWIk+RZi7HTt
         iYhFZoB2WoT0UBQtPuYEyudNAt5lEWmPGLCjzhOnNeHULxKo6rCRMWZmdzVZy2mHp7kR
         3c38CzmMFgS24CKWawALxGxluzYsbnx7+EeMLnc7PPvgxs4iOsbrx5SYaef+n8sFBGhX
         aMlg==
X-Gm-Message-State: AOJu0YyaO0cXMzRgA7lwrWwHdjGBDmePPSZuWnaAS70Etqvsgqr8irv0
	bcvN2Gmph8ZCp9FX4UoTqkWh+hUT8oHIKQ==
X-Google-Smtp-Source: AGHT+IGZsCYU26HWVnOleVvQzPlWoyGtxe/lE0yKpDlR2hdnHq9rpg+p1gpNwAm8Pf6/M8Zil0Rvww==
X-Received: by 2002:a05:600c:11c8:b0:401:d2cb:e6f3 with SMTP id b8-20020a05600c11c800b00401d2cbe6f3mr6999654wmi.1.1693817383640;
        Mon, 04 Sep 2023 01:49:43 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f7-20020a1c6a07000000b003fe407ca05bsm16482190wmc.37.2023.09.04.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:49:43 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] ghostscript: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 10:49:37 +0200
Message-Id: <20230904084937.4135164-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187167

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index 0ddf708f93..e149efe0f9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -56,6 +56,14 @@ prune_sources() {
 }
 do_unpack[postfuncs] += "prune_sources"
 
+do_configure:prepend () {
+    if ! [ "${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}" ]; then
+        # unset the neon-specific variables if no neon available
+        sed -i 's/HAVE_NEON=".*"/HAVE_NEON=""/g' ${S}/configure.ac
+        sed -i 's/TESS_NEON=".*"/TESS_NEON=""/g' ${S}/configure.ac
+    fi
+}
+
 do_install:append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/Resource ${D}${datadir}/ghostscript/${PV}/
-- 
2.34.1


