Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E69BC87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 10:08:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.18])
 by mx.groups.io with SMTP id smtpd.web10.14585.1754302110973094285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 03:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iTEIuWwe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iTEIuWwe;
 spf=pass (domain: arm.com, ip: 52.101.83.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DcmhwcIeq1aDH3ybCs7DwCZWi//o0fU36DN3Q+EUiM4OTlUjV2DUnNnHoOAhFKfBC872jkfKpzcH5n09E04QmuHK/P9TjtjTVOiP2vkQNjdKruHUvBFw/XefWnIZ3wfmtXySeXC/UJdbayvbpv0RqSmaHrfiQlbDDXZKjPtNJPA4qZg29tdrtpQQufzMqRykKauyeuRShOiBoH5FYsZkhf5IfgMhlGaALFFNlKSdokI3FdhWkfGqNUgbo2os9J2I3gXaJvCCrUv5/EquvbA0J0tQMB0zm+UrovEYqLDyuWqDIigcMsSI9AXGZoaFNILXklKDXjV0t3qKJyDEw4/Pcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mkk5+ZXmVPSvXqaVuIEGDz153z2RVx9lcVHZI+QW00=;
 b=OJv3s7imtb87mfSRjHmfLcYAchC2ZUu+YxMOXZ2pneW7YjKj7EqpzfrmSlzpiw1Nn4LayxcxH56/5ZDGJZ2ONaZ7nS1o39OvviUrvUQpHBsL+yBjNiBZVQFamhiB/OZifwbnl/G50tvAsbFKiHvYwvaK0prz1UHEwGySLs58LYYX8AA5MMaNq2+wPCqJfnJOMwBt8HUGrOqeU57vPiQdKz1g1+uHygawuZVe5JmXbuMcEbPe/duEn/oqBxrR3FEAwThtm1pdsdOktHowQ1RPBnrEHNbQN4Z9s3KQfXfCSFw70lca3nqiWZKHH4L+j0MMAKNyzlccfBo6PGHIMfe7+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mkk5+ZXmVPSvXqaVuIEGDz153z2RVx9lcVHZI+QW00=;
 b=iTEIuWweADk0I18mju9VdG8b30vQjO/FTVWxhTsECGzusnHJLxBRzFZ+p01O1ys+lafF085xt/15+qC7g4STFdqlrreuSP//kfZ9kfR55RqU9hxksWG7umcW7VWmftQgb0o2lFgt6W1ILJ/SiQWXrT/eGbSA1Jt49OIO1qAGyiY=
Received: from PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::18)
 by AS8PR08MB8351.eurprd08.prod.outlook.com (2603:10a6:20b:56b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 10:08:25 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::46) by PAZP264CA0122.outlook.office365.com
 (2603:10a6:102:1ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Mon,
 4 Aug 2025 10:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Mon, 4 Aug 2025 10:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5Ly4wwM5U11of7EVqEaXo6SAYK95pcRc5xRMcglNmUh3bzV0HQ6iV8BLazJA4WzpcFXw1HdCw39A5/kTEYat84ZoZGlAwSTFGjfIr1IFXL6iD6C/1ULVMGqBVgVnv8TZ+e5ZHQcOZo4XC9/IXQC0JjBsrUL2kWivrCPkEEVpW7k6ROa6xnSvSZxW77fSSoCeyr6p7xm59RQoF+I4y0vT6AP8et594aAn20/kX5LQyRfgFwffPWOXkMZrM3PXFkPXZFcQIWE2Un3qvYBem5f6d+gL/Daj5+tZ9xiFk3+w0Pg/JYDrB27S9VecD7a1IYDGZIqpvVGpGScqBD7phwPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mkk5+ZXmVPSvXqaVuIEGDz153z2RVx9lcVHZI+QW00=;
 b=lXPXVyIZQ3r2/d1+HdjDO7MAadMA+u7oSC0PWzT/NAPXDZ0aMZR8QgiXJD6KjXZ13JnWtNLiudHRTKw3Q2W8vqfqP56jqhYJUzXo7+M/o15E7W4G+OdQbyleqwzw+y0QEQfwuq9rWDZlCYAp72eHhv8hpLaFbiWYbQpjJDWywzDFXOa8i6P1K2eonujSwR/3kGgwJO0MEZRlt9OEzymwUcEA8y7Hyr24nGtvXCiTj8AV1oDyb4JHOoj8vgBZ5DaGuKg/WDvXFnLp8bMNa5gq4rhl9i5SkgIWkCzygp2iISJY9+AySBc0GDikFH4tiey+ussEqxVy1wDF9fvZuUlfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mkk5+ZXmVPSvXqaVuIEGDz153z2RVx9lcVHZI+QW00=;
 b=iTEIuWweADk0I18mju9VdG8b30vQjO/FTVWxhTsECGzusnHJLxBRzFZ+p01O1ys+lafF085xt/15+qC7g4STFdqlrreuSP//kfZ9kfR55RqU9hxksWG7umcW7VWmftQgb0o2lFgt6W1ILJ/SiQWXrT/eGbSA1Jt49OIO1qAGyiY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6731.eurprd08.prod.outlook.com (2603:10a6:10:2a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:07:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:07:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] clang: Add packageconfig knob for opt-viewer
Thread-Topic: [OE-core] [PATCH v2] clang: Add packageconfig knob for
 opt-viewer
Thread-Index: AQHcBCeh0JNIxN08ZUeU9nbkkHKiYLRSRuiA
Date: Mon, 4 Aug 2025 10:07:50 +0000
Message-ID: <2D9EE655-2C46-4B59-9E3F-008AC692E7B9@arm.com>
References: <20250803033456.2029035-1-raj.khem@gmail.com>
In-Reply-To: <20250803033456.2029035-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6731:EE_|AMS0EPF000001B4:EE_|AS8PR08MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 7536b4f9-3817-4a52-495d-08ddd33ed915
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RUdvWWt6TVJHVFZkRkRlR0V1bTlWMlFWYWZxb1crQjdoeHROSC9XNTcrei83?=
 =?utf-8?B?dXdsY1AvQmgrY01IVkpvT0Y5YmN6dUx0UGNKek1rYzRRRlNjdCtnT0tlZjQ3?=
 =?utf-8?B?djc1UGpVYnRrSmkrOURKV0wwVmhhUjFhK25GNWtFNS9panVCTk0yU0hKTkZI?=
 =?utf-8?B?QlhxM1crQloxQkM2YVZrQ1QrTmswQWhpNGNQUHRjSmRuZEwwYkF0QXF0UWNu?=
 =?utf-8?B?d2FXcDlDSytYSkNOY1dKb1lrVUJlNk5WckV0T2o1andDcjRsakxOQ0xOWUZ6?=
 =?utf-8?B?RldrWFl0RlZqMlpNdENpeUtVZ2kzenUvV2Rsem53aFVmZFBucmc2dVRiQjhV?=
 =?utf-8?B?eVpDdzBrSU1zenpydnVlUGE1ekE4Um1jaTlrMG9YR1pVRlVFNHcyQXBVcDUy?=
 =?utf-8?B?aHNYOFUrU1YzOS8wNmVkSmUwandYZHhzUzFESEhLWUU2M010NGxJQ05OOEU0?=
 =?utf-8?B?cGNMclZaUzE5N0pPbm5ncjliTFN5Nzg4a2g4S0RENlU5UThjS08reDhhN1hW?=
 =?utf-8?B?MmcxN2J1N0ticm5xTTIxVGNSVWJzbGYvMW10eGNRRDFuRlh0R1kxWXJXNTZM?=
 =?utf-8?B?ak0yRWFUUkw3b0RrMVFVd0tmN3hMdkNnNXZjTjFucE83ajlyMWp2RHV5d3lk?=
 =?utf-8?B?UUFYMmtGMGNlMFZQM2M3MW9aUXQ1ci93OTlqdG84N1hEZkw1VXpFTXdjVHFm?=
 =?utf-8?B?dE41aVM1eis5b0ZmZnk1SDVBdStyNWg0Q2tRY3dZVHlVMmF3bFhCSzZoSm9O?=
 =?utf-8?B?Qkh6MGdvem9PVGxvMGI5T1QvZUJNQThLRDZkdHh1KzNvNEdob1dHa0VIaStN?=
 =?utf-8?B?WU1pSFZkaktMN09heW5SZDhNRmRQVkFOOGx4SzRYRk1ObWJEU2NONWJQZE8w?=
 =?utf-8?B?dVJPODJtNWdzMnFjazk4ODltZDFiVGRrVlI5K2xwRkY4d1JVOUJ2ODFoMUtO?=
 =?utf-8?B?aTBRYUpWSWNYQlU0dnJIVHBPNnpOOEFMMGIraDAybEc5Q0RkSlY4anVwSXJy?=
 =?utf-8?B?YmJnRTQzbHVkNmxjVTBKWDdUcjFqd3JWOTFsOU9TZFIwK1NrV0NEZndITE5D?=
 =?utf-8?B?WWszM1QvQlA2Tmk2Vy9HYzVCODRPSUQ0bE5BMTVMNTJMQjZIUllBUVltK0Ew?=
 =?utf-8?B?bXN0QWppUStSRDVrSmFhNjNhNDlYdURJVGg1MlNhb2pqeDJzWDhHMjVnbzd1?=
 =?utf-8?B?RlY1TitFMGY0dGNrazhYRHUybTNQNXVjbGh1TjFUVjN4b09ydXUvODNaNXJ4?=
 =?utf-8?B?eVVialcveUZOcjhGenAwTkE2NTdjcTA2VGVaMjBENVUyUDhwNWVBQlZMT3Fn?=
 =?utf-8?B?R1N1anZrRi9GK2dBTHhuaERjL2pOamFGV3FEWVJ6YUdiQzJPMDNidmpPWkxk?=
 =?utf-8?B?T00xSllybThtQWx4bmI4RXA1WkMwNGhKblRiZXZCdWZ3M0NySFJqaU01Vmh3?=
 =?utf-8?B?S1hhSlJ3MS90QUlRVG5SNU9haFROOHNnRkVaYkVQZ3FPOVFRRFUzTnVUbFNO?=
 =?utf-8?B?dVp5NjFHNTVwajl4S3g5akZZdHZFUzBIZ1hCZEZtTzcyRzJkYmplRmtYelpH?=
 =?utf-8?B?SERMMEQzMkMwdVpXNEwwWWs3K2oweDdmNkpHbHFaZW9BeWd2T1RycTNyZVVX?=
 =?utf-8?B?NExQQzV5dURCNkR2d2dpbHFDektZS2tUSURPeGF4RXM1Y3RqVjhpdnROczhB?=
 =?utf-8?B?L0pseVBDWEYyTkhsc3lYb1JQeDU3RzlIVG5va2pNVWwzdnU2ME1Na2NHN2U2?=
 =?utf-8?B?TjVKUGFJWmM2dCs1S0RhdXorQTNpbmFFVVR2S0hBRFNhTWVoT3dUSEVoYXJY?=
 =?utf-8?B?aVpVckJVbDRWTXh2WkdWazZCMk5nOFRKMkdNUFpFbHhvOGZNWU42S09IZ3J4?=
 =?utf-8?B?R1A2eGg5SVBqa09oTVR4VEROYkxJd2dTYnM3TnBTeXRaSkpoWGFJSlFhQTgx?=
 =?utf-8?B?dlI1cWJKa1VxT25Jd05wRy9nSk80dGFBUVk1S25ZWUgxVU4xNzk5dDlQb2x3?=
 =?utf-8?B?M2VSdkJ5Z05nPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B67DEA3A8EC054C993FD782A2DCA59A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6731
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0592a0ec-0e55-44b0-6485-08ddd33ec4f6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NC9zaTFSR3NVNHNGYVJQeDJwTnk0ZlVXTnNxOXVFcjZJSWh3aVNGaWVoZi9B?=
 =?utf-8?B?ZGZ2b2xoTUk3WEpKQStoeEFvU0NkaEY1TFlqcWF6bDQ0aFJIUGg0MWFYTk1t?=
 =?utf-8?B?dldRNk5PV0kwV3hqcFk3YmdwZ0ZGNHEweFlFelZjS2V3REtVTGY0ZitzT2Ex?=
 =?utf-8?B?S3lGYW5hS0U1RTRNR0NDbXhuNzg1QWs5OTV0Qkg3REd5N0NlRzFnNGFRa3li?=
 =?utf-8?B?TlV0cCtIN0daNFc4Qm9veVUvSXQzTFc3QWtUbm9reFRqK0RjNXVtemdaUkpK?=
 =?utf-8?B?MXUwQzlKellhN3ZoZ2l6SUdDMjJ0K1pjZ2JkNENTRVlzQmo2NHkweGNHeW4y?=
 =?utf-8?B?ZUtYYUlURHBTSzBTazFPamxlRjg5eEJiMDY4a3dZaGNFVG9Fb0MrdXozajR6?=
 =?utf-8?B?aUJQTTQ2VjhvUk9KWHJwQzBHSXg2SldXTTdFR210UWRYa0loSERNdFlhbU9u?=
 =?utf-8?B?ZThEQU52MHFjdGdwL2Q0TTBDYm9MUnhlQ1lTY2MrMEcxYWdUM2ptb2tkVjNF?=
 =?utf-8?B?NUZBbCtjemFxSXdsRUh3aHZkMDNzeHJyZXp0VHUvQUJYYURhek5xVFVrRHVy?=
 =?utf-8?B?R0FmSmlKWSsxSWJ6QlZHTWlDYnc0YklpTzFmcFlxYWQzZkNPV1ZwRXh0WWFM?=
 =?utf-8?B?emg3bC9OcWRlOWUvM2o2UmF6ZG53SXU0SlBUWjFQTHRXTVJLaEs0bUtnV1VB?=
 =?utf-8?B?QUx5VHhWdkxVcXRldmdBYVJ6bUpTMmNDa3owMGdVL3BCTFNOQlpMV1p5aUJT?=
 =?utf-8?B?YmJEcERaOStmT0hsVEI5NEZTc1hVRHRwdGwxWWFZWHh4RnEwV01QSjRXK3NP?=
 =?utf-8?B?VzQwbEl3NnY5MnJtcGdJWDhBWkZTUGdjWmcrWkNMTzhCcTd6am5NQnNGUDZu?=
 =?utf-8?B?Z0pVM3ZjeGRCTHIvR2tiR21vbUREK3E0MFh6ejgvV21VM2NpQjQ5MysxVDM4?=
 =?utf-8?B?K2pUV0dmMThVR1M4Y0h3SnNJbzFNYWx6MGVibGF5RU9vTDFHVHlWZjNlbzNV?=
 =?utf-8?B?THlTeVdaVlR5SGpjdFNLWjA4WHptQTJDMzFDTzA0L0d0UlhLUGhGRGdYZVM1?=
 =?utf-8?B?ZGZqdmwwSk9ld1I3aHU2b3RjRVlFZFh0OWJMaG5idHJoRk1RdEFYVnZZRTVL?=
 =?utf-8?B?dW9Od3hvWTFDUmNjT203QStZV0FhTm5hSFdJZmNGTUVnSnM4YTBzblo0c1hE?=
 =?utf-8?B?azdaY09mRVVZNVJWT1FrbUlJMlpSNllQUkJRQVAyVlE3bHQ3Zmt4elEzZ2kr?=
 =?utf-8?B?T2tRMk5UQ2pSNmphMFN6eWYzSTZDVkFzQVBaalJOdWgvWmU5bTh6NmtTWGNV?=
 =?utf-8?B?ajY1RldoWUtrQlBBVkdidnhsdUlCQ0c2bi85Zm5ielYyYzVqOE5JUjU4akhS?=
 =?utf-8?B?TE9QMDFaRXNyRDhyaXpqOGMxQUNDN2xaVlRCaXZsdUFVNXZLWXZydXZqNFh0?=
 =?utf-8?B?cHVtODdZZE1YaytZTzY2aHFQQmJGcm9YV3BLRE8vdGxSZm1Fa2JveitvZEZZ?=
 =?utf-8?B?L3krRW9TdlM5U2o2VE5MRzJhY3lsbFF5T1lxNjdGUDdlNmY4VkQxVy8zSk1X?=
 =?utf-8?B?NGtaTG01TjVkWXRwMUhCOWdyTmFaQjZmUWxBZzNXUSt0QXNrQTA3ZG80N3JO?=
 =?utf-8?B?NmpjazJreEl5L09rUG1ZOFBQTENKck15czRydzRxSFRpS2FMS2tibjJqek9a?=
 =?utf-8?B?bjMxcU5KOTl2RGlSTmhSekpMRURNb04yczVjcE9Za3ZGdFY2QVAvQnlRUFVZ?=
 =?utf-8?B?VTBlS0IxQWtrYStoMEFNUU52Vnl5S25BNUJLZUI5SzZoR0hnNnl4TGQyeU9K?=
 =?utf-8?B?ZFB4OVpZR0crOW8ySC91ajA1ZlVJdjhTRFBzNmx1eWo5Q1ZGU01jbUI4NDZy?=
 =?utf-8?B?MWZ4d0hHd05KL0dnTzI5ek1jUnhDN3JzQ1ZwZ05QNTBxcG9oQVJVenFucmQr?=
 =?utf-8?B?Uy9pWHBadEt1emlwMnhLcVNjaWR6TXZ2SEx3MFpOQU80NWRzVllUa2c1WUpz?=
 =?utf-8?B?VHQrRWxzYWdEdXNKbVIwblp4cDc4Yk1KTHZOOXBDOVpmL2tmVFc0aTZ1cWlz?=
 =?utf-8?Q?hHK3Id?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:08:23.9557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7536b4f9-3817-4a52-495d-08ddd33ed915
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221423

T24gMyBBdWcgMjAyNSwgYXQgMDQ6MzQsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBUaGUgb3B0aW1pemF0aW9uIHZpZXdlciBpcyBhIHdlYi1iYXNlZCB0b29sIHRoYXQgaGVs
cHMgZGV2ZWxvcGVycyB2aXN1YWxpemUNCj4gYW5kIGFuYWx5emUgTExWTSdzIG9wdGltaXphdGlv
biBwYXNzZXMuIEl0IGdlbmVyYXRlcyByZXBvcnRzIHNob3dpbmcNCj4gV2hpY2ggb3B0aW1pemF0
aW9ucyB3ZXJlIGFwcGxpZWQgdG8gc3BlY2lmaWMgZnVuY3Rpb25zLg0KPiBXaHkgY2VydGFpbiBv
cHRpbWl6YXRpb25zIHdlcmUgb3Igd2VyZW4ndCBwZXJmb3JtZWQuDQo+IFBlcmZvcm1hbmNlIHJl
bWFya3MgYW5kIG1pc3NlZCBvcHRpbWl6YXRpb24gb3Bwb3J0dW5pdGllcw0KPiBJbnRlcmFjdGl2
ZSB2aWV3cyBvZiB0aGUgb3B0aW1pemF0aW9uIHBpcGVsaW5lLg0KPiANCj4gSXRzIGEgbmljZSBh
ZGQtb24sIGtlZXAgaXQgZGlzYWJsZWQgYnkgZGVmYXVsdC4NCg0KVGhpcyBzdGlsbCBpbnN0YWxs
cyBvcHQtdmlld2VyLCBqdXN0IGRvZXNu4oCZdCBjaGVjayBmb3IgaXTigJlzIGRlcGVuZGVuY2ll
cy4gIEnigJltIGd1ZXNzaW5nIHRoZSBhY3R1YWwgYnVpbGQgb2YgdGhlIHRvb2wgc2hvdWxkIGJl
IGd1YXJkZWQgd2l0aCB0aGUgc2FtZSB2YXJpYWJsZS4NCg0KUm9zcw==

