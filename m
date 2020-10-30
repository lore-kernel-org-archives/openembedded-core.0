Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.75])
 by mx.groups.io with SMTP id smtpd.web12.13603.1604064387072516042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 06:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Hqjk5sCL;
 spf=pass (domain: windriver.com, ip: 40.107.77.75, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8uAxSXHe1fGNY0+wsiASMdja26Li5bHpgLQl/S/RO3LQIIQYhj4L1zMLLP5vtXteRMGENY0iTYywqc62m7QHBAGntPGvFF9CY4DnhXRoXYZbSEbIk1y/VAIqT6F22ZZpD4J9rM/ORRbcP8xtPeleClpVx4iqn04+if8jBi3UCKj56GL/GkoY7Bs6QPmLEne9ln0R/8SyoKU+ydmHYLmo3YQI2/AcdaTBdYbgyuaNWZwaUhWoXSvCNhV/n9wgoDWOhZagZGvUZuxg/BVWtTqguESRT3fWBEcE5J/v564NOgNyn+9k6hJ284BbWR70xbUIzAuy7atLkYikJEQgwVUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxjMCKFvcvqMU+P+zT+FHp0qSzzcdjg3bu9J9x34Z2M=;
 b=PhrE+rzB3uq5ajahYYdgx0Q0PVJOfp2g/2R59fiyDegmB0Ynee+QV5KJ7jrpd3aZaHnACN8/Kkc3xYiqvQbhC15+dXTWDpEWjDx0dDEu7QFiuIqMPMT/pNzRz3wDIguyb2EZ6CDYTnc9Ox+dGJsubIiCl7+p98BVF+yKbrKnEtRZKdAmSZtcrDoOhBZS3Pm3QsgoSruczZT7fepcqDq020GWB3Y1sEbxztujkn0jASYMGuz4xcEx7+Wh2QUfU7dpE1A76rXRLQ095XsQWjBFmnBfaC075Wt03/VmTj1RLHD0VzNv159x/RsN6PzTATCZzAlCHer3HCtIwu5MVWQE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxjMCKFvcvqMU+P+zT+FHp0qSzzcdjg3bu9J9x34Z2M=;
 b=Hqjk5sCLwigb6tXHOE5miRnRWpueqfOQS/Uc6oPaSirwQgYfU53DTiiMapYIYug/S94tQVENUz9h80Gc3W46XyTwQCH/f4tzN7r9IxSdn09PQ3XHk4vTRQyv+Owe2R2Zv7c+U8divAOCdz1jU6wQxC1Ef2g+EpzNHF3M3d5gYQk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2545.namprd11.prod.outlook.com (2603:10b6:406:b0::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 13:26:25 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5%8]) with mapi id 15.20.3477.034; Fri, 30 Oct 2020
 13:26:25 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] qemurunner: add support for qmp cmds
