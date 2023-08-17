Return-Path: <jtilahun@astranis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8794DEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 06:13:17 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.180868.1692252793824131397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 23:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@astranis.com header.s=google header.b=ShX/EsaO;
 spf=pass (domain: astranis.com, ip: 209.85.222.182, mailfrom: jtilahun@astranis.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76d80d35762so7461985a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 23:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=astranis.com; s=google; t=1692252793; x=1692857593;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RtlGwIv3qr7YGNSKn2EO363p4Ao+94S6Ukk+ghQChuQ=;
        b=ShX/EsaOH9nwOe+oQREwKe3W3VqEpKX+dXQAftzjhSkO2KhFTeSbJ4qBb3msqzkYzB
         aTxYUzoSDlejh4OHRy7i8C+wZmIqWsjt7pe87UcREWWrKKgaM9KvZs3ZBsB1xS03J4Vn
         JR+hdcvcqyh1vGd3vCoeoldzC1pZZU82jfk5OjrvGTcb0W3eBynSHi4Ri8Qx50SA5QLg
         LdStiztRtoyclMfMmMnEpXUZu1bXfaCWEaKU8Ckks/jUpoDTS1ulrsyod4v4iuDftL4o
         dxpz6x2KUHl8b1slozcZ19c8r45eYgLX/cuqmOvrAW9pRpKjgfVQXDWyGVio8SQiWuOG
         uisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692252793; x=1692857593;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtlGwIv3qr7YGNSKn2EO363p4Ao+94S6Ukk+ghQChuQ=;
        b=DDKEEQmiaiTc3LOuM44vDfYCdhd+XgpheaBbSOd33s5EzSn4c7sIL9fkE8NQGmNDMc
         3FzhjFtAsqGSt2hZUDQoi12newbvXVgSUrFoKEUO1VlYOkeuukunnQvCRNSFVzI4LNZO
         yJZ9BL+SVuu8qk8BDnWRnA4E9HW0Qlql5z8Xgy7RkkzlHsJLGcZVlRPEk+sDUSaEQ55Q
         Wv8TsMNizQmrRdPXUNXsv5oEae2UHN+gJ6R1STB8vWZM1AXDbXp2b0/7RYw/NGF0BMHx
         0fN2L3f1t6UvVtgqBmJsxdGSsvkIIxpUK3I9RsYoIZrSNuffWixGNITD/GTYclF38eHV
         9YeA==
X-Gm-Message-State: AOJu0Yyw3U1956PLkv5SODD/fU0wncSXiLa8kriThjmppvnyaeemFACu
	88AIFJLsIJ/Ew2avMHQtaLk0CMtQIpRpEP5MAhSoV0Q9lwK98xEeiws2Q/2EhNp417/cimJU4ka
	n9lCVTA7mSEpc7n4L2/JNKc1Hlvru+zUDh+9REV5dh3AUhmjK175gwW0g5kXq6TeTr9VcAispBq
	0Pdpx6pdxFda5zyQeLtUbWt3zTR+a1
X-Google-Smtp-Source: AGHT+IEum+w6cescvSmzVq3XmdLFU0QMgtWXU6PQuF7xp2j4J5NrPDTWQoUwqymRG976q5IkCK6IvQ==
X-Received: by 2002:ae9:e711:0:b0:76d:4a15:6f53 with SMTP id m17-20020ae9e711000000b0076d4a156f53mr4103657qka.25.1692252792293;
        Wed, 16 Aug 2023 23:13:12 -0700 (PDT)
Received: from JTN86G3.attlocal.net ([2600:1700:43b0:1fc0:8c29:b286:89a3:8069])
        by smtp.gmail.com with ESMTPSA id bt24-20020a632918000000b00528db73ed70sm13233146pgb.3.2023.08.16.23.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 23:13:11 -0700 (PDT)
From: jtilahun@astranis.com
To: openembedded-core@lists.openembedded.org
Cc: Joseph Tilahun <jtilahun@astranis.com>
Subject: [PATCH] time: use the monotonic clock to compute time elapsed
Date: Wed, 16 Aug 2023 23:11:49 -0700
Message-Id: <20230817061149.503336-1-jtilahun@astranis.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 06:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186288

From: Joseph Tilahun <jtilahun@astranis.com>

The monotonic clock is preferable over the system clock when computing the time elapsed.

Signed-off-by: Joseph Tilahun <jtilahun@astranis.com>
---
 meta/classes-global/buildstats.bbclass        |  4 +--
 meta/classes/buildhistory.bbclass             |  4 +--
 meta/lib/oeqa/core/context.py                 |  4 +--
 meta/lib/oeqa/core/runner.py                  |  4 +--
 meta/lib/oeqa/core/target/ssh.py              | 14 ++++----
 meta/lib/oeqa/runtime/cases/ltp.py            |  4 +--
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  4 +--
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  4 +--
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  4 +--
 meta/lib/oeqa/runtime/cases/rpm.py            |  4 +--
 meta/lib/oeqa/runtime/cases/systemd.py        |  4 +--
 meta/lib/oeqa/selftest/cases/binutils.py      |  4 +--
 meta/lib/oeqa/selftest/cases/gcc.py           |  4 +--
 meta/lib/oeqa/selftest/cases/glibc.py         |  4 +--
 meta/lib/oeqa/selftest/cases/runcmd.py        | 12 +++----
 meta/lib/oeqa/selftest/cases/rust.py          |  4 +--
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  4 +--
 meta/lib/oeqa/utils/commands.py               |  4 +--
 meta/lib/oeqa/utils/qemurunner.py             | 34 +++++++++----------
 meta/lib/oeqa/utils/qemutinyrunner.py         |  8 ++---
 meta/lib/oeqa/utils/sshcontrol.py             | 10 +++---
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  4 +--
 22 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
index f49a67aa4f..1abd52c72a 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -64,7 +64,7 @@ def get_timedata(var, d, end_time):
 
 def set_buildtimedata(var, d):
     import time
-    time = time.time()
+    time = time.monotonic()
     cputime = get_cputime()
     proctime = get_buildprocess_cputime(os.getpid())
     d.setVar(var, (time, cputime, proctime))
@@ -77,7 +77,7 @@ def get_buildtimedata(var, d):
     oldtime, oldcpu, oldproc = timedata
     procdiff = get_buildprocess_cputime(os.getpid()) - oldproc
     cpudiff = get_cputime() - oldcpu
-    end_time = time.time()
+    end_time = time.monotonic()
     timediff = end_time - oldtime
     if cpudiff > 0:
         cpuperc = float(procdiff) * 100 / cpudiff
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 395f594278..ba8dfd7d63 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -892,13 +892,13 @@ python buildhistory_eventhandler() {
                 bb.note("Writing buildhistory")
                 bb.build.exec_func("buildhistory_write_sigs", d)
                 import time
-                start=time.time()
+                start=time.monotonic()
                 localdata = bb.data.createCopy(e.data)
                 localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
                 interrupted = getattr(e, '_interrupted', 0)
                 localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
                 bb.build.exec_func("buildhistory_commit", localdata)
-                stop=time.time()
+                stop=time.monotonic()
                 bb.note("Writing buildhistory took: %s seconds" % round(stop-start))
             else:
                 bb.note("No commit since BUILDHISTORY_COMMIT != '1'")
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9313271f58..019d931894 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -84,12 +84,12 @@ class OETestContext(object):
         # Dynamically skip those tests specified though arguments
         self.skipTests(skips)
 
-        self._run_start_time = time.time()
+        self._run_start_time = time.monotonic()
         self._run_end_time = self._run_start_time
         if not processes:
             self.runner.buffer = True
         result = self.runner.run(self.prepareSuite(self.suites, processes))
-        self._run_end_time = time.time()
+        self._run_end_time = time.monotonic()
 
         return result
 
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 5077eb8e3e..2580732dbc 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -56,11 +56,11 @@ class OETestResult(_TestResult):
     def startTest(self, test):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
-            self.starttime[test.id()] = time.time()
+            self.starttime[test.id()] = time.monotonic()
         super(OETestResult, self).startTest(test)
 
     def stopTest(self, test):
-        self.endtime[test.id()] = time.time()
+        self.endtime[test.id()] = time.monotonic()
         if self.buffer:
             self.logged_output[test.id()] = (
                     sys.stdout.getvalue(), sys.stderr.getvalue())
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f22836d390..f5f68a28b7 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -72,10 +72,10 @@ class OESSHTarget(OETarget):
         """
         self.logger.debug("[Running]$ %s" % " ".join(command))
 
-        starttime = time.time()
+        starttime = time.monotonic()
         status, output = SSHCall(command, self.logger, timeout)
         self.logger.debug("[Command returned '%d' after %.2f seconds]"
-                 "" % (status, time.time() - starttime))
+                 "" % (status, time.monotonic() - starttime))
 
         if status and not ignore_status:
             raise AssertionError("Command '%s' returned non-zero exit "
@@ -230,15 +230,15 @@ def SSHCall(command, logger, timeout=None, **opts):
         nonlocal output
         nonlocal process
         output_raw = b''
-        starttime = time.time()
+        starttime = time.monotonic()
         process = subprocess.Popen(command, **options)
         if timeout:
             endtime = starttime + timeout
             eof = False
             os.set_blocking(process.stdout.fileno(), False)
-            while time.time() < endtime and not eof:
+            while time.monotonic() < endtime and not eof:
                 try:
-                    logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.time(), endtime))
+                    logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.monotonic(), endtime))
                     if select.select([process.stdout], [], [], 5)[0] != []:
                         # wait a bit for more data, tries to avoid reading single characters
                         time.sleep(0.2)
@@ -249,7 +249,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             output_raw += data
                             # ignore errors to capture as much as possible
                             logger.debug('Partial data from SSH call:\n%s' % data.decode('utf-8', errors='ignore'))
-                            endtime = time.time() + timeout
+                            endtime = time.monotonic() + timeout
                 except InterruptedError:
                     logger.debug('InterruptedError')
                     continue
@@ -268,7 +268,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
-                endtime = time.time() - starttime
+                endtime = time.monotonic() - starttime
                 lastline = ("\nProcess killed - no output for %d seconds. Total"
                             " running time: %d seconds." % (timeout, endtime))
                 logger.debug('Received data from SSH call:\n%s ' % lastline)
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index c7e79438a4..4071679b6a 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -70,9 +70,9 @@ class LtpTest(LtpTestBase):
 
             cmd = '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
 
-            starttime = time.time()
+            starttime = time.monotonic()
             (status, output) = self.target.run(cmd, timeout=1200)
-            endtime = time.time()
+            endtime = time.monotonic()
 
             # status of 1 is 'just' tests failing. 255 likely was a command output timeout 
             if status and status != 1:
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index ba47c78fd4..1a1d69a958 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -61,9 +61,9 @@ class LtpPosixTest(LtpPosixBase):
 
     def runltp(self, posix_group):
             cmd = "/opt/ltp/bin/run-posix-option-group-test.sh %s 2>@1 | tee /opt/ltp/results/%s" % (posix_group, posix_group)
-            starttime = time.time()
+            starttime = time.monotonic()
             (status, output) = self.target.run(cmd)
-            endtime = time.time()
+            endtime = time.monotonic()
 
             with open(os.path.join(self.ltptest_log_dir, "%s" % posix_group), 'w') as f:
                 f.write(output)
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
index ce6f4bf59d..7630555a8b 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -61,9 +61,9 @@ class LtpStressTest(LtpStressBase):
 
     def runltp(self, stress_group):
             cmd = '/opt/ltp/runltp -f %s -p -q 2>@1 | tee /opt/ltp/results/%s' % (stress_group, stress_group)
-            starttime = time.time()
+            starttime = time.monotonic()
             (status, output) = self.target.run(cmd)
-            endtime = time.time()
+            endtime = time.monotonic()
             with open(os.path.join(self.ltptest_log_dir, "%s" % stress_group), 'w') as f:
                 f.write(output)
 
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index cad0c88d26..77d49cb9f2 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -56,11 +56,11 @@ class SyslogTestConfig(OERuntimeTestCase):
             return True
 
         # Always check for an error, most likely a race between shutting down and starting up
-        timeout = time.time() + 30
+        timeout = time.monotonic() + 30
 
         restarted = False
         status = ""
-        while time.time() < timeout:
+        while time.monotonic() < timeout:
             # Verify the previous ones are no longer running
             status = self.verif_not_running(original_pids)
             if status:
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index a4ba4e6769..1ac7ea66b8 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -52,8 +52,8 @@ class RpmBasicTest(OERuntimeTestCase):
             self.assertEqual(status, 0, msg=msg)
 
         def wait_for_no_process_for_user(u, timeout = 120):
-            timeout_at = time.time() + timeout
-            while time.time() < timeout_at:
+            timeout_at = time.monotonic() + timeout
+            while time.monotonic() < timeout_at:
                 _, output = self.target.run(self.tc.target_cmds['ps'])
                 if u + ' ' not in output:
                     return
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 37f295492d..a18206745d 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -66,12 +66,12 @@ class SystemdBasicTests(SystemdTest):
         activating, or (False, message string) if there are still units
         activating (generally, failing units that restart).
         """
-        endtime = time.time() + (60 * 2)
+        endtime = time.monotonic() + (60 * 2)
         while True:
             status, output = self.target.run('SYSTEMD_BUS_TIMEOUT=240s systemctl --state=activating')
             if "0 loaded units listed" in output:
                 return (True, '')
-            if time.time() >= endtime:
+            if time.monotonic() >= endtime:
                 return (False, output)
             time.sleep(10)
 
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 1688eabe4e..6d9ff21762 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -37,11 +37,11 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
         builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
 
-        start_time = time.time()
+        start_time = time.monotonic()
 
         bitbake("{0} -c check".format(recipe))
 
-        end_time = time.time()
+        end_time = time.monotonic()
 
         sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
         if not os.path.exists(sumspath):
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 89360178fe..8171415a38 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -45,11 +45,11 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
         recipe = "gcc-runtime"
 
-        start_time = time.time()
+        start_time = time.monotonic()
 
         bitbake("{} -c check".format(recipe))
 
-        end_time = time.time()
+        end_time = time.monotonic()
 
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index bd56b2f6e7..34a0ddf69d 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -32,11 +32,11 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
-        start_time = time.time()
+        start_time = time.monotonic()
 
         bitbake("glibc-testsuite -c check")
 
-        end_time = time.time()
+        end_time = time.monotonic()
 
         builddir = get_bb_var("B", "glibc-testsuite")
 
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 6fd96b8485..7137910e0e 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -77,21 +77,21 @@ class RunCmdTests(OESelftestTestCase):
 
     def test_timeout(self):
         numthreads = threading.active_count()
-        start = time.time()
+        start = time.monotonic()
         # Killing a hanging process only works when not using a shell?!
         result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
-        end = time.time()
+        end = time.monotonic()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_timeout_split(self):
         numthreads = threading.active_count()
-        start = time.time()
+        start = time.monotonic()
         # Killing a hanging process only works when not using a shell?!
         result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, stderr=subprocess.PIPE, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
-        end = time.time()
+        end = time.monotonic()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
@@ -104,10 +104,10 @@ class RunCmdTests(OESelftestTestCase):
 
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
-        start = time.time()
+        start = time.monotonic()
         result = runCmd(['sleep', '60'], data=b"hello world", timeout=self.TIMEOUT, ignore_status=True, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
-        end = time.time()
+        end = time.monotonic()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7d148142fc..76827fa7a9 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -41,7 +41,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # build remote-test-server before image build
         recipe = "rust"
-        start_time = time.time()
+        start_time = time.monotonic()
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
@@ -291,7 +291,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
             cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
             runCmd(cmd)
-            end_time = time.time()
+            end_time = time.monotonic()
 
             ptestsuite = "rust"
             self.ptest_section(ptestsuite, duration = int(end_time - start_time), logfile = builddir + "/summary.txt")
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index dd13c20402..7cf3ac218b 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -114,10 +114,10 @@ class TinfoilTests(OESelftestTestCase):
 
             eventreceived = False
             commandcomplete = False
-            start = time.time()
+            start = time.monotonic()
             # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
             while (not (eventreceived == True and commandcomplete == True) 
-                    and (time.time() - start < 60)):
+                    and (time.monotonic() - start < 60)):
                 # if we received both events (on let's say a good day), we are done  
                 event = tinfoil.wait_event(1)
                 if event:
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index c1f533802e..283bdda194 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -113,9 +113,9 @@ class Command(object):
                 for thread in self.threads:
                     thread.join()
             else:
-                deadline = time.time() + self.timeout
+                deadline = time.monotonic() + self.timeout
                 for thread in self.threads:
-                    timeout = deadline - time.time()
+                    timeout = deadline - time.monotonic()
                     if timeout < 0:
                         timeout = 0
                     thread.join(timeout)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 22cf258ddd..46cc75754f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -243,7 +243,7 @@ class QemuRunner:
         # to be a proper fix but this will suffice for now.
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env, cwd=self.tmpdir)
         output = self.runqemu.stdout
-        launch_time = time.time()
+        launch_time = time.monotonic()
 
         #
         # We need the preexec_fn above so that all runqemu processes can easily be killed
@@ -274,8 +274,8 @@ class QemuRunner:
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
         self.logger.debug("waiting at most %d seconds for qemu pid (%s)" %
                           (self.runqemutime, time.strftime("%D %H:%M:%S")))
-        endtime = time.time() + self.runqemutime
-        while not self.is_alive() and time.time() < endtime:
+        endtime = time.monotonic() + self.runqemutime
+        while not self.is_alive() and time.monotonic() < endtime:
             if self.runqemu.poll():
                 if self.runqemu_exited:
                     self.logger.warning("runqemu during is_alive() test")
@@ -336,8 +336,8 @@ class QemuRunner:
             self.logger.debug("QMP Connecting to %s" % (qmp_port))
             if not os.path.exists(qmp_port) and self.is_alive():
                 self.logger.debug("QMP Port does not exist waiting for it to be created")
-                endtime = time.time() + self.runqemutime
-                while not os.path.exists(qmp_port) and self.is_alive() and time.time() < endtime:
+                endtime = time.monotonic() + self.runqemutime
+                while not os.path.exists(qmp_port) and self.is_alive() and time.monotonic() < endtime:
                     self.logger.info("QMP port does not exist yet!")
                     time.sleep(0.5)
                 if not os.path.exists(qmp_port) and self.is_alive():
@@ -348,10 +348,10 @@ class QemuRunner:
                 # set timeout value for all QMP calls
                 self.qmp.settimeout(self.runqemutime)
                 self.qmp.connect()
-                connect_time = time.time()
+                connect_time = time.monotonic()
                 self.logger.info("QMP connected to QEMU at %s and took %.2f seconds" %
                                   (time.strftime("%D %H:%M:%S"),
-                                   time.time() - launch_time))
+                                   time.monotonic() - launch_time))
             except OSError as msg:
                 self.logger.warning("Failed to connect qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
@@ -385,13 +385,13 @@ class QemuRunner:
         self.run_monitor('cont')
         self.logger.info("QMP released QEMU at %s and took %.2f seconds from connect" %
                           (time.strftime("%D %H:%M:%S"),
-                           time.time() - connect_time))
+                           time.monotonic() - connect_time))
 
         # We are alive: qemu is running
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
         self.logger.debug("qemu started in %.2f seconds - qemu procces pid is %s (%s)" %
-                          (time.time() - (endtime - self.runqemutime),
+                          (time.monotonic() - (endtime - self.runqemutime),
                            self.qemupid, time.strftime("%D %H:%M:%S")))
         cmdline = ''
         if get_ip:
@@ -444,14 +444,14 @@ class QemuRunner:
         self.logger.debug("Output from runqemu:\n%s", out)
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
-        endtime = time.time() + self.boottime
+        endtime = time.monotonic() + self.boottime
         filelist = [self.server_socket, self.runqemu.stdout]
         reachedlogin = False
         stopread = False
         qemusock = None
         bootlog = b''
         data = b''
-        while time.time() < endtime and not stopread:
+        while time.monotonic() < endtime and not stopread:
             try:
                 sread, swrite, serror = select.select(filelist, [], [], 5)
             except InterruptedError:
@@ -491,7 +491,7 @@ class QemuRunner:
                             stopread = True
                             reachedlogin = True
                             self.logger.debug("Reached login banner in %.2f seconds (%s)" %
-                                              (time.time() - (endtime - self.boottime),
+                                              (time.monotonic() - (endtime - self.boottime),
                                               time.strftime("%D %H:%M:%S")))
                     else:
                         # no need to check if reachedlogin unless we support multiple connections
@@ -502,7 +502,7 @@ class QemuRunner:
                         stopread = True
 
         if not reachedlogin:
-            if time.time() >= endtime:
+            if time.monotonic() >= endtime:
                 self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
@@ -617,8 +617,8 @@ class QemuRunner:
         if os.path.isfile(self.qemu_pidfile):
             # when handling pidfile, qemu creates the file, stat it, lock it and then write to it
             # so it's possible that the file has been created but the content is empty
-            pidfile_timeout = time.time() + 3
-            while time.time() < pidfile_timeout:
+            pidfile_timeout = time.monotonic() + 3
+            while time.monotonic() < pidfile_timeout:
                 with open(self.qemu_pidfile, 'r') as f:
                     qemu_pid = f.read().strip()
                 # file created but not yet written contents
@@ -649,10 +649,10 @@ class QemuRunner:
         data = ''
         status = 0
         self.server_socket.sendall(command.encode('utf-8'))
-        start = time.time()
+        start = time.monotonic()
         end = start + timeout
         while True:
-            now = time.time()
+            now = time.monotonic()
             if now >= end:
                 data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
                 break
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 20009401ca..9727d57288 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -98,8 +98,8 @@ class QemuTinyRunner(QemuRunner):
 
         bb.note("runqemu started, pid is %s" % self.runqemu.pid)
         bb.note("waiting at most %s seconds for qemu pid" % self.runqemutime)
-        endtime = time.time() + self.runqemutime
-        while not self.is_alive() and time.time() < endtime:
+        endtime = time.monotonic() + self.runqemutime
+        while not self.is_alive() and time.monotonic() < endtime:
             time.sleep(1)
 
         if self.is_alive():
@@ -119,8 +119,8 @@ class QemuTinyRunner(QemuRunner):
         data = ''
         status = 0
         stopread = False
-        endtime = time.time()+timeout
-        while time.time()<endtime and not stopread:
+        endtime = time.monotonic()+timeout
+        while time.monotonic()<endtime and not stopread:
                 try:
                         sread, _, _ = select.select([self.server_socket],[],[],1)
                 except InterruptedError:
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 36c2ecb3db..5b41418d65 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -46,13 +46,13 @@ class SSHProcess(object):
 
     def _run(self, command, timeout=None, logfile=None):
         self.logfile = logfile
-        self.starttime = time.time()
+        self.starttime = time.monotonic()
         output = ''
         self.process = subprocess.Popen(command, **self.options)
         if timeout:
             endtime = self.starttime + timeout
             eof = False
-            while time.time() < endtime and not eof:
+            while time.monotonic() < endtime and not eof:
                 try:
                     if select.select([self.process.stdout], [], [], 5)[0] != []:
                         data = os.read(self.process.stdout.fileno(), 1024)
@@ -63,7 +63,7 @@ class SSHProcess(object):
                             data = data.decode("utf-8")
                             output += data
                             self.log(data)
-                            endtime = time.time() + timeout
+                            endtime = time.monotonic() + timeout
                 except InterruptedError:
                     continue
 
@@ -75,7 +75,7 @@ class SSHProcess(object):
                     self.process.kill()
                 except OSError:
                     pass
-                lastline = "\nProcess killed - no output for %d seconds. Total running time: %d seconds." % (timeout, time.time() - self.starttime)
+                lastline = "\nProcess killed - no output for %d seconds. Total running time: %d seconds." % (timeout, time.monotonic() - self.starttime)
                 self.log(lastline)
                 output += lastline
         else:
@@ -126,7 +126,7 @@ class SSHControl(object):
         proc = SSHProcess()
         status, output = proc.run(command, timeout, logfile=self.logfile)
 
-        self.log("[Command returned '%d' after %.2f seconds]" % (status, time.time() - proc.starttime))
+        self.log("[Command returned '%d' after %.2f seconds]" % (status, time.monotonic() - proc.starttime))
 
         if status and not ignore_status:
             raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 3b84447a0f..1b417c2bd4 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -321,7 +321,7 @@ def run_cyclictest_suite():
 
         log()
         log_ts("Start of execution")
-        t = time.time()
+        t = time.monotonic()
         max_list = []
 
         for i in range(0, suite_size):
@@ -343,7 +343,7 @@ def run_cyclictest_suite():
                 ack_avg[0] += tmp_avg[0]
                 ack_avg[1] += tmp_avg[1]
 
-        t = time.time()-t
+        t = time.monotonic()-t
         log_ts("Cyclictest completed. Actual execution time:",
                us2hms_str(t*1000000))
         log()
-- 
2.25.1


-- 


________
This email and any attachments may contain Astranis confidential 
and/or proprietary information governed by a non-disclosure agreement, and 
are intended solely for the individual or entity specified by the message.

