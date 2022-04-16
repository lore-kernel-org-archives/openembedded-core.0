Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F22C6370E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.23463.1650148137302122126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ionIfrjY;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id c10so14556391wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZTI0HiRvnsvl0GxnZXzbb2yHO7cI7d4IaUoxqmlGLmk=;
        b=ionIfrjYMUQC9vxGhXzXAaHxV5a0WOCgUu+gYFYShQB0Nyrw4YI0W73JCnOZfybZxF
         cyBo5ES09ejKbcl2VtNnvTvfwFjkMcPGx8/xTbaXeSQcPv7P2Wz1jPGS7g9KA1l6wNVD
         zO0x0O9JciKIHb3guBjBAD3RwB60JNlIx/Efh1BKrW485S3etl1MP0TtxdmEXpzcWog0
         5nWYpQAGgZn6h4htOgrntWDe824zL22KYCwvpfRx9KrPmdLnKBNPD6vZ/Tq3jrIgUBV6
         L9+n8CxSyX1O+G5gVZllPSs3XGPnuPXRup/cnhgQvLSDPMk06Uz0zhETEhG/7lPtXR5j
         70FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZTI0HiRvnsvl0GxnZXzbb2yHO7cI7d4IaUoxqmlGLmk=;
        b=dv3BxdX/WrJBEG8nBWO3Gl0XPc3UhHCIrHaeSYJSuNGSGYSTb11uRoImLBOs4b+fuP
         K8LhwS4StB6k50YfCPoXkCQMfhS/OBBLC5BMNJxAyRRKn1fPRJhkMR5n8TPPkEECvKgP
         C6LKSYul2jKBrLkBH2g1TE1u1uaYUf4m7ti8Ek/KuAWLTuQY2HxfdbfRJQAM7te3xMj7
         U9OxShjyGEpfiXS1zQbkJ+vmuatT37W324brYD4ujcLmUNfTLY19azcoejmN/see1ylG
         +oGxzlcCb49xaqoKZeb4ViQurAEtN4rI6z0zPUygq6ASGkZKs3CHtHuYDdgQkAULrtI9
         a6ew==
X-Gm-Message-State: AOAM533NunNH/dfLA15InEzFgNodeQ29WdehF87n5UwtC57XCYAUhmLt
	wgjlJ1HTlsSMYxi1DoOL2uqE84ve9zU3hQ==
X-Google-Smtp-Source: 
 ABdhPJzuwNZyzZvIz23V2cftbSL+dBUJWQdi2GNG9az7brNy6yu/vze1UdYdFpYNw8hNw114PrspFg==
X-Received: by 2002:a05:6000:1f11:b0:207:a62d:bb32 with SMTP id
 bv17-20020a0560001f1100b00207a62dbb32mr3474936wrb.386.1650148135697;
        Sat, 16 Apr 2022 15:28:55 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b00207b49d3023sm6838104wrq.44.2022.04.16.15.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:28:55 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH v2 3/4] sstate: use the python3 ThreadPoolExecutor
 instead of the OE ThreadedPool
Date: Sat, 16 Apr 2022 23:28:45 +0100
Message-Id: <20220416222846.219151-3-quaresma.jose@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164565

for the FetchConnectionCache use a queue where each thread can
get an unsed connection_cache that is properly initialized before
we fireup the ThreadPoolExecutor.

for the progress bar we need an adictional task counter
that is protected with thread lock as it runs inside the
ThreadPoolExecutor.

Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b9e9ef8e26..7a18d9d554 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -997,15 +997,19 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             localdata.delVar('BB_NO_NETWORK')
 
         from bb.fetch2 import FetchConnectionCache
-        def checkstatus_init(thread_worker):
-            thread_worker.connection_cache = FetchConnectionCache()
+        def checkstatus_init():
+            while not connection_cache_pool.full():
+                connection_cache_pool.put(FetchConnectionCache())
 
-        def checkstatus_end(thread_worker):
-            thread_worker.connection_cache.close_connections()
+        def checkstatus_end():
+            while not connection_cache_pool.empty():
+                connection_cache = connection_cache_pool.get()
+                connection_cache.close_connections()
 
-        def checkstatus(thread_worker, arg):
+        def checkstatus(arg):
             (tid, sstatefile) = arg
 
+            connection_cache = connection_cache_pool.get()
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
             localdata2.setVar('SRC_URI', srcuri)
@@ -1015,7 +1019,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             try:
                 fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
-                            connection_cache=thread_worker.connection_cache)
+                            connection_cache=connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
@@ -1025,6 +1029,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             except Exception as e:
                 bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
 
+            connection_cache_pool.put(connection_cache)
+
             if progress:
                 tasks.remove(arg)
                 bb.event.fire(bb.event.ProcessProgress(msg, total_tasks - len(tasks)), d)
@@ -1047,13 +1053,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             fetcherenv = bb.fetch2.get_fetcher_environment(d)
             with bb.utils.environment(**fetcherenv):
                 bb.event.enable_threadlock()
-                pool = oe.utils.ThreadedPool(nproc, total_tasks,
-                        worker_init=checkstatus_init, worker_end=checkstatus_end,
-                        name="sstate_checkhashes-")
-                for t in tasks:
-                    pool.add_task(checkstatus, t)
-                pool.start()
-                pool.wait_completion()
+                import concurrent.futures
+                from queue import Queue
+                connection_cache_pool = Queue(nproc)
+                checkstatus_init()
+                with concurrent.futures.ThreadPoolExecutor(max_workers=nproc) as executor:
+                    executor.map(checkstatus, tasks)
+                checkstatus_end()
                 bb.event.disable_threadlock()
 
             if progress:
-- 
2.35.3


