Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E11C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:27 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.6415.1637152346005356891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iN7n6k9P;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id w1so10310542edd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jz/0wV9+/ORhjmbPirPzK2Psx99hFxjDy6rDr8HWssk=;
        b=iN7n6k9PQsePnx0iDdVVAMD2Uei+svTOd8nFmagTWV2lw4/NW13oesx5/lPQCZnR18
         O4RUow+4DNAqtCcQR6oxBgcFoyjcBO8qIzSdNPpyksXiEb8/qB8BHARlrIw5GpToUsot
         G1jsyttmYwvYdpIls7yd4k+AljzNX0m0ibeaapnT8L8yg3iQXYAOv4vAmxOF/YYvYfnT
         J8/SKV03WiWCGicyqUZh06IJnK1skcKQtHQR1xbOYWj/06y8/uUU4sloRn7hw4iYU4fA
         BmgbV6LH7A4swzL0G3e/zrbp5ty/yR/Ea6nJBu/uy1C4EihjGjmShgYq52PHiuJO5/mb
         eayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jz/0wV9+/ORhjmbPirPzK2Psx99hFxjDy6rDr8HWssk=;
        b=f3PttapnEsBK4TJ5AgS43BvnL8kUl7nAdib4zcLkNTZVK4IO3EmyHQfw9PvbM/Vg/a
         9qQcx9+jeVsm4a7JhZ1RADRceu7QXYCEcr5JMvKsKM1iw+BnKwF/++gPgzBPyoX9+OQM
         AWg4zkS3UcM9OiJ991+hdcAwQtA8iiJ+YphG4FfxgV0LvauARD+NP6a5DoRxPFx0FHFj
         TEZ2wktgUdlAe8r+WSAMq+skbhsq8Bv6mxAiKgvlcFBHZiziSBw1H0JGt4t3L52JnjPU
         OKDebMLboDioScN9H+iAJPHeCMJhFX0XxXTBwcRsIF7TBWz7T/JeghJ4XrUlODkmU6Cc
         Unog==
X-Gm-Message-State: AOAM531fcjyNVZptM6VXxA2IL3d9pEU0WrUvOQmQj4SZXLdNLhGiffLi
	SmCW0VI+CJmrnMdWEkMggIq3vJZ+VSr8NQ==
X-Google-Smtp-Source: 
 ABdhPJyL/HGmBBDGi5tsIUgODhmdyQBpMVVjnVe+37KVfkSb9bV+7Y+Dxs9IcH3I56TQ+gmHQmymrw==
X-Received: by 2002:a17:907:60ca:: with SMTP id
 hv10mr21024412ejc.500.1637152344292;
        Wed, 17 Nov 2021 04:32:24 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 c7sm10068117ejd.91.2021.11.17.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:23 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 6/8] kbd: add nativesdk
Date: Wed, 17 Nov 2021 12:31:59 +0000
Message-Id: <20211117123201.111905-7-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158390

From: Luca Boccassi <luca.boccassi@microsoft.com>

Required to build systemd tools

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/kbd/kbd_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 7cb45eff77..7efc7af312 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -43,4 +43,4 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


