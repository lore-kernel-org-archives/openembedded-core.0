Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD10EE01F9
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64840.1767104186130519362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aaZrrwJk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCeYeP3953120
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	aaZrrwJk1m2ueXSbxURGAHMGhXu6D8l7P0ElvZ0nvfEAIBIec8V+jeI2/lgtZ/Fs
	+O+moem4zb0Rq7g4P7W8vt7hNVB4zOjQtuId41ygAVlfstzXt4/yzbA/8zqhTS7p
	bKXWumbJxX7/kV2yiZgxsrwTJYUP73pnc0awCpwnWbMycrMxIQ9MtWvg0esOpwc7
	5r2j0pWWqZARk7lZMA43iZC1qKIrKzg9KFoTAK10NEVp5+YiB2HnfJSe2dDm3wLx
	IC0ZLm7ogi79LnhAwDlA+qbSXLotIvC4aegNCIGfLqz5QnYitUZWK9JdD3zyIYn+
	Fl08ABFa6LjcEfCWjhdIbQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm22rjx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALnUZGaHZHvVDGlYlv9zFCQkgR8I2lvt/WT0c7uvDcmy6KpcAsloovR2KajwnFhVF5onCXYaSX/MFXYwloDW4jgj98VVcMxxgOtMlPKXz//pWITr6jlLfuhgbHaAUyNdc0m9DKXzeeVL8Z+nhQ3qMCy8GEsMB1Ev+s7QycD1DDHKwsWOQdSDHnwnWUUmDjgQwExT2jak4DA7Qkz5lsCOpDZVvJknFbpqaVCa0LTWizgMQVxABRdApTzdV5GRKnI6875Z5jZCXxIRZDKQ5s/0ScK4I2QyHOBWh6rDDm7xVOwK5Ni7lEF+1xm+82D5yROheku0/nmijxf6w9AQFk9yEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=KzxIDQYgPjD9rTaOkkKd7mRCSjJde15VczUjgl2afbzmhm6Ho9msu7v2vqLxwD2AQ/3HS5sI1afIWrztKwzhmLO8oktaLz1AXypN8beEsuA5f0uNaMEUzUYJjDh1OV/XxItgyaBddsrz2XdlD6f5IfH99s0+viZWspyo9i2lfEhzuUc0Ch3mnuF22VRvWi0XA4d7tP3go3S0/v1Pwfssha1VN1VWu511/WGwgdnDybrkH9RslcZzW8LbwH250P3p3SU4FimGCvmYELzaYOHHYPLOR+KKRXsJPoe5AArpUQwLTs14n207zJwJhP5Ya2nOLKv/A59jMlQjqaoswEzf1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:23 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 02/15] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Tue, 30 Dec 2025 06:15:27 -0800
