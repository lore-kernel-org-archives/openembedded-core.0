Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A35C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 12:39:12 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.105])
 by mx.groups.io with SMTP id smtpd.web10.25649.1739980065015905755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 07:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=k2U2puEw;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=k2U2puEw;
 spf=pass (domain: duagon.com, ip: 40.107.167.105, mailfrom: jorge.sanjuangarcia@duagon.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=puIy5Lu6NqkAgt+OrmxfE+6gMXSxtHzmo+X6lspCZZwhcbA8X27urCh+/zGPP99XzU1yVQ7MUzfCuhViHqtgU4O87UG4wwSY2t7qWulCrow74enRGskUmZ1eO8OTEYIv0TwOtoSKnYZG4yahe5+cWNlwod/ceWcEkUEwHiW2QRiNXlaRkfRfVhsfPB3M43UiHpqGh2rwVDDJ66+CkDsbpi3jS27qGpUe55tP4IdDQsH6UdTpJoY/kXZdUeApme8YZr2OXhrkCgDMejPfQOxnFkP2zYFYSnuDVMf3hPuQ3518bv9k+Prll18FTMNw7V06vv/joFf6CrXx68C/Rjw9tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3FuTIRJjgNJQVn63eJbKzn+hqcGVd9ljL84DtF0SvE=;
 b=u9rVnQbk9kQooQ7MIQ6plWAdlvyudPded+lbUK0a3fbG3onRte9I/tBnnPn+wCC7zQOCrCPDLjYO/G1UDjxsEt9QNnKU6l8i0gTgxz7hYC1kFWL7/i481mBNE85JtW3l7C2dcHgFT8o4+sfCXHdgtOxRZMI5kQtt53mmRqFmDsaFGL8i12fnsv33IWbnRiKjNxPDgGuHY5pOgS8urSbmYxnmMyue5qT/FuqXyfLIDr9PgDK9S/wOJ+OSQ6tLu1gdlK8TNCAPh6JAUu8mGb5xD9xuCb6UmZTCQL2sLaR6flmdYDTzkhB6U7OxXqrhwO09TwO3ndQhaHFEbvBm5DYrIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3FuTIRJjgNJQVn63eJbKzn+hqcGVd9ljL84DtF0SvE=;
 b=k2U2puEwYqHj4k2qfLGIfVqxLQT8IEH4NNjI9RNCzCeJuJ+NMQg41IvIh9K0uC7oiXxPtSS0zbwCreFVlb+mv74kqfguTfkhXfrMbPeaE/OaEZ7AjvtJT2ZQjCgSiNdNQcCtZiX3vBoIlLYboiWBfhT1fc10s1cMzpDRDQAf/qg=
Received: from AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30)
 by GV0P278MB1271.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 15:47:32 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:208:1:cafe::c1) by AM0PR04CA0053.outlook.office365.com
 (2603:10a6:208:1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Wed,
 19 Feb 2025 15:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Wed, 19 Feb 2025 15:47:30 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Yygkn3dqXzxpG;
	Wed, 19 Feb 2025 16:47:29 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010006.outbound.protection.outlook.com [40.93.86.6])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Wed, 19 Feb 2025 16:47:29 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0ze6jw++/0Ko3udLAH4MuSUCGGXxhzzBD5LDt24ZY54114Bh8cPRgNJHYd/8RixJGAZh9qJMm9jYT1XDaJrG+xIXiaTNYOBXUYY7gPOT9dyAEKkOMREnjAjmoXwyclIQxaHXdk6pFmF1bEcKHNklFqt9V4Ui3sP6sJLpd0Kn1Qibmr6KR24cn3Y0zU2oXa/Ag6girh2g8MscjlL9edOiSssXBsst5EbsA16AuEHIrgCtXuu/5M/GnPcKtyh0/PMjEr0mJP5bP3eacSUTGCgTPP/V5Ah87xjbaB002MSzI208Y0SuQa5qkzXnd96w+8a0Jhf/ZeuP1vM0EbsVYCCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3FuTIRJjgNJQVn63eJbKzn+hqcGVd9ljL84DtF0SvE=;
 b=XzBMZK0A0NThddTIt8gtWmm2QgC+sqFiR5OqwBk6Scyk94QaM9smchocntZCH/lqFv4wS7t+gUNvOYRjVKcSSBXY1e0wjjSBoVY/N9Eri0FdEisFs9Aiyh0fv3dslC/Ac89RlyWLqs/wJk6sM2bupHgS2T0cp+Nw+/+v6ZzrfVB/+nNvOZS3bTNbFKQHcwTSsI08SNtKgITwchPH/xVyvHCD32i8GcC7XgDbyEBDJ7P0DraLLxRHLCaOvakhnNtDcszPhty1yJFqonog+ZPOXQ/oSKL5QSQobRS7Qrd6mC5RmbBkCIoQ9K30eEj63SpgsiL+N43Gd3ZLWJo7eMgwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3FuTIRJjgNJQVn63eJbKzn+hqcGVd9ljL84DtF0SvE=;
 b=k2U2puEwYqHj4k2qfLGIfVqxLQT8IEH4NNjI9RNCzCeJuJ+NMQg41IvIh9K0uC7oiXxPtSS0zbwCreFVlb+mv74kqfguTfkhXfrMbPeaE/OaEZ7AjvtJT2ZQjCgSiNdNQcCtZiX3vBoIlLYboiWBfhT1fc10s1cMzpDRDQAf/qg=
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::11)
 by ZR1P278MB1312.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 15:47:28 +0000
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e]) by GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 15:47:28 +0000
From: =?iso-8859-1?Q?Sanju=E1n_Garc=EDa=2C_Jorge?=
	<Jorge.SanjuanGarcia@duagon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
