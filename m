Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC618C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 05:04:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14424.1671426236293761823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 21:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=935242e345=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ4xfZf031477
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:03:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301h8cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:03:55 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJ53si5006019
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:03:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301h8c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 05:03:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpPDldxBUmpCl4X775gmKwYz55WOS3fz29zn2IETwg9nGbn5hv985ecmkAl+Nh3cFz496PD3hF7hjDYcSW7XaUKk3zEJ2PoCNxGBkBgbq8bLjbtgl0pufFWL/PdvaKOZPvRfzBFY/WibBOeoL5pJG8ZfnEDUbuRz/R9gPdDiGeqfkf/Ci0AfQcBbSGnDfoGcBc4k09sZ2hR7g+35PRGtcXt4NpZqkYq0RWtm3Sor0IqlQAFNPlx09i6GMDVVZWgSGX/e7r1Fz+SWxdsigdCk34apYUApzT+WiHwd/9cSVrlC2aM/Jxh3zzw00qqPQfZ+CETVlE34jCRPEFCo+7Wfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKa3pID/RqKiMoHlVdDFg9+mYi6qqOT4sf8p/WI1AHc=;
 b=TMspyjp2i8DQwGFxRWwQx6nfZ2AYLPKSuG+2f+S87m4L1pU3giq50HJa81vTm5jhCK446AlSwjF+VjR+Fza5ZXyveJXzoEz5z5b3/rJoZjnjCMqL3fWnQT6N+qwCe5kx42TXbh7iJXeO3jFeZIvOkzzkhHKg15WrILzEKqmWp7MbR79yR04u7v0IpjxHcbom2reWkPSE0hVgB81wbFxifjEN2zxVKx/S03/Oe11Bl5t348KagQB/S/2Hw1KdBzoAZCDX3hFhJ9I7R3J3Bv17o3pcpqTqENL9ghJcrUnszM+wRvkO428j17hQObGYMiEV5Hau8oYzEPB1AqiAQt/oGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 19 Dec
 2022 05:03:53 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 05:03:52 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Subject: [OE-Core][langdale][PATCH] openssh: remove RRECOMMENDS to rng-tools for sshd package
