Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A42C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 09:26:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16518.1647768368327553244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ibHAr3nH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=007883ae7e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22K9Q7Ef002220
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:26:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6RHcazNVnteunhim+khegrGOgovZvgEg2j6Wgwpl6J0=;
 b=ibHAr3nHe1LUxlHE98n6pWxL7dpK6X7231ucKIRF5sW3xJXILymOARNc9jbDsmu0rbmf
 WRYUflEMPFs5MVds6QK8a0BHo7HLWo/LQOXR08QxucMGoUnPPBT6TRcpaXwc1FR701Dn
 WCtyBY2woMu5aMoeaU5PDFIFLuuZcM6ldy0e1AoK6PlDTB4y3vKW72MNubYuJGhtgSSv
 eD9c0m8YXqnGiM3zcj/ieyumFWpMxkTGMcpVHlIEDVqG4Wr6udmkkcjEJskyYpIXSoPR
 b+im4ABoVK21TsObQAskQPUx4cRbulnpq4vfVbzs5Pd4/x+nHFeEOdXvOBl59OV3KKmZ lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3rm94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:26:07 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22K9Q7F6002213
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:26:07 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3rm92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Mar 2022 02:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsCy/vfe3RVSkKRciMT5TY4HrQoloWUw8Yfw2ghHKB1S/NMHAu0G1dSzcwJqrhhxshCQAF7NB15vCq5bWzgCUUgtaTx9XMCiuYaZ/4gGBgiSzHf+CMOemueKZXgtISm/E3CoJIrJPB74woVoyKb+msKKUh1HGmE6JrRsj9KLGHdqCO1C6d9PGdvGgyrSwm+mERlpHvfvn9hPGMRaBwCdhQ6NGniAJCh3TRu0u4H1/p8NpbWN10duhmuuB+Mrgq+xSgrxF2SdPAkaGVTx7M9WP+w29OnjaEOMs2EGSJDOAswWj5115Tyru7ClUb0w2uI/1f9ssyWzesFqh8jnkMmwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RHcazNVnteunhim+khegrGOgovZvgEg2j6Wgwpl6J0=;
 b=EgWGLNIP7mSIdvWzyJHPa0mIrhyY/ZpT71WMGGNaTOgY+WQZfSHr/LCtpCGTZEvSmkoyMgRsG6NfmbksDL9PBv4WvpEE6DLVTx8gOdDPLCfUGaCjxI+aNlZxWiNtO28EZIHmuLCIpHMkW1nXr+NqYTikuMQRj8nv7676ftcCEjlzdaOt789BjbQGoXR9clH7Qcv6LBPYhpPO2sxc1BOx5o3Gblw8Ea7/lkJnzrPquXf7beP3cY12DzV8PuqbhEe7x9+3n+xB7cGBSU1ScQk/e2u9AcVbY/kNCPqXvGSN69HGar7JADIUOEpSEoTker4o8Zyu7GYGP6nwH3E8N1VrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.21; Sun, 20 Mar
 2022 09:25:54 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::4ceb:e511:4a4e:17af]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::4ceb:e511:4a4e:17af%9]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 09:25:54 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [dunfell][PATCH 1/1] openssl: upgrade 1.1.1l -> 1.1.1n
Date: Sun, 20 Mar 2022 11:25:36 +0200
Message-Id: <20220320092536.2845237-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0501CA0016.eurprd05.prod.outlook.com
 (2603:10a6:800:92::26) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d40aeb1b-8473-4ac0-00e8-08da0a53a1cb
