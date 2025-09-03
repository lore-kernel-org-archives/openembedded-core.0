Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7491CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:25:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.web10.17301.1756916695423098814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WR7HV9cb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WR7HV9cb;
 spf=pass (domain: arm.com, ip: 52.101.69.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KBSy3nmyNVJe2jSRNSiyD8sn9TJPp9E+AwbB1JuWvep/E0A5mwr6ibQqMNZQVptYk4i8W01vWODY8b2DycD8/heLWCx56A8mm3CCjneR6sgZWIH10s7urVc9Eg94Y27+OFQ9h2s0TUKxSAWNGdYCt7i1I6rOhrzVOOuzwky2D4R2ma52nd4OyUFhhulhrk+f6StEUg7AernbdFexaT8eFHsxJagOPI/KAqnGiItn7WLCHs4aOe5w5Qy1W30JR/TsilAlL7KBThgufY0MQXDWlIB8nNOKS0w/VoOlelj/ME6gjn44HS9PCTb71hPKgoM6PgX+wYT4oJ+XSeN31MIWxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcknTl0Gm7fukmV5yrxoJLmAzC+nYjU1/yXBDXS3UO0=;
 b=PfbMck+1g3zs7MUxQKBFX9OCtdH6sPzFBUtKkvqiuKOcT/643zuahNEuQAMVx3KPPaJRULZWIhLdje4VVGEeLcT5ccM8DBdjgJsdkii9kloLie9xpjVhPgDkQCqCpKYJgBw6DlZbyEiGW9DRmCOiTsTpO148NHE+HHR0OvP4iJhdyA0DKgFfyUtCvHK17EPAK1bLMcQfYdxnopKoFfZB0UVnZEriIPY2t63yiXVctT/msX7GTwueUh4MkE+TI4XqmedepiKPII4Q5IgCtl7wq9cmvGeLR2eW01we9vP4COQjZXU3/uWpxRiEKAuXokjI8swSnwczjEk7F1j8oaSOSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcknTl0Gm7fukmV5yrxoJLmAzC+nYjU1/yXBDXS3UO0=;
 b=WR7HV9cb00iR/mwNXY8fOzsZyvlZc7GJoSqoxkFDfmdawtHz50N1k4EUk+JMPdSwiIGdySsQ1yYNBQ98MTd4uSTr6V3uQXPA+62ivN3bmYzlbbrW7HoqwagPqN/Wueqmo8s2XEHTRX/KkHcwT+UiRkF5OA7nxbazuHRfb+1KQ1s=
Received: from AM0PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:208:1::29)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 3 Sep
 2025 16:24:47 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:208:1:cafe::9e) by AM0PR04CA0052.outlook.office365.com
 (2603:10a6:208:1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 16:24:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Wed, 3 Sep 2025 16:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROLVD6S87+dhR7EREwynCiRcVKO9NTzSur9RPxuTJv8yppWO71gQkHv++BhZM3Q27+w8FWlAojKD5EePlzGu5f9PBkKpHL5giRnPR3iqP+J9hWcWtriejhlWFWXMVW0aKXt4ODjNfD3YqsrAD7CySwupf+NatPIkUpJkhbQ5HalA2TyTwjccbVs75kWjSHpgZnoM5SRjJiIGwybl5Az/3Yshe/i8gq3sIiSUaAsqrWtX5pZpchHsYdfBv1KscWy6QmmVUKXcAXFfLoKdpJyR+hgUNCwncmLQ7t/8u7WLJgyYTpz7iNBo5n2lK5scu5sul8nHTvdFsoeEnxYEla1WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcknTl0Gm7fukmV5yrxoJLmAzC+nYjU1/yXBDXS3UO0=;
 b=acLbBIJAD9ubbxYUI4YPxAm3yAg53E/GvAlm1tjk37PqseB+mvR/73vl528bYEfvEqM5IxMLi90vYh6IDdWJyOTD+lzuHqWtvfi+qRREf7FIagIL7dGUoMUFaC5CEW7sfXy8S0Bspz6hkXbD6Pi5ccuHsUdCR/yPGFASLqXOjCXnucHgyeFVs2UETB8XabCgpz8B77O83o0NkiBkXAosvHQ+NUcjtvs29+6SQy0chXacoMrWcnKtT6a5yUEHaVZLWJKbAE9vs2DgS3sw6DuKWfm5Il9r2FY5CTWazQK32vBiEQHk3NQmMrAvK4rSswj133FeLPReuDXIHtIxwvbZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcknTl0Gm7fukmV5yrxoJLmAzC+nYjU1/yXBDXS3UO0=;
 b=WR7HV9cb00iR/mwNXY8fOzsZyvlZc7GJoSqoxkFDfmdawtHz50N1k4EUk+JMPdSwiIGdySsQ1yYNBQ98MTd4uSTr6V3uQXPA+62ivN3bmYzlbbrW7HoqwagPqN/Wueqmo8s2XEHTRX/KkHcwT+UiRkF5OA7nxbazuHRfb+1KQ1s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9403.eurprd08.prod.outlook.com (2603:10a6:102:300::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 16:24:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 16:24:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] perf: enable coresight if enabled in
 MACHINE_FEATURES
Thread-Topic: [OE-core] [PATCH] perf: enable coresight if enabled in
 MACHINE_FEATURES
Thread-Index: AQHcHNE5mt41/rZ4mEuYQuQfJdkSPrSBbAoAgAA4o4A=
Date: Wed, 3 Sep 2025 16:24:12 +0000
Message-ID: <C74075EB-944B-44B2-BC66-900894F9FFB6@arm.com>
References: <20250903124920.1922332-1-ross.burton@arm.com>
 <CADkTA4P_Q9sfQy5vcvTHBig684T04q7Mj9kYvFHtxwusu0gDoA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P_Q9sfQy5vcvTHBig684T04q7Mj9kYvFHtxwusu0gDoA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9403:EE_|AM4PEPF00027A63:EE_|AM8PR08MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 892d1ce0-f36d-4271-bed4-08ddeb0665ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?oipdMFcJy57lit5Q9LnwYcpk7GInhx8Ea3CEssCZEan3W7Qr53QqX15TJ1Vx?=
 =?us-ascii?Q?cZVtndwzHns3+d7Civ6Ydz9pU98DBIwKTEA5JtN11Uig7XTgQ5+YseVcO63k?=
 =?us-ascii?Q?zMBb+Yh8nAOPJ6QWeFuiJeQ6cow+TShJO1LbC9bRZjNiM9q3oW+m+b1WciQq?=
 =?us-ascii?Q?9TCffOLDiDJzQU60VTI1CDXm7KYdvHtSbwcKOsTuKojd1cxPkmTVmwqHdmTv?=
 =?us-ascii?Q?xSFZ71gLPBwCza1kWEF9AGQk/8m/Nolc0kKj2fpy7gGPUcXqrW3WNe4fBtTY?=
 =?us-ascii?Q?JODBEtHXFz7EmoZ9J9Xq5FhxGWzln+7mmcDc6/Mr2/594lLDewWI/h0v3fux?=
 =?us-ascii?Q?da3uQ/wlhPshXndEFsSAtASGD7QYUONWBN0yBGXrKpdTLiJTRvlg5oSK8J7h?=
 =?us-ascii?Q?nfy558UYegYxoTKeWkuGCx8O8P/PrwZj/SaaOv3TMGEipEqWwO27h1FCp2AK?=
 =?us-ascii?Q?pzebOptxL91XyCJThxnjz+uUTB9vWLAf0bBbtsez2UAVysrvC+fHWoxBzT1w?=
 =?us-ascii?Q?fSDdrgWiydzSsiNcgEVy1TFIeChXmeESkeJ4DWZF/4lSFEseBfVwlpULVoMU?=
 =?us-ascii?Q?WlvXNEkQ9w1mWLRkSuk/7JuvnBimR+SRS948ux5whIYt2zBapq+2w16yxB3N?=
 =?us-ascii?Q?e1UxQgw44Nt83asvJogivNS7LyVFgid3ZXyoYE9cJxkGRtcDEZHuAdGsaj8s?=
 =?us-ascii?Q?JO2CqEUCxxXXLSPTMjQvEnXu1zIGBCwR0EBB4IUcpaLTov5svvWk0ixNaCwE?=
 =?us-ascii?Q?rh/ESKGIMqQKks4lRzW0jy4MWYuQbi3kpPALF+nTZDPfuZFdV/SgUN5rMS2T?=
 =?us-ascii?Q?6sw7q5f8ztUE7CCDY7VtUDARWJmDbFY2itLrHJEWs24R4sPnzReMCIp1sh7b?=
 =?us-ascii?Q?OI8di+CfZF+W00O0pdZ4YAH3SMyqqMXwUTKPZPgGAPtxU4wtlTD+sjjIPSrQ?=
 =?us-ascii?Q?Cpmv2MJxt2ED1x09c8miENQ6v+gX1D2aUlMlfvEGtiPOoteNpkQFif1waY+J?=
 =?us-ascii?Q?PsskV9g/z91APe/rAphc5l/zTKfACz296Qh9lGtLdv/r3mE7UPQ3uS4YUuwx?=
 =?us-ascii?Q?PPG2PmRzMwVztvDD7PsAHtY1SwlcTArbKwMhG52Yp5XDrJaKcI+FbXovb60W?=
 =?us-ascii?Q?SRXDg88C4K+N9I/8YxJqbc5dNLHdU0+stOP5mnFLOyyeYPMGLZNy5eTNSBIR?=
 =?us-ascii?Q?+VcRiHEU5jVsDBlwHi+UXYphvNo+k+FT/SUcmbs5DzNNKltPFhX9kTykP+5s?=
 =?us-ascii?Q?aKmUpuK5uBSsnDHcHCfXTxivg6dGjS51M67Jv2IfM1+kxWyUyILiuz4RIGNp?=
 =?us-ascii?Q?I/z6zbuePbF2DcswerHto3kgYqLRrJ7D3Pr1MW2Pe69kPtjbuN0XI5qv9rhV?=
 =?us-ascii?Q?l6BXJl5O2YcinkN5tbUe+R9Jp0qmd+zfSL+EDXWc2m6gYSN0TAbSoYA45cIA?=
 =?us-ascii?Q?974siqWgsrAkAvvoXRrcCTgriZr9Hk6+tfFS0iZniYT1g59Fb+spng=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <817A592C80D32645862F728F0E1CF1D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9403
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d48ae91b-a5ac-426e-398d-08ddeb06514f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|36860700013|82310400026|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?auPCE5tAXSQqfGPMoHU5UPDa7WXTSp8aNT7yIq8YNKfG+9xN5yntHR9NIxMz?=
 =?us-ascii?Q?OWozHNJ1GSnpDWxzMcMamxOQw02qp0urqvtm60UX3Qk9a293riS/WpQaCM09?=
 =?us-ascii?Q?4TTvgzA8njG285QkRkI/hguq+BupWocF3MNbBEBkjVuxR3eUVF/soAcVySUH?=
 =?us-ascii?Q?tztkBe3/9sNDElBt0VFP8QJCLp87HRTWpNHduIAjuls4EkZYbempr8Z+k9Ya?=
 =?us-ascii?Q?C6xte0nOCmW5UCrdnwrpuRb5gWVhC6TcnnfFtQZpkDzMwJtqI6bZT+LddRHr?=
 =?us-ascii?Q?8w90FJglZyEF2wJmy6uIXe0fLPk1ck7MBIxctMjyF6tNzaEQ/+HwAH7503ML?=
 =?us-ascii?Q?ksuaW5KcTEg89bd3BrPMm7oDz8K+cwtF7WAranWPEgB25AsQa4dkQ2SD1ov+?=
 =?us-ascii?Q?MHcOHg/6XNi3oCfzxIIDU91FcUZ+v6m+jz8WJJFcIfU4VKD4Xzv/u0hAMUIq?=
 =?us-ascii?Q?wdWCA66Owc011fCwZX+rxJsaUXICG6fLrxuLo9uabcW3EHFL2QEBS0LjcHMg?=
 =?us-ascii?Q?taDT56pJ545sWVeI2pDr0h5EHPZ+cnQKuVv8sU5dsNEhokb7AaY4F32B34K0?=
 =?us-ascii?Q?nvm2WsvcCi/b1O7OxLmbkGBykl3MnBPuQPq515s4WK0p/gq4pNzzUD667gNC?=
 =?us-ascii?Q?UcvmsdWFsp40jkjFJVIkTmKRWfZYoJzD7cdxG2vggYpiPw8pYq86UfHxZANj?=
 =?us-ascii?Q?i9mwJ4sekNpbc9cHfJgRZKvUX+HItPCk/aA4iPYoJU4Dj0SMmpbqCkLIpzz9?=
 =?us-ascii?Q?xjNkrRq61CDFLCwulRgD/ZqRy0QiRtpW4T96+xGWpxOEIxmX2TN2nxp2g7c8?=
 =?us-ascii?Q?VFbh9NDLA2+HLv7CYUpW/cBc53rmFiIaVGrjGuxlAL9nxst16Hj6tNmlBhZ3?=
 =?us-ascii?Q?7LluMoS1wA6vLU871YYPCJSyRsEXDOLil42nauf985Tp1NK1J3+hoDd0jnql?=
 =?us-ascii?Q?sGySTa/I5Cuu9EiDM95e6vowGGt4C6/Ew4QCJuDjgRH97XXOAPb9g8Hqw1ge?=
 =?us-ascii?Q?uLQrz/IjpV61Arc5UnttibNIntFf3BNFzkEzTXMIv3iYsq/8L4Y4B86gYcPF?=
 =?us-ascii?Q?42LjoC5+LMQ5APx6S20mDrSPyMLesVd4K4FTa2NoeG6jioC/6Y7NDYexYWwd?=
 =?us-ascii?Q?ozNxRQrUZ9Q/uaOY9zJMEucFCUK1fF3GTDVTXPAnFanNepU9v1ZCYxjzCgeN?=
 =?us-ascii?Q?IUxEK9F6O56QUA3KVI79BAAzAgrutFZBqmqHv5tnPkYAiSQfn3r5TngZBStl?=
 =?us-ascii?Q?pklaCI4f+f8VqRukz+TO9qz11FiHKgesiYJc1JQl57x06qO8L5fhYKANvsi3?=
 =?us-ascii?Q?LpiwpYI982mKfdaRjU/ca+LEFNGjO0Qmu0VXUx7wsCPo8NNX4ZmhS40dY9Cm?=
 =?us-ascii?Q?ZBpA9+/zPyUGF62HzymUHXf2JFxrCI3ULgv9G1MH355WUh8Y6eyEeC4PLz/o?=
 =?us-ascii?Q?A4Ybbh0dPow//WLljiiQIxI4R0WUfa0kQgHx9KxhE/G1cq8YnLUgpmxlTtNj?=
 =?us-ascii?Q?/Ey9fgNx2GEfEqQ9ifTjRz/jKelEORPhTERO?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 16:24:46.9675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 892d1ce0-f36d-4271-bed4-08ddeb0665ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222876

On 3 Sep 2025, at 14:01, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> I don't have a problem with that arrangement. I could see if it was
> widespread, or if the AB needed to use it on tests where meta-arm
> wasn't available, then the cost of getting opencsd into core would
> be worth it .. but since that isn't the cas and meta-arm being a
> maintained and well behaved layer, I have no objections.

If we started having machines in core that enable this then absolutely we c=
an talk about moving opencsd into core.

> Would a comment above the PACKAGECONFIG help warn
> someone that enabling it does add a dependency on meta-arm ?
> Or do we expect that anyone trying this will already have meta-arm
> and be knowledgeable enough to sort it out if they don't ?

v2 incoming with more commentary.

Ross=

