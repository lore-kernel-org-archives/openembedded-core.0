Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id C56AB78082
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:05:15 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id h64so2366735iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U9LRtsoxOs8RnERvISxto/1X3QN9Swk96f3u8e1WuY8=;
	b=gYSrdbFkWa3R4IilywTsvs5h6T7rOubn4we0mswX3Whur87SxU66wrFO7Bb+yrU9Bw
	e4wOByCBMD70GcF+BCUhkfEGYxD72rlxpOjVSVM8HlOOrahGWX6ei1KPJ3SGfhAcQCaC
	oWmOMOrCE7eIs3OhoJYngTaYxCGa+HtZeNCN20LaxCziUX5JHeGRWL2DJhf6csOk/036
	EKXRR2WGcEeA35f68QDcpGcRsJP1vORioEglP8WuRzqxsbX2ajZMqbge7XgcIK+2BFzw
	gxtvgvuGXC2bYIfRW2w/KDQzHqmdHlLJIWFmeBHPhX+xEi6j4t7mwywa57OElFSPwYgc
	mK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U9LRtsoxOs8RnERvISxto/1X3QN9Swk96f3u8e1WuY8=;
	b=HVpcRmVW+hcu7cG+tvG+0t2zjyItCzUCF9DooRA65a6Y9w3M6AIA3jvoLuHHB1cuqF
	8qF1w4VIOSY9KRnDr0eJJG+gV2GK2oJDvz8GqTU761xSpD8ifPatAqvSBB0BMQ4u5r9T
	5UT6yooDZUyQxLo5C+Z/MFlSywv1TydwGW6OzJYclGg8biJ/5eg8DpvxzFKSTqoMIS0l
	8JXGJe4JXJ5tHE8ZLQ4+EjBDncKE8tgKNozTMAZ/b6f7TBXJ8Y/z9ddW6jounJtgwMkO
	beDjoFCUgDyvaULR1aboKVhDFmsINDIxDlRPCovQ2eEX4R+vnHAnOwGrRxdyYC5kXxEt
	52Ug==
X-Gm-Message-State: AKS2vOyDe8edi4hfu8n9lOpJbOfbUB3wwi3/IAS3+4IKFyFa6aTy2EtF
	D+rUJ8ObJJMS9oEw88I=
X-Received: by 10.107.3.84 with SMTP id 81mr1015110iod.233.1498223116358;
	Fri, 23 Jun 2017 06:05:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DF06.dip0.t-ipconnect.de.
	[93.232.223.6]) by smtp.gmail.com with ESMTPSA id
	a191sm2966083ioe.1.2017.06.23.06.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jun 2017 06:05:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:05:02 +0200
Message-Id: <3a1d8e8b0b126051961e61b1ad50765392529a79.1498223057.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.15cc4e9137e8e3a07cae0cf09e9e2f2e4bcefa56.1498223057.git-series.patrick.ohly@intel.com>
References: <cover.15cc4e9137e8e3a07cae0cf09e9e2f2e4bcefa56.1498223057.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] commands.py: live output logging + result.error encoding fix
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
X-List-Received-Date: Fri, 23 Jun 2017 13:05:15 -0000

Tests that use bitbake("my-test-image") can run for a long time
without any indication to the user of oe-selftest about what's going
on. The test author has to log the bitbake output explicitly,
otherwise it is lost in case of test failures.

Now it is possible to use bitbake("my-test-image",
output_log=self.logger) to get more output both on the console and in
the XML output (when xmlrunner is installed). Example output:

2017-06-23 12:23:14,144 - oe-selftest - INFO - Running tests...
2017-06-23 12:23:14,145 - oe-selftest - INFO - ----------------------------------------------------------------------
2017-06-23 12:23:14,151 - oe-selftest - INFO - Running: bitbake my-test-image
2017-06-23 12:23:16,363 - oe-selftest - INFO - Loading cache...done.
2017-06-23 12:23:17,575 - oe-selftest - INFO - Loaded 3529 entries from dependency cache.
2017-06-23 12:23:18,811 - oe-selftest - INFO - Parsing recipes...done.
2017-06-23 12:23:19,659 - oe-selftest - INFO - Parsing of 2617 .bb files complete (2612 cached, 5 parsed). 3533 targets, 460 skipped, 0 masked, 0 errors.
2017-06-23 12:23:19,659 - oe-selftest - INFO - NOTE: Resolving any missing task queue dependencies

Because the implementation was already using threading, the same is
done to decouple reading and writing the different pipes instead of
trying to multiplex IO in a single thread.

The most common case (no input data, joined stdout/stderr) still uses
one extra thread and a single read(), so performance should be roughly
the same as before.

Probably unintentionally, result.error was left as byte string when
migrating to Python3. OE-core doesn't seem to use runCmd() with split
output at the moment, so changing result.error to be treated the same
as result.output (i.e. decoded to a normal strings) seems like a
relatively safe API change (or rather, implementation fix).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 103 ++++++++++++++++++++++++++-------
 1 file changed, 82 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 57286fc..cc93448 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -13,6 +13,7 @@ import sys
 import signal
 import subprocess
 import threading