X-MS-TrafficTypeDiagnostic: DM6PR11MB4722:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB472253F26F247AE27F435D16FE159@DM6PR11MB4722.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7kU9TRX92wif5jEoEGS5Uj6nLlRIeKVM+ryvdS3gwbHW2S6IzMQGmKERc8YouZeCiagfBw+cDczF/EuzDtp1ThWRAU2+tOoVJ8XoUqHP54/EPWPwrfUVhlZgGlRSPZbut6N+LsX73lYLaIVfbvDkIyoJjAMQfbHTrRLsNBo9tX4l6niFks2Ip3LFgW8q8B1JdcYEQtawYGYVZvE5Y7o3TcW20plgwjdw3BLbdIRUdgUCIqaBzCxZoU/T06IRO0r7BFJ2hfUIOPt70nYEZWxAv4nkAqomrSoyesUP8IfzbXjkyb1JVW3B3obfa8JnkSzS7rR6rw4jJl4iTMDRrirTl8jNiL5qa4haXLWUoodqUI3l5LdLgyBXTzJs3GlN3x9TRSk3LpPzvqjnqYDFD/FRXjB/sRVSqLHCCwPtgkgZWGz3d3ctTmJnmnH6Mbj2qfxu8+wxS9xpQ/NW3O/5ovAIt4eo/xlmuH4nqC56NBVBiIYQDk2xqF9d5NWJjVgZntN+UxJp3RCcCN4ns5rKWEQ3nccCxV8JSP+xNv8aynXqgqMOUZ4IxSOtXaN3sfu7Cw/Osv5ZnVQXYHmh0D7zWloLvLjgRVpdS/sekSEDjyqe5YrUaJFAeMGS5+Wxy/iPCpkMRjdyzXrnw4BJEegGib9PTLfY+KQiQGkPW0ZhaKTTg1uKgIV9DbpwZLbb+J9Bs9kwMZ7NI7ul7F7TWqUK+d7nPycp2jx4CIZlTn3qW3zaq583LVmytDXsa3YFkCsYWfemSZk3BDd/8Wu5PAaeKnWvBpo0jFd6zvHNJz2s/tMLRosTfqMcm5i8pOwNoRC9Qmqv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(5660300002)(36756003)(86362001)(6486002)(966005)(508600001)(8936002)(45080400002)(6916009)(316002)(66476007)(8676002)(4326008)(66946007)(66556008)(6506007)(38350700002)(38100700002)(2906002)(2616005)(6512007)(83380400001)(1076003)(186003)(26005)(44832011)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1HJfFYz5bK1AVx3kj1Ueh3l5au2GxLC2yOHxKGbbiV1rMYqzrLWc015TYwQU?=
 =?us-ascii?Q?2rCSpVVvcg60v2KkFA+hhwX6TMOhklV/qRkHiQ456XqOAr281FdxhdnoNoPI?=
 =?us-ascii?Q?7O32vPBmcvGP4IY3k72xMQiCac+LADuqJUiHrwyp5cbQZbuxooPSyHdos27P?=
 =?us-ascii?Q?jHTkxZh9/4mSs7wZLYED5TOY3LjCocRiaTBpdpZmFBdhVeoaLlMQuVJJvaNd?=
 =?us-ascii?Q?mMP2Cwymq0yGllsMG+adKq4d0td7/s16tLbmq9zBiVDQvHxqChl8/QwRd99w?=
 =?us-ascii?Q?AF8YP03SHTaYJeWeSt4YJx9PqCIFirlVX+ilevdm2IbH5r6FdHbUqbH30qNr?=
 =?us-ascii?Q?1z5Khw1E/qnmEPPD0bDVKiE1r1ck+j7EihBmsZc/iq+401ndYMR8TXJSdC+w?=
 =?us-ascii?Q?vYzi7KrFWPwD0WAY9VTh6+1VUD7Vlo+aR0+AXd5nJf2kOwbcaTlPUorCYQgn?=
 =?us-ascii?Q?1Mn8DcAOgBQtCC4UAk6bbriTiaq10p2WAKrTyFidHlhIseVJOkkbd1GKc6qc?=
 =?us-ascii?Q?V4rMJ1NXPhthOKDJXShFuXKOOivAtZxGj4pOwafPkHvaTYZ9QlmGtVwrhkQH?=
 =?us-ascii?Q?KHVZ7SWvDOcJza+8/bYV9ZwVj9wYeSYB0qxFOfj8rTYSiLt2ZJGCUTCUOWW8?=
 =?us-ascii?Q?Q8A39lpCi8giQXnuAP2s6wNeSI8G0p/ls7Sk+CKOG+s4tmKt/gljeGerQJZ7?=
 =?us-ascii?Q?lhKfRd1XYZJvcPeAFAzmnwYqY3xCovHNZ7vnqrRfGWFNkUVnbTv8ivNf9d1a?=
 =?us-ascii?Q?Wwe544WkHgGt/ICqLnYh9BfeP9+OWk8hrY8PkzgZLyTcenpVykjjgBmpR7vd?=
 =?us-ascii?Q?lHwrf0Po/UFRhR2IO8RHePrVKFQ/LOZ+jrb0ufYc3nOtsv1QzB3iJ4Ro2rYJ?=
 =?us-ascii?Q?upP71RXMXckbkDGI3EyCoie8ag8yOYKpCORGOQQOCkKs+fL5cny/wsjJUQoC?=
 =?us-ascii?Q?XZMAox1GjIStRsbhgGKdOAc50RFKyQtm35havJkL5SpGJ0qOfdKXC+HoL7qq?=
 =?us-ascii?Q?apY+cyjMm5Y2W/5BeLLCD9dY+ZyWJ25Dpwlv8/2flv6+Z1RO51qdJp88CH/w?=
 =?us-ascii?Q?eAnGU+oiaRPOyCLIcTT98Gvb4BZL/oJ/u+EFzz6WPAzxaaU+AHZYIXXbVP3P?=
 =?us-ascii?Q?cG7d7lE2Wz+QviEzpvfodujB/2fzAnSnQQPGNEJjdg4wshEqy/TE1dC1NdVR?=
 =?us-ascii?Q?qilC1Zj2U9RAEAznm0Z8I66C+woSH4rTt4IvIg3HDKhb7jpG3pTzPZ41U8UM?=
 =?us-ascii?Q?UbuZn2i3eeVP7cpmmDfU2OTC1aqp9UjBDZTC48dMcK6Kpwezl2FHbmt9Qu1W?=
 =?us-ascii?Q?4HDs2X2+kmYMDAgJAcO58nUTxLiCAMGUW4MkLTRqfxH215DsPBqLaVz79Wwd?=
 =?us-ascii?Q?SnfW0rA6lUFUXO0lZO0LrjhdQlIziVCYZcMNvq2W9kXrF1WhFzpSXqcTMojE?=
 =?us-ascii?Q?NZhbITBC8uLlnKAuyzrj3am0ksxqJMQbfs3hF1Jr1fAkyk0/wuZlDw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d40aeb1b-8473-4ac0-00e8-08da0a53a1cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 09:25:54.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GvusLvqIdpv0TUFSxPK38kJTfG/Y+AMq47xA9jf9D+k9Evu92+FiWFfRc+dwaTQj0OQidQi7wmxTfce4cuScduFtaEpb8o4KTE/Z9lPoKQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
