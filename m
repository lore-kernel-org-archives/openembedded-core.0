Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E983C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2041.1790663734691674841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oaIWrwHu;
 spf=pass (domain: est.tech, ip: 52.101.70.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2e9lRlpe60Vn9YHbj0JEoS2fx/AfLYtZm/vXyKhHAtWh6eOqnFM2Cc6xrGZR/M9xalitNBVsgIjmBRUmq2KicnjJbtIZq93zsBrnEe+88JfVrcAc71ZyUL5rYq1w06zqsf8O0gzVYvc4vMPFRzEPeZvsQKYySJBZO4EotqIIwuR+uzkIuyA77XJnRPuk5LbyvDaklHN+zFUASX3F2giCiKsagWYG6lwJiyMBYgknO6vmKqUzjoq82rWipKW2O+7vkM6/gHf0n06VndvJ5Fm8DOjcboBKHtlPfq5HLaKzjqWt0oHF6PomEpA1vleyAxn0VP3usJNvNW87l2vqVYD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPg/DWMw68xjEjVlrms2W7RMGLdh+Te8ngTEgfDCzV8=;
 b=bMOk+86O7vzIGqSZ+hShYgjtrk0PX/WT6gzo+W5nEvJAZgFr7EaNZYXHzedsGDxTzzcryl9kr2RvXdIpIcF09CCICmJugB2tzlo3QIeMNFuLQKJI3Vlw9E/VVzn8+rf6Lu2m0LLmQY/rGEXfV9NkCy9lGGWJfFB050riX9u/QfGiDwwK4n1MGHtMr0AmTtY6dngZkEV4w5lX15DpU4/X5K3SuFOPB4bb1jK64uXCEbxGQpq3+Vdnd6N42Wb8GmaH4YAYtty05MzmPjiKESUSNyzcrThn3bh0qH0JSiWJjZY6Ps09Nf2gEUFWVgcbSvJXm31JMbrqLYROJUanzJVEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPg/DWMw68xjEjVlrms2W7RMGLdh+Te8ngTEgfDCzV8=;
 b=oaIWrwHuDgPYVfq9mKLDKzgnGi+jm5QpUOMFQP1Yr+gH9XESRW/0gdcx5iEUQDm5p+IM5n7SLw2Jqofm/BlSFLqVKmDypUQ189uQmM4sm69Jut2CKzLWYdJmG5X5KOpocBpnHErf71GzTwm6qPhX3DPG5XPeNFDAMKJTuMdTYg8MZyKCCxzNsfIrGgEYLKxbPJU/K7uDwcQLRx8yS4A7WO2U35hoZdmX23O5RN448JHcODzL4tHBD/XQfWIOQylbZXw58kBKwVH8501h58h4RbFquLmdGPBOX864m90qk+ccUk6r4Bg4mcOc2AFm547S/uZMA3TKnV/Puv/UouD0Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0699.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 06:35:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:35:29 +0000
Message-ID: <3795cec4-d896-4696-a6ed-cd213c3687fc@est.tech>
Date: Tue, 29 Sep 2026 08:35:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] systemd: Upgrade 261.3 -> 262
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
 <20260928113956.42485-2-jaipaul.cheernam@est.tech>
 <DLRL8NE66LKR.1A2L9RIPB0U0U@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLRL8NE66LKR.1A2L9RIPB0U0U@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0699:EE_