Message-ID: <20251230141540.1974380-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: fc93abfe-1571-456f-d890-08de47ae031b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iSq3LHAc23oKe7jyD2a5lwvDX47skKSdfW3Db73RedW7OyOA9fSo6O1RA+PP?=
 =?us-ascii?Q?8RZO14WW1ZZy2fM1zqHZKUdsVAlyuZgZQeYYcHqwKVkuEWM7MBdvk4UGBmg8?=
 =?us-ascii?Q?7tq/xl/eHlIWdTyM+1Aa4HNKFwKI9IsHMV0dkN+GDVsmWMGUrTyZZ0JXgvx2?=
 =?us-ascii?Q?lZvPGZ7kJmQbCfLDBGgEKAo+h3NvHtGv5oDOiOJs547ZrxCX1G5siNWLxN5E?=
 =?us-ascii?Q?UQTAyAyspK3W/GlWlik/Kcu3SIfyxhKoi6lq55/N1N7ffdikInU4Cqln4DYp?=
 =?us-ascii?Q?5Phl3zgtnfhE8Vc2JJNUx+4cG48qG5bbU2M6rr2S8+77lsMfhq9guL9e1k2n?=
 =?us-ascii?Q?Korm8iSRJTKq+PEJKlwxADsFpBp0TZI9LrJIVbAm9y4k3DtLZvXxs9py8IJU?=
 =?us-ascii?Q?wOLikDD/DP7XkQNqJsYX2XB1nG/WvdLNMMq6FxBTEThPLHtZ9g056sKtVLkc?=
 =?us-ascii?Q?OsBbb2vaOLM4u1SY7hi2xBgO2+wlD/5So21jP/G0TIb8BcIifcAlDQP+dHfq?=
 =?us-ascii?Q?lg9886EarqnVRIdUT2cIKR4V7WIwmSH8EWx5wqj0hoFBrwTEVzERU3wl/H3+?=
 =?us-ascii?Q?Srf5qYRkhqRhfREkCfVX9cDkFY+4AHZLmigd1ESIaM5TWNkoh03GBZqszRav?=
 =?us-ascii?Q?BQSq+XShSjd8M5AD55YC0Ezas7b3DN7F7SrEgPDh6IqDj0CtYvV548nPXUV1?=
 =?us-ascii?Q?e1/JYyyepKYadOzzRnc/iDabC1sPnC2EOphL1GK2MystS82yUXD09aOh1Yaq?=
 =?us-ascii?Q?gjYBeJVm7fGeNfs1O7csmP1VBssDqHWT0MuLA971xpNtELipuWebJtNefuYS?=
 =?us-ascii?Q?UGGDgGCKTFBS6MqeuZz08Pij0e5Bl4q97vREBTO0MsOGkVxlYLaiQQsOVsLJ?=
 =?us-ascii?Q?EINs1BCSqQuWe9GLP+1M2pWWAINyI4jKVxhTtH4ETOXLTBnWRxBa0HzGTIoK?=
 =?us-ascii?Q?UdfSxPulJIB60uwkSsSQEQS/1Kp1o4FlYqHjB/Nsulgvu1lUuFImhuR14fCR?=
 =?us-ascii?Q?7BJAqDhLkGrVXhkUhDbf3cmRJwwFEOETGatHMi+Jo1U4/J/U8GpS4HzU0yNr?=
 =?us-ascii?Q?ZP1ClIczmV0f/vPz24BpbJUSG8S4zjiOryDRSus25DjGcdAAqqyd29iKrenS?=
 =?us-ascii?Q?52HbfMnydUW39Hqou1QsYiNIeK1g867ITWleFCTjaA8lUNqYD9eGup8O/a7T?=
 =?us-ascii?Q?2gqwh8L/5A7Kn8eHvbIE9uQnr0CXWlktCSHOARIAmQgB+SbbyzovPLHM1git?=
 =?us-ascii?Q?5BAMaxNYcvUOmXkZJSp6Bkh/sBly+EfzvcOBj+HKmMRuhdd08jidQ6omzbVI?=
 =?us-ascii?Q?Ej4zAM/g6w+jK9UaiASdMkSauD/QwRC75DnDEW2a5fBAo+WTXK9uPHanf7pR?=
 =?us-ascii?Q?CMGBrT6dhE8kfdt1d3/R+LYP0pHtFZh0SO/fxMkJlmaVF85rbzAV6ii+jpO0?=
 =?us-ascii?Q?0VjwX/5/HTIfniIrZEggN5fvhrt5Zq9omN3ztoZqELa78cHVV/yWNRKtLGka?=
 =?us-ascii?Q?4IkE1Z9pwEJdoJI3c0OjjEQ/MCjR6QDg07uD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kast2ZwOh6u9Gug+kopncpg0JbtmNNecEqOKau/Jc/U/+tQc8kOBhgjv09FJ?=
 =?us-ascii?Q?WhuJ4rNL61N9p/rlD7Ndl5/cX87blxt+oRyJE7RKYQr0HS7PzLB6hjpt44xn?=
 =?us-ascii?Q?cTPi79I2DhHeCwINxi2c8mABheDRF9YyjP+0fsb49v2CBwlGDyG8hMkr4qjf?=
 =?us-ascii?Q?0A3Yd62r3tjZBw4FGvn9S3Q2IjamVVVi0m+fSOmkVTYRt9XOH/KKA+sXBJYO?=
 =?us-ascii?Q?Eee4daGWrO/xGP1Ed8LcCQqnPR4ClmSt9D0bwrATLhxUjTeNJ04To2c1pLhO?=
 =?us-ascii?Q?O+3IxuGax7Y0XsyCCyvB5Jk6NDspUQhOjVj0kXSm267lvsvuDer+0mP+frL5?=
 =?us-ascii?Q?l5OeGIJMXokm0c/LP5qYIxxaJpP5m0pTLiVpCvK2XYaSxjaIzElB5IX44keS?=
 =?us-ascii?Q?jWaHctOqRGT5tL9esju6sZgy6ZFEAQaZFzxgDP3xjQ6K5PL5Kz+tDbK8mz5V?=
 =?us-ascii?Q?11uUOEDlogxArqE8EpHgTemgGkx488mXp8DWf1mfydo2ezcKhg4XwCXW+aYR?=
 =?us-ascii?Q?Hl6Y8PTXaLB2wL/5X9TsP6BH2qcEuvDFLU5wA1jOU+ydWpGDHRUQkY8gwYHJ?=
 =?us-ascii?Q?PHB8tPn2mZ7AaH96hC9yfVSH4lTCdQ5kvsGX8wne34suR8P4RWJRKhPN4gF5?=
 =?us-ascii?Q?er5nFa5vmxh/RyccRRI4yRKvgKm7UVfGO/lTWtspWtEka/hbLvCicPzgbWNi?=
 =?us-ascii?Q?/J5xBBhzyedIQ98Z0WUexeimrY/0WOi9ZEujM2nhZfzZBBE8r28ArdPIh/+a?=
 =?us-ascii?Q?zDiiIn+CVLgKBueOuc+AKjT0H5RQQxpzrW3R8dW+VvboFYYv5syi2hgetCky?=
 =?us-ascii?Q?iwJBsVmCpfN9V10gca+m0TAJb/zLfc+t61DrsGqIYB7q8vnz6NnEGy0qLKOW?=
 =?us-ascii?Q?UEHIo6a7amS4y/VSgyVVeLWpxtqDzhcOAorU+Lk/8rCAaMInU07COEx5nk67?=
 =?us-ascii?Q?F1yC/thgCj8/D9s5EmU00SZ8pU/OGJQ0RfIfVCjfy90lpUaPCGwVooG00iY0?=
 =?us-ascii?Q?S1SjH+8296McIxigifZ4D12+sdLMFTXT7rQz+LlEEjA9rd/SfLMiK0E8faxQ?=
 =?us-ascii?Q?tjnFwUsp1ENGzU6AlVBarOCkHrmmfizUIvR3CrPvX8ZGmXeIfqjYLCfydo0K?=
 =?us-ascii?Q?F/Cl9pcaANb95DlVgAc60KRK6xnxXvhl+u+HfEoel9pfAcQy2wcTXC1LpD8F?=
 =?us-ascii?Q?qNZ6BvdFrXYIMqvJscQ8Aw2yzDhAQj1c6gMQh9LAUHFx0LNlnK2nPAKVwcOb?=
 =?us-ascii?Q?zDbymCj68C5lxvQQy+RqT9aTVH5GyCLa3ItA55uvcmfV1pRqFjeo7KR/vb1n?=
 =?us-ascii?Q?0GvcKv/zyrcdoDZ6m2VgpEp47VlfSXIYaan5t+H8rW4JIMPDk2XchFuXSLQp?=
 =?us-ascii?Q?ANZQfoJzFHy3AWWyNDKcJvStRPkYzuGQXPwhnb0yu9YE3FPXGSBsPijQMiHN?=
 =?us-ascii?Q?RAPFltQ3DrXRkrCZJWwc9oBMZUWYmQPImb4ktPiGc9xNKnuIvFoaQfGehjXC?=
 =?us-ascii?Q?FNvAdlp6BnA37tJUqAkFsXAjMq/IvaP0tG/QQrw2jAKMU3PFuIygc+JB0bwI?=
 =?us-ascii?Q?9MBKRekGNdeo5U+FoAqHM3w/hDk+2HPs2BF142zOVexbZHoxBy4jamhmYnRm?=
 =?us-ascii?Q?jTwzUOnDpJJ90NLmU5IwodHDGLiMesqsJ0qF9U4wu84+ViQu4SfrV7U3Vndf?=
 =?us-ascii?Q?muP/ZceiOkzecwu0F9kDJ9PRyAivttPWdNqvD+J+vjSOcK6akcjmqP9zCTUG?=
 =?us-ascii?Q?PT5CrjoOanVcjxUrxGs6BdzjH7gPhEw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc93abfe-1571-456f-d890-08de47ae031b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:23.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUJVsaf3abaALr/k/LMKxGzHiE2B9hHokJAwOapX/3A/ZGDrn+XFci70HTmOGDEGjrHoqmvNt7Dh4NB6wj28sXTkdlHZrC2rm9TJkaY2mFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: R-SKFhsVPrMSP-xuCcQ39EstQswphtPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX2mCScZcl8Y1w
 /E6wDe2eZ1AaVtshFsMfKr+7tQ1wmW/XTVGYg+5uo2aduALvHkjfUt5+VpgaiwlpvxH1tZgqaAR
 PUoRoj1eVb1CLgxGN4/w8iwZ/4RSH6Ns1L+jC9mCOjPaEkgxtbTTdcNu6aJarCVzWuImsQGcOjO
 1PlqJtjZ0hbUqR2hErktiMjzfN6J4NONyQ62AoTRCALIvqjK/B6qeudqyAIRGZtQuXocQ1aiPSA
 UeKhw7Hcx8KOZoyBRXdE1vE9+OshG0JPejFJauoqZSXZzfU8Djc8/+aoa3kMBI2GLgpWpsHRT/A
 cKEoeNk1ph2rRwykvSiBf5B1R4hTOUIOgbMXd0mYhqhQNbaQo75G/HSP69gVkMg1Q3uSWh5yFiQ
 O+B/8cIIzqGHwLepON2pakw+KCxGprmtGsmA6VQb4ow8wuaQBPJtN6NxODkWIDJPa0dac1NKq0v
 CehdytokjruqSnf7nXg==
X-Proofpoint-GUID: HYc7zdBslx7nM76p7HMVxnT1DzFIBccD
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6953deb9 cx=c_pps
 a=RBuBYZrARuxyk0NLsDi/4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228668

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


