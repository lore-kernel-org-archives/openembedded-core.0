Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B744C04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:24:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16294.1690986276863056692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=TfCkx+20;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso73769355e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690986275; x=1691591075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2BdRDUVCjfe1FYRsLCR0rHlrUx6UUMYpLR8fWZVcfc=;
        b=TfCkx+20FpCtsNRID863vhZfc1ceLtVj+w2d0oUm9MBUhOG9UfLFcO9XqDm0+xhAxW
         NiY9p5Etn4XT5ZtVIb0KFSEGaxr+l236ekOrrRVHNWMgma6IJwPzAaVz+rDdU+9uofeI
         T7mVX2nXz6ztnIo0z8SQ56o/eZkRpylUtIiPO0dJz4UzB4nrQ3TPb5e2gFxDPBPKonav
         zixafVb8TUHiEzS2ddty4uLLi4NCQ3pdXLxR57T8QzYeYhyjrnCyNUcBZ+gecKw3Sb4g
         TaX/rnkcoflQeXtolN+EXc4dsQMQv9XJx3YkO5D6hYBCEPTNQmxtNcWiJQwFuAWWWTuU
         XPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986275; x=1691591075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2BdRDUVCjfe1FYRsLCR0rHlrUx6UUMYpLR8fWZVcfc=;
        b=I7yakYXTf5obRB2K/KfBYl96E8y7Agb02moPKlQMdRFOyBhFpdo2l23/KLVqBTY7Bh
         WzwCzoVhicLKpTKyALVWjQNce+50bhUhdHTX10BAAGWAJK8Q4uOL6zlSoiF5twBxtY7W
         Rtp9gQfiOsuFuVwXShY9frpVzbdXx3U5iH0/UsDLHDmX1nabLWGmYBKk4oUlO8/GXssh
         nC146S40/ww+3NVdCl5NxAs7nDa/zKVrDw7KAlT9Hd4Yhv92e2O0sSw3IS/pKGu+ptnd
         c6u/LmYeE1EhdeqxP8MdaNP1Yrbxjhez0vD7ZxChyVPkM2NdaxzqeOTY9awcRN0Xz8xP
         A3/A==
X-Gm-Message-State: ABy/qLbJc6DRmxcSWjO7Hp7hptTvl6f5NeAQ8AhXi/AAmhtuDnsTcAPZ
	wsMukgG5yBkzvopuw0wOMMnfMJwPJQXnHKiaxwXpFw==
X-Google-Smtp-Source: APBJJlESNlpGRIGy805VvGmJ8lUnSgkKJmYKyU54QeE6E/cYgSTjo69vg4OJo+bGbMCF7NMcJVXtpQ==
X-Received: by 2002:adf:edcf:0:b0:317:759a:8ca6 with SMTP id v15-20020adfedcf000000b00317759a8ca6mr4680732wro.62.1690986275092;
        Wed, 02 Aug 2023 07:24:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y17-20020adfd091000000b003178dc2371bsm15707079wrh.7.2023.08.02.07.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:24:34 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 2/5] bitbake: cooker: add a new function to retrieve task signatures
Date: Wed,  2 Aug 2023 16:24:29 +0200
Message-ID: <20230802142432.2296716-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802142432.2296716-1-jstephan@baylibre.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185405

adding a new command in cooker to compute and get task signatures

this commit also add the associated command and event needed to get the
signatures using tinfoil

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 bitbake/lib/bb/command.py |  6 ++++++
 bitbake/lib/bb/cooker.py  | 16 ++++++++++++++++
 bitbake/lib/bb/event.py   |  8 ++++++++
 3 files changed, 30 insertions(+)

diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
index a355f56c60c..12202779ac0 100644
--- a/bitbake/lib/bb/command.py
+++ b/bitbake/lib/bb/command.py
@@ -776,3 +776,9 @@ class CommandsAsync:
         bb.event.fire(bb.event.FindSigInfoResult(res), command.cooker.databuilder.mcdata[mc])
         command.finishAsyncCommand()
     findSigInfo.needcache = False
+
+    def getTaskSignatures(self, command, params):
+        res = command.cooker.getTaskSignatures(params[0], params[1])
+        bb.event.fire(bb.event.GetTaskSignatureResult(res), command.cooker.data)
+        command.finishAsyncCommand()
+    getTaskSignatures.needcache = True
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 11c9fa2c40d..687cdde5e6d 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1542,6 +1542,22 @@ class BBCooker:
 
         self.idleCallBackRegister(buildFileIdle, rq)
 
+    def getTaskSignatures(self, target, task):
+        sig = []
+
+        taskdata, runlist = self.buildTaskData(target, "do_build", self.configuration.halt)
+        rq = bb.runqueue.RunQueue(self, self.data, self.recipecaches, taskdata, runlist)
+        rq.rqdata.prepare()
+
+        for key in rq.rqdata.runtaskentries:
+            pn = bb.parse.siggen.tidtopn[key]
+            taskname = bb.runqueue.taskname_from_tid(key)
+            if pn in target:
+                if (task and taskname in task) or (not task):
+                    rq.rqdata.prepare_task_hash(key)
+                    sig.append([pn, taskname, rq.rqdata.get_task_unihash(key)])
+        return sig
+
     def buildTargets(self, targets, task):
         """
         Attempt to build the targets specified
diff --git a/bitbake/lib/bb/event.py b/bitbake/lib/bb/event.py
index 0d0e0a68aac..f8acacd80d1 100644
--- a/bitbake/lib/bb/event.py
+++ b/bitbake/lib/bb/event.py
@@ -857,6 +857,14 @@ class FindSigInfoResult(Event):
         Event.__init__(self)
         self.result = result
 
+class GetTaskSignatureResult(Event):
+    """
+    Event to return results from GetTaskSignatures command
+    """
+    def __init__(self, sig):
+        Event.__init__(self)
+        self.sig = sig
+
 class ParseError(Event):
     """
     Event to indicate parse failed
-- 
2.41.0


