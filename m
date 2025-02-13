Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0C5C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 12:04:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web10.9603.1739448263106436726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 04:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WHBq8N4u;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WHBq8N4u;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YzoyLxNXUI4AZ6cYrY22UqmADQCAB90LO7fGOACBxJBmWxcMcwSxqoab4n7baa/HNMDuCiYtOheFYLGQ1aaYNGs4gYELBgq63LVoAVp9upWnSUONqpv9lMSqr2NcZgOgISIaUxWYWMas6zHKsCGCc0TCUln2zPLuPQKhwr3HL034l7thVW6JThtsDcNlVoKm6/5ukY4gAsdKtOstL4gDtsGZ9rGNEiYQaMdnhG6qXm5eCoE/nnC4Gt7OSFPam+FcGFhelxPULGoje/qbtkaWRcfHevmpnJ8VfrgOHU6vlK4PRNWiEjg8qP0M4JfR9mnww6Jy66oJdmZjDUxXlCJ+dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1UZrqklNbQr4X2W+141EBadfLVpvDPNULupYQUIqTc=;
 b=e6vawbBubHnXLkbbnleZybuL9nao6zLxQH8xk1ju3CdRVEic2ZiZMiyjIeuCmT0aXfD3Qi6Bo2JZQYzBoY+tMcHIo3UW/aUOZRJhxVxqRWMNOOnpSIWrdsHxjv3UIo7RIzg9d3fR4uXJbJ2EYVw12jq7YWmGFukZ1P15XHT8XPaGj6RwMM7AL1tK6//8/diWuRtpPOdtAkcQDkjKs5kDP39LvH8NTT/4NtiTk/El2B7c8IciYHA4WUgxU2TtVI29oY31Xttm8kKjGmsH0a5hXttofH6LHUs/pgQVFXRKGAPqO1ExEHpI2csNKy/IMu02voVSx4rOGWgk9efzzYxuYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1UZrqklNbQr4X2W+141EBadfLVpvDPNULupYQUIqTc=;
 b=WHBq8N4uZxm/cOTCMO+x+Rqzgb9DCyCpV+zNHf++oiV+6tAGjugt45MFTEXJnrQlIc4UVjPQo8NgU2SvO3+j4rJXozFy90YQoW7OzA0L2Xbjf1ZpCQpIya3M1nd7BmMLxAUf/6k/wu7JKM5UOxXQyy9vrkYn/Cr0xVh36mhnhuU=
