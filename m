Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A2C63709
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.22720.1650140652328884974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gT4gfCMB;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id r19so839921wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odps9OMZoa+CuQMJ13hLPdm0u5Q0DfFHZMk3XMsI8rs=;
        b=gT4gfCMBoAQJIiemlTdpQz0CjYsBs2n4tOuWK0BSXSbKuiPsjrGSy9h3WwwQhlVgum
         8nE4MxajGryko1evz8iUMkpt6wnPMq1nLZIpyV8mzfN30HrhCnno4MlrFFp8cnE7BjGX
         TCfbp1Sa1BprYRU9JVX/ciXPSDlE7UoBooJuQz0cWMxnrDS+VoOPpr0r/0mFFM9qBLf9
         BNnRLGzmuvBaec4phjbuSGopRBjhrSDN798661FQE28thW/7SRIb+gJmuRY2/urxA9u9
         7gHN37UH7ruAZx787iTXJpngEJDFkoUcuv1jUqLB1PekCuAQxyMaaQjvgEFTPYpBu/lR
         9FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odps9OMZoa+CuQMJ13hLPdm0u5Q0DfFHZMk3XMsI8rs=;
        b=0lFx4DpwlNUVbPjwO62V9Vt3FSNgoGoZ46NnacLelCMa1gFFQODCGrVb5kyr1tSbKJ
         3rArKtzhkrVtA+xwGmtqhJ5EJ4lLNY6DK/15yBdfognDsCdbmvbsbOLMymlwpx12QcQ4
         GaxkttkZCHI60KQnXbFBXcB/ZQJjuyzI9t1vNTc9K4h0J7syKaZGKgcXIzqeheGYupll
         ssGeNAssOYZFfMHXIvVyMp8s+eIL6Q6YKwQpK9dAkbFDX4ynEBpuq0/cA167CpqWsKaU
         k1WSbMYcCzv7T1BmbcdNZmXnLRYcTLj2AVo5oTkL9xgmFD25VXxQsmoV1cwtBiHXF13l
         qpCw==
X-Gm-Message-State: AOAM530k7FYWH7XnvuVmiSyEg1Rw/+LtwHgqX8OskbkGvIYtSxEm5I6m
	/3CVadlfNZ+0UU8/tH4K+dlueCsCL2x+BA==
X-Google-Smtp-Source: 
 ABdhPJzCQ8lkW8Blu3v3UcBzvPOY3eW9O+00yLELAO0Ns/Yz6DuFn6ssH9pLmRNaGrWHo7fwCV0kHQ==
X-Received: by 2002:a05:600c:1f0f:b0:38e:c9c8:9983 with SMTP id
 bd15-20020a05600c1f0f00b0038ec9c89983mr4287593wmb.105.1650140650669;
        Sat, 16 Apr 2022 13:24:10 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b00392910b276csm801925wmq.27.2022.04.16.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 13:24:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH 2/2] oe/utils: remove the ThreadedPool
Date: Sat, 16 Apr 2022 21:24:01 +0100
Message-Id: <20220416202401.179351-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220416202401.179351-1-quaresma.jose@gmail.com>
References: <20220416202401.179351-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164559

The ThreadedPool in OE-core is mainly because python2
doesn't have threaded pools but python2 is dead for
some time now and python3 have a ThreadPoolExecutor.

The only local in OE-core where this ThreadedPool
is in use is on the sstate.bbclass that is ported
to the python3 ThreadPoolExecutor.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/lib/oe/utils.py | 64 --------------------------------------------
 1 file changed, 64 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 46fc76c261..1ee947d584 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -473,70 +473,6 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("MLPREFIX", "")
     return localdata
 
-#
-# Python 2.7 doesn't have threaded pools (just multiprocessing)
-# so implement a version here
-#
-
-from queue import Queue
-from threading import Thread
-
-class ThreadedWorker(Thread):
-    """Thread executing tasks from a given tasks queue"""
-    def __init__(self, tasks, worker_init, worker_end, name=None):
-        Thread.__init__(self, name=name)
-        self.tasks = tasks
-        self.daemon = True
-
-        self.worker_init = worker_init
-        self.worker_end = worker_end
-
-    def run(self):
-        from queue import Empty
-
-        if self.worker_init is not None:
-            self.worker_init(self)
-
-        while True:
-            try:
-                func, args, kargs = self.tasks.get(block=False)
-            except Empty:
-                if self.worker_end is not None:
-                    self.worker_end(self)
-                break
-
-            try:
-                func(self, *args, **kargs)
-            except Exception as e:
-                # Eat all exceptions
-                bb.mainlogger.debug("Worker task raised %s" % e, exc_info=e)
-            finally:
-                self.tasks.task_done()
-
-class ThreadedPool:
-    """Pool of threads consuming tasks from a queue"""
-    def __init__(self, num_workers, num_tasks, worker_init=None, worker_end=None, name="ThreadedPool-"):
-        self.tasks = Queue(num_tasks)
-        self.workers = []
-
-        for i in range(num_workers):
-            worker = ThreadedWorker(self.tasks, worker_init, worker_end, name=name + str(i))
-            self.workers.append(worker)
-
-    def start(self):
-        for worker in self.workers:
-            worker.start()
-
-    def add_task(self, func, *args, **kargs):
-        """Add a task to the queue"""
-        self.tasks.put((func, args, kargs))
-
-    def wait_completion(self):
-        """Wait for completion of all the tasks in the queue"""
-        self.tasks.join()
-        for worker in self.workers:
-            worker.join()
-
 class ImageQAFailed(Exception):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
-- 
2.35.3


