Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7F1C25B75
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 10:02:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.9180.1715335321007674390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 03:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MKOJyMxP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MKOJyMxP;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TyWSFxtnkNbnng7W6lmP12H93F8fARnvi8GrQrqjdUS6uq1dFnFZEPhr/aagN1Ta6x8U7OSUHpUICqUxWAR82nomW7uuelehNyV1M2q+28kzXuV0xYSSmoEVONOZn5g0f8iDM0mXOxQKGxpLQbUowwWsVpLdJ1Q64B+iqU2xvba/f0up1mHJQX0WSLQMqZmj2yv751Y3uWit0aZfsULeFMjNGcc2uCqhTwnxA3gwNkpLzDt+nHiTQsCbGpKVZCVBR4KGu36NAcyecvis//MLjWg4pGnMAK7T8UjKso197RpJFcqwyHcSSRkQ4ru2aWMNhOPOR3iLzl88jwQZA8bbtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM19QuZEZe9FwhuQ/JuSKPNDR/Ql+VbOdnkU9Kc89UA=;
 b=CjBIw2bo2Rk/zEOR+0wBB1+V68jklkfT+v4QTYNzsBriR5fl4Ar9v7oogfqUhwPrDYxF8GTA9HRQtNr0qcVMSoPaqrahSd5z6tSS+1eVLJholzvjD4gsyaOkXBbffBol6MmQDseynV8Kujv7+/bzvQCZBxt3/p7Xh8/KWuzVfNnCviU4NNyyvcP0bwOptAtqY4LLv3Kho92DAl4unmQeJ8tf7xXk0m5ymJ30ofDfdRXWlinEB4Tu+EeUppIoEu/D6dsdtQod+Jg6ZeErlEY580q65SLi11Bvkp2+F88/cctyFVtDSUcmBc35rjjkNiEuXIDVwBJvfF8jUWNzOeHXiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM19QuZEZe9FwhuQ/JuSKPNDR/Ql+VbOdnkU9Kc89UA=;
 b=MKOJyMxPxvjT6P/5wmeTEz/RcUYeoGz3Tpi3nIeBwQv4U96OkekmjAgOfi+P6pST48JlkkqYrf7IDdy2SDWr33SAkW6yn0DpwhSc7nmTWCL3/5UqwkbQAdYwUMfg6VpVzkxxne8xTAg9vk2JbH9bTNdURZeSGphzrS1BAcfX4s8=
