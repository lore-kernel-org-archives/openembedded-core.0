Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A75CF8875
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36874.1763652426552868461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MtRA1+p3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK6eq7G243882
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	MtRA1+p3xAnekI/TPtbnplSUfx6cgiorcPK99TSktHp/yBhlVPIwGJJohQ9kLUGR
	NJouCQ4QvpMVJl399k0UaA6HBPRDbLwvZJEgHSPsfxjgwI6OiU+q+KeM4VRwgkmB
	/MMqdVH68xJy5cSLgWBcq2stRbgXEurCuJK/zHFwYtinM+oAR/YFZULMDrcUAPeI
	5+Fp09mnzBUw50GXQ1/u9wP6GEDBn1yzqsXHKW3nbFrKFkzVe5Rnq8mZDRwG9AuU
	UoK0PSmBnBwoLxIEB4Yqqy+/YK+SqYNT8YtvD0H4o+8H9AC1SC4ZC0Zp5jkge97S
	V/x3c6ZcLy5aNu7PrIKP7g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2xge6-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC3gsXR1c9//oToUg1M5a5BgNybllFd7FzR6fJk9LZJ5P5ORh6gvn9kt/5PjUouXPRfm66sg7oJnMfGBZV2YBlc8s5N69psktP5FEeCFNcFp2Ez7UYiuyiiYcK945upI2NleegTo6qGNyjlCdd0JKdiINDldCpNcsRt15N0x5R+39ef40uDN8X7n2mePkJsdF35geNs9UXUkzYXJ3gHtOruLXxA2lodGWSPXe0N9iCjpHWJTYDQ7kIMOyNEZCOvpCkGU7AtIG6KkhOnpu2ciV+KjrVEBIXcNLnBzjWLFnlqhPeFUkEBsr51FS2AlM16ddTwWQShieILGcDoj0v010g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=NspbvAZd8p4ukBCif6sbEv5xaqLc7gdTs5SDkK37N98uRBulWs3zCPLb1z80FRneMyrHnT2l4nPQ2lIiEUEtLh0nlayGkQzm1fZbS4rlAmaCXeaV9J5Vnt9BpRJHUtxLFDVMFQ7mdrhSIGfeVnVAjppLSAeRT7sEPwRtE8SpIQrn77KaDuFzhUbdz8kZnZT/jlZtK89KGFn0HgDJjVfuEE96ck+Xbt/rs4zNYTVCSXkjZpeC71MQooNpUCFLWX3ZfvlhSm4jcbovPkQTV4/+YH2uTJ5rq6qSGP9bAyqouV6VCtfe+p2aB3KZ0eAhq5Nn9RrftD8pqiRRlxQiGwwMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:04 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 02/11] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Thu, 20 Nov 2025 07:26:40 -0800