X-MS-Office365-Filtering-Correlation-Id: c51fe834-aa39-4bb7-668e-08df1df3db00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	4PykvkWG4BTDoWdNViW/Wqvhb5LhtNzxCCmxcXs9XRM1qZZf0ZQMRSnzR2KwUgLk92M5B4xU20FhEKpyRxuj93Azw72lk/hPXtJ2Jxrz55Z5WthSaQkwZZ1OfW4WCLx849fU1hruSWl/lo+zZeD1RTMIrjKhjNr3p0iuIOIMJp4jDwWioD8vUFbfBjKUCnYdZ3KWIsixWPhMYejNnu/IUXV3nqXfbHrq1S5H1PGrBMxn5rPuai+jOvs1EmeIR+qHeDAP6xTKAKyhTpc8GL3WkOy9x3gUi0Hzqq6ideF0F0qQZZcity3RvhIYNVK/lbXJpsKZ02gwcgvX5RjxyUu2FcfbK+6s7iPYRkU+hPjy/IryfuCycV961RcLa7KLjE3TbWNNTwXyQjkQeIFgEPc+Edeon1m2TG308Qn1tewFrZfeXfLt+4+HkSqFeWUjphUzj3Uj87BX36hPYBQd2ihzvJWhbs1wY76u0b4bwn0JyJGyFBGDR/2qfRr7mza1BL5WvLk2G8mv8JdWsPSphe06hCodajKPmrrHMdjl4GaiCwMlppLi4T4/T4xqBzm1/usNMSFvJycAiBhHSmzdaNuqb1ITaEQ04T163rqFh/nWciUFAEjNCrPacB7pNB7ajGuc0xlno/husMB30vtBhg4Af+wpHlrk4BmNsgMGXgkHfO0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sfr+xb47EhARs5q3SeLn+kmy1vSja7seZjrQFBnn0ZRzXD1+ARd5EJZpuRfr?=
 =?us-ascii?Q?dByUIwe+ZW6O+NTsAZzZ3BCUupIjAAlfKdFueWyj6EMdsW1xL37E5Bg4Kpoa?=
 =?us-ascii?Q?7HdkOgtwZ6z1Z0niZSmBzd6ybJau/J3dTZNjNmG3NJKsRH+lvyEHzKT5MsYB?=
 =?us-ascii?Q?+3XUuvSdnM3HyTEDTeGk++pnubU8yo9IDbWesq8TpZptStcUDbhUtk4Cq78I?=
 =?us-ascii?Q?PWw5SpWnx2xXr5QIDfbe24e9WPr9QAwrazZwyCwzWRLYfzeMED8+j3BC/kRl?=
 =?us-ascii?Q?5KNUcj/jcE/4ZSasaf0reH5Qa5WHQDgrHvXR9m1S30eDKR7O5nq9lCUxMGzl?=
 =?us-ascii?Q?YVO9y6kWockSTprcoUnh1UQzK8Qh5Kl5TNvVBl6YQ3Mz65zzPjyE3IC8Jb+8?=
 =?us-ascii?Q?3l/BuNW3fZJWsM84X7oNqvIq7l1D/0I22AdF9lzdEz6JTsj94hdxAQzfwezs?=
 =?us-ascii?Q?kDmlV2R9cwVBqsBbDhLpnOUn3e8aHB1thi4H3jbWgr1PFJ/I/oefSCNWHbME?=
 =?us-ascii?Q?qmdYWlM5qV7APz1RTzV5lV/H3X2hCKufvA5i0jQDtAOAHtmP4RL3KNWqu1xw?=
 =?us-ascii?Q?qGtmgV0Rk6liLcxBJEi+nWdl7+LQCcI2PmBFgNlij12e+VrTktcE6tAMvCr7?=
 =?us-ascii?Q?IsUbgGZ0YTud3n1RPiIoJt0O8AyYbzm+SAGzqIbNX/5NkamdSZYDZH0K9lg3?=
 =?us-ascii?Q?HG2BZfT1q/qHOajb6QHXFpSVJ2uXP9P5BSwEvWXxN+MIbcrDFsozAnd7oITV?=
 =?us-ascii?Q?Jh3MgI9WZW3T3xr7yz6ujLX4tZJJ9M41OBCjvkBSSpfhrsARElM1RVV/1vfU?=
 =?us-ascii?Q?paP9wEOhdBwigEVXIGisSlL1odGUfHCE6YNm7VPNBE9/eGyQ5vEGYkJNN17z?=
 =?us-ascii?Q?azwX4AnSrjNdW2+xtNZrW3aQq0vZE/8avH78U4FzVt94XEjQN//LjJTGcoFx?=
 =?us-ascii?Q?XfuPfIb1jLCbdkv3Qni88Q4nCGbczGuR/AEjqoR9dU0EEpQBsIvmtwS4id80?=
 =?us-ascii?Q?N5wS+TNgD4nRsacB23BKIbKZkkkgGjRRkG09024CgNTsv12kwDyNTBddGz21?=
 =?us-ascii?Q?UBvFr/SkImF4NdMCBe42HJGiUDG/o7QWC6pLtvnfShePQfa6f9wNrVYtvFJr?=
 =?us-ascii?Q?UexGnF9MJQgzWfZzC0YwBGih50anI1xegiLFmC5farkxhcfziedqsyRBcDAZ?=
 =?us-ascii?Q?4dcemXxXmePVz9YrBzYQ5WfbJGtEJQG2YiSskbttmB9P9F7odMAtKaWf9iBh?=
 =?us-ascii?Q?vSz0eXymWEKKCOhXYDCXLczHLZHqir9RDEkPGg2XjyudMNn1uctBd5DPEPsj?=
 =?us-ascii?Q?nd33neqhWXWFueGcZAhIpNCRSU9zJ9ro/npBJHY0Dk6viSoSFLddLx/FxDMe?=
 =?us-ascii?Q?f8gWjF1BmPpbLbJCOADKjjYohEMBWzxhve5KCVDDpjsz0L5fr4X315xvEMxC?=
 =?us-ascii?Q?F/NP0lAEI8bLA9zRrVEZNuWsCvoEx9tp4yBsugV+nByn+Wx6+g9zAuIuBihp?=
 =?us-ascii?Q?6tuFiOgGAC9OH6MAJpN0vxRwTJK0YG3o0BYdQLSVACLThsZylv84UwTTb6KD?=
 =?us-ascii?Q?WhV3dHOP93VhVk6xMUEdctn53an0DN6E6oR7o7bcuKx360T72s4Mk4Vt9fGb?=
 =?us-ascii?Q?CUeMsPCQcZWCq1kxTZgKepsukbWcNVdVZ85sggW1jJfVRSgOM0GMTyEtDllN?=
 =?us-ascii?Q?rzjJGwahxoBQhfbHBe1IquZGE2KaKNPybmMGEUi3r5YngGdzxuaWmbFoQLKV?=
 =?us-ascii?Q?hzk52RcJZg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c51fe834-aa39-4bb7-668e-08df1df3db00
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:35:29.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfe7QhwGUV/HvHowPIaRhCqcBnTsWh/OsNQi6aYV1DP2AwnD2KsQqE6qg8ZLTqmnp/XLLRXqtoWkWzJ6VPhRv4bZRPsaRmWQfc1x5cs/Xjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246843


On 2026-09-29 08:31, Mathieu Dubois-Briand wrote:
> Patch 0001-include-fix-limits.h-override.patch can be reverse-applied

Looks this patch merged=C2=A0 after I sent patches and we can drop this pat=
ch=20
as change is part of 262 branch.

I will send v2 with that change.


Regards,

Jaipaul


