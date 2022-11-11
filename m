Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC58C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 18:06:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.25.1668189965436953150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 10:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hBfJe3g3;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso6053758wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 10:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOIFcTyY/kzxU/vRDbDWNSqC18QTi5o+wuao88x2wqw=;
        b=hBfJe3g3OA6yW3+D8QbUV3WmYWdz5WzA/UZJaJjOc8iMDfmPfLOm0g2n5wBYQtI2pw
         dH3j2cU1lodE0ONxmmltgak4eE8VKLFAJhmoVGOw2Zqn2IFx+Qa9ryCjLA/zVG2i3vo6
         B6mmHNDZT1ikSvcotq0oFtW6TEEmq9ij2GdVG43eXxLjFD6ci7UfVUmgUU9s/Wbm49s+
         kygQldJEcD1os5V1QfJp9BlmxfYofxiWhw9k9v9k4/rRswOVCs6SHFhwdluzhUSYEgDO
         GTx06nehKJPYATGmgO3GPRMNorQ0RKcYA5qsp9xVO9tnIs39S+jx5ANCbsLpTyPA//YM
         LBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOIFcTyY/kzxU/vRDbDWNSqC18QTi5o+wuao88x2wqw=;
        b=C0RIUL1OiurFPzM0U0Rg9w7+dBPyvFrclRkZ3X2Xv5Cm9lG6fat712fzY2bP8NBxFP
         BtuNa7T1DgkjaWHmMW8Wx2RJxjyoRYhkWIzER3Mjn7B6Geg8A1Xp0KLC/4jKDhkpBGvg
         N5xpYZiI+7H8I+P7gyo19s6D4LNpLJQl2QpBjxNOL0y7F+bFiaV3id9n1Gsa3IKPefil
         0g/RTJrS6xgiMV57oO0DUbCQ4WR4l1Rtu9QPk6GzR6DhR6hc7LFQk/PjYQSF+nIeSbn4
         TmIuE9niGvGygAXmT3TaLhiA6Zq9ouUrhXrat25MB7O6GfJ0CrF+pxTHRC6RLVPbSVwB
         5sDA==
X-Gm-Message-State: ANoB5pmsgYbJEkCyM5wAkwrCVAalfx/rLzPRz/JKpM5JuBii5X02SUQp
	Tar/tT/EHkVS/DVPJowL92yctGmY3T5BqQ==
X-Google-Smtp-Source: AA0mqf7mbvSipegGUysYQ5+oovLh2uhn/41NeR9SLG2EXdHq5MSj+tYqb1DMbip8XWRcA0m4jIc5qQ==
X-Received: by 2002:a05:600c:5022:b0:3cf:96da:3846 with SMTP id n34-20020a05600c502200b003cf96da3846mr2042477wmr.10.1668189963578;
        Fri, 11 Nov 2022 10:06:03 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id bx32-20020a5d5b20000000b0023bb7e4b8b1sm2496714wrb.82.2022.11.11.10.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:06:01 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-Core][PATCH 1/2] sstatesig: skip the rm_work task signature
Date: Fri, 11 Nov 2022 18:05:45 +0000
Message-Id: <20221111180546.2456993-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 18:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173137

We can skip the rm_work task signature to avoid running the task
when we remove some tasks from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oe/sstatesig.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index fad10af539..aa273df970 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -32,6 +32,12 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
     mc, _ = bb.runqueue.split_mc(fn)
 
+    # We can skip the rm_work task signature to avoid running the task
+    # when we remove some tasks from the dependencie chain
+    # i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
+    if task == "do_rm_work":
+        return False
+
     # Keep all dependencies between SPDX tasks in the signature. SPDX documents
     # are linked together by hashes, which means if a dependent document changes,
     # all downstream documents must be re-written (even if they are "safe"
-- 
2.34.1


