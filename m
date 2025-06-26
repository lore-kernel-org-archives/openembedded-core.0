Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2322C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 12:50:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.web11.7266.1750942247060040314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 05:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=iKg76QXc;
 spf=pass (domain: prevas.dk, ip: 52.101.65.3, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX5AS+Km7xsR2OXhNWZXkSAGYS6io7dB588Y+jZX5EMPOhCc8iCqCosAKQBmpEskLN+Hx4RhS6Hq7/6oyNj++Lgk6mD41OpnbGbVc2/2fbgwr0IGRLlO1wsr6tc0/BGvtUR23v2bAwH4UaSgBi15sXMBJnBhZgJDJYVCX9REDgGhNuft0YTZmuFF3kt6N+1neQj8t8bboJYqjx13mPgZC98o/MdqtVyDiJSPFohEk3eIjENqhjTyZmxBINb0K0VOBldpwb1M6LGntbfjkAI9LTjZF9bcjR2juQcg6oGSWbACoef5qbYuAwl7RArFSZji9D5Uq1mbvRJZgkyaycQDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avugof9dk/vqOIwy/uIaf/nRZvCqFRiNX59mkfzXXQs=;
 b=LAnhxmYxgX+PA2SLF8USCNx3ke5EOj2FFO++NQmkChSfDdzXcHpxGS4ouX1VxiVOhPFihKtYiZZSg0tDuiunYkAUUzZWH4zY/YuSNqVyAWneP+WvywzVzzAoPOPn3OwRXtENQDhclkq3uvMBJRvRs9333oIfeQb1p9vLNbxGOIXxCnDs8nJriZm325mfngAy7jAJuZs8idd+yn+nqNaWXnUTRa7/nHsdUGtJSDh1eNst6KTq8a6VmLKAJcWFZ6JhJSVc3vZRR7XiPJh9MdXF88tw01cTS8jdnhldjN9zmX9w57PSEcik5cqHHduf9zvt3SD20D4GQHOQgUYXwA6cYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avugof9dk/vqOIwy/uIaf/nRZvCqFRiNX59mkfzXXQs=;
 b=iKg76QXcvnfyQVAJKa4eeOw8h0gqzLyQvOBmrdfonyBAFL/hU68sNuyfJexveTgRDokor+wtzhnwnhu2tCojzZJ+8pP73xmQ0HDTtuKsz8zxLFs30E2MIhn9itOBPwpKMm+x6aY3PVcGPa2V/Ijej2vzJBb5YgVk+D4k+Onn77k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PR3PR10MB4000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 12:50:41 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 12:50:41 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
In-Reply-To: <f2e0550f251683ed085ac7abaadbaa2f9aea04a2.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 26 Jun 2025 11:06:27 +0100")
References: <20250606093905.2715221-1-ravi@prevas.dk>
	<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
	<87ikkuzuf6.fsf@prevas.dk>
	<5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
	<87tt43xaev.fsf@prevas.dk>
	<f2e0550f251683ed085ac7abaadbaa2f9aea04a2.camel@linuxfoundation.org>
Date: Thu, 26 Jun 2025 14:50:40 +0200
Message-ID: <87pleqy8db.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0052.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::33) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PR3PR10MB4000:EE_
X-MS-Office365-Filtering-Correlation-Id: edf97c2b-1940-4ff5-7a73-08ddb4b00ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GiIw+e2INkNLkydZe8YorjjlFFfxlLCXd8LviHAx7/mKGe8t7Nz1lEr6QU1a?=
 =?us-ascii?Q?N84ztFjvUEWMKt6diI9Lgnbg6aQUXyLd+ibTEQHIVRZE0tgXFKg1IuJtlkk2?=
 =?us-ascii?Q?bdhWPIzGgy2/G6LxHXBzB6tMDh6b8jGDoDk68poP4Lip0RzgREAHirYxc8El?=
 =?us-ascii?Q?F09TqY8WQcmefmRIh/LjilBzsUdeXinxw6MwWZVq1agVC7Tn/ObeHDKvpNnP?=
 =?us-ascii?Q?rBe9Bw7ffPhNRVL2SBb0l05h1Bpi+LmB6ykYtyFMlmQeD4Q0bBrs9Dy4ltl+?=
 =?us-ascii?Q?o39QBOQSxDQ/j54ku8oFEOwJGs2jSIkU7NHaF5TYOmDSydGlgjtaHmoEu9IH?=
 =?us-ascii?Q?lHt2OfdQha7y7y//rjq4n6vS9poGG8tcMS9bfp1a5qYuQV3PST1stxS/+Mg0?=
 =?us-ascii?Q?6k2jkFYPXTJyYolt3csMG1EpjX8R1xMLRKbg/A06xNYcoLZSG5ZiVQtEDGSj?=
 =?us-ascii?Q?aRKl7OedF1xfkCmARDJZUWFl/MVLBd6zs7J7piRSYwtn1K1BhVniJO/hWDb8?=
 =?us-ascii?Q?byqwzD7nFM1CnIIrCFw/Rh6Bh7AydFxyU6yKpdz+UAvWg2n/23DQtRiAboPF?=
 =?us-ascii?Q?VGUBlc9b7UT9fo/Mke1rHVgqsALOvgm0My6a1RETxakJHXSVZ5iPqhQxUGo7?=
 =?us-ascii?Q?jVTBGOqfh4smWyrpdrHb5ahtTzImoNtue1AZdyKmwiF1GMvbw6SjJxr9Puny?=
 =?us-ascii?Q?3QaJ3m9jjob99N73L9HPJzUEFSCHxPAKgLU5iiJiK4JuzD9BcLZCpM8YtLHL?=
 =?us-ascii?Q?RHw25TvQkg5YlW+OTIzexMlV49q3kYJ+T7+ADN/yzgqjiwJR0315R1QI3XGE?=
 =?us-ascii?Q?CY7OS2gXIgkrB1mwRi+tL6iUS1T/VnVhSDzqIM/3ObZBBLAoCsFMOjs3vrSa?=
 =?us-ascii?Q?7MZkMqCXXVmtMM3UDLPCSNS62MPphuwSmW/WzmpQKqTIz/jxeF92M5UF69eK?=
 =?us-ascii?Q?M/Pj4IdJUnpelz3lZgWy9o3O/EJK60H8/vkXxY7M2QrQJf4IVT3VJnCXBnyw?=
 =?us-ascii?Q?3brs4YrI9LBI+jRDDJ0Qe8XpOdwUvfJSBS8jNc3hOraHKYjmKtJkNhB18Bgp?=
 =?us-ascii?Q?PQuvfRhL1UFYsVZqKZWKvx04jF+0tz3dBiAxMpn8y0txumISvMgS2Z5Pn566?=
 =?us-ascii?Q?iPOvdcUxiSbbNpjlq6uJBWvqAsVCdQZpKy4UHstObXMpzKHNkuSxAuJDqxGp?=
 =?us-ascii?Q?TegosRIGNMhLdVnB6cmF2pESDYeoh/wYy544C2ESxFCYR4byiAn+zcMCaNNQ?=
 =?us-ascii?Q?YYbKd6lj9ccXgkF2anR6oOoSZLEjs8+MuMfrh6SFoYoSOBIJi8Heytou8MO0?=
 =?us-ascii?Q?8y/EgoRGLpj+BkLI1fHX6doJF+sDfPuQxiL72hT1CzVEUbZDllz2mtdOFM/F?=
 =?us-ascii?Q?LdxAUxtoCZcnvTXm/ShslQyCbnCkd8yzzwD4eyqJ5sV7nO9LwYVRq7Y3NuIV?=
 =?us-ascii?Q?NiiUM7pT4fg82NqW+XrPfT43DJaJuQWzdxvQsdnk00JilKN6LsE4wg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+daUM0063wRyAmXfw4dNGcbJ/h5xdYR61ZTT/Q49Px0XjIidskVju/bRWasv?=
 =?us-ascii?Q?mNQXZYuziU0oPiTeQfmZyFuM+V+RnztBXFi2IPZPFeSkJsYVeONZw+cT0Hu8?=
 =?us-ascii?Q?c5W/AfYZliaFkuDA8e/J73yl0wGUy7fg4KAhdRFWm2rVEoT2IGUz8CMDGMXN?=
 =?us-ascii?Q?QrpV5zKG+XzHvF5K813uMjY0vGNCZRqu4qmILtLD2KRUy5Q9+yREnjMTqp6j?=
 =?us-ascii?Q?n7Mq9EPS7K2sWkpLkks0VkI2eLfRXktfs/tSeul2IbZcys2H2/v5SYgOr+nY?=
 =?us-ascii?Q?l/GKt9FLoHv3OKl/ploKAE2CbJKwEgCMWJlBS6LbsrGoXK082Gj1KDYofNyZ?=
 =?us-ascii?Q?9pC690ZxWxACQOQzvkBu3PoqyhPVKQKPR+rHMC314WgRRpgUesjv/AzqAqWu?=
 =?us-ascii?Q?ZsRf6t/OryUBk01cc/ZbhG9TsNyZr7peWoJljfOSGWDmshgcBj3Xx07TAhRh?=
 =?us-ascii?Q?A4DhMtqtCS39LMwcT7AfmRGTv01qekaH7Q0ILCtTWnv0u2i5j4xjcybSVvT5?=
 =?us-ascii?Q?gfJHRbdWxaSQRL3xOm5gK/PQ9mKNMq+WigImz8QZs6edmopnvx1MT5L7KyGh?=
 =?us-ascii?Q?roNOIBkfe2WTHpgMDB6opnf2hUdfHMnt9ZspkI5pweqJzlb4mLUA+SmDTYX/?=
 =?us-ascii?Q?7BCesgNP11oXF8X0M7uqSru84bSI9DKRgk7lxI6pTJ1Q45yIHYDUDOrhZBum?=
 =?us-ascii?Q?AywBg5MwL3jWSqDJ1I6SuAw90jET3bGXgfCzb/iZDQSZQA/+mhmf9MZGBeBl?=
 =?us-ascii?Q?NhFQ28ioaVDTHWHoN5I4YSoiSDJBsLbU5vOYmlFQHGUNNntSF+/8yl+CBlw0?=
 =?us-ascii?Q?ncgZ85v8LWsYOJcP+Yov6F4OrlPlthI7//KczW8jdgi6hXfjbpsUy4b9RW/p?=
 =?us-ascii?Q?kmNGA/z2olR1GRS+6RMAzVFkAJzU/Bs6ZwTYza6NP3ETP4mBkrctYATQHh8Q?=
 =?us-ascii?Q?FN0vyQnQnGQZds8ylDcEsxuZXzJyrqhEuesJj6XbaGJxfiK0k0clFN3NTYN+?=
 =?us-ascii?Q?J9ulFVx0hD10eJNgdZgWpgABcRI3Ifdl9C8JFaoo2AkdoO78f+1lrhx+4mKE?=
 =?us-ascii?Q?6syI5gY57gOz2DmfNt9HJfULc2SG5wpYJW25DCmXaD59VqWVF1GKA8+m4Wfy?=
 =?us-ascii?Q?bcsrqTDk7mUcmuv7IDwGb4COzWIF2NpWjESuMxsmLfSOZBal11+1RQpz6lyR?=
 =?us-ascii?Q?pSZz9QQXxNJRCrN77Uq/ueHaqrQDOUT3MBaO7OgAfqeMblr3+C+M7piHuaT5?=
 =?us-ascii?Q?dIo8GExJ2ov2AyErHbFMiZJnjAN/9nAFtJLCHYgTrXI88dySGyeX98HRwNMa?=
 =?us-ascii?Q?btkR3dHghoMuVmxmBOHjDNSzpcp8z0g1skuTckQi4Ypr5mpDOPyp1py63skS?=
 =?us-ascii?Q?E7erYMXgISnSmVMOMIndJo6hNOlwND8+wYyniEEpzW1VEMQq+3dd8OyiMMRu?=
 =?us-ascii?Q?iliCNB5BXINeaWyhHdhDSOc7bqWYlAZnNrAm+ZK8w/NU+sDjghhpVDSjSDpH?=
 =?us-ascii?Q?qSuJ4+HNuOVcQIoE2mXzWc3KrJn8j+P7jt1AvbKsmlfJryi2IHOGY1QbLIbS?=
 =?us-ascii?Q?8vPy1+cxFh1q73DGD7R+6qi8obYCgUppkQNTtLK7Dt+rx2WzJXPXhksx3DOP?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: edf97c2b-1940-4ff5-7a73-08ddb4b00ecf
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 12:50:41.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD3K/RHTy++DK7PLViopM3dk/jTHNjoE8v1jp22+NJ8k665O75RP0ng141/UujQyW/v0zNY8myF51hYB313wkFDcLZ7v1Znhvxo/dz0FjrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 12:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219352

