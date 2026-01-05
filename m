Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A2C79FB4
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 18:09:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70830.1767636574276588917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 10:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NTkbMsfG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NTkbMsfG;
 spf=pass (domain: arm.com, ip: 40.107.162.26, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mtZt9KaN12eEGd9Ca8+nHP9ZrfGaCA+NDR7O9n+k0trIenQ191cILo1962vZw9TgD1cRwR2Kcw40kgAffCf0XwjfJ3PM5eGiFNcMLm4m5GwHXPHmL8TBaKMjK82/ksxjHqrTLqmZ4520oa0iIMJJdTMlu4PC7ILpbq/8uzdmSYTtj2kFtTCOcQrGU1d6dgU6IaeRt+24cxD3NR9yqFAfss9vMB60V3TWM05HX6VWVFPJhqs0hd1WbiJ813mYYmDp03Xqyhy4Ysmiq05SJx5Y2THrZbuYYuJEaiwNL0Ve/CI0H1v0zCRrfycffwBEP2AjmOGvHpIOr+1bAS2W5tRmeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6eA7cMFaIM/E/ZT3TMmzOHTCKir/Rj84AZBpBoFWco=;
 b=UXcZD97kDNKnRBDPR6Z7inY04RKPQQFZRECV0UKorFrV65He1ckMf6Iz+D65aeAxKMQvS0nLVtyBTDVzPqhKETJRxuSjc9Xl9/h7ky9g360stheHglHWi/+o/ejdcmn/hXwjEBKMkgH94Hxxtxl70myVzByzuZAqFgVVaeH8kXPsu9rEDjpb5sI/rF8mYhJboU4Vvi8EGurcajyQgwTSOevfHRHDWQOd+9hWTzJrULFBsZGV436kjIfUEU+4a1uRsQxgb0jnB5fvlk5l2h4K887++J9wGx3Vn/AsX7GZZIQ1e05XuJCUU5wHCphF4crvlS0vMktywShGmeGJCn3Pbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6eA7cMFaIM/E/ZT3TMmzOHTCKir/Rj84AZBpBoFWco=;
 b=NTkbMsfGOreIFTVPTMMjnX/qlG+Ffhbmx/Gs5wwerW2E2WLhEI24ohKhnxYrDEO7ikAfEtVZk6Y2hjr89aOkyq5MMABeejZghzzuoNMmMCUEF2vbkUmO3+ia/LZtnt5PvIG6EXT1xynSLXSGHwj7xKE37d5fUQUQH0XJVWMWxRY=
Received: from AS4P190CA0033.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::13)
 by PAWPR08MB11358.eurprd08.prod.outlook.com (2603:10a6:102:50c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:09:29 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::4a) by AS4P190CA0033.outlook.office365.com
 (2603:10a6:20b:5d1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 18:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Mon, 5 Jan 2026 18:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDcJ35nvh+mnvhemJeVTBxq+Jt4UTmWjbBJYVXogIlhXusVlxYiHVnKWPojrU289EV6J/cNJysCuINT6Wv2F4r3VnBILtLCH+Om4he2uGMUrtPISPY/ozxuLpDWzgry5VOB/LwvLiaAxpCzKXp7TSr8w6/tuG0SawTv8p2NvtrQFKKGTwpZY60z2UUfolo69b8MMWy++fyjW6iwM/IHBYsSHiDOG1DkrbZh0vXOM97kqymQMtqI9d7xYc0//fmRSMpya4c1UUw1dqvGMQbZW1SYWz0f0inx9cy6Mc2YXl4oUA2+ecQMiOGzOBlvKvXhkbcHvvlPcuffnud5Sw9+yUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6eA7cMFaIM/E/ZT3TMmzOHTCKir/Rj84AZBpBoFWco=;
 b=NRVje8giWA1f0BtPTk/CTlG1/IgL27t+oP3LORCou+4VXMl0TkyWe+wfI8nVus0JU7QIZNoAYWNSmjOSkMpcpeof+JuguhAOV8nlw+q9bNHX2UDiHQ8z4wlrIsulDU0xhUh3OKxMhLvn4bng94hvps8cXPIuGD59X/yrAnD0Xwj3MwX6Q1Oe6Ssga/BmqR7le/T2eG54T350Nznkts79fEYjPykZ8jmf1axQqWqrKbDu8YTVb0LZZGMGK9ZSm45lmWZjsDtDQPY2RUPnn4+CSZCywbASbjPK1+yxGTS3bHqxFfZV0yezRl4VKleUNVXheK2ClXK4jrOcQvU9uy40kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6eA7cMFaIM/E/ZT3TMmzOHTCKir/Rj84AZBpBoFWco=;
 b=NTkbMsfGOreIFTVPTMMjnX/qlG+Ffhbmx/Gs5wwerW2E2WLhEI24ohKhnxYrDEO7ikAfEtVZk6Y2hjr89aOkyq5MMABeejZghzzuoNMmMCUEF2vbkUmO3+ia/LZtnt5PvIG6EXT1xynSLXSGHwj7xKE37d5fUQUQH0XJVWMWxRY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5366.eurprd08.prod.outlook.com (2603:10a6:20b:10b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:08:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:08:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] go: fix multilib file conflicts
Thread-Topic: [OE-core] [PATCH] go: fix multilib file conflicts
Thread-Index: AQHccvKSzBTMnupcBEK7FkpIB1AnNbVD9qCA
Date: Mon, 5 Jan 2026 18:08:25 +0000
Message-ID: <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
References: <20251222032455.2683666-1-changqing.li@windriver.com>
In-Reply-To: <20251222032455.2683666-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5366:EE_|AM1PEPF000252DA:EE_|PAWPR08MB11358:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5f514a-820b-4bb1-bcc1-08de4c859133
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SFh6ZFRBdU5ld1d4dytEY1ViYmozSUdES0o3SC90MFZCYUlWYW85cjNUR0tC?=
 =?utf-8?B?bDVBZjlFYndVY25iNVFUeUg3SDBJK2RMMUdXdkhKaDB3d3gxVzdlM1hYWk1z?=
 =?utf-8?B?UW42aDAyRWhHRVZjMTAwQ3Y2cEFSZzNDd1E1WnRVVVVZL3BwWXdUR0J4QUVB?=
 =?utf-8?B?QWZRd2ZvUWw1b2s4OUtENjVSNGh0azFVZ1I2T2VwWDIxcWJEMkFFd3ZHTE96?=
 =?utf-8?B?bE91R3lHVEM2dyszZnhMdDBWbkY2UjREYTlyQ2liSWVQZklmQmlNaFVVeXJo?=
 =?utf-8?B?aUpKQXNEdGdGUjlDZCtsaXA5dUxXMVRTeWFsVU5wQkZpVTNua2dKdSttODhs?=
 =?utf-8?B?YkRGT2VTUnFEakNmbnprTGY1OUFXeG85MHIvVVlGMmlhMFB4bWNOZm0zRU94?=
 =?utf-8?B?MTJhK2ptSnU4RnQ0V0lIamlnREUvc3JYS1huVWFiTkpYVUVkT2FLenVyT2xv?=
 =?utf-8?B?MkJqc1J3ZEpqa3FOd29oT1hzdmthWTVrVjBXYTRac25xY0MwUnZtMm5RQ1Yz?=
 =?utf-8?B?c0pCNEQ2eEQzZ2gxajBMMW1QdWw1azR1QmxrMFY5SUVFWTNycGV0bWFVQ3BQ?=
 =?utf-8?B?RUpiK1duZWdBNXdSU2xBN2FGMG83N01NQ3BwUW9lNVhBRUI5a3hHa014MmVz?=
 =?utf-8?B?d2l6N0hjelhpeFo4NUxTZ0JCOUx1ZEFvNUFOS0ZvRlpoTG5ENCtYdEt4VFFJ?=
 =?utf-8?B?d01CTHA4VDY1SzFVOUlUcXhjWVJxYjhoRnBDdmhwQVBZUk5qM2xNZ2pvclJF?=
 =?utf-8?B?N0tJK3BiNkhHQnJLT3BtQVJLcWg3RHlmZmRLRkhLRGRtQ2dzUzE1Q1lVNlZI?=
 =?utf-8?B?ZzFHNDhNUlhoVXhBVDZ2QVBQK2svNUJCYVpQdWxuTGYzejBjZU1ISm5uYzNQ?=
 =?utf-8?B?eThhanBXQXJnamVVRzc0V0hkRDI2RlMxaWdPNzQ1aEdld01lVGFIek1xR0dS?=
 =?utf-8?B?ek5UL1F5ak5Wd3VtNkZ6VDF6emlZRFhBK3U3ejVBOHdYTFpyM2pvQ0p6czY4?=
 =?utf-8?B?NWpqV1hSSFRBTEtJNWVKVkdMR0Y3MGhEMHRiTWJoeml4VHo1S2wwa2tVN21Z?=
 =?utf-8?B?VFQ2L25zR1lrOFIvVVZBUm1YaVNRYy9DRFBLWXlvb0N1LzFPT21ENE9EYmhY?=
 =?utf-8?B?UjkvbkRZa0pXeWUrZ1p0VXk2VmdvQ05hN0hQN2U4ZUQrenB6RDBWdFVDNzQ0?=
 =?utf-8?B?QkRrTGdLUzMwN0lmZWxxeHFKc0toRmU0QStlVEhJRE5ScExVWmhIZVl2Mk5N?=
 =?utf-8?B?d0lPY05ISUthTmhISXdyWTJXeVJaR0NXcXh3cU1Ha01Kd1VGOVlVTGNEeTJT?=
 =?utf-8?B?NlFiUGNxQll3Uy9FWENseUtqckU3NTR0ZTl5c0hwVm5zVXJXRmRyYWJqNndl?=
 =?utf-8?B?ZVo5L2xSd0JINVM3ZUZ4czVpYWk1S3ozM2dtVUI0NTlHUjNIdEdXMlpFNEZS?=
 =?utf-8?B?THpTU042SnIrUE1FbWtFeDBlVVFHbk5YOVp1dDhoWWlDZStncTZCMXlFWkVE?=
 =?utf-8?B?dE5IcTcwL29ZSGJHTTRsVjRFWFI5aUZiazl3M3dUOU5JNG13d3JPOGo1ODQ5?=
 =?utf-8?B?QW1aaFJHdXE1UmlPWG0wNHBYZ3RVeVFmOVo4SEhROHR4cytnc0tQNEZjVVRm?=
 =?utf-8?B?UXZuRTFWU1dxUHRISkRGTkR4T0MvazkzTFlXTTd4UDFLcFhUWGdVbTVld3Mr?=
 =?utf-8?B?SEZtM1M0eVc0STFPVUQrbEJXTDRPYUtQalBNRUQxYXR6UWgxRXcvTUJRV2ZJ?=
 =?utf-8?B?Y2Q3YmlocFEwZks3NlFwMGQrSk8zTkdPUDFsakZCN0JKbjhBVTBKM2V2MWcv?=
 =?utf-8?B?aFMvUTF1amNnS094TVBlb21qRW9QWWJsSk9UK2IvU0pWekhMM2ZsLzBoODE2?=
 =?utf-8?B?ZEdBeHlNeHBUOWtMbEQ2YS96SSsxb3E5eUJXeXJTY2xnM1dpZ2hXd1dqM1NE?=
 =?utf-8?B?SjQ0NHl6OW1kQU1HSkpZTE9WSWVla0ZjR2gzR1dYOWJ1Vnl6ZURLU2MreWdO?=
 =?utf-8?B?Zzd2RVRHc2NadWFTT0hGZS8rR01mSGZxNUQ4MGtsZjdmd2w4MDBrcUtDRUoz?=
 =?utf-8?Q?h5eHqj?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <655EE3FD7AA219419E369F7BC09F2A3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed572aa6-d551-47e9-c806-08de4c856bc1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|14060799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXJKYURPaWo2MTRNMXdnemxzSGU5L3BSM3RMRnVrRFA3ZVNFOVIrSEJ4d2lm?=
 =?utf-8?B?SW1ZOGhTazhHWFVQZXlrNHAxMTVEdk45WnRkeVRGT2twR0hjTXZXQWdMM3Bi?=
 =?utf-8?B?R3ljWSsxSnNRdDh4TzVCZDkwanBnQmZJZFY0aEZqek5NS2JxTndTMFpuc1Yw?=
 =?utf-8?B?OFZyeDdsWmhoRGNTNVY3ZUV3a1MrdjM5UW9Yd0JzZTUrcStiTzVjZ2NYbFVt?=
 =?utf-8?B?SENTVkthY0ErNlBSMGtSUURITHE1QXd0dzFvQlNIM1hVQWdNOXNzYSsxSHVO?=
 =?utf-8?B?dW1zdjQ0TkdYWVZaSDRNekVZVGUzQXU5N0Qvb2ZvcnRqQ2JxL0pTOVFqLzNy?=
 =?utf-8?B?WURndkQvRThXYk9XSkM1czVhMnl4N2hMSy9ibWs3SGlPZnZhS3pGVUJ1Zzdz?=
 =?utf-8?B?ajNFdU5vYVVRMlBnS0hMMHpTWDdIVzFUQkJrTzgxS2V6eW1FVlBOcUpMVEJ3?=
 =?utf-8?B?TU5GTDlOQzliQ1dYWm9kd2puSXR0V2I1OEV0THdCZW8yRGZNWS9ERFRjVGRZ?=
 =?utf-8?B?d0hhQW93NUFMTFZvQVlGdENMbXR3QWtiMC9RMlRTTXJJdERrNXpwN0JCZkJa?=
 =?utf-8?B?TGJwRDZLZlU2cXZBS2JCTVMxcWp2UVM2QnFiUUMzeEduY25wNS9GZnY3R2tG?=
 =?utf-8?B?c1NHdXNrSkNIZEZWQ3V6NjVvVXBaa2l3Sk15b3lnSVkrdXhoTEdxVkJKVldh?=
 =?utf-8?B?RWUvcEYxUDFGU1B2by91UkNMd2kzcTNhL2dpZ1RwV3ZYM3gxajdSWmRaZE5n?=
 =?utf-8?B?OFcvbG5zUVpQanpPaktpUmRKSlpRR1YzNFVHVm5WZWErQ200QWlYTjZBU2dM?=
 =?utf-8?B?TDlKazZySnB0WElsZzZnUlZzdnBxZWtxYzlkcURvVGVSbkxsWjlzSFRvRFNy?=
 =?utf-8?B?eEQ3eSs5VnJDNXRiVHVNZlFpTEtZMCs4VUhkWWgyYkFBOUxiTFQ5Z0xkS2N2?=
 =?utf-8?B?a3kvRzFVdVBPUi9udXdUYSs1MFowRHV0aDI2TFJObllPaVpTR0JHSTlCNnRO?=
 =?utf-8?B?ZnpLTE8wMlF6cHlPdDZtdmRMTHVjVDFvYXZRMEFOcEdlTWoxL3hwd21Xd0N4?=
 =?utf-8?B?Q2dMREt6SGJORzVYZWhVN2VMVnZEcFpOcTF5cW54R3hHZCtWQTRRcTZ6M1RV?=
 =?utf-8?B?cnpmbyt3ek9KSGFYQ1BFYVpERXFuTGFBeDdhd3Y5RU1xaTZKczJTd1NBRitG?=
 =?utf-8?B?anZTdzFoUnFqcXhSZGJaWVNpZjZDdWtiNUhLRkpIZGNmZktDUGxBcnYzT0FT?=
 =?utf-8?B?ZmozQzRQOFJiMVpCVktmdng3UkNjQ0xjbmlVck1BY3dRcTF0eG1EUjhKSHlK?=
 =?utf-8?B?SXAvWkFDbGo3MldMcXZ1UmsrcjRxNEd0TnlXRjVLZHU5clNCNVFlVHR2bjNu?=
 =?utf-8?B?UGttSVo2NnNzSWJIZ0UvWEh5bmNqaDBTYUhMZWwrZ2NFeVU4YlE2T0NzNDV4?=
 =?utf-8?B?Mzl0QXMxYkkwUllDMEl6Si8zMDJhVjN2OCtDQlZTVmhQRDRYdFdIaWhtcklC?=
 =?utf-8?B?OGw5ZHljWTA5REJNVHdQMzRseWdnT2YvVS8zcFd0azNUdmVQdlZoUmpsYW1L?=
 =?utf-8?B?UzRnV3BQRXkvQlNEVUw5a3YzR2hkdUlqMUpod2lhK24rWU96bjBlaU5VQlB6?=
 =?utf-8?B?cENpY2dSYm1HL2xFMmtyVHp6cFNvZldJeC9nYXVGMXF5RERING1TaDZUQnJh?=
 =?utf-8?B?SkJzV05XcEloR3AwTWk1TWFBc2VKWlNPMXhZclB0T0N5NGpEbUxDUWVSRGVY?=
 =?utf-8?B?bjM2cGRGc2FYNTBSRlh3U2crbXNPM3NySWJVblJFdERSVWF2TzVjcURpVUZH?=
 =?utf-8?B?eGxxekR3eVgyYiszei9YUUtHT0ZSalo0cC9aSmFOV2cwNFJxWW9mYms3VlhC?=
 =?utf-8?B?Tit4cWZDdzRubk1oWXl6YW5qejJWQm52a2VnUHQ4U1RSR0VuWWM1bTlhazl3?=
 =?utf-8?B?dmllUnhVTm9Wb3I3eDFaNzZsdnM4bi9xejMycmxBZC9jbW5uUTRiVys1dGQ0?=
 =?utf-8?B?dlNlOFE1Z3JhdVM4MW5YTWJVVmFOMGNwRjR0Nnd6b3hjNWlDYmtKYU9qa0Zt?=
 =?utf-8?B?R2VjRkhldlhJQXhCNkFmamFtOUd4dWwrTDU5VzlWQ1dMVHIraElwTExOODBV?=
 =?utf-8?Q?ReqU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(14060799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:09:28.3143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5f514a-820b-4bb1-bcc1-08de4c859133
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 18:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228873

T24gMjIgRGVjIDIwMjUsIGF0IDAzOjI0LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4NCj4gDQo+IFRoaXMgaXMgZm9yIGZpeGluZyB0aGUgZm9sbG93aW5nIGVycm9yIG9m
ICdiaXRiYWtlIG1ldGEtZ28tdG9vbGNoYWluJw0KPiB3aGVuIG11bHRpbGliIGlzIGVuYWJsZWQ6
DQo+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiAgIGZpbGUgL3Vzci9iaW4vZ28g
Y29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mIGdvLTEuMjUuNC1yMC54ODZf
NjRfdjMgYW5kIGxpYjMyLWdvLTEuMjUuNC1yMC5jb3JlMl8zMg0KPiAgIGZpbGUgL3Vzci9iaW4v
Z29mbXQgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mIGdvLTEuMjUuNC1y
MC54ODZfNjRfdjMgYW5kIGxpYjMyLWdvLTEuMjUuNC1yMC5jb3JlMl8zMg0KDQpXaHkgd291bGQg
eW91IGRvIHRoaXMgdGhvdWdoPyAgV2UgZG9u4oCZdCBzdXBwb3J0IGluc3RhbGxpbmcgYmFzaCBh
bmQgbGliMzItYmFzaCBlaXRoZXIuDQoNCklmIHRoZSBnb2FsIGlzIOKAnEkgd2FudCB0byBidWls
ZCAzMi1iaXQgZ28gYXBwcyBpbiBteSA2NC1iaXQgdXNlcnNwYWNl4oCdIHRoZW4gbHVja2lseSBn
byBpcyBhbHdheXMgYSBjcm9zcy1jb21waWxlciBhbmQgeW91IGNhbiBqdXN0IHNldCBHT0FSQ0gg
d2hlbiBidWlsZGluZyB3aXRoIHRoZSBzdGFuZGFyZCBnby4NCg0KUm9zcw==