Thread-Topic: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from
 sysconfigdata
Thread-Index: AQHbgqeJiOnsKcgZp0ChitLdHnpWrbNOnyOAgAAmYSI=
Date: Wed, 19 Feb 2025 15:47:27 +0000
Message-ID: 
 <GV0P278MB0516B25A5B62DFB34E4F53D78BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
References: 
 <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic: 
	GV0P278MB0516:EE_|ZR1P278MB1312:EE_|AMS0EPF000001B0:EE_|GV0P278MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1c4217-683c-4402-dfad-08dd50fcb82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?mdTKWPes46tlVsNAPgurUkD3JC1y0XNPcxdOqugkvthNeTmMGa+RupxC1d?=
 =?iso-8859-1?Q?g6D2qkHd2VzyJnziNYohx0aoKuPzZgIrxCzpxUN6g90hYbx1xzr3dyV+sE?=
 =?iso-8859-1?Q?gDKDqDRk1KnJxB15uMMrr3Fk8c7YIrqokP2r7dIC03s/C54KLHs6XjRn8Q?=
 =?iso-8859-1?Q?OBQB8JznNbMARG9dzqEcPisKydnqmasYRZvgAnMhWf/kNLmGtz1GfYQgFP?=
 =?iso-8859-1?Q?qKFiAZ3MvOyyehvj7eIKST7Dr2dBNMrN9yJbof6l6SMzig+mrsDd2dZxM6?=
 =?iso-8859-1?Q?7PyVnlmGtebQ7fa5/D8HjmhEXuBh7M7iycT3mJ0ssvFzABnQhydNKiQlQ1?=
 =?iso-8859-1?Q?cIx7FtbtaPZD4Q4xAYug8K84GVrYJ4AavFSlXfczKblLd0ox9O2bFvTYNW?=
 =?iso-8859-1?Q?8C5bnpf5HLxmxfZ0OLnYKRX11btUl/iJ9zeo9PuKNwmqC6nY5/6XG6WwJC?=
 =?iso-8859-1?Q?FyAHOSXkNSEnC04Hk7hopgU0CIMeDxZXxAa/YSQ7VuFDwsxE5rPbhY/kTv?=
 =?iso-8859-1?Q?QPj03B+IBhvQigclXVUYuPV0QS1MsxVI6zmXd7U4CNxiwf2xPd5Z/Pny6j?=
 =?iso-8859-1?Q?/VMRxbvzhXvkv95LFUiNf2XnO4sdOUmYZaOxGqfb222ILj9fIqyBVSO3pM?=
 =?iso-8859-1?Q?Hxz8e0oTllVI6EXkUV2b+W/rV7OX1rFkkylkYi0bk4kXQc2V8KQuZCVchG?=
 =?iso-8859-1?Q?zsZ2xW+sIWEnFAnjYdvz1wMiGScuFbjg41HZ9zHRr49T7E9XEru1DIn5sw?=
 =?iso-8859-1?Q?6QnCS+pWuwfVoGBjk8cnK+BveXub2r0Ba1OQvflHKluSvqAm/jsSiNVRPu?=
 =?iso-8859-1?Q?O6bk9KcA/6AAMqFtYZFXJXljoeyeqDnzXgsd//TnMsJPI+UrKYRJrub3U6?=
 =?iso-8859-1?Q?5W+JDBHubsXj83rWN3H6z/aXyC17wUWq1nfgGay1DTMys+FSZpq4HlnreQ?=
 =?iso-8859-1?Q?PfgI/i/As+9gH+sjsUq14K/GKvaxjOb7TusP/GK6RAPFu0B4nGlCB1xMdD?=
 =?iso-8859-1?Q?DGguNbCT03vicqqwu84nKQuXvVUn5nTy+oyR0gDqio/zAB3oNmVtWzmUMP?=
 =?iso-8859-1?Q?MZHQgXAS3kUIBE/J1UI3ClvuBfTDALRopNFxN2jwIzCLzIT8hdmBzuNn56?=
 =?iso-8859-1?Q?UkVhlKjR5r/My/RtFNyzkRSiaKsR91tc6q04oXl8l1ofb/2t64P7O7WCp1?=
 =?iso-8859-1?Q?Ks1R/4esOngBcYGGoMHgYyf02yy//5KQ92Lg4egiDyZM14JN5K4jzcWFsG?=
 =?iso-8859-1?Q?/KD9z0Du9lEJg9l7a2QRcf7BEmKxD9+WB9vFACHH6LTzvr7DSO/tSnuef8?=
 =?iso-8859-1?Q?sD0FW+uwlQS1PkOovR3OpSmDaddHvnUVYp9I+6UfEeNXjzvJqsMeb20bsE?=
 =?iso-8859-1?Q?HnBa8pc66Vg/7mCRNjKNmEQhb4ia4N3yGmSmizFORwrHfgGyQW05thqU5u?=
 =?iso-8859-1?Q?W7HFJgq4cGi6kdkP?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	38b2ddd6-0944-4f02-7df7-08dd50fcb668
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|36860700013|35042699022|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?6naWmvzb46f7lL918BWDSkvv84trg1uNK39Fwd52La1ETkmxBhEqwzfipc?=
 =?iso-8859-1?Q?lI6uethwKnP0gUDF1Ghb4pfu6SoPkT62/1+Ce/jmdRK/lwklVKXl5T5DU3?=
 =?iso-8859-1?Q?U9SPt2MqT9yb33yWrl6lvCn9Ef3lWmIgtVIEiMjPLhai2lMNADcfW0t/dB?=
 =?iso-8859-1?Q?MrgqQKiQ1PczlfsAfavfpZmbeg9SzB6Cp1KrsnVBP+3iDAv5+OUNeXMywE?=
 =?iso-8859-1?Q?Zm/s1b5tn313NgfqXuJLZ/oMS/TgVGDO2Bte7fqlevyDetkzWgqlig2iWO?=
 =?iso-8859-1?Q?oYlqencD6737OfduwXq7ihhz7iUxOf4B/4v4Vig1lm2MFw8pF6wOcUPDsC?=
 =?iso-8859-1?Q?L7Lm/8A/k7tw6Sz1Y8zz8Nv7Qsf17YTjt+v8iOMsctvfPq+e0Rv/CBFk9V?=
 =?iso-8859-1?Q?zPGOp809Ry7NK5FWIfLEvkqJBtOJdYvtiM85E7l/4fBTLbNpG04mZ7j+cj?=
 =?iso-8859-1?Q?PldQ+tb41i6ng4mI2lxNqpA214K89jxCa7UiLePrMIP9220QiB25Jx7ptS?=
 =?iso-8859-1?Q?z0pc8PnnZw0tuFhRXlHDt8qrG8/hh0E0KBWHfrlkeANuXGU75EmOVxERqW?=
 =?iso-8859-1?Q?0lN6elvx2rmrVglPo/qm+CTOcQ+xlpNn0Pzospy5ausk6qcJq98ry1A8xv?=
 =?iso-8859-1?Q?/9zOC9KEqs2WDbu0Yr0vpsnaBWQJZvw/UsLZaGdWX5UTeHTpG3qi9/96uh?=
 =?iso-8859-1?Q?nHAfLlhg84X8ddOpTsnm3q4ZzOY/2Ya5QISwxr1AEOi1b5sRXpZ7XB1Mqw?=
 =?iso-8859-1?Q?s35FXDOiFYaD54PrEsHHy6GpHxcvu8Ty3VxQyVSP76eSe333dNDzUsZgI6?=
 =?iso-8859-1?Q?d3j2hD+uEQjWBf85tZ74zzsrTKFhXoKaGXUWsLZGWrHzgRp4TZd12cVQ29?=
 =?iso-8859-1?Q?302gYOCCTb06+u0juF5IBiS2e9YRhlnfDD4OMc0PT3HzaPhIlLU7cwiPuH?=
 =?iso-8859-1?Q?8wcu7Qc6drlMykzUX6ZNd2LIN+KuSwLnoNLZ+dWW3ATZRubM6ydVJVviN4?=
 =?iso-8859-1?Q?kpgE4Zc8j3Ju91RlU9qdtyzz4Cg3Gb+2igUe3R7JeN4SWTYZrAAgWP8h97?=
 =?iso-8859-1?Q?Y7+TURQo4FG3Wg7hc92SbDDdWU/jhEnPjJucF2Mz4okHUtG3ay5F/KKYQM?=
 =?iso-8859-1?Q?dNJEtZSuGPaC2QT5bQPovRzOnAg4qpPJ3uxU9oDBqo+XNCzZpAJG5OgH5r?=
 =?iso-8859-1?Q?NZFeLFF9MLg6WbTLWZ6OPp2LMaYK0Z45N0eci4YuFHj7I95n7P6iwhy314?=
 =?iso-8859-1?Q?5u6101SGJQWdv7QMB1Vjcu3bg4CS92CJKyyRn9nAOK0LVrd8/kHJzmKvEQ?=
 =?iso-8859-1?Q?MH7uxu1GsiE9gdZTYJ9Qggt7PogEzRbj3eJVPRAMGPxhcHKG3/k3M/kp/Q?=
 =?iso-8859-1?Q?4PPbdnJV4oH3F+577o+iFFcVnLOEGD8Xh0+w1kB+9CCuLIIxFL8BneMGK/?=
 =?iso-8859-1?Q?9E7V/4vf8gkJWICCu6HEFZZV7z0jhYHoLwFMBnwrvSgMkS+58SrOCDfNDn?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: 
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(36860700013)(35042699022)(4022899009)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:47:30.5932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1c4217-683c-4402-dfad-08dd50fcb82a
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1271
Content-Language: es-ES
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211754