Received: from PR1P264CA0115.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::11)
 by PA4PR08MB6191.eurprd08.prod.outlook.com (2603:10a6:102:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 12:04:18 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:102:2cd:cafe::e8) by PR1P264CA0115.outlook.office365.com
 (2603:10a6:102:2cd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Thu,
 13 Feb 2025 12:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Thu, 13 Feb 2025 12:04:18 +0000
Received: ("Tessian outbound 4fd325905615:v567"); Thu, 13 Feb 2025 12:04:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4c0aa43b988f673
X-TessianGatewayMetadata: FTv5Sz2xlIUEPFBVfe3DteneR175/8gZhjYLwe+fp0MlIdf9+HFzbcbiEUUupWc2ujGmLlOq4NRjYz7xL7PLFk68XpQ675aDALu9a+9BKQ6MtDRkq5Uq8rpChdzW48hrnNKZ1l/aSahtxA4+yBMK8KycbxXIhd+6R8/oTc/4B+4=
X-CR-MTA-TID: 64aa7808
Received: from L67d389057a14.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 57D61F6B-AADA-4B9F-ACC8-99076F23232C.1;
	Thu, 13 Feb 2025 12:04:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L67d389057a14.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 13 Feb 2025 12:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQajv/ijAH5fpDHYutEd9JA0bwbpvDo0vYXU5ddCwjzNYyZ4r+jjfh/+plVck23uH3fNQIFY45uYjwyeKe/qkC/wbY2HaIHdnN7eAfEWr+LZRXbm3S957wSkR4GUXSpRaf2aPXG80HWKR+IfccDdxFYcB+rOEMNe9IAtT33h7a5VkuRNXm2LUWqutOU6smStDOoNHATFV/Vbj5/jH5EGKaX+UDFtvWOxofT1aDUuv2ubXOnC0ijGmDSKk0L4RdyBdpYcgYOFEcA2HqdQMsee+veQq03/eUcANJEtvJW1atatCMLkys6MC8xIoE5gD2q4Y4fFlGHhSWlSlrHDtcg3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1UZrqklNbQr4X2W+141EBadfLVpvDPNULupYQUIqTc=;
 b=kUQIfriJbxlXxDpyAbUYHn2geo3AsAwCeaeEnDpEHQjWTuC7P65e7tcsOpFQBSqd9f/zsITNnvxdcOeoard05W4RHyHa08KpcTels0k5jCVsDrZfqW6gbBT7oh+BFALJtypq/973/fgKiS0h+aLMddW59YC6MXZ4nxyET9x6o10YqQnDMX8EkJu6Vh/8U2lRmNfiEajPnNp3I8Q1YSLU4phXKUdpg9Hb9RnASenJ1YdP3TfRHrqZBIqSRMuM+YyEi3hSE37jAVbiMJrbYSXQNoaUoxLsnRj42l0V8mg3TyxznITjKKAjZ0yAwjNKwzyaGCidYW9UKJjbVLg5MHXFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1UZrqklNbQr4X2W+141EBadfLVpvDPNULupYQUIqTc=;
 b=WHBq8N4uZxm/cOTCMO+x+Rqzgb9DCyCpV+zNHf++oiV+6tAGjugt45MFTEXJnrQlIc4UVjPQo8NgU2SvO3+j4rJXozFy90YQoW7OzA0L2Xbjf1ZpCQpIya3M1nd7BmMLxAUf/6k/wu7JKM5UOxXQyy9vrkYn/Cr0xVh36mhnhuU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7887.eurprd08.prod.outlook.com (2603:10a6:20b:52b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Thu, 13 Feb
 2025 12:04:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 12:04:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-license-expression: fix ptest
 installation
Thread-Topic: [OE-core] [PATCH] python3-license-expression: fix ptest
 installation
Thread-Index: AQHbfY0Yi+94WrgJWkmXXB5rNE8kXrNER7cAgADb4wA=
Date: Thu, 13 Feb 2025 12:04:07 +0000
Message-ID: <C1F2E9E0-B06F-483C-BE2D-B68AE941EA2C@arm.com>
References: <20250212203113.398422-1-ross.burton@arm.com>
 <CAMKF1sqocgsbxwbn4FrxHXDLk2tKJYLWOA0zA=gh_UzusuUB7g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqocgsbxwbn4FrxHXDLk2tKJYLWOA0zA=gh_UzusuUB7g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7887:EE_|AMS1EPF00000049:EE_|PA4PR08MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a12458-6b41-42e5-9f17-08dd4c268b1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?V1d0eE9scWhrdWxTcWRmbGJhS1p0bm9VN3VMV004Ykd4c3JURHViWTVUL0FH?=
 =?utf-8?B?ZkIzMUVWUmJoMG1meGl5U2MyMm5CcVduMWdBbk1IOTNpbFhzZGZHN1VKV2lT?=
 =?utf-8?B?c0NRRlVDV2ZCSDNhQWptdzFrNHhkcjRZTWNYUlRYcHFXTk1QcTlreTJaUUZZ?=
 =?utf-8?B?eFdnV0xQQ1l3UzFPVVRlS1pPRm5yb2t6ZTB3NjhISWV0TGFrNmxsaUNwT0ly?=
 =?utf-8?B?bFprMFZheFkrVEdMWnFhazc4RllsUFZrOHZlODhPdlNNZS9QcUMxVEI0U2Q2?=
 =?utf-8?B?MHFSeDUway9xc0pHLzBNRWplYjBweHhXRFRqbzJQU1cwNkt4TXZ3THNpSVJI?=
 =?utf-8?B?YXFVY0YzeWZsOHVMcWJBL2VEQm15WkdaZGZBaVRtV0FKQkJOMGJCU3UzNG9Q?=
 =?utf-8?B?NHYvVDBaNXdldWhUZTRhNDFOUng3dG1SNVVnQ2VadGlOa2k5UzZkNlZ3ZXNo?=
 =?utf-8?B?ek5ER0Rud284T09aZmlNaGR1SUFERzVpZWxPUVVlcXliSWFsL0liVkRLY3B0?=
 =?utf-8?B?VlFaeWREdVpjc0FQd1liWDNrSG1LalZYNHQrSDJGNXVUL0dITFV0ZFNnR1dV?=
 =?utf-8?B?dXFKb2lMbmFVeTdMbGxsSDRlL1F6N1dvd2k3NjVlRHdHdWRObDBVNXBQQWxJ?=
 =?utf-8?B?MEVxTnNwdmU2b2ZnZk1CSlZxM002K0hpTEZ2OEpibDd5VENVblYzZTlWQm5v?=
 =?utf-8?B?RTg4ZGUxQjBKbmdpOTV5S2hIMzMxaTdmVWMzNFQ2Z2hEUmdmYVRucS9EQzhs?=
 =?utf-8?B?M09NeUYxREdIeUpBSGF6dVJhOWpjNVM4eFI4NC9IakpQU0MyUzkxYyt6Unhj?=
 =?utf-8?B?SlpDZi9adW83Uy9ON3BOY1VHdFZMS1dGZ25QYjNud2NFMUlBcTZRb0crTUh3?=
 =?utf-8?B?OXB0MXlaQnBjd3ZGbVRRL3dXaHpTT2RNWkhqV3pDazIzRXRZMzhqT0FhMFJM?=
 =?utf-8?B?cG5jdXNmOXBPTG5qdzBJK0M5L2pPR3ZBUnMxam15anBiZk1xaFNrazY2ZW5y?=
 =?utf-8?B?aVZ2cnFuU28vMTl5aU9tTFJKYURWamhWa0YvdWRhdlhVSXBmYnAvMDRyT0RY?=
 =?utf-8?B?cldUTHBZVHdqNEhhbGk3R3pTbWMyb1hBbjFEUWFaNytMelFBME5vOTBFWmRU?=
 =?utf-8?B?UWI2aTc3cTF6ejNnU3hib0IvWGh3aHVXeWQ5WEFTVWRJWDZhdHNPdklseGpV?=
 =?utf-8?B?ZWk5dDZjSlg4c01NcS9DQkZMZ3B1dmVNcnJUd01TQzRDZG83bmt3aS9kM2F0?=
 =?utf-8?B?TU5GSXpvMWEyNHBNemxSWXljNG9IeG5ZRWMxSGN4K2EzNSt3bjFwcWxTNTUx?=
 =?utf-8?B?eUpIcnhQUTR5MSs4SzJkYnYzOXlPZ1M2NmcxS3VFR2NWUVNkY2tsT2hlaDBH?=
 =?utf-8?B?UDJOZlVHRVNCR3IxbXErUUg4K0FmQmd3UWIxZk4xamtxR212Q21KSkJQckY2?=
 =?utf-8?B?RThraGVlRjNPVFQyandKZnpndjY2eFJtam1WRW9NcHg5WTZYOENKcDlmd25n?=
 =?utf-8?B?VkJNVDB3SHRQSnR1Y0RDSVlrWkc2b093TjdWMnMwT1FvdHlIN1NUWlRyWkVu?=
 =?utf-8?B?Z1NqYWVodVZ2MWhFeGNKUGlySmJpK3dyRmRVWEd1OUowRXhKYkY2ZGhZUi9p?=
 =?utf-8?B?MzE5a0J4QzZIY3VyY05YejdPRFplUklGRXhFZTQxY2RNTDVncGhaditPU0Nl?=
 =?utf-8?B?VElJc1pweXA0ZVNVS29LdnlUUXgwaTZONUVJbUx1dVlLTGJRVnRPVTkwYzdu?=
 =?utf-8?B?eFd4Mmk4eWI4dW5UVzRoZHY2b0Q5ZXY1R2xoemZrY05NTzZqTTBLUC84MjJq?=
 =?utf-8?B?RGVFelRWbGgrWHIwejVka2xudDNxUm1OdHMvRVJMRTl4NktMbFVtM1BRQm1j?=
 =?utf-8?B?bHpVR0NZaTF3T25qdTdkbHpoVDFia0MzaXNrRlM2b2prMEtNanVlcytDaUZw?=
 =?utf-8?Q?RxQdqifJoILWPXp4sA6GHUgf47X/NLpn?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <32079B5E7A268B4A802AA43F2D114658@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	03925401-483e-47cd-3fe0-08dd4c2684b5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWVEVGp1Q2JoVWJEQVdqVzZTVTRQaWVjdkR0N29DY2FQeDI1aHplNVJ4ZzhB?=
 =?utf-8?B?WFBBY1ZTQzkxRGJiRDd2UlNGckdkYTV5SmlMdllBbitXblovcE4zTzg1bTI3?=
 =?utf-8?B?ODhtSkxseE9MNWphUTBXK2pGMEVlQ0I4aUpmbWJ1clNjVFFpM25rM0JEREth?=
 =?utf-8?B?Y0luSUVFSm1wTzZLOWVkd2RIVEg4bmZEMTAyNC96MlA4Q2tZNE1lbi9BeVlu?=
 =?utf-8?B?V1g2UVA2RXNpb1FCL2JEenZLbFdNNHZ3aDFycGxYbkUrLzV6d2NjaTg2VEli?=
 =?utf-8?B?WHhCNmpCRFN5aTh6dE5UUVRFaHFVL3NKajBaWGVINlBjWjdxOUVZS2RoK0Vv?=
 =?utf-8?B?UUtTRFJaZmVMS005ZG5IVEdTeDZXVGUwSjUxMlRNSU1CRGxWV3ZBbnhkYklz?=
 =?utf-8?B?Yjc0THdmZHdxU3ZmRTZmUFY3TjFBemJ4WmxsdnU3S0VpSWRYSytYYjN3bDNw?=
 =?utf-8?B?ek8zQjMwdGtCTlZwRDVWZkVCOGRwUDFybGlCaFhXbFZieEppRFBQVTVrb0h5?=
 =?utf-8?B?OFVlNWxPaHZnNFhwK0FMSC9MeXpQZ3d1VXRFMXA3MkQ2Z21VcnBMVDF4WmRJ?=
 =?utf-8?B?L01ZYXdOZ0piNk1qNmEwUTY5N0ZQTWVVTE9sSXVDbTR1YTFrMFdRcjFSdS81?=
 =?utf-8?B?WFJSQk5nSlNGaTRRZnNvcyt2SjFaMndSRDZrRi9RckNVS1Vpcy9kek1VWVU1?=
 =?utf-8?B?WUxUdU4vOE5iYVpjZW44UCt3MjhLOHJJVnRZdEFxd21KMWxmUjlEMEVvUHZh?=
 =?utf-8?B?L3RlWFQwQk4zN2xpTlNEclNrTjhONk45THBnZmlJb3ZIUzhHOTZmWEhVL01Q?=
 =?utf-8?B?LzZxdzhvcVBQY0Z4T2IvU2wwUldiWkh1bUtLNkM2bE9qbUVrRHpqRWdYaW16?=
 =?utf-8?B?UnloK0YxbXcyTk1rVkJhb1RZdm5tZ0d0UUg3TS82aStwNm5CRW5wNk40blVG?=
 =?utf-8?B?Q1BKNjBUWmRwMWYyb0M5NWJPaS84enpSeU5qanNuVEYvY0NmTTZqcVR5Q1lu?=
 =?utf-8?B?SFpxSE5lZXFSY3c1ckpWdGZ2QTRtWlZRZk1PLzE5TU5TejI2V0tDOTZCY3dl?=
 =?utf-8?B?a3pOd3VPaVFvYWFvQnRTbmpYWng0RVl6ZkRaaFhGS3lOR3NOdXVFTUdhczI0?=
 =?utf-8?B?ZUo5OWhGN0NtKzRLZGdEaTFleG5iak1zSWNKclZzMUVDZUh6Vi9EeFVuTDlQ?=
 =?utf-8?B?c0hHYU5XWnlKejVVNmgxcElnb0c2b3IyV1dnaVhQUFp6bjVVZE9TRjRLSlJx?=
 =?utf-8?B?QTJJc3ZpZDdnR2MzbEhTRFluenFISEptMlc5RHJUWUNvWTFhanpCbHdiN2VF?=
 =?utf-8?B?UFErTGx4QTRuS1V5K2FxcUUwYXlDdEdXcU1tWk9PdnVkaEtHNmptWmx1eWJ4?=
 =?utf-8?B?UVFVcjQzOU90emI1bVhCVHpzdkJpajdQNWtFSFpwRi9xSWIwRXdrcFkyUjhB?=
 =?utf-8?B?UlN2cUZvN1A4TnhHaHBGSks4SHFqWmhtMi8xR09HQmplTmZZMXFjaVJ1cHZw?=
 =?utf-8?B?SXZQc3ZWWGdXa1lHRU1zZyt6WnBXNjhWeFRCR1VTKy9sTUkwRlIyYndIdDUr?=
 =?utf-8?B?SnFkZXRCbytac1E0cS9SRnlYRzNncDhmTVVqbXVmWHlEbzYrZVpUaS8rbDV3?=
 =?utf-8?B?YzllY0VCSWs3TjhReHBKd0Jpc2VEZmRGait5M2J6Rnh1RDlZTVFFTHMybkJU?=
 =?utf-8?B?VFpNZzhPNW8zY29peDZQeU5YMjAxWHhocC9wcWI3a3NUZGx1S2xHRFhYT0Q3?=
 =?utf-8?B?UFhiVnpPWE1wdzBiaHZhSXNoRThjeFNZb1JPaXUwcTJiU1pCTW9VaE1QWDJC?=
 =?utf-8?B?L2xxbUN3YjYyUVRUUExJcVVqVm1DUHFYdXhSZC9CZEwwa01jZE8rcHQwcjIv?=
 =?utf-8?B?cTFmbjlZdVp3SUFDbDB6dEdhdXBTeWxURDhxV1Fxb0Nta1RuNVdJcUI5VHY3?=
 =?utf-8?B?cFpDNWFNaWN6aWt0QXUyTHBTT1pMMGd6aVJKMTZlYjJPbkY3aXQ2dUc4OVlh?=
 =?utf-8?Q?+JJXWHKFicnXas23skN+5gm3G2enww=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:04:18.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a12458-6b41-42e5-9f17-08dd4c268b1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211327

T24gMTIgRmViIDIwMjUsIGF0IDIyOjU2LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4+ICsgICAgbG4gLXMgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vbGljZW5zZV9l
eHByZXNzaW9uLyAke0R9JHtQVEVTVF9QQVRIfS9zcmMvDQo+IA0KPiBzaG91bGQgdGhpcyBiZSBs
biAtc2YgPw0KDQpXZeKAmXJlIHdvcmtpbmcgaW4gYSBmcmVzaCBkaXJlY3Rvcnkgc28gdGhlcmUg
aXMgbm8gZGVzdGluYXRpb24gZmlsZSB0byBmb3JjaWJsZSByZW1vdmUuDQoNClJvc3M=

