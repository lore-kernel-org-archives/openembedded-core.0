Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC0BC63714
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.23369.1650148138283937114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8N27Hlq;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id w4so14500377wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odps9OMZoa+CuQMJ13hLPdm0u5Q0DfFHZMk3XMsI8rs=;
        b=h8N27HlqjvtbCij7k9QekLEyn6T3DEZ1ZbagXvk/Qqgsb0HhNvJZDn/hFMleamtiAu
         gR8yELXvt4+pZPYVQpFluUM5bGVJIhy0Jpu+cWxe25rw/gc5pbjBsRbpnTisI7Mqp6fL
         mZ1gy05JebVTKBV7uDVYDeYKyQfJ5qww8k7N9cKdWTXCEVzh+JyeZaBiAV610ocVLZOH
         qMNb69uepkb/sQH0nvGyfyufR22bR+a780j3q8bOC49psF6Eh3HnSZcVL8qRKEkHWzt4
         ISNtF8mrJCNb5/P4RDX6llTZGpYfIUmef4BTz6TKjFkIbcvA31g0v46Pkfmwh7oXD8/e
         aocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odps9OMZoa+CuQMJ13hLPdm0u5Q0DfFHZMk3XMsI8rs=;
        b=ZcRTY3rg9xSZ83SHiOQPWtzfW2gsDpnCVdSLk4pbGv0cvSB/S7fXrAe9wc8TpD+/iI
         X0eXwUhhwdJHNXmasizdvIXRGrUjTzsu59rmNn8z7QMOo0IIdUrUoK7LVeiK3IqplHEa
         lUO44/IpFZTf2Zmw1szOtps8i4x9vTAxMMSb2r0gKaxTaWbS8fgdx2E4uXXJwinSYu4b
         DGrms6SnjoiWWOO19G57LmUesJCzdkL+vgm4NPEdM2iYqR5+uQPEd3TGn6u6vAJ4wjka
         M/cXd8R6FSTS+NIwipgt1VzuCqFZX3g02GuB0jPYN8gP+kCbDRI0KIWooMJbXD0mHKB9
         43VQ==
X-Gm-Message-State: AOAM532oHxMgDwb5qKLdaByMzBB0axR5gpvm+QgYM/pBveF+8T1eXWBb
	lXjChCBXWQakZjthBwced4kvlZJOD5rn+A==
X-Google-Smtp-Source: 
 ABdhPJyuZA8S7/KWP285rguq6Idct17O3HgDaWkOgHy8qCxstVM2zTRB9oPUk8r0NgATpKi8WdpRQQ==
X-Received: by 2002:a5d:4483:0:b0:20a:92b2:ff81 with SMTP id
 j3-20020a5d4483000000b0020a92b2ff81mr145953wrq.549.1650148136658;
        Sat, 16 Apr 2022 15:28:56 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b00207b49d3023sm6838104wrq.44.2022.04.16.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:28:56 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH v2 4/4] oe/utils: remove the ThreadedPool
Date: Sat, 16 Apr 2022 23:28:46 +0100
Message-Id: <20220416222846.219151-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220416222846.219151-1-quaresma.jose@gmail.com>
References: <20220416222846.219151-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164566

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


