Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59301C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:27:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.web11.51128.1743085637311860576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h5SQs6gJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h5SQs6gJ;
 spf=pass (domain: arm.com, ip: 40.107.130.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q13qTphk1WJks5qZZ2aqElKB5lZEg8qYFGtJIAxijXxBgsAoDV/FpGnFn5sunEhgWrNxwPZy83/Cwi8D6HqrdKN2sMSHXxHysw0bDCF4b8UL6rALfkG+vNkInftQSZkBmdOIxcWtoSgryftgSygK/AHo/leDDPgsYiQ+vc9/JLVVOSaC61uTZewPk6aAqGmFbUahCI154UMknjBkHV0fjU11V0KuATJiio/m9OcfxSLzIsS+8yP3sF5JXaowLmomvsk+cPbippgRzXQQwaSDCH5J4XbGbAcVmOioVIQsyeEb9BT8MC6sdaZ9u38wc2JrIAgqhAx1KgjdLY2P4Rkhow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PVMOrfOwGADvPTHQB0YXnjD6dRUnJRaKwA/GzHcRAM=;
 b=HQ19Bcwa9OHuMtXGq1M6i1BVHb1nrdbryOGL6KQ54ypC2C0x1PqO2YOHSZ12tWPI7UT5gX8n/biiwB2+acvrMQmA1TVwyKh0A53Iy/qnXt3DK+jCzAkQW1nAjO9/laR3LKG7alCj5Ya94jCKLak6BQZHwhwTrYz4E/v4X/D7k1XLG4sg7+26DAY/fsKLr89uhZHPck99Vr8Wn4P1v9SMeete3orzxjN7DJyMIPVlMK6VfJ9cwWvHJB60jGUk4JgNgyCV8PH0mHS91DTQ2J1pRKCPyX8dc/hDLl8ZJ2CYpHL1A07rDajzij7yhki3V0RyZvaqkIASJKywE+4cGQUlmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PVMOrfOwGADvPTHQB0YXnjD6dRUnJRaKwA/GzHcRAM=;
 b=h5SQs6gJ1WdhzMF11lIF5AACoCJNAdwf41Cxi/zPxyoBiTxQCZ8o7hHfyRjfV2dxHOpKivi6NhV3zmKo88YvDcmSokQggIl1TvEhEOf+Tf7eIMF4IwDeko7IPW0shzvJpk50gT+aZti1ZoQwphgpnWOjzEn672HYc76R3otJqZk=
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by AM8PR08MB5812.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:27:11 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::43) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 14:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 14:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVBOJODOS4/HV+Iv4FdwO6h2iX0d2HoL7fdwK9Dx8CPfTwMTmgJHlYDHdtMCk+EO4BHCq2S4QBsTrw3/C7u8F7Nwf0pUQPWDJuTYDPawFJdb8pbbHVZlYUTpCcmWshbhVE5K7C2w+gZtowMBiTpqdOE28LE41swcA96mRZRBMavHl6Ww+DAPeNjJnFqZw1Zj4Xtx37MohhuY2qhP4otfvYowPe9YUR3I4rrWhSRrK+Iv3bg3mazQMPmFl8qLbgdHodS2A7R4vdJwYarJ3GtEZp/XfCdnz9aRLQOC5zvy1qhk8lhCPFC2ZBOPjlJ5ag4TJTi2YHKSt88rSUCpToC+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PVMOrfOwGADvPTHQB0YXnjD6dRUnJRaKwA/GzHcRAM=;
 b=OU3exNkxqwIpRfkBlo64Uy8GY14Xr8U5nDUMMISUoJycNFQ0ILcJ+qx9GYwd6p3VrMyc55Xy/TRWZ4x+D7BXk8blaqVE5J3UaCTWNU7ndXgTS1Ta0P7itb90hLfVmg01CmY6sQcZjNS3fYyUaMqwf3x7oQVCHZo6D57oXniK7CRlgHefhf77L1J+YLkvvwpNisALeST7ssEVaHUSEI4bn9u9Xd7v+FFk3LOA4WpjgakJ2n1K1sgZOKqtPc50Z7pPku9p7C3+qTkwA+eG13SsvIamuCYuT0jiWLnDJaptZObcWGCVAcN3JwdaogFmhsNqN0K5zLBq9pU0zKlGipJVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PVMOrfOwGADvPTHQB0YXnjD6dRUnJRaKwA/GzHcRAM=;
 b=h5SQs6gJ1WdhzMF11lIF5AACoCJNAdwf41Cxi/zPxyoBiTxQCZ8o7hHfyRjfV2dxHOpKivi6NhV3zmKo88YvDcmSokQggIl1TvEhEOf+Tf7eIMF4IwDeko7IPW0shzvJpk50gT+aZti1ZoQwphgpnWOjzEn672HYc76R3otJqZk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9807.eurprd08.prod.outlook.com (2603:10a6:102:2ee::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 14:26:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:26:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adriaan.schmidt@siemens.com" <adriaan.schmidt@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
Thread-Topic: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
Thread-Index: AQHbnyOfNZLEbyCx8EGAKjVX+HMKtbOHCi6A
Date: Thu, 27 Mar 2025 14:26:39 +0000
Message-ID: <607113C9-1438-4B7C-8B23-FA8911BEC331@arm.com>
References: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
In-Reply-To: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9807:EE_|DB5PEPF00014B92:EE_|AM8PR08MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2330ef4b-1852-4835-c1b7-08dd6d3b7694
x-checkrecipientrouted: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MUliYjY4czREcFU0L2Zibmo4VlVqL3F0dUVEV1BoNHkxdks2RFBDSitJbjFj?=
 =?utf-8?B?TUZnYlU2RnRWWEpvSUJRWWt3cllkcDN1ZzVyeGxkdHA1Q2p6eFZjajZaT3Vz?=
 =?utf-8?B?Ti9FeWNCSXNCcklqTUpDVCs0bExSeG1reE45aGo2ZkRESjg5NWdRNUpXSWUw?=
 =?utf-8?B?aGF1R3hPRDF6T0FaNWZTK2d1S0h0VHdGTUcrTnhuSFBZMFlrZmNnekV2SFRX?=
 =?utf-8?B?N2dQZUJqMUlTejRIL0swUzBpbURuNkJ3Q0I3UUpUUzZvVG1UQXdTblo1RHE5?=
 =?utf-8?B?aGUrZXRLTVpMditJbEZnaDNhbEtWOEQvVTVZZ0RXN243SW53dEFVV2pidUdE?=
 =?utf-8?B?NkdGTHRKY21nYnVZeEtlYXU2eEhxZDlQMDFiTGM5Z2Frd2QyaUM1VnNtQWpy?=
 =?utf-8?B?OFAzNlZucGk0YzQvVjdrUnQyMFF4eFJrYkx6V0ZldTI5bXJoME9nT2JyeFh4?=
 =?utf-8?B?cUE1Ynp1VUJOSUQvcFJuL0kzSHVsTHNnRTViVEc2R3hwMzZpazQ5WVNKbnpK?=
 =?utf-8?B?eVpGa1FPdW5SUVFXdVVQc2Q1Rm5Hb3BuZ2lrbGhFcEs0b2tYbVhWVG5lekFt?=
 =?utf-8?B?MEdPL1dQY2ptZ05ZZ1ZscEVyajcvNVI1VVg0Z3NDT05nci9LR2MraEFoTUs3?=
 =?utf-8?B?RHQ1YXhtemZEUFdHcUZFZHZlRTdicDhRVXY0ci9va2hVWTVrUUlDN3NrWk1M?=
 =?utf-8?B?TnhhQitPNkNBandMQThDcVI0Z01MeFV3cHBDK1Q1R09aeTROOXYrUmhPMjhB?=
 =?utf-8?B?bHNIMGVSNTlJQ29nc3pTRDUyVXQ5ZEVOSjFmKzFiTFdnbEl4dDUweC8vNi9o?=
 =?utf-8?B?VEkzSGZ0NmVBWXFFUFRMWnhzMXl5dnNwT2tiU1ZRSDM1YlBUNi9IY0gzR3Nw?=
 =?utf-8?B?bXEyb3dlYk5oRHFLMktmU2U2bXA5b0VWcTg4WDBKd1dUVFV6UU1DMkRxank2?=
 =?utf-8?B?czFSV3gvNXBPQnhtOStLMml5WTJxcWl5S1lXQ3BicGNDSnMxM2hZTmd2bk03?=
 =?utf-8?B?WXNRSTIxK3BoZ3VqUUhsbjd3YUdmODZQK0YwcW1zdXVtOGFpaWNWUldtYVVv?=
 =?utf-8?B?U0ZZeUg2YmdjRElzdjRuN1NhVTRQY0xDdG1xOHZEdFVRU0JoL2FDVUxZRDFE?=
 =?utf-8?B?SC9qakd4NWRTS05HWWZESzd0anVFTTIwT2t6WVl4aWZacW94TXRWQTVqQnVD?=
 =?utf-8?B?M2M3aDdlVCtzaXB5bHFoZW9HTkVMSUxBakdIWlExVmZRQXJlNnAzTnd4VkY1?=
 =?utf-8?B?T0h3YmdlRU14eU1OeE1vWDcxanZQUkNpcWd5M0krREJnQ3QrakRXQ1A2WHFm?=
 =?utf-8?B?RXR2SE1NQmdPVWFUYURLV1IyWjhJV3BtbTZPc2EyaWNLVHhTa3FxMktCTWlu?=
 =?utf-8?B?a21QVE5zS3dXL1g4Z1BFZmJZaHdyNW1xaWwzS2JyYUQzc1pJNGtWL3VsaUhx?=
 =?utf-8?B?a1pwclFNRmpDMzRhUHZnUU12UjU0R0lXa0U0ei9rTUJaVFZOSXB6UGdmaVht?=
 =?utf-8?B?T082L0tRWUw4blFiTGRiVlJQRW9PNEg1UnFlTjd0UVlwWkFMTSs2VGZDLzg4?=
 =?utf-8?B?bUx4ZjZtbEpSeVU3K012UjE0QzVMWGl4ZWN6WjhKNkNhdnZlb1hDV2lNdHV1?=
 =?utf-8?B?UC9GelYzNFFkVTh1alpTYWM2cG9aRzV2KzlGYUcyRytOUzR3VXVxeW1EZXR0?=
 =?utf-8?B?Wk5DV0VLTllaOWVLNWNUTGtVcFJGeVk3QXVWczJTRGpjOTU4TklMKzM0Tzgw?=
 =?utf-8?B?WGZDaytCVUNGRjdQcEpGYXRhVmdvangxaWlEbnpxWWZwTlp2dEd5N1VkN3BT?=
 =?utf-8?B?RndJcmtoai9hNUxiNW5RcEVPWVRtaG5zbWtCTzlVVHNVWVBiQ1hqOEFVa2pG?=
 =?utf-8?B?N05haDIvN29LbjIxeGxSTlhGdFk2Q2RWUENUemw5NDNYWW5waHZwTDJFeGxX?=
 =?utf-8?Q?X1z48i11RpdD44mssPAI0LmEHy9X9/+n?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD427637E1FB484BBFE267906990AFDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9807
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6ea0d72-6413-4eba-4e4a-08dd6d3b6379
NoDisclaimer: true
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|1800799024|82310400026|4022899009|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YVE5NFlRQ2g2WmMzS04zZ01EZnVGYjZkaEJpU1dDWExRODk3VTZiSnVTbS9M?=
 =?utf-8?B?bGJlMm1wM1JKc1dHRjB3dGJYeGFRWkhOVG0xYWpMeExzR1M5RE9XOGhDSkFh?=
 =?utf-8?B?QXNlNnRSSVFJR0luS2QvVE1HMHN2eitRYTJ6VEo5VlpwZzZxT3dIRWliMVRM?=
 =?utf-8?B?V0JkYmx6YUVLMUF6bkN5WDhYM2hBeFBLZ1dhTVZFY1lyWXIrUFI1dDg5eDlt?=
 =?utf-8?B?QXZjaFBrUHhueHBvampHZm84NE9uTytPYlZ4QVVQa1R1Q2tEMHloSjB2ak5x?=
 =?utf-8?B?a0pTd3MzMDFOUURGY1gwZm5uQ3hrMmttNTRvTGR6R0xzTGYzZENBQnlORXZS?=
 =?utf-8?B?eWo5UHc5ZzBsQW1VdVZBR21Tc1lFTmN6NHJkNkRGSmlYWVJ3R3lJVDRkOHIx?=
 =?utf-8?B?d2NZd2hqMHorc2x6RlFjbFJQNm9sdmQ3MUNRQkVtTjdOVk53UTQ4Z0VSNlMx?=
 =?utf-8?B?MDlHNFc1ekFVRDhScEJmUWpUNjliaGgyRXpoeEFFaDhTakR5clphaWUzUVpl?=
 =?utf-8?B?V1RkUUxjYlNmQlBhZlRDK1dkUUNtamJuMkNmVlozbEtSdklHSTRrRzNzaVVS?=
 =?utf-8?B?U3pLaTh4ejRvb1pCamFCUlU1YUZrS3kwZkR2OGJsekRPTDVtOU9IcWphYnRC?=
 =?utf-8?B?a29BTUluQk1SMExmNlgxRTY3OVFDYXAzeXpRb3RCeURRRVNvRWZxME1RdHdM?=
 =?utf-8?B?VngwUEZIT3lFTW1tLytHdStFcXJwT0tERXlRUEdSZzdtK2ZVVVdjNjlBSTBS?=
 =?utf-8?B?N2wyUGRlWFdLNzc2TWY2UVRFczJSbEVUOVVaWlJmTVBFaldXQXl5SUtncmt2?=
 =?utf-8?B?Qmp6aGFqeW9lUXNjV25YdGVpUXFBNzhibUdXQ2JRODBINXR3UksxenhYa0tz?=
 =?utf-8?B?VmY1Y3hXYWFWcUVaVDVqekltN0wrY0FFZ0FJRFkrdFBBb1dleGtVVHIzMkYv?=
 =?utf-8?B?ZE9hRS9vZWt3b0Jma1RDbFV5dGNzZk43TndMUTI0dlhoQ1JkNWVJcGZtMlZU?=
 =?utf-8?B?K2trbTdVdEtzVms0R29SUUVYOUhKeFRBSlpzTUZUYUpyV1FWQnZRMnhDNUNm?=
 =?utf-8?B?cSt2eUF2SUNJOEpuNlNKZ051ZStnS2pZMFJUeHdEZUU0U0dTcitoMWZWSEJH?=
 =?utf-8?B?Q1dOaGZGRmJVOFo0N08yUWNLd3JDRzBjZFBtWG9ISW81Q29UTGFTYzBhbXhE?=
 =?utf-8?B?SnVySm9KWkZlUWJ2RVQzNGNQYVN4SXdabFI1Mmc0L2VxeFd3VWRrb3IvS1hX?=
 =?utf-8?B?R0lwcTV0MlFpUlRLeVVpbjgwdlZlV0E0V043YXdnZUxxeWp2ejJYZnhiZDNZ?=
 =?utf-8?B?THBtWEFmKzRCd0FOeksyR3p6UnhoVUdiekxXaHFHRmhMZWozSHdDZlVrdnor?=
 =?utf-8?B?d3dWTSswRndtYTB1anlKRHlwc2xGdlZ0SFhRTVBzSFA1TG16bGhlK3J1WXYx?=
 =?utf-8?B?YzdqSWtaRG5rTG9jSFFOVVRDUlRTVnZQdUFoTlFUOEhLYTNEaXNzM1pkTTVS?=
 =?utf-8?B?enZDR0xaLzRGZWNLaE1SVzVna1pKaTNqUUZucXY5NUtJaG9PQURpUGhJdzFV?=
 =?utf-8?B?YVF0cDhmTkhiNWpDSEhhKzBzSXpCajVxMHNOMzVzUFdGQVo5VW5rbWpzSlNi?=
 =?utf-8?B?LytOS2oybDBnVHJqMWNZbCtweU5CU0w2d1NwWTh6RmJScWFTQXlRNUc5OGFp?=
 =?utf-8?B?dGVKUWZMUm5oOE9RL2srV2xsNGZ1Slo2aWl0M1lmdmJyMytPZzZhVnUxQ0w1?=
 =?utf-8?B?S1I5bTVOeVZ0d3JTT3dSMUxpejJqZ3g4Y21uejJuN2dNRVZxLzNnay8zOWUx?=
 =?utf-8?B?VW1sUEdwVDJVNVhVT2tVNGgrMGRweW9ZK2ZlUm43SnU0bFlPdkVLMzVsM1Nq?=
 =?utf-8?B?U0E1d1lHZ3NVenY3N2RCYzQ3a3VpeWtnaytpUUYzazJuaVpBK0xKaURkaHlW?=
 =?utf-8?Q?R75QnmKd5JMb1C97BUDOhVmDWp+kWpXz?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(4022899009)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:27:11.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2330ef4b-1852-4835-c1b7-08dd6d3b7694
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213750

SSBzdGFydGVkIGRvaW5nIHRoaXMgdXBncmFkZSBzb21lIHRpbWUgYWdvIGFuZCBpdOKAmXMgbm9u
LXRyaXZpYWzigKYNCg0KRGlkIHlvdSB2ZXJpZnkgdGhhdCBwcGMvbWlwcy9hcm0gYWxsIGJ1aWxk
IHdpdGggYm90aCBnY2MgYW5kIGNsYW5nPw0KDQpSb3NzDQoNCj4gT24gMjcgTWFyIDIwMjUsIGF0
IDE0OjEyLCBBZHJpYWFuIFNjaG1pZHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFkcmlh
YW4uc2NobWlkdD1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+IFJlbGVhc2VzID4xLjYuMiBhcmUgbm90IGhvc3RlZCBvbiB0aGUgc2F2YW5uYWggc2VydmVy
LCBzbyBjaGFuZ2luZyBkb3dubG9hZCBsb2NhdGlvbiB0byBnaXRodWIuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBZHJpYWFuIFNjaG1pZHQgPGFkcmlhYW4uc2NobWlkdEBzaWVtZW5zLmNvbT4NCj4g
LS0tDQo+IC4uLi9saWJ1bndpbmQve2xpYnVud2luZF8xLjYuMi5iYiA9PiBsaWJ1bndpbmRfMS44
LjEuYmJ9ICAgICAgfCA0ICsrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC97
bGlidW53aW5kXzEuNi4yLmJiID0+IGxpYnVud2luZF8xLjguMS5iYn0gKDkyJSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kXzEuNi4y
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZF8xLjguMS5iYg0K
PiBzaW1pbGFyaXR5IGluZGV4IDkyJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJ1bndpbmQvbGlidW53aW5kXzEuNi4yLmJiDQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kXzEuOC4xLmJiDQo+IGluZGV4IGIyZTdlYzc3MTku
LmZhZjA1Njc2MmYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2lu
ZC9saWJ1bndpbmRfMS42LjIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53
aW5kL2xpYnVud2luZF8xLjguMS5iYg0KPiBAQCAtNiwxNCArNiwxNCBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yZDgwYzhlZDQwNjJiODMzOWI3MTVmOTBmYTY4Y2M5
ZiINCj4gREVQRU5EUyArPSAibGliYXRvbWljLW9wcyINCj4gREVQRU5EUzphcHBlbmQ6bGliYy1t
dXNsID0gIiBsaWJ1Y29udGV4dCINCj4gDQo+IC1TUkNfVVJJID0gImh0dHA6Ly9kb3dubG9hZC5z
YXZhbm5haC5ub25nbnUub3JnL3JlbGVhc2VzL2xpYnVud2luZC9saWJ1bndpbmQtJHtQVn0udGFy
Lmd6IFwNCj4gK1NSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpYnVud2luZC9saWJ1bndp
bmQvcmVsZWFzZXMvZG93bmxvYWQvdiR7UFZ9L2xpYnVud2luZC0ke1BWfS50YXIuZ3ogXA0KPiAg
ICAgICAgICAgIGZpbGU6Ly9taXBzLWJ5dGUtb3JkZXIucGF0Y2ggXA0KPiAgICAgICAgICAgIGZp
bGU6Ly9taXBzLWNvcmVkdW1wLXJlZ2lzdGVyLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8v
MDAwNS1wcGMzMi1Db25zaWRlci11Y29udGV4dC1taXNtYXRjaGVzLWJldHdlZW4tZ2xpYmMtYW5k
LnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vMDAwMS1zcmMtR3RyYWNlLXJlbW92ZS11bmd1
YXJkZWQtcHJpbnQtY2FsbHMucGF0Y2ggXA0KPiAgICAgICAgICAgICINCj4gDQo+IC1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNGE2YWVjNjY2OTkxZmI0NWQwODg5YzQ0YWVkZThhZDZlYjEwODA3MWMz
NTU0ZmNkZmY2NzFmOWM5NDc5NDk3NiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZGYwZTMy
ZGQ1ZmFmZTUyODMxOThkMzdlNGJmOWRlY2Y3YmExNzcwYjZlN2UwMDZjMzNlNmRmNzllNmE2MTU3
Ig0KPiANCj4gaW5oZXJpdCBhdXRvdG9vbHMgbXVsdGlsaWJfaGVhZGVyDQo+IA0KPiAtLSANCj4g
Mi4zOS4yDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSBy
ZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25s
aW5lICgjMjEzNzQ5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvbWVzc2FnZS8yMTM3NDkNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbXQvMTExOTM2ODgxLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9w
ZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3Jp
YmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vu
c3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiAN
Cg0K