+import time
 import logging
 from oeqa.utils import CommandError
 from oeqa.utils import ftools
@@ -25,7 +26,7 @@ except ImportError:
     pass
 
 class Command(object):
-    def __init__(self, command, bg=False, timeout=None, data=None, **options):
+    def __init__(self, command, bg=False, timeout=None, data=None, output_log=None, **options):
 
         self.defaultopts = {
             "stdout": subprocess.PIPE,
@@ -48,40 +49,100 @@ class Command(object):
         self.options.update(options)
 
         self.status = None
+        # We collect chunks of output before joining them at the end.
+        self._output_chunks = []
+        self._error_chunks = []
         self.output = None
         self.error = None
-        self.thread = None
+        self.threads = []
 
+        self.output_log = output_log
         self.log = logging.getLogger("utils.commands")
 
     def run(self):
         self.process = subprocess.Popen(self.cmd, **self.options)
 
-        def commThread():
-            self.output, self.error = self.process.communicate(self.data)
-
-        self.thread = threading.Thread(target=commThread)
-        self.thread.start()
+        def readThread(output, stream, logfunc):
+            if logfunc:
+                for line in stream:
+                    output.append(line)
+                    logfunc(line.decode("utf-8", errors='replace').rstrip())
+            else:
+                output.append(stream.read())
+
+        def readStderrThread():
+            readThread(self._error_chunks, self.process.stderr, self.output_log.error if self.output_log else None)
+
+        def readStdoutThread():
+            readThread(self._output_chunks, self.process.stdout, self.output_log.info if self.output_log else None)
+
+        def writeThread():
+            try:
+                self.process.stdin.write(self.data)
+                self.process.stdin.close()
+            except OSError as ex:
+                # It's not an error when the command does not consume all
+                # of our data. subprocess.communicate() also ignores that.
+                if ex.errno != EPIPE:
+                    raise
+
+        # We write in a separate thread because then we can read
+        # without worrying about deadlocks. The additional thread is
+        # expected to terminate by itself and we mark it as a daemon,
+        # so even it should happen to not terminate for whatever
+        # reason, the main process will still exit, which will then
+        # kill the write thread.
+        if self.data:
+            threading.Thread(target=writeThread, daemon=True).start()
+        if self.process.stderr:
+            thread = threading.Thread(target=readStderrThread)
+            thread.start()
+            self.threads.append(thread)
+        if self.output_log:
+            self.output_log.info('Running: %s' % self.cmd)
+        thread = threading.Thread(target=readStdoutThread)
+        thread.start()
+        self.threads.append(thread)
 
         self.log.debug("Running command '%s'" % self.cmd)
 
         if not self.bg:
-            self.thread.join(self.timeout)
+            if self.timeout is None:
+                for thread in self.threads:
+                    thread.join()
+            else:
+                deadline = time.time() + self.timeout
+                for thread in self.threads:
+                    timeout = deadline - time.time() 
+                    if timeout < 0:
+                        timeout = 0
+                    thread.join(timeout)
             self.stop()
 
     def stop(self):
-        if self.thread.isAlive():
-            self.process.terminate()
+        for thread in self.threads:
+            if thread.isAlive():
+                self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
-            self.thread.join(5)
-            if self.thread.isAlive():
+            thread.join(5)
+            if thread.isAlive():
                 self.process.kill()
-                self.thread.join()
+                thread.join()
 
-        if not self.output:
-            self.output = ""
-        else:
-            self.output = self.output.decode("utf-8", errors='replace').rstrip()
+        def finalize_output(data):
+            if not data:
+                data = ""
+            else:
+                data = b"".join(data)
+                data = data.decode("utf-8", errors='replace').rstrip()
+            return data
+
+        self.output = finalize_output(self._output_chunks)
+        self._output_chunks = None
+        # self.error used to be a byte string earlier, probably unintentionally.
+        # Now it is a normal string, just like self.output.
+        self.error = finalize_output(self._error_chunks)
+        self._error_chunks = None
         self.status = self.process.poll()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
@@ -98,7 +159,7 @@ class Result(object):
 
 
 def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
-          native_sysroot=None, limit_exc_output=0, **options):
+          native_sysroot=None, limit_exc_output=0, output_log=None, **options):
     result = Result()
 
     if native_sysroot:
@@ -108,7 +169,7 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
         nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
         options['env'] = nenv
 
-    cmd = Command(command, timeout=timeout, **options)
+    cmd = Command(command, timeout=timeout, output_log=output_log, **options)
     cmd.run()
 
     result.command = command
@@ -132,7 +193,7 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
     return result
 
 
-def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **options):
+def bitbake(command, ignore_status=False, timeout=None, postconfig=None, output_log=None, **options):
 
     if postconfig:
         postconfig_file = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
@@ -147,7 +208,7 @@ def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **optio
         cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
 
     try:
-        return runCmd(cmd, ignore_status, timeout, **options)
+        return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
     finally:
         if postconfig:
             os.remove(postconfig_file)
-- 
git-series 0.9.1

