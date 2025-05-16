Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E51C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:57:04 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.58])
 by mx.groups.io with SMTP id smtpd.web10.9610.1747389417506859037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QtFcMgXE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QtFcMgXE;
 spf=pass (domain: arm.com, ip: 40.107.103.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BRJvr9wWPvLjsws69fQtSZoPjdVpFFUZr1Ghhmv1042AI7jTDuIg9X6s67Q7ITa7xb8AnMat70XyAEv8USwE+4lEmz48tGfBofk/weWvfrb+T7yNd+li8kUp1A0jYlyALqAGQo5ed4HA7HCxtEZfIhxJ4yUcAxWozyP5DlqkV+DOiWeyWyt85Yk987CCrhEAbcyG2GMs37rmKTVKtkxwTK4Ks4Ji+tOoNsWp5ReVuNTEEgAunDXICa5JQ6kI4a2C94lbpOHNXXwSI2fnDKITkW7rajTfgii8XcrDr+84+TcKlMrcOaIIqECRfxRy9rLJzlDPUWxOaFlYzpEbw6YcCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Looj72xphOIIHZoqbsceu3sCr4IAngWXbMFvCnMyVg=;
 b=IofKrxGlYxdFlppjbeDCw+YhKrdsu38AMOrsRj85NMjBGC5sQaJlY0OEi2UK+Mv65RN9O3xVYRrU/OudTJf43Q6kX8XzuhWggPo53sYW1tTzHAfbp89QBvE9MZrHIWtTascXvmRJbPxnNluhSwtLrlLKeCDNTYnyDDhSh5ZjwTIucakiiwBkHhHo1JrfNFvaDvjw5Xjar/gfJYM5XXSQPs/IuE1Wzc5I9FA5nScebk3/jK22oy6uK5p/8IvYwomYWO3tttSk01u4sqeLd8uL5hK90KOPp1ZTctkbwLmiBi1wp9iZdT1z8TQP0I2sRPIAxFgFOhCbEKVfIYNRIJgKZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Looj72xphOIIHZoqbsceu3sCr4IAngWXbMFvCnMyVg=;
 b=QtFcMgXEkUlSPzaGaO3oc03316gSmc4wbZH7LkG8ni+ebEUae/cVHbYntYWacfcUYQhLAQrwphNOB3lkxoPHW40yY/z0apGXEeEYxvuFHGzU5aSbMZij/dubs6n5obkGmpoB49ev/6gEA094gl9pH/jpSNMVoDDHhQBOtk5p1p8=
Received: from AM0PR02CA0181.eurprd02.prod.outlook.com (2603:10a6:20b:28e::18)
 by DB9PR08MB6394.eurprd08.prod.outlook.com (2603:10a6:10:25b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 09:56:51 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::cd) by AM0PR02CA0181.outlook.office365.com
 (2603:10a6:20b:28e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Fri,
 16 May 2025 09:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 09:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qao8JkOkHJbho+ihFu5qoSH/CSP3L9cMRRJKDYsujKekKfAca5iZUmTGJTNpvP+yKhzLAAwIvLJEJV+vBqNuAaKudhcscneBLct7xWbBPsoiZBdQ+qfTc+ThGYfrMnW4DiDPMsRoao+e5VCA9mn10zzJXLEHfm2N08T8gNnQ9nDFJdcph8ROZDBT7tlcXFha0RWPz5i9YTbbfO1cwh34f97D9dQ1zqEBCyuF2lqhcm+RmKVoYT/+LQJFCUP3oVMKxZ6rNeZqLo6ntY3XzzTlINltMJkEE9mqlLO+ulA0oL4adet3z4Az77Vn+m1hkBp2aQ/UJ+dSFwW4fHdwvP8DDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Looj72xphOIIHZoqbsceu3sCr4IAngWXbMFvCnMyVg=;
 b=uL02ZJV/HIAjMZny3LD62HlTRq0yvvCWVKzEBj6ZcTQR2l4H+W3ojZwoT3LcaU3bHephaN4EVRRZs/GvTeCrsEIEgDMHbt94nGluhHuOKmQOJAab8n5nwWCEQq23xRuMY3u/zMHcAK0OT0Pl7vbANtuBtyHIjOF4QhabPUf+SmjhNxyi8QzUOa4//yFDsAhZ4w9wte+T4TC36jVccztpULGP0BDgESo5FyyEPv76rDg3UX1dLGveUNI+iF0TziLIikEdGcq09iGQ1pdMHq7K9+1LE4s+2oa3KQN5dWIbEOk6uUSzSpVcpq/fipNj4Kjs/BJDHNSghTDAWl6yfF5otA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Looj72xphOIIHZoqbsceu3sCr4IAngWXbMFvCnMyVg=;
 b=QtFcMgXEkUlSPzaGaO3oc03316gSmc4wbZH7LkG8ni+ebEUae/cVHbYntYWacfcUYQhLAQrwphNOB3lkxoPHW40yY/z0apGXEeEYxvuFHGzU5aSbMZij/dubs6n5obkGmpoB49ev/6gEA094gl9pH/jpSNMVoDDHhQBOtk5p1p8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9887.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 09:56:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 09:56:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: 
 AQHbxZpvlJUoeGPtlkKXCY6RguMiarPTqioAgAAHJoCAAADAAIAAA7+AgAAgT4CAADJVAIAADjiAgAAV7ICAAASsAIAA1QMA
Date: Fri, 16 May 2025 09:56:16 +0000
Message-ID: <A5AB0449-4EAE-422C-8314-758993EDA6E2@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
 <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
 <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
 <5979472F-B748-4ADE-B950-636574096C3B@arm.com>
 <CAMKF1sqAXCiaau0jfDo3OgoG=LFc96_czB0yC7JDsC4S85jJHA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqAXCiaau0jfDo3OgoG=LFc96_czB0yC7JDsC4S85jJHA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9887:EE_|AMS1EPF00000047:EE_|DB9PR08MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 492f9e53-2f0f-4dbc-f2fa-08dd945ffaf3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q1MwYlp3YWZqMzZsRitNZ2xHekY2blZHK0hnOCtleXBZNUcxYmJTTlB0TXNj?=
 =?utf-8?B?NGIvcjY4VnArQUlabGx3VUVCYzdqTldrZG5PVDA3TzJaRkN3WjBwcWpuOHAr?=
 =?utf-8?B?amlBQ0dIVCs3U3hCdWpteW5QanNSNFZKQkNzaHp6R2tjeVEzbzZzRWlBUkVO?=
 =?utf-8?B?bHhnS1I1c3ZxQUducVFNOVlWUERDbHVaOXFSeFdiTGt6SmhrdnducVl6YjRs?=
 =?utf-8?B?NGZTQS9XWmZIdE9LMWU0am1rTlFQVHl2MG1ya2lrRlJtZHJOYlBXTEdKSHpq?=
 =?utf-8?B?eE1aV1VLQzI2dDFVUGVoYm4xS09OMDZRcW1ndUxQSHRreGpUdmsxMXZMV2d0?=
 =?utf-8?B?a3dTb1d1ZWFCTncvMjlKc2Zham5TMXE2eVNHSElPUzhWM1NtcnQxUndkcW15?=
 =?utf-8?B?QURvaGY3dTVTZUpDV3NCWlBNcEgyN3JOQmF0cFMwTHUzcVQ1WGNiazdFVGlE?=
 =?utf-8?B?YnFTdVd6bTdybjVvak0zaTdmUFhVNG1SZUE5dGJLNjVSSmNSRlVDWmdPV21z?=
 =?utf-8?B?Y3Uray9aUnhDc1czS2xGYmhqMG9BbW9MRmEySEwrNHhtTlJPUS9TVEtZU204?=
 =?utf-8?B?azFiVWR3UWNVdHZ5aXAyazhOYjN6N3dnbmVTa2Q0d0R6SGQ5ay8zYkw3a0lX?=
 =?utf-8?B?SVpDN1A5amlPZGgvWm1xeGsyTGZQS1NaaGxQSjRwRzVVdVQwTWJIWjA4dWkz?=
 =?utf-8?B?T1FvUTNoNmFFdG43OEROQ3liV0lBdzFnaGRoMXZJV2lycENOOG0ya1lQa0lu?=
 =?utf-8?B?SEpHRjFjTW12TWFiNEFJZDI5WXROTFd5MnE2VlZBZHFtdEkxNktUb1YvcE5B?=
 =?utf-8?B?bG9zVzZzNHV3MmJ4U1BtZDlpb2VxVlA2Wlp2TUtBZ3dzS21KeEZ1d254NzQv?=
 =?utf-8?B?NGdNTktSK1FReVhETVJOQ3lGK1pYNlc3ZUxIRHQxdE9Yb0tjRktMWFk1WmhL?=
 =?utf-8?B?Tk9lODJ5eUNsUVdsbkRTdG1BY2JEYmRLN093eFBUL28xR0FTdGtQa2E3REVP?=
 =?utf-8?B?TmNOTzVzemNROWkzUUdGNHNoSFZHV1RibjRmdFVQRDZGWW1hRUkzQ3kvWWM3?=
 =?utf-8?B?L29XUzZDMjM0U25JMnQyN291YWRPd3lMNDVVY2FnS0tWK2tkWjBxM0NlbEds?=
 =?utf-8?B?YXNZNERJLzBoU0hTUWd4SUllY0J5dmZtVHIxR0RrckdoQzR6aE5MWTRKeFBi?=
 =?utf-8?B?cmp2Q1YvaFRWNDV5T05LMjBxZjdhckwxdklOVU5jMlhyRURuWGZ4MnFiRGxt?=
 =?utf-8?B?eTBZeXhkTElOU0tkVGJMTkFiaU1saG5oRnB1V2hBY0tZd3RIZFRMRHRtUXkw?=
 =?utf-8?B?bXB4bE5XYWRSZ3hZLzRSSnV4OVJjdlY3UndkSDQzL0tlYXNvc2VrUExvZ2wx?=
 =?utf-8?B?c2pUN2kxZlJpd1VGby9CWnhDSGVjR05BMWpGMlBGNnNyTkU2eDFaRHV6cVpk?=
 =?utf-8?B?eVQyWXR6NGpmL3RMOFJPeVZSd3VPK3ZQQjJiemZXcjluamhYUjFtZkJ0cVlN?=
 =?utf-8?B?UXRKZW92OUFGYk9zV05xNHpiT2RFV25ZVUpDbEpERVBhZEVmbi95RlE5ajRt?=
 =?utf-8?B?cndOOThHbnNqTlQzQlh5WStIS2tIZDFxUGpPNlhZWnhKbWJTWVdiQW5ER2Ns?=
 =?utf-8?B?SGppU0pPYU9OYkpSVEcvNnNpZmRhaGdxSCszdFNKYXZWQUFWcW5yRUw5N0k3?=
 =?utf-8?B?dGR0Nmw2VVVqaFZGV3FZdWwxekFkN0grMDZGb1k3dWMwaStXcnpGVWFMZHVT?=
 =?utf-8?B?YWFyQlJPN2lRcHZXMGV1YXF6US81WTQ2ZHFaWVpTaGhtYXdURGltRXZGYkNs?=
 =?utf-8?B?V2JFWVhOQmp1VUs2WElhM0VxdUZkaVBmWTNMbGJ3ZnQwWHpRT3V2ejE5cm8y?=
 =?utf-8?B?L005VzdtZklOdVRreWdLRnA0SDljSzJiUVk4WTQzYjFjV2x5N3FNV05TRkF4?=
 =?utf-8?B?WUF3cHQ5cDJmejV0SWxXekhvRjdVenlUamE4cUdRNi9Jc2ZBd2ptQXdFTDNh?=
 =?utf-8?Q?GguTm4XwCtt9FbWSDzcOzTtEKxHxFQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <655A1BCA1EFE464CAA6893FBAB7A8A37@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9887
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e60d9617-57d9-4c50-5dde-08dd945fe6a1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTRmR0xqbXlUWGZBa0RWU1FlV0g5OElXWHdVZUVpdk5ncmxQMitYbloxWW5l?=
 =?utf-8?B?YlI2MVJ6RFpwZk5uQW9xVXdJZHUzYkxxY0wvNFU4SkVaaVU1SVRQaWxXYUJH?=
 =?utf-8?B?cE5qMzAyTkFDdzZWTTFCNTI1OVZGQkNFSEIzYWMxdmVIdjI2T3lORUI4ME5X?=
 =?utf-8?B?ZWdTd0pjMVJWMG9XNGhWZGVNcDkyM2tsYnpmNm9JYUgzajdLZk93N2ZvNHhs?=
 =?utf-8?B?Qy90cUxnemh1SFV4QlNEWjJXL0w0TTNReTBhaWxjMEdqNHkvQ1BERmY5S29P?=
 =?utf-8?B?OXdFb2N2Rjc2ajJydmwxL2N5NnVtSEJhQ1FhNUNjaDFwQnhNbWFPR1FxT0NP?=
 =?utf-8?B?RVN2SUxTSE5qV1lCcXRQZHNTNCszbnFxamloMzZFdW1hNjc0ZkEwTXMvMFds?=
 =?utf-8?B?WWw5RmlDcUQzbmVGa3EvQ3ZaODVlRFZOQ1FYaTBDSWxRQnJIRExTbjVSNUxZ?=
 =?utf-8?B?Z2dSeEMrdXEyQ2kvbU5vaXRsRUtTUjVUUVFBdDg1TkxnTzhOSXBBMUE2RlFn?=
 =?utf-8?B?T1J1aFdyc2dYRjZxbEluakpIOUowdHFpV0RUc1BicmZCNUZsYVduVHpCNVVB?=
 =?utf-8?B?UXdXYzJnbVNvWm9oMEpIMHFTMHQrcDBnL0JRamlTN21SYXpFN2hYWS9sVnJv?=
 =?utf-8?B?bGJXSmlGeXRsRHlzUUJnZnAxZHFuSGxUb0FFMXBHWVFVZ3BqSGRlTjMyQzFX?=
 =?utf-8?B?MUduckZrbjk2UTV3L3FaTGNQV29BUWNaR1hPOHpUanhhVlRWd0d4THZianlk?=
 =?utf-8?B?eGVxTy9ZRUExWVFNRURscnpqcUVsMW5zN3ltQjlGMDhtQ3BFbE4yZXZ4bGtz?=
 =?utf-8?B?VWI5YUFhWS9CMnRnclJIR0Y2QURpL0VpMGZTQkpWWjNKV3hWVFNtYUpYVVVQ?=
 =?utf-8?B?Nm8zdUkwZm45U0h5d1dKS3pELzR2SVkzakY5SnIvMHZ3R1BrNC9DajJEaE8v?=
 =?utf-8?B?Z2hwY016UEFGZ0VuVnpZcUNOZFJ0T1ltT0I5QU9XRkNiNVZxR2swSTNPZnM1?=
 =?utf-8?B?QU9ObDdobXQ1d3VTYUx3R0Rrd3J0R1l2UzhwNFIyU2Exa3VqQ1NaYkFrQ1Rp?=
 =?utf-8?B?amRDSG4ycmtFY2xDQzk4N1Zia0ZXRFQwNnNUK1ZSNDArUnpiRkhGdWJyRXd5?=
 =?utf-8?B?THkxNngwakV6Y3RsK3dVc0tHS01jN0FmYWxPczZUTGhQZkpNd0kzTFhsUnJV?=
 =?utf-8?B?Uk1rbHRhMTB4OEswcFJjTmZiQ0FCL0ExZWJ0eGRLTWpENDNkV3JkQlJWSzJY?=
 =?utf-8?B?S3pJRG9FUjVMWVpvTGV3THA5L2tVbG9uclozQ3VYZ01Zbm11TVBvM1lkZkpL?=
 =?utf-8?B?UW1teW92U2luNWFiWUNBOUhpa3FDYnA5OEFuVTNqL29pd2hjaTYwOHBSa1BP?=
 =?utf-8?B?SllxeHFOd1d5aHp0STJaVGF1YkgySnVMd1FzUTIxYTdjOXptRmhFWjJlWXN4?=
 =?utf-8?B?eDE2WEtMeGNhWXVPdWcvVDJOUEI3bVo0QzYxQlZaSHVQQ2JlbG9WSm1KbEt6?=
 =?utf-8?B?NnJvN3BuanpWb2dWM3FOYnF2Z0g0OG1GVTc4dVVlbVJialZ5S0ZVeVkzS0dj?=
 =?utf-8?B?eVZoa3hyR3MxdDhJYlM3Vk9VbTBqTVJ2TVozaWlrMVZZQVdvbHl4bnIvODR5?=
 =?utf-8?B?VHVNaU9WUzNyZXZseTlkdTlkQzRBRDdIb3ZaUUVlVDZ2cVEzNlVYemJ4OVpk?=
 =?utf-8?B?TXEzU045cyt4YUVHaGpBVWVGMk5UK1BBOGYrWHM2dFJqS1kzSGdha0g0L3k4?=
 =?utf-8?B?YUsrMitoWUxJYkNvalkvZVpVa2NKZzVpdGZSa1hSaDlpK01lQURkSTZienFS?=
 =?utf-8?B?WXpXa1dPNWJvWjZnTzR4YzFHQk8zKzdTSUhUM0ZiSlZJZGQxN2NUZnlUN0FD?=
 =?utf-8?B?UFlhRTgvVjNjSTNUSWxOb0xuWW13Q3JzMm12cVBrNDBITzIxWHFUTzB1S1dM?=
 =?utf-8?B?S3l3KzVWRWJOT2F1Q0tCTjF1V2hRS3BWUDZ1S3JSQzlJa0VCaTd6MHRnTGpZ?=
 =?utf-8?B?RVYzYjJsUFpZQW1WdHFhVTdqL0NWK29VdVBkKzFwNVhoKytiTEl5blVvWldX?=
 =?utf-8?Q?GMEIMf?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(14060799003)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 09:56:50.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 492f9e53-2f0f-4dbc-f2fa-08dd945ffaf3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216736

T24gMTUgTWF5IDIwMjUsIGF0IDIyOjEzLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBTbyBpdCBkb2VzIHNlZW0gdG8gYWRkIDIwMHMgdG8gYnVpbGQgdGltZSBwZXJoYXBzIG1ha2Ug
aXQgYSBwYWNrYWdlY29uZmlnIA0KDQpEb2luZyBidWlsZHN0YXRzIGNvbXBhcmlzb25zIGlzIGxl
c3MgdGhhbiB0cml2aWFsLiBJIGp1c3QgcmVwbGljYXRlZCB0aGUgdGVzdCwgZW5zdXJpbmcgdGhh
dCB0aGVyZeKAmXMgbm8gbm9pc2UgY2F1c2VkIGJ5IG90aGVyIHJlY2lwZXMgYmVpbmcgYnVpbHQ6
DQoNCiAgY2xhbmctbmF0aXZlICAgICAgICAgICAgICAgICAgZG9fY29tcGlsZSAgICAgICA5LjNz
ICAgICsxLjIlICAgICA4MDYuMnMgLT4gODE1LjVzDQoNCknigJltIGZpbmUgd2l0aCBhZGRpbmcg
YSBQQUNLQUdFQ09ORklHIGJ1dCBJIHRoaW5rIGl0IHNob3VsZCBiZSBvbiBieSBkZWZhdWx0LiAg
SSBrbm93IHdl4oCZcmUgdHJ5aW5nIHRvIHJlZHVjZSB0aGUgY2xhbmcgYnVpbGQgdGltZSBidXQg
OXMgaXMgYmFzaWNhbGx5IG5vaXNlIGluIHRoaXMgY29udGV4dC4NCg0KUm9zcw==

