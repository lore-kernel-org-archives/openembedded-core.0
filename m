Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B8C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:24 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2255.1643826503556089123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nw3bpvVX;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d10so198722eje.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LpDDaLUhlkyyoBJS+7e4HCRTS3ZL4QH9sC0Qq9do19g=;
        b=Nw3bpvVX9BsJuypFWxQLRgS9Lo0SjStpoWFZfYFq8nwC0xIjh/hRNNPmN7XSjMGlPg
         AfXNASZ+TM8NhEnyJGtrNPLziysTg1T4/qhVmh5IJ/Adw7Vu1M47C9/4wRS7K9g0FfXH
         I7WPQJBleB4bamRBKt2M8NUPIizqSA0xR2oltQmUd3a2r5EOQZnYyOuvO74LlUkEiVtX
         tlqkM0P78d1D/VKRcBwXK0PGXRzKpGOt1kshiZwegQ/FZEGA0vIJtturImfCQzF3yD12
         ZC9FMZZe+1P1/UfCSas9l5vEJaHTXOAcqi5LEF4CAg5UxMBno36YkSytLRfoS6XL84hH
         GwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LpDDaLUhlkyyoBJS+7e4HCRTS3ZL4QH9sC0Qq9do19g=;
        b=K7murdogrbSDntj2BIUx6s0RubjQTuGoJpSRZGsi1RBsI+xaLUy9eRG9U7K1y/GMh0
         H9vXkJj5dWtAFsRaD7aa4ujDAD7mKWQHugcrgrDfXHpZYB/JAlcfAP76cOrV0SH5uu9K
         uJ5suIUPm5uYwQfTcM0oWHOo6aIHyeHPa+yvjcCfSH50LKr35SUES7anz4ml6Hidc2Pk
         WjXTMgNysCz6UYDw+EeDv9G6nxlUQItSKnAyElzEtfiaDqG9AreVt1lV7MKu+VdnPOeO
         GW9zgrLSA6jptkBpNYJ5Tei+u1y3aYqb90JEo6PhUsuedVINZBeJC2OrTW78tATm1RFL
         04vw==
X-Gm-Message-State: AOAM532Nq/msPEz6CCpMbcVtARnpdlnrrJC+cmSt2Yx2+vc894fRqkQU
	/5yvnI9VOLJRYofTElh8RXA9Fm88/6w=
X-Google-Smtp-Source: 
 ABdhPJxxL/uuw5WVOuwVPh3aICdhOSMy/jWMvlPiyZwqHml6DjI4PHAW170GQlvBZwLbgO9Veij6mw==
X-Received: by 2002:a17:907:6e09:: with SMTP id
 sd9mr23033161ejc.259.1643826502141;
        Wed, 02 Feb 2022 10:28:22 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/33] cups: upgrade 2.4.0 -> 2.4.1
Date: Wed,  2 Feb 2022 19:27:47 +0100
Message-Id: <20220202182758.919991-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161247

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/cups/{cups_2.4.0.bb => cups_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.0.bb => cups_2.4.1.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.0.bb b/meta/recipes-extended/cups/cups_2.4.1.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.0.bb
rename to meta/recipes-extended/cups/cups_2.4.1.bb
index 42be34c4f3..27c88f82c7 100644
--- a/meta/recipes-extended/cups/cups_2.4.0.bb
+++ b/meta/recipes-extended/cups/cups_2.4.1.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de"
+SRC_URI[sha256sum] = "c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178"
-- 
2.20.1


