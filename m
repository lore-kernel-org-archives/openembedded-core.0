Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83257C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 13:25:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.91])
 by mx.groups.io with SMTP id smtpd.web10.15063.1745501147535494770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 06:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=XuekN2x/;
 spf=pass (domain: phytec.de, ip: 40.107.21.91, mailfrom: w.egorov@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCl5bYTHmAL2Ukai/vgykCOnQbZoih6qepgapxTFteBIQqKGpl81KGDT7Hi+zQ9KoNTt4h+Kz4hOnrzeCXys8gb/gqjAgjlXvAtxdQYVm8uv1Ep6SnYHLnxpL5WuttAHOGARbE0tKDST88RZGkxffiwfGGIflzxBEWq8J3EemLvHOwIiV9/ZrwrieT9eawLtvc2rI4pBCP96syPOnYSrAZZI57xFvz2C34y+6U4uPZYhAEjmeFdSPS4KfpjpCImIHanEvRSFU5lSQa5+thaVb6Mc3s0gnviIJA0ovRVgvmi1dbBEg0bBhsw4qWoofXWUAllkPSwOodts90v+mMBhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7h9SfMweEe5nNM6F53stiPhvyBKDDe1B5FVH6dhIa4=;
 b=qIW2M1TURWfyn+w0x1GtZgyk7QX9/CVK7AZM+rfipvM5nCjM7X1lsEeCcxHF078fxV4JRT1Ty9TyeawcnpooCBiKL8wq6agqxHqMEhU/7/rO1xmkUvei7UXBBzkOFhg/rlAD1ToUuJyQ4pTHhZfwPnNz+CO2FtQU8lsfkGc0XIpegyEJIs18S+pHb79BnuNhmyFdHu4JGJkCjpuHc7nAvcY2Syys4bXDjHir3CPycHyNDzubjek3rDPlEGGNreKnz9y10bQ+zL8Zl2roKPpfv3hnpCmJuSjmJ+9Givv+fdvnLVpoAiL49DCX8euzybNPsVSfYZ7BMUseoCVppgUV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7h9SfMweEe5nNM6F53stiPhvyBKDDe1B5FVH6dhIa4=;
 b=XuekN2x/UxwlIj+txc6zGxBbYRwxz2FWZWcZF78hABMcbJEJ2+ntwh2rXSPiqqtvG6+Mt/bfg6pbgWZOAV+SkgE4GObW2QP7Ae8+qh0BkxdUHdcC7LhCb0vJ46JhgMba4Khs6CewUTc0LwxESX1wP6JI0QlxmWgcX4Hd5ec3TBHOqjMW8WqT7vknlztA0iDGlekU2I29r6XBUpbUf90yCgFe6BPDJgMN4PaZgXapMquo4tOZ6QalR9CVzmYymAnY+eaC/s//gwoutW9n2NVKEUzlna3AjoDld7vKmRTpjsBB3FdAf3eY8yNmjYRehHCuwPQ+F6Onx1Jd/MuKbwJy6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by GV2P195MB2328.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:25:41 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 13:25:41 +0000
Message-ID: <134ecd82-b8eb-4752-86b6-03a63c2956d1@phytec.de>
Date: Thu, 24 Apr 2025 16:25:39 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: u-boot: Provide option to install &
 deploy EFI capsules
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>
References: <20250418152706.447180-1-w.egorov@phytec.de>
 <6E3809F8-E1AD-4243-8738-22E4179DBC25@arm.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <6E3809F8-E1AD-4243-8738-22E4179DBC25@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|GV2P195MB2328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cde3c75-4f14-4c13-548f-08dd83338279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aD+SF4cht4cB5b7wOL8N8542fqKmTb/zgyfqGKyNA101Fpk/HZofL5emFXct?=
 =?us-ascii?Q?geGABRehXbr7uli4XRBVUP1r3spbTp8wy0mZMUzv67ow0GbPzyNj47VHKBQ0?=
 =?us-ascii?Q?ifkx4px9FBOwMj4FtcwepPj9s/VaVvJWFgNp2z4kr2j4ovF9y5x9g5FYitQh?=
 =?us-ascii?Q?93FY78BM/BVoufifKoXetm0LdYK6ek6TvNiWP4PmW/kfwE4gp6vU+zVdnLt/?=
 =?us-ascii?Q?IbMSZ2f8dFlfBQghLBZjSuh5k99Eb9l5RGb2S5dqYLii3cCh59z82ZSg7Ryo?=
 =?us-ascii?Q?+oOxbw1d80NUTbp9vYq45AQCKe9trRTb4QB4g8PnXZZsUAMpLIzt0mzwxKnY?=
 =?us-ascii?Q?ucCLW5H75xYUlGwLbbUBQM5bP2ln4uOQeX1ETKTXtIClDJ2DYJNMHj9qy+s5?=
 =?us-ascii?Q?bgsS41ylC1JvNVrL//2YAKHaPQgaW/ESbDrWEM0Hk4RJ3x6sYfuLVXhSCq7N?=
 =?us-ascii?Q?JWZBjMkPRFySzRCHp/fxQT5AT/WK88UKMSUzf7KXiqIppdWoz+X7Ek0Y+Cz0?=
 =?us-ascii?Q?X+eCdeVvfo4Img8zTLgAQL/bVsC8sz2OSmqyHVGStGVCnLSVOoglbHh8eu4t?=
 =?us-ascii?Q?AFdw2+9V9+t44cCh7MuIoxFYEew168NJBIW03nJWIaG8vvGylJB0JblKiJuQ?=
 =?us-ascii?Q?LGMgRxgI9Tfm4+WQAofNSzDPQSBMNAcG5z9Lwz5V++t+8RyD2Wu7W1IDHGPk?=
 =?us-ascii?Q?pjDKZgqCiaHclXHR8wpKSiN8jvGmleom0sMi0CrtHr1XPCYsZIdW/oBibOx8?=
 =?us-ascii?Q?rx99z10N/XNVGHy7zTPyBb+dMLJ16+cmqAmFojme83DSeYzdzM4OZaLk8E0e?=
 =?us-ascii?Q?0zkAd5i3KgaZCxEeAs4Q45/v2fmqIAJhm/HVTIZWA7V/KI9jEXZF6OdjUPr6?=
 =?us-ascii?Q?IV+6IYsr1ZUuooAHcV1mXY1FjAWINSNb7Nj43DbuTuD8B/fNvn01/4IMa91t?=
 =?us-ascii?Q?9B6E0M8U32ksHpd34NOMePFPibm2BvqK1QGCXGNKklVY3SEMt7jwiWXM041c?=
 =?us-ascii?Q?ciSDYFCNSvm6LxY+Txd5xQ2333b/87wnyi8nDhC1daHMW6IyzNxp1Cb2Fl0Z?=
 =?us-ascii?Q?0ME8w/UJCefCG1reqcWd1J7cBR25CuUVS8bDie9mEg5Op/iZmUItawBQl3V2?=
 =?us-ascii?Q?ke6sQOMb+ellYJCk1I6wpPgaTK9tNTd3vtERq33vOhBFb1qwgVsp86Sg2AzJ?=
 =?us-ascii?Q?O/e7RMGWckQwIS7uyKuh9gD/ayfkrtYdUUNmMIMLN6INC33W/0e//aC2lY6I?=
 =?us-ascii?Q?bbru342uDVSt+BHbtAO5stNZpx/26QKvHgek9XVBm+hqBn0gUVZ5xRrnIPUN?=
 =?us-ascii?Q?r/AupPNRu7Ob/cHtYTcpzgQoszuUnK7YOCUVZfp8euE0ozgXWDU6RUMZRV6+?=
 =?us-ascii?Q?Ai0Z57W+oZ+OSvP0x35GPTd6K+nO5alRRj9lw+Uo1wbfnZ9WREdaX2sccPOS?=
 =?us-ascii?Q?YEldG/4xKxU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xlczlyJZT7xLNReSN/jgBc77aRRSsVATJcAw/AujMIc/AYRQSkp858zAuTaD?=
 =?us-ascii?Q?FWYqgSG3PsR81gond9A8w6FOCsGI6BOk3CfR4PvGIHqDrYt7NfXc2ZOoHm1C?=
 =?us-ascii?Q?XLnUqFdt5KVxIvUkozelWDQh0pAlNOxJSx+TyvhyC0/vg/1e+vhTlnAElyGI?=
 =?us-ascii?Q?IU4IHlU/5bIaIP+aFYDLt/zi569AhVcSL+JVebfZ5N+Hp0AoPIeYGCZrHeKB?=
 =?us-ascii?Q?mG2CPJai0WpkT+WRxOmHXTwzq8qqTrs4bCYQVtwe8AjyONxfc6t7Z/uQ9y10?=
 =?us-ascii?Q?0/C/pqt1Gt263DzR+Zr/75mFcT96Dia9AOhRvLDO38sR4n7mPBleeNxJVN+4?=
 =?us-ascii?Q?lx9dbbHtF38W3kxb4n+1iZngWkUfNGTVzZ1yd8oTqMdDX3EOQhtA0OKpkCqm?=
 =?us-ascii?Q?OM5ajN+9LQOoR4HRiJTujAtQhdHZNprvixr2NfVeUrImlWFhofw5HIUUPk6M?=
 =?us-ascii?Q?CO7ZNFb+5UeL6u7jTs+sewQ/+g94/OaXQwhz84YawFsrRhaGP8VRkUGZDOwj?=
 =?us-ascii?Q?GxYPpu9CKhikR7XI9wwHXWc3BFfKwtuZTXAxNwgJD+5yOGH59YcOtwFioUU2?=
 =?us-ascii?Q?EH11wijl7Ofi+ZSVqZdPr2e1VelLYnJoa+IM13bwK5B3dq45SK1cwKTY30a/?=
 =?us-ascii?Q?UAxnK1goER3p56z4BnQiLfP9i8h5b1gnwYcy5AGRlKE6pn0h88CZoFriL/vc?=
 =?us-ascii?Q?kmby5Dbb+Lojn57UGrpD0EAXLOnGn1Xk36LtbuvhS1BYAHaYiRy7bXjDfymq?=
 =?us-ascii?Q?P8NnGM6a8JO2FCudHTZL+YhD7+KBUYSPUIzuPVHEjCiQqUImzG9VOMbV7gbR?=
 =?us-ascii?Q?j8fxXdeAKdVYiNyMMCK+Jzg9/j8I1KgZpRAoZzbl2hPdkH3lD+8VDXp7hJUx?=
 =?us-ascii?Q?QhaduVQPyv6IHksoWzmY7KS4BLG2ODMG3noUD/oh0gTXVrJxyS/WzHtJ2jMP?=
 =?us-ascii?Q?mCS4sfYHLOpP0xiTuJ4H5rTLNHgSR0qy8Mcf6zVIkoKwxcEKdvjV2O0x3byb?=
 =?us-ascii?Q?cPTqR7NsboaILO9DGPxZiWMBoCVhg2B/skYkrtmXVHI1ul/IAewls12ubBG/?=
 =?us-ascii?Q?e0xMv0fcp4XvCDYkwUb2IOyHolyYvQkdBua3NanXqxbA2PjiUl4EGLeu1eC5?=
 =?us-ascii?Q?U7EURLuNZmcVrmtAiSRXiDbieEZy4Qmkilr0ApnzCUrd4xgDc/sRFsxHGDFU?=
 =?us-ascii?Q?1Z9ja9PgaHdfZlUB2Dqf3QK8Dt0z25P3NTdgt+rHjM/1CudRP88ShJccdUf3?=
 =?us-ascii?Q?b8hDZjYduXv+tf5ijbQrUQ3B2wePzE+YgB0paHpQHzAhqAVvGc4+FwQDHCSM?=
 =?us-ascii?Q?3WI5HM++w1rTH7vYeldFvIPQn+Qpn0fibCNzdf/6rWJuOvEi7I03AZxIapE1?=
 =?us-ascii?Q?c+pa+HyYzkfA/MH9f82HmUk0OKGdTnu7zgWKNgBz+FKadmsFKpxm7Rb2m4cO?=
 =?us-ascii?Q?YcGBWvSkPwy2JMpg60GebidALUDqRLwnZ5fk0wjeUCarDfBlg8MqU54a02I7?=
 =?us-ascii?Q?IaKBWWOCurxL1XBjDc/tI8z8gs0T94XJbse2FHQiU1d8ooS/BI7R0w8Zsc8U?=
 =?us-ascii?Q?D3vZyYFTTCQCsVnFvSsgE6k908hZjbluo+DqvVI8?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cde3c75-4f14-4c13-548f-08dd83338279
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:25:41.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yULukFsnsiVkaMlKGfWin31o8nMsagFgChF9vFmy0mJBoLd+zQNtbOrcEjpKy3slu983PqHSX4YKKYFPNMokdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB2328
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 13:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215372

Am 24.04.25 um 13:47 schrieb Ross Burton:
> On 18 Apr 2025, at 16:27, Wadim Egorov via lists.openembedded.org <w.egor=
ov=3Dphytec.de@lists.openembedded.org> wrote:
>> Add support for installing and deploying EFI capsule update archives,
>> which provide a standardized container for firmware update data.
>>
>> By default, the feature is disabled. To enable it, set UBOOT_CAPSULE or
>> SPL_CAPSULE to the appropriate capsule file (e.g., uboot-capsule.bin or
>> tiboot3-capsule.bin).
>>
>> This option is especially useful when a U-Boot build also generates
>> capsule binaries alongside the regular U-Boot binaries.
>=20
> meta-arm has a uefi_capsule class[1] which is similar but more generic: i=
t=E2=80=99s an IMAGE_TYPE so you can give it arbitrary content.  Let=E2=80=
=99s not have two implementations: can you compare your implementation with=
 the uefi_capsule class? Are they complementary or can we move uefi_capsule=
 to core and extend it as needed?

I looked at the uefi_capsule class, but I was thinking I would rather=20
use the artifacts that U-Boots binman tool produces.

Many K3 platform=E2=80=93based boards in U-Boot already generate capsules w=
ith=20
binman. If we skip binman, those boards would need to keep metadata like=20
the GUID in more than one place and likely make extra changes to feed=20
uefi_capsule class.

IMO, U-Boot project knows best how to package its artifacts, so keeping=20
those details in binman makes sense. Apart from that, both=20
implementations could give us more or less identical results.

Regards,
Wadim

>=20
> Thanks,
> Ross
>=20
> [1] https://git.yoctoproject.org/meta-arm/tree/meta-arm/classes/uefi_caps=
ule.bbclass