X-Proofpoint-ORIG-GUID: 1rOgw72jLSab7tiA215Kecze2mwnsREz
X-Proofpoint-GUID: fpjT4wRlEyS5OKfUsidqjD23AZ3SYiRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-20_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203200072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 09:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163479

Upgrade openssl 1.1.1l -> 1.1.1n to fix CVE-2022-0778:
https://nvd.nist.gov/vuln/detail/CVE-2022-0778
https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=3118eb64934499d93db3230748a452351d1d9a65

This also fixes an evp_extra_test ptest failure introduced by openssl-1.1.1m:
"""
not ok 19 - test_signatures_with_engine
ERROR: (ptr) 'e = ENGINE_by_id(engine_id) != NULL' failed @ ../openssl-1.1.1m/test/evp_extra_test.c:1890
0x0
not ok 20 - test_cipher_with_engine
<snip>
"""

The ptest change is already present in Yocto master since oe-core
commit 5cd40648b0ba ("openssl: upgrade to 3.0.1").

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../openssl/openssl/CVE-2021-4160.patch       | 145 ------------------
 .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   4 +-
 2 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
deleted file mode 100644
index ff1e807157..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb Mon Sep 17 00:00:00 2001
-From: Bernd Edlinger <bernd.edlinger@hotmail.de>
-Date: Sat, 11 Dec 2021 20:28:11 +0100
-Subject: [PATCH] Fix a carry overflow bug in bn_sqr_comba4/8 for mips 32-bit
- targets
-
-bn_sqr_comba8 does for instance compute a wrong result for the value:
-a=0x4aaac919 62056c84 fba7334e 1a6be678 022181ba fd3aa878 899b2346 ee210f45
-
-The correct result is:
-r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
-    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3d 97ed17d4 7950b465 3cb32899
-
-but the actual result was:
-r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
-    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3c 97ed17d4 7950b465 3cb32899
-
-so the forth word of the result was 0x75be8e3c but should have been
-0x75be8e3d instead.
-
-Likewise bn_sqr_comba4 has an identical bug for the same value as well:
-a=0x022181ba fd3aa878 899b2346 ee210f45
-
-correct result:
-r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3d 97ed17d4 7950b465 3cb32899
-
-wrong result:
-r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3c 97ed17d4 7950b465 3cb32899
-
-Fortunately the bn_mul_comba4/8 code paths are not affected.
-
-Also the mips64 target does in fact not handle the carry propagation
-correctly.
-
-Example:
-a=0x4aaac91900000000 62056c8400000000 fba7334e00000000 1a6be67800000000
-    022181ba00000000 fd3aa87800000000 899b234635dad283 ee210f4500000001
-
-correct result:
-r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
-    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
-    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
-    2822309cd1d292f9 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
-
-wrong result:
-r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
-    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
-    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
-    2822309cd1d292f8 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
-
-Reviewed-by: Paul Dale <pauli@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/17258)
-
-(cherry picked from commit 336923c0c8d705cb8af5216b29a205662db0d590)
-
-Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb]
-CVE: CVE-2021-4160
-Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
-
----
- crypto/bn/asm/mips.pl |  4 ++++
- test/bntest.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 49 insertions(+)
-
-diff --git a/crypto/bn/asm/mips.pl b/crypto/bn/asm/mips.pl
-index 8ad715bda4..74101030f2 100644
---- a/crypto/bn/asm/mips.pl
-+++ b/crypto/bn/asm/mips.pl
-@@ -1984,6 +1984,8 @@ $code.=<<___;
- 	sltu	$at,$c_2,$t_1
- 	$ADDU	$c_3,$t_2,$at
- 	$ST	$c_2,$BNSZ($a0)
-+	sltu	$at,$c_3,$t_2
-+	$ADDU	$c_1,$at
- 	mflo	($t_1,$a_2,$a_0)
- 	mfhi	($t_2,$a_2,$a_0)
- ___
-@@ -2194,6 +2196,8 @@ $code.=<<___;
- 	sltu	$at,$c_2,$t_1
- 	$ADDU	$c_3,$t_2,$at
- 	$ST	$c_2,$BNSZ($a0)
-+	sltu	$at,$c_3,$t_2
-+	$ADDU	$c_1,$at
- 	mflo	($t_1,$a_2,$a_0)
- 	mfhi	($t_2,$a_2,$a_0)
- ___
-diff --git a/test/bntest.c b/test/bntest.c
-index b58028a301..bab34ba54b 100644
---- a/test/bntest.c
-+++ b/test/bntest.c
-@@ -627,6 +627,51 @@ static int test_modexp_mont5(void)
-     if (!TEST_BN_eq(c, d))
-         goto err;
- 
-+    /*
-+     * Regression test for overflow bug in bn_sqr_comba4/8 for
-+     * mips-linux-gnu and mipsel-linux-gnu 32bit targets.
-+     */
-+    {
-+        static const char *ehex[] = {
-+            "95564994a96c45954227b845a1e99cb939d5a1da99ee91acc962396ae999a9ee",
-+            "38603790448f2f7694c242a875f0cad0aae658eba085f312d2febbbd128dd2b5",
-+            "8f7d1149f03724215d704344d0d62c587ae3c5939cba4b9b5f3dc5e8e911ef9a",
-+            "5ce1a5a749a4989d0d8368f6e1f8cdf3a362a6c97fb02047ff152b480a4ad985",
-+            "2d45efdf0770542992afca6a0590d52930434bba96017afbc9f99e112950a8b1",
-+            "a359473ec376f329bdae6a19f503be6d4be7393c4e43468831234e27e3838680",
-+            "b949390d2e416a3f9759e5349ab4c253f6f29f819a6fe4cbfd27ada34903300e",
-+            "da021f62839f5878a36f1bc3085375b00fd5fa3e68d316c0fdace87a97558465",
-+            NULL};
-+        static const char *phex[] = {
-+            "f95dc0f980fbd22e90caa5a387cc4a369f3f830d50dd321c40db8c09a7e1a241",
-+            "a536e096622d3280c0c1ba849c1f4a79bf490f60006d081e8cf69960189f0d31",
-+            "2cd9e17073a3fba7881b21474a13b334116cb2f5dbf3189a6de3515d0840f053",
-+            "c776d3982d391b6d04d642dda5cc6d1640174c09875addb70595658f89efb439",
-+            "dc6fbd55f903aadd307982d3f659207f265e1ec6271b274521b7a5e28e8fd7a5",
-+            "5df089292820477802a43cf5b6b94e999e8c9944ddebb0d0e95a60f88cb7e813",
-+            "ba110d20e1024774107dd02949031864923b3cb8c3f7250d6d1287b0a40db6a4",
-+            "7bd5a469518eb65aa207ddc47d8c6e5fc8e0c105be8fc1d4b57b2e27540471d5",
-+            NULL};
-+        static const char *mhex[] = {
-+            "fef15d5ce4625f1bccfbba49fc8439c72bf8202af039a2259678941b60bb4a8f",
-+            "2987e965d58fd8cf86a856674d519763d0e1211cc9f8596971050d56d9b35db3",
-+            "785866cfbca17cfdbed6060be3629d894f924a89fdc1efc624f80d41a22f1900",
-+            "9503fcc3824ef62ccb9208430c26f2d8ceb2c63488ec4c07437aa4c96c43dd8b",
-+            "9289ed00a712ff66ee195dc71f5e4ead02172b63c543d69baf495f5fd63ba7bc",
-+            "c633bd309c016e37736da92129d0b053d4ab28d21ad7d8b6fab2a8bbdc8ee647",
-+            "d2fbcf2cf426cf892e6f5639e0252993965dfb73ccd277407014ea784aaa280c",
-+            "b7b03972bc8b0baa72360bdb44b82415b86b2f260f877791cd33ba8f2d65229b",
-+            NULL};
-+
-+        if (!TEST_true(parse_bigBN(&e, ehex))
-+                || !TEST_true(parse_bigBN(&p, phex))
-+                || !TEST_true(parse_bigBN(&m, mhex))
-+                || !TEST_true(BN_mod_exp_mont_consttime(d, e, p, m, ctx, NULL))
-+                || !TEST_true(BN_mod_exp_simple(a, e, p, m, ctx))
-+                || !TEST_BN_eq(a, d))
-+            goto err;
-+    }
-+
-     /* Zero input */
-     if (!TEST_true(BN_bntest_rand(p, 1024, 0, 0)))
-         goto err;
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
index 24466e11b1..8538bd5a18 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
@@ -18,14 +18,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
-           file://CVE-2021-4160.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -181,6 +180,7 @@ do_install_ptest () {
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
 
 	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
 }
 
-- 
2.25.1


