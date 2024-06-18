Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAD1C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 10:46:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web10.83541.1718707595124286795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 03:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gV8vVIFh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gV8vVIFh;
 spf=pass (domain: arm.com, ip: 40.107.8.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dWUvEPQodfS2D3i3ZRLPsisa6jOC73n0ZCKiQYXYt7gPK0/Wp0aPr04v6BQbxfZlf67TKHznWmBY09YCfJ/ZN3ZTLDmPEHamGgWjriD1Crgzyo5PLBAu+EN4P09eNANlxhkz98zjrLUDJCyv/fR06iIx+pSwLxZnLbqFdJjydb/eqFGgXwtjARDgvdcTp/thbWGACSFAXkQWYR+0ytoI8MDOfeUpxClQ9uzS8+QOzOM/IIb0ObfAPyjXbUvB2KHrj8v13ZjHmFReB6qGdMvsLllF2teQhSWMPHOX/GLIGyXJdfUSL3i7Lcs86Eb6cSKGqQcKqdKX9aFBuO2ejnY39Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTYAU8X1UjwdBGkJBnE1BRSpSBBqikhEu/Ac16K8nWg=;
 b=j6nRkzYiGEi7gIJrVT6oXp6I9WifqSnIK0SEQxxa93LK8TnXeaq/8Io1d2xSdqQeQqRv6zFnsExhfJlVmSPqKRZvao3TyngBiiwJfF18taXldOLTHRKp6okj8WKK1dqK+8oJ/V4wAnkSAP4O+NpMPdtJkObQ5PMw+sTmBIBqhphR+HR0n9q0aori4eiiEc6/v+lLPHiyNfNsn0+mP7fchZz1lDyKv9j+zHFbdicWDD+fIFWWJZqcxJA4zcpWRvRNQjECKp7aiIfP87EImRvbeyE76Mjy+BWDe74LJ6tKeIoYa17HIyJov+REXYDU5aeJSCabmjh8/L+Io0zAShR/kA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTYAU8X1UjwdBGkJBnE1BRSpSBBqikhEu/Ac16K8nWg=;
 b=gV8vVIFhxEhCK8mjgpUWTPeGVk1d4v1QVw4doX35sHzUnJH3JJriLkRpTY7U3MfJ7gNfuNVA7GgKXDov0Ikl1oTKNgNNn0tBXEW+2DhgY3XTgODXMikCVCHxVbaa6VW7Y0HSH/yScW3+f6c+c+L2ocV5dbIpZKiRf48K9cgFqqc=
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by AS2PR08MB9103.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 10:46:31 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:209:89:cafe::b2) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 10:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 18 Jun 2024 10:46:30 +0000
Received: ("Tessian outbound 01519d7ebfdb:v339"); Tue, 18 Jun 2024 10:46:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b771427543d2413e
X-CR-MTA-TID: 64aa7808
Received: from 1d015df4607c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7A23FEB-D44E-48A5-8479-7572406AEB08.1;
	Tue, 18 Jun 2024 10:46:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d015df4607c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jun 2024 10:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mee6fr8pEmvpXo6CGzDgP49BL7XPS4u62a2PYILLHgFtJlkBt8dVyR4KkLkwOom6EIDbrB01wkZfGswU2y1K/ug+BFzsE6baPvVI3mgXgfM1jTvD/hy3h5nUW3R/ySvknFTKsc00zV4zjptwF1nZ2JtSKv42CsjRNttpuCFI/XCOR4mqH8M2HtwgQi/8uUTFlwjXrviN/aX+rKYiyqJ5iVXBq9gTSOHugeGcYLDmV/oL3phHCIga13gtKofkhpf9gjGNdBmSMG2JnANjGMcZNFX4uOCCVQB3rRwYOlNtM2Nih55aEpGe27rL7utPN5AbyUVLksJULiwGXKfzqhxNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTYAU8X1UjwdBGkJBnE1BRSpSBBqikhEu/Ac16K8nWg=;
 b=Ele/sPqikhoexxsYem06gbCoX4DhxY0aV6a4TQTXuYrH9EpYpjwCjebgAukOPYZaqhwDi3JEdyd3RyygUF23JVGyqq6CIFg0XYTUcDlyZkTrnv2/FoJGhdcPSdcmWNeuO+Vj47P2zPkh0xzDKLzDxx1sYFMVJzKoe3U4xN2Kg0G6qljv++A0UlZ4bh27/N2tA24tpiCf458IUxylpaSVERnJd+hmnWKxDJCLiZwfCUn0l9PphdNHAuXAK5m49h6b8ssVQHv0qo+2NsCaFtskxtUV9l0v272++iYL1hA/8wx5N9TjiahoPUuc22ppq7rPfkjNnLZnp+u+EjeyGgJUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTYAU8X1UjwdBGkJBnE1BRSpSBBqikhEu/Ac16K8nWg=;
 b=gV8vVIFhxEhCK8mjgpUWTPeGVk1d4v1QVw4doX35sHzUnJH3JJriLkRpTY7U3MfJ7gNfuNVA7GgKXDov0Ikl1oTKNgNNn0tBXEW+2DhgY3XTgODXMikCVCHxVbaa6VW7Y0HSH/yScW3+f6c+c+L2ocV5dbIpZKiRf48K9cgFqqc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6572.eurprd08.prod.outlook.com (2603:10a6:10:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 10:46:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 10:46:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] expect-native: fix build with gcc-14
