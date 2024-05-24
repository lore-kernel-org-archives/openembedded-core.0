Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889D4C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 08:47:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.120])
 by mx.groups.io with SMTP id smtpd.web11.11435.1716540428492870709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 01:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=I1qyFg+7;
 spf=pass (domain: cherry.de, ip: 40.107.22.120, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY78hMOXpBPppC2y/PhxyWPyqM9mPu5A9oZECADOivkcHOKRo/OH8o15bSPVXGz8kMkQMgzklUYFYxPIKW8NwrPYmvOfPBsg7sMrqMPWnN1KFae/GDpipougc2Cuc/t8RbMc/L3ijD4HVfVOuvzdYcKQXITNRawl1LxF5vEspNJCwH1w/i7HRvznlQ60vXXFj5X9xpV/LhRJT6XEWBLzyAWgE8ZebBQDRft9PHNTk3XkE+QQ0I8VxBWADAOIkq+h3BhfnFQGwFA2CXREUI6BJtR6Auh9DRGNRwSwJWk+Gkz5ZffugbAmOZpCHn16BdEBhkKe7v6ZiJKhOBMAT47z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2yaS3q/Pl3nnFk1kgnmzZdpSTfNnu+QpaO78kzj8ng=;
 b=Quxz7NJGHRF1OSb+HRMhfejHSIODj0WcBIuxVsQNK1GK4LV1SItssXJwAy3sARxRzQXMLKIms1ikAkZZgjalwpG8ZaKWPWVwv9rWvXRHMx4wzTytQpFAOYs8rvVGiajTK2gOmK8lQVYmrNZeVC69KeAHGegcNCL+Sc5KwnocjWZhukQDDgUZ1NlUw+djSO+P+oKhUA5TSgFlbGSYI44loyemEDUSIxjFoEnzpDRasVlTbAoC5s9uF3NHwoU89gBYKqzIAj4E3+2DxOF5YE7XQ9jQeA0TukgkLiTqi4FSm2hvlr/e3MuKoQDofot9snrx/xMIU+mc/f1rBE+FBw1DFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2yaS3q/Pl3nnFk1kgnmzZdpSTfNnu+QpaO78kzj8ng=;
 b=I1qyFg+7eoQvCfM+ddMVf03rFmXUqWZnV2k4wtlvIyzK/je9lkYPC5YxR35LyPLWZV5A+2dAhiezokueMsttm1X1TQ/fs/RaK5L97zKaTm2hcKxK0D86BF/RCd/IaDm5KQlpJ0G5ddbDus/tWr3fXr4pipE5frcjto8Nifutn74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 08:47:04 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 08:47:04 +0000
Message-ID: <594fc714-ed7e-46c9-8740-908c2df5e2d7@cherry.de>
Date: Fri, 24 May 2024 10:47:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] scarthgap backports
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f0452dbd-636d-474d-b87d-caf6c0680843@cherry.de>
 <CAOSpxdbW=mH6Uy_hGOiG6N2ioDhjJJNPsh_MirkkYWhfoUuGCg@mail.gmail.com>
 <AS1PR10MB569731BB547B9ABA28D2122DFDF42@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AS1PR10MB569731BB547B9ABA28D2122DFDF42@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|PR3PR04MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a811580-d928-4139-5e41-08dc7bce15f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KrerTkjYHv/EHxOPFH061omd/eMNYLQX223XkC3Q16tBMQHWlj/X7GVd9Wac?=
 =?us-ascii?Q?jtIIxP4BiOtjGf4KHHxB33wV/wp8Fm+TXJoh0M9aTaNR2l7teGsAdMFM9w5A?=
 =?us-ascii?Q?RMGSXcR6whJmdnZNtNzBVmkrosO6tNI9TW+qjUVGMo5sCKoD0BSIt0ekpO1i?=
 =?us-ascii?Q?VI5s2KwUxptgSgMjb6NxBxWvUd3u/dZ85Qa2Uh90nIcgBNEuF41DafKK6IGG?=
 =?us-ascii?Q?92u94u7XDg0w/rPTgSt22mxS3D41yAsR+KSkxMHj2XhcIVQTIOAnnQ1YDwL9?=
 =?us-ascii?Q?VjpuVsUBNHfSY1z8qAqobIZcLPlEui8e56ecLHQb3079nynL5NF2h0l14UdJ?=
 =?us-ascii?Q?f4qLHmcDYJ72bqn2GVihijDnhmWlLKk6KaWShrwF6LAFqCQKtTQExpmM0LBQ?=
 =?us-ascii?Q?jcQ3ujeYxCjOE7ReuiZaR3IkbhqG7YPv9w/pIcA/IFcMFvlnYQtVnepipsts?=
 =?us-ascii?Q?umjHLjS84hsH9F1NSTKD927hiqsE1Zk6L1g6zIYCZgCg/hOOEbzN6K4gOXY+?=
 =?us-ascii?Q?uOApIOMww3/ttQHZyLeQJ87jXPUnhTNxt96NcfsImF5W8S8dA6ijs64kivmZ?=
 =?us-ascii?Q?xyMjGSjI4rIbkBz6lBWVDhvgC/j0MxYJtyb5CKXIteeUdev7EemMitMuGK22?=
 =?us-ascii?Q?WhpusYlAg4+8MfioGmgoHst9SW1Li3e0AR5xSkRdc7jNLGiaISSMv0ZBurim?=
 =?us-ascii?Q?4rLAUPPccPSExK7DqMnzoDfL6g55mhUEAS0BvY1yn0U1gfy39EwnOBOOGAwD?=
 =?us-ascii?Q?7U8FSCk23EG0pc68gHxRjhhhkEiUtB0Q9UPnEpPDFjv3fZSzTIDlJmxC06vG?=
 =?us-ascii?Q?zYTWUduTkBUqoDwuLEDQ5kjjE0+Fu3lvN/47tZrpOpn1FFCazV1mqcFRWjLI?=
 =?us-ascii?Q?mo3yih89NvCa/6fm/VEN/5wrUeLTu4Z4j12T8Cr3eDDg/3rZkxNnG8HL1llr?=
 =?us-ascii?Q?Ds4uvGItvSQjjOGHP669OfIPpP7JARC2PY610g01kIEyS6SyoSr3OJSkl9ZA?=
 =?us-ascii?Q?c7CbjFuhC7B2uA7LT0nsn7NJrY4sP2ptOIQXIOSE286RmohsobN9qyDwpTrR?=
 =?us-ascii?Q?h1+yKwJLTcxtFWjSzO3a+IjP3/fB4Gy9dZR23sqMKXjNn9msEAbiFScKvepn?=
 =?us-ascii?Q?dJhJ5E0xMfBh9661m5D6zITB1KWl8/YRqUiLB2YXH1364EeA2hq66Tn2H1Ju?=
 =?us-ascii?Q?51LWX/JPmwdH8uPLe//OTsj3edO4xcfsGro/3m75nF15N4+f8a1b31e+BHKE?=
 =?us-ascii?Q?MtcGMVJwgU7oDtOHC2q63d1ARSw4DiSxtKU2KLeUMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XQs0VUPMQ1CIA/8aV2TFNgFr5VpUS0wJFMEVNZ3+vReaZ01hjMHy846D4/m9?=
 =?us-ascii?Q?VZ4jQqW14ULe/z9ThyfC0I+NgodDzKyZyOkZPAy8BDNQwMXEt2MhshIN+oRh?=
 =?us-ascii?Q?FsgduEg3wisk9vAHtmnPxFngH8cyT4pkGpqZKh/Zx19XFIwoVkafgvgqmfpT?=
 =?us-ascii?Q?a2jIAz9p6ZrOI/2X5cHo5a4Q9JK/YisYzRJfosy6RSExc4GK3XA4EU59zwDe?=
 =?us-ascii?Q?kIjY94XCDscabj3bSV93dfSGT0mqNfBDWG+MnXORFKUaYC4Q1kXx/iFulM0Q?=
 =?us-ascii?Q?VDcNwgEyBm+mRlpfGVk8k9SXF1AhSbzaxNosBRDC0bukSzZy6zmJ43KpDWGI?=
 =?us-ascii?Q?NoZZwrHZqIm882LKMWR6/4qMZ9dfMDUtIxJuIN28QdfBYPT2Ho1iMOqME6PP?=
 =?us-ascii?Q?GRaDxVPAgvjaTYgEoBi5rn9uDwnFPm4Q/E1DTDUJKYchOR9uL5jWWdzNJa3T?=
 =?us-ascii?Q?nNkhnKr9cUkJy8HqMTcO/L6DNHQFlGw5AnnyxTkXzrilpZYpq9DE60sQNQD0?=
 =?us-ascii?Q?2GsYnwtQt+D2l/Nq9xdC0OZWcHwB4TcMZzM5Jhur63Y2UPddi/38pHRoRAMD?=
 =?us-ascii?Q?uptD7vwGxOuRB6ZSjiKTUF5H7Qq67LxyQ5lsx8OsW90bmSG7QqMnmzuYENa4?=
 =?us-ascii?Q?l96Vr/nemHcYK5cstJw0l0+hSjx2//csFFimd+n49msDka7AsyDZqTS+5hop?=
 =?us-ascii?Q?Y3F1XKFbjNSF6OsADbjcMpd/ew6XslQVW+OXUJp3uvE0Q3QYDZoD6o4uERbv?=
 =?us-ascii?Q?V1C1HYS+C8E2wOAsQ2I2TS6jEgDjm/rILZpF7T1yn1mcbn2jvX8Hi6ll8W4A?=
 =?us-ascii?Q?nhbsU54bggLMuiZinJ8OabXVwGgl0fNVn/dnDuJUDzanuwFhKpnLU1VnvZsK?=
 =?us-ascii?Q?oiuI4SuC7CDDXX5pvY7jjBDb0fyxT/g2opbfZorgq+f7oXY5p29DylfJx0yL?=
 =?us-ascii?Q?4mybI/4MyaeDYCK47tUpZv/DpH2O3yl5REWtJ9t4AI5lZm4H3s0D7Cc5prVb?=
 =?us-ascii?Q?vC9nonRT+P+Eu+g7UKImc7bs5xtKZTJQNdivB6nqW4HjutYH4viXL5hP7nh3?=
 =?us-ascii?Q?OviukXNDdJXVjimmrMiuGtIxbNvzgRx/p5g+vKtoWe8p7vC45tVOWZaESHjz?=
 =?us-ascii?Q?zj3rzOEBp8ye/YNbIezLZPHkLbjdfLh+FM2Gv5SoPZlKxU5Sp3Jvp3LHdODE?=
 =?us-ascii?Q?vH3SgfSAYn927DSUbIAzZwrzThFQ1gGSR5ydiJ4HqLD51OaWyUhxY/Vv05WC?=
 =?us-ascii?Q?8PnWAkCo8PFXD/oyUxhY6+EoMZ23yILF+NezEJyCbEpTKPK9SGlWWMx3Tune?=
 =?us-ascii?Q?3IgU4Y785mQHyF+tSYiLepPS4c6NvG9u7L4Ctqc4ahXw6tfPg3qbep6Pl1C4?=
 =?us-ascii?Q?HJztWRjdIvwvk6uhEoje6Q56Yfy7fdfLRkcgPOI406qLl0EMzX/E1+oWRCxI?=
 =?us-ascii?Q?NJQTsFZAfdT7H1VOvBQ+smRnghrdL1n9WK1w6nPYHCj6VHRu+u6xSpcE37Rj?=
 =?us-ascii?Q?lifv1SQSzh7k/eFBLCVGhkZkVkWGd+m1hqUQ+LEA78dK9rICd9tzLyrM3p0u?=
 =?us-ascii?Q?ShW5Vc8l/kk2tkN87IcgP6X/jwpQzbDldOw3+tgPSHgUfB0WpaB9kONlZsjB?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a811580-d928-4139-5e41-08dc7bce15f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 08:47:04.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxLN2wumxJnaIEWm6nAPGBUB5oF403gyxQcwJIOmS4Uzp4VhZqDwR9dwmszL8KUy/HYHdgLYqEY/2S9PzuEALFKHE+G+ntQFDFOKvUSV0BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199834

