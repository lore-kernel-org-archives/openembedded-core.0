Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EFCC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 07:16:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.37666.1639552615972595693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 23:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jBIVOXzn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79835b6d13=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BF7FsWM011758
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 23:16:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=NPDVwy7qF2dCOyxTba3RqlEGchU3iOpD1I5BRVHpdHQ=;
 b=jBIVOXzntY5OdwxlyZcSaDyLabI1pR0yppo+tXmFzdZoQ+vpQIubw7okqlpiiE45eYfj
 UrRm81gBQ3oFNcjDnkNLHr0AB0OfXhKybOWGflhUKJGLdyhAw9jltFUF1GwNWsRIafMD
 ATKyU961I7Caa64aTiaPumgzMi6sDQI0tr5lm0HLZ84ERwKRnQ6a3ajZIvaBYBBj1ZE2
 9qLfPxAZYC67ppWCyOqtp1oqh3n8ASfAnzg7CMk2KyOG3lfqFgRpOAhpoJ/64i7GQTgF
 UshSSyBl2Q9f0nAvMbcoCNly/ftq/MPPsB4U1QeYeAwAzMXKAgeTd7fAzpTHKUqb+Lrx sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cxjpf9171-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 23:16:55 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BF7Gs5J013779
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 23:16:54 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cxjpf916x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Dec 2021 23:16:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD5jL+xj2Ek0/agWRJWa16KrRXRNvebnIyxx0hluap2a+V+ypX1zATcuLr85K2uUlO5P8hPzFDA2Qbi4bF+QeN3t90pCMERmK5BnVSi5y+anSbrgGfgq6doye59P7agBARcAMu41qJ25egQ1XfOKwr03sd6JTa3vFgZVOwdYeZvuc78ip0vlNQi8WK0WGDZattI8Zr4BiVKgY7iod8cRnQLi7eDQUgz65JtwthKFFAZplFO5U9GKZ1SECuFR7M95Zh1s3PQMM1uPhXhj0zbvaBqgqOLPHegYct34W5JzsfMKdIP5+aec2TZEpJA/Q1So4sEKH6917d0DF7kuOwQ6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPDVwy7qF2dCOyxTba3RqlEGchU3iOpD1I5BRVHpdHQ=;
 b=k5YW2uPTavdA1zTDyI9KOVpGDj1KPyWM8uRrL+y3qqm8UUhSQuEEvhdVqO3okyMXkyaxRUhgl86XY8ZRsVSwqGxdNI99677HfaB6CYVMQl8NMAr1PS86MwW9hms1PpBKwSZl33cv7Bg/sZcuG90g3iGkfEuAyGYy4E9UiV/67g+zBBLfWWVjZuUVZLY7Z1Psm9zu/Va7DiMt+jo1LZ05PN+zP4yyq2vPO6rl+KnLE9jVqIRlXIxWXUHEXAnh67yEJcG9WartMt4/EMew1W2eJFN7j/lghuOJkxPf088PgEuva24bXn2G7vHQdCEg04juf3EZDfuw58Sf8C70ZpOPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 15 Dec
 2021 07:16:53 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd%8]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 07:16:53 +0000
