Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5677DC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 18:09:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web11.12660.1740593361971736706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 10:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qGgBZXhS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qGgBZXhS;
 spf=pass (domain: arm.com, ip: 40.107.22.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=shSeEEK2cfX94EJc9NySwWE/4PbBNOqfnXRmDf1Xwe3rd81FvqFm8NCczamZ6C6/O2TXKxctHbC0mgm1HNV5MxJVxVxjsxkYCZtXQSA/cmHg6ht83AEONCKzKnko8KTMQucoPoldBoY+lK3wnZHDio0+0/vzH+jYZw90kR/cT2UhQuSJb7TdaEzXEoKfp3G22vl2rtAnlu2PJ8pHLVFV0qc4fft4fte3VyZWeoKtNf09lCVxatoqgPCCcMZdfIyUrc38On8leAXOpJOxkvllRsrvAQzGSHRjUq0bWGe+XwfLKm7NM7UMVnZR4otQdUZ+g++JKszOFn3TCggCEOC7eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPa1XOA7wKBXTC5SqKSy4Dbi110MFamSsm+H/IPMwZk=;
 b=LIBVBW8tPsyXPjgX2okESZW57rtTKQ/CUYr3dUnVCgjn8T05NNvVDJQAq8wrqalzZOvbAQRaZ8nToUkUeogqiyq8uy6ui62Hx6+J9V9s5VHlJk20WI3BPwvpYji3uRIMnIUEBtDYwtrP6Kx85O7Bc+418117xJ0LJedxcZYg/TlwO9L1Nw+SLiyGsHR3sW8uyIi1aJX/MO35TjxYGRuyzhdxa+YT50v2zAqBQzcZ5iHzty39u1eUnOKUSu29TVlic6dnQZDLKNz8Fw3uoGwYJ2JXvlVrezlsTuCMpZcHYo+kKlnoS7LvVf/p1INSSr7D4m8RbIn756F0ErPhhX/0fg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPa1XOA7wKBXTC5SqKSy4Dbi110MFamSsm+H/IPMwZk=;
 b=qGgBZXhSGFUPqZA33Ws5amtnDrqt+d1wQSVOMr54Jj8qZVbQ1Gw2YNl3jRChV0+ziHTgPBm+esfQTMx5SRP54ViMl9H9yMGqMWn9LSd45IgqZmu1YyqxQYJ1lgJKn76nzZhJfi129Lx5+aQT1imK1RVjzNSHh8hHe+iC/eEPnDk=
Received: from DUZPR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::20) by GV1PR08MB11074.eurprd08.prod.outlook.com
 (2603:10a6:150:1ed::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 18:09:17 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::89) by DUZPR01CA0094.outlook.office365.com
 (2603:10a6:10:4bb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Wed,
 26 Feb 2025 18:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via
 Frontend Transport; Wed, 26 Feb 2025 18:09:16 +0000
Received: ("Tessian outbound c3a902884497:v585"); Wed, 26 Feb 2025 18:09:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82e9e238858f78c8
X-TessianGatewayMetadata: bHDn5wFiHjrf6kji10IYMFGbvy3yKr8xP8e9xtJHPTysP5IDDajPfyW5eeKSXflAH6rd2ATawMI1AK8dtUmXyQh3/V511AQBQQCvhWKxHIJoxdkDMVn91lJL7S/uQ0PvRr4m95lWre963cREiRtZX79y4+75/4qTFDBvqNtP99Q=
X-CR-MTA-TID: 64aa7808
Received: from L835534dbc1f9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42AC2ECA-D3CA-42CD-8555-7F3E17A88AF4.1;
	Wed, 26 Feb 2025 18:09:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L835534dbc1f9.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 26 Feb 2025 18:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbKJcIAOD/E+vFbG7JBLMbXjZD4bn27t1kYaZPBHSO+le7KBiDbQRLQaKEk25SS+VZhtJTD7HPwBe2VulBALKF+WgSOv3gcOp9yZmnZV1daKV6/+yrhRs9l1Q9yU4JiOkGMhf27ZBGM6sO/GHR//N1+TXr3h9naLGYVI6uKfpNPympJfavbgjaFn4UwHpb04mmmngzjRbE1dQ0NlZsu/N1W4Fr+6+DAXGZiH9Kf/3Ytztfs93nzwNoD6/6eHdLg5jaEB5995Hd+LjTr/dV2YBxhO9GbT7dUyQdpFMzD2hf48SF3NvqNUlHVgBaEfO5i8c9lR6bAJ02+UivrKQDZ4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPa1XOA7wKBXTC5SqKSy4Dbi110MFamSsm+H/IPMwZk=;
 b=MITG+LY7rSjhW3nk97slaL5s2XDK5yCP9v+0h6jmMbYe2+qVGkqJyVYhWI4v0c/0DAtKuZkqbAXUY3fLYrQOqp3ZdZuEpUsjK0/kk0j1bILNHTT//Eky/c04U2YPOUic/rdHIAjoIw1v5150mVQHMujhZlMSvnrpHbJCJ6FCOIr61VqFDdBOcHh3oqU8WORpPyNiRwcr9Mz3SevowJVOKWng/s/irFJVDs0dEgvmSz0tt4ltV1mKhLOr4FqDchya4yU/XYYzd0jfliL3K+uSGtCdQ+hvKii81YcxpVdYvFicJOGzI+BZ6EnuV4FQ7Tl9UYU2CGeiumJ9V3u3u+cRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPa1XOA7wKBXTC5SqKSy4Dbi110MFamSsm+H/IPMwZk=;
 b=qGgBZXhSGFUPqZA33Ws5amtnDrqt+d1wQSVOMr54Jj8qZVbQ1Gw2YNl3jRChV0+ziHTgPBm+esfQTMx5SRP54ViMl9H9yMGqMWn9LSd45IgqZmu1YyqxQYJ1lgJKn76nzZhJfi129Lx5+aQT1imK1RVjzNSHh8hHe+iC/eEPnDk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.24; Wed, 26 Feb
 2025 18:09:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 18:09:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "zboszor@gmail.com" <zboszor@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] rpm-sequoia-crypto-policy: clean up
 dependencies
