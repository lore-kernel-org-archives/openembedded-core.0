Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C06FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:21:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17042.1777544466030083422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nkwpceRK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nkwpceRK;
 spf=pass (domain: arm.com, ip: 52.101.65.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MnDEWAluOGYxxZ9jfP24Ck3KAuRw8d/hiKnSiG8ZRELpTrbvgPYSbznAPhNkQQH1fA0ntqkKAuLUMXfyeB5F2Fnzw5D4y7jKKJuzfuamkQfkoI5iD40sX/0QK+AXstYffs2wCKctnDgWapLmXi0oxpvpe4fMgYEaNF2IJctjuosLsLXmkoYGqGuxoe9RKvbm81RToyVb1cmh/JEnH8WR2JTOXpRzsFuQe9xsQtb/RTngbPFunJWXZo/28jqbjaMsMXw7QTdFR1AoIREEpEvZTqBjhX5furWmwGS22abOOc93k2BKNNCOikGjAF+tXPSRa1M3PZPV5u7bhoB2H04pSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FodODxxjk1KWSgmnoqmPurhg+eKYCwQ27aJw8jmC/9E=;
 b=vqFO9vqkpAH+rVyBaCLK2bHZaCi+8IR4/rjtnGfzod8HAn5qDhW1TSGXeu5aWUDwWmaF0Rhq5Sdo0Ylhz/sEX1EBARpOS4CpccRyDnUWsX3kF2Ndfu5SW1R2lYfenm6W/k48nMZy9X2Pd72bAK+ODAG8W5OjOvmd4nUT6p2C8pC3NLIgEXBYWMxOcLJSRCaGjAFhjAdmJZ/uYCv2nsEFv6OhLiUu5xWkJde+XAGTVZ490Gh52sWJ+xlUcEgF/UwCZYBdTvnZRYUAzdhF6Q5NXMrLgXLfyndqJyOZWOW7NVBLNc3Ss/S5OCx4pF5eQxbNWpkZVFip+NahIAA/LBBHkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FodODxxjk1KWSgmnoqmPurhg+eKYCwQ27aJw8jmC/9E=;
 b=nkwpceRKeaH1ZN79G52xQt+3jD6pBDis3GO6aZ8SHlrTovl72ojSoM53A5cOcM3F09qt+bqRSxkXnZuRcy+fPTVX8FPl2Ux2NbLXeSRnhJ2zIPd4pwjJU3BpUEl3+Di8ShiM2rCh3yWAUYZxriPfkemdEVk4Js7Q7O0nwkjJ058=
Received: from CWLP123CA0263.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::11)
 by VE1PR08MB5631.eurprd08.prod.outlook.com (2603:10a6:800:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:21:00 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:400:1d5:cafe::72) by CWLP123CA0263.outlook.office365.com
 (2603:10a6:400:1d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 10:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzoWeeMA8h909QS3XnSB7N3F8QMc/HrqXaRqjs8ai8wQ+zkj6ts+sp1EB+GhWg9kILxCrJkHD32PqN43IgQsbnbwYXA/EVNWxfn3eOq/QHhtdV41EcbNCB51wyIM89meEhox6WYGv7MjYfvP8h1sO6q5wX/7f7XPY/ez8c/H3kTJOxvQevm0LVhqEvvYHI1K6gzGnWft+P6wofOWHER6VlwcxIZFBImkItS7A90n/3T/2QuBvCIayzzjaAR95Ow55gncbsi6s+OXeqnCjGX8MibID1N6bkroNFN5OTMxAXip5lJlOzYBLemuAunG8Ltg8o8Z0NSWidkCenu5FdoLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FodODxxjk1KWSgmnoqmPurhg+eKYCwQ27aJw8jmC/9E=;
 b=qfMy6Jh6G5u6QTmb8bh4+EgnwGCtMl/5HxEd1yX++1W3+7jk2/sMQJ/R88JgBkW2RywQvTnMie2ilxEKNdizzaBlnGIG/UqgcvrEZxLvQqLCaNK+GErjXCfFx3cqj66DVoNnKxFnYdQikWiVSSRX9T69cCxQQ6eLrwNmySXdiKF7duAnfwiKgAuD+7+XxTfO452USz3Z9JXGhFPEAaHQmDxgjKHXnW+rdiUJPLMSVdv+Qv3YSTTEro1TG9crJOZXwnblMayup3Uiktu435vdk42VuWy/CVbf/yHi5SL6y/AkAwH04Y9Ej562q+z/tT4HBe6QNaTMcPgee2V8dedV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FodODxxjk1KWSgmnoqmPurhg+eKYCwQ27aJw8jmC/9E=;
 b=nkwpceRKeaH1ZN79G52xQt+3jD6pBDis3GO6aZ8SHlrTovl72ojSoM53A5cOcM3F09qt+bqRSxkXnZuRcy+fPTVX8FPl2Ux2NbLXeSRnhJ2zIPd4pwjJU3BpUEl3+Di8ShiM2rCh3yWAUYZxriPfkemdEVk4Js7Q7O0nwkjJ058=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DBBPR08MB5993.eurprd08.prod.outlook.com (2603:10a6:10:1f4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 10:19:55 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 10:19:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [V3][PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
Thread-Topic: [OE-core] [V3][PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
Thread-Index: AQHczH3nffd/Dt8u2k+kpGdbrBy8bbX3fL4A
Date: Thu, 30 Apr 2026 10:19:54 +0000
Message-ID: <EA0FD39A-16BC-4AFD-B20C-165881302EFD@arm.com>
References: <18A61B7E9B9AB538.1398202@lists.openembedded.org>
 <20260415021611.525515-1-changqing.li@windriver.com>
In-Reply-To: <20260415021611.525515-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DBBPR08MB5993:EE_|AM3PEPF0000A798:EE_|VE1PR08MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e81b6eb-a2d7-4a4a-c8c7-08dea6a22bf8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 IZPrLkCKdHfQOQswx0rh7jyevrLXJjXt74u4WpEfmsZ1Q3P9w5cI7w/n8vFUjadAIZzvODQg1p31BWcRxYe9yug8OtDOhHQ7Fkeyk89uVL2t5dzQ1a6Zyaup0M42uIj3UhXFvmSDlqSxABcMln0j+Mq9RNawNh1cj7sHFI5wUK2Cisj+zcjizFNfnjx4uvl5dhVAyJLY9jBrzrwCkNdadXX/7F0pSYCAV8nm6iACPKTy0d6iluwlrGwutgwkd3gCLL+rV3JiKnzIJaSXlxkmgicqCirk8Xc0L+TNszFptezBiGECjVKq7aAnW+di3b3c1saLnzIZ4IV25VyO3r63Jz0FSzR1HUIw1e+rsz+eEUJYz2wDWdVBjv5OoLyky/JecxG7zAhVHwvgZjSB57N7G/7CkMvymmFtGa7eAAEudT06gUcJUlz5CXW3JB4uALbnv6Es89Qhk99TaweZ1TWX3yNnfsHMi1wXe+sZ/rSGgmB9adzw43BHW2Sa8y+K8xQNK4D+IN11gKCkaonupcMhZfNukygfwIwCAcx2MZV5xY1TPAplLUUBA6lwoH36sctE5Jx78F/EPffINj7cEZ2b/OEpvdtY5WgcZoNFn1ttGn1eTZSS3SBtjjukP5iqj/dN/0g7+5k+IWAMKgPbdQP38hKpsi0/J3xidSW6eUBE3roFMCycMUGUWaLIjYgHR2WWmpclOZlvN0XYdhbGyLZ6bDh8xTeqxZUct5zgvzOvhg4EwJfkVwU90zARtnbLDpy4O6BoD8qiT/D/fughjY4B8K4dVpqM7tI2or9fCbbOUTo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C4549C503EE614E98C072CB87D31317@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 SwW9poAZTrfo3EMQl5s/NxzCh4W5GqaNEH4qCi7uS5MyswFQQVS3nzkulTHd30B7Ck29v90JQfRSv0B7ZkUEOHMKsRc5oP977uj1FyJl4gmXHzbe+6OM1JviNlULFbh4RJlE1DVtoBN8btVK05JFmAyy1vUD8mXT3Yk/E9W5stVzlEbcNqXCGTKBpM++jlAL0k4ej1CY85jk3QKm6ajn+cDDMdCrncXiEG4f2dq/6cjjtEtrBHyDf16aFoXFWM/Jrp4C5p8qyIjKJkeaN0iyZNjHOSPWnN7LQLLMVcpDCtkk0/otZ/0OZUYgzq0uKcWkX6NngRpkiZtx8N1XgxmnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5993
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	945450fe-0b16-4888-04a0-08dea6a20613
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|376014|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	zFYcwHTaISrHm1SIzivrUrfJxju/2u8RFC1eTsMeL/Sb12TLVWDYoGZkswGVGzflsqZ71H3PHf4sNqiU1/d8YAtMa6Q0zIaXSWMJfRN4aQ6UQOBKGCl/ZkTBiQmKst0UvqIZZGp4krPPV+ES8A1/gvjar4Q0GxW6/J6OGeOqD6Lry0sQ9bZ5rMq2YwdXGCcE2b/phoMRaH8j55f3VD0mZA2t8TQzUzPH1ix1c8J63mCOFmMxv5c9H9nBdrw7IyHzuMCINNdVctZaPoubijDjOEVFGTUl4tpv/rRCQbPus3N4DvnIGfwBVj/dC45dsc6pE4xAnXXUw8vWSf7299rC5Y3vjkvFN7Yo1qGyPJNZK8mv9Sp6GO4hjs6MsLvFf6TAfcJYEuLZR17mPoj5U+tbEa70oszFdLWLGT/cBeIVtW349AigERJOiolCX6K4iooB64JL3+hkeO5MOFGr4TeVpslsfKjHb2Eyzx3VNr+RylCuvD5W2/Kvp0segyoBqkGWoz+H1jDh1CrC0qdt6thA/IXhJR8ONSxoy9U753g5V6b0HNHjRHbzExEK2Nm9+82uK7rxdrT4zA9E3vOj8wMn/vLGEhg9+hnh7dTVB4AVRo3smS8oFu/5nJcC5wSW3iWaQHbDdIvMXqfZPg1+HwJ/wWjPLwGgb2yUxV/3kiZ5AFj7RziT65gIjLl16a2VQ8/U5a0P23n/9xzBfe6OgPLSxRERzaNPs16w04bvcyxtLHjk98Gdu6hC7uc1aXUYkiw1OXLOpkvUqd0Ehuz06bB4cw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(376014)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2TlTgzslR0t9nfzs4d2W2WHjre843fhZYXM5zhgrdfFiSovmohNLpwr1YtYRny19oFzPSzTWtYvOxJLHM4uHApsphghEixtc+e8V8jIiXH8YFWrkGET+LwW1TzZACwXvP46WL1OHVrBWcjUynzH8M8GbC01ddKP/xnyRj5BB0PnlmebxzECWclqIfhgfNSPmIGjZvXxboHI26r351Qf4y+hJPOUo1sGQSyhMiI4a1NikUmpp7tQEsKCCOvkQJE7KhQ/rsL5agk2Tb6/7nrlk5pQ/W+y7Hv4aiyWeNVfxHjEyZg9mZmcF8mm6hpcZ0/usmw/fusXuQExMJHgRPOD7YBzlLyOREOB3e7ykr+7M1VlWx/q2tewDV4bdge7iySnSrmBHHPmtMMAbpO98WE5zXVcYRKL0AgWwu4XcsbxPFqWTHgm+cmj2dV6sIfhayRNd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:20:58.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e81b6eb-a2d7-4a4a-c8c7-08dea6a22bf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5631
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 10:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236157

T24gMTUgQXByIDIwMjYsIGF0IDAzOjE2LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gV2hlbiB2dWxrYW4gaXMgZW5hYmxlZCBpbiBESVNUUk9fRkVBVFVS
RVMgd2l0aG91dCB4MTEgb3Igd2F5bGFuZCwNCj4gZG9fY29uZmlndXJlIHdpbGwgZmFpbGVkIHdp
dGggZXJyb3I6DQo+IGdzdC1saWJzL2dzdC92dWxrYW4vbWVzb24uYnVpbGQ6MzExOjQ6IEVSUk9S
OiBQcm9ibGVtIGVuY291bnRlcmVkOiBObyBXaW5kb3dpbmcgc3lzdGVtIGZvdW5kLiB2dWxrYW5z
aW5rIHdpbGwgbm90IHdvcmsNCj4gDQo+IHdoZW4gdnVsa2FuIGlzIGVuYWJsZWQgaW4gRElTVFJP
X0ZFQVRVUkVTLCBzZXQgQU5ZX09GX0RJU1RST19GRUFUVVJFUyB0bw0KPiB4MTEgb3Igd2F5bGFu
ZCB0byBza2lwIGJ1aWxkaW5nIG9mIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZA0KDQpJdOKAmXMg
YWJzb2x1dGVseSBmaW5lIHRvIGVuYWJsZSB2dWxrYW4gYnV0IG5vdCB4MTEvd2F5bGFuZCAoYmVj
YXVzZSB5b3XigJlyZSBkb2luZyB2dWxrYW4gdG8gcmF3IGJ1ZmZlcnMsIG9yIHVzaW5nIHZ1bGth
biBmb3IgY29tcHV0ZSkgc28gSSBkb27igJl0IHRoaW5rIHRoaXMgY29tYmluYXRpb24gc2hvdWxk
IGNhdXNlIHRoZSBlbnRpcmUgcmVjaXBlIHRvIGZhaWwganVzdCBiZWNhdXNlIHRoZSB2dWxrYW5z
aW5rIG5lZWRzIHZ1bGthbitkaXNwbGF5IGJhY2tlbmQuDQoNCklkZWFsbHksIHRoZSBQQUNLQUdF
Q09ORklHIGlzIG9ubHkgZW5hYmxlZCBpZiB2dWxrYW4gJiYgKHgxMSB8fCB3YXlsYW5kKSBESVNU
Uk9fRkVBVFVSRVMgYXJlIGVuYWJsZWQsIGJ1dCB0aGF04oCZcyBnb2luZyB0byBiZSBxdWl0ZSBh
IGxvbmcgbGluZSBpbiB0aGUgcmVjaXBlIHVudGlsIHdlIGhhdmUgYSB2ZXJzaW9uIG9mIGJiLnV0
aWxzLmNvbnRhaW5zKCkgdGhhdCBjYW4gZG8gbG9naWMuDQoNCkkgdGhpbmsgdGhlIGJldHRlciBz
b2x1dGlvbiBpcyB0aGF0IGRpc3Ryb3Mgd2hvIHdhbnQgdG8gZG8gdGhpcyBqdXN0IGRvIFBBQ0tB
R0VDT05GSUc6cmVtb3ZlID0g4oCcdnVsa2Fu4oCdIGZvciB0aGlzIHJlY2lwZS4NCg0KUm9zcw==

