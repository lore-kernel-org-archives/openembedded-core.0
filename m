Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE8FC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:09:55 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.11])
 by mx.groups.io with SMTP id smtpd.web11.13627.1747318185509028503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=TJahuKdM;
 spf=pass (domain: ericsson.com, ip: 40.107.130.11, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKQaUm+A5LNneAQI7Boz0fVe3BdzyIprtW+c1weliaMnYJSDuLZy0e+ltWw51MaTLc+604ozPkf1ZdYx3j4V0DgOAMS49mga5olWqx26eaow5ghT/EV+hG7wz8uIh4Pl1hM3t/UWayFzslwDV1xvX0PgZNKKx1yaUZ2qWd9CkKNAvItaCnv8tKP4gSPxV2kgjytEZy+hGSZjqbHQyKZkJLyVB8ezhN7o2HjeOb04Pbc+bEB76AHiReEzWFjrqXrS85aLZcRpfmJv8ggPgMAaSGKbLr3x5eG4QHuJH6FvrYN0vN8r3WD5FlE8U7X1RP6eR+3DZAgI9ptZaFYB6UmE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ithoq12akz25ChuOqg1KxzoudhmUWISsQgeu3kQYeY=;
 b=s9HQYSg3vVdWdNf9sJLNfK1qKamGa5DuLfcwfB7pC++U3jTgaJc6ESx3VILSYNC9HUue1lV4yRHIH8mB+R7d47+eBTHfoi1xjnZZENgq5d8ubrrkDzjnuX5cZqLITE6LBJOgawNj4/m+nspgtasqj9JWdh2fWiiImPftmb7XVUmy8OSP3EXYN3SehvfYlcvhtT1xPg5gtfqamW5j54rrTlCyZZX7qxhaK4FiJcYWfAJ566MIpdEDC2FFkMjwQBkEWTMEHcKNP6ZFk4F1Dz7KgBaxYxfv4WV52ThiJiMVxT3DS+6R+F7tG/wgIBAhJw4/dIiljKglYbqu2FORfz4o6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ithoq12akz25ChuOqg1KxzoudhmUWISsQgeu3kQYeY=;
 b=TJahuKdMlXLKlMoIoaUkrX709Pl1z23mv/+8LeUj+qaHf2kOECfF1jVtZTTvygOtAjYU0TzZz0gHGTDcCokx/nFLGp6acVGnxKyP2oCexN3uv1iuN6QSYaMynOukcxKKB6VyMW7wi1Xxm8tqJzNjR5sUfw0sG7HxtV4580NpzOw4AvmeFwqTk72P4rMInt8lWKxtCX+7KQYmKnpylqHo3WBLMuMNcNWRXejBtFwIuxt7w1e4XjX315ZPNlA39cmTwkp1EflN6tQS1Tgh4Hgz26guXVQOJjhLR9uiTDaRxJpiF0v7EDyFQLThcCvdXtoUsPriEvxHfCjlu5RmbVRW6Q==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by PA4PR07MB7216.eurprd07.prod.outlook.com (2603:10a6:102:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 14:09:42 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:09:42 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Quentin Schulz
	<quentin.schulz@cherry.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: RE: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Topic: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Index: AQHbxNVCY7B1PC0uk0ynF6zYbWHdwbPTmyoAgAANXoCAABISgIAAAJoQ
Date: Thu, 15 May 2025 14:09:42 +0000
Message-ID: 
 <PR3PR07MB6666EF14AE5F8BE55787B29B8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
	 <20250514125706.495571-2-daniel.turull@ericsson.com>
	 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
	 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <d3de733ea61431156cf005cf3533d2bf4c733bb1.camel@linuxfoundation.org>
In-Reply-To: 
 <d3de733ea61431156cf005cf3533d2bf4c733bb1.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|PA4PR07MB7216:EE_
x-ms-office365-filtering-correlation-id: 654a68a0-a908-48e8-670d-08dd93ba2365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SlFqSm05M1NXMzBjMlRUYmFabVdBT1g1anR2Y2hRRyttY2J1amJ1WnkxTHBU?=
 =?utf-8?B?NzVoSFlneXVKSU42Z2NmSVRoaUY4aGl3OWdUVTNLYmwwQVBCNUZtNGxRMG5z?=
 =?utf-8?B?UzZCTy9ZYWlaeDg5UWhXWndOQXM0SGtTMDY1aUczOFBDdEN6eU9sT3VScnpk?=
 =?utf-8?B?cmhIV1BQcCsrVjdIN0t2YW1tSjdrbTB6dm9pSGQvMWhocUFadXhNYjNZbHRO?=
 =?utf-8?B?TWpjRERsVWNDMWUzTnlud2Q2UUNBU1l0TFMwTWRaYnhIdVJveVFrRFpUd3Vk?=
 =?utf-8?B?OWVTUGxQYWJDSDZRNGpZc0VFZjY1MlJVT1pVR3JGd0dhNmNLQVZINTJrTWhL?=
 =?utf-8?B?OVQxVE1aVDQwTlRJS09ETVhWTWVNcksySjBqKzFCdWEwQUMxQ2lVVE1XbmNh?=
 =?utf-8?B?VlBvNmsrcTFkSmsrM3hXb25DVVZaOVBNYWpMVnFsZU5sdjZUclpoeE9URkRI?=
 =?utf-8?B?ZklyZEpwWmV2MlNIaC9rRENKQ21MU3dMZ3NlbldFb2QwZTdFeGsvdThUN2ZB?=
 =?utf-8?B?QVJ0SmlWUm5iM1FOQ3J3eVh2MVhLdU9GeU5DUjRBT0l6ekxxZU5pMnNmRk14?=
 =?utf-8?B?U24vWmVQazdpbnJlZ3Z3Szkyc2lpTHhITmJxQ1B4U0l4bC8vVzlBNTVRbGk3?=
 =?utf-8?B?V2VIUGRYNEpSbUpLbFJTVUMxYW81dHM4L1BleHA4Q0lGeXFldlVSSmU3NTZ6?=
 =?utf-8?B?c1lVdmVwMjVEYVdGeDFmNVFGRU9OaWM2dEJnYUFLRjhGZ0Qva3VXWXpvSTFn?=
 =?utf-8?B?Q0wwZEY2SmVaM0g5VEQ1b0dCUWdnbC9MVHJXQnNkaVIzK2dFY2s3U3ZmZnN3?=
 =?utf-8?B?aWpqeXdvRGdwbVlLbGd6WkRCRlh5Z0o1Y3FjYmIxZkZwdlU2elhKdWpZTFpQ?=
 =?utf-8?B?OHZMSUhFcEtHeTdCaFIxNjlPMlc0cXl4RktEWU53N2NyRHUvQ0x1dUZXT1ht?=
 =?utf-8?B?UHdCbzFkOWRVRjdDZ2tvdkZ2bVlrbGFSMk80eFNycW5rdE9ZTEd0VGdid2lU?=
 =?utf-8?B?bVJkc1lZZ0tEQlpqcUdNLzZKQTR5NlpuZEc0UDNQY1RGNm4vbE8rTW9LOHJ4?=
 =?utf-8?B?aXRDaXFUVGVOZVlUZnBkZDFmWlN2K29KWmFUWTlXS1pFdlNacFZYem5sdGhY?=
 =?utf-8?B?cDBVRkZ3Nnc5M2piZFYrMXVCQ2ZCUHBwT0RxQVU0bGdJdmNtUXZReDVsUisv?=
 =?utf-8?B?empNY3RmNFJ2dktzSzlVOGEvSW80RUMzT2lxVlFsMWZldkFXbmM0elVyL0F5?=
 =?utf-8?B?MFZmd2Y5VnJHZVlvMXMvNFNlMnowOUpxVk50YS9KSEFGaFVxS3BveFl4TDRr?=
 =?utf-8?B?elBSWkhNME82bmN0VS9QR0FYQjhjSDNBeFEzRDhodnA5UmQweTZMZ1Vud281?=
 =?utf-8?B?b3JORHdxaG50ZXJFdHBERVFBRkVNSHp0ZksxYzVqSlBZTEZuMHJweTJEWGtG?=
 =?utf-8?B?a0tYaS8xN0RjTnc4M3hLVXZwcERrdkhNYjFESkFoN3NONEZVR3dhSzArMEVO?=
 =?utf-8?B?SE5qS1dUelRHcWs4QjVMS3NCWHNjUU5UbmVoTW8ya1dCTWJiQm1LUXlhMitV?=
 =?utf-8?B?Tis5NU5Ha1RjUThPdjJPemt5ekJXYUtIOGlKbEJqb3dKQk4yZVRVdnd2a0Y1?=
 =?utf-8?B?MDVOVTRYNFB3UlU5Y2hYU1hpekFXOEdLWjhLdlVSV2lEUUhRTGZNZGtjTTZ0?=
 =?utf-8?B?bmZxOFFmbU8wc0FUc2JPS1R2NmJuT2lsNGxWTUZqZ3VVMVEweXpPcDFoSnRQ?=
 =?utf-8?B?Nk5MbXFsMkxoRkZqQzZ2bXYwUXh4dVhRQTlQUGpFZFJ0NlZaVXQ5cFdJRUhI?=
 =?utf-8?B?U0dtY1RvQUVLTWNLVzB4TjNlS3B2MFhkdkRudmo1R20xVWZjZUMxTU16KzJy?=
 =?utf-8?B?VkhWcjZvSGxPRWUvR2htalNtZm41UE51NEhMMVFUZEVwd3VDMWl0SWdzSTl3?=
 =?utf-8?B?ZjYzS1FGZFh4WW0xRzhCaEJObUpneXdsbk93c3BpMS9oSFhMcVdCNVJKV2xS?=
 =?utf-8?Q?NgMR+B3MKhXGgg+iMX1qnjpIMo2K00=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXNXanU3WnZLL285SjgweGZITFhreG43ZWZRd2ZjR25QaHIrbEVRMlM4QkhG?=
 =?utf-8?B?cWNUWTJKbE1FSnNjOXBDUjJLb2E4MG10VUdTUVZ6TGlxWUREUkJtS1dsUndD?=
 =?utf-8?B?Z0E5Q2g1VklyblJLbGlPeEZudE9vb3VYK252aWtOb2dLL2FZQUk3VEg4TmNN?=
 =?utf-8?B?MzlsbTYzTW5ySlc3UXFrUHhuanVGZEoxYjZsZlB1NDJzMU83K1NyVCtQbnVv?=
 =?utf-8?B?RWxZZ0ppM2hreUV3QmFQeUt2NFpmOHViYS8wRm12TGZkNDFueWlCN2FUbElh?=
 =?utf-8?B?bEFNLzNvaFpDaUNFT0F1LzZwNU14ckIrN3lrd2J1RWxjUy9kZmNPUy80WTR4?=
 =?utf-8?B?MG9YM1l5cFlIYWJvNDErSTBodklMNXZnZ3NXd29PcTYrdHRKRG43T0NFWld3?=
 =?utf-8?B?L2FydVRucGNnV05Yem1aQ1BrcysxZlk1QmF3YzFycWlULzB5ZG9ZVFFBSThr?=
 =?utf-8?B?RCtQUWhLZ1V6cGMwZDFQOG1WSlVPT3Ywc3FlNWZlc1A4MXBRME1YaXN3T1hX?=
 =?utf-8?B?ek1jQitSS0ZrWkZVU1dyaTRKSFYrOGJYV1pKTTJCeFk0SWhmT2RXb21aa0RP?=
 =?utf-8?B?a1c5eTE1WEJJKy9FeWRtV3pZc1VFVEh0M3o5SnI4WHUxZjl4azMyUjdxcmpj?=
 =?utf-8?B?QzkrMGlseS9rK2xzTzVtYmpKU2xFc0h6ZkE2eE1RakZ6d2ZiSC9jZW02UEJE?=
 =?utf-8?B?cnhIRUNuZ3l3cnVBQlhoaHFzUUlyZWkweURHVm9xWURlV09QSVNFZWhaUHdm?=
 =?utf-8?B?Wk5JYW9ENGtwaVJTeGg2MGgrZTZXeGJsT1Q2ajhraUZiTU1aYjdnTlpZa3h1?=
 =?utf-8?B?Y2NsZ1NMWXFuc1RUR25KTG1IWWR4TFN3YnZVQjhSZ214U0NjbTlqTFBKZUFx?=
 =?utf-8?B?dng3YVUxTVNuUzBMRnZUdDFJL0ZaVmhrdk81eklBaDNMM0d6aDF1V1BBVVhF?=
 =?utf-8?B?S0pXK2J1QWxWQW9hZEN2NXNPQllGOVpZcTM5YkVjUzJIazNGUjhWM3Y2ZHFr?=
 =?utf-8?B?M2kvb3ZjV3BPQTR6cFAxYk9wUUxRS1BpbnNjT05obTFsSEtXRExXcTFvMVFm?=
 =?utf-8?B?QjkvZnJ3S2lCZ2ZNUis1NEtKUGR6SjNZZUpadFJ4MkNHQWFvV0NyU0RNWHhh?=
 =?utf-8?B?N1NyQXAxMzUvSWhMUEFrZ29YNVdkSmptTklPRXhWRVcyd3JXVlNRY0pNb0ly?=
 =?utf-8?B?MkswR2hBQ0RkTXVpWEFhTEdEeVFMR0VGOU5aemlXYTR1OVBHUlNLZWlkUkpp?=
 =?utf-8?B?N2VxRkNwcjJzYnFmd2dLYlcrSWp0MStvaE1mREpnVHJpb0RCc0g1dVNCRW1T?=
 =?utf-8?B?SjFrTkRMZGdlSExUNXIycTdSWHViT1E1QWxLbXUzaU82MllIZmJ1aTlkWHZp?=
 =?utf-8?B?aEFEQUs0L015NldVV29YN2ZZekxMNmdCOGMvdnJ2UExmTmQ1UzB0UlNqRmN4?=
 =?utf-8?B?VVEweWtBelk3TjVSTzJFY0pOaWtqSFdJRzVudlJZQWEzVmNzbUlhVTBlbGhi?=
 =?utf-8?B?dkhPUTB1ZnJFVGdpYlpUOWZVaXNBblcxOFlQZTIxVStwNXYwdVN0L1RFZmw2?=
 =?utf-8?B?WFdlR1owenZUQUF4cGJFQ1pmdzhCME9zYzVpUWgyejRkQ1VYSnJ6ZVR2c0l0?=
 =?utf-8?B?QUU4UFBJajZzZUhoNXRUR0oyQW1XRStXUUNOYUVsQTFwZVNOUVI0cEJ0RVJh?=
 =?utf-8?B?QjFqbEN6TnFleEFsSGNlUnhLaGRFUTVGWDMzQTdMMEtkY1dsNVQySEhVKzY1?=
 =?utf-8?B?LzIrb3JWc2p5WTlnU1IrMW5YYndCMnNjNTFpWTd2N0NGRk8rek5Mc2NML2l2?=
 =?utf-8?B?NFhnWTVBREZWakthZ1htaUc5bmVnKzB3VjE3QmNuYXRQTjliOVJhMkEvNCty?=
 =?utf-8?B?dU1LSU5xOFNpRHlDb3N0cElMbFJxTkJ5UXBnVGFlcFRnYlh0Zy9NVVZvb0Yz?=
 =?utf-8?B?NEc5elNQbU9BNnpNUVpkenFSRVhxUm52bmFiOWliY0h0Q2xIclAxd0RJdHhl?=
 =?utf-8?B?R3V1WlF4VjdYVWpBMWszLzRHUjF4bWwrTC9GbVdFc3IycElJbWttNmxTaEhu?=
 =?utf-8?B?K2tpQktwM2dpaS80VlJUUnU2NnZQenVRcnlIcGtVeVBObDY0aWNTWkVEemlJ?=
 =?utf-8?Q?g7Ql5PtCpSD0rbCSLlkKITD/2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654a68a0-a908-48e8-670d-08dd93ba2365
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 14:09:42.3506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NrXgpyTouSyMuoTf75YCSgs67GlgZu39jTTLW0RmWxq0YvP4IYfbtff/g9zSZ/ycOToE3swojMd9yT7YVxR7Q7k5d/BrLRlu9TwaQAEFbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216685

SGksDQpUaGFua3MgZm9yIHRoZSBwb2ludGVyIFJpY2hhcmQuIEknbGwgbG9vayBpbnRvIGl0LCBJ
IGNsZWFybHkgbWlzc2VkIGl0Lg0KDQpJIHdhbnQgdG8gaGF2ZSB0aGUgcGF0Y2hlcyBhcyBsZXNz
IGludHJ1c2l2ZSBhcyBwb3NzaWJsZSBhbmQgaWYgdGhlIGRhdGEgaXMgdGhlcmUsIHRoZSBsZXNz
IGNvZGUgd2UgbmVlZCB0byBleHRyYWN0IHRoZSB1c2VkIHNvdXJjZSBjb2RlLg0KVGhhbmtzDQpE
YW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1
cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNk
YXksIDE1IE1heSAyMDI1IDE2OjAzDQo+IFRvOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxs
QGVyaWNzc29uLmNvbT47IFF1ZW50aW4gU2NodWx6DQo+IDxxdWVudGluLnNjaHVsekBjaGVycnku
ZGU+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBKb3No
dWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5jb20+OyBQZXRlciBNYXJrbw0KPiA8cGV0ZXIubWFy
a29Ac2llbWVucy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHY0IDEvM10g
c3BkeDogYWRkIG9wdGlvbiB0byBpbmNsdWRlIG9ubHkgY29tcGlsZWQNCj4gc291cmNlcw0KPiAN
Cj4gT24gVGh1LCAyMDI1LTA1LTE1IGF0IDEzOjEyICswMDAwLCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEhpIFF1ZW50aW4sDQo+ID4gVGhh
bmtzIGZvciB0aGUgZmVlZGJhY2suIFRoYXQncyBhIGdvb2QgcG9pbnQgZm9yIHRoZSBoZWFkZXIg
ZmlsZXMgYW5kDQo+ID4gdGhlIHJ1c3QgZmlsZXMuIEknbGwgbmVlZCB0byBmaW5kIGEgYmV0dGVy
IHdheSB0byBleHRyYWN0IHRoZW0sIHNpbmNlDQo+ID4gc2NyaXB0cy9jbGFuZy10b29scy9nZW5f
Y29tcGlsZV9jb21tYW5kcy5weSBvbmx5IGV4dHJhY3RzIHRoZSBjb21tYW5kcw0KPiA+IGFuZCBp
bmNsdWRlcyBvbmx5IHRoZSBjIGZpbGVzLiBTbyB1bmxlc3Mgd2UgZG9uJ3QgaGF2ZSBiZXR0ZXIg
aW5mbyBvbg0KPiA+IHRoZSBmaWxlcyB1c2VkLCB3ZSBzaG91bGQgbm90IGV4Y2x1ZGUgYW55IGhl
YWRlciBmaWxlLg0KPiA+IERvIHlvdSBrbm93IGFueSBiZXR0ZXIgc2NyaXB0IHRvIGV4dHJhY3Qg
dGhlIGNvbXBpbGVkIGZpbGVzIGZyb20gdGhlDQo+ID4ga2VybmVsPw0KPiA+DQo+ID4gVGhlIGN1
cnJlbnQgY29kZSBpbiB0aGUgc3BkeCBjbGFzcyBpcyBzdXBwb3NlZCB0byBvbmx5IGlnbm9yZSB0
aGUgYw0KPiA+IGZpbGVzIHRoYXQgYXJlIG5vdCBjb21waWxlZCwgKHNvIGJlZW4gY29uc2VydmF0
aXZlIG9uIHdoYXQgdG8gcmVtb3ZlKQ0KPiA+IGJ1dCBwcm9iYWJseSB0aGUgc2NyaXB0IHRoYXQg
SSBoYXZlIGluIFtQQVRDSCB2NCAzLzNdDQo+ID4gaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydDog
YWRkIHNjcmlwdCBmb3IgcG9zdHByb2Nlc2luZyBvZiBrZXJuZWwgQ1ZFDQo+ID4gZGF0YS4NCj4g
Pg0KPiA+IE5lZWRzIHRvIGJlIHVwZGF0ZWQsIHRoYXQgaWYgdGhlIENWRSBpcyBub3QgaW4gYSBj
IGZpbGUgaXMgbm90DQo+ID4gaWdub3JlZCwgdW5sZXNzIHdlIGhhdmUgdGhlIGhlYWRlciBmaWxl
cyBpbiB0aGUgbGlzdCBvZiBjb21waWxlZA0KPiA+IGZpbGVzLg0KPiA+DQo+ID4gSSdsbCBjb3Jy
ZWN0IHRoZSBtaW5vciB0aGluZ3MgaW4gYSBuZXdlciBwYXRjaCwgYW5kIHByb2JhYmx5IG5lZWRz
DQo+ID4gYW5vdGhlciBpdGVyYXRpb24gdG8gaGF2ZSBpdCBtb3JlIGdlbmVyaWMgYW5kIGZsZXhp
YmxlLg0KPiANCj4gRG9uJ3Qgd2UgYWxyZWFkeSBoYXZlIHRvb2xpbmcgd2hpY2ggbG9vayBhdCB0
aGUgZGVidWcgZGF0YSBhbmQgZXh0cmFjdCB0aGUgbGlzdCBvZg0KPiBzb3VyY2UgZmlsZXMgZnJv
bSB0aGF0IGFzIHBhcnQgb2YgZG9fcGFja2FnZT8gVGhpcyBpcyBob3cgd2Uga25vdyB3aGF0IHRv
IHB1dA0KPiBpbnRvIHRoZSBzb3VyY2UgZGVidWcgcGFja2FnZXM/DQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiBSaWNoYXJkDQo=

