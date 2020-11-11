Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.71])
 by mx.groups.io with SMTP id smtpd.web09.2378.1605068397980897557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 20:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d4MlfCut;
 spf=pass (domain: windriver.com, ip: 40.107.77.71, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VP0tKgjyHtshqUnxW9IpW1LERnryXWM0PDOUd2cuzZD1bm7xSjN8NA/Pu7gaPTehiuxf28aykozgxeN6ymSMhB61j3zSssZ3cOCpDAWoFjzgirp+ZK+PSQ12pnOudPHGZWhCVibHVYqtHSjuDRvZNbdg/VpqKyfMx8DUwoewKHeRA5mlhC+76hXNoV9xDQUYWuKCUdT/YbCYjFW+22j8AfLGmLNdmTp657l9VbjtDe2efTI/l20HEhZ/vsPtdNVP1ChRMyeyd4ZGyW2dPIfS90nve4vRjXBarn2NP3NcNc5wUF1OWbV3cDYB4nxMiKGMonMcM4II76YBeFsfviwfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVzd7BS32MsDytd4bxnTaMH1acMKY+i7Ue+fke2zp4Q=;
 b=HM6WTeTkmVneAG6cg1bbNQo99YJbkRJNwOzcvne8zXHxoulaXf0TcxA5B+tegELz18Fz6IGI2cGOt+7RD5wNqvlaMGVHziOBN5XMDhh2f+pwE09CikO8ubcgQMtd90de6FnwxTiF97d1XynhDbr99zUc6ZWx1EWRCCvckPSW3okhFG1i46rvkBz5F8SFSx+USmwbTrY2T+Sq3XgACSejCL6q+my8T7xY0LYL7thYThQHgxkKV0IkMXb1ZaxcBZ7L+4dpkFaM+opeqF5fiX3TgQApF9tCIxgWue9jCo3bszPAQpe64/vwt1xaZ8+/0Kf5kv01Y+EG3h4YQg8mrH43WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVzd7BS32MsDytd4bxnTaMH1acMKY+i7Ue+fke2zp4Q=;
 b=d4MlfCut3zDy1eeWpHB7UcMfkokstbIbMfBC1S3kvPTloRbmemmq4cpJsG1bGdav32Tyd5LINpMLnKSNGHBkYdAHoHmNNA9zULvxjAFUrGWSPIH4PYEf0Ux1kzO/lieZ+L4iX7ykYPF7aswRUg+8BJ2eTvW4vZMBGAH0Q7MqcsU=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2769.namprd11.prod.outlook.com (2603:10b6:406:b3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 04:19:56 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5%8]) with mapi id 15.20.3541.023; Wed, 11 Nov 2020
 04:19:56 +0000
Subject: Re: [OE-core] [PATCH] [WIP] qemurunner.py: qemu as client
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20201111041003.864509-1-saul.wold@windriver.com>
 <164658B07603FC62.32470@lists.openembedded.org>