From: Yongxin Liu <yongxin.liu@windriver.com>
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim Bootloader
Date: Wed, 15 Dec 2021 15:16:32 +0800
Message-Id: <20211215071632.11038-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.17.0
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To PH0PR11MB5175.namprd11.prod.outlook.com
 (2603:10b6:510:3d::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c473c9ad-696d-4152-a3cf-08d9bf9ade88
X-MS-TrafficTypeDiagnostic: PH0PR11MB5901:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5901F371FD66B9ED1F097BCDE5769@PH0PR11MB5901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+/7ZuzHCmvswz0NNLCKLx0FAgikWHCrALCQGky/RuAbzM0UnpIa2+cMsGxRDNg9qAI6mGN9XK/GDMfofLMwVZfuEJgRiWvCPW0oaf3Aw2t8m9QVwntKKryMR2UhNQFYcW8oXn9GSpMArnlEl2I0SAeYvkYbocdGsTA6US8fTwKr/47mEGYeg1D++I3iBr5Bd+1juIwgOGo9mULLX6+22UiQjMdgoaY/7aoQF6VEzk6i4icarJNQLIiq7XJVYrfZK87MKnIy4gTJwsXZOClBHHfmoabbvY9e4ydc646dyKSjOaW/25O1xQ16WRvhPkUEBf0zt89ShyyhRjttKYPWRculr3fuQY/wJeYq8gn8Lz1KnZ7atyYXqzfG8t3AYNJ/dIopsiUPaAWZ4b5zpJXRfqQNaJ0qiR11X0ctHi8l+jY+uHwdPg0f1OKep6rGS52PSrTtofghiE7C2YwXeKtlH8QPjRBj41jAuZ10DjbnrM8k8ECS0vtakc14+kW6HJCgYPQ4F7tLc8ctvUtKf6Qk/hQ03Q3AE9PulLWwxBjOd2LkZqNlBn0ZRKMDkvpZodCPl2kfZmoVRT64pkAViAeRX6yKYP3tqf2ns5gIm0NKSD8ffgFVp2aHminkG4FpHylSzf3LQVvusx9hNV8K3eQaqZW2s101Eg2Seu+4jarU86zi4vsExkZbQWSoRNUNmdfZuNhV711DmT6GufNLXS2aTe/xr2sqsP2D/yAqn/KmuL3do6nNal/17YCfAwyjdfrVnWU2Pzu2Ym4dYCvjvUhbLi12Hq9cqqAZYSHtV3X7beWo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(30864003)(186003)(8936002)(5660300002)(44832011)(6486002)(52116002)(26005)(66476007)(19627235002)(66946007)(8676002)(1076003)(6506007)(966005)(66556008)(36756003)(83380400001)(38350700002)(2906002)(316002)(38100700002)(508600001)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9PaCTwkIIgBGIZ6EObqXEuj6kQNgCwtwaJZFyScvhfl/LYu5k9Ys/LcN5ZTc?=
 =?us-ascii?Q?zOHJGmNvh7vuZKrElvZFvkossFvVKdR8dlvXuY91jzDMsH46udZqlwnmzO1n?=
 =?us-ascii?Q?W1eomPqkctpl7xWPlwoR/WqDfRzb8X07Himi0rwT6o6zuYcjQQsXK36zfpgR?=
 =?us-ascii?Q?ntm8YR13/AkrJgMX5URcP6+x6yM5fOpRyX5h3X9ncgKYBBGrhbM9pHmUGBFO?=
 =?us-ascii?Q?tLR+YhU8/uCM2YrfrrFOTFcjf7OYchlBvW4hLp6e20dKKeVY4e8+vHlH9+oa?=
 =?us-ascii?Q?SFy9gZsD2avwLuY87RvmyZn8ZfrPfDp3tVRr1Taf3kBtFA+BxYPy89oTrAOq?=
 =?us-ascii?Q?zObF4tx5J8719W8UNE6AsXbjKA2tsnRBT+Pmfw4yvs+XX07EIZpzlFDb+l8W?=
 =?us-ascii?Q?1xrQZOtpZk+k5NLrWQ9egi3NBU+c6h9UCKLR9hgrZd92/3B8lNiocJeNm3SZ?=
 =?us-ascii?Q?qW117HwhpGvndL4AtQPtwbGTZr+L7t7gdfMljVtZT+Cw3R6JDqqYp8WKSFZb?=
 =?us-ascii?Q?XKUwffTeBy1lTE1Pm2s9KX+ZUbxrxFeW837xIRP3yyrjRDLMtZnRm+fMpT+c?=
 =?us-ascii?Q?x0K267FcGSUa0xWV2yKAqdojyx/eB3LazhgL6m0QA1376wM2xMXMCagx8vJ2?=
 =?us-ascii?Q?MKVHVTpT6rPGaPft3Z40MQVSa1dN7qAEEgz+qIFprjmXhVVogArGtFg5UdfL?=
 =?us-ascii?Q?3IL6fvgtaQepBng0X98XL+LtBw5/rrXGrHDuN0C1htGDhamyDf8toik/+W2t?=
 =?us-ascii?Q?qNR4j8DJ4ZeaLjMvhwWU7yvvW7N9FT1/HlqBPgfhe44quyaL6Jsn2VpJ9PWo?=
 =?us-ascii?Q?AAl1O6M5qz9d1kSwa0XhSStQgwsS78wYfijtAoXMILBU/D2UMJGz5LeO1iKN?=
 =?us-ascii?Q?Xbwt6nAbgtoFnfC0dXXLgRS/IinQZV98zOjf4Rf/QNUf8+kgZ+XLkL8bBbKZ?=
 =?us-ascii?Q?ghkn4DJKDP1rkGhCN5ya80znnK8q5CD7/r0IcX0H/9cqOpNp/J2TjqqPnUpM?=
 =?us-ascii?Q?5921fsF+o39FV6ZcSwN1gwfQV703Lhk3OFTFXb4po4bAcFJrfO271Cq/gaGl?=
 =?us-ascii?Q?pId53RNXovybsV6XrLAyHyKQJrym0/u+AeYBjOWgOt/Am9Mjxb+T0JmFJ/6s?=
 =?us-ascii?Q?GeLDZZxpjZi6LMQmp28Xo3hQ4tJY6h4PPcIxbQ3D5NMqqEGNTegbw38H4ZLs?=
 =?us-ascii?Q?jQeVD7tDUEX+R00xiO16Aa8XfKuVmzlLVBcEMrsk+x90AFljq3zNRyco8v/8?=
 =?us-ascii?Q?Zof49WBtBnzfYZzQZ64a1clJvAbqoXfT/OX1y0ypyaVC1XA2/PYbHEmyGkjP?=
 =?us-ascii?Q?fD4Dej2gsXZfYsWLRi4mtkuFAv78B08bp4bjqvbf//vOXRiDZp8y8qIMkHZC?=
 =?us-ascii?Q?AtZIlAHZ1lhPKTcKdYOpS5LfC8i0GbII7wM/WDtkSlrbSGPQ9Iw2by/FCM/K?=
 =?us-ascii?Q?hIJF0XeNTxv2lvC7p44838ZsEBSbBLEBHfLHcyOb9wdmbM4rGAxNWyMhuMaz?=
 =?us-ascii?Q?PlMqzW+NkqLX5K+lEQbm7Zc0OFUBq/CLIoL098rz2DMFseB5QssuLzSCs/68?=
 =?us-ascii?Q?vFqSetS9E7k3BsaeqJKZ52/tWQkPWxtiRBWP0zdynpBHDRAH+N0UX/r/qrNH?=
 =?us-ascii?Q?AjhuOjkbhu6U7oyIjwz8PyOXEVhQjGwnscWgcJEeIwQpMzpOomt+8e6v/Y21?=
 =?us-ascii?Q?r6CFtw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c473c9ad-696d-4152-a3cf-08d9bf9ade88
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 07:16:53.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rQdnJylWW5hCrBRxo8VT+SSXQTy/JbBhKn7CI6ZEnvQAnudgZkFX8dKEylK4nZPqAsdGwD0q8lI9TWoTH83pORIIRyIXCgm0aIQbu9cgN6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
X-Proofpoint-GUID: sBou6y8G8ZtcZ1sBkLd11BOllW2aCMM7
X-Proofpoint-ORIG-GUID: q6mxjcbfrW5SBaFLTVnuXrKsCqygkPou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_06,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 mlxlogscore=982 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 07:16:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159713

Slim Bootloader is an open-source boot firmware running on Intel x86
architecture.

Currently it supports qemu, apl(Apollo Lake), cfl(Coffee Lake),
cml(Comet Lake), tgl(Tiger Lake), and ehl(Elkhart Lake). You can set
"SLIMBOOT_TARGET" in .bb file or .bbappend file to specify or add the
target firmware you want, for example: SLIMBOOT_TARGET = "qemu apl".
The default target is qemu.

Generated firmware and security keys are installed in build directory:
    image
    `-- usr
        `-- libexec
            `-- slimboot
                |-- Outputs
                |   |-- qemu
                |   |-- apl
                |   `-- cfl
                `-- keys

Boot firmware for qemu can be used by command:
"qemu-system-x86_64 -machine q35 -nographic -serial mon:stdio -pflash SlimBootloader.bin"

Other boot firmware for real hardware cannot be programmed directly to
flash, please refer to https://slimbootloader.github.io/index.html for
more instructions.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...d-private-key-check-for-PKCS8-format.patch | 28 ++++++++
 .../build-EDK2-BaseTools-with-bitbake.patch   | 70 +++++++++++++++++++
 ...limbootloader-BaseTools-with-bitbake.patch | 42 +++++++++++
 meta/recipes-bsp/slimboot/slimboot_git.bb     | 57 +++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
 create mode 100644 meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
 create mode 100644 meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
 create mode 100644 meta/recipes-bsp/slimboot/slimboot_git.bb

diff --git a/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch b/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
new file mode 100644
index 0000000000..a7e9d96dfb
--- /dev/null
+++ b/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
@@ -0,0 +1,28 @@
+From e31e9b34f5ffccaab3788da781e05a0622cf7d45 Mon Sep 17 00:00:00 2001
+From: Yongxin Liu <yongxin.liu@windriver.com>
+Date: Tue, 7 Dec 2021 16:18:43 +0000
+Subject: [PATCH] add private key check for PKCS8 format
+
+Upstream-Status: Pending
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ BootloaderCorePkg/Tools/SingleSign.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/BootloaderCorePkg/Tools/SingleSign.py b/BootloaderCorePkg/Tools/SingleSign.py
+index 2a550bf8..5baacbde 100644
+--- a/BootloaderCorePkg/Tools/SingleSign.py
++++ b/BootloaderCorePkg/Tools/SingleSign.py
+@@ -259,7 +259,7 @@ def single_sign_gen_pub_key (in_key, pub_key_file = None):
+     cmdline = [get_openssl_path(), 'rsa', '-pubout', '-text', '-noout', '-in', '%s' % in_key]
+     # Check if it is public key or private key
+     text = open(in_key, 'r').read()
+-    if '-BEGIN RSA PRIVATE KEY-' in text:
++    if '-BEGIN RSA PRIVATE KEY-' in text or '-BEGIN PRIVATE KEY-' in text:
+         is_prv_key = True
+     elif '-BEGIN PUBLIC KEY-' in text:
+         cmdline.extend (['-pubin'])
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch b/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
new file mode 100644
index 0000000000..3b9db74491
--- /dev/null
+++ b/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
@@ -0,0 +1,70 @@
+From ce5ed81d9dd9c37e494560edb8f0fbae83713416 Mon Sep 17 00:00:00 2001
+From: Yongxin Liu <yongxin.liu@windriver.com>
+Date: Wed, 15 Dec 2021 02:19:42 +0000
+Subject: [PATCH] build EDK2/BaseTools with bitbake
+
+EDK2 basetools are needed by QEMU FSP. Due to CRLF line terminators
+in target file, the patch has to be set to binary format.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ .gitattributes                                   |   1 +
+ .../Tools/PrepareBuildComponentBin.py            |   6 ++++++
+ .../build-edk2-BaseTools-with-bitbake.patch      | Bin 0 -> 1375 bytes
+ 3 files changed, 7 insertions(+)
+ create mode 100644 Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch
+
+diff --git a/.gitattributes b/.gitattributes
+index e372c4d9..d31d5dbb 100644
+--- a/.gitattributes
++++ b/.gitattributes
+@@ -17,3 +17,4 @@
+ # since the files that are being patched have a mixture of line
+ # endings. This means it must be treated as binary.
+ Silicon/QemuSocPkg/FspBin/Patches/0001-Build-QEMU-FSP-2.0-binaries.patch binary
++Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch binary
+diff --git a/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py b/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
+index 50f24736..2cd2f5d5 100644
+--- a/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
++++ b/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
+@@ -188,6 +188,12 @@ def BuildFspBins (fsp_dir, sbl_dir, fsp_inf, silicon_pkg_name, flag):
+     ret = subprocess.call(cmd.split(' '), cwd=fsp_dir)
+     if ret:
+         Fatal ('Failed to apply QEMU FSP patch !')
++
++    cmd = 'git am --keep-cr --whitespace=nowarn %s/build-edk2-BaseTools-with-bitbake.patch' % patch_dir
++    ret = subprocess.call(cmd.split(' '), cwd=fsp_dir)
++    if ret:
++        Fatal ('Failed to apply QEMU FSP patch for EDK2 BaseTools !')
++
+     print ('Done\n')
+ 
+     print ('Compiling QEMU FSP source ...')
+diff --git a/Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch b/Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch
+new file mode 100644
+index 0000000000000000000000000000000000000000..3dbdb14bf5332af1c15e4bf146abf67d4db3768a
+GIT binary patch
+literal 1375
+zcmb7EYj4^>5d3};|6!%%1IU~on8bjZD%2zmDk&%sHC0t1n_H7>j4wUgNs#*EyS8~K
+zsFf0A8SUKO+{|dtms+i$9dvEy#1oMd2y{F|+wGoqI_NsViQNfZ&km!mYYVtm2~6=3
+z91m=}S3c0PZHHYFO%J}SWceZ!7|9$ytgFI|Wq$rF6QSi3YIC7hAK4(tuvd^Z!Es@L
+z3nFPb;5fau-6O=X>Bpvd_zM?V4}MJgGym!*gt?3bpm=D(ry#|dQgI5;GP{RRW?}Gv
+zjQRILvcyei6bH)`G6i{xAd^L$3xpsM5X(>pdJRHqIzVZODI?ib$VcSqI@L;LJP9(A
+zY%(^L%LD~iQN+Xb+g)<b*<PqMRk>cE<y+UJG?Fo<);&_*+FWe__yeb47)H6#fuaW%
+zr6JJ-mmH+1GpUlaZZrx&V2oAG8;l7VMZoz|W)N7reBN?w_^x(JO5h9FBJx_D$ZdJ1
+zxe!q|bX?I9;Mn$QyUobLJ5?|;4)0WQeh%C_X?kFkZz_-LsI}4*yMU|lbT;qb_*V@E
+zm{2@52J{TS`lH*y1)NdyY&;&#H$VgUkf7`Smy4V6cy?G?!)kymU#(Vj4PH0zR{w_&
+z6OpHxUQaU`z(9+`zKYc<VACw$q@@tQlUHN>)9r9HnER8-<*5I8S~}Q@uQB6b)hG<^
+zmkaAh@PKrCFYabH{rPw@t7zgN&1kXOzC+J|k6Xm>y17wfMd*(0G&^8ae+0+~e?$Ga
+z?%&<fWXAE+iZZVVM;ooX6R2k^pMOgf7x+jQkG=?kYh21SLk;CZp3uE5z%-8wff%Q_
+z3t>;YP33_0VD~1S?KUzt8k91~(Kfj)110xw0h=M(y4??06NY`aMO1J^3OTTr>AI%P
+F*k8r-nZ5u3
+
+literal 0
+HcmV?d00001
+
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch b/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
new file mode 100644
index 0000000000..5a3a249de0
--- /dev/null
+++ b/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
@@ -0,0 +1,42 @@
+From 080d952b27cc6450bca340c37c9bc1cc4ec6787c Mon Sep 17 00:00:00 2001
+From: Yongxin Liu <yongxin.liu@windriver.com>
+Date: Wed, 15 Dec 2021 01:24:11 +0000
+Subject: [PATCH] build slimbootloader/BaseTools with bitbake
+
+Change build flags to use include and library directories
+in recipe-sysroot-native.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ BaseTools/Source/C/Makefiles/header.makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
+index 45c93595..449e5bd1 100755
+--- a/BaseTools/Source/C/Makefiles/header.makefile
++++ b/BaseTools/Source/C/Makefiles/header.makefile
+@@ -75,7 +75,7 @@ $(error Bad HOST_ARCH)
+ endif
+ 
+ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)
+-BUILD_CPPFLAGS = $(INCLUDE)
++BUILD_CPPFLAGS += $(INCLUDE)
+ 
+ # keep EXTRA_OPTFLAGS last
+ BUILD_OPTFLAGS = -O2 $(EXTRA_OPTFLAGS)
+@@ -101,8 +101,8 @@ ifeq ($(CXX), llvm)
+ BUILD_LFLAGS =
+ BUILD_CXXFLAGS = -Wno-deprecated-register -Wno-unused-result
+ else
+-BUILD_LFLAGS =
+-BUILD_CXXFLAGS = -Wno-unused-result
++BUILD_LFLAGS = $(LDFLAGS)
++BUILD_CXXFLAGS += -Wno-unused-result
+ endif
+ ifeq ($(HOST_ARCH), IA32)
+ #
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/slimboot/slimboot_git.bb b/meta/recipes-bsp/slimboot/slimboot_git.bb
new file mode 100644
index 0000000000..2bfdef6a5f
--- /dev/null
+++ b/meta/recipes-bsp/slimboot/slimboot_git.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Slim Bootloader"
+DESCRIPTION = "Slim Bootloader is an open-source boot firmware, built from the \
+ground up to be small, secure and optimized running on Intel x86 architecture."
+HOMEPAGE = "https://slimbootloader.github.io/"
+
+LICENSE = "BSD-2-Clause-Patent"
+
+SRC_URI = "git://github.com/slimbootloader/slimbootloader;protocol=https;branch=master\
+           file://build-slimbootloader-BaseTools-with-bitbake.patch \
+           file://add-private-key-check-for-PKCS8-format.patch \
+           file://build-EDK2-BaseTools-with-bitbake.patch;apply=0 \
+          "
+SRCREV = "d0fac9b4423431babff4e790293aad430715187c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef7fba7be2819ac13aaf5d0f842ce5d9"
+PV = "0.0.0+git${SRCPV}"
+
+inherit python3native
+BBCLASSEXTEND = "native"
+DEPENDS = "openssl-native nasm-native acpica-native util-linux-native"
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+
+SLIMBOOT_TARGET ?= "qemu"
+SLIMBOOT_KEY_DIR ?= "keys"
+
+do_binary_patch() {
+    cd "${S}"
+    git am ${WORKDIR}/build-EDK2-BaseTools-with-bitbake.patch
+}
+
+addtask do_binary_patch after do_patch before do_compile
+
+do_compile() {
+    ln -sf ${STAGING_BINDIR_NATIVE}/python3-native/python3 ${STAGING_BINDIR_NATIVE}/python
+
+    cd ${S}
+    rm -rf ${SLIMBOOT_KEY_DIR}; mkdir -p ${SLIMBOOT_KEY_DIR}
+    export SBL_KEY_DIR=${S}/${SLIMBOOT_KEY_DIR}
+    python BootloaderCorePkg/Tools/GenerateKeys.py -k ${SBL_KEY_DIR}
+
+    export EXTRA_LDFLAGS="-L${STAGING_LIBDIR_NATIVE}"
+
+    for target in ${SLIMBOOT_TARGET}; do
+        python BuildLoader.py build ${target}
+    done
+}
+
+do_install() {
+    for target in ${SLIMBOOT_TARGET}; do
+        install -m 755 -d ${D}${libexecdir}/slimboot/Outputs/${target}
+        install -m 755 ${S}/Outputs/${target}/* ${D}${libexecdir}/slimboot/Outputs/${target}
+    done
+
+    install -m 755 -d ${D}${libexecdir}/slimboot/${SLIMBOOT_KEY_DIR}
+    install -m 755 ${S}/${SLIMBOOT_KEY_DIR}/* ${D}${libexecdir}/slimboot/${SLIMBOOT_KEY_DIR}
+}
-- 
2.17.0


