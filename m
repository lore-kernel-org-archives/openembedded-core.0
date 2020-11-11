Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.46])
 by mx.groups.io with SMTP id smtpd.web11.2413.1605067831709175760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 20:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g1lXxRHv;
 spf=pass (domain: windriver.com, ip: 40.107.94.46, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyhRQ5s1iRttTElsGtCWb0+Y9fAjj6nLrsMLvQZPF5avnK4PzirfWA9BXCPRpET7sd5p4NQg1gNM23gCB1a5xtwuYjrwNOQFiT2h0ID/xVUCz3mk1UYJwTGtFserO3nDLLYJDrQ+VMGiCjtcmrxAMaCtwfO58uA0AXIyFn1PBWP/8/LBuhAyT1ze31FMOvYTWWE7NZdP2MO6uO0gwNq6PoXZHgosm424Z1hGKhfYTl14hvxw1Ur2HF20/xF6yGjaWnwg2baFz0vXirjOLumEUO93MY44gZL5zMb3Hl6di7NuieQcPisLvyTimHqAGaq+i85tV4QIgC6o29UT1o19Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpgzBR6Y+5/aexsfZ0PDgmkRYWZNMsJuHG/H9JsDxgI=;
 b=LyJXuaFIidfbU3+4tq1jpdYKmfPh+VNIb3wx5mNB8emoNogld+AmV/Cft2aFulRamUNkkLyMQsjbSHDvV/qHmf4L3prswG3EiPLr83D5vXv0vSfeZRmjhtxY4VH6Sy02megmV4LIMdZyhirODN1ysjJOsWvPO+6dWFUTA+xH8l8FdFab1cYTfLgwM5j7WZeZkE8RTLLz/ESwOQYlQRhEon5eDwNZMnMuG8lnzpORDleGPJ6yzrFfQSF84tHvB6km/Loew4mn5HParQhFRDwb8AyCUt2llV+HxWPZV9Cu6KpSn98AVK/cjPwLrw8TdWSvT89JE0/8RQkwoRjEF35DBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpgzBR6Y+5/aexsfZ0PDgmkRYWZNMsJuHG/H9JsDxgI=;
 b=g1lXxRHvM5Srm/0ILywcVtMv8Sko+ifmjolDmixeDwVbVZ5JNA+qQGFDEpgUBeIgR1pW6QiiDQRWQHM+bIIwV18Y6j6zu1GVrhiGnRZ2UQhLrPNZPaZwGJRQ/8weqwjD4M2iarIUpNF1u+FVI7mqphBbGcOKKfxORr7f5mUljsI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 04:10:28 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5%8]) with mapi id 15.20.3541.023; Wed, 11 Nov 2020
 04:10:28 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [WIP] qemurunner.py: qemu as client
Date: Tue, 10 Nov 2020 20:10:02 -0800
Message-ID: <20201111041003.864509-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111041003.864509-1-saul.wold@windriver.com>
References: <20201111041003.864509-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To BN6PR11MB1873.namprd11.prod.outlook.com
 (2603:10b6:404:106::19)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by BYAPR06CA0041.namprd06.prod.outlook.com (2603:10b6:a03:14b::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 04:10:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9806e6d8-972c-4c6f-f665-08d885f7b94b
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546A4DFA89C734613812C4CEEE80@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dFSnrl2zE3kxINmyvHxkOVtpdv2dc1EU/gcQoKtLMXMgN0o+KYM86UHnYUkdXu3SnqebgtsASvZ2dxgCDWRv6gt/dkau8gBovRB3OuLBWJHfY+dHSQokS+Di5QdgCyqlufebmB8awyFiK3Aa3c2bTvtXG/48ZbTawN7Kl3OxMIiCbsVVMxExDbZeyUSxjS2o00BbaHRvVejZr4EXGv5PgR1b2TWpXcZsHuE9vCO7X00rGV342+hbFaelynEaGmq1UMwtw/8yaygsC7kLqeiArhAZ5L52/v9uMwPftxNfqQnF0KJ4NDQY4i0V8SSq+KiSXanl6JTritMoND8zLe2epw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39830400003)(376002)(396003)(366004)(346002)(83380400001)(66946007)(6512007)(5660300002)(2906002)(30864003)(86362001)(44832011)(16526019)(186003)(26005)(6506007)(1076003)(6486002)(8936002)(8676002)(66556008)(52116002)(66476007)(316002)(36756003)(478600001)(2616005)(6916009)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	yJEPN7aft4bTZSB9cDRZPQoqkbdOWZSzvX9VCz5nrfDcVX54zzSV3IPzEk6F+XrqLKpSkHSRWEJoRY3MmDsMAzdN/yWgc7qmY77jSzTdK/HILnNPXEzd9NH1vqS5VelLFxBWhHotaIGGYzJr0wC6PJG1NOKh84BFlD7/+ZxVFn7OdFCKM2gOk2BbsspDpn9w234KwMJZMSsDZ1Pmz9i4Qvta10PP3RfalN3QQC633CKKTAcsxFk2DrIR8I+i4x3gppVD7L4WOVAhoGVZs9YJ/9QtCuqrUHFWxGaH3/QKmyn4fUoIAuXDHjJhAlp9Q6bE+U14GZ/L/mSPHuw/LKa92e53eHGHvGVm4Mfs/m/Du8p7cGUhVWEOhU6EF3ieNUOniFsjwVkf4gqsh3oF4Dm5exsJAvTfz/MbFQF3YqySxmSwA7BMd47zmdm1sTQRPeL94MFMylTE6XnS4xmH50/yX18oGkhICO7LnF1lqzQa/B5ah/gXH/nvr07ecgQflBNeZV+YGFwS+XLf2eewzqPb7fRCCkkZmyqvINLNPSMStpEirqBPhs9Z5Vf6CtdP1xWjGRLf87y5m9g7umJXG/ygFVg4EVhD00a8Xel/IBkRb6GbtrzSpcq/qwHOO0gAquew9NDjU4Ap/TINPzzMtYvm+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9806e6d8-972c-4c6f-f665-08d885f7b94b
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 04:10:28.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKCe4kLWIkTPov4Mj1jTuG5OUf25sXWNGI4Gr2DYWKGZ5QFaxeepjmxW8+xpjMwhopC03/yb0oYCyDIUmZ+vmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py       |  9 ++--
 meta/lib/oeqa/runtime/cases/network.py | 28 +++++++++++
 meta/lib/oeqa/runtime/files/kill_net   |  5 ++
 meta/lib/oeqa/targetcontrol.py         |  3 ++
 meta/lib/oeqa/utils/dump.py            | 22 ++++++++
 meta/lib/oeqa/utils/qemurunner.py      | 70 +++++++++++++++++++++++++-
 6 files changed, 133 insertions(+), 4 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/network.py
 create mode 100644 meta/lib/oeqa/runtime/files/kill_net

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/s=
sh.py
index 461448dbc5..c744b90719 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -54,7 +54,7 @@ class OESSHTarget(OETarget):
         """
             Runs command in target using SSHProcess.
         """
