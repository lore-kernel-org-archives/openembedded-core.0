Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7542EE2084
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:31:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8292.1770373855564766290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IpP8EeJb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IpP8EeJb;
 spf=pass (domain: arm.com, ip: 40.107.159.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v0Gc5M5ERiNbzMPH0kcAUAVGcEu6oUM3t7bU0qLoZdIgzvDKnqYVxSHQpOXjIfEJWCVX52UiYZyNNjyvEiBmFjmzHJj2wrG6hpHDrJuIbsmDf6VS4NiWfcOEwoQoJw/YQFQYtAIKi6oDfQUVYRtOr/JQgBqkytLbY5x9z1QbHvJIhiYpJ7eC/qgnrkp8tW21n2rS2rgFBtNJV4rIFm7XF6ww2JRXha1QARrpXIupm6SRraWHA9UtbCSAklotJ9NqZGxKCAqSVfdReCT35BbkkBC7Bq+faXC1FMmELb9oeh2ZOYnXnuHUX0M6bk7fF8d53p0aUZrao+uzCR+MBdaJUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1dV8T/W6XJahGSfmxYdLQj57wyuYRFFZ6FlkLCL8M8=;
 b=gw9WeCk2r3HFvNog5QUlii7rq7d+93tk9avIGJKEgAkDHx/nJERDeIvzGGQTiaEBe3wmBb/SE+8e/dP9HuCo+0InDjcJuHohOBPw4Mr/CQA7JnOnRwqMrAhR35aupm3Oy0tgbKo6cZs+2JCrS8pZn1n8r7EMNV07YWzTCPsobCorlPFSq4B/mz7px/oPb5Qc6ELfB+eO3NHxTAgolafLPg1Oi/XQG/NztQGGQQO9S2h+2V46S3vqpshsdzo44ROG4oiCpQJwvrQJSp647t3c3af9sUYyDxwKSU5AvQyQkldoXdwmvSbt5McRG0LZLpY4tRV+6/xjNXkgbretzkL3xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1dV8T/W6XJahGSfmxYdLQj57wyuYRFFZ6FlkLCL8M8=;
 b=IpP8EeJbSgDv+/G6WYAq/VXGoGnOegGtRYhFTcJhh2S3rKuL9B/V1Zd/ai8ynpnIkrIiM8gUwD7kIx17u2/yj/Z7HlUrA1koBu+y3tFOJtsi9F+r6J7nbbsMaC6UtB4pIRDiunqbU7+wpDV3IycbjA4ZLqeBJKQg2VKOvR7R8+w=
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by DB9PR08MB6715.eurprd08.prod.outlook.com (2603:10a6:10:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 10:30:49 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::91) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 10:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 10:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QahGzwryxgWYbRikNhd6XsjOjEZV11zSo4U9PXuMX3ZrVlNO5yFD2mgA+IP5JswVNWS1LW9NNyF9iXbo49dnYI9YPs42XA16nwcbs84aosRZXR+tQXB7o6Q+0zrQC2HjDZfG2ldGyHJvl8HhUUrXRoU2zm0bMcxS9WZZ8lfTQnxsoB/ziGFHwZO2EMtcRpPu9klsObQ2bSRwXKLWNeYbGimYEOuBmvBn2U9+H5hc32lvSU+8eb6Omj3TA0RQ2oZFyks2AyQE54qNkhQ/M8co4hY2TXGPh0voQXPVErh5aSB8U6wq2EfprZErjsRNExx3umhE/eIHXon2qpP53FBYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1dV8T/W6XJahGSfmxYdLQj57wyuYRFFZ6FlkLCL8M8=;
 b=FESB2eTz88Ehdi7oHN1uQVzJU2E/5vuf8t+u8E8vR0AY7dAl4oomItwNznPZjBnk9jgoggRFIm3SPntz2nW1pR1zzh9PUhP47jkv7z9m/Xk0uklQVkTiDd5xnn2NzPdK6mXzw4q1nTKhOvqX8GHkEGhRfbLXVyvprMptSEN386pEb33Qdibhux2wENbF5tPF2+vDt/7x60F4tNEj2rZ1CRN+xzHWa4Ipd/T4ehHcnHnC7qWE2cvV7GsQpDSnyQrdjc0QqJ+9xHwYoaTu/R7ODtcXtxM6+2Aa4XLdoTtqUzVWI6qFoBgw5Wm4V9QtrJRYtRoapdRqO8fUasXtIH3NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1dV8T/W6XJahGSfmxYdLQj57wyuYRFFZ6FlkLCL8M8=;
 b=IpP8EeJbSgDv+/G6WYAq/VXGoGnOegGtRYhFTcJhh2S3rKuL9B/V1Zd/ai8ynpnIkrIiM8gUwD7kIx17u2/yj/Z7HlUrA1koBu+y3tFOJtsi9F+r6J7nbbsMaC6UtB4pIRDiunqbU7+wpDV3IycbjA4ZLqeBJKQg2VKOvR7R8+w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6518.eurprd08.prod.outlook.com (2603:10a6:20b:33d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 10:29:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 10:29:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/8] classes/pkgconfig: rationalise variable
 usage
Thread-Topic: [OE-core] [PATCH 5/8] classes/pkgconfig: rationalise variable
 usage
Thread-Index: AQHcjJLttmsfR35nVECJJvZKHB89VrVnm2kAgAEZZACADNkHgA==
Date: Fri, 6 Feb 2026 10:29:46 +0000
Message-ID: <A4809F6E-C4B3-4284-A5F1-AB9A8BC42D46@arm.com>
References: <20260123180448.2997378-1-ross.burton@arm.com>
 <20260123180448.2997378-6-ross.burton@arm.com>
 <DG09C8YCPE02.3IOO2264O7DUQ@bootlin.com>
 <DG0URCTB99Y6.27GWCKK8DHC5T@bootlin.com>
In-Reply-To: <DG0URCTB99Y6.27GWCKK8DHC5T@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6518:EE_|DB5PEPF00014B94:EE_|DB9PR08MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d28a09-eae9-4d39-3a56-08de656acbe2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?QOFPEd0hyPdj2Zv2iwj6Gt2Rhxzm9Qpq4gfBJN6J5f7r8VYSnfSYlr1bnLYk?=
 =?us-ascii?Q?MmbtI+LLdReobeN0VoiPdJKmbgXPM7gscR1PKwo2Y3gU0RI0lvBQS39bjGKX?=
 =?us-ascii?Q?21vEcQs9nrCOeXm/AukCxDd+4rKpXqqhXSIVgtJdyUfNrEQ5gtT08JucFImt?=
 =?us-ascii?Q?UGDN2K1bKQf3jrG25qhJjoHBsZMBfxdg3n2TutCABxW41Sj53YUroY2R4Ere?=
 =?us-ascii?Q?CTbzVObRLQnVKM9ovi5b36+Gz4kc75dT0WNba1qbkGre96QAIv63R3yUYXgf?=
 =?us-ascii?Q?5Cfx5AwhKgnDhpRMFAlCo0/dtvHIy2b8/pbMbtXOulZrWREcHLJ2tjLU4tyJ?=
 =?us-ascii?Q?ghVbdHFWT52w1XISPC3+o9DHzFlMgPz11TCtw4GMmw8tapH9AnHI44FxUjbo?=
 =?us-ascii?Q?YwJNwdwMNJX87TNNAvmQ/MNOFegsfFTECigNZ1g5v9OaOvdSCS2CcehwUpzJ?=
 =?us-ascii?Q?gsk+Ou68r1irHhNe1a8j2qZGhtSTHY/ojwhG4XCXGhoofSE+SfzN9aOTd+mW?=
 =?us-ascii?Q?389V3/IsG6BSjoET759wUQblJG4h/O1Z4TpGqFI2ZO7rz3jSo1+cn/txxgX8?=
 =?us-ascii?Q?1qw8K5JtIf/ofLoUwEjCyZLoP+xkV4kw9XoVNnQtp66d+tY0INBqAaPvoofa?=
 =?us-ascii?Q?/zLqoWrSJZ6YZBeI0u/9cx0Zwtqi/HDTTuLVeC3u3SJpb3IAnxn/3axS10sJ?=
 =?us-ascii?Q?Q0SosQAjYN7CRLdBmeh5uLaSXWHQgIQ96olP2M+V4hXw1s0Hqzi8Hzp2Tu7t?=
 =?us-ascii?Q?Pr28pZlcYj29aw4Ay+HCZQM6wkf0/dWvAzOCOcSv9qMup+AXUiKNXmVQW+67?=
 =?us-ascii?Q?E5LyoblWNpJdigBWM/r+km06W0YiEAUBzPv0VH+SVxBzZ+tOj4PhIhBXVi69?=
 =?us-ascii?Q?37Lqm1DAui0z30OP088VVL/zYEwIiFvw8UvO+aJwd0OCooGEtJWmIX/1BWRB?=
 =?us-ascii?Q?Be9TB2YtV9z/jewxJWUQ/ZD19hZ6vNbL6g7kW/pTVJwIW1/BApACCXDcp4oZ?=
 =?us-ascii?Q?tpIgNjSniDSg5RuNXXKDthHYBoQdrwe/jCWpyp4NNNIx0lMvSBJqlS2UBzk3?=
 =?us-ascii?Q?DoElpf0qDmbhO19f+kUleOKT+zOs9kCN+EOd0ThtOz/0zoA3mryODwyKQ8ML?=
 =?us-ascii?Q?ZDR5MIbREzm8RfpfocZYLd0Qzh5/kxcZKAq9ZdBAMBUAhh1Bm6rIkzjhKoTK?=
 =?us-ascii?Q?bTAkLs58qg9yTXly9EfqMwtyP2TCgKdwpx6HcHavQWj3exAcZBytMo9KvwLT?=
 =?us-ascii?Q?wV+0YS/6WluNLqtq+k2X4klJWLQmvO006NuQiv+/q0XMlyY9AgPqdSK3nDPN?=
 =?us-ascii?Q?p35pfEUadPHS8nTD7dqw2lpit32/fr1EY1hrS+h51R6M5BTci2tqufXtaj8f?=
 =?us-ascii?Q?M8XTGkzLfdzYnoIR0d3fVfT+2wh75l77NNGHEi6403bfm8fvd8j0nkRJu5o+?=
 =?us-ascii?Q?Sg/fAx4jZufBI7GPTrOqQYno8aIi8AlX0W6/dVffYkhnM/7bHnTnkdhCUZMC?=
 =?us-ascii?Q?NFgeJJ8jWCSaVAOqwLh3KnCGVowdOG2D1cL3OYuSs8sURvAK9kxi7UIeZNU+?=
 =?us-ascii?Q?TwH9F9Wl0qZflT9whoHrNbxkSi+ZJGO3KAuromrENc3n2PtrHAeQKvYjb3uO?=
 =?us-ascii?Q?7Vn6mAdZTqDYGRHXBN+/ewA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF83711FBEBF644E9857C357F6BE6C68@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6518
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31e9656e-9167-4be5-4faf-08de656aa631
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OfQ9bu6u3QmFLFhFQY3qzPEyswcCZi05YB1fHOewCEtEUTr2fV1XkCRHAHaf?=
 =?us-ascii?Q?nNkk1mpOqyWwUaMJdfRpqO/9GjBTRRiAwchwBJC6uVs3V8J5a6tIylGvz6Jh?=
 =?us-ascii?Q?z83dGGvzoqM6a550Xu0s2JnFnXmodQ/Dog6zE9BTn2MZzdpjR/mUJ2BgzC/3?=
 =?us-ascii?Q?W36G2L3uJZ/FRQntxWSePuNjUZGc1Yrmu/S95bzvBxpOnQK7Q6OOIhpYA5az?=
 =?us-ascii?Q?sqIZgMZMa29+wJ+WeqnjEEX62icy7JwZZfZbLjjG1n9lDAgSTLr/hqxlb7CW?=
 =?us-ascii?Q?NytgdeI24LiyT4UdtyFv+S6C0/XtcCYdjelxVen70f2qVAmFpdSlgXONqEsE?=
 =?us-ascii?Q?38bTpaCa/gHwbiVQnfLmuRy89FuEENG8Pqh6xQKJLv3W1H8wO9TBLxzoKOiG?=
 =?us-ascii?Q?RKBLbXLlqdrRwlLEffdSRLrrOFXu28y+sbwvD86s6kPRbQc0wxtCBeSXe8d8?=
 =?us-ascii?Q?H3n3r6ujNGMMkg0o7JndljZeBMleNCyCRS87ZnCmiyZvaRy4fTjUEMigWJZD?=
 =?us-ascii?Q?0VPo1ZiEQWinUNq0uJBtmn+HymyATIQNyThhlFNpqKpYCf5UTl3kgNuJVhT3?=
 =?us-ascii?Q?MxjTyF98tbZeUbILTFmqVkFZ1tmLmpmFwgCcI5ad8eEHbQ29D6xQTqDfmLB4?=
 =?us-ascii?Q?2WUQkIm9dTRXAgUzUYOx77egDEkofq4a2sxkeEMyIg4ZmzLqjpW7P+OmQxjS?=
 =?us-ascii?Q?DBib6XBwec6ymKgXM3Ocgc3Ea6k0+LqnOfAl6lSDPAhDgs9zcHJuC/aeT7sr?=
 =?us-ascii?Q?rKlm3kmvLX2BOEWX9IvIaGmPl3FDt3xmoUvSeOfUFf4+rwtTwVqolMPVLBwJ?=
 =?us-ascii?Q?2HWS9XnKyYe9jc9tQr5EAN6SQTFNUbt4T9u1JOXf306zs8QGdQNUchreEoMl?=
 =?us-ascii?Q?SHKLRIZ6AcB1reSt+FL2o6j3w1VJyFMqbApDAZG88BLuqNrbp8SD1wxKpYVR?=
 =?us-ascii?Q?Ht/Ak+herHVx1yYe7l4rHlyjQjGfkLIxDO/9uaC/NBekhvXNPsOyhPKpiKxq?=
 =?us-ascii?Q?c0Fvtva1Oxss6N97jgASuc9Jzs4A/qHZlA6oWtkg56l3grn1MtXJXvgPEHnO?=
 =?us-ascii?Q?J2qiqZ7nFymBUnS32jCInJnM422qD9ExUBfwep7v9UJ3/LIBQ8YPUiWE6SwZ?=
 =?us-ascii?Q?b/t5+2Fe8iwfu1FHOo+MhdPz7SD6tE28orx1SqXHuzrP4Xwk1+Ss4heBcFB5?=
 =?us-ascii?Q?D1rQf6mKpuncwvo0GRZ/8GiV3u11juREcL9gpTBR1kl3L8EYpSkhn9lB0irp?=
 =?us-ascii?Q?ho8vqVtKQR30ZdvU5jtYqdO1O7yNfyVWql1iGVz3y0jrtnvtZTJHrJ8ViMIO?=
 =?us-ascii?Q?gdR/tquAk/dM3VtK3AQ3Is/s34hOtNgaxyodSJMaoRkmpggv2umh6akfWtd5?=
 =?us-ascii?Q?c8Xj+xAOZreOL5Y7EZK38ovwoVzWihW7sHEJVg/E8mz7hXPVt79e5rvS/pjO?=
 =?us-ascii?Q?PDhmM33WIqD2EQxbw+hYxE9A2mvqyYoMiqzyQli0E+yIE8d20827neGUAZSv?=
 =?us-ascii?Q?+PGyFkQFaxJfm0R2lOjk4D5hsuIXgnRsKQlgyhWgz8W0pOZytDHz1lbpMV95?=
 =?us-ascii?Q?bEQWeuSNlBE3ocj5P2P2q4lcmtf0M0IIpS++yCL67E/olmZcF3vCH7MYmdLS?=
 =?us-ascii?Q?K+u3VPt69+AUK9Za47OoBzU2HYWD7A6okTppQzKwuohtVhQmxo8cUxLdw6FK?=
 =?us-ascii?Q?zc0ZtQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	05u7jkzemriIMb2ssFAFIOkLi7WhEugQsEmpyj/izg7qwdP8CMoO7HlN8jmdepgVPkFOhL8Gi9jCtcVetJg9wSGM33WAE3E/996CJ0+LKuwW1ORpjZu3zQraGAg4v6V6ailatte65IbbEi1PFyAYf9p3/F4FTWENf7t422X4LsJMfYYmOi58whxiKrolmzSowmyI/JGmHV8Q3Lyu9URyVGWwgsubxiQTPDg+9F0BsEHvhimGU8VbVpR/wWTmprKzD9h9kg59LsW+gTRazrSb6+MrbsAp4qjffLrVicZltJhpWtYVM1P9OlggNuKkGvDqYCU2r/Xl9++MHX5qOQ/PN4QKRlvzKkHLAy1mhwdLg/gpBr//Z8QjC4enT6dDYOdCdmNwID4Y3wyBbfttjwC0D651EG/0kD3TjtNK4g5SFrBiTWHHS3Lf9AwSgFymu0nC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 10:30:49.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d28a09-eae9-4d39-3a56-08de656acbe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230602

On 29 Jan 2026, at 06:17, Mathieu Dubois-Briand <mathieu.dubois-briand@boot=
lin.com> wrote:
>=20
> I note this is also breaking meta-intel builds:

This one was easy, some recipes in meta-intel are not inheriting pkgconfig.=
 Patch sent.

Ross=

