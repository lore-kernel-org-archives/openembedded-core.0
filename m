Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BA3CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:25:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1744.1759336524933143777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 09:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mAZF9epp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23693844c4=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5915mlvF1016299
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Oct 2025 09:35:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=q+NLTmmKODtp6neuTWWN
	3ERlh+u58cHmGg0wEgGPmNA=; b=mAZF9eppv4w25It73E2zT7LhdD6pXFVtHLt5
	9TyWB1jC5vVwBTeMYzOWwt9R9hSyokjinc2+3sQXVX86BjF8gYzch5nft0Istzfc
	woFwSo23CfrIMIGx0tGGZ/kmU5GL/CQNEaIlpIXoGw0CfbEf4Ibtdd67dg9EqYNw
	k+6QoqecOPHm3hEmJurabjIexq6blwORzAVWmNT/9Jyl2ucJdJnvdVtTBV9Vly0A
	hrIDJpVh8I9mAMkknDOpd0RWsRnMWbFaTLGw+u6R/Y8h9JX/U7/rBUh/YXB9FmJQ
	pGiH/kwKEmEesX0TOQuMSL8OuVF4QrqlFcitEya/fjD6LpPb3A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yna2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 09:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GleOaLHxHFQ30T4pwX5UvRxOAHnHCFY8SSXZqJWyHyzAGz0RbVs63srcQAaZpUI4tkMTxCwxV/E5y42wbrE85Jmu867EgA+BBTirgiL5h1jS6IPEDVfsU6Skz3ObRDZ8HG8tH1GYvW30reUWsmiUInnXfhbGfVr720gZilS3Uvp/qjMUiDV6SkHJ/BxLfzdicS23Lmzldj0VfSvaVtPIWU2y/KKzgiHZV4BEm0U+jYQiykN81SP2dFTxz/8hcFS/ZSi+3KqSCKnWD8k8oFWqw+sKPsfUMe/CEdjGEmLvlfKNB7KbWgiXz51h2b/NRkhGPFHvwEKURwbznR/nzKK5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+NLTmmKODtp6neuTWWN3ERlh+u58cHmGg0wEgGPmNA=;
 b=IJL92neqYdLWtqXMP0X2ez6CkW2PjgxAbv7s95AoIHR7M5hGz5/Etbw1c7hA4opU795npupbr28O954PCyt2+HQ3iGJC8OUypsLNYkR9qOQA0hioKNvrsk302936Sf4B3b/BGDi3/AM5lZpEduj3ABJFZuHDuySWW5kMFqT0Q4kNiLIkPw3Sx5jPOC/v3LlKbn81SKsaSkP7Yyn2dX7VXaHIic/ftTyyxVJ+s3GJKLh3xahB98gggvsPxtqyRro9tjwtIo99IzWPgMr/9aJmU+HLs8AEoijtGQZk1AkUdNgn0rOT5ychYUX6+OtikjMUk+cHXyXCY0VEJHXBq0W2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:35:22 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 16:35:22 +0000
