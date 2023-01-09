Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA309C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 11:17:17 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.82])
 by mx.groups.io with SMTP id smtpd.web11.69255.1673263036154314943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 03:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=kGVk2uGI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.82, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGJPRy73bjEXIN7uXhFltPIY7UwvwfQ89VjAv9TySadsDZL/4JfIc8/BpcfxAZp1v0tq4SBQ5cYdk2IJAGaeRE3BWum5sxF90LmZC0ODqgdGSCl8019wyq/USdjIG6EexFlpWTU/eQz6fhPbU94tzQEg8h0Xm18yExKQcGzpb4V/a6Pl/TIA4W/13+Df4b6HRE3/Y5CYEci6VJSxhT/ViVipTLKAXo3tOrseNpC/SBjtd2vpBHDIshh4vDStadDVs9glFbQfHYpBOzJlyd7Iss8X3xull+uxwYar8QC8IqAnukUrSvpHAf0+GYAT7UZz/r1eJZtIpyAYTVfv7Xr7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Toho1lBE9y0DSAc3TQtINYA2DJla6o24Eb2QZsQij2s=;
 b=Ot5fsxG7I2KYx56fGdPYDx0ZprBGgzuCREivl4S3lxy6rIa4zlVZ3r8+29mr61apQCkHUpfRiGbSwcc2ONzsGjLAg2IrpsOV2fdbu8+L4t5a/fV2DrQju6RC2rTawZptpYZH56UE5qpRL8A4ONBXtqPpdo2R5e9G4viLOU70EBvHd3LIXVFgLefIlQFi8DWKGrGhxo5whfaTWp8YVygMJHcdcYHRx/PWPKQUenBcBxW/j3BQrzF8ceC1fJ2cEEZK30uocM6HqeUG7yZ4vuAg1EgVjUgS+zpqqKQAWy/cOK/uxLIIDUMO/fKSfv8hMvd5urkCYB4fqUPwzpEUJL8doQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Toho1lBE9y0DSAc3TQtINYA2DJla6o24Eb2QZsQij2s=;
 b=kGVk2uGI5IDh+TTU71noXuCsFHjIDVfH107BK5ZANOv+haI08Qt+JYlyAt5ha+fVKkGgKtIC61ASyoKFw+lqGwVYlPCsmfZKjgb7iTUt+X7i2XQOdW9yVLG953gAT7hdoK2C6cR8XBkFPzqvHoihC/Pqu8Xl+9MvgI0+8G31A0D2/0D12VQfcTNSptLJORihwBzuak5NgWjR3c+GNzspH+iLivFOYC0yn9K9Zv1XkyUH1RWvHZufFrP9TtHLA7uqJwsTAopJaJgJSLj9uGzo33ZR4igtR9wocc+VbRwX86kFpJHFSE4cabXexf7eyjuVq4Tkl/BB6vdnrhOW8SYDig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB9401.eurprd04.prod.outlook.com (2603:10a6:10:36b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:17:13 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:17:13 +0000
Message-ID: <26dbe404-5d48-a7f9-d8cd-9c7f297c9bfe@theobroma-systems.com>
Date: Mon, 9 Jan 2023 12:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [poky] [PATCH] oe-depends-dot: Handle new format for
 task-depends.dot
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, Rusty Howell <rustyhowell@gmail.com>
Cc: Rusty Howell <rhowell@control4.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220524210240.3223272-1-rustyhowell@gmail.com>
 <CAOSpxda9mzxSCpoV8JQ9z1jbSOAGZFSh0FWNTYZeeSm==ZqyUw@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CAOSpxda9mzxSCpoV8JQ9z1jbSOAGZFSh0FWNTYZeeSm==ZqyUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::37) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 465cccf2-44e7-44fa-6a39-08daf2330ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jUlQ+3WByUQwTiHmqPqIRcKvazKWFJSzoOO+SYX/UduQIlKwU662T5GotwigVlui66IOpcnMX4OixioA9fOODOCy5nyLp3n5QiXip2+9t3IViAAQNutFiWaacqocLS1lgS75FOaC74dcxmq3RBQNUDmiNg5lm9Sf6Yg80qZHdN1k6MjI0/8itHRVcj81eEvtwfU6ZtGBt5syo4LGGUIb3kPEcnFXnFMKRl2LW7iu5CDWu1KMT7rSYeD8KQ8M5dUTs8ar+O2eqro9xmbBXu/S1q9ZiYm3GyejG4ccTV+xyuXAMz2dFcofpMDhliAILB4MPFFgjVnSHfMKXIa6fKVzNbCneSFYtKXGYCBqX6z/OI6hdv/tuA82P7ZPeuoETv18yP08PDh+66TLvTICoi03E4uNqSXARSX1tz1kuBK9qbVgChKXymJKwLmvWadugozE6jk6e/y/+d88PkPFoK1kRdr5X1wfRU/q+ePGN5fgdndQlhFzI/zfDgC48v7/cj1bOXsKEMAJ6z7hGJKa0V4Iysy1wtRjJlrFRTE3tcJ3K0oCJbieEbBitcLNN3INrMSHX/rhE+i6OQO4G1CSn5Mogwt67Fg6DtvJk/7OoJ6vUPDB3UlR0h2r7XXHs/78AmjWvixp7P1iNdrh+2jkf72RRJz/COyyHtL45mXhIWjbuIUofHrihyKngnmY/toGwc4e66AadY1WzEl40oohm5o6GcSqazFCr6SnlDrdKBc2ROQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199015)(4744005)(5660300002)(316002)(44832011)(6512007)(186003)(6486002)(478600001)(2616005)(41300700001)(31696002)(110136005)(54906003)(4326008)(66556008)(8676002)(66946007)(66476007)(8936002)(86362001)(36756003)(6666004)(31686004)(53546011)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rm5zU09aTG5XTjJwWUpibVVHSWJDNFVjY2tITkdZd1N5UUZZZWxmTEdMUnl3?=
 =?utf-8?B?QklyR2lFaGJIOXltNUIydjJKWTdqV2FIamtFVHo3WFFmalZzUUwwNG93THhB?=
 =?utf-8?B?MDNaMzFlNXVLdm84TG91M3FoUnNzY0pPRDZYUGJnbGRqdEtLSXVvNmQ3RDVw?=
 =?utf-8?B?UjlXTURZdjVPcEFTV0NpMGF1V21VYXFvM2JhV0t5a01GVzdRbUVrQVB2RU1t?=
 =?utf-8?B?RzdGTm80QlJTSXl3RmRMYlNHNC9ESkk0YjNXcFppNWRWWnRDdTdYL0hyWUh2?=
 =?utf-8?B?QUJ0dXpheWxzQjc0QXZrSnVDQnRlUmlTYlUrR1d1QytNS2p3S3JWUlFyODh1?=
 =?utf-8?B?MC9wVTJ2YVQwYTBNU3hhaCtFYjF2ZVFIR3hCaml2L0hlei9Mc2RGRzk4Y2k3?=
 =?utf-8?B?b1gvVVNDMWtaWG0zUlpPa2RlVW1UQ1dMUG9UaVlJVGFzWmtGc3VwVEpTYWRG?=
 =?utf-8?B?ZElJWEJIbUVrVlBpOEkzZy9ENElOZC9KdldtNkZuWUJ1a2lDMXI2OUtYSlBW?=
 =?utf-8?B?Y1hGRERnai9KQXFWa0lWVUtCSUprZGZVZWtyTkZMUE1ReTBoWjZhVUJ1L21T?=
 =?utf-8?B?OEVLdXZMb1VTMVY0Z0dRcFA4dHpjWVcvdmtQNGhpTEVjZUtwa0l5dmFEUmFo?=
 =?utf-8?B?S1hYUXZ4ajNGaEpBd0ptVk96eTJlNXpValJSTHRGK1BrU0RnSDdkK2hrY1hl?=
 =?utf-8?B?Z0EyWnR3eFFVZW1rY1ZUL3B6bmc0cjA0b0FydVplMEx1aElEeFo0c01odkUr?=
 =?utf-8?B?NW1GY1RlZ0JqRW9XQ2FoVnk5a0xicUJpNzVIamdya3JoT2dzVENQVzNLYXdP?=
 =?utf-8?B?WTNFMnVjUC9tVGhRek9DMXE0WFdyRnFKbHBmNTVkZnVQaHlVY1dKd0V3Y0Uv?=
 =?utf-8?B?dGR4UGNseFJDeW1hTzV3RW02VVdWbmU2TUErZFRUWnVqdkROOTZXMjhTVVNJ?=
 =?utf-8?B?anFsUWlhM2ZnSUc0ZEYrWUlhOWdBV3ZwVXEwdzM2VytRRnRsdWM3azQvUU5W?=
 =?utf-8?B?cDdrRjNXeldIWU94Mkg0RlRxRFM1emhsdWFQVUNpelUwMUQvMmtLQUx2Z2RX?=
 =?utf-8?B?OWs0TG51SXlRNXU4VkYvS0VwSmdac3FzUzk2SnhpNDY2VU9mdllhZkxXT0Rw?=
 =?utf-8?B?OGRUTUtMMlpjalcyYUdoUUh1ZHlyelpsT0tNbXZTaERlS2oyQjZRWVRwM0ty?=
 =?utf-8?B?YklQa1A1eEF6cmJHcjNJV0JZV1ptT0hERzk3L1ZFalNDTzRVa3dwMFMxakdp?=
 =?utf-8?B?cUtHWVR3NU1YZTBsQWYyWmwrUXFnUUYxUW9Jdy8zKzFCeGF3WllSak5BaXp4?=
 =?utf-8?B?bHhyMUFkeFB0K21iNzMrUUJiLzR2UVlOSjdtS0FlYjliNitMRXczbjN0Ym85?=
 =?utf-8?B?UlBjSWZkNng4VTRQdU5yNVdIVmlEbmlQYXkzU0xtbC8zdU1WeEUydDVmUDB1?=
 =?utf-8?B?QjRYeDNLaFUyOGltTlBReVo4TXB0MGtZQ05UaHN1RTVZY2lWaks0T3JzcG1X?=
 =?utf-8?B?VU9VMk0zWHJoQWxyN0MwL2dreWZ6MXZDVjgyVllCRml2eVlDa1FBRThIanJw?=
 =?utf-8?B?VldybEhlNUJ3TitkWW8zTGhGeHZZWjBiWW5vUXphdncxY21uMFBjRldOc0NI?=
 =?utf-8?B?Q0FIbWRsd2RNWlZhSWVaQUhnUzdSUDFOL1p4UlBVbDludWFaMFQ5QlcrN0FZ?=
 =?utf-8?B?Y0xFL2NIdlBQdGlVV2ZIVEQ4L24wSGUrZFkzdytzb1d6WHN1UUMrSS9MR2pR?=
 =?utf-8?B?K0lMQktNbi9Jc2QvRDd5YnRRanUxZmpkaHBraUhmcm9MOUFIT2xkQ1BDVm01?=
 =?utf-8?B?MER4TVplYnk1M2tVYUFJdy82UFZQcjdkajVNcGs4Z09nZld4WCtYTmNTYTRI?=
 =?utf-8?B?dnZKNVltV0RmeG5EN25pMVJ1aTluYVFVVFBDSmdMemFKT1pvUVdMek80RFE5?=
 =?utf-8?B?OEJyejhrRTY0bUh2TUpkaS9GWmplbXcycW1nTHZMOGNnNFNXVEVSdGttbkJ0?=
 =?utf-8?B?ajNubEZsSks1R2FqOXdvU2xtMWxFYThXeEFOZmJTZ3NCMVlNK0t3dURtbm5K?=
 =?utf-8?B?Z2RST2toZ3RwVEdRNnBFTUp1amdVbjBOY1d4ZGpjRTZobVBrOFJKV0FWWnIx?=
 =?utf-8?B?YVRtblBwSzJIbmpxdVdSLytZVEJRbDJqcWRMdFJhRTFFNlM2L1lTajBoZW1v?=
 =?utf-8?B?cjBaU0hUWTJKeE1Ud3NxYjNWZ0lIaW1MWmRKRisxWDR4ZnBHa2ZZejNuV0s1?=
 =?utf-8?B?YjladzFVWm50QXdkOVRaK3hyR3VnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465cccf2-44e7-44fa-6a39-08daf2330ebf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:17:13.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnjgEaDgBOMOc+YqhUP9c4XkMG/itqCSRKoN129ca+0Cd7cJF3PhDGkLk+tqoLMKDWzi74s6w6ZTVlftKUIksrnlKkyy4NnlcW8MeQqCxf6yavY/DfP7vcgx27XvezlF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9401
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 11:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175682

Hi Steve,

On 5/30/22 01:27, Steve Sakoman wrote:
> On Tue, May 24, 2022 at 11:03 AM Rusty Howell <rustyhowell@gmail.com> wrote:
>>
>> From: Rusty Howell <rhowell@control4.com>
>>
>> The .dot file created by `bitbake -g` changed formats a while ago, which
>> broke oe-depends-dot.
> 
> Should this patch be taken for kirkstone too?
> 

I believe so, without:

$ oe-depends-dot -k init-ifupdown:do_compile -w task-depends.dot
ERROR: Can't find key init-ifupdown:do_compile in task-depends.dot

with:

$ oe-depends-dot -k init-ifupdown -w task-depends.dot
Because: packagegroup-core-boot theobroma-demo-image
theobroma-demo-image -> packagegroup-core-boot -> init-ifupdown

Tested on Kirkstone 4.0.6.

Cheers,
Quentin

