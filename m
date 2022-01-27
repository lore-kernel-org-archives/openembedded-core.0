Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81F0C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.26425.1643278827476801357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3TllLck;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id m14so3570391wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TjfCihZMFvh1qLaLtyoN7Ct+9+X96up6fs9MV10gktI=;
        b=D3TllLckG6c15zem6cpPTPs/lStG2tyj6PJKjHrvd2axDueZrO2sN7NSy6lbdR9bnd
         xyMf5WtyrzfFSDF7L6VMKyqhtj56v6Rqp8YJWFx0dkuyC8B/I2knY2TZebqgbqto3q2G
         ZMsk7zaJgEttSLlii0/gsHoca6qwSCPiEwOdJvzcEyJO+B/MTOQHwpsezraaBria5dQ0
         UuZAiFTFS5ukGzWEKLKizibDY2akFIlncE/KxGT61gtn8tnwAP3OJSm4v8vDKnFPCbKI
         d6DRzId5W7B7Uulh4rQiSMdb0XGRkXx4mOLjqLrZdSNm2oTmBnHwtHaegImrw7Xj5yCj
         kyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TjfCihZMFvh1qLaLtyoN7Ct+9+X96up6fs9MV10gktI=;
        b=geZkB2aQJlOA2Au6EGtobaBV5Rl5pf0FRUJuANFU5pU3lrpIot8g1QLD4zbqrB59px
         0mkCpllj5WAKdalgt5g336e8+PSFEO8JjEWiLdXpGNtmcnzCjCW+WlffTP3+9jMzm15s
         BR6NmnkIVEYZa5IghzdB88wzOw+2QwOIAl+cVV81fOndV/nasV6GJxOt2zRAdlRXKUnq
         czSjNijUaeBpXhApLf6/OU5f9riy81NSBvKz3z1si78GeupkHFBwkgnDYiAahojDJVA+
         FU7oJtxNZaHF0zEG0OA8j1Etp7MUgdqQgAAg1/xoqbDpAWJPBpLXja/gllcM2pgV797w
         UfSg==
X-Gm-Message-State: AOAM530EC52V9GadrqXbWeGdcXdRBYELT9oClNcLW6nynPZbApnOh2I9
	TQb6XRI7ohvsZjsbSHIQ/goky9UI37k=
X-Google-Smtp-Source: 
 ABdhPJyXsnGN+qp8hjB3AaoPZy8o8oBGP1P2X7WTU4uwufmmO6Ef4fnYjbwuptqThmf4GqI7lB8VOA==
X-Received: by 2002:adf:e489:: with SMTP id i9mr2392296wrm.107.1643278826083;
        Thu, 27 Jan 2022 02:20:26 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/17] debianutils: upgrade 5.5 -> 5.7
Date: Thu, 27 Jan 2022 11:19:54 +0100
Message-Id: <20220127102005.3050843-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161028

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../debianutils/{debianutils_5.5.bb => debianutils_5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.5.bb => debianutils_5.7.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.5.bb b/meta/recipes-support/debianutils/debianutils_5.7.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.5.bb
rename to meta/recipes-support/debianutils/debianutils_5.7.bb
index 6eea86f6d3..cc61b4394f 100644
--- a/meta/recipes-support/debianutils/debianutils_5.5.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "4c420893485ad07d771c327ef899819d4846408f"
+SRCREV = "de14223e5bffe15e374a441302c528ffc1cbed57"
 
 inherit autotools update-alternatives
 
-- 
2.20.1


