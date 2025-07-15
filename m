Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEDFC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:01:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.38])
 by mx.groups.io with SMTP id smtpd.web11.10683.1752591685534252674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gsKykok+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gsKykok+;
 spf=pass (domain: arm.com, ip: 52.101.70.38, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NtE5QNz0omkrN1p7JROcr9UnPZQFRQzyP2Lp8KzD3nwKgggMVRfkRPs0lWiisx25eTmScMx0/jBODLH+Fsp5KoogIQdM93ZBtRl9i50sBukkFuJEnLTlW2uEzFv9llZjJOIvSRgbftMSWbHn38xrC0anBacwTuewFNQsG50du3we1VjVA0A6L1jYGLQKBM2Q0epSgQUaGsnWoTHPSQfTGoHrtmaHZo5bAjAMy6JlHClBltRxqJ3P3Z+llCroNiU5MMt2bHJXayihWcu+Z7Oi6GvjCRamoU6sa+9HdtQ3XWDnew24YtyaXEnKmuximd2y5fJEpMO5NE2hNsWG+p5BZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oZQ7FiREOW7U164+QN+I6PIjz1BjHfWX8rsh42vt/Y=;
 b=HhVWuv7fcltn3xjsFVe12Rzp3EwB9uixcnHn2Yd01KkF9RHpVG6hMJfFcU/2Yf2QrNl82VQNYRO76ZSJjnBbOQbw1CJkwuyjcJGT2cEfvYF7CfIczy/Ot+Dr1YihZZxJLm58WNIex7gpzPFReAYVn77bv+Guty1jVoBUaWzPOY7NmPQ4sqZEZkvRoN+DuPmOKY2uQykizX29HIBrYSw6dkNnSkUiryZAZbl1b19MXr/rqYoM6mm+oU18bZxhSX5Sdp07SBStDw6u8TvYtPYsqT8VPXqecwcmYQIG145f1XkSwJ0ke0E45rgBaXO3sM0+UcOUdlftrYPkkfhnrZsjbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oZQ7FiREOW7U164+QN+I6PIjz1BjHfWX8rsh42vt/Y=;
 b=gsKykok+nFvXc5HaUd+bZXjab11NnmrimnqBl7ST39d39jAUSjtt3ZnhCu3RKEXO+5UIpG6sklB3+iXqafUvXhNjf0w0TKlr8HLT7N97DIY2Fob1X0Cs8FP3AD4dhbnnMTDvoDZwgoBDT3c+SP9PcCKboer4z68TtxXe33NcmmY=
Received: from DU2PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:10:3b::12)
 by AS2PR08MB10266.eurprd08.prod.outlook.com (2603:10a6:20b:62f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 15:01:21 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::b2) by DU2PR04CA0007.outlook.office365.com
 (2603:10a6:10:3b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Tue,
 15 Jul 2025 15:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via
 Frontend Transport; Tue, 15 Jul 2025 15:01:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkEoVDFbgg3F0qJbpxoJGO/VR7mor455LwC7wuRet8e1OVZVUj9lMCvaeQMPK+3BvXJhb+Vb0gu1OpBbVKeBKt8fet8JwtvCoAO3XiQuffl+FLarblrVUSl8McdGDync+IW4hb0pY8EWaML1oFzk9C0Gw9ioVpgLuK4sDC4nriUJrGbEaPsblR1PvzBZJpRsFLEouGNUD6k+4T60eQWZc4B9KERj4DbFFzJLwjEUoz3N6Ny/wO5f+HJ6sUvkHlcUoVdlksr9m9980VqLbUNMrdJ6yilydXcYizAn9aF8FDIdY0mpqMV6NWSoRLLSu7XzurzYxh9Yh/tM8JHW/LzHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oZQ7FiREOW7U164+QN+I6PIjz1BjHfWX8rsh42vt/Y=;
 b=aRR2L/Vk6nTZxVH18lLUfwft0ZQvrDYv4nVjI5wYSXGi4FAHpZG8jHnIfDjukCN+0TWbwy4eOQq7emBDrMmqS7ZVwAUo38COHEtYVdU5b8E+Qp582wnBA9XVt8uB0LCJVKIf7vD4MxmZrKVUL6n2J6B/ok7kdYiyKqcuC4edy9Wa8ve66/3reB6t2sfl0DPBR6HWzgWUgMPrd3h73hchpgLGTuakVK3+V9vYTXCnrAbxDOXwd7GCmoJqA+YjPV9PZ1ztufops4rn161fbQ8fwHSgi//NEoxji+doi/0cCoFx7top9B3Ejtu70dSNUEhHJ4MTzyUej+lZZZxVMgxr7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oZQ7FiREOW7U164+QN+I6PIjz1BjHfWX8rsh42vt/Y=;
 b=gsKykok+nFvXc5HaUd+bZXjab11NnmrimnqBl7ST39d39jAUSjtt3ZnhCu3RKEXO+5UIpG6sklB3+iXqafUvXhNjf0w0TKlr8HLT7N97DIY2Fob1X0Cs8FP3AD4dhbnnMTDvoDZwgoBDT3c+SP9PcCKboer4z68TtxXe33NcmmY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8053.eurprd08.prod.outlook.com (2603:10a6:10:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 15:00:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:00:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libclc: split out of clang
Thread-Topic: [PATCH] libclc: split out of clang
Thread-Index: AQHb9ZgSn0qv46Tt4Uy1mH4P/+mmqrQzR0AA
Date: Tue, 15 Jul 2025 15:00:46 +0000
Message-ID: <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com>
References: <20250715143139.1829393-1-ross.burton@arm.com>
 <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
In-Reply-To: <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8053:EE_|DU2PEPF0001E9C2:EE_|AS2PR08MB10266:EE_
X-MS-Office365-Filtering-Correlation-Id: 9875d29e-cfe1-4072-9fad-08ddc3b07520
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NlZuMmZuVXdPTDBqVGlKZ3c5NnBuczVGVjd4dVY5eU8rMjRKM0tTejhiOVFT?=
 =?utf-8?B?QlpxaitHT3JOQzNmN0IzY3hKa3pRMkJ2UFEzMW9NYW40WWhDNVV3S01IN3hY?=
 =?utf-8?B?YXUwbmp1bXljSW0rNEdYc3dIcEdKcXNmRHM1dGFsLzltNk8xZ25qY1ZZUGZ6?=
 =?utf-8?B?OWlXMzA0Z2d5N21HeE9rZ3VES0o0STZ3Qjhob3AvbTNlWXE1clFLaC9oSVRi?=
 =?utf-8?B?SzUxZHR4eFBaY2x1V2p6bzdNamJjUFB0MDFCS3pYT29GeWlqemd2M1d4TGs0?=
 =?utf-8?B?ZmNiWUF2QStLT05INWxlQytpQmE0L3BGdzNrQ0J0b2RDS2hoRWF0cCtXVGNs?=
 =?utf-8?B?R3pRdDJmejljcW8vU0c2M2JueTNGMFY3Tk5zUi8yRTFybVZiMXZyeFJEN0Mw?=
 =?utf-8?B?QkJiaWJJQnB0NWNzVVdHQ0d6UGlMeGRpQWF2Skg1NnZOQWkvQkVHcE5GOXVL?=
 =?utf-8?B?MVk1Vk9rRkdJVDVtZTBxd1VONnRxZUNRVHpMM0JLK21JQWo3THpDemtPenY1?=
 =?utf-8?B?TG9BY1gvVitjMlB4MnBJRE0zQUtkTWh3R2doOXZTVGFjOEhyWlRpL0hBaWVs?=
 =?utf-8?B?Q3hqMndJUlZPN2t3SFY2QUI5cVY1VkNwclVnNGNPcTI5eDdjWWxTNitON1M5?=
 =?utf-8?B?RjhTV3E5N1ArRUYvUTU4K2dtRUNabm9nUVdOMlhWcUhkUGVIekw2MXJ6UWFt?=
 =?utf-8?B?TE8yQVhuOFhhTTh2RDdtR256RGlGQko1bm1oRVdxakF0ajN4YlBCY3VodHR0?=
 =?utf-8?B?ZVF4Y0hKOXNhRFExdkpTbDJtVHhwK2ZUbnZmY3B0UUNUOTczRldkRG1EbGhp?=
 =?utf-8?B?TkJtMWY2dFdOOFJjc3hSUUhhMEdlUUdiVTUyNWsrbXhyUG5CTjdUQXovS2pN?=
 =?utf-8?B?RVZLSEw0RWR5alErcHRsbnpxMGxDODcrazlxNEUrR3ZCMTZGV0x2ZUxZbmRs?=
 =?utf-8?B?cnAzSXFzNXNnUkpHaVFTbWhiZTFKa3RkOFoxbDl6Y010VDlBVC9mR0h6ejRZ?=
 =?utf-8?B?Y21nYnA1aldNSVRsOXpqQzBLODZ2MGRqVzNjRmNqU1JWejhsYndlTUNLN2Fh?=
 =?utf-8?B?YVFRVmtjMks1YzRUT0pBTnNRZ0FXY1N0RkVkRGxJR2k0U1J1Tk81dlpzUFpT?=
 =?utf-8?B?eW9zN1BlNnRYVkFNeXByZ2pHSkZnZXdmUk9HTytQUUVsZHFYWXp0Q2dyMFlG?=
 =?utf-8?B?c1lQT1l0QXFXN2RuS2VOYVU3dzZHUTQyYXppUzZIb0RHSXpUSnpXNUt1dWd0?=
 =?utf-8?B?ak0zQVFOM1F6Tkx3bFRHaXY2RGxjU3lEMGM5UGVmZ3BaeFpwNWNvNXNIVExF?=
 =?utf-8?B?T1BURlRWYVVFSU5hanhxVWhQQ3pWUnV6amxScng5N0o4ZXV2QXlXTUliNVBD?=
 =?utf-8?B?S3dKeFh3c1pnbFBCU2xPQ0NFMXIyelFHVDhPSWc3SUc3bnlVbXZvdTZtZVFJ?=
 =?utf-8?B?S3ovVndCcEwreldHVVBKTjdKZGJ2NkMwQnBnRTBsY1NGRzlmOVFUV2tTZmd1?=
 =?utf-8?B?NFBXS29IcjFFZ0dlOUJJeXQvc2FZRnV0MEw4NTBLSXpROG1WYk14K3FUNXdx?=
 =?utf-8?B?cWlXV0RmVzdsVlQ2Z256Z2dxN2Q5ZXVXZXltTElxM2QrSFdKRjU5NDA5Lzhz?=
 =?utf-8?B?eDNvaVgzUnNVdG9TOHFsc2Q3UUFXYmNXZTE5dXlVMzFUS3ZVc3lSSkFDOVh5?=
 =?utf-8?B?YjFuVmgvWWpTNjdFY2c3UzZZOCtDRU5OK3o0aENTWlp5ZThxQWFTelp1M3ZY?=
 =?utf-8?B?azRJYXdvQ0h5RHpXOGZPR1BvR1BwdmsrdTZZVTArQTJocTFMWHVYUTRGYW13?=
 =?utf-8?B?VE02dDRQWFJSNThPK2lsQ0Y0TVZCQ0Z5QWFWalUxNTRvRVdiMW1ZbFoyRzla?=
 =?utf-8?B?eXYydUFtYmJMMUZzK01HWUhVT2t2L0x6Nk9WV0wrU0NqZVB3MTdxa0I4NTFM?=
 =?utf-8?B?MHcyVUR3TUc4S25WNEUyb1M3dDJBVjQ2blRUdFBRYTF3MHNDZHQ4ZHF1UThP?=
 =?utf-8?B?NVVqQlU1ZklRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <676963FB3D99504B9E207D50F8186D4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8053
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e31c2ca0-37c5-47a0-ec90-08ddc3b06118
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bS9jU2d4V01ZajhNbkpEeThnd0dwQmNyWUJsWWJVaTl6UkplTkZJQyt0eC9M?=
 =?utf-8?B?TW92S055SDdueG5ndmlUSys1cnQvZUZTUVJXQWxZL2kxZEo4WjB6bzVIczU3?=
 =?utf-8?B?eTNTWEJDalBmMmEyZ0hERmdWbzNBLzJyRHpyQUNrdGpKTjhFdldUL25pQjEr?=
 =?utf-8?B?SlNlcTFjMVozTjluYnRzbE1hN1JHOHZ0Qy80RlhaMXY1WEUvR2s4Wng2TUVx?=
 =?utf-8?B?MkV3MVA4MW9vcGUvWFJqM0Z6Y0pZMnhKbUw0VWJ0OTdSU3ZJTUZiTjFycU1M?=
 =?utf-8?B?QmVZbnV6UmlNclAvNzBIRFNXVUd1ZVNydndIRnJLTmIrNFkySzZRVGg4b1dS?=
 =?utf-8?B?S1J6ZTRNUUpzaXRXNWtqbWhKZEN3QUxxM09weGcxQVNnTy9uMUVyTWdBNjg2?=
 =?utf-8?B?L2IxZGhEdEZtNnZqSzM4bk1GQnJxKytnSG53MW1sTE81c3VkbHpXK2tEN0RK?=
 =?utf-8?B?dExqUUJVb2hnb1NJUXR2NTB6a2dhOFN6R05ZaWZJRjkwWGw4aDYxVUt1RTF1?=
 =?utf-8?B?anNPMHNxQkxROFl5Z0d4TnhXQnNQLzI3WGVGcUk0MUIzNVJnb1gwUkxxc2Vr?=
 =?utf-8?B?ODk4Rjk0ZkdtTWxmbzkxUk1QSzEzWnNmUWZiNVVMNVYzOStCZ2RRa2JZN1Zq?=
 =?utf-8?B?TVZLQzI0aDFmdmExM1VrdEgwc0hzMDNJZjB1TmQxeVN5c0M2WEZaSFpodzR4?=
 =?utf-8?B?VWRiRUNNTmovM2hXR3lBSEh4eTNqSkVMOGg4RXE4S1VBczlmMFl3ZEhvb0Fk?=
 =?utf-8?B?TmZQWnB2L0xES3ZpN3pJM0ltQWpBOFd0VXVDYkZpOWhKcGRVbFRjeHMzSXZ1?=
 =?utf-8?B?TDFVNVdiY096M1hsWjFjaC9yUHhyNzdzMHozTkJIUDhBUnVPbTBGajVZQnVM?=
 =?utf-8?B?NStaUWVINWRvbHhrYUNGbllUZDQwUjBIaldwYmxPb1hmejdrM2VaOXlKYnVZ?=
 =?utf-8?B?V3RDNmZmQUUwRVNnU0RlRzhkWGNXNUZkNmpjRUUxeEtETmozZTRqekZjYXBv?=
 =?utf-8?B?UkUrV2hRWmxxL3NuTnpIRjhXV3U3V3B6UVh5MUpvQncxN0RYTmsxT2Ezbkdi?=
 =?utf-8?B?OHZkUXhlS1hMaXI2alBQYTNvSmlWS2hrRnNyaXNmYTAwQitQRnJQdlMvVlJU?=
 =?utf-8?B?d0FXQVg3My92YWEwdS9wcDY3YkpBNTljRDhtQWtKalR6ckNYbkswZ0w0T244?=
 =?utf-8?B?Z0tURVhNNjZVekVNdHo5TE9kekhnWVgzOFBqd1pZL3M1N3JMTUpvM2hoWnR6?=
 =?utf-8?B?RVFmOGpFRXB0YjM2TWVxNHlsZFlydXk1ditvcUIwUjlwRitmNHEybHdHSEhj?=
 =?utf-8?B?RnFLeWRiQnRYaHJhK0dMb2VNbUJUMFh2L1J0UTB2cnRRai81ZzRXVmRXdjJl?=
 =?utf-8?B?RnFiS3dDaHVrTVVJZWpaa0ZqY25FNzNQT2p3MDFJQ3UyblJDMUpYUzhaL3U4?=
 =?utf-8?B?OXVQTTdIdFA1OHVvYlVqTS92NGNOWlAyQXhseVp4TG1wTURObHhVamo0RVlq?=
 =?utf-8?B?dDVlK3lSNUFDdWI5M1BWQVJSKzFYVFlJNElsV0V1bjRHQnVrdnA3bzRPSkxz?=
 =?utf-8?B?MWlRMzQ0cy9IaTNQWnNLNjZpK0JGZkV5aVJDdzFXenpYeTBKSGh6dU9FM2hy?=
 =?utf-8?B?akpyMklpL0g0Y05qanFjc2RvdlkySjlUMm5FMmFTRXpXeEIzam54Yzg0VzBn?=
 =?utf-8?B?S0FQZUpMem5tZms2RnBiRFhZZC9iNjVCNitrTUVsTVpYd0JacDlPRUcybVph?=
 =?utf-8?B?STBwRXkyZEd5MS9wNjZRNDBlREk5NEFvWXZqZlJzTmZWRXhyZVRML3p0Q2R2?=
 =?utf-8?B?R25uR3Fwc3FFNUEvNUVFRkJVclBWUVpkZUw4ZHZrVGZnaUdyRlFNRVdQTkg4?=
 =?utf-8?B?ZmYvWTFlSFBPRUk5VHlpSHQ2SGxLYlo0NFhTTm9tVFNobkJGQ3JRWWRLQUl6?=
 =?utf-8?B?Rm5VVXdJTElHckpMYkN4UEhhRVhsOXpuV3JpbnBxMjU5Tm1Rdm02bTF6cHhq?=
 =?utf-8?B?SWpTNTBZaTlPWHlmYlhxMDJ6M0VXVEdNRDBBWFdYanliZTJyeWVyVFdQVkpa?=
 =?utf-8?Q?0KWeV2?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:01:20.2691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9875d29e-cfe1-4072-9fad-08ddc3b07520
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220304

T24gMTUgSnVsIDIwMjUsIGF0IDE1OjUyLCBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNo
a292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKdWwgMTUsIDIwMjUg
YXQgMDM6MzE6MzhQTSArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBTcGxpdCB0aGUgbGli
Y2xjIHN1YnByb2plY3Qgb3V0IG9mIHRoZSBjbGFuZyByZWNpcGUgYW5kIGludG8gYSBkZWRpY2F0
ZWQNCj4+IGxpYmNsYyByZWNpcGUuDQo+IA0KPiBJIG1pc3MgdGhlICd3aHknIHBhcnQgb2YgdGhl
IGNvbW1pdCBtZXNzYWdlLiBPdGhlcndpc2UgTEdUTS4NCg0KWWVzLCBnb29kIHBvaW50Lg0KDQpC
ZWNhdXNlIGJ1aWxkaW5nIF9hbGxfIG9mIGNsYW5nIHdoZW4geW91IGRvbuKAmXQgbmVlZCBpdCBp
cyBwYWluZnVsLCBhbmQgaW50cm9kdWNlcyBhIGxhcmdlIHJlY2lwZSBidWlsZCB0aGF0IGJvdHRs
ZW5lY2tzIGV2ZXJ5dGhpbmcgZWxzZS4NCg0KQWRkaW5nIGNsYW5nIGFuZCB1c2luZyBpdCBpbiBt
ZXNhIHJlc3VsdGVkIGluIGEgbWFzc2l2ZSBpbmNyZWFzZSBpbiBidWlsZCB0aW1lIGR1ZSB0byBt
ZXNhIGFuZCB0aHVzIGFsbCBvZiBjbGFuZyBuZWVkZWQgdG8gYmUgYnVpbHQgdHdpY2UuICBJ4oCZ
bSB0cnlpbmcgdG8gcmVjb3ZlciBzb21lIGxvc3QgZ3JvdW5kLCBieSBzcGxpdHRpbmcgb3V0IGNv
bXBvbmVudHMuIEV2ZW4gaWYgdGhleeKAmXJlIGFsbCB1c2VkIGluIHRoZSBlbmQsIGJ5IG5vdCBk
b2luZyB0aGUgYnVpbGQgaW4gYSBtb25vbGl0aGljIGx1bXAgeW91IGdldCB0byBydW4gbW9yZSB0
YXNrcyBpbiBwYXJhbGxlbC4NCg0KUm9zcw==

