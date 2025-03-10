Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125AEC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:51:37 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.87])
 by mx.groups.io with SMTP id smtpd.web10.36747.1741611093641834500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LEoXD2+k;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LEoXD2+k;
 spf=pass (domain: arm.com, ip: 40.107.241.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P1V7pZ5DIi7oggi5hZ3IsYN9+WycBavhiG9P4hlNx0eJOEdPNiM8fJZ31UDD11LVN+cVMiKEwzpNOh5gQEPPfprkBpUBdBXsjnHTcDNnZa4j2nw/dfYzmCwsz9NRB8bDBersgl37GuQ70iiR1x7FyBi7jPDCtztEh3RT/tiEB+BdyJnJynMTi309jrlcVhxDO5fmPnVXXefkv0y/sl/ki9d9uY2RNU7ZMji7DVYMwk8lmDSiqQgpohmzUkSu+3O5iY0qS5MZEHrWrkCXeXPZsfjOAIUproZMrwhxmSL+XTKQQjCS6PeOZTKit4pqQYbtd3VeEmz+Drfp+236EN8SIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXg121OG690oIZyh+hISWGSKnNmNlp9SOC0Esz3OSzs=;
 b=dC3/9jmTaqKHQrbgShcQVO5StAzDaQbfkB2aPpqlj9BEQt3IoowvGEBoH9OiBhdTW2EGpHl8ux54eOx/JmbRIPeEqz1ttaREQXPhDL54KM9i3IOPb8dFAmcBMpuBDKGQ23nQ3CHVvYoOkzeeKkxEWh7BGb8+ZAgkilxafptySlr78JAKzudhYSmfsq5t7XrnXAAV0wivYU6q/tsk8HCieVYTh3DYCdLQIFksgUjlT0BvYIFYiV9EwSHgHnskDrNeywjbh72KVu8MfCED+xvcRDjRr4n0NhYnHQ8Q6Nczsr90GrUhXiDlpthQ8XsbKIgylLXIklgRoBb8vxhrdF/QHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXg121OG690oIZyh+hISWGSKnNmNlp9SOC0Esz3OSzs=;
 b=LEoXD2+k521YMtBeHhQ7X9u3wSGDnWck9n8NRxKk8O21yZ7LkwbyFKy8P0AYdHjNpE/0xjDOKyVlP7zetyOGmv9mNlz/K0Lr0aY9jqQr6I1uY1r1bOfVhNhaGQ7D6DurKANQFVccC2CMIDpCRht4BeP5mGiozTyXP0YUQhbJ9pw=
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by PAWPR08MB9098.eurprd08.prod.outlook.com
 (2603:10a6:102:342::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:51:27 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::bc) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.23 via Frontend Transport; Mon,
 10 Mar 2025 12:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 12:51:25 +0000
Received: ("Tessian outbound 678e42ac23ee:v585"); Mon, 10 Mar 2025 12:51:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 874d5d11123b9b8e
X-TessianGatewayMetadata: wmi7et05BpAIIbwU+jYb1fV5cBsRlDZjpFkHfbmb0cUmZvVrQyIL9UqKwWs9lk9maUyNxyvV1VsicBxxr3hrsbyZaZM2jK+PVYhzFqkkddXlqNyliYaVXszIXlgzi3SaJfhYb9rROpqG3DvrugeSeiRyEt4lcDn4cvlbYk/201Q=
X-CR-MTA-TID: 64aa7808
Received: from L44e146b25bee.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 03B58DDB-5846-4587-B32D-86F4E256CDC0.1;
	Mon, 10 Mar 2025 12:51:19 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L44e146b25bee.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Mar 2025 12:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBQEQ0Ndsu+dGPD8DpO80dzsQHZVaaaPpUW3LXwUQ89pAxA2b8ZHxw63HwTW1xTKLtip83nlBpyUZBCDDP60ii1vtzI6b3s/5REx12rExMZweFux1LI15pLAxO6dOu63PaomqJ/K/aaXRpUFRF2FlHRlVWd/7FvjzHiTs9U+iwPbnn+Fxpznh5r1F9Hfh9uGE4i7d6RoOq3YbAlDUapGimof6f8rvEWBby6HoJvgTZryJtrGwCCGjc27f9IQA6wxWOG4JgGdA+IYROWTcDPAo8czdbn5jBbzPN6PrD+RYPMkcSFgsgsblm4hAyWQcriaG9VEKbKz5JjCVOnJAWYt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXg121OG690oIZyh+hISWGSKnNmNlp9SOC0Esz3OSzs=;
 b=NAWT5Qvdzf33Bj2Gyc6apeBykhOjXKvBFTRTGpIhj8uEWT3t6IwTHkfKr6l7lqEctyRvguhkLvt4y0Jjt0OYUBdpHi6/1st4WkOvNF/Y/P+/z6jl3v21v/5PV36NXrMR6je1cTvcJaFuIsbLq9CKYidw+7xJbf7PGmH2K5M88BMDBQwU7juKZH64Yjphz8b8HTbHhYcGCJGcTO93zjwgPtMzPtH0inWMFJc+etpqwCg3UcJLwNIsuAQ87+LjmRVTG0WSwKoFCxSlWyHeqp2QtOe2Pm/BBxH71Gb0vTqIwLblhEHQ8rB1fM3RH2lljJ5ei68dVh1IE9wVrCDXcKLCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXg121OG690oIZyh+hISWGSKnNmNlp9SOC0Esz3OSzs=;
 b=LEoXD2+k521YMtBeHhQ7X9u3wSGDnWck9n8NRxKk8O21yZ7LkwbyFKy8P0AYdHjNpE/0xjDOKyVlP7zetyOGmv9mNlz/K0Lr0aY9jqQr6I1uY1r1bOfVhNhaGQ7D6DurKANQFVccC2CMIDpCRht4BeP5mGiozTyXP0YUQhbJ9pw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8971.eurprd08.prod.outlook.com (2603:10a6:20b:5b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 12:51:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:51:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] minizip: Add new recipe
Thread-Topic: [OE-core] [PATCH] minizip: Add new recipe
Thread-Index: AQHbjzW+zeFw5hcZ7E6Asf5gF4zPF7Nnd8MAgAQ4GgCAAKflgA==
Date: Mon, 10 Mar 2025 12:51:18 +0000
Message-ID: <9A947B7E-8A39-4937-8DAB-A28EED019B8C@arm.com>
References: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
 <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
 <fdcdab78-ab77-41f8-bc9a-b9acee540e7c@windriver.com>
In-Reply-To: <fdcdab78-ab77-41f8-bc9a-b9acee540e7c@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8971:EE_|DB5PEPF00014B9E:EE_|PAWPR08MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: b8617c27-2d1b-419f-5a4d-08dd5fd244bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a01MUnprdkhVeHdxVUdQV1RrOWtHL0lHYlg3VXZHMmlHZnVmbXE5NDdnUTFJ?=
 =?utf-8?B?YjV0KzE5WnRrWCtNTWZuZDVHRDYwQSt2Z2huRlF6aGlhK04yQ3l6ZE1nRG44?=
 =?utf-8?B?VmVjS1ZwV2NwaVozZlJ0eWJISjF2Yzg5ais0YkJNVUJuUWpBbHlzL3ZFaVMx?=
 =?utf-8?B?eEFYazY2ODRla041eWZmeC9iTWROYnhLMWo4bnRGcnlLR3VwNkdJcU1LK0hr?=
 =?utf-8?B?bHZOS0tYOFdWWGJYOTJRWU1HbFM4TTYyeUdFL3BjTjk0L1h5YUxCVVRuMTF2?=
 =?utf-8?B?amVoWjhGcG40dXBPUUlmdWw1czhDRGNaV2lLb2xkbmZFMXA5eFVzcXpnSFJj?=
 =?utf-8?B?NkdWU1hJbkt4RWh3cE5mQU1CTVBpazhuZk9wV0ZPaFhHa21aVVV5eWxwSTBH?=
 =?utf-8?B?dk1nbklyOVJtNjZkejM5WHd6YUZvYUpkU0xNMW13VWUrbDhaaGxsbmFKK1dz?=
 =?utf-8?B?L0pQbERlZjgxSlFPR3lCL0FFbVg1NEFTdS9SVWRiQjdjN2ZpbFBValFSTXUy?=
 =?utf-8?B?bkdUVS90QXdGR0dRRkw4TG5KSXBtRk93UjZjZkVzRHYwcGVRVkFCVnpXVk15?=
 =?utf-8?B?a0RvS1VJeDhyclVlRjdvZlkvOWJETUYyQUorL1dEVHNkSEJuL3Z6SXVVNzZt?=
 =?utf-8?B?R3p3cW1WZFlaN0laektvblRDUWd4V3ZEdGZNZzFxaWMvR0RpVkZibXYrRFMw?=
 =?utf-8?B?ZUlZTnlJbytMUXQ2d0tQUDVoU0Q5NG4wTjA5OHN2S05WUDNlMUFINXVhYjRS?=
 =?utf-8?B?VFpoS0FCQlFNUjB4OGErZ21LVHZ6U2QvTm9jTVVXZS9ha2hzdW1rYWdFOVRM?=
 =?utf-8?B?akdsaytpcWtBMkptN0lHbWRTcVdGaXhRMWJaT0hrM3VZUCtJUUVtdHprWEVK?=
 =?utf-8?B?Sm1hNS90eFdiK3ZuVG05Y244T1l0Rks3d1Y0YXRqUkNtUzdGOU40NGFEdHMv?=
 =?utf-8?B?aGlseFdBVS94ck5Id3NVd2VqTCtmZWZ1ZnFDUFAwblY4YXlBUUdzWm1CK080?=
 =?utf-8?B?L3RMU0Zqa1pSTks0OG9ZY2FEam4wdnQ2YUVVSGFKMlk1T245cnhOS3lOWWpM?=
 =?utf-8?B?TnNkd2JNMWlZS1RYbTZtVDc0eXJ3QVRPY3UydG5wWkc4azlKaktJbWZCODIv?=
 =?utf-8?B?NHF3M0lYMWJzbThPUGZPRTl5eVc2S3owbE1PVWh6UGFzSFRiYlY2SEF1RVkx?=
 =?utf-8?B?WEk2SlBkRGsyWW4yaFRYR3hPSGlTMFpJbGYrUG55clV6d2d3Rmd4aTdPUW51?=
 =?utf-8?B?eXN5L2VYTmRDL1FacjlhaWdUYkp1RjA2SHNWRXVGcGVkNDU1TUpnN2xvUm1n?=
 =?utf-8?B?dytBdTZxYjY2dnAyQU9obzRocGdVOTZybzExTlg3aEcxek1pb0hHWWQ4TEFx?=
 =?utf-8?B?RVVFTGxxMEtBSDdxakEvS0pEaHI1czIvUXhNeFcvajNocjJGQ1liL2thNk05?=
 =?utf-8?B?c0hjTHViaytmektxR0x5cVNJVGo0eVc2M0Zod1lXNW9US0tsQ2YyNzhNT1ZK?=
 =?utf-8?B?Ky9kR2hwbEQ1TmFYZ2lvbjdhbTUyWE5mWGdrY2Rnc1c3OTVQVnZmQ2tBQnlt?=
 =?utf-8?B?VDA0NlBabXFXTElxRmJqNkNIemU5LzdRZHQyQ1VSZ2lCdjJwcnV5MkR3N1c3?=
 =?utf-8?B?YmVQcjEyQjk0dTIvUEk0ZUNrUW5ZbHV4Z1dsY2RKN09ReFdIVVVQcGk2UlhJ?=
 =?utf-8?B?RW1ScXoweXpUSG1BNGRpN0VjT25UbGlsaFVrV25hM2NQV1NtSU5oSlcwUHFk?=
 =?utf-8?B?cTZGNzVVSW9ISDlKRFRmQTBwUElGR2xCMFo1aTU3MkxoaWdPdzIvbEpKODVE?=
 =?utf-8?B?a09kZEV2bHplc0VVazQzRWl5dGFueTYwNHZoYUhuWDJrYkxaenExQjhRUVdU?=
 =?utf-8?B?Y2l3WWxzanZmK2hvVGpFVGkvS1pvVEtYSVQ5dzJST2hFYXI4aFVydi9hVVZO?=
 =?utf-8?Q?SEpSDDTt+dEFBxxZSJ2e+4B2nuqHK53Y?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BDD966A404AC44E9C265D1B843A4E0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8971
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	056387d8-1bba-4c51-e316-08dd5fd24038
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnpTU2xYeDBDQ202WTBhSWFmMjNOUnhRSkVlOXhXYzNHS3hEdGhOS0JOVFp3?=
 =?utf-8?B?S2RWZWZYN3d1MGQyWTRtVzdzSFpCcHBEMGovWHhUL2pJRlk4cW5KUjdtbDdn?=
 =?utf-8?B?RnZHWEV4U3F0akhLVmJ2U0liUzhMOHQrL0F2dkNHZ3BLVzhLVUIyaGtNbFFs?=
 =?utf-8?B?YjErME0rZlg5cVlBcFcxakpsRURCMGRFamlOWVhRZGhWQkJaeVpLc0Nqdm9y?=
 =?utf-8?B?UGlLKzVCUis3S3lKSGRLYjdNdmZpcnUzN0JNY3plMEw1eTBRMGNqVDlYWUs4?=
 =?utf-8?B?M0tWZUVTYitiRlg5dE1JK0pqRGlXbllzaHNBMmFPbzR4eHIyS3poYTFzWkh0?=
 =?utf-8?B?N080a2dQbUozaVVmS0cyZEdPYytoQW10QVBLOEdXc0dnZVVzU05QUGZ5UWk4?=
 =?utf-8?B?L2JCc3ZQakZrZzFxQTI2bW9LNzFCRDhRTkRBZVV4VnowMzN2Qm15NzBvR1ZK?=
 =?utf-8?B?NDh4cUpoWlk1dTZqOXIxVWJVbU02WmNkVzhpODVhZ0RLWG1qbmdYeFJFditG?=
 =?utf-8?B?NENYOHVsMXRhU0tWbjdNbmxaV1F6QVhoVGpHcVFzeHFIZXkva1R3NVpBWXRD?=
 =?utf-8?B?ckZla0dpMHpOaDVwRXBrbFFVNkh6Y3lFRFBwNWtwQm9PK2RBS3dIZFEyT3No?=
 =?utf-8?B?RWpRZ1ZxN1pPTWROSzVzajlIOW5kYXMxZkZDNWVCVVRESlhTSHNvV1FoUE4x?=
 =?utf-8?B?eGlEU0pIc2g5bmI5WWxiL0FBWGdyTmZZYURUNjcraEJpa1Z0N2V4ODlnR0VE?=
 =?utf-8?B?dm5CWFovNVI1UnppUzk5TVFZM0k0M3RkekV3UW9MdUNGQmFkVzJ5K3ROZlFX?=
 =?utf-8?B?WnMyUXIyWGNiY2FsbFJEeVVGVE94VnNzTzU5SDNWc29xQTF1RXMxcVZPcUVu?=
 =?utf-8?B?ZnBEemM0dlVEa1E5M1AwSERVcThOdFI4Z2dOYTNacUZtNS9kWnQ0V2lMSFY2?=
 =?utf-8?B?aDBmY1lZSitIUmpHVzdMekcwenl2NFVXdjhKTDhNSy9KOWtLZUNGR0pMcmhy?=
 =?utf-8?B?eXZBbE9LSnpobHVJVWFSRFU2QzJwY1hMTHZSSk03a2t0NjFBRjNJL1Irck9F?=
 =?utf-8?B?VTcrYlJJOC9QanZXWXB0TDdoMU5rUW9YUnhtVW4xRGVrUWhPSXAzL1dLZ2Nw?=
 =?utf-8?B?amxVNmNHYkprOWhneHF3cHVOS3BDenBoc1lHc2NiSE9WdjB0UVYrSkRjVjhv?=
 =?utf-8?B?a1J3d0JYUyt4V2hWMVA3YkxmZWxhQTViRDk2enFKMFFPdFE0UGtMQTQrTWJw?=
 =?utf-8?B?aENrS243YURneFUvTzJYNzVkZjVjYVlyUWRhMVc2NlFmSmhJTy9tM3pjTHNl?=
 =?utf-8?B?azNpSGFsRUdCblBqWmxpY2h2MnRodzd3K2hyOHpLcDBsdmpXZTlSOEh3WFM5?=
 =?utf-8?B?S2NaY1NKSDdUdmE1R3ljL3czclV0YjdGb01nVjkwRkJWMk1JUlNnYlAzbVh3?=
 =?utf-8?B?MXVFZEE4ZWd4STNDeUY2UU5GRTA1Y1QrU3FMUGN2SDJSWkNsZlBhcDZYUlgr?=
 =?utf-8?B?eXFBMlpwZ2o1VTJaZ0p6alFuaFNHRm5NWGh3c29yd2k5YzdJL0FwZEMzbjNI?=
 =?utf-8?B?RlgycGF3Mk1xcVNlWFMzN2w1M1RoV05XUHpsbmZ0ZGNVdG9lVnI5cHd6c1B2?=
 =?utf-8?B?ZUZ2bGRFMVZtSlpkSmNsTWZWbjhXTVFoVHZmSnFuZTZqcGUvMkhJZ0pVTzJF?=
 =?utf-8?B?a2c4dEthZnJSTkJLdTk4bDNYZE0vOTRZd2l5K2NWcm9MOTVWUHVFVkMreGJy?=
 =?utf-8?B?dk5EQ0ZQby9LU3FqOUk0bXB4bGtYS013S0dwZFRCaGJURUhuWElhMzVRWUZt?=
 =?utf-8?B?ZFBsSXhuRXIzTE83SHF3TGFjQ2RERlRoR2FqS2VTalpSS3dWeE1mZTNZdmdh?=
 =?utf-8?B?VFBxeGlTQUx1OEpPckVSdzFjK3AyVWRlWFV3dlY3Wmt5RHVlYm5CS2VRelJq?=
 =?utf-8?B?Rmo2Q1ZrZENpWDhLb0VyWEJEU3NXSVdNYUNWK3pMZERDUEZXQVN3OVN2VmMr?=
 =?utf-8?Q?/qlpnbYdXt0N8bC3lnTvryLBdcoj44=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:51:25.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8617c27-2d1b-419f-5a4d-08dd5fd244bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212515

T24gMTAgTWFyIDIwMjUsIGF0IDAyOjUwLCBZdSwgTWluZ2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtaW5nbGkueXU9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBIaSBSb3NzLA0KPiANCj4gT24gMy83LzI1IDE4OjI0LCBSb3NzIEJ1
cnRvbiB3cm90ZToNCj4+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5k
IFJpdmVyIGVtYWlsIGFjY291bnQhDQo+PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUuDQo+PiBPbiA3IE1hciAyMDI1LCBhdCAwNzo1MSwgWXUsIE1pbmdsaSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bWluZ2xpLnl1PWVuZy53aW5kcml2ZXIuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206IE1pbmdsaSBZdSA8bWlu
Z2xpLnl1QHdpbmRyaXZlci5jb20+DQo+Pj4gDQo+Pj4gbWluaXppcCBbMV0gdXNlcyB6bGliIFsy
XSB0byBzdXBwb3J0IGNvbXByZXNzZWQgYXJjaGl2ZXMuDQo+Pj4gDQo+Pj4gbWluaXppcCBpcyBu
b3QgcGFydCBvZiB6bGliLCBidXQgaXMgaW5jbHVkZWQgaW4gdGhlIHpsaWINCj4+PiBkaXN0cmli
dXRpb24gWzFdIGFzIGEgdGhpcmQtcGFydHkgY29udHJpYnV0aW9uIGluIHRoZSBjb250cmliDQo+
Pj4gZGlyZWN0b3J5Lg0KPj4gVGhlIG1pbml6aXAgd2hpY2ggaGFzICJBbGwgZmlsZXMgdW5kZXIg
dGhpcyBjb250cmliIGRpcmVjdG9yeSBhcmUgVU5TVVBQT1JURUQuIFRoZXkgd2VyZQ0KPj4gcHJv
dmlkZWQgYnkgdXNlcnMgb2YgemxpYiBhbmQgd2VyZSBub3QgdGVzdGVkIGJ5IHRoZSBhdXRob3Jz
IG9mIHpsaWIu4oCdIGluIHRoZSBSRUFETUU/DQo+PiBXaHkgd291bGQgd2UgbmVlZCB0aGlzIGF0
IGFsbCwgYW5kIHdoeSB3b3VsZCBpdCBiZSBpbiBjb3JlPw0KPiANCj4gSWYgaXQncyBub3QgYXBw
cm9wcmlhdGUgdG8gc2VuZCB0aGlzIHBhdGNoIHRvIGNvcmUsIEkgd2lsbCByZXNlbmQgdG8gb3Ro
ZXIgbGF5ZXIuDQoNCkl04oCZcyBhbG1vc3QgZGVmaW5pdGVseSBub3QgYXBwcm9wcmlhdGUgZm9y
IGNvcmUsIGJ1dCB3aHkgd291bGQgeW91IG5lZWQgYSByZWNpcGUgZm9yIGl0IGF0IGFsbD8NCg0K
Um9zcw==

