Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC157C25B77
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 16:01:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web10.20514.1715788853290541022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 09:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jEk/vJrw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jEk/vJrw;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oJmwxmhdn7mYkRgx+OXR8FGqQ21PBy4cvkfCHRmV4FYdnRdOivIbWz3CDx+zQ7MRgSLDCRVJU0z0pN7KZxn+jmAT4KWT6/tRyvcRtGSnBV93DDFhFyHACRoIjAAVSkwLr9n4N/yrhXHzbzSthetieY2+wC/zV7njWWRZZrchCfey9loULvK9+e1EkbKbpj7Bk/WuS1MeyAoxPjg5Ak9CYeGUAXacBOossGWgaRtFRUN4ZVB2d02cA0AUaUF+3J7Mgw0K6hZUX0D1AJbqHGkmDM6SdaNj299Zo6XB2gwufHCzasmdDFVuXV04zKgiy5jZmXYN6WkNKwAGRCBW+nVC7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfxY7MgSDjO6giItlYMFRUsHJQ3gSiSoXgMbgHJNt4Y=;
 b=nuFvN6Mbg4uVMh+3K9GS2mYMDnhiX87srB+gVp1pNYvQLrIUwXyZXiHbe+oriRfv0y7xAbihB5E8ZRxuDSXRwSqX5zGpL7LOADJTEb/lBVRrBGBbhtz9vdH+SM4WLHj9krlUFjhJs30O/6tF2+8xMj6gHQOXFz/pysM5M+HUI4Klj4Cb6eAeuvzGurWRYN6G37mxuW7QDk5DzcuQ9YmAxb8aBBu72EjKOL0/L0ImcWRU91+PVDNpvPFfUIXig/ydLaGSkH4npfRHEylNqiIAhnWD4Kki5erjdpSioiSwtfuXXrVmIFFfNjpTT0CrEMPUtknPRKqXz30nfK+dtxBKMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfxY7MgSDjO6giItlYMFRUsHJQ3gSiSoXgMbgHJNt4Y=;
 b=jEk/vJrwF797/v+zMAH9XzKm/ZF3l2sDKIW+91solIwPNZGq+szFXkpCF/LP689C6zB2XRMsw35dyHxbJg37VS9tXINJfFyutO3yDsixoTzuwEU+TnXCkwOdhiMVcSLfv2ohCuMSOO1Ijdg7y9velz8P2gQv52LjO4jT2y1wNRc=
