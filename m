Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887FFC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 07:46:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7950.1743666365443732554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 00:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6188a6bf9a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5335cnZg030893
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 00:46:05 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg1u8dcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 00:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmIaHp4U5/yrKvKjHSUXl4poSXAO/sbHAVP9skGuxIP5/GcQf3Aie3/JoCC4ytK9kroXI7UCCgjS/Gxx/6NunTnnpM+wgcYkX4AAIMaP9CmMwgdqzsItRtMDeXzBzl/11IuDbIvpA/TxRHXpcUkhK9mtpd6Hd4AU85aiEazTS0Lz5ffhxlyqcG+A42GWQeSpPRF1u12VB8dxteEDSOPkm71idwdoiyD1T+FzYwdYE9Xi+hB/aGfl17FGB1QDygdCDEaG5On/FSEVgKxKRrPCCyA7Xv3wmOnTAWQrnkeyAF/HrFyCHWbSNNhPI7nRgfsDdpNd4s3YBrN8D2pjV8iaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eygM04l2sdVIGRHWaegSUqKdTR1fnMWWTNuvcNWgUAw=;
 b=hmU9L766T9IybGktXNQBqZxifCcWWis9bqefcC0+83lt2CnloeDrxQHujhr+7uyFRJ7taAQh7230/Kfr76w/weFOhXk+reBwHm52YNXMiHbIOibar93ilzm76TfnB5y/XuIE3+C0uK2tQIgu2zGv1W949NohGvmux1S3tezQCcK7B7zJFprW2C4D4SRmmAfPPKl8azQoer23MWj2J435soZfcEZcxz0fRX2j0DjMdWfhLFXYSTmltHaxws3fCr32WNsrXj2cld2PnWCWdL6hmfPm/FnB2vYpRRNvFx7wSss7FFDa33oR+/iAmG1VTbI3sxxllXd5x0MxzrUc+jnI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 07:46:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:46:02 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so that INHERIT can use it
