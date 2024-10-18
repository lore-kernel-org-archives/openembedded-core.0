Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409A3D2F7ED
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:25:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.71])
 by mx.groups.io with SMTP id smtpd.web11.26632.1729268743953607322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jW8gejTe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jW8gejTe;
 spf=pass (domain: arm.com, ip: 40.107.249.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g/9autBF/OYdRXG01FvOU4H/tBgYMV+gJORdVw3aCasz28+FgGOWTR0pDV+xKoI2tX2QLT/WK61zBswkobVbEzIOJNJBuoNu8O8VQJ0UXrR4vTiQqeMo7GUwkr295Ct6FKBMAj2mZbkEg+UuRkYrQAfB06oRRFFBEtzl+dEC/pwgy/u6FHwMIaOO3EELZZbvpewTZj/JsFGKXYaUkKk3j660M2mgLKS1my9RUteK9TbeCgQk4vnsA80u8no+y12ngu0oqjgwn3cBrC5aE6u7XVyiSbBiynTD63mAUTekimZX+CNUHF8chc9MGyal5quWMW9d75ANQYVO2euJV5HtRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwWG/oQy2c+UJETtnVbmLhwlksicgFFoVpQ3x1CJj/Q=;
 b=Brqecrjuke4tSKTaoCybBArs+pJ3xqTKU8Kid++7hXjZLImhAe+bjiRCGEcBdZYLiEm3QL3CPkEX1Mh/9JNLRTDkI1T3Mm4r8NF55LVolJAIKVzPlCEm9wDwjtXvlh5t/wOvmJF4e5jNVem37yexRilfI7M/9SUj4hXgraYKpj1hnhPu0tDPz71z93lbPbWowPJ9mePMBb0T8uVz71ygFFAga9SNomoPjcGCwIjK9oWJTb9jkmiBV0GDlk4997IXM+ygh2ZTn2ajK31VD8ig1TMuOCpJ86fiJ2Y9ff8oaCLm89yV6YJuMETzXHJIT4dwTmM1IGscl9xIwnv/o3Yt3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwWG/oQy2c+UJETtnVbmLhwlksicgFFoVpQ3x1CJj/Q=;
 b=jW8gejTeI2oRQdDaoke7GeZLDbvae/o8YdR4UJJur2uXOp9qGL0R9ask5Jz0vbrHr0NpqnZG9BpeCsCL62fr+2MYZHc1hS94gKPeuytivB9ZjGmuQ8NGCuBHwwsJDfOAlzY65Gfdq0fiWEOQ/AFB9QhuKcch2jKgME+AP6VJPN4=
Received: from DU2PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:10:234::15)
 by DU0PR08MB8164.eurprd08.prod.outlook.com (2603:10a6:10:3ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 16:25:40 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::ac) by DU2PR04CA0040.outlook.office365.com
 (2603:10a6:10:234::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 16:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Fri, 18 Oct 2024 16:25:39 +0000
Received: ("Tessian outbound cd6aa7fa963a:v473"); Fri, 18 Oct 2024 16:25:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acf73ecd05238f70
X-TessianGatewayMetadata: S58WJ4zoN3ZH9aIOe1qijDkXc1U/xbeom5moms8UhusesxC/9ksrQFVyqrAKg/tGLni13zfyIayKwRnyJ5vBnK9ar6h3ERoAw2eeRufuiaECSMAeFmrj9KUfxmbPA2CCXV3hmewW65YGFT6WaRX1u0xHXm4r0DJhrUc8X7KP7aA=
X-CR-MTA-TID: 64aa7808
Received: from Lceb2717acfe8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9AD531A2-19C3-4843-8A5D-5E15C5922B20.1;
	Fri, 18 Oct 2024 16:25:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lceb2717acfe8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 18 Oct 2024 16:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzIdEv51AfC26vvNbnC4YLOtPgofBhCGWnyRkOI8x4DhJyFQAHrnzNrWW4TBjX8S6SZfTwzeuBRblzBg1DYBqyat1CicgScR5vfvsadYWAt8nH2kH0i2NxcMa+gofUE3NFW1iE/hQeB1iSNd3GHl8b2gg5FdDWwSpeIWvo1g8lrWRRP20s9sP7m3+PeWp6+rrQv369038MRPRGamYZX0vxG9WYMLAqVjSndQ0ZOHvPXmCycJEYX7dLyaL84vsGVW7Z2lkR2DDZT/iZEfqQ344/flaihyMaJ//PwAr/kyS80hm3JuoFyZd/N4xyzHqm7Ya6rHilD9WkpcMQVXINRRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwWG/oQy2c+UJETtnVbmLhwlksicgFFoVpQ3x1CJj/Q=;
 b=dwwHdnfQ5r3/pLhWj28Nxx4oWgRbH8TP6h/Fo+mNznH+bU8K/W6OIgs979eaTzANjDzav7kpOj+piNUTUMECWx7JfBwqFXyBsdaruAg+zOG2wWI924qnIo8V4olzCj8dNCAPlhHWoLuA2lVXDeQesOEiUDRD+b+Bj4P81CoorR96PqXQ4rJa4ikfnWqp636dg0d2lKzwRF/+DKBbeX/QZdFbR8nkJSaBugXQpLzoMyRCqqNi9mnm4373s933tp4AW3pc2PJEULfzAS26QksaqL4qnbeJDptJomKQkvlktoqSr72gIN7rMPUtzGmPvqxQpmWtMIKSPKVCoU+eu0eTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwWG/oQy2c+UJETtnVbmLhwlksicgFFoVpQ3x1CJj/Q=;
 b=jW8gejTeI2oRQdDaoke7GeZLDbvae/o8YdR4UJJur2uXOp9qGL0R9ask5Jz0vbrHr0NpqnZG9BpeCsCL62fr+2MYZHc1hS94gKPeuytivB9ZjGmuQ8NGCuBHwwsJDfOAlzY65Gfdq0fiWEOQ/AFB9QhuKcch2jKgME+AP6VJPN4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7586.eurprd08.prod.outlook.com (2603:10a6:20b:472::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 16:25:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 16:25:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrej.v@skyrain.eu" <andrej.v@skyrain.eu>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
Thread-Topic: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
Thread-Index: AQHbG8LbVrs5IscE5E28fFF8zyi4MLKBe+QAgAZF5ACABM+GAIAAK88A
Date: Fri, 18 Oct 2024 16:25:29 +0000
Message-ID: <88FFD2B0-7B54-4CA3-B27A-0E3C069EAF0D@arm.com>
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
 <a9c4777b9bf0987e3a01138e664fdfbe45907035.camel@linuxfoundation.org>
 <a37cc22a-e880-45e7-aefc-c667d233f36e@skyrain.eu>
 <f9d5f576-20e9-4fbe-b232-f7d1d3a3325f@skyrain.eu>
In-Reply-To: <f9d5f576-20e9-4fbe-b232-f7d1d3a3325f@skyrain.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7586:EE_|DB3PEPF0000885F:EE_|DU0PR08MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: d7103840-f26f-4770-860d-08dcef9180d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MURwYTlveUt0eGdhYWZPcWxnU1duNnorM05jWVV3OGduY3dTc3N5ajFrczlw?=
 =?utf-8?B?T2VxTHMzOERrNkV4YTE4RkFjenR1YnVQV0hNNElFQ280c1NMbFJrMXRwaVJz?=
 =?utf-8?B?M1NJcFhJRnpscjZyRE1IeGppeEQ3RHBvVXIyZFoyckdVcGNjKzRwV1BUNUZV?=
 =?utf-8?B?c3U1cU0zNzVzaGpiZmQ0TjdVRG8xd3d5eE1HUVZENHdOTXc3SThiNGFvVjho?=
 =?utf-8?B?RnMySWVjUXFTRER0UzNZUldiRmU4QnQ0Ymcvdmlnbi9hOHU0VU4wc3pPR1ZY?=
 =?utf-8?B?aWxNVVRZYnhrZ2VvMHlkNGN4eVZ3TnRBbkMyMHRKdzZaWGsyMGxzWEtKdHp1?=
 =?utf-8?B?Uy9NcGlnOXR1WEtDR2dqcTdPRWxkU1Nyb0pOak9Yd01ncVJiMXhqdllQRXVj?=
 =?utf-8?B?eXc0OU8vM2N4ZENqbk91UndQR0luWmJyajNhckw0WnZNM1RDcURkc0hoSWpR?=
 =?utf-8?B?ZFNUSFJQWW1VNVM5Sk9IYVJUWEMyRzlMdUVZUlFKZ0dwM0N0WUIzbm1qRkhn?=
 =?utf-8?B?dGdIVEhBQ3lqTVY5cTdIT1FBakxUVDAvbUdwZUxGcVRZd3kzWTZneWNJNXRS?=
 =?utf-8?B?T1UrV1k3MTgzRUNXbjAwYVZXTmUwYlJEZEExazdLZWhiSERFLzYzRjBGRVVY?=
 =?utf-8?B?Yy9GS214MU1kNGFBZy9YYWg4ZldGQXUwbTZCbnF4UWRpTUZUek44NG1iSndj?=
 =?utf-8?B?U1VxQkh4VlNVZDVFRXdobUZNQmZsbUl1eklrRVc1YkFxQjFSRk5lcnhIdmow?=
 =?utf-8?B?Y3RQYWNWbzBzUFQ0Q0tBcDRYMUFEbk5aMEFoQi9ZTEp3NTJyUWQzZjdKbURj?=
 =?utf-8?B?c3U4UEprUWVQcXBIdnE5TnNUVEZPSmpaZDlMQkladHdGd1VpYjVqNk53Rlkv?=
 =?utf-8?B?MEZDVWlTdmxPQm9lUXlXQ0YzN1V5MkZtRFJLbkRUMHk2TUpERjR6SjlaNDhX?=
 =?utf-8?B?QU11T0pHdnhuNUg2aFBJYXRxSzhQT1ltUVdudThoYmtXemZnUTlqWWRycWVE?=
 =?utf-8?B?OU9HWEdjVHJWQnZ6WWRxQVJtcTZPS2FRSWxQaVEvSzhROEczYStvTkRVck1P?=
 =?utf-8?B?SGlsWWpuc0FRVDdHc3gxOGxwM2QrM1hYTm9kbWM4dzRBZmd1WWNDU3ZHSUZv?=
 =?utf-8?B?bFU5RnFXdkpSLy8wV3pIV281dThyQmpOUDZHaVJGWVRURzFZQU4rWk5qMzU4?=
 =?utf-8?B?Ti9ySnlVdUVVQU0zSkkxMkRCQk94WUVpVlBQWTFVR3hyaUhCWkxNZ1RPNXdN?=
 =?utf-8?B?V1dwWVo5QWV3WDk1MWc0S3EzSGZRbXdsWm1xNjJIci96aW4rUGl0dXFLSUlo?=
 =?utf-8?B?amptemZHOXVhMDcwaldXeHU1Zm5udkx4UldFS3pUMXpOdFFUWkhSQjFMaTM5?=
 =?utf-8?B?NzhnRUduSjhTdng2dDdEczh6TXFYdkE4RGYzajBpdFh2d0o0SkhMTEZDWGpa?=
 =?utf-8?B?enBKUjVSZlg1aUxIbjJtcjFTTnRZZnYzWHF4WVRWcmRCdWNhcVVLeGJVRVo4?=
 =?utf-8?B?SkFvWnkxVk8ybUFUakk2TU9SUHFwbzZ2MzlHcUhuQ09HNTdBRFc0SlNuUTFF?=
 =?utf-8?B?KzF4VSt1VlFuM3VCRzAwRXd0UXRUL2Y0bGJLODArdHlXMVZjeU5rc3IvRkhM?=
 =?utf-8?B?eHc0bk14T2taQkNxVkxQRGU2dzUxRkdNNXc2N21pSlF4OHI3UU9EYUpyYnVN?=
 =?utf-8?B?OFFWb2IvdG50clNNcllGb1Vkc3ZWT1lvMkRMUXRrZXh0WUxHZjRFb1JzK3Br?=
 =?utf-8?B?TjAzT3ozaGNJOTRpQk1MWG9OZldnZ1ppUnNoRGY2ei9rWWJNODlyMm5QeEdk?=
 =?utf-8?Q?jE3CHnYuLpd78V5xW7HMnzT/b5+L0EpDGI/54=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <918A8841605FC0468C1A4C82E1680E5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7586
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	07974c50-e5a2-4444-e461-08dcef917b12
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?STJXZS9wckora0gvV2xjemZxY2xMYjJTQm1BKzhRZmxwbkhxcnNIbEhqWWlE?=
 =?utf-8?B?clV5N0hhRWZNY1E1elJvZSsrdE9TN1Bka0FJMkdOQWFNdHRZeWZkQ1QxWEVQ?=
 =?utf-8?B?K0hZN1dldnlNN3grSzNVS2p2c1FRcUZ0d0dVSUN5dUdMcFRreS9rSUtoRjNj?=
 =?utf-8?B?RDhvSHUzTllSM2Izb2RWV1B0b0VCcXl6dEJyYVI0SUlBUkphWmxuVDduZDRk?=
 =?utf-8?B?aGFFckhKMFpqekRqQWp3QXdpUVBBYjlueHpnd1hjRXEydlRJTjJVeGNNUG9y?=
 =?utf-8?B?SUV6TUF6d1AwVk5sMjNSSlBFdCthVnE2akRITWNhZmdXbjBwVE0zY2NjSVVL?=
 =?utf-8?B?aC80dGFxb3NvSTY0K0JrWFBIbG9md1hBcUxOVEd0MUkraWJpWmF6UUt2R1Vo?=
 =?utf-8?B?ajJRU3ViUXU0TUJXL2I0UkQ5eU5qOXYrYTdrTHBBelBOT2J5SndSajNkdTVr?=
 =?utf-8?B?OUxMcnljTUExdVByZjBmTmI0N0JqSzJCR0U2QmNkT201NUZ2bUE3b3dvTXg5?=
 =?utf-8?B?Vjh3b2kyUmVWK0UrRG9xdEpieUExdFRaUmZtdjh6bmZNZ0NLMndjWFg0N2Ur?=
 =?utf-8?B?ZTBRNzVwZzFiZElFdWRmUXl4NWluc21GUlZSMlN6Ulh6Wk5zUzhKWkxka2FE?=
 =?utf-8?B?aGowekpvU0RKMDY1VEZtS1pqZ1kwNWhxUEt0YjZudlZROERlZ1VGVjNjZjdB?=
 =?utf-8?B?MHYrVFhya2NnUHpnYkVFMTdkdnFrZ216TTVYeERHdWFWNlNaUTQ1L3V2L3pT?=
 =?utf-8?B?aHFsanNVRS9La1FHYUU0WSsra0ZjbnhjUEJ1UEwwakVTdEx0ZGVnQmFJVjdZ?=
 =?utf-8?B?Z1gvWEw1dk5HRjZvSko3ZkFsM1d0S3piOURDZEpaZmdZejVwQ3ZhVlZQYlhS?=
 =?utf-8?B?YkZyb2dLTGR3RWJZUUdSNUt2TUdtc1VGNWxXVnVyZUthK214aHBOQjJ1WDBO?=
 =?utf-8?B?UzJRU3E2dmhqMG1kWVMwUDN1TkRpcWdOK0J3R0lmTXJHQUYwM256Y2tqTGpH?=
 =?utf-8?B?VVF6MmhmQzBDV2JSd1phdUprbkhnMC9MTjVCYVBQU2krWFIwVW1LL1NsZitq?=
 =?utf-8?B?Ry9INWZlQXUzSnM3a2dGQ0xIejduTm56alRWR0NjNkt5cGcydXlyYkdSZEI0?=
 =?utf-8?B?c3k0eS8vOXNiNCtTTEx3NHZBLzh2YVZRNnA5bHptME5qRTNwR3BiVDBaN0tr?=
 =?utf-8?B?MlF3bXI4N0xndW1sMFZNQVdyZnYyYWRLTkliaFZsWm9NRGRzV09ueFJ1dE9k?=
 =?utf-8?B?ZWY2R3ZaNmM2NFFlLzhkV21ab1A5SHp0MHJHTHBFOG5HNWR2MnN1bXVvWmc5?=
 =?utf-8?B?QTRkTUs0TUluNUp0Yjc0cDd4SkMwUDdLbkJtWi8yZ0dyQnFPcytqQnZaaGUx?=
 =?utf-8?B?KzFqQTE5ZFphd013RVUvQnFTdUdZb1hVM2Zpa016Z21Ob0ZlRWlaSEIzSTF6?=
 =?utf-8?B?Mk13TWl6NTlqRkR3Ymc0WEI4R1V0VTllQm4wOWVCeWhRM1JpeDQ5UHM1bjBG?=
 =?utf-8?B?U0Fmc0xzNTIwQnVNdFh5L2FYVjgxT2VqS2pBa1hJa3V1aDFPZGczZ2NoYU5N?=
 =?utf-8?B?aCtSaDE0bXBXREFhUVV2b1ZrcFZCb1Fvdk0rVGZPWnVya2M5QkRWV3NBenBr?=
 =?utf-8?B?VmNnWDRvOElraHBXL1RodEovaTNRWXF6VGVCZEVxS1dBckp1VGZVWVRYSkR5?=
 =?utf-8?B?YjNkZWt2d1dvWFkwVlpxNCtSQ1FqQXF2TktqRVlYUjErZjdFZFhzeFhmeFI2?=
 =?utf-8?B?REFuK3BRRk1uR3IyRGMxS0w2YnJROG5aRytzRHR4dlZHbnJlVFZyUGc3RHBR?=
 =?utf-8?B?ODVucFhDSmxyai9Dbkp4M1JraGtiQVpBWmtCeDZYQnA0V0xNb2tMN1NJdFdi?=
 =?utf-8?B?aWlabzEwRHhxdVRJdVVEc1J5dWo5UXpIUU1sNUFEclNWRmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 16:25:39.0410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7103840-f26f-4770-860d-08dcef9180d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 16:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206065

T24gMTggT2N0IDIwMjQsIGF0IDE0OjQ4LCBBbmRyZWogVmFsZWsgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFuZHJlai52PXNreXJhaW4uZXVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBIZWxsbyBSaWNoYXJkLA0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayBp
ZiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzIwNTk1NiBmaXhlZCBhbGwgaXNzdWVzPyBJbiBjYXNlIG9mIG5vdCwgbGV0IG1lIGtub3cg
YW5kIHdpbGwgdHJ5IHRvIGZpeCB0aGVtLg0KDQpUaGlzIGRvZXNu4oCZdCBidWlsZDoNCg0KQXBw
bHlpbmcgcGF0Y2ggMDAwMi1zdGFydC1zdG9wLWRhZW1vbi1maXgtdGVzdHMucGF0Y2gNCnBhdGNo
aW5nIGZpbGUgdGVzdHN1aXRlL3N0YXJ0LXN0b3AtZGFlbW9uLnRlc3RzDQpIdW5rICMyIEZBSUxF
RCBhdCA1MS4NCjEgb3V0IG9mIDIgaHVua3MgRkFJTEVEIC0tIHJlamVjdHMgaW4gZmlsZSB0ZXN0
c3VpdGUvc3RhcnQtc3RvcC1kYWVtb24udGVzdHMNClBhdGNoIDAwMDItc3RhcnQtc3RvcC1kYWVt
b24tZml4LXRlc3RzLnBhdGNoIGRvZXMgbm90IGFwcGx5IChlbmZvcmNlIHdpdGggLWYpDQoNClJv
c3M=

