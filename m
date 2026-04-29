Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59324FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7614.1777454966405946223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K6rPiQVf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=957907c96c=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5Z2hw3625614
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qa/lCF5danJFbSvJbSR2d84fdQl9Xg/yzyyzGLTMRLA=; b=
	K6rPiQVfBFY8BoByXbeKxIuSLa7gwsQGUisKzdNIooxFWhpZ+RISpiE+bhpY+7Kg
	Kjif+8HIOIGD28lnDmr1YPHl5YLgXF+KGGMDmJBbHvAXKDAX7eC2aHXUMesYD4Df
	liGGZupEpy1K+OB7VdEaEXMpT/HHYUbmvksuOjMSb7wnhzbnrI9Ow9ixMI3gu8RO
	pL77SAqZnOuwoAIp1qBTP5Bz37a0KuyX87O4ctXiHhKuScSrF2eCQgdgt0ktr6NN
	giLAzfNxbng+gTAs6161ZVw5FmXHSwktfFOQNQ+iFxll68Irql4PrWKeEqe8EJQz
	Y7NUkLwEdsFdn2OzuDW4+w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju0csan-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 09:29:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtLCQsJq2TNulGxP5Ihm5N8fkFhR5XBHz41SkpnwfsKa9xdKKYEqmWWpq9x9eEl56NhR5db6iPJKdzVp5XEebEQ4Cu+HXZkj0QCvl372OJHLThlOwNKxOdQTTTx5Hf00HnT/6/lUz49h1GywaFQiKG+LFnSouKdqfsDnILQAjRoqXDFmfJIfztfgNuqJmG5j8VCY8OtTHL/3TFlRGPQqYpCAp591ZDD3TiCVk0D73WtffdOgg0K8TS/qRC0hzSLy9FS5NTIYgPEiWtFcB++HV3t61lRsCJ4cSVMMet+FlIn0JLq8tG7OwoUMFz5RPhNbhDndSBrjEj0n7NPwqwM7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa/lCF5danJFbSvJbSR2d84fdQl9Xg/yzyyzGLTMRLA=;
 b=Zvduj3+zK1jVnQhrNauicDBSf3d7nHglCbhueUqVT3udoUSPXEjUqiTJmAJuSufw5eHUljcjiO6cMC6ehxHoRJw6qQGnvZly/ei3qb18N4UrDN/0Dyvo1vB4q1izS7AGneBafz7B50bq3/Vljstw8fcMNzzCjcF+n/mfEUhxVcVvhP/2uJjbvBbdoqPId/lVc3jV+ywU8HqVRX2NieMJHf7ntVjGIn9vkMVqxYgniW/KO4AdDy7ruRCwTvKJPO7Kyr8cC7UHCVZLWIZqD8KF5EycwhIP01U2uODG4Yjc/wj+5u8cwol9vrUBcGb/FZp8rGFsBGVR/Nm0f2XeesOcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Wed, 29 Apr
 2026 09:29:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 09:29:21 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, saul.wold@windriver.com, hongxu.jia@windriver.com,
        Qi.Chen@windriver.com, Randy.MacLeod@windriver.com,
        Maganuru.Jayasurya@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v5 2/2] populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs
