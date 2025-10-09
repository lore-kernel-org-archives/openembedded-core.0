Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4F7CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 14:24:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web10.1726.1760019845634052967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 07:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fiBt1nDh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fiBt1nDh;
 spf=pass (domain: arm.com, ip: 52.101.66.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Lb1QQjgox/No8zhDIeC6baxoCyfAR4pSB3gAJoinKUlMajp4FbHNYVGf+AmMcnpsWCvcYevaa3LesXHhOYzBZdowhQx3w66j1Mwruc3eqs9b66FKOW0mWSJMoJgNQmUji7jQ8uPU5RfZyT25tJpdnQT14BREvNVzrITVWW8/wfAT2c8/ugv33mF44PMmaGf8XeHYLjcgmRc6WhO9KTRsDjNhpFN9Kuv0R3ovv6Hbvvnv+8T6BUas1wBjSXdp0ynNktXkcbnDUMR46k4Sdbe54fOzygCBjJWzmg/VmE4EDhGHLbjFdc0U/Z+gnwO5+27op0UAZD9+9v5K6UfHWFFMvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzioSF8CwwA4pbL1DL/PMgDj3nM2LObZfyLm1AejL5s=;
 b=T+6kS/ivd/g16B4R1PeRtQyButGd1DmZPkUHP2ux+5hnUwX/flc5GmF18Iru083862p3QybzXF7+mTGk8vYBQ5p+mRAFq274Ibf/kF6eoKfDAhyjLlMTux/SwDLMje/VM8rcDrO/6+hatWUm/uWXGBXQJqpq4+dfDM8ts8cRJ2TCfvQ+8BabsBiM5YQcC7YhEvR4zCAWoIstVjxVcQumtBefdUKGOrtaaOcaGvR9Kh/7wU/5BLDxaU+JfqJnqYbqn0VLmK80cWl7h6DOCU/q69jnzWZrxS4N1CFtj1l4NPba3e33WZsCDQGMBBww8VSpdlWlPXLzoFHTLJcN4J0Zhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzioSF8CwwA4pbL1DL/PMgDj3nM2LObZfyLm1AejL5s=;
 b=fiBt1nDhFIT01muC73V8vzOQHRx6QL9X/aPkUcKs/jo2hTYVtRZYqw6/LxbTxlFJY4LpCxYu786ZuNH76g33ZLyVkg8y0lFvD8PN5iPaOmgCKQFr2fRkBegLaO5OuhtFzbezlrPn3Dts+mLZeAFX7RMwZsktBO27Iv573qv4YH4=
Received: from DUZPR01CA0167.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::8) by AS2PR08MB8927.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:24:00 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::51) by DUZPR01CA0167.outlook.office365.com
 (2603:10a6:10:4b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Thu, 9 Oct 2025 14:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7PciVSzvHDWvmTtSiTa6yoq7yoRsRRoV7oRYrDYoM3ykgxpigqVYVLz24uOgwzWolUBGhwV7XO04DYcZ5s22SxakkejiRkwkrr+SLSVGrQW24Lzrf6rw5EWI8WX4BCygkhB70lQsU9zTFxCCSPIO28aUvKI7Rk1CbtDfQ264dz82hkTVpCwUKrvnwyYMVRx14un0v1n6MeVcHQjmotTQHUyPPlUBsYxove733zI2P746JfKej/8YbJcAEaDUJ3HfehZs5FiFMBIyY7uaiT6MYXu0061vgauZwbMiIgkcpdksH+x2i1ysk6H38FNyycOn0neJxehmvLPndMkz5xJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzioSF8CwwA4pbL1DL/PMgDj3nM2LObZfyLm1AejL5s=;
 b=GswvwzVm0DtdDxBKbXXX5JUXqB0HqpeJHr9sRR9nBNlL6PFNWHqPwHn7/Sp6vV9ypBF3gInkUi05bunbxbJXHFBnSlQP81eeepfgJb4DfgZbVAEvV3cQivpZ+tC2001cmUCmLrphKBDuocpcDOiA9EbiZK4ZMtii32buo1jltUyHh2c2WASJM5NqNxGim+2WxUOe2NeFOqwIvaQtn2Aihd/exY0WclLBCAlrS68tBsU6lHFetnMeZ2qhEBWT9MZTac3kUBZBYA4GX4VAX1xD5tHyOtOmEEOqDUE4WgGc7v+fTpL3nWVMTAKYBIVsrY6p4QW4AOIQ8rYxF6UDqIvE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzioSF8CwwA4pbL1DL/PMgDj3nM2LObZfyLm1AejL5s=;
 b=fiBt1nDhFIT01muC73V8vzOQHRx6QL9X/aPkUcKs/jo2hTYVtRZYqw6/LxbTxlFJY4LpCxYu786ZuNH76g33ZLyVkg8y0lFvD8PN5iPaOmgCKQFr2fRkBegLaO5OuhtFzbezlrPn3Dts+mLZeAFX7RMwZsktBO27Iv573qv4YH4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:23:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 14:23:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] linux-firmware: Move all firmware into
 sub-packages