Thread-Topic: [OE-core] [PATCH v2] rpm-sequoia-crypto-policy: clean up
 dependencies
Thread-Index: AQHbiEjbKMAa0PYQe0S3dQvxBNckw7NZ2rSAgAAHu4A=
Date: Wed, 26 Feb 2025 18:09:07 +0000
Message-ID: <7D41222F-92EC-4F33-9499-41A258387B8C@arm.com>
References: <20250226122033.2547511-1-zboszor@gmail.com>
 <CAMKF1sq8vWS47gq=0Wq7L=m84hq7pLaLK-GbxSoNBgMtWpvBHQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq8vWS47gq=0Wq7L=m84hq7pLaLK-GbxSoNBgMtWpvBHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5423:EE_|DU6PEPF00009527:EE_|GV1PR08MB11074:EE_
X-MS-Office365-Filtering-Correlation-Id: 72997323-6a7a-46f4-56f2-08dd5690ae9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VDd0dSthcDdydnc4MnJIeFlRS21lWnMrUERCZjE0TG1XbTcvcllkWFhuc2k3?=
 =?utf-8?B?WkEzU1RqZlNKWU5FYWFnMS90cU50M0d3MjcxQ0J0amZaQkFyQmo1cFdPNW1P?=
 =?utf-8?B?cHJwbUgxeW45UmFGaDR6TXJMcFRRTXQ3TmthRFAyai9qVnJvaVIyN0g2Zk5n?=
 =?utf-8?B?SWVoVlpQb2JPRmE2WXlldDdwclJGMlNSdXhLNWZ3TVpOK2Mvc3owYVRTZ1pO?=
 =?utf-8?B?K2czWTEvTUtuS1F2ZFFSemNtakRCRzRTeHBhbzlMT0RVRHFIM3JNcjBSMnNL?=
 =?utf-8?B?bUR3RitwZ2xZZHF5RERJNVZGYUtGWExWRmVUUkFQMWY4NElncWV2ZVQvT3Fn?=
 =?utf-8?B?MFF5aGRUZ3EvY04rMmFYamVRRjlKMHRHa0xLZWlXTVV5OFhiY2dWWDR6d0pC?=
 =?utf-8?B?Tk5rQUdXdjdmQmwwZFNRUVZKT0R1STlqbjdyeWhVNTQ4M3lqMVl3ZThPYlVI?=
 =?utf-8?B?SXk1N0FDVVBGUWYyN3I3REYvNjFaU1pzdGVtb0hNN1A3L2VqdSs4cWdqbVZS?=
 =?utf-8?B?VktOMTdZL3pST2FGVmVWUWxJcEhJcGtETU9nY1JzSXllYlkwS2M3QTB0R3Ev?=
 =?utf-8?B?eWFBN0RTSDNoYzQvMEZXd0E5czlZREt4RW5iOVZ0QytCK2YweFBBY1owRUpu?=
 =?utf-8?B?cFhxRWtWZmhLSXYxTGJrdjU5YXE3N1hqVFVSNnpSVmNwWXhFUEh3eTdoOXpU?=
 =?utf-8?B?Q1BDektJVVJtcm9ZQ3lTQVIrc0Z3NU9uenBWV3lrc2ZsaW15UFRSQjlUcDBQ?=
 =?utf-8?B?Tks4WVh6WGVkeDVDN3loZkxRR0NJRVBnQ1BOUEZ3NDVoNGtPRnl4eGhZWFY1?=
 =?utf-8?B?Sk93ZjhNQU1QeWdFb1B2QytnMXVGQ3BZZ3lrNnE0dXFUL3RBcjZ5bVBFRE1h?=
 =?utf-8?B?bFpZREFoOXVFMDhweEF3MFdubHZZbWRBMUVac0tsSXphbzlGbVloZHpKRC9a?=
 =?utf-8?B?eXRmM29qNlVWejArVEFTam90MDNVT2hlT00vL0RDK3k0K3E2ZzU0TlQ3MUtV?=
 =?utf-8?B?K3lCN3VuQXZSVGIwR0tuell0ek10WHlibzZ2clh1TUxEc0RaeDRxN3ZNQ1Jk?=
 =?utf-8?B?WEw3UmR2cDdWOEgybjhPR3dnZVdRWlVEcm90T3AwSG4xQy9rVitDTUxlOUFP?=
 =?utf-8?B?V0pTcE1leDZYMXd5bWRZRDBCVUF0c3BWMGJhbUhhajFMYWJsRTdiamluckNI?=
 =?utf-8?B?N3pTL3hJZUo2NmorZndOd2lORDQwcGphM1htdk14RVhrQU9qNThZZnh3SUM3?=
 =?utf-8?B?M2xJTml5TzJOdklkQTh2bzFHTG4rK0tjQ3MxY1MzNUE4cWlPSDN3bCtjKzlP?=
 =?utf-8?B?UENwTDdhNUMwTW1JcmlvMkNYVytpeHdnWStPS3huUGZYN0hyQklmdmpXdTND?=
 =?utf-8?B?SjhkL2tzSTJOZU5Gem9WV0xSeTlEVDJQdVZsZGovaHVOK3Y1L3VtSGp6Vkd5?=
 =?utf-8?B?TUsxMFlvcjc0a1pUaTRRbkd5VHZsK21XZm5WUmxFWkIweE9VRlRBYURIVVNZ?=
 =?utf-8?B?OUhUbkVVNmtMaDZnY2RFN3RodG90YURNMlErNDlpc2VDRWNXZy9PeXN2azNz?=
 =?utf-8?B?WVR1U2lVQVBqSGlFUndzUE5ha24rWnFCVzhxOUU2UHFVNmxtKzFUZEViL2po?=
 =?utf-8?B?VFJTc1V5QndtanFjTVcraUZtS216R2lkZy8xT3plMDM1bHZGZlVZUkFxSlFa?=
 =?utf-8?B?RDVEYzdTUlpGVnVOR2l4Ujc5ZVBlMFhabHRvc0pneit5ZVNmaEEwSE5zRXN4?=
 =?utf-8?B?YUFEMkhVeENhQ05OMjJHVGlXT3U5Mkp2OUI5WS9IeUxqYk04VGdhY05JOFdw?=
 =?utf-8?B?R2hVdXBCQzc2M3NnVEUwRnV0T1N0K0VDMXEwSHdTaVBkcFpOalMvY3pacFlK?=
 =?utf-8?B?ajN0cWVRT1hsQUs2a0RkbTRRY01qcUhZandETlh1bFU4QjdXVWZkWXdOTzBB?=
 =?utf-8?Q?d6rqAY7AoWjhTS4EDbkw3nCZPuQ8g1OP?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BC6C3114FFD78469C9A32BAA217411E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f50858f-7e5d-4cd1-aff5-08dd5690a9a5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGQzNXpKNVJUd0R6MnRvdktNaWthRTV3M1p2Q3BLMjVxS2tjbFpVaW1mT29V?=
 =?utf-8?B?RGhSYjliSVlYYXQrNHk2Y010dWpoSEEzYlUzaUV5WG5KSFRBbkNtMGdZUzVp?=
 =?utf-8?B?djYzWHlpU0s0QzVEVytsYjVZR3Y1YXhoZ282S0Q4aDRtNzM0SGNGQlJNbnFV?=
 =?utf-8?B?eTJkazFCVHp3K3BlcEhJOC8ycjdmN2sxNnd4TXlTaFlrWVV6cVM1YmF0ZUMr?=
 =?utf-8?B?M3orSVBGR1lkb2trMUE4T29SYUdrWFVZZ29iaWdZTnJVeVJMOFZzNjVpSHlY?=
 =?utf-8?B?VndLR1FKMG1uWm4vcko4OFhYTmZFblU1ZllqOEErNmVobnhKeWFZaGZkU3J4?=
 =?utf-8?B?NmZhQVZYdnNVejNmdzJLbURpekJjRnB0T3lhUEMvZFNtaVE1WVF5QWxJKzU4?=
 =?utf-8?B?M0YzQzlBTDVhZEU3d1Q4ZFFoZXFjcm5sRzA4NGxoNC95bmZJVThGbS9UeCs3?=
 =?utf-8?B?Z3ZDTTFQYzlJMndJbUxBZTZ0MDZZQ0dtUDlQeHlxSGd2cGZLM09vUHo1M1pv?=
 =?utf-8?B?MFVQdEN1czRmTlBySWJhSDFyUHI0RWd5Q1JBUlVJSDNCQ1ptUzdnMW82b0JF?=
 =?utf-8?B?aEtCVjIxWVFNRExzTFRYcHVmdDR4QWZHSTVtbmZpZ2Viam0xVXlObDVMT1Jj?=
 =?utf-8?B?K2NBODZIY09EMjBYRG1MeDFNaVlNMFNrWURLT05iam5YUllWMEZpL1VnQjJ3?=
 =?utf-8?B?akt0QkRmRHZWQUpMcE5Rc1JKYTV0aVc4TlFFRTAwNHhvVGc2SXJqZzFValVa?=
 =?utf-8?B?TkI4emtUVGVFNlFkSXI4SE9vWkttY0NrZVdidzNHRlVnTDk3SHRzeGEyOUdq?=
 =?utf-8?B?UWJDb3h3MlQvRjI5MDZwZngxY1lBNWEwWFQ4SmZUSjJ2TkdxRVZtcm9oTnZh?=
 =?utf-8?B?dVh0bXJnbS9PNm9CSW5FNVdySTdLZG5BK2FQYkY5UXloYXlSTTdLUXVKSTcr?=
 =?utf-8?B?NmRPSlpaTUpyM3E4Y2dYSkNIeXh0eXV0cmJLbldJekZMSXRXWFRHNjFRUUc0?=
 =?utf-8?B?anpZTGpmN05GOHMyTks3bSsyZ0J5NWtTcTEwMHJrOGtoWnAwWFBleGNsUmRp?=
 =?utf-8?B?UGNPQkRCdks1KzB1TVoyTU1TRHRWQzRWdnJ1S1RPNmJGYVVHTkQxMUxUYlZh?=
 =?utf-8?B?UkIzMHBpczRPVGN2VGI1ZE9KbGNGc2RNWXhzN01LTkp1U25RTThwOFJlSENX?=
 =?utf-8?B?aGlpL2dWTHhiYUt3b3k5QU4vaWZIRXJCM295UlA0dVJGR0srbUtNZ2lOWjRH?=
 =?utf-8?B?MVNqaVpQT3ZOTEUrMWV2Ymtob0RobVhJd2dsS2dIOUlkZkFVVGFDVlZNSXNj?=
 =?utf-8?B?UXlxc0MxQ2JkNXVBSU5tVHkwbC91YUxtcUVLLzk3VnRmTnlwdElQWUlOcW5w?=
 =?utf-8?B?WTZOM0JFdVFhMStOMk1vbXhuQk4zR0xWaVd2dWZxSUNOQWV2cTljdmU3ZVVh?=
 =?utf-8?B?aTRpVGpMNVI0anRXY3RTek5QcG5GVTBZSUJ3SVhnQzFSR2E4L0RtNTg4bXFB?=
 =?utf-8?B?eDgvUHc4ZjkxUFZ2TXNsSWxrc1FHSmFreGF2dU5hcjZRNjFVdlhYUzVSL0Ni?=
 =?utf-8?B?VDJ0Yjd6WWZnU2prYmdUbTI2VjhZQTlnekJKclNsSE5BdXNYK2ZMRjd6cVl0?=
 =?utf-8?B?TmRBRUU3UzZoZVJQQjdRa1lxN3BRa1pMQS9hbzl3L3FMZnl5eVZ6S1BGdEdj?=
 =?utf-8?B?QTljVStjTHErRUxsa1JBR2dlK1lHUXN4RFZiK1VRMG5Nall5dlIvQnl5VFpa?=
 =?utf-8?B?NVVuMkhGc2hKcFZucFlRblhIZkp3NEVlbXRISk41VjA2MGEvcEFqT3dOcjdQ?=
 =?utf-8?B?clo0NVRvYy8yTHVLWXZZQUFVTnBhTk45dVB4bmVFT2Z5RkZhbkdOdTBsYTNx?=
 =?utf-8?B?SHRNcDNMV1JPWDFFcHVsMlh2eDRjUUFwUWdWZEFrVnFoQUlkQnliY2ZHbjJ5?=
 =?utf-8?B?S3pENVJWOXQ5dXkybU01Nk1wQmN3NWVWb0pMWllWNUx4Yi9iQWc2eklBVnhv?=
 =?utf-8?B?RnpiZXpPdVJBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:09:16.1108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72997323-6a7a-46f4-56f2-08dd5690ae9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 18:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211970

T24gMjYgRmViIDIwMjUsIGF0IDE3OjQxLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gT24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgNDoyMOKAr0FNIFpvbHRhbiBCb3N6b3Jt
ZW55aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IFJlbHkgb24gaG9zdC1wcm92aWRlZCBjb3JldXRp
bHMgYW5kIG1ha2UuDQo+IA0KPiBXaGF0IGlzIHRoZSByZWFzb24gdG8gZG8gc28gPw0KDQpJIHRo
aW5rIHlvdSBtaXN1bmRlcnN0b29kOiB0aGlzIGlzIG1ha2luZyB0aGUgcmVjaXBlIHVzZSBtYWtl
IGFuZCBjb3JldXRpbHMgZnJvbSBob3N0dG9vbHMsIGFzIGFsbW9zdCBldmVyeSBvdGhlciByZWNp
cGUgZG9lcy4NCg0KUm9zcw==

