Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1A6CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 12:03:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web11.12067.1727179400796125752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 05:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ibRqyqAZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ibRqyqAZ;
 spf=pass (domain: arm.com, ip: 40.107.21.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oZenE9uwx9Q8InZvjyUO8gVpFT9LB3qub0YGli5d1zi5bS1EBqkLfXi3RpeJX9uQymsujQqkIoUjCbItJTLKxKYJtD15sl0Bi8/JL1g9+C0v9qDGRWt6cRM/Hm1NrEy+kU/ooLt9daQzaunWTFK8l5lGGsGtImuFWgd4w8OxJhWmuHkMgRx9+N9+m6qxR8w6v5n235+1OiOIV1a+to/5pP7kSPlK5l4Lo/SXxlj7k+Z7qn+CFK8TCgUQsxcTzg1txZOFKr39jMctfB7dLKPvLqVtpSezuPmGuR3tmlDmM9BLWJ7oCq5SilhrHSgxt3JqD8wLU23HbB8h/CXkhCkKIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdJC4BpVMUeRqjrKHcm+bcdH/raTanCEYtcina5eGmQ=;
 b=xMMV11FEcaIfq1WqCt/V6+nRSbfNprimhd7SdEj5TrMW66jNuCTFltQUU/SWkEXNcKBAjBunDSncQAhdT3/JT3SXVO2X1a8MgIum9CqRhe/fY9ONiC4VKZaoE9BC6962Qle669MIrhQ161eR8HWG7DR38Npt4XwJ7EsfnCueCXVkA+a2gcg+qwOd9HWCwWWXdq1u3TsTrWB0yOIlEpnpVsDMGyw+2KkzPC7hNqG3nnUZbWGAnq6RiiPxWz6TIUUPBpJ8AcuudzfpK3wmAtvGmJqeG7cHnX6yqNealwJG8pJ0MXG31QlMNlM1aUFDWeo8Sd9jlS2wgI800vCdK+3aZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdJC4BpVMUeRqjrKHcm+bcdH/raTanCEYtcina5eGmQ=;
 b=ibRqyqAZDjbdhDUbk4UcsUd6p+fI4wemXJJc/Wn3w04Ha0qwIqsCD/6oLVXe8rnUqqM2YOmzJ0EYoULsBM9MqBk5c+jh3dPOaecKUNCyxA58ZKVy9nggkV9sc2KXZ0ub9ztS/PDhsvl/OUOSSHF3RmycwEvnzLcPpehMn/3IhHQ=
Received: from DU7P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::22)
 by PAWPR08MB10118.eurprd08.prod.outlook.com (2603:10a6:102:368::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Tue, 24 Sep
 2024 12:03:11 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::c6) by DU7P191CA0022.outlook.office365.com
 (2603:10a6:10:54e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 12:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 12:03:10 +0000
Received: ("Tessian outbound f9d5b330f2e0:v465"); Tue, 24 Sep 2024 12:03:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72760b0b8d758bb8
X-TessianGatewayMetadata: Ju+f6Iy7cQ7T9IHhYUjbJTr2BZiaxAcCaBaNbaXOVVutO9+L09J0y1xoVZUB2naBzGGQPv2s35zB6Y/1+EdW4CSqTFMVt//SiVPpTO+6VlHtfwZBpGCYx9NzI/fX2A36uL4B6yMJCSw+mWHsUZCCohfXAfjwmTJ3tpEoaXWPK0U=
X-CR-MTA-TID: 64aa7808
Received: from L177812e56d4d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 31FE7DAB-8C69-43CF-96F0-468221DE3B07.1;
	Tue, 24 Sep 2024 12:03:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L177812e56d4d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 12:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRxHwZ0b4E9sa+P4N5yS3Oy1t9k6+evUIwvMYvc8Za+EGSUyYjPHlUEDThpro8dWkwMqU26BVvTmqosCqBzfKNbGmKw0X9c8E2HLiPF2YES095617qEyCmXm6VsUN++2d8ohWt8N10gauQFUbKtmgaBpEkDzr6vCajg91PzwQwidhGBD5WvtaWhDbFEuYdIFKbuDXbuN3AN91cvevkGmkVqOIeuN++8nwL1GgyZQu5AFh/WmCp3qe8wY5Edfugmh3aZXXpz2R+NlDELr/93NbO01bJOUGuJOo5ydo6Mef+K4MFRusCflZnszgyu9vhJdJ2VoHrUs67111RHs4HG+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdJC4BpVMUeRqjrKHcm+bcdH/raTanCEYtcina5eGmQ=;
 b=uBoOq8QENonr0k+l31G8TFdCJs25WlnhiadGr9h1WLLUwIMeIhnxRN3EuompMnT2byPlwWfHwwXU73pSVL2M8PedokVeCcRubNeZ3xESRTwibNzMGLi+GIVhar/CQ+fP8xu5hp5Bp8TUPOL8AH97rfigQiZHysa5OZflArUCxuCzp01Sjiyy0f4eFYAKXCZvfqSgY9unuGllXfO7UgbEKy9kplfPFm9EDEvJv2vEXV5rzKNrS/4Ch2OvRAmxOK/8w5wwgm/ddX47SoaouD+dCO9YpKMcYOds9rgL5G0/QIOCUVMw5OmWXfGX9CKwnRfZvCHsiz0QCcCbviYqNiUzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdJC4BpVMUeRqjrKHcm+bcdH/raTanCEYtcina5eGmQ=;
 b=ibRqyqAZDjbdhDUbk4UcsUd6p+fI4wemXJJc/Wn3w04Ha0qwIqsCD/6oLVXe8rnUqqM2YOmzJ0EYoULsBM9MqBk5c+jh3dPOaecKUNCyxA58ZKVy9nggkV9sc2KXZ0ub9ztS/PDhsvl/OUOSSHF3RmycwEvnzLcPpehMn/3IhHQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8930.eurprd08.prod.outlook.com (2603:10a6:10:465::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 12:02:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 12:02:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Yogita.Urade@windriver.com" <Yogita.Urade@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/1] ruby: upgrade 3.3.4 -> 3.3.5
Thread-Topic: [OE-core][PATCH 1/1] ruby: upgrade 3.3.4 -> 3.3.5
Thread-Index: AQHbDnVBo07BUzRlaEmgyinXjIDX37Jm1mqA
Date: Tue, 24 Sep 2024 12:02:55 +0000
Message-ID: <F774386C-4210-4156-8369-B108AC441399@arm.com>
References: <20240924113031.2229409-1-yogita.urade@windriver.com>
In-Reply-To: <20240924113031.2229409-1-yogita.urade@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8930:EE_|DB1PEPF000509FA:EE_|PAWPR08MB10118:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e844c0-9ab8-41bb-351a-08dcdc90dbd4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2orREhMd3R3a211bXo3d3JwR0JzcUlOMWswMjJpQVNvejVQcXFwSWMwSlNp?=
 =?utf-8?B?aUgzK3AzYmN6aGZUTkZlZFdka3JLa2N6aDNTMU52anJ6Z2cvWDhlOGo0RGtZ?=
 =?utf-8?B?OWhWN1had3ZqNGY1eHFseGtsVHdWQ2VJWmcrMWVaa0VvRm9ETUFYRUh5MTVa?=
 =?utf-8?B?VWpzR1hxS0dVTGk1Q1ZUd3JNK0pKM0dCTjZRNGM1VFd4Z1lscEV3ODZnSGRD?=
 =?utf-8?B?S1ZkZmlGV0F2RXMrRGVpTFI1TUticHlFek9pUEVkR3g4dWN1cnpuTmYxQ29z?=
 =?utf-8?B?aFYvcXJId3dybHI5QjNsUU9FU0gxZ2RCcDZuZ01Ub0p3V1Q5S1dPSFZEWUNK?=
 =?utf-8?B?aXhTYTMxRU5vb1RkbmNyVm9BT25JSm1STEx3b3FudVRwTjliTHhNU0l0Slhu?=
 =?utf-8?B?eWMxZ3FZU0xsUCtNVnphQW8yaW4wc0ZKallkT2VDQ3JKdlc0UE54WE5BRVg4?=
 =?utf-8?B?a0dudklkb0pBTDd6SncwS0ZsMFRDMGIvWkE0VnozM2FlV1RjZFpPMXVyL0dN?=
 =?utf-8?B?bWJPOUpJc1pyVmhkbzZDRFIrKzQ4VkJzTXNBcys3aEVDTVd1ZDVHNzg3ZFph?=
 =?utf-8?B?ZnNhcytkRUhvZHFtQ2ZKM0lHRDE3eGtvU0UzY01iZWF5cTlVdzJ4ZFRCZXdI?=
 =?utf-8?B?blVVUlUzbjBEZzlnYncveTVJWVZ0WjJRVUZYcWhwSFJiTkxXWW01bXAyVjB0?=
 =?utf-8?B?R1I0NFk3YTVwRGpkRHc2OGdsbkxuSzVuaVFZL01jR213dlE1TWVFY3Zvdzlr?=
 =?utf-8?B?WHFSNnMvWHMyeVp4TWtvVkoyY25TRjkzUXN6SEE1MUVudk9TakZOMlZLVWhQ?=
 =?utf-8?B?RWc2Z0xET0xwTUZMT2ZuOGFJdUlrZ0h0V00wTDNwdEdvc0ZSYnBQdTl0NTBT?=
 =?utf-8?B?ZkpFb21NVXd4S1c1TklQUm5lUitYNDlKOGpOb1lid0FZSEdOQW1nUTVLK0hn?=
 =?utf-8?B?R3dwcmxJKzQxUHZudHYzUnpyUTJlSGJlcnpmSEQ5eVBIQkUxcWliejk5b3Bw?=
 =?utf-8?B?N0hyc0Y0cy83dG9rZmF5ckw2YllGc1YzLzA0QnpJWXpWdm96QU1PNldSVGhZ?=
 =?utf-8?B?UmwzZmFPVjM3WWxlMWt1MXU4S3Nla0NRdGEvdjVHSzZyQTFVQlE3MGJRZnJ3?=
 =?utf-8?B?elJsNDhFL05neGxmeVhJdXhsN0ZEbFhVYis1SFFaSE9ZdkprakF0UmQ5SDZt?=
 =?utf-8?B?OFBFQmMwY2EvVDJFR3A1Wm5XeGdaNnl4b0xyMm5QZS9oZTA2SFI0UERRV1hl?=
 =?utf-8?B?bUNHd3EyUnlrUWhDakhPZE8rVUdtY1JPSzlGYlJzd3BjdFNHa3UralBmRkZt?=
 =?utf-8?B?VkZ4bXVRS2FmZ1NRNitCY0ppb1dyT1BQK0xZWEMyeW9VbXpmQTBhNHlOUy9Q?=
 =?utf-8?B?a3NoUWs2ekJldk9rOXhGUHB2dHZPYm1SY2dnRXltdE9ET2RLeEtuSnI4bXJ2?=
 =?utf-8?B?eTdCSWR0U2tlM05ERlNvSWdjdGZnTzhKbTNhSmxWeG5DWkJpOElsc3lqTVk3?=
 =?utf-8?B?N0o4WDBMUDlJR3h3YTZOUGN3MUszVXdKLys5c2pPclBSK0YyNGR1dkt5a1VC?=
 =?utf-8?B?MjdSSmZwWldFY1hlTE16NGhkbGVJdXpDbWcxN1FSdHlrbExrcXJ6d0NBbEls?=
 =?utf-8?B?WTM4cDJDeXVJNU1iN3Y2OXdIYjdKVU92K0k3N2ZLMkRXQkpheUxPS2xDMkdY?=
 =?utf-8?B?TWJSazBlNnZtY1dVSkFkZG40TjhuV3V1dlVBVzh0VVNiS3FUK01JUW5xZXJR?=
 =?utf-8?B?eStYdE1MQlhMNUQ2Qzd6NStqRUVFNHRRZ1VRS1doWmF3M3k3OXQwb2lRYnlq?=
 =?utf-8?B?dVdKbFVCM1dZTmFNV2k0Y251ZHR1VXNyWDNOYjVpWDk5MnZ4dUF3TUNFbG9S?=
 =?utf-8?B?YU5YcGdldGVsbDE2cXBUR1JmbENBTUlzb1d5ZHF3VDBkUWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6EE6DAA25410243B8CFBA074B5E4DD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8930
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b661d18b-bb78-4390-7674-08dcdc90d327
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vy9rZVZNMXlNR0dqbGdCczUxL2xZK0lEWFovZk94Z3RXNEU3NklTWGEwaGM1?=
 =?utf-8?B?aU83WmhBcWk1NFVyWDNZZjlaQVVpUWUvTkd0bEU2VTZzTk5KSlJsamJpWDRq?=
 =?utf-8?B?K05JMlhxbXNWbUxITUN6bXFEQTIxWlRNQmptZFRKak5uVlZIRHI1QnNueE1J?=
 =?utf-8?B?QW9UZDVCY0dGNEM0ejhjNFI0c2NZQmZBUHdJS2RibUUrVlNQcVUrK1k2S2t5?=
 =?utf-8?B?WW5RRDZ1bm9IVzd4UEVtd2hCRWRZYlhkMzIycDJ0MnpDM3NVN09DWW1Odng4?=
 =?utf-8?B?c1Bja3lVVjZ1eVpWZFlxUnpxUHNvYzgxUFBJb2dCcURmMFBlQWdnQS9zZkJB?=
 =?utf-8?B?TjZSTGRRY0NyZFIrUnJnYVc4VWJXU1ZLTEF6dVpMWWNtczhHT1FpNFEyZXNS?=
 =?utf-8?B?TlRQOC9ZZ1ptU1c1KzdMSTlGR0RsRXVCMWg4MVJrUmNubzJNaGJ3QWpUUG9k?=
 =?utf-8?B?VjBHYmdQTjNlRmRTK3ZHRUpjL3JpRVE4Yys3K0NOWTFTb2Q0cWpLYWJBOFpT?=
 =?utf-8?B?UDRNaXZOOERqMXNmWEU5eS9XV1NFSVdWSnVndStXR21sTk1aRHJRQnNrdHl6?=
 =?utf-8?B?emJ0Q01VNGNES2JvVXExMG5KbFRZeEd6RVVSVzdTS0JQYUlvN3RqRmxoUXZp?=
 =?utf-8?B?aCtTc0VIVFo5Y29MRGhVcHpveXJhak85KzluT1hBaE52T1FrZ2ZTbi9tb21k?=
 =?utf-8?B?QkRVMXVYL3NtYmZlREpyWWlIMEliK2lnN3lQTm03cUxpY1hTQ2ZOdzJZNkZl?=
 =?utf-8?B?MDhYVmJ1RFJ5Wm9hd25LMGdZRHFnR1VmaU5TRXp6bk1wY2VZU1g1Z214L2p2?=
 =?utf-8?B?K0kxdEJlUkgrVGl2UEZDemtzbWxWWmVZWFRDUUtLUTMybHNLZHF5bzRKOHFY?=
 =?utf-8?B?OWh4SUVEeUtCdlljQi9FMWRLM1JLcCtYaXRrTVE2WEJwaHBXa2RkYXpZckM3?=
 =?utf-8?B?dm82VG5TVDc0Qm5xR2NJWlVCUEhsekcxekRkcEliVW94R2xQVk53SHh3SGpt?=
 =?utf-8?B?dFQ0Y1h1NU9LUkVxZEtwZUJ1Skc3WlF6cTB2QTBUUURJd2d6U2lIK0dxOVQ1?=
 =?utf-8?B?OElVSVh0Yk0vSGIzQ1ZZRVB0b1FKT3pielQ3eE94WGY0RjVqWFVXWVg4YlVo?=
 =?utf-8?B?WFJFczVTL3c0WVJ0TmoxU1Nzd0JMUmd0MjkwVVFWMWxzN0duRGREcXRLUGhC?=
 =?utf-8?B?dEdPekk0dEVOR3ArQWtWVUVncnFNSWZiblljd1F0ckVuTEwvbVV4eVRNdVNM?=
 =?utf-8?B?a2R5elJzN3Z2NXpCSE4reUNwdHhvSnJ5Zk5FMGNMU2lxZDRKaTRHMDBRdTNm?=
 =?utf-8?B?cHI5V2xQNnIyZEhPaFdSYXhOY3NVVC9oUld5YmVSZkNtNjBoNklLSnBJc0VC?=
 =?utf-8?B?bFZWcDdkNHo4STBvaW42QUoxTHFrNU1PUDVrTnFibXF0M1dvSkpmeTJnNnpU?=
 =?utf-8?B?a1U0OGUxSjZEQ04wNDVTVzBpUHhEZ0RsSHBrdXd6VER6MWNkM2l6cmVmc2FB?=
 =?utf-8?B?QW1tam00dFFQcXl1QU80SE9xL2RPd3lWWDlyYlBDcDFqYVhCTVhVYThkaDBT?=
 =?utf-8?B?TzdpLzZaT2VvbWg1Y2pBdjNTb3RxeGZiYTM1eUprSGd1ekloaEx5c1dCM2pn?=
 =?utf-8?B?aVViNjFHWkJYa2ZkTTF2ZFFWYlE2NW9ZQzBWa3U4UWFYeWxDL1NFQW05SUxZ?=
 =?utf-8?B?TUNpczRBa2Z4VWRqMlBwRWF3dUlmQWR1ZUlCL0hVU1lYYlM4ckdiRjROYUdz?=
 =?utf-8?B?WUJGRjV5U0dobFlVaTExQXNZTEFGN3MrbVZhY0NjMXUraE5aM2MwWEMyd0ZY?=
 =?utf-8?B?RnVUUEkxRng2cDhmck1FTkdscTNYRnRQL3dCZGVvZ2FvSC9oVUx6blMwUWEy?=
 =?utf-8?B?ejR0SjRXdk9wb1QralVWRVI1dmh3LzN6RXJUYVJ0bHpPYnNPL3pKeVJINlJO?=
 =?utf-8?Q?9IhUUjn8MWDAUm9nx7wEFWvyYP2Mig1A?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 12:03:10.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e844c0-9ab8-41bb-351a-08dcdc90dbd4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 12:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204857

T24gMjQgU2VwIDIwMjQsIGF0IDEyOjMwLCBVcmFkZSwgWW9naXRhIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxZb2dpdGEuVXJhZGU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IFlvZ2l0YSBVcmFkZSA8eW9naXRhLnVyYWRlQHdpbmRy
aXZlci5jb20+DQo+IA0KPiBJbmNsdWRlcyBmaXggZm9yIENWRS0yMDI0LTQxMTIzICYgQ1ZFLTIw
MjQtNDE5NDYNCg0KVGhpcyBjYXVzZXMgYSBsb3Qgb2YgbmV3IGZpbGVzIHRvIGFwcGVhciBpbiAv
dXNyL2JpbjoNCg0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcnVieS9ydWJ5OiBGSUxF
TElTVDogYWRkZWQgIi91c3IvYmluL3Jicy5sb2NrIC91c3IvYmluL3JkYmcubG9jayAvdXNyL2Jp
bi9zeW50YXhfc3VnZ2VzdC5sb2NrIC91c3IvYmluL3Jkb2MubG9jayAvdXNyL2Jpbi9yYWtlLmxv
Y2sgL3Vzci9iaW4vZXJiLmxvY2sgL3Vzci9iaW4vYnVuZGxlLmxvY2sgL3Vzci9iaW4vYnVuZGxl
ci5sb2NrIC91c3IvYmluL2lyYi5sb2NrIC91c3IvYmluL3JhY2MubG9jayAvdXNyL2Jpbi90eXBl
cHJvZi5sb2NrICAvdXNyL2Jpbi9yaS5sb2Nr4oCdDQoNCklzIHRoaXMgaW50ZW50aW9uYWw/IEl0
IGRvZXNu4oCZdCBzZWVtIHJpZ2h0IHRoYXQgdGhlc2UgLmxvY2sgZmlsZXMgd2lsbCBiZSBpbiAk
YmluZGlyLg0KDQpSb3Nz

