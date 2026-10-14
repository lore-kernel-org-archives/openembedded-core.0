Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA4C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 17:54:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20477.1792000439590549823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 10:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wEFnjlQL;
 spf=pass (domain: est.tech, ip: 52.101.72.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkO6dIT978cTVRgM0kWcfv0J44CldS5I9CgXPFZjtDb6VkwrwQST9BfcbVuSciToaEMEapaPUvxfXJTvJ9aT/OcxgIHJhXsR8et7uHYTweNr8uvT+UlZI3b5kAxKc5Zkpst9XJVcQRPuj6c1gS8xln4aiVqAhkg+3hg1G0v7pHi64x1tFG3i0f6glpmKe7NGty05B0NvXe+4jwZBhi3E/l5U0qRGJa71VQGdtQzE9y4OT3D0VPhf2VctiALCvaPAE5zJmS1EsuIdPx8kAkCdA16XFD2EqI0nr6dfYU3kRNMTox79uuZ6vcjLrJWmiuLBoFXAQDAi98w3jQf0000w0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFes7N6/5rLqEtSaBBLhPFiSkxbrx2lY83GFKrHBUTg=;
 b=gTrtD0rG7uBV6MjGTJCL0yvYqJnHg39uR5nmwBnerLzzHhcI9MQwvQMQdrXpaKircojlo3kL87FcjIkkCKrlwV8TnoXelWrDG4x8pMX7E2ybWYY56Qwl+fKj+egJ3+VqgXRPgNzSfU+2zuZg2WPuTBtFC54vXAxssDZM+Sf5M/SVEppwWIYPJ72VXm+EA4nE2haKjqWOrTWTSdpvwftGkv59Acti80xANdekFGnZFyoxNn0DSsRgKQVDoLcAU0fcjUZwF++nE9f5Q8oJ3ZkTUJ7n6m8q9/OnJv1gDgRGsnzVkfDTsY7rIj01THoCEbjFXFsIaAPskN1NGW1WpMhamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFes7N6/5rLqEtSaBBLhPFiSkxbrx2lY83GFKrHBUTg=;
 b=wEFnjlQLZf9tWTJSvDRa89o/RNyE+mye+eMjkIWqJOaqRx7SyNPedEEKfXcRDT5Wo34j5waVVFm1F2qAZvCV3Z9fi5WUY3AMTpHgjRlNL0ypqL974g5gv6QdeHdXGrLg2iGM58S8PZySVzu15+AoJJ9e1ejIR0LKTzDYAmqn4dGXwVX9zaujc/SnrdOQ5Q+T0aqVmXhVUthucx1YvkSj1CHf5BXHi7iVXEATQx8RU8N9D/rXoWvzPaOKYhcGm1AMqLxl6dqfjJLBLi0srjtPjeBPZUtjjBnGmB3n80AW/biAXQqTRJMZpjr1APnr6Hhu5RPCYDYsOs19kkoAw8cpSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2202.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 17:53:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 17:53:54 +0000
Message-ID: <041c3f63-1951-4bc0-9961-ea6a09d41f9f@est.tech>
Date: Wed, 14 Oct 2026 19:53:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3-more-itertools: upgrade 10.8.0 ->
 11.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
CC: openembedded-core@lists.openembedded.org
References: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
 <20261008182158.8783-1-jaipaul.cheernam@est.tech>
 <CANNYZj_jMnU7HKc+F-WF7NooAG587zM=E=ucPrxKTXaCouRNxQ@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CANNYZj_jMnU7HKc+F-WF7NooAG587zM=E=ucPrxKTXaCouRNxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2202:EE_
X-MS-Office365-Filtering-Correlation-Id: d4291721-6a3c-4e94-f46b-08df2a1c1cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	MTY4G49PoshidkoNMUoILezIUpoG3jEh5HvDgHaucXt/5KsfcOsEOurOIYonH/41MtyhnXLZTDuoLvNDQTYyd12rDqKFfCeswq05Zi/c3RMaOpEIHbJU+tSMB5LqSyX7beIqgMBj/t4EWfjsrzqSEVe+MsBKrZOp+5NkbQDftBFotEgMNo1fw0n8c2vq+NToqefMYgs3YAtCzF1cKjMVM14cefR2ykDdSYVQgfU2YFX3N7Q89PINn1e1NJgOODTcyPvQfQMjDPGLJT+xQfUGuLEZlS2Xyfg7v3T2toKxt1f+BbkTbh5JucwYlgSMkTcHCVZ+aZs48+io4oHSKfiat5YR7C7rgaNyGjCV4egkT3lTjG3HDor8jsGd8dCFdS1rzQht9/NnUkkYdWLpxCIoXGd3faR3LWZPFLyCtjNgLYQEAnAZ/XnpXm4/XRF0vbM9Cw1A4QihNN1y3E0UsF3pTNsWkUTJPYSExxuBEcmWhLQUHg1+UsiKD0LLyPH0ikcCD+J7+pM6A9I0thsVVQne290y9U3PJ4ljofZLomVqyX2CzNJkfwV05Cknt5snQsGo7s+XxiKqYoWgCtW9zHBjYrlYVKjYxemylhjz0mjaBy7PEImEYqFT0UKpew5dvcDGIRMm8udQGAUpOlrY+vR1hEYhqfbt2fv/H+WIlM9FZAk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9uWjyOO5moLJaVS9w2EHp3pj8g0lNAKM0Cg5KQoDRN+zfVtzUT/J91UobUzb?=
 =?us-ascii?Q?zJJdxbe/u7G9/SKYYuht6OY+RScZnOkTkC8A+dY230Iuo+Vku8lStfBk/qv+?=
 =?us-ascii?Q?BeT/kDQsgpLf4mc2wUF6L4kO5xnDDFRwh1kGmZyY4Ado3fbXRsdoaChnzbYA?=
 =?us-ascii?Q?OTU0OeDskv9ikHKD1I07ZaQjT1/96GPvbieXfLMiGmqqQ0YqSJ7jLCRBi0LH?=
 =?us-ascii?Q?gQuS0xpJIjkBJaKkn5c2jMPPt9y9QjFq3ZY6HZd/P6RXHG96KTJT0vF3xr0M?=
 =?us-ascii?Q?uQKcpnC/kywxcDvqXXDFaF51ZgDL4hdZw7o1h20xt5DNGhP1ZdfVY4Gdv5Oc?=
 =?us-ascii?Q?WtXp8E2lMcxReD/RGyqDPqWrhMKXh+nw6f1Cxgm6+wZpsyBDIA6QCzPwLvp9?=
 =?us-ascii?Q?bvHU/oTmg+0gyv9uWt17SuO+I5CbuM+hYBi/lMKPvT8PEoKGQnO741OVrXyI?=
 =?us-ascii?Q?9hTSmXgKFU945VdL/GEW+bXxAvxjl61R/xB6KaoL3e2RUd1U+MB2CpZmHY6A?=
 =?us-ascii?Q?e+6Avzo9CXdxP0F9YhLUzXKm8yWi3E6ns+L4iKxU6U7jsSeL0E14pfHm1i/e?=
 =?us-ascii?Q?XZAmD3bg8hXKNMBl9xY1wrgZV/Ab386HfhCn1AwzfrSKLsocjZeYOQSGWCmB?=
 =?us-ascii?Q?cBVaimW3vrlzzwm+E0yX472KVLrPQ5cj5nFzNyULmSbujXSNsBvPhyF49S7x?=
 =?us-ascii?Q?9brfRdAmsJ+ZGV8mmEFp3xLq+wcRdVZ8c0XK+6SLSYe3fFVOJlDNEQ/d+btH?=
 =?us-ascii?Q?lX23UtyqPqbn6NkRqbmB/5AY0X++X6glr+ybzGpQQsYakldcHINYuOgGnXrC?=
 =?us-ascii?Q?mxBy9WsU1ng1PHzkTlwURBTLV91kcsZBIuyXXrMqD3k2FuDgJ9MCfEssv7vP?=
 =?us-ascii?Q?/9ZFsRJcOJMKG2ZIfRq4jlAygRLS29FeGRUF65mcXqQmN+bVAxpTM0/+91mU?=
 =?us-ascii?Q?/YIuH3Hxx1F0VK9RqNJb1e5v5A9rPbnzfZwd78Pml65c7R1HVTDExkyumrhv?=
 =?us-ascii?Q?qe+INUzEC5Ro4SesO3j1ko7gcS+F71xAGcK4B4JCePe4hn3L1Dm5UeXeBnT2?=
 =?us-ascii?Q?E4FAMRcr5SrxFYxbbhhxRRe5pL37CMQSi/hCHCZLjPY+2xnMc5I8Wp5uYTxe?=
 =?us-ascii?Q?48mfhYJWJwOc/FgfrO9VDOwDsetgoLxK7L0M6/Bc4sYOAztvaG5bLP/R/3nP?=
 =?us-ascii?Q?CbpZB2m1wPOpvX0IaPzLZD2xDtAMtvjqrVQ06pC82Zp2mo77nCzCwZwUH271?=
 =?us-ascii?Q?GBxL0Q3n5RMpGmJ2DnKSOY1MATtT4ykrF0I/NS8opMoMQZkSgCtKmHKtSETh?=
 =?us-ascii?Q?klhQ16kI4EIBiimBitrUFkebd16MFuUoGoeYvnqvb73Ujw6zzwD9Nye/Ds9u?=
 =?us-ascii?Q?OkWpxl/0/qcZr3wV4HBIefcfo2HYD21mEdmBbJ1rG5CdNJHeQZvjPW0zxLzJ?=
 =?us-ascii?Q?xYBkGczq2vb4yjbFCA4Uy8tQyy+NLJ8rSQ7nA8wd+Wqc1v+P4qp/FGH6TiZE?=
 =?us-ascii?Q?YYDiR64XrlU4lnhNZv1G1j1TA9hc+Nohn6DOAX1F1ZD3MtnBvU2tdeOtfEm4?=
 =?us-ascii?Q?TcYBAgAEXMXc05ociSTC4hT38IawZfx1AQmkyuTflLEyz0iFHNhWDF+0NGuN?=
 =?us-ascii?Q?Rpl0zK9zocplPlF7GyUbfnd0vww5dtWg4GVGOoch36knc4zVsPsmTks3kEOr?=
 =?us-ascii?Q?76W0WAjL6FDSiaK1uxzx3yseWdGkQl95j2Y/qVc5173B9KztGWMsdttBmMsI?=
 =?us-ascii?Q?Ulvaq3eomJrmzmDt0dBtcXGtc3I3/Q0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d4291721-6a3c-4e94-f46b-08df2a1c1cd1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:53:54.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXr8nX6Vshi09Dd4ZypbOMyJ/oDbx352Dcd/PS+UXrvMbJcpoJ6DszAmap4lVyHFuvn6oIUpRPjNyJVxh2vD91LdeKMavXZHpkmvCGV1mPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 17:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247793

On 2026-10-12 19:10, Alexander Kanavin wrote:
> The consensus in the patch review was that a nearly 100x time increase in
> TCG vs. real silicon is still pathological and needs to be investigated
> (assuming all targets run exact same test code). So can you look into tha=
t,
> perhaps with guidance from Trevor (or maybe Trevor can also check what is
> happening)?
>
> Also a 1800s timeout when the test takes 1702s is too close, and that can
> easily go over on loaded autobuilder machines. For reliability, it would
> need to be at least double what you observe. But if we don't make progres=
s
> with figuring out the slowness, we should probably disable the specific
> slow test, rather than let it run for 30 minutes.

Hi Alex,

The actual test is 100 threads =C3=97 100,000 elements (10M lock-guarded=20
next() calls)

I did tests with different config combinations ,=C2=A0 total work fixed at=
=20
1,000,000 next() calls and varied only the thread count:

 =C2=A0 =C2=A0 config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native x86-64=C2=A0 =C2=A0qemuriscv64 TCG =
=C2=A0slowdown
 =C2=A0 =C2=A0 10 threads x 100k=C2=A0 =C2=A01.35s=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15.5s =C2=A0 =C2=A0 =C2=A0 =C2=A0~11x
 =C2=A0 =C2=A0 100 threads x 10k=C2=A0 =C2=A00.10s=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 110.5s =C2=A0 =C2=A0 =C2=A0~1100x


Trevor, do you have any suggestions how we can handle this situation ?

If no other options, I will disable the specific slow test .


