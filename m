Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9DBC54E76
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.176135.1672213058039307802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5FkuTxh;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so10758805wms.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s+FXZ+gPMIC47IYP1SXGBJrVKu2OWw/faZOIWv51gY=;
        b=e5FkuTxhPPe5uUMV6XhyjrDD1tMHPwnLxi4QsTBkrbm9kakqWUD0+/2xtpCH+DV4+t
         Qm3ObyrV3MTBsVcvbkpe/VwjQvfORtg1Oh4EukXtdcT2lzqjYClIb84shOMKrpEvD2zT
         4rAZBwN2w8k/ze6fH6Jv+OZhz3fuLKS1guqrx6+WvQ8QgnGJXAOV73npgDk260NoAlVa
         hhhCKqgpl+fevDaWoTUDh+tO5odmKvEBCEdJ5Rcuc6jF/bYgJiOJDjqjt4Z4N/gXYmAs
         7ghB4oSYnjrDh45ZdqrxEE23Gv34mZYn9OQ9YxuoPVxOb4YnB8/tncs1HG24IEKkTmlS
         7vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s+FXZ+gPMIC47IYP1SXGBJrVKu2OWw/faZOIWv51gY=;
        b=lcwVnmzVu3Nx6KoVB0bW+L602Jcz+QxWuVVFi/+/LEQsJ3Jrk34n1oHBp7m9W7sJuU
         ne8Xs3sgCPTkNLncQ00FUaC8a0pXSAsJGSWkFsivid5rtt4uMR2D6G5eKM0Au7WClT83
         VVlLXlelz47ssLIRlHnUKf3Hb9X1bk9msmuSaEySSvtz65HMO/AFlX/z7b8b4CZq1Ew5
         3y8yjhd+f9XuNhhOy+WQ3N3QDscCvCq+gP+3rjsvw17HNF4x664Hgt+PFme/Cj+KbiA/
         RM3WiSpNwgr2eycd/A1mMBCBhIWEtl4VLp5kViuf0bNSfeMxAWzVj+lQpGuaZw/h4Msx
         1bPA==
X-Gm-Message-State: AFqh2kon0Wowrg4EIcD7Fqphnfa0/QLCA5tI3zLQFBNahVwLSbFJcpuk
	NZVMvkjt44ukbMCZwAYnxf0UwxLphCI=
X-Google-Smtp-Source: AMrXdXtDsWUFbwKzySerSNFlVjcssNZdF/k/ApxVna4FnmTdyc4gBHJTvk74oSdcFY/WbpoMNPwgcQ==
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id u37-20020a05600c4d2500b003d35b7a1791mr22022319wmp.41.1672213055167;
        Tue, 27 Dec 2022 23:37:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/25] xprop: update 1.2.5 -> 1.2.6
Date: Wed, 28 Dec 2022 08:37:05 +0100
Message-Id: <20221228073721.3454255-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175051

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xprop_1.2.5.bb => xprop_1.2.6.bb}                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.5.bb => xprop_1.2.6.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
index b1589a8d75..438a897f1e 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
@@ -14,4 +14,5 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e"
-- 
2.30.2


