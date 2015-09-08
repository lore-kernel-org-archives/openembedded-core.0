Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFB7765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 22:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t88MZKU9012407 for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 23:35:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dzyASmynkoCU
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:35:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t88MZ43j012396
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 23:35:15 +0100
Message-ID: <1441751704.24871.292.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Sep 2015 23:35:04 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] qemurunner: Ensure runqemu doesn't survive SIGKILL
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
X-List-Received-Date: Tue, 08 Sep 2015 22:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, we see runqemu and qemu-system-* processes left behind when 
bitbake is killed by buildbot. This is due to the use of setpgrp() in
the runqemu subprocess call.

We need the setpgrp call so that all runqemu processes can easily be
killed (by killing their process group). This presents a problem if this
controlling process itself is killed however since those processes don't
notice the death of the parent and merrily continue on.

Rather than hack runqemu to deal with this, we add something to
qemurunner, at least for now to resolve the issue. Basically we fork off
another process which holds an open pipe to the parent and also is
setpgrp. If/when the pipe sees EOF from the parent dieing, it kills the
process group. This is like pctrl's PDEATHSIG but for a process group
rather than a single process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c3b5c9f..1fd07a8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -124,6 +124,32 @@ class QemuRunner:
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp)
         output = self.runqemu.stdout
 
+        #
+        # We need the preexec_fn above so that all runqemu processes can easily be killed 
+        # (by killing their process group). This presents a problem if this controlling
+        # process itself is killed however since those processes don't notice the death 
+        # of the parent and merrily continue on.
+        #
+        # Rather than hack runqemu to deal with this, we add something here instead. 
+        # Basically we fork off another process which holds an open pipe to the parent
+        # and also is setpgrp. If/when the pipe sees EOF from the parent dieing, it kills
+        # the process group. This is like pctrl's PDEATHSIG but for a process group
+        # rather than a single process.
+        #
+        r, w = os.pipe()
+        self.monitorpid = os.fork()
+        if self.monitorpid:
+            os.close(r)
+            self.monitorpipe = os.fdopen(w, "w")
+        else:
+            # child process
+            os.setpgrp()
+            os.close(w)
+            r = os.fdopen(r)
+            x = r.read()
+            os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
+            sys.exit(0)
+
         logger.info("runqemu started, pid is %s" % self.runqemu.pid)
         logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
@@ -235,6 +261,7 @@ class QemuRunner:
         if self.runqemu:
             signal.signal(signal.SIGCHLD, self.origchldhandler)
             logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+            os.kill(self.monitorpid, signal.SIGKILL)
             logger.info("Sending SIGTERM to runqemu")
             try:
                 os.killpg(self.runqemu.pid, signal.SIGTERM)



