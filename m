Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B65C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:59:24 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14029.1787569160159903685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=hESrZpns;
 spf=pass (domain: cherry.de, ip: 52.101.72.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdwU30Y18bepiXIeurQWVuQEVJMolFGcxqjGzQ6VW2TQTy7wvE8ALyaN5ByR0ENE1AyXZvOvTw6MzjS9yfLrmlSCb1hyoqZ/Xuhz049NkIobvEyehkC8JuB3k7GTP6sv09WANELWr6n2PDSG+HUSRYe1NDQwrl+IAdLun19qbVaOC27b3g0MUYjzLMb0ec8vDTP8ZLZ94nRtORxfJviZUS8T1w62+v07FgAgTGbOM4Vam4+O/T6E8TNRq75pkSnliTJzLvvP+3szCXihKKn05A+Jd15MormJr7Ze9jADSQyq4peTbihmJW8O46AzvniqdVbBk1e+ebVxgzI7u3Hfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qQAMSvZZSIxL7fCg4xQazCFYfCAzf9Z5UcVYv8AbUc=;
 b=FbB/yJbgSiyW19XLEJsyV18vbo9XTOS9m1gSHWZi5pQiuJ4d2xI+moWE4u4s9+wKYV5cmfPbTvt8Y+yioP3YXtUcMdoaPw2dCRlOqhhBQv3sa0FqcyaX0zakfWOJDZkRhbVzWi9dDCkGBIxfUKvKiVzRrIo/0MUQUNTHn8WtOv1zY+IcsQ5rY64JphfyUv5VSvNOe5LVVX/xZ3cuGL77BX8L9O+wUb0HjyjpP4cwrg697Oy5CubmSQCWgRZtHhz2fEzIEwvt1T6ZSqqsgDzg0WFQ0D1KgcPNjFWfQnnorkosH9MtpFhiK6hJrv2iVs1Xe/MuwjaraP47U9FA8B2heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qQAMSvZZSIxL7fCg4xQazCFYfCAzf9Z5UcVYv8AbUc=;
 b=hESrZpnsK7F8vGboYMtc9odTd7uGtbRSp+HY9Z9LNnZXWIwsHW/39NfYVQndvqG9RCpe08G6bLcg1SCahtRpH9KyWYEqMrDhIcl0icdU73ot5OlmhvInlbWDrmF5CEYup27ukQc0xu/5VfYR73EnusewyF5XXIP5wQW8l67mNgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU6PR04MB11134.eurprd04.prod.outlook.com (2603:10a6:10:5c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 10:59:12 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 10:59:11 +0000
Message-ID: <6b422a0b-f8e9-43d7-9b5b-4573827e35d5@cherry.de>
Date: Mon, 24 Aug 2026 12:59:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC v2 5/6] u-boot: fix build with OpenSSL 4.0
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-6-jaipaul.cheernam@est.tech>
 <b7072aaa-877b-4648-90a3-29bc85f187bf@cherry.de>
 <DU7PPF66507B2D78D1B5F49185A6309CF0FF3A22@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DU7PPF66507B2D78D1B5F49185A6309CF0FF3A22@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIXP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::8) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU6PR04MB11134:EE_