Thread-Topic: [OE-core] [PATCH] expect-native: fix build with gcc-14
Thread-Index: AQHavVmjmC0R3UJ3EEilS5Sl0YAaibHNXsIA
Date: Tue, 18 Jun 2024 10:46:20 +0000
Message-ID: <F8D42297-6378-4681-8520-AACA1F9E14C8@arm.com>
References: <20240613061859.3777324-1-changqing.li@windriver.com>
In-Reply-To: <20240613061859.3777324-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6572:EE_|AMS0EPF000001A3:EE_|AS2PR08MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: ad34173a-79a6-43e5-bfc3-08dc8f83e9c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Ti8vQ0xrczc0Yk9mZXovK0J0bitLenY3b0o1MjExYTMyUGhuRlAyc0srSm52?=
 =?utf-8?B?M2NISjRRL3c4V0J6d1JmNDRsbDhQb1Z1Y0FiNEh2cERmN3ZBY3A1aWEvODd3?=
 =?utf-8?B?bUY5dENoR0VwU1hrTTlZYVJhTnQwVlpPOTl3MGhjc2hvMmI0QVVNUGI4Y09C?=
 =?utf-8?B?eSt1QXZMV0E1dWV2VTdGbHQ4SEsvcWxEQ3lpdmRvZ3ZIeE1yaTZqMzZHYW9a?=
 =?utf-8?B?aWdNVlJyS1lFdWRja2YrTWtSYXRpZXVzeGxBQzZEeVdKZWRYRFJ3TDhTcmc5?=
 =?utf-8?B?WWpidCsreFowc205amZkU0RUTHpsbGtZNWt4Z1gxWkVQQ0JVakpaV2RpVnJI?=
 =?utf-8?B?SzFtTFJrUnhwQ0UwYkc5bUl1UjhPMG9FZTdFcU9qSU1rREgzUWhRUnM5cEow?=
 =?utf-8?B?VzBQM3hXYzhlNXQxTys1bHBlVjJrQlhYSXJFT1dIYmFObzZMdDZ3ckpZTmQy?=
 =?utf-8?B?SXRQU25zS3FWSURQWUY5ODB2Q2V4K2VRSHNWazl6UWgxaUtKS2RzT0VHZEhS?=
 =?utf-8?B?ck5MQ0lheWg5dldacVAyL0QyVXJXaFg5ZXgvSXR5QmhxaFYwcVdTM29hUWJN?=
 =?utf-8?B?ODMxR1djQTMrLy82NGRIbmJ4Wk1KbGxEanNKQ1d2VG53Uk1laVBLbzNpL09T?=
 =?utf-8?B?TlhXc3BoWExKdVVTZXgvK2dlQmk4Y0JxR05aUnEzV3lWZGhreU1ydU81MUJt?=
 =?utf-8?B?cW53TWUxQTNGSDRGMGFRbndwYzN2RUtpT2hMOW1HekFlSnhpTy9IZjREZXZp?=
 =?utf-8?B?emFpM3JRdytvS0RicE1uSklxc1Z0S2lEczZiMW1lT2l4WUYycXNsbXlpNktV?=
 =?utf-8?B?VVlHRDdpekdnb2NpZDZicHBLSkpzYWtyZ0tJL01pTjVpVGd4TGQzWUhPZU5O?=
 =?utf-8?B?VUNQM2J0cENnS2ljbkhtaS8zNXBDZ3dNWnppUWhkRk1xSkI3TXpFMTZLZjFD?=
 =?utf-8?B?YitYcVNxcnhxOWZGYnBiSG9BaElBc2owa2NscGtxZ3dBRkVHOHkwR2Z0U3Fz?=
 =?utf-8?B?NEx2SmJjZmFyWHB2akxzWmsvc2VCdnZkMDhGUkduTVVxMXl1VE1EWjRManEw?=
 =?utf-8?B?SjBuemhxRFFVM1ZWRFBPcm1FVVJuY3JSc1lTbTgyNWlEUkovaHFtalVvUmR4?=
 =?utf-8?B?alEvUzdZUHZMa3VSVjY4ek5YL1pGR2pwcHc4ZDVxU1Z1SVM4d2tpNU9Iby9G?=
 =?utf-8?B?SEZIOURXTWJybldHM1pWRDhxQjM2di94OFowSU5LWDY2ZGZ5Vzg4ck8wSWVS?=
 =?utf-8?B?Sk84b1VCQUpsTlBCNHloeldkTm9YbEoxTitmYVA3OGY0UFN4bU9oZDA2Uldq?=
 =?utf-8?B?OTMvQlA0TVpUUGt1a3JtcE1PTzdhVSszZHZVY1N4czFxNVIwa0lYQjZUUXlS?=
 =?utf-8?B?dE1SM1o2eDYrTTVqUVZuRlVwT3pLOHkxL0dGTUxYTDVHSUpXRU9QWmw2RFB1?=
 =?utf-8?B?SWxYKy9rZ04rZnkxZXpzTldTUkVOSEdzUjV2NzdrK2hiOWRJdTVxRUd0Wm5E?=
 =?utf-8?B?Zk5wTld0TDUwcS9NaTJCb1JDc2Z5TDRNZkZvMEF0cXVuYWR0cjV5MVpJTHpj?=
 =?utf-8?B?VXFqejRpaFNpbWhQd2E1WkQxK21wR29mU21PNFdCYUtvTmlIcllhMEVlNnV0?=
 =?utf-8?B?VW9RQzVkaXFvYUxDcHpGejhpU1EzQ1YvY0ZMcE5Na0xDSUFEaWNkem95dC9Y?=
 =?utf-8?B?QURCSVhFMlUwYW8zZWFkeTY5VWJyMXd4Ujl1WW95TEJXSHFpSTZVU1NPRzBm?=
 =?utf-8?B?K3hPM1NWYTJLeU92d0tuUUkwWHEwNGlCRlRvYTdQWGtjZW1EcFRGZlNxVHhn?=
 =?utf-8?Q?qHTBMco0XcRQYT1LFtsY9UT/+66HXI06ccivk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <429F697B8615F54196BE8020765DF61C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6572
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8d0be513-b1a3-4253-5ba6-08dc8f83e40e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|34020700013|82310400023|35042699019|376011|36860700010|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEtJb2wxSWxkNWN6M21nbXpvK0NFVjhpODVjQkNYSndYeHcwMjNYbi8wemhH?=
 =?utf-8?B?U2pHdlA0NVFOcWcwbUNLZ0ZPLzg4SXNzZUdvUGpHcW5OZU5MVUpFYkpOSFQ4?=
 =?utf-8?B?blZSNk5RUjg5M25GWm1OcXpGcGhaNFVxMWpBMktzdFJNeXNGSTRPQXJqUmha?=
 =?utf-8?B?TFhVK1Q3dC93dFlCSGtYZ3IwWHJzVWphWUVhY1IrV0puQnZBMGdBUUJyeEc1?=
 =?utf-8?B?Y2ZOV0dpWFdSUnRVWmZaOGN4bnVJTnZGRDFEeHhpNzkzYTNyeEQwRGlaUVIx?=
 =?utf-8?B?Rm9DM1FraDE4Y2UrSCtFZzl1dkRWUkNEc2J6b1g1ZnRSbjM1OWgrNUpsZWJY?=
 =?utf-8?B?SXJiOHp2QWdoY09HRlNDN3FUOXVVamlKUGowRWx5K2dSTmVoajVRYUF4ajd6?=
 =?utf-8?B?RzZheG5CSUN3L3hNbkxJdGNKaEZ2K056YURadjVIWlRKVndMbGJSUWx4RDZn?=
 =?utf-8?B?azRDZmFWdEtUaVBORlN1TnNqZjcyRmRhbTdnT0htdTRTbC9HNVdYTFdCSHA4?=
 =?utf-8?B?TlpWMDBkR0lsM3RLekROZWhpMit6KzZ6R1ZyWWgrNFpWbmVkalZaM1JHOC9X?=
 =?utf-8?B?QXk4cHc0QWN1eGFKS1VsczFCVWpUVlZhbkkyTEVMZW5YWEc4c0RJZ0EwODRy?=
 =?utf-8?B?NkVXMVdDSXNmNktYblAvOHYwemZmWVhLeU42disydFdLcTlCQ25FRTZzUXlK?=
 =?utf-8?B?cE9rTU5qOTVaQWdKK3I5dVllekxqdEw2dEF0eEZJVGhwVTlRaFhQY01ZR1NS?=
 =?utf-8?B?MWhHenQ0WU9hMGZhM2I1RHNiYXBaVkR2NDZ4OHZhSXZXU1FZbi9PVkx0WDAw?=
 =?utf-8?B?d3lnUGRycFdMMTZ5WWRlaHdhR0J5Vll0UllRVnRxbU1GaUlsbHBWUTd5QlY1?=
 =?utf-8?B?Q0V0WlZseVRocTY4emoxemVkY2N6L3RsbFBWNm5VY1BISDhaSEVaaDNSRTN1?=
 =?utf-8?B?dkMveXBIY1BMZFoxTlZ2VkNKM1lWcE5NQjBCenBDazhEVVdwbjJBeFFFMFpn?=
 =?utf-8?B?aEJBOVlWM3NjdWlUQUN5Uk14Y1RRSTJJWkYxSWY2VzdVN0F5YTAzOG9WZVR2?=
 =?utf-8?B?c1pEY3J1VWgyRDJITG0rRFN6MW9HYWtTT3ZvcGFWRjhPcGRvZUM4RzZ0Um9v?=
 =?utf-8?B?NEI4bUYzSE5RWkhlQ3NuRkEyYW5Gb0xzM3lRWmU3blZyRzZreG1JTTRkeW1U?=
 =?utf-8?B?Zlc4SE5jU2RWQ1RsTFY0QjdWTmdQa0lJempxZXRjdnoyU0dIY3ZWM3lVWlRJ?=
 =?utf-8?B?aUJWdWR3NjRCc0dEbk1MbThYOG5IazUwQjgrRUVOWjhsbllkRFRvS1lKRjNY?=
 =?utf-8?B?amJaT2FqbWxqUndmMUxBMERUTWVGS3puUFhrSEtVWnFWWXIrcEttcWhZeE1k?=
 =?utf-8?B?NGl6L2FMNVpSWFBMekJxWk9iTmlOVWVWRldoSjdVNkZneDdiZlhVTlZ0aUlY?=
 =?utf-8?B?aGVwOHNac0piYkM3Q2pXZUlHczZxQkF5VnovbUtmMmN3Z3BHNDJKeGN5dHN3?=
 =?utf-8?B?SklWVWNiQ0k0UlNtTWg4ejE1SGQxN1pZczJtcC9CbFVGeEd5ZlhpZXRlMkFS?=
 =?utf-8?B?aC85amxPbGNrOUh5V3NJVDluTVFaNjNBYVM4bnovVnZqakhsQzdtN3c2ejYz?=
 =?utf-8?B?K3poVzB3a3dLeWcwajQrejdoeS9WK2E1blo2SHBCQVlMbkF2eHF1RlU2RUJW?=
 =?utf-8?B?MGJGaWkwMklTMkR5eDJjQjZuRzNSdEc0YkhJMGZzQnF4UmRHWjdobEpiS1cv?=
 =?utf-8?B?V2NBd1hQWFV3TUVldTdvejhIZjFIaHZCMGpIcmVFd2o4ZGd0anFQdE5aMVhZ?=
 =?utf-8?B?Q1ltd2R3OGdoZ0hrT2Y2T2M5aEg4czZGR2R6MzNUMExSUUlsRXE2U3BWME96?=
 =?utf-8?B?dHFQbjFCdERjaU1EQUlFTndXN21vSnpUYzBMUHhlNmJ5Tmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(34020700013)(82310400023)(35042699019)(376011)(36860700010)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 10:46:30.4968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad34173a-79a6-43e5-bfc3-08dc8f83e9c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 10:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200866

