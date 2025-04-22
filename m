Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16B2C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 16:33:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.web11.44762.1745339606506602228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 09:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ai0M8Qcl;
 spf=pass (domain: cherry.de, ip: 40.107.130.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzNNtODn+iOB9WgD4OerZSmG1SuAeLHwBnQYBKX/YN3sULTcMwNDuEFVZxHBfan3CNjBcWW0Y5n550dE/CRibHtBD/m6gpoqeHccczsbkOBV+ObQGV4x2j5roKnTWGoiY/pqxKppqiZQyf4b+Ve6MpsqSe23ipb2uHPcD4JJpndU5ARTEChnluOCKx13v61sTUih8u4Vgig0lQqltRBwfTz9wUIFGIc/9TDZy7YvAeb3DH5ywx3dvthJxd2UcynJZd/P3bCwp7Ju9uYTIZb7StFoU8KZo+XgP/ZjhnuYxaJeKffAehIM4H+CRIjB4Err4ZQNJZSECCelReJ0r9rEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY3rIluCUc1LJkJsuXHVx/2j4umcUkVut60q8bbi7IM=;
 b=H4/tjyBx0LMMZKe9LZqSSrwajD5iu3tFYLiIFFq+To+qovvDYxatO2lnYWLevXMncSlVOec2fQ2b0rzfTkwYXqxYP6yLGZhpKWCPX45BCRajuztzLi4MrFt8OxqRXQ1Bcu2i6TSrtv7HfUaq7/uj6Vz2nlpu33bU8bUnIcLfBqq6witFbcPf42e5BOj7blu8HfyLPvkwWPm/nGhY/KoVVt4BaeVqOGEp1Ol8iVRSiDjeudVgCHS7Gb/uyG6ROV2hs5v+yxH07M2Drr1Wr/H6GEh1yAb+GN8cj+1+20QUg7gd5KKm54W908Ea69b7zexlyi7VYje58GXyN5bnfXlwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY3rIluCUc1LJkJsuXHVx/2j4umcUkVut60q8bbi7IM=;
 b=ai0M8Qcl1JEMtILMlsylJafwe/sCi0NF8Kw0YXCuF5H2snVcl814DSao6aptl/22/OZ1UvLwc+DjMJV9gDZ9TcwFu5QV1GxhfXHlvjuqoG/DgRbIttJ/9vS6HCvwCWw7JnAqAiuGC0gEWGdrj/hkg2f446+pwvvRirTbyYK4sPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10270.eurprd04.prod.outlook.com (2603:10a6:150:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 16:33:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:33:20 +0000
Message-ID: <1c125c19-769d-4953-9921-944fb5aea132@cherry.de>
Date: Tue, 22 Apr 2025 18:33:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] mesa-demos: use latest git version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
 <20250422-mesa-demos-git-v1-1-87eac5e3af26@cherry.de>
 <CANNYZj-NskJ-5Vs_h6intyW5R=q6kF7kPHU5tWBpmSv80CP_rg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj-NskJ-5Vs_h6intyW5R=q6kF7kPHU5tWBpmSv80CP_rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a38a060-7bb6-4d2d-fd6e-08dd81bb640e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejBPa2FMQXlLbVdTYWRJUCs3QUZxT0U5M0cvMDB1Rk9zbWNHS2hxRU4yalpD?=
 =?utf-8?B?UW5jR3RvNEhTQVFJUHpNVmkwNTJNTldRNG1ubThNU0pHKzRqYWtlYXMrcGhB?=
 =?utf-8?B?VEgzdFAxVDVwWmk3QkFCVDNlTDFMTW5CZmpnSnY3eVJHNUhoQU9zbjB5UzdD?=
 =?utf-8?B?V3lVQnJKVFRuU1I0bGcwLzhvaEpoWFpORGI5TkN2L3pyY2dad2RCWTVuZHFa?=
 =?utf-8?B?Z2pTV1NEQVJRbmxmVlpDY1dvSHJLR2Q5RU5DTjBFVGdtd3dwVHhSRWY4aiti?=
 =?utf-8?B?V0Frc1Z5UGh0RzM2bm9HaDJkRW8xSkdjd2tuTzZGQW1GU2JhTUxlWG56RW0r?=
 =?utf-8?B?dFQ3NkNBejM3NFRrY3FkK2VGa0F0Y2hISVRpc1pCd0lIS2xiS2RweUp6bTdj?=
 =?utf-8?B?alZ4YlduSW1tNTBoOThib3o0dFFWcGdvcGJLSVh3c3lhNDNydWxnY2owVm1z?=
 =?utf-8?B?cE9zUVJNalAweTNLSm1hR05oaFh6L3k5QU1lcm1QdWZKV0dMMFZKQnE2aTdE?=
 =?utf-8?B?Qjhibm03R01yV0QvMThkWm5ZeTNEakhqaFp1UWVpa21pTDJhUWJja2RnTU53?=
 =?utf-8?B?YVIrNCtENHVXZjdiYWJQRmZpUzRoYWM4cHdUUFpNMTFRcGljakFkM0tEUDd4?=
 =?utf-8?B?WE1vbjg4Nit1cmIvb1VtMk95M0VYZG9jZXpVT1VtUXJQQVA0Ty93MUhRUERq?=
 =?utf-8?B?ZTE1U3lqd3loZ00yL3FpNFZES2MxK2R0SkNKNHJtQVR6dG1ZUEJpd0RscWlF?=
 =?utf-8?B?UXdDYlF3SXZiUmJpditYdDdPY1dHTGx5cWlWWDlGeUk5dXkvMEtRbDFBMkRI?=
 =?utf-8?B?WWUvZmhVRzMxYnFjQkUzUTFhWVAyaFhiUU5hd2UvSktqRmN0ZnFlQjNhb1BY?=
 =?utf-8?B?MlBkVVJNdVZZRmVneWJQSDhwcVZWZHAxaXZiRnczdmVlYS9zRU9aTXBQc0Jn?=
 =?utf-8?B?T1lzMWMxUmhhVEpyS2pOTnc4YXdSTkRwcGUrSEQwMlFaSG56L2RNdjZ6aXhD?=
 =?utf-8?B?K0diSnBBOUYwZ2NCblZneVBWdFl6UWQ4UDhZNk04eG13Qk9kbFhWRWZwMlhp?=
 =?utf-8?B?bFpEM01RWXlqQVhkRGpKNWRDVWt1UDEreU42aTBIVmJtUEwwNFIrRytKSnhJ?=
 =?utf-8?B?VzBMWUhnZWZSOVFUK0J1dkQ1ZlM2c0ljQ1FvNEhrZ3FRUWc2U0s3Rm1hOUhJ?=
 =?utf-8?B?UEFqaWdzNnZ6U0pqMWtkejVTeGFnQ0t0UTZ4ZlA2ZmtPR0FtZTRnSVpJOUZK?=
 =?utf-8?B?RW96cVhrK0FlRk9IZmtWMXRDK1VoY1JxTmdNTS9rSmVvMWV2ZWV6dVkwTDBr?=
 =?utf-8?B?bVo3YzRRU1J4OVMxY0Z2YXhjZ2QxajI1NlpORHNNb01FaDRrOE9FdFYxcDR5?=
 =?utf-8?B?UGhkcUxVVWV3WEJHRTNxajN4eGUyazlBSi91aUVxeGNDK1kwa1VWeHE3NzdL?=
 =?utf-8?B?b2RhSHB1RS9VbVBreEs0YWZMVjBlL3N5YW1OQW0veFVHdThjU2gwdmhiN3BB?=
 =?utf-8?B?SnJHbDVlNXB4dHBuejcyU0YyVWp1c0VvaUdNLzVuS1VGWEFyVUxBcEt0am9F?=
 =?utf-8?B?cUlkdEgzNU9PRG1WbS9hN29YdzZhcVJoWUFuQTVwSWJOS0hsQnZ1QmpHU0tl?=
 =?utf-8?B?UWxLeEU5VlFwQlhlUVdJc3U5VlE5OW5kVk1aOFlRbkNsYitPMm40RnVzZXJX?=
 =?utf-8?B?cmdDKzNGcHpSWEJWZWVPRTYrcWxWUzVVWm1pT1p4YU54Q3NUekdWdGVUZ1NU?=
 =?utf-8?B?OVo0Y2tVU1Jpb1hnUWt0SFRwSXUybXZJTEV5cXJGSVZ2K0xVSUhMQUo2anFp?=
 =?utf-8?B?ZFBsa3Z1cURJbVNpUkVGcHFYcXFVY3U2SUhkYnZTM25aVFpycTd5UlJnK3pk?=
 =?utf-8?B?L0ZhV2ZOSGQzQUlHZlY0dGZMa1JwZWNQWEJXLzQ3YU5STVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VThWWmFVSmtlbzg3QzhaODdrdW53NFRmdVZMWjRkNkFJVUp6ajY2SzlVdisy?=
 =?utf-8?B?V1RlejhlM2hIUTIzcjgwVEpqRWpPNzIyVmxkQUJDWWxUUCtUTk9MN1pkcmNL?=
 =?utf-8?B?QjFHeVF2UHFPUnZhSHg5RG5RQVNoSXNnR0psNnZRRnAwako0K2RDais4NElD?=
 =?utf-8?B?ZnBzMHB0Z2Iwb3o1RFBsWWRzVHBEZVFQdGJIWUdZN0JOcE5IVUtLKzYvWTN0?=
 =?utf-8?B?T0plbko2SDRGbTFBNzJaS0J2SUtRSjVxUjZhRkNMRXFtamxaaFY3VFl3RGpr?=
 =?utf-8?B?aWxLR3NoTFFCOUZxNDRFdzRLazB5YlFiTXUvWHdkRWRmNng3R1hZVnQxcGNk?=
 =?utf-8?B?eTF5SE1qTFdYcGs0dkVPK2U0bnJzUUs2UVUwbEUyV1VrTXUwMTFwOTZYNmNS?=
 =?utf-8?B?YVBxR055aFlreTdnNFIzbDR1bWdCUC9LeUZuWmJla3cyVU5QREdjQ0k4ODlH?=
 =?utf-8?B?Q0dISDBuZzUyc2p2ZGRpQUpFQXpHZXFhbzFqSmViak13MDg1RkZ5WWFkMita?=
 =?utf-8?B?dDBadDBKVkRORkJOMjFLS1NMblV0RS82aFpMVStjQWFPc0owMHptQkxicDNn?=
 =?utf-8?B?NmdEUGJQTTVCVXNYQUFENkVNQnNDOFFxRkRLd3IvamwvZG1NVmpMRi9GYjFQ?=
 =?utf-8?B?ZGFJZVNta09jZTZ4SkNja3Z6L01rbkZDRnYxQVZqQTcxRWUvSUN4R3ZndWJl?=
 =?utf-8?B?Z1hzdXNjMkJTdldmOGM5UkxpVEVpNU0vWjl2bDlRQTFSN0FaOE9CK0RreDV0?=
 =?utf-8?B?ZHkzVmlaMU96cks2bTg5M1RrTDQ5SVl2bU5JZVNHSVpSTWtGK1RsT00xZGRO?=
 =?utf-8?B?b2FheVJlMkpGeHVLcUFPOXloTDMvUmowZVJyeTdoZEhQeldvQldJTXlXNzBM?=
 =?utf-8?B?b1lQWTZYdXJQSk9MbVF1Tks4dEo0aC9lUWFhcjI4RnYxNWw4YVRTRElKd1hR?=
 =?utf-8?B?SnZTZzVhanl0d3h5UWZqc2hhUWVWcnZxWDNaTTlvVEpGSnhoVHNySEw4Mjln?=
 =?utf-8?B?WGhreDA1T2ErZXVncDIwZ3JEc0hOOVNqb0F2VnF4VmYvWEZrckRLZG92NFRG?=
 =?utf-8?B?K0g1SVFiay9CSm9BWFl2bXRKVFNTMjZKVjhsSWpPaERRUVB5MkxnVldFa0lK?=
 =?utf-8?B?RGtEa3pXeWVMSXFYVm1uR0prVytkM01aS3pjNzZvQzMxMnNpdEdiNWkzNDho?=
 =?utf-8?B?ZnRvYlBpRStnT3ZPVGN4WTJNM2JKN01RYTl3U21uNzJaaXJ3a29RVWpkYktQ?=
 =?utf-8?B?Nkh3VUJ0M0M3NzE1S0tlcml5QU9UZmhuUUJuSWtxOEJTZ1pQT0U2OWNEVVlP?=
 =?utf-8?B?OEdudWRBMEovcVFEaDNCVnc1blZPVHo0MEpVS2xsd1E1Y1RvZjN2a01CaGdV?=
 =?utf-8?B?UFZNcTcybzhmMy83dzRSQTAwTmxhcmJ6MkZGbE02c2RhMENxUzB4MDhvd0pX?=
 =?utf-8?B?UlliZUdCazVCcGNsWW1OcHo1ODNsMWlJYkdmellEMGhaZ0R2Rk50NDVwS1BI?=
 =?utf-8?B?Rzh3SjN3bE0rN1QwUzhzbWVUOGYxV1BaenlJRk5hc09GREY5NXRCMHp6TW51?=
 =?utf-8?B?ajNSWXdvdFVxWGdNUGp6dTduVWFXblZ4SFI4K2d3akhKRENlcFMzYmZJZlpI?=
 =?utf-8?B?dWU4cWplVi93NU5RUTN3d0ZsSktvOGZHbXpCSks5UHV5THdoOXkxZXd2ekZr?=
 =?utf-8?B?RkNZWDNEdVpOdkdwTHhaaGlROHFxVDh1Q0J3cmptR2VqM2E0SUJYNnZiaUtZ?=
 =?utf-8?B?TzNBOGNNcDA3OWlsdHNFbWFzRkd3SmdvSU51UjJvSm5sQW1ZZURUZHFZc211?=
 =?utf-8?B?VkFqN3pxSktMaEJ3S1Z4MkhMcktxOWZYL3BqUitUQjVtY3JXbWl5MkVjR0lG?=
 =?utf-8?B?WUJvYmY4OWFJSE94dnJWNmNKcUkwWWppRXdiZ0Qvb1daeHllV0ExYWtmeDk2?=
 =?utf-8?B?QlJQZmJ6U3NxMzUyTmdxYXhPcEI3UWc4T01MVElHMk5wdUYvTDlQSGN2cEZr?=
 =?utf-8?B?dW84cWNlcDV2N2hmK05uUGZzbjJWa1duT0hJa2Rua015QUpEbEJOVncrTnVT?=
 =?utf-8?B?ZkpROUVlcit0czVNaXk4UkhPVUl4cnNqenB5NllpeXVxM2R5czhwM2QwcGtu?=
 =?utf-8?B?cERmL1g1S3pyUjZUQSthbldmcTU4c2RIcm1TVjNKb3ExejdFTXpHMWtIMUM1?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a38a060-7bb6-4d2d-fd6e-08dd81bb640e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:33:20.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ2wMqkG09JjwLHKmLssdpz6Ds0aopl5fZxKdgB96BoftP9dKfs6u2DP52wZ0dolqczEXJHXe/Q/2MFdg8tol5d0bjUU1lVAhwg5w/DdPI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 16:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215240

Hi Alex,

On 4/22/25 5:55 PM, Alexander Kanavin wrote:
> On Tue, 22 Apr 2025 at 16:28, Quentin Schulz via
> lists.openembedded.org <foss=0leil.net@lists.openembedded.org> wrote:
>> When trying to use vkgears on RK3588 with PanVK, version 9.0.0 (released
>> two years ago) currently crashes due to a Segfault. Considering there's
>> been quite a few commits since that version, let's use the latest commit
>> in the master branch instead of trying to figure out which patch(es)
>> exactly fix that issue.
> 
> Please no. We do not take random development commits just to fix a
> crash on a particular target, and I don't agree to making an exception
> here. You can figure out which commit fixes the issue, it just takes
> more time to bisect to that.
> 

/me shrugs

Still doesn't work for me outside from now being able to run

vkgears -info

instead of having a segfault.

I'm personally not interested in figuring which commit is fixing vkgears 
-info for me. I only sent it because another long time contributor 
suggested I do. I can see arguments for both sides, it's fine if this is 
dropped, I don't care too much about it :)

I still think the second patch would be nice to have, regardless of the 
state of the first patch in this series.

Cheers,
Quentin

