Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E90CA0EE6
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 03:25:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.941.1755746709226664326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 20:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rnFwPFJD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328fb377e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L3P2UT2862458
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=H4VcXyKOQ
	mfYP4phzBr8zarweZq4LhIeLo0wEBsmCjQ=; b=rnFwPFJDIitNKusf/K0j1W6Pv
	WktxIW5Qi3LbgcNPorrFMBeylz2JQAfyURHeyxG1qMkniM6+O1OqTdeEiv+a7DNt
	eGJJHZUNl1f1qdOOcVm+LPOONHYx7U4o3nWhlxacKFHSKSFaDHn9jqMeUcuShuc3
	IlrnrMWuYWMB07H1m8o+eZ1lhphFBTdMKJ+e0z5q30gZkL3aGN7D31B6IjroxBAU
	Xa1yuihfFf+nBKmWGwLbg/nNq6uWwpxogjwacS82cjA5AFJIyuN/EKbP5p0aRQUw
	UmqL7Z9O4mNYIn0yxBwMl1TzNGw+hxdXVBlBDC9N1iN0+1PRk5qQLgctXL8LA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydmhp2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoDI1WjkS07Fl9U8dYEbfhsPIIBNSf0SVRhaj0KfYPGt6I+F9563lO0QHkhdrj6JR7IHbuyen1zZ0C3VwYc5NDrzW68/iEOePZ7Z7Td/ORHRkLpKD5xS+5O1Gixb9oKoou1PCLvtbM8RTdgyVl0LUTIXau1cDDwGcY5372dQfZZOAAdNP8vttxUP9vGxZRy5SB/3tM+nCuCXeA+d0Z3uznp2Fxf73CSZdBgmLMf/lunRngvjzYGZ5CQzxkeHxUWLUkUzJgl18837oV3t4oyl4Y3ZJ116nGk3WjOJM1awRrnofYJZr9TTrV35snldaIG4EO9vhnpogpziD2u4iy/33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4VcXyKOQmfYP4phzBr8zarweZq4LhIeLo0wEBsmCjQ=;
 b=qi3Qn5lGKL4t7n8fCUKRDO33oUP5cZOG36lpJsnHAq6rYKbK+JKe6syatqyPAjQywxpP19AHzZFcxgQaE2kN47UovO0EJIdX95HrvVDDUN3EhfXME7ITij+bRWv3aD5Z56I2UoCSw0ZNxgNIuk0pGSqZyvt/SKiwwd08Z6xDtSGSlgKuYSlOYCr8YJIyRnVjdIleIwpQB5BgisSIpkbx260pcQglxUYDKX4MeZyiVds2CVy6HTGOCuudEn0wNGAGpFOJk8oVQW2XhDdS/q5b2N6whq5CA4FudVA90bpG843pgTa9MLrmDrNBBxeg4+u2ST4uRbR/b9jXfbEFoMejWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 03:25:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 03:25:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/3] gcc: Oe-selftest failure analysis - fix for pr90579.c test failures
