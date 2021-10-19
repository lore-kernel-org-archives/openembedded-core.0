Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3E8C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.11385.1634657684524118878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p4sCrOxx;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso3634620wms.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYdzR7AVnX8OGLw6GQnlILnxrtm1lZLh9tVl7cnCeww=;
        b=p4sCrOxxOStyYxNA/zWJYzgwawwF2ifgoOejwYgi+ki1/ycj3xiqc+8L/PARIDk0pW
         1PMMiiTdmBENo+3Y2vUAtuP8YSgb2Hb2NjFDB0iJR7BKf8rDEY1RZUqUx5o0ayLSMtgW
         Kjm3wYV4ThcUJhcjZFaIW4N++Xhp+Ib/qlyLzxvatqHjK2vx+5yKPZd3SVx2lOU7rwBV
         ztw5xeHBtawGubktqVq5L6zxmkbcYaQJBOHA4kN9tJClk5EiTxmVq6whb36nOuIQFHCq
         wvA/k62KMim37dSQHaU2aHaY6oStcRtzdymB+3RFT1cWWJHW9S4fum/LPfDnpgt+fFpg
         q3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYdzR7AVnX8OGLw6GQnlILnxrtm1lZLh9tVl7cnCeww=;
        b=iXzT2fUppWmpieM6p20SUfE+1NftQxN/C9TfqcN7sNqqu9XzsGvr7dTTygDihijygI
         VD+AYZSU9mISUQJO9lnNSGBDsefxksB16HI/x33Y4cpVIglg5FkTeWU0bMTgj4YlY1UJ
         lfi0hhLvNnof/V33QTQ5h5xXa/f0egrHBTlnfyMUOvXiMb3qRTzQluogucPRjHYaGsDn
         SkMteBm6EhfnYou9ssTAs2gcndEa2U/mssHz21XSsjl5BwOZgKyIjFgDdMjE+61bMcRc
         6y3To/P30EoxJEZr1KSvT90tqXrPSP0eBaIq3B8TcLAOpk0Af8g8Ny4FrYuXveRcCeox
         2nhQ==
X-Gm-Message-State: AOAM5306R/04B6pS4HhRygzRhVtWEaZd1MQh4LaF1zgqJBM9wWWCcddd
	PGLOGfEcmI29Wuyz4gD3k7hPCZ1Tzws=
X-Google-Smtp-Source: 
 ABdhPJyDrxz7AwppQZM/3uxCIKTdFN9tHra5LGhNtJJT/zo3+RbP3aJLiJjn4u7bWbol+NBZ/VM6kA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr45041250wrb.11.1634657683060;
        Tue, 19 Oct 2021 08:34:43 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/65] sysvinit: upgrade 2.99 -> 3.00
Date: Tue, 19 Oct 2021 17:33:41 +0200
Message-Id: <20211019153419.3319802-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157146

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sysvinit/{sysvinit_2.99.bb => sysvinit_3.00.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/sysvinit/{sysvinit_2.99.bb => sysvinit_3.00.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.99.bb b/meta/recipes-core/sysvinit/sysvinit_3.00.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_2.99.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.00.bb
index 9ba9652f94..264944797d 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.99.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.00.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757"
+SRC_URI[sha256sum] = "ed6bc20adb6735389841e7d3eb8650fa750c76af20bf4ed73b1330a4d4c14017"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.20.1


