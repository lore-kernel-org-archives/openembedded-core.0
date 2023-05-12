Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C08C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 13:46:13 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
 by mx.groups.io with SMTP id smtpd.web10.25310.1683899167396077080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 06:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=HxaobDEY;
 spf=pass (domain: amazon.de, ip: 99.78.197.219, mailfrom: prvs=489aad6a3=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1683899167; x=1715435167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6AtkWj5iF5RU94r6zQTEZG0G1NO92t5RSN49nbbC0UU=;
  b=HxaobDEYdmDtDUTBWKE9QpWBJFtW0cY56vOj4Neeze97p5SMw8Kl8ucm
   wB48msm1edq9V3JOVj+6gOYqoNnsP3YK4wen6RYjFg+daASAKS4AVtRpF
   d89TQSZ+6kIGg6n/NqBm/boElfTD/IIczEeHbvbnBSALHXarz5KQrLmr6
   A=;
X-IronPort-AV: E=Sophos;i="5.99,269,1677542400"; 
   d="scan'208";a="2545605"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 13:46:03 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com (Postfix) with ESMTPS id E42608466A
	for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 13:46:02 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.94.99) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 May 2023 13:46:00 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] testimage/oeqa: remove testimage_dump_host function
Date: Fri, 12 May 2023 15:45:49 +0200
Message-ID: <20230512134549.292759-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.94.99]
X-ClientProxiedBy: EX19D040UWB001.ant.amazon.com (10.13.138.82) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 13:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181183

From: Thomas Roos <throos@amazon.de>

This function is not necessary.

[YOCTO #13872]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/classes-recipe/testexport.bbclass |  3 +--
 meta/classes-recipe/testimage.bbclass  | 13 -------------
 meta/lib/oeqa/targetcontrol.py         |  2 --
 meta/lib/oeqa/utils/qemurunner.py      | 15 +--------------
 4 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 0f0c56107f..9888356158 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -61,8 +61,7 @@ def testexport_main(d):
         d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"))
 
-    host_dumper = OERuntimeTestContextExecutor.getHostDumper(
-        d.getVar("testimage_dump_host"), d.getVar("TESTIMAGE_DUMP_DIR"))
+    host_dumper = OERuntimeTestContextExecutor.getHostDumper(d.getVar("TESTIMAGE_DUMP_DIR"))
 
     image_manifest = "%s.manifest" % image_name
     image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index b48cd96575..c1836cf20a 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -115,18 +115,6 @@ testimage_dump_target () {
     find /var/log/ -type f 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
 }
 
-testimage_dump_host () {
-    top -bn1
-    iostat -x -z -N -d -p ALL 20 2
-    ps -ef
-    free
-    df
-    memstat
-    dmesg
-    ip -s link
-    netstat -an
-}
-
 testimage_dump_monitor () {
     query-status
     query-block
@@ -341,7 +329,6 @@ def testimage_main(d):
 
     # we need the host dumper in test context
     host_dumper = OERuntimeTestContextExecutor.getHostDumper(
-        d.getVar("testimage_dump_host"),
         d.getVar("TESTIMAGE_DUMP_DIR"))
 
     # the robot dance
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d686fe07ec..e21655c979 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -104,7 +104,6 @@ class QemuTarget(BaseTarget):
             self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         dump_target_cmds = d.getVar("testimage_dump_target")
-        dump_host_cmds = d.getVar("testimage_dump_host")
         dump_monitor_cmds = d.getVar("testimage_dump_monitor")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
@@ -141,7 +140,6 @@ class QemuTarget(BaseTarget):
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = dump_host_cmds,
                             logger = logger,
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6734cee48d..1f162a4e33 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -33,7 +33,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir,
                  use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
 
         # Popen object for runqemu
@@ -69,7 +69,6 @@ class QemuRunner:
         if not workdir:
             workdir = os.getcwd()
         self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
-        self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
         self.monitorpipe = None
 
         self.logger = logger
@@ -138,7 +137,6 @@ class QemuRunner:
                 self.logger.error('runqemu exited with code %d' % self.runqemu.returncode)
                 self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
                 self.stop()
-                self._dump_host()
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
@@ -286,7 +284,6 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
-                    self._dump_host()
                     self.logger.warning("Output from runqemu:\n%s" % self.getOutput(output))
                     self.stop()
                     return False
@@ -314,7 +311,6 @@ class QemuRunner:
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
-            self._dump_host()
             op = self.getOutput(output)
             self.stop()
             if op:
@@ -430,7 +426,6 @@ class QemuRunner:
                     self.logger.error("Couldn't get ip from qemu command line and runqemu output! "
                                  "Here is the qemu command line used:\n%s\n"
                                  "and output from runqemu:\n%s" % (cmdline, out))
-                    self._dump_host()
                     self.stop()
                     return False
 
@@ -507,7 +502,6 @@ class QemuRunner:
             lines = tail(bootlog if bootlog else self.msg)
             self.logger.warning("Last 25 lines of text (%d):\n%s" % (len(bootlog), lines))
             self.logger.warning("Check full boot log: %s" % self.logfile)
-            self._dump_host()
             self.stop()
             return False
 
@@ -688,13 +682,6 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
-
-    def _dump_host(self):
-        self.host_dumper.create_dir("qemu")
-        self.logger.warning("Qemu ended unexpectedly, dump data from host"
-                " is in %s" % self.host_dumper.dump_dir)
-        self.host_dumper.dump_host()
-
 # This class is for reading data from a socket and passing it to logfunc
 # to be processed. It's completely event driven and has a straightforward
 # event loop. The mechanism for stopping the thread is a simple pipe which
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





