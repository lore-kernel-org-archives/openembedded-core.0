Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1ABC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 09:35:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26010.1742117706080952117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 02:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51700817b0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52G9UNsd016477
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 02:35:05 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d4u40u9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 02:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSjSZwuGe2dA9yV0pXBLqhXIsfwHN7Sf6THAP9vBtxxk+q5ZjFVEaVIDNDsuDEULg+x5yblO0lSW33T6c0Fc2nbkrDxooDYbsWd4bz3sclTI3q3tu76qJ35LefjLkPFpJ/CEA82a1cbbcdAuAbJLEnyCkQ+LNDL9vU+1btQUZjKI15MKBoO3xkRYScvqxOqiGiHMStO4b/BQuW/QtaLOlBlWV1hroaFlzocrSozcMYjHUjhaKpHJQGVO+avCx7SysRjQKFvKuXhw+lmpd3oZXGJbud9GvHwiYACULoNZyN4QzupKBUaNH3feKVHNVXFfFNaH+AJbChACtTu2JVXxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlZH19Qqu7E+cRHQJ/qPhyEaD+txVAoS26w0kYYH6Kg=;
 b=ZPc38cDZmH9GqdvE9JkTnWglgva7C3i+c5zIlFBfbEaB7/goxXDkuBokRx5NOuhjyidwYqKy/ThozhpXgovINo0Yc56WyEt/Lo7hkuvNWsuf/KUtadXPc0MNwAja27batZUmVtEidNcOhufXgO176Aia9GSCMI9S+pCoEI2GmppYFyQ/I7WWvx20edpKeMLi67QDrCGt5WNjukCGVndk15oAZWfQ2Tne9lA18fXfINeD5Kf+bS3Yn7rXAEAsVmz6zJ8fYnvOMA8lkkqIBgOgEkJAi18XC4o8FyOaoqKvDbkpn5QjCUXf4MPpcL3DG7ulOxNy4WhkPn8pre6y28Dxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Sun, 16 Mar 2025 09:35:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.031; Sun, 16 Mar 2025
 09:35:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcap: upgrade 2.74 -> 2.75
