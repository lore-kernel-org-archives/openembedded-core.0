Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94312CE7A8C
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:05:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.56861.1695629099432561881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BSxWOrPs;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405524e6769so20433575e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695629098; x=1696233898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKDGjOP4KLL8O//oIraloqqh4cprsxG1ID2VXIAZE04=;
        b=BSxWOrPs2yV8eqcofZoTv+jgCxVM7KvMMnrJOXV8o6tgW2ypyM9+Ou6DjCDUyQKOzL
         04poaO6r9qP9oSUFgEdnlYrqoxEK3aZL0uvH7k8TsXRxvZlRiLGsVGFs8rdS+yhQNTKQ
         VVv9zxo5JXLfz2NUfqiSx4PpWQj4+FZ5y0cVMLl9JT52p4X1QMZKKybJ08vOyCTJ2iSk
         G6wDQ7xgvFm8TXa8KzGgP/xZBcUDtEQNS7JfrhliIREZNSNoGTG82SP8hhilS+Nihta5
         55N9sWv21FdL7cl51Jpnj5wR0ATgJt1tRLKgDdasRNBv6uczlNHLLpP/+tmvIDocWnAc
         AiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695629098; x=1696233898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKDGjOP4KLL8O//oIraloqqh4cprsxG1ID2VXIAZE04=;
        b=WyX7Oubg5tokrAyCQpDsd/6vKd3pfhJ3PUXgDJ54xbQoYyw0wUSbJlgLnl7IcFM93V
         C9ORWUlzhyIOiAJWwxWejBuMEgvNuxKmYo/Ht2RFDMsPz8rjKodHDxFVYRyt4BELMKYZ
         h3GrJ3gBQj9SLCYMxAffSiBEKc786xkFPZ3yaQZ2Upwp/AnPSk8GP6eEpe4zZmMf5H0w
         caZciOoGo5hbgk08Mfh3CKIm377cz4+I4OLS7YBs13fYOZmnmEvzCCSMq+HFF1jgdKPc
         gQ8pFqTpdd9Fmif9oFuQVvqIX4oHOc2XANW4Ua6kbUX6FKWcDCcyZVnD/3wI6bYAsC3Q
         bcYQ==
X-Gm-Message-State: AOJu0Yxeovy3LaLMEqweGCHGtUpyNPd5NhT93SYwVsEdUAgqWzudqO7B
	dgI9AMXAmEE2+zyM2Md29rtHh7JReQHx9ZTAojw=
X-Google-Smtp-Source: AGHT+IGpbsM12tTg4jnQbM+ciB7zF0vyFxLDJy/wIC3k3+zejfTKIC76VpBgjeDaCbR3TXaWLXVWbA==
X-Received: by 2002:a05:600c:310f:b0:405:358c:ba74 with SMTP id g15-20020a05600c310f00b00405358cba74mr6920252wmo.0.1695629097820;
        Mon, 25 Sep 2023 01:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm3196950wmb.17.2023.09.25.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:04:57 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 2/5] bitbake: cooker: add a new function to retrieve task signatures
Date: Mon, 25 Sep 2023 10:04:49 +0200
Message-ID: <20230925080452.803540-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925080452.803540-1-jstephan@baylibre.com>
References: <20230925080452.803540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188176

adding a new command in cooker to compute and get task signatures

this commit also add the associated command and event needed to get the
signatures using tinfoil

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 bitbake/lib/bb/command.py |  6 ++++++
 bitbake/lib/bb/cooker.py  | 31 +++++++++++++++++++++++++++++++
 bitbake/lib/bb/event.py   |  8 ++++++++
 3 files changed, 45 insertions(+)

diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
index 8663eed9331..f2ee5871616 100644
--- a/bitbake/lib/bb/command.py
+++ b/bitbake/lib/bb/command.py
@@ -781,3 +781,9 @@ class CommandsAsync:
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
index 87aa71bb657..599c7ddaa28 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1442,6 +1442,37 @@ class BBCooker:
 
         self.idleCallBackRegister(buildFileIdle, rq)
 
+    def getTaskSignatures(self, target, tasks):
+        sig = []
+        getAllTaskSignatures = False
+
+        if not tasks:
+            tasks = ["do_build"]
+            getAllTaskSignatures = True
+
+        for task in tasks:
+            taskdata, runlist = self.buildTaskData(target, task, self.configuration.halt)
+            rq = bb.runqueue.RunQueue(self, self.data, self.recipecaches, taskdata, runlist)
+            rq.rqdata.prepare()
+
+            for l in runlist:
+                mc, pn, taskname, fn = l
+
+                taskdep = rq.rqdata.dataCaches[mc].task_deps[fn]
+                for t in taskdep['tasks']:
+                    if t in taskdep['nostamp'] or "setscene" in t:
+                        continue
+                    tid = bb.runqueue.build_tid(mc, fn, t)
+
+                    if t in task or getAllTaskSignatures:
+                        try:
+                            rq.rqdata.prepare_task_hash(tid)
+                            sig.append([pn, t, rq.rqdata.get_task_unihash(tid)])
+                        except KeyError:
+                            sig.append(self.getTaskSignatures(target, [t])[0])
+
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