Hello,

Thanks for the quick reply. Let me provide some details of my findings:

So the original DEBUG_PREFIX_MAP variable is a list of space separated valu=
es:

```
builder@bc2576acfe0e:/build/tmp/work/core2-64-oe-linux/python3/3.13.2$ bitb=
ake-getvar DEBUG_PREFIX_MAP -r python3=20
#
# $DEBUG_PREFIX_MAP
#   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:666
#     "-fcanon-prefix-map  -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR}=
  -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR}  -fmacro-prefix-map=3D${=
B}=3D${TARGET_DBGSRC_DIR}  -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}=
  -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D  -fmacro-prefix-map=3D${STAGI=
NG_DIR_HOST}=3D  -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D  -fmacro-pre=
fix-map=3D${STAGING_DIR_NATIVE}=3D "
DEBUG_PREFIX_MAP=3D"-fcanon-prefix-map  -fmacro-prefix-map=3D/build/tmp/wor=
k/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3=
.13.2  -fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/3.13.=
2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  -fmacro-prefix-map=3D/buil=
d/tmp/work/core2-64-oe-linux/python3/3.13.2/build=3D/usr/src/debug/python3/=
3.13.2  -fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/3.13=
.2/build=3D/usr/src/debug/python3/3.13.2  -fdebug-prefix-map=3D/build/tmp/w=
ork/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=3D  -fmacro-prefix-map=
=3D/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=3D  -fde=
bug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sy=
sroot-native=3D  -fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/pyt=
hon3/3.13.2/recipe-sysroot-native=3D "
```

