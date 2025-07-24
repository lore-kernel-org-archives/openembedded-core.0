Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6BAC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:21:39 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.web10.800.1753374089596565123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fqvn/qZi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fqvn/qZi;
 spf=pass (domain: arm.com, ip: 40.107.162.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=blnzYVnQfpNWGoCGcHrNQ6LzF7bEmojO485HKm1yzE6KkrFrPIaCXvS7Omy4zB3c59o7En+KzTbWQiU9zcGTwetdZhm6IgJC1A/g3sSWG0ZkmH+Pp7CLByw5JpNuNxDU07oOEkBXnR3QPATtQHRNJDkMxSJiCaiZqnXND2Xj0YRVSFgCDjoX7Sqa2uUTjnKZ3dWgQMk6G3ZI1KHVK/oxj6ClkAXM3VqH+1njbfTmU4H4kFu514V2MCjjuo4Lnq3u2zQV/5M5kXGXXVuqH75JKJXJwv0xPUxdByNOgmtBh8Cvc9qBbPgYYsNJak6+TRFiF936ymniex6IdXjBKfWSQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEeuIxEixZ9BnyfrfzllagSKRLNg99e5/g1o0po+fu8=;
 b=ZUK3l8bk7KqyzWAmL+xPjYEneEL910TznBb5CSrmA7FlFfxcaNVM6PKBENzZGtULHflcIrVOFbXIFu0XwfyvKf5wlgUeoklFaDc+XiE3RkHIZgXez4PPqQqsYSiEBkh2mvcECbtB43XBXxnfAZdzxmt9yiQPjwmUrR0LhLXihOwlWbF1FvMvzxmR8j2XwXyN00LNHb6+5TsA6XpMmnEqRYR5H+dKDJKEDoXI5Tu1rMRTjfGcL8n1aX6pTPSmW+B8w+gpuh0josoxd+Jpp/W+zHV39g8btW+8zSMAX/HLWUQZUrJkF9V1h9yrduvw8Y4sHiEVqW2fkPJqOu7iKL3MMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEeuIxEixZ9BnyfrfzllagSKRLNg99e5/g1o0po+fu8=;
 b=Fqvn/qZiVxk6pCVcU/HTY9MxIIJ4LcZgE0FJuR1+YK651DIZhRvveEzES5CMMITeHNPE1AuysbUfzopfes9DnKpUymPvcjhC3KM1u2/UAVen8OUJRuRRqpfDUQclrkshZrvGd7pPtvIVsU8/WIlaOFmOPXzVz/pD+BlcUIpfGh0=
Received: from AM0PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:208:55::48)
 by PAXPR08MB7334.eurprd08.prod.outlook.com (2603:10a6:102:231::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 16:21:22 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:208:55:cafe::2b) by AM0PR04CA0143.outlook.office365.com
 (2603:10a6:208:55::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 16:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 16:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWTOcK0G8Hrt35PK93TOTeTCOmyG8w8DWWkMLY2CyISnKxkO1KAsFaFPTwtUcSVK4oiEx3+jqhrpJDwL3Xy5Bl6s/mRst6+BDY1Hb8/D+oQO15S8YSIjnewMTCFdODiF7/lCTOuQBqsz9JeLOqQZP/7HiIEs5O77U8klCDbsRxnZA/zcl1lNjtjINGxkLburkvS14dwp0A5L5JjyQHUtKUaX34cKA9AZgMSVcUIK07d+9F1QTmk1c5z41YN7HOg1SgZ4b2rv6oNT8UHbXgpF+ylxdASJZavb38QglEkQzCiAGxRDUItgpF5aRJP3aNVNvo42adqDey7K2fxF3J5W6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEeuIxEixZ9BnyfrfzllagSKRLNg99e5/g1o0po+fu8=;
 b=sOU9H0m8ren1UCabj65P9WS/rWcgPhWronHm8gmdodvLbxaTNxPlycMkWEN4VWwomKbxrfCO0QxgWNRzUkjdbgOIDy1sFVO/Sy52ROU7oPMIwnr43escmN3m/K9Xzbm9VFCWftdiRJX32YAYAb8UAgBqP1qWhMxxPJS8DRJHRYF+Fgp8yYjYAOM2gdbwxqQI1lPy0m/xXQ+KduKOPUszkN5WvwMJuBylQ4xSnHLg/FPxZHa1NzW2pFFC7pUXHeH76kmXwaKkeSrCjumCNThihq7ckmbwSQJmEpwCEc68O2CXmyFkTE3qI3V2oqpH6er6GqwYzpsvOlKQFitnwCtMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEeuIxEixZ9BnyfrfzllagSKRLNg99e5/g1o0po+fu8=;
 b=Fqvn/qZiVxk6pCVcU/HTY9MxIIJ4LcZgE0FJuR1+YK651DIZhRvveEzES5CMMITeHNPE1AuysbUfzopfes9DnKpUymPvcjhC3KM1u2/UAVen8OUJRuRRqpfDUQclrkshZrvGd7pPtvIVsU8/WIlaOFmOPXzVz/pD+BlcUIpfGh0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8257.eurprd08.prod.outlook.com (2603:10a6:150:8b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 16:20:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 16:20:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Topic: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Index: AQHb9/YZ4sZr76TI30mfd8ByNLY7Y7Q4rJ8AgAQJfwCABMe/gA==
Date: Thu, 24 Jul 2025 16:20:49 +0000
Message-ID: <7CE0D337-6DB9-4A95-9D84-C8D71A1480BB@arm.com>
References: <20250718151017.3153315-1-ross.burton@arm.com>
 <CAMKF1so=FcHd4ioR6POqTc7VvK-LAxEpndWZBohomnqKtQtZFA@mail.gmail.com>
 <D04BB559-D95D-4B2A-B69F-BE43CDC4F299@arm.com>
In-Reply-To: <D04BB559-D95D-4B2A-B69F-BE43CDC4F299@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8257:EE_|AMS0EPF00000192:EE_|PAXPR08MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: e50f1268-f678-4d1c-c598-08ddcace2117
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WDJLd1NPSlZQRWEyMFlvdCs3MVcvZGMvaElwWFdFa2MvZkNNemVpUVhlalJO?=
 =?utf-8?B?bjZjc2hGRnBRRXkySm1RcDlQRXFDWHlZY0FxMzVwbm1OcHI2WUtxV2pqcDRH?=
 =?utf-8?B?TkxBYTEvc1drUnFnNWdPenZtMnJyckY0YlVPbFVFNTdtdVU3UVpUcmcwVVZM?=
 =?utf-8?B?RHpzdXdVMGRWQTlrd3JVSU1VNEpmQ1p1M0t2NTVHU1pZZ2UycmJvWlpPVG9o?=
 =?utf-8?B?aGV6N0RDcWF1cFFONFlLQytueVRvUzFzZnhQdVpPKzBaM0EzVmx1Q3dVS3JO?=
 =?utf-8?B?a3RwdWVoRTJYMUpQenZua1lCK21qOXBPV0p3U3kza3RWd3EzOTJ1U3had1JT?=
 =?utf-8?B?d0p6eHBOYmlqZ2JnSEtIOGd1VTRrNVZ2T29GNVhaRjRtL1pQSTZnYkZ5SHJi?=
 =?utf-8?B?ZXdBVWp3L2RIUjQ1SGF0c29qWG5GalF4dTJZak41TEZMcFNob3VQeEJZSkVP?=
 =?utf-8?B?Y2FGdzRMVm14WE1JWGtwTUVONmtBSlV0K1VhY1NYNE9GaUVCUUc0Q1BMZUg2?=
 =?utf-8?B?VnYrQWRleGlDdFFlTDlmTG51MUgwYU4rdStoMmI5QWhxNEhROXlqUGZKVWRi?=
 =?utf-8?B?NmJpeVVLV3hzY0ltRVltZUNRdHdUbFV5VVVIclJrYjRlenRINWJINHlRdUJ4?=
 =?utf-8?B?eFZJc1VpcVRLbTRNWGpkYjFSZ21BM2tJdkR3cUh6NjI1QzVWNkRwSlhrWjMz?=
 =?utf-8?B?WGJhMEN4aFhZeXZZOHBYNVRzaG1UVmtqa3k3L1BuSmVtQ2JHVFJuZ2xzWXkx?=
 =?utf-8?B?bXJJZHZLWThIeUNSaERBeXlJL1lBblBSdDV6cTBTcGhOWWV6Wk1VOVIwdXph?=
 =?utf-8?B?WDhldjhPbldTWVdZMWJNM2ZNNlg0YTUwaVBDQVo0NmVmaHRoRVNaWENDK2Z6?=
 =?utf-8?B?aEtqVWM1RWUxaE9ieUtGZldTdjEvNURUbUtjblBpa2k2OHplMFFmSHYxUE1F?=
 =?utf-8?B?RVlocldJNDVibGswaUtxNzNQby9mVnRqdVE0NGdsSGhDbzBzNG9vM0Q2NDZa?=
 =?utf-8?B?QjBTV1FrYjhRN3h4a1JoVDdiNDl3aTZ0S2J3ZGJ2MXVFdkxyS3dsZENzU2xa?=
 =?utf-8?B?REFVdHNybnp0bTd1cW0xY3dUd1UvdTJwVnJiU1R3QXZuRDNCSGptWDFkMGtQ?=
 =?utf-8?B?YXJMekRGaSszaE4wMkYzelRodEliNjJLNE95WXJtWTZuZEZoZ1pPNUhQNTJF?=
 =?utf-8?B?Vktzc01yRmhTWW52RFo2aVBUeUR0WEp0WnZ5ZEI4WHlnU2RERXRKdlZoN0hz?=
 =?utf-8?B?cDB0Q25ZdDFHek5SakhyaGVuY1RHQWJ2RnBJRjhTQ3R1VkM5ank4UEVEenpZ?=
 =?utf-8?B?N25jd3ZSOTBlVDMyZE5INm4yZkNJazh1R1lqdXdhbnZnTFZ1Wk1MMW95NW96?=
 =?utf-8?B?UDhPaGRCd0pWVVFLQUVDaGZidTFEMmRxaStNQTRVeE16anVRSEM4eWZqM2ZL?=
 =?utf-8?B?b3NUbXF1T0tWTkozd1pEWGNZb0toTkM2ajl6YWh3VU9IUE81eHNWVjdUWVcv?=
 =?utf-8?B?T3Q5OXB2UitvM0E2anV5WDdNZ0wzdGdDcmNSbUNaSGNVZ051Q1ZBRW5mb1lO?=
 =?utf-8?B?ZTI0Tlg5SlNveFFvdEdkeG5SckRjTzladmxLVkxnbkwyL2FkSGx0NmgzM1po?=
 =?utf-8?B?RVBRbGI1OW5RRWZZY1YxSUpvaStEelJNam0wUU11VE5TRWFRNVo1RXJlVWNa?=
 =?utf-8?B?eGRKNG5jNjFDTFlGQm5vNXd3SlhHdFJUcmFzWXJFbmZidENMVlVYQkUvMVFl?=
 =?utf-8?B?b0JGMHVGTTlLMDh0ckNXc2tXZFkwNzZlR2pPaW5VaWRoKzA3b1ZiK3NDK2Er?=
 =?utf-8?B?dHVtMjAwTDhuMTRkeUY5Snd3dlQ0UVcvSUUxSkpVMDlIQUR2UDBvUm90RHds?=
 =?utf-8?B?UXBFU1dKMFFkNWxEeTRHWUhQeUtDSVNkblNZUWRQNklhbHFzSW10amZ3QXpv?=
 =?utf-8?B?eE9SMWREeERJWmdjczJtaytELzNHWi9xYUl5OG9uamsySEcwaFgvek1SdUxG?=
 =?utf-8?B?d1hoMlhhSDlRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1BB59376BE4A54CA261D431190FABBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8257
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bb5a3222-b4d1-4fd8-3b47-08ddcace0d97
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ME5PSXVtamdSUFRFSDY1WXdCYnpMSmxrRzhtbnlSMFlFM1pPZmJGODNZeG91?=
 =?utf-8?B?YXBsOTl1NGF3UW56WUUzR3A3R1FFa1R6ayt2V0JjSXdZSkZocG5NUGNUc1hu?=
 =?utf-8?B?WEkyY1hzbUE5ZVYwL1hFQ1lqdG94M2drYWJlcmFNcUJwd1FPeUVzbmYrS3ln?=
 =?utf-8?B?Y2Z0V3Njb0l1cDFlelFNQ2t6QS9HaG1zT2gwc1V4NVMwd2VpOGtOUjAxazFM?=
 =?utf-8?B?a01DeGVQQ0hpSnJMbnFiYXplOXh1YlE4aVRQd2xONHlnUnNIYVRHMDNRaFk0?=
 =?utf-8?B?aWxMOHRIMG1ET3dBT0EvSWowbEZ4ZGxhVmUzMlFyZjJsMWF3eHNEdUZJaFUz?=
 =?utf-8?B?Um4wck1wSjd1OVN6YUF6aFlRQktTdk1mWGIzKzhROEI4ZmdIc2lDaU9vZE9Y?=
 =?utf-8?B?UkhsRG53dGlBRDlsZEhjR2ZPbStsYVdSZi95VGJzVi85RVRrQnVwclJ2ajlj?=
 =?utf-8?B?RGR4TlgzamJHc1NPYWVYTzZKWlo1aDBWc3IwbE1oK3h6L3BZQUhjQ3NhWE9J?=
 =?utf-8?B?NVRDSWNnTTdzZThaUHFkSjB3VkpLMDRZdEx4VTVtVmtiSDd4NDVLTXYrbzhV?=
 =?utf-8?B?UHBXamxrakkzSnlHN3kranZDeGtCS2E3eHY0Y1hab3IyeVRPRmsvUnpFTEJJ?=
 =?utf-8?B?SFJqNFNVbWMrMVdZbk5oVU8zRTdKT1VYcG5ydEV2S0NUbzh3VThGU2JGRkln?=
 =?utf-8?B?UytEMjFhVG1TOVFmVFd3UGd2dVZpVDkxQ0FId1lCTWw2VUhoMHZOZGhSanBC?=
 =?utf-8?B?TjZ2RWtTaEl6M2Z5bE9WdUdXSUlwT0hNSVRvWmRBdS8zWWxzTDZ3N2hrYno0?=
 =?utf-8?B?YjM1VWNnOTRFdjgwN3RQZFZjd2huNmhBRFRKT3pWZmp3OFlvSHlZVldkRTlh?=
 =?utf-8?B?NEltTmdURHIxQk9iVnNaZkNYUVV3RE1WaVFOWHM4N2NSajVma2Z3eXk3czVD?=
 =?utf-8?B?aWZ5Mi9nNWhtbnFXRUxUY3NBdW93SzRaZDZWOG5rTlZaeW4yeE1nU0RTb0Na?=
 =?utf-8?B?a3N6QjhPOWlvYklQamVZZWxOY2tyMWV5MDNsbWxmL3BNODdDUTlRM1JoTXF3?=
 =?utf-8?B?Q3p6OVFRT3pld01XeENrWGp4bnVxMFAybXJVQVdkSW1RZU5CZHZmelVlcDdk?=
 =?utf-8?B?TDk4S1Q1cS95S2ZkVS9Ga0pLWkV5bEpSYnp1b2ZBbHZHNUxhME4xUDFkczkx?=
 =?utf-8?B?SWdMdzY2cHB5UnZjVG1MT0NNd0FYdTBYU3FXdzZNYldlemU4dmExd3ZGRzd5?=
 =?utf-8?B?aXJ3dkdEZnBMWGdTTmRqUjFiYTBoMXZXaEJoUXJUdnNUWFljSEhZczlRVFZP?=
 =?utf-8?B?RzZ5cDNaREFzb0o0bUdxRmlneEw2VkhHWVp6Yit6OWltcmo4NU5tMFd2WUh1?=
 =?utf-8?B?dkR6Nk9VQ0ZUazJpUXJYNTBsVXFLcXhqZUZvSGdwaGNiMjBOT1NEcUtiQndt?=
 =?utf-8?B?M2tvNWpGT1N2UXBTbFBnVjRwalRNUVRTWXJpaTc1NWJJTys3Njg3UXdHWFRE?=
 =?utf-8?B?SjAvaERxbkxESjVJZmRmYk9JdW0zNm96U2hSN2ZUKzh3M2J6ckRWRDZ3VE83?=
 =?utf-8?B?V3BaWGNHVllXa3lmTW5Lcnppc1lvN2VPZUxMcUJueXJ5Y0xIN2d0SHllb205?=
 =?utf-8?B?VkQ5amhuSFVXemNDWS9vZGE3VUIzMWIyanJWb2ttMnNySjhaazVUUnNkVWFn?=
 =?utf-8?B?SElBU2oxMFNBUEJIQU5rUnNPMi9lQVhwTW1LTjZ0UU41cTFGaWRqMjFoTlY0?=
 =?utf-8?B?MHNsWDkyZlo5VWhxUFlTV2xMZGVBTmhBVlI5aXFWcFI2WE1TTmlJVU82amdB?=
 =?utf-8?B?K0R0L1M5bHkrT2ovdVJlMFlMTkhyNkJ1dE1hM2FBbFJvKzh3cWp4RjV3Nno1?=
 =?utf-8?B?QklvY1VjaFdROUxuamVsRzY0b1dWMzVhL0xyWTQva0xvWlJyWTdGWmJtb2E2?=
 =?utf-8?B?RFNhUFV5eGd4UlVqeEkwUjFYVThIY1B5eWtaSWVqWjgxMGo5eTFkd3VEMUVn?=
 =?utf-8?B?K0VBbm5xMUh2c2VMV2J3NzZlTmMwQUYvSUNkTFUyQnZjZStvSE5FQ3VSdWJO?=
 =?utf-8?Q?HVsm0X?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:21:22.3393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50f1268-f678-4d1c-c598-08ddcace2117
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220851

T24gMjEgSnVsIDIwMjUsIGF0IDE2OjIwLCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IA0KPiBPbiAxOSBKdWwgMjAyNSwgYXQgMDI6NDEsIEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiBGcmksIEp1bCAxOCwgMjAyNSBhdCA4
OjEw4oCvQU0gUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IDxyb3Nz
LmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+
IFRoaXMgdmFyaWFibGUgY29udHJvbHMgaG93IGNjYWNoZSBkZXRlcm1pbmVzIGlmIHRoZSBjYWNo
ZSBpcyB2YWxpZCBvciBub3QNCj4+PiBmb3IgYSBnaXZlbiBjb21waWxlci4NCj4+PiANCj4+PiBC
eSBkZWZhdWx0LCBjY2FjaGUgbG9va3MgYXQgdGhlIG10aW1lIG9mIHRoZSBjb21waWxlciBiaW5h
cnkuDQo+Pj4gDQo+PiANCj4+IHRoaXMgbWF5IGJlY29tZSBpbnRlcmVzdGluZyB3aGVuIGNvbXBp
bGVyIGJpbmFyeSBpcyB1c2VkIGZyb20gc3N0YXRlDQo+PiBidWlsdCBvbiBhbm90aGVyIG1hY2hp
bmUsIGl0IG1pZ2h0IGJlIGlkZW50aWNhbCBiaW5hcnkNCj4+IGJ1dCBtdGltZSBtYXliZSBkaWZm
ZXJlbnQuDQo+IA0KPiBJIHdhcyBoYXZpbmcgdGhlc2UgdGhvdWdodHMgYWZ0ZXIgcG9zdGluZyB0
b28uDQo+IA0KPiBJIF90aGlua18gdGhlIG10aW1lcyBhcmUgcHJlc2VydmVkIHNvIHJldXNlZCBz
c3RhdGUgc2hvdWxkIHN0aWxsIGJlIGlkZW50aWNhbCBtdGltZXMuDQoNCkNvbmZpcm1lZCB0aGF0
IG10aW1lcyBhcmUgcHJlc2VydmVkLiBJIGp1c3Qgd2lwZWQgbXkgdG1wIGFuZCB0aGUgY29tcGls
ZXIgaW4gbXkgZWcgdmltIHJlY2lwZeKAmXMgc3lzcm9vdCBoYXMgYSBtdGltZSBvZiB0d28gZGF5
cyBhZ28uDQoNCkkgdGhpbmsgdGhpcyBpcyBhY2NlcHRhYmxlIGJlaGF2aW91cjogd2XigJlsbCBy
ZWJ1aWxkIGlmIHRoZSBjb21waWxlciBjaGFuZ2VzLg0KDQpSZXBvc3RpbmcgdGhpcyBwYXRjaCB3
aXRoIGFub3RoZXIgb25lIHRoYXQgc2hvdWxkIGJlIGdvb2QgdG8gZ28uDQoNClJvc3M=

