Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C805AEEC2BE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:46:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11044.1771897593754629633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RHFcysTd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0pTip2853662
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:46:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=YR5q9Nhue4XrA0lYlBJK
	EGKBpoBWxtZQtwV0Zes4rEw=; b=RHFcysTdA4DpsGaQiYEmcLWljfgBM1nHyIMg
	ldWUPOXiG04Q/GJqdjzoAe62z4sVfUb+iXK5AJdzT6GsnJzu1U0jWkhBEznQyj4F
	lPEeyOXjcjE2wK0Ayplre8ZWUzB8cSOoEeE39uwRuUd4zKuP6vNIgIFyB+Ij03nU
	TaxSvZT5hVRQwS2cPcnBJHZs9A9Zpxxl4g3H/5qU8n4g/9BuwVllKWWk0VuKnbaT
	2uzJZpvrQBQn1TFzdzxzZeqKWss8AvvE9gZb9xnGGbrJa3/uqLwrSS+lbkGQDJhT
	tq29ZujIslxA3UDSwHehAFARb14lUJw5j2ArT6kPovMytQgCNg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k295d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRAw+6BPgpNtvdGFKEe1uZRPsEoHiL9vvFJUIG3DnI4qch+P3HF2FddaM7VoJTExTtDC8ag02Z42YLuGryKlm5ZFZkBGYDrXJuI+F61k3zQax3lxMbYcytYuko2Nd49vBNtBJvcSaTQtJUyEuTMv9CKSPu4jB1HKHV5R16u75OsE/JWQ9kSkk71lhwv+R/EzeCPnFdri+GUXt8KMTeEJY45L0OAqyDgSLH+9W5foMqnyOHOoXlaXlR3cGul0UIlSvugDCuKdiggvObVhNadzOraCLHNmzUrppQ4K1kzs5gcGZ21kdoOzFoVn5f9ka+nJjf1mKah6azF7u+4/fKGwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR5q9Nhue4XrA0lYlBJKEGKBpoBWxtZQtwV0Zes4rEw=;
 b=t/qhT8ehgnZN1UielVcm5RkbQmHY19pQaYYqv/1aLDtzZF8KkBSUWaoRyiDvhacIlWTgYpuzRoIR47g7hR4g9jQR3Q80mACLo9JH0m43MXJabX3Kju6bijTf1FW6TyxEvAzYdjrvvDt1Xr/3ZpPzE7AY905sSwULEUJ7+zX31uyduqYenHltW57AYjVBqxKR+ZoAtMF4BbFvd/K/esB82zED19xQd+5Y62If0YkvIwvAWinq9xLJJY8G12i1+7wkgx42S/UeocKMGmtTm1+XassgEMGeFuLKWEaaa66BGWKz9I4t6IB/gCBGxKiemUMiGpwX2Bm5uuI9MhsPAJ+7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Tue, 24 Feb
 2026 01:46:30 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:46:30 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perlcross: upgrade from 1.6.2 to 1.6.4
