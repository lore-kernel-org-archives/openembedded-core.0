Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872FAC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 16:21:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.23226.1738340495002806624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 08:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MzNdHpoc;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MzNdHpoc;
 spf=pass (domain: arm.com, ip: 40.107.22.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aA2kRnU+9jy0RFvwr7mbtfBpxI3ZOOlc48YD6U6sIkBU4TPqVcc4P5PBQfnslDOpo2u0vnlUiVRakW5vlgcBy/ZpO/SdWyG4v6Y7+770SdmBMhxhGtN4V7LZHCobxSUoMluEN9VdbJUFf+HaHT+ykySRTXq47CWiEIpuvns0LD5aoOTmZjn6wpNJztoBHZkUWye3OgcQCiiuMn4DkzXCpBrcG5L7uVW/G1+vTuZKm8H1zo3TnbEHbjzJKCYUdFgqWw1NNltantRtjbUC5CzAq3Xqio2ZmBoRkmux0KVxCKpp4dUinXo/c5gTgYVyqCrYQ22ON9QA9dCtZXV2osq6kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFBZkk/+mCsLSebeVvO9ZNYgN9S24hX2edV+6HVzE6g=;
 b=VJiDguERe8jfJ7w6+FVei/z2Tu0gbGCCV1XoLpbJMqPOIiM5ryOyq4UHifsQwn+EHr1SI7o8+Hkxgp2nfq3lF7jeUfrlZnUd5tGEkJ98a1ziFgvepDyTdxA6b5kv32g4mtiHJOhPUIrEQN2o08GD2Gn1WD/sKANr845C6C56HxiCqKPFMKYusB9RDpqkLfvgElEnG95NA4l2nY5vOih9/CJ9JWSMceMv0igR15dhy6764qmqF4qpDSxW4sd/Qo1AkZmpoBQ8LmCpKmDJIW02WigTtki/1X8rkaXatpa96etat9bcU4YM+8c9/KWlxb+7XUyU0evp2KirXa1PySYomQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFBZkk/+mCsLSebeVvO9ZNYgN9S24hX2edV+6HVzE6g=;
 b=MzNdHpocSb7uLMEOyeBO7Z17gRcBWfPEsK9yu0aPGa51CaFHzamrHyRpQLKDxnMRoncZzqfG1XDdHY/fBoEjMyvYgK+VujYA0ATMlytbe4T7ogGKgdf8n774H/SCoM7JIdKHRM2hEVmaBe2QM7vB2l2YH3PGZtrGitbRRz47b0A=
Received: from DU2P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::33)
 by PA4PR08MB7434.eurprd08.prod.outlook.com (2603:10a6:102:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:21:31 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::f7) by DU2P251CA0027.outlook.office365.com
 (2603:10a6:10:230::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 16:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Fri, 31 Jan 2025 16:21:29 +0000
Received: ("Tessian outbound cd7bee7c735c:v560"); Fri, 31 Jan 2025 16:21:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9041c314de39fcad
X-TessianGatewayMetadata: GLC4yt/11XKAq8CMOlZwJ+87GbFZ5nfildFk8CDXgllm+FaAHJLR/MRnxbvPuL2WJleXsPI6bM7MKzM4zBOuQua0gJXxY9k+lC9vAUNCgCJTulTXb7mU9dK7QTubxJOff2XD29Z5n0TNRJrfGAmNDUdQIYsWvPmWmaH8k6HlhBQ=
X-CR-MTA-TID: 64aa7808
Received: from Lddb65839205a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A6439087-9318-40DC-9BE1-20B4B04C1104.1;
	Fri, 31 Jan 2025 16:21:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lddb65839205a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 31 Jan 2025 16:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDYvK/ArXIQnk/2nkZondldfziTFowY34bjZmwgscfgAKq9srS/FEsLR7vUh9wrxmPzA3fdLIaQ1ShF1EBAFYUnJ3RabXxkqTGjB/4XF/+ktO7I1Bkg40M6RfilJDqasBbZnKt+fbICPjTFY9ebTF5bakBZxi9gM46A4N1w62Ad6Zpk7eUdok7J6uCwwucNKXMCwHJHzvajf+WBr8cHGYPiN8DcbFrvZ1emGgwvfDeJHh1338JTiukzlVDLMPUu6s5dUTF2PwAVewlsyKX9rxdFez1uy28DRsTLf6TzVpo2DiXbKworYNTgqaONZKxNwWENWVKiCm+WYI1I5/k8Www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFBZkk/+mCsLSebeVvO9ZNYgN9S24hX2edV+6HVzE6g=;
 b=fztu7UXrr2zfk6HubifOu6aS+KpEVzisJTrOeLtyg0G+L+J9h0ByIIbhDzLnHtSLdbTONn/6T5VDvRhU6zj79xz+XQtVDFUvP2eHR+qTdAtZ95/kyDGFNMqprV1qivLG4+TBsbFkqmmadFG6Rso2N/bX0GCLesnt//n1KH1VHlZ3Ru79ZokLyATB1vSBQ8TOvUVIotwihS+WWPQph4fShiT9g7LGUbPVZZNIFUcd6KvLoaDJKhTgPAU1wXovzaF31j6L64RrU9NPc6UrhDMxRCKmTpWxSPa3FSEhYPgxb/bB0X9o2Dx5o10VAHQHwzofrj7glZ3/pK5WkEGD7EJdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFBZkk/+mCsLSebeVvO9ZNYgN9S24hX2edV+6HVzE6g=;
 b=MzNdHpocSb7uLMEOyeBO7Z17gRcBWfPEsK9yu0aPGa51CaFHzamrHyRpQLKDxnMRoncZzqfG1XDdHY/fBoEjMyvYgK+VujYA0ATMlytbe4T7ogGKgdf8n774H/SCoM7JIdKHRM2hEVmaBe2QM7vB2l2YH3PGZtrGitbRRz47b0A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8258.eurprd08.prod.outlook.com (2603:10a6:150:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 16:21:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 16:21:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] systemd: use getty generators by default
Thread-Topic: [OE-core] [PATCH 2/2] systemd: use getty generators by default
Thread-Index: AQHbc0C0QgvyHlBu6EaP5/x+qNhtxrMwfB+AgACVowA=
Date: Fri, 31 Jan 2025 16:21:19 +0000
Message-ID: <D3A3D1BC-9B8F-4A1D-916C-11AA28EE6645@arm.com>
References: <20250130175901.938043-1-ross.burton@arm.com>
 <20250130175901.938043-2-ross.burton@arm.com> <Z5x67SnX6xrXoF_N@nuoska>
In-Reply-To: <Z5x67SnX6xrXoF_N@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8258:EE_|DU6PEPF0000B622:EE_|PA4PR08MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 16036847-9498-4fb7-3bd7-08dd421351bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M0x2K21VaVpoVUtpcWdMTnVhZzVlejBCQXN6VGJRVXFYL0tIUERGc01jTjA5?=
 =?utf-8?B?UFk5eU4wWG1QRTZuUTM1NDV3N2dReUNTQTZYMW1Uem9UTSt6ay94UkltRXJk?=
 =?utf-8?B?cFY4VksrcStnZHdPVnljSWJwQTZsSXl3NkdlY05XcVJHempza3NHRW5ZU2lD?=
 =?utf-8?B?N3NXWnBTTGk5NjlYRkU4R0pQbW9vYnVKekFqUzRvZUZBRW5nMlBQYjV0aWVj?=
 =?utf-8?B?dlk5NEhYdHREeWtUWk9haDNVY29mK1N4TjhCV1pwa3dxOHYrQS9ZaFFydmxs?=
 =?utf-8?B?QTA4VTVNQjM0dGluMWN3SlE3QWZjVGxZeGV3L1JvR2JDL09kaSszcXNZeWJi?=
 =?utf-8?B?T3pHRmR6L2tqc2Z3WDBBTzVuZkhuRURpd3VJSzZaNllDbU96TThvZkRFUStr?=
 =?utf-8?B?TzdJbEJaS3UvRCtRZVFaMXlaSnhFTWRITkQyRU5xOVl5ZWZGRjFNYzNOd3N5?=
 =?utf-8?B?Kzlvenhra0tSQnNDdTVEaVNMcExoa1VhSERmRTJKYjU1Q2hSSlNYQVRLTFhi?=
 =?utf-8?B?bjgwTWJqSWJLakxtL0lqMWpjNjk0SDVsK1BSUTk3QXhXKzduTmxZVFQrZEZa?=
 =?utf-8?B?LzZVaytMNjcxMGNTKzllNnd2MEZqYlRjN0R3MndXQmcvQ2h1emp2QjA1V1I5?=
 =?utf-8?B?ejRXeTJNRFZFV2tCYU9wWWdoRDVTUkZiMWlMSUNRMFdXZzl0elpjOUcvWlhj?=
 =?utf-8?B?VGd6L0o0cnBvTW5XR2RpbEpwM2hYblhYcUxRVjZaUmZ3TXREUmM2cXA5WS90?=
 =?utf-8?B?M3IxNHdVMEN2T2ZxNGZwMThLajBJZGtMVVRUSlpaOXZ1VURGYzEyN0hDUzR3?=
 =?utf-8?B?azM3YjYwVzFoQ3hwNTdGbDhSbjBxUHAwNDJpdDVlT0NxejZLNEJKNmQxMkpG?=
 =?utf-8?B?UlFoa3dHWmhPbC9ZVTRhaDR0S1NGWmF4L3dhYUdWOWRxMkFtNmd1cHR0czRW?=
 =?utf-8?B?UHRLb21CWmxjWjZvdC9FTEZHUXRSbEtmRnJVYjZ0NnlManBVSWplRFMrSUJW?=
 =?utf-8?B?Zm9nTW5NUDIwR1JTR0hXaVM2cHY4STJjaklENitNOENLNW5vUlF4Q09Xek5K?=
 =?utf-8?B?NlZJZDNFaEtzRGNPNjR4NXdtdGFVNWl4aEZXaGFuUnFKVC82dktDbTN1ek8x?=
 =?utf-8?B?QW0rSENtNWFxemlUSjlaY21rZXNDb015dU5XMUJIczAva1lSNFFmMHlxbWlI?=
 =?utf-8?B?Wll0Tm9lT25NUzRDYXUyb2JVK2JuTVJBRDhFcXc2RG9RdHpFRVlNemFGTkZq?=
 =?utf-8?B?dDNraWtuMkh0UW8yVlVwUjhHU1dMb0tZd2lrbnlwMG84Nkk4bFBRSUhCQkI2?=
 =?utf-8?B?WjlGaGhDOWpqNlc2WlU1UEl6ekhzRnZPaXZnbVFoZWtUU2dmcTh6bzZPM0hr?=
 =?utf-8?B?THptME4yRGswV1JEQWF4KzBuaWNOa25iRWl4MklMaldSaUo5UlVaa1VyNVVa?=
 =?utf-8?B?Z0tqRElZdDVHWG9vWGZMMFZiRXhDaWlYNlBEeXRYNkhZejR3bFRIY05SRVp1?=
 =?utf-8?B?ZGlHSytQUDFJaWVmcGF6WGVXYnlQemlLTGFmdVdWWExlcXE5TVovSlZtQ3R2?=
 =?utf-8?B?K05JUGRPMkp5bjlWS3EwNmc4bzBrbjZ5MmV3NVg3YU9aMTF0VkhzQnJrLzQ2?=
 =?utf-8?B?TW53WVkramZoaW9XbVQ0SHlXUlc4eW5XQWZuTU1rbE5XQUlnbnd5dU93bmVE?=
 =?utf-8?B?Q3FUaXUzc1lWOWxTQTRtZXdWQTBBRmwvd2lWZVN2NVd1eE5pR1lzbmZFUTlk?=
 =?utf-8?B?ZDhiU1NpRTVDemh1dDhqQzNkaXVqcXljQXVPVEphZ1ZoblZnYXd1VU5nMFk1?=
 =?utf-8?B?MDFYVkZCSnA2bVkvYkJoV0g4SmpqcjRvR1Y1Rlo3V0RPMlg5QnV0cWRCSmtr?=
 =?utf-8?B?bkdneTlkUUZvTGdYYS8rNWkvcWVyREJUcmlHTUtQWWxhd0RzU05CcmlaemE0?=
 =?utf-8?Q?zAV8CHmw+/pwSiAwEUh8jY5mpahSA1Ko?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <537D68CF51B76340ADA1B11574EC6CD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8258
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	45baa0b6-a771-4502-1258-08dd42134b70
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3VLSnczSjlGWklPWlpiT1pvU0pXZE1WZEFFaDhjN1RPTHNMS1c1Kzc0aFoy?=
 =?utf-8?B?TllPWmhPbmRKSENJeTNVakwyT0txb2JwWFhyY253MXNNaDBVU2FxK3BoRjM1?=
 =?utf-8?B?TmVibk9MWnYrR1UyWklLaEtMYXppalVzZjZCeThwQVhHYVZpc2ZadGJib3Ir?=
 =?utf-8?B?U2l3dEh3REVrc3J3d2dyTlZPUExwMWdEbVBnM0lUcHd4TDdyUG5DNjdUTWQv?=
 =?utf-8?B?ZlFWTDc0Q0QwY21DblFVRTJYUjVPTmdYa3lOT0loRE84azJTTXVFUGsxWS9t?=
 =?utf-8?B?QS8yczkyMnA3VVV4Y0VDQTl1ZHhDNllJOVpRNThBS0NPczNXM3YwN3ExMXEx?=
 =?utf-8?B?dXRNTis5ZTBWT1JYU1RqdElCNk54RVBXTXErVW9KRGM2eEtPdHJGTWNOMjR4?=
 =?utf-8?B?SVdoT21YMmp4R243YmViRlRGaXA1UzdPeFM1dzZZbDBHaTYwdm5pNVliYmw3?=
 =?utf-8?B?MEUrZVdkNW1zczRhWEpKb3RCeFgxM2RhbzFmTWZRMEpxYmQxa3pZT2hNRFBW?=
 =?utf-8?B?ZlBZYWhxMy9jaXEzeWJmM3RWUWtuS2hpTjFpK0JwdE1acG9GRjhDRE1mQzJ3?=
 =?utf-8?B?NHN1VjQ2d2FXMUtzdlQvYkVtZUFnZnRhTWN2dk5YbmRJdWI2aG1XOFpOSGtB?=
 =?utf-8?B?RVhNdjZVRzVpNkNxeWs5bmh3RVJZSUJUeGxUOUJoekwwZTdlVEFmOExDcnJI?=
 =?utf-8?B?ckNjYjZIMHY1Zi9obTJlcXJsTGtmbFlIZmMzeWhGaDJxK2FqV1dlaWZWQmQ3?=
 =?utf-8?B?dEFHYlNsbU9nUGpMOC9pM2QxTElBckg0QTB6RnY4cVo3ajZjRG5ZV1ZpcFZE?=
 =?utf-8?B?bnhpUXhkbW1DengwbE8xWG1YV3dxaXJ6S0k0d1doTnNBL2VxOFlRTUpmanJm?=
 =?utf-8?B?L2VrZjdKSEtBNm9qQnNuNzdNTFZlWmNZK1RhcDdEdnBwL1FjY2ROZjNUQ2hL?=
 =?utf-8?B?dkNoQ3BMajVRcUtaV2xaUUE2WTAvNUVlUTk1a0puUkJlaWdDTFRhZlYzWFdm?=
 =?utf-8?B?aWhVSVl4S2xPVUlET0dISDlKanZIZ200aHphb1RSYklHZHJYbDlsQkgycE5H?=
 =?utf-8?B?b3JkNVFIcm4zaUpWSDgrUWF5YS9TTUh4Z2dLMVRnaTBrTE00Z0xTZStxdWN0?=
 =?utf-8?B?dktNT0lycW43bTVvTXNtTTl5T0lRZlVhcmhoK2JFQy9vVkVBckpSdXFSYkFh?=
 =?utf-8?B?MkJBaHhBaStqWjVyZ2RveXBXVng1NE43SmZRQk9BNHQyeGhXRHUwd2JyQ2dN?=
 =?utf-8?B?T0NTcXhsN0FkYlU1YkFUSzY4Tm5nNS9BcSs4VEg5d0k3ajBkc1ltVDhWcW8z?=
 =?utf-8?B?Q3FwVzhtQkFNQ2cvMGVlZmQ1OEQ2WVpJSm92NUVGZUdXakVZNkl1bE5PK010?=
 =?utf-8?B?alJWbEtFTDRHZzVvbDB1VGVFRmxMaHBiTktKRkxqVDB0Ry9uKzZvdTlRRE9O?=
 =?utf-8?B?YVloTDFGcWlIT2lDeFRzTVhYdlRGWDA2Z3VBTC81cERuV1NRQ0w2TXN1VjI2?=
 =?utf-8?B?VGR3a1dUcDN4WXo3WVZ6OTloaDIzZVBvbXcyOVFmNWVLZWcyc25RcTNUSkhr?=
 =?utf-8?B?d0JaenNVNWoxTnJUUHVRMG5la0x5UE9CRndNWFJnRnkwRXJCWVFqY1VRTzM2?=
 =?utf-8?B?VUQvNEVUMmwxTTRRVXhkVHZUbWJBUWszS2dMZmd2cXRibkxkUytHQVJnYXQx?=
 =?utf-8?B?NUFERUVqSWtEczlOYmFKdVp4MFU4UmozanJlazFnTGdyOUNHOEtVdHJPd1NC?=
 =?utf-8?B?aXNlSTNDa1U5Zlk2enFmVXFVYkowOGVDU240eGVkVXZMSWRnaUtrSWFqTVpK?=
 =?utf-8?B?cXRqc0c3UTZubmhvTGtTSmQ1ZGxSZldKbCtGS1RHWVVSSWZFajlpdWVreWRa?=
 =?utf-8?B?RWQrZ3lDM040VXFLTEtGeEVQVEJiMjFDK3JKVzZkbHJPTkNGdWE1UUtyWEEw?=
 =?utf-8?B?a1QrL3ZqVmIvK0p3Si84cGxKc25xbTROM0NVL2F5cUVPRFo0TjdycHRXSmJP?=
 =?utf-8?Q?PwWvXvuvckEkXbLloj8ASDM1F6U4VY=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:21:29.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16036847-9498-4fb7-3bd7-08dd421351bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 16:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210490

T24gMzEgSmFuIDIwMjUsIGF0IDA3OjI1LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gQUNLLCB3ZSBoYXZlIGFsc28gZm91bmQgdGhhdCBzeXN0ZW1kIGFu
ZCB1ZGV2IGhhbmRsZSBzZXJpYWwgY29uc29sZXMNCj4gY29ycmVjdGx5IHdoZW4gc3VwcG9ydGlu
ZyBtdWx0aXBsZSBkZXZpY2VzIGxpa2Ugcm9ja3BpNGIsIHN5bnF1YWNlciwNCj4gQU1EIEtWMjYw
LCB6Y3UxMDIsIEFWQSwgcWVtdSBldGMgZnJvbSBhIHNpbmdsZSBidWlsZC4NCg0KVGhlIGNoYWxs
ZW5nZSBpcyBkb2luZyB0aGUgc2FtZSBmb3Igc3lzdmluaXTigKYNCg0KU2hhcmluZyBmb3IgdGhl
IHdpZGVyIGNvbW11bml0eTogZ2VuZXJpY2FybTY0IGRlZmluZXMgU0VSSUFMX0NPTlNPTEVTIHRv
IGh2YzAgKGlmIGl0cyBpbnNpZGUgYSBxZW11KSwgdHR5QU1BMCAoaGFyZHdhcmUgdXNpbmcgdGhl
IEFybSBQTDAxMSB1YXJ0KSwgYW5kIHR0eVNbMC0yXSAob3RoZXIgaGFyZHdhcmUgdXNpbmcgc2Vy
aWFsIHBvcnRzKS4gIEl0IGhhcyB0byBiZSB0aGUgZmlyc3QgdGhyZWUgc2VyaWFsIHBvcnRzIGJl
Y2F1c2UgaGFyZHdhcmUgaXMgZGlmZmVyZW50OiBzcGVjaWZpY2FsbHkgdGhlIEJlYWdsZVBsYXkg
aGFzIHRoZSBMaW51eCBjb25zb2xlIG9uIHR0eVMyIGFzIHR3byBpbnRlcm5hbCB1YXJ0cyB0aGF0
IGNvbm5lY3QgdG8gdGhlIGV4cGFuc2lvbiBwb3J0IGFyZSAwIGFuZCAxLiAgSG93ZXZlciwgdGhy
b3dpbmcgYSBnZXR0eSBvbiB0dHlTMSBkb2VzbuKAmXQgZ28gd2VsbCwgYnV0IHRoZXJlIGRvZXNu
4oCZdCBhcHBlYXIgdG8gYmUgYSBnb29kIHdheSB0byBrbm93IHRoYXQgZnJvbSB1c2Vyc3BhY2Uu
DQoNCk15IGN1cnJlbnQgYmVzdCBpZGVhIGlzIHRvIHJlcGxpY2F0ZSB0aGUgbG9naWMgaW4gc3lz
dGVtZCBpbnNpZGUgc3l2aW5pdCBzb21laG93LCBidXQgdGhhdOKAmXPigKYgbm90IHRyaXZpYWwu
ICBQb3NzaWJseSBhIHNoZWxsIHdyYXBwZXIgdGhhdCBpbml0IHN0YXJ0cyBhbmQgaXQgZm9ya3Mg
b2ZmIGdldHR5cywgcmVzcGF3bmluZyB0aGVtIGFzIG5lZWRlZD8gSXTigJlzIGFsbW9zdCBlYXNp
ZXIgdG8gZXh0ZW5kIHN5c3Zpbml0IHNvIHRoYXQgaXQgY2FuIHN0YXJ0IGluaXR0YWIgbGluZXMg
ZHluYW1pY2FsbHkuDQoNClJvc3M=

