Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6538BE64A8C
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:18:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web10.18874.1733231894253556187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hcaMOwIn;
 spf=pass (domain: prevas.dk, ip: 40.107.20.83, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA7FDg2+Mtfff79RGQiSTt2nTPGpdic4jigB/EWgIZqRgjbw1QpCQ1A+cB+XQTbgHahqMRBYt+CX1gwURv8P3UcVbX2NgELaYKN73uItFLi2jYsZh0zP5PsF7yX7pi9guHiJFRtL71V1//ekRggGgPMG0Puj420He+r2dNzPGQc9wvUlDd0xd7sqoLt26Sy1GPISU+xcnFb0uFPaBnsbDYx5hBTrNN7jxKMuwKbo7MVwtX7gcqKUB6qwj09KdWmaVCHDpriS7gyK1jazrZgmRNwJpA/xuf32aY4oV6NvBwT32a2BCfHghEoHSDieuOg3fP0tU8/mVfReUiWVBeyKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS5IEUg9TWR0Updob5FDSiUBRfXDP6Fa2DZUHGNWQ34=;
 b=ilIouHnledQ2wsrT1WO0fV2bL+cS/BMXZDX6J8kHZRErCNiPvwY2BjXrPOEmI3v15HUqp92nEq4kxBIwHOZ7tX8vuh2CNNdFo1G8AsImks5mr7p6iys8k3AamSA364YjUdAR6uJHU7url85Enn4tnP39bkZR1OyOQt+CNKmMpdvTcHGzzXGdvnAkx3iCSsWFjysn/E6feqlKZWzaUNp3d3mA88EcDznE6nqfBrqT01wnR7Pm3q9VLjGFVU+FT+tMu31uR5sUvyUIc705E3T6YAMAjwYxN3Sph7FO3I6nZJahC3LeoNLGjokMhChl2VLnXOZT4MnD+JXzFRYS5GH6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS5IEUg9TWR0Updob5FDSiUBRfXDP6Fa2DZUHGNWQ34=;
 b=hcaMOwInB1oaNXlLoI/1lVg/sa7oYf0WicaN5ltGivm5WVodc2T2Arc7FhBMiPDkFPYNcyvnXgXg3pVOHxAA5q6tOQSSDWaRwV5TaAoFcc+bnrpe3cWp9n0jQucPM+NfkR8QmT4jlBpoLJtYMg4/FBWvLZQP+jQko3nL1FzYI5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:87::20)
 by AS4PR10MB6134.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:585::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.7; Tue, 3 Dec
 2024 13:18:09 +0000
Received: from VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4e8:da5:4265:ce59]) by VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4e8:da5:4265:ce59%4]) with mapi id 15.20.8230.008; Tue, 3 Dec 2024
 13:18:08 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: denis.osterland@diehl.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] linux-yocto: add and use
 GPL-2.0-with-syscall-note license
