Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04CEC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7370.1651727153656394381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L5h8im4M;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id i27so6531171ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q1xvZzV4zpQAgtbmmz9SPuJMQN+aO1AuZ7fBWlEcMNY=;
        b=L5h8im4MZSP37J1oOBKFinlv8pLMYsiChde7QTbZa8Ze4CSSXp8ZKi7XJXCdmiyDYq
         q2CXItErWHBvDV4MeJJP+EqYyhWOFZDpxDEtzPb4HcgBE5FeriWnnzxf4FwiAbL2BocA
         JB1kXMJkF4JkP3pPp5jyV5MCQlejqPvRy8VScjebEQ9NK2BI79KboHPry7CU6nTczdRb
         VxvSj0Zn18vZ/H3OK2Zw65mhUn7owQJJiBRL9u1nZpBL6xXPwIo4+LuLjC5/s8ADDk9z
         13z9t2FclA8ZU+0RWVarhuPTjxfQbnNfDyW40U6EfN2JqECUelWHZCFi8Xjplu+AhH6L
         g5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1xvZzV4zpQAgtbmmz9SPuJMQN+aO1AuZ7fBWlEcMNY=;
        b=HM7VJANUMKvv3bY60LlubumOSik8Euz028FJM4Fki0US68GwDM2kR8bj58k10Dyyfi
         JTSm903BbOGfBvwVXGbhj6B9bejN+Di6l3chFcocjWYWCpdPkNjNaPzBVk1jWvK0kagT
         QbNfi8FQZgC3ivkWDVQ2mYUejL1jUyU50YHBWnWJP1DaNymPyY9yxT0/GTE6Uso14W1y
         +WwRuKZIYrChQkYqfur7NAF9vmdaukrWhExU/LFhWnD5w3vocOL2pPNbDu1Di8q35bUn
         4EBQLWofspFVWtU4793ust7CKLVpJzZi+UT5MsYjuLjEja7m6+4W8/S7JW7iUHJYWVOf
         LUiA==
X-Gm-Message-State: AOAM5337hm9B7kytxgvB5OirCbmzMdOXxoHddKuKm4NzBP9jxsy+OYg+
	YtWLoiWhL7TEBNbMgJXIWR0lWnW+02c=
X-Google-Smtp-Source: 
 ABdhPJwHDoeMjzhvw/9u0cFXr9AKT+apYKkhACwViqHsADFTUK1Ksv7Bxd6yjoyan4a5Ilta3NYqFw==
X-Received: by 2002:a17:907:8a0a:b0:6f4:2467:75ff with SMTP id
 sc10-20020a1709078a0a00b006f4246775ffmr21855842ejc.356.1651727174188;
        Wed, 04 May 2022 22:06:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/61] piglit: upgrade to latest revision
Date: Thu,  5 May 2022 07:05:17 +0200
Message-Id: <20220505050544.651895-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165262

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 436d1b28d3..6635aa3c8e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0d7481136080ffed96a33d31a04547012903ba25"
+SRCREV = "555617f7fb81afa75e3743dec7b7ce7c01dd6c7b"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


