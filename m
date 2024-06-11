Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90F6C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:49:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.6480.1718102968232685225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cQ2yRTlw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cQ2yRTlw;
 spf=pass (domain: arm.com, ip: 40.107.21.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UeLZ9VnpYak7CaUQ00cjqSGNg/9nS3aukFy9zKC93VCt6NjLUtRs+u3Zf94wRzNf4x+BpGu6F8QMJtEu3bJ/CJEeU5kohPkLynEa2M2maKcPqQV5U9dKf/oyEaDfnFcS8qIquXxu/XuLpbpEWL5pkLwZOL++19GSPSE3xFz0QJzYuFL4iH+DHHKGsUVMN1pZ3iJcEyD0sZJ1M28lrb0bgDJqSnJWoJolaiLS23Fih1aV9sXArhpwFFuQC2PURx4L4/KNgT3JPgz4Om/zB17YK3R+DGd4uXZ0OX86kPW7CG3kg+mDzC6XC/876cAS4hFs+nuhPJC5Fzge+4veDIcXPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v8BuPu8YnFb2Pv8knM52rl8dREmGe6aH4tbtSwS+tE=;
 b=d+K5iQZt+Zjh2zXUeI8eUOPMIPAJashrzhl0Zul7TsTLhUv9pjI+mcRBAo0JuhJucUOeCXl1vxWfGUiNXhyOQjrFSf/UmjDZed26y+OVfq8MyPUbvPByxrM2chgJRTLDYESVD6PHSTwnpi77GJ7AHHSJvJBiLQTs7DPwaTj0R5BT6ygmW/jaGzHZ9KvD8DGGu9aL5ovQUq2UxCNvQWdt+sF8zi7AaR61v6tGmLOk9CemwrEUpXxbpIhDfazltGmYGzVWdEuN65JljoGeLo+qtIhWRRZrLI2VsGqEtH15NQ/p+hSoBl3oJzaMSKpP9Wa8UTBft9CpK5gIgYpFlIODNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6v8BuPu8YnFb2Pv8knM52rl8dREmGe6aH4tbtSwS+tE=;
 b=cQ2yRTlwN6tJxCL7C25wa0mL8ZoBKTKSzFz1IAk8GSW+8r9ITw4T6aXci4Z0UmnUSLnEsDt+Kx672obtbNDCgbIlDRB8vR9ksEt+2jYdd2c338xoAsyXazwX/0b1bauARV/Jw28QgmwnZr4hDouWorgQgz39nk7U2RkGdCsTvEw=
Received: from AS9P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::28)
 by DU4PR08MB11053.eurprd08.prod.outlook.com (2603:10a6:10:570::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:49:24 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:50f:cafe::28) by AS9P251CA0016.outlook.office365.com
 (2603:10a6:20b:50f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Tue, 11 Jun 2024 10:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.0 via
 Frontend Transport; Tue, 11 Jun 2024 10:49:24 +0000
Received: ("Tessian outbound 2ded0d7f80d7:v332"); Tue, 11 Jun 2024 10:49:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1b03ca068f498a6
X-CR-MTA-TID: 64aa7808
Received: from 41be46998b2c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D258DF14-E824-478A-9D4D-DCAB9625FDCF.1;
	Tue, 11 Jun 2024 10:49:17 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41be46998b2c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jun 2024 10:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOQCLfu0Hyh2Na+R+YFlWEvxleGUgJdwaiCC2jVKVt4BBJQ95FtUGKxfr5eh9oH8CcS/fgZoONb439spe59/24XjgmPlQaVCAgYToEivo8h80Yx2KlrO9/1SoVzoZdVkBDGgg2/rCEcUdR4PGhumECIGXNLdS8Vo4r2qNMiASDr3Px83wbuT+m5dmoxD2BQ3R4+UEZI4FCD0XPwia5pjPOTtqjIBnDb3q05l5a1LdbE7tMkdvCkFbcQWyTEOxYcw2KLIu8P8pyY2OtyCWQWaohSfjA8gLFogzYIXjegNn520BxGvF0dbdVQqkRbUFSCB5WNnXBqCZ2WKWsGPsP/4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v8BuPu8YnFb2Pv8knM52rl8dREmGe6aH4tbtSwS+tE=;
 b=C/+Vzd1vbD2blR81YP5ocPRopdQh0dUdcRD/WXArUDj7x1N2RfMmB3GuaM67B/QWqbBLYDbwMnP/YBqOfwj3iDOsa5Ah7xEyjDWNq6YqfZlVaQk8NqGcRhjzi4rFIxC1oTGPiuU/QNNeV1VH6HFDi1W3T5FmFgghXIBgM1PmmVJ7UtGI6SVwqwFkdoy+mRwSFE+oD0VJ3m4bCmDjVwieqJPwOTD0pEMuZ9vgyuWQGkYYXL4I8fSrpRbFHShSK0atUwennDu538oTvQgI1v/12XrJKbGsaVQs/60iXFKvLt9moL8nqYVtw1ncQ5Bsrb5QvgMoy+cNbAAXEjr38RoIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6v8BuPu8YnFb2Pv8knM52rl8dREmGe6aH4tbtSwS+tE=;
 b=cQ2yRTlwN6tJxCL7C25wa0mL8ZoBKTKSzFz1IAk8GSW+8r9ITw4T6aXci4Z0UmnUSLnEsDt+Kx672obtbNDCgbIlDRB8vR9ksEt+2jYdd2c338xoAsyXazwX/0b1bauARV/Jw28QgmwnZr4hDouWorgQgz39nk7U2RkGdCsTvEw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:49:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:49:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ltp: Fix build break with clang on risv64
Thread-Topic: [OE-core] [PATCH] ltp: Fix build break with clang on risv64
Thread-Index: AQHau8SwHoFZxM9VjU2lYnp7kP2zOLHCYmgA
Date: Tue, 11 Jun 2024 10:49:08 +0000
Message-ID: <FF8B26CC-CB7E-40B5-A5E8-E4C4519F33D0@arm.com>
References: <20240611060017.618296-1-raj.khem@gmail.com>
In-Reply-To: <20240611060017.618296-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5424:EE_|AM4PEPF00025F97:EE_|DU4PR08MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bcc0e2-7319-4cef-cbb7-08dc8a042858
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q1R1T2pzYnpJVk5BL1RKZmFOMkhDM3lWeXUwRkJTMTdTaFUvRW5lcHN0ekxq?=
 =?utf-8?B?dTlrTXZXbGxKMGh6Qng2V1ZFdzQ2dHp3bVlnRUR6TjBYQW9Ubm96RllTRFVn?=
 =?utf-8?B?QnE5OHhOb0RsQU5Cc1UrUFJFVWRBMjVZY1AxUEZGRElpQnVjNjJQYUF1Nmds?=
 =?utf-8?B?M1VkMmlQT2cvR2ttM01LU2RneE9VNW55b0VQbG9Tbnk2TlZrRk1uRkQvenFE?=
 =?utf-8?B?cnNoV1c5ZzNVYXBNeEx0VVVpS0lqYkhSeEhUYVZabDdoT0NHZEpEK1ZZa1Rp?=
 =?utf-8?B?YVpCTFhHYlc2azA2cmxvOUFXVUhjcnA5cTJvNXJ4dXVpeWJ1WkltT2pFQzJp?=
 =?utf-8?B?UHlMNWRBTFQ1RE5oUlR5WHdRTGM1U2NGTGh3UG9xSlBwRVE2ZTJncnc5QnRN?=
 =?utf-8?B?V2pWdXJiNnlZMnNYaTc1Nkk2YzRRU3FBcmJWbllTVFROa2JBNlhGblRwRU5G?=
 =?utf-8?B?dHFUTVBoWU5RRFc0YnVJdHlOTUM2MVJEMzUxWlJZZjBBL2g5NWx5TjhkUDlW?=
 =?utf-8?B?ckdmNEdrWkpXSVVKMU9aaU9wUmhYWlRYNEpGOVhPNEJSczFhVUJELzNjaXB0?=
 =?utf-8?B?WGw0Qi9XbHAzRGZtUGkrMC8zVVhSV294cG5wRU9tMU4vN2pPQ250dWVlb0JR?=
 =?utf-8?B?djhDdE8yT3ZMOEhZdG9EL2JHbjdvSk1pbWFOa09rTkpWQURPU2NQcHl0OXVV?=
 =?utf-8?B?Y1ZHTnJaMkxqcWtCVzU4cUhEbU5IL3JRaXg5WUJVbWVBN2pQT3h0YXpJM1lw?=
 =?utf-8?B?N2I1cjNzY1ladTlmZ3lRN2FYVGpvbUxoWDhNUk56NEpBMjR0TlNORFBMKysr?=
 =?utf-8?B?ZEZTZ3ZRMnJKd3ZCYkhjQ1FNZit1MU9YQ3RrWnFKTkhwVThSU2NqUmhUL3dn?=
 =?utf-8?B?QTFhTmhIMVR2VHRudE52Zm1CVmJxSUNnRkI3RjV1d1hUQ1VINURjaEJmb2Rl?=
 =?utf-8?B?eVUyS3ZnakJZYUJTcXRwamlDZXlRRkJBN1BRM0xOQURCR1UxcStya1B3dHpB?=
 =?utf-8?B?N1JOajRYN2E3WlJuUUw5VWpQaHVNaTQrUG56elhsb3BRMWpVNmtlUklBMVV4?=
 =?utf-8?B?SnVSMEJINXhKdm8vNlJGc2h4ajcwT3cwZXcraWlVb1piY01ST1lJYk1ON0lH?=
 =?utf-8?B?cWVScndkdkM5ZU41eG5RUUJWMzBObW84d2Z1WjZxYlA1TVYxTVJYUGRJaXVn?=
 =?utf-8?B?MUxBVmFQbTBHa3ZValh6STYybm4vNWRQTDB2WE5kZ2MzOFp4RWRsWmp4Q0k5?=
 =?utf-8?B?bHBZRlZ6QVprUnNnZGtYMGdmeU94aUFxUGsreEFsZWpkSWtNWjJFRU54UzVG?=
 =?utf-8?B?UmpWYnVPTGpQNGNURHUrczVpeEF1VFQrK2c3MlVSdkRqTXEyTURvMTdyVTlv?=
 =?utf-8?B?Q0tJdG5ubXdFUWZDbXM4RGN2bmVObkJZN0NNeXF4Y21PZUU3dzduTU5PTVds?=
 =?utf-8?B?Tmt3T2l6bFZhMGhKYTMyeE83UHFtRFpRVUUrVy9vR0tmanFxSHBKUG4zeTVP?=
 =?utf-8?B?SFgwWmphUHJNclY3Qnd1MkdwL3htZzVCVlNwTmNreFNNZEYyVHFYL3lmNU94?=
 =?utf-8?B?aU15VEZXWXR4NHlNVlpzakQ0b0FnOGFRdlZwYnNJRGRLc1NHdlRRMlF1NXRS?=
 =?utf-8?B?amE0T3VYaEZuQmJka0l1OXFoM2toNkhYUE9aM2Zhb0JaRjlWWUVLTm13UUR2?=
 =?utf-8?B?SVNTMENaOTk4RTN2QnM1TGhYeU1iS2QxOEp2Tk1KTFg3cExNdGg4Nll4MXQ3?=
 =?utf-8?B?b04wcWFCb1lJWkh4WDJMUVZGeXFoNktleHJNcjBLVklpNGJxUXhsb3hCNUhx?=
 =?utf-8?Q?piAvGjnVbLrf7DR1SuxVvj6eVpInWKIx+Bosw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0E2E920EE3D9F4AAB7382BA2DC9D49E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	07b66de6-b32b-47f3-521e-08dc8a041f3b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|35042699013|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enBuTlIzM1VoamxST1RLUzBpNE10dHBtOEltUFNlRnUxNTZxTmpiZXVwN2Qy?=
 =?utf-8?B?TmcyTnQ2UVp0Q0dIQldCUUxBV08vZnBudVpObzllL2d5eEhxVEZQVEM5THgz?=
 =?utf-8?B?WXlaRDJVbnMyVHJhS054UURJMzhSYXRRTGVybkx2R2NnMWRMSG1kSUFoeFU4?=
 =?utf-8?B?QjVheHdsVkwwSHpPZmViUUdDQjRicW9PZWdVRDUyUHo1Vk0vZ2ZGWndkYjdt?=
 =?utf-8?B?VFJIVHFrc2dja3hkajQwYVkzOENmL1BiTlRGOEsxM1Y3dG1pRFlyYnAxMUNu?=
 =?utf-8?B?Y0FFOVJhSEFXTkVBU2U4azd2anh3cGc5S1ZSNXZGTDB4Tm5rdkdCZkwvSncr?=
 =?utf-8?B?eVlrenZ5SlZPVWpLaTVkcTZaeVpBZ01rZHA1L0hPZkVOYnVBUDRYS2RFNDh2?=
 =?utf-8?B?WnFpVjdvQ05seUhlY2w2SHlIcUV0TlFOejBlM2RuNTNCTVNFZzZHanJGL2lQ?=
 =?utf-8?B?aThSUVlLU2RxQVRjT1RiaTg4Z1JMczFqVyswK0JUV1B3VTFzWDkwYW1Sdi9R?=
 =?utf-8?B?NzVEMHo2U1pqcG5ad3BCeXJpUEZ2U0lXZTNkOTZKSG9jcm1yS0xiZ0tadUZl?=
 =?utf-8?B?T1VMak1wcXovZVBFclpZMitiNlNZdEwrZDBpOEJBcmZIN3drZTYxTFlhOWtW?=
 =?utf-8?B?KzlpNHpwZlBQSlRMU1BvcUlLMVZRTUZvRS83TjVjU2hGckVzWldPWWhReFhh?=
 =?utf-8?B?WHJ2RUw2bCtjdUdIQTBWRmVVdVlXWnFXWkFwZEIxTHIyeFZNeVpmd2ZKeVlZ?=
 =?utf-8?B?bVY3V0VDWHFDNXl6QUxCaGp2WXpPamwxRXFHdkNyZFkwZVlMQm5nSTZTWFlQ?=
 =?utf-8?B?M2JudGxjN2l4NFdOL3RpbEJycmthWGZGQllTQkRjMXNkcUw5a1VmSFk5OHFH?=
 =?utf-8?B?Y1NMbFQ1OUc3OVR0bzN2UU5KOGtWN0xpV1BERDBlTkp1enN0UWpKTzJPdGpv?=
 =?utf-8?B?OERpbzlGc1ExV2FEMUZKeFZhcDBETnE0T0hpVE1LaEtKSUkwSVZSSlhqUG4v?=
 =?utf-8?B?bjhQTUtpS0RFd3JGZlhZTDk3KzVBQnhoTi9OOEhuZk1ueXovNlRSK3RsOEE2?=
 =?utf-8?B?UThWbmlYRGZoTmQ3ZWJRYk40REtlc1VXdFpxaldrVkJWc2FwdkxpSzB6bmVt?=
 =?utf-8?B?L0FsSGdRWEF3NUxLSXRsdGk4MjJzWmNvMHpINmw3Z21qTGNMMVZkK0RwRlVh?=
 =?utf-8?B?eHEyQ0F2ZjFsOTZJcUwwdTNOSmUvVGxtbnhPb0lIRHdZTEluLzQvODBsWWg2?=
 =?utf-8?B?dHFRSzEyMW5VZTVLRnBFSUpxM3Uwc3RrUWdTcEEwd2lkREZaNHJ3NXcvY2lJ?=
 =?utf-8?B?R1dHVldUL2ZVVVNXbFZFTnFmSXFRamtyYUtjanQrdVNadTFUeHo0dU8xRmQ5?=
 =?utf-8?B?cmRxbjdPU2JxRGgrS0JOV0gzMEt5QU1RWUp3NE85aUhlN3JKSFhPVFRkSmZG?=
 =?utf-8?B?OWYydWRlMjk3QlZNcTdOV2FJRVgxK0tjK0M3VDlhZitURVJZcEtkRVh3QTJJ?=
 =?utf-8?B?T0M1VGRKUkVDbi8rUUtiT3FyWVByRzduNHpvYkw3Sy95R0o0UllUbkhuQklw?=
 =?utf-8?B?Y3NlTXJVdHN0dmIxWlFzcHVMRzcrWDZFV0oxaXpXUnFKRVltNHJGT2o3ZVht?=
 =?utf-8?B?SW9ITlduTmxUMmlBdGc4cThyZGZXV1ZhZG0yZWtQZmRGRUlkTm5mMWs2YWNY?=
 =?utf-8?B?VVBzV3N2eVdrczNUNkRLRGVWd1Y0cDRoRENzcmJlbVJMWWRtaHdMNUpaTEx5?=
 =?utf-8?B?ckFiTUZwYUgrVm42K0NqYVl1cjFvbnYzYXNxQXNGUlpCbzE4aGVOdVR5Z3Bm?=
 =?utf-8?B?djhCbTREZTc3clVWaURYNlp1OHBOTWtPNjVpV3NMM0twY0JQbFhpWUVyUlNO?=
 =?utf-8?B?Y3RzbzlObUxRdy9aWHI1dnNLejYxVHFxc1hWY0dla0NGc1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:49:24.0709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bcc0e2-7319-4cef-cbb7-08dc8a042858
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200506

T24gMTEgSnVuIDIwMjQsIGF0IDA3OjAwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gK0xERkxBR1M6YXBwZW5kOnJpc2N2NjQ6dG9vbGNoYWluLWNsYW5nID0gIiAtcnRsaWI9
Y29tcGlsZXItcnQiDQoNCkNhbiB5b3UgYWRkIGEgcXVpY2sgY29tbWVudCBleHBsYWluaW5nIHdo
YXQgdGhpcyBpcyBmb3I/ICBQcmVzdW1hYmx5IGl04oCZcyBZb2N0by1zcGVjaWZpYyBhcyBvdGhl
cndpc2UgaXQgd291bGQgYmUgdXBzdHJlYW0sIHNvIHdoeS4NCg0KUm9zcw0KDQo=