In-Reply-To: <7568332ffcb1456abdd1677fabb9fc8f@diehl.com> (Denis
	OSTERLAND-HEIM via lists openembedded org's message of "Tue, 3 Dec
	2024 13:18:54 +0100 (CET)")
References: <7568332ffcb1456abdd1677fabb9fc8f@diehl.com>
Date: Tue, 03 Dec 2024 14:18:07 +0100
Message-ID: <87ttbkhpm8.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0074.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::28) To VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:87::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR10MB2477:EE_|AS4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b199e3c-a59a-4b75-8459-08dd139cee1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?63RqzLwyDjmFWUQm5l7xVAy8bEGtkhwO/el0IajjtQ7+nUjRQVklVUhZLqTT?=
 =?us-ascii?Q?RtvaxOb0Tpw3/UmTDK/kONUg3QN0X6/7JdZqmjF9shg5T6KJK+gpc5QgaDWi?=
 =?us-ascii?Q?IrdUo6RqLeh/N/feTmc6zw5CTYJpwckeUVQfzzDuP6WVq1ipQKLpXJFxq8YH?=
 =?us-ascii?Q?7RDqd/CmwxevXkSxGmZHfFgCxbhHKKZVvZxlTiIoYuL4AguXBg0eMfbltgN3?=
 =?us-ascii?Q?PVEAGRX14E5BKbGD4sj0nblzpAWrDly+Yxw31wPeYaaXNxX6itgEofBVm+BP?=
 =?us-ascii?Q?CueXIFXNfaXLwTwJ5weQy5DpA7tjDZpF7mMraT80/Upkeog4Xc4pnYh3TT1s?=
 =?us-ascii?Q?VwdZmC04RvMJCciuRGp12vA9e10sg0iHmKo3MIqUsKWtpPxKkJis3whqcYVB?=
 =?us-ascii?Q?LXIIVZmdINEugi5q8d81Km4Oex5NBR0R4tSdvHYrFCUmKRV3xAQo0quTBdCV?=
 =?us-ascii?Q?VT48Lt/M5jVgRj6F9PMZoIdqhsGq8YkLLjz+bffvYf6ZkNsjVg0hxkYyRP3r?=
 =?us-ascii?Q?QM9tcl1L+PdY8x8Y8iKqe6HaxYRaHIA43O4MKb2DJMwM1pYoQ0khH4QgG3ql?=
 =?us-ascii?Q?i+mt//UruLmgyUKeKqlP/5yg+qO7pT1VUQKq4exO9duDN3l8oOoSu+drGj8/?=
 =?us-ascii?Q?MNsEzrwpzIBk8bgfd++WHCJ6GOtke7eFQbA264z2ga2E8aGnROwv/z+M1bM9?=
 =?us-ascii?Q?m9PEI5tCgvRHAS4JA9QIWmEoCmxZDIPApoVQ3X3AzfWusZ8R6luC9HNlrd29?=
 =?us-ascii?Q?1b71MY7VCHiLDI+ck/Hfcg/FLb5bgo3gHZZ/vahbp7pycLnUxJTOfK27NgcM?=
 =?us-ascii?Q?LN+AsXtfiUKMGyZ8gSU10AS0v8ppmwuNPJyFEdoyrWXX0uVVmLfrGL/lig+k?=
 =?us-ascii?Q?t3JnG/XppWrQL8l1BLM4ZXEH+Jf6ZqyCZ2/aEDpz8hPTBcHqhtujin1vd5/x?=
 =?us-ascii?Q?eniSIY7vxYjCb67JHFPfA5AUhSlQbVd16usIDZ2MDq6/Ptsds56owlPDgZFv?=
 =?us-ascii?Q?LISYy9hB+yN60jdqW4gJLO1W7OY2ZGhcOSVdZbqt19TgWUgOe3VAB3P9d9F6?=
 =?us-ascii?Q?JldvAbngPTpkUx6thYmbkuJfMgb145dGRbSaI4Hy23RgY/gLVrfqdxTV4+oD?=
 =?us-ascii?Q?bEJCP6UMtFeXJ5Ht56/diBsWo7TQzun4vMIJIvIDBy3BBvUab/c+nxhgA4vu?=
 =?us-ascii?Q?SQ7/cKi3BuOk4I9tiKne/ncO39CJsfiexC1+gYKrHOPX07WfyK/31sJTCZLK?=
 =?us-ascii?Q?EsTnnD7qzWadRZdf0xmzWgsA+4ZwI6urgxNkl8gp0ZGQ2+xMWejtTUbbp00R?=
 =?us-ascii?Q?ZBy2fALWrTkWWNrAhj3ZeYt3IGzhwHGG6BCZjTefn/yYB68BLT3SFR6zRakS?=
 =?us-ascii?Q?sYT5XZXdwvggdjdwLrXcZKUEee1sDGocejOhnR8KzUmLBGL0Ig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PymQGRGjwb7atJvjoTS//jGpZ41BI7yfzfOdZ/1Xb3UbiyzSbi7u7zeWoxNN?=
 =?us-ascii?Q?ROGjBHnG/I7MjFei7rA6VYYGMeUSpaCiTkSDzWiYew3dnkDqkwoEH6cV9A4j?=
 =?us-ascii?Q?33U0kNElUPhOojVvVsfKOd0cSmLgrdpSy6e5XKhim6uVL57hrU+ed3bnkbNe?=
 =?us-ascii?Q?UsOoT1WNGVnul+DkCgXKBeIsti9xBzBJidCLaRkm6b/s2ZF+hk5iPJksg/Ge?=
 =?us-ascii?Q?7EHJSMXpcAXNgo4bBo2DOGyNGEdFC4lXIezg6fdKM3cMKvOfoGxDqq63Sn4c?=
 =?us-ascii?Q?SkBDbMpvGkVd/5+Dh88OYXbvDTKrnXlz/H2T3MLrQ9br/TfOVO7TjiaD1bHK?=
 =?us-ascii?Q?9A/P78XyvOcQjKcakrrdbVSoeyFRCd9K9+q95YbhGpjRaV1oOlmNiAdSmChO?=
 =?us-ascii?Q?d1B5F/VhLU0Y7QlnsJ8uQ0ayUajOeifSPhYLce4/48Tw8skxMplqAi6ECKOo?=
 =?us-ascii?Q?1cmL/AjJZEPszfMlv2AOe5Gxpb27xWi9eavSsX1FScgCVBW1bUxTFKUAZDg+?=
 =?us-ascii?Q?Tpyytp3saYOD4ZA015C5rEe11I+fiKhaz8Ts5Gggap6hTmEpQZinc5xsIMrD?=
 =?us-ascii?Q?59ypQ6WzpxYcmW+GoM6UgMvlnR6hHmszRZ+v3OtvUDrFf9KxC8iZbvcRpsRO?=
 =?us-ascii?Q?Rv315KASfyhSlSEqgYfTSNNd0aJ57crF9na2Jsnzeo1agKvXdVa7GgojGds/?=
 =?us-ascii?Q?sjYLTHzHNCFPq3lfGKo+ZR+Wg0LHtljLA8LgqF6RyLzVYsty66QXJI617rAf?=
 =?us-ascii?Q?sC9lmi3Ln2jm4e4CqjUMY7BiDBZKPEWymuuY8qFUuzJQl+6uzzW/wviyFtRX?=
 =?us-ascii?Q?a3Mp5CiFn87h/kKDUZrgod9E34tS7YnbuPZwsdlU99xGRNXdJqZKxDdVDH3z?=
 =?us-ascii?Q?Im1P3FfPnTtmVXpr5aX7DsnEKQwUpaG4GBG7PJ0ZiYu8zEqvzx1oM0+43ed+?=
 =?us-ascii?Q?BdgRDZY5INtYZnEeNQMYd2XOPOJNrNWmqvBUmnFNMvXoMs1ek1ssQ90XAuwC?=
 =?us-ascii?Q?8FPsPtPm6YA55d1/HjbS54uICigKvyNSLNYYgxw6RgBF/UDoeAvmuEeOQJii?=
 =?us-ascii?Q?gGXu2t/Z5qV+eRc134ShGiR8DFaSxS+6zyBLaysYdMI1y49/WPbDi9M6W+ge?=
 =?us-ascii?Q?5yBC10oHWkI9DHUhqD/N4BjHXnTqvKrNKaoHsgSLmsfZGuwA25J6Evvt5OHy?=
 =?us-ascii?Q?Mm3unlA90MgOa14fpR8pLD99XSWF6omQs8FgQpv7nyHLcY/Y36FD3p7sGqik?=
 =?us-ascii?Q?4kIo1GmBwGB7jt7vsfc6oSHFc7H/Hz55jrWKIttlrHNz/2FD93yUDoTrXErG?=
 =?us-ascii?Q?77gv5QRMTUT2GfcyGMHVR+FD1ymUHE3OI/nuFLYBbFkM0lJVthCNo/Z2rToD?=
 =?us-ascii?Q?t4Zl7NQSaUEWp9HCQOaCLpc9Fxrw7b0zozQjpmk0pUVUHaH5NkF6Ay/QjAoW?=
 =?us-ascii?Q?Y4NuR23JRazveCnml7GByQ4aKjO7uAL69F0tCGDJnGjxP0RBQb8QVcQu7eJ8?=
 =?us-ascii?Q?+MwzFENJ5wXsEjZEpUwCecFDzYEYqjp0Dt0fhknM0kD7khTFTvt4cvX/dHU8?=
 =?us-ascii?Q?cUlgsVU9KqPFZBEPEYAZ63LzRbxx2rjpcQWwhT1Yma+W8zy598iR9HkXRT+D?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b199e3c-a59a-4b75-8459-08dd139cee1a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 13:18:08.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2Z8BAJ8c26fR9+G2j4M4FVDOeEYNEzaoKkGTcjjCivE3VL+n1MsWe3FMQ4SQ+hrUH5ZLL00MME84XaIPVK4MYHxfaEl1EVyTYdE89mDbEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208188

On Tue, Dec 03 2024, "Denis OSTERLAND-HEIM via lists.openembedded.org" <denis.osterland=diehl.com@lists.openembedded.org> wrote:

> See Linux COPYING, LICENSES/preferred/GPL-2.0
> and LICENSES/exceptions/Linux-syscall-note.
>
> +
[snip GPL text]
> +
> +   NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software

So since you're combining thbe GPL text and the syscall-note text, why
not take an exact copy of the COPYING file as it existed in the kernel
tree before the current split. That would also make word "below" actually make
sense. I.e.,

  git show b3358a116:COPYING

Rasmus

