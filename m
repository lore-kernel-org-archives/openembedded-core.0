Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B40CFD30C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 09:19:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7346.1728638388569077504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 02:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001466b992=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B84TkT014988
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 02:19:48 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sd9gbjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 02:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wehGQmQ1tN6fUGyGrpLVH/+zqliJv0IkQhl2SoduMHrgc8lPQ9CDTIY+q/JXTJW6HazN5BdbwCirOl7xVDYvoG4qW3l3fFTFvVOGNXYgV748A9lT4Ls7i76f/FQiis1UNPedK6f7BhKRdqSFdSFta6AX0mXWvLyY/NKN5ALexZ/JBeHim6yvCAVux8xbtFZsX4Qd1CdClgXKsK6QCoaEMu9v5I4dd7UYkvz24nwgE8E5rVr2FnRKJQ0SKRgiOhAeJbTZqMSWUTpGcAddCmCD0V8n1Tw8IPAFHteGrdfdjjCyvoapcISkGIEk6Q4F/z9R+fcJSSn3ZRDnZxkllXKTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SirMkGgGalAwKkhYJEi18PMitPiGgetWLe0WKDf74Yo=;
 b=v2OqjWujv3mvqF7jXrM7wn/Dx+oWwda9cBlkeLWE26aP67pqmnZapQa/jP8Zup4J3x/H9KEdHr/oSindnhQulU7NQTsZhjNkdaUbiliyiRuHPfpxWmm1fMoXZtEEUpwGeBmTtmGz9RN0525vv+/GR34B9cRK1DtB48GHZ7FNOM5PjJHxIFYIgffz4VXkziS1XD87o6s9wOaQQ5vFXarcPkv3V8/ebEwSIJ2GgLmz4a6xBaMVy44JufMJsiN9YMKJusb8hSaynlSehBjSYRMOmDOI1g3/SHOdEYn0YDPlqRZscnq3Xj6NC33DyLYvJq2DlecFLqe5m6Sg9phDff+wrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Fri, 11 Oct 2024 09:19:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 09:19:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/rootfs.py: allow --exclude-path option to exclude symlinks
