Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BE3C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:18:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34741.1786382314965136665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VQfJdBSC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VQfJdBSC;
 spf=pass (domain: arm.com, ip: 40.107.130.30, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i1qroCZctzkM+zh9haKKHFrYnRu/80hPjLmyhe3j39tBvLpYaqQ8K+LuBR9OXSrVgNz4KQA4KBIlpHDzceG1fAlEf43nYcVI1cji1d791u9xmh7wrbJgxH4xvlFfwhFJ7IxO9ZE4YXpRqK+IP9mGarQWmJzR5CpKTnW91rGaIzZ6cc7sOC+RKLi25ByRaZyK8r73AfUm+o23NpQEHOZGa0a9SrDp8TJs0oP16o94zejPzWozA/fk494VuaWEdTz5KbgJKm9HR4PPLFhJcq78gnw773nhoWGSMkWgahkz9Zky3uIxtO3wQBFHdMG0aemr+Zq6bCAgi2WrSR1c2T5mAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6o6V8Z8lQDQP2OIRduSwXzQKzIfaBSk3kHIHPr9lB8=;
 b=BPm8Y45/qHlF3RT4JKIK4mJ6/Ru6hbrGqofKNEuFtOl+RutSc6Y5xR8wOmn1mxRr9ra2XiG8iHfhcoBleUOqs4YTRuBHUuOQznouwz6NvenwmDhHGzYpYKshAzSvXPhVCyuuWaQDykFJsZwUHNTisgR348QNrby9LhZ06VbeJ3NYGKK/mep+AC9q+L9dVVL+ooZwL3I8vP/PpnFVViJF0vXmX5U3ygc04QITUMmWRIluQXXw8IA/l3XQ/pSO66GBAIauzr1iqHh+snN41pVmt3vOtYZXTTMryp8tGdRnCTNuCKRknsGKKw7MWD2XFs2e3Cz6rE+uu9c9k+Xq8/4iBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6o6V8Z8lQDQP2OIRduSwXzQKzIfaBSk3kHIHPr9lB8=;
 b=VQfJdBSCo+kCSeBjs8Vj6yCveO+Liy7W8b1ZZt3LloZh8UoLCuhu9scKkZsquZEGDBxl0OC9ZfI8i1I0E5VZsR/VTwuH4Mt32wG/xyMBtRgqs8gkehrnRH3Uq5X3QXNkV3hT9iErF1xeL/CH3PVjH+vX+cAUMWR6DQ4DftY7N74=
Received: from DUZPR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::21) by DB9PR08MB8292.eurprd08.prod.outlook.com
 (2603:10a6:10:3dc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:18:28 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::7f) by DUZPR01CA0157.outlook.office365.com
 (2603:10a6:10:4bd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 10 Aug 2026 17:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwBWPPHGUhr/AXuvwkz10ZgtZdAw0OsUrgul253gKUvjoWozNs4F66aGm/54bnAuOy46iPi7wJCTVZOmBJHFwhpQMySXm9pkHfuc9EmPjqXquWggpWax8WhfGZM9BES4nOhfWQ9o36hf9Z1prSYUgTx6lr0NPm4x6zjYzUl+7D46SjeK3p2uKS/GVcOzrAsbRBuk74EucuzUwKARFfQzDDxGm9LPLjxJXaXNMEybQy+FNPTr1DcRpOeiFps37K7h8PwBo3XsDRaPivSbzaOabaLkt/UVv4wrR2Vp99E9RZTkXJHbuV9sEUswl7mRo9daqOyt1LklOSgThxfo2S3WdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6o6V8Z8lQDQP2OIRduSwXzQKzIfaBSk3kHIHPr9lB8=;
 b=TAnPz+4uL7nKO3vQYEYY7Vf4/bbuFPDqDWN6/uTOecdC5H93/pPJtoEjOAQqRCmTYoBsUOycZFldvSkztEAKwzhdMQRDq5nVN6Tek3RmJir4utCYiSyCJuNJmm595pImxl3Px8lh3qjBQ3Oi67PxVk0hnFp18UfQaGn6MfpL/g79MsbG093eYbYGZ22/dmrPPO0DoJ2QHKfOJpaGzbF0hMugyGB0DjT41jCUspyR/Emo0UPslgeOrMZUJ2f2aURTL7BF8lSZJxmF2eA8TSVu8EzwyUB37gcK8AOtAGd9PQIX/wDl8emD+hbQCXNSox7sM/4Ct/qFWlxTu3q5Fljpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6o6V8Z8lQDQP2OIRduSwXzQKzIfaBSk3kHIHPr9lB8=;
 b=VQfJdBSCo+kCSeBjs8Vj6yCveO+Liy7W8b1ZZt3LloZh8UoLCuhu9scKkZsquZEGDBxl0OC9ZfI8i1I0E5VZsR/VTwuH4Mt32wG/xyMBtRgqs8gkehrnRH3Uq5X3QXNkV3hT9iErF1xeL/CH3PVjH+vX+cAUMWR6DQ4DftY7N74=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM8PR08MB6434.eurprd08.prod.outlook.com (2603:10a6:20b:369::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:17:56 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 17:17:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
Thread-Topic: [OE-core] [PATCH v4 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
Thread-Index: AQHdJi/sX6Qi0X1ly02hKBqSNPO78baXi/GA
Date: Mon, 10 Aug 2026 17:17:55 +0000
Message-ID: <D24B918A-2A40-4662-B02B-128B48766EFC@arm.com>
References: <20260807054448.1301957-1-zboszor@gmail.com>
 <20260807054448.1301957-2-zboszor@gmail.com>
In-Reply-To: <20260807054448.1301957-2-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM8PR08MB6434:EE_|DB1PEPF00039233:EE_|DB9PR08MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 213fc63c-2a4f-4e5b-e8a3-08def7036517
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|23010399003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|5023799004|6133799003|3023799007|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 zySBlRR91ZZyH51X695tXiDifEGLevUkOkHPbREIUawc/voi4WnKEYQGjP1wVT6jREHFJCc7QWC1wBcD/8EWDyphLZdd0IUi7mVlXYYoVQM3Z00o+Im8aDwYblB0clWwwao77dHp3yW8ZcSahn7geYzK97io38SdBplX9ph2p6BUppOZOGQ22+Ve3VGyELsPyZUMkM6zreakNzFeUlK4TFF6CTcOjPh2xq0ArWuZgDl/WsKnNPmJqTXQhalRsq0gQvh6GQ92tmuw+0sxBPLMkMuOffEWHqGEEM5P1qiJoTcXY0m+t1dfRCw7wId97v9KnEcp87M9tCh9wKL4dPW8yH4OhFXHFnp1p0yvv/O7R1ePgrz7s8VSzep/kwt6PN3Q9M0/2JaxV78mMoGmouH7dTalXXNxBK6iLTzElkht1BGPlenPqLjldmVbDgz3fGGoiaBi7NJx/L+kNAwv/XiOSyHTUduicJXpphl5fhsgWqaZoem7x+0Nbte4Ka1tC4anmJLy29Zi779f9HTl4SHIec8k28IyFg8Kc+NrPTpYVJGR9gV/2DJC3XcY/wHj3HP6chQVvXYYqFFX2rinpyy4JvM5qAmG3uWTMMS9tvQ59V0p9cdLjXA61JYUx4VvKHHH3JSSgjUsHh8+aZ84LJLH70LQaZ5pdx54n1kegJ7heppZnqcJ4ioe8l6nbM5myH7XJ1m8WuaRXIKlnjYTanftYWlhk/j/EGQUIHCnCZHYSzk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <94BBAB3123A6394C8A1C1059E136B0C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 j3WEl1lVLnwssS3J2JOP49SwyUsZ9+bUFKp2yjceBs/Vpb7rJbYlADlYHHIrAaf1LnI044P21YlcqlYlKxuMzI/LJThnpRhanbDPvAHxkINrGNiosuh1cpd7Jm4R5Fh4LRwlzVhvJL7eHXeVV1B8IqX50JQ0vye2uD1dAGcMk5Rj4PU+6Pxd/Qf0CkUxcdVskFpHRy2V24O6dk8IkWeyMbJc4xAClnmvTnuXLi/25S+TUrMsnDssWGnYzmiTpuRoayc1MNzQW4oylan+tBENc0xV0OnuH97maZw3OeYlFjUKnS5xWZjhuqRRRCc42EL3oQxz3jdm5geh4ZJKO2VPaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6434
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6da86dd8-5599-4193-96bd-08def703519e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|23010399003|376014|1800799024|82310400026|4022899009|13003099007|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	VTyiTZ2FhsPsd7C7vO6rDCHH/MR3FF+Au2XAuALtRs+7unhrJPHFY85TewfbO8i5rylhlQqkSZ4wqLZ9ctIituuwXRCyMN3NsVEjH2SqCpI9AQ14QtNixcKpCx938HzuuBAXZLL2hjWvav2eS1axvwO5jrQWSOce6qGAjw0nMDXglkdxK2r+wwng/u8dhlhheHav7DyqXRqmaWhdDSLzUVp4ItWKXksR5FqrILt8lR6D4Zw8kvnYaGSxLQoCPOsAgSOR9oBAejS80CsiDdXX/CmmyHWe80YEgaVxvx4hFVsivvrKuLtdUkf4hpCCUnCp2sHX6ymYo48krICUGeNZQy/oc7S2gso/tb3GIpdEj770ZisDDOagCewrdyOe305xmtAIgRcFc9iGPDZ4mlBVXApetemKpxt0CZhxzkeDSa2wOi3GzRZPlPVI9nHyHeKY7ljAoSw2D3LYpaSbO7h4/IhJSVbWGqo22hWeJXqqURCUo/QpUUc7cft2Og4kslwtWwRk5O46B5Q1R/cMLtX4a3G5QL0nreUDltyzNopryG7cFaubIQhOR2XIFHJGHOzwWtf9Ke8dMyrB2Lrpf1uV7IBQNqHzh2ze9YZYpJn2LCExpXXQFPRWQZkZ/bB39BpFVYR+xgydL5pSH7r0O7Wze0YKn/dkM0hlRa1Su14AAMPwmpJ/9o7cLXaXS2/SNLnJnkjk5NPQbJWoG0St+JjDyg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(23010399003)(376014)(1800799024)(82310400026)(4022899009)(13003099007)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+21rfupzHTLRBpAGhxqSGUbzQApnEc3OooMILeVfuQt8SA1PI9slqPtZ6/FqHi2VlxZb6ejf/fcoRW7Pl2fOzV/rqI59+ZOyjb5x0SghsD72SNQUnGpVdX1MVD6vEQ4PHzsAOubutHnprs6AvTXg086tSdPx/5yTDDrMKxO/GzhRTQ3S/4abHSjT0W+5O26u87ojXNm2KMZ9wD80RdZyUgJ039hd5NYFQGBr44ITYs3RnPX+4uKoPrwvUdDyb5SMEovoaY1fbgDNLjp/kpFxOmTCf4C5s8VfISwZfv61LLI+XQAcFdaeAUfobbOkax9+oHg6JerUNPURzv0xsrI6qfqcSNJ7zKqh/vKBMScfGgj6j+7XOj0aOq3WRkA7xsysHRXlBC2v1Lxf+wCqvBXMg58D32kGc5/xfoXuBdZCSQ3FxRAIpMTmOyF81WI8aCFd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:18:28.5560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 213fc63c-2a4f-4e5b-e8a3-08def7036517
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243137

SGkgWm9sdGFuLA0KDQpJ4oCZdmUgc2tpbW1lZCB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUgTVIgdGhh
dCBjcmVhdGVkIHRoaXMgYW5kIGFtIHdvbmRlcmluZyBpZiB0aGlzIHNlcmllcyBzaG91bGQgYWxz
byBpbmNsdWRlIOKAnGxpYmNsYzogcmVtb3Zl4oCdLiAgTm90aGluZyBlbHNlIGluIHRoZSBsYXll
ciBpbmRleCB1c2VzIGxpYmNsYyBidXQgbWVzYSwgYW5kIHdlIGRvbuKAmXQgd2FudCByZWNpcGVz
IGluIGNvcmUgdGhhdCBuZXZlciBnZXQgYnVpbHQuDQoNClJvc3MNCg0KPiBPbiA3IEF1ZyAyMDI2
LCBhdCAwNjo0NCwgWm9sdGFuIEJvc3pvcm1lbnlpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDx6Ym9zem9yPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+
IFNlZSB0aGUgcmVhc29uaW5nIGFuZCBkaXNjdXNzaW9uIGF0DQo+IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80MzAyMA0KPiB3aGljaCB3
YXMgbWVyZ2VkIGFuZCBiYWNrcG9ydGVkIHRvIDI2LjIuMC4NCj4gDQo+IFRMO0RSOiBMTFZNIGNv
bnN0YW50bHkgaW50cm9kdWNlcyBicmVha2luZyBjaGFuZ2VzIHRoYXQgY2F1c2UNCj4gcmVncmVz
c2lvbnMgZm9yIHJ1bm5pbmcgT3BlbkNMIENUUyB3aXRoIFJ1c3RpY2wgYW5kIGZpbmFsbHkNCj4g
S2Fyb2wgSGVyYnN0IGhhZCBlbm91Z2guDQo+IA0KPiBUaGlzIGZvcmsgaXMgZnJvbSB0aGUgTExW
TSAyMiB2ZXJzaW9uIG9mIGxpYmNsYyBhbmQgY29udGFpbnMgdGhlDQo+IG5lY2Vzc2FyeSBmaXhl
cyB0byBtYWtlIFJ1c3RpY2wgcGFzcyBPcGVuQ0wgQ1RTLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+IC0tLQ0KPiBtZXRh
L2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jICAgICAgfCAgMSArDQo+IC4uLi9t
ZXNhL21lc2EtbGliY2xjXzIyLjEuOC4zLmJiICAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysr
KysrKysrKysNCj4gMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLWxpYmNsY18yMi4xLjgu
My5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFp
bmVycy5pbmMgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jDQo+IGlu
ZGV4IGM1YjcwMWMyNDQuLmZlY2NmMjljZTQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY29uZi9kaXN0
cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMNCj4gKysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNs
dWRlL21haW50YWluZXJzLmluYw0KPiBAQCAtNTI0LDYgKzUyNCw3IEBAIFJFQ0lQRV9NQUlOVEFJ
TkVSOnBuLW1lbnUtY2FjaGUgPSAiUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ig0K
PiBSRUNJUEVfTUFJTlRBSU5FUjpwbi1tZXNhID0gIlVuYXNzaWduZWQgPHVuYXNzaWduZWRAeW9j
dG9wcm9qZWN0Lm9yZz4iDQo+IFJFQ0lQRV9NQUlOVEFJTkVSOnBuLW1lc2EtZGVtb3MgPSAiVW5h
c3NpZ25lZCA8dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gUkVDSVBFX01BSU5UQUlO
RVI6cG4tbWVzYS1nbCA9ICJVbmFzc2lnbmVkIDx1bmFzc2lnbmVkQHlvY3RvcHJvamVjdC5vcmc+
Ig0KPiArUkVDSVBFX01BSU5UQUlORVI6cG4tbWVzYS1saWJjbGMgPSAiWm9sdMOhbiBCw7ZzesO2
cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+Ig0KPiBSRUNJUEVfTUFJTlRBSU5FUjpwbi1tZXNh
LXRvb2xzLW5hdGl2ZSA9ICJVbmFzc2lnbmVkIDx1bmFzc2lnbmVkQHlvY3RvcHJvamVjdC5vcmc+
Ig0KPiBSRUNJUEVfTUFJTlRBSU5FUjpwbi1tZXNvbiA9ICJUcmV2b3IgR2FtYmxpbiA8dGdhbWJs
aW5AYmF5bGlicmUuY29tPiINCj4gUkVDSVBFX01BSU5UQUlORVI6cG4tbWV0YS1lbnZpcm9ubWVu
dC0ke01BQ0hJTkV9ID0gIlJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPiINCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EtbGliY2xjXzIyLjEuOC4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1s
aWJjbGNfMjIuMS44LjMuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMC4uYzkzYjViOWQ5ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EtbGliY2xjXzIyLjEuOC4zLmJiDQo+IEBAIC0wLDAgKzEsMjYgQEAN
Cj4gK1NVTU1BUlkgPSAiTWVzYSBmb3JrIG9mIGxpYmNsYzogSW1wbGVtZW50YXRpb24gb2YgdGhl
IGxpYnJhcnkgcmVxdWlyZW1lbnRzIG9mIHRoZSBPcGVuQ0wgQyBwcm9ncmFtbWluZyBsYW5ndWFn
ZS4iDQo+ICtIT01FUEFHRSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcva2Fyb2xo
ZXJic3QvbWVzYS1saWJjbGMvIg0KPiArU0VDVElPTiA9ICJkZXZlbCINCj4gK0xJQ0VOU0UgPSAi
QXBhY2hlLTIuMC13aXRoLUxMVk0tZXhjZXB0aW9uIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS5UWFQ7bWQ1PTdjYzc5NWY2Y2JiMmQ4MDFkODQzMzZiODNjODAxN2RiIg0K
PiArDQo+ICtTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcva2Fyb2xoZXJi
c3QvbWVzYS1saWJjbGMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1sbHZtXzIyIg0KPiArDQo+
ICtTUkNSRVYgPSAiODdmNjYwMDcyNDJmZjEwZTllODRiZjMyYmU4NGY5MDU3ZjZhYmM3NSINCj4g
Kw0KPiAraW5oZXJpdCBjbWFrZSBwa2djb25maWcNCj4gKw0KPiArIyBEZXBlbmQgZXhwbGljaXRs
eSBvbiBjbGFuZy1uYXRpdmUgaW5zdGVhZCBvZiB1c2luZyBUT09MQ0hBSU4gYXMgdGhlIGJ1aWxk
DQo+ICsjIG9iamVjdHMgZnJvbSB0aGlzIHJlY2lwZSBhcmUgYnVpbGQgZXhwbGljaXRseSB1c2lu
ZyBjbGFuZyBmb3IgR1BVIHRhcmdldHMuDQo+ICsjIFdlIGNvdWxkIElOSElCSVRfREVGQVVMVF9E
RVBTIHRvIGF2b2lkIGFueSBvdGhlciB0b29sY2hhaW4gYnV0IHRoZW4gd2UgbmVlZA0KPiArIyB0
byB3cmVzdGxlIENNYWtlIHRvIGNvbmZpZ3VyZSB3aXRob3V0IGEgdG9vbGNoYWluLg0KPiArREVQ
RU5EUyArPSAiY2xhbmctbmF0aXZlIHNwaXJ2LWxsdm0tdHJhbnNsYXRvci1uYXRpdmUiDQo+ICsN
Cj4gKyMgU2VtaWNvbG9uLXNlcGFyYXRlZCBsaXN0IG9mIHRhcmdldHMgdG8gYnVpbGQNCj4gK0xJ
QkNMQ19UQVJHRVRTID89ICJhbGwiDQo+ICsNCj4gK0VYVFJBX09FQ01BS0UgKz0gIi1ETElCQ0xD
X1RBUkdFVFNfVE9fQlVJTEQ9JyR7TElCQ0xDX1RBUkdFVFN9JyINCj4gKw0KPiArRklMRVM6JHtQ
Tn0gKz0gIiR7ZGF0YWRpcn0vbWVzYS1jbGMiDQo+ICsNCj4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0
aXZlIG5hdGl2ZXNkayINCj4gLS0gDQo+IDIuNTUuMA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0Mjk4Mik6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQyOTgyDQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEyMDYzODY1MS82
ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

