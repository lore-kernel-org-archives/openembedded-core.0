Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1BC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 05:07:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14504.1671426440688137007
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 21:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=935242e345=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ546JF024654
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:07:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9964w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:07:19 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJ57IbU030871
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:07:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9964t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 05:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLQWB41IJGc7gqGK7v15oXXK6wmmJw6omHSrop3exW+yYamChRLU0rRkB+sgI/Uk+yboOfr2pbPk+ayT3qZ2pK6It0GmvEs9To3PVqBVsa5y86EV00df2FNXaISyNZgUD2Jf+l8hBS+Di0fnJoBjCpFgfUk7Y9zO2fPw2NOteACm3WD7qfC5KCwSdmddjU3dYeHRpNIIARd7BchjA6k/Tucf3P7X5PBhob8JBv/K3yHOZBhKlgAfZw745px1PC0hw+ncZL2rHVVIajWAVyOBz3ySoteQvT/W+cXtVFPgElEko8nAzw2Z0RuiiyGdTKQXGYVbvushnLIC7b0tuR3WyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQgJFVuweE0n+E46b2TzJ3MlrsCoBUWRe8t197r+pfI=;
 b=gM99qgzm8FRqS381QTooLc9CTyxOhm2LMOgx4eB0qE7Xjh+ivQces/n64ACjhi+dFc2jDgjxC8YW5s4mRgE+gwUnPPDZS3QB4IcMgDyuftZ3DPujvc/Cu10T6xb2s+Z+G7U80IKMfkPbFaNtid6B9mu3LGI8KQC0ZmJ1wru4bmicG6hrkglT+oiSBIquFF6FZ1xqs5R9Eg3mgdOabOLLZeRZvRww/X7/gzSVLl4j9oxF3wpBL5kLLqfILYR6JPvn2MmQeBA3uoucomp2OAj1aU4Kib75MGl3XUC4uz7pMuRESlTkXH/+k2Y2K4XTImnNeqymuYNX8DQBXpeuWfylkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 19 Dec
 2022 05:07:16 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 05:07:16 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Subject: [OE-Core][kirkstone][PATCH] openssh: remove RRECOMMENDS to rng-tools for sshd package
