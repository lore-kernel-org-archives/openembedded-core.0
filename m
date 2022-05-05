Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9409AC4167E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7362.1651727167119103190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELBp6IwC;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id d6so3888861ede.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXYwW7xkwoOa9cJMaPYAa8WPUbFzGSxVLzD6zBTTVCk=;
        b=ELBp6IwC/v17WaXBttsp3weTTk6l1QxGfbSMX47mEAhUYlf32+Cd4p/HL0vBFn/k8S
         oLL93qgrI2gAKaC7GLx19pWGohceAStCyW8ArZgliRqO0CBICIBojmouYlBQZhoWVjDm
         uW9hHk/GB3+841JYTusLIcfEMNQ8UqkaaZtV+wdBFVIWDTy/P1TOiTvKGNRX7eFoEZDr
         q2CGQ77kLgCVhQQEe1lat6thVfNK6xu9f6mTJz8P3Lfeppa0pPxWUJ4xfW+kSZpzACzy
         FqVNuiTNTXJuWUPIOTzQxhsINbl29mdviTq8JuvLQFYMGzrBqP1Y+xbS/X0YurO7i+KL
         jNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXYwW7xkwoOa9cJMaPYAa8WPUbFzGSxVLzD6zBTTVCk=;
        b=R/LjKXcHhPXUWaXmoI1N3tdIPso1ctjfcENxO2NxttmBszTfXP5Y6Sc/+bgln7G0sg
         HY5w7QCkHh9r9fIRxDEMokAvylbYqIOKP5RSBWuwKPJGjpG4N5fA9QphZZt5kMfv8rY4
         K2CfXHXexsaMqSu9rEsT91ClpgmFtXJOLQ2FBq0ay9YsxUODRXdd6ConUG5/t1QEkZRV
         vPXYbisBPja7DatPh5rC45kWrTRg96NI6YyWnnyu74zZVuRAs6NaOicY2q5ZiDty7C4K
         nPlg+FLIXXHxygVakcAOrytBMMH3VXkmcxQBs2i7LEcHgxn5BG5U1wstZi+7GkmjStAS
         2C6Q==
X-Gm-Message-State: AOAM5304b2XSADGS2Cp5Tkb/toCpJ1nTEdQLBMDDgSqYDUtqFFwKBt/8
	vPsGzHMt2Ira3GC98cG1sllFImkA13Q=
X-Google-Smtp-Source: 
 ABdhPJwJFrY/mxoNdh9TnVeQ7PCGnJMzHwzJp1MaXLsqt/ICmV1r9ypa28EVY+52WXknM5bxAbcJag==
X-Received: by 2002:a05:6402:35d3:b0:427:b3c7:f7f2 with SMTP id
 z19-20020a05640235d300b00427b3c7f7f2mr23281101edc.152.1651727165706;
        Wed, 04 May 2022 22:06:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/61] libmnl: upgrade 1.0.4 -> 1.0.5
Date: Thu,  5 May 2022 07:05:07 +0200
Message-Id: <20220505050544.651895-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165253

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libmnl/{libmnl_1.0.4.bb => libmnl_1.0.5.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libmnl/{libmnl_1.0.4.bb => libmnl_1.0.5.bb} (79%)

diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
similarity index 79%
rename from meta/recipes-extended/libmnl/libmnl_1.0.4.bb
rename to meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 4dbd9c2450..3c5bde3319 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -7,8 +7,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
-SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
+SRC_URI[tar.sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
 
-- 
2.30.2


