Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.57342.1629303864250634855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UaeftwIs;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id z9so4383734wrh.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=24H2fAmQOoYzYK6ArBG0fJnqN1/3dJuLoqFVDBe6e90=;
        b=UaeftwIsKtMNEy1Q0S0aKwtMOtKdkz2AXlIlwJ/E32x24h3GbHz7W+zaseCofokOoO
         qSIzmW1UymdakEZy+1auq4Rc9gpIlFK9F3UrRXCMh51BETtOcT1VhIT/BSaRFtVXJGUQ
         Qb1zhLknHhWyP5x4TU/YIDLggUZcaQen0e0MR6mRSZwJkduosS57W3Z+NpHawezETsps
         sJFvKxFtEpgKKgKEJFfdjJtx8v7UFdVJwUdVO5A2gnSLH5frqJeWRaaetvczSKD+WLK1
         giDP33kfyDBIy2xNrSog37mYK8vDHRaG7PiWL0njkk5EFq78SiC5fhrNF4VC+V9OKOY/
         J7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=24H2fAmQOoYzYK6ArBG0fJnqN1/3dJuLoqFVDBe6e90=;
        b=Sb2rh9kiHm8DT/7HVfw0rZMsT08ODayY17YLOohXzIgeRQm8SQNb0+PFtpYUSIpAx5
         fFOpeIoiEuyJeGgPLrnXmKpu3I3ejoEeV37Ml91/wVOL9nefZElFAmEH/aHbUSVPO9Ze
         9uQ9NXyilP7N1YXZL/jAUuIvvnnt3SsjPrCvPq93I2XWSA0+7DT4izEspN+WX+CX53m3
         yOuqLDBD5ASAcororhhsSBPKJgGKnQgde0Jmg+p74LB7MYBepdXbGczdZtMuio9SkpO6
         UL476srJOympRSS7DIYRdkJ4Vsjt7M0d3BT/TItjVJCoQTAbU8F46AGxyeN4UPSyOSzs
         8LNA==
X-Gm-Message-State: AOAM5338Mw9ocxmHbVWPUqqbkbVApgS9wOLW4TGYp6Q1Il6tOOzYHTNg
	+TNU6Ent2fgWIJhSciPtwtsjHkZbTlU=
X-Google-Smtp-Source: ABdhPJyuVekLqoZM34IKVujNQooGhmhXe66XmmrQfKQZ4EFzBWgoa7vyZrxJV1NRY1pFsMOtFnP1yw==
X-Received: by 2002:adf:d194:: with SMTP id v20mr11632989wrc.126.1629303862716;
        Wed, 18 Aug 2021 09:24:22 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id g35sm6086688wmp.9.2021.08.18.09.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:24:22 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 4/4] sstate.bbclass: sstate mirror progress bar cleanup
Date: Wed, 18 Aug 2021 17:24:04 +0100
Message-Id: <20210818162404.130067-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818162404.130067-1-quaresma.jose@gmail.com>
References: <20210818162404.130067-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only has the progress bar when we have more than 100 objects.
So check for this and store the result to show the progress bar.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index bc14b5e264..9cf57466ae 100644
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
             nproc = min(d.getVar("BB_NUMBER_THREADS"), len(tasklist))
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
@@ -979,7 +983,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
-- 
2.32.0

