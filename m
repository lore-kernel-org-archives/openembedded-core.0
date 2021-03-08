Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web11.3961.1615240593255120417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 13:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ehDvDzsE;
 spf=pass (domain: windriver.com, ip: 40.107.223.87, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGQuuyobwOhEnppNKrYBOgWPpVjydRatwME7d1jog7+HjMiNrvmhNYBuh9nrAo1bJuvCBGdao2knfPWZZ/pnfhhkNCrc6Aq7hXAVEJYyVtJhq1VJXXRA6H/3ahOfAW4hyaECWwmYX68yJ1PkQQYZD4DggGn3ufhgivvgSkSCgDJCBIpssRdFrnpnyGCWm39tDHJKlttPBS2Wwketqh5EWiS2eVz+d1gaj4LXTvjpz7du55LeFliS1a10GilH2XsXHilCU6OxbjhYQxJ4FV0huZpEGepHk3WTGVdHRJLuRQl2awRdoHgNx0ueixs3tJDqmc5/TJpxaw7n09+bejQcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4+y1xDu4ataDQSCyZ/kxUbBfdr4+givriCq+vEHdnk=;
 b=eDjdSeAByTwMVLbuzoCZi+NEg9Ig/xv6j8XWmFgrrI5Gk+nvN86Vdjj1YYTimEfr4PzRM3301+rvQVPLF0phCU8+gIWXUmr3fkc+ZA44RGxfS6Gr4jkxrmmVIIbLD8hdo2MfldoHI/bTvgYIEwGyTFc2iR7jPwWHkTA7acB/rYvTePQ24lSgLTEcwoj4H9ZUfJjFNlXCHLsZqm1rVPyJWi2omgXP29diq7u9JXIcU01LJq3BJocFNUAw+qlNE4Uj2pMqFD9es5VpzMSTJM2nNcbD5KPGSttXeVD4jzk3u93kD5+nzC0K4/R3PVm/PuGImeas+4tk40ZUbsy4jwCzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4+y1xDu4ataDQSCyZ/kxUbBfdr4+givriCq+vEHdnk=;
 b=ehDvDzsEd6xI4i52iqhVj50pjvg4NMpy1XDHJkvcefx0dNJ0QIWXyMS99dOxksesFmTagXJ+0WH8I625ZxtL878iXYcQgbHz6W8wD6+GXr6GKLtv8WwMrt9Z/NYgih1+ZNh//31RkobNhkm/5hoW5mR0Z1ZKEJ2r8XD0UkLzs68=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 21:56:26 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 21:56:26 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] valgrind: Fix nlcontrolc.vgtest
Date: Mon,  8 Mar 2021 16:56:08 -0500
Message-ID: <20210308215608.16380-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 21:56:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f57ff4b-072d-466e-9ea1-08d8e27d0535
X-MS-TrafficTypeDiagnostic: SN6PR11MB2909:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB29092387B2C8DD811269C4EB80939@SN6PR11MB2909.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L/ZnQ7Dk86UN8Gz0pE7BoMIIqrAU2R1mGTV1naPM4aTql8R3Vt5exnSAqMN2ED9xDrhqt17ar5RkIf3hULDaA3i0yrQOWc4DvZJ4Gvjv/H91Tj6nxytzRdCbSntBmxYb59I+XPlaCECCNW+SGJmpzTkPreqSuT/Sj7hxxXaq+oLkdYzm1FM/yznvNjJYDnh/GmDNXpHg5DUlbgJNdNTTPXDYn4OAELMbk/RIm9rLtgr4Njo8AhtrN687gz38pWn+fGPPFDry3qJk21PC+LdcmGZoSzmi9EMayk5cxPT9tlz2+hLeE0iyLaeZx6AWyKwuOKVJQgLUN/LDpANkc9AHGY9CbRS6Ivc7J2pAV9eOWpbnqFarK54JflG+H08qcw7QwUaEASywTaNpKMgd8AR31NrJlwb+7VAC9lz+/RLJBveshWN/NZf0yh9hhXE1C57Qcj2s7zuVDGR7+6gq28tZioI+Un2rbJQB7cBszLD7Gz5izggjg9E6hW0n1BaByXqwiMPjKxsCGdKqmWrJjOAKUHGk75jKNYczbd/gjsQnNW+C9KFFOvZ5fZBo+JUQHU+B5G684loP1izPt8K2P4KxSbpTLkT+gJ7h77PHbfr1mpY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(66476007)(36756003)(86362001)(26005)(83380400001)(8936002)(2616005)(6512007)(16526019)(66556008)(30864003)(66946007)(316002)(6506007)(8676002)(186003)(52116002)(1076003)(956004)(6666004)(2906002)(5660300002)(478600001)(6916009)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PJf4MJTvumLzZQCm/Du3NAriKvDJdAZjK/5W57UD++M7Iwh8ZluRp4h/gqie?=
 =?us-ascii?Q?Cete0rO2kKGrZRXBgTgkdpB5q9wS5sEJ6sB+i1E5OCsWAdjy54PxXHvzLh2Q?=
 =?us-ascii?Q?pMBuYJLZdessOOA8NrKnJQX1Ng6PhRl+ZqIRLjNUS+5ZKncI2FqFnoOYAz9/?=
 =?us-ascii?Q?S5ZTdYGRy7SciGliJv5SgkiY9luj7+Daf3SN8hyxsUvNLtWmAg+DBxgB20Ir?=
 =?us-ascii?Q?pzCqUDtNgVPJa7/aIMRMh2aoAl9jhdmSwotrfDECcKKKlgLVcV7+081Cl3HV?=
 =?us-ascii?Q?s4dJBGy6pCt9CMlwH8VNlwYp/A0zHErWqK0yBM7w3w+3o0guRuHNuj3p92+4?=
 =?us-ascii?Q?kKY799CzTRc0i2hSCUN9u7kk0sda/VXGZW7BVCaX8DDKZrBsVVXJDBs0OtjW?=
 =?us-ascii?Q?QT99g0IFMZfQiDlQv1WdXuIU5higA/VsJvM8aRRS0e8OUcl64aOgjDMdyKGu?=
 =?us-ascii?Q?nbjLEyVuBUPIMF1Nakpzx7C7XSHjEBhZFz9fo8kxGq+izG8J+3YajcfxaEMo?=
 =?us-ascii?Q?1mC9Lx7t5gWsbHtPspuMOxZG/y4gEAmjed7YJJ8yfDhrrCVHuI4PunJbNzRR?=
 =?us-ascii?Q?uZu46QYq1A+G3lsmDsExJL2TMYkQ5B013biY0Z6OKo2OdPQuslurfBW+T/eZ?=
 =?us-ascii?Q?MuIt5weIao8wuhUPA5e8y6BnbDKSPdFlt2K0c477xRl+9xS9hxj4PDAEr7vA?=
 =?us-ascii?Q?DPTnc/18Vj/87kdCa3FOiLKIJRnNvoAnYFo2jlP0MOmMK7ivYRu0/Zta7uZt?=
 =?us-ascii?Q?rsdP/6c15sh5eMNPSWTXoVfdUQCKVOE/Mqc9EvVN9Fc9uvagd6gsZ7RY4gQ9?=
 =?us-ascii?Q?Uji4QEE8+mUeXxAjvPBrcGKIbspJI1zrNv8szOL01ZBm7K1pjyqExIlbEcHt?=
 =?us-ascii?Q?9tTzP35T3d8vOIfW2RZgxk+IoAV0OiqBonuXdji7+XYdwT4vAZWIKXDOWJJZ?=
 =?us-ascii?Q?JLPjy8CshbjQXXKih82W7inYiMxn37G4VBzpHJ5uAft4OsnbJwtIk0cd47ll?=
 =?us-ascii?Q?hQRjnoihkW2FUD+uv2cQzg22C1ZXSjIRVKECF2WL1U1H/A0PMf05wYxiu5nh?=
 =?us-ascii?Q?Ewfue1loCObken3M2bAnbtEsKnEvBW4JiF+SpCCYAJsAVKRbHUASyBp9rpkt?=
 =?us-ascii?Q?ZCVs+aLkVa/Mk7XdsOIYBwygzxPV9Ok3YNNKdzJ1w0eFTSHQMqJsZJsrNwik?=
 =?us-ascii?Q?V1HBma/2453MWgPpt1Av/LKTwdBmoL652WdAbCkL7EcmRFbilNCBXtymv7Y0?=
 =?us-ascii?Q?OaaGFII368/4dhOgU364tRWbF4zOo/DS8d7743HCmO75SBlREvzdHrtm9X0o?=
 =?us-ascii?Q?mPkl4aDaYkLNTFc9O8R6cim6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f57ff4b-072d-466e-9ea1-08d8e27d0535
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 21:56:26.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIyuChoe1PoH2JC/jUHih8Ybw3yrbmIQ8O3dsin58B6jnTAi5WPwpD5WK86yrNDGIQpt2PLMEVSpDJwfyWPZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2909
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Backport a recent upstream patch
that redesigned the test.

It's now enabled for both x86-64 and arm.

[YOCTO #14223]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...gtest-hanging-on-newer-glibc-and-or-.patch | 200 ++++++++++++++++++
 ...Disable-nlcontrolc.vgtest-for-x86-64.patch |  36 ----
 .../valgrind/valgrind_3.16.1.bb               |   2 +-
 3 files changed, 201 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcont=
rolc.vgtest-hanging-on-newer-glibc-and-or-.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_=
tests-Disable-nlcontrolc.vgtest-for-x86-64.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vg=
test-hanging-on-newer-glibc-and-or-.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
new file mode 100644
index 0000000000..98cbcd132c
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-ha=
nging-on-newer-glibc-and-or-.patch
@@ -0,0 +1,200 @@
+From 83c24e31df6932a6d4fced179050c6d8d8c6f3b5 Mon Sep 17 00:00:00 2001
+From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
+Date: Sun, 7 Mar 2021 22:29:27 +0100
+Subject: [PATCH] Fix nlcontrolc.vgtest hanging on newer glibc and/or arm64
+
+This test verifies that GDB can interrupt a process with all threads
+blocked in a long select syscall.
+The test used to terminate by having GDB modifying the select argument.
+However, modifying the select argument works only for specific arch
+and/or specific versions of glibc.
+The test then blocks on other architectures/glibc versions.
+
+The previous version of the test was:
+  * first launching sleepers so as to have all threads blocked in long sel=
ect
+  * interrupting these threads
+  * changing the select time arg so that the threads burn cpu
+  * and then change variables to have the program exit.
+
+The new version does:
+  * first launches sleepers so that all threads are burning cpu.
+  * interrupting these threads
+  * change the local variables of sleepers so that the threads will
+    block in a long select syscall
+  * interrupt these threads
+  * kill the program.
+
+With this new version, we still check the behaviour of gdb+vgdbserver
+for both burning and sleep threads, but without having the termination
+depending on modifying select syscall argument.
+
+Tested on debian amd64 and on ubuntu arm64 (to check the test does not han=
g
+on an arm64 platform).
+
+Upstream-Status: Backport
+
+From commit on master:
+c79180a3afcf65902e578646c3b716cc749db406
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ gdbserver_tests/nlcontrolc.stderr.exp  |  4 +-
+ gdbserver_tests/nlcontrolc.stdinB.gdb  | 57 +++++++++++++++-----------
+ gdbserver_tests/nlcontrolc.stdoutB.exp | 25 ++++++-----
+ gdbserver_tests/nlcontrolc.vgtest      | 12 +++---
+ 4 files changed, 56 insertions(+), 42 deletions(-)
+
+diff --git a/gdbserver_tests/nlcontrolc.stderr.exp b/gdbserver_tests/nlcon=
trolc.stderr.exp
+index ac75bb3da..b63a9a988 100644
+--- a/gdbserver_tests/nlcontrolc.stderr.exp
++++ b/gdbserver_tests/nlcontrolc.stderr.exp
+@@ -3,9 +3,9 @@ Nulgrind, the minimal Valgrind tool
+ (action at startup) vgdb me ...=20
+=20
+=20
+-loops/sleep_ms/burn/threads_spec/affinity:  1000000000 1000000000 1000000=
000 BSBSBSBS 1
++loops/sleep_ms/burn/threads_spec/affinity:  1000000000 0 100000 BSBSBSBS =
1
+ Brussels ready to sleep and/or burn
+ London ready to sleep and/or burn
+ Petaouchnok ready to sleep and/or burn
+ main ready to sleep and/or burn
+-
++Gdb request to kill this process
+diff --git a/gdbserver_tests/nlcontrolc.stdinB.gdb b/gdbserver_tests/nlcon=
trolc.stdinB.gdb
+index 667ece18d..ea4fcd530 100644
+--- a/gdbserver_tests/nlcontrolc.stdinB.gdb
++++ b/gdbserver_tests/nlcontrolc.stdinB.gdb
+@@ -9,32 +9,43 @@ shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix=
-nlcontrolc 1 grep main nl
+ #
+ continue
+ #
+-# Here, all tasks should be blocked in a loooonnnng select, all in WaitSy=
s
+-info threads
+-# We will unblock them by changing their timeout argument
+-# To avoid going into the frame where the timeval arg is,
+-# it has been defined as global variables, as the nr
+-# of calls on the stack differs between 32bits and 64bits,
+-# and/or between OS.
+-# ensure select finishes in a few milliseconds max:
+-p t[0].tv_sec =3D 0
+-p t[1].tv_sec =3D 0
+-p t[2].tv_sec =3D 0
+-p t[3].tv_sec =3D 0
+-#
+-# We will change the burning parameters in a few  seconds
++# Threads are burning cpu now
++# We would like to fully test info threads here, but which thread are Run=
nable
++# or Yielding is unpredictable. With a recent enough gdb, check the nr of
++# threads by state using pipe commands and grep/wc.
++init-if-undefined $_gdb_major =3D 0
++init-if-undefined $_gdb_minor =3D 0
++if $_gdb_major >=3D 9
++  | info threads | grep VgTs_Runnable | wc -l
++  | info threads | grep VgTs_Yielding | wc -l
++else
++  echo 1\n
++  echo 3\n
++end
++# We change the variables so that all the threads are blocked in a syscal=
l
++p burn =3D 0
++p sleepms =3D 1000000
++#
++#
+ shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix-nlcontrolc 1 gre=
p changed nlcontrolc.stdoutB.out
+ #
+-echo changed burning parameters\n
++echo changed burning parameters to sleeping parameters\n
+ continue
++# Here, all tasks should be blocked in a loooonnnng select, all in WaitSy=
s
++info threads
++# We reset the sleepms to 0. The threads should still be blocked in the s=
yscall
++p sleepms =3D 0
++shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix-nlcontrolc 1 gre=
p reset nlcontrolc.stdoutB.out
+ #
+-# Threads are burning cpu now
+-# We would like to test info threads here, but which thread are Runnable =
or Yielding
+-# is unpredictable.
+-# info threads
+-p burn =3D 0
+-p loops =3D 0
+-p report_finished =3D 0
++echo reset to sleeping parameters\n
+ continue
+-# and the process should stop very quickly now
++# threads should still be blocked in a loooonnnng select, all in WaitSys
++info threads
++if $_gdb_major >=3D 9
++  | info threads | grep VgTs_WaitSys | wc -l
++else
++  echo 4\n
++end
++# Make the process die.
++kill
+ quit
+diff --git a/gdbserver_tests/nlcontrolc.stdoutB.exp b/gdbserver_tests/nlco=
ntrolc.stdoutB.exp
+index e8a5ff8ba..2e8dc8498 100644
+--- a/gdbserver_tests/nlcontrolc.stdoutB.exp
++++ b/gdbserver_tests/nlcontrolc.stdoutB.exp
+@@ -1,18 +1,21 @@
+ Continuing.
+ Program received signal SIGTRAP, Trace/breakpoint trap.
++do_burn () at sleepers.c:41
++41	   for (i =3D 0; i < burn; i++) loopnr++;
++ > > > > > >1
++3
++$1 =3D 0
++$2 =3D 1000000
++changed burning parameters to sleeping parameters
++Continuing.
++Program received signal SIGTRAP, Trace/breakpoint trap.
+ 0x........ in syscall ...
+ * 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
+-$1 =3D 0
+-$2 =3D 0
+ $3 =3D 0
+-$4 =3D 0
+-changed burning parameters
++reset to sleeping parameters
+ Continuing.
+ Program received signal SIGTRAP, Trace/breakpoint trap.
+-do_burn () at sleepers.c:41
+-41	   for (i =3D 0; i < burn; i++) loopnr++;
+-$5 =3D 0
+-$6 =3D 0
+-$7 =3D 0
+-Continuing.
+-Program exited normally.
++0x........ in syscall ...
++* 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
++ > > > >4
++Kill the program being debugged? (y or n) [answered Y; input not from ter=
minal]
+diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrol=
c.vgtest
+index bb5308403..09edfcaba 100644
+--- a/gdbserver_tests/nlcontrolc.vgtest
++++ b/gdbserver_tests/nlcontrolc.vgtest
+@@ -4,16 +4,16 @@
+ #          and modify some variables
+ #   the user can control-c an process with all threads in Running/Yieldin=
g
+ #          and modify some variables
+-# sleepers is started with argument so that it will compute during ages.
+-# The variable modifications means it will exit in a reasonable time.
+-# This test is disabled on Solaris because modifying select/poll/ppoll ti=
meout
+-# has no effect if a thread is already blocked in that syscall.
++# sleepers is started so that it burns CPU.
++# We then interrupt the process.
++# We modify variables so that instead of burning cpu, sleepers blocks
++# all threads in a select syscall.
+ prog: sleepers
+-args: 1000000000 1000000000 1000000000 BSBSBSBS 1
++args: 1000000000 0 100000 BSBSBSBS 1
+ vgopts: --tool=3Dnone --vgdb=3Dyes --vgdb-error=3D0 --vgdb-prefix=3D./vgd=
b-prefix-nlcontrolc
+ stderr_filter: filter_stderr
+ # Bug 338633 nlcontrol hangs on arm64 currently.
+-prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris
++prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/os_test solaris
+ progB: gdb
+ argsB: --quiet -l 60 --nx ./sleepers
+ stdinB: nlcontrolc.stdinB.gdb
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-D=
isable-nlcontrolc.vgtest-for-x86-64.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch
deleted file mode 100644
index 0bd8273cd8..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-=
nlcontrolc.vgtest-for-x86-64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d8c19e0bb9ca2fd48f223e1fdeffcafeb0aa1745 Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Wed, 17 Feb 2021 14:53:44 -0500
-Subject: [PATCH] gdbserver_tests: Disable nlcontrolc.vgtest for x86-64
-
-Test hangs after glibc 2.33 uprev
-
-Using gdb to modify the timeout argument no longer
-affects how long `select` wait.
-
-https://bugs.kde.org/show_bug.cgi?id=3D432870
-Upstream-Status: Pending
-Waiting for upstream to take action.
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- gdbserver_tests/nlcontrolc.vgtest | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrol=
c.vgtest
-index bb5308403..96d2b52bb 100644
---- a/gdbserver_tests/nlcontrolc.vgtest
-+++ b/gdbserver_tests/nlcontrolc.vgtest
-@@ -13,7 +13,8 @@ args: 1000000000 1000000000 1000000000 BSBSBSBS 1
- vgopts: --tool=3Dnone --vgdb=3Dyes --vgdb-error=3D0 --vgdb-prefix=3D./vgd=
b-prefix-nlcontrolc
- stderr_filter: filter_stderr
- # Bug 338633 nlcontrol hangs on arm64 currently.
--prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris
-+# Bug 432870 nlcontrolc hangs on x86-64 starting with glibc 2.33
-+prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris && ! ../tests/arch_test amd64
- progB: gdb
- argsB: --quiet -l 60 --nx ./sleepers
- stdinB: nlcontrolc.stdinB.gdb
---=20
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.16.1.bb
index d0aefdf39a..9dbd9f74c4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -45,7 +45,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrind=
-${PV}.tar.bz2 \
            file://0001-drd-Port-to-Fedora-33.patch \
            file://0001-drd-musl-fix.patch \
            file://0001-helgrind-Intercept-libc-functions.patch \
-           file://0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-6=
4.patch \
+           file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or=
-.patch \
            "
 SRC_URI[md5sum] =3D "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] =3D "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba=
918cc6720a33ca"
--=20
2.29.2

