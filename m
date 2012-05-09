Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSDi1-0008HU-Bb for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:42:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49KWD5v025932
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 21:32:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25763-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 21:32:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49KW6Hr025926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 21:32:08 +0100
Message-ID: <1336595524.2494.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 21:32:04 +0100
In-Reply-To: <4FAAAEB6.2060703@palm.com>
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 09 May 2012 20:42:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Rich,

You might like to try the change below as I think it might address the problem.

Cheers,

Richard

bitbake/runqueue: Fix 'full' stamp checking to be more efficient and cache results

This should fix issues where bitbake would seemingly lock up when checking
certain configurations of stampfiles.

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