Date: Mon, 19 Dec 2022 13:03:36 +0800
Message-Id: <20221219050336.106052-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: 782f575a-f61d-4560-0f32-08dae17e6c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T+sYPEJVvLsw6FDCWse8mVtwBe0l6ArSpcEkXsJwYl5DkXDcMfO8h9S21wkvIT1Y2JzNvdeoeD34qzVjY2FuHfcXFUXzJ1ETkk0y4QXzfuFGzTQaC2ZZVtZTfuCwkgCj0hIBkOq+1WN8r1DPe72/W2IBwVKGguKr9xPACaFt8h0MDmBU/4SoWEyCz0cNi5nr+ZwCHiLI6454Tq7/1rC0KFT4/HiWJcEa0u+mBrC4ynSbaB/wTMCB0a5kYku/DNOdRlIMQpxpiMxx52hbxXoY/qki5Nl+5qi/iOdtfGJh9jnUIpsJbP7kcV0JQ0I30LDptha3Z7XgCRnJNvw1HmbZQ3eXc+8iMByTnBiI2d/WCw20VKgLtGcePoTNCUi7gH3WgfRghXTC4XM7iA1Nhta1a5VewKU4NqNYKpMSc65xUrnVBJEj0h2DKYenk7DW+OpFKjlkZswC5+5gl+fS6pLunRdjLL7hf3b/4nkD43z/WH8E2046Y3y6KiKopb3oQX4dbkBCbvumvnfvXVZ7Bx2b/pGhFBrBc49XxpJj8bV0kFvnb7EToGpXwGwhXBeYZnGVRPixa21yz9KXIlIMQM36E87KcQROB46r8Hhz2xwGA4/kXYlTXgU91fsHwNu++iSWxwpWXxSTo5qqw5QvpdJe8uj5HGF3jXKNJhUoho1S9NThykJy/+dE4DeL/9gq+CEc+ZDQmKHrQtTDKcHGC1Fp6ZXUfDjNlmzdMRFlCEFZ9Fs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199015)(2906002)(44832011)(38350700002)(38100700002)(83170400001)(66946007)(8676002)(6666004)(5660300002)(6506007)(26005)(316002)(6486002)(66556008)(66476007)(8936002)(1076003)(478600001)(966005)(6512007)(41300700001)(52116002)(83380400001)(2616005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gHRIfuENiRjakRWVC8URWTrki3OtACkYXEVDPixS74vhmG2VI9gnWPD1gbel?=
 =?us-ascii?Q?NxSTen5CoER5s2qm0DGqzqwG4RMvbAO41wD+DMC9cCUmH1wfl0yXimHxiuYj?=
 =?us-ascii?Q?1YS4vsVwjpFdM+xjq8XgFyOfuWQBn/hYauD3vKOHuxFBd1H3lvL0siRJGNKY?=
 =?us-ascii?Q?5LMXBiveqcHVcZugXKB4WIFJK/Hv4aWbOeNujtcj1fN/P8QmjpK3Trxi0w89?=
 =?us-ascii?Q?8/BBZvCE02aOLPxAMdLmB5YI2gWVfOiosqyY5jobbjREuxAo4fA9XIDVCsuz?=
 =?us-ascii?Q?bdlnmG1QLRnsBnzI9diV6eOSOJrsMdZ1rF2bUZkyw4DoqjgmytOuaVr/kA0B?=
 =?us-ascii?Q?Dj5tSrMj3N039sEvMkuI2+xoGCOS4GElksgZ+nvTb797BPXO+r6zHdrt2EHJ?=
 =?us-ascii?Q?9BUaebdAP5aUIRMCGHUe883l48b6Bf+vbflPjToszgyhb72RaWaRz52SB8fn?=
 =?us-ascii?Q?EbGV4ngEBzjWsscicGJKaq979dMqBPgzcwubzs0GhXQQNfQmbOxSpUopKPDo?=
 =?us-ascii?Q?Uot6qaaRmsVGYeBTg7k4Zk1llo7eilw0PYy3EPC1cIXY02g8xN/diRdH20OH?=
 =?us-ascii?Q?KIb7AQ8bVtex/wgSRuQu9Y6nNwoKhJJ4ThftVSoC7d/975JJLlKtdDqkZeYQ?=
 =?us-ascii?Q?CZFBGAPX+mr0JEnx1AD10zjZIzkUAbM6U0mHqhbExBLT6oc/hacKToy648v4?=
 =?us-ascii?Q?DiL5KR2PqnAVpgRPi2vc8beprjsmFw2Se0hSzMOyfHLqpxLwnTp6vyHxkJlp?=
 =?us-ascii?Q?b/FxlfXJxBNYNwDF4Zk8WiZBeazr6M57fQFReyB5oYsE4JR9egiIcIIdpPDA?=
 =?us-ascii?Q?rjs0J25pXXYAABw33fZYoUHXZHU0xENARKMdSXSVVF4uGJSyLoIEKsjvSw4Q?=
 =?us-ascii?Q?OudpfI1uYUMWgGuDdpsa+N9NACZ1KQL0sfpTjRb5QEWbE05t3PsJooWhnbFT?=
 =?us-ascii?Q?xmD++BQ5Yzf8qjAfrD0Je5O4jrSAO3hIRjX8oPws9/S3g8Lb9271U1VkChPz?=
 =?us-ascii?Q?PPjeLjIAisbyvX4Mac1BaZjFgteXRtnVeLBb4nmSgo/UxZpWc8WzSOMFcF4+?=
 =?us-ascii?Q?RBF5+50QZZjn9MOHPnl9Xfn79B3oBY3bZ7TVwSwDdhIwaU4MEX5bm1oARoXD?=
 =?us-ascii?Q?ha45wJCwdvVhKdGM5aZGg+KkwMcQb/SJX08C7BvhgpaCyI4R2R2MLgrK8dWC?=
 =?us-ascii?Q?1EJVdSbIkbR98YBEWVbhaQ9luPHCO1nhQkr/NblsE+JYCs3c0OhuNGUPuMC2?=
 =?us-ascii?Q?V0YlBm6qsoBHO/CxvowLWreKacmLtJjVf1udeq8Ki9BQUtytfWcus5TaMvgq?=
 =?us-ascii?Q?ETtKTknHMt7dgaMNII1v3xMTjzOOOof7P0+S+Xpv1LxyNbJJPHbWwhDaZMqT?=
 =?us-ascii?Q?aX62SO6MY8xuSNrYtk7tc5RDvh8yzCgEqwK97MZPTeSyNPF9sIQSBkq5qehV?=
 =?us-ascii?Q?rj/eBSRiQ/WVq62k1LzoX0XiAn8SS8ATRCyRm0N3vtzoZA76f1UGfvUw5xel?=
 =?us-ascii?Q?FiV3q7efClr6pmYvoZ4wm0hWVUjM2SjpNCVeXQ+f41KSwrwo4fPMa2hUtPE3?=
 =?us-ascii?Q?lnskPJUTCEgvjOc6uWl/EQh0LXn225KFQYTfdQv4LoaaOWIFmu3itVGS9YIP?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782f575a-f61d-4560-0f32-08dae17e6c5e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 05:03:52.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWyOxrrYHL6p4z6C1ar7kzr4gHQMopO8LT1nEbBZdrqJJ9QX6xQJ9ttAuhqQMiV1cyaMkPnh36A0kK3u/jIQXqSBqGQNG3JxrODn+jLcltw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5392
X-Proofpoint-ORIG-GUID: TcjAPWZIkWH-kQuw28V8l07MWBhRDEeJ
X-Proofpoint-GUID: w8ihYSWUjliYx5lN4ULneElEr8QTXvhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174808

It appears that rngd is not needed as of linux-5.6 and later[1]
and should not be installed by default since the purpose of rngd
is to provide additional trusted sources of entropy.

We did some testing on real hardware, the result seems to support that
we no longer need rngd by default on kernel v5.6 and later.

Testing result as below:

1. observing the crng init stage.
 the "random: crng init done" always available before fs being mounted.

2. generating random number without rngd.
 testing command: dd if=/dev/random of=/dev/null status=progress
   on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
   on NXP i.mx6q board, speed almost 31.9 MB/s without block
   on qemu x86-64, speed almost 2.6MB/s without block

3. using rngtest command without rngd
 testing command: rngtest -c 1000 </dev/random
   on Marvell CN96xx RDB board:
      rngtest: input channel speed: (min=4.340; avg=135.364; max=146.719)Mibits/s
      rngtest: FIPS tests speed: (min=8.197; avg=69.020; max=72.800)Mibits/s
      rngtest: Program run time: 418771 microseconds

   on NXP i.mx6q board:
      rngtest: input channel speed: (min=96.820; avg=326.769; max=340.598)Mibits/s
      rngtest: FIPS tests speed: (min=15.090; avg=37.543; max=40.324)Mibits/s
      rngtest: Program run time: 570229 microseconds

   on qemu x86-64:
      rngtest: input channel speed: (min=37.769; avg=101.136; max=136.239)Mibits/s
      rngtest: FIPS tests speed: (min=10.288; avg=30.682; max=40.155)Mibits/s
      rngtest: Program run time: 836800 microseconds

4. observing sshd service.
  using "systemctl disable rng-tools" disable service and reboot system.
  system boot up normal, sshd service also start in normal time without
  block.

Reference:
[1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 868dfb46d96a27ec9041cb902fb769330277257d)
---
 meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
index b63ea2b137..689952e857 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-PACKAGECONFIG ??= "rng-tools"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 
-# Add RRECOMMENDS to rng-tools for sshd package
-PACKAGECONFIG[rng-tools] = ""
-
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
@@ -160,10 +157,6 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS:${PN}-sshd:append:class-target = "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-"
-
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.34.1


