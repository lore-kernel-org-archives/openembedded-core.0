Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74BBC32796
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.461.1660894080054950175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j7Ct3U5a;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ba1so4174521wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5V8xykG6tbl1KbBxOG2vzTg+m6XD4S8kRZY5wplqMN0=;
        b=j7Ct3U5a7JmjvdByv8eSjgKU8QKdvj+0zRhFtGZy2kUkDXO8ACEfsdmQMVb8nc62HQ
         53VFiwUBWiPPV1sLDEyU7CFiGKif3vt1wyLRCltjtKXa4s+SsQkSU1462x7hjnMh5/77
         v1RVrcS5ccVxTtN5M3hiMSIa9/0VnmSyO+sUqS9D5CMiVcRXjf+2dm8GvBvEH8UzE7ar
         2tauoGRUkonfaWB6V/Z03JUWGnHYmRkREzr58Lgb6f2ukjABQBNzgaz+zdarMUv60jfB
         ABLxN27qOIHb1/6mVLs3hyudhL8CYaKql2Uv0nglxt0cgSDIpezyBsthGLqDXUKWRjC0
         pJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5V8xykG6tbl1KbBxOG2vzTg+m6XD4S8kRZY5wplqMN0=;
        b=6mYulGVPw0sRu8dhl6c9I/PaXpMGzOpbmKwWSKKPys5Hmxo03e4dHxh2XRLnbTBpQp
         Nw4XVnTCLgLMX0jQItXFo43D3TtfX0RDbQZXprelcxqV19vjxyIBiSj5Npm81/Fqa8ym
         h3ktixDuv+0s6aWZeOWek1j0ExG9GRaHkko1aSZHKCqgb5tVQNN/BZqo5tCmVV2DQLJv
         vuZhpFoiMJO0Q/xm4ZhyReeOdqEQntTZxTglk/GqBq8GBdhPJExwJ2KmgOpxtrk1JgQI
         HauptCuduzRScoWpXq3uFGWeJDZAh/PQuNXDNf/lq1ekdRpHCAFTrEDgDAPqsPaL1Qot
         THgw==
X-Gm-Message-State: ACgBeo07eUCxcfKOXIA+8L+usCqR5+GJdI8oaX1rV2LnVVDqgNUZfRX6
	keTjw2FomTOuVVywcY9wPXTPRQxbduw=
X-Google-Smtp-Source: 
 AA6agR5QcPi7o3dxTo106FyiSLzP8xWcIejDVVbQUvrBThJxsTZSCG8wx+BDIe6AfFWZncYsi/g4YA==
X-Received: by 2002:a5d:64ae:0:b0:220:6c4c:5a60 with SMTP id
 m14-20020a5d64ae000000b002206c4c5a60mr3442279wrp.636.1660894078577;
        Fri, 19 Aug 2022 00:27:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/42] glib-networking: upgrade 2.72.1 -> 2.72.2
Date: Fri, 19 Aug 2022 09:27:00 +0200
Message-Id: <20220819072727.2236928-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169586

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
index 41f18d1c48..746d1bc39c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "6fc1bedc8062484dc8a0204965995ef2367c3db5c934058ff1607e5a24d95a74"
+SRC_URI[archive.sha256sum] = "cd2a084c7bb91d78e849fb55d40e472f6d8f6862cddc9f12c39149359ba18268"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.30.2


