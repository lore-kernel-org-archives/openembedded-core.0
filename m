Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AB8ECAAD8
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.9361.1662016911006783611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kbkca5A9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so822595wme.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HGw0sICbU8msQYmzVE8nV2z/yShSEvLmLfcimsfus3A=;
        b=Kbkca5A9Gu1fRWfDxdnNy+vAM3XiHj5i+5NT0gqqe86bCh/cnXvERVElalqR9mOfDg
         ivXwFlSq6yEdc0oAQy10vCdiHpN509WOEe64fsD+8JB+Lg06Lo1VN/Gyj/Z/qnF0HAwJ
         1e95qnTe4X5mcRPL+uftzpR7OSPCJOHUvhNJ2UQvMHqL5rfdMT0jUPa4+Id37hLLFbmN
         VeuuSLAqGKFJ1C/JXeB2rvmwTzoC84CqtXfSMc2VJkbJnYiBxR+TmK8nFLKxQZAKTJ8K
         7IVe5RKivcMjjEKjh7nZZOxDNIh4sJSyfk7QysIFKp70bCSA5MaKAYuVte1o+ocfZ3Tl
         P7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HGw0sICbU8msQYmzVE8nV2z/yShSEvLmLfcimsfus3A=;
        b=TqYiPzp87khdmMcIITdmNdbaJvy08RZsYgBYEtjALqGNH4jiwbOR2ZrY4s9gAVj+q/
         zS6vBaxHXFKFKh+prw1o80zE9AE4zpUgxM/V2c0QgbzR90FtbzfF8/Y9oFcnc14cHLOX
         WRVPNVNtizHhTQKJbXo3IREt5zr8RZJqmZvDamgWIA7r2Q1Pxik37NZ3x5ZmCQqJFDhT
         LQ3fSVIfnVpI52NTBPtQyT9EYLkUAksDot2KspZBHaXCZGrfpTVdfVPxQS9aE39wwNCC
         UA8xkZn/LuChuFgHJClLe0PRITcQZhVsBuwj3086GQFit4oXi/nxU/xSGvUlnP42vOK+
         0jJw==
X-Gm-Message-State: ACgBeo10d1e7Bw8PB+bPz4phndN5TkAkwFGtcWlQg3OAApODYrxqMbVy
	Umo3Qfyb5/4JKf7TF986dZbLMjH3/zo=
X-Google-Smtp-Source: 
 AA6agR6DGvXsAzwykzOiSJs1tbS3UtqPTZxltwE1c9MUp6vkqG0U6pQTHMKUd3EPiJNBGrDWwE3EfQ==
X-Received: by 2002:a05:600c:1906:b0:3a5:f9e0:fcb6 with SMTP id
 j6-20020a05600c190600b003a5f9e0fcb6mr4369763wmq.157.1662016909494;
        Thu, 01 Sep 2022 00:21:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/14] python3-pip: submit reproducible.patch upstream
Date: Thu,  1 Sep 2022 09:21:24 +0200
Message-Id: <20220901072125.3366367-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170155

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pip/reproducible.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip/reproducible.patch b/meta/recipes-devtools/python/python3-pip/reproducible.patch
index 0ed0c9177f..4742a8352b 100644
--- a/meta/recipes-devtools/python/python3-pip/reproducible.patch
+++ b/meta/recipes-devtools/python/python3-pip/reproducible.patch
@@ -12,7 +12,7 @@ may be something that could be considered by upstream.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/pypa/pip/issues/11424]
 
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
-- 
2.30.2


