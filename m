Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8680C41535
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.57318.1671559641120083356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBgJrTlR;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso9476084wmo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLmadIfCOQneY28PsYFKv/FyI+0rwD+tX3CNbqBwmyU=;
        b=ZBgJrTlRWcF1Mmu27rBpQlSkjunx3odd9O5TAL2QDidpkLYpFxoZzeAKZRzTdQVPLP
         iAd3qv7ESURkoLXbB31fPjNlGAFHZ5S5eIeBkVtVwR98UZYNqaHG/+GQK/NaY3sgHUoM
         hey4bhjaPVtHqHKH/l3s87p8DobSsE9SR55/Rp6qDcbX3UOtnC9NEil7AiPFi6i1ovk9
         u4fUFvXMMBogMKnpTe2fqF4bUJndKu7LsNW4Bg8qSzByZO1Fz5SMOFT7M4CV9to4hgdA
         SxSW4CcPNih/SfDH24DAmHLBS+lrEKTf9u2yu+2xf814MCC17yWBepr1AwNvFjmP6pgw
         hTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLmadIfCOQneY28PsYFKv/FyI+0rwD+tX3CNbqBwmyU=;
        b=X3Uerysag3z857jdfO7umEwuFPvUidObWzipHmVBfhkiBYfBKJ31VwaL2xff5foq53
         DcIKAcw6TMj680GDAX/xGaxfA+PxQ8OwOQIHGtuUOA6ngXaQd4cD1R7MQe9+GDm4lyNT
         c+900aSi/Z08/UKPXfz4Z4dDcWK9iYQE4tu0XwAe4UKScaJU7i6LKvLJkWWRJSk1gYtt
         qsPxRoZ3LGdOLMTiAT4UWXTe6nJE/PJjzwm1BiKrvsq6xoyi6AWUBNp0fR9DrGZtaLIH
         BG1s26MQg5dPWak3TW4YbUOjUnrF9NO5X6dm2dLQALphxrT8zjFjqXCmWBHrMW+lZYL6
         OLmA==
X-Gm-Message-State: ANoB5pkMnPz2UzyPPnlcPQQAyS+D4fDDJZOmRBEvhJ4sHNqK+vKzvng5
	IiMaLOWHDAes6c14aFOevTxeQanZtmc=
X-Google-Smtp-Source: AA0mqf6JRKZdOdQXWv4MKoVv4N7L2PVntjkj4NyCI0XIN7E2tVyeJRIogA+TEYeOsAv3lvu8ikE7CQ==
X-Received: by 2002:a05:600c:2d0b:b0:3d2:2d2a:d581 with SMTP id x11-20020a05600c2d0b00b003d22d2ad581mr21816203wmf.30.1671559639382;
        Tue, 20 Dec 2022 10:07:19 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:18 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 07/11] packagegroup-core-sdk: Add SDK toolchain language selection support
Date: Tue, 20 Dec 2022 18:06:08 +0000
Message-Id: <20221220180612.24555-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174868

Use SDK_TOOLCHAIN_LANGS to allow different language support to be
selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index d70aff22c725..0e480e6ac756 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -11,6 +11,11 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+SDK_TOOLCHAIN_LANGS ??= ""
+SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+# libstd-rs doesn't build for mips n32 with compiler constraint errors
+SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
@@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
     less \
     ldd \
     file \
-    tcl"
+    tcl \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+"
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS:arc = ""
-- 
2.39.0