X-MS-Office365-Filtering-Correlation-Id: 569aa172-6389-4277-5b8c-08df01cebaac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NijgHucfnkJ3Iavbh7FNBmPlE3GWDoM7vtTdZdhGonkEjNOu3c/MJjOO4gaOXqbfJYcmXyBbs2YNzNdzJIEGLAS6z7LauPuWcW+E+XFQNiISUVyUXcHEe7/0tN1bOZLOPXApfNNpzXG4PpVdXwqU/i8O8iPMd6v0oy8bZAZZhKeegqCbs7A/F3F4kmNCoyczpDQcaxWSamz8eFmwHKv7rHPW3iEGuzXI8gJKmNfNnu8/3HilO1bsMPbj0nlfh2EztHhbkIqskV8Yzgy6F3LCxFklsd3RKQPVM3nRIU1jsE2heb2Fgkn8x5ROzf3+xeBfMUWdEemuWGStqH4v9S38nwldNK/o7o/4sfo2zdSEpSktnzvxchtRdASDH0S1rCYyvc6yPTplSYDIFvusS/JT8tO5hPH5wfcNROsfdNVoFPyh55jqc2icxNOESSnrn8aB2kUi1iDK1vw14oXMkXTFnkFxUW7Mc2G+tI1NV98scaOqf0vrpwlyp1+nUguXwFdFmPM2IksJqu81vtMtKAQReWpB+qkpid+rygL/kggi37+zNRspuCJ2hn9LanI7zzRKgYb3+RVRN6o8fc7GuoTMmcXYPqr6hhR6QqICMg9iB3Zj9JIC6nKrJH/96zVzzCFfnJEFeM0mGKHqbnsWPT+xCtUXCFivDgISWT0jMWalt9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t/bgfIS9+tr1IGL62YCVO1kbiRYxVc8es6kMljFng8RMiaQXD3pXeeCBK4kq?=
 =?us-ascii?Q?G964C4OQ5XAMCie3/nLfZnaYsjvJyu24hB18UfbsIs9Jc0uZENTOLMldOMo6?=
 =?us-ascii?Q?QfeVe6lRVjM/SaJu5+Q14C4PaTDBBJv4auRyKgV3hPcjJMSio28xWfgnEKx8?=
 =?us-ascii?Q?i2dCsncy6hL9HG0mn0+zKK2/Na+HzDVj9iHYfIycoFkgCxwIbRY4LzKIZLbt?=
 =?us-ascii?Q?fhZ7n3L1OeQXmJi1bbUYUKSn7++49Ve1AGgsnuAo6pszE0Cz+x7Mhnc6IXkP?=
 =?us-ascii?Q?ltWOpZ8RJ9lWgPXOjHM1yfeSlBffhHG6hsYELssvTHtTUCSsVjGz4WkeF+j9?=
 =?us-ascii?Q?yI48Wx9qyBn9bnzkdb+/HexDcoZuNPvhzl35Ccw+MpzAKSUevMxoZOdFVmzx?=
 =?us-ascii?Q?EANisi72YyrWQ0rOE6kIzqljUWJ7dXPTN2KCF0TXBks8cRpj1FfvYyAVEBA0?=
 =?us-ascii?Q?ShcCvAjYGYlD0cHqlxp8O/f1NHhcJeATNHQ/A6Sdl3Yk6pgE/jZ8P31/NFy+?=
 =?us-ascii?Q?zV+sOvV0f/w81IEb7waPE16l2wS8uBawq2hSRfr/jrRYIUJDouflV/YZKVtl?=
 =?us-ascii?Q?8ZhRibkADT9rJfGklExPC5b8RVjMJz2DEGqtEjEk+dPw4MCB2dtPqyT1kiNP?=
 =?us-ascii?Q?C7Zufi1ZihdBf4PZ130RrtQiyQVwqtug85m/3EYMBLDPyLouRx8JUjVdwOk7?=
 =?us-ascii?Q?5aqRNGNSInDg3Sq89iCIN1AmbltfscPIpC/JwGqR53SPqHp0pPTH8yAZWzPa?=
 =?us-ascii?Q?SmNFslaFsBUDghRtxQhjik4h3fdtQl/YEA+DOXO8vAm7EW10+RbQmI5Lyc2O?=
 =?us-ascii?Q?K4dWqphvTL7u47tHS9Cle3c+QKPmsfqhvH8U6R31VE3iuHWJ0f75Glt7wf9v?=
 =?us-ascii?Q?9Oq9AZfxTK+4Pd9MldGhhuXgBM9jefjvVaKA/KwdFCP5kz/XqICCuJtPrB7a?=
 =?us-ascii?Q?Dcmm/y387ucRFh2UKzlQ5HB8O4YoanSJO7U9LRChY5DzFMmgGAm7D9gZNNq5?=
 =?us-ascii?Q?hZYatIoGIJGUoGSTaiy4cZnnEXZDaAlkiFSimF/JnTLWY83XI13SQ6cMVVuD?=
 =?us-ascii?Q?jkxrj7y0/FGt8jhsOXKz20WPa/xta0rnAQTcMvvdfEx+LSPICTJ3t7ukES+s?=
 =?us-ascii?Q?PtPx77j7FZu5Rr2qJ1pEIrrgEdQo6UhziwgODgI7iGZVovZjGoKY+poU4UO+?=
 =?us-ascii?Q?Fkmt1K41tCPAIFViGVGqm6b6vwOO/uViPhEW/cMcQb8u1svpJlFXmL05Vs3O?=
 =?us-ascii?Q?2ov0ZR0q3232U7N3BXsM6WTu+K9v41H+Dp0Ef5YQLVW3VxVjD42ptjVabBGB?=
 =?us-ascii?Q?BREBCgfDHqzqeulrMg1asFKpREWqQptIPBSVEE9vQKWQQpgx0VwSyeierKGb?=
 =?us-ascii?Q?6Ip9vKIAckkG7T7bnTQrf1+a1X/rAAUyYXNhhxO9um0cbglqbIr45lD/D9jr?=
 =?us-ascii?Q?Vn2mrZcoL/c8cCPYhqkq43TaMalUljrIPCvkonM7KnJBmN5U1AmH/nuA/8IY?=
 =?us-ascii?Q?pwLbzUCfzqLoVFe8VHjHMBT8lS/zq++G6ykdP4qwUK8X7BmhdsLOJrkW8eCQ?=
 =?us-ascii?Q?rNKXYuvCKazHdP3E0uLZw9JWRcanQC7mHAfAIc6jBrAMKKmXWbscmUkyY8m5?=
 =?us-ascii?Q?rOp67LLdwUTxr5Ee8STdAfEUCly70+rjANlssGKi+rOkMQZ7iifOCz5d5bnD?=
 =?us-ascii?Q?W972/8EdnNswYtMb0ydKUIuqlNzgfcMPWAmS68sEMC3MQia3uZg+wbUQwwxu?=
 =?us-ascii?Q?Nwd5S8OiAIoa5akIWreh8/dnkyEj5VHGMv1G1Zv9M8dfSzUIGAAPaKFwgRvh?=
