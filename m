Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6461979315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 07:03:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8P7338v015780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 00:03:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 00:03:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2018 15:08:25 +0800
Message-ID: <c4f9106775b1c7d9a0192149bcd5397c8cdf2ad1.1537859224.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1537859224.git.Qi.Chen@windriver.com>
References: <cover.1537859224.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] runqemu: fix handling of SIGTERM and the problem of line wrapping
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
X-List-Received-Date: Tue, 25 Sep 2018 07:03:03 -0000
Content-Type: text/plain

The current handling of SIGTERM is incorrect as the process pid returned
by Popen call with shell setting to True is actualy the shell instead of
the qemu process. So use shlex to split cmd so that we can avoid using
shell=True. This ensures the child process is the actual qemu process.

Also, as we install a SIGTERM handler, we need handle the situation of
qemu terminated by SIGTERM, otherwise we will get ERROR message in such
case.

Besides, we have a problem that after running qemu, the terminal's behavior
is incorrect regarding long lines or long commands. Long commands or long
outputs should appear in multiple lines, but they appear in the same line,
overriding previous output. Use `tput smam' to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 409d17c..087220c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1202,6 +1202,7 @@ class BaseConfig(object):
                 self.qemu_opt += " -serial mon:vc -serial null"
 
     def start_qemu(self):
+        import shlex
         if self.kernel:
             kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
                                                                 self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
@@ -1211,11 +1212,16 @@ class BaseConfig(object):
         else:
             kernel_opts = ""
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
+        cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
-        process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
+        process = subprocess.Popen(cmds, stderr=subprocess.PIPE)
         self.qemupid = process.pid
-        if process.wait():
-            logger.error("Failed to run qemu: %s", process.stderr.read().decode())
+        retcode = process.wait()
+        if retcode:
+            if retcode == -signal.SIGTERM:
+                logger.info("Qemu terminated by SIGTERM")
+            else:
+                logger.error("Failed to run qemu: %s", process.stderr.read().decode())
 
     def cleanup(self):
         if self.cleaned:
@@ -1310,6 +1316,7 @@ def main():
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
+            subprocess.run(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1331,6 +1338,7 @@ def main():
         return 1
     finally:
         config.cleanup()
+        subprocess.run(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
1.9.1


