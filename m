Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5F6C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 10:39:56 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.17623.1668854389204527472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 02:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=bqo8gR3b;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 2AJAdit8075446
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 11:39:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1668854385;
	bh=dE8pa+Vb7+taTATht4Z/+FTYCWFQ/CDfYztqTCy5eV4=; l=1835;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bqo8gR3b4pxyRJENe1Q/9pQaakkSLAm1gQnPpBrIH7ZQrszaLpVlLwYYFc4Dgq/5a
	 mYTIvTpBVOZjC/ijtyvz+fxJU3/9jiGxhaC1T03DlPX0ubzFHEL0UXj5eXxN33RJwd
	 Qo3sTgFjULyAqZFApWI3Qo1nvh1BrZ0do4W/uKH8xCW5d4gpODWVYsEdQEDDpBZXzo
	 y3G232XgotIABD4SMnkf3sp/6YSqug6bq/w+Gpcs9pv3zap7Vi+84FikDI2/pvViW1
	 WY+bCBpRbrGTMR8i6wPhJ5ZV3V2XtZxMBQkAeM2FX2rjZV2fmYv9QUNY6zSLxJOefF
	 SSfBYNKwEoI5A==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id 2AJAdgdv280179
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Sat, 19 Nov 2022 11:39:43 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id R23RQGFWCO; Sat, 19 Nov 2022 11:39:39 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 2AJAdd8I082376
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 19 Nov 2022 11:39:39 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1owLG7-003DjF-0h;
	Sat, 19 Nov 2022 11:39:39 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: quaresma.jose@gmail.com, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] sstate: show progress bar again
Date: Sat, 19 Nov 2022 11:39:25 +0100
Message-Id: <20221119103925.767617-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
References: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 6378b26cc12256ade0c4b912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 10:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173515

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Transition to ThreadPoolExecutor (eb6a6820928472ef194b963b606454e731f9486f)
broke the

| Checking sstate mirror object availability: ...

progress bar because the removed 'thread_worker' was still referenced
in an asynchronous function.  As the result of the future is never
read, the resulting backtrace is silently discarded.

Replace the information given to 'ProcessProgress' by a counter.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-global/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2c8e7b8cc232..f5e0e623e28d 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -925,6 +925,8 @@ sstate_unpack_package () {
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
+    import itertools
+
     found = set()
     missed = set()
 
@@ -1019,7 +1021,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             connection_cache_pool.put(connection_cache)
 
             if progress:
-                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
+                bb.event.fire(bb.event.ProcessProgress(msg, next(cnt_tasks_done)), d)
 
         tasklist = []
         for tid in missed:
@@ -1029,6 +1031,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
+            ## thread-safe counter
+            cnt_tasks_done = itertools.count(start = 1)
             progress = len(tasklist) >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
-- 
2.38.1


