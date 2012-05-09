Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSGv6-0003e6-5f for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:07:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49Nvu4L004392
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:57:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25763-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:57:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49NvhVU004340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:57:43 +0100
Message-ID: <1336607861.2494.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 00:57:41 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: bitbake/runqueue: Fix 'full' stamp checking to be more efficient and cache results
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 00:07:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes issues where bitbake would seemingly lock up when checking
certain configurations of stamp files due to deep recursion and
duplication.

This fixes a problem reported on the OE-Core mailing list to do with
BB_STAMP_POLICY = "full" appearing to hang upon rebuilds for long
periods of time (hours).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index b870caf..48433be 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -875,7 +875,7 @@ class RunQueue:
             bb.msg.fatal("RunQueue", "check_stamps fatal internal error")
         return current
 
-    def check_stamp_task(self, task, taskname = None, recurse = False):
+    def check_stamp_task(self, task, taskname = None, recurse = False, cache = {}):
         def get_timestamp(f):
             try:
                 if not os.access(f, os.F_OK):
@@ -915,6 +915,9 @@ class RunQueue:
         t1 = get_timestamp(stampfile)
         for dep in self.rqdata.runq_depends[task]:
             if iscurrent:
+                if dep in cache:
+                    iscurrent = cache[dep]
+                    continue
                 fn2 = self.rqdata.taskData.fn_index[self.rqdata.runq_fnid[dep]]
                 taskname2 = self.rqdata.runq_task[dep]
                 stampfile2 = bb.build.stampfile(taskname2, self.rqdata.dataCache, fn2)
@@ -931,7 +934,9 @@ class RunQueue:
                         logger.debug(2, 'Stampfile %s < %s', stampfile, stampfile2)
                         iscurrent = False
                     if recurse and iscurrent:
-                        iscurrent = self.check_stamp_task(dep, recurse=True)
+                        iscurrent = self.check_stamp_task(dep, recurse=True, cache=cache)
+                        cache[dep] = iscurrent
+        cache[task] = iscurrent
         return iscurrent
 
     def execute_runqueue(self):




