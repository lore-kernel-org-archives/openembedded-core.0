Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746F9C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 18:14:03 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.89])
 by mx.groups.io with SMTP id smtpd.web10.1026.1741976035717305883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 11:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OyqS44cE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OyqS44cE;
 spf=pass (domain: arm.com, ip: 40.107.104.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bITFjL1NK5YQJAfkC2DDPgic/NtDKdIBnHWFE6gnhjndwhIOlTuWucM3caQs0nFGnhy1e+0wGxE3/zHicH41ZkBdrs+2wsprfVakf5QEZ4uTZsrEPG2BcUN5TN5xYPMGkjKjv/5LGGa+4wrp3pKGxrKt2xloxVkfKMb67JRXdyE1hvde0/PSSnhWF8Td02Zdf7F7eTY2aAe2UI4cQHC8MSDG85RLCXgGA0w2rjYBRDvXMLG0xpfYf4lFoZ3LJZqGTBVOFeYxEkgvTNjz4d2LOHyHl+TT0U+vJvuX+nPErQ9gbaqB4VpSwExuJrE4nKQ3e3vzexN85t4tBkYg03DGdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD+BFHskKZx0RZEyFYWNataP2jX24No0uC1kUFaS4xc=;
 b=bf10tLPSy1cQE+3IF/MF87f4wSS2sjrtxHPbCf6Rygs/b/CqH4wvaHRWAbGBlsmjwAMS9WhkCy7VKlCx1tUb1ao9s10irBQdndbZzJCyTciIhUK5x+M/Tr3T4Cu3pHgIpc4UVJXEfuLCIVGwyAVeZwYIOgmEMnhSGrBwuoUV98vu6DGqrv7cpBpn3m30ZMvYnerIzufrXzAXgVzvhU/adEhC28Gij3zZPgxlaS+BfPazAdy/VnsuKhatudi/VHOhnxdKbB9QcwQOnYEN88LSeZb+tUz28NmUJr4hstE3JA5m3D7VNDULD+QR79zNWEgOP0dbpGO1/85GOpXn7JfVQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD+BFHskKZx0RZEyFYWNataP2jX24No0uC1kUFaS4xc=;
 b=OyqS44cEy4KAYmQP/x/B5MTGvQU5UtKkm1fzgr5b7vay9E1l4nfMwojXyS+tLCUQaLuTxAYYI3Ymm6/gwAS8V7jr+G3H/hSnMR7Oxn6TEfWYnlOw/+UPdmeJGdQ1fEf0Jgx9HBwdQHaeTfiYebW9OnTCwDURGgFXhHmTo9B0DP0=
Received: from AS9PR05CA0233.eurprd05.prod.outlook.com (2603:10a6:20b:494::27)
 by AM0PR08MB5298.eurprd08.prod.outlook.com (2603:10a6:208:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Fri, 14 Mar
 2025 18:13:51 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::a8) by AS9PR05CA0233.outlook.office365.com
 (2603:10a6:20b:494::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Fri,
 14 Mar 2025 18:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 14 Mar 2025 18:13:49 +0000
Received: ("Tessian outbound 95d47b41fce3:v594"); Fri, 14 Mar 2025 18:13:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71db19e5ce670a91
X-TessianGatewayMetadata: aaJJKUUu891ZV8R1+Yn0wikHojIEqJjo/wo2byq6sP/OQ+D4/Tencj7kWx+sFc9p1z+swUicRlrXFYwn6/WPqdbj/C14ihxS/EyW4e75DxB59wVFnzqtCaNiMdtSt8CnqfEgPl5JQZXjUFCYvjaq96r3ACHIIEKapJdWe4gVeTA=
X-CR-MTA-TID: 64aa7808
Received: from L7e3545a59f68.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5A42854-F631-4444-A5E6-01DCAE9D1A5C.1;
	Fri, 14 Mar 2025 18:13:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7e3545a59f68.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 14 Mar 2025 18:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3PTsbwx0x37g5jLFYzSkwTTw0KYKBbQF8se549ws6lU7SOo6o/8p/CFeqd1MEBSfi38b26hjMHJzugnDJ0O+haxIhGJxtbpAerYVHbSOvxKBAc5Cxv32/jeJiHOEedlpXqyxbHYXUOcMpFX3NtZK76u15+uijHy8W8+Uwu8Ogl4lUkX1Io++Z+KVN/j3IiUOv4BOZezF4i51defUCjX3/LA+33SQYDFErwG08GReYjQaJBAdxnznUad8KyFbfNeRGiRU43F+SisxoAnkoFFXy7PNKj3od0JBGWzUb1t5rjvA4pYuoxrzW4mqgyKo50bjuufESl/RbD7v/TTy/FoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD+BFHskKZx0RZEyFYWNataP2jX24No0uC1kUFaS4xc=;
 b=bO+R825W7Mgi8bo5zks4eLEHOl3GE8M2i5UT3TEHxakWGeuXcm5K2801D4wYYDehirYEm4hP4LQKGmsDUw6vajQvoBLSibY25JEsD3xPz6wVAOyOAYzxBHdB/odpDbjBQjTmY7jUq2Srf0uAw6rOZzMcDrV3kbBNwQ5lcMu/pGbSWpdGvGH9RvluXa9iOi0Rpeue+m3rzex35S2RF+pbcseA3NEE3RAdOD4KCtF0a5rn5PCnzJemk8p/KPMYwzzxCtuZnWWPaGTgiowOeo7gNRhtRRoM1EJIelxnz/F0zYM1hDs4uboyQi5no+4w1U3DPPjz2MkmAMwGKsxfTDW06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD+BFHskKZx0RZEyFYWNataP2jX24No0uC1kUFaS4xc=;
 b=OyqS44cEy4KAYmQP/x/B5MTGvQU5UtKkm1fzgr5b7vay9E1l4nfMwojXyS+tLCUQaLuTxAYYI3Ymm6/gwAS8V7jr+G3H/hSnMR7Oxn6TEfWYnlOw/+UPdmeJGdQ1fEf0Jgx9HBwdQHaeTfiYebW9OnTCwDURGgFXhHmTo9B0DP0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7886.eurprd08.prod.outlook.com (2603:10a6:20b:52a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 18:13:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 18:13:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rs@ti.com" <rs@ti.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "gettext: fix a parallel build issue"
Thread-Topic: [PATCH] Revert "gettext: fix a parallel build issue"
Thread-Index: AQHblHg6u5A4VQ0n/EepPR44shSYGrNy8KMA
Date: Fri, 14 Mar 2025 18:13:40 +0000
Message-ID: <4AC93975-A859-47DE-844D-C4AD653BAA5D@arm.com>
References: <20250314002937.672768-1-rs@ti.com>
 <20250314002937.672768-2-rs@ti.com>
In-Reply-To: <20250314002937.672768-2-rs@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7886:EE_|AM4PEPF00027A6A:EE_|AM0PR08MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bff982a-e891-47b1-be33-08dd6323f86d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VjUrVXJCcmdScndhY3hSNngvZGlERGZ6Qm1tV24wS2JySGhHb05mdytMdGQ0?=
 =?utf-8?B?ZU50UFNCL3dzcWZzM040blpkRUpPeXhJc0o0enFsOFlQVnEwZnBYQUVhN3A2?=
 =?utf-8?B?aXQzM2R4WHlwZlJDWDFxWW1jekQzTjZsbzQzOUZvc05UanFTQ1prUmdrTlhZ?=
 =?utf-8?B?R2R2M3FKclRoZHRHNys0anVIZG5Oa0ZOZ0tOZlQvMUdhQ29GQTgwNWd1czQy?=
 =?utf-8?B?S0lmNUZBazgxcGxodGRpSkRMK3h4SGprZ1NjaW4vU2pLMll0N2VsNVNublA1?=
 =?utf-8?B?ZmJXVjhxc0JqR3NtOC9UckE2V2dZTHhtRUh5OEd6RHE1L1NEQ3dmWWxrZXdp?=
 =?utf-8?B?OWNiMjNwYTAzaTNuUkxKczIvOTRSeUJtRWpaNkFCbm1wMXprcFpmdmVtZC9p?=
 =?utf-8?B?VGlWWDBQa2VmRkZSZGUyRDQ5TE9LU0NoSG9oRjJpT3pUV0R2Mlg4d2NCMU9V?=
 =?utf-8?B?TFYvREthbFhxQ21KYUxWSDZDeklsbTh2NHdOTTlvZkozdWZJRW8wa2UxMTlI?=
 =?utf-8?B?SWdmZ3BPdGV6cnR5VEVOcytsZkw1TWRxNWlraFBNTmtZU0VhZnJTaTVvYlRs?=
 =?utf-8?B?SE1NL0dOb0FWQXZPVnZvZ1ZmeGNLWXMwUmVQTGpZTmYwcUVCQmpMSUgxZEd1?=
 =?utf-8?B?TUo1NUIwMFc5OXRBNDhnbnBpQWRKSVlRc3JINFZpamwxci8rVlp2RUthT0Vw?=
 =?utf-8?B?YkZoR0RhQ0dXaUV2dlZrOWFLbEdsSGVqNlRCckZOS2RwMTdwNTc0ejU2VHpY?=
 =?utf-8?B?TkJDL1dEeUt4R2MvQkV2Z042aGZ5UlZMa3h2eEVISEphbDlEMENqcGRkOE9V?=
 =?utf-8?B?Y25VbklYMEEzeThJdFVOWFdkK0ZXcTcydXVQb2tSS09PSkhSQ1J1SGhkbHNr?=
 =?utf-8?B?czZUZ09yOGNjWDMyNHhaanR0cHNvbEtuQ2twSHYrS21zMEMveUg3UFNBRnND?=
 =?utf-8?B?M2ErNXhVQ1hSSzRRMnh2MUIvTEdoR1lIaEhyeEZQR3MrT285aThaeXg5Nko0?=
 =?utf-8?B?Q3IyUzVaWkt5ZTRSbUlhdkpzZDBtalBrMkZYaCt0QVhqakxXK2Jiek5zejB4?=
 =?utf-8?B?N0hVWVRRaTIwcEJwTHNzUHBVWFg0RlZoQVhPKy9YMHBoU0xuWStCV2NFN0ds?=
 =?utf-8?B?TlZLTmpzYklPeTRKQjREa1FqSE5YTE0vU2tqMEwwSmlUeHpVOUVPcFZ6bVA1?=
 =?utf-8?B?dDlFVy9McWMvd0h1YWZoMldYT0RtTHM2QVlmZWZNdERqenljMEF6eTdOV1Qv?=
 =?utf-8?B?cmZaZmxIdnNhekRReG53dFRCOVFTNWVabnE1ME1TV2t4Vm9UWGQ3R1hOamlC?=
 =?utf-8?B?bEhpS1I5VUhJUlFqL1NqSU1XSzNvaFBNeTRPZGE1aW04YnBLRUtqb2VaRzc5?=
 =?utf-8?B?d2pPaHRveDc3dDdiRktHZUpNK1FoT1AzSUFXU0VKdkVoWFlJb1J3a0NoOWhL?=
 =?utf-8?B?REM5TWo4RjZDbjR0T1ZNR2I2bnlvaGFRSExhRnNtZVAybm4xYzE4UlVBMVYv?=
 =?utf-8?B?M2EwN3FHZzYwYVE0S1EySWFpQTBvR0ZiK3FDNnJWMjJ0VGU5L0tBZE03Rkdn?=
 =?utf-8?B?QnB4Y1kxZUlaZ21DSUdvd3FqZ00vOVduU2JJZkd5NEwyN1RRbVNDOUZPWlZm?=
 =?utf-8?B?SzB2ZkFtUE1EVFozNlNaMklEbGxaSUI0UmZuaFpwYjQyTFNtRjVrUEpPenVz?=
 =?utf-8?B?Y1hCK2N5d2djUlRpcU9OWE1qTEFiaHBpWXVGdmJUbnBTcWZEeDFHVUpvWDMy?=
 =?utf-8?B?YTNqRXl4OU1vUU1DWkJPOFdqNS9KMittUzNJT1FHK2dkenFOU3F5aDV3YnVt?=
 =?utf-8?B?WTIwSXk5aUVoS3JDYkhsRERycnJ4KzlTTEwyd3BHaSt6NWFHRS90Y0pDSFBj?=
 =?utf-8?B?eXdnZEtnSGNqcmJVS2tIZC9lN0VlYjhJMTgvbkZ4am1WTDZnaWNNRDRZeHl6?=
 =?utf-8?Q?w5M0v0Mg0FogPpBbmIZgy3dSYbUSnhzN?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAD38B163F27B442AC91A4B3DD68C6FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7886
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e85f8354-649b-4ca7-9460-08dd6323f2c4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDBwajhINkdobGk0WmxjYzY1NlZkVktuR1RTZUpzY1NyVmx1Qkp1eFdSWlRh?=
 =?utf-8?B?VmVYeWptSW9PZ2FZdUZhL0hZN1FUUGg4ZTNEb1J1b3VJUnR4Ym1LU0YyMmZp?=
 =?utf-8?B?cUZWYm42TUtHMDVVNmx1VDhKTmtQYU9zM3kyc3F6SkNiWW5RZDF6NDNlb3E1?=
 =?utf-8?B?RjZjbEdTc28yQTZNSmZrZVJmU2ZnMXJwbnBpbTFPZ0lQTDd2aVBnTTBrcGY4?=
 =?utf-8?B?eWFxbHBGL0xtcm5mZGNadGFSV3FQeXJpeElwZ0ttZDNtSkMrMG50VDduaTJ3?=
 =?utf-8?B?anA3cDlLZ3ZlQTZwdDhPdFk5WHhGbFVYM0xYOWtMaEgyUlBuZDBQWXNGWElB?=
 =?utf-8?B?TGR4TVNVMzd2MEprQVBqNWhncFp0SDdyRmg1TWxtWDA2Q1k1RDRxS0hWUngz?=
 =?utf-8?B?TytsQXIxVlVUR3FxQTBrMnV5dVJyY2F2d2lrVGliaUxGT0w2UVFzYTQ1MWJz?=
 =?utf-8?B?RFhVVzExNDE4TGhTRHl4MGJUWXh5NnAzRmttMWphMUpsK3hQOTN2eUZDRGNs?=
 =?utf-8?B?NDFrRG0vSTRtbGs2bDk4ZXNabWRyYlNPNW9pbWhBTkduaFJwcFlvWWgySHJC?=
 =?utf-8?B?SU83N3ExQzBXdjUyc2hNeVN5ZVRYTU1xQ2NUUTBSTjZvemtrSmVoNFF0YTBX?=
 =?utf-8?B?UVB6dlpDdG1qbGlzTnFZMzhPVlpzdytMRVNWREVOdncvYk0wOFZqQTFMbW5i?=
 =?utf-8?B?WTgzZ1BYTVdtdVdTaFBibGMvbG83emlMVWl2a3htRnBrVVJpdTYwN2JFT3Fo?=
 =?utf-8?B?Z1lORUNjU2M1Zm5vcEJkVWhua05DODBJclEvbUFrNzAyWThleU45WUJybmtw?=
 =?utf-8?B?dkJsUFhxcEVxa0ZUNW5CalJsbFVjeXFuaXBmeEhHVHNRQXlXN0UyTVdoeGti?=
 =?utf-8?B?ZEVLM0p1bk9BaVdVY05lY3VhVTlQN3VQUmw1M3ZiYXJ4TzUrZzZvY2t3TDFD?=
 =?utf-8?B?alpOb213eDZrOC9JOGxKYU8zSUJGbVZUbTI3eE96RHJna3owUUkxdFBPSnhu?=
 =?utf-8?B?L2w1Z2JvMUlKNHdTb2RWUlRqRElsVFBvN3UzT3lJamlwSFhhS3JYMEZDMWI0?=
 =?utf-8?B?dHlsOEFwemVUVm1NVVNzR1pCVFQ4bHQ3QkVKYnZFb2x6Zi9EKzYyWHRFbVZF?=
 =?utf-8?B?K21NTW1UNFd3V1dvdDRsVW9NNW95QlhDb3lOdVA5MVVWbFFDbEhlODZZUjlL?=
 =?utf-8?B?alhhQXZTdGF4MVBZdTQ0UUpOdWp6TXI1T3orQWlSU2FBVGs4aDNlNnhieFFF?=
 =?utf-8?B?cUF4blFzNFREZzNHZ09INkFQazc2OXNEbTNweUxMWGE0YlV2TW1iQzV4dlJq?=
 =?utf-8?B?YmpqU2dZUVFUZytTazJNN1BzZmpDb2h5N2N5NDJEODYwY2JwU1hpVk9mRGtq?=
 =?utf-8?B?cllqWlQrUGRVSnd3RzVqRWE3TjdBMjQrYVh2bmxxNXNycTJyYkxVeGJuSW1w?=
 =?utf-8?B?OHdwU25talQrTGZnUmhJckFKYlFqTHdIb2xnMW53Rkw2SFBhYUhXUlkzT3lQ?=
 =?utf-8?B?YjhCejNXZG5vK0R1OU80cFZWU1BGMnYvcnNBWG1ldFlEZUU3dllrVmpjcnla?=
 =?utf-8?B?VVE1NTBwTGlTaFNMeXlnR0lJRm0zNnpScVYxQUpTTVRwQmYvWld0cEgrN244?=
 =?utf-8?B?Uzl6TkNkdGlnUHVFUlpwcldEdGh1c2tGZUEyRlRIMGlFNkphcTl6WVFsU1JS?=
 =?utf-8?B?emxCUjZYY2R4Z2pkSUJQRjZtSkpUTGJ3NVkzNEFNbGlHVjlUM0VtR2F5QTdF?=
 =?utf-8?B?VVl3enhQdVRyb1BPT2lYVDhIMUpKbDlnQlVYZnBkNVBhQ1lHQjJ2ajZHcE9D?=
 =?utf-8?B?UGNZTHJPSms3NHNSUUFBOFhzU3VLVUxnditOSlZEakNseWZoWGlMUTh3T05P?=
 =?utf-8?B?S2xQdXFUY2dqSGpJQ3IwSm0wUTdPNitjUlZmZEp0RkNTbGNaeEI1TzFvWit5?=
 =?utf-8?B?MWdDTDhCRkRtQVliQW5aLzRmYjl3Yk5IaDJZQ0pxV1ZrdFhORk45Yjg5MWkz?=
 =?utf-8?Q?QhSaR1OnVXu3hznmOx4+DR3J/7wvjQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 18:13:49.8956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bff982a-e891-47b1-be33-08dd6323f86d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 18:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212856

T24gMTQgTWFyIDIwMjUsIGF0IDAwOjI5LCByc0B0aS5jb20gd3JvdGU6DQo+IA0KPiBGcm9tOiBS
YW5kb2xwaCBTYXBwIDxyc0B0aS5jb20+DQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0IGUxOGZj
OTZmOWQ0YzBhMDUyNWMyMTM3MWQzZjM2ZThkZmUwMDhiMzUuDQoNCkNhbiB5b3UgZXhwbGFpbiB3
aHkgeW914oCZcmUgcmV2ZXJ0aW5nIGEgZml4IGZvciBhIGJ1aWxkIGlzc3VlPw0KDQpSb3NzDQoN
Cg==

