Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9E4C35280
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2362.1650361589995900556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nLhk9gbw;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t1so21663955wra.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0i7NF7YzdoReI2z0M3cPXD+xIKrGafXq+EFDaPJ3RwY=;
        b=nLhk9gbwR0yF8S0Q2jApEdAv30RrVnQxWMTGL9uiWUM/GfGdQxKfUCkvX140eWm6H8
         S1EbC2hbObT3ACFdlLlhsndYirJQi6WiiAtY6HNivIzaJN/cgxE4y8VWqU+z5NYqtVw3
         2Q43TMEMzVvRnJqilD4PtGL1PYa7UpOK8Iwsbt0EANNPK+/JVTmwDRPNuUEhHXk/c67z
         FaZ9nDAnDZyBgVcrpW8aUnwPDMkq1gRzMpn2hgklXrwVS5MppfsExpvryliFtEh03JO9
         mRdcIYVZqYtpGInOPKBqPIwAOYmabE586KYs2pzWRUBB14B6dksXh2c+9NfdJOxRBVGa
         hn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0i7NF7YzdoReI2z0M3cPXD+xIKrGafXq+EFDaPJ3RwY=;
        b=yBZzwvTS+EuMJQakGobGD4Qvmi+OQnbmniCd+fQCha/rGe9Y00TtK0UyCk0jeXRSaS
         uGWazABu52ZFrbUZJUy22dsw8p3panNEJ57CT6hIO4lXJ5kXglWBOwYhMZtdvciPHAYe
         GRaKbnJ4b8nJfOVqTxlfqujYAQ1eEL7IvUVVH85NmJfsTyOmLDuzmKa16zSyToQTr6T2
         /ykUt0U6S6jTNawHwjcTDXUL1y67IXfBFJQzPD0RAnXC/WtHRZHamw7DVE14PQKR3oyY
         plkjKWHBVzdSna/+ZQJOYot8kLa7T0g3nZpPLkiCOo0Yhkp2QME3wkPHS0Hiud8fxBpl
         cozw==
X-Gm-Message-State: AOAM531VNEowDt6alDHUy1LIlV1jmBqlKUS+oKUpaYmLB/IC+5LXvWyN
	46lVxx8FyBGdR4Ur4Lc2yQwRVywtkDb7QA==
X-Google-Smtp-Source: 
 ABdhPJxNbSij1NuC3FZnZwH3psM98oIyH/1z1McvdpaaHnCJEw+UdF51HFGxeZ/BcvQWUsJVV6sBVQ==
X-Received: by 2002:a05:6000:701:b0:207:a314:8bc7 with SMTP id
 bs1-20020a056000070100b00207a3148bc7mr11218278wrb.448.1650361587863;
        Tue, 19 Apr 2022 02:46:27 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1c5444000000b00391ca5976c8sm13556435wmi.0.2022.04.19.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 02:46:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] sstate: add a LockedSet class to be used on the mirror
 thread pool
Date: Tue, 19 Apr 2022 10:46:15 +0100
Message-Id: <20220419094616.433632-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164618

The python set() is not thread safe and we use it on the ThreadedPool.
With this LockedSet python class we can call the 'add' and 'remove'
safely inside the ThreadedPool.

This piece of code is taken from the stackoverflow
https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe

May be related with [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1c0cae4893..ebc336b497 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1008,6 +1008,21 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
+        import threading
+        class LockedSet(set):
+            """A set where add() and remove() operator are thread-safe"""
+            def __init__(self, *args, **kwargs):
+                self._lock = threading.Lock()
+                super(LockedSet, self).__init__(*args, **kwargs)
+
+            def add(self, elem):
+                with self._lock:
+                    super(LockedSet, self).add(elem)
+
+            def remove(self, elem):
+                with self._lock:
+                    super(LockedSet, self).remove(elem)
+
         tasklist = []
         for tid in missed:
             sstatefile = d.expand(getsstatefile(tid, siginfo, d))
@@ -1016,6 +1031,10 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
+            # this collections will be used on the thread pool so let's do it safely
+            found = LockedSet(found)
+            missed = LockedSet(missed)
+
             progress = len(tasklist) >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
-- 
2.35.3


