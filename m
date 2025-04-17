Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5104BC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:02:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.41])
 by mx.groups.io with SMTP id smtpd.web11.6004.1744887759335891085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D1lXzLZ9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D1lXzLZ9;
 spf=pass (domain: arm.com, ip: 40.107.162.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BT+eYZMIa3NLEVMX3Z1GqaGRdiCsKHB26Whrn5QW9i6nsPYaw2ObUtjqkSHtIhXjm/FNRXjCtcf/7WqKiotF2T8KS5BIySWc6dYXTZNPrpUJu5HQmoEG/gSPYR2DwzNhgsODe1A3CIMMEPQaqMgRRR+onui1yOJ08+fVk1D6rvu3HRtPBP+f6CO+OlKpfJ+vI9IYu/Oduo+/Zf069wDdwdY03C6wI950dIGumWEo6CoOsEtCPWZsG98h3jX0EjiQdzuQ3RpsmpWlNFcTo3YXwPI+w9uoIUQuD+nD0zOKJWoOqTQFrbMhOUygJYlv0WxIhhz0kUT4RJm0QqZpykowlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te6TjPg0DaSaJcPVuNsPSX6SRcRg8Si55ji09Ihom1I=;
 b=UYZlaoK5e4qqobnS7ZCV1/woYrNV8P9k57GB48BoE20pI6JTh0PXE1YPiZEZicep2igt9t4Jv9jL/DJlpVFQxL0ElaXaLW4RidLzwvpRPcbypWfhd1ylUVv4tPd0uGSQDb0j3O/yb3e7qLHP0GKtXctbqZBGEp6vcfYeaFTDhriNWEbDj9fQskIk7ZeT6r4Rg2nOCz7JM0J+Ee6T9qxyWJc1VcwMrjz8hro/tPS011JLKR62Z5PJDmE7izX9Yos89/OQey6X1U/2QVsmLkVvFhcVPGIu8446AATvAqpYM+/8m9OeD0YbS+9VPr68pRr3QSt4pF6awRZuuOh3OArKOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te6TjPg0DaSaJcPVuNsPSX6SRcRg8Si55ji09Ihom1I=;
 b=D1lXzLZ95qNEFl3L9N05mqKm+YwjEukMDd3FgXbhaHN51ikJTE49yN4lfODyURF/8H4MI5WqSGxGeRYe15QHUD2kD1DxHh5xCiGHrYwjtr0mWSMudB+EuI8uMM60Euxpq7kEgE/GeB210QVSZOawTB+ruXtRUniNSHuq/cWtWMA=
Received: from AS4P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::19)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:32c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 11:02:35 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::fb) by AS4P191CA0008.outlook.office365.com
 (2603:10a6:20b:5d5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 11:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 11:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4PMbvgX8wRgwA39NniSEtzH4B7tUEcNoZQbxbaNv9znaDeTYrVrHix/9BaNNVHepfhnC5GTWrIvFqJeCvaeojTc7LSG42oxNJ72s4/70Iwoz6PtCS5HHDESLQzJdEw12jEY+is/hR24oK2LDg9umk9DopSu9bp3vTPJiFyJBud/7QcaL2kcIJ/osUvrT1T0PNZlnkx1LLV1j2aqfkywkQYMAXivI3q7UfjtWvu7Ay0NEkLNoos6HSy+iSaTLLMUXR2aTNZZV2GAAIMhg3d53ySuLdvP3mGPyOwWTY4oETDCUKM2oQjUpM9+qMVbRuDxJ4Fu9yM8DtnuaMmUm6S9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te6TjPg0DaSaJcPVuNsPSX6SRcRg8Si55ji09Ihom1I=;
 b=dwmmM4ZlD4v2ei2CaF3VvtpBK6NeJsZPT29b4cgas6P8+f3Y9uqWjRNKuFWlwKfDhRDhYwG+BS1HEGJmQTzvUJwkRG11SohWElLnSPZgQQN7HEB9awarmcgjvlqjJC+iIlTMYMBet4vIfMTmxGKeAAGIfJ/c0QEV+GI54rL/Ghb++0JukUNLMiJsVoGMeZZ4Onhz2ssKXwu3CFUcFeCJL6l/uIs+Co4KQ7rfQPSAVRC6OMN+dZ7e0VwAoQpWdB0YzDRsg0+SytH/mdYlTI29v+7WD+5yaiJ4xQvrOwwcY+lJ3yBYgt0OCZp1KxBPpJnsNzjJ5PxL4tamtPkCfh6G+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te6TjPg0DaSaJcPVuNsPSX6SRcRg8Si55ji09Ihom1I=;
 b=D1lXzLZ95qNEFl3L9N05mqKm+YwjEukMDd3FgXbhaHN51ikJTE49yN4lfODyURF/8H4MI5WqSGxGeRYe15QHUD2kD1DxHh5xCiGHrYwjtr0mWSMudB+EuI8uMM60Euxpq7kEgE/GeB210QVSZOawTB+ruXtRUniNSHuq/cWtWMA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9789.eurprd08.prod.outlook.com (2603:10a6:20b:616::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 11:02:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 11:02:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Xinjian Ma (Fujitsu)" <maxj.fnst@fujitsu.com>
CC: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>, Jose Quaresma
	<quaresma.jose@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbr361L9l5cXgRKkCvF5Lcf85+l7OnoooAgAAHNYCAAAeBgA==
Date: Thu, 17 Apr 2025 11:02:01 +0000
Message-ID: <03A30531-74C7-471B-ACCD-AAC97899CB04@arm.com>
References: <20250417095402.762-1-leimaohui@fujitsu.com>
 <B405C158-14A8-4AAD-9F0E-302D53EFB8A9@arm.com>
 <TY3PR01MB1207152E3206CDAA49967024AE8BC2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY3PR01MB1207152E3206CDAA49967024AE8BC2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9789:EE_|AM3PEPF0000A795:EE_|PAVPR08MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: d7787b44-cf5d-4d7b-655c-08dd7d9f5bab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NTlnTGs2Sy93ZjZvNStTV1E1b2lwNjN0VTlOODc4VXRGbGpwTzA2SlI3c0lz?=
 =?utf-8?B?aWIyNldiUTFoWjY0QU1QWWlhY2hYSUg4eElZSFF5UkJOckpLcUFZc25YT2s4?=
 =?utf-8?B?TDZhZktHWWJDd3RyajVxcDl5V08xTmFIS0k0N1JLaGtIZmRUMGp0MVdjMXhU?=
 =?utf-8?B?NFhrQnhUd21KMU54SWtjcS9sQ1kxb29kZDdZWEl6WUJVOWM0aDNBbUk3b1Ny?=
 =?utf-8?B?MDJJQmxSL3J5NnRheXRleUdKN2NpSnd5ZWpPcDc0UFJjZG5JYkIyc0ljdGFv?=
 =?utf-8?B?U1dCbE1EdE5mZWN4ZEs1aTdtK3FRUGJsU1RJZmZOSG16V0FUVnpROGdLRUFO?=
 =?utf-8?B?MXBhdlRVRjQ2cHg4NE1zTjJUTlBmZlBEa2hDeVVBSWlOelpLTmh2cTFhVldO?=
 =?utf-8?B?Q2Y3TDZpVWhxbzNocmR5cEdnMmJ5ZEw0c1Y5RGE3NGVqYmszZmU4OHI1TTNX?=
 =?utf-8?B?VWxyV2pidTJzeWRLK1NMdVNEUnQxU2ZIaVlzbnNiUUt0MXlDOHJpVmQvWGVj?=
 =?utf-8?B?ZHF0MldtTVV6M0Z0Mi9CbDlGMFliOGlLdEFUd2xjQmFGRUdWVmFiK0p4UnBI?=
 =?utf-8?B?YmdyN2NDSFN5MWlmeW9mbUtwcW93bnRRMWJIQ0VKNkhldURBdllKUDhkbndp?=
 =?utf-8?B?dUJWL3hiNlA2MjJORkxuL0dVNmFtN1RTVXJnOUY5M2NnUTNLL0wyV3RVN2NR?=
 =?utf-8?B?OG84STNqVVpQV3VYb0dJc3JlRkUyTGtxVU5KZ3c0cVljZkhnNlJ4eEN5d3Bp?=
 =?utf-8?B?RGtYY1ltL3FZNFJhUm8wcTZrTnpIaGgzNG02RmpBa1R2Vkt0bk4rUyt6azlU?=
 =?utf-8?B?MUh0U1BPK1lXNWhkTTZhWXdHcVhiWTNjN0VZb0NhS0lSaU5iSElLazhCZEtU?=
 =?utf-8?B?Rm9JNkQxQVBWWFM4VE1ucWxXbVlwdnRjZjlCRUxqZFRTUFdnM1Y3b002MklS?=
 =?utf-8?B?cm5FQjkwNndrc1FJZ293Q0RIcmhqbzUvUjI1SXlEbGtsMG9udjhFVjVvTHBO?=
 =?utf-8?B?Uk9pajZ4V3o0bXJhdFIrd1dabzdCbzlZcEh2SjdOQ0dXVWc3SVQwWjR4TEpP?=
 =?utf-8?B?SlZ0ZHI1eGRtd3kxSTBFVnBEcWQ1U2ZoVlZVTE9DNkN4MlVldlVRTkZSOW9u?=
 =?utf-8?B?UHc2dTlaVjVBNkdVQ0V0YXZqUzg1dC8zalFPcHpXbko4L09qZFhIMkRXZGVX?=
 =?utf-8?B?bFBrYVMxVnZ5bUhidnVRaGdQTnA2L3gzWTRjMVUwaG1IVDZ1QUcwajh3MCtu?=
 =?utf-8?B?TlowRXM5cHM3UnB4WU9Xc2k3bFpqRkhORS9JQ0Jxa2pOYlk5UkxSRUhKVWJ3?=
 =?utf-8?B?Ukt3b0hYNHhiZUo0R2hyRlVNaHc3eHJ6MHNFWmswZ29Ma1J1R3YvVWpoR05Q?=
 =?utf-8?B?azc3UUV3UmU3enB4VDM1S1NsTmk2c1V0UzJuYThhM1kvVkYwSFNaQnZvcVVq?=
 =?utf-8?B?b0MrOUdEUldXajAxQUZCWXc2QXJEbWlSSTNlcnBuaGxNdzBzT2pRSEgySkpV?=
 =?utf-8?B?ZElhMmRJM0dnZG5DV2dNNXFaOERiY3ZndjBjTkJ1L2xFU0xWU3JBVXhGSXgy?=
 =?utf-8?B?bzY1Z2N3WXRhUjNQR0xSN0J4VVZXdzF1cms3YjkrNnM5dEdQWnJ5U3Z4N1JS?=
 =?utf-8?B?YXg3Qnp4NHFBZnpkQ3Jad05FSUhQcmNLQngrajZHN0hRdWo2M2tuakhzYkh6?=
 =?utf-8?B?SFZXcXE0bTV5ZVJWQTdCS0xBNVlvbGxXeER4ZjFCZTBRZFRpYys2TVhJVXQ5?=
 =?utf-8?B?eDRPWm5kYTR5eGcwVW1VS2dXN3hBQWI3cFlFS3lUalRMZEpTS0NNUUREY01w?=
 =?utf-8?B?amZLelM3cXZhcXpITm1KNk4wakpROGp1WVQ0Ym9RNVNUdEQ5eFdpVnRWZDAw?=
 =?utf-8?B?M1Y4bGZiM3p2UjBKTEdoQjN4cHpKQW9oa2FvWWd5Q2M3UXljVXYydjBoZERh?=
 =?utf-8?B?NTFMdTlTbkJjYm8zd1h3cVYxbUJKbWJsanZHMjFqL1AwTXVERmJKQnVXak5K?=
 =?utf-8?B?alBFcGVqZjR3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F426C413DAC9124F871DA75E510FF426@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9789
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fd982d5c-9aed-4a4e-90b9-08dd7d9f4818
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anVRR0ZrdlpjdEpHWEh5TS9JN3hZWE9Eb205Nnd3OU1XeFhoQlgwVkhSZzIw?=
 =?utf-8?B?QWx1SUYvU1FYVjFET3lKeUdvSTRvcm1pN21XNGE0ZU9BSGN4T2I4dkhWSWlB?=
 =?utf-8?B?L0p3RUxaU1gxOTN6SVJCMExlVm04UGpUQzNOTytHZTFqUXJkdURYckpCVC9I?=
 =?utf-8?B?d3hyYnV2K0lyaHQ2U1FVTm1VWmNLSmhaVkRpMjN6TFY5YjM5TTh5TWVwS1RC?=
 =?utf-8?B?RURlanhhWUZRSlZaWUtmcFlRalluYitFcW5zUUpwQTBXaTNxc2dUTWlFUUlx?=
 =?utf-8?B?akhhMHNtVHBMWnRtK1JsRVZZWXl0NnhLclUrQkhjUVlHNnEva0t3N0huNnZL?=
 =?utf-8?B?clNtdG1Xcm9RTW9FZmNneUlWY0JJWnpjWTZURFd4TTlWaEF2ckU3L2tpUGJI?=
 =?utf-8?B?Y1JzWWhldmtpbmJNZTZQM29oK0doZnBJSXVUK1JMRW1wZEhtMWlPSzNxN2hX?=
 =?utf-8?B?TFZJU3pYWmpUb0U1NXF5K29Sd2xwZ2F5Zk5ienJjQ2xpRXRLekpTc2xNcXM5?=
 =?utf-8?B?TnpwR2ljeVZzMXZLaEREUDAwRHdLRU11cmxrOWpESm9rY3NDY0orbnhFcXd3?=
 =?utf-8?B?N0RxUTBVYk1PZitmTGhYTXRIZmsxZGswRmI3L2pnU296aEVNanBGRGZ3SlJJ?=
 =?utf-8?B?TElOVHRTRm5jSmhwdFJ2ZE1VL3ZLUUNGNWxWMEc1N205dFJhV0JhdjhPbGpZ?=
 =?utf-8?B?RHRhQkVJcWJCaVRON1hiZWJ3eG5YVEpvbi8yMUxYZ214azl3Zm1TNTFITVl0?=
 =?utf-8?B?YkN0dWI4ekZpZ3BBZGpobmk0RUp2NDAxNnoyWWZLR0JIaC85YUgvNHBKWjJO?=
 =?utf-8?B?WXlaQStpamY2Z2FpUEhiMXpBeXg1ckY2SExVOHgyay9HbDVscGNSeXNhMmJt?=
 =?utf-8?B?VElRRnpVVjdTU2JieU1LM2NhUEI5WTlvcGh2S296ZmhiVlVCTGVLSGVQb09m?=
 =?utf-8?B?ZnJwakluV2pLU2o3Y3hySlJLdStPY09TV1ZXSENNNFRLcHRGdkk3RG1EMktW?=
 =?utf-8?B?dFd2MlNPdGZXUnQ4WGk2dFNSMWZOY2FlMnN2Y1ByWDc3dG85U001SzNUUUJ5?=
 =?utf-8?B?d3ZTK3lkQ0d4WXVyRGs1bUhlQWw0Um95UVBWWmZnY3NJa3lGSGd5WjB0R3hK?=
 =?utf-8?B?WktaK3FKclY0QjJjd012Z2hMcWxWSUtrbzJaa2VaV2lsMDRCQWR0OGdySStv?=
 =?utf-8?B?bWVQSU0xcHREamI5RXdQMmNzOTBId21YU0U3S1dIbzVKSUYwZnB2dGQrd1BL?=
 =?utf-8?B?OGJHZGxDVEdMRjBEam9GZitDOVozQ2NyZGY0Y3JTR2YwTDQ5c2RoOWdzL2xY?=
 =?utf-8?B?cjFKcHIrL0NrelFiS0wzcXA1OGFiQjdJWFJCSU8zNlJ3TmMzQXFaUFV1Ry93?=
 =?utf-8?B?TzJEbU9UUjNoY01pOXdGTkk2Skl1VWFWb3I3cWJ0TTNQTEd6c1luRUFLUi9X?=
 =?utf-8?B?aTdkWHpCcW5WN21QZk5ZYVNadFhyZ21WQThpQlVRSlZiM3o1TGQxMWRWMlVV?=
 =?utf-8?B?TSs4ZDhCSXdldnVMN25WVHppUE9pRG9ocHlEOE1oWmo4SVc2ZkVRWk5FbDdM?=
 =?utf-8?B?Wnc0SGtwYzNNQXY1VmpxeStxRzdhd095eENsVzlkdFV5ZU81NFl5VVM5MHU1?=
 =?utf-8?B?VlFpVWxqbWRBMzBMR2VQdFVWNFNDSHJwOHZvd0VXQ3dRalp6Mlo0cXRrS2dn?=
 =?utf-8?B?Tk16dXZuNEU5Ulo2bXpDVk5teTdqSXpreitIR0Rsa25rM2JxZVBMQXpNVXFP?=
 =?utf-8?B?SzBoU3FGMHFqYU1UZmI2bVpmRVFGeVZEOXluRHoyRFByU1dBZHg3YTlXWGxV?=
 =?utf-8?B?UDJMTFFSN25DSTVjd1RIZ0xMNVFESzk5SkVkTTBvR1hLTUIrZVVwdlNYWjdC?=
 =?utf-8?B?SUpQOEFYd3F0dHpWS0pqSGpobjJTZEVUc3NBemkrOWQrWDBaMWlaYU1WMTdI?=
 =?utf-8?B?Mi9jSmlROUNpdDA1bEt0eUdxSWVsSHlDUmloSEhRS0JPSDFpZGZ5WGt5b00x?=
 =?utf-8?B?K3UzVzlkT0I1Yy81YURzNXhIaHVYUVlBREhHWmI3WElySVJDeHpRamNIeUxC?=
 =?utf-8?Q?S5W4DE?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:02:34.6147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7787b44-cf5d-4d7b-655c-08dd7d9f5bab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215065

T24gMTcgQXByIDIwMjUsIGF0IDExOjM0LCBYaW5qaWFuIE1hIChGdWppdHN1KSA8bWF4ai5mbnN0
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4+IElmIHRoaXMgZmlsZSBpcyBkaWZmZXJlbnQgb24gYWNy
b3NzIGFyY2hpdGVjdHVyZXMgdGhlbiBpdCBzaG91bGRu4oCZdCBiZSBpbnN0YWxsZWQgaW50bw0K
Pj4gJGRhdGFkaXIsIGJ1dCAkbGliZGlyLiAgQWJ1c2luZyBtdWx0aWxpYl9zY3JpcHRzIGxpa2Ug
dGhpcyBpcyBub3QgY29ycmVjdC4NCj4gQnV0IC91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdp
ciBkbyBkaWZmZXJzIGFjcm9zcyBhcmNoaXRlY3R1cmVzLCBhbmQgaXQgaXMgbm90IGluICRsaWJk
aXIgYnV0ICRkYXRhZGlyIA0KPiBpZiB3ZSBzaG91bGRuJ3QgdXNlIG11bHRpbGliX3NjcmlwdHMs
IHRoZW4gd2hhdCB3ZSBzaG91bGQgZG8gaW4gdGhpcyBraW5kIG9mIHNpdHVhdGlvbj8NCg0KVGFs
ayB0byB1cHN0cmVhbSwgZWl0aGVyIGl0IHNob3VsZCBiZSBpbiBkYXRhZGlyIGFuZCBub3QgY29u
dGFpbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgaW5mb3JtYXRpb24sIG9yIGl0IHNob3VsZCBiZSBt
b3ZlZCB0byBsaWJkaXIuDQoNClJvc3M=