X-MS-Exchange-AntiSpam-MessageData-1: DCuTioTuSRVMZr1vJnCm42wRlecWsEhJdLg=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 569aa172-6389-4277-5b8c-08df01cebaac
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 10:59:11.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p94rXw5bAi6jrBfrGFiKIbqd/26lz1sbvJFso/4bvuwaMryUKjHOwXiWKvUBcTUjxykS6FekhGKs0hVeR/2j8WtaquQpLoDNWMDN/xVBtNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 10:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244084

Hi Jaipaul,

Please avoid top-posting, this is not appropriate etiquette for=20
interacting on mailing lists, c.f.=20
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-=
trimmed-interleaved-replies-in-email-discussions

On 8/22/26 4:02 PM, Jaipaul Cheernam wrote:
> Hi Quentin,
>=20
> Thanks for pointing out to correct patch link.
>=20
> Yes =E2=80=94 the upstream patch unconditionally loads the pkcs11 provide=
r and atally errors if it's not installed.
> Fixed by making the load non-fatal: default provider loads first (mandato=
ry), pkcs11 is attempted but ERR_clear_error() on failure so file-based sig=
ning works without it.
>=20

I actually meant something else, but this too apparently was an issue as=20
highlighted by Richard in=20
https://lore.kernel.org/openembedded-core/9a98b9099e927565c0ed867b7598ccea9=
afdbfe4.camel@linuxfoundation.org/.

What I was worried about is what I reported here=20
(https://lore.kernel.org/u-boot/f1af4ba2-22d2-497b-9c98-09487ff06cf1@cherry=
.de/)=20
in the paragraph starting with "This is sneaky here"). I don't think=20
pkcs11 URI are supported at all because we currently (well, in v4 of the=20
patch) always check if the key exists on the local filesystem, which=20
cannot happen for PKCS11 URI (and if it does, it means nothing anyway as=20
it won't be used). I don't know if anyone's using PKCS11 signing for=20
U-Boot in Yocto but it'd be broken for them then I believe.

> Sent a reply to the u-boot ML thread noting this is needed for OE-Core an=
d sharing our workaround, though it's currently held for moderator approval=
 (!!).
>=20

It'll eventually make it to the mailing list once moderators have=20
approved it (can take a few days/weeks). Alternatively, you can=20
subscribe to the mailing list and resend.

Cheers,
Quentin