Before replacing the buildpaths with `py_package_preprocess` we get this as=
 line separated entries:

```
builder@bc2576acfe0e:/build/tmp/work/core2-64-oe-linux/python3/3.13.2$ grep=
 'prefix-map' ./image/usr/lib/python-sysconfigdata/_sysconfigdata.py=20
              '-fcanon-prefix-map  '
              '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/pytho=
n3/3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
              '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/pytho=
n3/3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
              '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/deb=
ug/python3/3.13.2  '
...
```

Some paths of the original contents of DEBUG_PREFIX_MAP are updated. Howeve=
r, what is really being applied is the sed expression `-e 's:${BASE_WORKDIR=
}/${MULTIMACH_TARGET_SYS}::g'` . The actual values from DEBUG_PREFIX_MAP ar=
e still there. That's why the host paths leaking checks are not failing. Th=
e original code is trying to fully replace the full DEBUG_PREFIX_MAP variab=
le:

```
builder@bc2576acfe0e:/build/tmp/work/core2-64-oe-linux/python3/3.13.2$ grep=
 'prefix-map' ./package/usr/lib/python3.13/_sysconfigdata__linux_x86_64-lin=
ux-gnu.py
              '-fcanon-prefix-map  '
              '-fmacro-prefix-map=3D/python3/3.13.2/Python-3.13.2=3D/usr/sr=
c/debug/python3/3.13.2  '
              '-fdebug-prefix-map=3D/python3/3.13.2/Python-3.13.2=3D/usr/sr=
c/debug/python3/3.13.2  '
              '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/deb=
ug/python3/3.13.2  '
...
```

