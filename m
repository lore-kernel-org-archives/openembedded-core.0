Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86978C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 17:22:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.523.1741022569513871011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 09:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YAFaDPic;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YAFaDPic;
 spf=pass (domain: arm.com, ip: 40.107.22.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H4K9zIl2VjtZstqVeIhrSQqn2AOXoeZhoHlW2n0tmwl39Kxk3jPi90r0UmZF6HVWL5ED1EdY8L0MZFWn3fX2BuHT10/StEtynKsLvuGNdGgWPWLksGX/qJm6P/XKa2K7Hpltuw4PWWcFVzR1jo15uyeanPR82w0U8cxd8UM/jGAbaebRhOo0jtIo8qGNtXXHotYCC4NUlacHSF6p69l/0PrJloOhktlr2ZX+RyWKkKYI6PHtM2t2f0Fm9SMO+eTlK6G+QQZC5o06Xo8gjABavcpx9/RnWd/LVTttApdTya/uvZ8ElV5bJgIOoAnj3n273hNKFFHKjRTfkMFFQev4Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTAixH0CXqD1eIJ+/aQpzL+iopAezN2twW1lDajfhZ0=;
 b=pmOKQIuba9JBL0RuP7fw7IENwQFdgSAxcQ6rFxT+8m4baiw7zxAenerphTWlD/VO3RzoEJvDLJCh45TNCxvbi5NlN3+Rg9CUUs4t4KJ0YdVVKJBdY8ARDDG1RN/JRplXLdjIkHVNrB+X/cEKN5f9tjY/SX9WgmAdjrk3QL1HFqKNsI1+8uXiVlGDTival0gXG/oWS1i5WPVmEDaN4fnKHQflxZADQleyUDPJErdEzKR/X7O65BFXgWjFfsLWPXo8vIxzayn+VUe8N/b/fKglpfANAVpZ+bUEcoG+CFU1leZPmGpduL7grjQ+OXUSw6bAAHW5ruvx9Nzm0t7bIznNNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTAixH0CXqD1eIJ+/aQpzL+iopAezN2twW1lDajfhZ0=;
 b=YAFaDPicmzfJycfBW+0wcTLivP+c3Lil5WCQDWyTWKWyz24XXutwHeQFuxGmTN1807R83VOK8opaR0M0LTaxFXPtO/Oxlo7CSStFY3YbrHoRuSba9OaZ9THqoYOQiMQtsNqXvNCsB4mnCYeuuSap1NaQ0e59ZAu0Ic9S274Q6VE=
Received: from DU2PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:3b::11)
 by PAWPR08MB10319.eurprd08.prod.outlook.com (2603:10a6:102:332::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 17:22:43 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::c6) by DU2PR04CA0006.outlook.office365.com
 (2603:10a6:10:3b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.27 via Frontend Transport; Mon,
 3 Mar 2025 17:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 17:22:42 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585"); Mon, 03 Mar 2025 17:22:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39928f2aa2b03768
X-TessianGatewayMetadata: 0cNh9yqb/6EU/aIVP1SQ/Kfz/oZ3ric9ya7JB4OGUi2gCYKqHT2iohiDfWIaLuz0bXi++oailG/HV86EZvz6q3Xf5dO39IVJr8Wp5kPd5nRQchnht5poTi1zZ6yivIa7E9cI2OweY98kDc11a2TnwRVMjVrxRD906oMH5Es3VXw=
X-CR-MTA-TID: 64aa7808
Received: from L2f68a0ba6137.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2CFC0891-2BEC-43D0-848A-8FD712751A98.1;
	Mon, 03 Mar 2025 17:22:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2f68a0ba6137.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Mar 2025 17:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXR83CGMwtzSQbZGVJNgJltq6vAkcHs+HK8SoBTE5r0Yyc/NcmQkcPeFIROxogEO87XYPmnBoPUcAnYj+imNPfe53OwWgOSHl+yauud+IF647St3Fp8JhLQFWQCTiaNkR0Tkf7TVDFn/S+s9XSqIla8yY7IokDxju1+l3TSdqvohjfCiY6X6sh6KKtl/pU7YMKhHQDZfRs6zomEIeuQb40U7hrhPac5UQPGwNwIsPQuLFBDIIcbeSUPOnEGiXphZHVCwIRE6IFcnC5elPgtIlw6bOGb+kSRVaSU1MmhUvSdgPYvwu+YIsdXIuXDAohZCLCpTegtiqZsavfSkOEWtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTAixH0CXqD1eIJ+/aQpzL+iopAezN2twW1lDajfhZ0=;
 b=QShoQIiP5zmwIvWPxX/wtbFHzR5n/E5QReB2/2BDpO1dBQBI89g0UP68/ejfaVLqMy9IZjC72YdpN3eGNtxe40ry7PuYF+sfHGDTCKoP2HPFyzwbu8G1afqu7lISQJKGngHH1rho3qThYq5Hx374r1Cme75M6FDGsEgDryTpj/0MhFwE/0+8dhKl6RAajKcL64K9c4rrMwvRIb4mLcZ27pHAWHQiEvU3Uvco4gGhUVkxh/v7Fru3443lFNxjplP6V6w6NrqyZCPdPGVo/grAP8MPJ+4n4XTrCcb1VlOuXcY9ginNlU83UeYsdQnnUdcaMI0e7K9RMxMlITJjzPmZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTAixH0CXqD1eIJ+/aQpzL+iopAezN2twW1lDajfhZ0=;
 b=YAFaDPicmzfJycfBW+0wcTLivP+c3Lil5WCQDWyTWKWyz24XXutwHeQFuxGmTN1807R83VOK8opaR0M0LTaxFXPtO/Oxlo7CSStFY3YbrHoRuSba9OaZ9THqoYOQiMQtsNqXvNCsB4mnCYeuuSap1NaQ0e59ZAu0Ic9S274Q6VE=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by VI1PR08MB5438.eurprd08.prod.outlook.com (2603:10a6:803:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 17:22:33 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 17:22:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "festevam@gmail.com" <festevam@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Topic: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Index: AQHbgv9WX5PNc2F3lk+VFuXcuSlJrbNZ8WyAgAfKPIA=
Date: Mon, 3 Mar 2025 17:22:33 +0000
Message-ID: <BCF1E7C3-2378-4D65-8166-9F9A50069418@arm.com>
References: <20250219185119.2168718-1-festevam@gmail.com>
 <20250219185119.2168718-2-festevam@gmail.com>
 <706DB201-D621-4A78-B3E5-B0F775ED5EC5@arm.com>
In-Reply-To: <706DB201-D621-4A78-B3E5-B0F775ED5EC5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|VI1PR08MB5438:EE_|DU6PEPF0000B61C:EE_|PAWPR08MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd67948-8586-42de-d80e-08dd5a7801d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bHI0Ry9lbWhxeUlZTWlMNWRUNzhHNHRZUTl6TkthTnk1Vm8vZ0hzVkhrNklR?=
 =?utf-8?B?WTNqU0lNemVmYlN2UVFEOGZiV042SU5tL0pyajJwNGNqUmFLTGV0ZHZpK3V4?=
 =?utf-8?B?SmIrNHJwWWxDbkxiREhENWFmYVhCdWtVdTFvTnJ4MmJMNG1GVEV4RXp1QTBU?=
 =?utf-8?B?YWtFSW1KZVNFTVh6Wmt0SnhCNU96U1dSTlZZWDFWRld2LytMZm0zejJFZkVN?=
 =?utf-8?B?V2drRkc1eVFSOWgvZW5tZkt3OXZnUXBkMXJWd3p0WENadUFLOGswRmxNMjYz?=
 =?utf-8?B?aXJyamt4ck1QV1d0NzY2WEFLTEZMUkxSa3JHejBQUU5zdXBYTmw2Vm0rTHBR?=
 =?utf-8?B?UDZIdUUxQzNPakh5UGFjNzZWbm5ob2pnRG9EZzZvUlZmakpFOEw0M3EvT1Zt?=
 =?utf-8?B?ZkxzQWhRSm10SzFQb2t6c05oT1dHa3dKYVliTGhKcHdOMWkzQTEwbEluT3cv?=
 =?utf-8?B?NEgyK3pTWkRCd2hBR1N0OFlzcVdGcE5UWnFnVUdjR01hVnF4UUZqTklTUkJU?=
 =?utf-8?B?M3BQSGl6SzBVbmhDbE5uMys3ZTUrbXMzZW9kMEpnbWdpcEUvelNFYWVGc093?=
 =?utf-8?B?dmN3Qms3T2hqMUg4cTgvZXV5TTNMQXFjbDJIVVQ0OEpZa2tLYmdiNVRrMi8y?=
 =?utf-8?B?bVNKVDN4SFU5UlJodjBZSFlxMnNhS2J1Z1c2RkNuVVJWTkNrcVIxZWlxNFFz?=
 =?utf-8?B?MjJ3Y1c0YmdUa1lUNGNTakpPVmxGdnZMbHo3Mk9tUjdEbzhPQzBFMTRGZWJW?=
 =?utf-8?B?YXZ4MXZrZnB3aGlZWG1oYjJkVS85U0RDcTgzOUhaRVUwWlc2WDh4ejZ0emxv?=
 =?utf-8?B?S3BYM3BvY0g1cVIrRUdEcG9TYndmY2R1aVhaMkJwcnBIQW9rZnpPU2xIS0Zh?=
 =?utf-8?B?L3I5SFFqVDcvTlBLQTdWWU1IUVJqSnpRTlI2T3gxQW5kR0FHVTJrTTU1U0Jw?=
 =?utf-8?B?a0J1aEtMNzgxY21hM0dhalJzdEJvVWhKMDFxTkkyTUhQZW13bnl6d2hLNGRD?=
 =?utf-8?B?TGZwR3RkbDM2REdKUG03bWFEM0sxaGE3MUVSVWtlZGRQendDMFRnaTBDRm5J?=
 =?utf-8?B?ckxDLzF4QytscFlkdExYLzFkY0FzdmdVQjQzTUJxZk80UWFHSkR2TUMzcWdh?=
 =?utf-8?B?bFhQOHgrNVJjOVVYSzRLQmtVYnduS2hCeC9oRTJYSFZPQ1lMemhFT1k4Qmp1?=
 =?utf-8?B?Q281bGx3VUNLUDluYUhVbExVUXdTTHl6em80YVB1dlp1ekFaSlFpMVVBWjli?=
 =?utf-8?B?MllGemw4cTVCa2hVVFVsY1NSZ2tkMHZDM0NPSnFzblpCQ2NUdWZjbDBNQmlV?=
 =?utf-8?B?V0Jva3lnREZlSkV3UGhsQ3VnQUtpR3paSnlla0ZBYUp3OEJvYno2dERacTVx?=
 =?utf-8?B?cXdWT2RxdStSdkZCbDhNSzkrYlpzVjN1dFhJdGFCa0pmZ3JtMmNwYUVNUnRJ?=
 =?utf-8?B?YnNycEtvWnNrSVAxSXVQZWFrZzU4aGtxa2NlQ2dJV29VdUdvbDdTSXYvTWtr?=
 =?utf-8?B?aCtkeXU5YVZEeEpYNUx2VHpDWjdOcmQ5R2JheEJCWTZVdzRVRGxJS2k2LzMy?=
 =?utf-8?B?OTkxcjNRNThldzVUZExMQ2VEbjBpZzNxcnk5cWJyUlNXUjRSSmh1dDRJMFIw?=
 =?utf-8?B?RndvZUQ0SnMzZDh3Z3k4a2dVQU90SVJOWHU2OVh1MHFNV2VjK25Xc3R2bllK?=
 =?utf-8?B?eGxSbndoWEhHOEFaTXgvZm41VVJhVGcwZHFyU29LZkdEcFJjWlJCd2QrcXFR?=
 =?utf-8?B?R0Q3UkhIT216VituOEVKKzhWdmZNSElZdDVBaHM3aURiRXM5VHhoekQyWVhh?=
 =?utf-8?B?K3JZTHNOaEJiWXBNQ20xQTM4MjZRR0UrV0kwQVB0cllVRmU1SGpGU0llWU96?=
 =?utf-8?B?Rm5KLzZqRktXNm1QWjNJelF1S1JZK1dRakF0ckdXOFRsd3lidjBJQmRrSUVs?=
 =?utf-8?Q?3vUopnsNSEWeOk0XFHx21It7owIxbX3W?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FDFB8D29AC98B479F8AF84C8393E8BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	70281e20-b0ee-4a09-51ab-08dd5a77fc3a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|82310400026|36860700013|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2N0ejlMYmY5Y1J6ZGdWVUluRFRhWVMvaitlcVlSdzgvcnhISTI4Rm1yZkVS?=
 =?utf-8?B?STBsb0xZZHNLOVJlbGxWYWxKMzRHVjNyTmpRUnM2WmpONmlXTmZuNFBpd3Yx?=
 =?utf-8?B?MHJjSllkUkwzWERkcGdlUlduT2dxK29wZ3pZdXp1aXBzSlR6V3FKUzBLYnFv?=
 =?utf-8?B?L1lwbDdSYy9JL0dxcmdLUDhnTmIwKzkrNTNxTmdqYTdnSmhySlVQaElhdjhB?=
 =?utf-8?B?bXRrZTZZT3ZtRlpqTkVGUnJPNlJvM0xhUWZyWjRDaGs5TVNtbzhSMG1qTEFU?=
 =?utf-8?B?YWRubnF2K2JxNWlzdUJsKzFaUHY0Ujg3aVRtdTV2TkFtYzUya3E5NHp6MFoy?=
 =?utf-8?B?RDIxcXkvcGpTaWExTWtZb204T2x1L1BLSytSeWNGNHJSaUJzcW8rOStzNFQr?=
 =?utf-8?B?Sm5jMkNBbWxVVG0yUHhCV3BvRXF0djFvbTRPTkg5ZzZwVS9GK2NTNDZDQ1Jp?=
 =?utf-8?B?aGlLK2xKdURjeWRhM1FyeVpLSlR5T0QwMUhlU0NIa0lwS1BXeUY4VTIyNXpy?=
 =?utf-8?B?RGZSU0ZKMkE5Zis2Slh5SFdDVC8zWkg2UjJZdkxvYjh6WnlleHB4K2dkYnB6?=
 =?utf-8?B?OXJ6NUo2V2t0WTN3VFJ3TU5GcCtqRU52ajFSZ3R5Z0wyZFp3RzhwN3hTWC9E?=
 =?utf-8?B?bEtjcVFjYndSbVRuSmdsUmJacDJoWVRPWDN5Uk5zdFU1Zk9WTE90M2R6eXdM?=
 =?utf-8?B?aFBibFdMM2NxODkzYThHOUdRNThhc2dGb1BuSTZzakVjS0RCdG1xWDNjaXJL?=
 =?utf-8?B?MEF5RWZPUmRDbzcwMVN4L1FXOWp5eEFEWEdyZElRUlVFOEEyVm0wY0hpMlFj?=
 =?utf-8?B?RjFMZ3V0eTEvK3JpdS9ZT01OUVlQc2tOTGZrNHdKWkxwNnRSZzIwLzlyMXQ4?=
 =?utf-8?B?UlZTYmhueFpMb29RdDN1YUNCYzlNY0FpRjlmMnllRWdKaER2dDNrYjNhdS9X?=
 =?utf-8?B?RWU4R0pwazY4ZHFaRkp6amRHYVNrRG54UStSSnN6NU10T0JUTDE0UGVORnRD?=
 =?utf-8?B?L3hOb3RTVHdzdXEyVnh4OVR1NUpsTGFmck5UZllhd1BBMXdPTGcyQ0Q2c1Z1?=
 =?utf-8?B?cVNieUxSeTJ1OWRzRzl3UU96VW1UVHRTeDNHK3AzWDA2eThoUzJmNVVoRG1k?=
 =?utf-8?B?YWhXQnp6UmhJRjJOeUNueUhHaDg1b1FtdXM1WVkvaUxwN3k3bm5xcEFCNisx?=
 =?utf-8?B?dnlTVG1USGZBeUM5ZXVnWlQ0ZkZjWmZ5end1Y2dKWTdFd1pMa2pJMWdEenI0?=
 =?utf-8?B?OXpOMEFYT2lMelNweXZMM2hwQzBreG1oWFVmK1dMMkM0STlmaFdNZnk4OEdG?=
 =?utf-8?B?V2w0NHo3bGFwL0tjdlBXV1VKWTRxTWU2bGtMYVJ6Q3g5MFZPR2ZHSFhQazkw?=
 =?utf-8?B?R1lFeDQyczMrL2NoY0x5TkVWdXpyVkJ1RDVjQ2I4Z1gwUGRJekQyNG5mTzR4?=
 =?utf-8?B?dU9OZHVtZHJUZEVaZFdkZ3Zhd1ptTGIyblFrellaTFNwMzNpTFFSY3ZhZnNG?=
 =?utf-8?B?WHlCUlpQeURGMk9SNEIrK0FRSGxqSFlDZEZkWXpyd2YxbWFhZVZWcGVnQ05L?=
 =?utf-8?B?OHBsUlV5WHpxZzJwK0NGOUNjbnlGSk80TlhxZ1plU2dRSlhTMGgwSFlLNEZa?=
 =?utf-8?B?U2RMZmJwMU8wMXZCTFVoajl4UXI1MCtBOXJseFBsTU9nVjZTd1ZJNlRGRWNs?=
 =?utf-8?B?a1pURzUvN1dVVzdUYnQvV1EvY0ljTGNmYThxa1VGWUtzN2ZYaE9JN0xvS2xn?=
 =?utf-8?B?cGtrbDN4bGUwalFxWDEvRHlPVDRkNzNTZXVsQ290YlMzVWFXRnhpSTYwU0hH?=
 =?utf-8?B?dHBrUFhKeXlUcGc4UEtHdk8zRGQ3UitZSmY2NldoZTdGUEplRFFBbFR4VjdB?=
 =?utf-8?B?d2s2amlhTzFya0FEemtrMFpDZ0t2cVhyc1dUUWZvTjhxNXZVNzFzb01abkRl?=
 =?utf-8?B?Y3l5VnpCTEFZNUlqdmRPdDd2OE9IS1REZVdOQk04SUFXK0pTMXRJaWhlWURn?=
 =?utf-8?Q?Y33TqgCL3xj04jUqXwaUBrNN38wUYY=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(36860700013)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:22:42.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd67948-8586-42de-d80e-08dd5a7801d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10319
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 17:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212223

DQoNCj4gT24gMjYgRmViIDIwMjUsIGF0IDE4OjI0LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIDE5IEZlYiAyMDI1LCBhdCAxODo1MSwgRmFiaW8g
RXN0ZXZhbSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8ZmVzdGV2YW09Z21haWwuY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gK1N1YmplY3Q6IFtQQVRDSCB2NCBtdGQt
dXRpbHMgMy80XSBjb25maWd1cmUuYWM6IEFkZCBhIGNoZWNrIGZvciBleGVjaW5mbyBhbmQgYmFj
a3RyYWNlDQo+PiArDQo+PiArbXVzbCByZWxpZXMgb24gYW4gZXh0ZXJuYWwgZXhlY2luZm8gbGli
cmFyeSB0byBwcm92aWRlIGJhY2t0cmFjZQ0KPj4gK2Z1bmN0aW9uYWxpdHkuIElmIG11c2wgY2Fu
bm90IGxpbmsgdG8gbGliZXhlY2luZm8sIHRoZSBmb2xsb3dpbmcgbGluaw0KPj4gK2Vycm9yIGhh
cHBlbnM6DQo+PiArDQo+PiArfCAvd29yay9mZXN0ZXZhbS9vZS9wb2t5L2J1aWxkL3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgtbXVzbC9tdGQtdXRpbHMvMi4zLjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL3Vzci9iaW4veDg2XzY0LXBva3ktbGludXgtbXVzbC8uLi8uLi9saWJleGVjL3g4Nl82
NC1wb2t5LWxpbnV4LW11c2wvZ2NjL3g4Nl82NC1wb2t5LWxpbnV4LW11c2wvMTQuMi4wL2xkOiB1
Ymlmcy11dGlscy9saWJ1Ymlmcy9ta2ZzX3ViaWZzLWlvLm86IGluIGZ1bmN0aW9uIGBkdW1wX3N0
YWNrJzoNCj4+ICt8IC91c3Ivc3JjL2RlYnVnL210ZC11dGlscy8yLjMuMC91Ymlmcy11dGlscy9j
b21tb24vZGVmcy5oOjcxOigudGV4dCsweDI1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYmFj
a3RyYWNlJw0KPj4gKy4uLi4NCj4+ICt8IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBl
eGl0IHN0YXR1cw0KPj4gK3wgbWFrZTogKioqIFtNYWtlZmlsZToyOTU5OiBta2ZzLnViaWZzXSBF
cnJvciAxDQo+PiArDQo+PiArRml4IHRoZSBwcm9ibGVtIGJ5IGNoZWNraW5nIGZvciBiYWNrdHJh
Y2Ugc3VwcG9ydCBpbiBsaWJjIGZpcnN0IGFuZCBpZiBub3QNCj4+ICtmb3VuZCwgdGhlbiBjaGVj
ayBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gdGhlIGV4dGVybmFsIGxpYmV4ZWNpbmZvLg0KPiAN
Cj4gbXRkLXV0aWxzIGFscmVhZHkgaGFzIGEgc3R1YiBpbXBsZW1lbnRhdGlvbiBvZiBiYWNrdHJh
Y2UoKSBmb3Igd2hlbiBhIGxpYmMgd2l0aCBleGVjaW5mby5oIGlzIGJlaW5nIHVzZWQsIHRoZSB1
bmlmcy11dGlscyBqdXN0IG5lZWQgdG8gYWN0dWFsbHkgdXNlIGl0LiBBbHRlcm5hdGl2ZWx5LCBp
ZiB0aGUgYW5zd2VyIGlzIHRvIHJlbHkgb24gYW4gZXh0ZXJuYWwgbGliZXhlY2luZm8sIHRoZW4g
dGhlIHN0dWJzIHNob3VsZCBiZSByZW1vdmVkLg0KPiANCj4gSeKAmXZlIGp1c3Qgc2VudCBhIHBh
dGNoIHVwc3RyZWFtIHRoYXQgdXNlcyB0aGUgc3R1YiwgbGV04oCZcyBkaXNjdXNzIHRoZXJlIHdo
YXQgZGlyZWN0aW9uIGlzIGJlc3Qgc28gd2UgZG9u4oCZdCBlbmQgdXAgY2Fycnlpbmcgc3VycGx1
cyBwYXRjaGVzLg0KDQpVcGRhdGU6IHRoZSBwYXRjaCBJIHBvc3RlZCBpcyBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyNTAyMjYxODI0MDAuMTcyMzQxOC0xLXJvc3MuYnVydG9u
QGFybS5jb20vIGFuZCBpdOKAmXMgYmVlbiBnZXR0aW5nIHBvc2l0aXZlIGZlZWRiYWNrLCBzbyBo
b3BlZnVsbHkgaXQgd2lsbCBiZSBtZXJnZWQgc29vbi4NCg0KUm9zcw==

