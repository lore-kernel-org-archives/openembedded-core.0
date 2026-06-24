Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB28BCDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:12:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5520.1782303163223550063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d+xgjjVY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d+xgjjVY;
 spf=pass (domain: arm.com, ip: 40.107.159.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qzDdT50hOEZrI5fW3XjUg4fCaYAgxqK2WYW8fAWLoMZsxM30KKLpxUyiyLyKVhlqt9VXUoU6pLVCfcXGCrsAkjPGNtIpzIiJkFAFhOo5pDl9u80xHUDp+NeF23f3F6imlCwer2fPgRBwRAAp7mDjJutm8NWkWYfHyviqOekqqWdV2Oic4AuiYRk2nT7zUxt6t0UQhuO4dzVTmxykmmDF1RsEBzo/G33PC0i1nyNyR5WL0TzCQ6FCMmF4cWeKq3TS13bUoZgrnp7OBRYJn8nOCu1e0UEDFG1MvMC/DmVvIVGMRRu8ndNRA/B5jzGRXmJxgqf5XNCa9t0qD0o9BRKJVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l+Z4vX+y5IaSihunpSj5xHKw5FgEy6MtxrI1EbZG8o=;
 b=C+yExtaPCZ8YFzeIaOzlWSkjbFF5BNdjIDCgIsVT0pdvUOorP/ouEoKSdGI+6GwQaKrUtvL9CejBXnmehoyMOLkoe6M9zeecErYJGv8ypdHqzkX7DfcOfoCPYN3sgpXUylheu/jdJT1Nkfww5sg1z8sopBAn/IpW3CYJNTPwXF7Pp3c49vyD8W6jqxRjjCQ07L5wjKd1pb78HiYJ/vM40treYfUV76BnuuVonhdEccfh15l6duIvrhJJlUWI6IB6fpJBx4MiDPTX65ADBNDr1x7ukEIlJEzZMfN1ZxvvzVDrJ6ToXAKcFt+ECmsqagSLcpWKJmFCwKr7nd8DK/W8+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l+Z4vX+y5IaSihunpSj5xHKw5FgEy6MtxrI1EbZG8o=;
 b=d+xgjjVYH8sOE2aMyH5FXsTDw+xnkAEEt0qAdQ5VEprfhGrkWKP3iLqwjVOOpGK8K16xoYate4xGx3gkyJdqgsBtDgNI0K1Gv//Ov9s1GA97++b0IubGBeUMwQmcnlkIkEU48Dftvdjk5YbaWoTuW/rvGlSpo9vu/EI7xLXZ/dw=
Received: from CWLP123CA0100.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::16)
 by AS8PR08MB8224.eurprd08.prod.outlook.com (2603:10a6:20b:52b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 12:12:36 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::63) by CWLP123CA0100.outlook.office365.com
 (2603:10a6:401:5f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 12:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 12:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXjwod0z7tG8hMSgv0BDHCw2rgI5hTUT4OGx4Yl2AMBEeeBMZ5Mv+SRKWkhSVOXXBpxMP6Jev4P7t6Hmos1wGHnwNwVFTw6SBGk5Wmd8f9ib4zeOCsHeO84So0LdAEor56+e78pKNAikMkqX+U944ymL2TDOjwf81i7rpbUfhnADDOCxgm4jaq+hstmUJn6vZZtQ2lGyUwqG7owsGFRpRikkPJv1yHJtScsHk2dDs7BneCJfkm1oIJE8l+GMInl8FlyPhTI9B4nhHURpMLsa+clBwlhFK4Q/xY9G8V7P/0lf48Kfta9Jd8q6UaySkk4yfYnsMbjhiITlOvFEqYSA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l+Z4vX+y5IaSihunpSj5xHKw5FgEy6MtxrI1EbZG8o=;
 b=ZlDZ7FzpFRYJwcX7M/KXU+YxReUPdTLPoh9iC7oBfo1J/SXOg+rAE0T+kzCz7Les1aQtB7nyCk438a9mdL0kEdU53g1DkKyOpLkMMxTn1MA8eeCfh0jaGz6cmGePg3nw8zM+6npjQSXcToRNx2qRhetU3244eSYS7WE+fDEq93fmo+0c99GJ5VGTcZKRDOCn+FG0XnDy7B1F+Y8ctHhjMjPs4hT1jckn4P73B7rfH7Vk/4xBPPo2FmXKytP4o1LpAemMCBfAXqaSciXXKRlMuEPm5BOxkwYGaL7HRI+zV+hPVwHuZJhTDISscYfTkVO3PhHSOcCwQey60Cxd+HR1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l+Z4vX+y5IaSihunpSj5xHKw5FgEy6MtxrI1EbZG8o=;
 b=d+xgjjVYH8sOE2aMyH5FXsTDw+xnkAEEt0qAdQ5VEprfhGrkWKP3iLqwjVOOpGK8K16xoYate4xGx3gkyJdqgsBtDgNI0K1Gv//Ov9s1GA97++b0IubGBeUMwQmcnlkIkEU48Dftvdjk5YbaWoTuW/rvGlSpo9vu/EI7xLXZ/dw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU5PR08MB10579.eurprd08.prod.outlook.com (2603:10a6:10:517::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 12:11:33 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 12:11:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] muon, an alternative to meson
Thread-Topic: [OE-core] muon, an alternative to meson
Thread-Index: AQHdA8mgxuNNsud2JUmNfuTRVou0fLZNjvWAgAAOnYA=
Date: Wed, 24 Jun 2026 12:11:33 +0000
Message-ID: <715B5646-994C-4344-A7B9-8EEDD1B711E9@arm.com>
References: <D146E22D-7BC9-441E-A835-163CF509D8A3@arm.com>
 <8a1b467a-f648-4142-b07b-4dc6d239bbbb@bootlin.com>
In-Reply-To: <8a1b467a-f648-4142-b07b-4dc6d239bbbb@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU5PR08MB10579:EE_|AMS1EPF00000049:EE_|AS8PR08MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 479802ec-e06d-4e36-5c92-08ded1e9e0f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|38070700021|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 YwPDAp3idL0gBg+CXJ79nNbTjfOQGXr39zTW/+7RrKM7SzNYIUb6A3XjQvDigNiy2NF0fjtk35IVU7oGxDLI6JqJDSeXF+nfxhJxXp3iZv1BpbGh1SZ4KZlCKd1mQdNT5cMGkJDsOYUyzQ6KNeOWeq1qzxefPn7vSXf5uon3oJGIM60PLGbgmOphKNrR0+sn5kv6HftWpVeo7AsSRVrFWSPCG7PiP40jSx3kyCH2aeFLtVMMQVlfT1pty89sdRzsFwjv+BGFrGZZa7YFsHfRGHK5qYIwnfLfWOjfsSz/W6eK7ULyCEPgGGEQkvfxJre7aZ7k7iqrZLxpSgnY7PNFYz6TsWYoq5GwjTz1cHN7Ldq2SS+ngcYf5kV8Zm0ynlUoSmb2YWtpgZomvGPoSoOgiC9I7BanBDxAvU4lCRQ84eTKitCcTkOIGO9CKAAvM72xXyKGUBhMas/Xs8I2zt6bj7u/8iyOfaj+JSw+IEm37hLoj1mFClyRxNaOa0qODJp3w08i1rPF0vwqJ4Nj0QG4ry1kz/irp0VBhQ4C3ZuElk9dfpLDK+agEP3rJ4NtnHPuqXSvBVcJ8pHkc5MrEDrETZZksLWS61o2VlELDAW/Ncz5aZC2FWMQiFC0XrgQm9izE17IV4NAWhwvSeUs6tnZ1ekYlPbnKtO9wwSy3f3lUyDd8dNYovteujbhjUJcDE2M8xwx2iBU3CE+qTl559nONRRjqUFQb06Zhwt/kFPaw7g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBD22926DA51FC46AABFF180BDA07E27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 VyBwuajlD7NsusawTYfH3kuu4rB36vNW6ORX/ZaMkFUnyf4u6X64AZoiXa8CiwyF1Jc6v9HoYWloUadZFJRxhDysjjtpFpKMJN3c+Wq4bpCV8Irr2EigbmGiivLEn4bKdsUyLHOnUEvs1vGVI3HHFAPK0X1TXUI0ZIe87U1BpVGnYNFg4y8kJAIeqqD4ZnOp5v9qRSBC9T4XAig+Vt9SWBWDYV+Nola1mHHQIDOiGyXN8FGv3FzdlrJE8r0bHS50CON2SA4LVYww4i0z+cqPcFFI7RCEeOOoP1QVJ3+yXEmbQ4M3IRkRFKotoJtcy/pmtAN6UFPC9Bywf31v5IqOew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10579
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17d1dbd6-143d-4052-65a1-08ded1e9bb75
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|14060799003|35042699022|1800799024|82310400026|376014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zFAJKdNh6aGmzM8Q7apohbtxfc/WhalJdmSMHwGJNqmZRh/jItQ/1ygbTGlVuwWj7tncIAOReb3UO9iBtqhInp5V7KDhA+allXFRcyjF+uhsT+JWlT45i8Dcu7aVomJuRcxv0Qu1tdU7ZNMP2GqIQn2hfjvNeYBdYcMwW4J6KNyx4zc2zJfKAAKoqkGXZCnfiqfqiWhuTy0eKOoDbgB/jV0kKR9yE7VA+AkrSNj89hyzk63nlof9Kt60sblPZr3ees9rCf9ewA8eKqOSGv89aPMvIV2/F2dwhHf8IEwSpHkhphGy56SC1CRqUEipc9oV/+YQt6qNL0jWexYxnQLKMb0ORVjRdd3dEBSjcMYIxBGemUlQXRa5PX41t1JsyUgKAPQK6i65cpafGLZAzF9q/JAfY5AtrSvd/LqFyW8eqIpYxKfoM1/mPclhlcvVOyGJgEfG6E35Q0nLWzms9xX0UhtFHjkecZXC/kWbZcRIyyC+IkIjwDi5lW57FogNlzb2ysY6irYKeefXKOh+OQyvOadWQFqAs92DhsXfXbT0LGcjPG+E9xKG3Vj032Uhq4F55QKYbwbO4fHDdn79vMsvN46xsPBcLQCY0UhJhGiQ02ozS0MMCT/B0R4IOEGDWk2EEi19RMj2m2GY/JLyvQZe+9IEPN8woo+FGBcSElejnb+yxyzykOch3hrbEYYAThR5x6qG8fZ9EBmBD3AZT/hcMA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(14060799003)(35042699022)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WePlMWyqI7otDsTtBjZGzz7sx1+YaFiZPOzPWPue5RO6ijFoWt8horgBF1R+Q6lWfybNcdpPy8Bv/NVVdNVYOumszfYCD9jyHoVbA4SvCueD9vd1vQvzpC/AKHNJ/6uFXED1LdF3CMaOHbmuRnSfq0NG2tiEC5ZjoShG2Ry73XslQGxAQIxLwp/1eoq6bW/HgdjRzqXXsfJY37Sx+Vi3gDdYQmhRNS9LU9Hfo12KA6mFrRL19Pt8ZwsQfJgWr/wseBv4/4mZ6ukXRSgf3s5ij1TLZV4nLLgahXHG6IJkMqIPnHuD2FZJCVAFBT3jUpTx0AjuNf/BYVbAvBKZvKkaFmaHv/tpsjzlMYgUatc9eZn9iN1RSOWRTCP0ZjiMJaISR8Psoj8Ip3KtbCtA6mI0KV0mcmf6123NvfCymeWXIgZEiSHKXUNTQZs43xdOK9rn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:12:36.4533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479802ec-e06d-4e36-5c92-08ded1e9e0f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8224
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239492

T24gMjQgSnVuIDIwMjYsIGF0IDEyOjE5LCBKb2FvIE1hcmNvcyBDb3N0YSA8am9hb21hcmNvcy5j
b3N0YUBib290bGluLmNvbT4gd3JvdGU6DQo+IEknZCBsaWtlIHRvIHRyeSBpdCBvdXQsIGlmIHlv
dSBjYW4gc2hhcmUgdGhlIHJlY2lwZSB5b3Ugd3JvdGUuIFRoYW5rcyENCg0Kb3BlbmVtYmVkZGVk
LWNvcmUtY29udHJpYiwgYnJhbmNoIHJvc3Mvd2lwL211b24uDQoNCm11b24tbmF0aXZlIGJvb3Rz
dHJhcHMgaXRzZWxmIGZpbmUsIGJ1dCB0aGVyZeKAmXMgbm8gc3VwcG9ydCBmb3IgYnVpbGRpbmcg
dGFyZ2V0IG11b24geWV0LiAgSXQgYWxzbyBjcmVhdGVzIGEgbWVzb24gc3ltbGluayB0byBlbnRl
ciB0aGUgY29tcGF0aWJpbGl0eSBtb2RlIGFuZCBiZSBhbiBlYXN5IHN3YXAuDQoNCknigJl2ZSBh
bHNvIGNoYW5nZWQgdGhlIG1lc29uLW5hdGl2ZS0+bXVvbi1uYXRpdmUgZGVwZW5kZW5jaWVzIGlu
IHRoZSBtZXNvbiBjbGFzcyBidXQgZXZlcnl0aGluZyBpdCB0cmllcyB0byBidWlsZCBmYWlscyB3
aXRoIHRoZSBzYW1lIGVycm9yOg0KDQogIG1lc29uLnNldF9vcHRpb24oY19hcmdzLCBb4oCYLWlz
eXN0ZW3igKYvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlJywgJy1PMicsICctcGlw
ZeKAmV0pDQogIG1lc29uLm5hdGl2ZS10cmFuc2xhdGVkOjIwOjE4OiBlcnJvciB1bmRlZmluZWQg
dmFyaWFibGUNCg0KU28gZmlndXJpbmcgb3V0IHdoeSBpdCBkb2VzIHRoYXQgaXMgdGhlIG5leHQg
c3RlcC4gIEnigJl2ZSBhc2tlZCB0aGlzIG9uICNtdW9uIGJ1dCBubyByZXBseSB5ZXQuDQoNClJv
c3M=

