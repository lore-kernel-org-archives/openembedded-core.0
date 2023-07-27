Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE0EC04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 13:56:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8026.1690466181780327759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 06:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=08A7Gxe1;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so10016045e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690466180; x=1691070980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2BdRDUVCjfe1FYRsLCR0rHlrUx6UUMYpLR8fWZVcfc=;
        b=08A7Gxe1mz1ySLuOgmY6QBaYU2BBtN8HW4AjTAV+TSd/Juz+xVn6s/r/rEM8CDWHfA
         VQ9loWRkC+BrS70+zsCcfrHzdMpHiWiTWygFSzhhHcPchargfBh+oSLFFw/ar2lEt3Q7
         azIYqdzFaA0z6lmcGNssKkN308a98pL4PO0EBSofV4PPcosmBbkObwyfyX8OKVBtM+pv
         rJ4oNozPptHlo3XrkyrUMfHAcc0Qt5AOShMeFMf+3eb/VUv4ewdGy69buvrlmzywvIum
         cfUWkSeWjOyU8JIYeHtTOT64qO8pogzmr+Q3cwMRYlPyawQNasn3hHFBgtvGArHZEx9F
         Y01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466180; x=1691070980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2BdRDUVCjfe1FYRsLCR0rHlrUx6UUMYpLR8fWZVcfc=;
        b=aZsc2R6qrpcNNiTiVh8Isk1krZYmmYzeC006RtrX3fPiGiErkSw++Uhw8939bBtBNk
         JVDFvu1kW1V2gP2kThuYFlyskI7ZA0Xl1At11qyfERgyuEYGngLkLs+Dbu1Zip/KcJ9J
         J6/kJAYR3lfEkYLRJTlcw6GtaYox2YAPHOju0jOva5xy5tpeCmGRxIp4Mk1e0cMpMC+8
         CptXpVTSxwgzrFjfgebc7eKXYVhjWzgMpDbJ4rhoZ0zI57fJoeFnXTkX6HUSEwyc6IJg
         M67qP8JxUBBEI8NYSxkQQSg3TLipPgjbP08XV6iMWBKltxsviuJzA+Cp5v/7pHeBvv4T
         RixA==
X-Gm-Message-State: ABy/qLZFbbIZ+pYn+k0CgmgSpKn9KWAL2Jrhm5c9yOt4ORb70w9supYp
	rmumZ74U6JAXj2hnnBVDs1ZAFl0Mdf1WdXYycXq2XA==
X-Google-Smtp-Source: APBJJlFIOoQiDAg3e6m9fCWbpcDQQv8hpWYno/JwaSs1k9YLW2DfvOqMV7t1JRD1icJ0+eBdqFNdIw==
X-Received: by 2002:a05:600c:11c8:b0:3f7:a552:2ec7 with SMTP id b8-20020a05600c11c800b003f7a5522ec7mr1719066wmi.33.1690466180163;
        Thu, 27 Jul 2023 06:56:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y26-20020a1c4b1a000000b003fc04eb92cbsm1868884wma.44.2023.07.27.06.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 06:56:19 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 2/3] bitbake: cooker: add a new function to retrieve task signatures
Date: Thu, 27 Jul 2023 15:56:11 +0200
Message-ID: <20230727135612.951926-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727135612.951926-1-jstephan@baylibre.com>
References: <20230727135612.951926-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 13:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184934

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