From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories into wic image with ext* partition
Date: Wed,  1 Oct 2025 19:34:57 +0300
Message-Id: <20251001163457.49114-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: a05d0c19-c76c-4fe7-3e6a-08de010883f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZE55YLeYCx3i6HzBWghMQpcQow3DYEU3VnE8pE30KVpXcBDr+j90+KZlm+rk?=
 =?us-ascii?Q?AAIrexPcuSzDhAx8SimMp3G3fZRq1F/peR+ZZ7iIuOoWwR4e+nYPWGODlbQ8?=
 =?us-ascii?Q?cuxMbIklmZNjQzsZvWZzA/37lnF90bPDrZEirVgfHhAccUUFPdmEhRhQhVfc?=
 =?us-ascii?Q?x80eCef7HHjvUYALvMla6ZdFtIwlmPx+QC6ZYz+YTstICP8WmB5WIH7cdly7?=
 =?us-ascii?Q?JYeYnEHyG0ZpKFM/CpbRY7P9cD8DyRMqKL4lyRdoLcl75emLHDTLIRzPBNxN?=
 =?us-ascii?Q?xtp3Ug/kwsaL6epSZeFGCH2FUcaXZYPebB4xmGRbkFOvr6yufkIYyL0HJOig?=
 =?us-ascii?Q?z2sXFJOudSrxj/FA1ZQwrWlkntSnsEMLylddYYp/znVrEuQvx5FdnbFKnaHE?=
 =?us-ascii?Q?DNtEfosgIXEd7ezVTRzD1hy5fGP2IFYilQ/nAWssbTt5TsBwjY7nBsWb1EaV?=
 =?us-ascii?Q?U9uwBTl7DeQZtg67hyERym8YfaWYdibS3ckHprw8LMBkxkuMB2VNhkdGghai?=
 =?us-ascii?Q?mIvRFY23TXOpDKDM4MT33MerQaTq9MgdSRcYiXh3CTL6cq5myBk1PH8h/p1z?=
 =?us-ascii?Q?OnUVdUEspyrK3b4c4b4odNwDsuF0Bg67OSJXsnLBPkehve4l8w3GkbW+g3RQ?=
 =?us-ascii?Q?Oe99FhNTq6cF6ILfHErdvtR8R57ukAhWOWf+rZ3W/xRVlAEuS8bl98y9NjSy?=
 =?us-ascii?Q?D4JYOolPlPVEbwjQbKU4TU/8NvYrAoE0YFEjoIsHJzcN6lo7lgDPdMF7ryC5?=
 =?us-ascii?Q?Tvoe3KYpoz5su9hXMyjKmFspiJI/YajqU43QlM1sD8peR49emNacEI8qTmDk?=
 =?us-ascii?Q?UrC/LwKaAmz/umFcSfXcY++V1TOPY5q8P4NBQ3m7n2rM6zTyUATsuRR79k33?=
 =?us-ascii?Q?Y8l70CuftN/K350ObhEfIHDMyVd2RD5GZ3NO6a6ViARVyYrNkSrKIP3j/hqq?=
 =?us-ascii?Q?KWQJQ37IA15xYtDIi/3GoKG3M5rodzpUuqW5q2vWKCYHZXvYwl9h/OM3YDrF?=
 =?us-ascii?Q?WLQ24nEr4xX+9zYFWr26zSBRxznSLyjOLyUFoMFPINYBWFii32UjZn00ofQe?=
 =?us-ascii?Q?XqeB49u9Endh7KK5yPmjY/qpouVnkhswPShjkp8kCdNBts6DUqQHe8wpHjaq?=
 =?us-ascii?Q?uvDzkHEb5ftemuxKAidcTBTymcaphKKGYw6Lic0SFufB7DWfuvFlFBEo7iHg?=
 =?us-ascii?Q?oiJsQb/wm7OHHjPtJWNxGMI67TurHOyS7LRpxqmw3W0y6sK3ds4izPrapRAr?=
 =?us-ascii?Q?EBJd1cQc9fHgBagEOBS/GaRY6gs3QxWM6l1FEgjKhFpnkEIKvmOKlw8L/AAv?=
 =?us-ascii?Q?8QdZvhJf0IwpcUTANVJamO0M+qHa7wpDazNqjFYTs/fwWF64j9qF7e8o0Uvc?=
 =?us-ascii?Q?CLcFP+Vxr9DuY4LBgQw7+EVI6s+9zAE/wWgqkfyy5PxR/IrZzTBscnOmvpSm?=
 =?us-ascii?Q?o0E+USL8+ju8q2owO9skYTX7X/eicbczA+ZbxNIrse/FrnXN3eeGJyUpnW78?=
 =?us-ascii?Q?qMAGRqex5aN4Z6wEGegILTS4FOwOat9pSuez?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zml8gOE6fbUUfyCMXT+RMlTypPJr8AQ6AknRi7NNxzL9sU+HPJ2Y42KjmytN?=
 =?us-ascii?Q?RQH9kom0PB2+3rIf9f4mkRBuXKaRR+5TFIepVQajoMWIC3VccE8OWjVPKZwU?=
 =?us-ascii?Q?63NJ1NSGJ7hnDDZXYfS2SUsOlPmUTpyn6Wrr8NIOLGJaCejn0V2uGMY2Ctd8?=
 =?us-ascii?Q?6uMHNdKJfWsuFQ1xlKCu1VrUdlYLqAZpEbKMee7yTWoLD10SUhRuLDSO3G24?=
 =?us-ascii?Q?PoY442SQRKv6G12UmOarPwSepu7iPfuXQMCqVdroHd+LO9k9HF7j9nuOTjQr?=
 =?us-ascii?Q?DNf7j+YG62y6BPaj3D1kLwhR8ORPoqEA9eWYveTKH/qWSiGSvmPTyK/uUqjp?=
 =?us-ascii?Q?RHjeoLSA8Opmwe6gmrKobzSReVOepnp0j82XOTISdsJBLj6hpHZgE3iWE9iN?=
 =?us-ascii?Q?XGcLGl4JDyAeTZOcK1iXMHJ+euUcL1Tq959tup32WPPu4LRp0b8ts36e5U0G?=
 =?us-ascii?Q?pQ1t90oiiKZBqil5Ji9zLHeeNIIgsFJqugLyGYfjM9Cx5CPCH2QM9ix4o6S8?=
 =?us-ascii?Q?pmHjWSTiI+aD6hrksGlMDgtZsbO45o/t+z0T2xmtr1ir5eOPvFWfYNLGO6H+?=
 =?us-ascii?Q?qh6R8eM+Q/HljcMDVZzNWs98Qybs80vk9ZFY3t20Fh27cWZMnChSYpbWRLPr?=
 =?us-ascii?Q?x9b158IHP9qjotl/y4k6P0VCgWmWkOIpkF+R6IiqsIzSb7g0WrMK9/C6nqAi?=
 =?us-ascii?Q?eFmfKNcG9fqCWwkMGJKeyKuaKuHwNZ7grI/Vlui3ftzSZnPW6p67RXIPsHF7?=
 =?us-ascii?Q?127KVh3335vku1LIeGu3NOyH6ZhsezY2VUx7J/4V3bGKqHWFLd5fBw8f1z7M?=
 =?us-ascii?Q?Tu1xTsnjNIPRgaYuq68LAJPMnFxo13uaQCmcSr0eYpRX1cDfZGN9CgmVvV3W?=
 =?us-ascii?Q?/25HSv8fKLwJj6PpWH1/6QMrlUVYINZfUuYC9GUQgSGozF/dtZqhLNXre/uh?=
 =?us-ascii?Q?ZQALQiIuDEAxY0Lue8odvgu/KOrdcPVXJnbj0/tIMqfXSy2bW2aIPAPPkoP2?=
 =?us-ascii?Q?hHa9und+/rBTS/soIqlp6Om0PEdxX1p2NYd0awPN42r/X9GSGr+w2vV7fadB?=
 =?us-ascii?Q?8SjmBRNkDeQDgvdL8WDydyHfgsWCBUxYfi3y3qymsSWqB/CWgJTN2sbhumpu?=
 =?us-ascii?Q?/CRsehuU/yseRtz/zvYIDPo5aoGSpSZoNkriAKWkAxA5hGQFk9/adBjvDEqv?=
 =?us-ascii?Q?/DKkJmD3HPAHEwHzxPNlxu6sNEm4+wbcKNzeVf7CYGymCos7s9Z9evUwrK8i?=
 =?us-ascii?Q?WNZt/kRRDvJfHU8okUSQQkYkMNDPGEp1yr50ewFbIZDxNossgkh38JWptesT?=
 =?us-ascii?Q?WQm+LUO7vMLZKlImDmfY+QtOmlrwUFvp7cJxb4uDXaVTzGk0RvUKdUL1rWQp?=
 =?us-ascii?Q?LHHdZ7dtG6AUlEKZUMsq/OPGCTghFJ78TWSwa/A8Ue2cFmvzJg0bRzmsLepv?=
 =?us-ascii?Q?AOPPE55KgI4EtIWsY93uQlgife4Ghz9JppBVEd8IlK34hYWthDbS+gNUGT8G?=
 =?us-ascii?Q?Wnko38yLYqsvbnXGUoZ+DrYJrlAGdX81Y39bDiv9cQBePmMiW4fYhB8OJczE?=
 =?us-ascii?Q?C31pHC3LrAqO3oRTjWkGMAUUZWOPYVKLL3FXJbPUFJk8+vRFWiWLSEmVBG6q?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05d0c19-c76c-4fe7-3e6a-08de010883f0
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 16:35:21.9781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxGqVShAfN9HaavwlY64I/oFe6IkYA/asaqaQ6nYuE3lc/m9ZO/Ha/N06FKOZZt1rjDE7Pv9EV81QH6tVW1yuAE51yR8+aMz9eucT13g/8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-Proofpoint-ORIG-GUID: 3MvRCwjRckwrCOoNC6VIxMdAmpn7bvkz
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68dd584c cx=c_pps
 a=vzv6YJZFwQv9rWyERtU3yg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=-5XPcBp7yNJgENPRR3YA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDE0NCBTYWx0ZWRfX9aRqN+N/gMYN
 x5hxLxVmen1zBaD5Cg9JOjlKQPebzNg30SMOMKLIjQgUUj6wSsB6hOmixrq+zBJL80CqXrUOfBE
 FYZ1s8du1308dnevwGhagleAOKRi6mbyZKArSX/ZUHHNda/wiY4l/oE2Gkqj5wYLn7FL2TafSE7
 8RCf7ipYKSazG6oIEPEKo9YQIfJzGv9Km+wSegA3+lFgGijSLujmUA1i6Y1NBUIaQA/4RDHriPa
 LW8ASUXcNV3NeUeu6AL4QSVwW4tfPmJpCQbJa3jx/YO/6N80DFw71LUGMxtg0ClwQIrTAlP+qBK
 Pu8Wab5HbeuHi/cu7R+3Dgqz0kE8P13NXOQCBdjd8wKOZXfgqgInF8Pv9AADQ1SH8GkV4uZ3cdw
 ZqmsPRG8RX9xjd6qXkGh9EaXqQeXVw==
