Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC28CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.999.1779233428093895874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0F7jIdUn;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b150559bso32055375e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233426; x=1779838226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMV29VW6b84CdmPUx1dcS4TbXLj1HRyAz8Fz3ImjDBc=;
        b=0F7jIdUnMG4B5knlLCF2P7Xle3k0MO+wOmaQQHUjmzVdzO+uJOO0B2FCFCtACmX5wp
         /SkAgZVFLRX4zLOH47/7yb3b2mTT29T09MvTn1md3zEx/A86RqCDjz9263TqMbI6bzpG
         pr0wq0qp2R5LTxSgHZY1oSXPoCDSpdAS6p02w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233426; x=1779838226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMV29VW6b84CdmPUx1dcS4TbXLj1HRyAz8Fz3ImjDBc=;
        b=obENlMjnshcVn31QHQ9B5zMV60+77iSd7x7w6zmYfKOEveuYe0TdBkoSqgELxAibMc
         qPOOiHUBOC+hfSq7LatDe0mN8iL4fY0O2CHt7NGnER+70BaFZAe6qxHz6NVrQsuhpcq7
         X3kSpCbLKRKEFgDrmzkfHlwLeN7K8aW1A2S+/yVJX3BGfcG/LK1T/fa3gbtTBJyeRQqF
         RDnraqrP80BzIf2hoEW8cXC5YdyTjlmLncp9lnpo46pT/el+EECPcSF2bqpwKA+DOp+s
         R88YgWryQG8O3A0L8ThIV4WhuajU3vGdF0/VeQz5Gex0p9Xy1kHMUVjkqJBmwV4lLWe/
         l4Ug==
X-Gm-Message-State: AOJu0YxPlSgNm23bIWlBkYy3Znbg/skFSYnrcq6/nlXdlAvHiU301zYj
	K6JMSnlazmybFEZro8WcXiGYk+kg9ZoX+dcBNQE+iPENv3UFNJcHFfFPbJ+JVO7JKmhyupwwbW6
	yOwCm
X-Gm-Gg: Acq92OEet2G5HJ1Ol6hNGdMmo4pjyQ258XUtoW9Pk0KNGdwqTj7cLQeC2GzEFK7zggr
	FjY9vBD8fc11PCi9xgbhB7qM5Al2+2Ru7DyI0X7fTlJmKzVL3c0WHUUrzEZT4wFR0YHUsXZqh65
	TuH0QQtvoXOGuZG8aWr69bZWMTvnPeBmTwbJgb7YQAldsEtJijWJlRI22AHTir3Yqbh54sryvYO
	cLQ0EnugnF+P1u6OdXNAPy7rEkYsQ3ESIyj+wQg/aFTHxuTgZfX81TCB8FyZgxVCuglyPFFSOGf
	X/R4Mvx0lgUth1i1aKBPBRWtO/zDP/d6/5fSwOD38SGdgJcpbgRuswGTMcF/+Vm2xSaJ0V/2Ppm
	/R9p7ScfIWY7nkgWMZicHlrbrrpWiGBL5CVptI3/S4eiBlV9zt1jpKAWhCShGxEq8YtzQ+JOjLt
	ZSa/Zfyn7ZpGz2h/p5S0M/W6+Ljhnu7pIiwizdz0OgnEW824AjZKJBDOm+FUgxQRrc8DBkuA1sO
	FrdLc5RZwaUN5E0jStdAzKB3fQ=
X-Received: by 2002:a05:600c:3492:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48fe60e79eemr340038615e9.11.1779233426122;
        Tue, 19 May 2026 16:30:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/28] README: Add wrynose subject-prefix to git-send-email suggestion
Date: Wed, 20 May 2026 01:29:38 +0200
Message-ID: <ad63b162322507fa2cf48523c9c73519e03ddacf.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237348

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 4804e436322..15b0fbec976 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -26,7 +26,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='wrynose][PATCH'
 ```
 
 Mailing list:

