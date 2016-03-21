Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BF06C60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:15:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 21 Mar 2016 09:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="938475654"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2016 09:15:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Mon, 21 Mar 2016 18:15:07 +0200
Message-Id: <1458576907-28315-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1458576907-28315-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1458576907-28315-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [RFC PATCH] oe/gpg_sign: use our own immplementation of pexpect
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
X-List-Received-Date: Mon, 21 Mar 2016 16:15:15 -0000

Implement a simple python-expect replacement in order to get rid of the
(currently undocumented) external dependency. Pexpect is only used for
rpm package signing.

[YOCTO #9304]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 104 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index e738397..9887c1d 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -1,9 +1,87 @@
 """Helper module for GPG signing"""
 import os
+import time
 
 import bb
 import oe.utils
 
+
+class Pexpect(object):
+    """Naive and limited (p)expect functionality"""
+    class PexpectErr(Exception):
+        """Pexpect error"""
+        pass
+
+    def __init__(self, cmd):
+        import pty
+        self.pid, self.fd = pty.fork()
+        if self.pid == 0:
+            os.execv(cmd[0], cmd)
+        self.status = None
+        self.buf = ''
+        self.buf_readp = 0
+
+    def check_exitstatus(self):
+        """Return child status or None if still alive"""
+        if self.status is None:
+            pid, status = os.waitpid(self.pid, os.WNOHANG)
+            if pid != 0:
+                self.status = status
+        return self.status
+
+    def close(self):
+        """Close connection and terminate our child"""
+        import signal
+        if self.fd == -1:
+            return
+        os.close(self.fd)
+        self.fd = -1
+        time.sleep(0.1)
+
+        # Kill child process if it's still alive
+        if self.check_exitstatus() is None:
+            os.kill(self.pid, signal.SIGHUP)
+            # Give the process some time to terminate peacefully
+            time.sleep(0.5)
+            if self.check_exitstatus() is None:
+                os.kill(self.pid, signal.SIGKILL)
+                time.sleep(0.5)
+                if self.check_exitstatus() is None:
+                    bb.warn('Failed to kill PID %d' % self.pid)
+
+    def expect_exact(self, expected, timeout):
+        """Wait until expected output is detected. Use None to wait until EOF"""
+        import errno
+        import select
+        end_time = time.time() + timeout
+        while time.time() < end_time:
+            ready = select.select([self.fd], [], [], end_time - time.time())
+            if ready[0]:
+                try:
+                    self.buf += os.read(self.fd, 4096)
+                except OSError as err:
+                    if err.errno == errno.EIO:
+                        if expected is None:
+                            return
+                        else:
+                            raise self.PexpectErr("Unexpected EOF")
+                    raise
+                if expected is not None:
+                    ind = self.buf.find(expected, self.buf_readp)
+                    if ind >= 0:
+                        self.buf_readp = ind + len(expected)
+                        return
+                    elif len(self.buf) > len(expected):
+                        # No need to search from beginning of buf every time
+                        self.buf_readp = len(self.buf) - len(expected)
+        raise self.PexpectErr("Timeout")
+
+    def sendline(self, data):
+        """Write data to child proces stdin"""
+        os.write(self.fd, data)
+        os.write(self.fd, '\n')
+
+
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
     def __init__(self, d):
@@ -28,28 +106,26 @@ class LocalSigner(object):
 
     def sign_rpms(self, files, keyid, passphrase_file):
         """Sign RPM files"""
-        import pexpect
-
-        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s' " % keyid
+        cmd = [self.rpm_bin, '--addsign', '--define', '_gpg_name ' + keyid]
         if self.gpg_bin:
-            cmd += "--define '%%__gpg %s' " % self.gpg_bin
+            cmd += ['--define', '__gpg ' + self.gpg_bin]
         if self.gpg_path:
-            cmd += "--define '_gpg_path %s' " % self.gpg_path
-        cmd += ' '.join(files)
+            cmd += ['--define', '_gpg_path ' + self.gpg_path]
+        cmd += files
 
         # Need to use pexpect for feeding the passphrase
-        proc = pexpect.spawn(cmd)
+        proc = Pexpect(cmd)
         try:
             proc.expect_exact('Enter pass phrase:', timeout=15)
             with open(passphrase_file) as fobj:
                 proc.sendline(fobj.readline().rstrip('\n'))
-            proc.expect(pexpect.EOF, timeout=900)
-            proc.close()
-        except pexpect.TIMEOUT as err:
-            bb.error('rpmsign timeout: %s' % err)
-            proc.terminate()
-        if os.WEXITSTATUS(proc.status) or not os.WIFEXITED(proc.status):
-            bb.error('rpmsign failed: %s' % proc.before.strip())
+            proc.expect_exact(None, timeout=900)
+        except Pexpect.PexpectErr as err:
+            bb.error('rpmsign unexpected output: %s' % err)
+        proc.close()
+        status = proc.check_exitstatus()
+        if os.WEXITSTATUS(status) or not os.WIFEXITED(status):
+            bb.error('rpmsign failed: %s' % proc.buf[proc.buf_readp:])
             raise bb.build.FuncFailed("Failed to sign RPM packages")
 
 
-- 
2.6.2


