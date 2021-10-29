Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A070C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 23:13:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.12706.1635549203238059556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 16:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIhlkj3J;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r8so6324480wra.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/wKAP3zdwJHQPhsoj4UxTITmsquweHiSMJkFBWghF8=;
        b=FIhlkj3JPPTUs3JRh+fX6ixzxpj0qPwxi39gijeq5WK6aga+oMVgDpZu8wq8Bsgbv/
         amvmAZP3sdxFmsqTN6ZbyqWuSNZbJOmaBppImKRYYdIaiJYzH4k4B5k952c3+pYOA85q
         2RpccJqPJQ7+3T/2xVVPYxCA05NShFgFHTKeXpiRFW9yRKuusfk7sTFmzzkW2HUZgJEu
         w3MtX0qySowGZWYGS6RiuvFdvfooN2/1e1EZ+Odml6nRcJlIBVv5B/5tMFcM/nuMZ0HM
         XNT3VXifMmu3ZfQ4tFhqSyKY624HpoGvHvIbzwxXfE7pSU1heU0g9+bZ6a4JeotkNf0u
         WhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/wKAP3zdwJHQPhsoj4UxTITmsquweHiSMJkFBWghF8=;
        b=isBghAxt0e1j9rSM6Zj809JMwR1yAqADKidYr+iOQgdbk9YeuSH6jEMoodRHoMHcoj
         uSjIEUF5QXKEXWnnM4bmBFal/R6wdWOjbbgrxvPA1edkOvGonq5y19g3CPGwzjqbuH/5
         aJRfadUIe87ckwa0IuNu1BUM990JjrsOErMXBVL2ar6r6si3zqOFKCTtioWnQGNIfH7Z
         EqqNW0mi9pi2vdG+zHQnDWRg4YyNvF3xMzoc6NAgniuiYDu+R/URTwqN1dihBG37rxpg
         h3Jb2QsmXQRidiXXLm7fdSmaItxVyJXk6joVFzWeQZRmCrXm7cYZODh1L6DPDbUS8b+l
         yMMQ==
X-Gm-Message-State: AOAM532j0GGD6hgmdi+THMYwE06jtgve5d0ar6huNHjFzwhulKAR9b83
	6zgFWRkmRLhrRJfv31Kgs+OT1oA0IGQ=
X-Google-Smtp-Source: 
 ABdhPJyoOifxj2R/+OoapLq8SeR+O4XSu6l50V981UhMdrxBKkfZ1wk5wEiLEBL4yZoHt6TkLpl99A==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr22346882wme.13.1635549201247;
        Fri, 29 Oct 2021 16:13:21 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 v7sm6762265wrq.25.2021.10.29.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 16:13:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] sstate.bbclass: add warning for exceptions on
 pstaging_fetch
Date: Sat, 30 Oct 2021 00:13:06 +0100
Message-Id: <20211029231306.16066-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029231306.16066-1-quaresma.jose@gmail.com>
References: <20211029231306.16066-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 23:13:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157643

Notify the user when there are connection issues with the mirror

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 54d38ed42d..32cf3a9fe7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -785,6 +785,8 @@ def pstaging_fetch(sstatefetch, d):
 
         except bb.fetch2.BBFetchException:
             pass
+        except Exception as e:
+            bb.warn("SState: fetching file %s from mirrors '%s': (%s)" % (srcuri, mirrors, e))
 
 pstaging_fetch[vardepsexclude] += "SRCPV"
 
-- 
2.33.1


