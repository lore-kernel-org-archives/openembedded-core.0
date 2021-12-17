Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E1C4332F
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:37:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.7582.1639755423693874465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=UOShx2Ow;
 spf=pass (domain: madison.systems, ip: 209.85.216.53,
 mailfrom: matt@madison.systems)
Received: by mail-pj1-f53.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso3139762pjl.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k9IJU/rrqQCkHBQk7AxhYEI0SP7Kptz7NbDT5rrCMGg=;
        b=UOShx2Owyz8ywqDi867+KS2juXOTV613YSv8kv+ngIcGwSs8feNkykTEo5yRBC/HQM
         flI0wLGnpd7RWuIk7okUIjd1g/JyWQQj2uLyk7251dH7pLT8M0mOCWzQSk4DdQDLMg7J
         Ba+5oi4V+ACYc0bKjhSizcPajmjQpEo9DVVWeVJRIFq5DSHL51TMlD5zJwXe66eRKDlU
         IvbMfhyqxQIVrOiJdo2VICJtG+d+3st/J1urQgCwnxwImV7CQkJ3gvgVaSAWcc8aonZM
         w8MC40ywA2TVe0ljDcjQZEgRuwIHYspa/Wv7977ytA9MIbvH9otveERLbN2AGHVOxftj
         xlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k9IJU/rrqQCkHBQk7AxhYEI0SP7Kptz7NbDT5rrCMGg=;
        b=keGo8JMexwx9EOm5nKNEe8MhHz5E7xUkOLDbVWAuvroIM0sim/2vb2TVqP9SuM/n/p
         HUkZXPxRoMzJanP0h6r+kYaG/mkSwXyq+n3s6EaZO3oIY1kJ/pZoxhYWx9HE1FIt6Psx
         hd2++J8MNTo/Qfxm5AKt5tai2xEDXAjPgch2lKtvPdY6loIIQnkQFkPbIUlgGOxz4Hcv
         H+SkDOLkn4zAMJ8hwLyu0pfC8dCWpAExwMe3Ma8NHK3qCSBKMooCD6czQI7qmuXaml/M
         cSyFb0nFoQouAEfg4Fof8z+5k/RsNKm/ugNlvwcswXcFC3KdrqGuCvcFCmtRxZOF84y3
         z2xg==
X-Gm-Message-State: AOAM530Gs0Ed5qUrZdHJ12POF2VsU59wvHyGl1xAIwpdFoBYL9w3OSwC
	ojqfTG7//11Pdy/rs8Fn/lIwiDLqVAzNmg==
X-Google-Smtp-Source: 
 ABdhPJxTF8RcwWt0suvBm4IH/7MqddR6yMIlv6xDI1uBFTcZodY1/XQ41MxoAtxOgHFqj7H1lAUQag==
X-Received: by 2002:a17:902:6a8a:b0:143:905f:aec7 with SMTP id
 n10-20020a1709026a8a00b00143905faec7mr3681037plk.8.1639755422847;
        Fri, 17 Dec 2021 07:37:02 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 ip5sm8271631pjb.1.2021.12.17.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:37:02 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH 2/4] base.bbclass: add crate to OE_IMPORTS
Date: Fri, 17 Dec 2021 07:36:28 -0800
Message-Id: <20211217153630.1746217-3-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>
References: <20211217153630.1746217-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:37:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159830

to install the crate:// fetch handler.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b709777f24..ee9950f207 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible crate ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
-- 
2.32.0


