Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF51CE7AAD
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:23:44 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web10.66998.1695662617468634046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=BCwRwpKZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.55, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E088Fv0RGk8HUJNaCU/3lVJY7fAxLY+OY8qyqqEBbP5BLaDMw7G8n7aELkv3KV2AYHPWIdoiMW+6Iu4C+02r2QYyLJ7UoVXPfHOk6uCo1v8DKw6YmDvzTRFL0k7fpy+skX7BCAcb9lHzyitsrIQJoNFxYmoUTQeUwd6O68pMG1uvYycAjzGgb+f5qurvKDAqGBo1BbnjFbh/VZ8lOqjQx54gov6GxB5Si2s1aJ73IUZi2usOO11a5Ys0gkT/eDk2Xpl0K9y7jyRpuyfNGhwk33UGWt5RpXdFOltY5EQ5Md3vWRZNO8gRPawOKPmaGemhulOkBLxSnxDzOLVMYSpQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avQUA1J1dwonLef/TF35RjUQDz0U0fPU7RQjUz0Hwdo=;
 b=SK7o9QvVRvUDNtBuMmLAiSymCwpmMMxfUet83UtnGqUEquHJvvfFNz/Q5i1zQMlIbnZ97/uKDWuqq7OpRaS2EW5P+tKmaQiumqFkouZHLf4M2FsWibiWqaFcTdkdo+8X8GJ+Ku3/T3GFE4WrWi/njLC9d1OTx8ANOm/Q6pB+9bvoa95g60A2488rhuW161mO+wQe4XSCFgVc0cj71obC7oyH05wc02CKRqg03Z/HCwK1w2IhWzvxtzClVB1TYRPfLNh1MxjBh46GDIQPo1nYoEOwXgQqRIxc6ahcJUTj3IK6jGHNvSNS+AZbNoKMIkXifMhlVVx0x7cVcAYwuBOalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avQUA1J1dwonLef/TF35RjUQDz0U0fPU7RQjUz0Hwdo=;
 b=BCwRwpKZLqbgyX5yaNabjfaLDkXLdyMtyGXBvdZQ9GkDEbtJ5ZfZCKSZvFHXI9g1czIZLA1jK2hxL6kCmDp72EhVZ5fvJm61gVZPFo8CIm89OAxH45fafZsD5pqJmuJgBUNS+9YwTdCCMtBCRtvAqJR+KMm7nRN1jOXwmX76LMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 17:23:34 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::8bcf:a1ee:afe8:ea4c]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::8bcf:a1ee:afe8:ea4c%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 17:23:34 +0000