-        self.logger.debug("[Running]$ %s" % " ".join(command))
+        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
=20
         starttime =3D time.time()
         status, output =3D SSHCall(command, self.logger, timeout)
@@ -77,6 +77,7 @@ class OESSHTarget(OETarget):
                         0:          No timeout, runs until return.
         """
         targetCmd =3D 'export PATH=3D/usr/sbin:/sbin:/usr/bin:/bin; %s' % =
command
+        self.ip =3D "192.168.7.5"
         sshCmd =3D self.ssh + [self.ip, targetCmd]
=20
         if timeout:
@@ -87,8 +88,10 @@ class OESSHTarget(OETarget):
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
+            self.target_dumper.dump_target()
             self.target_dumper.dump_target()
         return (status, output)
=20
diff --git a/meta/lib/oeqa/runtime/cases/network.py b/meta/lib/oeqa/runtime=
/cases/network.py
new file mode 100644
index 0000000000..49fcac133a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/network.py
@@ -0,0 +1,28 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class NetworkTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUp(cls):
+        src =3D os.path.join(cls.tc.runtime_files_dir, 'kill_net')
+        dst =3D '/home/root/kill_net'
+        cls.tc.target.copyTo(src, dst)
+
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_network_check(self):
+        (status, output) =3D self.target.run('/sbin/ip a')
+        msg =3D 'Failed to run "ip a". Output: %s' % output
+        self.assertEqual(status, 0, msg=3Dmsg)
+
+    @OETestDepends(['network.NetworkTest.test_network_check'])
+    def test_run_kill_net(self):
+        (status, output) =3D self.target.run('/bin/bash /home/root/kill_ne=
t > results 2>&1 &')
+        msg =3D 'Failed to run "kill_net". Output: %s' % output
+        self.assertEqual(status, 0, msg=3Dmsg)
diff --git a/meta/lib/oeqa/runtime/files/kill_net b/meta/lib/oeqa/runtime/f=
iles/kill_net
new file mode 100644
index 0000000000..981eec816d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/kill_net
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+ip a
+sleep 1
+ip link set eth0 down
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y
index 19f5a4ea7e..8cdd984179 100644
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
+        dump_monitor_cmds =3D ['{"execute":"query-status"}\n', '{"execute"=
:"query-status"}\n']
         dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir =3D os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdu=
mp')
@@ -147,6 +149,7 @@ class QemuTarget(BaseTarget):
                             serial_ports =3D len(d.getVar("SERIAL_CONSOLES=
").split()))
=20
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
=20
     def deploy(self):
         bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 09a44329e0..058d1e46b1 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -96,3 +96,25 @@ class TargetDumper(BaseDumper):
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
+        if dump_dir:
+            self.dump_dir =3D dump_dir
+        for cmd in self.cmds:
+            try:
+                print("dump_target: %s" % cmd)
+                output =3D self.runner.run_monitor(cmd)
+                print("result: %s" % (output))
+                self._write_dump(cmd.split()[0], output)
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

