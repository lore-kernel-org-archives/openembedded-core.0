Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 32AE670F24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKl0mW021671 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:47:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KDxE7NRNXU9G
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:47:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKkuZJ021666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:46:57 +0100
Message-ID: <1408654017.1669.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 21:46:57 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] bitbake-worker: Improve sigterm handler
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
X-List-Received-Date: Thu, 21 Aug 2014 20:47:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When processes terminate, we really want all of the child processes to
terminate too. This was not happening for worker processes which spawned their
own multiprocessing pools, leading to build hangs. This change ensures any
sigterm gets passed to the whole process group. In local tests, this resolved
some hanging process workloads I could generate. It does rely on signals
being delivered in a timely fashion and there is a multiprocessing bug we have
to work around there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index 05e0cf6..d1ff5b3 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -81,6 +81,11 @@ def workerlog_write(msg):
         lf.write(msg)
         lf.flush()
 
+def sigterm_handler(signum, frame):
+    signal.signal(signal.SIGTERM, signal.SIG_DFL)
+    os.killpg(0, signal.SIGTERM)
+    sys.exit()
+
 def fork_off_task(cfg, data, workerdata, fn, task, taskname, appends, taskdepdata, quieterrors=False):
     # We need to setup the environment BEFORE the fork, since
     # a fork() or exec*() activates PSEUDO...
@@ -132,7 +137,7 @@ def fork_off_task(cfg, data, workerdata, fn, task, taskname, appends, taskdepdat
             global worker_pipe
             pipein.close()
 
-            signal.signal(signal.SIGTERM, signal.SIG_DFL)
+            signal.signal(signal.SIGTERM, sigterm_handler)
 
             # Save out the PID so that the event can include it the
             # events