Message-ID: <ab29cb4d-eb1f-d132-6818-9a09bea0d98b@amd.com>
Date: Mon, 25 Sep 2023 11:23:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Openembedded Core <openembedded-core@lists.openembedded.org>,
 "steve@sakoman.com" <steve@sakoman.com>, mikko.rapeli@linaro.org,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>,
 Trevor Woerner <twoerner@gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Subject: beaglebone-yocto testimage ping timeout issue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 710a4958-3382-402d-9f44-08dbbdec258e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yh6X9eEZgpiPmMPbCYwwHlJFWYQIlIEpfQPKIC+meW7VqyJO4HOJnvKdT2rZWRe6Cm7kPvWJeGNvfSnfYCan1JA3boJie5d5gvW0bTxfY31MVSM+DtckYcgLsNWFu0uYH6GTP42mZPt07CjW044unl9fB38UtFZyDtoM3y/7VZ73Z9ZxypmZg0yeJzFiFygykr1235sP9zF0aUjFG+QTsewtjiuId6qHh2tvF0UlxgDPfAuR+fAJcmUuFj5LCHz8XeFu+SqbUbtAFH+xggUdJ7bA4GdZXTrIqT8dbGo+0B0HThQJ7PovF1lYsYlEpbL+gbtQPnJlW295ohsbtLlOVsf818s36W4Nr+O9geOL3vmGuWrqy1j0W9gD+8AD1OoPn3ZI52/Nh64HM8OFF9vX0KkmXcumAOJzFSsxcPAXUiDOfssr4olS9r6B9NsTIHU7WW2cWaDU848X3f9taIZaFGZIm8ipttz6LiIu5May73pVLZ+JAgbUAOeu3/593u7d/AQmFxHZ8B+ouEU5kolcdQdxlUmiBY6plyN3/9EGbraMLCUDWFsjKHhmOP9RpkBf9o4f44PBzo4B6aTwR109m1OmYqVsS223SeuUhheGOVwtVq4B+GhaRbliAo7ECnhQoiq1Q12T3kz99Bav14Nwow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(1800799009)(451199024)(186009)(6486002)(6512007)(83380400001)(6506007)(8936002)(8676002)(2616005)(26005)(2906002)(31686004)(41300700001)(36756003)(66946007)(66556008)(31696002)(38100700002)(110136005)(316002)(66476007)(86362001)(6666004)(5660300002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6I92xIHbkZLk5IXuCBT/7Cjb2E35EXh/p49TAPQevtv6dmdb4k/T85P2ZZ5f?=
 =?us-ascii?Q?ODrF64TAgj+b91kodJdWcVee1cDugbJE3V7CoZPagMbdUtgYFTioHumq6vvf?=
 =?us-ascii?Q?5oM4lBfXwPQw6kOG4JRMXu8ZqkV4Wr0K9iy3c1Jo2Odi8epYPkemAfNP3MhX?=
 =?us-ascii?Q?wLKCbIrztoo6kgIovcIiVyA9btRnsIRhP21FBadLOPzJP81R6ojjgTZTvIiW?=
 =?us-ascii?Q?gEG4cP9FAeL7sGoNgnkK+48agiiE/hORLibWtKAnc8dO9myKYYPRYET9F5G+?=
 =?us-ascii?Q?tILkACBdFSD7M7w7mAtL8fOI+wpOlZbnPbJquFxb0m4gJlxq8CWnNQgduaiI?=
 =?us-ascii?Q?fkZgGSzQG6gquviCJ5Kj/geqdM6qkoTyuXk19JG+vJbIQV+cUdH01G/NSG5K?=
 =?us-ascii?Q?hfFI/zNKJYvYqu1yh1Z1fU5PosJJt2vj4gBeGSweMGQeNhLFild7w/xvBb8I?=
 =?us-ascii?Q?btwO8rLcCp/eO32OxDNB6RuCHtJH1VWRYuSBMD55hB0YBQ+Kg7MIxQ6pMd0T?=
 =?us-ascii?Q?cuJ8Y+1oekv8LSP12MRW0Q2NvU9FTMFaApNUCjJ9nMbJr8+F4e1SiYNJP/mZ?=
 =?us-ascii?Q?2rQUWWIhf/3aX+9SjxD41XpVuAYzJ5KukytqTzY+cHdycimNeAA6w//dZotf?=
 =?us-ascii?Q?+ToeNrKzPZ2o132VX7wse06quFj0WcrkMHYLsz2dv7WZtjoASdCwcvpb+m2w?=
 =?us-ascii?Q?Qn9OMPVVJG3LUE8SzhNuAGcQABI9eARZde/0zb6969XUxdVq4StnjldJT+lL?=
 =?us-ascii?Q?NHOD/NRMHe1y5GjTUku7otznmQd2T+iyF8oFE1CCoWAtBVa8+cZNSIk8S4sa?=
 =?us-ascii?Q?WugY/qunE376PShL7ezvFxwdeTWAcvo8bB8iNciMEzVOK/Dhs8xTyWykJdFs?=
 =?us-ascii?Q?G0Soou94Su/2wGPAThkzDZ91YbCzJYIMcio/S217WswdTmdQVdBrOm8WXq1a?=
 =?us-ascii?Q?u5R7FPKKIHMaKhEpHAmRYndqxA1Yi3cm+SNd6b1+92iDPkRdSblvrKbSg1YU?=
 =?us-ascii?Q?9c2obSU5Il1+08C9IbYZGKBuHfHn3XX8BOsaRIYTLB9aeRO6M3NzXjO/FZuq?=
 =?us-ascii?Q?6UNIg0rwkAEkPOyqCKboxXnplI5ZfEp9sqGz6PIPMhnwTiNvyunyHmHRvyGN?=
 =?us-ascii?Q?EGdfdCzA7sCpLHmxlWTVjDvtcuSHUkHAZmT5OjF2KWGYRhA31kO3t7hC0mOM?=
 =?us-ascii?Q?fKR0lWFDJaoHdhVkCdWX6CwOgkPceo/MzoR0Spjisyk9aRfqoY+GjzBZdf8Y?=
 =?us-ascii?Q?AErM26emmJby7WqKogw0C6EUz7aO0H0ezW7MDBuFnlG123IkhABMfap1IIel?=
 =?us-ascii?Q?dtfrUxxi2VYf23+Pdjo26pd9dkLCqRvRHR+h1HrtW6nG6aIC/nmi5dighSdg?=
 =?us-ascii?Q?U6Yg1ikjFCHE7EFzh4G27ZZl1WvglZ1frMNTsjGxrKxOZxFnazXzrDcN0K8O?=
 =?us-ascii?Q?xnPYpeIlYpw972rH1N/Typ4uaUK9FILpyvLDl6VBjMr8bempySyzhaFdWLm7?=
 =?us-ascii?Q?fQ50IpnJ5S/7vkAdv08mJYMBBFJ/bFx0A12wG9EcDspxfQ2HvCwJ6ggKlVjm?=
 =?us-ascii?Q?srIy/rS9M1siJwX+J8YLF5PR/wpRabAcyVEEnyMw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710a4958-3382-402d-9f44-08dbbdec258e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 17:23:34.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in4VHHRw9ffhyLEnz5GIkUuQbNFvtFdB7v7M4xq68XoS6bu0Est2UDydq9Ui51L2/CpZgn8E6ERZsSd9UZ/NGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 17:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188199

Hi All,

I'm running testimage for arm32(beaglebone-yocto, zynq-generic and=20
microblaze targets) using master and I see ping timeout issue as shown=20
below but I don't see this issue with ARM64 targets or qemuarm. Any help=20
would be much appreciated.