Received: from DB8PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:10:100::40)
 by AS8PR08MB9908.eurprd08.prod.outlook.com (2603:10a6:20b:562::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 10:01:57 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::f5) by DB8PR06CA0027.outlook.office365.com
 (2603:10a6:10:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49 via Frontend
 Transport; Fri, 10 May 2024 10:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Fri, 10 May 2024 10:01:57 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315"); Fri, 10 May 2024 10:01:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de46d8bbc69ca12f
X-CR-MTA-TID: 64aa7808
Received: from 34f7e528e81e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9E93929-8A28-4AC6-9B31-974B6AB0C962.1;
	Fri, 10 May 2024 10:01:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34f7e528e81e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 10 May 2024 10:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfeoTTioj7Q6KzaPGArUgIWtmBw01BmVYXimwQsWAQ7j4kvIdQZAUDOlZCnq5CtZmSTkS50ifNYk8lNdtVfKlTPREQ0IvEsC3QkxrrRJKjQQl2n0RwfjIw4BdwQhjtDEo9+cH/szfTiGZP9A2nzGjhATa5OaQBRDMdRSKM+QjLwsAXcjIZBLvD7WYiOPU341LK/J7pWnRQC1IXsylhJMur6meDkrflZfsnrG28Uc4lqtW0b+ldmcloK+H1F82tyqnd67CAE5mQcbC5lJiXhCSaZUrrbS7wvdZjkDJRHza2G60HO+AQH8sIw+sTwcpo7UElQRm5IAON7usBl1Ra1XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM19QuZEZe9FwhuQ/JuSKPNDR/Ql+VbOdnkU9Kc89UA=;
 b=Xl0PTMZntQ988PLRT/lhQcZcSTWizOFmG/HbhYuZ5x9Rl+oOakMlecuj0kUaZorTIoTtSXyZxsLC6SsqSYsgknr5gclI6O6j+ZBWQ+aslitHXYSF47eM4D/0riqPvNNh0mBzA8LZfzZhvusTuLjXiP68aJrVMdXM8PNwOCZTTg4Akp30E8oYloA32TL/VdGOn1u1hHXdZc4i1kND+WZfVBHa+FfjX52fTkMqBTYMaYxu6fWWLNrlL93YzgQh6tsn+PwF0T/agzCDLpIB9A6Lif/zniJol/WPxYRAecCRSP3n//AQpNaRcfl/S4GBApGjqpq32ESBDFe+zLE03Fa3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM19QuZEZe9FwhuQ/JuSKPNDR/Ql+VbOdnkU9Kc89UA=;
 b=MKOJyMxPxvjT6P/5wmeTEz/RcUYeoGz3Tpi3nIeBwQv4U96OkekmjAgOfi+P6pST48JlkkqYrf7IDdy2SDWr33SAkW6yn0DpwhSc7nmTWCL3/5UqwkbQAdYwUMfg6VpVzkxxne8xTAg9vk2JbH9bTNdURZeSGphzrS1BAcfX4s8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7339.eurprd08.prod.outlook.com (2603:10a6:20b:446::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 10:01:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 10:01:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
Thread-Topic: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
Thread-Index: AQHanHwq3o9YIJa6xkieUqjnpyfnG7GL8ooAgART5oCAAAKwAA==
Date: Fri, 10 May 2024 10:01:48 +0000
Message-ID: <D720BE65-A33E-4838-B53E-4A5B14669E18@arm.com>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
 <C300C299-DA24-4A7D-9B40-B3809E44EDEF@arm.com>
 <CANNYZj90WmiHqLYjiMCZ1Q+WnmWehS46pVeZpCX3=-jqct8H9Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj90WmiHqLYjiMCZ1Q+WnmWehS46pVeZpCX3=-jqct8H9Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7339:EE_|DB3PEPF0000885D:EE_|AS8PR08MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: def1f7fe-f878-492d-2923-08dc70d83a4d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a1lYY0FmVkRLOVloRFVMczRETXAwTEtRZ2g4d011U3RRbzh4d2g2eEtTcWpO?=
 =?utf-8?B?M1cwbm9ZcVZJKzlLUTdHVzNjVUgvdTlBdFNZcEtadlJ0MHpNTzJPdGpsMnhr?=
 =?utf-8?B?UmdRcDRadncvYXpSQ0pOcGhJLzRDRHltaFJjYlhJMk5zZzZxS0lhMzdGTzZS?=
 =?utf-8?B?NUtvSWdwZlcxVTBnU1hSMExMMTBzdldFSVRFKytnZWdRNGZ5bHNoeGlUNlJJ?=
 =?utf-8?B?ZVYwYUlmUXNJSlNlbkpXcDhwL0tYeEhlTEhCTGVxd2VwcDNpZ0xPYVMwYVM5?=
 =?utf-8?B?M3VTQi8rdnNMUFBtSWJMRFNXcmdtMDVzSlJ0M0JrMWpXVWNUdFNHVk9UOVNr?=
 =?utf-8?B?UkxybVJ0T3hDL240UVJxOTBXN3NkeGg1MDI2RU1YdGxCRDd0TEJJVWNmbEJE?=
 =?utf-8?B?K3k1RjR4REFCVWtwQW9XOGZpeGlwRCszdWYwUm1OaGZjSmhodTJSNXBmMEpT?=
 =?utf-8?B?K0Q0YkU3MDBoa0M3K1czdlBKK00rQTg4TXRyRTVlVWZKWjg5aU1ZNXhzb0JW?=
 =?utf-8?B?RHRUVVJrdTM3Q3cySXJxOXh4YUh1dFhGU2xzd1pzb2lob2psQWMrKzdnT0JN?=
 =?utf-8?B?SEhLVXYxSWgybzREb3loaXFnd2dRWm85T0dUdWw4d1pRaW9KKy9NSGRISlFy?=
 =?utf-8?B?azVwVHdQekRsaHR5dzg0dHBqZVBaNGhmNzVIMEViSnltbWZoeGlTSGExUVFy?=
 =?utf-8?B?WmNqOTlqS2diNytDZm92d1JVeEpCUGRvWTA2THdmTzhhMjFEZFJyYU53SURR?=
 =?utf-8?B?MWlkVUV5OWFHeGd3RitSblgycjVOQnRlaWt0QnV5MHJUV214WE43UXREUm56?=
 =?utf-8?B?bFJUS3BxZkh3eGFsNnVTMXFFdCsrWm1HNjc5VjY3VHpKVmR6SUNrazlpWkZL?=
 =?utf-8?B?aWhwMXduTmRBTHJsSDVjamg5eFkrK2l1MTNtbHA2cjh3cVFRTm1YS3pNRGFG?=
 =?utf-8?B?dy9yUDlON2d1cmlFbEtpZ24vUmtXeWladFYyczFna0hmT0pyd1J5MDV6TVEx?=
 =?utf-8?B?MXFkdG5wQmJMYkdXa013L3B1djZVU3hSelBMakFqc1pnN1NaZjlra3o0WHZt?=
 =?utf-8?B?dkpCcGFPT2gyL1ppNy83S2NNQ2lZeTQ5ZHVTM045OXhCeXdRQk9HKzdaOXZR?=
 =?utf-8?B?aHNraTlOOUx3SmVsZHJ1c09nYXh1QXNnOU5pamhYY0hsZjQrVW9LaWNiaW5o?=
 =?utf-8?B?NHVqNTA4ckJSSFRaOE9yQlpnVXBMM1VGN0NPYkkwazdDRTJFVGtDV3RUUVpn?=
 =?utf-8?B?VVN4eU9IYUxHaXMwL0l6ajNIeG44SEcwUHBHU1hhT3pzNzZtd21QNWtiV2RS?=
 =?utf-8?B?R0ZZd3BUN3ROekN2TkJLR2d1bVFsUXh0dWFCRzYxWlAyWGJPeFFLMTA5bmRI?=
 =?utf-8?B?NzFsWHdMbE85WHQyZmxsQkdHOFZ3ZjZWNENJMmFxWGxiQ3IrUEMrOEEvS0hB?=
 =?utf-8?B?TG42aERJdEJVNGlqOXBIbEc3ekZJc3hMQk90OExEZVNBdUdrbmJoK2lWNlFO?=
 =?utf-8?B?OW9OMGxvcFZ1Rk1zbFlmYml5V0R6aVhVWTVxMy9xdDBuSk1nTUI5K29iMGg1?=
 =?utf-8?B?ZnVIV3RJUDFKYlFwVEgrMzhUNis2MVRSZHAwQ3BVVEN0UTltU2oxdTIrRDVn?=
 =?utf-8?B?U3VmTk1ibzVFck1ZT1ZpM1Brc2h1MzNIdFQ1NjB3Ump4T2pvQXYzUE5HOWEx?=
 =?utf-8?B?V3JKUitEdExpdUREMGNTNXFxa2xUa2NEMVRCN25sZ2FjVG50UTZmeVF4emFq?=
 =?utf-8?B?dmVaYTNIT3diQVNnTWN4bWhzdEtLaVFBTkZ0dDBBTEpuVlUvQTZ3R3A2eHFx?=
 =?utf-8?B?WjhQQkt5bDJncjdpa01PZz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1468F2C754AF84BB5A96F59BDF1706C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7339
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	471a1f92-220b-41d1-5bbf-08dc70d834e6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0hhd2UzQ05BckxhaDlhLzVYTWN5V1BIbEcwc0NaSFZkZlJnc05oR1VFTlBT?=
 =?utf-8?B?aTZ0L1ZubFByaTZrcndaY0FzdVFUSGo0YTVqSzQ5NmROSWdDM2FEdnRid0Yr?=
 =?utf-8?B?Mmh5eW1QeHc0Wi9rSktKU2Y0dG10dmI4R2J4cU4zdENsSUpQSjllRWlMc3pG?=
 =?utf-8?B?M0ZVcDZ6MU1ZVnJ0YU1oZm44T1luZWZwbldNeWd0NTR6emJucm9EQ01waS9D?=
 =?utf-8?B?WHN3THMrK3ZDNmpWV1VQaHJRRnVJMDVCMkpzUEdqTkhIa1c0TGVmdkYvd3BQ?=
 =?utf-8?B?N1lKYS92bGRFQ1dZL2pqZjBCeEFvNWlKNHQ1d1g4UERNcXYyYmM0RzFOZ0dK?=
 =?utf-8?B?KzlLMGc2MitJeDZ5VFczSUdzcVNGa3RsNWp1N1pDUGkrUXorSW1FbWk1TXlu?=
 =?utf-8?B?KzlLYmh3VFFDTnpoWWdCSzE0elZIWWY4bTgvZzVGZENNNzh0b2tJU0dQY1RU?=
 =?utf-8?B?YzRRUmh4Ym00dVN2L2tjSys3VHEyV0Exa1o5WkdOZkI1MlYwQWpMK1Zacjky?=
 =?utf-8?B?NUxUK0l0UzRxV0RmTGl3QnFYajhRTjZhVE10SWl6T25qRTc0ejN4WGdJUXE1?=
 =?utf-8?B?d1Ryd2Iyb21NNll5ZktlZitvSkhxZnVCTXVSMmkzM2RrU3FNK1FiWllKTUhE?=
 =?utf-8?B?Z2gxR2xTZEUxNTJZWktDUlR6di92TFZWVHdqNlZpcDZYLzAxZG5IZGtFaUFs?=
 =?utf-8?B?d0lkU3lKUTQwZ2VWY0Y1R2ova3AzVENXbWNYbk1NNXM0akVWMDd3OWZsWjly?=
 =?utf-8?B?VFNXMEk5RUZsKzFWb1d5TTdyT09YbHlEbUJ4TE0yMDhoK1ZxcVlVU2pHdmVn?=
 =?utf-8?B?c1dYaXFMK0ZQNDIyTlFUOWJQMjlVMjJjdUZIOHNGQnNqbFJhM3dsUjBQK1lW?=
 =?utf-8?B?M1NmdkgwZ3EzbEtPUHhLYUJyN0liajFQa2wvcXFVRnpqZzFaaERQRW0zQkFh?=
 =?utf-8?B?NGxjK1JoQW5mVVJLM0NUVmhrMVRBQTFaR29kMTk1U2JCbjJadWVLSFZVd0RG?=
 =?utf-8?B?akZhRzVVeWRtU1M2cXJGOE4rOW4yVEh4c2U2Q28vUFhLTDByYmg1WTdjSEhQ?=
 =?utf-8?B?Mm5FaHpwWkp5SlVvVzMyN3BVVVhRdXZobi91cU5WZy9paTFENVV0bExDOXI1?=
 =?utf-8?B?VlBwZW9Ba1lPdUxMa1I2c0Rhdk9WWm5OZTM1ODVFOVNRbWxyblVHb3BGWkVy?=
 =?utf-8?B?UGRlUTB6ZHlLRFBwVmxjY0JXb21CQlF5TTlPYytUdi9CQU9QRU1lS21HMUFx?=
 =?utf-8?B?OFFscTlsU2cxWlJWRVpLSEFXYllPeTRxWjgyREpGSzBzTEJ5aXlRMVU4TW5K?=
 =?utf-8?B?Ry95ckNTWlVOU3VmNDNQaGFSa0tUNmFrTXhtbXp1OFdjVjhNcHZ1UU5hNEJo?=
 =?utf-8?B?dWl0U0s0UmRDbTVEemd6MGhDajFRWXVicTYyVkdSd0JoRnM1Z3JndXNLa3U4?=
 =?utf-8?B?NmdWUGZJZHE5OC9ZQU5IMS9hUnFpU0ltd3RWRVFRc3YxK2hwWmVENHdJMVF0?=
 =?utf-8?B?ZzMxblpuWGZHTUVtM0NJUTA5MzF3T0tJbVZFRDB4T3pRTW1JZ3hsTVZmaHI3?=
 =?utf-8?B?L2hnRFl6aG1qYklYMS9Wb3Z2elVQZW9SWFFNL0F3TktPc1JZWXgvYThuc0RF?=
 =?utf-8?B?Z2pDd0IyNlNib0g4UEN2cnRNZWFkbnU3Yk5HVGlic0RrNEhKRzMvRDFEY1Mv?=
 =?utf-8?B?MUw0TVJUMTZqbkNaS3Z0WlZIbm5FU3hhSkhBMXNYOUFyWnZoRUp0YnZFSVZk?=
 =?utf-8?B?ZGVEQjdINU9LVm1CbTNkWEdMWnZZYUxCK1dFblBNUHZoTFlUKzcwM1Bla2Fv?=
 =?utf-8?B?bkQ2QTJYYmE4NVBoTEdNMlhzR3JUUHpFSWhmVTNRbGVMTnNQVEZNUGhURHd5?=
 =?utf-8?Q?/5Fz+TXQu40YA?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 10:01:57.3149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: def1f7fe-f878-492d-2923-08dc70d83a4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 10:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199196

T24gMTAgTWF5IDIwMjQsIGF0IDEwOjUyLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDcgTWF5IDIwMjQgYXQgMTc6NDcsIFJv
c3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IHBhY2thZ2VzL2NvcnRl
eGE1Ny1wb2t5LWxpbnV4L2dsaWItMi4wL2dsaWItMi4wLXV0aWxzOiBGSUxFTElTVDogYWRkZWQg
Ii91c3IvYmluL2dpLWNvbXBpbGUtcmVwb3NpdG9yeSAvdXNyL2Jpbi9naS1pbnNwZWN0LXR5cGVs
aWIgL3Vzci9iaW4vZ2ktZGVjb21waWxlLXR5cGVsaWLigJ0NCj4+IHBhY2thZ2VzL2NvcnRleGE1
Ny1wb2t5LWxpbnV4L2dsaWItMi4wL2dsaWItMi4wLXV0aWxzOiBQS0dTSVpFIGNoYW5nZWQgZnJv
bSA3NzA5MzUgdG8gMTEwNTkwMSAoKzQzJSkNCj4+IA0KPj4gQW55IGltYWdlIHRoYXQgdXNlcyBH
U2V0dGluZ3MgcHVsbHMgaW4gdGhpcyBwYWNrYWdlIGZvciB0aGUgZ3NldHRpbmdzIHRvb2xzLiAg
U2hvdWxkIHRoZXNlIG5vcm1hbGx5IGJ1aWx0LXRpbWUgdXRpbGl0aWVzIGJlIG1vdmVkIHRvIGds
aWItMi4wLWNvZGVnZW4gaW5zdGVhZD8NCj4gDQo+IGdsaWItMi4wLWNvZGVnZW4gaXMgbWVhbnQg
c3BlY2lmaWNhbGx5IGZvciB0aGF0IHV0aWxpdHkuIElmIHdlIG5lZWQgdG8NCj4gdHJpbSBkb3du
IHNwYWNlIHVzYWdlLCBJJ2QgcmF0aGVyIHB1dCBnc2V0dGluZ3Mgc3R1ZmYgaW4gaXRzIG93bg0K
PiBwYWNrYWdlLCBidXQgaXQncyBub3QgY2xlYXIgd2hhdCBpcyBhY3R1YWxseSBuZWVkZWQgZm9y
IGl0Og0KPiANCj4gYWxleEBaZW4yOi9zcnYvc3RvcmFnZS9hbGV4L3lvY3RvL2J1aWxkLTY0LWFs
dC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L2dsaWItMi4wLzIuODAuMCQNCj4gZmluZCBw
YWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluLw0KPiBwYWNrYWdlcy1zcGxpdC9n
bGliLTIuMC11dGlscy91c3IvYmluLw0KPiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91
c3IvYmluL2d0ZXN0ZXINCj4gcGFja2FnZXMtc3BsaXQvZ2xpYi0yLjAtdXRpbHMvdXNyL2Jpbi9n
b2JqZWN0LXF1ZXJ5DQo+IHBhY2thZ2VzLXNwbGl0L2dsaWItMi4wLXV0aWxzL3Vzci9iaW4vZ2lv
DQo+IHBhY2thZ2VzLXNwbGl0L2dsaWItMi4wLXV0aWxzL3Vzci9iaW4vZ3Jlc291cmNlDQo+IHBh
Y2thZ2VzLXNwbGl0L2dsaWItMi4wLXV0aWxzL3Vzci9iaW4vZ2xpYi1jb21waWxlLXNjaGVtYXMN
Cj4gcGFja2FnZXMtc3BsaXQvZ2xpYi0yLjAtdXRpbHMvdXNyL2Jpbi9nbGliLWNvbXBpbGUtcmVz
b3VyY2VzDQo+IHBhY2thZ2VzLXNwbGl0L2dsaWItMi4wLXV0aWxzL3Vzci9iaW4vZ3NldHRpbmdz
DQo+IHBhY2thZ2VzLXNwbGl0L2dsaWItMi4wLXV0aWxzL3Vzci9iaW4vZ2RidXMNCj4gcGFja2Fn
ZXMtc3BsaXQvZ2xpYi0yLjAtdXRpbHMvdXNyL2Jpbi9nYXBwbGljYXRpb24NCj4gcGFja2FnZXMt
c3BsaXQvZ2xpYi0yLjAtdXRpbHMvdXNyL2Jpbi9naS1jb21waWxlLXJlcG9zaXRvcnkNCj4gcGFj
a2FnZXMtc3BsaXQvZ2xpYi0yLjAtdXRpbHMvdXNyL2Jpbi9naS1kZWNvbXBpbGUtdHlwZWxpYg0K
PiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluL2dpLWluc3BlY3QtdHlwZWxp
Yg0KPiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluL2dsaWItZ2V0dGV4dGl6
ZQ0KPiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluL2dsaWItZ2VubWFyc2hh
bA0KPiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluL2dsaWItbWtlbnVtcw0K
PiBwYWNrYWdlcy1zcGxpdC9nbGliLTIuMC11dGlscy91c3IvYmluL2d0ZXN0ZXItcmVwb3J0DQoN
Ck1heWJlIHdlIG5lZWQgdG8gc3BsaXQgdGhpcyBpbnRvIGdlbmVyYWwgcHVycG9zZSB1dGlsaXRp
ZXMgYW5kIGRldmVsb3BtZW50IHRvb2xzOiBnc2V0dGluZ3Mgc2hvdWxkIGJlIGluIC11dGlscyBi
dXQgZ2ktKiBnbGliLSogZ3Rlc3Rlci0qIHNob3VsZCBiZSBpbiAtZGV2IGFzIHRoZXnigJlsbCBv
bmx5IGJlIHVzZWQgd2hlbiBidWlsZGluZyBjb2RlIHRoYXQgdXNlcyBnbGliLg0KDQpSb3Nz

