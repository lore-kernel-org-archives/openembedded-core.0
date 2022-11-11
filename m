Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721C0C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 18:06:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.27.1668190004588428901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 10:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MUIAljxB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso6065341wme.5
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IgPoz2ZJqLeGMDtALF6tSWUg7H89+d01R49/XErRQQA=;
        b=MUIAljxBTdZt8YGxjIAI7IYcyknl+VDXX4g+xtC0fRwP788W3yCgUsFAGBwwM41OuN
         M8Dqok+P1bxcvIwj2dlzINNmaM/KMDi9XWg9X1q5kTaGosXX+zp8R1Fi5Ize9uEkIXPU
         F1rzuHtCivfL091JR3Ek9Im0pySBmefOuYC+/j8qn4zYzeYkKwLTrF5tpD6nyw7xJOSf
         A8C5uPUdZE7SSD5DnL2sWnMX31XS5uWyqPYOeyn0ju9ZcMz1FzR1H7+kv4KlCgC2tSpy
         3wW7suWjC7tbC3oMLf1ubBZhmdgGYNaOvP6K8Hnn1XR3n9gJn+cgyGeA47dQJurpoowP
         sqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgPoz2ZJqLeGMDtALF6tSWUg7H89+d01R49/XErRQQA=;
        b=iTrXVAoVYp4bSx8fTHCJsHX22+jwCHf00cktvrY7vAPhlCXuEfGHAmvDkkzZKi9GkO
         xDR+BnsZ6/gdYgtnY+/e6lH4Gl5FouxbADH0ms5rqGpLhMc7sMhAepPJ3h33EXZtNS6B
         cDBzoHZKR94rnkvudVmIRGcK303Hw8ykNjL5+IJSutMt61wLMIJ8irX5TX+TNea3hKqi
         4o1qT8EQsYRaNsy4RJangpyWxYuFsV4lC1+Q0JXl+WkLYbr3fq8wzX7ZLA0h1vKyjX5W
         IoDcZMZVLnAc5WcTYuGeaon3jGt1QAazL8DtOxP8JOFmSyg0xq3GhOx3UM5N3aHBzLUi
         BzCQ==
X-Gm-Message-State: ANoB5pn73guU2xB6VepyrPGsg3YxFjfjA/iULT8TIPenNs8HjwVAhu1P
	t3dtN1B4H6Qndb+GM1oNwlEbgJFxS4H2Mw==
X-Google-Smtp-Source: AA0mqf6vOFS6xsvf1b2jRVORHAChsTnVY86NSViM4SKshiC+n7XQpKRvNFUth2HWBbv9HrS8yzVRoA==
X-Received: by 2002:a05:600c:4f95:b0:3cf:5b8a:a7cd with SMTP id n21-20020a05600c4f9500b003cf5b8aa7cdmr2101798wmq.136.1668190002565;
        Fri, 11 Nov 2022 10:06:42 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d554d000000b002366e3f1497sm2523125wrw.6.2022.11.11.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:06:41 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-Core][PATCH] sstate: Allow optimisation of do_deploy_archives task dependencies
Date: Fri, 11 Nov 2022 18:06:25 +0000
Message-Id: <20221111180625.2457086-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 18:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173139

do_deploy_archives tasks don't need their dependencies so we can optimistion
this as we do for some other tasks.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2c8e7b8cc2..21959ff13b 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1097,7 +1097,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_deploy_archives"]
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
-- 
2.34.1