Date: Wed, 29 Apr 2026 02:29:00 -0700
Message-ID: <20260429092900.2205617-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
References: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6b7590-fa24-4fe2-23d4-08dea5d1cb75
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PMc5vD2iDu4O7EF7EoN5nxJFRSeAp3igV12POmwiJw8F6hThnuetAeTaLKItxy3ftkLMx2Emj2KcuxnPJVnyxjwz7XKxeKZAkKP0b7lUUeMZgbYmGmBzi1POn95K5fzNAEKIlHSzHlQw+2UyTGDqoNYieNorONmcpPxEpRPaGZcFQbS99h+nyHIqmZTKvRT7Nta1elmOqkEhzcx7ATM6bx4hLSc34P3dkEP6a/o93LbCww/Ta8XPn5pwNStHb6twjwR6qcIk7GW8QcWjl4y4bofiZxYMlvUveU3LWV+pIR676t+2PFGPrnzio+uQGGi5IR9UgSGUVO9kMP7vMyOAYOSYDyEx9yqGtSyCvaTrsUsY5bo8daeSkGB/6t5y1v5ussh4/EXAeyzGArUUu/BsB1bDuObVRxHAb+P1Ydd7IEtldD9c7heUc96/PqINToZUyBgtcoWEE9Xr0kZxnKzrSmZ+J/F/UlZu+ZrwtqO+Uh6cD0R8Amx2pLNu3/pNMGSU+tpSvh8PhqFYkomsnCPue69hlQ8gZpVQEfYM4rGh1hhMldl+q9yULqpoSqqcHWA/a4UtJtQvvXTKBPemhquOPmcgmed4tuM1BWtxgKFKVYoeoOIGfGpV43zHpNAKF3LdZ6PpHGUJDn/A7fJ3pdtAdM3D8QsMJ9+TJKsUZvlknpI5+SBydEvUCep3PUDdohloBdKuFJ2esAlBYX4byVCb7VOVfSIIUAjP6gK8tKNtKv6YOslk6L6OeVyNhMUEn9Hb1YUcKiRramidMGOoF828kMxSbj04tA9MgoKQuTJt5lk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sYCkxVvvl2xf+pnTAAbIJpSQFywuMrS7N8/dU5VFBc8rxwCysALS53p866vp?=
 =?us-ascii?Q?zUw0cIql/wqPhnc1UyEbszCxjs6qNrla2QtzJJcB9e2TCEv2v6JKqf13/pFD?=
 =?us-ascii?Q?yueX6ZY5lXGrQPh+LukN7Kqr9tekWcEvnskTFFoxMwFyLe1gwncwZnd8Tyri?=
 =?us-ascii?Q?xH5LbJzB7bn1kgA/ErWUmHHwYv3dnfYcVjd7qvwZni4lWOL+f0kYKZ4xtJMG?=
 =?us-ascii?Q?SEoeqrRssFRhQhn+S1GvrupvVztBtyzCKz/MhG2mE3WO1HEznxZUec3+11mr?=
 =?us-ascii?Q?kUA24Vu7c4wziG0/Ea/ykCYQPvO1aHa8V9Rj+J/f9KE0O3pXjMZpOjUB3vrE?=
 =?us-ascii?Q?+y/nfCAv8Pe0eMDs5OYsYWvi6LdXk+b1ayD94E7qYd5jDTgvXZp/cZD87K+B?=
 =?us-ascii?Q?MzXjKCiYct2nMimOoTG1nWELqa8nWASUyh4tBV5sWu8G5/aMHBOTEBEmqCrM?=
 =?us-ascii?Q?CeVpkWREeuMSzp2UZ/HSUAGzng1x2qVSEcjjFFl2Kp09AuCErNlo5RpAjd6A?=
 =?us-ascii?Q?zXaSeNxLLW9iVd01Pf2KnA0Oqo+ufIFf1BFc+LCSlegkqsvhgLhHkQ5NW1XF?=
 =?us-ascii?Q?SbKwm9DjMjKLQgwmBs6xriae3r5YRG6P9YcnRQg2R4BVk3g96AnhSV9JBZ1p?=
 =?us-ascii?Q?j+ND93eCW0IkyKbbXcypZWnqhMpDiUL7PoSN3rjKiNhj62OORfU0PjmyqYxs?=
 =?us-ascii?Q?xPh1QDMtZiWuTyyBoo1dm3NpK4PWbVes0oADVZ2bt4d0zFns3ZLiiDzGiXMW?=
 =?us-ascii?Q?vVq+QomuXN7ptKAQEZWFNCkPcGGI1jhNISjR6OW2wXYiHZQo4aig39Vwsbab?=
 =?us-ascii?Q?IruHl5bOtLlebvuoLNWeAdVL2Qk95+gBP+Dxn/NPSzjkLnScPAlrWeSg6DBt?=
 =?us-ascii?Q?iLzBtRH2u/AUHoxxqqSnh8j2s8mX2pthBPi8AhyDQ1GKvgJn4Qb28hbWRWTy?=
 =?us-ascii?Q?HWl92HFMfCdYCgC9LEmQBgji91Nl7NTtycgCVMvwoTxEYTjXzLbt2QVugTLH?=
 =?us-ascii?Q?9BlWt4Wf6WJcniI/SiQP6MOc3oDH8QXYz4uXyuftOXafO3UKgKW+rwT6DxCF?=
 =?us-ascii?Q?IUp2MYGcAdXn/g1jo1c2uM5EH5Q/tY2GvIelOBlqpEDPSRddJJBlhUdOIOtT?=
 =?us-ascii?Q?9QjrvObQhbLzj2rkG+eGj6LA7e4t1aRnklnl8jDo8vBUJmqbaGjE9NuFv8xW?=
 =?us-ascii?Q?Jp7HjDAqcAxzwKKEYZazI8KfKy/gtpvtBpXTjH6EJ9y0ZYkh4nUN/5aNk6v9?=
 =?us-ascii?Q?5WB9cg3rFbTYb377aIW2D/lLO5gYAce7rMM6wyemj9XMtsyMsge3/pYA1Y8Y?=
 =?us-ascii?Q?SYqpgUAmxsg5Ko9R9L99E+NKhsCjNPMtZNJRcMqK1A/UYlEUg3dD+cN2D+AI?=
 =?us-ascii?Q?Zce77kUGwv/SEE/P9gNXRZC4lIY3ww8Lpk1yXW2/rEEr1BmO/znFCszH33he?=
 =?us-ascii?Q?vfnEX9onU88S+q1APKO4VLdQjuEWkSSaAXVz8XAZEpNCuMdK1SrVKG0JaPNT?=
 =?us-ascii?Q?cZer6sLe1xE6CKHHZh/22pAwc4sd27sYc1mMEikwxNpkGmKnm5wOPKmV2HVl?=
 =?us-ascii?Q?oOdNXD3gghjI18rg5BFnDfCn8ZEwYl4shTUGsLZK8PWaHU9kButQXvT+J/+5?=
 =?us-ascii?Q?3YcSD6Mj2noe0/Tv/O0vRXBYkjW2zzRiygRZwBusGSzbluWoqmeJel0Cf2zh?=
 =?us-ascii?Q?+g+fUfSFDJkk3K0RBN2v6I1qkkV9tSve9TrHc/FOAv3MeWZrsFS3DJ9yPoOm?=
 =?us-ascii?Q?Gcg+lEBpudq5dsZVVSdHe0CF91x3TaA=3D?=