T24gMTMgSnVuIDIwMjQsIGF0IDA3OjE4LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4NCj4gDQo+ICogZG9fY29uZmlndXJlIGZhaWxlZCB3aXRoIGdjYy0xNDoNCj4gZXJy
b3IgaW4gYnVpbGQvY29uZmlnLmxvZzoNCj4gY29uZnRlc3QuYzo1NjozOiBlcnJvcjogcmV0dXJu
IHR5cGUgZGVmYXVsdHMgdG8gJ2ludCcgWy1XaW1wbGljaXQtaW50XQ0KPiBjb25mdGVzdC5jOjU5
OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZXhpdCcgWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQoNCkEgYmV0dGVyIHNvbHV0aW9uIHRvIHRoaXMg
d291bGQgYmUgdG8gYWN0dWFsbHkgZml4IHRoZSBjb25maWd1cmUgdGVzdCwgd2hpY2ggZm9yIGV4
YW1wbGUgRmVkb3JhIGFyZSBhbHJlYWR5IGRvaW5nIGFuZCBoYXZlIGFsc28gc3VibWl0dGVkIHVw
c3RyZWFtLiAgU3VycHJpc2luZ2x5LCB0aGUgZXhwZWN0IG1haW50YWluZXIgYXBwZWFycyB0byBi
ZSBiYWNrIHNvIHRoZXJl4oCZcyBhIGNoYW5jZSB0aGlzIHdpbGwgYWN0dWFsbHkgYmUgcmVzb2x2
ZWQuDQoNClJvc3M=