On Thu, Jun 26 2025, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2025-06-26 at 08:51 +0200, Rasmus Villemoes wrote:
>> On Wed, Jun 25 2025, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> 
>> > This should mean your patch can now merge as it is correct IMO and the
>> > tests were just broken/breaking.
>> 
>> Thanks for taking the time to work through this. I was hoping the needed
>> fixups were small enough (or localized enough) that my patch, along with
>> those fixups, could be eligible for walnascar. What's your take on that?
>
> A quick poll of a few developers on the review call as we discussed
> these changes suggested it would be a candidate to backport.

Great.

>> I got into this because we currently have to set BB_DEFAULT_UMASK =
>> "002" to get the sstate dir perms right on our shared build
>> infrastructure, but it turns out that that cure is worse than the
>> disease as I wrote here:
>> https://lore.kernel.org/openembedded-core/87wm9r1wcx.fsf@prevas.dk/
>
> I have been meaning to look at that a bit. We haven't really supported
> changing the overall default umask as the potential for unintended
> changes is significant.

Yes, I realized :) But since the sstate dirs/files were not (always)
created with the permissions we wanted, I thought that BB_DEFAULT_UMASK
was the proper knob. Only when that turned out to have unwanted side
effects did I dig deeper and found that the sstate code already tries to
create files/dirs with group write, but with the mirror case overlooked
(which explained the odd mix of permissions we observed).

We also share our DL_DIR, and the fetch code doesn't seem to ensure 
group write is allowed - perhaps we just need to set do_fetch[umask],
but is it intended that DL_DIR should be sharable? The problem occurs
when one user would build a newer git-based recipe and thus would need
write access to DL_DIR/git2/foo-bar.git/ and that dir had originally
been created by some other user.

> It could probably be made to work but someone would need to put a lot
> of development work in.

Well, we'll be happy to just get rid of our non-default
BB_DEFAULT_UMASK.

But it might be an idea to ensure that do_rootfs[umask] and
do_image[umask] are 022, regardless of the global default umask, or at
least have some warning in place if they aren't. I haven't really tested
setting those; it's possible that the BB_DEFAULT_UMASK setting ends up
polluting stuff before it gets into the rootfs.

Rasmus

