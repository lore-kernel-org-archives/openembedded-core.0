Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED67FC43219
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.3087.1639000812765003912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k028gVQn;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i5so6525008wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7uQHxQcXjtQXnbLlChVPw1Ii7KvOo+497H+eqTRi74=;
        b=k028gVQn5vPODnH/IWFwM9es4jd6CyxndezlFwGpTlEn483k6veMYOtX+aiqtHMZ0n
         YZqCQ0z3iT/k/1z+EkeEdMTraMX2sTYIwLhr8rCFTHkZSaG6pevaCT87/NZIlDhAyMyd
         s4w5XTdfGAWiO7WpZw3Z8vi+7UUTr2ohDPQYqL5ipuxHbxbACfyvwB6W2AyPZjY8oXIf
         aBC0Y+f+z3ZznSYjK4HsyyN8JRfKun4fXgVYFBJ0b0OMSUbBnDYMGBAuGF4tM/fVUm7y
         LOda3n39fIInj3+Sjo5jn+6r7Vjrh0YRKn3C4yULPL60MFaXEVbzvkFqnaa5oYgo2MbQ
         WnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7uQHxQcXjtQXnbLlChVPw1Ii7KvOo+497H+eqTRi74=;
        b=UO44Rba3W6iiX+n+IWf0GXpDStPvGx28pG7a3UuWYrqz3lmlPvYThXnJwne+ghFCc5
         e3FumEWvxF+wJRYZw1MAx1qvFU4cHq2qB7lFug50+2TPZoIQWn4YUetEDnZVMlZjV3jy
         ooamrmo00RQuzKp+AZJFmqrqvnvBBWN6TWITCsxFUZtxrToNSML0lxoUK/Kf8R1PU2VK
         rLxKQad/fim1mxZx9qPLB33iHreXUQMttODsNvpFL9M+R72M4LRTvmKjCKM2iitIiU8a
         wMtPIiQOz7+2n8Vi6o8V7dVfM5FIQAjNkB/J0czjuXBW3xp1JpumpjOyUF+e4/W52Hk2
         qwyg==
X-Gm-Message-State: AOAM531YVHHraBYVA/eEYt77uCoSV8tAxoXaU4Mu6wVY+NkJHeLrRVk2
	pra38r7eFSL47RmEZjd3Efma9l2hyGsw/g==
X-Google-Smtp-Source: 
 ABdhPJwiFzrnCyPA3FBFUWyDQoTZUiFqWKmFXz7x0YbeKs5WzsL70hve24Zkj+vXTG6XUmG1rRnBfg==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr1631369wri.322.1639000811415;
        Wed, 08 Dec 2021 14:00:11 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/29] piglit: upgrade to latest revision
Date: Wed,  8 Dec 2021 22:59:39 +0100
Message-Id: <20211208215947.1979470-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159387

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e9213e09a9..c5f3ecea16 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0ef03f824d1833a853d1a20b4be121089bb9246c"
+SRCREV = "efa64335e22f1af0277f4d4dd7629e8674875490"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


