Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B191C4708B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.70853.1669472170143753843
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MYRHObQH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso10050577pjt.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY8HLxygKzl4QBLbzljyQyOeinOPWYLhvjisj8odz4=;
        b=MYRHObQHrc6stNxX5v7iToBCOkVy//Obb33BAFuzMdoYIpnVU6BJccgJ/wwPkm4vjW
         6NM1btfx8EEDTkXC+FU+1lA40sNNeUNOmFwBUJGA0bG/+PlcbkvjSfAaqdcAH8HXIWeA
         oCVHeoljkINR9sWsaN0RZK1X0bS7B5iCN6uC1yhYTvshcFnkqJeRUkGrgG48NoDJPhHI
         1irJSnVgRyKVP7uuf6hX4rcrTz3UNOitqbExbbttKS+5zfeQisciw5Prxgp7evblPrpn
         mg1gLI9Hf4EGSFh4bvIkGZhA2lkbfb0WUXAnOJdFG925Ic9FxY2G25jisnRiJwvjUZA8
         9b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY8HLxygKzl4QBLbzljyQyOeinOPWYLhvjisj8odz4=;
        b=Wz5Zzc43XyALGux20KBBNV8QM3xUWO9sDRJzDPlsUIzDj6hCGYDp6HgVGyTl5579Ce
         1nnwF2Lz6kAYxUy7l5BuF8sZkPnIWIha4hYZAH756a8e3uMGUqoG5MTjknIhcou7dT60
         84ZdRbqcY8Dw3I6QRjpJ6ANLuJ1oyaJyZULe4teLaWIOC1OyuY352iBBwZQ1fYYfP+r9
         tbabRVMJY11/reO2uH+2/d8u9bkKjY1oLwwk827n4b9u2yM3fdQ5T8ZyKouXIyk+B847
         9MxuPotURAZJiOzKFYofI0EzpKx/xbpgFi4EmfHQvU3AHZX1yDrzn5G6SFMUk2UYsuP3
         89/w==
X-Gm-Message-State: ANoB5pnKqSjmbpQMFhi4DIB8McCkmAEMlpLeAISjYr2ZvpFywM5Rxfll
	LQanJ0mS7n51a9utjK1zwbT1yBRa0piPKqFrdRY=
X-Google-Smtp-Source: AA0mqf4EmtJtPqNC3DNRB69qyMowq8Su7ZUtCX6YYd0BcpEUeUF5WJPy17OQ+zM0sQMGVg4KQzbMVw==
X-Received: by 2002:a17:90a:f48d:b0:212:c877:e948 with SMTP id bx13-20020a17090af48d00b00212c877e948mr52515034pjb.39.1669472169168;
        Sat, 26 Nov 2022 06:16:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 31/37] sstatesig: skip the rm_work task signature
Date: Sat, 26 Nov 2022 04:14:35 -1000
Message-Id: <f1f8f894048b325ce9a8af03b1c3b1c5a9c1f983.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173824

From: Jose Quaresma <quaresma.jose@gmail.com>

We can skip the rm_work task signature to avoid running the task
when we remove some tasks from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 292305700e39d0ebd64763f5032c39ace5005fad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


