Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC85D358D8
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 08:07:05 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10537.1769674003750687801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 00:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=NznbxeuR;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.49, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDSNNCWefSoVnSx0WUv4v5flNC8gOJAKCiw/9wxxSXNoCJaRdaZI+HjrsrIzhdkrWB0e+5pAni7xXaGLO5MBgLd/fSyGhlU25n/y1GugI10hGk95I2nT1MctiUahaT1Th4Z3nWZ18r+gdXRjQz/Cj1rYyW1M/Vgc7vLGY7rx9S0m4PmaWoCZse7oVbStcNlCQcatEdVCCG+RH0oFfnsfiffDb8gxtP3oQon0WktvtYk5PsTCHq9xfO5cBYpyqB1Y8aB7lU3uwGLVf5rQzIiwYmDtgvrlfYqANiz/olK+cNN/PDXl1e4M3xLE+HLDwM53qWUEAkeoGJwD78VsdOB/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0du5kekKI3xguNmaUu/0F6k0yc8U0p+K8GxTJb5H8dg=;
 b=j4hdjxqjjrJ8ba5uL/zEG39P4QCIt6UT4WtM7/oTG7qmIBDzdDQbY3s9bKMyiB/Mef4hWZ9VTFgsV+VPMvYO+K5rryMmAYtycodyKu/ZxOuD4rm59FDZe1RNErCerPW1pxwe9GClCzxod+MgOW5yvxplYqMI/A+nFuLje32U5tIDjKwP8yEPss0FItp0rKM5oZxyVIHItIjHlPcOHfz5zkya4w8PJDD6y5pczHaAaQOMePYcfhcZuwPQ3dSuC1oSeoo1/0cWoeO/Igri8hqrS05otRPqsFx5RXzTseoSkm45PnJLtvfz70HzyCIQ9qgmoE4EAM7/cydRZv8hibhr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0du5kekKI3xguNmaUu/0F6k0yc8U0p+K8GxTJb5H8dg=;
 b=NznbxeuRYIZflvLHABFZ4hsy8M1qRtc+M4vJsQ9zk6G2YAHF22rpyHUwx3JT4wdANQhMOiA7+85tUfwjB97/1fb+/3RYIlNtlQEBpiIJaMLT206EnjvsKtYyEugjMS1M5wFy3i37sQ4bKZm51mQJN0VMg7mAyPwmIWMVAnjHuqvYk3wfBSXj3tfwrE8xhbpaujM95AmvxkmMCxIOUvtD0kk6+HFvqwXtZtrj1e8XZU8JOrJx5OJG0vi7t+qX4c63YVE4JPNxKRSNOovK5IrGvH9GV+nhnGtrPM7J7mHv0qgrx+7HCG2HjBlF+zrQxlbsmEh5VCdSvt2urb16dRo74g==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS3PR01MB10024.jpnprd01.prod.outlook.com
 (2603:1096:604:1df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:06:39 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:06:39 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Topic: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Index: AQHcjsDC1KJcyp2YnEKoPdFnjY+xYLVnzUOAgAD9h1A=
Date: Thu, 29 Jan 2026 08:06:39 +0000
Message-ID: 
 <TYWPR01MB118611A95E3F90AB1A23E2F1DDC9EA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
 <20260126123844.1052-5-wangmy@fujitsu.com>
 <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
In-Reply-To: <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YTQ1ZGJiYmEtODU5Zi00OGRiLTg1MzctYzhhNDJjZWM4?=
 =?utf-8?B?MTg0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDEtMjlUMDc6NTE6NTlaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS3PR01MB10024:EE_
x-ms-office365-filtering-correlation-id: b0c6f285-708c-44f8-e411-08de5f0d54cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|1580799027|14052099004|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N3VOSWNvWmdBV3FlNGZKaUNVNU1Vamh2T1hVL3hEbUtvdUVFRTlmZnRmVTRk?=
 =?utf-8?B?bXhXNzdNNEhtNmpxTUlqZDZuV045aEJOa1ZKcCtJejhqaUZwOWJKVzVpN0py?=
 =?utf-8?B?NHVOT1dKdW1aWDNjTVBhSTZ0M0tRczdhMGV1WXlnRVpOaHRlWXZZWEkvbGVl?=
 =?utf-8?B?OXZvSnUwTlRycXh5MHVBM09sTUxsRC9nemdJM2MybDJMU3VWaGZOVE4xekRQ?=
 =?utf-8?B?ajQ0ZTliRnZwaEVJNHUyaDgyeW1wVGlueUdBWGlaeW4rVzhQL1FPSXpFdEd5?=
 =?utf-8?B?cEM5alIrTkZRQlZhTXIvWXVzVUQ0Z0t5b0lWRkxkMFp1NUFMaEFxNTJ4WTZy?=
 =?utf-8?B?a2pUeEMxYnJOcUJWV2FEbTdQVDZ6QjMrbGNwRmlYeHorY1RiT1ZMbG9kS2d5?=
 =?utf-8?B?Y1hEbURqZngxc2RQR1FyWktnazVuQXJSQkZmTUtiYkRlM0FhSDlpZTM3K1VN?=
 =?utf-8?B?VUdpYWhZbDJIR2hOdGxXSVhGOU5kaEQ1UnU4VWk0MGhqMHBwS3hIMHV6Zk9U?=
 =?utf-8?B?eXRHT0tBalI5WTR5L1NST1YyWlA5WXVXTTB0MVJZN2huQnZVQ1ROOWtkWTdX?=
 =?utf-8?B?WVBjTm9WTlJ2VmdjNGVlNmNJbHFiNXVlLzZ4bGpORkR0M1pKKzBMZjlMVHBl?=
 =?utf-8?B?WUNBUmNSWTRpSXUvOFhXV0lUUHd3TkhZa0x3TUJ1L1Y4UFpaSmNCdnhHWTNa?=
 =?utf-8?B?UUoxNEo1WWFDRTRIcGIzWFRLQUhSU1ZRNXBlbHVab2xmbEtiVXhLMjVoa205?=
 =?utf-8?B?a1huUXFqblYzd0ZKa3dGY2J2Y2hUOWVDQ3lIQlMzSlhGRjNDaXJoejB5UlJj?=
 =?utf-8?B?VWRORk94czhuc1VzS0g5S3MwWUVDckRTOVZTOCtIT0hHVjM0TFlKMlI1ckVi?=
 =?utf-8?B?TFlrejRWQXRzU1ZvZ1hpZjlpTFBLM1IwaERXNkV1SlZGRUVVVWcwc2JEOWhD?=
 =?utf-8?B?QUM4Ti83eFFQMVh4N2MvSDJxUXhiUzJ2bUcvNC9tZkxXUXJBNElPZVNYOFNX?=
 =?utf-8?B?L1NzYW9ReCs2Vjl0VnI4eG0yTkVEYmJXL2FKMHFlQkpJTnJ2aXNEbFRFR1hU?=
 =?utf-8?B?RkVlbUtjeCs1RHBLaENGVXF4UlhlVHV2aTNIRmNTK29aYnNpQWRNMGtkQWZ4?=
 =?utf-8?B?OE5rMk0yTmF0WDYzQk1KRnlMcThqdlp6eER5aG9XeW1GTlB4UDJHVUU5SDEr?=
 =?utf-8?B?T3hiV2RodFBXNUpOT0lOZFVXakJveDdFZXlTeEwxWW1XZjJDbmF6RG91eDNy?=
 =?utf-8?B?M254eVJwWkQwODRrSVI1R25LeWViTU1HaGsySDVvVXNZZjQ0dk1RMTZQZk9j?=
 =?utf-8?B?bFh2YnhVSmwxUTd0MUhiRU5zQVdkSDBtVnBZcTBoOXExZ2JIYVI2bENveGxu?=
 =?utf-8?B?aXJIWUxxam1kQTdRdDRNektkRTBCd1RtWTIzTzB1WEhmam8wWmpiL1AydXBU?=
 =?utf-8?B?RU1iRWR6LzFzb1pPa2VnUERlSi94bGpqeGtFSHNEUTdrMXkzL1Z0ZktKR3ZJ?=
 =?utf-8?B?Z2tubEFEKzNvTlNraUtRdU9hajZEL25lRUk0SmxmYnpVclRGbndCM0FTb1RD?=
 =?utf-8?B?TGJ3bmdnNXpFVGtKbDgwTmdFZ3g5Z1dLYk1OaG5rdk5tWFNuM3UvaWRUcWM3?=
 =?utf-8?B?cGsyY2pibXNZUFhjSWtmVnNJdFFiclBNL05ESkNmSXNaOThmZUVLRTBaT3hY?=
 =?utf-8?B?VHdlVHh1d01WR29GYko2R3YvK2d2MmhjUTY4dFJuVFdyZEN5NkMzTU5rT2Q0?=
 =?utf-8?B?UTU2ODhTNjB3K2dEdlNSdEJISWxXbjVSaCswcGZjN3I1c29IblF3a01Wb0pH?=
 =?utf-8?B?NUNPZGRlcGQ4OSt0aVNYMGoyS1kyckJuSUwyUzNrOGlTWE1GcVBTTDdXcm1V?=
 =?utf-8?B?VlJpVVJjelJxcVRsb3VuaXFJc244U05GZmx5WllSRWRndzJyWDh2emduQUpr?=
 =?utf-8?B?VUFNOXgrTHMxanA0QkJhZ1RTWWtBMHJvSkxpMW92VWdpT01Ha1lzZjMzakdn?=
 =?utf-8?B?RTZTb0FXTTdCSG1URE5waTA1RzJRMGhiRzRnQldnVXJXYmM3TXZlSjVGblVh?=
 =?utf-8?B?MG9yWm5xUG9xY25YbmJjUk83endUeUo4RlVGSDU1UWd4eVh1dGl5SUorbXox?=
 =?utf-8?B?engyejlQcGRyYWkrdjRZNXIrYS9CTWppTG4vdWNjdzA1R2xxMWpuU3BSQVJ2?=
 =?utf-8?B?VlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(1580799027)(14052099004)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VlhYUE5JNDNDSFNPYlpWWUo4THpIOGlpejJteURIVkxzV2JycE5HOSt1UVYz?=
 =?utf-8?B?Yk5TaDRPWXhoNXB0RkRRa09DeDlZNUNVMjIxOHhQUGg4N0RRaE9NV3h1VWFB?=
 =?utf-8?B?Qk5GdFAzekxBRnNRYURzcEIyV2pva3VjTHA5K1R2NEJCR0o5YnF4Q2RJSm5N?=
 =?utf-8?B?WWh6Q0E0SGRianFhMmllbXVGOHJNbHNZRm9mWXg4WUlrZUR5OXVYazkxVnJ5?=
 =?utf-8?B?bmt4U0ZlWXlmZE5sWjJlUWFFRmJwMVJpMXNOanFTUW9HU1VrdUwyQkpkVzIv?=
 =?utf-8?B?QUJGUlBsTTRiQi8zVnVBeWs4cXcxTlc4NEkxM2RIZUl3encxOWx6WW1lSkRi?=
 =?utf-8?B?VWowS1dpOGlYU1J6Z2hmdHhUZktUTkJKcWlXSzJpZkpNMnJNSFl0WnpCdVJG?=
 =?utf-8?B?K3Q3U2h5cjJ2VmFaQW8rVnBrNVV3K0FZMUZYV3d1c1hmODBWQ3lrOXgvTm5k?=
 =?utf-8?B?dWVuQTFLcVV0dmxZbU9uWWkzWENIc01ZUXZ6bExCMzRZeWtGc1Q3MjRFa2l6?=
 =?utf-8?B?WkNxOVhHY1lhTzdkUUNzU1VLVUU2Q2hQM2FVcnB6L1JkN0VMOUIvVHJXbXF0?=
 =?utf-8?B?aDgwYmNaVXIvMmJrd3hqdjRjcndCYXZWTm1LeVV0RGcyYXUxSjdSTXVRejI2?=
 =?utf-8?B?cFlZYUJmdi9IWElBWE1RUTR3bXhwRUVLRWRvQkZyc25EZ2wrS205bTlYbWpC?=
 =?utf-8?B?SW16Ri84MXpobFdQTDUwQ0NpVDlhUzQwUFZEdVo2cWx3R1VOVUs0Yko2OXNG?=
 =?utf-8?B?ZXVkeHVvOGxUTDRXY2w2YVY3TnJpMEhRUVhjVkZCOE15MGNZZkttOWF6N1lL?=
 =?utf-8?B?QnlsekVTSXdIbTNpTDlZS296RDZWUnFGaDI0dXV0bEJnTXNteEVlbzNGODli?=
 =?utf-8?B?VUlpYmpRM1RBa2NPVno5MTdkVklLOUN4anRoRU16bVIyeWZFUUdMODQrRW15?=
 =?utf-8?B?VnJ2djR1TVFDc25GZUN6bXFTUWxvVkJtSW5UK3lzOUpyYlhlQ2tlaitrdFNp?=
 =?utf-8?B?MU9FZkJjZzhOM2tKTU5sMVVTOVhsVUdXUUdMS3pxZS9PSTIrOWNQY0tmS3Vt?=
 =?utf-8?B?bUNPK0pXUnJweXg0QU1VYVM0NTlYUE9lbGpQSmw3QUhLQUI4YXZuekVSTFRn?=
 =?utf-8?B?ZXAxaXBiODBqUzFSSHpXSFl3NDdLTHFzK2hiVlVKQmNWaUZsWlBoWE01V0dm?=
 =?utf-8?B?TGZ6QWUzZk1tMzF2ejZGakhKcWxlaGhrNWcvbHZ2aFFjMHYvajhtdEQyZHdE?=
 =?utf-8?B?QUFaUkxNODZIbXhCclgya2hRY3NEQUZtTWh5RlAyaytXenNCYlRQVGJaRWJq?=
 =?utf-8?B?YW1XbjllWVFkUjVNeDcybWRIem0rYlFaMkRYekpoQ2JDTjZTL2I4bHpHUmQ0?=
 =?utf-8?B?clpOZWFIUWZTWWhiZjNmcVJaelZBV2dMeEplQ1VHeEdESk1uZVR1ZFE5V2Zr?=
 =?utf-8?B?am1VdWlIUWNOUGhkdlhscUFsTU1NQjM4WGptZDh3Vmg3M0RCVVJuTER0NVg1?=
 =?utf-8?B?VUpKWGlSb3RXQ0VZWDEyaTQxdUcvWmtPblFaT0lxQzBIZENhODlJbU5TcW10?=
 =?utf-8?B?R2FsTW1pNFFPb2tmNXNabkRoc08xVVBIMmg4ODZqd2twQ3A4VWxIRVZGWDB0?=
 =?utf-8?B?OENwMmtVVXBpcXpWbTZOSkF1ZU9DNVNMSjZWM0prZitKWHNMUExQSnFOUE5z?=
 =?utf-8?B?ZldzeHNqYk9xb3BEd1dTUDJNby9GK3hKU2FNcWNaL3hFQ25YMGYvbUFpKzRp?=
 =?utf-8?B?K09nL1QxVDFxblo5a1FlV2FxWS9yODAyS3plYlV4YjFiVzNSK0JYVjJZVEQz?=
 =?utf-8?B?ODE3SFlaV1ppMGhnM09hNVhseUNaS0IvRWZlY0dRdjFiN1QyTFlCOGozSGRs?=
 =?utf-8?B?VmRta21kcnhuVkd0bnRNVGFkRUJxTE9ha2MwUFFBcTNqdFBOVWQzUlVIcGFM?=
 =?utf-8?B?WHUyaVZTcFE4OG56ZmorMENiUlNYaVBtMXZlVWJKa1RsNk5zNEdHRm1mRUps?=
 =?utf-8?B?blhXbHd5K0wzVTV6aVRtNDZjZG1MZTgxZnZieitWQnRxUWdTdmtycnFsUytn?=
 =?utf-8?B?RVk3eEdCNERrTEFiMHdHS2ZVRXRyV281Q2ZaeTl6WGNJM205eUNQUUdHVFEr?=
 =?utf-8?B?cGFmaG5zTUc5NU14L3B6dXF4cFBodDNSbzBmd21VbndTVUF4WlF6UjUyVlVw?=
 =?utf-8?B?Q1daZDhNWTc5emkvdzdMTGxLOVpad0haNlc3dUh2RTRsR2QwL25xZC82VGpo?=
 =?utf-8?B?TERDdW92cHdCOWVQVmlramhqOGpTTndUTjB1YUphajYxc21jUC81bFhUSjJC?=
 =?utf-8?Q?Nh6aQNuhJwlnfnCnxi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c6f285-708c-44f8-e411-08de5f0d54cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 08:06:39.4942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIPPZERKhvjeaOH5csX1szIRoIexoepHB+MAtrPUZJRHWMvAKFjnTy6kJ/fsRTbsOPthOEH2LtrCRrtObHx2wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230123

VGhlIGZhaWx1cmUgb2NjdXJzIGluIHRoZSB0ZXN0X3BrZ2luZm9fdG9fbWV0YWRhdGF0ZXN0IHdp
dGggdGhlIGZvbGxvd2luZyBlcnJvcjoNCkZBSUxFRCB0ZXN0cy90ZXN0X21ldGFkYXRhLnB5Ojp0
ZXN0X3BrZ2luZm9fdG9fbWV0YWRhdGEgLSBhc3NlcnQgWygnTWV0YWRhdGEtVi4uLndpbjMyIicp
LCAuLi5dID09IFsoJ01ldGFkYXRhLVYuLi53aW4zMiInKSwgLi4uXQ0KQXQgaW5kZXggMyBkaWZm
OiAoJ1JlcXVpcmVzLURpc3QnLCAncGlwQCBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvYXJj
aGl2ZS8xLjMuMS56aXAnKSANCiAgICAgICAgICAgICAgICE9ICgnUmVxdWlyZXMtRGlzdCcsICdw
aXAgQCBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvYXJjaGl2ZS8xLjMuMS56aXAnKQ0KUm9v
dCBjYXVzZSBhbmFseXNpczoNClRoZSBpc3N1ZSB3YXMgaW50cm9kdWNlZCBpbiB3aGVlbCB2ZXJz
aW9uIDAuNDYuMywgd2hlcmUgdGhlIHVwc3RyZWFtIG1haW50YWluZXJzIG1vZGlmaWVkIHRoZSB0
ZXN0IGV4cGVjdGF0aW9ucyBpbiB0ZXN0cy90ZXN0X21ldGFkYXRhLnB5LiBTcGVjaWZpY2FsbHks
IHRoZXkgY2hhbmdlZCB0aGUgZXhwZWN0ZWQgQHN5bWJvbCBzcGFjaW5nIGZvcm1hdDoNClVwc3Ry
ZWFtIGNoYW5nZSAoaW4gd2hlZWwgMC40Ni4zKToNCi0gICAgICAoIlJlcXVpcmVzLURpc3QiLCAi
cGlwQCBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvYXJjaGl2ZS8xLjMuMS56aXAiKSwNCisg
ICAgICAoIlJlcXVpcmVzLURpc3QiLCAicGlwIEAgaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGlw
L2FyY2hpdmUvMS4zLjEuemlwIiksDQoNCi0gICAgICAoIlJlcXVpcmVzLURpc3QiLCAnZm9vQCBo
dHRwOi8vaG9zdC9mb28uemlwIDsgc3lzX3BsYXRmb3JtID09ICJ3aW4zMiInKSwNCisgICAgICAo
IlJlcXVpcmVzLURpc3QiLCAnZm9vIEAgaHR0cDovL2hvc3QvZm9vLnppcCA7IHN5c19wbGF0Zm9y
bSA9PSAid2luMzIiJyksDQoNCi0gICAgICAoIlJlcXVpcmVzLURpc3QiLCAnYmFyQCBodHRwOi8v
aG9zdC9iYXIuemlwIDsgZXh0cmEgPT0gImV4dHJhIicpLA0KKyAgICAgICgiUmVxdWlyZXMtRGlz
dCIsICdiYXIgQCBodHRwOi8vaG9zdC9iYXIuemlwIDsgZXh0cmEgPT0gImV4dHJhIicpLA0KDQpI
b3dldmVyLCB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIGluIHdoZWVsL21ldGFkYXRhLnB5c3Rp
bGwgcHJvZHVjZXMgdGhlIG9sZCBmb3JtYXQgKHBpcEAgaHR0cHM6Ly8uLi4pLCBjcmVhdGluZyBh
IG1pc21hdGNoIGJldHdlZW4gdGVzdCBleHBlY3RhdGlvbnMgYW5kIGNvZGUgYmVoYXZpb3IuDQpU
aGUgY29uZmxpY3Q6DQpUZXN0IGV4cGVjdHM6ICJwaXAgQCBodHRwczovLy4uLiIoc3BhY2UgYmVm
b3JlIEApDQpDb2RlIHByb2R1Y2VzOiAicGlwQCBodHRwczovLy4uLiIoc3BhY2UgYWZ0ZXIgQCkN
Cg0KV2hpbGUgd2UgY291bGQgc2ltcGx5IHJldmVydCB0aGUgdGVzdCBmaWxlIHRvIG1hdGNoIHRo
ZSBpbXBsZW1lbnRhdGlvbiwgdGhpcyB3b3VsZCBudWxsaWZ5IHRoZSB1cHN0cmVhbSBjaGFuZ2Ug
d2l0aG91dCB1bmRlcnN0YW5kaW5nIGl0cyBwdXJwb3NlLiBUaGUgdXBzdHJlYW0gY29tbWl0IG1l
c3NhZ2UgaW5kaWNhdGVzICJGaXhlZCB0ZXN0IGZhaWx1cmVzIGR1ZSB0byBtZXRhZGF0YSBub3Jt
YWxpemF0aW9uIGNoYW5nZXMsIiBzdWdnZXN0aW5nIHRoaXMgY2hhbmdlIHdhcyBpbnRlbnRpb25h
bC4NCg0KSSBoYXZlIGFscmVhZHkgcmVwb3J0ZWQgdGhpcyBpbmNvbnNpc3RlbmN5IHRvIHRoZSB3
aGVlbCB1cHN0cmVhbSB0ZWFtDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRT
VSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56
aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04
NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlA
ZnVqaXRzdS5jb20NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRo
aWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4g
U2VudDogVGh1cnNkYXksIEphbnVhcnkgMjksIDIwMjYgMTI6NDUgQU0NCj4gVG86IFdhbmcsIE1p
bmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IDE2LzE3XSBweXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDYuMSAtPiAwLjQ2LjMNCj4gDQo+IE9u
IE1vbiBKYW4gMjYsIDIwMjYgYXQgMTozOCBQTSBDRVQsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0
c3UuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWpp
dHN1LmNvbT4NCj4gPiAtLS0NCj4gDQo+IEhpIFdhbmcsDQo+IA0KPiBJdCBsb29rcyBsaWtlIHdl
IGFsc28gaGF2ZSBhIGZhaWxpbmcgcHRlc3Qgd2l0aCB0aGlzIG9uZS4gSSdtIG5vdCBzdXJlIHdo
eSBpZCBkaWRuJ3QNCj4gc2hvdyBvbiBteSBwcmV2aW91cyBidWlsZHMsIGVpdGhlciBpdCBpcyBs
aW5rZWQgd2l0aCBvdGhlciBjb21taXRzIG9yIGl0J3MgYSBiaXQNCj4gaW50ZXJtaXR0ZW50Lg0K
PiANCj4gRmFpbGVkIHB0ZXN0czoNCj4geydweXRob24zLXdoZWVsJzogWyd0ZXN0cy90ZXN0X21l
dGFkYXRhLnB5OnRlc3RfcGtnaW5mb190b19tZXRhZGF0YSddfQ0KPiANCj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNTYvYnVpbGRzLzEw
MDQNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvNjEvYnVpbGRzLzI5NjMNCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0N
Cj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

