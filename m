Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D97EC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:22:30 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.66])
 by mx.groups.io with SMTP id smtpd.web10.23622.1747920144173435384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 06:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dcx6AYnR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dcx6AYnR;
 spf=pass (domain: arm.com, ip: 40.107.247.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ku8YrPlHiOCaE/DKKY/u+8xvdBXJvLbchv2NlLEVsA4ANb+tDqspVTJPPy2SMFD3r+yeptqQZQJg0KerEJeCdQ4gfknwJLGxr6dNCWl/BdOjStwdKE6H0mRiHCNMiTkdOr5RTfMcAsI5Dp6K3nDmEtCAmdUE55r01NR0pUulZXkK8Q1pxhT+jphboFqhZknQM3wuPyK3nluaAIKe33OzRfqAyeiwFp+4etO0l3t0Mp1zs2n9V6cDauMt0H+pauSPJCiDKJNioRUjux2U3wzL1qLByb4fDBne2XrmCUzhqYmQfTY2IXgzoRJr6dWcPiIB4pgev+G+ooi7eI6+g4J3Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAUzdOKB1ywreiSYthUkvQ/YvHh+GiMCw1en2SxLPLc=;
 b=xGbk1wVAg64O8EGM1NGI6CAAdKdJ9GcjD4RbtQ62RR4xZJ72IoxLdWDjB9y/Wp0hnWesOkXgmYoa/JZRHFaXnjw2FdDhjSH1vYUf85lRyXsZfVGGhUW9vh7afhiy9eaj4ZeFlh2/sosb5QJIxZWpU0uGGOlrHC7esY8kJU3xm35BLXXhopfjKpvBKiRkUm31qKsc6CN+XJfmT9KwzA9TkibE6lxgxWY7if7LRLTa0zCRYrd8UxUtYRT3zBtj15s0m2MWkDRnV/SNzbG4xxBhV24XqwdZAbFd0iqO9VkS1p+YEf0prcEqbY39LBk11lGX09ghwYwV+XaAf59xESB3sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAUzdOKB1ywreiSYthUkvQ/YvHh+GiMCw1en2SxLPLc=;
 b=dcx6AYnRcfdIdsdK9U8gyEIOtDOgQ27UDVlQTuLnzkmMfBmY2dsyiwH7uwmBet0+r+P36Xf/AZn+Hwwx615Ig2TCRkk+qGWuJMPF5sxW/61C73bb5UNyrs8wnJ5TokHC6Hxznm1XrfZXlg1+FYbGUIfcOEwU+Ynbb7uROEPymKE=
Received: from AM6PR0502CA0061.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::38) by AS4PR08MB7926.eurprd08.prod.outlook.com
 (2603:10a6:20b:575::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 13:22:18 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:56:cafe::33) by AM6PR0502CA0061.outlook.office365.com
 (2603:10a6:20b:56::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Thu,
 22 May 2025 13:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 13:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJI1BtxXtyV7W0HmSQJoTDDKcjg8Z8nw3Bn3+dJ2eI7npEn1kz89aWGspPk5Z+6kTKOEjBCxO1zNb6YD62ZElpAFDvShBS5YMtaT15+PI6tdpWB6TbzWvqMAKVoyJj0RUSH2DCIW/jjrQDxElclh3FTVOUF1giiNiVN9rUEKeu15fK/T6UDwMupz+uhxHalX8i+zA5EKzUhpHSkc996u1VdCOf82NIHz62/PMgx3J3qMuPRajhdJlEApasV2GT4BWueKO/LnTdTDhF3l9j9DdZmcq+ZIA3NorV9tpFO3fSjwDoMkabbufN7j/BEOgBfKiV+Qzel3VcI5K+bTf+pf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAUzdOKB1ywreiSYthUkvQ/YvHh+GiMCw1en2SxLPLc=;
 b=iChTCxOiqZWOCRgEh7owcjlolLxagojpSMiyHCGeW4NKpOt43VGHKOXB3oARxLqVlum99PZPhi2LPLPri7BmjrGkir95+wSpnugRHJ5hNTgBwOIF4XXaanLxVLZU2FJUiSRYQFRBpmcns3NbZMmVa38gKvNLi6jdPaBpqwZivZLyZX5Yo13K7rgOUq5IfdrS0HG8COmXWUM19VPMeQtcjBQDOBEP5PBro/PJ0CRoGmkKZ3uiuypjs0KBvDn3oDzRsn+MYyzFw8EbVeQ8sPdiehqQ/o/KFUsVjZywlcShBtN5dr1+WHeuQdBnpnZPyXOI/v+AwoNUE3snPNh65CHKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAUzdOKB1ywreiSYthUkvQ/YvHh+GiMCw1en2SxLPLc=;
 b=dcx6AYnRcfdIdsdK9U8gyEIOtDOgQ27UDVlQTuLnzkmMfBmY2dsyiwH7uwmBet0+r+P36Xf/AZn+Hwwx615Ig2TCRkk+qGWuJMPF5sxW/61C73bb5UNyrs8wnJ5TokHC6Hxznm1XrfZXlg1+FYbGUIfcOEwU+Ynbb7uROEPymKE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9381.eurprd08.prod.outlook.com (2603:10a6:10:3f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 13:21:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 13:21:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Topic: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Index: AQHbxge/B6mfBl/tNUu9iiHOT+Pm5rPerNAA
Date: Thu, 22 May 2025 13:21:44 +0000
Message-ID: <81C42383-FFC0-4D6A-A541-2419FC216FD9@arm.com>
References: <20250516021005.781630-1-Qi.Chen@windriver.com>
In-Reply-To: <20250516021005.781630-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9381:EE_|AM3PEPF00009B9D:EE_|AS4PR08MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da9a3d3-6c64-400f-7ba6-08dd9933ac50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aXVYalY0SGROUlI5L1FiSEJlTGRsSWtpcG82bkJ6ZjFxanB0bWZhblgyaFVI?=
 =?utf-8?B?U1hKamliYkFJazV4S1Z1YkhPRzNDZUl3eUpleXJGMGN1M0dzVUd3d2lFN25p?=
 =?utf-8?B?b0M3d1JXZGFabDVZMEZZSFdvZ3BJVm9SSW0zQ0dRTHp6bVN2aUs3OTdDc1Fj?=
 =?utf-8?B?M0pxbU05UFQva2NjME9ESUhKVkhkUWZKS0owemlyMUV4QmpaZFhpRHpZQUc5?=
 =?utf-8?B?UUxZY2RTQk5XWFcvdllrNFJVdEo5dTJ2ZVduc0puYTN3WTJtTjNNUi9Pem5F?=
 =?utf-8?B?SU5rOXhKbmdESVFiMFJsUzl5T3ZoNGM4b29rc1VwL0VleGVEQ1BBS2FQWDI1?=
 =?utf-8?B?WmtVZmluMi9QejVYeXBDV0NZdnRHL253cng5bUpMUlBZR292am5iQTJ1TUJs?=
 =?utf-8?B?UUo4dWtVdEJjcCtoMlhFSVNRTkhDZFg2WGZQLzJXdHVYSm5zZXAxZDVQdVJB?=
 =?utf-8?B?MEh5WEhReEJCZHdveEtTRDNVS0Zhcm9RVDJ6SEFjdEVxREpFU1FVSENVelVx?=
 =?utf-8?B?NXhYWEdxUFNMWXhTSWZHZ1ZhZXpLam01dWxIRU5oSk53bDBoNGdGNFFjZzJN?=
 =?utf-8?B?NVh3eEcwd0Joam1yUkhVOTF3SDZoalN0ZzlEUnJSMkduaURyRWFodDVvb1NF?=
 =?utf-8?B?ZkNJcGx4S0hQZEVyNmRzZXNocm1QUStDVDQ5K2pWMWluc0hvU2dtOUcwNkc2?=
 =?utf-8?B?T3l1bEJOZWR2NVlUUk55QUVneXpRcGFLY3lENVpSUmRrc21LSDZjQkV6UGMz?=
 =?utf-8?B?LzVSUkxzNDhReUQ2VXFRdXQ5WCtFdUdTNWFWVVZWbUM3QldXVmJFSzFBMkpq?=
 =?utf-8?B?eVpuUnpRcTJEYnhmZnFDVzVJNXY2M3ZJN2g3Sm91Z2p5NFF4OGRUS0ZGV2xI?=
 =?utf-8?B?UXBPTXBMYU1USzVyVHM4MnMyejJIRS9Jcktya1JvaXFBY0V2Q1ZuUzV1Kyth?=
 =?utf-8?B?U3hSUTJSeUl6N2ZsYm85VHNHVUFGVERRL3p6eFJFZ0J5UGp5cFFmUjNBcVRV?=
 =?utf-8?B?cE1UODR1UUJVKzV4cEZBNnlTZ0ZmTGpjNGVxaks1YUs4VkRVS05mbU00YVFz?=
 =?utf-8?B?VHZDTm5yUm9CSHQwOVhXUFNZc3JSdmNubEFNRWFPSE1KVjVTTGVvUFZuMjZs?=
 =?utf-8?B?eERKSHBrSHBOUmdiMTZxbW1BNzk0THowK1BPUjNGaThTNXRVcW51NFQreXRT?=
 =?utf-8?B?MEdGR1BpWGtEb1JrR2k3WDFMN1RpWVlmWHdPUkN2MWV5S1RNa1UwNUdXR1NF?=
 =?utf-8?B?bDNURGxpWHZTU3dqeFNPZUQrZXlsL0oyeFdOWlhNbVQ0dHc2UzN2RTk5VkxI?=
 =?utf-8?B?ZVI3T1pNZmdjSTQ3VTBPTXhIUHYzSnUxQ21GanRyS3dMWEoyMW8vak9HOUlP?=
 =?utf-8?B?ZlNnS1NjdjZVZkFrdDBLSk5VaFQ2MjZNY1kwblZ1Q3A3YXdObXoxTVJVeXNB?=
 =?utf-8?B?elpkNDFJWFFIWEErRHFFblU2Ky9NZzJZamptdlZuVkhYbXlkM29kNUxKeDZ5?=
 =?utf-8?B?aU9ZSGFPMDZQR2JOR0JpWWVhTU0wWDlkaFNRQ09oYnVNdlhxY3ArR2NkWjVp?=
 =?utf-8?B?WXlmSVR2NHFkY2FMbVJLZldtdkRQNEpLM1VpSi9MbS9EeU53clNCYUswMEp3?=
 =?utf-8?B?eHMxUnUxOWNCVG02bm5INnhUNStxQUZ0UGxtbVBxd1phN1pOMkVDSWs5NU4v?=
 =?utf-8?B?NElqOVVQTTF2TlNxbEpnRENtdzZjTitHK0R2VnVjbDlYQzR2T2ZjWjhVV2ky?=
 =?utf-8?B?WEJQN0IrMkk2V0MyUDRQblBLQ1dZS3V1QjV0SWNYcVhHMFk3c0Zoa1hVSlZa?=
 =?utf-8?B?SnprQVFqbU40SHcwU0M5UW41a2Z5MDZnU2p2YnFZYmFLV3BteFpzdnQ0T09S?=
 =?utf-8?B?VUJTeE1XMEp5S3ZDeDVUcjBibWZKVUEvdEo1ZEl1UWpraTNRVjFKU2IrV1hT?=
 =?utf-8?B?bit0bG4zZXMySnFpd20zNWVrYlFkQjFuMlRrMkpJQmpjMTBsUVE4dEdCNmtW?=
 =?utf-8?B?V1c0RDhSdEZ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <45CBFED652FFB2499FCA676A3E06E1A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9381
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6bddc3d8-885f-4043-57d4-08dd993398e2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTNycmd1NWFISVBGNVlnVW80eEVSVTYzQ0p6ZmY2a1piVS9kZzgzS1pYWjU2?=
 =?utf-8?B?emg3ZzVleXExakFvai9UMFZJb0M0UHFtbFRtcjh1MG1XTlJ1SjZQbU8yUmx2?=
 =?utf-8?B?OTVqb3Q4dzc5MGdSQ3FDR1RjcEtHUk5NTGYzT2JtbFpMNTRLejhpRm4xSWdV?=
 =?utf-8?B?bG81aFpJMkFoU3lncnJHNHhLLzVGN0Z1M0hLRXJOSnFZUmpuQXowVStkUDEy?=
 =?utf-8?B?RnVDTWZXZnlTR1hRN2NaRXFZNzZzbnpuVWNvZ1dNNG9zWklHcGZ5THZZYm9S?=
 =?utf-8?B?V3ZhbUgwRHExMElkT3RibUw3T2h1SnBWYVE1YllnMFFRMnNRSERzOEYvV245?=
 =?utf-8?B?WjBneFVhZXNTUWpSZSs0ZlhielY0eC8xYjVKYjFRejEwKzlWMDYyUG44NEta?=
 =?utf-8?B?ZGNCUWloc2FxakVFTW41dXdPRllPSGJ3K3ZKWTRacHZNVjNGV2tZaXM4aCtF?=
 =?utf-8?B?aTdZVng1a21WMUsxQUorYnhtWnVtV3p5ajgzRlFoYmsvd0pPL3lHcXdORmVF?=
 =?utf-8?B?N3pjbkpiRzh3V1lxN1ZKWHkycDBJRm0wd3NyVTQrckNKZ0RlUWdMaDFNSzYw?=
 =?utf-8?B?bW1CV1lLVHNpdDF3aUVKa2Yva3pWS3hwbmxsUjhJUTRRTjRRQ3hCYUNUMGdU?=
 =?utf-8?B?c3hyUEllTW5mU3dwMXBjd1hyZHJRMnA4NkdWM09JMnQvek9NOUVxMElhYjky?=
 =?utf-8?B?ZEEwMDhVSi9lbzlqOHBpRys4MStVTlRVNWZGVndkaGJ2ZzVXbkFwTWZRR1R4?=
 =?utf-8?B?ai9FN3lsL0dHS1NCNXppWHhHZ1dlY0l6eXdEQVQzV21UNmp2RS9KYkdLVDF1?=
 =?utf-8?B?SWJ2WUNOZWNUVmhKSUVCYlRjbmlTUWlMaXN0aCsweVcvcHlITXo0YkRadndF?=
 =?utf-8?B?L1pUMkwxOUd2R2lzYnhkVk5DOWpzZSsyaXBmWmc4NXdvMmZ1RkdEQXhpVUE3?=
 =?utf-8?B?SDhWT2RpNS9wY2NReFkvaldZODdqaW8yQVZKQm5JNlA2TFpQZ21mSEZzWGxW?=
 =?utf-8?B?SHZQUkJZUVNVMXZpVU5qc2ZrN2dFaCtQVWhFdS8vSFU4d0ZwZnRLV1IyOFNW?=
 =?utf-8?B?S05jM2NhSUd1RnlMSHBaNkMwZE5QUVZCYzFrM0V0cWw1Ny9vUmpPeTQxZVd5?=
 =?utf-8?B?akZQQmNIUjlMalpHbXpveWtSTUtlMm9FYW9ya05EckNZVzBXOVB0Zy9OanRI?=
 =?utf-8?B?Zm9FSHFaT3dqWkpxZEVySThvYzV2NkxiLytLMEZWYlhhb0tGcndGRlJRYXBB?=
 =?utf-8?B?VVQ1VXhPT3BuNk40a2VZTHF1bGM4dFdFRHk0MTFrRDI0RGs3b2JHN0hXVm9O?=
 =?utf-8?B?bm1JK0FVNFVSQWIxLytpTVg1SXd6aURodTY3R2JQZmlmeUdtTzVYallJK0dx?=
 =?utf-8?B?TkJlQjFYQWFJZ3pmK1Q4VWxlRStmT2hFRFlMSWFJZ3M3U2hJTFJLM2d3VER5?=
 =?utf-8?B?NWkzL3J2K29BZks0YTRTN0ZNQUZZS0NMSGhIREtFU2pTU1pQVDRwNEpxR1V0?=
 =?utf-8?B?S0dZVmpIRHFEV3VzYnJVSHVYMklxZnd0QUJ5dng4RjZZNHFqZklrV1h1Q1lo?=
 =?utf-8?B?K2NEY2M5L1BrNmlhNEVsSi9iQ21VMTU0TFJVam9LaW44NkJJSUdicC9pdmRs?=
 =?utf-8?B?SzdaOUhlWmZRRWdVTFAvZURiUFA3SHNjTnpsSGVIQ3g5QkpBQjVRN1p2dExP?=
 =?utf-8?B?NnZMbWhiU3h4K1NxV05DMlhkNVc3Zmh4aW8yaDJHL1V6dlZTOXNuSHEwemlz?=
 =?utf-8?B?VU1TSzFXeXhhMTVTYUxsSXB4K1VKdUpEMmZHbTZhQVlFUXNSYkRCQTAxSVlJ?=
 =?utf-8?B?alJOV3ZZSG5hNXQrTEVTbXROUGpPREVyUDRRdWI0M3ZUUUZDM3FMMGo0aXYz?=
 =?utf-8?B?OUdWOVYwUFU1OHNRb0VBSyt2UVRwMzZPR3paZE5renFVSGtIc1MyRU5YYmdi?=
 =?utf-8?B?aFlHUmYrYzdDK0gzeVJ0aHVqV2I4THgrZlpEUy9WN0JrNUJ0NXVKQ25rRnpy?=
 =?utf-8?B?QWRRZWlVWUxHZEkzNldsbVpXYkd0K0FrYUpnZGx2NU9wWXRiYnF4Z2NnblN3?=
 =?utf-8?Q?u2I+5d?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:22:16.9456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da9a3d3-6c64-400f-7ba6-08dd9933ac50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 13:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217104

T24gMTYgTWF5IDIwMjUsIGF0IDAzOjEwLCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBUaGUgcnVuLXB0ZXN0IHNjcmlwdCBpcyBjaGFuZ2VkIHRvIHVzZSAtLWJ1aWxkZGly
LiBUaGlzIGlzIGJlY2F1c2UNCj4gdXRpbC1saW51eCB1cHN0cmVhbSBkb2VzIG5vdCBoYXZlIG11
Y2ggcHJpb3JpdHkgb24gdGVzdGluZyB0aGUNCj4gLS11c2Utc3lzdGVtLWNvbW1hbmRzIG9wdGlv
bg0KDQpXZSBzcGVudCBhYm91dCBmaXZlIG1pbnV0ZXMgc3RhcmluZyBhdCB0aGlzIGluIHRoZSBw
YXRjaCByZXZpZXcgY2FsbCwgd29uZGVyaW5nIGhvdyBpdCB3b3VsZCB3b3JrIGFzIC0tYnVpbGRk
aXI9QFBURVNUX1BBVEhAIHBvaW50cyBhdCAvdXNyL2xpYi91dGlsLWxpbnV4L3B0ZXN0IGJ1dCB0
aGUgYmluYXJ5IHN5bWxpbmtzIGFyZSBpbiAvdXNyL2xpYi91dGlsLWxpbnV4L3B0ZXN0L2Jpbi4N
Cg0KQW5kIGluZGVlZCwgaXQgZG9lc27igJl0Og0KDQpTS0lQOiAgICAgICAgICAgIHN1OiBlbnZp
cm9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHN1IG5vdCBmb3VuZCkN
ClNLSVA6ICAgICAgICBzd2Fwb246IGJ5IGRldm5hbWUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAobWtzd2FwIG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICBzd2Fwb246IGZpeCBw
YWdlIHNpemUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobWtzd2FwIG5vdCBmb3Vu
ZCkNClNLSVA6ICAgICAgICBzd2Fwb246IGZpeCBzaWduYXR1cmUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAobWtzd2FwIG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICBzd2Fwb246IGJ5
IGxhYmVsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobWtzd2FwIG5vdCBm
b3VuZCkNClNLSVA6ICAgICAgICBzd2Fwb246IGJ5IHV1aWQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAobWtzd2FwIG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgICAgdWw6
IGJhc2ljIHRlc3RzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWwgbm90IGZv
dW5kKQ0KU0tJUDogICAgICAgICAgICB1bDogdWwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh1bCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgICB1dG1wOiBsYXN0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGxhc3Qgbm90IGZvdW5k
KQ0KU0tJUDogICAgICAgICAgdXRtcDogbGFzdCBpcHY2ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChsYXN0IG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgIHV0bXA6IGNpcmNs
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodXRtcGR1bXAgbm90IGZv
dW5kKQ0KU0tJUDogICAgICAgICAgdXRtcDogc3Vic2Vjb25kICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh1dG1wZHVtcCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgICB1dG1w
OiB0byBiaW5hcnkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHV0bXBkdW1w
IG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgIHV0bXA6IElQdjYgdG8gYmluYXJ5ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAodXRtcGR1bXAgbm90IGZvdW5kKQ0KU0tJUDogICAgICAg
ICAgdXRtcDogdG8gdGV4dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
dG1wZHVtcCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgICB1dG1wOiBJUHY2IHRvIHRleHQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHV0bXBkdW1wIG5vdCBmb3VuZCkNCg0KSSB0
aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIHN3aXRjaCBiYWNrIHRvIHVzaW5nIOKAlHN5c3RlbS1j
b21tYW5kcyBhbmQgZml4aW5nIHRoYXQgbGFzdCBmYWlsdXJlLg0KDQpSb3Nz

