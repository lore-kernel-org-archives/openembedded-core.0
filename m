Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4D7C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 13:37:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web11.43402.1737553059663005949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 05:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=etFFy/2p;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=etFFy/2p;
 spf=pass (domain: arm.com, ip: 40.107.21.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SCGVXiMVxx1sgZPC4LJK5UAyChIgzZ4axeFipkt3AQM7q4nUSDufg338miXqfhODRq7vuoR0TI2Ujy5D0kmVHgzPWlyF9wQLxEiRLwka2SNrbNmi/xrin4BsvG+l3YupkZ125r3Ekbh959hTIresFLsCwt/5geZPm8uXj0395X1GvhpOue5VB4QWuEsE3ttpmdTzM7pBhfHBQYHV0vqTdiYs2mAsNvo2fzMlJ4URLd0yquUlsDh1NBPg6IPP5N9FKAenxxMFj7lDsnU7yIHZXoT7LvQcT3UJU3KhB1maLPlLD3/wV6qixkBlJsN2pl0E8cvMGWcUNmb90e5l/Sb0uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKKA9RHfuUFexEMFshEydXj6xoEAYcRvuETKhhsYgfI=;
 b=xNh5qeMdlXXgChtFWHwK/sRBgTH165MbpaXXaiFgbjNY1i04ICvXsOIA89NPZ/R1Fpxl7Vkatzk0oK8GroP2Ix0u97wRaw24Fybfm6ULDbW04DYqz3C+zFOcIjLXBE7vAkjOptjFiikO+mSFl+XU9YsgJIe+rQnF8Ghje3mK6E5hAMYfN7zxpv0LGLEvSPjwOUR+MmFQZVMfHH+cARVMSIa7yRmKXiPPKi6SjJAwzgQ6ioJK3OPt2OiiCiYqo7sxY9AKxU6Obi6MkxX7bjuo0k85xp+IGTzxodQozaAjtvJ3Up/CU4Gb8GiOzzNOrUSP8EN55qoJEIIfZQRLoddniQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKKA9RHfuUFexEMFshEydXj6xoEAYcRvuETKhhsYgfI=;
 b=etFFy/2pZrfoK60iCYYMJ25NtRScTli//Cw5K+bLzNUqW+SMv0DIKvORYqiZuALsswhocb/HTDkhlqQ418C+ZY83iqckizy5QmKoKch5wpFV5XCymrj0cm9+ww6pGat5vqTAWpuSZS/JTqVQtcDlrceBnamE2ZdgraUbMc7ATcM=
Received: from AS9PR06CA0638.eurprd06.prod.outlook.com (2603:10a6:20b:46f::32)
 by DU5PR08MB10634.eurprd08.prod.outlook.com (2603:10a6:10:51c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 13:37:33 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:46f:cafe::9c) by AS9PR06CA0638.outlook.office365.com
 (2603:10a6:20b:46f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 13:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Wed, 22 Jan 2025 13:37:33 +0000
Received: ("Tessian outbound 31efbc6d7992:v543"); Wed, 22 Jan 2025 13:37:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38f892d93d121973
X-TessianGatewayMetadata: 8CB7RAKIP4t9BYPRkt8FWM3JtdBBT3H0OksYb5zTaVGfDURU5b99/2E6+Qlea9cJwfjAXxSLZ9foOihGxuwotI4K5BWqBjWuannC0xyQhKa1YAu6TSOe3ZOVjb0R3+sEoPrwwCZzY3qKa1Si+frZMoOlXe6e0EGAvxUIJE+hUMM=
X-CR-MTA-TID: 64aa7808
Received: from Le36462a1fedb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C2BDD6FA-1641-4D77-A2B4-2A35BD6D32AC.1;
	Wed, 22 Jan 2025 13:37:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le36462a1fedb.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 13:37:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kplgwTgidm3XqBMuZohZzNmS/UsVlMDraUs7DBGbLMYJhVVQ++kOdJdyowLwu0aQduTGbXPnVkl8jLV6UWhjEc2a0Exdw/hLEkfCkbLTumZaBtuVZ67W2tgXxdIS2mRSQ2mlAxR9TEfvxzEyuZHu6ax8sr3axnsSZOTWlB2nhGw94UUS4ebvkoc+F7b5jlwvUol1Ufm7LkTgO+lfcrEbEjRL2yAglhwLq19Dd248mnt1slzWJ8QUOUQDxpG51SbG6yfJiQnVyxdxXncpaDT6v4XYE5PP2V4illWS1h2/vytPnw6k88QNWdyw++IxSqhFCDv5iGfr4FESp3tSdxvbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKKA9RHfuUFexEMFshEydXj6xoEAYcRvuETKhhsYgfI=;
 b=AcTrSgDn9sEca8UAXuXuNwUw0K14Qw9LtFu4i9g25T8hhtCp0Vy+6DHqwYB83MDmgDLqXclevEw0X2hDu5kR584iwzF7JLOV/kLbJFES4YygUL0WsADm+7riQHOPNJoV+ivb1n02vfDUf1lquCRfS8fZ2WTf0oHohz/69CCXbJXCCrVQCICKW1BWH8ev2ogY5uD0ao6xJg/BMQV4iryfrrTGYoVmAtWMkDeOmwR3nIF2jVS+bQmFtbX6BfbzBz6RTjxfu2FI9YHoKWy2USf3AuhsIyNsQkUgNLasEwjUflAVThCIEMVM+oQNrzZ6asp0CNxl8yeTW2tCTSc3cz1TnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKKA9RHfuUFexEMFshEydXj6xoEAYcRvuETKhhsYgfI=;
 b=etFFy/2pZrfoK60iCYYMJ25NtRScTli//Cw5K+bLzNUqW+SMv0DIKvORYqiZuALsswhocb/HTDkhlqQ418C+ZY83iqckizy5QmKoKch5wpFV5XCymrj0cm9+ww6pGat5vqTAWpuSZS/JTqVQtcDlrceBnamE2ZdgraUbMc7ATcM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:8c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 13:37:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 13:37:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sean@geanix.com" <sean@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: set CC_<triple> for
 nativesdk
Thread-Topic: [OE-core] [PATCH] rust-cross-canadian: set CC_<triple> for
 nativesdk
Thread-Index: AQHbZl1dzCBOG6z5bEe/3MYN1FagN7Mi2MMA
Date: Wed, 22 Jan 2025 13:37:25 +0000
Message-ID: <DBD35C5A-63A2-451C-9695-593E9B2DC8CB@arm.com>
References: <20250114082128.903105-1-sean@geanix.com>
In-Reply-To: <20250114082128.903105-1-sean@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5579:EE_|AM1PEPF000252E1:EE_|DU5PR08MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: b52dab41-7c3c-4210-b1c3-08dd3ae9ecf8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bGlBRkNmUGtzaEF5b2ZsdzVxY0Q1VHNQdUlGSERDYm95b21wUUhnVTViRDFV?=
 =?utf-8?B?SHM5S1BaaS9DTk0xclVDZWduWG1nK3lrQWQzSFpKbXQxcThiUWNpQUlqQ1JD?=
 =?utf-8?B?UWhtdjNBalYwcHhYSFFrL0Y3THk4b3VBd3p0QlB6d1kyU0JjbHIyVk5CTndr?=
 =?utf-8?B?N2tqM2FNNE16NVhuekdGRTRHR04reU1Ga3AzeFduYm1hbTVhRGc0RHBycWhU?=
 =?utf-8?B?ZG5EenJuQnN3TDdrVHZDZDFYSHYyQTh1alhLVGtPVjhNSzZBa1daK21GOHFG?=
 =?utf-8?B?eDN5dmVDUWJTbjhUc0wzejAxRXdqUVNuQlRDckRzMXU2VGpncjlKbFdNNWQr?=
 =?utf-8?B?MEN1Z1lDY1JNS0dPeVE1dVFtUFlCQUxoR2lBVERkWHdYdkFnNm9tNmZCT3c5?=
 =?utf-8?B?MXdiL05BZG1GVzJXMnlCU25FRWhYaW1WK0QzZjRwTDRZT3o5VVJqbTBBeC9s?=
 =?utf-8?B?aFpQclRERDNYK3FXMjQzM0RTWUFrT1lyVWc1T1F0S3dlZVpKV01WeHlUNlBU?=
 =?utf-8?B?SmcxWm1oaUgyMi9VSTNXVWtWTnJvZTNZNEg5dzlkemZPWnRvaDNHM2c3V3J1?=
 =?utf-8?B?LzFWaUpWbGdPVUY5OHJJUis0aTFNTXVDYjFNdEV6SFhCT0REZTdSSTNUZXJN?=
 =?utf-8?B?Q014Mk1zTlZoNklxMWI5TFJuYWlrcW8vNGNoZ3A5STc1bHhRWnF0MmQ3R1VY?=
 =?utf-8?B?SnVyZmZ3Z1dibXNLTFBiU2RSYmlmNHVDaldDMkVUb0ZJT01wVnNDbzU0QnYz?=
 =?utf-8?B?NDIwbXNDVTdSb3Yzd1N3SzBHL1VEL3Bic3JjWDdvRlprZW1BZDhYdHF0amdw?=
 =?utf-8?B?TjNPQmZoNExLU2hnRFJKQjUvaHBMOEhGMmt2bWZsZ09zVlp0UUxLdTQ5RjZ2?=
 =?utf-8?B?WFFkUWxpdEd1dHlmR2YvOG5IVG42Q24xRGRxWmdDVEpIZ3BUdGNiMGRBUUxM?=
 =?utf-8?B?cmhMNFpNeFVhY3JoamhvYy8vQjNKcGZTbnRwRDVVZzlQNEI3R3Vtc080ZURI?=
 =?utf-8?B?NWY5eXNyVFZHanJzZ01aVmI5WGhYVTI0ZlVwS2Zsb09WSEl2YllLa3Jabkxr?=
 =?utf-8?B?a0dNNFBsYWNtcXdKTUo3dklaRmVEUUhncG9adnY3dWVqT0JTV1FZd1hxdFp0?=
 =?utf-8?B?cW9kKzNzejBSR3lQd3FQZmVLSkc3d3BZSTF3UVFDL3RVSlIrKy80cHYvR0Vy?=
 =?utf-8?B?SjJORTRYYUxxS0RhcEJmU2RnT1R0V0syYlhScGs3T0pGdHhBaHlTZ1FpYjYw?=
 =?utf-8?B?RHkvcS9xTWFQYkRkSzdnNmlxTEhYQnpmU2Q0dkd4ZlNMMlQxdS9RbWh3RlhJ?=
 =?utf-8?B?cGpqWTZBTkdCWkV0Y2krd0RBMjVVOVNieUVlQTBNdHJPT3FaV2RVUFgwY3kw?=
 =?utf-8?B?Uks1SVVJdThxRHhhSGVlOW5kWEdzaWJOT3pjUlF6M09JS2JGNUFIYUpoYUwx?=
 =?utf-8?B?eG12MGJ6cWJiMkszcWMvR1VWRTFMekN6NGJDSEtEZlB4TUlHV1BUSSticUh3?=
 =?utf-8?B?cTRYa0Y1Ymt6eG1UUjVHWTR3MVZydWN2L05mczluZjRQbWJCSkx3SzcrdVJS?=
 =?utf-8?B?QVVoY0VjM2FRRTJHWU5QWnJlK05jQUY3REdRMk8zSW03RWVkemlaa2JwN0Vi?=
 =?utf-8?B?YVlKK2p1aXdXNlR0a1dqQytMWWdZeHBRbzM0M3FaY29Gb1BVY0dJU0JKSEZY?=
 =?utf-8?B?TGJRQTZ5RC9yYi9vYzM2YkVkTU1kYXhheDdscVBxZ2c2SisralFiSWN1anRE?=
 =?utf-8?B?bnU1anA3QUN3U2Y0czJ4YWJ4Q2IrM1JmYzhSMTdFNVV5d3dnbFlFVEJyd2tz?=
 =?utf-8?B?MzRHU1F3VWlWL0V5NDlaTFdpTEdYWTJBMUZQQnMrVW95QndSQ1VhaEpFdDRR?=
 =?utf-8?B?VkV2SWtyc3BVL2ZvSGVHcVFkZmNlYlRXcW1OS2toZjRFQ01LM0hxOGJpQmZX?=
 =?utf-8?Q?e3LLP1swmI4AUl2y45obCXSJHR401OH7?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <46ED5C5DC2561648B2C15E87159F991E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa6c0282-8604-4ee2-7c87-08dd3ae9e861
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|14060799003|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTl4QUpRR2ZjYk54SVBoaEptR0ZySW5BcmIzdFplV3dqQjQ5VFYyT2l3N1Bn?=
 =?utf-8?B?dVBueGdpNVZXbVlFa3FMMnZrVENtaXJTdVphRGY4bTJaOVg0VHZNWUlFUmdu?=
 =?utf-8?B?QUhmZUU1YXRxcmZzZUMwNFdUaVFyU1B5dXdwTC9abVl2azJjdFIzcm9aa212?=
 =?utf-8?B?SUtiNWxrZzVkM2VHZDV1MVhKbGFCQzJ4WUpYeWJoa0kyTmY1dHZKRVVjQzhO?=
 =?utf-8?B?N0dvamxFaERlTllUbm8wNUNRTDBVNkRGOUlhU3owNTNSTzJFSGMzbDNjS0xG?=
 =?utf-8?B?YkVPM3JoSTNseXNoOHJyeDNoNUR3YXdQVUY3ZkRDc3lmUENqWUJnVXlGSVF6?=
 =?utf-8?B?OXNpVWhURXJUL2dmSkJXcWgvNStndTdIOEVFbEI2cTgxaUUrTkorZ3p5WDN1?=
 =?utf-8?B?UXJ1b2hkM1BqTlprYzFpTnVSd05xeFYvMGptRFd3eEJucnFTMnUvTmd3Mi80?=
 =?utf-8?B?RUJWRmtQbmt0SDV2VDhmMnNyT3RMZjdXeVZCc01WQ0IwRnlHL3NVOUV3MXJx?=
 =?utf-8?B?dWJUTVhoUTJncHZXWFhFK2gzUjFRZzZFQ3RCOHk3TUs0MEFzZVU2VHlRMVR0?=
 =?utf-8?B?cXQ2V1BPeG93VmFPYkFCNVI4ajJvNkdWMzJCQUJGUU9qTXVTbFBnY1doVGVM?=
 =?utf-8?B?cHA5SVRFZDN2Q1JPdmcxSzRKaFNpSGVaOGY5RlVPVVpoVXpGT21LV1FPaEV3?=
 =?utf-8?B?REFaVWh5b3BPb1EyR0V4Si85ZkJKMlM2ZHlOTGtUVmoybW11c0VQcWpTcjFt?=
 =?utf-8?B?ZWViNHM1Z1hXY202VU1rMXBtelRNMEV2MjlzMjBCQ0ZUcGxvV3diMmJxdXNq?=
 =?utf-8?B?Rnl1SkhyTUwxamZYSjlGMU1YbDE2eVdGU1ptRlJMdHJMWk9VTHVBUWRnMWFM?=
 =?utf-8?B?dlFzNjEwMEp5cHVFczJKVlpoTmo3Z2FMTGpYRGhhZ1p3NFhNcHRjY2RTbWJQ?=
 =?utf-8?B?SjF3STRtcDFSZ0krNjlWOHM5dGFuMVQ5eHVSc1hkTUwyWUJzUFQ4RzJVeUNx?=
 =?utf-8?B?SjFZR0l1OSt2WkFzbkM0WW9CNUtHSkl3c0cxemJqN2hreUJxR0F0RnNhWjhO?=
 =?utf-8?B?WGd4dDJWcWM4ZHAwSjhXQVFvb1plODdNV0xNcGV2Znc1L1VEc3RtakRKU2Zp?=
 =?utf-8?B?ak0rNEVqZmM3NHYxMU9nRGNTSWtySHpEWlg4TnVOdzdPSjg3SzlJb2s4SVRl?=
 =?utf-8?B?aG80c1pLUm9hQXMzNjRyTkllZUR6QXN5Q01JQlhEOFdPR3BmbFI0SWl6UmY3?=
 =?utf-8?B?TXQ3VEpuNEIyWkU4SlNjL2NGSUdIZE9PNGNUSWd1WHlEbDBoMTFkd0FTMGta?=
 =?utf-8?B?akF6S2VxVlk1S0VhV2MrK2hkZ0pUU0k1YktnQXVrTHpxR2tsZlR2Qk43STRV?=
 =?utf-8?B?ajh6TStRK3VJbVRjMG9CbVBKZWtRa0ppTHNYOTQ2RDd4NnNxcnVhU3ppSjVv?=
 =?utf-8?B?UWNCSytscm1XemtIZVg5ZEhMQW5DMUFxemlZWG1xUVNmdmwyclZnTUoweFFR?=
 =?utf-8?B?MWpMM0RxOTd5Y1J6NnlTRWVSSERDOXBCczR6dUdzQTJ2dXJvY2ZmNTBIMC8r?=
 =?utf-8?B?NEt0VDE1bGlYUnJ6LzF3WnNmTWxNTzhmY1VZSXVDSWVLVi8zN2hzMHEwbm5T?=
 =?utf-8?B?aElwY2VHUEFyRkpOU0duYi94SG9zb3RDU3pBcDBBc2UrYUczcGFXblRXRjJt?=
 =?utf-8?B?VC8xL1JDUEN1VXh2M3Z1bEhYempaSmQ2bU83RmFCTG1LNXA2dEVJTEdvNjhj?=
 =?utf-8?B?STZROXdQYkFRYWZPSXFqbTdrRmIxNW55aGxESTFvT2owVWtadDM2NGV6Mmlk?=
 =?utf-8?B?V2pURDVNbjlLaTBTK092aVZNUWM0Rjk2UWJVMU9Cc3l3SXAwcGpXaDc0bDVX?=
 =?utf-8?B?b2tmS3Byd05lbmh5eDE2d3JLL3R2WE1pcWhPaXcvS1RsMC9DY1diNTgzSkNR?=
 =?utf-8?B?TmFEL2dUZkVkMmwyTGVZYXNXUWNWRDBFbU5VYTE5cTh3dDFrM1IyMTZuczk3?=
 =?utf-8?Q?RWoWRQqwG2HZ40xy3geVYYBN9T2TBc=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:37:33.3522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52dab41-7c3c-4210-b1c3-08dd3ae9ecf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 13:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210150

SGkgU2VhbiwNCg0KPiBPbiAxNCBKYW4gMjAyNSwgYXQgMDg6MjEsIFNlYW4gTnlla2phZXIgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHNlYW49Z2Vhbml4LmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgZml4ZXMgYnVpbGQgZXJyb3JzIHdoZW4gYnVpbGRp
bmcgcnVzdCBiaW5kaW5ncyBmb3IgQyBkZXBlbmRlbmNpZXMNCj4gZm9yIHRoZSBzZGsgaG9zdC4N
Cj4gVGhpcyB3aWxsIGFsbG93IHVzIHRvIGJ1aWxkIGFuZCBydW4gcnVzdCBwcm9ncmFtcyBvbiB0
aGUgc2RrIGhvc3QuDQoNCkNhbiB5b3UgYWxzbyBhZGQgYSB0ZXN0IGNhc2UgdG8gZXhlcmNpc2Ug
dGhpcywgdG8gZW5zdXJlIGl0IGRvZXNu4oCZdCByZWdyZXNzIGluIHRoZSBmdXR1cmU/ICBtZXRh
L2xpYi9vZXFhL3Nkay9jYXNlcy9ydXN0LnB5IGhhcyBzb21lIG1pbmltYWwgdGVzdGluZyBhbHJl
YWR5IHNvIGFkZGluZyBtb3JlIHRoZXJlIHdvdWxkIGJlIGdyZWF0Lg0KDQo+IC0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3MtY2FuYWRpYW4uaW5jDQo+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3MtY2FuYWRpYW4uaW5jDQo+IEBAIC01
OCwxMSArNTgsMTMgQEAgZG9faW5zdGFsbCAoKSB7DQo+IA0KPiAgICAgUlVTVF9UQVJHRVRfVFJJ
UExFPWBlY2hvICR7UlVTVF9UQVJHRVRfU1lTfSB8IHRyICdbOmxvd2VyOl0nICdbOnVwcGVyOl0n
IHwgc2VkICdzLy0vXy9nJ2ANCj4gICAgIFJVU1RfSE9TVF9UUklQTEU9YGVjaG8gJHtSVVNUX0hP
U1RfU1lTfSB8IHRyICdbOmxvd2VyOl0nICdbOnVwcGVyOl0nIHwgc2VkICdzLy0vXy9nJ2ANCj4g
KyAgICBSVVNUX0hPU1RfQ0M9YGVjaG8gJHtSVVNUX0hPU1RfU1lTfSB8IHNlZCAncy8tL18vZydg
DQo+ICAgICBTREtMT0FERVI9JHtAYmIudXRpbHMuY29udGFpbnMoJ1NES19BUkNIJywgJ3g4Nl82
NCcsICdsZC1saW51eC14ODYtNjQuc28uMicsICcnLCBkKX0ke0BiYi51dGlscy5jb250YWlucygn
U0RLX0FSQ0gnLCAnaTY4NicsICdsZC1saW51eC5zby4yJywgJycsIGQpfSR7QGJiLnV0aWxzLmNv
bnRhaW5zKCdTREtfQVJDSCcsICdhYXJjaDY0JywgJ2xkLWxpbnV4LWFhcmNoNjQuc28uMScsICcn
LCBkKX0ke0BiYi51dGlscy5jb250YWlucygnU0RLX0FSQ0gnLCAncHBjNjRsZScsICdsZDY0LnNv
LjInLCAnJywgZCl9JHtAYmIudXRpbHMuY29udGFpbnMoJ1NES19BUkNIJywgJ3Jpc2N2NjQnLCAn
bGQtbGludXgtcmlzY3Y2NC1scDY0ZC5zby4xJywgJycsIGQpfQ0KPiANCj4gICAgIGNhdCA8PC0g
RU9GID4gIiR7UlVTVF9FTlZfU0VUVVBfU0h9Ig0KPiBleHBvcnQgQ0FSR09fVEFSR0VUXyR7UlVT
VF9UQVJHRVRfVFJJUExFfV9SVVNURkxBR1M9Ii0tc3lzcm9vdD1cJE9FQ09SRV9UQVJHRVRfU1lT
Uk9PVC91c3IgLUMgbGluay1hcmc9LS1zeXNyb290PVwkT0VDT1JFX1RBUkdFVF9TWVNST09UIg0K
PiBleHBvcnQgQ0FSR09fVEFSR0VUXyR7UlVTVF9IT1NUX1RSSVBMRX1fUlVOTkVSPSJcJE9FQ09S
RV9OQVRJVkVfU1lTUk9PVC9saWIvJHtTREtMT0FERVJ9Ig0KPiArIGV4cG9ydCBDQ18kUlVTVF9I
T1NUX0NDPSIke0NDQUNIRX0ke0hPU1RfUFJFRklYfWdjYyINCj4gZXhwb3J0IFJVU1RfVEFSR0VU
X1BBVEg9IlwkT0VDT1JFX05BVElWRV9TWVNST09UL3Vzci9saWIvJHtUQVJHRVRfU1lTfS9ydXN0
bGli4oCdDQo+IEVPRg0KDQpUaGVyZeKAmXMgYW5vdGhlciBzZXJpZXMgb24gdGhlIGxpc3QgdGhh
dCByZXdyaXRlcyB0aGlzIChodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuZW1iZWRkZWQtY29y
ZS8yMDI1MDExNjEzNDgzMy4xODM4MjEyLTEtSGFyaXNoLlNhZGluZW5pQHdpbmRyaXZlci5jb20v
KSBhbmQgbW92ZXMgc29tZSBhc3NpZ25tZW50cyB0byBhbiBlbnZpcm9ubWVudCBmaWxlIGluIHJ1
c3QuYmIuICBJIHN1c3BlY3QgdGhlIHNhbWUgbmVlZHMgdG8gaGFwcGVuIGhlcmUsIHNvIGNhbiB5
b3UgcmViYXNlIG9uIHRvcCBvZiB0aGF0IHBhdGNoIChvciB3YWl0IGZvciB0aGF0IHRvIGJlIG1l
cmdlZCBhbmQgcmViYXNlKS4NCg0KVGhhbmtzLA0KUm9zcw==

