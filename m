Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.2413.1605067831709175760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 20:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RZ5PP06Y;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l206O2s99GmHpDc7zLUMaJR3QV/9zLUgIvwo1iQ/VfKnH9m5cJg418JmQ+KZ9EkIioqR+M49/kLOVo79hUrueZCUDGDRjhATexn6H6BrhVMEDawDqTA0zOSFVFe6PmMFUASXCgKbZSp+QLsxgAGqD88agUr42trEDyPJINxB0zgkv7CAs+rKcBNLFnltcBV6HHjkwTlGORTJIf7o0ehQ41yCgLF2bsH0oHp/xW1V/cAIuZWaMCgUKOsca6Z04EOftAqnXabAxML5w59TAJxClcWaRMHLqrXJ0qXmHAov1Yzenl3rY8k6zyV2k+rp06ZregMkIO02irBAignhq2JUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WerGaHzy5dTXpis+LWvONND9Vxmbl4/BMLTwYq7fD8k=;
 b=hpmtzuEL50FN7vN+cCG4iVcNUle4OL3efDtXRzvdEHpZfu7NYt154eVOSu9DXbNAI/8NHtuTO0t8tosNOOQgE0zpiWG1+RU3g2tHtMcPMxW293Pvkm17fLfyW+JkaolaGrt7/Tvk3pn2rTGxITz1YM/IQj4IfPLm+9fs8QPcXwc7tWgwtBTrzuMVCuEBK3Tk+pxA1fkcPeeUmF2F0uN7NIaAEi0F5K1l/1fWK9YsHOUCcXVPGyBuDVWUu2CPhWz1OzF8ykc/4KWLNQrIUGDkKn41MKWNLdaAPUsbwbRljYWpnR3hg5hXHUo/OYdXz2PAUrcY4kIgJ1cOaUJePPjd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WerGaHzy5dTXpis+LWvONND9Vxmbl4/BMLTwYq7fD8k=;
 b=RZ5PP06YhvLvZ7zUjzi0dRF/CU3NdMNC45r2aaYe19dp4LMq7ngyCzhyimfvC03254azZbQMsl4VPnGMhLKhRX/oczb0ujEmRpeOSAo21yChyCBysiibaEXoC92RCbjQh7888bZQ7fvGv977ZQPPbr6X9xdZtMbXhzfgzKq0q+4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 04:10:29 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5%8]) with mapi id 15.20.3541.023; Wed, 11 Nov 2020
 04:10:29 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: add support for qmp cmds
Date: Tue, 10 Nov 2020 20:10:03 -0800
Message-ID: <20201111041003.864509-4-saul.wold@windriver.com>
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
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by BYAPR06CA0041.namprd06.prod.outlook.com (2603:10b6:a03:14b::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 04:10:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b334a83-2ab8-4a86-4451-08d885f7b9bf
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546BD498A6D5E5EFC346712EEE80@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HZvj/9ThYNEL4LIje9oKWeDrX9H7jJSCzlfQRQvB8rWTtbL6lDwbm2umPvOfSlBtcMCodzaUDmfEBMj7aTF4TksXtNyt1k8KSDNKGU1Pzbx84AWgrc4o8rj3HKQ0CRlFqEpcntpHo740SKffdwnVmLSiaClIHFQu5eH0Km4V0ihiBX7T6UkC5uENgJdmfeX0n6EZhr43w3pXVihMgd4LIcBCeX2KFS2L8ubZKgivtP6hI97Whzk0WkngOi064W2xkJN7FRl35Xz1uABupiKKqd+8qf1ddCGROm36riSlt0Gt3D7/znfxfsoihUZk0kQ4JStY705KFPL/vaZlAh3ApbKIGFDfHcZoOfi1vWtFuFm9TtVt3bqckf5Ptr0WqSIm+/5t5Gu4pAn40vR1G47jSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39830400003)(376002)(396003)(366004)(346002)(83380400001)(66946007)(6512007)(5660300002)(2906002)(30864003)(86362001)(44832011)(16526019)(186003)(26005)(6506007)(1076003)(6486002)(8936002)(8676002)(966005)(66556008)(52116002)(66476007)(316002)(36756003)(478600001)(2616005)(6916009)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qyhkABGMpTwgYwc31n163e1zNnyhmvtFQ5pjfoiiwelMTPGQPG2otJCe9zOhOJSa43haCtlL3HKhbBGpTE8mcvo+GNlhRNe+JcKx0x0BDX4EFFgr7wZjR4ZoqYESwt+LiZgMq2OXHKH1IHbwuZbdBhw5Wi3R7ozJR8OvA8Lt54y1fmqEJhw79OTLlYHvr45yFN+RnyhsoUvy2U01B1+Przschs3hMmhSXhMNS8wiaEm+Gqij3NCuerVGhaCiri2mqLp9yk/10ddnHnqO34C3H05uJlcIPBcr/gVhUEZTwpsxU9jtHSikAwfzw09uN9BZiQSIFngP+6vwakowjPzFj1FjztxqBhJ5PR6rseevBrjwK0FpIqxfD6TjINPMyqL8Se8Cxr4ftIff2Q/yc2CC8w9zDGTLEL7AODG3DhGWMKd70e3m0138AyHTYx1Hn6cakS0IbMly+Ru03r5Ywv0fMfsNEaFkQeWaOb68YG4YkFzW2s7SwElV3twUJ/wJLL/eTcZEdlKthT+jcODDDnLvb7bycaetQLBRhzJiLODy9RFSl78KrEKAnsMx1SG+9HhyVaLj6BMdGH0/h/+uBzuYhxyktZdrp5r1M/2bgVtq8Ij+DrV2TmK117NYzT14s74Id3fQ7tMe1ovOCWhTFrbb8A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b334a83-2ab8-4a86-4451-08d885f7b9bf
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 04:10:29.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSM6Dkh7VJWGXhX3cpJdqyO1v3+EEvH/0gLA+UAhB5Ffx3gPJWYcG7j+G6gElpHQ0W4vn4uRHSEyJQYCo8QEHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This adds support for the Qemu Machine Protocol [0] extending
the current dump process for Host and Target. The commands are
added in the testimage.bbclass.

