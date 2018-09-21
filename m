Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2ED75541
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 02:30:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8L2U1NB015372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:30:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 20 Sep 2018 19:30:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Sep 2018 10:34:56 +0800
Message-ID: <ea5c83494de6b425efc4e2307adcd2896064bf91.1537497265.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1537497265.git.Qi.Chen@windriver.com>
References: <cover.1537497265.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: fix handling of SIGTERM and the problem of line wrapping
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
X-List-Received-Date: Fri, 21 Sep 2018 02:30:01 -0000
Content-Type: text/plain

The current handling of SIGTERM is incorrect as the process pid returned
by Popen call with shell setting to True is actualy the shell instead of
the qemu binary. So fix to send SIGTERM to the process group of runqemu.
This ensures that all processes in the same process group, including the
shell and the qemu process, will receive SIGTERM.

Also, as we install a SIGTERM handler, we need handle the situation of
qemu terminated by SIGTERM, otherwise we will get ERROR message in such
case.

Besides, we have a problem that after running qemu, the terminal's behavior
is incorrect regarding long lines or long commands. Long commands or long
outputs should appear in multiple lines, but they appear in the same line,
overriding previous output. Use `tput smam' to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 409d17c..bc2aba5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1213,9 +1213,12 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         logger.info('Running %s\n' % cmd)
         process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
-        self.qemupid = process.pid
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
@@ -1308,8 +1311,10 @@ def main():
 
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
-            os.kill(config.qemupid, signal.SIGTERM)
+            signal.signal(signal.SIGTERM, signal.SIG_IGN)
+            os.kill(0, signal.SIGTERM)
             config.cleanup()
+            subprocess.run(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1331,6 +1336,7 @@ def main():
         return 1
     finally:
         config.cleanup()
+        subprocess.run(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
1.9.1


