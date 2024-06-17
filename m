Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8971C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:29:15 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.55477.1718627354880774305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=BhJffcQo;
 spf=pass (domain: prevas.dk, ip: 40.107.105.56, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4sWP69XwwWBE7oxe+uQ6UZ7xVff7R59DnpcAxN8fsikZG8OLPcetsBln8MTpu+5epP5yIBhnxeiNXIq/oyrEMGBa+ijg4hABpam/HiYNI7XSxO4S8JdkJCwTActaW5xioP3gB2b563qLCxnXIu+u4wQpATi0VJJQEiaOT5MDzFBh+P0Gvu3K8m/UNiRT6F9o/XFYDgrLuOssJSrXoGtZ53zM2TqveOUUDpLxBqU2TsNP52eEJW12oOZpsx2RO0IeuUdsfkn0v2P8+dcf9CoRuwFrBimjYdbKhy5q6v49EfogGVZh3bVX6hEcL1/JPiKHG1vuX8rWqs5UPFrdx+w1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we+l/gioKNV+G/1tMqAkhduSqp1i9hxmFDlERWfj72A=;
 b=THH8ZpNXLC4C9+l94tfgYlTvTaB2WSxdjMTp01x7uVDU5sVkoyDzqcbCWBcvxipQhJzx5p8rqkCYXof4a6MCAJWF4SzO1XuTL55u8uhiRjfy//Tt6Nk5Bmx2XYDcfijw35+veZJ8Mj5qlCyi0pIBqtqVNk58xepc3ssQPPTjsgITZDVD7JlC0qWWLI0xROsniSqiiMQr7XJ5Ri0iq5neqNL0yyNVwdMhDAbvstPjv7QgUztoH8Kuos9mAzpwkk+pA/ceCjPBPCSskyox1kQOY/sSUDzSb4RjGITf8HeHLSGtlyadDZIZ+fJt90Chp2/lR2q3AtqcZqeyUh95OeK0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we+l/gioKNV+G/1tMqAkhduSqp1i9hxmFDlERWfj72A=;
 b=BhJffcQo7sW5kZzm/9g3BkIyvkYxvhNry/UAzf+f3DieWa3+qxwLHDjvh7YXikhP+V5bU7nD59xzJzlrB7zkttw7nQ6R+ChQR1LozUFUz/KiZbufS1+f/sjNeCdSDxKhyBld42ZAs2AMMXyvEumo8XTYjyr5DpJZLSJozFhCX/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by PAVPR10MB6914.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 12:29:12 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:29:12 +0000
Message-ID: <e9960d69-16f1-48a9-89e5-037df6530357@prevas.dk>
Date: Mon, 17 Jun 2024 14:29:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] findutils: split into packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
 <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com>
 <be5f8301-f4a5-45fc-b784-9209d904c591@prevas.dk>
 <CANNYZj9QZPAm+3kow-jxW6XZi+hZG4BGiG2F2oB=_tBqhC1-hg@mail.gmail.com>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CANNYZj9QZPAm+3kow-jxW6XZi+hZG4BGiG2F2oB=_tBqhC1-hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::20) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|PAVPR10MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 9730fd50-d88f-4c45-af68-08dc8ec917d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|41320700010;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qm6lXQu739bl48YkZ6RD32qhJP5UJCQPnUlzr6CQ/nwicDpZQ8kmSH++lZvx?=
 =?us-ascii?Q?qLrO9AyReTU/dEIA8jFkO1bu6fFzGirl7P/x5qBrlPQQsI8Z3H9HWyC6KUCt?=
 =?us-ascii?Q?0XnSPGV8kX4iOfpzyKrg0a9zp3D0ZZK8lYg8/J/PtDRY1vYuKOQf2+KHL86L?=
 =?us-ascii?Q?8v0LfM+/+QA9zn4JPVb2JZ+bJOqqHBSv1zl5LJuiPUCMlgCuUMv1V6zVqFeX?=
 =?us-ascii?Q?brcE4Zk9sM8hdKYQRIpsZjLqEM27m1X87H7rs6CyISuLbzQnUG5RgNZsfrBl?=
 =?us-ascii?Q?SHV/kzOB1W7EFg4HgUgMuIG55NkW8lVA+to66sGjjLoAHjX1r3rWDMlOp7kg?=
 =?us-ascii?Q?MN/yCIPN7dzX8XcPeU0X8QSJWYjtFECvm04I14tZ7m3QzGMMdWdyozaky5B5?=
 =?us-ascii?Q?kSB7ZrhFjDatKL7FPCtvucC/G9RF+ZwaAQZXSKemJbmoK5F+iUQI+RLZ2Xjy?=
 =?us-ascii?Q?Y19v01b8GTa3ihbS9nUqVrA1WkyZjuKKVOAdFQKA2vRbAdeVmE40jeDkB1hM?=
 =?us-ascii?Q?HiJyr1OfPGAPqTuDoSBs5WR7t5hhM6wQBKb7HWHDfJXsvxJQvRjf5XvLVHlv?=
 =?us-ascii?Q?r1BW87gmQQfmLXSPIlP5jUL58bHYCWeFmvdwU5rr5fskNV0+CvPdku1tZdth?=
 =?us-ascii?Q?P+Mp5y7KXqh09LZJPSiMrHMy3vqqGVJgoASoJj1Wp25em/XTMtCwIm+j/7Nm?=
 =?us-ascii?Q?nmjemeKia7UUW2bKwO8WqNvS8zZWopoXDl+f+lRqKBCBV4GRDk1KAZevIg5u?=
 =?us-ascii?Q?vcez3dFoIDb+RuCjofwh+8eTq2xC7DpgVPEryspCSlOAWgaTavnTxUQvYf9N?=
 =?us-ascii?Q?hB9cc0NFckGqVGbyctZxZEpxtzG5Sa0PmALcyEgnEmos4GfpEhAFbBmT+oa1?=
 =?us-ascii?Q?LPJnDrlJ5dhVmTWX8kPOP7ImN62uNCnMUCSiuLT4bklzdQt7OeQjnZe688Ua?=
 =?us-ascii?Q?eGCD9u6Lk3dhlowitB7v+HalyK95fBgqFZXcxJJjk3YZtsZrPbZid86ZIMw6?=
 =?us-ascii?Q?Bq670ItFpHj2LlE+tuScx8SJkSnBPCKM/NzrWRGpK29uk8mEYz/i0zs2iJlx?=
 =?us-ascii?Q?xH6mrV4iMkdf/1Z2wdzfCAy97d8n0hPpLUGP0KNE59SxnttCm+ls7fqLaFyF?=
 =?us-ascii?Q?mOn6If3b/JTjjw3MdM919dYr4I2ISU6lnga+GfB7UlvGAtQepRZZHumvDdUu?=
 =?us-ascii?Q?wBObvyqveuPCKOH2qwuCpJ3F+coNpWzNhEElxLdlTA6PYPfK/LRiJf8/UU0S?=
 =?us-ascii?Q?WObKG5sY2xMFn5vH60niG0exf8GdKMbBGbRoWVRvFjMqcd/kBOaBGfx1rVMK?=
 =?us-ascii?Q?bTOXYKqvSQHBw4xpUV8Yyg5K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(41320700010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZH5SyHfgE1OjgClKQXbltlYJ63oHGZxdG87set6mfDvWBJYRJiZlUb3lDLTD?=
 =?us-ascii?Q?YiBUG0K0sjPmhcTnaknJTcku7tI1+6MLNHVgWdT1t7WyvSE/tzt0InCPI5jW?=
 =?us-ascii?Q?IRzVwKPpbBaHUfIo/N5f3tAkLxQmuyETnaNEwdvmp4nQssfYsgP3QLbamwFu?=
 =?us-ascii?Q?yTLn9P/l5du2jllGFSIlF7XcziapPqr4agNHFSH8dDGXM4gkeVEkvhYAKKiB?=
 =?us-ascii?Q?/b2aO/z9FUdS40YJsk8kt6wMIxo0CKaaYomMJNR6cvyxkq0jDAaRAU2QJAy9?=
 =?us-ascii?Q?5UEI8iEky95MrKqgX+sjiiXda+ajr3KsOUhtooIGCVakkFiUZQ9mBkiRpc4t?=
 =?us-ascii?Q?8FbTWcwmlfvBg0c9IJKSBulgq1W4f1IItRFEcLrI4EJMgMlZtemks+60NP5W?=
 =?us-ascii?Q?QqOcgkg3KLgOpaXbRKSPqB0hFqxd2HgiPsorjPMhGXRkqa+azkOVZzX+653K?=
 =?us-ascii?Q?maNJN4zQ9lmV7R790Nr6kn7EII9sUqjsjUrOe3cPHNTS4HdNHuObPdvfwg74?=
 =?us-ascii?Q?DS13iIqOxLnQL7oC9kq0vXGpApx6eJy9jv3V+2Mj4Q6EG2BRWovxsAqUmG/z?=
 =?us-ascii?Q?k7jrR0xRDN5hPx+77cC8iklDFuGsH0I3noZsFvl4Wfn6SDW0TDDfrtpagmFB?=
 =?us-ascii?Q?hxFgukwl6jSUfgC5cJGXfqQ1a+eQPNuOoEesSrvG6WpCIQniBXVhdp4F3UpY?=
 =?us-ascii?Q?RY8bIfjsQsdPeh1Z2Lb4lAwB7jX1421QKyHIvf56K6JpdCFbz9KQ1UZfTORO?=
 =?us-ascii?Q?ySJqPzYeS9MNI27JYqva8E83OTRQ6AAxQMGxAX5w7n1rl9ptBjK1kIkAK+S2?=
 =?us-ascii?Q?CuEn1FlRgv+zGsakLGzJqOm+cK525Yj3NofL/2OQoef9x7yvFLhiA+JyGY5E?=
 =?us-ascii?Q?EApdgiLvg4VKmta433CEf7kgFfhqmYqiwZwWF7H+wX/b+wS/g5qnQNFurJbP?=
 =?us-ascii?Q?Ou6H05mfkE2tBgGqnN7BIUcMLnFV4WYlpobzCYxnqsAJlFxLiJR+5+/v8Vfi?=
 =?us-ascii?Q?AobzmhG+uvcuxJifnZT+dAlfU4rvePezvHbGUcyr8Wo8N348PTf72bkR8SVj?=
 =?us-ascii?Q?xNs6MS+kX0HdBZuFOorxqN3l96L/rLS0pVdk3IeJl/uVc3vlzutgRyUxpeJh?=
 =?us-ascii?Q?YpUrcCzEAzF+8tLFdMQKIwU5kunpWQg27m2HfwBMeIFQiOj1yBU2HcCF8CZv?=
 =?us-ascii?Q?QZvZXYxZZvq9ufJ2Xi6f71uJnDDgDsK3j8Amog77nQ5uLsNeN5q3+IkEASm2?=
 =?us-ascii?Q?mfocF0/jON8psvw10hCruNMNXlrNMNUQzbRIiYR51lHk23xIMPleoas5QahT?=
 =?us-ascii?Q?YaKCOnWbUKRMqLutIpS3S9K6QVrElPkhKiOmg9qbAtwnh3pg6yrXNBRxTRM+?=
 =?us-ascii?Q?JvrGRvYLv++MJkpwkAQ5IU6oIpO6uzPBwXT8bCnzzxkqzhZVPLFM5ETedzbr?=
 =?us-ascii?Q?2SDHoqa37IRLShp15HaJiXLvLGV0b1LdExSmibi+CGTSwktKRf0lFPqhUobq?=
 =?us-ascii?Q?JeFy9fpqyFVROfINP5Bu/jvjf3sINRVlPzDcn9bSiqVia4X9WGrPvR/3KzNU?=
 =?us-ascii?Q?Y2sVpHkUyPVN0uanfd/W7kz9Qh0dqMvdv3TIM511mrTbBgJVfc81IDA20fMb?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9730fd50-d88f-4c45-af68-08dc8ec917d8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:29:12.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85LQqIF9W6l+U8JeIBFp34DV3HVwJSRSEseJO9moJX61amTccLv2dIqcWLnEt/gUZXNw1ha2ZQD2OXDe7O80rWAkrggrCU960pgFKOR4uxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200834

On 17/06/2024 13.43, Alexander Kanavin wrote:
> This then needs to happen for all of the core system executables,

No, that's not at all true, and does not follow logically.

> not just these three ones you happen to be using.

[I happen to need just one, that's the point.]

> Packaging should
> follow a policy and not be an inconsistent mishmash. But having a policy
> that splits every executable into its own package would be a maintenance
> nightmare.

I really don't see how this is any different from any of the dozens of
the existing recipes that show up if you do "git grep 'FILES.*bindir'".
iproute2, e2fsprogs, psmisc, openssh, mtd-utils and lots of others
package binaries in distinct packages (not necessarily
one-executable-per-package, e.g. mtd-utils collects the ubifs and jffs2
related ones).

> I=E2=80=99d say this should stay in a private layer if you really don=E2=
=80=99t want to
> just use busybox.

I already explained why relying on busybox providing the necessary
applet with the necessary features is the inferior option. I also
provided additional arguments for why allowing one to install, say,
xargs, without pulling in the locate binary, might be desirable.

Rasmus


