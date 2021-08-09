Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.20828.1628502556785709144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m4ikvJVe;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h14so20538339wrx.10
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F40CmX1Xyc26EBkB/ixzEjUF6C3N7g70vbVUkv5F2Hs=;
        b=m4ikvJVeO6Io0/gpfXekEg9TrMJCKgmvAZy4p4r/kD3PM2oAoGZY9JoHyk11b+qd6H
         Hp3UdVQZNWmA54uFWuBIfTuRJlQBUd6v7vvekYJ0+xuw+iSLKEtCZ0xbWDkTZ9rzvsym
         bW1l5H/LuSpPTBa4GU3a8upaa8Ky/aTgOzCCsyQ0mmINKDiJ3ByCO0vDcUNkWlQmRw7H
         lJwzIdAb3g0WwndQhDUWXI8PRfdkp7mcDbLS9dpjPr0p2zp99CBwC7iN+JSzHPMYDZ5R
         3Eo01UADxNIGq34z/1ZR7+9oTFZrqaSvZiQWm2SZrwi/ErGXa3xyRRtruIYnq+lyE1wT
         e0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F40CmX1Xyc26EBkB/ixzEjUF6C3N7g70vbVUkv5F2Hs=;
        b=M9+MBCWSx6EIAxAe8o0Y8HCP8Juk4ocdkZqwNdpI9F/xKrLKZc1gqy4m5C+U19oYM5
         lQTjhiTlKxwm6/s4U5jkJXj00xPRjDg0ysE7I+6VajnUBJMc6dDfDzmTvMZdUgIDdz8M
         GAGkfVRLs42Jcn9is71ddbBCOZbx3C0H2VhmShurTJhkj3xPtR2GBGZGWHn67sP3yCyX
         wUR6fvjRDvIWuZiFakTrXKnJK3lqoUNpnsV9gtbXtBqj4+9Vcgln0C/q12TmNCHYoObN
         v0HLmZQ5nS1l+qF0bFfcMt9SMWvFfDYeoMVNdrTseMKQIAslONLGlKM8hKgcKDZoNUCg
         Y7ig==
X-Gm-Message-State: AOAM530KsV2vFOpq7vrcqQKwb5zMDeW9aKpf788+IDBF8+Pp8kky7X2e
	zgsxdunMwcOIl3GMYZAnK/SS/aspO2o=
X-Google-Smtp-Source: ABdhPJyghVUYOLzt09gNtqXUy3Z+HeYGqBYYPuggPbuqKRFNuzpWflWUEBLahQFEFDo6D11BDyXaxw==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr22145939wrt.170.1628502555211;
        Mon, 09 Aug 2021 02:49:15 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c190sm17314303wma.21.2021.08.09.02.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:49:14 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 5/5] sstate.bbclass: sstate mirror progress bar cleanup
Date: Mon,  9 Aug 2021 10:48:53 +0100
Message-Id: <20210809094853.3619155-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809094853.3619155-1-quaresma.jose@gmail.com>
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only has the progress bar when we have more than 100 objects.
So check for this and store the result to show the progress bar.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 948779386d..a9c908fe97 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -953,20 +953,24 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             except:
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
-            if len(tasklist) >= min_tasks:
+
+            if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        min_tasks = 100
         for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
             sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
 
+        progress = False
+        if len(tasklist) >= 100:
+            progress = True
+
         if tasklist:
             nproc = min(oe.utils.cpu_count(), len(tasklist))
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
                 bb.event.enable_threadlock()
@@ -978,7 +982,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.start()
             pool.wait_completion()
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 bb.event.disable_threadlock()
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
-- 
2.32.0