Date: Fri, 11 Oct 2024 17:19:35 +0800
Message-Id: <20241011091935.363864-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: e953884f-9760-44c7-45d5-08dce9d5d8bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?upn+PCBXdkkBKsKsyaAar4ODpl//BV+5aoIdUiw/XwsNrgOw8uhbfWMLrN/f?=
 =?us-ascii?Q?tKe18uuBiovVRttZkeCkIOqBQAYB3FoGyTdAkanV39hmE38wDeRah7Rck2+p?=
 =?us-ascii?Q?jCWoAoJV5vtFh+Ts0WPeIP+y3F9FvbxJoGH6sIALqa5AGi09hlnRl178xsma?=
 =?us-ascii?Q?yRKRIMwm/ol5JKgIHmdJSuFMoTQqTFkVG2w2bmLSm0TG7orn1LqlR6WkUWQG?=
 =?us-ascii?Q?OjEoLP7aZBCPqDxmBorKgD/e+hEoyzsS2Y6EQoOyHZItTcSoE8/KUMe34RDS?=
 =?us-ascii?Q?x08u+LixWsDnQQYrJKklXr/ob2LxRHAGYX67r2/CBnFETyv5rF5jXOUUweMb?=
 =?us-ascii?Q?uRZZZHb8Ux1l2+ahxnKTU7/y1i8CVnRDzMlQIM95lgzUf48PS6uBhgDPRorM?=
 =?us-ascii?Q?niBImhSMKcbiNJpnDf3mA1dx8WGcBnPcPLxlDXew2I8XPQPL0ZoJN/W/u+Wh?=
 =?us-ascii?Q?lEjqdZ6KpyWjtbM8kLk3Aj0du1Y6GvgC/vJdrOCtKit2bTBvnFnYzJiZ3Rc8?=
 =?us-ascii?Q?C5y9Z9dnml6WI1WI3yA5H+u/4eXzD3z3GD0gV2RMebby6W8JPvyVeS+B5grh?=
 =?us-ascii?Q?T5QRIXCIxo/voPhNhoxA2kIaqHXQghhPXM72SFTo0DGC/AqX7UB4vTLa5/V+?=
 =?us-ascii?Q?Y1hgb/GCjz5TVHOYtQSBn6KcK52Zo1dINMKmfEOV/ucWQOopvHEg2AyUnkL0?=
 =?us-ascii?Q?orPGDYNBAqENuHCmE8rDQN1CavN2JDKgLSBFFTMPHNOKV17Va+LhjfVuTVmp?=
 =?us-ascii?Q?8aFkHwMdG+REdjgAdsREVEN5fX2+wWPSS1RMojzZCu5r19/1XkoQZDuLSyiP?=
 =?us-ascii?Q?EcIj3ek3zyT7StSvKz7hxR+U7idWVn/e77Em0zfjzvwT5YEJF9yvGaINidHj?=
 =?us-ascii?Q?zy+6tAsLralHK2kDEIfUf7xxlrBoRDUUrCpmngVcyJHvS6l1vgM04w/d/abD?=
 =?us-ascii?Q?EgBs4m4rPf2CLaJYF8Jo11K9UgQaL+KnLxY3Y7OsBzELO/CHm2e76NtozzX7?=
 =?us-ascii?Q?yuveAUq16FWfHdfGsabRN117PTQVUPHoygQyKLwUW9CKjjFlW2Dap1o+PS2V?=
 =?us-ascii?Q?OFI2n0IGVSYOgxPxdFNGWLNxrTDzTQwGaSIdbIrf9qf9gFvn5uMlDgPJ9vS8?=
 =?us-ascii?Q?CymMnuCF8ZteFioEEqPBxVTMwucFWqOVz4D01MfZwx3Tg9Xoyl77eoeTyjna?=
 =?us-ascii?Q?Wr6a1Ez9yJb+ys3mDIxvSvjLlpqpoAB0ffJj/tao0vBJvPiobi65fRjq9Htd?=
 =?us-ascii?Q?MPJBD28UAx9Ua5ABYBESJXrPOsMm6d5ocPHAuaiY1ge14RPHPoUOXL4zbt4h?=
 =?us-ascii?Q?XzHj6gnC4y/pcD1/5HdH7ZqcovMyZJpmcWDhPMg9v9objA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?71L7qfeEwWQxC36VoPqOuc9f9GWqnw23PZIJk9gAazajoldsWpP2J9QMk+yc?=
 =?us-ascii?Q?zqAHw+Ikn5Kdpz0SbT8hlxQozJoKUcwrS4OtBffzTwjKuvA24zhCJPpFq6xX?=
 =?us-ascii?Q?W1zdphZcLiRgdZSp+1Sh3lmNgcsKj79z2uIQhNIRkjibg7Ivg2qxcIjAhc6q?=
 =?us-ascii?Q?jcqk+UZ2rTJwclzgIf1ikxm+glPxPi376+74e9c33m4sIJwA1KYeWpk5xCA6?=
 =?us-ascii?Q?sB5Rs2FudVO0KdeJfpSc6Gw4d9oF/1tHTK7P5H2xkSnieXQJkLk9iHvDZRFd?=
 =?us-ascii?Q?12IwQxO/hxqofCkZJXlLGmZ+241Lsw8cmYXX3R4kzgjdQXNSWV8Pi5RzSO/x?=
 =?us-ascii?Q?9n9yi+QiieM8gpLkygruMQ1/9PfHbGoi//c9SBYJM5P9Oc9Az7BRiw0jEUdX?=
 =?us-ascii?Q?5zdX3pUyI36/i0gdzklul+NKL548ghAMhOs007Aj4LZ14jkWWPZqfEn5UTPs?=
 =?us-ascii?Q?CcASHVYMij0WR2J3hXUEdbWGwKbP0LytA9knawYebIMjyEaBaEq7c9Dd3CLP?=
 =?us-ascii?Q?pjeE4fgFYFj6VX+AN7qpx40PafkblLp0TdnKuY/+M9sJJs51WieepA8AWZwL?=
 =?us-ascii?Q?pHp/akxkbLGqP2yLMuVmU4kNxKr+e+p+uu+MyXF+2mnioobBaMXFy9bPkP9T?=
 =?us-ascii?Q?H0jC/ukYTddiEG85sdQeulDMj505Gt/NJ365tsBg//aJ1YLEq9ew/GlbYHI1?=
 =?us-ascii?Q?RQIQOGyi7l+HQmCiSA6KhQYEehpTWtyLxr2AAjemTUBGuyvAyo+Cgdxb00pd?=
 =?us-ascii?Q?+IbiKJ6ZzrXeW14a9PaKlrqMEst4yAEWcWrfukn6jKlB/CL2P8oF8Rij9/O7?=
 =?us-ascii?Q?yPAcw6OqcYMAjo+8JoGZkvb/8/Y8EJ22LBX5r4DTR1BumhF3WtTOofqK6Bjh?=
 =?us-ascii?Q?gN022w3Gk21MOobdR11z8NLgWqr9GUTRoBSnWZdEqXQEEt437lU9Lo7Hpn9x?=
 =?us-ascii?Q?75RsZejYmlN1w1Y0LYo8h3cjbsvmGNcMAB6zWbGZB4nnM8OEMM2MjjhhZ+kr?=
 =?us-ascii?Q?SE8Wv/UOpAZ8hao00aKAETiJzjPhcVo7AtrhT43J72Lfk949etQR16pV/BNT?=
 =?us-ascii?Q?c4m4aq7GCT+kD8VYjRghgOnNF8fR38Jsh/q33JOoltwl1nYid6uEbpr1IQRk?=
 =?us-ascii?Q?5wU7qK8K8KOO2723YTcbuUS9rkyjZAYee1Z5eJZ4Gw7L9vaVBPZ+Xzl6toq5?=
 =?us-ascii?Q?dU9YiENR/nrUiCbDPgKswu+9mABvypN25kqHVK1lJ04fTBrRAdHx0AQcYbSn?=
 =?us-ascii?Q?mhP0CzOK1U+7Yw8KAnwRegQ5CBSAHdJoc3OWZ7lwOAdGDOLSfM21irpGKskq?=
 =?us-ascii?Q?nN4ya6G85CIHACoCintRL+28jXHBKwlbkvUqA6KixWCnQDLMecVLAf0MCi+c?=
 =?us-ascii?Q?dH6oBbcN3B+vPbe9mFfnFZc93akptm+qz7uNcHOXY6jYiWW6WnubmoXzx9zt?=
 =?us-ascii?Q?7d5TEMvp15JnJ27PidnOGM693n///W+26CzCXKIxYsa+IKADuKBIeNIc9xet?=
 =?us-ascii?Q?rglHq9ZIqr62o/I46huCSotzQBdOXPRVIBckbyTAMZqQoSLT2XBaOKkNorMM?=
 =?us-ascii?Q?PyiDeukW3QSq7vMSlVR37azoEpmnko05ko3C+U3X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e953884f-9760-44c7-45d5-08dce9d5d8bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:19:45.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooEyDyh/u+BIOmBH5PWE4XCmUJO2h/3nuUOZrybSjcJBOrCTgmAimwqg3NE8NNyNy6RXBnxm0MNMEcP1klQDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
