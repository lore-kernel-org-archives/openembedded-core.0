Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E996CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:11:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8545.1761891085850458544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DsBaSWuT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V5AZB21599214
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 23:11:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mDkI9f4gf3X/5Kl/t/6i
	Tr8oADyAg1KV0i0bX8we1pg=; b=DsBaSWuTSyqzHDksaPEUu8pWX7TH7VFBqzpo
	1p6Zh73qM1nyrKu0nKQ1cZQ8RNbjjqhB908gCTg9IZl34PSoVjafP4rwRq5t/jIA
	gCu4HpO/LX6mnXgDUwl5H6mWpj6mt6DeDq1+pLjAiBA7G+R3gl/epXGV6GGKYGHo
	NxLwMUa4F9kWp8I4MGy9AdaN/nF31ZgcuC8q5gPvcy7qGGRn3GT9F17VYYTgP6so
	mHd7DqE81aSawtsr6lQS1nh5vuK10P4VA1uKHc2B8O7vEoBmBy8vMVOKT1J08Vae
	zRiYtIIUVo5QCjGahUN68sWxuynKLY9Qo3fVTgkUyyo9DYhY4A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a4mg204pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 23:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0Jg9JwaQLMTWQkYCQfwsgLa2QRwn0myJozNxkQhAptZNExBhaeY31QJAiGQCM/ohp71GyKeZExSENs566u3A5vTZ383rPI5PdXDRuXvAeYelGZXdEg06/3qbyxF104e1MyPkYaG6T5S+u646bEOc7iL1LyQYR7NXPuK317baDGUnp85GZxBVGXmCHxyiY0eIDXnzJpbGfh8IkD4vRkbRQJiH+iHgwyGVP6iakEmbij4NP9e86SIJ9XsaWBQrJXZZGFdOTzsMjIAJUkfVM6evfaaUUgIK7lXXPdoEnUJ6tQLLHp/gZgoprhT0UqzRiVA7EQBllQH6/q0308Nmm3grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDkI9f4gf3X/5Kl/t/6iTr8oADyAg1KV0i0bX8we1pg=;
 b=CtbObIM5NTmmXvvMaG3wfamiNc0FBU6zw7sWUjLZgkeScoTpP7raahM1SLRqQ0/tUjIEV+RHonaZXpa22R8fKyf2Q6Ehv2DE67vJqEc9ffEYud7ycuKFTorIwRoxZ4Ek/rXvGKrnkMbjXP/0H04kPNsCwJledWN6TChO41KSdhTOGJZUYIDJl8LBgfTmR8HO9Fa5klF9UCKS4vC7yy5nnP0NHYYLJBGuauoPuF+tyv/GTVWn2dgREWC3yQqZCbok2U+8erptfmJLFLIP72itmCb3AswtKlEO+hEG61XRXGMliwN2V3JbHEBJYmRCjm8nfkFTQGDtw4LpRx5NkxA8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 06:11:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:11:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V6 1/3] base-passwd: add clock group
