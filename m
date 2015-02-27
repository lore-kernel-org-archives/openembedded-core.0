Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id F3F8A737A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:20:06 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so2086405igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RedQA2S5FDTo9ganC53ViKqbpFTprb8Gjl8olPHHFek=;
	b=hNS1jZAD3QcXeQwVDqTV/ADMOsG3nNTZco93Lvns9mbMdGS5mMJaXG5ft39HtNznNN
	sa9A3zlvIG6OreSesGi3O45yWf9IG/WDag4JrWyErgx7HWTndbpKHkcKRSBHz1ivwZCI
	sJXtT9LSkGqr74rs+6bpTbZUANtBxPSMdU82oCgGx+GeG7ZoLQCXDTdYMprHvRISLfPK
	jLUbD0IjlFnVbmLxYbA0x1iQH6b1B/ct3+xATLpG42R5B1Gpvf0HAMiqHnAjKbK2I2ou
	sO4M3k/oSmddSjEK1tRzlGCQ1D3wIetWOGIb8xFQD8WPCsAGUfU4vOZywOnVNjLB72yw
	mk8Q==
X-Received: by 10.50.234.194 with SMTP id ug2mr4305255igc.39.1425057607786;
	Fri, 27 Feb 2015 09:20:07 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id r78sm2594257ioi.22.2015.02.27.09.20.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 09:20:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 17:19:56 +0000
Message-Id: <1425057596-28243-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/6] buildstats.bbclass: typecast argument to os.minor/os.major to long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 17:20:09 -0000

Started to run into this error on ubuntu 15.04

ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
  File "run_buildstats(e)", line 18, in run_buildstats(e=<bb.event.BuildStarted object at 0x7f93341c1b50>)
  File "buildstats.bbclass", line 17, in set_device(e=<bb.event.BuildStarted object at 0x7f93341c1b50>)
SystemError: ../Objects/longobject.c:998: bad argument to internal function

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/command.py", line 303, in buildTargets
    command.cooker.buildTargets(pkgs_to_build, task)
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/cooker.py", line 1336, in buildTargets
    bb.event.fire(bb.event.BuildStarted(buildname, fulltargetlist), self.data)
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/event.py", line 163, in fire
    fire_class_handlers(event, d)
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/event.py", line 102, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/ubuntu/work/bleeding/openembedded-core/bitbake/lib/bb/event.py", line 76, in execute_handler
    ret = handler(event)
  File "run_buildstats(e)", line 18, in run_buildstats
  File "buildstats.bbclass", line 17, in set_device
SystemError: ../Objects/longobject.c:998: bad argument to internal function

similar to here
http://pycuda.2962900.n2.nabble.com/bad-argument-to-internal-function-td4063274.html

If it is right fix .. Dont know

Change-Id: I84f3a4043ad5246e080dfd7e2f066e5292d4af91
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/buildstats.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 89ae72c..4844264 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -52,8 +52,8 @@ def set_device(e):
     # If we end up hitting one of these fs, we'll just skip diskstats collection.
     ############################################################################
     device=os.stat(tmpdir)
-    majordev=os.major(device.st_dev)
-    minordev=os.minor(device.st_dev)
+    majordev=os.major(long(device.st_dev))
+    minordev=os.minor(long(device.st_dev))
     ############################################################################
     # Bug 1700: 
     # Because tmpfs/encryptfs/ramfs etc inserts no entry in /proc/diskstats
-- 
2.1.4


