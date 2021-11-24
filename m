Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED2BC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:15:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.950.1637774131808146874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 753AE1042
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D2283F66F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oe/utils: allow naming threads in ThreadedPool
Date: Wed, 24 Nov 2021 17:15:27 +0000
Message-Id: <20211124171529.4107434-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:15:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158729

When looking at logs involving thread pools it is useful if the threads
can be named.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/utils.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index cf65639647..7982b2b511 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -483,8 +483,8 @@ from threading import Thread
=20
 class ThreadedWorker(Thread):
     """Thread executing tasks from a given tasks queue"""
-    def __init__(self, tasks, worker_init, worker_end):
-        Thread.__init__(self)
+    def __init__(self, tasks, worker_init, worker_end, name=3DNone):
+        Thread.__init__(self, name=3Dname)
         self.tasks =3D tasks
         self.daemon =3D True
=20
@@ -515,13 +515,12 @@ class ThreadedWorker(Thread):
=20
 class ThreadedPool:
     """Pool of threads consuming tasks from a queue"""
-    def __init__(self, num_workers, num_tasks, worker_init=3DNone,
-            worker_end=3DNone):
+    def __init__(self, num_workers, num_tasks, worker_init=3DNone, worke=
r_end=3DNone, name=3D"ThreadedPool-"):
         self.tasks =3D Queue(num_tasks)
         self.workers =3D []
=20
-        for _ in range(num_workers):
-            worker =3D ThreadedWorker(self.tasks, worker_init, worker_en=
d)
+        for i in range(num_workers):
+            worker =3D ThreadedWorker(self.tasks, worker_init, worker_en=
d, name=3Dname + str(i))
             self.workers.append(worker)
=20
     def start(self):
--=20
2.25.1