Thread-Topic: [OE-core][PATCH v2] linux-firmware: Move all firmware into
 sub-packages
Thread-Index: AQHcN6GPDfIH6Tx3p06D7iKopGdzVrS54TsA
Date: Thu, 9 Oct 2025 14:23:24 +0000
Message-ID: <D8E485CB-74EA-4719-BAAE-2E4CE23CC7EB@arm.com>
References: <20251007154620.21284-1-reatmon@ti.com>
In-Reply-To: <20251007154620.21284-1-reatmon@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5696:EE_|DU6PEPF0000B61E:EE_|AS2PR08MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1b63ad-cec6-4c75-d8ca-08de073f7bb7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NGh5c29KWUJ5UFRzTm9xVVNDOGtRb1RFYkl6b3JrOHRKcGYvVTNYY0RBVGJ2?=
 =?utf-8?B?bkdHbGhhbk1RYnVyUGVZNzhmTXNRc0tvTHBJMlZ2NHFQTllDUGpBeEF5eWUr?=
 =?utf-8?B?cGZSQmpOSExBNDU1VUpuZ0l5dE8wTGN2dlNyLzlrV1B6NXZZeTUwZmRlYTdE?=
 =?utf-8?B?ZWV6emJidFlXdlZ3TzdVZDEzMHZhWUhBWFh2M3JlWDljZ2h4cjJiOXl1c3lY?=
 =?utf-8?B?dTl0UU1TdjNpOWJSUC9HUHdSbjhlcExHS085eXNhZ1htMS92dUZOWi9QSGRL?=
 =?utf-8?B?M21FcEVua2JqbTJvZWczRGlqTXVKQ3MxTnBKcm5iQ0t6c212bXVmL3dXU3gx?=
 =?utf-8?B?S0V5cU9zdEMrcWdLdkdVcHBFNWJTMXduenUxTThZWFhCY0V2RjZBdk9yM2Fi?=
 =?utf-8?B?NXB3aVIwVHhoakh6ZmtkUDdQbGVzeXFmL1pqa3BiYkxuSytwN2k3RzRvTk5V?=
 =?utf-8?B?dy9FLzVhRWFyNUo2Z1pMTWR1a2ZEZVNlMjVOTHZPTHl0K2JVQlA0MmhxS1Y1?=
 =?utf-8?B?eEdDV3RnNDV3eklwWDYyK1VacXUxQXRFSHkwWnRnc09CTk9PWHZ2VkIreTJK?=
 =?utf-8?B?RHpWOWl1S0tWR2xnd05pSFpldk5tcVdSQURLOEtjaTNKcDNpRUxLZTBSenFu?=
 =?utf-8?B?QnUwZDdZVTl0VEh4d2ZscVA4MWtzTmh4YnkxRWNHNTBHeGVQbXFNeWxGb1Uy?=
 =?utf-8?B?SVEvT3ZwZ3dLTXF3dWxyODdvcDdQTlhVbUNsUE9YRGhiVmxDYXYzVGVlOHp4?=
 =?utf-8?B?MmI5cnlJbWhqUVJvZjBRempIeEpxMmFUNWdXdU1nSG8wTml2cDAwc01icC8r?=
 =?utf-8?B?Mkp1TzNYRVFSWFRNZ2tPb3Z4TzJXTHA4UVFZZW93L2xUd2N1d1VXcFIzQita?=
 =?utf-8?B?SmY4VTArU2JWZWFlSGxmWWovVVlGSkRKZXNSbnc3eUcySnFkQ0N2c2J0Vi9m?=
 =?utf-8?B?cmhPS2kyVGdEMkNBMG1ya3pNY2FrQUd4TmtzTGJ1MndQOWplT1UyMmc0U2ov?=
 =?utf-8?B?NTVYSmhlZkdJeGtTcStsZE1KUnViT01nNHc3a2lpeWpidlpHS3cwR09qb0ph?=
 =?utf-8?B?d0RQREZ3UjFvTmJYNEoxYlNRTW92QTQxL2k2YUFkZEgrd3VUVkJSZnAzbzFV?=
 =?utf-8?B?ZGFUcmlFT1lXZEU0eE43eG80U2JtbUplcDVQb0hNT3dOS3ozdWk0YnUyc0tS?=
 =?utf-8?B?ZG9CYXVHS2ZMZG90MCtrWGx5UW1rUHJWZGNjbjh2Y3pPVVNLTVRubWE0M3c5?=
 =?utf-8?B?dERqN3g1R3VhNjVJQ3U5N1JUMEowSVlYNWplWHNKelZnZEU4SUtnUm80YnBn?=
 =?utf-8?B?ZFJsSGMwT2FQZWVvdnpSWlFtS1ZHcUlWUXJqMGsxN3Nmb1ZvY0U3NkV3MWhl?=
 =?utf-8?B?S1dVQW9SVE9zQ2tuVkorK24yNldZenQyRWZmeDRPYm90VnZ1RFlnbituQThW?=
 =?utf-8?B?ei9VQ3JrMlNxZ01aUDZwaG9mdk9lVTN5amVpY0VXNThKZzJiNWFZV2tVaG5k?=
 =?utf-8?B?OWNMWFluMmY3MlIwRVBuZjdmWHVJV0FQV296bjJUNEh0MEZjcVZteEZFd1hq?=
 =?utf-8?B?N0Ryb0thOFV1dmVYMEM3ZHJYQjRwemk2Ty9SdlF1SVJBYkZEeS90cE55OUJI?=
 =?utf-8?B?OTdnSDd5TG85cW5vRlUrUVlTTU9mOC9jTG9Fa1dyZk9IRjhsRE1UVkFDampC?=
 =?utf-8?B?dDVXMlJuN3pNTUJxcGdQdU55d1FxeVAvNFF0a2hxQUpmUjY1ZjR0bzYyKzBz?=
 =?utf-8?B?RXhKTVc0ZlpOVHl6V0lIemtSYjMxVCsyeWNubDA3VFF3bWFCVUVySU1SZWJl?=
 =?utf-8?B?b3lyS29rc296N016LzF0YnE3VmlDZ1Q0S3MwdHF5akdOUVVzRXg5MXZJR2lo?=
 =?utf-8?B?R0VMcWxROWZwSXpKdXBKclZMRWhwRlpQYzcvOCtsTWpSRi9nMHhReitZR0I5?=
 =?utf-8?B?WUIwbjBIQTlOWEorMStWSjkxTGJyUksrcGJET1lodVhIWUdyNEV2NDJBcmh3?=
 =?utf-8?B?cWUzU1lEVE9PTlI4WE80emJEZ2hoM1NLaExnMTZZQWJaWnVBOFF5VkJSUkdx?=
 =?utf-8?Q?51olbY?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8897DAA98E169848B34710987547A550@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5696
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	40cbe328-df18-4da0-8e70-08de073f682e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZEN3SmhPWk5HOXdZSWVKT3ozOGthV1RLZUZlbVlNUXdjS1VhVGxnVkxYQlNq?=
 =?utf-8?B?SWh0N1IwYVJIcytrWTRnVlBxeExLZmxnUTFwRy8vQjB3SWJwQ3N3OFRKRTd1?=
 =?utf-8?B?MDJCbFJGUG81ZUx6YStRMzNnVksyRU1NMWR4a1VSUDJqaDBxaGkzK1liTjJt?=
 =?utf-8?B?U3R2S2UwTThJR0RiaHBkclRKaEtmMVBXVXRnandyUG5Uc3NhSHQzbDZaZ2Vp?=
 =?utf-8?B?ZjRsYVlXMzhjZW1oeFFKM3hrNkJpNG5Oc0s3eXZUWG5pSXZYOWRYK2ZxUzBO?=
 =?utf-8?B?VmYvaXFTVlYwaHpGY0cwNXZMTUMzWXk3eG84enNUQzMyL2RuVnJoempqei9w?=
 =?utf-8?B?ckxjbFErSSthTzVVQkFVZCtPeEtMS2pxRDdnTStiSUZMeHlBekxBdTF6NGVF?=
 =?utf-8?B?WERNNFRkLzNzNS8xQ3JENmkrVE9WNys3YVFNRlhVczNYc1I3MHhvNDdudmMv?=
 =?utf-8?B?WHlVSDI1V0huaDh4TjFDRG1BeGhTMWxtdHZWa2FtNUI2aWNEcUp3bmZaTjl3?=
 =?utf-8?B?V2pmeGk1NkhwRTVTUEx3dVdPQkozaEhhd0U1MXVPd1JhS1hNakVWUWVuc0ZN?=
 =?utf-8?B?OHlGaUpjV1dBamRSL3M1VTlYNWEwWHlDMmxyeGFVYk9QdHQ5WDZ3RFpGS3I3?=
 =?utf-8?B?YzEvdEV3RFp2TFVZK0ZDckF6Y3I5YWFaajJhRmJpTDZrL3puQWhmSTlQUmxS?=
 =?utf-8?B?N1ZCc0x6VS9mVzdBMXo2eUovNU5lWWpNcHVyNjJueE0xSkJ0S084SnpyREZE?=
 =?utf-8?B?czdqVUk1UU11YVh0cThrdGlsRG1QUTZseXRrRnVtNXpIeWY3RC9tcjhtL0RK?=
 =?utf-8?B?cWthZE5PcVNEYWxTcVA1QkwrZkx4dHp5UHBlNUtCRXpYVHpzU0g4K3A4VjBU?=
 =?utf-8?B?U2kxb25tVGlRN1lKQ0d6K3hTRzJ4bmM0SkdPTit1SlJoQUZsMXV5Yk42UHFV?=
 =?utf-8?B?d0R4VU01cVJUdWdJOEY2YUtOZmxwTm9nUndSV2YrZ1hYN1Fmb0lxREpLanVT?=
 =?utf-8?B?Q2RkM1Y3VHViRUNpdHpnTEY2TWYyczc4V3hxbjUrZVU3OGVTTUZ1RHNYR2Nq?=
 =?utf-8?B?cDdSTXNVYkJ2MzcwRmtiaDZEcGh5b3ZZQ1NWTUtNb1Z0SnNWdTFlcjQyRE16?=
 =?utf-8?B?NnFMeVZhSjh1dGtocUl2UUdTWWFHWkZPSS8vZmFFOXQvQ0dIODlIdEh0a05R?=
 =?utf-8?B?Z0JzWS9jdDNXLzdYT1lPYVVoaHpJOTBRbHpvb0cxTkdDdklCZVFqMU5YeWJT?=
 =?utf-8?B?M0JyRFR2cHVEZjhjWDN1YXVqTVpTbDRnZ2pFMjhzZ0w2bE9ScjhEeVNGM0xh?=
 =?utf-8?B?N0U5Sys4ZFYyYUEvK2hKZGltSHRBWXVjZGpUM3JpN3docTJVSHN3NVRqT2Fm?=
 =?utf-8?B?UEo0WmpKTnB1VG50N1JGa3RvaTU2UEYyWVlwdGJqWlVTRjhJYUw1UkhadHJz?=
 =?utf-8?B?eWtJVDFSNmMwT2x0RXlJZ2cvMVNxK0cwcEFMUTRrbEMxQjRmMDBDVUNxd2Np?=
 =?utf-8?B?M2crS0R1WHdFbXk1NTIzb3I0TGNUTzFpcUY5OU1jNjNlZVlKdGZqK1p3b3hK?=
 =?utf-8?B?T3BTQWRWQy9SZHBYMVpxNDE4SWdFV1B0SlVTR1JKS21nTzBURjhyelk0WHdw?=
 =?utf-8?B?YitRNE1IUTVpMTQwaVZHMXFtbGgyRm5BK3JmMldZekZ0d1NHMUFIV0pzZkxn?=
 =?utf-8?B?a0VRbGNHSmI4Smx1Uzh4WCtxVkh1eXk2VlUrWUQwV2JUcTlXbG1naFdKVXcx?=
 =?utf-8?B?d0o0MGNNdEhqVkNIZ2pQWlduNC81dEo5S2FuMTBNM1p4c2tJcmlCY2UzUmRN?=
 =?utf-8?B?bVZEUC90elRFV3BrcCsvT29NMnQvTG80cDBIUVFUY2FFSUV1V1BHUkRIRDdp?=
 =?utf-8?B?TDZ4TW83djFGcEdoNDZLcGhqZ2Z4VDRIdWd6UlFDQzh6YUpaZGtjbG84MjBu?=
 =?utf-8?B?Y090bDNBaENKeDQwWkx3bmZMc2t5ODVVN3lZMVZ6L1htSWg2OWU2eDA0ZzB3?=
 =?utf-8?B?dEppZ05qRituVUxIdjN4U1J2TkhBSmtwMUhMaWFGNG9UWXRsRDVmUVlOQTdC?=
 =?utf-8?B?MW9hTjh5dW9XcklxZlR3K0k0N1MxYkxzSmxMTVJudGhiK2tKd0w4Z2NTRjBh?=
 =?utf-8?Q?vZhg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:23:57.2649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1b63ad-cec6-4c75-d8ca-08de073f7bb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 14:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224615