Message-ID: <426872d7-910b-eca0-9fbe-b4be69d1ba59@windriver.com>
Date: Tue, 10 Nov 2020 20:19:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <164658B07603FC62.32470@lists.openembedded.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR15CA0057.namprd15.prod.outlook.com
 (2603:10b6:301:4c::19) To BN6PR11MB1873.namprd11.prod.outlook.com
 (2603:10b6:404:106::19)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR15CA0057.namprd15.prod.outlook.com (2603:10b6:301:4c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend Transport; Wed, 11 Nov 2020 04:19:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55817c74-6fc7-4fc6-2998-08d885f90b91
X-MS-TrafficTypeDiagnostic: BN7PR11MB2769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2769D3BE0EB63376C572B309EEE80@BN7PR11MB2769.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	chkubeKJpjxJxdVLcyKzoFwkkB1WVD8NyWbzdPdep2ZWVFV8zf6XMLFJNIdfSXda7StQEom6QQSETqiugLFa+9k6xdsUCA+QXIV0FVaGrW5rc8kKc1T1VM7/jDhK+gVsheAQyMPplj9zEZzFVKqwzUZU0UZhZYqWHZNfl7Q7mwCE6ICKVFm4BOMUujg+MS2W8rxSqK02W+2hqF6wlwmr9MHoulJBR161ZFGe2ACE9xqn8umUlB25vTgSB2J36brBglyKERRTJBrkOOLXddZhs0+SxTIjD6N5UXIwOt6heEA0jHKJUvbol5TSnED6YORF+njI4ZUmzdCypJyX79YizZoqYpU7tXX7SgA9TBK+3ajtuNgZAa8FsC4Ylat90IbDarik8UFDOADbAJM05/z9jpjMSXs0sSN1PFNJoeZizbfg3fkVciBUmv0H9kwtrk1a0TRiuXaXvD51Kb+DX3dsew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39830400003)(136003)(396003)(31696002)(966005)(2616005)(52116002)(66476007)(86362001)(6486002)(478600001)(16576012)(956004)(30864003)(83380400001)(8936002)(8676002)(31686004)(66946007)(2906002)(5660300002)(66556008)(36756003)(53546011)(6916009)(186003)(16526019)(316002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7IbbAkqm06qMOdQR48e4A4kKSQ2N2+CQrwYobj3Ju0QWzGnW4iVzR6q+VO9PqSd52eVibIiwUISEhgF4tipxM19XKyIYXuIerPxcq4dcgKNmu66+IaOPrF28ylYD6RcJ0ocxlz1OAc+ZY0vLUu1+Qsbu+1Nl59VJa7w6mjf605+kRT0O2AavSl/b2vgmrvdFAx6T9eCY/7H/2xcojqgaqxpfn5kwLuJdOgaCQf0nwHITxztbxtBiup+ALmY5We3qrPoHDIPXoHR6ukPEE2/g13ltU8idjqQiY1I9DlZXw8NX7jyBhC1Sp+Lv6hbxfFf4M8oGYnfAFdjVfO8geXt87n3XkrRuFYpKPZd62kJvImwvNM9919MLQdL1nOH6KATePE5grcUEQIg2UcKOhABsoon8bv5HzlLfRgQ1dAci4LhzfkJLpisp+fqGgyKBf0PIFgriWY99roq4zphMF+/9oUvM4+8/9zxLaEn5pxWzUlnHjrspkm6+KukkZnB4CHmLD6S72ahmohLwkC1ASKsQdkfjTHiywuwm2nKJMJ4sH+YACua42GJ0tjmup22teCOpoHxbnbpRNMjuGLWEWp1U6iB7NPi6Fhxov3H6nyIhwGBsuPGG8x6AupIcEfmHOfQt494s+0sDBfjfQnI+lwovSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55817c74-6fc7-4fc6-2998-08d885f90b91
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 04:19:56.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHw+W/hzxRBd474teaVtV/GP+ZSguIvB7xsinSTYNQtowmzuu35Pnj8pubbYjsQ75sG33bq+nJdO9NRxDCnZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2769
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Oops, need to double check what 000* is going to actual send, please 
ignore this and the following older qemu_runner patch.

Sau!

On 11/10/20 8:10 PM, Saul Wold wrote:
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta/lib/oeqa/core/target/ssh.py       |  9 ++--
>   meta/lib/oeqa/runtime/cases/network.py | 28 +++++++++++
>   meta/lib/oeqa/runtime/files/kill_net   |  5 ++
>   meta/lib/oeqa/targetcontrol.py         |  3 ++
>   meta/lib/oeqa/utils/dump.py            | 22 ++++++++
>   meta/lib/oeqa/utils/qemurunner.py      | 70 +++++++++++++++++++++++++-
>   6 files changed, 133 insertions(+), 4 deletions(-)
>   create mode 100644 meta/lib/oeqa/runtime/cases/network.py
>   create mode 100644 meta/lib/oeqa/runtime/files/kill_net
> 
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index 461448dbc5..c744b90719 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -54,7 +54,7 @@ class OESSHTarget(OETarget):
>           """
>               Runs command in target using SSHProcess.
>           """
> -        self.logger.debug("[Running]$ %s" % " ".join(command))
> +        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
>   
>           starttime = time.time()
>           status, output = SSHCall(command, self.logger, timeout)
> @@ -77,6 +77,7 @@ class OESSHTarget(OETarget):
>                           0:          No timeout, runs until return.
>           """
>           targetCmd = 'export PATH=/usr/sbin:/sbin:/usr/bin:/bin; %s' % command
> +        self.ip = "192.168.7.5"
>           sshCmd = self.ssh + [self.ip, targetCmd]
>   
>           if timeout:
> @@ -87,8 +88,10 @@ class OESSHTarget(OETarget):
>               processTimeout = self.timeout
>   
>           status, output = self._run(sshCmd, processTimeout, True)
> -        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output))
> -        if (status == 255) and (('No route to host') in output):
> +        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
> +#        if (status == 255) and (('No route to host') in output):
> +        if status == 255:
> +            self.target_dumper.dump_target()
>               self.target_dumper.dump_target()
>           return (status, output)
>   
> diff --git a/meta/lib/oeqa/runtime/cases/network.py b/meta/lib/oeqa/runtime/cases/network.py
> new file mode 100644
> index 0000000000..49fcac133a
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/network.py
> @@ -0,0 +1,28 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +class NetworkTest(OERuntimeTestCase):
> +
> +    @classmethod
> +    def setUp(cls):
> +        src = os.path.join(cls.tc.runtime_files_dir, 'kill_net')
> +        dst = '/home/root/kill_net'
> +        cls.tc.target.copyTo(src, dst)
> +
> +
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    def test_network_check(self):
> +        (status, output) = self.target.run('/sbin/ip a')
> +        msg = 'Failed to run "ip a". Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
> +    @OETestDepends(['network.NetworkTest.test_network_check'])
> +    def test_run_kill_net(self):
> +        (status, output) = self.target.run('/bin/bash /home/root/kill_net > results 2>&1 &')
> +        msg = 'Failed to run "kill_net". Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> diff --git a/meta/lib/oeqa/runtime/files/kill_net b/meta/lib/oeqa/runtime/files/kill_net
> new file mode 100644
> index 0000000000..981eec816d
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/files/kill_net
> @@ -0,0 +1,5 @@
> +#!/bin/bash
> +
> +ip a
> +sleep 1
> +ip link set eth0 down
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index 19f5a4ea7e..8cdd984179 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -17,6 +17,7 @@ from oeqa.utils.sshcontrol import SSHControl
>   from oeqa.utils.qemurunner import QemuRunner
>   from oeqa.utils.qemutinyrunner import QemuTinyRunner
>   from oeqa.utils.dump import TargetDumper
> +from oeqa.utils.dump import MonitorDumper
>   from oeqa.controllers.testtargetloader import TestTargetLoader
>   from abc import ABCMeta, abstractmethod
>   
> @@ -108,6 +109,7 @@ class QemuTarget(BaseTarget):
>           self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
>           dump_target_cmds = d.getVar("testimage_dump_target")
>           dump_host_cmds = d.getVar("testimage_dump_host")
> +        dump_monitor_cmds = ['{"execute":"query-status"}\n', '{"execute":"query-status"}\n']
>           dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>           if not dump_dir:
>               dump_dir = os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdump')
> @@ -147,6 +149,7 @@ class QemuTarget(BaseTarget):
>                               serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
>   
>           self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
> +        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
>   
>       def deploy(self):
>           bb.utils.mkdirhier(self.testdir)
> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
> index 09a44329e0..058d1e46b1 100644
> --- a/meta/lib/oeqa/utils/dump.py
> +++ b/meta/lib/oeqa/utils/dump.py
> @@ -96,3 +96,25 @@ class TargetDumper(BaseDumper):
>               except:
>                   print("Tried to dump info from target but "
>                           "serial console failed")
> +                print("Failed CMD: %s" % (cmd))
> +
> +class MonitorDumper(BaseDumper):
> +    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
> +
> +    def __init__(self, cmds, parent_dir, runner):
> +        super(MonitorDumper, self).__init__(cmds, parent_dir)
> +        self.runner = runner
> +
> +    def dump_monitor(self, dump_dir=""):
> +        if dump_dir:
> +            self.dump_dir = dump_dir
> +        for cmd in self.cmds:
> +            try:
> +                print("dump_target: %s" % cmd)
> +                output = self.runner.run_monitor(cmd)
> +                print("result: %s" % (output))
> +                self._write_dump(cmd.split()[0], output)
> +            except:
> +                print("Failed to dump montor data")
> +                print("Failed CMD: %s" % (cmd))
> +
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index 77ec939ad7..0ca0d78470 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -20,6 +20,7 @@ import string
>   import threading
>   import codecs
>   import logging
> +from contextlib import closing
>   from oeqa.utils.dump import HostDumper
>   from collections import defaultdict
>   
> @@ -84,6 +85,12 @@ class QemuRunner:
>           default_boot_patterns['send_login_user'] = 'root\n'
>           default_boot_patterns['search_login_succeeded'] = r"root@[a-zA-Z0-9\-]+:~#"
>           default_boot_patterns['search_cmd_finished'] = r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#"
> +        monitor_cmds = defaultdict(str)
> +        monitor_cmds['qmp_cap'] = '{"execute":"qmp_capabilities","arguments":{"enable":["oob"]}}\n'
> +        monitor_cmds['cont'] = '{"execute":"cont"}\n'
> +        monitor_cmds['quit'] = '{"execute":"quit"}\n'
> +        monitor_cmds['preconfig'] = '{"execute":"x-exit-preconfig"}\n'
> +        self.monitor_cmds = monitor_cmds
>   
>           # Only override patterns that were set e.g. login user TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
>           for pattern in accepted_patterns:
> @@ -168,10 +175,17 @@ class QemuRunner:
>           return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
>   
>       def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
> +        # Find a free socket port that can be used by the QEMU Monitor console
> +        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
> +            s.bind(('', 0))
> +            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> +            qmp_port = s.getsockname()[1]
> +
>           try:
>               if self.serial_ports >= 2:
>                   self.threadsock, threadport = self.create_socket()
>               self.server_socket, self.serverport = self.create_socket()
> +
>           except socket.error as msg:
>               self.logger.error("Failed to create listening socket: %s" % msg[1])
>               return False
> @@ -185,6 +199,9 @@ class QemuRunner:
>           if os.path.exists(self.qemu_pidfile):
>               os.remove(self.qemu_pidfile)
>           self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
> +        qemuparams += ' -S -qmp tcp:localhost:%s,server,wait' % (qmp_port)
> +        qemuparams += ' -monitor tcp:localhost:4444,server,nowait'
> +
>           if qemuparams:
>               self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
>   
> @@ -250,6 +267,28 @@ class QemuRunner:
>   
>           if self.runqemu_exited:
>               return False
> +
> +        # Create the client socket for the QEMU Monitor Control Socket
> +        # This will allow us to read status from Qemu if the the process
> +        # is still alive
> +        try:
> +            self.monitor_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +            self.monitor_socket.connect(("127.0.0.1", qmp_port))
> +            self.monitor_socket.setblocking(False)
> +
> +        except socket.error as msg:
> +            self.logger.error("Failed to connect qemu monitor socket: %s" % msg[1])
> +            return False
> +
> +        # Run an empty command to get the initial connection details, then
> +        # send the qmp_capabilities command, this is required to initialize
> +        # the monitor console
> +        mon_output = self.run_monitor("")
> +        self.logger.debug("Monitor: %s" % mon_output)
> +        mon_output = self.run_monitor(self.monitor_cmds['qmp_cap'], timeout=120)
> +        self.logger.debug("Monitor: %s" % mon_output)
> +        mon_output = self.run_monitor(self.monitor_cmds['cont'], timeout=120)
> +        self.logger.debug("Monitor: %s" % mon_output)
>   
>           if not self.is_alive():
>               self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
> @@ -338,6 +377,7 @@ class QemuRunner:
>           reachedlogin = False
>           stopread = False
>           qemusock = None
> +        monsock = None
>           bootlog = b''
>           data = b''
>           while time.time() < endtime and not stopread:
> @@ -376,7 +416,6 @@ class QemuRunner:
>                           sock.close()
>                           stopread = True
>   
> -
>           if not reachedlogin:
>               if time.time() >= endtime:
>                   self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
> @@ -437,6 +476,9 @@ class QemuRunner:
>               self.runqemu.stdout.close()
>               self.runqemu_exited = True
>   
> +        if hasattr(self, 'monitor_socket') and self.monitor_socket:
> +            self.monitor_socket.close()
> +            self.monitor_socket = None
>           if hasattr(self, 'server_socket') and self.server_socket:
>               self.server_socket.close()
>               self.server_socket = None
> @@ -495,6 +537,32 @@ class QemuRunner:
>                           return True
>           return False
>   
> +    def run_monitor(self, command, timeout=60):
> +        data = ''
> +        self.monitor_socket.sendall(command.encode('utf-8'))
> +        start = time.time()
> +        end = start + timeout
> +        while True:
> +            now = time.time()
> +            if now >= end:
> +                data += "<<< run_monitor(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
> +                break
> +            try:
> +                sread, _, _ = select.select([self.monitor_socket],[],[], end - now)
> +            except InterruptedError:
> +                continue
> +            if sread:
> +                answer = self.monitor_socket.recv(1024)
> +                if answer:
> +                    data += answer.decode('utf-8')
> +                    if data.rfind('\r\n') != -1:
> +                        break;
> +                else:
> +                    raise Exception("No data on monitor socket")
> +
> +        if data:
> +            return (str(data))
> +
>       def run_serial(self, command, raw=False, timeout=60):
>           # We assume target system have echo to get command status
>           if not raw:
> 
> 
> 
> 
> 

-- 
Sau!