X-Exchange-RoutingPolicyChecked: 
	jkK4fs4ZSz5dRfFhm6SxwwCUpO8QtGm9V30c7U0+KjBNUjSrxP6KJvetJXmPxvh167YTo+ndEjFsTZsbj/D0Y9Hd+GTCclK3ZwUcQTIY5HnI8JuAkdzFDRoGqF5F4PLCZNU2iBPhbte1MSCucAH3KlG/na2PZYRqcce/+WGmFYPfeDCfm/Xj6aIqCldlHA2e31CHsgDLTcvXKQbSsHLmnEk+FF+DHxcop5tRHb0Vcfa4a8ElDs4GQnDPFF9hkcC5YedFNvUHQYis/uvLG6eEAtv4+9w7U83yZXoAwn4A8/kKO17xoGLmP7S8EtNhQzEweuvu1XQ7foEZwHyCV+LHiA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6b7590-fa24-4fe2-23d4-08dea5d1cb75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:21.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17hTva4qBs6so3Ri+6vyP+9myPEuxESVGXORn1H2y7cmU/sWWEqgcoO0pvyXVqeP7DTtVJeuxdw5aBnnGUMdAszzW/bbOjJcbT/iswCOrFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69f1cf74 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=5hl-ExYLI99A9eZlSqoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: l-z-T0pt_7FaZzUSC0VAXvbqyUxEB2K7
X-Proofpoint-ORIG-GUID: bLm1R2_vYY8ZSteyXmsly2T3zVKMm-x8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NCBTYWx0ZWRfX5bHWH5X/26e9
 QX/ODeahYndNLZOWqkjusOhujtlg6UekdAkVKZ09MTwe1oh+zm/Q01MY3zxejUT5uGtz6iVB5sq
 FFpWGT1D+vaZCcEtLpVrGOCf+ALK+jsq3Vh+evY6IYq5z1uYcCH3nCFziReubZMPdtWr4UWh4kW
 5mENm4+xm6kxas4DJO2qnZdtnioJLLL+P0JYXbpJNMgCa7LB8tKVz9Ow4KyD7BHtPcKqX3RvweE
 PU2/N3OPnF82XBM8wZVW6WOU+qDV1P+Z+C3IhNDu11/2X3DTnrw2a7RkwI46UASE6T+QKi8GoBD
 pw9yuyXtnq6dOv5Ya8eiiS0qRyoGen9FulW0xD0629tubd02LbpYhb3lsdbHhwtUp/r9prD3dKX
 Ts12zLJlXKcrRAi7H2YfF0O56vYzRPbEc4hkXx24ymTkGESZ77VGp4LL94SNbtZ1po50vwwaoUK
 oHv9gYNaRZXw6sR/n+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236093

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

The filtering in populate_sdk_ext.bbclass was removing all image targets from
the locked signatures, including the main SDK images (SDK_TARGETS). As a
result, their tasks including the image SPDX/SBOM tasks were not added to
locked-sigs.inc.

Without these entries, the eSDK lacked the necessary sstate, and the installer
attempted to run the missing tasks during installation, leading to unexpected
task execution errors.

This patch keeps SDK_TARGETS (and their multilib variants) in the locked
signatures so their SPDX/SBOM tasks are included. With those tasks in the
sstate cache, the eSDK installs cleanly without needing to re-run anything.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 071cf959e7..d17fc3af64 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -461,6 +461,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
-- 
2.49.0


