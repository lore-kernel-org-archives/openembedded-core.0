Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D20C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 07:06:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7357.1670569557567385063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 23:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9342aad66c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B96tJXi001554
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Dec 2022 07:05:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0d89v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avocV/ZDuGQi0mYMyVsOf5c/PRibZpYKLlPrxCfnmoc036JoKTkdCfPV949vgumFBte0JYVnl3EUag1EIWPhOwUU2c+qiFt0Hnq+jbkKn1X4BsVRWG6+myqsd4wLYpa9YSAXUpuMUMKNAw9ZIRVgMkEI8pBpQjb3pnaSHVeUsZBGZa4+hS9dlmwD7N1mL7AbXTp+RwF++mY//UJIuJ5O0j1SCkCmF1ma//O7QZMvuOfNpMnSSPcuDe/nNkRzIchCo9j8hyzBLwKCAiLP/+g18cqHVoaYlvJu3qM4pD469dI6cPHfmWOw26sehhG4SxKOzo5Lc0LG7NQS8EQKkLXhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u41ErSNY4hmn91hKNXsqg0DUmVWdKtExkcwc8JXZFcY=;
 b=Fp4TZKbQMYvO2vQHOV2Seh07Pv3XnOpVqCcVuOniDLquJ8dY672MaUZc0Tjlmz5VGvLMUQ96z7kNkJ7XVI0iuVc+hk0G9fAOhVX+5dGJDDDZmIII/S3aKlnbY7im3wTcPAsEru8nC68ITUHQ08nm0bKpkrVnBIl2PxvNWxDpBUBIAz0xfwAS1+ddGM1V+kYBkH7ztkxqaEdAvTJTAYVkRsxwGPQVygcrZnQBzAeyRrMl7Pq8T14UMmoOYjqsTx+m5W9fqrCCYKjJ8zmPEHwxrKK8ZVR6XCgGjNcAY+GcbNnrS/6hpwXY5z+t/phY+9Bb+yBms0tYXUHblachzN/p8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 07:05:55 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:05:55 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][PATCH] openssh: remove RRECOMMENDS to rng-tools for sshd package