T24gNyBPY3QgMjAyNSwgYXQgMTY6NDYsIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyZWF0bW9uPXRpLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+IEEgbG90IG9mIHRoZSBmaXJtd2FyZSBoYXMgYWxyZWFkeSBiZWVuIGJyb2tlbiBvdXQgaW50
byBzdWItcGFja2FnZXMsIGJ1dA0KPiBhIGdvb2QgbnVtYmVyIHdlcmUgc3RpbGwgbGluZ2VyaW5n
IGluIHRoZSBiYXNlIGxpbnV4LWZpcm13YXJlIHBhY2thZ2UuDQo+IA0KPiBUaGlzIHBhdGNoIGRv
ZXMgdHdvIHRoaW5nczoNCj4gDQo+IDEpIE1vdmUgYWxsIG9mIHRoZSByZW1haW5pbmcgZmlybXdh
cmUgaW50byBzdWItcGFja2FnZXMgYmFzZWQgb24gdGhlDQo+IGRyaXZlciBuYW1lIGluIHRoZSBX
SEVOQ0UgZmlsZSBvciBpbnRvIGV4aXN0aW5nIHN1Yi1wYWNrYWdlcyB3aGVyZSBhDQo+IGZpbGUg
b3IgdHdvIHdlcmUgbWlzc2VkLg0KPiANCj4gMikgQ3JlYXRlIGEgbmV3IFJFTU9WRV9VTkxJQ0VO
U0VEIHZhcmlhYmxlIGFuZCBkb19pbnN0YWxsKCkgbG9naWMgdG8NCj4gYWxsb3cgZm9yIG1hcmtp
bmcgY2VydGFpbiBmaXJtd2FyZSBmaWxlcyBhcyBzb21ldGhpbmcgdG8gcmVtb3ZlIGFuZCBub3QN
Cj4gcGFja2FnZSB1cC4gIFRoZSBpbnRlbnRpb24gaXMgdGhhdCBpbiB0aGUgV0hFTkNFIGZpbGUs
IGEgbnVtYmVyIG9mDQo+IGZpcm13YXJlIGZpbGVzIGhhdmUgbm8gbGljZW5zZSBpbmZvcm1hdGlv
biBvciB2ZXJ5IHF1ZXN0aW9uYWJsZQ0KPiBkZWNsYXJhdGlvbnMgYXMgdG8gd2hhdCB0aGUgbGlj
ZW5zZSBpcyBmb3IgdGhlIGZpcm13YXJlLg0KDQpJ4oCZbSB0ZW1wdGVkIHRvIGFzayBmb3IgKDEp
IGFuZCAoMikgdG8gYmUgc3BsaXQgaW50byBzZXBhcmF0ZSBwYXRjaGVzLCBidXQgaW1wb3J0YW50
bHkgdGhpcyBlbXB0aWVzIFBOIGJ1dCBkb2VzbuKAmXQgc2V0IEFMTE9XX0VNUFRZLCBzbyB0aGUg
bWV0YS1wYWNrYWdlIHRvIGxldCB5b3UgaW5zdGFsbCBhbGwgdGhlIGZpcm13YXJlIG5vIGxvbmdl
ciBleGlzdHMuDQoNCkNhbiB5b3Ugc2V0IEFMTE9XX0VNUFRZOiR7UE59ID0g4oCcMeKAnSBzbyB0
aGF0IGxpbnV4LWZpcm13YXJlIGlzIHN0aWxsIGJ1aWx0IChhbGJlaXQgZW1wdHkpLg0KDQpSb3Nz

