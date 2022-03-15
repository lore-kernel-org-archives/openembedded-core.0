Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78C6C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:33:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.14138.1647365594268590287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N1cqfB6+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id t11so30106402wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fx/Bw+KQdz7LfGgDGk8ih9nkK9JPobXXI1pMWgbX3fg=;
        b=N1cqfB6+DDY5zWVlJ9jsO1K9VTdBJXtz3c1OJf2LWcOOlmCI3iKVi0gDdSwQprLOx3
         U+e9wn+BxTRZzvmdTRHOU8NeSQMhVBzRagmqB4nRqJ8GbeYSp1WeoQOQwNn45iCzcf/V
         pp5i/qRMPRJ0emaC9IGY8ccbXhVeXzbMxaxmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fx/Bw+KQdz7LfGgDGk8ih9nkK9JPobXXI1pMWgbX3fg=;
        b=zM4zjJlLW0xFxFKADCJQ4OPLnGwSvs0p0lBQ5Lx0R2uLqIMH53floVL1iQ/5FJRFt6
         FKRxU6uLkBViuqvEG0HkLJGjzpd4e89cQu5cdntQdh/OGoIihiw3SOwn4Z27Bs5woJbw
         JZHjG4O/PPIZOpigR01uFgYeimkWV4s3u3bLbLig7pEsUxjA1b+W60yPJFYGwNuvmegh
         rh1ZVUNs9XxhgfM7Z3t5qqTbIeD5SKF1YMruuvTtybQ5W84UrhCCFv4Jd/kmwRPswPjf
         hkHPs2MhLEm4SOETaKlWnbu/wZ7pEBfFqi2Iv0s5xRdBMvFxGltWhQB6ByjYC+nB7RmE
         zvjw==
X-Gm-Message-State: AOAM532+FOKIs6nGuuTHxOgTeYRjomGVRk3RBPHwnKWKisqc7RVtqOEJ
	XjxuLGE+h77W9UEoWcuphubhG/JyVvk5yQLq
X-Google-Smtp-Source: 
 ABdhPJw+8omcCdWqd5HuXHlkaZaR9PCOPrUnG0eTqzn7jZnq6E5CyAOvEYDACyhDCMq/2FVyyWr7Bg==
X-Received: by 2002:a5d:5846:0:b0:203:6b34:37af with SMTP id
 i6-20020a5d5846000000b002036b3437afmr22248523wrf.58.1647365592414;
        Tue, 15 Mar 2022 10:33:12 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a5d5981000000b00203d8ea8c94sm1720762wri.84.2022.03.15.10.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:33:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: Allow optimisation of do_create_spdx task
 dependencies
Date: Tue, 15 Mar 2022 17:33:10 +0000
Message-Id: <20220315173310.889973-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
References: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163312

do_create_spdx tasks don't need their dependencies so we can optimistion
this as we do for some other tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 163bdf0b5f7..1c0cae48938 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1084,7 +1084,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx"]
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
-- 
2.32.0