Date: Sun, 16 Mar 2025 17:34:46 +0800
Message-Id: <20250316093446.664372-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: a7df720a-bdb4-441c-6709-08dd646dd39f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HZoea4GlPEHsHPOtoyBm0sqZOWv8lgjst7XstmgswS/A98NnZVeuBQipf6NT?=
 =?us-ascii?Q?NBgCXkNUvNdPcVHU/kQuSGJWRf8cFbnC27J5Pcak8RBgsqtL8W+bnV4Gry7H?=
 =?us-ascii?Q?/4YnlTNARCsFjfvEv0lDVI8cqiju5F66+T+k5fwod+mnJvXZ+2GtSOfHUuNQ?=
 =?us-ascii?Q?MLZMrPbuRPiqWo4m53a/qnlP/q0Ky4CjvACcW7lXZ9pxmGg0z//x4zHEhQMf?=
 =?us-ascii?Q?VLYxlJOetQwXXHxV4MINa8w/eLhYzuWB/TWVa91PxPLuwGAUPr36nAw72mEx?=
 =?us-ascii?Q?iHgE9+Jj6hfF8UEX3YTMAWCvqzCtbfDZGuZaqrLDFixuqFRw/5Q3PQDtbWSS?=
 =?us-ascii?Q?zgsTEPHZu0resKceFdYFPRM5vwOJxxobtGVms02WSbjpyfyXpt7bMd1jVmYd?=
 =?us-ascii?Q?68lWjWiQ/qDgjXxwikJxCNAb7wV+7k8dOXNaOaknrysTr2IsQeSwEMGE1r9o?=
 =?us-ascii?Q?8iItuqOIDB5HJtI52SzqCC9XYEPyu1buI0ZdClPfgn/Vi7i24EosPS7ch1gB?=
 =?us-ascii?Q?12IM6W4tNkCOa+odLm2BBCq6cNEzFggpRZgdzyPLiFbjCettzdhCqpSVAdFF?=
 =?us-ascii?Q?A9ar2CEbN2FVILR2ZjgfMblNYotpKtZS6wgfE1rgO5XNLEdweTwFNKa71uw2?=
 =?us-ascii?Q?ClatGvrgoni3qYxjp+bTEh4zzHaFuqoatGDCyA2zCs0/JK/b4j4bef57zyK8?=
 =?us-ascii?Q?Hedq3Kwr4yPRNCsP9SjTslaz3EP6I3K6EEmDp0l2JKAe4OPpBoNsLXePd3v2?=
 =?us-ascii?Q?cqlbO3LUNOLAz6l0bnUkzXtuXP0L+CErEfSt2kMmT0Xj2L2ocDk7ciOhIv10?=
 =?us-ascii?Q?icSPdvSNvny8zfRKN1VDG5WTOURS87NYhapHrPLmAasxecK2WDCS7FRo53fr?=
 =?us-ascii?Q?icZp1bcj+k0XMzbXHVwKVFfwFdkasNR5sUpIL8pU4z7pAmFu8/sDQo3Ra8YR?=
 =?us-ascii?Q?8M1lR5kD96X8nCieAaDGj31h4Yvi+lLwnplpY7xsk4s41zUt0TKnvIID85pH?=
 =?us-ascii?Q?qBWuOprwmlfjP4jo69PnyQlW6q+oBXFtaFkZvErU9v6p58gZMdcaH4VhO3bQ?=
 =?us-ascii?Q?qo0Gdk7xlEoEJjJn5i6IZS+OZByKUuwQXL8pzWa0TZjE1TgOLm1fE71mA1+T?=
 =?us-ascii?Q?DsEWzunVIZokQhz4pzchBo4Puhs3CsywgKKKFxdtKwSbAUdYf78E6YE/gLNo?=
 =?us-ascii?Q?plEX0UR9PwYwlmwiOmVVljnTMbm3TN+GNkBJi9uzwujellt4eT9UUd8/LxKI?=
 =?us-ascii?Q?VblvniR4tyByD9Nq3UNxzTEa8kdRonUoyO3HfIvWRzRyqo2uPEoLF1DxN7oF?=
 =?us-ascii?Q?nA2MCje1vdXegMp4TWfufIiNatPowUNJ8KqGByw5qg7N6mIiE5MwQPmSJggf?=
 =?us-ascii?Q?1y+5rQAdlwp5j0wN/ReLL+SXPOj3lbqwQD8EptmInTIP8AP4Pw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9VSGChXNkQsWwO0/boJI40xHSdA0hlapaE9OTAGv1uTAPbtzk+MoFq3hFUAi?=
 =?us-ascii?Q?ZlVRapXRwScpxNF7SbwwkgJI/ad/2cmmwbZK/3vV0QIilZOw7quMPlRQfxbo?=
 =?us-ascii?Q?4++Uh6oCnUu7KXlo3Q1Fu2MUTQ4nHehRfd475aMJxpo39dWeIlWZWYX9cwFx?=
 =?us-ascii?Q?NOHiZrdY0mhWwonx7baoc4A7iLb868K5VjzlnMQiU7iAkVdwMzLq3rn/WGRa?=
 =?us-ascii?Q?TVBQVz2qhlROcJIXH3ZRHuEwrhu5frnhRE6Ee/SJBDYV/FmR66U3x/PTsAnt?=
 =?us-ascii?Q?4wS4ekYsuAEKn55y5pyvjnbCELET+5GbUy7JTULVsQ6BrnT1GYSzW5Avf+xU?=
 =?us-ascii?Q?7kvEzUh4DF5Heltkvv3OcXcg9E5qkjKAMf/tt/zZjlnL711y+evVYULh4mOZ?=
 =?us-ascii?Q?UH1AfCKC0QF3TPyaG7lrbx8mgXuTeVMWUF2LwkPCDsUIpMzz7Q0TzeJbEnew?=
 =?us-ascii?Q?p3X8RS2uasRT6bRbtz3w1OyS+Wnhg1gaMzhjAr+B+h70cgOQaiZpDu/787VR?=
 =?us-ascii?Q?MlFJ5xwZ1vAZysxQiqD1Kd34XMz/psm1MSyiA5DehTOxRLN/nwja6Bc80pzf?=
 =?us-ascii?Q?1fqj+RUA67rz6M6fXybjKdP0N7/Ym9pS0jckWbGyT52v8mKChTnBBUfWW0Z6?=
 =?us-ascii?Q?cLzB9gbKL8XUKRDqPfi5cXSJQoaa6Bk2/KtfUTLLaAufn6vtcjZRlZLVBUtl?=
 =?us-ascii?Q?0QblYRnoCj9V4aYfOrXCgxoT4873RYdP7gP2ngUb+ptT7u/LL4OwE3cVu8A1?=
 =?us-ascii?Q?NTNtXVrH/RCqQSSQ9QP1uqcZQgw0IrkGS5C+h3kI8yxUkwly0dJdT/O+PhHW?=
 =?us-ascii?Q?XpNTb/nRkFdEIyd1kBAZNAfsFTkIjyFKOPJOQotPNj2K8kCvuy+0g5bA/Waj?=
 =?us-ascii?Q?Q/WPocv1Fo410/xio8ujuwqATfAvbcgY/5nWANvxEhiXLdZYixFi4HTEunAO?=
 =?us-ascii?Q?XafKQZ/B6p3w5s/kHp4yWw9ClpjDA6Qu3hPwcNAH+kVMjlNuoxZiAClfyxv8?=
 =?us-ascii?Q?XB18/eZ3RahLJuDpKy/+HwFYh4M3bXn3SV6uBLcToJvHku4+8m2q0lmj1kN8?=
 =?us-ascii?Q?Pfi2GRWmHaYUhA8o1FIjUBHg5vIRiXMeONUKdTgEP6rdWkKBE+88BELWaw+T?=
 =?us-ascii?Q?zOgCVDoDM970c5TlSay9UelnbRSfhiWExNf8MH/mLrXi6QASzfgDCy/EKBIw?=
 =?us-ascii?Q?IslgfFrer6psqZ52P6TpVKh8dCqO9t0FjRlGiXh9BoNlHXHY9JYA7CR7e9w1?=
 =?us-ascii?Q?h42dqf9GCq/KtXZs8w3xpDoOapkREAVeGiYHE5yUiJ8sWowceermzYjMDSTN?=
 =?us-ascii?Q?y/Nhk43dcSqlZT5VE+C4V7Ly2/7bg6lR8ItH0Wi/JacVYqrSLlxyVCkidTh0?=
 =?us-ascii?Q?ISbe0egeJQ0qd9fiYcZHq+R4qA+KmIikDGc6bKH2FJndUA2bQiLIuaEf0odE?=
 =?us-ascii?Q?I4dMcVH15GD3B26Oj0V0gZh6L/OcKeuIkOgqeLuXZPMNLjezrmdI8sNUoXqO?=
 =?us-ascii?Q?Pca1JYex7UTvcMHi1sz8dK8n/sjvddShNAsiiTTUJ/UA/RH4Jm1QzJGjyF8/?=
 =?us-ascii?Q?sH3V7RC8fqfYt8QqZjTWjG/VI9eLLkpPvg3tqaCp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7df720a-bdb4-441c-6709-08dd646dd39f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2025 09:35:03.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAt3EZ8Y4KHXb4yeinyJvwLV/1ZNP6HYHyoK7gurPc+KUDeu5I33YuFWOyLd4K/JgmTJMWqW0tz0Pb722r7Lnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-ORIG-GUID: 1wJ1y0Hj1_YoSF5PDVxFxxC3ODLj-SXJ
X-Proofpoint-GUID: 1wJ1y0Hj1_YoSF5PDVxFxxC3ODLj-SXJ
X-Authority-Analysis: v=2.4 cv=UIfdHDfy c=1 sm=1 tr=0 ts=67d69b49 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=gFgmyHasAAAA:20 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=2jR8ySj6lI9fbH6vwi4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_03,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=888 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503160067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212997

ChangeLog:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.7xqcoecpcnn8

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libcap/{libcap_2.74.bb => libcap_2.75.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.74.bb => libcap_2.75.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-support/libcap/libcap_2.75.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.74.bb
rename to meta/recipes-support/libcap/libcap_2.75.bb
index 75019fd35f..12ce6cb3de 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.75.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "eb85271f2893188644b6451cec8ce99f4541498f16ff9f84877c2fc872717714"
+SRC_URI[sha256sum] = "de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c445bc04f4742d83632"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


