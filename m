Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B534C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6613.1635842589187600783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kjbRDUtM;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id b71so3490385wmd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgBzIDH9Kkpjmq5EZLOHoi4KaPPI1zBNtqJYgTYSv5A=;
        b=kjbRDUtMWTyuInGWCxKR7WkYPOOYOcgTt6jfT82x842wBARNBEWXq4yuEX2Zw4UqXv
         ROJxDSVlGdusKhllWoI1JJk7cSz6/6bDVNx+p2OBjCIsQtIXFp0NtT9AdrqIsHMwWNdv
         P/GAoGoo0h5xMJjcf1D9pi05xqTTgJIa80GpSdrFCzMCqEVuvndQsQQCfw9aM4eQjv49
         3FYBCp3WozbLgrLvly6qKoD+JE0Xy3yKfO9j51Q0KQg4K5Gn6J1UfqNKF0NpSRHQuZn/
         AM85NZ2KM2H9W3cfzp2h0uN9stf6Ay9N9i+Zj7CTDGdl/eRgDcVjy3Eh9W7Wnyazzelu
         RlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgBzIDH9Kkpjmq5EZLOHoi4KaPPI1zBNtqJYgTYSv5A=;
        b=nJOEgWTWbUIHEfFU1mdHj67W9QCxAAi43jA7jOLJXE3hNjoo95nqDjnsZu/ugg4EP0
         C7inqKvDVBUf42ZlQMxvTy6lIAa0Ra7Wjbc1398LrRtOrn8muvgYVigUl1t65bQ2Uel/
         9WyySAGcEfFVOGLA2uYk8ZBoP8YelZQnezkNLhFqr5ATVo33J/pD9Thk7pYdaeKCOH7r
         Oaj7W9WxqP3Ii9UPcO2VkjU/ZIcNKD3eyKobXoyMcPOivgeFzz+yTRc61ja0TgFV7dXk
         zrIM8Ywv0So9/HOsWzyiSXHGO5tycq74icr4l+V5PzmfELgXbx7CyfBbMqvP7exgrRKe
         0hXw==
X-Gm-Message-State: AOAM533T2AoQVYNHjJuwgiDpJHc5Do8YqJF5RfdK6/DpUSWcb2CQS7kx
	F0x6mEj/PiabLZlXI6AfCEhUGO12xik=
X-Google-Smtp-Source: 
 ABdhPJzTPCkXFFdjBVWWIiGxPNx/LSGWMktQQ8JIiHEJqMb/f0HpwJvky8PszA3ysKmLKQvb6zQtWg==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr5252117wmq.62.1635842587862;
        Tue, 02 Nov 2021 01:43:07 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/33] psplash: upgrade to latest revision
Date: Tue,  2 Nov 2021 09:42:35 +0100
Message-Id: <20211102084303.2974802-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157743

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 09038266b6..ca5a1ea8e1 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,9 +6,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "fdbd111d6bab2fbbae62a041123fc6b644aa97aa"
+SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
 PV = "0.1+git${SRCPV}"
-PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://psplash-init \
-- 
2.20.1


