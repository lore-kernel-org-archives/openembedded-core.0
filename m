Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D0DC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8293.1676011364576996530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VodqQonh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3296186wmb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PVeZGpbBzjMW0pgPBcvZGBuTgf1zb3TOqe0H74QY0Y=;
        b=VodqQonh5Dx5ntjHxfakgUn92RRGOPw6e0t9JPArK+IYX9AAS4NFsJ8oxKpcMrNKRs
         AmKNikb2Tsr3QZctnQbz7sjVhKmn2z7qxLxnX/aYFGaYSszJ/IwMARhE0bqYkAcj8XBl
         YtStL00/sSyTl9CDGj3arAf39odwgGKkf6+UY5fq9UKmAXWWRLrR/H4FqR3IPnu3XV9Z
         WP33G0nPe3Qz7ODZvJxAF0KAvwAkDQbOGAmYaf0KMpKcFVTR5+ODsk8gPAuc1VfEMRSL
         CqNmvdcn4JzD7TjULAtnEywHo3BUcH/nXV9f8fWDjmpjZEcVZt5J/eq/4hGIlcpl3tyE
         37wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PVeZGpbBzjMW0pgPBcvZGBuTgf1zb3TOqe0H74QY0Y=;
        b=nRJdS/77o17xm8n0pcLElvViHIzjXK88x+N0i2u6Q+YO9C4DNOZKnhItPeMB172ocm
         rCYFgD6ISHtVeatMfZehdnkxVMJ6posANWV1ar6T1VVuznzKWHKZlQ04PBiO1aNP80/C
         iO10KjMyQFUJ/SVWLjdnY8jJJgJwQzLA1uvx8ZWV12OcqEmywlc1phiLrGK+1Cxe5SIw
         sdSyId2OU/SRHBXLZEQ88d7UYdmZSvRDD7rZgm1fupjN8b8FBuEHLq3pg+/cWRWnfbsJ
         KwJeM3VQkr5Z4aECyKD66tYyjfeSdg91sdGPyZ7L0I9zq5fJBIpYueWIk+FBZlzroA7s
         r1uw==
X-Gm-Message-State: AO0yUKW7Y0SSZC+TI6P353zJyQuvfTX4bdpmOzSY9IPGSpe8Vgu3/LZ1
	Z1JLoN25nqH0jQAxd4SNdiNA8Yb4vCo=
X-Google-Smtp-Source: AK7set8UmDzOylC/Cd1voGd5DObKn1IilZpPgaxGJYMfyNaUefNQrbSGS2nRh0g74lz0pjwszOuaUg==
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id i4-20020a05600c070400b003dfd8c5ec18mr12313371wmn.13.1676011363154;
        Thu, 09 Feb 2023 22:42:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
Date: Fri, 10 Feb 2023 07:42:14 +0100
Message-Id: <20230210064216.4123807-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176980

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9bc6881fce..fcb5cf6334 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1211"
-SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
+PV .= ".1293"
+SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.30.2