X-Proofpoint-GUID: 3MvRCwjRckwrCOoNC6VIxMdAmpn7bvkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510010144
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224331

wic uses debugfs to write on ext* partitions, but debugfs can only
write to the current working directory and it cannot copy complete
directory trees. Running 'wic ls' on a copied directory show this:
    -l: Ext2 inode is not a directory

Fix this by creating a command list for debugfs (-f parameter) when
recursive parsing the host directory in order to create a similar
directory structure (mkdir) and copy files (write) on each level
into the destination directory from the wic's ext* partition.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index b9e60cbe4e..9d596be3a7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -345,29 +345,64 @@ class Disk:
                                                    path))
 
     def copy(self, src, dest):
-        """Copy partition image into wic image."""
-        pnum =  dest.part if isinstance(src, str) else src.part
+        """Copy files or directories to/from the vfat or ext* partition."""
+        pnum = dest.part if isinstance(src, str) else src.part
+        partimg = self._get_part_image(pnum)
 
         if self.partitions[pnum].fstype.startswith('ext'):
-            if isinstance(src, str):
-                cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
-                      format(os.path.dirname(dest.path), src, os.path.basename(src),
-                             self.debugfs, self._get_part_image(pnum))
-            else: # copy from wic
-                # run both dump and rdump to support both files and directory
+            if isinstance(src, str): # host to image case
+                if os.path.isdir(src):
+                    base = os.path.abspath(src)
+                    base_parent = os.path.dirname(base)
+                    cmds = []
+                    made = set()
+
+                    for root, dirs, files in os.walk(base):
+                        for fname in files:
+                            host_file = os.path.join(root, fname)
+                            rel = os.path.relpath(host_file, base_parent)
+                            dest_file = os.path.join(dest.path, rel)
+                            dest_dir = os.path.dirname(dest_file)
+
+                            # create dir structure (mkdir -p)
+                            parts = dest_dir.strip('/').split('/')
+                            cur = ''
+                            for p in parts:
+                                cur = cur + '/' + p
+                                if cur not in made:
+                                    cmds.append(f'mkdir "{cur}"')
+                                    made.add(cur)
+
+                            cmds.append(f'write "{host_file}" "{dest_file}"')
+
+                    # write script to a temp file
+                    with tempfile.NamedTemporaryFile(mode='w', delete=False,
+                                                     prefix='wic-debugfs-') as tf:
+                        for line in cmds:
+                            tf.write(line + '\n')
+                        scriptname = tf.name
+
+                    cmd = f"{self.debugfs} -w -f {scriptname} {partimg}"
+
+                else: # single file
+                    cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
+                          format(os.path.dirname(dest.path), src,
+                                 os.path.basename(src), self.debugfs, partimg)
+
+            else: # image to host case
                 cmd = "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {} {}".\
                       format(os.path.dirname(src.path), src.path,
-                             dest, src.path, dest, self.debugfs,
-                             self._get_part_image(pnum))
+                             dest, src.path, dest, self.debugfs, partimg)
+
         else: # fat
             if isinstance(src, str):
                 cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src, dest.path)
+                                                      partimg,
+                                                      src, dest.path)
             else:
                 cmd = "{} -i {} -snop ::{} {}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src.path, dest)
+                                                      partimg,
+                                                      src.path, dest)
 
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
-- 
2.39.5


