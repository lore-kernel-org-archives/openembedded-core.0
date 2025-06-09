Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE512C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:55:37 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.62])
 by mx.groups.io with SMTP id smtpd.web11.64854.1749488136254020247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XZp5abeY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XZp5abeY;
 spf=pass (domain: arm.com, ip: 40.107.130.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jCeJR69ru+WHj383mMQa/zG20n647e4wTDxa7cjuoNKqepaeRovpu5gDE6IO30z7LzO3wzcGP18uq8ae7AcnxtMJnDS0RdDOHIl0rrnWGRT618DDt0uBGFOd72XJ/C8b1Dd+AYEWfkZdfrLDhPKY4FzbO2NHb+0WOTHZ29OF+jMB1powVg5c5rYbY1tvaeJ+a6oHganZcQpKkAPHn5mfimA8gF0+kFCNq6YIvYMIPqXwqbjTP73SYeUfXqFb6lOGkLyehfjgzhTnXEVWVHFe9LVNAJTLTNc7YH4pzbmM3qZq+sa4Of6JpzZ/7UoBrhOEqjXVoMqfYB2pX3rUZoCXmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVpNet+PtRjArlyn8znn2Jyf9q1zbJym2KGadXpTikM=;
 b=r1pVtR6gcIWvcsGow5AVXdmLVhjy263eQ/RT10RiLz95T9t5/uKddd1buDt2qpKNDd8H1eG93NghKOn77YG1qPujRlXcRo8awioDmjyvG+PxBuZ6ZgVsnYh2BS3Tav8xpzlVWaiIvBOSDdJWC3jvW21TFnX9uAV+aPUqq9qPeZyEtncSf0GrCdKyc/mfBbIU5c27PLxr8IyG8vH012Mecwgcotila1GeGw6rmTtYMpi7b4Qp+XkPRvwhlSy2nc8Ss1OyxMrENr+fyaxJqPQPG7MSnccJhf5P1WKP0WzPVo8+O69E8vpM6Jmc0Ud56RWI8Mx2QXW0OT73QixMsPBqHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=skyrain.eu smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVpNet+PtRjArlyn8znn2Jyf9q1zbJym2KGadXpTikM=;
 b=XZp5abeYCbPMZJQPT50Z6hYjSbLV0E33t2Z2RNSu/1Ex6IPt3UJK+wt6/ljN8hM7y5P9GhG/d/fGyoj8QsrUkrh6Ytz6/xmeADYa+XiKd2D6zHBFYFD+wSM54tuAWHW1k6CQYJmPLsFJr9QwtuXJOtnZ7jKACRy3Ru1ZtNV723s=
Received: from PAZP264CA0082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::14)
 by PA6PR08MB10469.eurprd08.prod.outlook.com (2603:10a6:102:3d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 16:55:32 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:102:1fa:cafe::51) by PAZP264CA0082.outlook.office365.com
 (2603:10a6:102:1fa::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 16:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 16:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hhpta234niEY2JnS07iCZGrhjuaFi+jzF/W0l2NeNzKqrTtfVWB3gnCUMJIsRyudYAGQ1XNUQz4+K/HA4VnX9UKQWBFFAFnmN9mevFVTbraWwPYi26zXI/FkeMKOeBTzm6QtpmMp16fGVodo4esZbH0/gty+YC+id9l1542Nhve3IJBfYVpD/NAporGC8RxvegDGEUdbW1vNlA8DSebHofzWTT1KvWXxLpITy5zR0jr5mtgTI6GXnmiAsaOpvv/NiFu6CB6aPSUX3uzT8qnDz5bVTe4bxZBkTnhccRf8Fj4bk0aEC+za9N+VeTsw3H0D2b4jL7Jo2OWJdtgXPAA86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVpNet+PtRjArlyn8znn2Jyf9q1zbJym2KGadXpTikM=;
 b=Q23Fd20eMZ2ROfmhKM6WG7oOgR9xw5nCAjT5Bwpl2mxn6wmVQO82JznebASwTqI2qJ9sFXnYhH3t+J58jo4UTbHkXTmquRyNm/dqRMOzTVCwtJtmf3Euzx+grajstFDk1OanMR6AIbEhzXxPdL9q+dTdGoUm+GvWU58bw9WciUaxAthb0LV8jCbD/ZaocfUqE5LK3z2VDj1v/HaIw3Ksr0/+bH41L/Qn0cqTeXiccZQ2UayW3dRJ1hvHClO9bU0pCZ6we9kAJr+o+pdgYeIsPAaTOc7kKpGqzfafjegxno+ZO4Ap4xaSJf35gFrkgfQAqzCFVSvqaUg35uI4S+Ofag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVpNet+PtRjArlyn8znn2Jyf9q1zbJym2KGadXpTikM=;
 b=XZp5abeYCbPMZJQPT50Z6hYjSbLV0E33t2Z2RNSu/1Ex6IPt3UJK+wt6/ljN8hM7y5P9GhG/d/fGyoj8QsrUkrh6Ytz6/xmeADYa+XiKd2D6zHBFYFD+wSM54tuAWHW1k6CQYJmPLsFJr9QwtuXJOtnZ7jKACRy3Ru1ZtNV723s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8111.eurprd08.prod.outlook.com (2603:10a6:20b:54d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 9 Jun
 2025 16:54:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:54:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrej.v@skyrain.eu" <andrej.v@skyrain.eu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe][meta][PATCH] dropbear: add xauth runtime
 dependency when x11-forwarding is enabled
Thread-Topic: [OE-core] [oe][meta][PATCH] dropbear: add xauth runtime
 dependency when x11-forwarding is enabled
Thread-Index: AQHb1frgn0fs/V7HGEKDOskq7bqkVrP7EnGA
Date: Mon, 9 Jun 2025 16:54:56 +0000
Message-ID: <912349A0-C95B-487F-80D0-D5402A94ED30@arm.com>
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
In-Reply-To: <20250605091828.50442-1-andrej.v@skyrain.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8111:EE_|AMS0EPF000001B3:EE_|PA6PR08MB10469:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a41fad8-f1bc-43fe-5949-08dda7767138
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M29sREJ5OG5DN0xGRmxWMko3djEzNmRlY2x4NHFuYjBuZHdybStwblpNKzNq?=
 =?utf-8?B?bVgyWng3Tm9ya01LUHo2RVIvaitoT3Y1SFpLTTU1NmZTcVlyK0dzQjROVnB6?=
 =?utf-8?B?NXhXT29aQnFrQTJEemJxMjVsbCt6VUJsMlhhOWhhNmM4L0hxcFJsL1k5cTZR?=
 =?utf-8?B?TmNNNDV4cDlOemhnQWI0U3c0bjN0ZW9sUTlYSUluYWllSnQvQWZNS1JnSDlh?=
 =?utf-8?B?TnhDY0hhOWJTOXhjWUk0UWlXbDcrVWJmSm1DNk1yZGlKbWZ5VDdzMDZJbm5t?=
 =?utf-8?B?eDVIZnNkNWVpSEx6K3Y1VjRBcFhiTzBNVU5NZUgzUVhTekdQbXQxRGtFTklK?=
 =?utf-8?B?SDZUMjhvMGJlZStJakNzVEgwTUZDb2d4U0lvL1YvWmlmY1NZZ25lRExxNVc2?=
 =?utf-8?B?MFpmZmNiaUF2aml0aSs4Rk8zVlNQUWF3SkV5dllud09ibkIySFpoQzZGMlZC?=
 =?utf-8?B?THFMdmpoRVYwY1N6NlpRVm9Nd2poY0M5MXhrOHI2MXZBckRuZmxDNld4SkhM?=
 =?utf-8?B?VmEyRTBsVE9EdHpNaVMyUU5mRGFCWEhQZU5rVlRCd1NYZ0M5UmRzTTRhRUEz?=
 =?utf-8?B?WXMyZS9BUVdVMHMvb1hKVDczV0xabzZYTHNMM2hKK2plVnJkbVdGZVRtVFg0?=
 =?utf-8?B?bXUzMnlrMUtBeVM3OXdYWFpvSnJyZHBGeG9DcVJNNVJXTVZPb3R4bDRSWFU3?=
 =?utf-8?B?anNnbS9nNHVIcnBCcll5UDRkWXF2ZkhUWnhZbTNVQ2hjd3ErSTE3M051K1V5?=
 =?utf-8?B?U1lpTGdDY0hKSkd0OVJzUS9LWUtBWFZ0S0JwS3MyUXZCblBHZjNSWVhKMjZm?=
 =?utf-8?B?cXJNNUdJcnBveHdXKzdFSG81bDJyRk9YZldkZGd3WVVEcjk3Y3N2QUtac05E?=
 =?utf-8?B?Zy9WdlpVaUtkWkxTeTJsOHN2dWtrbTRnS3dlRWxDb1NXdVhtSURoVEVHSWhQ?=
 =?utf-8?B?K3JWVHIyVkJ5MUFXUUYwWmg4dHByZnRHYzZPbmFKcTBOdjhON0MxM2NjRnBr?=
 =?utf-8?B?Q3lrZjd5eHp2YTlQTFhTUU5hV2dkZkxMbzdwQ2dRQjRoL1BrNlZhcWF3S3M4?=
 =?utf-8?B?NkkwT0JqMldSUmUrMGVaMEc5Nng0dXpJV1N6bTJUQlFIVGdtdjhqQmxlSFV1?=
 =?utf-8?B?U25GelRDQXp2dTBRSE1wdHVaMUxEUnRkaE9nK1oxTVlKeHZLTHcydHZTaGVW?=
 =?utf-8?B?YW8zajNyYmt0b2Q3LytCUnlqb3loTHZhbm5IcGMwb3BMa2hYZTFQWlFkVDc3?=
 =?utf-8?B?d1ZZTlVudC94VS9IOGx4R2xrNTFtQlJQUEJHNWhkUUJnSUNRbXVGb2dZYVBp?=
 =?utf-8?B?NFVBcE1EcVdjclR3SmJWOE9EUWxrTkwva0M1akprU0ZPcUtRaytKcXhHWE5P?=
 =?utf-8?B?ZXlxN1hDT2Q2bHdySjdPMFZ5SytGNWt1U0gyQVlQNmpVY3BhS2FYN1R5WDcx?=
 =?utf-8?B?SU1Nd3REVVN3ZWdCQU5iMzFVVDdDL2tFdU9wdEhwVUk1T0NtZWtBV2lWUUl3?=
 =?utf-8?B?UENVTUVDNU5qL1BjS3ZHbVkyWWZkRDZtNVFLajYxTzF1Y3NPeGpubC9HU3VM?=
 =?utf-8?B?QkIwVDVNVWZYS2R0eHpISVM3WlVveXlHZkUrL2VyM1FwdjVBaTdOb1QwaHVI?=
 =?utf-8?B?KzJqQThKNWJERVgxeW5TOE82Zk9YaFl0aVZ2RVR5MVl5WTMvUlR1T2s1UUtE?=
 =?utf-8?B?b0xYRVlSRm12N3ZrMXlzOXkycjZGc3lYU1B5cXJOM1pZRUtmeFgyaWFkSTJI?=
 =?utf-8?B?UXA2YUw1TytSRWJyelZUMElnMlU0ZzUrVFhvbVZuQkl5UFA0cDJzZ3Y0N3dD?=
 =?utf-8?B?a1llcXc1czlJRE1NZVlwdURkdFdNWGFTTG5Pbk5yU1ByQzU4MDVqbXlXeSta?=
 =?utf-8?B?eklDMEp2UWtmWm5raDNlNUMwR1BUS1dXQTJzbDNsVy8zMkFrdHMydXUvZ25s?=
 =?utf-8?B?Zmw1UmVPZzE2amIxZnlqM2xFT1pXRTNaNGVtUEo5VlpTY3RpbXFTa3huWlI2?=
 =?utf-8?B?WTBLYXFmb0pnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <152A0B8C4CA117429351510B96DC1E83@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8111
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	22cee900-b0bc-4a6b-5486-08dda7765ce6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZzRRUWd5Z09SM1VGa25pbm05RGI3bDdxT1J4T2JaV0VwcDBnRkNyTTZTS25p?=
 =?utf-8?B?eDBkNlhoU0ZtQkRGTm1SQzc1SUlnd2lVVXduU1FnajkrbDdFMjRjSElhcTR6?=
 =?utf-8?B?Mkk4NmpndEJJcmYyM1krTEdVamtpQ2F5VUZ5S2Y4UmlIaEFVZllSMUJidkNx?=
 =?utf-8?B?a1ZkTG5PVGV4WjZ1NnZyZ3gxTC9kaCtIVExuc1ZwSnFobUZTS0EvS2ZlbFhr?=
 =?utf-8?B?bWQzRTVmTGU1WjZoZjBJbUZyL1BHVnc5TWdIR1BBREp3N1dveS9HQjRnVkFq?=
 =?utf-8?B?dWErWmI4TE5GQy9vVTJwM3k0cmtjd2VPa0FHZiswMW5mb0NwOGNMYnBEdDlV?=
 =?utf-8?B?dmNieS9NNFcrdVF3VTJKTDZIOGxFY1ZKU0JBWjg1enBXeCtDRkpmQkZLRUlp?=
 =?utf-8?B?dXVCTTZyVGtWSDhCZXBvaCtuSEVYM3FjTGYvdnBjd0R2a1lGdXJ2d1AwTjIy?=
 =?utf-8?B?Q0FFbWlYMGF0VXBjZzRvbEphMUNGZGsvV3NLWTBDaW1CWS9SVnIzdmZLZXBW?=
 =?utf-8?B?NDJSTDVoQXR1WVBmek5waW05UTE2aUtCWmJNZ1dlYkhhczVOL0orRHBZVzNk?=
 =?utf-8?B?Y2NWWVgzdUNoRFBTSUE2NzQ2S1FUZ2dDWUxpWEZFQnJjMmZZNUQ4MzhkUmt1?=
 =?utf-8?B?RDRKSWVEOVpsK0RGVFlPZW81Q1NzZGFxMXdNM1p3ZUZiMG91WGs5YS94V3pa?=
 =?utf-8?B?NUVYSW45WUZ5a0hMMjhtSzRFeXg4dWF0eENzcmZ1azFHN2tWcnFFZDd2SkQz?=
 =?utf-8?B?RWR1T3I3MUZCOFFIak9JUzI1WWJNUHRJcG9iNnphblY4aXk0ZlJMZW5qamUr?=
 =?utf-8?B?NGNQZ0ZQdDUxQkFOUkJqZlJZRG1pNDdlaXd2c3RBbmVvZ3ZlMWh0cGZVMm5q?=
 =?utf-8?B?ZEtFT3NxVExlczFtNTNhcG42b0t0N1U0TGZmSzNhZ09yQzFnaExjQ1pKRmg4?=
 =?utf-8?B?Q2ZiTUdDeHZLcjBET1BmRDVBZ2kvSGZFQXk2T0hPT2pMMDE2OWxGSm44bytO?=
 =?utf-8?B?bHd4RHVubDJaZElmTUhxVTZJU011WVVrVlVsOVFkRTB0dUE2cm5rNXMwdHQv?=
 =?utf-8?B?T1V0b0dHWlY5RVp0WStJd0lVeGVHUkNtMGVUT0N5NVpsRHFjaTBlRENwTmdJ?=
 =?utf-8?B?T0dHcjUxMmU0WThMS1EvZmxONk9DNGMweEZ2SDRNMmhtQmlsMHFORStTVk9t?=
 =?utf-8?B?b1FNVjFTRHNOYUpKbUcxZXpwKy9BKzZrK3g0VTZFNWZmV0xobUw1T0R3VUpV?=
 =?utf-8?B?cUVQQmpvTERITFhMVHBmWkpOYVRtdWtNN2swZnltTkVkZlFNcVlDQzI4NWhJ?=
 =?utf-8?B?SktNbG10azBZQjJBOFZMcHgxai9qQm4wYi9xb0k4TDV6QkorVjloRlkxSGVk?=
 =?utf-8?B?clB3aWtBa0tCUFlENEZUMjlrUTRzeXNaNGJYNThSb25nZ3UxV0pGWGVLTU5h?=
 =?utf-8?B?SkVSYmwwL2tleERzT25wQ2wwdGF2d1MwUEpEOUprOEh4ZURvRG4vMjY5dTZW?=
 =?utf-8?B?UnlEVmNhVDNIUysrOFBEVUZIYktNRjdNRnhXNm5SdEgxK0h2Mm40OS82Ukwz?=
 =?utf-8?B?bnIxMjhZZ0NzTkRZNzRQcmprT1N0ZjhtNHJ1bXB6UXF6SkFoclBrWXY4OXIx?=
 =?utf-8?B?aUo5N1BOSWU1clBuVW50VERBUDNGZCtISXRJNzhFak9KQUJtUE9yY0dHQk5X?=
 =?utf-8?B?R2FVYUswU0JFczgycDhFd0hVeUJtSkV2bXBWU0VYUSt1QXN3dXRGcU02UmlH?=
 =?utf-8?B?QWZNQW9qUXRGL2dheUNJM1hzaS9JSHQ3Q1ZSWTNzVlYzL2Z3ZnlURStuQnFV?=
 =?utf-8?B?bE9keS9pZlBjTWZoWFFlTkRaMmcyaVMwQ3dlY2hETHBzTVNqb2RubUpXTlQy?=
 =?utf-8?B?bnNnZnV6Vml4SlVkc0prU0hPV0YrOFVMU3FqRGc5ZUNFcU9BWmQvS1B1VExj?=
 =?utf-8?B?Nk93SGxYYUpGdnR5cFZRcHI2aWNibHZrTWpIR3hYVVBDRi96bUp2dkg1MkFn?=
 =?utf-8?B?V1ZCMWdXMUYyYmpTMmpvODg0bXdyOEpPVDhRU3g5aXR2ZnVBNUJvWXFMRVBJ?=
 =?utf-8?Q?c7epXi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:55:30.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41fad8-f1bc-43fe-5949-08dda7767138
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218301

T24gNSBKdW4gMjAyNSwgYXQgMTA6MTgsIEFuZHJlaiBWYWxlayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YW5kcmVqLnY9c2t5cmFpbi5ldUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gLVBBQ0tBR0VDT05GSUdbZW5hYmxlLXgxMS1mb3J3YXJkaW5nXSA9ICIiDQo+ICtQQUNL
QUdFQ09ORklHW2VuYWJsZS14MTEtZm9yd2FyZGluZ10gPSDigJwsLCx4YXV0aOKAnQ0KDQpJdCBm
ZWVscyBsaWtlIHRoaXMgc2hvdWxkIGJlIGEgcmVjb21tZW5kcyBub3QgYSBkZXBlbmRzIChzbyBh
ZGQgYW5vdGhlciBjb21tYSkuDQoNCldoaWxzdCB5b3XigJlyZSBoZXJlOiBkbyB5b3UgdGhpbmsg
d2Ugc2hvdWxkIGVuYWJsZSB4MTEgZm9yd2FyZGluZyBpZiB4MTEgaXMgaW4gRElTVFJPX0ZFQVRV
UkVTIGJ5IGRlZmF1bHQsIG9yIGlzIHRoZXJlIGEgZ29vZCByZWFzb24gdG8ga2VlcCBpdCBkaXNh
YmxlZCBieSBkZWZhdWx0Pw0KDQpUaGFua3MsDQpSb3NzDQoNCg==