Date: Thu,  3 Apr 2025 00:45:52 -0700
Message-ID: <20250403074552.971291-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fc0d19-9702-40eb-148a-08dd728394f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f/elwQIQKHu9iMgNBeoFYJ8IdsWFFRtqzIurCTBt0+dBb+cJ+Pv4B19fz12r?=
 =?us-ascii?Q?5aq6/kv0dd51osVYJGhPy1eM+5AbAfJ9WKjf8vdFxU/tfgBou/7j0jelJcFx?=
 =?us-ascii?Q?OAA9nKke6LstmvabLKqcqx0b+PpV+5UJ7Lqq5xuilAH5rYEnM1wgk2g1yhnJ?=
 =?us-ascii?Q?2iXmGHivmQ4wWVq4pWf6It4wgiX4HE0zw3/GllNAO6YiYRXwhXRmAYPihLVG?=
 =?us-ascii?Q?ipFViOraY4v/yWXolcmj7SrW/LQspi9Hno2j2IkYgPTQoVmHV+MesJjBnn7Y?=
 =?us-ascii?Q?76nVedGuCosHYiHyx9+4AI1MIKRjqBT0t2eFgBmpFI+Iwu6Ogr316JOhdgbM?=
 =?us-ascii?Q?xiqDfeQ+9zDJYRAOEhBA9saoXgtvbiF5cm9jSWo2+p6A3tb+xK7fUcFh/ZQc?=
 =?us-ascii?Q?r0w3Q2reATAiRA0AZygh9vqOJqieC4x3+GXvxeHbIkg534e4epV5zI53FdEF?=
 =?us-ascii?Q?zdiTsJiJUZEMBsNX9RJZPPGcxDY+I3neaezXzUzUeeXd8ZqqmLSkTs2yBapi?=
 =?us-ascii?Q?8JJaAIXO7PGKa/F6W5j6iA+qVgjWXRRXCCxF+vMO6ubANnUaDbLwD8tXVoHo?=
 =?us-ascii?Q?8a0l3uBFvxJcXcEILkclYkSfPn8kXCLuWYGpPhQEH0whqHKlM7jkKjuvshNp?=
 =?us-ascii?Q?f4CgEjgALia3wsLAnsmw2VRbYQBAsRiu1TT6iwVkKjkSk/GaNRoZzH7Y1E7F?=
 =?us-ascii?Q?8H1e+rwEFP4k0b3inCUWSDyFkiLFfbmtfb5N6BqjOOD+1mMXOK+Rg7eZNSTF?=
 =?us-ascii?Q?h/Ztk1Z6FARvHYXuuC2WoOPlZmtzKEBStsKJJSzLu5GrWzCzGZ342lLge4DF?=
 =?us-ascii?Q?VO6aQVeL1N09w6R2wSQmGwPnzl8ro9XRv0B8SmcQfE6sr/neMhEneSPYZerA?=
 =?us-ascii?Q?8FuKP7KXBilHiruAm4c6FqBzA1mDAJarznK6bXAQUzi/Cv4UU1R+ZdLmXiFR?=
 =?us-ascii?Q?aEAOsSZKC5qGaB/Bf0nzGR1DVVG/HVZwF9Bf6Ro/jIVOfH1oqkzmcyEre0jF?=
 =?us-ascii?Q?CcobUUOGq21EcHzdnqmNZhfJkgVb6KWZZ4AgagQ864oUZoBIgacz73Di7I4b?=
 =?us-ascii?Q?Vk4npv44K+XYcNPQvZEoYpgRPH3sD2azNjrnEmxt1sdyyOkMAtPiv72z+LxR?=
 =?us-ascii?Q?wk9uFUonPAAn/ycXwTgswzBD03TCRGuFkIbjwp5SDcQoEebLBouKgkYM46iH?=
 =?us-ascii?Q?prnaaEJlbiVq+A0LgKtYVGzRrkihi9QbUIYgvN9F8bVWf/CIbmM2sBqag2KR?=
 =?us-ascii?Q?lxOx8PJ9TjX0TirGDO0TosYawSELk7IuMr5WFg1B8H6Hj7hVHD3gLjRzJyTd?=
 =?us-ascii?Q?G9ACa21g4L7Ct2N+TBgViwPFZEYu3IRB74fXuWS1lk03OMplu7GzWm+8JeOp?=
 =?us-ascii?Q?nRUBX/ytxe3xyyICVqeFnfUMIzNdYeyydyaLHxUizyN5YYgC8IxryTw352+O?=
 =?us-ascii?Q?OobP1WV8NtI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qnLl++Wju7p0zXSU4kEMO+ECCQOMJAhQUW0HJahClfVERCMoA4W6074mWu0n?=
 =?us-ascii?Q?k7km0jyjMkPMGqg8OwZwZNDRPCCtGywzKy19dB/zS7eWXf94I8UfbZTfwMxR?=
 =?us-ascii?Q?hyk4DVMjCL85l6uLbwSQYyExwdFEh9KZx1mZMLNy+OI4fBUAcPAfZ+lLAv7l?=
 =?us-ascii?Q?RmNGPJ7N5632yV0Qhk+kKvYe1oLqZItvf3Gfl1AWlJzTAY0guJnR9AchuOD1?=
 =?us-ascii?Q?TP4o05/bHiPIMJ56/kv0u/ylyUoVNYbB+5No6T2Mb5gfSZCuBjM/9cb8U1zL?=
 =?us-ascii?Q?Ou2dN1xp7E2tocYhVR078IxNJOiDWhe8sKoxSR0NIUbnl24GJARyY3WnKXsn?=
 =?us-ascii?Q?6C9AFPsXlqP0Rg3zGiNAclf6wGfNYljGRk5WUbPBQmQ2apPYvdY9l3QHfT8v?=
 =?us-ascii?Q?lAFZXogBBqQuIWfNB0cWzS/3xjyqD53YImMiUcZlv8+REcq1xtcegJReyw37?=
 =?us-ascii?Q?cvmPM2tc2IAtQVrdkeArTpJwCTUCnbaYSvRDWu5GP9jUiswPnXR/n/vFMX4e?=
 =?us-ascii?Q?1oiPxJWhpQvKGLfLW2AQtJ9t4irRnGe5AwbGhDHsfJPIUeimUzHjWQGb9GML?=
 =?us-ascii?Q?yrDr1vKBjNIJGJXQ+mCu/KXcoVT5j/MJXugETDse2s3XWBQovZVb0U+yeVBo?=
 =?us-ascii?Q?c1wEHtt1Ica8JBRGKkkcxyRm8n2LQKEyz1n+P5v4FVjqzBrZKnwDE7NoT7/V?=
 =?us-ascii?Q?dSvolDfNBmaK1hHN9ov6vryZbf5zJuwxphmSWTFGP5cK8rTRrAiZs1CJfw2M?=
 =?us-ascii?Q?3Jv4SPQIQrTMYggosesZH5wprW1Zfa+VRxX4hyySl/fFlC9eb4eiJUdImlRh?=
 =?us-ascii?Q?r54kJgK5Wkm6Th7Ez6j4G0bV1qkXbdUA4KqHqh7rjVAyeEb2JgDDO7Vd7LVA?=
 =?us-ascii?Q?zt4Z55lgn/5+XHjcirzksgYhWxo6BHOJFyd3cz/ZnPwxI9RWBCtFwOxicfUh?=
 =?us-ascii?Q?n7FLx8bXiVSBFECeOgw6XV9EVCS+oFSa0obs6E7Fh0WfCEw6JbD3uLodiGug?=
 =?us-ascii?Q?I9CrEYUnl5shAiL4SXK5lmBcfUc3T7rb0dPSBoLv3l5tkk5hnxKeT5cZLYAI?=
 =?us-ascii?Q?xK9QuYmOl3voPGLXgfAnPCbL4GMZeAIQwUfwKF6mFqfwT0+sBmG1J4YEE59r?=
 =?us-ascii?Q?lGeVEYH65n5TM68o0OYJGvIThmQd+b1kgVRNhBSOSCOBSVIDxJl/YT5AkL93?=
 =?us-ascii?Q?JhZWA/ULIry2z+moneireVlXg822lrRHvd9ynZ9Mg7373bedwxDmsoulwdvr?=
 =?us-ascii?Q?/ZftMdBUCkh7kfrgfPpr8fRcWcB/A+QQw/ZRfahfBuvhehNjp7j9lh/Bue35?=
 =?us-ascii?Q?mPsRpVi4PJhaE9aZoxfzOemsdubN6EEIx//Joe7l8/d1aRtLNt70BJ7E0MIA?=
 =?us-ascii?Q?tFloWwXdHNhHdkjCkl/gdMKRfMdBWBVnnQDfgH5t0BTzVxiCp2iSgbLyV0Ar?=
 =?us-ascii?Q?uVX2judg/9/2QHv1nW79+GDqEhoQ5CoJnHP3oQFszwd55CxLMLpVTiCSzqYx?=
 =?us-ascii?Q?IrGavjHA/7beamBcdp8dj2uKRmXPGuyuVo1lrwZywKaL0E2814XliZDX4Egl?=
 =?us-ascii?Q?D+K0qfz0alkOoKpVwHmNDt9bxP/vR0UuuDYI8W+PXoV4iPrXmZaZfT1cWn6s?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fc0d19-9702-40eb-148a-08dd728394f3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:46:02.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH2oFQre0lnk5YyCc0to5BE8pP/rr85iel2mL/UK4z9IiXGSUXibCun7/+pBMOrJjAq3lRueLfFvetyrBcBkew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Proofpoint-ORIG-GUID: ZGMs9-u8jgzLx-6J7oyixoNKcmaHp9rH
X-Authority-Analysis: v=2.4 cv=Aqnu3P9P c=1 sm=1 tr=0 ts=67ee3cbc cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=w_HbZ-kElbsavAsC:21 a=xqWC_Br6kY4A:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=XjAHXkB_dK8rIloqBAwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZGMs9-u8jgzLx-6J7oyixoNKcmaHp9rH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=693 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 07:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214304

From: Chen Qi <Qi.Chen@windriver.com>

The functions in this bbclass is useful. Move it to classes/ directory
so that it could both inherited by individual recipes and via INHERIT.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/{classes-recipe => classes}/qemu.bbclass | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes-recipe => classes}/qemu.bbclass (100%)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes/qemu.bbclass
similarity index 100%
rename from meta/classes-recipe/qemu.bbclass
rename to meta/classes/qemu.bbclass
-- 
2.49.0


