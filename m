Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B903CCFA1D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9079.1762348203309175703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FfpvbDxS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A56DUxk2233317
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 13:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=R2gBgHnTGRSrHkSHNy6cBcL0wzcOzcruf9THT2jUlok=; b=
	FfpvbDxSKQy6QVLCOjPETayLJBFQAEMLj239mvZuXXPtaHLfC95XPLil7aNmoXht
	ZfJHdpY7Kg6FjqMu5aQ5e/19mrerlLlFkCar0iM+rpUapkzXmw9tagagJPpS7ur2
	dekx2RAfuMej+IosDSHs0dUQuu2OuRm9x2zBerE8kjtMD7mBjYOa6ughu1cC3/2X
	9dGzlM8CP6q1ns4GSsCgLr47ZOADe6GgARuH8CiyEISK8tZpr3/Qtr0dBsIHDzuC
	+sjwVY4Li0ddm/4aQXwTGZUJtaN3rUyAMvRj978GJANWWBUSy44BdVD/5RTPn9Wv
	PSaZJ5mWkTwjvX99+zOuMA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war8gbp-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 13:10:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2NZB0kEWMQtrhkkha9TJlEzV7S7nZuy/1UPGTBIi6GxxKfdODejOXv9ssCbRO5tWKabjIfwUuy+HSKd+uv9/HoH070L2LmHFTju6qvry6M4Nv1LzPrwB4r/qFwDyxelO6NINgYB1uLNC7Fisuc5dhyPjNztQ/TPU3Ec8DgAcVIP7qSzJ1Io7RozcYWmHCY3/Ta5oQBGeTvuBrRy3m06CT3Uq+DjIZw6gwIKXKid5fiRA6LxOoqHrNqkdCfkPj6JVRlgV/R9LcThzfVES8x5/Ddi9jwYWHXOiar93ZGuopQzl14aSsNGEkUuxfByhmCGscaieibODg3kq8pqKAjbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2gBgHnTGRSrHkSHNy6cBcL0wzcOzcruf9THT2jUlok=;
 b=ehFFuCI7y59VDRP6BRc2Zz1crU2bsszOX2UkAKz1QJpOEn2FFkpOXvTXu5poXKSrZjqZI98P+WgugmxPyCWjmwHPrZxqupDjWOHSQLWtzRfxYfIXcbhtC852JCl7TIISMdLReo3VNMeRBhH1sJHC2QTtxVNXRr7NtQEaWEMFiIVJcBz2sB52Mnb1WphN13YxhzflDVV72ny7p6T1gzdMtdrZSEGMHSzp1xPts0RQmkOwP+LECaIgKSDJC/QaCFOhHvIp/A68x6oy885wRXpI/OSdCUfFlsCqoKE/gvWVGmflZpLV2xjpCpvSy8w2ge2rXu5rhiMP23cBA7ovDHArAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 7/8] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Wed,  5 Nov 2025 05:09:41 -0800
