Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F266BC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 10:08:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web11.12855.1713953327966798369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 03:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=X+rnJCVn;
 spf=pass (domain: prevas.dk, ip: 40.107.8.51, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1/QIPpG+STQNyKUB0fMc1xs3gXg/qrwzvCk8uvOVosRGet1ViejJWAj204ZfhlY74uH5NI+3w+ml5Js7Fm9EXz5F1PC2J0/jZIQo6Zk6M4TxBw2U1AWQdmyOc9h1oy1CXnYlH+opTVpi2+cEyhFs8ZOY+SaRSDp7w9mzxjFhBoXI6IbhxvGTx63ceVjIDIJph5nDDE061fuKCOePIwZcgHHiwqT6hYOiEptLDu+xQE4/c15Ldy6pO3uJ+E8Yc/Ebj4n4iqbnYlQ3uSLDb4yc3NlJpxQkES54ii+ybBsWQoIMwFM5lftp+xwmQfbTCqDEP4olrza9yRX+6eLpDFS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7tYkMDwJrBbowQAcbrYh6R3cPZ3DbWBTaE7X37+QR0=;
 b=VZS32kzLlmdkFxVV7uO6S1jQyDrkjz83Q8RxtmdSHxZQLO83v6Lkd9+51sf86YJvddrH/J+wq41e91a4k5ICi4+7FI14eFRrYRTs2/npBrsXiJOuksgSuIW/id+ELPYxrDwO2hv1slFylAuc0mGdDnz20cQFgQ/mUq6LMvwSJ4qWijywwxVRzrAWrLHZlR1tPuMI9iYaQSpj5iV1AaQORhdTvOjJRQwcOHg77m7fpwAqFISRmfJ1CRev1Cp6KJVxGUR9D0ujeRsQ84pTdgXTAT0emuXGLtN27ySjPI+XoJlOU70N53osRUakQN/YU6qoLCCvXA3+giMdKfPBw6qgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7tYkMDwJrBbowQAcbrYh6R3cPZ3DbWBTaE7X37+QR0=;
 b=X+rnJCVnaM2Rj9CfrxuiWJqkBCIv4ruqaq9wkXKuA2EizhqVVf5Re8ler8JC5o7bJWdpDlzZvGT4tn5/6FCf9a+gQNwRFao0C4VmMTelV8apuvZq1b+BMge7/1//mEUuILdhz/GRl2NfW/0nmhm4QaQZjpZ9Gwb/EgkCqMu4iPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DU0PR10MB7612.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:328::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 10:08:44 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809%6]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 10:08:43 +0000
Message-ID: <ea2ef4a9-f487-4001-b248-3b7dd9750703@prevas.dk>
Date: Wed, 24 Apr 2024 12:08:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: sed ROOT_HOME only if sysusers
 PACKAGECONFIG is set
To: alex.kanavin@gmail.com, yocto@bsorensen.net
CC: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org
References: <20240418055843.547573-1-yocto@bsorensen.net>
 <e34afde6-9687-4f4e-bc98-b9d0c8260169@bsorensen.net>
 <CANNYZj_syk3DmGvutvxT11P0hO7L8E7tRm7-ga_QKO7Z_PoKZw@mail.gmail.com>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CANNYZj_syk3DmGvutvxT11P0hO7L8E7tRm7-ga_QKO7Z_PoKZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::19) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DU0PR10MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d0b6f5-8be3-4d1e-6072-08dc644685e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9/tLDwd8dNzZ4BIl7DQsxxNws7P8BMa+OaXVZ4D4mP1TVe//aGWkuxHDooiX?=
 =?us-ascii?Q?5rq5hsu4uFRoxPIsXQlyzJbtensBjuXEBMqCFic7B4h1yAADcaWk0hlJI+wI?=
 =?us-ascii?Q?CGF59bh6eWrJn6hlvz4+n48+b6XkVg/YUWSbz4Qo9g3mUbcM2jDBcMrePwh3?=
 =?us-ascii?Q?6f3NPwMtUHlst7CtSTETtRZtFhPNw4dN5HYjyaG4gpCGXaucvPIyIXPb0oMw?=
 =?us-ascii?Q?aumzfj8UWJ3IJP9U8pe1FA1+MHnumgmWt6eq+zMFcp6E1UUdCh+2bcGITEm4?=
 =?us-ascii?Q?S9eKoCibYnM0dXcvJDfr/nCeoECIvOIIREpkIUaspa6xtLq34ND2enxA0HVA?=
 =?us-ascii?Q?AtPEmtx3jDRDmJx72WoWxcUsuE1wN0snArkqHMWwpEg9qbUTh6PLNojDyQM3?=
 =?us-ascii?Q?ye2ETaY6vtEvtODWP0gud1nSw5XNcB703L8OOvLT8JlN089+3IsZs+ND9FvY?=
 =?us-ascii?Q?A7+yKHh7Q88VoGfkr9W0mXj2IyH4OPbbBZOZHo/AcZ7QwK0CriWpgpixnx5k?=
 =?us-ascii?Q?TGO49p9KbSG+/IJ8x1qMMEBF2To1juWC4YRQSCcnc559NSh8MWqa6vyJYBN8?=
 =?us-ascii?Q?d4Fx5CI1hcpLApJyjrMCLNKA0KbEfBZcLUFrdTlHFpJzzhEWER01XTndAOFb?=
 =?us-ascii?Q?NoyYzmDuRdzeNbMMrYrSgU90cglQwA2AbKL8nKPgxZeXJyuL228PXoUMhAfI?=
 =?us-ascii?Q?Nvj5Big9jcuLUD6oUyrGz+CGqD0ZiWsNq2cukZ4b15ZAEs8xt9Mf9mQOe7OI?=
 =?us-ascii?Q?tYP1ZngBYsNZ6OxO3L/5M8UpVed/jYDFOsioUgAYAbF7YlPXx53a8OesvhZY?=
 =?us-ascii?Q?xYdqYuah658Msa9pvFmEXB3dqzuGI+wIVgG7pbjFZW/bOnEgcziWNe6nPscI?=
 =?us-ascii?Q?0sYBy++XUFt8dj5bb6Jtz0eb1Iay5iCa6DncxKLO5u8v5g/h6/r3VQZvY5LF?=
 =?us-ascii?Q?12B/hWYVsJgJ50YiI0tygBFlMpRYh1NCiOEMm0np9bGiwsTmtaxChPIKyuZG?=
 =?us-ascii?Q?oXJB80+PiYQzjVlgYt74OOxkkmD9YaL1bRWfqbVW4ajS0ACT0VF2q7UVigUb?=
 =?us-ascii?Q?J+pDaYsM5gVhvTCvXoyOnljX5rf7Dq/StBFfR9T+PdtidQa6KAo4REFyBlZb?=
 =?us-ascii?Q?7MTdtLGOLsQFANWkAdXECFNkaNpq9nIW9kDNAp9m0ZjTLKeQ6uXthiRSFMly?=
 =?us-ascii?Q?4BVxeTF9/jNhvvlh7nxpaK+C+upo2WAKpWnDZr0RoLtEXS5cxx4MTO3XMlo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dGg+8iYZ04u/1V+R2HRcjcuxJMWwvmZNIL0KkrTGzu4iyr7LAOKuutwdOajr?=
 =?us-ascii?Q?TB5YV4HpzAfRnJAgKv0V099vum/1OqEi3yYncC7tEseaK0tca1KPlt/Bwg47?=
 =?us-ascii?Q?v7hwM6OGf2rmDtbQUvCF4w4CugzuSkj9Pkd58aae83BKWwzeT6Qip6VobTn8?=
 =?us-ascii?Q?50smWImw5NYcQ6S5F0LxiP+oA/+lycvYcTdl7xW+DLVM9pNha62mI+WxIhOx?=
 =?us-ascii?Q?T0lk4bZ5oJC5aVEWf0UZcvRWQlnHBweqvg9oHPNghEOrzbjGR4WE43Wd64gG?=
 =?us-ascii?Q?UbKBkcrtPlpihZ3rlXu+R/qU7Jt8QQglgir3dLVdmfF1NmFhLGmGu6bcUFgv?=
 =?us-ascii?Q?/TiAQeqinq3kn78VZHnvjfmUS44vQ3XGJVI3vEplZkg9swBLZUAV4J18hXV8?=
 =?us-ascii?Q?0qASWzd/YUkOuSkHbt3jQLHajbN0X9p9gNPjX1K+AFMHLEP3BiCkkaOlfk/i?=
 =?us-ascii?Q?YT1PgrRDyPgKEMxHU/nEzAKHGwPi7IrxiNb1p+O/GKxY7RLKuu7eEjAbNS0B?=
 =?us-ascii?Q?B37yY5L698xjkV/qG/CD9Zs/qj034J7xE8JR4hSFzNjE6oCAV87oOXMjgd+E?=
 =?us-ascii?Q?t1bNgF1WZ2fWaTXgc5MkYhut1GpvpT9RPGUhzVo25BvrIXF0swHv3liI7yyR?=
 =?us-ascii?Q?hEGEH9EfcDVNVpuGF2wSY3tpNThaxhxUKSHmBBw+PgtI6sZn8I+yFsnnHYfe?=
 =?us-ascii?Q?c4kecCWrkidj1l8cfFBrewqSzyZd/kMkbZbgTVanhAUkVSUZExbc5/+v9jt6?=
 =?us-ascii?Q?B8rzWVwlEyNBjKYJkoQuW4TgkzLmP2nTuVFUsBo1bCJe9b7GnEgz2iD0GITg?=
 =?us-ascii?Q?wAIPdyTyPkZCPPzZVU4InQzvqH2O5EP42ChnvJ9syF/+Hl2YEHjdtNi4QOWd?=
 =?us-ascii?Q?H+kVf3Td7jGweDKN0NAc/SECKXDvlJBeXjVPwhcpu9ooRGKnr5ixHCXtoucz?=
 =?us-ascii?Q?M77uClqlC6TRoUKxvtd24+2/g2HC3m5IH/kJB416DYAKKiV85eMFOmB+kvHj?=
 =?us-ascii?Q?eWAoyCB3/6wwlAovHCSbB4wAM/nTldGuNvRU4ZGrGW2e10egHrD9FHUJVN//?=
 =?us-ascii?Q?BaNoyfDDQI205LRn+o3JJ+QdUHdU1LPb4ZPESlozXA7kqh6XpRgnExIKQosQ?=
 =?us-ascii?Q?7/yrBsks/c3avBNZkqyIGozzTqvWmp+gTuryKY1owRPKt8VeN8mI2RqMSGXQ?=
 =?us-ascii?Q?YPctR7A8xztB2UYLhAhARba0bPPcbup+chSWZBUBTKouUHpWkADx924ekRZf?=
 =?us-ascii?Q?9PSO7CGFPtpIXbGCY7aKC5gjyYtiYlyGv61mUVanrR0Hz+7zF482M8x6nzWe?=
 =?us-ascii?Q?G4it0TsXXKTKj8sc+1iem6uOcbqZouukLIA5Mgb7ytn8rnys0rkcTtaaQ7Pa?=
 =?us-ascii?Q?BIU2Puc6Iw5vjc5fUiCXFzj/826Q92Qyex7r4NQz/p+5mJaKcYsmM/gYOlbZ?=
 =?us-ascii?Q?h11nDq3zmZBRmWeSBIUU7/5u9DoIqv9MU45zVaiwI+yhpb8/dKqGfZJDgPUx?=
 =?us-ascii?Q?FUdAKTrAE7rpHU/iyH0nD8OnzQ44OyFRiJb00hb4Dpma6ngsiml7LdtJ/HX4?=
 =?us-ascii?Q?8Aeal/oeGfxhtgH+c6iJ4NLRuD9owCYHiisNXy9I98+sQ1aBMswoSJZPjCIP?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d0b6f5-8be3-4d1e-6072-08dc644685e1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 10:08:43.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xsou+sgsa0HMniQf0MYyXeabJwwDb7cAZ5MVECOedUdFACRMLmN0cElg3+QHIGpSs65DaesEBu/wICu75Cdfqtg9FrKHMk++tWTAqTS1NpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7612
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198685

On 24/04/2024 10.36, Alexander Kanavin via lists.openembedded.org wrote:
> On Wed, 24 Apr 2024 at 10:19, Christian B. S=C3=B8rensen via
> lists.openembedded.org <yocto=3Dbsorensen.net@lists.openembedded.org>
> wrote:
>=20
>> Any input on the patchset ? Would appreciate if it could be included in =
the scarthgap release.
>=20
> A little patience would help. The patch is fine (and so there's not
> input), it's in a staging branch,=20

How would one know? It's not in master-next, and I don't see any other
branches containing it. Is there some git repo other than
https://git.openembedded.org/openembedded-core/ one could follow to see
that a patch has actually been picked up? The complete radio silence
when submitting to oe-core makes it extremely hard to know if anybody
has even seen a given patch. Ideally, one would get an email
notification (not sent to the list), but just being able to peek at some
staging repo would help avoid "impatient" pings.

> but integration to master would happen after scarthgap is out.

So the plan is to release scarthgap with a known bug and a known fix for
it? Or are you saying this will go into the scarthgap branch before
release, and after that be applied to master?

Rasmus


