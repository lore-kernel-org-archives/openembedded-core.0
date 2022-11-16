Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7197C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 11:24:53 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.6015.1668597883377732430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 03:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=D/cyQbE0;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 2AGBOeuF055360
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 12:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1668597880;
	bh=qW44IdrHX+c36vwddyCZ26Sri72of0d8sE8IAc2nsU8=; l=1830;
	h=From:To:Cc:Subject:Date;
	b=D/cyQbE0WJ7/1hrwlhzvY3HjaQtynEc5Kql/1tIlbzqSjrP6uCsDSqCvutZ9fb0D/
	 VwxyZGOJlgIsGn0fiNyzJ3B3CUsj7oZ412mbbFEaD6KwKB7Lo1+GkXGhRnI8DHHFPm
	 1uLiB3DBMvsh5DYrN1Qh++3JFk9opUG7yKO0zkGcqV8y7ZrmVGEGTT4gLrnfGHPx5p
	 SQISBmFxujn4Yb1iF2ZGte5sNg7IAvtznEyaGKpmI2ogp3jcn/yeklyyqyiZTJITdR
	 9RnO3Vsg0fSMKhdJUx7lqVDGiTkk+bA2N1Qw6OcP+MhhrjAQKi5ibeY0lf0v9UN2FH
	 ocQjGEjf5+SmA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id 2AGBOYjY062047
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 16 Nov 2022 12:24:34 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id UBCSFPYTKT; Wed, 16 Nov 2022 12:24:33 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 2AGBOX0H054458
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 16 Nov 2022 12:24:33 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1ovGWv-0097K6-0m;
	Wed, 16 Nov 2022 12:24:33 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] sstate: show progress bar again
Date: Wed, 16 Nov 2022 12:24:25 +0100
Message-Id: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 6374c871c12256ade0c4adb0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 11:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173383

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
index 2c8e7b8cc232..3fabca4a3160 100644
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
+                bb.event.fire(bb.event.ProcessProgress(msg, next(num_tasks_done) + 1), d)
 
         tasklist = []
         for tid in missed:
@@ -1029,6 +1031,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
+            ## thread-safe counter
+            num_tasks_done = itertools.count()
             progress = len(tasklist) >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
-- 
2.38.1


