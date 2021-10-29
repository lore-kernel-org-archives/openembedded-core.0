Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6FCC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 23:13:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.13010.1635549195629221913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 16:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=II+/SaUx;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id v17so19074279wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 16:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dgDP3tgUDfN/LcAzBp+zTLlh0uSKIDvrzAIaygmMys=;
        b=II+/SaUx+5fCoLePBcxvebGneeUZbsykRNG+GUpT5D3kYq18xJ0RAcXtrprc1+9Jlu
         mmMF9wt4J5ePtccyy5kNKlliGfFGPlyNVazVfKmtXwv+FBg2QD/wOsZKa2uiwBOwqVxg
         w9ZyVL/GipLCcgai/gH8PrlmCpXnhKr8ohcsR5B/49AGANnwncAgH2PQUkAz6dwILxoH
         QcAmg9UiEXGYKi79+OXiWOgAAZB7H6um4g0ZdnTOX7r7c22l8FyVlR3RT60+ydekKP+5
         8DC6RKYNU6+SFZIi4R+1f1EJl1yI8q2z0CCuI8f24H+8Svk9PLccJau6EDfEqSVwtiFL
         dqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dgDP3tgUDfN/LcAzBp+zTLlh0uSKIDvrzAIaygmMys=;
        b=XxRmcsCPpGLsBKwA1++ksGbl5TouBOU1DBvxOlTFaxw8GAlQlIVA6SVlK50VxTu+rK
         RlxhmcMStwx+hmCdO6sUl6N3hxhB4z6qkLCOiHFnS/Cw9ka0ArFnIAoF8aQ+nQbWyVYZ
         Izwkmw1NuyRooLlEP74lZoab+gEN+1BQw3xQtDzzFG+isAI+7YQKH+TAJJW9J2bk5mon
         CcM5T91V8PL4+d7RfpdSEYgwjkLShxpZLmBw13Uf8+tnqJZnXcMvzpxQSMcnT+cS1QCR
         uIiZD0rdbAE0x5ievPnBONv8TzLiL1qAdQGxmP/UudgaS+N4WPVPjGwlmv7v2YCamAtE
         XNDw==
X-Gm-Message-State: AOAM530z8M5AaImndwH9G5ZwGJwrKZGXOHiZS1oWo2g92J9R3S+g0Ngg
	05NnHadCW4cBa3RL2E9W31DSUyKZdto=
X-Google-Smtp-Source: 
 ABdhPJzGHHBpQcSMsSeIDCzEVNkOVfduFQghL8kaKZ8pH4vBN0i7hEtmxJjI1ABG7cD5f+rT33m9kQ==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr17672880wrj.97.1635549193641;
        Fri, 29 Oct 2021 16:13:13 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 v7sm6762265wrq.25.2021.10.29.16.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 16:13:13 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] sstate.bbclass: exceptions on mirror fetcher is not fatal
Date: Sat, 30 Oct 2021 00:13:05 +0100
Message-Id: <20211029231306.16066-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 23:13:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157642

An exceptions in sstate_checkhashes sstate mirror fetcher
is not fatal for the build and it can be a warning.

If we can't check status in the fetcher we can assume that sstate
file don't exist on the mirror and build it from sources, ignoring
the sstate cache.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6e4eb09f8e..54d38ed42d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -995,7 +995,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
             except Exception as e:
-                bb.error("SState: cannot test %s: %s" % (srcuri, e))
+                bb.warn("SState: cannot test file %s from mirrors '%s': (%s)" % (srcuri, mirrors, e))
             if len(tasklist) >= min_tasks:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
-- 
2.33.1


