Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04C5D2C564
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:53:35 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.61])
 by mx.groups.io with SMTP id smtpd.web10.20395.1729608806545962941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 07:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nACDf61G;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nACDf61G;
 spf=pass (domain: arm.com, ip: 40.107.105.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u4XNSreR2XTanfc6tE7F9G0iScdUyyrzEbeZitfyfUDXyY3qi264Jca3jme5kTjMH5O9Pz6T4+MYWT+d8HQ47sChhy9e1luDA9ET3Zvi9gDbD81rwkLKjrWLJhFStbn00nj5m5lHI6lhfeuIH/gKbhvPtA8kcFWLFQmqlFNrmLdSL4CPuIfvqelwSOBZhdEySnoMAkA46WBXEFKbZ9dkGHEIA5c+5eMnC+WoDCR1ntiJWLjQp4YfPHjt/HQICxkbLsAlvld6f9WWcICpGWrmxTJy3ENg+Z1TKwwDXiwA8RUg3Uv7AkbSrqKyWfqWR0tf4pogDyipOCNcC2A+Z6y2yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZonT+2RmqodWwt4uEiYDFESjqDmDYGlEGU+ThTePGT8=;
 b=ZoWHNHTX1e+PkTrv0ZSgByq5n5jyRt+GYUyEkvc1xGWJm/zg85TcNxYRjvR5Y0tF8274vxeIoKCCftiE04SG5WtcbfbCC1HJuMK1FteiGeovXbqdeibKhSKH4GoqgsvBIEAwsHUCGe+U9E1Yowf1q+SqCkM8c59MGOkKXI55uI2qQ/hm76m1nR4oJa4AsngLZUtIUPSLpmqRDBVEjlSCuEMnRlUhao6rFwqAPI4v+AX8TXATCTESiCDjYcRhBR9iAs5MtXIN07HYlyS++1J6DnDfY8U39P3OFdzapDn6nWkT23KwR4+7uW9vxzWkKqktfeW13d9+euryqMAFko+GBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZonT+2RmqodWwt4uEiYDFESjqDmDYGlEGU+ThTePGT8=;
 b=nACDf61G1o2ayZsCZ0EFmGDQSyQW8lnLb+vJEyQ7582J8gAZd00jUrQX//5jWHbgXBr6ki3nUxTqoBQlZkeW5c81Z/IjFYRciWq6RsBKfKXfMv5iVFYCjS5om5e/XGxAenO+io+xLUXafDxLCw433s0hi2WzkHGGkR90R+Y9p4Q=
Received: from DU2PR04CA0334.eurprd04.prod.outlook.com (2603:10a6:10:2b4::24)
 by AS2PR08MB9785.eurprd08.prod.outlook.com (2603:10a6:20b:606::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 14:53:21 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::d7) by DU2PR04CA0334.outlook.office365.com
 (2603:10a6:10:2b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Tue, 22 Oct 2024 14:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14 via
 Frontend Transport; Tue, 22 Oct 2024 14:53:21 +0000
Received: ("Tessian outbound de6fe3af73ff:v473"); Tue, 22 Oct 2024 14:53:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 558b2b3080a915da
X-TessianGatewayMetadata: 5161VD7jSH2NXL9xCvmprOohKcq851fGnvzOwLV54kTyNj8PneKKsQn6+1mU0jioccBee+maSHmwwx2Wl0iUjcxPk51XXIRmMEM9O/IUPtGZt46iWJcTZj7zc7QLcDQk2tkxf/n/rBIMVGG2+8Aq081S/MNGWCnidGAcPZEgfB0=
X-CR-MTA-TID: 64aa7808
Received: from L009a2dd032f0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8E94E1D4-2515-4508-A3E3-8D7B34D29DF6.1;
	Tue, 22 Oct 2024 14:53:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L009a2dd032f0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Oct 2024 14:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaLNDDiAdeyQ8QLPFiv/jznC7hpMfqO/6SdGEOUUhwYtBGePxJPg9g+LgFEqx/eCwLTv47BZYwjT0Yky0exPxW+ZhEtXyVtizikBkSzRFLs7k3I3zijhyGTnPrvel3SbNKQ8wbigDS43AFaipBWDgHcTv6+ao1oWcelFAf2qlx7+xH0bi9UDkWVSmTOkInLseN3Kx3rJVpDjbRSe/BwKqwKJxU4tHyeRMeo6vGp97romcE7oTotrxQWp2art1RJUetbOZLy/L/9g7mOGOd5Zg8227hxhLC//RWDxS3spvOAWvuObmgwUjlpZ9qLjN5ADM8LFS3D7tEp45hPTAw44aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZonT+2RmqodWwt4uEiYDFESjqDmDYGlEGU+ThTePGT8=;
 b=OZM3/N0Vrqp0VjiPQ6jUQsHiigfdrQ77cdqsAg+umzHShcd67c/SyeSYcFGsl0JwiLXOSvxcBc9yDn7q/XV39fRcG7lGtAQSu8vyaVf5c+oI2JIrd+snweuhJv1o9kdlMoKRvLA2QsdVtv165gQ/MeoUMERNwN1kGSuTxipMHMLrNbDlhK9UL9lILWtylOiZ3jdncUTd9hwF/Cdzql60AHtnFZ1o6gIQv8YFGkk8E6ernkUy5Shys5bgZqLqZJnYkhcr/5llzTz5jh1veiwJddAphrj7JcwxL3aOq/I8Uyfg8eZs5tj5dnnF0w0Et+f02dzIGIPKQi6SOOGnpFxNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZonT+2RmqodWwt4uEiYDFESjqDmDYGlEGU+ThTePGT8=;
 b=nACDf61G1o2ayZsCZ0EFmGDQSyQW8lnLb+vJEyQ7582J8gAZd00jUrQX//5jWHbgXBr6ki3nUxTqoBQlZkeW5c81Z/IjFYRciWq6RsBKfKXfMv5iVFYCjS5om5e/XGxAenO+io+xLUXafDxLCw433s0hi2WzkHGGkR90R+Y9p4Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8998.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 14:53:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 14:53:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince_chang@aspeedtech.com" <vince_chang@aspeedtech.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jamin_lin@aspeedtech.com"
	<jamin_lin@aspeedtech.com>, "troy_lee@aspeedtech.com"
	<troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v1 1/2] wic: add WIC_SECTOR_SIZE variable
Thread-Topic: [OE-core] [PATCH v1 1/2] wic: add WIC_SECTOR_SIZE variable
Thread-Index: AQHbIHA9YQ5Ubh+5xEy5lxpcUBfzLrKS402A
Date: Tue, 22 Oct 2024 14:53:12 +0000
Message-ID: <8BA4BD78-9830-43B2-B805-70677AB52FC5@arm.com>
References: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
 <20241017084002.4093919-2-vince_chang@aspeedtech.com>
In-Reply-To: <20241017084002.4093919-2-vince_chang@aspeedtech.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8998:EE_|DU2PEPF0001E9C3:EE_|AS2PR08MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b0f1fd-562a-4758-a3b8-08dcf2a945d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dk5Vekk4M3gzNG1ta1MyRTExNnE4YlJvTmF3L1hFNjhJc2ZWL3dwelhjQTJX?=
 =?utf-8?B?ZHFaRnJMSlFvVEJrMytyUzBScEgrZE1GSE51c1YvL2ltK25oNWhhb3VTS2tT?=
 =?utf-8?B?RnhFKzVsRkhhZE9MeXB1dFdld0FKcXAvd05lMzkyeDdzN1UyeW5uT0dtSFdn?=
 =?utf-8?B?QXg4U08yTi83bUE2Wld4THZkdURXc3FQVlJ0eEZzQnkvRkcvV1NlRURvMktm?=
 =?utf-8?B?TUV6TTNnYWgxeWJFZGRLaHNQVmMrMGNrUEtSaXhMWnZpQi9mREJ4QTM5YndX?=
 =?utf-8?B?dFUwcHZ6YnlxeXQyeFZZY2NmcTI5Z2FiQWxjcE8vZDhyRzQ2TTZCTUFRRWxn?=
 =?utf-8?B?S3hMZkNGVkNMWjl1aGpUYWFTMEpkdnlzeDlTNE5EL1ZucDZIYkJ3U0JEcFdu?=
 =?utf-8?B?SW4vcmVKNnJEL2NuamozMElxaURhYWRveFRnMTY3NlFkQk13Um1HeVR5NzU5?=
 =?utf-8?B?amNFVnQ1djhrdnJNM2NUY2lSUm5JdjFKd2lQYytHcVp1T2ZPdW9jaGk2TDBs?=
 =?utf-8?B?L0k5YjNLTmpvS2MwdHd4M2RXZ1o1L2hwcHppWS9BejBxc01mWkprVkJIZGYv?=
 =?utf-8?B?QnNaZTVCS0NKZUhxc3hWZUl1bmlUa2NLcWxGbHRjMWNHRXM0cFFKenJzZXd1?=
 =?utf-8?B?VkxrZGJDV2prYUhiRjVuV2RyVStMbExsWWx0eHN3aTZqdE9UQy9yOXhPRmhm?=
 =?utf-8?B?WlY1eXRpV1BPbVlHOEFFbVIreUVncGtYdlJSLzFsTXUycDRTYTF1QnNUbThB?=
 =?utf-8?B?cVhvRGpQSUhlVnd3dngyOFMvR3prcElRd2ZxVU1HbHBncUYzMUZCUVpJdm1Z?=
 =?utf-8?B?SmgyM2RTZS9mdU9nMlNqN05KQ1pmU2pPbExnTVl1amVCZU1pNGp2WUYrcFdL?=
 =?utf-8?B?Y015bU8zaEV2dkp3RkpNeHl0YWFrV1p6UE9ROER0Q0V0Qis4eWNZbHZ6M1du?=
 =?utf-8?B?aXlhQkRzZ3pPVDZsMWFPQTU2TG1KVjhncFRlMnJqa1oyMng5anppTVhUWlhx?=
 =?utf-8?B?cGZLYmU5d0dRNkl4TzNOUDJHTXdaQ3hGNWNyUTQ0aUlwTTFNdGZlQTZpSHRT?=
 =?utf-8?B?NUFDckh0OHJLa2Z4d1dpNWIvWDRLLzBIcDNkVFlsRHBZK0VzUVRpK2syU1hh?=
 =?utf-8?B?SHArWUFkQThiWnJIUklRcjVEdHpMRkFVMGZXdytTcTlNbitRTXFKL2lNWWp4?=
 =?utf-8?B?WXVmQlpOeHBLakFTbEk5Nko0UkE5ZGQvOVRsamhjQStkcUQ4eEV6YVlUUEs2?=
 =?utf-8?B?UGV2TTJ6a1BocHl2TzBVaGplcC9VSEpHZW9lNGZLcXE1MXMzWkxjSFVCRi9u?=
 =?utf-8?B?eVB6V0hlR1FRNHZRNmpmZm8yL0NFOWhwRTg5MDFoNzBKeFRMenRQRkZhaWtj?=
 =?utf-8?B?eldFVGxyL25PQzN2dTJIVUg2Vm1JbzF4dTIrTjIraDcraUFpOGo0MmlOODNB?=
 =?utf-8?B?L0hXdFNSbFRBVTlBN2J6RU1zN0U0OEV4b2Nha2k4YUdzOWo4S3diVjR3WDk5?=
 =?utf-8?B?OHFmUWZxZHJZck14c0R3d05GeW5RYmhDRk5ST0N6ODJJTzhtcm9WT3JMcG5S?=
 =?utf-8?B?aXZzM1d1Y0ZiaEtjUTAwTzJBbGtLd212eEZURnQxcUZRd09CU1dQaC8ydE1O?=
 =?utf-8?B?ZlkwS29GbmE0aVZWOFJIYjhNR0toYk1ON1hXTXJrNGtKVFM0SGpLVFNUUHA5?=
 =?utf-8?B?YkFaT0xXNFc4SVo1WEJMOTYzS0ZwbkkycFkyaWIzcXdkS0VkS0N3aVJlc2o0?=
 =?utf-8?B?dkg0cTMvS0ZZdENNbnAxMGJvSWh4YjJuSTRYMUY1R0FqV3VlMVV1ZHdhMGFj?=
 =?utf-8?Q?cB41s1xFHcZcXiv2AtsQ+V0hGaqvnz55pZPKg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B570A769AB62124CA23353CFA4CC129A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8998
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50568cf2-0b74-4e88-7d11-08dcf2a94049
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U05neWRZN3N0RW5FZGlJTy9ueW53YXdwajRCM3VSWFc4cU1JR01SeG4wMXZP?=
 =?utf-8?B?THFjUlB2SklkTjgvK081Q2dUcndER0ZrZlBPdWlScktmVE8rOU5HMTQ0TEVx?=
 =?utf-8?B?bmlta0ViazVnQTNPc01HUnUwd1lUSEwrdU9QU21yS0FnaEl3azdRTDkxTk1R?=
 =?utf-8?B?d0xHdUtUYnhsT0JWMElXZXhpK1k2Wmo4czJmUGxpYXRuTmoxcTlSY1g3R09N?=
 =?utf-8?B?MEVjQlBCWlVCd2hMZk9jSnNRUTgrbFNKREljNUthTGxOTEowY09SOE9VV0xp?=
 =?utf-8?B?Wk01S0pzZXRwRUx6b0ZkVy9WWW9hMUo5a0o3cys0RWNpamQ2V1FiOExzdWx4?=
 =?utf-8?B?dzFaTTUxTG5kUTFQM2RtK2k2YU5iTDZyQXZ0djRJTDRzV0lEanA0OW9MdWow?=
 =?utf-8?B?M1FsMnpBWXpJNlBIS3diYTNJWWlaQzJaRnN6Rm1FZE9IS280bXdzVFhLRXRh?=
 =?utf-8?B?alpwbVJJVzlXTjJVaTVJejFObEhRUDN5dTZUcytWZkdXaEtvR1ZzRFVRMGxH?=
 =?utf-8?B?Rk16SG5aTVA1eGdxazE4ckwvbFpBT2Mybkdidm84MEJxVlNyNDdrWUw0UElk?=
 =?utf-8?B?QlVtSWVrUENqK0F0RGlSYkQvRjVsSWJvS2ZnS3pUbll1RE9PTmx0ZStxQ1pa?=
 =?utf-8?B?MzhmbWxjNFhxS2dNUWU4ZW5wdm1Fd0FaL2RGSTdvOEUzeWVSQU5Id1o0MXgv?=
 =?utf-8?B?V1BwK1lyUU52RDdYVGdjTUk0cDFHaDhzc2V1bzg1QWFzdStYcjgvRGtHUHhU?=
 =?utf-8?B?Q25jS0VOa1JLaEFiS0N0bm5Wd0I5V2lUN0xPcHBSR29zQUlqdFF3NTVyWlZ2?=
 =?utf-8?B?dUJOWFFrNXI3ZWJaY0FvTmxxNjNoZGIwRnplVEVzZXN1aVExMktadks5Qnoy?=
 =?utf-8?B?TjFVRjJ3WlVhUk9Tckw1UTlLTGxHUkszMmozVk8zbWRJelpUUGpHVm5LcUJo?=
 =?utf-8?B?dFNzQU9hN3RCQ2d5RnJVTmhoQ2xCcUNwRE5uTVdoOEpjNWlzZUVIMExZbWpP?=
 =?utf-8?B?Z2o0bmp1S0l5bDJDaS9HSXZlTFZsNjVsSjhxcEMxMENpQ1NOTjQ1ajNXWGVS?=
 =?utf-8?B?MTZ4TG1DM3hsYmMwbStsdlIybm9yOUFMOUxNRmcyRTJHTXhmN3NHR2V1NWJz?=
 =?utf-8?B?ZmxlNjdxS2djUDh3WG0zR1NYTWpDdWZoMWdsV0d1czRVSWxPcUxMd3BLaGtW?=
 =?utf-8?B?bU9WWFJjWlpDd1RHU2tteTBqSUE2c1d4V2NEWjFrMWpLWGx3MXFNTnRoQmhq?=
 =?utf-8?B?MXhTSHVvTWIzRjFsUDRxOXRuZ2RJM3BDYVdaR3ZtQ21vUytFRGh6MmpPTHRC?=
 =?utf-8?B?aHRJTWl0UEhTR3IrK20xLzZJYnl0dmtFUTZJNENWN0ovRllraXh2OWpwVlh2?=
 =?utf-8?B?M1V6SDBlTk1pYXFXcnBXZkJBL0s1WkRDV2lWVFRUWXVKU0JjRStyYWppVTcz?=
 =?utf-8?B?aW5EcS9tM3Y2bStkb0ZyR1VQcldzZEowUWtEQ1JPcXV5eW04djN3dzVVcTJ1?=
 =?utf-8?B?Sjc2YmJjMGtIWVVSS2Fsa0RJSE1kaFljWC9EMnEvdU04Q3JLa1dnYk5rbU50?=
 =?utf-8?B?Z0FIRGNNTFQxTFVSM3pwQW0waDdnRTJ3M1h3OGNPUzByNEtmSXFqTEVaSGRI?=
 =?utf-8?B?NGkxNmRvSFBTNmc3Y3ZDR1dRUjMxVkFFaWFvb3R1TFZuRFRSRkhZMnlmNkll?=
 =?utf-8?B?MHRYZ05HVjUvRURJbktHdXoyS1B4Nm5ldHI5RE1sdjBuczJhbS9LSVNGc1hP?=
 =?utf-8?B?NTl0Zkl1QmNnRjl6aFpFQ21tRUhZNHc1OVd3M09BRzVjVjNjMWtGQ1dmbjg5?=
 =?utf-8?B?NTVWSkg3N1RYN08wVEVINkgyWlVnT3VwTWdXSXgwRjN6TmRpY0pLZFIwdlhE?=
 =?utf-8?B?c2hKV1RzVktFaDF6ZUF2V0NBcjFoSHJHRkYvN0pOcVBtbGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:53:21.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b0f1fd-562a-4758-a3b8-08dcf2a945d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 14:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206157

SGkgVmluY2UsDQoNCj4gT24gMTcgT2N0IDIwMjQsIGF0IDA5OjQwLCBWaW5jZSBDaGFuZyB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8dmluY2VfY2hhbmc9YXNwZWVkdGVjaC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBDdXJyZW50bHkgV0lDIGlzIHVuYWJsZSB0
byBnZW5lcmF0ZSBpbWFnZXMgdGhhdCByZXF1aXJlcyBhIHNlY3Rvcg0KPiBzaXplIGRpZmZlcmVu
dCBvZiA1MTIuIEFkZCBXSUNfU0VDVE9SX1NJWkUgdmFyaWFibGUgdG8gaGFuZGxlDQo+IHRoZSBz
ZWN0b3Igc2l6ZSBvZiA0MDk2IGZvciBVRlMuDQoNCk5pY2UgcGF0Y2gsIHRoYW5rcy4NCg0KVG8g
ZW5zdXJlIGl0IGRvZXNu4oCZdCByZWdyZXNzIGluIHRoZSBmdXR1cmUsIGNhbiB5b3UgYWxzbyBh
ZGQgYSBxdWljayB0ZXN0IHRvIG9lLXNlbGZ0ZXN0IHRvIHZlcmlmeSB0aGF0IGlmIHlvdSBidWls
ZCBhIHNtYWxsIGltYWdlIHdpdGggYSBkaWZmZXJlbnQgc2VjdG9yIHNpemUsIHRoZSBvdXRwdXQg
YWN0dWFsbHkgaGFzIHVzZWQgdGhhdCBzaXplPw0KDQpUaGFua3MsDQpSb3Nz