Date: Fri, 31 Oct 2025 14:11:03 +0800
Message-Id: <20251031061105.2693258-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d40ecd1-69dd-44f8-f8b7-08de18444fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DzTPmWdxINWo5T03kwuI3brBiFFb/WWV0/RihroiZuenbRYlreLBNUJ9Yufn?=
 =?us-ascii?Q?siKazO99GH9EGP2EqnENg0mjYsEehyPiPzOnXnUnnBHlXP+7EkRJulRxMvko?=
 =?us-ascii?Q?6UN5ZDZzJPvBQXIukNuEZ9bCEoiYgfdwyyVwlPjPGGGsFLhF7Te8CKYklfkp?=
 =?us-ascii?Q?aYOEI80n4USLvTZIYyYbxojwsTH4SfcdtVMRhf4kKy8H3ITE6WPVLk7L4HSm?=
 =?us-ascii?Q?pi65p8YBqwY0SrncDmGFjhyMBbQWDOl5LLZqONe4YkkaFkXAPuCP3uTz5xJ0?=
 =?us-ascii?Q?DK0dQd3xklou7vkjOeG8VNLf1sPEuSwNqR3XBPWSd885UiiD2/s4OCxMjCkz?=
 =?us-ascii?Q?8erICsXRe7mtAb4TL7tMsS/4J3cYO14Eh51/fK34tOpcN+6dHDWuwBV/222f?=
 =?us-ascii?Q?2JU9Pd+vcBx07xuMd8lRF9c8J+/hfbBriYINeszUQDm4jAjQaLEZk5FPkHh7?=
 =?us-ascii?Q?Kz1cBvky9scw7OwgpDY3Jcmo2ersnIvVFpQa295+PCOn99t8TKDSKfv5xBmW?=
 =?us-ascii?Q?/sTgW/iabZo8MezhU+O3EQrhgMcLWdFN5uHd6oFIK9k5XUGaZKREJjh070NU?=
 =?us-ascii?Q?7ngrHQabn46AqGfYao7sBZTzKne91urElDklmxeIry7PyZ/VDOBxJGjlxsHr?=
 =?us-ascii?Q?jm42C2vhv46JEd/bTW38SWZxeCFGaiQ05MCvRFcKOF4EYYyhlon3Jl5M1vAR?=
 =?us-ascii?Q?xEkZzURvFJPAyUJY4sDO5GYltXdwx5tNMal1oG3o2Fv95c/aHOjUGzD6wgyS?=
 =?us-ascii?Q?5YdtG70LmZaUvIwEd2qU5sGID05TRGJfrpZ7bvwpeP3ckXA7xEoy1Wi6rsm+?=
 =?us-ascii?Q?ULZYCB2HLLqD/AHZNbbc6SCLgoAmMDnCQCdcvD9u7+LNP36U0a8jVZwX8IN3?=
 =?us-ascii?Q?E6Efvq2+/nhZTpgN9vaYRNuavPRl8gixckaAVbn2GzdxIzZOock6r1swm9zg?=
 =?us-ascii?Q?sB/+mJLdE2APRlV403XZcXz0onpa5mxTQ7TRE440SbL4NXBXOX+//mAeI7de?=
 =?us-ascii?Q?kIF3fd0xMopv4M+3TtiSlad0jf3uHCKYdHGZRdhtYnhBhqj9rFe7t+5GFQ+W?=
 =?us-ascii?Q?Ayrq7BqOR7pHBQLSODbr2L9tH648esUmAvm06g6rTovRBTdfgPtiEJf6MoRN?=
 =?us-ascii?Q?P2u89cgn1Jt4wuU0talnO5FBLpLSh4/ul6ojNaSNVZX7DkKsOAwd2HHATmpa?=
 =?us-ascii?Q?9rgvt6mi04Z5gv+0dKQvC6GBeZ+FQiMjGsSRRAfi+zci3SRCcGmONHB7AzQv?=
 =?us-ascii?Q?KDsMflxftvl90VRKIwn+AQgZLjNCJGIuZ+dEnL6Yc3gPXLzqERcC79HbyOX0?=
 =?us-ascii?Q?6om7q5vt87A/D2WkBcfmY2M9vL2NdFE9LVG6V86CdUqtzAQ6QDo4TLdqAeba?=
 =?us-ascii?Q?IedJUzqwRKPAcYgY2tmuPRLrKRKm+eFmejLt4/UONKqQqpIdbINwp7z+5V1B?=
 =?us-ascii?Q?7BOsYPj1lmmMUrKoFIAeYDffQV9JqkGLDfQ5OI0219/9GBQeqpQQ3A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8S1fm5cUn0JF0tFt7A6VAUhaWsorfrZQvMJdXXzV2KBj8ewo9I1dAGVV3uFY?=
 =?us-ascii?Q?cuIDMGE38ZFycPf8t4b5TODRNZs1mNqZE/3Q0GqxBcNKwlmTaR6q8a41Zjj/?=
 =?us-ascii?Q?DP5SQQF1inBuDLxioSIVJIsp2tZ1krGBH4j2SHaDegnE696M4H5McK1XBLVL?=
 =?us-ascii?Q?6ndbQpK0ZMfkjKTguD/n8eOTHdqxOfMq1NZaLougtFYp4yRqR5Ug/iepP6Fz?=
 =?us-ascii?Q?Nbf+U8MhWSitaRuZwRXMaqlKKAjMhgv+OgfyY0yX8dt4GSTg2/SRsK8Y9xuT?=
 =?us-ascii?Q?bZ4/LyHhQTR+4aZDJDTYlSPmuCr1jR2hCjo4mIBGkOn0kjSO9ecNACjR3ggD?=
 =?us-ascii?Q?nMVmKzXJlOKYdg66r3/bvEUhbl/LzlXG7E2t1lVEuo+MlvGi44NW+cRB5HHA?=
 =?us-ascii?Q?bMWRHlHXt6Ci9fAtywbiyX0+xwabuJ8k8bxzCtb3TZ57vV8wH94hKuMYeUMh?=
 =?us-ascii?Q?Id4fc8yn41tBf/GHyL8EthxXPMplfwHniVbGQrRU+UhOBOycsEAsUurCmhDw?=
 =?us-ascii?Q?wYhNfYwqy71nnZaVDAh052b2SZdkuHogEhAzyGsRI1X8HFW1qzepykEEXuMC?=
 =?us-ascii?Q?gd1gJDIG/P7wx+X8c/E3hp6pTiTPzau3c1bKe/KUQJrnl7dr9CObnLhQYHJm?=
 =?us-ascii?Q?pLdTLdkdR3IV1iZiTPCk6u1TqtQQt2neLYyIYPVAiSE/fF8A2YbFlXG4w6hB?=
 =?us-ascii?Q?9BNUDO7YZ/pBLF4YB2e4TlzJ5urbHdTC9i7ZI9MHvqcoudnn6R/YOLaqYQ1/?=
 =?us-ascii?Q?/k8R9ORjx8Am5uk2hy+xFouQRNoURLLM01sOFBBxm2oyP3m3AzGkZ0GOo5o2?=
 =?us-ascii?Q?Q/8bNlrRmSfj3VvNGNI1Iq9SyApKQC6YFBS+yiqNCsZ+nafbchOLFr0m5zRa?=
 =?us-ascii?Q?p2vefHxrlkTUzaha6HWtBEx2K+8fahwB7BSCR7nEEsuHhTLsUlWUWwn+/kIX?=
 =?us-ascii?Q?93U9RHm0CqUzlpetUhP52Cf6F7OxjTF0w0EHvR+NyAnr//soycEfgUuXivRS?=
 =?us-ascii?Q?jZxpFliBJk6Fx5UnXe5DbVhmcSW3asJFbUBptDYQmiU04h/HZKGbHMu7m27Z?=
 =?us-ascii?Q?sCYY39JMf6oFe+RQBtwQ3UbZdzdPJxK/v7phktZTUh6yb7MlqbHxvvgmcNDU?=
 =?us-ascii?Q?9I2J0pjMW0dw8jhdE4H0HJZnM+BxAH7N0V9Sje6QQipGW3jkRSUHH/F0HFtX?=
 =?us-ascii?Q?kLP+JlPCEaQgJkKI57nzk3uUi5eML+We71ODnUcMX2fTW7iaK0ersJk2f3an?=
 =?us-ascii?Q?vSJbTcMGX3BtOgrAGgYBL4ckqXyrtaXJkfsJ4zmMvvCHWt08kJXnBTKzM3ok?=
 =?us-ascii?Q?1E0HovMuqNiTYohw90fjl5RcEzD6goinUuWeNltwOAkEc90WE2vw2ltKsDKx?=
 =?us-ascii?Q?mJ6lytOLUmfCqZa8DhVYkvVwIYmgus6EGGeV6sPF6AiQrno+hWTIj4xArzAO?=
 =?us-ascii?Q?HS/fVKuZn9vQ23eg4oR/pN04t3cmezUVET/74PlTed1z6/Kp7VH32CZth36J?=
 =?us-ascii?Q?R8xhFK0TVfZ41ZoD0LZIk7+Ey1KCAgC/vRiyqCjSbTbUc/6lXRleWQKg6WAy?=
 =?us-ascii?Q?yaasszqN7lqw2TvAIXCjpxTA8uRnbhtL3ag7oqNn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d40ecd1-69dd-44f8-f8b7-08de18444fa1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:11:20.9165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufXw9sdetpViF/bfPN3TaIce57tFWLe9SbIuhsjYL67i/S16EF2hjyDzjU90pfozOuVieR8TXARAEfwWcQuXDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1NSBTYWx0ZWRfX9RSralP9Uimd
 UQDMMaaC/CTSw6mBmwULE1U+bp18uXjVSo+Bb7H2/iyEkJ9ffgOX5kMNS2BE5F0Sqse86EOn/rQ
 3a7mAXHWSx+qxeCJhyrc1CRHTk4ctPb9kMGxVSbBhECwrfXCJWCoC9jwaQ99xmdzIHIRKF2RBXf
 rpWDSSLgML9DgXwK3NgeEz4hwXtHX1/NfXNanGP1M/CTZp+OaDTz1OfS3EvVYuDqXIc7nyVNjIC
 KRT7w1AfN7WfiqflYl0zg9B39xkxWByf3E3pamoYSPEtjlUMvX0oORFf9Tz6RbPRjdYPozEMBEw
 995WlMc+6ZmX52T4S4vAFmzzww+jMeZBwJjeHVq04loE9TzNUIlajR9gyduiD10m0f0WdI7+iqR
 /5o+q4dVgWoZmGv/9dkqlhT7IHoGBA==
X-Authority-Analysis: v=2.4 cv=JemxbEKV c=1 sm=1 tr=0 ts=6904530d cx=c_pps
 a=MRNWLIXgA5QtCoQasNiLPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8
 a=FW9jF6JLtlXW1qxicXkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qf8X8Was1JWzbDsKFccq1kFNBcd_5yO5
X-Proofpoint-GUID: qf8X8Was1JWzbDsKFccq1kFNBcd_5yO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225529

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen.

Note that Debian rejects this patch because they're using sysusers
to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
not relying on sysusers, so we have to add a patch here.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..af871949fa
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,34 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Denied [https://salsa.debian.org/debian/base-passwd/-/merge_requests/17]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:81:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


