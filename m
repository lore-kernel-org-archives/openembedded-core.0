Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E886FCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:40:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.44])
 by mx.groups.io with SMTP id smtpd.web10.314.1759768824528225329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 09:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OWMpN3rH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OWMpN3rH;
 spf=pass (domain: arm.com, ip: 52.101.83.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OKVMjaIMHBMm+i5jCUQsnsjR02oCfsgQf+YopAVo9HRFkiWtehwUBMxmhzniAoYiNg28stX52de9DYvE1ZWxOMrJlQpP/9JCX2Zk/EftZqFhzBQzVN7ELJCa8WLRBrDtx1AE9o95AxLNQRM3rF6bCBUEIjO1e1TpLqW8ND+pMxolpD2XAQU7iYkKhA3IjTCgNYMsYGpAAUR5ytxSW0/zjW4QZDW6tGOPofNu7YoDQfRvHzfV9hTe+Btz3zWhI3LiAgoW/zSq0bSyhj8HYRbDuVon11GpImdN4ghux8rhiddEoV4TPiMSgzix1CUHSDgJhpZvz8YMroP8mWDHPO1BBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6OEcMnlCNUZI8iNBBC+NDd2fsIy1n/f18rnaw/XvG8=;
 b=iwv+y4KOOScYEcIkScqxdqH6qr52OAAqtBV/a6poEi737QjQ2yvFbMLScS60Hr/rOsoWUmxSAsj0sQxEA7r8+6IDMMLskY/nQZ/Jyrse/DCfSKndWC2ozJ+HNyT95TfSg76L582U1Ki8dNIJZ5PqIqsXGFW21IJ+TvnN+c4IbSvWcYmg2/6+McsWQ7P5Hl7QYvoUWJXBA4q9DomqIXaH5zQYrVmdqW3v1bj86l4oHee8zEuH/CQe+LijBOKmnMdJfyeOctrfrVGapWyz6xmgFSNqAVjfirNhjwMyIfU807MOIm7bmIlNFJOIb9rISvNX3+1fSSpahFPW4zgK9nE2qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6OEcMnlCNUZI8iNBBC+NDd2fsIy1n/f18rnaw/XvG8=;
 b=OWMpN3rHCO/GFnR3ejON5Q+melrxBbak2phqIQe1vlY7FYWtlUe9GihF6a/c2i3PsfZr/4qo5dFjVae4L1JsgX1ge0gw1hCMfRUkUfe08mFmemEtYaUbXbrpsAHugnwW4FWHctK42Vi3liHhI+KGrpBi+6V6LMpnYdnDW5DE7/A=
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by AM0PR08MB5378.eurprd08.prod.outlook.com (2603:10a6:208:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Mon, 6 Oct
 2025 16:40:18 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::b4) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 16:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 16:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AovKQq2B7dU9nKcjK7RTc/ddtT0p4sLIkhOIziJrqdVUs0PmisOTH4Elh5rCrUaXXd0LR7cz9Xx1j42P9z8Xc6a3+b2ccQusV/jTqVr9alL8fxvQI8iObbqRdueaEjGaVWixsr6OCe5QrvaKeLsgKWUAG7XDZPoMY9tldgdzy0LriAGMlSGoOhWKxvpEPtCwKf5BXqhPb5O2tZcVmJq2Ti95kYZWt+lPOGdOt4Z9KSJxMrLJArGR1IfuB/Ml3O+boaU6sitzrtx7LhUtSEKIElPki2aCj+52GJ6eSTuXei20CvX5/UOIWp4YdL+Bh0tY/+Dq4bNqhUURNCSDANPb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6OEcMnlCNUZI8iNBBC+NDd2fsIy1n/f18rnaw/XvG8=;
 b=xio40vlEqu8Q7ltPSat1ZN+eIEvZ3iH5E9C6g4J95Lt29ebZzGnedwMh2PWj7kiND6a6o9M+BI8xCQ4DbrzWgANkGndO4LTo47QjrbJnAGQCpIeGuRGajkJ9uJDiQmbFLS7gOu0hAv+IC7pHXxva566IX3R+YqIFK6OvBCeLeyBDK9it2UbHRm3qM3MmjS5EcJGc+QRmUPE/VufXo003zdOnSKfI5oXIdP0jp+oYUFAJd5CJoJp3VIMOZCLF8Y9jPQVSPXQ5Oh8hxvU8jhEXYC/WnKr8g+a2Q/01wYzumjZzVUukhZhWjEeLjUBM4LjweKlq9io/TPd5N26ch8fLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6OEcMnlCNUZI8iNBBC+NDd2fsIy1n/f18rnaw/XvG8=;
 b=OWMpN3rHCO/GFnR3ejON5Q+melrxBbak2phqIQe1vlY7FYWtlUe9GihF6a/c2i3PsfZr/4qo5dFjVae4L1JsgX1ge0gw1hCMfRUkUfe08mFmemEtYaUbXbrpsAHugnwW4FWHctK42Vi3liHhI+KGrpBi+6V6LMpnYdnDW5DE7/A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9628.eurprd08.prod.outlook.com (2603:10a6:102:31c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:39:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:39:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
CC: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
Thread-Topic: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
Thread-Index: AQHcMz79Ier0CAcBEUWCTiPvdMsIarS1LNuAgAAsPgA=
Date: Mon, 6 Oct 2025 16:39:44 +0000
Message-ID: <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
 <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
In-Reply-To: <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9628:EE_|DB1PEPF000509F5:EE_|AM0PR08MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 291abb57-b207-4877-6a39-08de04f7085b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TWxVckZJU1BGT0lsZ012SEY3cko0OVBXeEdxK2dDMU56WVROYWxMU2prbnlS?=
 =?utf-8?B?QTR1TVE3UjVXb1N6VVF3dE0xbDFsUFQ1cXVzNjdmc3AxRTRGUUJuNEpqcW9T?=
 =?utf-8?B?REJFN2R4UmJnQW1jK0s1bm5NbDlEejloampzdG1SbjRSWXk5bGVVU3NHc09r?=
 =?utf-8?B?dXNOeHZ3WnBSdUZpOGNGYndna0swYmxnTW9KSkY5QitXQ3RnV1FGbTVTNEZW?=
 =?utf-8?B?dkdOSlB1aGxMQXBQTzh3MlJ1OGFjaWR4djBtZ3hhL1dpTDVwcWQvQWFwYkp1?=
 =?utf-8?B?QWVhU3JGakdUVlRUNHFTSzBzQ05aOFZXbnVzNGFLMENPZzhYRUtEUFl0dUtw?=
 =?utf-8?B?aDUvcjcreENwbHBpK2lEZWFUZkpiMXF6RVRUUDA1Q2xXTzBHL2E1anBEN1c5?=
 =?utf-8?B?KzhCclBTUzdaenYwcmZXaC8xTmlNdkFkOENmTGRzd0Ura2MyTEY2Q2hoazVB?=
 =?utf-8?B?TUhkelhzK0EzY3pYbnNrOFczQlN2V0E5M09nTzJDN0JaVUphdGpsbUR1ckdW?=
 =?utf-8?B?Z0lJc0FFeWthWHYyUlBqclVWckJmVGx1V280SEtmcjJhbEhTVFppMTVpaVR4?=
 =?utf-8?B?MDdTakY5dWtvOTBQMWVCYjNEVUcxVkEyZzFaUUVUTjFUeE1LQndPRHVPOXll?=
 =?utf-8?B?Y2NDUVN1Yzk3OUhWc2E5ZE9uNTZxemJJNVl3SXgvTnJLWEw3dTBtNUQ5czR6?=
 =?utf-8?B?QTdRMzBGalN0OFRNRUwyTktZQmVMMC9HSEZXejNzZkRNWU5McVBHOHREMGNP?=
 =?utf-8?B?djFncTVuajI3U0RUZVNJaFl3bUd5VUNiQ0dlRG9LRElPTHZ4RVpYczdqWW9s?=
 =?utf-8?B?RS96SitRSVVYWmZBL1VRTW00Tnc1akROMTNQOFBzZ1gxa0RpYjg0QW9PTk1D?=
 =?utf-8?B?dUlmZTdMYWZuWVdoaHVZRHd1bjRkUEFRcTh2OUM1dSttOXh6d3BzajJ2S0tq?=
 =?utf-8?B?T2V5QlFxMXFBZ0RjYVc3UWVvMlAwRmhQbjZPcmVldjJkelRCOHV0UldVM3BC?=
 =?utf-8?B?VUdveUpxUEw4T3gzTlZZTVl0RmZHVVNyWklpSzdoS08yUlpFcktqcHVuYUFV?=
 =?utf-8?B?WlpzeEUrNGkvYVhPN1BITmxUZjdMSmlIRmpqY3dGRWRKdlA4ZDNDbkd6OG8y?=
 =?utf-8?B?Tnk0bXRhMHozZVB4d3o2cG83ZFlZRG5ITXB2N1B5Y05Sb0lBWm9OcTU5V2N5?=
 =?utf-8?B?VDFtU1IyUzN2RUx3QUsrNEY4REF6UDZ1d09JNk5Ea1BJcDc5TnlBVERsK1lR?=
 =?utf-8?B?UmdPT0ZYbGlZWFdMZ3hOMWNrUWxJTXEzMkNGM2QybWxZeTl1Uk95Ti84dVNy?=
 =?utf-8?B?T2gvdGplNys5OHl0TU9HRmhRT01rZ09WazBTNVFjYnVsMEw5N25tT2d3aFoy?=
 =?utf-8?B?ZTltZkZVYU42UllRaFZ4d1ZXWjhFUHpuK2JNWWV5aEpjL0ZFTGtsNkRVNUpD?=
 =?utf-8?B?NGtUUkdLMk1GbkdlNEFZRm1zOE5wQVRxZGtUaXZVMFgycHo2K29FK1p5Y01w?=
 =?utf-8?B?OEpSMElVWXdRb3hZc01XcyswVWdaaks2RzZ5Y0ZhNGVBRTU0Y2NxQXArZC9u?=
 =?utf-8?B?c216bVJyUXhoNHFvVmxUR2ZNa1FwT0VzM0RMVEt4MWV0d1djZ3ZNU2JnV3Fh?=
 =?utf-8?B?aXplalY0WFJNZTl2eFhhb0c0SlVWM0p3b3d2TUNOb1E3UEVCNDdqbEFQS1FK?=
 =?utf-8?B?ZEhEV3NweElKSi96UlFiZFJYTW1HaERIUjN2MXROWUxEWkRMbzJvZ0YvN0xN?=
 =?utf-8?B?MXNCckF5OG1kRFRvMGwwNUkzOHRwVFVHd2p1NzlKM0I0UTZOY0JJdVBjc2tU?=
 =?utf-8?B?eDNvL3JCWjVoY0F4NGUxaEU1MU8yZHcwaHJqRXQvVGluamROSU41N080MVEz?=
 =?utf-8?B?c05tK3FwTlFhekcwOXFmNm5IZnNZdDgvcEcvRmQvQ2F0VEdRUS9TZ09VQzNn?=
 =?utf-8?B?QXowVm5QTk8wZ2JFU2doV29Bb3UrY0VLZVk0cHdtTUNvNEJqRDcwOStzSzI1?=
 =?utf-8?B?c3hJaUlwR01DWE5lSzh4Yi9FR3UvSWRHWm5IMnlrQzVaWjlvSUxCN3psbkk1?=
 =?utf-8?Q?xbSPhp?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <606B01B009DFCE4596D5FA833D4459C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9628
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	354cdf4f-e904-44b1-8d56-08de04f6f4cb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U241UkUrSGI5cTB1VHIwYWtxTWV1dWlMOFMzRUk2MS9nMkdRekFxWHVaRk8v?=
 =?utf-8?B?TlhoY01NVzg0RXpGM2RCT2NBa1FpeXZ0aHdrWnRQUTZrc09BTzBBbXNnNEFJ?=
 =?utf-8?B?MjBMT2NiZ3dlUnZTSFpiVGlhdTJYNlZuLzNiYVp0QjBNYU9QZHVDZFJJRlRv?=
 =?utf-8?B?V0Zsa2JoeW1KTytETVZPSG9wVWVoSW1UU25KRks5UjhudGVvbVQ5Vy83S2tj?=
 =?utf-8?B?L25LWlRGVE0rTXVDdDVSbUFOekdLQWZlYldRNnBzUVRlQ3ZibTRPQ0YzVTE2?=
 =?utf-8?B?Smlkd0lvUStYWDdQeXhZRk9MamlNakVzVUpyL1VpOFVEZGkyaGlyalBzeitM?=
 =?utf-8?B?dlp3ZW5YUldTeTRhTC9EMWNLWmpjM0hra1BwR1YraHdvL0FXcnFKaDlXRFAr?=
 =?utf-8?B?eFNieDJ6d3hwRmgzVkNvYXp6aXJOVFpWbzdXSzBNc2NaSk91dWQrYzZ2WDVn?=
 =?utf-8?B?dWorZ3dwbTExNTJiT3VXbTZCaS9EM09WU1EzekhRdVhHOTkxVERsZTA1ZXRZ?=
 =?utf-8?B?UnQxVDJzTitrb3E2VmNoK0UvbnBUOEd0QkJ5cC9oWlEwb2J1Y0FmNHgyS0hY?=
 =?utf-8?B?aEdlaGI5NHlSV0xScU4yekNUeUdEbGcxc25VZ3VtM0VQRElYSGZtMjBFd1dD?=
 =?utf-8?B?Wnd2WlBhMlZIWVUzQUNvQTA5RndIVk81RGJCQWxSZ3NpUGY4elFiQmdleUE1?=
 =?utf-8?B?UnlMUmdlT3orazJWRmRCc0xGQ3M5SWJ4SnN4K0pzakNVcUIvZ1AwQmFISTFN?=
 =?utf-8?B?cXp1NEtsY1FmTVhoRDJzT2tXN1o5QzZIWHlyUjZiNm1xMlA4dnA1dmhPeVU1?=
 =?utf-8?B?ZWJvU3Z6VDU0TnJTSzA5Y1hBN21nYU1hazJSbzRramxyZzdpblZEOUJXc2tx?=
 =?utf-8?B?RWhZL3RGYmtmUGZoR3oxNW5TNU5YRW5RMHZmMlk1U2xFeXNFYTJad2Zva0kr?=
 =?utf-8?B?Q2NzN09qVDlNN0E1SEdSUURzWlM0S0xHYkNOUjk2REl1REphVDZPWnlqNjNH?=
 =?utf-8?B?L3pQbWN2VFBiWnUzdWNET21TTk9zNlo2U1pvU21BZTJxYWo3aTQ1TS9tSjBL?=
 =?utf-8?B?OWFpTG43a1NoeGFCVElXQ3pkOHB0bWxsWXBEUkVHaGhCclRMV3ZqbWFKd2Qx?=
 =?utf-8?B?RWdkZ3NKYlNRYUZTcitNY2piaWFiNUFxWEZQbzFLdVFoNUtqSk5XSU9VL3FY?=
 =?utf-8?B?WTRDUTR6MmxISVhGZnVYQ1FSWUVJdlkybm40VGh6MXZFcndHTVN4Vmx6Nk9p?=
 =?utf-8?B?RlJMczNKTzdXV1IrYml3VFZFSHNIVE5BVTdVZ0Y0Y0UvbHpNa0tqU2RJSFVn?=
 =?utf-8?B?ZHdCUDRuZG1IeWtDa1pxc0kyUUZZWmErRFhBRFFYaDVKVVRldXlwOUd4ZWVs?=
 =?utf-8?B?K3Q1RWZoUmNkSEdlejhwQ3BEemFndXNzcHQ0MFpuUEsvK054eCtzUDRrQ1JZ?=
 =?utf-8?B?NVMySlZZL01jVVpzdW82ekZNS0wrbE0wTFNEME91MHBSRnJEZk1La3pxNllL?=
 =?utf-8?B?TDFob2hrNmZob0ZhbkpFcGY3L0t4VW1ZZ3IxZk5uSE1OL1NsWGFBQ3pQSkps?=
 =?utf-8?B?WFNnTkdvckxNaTFDWmJEWXpGYitnOWlTd2lyQkMySGxJOHcxZ2hJSE9rTXZB?=
 =?utf-8?B?ZzBxRFNmNU9uQnYyNXVRVVdjZG1QRUM5QXgxM2tXUFJ1NnJ2dXNBQTdGc2VX?=
 =?utf-8?B?ekc2eHBDc2NlRHUzem9HV0hEVktEVEFxbHJPdXNDTTFwa1FUSjlqZG5qcHRJ?=
 =?utf-8?B?bFdpMDhvTlluSDRlNnIzV0pMU0ZFT2ZpdFNRdlo1MVpWeVcvb3pZWGcxdHpL?=
 =?utf-8?B?ODIxR3NJbkQ2RWZtQ09KR29GNGM2RXZKSFVzSDdISVFaU0pPSXA5Q1QyTXhT?=
 =?utf-8?B?WEdTMmd1L1NFazRPVzBkdXZJcFBqZWs0eE1CVzE5V3gxQSt2QjZiNndXWFlE?=
 =?utf-8?B?SWVxTEtZbGFXbVVBTkVVOXlDRWNZUkxuTU5VQURGajdxREEzamZCblZMbWFy?=
 =?utf-8?B?RHBUZ01zTXNqNEhqM1g2aDNxSjcwbm1IU3lDWFA0OTJ1NHE2eTZrS3RFU3hG?=
 =?utf-8?B?bm5FRkM2NlVKbUJyRmJNa0JnZStuTzVOR09KditobkVxMHhzbEpiREw4L0JM?=
 =?utf-8?Q?3CRo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:40:17.5853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291abb57-b207-4877-6a39-08de04f7085b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 16:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224495

T24gNiBPY3QgMjAyNSwgYXQgMTU6MDEsIFF1ZW50aW4gU2NodWx6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxxdWVudGluLnNjaHVsej1jaGVycnkuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBJcyB0aGVyZSByZWFsbHkgYSBkZXBlbmRlbmN5IGZyb20gZGVtbyBh
cHBsaWNhdGlvbnMgb24gdGhlIHZhcmlvdXMgaW5mbyBiaW5hcmllcz8NCj4gDQo+IENhbiB5b3Ug
anVzdGlmeSB0aGlzIGRlcGVuZGVuY3k/DQo+IA0KPiBPdGhlcndpc2UgdGhpcyBsb29rcyBnb29k
IHRvIG1lLg0KDQpJ4oCZbSBub3QgRG1pdHJ5LCBidXQgSeKAmWQgaW1hZ2luZSBzbyB0aGF0IGlm
IHlvdSBpbnN0YWxsIG1lc2EtZGVtb3MgeW91IGdldCBfYWxsXyBvZiBtZXNhLWRlbW9zLCBidXQg
eW91IGNhbiBqdXN0IGluc3RhbGwgbWVzYS1kZW1vcy1pbmZvIGZvciBqdXN0IHRoZSBpbmZvIHRv
b2xzIGlmIGRlc2lyZWQuDQoNClJvc3M=

