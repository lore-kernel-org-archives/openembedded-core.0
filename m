Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59311C41535
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.22485.1650140651537834998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T1YCyRlX;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so6759631wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1UcHnDp86dr/QsjLwHXjvgo4ZTFeA2E9pF3AhQhf+o=;
        b=T1YCyRlXJR0w/6MrCyAA9JWRdZOo4p4QCdFUBYc3g0WvBLlTtBXQApzhcaVJYg3fre
         FM8M8qLQelUZ7/9KPrt9PD1ukY7XsG/yprqu1BKljy9WFA/BqfbJtDMgqIUFd+DFLHXX
         R5xVI36STjBD+mwmVOSrqr4Tb+IR4Wx9Hhw1q6h0MiyjC/hYjp/Oz3NUS8wfZ6hUKc9J
         M765fXicvJLJFaGILPHV7Pq41xR5BHZZ2frtvHfrnjMntzzwlBAoSICbx4+EVgflvukf
         cq8Mn3vAbXM/duSF7rgY1hlOn1eBpgdTlytdKyOrgFdlNZ752eaWPM35cFCwc+kmhobI
         T3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1UcHnDp86dr/QsjLwHXjvgo4ZTFeA2E9pF3AhQhf+o=;
        b=bnzlG5A7ABFy2QjTHSG8Y0NDPwzuwJEPDLX306VNxa49/u2NlfaIzfz9nvlR1TWT/p
         l16s1gXmFWyyiQ7oNxogkwwexkN/dYtgDcS5Sr19BnHJ4iK5ifLfxbQuCOg1kvbRGa43
         /0ujGp4SA0ZUBsnzGziWRqfLwYoLhg2UAKspTdbG9h+NWAiUbP3LKae2FanzsHK9rkAa
         6zPYISe63ZzACVD+hdMn4jhLzFGEYLnJvNGBOolXE9cjJ1DFgbmnLCfvWi1e44fR4VJW
         bUjp8+C6pPL3TV1rlbQJ0rnP8w2eKe71ubloeeKtNevwc0+h9LY0ALD5/j4AZEMPclgI
         5uYA==
X-Gm-Message-State: AOAM531vdByh3eZLmPBjhyA0XG+4ThqrBtE86zIDt1UuaZguVEwyHIE1
	dHJId38nE5q0+eh2T5sKwcapKhT1N7ogkw==
X-Google-Smtp-Source: 
 ABdhPJx2++ulCFCz+cp9aMrdXZpdpa3wCuQ0pGtfGW43OymIL0KEQbPOT7xCyAbRqitaxQSIq25Hfw==
X-Received: by 2002:a05:600c:3493:b0:38e:bbbb:26f7 with SMTP id
 a19-20020a05600c349300b0038ebbbb26f7mr4485465wmq.114.1650140649476;
        Sat, 16 Apr 2022 13:24:09 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b00392910b276csm801925wmq.27.2022.04.16.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 13:24:08 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH 1/2] sstate: use the python3 ThreadPoolExecutor instead
 of the OE ThreadedPool
Date: Sat, 16 Apr 2022 21:24:00 +0100
Message-Id: <20220416202401.179351-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164558

for the FetchConnectionCache use a queue where each thread can
get an unsed connection_cache that is properly initialized before
we fireup the ThreadPoolExecutor.

for the progress bar we need an adictional task counter
that is protected with thread lock as it runs inside the
ThreadPoolExecutor.

Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1c0cae4893..0ede078770 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             localdata.delVar('BB_NO_NETWORK')
 
         from bb.fetch2 import FetchConnectionCache
-        def checkstatus_init(thread_worker):
-            thread_worker.connection_cache = FetchConnectionCache()
-
-        def checkstatus_end(thread_worker):
-            thread_worker.connection_cache.close_connections()
-
-        def checkstatus(thread_worker, arg):
+        def checkstatus_init():
+            while not connection_cache_pool.full():
+                connection_cache_pool.put(FetchConnectionCache())
+
+        def checkstatus_end():
+            while not connection_cache_pool.empty():
+                connection_cache = connection_cache_pool.get()
+                connection_cache.close_connections()
+
+        import threading
+        _lock = threading.Lock()
+        def checkstatus(arg):
             (tid, sstatefile) = arg
 
+            connection_cache = connection_cache_pool.get()
+
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
             localdata2.setVar('SRC_URI', srcuri)
@@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             try:
                 fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
-                            connection_cache=thread_worker.connection_cache)
+                            connection_cache=connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
@@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             except Exception as e:
                 bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
 
+            connection_cache_pool.put(connection_cache)
+
             if progress:
-                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
+                with _lock:
+                    tasks -= 1
+                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - tasks), d)
 
         tasklist = []
         for tid in missed:
@@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
+            tasks = len(tasklist)
             progress = len(tasklist) >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
@@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             fetcherenv = bb.fetch2.get_fetcher_environment(d)
             with bb.utils.environment(**fetcherenv):
                 bb.event.enable_threadlock()
-                pool = oe.utils.ThreadedPool(nproc, len(tasklist),
-                        worker_init=checkstatus_init, worker_end=checkstatus_end,
-                        name="sstate_checkhashes-")
-                for t in tasklist:
-                    pool.add_task(checkstatus, t)
-                pool.start()
-                pool.wait_completion()
+                import concurrent.futures
+                from queue import Queue
+                connection_cache_pool = Queue(nproc)
+                checkstatus_init()
+                with concurrent.futures.ThreadPoolExecutor(max_workers=nproc) as executor:
+                    executor.map(checkstatus, tasklist)
+                checkstatus_end()
                 bb.event.disable_threadlock()
 
             if progress:
-- 
2.35.3


