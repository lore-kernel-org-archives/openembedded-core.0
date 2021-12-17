Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCC5C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:37:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.7584.1639755425015188118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=K/WseoGq;
 spf=pass (domain: madison.systems, ip: 209.85.216.48,
 mailfrom: matt@madison.systems)
Received: by mail-pj1-f48.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so4474445pjc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DdOaHP0QVS7ch+A9eKvnKV7Ab43oksQzuznCpzzCICI=;
        b=K/WseoGqVqq46mSZGeXICcK7sv8k00oE1fasAsCASNJzrwrlgKhacYK/UycFIhywBc
         JkLGVRPT9CQdcXNmpigitftNxU9WZeGQ7Esr9cFKN1jtWFud989aQoBPBFFftnJv5oFn
         Cu+yBkB/2j/QcwsXMsoi8f3LMNPQiWPWgmeRiUr/NY9uzWO0AzER12kcD7IX57KgKeLY
         KJD8LGYG8sl63u/sJtgbO8xHnmXkfOe05fkDAtajPTxRvY8MIvo2pEoaI1rMAh+3yk/o
         6oTycDdjuqbBmGlZKcNRDeBVxwLyGa85z1dcsm5NSFalqE4fPJMSm3OKf/wHz542ypZu
         D6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DdOaHP0QVS7ch+A9eKvnKV7Ab43oksQzuznCpzzCICI=;
        b=AXtvt2gYk5ZGfneMDJ6/f8Ir405CqBPG5JspkLTWkz6J03Ej1DZhPUvMsK9O8tg8AU
         /Eo063bJcqe3R8/CbRh/KnTUO1MJiI0iQCzhJ4E22GKuvsauddxu3BfwtvorG6JFahik
         RYk3ooQDup9WHQccnJy54B61HLuBYVeb0i1jLSzeTDL56NJ2bo0uCMEaHuArCdQEncNi
         3+dKsFJtLnUXB3ITlc7Npvu/RF8SKxZ1iQYJzON1x7yVgMtggI2Fx2b+CqiHvLxCAUqG
         kJWgpoImDdvMpcNUxguy0T3YVkiepQ6b1Pmyt2lGQgT1nntf9DABh0CFXcwAvGKvlN04
         oHmQ==
X-Gm-Message-State: AOAM531MYWFW8e9fLJ55YOVPqicIO/7Q8z/8SZf8UwjeIPlFu0wn+N3/
	uIvEbY6f4nFZjTCHL77Uh3tRCZ1ab25aDQ==
X-Google-Smtp-Source: 
 ABdhPJzYs4s1FTljvpjZtQWD5jTJWCh7MtZuIbsgnycY6EKuIkNaFglDld6F0OnUmR6wY+4D2RewLg==
X-Received: by 2002:a17:902:7c02:b0:148:a2f7:9d6d with SMTP id
 x2-20020a1709027c0200b00148a2f79d6dmr3979490pll.140.1639755424054;
        Fri, 17 Dec 2021 07:37:04 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 ip5sm8271631pjb.1.2021.12.17.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:37:03 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH 3/4] cargo_common.bbclass: remove inherit of
 crate-fetch
Date: Fri, 17 Dec 2021 07:36:29 -0800
Message-Id: <20211217153630.1746217-4-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>
References: <20211217153630.1746217-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:37:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159831

No longer needed now that the crate fetcher is
installed via OE_IMPORTS.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/cargo_common.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 23d82aa6ab..c403591434 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -8,8 +8,6 @@
 ## is used by cargo.bbclass and Rust
 ##
 
-# add crate fetch support
-inherit crate-fetch
 inherit rust-common
 
 # Where we download our registry and dependencies to
-- 
2.32.0


