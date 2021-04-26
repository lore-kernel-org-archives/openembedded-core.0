Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.7897.1619448323771437106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oVFIw4HF;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDBtD9NDuWwf4FYl7sjNrgEkRAirIg+rehVMs08AGPsuLSguzpYDQ5jhdLu4DyEgWhEqBVpmF6nJ7t6YO31h8YyJmLMFZ4z17MfMRVN6+DA0wJCocRuQidrXgSCm7kJcsKWc2XwOfOYbZXirgRyFpD+0tXYmojO8BtEbxy/VXupKj7wnOUNmqX3YUg4bF8csDIAEhbZJsDBIkaKphkNSQoJufUKxgQePYGUPc8I5R/w6a5hUb3+dbrdLqcElhj/ASgacCoYqLP14HCADoA60bDQUJb50HmfDb7iMPi2LgpVSVwzvsPFBrTCZpSQpidOYQ68eCLUMeDfwhCUDPBgAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+HdQHmpQoxcs8B1ym7ETMTmNxFDbPvaBvVl+zwcH9A=;
 b=ZxNk9FXR5Pb4ttBsU8apMoh1L6WJBU0rVRfaOuGN/SdnbMyfSyK3M0L2CYbWrtzDoWOCvYygLE6ICsS3awIqdILKcCp1s+QYy6oA2jqAW9y+tzBHCMwUk+CEoOPRBoxOOEWc8yK1z6SSG/MtyAP2xM8kSCIDrFGPzWGKnuTd+8rb+/H8t1yIAJvwWcOmTinEeM3zAP3oLomChEbAjdena5MbaAI/hJRiHnVtIcEExMNnjOKx5gm7xZnFWqVGw+fm/U+s+Ny6ShJ/zkzACGugc3uxCl2KD9i3p652aJppJ/aIGYGt1TiKul4bJ3SkZHwfjsghcjjTHB6XDxIv009quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+HdQHmpQoxcs8B1ym7ETMTmNxFDbPvaBvVl+zwcH9A=;
 b=oVFIw4HFYWF5osRbAcAz+jcBPsYdEXmBJkaSk9C+dnIV5+1YlpPngApdFezYlH+HGz3SeTuYLlJUleO+TPc4JtRSQZ/qslxpKhwxRj9tnAUV+Cv6efRREypMw5JFXbrMYvl+zqlHFW+Teq34W1v0LHOShcgGAX99L72AJNwmdcw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 26 Apr
 2021 14:45:22 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 14:45:22 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Add support for qmp commands
