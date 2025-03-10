Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14040C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:52:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.6])
 by mx.groups.io with SMTP id smtpd.web11.36439.1741611162531172341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kA2ji0sz;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kA2ji0sz;
 spf=pass (domain: arm.com, ip: 40.107.162.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=atxTbol2ylvqFjWLT5LoY5IBqc6cxBIAwSoD3+QLFcLOeUC0l/v8X6i0mLGexLQI4XQuLF5nzzNh3dtz26yzFw3pm7wTGj2uUVLP6nZp8k3huWrSFKBTmx2d+E+amikGKBvrIUNIrvrgcI1IrPw6ydhWO0oZayHppW0z+jwn7lsQI5i/nOnI23VikuusH2s4kFV+aRwCsxClDKn+NBobbra/kWbOCzEGwYc4cQyAyaeBIv/nC1VWtBrPtOcgK3pn8vjyQ7cZtRmV+xAUvtaTSKkA2FqArtQVko5JZTVbcPx6g3IUC6+E+H2l99JX7EHd6TFGf4hK/sDZw/VvrQBnxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jd3hX9ftht90iz+Z6SS29xthy4z/ue5DMk0o47wHwg=;
 b=vuFo/wyZ114KUE2BD/+s4p2SF9FCCcthuh0vGp7f4omUp0/6vD+msHYfSmrIf9sTRTPNNw8ge2BuAA0ko4sWv5BNV17ld7uiZ22RHL+390fV3hav/7ux1ffW5g02hevg9wj02XkoCiSro074SGUOCR+IlwHyyD5ahK0Mjqfz58uZcZ1TVraj2eHz/0jWWeZynQHuT7lNL6pxG/XVFRX14yGZsPna0ub5FsMfuaCJVEuB+9THCQBeaOws5ubquUPjRF61ypUDPM3F28Ud/Kh1CjGXh7HRMVzUjUxqZZgRYxumZ0pF5Qx9zw7pXBNQlLGz8DE1taq2q1F8RdJJ6I6HiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jd3hX9ftht90iz+Z6SS29xthy4z/ue5DMk0o47wHwg=;
 b=kA2ji0szwL6swqrIJbJt9mWsTuquyxmCa6PozJvHF/C7zD+eBxSFeEZGcs75cDdeVtbFa2ZEGL07ldShGEVRdsXvDVb9NH8h3dO+LEKZM9kWOcQiJEdRCYQLP23s+HN7MZrUWs+BnTPnxg2WifUnDqoExQdVLhUiJcm0DfJx4Fg=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by PA4PR08MB5983.eurprd08.prod.outlook.com (2603:10a6:102:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:52:39 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::fc) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 12:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 12:52:38 +0000
Received: ("Tessian outbound a60532193129:v585"); Mon, 10 Mar 2025 12:52:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5e30375edfd311b
X-TessianGatewayMetadata: TdInblXRj1Bxh+DtaMzRQALPkf04Z3OIf8vsKmF3dsOcvCDjnCI2eaamgScFsRgQSdBwNC1vSGacoLXVNGRg4z1GIkP4atX7M0ayor7qnlkE6FnlaY5q6xPc/A9YVh3P7L2Tx5oK1YuZlf29xxTbRWBSK/bQ3+64fyacrYTiThQ=
X-CR-MTA-TID: 64aa7808
Received: from L8e3afc5a5f92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C681B529-78BD-45F2-8B5F-E7530EECB61C.1;
	Mon, 10 Mar 2025 12:52:32 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8e3afc5a5f92.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Mar 2025 12:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxI4M9LdYit4cAYsnv723+3BrwhTlKPMG44M9weE64AYKJiuasdOdlchX+v7sdI0hjy+6KE9mwxlefaPZsfT2uWy1UI+9vnyj6SviC4Z5BSGwjBLUV/OB+gc9LiJE52NhN3fZgG5wIK1ihJESRNvNYh6R1Rbi+nCXZ1RvHG41gup7tqi+oFJhgAuN8t4KFhhO8doydXWSVfp18czzCQ5p3V9ThIxFijdYSB7DTApO00LcevxqZ8gnm8WJrYr81nGeWsgajr8Wh4P8ngbKljVDn1zqnGFD++C16dOgxrxG8/tJfCiicPjvhM8ImVhHcIrxHaN+UXYM4lwhUJWdC2QLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jd3hX9ftht90iz+Z6SS29xthy4z/ue5DMk0o47wHwg=;
 b=OV6h5w61Bp28vj7x2ievmEFJXexGDKSwc3/foStg97llCPZkehMVxmwWtubMvawIwDdVVS3jYsvT/shtW2tO+CIKgP/qN9cEpYSABlb0BjN8FyT3aCKS/FMLgsCIclA+GpA91CUOtbivWnp2J1fnyXHi0Dy63OzrkfGvz2qJLJFyxUaodER8dXH4DzQ2teM1kCykoJQgSt1t0hLvLe35u/g+uqaLxsBuxPJnJjqVQ9YFZUOP8A/7ZrUGEa2n+0iBrVerIB29LCK/x+wrWNtglpkhJdIvTylX+qgKaXW4bzBOEPtzqNDPYBex6QnGaeOwDjpKrUots0yz9HUxKpQ91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jd3hX9ftht90iz+Z6SS29xthy4z/ue5DMk0o47wHwg=;
 b=kA2ji0szwL6swqrIJbJt9mWsTuquyxmCa6PozJvHF/C7zD+eBxSFeEZGcs75cDdeVtbFa2ZEGL07ldShGEVRdsXvDVb9NH8h3dO+LEKZM9kWOcQiJEdRCYQLP23s+HN7MZrUWs+BnTPnxg2WifUnDqoExQdVLhUiJcm0DfJx4Fg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7679.eurprd08.prod.outlook.com (2603:10a6:150:6f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:52:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:52:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Topic: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Index: AQHbkbscSfaTB1r5wEO4MBdIX15fzLNsUw2A
Date: Mon, 10 Mar 2025 12:52:29 +0000
Message-ID: <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com>
References: <20250310124949.2414614-1-peter.marko@siemens.com>
In-Reply-To: <20250310124949.2414614-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7679:EE_|DB5PEPF00014B97:EE_|PA4PR08MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b656212-f3d0-4aec-c635-08dd5fd2705f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VkxPdGRBQzdWUHkyVUd3ZzJJZFpRdFVXTElEQ0liQmZyWW43dS9rTFg2Ly9X?=
 =?utf-8?B?R21NekZ3VGlSMjVmWktLREJGRXNQWlFGK3NoakFZNWZ2R3BscDBIU2plMU5r?=
 =?utf-8?B?eWE1NEhIUFlDOGtGQitOVk5hUTVjUVJtRGp3VmtHRDhlaE9uMGt1MUhhRzdC?=
 =?utf-8?B?M0FXM24rSTJMQ0pvWlJOQUtXLzJ3MzhIWGp3Q1ZnV3N3UTZCbklxd2p2dWx0?=
 =?utf-8?B?NktFOStaTzg2MmdPRkxOcFJ0Uld4U0hoT0diMTVnaDdLNXFYVFRXTWVjN2tF?=
 =?utf-8?B?MkhoVWFJRVAreHBKMmZyUkJ4RXJYNUtIa044VzZJU2cxcWNTZnI2SjFnaCtO?=
 =?utf-8?B?V2dvcnhiN1hJQ05iYyttTkZ5ZVRHSHR1M1JmY3NSVWZvZzhYS21mM3ZaYmdV?=
 =?utf-8?B?TDZPUmtpYTJPYjVvNFErOGtLT29wWHpvci9nckRwbmJka2wyQnZFeHdKUzBu?=
 =?utf-8?B?dDhGVW1BQ3BlZ212a1BqVk1GenVVN2hFR3Jyc0lkeSsyYUoyeU45QzFVSVgz?=
 =?utf-8?B?SEU4elcySTdlTmllQnhSQTVjaWlLYnMxdHdlaXJHUHZoSm9oTHFsVG5MckNT?=
 =?utf-8?B?c2U4TklRczdoZTRiSTU0U245RElRN1VEb0xJbE14MEVPWDAwZlVKUFZOVmpV?=
 =?utf-8?B?dDZPUTdBZG9ZUi9GZk1ZSXVxMWU5d0VxOVlEL3IxWmJ3dmdRdndPaWp4Y0l5?=
 =?utf-8?B?ZXVNNVdXOTRQVlZSREtNWXpGdzFCdDg0eWN6NzgrNlp3cWhRU0NrTFo2SXFR?=
 =?utf-8?B?eXA5QVIwRE80RjhycVBlOEh2eTQ3cXhIbnQzZXkwUGNGUUhVcFlEa2Q0S3Iw?=
 =?utf-8?B?NVdZbWhDV3V3RzR1MlQzVUlpL09JMGlhK2xmejJ4eFZnL1UwV0RQRnhnWkVs?=
 =?utf-8?B?TFVMdWdmNFdsN2FpdDRUV2lUelRZcDdhTVdhNXE5aEd6YzdqbG1CU1hNN2ZD?=
 =?utf-8?B?UnlHUjh2TjFvQzVjNHJpbVZhOEVxVE9URGxaeEQ2ekkwQnlLSUx2YThnRExs?=
 =?utf-8?B?ZERrYnlUMjV6bHYveHRxMWlMZFlhRnZ0RWlzYnp2Z1Exd0FnKzAvOFg0OVNZ?=
 =?utf-8?B?amZtUDlyNVhlL2tvRFY5ckFyVys4NUpBd2NkeUVVQml1NVFwdkdTd2VNY3RJ?=
 =?utf-8?B?L0VqMURTY0dJYzhUY2EwemVLK0Y5Vk1RQmpuckNkSE9DSllBRmJHWExWNlgw?=
 =?utf-8?B?T25HTktUU0xSa2k4V2RZSDBQZ1NsNDRPS2J2ZHJCVjZBanR1OWJKSE94NEF0?=
 =?utf-8?B?d2hFUlRFcWsxdTVNbEhKT0psS2hzSmpoM0l3RzBKNTVJRW9UNDlLVCtLSU1X?=
 =?utf-8?B?TzNVZkhkc0NYRVVIc2tWMTZiOGNkWXhqT29lMFNWNWVrRm82aVMvNVZPMkc0?=
 =?utf-8?B?YlJKa2xJVS9HR3JpQVFOYUFsdUZUU21KdW9NSm5zemtKZ3E0MFhHZUYvUk5S?=
 =?utf-8?B?MEk5RlZ4bDI3b3l0T29sdFRKSGp1NnpLVkR6di9GTUZaMFR3c0ZrSklWRUFa?=
 =?utf-8?B?eVJoLzJYVHI2RzU4TjcwNTdQdFdXS1VrbU5pTWxYT0hud0FJSGdYdEtWN2w2?=
 =?utf-8?B?TTNkczRJVStTTlNqT0paRFB5aXkvQXgzNWlsTGNsUlVmQnJkSFdFeDhoNGZG?=
 =?utf-8?B?RDU4ZWRrdGMxZ0ZXMmh1MiszZDRqUi92WGVyYkZRSFlsZ3QwQmZ0STRnRTMw?=
 =?utf-8?B?aVZCWmZDS000QjJYVFNQL0FwTXpVR25haEZCbG9jV25DQWhBUEwxR1VseXFi?=
 =?utf-8?B?Ri9FQ1RhSTdWWlQ4ZFdaVnBCanVwcWpRa29WRWhNZmZBZ201VHZmeDlUQit0?=
 =?utf-8?B?NzVmbnQwQm9mL1B4T2hTcUFnNFVlV3prdkJNYzdhOE5rNk9Hd0NnTmJhOE5S?=
 =?utf-8?B?Um5vMVBKWUIrWWRjOEZlbXJGVVczR0N0SVV1UC9Lblh2aXIzd2QwdmZhZmpH?=
 =?utf-8?Q?uDYv9KH1k5g8xU+Nouw1rNYKIZDFtiCU?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBD2348AB62EA8429CFBD755A3BE8C86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7679
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09879e8b-4cec-4c54-511d-08dd5fd26ac6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEZkWkpER2MydVVrcmZQbkQvQlpSaHhQcFdxVERHcUUrZGNibkNVaS9qSUZ6?=
 =?utf-8?B?VVJiYkdtc3FaTmdkcUhLYnlCdnVZTVVxWlhXRDZuN2pnMWYzYTAwY2Z6eE9I?=
 =?utf-8?B?RytDZ2lqKzZHdjNvazNNRWdrdlcwYTk2cnJJcmlpWWEzK1Zla3FsYUNjMkd3?=
 =?utf-8?B?OWE4a09mNDBjdDl1RHpQN1MzTnZKZkQybHlzZk9vdmRwUVpVZ0o5T3RRMjRB?=
 =?utf-8?B?bDdhNVVSSUlCT0lPMjlIb3orY3B3WGFNSEo4N2kyUXhDMjRGNlZBS2diNVEr?=
 =?utf-8?B?dFpHTjZWdUZOelg0WEVRd0lNVU02dGZ4UG02cnhiUW5NajBrZm0wZGxpcnhp?=
 =?utf-8?B?SklyV3NGczM1TXhWUzVxWjZRaFNrZEQzd2UxVnFSWWRSYkFpNVppL0dubXRi?=
 =?utf-8?B?aEhvOE41OTJpM0FLQjRQYUh1MDZnVUg3emxGZ2ExUFFWeklIQnlTU0FDclZp?=
 =?utf-8?B?cjI1ZndPUlFocTF3WVkxcllxeDcyWDdXd0k0ZzdrRm5IU1RxRTU4Z1lROWk4?=
 =?utf-8?B?eVZRVWNmdDhWN3QwN0NYNElDV0pnalRxdEw0eTlhZlRVRzdrR1N4TjlGM2N2?=
 =?utf-8?B?TkFLZEVSOVFYTUZSUVg2S0EzZGl3b1FLUzhZMElxNlFNZWFuQlNxS3JsbTVQ?=
 =?utf-8?B?L1o5L2prdjcrMXI3Q2tmSTZFNGtKdjloV1p3NlBCajNJZkE2K3ZiTEhZUnIw?=
 =?utf-8?B?Z0R3cWhGRFNqRmgrZEFTVkszTExHalQ1YWx1ODVidGM1U1BHVUtJRnFQaFd6?=
 =?utf-8?B?cWozaW5xT09VRU81S2JuMnJ4T3gvbmdaekJUejI4cGI5YThOak5Vc203UlFm?=
 =?utf-8?B?QVF0M1YwbHZNOFAwSmtVOGlxTVJUZENKb2k0YzBDdU5PcnlscGc2bERQMXNJ?=
 =?utf-8?B?S1ZEMmJIektHL2RlcENUUEd4TnhNbVF2TmJldFNPeXEwYWh5RDNCVVYwRXQy?=
 =?utf-8?B?TjYwcnBBSzEwd2JPOXRhdjJaSVErMzRKYzMvc2s0RVR4T3FBRVVxQUFrdnU5?=
 =?utf-8?B?VEM5dTZNalFUdXZuYmZYK0xRb1RjTlNmaE1IREhDZnVRQ0svSzdNdWxQZWJy?=
 =?utf-8?B?TUZaNTBhT3kwSGd5MWxZZGREd0tWREI3SVBCd01LQTg0TUJFb2FSZEVBdkQ3?=
 =?utf-8?B?Ujl1ZzNueXlQMldJRk8zSUhrRmI0VERodXBnUk8rd01aK255Tk1oTGM2dFJv?=
 =?utf-8?B?UWMrOUV5OVdxWE53b1kvWTZUaEJxajJ6eXBGV1pPZDBzMmJwWUp4VGlmZDBj?=
 =?utf-8?B?V1pzaGNKSWpURlc4Ymw4OElNZmN3dkVsY0V6b1RWSGZNVzc4R09tZFBjdHo5?=
 =?utf-8?B?Wml3Um5FZitMTmx0Y2ptWStPY05HNS9GR2w4Tm13enRBVWhKaG1JaFhYS0Rs?=
 =?utf-8?B?aGxYU1BTSUc2S04xZTFJWGZXSHN0K0toQzR6YktvOWNkb2hQbnFwWjRHRGNW?=
 =?utf-8?B?VDRzZk41Ykd0Q3N1UEhIT2w3bHJjQlduTEdVQk9Xb2pFV2N4M0trZnpXczRO?=
 =?utf-8?B?NU92eFlReXhQMWR5Vm5wajQ3MGtoSjZQVVNnMlByVmF2UllBOTlEU3k0MTFP?=
 =?utf-8?B?eFBzYnJQcFpnSWRROEJuNUdvZTcxTzVpdTJhMkRhSXFlOFBjTHpNOHZGMlJq?=
 =?utf-8?B?ai8zWE9IV2lKUUIvNmxwMEI0K2NnUHpGZ0RJTUJMNGZtS0xtWThPc2Z3QUQw?=
 =?utf-8?B?dmFUbzJiSnRwd3ZwS3ZPQlYrTndBMWFVSVB0Qmg4QlovSDd1TFFPQ2U4K0JK?=
 =?utf-8?B?c1ZsUDlhMzFRcDUvR2l2TTlTbnltUUl5VTdYRFhMTU9wUmkvUTIrc2pzZm9B?=
 =?utf-8?B?MFc2RVZ0Z2ZUcVI1a0U2NmJhZmR6SUZ5UEQ4aUJPWFEvSnRyb1dZc1Q4dXFT?=
 =?utf-8?B?QkNJbmpBWGUrOXJUUjFUYnVjUlhZQzAwVFBYU3E0NzljVFVMajVOUVBWcVhk?=
 =?utf-8?B?VW1qYVd5ZmNkRGo3TloxVU9UVXRmZDdubTlVQWNYY2p1eStHMVJSRTY3RTA3?=
 =?utf-8?Q?NPO0pLcNLvkpPe6gxzAGdyILZtcB68=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:52:38.9417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b656212-f3d0-4aec-c635-08dd5fd2705f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212516

T24gMTAgTWFyIDIwMjUsIGF0IDEyOjQ5LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+IA0KPiBUaGVzZSBhcmUgdHJhY2tlZCBhcyB2ZXJzaW9ubGVzcyByZWRoYXQgQ1ZFcyBpbiBO
VkQgREIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2ll
bWVucy5jb20+DQo+IC0tLQ0KPiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxh
bmRfMjQuMS42LmJiIHwgNCArKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxh
bmRfMjQuMS42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0
LjEuNi5iYg0KPiBpbmRleCAzNTBiOGU5M2NjLi4wNzc0YzFiYmY1IDEwMDY0NA0KPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS42LmJiDQo+ICsrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmINCj4gQEAg
LTQ4LDMgKzQ4LDcgQEAgZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+IEZJTEVTOiR7UE59ICs9ICIk
e2xpYmRpcn0veG9yZy9wcm90b2NvbC50eHQiDQo+IA0KPiBSREVQRU5EUzoke1BOfSArPSAieGti
Y29tcCINCj4gKw0KPiArQ1ZFX1NUQVRVU19HUk9VUFMgPSAiQ1ZFX1NUQVRVU19SRURIQVQiDQo+
ICtDVkVfU1RBVFVTX1JFREhBVCA9ICJDVkUtMjAyNS0yNjU5NCBDVkUtMjAyNS0yNjU5NSBDVkUt
MjAyNS0yNjU5NiBDVkUtMjAyNS0yNjU5NyBDVkUtMjAyNS0yNjU5OCBDVkUtMjAyNS0yNjU5OSBD
VkUtMjAyNS0yNjYwMCBDVkUtMjAyNS0yNjYwMSINCj4gK0NWRV9TVEFUVVNfUkVESEFUW3N0YXR1
c10gPSAiZml4ZWQtdmVyc2lvbjogdGhlc2UgYXJlIHRyYWNrZWQgYXMgdmVyc2lvbmxlc3MgcmVk
aGF0IENWRXMgaW4gTlZEIERCLCBmaXhlZCBpbiAyNC4xLjbigJ0NCg0KSeKAmXZlICBqdXN0IG1h
aWxlZCBOVkQgdG8gZ2V0IHRoaXMgZml4ZWQsIGhvcGVmdWxseSB0aGV54oCZbGwgdGFrZSB0aGUg
Y2hhbmdlIHByb21wdGx5LiBzbyBtYXliZSBob2xkIHRoaXMgb2ZmIGZvciBhIHdlZWsgb24gdGhl
IG9wdGltaXN0aWMgaG9wZSB0aGF0IHRoZXkgZG8/DQoNClJvc3M=

