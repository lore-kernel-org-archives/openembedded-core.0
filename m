Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F3ECF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:35:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web10.11622.1727177740667909295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AI+cOOSJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AI+cOOSJ;
 spf=pass (domain: arm.com, ip: 40.107.22.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TV9Ol7iOhK5Y0I1V87GgUqOimJc56Vo65ywrB2ljTn03bRbNvUoto474WsTBJi2XZPKcxL7VSrOGFX0/1hR5dsFTX86rh2mFTwrrVBQ4Kcx3j8mKYLCH8pCfI2ojo2TNqzE66WXj6K/xydoPcidag3GXUpqbSfNPWpMxHXBEvK6eD+vixGias4GgcKyebp/jwlagDmAUuixiiwF0XHMGXv6zQwJ+kVGj/7Fw9Sk4Er27EFfTNJiA5+yGW542t/GpxEq2sukAvI1vMIsYL8AZSMvMhsIVGOy8VMLYkPdDXq5MQlFBk8+ZN86lXgvYIch8v8RLxOaPWTmUw0qKCjlDWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixaypd+oTVaK6FA6ANmIZ7hefwIsSpTIUJYfy9wsqs8=;
 b=s9io4bvNcBqplHOFxdzKJTJKL71KNAKMWLW8oyYpRZT1lmIq/OxBD5Pjv8wyd68CMj5jVaLwfuaNUjU3vZOHSbtKoBIoznlLI4629G1EDnK+I5R4u5KvvtOFnpku0oIvp4/VVaIuY2dbS49gPITDMx6dMwiN+NlisTz0MecM47be/O9c9ZHPZ00bEgMgjOBkUQFoanuIocsjLFCOuI5dnPEH+BSpPT8aU0y28giSZ3WoNktdcyqE+Ri6zjB5LMO59tFweW8hqDIuzbWllwJgTBX1zyjx01mgQ9BetR80PbfUYGZogw28qfPgq59IOqOYFWBa4Fa7ly/dRcemnhKHMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixaypd+oTVaK6FA6ANmIZ7hefwIsSpTIUJYfy9wsqs8=;
 b=AI+cOOSJS5AKnEG8ICIeVVkGqvV/FI20GAX6nSlFWyE6sJ+BOUzaHOdbyuO7ho8i+XtaKo6LZmy4BPSYajW9dBwYkk6JaT/av1vNhqQhfjuwpyOcRSHXdjO+u/cklajzYuR8iDCM7gR6KEz03jLoJMKPF+jwQrKjsUrOae2q5fQ=
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by AS8PR08MB9503.eurprd08.prod.outlook.com (2603:10a6:20b:61d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Tue, 24 Sep
 2024 11:35:30 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4c) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 11:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 11:35:29 +0000
Received: ("Tessian outbound 3e266b55d80f:v465"); Tue, 24 Sep 2024 11:35:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a96e0d6afae06e6d
X-TessianGatewayMetadata: GoqAUIzN40VSih1fvYdPRh0AzdKZ7LDayoAeZjCIxiYpENnYJF7cjCnhlcAl/msTSxmZ/62idJ4Z/NBBShVcXV/dmZ79toRoLUDnFvfer90KpJczqRfG0y6roW6Bco5ZO28WZxJFFtYXJKCHY+bKeUbpQb35hEbIl4cQ1nswioQ=
X-CR-MTA-TID: 64aa7808
Received: from L715c679daa8d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1BD5CA42-43DE-4FD7-9EAB-BB8482DD687E.1;
	Tue, 24 Sep 2024 11:35:22 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L715c679daa8d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 11:35:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDSIJiI1dBkf10yhZVsGlmu/qDepLUayFC4gRqAEBsDFRcIhZqaIC2HaocdRBWow4SASKcnf/e5HoVxBC4sJPimDIsJs80PYtDsacSm89ibIfuA6C9jHT2ZGGo9dsI4RfHbnV3x1OMRZtZnQ2/gcwEHT22AaB9cG4IHf1m5qDPgy1gJ/awSxTL441E0Q9snoHB6UZcKZBqo5/Wltp0RKByC81j13Tg1GoUfG0ubarxL6jLh2Jy8LBdrPIdfH99Ybd2aIoCrpuZd0YA/vROBCX3F3Q2itG9Lv/76yY7Ipk1XwYXbhwI4/Ulli4paZY6hlY/aQY3sX0t1GSLG+9gMwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixaypd+oTVaK6FA6ANmIZ7hefwIsSpTIUJYfy9wsqs8=;
 b=k0Av4Hl14QamxK282/gYaUdswlysasnU76PzoQsNqRaeRGAlyHqde/brylUgomVP5623XNypFfB9ODg4w6rKTH1S0VYd0PSE5x7vJ5SYMwCqsXmFMqyAtENcq39pTP6pgSL3MAJ5mrMaEb550bkik/3dqjnUvoZJGXHJFeAm5ODl5444yAVr1prTHmrMHDbEPQyEi+surWe8FmijkBweE5Eb5PaYYcSTmPjHXSg7FcYUcHqxoeg5R6VCb7lPK3r82cukw+/wp9ZJOAQ6yFfQFQ9+CA7/z5MphBCvmtHOk8rDikxODO/qyhQI2LrTtW+YPoaBPwtlG5DLRI3AzSReWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixaypd+oTVaK6FA6ANmIZ7hefwIsSpTIUJYfy9wsqs8=;
 b=AI+cOOSJS5AKnEG8ICIeVVkGqvV/FI20GAX6nSlFWyE6sJ+BOUzaHOdbyuO7ho8i+XtaKo6LZmy4BPSYajW9dBwYkk6JaT/av1vNhqQhfjuwpyOcRSHXdjO+u/cklajzYuR8iDCM7gR6KEz03jLoJMKPF+jwQrKjsUrOae2q5fQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8073.eurprd08.prod.outlook.com (2603:10a6:150:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.10; Tue, 24 Sep
 2024 11:35:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 11:35:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jdmason@kudzu.us" <jdmason@kudzu.us>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Topic: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Index: AQHbC4zEDtlpgzcUO0e4or6oBIYGZbJm1ICA
Date: Tue, 24 Sep 2024 11:35:15 +0000
Message-ID: <984F8D25-7B5A-4071-B020-FBF267575ACC@arm.com>
References: <20240920184135.789227-1-jdmason@kudzu.us>
In-Reply-To: <20240920184135.789227-1-jdmason@kudzu.us>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8073:EE_|DB1PEPF000509E4:EE_|AS8PR08MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fe4620-449e-437b-bdc9-08dcdc8cfe26
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?czdFMXlENjhISVNXNnVjOENVbktkK2xlbWVXL3pCdHh5bXFtYmVUa2c1SEp2?=
 =?utf-8?B?bW9LVlFsR0RLQTIrR1lWeHpzYkZXL1czRTF6YmRQdE5qUzY3cDlqd2h5NlBP?=
 =?utf-8?B?QyszTHZSMXJhZVpMcHQxY0JwZDJRZWs0VUJrK0Nkc2IvRWhEcHIvenkzVXIz?=
 =?utf-8?B?a3FXallCcCs3VXdZYnVnckZyMmZjaGRwdUlpcHJVK2M5M0czeExvZEZFd09h?=
 =?utf-8?B?NnZvQUZLSmo1aUFCbHVJQVl5SHg0NzAzTzhUaDlwWHNraFFoSnp4REpvQTJz?=
 =?utf-8?B?VUprUGZuelNpUnR1RENQT29INy81ZkxNNGVBOUpPLytTNHhoRm5vZHVRYzM2?=
 =?utf-8?B?NnhPS1IvV3Z2SXlDTzZhK2MwK2Q1Um1sZkFVZFp4R1B1Z2lrUXRoaC9qb0s5?=
 =?utf-8?B?MVN1cjJBSThBbnJydzE4TnB1TnJlaFB0VmVPWnVJNEpDTXJyUUJBcDRMeUMy?=
 =?utf-8?B?Vmg4SmY1NkpkOFgrVTk5TDAzSXBSczhMLzNGZXhpUmRFalRzWE9EYzZPdXBr?=
 =?utf-8?B?ZGVOUDNjSW90RnFYeXd2SGNxNDdpMkp1d3BIN0JleDVoWmRnT2FoZzJ3dGV2?=
 =?utf-8?B?Nmt6SDJWUDVoSjVGWTU2QjMxL2tHMUVHNzdJWmd4SVlnRE1FQ21RRlI3UGxG?=
 =?utf-8?B?ZnBrU2d1UHBNRW9rQjFlbnJQWU5IVHdiTlkzMG5jUjV3UzM2UHE3bGIrUTdm?=
 =?utf-8?B?ZHQyNlptNTYvR2xIditnb2JFRGVYZy9zR0t6NkwvcVA2THhxNGcwdXB6Y0dp?=
 =?utf-8?B?WDFxQVRJMEZ3ZUlZUGN1YjQ0SE41TzNnTlQ5SXZnSWZKQzFEeFpZZ1AzZ2wr?=
 =?utf-8?B?dUttMlJqQmFCTGtlaVcxRVkyMFY5MGoyakdWNlBlWjdxUHJKMkp5VENuTExJ?=
 =?utf-8?B?VkVrT3lwQVEvdnRiY1N1RFJqQ0xSeDdhbjN0YWtNa0UwNEFVdUxWZnlVdjRu?=
 =?utf-8?B?NVdoTFdKV2ZBU0xiZlVWYUlEc2dzWGg4SzdqT3BGUGlLRTBaUU1UNkF3UE92?=
 =?utf-8?B?V3NpTjNnWlkyb1Y0WHRpTFFFWmc4SkZmeEFBZ0tGZTZzMmRIaFlmYU5HOEhr?=
 =?utf-8?B?ZTZZY2JyTGRiSmQrUjRKTlRCRXMwWXF0S0ZQRzE1SFdpVmFVOWJ4OXdhZSts?=
 =?utf-8?B?OE1aZWZKbHFhVE9KSlpKMUdRVFB0NHZyWENtcXN5Tm9pQ2hIbXpxekFQWjB2?=
 =?utf-8?B?d09XSEV5UEN1dnhMSiszR2hUNzJLSGhhUjMwVy9zWjVtUGRvV0dTbDhmNWta?=
 =?utf-8?B?eW8yeFlLQmhmSzdrTHRBcFpWakN0d1RrWE5UOE5VQm1VZUd2SEIxa04zNEZ4?=
 =?utf-8?B?M2lrY3o4MWxTb1UraTR1UHZoTkVoMzVWNXV4UlFhMkVubUo2ZTNVc21UbGtZ?=
 =?utf-8?B?Z1U4cFpxWWJHVEJ3cUNJZU5aVE90REZSVmNtWmpFM3lvalR5Ky9QQVk1YTdP?=
 =?utf-8?B?a25mMTI0VFFha0RVVzd0cDBQekxCSzJoVVB4Z1UxWHlZZVBpR2JqS1QzTEVP?=
 =?utf-8?B?Nmc4UUs5akgvZjJYeGFpT1lXVTR2T1VjVyt6WkRXMTY4VERzVE5aVUt3eUpL?=
 =?utf-8?B?MXYyQTdXWkZxNnBiQnM4MHhLUE5ZWnNWZGJiVWxoUm5VZnJ4Wm1pNUNVdE5K?=
 =?utf-8?B?R2JtV3NoWGduYWRwbXVDRmc1Z0o1cVFQQ3hZNThicGMrKzVEdnZBSUVaVHBo?=
 =?utf-8?B?MU5Ud1dJaDduUnNUWEgyMWhwY3R4elA3YU9KMTRGZ05qUWhrZ2dXcm56Ykt6?=
 =?utf-8?B?VEMramc3dk9EM0Z3WFdGcDRMTDArY3E0TjJqNEtFbDAraUpxTERJMjRQem5G?=
 =?utf-8?B?VGVya0o2NEhCMms1NWVFR0FrSUovQWdsQkNvaklzNTB4aUNWak1mbUhUSjIr?=
 =?utf-8?B?TnR4cVZnb3B3VFBvS3B4STQydDJ0OU5QbjVxbkkxM2ptUmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADF19C3D40683D48BBA49597C0730D3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8073
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1ee65c0-fa6b-412a-ee8a-08dcdc8cf5ae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEN2R1YySmdJeFNTQXN6UXl0Z3Fib3pkOFBmRlM4NmF0QmVDYWpYTWpkS3Q0?=
 =?utf-8?B?elBxY3JqMkl1Q3NvYyszSWdQZ1NQUU1KTDQ3bElXdXo0dTI1eUY2MGdNbUNI?=
 =?utf-8?B?ZjQvUnM3SDZ2QnBnMW9CWXd5TEdibGRPZDdzNlc5azhHTUlVL0E3UC9xbjky?=
 =?utf-8?B?MXBmMUx4YjF1RHlMSWFENHNac2tZWS9lcW5ESmsvWlo2RnhpV0FPVDRVckZ0?=
 =?utf-8?B?WTh5NnJ6TkxFcVh1TnRUM3lTa1BrYjVCK2RMSTZiaC9LVU1zcTJQYkdldDY5?=
 =?utf-8?B?azBiMy9GWVMwUUhDNjZYVjdhaXFjc2prK1VoUGhyVURrL3pNQ2xNUlR1ekZG?=
 =?utf-8?B?L3BmWGdyMERXdnpyVDAyeTdhaVdBT3REWTdPZkIxSW1GemJFY1g5UXRKU2Zx?=
 =?utf-8?B?cmJTcFBKMmo1c1ZZY0VQUjg2RkhZV2tLVmdKZDNRMGRuNjE5M095QU9hb3ZF?=
 =?utf-8?B?SXVGWTFyY3pHcFFxdFdnMVA2MFlIZG1YTFdJcGxMbEMyOUJ1ZmFQM2lENmxD?=
 =?utf-8?B?UVJFQkJyMmprRktkc2NkSUxkYmdoNTlIeVZQRm5NR096Z1dkWFZmWCtmVmN3?=
 =?utf-8?B?YVd2MGZ1eXhZYWd5WlNCMC9nRkRDUHFjcWdNaXY3MUpXQmxlakZjQlI1endD?=
 =?utf-8?B?RTNxQ2VvUFl0ZitFWVJ1YmxIbkUzOWJJYTVrd0kyT3ZsT2RqWWZSSC9pUmpu?=
 =?utf-8?B?S3VYakVRQmNQRnhSK3ZlZW9ZN3VkdzJVdXZxN0MzdytmcWpFSkRxRWpudmk0?=
 =?utf-8?B?WndBMnJUK2VpWFZGOVAvNEVoUUo2dFF6aDEvdTZGZDk4MXZwMk1hWFFxM1Rk?=
 =?utf-8?B?VU1Hek52MlA0T25mVFpsRFJlY3djYzh3N3NzWnBRS1NMcjBXa3d5MStBTkNt?=
 =?utf-8?B?VHhBaHNvY3lsYTU2RXpqR1ZUSllob0ZHZ2hzNk12NEJTckE2am5sZVVKKzhL?=
 =?utf-8?B?cGpvS2VNWkVqQmp5bUlQeEo3WXc5cjkxYlZMWGVpakpEb3BOS3pPVTRpT1Fa?=
 =?utf-8?B?RnU1Rk5xbVZ3Z3AzY2VzdUY3Wmo1V0tSdVdYelZkbUYxOWJaZ0daY3pGY1Rp?=
 =?utf-8?B?bTNJT0h2SmR3THE2dmR6aTRBdVV1ajZqeWtvNGZ0U3VjNWtBd2toVzY5TmpZ?=
 =?utf-8?B?Q2lUTko3ZXJRYi91Z2lpcXpNcys5czVYSU5Yc2NoVkgwczBlcjlZSVJFZ3JT?=
 =?utf-8?B?NFBleklwRDY2bUljTENvM0xQaEpGNlpwTTNJU0pDSFBBQ29KRFM4NjdROHY0?=
 =?utf-8?B?N2EzNERVNUVIRHFFV3huMGNYZHB1VTVEeVZyRXd1TnVJUnpiM3lOK3JLN0Nj?=
 =?utf-8?B?T3VzWWs1TTgveHNTZXdOWU1aT2JCSTBudmhNYXFlZ2xXODhzdStqU0hYU21K?=
 =?utf-8?B?VUpKTlhhMUFKSkk5Zi93MlhGMFc2TE0ydjZWNWFBMmwxNVJZZ2d6VUhxeE81?=
 =?utf-8?B?aklKUFdiOEtVRm1zandXTEpaamZXMmN1T3VCbnZnOUdoeWhZQmJFZ284MXBM?=
 =?utf-8?B?RDJLaERiR09PRm5oNHc2dkptdDdocVV3YlF3aVlTS1ZCYTkyZHl5SThZRG1p?=
 =?utf-8?B?aHhWMU5BWmxkazBTRkhPVmdyZzQwdm1HSWQ1UFdlMEpOQjEzaGJVSkRlbHA5?=
 =?utf-8?B?cTgyUVlRalhFWjJoZFZ5U25CVEVoVmxiU0d3eURuT0U4NU5HMjlyTS9GMU0r?=
 =?utf-8?B?SytERncrZUdnbnZrM054RGJhNHAyeVlTSlVnODZTNnpycHphZDNwOTNXR0pu?=
 =?utf-8?B?QWF4Z1c1Z2h1a3F3MG9vOUtmYkpSdW1IZjNSd3VPdHdCR05mYUpvYVNWelFB?=
 =?utf-8?B?WGdORHNuWDIxMk1oQ0pKLzhtZUk1OXdZZXo0RGtMbDlQZElNVCtwVzhVUDBV?=
 =?utf-8?Q?oe5ZvZWfWV9xk?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:35:29.6783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fe4620-449e-437b-bdc9-08dcdc8cfe26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204848

DQoNCj4gT24gMjAgU2VwIDIwMjQsIGF0IDE5OjQxLCBKb24gTWFzb24gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGpkbWFzb249a3VkenUudXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiAtLS0gYS9zY3JpcHRzL2xpYi93aWMvY2FubmVkLXdrcy9ta2VmaWRpc2sud2tz
DQo+ICsrKyBiL3NjcmlwdHMvbGliL3dpYy9jYW5uZWQtd2tzL21rZWZpZGlzay53a3MNCj4gQEAg
LTgsNCArOCw0IEBAIHBhcnQgLyAtLXNvdXJjZSByb290ZnMgLS1vbmRpc2sgc2RhIC0tZnN0eXBl
PWV4dDQgLS1sYWJlbCBwbGF0Zm9ybSAtLWFsaWduIDEwMjQNCj4gDQo+IHBhcnQgc3dhcCAtLW9u
ZGlzayBzZGEgLS1zaXplIDQ0IC0tbGFiZWwgc3dhcDEgLS1mc3R5cGU9c3dhcA0KPiANCj4gLWJv
b3Rsb2FkZXIgLS1wdGFibGUgZ3B0IC0tdGltZW91dD01IC0tYXBwZW5kPSJyb290ZnN0eXBlPWV4
dDQgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIg0KPiArYm9vdGxvYWRlciAtLXB0
YWJsZSBncHQgLS10aW1lb3V0PTUgLS1hcHBlbmQ9InJvb3Rmc3R5cGU9ZXh0NCBjb25zb2xlPSR7
S0VSTkVMX0NPTlNPTEV9IGNvbnNvbGU9dHR5MOKAnQ0KDQpNeSB1bmRlcnN0YW5kaW5nIHdhcyB0
aGUgLndrcyBmaWxlcyBoYWQgdG8gYmUgLndrcy5pbiBmb3IgdmFyaWFibGUgZXhwYW5zaW9uIHRv
IGhhcHBlbi4gIENhbiB5b3UgY29uZmlybSB0aGF0IHRoaXMgaXMgYWN0dWFsbHkganVzdCBhbiBp
ZGlvbSBhbmQgdGhlIGV4cGFuc2lvbnMgaGFwcGVuIGFsd2F5cz8NCg0KUm9zcw==

