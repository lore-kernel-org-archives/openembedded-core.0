Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A99AFA374A
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.8229.1667216865687706137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sc3R7xaX;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a14so15589664wru.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/lgv/rMKTQ39t4rxoShtOGTUc66GZsZovaTLNT6cME=;
        b=Sc3R7xaXM4LFbcbff97upchXMgnpMwmFVMqPsMDmqMLerFy3+Mty/vIr8tddxEg2Pu
         uj+RO9D8dJBIZaBWxX45uTTsPM2a1kT5GU1+OSf4gtfJv8wbKflr4LyklxtlDvGP2aQl
         mNiW13mJFDsJikVN6M30+ecf1QOn7Aq7ZRFIrVS7qrqA9FgE4DStz7ToV41idYY9MbDK
         9EKIJpCVNpoLktc+LW/3WoH+SuXrrjtwVyz42oxsSoWCf43z/WUDVUHJe7lL+VjQHOIU
         wsYKd2z2KXSU+FYWUNdsGPnuPP32bsNl9ebGLlMqy9KZvMjzYFxr8NfEHpydGsD8Oqul
         dtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/lgv/rMKTQ39t4rxoShtOGTUc66GZsZovaTLNT6cME=;
        b=QgOPkRyS0dy9QGFuBwFs9XTh1gDRY0SbOs+B0B9gS8mZc0FVXg1skSvHKuAJO5L59K
         xDEWjUc0V1EgNjH6+Ze3zUo82AL6TPixAZGpp0Nivn0sIJB/rlr7r2kwJCwkaIC8edii
         0L0JaeuseXirObCWLN8TY4WUu6pxQoo9edTLE+A33hro0T5lX0/QDP9oAQfWp+uTIfPK
         Se8MMDZeiRzFL6nrE6fP+5w10OC4LJWNAbje2Q/f7t/md28+VT/yoT/LCUc7XE3/Ym8I
         KbD7cOl91WgSBah8Zk8w7YzdpHePo6ilM+sc4KBSGcnu1nxUtY0y3PnONBApvRT4uUAY
         PHZQ==
X-Gm-Message-State: ACrzQf2jUU6e4+43BZXLFvHIM7zlIPxbHQFuYLshoUc8lp9PX8Yaqhvi
	xev0LDFRCsWPza3QvS7UwctHBi1yNAI=
X-Google-Smtp-Source: AMsMyM48o//gx2HjBwK4oQGznkavsa2yNXWAD7jeQTFJIeQMbxvfu2apYiGrnWfqGMFRBZwKrwBgDQ==
X-Received: by 2002:adf:fad2:0:b0:236:5577:eaef with SMTP id a18-20020adffad2000000b002365577eaefmr7889795wrs.293.1667216864207;
        Mon, 31 Oct 2022 04:47:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] kea: submit patch upstream
Date: Mon, 31 Oct 2022 12:47:15 +0100
Message-Id: <20221031114719.2725967-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172311

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 78f475a495..451b409c88 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -12,7 +12,7 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
-- 
2.30.2


