Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E4FCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:27:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.8])
 by mx.groups.io with SMTP id smtpd.web10.18879.1761222425721664529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NibxJ601;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NibxJ601;
 spf=pass (domain: arm.com, ip: 52.101.83.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fVi+7XH/uuqir84Uz6fAmdaeuDh393ShPuZ+zvX1yV5e8xy37RLPr8Zr+lKlChNBq1/9FPNPMBYrR7GQh+DAXFfKCc1CmYJyA8frb2Y8RGugqjcsRh1mHYlSftfKtQS/iP9TjWjqE5RqtWlewu7fUHg1AEf8pKqZylf2P+i5pHqC+PmXTcUyq+Y9Eu7FrMpDyJXqyrES3Ic4fxRyWpnrTaO4JEpCaemGI1ZzdohU9+6RsBAyXdxceB7xhSJWb7Mwm5tkMLSCpeYPu0nC3CjVOW9dvwq7u0xxsQoHAQ0D4mJqM8Ci90MXmCCRBjP/syRddkRRxDBv667pD/xUdEIMhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt3WBxrkB3njZobp0LZo5yiJd7tnbUzZcLRhdvfCMP0=;
 b=DeBFalWvSJih/RSXh4tXf6vKcdwh9Y54drhHfvgFxnitgMcDN4Zi93y8sK2S5yU5p9DXcCuFXK8zkaA9lrx2aWBlIb7wsW4NPIoKOXZVpAAa/tC2TGliLQgCw1mBZ/lYgElwcSRtc9u75MWvOz9X9pgDHUs8NI8lgfVHakwOsmmWj+CEQgkGNHT/8I3OwV3SeY6p1xrlZAnSQc3WxOukqycpEFrh+lTsDTlqrSkNzpIv6ikf+y1NmbtrYTp06msmgPtL0NiwBC1sSi+dfvBmRf3+s40G806Kju7X7DLgZjXlO1vKwWgP0/2mK/fXRDuD5a9efZKBC8SCpoIAp6VHmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt3WBxrkB3njZobp0LZo5yiJd7tnbUzZcLRhdvfCMP0=;
 b=NibxJ601SPZjDzQTVKvgi5kVn7ckSgzRkhfUl7OqfsOExN9cCB00dM7nKcWVhnhASbvraC7S6R0WdGUGP5yjzRh0WBkfSzC4cZF5JL6/mgaWJzIBIoXft/mPXqxa3UxnjW/z1aCSBGsIrADzCPXcF/Pa/3Z/t5XdfA9BZAzslMg=
Received: from PR1P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::15)
 by AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:27:02 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cb:cafe::56) by PR1P264CA0039.outlook.office365.com
 (2603:10a6:102:2cb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 12:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.0 via
 Frontend Transport; Thu, 23 Oct 2025 12:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4jpw3CYzo2OHISA5gYnvq50ZW5FHs+c4gcL54vl58m22vQPy5F2oc6cqRxLOLZG3vnxcKvYvBaJItsdBOVxVxLXzxJK3MGBwh4nkXSXhIHaBn9rltlTKoY0h889L5VJqBm1tnFTmGpquTxeyUNh3VbgcUHZxZdy0LOb8p6LBmK+nWBYQ2uAthNt8Ks2n7QQfCIjSJP8BRDcN2ZHjpGuy3vylw8MYb7ObFekMgtzK6/9MWBdGR5NqRfQ0lyXoE8P8+jL56yKQoBKYhyWLDlTrKys1YJZneSC0ousElS05FwApMDcPPTMdQ0LqvB6jGmr3Ywf8z+RA3lT6IgtCPtHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt3WBxrkB3njZobp0LZo5yiJd7tnbUzZcLRhdvfCMP0=;
 b=Vbr5vpJUWkmsl3fADrgC1jm8C/dpkK+6d3yzDVIsGfueDOXEj06rZa4uH5V3v94UuKu8b/yXnYQuAWSgzk2iwoVRl72ux18c88eqN0bprYZ1R0fwtR1IGmRWfVyrpelj8Zo3iuEkYLYI2HkmyQ4UTO4+eMuRwzKcBHwBxqxNoWNtHnq6vKvWDKXzGJO25ZqP4fbR1aRyDsWAPos/8tm7os1OWsSbDpp82qhCyXzZCNnN0xIqmn3fy4FJImeOrmLue7HRf9AOXwmzIeN0Aiut/GzRKJsPz/Wq+XFwaWWJ9D3b+sKhrqdzLDclNv9ychoDdw22bRZgWEDTesjTEdB/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt3WBxrkB3njZobp0LZo5yiJd7tnbUzZcLRhdvfCMP0=;
 b=NibxJ601SPZjDzQTVKvgi5kVn7ckSgzRkhfUl7OqfsOExN9cCB00dM7nKcWVhnhASbvraC7S6R0WdGUGP5yjzRh0WBkfSzC4cZF5JL6/mgaWJzIBIoXft/mPXqxa3UxnjW/z1aCSBGsIrADzCPXcF/Pa/3Z/t5XdfA9BZAzslMg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB11348.eurprd08.prod.outlook.com (2603:10a6:150:2a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:26:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:26:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: serial-getty@.service: allow device to
 fast fail if it does not exist
Thread-Topic: [OE-core] [PATCH] systemd: serial-getty@.service: allow device
 to fast fail if it does not exist
Thread-Index: AQHcQX365WcBbN4ai0GadIegvE3k57TPrXoA
Date: Thu, 23 Oct 2025 12:26:29 +0000
Message-ID: <41E90E41-92BD-4007-948A-41C7D0DBDE62@arm.com>
References: <20251020045650.3251326-1-hongxu.jia@windriver.com>
In-Reply-To: <20251020045650.3251326-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB11348:EE_|AM4PEPF00025F98:EE_|AM9PR08MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 623a4126-0be1-48d7-ef0f-08de122f77ad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S2h2Si9hRmpJUks4QlkwdGFCV0liN1MyZVVPc3pEa01henpSYjNBK0t5TnZo?=
 =?utf-8?B?eTdxcmtTVkNuZjJRd3lMcmhzSHBEZlAwSHMwSVJtZFhLVlVrd3RINVk5d0Rw?=
 =?utf-8?B?OFNLbEhDZ1NQNFdacE15djJDcEdRZDh2MWZYMHl5Y2Q4TFRFNHlMejNNQlJU?=
 =?utf-8?B?RGJFSGFZaHBQWHFBT3FEc1FDNTdrcUFTWjBHUGgzc0tCWWFjYkRzMUdaNU50?=
 =?utf-8?B?YWpUMnRKNTFmY1RtV25Cc040Rk1EeGd4bDY4STZQVU5sN0N2cEdqUTVNcE1u?=
 =?utf-8?B?aXhCZXR1R3dxZ3ZLa1UwdCtGVzl5MHU1SXVrakFmc3NNWnVJejU2U1lNeUlz?=
 =?utf-8?B?Y29zTHpzNE41QU90SzhpcStmMGNiYVpDUVdjNitoekFnMDVIZGFqcHpHMm5B?=
 =?utf-8?B?bUJZN2RtN1I3aWFoZEExZWlnK3VIc3NWOVNnTTZmemJ6T1BtQkNscEJOU2o0?=
 =?utf-8?B?NHdLZmMrakdFQjhsMFdwMHhzY0Mrakl5RGs4THFvanNYUWxaSFFWYjUwOFhO?=
 =?utf-8?B?WDdFMFdnVk4rV2JKQ1ZTRkdXUm1vZnMvbTNWZWVNZmFYOHVJQkZHWmNZejQ2?=
 =?utf-8?B?N3NlbFJzTmVEdjlKVmxOczhnL2NyN1NOOW1SWHZsdFduSXFsbUF0ZitndkpP?=
 =?utf-8?B?TFloZnV5V3dtSjIxTmF2VVI1U0JkUXEzR1g4c2RHSGswcGZlaEMrdklTOUto?=
 =?utf-8?B?bGJFWjJ5bE0rYUFZK09OamsycW8weFZxdWFWMGRzcGZyaWNCN3NYTC9Qek9r?=
 =?utf-8?B?dW1TbkZ6ZUFGa0FRVWJTN3ZCU2RLOENJa25CUko4N1FybS9XTzUzd0pKUGhJ?=
 =?utf-8?B?cUlYYWFUWUNRYVU3SjJsK2JCeHdhbTFIUmZmUXltbGowdlhwcnBPOW9qMUFS?=
 =?utf-8?B?a2IxdUZPNzR2TU1XNC9yRzFYYit3YW9CMlZyNjhrcXFqM2poNUYydUFJdnBQ?=
 =?utf-8?B?anBQV2VYeXlkTEtTNHljVXkzemJOQUZCbVZnZ0hnK2tXTUQ2N1hIYmQybkJW?=
 =?utf-8?B?OEYxaDdsWkxUai9nRDJUWnZ6cE5Cb1JjemVaeVZWQi9aMUVlMzY4VVYrOWQw?=
 =?utf-8?B?VTFPeGd0ZmRnOXV6cVFHWlg5QjBveDg1QVdmcVMxbjYrMFpDcERVaTg5NXpF?=
 =?utf-8?B?bDcxcmtDVzhaMDc4V0VOL0E0M3lwL2ZndjQzTEVIM2htWklOU1lyR05TdDhW?=
 =?utf-8?B?NE1IdmhGTU95ZktoY2paQTBjM1pRNW0rTWNqNk1oanE5aUJSd1NaRVRuWlZI?=
 =?utf-8?B?QksyTkFvTEdzMXkwUytOQUdYWGw0TkQ0NFFRVEdQdEpsN0dmbHBNODdPU2sv?=
 =?utf-8?B?c2JVNFZjb28vaFc3cE1mUjBVVEJHd3IzQnU3VFJhMGVIa2VKUDRyTXUvOXVr?=
 =?utf-8?B?aCt3d1A5MVVOeTVDQUY0RnAwMGFjY2lrVktiK2dBNENlK0duME5UZkF2eWVP?=
 =?utf-8?B?TkdpSjN5b2NtYmdkTXU0R1kwdzJsSnVmL2pjOUpFT1ZnRjlLSS8xMVN2ajhO?=
 =?utf-8?B?eEFVRWJJT01ZQTNqY0UrV2pWcTJLR0c2M3U3WElYUlREWk9HeWZrTkZFRGlW?=
 =?utf-8?B?cmdQeldKWUhDanJJdmZNaVdXQ0FBTGNBdVJNVzVmL2kyRnhDTVI1Y2FpWlBX?=
 =?utf-8?B?ckpDVDBzcHNTazBqVFpWOGRJaGhTeUVPWm4wYUtRYTVoMHdMTnRLU2N1UEJP?=
 =?utf-8?B?bE9heUtuOXMrVGtYZ0ZHL0RrTzkzams5bWd4TXBBYVhPWkQxWjNoUUxsdWR3?=
 =?utf-8?B?cXByZmN6QXlnWVkzeGNKMTBBME5oS0JpOFhuWFJ5Q2tMSk04cjJhVzBUN01X?=
 =?utf-8?B?SGNJaU9LWkFCNmtwSEwyUUpEd2VxdlR2aHp4bjJqdjBNUVcyQVR1SGRhZkxs?=
 =?utf-8?B?MXBEdlFPNCttak0vR3ZER3EvUXc4VXdmK1p6KzRmS1lPVHZ0QVRoMlBPazF1?=
 =?utf-8?B?WlNNZVZ2bjVuZlNQUUE3anBEZklmUkxyYnVPT1pEUjg0UTdLdDZMbmxIK1hC?=
 =?utf-8?B?V3pCQ0wvb0dBNC9DN3JoaUtPRjNMUlJVU0VacEdxZXVBODF5alF5dVV6Z3oz?=
 =?utf-8?Q?Y1gFMb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C17E6675C6F8049B0B9477006F3C63C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11348
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a195592d-3b49-466c-15cc-08de122f647d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|35042699022|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tyt4elNSekNkdEs3VVRXdTd0Q0FTdlByclZVekRpVVpINGZ5cFVER3RNMU50?=
 =?utf-8?B?QTlaOVVDTkhleFRkQithS1dKMDJHVDgvYXhOZ1hMdGZZb21ucXBCSDNVaVhN?=
 =?utf-8?B?Y2p5Ull4VGZFVHpqaEhxYW9Hb2VrS2QzWGQzUDFyMzczM1kwenFDRmpTZWtR?=
 =?utf-8?B?bVBjcjBpRmdDRnZteTA3RkdOampSR245QUZRc0xmQnc5UXd1TVhyQXJjQith?=
 =?utf-8?B?N3RTY2kxcmZJTDNsSzdiOWF6VHFJS2tldXd4ejlKYUsxemFoQmoxUXdpQTZP?=
 =?utf-8?B?ZDYrVXlScUxmTlpKZ3hUNHhTSlhHZkpCWWN0dWJKMXh3S3dONGpudDNDbHox?=
 =?utf-8?B?akJkRXpEMGc0QWxJK3QzeWRreTBtUGlhZmtPSnN6eUhhYWs3bWxmZVA2LzNh?=
 =?utf-8?B?MTZITVBKZ25yZFZnWklGaEx3SWVHdDFxYkx1NzcrdE1aTTZDUWVIZllOcEZt?=
 =?utf-8?B?N2ZrWG15VW1YSjJ5N3NpOTd5RzVncVdjU2s3ZXdIcmdUY2xLanl6UFNCNW1X?=
 =?utf-8?B?YmI5UFVhYVB3ZzhBb0lGdVZTMHdjYXN5Q0xTK01LeHU3dkZZSnhzN0tQcDdP?=
 =?utf-8?B?K2RrQ3hZaldWUEg0alJGZGxrTnVrOUdvUDlINUp0UnFmbW5sdUo4S05qcldo?=
 =?utf-8?B?WVBZT3ljZml1bWRYNllUNHVLYUM1bTVFR0tnTHk4UmdrSXNQcmFDQjdCREFk?=
 =?utf-8?B?a1pWZXcwOXBOODA5Qjl2K2xPdDFIWEtkYkwwcjloaEN4RUxzVURBa0tvZUs4?=
 =?utf-8?B?ZlZSN2trQzJqK3p1N1ZzUWVPZzFqdkFkMGlkZkZXU1ZhUitvcjhoL2lIT090?=
 =?utf-8?B?T2syVlRaNGgzUmpIMVZLVzBNSjdrM1ZiVGo4VWhBNGtScjNRU2V5TEV3UTN0?=
 =?utf-8?B?aGpBMHgycWUxbFd4WEs3MmgrVDdRNFRwdm1EdTBJK3ppTGppSnJvbmpkWjZQ?=
 =?utf-8?B?dm0xS0gyYWhvcWZReXlncWEzSDFzZ3JpdWZlc3NlM3BTbVhsNXJEZForQzZB?=
 =?utf-8?B?L2FPUHNxc3RUTGtpTk0vdTQ0RUFmVWIvcWJzQlFwaFUwSjhPNGIybEdicjZQ?=
 =?utf-8?B?N0xNbFcyV3N2WncrK1M0MGlFSW0zWmRwRG5FM3c4ODdkNGJLRG9oV1phMDZl?=
 =?utf-8?B?SG5WZnJRc2JBZExybytCOXJzelM1NGI1M0dXUm84Qjlnb21wL2tKRTJndE80?=
 =?utf-8?B?MlVPQ0J5b0UrQWNnSnE0VEk4L1duYUtXODJpRHR2YTM5L0FuQ3dBS1JXdVh0?=
 =?utf-8?B?ZHBBR1huc1VSckxMeGxDdDA5RlRxSzhTMG4ydW1jS2pIQkk5ZERUbVVBdUNm?=
 =?utf-8?B?Y3lQbkV6RC9wWEczWXdoODhzTGVtaUhBL1Q3cGxCV1RVZXV0RTNTVUhMQ1JB?=
 =?utf-8?B?bEYxY01NOUE3bENxVERtNGR4NTZNd041VEZSMTFFVHlNdFM5YWVwNWJrL2Iz?=
 =?utf-8?B?OHRPR3pjWGZOb3FwVXcwMlFMZ2xHS0Z0S0tKVnFoTHcyU3lDck5lYzc4cUxo?=
 =?utf-8?B?QS9nMGlBNnd1NkZOZ1I2ZUNTd1VuZU02QTFaSnNPVzh6WDM2bm1hNzE4SjB0?=
 =?utf-8?B?MU1Ja2hadUxvczVwVm92T1Y3Zk5iOHU4SEFRMURGajlWMXhBMUwzYStsRFhp?=
 =?utf-8?B?K3pudG5hMGNZTkRYekRaZGFUQ2V5emU2b3Q1eWVCTURSbjM2SHJYMldHNEk3?=
 =?utf-8?B?N2JLQkNUeDd0dVYzeUswMUVWYkdYQS8vRmJhUGxoMGhXaWRoT0grOGdsOUoz?=
 =?utf-8?B?R0hZbVpNcGhYVWJLOVVZMEtCWFRPWW9NOEVtQzd6cWdrbERnOXlSRVlLM3Fx?=
 =?utf-8?B?N3ZITXpzSmRpb05tS3JwU1Q2TUM2Tmh0dE85TXVtcVNPVEJET2d5cy9DZGpy?=
 =?utf-8?B?QWtJVUhFZVRGVWp5cmZzUzF1K3pVRXZFb1dESG5BL3h4ZzRGRDUxM0NTWktn?=
 =?utf-8?B?SkZSbXBEdUtqOTE4NUllckZod2VEZ3kxcTMzeENJZG9FN3c2czhwd3dzRXdD?=
 =?utf-8?B?R2hHQlJDWk9IZFpRMXRxc1lFVVN4Mjl1YVdLV1VUSldtUGpNNkovMTE0OEpH?=
 =?utf-8?B?eG45S043Vm10bkRSdkZhUHZNamp4VlhuOUhNYnMyZ3IzeUdzOFZOdTlCRDd4?=
 =?utf-8?Q?GmLM=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:27:01.3445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623a4126-0be1-48d7-ef0f-08de122f77ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225253

T24gMjAgT2N0IDIwMjUsIGF0IDA1OjU2LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBEdWUgdG8gc2VyaWFsLWdldHR5QC5zZXJ2aWNlIGlzIGRlbGV0ZWQgYW5k
IHVzZSBleGlzdGluZyB1bml0DQo+IGZpbGVzIGluIHN5c3RlbWQgWzFdLCBwb3J0IGEgcGF0Y2gg
ZnJvbSBzeXN0ZW1kLXNlcmlhbGdldHR5IFsyXQ0KPiBhbmQgYXBwbHkgaXQgdG8gc3lzdGVtZCB0
byBhbGxvdyBkZXZpY2UgdG8gZmFzdCBmYWlsIGlmIGl0IGRvZXMNCj4gbm90IGV4aXN0DQoNCldl
IGRpc2N1c3NlZCB0aGlzIG9uIHRoZSBwYXRjaCByZXZpZXcgY2FsbCB0aGlzIG1vcm5pbmcgYW5k
IGNvbmNsdWRlZCB0aGF0IHVwc3RyZWFtcyBwb3NpdGlvbiBpcyByZWFzb25hYmxlOiBzb21lIHNl
cmlhbCBkZXZpY2VzIGRvIG5vdCBhcHBlYXIgaW5zdGFudGx5LCBzbyBhIHRpbWVvdXQgaXMgdXNl
ZnVsLg0KDQpTZXJpYWwgY29uc29sZXMgcmVtYWluIHNvbWV3aGF0IGFubm95aW5nLCBidXQgdGhl
IGFuc3dlciBoZXJlIGlzIHRvIHR5cGljYWxseSB1c2UgdGhlIGdldHR5IGdlbmVyYXRvciAod2hp
Y2ggaXMgZGVmYXVsdCkgYW5kIHNldCBTRVJJQUxfQ09OU09MRVMgdG8gc29tZXRoaW5nIGFjY3Vy
YXRlLg0KDQpXaGF0IHdhcyB0aGUgdXNlIGNhc2UgdGhhdCB0cmlnZ2VyZWQgdGhpcz8gVGhlcmUg
X2lzXyBhIGtub3duIHByb2JsZW0gd2l0aCBnZW5lcmljYXJtNjQgd2hlcmUgU0VSSUFMX0NPTlNP
TEVTIGlzIHNldCB0byBhIG51bWJlciBvZiBwb3RlbnRpYWwgY29uc29sZXMgZm9yIHN5c3Zpbml0
IHdoaWNoIGludGVyYWN0cyBiYWRseSB3aXRoIHN5c3RlbWTigJlzIGdldHR5IGdlbmVyYXRvci4g
IFdlIGNvdWxkIHNldCBTRVJJQUxfQ09OU09MRVMgaW4gZ2VuZXJpY2FybTY0LmNvbmYgYmFzZWQg
b24gdGhlIHZhbHVlIG9mIFZJUlRVQUwtUlVOVElNRV9pbml0X21hbmFnZXIuICjigJzigJ0gaWYg
c3lzdGVtZCBlbHNlIOKApikgSeKAmW0gdW5kZWNpZGVkIG9uIHdoZXRoZXIgdGhhdOKAmXMgYSBu
ZWF0IHdvcmthcm91bmQsIG9yIGEgaG9ycmlibGUgaGFjayAob3IgYm90aCkuDQoNClJvc3M=