Message-ID: <20251120152649.1128685-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 496b64db-0dae-4d5f-f1ef-08de28494218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sjVAlpR0Hn7JHEs7G1Wxf4YYS0VCIa988Q05IFPZdCmvEcep0inXhdDoBUwB?=
 =?us-ascii?Q?jpNPbCILGKv1E/1y61Cav/hmFZAk1BuzirTgsoLBFQWOxDkW7clj4w7QsA6+?=
 =?us-ascii?Q?yvserVCH+bKvAOsys96VLx5lLUXADiE9BgRcpyCgVtCVgK3RRPQFk2Ss171k?=
 =?us-ascii?Q?8z370MLp8+Lyk83Mr4UusIy+hPSCNXWLrREfgtHe7LB6SQcCQHWo4ieQxej5?=
 =?us-ascii?Q?/GYhaiCMruWrDqoCSlghC0TY3h7wH/Y/2mO5FGjX1Z8zvBVJEN+4EUOJn4eu?=
 =?us-ascii?Q?ryX3pI7XCYN6It3EMcGBLU8hjQjtrZ28BQFRuOFNP/2jcb5ELlbCznCkYutC?=
 =?us-ascii?Q?cIccbcysGBjHsfEmZGKPBGvb4Pr6AmmRQ9/YiqARd93uaG4pQS67TlGqcP++?=
 =?us-ascii?Q?3SJIPKnWj86ugX6tHx7DkIoULB83rpS7UW1UVEh6kdEzOcPsx/+TJijImgyQ?=
 =?us-ascii?Q?xvcnkmXtonDJvsaqn2LH8gf9iZ2HvsRsPrCrEG2CRJkJI1nRHGdXJ4e3B5fO?=
 =?us-ascii?Q?XVgJH2fRcgjjEB9eTvFzqIUF319LCe5lwmcTvn0slRXr0VU4Z0YNXmmq9tHK?=
 =?us-ascii?Q?m2Zz8mvYBpLUOP1dSitSiAUFtw86OAol+q7nKp30Dq5LC6jmDZyKZw6XeXrC?=
 =?us-ascii?Q?3V9Vo33c8S467JpRaL5Hdcj91gbwUJIGcjYzXt0xJCGBC9zBOX4rnzjqqpkd?=
 =?us-ascii?Q?lx7SNIlYDE1jF2Jc9XvMMYqyp8myotB4VXsmrX/2Easm/3ENGwJaF3udCqLh?=
 =?us-ascii?Q?uWpYJyj1h/1L8OsGWybAmcsjkPW3U+bfvrmV2NlhVOWhvZQUpVoGFNO1TXIi?=
 =?us-ascii?Q?mYdME+5BinXKFPZo0c7FxhdcsgTT7YDtSUK8d6XZ2lZCJxiwg8cPjhn55Wi7?=
 =?us-ascii?Q?W1dX92IrVyPTFwCL4DtXNAmi1L20rhOoRUnM6MPRVjAv90KFRRosE2wjN3Ly?=
 =?us-ascii?Q?u9UN7H6qTpqqeg32e76ptUkXHRUG4ln/s8mUmo04xVVecCtbMifURQVLn37g?=
 =?us-ascii?Q?ZOUu/K32L19X5UePjojNlmioP8J6xanDZFDods+D0QvZx796myPojEXaGuqm?=
 =?us-ascii?Q?NqNIQiFfYXqsCec4qKI5q7d7f30TQMUPtNhBwxj3gzcQCYOuE/hCElpdJ56o?=
 =?us-ascii?Q?kddRQdPilqJYcyO0tAHofSRgSrsztxcp1Au8MVAlDQXzGhOxyhfsadxw0NF9?=
 =?us-ascii?Q?YNcoCljsCpKkEWwtKY9YgbyQ6Waq+Kx3z5uq4F6YoptIAX19IX103CgO75oD?=
 =?us-ascii?Q?rVX72w40NzQoKy88PMXagM63MOzKwlpyr3DzAUA0w+5rDsdHEgBm00pzNaV+?=
 =?us-ascii?Q?0RkfSvMjYCf3q9Dt6TU1CliO/CqlGQqEcso6rJTSKgmUPFSD7yUPysci87X7?=
 =?us-ascii?Q?YqWXEJCFSP2fv9TmaHTQ7I0U/KL4Q/ct9OsHpmbPNudIdK4I+uNGpyqUK5+6?=
 =?us-ascii?Q?amEKKwTWt7FQSvvw/0qQCXStYHgunfmY9Rp77lnbtonmYRZBZLiwbR3ohpsV?=
 =?us-ascii?Q?777lQd1OHED5AUjd2g0UIA+L5qH95MLsRPPK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W8rlcFMd8qZIi4+hrlENRW8E0cl7lPb6kPYIF1HnwGjE/lPJFkbyIyKfBCNp?=
 =?us-ascii?Q?V9J/n4DPAaikwipEG5QQGXmhX9AMOMdCUbELp0nVEpUldSPakYkM7ppXyXwh?=
 =?us-ascii?Q?MedumrrBlseyazlWHX+zTCpdQY21bqnn1Sb3ziCVy5MRJEVh2c7cgN7rpnM4?=
 =?us-ascii?Q?ZLpX/rX+tTa2M2CL3uFBwUHhRbiM/8vdS8ZsUtokGnGwUxOwz6geTekoCmya?=
 =?us-ascii?Q?KClRAP+Ngl89DI2pq+dfyp/s9i0mn2wlizGeOe8PGKtmBqTPnFnJsMl4NVwf?=
 =?us-ascii?Q?YY5xuZW1Y9t6DDxqhrQXoVc2YLWjrmAl8Xvujv4/ig6YQlQF7kbLz0PVSW5H?=
 =?us-ascii?Q?k0cnqfnDWOf2S5Denpye/PQ6a9gJE1lIvHp2NJYfOLjkf2pzCuhMsU7oO3uy?=
 =?us-ascii?Q?XhavGlGoE6dOHLP+0m9AZAGPhs6QhVJXFiBRnUYJ2394RQKdkIgieAMlYoel?=
 =?us-ascii?Q?nYmRnlu0n+MuVGnn2ixDviG5Rh2+gAux4g0EcBcvSF2TRrpLRlnKUaF7cS/H?=
 =?us-ascii?Q?x6isrVqVvcfNeqfRGUK5mlJsDJD9QCYYXDRqNWzqhc1RthNMEPJIiDmHDDWH?=
 =?us-ascii?Q?gsCxbnpjmQtDUrMG8z7R3g6GxcPNn9/nZ4dOhShmJta1386RIbUTKjykwolX?=
 =?us-ascii?Q?3oCBnwq5SrNcSyIjIBrMGCBi93alq++sgG+pc0PLleurjmuelKUbsvOJmjTc?=
 =?us-ascii?Q?a5S+Epzd86cJBXjabwXAUDB2hqu/NwEiIsS0ukvVw06qhJl4ax9pTxjA9nXW?=
 =?us-ascii?Q?g/GZQ3o9dqvla/s8uLuoq+keDiCcwYJU9Du+Te+eIydUX3IfMTlSs7w/igHJ?=
 =?us-ascii?Q?vygAzKNySKKRBuYgzXxPe6TVfiFAjf5fIHX93mlRttR8zbuDduM/KN213fHz?=
 =?us-ascii?Q?HE0Nab9Ak9kTVJl6RLGR5O5Vcn57rgeXnQA4HqtcThk235T/mF5uyVgcb4/D?=
 =?us-ascii?Q?JhPbHpt6B/7i8PRsrzkmZn8iiNd7GjTLuuEAdrkSaygF29qvcCQQP4PeIOkU?=
 =?us-ascii?Q?rw61MA/58N6muM5xz+1Kyq8odMmmGWDEHQ6UFeEVmKEd8wBfIPi9y4y/W5lt?=
 =?us-ascii?Q?DH/h1Tu4ETWCGm9v/BQz5lb7lxve5m9qtb0Cxrj/eKiTY4HVJ/lK3XgEd2HZ?=
 =?us-ascii?Q?P9W2zpvRlfRGZo6ktCSlfkm7cNN373TtzqFH5gG9BHeozaUdlqhm7yKoipDw?=
 =?us-ascii?Q?1WgCNwvdNX9ArSAuAgsOJnPl7Zpv+dKTdMPL6SLal3UaiWI4IZPER7QjD+ID?=
 =?us-ascii?Q?9m96dG+6Zd6w6GkDXzSaqNPVL5iLkL2RT34Gy1w8QfoCg2M/WJGQjTAV0N8x?=
 =?us-ascii?Q?vXQxz0ngkkuGWHpkgwSRi92vSmwLIkR9NDob4RF88FbNBiaYz/EXDo1RscLi?=
 =?us-ascii?Q?8v/nXA0cLN6qWCk/+2cQtGQyIe8AN029tcI2dAaHQFDeO1W2leOzK7ccM6HO?=
 =?us-ascii?Q?ieNYGnDmhcA6UB0MOsZ3m13DyK/UIpU9I+jYWUlwZSRYqejLS4sOuxnSBWTp?=
 =?us-ascii?Q?ya8wJ+qS4pb7sXduByhQPyp8VKX7JXLSobWoBAZMahiZCZCwVzpsCt+B8p91?=
 =?us-ascii?Q?NxwKmao/IVhbLnvktUU7ETYq+uas73Qbb1HR38SENnHQuKS9HAi2u6Y9ygQR?=
 =?us-ascii?Q?TPgPRAuhd8BWIJITFe9k+9w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496b64db-0dae-4d5f-f1ef-08de28494218
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:04.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9i/+X9OYwYHkwQStyUXjAy8RnA5R91dSrqjohp80J4UMRar1AZxBJMr0doqlQp6rk8v7DX+Gd0Nif0UIcKzKpHMri2HLsjzlppAyiceH63o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfXwFCSe3JppEOh
 A0AFEgcMRRMKr76GLbbhgGEmJsI2ghFrs6j9SkPRhn/UyWRi0K3XQOj0zVYH6u9PJi8ddd/YQVq
 PWGeT/3hwP93LqsZsBHvRJnehW12HZz6hvBAKqE0s2mP3UiU8AT6ozCsYyl4vxqtyPGm2zrA/qO
 1vIG8kohRG1FsKk9ycb6h0VhQe5SMRSH7rfhouxByEGTdLRdjztTrZbt+7P4YndMU2Q3QIobpjv
 8h97eKUkOR8C/fuHzVG4f90x8QU6Ny1/62Stlme1d2FrjN6KE464+LdN5h86+QOswYZPAPYoBQj
 x5gSK9VYq1DoKkzmmRagTGc5quBBCEWc5mN8O8lT6Jfx+FFZbecZRVM09a31pHZ83YwcTYYupgD
 4mQCBzj5yKJnHF/IaE7y8g7Brs48CA==
X-Proofpoint-ORIG-GUID: Zf80FF-j1YuXaxu_os-2XsRMKVsZYval
X-Proofpoint-GUID: pTlE9QMxvy0mhb2-CLjfW7YfgjNzes8P
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691f334a cx=c_pps
 a=N6jWaT6qAb3kxWP2Z7atcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226625

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when rust-kernel distro feature is enabled to support Rust-based kernel modules or
features that require generating Rust FFI bindings using bindgen during the kernel
build process.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