Date: Mon, 19 Dec 2022 13:06:59 +0800
Message-Id: <20221219050659.106388-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: 151d0318-bbe7-4f49-9631-08dae17ee5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qpNy+tVrxFiWpPWf4SjeEGr7EdvoyzvfwVNG7/5F9cFsgT2uGHWt5FXJPjAg8EqIKw7N4MXI1GtuIPf1NFeY5vzaJPU946gSSERhRo1ssQvweqjBqjqpTFLwmHuuhmQk/sQpOt2Ic1fOY4sL8yOQDA6gdAvngw/PEfWsOa2lzBRk+lPqdA60949TW6hHvwHP+McM4SuOf8zBZHxOj9p3EEkekNj35ngGRcAhBd4i/wWGVx4s2O7XOdxMZxt+Iia5BTcRY2iepwKU9Vv7l8rn0VBf+2pBIDfPzOWpakxRimOyVzu0RUrvbKooQB9kljMrIz1CpR3rYe8eDARGQb3gWvLUo6LBcEsxtEHCwacDpZyvLhkAlias6GpggwcOERcG4F5IQh4zDDEINc3KWdvwzOZds6T04QaJi21y1UK6xPaezDcPAUnizfxCBjgi8vMFWJqPOA+FmEEVudfHu+7Yhf678HyepNLC6aa/9nNTNdU+GZnBBV/fZiudWQAjnEhzwhWuPTUlnEEBPd4im7/wJvQ9iz900fc2WH3oXP5PH7Ve6MEMZtaK8fnJCjJ3c15bAy+eSptp3l4YGUr6KykKYevjc5MavRqMreobYeB++2FRr8giLMZhp1XaQ/KeklqoQzlKx3DHySbIBVrzWPWZMC00clEXIsqeH3VNoy1YosJLKQFqiljpgCiCb5gzxdOwxTF68fee4KnTiqn3x1n3n5yHx2IrzF0Vwh2SR2Z/0ms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199015)(2906002)(44832011)(38350700002)(38100700002)(83170400001)(66946007)(8676002)(6666004)(5660300002)(6506007)(26005)(316002)(6486002)(66556008)(66476007)(8936002)(1076003)(478600001)(966005)(6512007)(41300700001)(52116002)(83380400001)(2616005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DXu8FAvqWtinQAyOIGms2Hq7r8Bfi8A0Rl7FZ8woTdcVMjVor2sQ3wfPSs7P?=
 =?us-ascii?Q?A1+mDooFxw8OI5kOG1YjbvpSgs3CG7rBw9xzR4jQWS1GEd6A//dEdXJx8CvA?=
 =?us-ascii?Q?3XlTQRtsVgfHWOwuCJ1XAEBAhuaXLxYoGsbDasci+trw07P/BNPp3dR2iSVS?=
 =?us-ascii?Q?YZs0z9/h7seSvvnJVufZ0P4KQcGwLFrOysm19WJ4hB/ViYUZDM6FQYwFKndf?=
 =?us-ascii?Q?pDK45BEy/aX17ByGLz0B0Q1Rd/2bfzBULGEc6c8/nI5MoVy+hqSYUARkMgWX?=
 =?us-ascii?Q?9q70nS1iFgXNPeouykPpyvJMWAQKcAIqQ2JxFhVJ0bn6Gb9JgOw/2GeK31II?=
 =?us-ascii?Q?gM65fHw4aTaCBmGWEly1gtnVHag2Zg9USDioHBTExlBIy5feUvbaOeX8yVq/?=
 =?us-ascii?Q?jE8tny1tvaFu6aC0aZB+BZpWgyamuNLEmQ/+kXzONtCLS4R2a89n7Xxu7Mtd?=
 =?us-ascii?Q?6zCaDeQLJTkuD4jKQWOnfx39BO7Umi4PmvHTr4I0DdpljV1HeZgACRUGgmyQ?=
 =?us-ascii?Q?G4xrVQwA/8STEf9mSH7yHCWc1kFoeva7bZFSIx0VKlBvQJwdlEh/Vy8HAYzk?=
 =?us-ascii?Q?S526y7os7MHHZZ1io8159ghzi0xqDXDwX7+v0MFDMLqHZQq5a1Itd6Siwaww?=
 =?us-ascii?Q?+N1az8L6BVKme53jh+IciBOrk5UHCzd7TxvOIPku5GaQkS3ndx8sdmqfMw8g?=
 =?us-ascii?Q?pDfHBJ0dRUCzkSOhu2mk9wI5w2XV8Oz1ApOLQ6qRHo4ybNrQMLoyetuSTVJv?=
 =?us-ascii?Q?UQeLSLvO7NAVnXcxGozyi6GPbuQEZ7onMs4ZS8cwcfqmolVfHIXwsWQpYmgh?=
 =?us-ascii?Q?5/CalOmgkrrcvVlVvRr2vBIRBJIlqYr1SY88pLA6Wg29gvTgOme2pBwJgkdB?=
 =?us-ascii?Q?qxVYZoHIAmj3Od4wkCTfYWfCg4hUs1yvetdw4BTYiYJlRUxj9CRE7+3/ZWwD?=
 =?us-ascii?Q?5DWEWzHU0mXpMPJNbzfevRiEPutZCRR7HdjaLlCGlBrSMuF7JIUyCSW0Yei4?=
 =?us-ascii?Q?Mpig/Xxgy0gsC8P8wTzOUEYNwUzw/II0YzsqhlUUhQrTaMT8U5VPJfVjtXEl?=
 =?us-ascii?Q?tiBLNyOgvBr4Y0IvY603hLfmazeMMeVTkq99cX1hXRVuq0R30gZqvZ6CjnTK?=
 =?us-ascii?Q?gVcAkN68ZMwBjUmDT1macb1fwqYo+qlcHQZ1LsW53vU0GDSCNo4rbruQv7O+?=
 =?us-ascii?Q?09mLEtkl1pTpOk04m1r5EklpWG+KqOin3d7cbUjmfzAQbp6sieosLr03nzYB?=
 =?us-ascii?Q?wVvf2L99qyXysVfd8bwCT/w8+W2/2y2B6XGCpXQi4i7wty/+0BEQhL9SH9s0?=
 =?us-ascii?Q?OhRel9sEr7yojFYcP8E4z80LGNp/fi/l5VFIFKk31VlbLbv6A69stzSj/Sov?=
 =?us-ascii?Q?YlzDBZZBA/UjK99wipVQRLnFZasXDMf0g+EUKJK3R0Gyzmvv/afWl4S8tNui?=
 =?us-ascii?Q?YPzUQbC8NtsvOvG4XSfyLcOo0sxLqhhr0NrMK7CdmLEk7XtPPW6BGYXALtDC?=
 =?us-ascii?Q?9A4+4KqHNBWiQljoxmQCkvChsBCIB71abzoMZSHkp8XlmvrrpW6wUssWKA51?=
 =?us-ascii?Q?V6Gx4yLH6K9hUvx0XRJVJVlAw9aY7qHCCPsfTPmGt3nUYedCyo8s6oU+MR7A?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151d0318-bbe7-4f49-9631-08dae17ee5ac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 05:07:16.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q59b38Q6F7DJjn1qzK3sXt86UooSFJeJC//H4EsBQrd8rk5UOHiNfo7QhDcPR1NQlCMCX+GHU8DSDX5d4f8UYaGafR207P1snytXbLcXHEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5392
X-Proofpoint-GUID: wDEeMxHec-jrSsjH7P8S8gEadF-y1UF2
X-Proofpoint-ORIG-GUID: qX5Kbt7y2qmjXt5zkyu5enpPGGfK2rOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 05:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174809

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
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index e4446280d9..6057d055f4 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -54,15 +54,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
 
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
@@ -162,15 +159,10 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS:${PN}-sshd:append:class-target = "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-"
-
 # break dependency on base package for -dev package
 # otherwise SDK fails to build as the main openssh and dropbear packages
 # conflict with each other
 RDEPENDS:${PN}-dev = ""
-
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.34.1


