Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16426C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.3062.1639000804194844630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nXajAkSP;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 133so2854904wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mP6jbR219+rCHeMFxj4Y4nT8U4icasbEQrKR1dwHIt4=;
        b=nXajAkSPTd8mZI5V5YIUP+CeNNi0bvfvErIIVucmx5/yUejZBtZB8L9LC8QmjJteVL
         azLeoP8DMo3cksUhZCTap+7ceoMFUbBPN3OgsekHSX5ndpIcApnlz5wP7a3GeiXL/Rgp
         PWR51VMIWjQOh3bGKCh4tHPyEvb/DxGrVTqivM5VixShMMrr0bBscbguvanZKjptu2ff
         LcmE+KCjFpWOUXOao5VOmrnq9pIvLe4+ep4FjhVlybfUNPM76Ozy4AIeAEy5hYNSHJj5
         Ir2Ud+rfq8uB2A24bcIWDUqZ/9Pd3gcp0StBI5kJhdb59I40HsJZnLetFuq6DF26Xm+t
         JJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mP6jbR219+rCHeMFxj4Y4nT8U4icasbEQrKR1dwHIt4=;
        b=LekPHcW3Z75GRaRzy2/LCXyInjJvnRDSc+GmHtNIk7qhirdK6cgFrJ2IRtoxTQFFwU
         qxxX+1/ofNYC6UDaFscvrDedf+A2P0cSgO1njlFafaq3DogRMOSWS8LJmU1yegLNhF6/
         OWx3f0r0b+lSU8Mj9/3j/D6MruAyLIiuRn01+u6AEn2hpuxb+aEMH4UiL2S8L4/Kd9V6
         PXpRBeMLzZAqsRStuSd/lkIeNt5H9lAD2DcWM/OnZzifIk9qGl3Vfn3j9IWlrYs/Zd7m
         qefUnnnSKnkevhcITH8nylx+B4tEQDPCRhhvj7C3ihiU+I86hBR+NklybLI1ZjlyH5W+
         uyPw==
X-Gm-Message-State: AOAM531SlLuJewDzKPhSMtWzCwKfzNSi7JfH+UW8BO5ivg7pLgxl65FJ
	JNO1k902+czDPq+89E/6JBq36bG8jtWiCA==
X-Google-Smtp-Source: 
 ABdhPJwp0TIDZ7sydzXJjvU0RbfAxmz7yQOtnZwxmngI+UZwXVaR/J3AI41lS9R7UAAEe/EtYCBuuQ==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr1693086wmr.45.1639000802852;
        Wed, 08 Dec 2021 14:00:02 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/29] ccache: upgrade 4.5 -> 4.5.1
Date: Wed,  8 Dec 2021 22:59:27 +0100
Message-Id: <20211208215947.1979470-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159375

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ccache/{ccache_4.5.bb => ccache_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.5.bb => ccache_4.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.5.bb b/meta/recipes-devtools/ccache/ccache_4.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/ccache/ccache_4.5.bb
rename to meta/recipes-devtools/ccache/ccache_4.5.1.bb
index a98bb43ead..26f808978f 100644
--- a/meta/recipes-devtools/ccache/ccache_4.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.5.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fe0fdfdc7a892516526b86c28d06a16"
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8f1c6495a06ae0a9ff311c9d43096233702a2045c476ca1ae393b434abf1f528"
+SRC_URI[sha256sum] = "f0d3cff5d555d6868f14a7d05696f0370074e475304fd5aa152b98f892364981"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.20.1