Hi Peter,

On 5/23/24 11:33 PM, Marko, Peter wrote:
> -----Original Message-----
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Thursday, May 23, 2024 15:59
> To: quentin.schulz@cherry.de
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; openembedd=
ed-core@lists.openembedded.org
> Subject: Re: [OE-core] scarthgap backports
>=20
>> On Thu, May 23, 2024 at 6:46=E2=80=AFAM Quentin Schulz via lists.openemb=
edded.org <quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>>>
>>> Hi Peter,
>>>
>>> On 5/22/24 11:10 PM, Peter Marko via lists.openembedded.org wrote:
>>>> Hello,
>>>>
>>>> I'd like to request following backports from master to scarthgap
>>>>
>>>> To match versions in scarthgap branches between oe-core and meta-clang=
:
>>>> adc2651a8e902af24fee6ff30a72f4b7c63bef6f llvm: Upgrade to 18.1.4
>>>> 02df2fc6241ac8fb0e78f2fdff97a04e5c561d54 llvm: Upgrade to 18.1.5
>>>>
>>>> Fix CVEs:
>>>> bdf7b7460a4816e3d447264730a2814209667fb0 ncurses: Fix CVE-2023-50495
>>>> 6573995adf4cfd48b036f8463b39f3864fcfd85b ncurses: Fix CVE-2023-45918
>>>>
>>>> Version correction:
>>>> c94e46019a7d443ccc4763ba16d87e7e97abe977 update-rc.d: add +git to PV
>>>>
>>>
>>> I think the most efficient way may be to send patches with [scarthgap]
>>> in the mail subject (see --prefix) to the ML :)
>>
>> Yes, please! I use patchworks to keep track of things, so patches sent t=
o the list are much less likely to get lost than an email request.
>>
>> It also gives the community an opportunity to comment.
>>
>> Thanks!
>>
>> Steve
>=20
> OK, I'll do that during weekend, although it feels like sending patches o=
n behalf of someone else.
>=20

Which is what every maintainer is doing :) The backports are still going=20
through the mailing list, even if it's done by the maintainer(s), nobody=20
has a work-around this, all public :)

What's going to happen is that you'll be the sender of the mail, but the=20
commit will have the authorship of the original author (git send-email=20
does that automagically already, it'll add a From: at the top of the=20
mail). You usually need to add your Signed-off-by to the commit as well=20
and provide information of the commit hash from master you backported,=20
but not sure we enforce this in Yocto/OE/Bitbake somehow.

Looking forward to your patches, thanks!

Cheers,
Quentin

