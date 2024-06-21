Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1B2C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 13:39:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web11.73315.1718977134196969907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 06:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EtixUpt3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EtixUpt3;
 spf=pass (domain: arm.com, ip: 40.107.21.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z2FRmWR4w/cBwuoyPZbRg8jv2U1o/feh4Gs16XrN66/Tqg2vM7W6eTJ+5HOBX064NgdOy7bNYR/E4HldHwrxjAjZ8jNkHgiUhQLFmfPHCMTw5b/IZvywfoiRS3Y2BbK3R79nMpdfTGmyU44+oTALVXvnENjQpUmfRSpmVCxAW9bB9myqgms0tqWsZfM6f1G7Bkql1RG+gQUtHGgzMzmYvm6GdIPokh1SVus9RCnrhd7H9q/kywexCMOXaQzgp7nf+EppvBPvl6CTlzVcn1jU9Q3Emr7Y8iSGXKNcmt2ExabGeBysLO/WeZqTqXPoTMB72pHMLd8akfdXp1BxPF6k/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnPu24/gPRIkfACUFR0y0JyJNWlbF/4O0SonOQ2uFWo=;
 b=XPSU/8lrSzyFgnH/1C6qBIGSP8RbAFtdX2b3W+e+k1Ar76Gf/NBa0AFITgyT1BibNcqlrmqI+Fuw7N02WIozwthsjx6VCErKvYa62jWnFMyiLQn/hQwmMXYFqXqY/ma7Ygsu1f0/mmneVgMuvN82dST2FaYo4gYheGEZpbgptjIcDh5GOiEXnmBYCAZqBLCp9sFZ1y6+0RQQIgTqZ9x89T8WjpXv0vQH0fk4qJ28E8Zwue5I3GoH47nRd+rI6CWpfW2ABey347ofxu7Q5FU3I7ZbslBN9P+LoYnCapOqECCrYYAW9RF6p+qzieRx7WJ3sAz53JfOR++lt23KCv3g8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnPu24/gPRIkfACUFR0y0JyJNWlbF/4O0SonOQ2uFWo=;
 b=EtixUpt3nrYZ0uOHhSCBqMggv2wuPKJZcnpN6+cY3ofTSVsVnpKWfosaIelFnP5ja0IHXqSO+mJJfW+c24omMEvy2Dei1QmA+OrlnsZmFSQSTGdNqgZEpINwfWyIAF8P91Lm0KQDlCITUQlvgdjvLv68/6MyO0AuL5CH8vrzrfo=
Received: from DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) by AS8PR08MB9840.eurprd08.prod.outlook.com
 (2603:10a6:20b:613::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 13:38:50 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::41) by DUZPR01CA0069.outlook.office365.com
 (2603:10a6:10:3c2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Fri, 21 Jun 2024 13:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Fri, 21 Jun 2024 13:38:49 +0000
Received: ("Tessian outbound 1f4b4d2dc326:v339"); Fri, 21 Jun 2024 13:38:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab379809f90d89b7
X-CR-MTA-TID: 64aa7808
Received: from 3c9df1a93203.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9797C255-21E2-4615-A276-1E5B755643F5.1;
	Fri, 21 Jun 2024 13:38:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c9df1a93203.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jun 2024 13:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsY9Ipj56ASHyflP+CqA1KEHJejjAoJ1G6V0UDd8ccRXx8rcTdLaVWbbl6A9mO6Yom5fhLP/p0s/a6cPZR90kKsfAiH27u73tGDdfDHxVpjCdzAnXF7U9+M8A7078qkorZYLpJOfta17ylNQmUijQchFUj4cU+MPoTN/SQ7E65aT6tQnJKGttVuT2PLbp5yZmkHm8/0bnyHaxfpw3KpUkSUwjYqtcmGF87Fyuk8duJ5oxtOUeQOZ4s5gGOQWA6ePZV7pE0zH1whLJbUg9tgnVZ98hutzf6uXB6uNfGlI1AqpRPhIg/E/M8WE8F4mxwEfgnGx9kHBejoMr2kwHOdDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnPu24/gPRIkfACUFR0y0JyJNWlbF/4O0SonOQ2uFWo=;
 b=BfDg1HwBhVuMtL0qqNCvIHzyiEdKrktX6oKMigGP0k+8T7o8xQmOplMUxuMDVCVyW+RopzMMKerc3XrpIf+nx3xGwdcKxaLhxbbIA/eCR81Ol9B9Y8ro7WuxFLx8J01qnisO3va8yp+7y/ufDep6NrCu7xfg1zBpk6ctgWkbRthh16RTfLYWpoNPAv0HnHUnM8eCdN39ScYSYRgcDUXjWe5TLt3a7Wh9fJOXQTQvsBR91IQ/Ha62+oIkg/VGWYyDJDOvyN5IagW/68I0Yd7BmcFzMqtp+hHbrRn/nWcXVtKeOkHyV5bOkvKLIvDPkYiLIwdZ/NTf5D47DWEmrZ00DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnPu24/gPRIkfACUFR0y0JyJNWlbF/4O0SonOQ2uFWo=;
 b=EtixUpt3nrYZ0uOHhSCBqMggv2wuPKJZcnpN6+cY3ofTSVsVnpKWfosaIelFnP5ja0IHXqSO+mJJfW+c24omMEvy2Dei1QmA+OrlnsZmFSQSTGdNqgZEpINwfWyIAF8P91Lm0KQDlCITUQlvgdjvLv68/6MyO0AuL5CH8vrzrfo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9457.eurprd08.prod.outlook.com (2603:10a6:102:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 13:38:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 13:38:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC][OE-core 3/3] linux-yocto: update CVE product name
Thread-Topic: [OE-core] [RFC][OE-core 3/3] linux-yocto: update CVE product
 name
Thread-Index: AQHas1rMmb6GxzbpikKNz7fjSPvvH7HSWeUA
Date: Fri, 21 Jun 2024 13:38:41 +0000
Message-ID: <689FBA27-0A4B-4391-9640-C910BFD3766F@arm.com>
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
 <20240531130128.1258909-3-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240531130128.1258909-3-marta.rybczynska@syslinbit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9457:EE_|DU2PEPF00028CFD:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a030055-9de1-4cb1-f415-08dc91f77bba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WG5rTUhxbDRHejVGWEE1YjVOWTRVeUdBbEVjU1lOMVEwUkR4V2gwbnNMOFEz?=
 =?utf-8?B?R2RWQkV3K2xzYnd0T3U2anZKZ01mN0RQczJPbGkyelJOb2RrMmowalA1MSth?=
 =?utf-8?B?bXhKSnVxNUV5SzNhaWlQOGJmdi9mRThodVdMTnY4bVpwcmFFWTJuNUxYRFR0?=
 =?utf-8?B?ek1mTWxoaE9qMEg3ZlZ4cUszb2o3TVVSQXZqS0pqbFdsTjVMZVpXNDFjMWI3?=
 =?utf-8?B?Lzh2bUkrVWxjZzRDekN3MUI5SS8rZlFkVkdQQUphR0d5OGVBelRrMUo4a25L?=
 =?utf-8?B?SEVWTjROV00yR3FKdjNsU3c3WUFCKytzOXF0VS9GWE9vcDBiMlJVbitFSk4w?=
 =?utf-8?B?U1pZeFYvM3ovRE9qSTJPK1JGU0g1bnFsUWJJbUlLMC9tUTRvSWp1aDNQalFZ?=
 =?utf-8?B?bGNkd3pMTWdEWGZJZ25zVDVBd2xuUzFQcmpFV1hocG9URG1HSTBHZXhzV25w?=
 =?utf-8?B?U3ZVRnV6Z0dIWDZ0c25Gd3N3d29JZ2ZCeGxaL1B0ajdZaWpxVE1LOGhUSVNq?=
 =?utf-8?B?SGdBdndjcmdNUkl5amlLM09nK1c4eUsySTBUTXd3L1pxL2ZlREQvZ29kQjRR?=
 =?utf-8?B?SW9lbVBFTUdqbW5VSWowNjNZNE1RbkxwZDBMdXoyYjdvUWZOYllpWkcvU1R1?=
 =?utf-8?B?TEd6K0NwRUM0YXZ6QVBxWU8yV1BtSzNFRVZSbmhsalp2UzdqazJPTnFLZjlG?=
 =?utf-8?B?QTNiS3FTTUxNaSsvd1ZJRWUyRzlNRDdjbyszTnhzRXNJL1k4eVNzUHRkd0dX?=
 =?utf-8?B?ODYyTUhSVWZFbDhmZXJmV25uTGk4Z0xjVmVaTExTWW1Jb1JNaE00TUZHUmwv?=
 =?utf-8?B?OFFPYjgvN29HMjJnVWUxeVE2SFE2VVFVZVlXQm9pL1h4cmhRVTdkNlhCckJa?=
 =?utf-8?B?azdxemROSDd0dkhwQXhMWEplaWtqbVYwZ1lsbXFYR1M0VmJEQjQ3N2JtRWx4?=
 =?utf-8?B?OG9zR0ttbmwyWktaVy9aQUlEVENmWVZVd1V3aTFvS0s1Qml1bHE4R3JoczR2?=
 =?utf-8?B?R0FGM3BYUGxSTnIyTjBGUGpMQXFLRmxjS2RuMXBxY0RaVFVrdUNxOUlJVVh1?=
 =?utf-8?B?ZUJpV3VWbnBDSnNsN0d4SEFVQmtrajRydm9jOGJYbktKN0Fwd1M5Q2RZVUNQ?=
 =?utf-8?B?OTBLWkQvSFB6anNsZUVha0puV2tjU1NBMlE1VVM0ZWpmS0FnKzRLZmgwTXRZ?=
 =?utf-8?B?Zm1QYVJyMUkxc0tzcVBxdGRIUTFvYStmSEtGOENMc2dkY05Ua2V6QWhzZ3hk?=
 =?utf-8?B?dUZDL0EwbHB6a21SSVh1TlFFazF4YWNGSHRJRWNYa25kVVpHa0RWaXVzVGZu?=
 =?utf-8?B?ZitoWjhVMUJOak56UnhWTkg0c09hVnZrSElQQXRNdE16blhXbDJmdzE3NWYx?=
 =?utf-8?B?STNwY29SYW1GN3hzcHhhVENuSWxGNlhjODJOcVdjV2VxdlI5ZVRLUHhtcmEv?=
 =?utf-8?B?RWF6V2xWbGpsUXdDdGtmemVtS3dDWHp2TWQzV0tvSy9ad2NUeW90Q1pMVytk?=
 =?utf-8?B?VVhpbklKaGo2STlXVjl5VmpUR09nTnZhcU41MmJLTFliZGlCbVZkMXlod3M5?=
 =?utf-8?B?MEhjM0NvL0VPcllIWE1wWWtvTEJnSzdlMFZOQkUrR3UvSVBEeFhtSnpWL1cx?=
 =?utf-8?B?aVdnY1gvU09Pb21lTHMvZllEc2QvN1VSb3gvNWRVeE5YNG43dkJPYWNEaHFp?=
 =?utf-8?B?NE9saVVuR2ZkSkxxUmJMVnAvSUZuZkkzTnpIZEVCakhObml4UlRielZLcG9Y?=
 =?utf-8?B?cUx6MkMwNXhHTkxJZlNEQVRWSWR1K3BaeFNDT3JQYkYvc1hQRkgvWk1BOEts?=
 =?utf-8?Q?k7rrUJFzhPP7DDjrm3ih9DX+QhNrWRexhCHAU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5289CC2058C3584E9047F1CD1E956D49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35e64b88-befc-4625-8cec-08dc91f776f2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|1800799021|35042699019|82310400023|376011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHVTTmpkK0NjY0ZhbkpXTUFRQVFXSkxSZWNja1BWc0xXWldEclJxKy9nQ3hL?=
 =?utf-8?B?RGl1bXhhc2M3SFhuL2pGZzd1ZDlZODV1TzBWUmFSOVNpZkFsM0pLK2RDdmhr?=
 =?utf-8?B?N1E3WDhvN1cyOWpMeGVtL2o1QTJiZmZiN2FGUlhvZFdxeTI1aEltc3ErTDQ1?=
 =?utf-8?B?NWU4QmpZWmRRbGx2eTdWMmJRbzNjWTNoZHE5ZUJFVGxlU1dhdHlOd00vZEdF?=
 =?utf-8?B?YS9CZDRoTWtyYXgzN0xaVUNldTkrUXRxK1FaUmFSOHNuRUlmemVOOUZIY0lo?=
 =?utf-8?B?K0R4d2dndlhldDQzSVJZWmk5UjRqSG1XbVJZZzVvYmI2VlEzZjZPcGI0cUZO?=
 =?utf-8?B?WWxYSTBQUFllajZjRlFKblY4TGxwVmR6VCs0R0RmaFczckV3cmdrZnIvbE5y?=
 =?utf-8?B?eFM2SmFNdmZiVUFRYmVEbnIzQnVGbFlvTEVyTkFkYmFWQUdwNGtoNWJVdTEr?=
 =?utf-8?B?TUJUMWJUR0Z2TFlaZXhycy9PMWZoaVk2MXRqeFRITE1RMmwyVnFOY0cxbUJu?=
 =?utf-8?B?Sjh2QlRUbDlvR0N0WHg0aW5Cekc2QWpqOHFKcTdRd0FWak90dVo1cEtnVVdT?=
 =?utf-8?B?cHZETzMvUkZaeWsxZ255N1BxLzZQK3Y3dWpsdHBheHNTMUh2UEdrUHpVZG4w?=
 =?utf-8?B?b3BTdW5POWNvSzRYQ2QranozdFB5b1RIcksvcVRtdU9yRzU2bVhhQmNQNnl1?=
 =?utf-8?B?RWJpY0x2UVFyeHE0WmRENmpBUVVmOW1BamFKaXM3SmVzdCtjZUJuOTZscU9n?=
 =?utf-8?B?REQ5LytLWmVscmlad0ZTS3Z5cEhwQVF3bTlRd1ptcSs0ZGVNU3BDTXZBUlYr?=
 =?utf-8?B?S1NyUHdLYzhUMVJaNmROMGYzVGtWcWQ4N0lJZmlnYkMwRUZpdnJZcnR0RWN1?=
 =?utf-8?B?SHVlNHFSZWZKdlFiK0cxUEpaNlFnMzlwZ2V6Q0FHWTJjVnlrVVZBM3BYeldu?=
 =?utf-8?B?Y3ZhNDlUOUgwaE5UNjZaWVlLcjEya0JEZ2VIVit6RGdwTW5GQUhRckI5OVNS?=
 =?utf-8?B?VzBwYzYyS1ZMQ0kvb25GT09JbkJ0MFNVNWIvNGpqVmVSa2hTb0NoM2Y3Nmdh?=
 =?utf-8?B?cEw3Y2xrOUQxbE51SkVHd01aMTI5RndxSDFsQ3lORW5adS9XZGhjTnJWMlpO?=
 =?utf-8?B?Nkx6WjdJYW9Ldm11SVFTUE8yREowSFdaWjd3TWQwYms5R0l0bW9uR1dLNGdv?=
 =?utf-8?B?NWgwQkpFekc3Y2laNWZHWEtZZDgxV0MzdWZFTnlqUU5lYzBqT3JJOVVzOEtB?=
 =?utf-8?B?NGFBUGxseGM1ZEpGREhKK3dmNmIrdVFVV2I3NkpOM3dhczlzRlo2d3U1S09x?=
 =?utf-8?B?eUpjN2lkclIxUjRTUkx2bzNlUDlTYXcyOGc4dUFrN0xRQzFkOTBXKzNqY2s2?=
 =?utf-8?B?VkdRMjNlMUYxVzhGdHJqWGpkYW9DSVpHV0F6WTJRWDNRbzQyNGJsYWVTa1Qx?=
 =?utf-8?B?QkxwZVFxUTd2dFpnM2dJemx6TlFRNXR3VUl0OU1XUSt1OGVSZGpkQTFqckRF?=
 =?utf-8?B?MXQ1K1hlbHdDQXNQZ0x0bDVFS2IreWI5RjFiRzVpTXN6ZTZ1YisyL0ZsNnc1?=
 =?utf-8?B?dGsrVXgxb004bUIwVXByamxrWGswejZYT2k2TDJNTUlCdURJNzZub0pSZmps?=
 =?utf-8?B?Q3BZMlhOSDZvYnpsaE51ZU9laU4rb1lvVkZFN2FlYmRmaWlKN1dOT3YzZEx5?=
 =?utf-8?B?dzV3T3JuRjdZaVl6TzVCSXNjalFadU1IWUQxdW9LbjcwMmFYb2RKSkVUeWt2?=
 =?utf-8?B?UWQ0a2h0NFhVUGVlUE5pZGltakt4eFJ3VXY0by8rMUE5R1h4amk4TUIwVnkx?=
 =?utf-8?B?QkFvQ0oxaE04OG5UaDhScXdJdjdCUVdYVXJ5UDRxMHdIQUxNQ3dZc2FuaXB0?=
 =?utf-8?B?NTR0aG8xV1Z1OW0wTGsyVHpITDc5ZWVnOExkVEZpcytoY2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(1800799021)(35042699019)(82310400023)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 13:38:49.8567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a030055-9de1-4cb1-f415-08dc91f77bba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 13:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201024

DQoNCj4gT24gMzEgTWF5IDIwMjQsIGF0IDE0OjAxLCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IFVwZGF0ZSB0aGUgQ1ZFIHByb2R1Y3QgbmFtZS4gVGhlIG5l
dyBMaW51eCBrZXJuZWwgQ05BIHVzZXMgc2ltcGx5DQo+ICJsaW51eCIgYXMgdGhlIHByb2R1Y3Qg
bmFtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcnRhIFJ5YmN6eW5za2EgPG1hcnRhLnJ5YmN6
eW5za2FAc3lzbGluYml0LmNvbT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgv
bGludXgteW9jdG8uaW5jIHwgMyArKysNCj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9j
dG8uaW5jIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by5pbmMNCj4gaW5k
ZXggMDEzMmZjZmZiMy4uZjQ2OWJhZThiZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9saW51eC9saW51eC15b2N0by5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
aW51eC9saW51eC15b2N0by5pbmMNCj4gQEAgLTksNiArOSw5IEBAIFVQU1RSRUFNX0NIRUNLX0dJ
VFRBR1JFR0VYID0gIig/UDxwdmVyPlxkK1wuXGQrKFwuXGQrKSopIg0KPiANCj4gUkVDSVBFX05P
X1VQREFURV9SRUFTT04gPSAiUmVjaXBlIGlzIHVwZGF0ZWQgdGhyb3VnaCBhIHNlcGFyYXRlIHBy
b2Nlc3MiDQo+IA0KPiArIyBLZXJuZWwgQ05BIHVzZXMgdGhpcyBpbiB0aGVpciBDVkUgZW50cmll
cw0KPiArQ1ZFX1BST0RVQ1QgPSAibGludXg6bGludXggbGludXg6bGludXhfa2VybmVsIg0KDQpU
aGUgY29tbWVudCBkb2VzbuKAmXQgZXhwbGFpbiB3aGF0IG9uZSDigJx0aGlz4oCdIGlzLCBidXQg
YXMgdGhlIGRlZmF1bHQgaXMgc2V0IGluIGtlcm5lbC5iYmNsYXNzIHRoZSBjaGFuZ2Ugc2hvdWxk
IGJlIHRoZXJlLCBzbyB0aGF0IGFsbCBrZXJuZWxzIHVzZSB0aGUgY29ycmVjdCBuYW1lcyBhbmQg
bm90IGp1c3QgbGludXgteW9jdG8uDQoNClJvc3MNCg0K

