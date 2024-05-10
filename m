Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CAAC25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 16:04:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web10.17864.1715357044430178248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 09:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rbJnpDJY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rbJnpDJY;
 spf=pass (domain: arm.com, ip: 40.107.21.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fFC02b+SFbn6U6naUvfXpH39RdcIKl8v3ZKIK5celCfK4D+9gEVVKfpjHsPXVzghqe6QCE7YqPuUKHIFFgD+oPf/iaRZLLGF92SrJsOcX9R9/l4R+HVi56R31wX0/4DwYEAzHzUein9g0bfS66xyS6l94/tpTAymQc6wCcWcK3y+jEHjiadUHIZQJh/7IcYFMZ173NBIRExjJh6r1lN6Xbp/qaMFgIdfnI4Q1w3enZOnwQY6D4i7Xv5dKm6d+YOl3opdCWlADCL18I4jerZnMAThkkqh0jek+iEvta97aLHkHu8ISmKyOcYMJuI8yhk6djsVOClZfvBuW3wVYjyJBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=disHvQ6BGkh/QrDPVLc/+BOCHKNOBfAXzIxkTqIWUmI=;
 b=IENETxSrZ+sIc1NTyfERQgfR3E3q5JVJp+dBJ/IqWorlM/GbwpaYrzVtE3B9aTR6h51+XTFB7V0mLXaQKdTQPaYFntneC/3dnX6prGVwuYJf6Wa+FOmkoWwaiNkIgZemS7mVtcdL/dzQOaIJP5TkfJMmTQ+6jBGDDxHhUDrmraD6V34r4qm0DZNcYtZxIyI5oosM3DQsWxZ3Fda97D1WVgcHe/L49qbcIKB00POs2HoxF//CHYw08uRd+WOW6nZC6Ah4dtRcgBStSjIKfcJnNLSRQ9j4VeoAfxdfuX6hfE254El2zQepPQ7VNfqdBWzhxy4tgB+PBqo020WBwI7aTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=disHvQ6BGkh/QrDPVLc/+BOCHKNOBfAXzIxkTqIWUmI=;
 b=rbJnpDJY3HrIHdyCK4psfq9Y8ss5Uj7Dq9pqKzRSo3uXiDp/s1W4Webgtd/aYLqObXc4ps5RsoJEaaBfJnxRB24pJDUS0K54+79MjR4XdjA6mIwINxRBSnSwRJ6iVPxri2UZqK1FLYzwgK+3KQOYm5reMWWu9hfq7WAOoSlFJOg=
Received: from DB8PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:10:be::23)
 by DB9PR08MB8313.eurprd08.prod.outlook.com (2603:10a6:10:3df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 16:03:59 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::12) by DB8PR03CA0010.outlook.office365.com
 (2603:10a6:10:be::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Fri, 10 May 2024 16:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18 via
 Frontend Transport; Fri, 10 May 2024 16:03:57 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315"); Fri, 10 May 2024 16:03:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4a6656570fc792c
X-CR-MTA-TID: 64aa7808
Received: from 5c9b4e12bc56.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A5EFAEA4-5B9B-438C-A380-82516011B8AE.1;
	Fri, 10 May 2024 16:03:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c9b4e12bc56.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 10 May 2024 16:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVTrA4KrNjou9vdRA4+EfKTxFw+a65OrlnrqCS0UcoKTv5Ew6eMKMu8kFBUlEabbOE7EdHFwEmXBA645/kzLj2I7/USbiLwJfIwVApSr/YdwpB0xlJ5dLaKr20NPB+mVhnKKrcar3/TuAxU+wclZ/gJheDjIrAMEAQX5+KiPekl4zccJ64vJl8KWioLHDVO98nSORqmBtWXIPWBwSVcMFMc/M0vVysTCLco+/w8IiK1cyIXaFH4adXlGG2IsNu+xFEQNwwfNDYMpFUE3LsAirQTTtPZaCJVoEwC0NoscGdJNoYDOVG/fNjyRbat40vb8gZYSNYHa3PUDj0JjLuKMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=disHvQ6BGkh/QrDPVLc/+BOCHKNOBfAXzIxkTqIWUmI=;
 b=cCrCrr5jnmq3GFP/gT4gK9njXHtgEmsh1ta6bOfWz32M12qPzlOuwAuNKQ9S12tkxn4grLheU38942yVXHje69Wr7D+75R4+O8Xur0StOnKTu5Cufxnclb6haow4Ep3e+LRtoK66CjTT0IigUinGU4B7ZpgyJ/FRA6JEZ9CCocnkFGaIjMuSRBncLRHDkLScQZ3dQNcirvxjeEZ2hckyv7wuPsLmU2EVw48DELbbDmI0090oYVmO8IECr/RVZJLAKx7HxDhr8ZigOBvzR2hfzNurAW+480Tq6WDxWNAadP3hojS5nyjAx1DeiKOfx1MnfWu+62BjNtwJtHi7QKBZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=disHvQ6BGkh/QrDPVLc/+BOCHKNOBfAXzIxkTqIWUmI=;
 b=rbJnpDJY3HrIHdyCK4psfq9Y8ss5Uj7Dq9pqKzRSo3uXiDp/s1W4Webgtd/aYLqObXc4ps5RsoJEaaBfJnxRB24pJDUS0K54+79MjR4XdjA6mIwINxRBSnSwRJ6iVPxri2UZqK1FLYzwgK+3KQOYm5reMWWu9hfq7WAOoSlFJOg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6156.eurprd08.prod.outlook.com (2603:10a6:10:20b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 16:03:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 16:03:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [OE-core] Where are we at?
Thread-Topic: [Openembedded-architecture] [OE-core] Where are we at?
Thread-Index: AQHaofSE+u4q9fNfIUW//cVS7PAdFLGPQcGAgAFhkgA=
Date: Fri, 10 May 2024 16:03:49 +0000
Message-ID: <EBBF0013-F566-4BF5-BBF4-907ED09457AD@arm.com>
References: 
 <737087f797ecd87620bc96abab014d4fac6bb1e5.camel@linuxfoundation.org>
 <DD5F76CF-3124-4673-A394-91EF62CFE5A9@arm.com>
In-Reply-To: <DD5F76CF-3124-4673-A394-91EF62CFE5A9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6156:EE_|DU6PEPF00009526:EE_|DB9PR08MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: a5837134-2ca8-4439-899c-08dc710accae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QTBaYlR0ZmtzWFpYR3dWemxMbk5LaGtxSFZWQVNIeHl4cm5kaXNPUjRhZTZX?=
 =?utf-8?B?MXFKSm1yY2RxZmVSQ2gzY1dDM3VONzN5aEIxc1BaWmRCZVpoNkVmcjQ4eUty?=
 =?utf-8?B?SlB0K08yUzF2MlJiN0luRGdHek1zaittSGVCSlUyVG5EdEl5ZVhYRGxzTzQz?=
 =?utf-8?B?cVZHSlZNdk1HZ3VOd0JBMnByWTZweGlQTzdLSUFEUCtIek1aeCtTVktwaEhN?=
 =?utf-8?B?WGEzUCtxRCtDSjJ2WEN3cTcydVdpalpMSzhsY2JXYkxjMnBJd1k5OWo4VDJL?=
 =?utf-8?B?S3drRFFDcVJSSzdGRGRxcnJvNFdBM0hDWU1rN0p3bXNDdThEYVBQSlM3bDlT?=
 =?utf-8?B?eUtRTkN2TEhveXRpbjFQZTgxeFlDbVh0aWdsQnR6WEgzbzU3NEtDQUtUZjNj?=
 =?utf-8?B?Tm50R1lOd3oxT0hDLzl3b1JqODR4ZjdwWVZySG9wazc3UTk1aFU5eHVpaU14?=
 =?utf-8?B?SEZaYk5weU5wdEthTjY3d0IyNHpCMmwyUlpoRjlrcFBtMXFRaHpqUU9MK3d3?=
 =?utf-8?B?ZFdhRDliRDlpdlR5WG96MTJxV285RUZXVm5xUE5uaWVWbzg1dS9tZFdSUGs1?=
 =?utf-8?B?bGlBOFdQYWtVT2h1L2dlWDgrZmVhdUc0VzZuNG5ENysxNWtZZU9Jemczdnh0?=
 =?utf-8?B?RTR0R3JWeW15OGtDT2UvOGwrcTlkaVIzZzdMNWs0MGxNRU9xN1ZZR24vaHY4?=
 =?utf-8?B?M3Z5RVV6STBOalRNMEluVCtvcXVIUmxsSVpSNUtlSTlrTk1Xa0R0S04vRUJ3?=
 =?utf-8?B?L1U4L0RreThKNEJzUjEwejVGUWR1ckFCV3pLYXZPbjU4bWdYeWVsbE52eEZY?=
 =?utf-8?B?QmNpWHd1ajh6U1Y2bGxDbU4yWmhoL1VHMGNJSENRY29aVVN6WmFjZWZXQ0Z1?=
 =?utf-8?B?VEprcTZvdXRmZDFraU01Z09XUkZmc2t2ZUxOeFR5Z0xZRlJrNXBsOUVqNXFt?=
 =?utf-8?B?Z28vdWpsTlJKN2t4eTBDajJDTjdrU1RveStEU1luZ3h0eE5OOHJiRVlyd1pv?=
 =?utf-8?B?endWU3E4eEpaVmw5YVFlZ2xGbWRCQ1AzQXljL1BYcm9FVXJ5M0wvWFJvdnZh?=
 =?utf-8?B?cHhjMEg5OXpVeVBrYmd4UjQ2YlJoa1FUQjV2SzBLV3ovaDk2NnppaDRqRHlj?=
 =?utf-8?B?RHJaVW5ZMTd3OEVIb043bUNUNE5mWXpNSWJ4Yk52SmpJOC8yNzBUOXRqZysw?=
 =?utf-8?B?TWY1eDVQZHNWbngzQ2lqdU42ZjB6Yi9iSWRLWnFoQXY3NS9PQWtEcEZsODA4?=
 =?utf-8?B?allNUm5VcXlDVmkvZTVIbjh3dzMvbG45c3B4Z1BCSHVUQlRTR2JWZnduaEJP?=
 =?utf-8?B?VldFanF4UUJMQkRoVXM3MmxsenNoazNmeFB6Nm8rb081K0ozQzRyM2orN28z?=
 =?utf-8?B?VU93eWQ3L3hROWUrV252UHRrei9mQXRlc2c5bUlYRW9jRjFsTG9jRnFQdG9l?=
 =?utf-8?B?WVBVdkNNUWkyeGlMdGgreHVpR0N2eEh3QmJOdVIzQm9jSGVSaDFzek1lNXJm?=
 =?utf-8?B?MXlOMWtCK0IyY2dSUXFESVlsbmxHYW4xL0RTZ2JOUmRWaWtPWFlSOUZVeWdS?=
 =?utf-8?B?cklvaVkxZ3J2a0F2ckRsNjFmdTh0YzZZV2tJNWFidFR2QWtEenpvUllqWHNS?=
 =?utf-8?B?T2xnZmtiYWlZWUVEblAydnVoYml5bjRGNVo0TWNPR3FVQk1JRzJWUlJ2TzBj?=
 =?utf-8?B?T2ZGNVVOK0V5ZWdDRmYrd0RxTDZ5UFRTWit2SFdMR2xlRHYwQzNHYXpBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BECFBF0784F394B8A0091788B65B409@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6156
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ea08890-52bb-4ad3-b819-08dc710ac7a6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|82310400017|35042699013|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEtjK3VtdC9NRmFiallUN2xaczUvQjVxdmoyRFVTVzRadkhLdlRqTUU4Ukcx?=
 =?utf-8?B?M3RnWEVVRmtidGFRTW9nRjlaRkFrcUZrdWI4RGhrQTFhSVptSWMxbW9aVXUy?=
 =?utf-8?B?c3NjWHZiOXRvU3N5V2VyeFMvY2ZMUStIN2c5Rm5GbndUTzlrTWJHZUxHK3Fn?=
 =?utf-8?B?NWthQU9wTE5tZ0JldXhNT3VtVE1NeldvVzcwR09ZNnVIa0RibVVDcEpCNWtN?=
 =?utf-8?B?a2N3NURWZU9GajBLdWFhRFk2U0hZSllPOTZENmZXWjd2Y1BzYXVuVHdXNGlj?=
 =?utf-8?B?SU1IYVpQaVdTL1FRVFJzM0xTcUU5a25UL2VvMzhNaGozbmtwMWZEQTdVZ3p4?=
 =?utf-8?B?ODYvazFkdGRiWDhtVkR1S2FNK2NBTk5nb1pOUThYM0ZMb0FrSWxxN2dPTTRZ?=
 =?utf-8?B?L0R0OGV1aGJ2K21qNzZSSDMveERpTkZaNGh2WTVrQU51My9NMXpmeWt5Y281?=
 =?utf-8?B?N1VpMXYrVjZKT2ZzV0d2YS9GYlpxUVl6UmZjc29zRGR6OXpmVEZVSVIwZzJi?=
 =?utf-8?B?WUsvUGVTUDhQY0pReEt0Skk0Y09VT2xHcTNEOTdnMWxuZ1MzQmNEZHVPOGNr?=
 =?utf-8?B?Q3JuR05yQjEwa3IxVFVOelVjWTh6OGt5dlc0YXZOa3BHUHA1UDlSeHBRdGM0?=
 =?utf-8?B?bXBEOGw0Zmxrd2RXb3RKTlNmTitXMWlYS1pRcGdXL2xhRS9xUmtBQXpyQ2kx?=
 =?utf-8?B?Uy8wZTREMUQ0M2ZjOVFNVnlzbWRxWjBad1hpMHBLNmIwTkxSS3VmdFNoKy9G?=
 =?utf-8?B?dEw4RlBqN3l3L1phM3hSMzZaUm8vRTBDOTQwSUxsNENJZDlFVGEvTllrQmdV?=
 =?utf-8?B?MzM5SFlyT1Nzb1REbXhHYnJQZ0tsVmR2eVlRYUt4YUVTbnpiS2dVeks4b3hX?=
 =?utf-8?B?M083UGdUaUwzYldpYTkvWC9NU0tDbnQxWlE4WHBNZ0FUVWN5RTZCRVhaV3pD?=
 =?utf-8?B?UTM0aWpGT09RTWhpQ0lGVHI1V0Qvd1JrZnM1dTEzOVozZmNtUXF0M0RPT21u?=
 =?utf-8?B?RDZvbEFicXpOajZ1OE1xcFN4NFVrNzk3Y1J4dklDRjVCL0tlNFloMW85czF6?=
 =?utf-8?B?TnRrcWRyK2RnakdpSCtIZVhZODdEL3I5cm1GOUNoR1VNbUZwWHRwS2VLRkh0?=
 =?utf-8?B?cTRuL2lnT3NhNkt5NnpBTkRGamQ1UTJmRVd6RUtpa3pTd0phNVFQOG5RMkRy?=
 =?utf-8?B?OExmeTFjMzFFYkRTOUVOUUZlcW9ZVnJwUCtYbjRVVkFFaUtjQzV4OVowVG5G?=
 =?utf-8?B?c2h4bDk5RTZob2UzdDV0WFpBRkt1cERqb0FlMGltVDVLWHJFdmFScDc0WWJO?=
 =?utf-8?B?Y0JjRGxEdGk5YzVtR3R4akQ5K1hiMU5xMXZ2d1dpYk9Jd1Jyd3V5QUE3TlBi?=
 =?utf-8?B?WU5SVmlleHlCUnlNZGdaZWZBQkdTTjZ6VHZYdnJXZTIxemVXL1FEWEVOdHlk?=
 =?utf-8?B?bjA1YTBBVDFQQ3IrNm8zd1lmZVhhdE44UWIxMXhleUhGZkRFK2pLc0p1bFY3?=
 =?utf-8?B?czlCajczU0ttWTYzSWl2MnRUWEdKa1RWZTgwVzgyWW1PQ2lhQlptRG1yNDNH?=
 =?utf-8?B?Q25jc2ZFbFNPNEJUMjNHVHNjR1pCek5DQWU3SVV0V3BNSkpSSFkyaXIvYlJH?=
 =?utf-8?B?OTRFdDNOdEErQzFFYzVFQy9VSVpZY2VrT3l3ckJWcGpNV0MxdHh6cDFGZUdu?=
 =?utf-8?B?VE1HTnJKUWhnV0YwUElkSkJRbzA2aXhRQm4xYytRUXMwY1FrQ1k2WGhhb25E?=
 =?utf-8?Q?1HuyCqzczX1UF2JUAXoXQJYFMLKryKbvDE9tRL9?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(35042699013)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 16:03:57.7370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5837134-2ca8-4439-899c-08dc710accae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 16:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199199

T24gOSBNYXkgMjAyNCwgYXQgMTk6NTgsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gDQo+IA0KPj4gT24gOSBNYXkgMjAyNCwgYXQgMTA6MzcsIFJpY2hhcmQgUHVyZGll
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRp
b24ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gSW50ZXJtaXR0ZW50IGRv
X2NvbXBpbGUgZmFpbHVyZSBpbiBsaWJwb3J0YWw6DQo+PiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzExNy9idWlsZHMvNDc2MC9zdGVwcy8x
Mi9sb2dzL3N0ZGlvDQo+IA0KPiBSb290IGNhdXNlZCB0aGlzLCBmaXggaW5jb21pbmcuDQoNClBh
dGNoIG9uIHRoZSBsaXN0Lg0KDQo+PiBkZWJ1Z2luZm9kIGtlZXBzIGJyZWFraW5nOg0KPj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMjcv
YnVpbGRzLzMyOTkvc3RlcHMvMTQvbG9ncy9zdGRpbw0KPj4gaHR0cHM6Ly9idWd6aWxsYS55b2N0
b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDkzNw0KPiANCj4gSSByZWFsaXNlZCB0aGF0
IEkgZGlkbuKAmXQgZG8gd2hhdCBJIHRob3VnaHQgSSBoYWQgcHJldmlvdXNseSBzbyB1bmRlcnN0
YW5kIHRoaXMgbm93LCBob3BlZnVsbHkgZml4YWJsZSB0b21vcnJvdy4NCg0KSSBoYXZlIGEgZml4
LCBpdCBuZWVkcyBjbGVhbmluZyB1cOKApiBJIHNoYWxsIGRpc2N1c3MgdGhpcyB3aXRoIFJQIG5l
eHQgd2Vlay4NCg0KUm9zcw==

