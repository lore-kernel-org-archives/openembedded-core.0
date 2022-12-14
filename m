Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC19C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 14:29:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.105234.1671028143804671169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 06:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kbl2kL7p;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso10702347wme.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 06:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1UDnvvFTpZ8mrWfUiLF37eRImIspdIcqENdnJJsxmo=;
        b=Kbl2kL7ps/iZOidkujwpc5VQ5ZOf+BDE0YXMy92wLH7skpajrNMBSgm68WwdFvxi9H
         NpQAEKWnG7JQknecQSR6v0zxA1ebGsxlcZ0P+tVNRNUl7g2h9vh8guCa9WgadlalhXy/
         mBO75kWHX+/nyt4Vh+EWNa2ZftvZ6Ba5t+ZYW6a/lqlc/3e2w01g6o34xs5BwVtACLyv
         AhOqhYpa1S58AhwGktO+C8TkyJUwyRL85irWvjcrlu8vIn3n3ONxCrVyiHoBigBbn1/6
         xQAYqXkWos0Tv8gODbtRX9w7IWl++/vLVsjO7MuB48MfgEIXznoxHB3AV7MCbTzOCrZE
         NaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1UDnvvFTpZ8mrWfUiLF37eRImIspdIcqENdnJJsxmo=;
        b=K/yK+JKIw+tbhwsq6UPPas6axq0cTbc8s/1aNOhFBe9EYRIUyNMiWLWUNB3yAX7Vqq
         5kjy9thzQJ0LPbFDODCk9RHXSktEytVRUBlNxI7PfXPJanEEeHVq159Yji9PlInHko/w
         sj2D3TsITRnseSmL8rJAkESoleMCRWozhsjdMDT/AvfoWREbdtyCfh3KSzZHF3x8WU4E
         ZdYUDRbXWaNgE8YghTXRcL/8EoM4DTpgk6lqFrzyRcnYSkF1RVmwXWE++hpsMRL0I1PG
         VSkwrWDhn0ld2sSti4SXApd6b5ZE6kDFrRrMlzi7cMxx3a76P58lEbTwUpkLUiERzrG7
         4KSQ==
X-Gm-Message-State: ANoB5pkpKd1oT8u8eu+RvBLBXQFkRSFqBnM59kHFV/sTol01Hv3K6rsV
	LS3zZvDN3ihpc1d45IjNQTOloZ+2gf0=
X-Google-Smtp-Source: AA0mqf53sv9PWa9cWxTIO6pvDpAMOEvM4vdv0CWpebIYbmON1XZUdeW6L5xqn94Zs9jdE7xJOZZFug==
X-Received: by 2002:a05:600c:35ce:b0:3d1:c8e3:2452 with SMTP id r14-20020a05600c35ce00b003d1c8e32452mr19184958wmq.30.1671028141823;
        Wed, 14 Dec 2022 06:29:01 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id k17-20020a05600c1c9100b003cf71b1f66csm3361470wms.0.2022.12.14.06.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:29:01 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [kirkstone][OE-core][PATCH] efibootmgr: update compilation with musl
Date: Wed, 14 Dec 2022 15:28:54 +0100
Message-Id: <20221214142854.2300854-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 14:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174555

Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
(efivar: add musl libc compatibility) efibootmgr compiles with
musl too. Update the variable to take that into account.

Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 11d8b9061d..be6571b3fa 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -34,6 +34,4 @@ do_install () {
 }
 
 CLEANBROKEN = "1"
-# https://github.com/rhboot/efivar/issues/202
-COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.35.1