X-Proofpoint-ORIG-GUID: -HncUNdO99TT8tsgkO3RR16C_bEwtOyc
X-Proofpoint-GUID: -HncUNdO99TT8tsgkO3RR16C_bEwtOyc
X-Authority-Analysis: v=2.4 cv=fNxr3oae c=1 sm=1 tr=0 ts=6708edb4 cx=c_pps a=+hq7TYb7Jqj0EztKBnUMzg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=kVrq_hbXwa316koxFUoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_07,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=691
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410110063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 09:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205666

Currently, if we specify a symbolic link in --exclude-path option,
we will get the following error in do_image_wic:

ERROR: --exclude-path: Must point inside the rootfs: usr/bin/hello.link

This is because it uses os.path.realpath to eliminate symbolic links. To
exclude symbolic links, use os.path.abspath instead of os.path.realpath.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index ecf749740d..592bcf5175 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -41,7 +41,7 @@ class RootfsPlugin(SourcePlugin):
         # Disallow climbing outside of parent directory using '..',
         # because doing so could be quite disastrous (we will delete the
         # directory, or modify a directory outside OpenEmbedded).
-        full_path = os.path.realpath(os.path.join(rootfs_dir, path))
+        full_path = os.path.abspath(os.path.join(rootfs_dir, path))
         if not full_path.startswith(os.path.realpath(rootfs_dir)):
             logger.error("%s: Must point inside the rootfs:" % (cmd, path))
             sys.exit(1)
-- 
2.25.1