Currently, we setup qemu to stall until qmp gets connected and
sends the initialization and continue commands, this works
correctly.

With this version, the monitor_dumper is created in OEQemuTarget
but then set in OESSHTarget as that's where we get the SSH failure
happens. Python's @property is used to create a setter/getter type
of setup in OESSHTarget to get overridden by OEQemuTarget.

By default the data is currently dumped to files for each command in
TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor

Current Issue, the first command succeeds, but the following commands
seem to fail. I think it's something to do with JSON and quoting. I
think the next step is to try and use JSON (which I am not super
familiare with).

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass    |  7 ++++
 meta/lib/oeqa/core/target/qemu.py |  6 +++
 meta/lib/oeqa/core/target/ssh.py  | 22 ++++++++--
 meta/lib/oeqa/targetcontrol.py    |  5 +++
 meta/lib/oeqa/utils/dump.py       | 20 +++++++++
 meta/lib/oeqa/utils/qemurunner.py | 70 ++++++++++++++++++++++++++++++-
 6 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index e3feef02f8..a274865955 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -127,6 +127,12 @@ testimage_dump_host () {
     netstat -an
 }
=20
+testimage_dump_monitor () {
+    '{"execute":"status"}\n'
+    '{"execute":"query-status"}\n'
+    '{"execute":"query-block"}\n'=20
+}
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -319,6 +325,7 @@ def testimage_main(d):
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
index 0f29414df5..a73d82d9af 100644
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
@@ -43,6 +44,11 @@ class OEQemuTarget(OESSHTarget):
                                  dump_host_cmds=3Ddump_host_cmds, logger=
=3Dlogger,
                                  serial_ports=3Dserial_ports, boot_pattern=
s =3D boot_patterns,=20
                                  use_ovmf=3Dovmf)
+        dump_monitor_cmds =3D kwargs.get("testimage_dump_monitor")
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
+        if self.monitor_dumper:
+            self.monitor_dumper.create_dir("qmp")
+
         dump_target_cmds =3D kwargs.get("testimage_dump_target")
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
         self.target_dumper.create_dir("qemu")
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/s=
sh.py
index 461448dbc5..faffc8acdf 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -43,6 +43,7 @@ class OESSHTarget(OETarget):
         if port:
             self.ssh =3D self.ssh + [ '-p', port ]
             self.scp =3D self.scp + [ '-P', port ]
+        self._monitor_dumper =3D None
=20
     def start(self, **kwargs):
         pass
@@ -50,11 +51,20 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
=20
+    @property
+    def monitor_dumper(self):
+        return self._monitor_dumper
+
+    @monitor_dumper.setter
+    def monitor_dumper(self, dumper):
+        self._monitor_dumper =3D dumper
+        self.monitor_dumper.dump_monitor()
+
     def _run(self, command, timeout=3DNone, ignore_status=3DTrue):
         """
             Runs command in target using SSHProcess.
         """
-        self.logger.debug("[Running]$ %s" % " ".join(command))
+        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
=20
         starttime =3D time.time()
         status, output =3D SSHCall(command, self.logger, timeout)
@@ -87,9 +97,15 @@ class OESSHTarget(OETarget):
             processTimeout =3D self.timeout
=20
         status, output =3D self._run(sshCmd, processTimeout, True)
-        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output)=
)
-        if (status =3D=3D 255) and (('No route to host') in output):
+        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (comma=
nd, status, output))
+#        if (status =3D=3D 255) and (('No route to host') in output):
+        # for testing right now
+        if self.monitor_dumper:
+            self.monitor_dumper.dump_monitor()
+        if status =3D=3D 255:
             self.target_dumper.dump_target()
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
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
index 09a44329e0..4d0357a155 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -96,3 +96,23 @@ class TargetDumper(BaseDumper):
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
+                output =3D self.runner.run_monitor(cmd)
+                self._write_dump("qemu_monitor", (cmd + "\n" + output))
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

