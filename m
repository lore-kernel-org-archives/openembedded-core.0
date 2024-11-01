Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B37BE6F092
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 21:47:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.5695.1730497666650319351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 14:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B9nfr/GU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B9nfr/GU;
 spf=pass (domain: arm.com, ip: 40.107.20.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ppRAekKiWM06h9s0lKTC+Ok4Q/xRUWTqbqnVlXvDXer0pRjJmCY6kmhbjNkCVNmlyj1/VJ7giQREatEc/YvO2u3zYAE5ARPELEDzOsVFVQoQ6fHPGv+rmahrsF+udeCZIp+1DEiXJq4oN+V1ki3XTziesgLfR4o+gIswdLWv5hrNuzDInBjiallAuI7IwVNnELA/QYORzHTZisvZlkrGAJ8f8WVnLEkMMGjYqeKrhdF6j0c0X2jjutot3wVI130XFlIbJe8kvhgJKvRfv5Ru04Vdx8zKclZzKFWADs0n8TSK6EAJ98rgk91QumA7yGcrXiuqnuUzwFZmRPOhEMoTDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0rjIYd0sv9uS2L3yyJJA7XOlFder8fE/qFY2/yody0=;
 b=jv1Mepbm7gtQVAEdBgXIRxSNCo1uhjP1mVaqEAci9AKmRNYuhxXuhykxQi3MWsVGDQYi7fj/NpG5iFXwEs2Uxs4tF7ub9Nda1e4amlekvH3y0QtHIX6FiqouYfxNbsu+1pWGgfpG1l4urm8rr0aoD/F4yeY9NyrSMTiB3HHy97oUgwHB7aYyPN7Wx2kinCuDx5ssFMws6WOm35oyrSXcTkN2uLg7NDYNPHrTuyoNpykUuKsy3EzZEn3rzTPDP9ZTnUt8fXMUhRmWOL8JxqvAuXrKaGbwAYrz9Scq1DLF/4QHgEgUfPkb+FPFarPo3C7nI83rQKXqWhUx3pwjNN9zSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0rjIYd0sv9uS2L3yyJJA7XOlFder8fE/qFY2/yody0=;
 b=B9nfr/GUgFW06zKcOWaOAd+IZESdgQpxkmJw3j4oVzuulqOP+0pDxTRGnqPlHFG4eUaTC615f4g1ixjzVS9hwGZciVPM3COmOcMprlt3/HScv5MmZgwll26cOVEFD9ZDnxgR1CG1Y47rpLNEW9eLtXSjM1kZAvtkPBXmroJtN9s=
Received: from DUZPR01CA0233.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::17) by VE1PR08MB5808.eurprd08.prod.outlook.com
 (2603:10a6:800:1a1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 21:47:38 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::36) by DUZPR01CA0233.outlook.office365.com
 (2603:10a6:10:4b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.25 via Frontend
 Transport; Fri, 1 Nov 2024 21:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Fri, 1 Nov 2024 21:47:37 +0000
Received: ("Tessian outbound 99870d44e01c:v490"); Fri, 01 Nov 2024 21:47:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a45ef6fd4917843c
X-TessianGatewayMetadata: ij7De0O6Sm2OvvyWbhtYau6Qv9VlK0JiGnAsWp37wjFoPePVn5xaKw7lND1z5BjLvXz6ZU5fb1migHpIFhDbRBBa+jvPCJXcLXkq/9SDI9DsW9aVrXp/ssW1dWynKBUVdaEW3X1SJTHJl2sRbIVAyC5AxSTv9SEI29QvrGzsBI8=
X-CR-MTA-TID: 64aa7808
Received: from L6c7fa5c2fc78.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FF22634C-5FC6-4538-9A9F-358468A176FF.1;
	Fri, 01 Nov 2024 21:47:30 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6c7fa5c2fc78.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 01 Nov 2024 21:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZD3k2yiGZV9WH13l9IbjVx6uSSXYIexDkahkTfbZyu8YmTh++NWrAcW8OgriPqLhfGYk1TtRCPiR5lUdNKr6L3cYxR9wTddkZj4JJTW0lYHNlVefg0mHPdjSclgNDdBVolYxm5sm4cAmkBCrfKB5qtU0Rs7UHsv1Ce4aNsdLOuzxLdixaIZK6ZtStlAbw0rcE8/TtZdkpHmtkIxkK7SWyk9MxOa6WipFdWaqkG2YqfF3wPiYRzbfAw5XhOu2wPzqCnZfh2SvoTDtKGGDMQrygs/Lof9MmHO4T63F1vZPyDrZFBxbHgyXdI6pd9s4mj7JCtm1G6iD+FNbDHYUEtarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0rjIYd0sv9uS2L3yyJJA7XOlFder8fE/qFY2/yody0=;
 b=cApD4TVn1+Ci8PhLztdrgVtqI3ivcfYS7NZBB/6JMi64QJZN8zPb9PwHi3bnTRAk+C8GhaLf3wSSmgdOudmFZDo6HwGGjiltfBBxxJqyzZP7uypdLpwMQ7AuchVcPFTK4SXr8UtDpAwLocvCt1v1br4GsblbmURhhELZe4AUqMSbratWSDOjvIsOKd+c4H4eafqmkvoRub6XC1BEakzfGtHG+vvehSdP2ntTSb42gs4itDOjU0udPvKgVEZ5Nfs9VUctWE3I45AWidnIjVrqIeL4EKF9AddBX2Ipw0gONoiVNPnxOFdMFJ+gVlmXfzmQAIRmJ9zqV72kgZrhwfChAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0rjIYd0sv9uS2L3yyJJA7XOlFder8fE/qFY2/yody0=;
 b=B9nfr/GUgFW06zKcOWaOAd+IZESdgQpxkmJw3j4oVzuulqOP+0pDxTRGnqPlHFG4eUaTC615f4g1ixjzVS9hwGZciVPM3COmOcMprlt3/HScv5MmZgwll26cOVEFD9ZDnxgR1CG1Y47rpLNEW9eLtXSjM1kZAvtkPBXmroJtN9s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8343.eurprd08.prod.outlook.com (2603:10a6:150:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 21:47:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 21:47:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Trevor Gamblin
	<tgamblin@baylibre.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Topic: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Index: AQHbKjoSdv/YvM45x0CAs4yfwlReRbKfWfkAgALds4CAAMMZAA==
Date: Fri, 1 Nov 2024 21:47:24 +0000
Message-ID: <53C5ACAC-FD02-457D-B24D-42DDB1568859@arm.com>
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
 <ZyJBQBRRsLFov02a@bootlin-mathieu>
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8343:EE_|DB1PEPF00039233:EE_|VE1PR08MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d7e4d9-f4b5-4689-a239-08dcfabecd5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VXRuejd0V2FKRWdXcnpDeDRPN0xGK2ttanJPTHo5LzVIek92TzdWeEFjTzZF?=
 =?utf-8?B?Zk9hYm1jZ3BYWCt1VG5ubFRIL3duUXQva2xMczhDMVJGTm85WmhoazhYVDYw?=
 =?utf-8?B?U1BmUEkvbDYvNWFQZXV0NFl4Sk1HaDVoS0hWRFI2QWpod2RnZVlMRjgxR0t3?=
 =?utf-8?B?MWpQazYzbWlDLzJkenFOT3AvMFJheHhFSy9MVVNwL2VZQS9BeFRuc3Zubk5F?=
 =?utf-8?B?dG1sRGViR0JhK2Z6UXJpYlhuOW53aHJmcHVTRFM3RmZTL3dOTTNqa1Q0aFg3?=
 =?utf-8?B?Y0o5c1JUUTFpSGNuUnFvRkVNYTM1QTBjS2VxVHIyTlF0SDBlekpRVFpieG5G?=
 =?utf-8?B?di9kOVBiQUZ5dHRUWWxLSjczd3VreFlIdjBPOS9zU1VKYzhqa3dMV2czM0pw?=
 =?utf-8?B?VGpDZFBFYmxTYnl0L0NRQTNmM0FsekhBVkZDQ2J4MUhUUlVoSG9hVHRySWdE?=
 =?utf-8?B?K25uYW9tQVR3RExFbENjc09FTzJocWRTblUzajNKSC9OT3NGdkFRTUtHVEpS?=
 =?utf-8?B?NE5yOHNGWVpvOXFkcHNlOWtIQzUzTm5ScjJqd2YzemszT05WcVMxVk1ETG9P?=
 =?utf-8?B?aXJXRm83WU1GK0F2ZnhFem9GeGlZRURyNnZ6Zk42SnIweVp5eWl2UUlVQkox?=
 =?utf-8?B?SG1wZXdBY09jWDliYW9OQVZhVXcxemRya1hiRUh0OWtZMExnT1RLci9RU2g4?=
 =?utf-8?B?UmtJc1RSSC9nenBhaEZEVFQ5Q2lONHJ5YjJQTHYzbkN5UFdTZGUzb0NYbWtN?=
 =?utf-8?B?MkpYYUUwdlpVUnA1R0VJYU1uQUw1ejk4RjkwZFVGVVdLUnl5SDFVRUM2OEFM?=
 =?utf-8?B?R2xQRlh4Y0xJQTd5eGE4SGJyOVFLTzFuY1JNUWRscTlkZURrVTh1b0NYZGZh?=
 =?utf-8?B?MDBqOHFrbHNpa0FrN0FnZ25LYy94RUlhblRIN2k2WXVTWGhkWVVpTGQ2V1hT?=
 =?utf-8?B?RyszZ2xPQjA1ZVN1SVp2UEVHbjNtc1B4MnVPOEM2ZDdhQ1BSTE1HZHJDaTlS?=
 =?utf-8?B?SEh3OFlUSXZuazYvOW5OQWd6cWxQRTlZOERIMWl1Ny9yZGVBYTFEdkdrMWEz?=
 =?utf-8?B?cGRONEN0MzFrMjFtRGQxZk45Y2FkZHlTVGZNY1ZiOHhEaTlDaURscTZsWjh3?=
 =?utf-8?B?YVB5eFZrWk1YNG1wT0xycFpOazdSeHdHTG1oMm0vYUhEb1FqOFFKZWVIQ0dV?=
 =?utf-8?B?cnRSLzhSdmtuS1hzbWpiSmdqKzU4NnlHL1NwL0NwdXorMGwxR1QrVytpSHYy?=
 =?utf-8?B?VnBScm5naDdlMU50QUsyN0VxT1p6dHA1UkF0SzNDeGErUFVpbFp4L29jNzBY?=
 =?utf-8?B?TW5wY2hrZGJwRFZsMG9TaFcrNERkdHVzZmZ0SVRrOTM4NXBzRzhvek9XT1U0?=
 =?utf-8?B?dGw2UXoxOW8rdjRyeTI2eS91VWVGeEhibFk5TCtlTXQ0clhIekpNOXdGN3lW?=
 =?utf-8?B?UDA3eFZGMnhjbVQ5YnhJZk9vTGJ6VlBGcW5ZQmVlMVAxNjEwK1FLWElXSG4z?=
 =?utf-8?B?enBGRi9ITmxDZlJOTGNGMTBnNXpQZ2ZaNFFZWHJMWkNSY2hQak5CMEtJSTQw?=
 =?utf-8?B?anZkRmpEZWh5eWZxSTNFdDJjOXI5bFllc2FWdmE5M2ZXQ3FSdzlxYUJnVktO?=
 =?utf-8?B?M21yZ3hPMTZac2FRSnFwMkdGS0N2LzZFK3VvbXRHNkN0OFFlOTdwSStiTDVq?=
 =?utf-8?B?MWoxUkQ2ZkEvQVFLZjlwVCs4N2JkWlMyTFNDNk1lbUlpcmdBT3ZWT0x3RXk0?=
 =?utf-8?B?T3pIaVd1S0dZRDJjM2pmZjJBRjYvemkyYWI0eEYzRE5mWjIydHJMamh2alFv?=
 =?utf-8?B?NlBkaTRRZWRsNGRGYVdlVmNqVTJaZXIxTk03YndqV1c5TjNDbDFndTZBL28v?=
 =?utf-8?Q?lKO97fHSTvE+Y?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FACBBAD6C4C793428BDA13FA8D4BB6E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8343
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c760bcef-d244-4567-1e3a-08dcfabec5d1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzlMOE5mNkpCSFR3M0ZwUTVCWU9RcEtQeU1oNDFYYmlCUnZUbFVNZEcwTXNv?=
 =?utf-8?B?MnVKWDB4d2JGSXJxUjNjbGFmdFA1RDMzbjUyM044Y2tBdnpuTFovZXQxcncy?=
 =?utf-8?B?dmQrVlEybFA1U2Z6bzBqT3Fpa0ozZ0xodEwwalE2YXlVajdEU1EvU0tLNkta?=
 =?utf-8?B?Nnh4aDREZFROMUJmTlNkMnpSRktXenRDSFAwNDk5YjF0RVlOYWlKSjc1QU1H?=
 =?utf-8?B?Z0lEZ2hKaFBKaHcvaWhPVlE3R1praVhLNkxWcmsvaFdLYjQwejl0NkdJUlJF?=
 =?utf-8?B?b1VHekE2QURVbmRVZFVEaW9mZE95c1ZlaEN1WkxvQjI4OFREZ3cwRHFaeGJq?=
 =?utf-8?B?TUFORlBnSUFMK0lBZEUrV0Q5K1p3bFY0RUxXT3BzVWc5QjE0b2Fac3djYytW?=
 =?utf-8?B?blRQSEJCUyt3UFhiLzc3bVNKME5sKzVvT0k1Y1ljMDJUTEQ3enhHZ3A1VHZK?=
 =?utf-8?B?Y05NeS9KYW4zdGJRODNZOERVTTNYdmt6aDBNMGlYVndDOHB4cXBRb21DRFV3?=
 =?utf-8?B?VDVPb0hEcktaNW1mQytQamhxcDBsNXZaOG9obStMSWxBU3FDTTBMZm9XZzhH?=
 =?utf-8?B?TTJucFJTaVNIaS8vaUJOdTRPSXFXVWZacStTNWZodHh1aTVVNDB0dTh2ZHhr?=
 =?utf-8?B?RENXYnhMVE1HUy9Db0FLVjhnVXFjQXpaZGhjOXBlVUViWTJNRkxqYVBFWWUz?=
 =?utf-8?B?SDlEUUltRVNZQ2hRKzNsdWFtOEJTME9ENDBpdjNlYytFbFBJOVhycHhyb0J3?=
 =?utf-8?B?TzRjWmJ0anZNTGl3WGc2MXlTNzkzYVpDWnFTaXVXMUZjTCtuRDF6UnRHOWFJ?=
 =?utf-8?B?M2VUamFvWE5TNE51TXRxSEhiY21mUWVMYVZkanRqZVdDdG93Z0tQQ0Y3MnpL?=
 =?utf-8?B?eEJJejE0a0FFUlRURTRrbTdXSFBDS21oVlEzTm5keTc3dm5Sa0ZzL3JBQ3dp?=
 =?utf-8?B?NXpKM2Z5SUROVUxmRVhUU24wRWpxVTIyVFFXNEU5N2ZPR2xLRmNoZllLd2Fi?=
 =?utf-8?B?WjVSZTY2Vmp6M1BySWVWTVJZdkNva2hadUprM3dRTkg3aExJa3ZZZW96SHd2?=
 =?utf-8?B?UEwxL1dJQ1NWM0hVWnFFRTVSdFlsVk5FWUxxMWF4MmNKK1ZVVWtmSUVFMW52?=
 =?utf-8?B?dFE0UVNNY3FmRlMvLzZlQTZBa0lpblZoRTBLVGVpSWl2VXBUalNHZmc5WjFI?=
 =?utf-8?B?RXhvMXdQWXN5NGZyQmhJMUM3L3lEWUZxUWYxZ20vS0FPS3NWd2Q3bURxRE1K?=
 =?utf-8?B?V0dOeTFSUkswa2tHc1dPL2Zid09UdjZFSXM1b0s1QmhZQUZxSWYrcTEvb0RI?=
 =?utf-8?B?YlR4NU5zZjlZUDR4cDRsS1NpQ012Um1jbkRtTmFiMzJnNXJUR0V1VmZJWjlH?=
 =?utf-8?B?cTdneGdhbTBRamRFWTBaZjl5bDRpR0pqRkFsZi9mZEFjeXplVnBHNWM4Qkkz?=
 =?utf-8?B?eU92bnpVbmFwR2IzWXAyVkg2WE0zRUhVQmxPRXVZYWFZd1pCZkVmeTBnYUlp?=
 =?utf-8?B?V0Evd1pyY1c2Tmh3dVV4L1NyMG1lUHpOWXJUdys0aHBPSzVLdld4YzUvbS81?=
 =?utf-8?B?RWpDRElvWUU1LzlMSTBWQ2o1MHk4QUg5Vmk3blVBQXoxQ2gwcTRVY0YxdWRE?=
 =?utf-8?B?Rm1Ya3FwS09kN09lUjcreVdhYmp3TlAyM2ZXdlJ4MHVmZUNTT1h3bHNrMEY1?=
 =?utf-8?B?ZGQ0WlBPcTRGQVY1M2FvYTF6TGUyU0d3bFIxUnpsUU0rTEozVmJaRk04MjVi?=
 =?utf-8?B?Wi9WWnUxbnNyY25VRG80YkVqNTRIakNTN2dneTJ1V3NlKytjNGhPc1RsVkRM?=
 =?utf-8?B?ai9wcGtqUWoxNk0vQUVUU04zMjdGekZrb0N0WEFvM1o0bi81VlphWEx4cGM0?=
 =?utf-8?B?Wm5NRkd6LzhOZEY1aXJhcWg2VnB4cVpBUDI5bjdaaTJGWlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 21:47:37.5610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d7e4d9-f4b5-4689-a239-08dcfabecd5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 21:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206638

T24gMSBOb3YgMjAyNCwgYXQgMTA6MDgsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAyLiBUaGUgc2Vjb25kIGlzc3VlIGlzIHNsaWdodGx5IHRyaWNraWVyLiBU
aGVyZSdzIGEgbnVtYmVyIG9mDQo+IGdlbmVyYXRlZCBjIGZpbGVzIHByb2R1Y2VkIGJ5IGN5dGhv
biBhbmQgdGhleSBjb250YWluIGxpbmVzIGxpa2U6DQo+IA0KPiBzdGF0aWMgY29uc3QgY2hhciBf
X3B5eF9rX3Nydl9zdG9yYWdlX2FsZXhfeW9jdG9fYnVpbGRfNjRbXSA9DQo+ICIvc3J2L3N0b3Jh
Z2UvYWxleC95b2N0by9idWlsZC02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3B5dGhv
bjMtbnVtcHkvMi4xLjIvbnVtcHktMi4xLjIvbnVtcHkvcmFuZG9tL2JpdF9nZW5lcmF0b3IucHl4
IjsNCj4gUHlPYmplY3QgKl9fcHl4X2twX3Nfc3J2X3N0b3JhZ2VfYWxleF95b2N0b19idWlsZF82
NDsNCj4gZXRjLg0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSBmaXhlZCBieSB0cmFja2luZyBkb3du
IHdoZXJlIGluIGN5dGhvbiB0aGlzIHN0dWZmIGlzDQo+IGdlbmVyYXRlZCwgYW5kIHJlcGxhY2lu
ZyByZWFsIHBhdGhzIChvciBwYXJ0cyBvZiB0aGVtKSB3aXRoIHNvbWV0aGluZw0KPiByZXByb2R1
Y2libGUsIGxpa2UgJ3JlcHJvZHVjaWJsZV9idWlsZF9wYXRoJyBvciBzaW1pbGFyLiBUaGVuIHRo
aXMNCj4gc2hvdWxkIGJlIHN1Ym1pdHRlZCBvciByYWlzZWQgd2l0aCB1cHN0cmVhbS4NCg0KVGhl
cmXigJlzIGFuIHVwc3RyZWFtIHRpY2tldCBhbHJlYWR5OiBodHRwczovL2dpdGh1Yi5jb20vY3l0
aG9uL2N5dGhvbi9pc3N1ZXMvNTk0OS4NCg0KPiAzLiBXZSBzaG91bGQgYWxzbyBkcm9wDQo+ICMg
UHl0aG9uIHB5eCAtPiBjIC0+IHNvIGJ1aWxkIGxlYXZlcyBhYnNvbHV0ZSBidWlsZCBwYXRocyBp
biB0aGUgY29kZQ0KPiBJTlNBTkVfU0tJUDoke1BOfSArPSAiYnVpbGRwYXRocyINCj4gSU5TQU5F
X1NLSVA6JHtQTn0tc3JjICs9ICJidWlsZHBhdGhzIg0KPiANCj4gZnJvbSBtZXRhL2NsYXNzZXMt
cmVjaXBlL3B5dGhvbl9tZXNvbnB5LmJiY2xhc3Mgd2hlbiBwb2ludCB0d28gaXMgYWRkcmVzc2Vk
Lg0KDQpUaGlzIHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhhdCBjbGFzcyBhbnl3YXksIHRoaXMg
aXMgYSBjeXRob24gd29ya2Fyb3VuZCBzbyBkb2VzbuKAmXQgaGF2ZSBhbnkgcGxhY2UgaW4gdGhl
IG1lc29ucHkgY2xhc3MuDQoNClRoZXJl4oCZcyBhbHNvIHRoYXQgLmMgZmlsZXMgZ2VuZXJhdGVk
IGJ5IGN5dGhvbiBlbWJlZCB0aGUgcHl0aG9uIGluY2x1ZGUgZGlyICh0aHVzLCBidWlsZCBwYXRo
KSBpbnNpZGUgYSDigJxDeXRob24gTWV0YWRhdGHigJ0gYmxvYi4gQSBudW1iZXIgb2YgcmVjaXBl
cyBpbiBtZXRhLXB5dGhvbiBzdHJpcCB0aGlzIG91dCBzbyBJ4oCZbSB3b25kZXJpbmcgaWYgd2Ug
bmVlZCBhIGN5dGhvbi5iYmNsYXNzIHdoaWNoIGRvZXMgc29tZXRoaW5nIGxpa2U6DQoNCmRvX2Nv
bXBpbGVbcG9zdGZ1bmNzXSA9IOKAnHN0cmlwX2N5dGhvbl9tZXRhZGF0YeKAnQ0Kc3RyaXBfY3l0
aG9uX21ldGFkYXRhKCkgew0KIGZpbmQgJHtCfSAtbmFtZSBcKi5jIC1wcmludDAgfCB4YXJncyAt
MCBzZWQgLWkgLWUgIi9CRUdJTjogQ3l0aG9uIE1ldGFkYXRhLywvRU5EOiBDeXRob24gTWV0YWRh
dGEvZOKAnQ0KfQ0KDQpBbHRlcm5hdGl2ZWx5LCBwYXRjaCBjeXRob24gdG8gbm90IGdlbmVyYXRl
IHRoYXQgbWV0YWRhdGEgaW4gdGhlIGZpcnN0IHBsYWNlLiAgQXBwYXJlbnRseSB0aGVyZSBhcmUg
dG9vbHMgdGhhdCByZWFkIGl0LCBzbyBsZWF2aW5nIGl0IGluIHRoZSB0cmVlIGJ1dCBzdHJpcHBp
bmcgaXQgYmVmb3JlIGluc3RhbGwgc2VlbXMgbGlrZSB0aGUgc2FmZXN0IG9wdGlvbi4NCg0KUm9z
cw==

