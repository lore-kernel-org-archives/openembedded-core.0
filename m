Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB63CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 12:53:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15949.1779454385825508453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 05:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=de21PpBD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=de21PpBD;
 spf=pass (domain: arm.com, ip: 40.107.159.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=M4NL65ff0UTKxEkXyBIEjNCSWLkcipW018AAQb6WRx7ppcdgmardpUkDnpR5go7D3wDoQURtW8K0jragIHr7kXA2TUpf1XBOLAtvwl8Ezy/PoF4pfUF6m05xurRWsvJWY5flOAr87kvucpH7EXZl6cMPIi2LFzeGepRb/+wNBo98Ona14igRQeiQXXNUIzCKrdkAcrbdfBDOEB6OIzcyV9tGhnSbdsx3j2FODO2/OY3crW6gGsWhu0m6anK/XdP+sWTy7XDpfEujE+HUKsEDSM/1l4pulNLiIH9+MaTHfbSm7SNOAvy0s2yZGHYmuR26XFTAWbE1QUtoTp0LUuBJcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHpMk1YXGrcS4jeK7vWS+qUOyq94lC/7/Dk5ciIpGHU=;
 b=d0JryUg98n6UoLXy+eGPI7M/Amt5bFj+QlHSiJsKyLPbDUdaFPY5rdRDD6MaHZ8ajze3gKTQYXV2sjWhk+wGYoKv/v0qFIQKT2QuT+hAx7EMD+CkwR+8SfR6u1aO/U+rwbA3+3oI3uURtgiPd0pRjIHSiEDxTIzW54ZQSnLm3CF9KQu+I9Ez+7xBZdXHeatfZfC+BJD61Qm0NtUMusIkiBBjsGEIr7ijiWvRlO1u3SCEQ6UK/EKHAQ78cN7MdTwOT9wD5H7KCKN7mCt48TrfFL5s1bNhVEmynGpb7PEMTB0+dRKX/eSRC6XeJ/KQLzNPrEW2rrdiC4jdXrzzz/Agzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=de.bosch.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHpMk1YXGrcS4jeK7vWS+qUOyq94lC/7/Dk5ciIpGHU=;
 b=de21PpBDubMwsSNyn0kCR4xhK/raytFVtUqEbHWKzcx+znw4fdRTOT3n20teqhFdHdjX/U9KHI9YjzKSsWLvgTbo2pNPKzfcOnZKVZlmCdLLsfVBqjFV3YO/nxm1U/cDsd3mRC64Nx+Ani2pcQJHFiLO20QVERQNvHF3p6VSyWI=
Received: from DU7P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::24)
 by DB9PR08MB7471.eurprd08.prod.outlook.com (2603:10a6:10:36d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:53:00 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::28) by DU7P191CA0029.outlook.office365.com
 (2603:10a6:10:54e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzMdyhM21pYMbgdpQlM6mBEwT0Ui01DsMj9zRWVUdrgEzAdkg+OOpHUrSL+gP5Ho8qr65F/Zxv7YLm+ridaQ85J9uuGccp0WFCuJxh4QpHRFrnjSoqCUU93O0If4UNPjd7SOVnAW91NE/vuDmrDjQyw6EiP2gp5ahtUF3tobzoLAf+FWenbSIz1Rv9HURlydtSaLjrDzpbP1QlUODZHZ7ICjU8CPoLVXQJB5QdtHPYfWTn0mEByeGk42uJsF6qkNRrySIQcWd6YXfTmPXrQBCyWSHeOTo6/+GSMsiMEtnyDXFypzrGVSMsmS9YsKdoZxWilhqjp4w9BuYrhEPwrv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHpMk1YXGrcS4jeK7vWS+qUOyq94lC/7/Dk5ciIpGHU=;
 b=Kwe0XXthxkSCJaglKN0ZFJJ7CCuZET2b+eARKJFRux0I3bwFJE/PJBbxHwpjMy0BLozbBEJb+qpBtPKyJDOznZNtX65stVr9FbxIQLnZViwKR7PlELG1q0i9tWFLysRY3Kj9bMgMfWNITEoZYn49LajwVWubqoyuoCX/7rppMBhxQ6EeM5HgdpIOcGJD9d2JSIWUnV3U9rfo8SLa1HRroYSQ+XEKJvVAX5zjuyfXqTabbApNyznv3Ci2AqTV8PYE8AEIA19oOLUMawXFxwrEftUR+O7mWN4SazWJs5o9Aiop5PECOJVpLnZ9kUWox8kcYAjly2TeGDEaQdes/bQlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHpMk1YXGrcS4jeK7vWS+qUOyq94lC/7/Dk5ciIpGHU=;
 b=de21PpBDubMwsSNyn0kCR4xhK/raytFVtUqEbHWKzcx+znw4fdRTOT3n20teqhFdHdjX/U9KHI9YjzKSsWLvgTbo2pNPKzfcOnZKVZlmCdLLsfVBqjFV3YO/nxm1U/cDsd3mRC64Nx+Ani2pcQJHFiLO20QVERQNvHF3p6VSyWI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:51:53 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:51:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mark.jonas@de.bosch.com" <mark.jonas@de.bosch.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "robert.joslyn@redrectangle.org"
	<robert.joslyn@redrectangle.org>, Paul Barker <paul@pbarker.dev>,
	"peter.marko@siemens.com" <peter.marko@siemens.com>, "pkj@axis.com"
	<pkj@axis.com>, "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>,
	"changqing.li@windriver.com" <changqing.li@windriver.com>, "Simoes Ricardo
 (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>
Subject: Re: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Topic: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Index: AQHc4vIOpZuZGiGmnEywIKaAweuUgrYT/yuAgAE8+QCABNFygA==
Date: Fri, 22 May 2026 12:51:53 +0000
Message-ID: <77A5FE30-035B-48B1-8D94-0F219D9D69F5@arm.com>
References: <20260513160218.11997-1-mark.jonas@de.bosch.com>
 <0d9172f08910760f6ff0866997a4723699f96ec5.camel@linuxfoundation.org>
 <DB9PR10MB5354A6011D8064EED83711A9AD002@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DB9PR10MB5354A6011D8064EED83711A9AD002@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB9032:EE_|DU6PEPF0000A7E1:EE_|DB9PR08MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ec131b-fcc6-4c61-c42d-08deb8010dc4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|56012099003|22082099003|38070700021|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 MCCvJQa9QQKZOM8zVFGMeVobhWPpPC0kksOr+oPVeu4xMr3bWNIvkqLmb3jUxyjPNuN5IDyueiSWTxZxjsAAITVdL0ZgZKpwENzwaSj8J9/ZwCI+ZpBKJqty/JwNg/A4zZlO9kxgNmTS+/eE3MTRt85V9RdiPZD/VqZHluSO6Az88WRb4HMnGyYyB4jHPdEm6mwRPeno/CDnhd+e9yKLHiqmK/S3kMGnujDWtjolmjku5OozswoDzOTsq6upQ9/h/bxh7Obj9cv2zEURjCaPz0EtFNrAosaI+RyLoBl2r+xnpOEk9N2zWE5xe6nEKOoo7LZoq2yfltbX0P1BFzP9jzTx0lXJkuusrFETmPEDxE4LoO7K0POvgR6iyJGrtb12QkMRS3gb30jpuSJWxNsMQP23ax+FJzeGbVon9Dg8jQOJYJMl2P6w9FVq8MYT6vnQVAoPCvp+lEgz9QuRGw47xTI3MTC0xBkJdbRzPG9tIidJShrUug57dBqhgmKcJsEIbGrmaQ4P3ABdVhPkuipNwa4fdPRT3DEFv/GWg6UzmL4L4rPauPDaVq6uECSp7nJKDixfjbU/Yo2n1C53dcUntDHk9AGNdTyYm+cL9NR64FDlw4rlgRcMm4+Rlx+SCGSFhjXr9mkq/M0YJsZyDE3SADg3LbEa3CrXzk2fKoSJc+Y6mCfLOzaHD9BxrSHxuLhFLXqr3bc9oK70rbbcNmceBLXF0YPCmUVv1Vwmg/7N+E7Dzrmt6JbMIHQP19D/gdx8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(56012099003)(22082099003)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <426AD2AC335F7D449BB5BAC714075A8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 QqgTduAsPwUZ6Md5xfA5R9ycBd2YGedgTSNghGG9LN9DsRMR4K6cepfvtuft49hiQKsSBIyhykB2lLr99vKCO+9ExnfJkix+J5CWWi9eI4vHFCBZdm5i5J4iJgj3GEYpD4f7ia/9cMObX4AKnUirUT+V48Mq46LiyGjBBCoDp6zbWajq4foGqh1VISeObGZIr1KBbbEwKs0SblaP6vBp4M5TgkfCSR+1z9dRVnNQCE3kQhhUD9N3nMo/GAJuVw/lV7kVe545qo+6t/xaFaTEu1yyHibp5REFL39GY5h8I6MiLocKoBvRoOppz7V/SiAwIXD2rlutxz2arWTgUQ/+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed88e905-f657-4e29-429f-08deb800e645
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|7416014|82310400026|35042699022|376014|36860700016|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+Ac6BUxgATmmpqUiPC6q7+44K2P0hBlZqlnF8mVuixNpTdhwmdijG38GCUz2pfJPsUubJOZJQCmE1LBvaoHae58hZkYtOYohp9ioo2KHBF5dnNP4ppIKjQh350css2etErZbjc7/34fkpQZO1ke68Yc50juSjF0BcD0YZFc3yPhRBWomYbrgRt9DkSgEpYtUyOHuIPVp+Aj1JTWRyxYaNNsoRPrj0mDp1H5Ojk2wETTeTvwEARwVyyl8uYQmCYGveKXKbHgOBpWWVaaraEq+jz66bKa+0pexkZGTABo6de6P2KTm56vGJTRJPi+d3lMD0C6LBZLY6AC1jqkEz1CezHgw0b1f3m1ocfIm/bDceF9LvbTDYcU3B9CcAN2L//2u/3/H/6QkT5AtI77+flMZolLo7fNDuuDL2wQaRxOw8FTNVmRTyJsoacruV/ORSrvizHSHVwtwzefsje0h/j6saEMz5l0oHg1cmEcJypYa3tl4XE2NkUWxyg/ZXRUrwSxS6t2Lu8Qs3kW1g67gpXWzWNRx/lnquj01bYFe7BnKJwDwfLXL6augVOU1vV9pfZ9fUaflJDBE+n/nOVTYI0xwwntUN/tFnXrcbO6m1BdeuEOJXkqDyYTbqle8VDE06VUT+Xo1kHk8A8hVc/lFSL1CoOP1agL3evvGzwFH8r64Z9T82WZDvzLFP3gd7EbSIqU/OjUQ0JqG/WcpU/N1QcRSm4MruREHLrkD5uQ5ZjRIP1Q=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(7416014)(82310400026)(35042699022)(376014)(36860700016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9x9xsFTncYahUlgasbAV9/xixTxaqddzymmkSo5JnYIJ/MOSNcWIf20ls2Yl1epSELfLLSgo+AzZOnoNmUiG/gU43Prsrctmtr9sjxDo9sTF/Ah9C+KY6HCJ/GQ/eJ8jDiAaAVKx7sbffeS2uPEUj1HV6VR03o9hcBcrg3pSKjU0xrN1k9nxGAd53rK6x3v6qHZB52KCZrDIxOA8HKdGzRiigH4ke9TU39u4vr2dj7pQDICU6SO2SLJgLrif49o6dXmwXivw7iuiV4SQPhkaoG7ZyQWnkoSQjnGERPnK9QwgHqXqcoL7WpdXvwpYbikU4KhE/DBhqmFlWmurK9FBQ2YYSFbwa6up//mWrfo8FJpjUGUaZauiBDIstf5m38oPnLOOXDeeTS1RafzvOXf5KmO7fqAdizO6twlY2LLRNwPxqJbILpfJ+X97IJZ7TIPS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:52:59.7651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ec131b-fcc6-4c61-c42d-08deb8010dc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 12:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237546

T24gMTkgTWF5IDIwMjYsIGF0IDEyOjE3LCBNYXJrIEpvbmFzIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtYXJrLmpvbmFzPWRlLmJvc2NoLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gVGhhbmsgeW91IGZvciBsb29raW5nIGF0IGl0IGFuZCB5b3VyIGZlZWRiYWNrLiBX
ZSdsbCBoYXZlIGEgbG9vayBhdCBpdCBhbmQgZ2l2ZSBpdCBhIHRyeS4gU28gZmFyIHdlIGhhdmUg
emVybyBleHBlcmllbmNlIHdpdGggYXV0b2NvbmYuDQo+IA0KPiBJbiBjYXNlIHNvbWVib2R5IHdp
dGggYXV0b2NvbmYgZXhwZXJpZW5jZSBpcyByZWFkaW5nIGhlcmUgYW5kIHdvdWxkIGxpa2UgdG8g
Z2l2ZSBhIGhhbmQsIGhlbHAgaXMgd2VsY29tZS4NCg0KVGhlIGxvZ2ljIGhlcmUgaXMgdGhhdCBj
dXJsIGxvb2tzIGZvciBhIG1iZWR0bHMgc3ltYm9sIGluIGxpYm1iZWR0bHMuc28gb24gdGhlIGRl
ZmF1bHQgc2VhcmNoIHBhdGgsIGFuZCBpZiB0aGF0IGZhaWxzIHRoZW4gdHJpZXMgYWdhaW4gdXNp
bmcgdGhlIHBhdGggaXTigJlzIGJlZW4gZ2l2ZW4uIElmIHRoYXQgc3VjY2VlZHMgdGhlbiB0aGUg
cGF0aCBnZXRzIGRyb3BwZWQgaW50byB2YXJpb3VzIHBsYWNlcy4NCg0KVGhlIHByb2JsZW0gaXMg
dGhhdCB0aGUgZmlyc3Qgc3ltYm9sIGxvb2tlZCB1cCB3YXMgcmVtb3ZlZCBmcm9tIG1iZWR0bHMg
Zml2ZSB5ZWFycyBhZ28sIHNvIHRoYXQgd2lsbCBhbHdheXMgZmFpbC4gVGhlIHNhbWUgcGF0aCBp
cyB0aGVuIHVzZWQgZXhwbGljaXRseSBhbmQgdGhlIHNlYXJjaCBzdWNjZWVkcywgc28gdGhlIHN5
c3Jvb3QgZ2V0cyBkcm9wcGVkIGludG8gdmFyaW91cyBwbGFjZXMgZm9yIG5vIGdvb2QgcmVhc29u
Lg0KDQpQYXRjaCBpbmNvbWluZy4NCg0KUm9zcw==