Date: Mon, 26 Apr 2021 07:45:10 -0700
Message-ID: <20210426144510.1568305-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426144510.1568305-1-saul.wold@windriver.com>
References: <20210426144510.1568305-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MW4PR03CA0164.namprd03.prod.outlook.com (2603:10b6:303:8d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 14:45:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74357b2f-807a-455d-b5aa-08d908c1ebba
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50735B08F80035AE4E3B274DEE429@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HWUiStRmzodzT1f9dCz8KcCsQpZtLauAPQMJNMJfWufaX+z/pPOO7FwJtwZbxWrzhW5Q9rI8G7+b4kSXns4bQTYuIN1fuZtMbVSRrejs+Jz46eywzsXcNSfevAWKWgNPrfICcknLiNKf53sDZfK3/oQ+Q06IaS8WV2U5y6XYfsORKhBPcGJNlGdRg3BresaTgYmYGPV9WkpAUGCN0pTi3sn1u0qPgbIj6evFM+3z8SLtpXb+659OKdYFQYR4NC4lzLXvH7DilgTKv6iEfVmIdv350N5QI2mkiOLOSG+LL/VboP0l/jAmHMzZa7b4Px3UR++UTBzHNSaYgzy2amX1rKsDLAPaBvEK9iIcx/THFpA88b8+E8o3j0Rie4rNMrhnwBIINve96+GR7mpRk9jROwJVV6zKBTiaWBkzcdNn7e7FUVU7GgXW5x2W9Rjz8K7TOgFVZsGiBIOiDTuynbIv6cKuYhRPj+6ZH0Xdn4M9A897K786bjmh4luQZ/jYQcKHFMRlC8eEzRggmz85Bx1eFhJawSS3gExyvYhHQkgGTj3O/zlpb2ZFKPqmhK1R5LdgFfUKiNY1ND0efw378GElg+YG9eFNivKWgvMwuq0MMH1oIzjakZf8pXZ3UKSS9yekMhnQCvy/zv5YMqcjJ+aISpMsBpyBJjWKHvVibyig88xmfqgUR5cBnKZBXLgG9XgUiCJwmT0IepCmkXlm8QOZCZTkekKM8mQ0e1u90XCYFrfEKOSZdv7M1qllHifYpQDqUnXBpIxaSkuPvU8eqZm3aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(44832011)(2616005)(956004)(5660300002)(6506007)(6666004)(6916009)(6512007)(36756003)(2906002)(316002)(30864003)(16526019)(478600001)(966005)(26005)(6486002)(1076003)(38350700002)(186003)(38100700002)(83380400001)(86362001)(66556008)(66476007)(52116002)(8676002)(8936002)(66946007)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ETCi4x4Hhsj6rdRaWZxNznc8pAVoYa1OAb3X2a9ZKFeR2tSKswOSd2+oYE4h?=
 =?us-ascii?Q?2Y2Ya4X3jL6z8U2R8IXqqhBWBp4B7Rr921Gza2ogz9XopVOn8jp/bC/vBJUp?=
 =?us-ascii?Q?ZoKfL6Zf+d6G5C8rbIPUGlnQld6w4bU4vjX3mBZSXv8ztkE1Nkw+L1Phwr2g?=
 =?us-ascii?Q?QDnZTvxP+pDtAVaZb33qeAm8QdRhlKwUpr31PkfCJkUoqA0jLTjQc8MtXKKX?=
 =?us-ascii?Q?YoKMyZUZZbtOoIM40IdboPrSQAyjUA1o3/Va3HMW+KyKmaXvIDcCMRP4iPe/?=
 =?us-ascii?Q?X4BTbHHaPM7aqPGl8zoZlibHNo1gJqqB8wA7NF9xAYgysfzgqXB3UADRRS6L?=
 =?us-ascii?Q?AQxTE9bQTm+t2MZMM5TB+z42zg1sXYXiYtRbKZMB7YD1dWfYovVofg+X8ygL?=
 =?us-ascii?Q?o2N9BM5iWGo4drs0xvU6kv0ck005DsJuo3UHTCemIQjzodlehruQeLuMPs+Y?=
 =?us-ascii?Q?e0a/bcCuNBCGxpcmoazNgbTJkk6c/A2eqsNLF9REqywsmUkPvVlRQ7fxLnXA?=
 =?us-ascii?Q?GzgUz42EIpApDfkHT8JaHaaLfzpMA/gJLyqlChu2UZDyeK8bE1tdyoRV4CCX?=
 =?us-ascii?Q?+tFvjQiTVdPKKqMAriHy4DCszQHzpRbglwGmzP3taPjeSNXK+cvKXgIFVkvI?=
 =?us-ascii?Q?7/fe4rW3yeIDdZl8Mj+UwyXP/B9iD3NQSjaC6smFz7r37gdLYZGyo+qUhDw1?=
 =?us-ascii?Q?DUwZ702RqdHYcjAmMyVt3TqyygIENjYrZXAQT/cN8U7idGUS7tnUs+ynZ2qO?=
 =?us-ascii?Q?RRUTH6AMHbxSLvLkNut8XrT/VC/BDJ0SINjJQJH+HykFo5O3scnsOQCx5DQe?=
 =?us-ascii?Q?JDakq852IUXVExi8VSwjfBCyZWJYchT9tcRamF9QQpKKNODrlgCavqU0+Bwn?=
 =?us-ascii?Q?LHUaMN344VMDSSnpKWks+8dHCrcr04YxDXkGPY7nZZ0MIhzkGEgdTlhJMdfA?=
 =?us-ascii?Q?edgmFSMaQfCaTY/yUNoiTk06nN1RphLf8NeC9LxyMnOcYwwlzT4fyTiBmNW0?=
 =?us-ascii?Q?64BI5oDlwPd4/eJREV6ET9jmqPFm4zxsar/cqUOKwB2gQnGY5oQ29hx/UOx+?=
 =?us-ascii?Q?zsHg2pYLveKaipgZwXh8QeFxUa3nV5w4To2XmHXpZlls19MsyBxIQulDOXn8?=
 =?us-ascii?Q?R2qxf4jHyZNA3dja1GZ1muJ3P+osAwFnqojZU+hUmS6L38SOAzkb5GRm8I7I?=
 =?us-ascii?Q?ddLVbaI9yAI0GAWs3y/r7XxwWLcZVOo5otr3KfSDrzsDN8rn3Nfwisuwn6pE?=
 =?us-ascii?Q?kNC9yOFKDMWcECbtnjCg+bEOAHVgroEeD0PQJDTbS95dV6aN9gykEemlH7hT?=
 =?us-ascii?Q?GTjzA11S/CEEbB9jWSCHwVOo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74357b2f-807a-455d-b5aa-08d908c1ebba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 14:45:22.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peG3LGci/6Iw57WoTZk1NJKViES4rdo7YNs8AltnqSsOwl8gRF9s1RAr6G0lOj88H/3v3QroxAYh0CgcgZYdKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This adds support for the Qemu Machine Protocol [0] extending
the current dump process for Host and Target. The commands are
added in the testimage.bbclass.

Currently, we setup qemu to stall until qmp gets connected and
sends the initialization and continue commands, this works
correctly. If the UNIX Socket does not exist, we wait an timeout
to ensure to socket file is created.

With this version, the monitor_dumper is created in OEQemuTarget
but then set in OESSHTarget as that's where we get the SSH failure
happens. Python's @property is used to create a setter/getter type
of setup in OESSHTarget to get overridden by OEQemuTarget.

By default the data is currently dumped to files for each command in
TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor as
this is the naming convenstion in the dump.py code.

We use the qmp.py from qemu, which needs to get installed in the
recipe-sysroot-native of the target image.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass      |  6 +++
 meta/lib/oeqa/core/target/qemu.py   |  6 +++
 meta/lib/oeqa/core/target/ssh.py    | 17 ++++++-
 meta/lib/oeqa/targetcontrol.py      |  3 ++
 meta/lib/oeqa/utils/dump.py         | 32 +++++++++++--
 meta/lib/oeqa/utils/qemurunner.py   | 70 ++++++++++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu.inc |  2 +-
 7 files changed, 129 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index e6137595031..43de9d4d767 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -127,6 +127,11 @@ testimage_dump_host () {
     netstat -an
 }
=20
+testimage_dump_monitor () {
+    query-status
+    query-block
+}
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -320,6 +325,7 @@ def testimage_main(d):
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
index 792efca1f84..4a5df4a9a81 100644
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
                                  use_ovmf=3Dovmf, tmpfsdir=3Dtmpfsdir)
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
index 461448dbc56..923a223b25b 100644
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
@@ -50,6 +51,15 @@ class OESSHTarget(OETarget):
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
@@ -87,9 +97,14 @@ class OESSHTarget(OETarget):
             processTimeout =3D self.timeout
