Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3926C001DF
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:34:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.843.1689374045609195650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=i+gKjNJY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso15150885ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374044; x=1691966044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1A2c2EcwV+FHHjnQ80rEUh9YVu3zKbZ3+RqB0Dj3C8=;
        b=i+gKjNJYJpacSy4+LXEQmfTaXS8YOH6B93+xIbvEX0x2rt0tuwryzZWemNNGOnd1Jg
         nDKkInGGriczCovmJAq6jTGGtafGJ4SV5fIb1sSwG+NMR06xjd8PF1649pbiDIxjPk0x
         Tp/QLr4EucBum78VWYFQjSMTB++xTGoWT0CioGNe3jbjIQ1P1rErGf8UxkGbDtIDtW9D
         AlnMuqHDDy3z9yl8VUdJW/VsmkTp/kZoauNvLj55TR/TSocT3AtmIlGj6EpLl2wghFR5
         U+wKQvCbW8h8nmB5APsY6LmvR9OT6B2HOI8JzoqT0183lg0PrZW4jHKqH6nV4rsDuvsF
         HTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374044; x=1691966044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1A2c2EcwV+FHHjnQ80rEUh9YVu3zKbZ3+RqB0Dj3C8=;
        b=HlVXAiySMpXGCVK/E6hshag77tCu9yFJNIXYuJvKY2lXUZ0PT7A1VVq6CMDeCE2zEz
         iahdJi8fUofegSAA2t8Jj+s/6FHkD7C5BKBHMi34lM0wD6Wc0XyLFYfAVeaDqJEmxuG6
         hiXaTFiKJ38/3+erBdOfKYmZuKdis7ENM7DEC1zkv3XTGvkNNMjVSEd80GgUQF/5Hx/A
         FrgdCu+dbhK87ZwT5bH1IARH1BBaXiXgnKJRHjKOBp8emJXdRHocl4gfs4NNFdgL+LG0
         r3de3EhuMuyd8PyETITbK1KuJBs3EW6DExXtyu56P0BpCs2w+pmHVR1Npgta4q2/M4DH
         /aBg==
X-Gm-Message-State: ABy/qLbgt+uhLQTNtVE12x4pcj0q22IBVgCn9845pjk4dVMsb72/m8W+
	Ac0xnxM9Gbx3VHPJD0nH/XLICFFc69rSI80HGAU=
X-Google-Smtp-Source: APBJJlEgO9UnswXLfgtnTNk+hS8G9rui+YtSyuIhHf6GsyVaw4dF9w6g0cvHqv+oilv3ljJo9IXjDA==
X-Received: by 2002:a17:902:ab15:b0:1b5:2b12:6f50 with SMTP id ik21-20020a170902ab1500b001b52b126f50mr4080867plb.12.1689374044525;
        Fri, 14 Jul 2023 15:34:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.34.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:34:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/26] testimage/oeqa: Drop testimage_dump_host functionality
Date: Fri, 14 Jul 2023 12:32:58 -1000
Message-Id: <8d1bc34cffdd9f054e51db4e880747c79bf834fe.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184306

From: Thomas Roos <throos@amazon.de>

The intent behind these functions was to dump the system state when issues occured
but it has never really worked as we'd planned. Regular monitoring as the build
runs has largely replaced this as that allows a trend to be seen rather than a spot
value which was never really useful. The code is bitrotting and not functioning
correctly so drop it.

[YOCTO #13872]

RP: Reword commit message
Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dea37ba49a236029da73d5cfbfc069bffc38b508)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testexport.bbclass |  6 +-----
 meta/classes-recipe/testimage.bbclass  | 20 +-------------------
 meta/lib/oeqa/core/target/qemu.py      |  5 ++---
 meta/lib/oeqa/runtime/context.py       | 11 +----------
 meta/lib/oeqa/targetcontrol.py         |  2 --
 meta/lib/oeqa/utils/dump.py            | 20 +-------------------
 meta/lib/oeqa/utils/qemurunner.py      | 18 ++----------------
 7 files changed, 8 insertions(+), 74 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 0f0c56107f..572f5d9e76 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -61,16 +61,12 @@ def testexport_main(d):
         d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"))
 
-    host_dumper = OERuntimeTestContextExecutor.getHostDumper(
-        d.getVar("testimage_dump_host"), d.getVar("TESTIMAGE_DUMP_DIR"))
-
     image_manifest = "%s.manifest" % image_name
     image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
 
     extract_dir = d.getVar("TEST_EXTRACTED_DIR")
 
-    tc = OERuntimeTestContext(td, logger, target, host_dumper,
-                              image_packages, extract_dir)
+    tc = OERuntimeTestContext(td, logger, target, image_packages, extract_dir)
 
     copy_needed_files(d, tc)
 
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index b48cd96575..cc3650ad42 100644
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
@@ -339,19 +327,13 @@ def testimage_main(d):
     # runtime use network for download projects for build
     export_proxies(d)
 
-    # we need the host dumper in test context
-    host_dumper = OERuntimeTestContextExecutor.getHostDumper(
-        d.getVar("testimage_dump_host"),
-        d.getVar("TESTIMAGE_DUMP_DIR"))
-
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
         d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
-    tc = OERuntimeTestContext(td, logger, target, host_dumper,
-                              image_packages, extract_dir)
+    tc = OERuntimeTestContext(td, logger, target, image_packages, extract_dir)
 
     # Load tests before starting the target
     test_paths = get_runtime_paths(d)
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 79fd724f7d..6893d10226 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -22,7 +22,7 @@ supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
-            dump_dir='', dump_host_cmds='', display='', bootlog='',
+            dump_dir='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
             boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, **kwargs):
 