Date: Fri, 30 Oct 2020 06:26:07 -0700
Message-ID: <20201030132608.1102193-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:300:16::18) To BN6PR11MB1873.namprd11.prod.outlook.com
 (2603:10b6:404:106::19)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR13CA0008.namprd13.prod.outlook.com (2603:10b6:300:16::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.11 via Frontend Transport; Fri, 30 Oct 2020 13:26:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b04361ae-5bbe-4a03-94c3-08d87cd76683
X-MS-TrafficTypeDiagnostic: BN7PR11MB2545:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25455169C608BC9461DA01FFEE150@BN7PR11MB2545.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qYVY0BGr1o9uvlioQtFAxLdpAxZp4SKxeHbGde7nXrp29mttrYOdYRPoX9jmJ9hBSn8n/AJ8cO4QzNh6mHbGoV5njYL7zTcKOEjl3QGCiJaMemdmjqfLKJjPyqANZqFtKonjNVoE1YXmHCSGvXLvV6Rh+JPdESNIV+xXTkqwB2b0TwwyhhI0ecSXiCO7s8Ii5Uet35bcYKZ+IF9PK7lVElSqpSsDKGAVu3ieLGV4hUEsegvhghzzchTey3NMYS4NMNjzQbcCQOVdNSHRkZvMJSSFMVMEKeIo0BgYs7drj6r06KWIjRXNadBklDrsEofsA5JTHZcDwU2RathuZs7NSeP8HLz0tgeJ3lznYjIMW1ZKU1T5rLwSCTrX5VtbVORG5mD0mTr/jN0GFHG5hL5sPQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(52116002)(83380400001)(26005)(2906002)(6666004)(6916009)(6506007)(36756003)(8676002)(316002)(186003)(16526019)(478600001)(5660300002)(30864003)(2616005)(956004)(66946007)(966005)(66476007)(66556008)(44832011)(86362001)(8936002)(6486002)(6512007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PFD3BQq7q/y12qcU1b/ykRuUm55uICzpJghl3G5rcmw0IFStcxcnV4r/vX+se90DpBbZ1sQR9/jUNq2tHEUgfm+L9QQ96zlb1fbGAYxL/AAhy1kzC8lYf1c15adk59DWkZINU2x5usFDpL74Edd8WdtUmM8Ek4K7vKx7uXaS6vWMubAJKoFHdbVtIe7ZGSNIhOcRZElr9D1aFawwzelURQ25jwXIEAjoKucL9Ct1tisKali8G8mjkXrv4b+/r7ZJZamPTVqf+k6mSeOBmXQFs6K55qlmu4vg+K8eGlCkQfOEPWLgsTgpdYisFn7uLxj0QiU9z8xyuYtTJlugmLtc8ziA1O+3K5knxoUUPDaUO9ekYQLXThjneJAcA/zhi6Vlq4X4VyjTduoRO4Z0crktpt+i9DF0GMybLJ6Nt/NHfcuupUS4pMJ3LVot+JwTemn87l1KzhZ5bEbSHl/Tnz++6+KqQJJ1fVbKdWVq8pX4QH0thGXhxz0ogGxZapFUnkziJELGtvbu4CGt2knzW3nFnDeYtd0T2VdEukIia5DCLN4qPhPoA+9twxWKIqy2chcSl4N2ufEsevBPFY/ljHwrWnQ+5qlucAkPy/MSOB6uCwXf/3rD9rcow3jKaF/RQ/D08+PN6S/sq7MMfj0H64XxFg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04361ae-5bbe-4a03-94c3-08d87cd76683
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 13:26:25.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAqBfAjD8YDHDFYA8sB/RZ7UM45uyZoGVcpKU9Q0ozv2GlUmCUEr9kjDgjXdIjltZX9J9+qhe5aveAa2BUVfxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2545
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This adds support for the Qemu Machine Protocol [0] extending
the current dump process for Host and Target. The commands are
added in the testimage.bbclass.

Currently, we setup qemu to stall until qmp gets connected and
sends the initialization and continue commands, this works
correctly.

Current issues: getting the monitor_dump() to work correctly
when a failure occurs. I saw this work once or twice, but now
I seem to be stuck with not getting the monitor_dump() running
in my debug environment.  Probably something stupid.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass    |  6 +++
 meta/lib/oeqa/core/target/qemu.py |  4 ++
 meta/lib/oeqa/core/target/ssh.py  | 12 ++++--
 meta/lib/oeqa/targetcontrol.py    |  5 +++
 meta/lib/oeqa/utils/dump.py       | 24 +++++++++++
 meta/lib/oeqa/utils/qemurunner.py | 70 ++++++++++++++++++++++++++++++-
 6 files changed, 117 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index e3feef02f8..5adaf1c086 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -127,6 +127,11 @@ testimage_dump_host () {
     netstat -an
 }
=20
+testimage_dump_monitor () {
+    '{"execute":"query-status"}\n'
+    '{"execute":"query-block"}\n'=20
+}
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -319,6 +324,7 @@ def testimage_main(d):
     target_kwargs['powercontrol_extra_args'] =3D d.getVar("TEST_POWERCONTR=
OL_EXTRA_ARGS") or ""
     target_kwargs['serialcontrol_cmd'] =3D d.getVar("TEST_SERIALCONTROL_CM=
D") or None
     target_kwargs['serialcontrol_extra_args'] =3D d.getVar("TEST_SERIALCON=
TROL_EXTRA_ARGS") or ""
+    target_kwargs['testimage_dump_monitor'] =3D d.getVar("testimage_dump_m=
onitor") or ""
     target_kwargs['testimage_dump_target'] =3D d.getVar("testimage_dump_ta=
rget") or ""
=20
     def export_ssh_agent(d):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/=
qemu.py
index 0f29414df5..bbbbeece31 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -12,6 +12,7 @@ from collections import defaultdict
=20
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
+from oeqa.utils.dump import MonitorDumper
 from oeqa.utils.dump import TargetDumper
=20
 supported_fstypes =3D ['ext3', 'ext4', 'cpio.gz', 'wic']
@@ -43,6 +44,9 @@ class OEQemuTarget(OESSHTarget):
                                  dump_host_cmds=3Ddump_host_cmds, logger=
=3Dlogger,
                                  serial_ports=3Dserial_ports, boot_pattern=
s =3D boot_patterns,=20
                                  use_ovmf=3Dovmf)
+        dump_monitor_cmds =3D kwargs.get("testimage_dump_monitor")
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
+        self.logger.debug("sgw2 monitor: %s" %  self.monitor_dumper)
         dump_target_cmds =3D kwargs.get("testimage_dump_target")
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
         self.target_dumper.create_dir("qemu")
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/s=
sh.py
index 461448dbc5..b1b73dffec 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -54,13 +54,17 @@ class OESSHTarget(OETarget):
         """
             Runs command in target using SSHProcess.
         """
-        self.logger.debug("[Running]$ %s" % " ".join(command))
+        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
=20
         starttime =3D time.time()
         status, output =3D SSHCall(command, self.logger, timeout)
         self.logger.debug("[Command returned '%d' after %.2f seconds]"
                  "" % (status, time.time() - starttime))
=20
+        self.logger.debug('sgw-Monitor Calling Dump')
+        self.logger.debug("sgw4 monitor: %s" %  self.monitor_dumper)
+        self.monitor_dumper.dump_monitor()
+        self.logger.debug('sgw-Monitor Calling Dump returned')
         if status and not ignore_status:
             raise AssertionError("Command '%s' returned non-zero exit "
                                  "status %d:\n%s" % (command, status, outp=
ut))
@@ -87,9 +91,11 @@ class OESSHTarget(OETarget):
             processTimeout =3D self.timeout
=20
         status, output =3D self._run(sshCmd, processTimeout, True)
-        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output)=
)
-        if (status =3D=3D 255) and (('No route to host') in output):
+        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (comma=
nd, status, output))
+#        if (status =3D=3D 255) and (('No route to host') in output):
+        if status =3D=3D 255:
             self.target_dumper.dump_target()
+            self.monitor_dumper.dump_monitor()
         return (status, output)
=20
     def copyTo(self, localSrc, remoteDst):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y
index 19f5a4ea7e..0d070531c3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -17,6 +17,7 @@ from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
 from oeqa.utils.dump import TargetDumper
+from oeqa.utils.dump import MonitorDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
=20
@@ -108,6 +109,7 @@ class QemuTarget(BaseTarget):
         self.qemulog =3D os.path.join(self.testdir, "qemu_boot_log.%s" % s=
elf.datetime)
         dump_target_cmds =3D d.getVar("testimage_dump_target")
         dump_host_cmds =3D d.getVar("testimage_dump_host")
+        dump_monitor_cmds =3D d.getVar("testimage_dump_monitor")
         dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir =3D os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdu=
mp')
@@ -147,6 +149,9 @@ class QemuTarget(BaseTarget):
                             serial_ports =3D len(d.getVar("SERIAL_CONSOLES=
").split()))
=20
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
+        self.logger.debug("sgw monitor: %s" %  self.monitor_dumper)
+       =20
=20
     def deploy(self):
         bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 09a44329e0..73453d2fc1 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -96,3 +96,27 @@ class TargetDumper(BaseDumper):
             except:
                 print("Tried to dump info from target but "
                         "serial console failed")
+                print("Failed CMD: %s" % (cmd))
+
+class MonitorDumper(BaseDumper):
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRu=
nner """
+
+    def __init__(self, cmds, parent_dir, runner):
+        super(MonitorDumper, self).__init__(cmds, parent_dir)
+        self.runner =3D runner
+
+    def dump_monitor(self, dump_dir=3D""):
+        print("Monitor Dumping: %s" % self.cmds)
+        print("Dump dir: %s" % dump_dir)
+        if dump_dir:
+            self.dump_dir =3D dump_dir
+        for cmd in self.cmds:
+            try:
+                print("dump_target: %s" % cmd)
+                output =3D self.runner.run_monitor(cmd)
+                print("result: %s" % (output))
+                self._write_dump("qemu_monitor", output)
+            except:
+                print("Failed to dump montor data")
+                print("Failed CMD: %s" % (cmd))
+             =20
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 77ec939ad7..0ca0d78470 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,6 +20,7 @@ import string
 import threading
 import codecs
 import logging
+from contextlib import closing
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
=20
@@ -84,6 +85,12 @@ class QemuRunner:
         default_boot_patterns['send_login_user'] =3D 'root\n'
         default_boot_patterns['search_login_succeeded'] =3D r"root@[a-zA-Z=
0-9\-]+:~#"
         default_boot_patterns['search_cmd_finished'] =3D r"[a-zA-Z0-9]+@[a=
-zA-Z0-9\-]+:~#"
+        monitor_cmds =3D defaultdict(str)
+        monitor_cmds['qmp_cap'] =3D '{"execute":"qmp_capabilities","argume=
nts":{"enable":["oob"]}}\n'
+        monitor_cmds['cont'] =3D '{"execute":"cont"}\n'
+        monitor_cmds['quit'] =3D '{"execute":"quit"}\n'
+        monitor_cmds['preconfig'] =3D '{"execute":"x-exit-preconfig"}\n'
+        self.monitor_cmds =3D monitor_cmds
=20
         # Only override patterns that were set e.g. login user TESTIMAGE_B=
OOT_PATTERNS[send_login_user] =3D "webserver\n"
         for pattern in accepted_patterns:
@@ -168,10 +175,17 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3Dg=
et_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
=20
     def launch(self, launch_cmd, get_ip =3D True, qemuparams =3D None, ext=
ra_bootparams =3D None, env =3D None):
+        # Find a free socket port that can be used by the QEMU Monitor con=
sole
+        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as=
 s:
+            s.bind(('', 0))
+            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
+            qmp_port =3D s.getsockname()[1]
+
         try:
             if self.serial_ports >=3D 2:
                 self.threadsock, threadport =3D self.create_socket()
             self.server_socket, self.serverport =3D self.create_socket()
+
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % ms=
g[1])
             return False
@@ -185,6 +199,9 @@ class QemuRunner:
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
         self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
"'.format(bootparams, self.qemu_pidfile)
+        qemuparams +=3D ' -S -qmp tcp:localhost:%s,server,wait' % (qmp_por=
t)
+        qemuparams +=3D ' -monitor tcp:localhost:4444,server,nowait'
+
         if qemuparams:
             self.qemuparams =3D self.qemuparams[:-1] + " " + qemuparams + =
" " + '\"'
=20
@@ -250,6 +267,28 @@ class QemuRunner:
=20
         if self.runqemu_exited:
             return False
+       =20
+        # Create the client socket for the QEMU Monitor Control Socket
+        # This will allow us to read status from Qemu if the the process
+        # is still alive
+        try:
+            self.monitor_socket =3D socket.socket(socket.AF_INET, socket.S=
OCK_STREAM)
+            self.monitor_socket.connect(("127.0.0.1", qmp_port))
+            self.monitor_socket.setblocking(False)
+
+        except socket.error as msg:
+            self.logger.error("Failed to connect qemu monitor socket: %s" =
% msg[1])
+            return False
+
+        # Run an empty command to get the initial connection details, then
+        # send the qmp_capabilities command, this is required to initializ=
e
+        # the monitor console
+        mon_output =3D self.run_monitor("")
+        self.logger.debug("Monitor: %s" % mon_output)
+        mon_output =3D self.run_monitor(self.monitor_cmds['qmp_cap'], time=
out=3D120)
+        self.logger.debug("Monitor: %s" % mon_output)
+        mon_output =3D self.run_monitor(self.monitor_cmds['cont'], timeout=
=3D120)
+        self.logger.debug("Monitor: %s" % mon_output)
=20
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" =
%
@@ -338,6 +377,7 @@ class QemuRunner:
         reachedlogin =3D False
         stopread =3D False
         qemusock =3D None
+        monsock =3D None
         bootlog =3D b''
         data =3D b''
         while time.time() < endtime and not stopread:
@@ -376,7 +416,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -437,6 +476,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'monitor_socket') and self.monitor_socket:
+            self.monitor_socket.close()
+            self.monitor_socket =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -495,6 +537,32 @@ class QemuRunner:
                         return True
         return False
=20
+    def run_monitor(self, command, timeout=3D60):
+        data =3D ''
+        self.monitor_socket.sendall(command.encode('utf-8'))
+        start =3D time.time()
+        end =3D start + timeout
+        while True:
+            now =3D time.time()
+            if now >=3D end:
+                data +=3D "<<< run_monitor(): command timed out after %d s=
econds without output >>>\r\n\r\n" % timeout
+                break
+            try:
+                sread, _, _ =3D select.select([self.monitor_socket],[],[],=
 end - now)
+            except InterruptedError:
+                continue
+            if sread:
+                answer =3D self.monitor_socket.recv(1024)
+                if answer:
+                    data +=3D answer.decode('utf-8')
+                    if data.rfind('\r\n') !=3D -1:
+                        break;
+                else:
+                    raise Exception("No data on monitor socket")
+
+        if data:
+            return (str(data))
+
     def run_serial(self, command, raw=3DFalse, timeout=3D60):
         # We assume target system have echo to get command status
         if not raw:
--=20
2.25.1