Message-ID: <20251105130942.833204-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d34452-57bb-4236-879a-08de1c6c9fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3aoLRaVz8TnFp5u1E7lZ/SyDIfpHYHRn3VR5G0wOi4Q+ZAFMn3EmydoG9ULR?=
 =?us-ascii?Q?DuZLjTD/ZzTue8QH8Ez4H3la55xkZrKAF6bFi0wm0QutclqVi8Z05i7UqUud?=
 =?us-ascii?Q?CUqLS9BzJoiAeqSmYXjHiLGpLOq1qJSYXNf8qARiNuBTnicsskTZ0YeI//yS?=
 =?us-ascii?Q?d4xeThT9ysWTrDtMr717SPVX2cn9gSoq5GQKuk5rnHWw0/b52bj08xN8hxn/?=
 =?us-ascii?Q?BS89Th3FfFRD6XBseRW/RhcMcCS4cRrGYvvz+MjuYrU6ZtsgiMgaXEXSKZjO?=
 =?us-ascii?Q?A0kFWsk5jHjGd0yP0Kzr5Yp0qhKq3aaQGMOJh8+L7Ezt4F545boC6BQGhF9k?=
 =?us-ascii?Q?TC66y9uUoYzbqHfQKovi+3o8yMNkcvdZIaY9ErJV11nfsOoT+gNpxLeVgLBT?=
 =?us-ascii?Q?5sG70Fvm15bwckCDhX9D7RSolV483PpU7C78rsfx/Ed28vVmGFb6VD2PuZ7a?=
 =?us-ascii?Q?dDf/i/FlIIXaRDtKobpc60MZ34GRnprHQJwK0+Wl0nNqWeQ0SvtOQHSUU0XU?=
 =?us-ascii?Q?dRhO4cSInZ7l2JEFso5k/4dq1wrNGL+PChmm/vuVNIVOFSQRm+ePM0SsJcpG?=
 =?us-ascii?Q?3SRjF5JZRK4ru+ZruNZ9fNIIN8ah0ba7KTaWCcmE6MOAWhMd+YW3NQmdqZHs?=
 =?us-ascii?Q?5+8sTrc+diLeM3KpVuOIkK9XEPoXiGiUoSfLoi6EwhMwFyuleGbQrEG6qOl9?=
 =?us-ascii?Q?7qLghkN4t1N7ebmG1gVUjj+XGdbUsivAixynBXYJ7BI43anjcXuKqelApUbf?=
 =?us-ascii?Q?4PlOT1XoF4KLzrrfq2Tl28im291VLDTObUytelaL9dWUfWcGLImUngz0FHLU?=
 =?us-ascii?Q?EC24I5ABylPCYY1av/c98pTLMphea75cPB9Q8uBYRdz7wtO9vOxcIMzCdQX8?=
 =?us-ascii?Q?lMrghMLfOAturVhgxTwpDRQWRZYuiv0ZMNSg6hMQwCTpM8VrL8De5jCXHwIS?=
 =?us-ascii?Q?jIWeSnsenMhAdlYaSei4ijYIJBPHMxU3d0f5TIl4ChmM0WX2JGFDD0PD4utA?=
 =?us-ascii?Q?pF54QW40rb5jsT1/Ce1SCmugRtfnzb0R57Djhzn+3Tq8lz/DjPD3tKJPBSqE?=
 =?us-ascii?Q?1Zv344LkOawxzF3ZlOdI45dY0+YanrE3gBUOu0OlZ3odJ9H/RECw7atvDdNp?=
 =?us-ascii?Q?fbmevASHdXyiW7H7Fy4FwRA+Xl7jlLn60fWcrPF20B3uFQeBmqmKHpODShTm?=
 =?us-ascii?Q?tWQn3b8lz5prsW+B/ofkQzyEeHleseAFegwRJRpOJw4TAEcIZ4+UKi0SUuF2?=
 =?us-ascii?Q?aJI/k4vcaUSdVcbiNvJkzx8ysvgjTx6offRcWtwnZh8IvwmfmKOymHRkRoR8?=
 =?us-ascii?Q?5hs1a0QONTEWSyWjm4KwYzFcsKr6y+2xXYu7Ke2Ay3gkwNWOQ2RIvJXYo93R?=
 =?us-ascii?Q?UiwtshcRUYoXtHo5SUI9PzTVJ5dx+6UxVddRqdlY8EMNyH22nwuGxh9m5H6w?=
 =?us-ascii?Q?GnS0/XwP1j/z5DKJsOxihGsj89xIo+DqjC4PvSoMe+AbbdZ1Yp9sCHYVRHsf?=
 =?us-ascii?Q?xVhkLT+TR0qb91/bl9YzXAVqHfEaX7N8bD3N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6j2DhLr9ZAF7cFuL+pM7QZaGgnqW5BrODjdxGXfZjXpxQ/u+RhOyQM86cj9b?=
 =?us-ascii?Q?np8K+vF+c7S3EX+2VPHee848nqSFhjI0uey0IbR2qJp3eP/sNTnX4cZBn8V1?=
 =?us-ascii?Q?7EflXWm4wks7Vmkid833NSSh5YSFMpQCTv2bU+b/XGhUxyTgZQTgMayI2JJC?=
 =?us-ascii?Q?Tq4VfCMQ49kN7JTOoI0E14DBlEBWtIORVdpfKndzFXgwwBECAet6drPYok9C?=
 =?us-ascii?Q?R6QhS+A/cp+Xw3PFQ3SzoGl9mrSWhhu4CSLjcmriYEdVtNzziyzebJBwh7TN?=
 =?us-ascii?Q?11EJRu+3ybCedIZsk62p1Q4X02kPU/gaMR9oGLyLARDeCOJeM2S7LQmLJikT?=
 =?us-ascii?Q?OlPi2M+5465w+FQ5WTV6JMAVx8Zj39e5NqpXsMkQDyPGWA7uczisLuwA/xY6?=
 =?us-ascii?Q?c6Q1cHh4boO/Iwc5gmZUQ26moT4bWCNU5FOUL1kNbZmDBwl/Qcpo6fehoRFV?=
 =?us-ascii?Q?iCsDXMy2M4AIjIjceLLsxiou0u1UJ9mrDn2gtD7PAG4oq/EDQmWFbExO6f4a?=
 =?us-ascii?Q?aOlT7/HyNpo5z61ejmUQyyy/raekcc7S6JMAtBQQbIVeQrps67KiagYfOlbU?=
 =?us-ascii?Q?LvuUjfkMk3rCehXklasNuks4R2yujUzev3AyFtoi4i1oUOYvV6/d83DQsKwG?=
 =?us-ascii?Q?tmL+DSZ4J5it5zMyQni1rxthnts8i6HW+7dPYOo2P9yoirSY5eQE5eKyf9qF?=
 =?us-ascii?Q?CjlJ7KhylvWuBEKN3qLq1Mt6F7Oxn7+zyRpt1wJPfhMV58oNLOFbYpv4mdGV?=
 =?us-ascii?Q?D4V9mq9qrkSQpJvbxDR0plV9PwMei2A97WVGDJcS2HvnoaTn2APd0XVVjpdi?=
 =?us-ascii?Q?f3PU25/EJi5W0V8zbEpeB6cyYaqYZfu7WJktUcaeOxO9Cr65ciiHLMMnVz0N?=
 =?us-ascii?Q?7VaaQ3mHPWIXhjhkHSg8mWPfDZECxd0plRQQM55g3ai8C/CowsonRSKzHCcU?=
 =?us-ascii?Q?uhZkJlDmMeug5E/zraJqitOFgBlIPEGqnDcZ2mBldcBDTTCJo9WET1lzUx8a?=
 =?us-ascii?Q?OzExlQ05HL4QUv/wbnJlVvq1CRinYqxcR4EDWzsoeLas+tHkFTZ6onCV1Sva?=
 =?us-ascii?Q?5Ogu90MfHICc4oiaL0pmQAUTkzY//B/BI6Gr6zexrVAkcg+AVYLH6YKb3/KW?=
 =?us-ascii?Q?CwWXMjzLN2IEFZh3c2+T9lNxSC8P2PMfPGJortv5opPhKygebGcliOzliMJb?=
 =?us-ascii?Q?OsRvjhm6WTwWL4KubsvTMVFlkQToFTMS+usu6CcpYCJW2a+FZNZgP3euE5c4?=
 =?us-ascii?Q?ZVWmvTsBCidgNquXvsKtjjoapuRDWZE0t11x7UYBHm/IIzqJM1a683hQ+fYb?=
 =?us-ascii?Q?vLwy2R/YGOIj41C22xEo+E8/rGjl6q25kAV07Xs8e8fcNXEWUrSODDH+Moty?=
 =?us-ascii?Q?o06oJmk5ewQ3pa5ELh10IL7vRpYWsPcGLHUIm5++GAYuHIyiX4aMtbOlK7rx?=
 =?us-ascii?Q?alpYpE590NXyeo/KizGGSYXAqzRG4P6H1Rw7Kcs9q3fSOqzdJ+qe4YXYCA75?=
 =?us-ascii?Q?YRSSh6SOzWYvwMe3wEaQAlqzNdpGPZccFn9w4hfvhhpxDTiarAg781/dLT0W?=
 =?us-ascii?Q?0r819/FGlAnuQYmdN7Ie2BmaVaYS+kwrtfc0FUtRliK/pw2D+w4qHoOLTHMm?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d34452-57bb-4236-879a-08de1c6c9fc3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:59.6454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQpAYDSNlIT0vbwEwbC2Vo2V9GwJfyWyYE+G94XFXwx9tq8zZ/CS7Wos/IAWDu2KNFVgJ8bzTL+YfGOY3cAGF0KnsGVEDUkSWXzfme9aqW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690b4caa cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bAEvNWUhtQAuDjgBHnwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX0FJZoI58F14g
 hDkQutbXQm8ZzKS9QQHgCi1PpUQObJIhDALKwa5vRWe9P68kpwX57naT2NH63rI84VC1ySfhEzC
 abxim0sHwHcYtOV0ftOVwrFC5t+2RLS/7W5Gx7XznIC01DOyu9SNDpR58DEf5j8oG4aDa2VOlpp
 tEmLLNEs9T3Ol1pMowNtxUzMIa2c+txQ/3Zuwdk5TrWLbGmlI4wwlGtB/NTZLJbdyVghLKTdQaB
 YuOPV+uo+RfBuxks06mOdwCMI3++ggGslTQXXZBq3ZnmTDaehE8w62uhJ1dmy8T9GNmos8C/wgg
 bFn0viPstpn6ZqBGzuV3IZYjdhS/bQi2dxPOQAfgX4qG5OosZLMeMdtbXurO7jpLBwbeuyAok31
 z3bXfGxAAi3/ungXV5R+xZ41bT63YQ==
X-Proofpoint-GUID: YxI_w93qtpE8vtw-HFs42Lp8ScDHahBj
X-Proofpoint-ORIG-GUID: bca2liNWJQqwduuJ6A1LEITf635Xpc1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225764

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after  enabling rust for linux-kernel

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 7a115bdffd..98cc71e137 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 KMETA_CONFIG_FEATURES ?= ""
 
+RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append = "${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


