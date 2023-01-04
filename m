Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3D6C54EF1
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9369.1672830383650624393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XY1YSBvK;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id h16so32518065wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WxHbVGlllkN13h65EXPiij7v17vC5gKbjCtpw2CwlE=;
        b=XY1YSBvKch0xv4ow1vPrQt2YLFNYPnNNn3RBjZhZEWzG5Y+LL/8QiDmmkVhd2UTjSK
         mtbt21sksK76qHIWaQSOPLEpGYMEfhil/NDelSsBmSPtdMLhSGgvQbSXHx4xpByLRJRN
         qVqzhgNLlt5FGmnoQr5w3VbM/lnMSiPpZ357/dVVTvGlI9C/uoG+3jPikcHt3Qkp94gl
         OnCgTqBERkNMsMRvtkwEC45svfJP+G7ceIDabLBJuE9qXhmLjvzYCiORMJfIRY3XJDJQ
         9Pmdgu0P3EPO+txGwdg16aYp85f7msTxr3tTR+U1kbDRtAtGIXjcovZlx8rD2WI0e+6o
         MQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WxHbVGlllkN13h65EXPiij7v17vC5gKbjCtpw2CwlE=;
        b=ZswLLDDGlccluvCxdPKUD5w3j+8HBbSNsy1C5nAVRPipemz4t+Dt3vHeL4taGXspBL
         PJ0hwLIoE/Ua3cZ0Vmb3QWyEs8Jk8u5TsbFaEdNeTnXwzYihg8c5mzN14U2oRYy8/BJo
         EbMM9u5/1YBeRmj+fbswQjAco3iOCqeSUd/dTvRFphXMta0z7QpPbf20wWRYpX5WoMiF
         XoetGTow7EQ5gGf7m0hhqH4KoZjkKQHndJTsD5TpgwK/gcPY3hBj43OLxiV6o9vKwWEp
         xkTQaZ7lyZBuLHpSTVpVLi/2cLWmylckUa2jzizrlRP5fBp1oIOZlKrcV2QI/0jHuBf4
         GJHg==
X-Gm-Message-State: AFqh2kqaPHbDLxEgM2Pq1rHV2fAz3NLAA7DE2cXiUWz6h71wyAEbt8YE
	Kyuw+u+Wkhf6NBdOQSn7WjO0vKogNjk=
X-Google-Smtp-Source: AMrXdXudcimGaptW5f6JyoxIEboHHHV5LNP6hRxY9zc/WLg2s5OwsXpUJF5O8qToG63dm7VwIh3mcg==
X-Received: by 2002:a5d:554e:0:b0:271:fbdb:73d2 with SMTP id g14-20020a5d554e000000b00271fbdb73d2mr26016775wrw.12.1672830382142;
        Wed, 04 Jan 2023 03:06:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/77] libpsl: upgrade 0.21.1 -> 0.21.2
Date: Wed,  4 Jan 2023 12:05:10 +0100
Message-Id: <20230104110548.2537259-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175425

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpsl/{libpsl_0.21.1.bb => libpsl_0.21.2.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.21.1.bb => libpsl_0.21.2.bb} (77%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.1.bb b/meta/recipes-support/libpsl/libpsl_0.21.2.bb
similarity index 77%
rename from meta/recipes-support/libpsl/libpsl_0.21.1.bb
rename to meta/recipes-support/libpsl/libpsl_0.21.2.bb
index 58f56c145e..3bbbc0e521 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.2.bb
@@ -7,12 +7,13 @@ HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
 BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
-                    file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f40ab7fcf5ff18f3ff7f4b0860493fa \
+                    file://COPYING;md5=6f40ab7fcf5ff18f3ff7f4b0860493fa \
+                    "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c"
+SRC_URI[sha256sum] = "e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.30.2


