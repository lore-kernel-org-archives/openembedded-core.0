Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D222C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2230.1643826512424916226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LVZaH61D;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id p7so349988edc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNVMf0uHPVUGzexkkujMh8dxxMuaCyBBSQLRZl9quro=;
        b=LVZaH61DbGRwIlGE8oMlCJXG7oOXfTEQLNQR+I6tTAwkFNHFormB+cp5/9tCLit0bh
         r+8VxwZwMye0kRAw1sVhDXGTPmbKx7yyyLAGFYTc6jyBLDW2yR5DlX05zJWAWTQBrGRG
         eQkXiNvoxqhmML4tG8LZZGd0NyPU5/kUCqPpivxzcAaK1CBLhtkJM+JpkMplLItBAmbJ
         IWDa3+5W/lJO/H7dN8x8GNzHMnjtB3z1JSjuS75jC0da6eyO8MuAI1231GxQcptcKgRT
         t4wkoHnrMWvbX0QJ3p62tXrsN3FEdBheCPHxTaiXpmiCJAo6HHdF+gARWYhqfSluTn9V
         OwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNVMf0uHPVUGzexkkujMh8dxxMuaCyBBSQLRZl9quro=;
        b=PTEWLlwpBGmgAn8FwdTdFuV30nAsal9AMuFe5kfaXfTmZ98pirl8aC02NxqvBj/CJe
         zhdmOK5czbSLK25MdB86/G7TTpSShZEIHMowrvjgbz/Fo8jTaOstlU3yU+eU9FwFAiro
         EO+R5snNwrFT/cFHMEyh0Imvk6CRPQikTtBA/nCeBZPZ5bzmU+kTi1rdaqDrvPdY7fYp
         LphCg8SlQXpPiC9Gl0gUPIWlr8msU9nhxkPoGOw7EMJ0uIYuxC7ceA2XucrDRQLDiHWf
         gNL9YcHzcsJtJGz4fBpYw6/tuPZ0nBTsTvYYqtZ+aIDiBzMcSKn4JBJ4fDnbTXff+Z5u
         fZrA==
X-Gm-Message-State: AOAM5339K9GckO2h7fkI1i+/Q1D4WMMPKZRUf85L1ZHvpBEs8btNwtPy
	Ump34/B+SM1O7iTHreajQJFcnhwEV0U=
X-Google-Smtp-Source: 
 ABdhPJxRpaU+zMgEMZzjxcJlXn/7swXWa3CSTV2+zJX0olqiu2BwF7+r6fSFu0BpCaUKKImWm1J24w==
X-Received: by 2002:a05:6402:5201:: with SMTP id
 s1mr31412506edd.371.1643826511055;
        Wed, 02 Feb 2022 10:28:31 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/33] libusb1: upgrade 1.0.24 -> 1.0.25
Date: Wed,  2 Feb 2022 19:27:57 +0100
Message-Id: <20220202182758.919991-32-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161257

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libusb/{libusb1_1.0.24.bb => libusb1_1.0.25.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.24.bb => libusb1_1.0.25.bb} (94%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.24.bb b/meta/recipes-support/libusb/libusb1_1.0.25.bb
similarity index 94%
rename from meta/recipes-support/libusb/libusb1_1.0.24.bb
rename to meta/recipes-support/libusb/libusb1_1.0.25.bb
index e70021f4f7..ca812b018e 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.24.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.25.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV
 
 UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
 
-SRC_URI[sha256sum] = "7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a"
+SRC_URI[sha256sum] = "8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.20.1