=20
         status, output =3D self._run(sshCmd, processTimeout, True)
-        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output)=
)
+        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (comma=
nd, status, output))
         if (status =3D=3D 255) and (('No route to host') in output):
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
+        if status =3D=3D 255:
             self.target_dumper.dump_target()
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
         return (status, output)
=20
     def copyTo(self, localSrc, remoteDst):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y
index 12057f855ae..005ebaa7f39 100644
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
@@ -149,6 +151,7 @@ class QemuTarget(BaseTarget):
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
index 09a44329e01..843e19fe8a6 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -4,6 +4,7 @@
=20
 import os
 import sys
+import json
 import errno
 import datetime
 import itertools
@@ -51,6 +52,8 @@ class BaseDumper(object):
             prefix =3D "host"
         elif isinstance(self, TargetDumper):
             prefix =3D "target"
+        elif isinstance(self, MonitorDumper):
+            prefix =3D "qmp"
         else:
             prefix =3D "unknown"
         for i in itertools.count():
@@ -58,9 +61,12 @@ class BaseDumper(object):
             fullname =3D os.path.join(self.dump_dir, filename)
             if not os.path.exists(fullname):
                 break
-        with open(fullname, 'w') as dump_file:
-            dump_file.write(output)
-
+        if isinstance(self, MonitorDumper):
+            with open(fullname, 'w') as json_file:
+                json.dump(output, json_file, indent=3D4)
+        else:
+            with open(fullname, 'w') as dump_file:
+                dump_file.write(output)
=20
 class HostDumper(BaseDumper):
     """ Class to get dumps from the host running the tests """
@@ -96,3 +102,23 @@ class TargetDumper(BaseDumper):
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
+        if self.runner is None:
+            return
+        if dump_dir:
+            self.dump_dir =3D dump_dir
+        for cmd in self.cmds:
+            try:
+                output =3D self.runner.run_monitor(cmd)
+                self._write_dump(cmd, output)
+            except:
+                print("Failed to dump QMP CMD: %s" % (cmd))
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 278904ba0b1..f6e10072887 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,8 +20,10 @@ import string
 import threading
 import codecs
 import logging
+import tempfile
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
+import importlib
=20
 # Get Unicode non printable control chars
 control_range =3D list(range(0,32))+list(range(127,160))
