Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EBECD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:59:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127799.1781524764857950830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W6zdkH4u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso28707395e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781524763; x=1782129563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q403chJvWybxzNJjIF8uDl0osy5d0JJfVkqnA6gqrLs=;
        b=W6zdkH4u8CGcqKyAJMbAXxa8gigTIZY+fuqz/NQoossJRh5jVrbshbrtpRvOOyn4OT
         YsJtdzo+TV03/waKuBhMRrN9PQEJ3wHLb6FkUb4cZvQEFbwDqNBonKBcMDXrdOBqB3zE
         1ZsaW0eEbS5WkfFBa770EupkNW5wRl57jHLeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524763; x=1782129563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q403chJvWybxzNJjIF8uDl0osy5d0JJfVkqnA6gqrLs=;
        b=i/YSl+2/9WkP8QaPLKGutV5765eTr9yjBg63bXG3SHbaaKIx03+OB5lIveNw1TPnLf
         X1cpUzZTB3RWRTzqyZjDCcCf4CWRS6geSaPYKiz9pP/7K3oKFTIAvLsNziYpNlgdcULG
         zydCBd5GJ1PThiLBZWeJqNa07++i4xDLq7Kx52BZgyTKQu6Rd6aO454ybn331BZSXVMd
         BefurAu5sp/FbW70r31clXw6TpMyDyqoDSiqvxy0qu21QgisbuXjM3mTEKIeex2j5v9U
         sN9ASdmgrtU7eouWuuitIYfM/5smO5cbbAYXcEpYItb1MU2hxtJkJEBrwGK32fNfo8bY
         9xdw==
X-Gm-Message-State: AOJu0YyDQN3+UjltpWtD111LAXuni53CLA9DXMDAgy2eEd7W5ELJ/DIk
	W9hGrl8cC3IMzzhRZw9A1Rw2e1eg/cJj2GiD9OT0oqlAo6mqJHOhtMXfhggtoqO7MspVAGCCTDp
	FdS5b
X-Gm-Gg: Acq92OFWJ7gnm4NU9+q5E3jbyL+eYzK0rqRR6pT8SDdVkLm9s4ppj/peEscitJtlc2e
	LEPV8I97Kc8i4JgCdmF3+9OrlfPHJNgpUtJEGIcXgiZgc9CzUdppulnJa9dGzDjhkyYR9NRzp4B
	z9EUMBVJDfXo/8vD0idJqBooHzGMryEl8f6RTq1zDbldeL/EXv0rxpwrEh0TXlzZ66h0SDyTqng
	/nPEKa9FG0aqP5QiCe3lS2MzhVqpA4lBWs9E0VH8mZtLaPLSYIyrb+6tEZIvkOHXhjMiVBgdibP
	/WeiPLvOHwqD+/hzxufjRrIbN5SNnorHiC9Kc/1SABaD7mN7VDUaq42f/U3dKb+tZD2fpe/1tqw
	I6AXTNvEu9JZgfaYvffgvLabv0KCb1zgBqwAQSnQMD5vU0TtSH1h+zK6ySNdVaR5XMSJOhHz/uF
	lUNxr6TYZ32SEwGxe7G2S0bfklf2z7KVxggGIVW/vOziVpGUrGwkbd33oMPo94QKY=
X-Received: by 2002:a05:600c:6692:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-49220061acfmr140639505e9.9.1781524762938;
        Mon, 15 Jun 2026 04:59:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2da:88d9:f720:efe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm273306935e9.3.2026.06.15.04.59.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:59:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-pytest: upgrade 9.0.3 -> 9.1.0
Date: Mon, 15 Jun 2026 12:59:18 +0100
Message-ID: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238838

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pytest_9.0.3.bb => python3-pytest_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.0.3.bb => python3-pytest_9.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.0.3.bb b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.0.3.bb
rename to meta/recipes-devtools/python/python3-pytest_9.1.0.bb
index bec521d3ef1..9180e7bf1fe 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c"
+SRC_URI[sha256sum] = "41dd9148c08072446394cefd3d79701701335a9f4cae69ba92e39f6c7f5c061c"
 
 DEPENDS += "python3-setuptools-scm-native"
 