Date: Wed, 20 Aug 2025 20:24:22 -0700
Message-ID: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: eb77e2d8-b8eb-4d57-919e-08dde06252fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N3MWhlPSMDPh1Z7n2sTYC2QhaFmsQQOl6RAAPG/PuFaLusGaUh4AzPpFWUXX?=
 =?us-ascii?Q?2cdAUTm9C7udmjbDRqTOFrx5cDsyeuVrcqS5Ph99KT71h3HV0Z+fX0+WNfKP?=
 =?us-ascii?Q?1SA/nT0xW+U5jk+Ul1HZ3HoWxfgE2lKHouP/cVQOvjl/OhRiXqm+drb+Uy9u?=
 =?us-ascii?Q?zAWJ6vSAyVxcbVCCrochdbPbrKKC7EPtLbQwKhh3sl5WyjkmIxPHILycgkJC?=
 =?us-ascii?Q?TeK54JBwELbbZVNJrk5eT8yr8/VqjQoNdfIszoP9HXNWlwxywTnRBLjZgmR1?=
 =?us-ascii?Q?pTK7GKq/cAZcAbAIRiUoeVIGGdQjBwsyqQG0pFPHVP7M5f0uRsuTUkpCGRa6?=
 =?us-ascii?Q?8LDLCgc0RcJYKuo5DyIrAbXU3CCJdC0U2pCiiiDjBp8RV1+u9zqKsTq8d68B?=
 =?us-ascii?Q?uv1MomKeiHVgOEqFq7EjGssQ0bByKn7g2ymumNj348zH6c6OZeT7wHL0NCNW?=
 =?us-ascii?Q?t1eMvrOki+DiXvACMcv9YGRNi0Rl2A1ZXDXg/BXswIFGtV/q1sBcTc0kP3ib?=
 =?us-ascii?Q?D3giDmXVn33Dz9oVZYEEBVYtMjVLOq7UbKkIwlfklUBwvbioqqPjQG4p8Ijr?=
 =?us-ascii?Q?yEOhqwIs0oq5pgmfNpcsyvjk7JmmQYMFgd58S6B75gJA1OrGEiQVE/hLcnwP?=
 =?us-ascii?Q?Z71UZ2dxSs/0QEErCshj8/dAIgL9VRSnTAwUUAxj7YjqzANwDmK9fajArHCi?=
 =?us-ascii?Q?nMYAzJnfWxjoxwQVItX0oIirosCFEl4es+LGKk99+wN3KfMXeAYOc9qappfQ?=
 =?us-ascii?Q?6oz0Iv5Yg3JZm+FqYWcXpilCcgghokaV3DQ7pAcLAY2p3990rccBYGcd75i3?=
 =?us-ascii?Q?T7HnoOLCWdG6/AoqZVYvhs482Le7T47FNCVjo2tll7bFPDKrYU08D/7I4nL4?=
 =?us-ascii?Q?zxifohF0KfvMduHOdsby+qcrwa2wQ6sj0rMzyz3esAueCo68MreZhDpnVff/?=
 =?us-ascii?Q?fd29VloT7v1xFyKE6CMlb6Ec6yX85MD8/XssRVmFL4cvpTgLgqJjwaqTMEHM?=
 =?us-ascii?Q?O1pkP2qgmm8a8hIVI6Rae8NTjBlDuJDlQB1zAFxHOweCyxvA/ZW4+dcwZkck?=
 =?us-ascii?Q?/dDuVNg971iADCsn2yV1YOwxu5nL3XdkAmarOxacbiePSJPAP2PtcrKd0uU1?=
 =?us-ascii?Q?5yAs/uwyITcrCA11KqTW2UliAMOF40dSV3l1dAnRIr3lBcI5MGLOQ+O8Wd1N?=
 =?us-ascii?Q?8SHqCIKp3lWx88QODU4H4Ha7MpEBh6DvdD+kiPraJEWNN6E8+S/Lbj6ja5pX?=
 =?us-ascii?Q?f12dj/q5D2+EBmBlbNvE5I8ubINtQg01LCwKgjH9pUQ6v93VFHZ1P3BcNEjx?=
 =?us-ascii?Q?k12XNtoMNqeZ1G6BUlKUufq+8MZSaIXllnwNQZ3TeeovXBn1yPPbftiOrQ4s?=
 =?us-ascii?Q?bkHKn4iXp2X6TDehV3SijmP1+TkEiRqBUPpeir68GWZNShc4kG/lLHQAknqX?=
 =?us-ascii?Q?rm2cn+RNsgMNH6hqaHcmA5ape2eXqW45?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HxuvVksbw9Ci42Jc/B30HGDam/tMzbu7u6c8sy8N6c5sT5uSeVZdp5OkSxH9?=
 =?us-ascii?Q?MD40IwF8neObs1oG2W2+UnYKftBM8diL+rMfCYZ7SAzAWML9ECok6FmsH4lt?=
 =?us-ascii?Q?ki0kL29lcmXzlcHqIvDyrTC2/M0PwoHwsT1cgtdzcD4pmK5IbB3Vie7XSj8w?=
 =?us-ascii?Q?PKRk33zMlLqiObY9xbsmGbyQa0ylrkmjgZcn9RS/4g21UFxVz5C31+Nxj+oM?=
 =?us-ascii?Q?dsvaJnE1Vu+P1X741+KKBbagyELLd8PeGFZvwoXQoNSBofhtxud5eflgXKg8?=
 =?us-ascii?Q?1HQucHVJCgFXN7rjd2yZbCWAXDLsmbGq4eEc6QeWfw2zKUV18XMCTcdAU4UB?=
 =?us-ascii?Q?bU49fqS3ND8LwuDXSXfwjzlHup2lmJQiT3WZhOX1XSReT/orv9qFPc4F6yxn?=
 =?us-ascii?Q?tsVt9eSDY5PLe84LlmjwlyxkWUEnQH9JCQmjUrLlAF5ILvJNZdrK5tAT75R6?=
 =?us-ascii?Q?uxcp9QGKfB5ZwmS0dpXYwr2KbL6sA9kmry+DXX/s6nhCfIBlYZmbwQXJjob7?=
 =?us-ascii?Q?JarjKwKYdLhfy+Oj1rRDcZnlX3gpIr58PyPjce+Q/UlLSul7qQ4pqYBDtq6G?=
 =?us-ascii?Q?FY6tkURsZ2sHTpEUF5jgd/QT3dk4FzFqUbAiUri72oTa5oogoEgwVHh0bobf?=
 =?us-ascii?Q?toqOmNvRKx2GLvWfSE3WYzE/ijUVrPdI09WCGhlPCA8XOT/dpVlogUESIoJU?=
 =?us-ascii?Q?LJeBchdehwU57Quk1f0ccgvDNZzIDnReUPMOhejnqwuXzZtyqVpkNM9aC3CK?=
 =?us-ascii?Q?x/d61HkvL9xQuVfcREZk2guX+71fNCRwVOdzTKqL/yjFhj8EVnD7C9zQ9wUg?=
 =?us-ascii?Q?Ub4c79lSQy2h/gN4X2cm9LDB5ZfagQIk/izM24pRWtZWUWgAka/cmcrYwrhE?=
 =?us-ascii?Q?mkl8C9tgbUAhjJHkBgQbLeHcHFJDA33MYuyWbU5gAyScynzd85a/AaTKvjzm?=
 =?us-ascii?Q?4Pq6ftCypeCCLXsCn1i3nEp2SRCuPxS+NxSdZdt43lwYt+T9iTgCsKKXTjGi?=
 =?us-ascii?Q?dvCFtoT4Jbec3XHc73ejHdzLTU4BBb2oOKc3ce1WuGrWjw/V9V3y1iFuf8X0?=
 =?us-ascii?Q?tfgPQovf0DUzsQICst8OSo4bzl1piXOmYqigsY10voG8BnoFufNdt1S6eBhY?=
 =?us-ascii?Q?igAwNV6IgtBKDnSpHyfFPwn2ydf3nAYUNbyKjlir+SBIfehpEbApqjuoLDhw?=
 =?us-ascii?Q?wj3OMruJMbJuRCHQ+gqEeRj1X03E9KVYhEBFcyVdts3MDxP5yEDfaWJsay5c?=
 =?us-ascii?Q?d85P1joUHiQNB4MF9iAjDo0Nez/RY9+pSkwplWRLkLw7Xbxymb11nOCJd5Gn?=
 =?us-ascii?Q?szRXBw9fzzJIX4jIrax0utbyaxy7gML+gwNVCA2DBjC97oaBWyqRp8/gfzL9?=
 =?us-ascii?Q?XPH2vgpM7/bPHk3o2FCqSuoFnRwO6x36C1PC8E526tFaAPWWCHWgSh1C4Gkl?=
 =?us-ascii?Q?E3uLxLhKPdfIEpcos5rUaM7dvE0Ex4BCFcbw4UQ0wcmmrVRxsSnnrD/0Nkzm?=
 =?us-ascii?Q?dIEtQynhVoKrDVCjIoha9918zvskn3LmcRCdP9j3V3MtfWUWE7Difob9xtl5?=
 =?us-ascii?Q?4PJ9DJuafsBfb3MMuqMZ54EnAt2krRv4A6o5pGvFnDhU1G1WPSa55RTL0TNK?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb77e2d8-b8eb-4d57-919e-08dde06252fe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 03:25:06.1081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke1f9II4H6GadrbTI+YBBtBvGvCvGiCDVOZvIqaLqsaA9poO2P3LcEpLWNhfEQAHCr3SruEb5GLsgJkukORaXNTtSbtdMp65IlhH8VAmUfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDAyNSBTYWx0ZWRfX5agyFiRTw5Ln
 MrvU2AEr1nwyhGIoLeOi6d8x3e9vkEEo577dW3yPVoOil1SqpSKcXhWxxX3QLFpgmanTJ8hGjyA
 dqXRw7no+o7fxY1u5YtP/MWYXSzvwBKt9oGHB0C0UolsNCJn1tIo/uT35c7EYnVNiu3xVtk4UlX
 72EzDqr1/p5iZ5VfIfl2IpsnATO0ahut6KDaiB/C3b2IHcTVeYcjY1D+rmuYFsYptmiOidJuu7o
 xMtP81ooHRCMc7Bom7Bpnftu17HmYj+o6JlyU/gKSUOWviAcDTeXCI7b5N5aZXKTlm1NnkyfA4c
 g4eid//JEGnWCipeHMFxiQHd5O+iFYSpv/kQVx8Hn+UXvY9FL6V71MxcsTY9OVoLofPpZ4p1PXk
 JrbVSrsEnrxLCdJ1DJU2zCZ+4DupGA==
X-Proofpoint-ORIG-GUID: jcogv8ywVyLWGZrT-Pcgh6ee8VkW8mxV
X-Authority-Analysis: v=2.4 cv=INNbygvG c=1 sm=1 tr=0 ts=68a69194 cx=c_pps
 a=yRdPyDuw7Sx63jVS1OevmQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=uNb49fXS4AQX4V-9WP0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jcogv8ywVyLWGZrT-Pcgh6ee8VkW8mxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 03:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222200

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When gcc build with PIE enabled the following tests
were getting failed:
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16

Detailed bug info & upstream fix is here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118885

Upstream Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |  1 +
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index 41e4c004dd..3583e40f55 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://0026-fix-pr90579-testcases.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
new file mode 100644
index 0000000000..bee147abc1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc.target/i386/pr90579.c
+index ab48a44063c..19081ec9fdf 100644
+--- a/gcc/testsuite/gcc.target/i386/pr90579.c
++++ b/gcc/testsuite/gcc.target/i386/pr90579.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O3 -mavx2 -mfpmath=sse" } */
++/* { dg-options "-O3 -mavx2 -mfpmath=sse -fno-pie" } */
+ 
+ extern double r[6];
+ extern double a[];
+-- 
+2.49.0
-- 
2.49.0