Received: from AS8P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::10)
 by GV2PR08MB8318.eurprd08.prod.outlook.com (2603:10a6:150:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 16:00:47 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::9e) by AS8P250CA0005.outlook.office365.com
 (2603:10a6:20b:330::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Wed, 15 May 2024 16:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Wed, 15 May 2024 16:00:46 +0000
Received: ("Tessian outbound 082664cc04c1:v315"); Wed, 15 May 2024 16:00:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9fa0d63a468ecc7
X-CR-MTA-TID: 64aa7808
Received: from f0c0ae5ddbef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2107BF1F-E247-4201-87CE-E7A2A3C1B38D.1;
	Wed, 15 May 2024 16:00:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0c0ae5ddbef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 May 2024 16:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRVRXa2Gfn02uZxAkkWnrYNe1A7r8SlZwm6//HyO7q5gMVgG+fvIXCGeiOw2etLnOGx+t8bW6x5bMD3x7kVkKGtnQfTOTz0YC/pK4fudrXn6ZAentmfGiAGtNYhnGcJStxI4t7ngqFu9Z+sh3rWdH1ddo3aZ8zUEfbUIt+HJ3g9X2/oO9cvvDysPX207pcdqPm6a48YF0kbv7bQR7mXfLiWptUFX9xoUCqQmDxBi4eF0oPyujDzCNQ+jiAQgdH4oFJ8PZ7u5bCKytGS1Ek5c3PEBJNPDdilT7KeCGcxS9j00m+VbOhdRpxvLrwOwlq5CxU5A3abkutAz6P6Ja4oGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfxY7MgSDjO6giItlYMFRUsHJQ3gSiSoXgMbgHJNt4Y=;
 b=F4REla9hHTaIvcUqrQ3fgGjZIivi/i76v6mzDJT1QRSC/bF2n8aW5VgpdAzBhEQFRGPM8WjSvYoNHtylcfDbntB4cYIsa+/C1NRZk8yYZBrlgNeo1eWwcByniqG4ymmqdP1HY2BgowU4WUENT8f+9Uc5I12Ruj6Dyj490STDGobp5U4pktp5axyjn8JzO1suLGRtV+LJPlC+HbnzaCeSWxxrBdKQSx9QXIRPZnP1QybEmPwa/mGPw+2ta5KXtdU6OdfiI6QqBvMSmdCyzgWlHYFF5O1KnXASEyHaYUm0LI5FySb8fb/XvrOQ6MZ9KbdkWyMwggqLrXvJ+TgVQXDvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfxY7MgSDjO6giItlYMFRUsHJQ3gSiSoXgMbgHJNt4Y=;
 b=jEk/vJrwF797/v+zMAH9XzKm/ZF3l2sDKIW+91solIwPNZGq+szFXkpCF/LP689C6zB2XRMsw35dyHxbJg37VS9tXINJfFyutO3yDsixoTzuwEU+TnXCkwOdhiMVcSLfv2ohCuMSOO1Ijdg7y9velz8P2gQv52LjO4jT2y1wNRc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6383.eurprd08.prod.outlook.com (2603:10a6:102:155::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 16:00:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 16:00:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>,
	openembedded-core <openembedded-core@lists.openembedded.org>, "MacLeod,
 Randy" <randy.macleod@windriver.com>, Ninette Adhikari
	<13760198+ninetteadhikari@users.noreply.github.com>
Subject: Re: [OE-core] [PATCH v2 1/5] oe-build-perf-report: Add apache echarts
 to make report interactive
Thread-Topic: [OE-core] [PATCH v2 1/5] oe-build-perf-report: Add apache
 echarts to make report interactive
Thread-Index: AQHanWhfoiaeTNsIUka24P66k3a/z7GYhhCAgAABIIA=
Date: Wed, 15 May 2024 16:00:37 +0000
Message-ID: <3546E12A-9317-47D4-9B90-55E751C6BEAC@arm.com>
References: 
 <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
 <20240503144340.27385-1-ninette@thehoodiefirm.com>
 <20240503144340.27385-2-ninette@thehoodiefirm.com>
 <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
In-Reply-To: 
 <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6383:EE_|AMS0EPF0000019F:EE_|GV2PR08MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c3021c-600c-408e-de38-08dc74f82ec7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?jrvAnaCYeqTKKSBuECoYClNuxJog6JU0Fsz4dqaKVUcl+n3t94rJGE5Sw5nE?=
 =?us-ascii?Q?/zZkc5HkfsNiKdiBwj+f34VxGi4+BctbjvYQxZQvr6PeUBKXEyEdGXVpu0oj?=
 =?us-ascii?Q?p5wSuKez2AkoKJdcjkX4UYeJhVuYwys5P2mFJ4RR0ChklXKV0U52/9b+12zo?=
 =?us-ascii?Q?8HBTuPnA2vUuPgNRWdicYwfdeKLIffbIWlR6R8R7Io6QVS+tNw/Q3Df84ZxN?=
 =?us-ascii?Q?+kgcHlv/k4UhJHXlM7Pbg27Gg49dsq3IrODYnQLINRjuyoL7M+diJU0M7igw?=
 =?us-ascii?Q?oQde6eL7M23AheUn1D+xCDhZGrMziFlmOhO9Vn0vSDPtPU8zjo4/JkFQatD/?=
 =?us-ascii?Q?g0hA7Tr9mqaNs8wlH9gofyH0/uamja4SMJOpbqHw28X/xu4hxGUyuPZfeQMn?=
 =?us-ascii?Q?4pnRccewt70LSLNEBS4BY6bb8vek9ufyNHDxbBwjrpEJCGld2PjcANrMkD2t?=
 =?us-ascii?Q?sVfAKdlGrAvnvXQgXw2PAy5rsp/LjhcRgN9Vwb929RnVCPgCegI35j4mAXVw?=
 =?us-ascii?Q?YPoptPdytxUCifXzwbAAxaTwfyEWvxA/dJTxXRfGrvQGzT8XXOdE4n2ANEvx?=
 =?us-ascii?Q?FefVXTXqNJbikXSjCkRczzh7bpbz2YD4bZnvSHQq2/BT78P46MCt9tp8ezSs?=
 =?us-ascii?Q?+JrEE0FaI4sqRc/kf7sE4HfvpRFX/gdNPY+Y+gP3MylXzlAyJMUg2NwJShqS?=
 =?us-ascii?Q?GI5z5vvpTy88CkEcQN2452ITlZOH9K8wu5dLUjL30dJ55yivZIZ/DnGg6Yq1?=
 =?us-ascii?Q?F49CN8nop4rsqAZS6qHMI2Ra74cVjUEjoTTbr5pXH4bXMMleONh4BfJhNX1t?=
 =?us-ascii?Q?7JnZpV6xN/lZRuRZP59/NQadiS/A6voUKnqKcfE3YLVcvc6vgvDedqKStk/a?=
 =?us-ascii?Q?r01NWgtIoykNWqLCF6fiLzTANfOoCZT/c/Mq6LZgO7RQgWFHzT3ggiQamXA2?=
 =?us-ascii?Q?GRueM8YtxtO0ENfJrIxu9jxgTstq9Ac51dH+6vYriE7Iu7Ax6BHAGwjX16/J?=
 =?us-ascii?Q?sbm3iJYi5RX5e8AZE/yrV2N24Ij6SuTwGR6PDKFoZDIBfIDwu/U4MApO09P5?=
 =?us-ascii?Q?l54K4dooVWt4PviqVqgN4dvF9DFca8f8z0m6XmzaD1htN0abgwu928B53N2h?=
 =?us-ascii?Q?3YED8u4XI7lJMzJe4Llf4o/bRjiiRtc49ft6xaNEFB2H0oxRxOjt12WddPKK?=
 =?us-ascii?Q?pQr5uOqkAvjYL3mEVdtx0uBso2VQ+S7LxOQCTkBDjI4L1Dnv5+iDqkh4e3vn?=
 =?us-ascii?Q?iEYIdQd+moBcNmO8skNQFk8KVXPr2zniWJ/9dlzOnQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A91BF3CD5310A40A45E963265B8699F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6383
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dafdc63d-e31b-4ed6-e473-08dc74f82969
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|35042699013|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uCqbnSUQodl/VClPzkX8IPbeYYtIwTqUcusHpXgRNXddtGop2sEgu7nRYXCI?=
 =?us-ascii?Q?Bi+xz5ng5D5H6OD7LagOC1DpqIelyp9WFyRY4/1LCDgmsAySEDZsdeou2N+X?=
 =?us-ascii?Q?kTV7EJy4hhV/BfL/LAzWKHeTPS5zX8hM1Xjj7ee1fv8zt5pqhGCcTfHKHWWO?=
 =?us-ascii?Q?W7JKXYyMF5ZghC4c/TAvdSQAaACV205R7qqvcG9fB07dsP43c2orc+vJ+vML?=
 =?us-ascii?Q?i16FWC1TpWZLIykQOCLI+kSWDMfMffO4J4h5hZiSs34gHVOUpChXpvixihZa?=
 =?us-ascii?Q?orohKl1bE4XfNTgrCKEhEwJXNh992qIni9EsPAq+e3ScGv8H6vlXFpljrICK?=
 =?us-ascii?Q?5wUIL8joJ+XsoDqrQ0zLZpmQPVeYTh7GBHLqbbYt8CCW9lJHOLIyxrw0hOJy?=
 =?us-ascii?Q?P6lebyHAiGNKpYLU/lY/vGUlK0WQApQmFsFaYP1RUkKcH9NfRxGFOiVi23La?=
 =?us-ascii?Q?zCrkaY/a4BcF3Rdn3fl4HuHvbrxDzQ1QybhjAfZKSTDL5P9NfkQqL/DXuNE1?=
 =?us-ascii?Q?FpE5MB/Pk4/m80x6VXEwJMfGhmRX2BlySEpCShNP8SyOX7vjtmD0stv7I7O2?=
 =?us-ascii?Q?f2vBzTzOuwpV+m7S6llTv9v2X6pV8MC457ZLPwh+THDWr3etA6ic/6+MiqXI?=
 =?us-ascii?Q?xhGTx+Olul6HPwth+VSXDSqBEVX7W8ng/NlBEJxWKjxLS/Lejd2D6GFXXO9o?=
 =?us-ascii?Q?nLW/avl/zP0jxUKvsfi1M6NF+ERrPT562o80RpFP/UYgtU0EEcNIF7paB+RE?=
 =?us-ascii?Q?H299wkAdDFipNmvqhtv65FDygDLwq9mDHV/O1Bv9YMOS4SJnN6qS3r64yC1B?=
 =?us-ascii?Q?/Y1amqG+fu9KNV8fUXh7YOO+KzPw0+LaF6+LrPwhT/rCsf9J4hWI/+aGkP+E?=
 =?us-ascii?Q?5z3mOMMJD5ZEivoZnNzH7fgkOj65tnIOMISbWq9oJjUDUBOTneMbo3wmryOA?=
 =?us-ascii?Q?sIkuCRnbkBQ/BrssEWLqww0cvKIhIoHM9WVUSB6L1J6u5C7EebOlq4/qv/NV?=
 =?us-ascii?Q?PgbnYaqKtvDTkZ7b+9YoVmZIrsBb1K93TCbPKdSuvuOWaC7ml+JJBF8cX/C/?=
 =?us-ascii?Q?X364nUsrTm99xqQK14HQrWvLmfMiXVhPLb6N2uALWyjNHS2do3pqBEaa5O5d?=
 =?us-ascii?Q?EmxH7WTcENEIDL9Z9oxRFnlNgJ6zqQ0kVAg0pXrhUD94dHvb0XUMAidP5RaA?=
 =?us-ascii?Q?QTNZjA3a1HIHHVzueKvlokJQOSpl2c53a3Y/rGCt5OBKws3zjHv2m8cYrQ3+?=
 =?us-ascii?Q?zp+DOyBYKgz8luegLoYXfQwoySW4Tn61lptb3730oR7KyiLtfGVBg7AfXEtz?=
 =?us-ascii?Q?vtcZ+XgNYugHGeJ+0g8onQ1J?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(35042699013)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 16:00:46.4860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c3021c-600c-408e-de38-08dc74f82ec7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 16:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199294

On 15 May 2024, at 16:56, Richard Purdie via lists.openembedded.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> The other question we'd wondered about is whether we can show the
> commit hash as well as the commit number?
>=20
> The tricky part is that ideally we'd be able to copy/paste the hash or
> even make it a clickable link to the poky repository
> (e.g.https://git.yoctoproject.org/poky/commit/?id=3D6582436a1d1af7775a6bb=
651aff47a9db773e32b
> ) but I'm not sure how possible that is?
>=20
> The use case here is where for example there are the step changes in
> things like disk usage, or the kernel build time, we'd like to know
> which changes happened around that time. The commit number is good, and
> you can resolve it with a command like:
>=20
> git rev-list --reverse HEAD | nl -n ln | grep ^69808
>=20
> but a direct link to the revision would be ideal if possible.

A better way - if you already have access to the results.json for a particu=
lar run then metadata.json contains all the SHAs that were used.

Ross=