/scratch1/sandeepg/yocto/yp-master/build-ci-master=C2=A0 $ time=20
MACHINE=3Dbeaglebone-yocto bitbake core-image-minimal -c testimage
Loading cache: 100%=20
|##########################################################################=
###########################################################################=
##########################|=20
Time: 0:00:00
Loaded 1812 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"2.6.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "universal"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"arm-poky-linux-gnueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "beaglebone-yocto"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
"4.2+snapshot-8815eefb0d6218661794a58008e1144a77d3394f"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm vfp cortex=
a8 neon callconvention-hard"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"hard"
meta
meta-poky
meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "master:8815eefb0d62=
18661794a58008e1144a77d3394f"

Initialising tasks: 100%=20
|##########################################################################=
###########################################################################=
#####################|=20
Time: 0:00:00
Sstate summary: Wanted 3 Local 0 Mirrors 0 Missed 3 Current 261 (0%=20
match, 98% complete)
NOTE: Executing Tasks
QMP Available for connection at=20
/scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/.pb069a_h
QMP connected to QEMU at 09/25/23 11:06:10 and took 0.53 seconds
QMP released QEMU at 09/25/23 11:06:10 and took 0.04 seconds from connect
Test requires apt to be installed
Traceback (most recent call last):
 =C2=A0 File=20
"/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/runtime/case=
s/ping.py",=20
line 25, in test_ping
 =C2=A0=C2=A0=C2=A0 output +=3D proc.communicate()[0].decode('utf-8')
 =C2=A0 File "/usr/lib/python3.10/subprocess.py", line 1141, in communicate
 =C2=A0=C2=A0=C2=A0 stdout =3D self.stdout.read()
 =C2=A0 File=20
"/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/core/decorat=
or/oetimeout.py",=20
line 18, in _timeoutHandler
 =C2=A0=C2=A0=C2=A0 raise OEQATimeoutError("Timed out after %s "
oeqa.core.exception.OEQATimeoutError: Timed out after 30 seconds of=20
execution

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
 =C2=A0 File=20
"/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/core/decorat=
or/__init__.py",=20
line 35, in wrapped_f
 =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
 =C2=A0 File=20
"/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/runtime/case=
s/ping.py",=20
line 32, in test_ping
 =C2=A0=C2=A0=C2=A0 self.fail("Ping timeout error for address %s, count %s,=
 output: %s"=20
% (self.target.ip, count, output))
AssertionError: Ping timeout error for address 192.168.7.2, count 0,=20
output: PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
 From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable

--- 192.168.7.2 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

Test requires openssh-sshd, or dropbear to be installed
Test requires autoconf to be installed
Test requires gtk+3 to be installed
Test requires autoconf to be installed
Test requires connman to be installed
Test case connman.ConnmanTest.test_connmand_running depends on=20
connman.ConnmanTest.test_connmand_help but it didn't pass/run.
Test case date.DateTest.test_date depends on ssh.SSHTest.test_ssh but it=20
didn't pass/run.
Test case df.DfTest.test_df depends on ssh.SSHTest.test_ssh but it=20
didn't pass/run.
Test case dnf.DnfBasicTest.test_dnf_help depends on ssh.SSHTest.test_ssh=20
but it didn't pass/run.
Test case dnf.DnfBasicTest.test_dnf_history depends on=20
dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
Test case dnf.DnfBasicTest.test_dnf_info depends on=20
dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
Test case dnf.DnfBasicTest.test_dnf_search depends on=20
dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
Test case dnf.DnfBasicTest.test_dnf_version depends on=20
dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_makecache depends on=20
dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_exclude depends on=20
dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install depends on=20
dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install_dependency depends on=20
dnf.DnfRepoTest.test_dnf_install but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install_from_disk depends on=20
dnf.DnfRepoTest.test_dnf_install_dependency but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install_from_http depends on=20
dnf.DnfRepoTest.test_dnf_install_from_disk but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_installroot depends on=20
dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.

.....

core-image-minimal () - Ran 71 tests in 55.191s
core-image-minimal - FAIL - Required tests failed (successes=3D0,=20
skipped=3D70, failures=3D1, errors=3D0)
ERROR: core-image-minimal-1.0-r0 do_testimage: core-image-minimal -=20
FAILED - also check the logs in=20
/scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/log
ERROR: Logfile of failure stored in:=20
/scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/work/beaglebone_yoct=
o-poky-linux-gnueabi/core-image-minimal/1.0/temp/log.do_testimage.1057886
ERROR: Task=20
(/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/recipes-core/images/c=
ore-image-minimal.bb:do_testimage)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 892 tasks of which 881 didn't need to be=20
rerun and 1 failed.

Summary: 1 task failed:
/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/recipes-core/images/co=
re-image-minimal.bb:do_testimage
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

real=C2=A0=C2=A0=C2=A0 1m53.486s
user=C2=A0=C2=A0=C2=A0 0m0.355s
sys=C2=A0=C2=A0=C2=A0 0m0.073s


