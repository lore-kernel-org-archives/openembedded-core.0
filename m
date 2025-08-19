Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E2DCA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:57:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.web11.10323.1755597421857495152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=F28stem5;
 spf=pass (domain: cherry.de, ip: 52.101.70.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O72wrqyWqcdZko2eDqkGpIgB9jtc8UCNyOyyoGXZzyqbV53khhtFdFU9qwQeW/bzXU7mPmt5Y5I3fwJ7II44QDEXGb6uFkOt+iXQ+oEkrw0OHSKZvx1BO95yr+7vVf0EOtBJAAqKkmYwLIk9XJ5G4jiGWcv1whQ4ANQ1UdANi6QXuT+C54njrf6csFY97q6U5E5e1HKk5Jzq/Xjb5TFa83qy6hQ067WieAxK+dCWAotRPS2qxwzXLQlOC1AoE2mtlptUnQ8Z617DllrvAkPdHKu8m7vmNsB0nKVhGjxRCzgrmxeb5gzbWreYSh0QE4pzAcJJBeeK+KZEcTk61EO7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsHAu7pmtxS8YQxQbzkh7Cl4P81SyXgdMrXdf/IBF34=;
 b=siZFu/IqIfCizg6QjmlGKUJ5rl2PDJuO2YEbpQSiUGxbYVhqt9Adwn4EzEqnnCZRMlwjY+5JJ75AL49mc0Vj6DPHc2otIfhZxum1e9s30SrzTz/CcowOWjMqa1gDBgsc2YpbHrgLgOJgssFydfhiuH1GntwJ0VWOPQ+/krV9ijK4Qw9Fn0N6ByMAcjLD2MK99E3ahUCdcw2rb92yrrMOFL3RDXsCpvVkKRMICs9Q8BGok7bUAzq4rKISMgZ9ybxACRS50C3MfdoQ/RvaB2yqLZpQiu4xBDEaVztlsGEXqoh9vFp05x6MWlN8Mnzkc1zXUpw+DWrQqxT+fnNCEGQsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsHAu7pmtxS8YQxQbzkh7Cl4P81SyXgdMrXdf/IBF34=;
 b=F28stem5G6bCFz6c7zlJEKwBj+MuBwttkUlV7bGXwtLqdQTHDxMHHSatkd/uSUlNNNQ8kSWnzsJWjjP7aQyxBhYxjHDZ7ARw7vOrNFZjkbuolXUd9jl+7aKbqiAxw6DM1Iqp1huBp0++fXVWfDF94MU6Mg/XYyHX1RFswUpdZrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10881.eurprd04.prod.outlook.com (2603:10a6:800:27e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 09:56:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 09:56:56 +0000
Message-ID: <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de>
Date: Tue, 19 Aug 2025 11:56:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Martin Jansa <martin.jansa@gmail.com>
CC: openembedded-core@lists.openembedded.org, steve@sakoman.com,
 Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de>
 <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10881:EE_
X-MS-Office365-Filtering-Correlation-Id: ff609c19-5f5f-446d-b488-08dddf06bb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gfMJaoE40kFcodFjp4it3S++6pR4Ot4Nw/WyN21vclc+6C34kiMC4AZGc3bm?=
 =?us-ascii?Q?eeZxQeKxR0VyXeZZiTe40PODbqiGtSgEuKkQX9XkT6B5FNm4ei4dREs0wKA0?=
 =?us-ascii?Q?H1R0WZ5D9HRjKNzCYBp6m9syinhCiZgnC+1mskFrh9Agv/ZmBj9RH/5OxfmU?=
 =?us-ascii?Q?L6NtI1CzQAnUzNkQGnZQo94Cy+fia2xCvdFWTRw4PwDisP0hR6L+NxEJjlxl?=
 =?us-ascii?Q?HnFgGvLpsLmJLvp0SB47bDRtdQxn1Ej5/BgA+q6mAmXKIkx4oxWqmk6fKr1Y?=
 =?us-ascii?Q?Q1ltHq/NBSgxyq+dhDRUSyZ81cZFMIFqnxehcxlpXsdmDVZouhg6rBWfZHCK?=
 =?us-ascii?Q?GWNk6XMce8VOFaMOWsZNmWo/ECj70IaBG7r5iZbZjHFqWrFIhe7yVpdc94gq?=
 =?us-ascii?Q?XSdJFudVPQaNZxNt1jGIbWJXG3g2qhUmLiu52TAFggJIM0Jxn4PFvnIptLlG?=
 =?us-ascii?Q?SzSVjigzhlSOOKTqiOBz6UU3TpLrU7tVOGcv28uom0r4UgPBhPRHrEwLH602?=
 =?us-ascii?Q?6+oO104g/F0UNSXJiwADKj7o+w1T9Na3IC2+g8G+HeuwmB8hm6ozgVSEOb2y?=
 =?us-ascii?Q?tqLigGLQPY6sdSVACHvQ+rypyU0xmJvR8LpK/3DuFX4yUP8umB1uRFMCbsRX?=
 =?us-ascii?Q?GtETMnp2PlGIC0KdU2ibNxtqAg4Kcc0b37sfkZImura7U8tIJTZZY6bDYCkK?=
 =?us-ascii?Q?+M2LIn1TXz8kTwWs/FBuLl6S1AHEHPrvtPc1wH2hUB3e+uCzIIcv6y5JKaNy?=
 =?us-ascii?Q?6On8b6nKtFrm3zDdGiIX20JlPaybAQkrqNFrxAJbODr1yApL40IIy8ev7WDY?=
 =?us-ascii?Q?kUY9aQctBWqsBBO46H7o8ITe6o7o9ZQEe3TBjQ1v2eXh463mWkRZZ6U5t575?=
 =?us-ascii?Q?EYCho5GYMJqn5REQGAcFZ1PxYX2BgNZyMDaxnzy2TtZFpfg6hAubCirZg5il?=
 =?us-ascii?Q?eG7VOOE3dUlEgwXFZCMnRtlMwiQAxIcPVXJZbQiARpVtb7OhhTK4lXNML+Tf?=
 =?us-ascii?Q?mCYnRP+ePLQ27dn2TePFsef3fVot6hhaHjUB87Ch2Obe4Qra7OTTlewigYy0?=
 =?us-ascii?Q?7vF8++fIgCVDZRIaM1chyWHnL0HhpgcdCOmP51pY0qqN9AT4f0eh9gY2SX1m?=
 =?us-ascii?Q?PD03QvZFvwCStBSpz5Y9nIEDg00DqPe2kDMfd2fBXfWXBZrMZRU4TFQj8qnD?=
 =?us-ascii?Q?Cd/EciEHAs5kkHTBGOFC9T1Ye+RYWLC2gZPVelVX63nWKxnsqw8hEvfPOd0u?=
 =?us-ascii?Q?Q/KvT+pn1Vx+7HPpaampdhB4Y2wsOX/W/YSP6L677Eu8aWn9zmMhEwawFK19?=
 =?us-ascii?Q?KQqrJyKAvhl25jOwHOsyA+AZ3vu/2k6O0BewWdFs58yxcxDNoIlz00urSp/i?=
 =?us-ascii?Q?quOQxdQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hzCyn1a/zvg+pe/Gbxu8WbmWen/SkzuTQ1CMzzdxw4cPI1eXP8LxU973PsW/?=
 =?us-ascii?Q?16wjjt/MRlNz8gNuutpV01ML8mvF7W3EsrJtWw7wrvxbOzDgBjuW7+gmkU34?=
 =?us-ascii?Q?WfI5w9PtUUea1u+mRs96/dvBGqVAXpx2tFHX7QG2viKVq1FspCU9Lquz/WJq?=
 =?us-ascii?Q?7dTmrIYyTvGuyyg8/QPop8QR7WUa/b1XTI/ii1gyuSs/M0YEycXol7pGqNXT?=
 =?us-ascii?Q?m2y7GLmV74bZTcex/SjuvdextDRuO92ZNH5/Ix1HRUAXejfk76plVhHWSuMj?=
 =?us-ascii?Q?vrVKE0d///F/50etPBVEJPj+SFcOiDPCa0ouQGaLc2YvdBv1j/TN76bflU7R?=
 =?us-ascii?Q?KvDggYUNbuv0btjJEDO5SdPPtr5felbrOT8NYyET+AMd6FsKNyxoc6Rk9KD4?=
 =?us-ascii?Q?xMM8sb1AmFy52BJSucQ7xPe3M5dEZfMIUDjxjF6rLqUvgc8+tQlI5U7fWRjb?=
 =?us-ascii?Q?637ENSWpoamGR9gjUcq129Oym9a19BCIxXt7KB9dYkgtTDyuKsq+gKOneRt6?=
 =?us-ascii?Q?tOXaib83HTtuCZ5iLKdTBt0hvqC2JXCpraLV+oMGrIUI11SBsEcGTkpdjemD?=
 =?us-ascii?Q?NdIy9s2sU5ZROh73bmG1yGfYEHfFxBr0Hxx599FNugCZ28EBLOjBvoAc0Lx/?=
 =?us-ascii?Q?zabpNA6fHlkyKCuMFYUNJbUjmP3E/2hF2wHmD6/7LbeHsAQ/uN3jSaxasqA4?=
 =?us-ascii?Q?toW7BgRljtmH2LLTGVT8Nn9Oh3mt3jQ2BxZOvssJmHHubQsDbKPcnB7GaI8V?=
 =?us-ascii?Q?Q3iJHzcQjtL7U5cchmiVQM7hQh8SP4sSudC8qc1017Ls7r3RSQRSiOqR5dpn?=
 =?us-ascii?Q?4BbDuTnrk3MjaglfetEfZTVNhcagvhbPy+8g/tNMyfH5Zn5RR32FFXHkQ1cr?=
 =?us-ascii?Q?OY54Cs5JqnXivfINNRrfjfBrk562a3gqHkeV51NNmKacW0acl8C2D9vZ+9Ib?=
 =?us-ascii?Q?6BAmz4TXt5YCEKxqpJ0VqInXa6srz6fP3FHzBmvUsk8PYy7EKqzNwFtL1UGt?=
 =?us-ascii?Q?DIRyvvlAZActdiUy05XoRqtDmYRPP8Qioxjd3mNyIrKO7cfiT2gPWyOAqTkh?=
 =?us-ascii?Q?mc5TGssNsoZJ3kevVENGaoOFx0dRFx4fT2ITNZC70RzE2OLtJbOz7zR7GVGg?=
 =?us-ascii?Q?5XM31FCnVJ4B2mKCH6u2oPNLchyfhckgK6fqceSVqdsu//zsgDT43IegoZlU?=
 =?us-ascii?Q?FTZj1dNxD/EhCVJ69siKpniC66zuj0dWWiQKez+1r/Zo168qLu1Wkd+7P+LI?=
 =?us-ascii?Q?Pu2epPl8EB6MCUtfVRD1OeG62rjm0QFOI52D5mOyWXGrQfozZQEWc/MpcOlp?=
 =?us-ascii?Q?0xLA42b5eLLRXuOJAPQYB9VOQtm2S4otmICAzXMApU6EpGnLfcyNHslBKNn9?=
 =?us-ascii?Q?7Vn6AubEw8RR6oJLa1NTp5pUDkacnHpl9VlHbymNio8JAE3gZ78l1nyZHOYL?=
 =?us-ascii?Q?vmfYqa8/gzGt2DJCz9ra2kgDRTQndnjFXHdOTLK9cT89ys0Q6zZ6Mb/+B4gZ?=
 =?us-ascii?Q?I399zqXnEzzH/lIf1Fu20VvhLfSJODLQkRDuARfBYHkbsNgcrGk5cIl6PRiU?=
 =?us-ascii?Q?QGC41zLWMuNnrhRhD0gv+Ceihmzmji0acd3ctzqJDssv+/82+Dpcj9EtLhjb?=
 =?us-ascii?Q?xyHVHqrIMuv9l4fFFEF+3tqKep6GZoXqn9fVs0/PMi4oy4pwztIka/ZBYM/7?=
 =?us-ascii?Q?54nTtQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ff609c19-5f5f-446d-b488-08dddf06bb27
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:56:56.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFoRzuSzXg98H52+Vnqfntp2wptSvsRobTx39NrtST4oQ6bR4+w7+sEohnDgQ+7mRpMab8yMec21yTWb6Y2z+abzU8H/BhD6SWjjJ8HDPuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222095

Hi Martin,

On 8/19/25 11:24 AM, Martin Jansa wrote:
> On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> <quentin.schulz@cherry.de> wrote:
>>
>> Hi Martin,
>>
>> Do we actually support any distribution for Scarthgap that has gcc 15 in
>> its package feed?
>=20
> I haven't built the whole world, but these changes allowed me to build
> our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2 more
> changes sent for walnascar).
>=20
> So even when it's not officially supported (or tested on AB), these
> changes are safe enough, right?

My opinion is if you want to build an old branch on an unsupported=20
distro, you maintain a fork yourself. Otherwise use containers (kas,=20
CROPS, ...) to build old branches on unsupported distros. Master of=20
course is a different topic, and patches to support new=20
GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is *very=20
much* welcome.

I'm not sure we need to add on maintainer load by patching Yocto for=20
unsupported distros. But that's a call the maintainer(s) and or TSC to make=
.

Meanwhile, quoting our wiki=20
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_=
Acceptance_Policies

"""
Potentially Acceptable:

     Fixes so codebase works with newly released distros (only in the=20
first six months after a given release series first releases)
"""

Considering we release twice a year, I guess the rule of thumb is: is=20
there a more recent (tagged) release than the one you want to backport=20
to? Yes, then backport denied. No, then backport arguable with the=20
community.

So I guess this would make backporting to Walnascar **potentially=20
acceptable** while for Scarthgap not.

We should probably add the information from the wiki (if still=20
applicable) to the docs instead of the wiki.

Cheers,
Quentin

