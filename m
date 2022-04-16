Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA4DC63713
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.23561.1650148136499138250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R7HTC3YZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id e21so14512742wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ7euGVKUlvcWmL/y+a/4fVq+QW+BN14fPp+4uqLQJQ=;
        b=R7HTC3YZqgf/LKeOLAvZ8ll7RT9ZQi/EuFwM1Hy9TaeieYWITNcVCqdaQAGg86LMaO
         48PYSl2B2o6eDw3IhwMVbJNIObEcQUmsNll9MJrmSRfS9HmBQFU+gJ2I/Me2Bi0Tdz3c
         Qq61byqwvtGUpiAcwElMA06ptIKHKfhbC89hzpXUzXjL01sS6eYvpepHOJyELpMwUkPM
         azyRccPRsKC7IjBdDJOcQdAbyRi7Nt390lrxWnL6CyFeF0UBZUjHOw1OJtUdlc2YO+KX
         21bo4ZCLkyhzR7qvuyNN5MXH3VNNBi3bOb3JUNaNP/FrVN3lXHwzD7+Mz81+TS5GO0mJ
         5DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJ7euGVKUlvcWmL/y+a/4fVq+QW+BN14fPp+4uqLQJQ=;
        b=HnU/c/Gk2KU6uMjx234piMLG08ejm37TAMXcEuZMDNKRfHzq6AO8lhbCvYDeK9ZMdS
         Sv1GJ/DlppzV0qfwZMJHqYUHCulmLGmZke/Qppe95Okmz4sOJWqHwNdtsQAQ8be7fz/2
         vRf6CsncjlkoavZBkGV/IlJmlNih8UiULgxoTiE5LvT/Yp3msKM1foP+o2FiOttfSnnK
         J91AN2APZmzQpgfOXbZnU853W6ksVo2JkxfRpTgjg2sG/nbL9ImTZR2YmsjvXmRjIf5S
         e98TcrwQ5CcVJqBRo2SckKUHoivwpbRIQY/+h4nYr8TU12UCSC0Jwt5b7J0DDbKOaH5S
         yQ3Q==
X-Gm-Message-State: AOAM5307Xamr7aoh3CB2FkrN6YZNh06Nx0NFzOA+SOYrUEVUkKeyXQKa
	Q1H9bsOAhvIvm1g2Li1uLqQBbWjGL2xXhQ==
X-Google-Smtp-Source: 
 ABdhPJzYx7YG5GXuEwirAzf9iZXP3U6fcOrPTpYYIo+KjhdVLr/jSP1PLGI8sOHZx2q8Viyqdorkmw==
X-Received: by 2002:a5d:588a:0:b0:204:1f46:cf08 with SMTP id
 n10-20020a5d588a000000b002041f46cf08mr3734446wrf.133.1650148134805;
        Sat, 16 Apr 2022 15:28:54 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b00207b49d3023sm6838104wrq.44.2022.04.16.15.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:28:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH v2 2/4] sstate: store the tasklist in a LockedSet
Date: Sat, 16 Apr 2022 23:28:44 +0100
Message-Id: <20220416222846.219151-2-quaresma.jose@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164564

With this aproach the progress bar will be independent
of the ThreadedPool.

Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a3ba748a1e..b9e9ef8e26 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1026,29 +1026,31 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
 
             if progress:
-                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
+                tasks.remove(arg)
+                bb.event.fire(bb.event.ProcessProgress(msg, total_tasks - len(tasks)), d)
 
-        tasklist = []
+        tasks = LockedSet()
         for tid in missed:
             sstatefile = d.expand(getsstatefile(tid, siginfo, d))
-            tasklist.append((tid, sstatefile))
+            tasks.add((tid, sstatefile))
 
-        if tasklist:
-            nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
+        total_tasks = len(tasks)
+        if total_tasks:
+            nproc = min(int(d.getVar("BB_NUMBER_THREADS")), total_tasks)
 
-            progress = len(tasklist) >= 100
+            progress = total_tasks >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
-                bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
+                bb.event.fire(bb.event.ProcessStarted(msg, total_tasks), d)
 
             # Have to setup the fetcher environment here rather than in each thread as it would race
             fetcherenv = bb.fetch2.get_fetcher_environment(d)
             with bb.utils.environment(**fetcherenv):
                 bb.event.enable_threadlock()
-                pool = oe.utils.ThreadedPool(nproc, len(tasklist),
+                pool = oe.utils.ThreadedPool(nproc, total_tasks,
                         worker_init=checkstatus_init, worker_end=checkstatus_end,
                         name="sstate_checkhashes-")
-                for t in tasklist:
+                for t in tasks:
                     pool.add_task(checkstatus, t)
                 pool.start()
                 pool.wait_completion()
-- 
2.35.3