Date: Tue, 24 Feb 2026 09:46:16 +0800
Message-Id: <20260224014616.3335577-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e7da46-6cd7-49a4-0d92-08de734687f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BJbVj9HtF2qm3IJO+f5AT9ioh3jSs08E0w9gKsJoOgjCAzhKNUlts3ULFU0e?=
 =?us-ascii?Q?DIZfEyrKmkxezKsKNzv7kERuAQIo8iJirlr9dPv7mCNAYmF3YlwPUlYS6KLH?=
 =?us-ascii?Q?440voEdKRmf76XXGSbYAJmz1yt/JecB09KzHncHt6ZwOn4U6AEG2JFcFouVR?=
 =?us-ascii?Q?m6u/bhmYBZcDnpl6j9nMSeIo2krcVxpNM/8EYPTVgfq25IfRSxEJx0vt8XFC?=
 =?us-ascii?Q?8XY5rcKBJRG9H7fHaHvsM7117VApsh/LwDl/s9bqI4Gr5vGy/HdDdUucb9FQ?=
 =?us-ascii?Q?aBpz2lTjxaozc6q2tj1rPMzShdjmXNfFqkaXsvKQtJPFsEZtypULQ5lEwVPZ?=
 =?us-ascii?Q?+m9R1pMbI+L/WvEHHTEN/kI9NYRHEWsnHNiq1Ngddkk5Tu7I4Smt3V2qhqnA?=
 =?us-ascii?Q?tkMfLjE0YRtFYlsEKQFuIcnsBFo0sHzT0JlGzyD0vCRX0M6mfwmbPO3Wp8Vt?=
 =?us-ascii?Q?U8fpED9xiBl9vO3lu/ePuMdb1JZ4VYRZYjHfRbLzpV7TAH1iVIqO1Hv+Gcgp?=
 =?us-ascii?Q?6mOFxSh6RP2Nq1x9QT6uNM5zPaeBgxjFBXuY+4EurKsxp6k6rACRy5H2HIMn?=
 =?us-ascii?Q?sXWAd+aAMjYo93zWhVJqHUe6oJOSGY/rNzsNtFK3Op4xos1nLv6RoCB538Ww?=
 =?us-ascii?Q?N+Km7f8m+G6m9pJR+OsjHVBLhTKxbDc2f2uMxiipTE4JRJWbK2I7Tg0LdL2x?=
 =?us-ascii?Q?xm7QcFg20DnmEmmQKOPnjt6aElND+V80bPQTy2VIfroFfkc8fWmTWEtCwMdP?=
 =?us-ascii?Q?+baaHWXUnsnM77Ko5E0AZUzlSmWDKU+xeM8pmBO6Ql1RrcMk6kSnLuOyrjuG?=
 =?us-ascii?Q?+/EWKV94UVnI29eytAzdUn5nz1xU7XKLL3bx9Zo8HNDRuwnRLt6pS5SueT59?=
 =?us-ascii?Q?SpziwnWMsWGifEzncOxppsJZKNlTbm+QsIm8h5yGr9bIymIriD+/Lkm7bfwO?=
 =?us-ascii?Q?qwLgaoroFFrjj3QYR39GXxwcmdn6lrPIGKuVfWI++8wpfTAWznSsCsKUP502?=
 =?us-ascii?Q?Vnvnzjz3AiJoOUnRDoPUEHgVM13NGi8G50e2SRmXS8QMm3GZZ7EZVmUDX2XJ?=
 =?us-ascii?Q?H7Rgw+2AXJTt8+gLO5p368juoJb/wNxTP+NSSrU0G00XruWJb83tLJysBUKC?=
 =?us-ascii?Q?XliyKSLKKQl40EwRZx6iLz77mQ5i5GSI8jqSf50edgeu4E/VwCg3B1qDBUn8?=
 =?us-ascii?Q?rmkhGgUKurOLXL0H3ScAZLuCOsKPMqGUMci91VbOSfBPyKNN0LYhVR2B65K0?=
 =?us-ascii?Q?TIKuAFN4PEnolZ17b4t1aN7u3PsrpHsss2dmkP4/g5gB4h5kVdxolFVRu6X5?=
 =?us-ascii?Q?m6ZQEMk5Xm9ux74+rh9nsV6NVkE7oJtpdrT8+SRbPUcs/JEFtbGXxDrm2eNe?=
 =?us-ascii?Q?t3YgBlDYaYqPyLRjk5Zsd18ivcDbf+Unv+rE0XpfD+Ud4XuGpxugiMX4Y2bU?=
 =?us-ascii?Q?gJPbhTSTuhT0t1tcmMq+LUY5+d4R76joFqkvcC2Ay9FIEiB0nG8yfZSsQ/Rx?=
 =?us-ascii?Q?k08ahcgpmC4ewXGxOtDvD1bCZiN1hHpXYaKo6TbnP/qgiqYoC++ByEh20s9i?=
 =?us-ascii?Q?5hwHqMhTvGrF2p1W0ELjl1WhVqSBk02GQUvBogYGOo/ElnNWHgvnKrciojWn?=
 =?us-ascii?Q?/P1aj24iBbWSQUUx7RQ1Atw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/qXTHdYmKzOcY6JJk2YlR8MaI+UIcgcr46UqM7bnHmHYiIpJ6bWOWggMRQe2?=
 =?us-ascii?Q?g+HcEcfPFj04yJoW7Yr0v7S0PoFBXdL+m1I6F2QQEo+4VpJ7Km10cfTkmWuQ?=
 =?us-ascii?Q?UnSaf2V7kCGTpJo+jtQWHnyN5kNlc8GcuyBJMGAabKNGo7FrrnPw+m2+X9/2?=
 =?us-ascii?Q?aqdvLBB0+GC0QNcl8n70q76MULPiUFDQ7vstID2dScS6VMrbtMLroJNcXOXD?=
 =?us-ascii?Q?hf3REpr69mDPve2zOMux3XJDRh0dLeJo8FoD66BN6JuRxM7U7TCUNukjlojp?=
 =?us-ascii?Q?UuT+VhaRO8LsGPUC10lRgTWVggiVdLAjfX5YqVGyr/nvcmeHIrFY/VgtYfOt?=
 =?us-ascii?Q?CHNjQNCTR+wpYU0O5ajEEWNACfSek3oEZgL7fZxXuuY1jH8rLj8qCtyjgWlD?=
 =?us-ascii?Q?z4i1ater/3Lo8zbb4M3qtnHjnJyzLFUTfd6N369HIGUagdV1SSTX1IVY9XAX?=
 =?us-ascii?Q?oVqVE7x1bUSI5E75mlhO2JUeim4l1rIdfPJ0ZrFQ2eF//aXuzzWSsvBAA2OS?=
 =?us-ascii?Q?XKQKucqfLkEhGVajZ4Qc/UZamhPpmnF1CVJebtMj7JDE0MACPTyVbuxYWlqa?=
 =?us-ascii?Q?sRofcusjHsC67vfKyE9ZdfN7oF2MXgXDbgfsSeDa74qOOfYVd4sXSAMJCfuK?=
 =?us-ascii?Q?HSzwGeHdsHA3yRNlJy5bjgK35CrLuvosHmYJZbFMCZVlqqHShS5gvaqqRvJx?=
 =?us-ascii?Q?BUEdfieVHkbutvLndtnXNWyvT7Sw9/O7dp3QizYGgkleCjDa20w/LRvtcCVZ?=
 =?us-ascii?Q?/WKS6ztMiXvd6FVypphKSxxu6BMOrfklVW8BNuwzxo9N9EkMwz4ugXkbT3cu?=
 =?us-ascii?Q?jBD6xBAL8ZIigUN04wvtahr7dZmu3lSvFMSDXZbfbE4up9/PeiCQeMwT50CE?=
 =?us-ascii?Q?xtA6BwYMTBwPteAcOCqsYgyBEJW9v8fzzUhk5eII/0yfffxHgkegnpSHu7c8?=
 =?us-ascii?Q?vYd/GxicYMbJ0MDFbmb6mSSPhxAqCXOQRTmEUg7OZ2atb4/fhlw6rRDBjyTl?=
 =?us-ascii?Q?QeejPbO2/EsKqDQcEXMXAl+diRnJBjJsvNHB8njMAG4TTadpC49mwP92pgIj?=
 =?us-ascii?Q?8/AgglQ0h2+957AmGULSlAxfpkCZ1GlwOgGGrR2Lf54wzvqc21ib4A106fhq?=
 =?us-ascii?Q?4jjVLSH441BNFctI64ptHb5oaUWQLKANR9lbUz2CB0XH6VKe6totGev0xpCH?=
 =?us-ascii?Q?9Z9ov7xuVDp2oXj8NietxRrwjE90DLRKEtm5l/evVlQ3arUWt7YLk4zp0+4s?=
 =?us-ascii?Q?hd8wY5USx4yWosgOlgGE8iNZj5rj88L5woxK1Ul8IPrGfY2u4XZvO0I3A28P?=
 =?us-ascii?Q?gLHC4YGhcLoPhb2f0OMvWzaiJRdHJs8Naj+kBBB5HqPjZjI1YL0+A8mjNpeM?=
 =?us-ascii?Q?8pPiJZdWiny/dlyx1LB6CCwtCM9MsvEGFyt0wu0T2zkwBOoA8y4AaiMNizTa?=
 =?us-ascii?Q?3dufN6kEBFjYsBlji9PjQQ8x4mIoRI/dgyprZOEWqVMIAhs735urCMJYqz7J?=
 =?us-ascii?Q?JZtvc4+jL8C5RJ4iSnGVdnm7/4TL9Oh1ozsh+fRCj1NSpblCwOtH7i41d41u?=
 =?us-ascii?Q?XWdjySMQy2he3fvsFlpwSZHgRdTRgUjpZKUHS7J518kfG6xollfv7pebt0sm?=
 =?us-ascii?Q?xN3i6zucyXHtuBt2SXZ3CZJrwZCGwe6ZWtT+ShNBqByeVZFZVcIOt2BC74Ym?=
 =?us-ascii?Q?Huy7H09MRpal2RS7zgdCmZMcTSOKlBbdzc5zVUK1sGNTyEKyeHQPIRDW6dGe?=
 =?us-ascii?Q?otRC3qREpq3nXG/ewR1/u1w1D/OE3Ok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e7da46-6cd7-49a4-0d92-08de734687f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:46:30.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e/cwp5ofCy60VqWXHJ3K73UDssLt9T/azXMU+Mk9/xs4xkaP/I1e6fY65yYCZbawZD858P+Khw33E5PBpoZiUs1aLyd9L82zDp4x7s/W74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Proofpoint-GUID: KDfHidb_IoE4_iD4KmLQRefjOxA31J4p
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d02f9 cx=c_pps
 a=v9d8l4VwGb/BX2RVr192eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=1jPp1DPGAAAA:20
 a=t7CeM3EgAAAA:8 a=uVFQ_WrOHC__exutptQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: KDfHidb_IoE4_iD4KmLQRefjOxA31J4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxMyBTYWx0ZWRfX+EXgsMwTJIcO
 xjqHzMRJslzHx0xfR+RgEFq4Hpe/l3b7HZjo9EHktMI2Saq8bPIUz4AJpLUWNh8YKWHXVA57i2B
 6XiUcLr39A6pUNPsa4lbYWVxB2HmFH/eEo3SEVxJ0qWXp9o3SCC2CCwCJFVfOwfFqTUp7qjk/ed
 4stfjsk8H7lwTRty58ODOqQmJDK4SkkiMsl83LMWKqBPuzvWVC0aXjVBGc5YnyMgnpQugqeioCK
 XZwfOQwnLMvko4TYonKyb8ddHadyoXLdKCIqUP4SLChLaw2M3U/l/KF6dtaM0/kvFjnywXa8dmm
 9Pm2dXzHIgv9x5ITFq8rz7sN7GDPa8s+D9O4iTmpSfxSoOLuT7nv/8lk9HonASaTc5Ka5HRwJIr
 o9p32bb6tB/hLHfMismX+IJqm1i/sx13GkQZd/molf8H+vh4r/RSCD2z2Zo+H9jRJwkxCIizhKw
 J78XFh7lry+SjmxQHsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231724

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.4.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index debf2717ce..3c544c9746 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
+SRC_URI[perl-cross.sha256sum] = "b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7"
 
 S = "${UNPACKDIR}/perl-cross-${PV}"
 
-- 
2.34.1