The reason I found this is beacause I was trying to do something that requi=
red building python extensions on a host were the compilation flag `-fcanon=
-prefix-map` was invalid as that was introduced with gcc13. However, lookin=
g a bit deeper I realized that the sed expression is actually not doing wha=
t it is meant to when removing DEBUG_PREFIX_MAP.

Regards,
Jorge


________________________________________
De: Alexander Kanavin <alex.kanavin@gmail.com>
Enviado: mi=E9rcoles, 19 de febrero de 2025 14:28
Para: Sanju=E1n Garc=EDa, Jorge
Cc: openembedded-core@lists.openembedded.org
Asunto: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconf=
igdata

[No suele recibir correo electr=F3nico de alex.kanavin@gmail.com. Descubra =
por qu=E9 esto es importante en https://aka.ms/LearnAboutSenderIdentificati=
on ]

We're not seeing the problem on the autobuilder (which has checks for
host paths leaking into target installations). And I'm not seeing it
in my local build.

Can you show an example of this happening? So that it's clear what
isn't being correctly removed without this fix.

Alex


On Wed, 19 Feb 2025 at 14:03, Sanju=E1n Garc=EDa, Jorge via
lists.openembedded.org
<Jorge.SanjuanGarcia=3Dduagon.com@lists.openembedded.org> wrote:
>
> Paths in DEBUG_PREFIX_MAP are not being removed from sysconfigdata
> files correctly as they are split into line separated values. Update
> the sed command so that it uses any matching patern from
> DEBUG_PREFIX_MAP instead an exact match of the full variable.
>
> Signed-off-by: Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
> ---
>  meta/recipes-devtools/python/python3_3.13.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipe=
s-devtools/python/python3_3.13.2.bb
> index 52fac76c00..656a73f501 100644
> --- a/meta/recipes-devtools/python/python3_3.13.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.2.bb
> @@ -291,10 +291,12 @@ SSTATE_HASHEQUIV_FILEMAP =3D " \
>      "
>  PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
>
> +DEBUG_PREFIX_MAP_REGEX =3D "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').s=
plit())}"
> +
>  py_package_preprocess () {
>          # Remove references to buildmachine paths in target Makefile and=
 _sysconfigdata
>          sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-=
libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> -                -e 's|${DEBUG_PREFIX_MAP}||g' \
> +                -e 's:${DEBUG_PREFIX_MAP_REGEX}::g' \
>                  -e 's:${HOSTTOOLS_DIR}/::g' \
>                  -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>                  -e 's:${RECIPE_SYSROOT}::g' \
> --
> 2.43.0
>=20
>