Date: Fri,  9 Dec 2022 15:05:38 +0800
Message-Id: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0024.apcprd04.prod.outlook.com
 (2603:1096:100:2d::36) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cfd0c8-7cd7-431b-3f24-08dad9b3d09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MmOpbabAuOiWwHDeJAlDukDCsvJq4ahvVn/OqVgku6BDAsPROln89Y/VdXxWXm2ex2xtpMIYWicJmQNu7dukTTPRGQ6M5V8CEHCpRsWEJhdLs7AZO36lyqB8WRum3chTGoH3wyyNWmaBDSJQqVIqv2tbI8jNdOAsrz6478B1p685fSuCZ9/z2GPkbiEKIhXPSjJ3/qPMv3lP9nb/T6l24/rc+E7ssMEwehtrMyyXvCfHm+02ylldY+ahlVLO8MA9lBYtcK/h666XN73vPOA9a/bM9yhO+5jZpZkQkU5kKyl6e07Ate260PZ4626CFqVfJE7XSYkxoTYI8HEdAEoM6dhXnFeoWg81McsVWeSpoPIjbViMe9/wGbUQIpDRQRTayuAdXTjG9n5/1hL0QmKRTOvd2R8z8jxx1H1tCvFgtP91NvgOZ9ZkOor5wrWM8yCi239sCP8JawdLTFAb45uYNBClF9h/MkUAszm3cYbDKouZSmovSdZzvYcxPEkbf20l0QO+0r3r5v0bsaMHBlKEPezxHeaWkb8FlbJMZO4T2KkApsDLpQV2/5t+wkX48w1JPk+ExI3D+kYyAGwj6mAeiAUTX93hiqpEFycD1pUlorXQHZUNXjW6b5y2FJ7WNPO0YGXLSiU9f22UCAuf0nXOumShaS5VGxDs6ekUPyAuiExaBU1Ynnj5eD2YpD70wNSFT7LWTbFjPEu1AOkZle5zTEGJsCEIgmSIIgLLU7x82wY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199015)(83380400001)(6506007)(186003)(26005)(2906002)(6512007)(6916009)(44832011)(1076003)(8936002)(52116002)(2616005)(5660300002)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(966005)(6486002)(38350700002)(8676002)(6666004)(83170400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+8vAauFx9ZPC1fyZmUf/muOEISZugS6fivEDNjs2M+4F+b1Jw4q7UWn3GhCI?=
 =?us-ascii?Q?PNIwIMYNy1etuJ6MHx9FTjVIk3+foJ2pgTwaoeyb+D7fGC/deK2os0o0YPTU?=
 =?us-ascii?Q?Fun4dcPAk43uLL/RNB6RsVQd+paAtP71tw7DCov1sYjHmlXkUh2Aec5MgTYe?=
 =?us-ascii?Q?7AzwVIOIyFQ/jjgraea70vjTpijaMXw/QidsEDg0j7DsAKyU84q1a1MtsTeP?=
 =?us-ascii?Q?QaqDB4Ysr+XZ1a01mvclCFK153MxgZ4XXrOwaThA9ZSP/ocMxjssbSFSoyK4?=
 =?us-ascii?Q?0fpinlr+wFz5BxlmV9SmEzKCPj/OYc33B/Xa899WkWwq9pSRZjTJJitTIJhn?=
 =?us-ascii?Q?gFokjKxUbzLBrC9wRrNbKLT7ws5Et+ozkoNrSQcRCRz0C33GHczgzVn3zQXi?=
 =?us-ascii?Q?yJprs2snaXyLckMiPm41kerAk/jDe0vlLEF4onJQnHasnj/CaHI2WjkD+Hqu?=
 =?us-ascii?Q?hUKwI49//a8R+7FDasS2m/exwmDAnzf10O7ayMDx6V5lCWZ18jr/xEv3qHTf?=
 =?us-ascii?Q?PzLVf+qcK8Ww6lgRAhSSZ0Qd6SvebHSxpjZn3Ed7PhEBZFwHJ8jzA1twkf/w?=
 =?us-ascii?Q?Jrl/D8bLvmmrNs4oOSI0kzDA5NYnvKWJmeC/MqFEnNmCp3lk5m6dH9tkAGQc?=
 =?us-ascii?Q?QTXq70ux/PBxuuihneb8UKq8JK13ZQPOQvWGFzC51I9K1CrXD07tC9rWbOi2?=
 =?us-ascii?Q?FT9YLNsuCHRJtiWAW3DvIAbjo6/lnSyUkeI2/CxXtqa1fJUGhxdnT7AdDoA5?=
 =?us-ascii?Q?rSfCdC1CA5lhHiBbCaXTFzgAnHmfATosXu+GRygp2/cO8SxoWTCxn4GaPq3i?=
 =?us-ascii?Q?GG0eD9R/lOxgcKFZ/bOb2qo0/VM+cVLv6FU5pnETwqg5+HiBq9ilqcXwhuMv?=
 =?us-ascii?Q?45pvSMBfDP5878HtAjKtGkzGDZYCj4rH9RRLekBEgt+aUNlaPjXGPQSUxg8a?=
 =?us-ascii?Q?v5vu7fwggldsl2ufSi7S5m639fnMd4nG8F9E/ILhRQ+zx/V0iJI2bx0y+DWn?=
 =?us-ascii?Q?+ub56/jJDSF97QXB6mvz71IIsq7vW1ijqCH2caqtCuq37fBcWvkEQQ3k4ZrH?=
 =?us-ascii?Q?oDmKQ6gnMr5/E2KrR4IRwHkSea2mOme54UKaycZzDZp/lPV4FnOO51FP/Q0o?=
 =?us-ascii?Q?coZAgpf6eai3p+kCSdu8pKKOL4EdTlhX7s17stGzjBXoSPOertrB3Iyse6PL?=
 =?us-ascii?Q?UphE+5DjypKJAMAaK2GPOOW+lw1CEdWQy5wSf0W2NOqd6OR7HX+hLSKsffBe?=
 =?us-ascii?Q?7fRKiUVjTENgN86bKy/XWO36jEnqnQ2e3tmqr0SRu/rMazzq/X2eGSN+N7mw?=
 =?us-ascii?Q?vbOZvUKq1IzJDfVt+ige41+gF5kf3XFyRIB7wyl3IPCWs6A0//hP/xmFmINS?=
 =?us-ascii?Q?B8ysLp3bcF7u2syGSfBjqGYLC+tyNu1p7sx/3dBhtBe/OcrUQ1jtfswVvS+i?=
 =?us-ascii?Q?2/4LzCjdtU2rAQCKDJKoUj0sikN9L3jEnrqevoCWxQvL+zLwziGb003jqJca?=
 =?us-ascii?Q?N4TLoIB5wP4ig52B/Y2KRFSukpxXhn5cCR1aysXuo9M3i31zwlpyvcniNFBm?=
 =?us-ascii?Q?ISpo5yjrHd7uG/Igjp/H+TRZkZ4QAEMwGCeX5hgiN+bRV3e38XPsVgNR1J+I?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cfd0c8-7cd7-431b-3f24-08dad9b3d09b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 07:05:55.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjlfa2nG+KmPVjYmRPaRXMuNfLGqeswi27Fe40KO7Ib1EB9vLg0zZ4zqdrUCu69//U+Hh6Hv+iWW6C7IrROt4oykpf+e1UBaMtYKo1T7TCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
X-Proofpoint-ORIG-GUID: OF1O0PfKpEASeD-SKpQHczRf3gAQBQzy
X-Proofpoint-GUID: OF1O0PfKpEASeD-SKpQHczRf3gAQBQzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212090060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174434

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
---
 meta/recipes-connectivity/openssh/openssh_9.1p1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
index 85f97b1bbb..23ae8d5b0c 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
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