@@ -44,8 +44,7 @@ class OEQemuTarget(OESSHTarget):
         self.runner = QemuRunner(machine=machine, rootfs=rootfs, tmpdir=tmpdir,
                                  deploy_dir_image=dir_image, display=display,
                                  logfile=bootlog, boottime=boottime,
-                                 use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
-                                 dump_host_cmds=dump_host_cmds, logger=logger,
+                                 use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
                                  use_ovmf=ovmf, tmpfsdir=tmpfsdir)
         dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 0c5d1869ab..cb7227a8df 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -10,7 +10,6 @@ import sys
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
 from oeqa.core.target.qemu import OEQemuTarget
-from oeqa.utils.dump import HostDumper
 
 from oeqa.runtime.loader import OERuntimeTestLoader
 
@@ -20,12 +19,11 @@ class OERuntimeTestContext(OETestContext):
                         os.path.dirname(os.path.abspath(__file__)), "files")
 
     def __init__(self, td, logger, target,
-                 host_dumper, image_packages, extract_dir):
+                 image_packages, extract_dir):
         super(OERuntimeTestContext, self).__init__(td, logger)
 
         self.target = target
         self.image_packages = image_packages
-        self.host_dumper = host_dumper
         self.extract_dir = extract_dir
         self._set_target_cmds()
 
@@ -199,10 +197,6 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         return image_packages
 
-    @staticmethod
-    def getHostDumper(cmds, directory):
-        return HostDumper(cmds, directory)
-
     def _process_args(self, logger, args):
         if not args.packages_manifest:
             raise TypeError('Manifest file not provided')
@@ -215,9 +209,6 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['target'] = \
                 OERuntimeTestContextExecutor.getTarget(args.target_type,
                         None, args.target_ip, args.server_ip, **target_kwargs)
-        self.tc_kwargs['init']['host_dumper'] = \
-                OERuntimeTestContextExecutor.getHostDumper(None,
-                        args.host_dumper_dir)
         self.tc_kwargs['init']['image_packages'] = \
                 OERuntimeTestContextExecutor.readPackagesManifest(
                         args.packages_manifest)
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
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index d420b497f9..d4d271369f 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -51,9 +51,7 @@ class BaseDumper(object):
         self.dump_dir = dump_dir
 
     def _construct_filename(self, command):
-        if isinstance(self, HostDumper):
-            prefix = "host"
-        elif isinstance(self, TargetDumper):
+        if isinstance(self, TargetDumper):
             prefix = "target"
         elif isinstance(self, MonitorDumper):
             prefix = "qmp"
@@ -76,22 +74,6 @@ class BaseDumper(object):
             with open(fullname, 'w') as dump_file:
                 dump_file.write(output)
 
-class HostDumper(BaseDumper):
-    """ Class to get dumps from the host running the tests """
-
-    def __init__(self, cmds, parent_dir):
-        super(HostDumper, self).__init__(cmds, parent_dir)
-
-    def dump_host(self, dump_dir=""):
-        if dump_dir:
-            self.dump_dir = dump_dir
-        env = os.environ.copy()
-        env['PATH'] = '/usr/sbin:/sbin:/usr/bin:/bin'
-        env['COLUMNS'] = '9999'
-        for cmd in self.cmds:
-            result = runCmd(cmd, ignore_status=True, env=env)
-            self._write_dump(cmd.split()[0], result.output)
-
 class TargetDumper(BaseDumper):
     """ Class to get dumps from target, it only works with QemuRunner.
         Will give up permanently after 5 errors from running commands over
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 49c70727a2..2ba0596ba1 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -21,7 +21,6 @@ import threading
 import codecs
 import logging
 import tempfile
-from oeqa.utils.dump import HostDumper
 from collections import defaultdict
 import importlib
 
@@ -33,8 +32,8 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=False,
+     serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -69,7 +68,6 @@ class QemuRunner:
         if not workdir:
             workdir = os.getcwd()
         self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
-        self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
         self.monitorpipe = None
 
         self.logger = logger
@@ -138,7 +136,6 @@ class QemuRunner:
                 self.logger.error('runqemu exited with code %d' % self.runqemu.returncode)
                 self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
                 self.stop()
-                self._dump_host()
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
@@ -286,7 +283,6 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
-                    self._dump_host()
                     self.logger.warning("Output from runqemu:\n%s" % self.getOutput(output))
                     self.stop()
                     return False
@@ -314,7 +310,6 @@ class QemuRunner:
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
-            self._dump_host()
             op = self.getOutput(output)
             self.stop()
             if op:
@@ -430,7 +425,6 @@ class QemuRunner:
                     self.logger.error("Couldn't get ip from qemu command line and runqemu output! "
                                  "Here is the qemu command line used:\n%s\n"
                                  "and output from runqemu:\n%s" % (cmdline, out))
-                    self._dump_host()
                     self.stop()
                     return False
 
@@ -508,7 +502,6 @@ class QemuRunner:
             lines = tail(bootlog if bootlog else self.msg)
             self.logger.warning("Last 25 lines of text (%d):\n%s" % (len(bootlog), lines))
             self.logger.warning("Check full boot log: %s" % self.logfile)
-            self._dump_host()
             self.stop()
             return False
 
@@ -689,13 +682,6 @@ class QemuRunner:
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