@@ -172,6 +174,21 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3Dg=
et_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
=20
     def launch(self, launch_cmd, get_ip =3D True, qemuparams =3D None, ext=
ra_bootparams =3D None, env =3D None):
+        # use logfile to determine the recipe-sysroot-native path and
+        # then add in the site-packages path components and add that
+        # to the python sys.path so qmp.py can be found.
+        python_path =3D os.path.dirname(os.path.dirname(self.logfile))
+        python_path +=3D "/recipe-sysroot-native/usr/lib/python3.9/site-pa=
ckages"
+        sys.path.append(python_path)
+        importlib.invalidate_caches()
+        try:
+            qmp =3D importlib.import_module("qmp")
+        except:
+            self.logger.error("qemurunner: qmp.py missing, please ensure i=
t's installed")
+            return False
+        qmp_port =3D self.tmpdir + "/." + next(tempfile._get_candidate_nam=
es())
+        qmp_param =3D ' -S -qmp unix:%s,server,wait' % (qmp_port)
+
         try:
             if self.serial_ports >=3D 2:
                 self.threadsock, threadport =3D self.create_socket()
@@ -188,7 +205,8 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
"'.format(bootparams, self.qemu_pidfile)
+        self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
 {2}"'.format(bootparams, self.qemu_pidfile, qmp_param)
+
         if qemuparams:
             self.qemuparams =3D self.qemuparams[:-1] + " " + qemuparams + =
" " + '\"'
=20
@@ -242,6 +260,7 @@ class QemuRunner:
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
                 if self.runqemu_exited:
+                    self.logger.warning("runqemu during is_alive() test")
                     return False
                 if self.runqemu.returncode:
                     # No point waiting any longer
@@ -253,8 +272,50 @@ class QemuRunner:
             time.sleep(0.5)
=20
         if self.runqemu_exited:
+            self.logger.warning("runqemu after timeout")
+            return False
+
+        if self.runqemu.returncode:
+            self.logger.warning('runqemu exited with code %d' % self.runqe=
mu.returncode)
             return False
=20
+        if not self.is_alive():
+            self.logger.warning('is_alive() failed later')
+            return False
+
+        # Create the client socket for the QEMU Monitor Control Socket
+        # This will allow us to read status from Qemu if the the process
+        # is still alive
+        self.logger.debug("QMP Initializing to %s" % (qmp_port))
+        try:
+            self.qmp =3D qmp.QEMUMonitorProtocol(qmp_port)
+        except OSError as msg:
+            self.logger.warning("Failed to initialize qemu monitor socket:=
 %s File: %s" % (msg, msg.filename))
+            return False
+
+        self.logger.debug("QMP Connecting to %s" % (qmp_port))
+        if not os.path.exists(qmp_port) and self.is_alive():
+            self.logger.debug("QMP Port does not exist waiting for it to b=
e created")
+            endtime =3D time.time() + self.runqemutime
+            while not os.path.exists(qmp_port) and self.is_alive() and tim=
e.time() < endtime:
+               self.logger.warning("QMP port does not exist yet!")
+               time.sleep(0.5)
+            if not os.path.exists(qmp_port) and self.is_alive():
+                self.logger.warning("QMP Port still does not exist but QEM=
U is alive")
+                return False
+
+        try:
+            self.qmp.connect()
+        except OSError as msg:
+            self.logger.warning("Failed to connect qemu monitor socket: %s=
 File: %s" % (msg, msg.filename))
+            return False
+        except qmp.QMPConnectError as msg:
+            self.logger.warning("Failed to communicate with qemu monitor: =
%s" % (msg))
+            return False
+
+        # Release the qemu porcess to continue running
+        self.run_monitor('cont')
+
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" =
%
                               (self.runqemutime, time.strftime("%D %H:%M:%=
S")))
@@ -380,7 +441,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -441,6 +501,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.close()
+            self.qmp =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -499,6 +562,9 @@ class QemuRunner:
                         return True
         return False
=20
+    def run_monitor(self, command, timeout=3D60):
+        return self.qmp.cmd(command)
+
     def run_serial(self, command, raw=3DFalse, timeout=3D60):
         # We assume target system have echo to get command status
         if not raw:
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index f0416b03793..6f34df77b2a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,7 +30,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://mmap2.patch \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-fil=
e.patch \
-	   file://CVE-2021-20203.patch \
+           file://CVE-2021-20203.patch \
            file://CVE-2020-35517_1.patch \
            file://CVE-2020-35517_2.patch \
            file://CVE-2020-35517_3.patch \
--=20
2.25.1

