Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA0C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:43:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.72])
 by mx.groups.io with SMTP id smtpd.web10.12616.1742488974697891563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PAxb2CY3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PAxb2CY3;
 spf=pass (domain: arm.com, ip: 40.107.20.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EUIPkTaEAeMAUstO6oRqRzKgXPdI/2wuFyeKONhrOEkEU92RoEUbpoP3Z//wIg/slbIrQ74Caqe6cpzUkUQaRukFLq1kkvA7SoeQ/DYByTqeeAnRCZ+Qfvi9XgFCjgQSFxmOqJcRr2HPXR4H9GywpZQzS64ME/DBYORJhJTsguOTX8vAJljvmHzpHXAvdgZ9EPhaM8t6p4152Y737y2SyXil7PnFLf+OhIgQe/t0uCwb7jzuoeVJaNqNqnmzd2CtIZfuvVaS9tBYnUj1Axj2AR1uXgoBFbhGu02gLe1J01BElUX0/ea9oNCXsKyPR5fZF2WWl1G+FVtzXIdfLqwKtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTFa3tEP0ts5rT0RYsoU2SlmcuwP55QEI5PNvWOz0xo=;
 b=mDPXnWi6e6Yz3LQDQgQOIOL9QqEFKiOFTscNdzz5sobqouDUKiHs67wt8FDYHPnMSIO4euw2RDKL7FIjObQ9OnGzjtiBKbnVVMolhPUMmT1HnXiebT4zKB32EmT1zaIeZF1gBDnmJT8sZjDkMlQFbw+bfqJE4Li2EQ/lQBP7h/reHNYMUURMQMziORSo+YiFTmX4USgrI5tZ3qvaFATES7q43pTkyeGQIM9PHyKlM0ftnW0KDs5TqXTDG8fQ6VucCO8xjndbkXYKeu7VnhKpp7/b3EjnUlrL6Z2US3/LJCa9ykY5gIo8iW7F/Fv1oV3M1yYxZBPqrN/Pvz2VHg9IEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTFa3tEP0ts5rT0RYsoU2SlmcuwP55QEI5PNvWOz0xo=;
 b=PAxb2CY3UO3A70HylPyfZSgl8zXhZ4LcjR/Y4lFTAH7bt/o8YCoT7IK/Qdl0Ig15HaDIcnRSYkYMeppoR+0yRV9C6dLsgqEtkV2LnIT2ZOB2CRk5wW9cOTgFY8jEIyNfJPVTgpVeT9qAtvCnD7Zm8swsdCUtPJaXQSIZ64NGHs8=
Received: from DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) by AS8PR08MB5960.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 16:42:49 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::40) by DU7PR01CA0020.outlook.office365.com
 (2603:10a6:10:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Thu,
 20 Mar 2025 16:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 16:42:49 +0000
Received: ("Tessian outbound 3b697e1f0a1a:v597"); Thu, 20 Mar 2025 16:42:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 817db9a2d5c930e8
X-TessianGatewayMetadata: 4R1/L/QtX1JGCjGRdu//IfyhFxxLbK+qm+ulptIh0IW/j53/CYurWq5KrsJ/GAsuhXgOj/aJV9Unv224AFax8n3ecOOkzGn8OWqZmHb/SxeqfSLNxLYwWRw69du8911LyGyslbL74BU+EiDB3uTPqAYn12Zz+omWry5dyW/LYXI=
X-CR-MTA-TID: 64aa7808
Received: from Lc6ad15e10e67.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6F576BEA-1087-4AF8-BA8E-C642D79328D3.1;
	Thu, 20 Mar 2025 16:42:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc6ad15e10e67.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Mar 2025 16:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byrwB8M0Xz6VIzfSN44MPy9N1DDJEPrMmHpaePOg6HVoJB6EsLx9JU94X/dHDyx5BOa1fBaUZOzq8VJnbHlQbs9jbOyjAcjLScTA+668B6a1aitNGlfDhTDG9Kp95viL83UbBYrpvzEKZwWIT4SeNbeuXcmZRYCi/PbXbwfz615yuxpyzyDTXfGbgn2rSG0yZ26gRSUa1Izy2RwBpeddsry0tuUHtUy0iynAZ8cfo9ImvOKmYL65/xf4RPvrpkHjrDo+XjiOzJyje3J4j4HWIpr9N+VzHoRyeCqL6QgUC5GJ7LgbS4sV/Wo30Ih1EKecMxTZ+g5T0Zjik4sCvelVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTFa3tEP0ts5rT0RYsoU2SlmcuwP55QEI5PNvWOz0xo=;
 b=EKyhEcn3gbCWeedZz4A6so44hdtdHmMCRvlKhLTjO83yu+JqUFUHy+Kb4DWsHNcJodqeX1FpN06R6X33vMbmoT+1EuLTBfWPm8QpMueWOM/CFqWUEiJ/F4s+b7w1Q23qhagp235BOwoKrJqEqHqzjrCEPPCnZhBz6ub9hUdBGjoGgseuGJfjDi6l4E9VugH597m9WtWgFrda/Ytd7WnXL03BqSMQG5G3lziEtYEikKCJFEPZCszlcsG2Uu3w5bgkOoyA0nRvFkaaynJvYhiE+lEP+s3GpsXJBV9Tb0WpdQvfCW4WPaW2Ho8M8Zlbypnzrdm2hhDaBeezG/WmsOoOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTFa3tEP0ts5rT0RYsoU2SlmcuwP55QEI5PNvWOz0xo=;
 b=PAxb2CY3UO3A70HylPyfZSgl8zXhZ4LcjR/Y4lFTAH7bt/o8YCoT7IK/Qdl0Ig15HaDIcnRSYkYMeppoR+0yRV9C6dLsgqEtkV2LnIT2ZOB2CRk5wW9cOTgFY8jEIyNfJPVTgpVeT9qAtvCnD7Zm8swsdCUtPJaXQSIZ64NGHs8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6132.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 16:42:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 16:42:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 8/9] man-db: Add missing rdep for col utility
Thread-Topic: [OE-core] [PATCH v4 8/9] man-db: Add missing rdep for col
 utility
Thread-Index: AQHbmRgHpc/KvRSnQU23VZqOAP2hKLN8O/OA
Date: Thu, 20 Mar 2025 16:42:42 +0000
Message-ID: <3ADC47A5-E76D-4E73-8FFC-5E3CDC3C14F6@arm.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
 <20250319214213.2505249-8-raj.khem@gmail.com>
In-Reply-To: <20250319214213.2505249-8-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6132:EE_|DU2PEPF00028D03:EE_|AS8PR08MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e22eb34-0a8a-4f2b-b705-08dd67ce405c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c0ZQMlVWcG95eVg0RXQwdVZDSDVlMzh4aDljMkYwUVNEY1NQZzJuOFVXQXp3?=
 =?utf-8?B?Q0JRZmVRbmpoNG02OXhWc3RZRU9hS3hyaUVSeFpLaFQweFNjZGFkYXlGdDZw?=
 =?utf-8?B?T2tHcE5kK0k4K09LcjhPMmNPaHJzV0RFRjNONG1vLzdxeER5NDFuVllGMFRu?=
 =?utf-8?B?a3prWGZQUWdRN0VqWlQ5QkJ3NkFyZi90Q2xVNXphSHBzdmZ0c3lraDhISzFp?=
 =?utf-8?B?aEtRbkNFWHV2ZmdYZWRnQnkzazQrdWx5Ung5MXFrWEpMeG9oRU43NlZnQnFW?=
 =?utf-8?B?VmxLVEd4NnZCQzVQaEg2cWlKbkgrekJpdVM1RVVGMWtONnZGd0RpaDVIOTU5?=
 =?utf-8?B?UkJOOEFMd3V5eTZEeUtibXdoU0dJcENiTGxIMEYxblhlZ2dQUFBJUm9nbjQy?=
 =?utf-8?B?bXlWQTdIZ0E2R3NEK2FMSlkxNE96dDFlOW1YMktFcUgyRExYNlIvQVVMZHJq?=
 =?utf-8?B?NWdnTDVuSHVaeG5KWnY4cmFwTDd1MmtSQmhCcGZ1akUyUnpVS1hCcU9SQ1pC?=
 =?utf-8?B?VUlDcld3Rk9uclJVWjRRR0VYNGpWUTd1SHJYRXZmMFg0ZXFUWTBxOENGS1Fs?=
 =?utf-8?B?NTZnWVlsd1p0dFpjcUZNRWlZWThUc3hrZi9VSUZURHVaY3l5NWhuQTZYTXN5?=
 =?utf-8?B?QUs0ZmxkUnFKU0cwYytLcmd2RjErak5xU3g5ZmdjZlNtQ0tMQVhqSEpiOHND?=
 =?utf-8?B?cWUvbzQwakFNMFg4ck1aM0gvVUtidWhRemhoNUZOR2RSV3hiUW9taU9mWHBv?=
 =?utf-8?B?d1FUMHcwdkFzTmdzdDdrMkdhY3lmQjAzTGcwSFpoUmFmODNOMmxCd0I0N2VL?=
 =?utf-8?B?aHpvUHc5MHArVnUxTWpZVHhodUxJUkp2OUhQcHhEYWFjSjJlMEtmL3kySVYw?=
 =?utf-8?B?M1Z5RlRwVEx0VDFGeThuWm1qaS9ZRkM0cC92ajlMb0s5OWExNkFvaEFRZEpp?=
 =?utf-8?B?Y0lCbmZicW1HdCtyZVlxVC9RenJneXBMVE1laFFmNjJmaVJDYmtHbHpPQm9v?=
 =?utf-8?B?ZzJkdmZlcDRuclNFK1dHa2t3aWl1M25aVlQvYklUZjU4cXlWbG51WFpUQU9G?=
 =?utf-8?B?MzZOakZYYWVpcU5BWElMdXY4UmNwMS9kWlB1Tmtuc0JESnF1ekovUTNjcmhk?=
 =?utf-8?B?Tlh3akFMa0QycXdhS0VnbWRWU1VsRXFPb1psUm52U3ExYk9mSkRpTlkwRVZh?=
 =?utf-8?B?K1gweXJIT2FRVWRzRHRnV0xYUGdFc09XeXg4VFJCdU1WYldva2N6a3hjOUZX?=
 =?utf-8?B?bDFuV05qWjMrVWZQR0gxb1UwcWRsK21aeWtNZkhVTGNCRTdMaVIvNG5ZaHJZ?=
 =?utf-8?B?czgzdVFxck82M3ZjOGxjWlVqUFZFOERwTldJbUhhaURBdVpGM0o5K0VZYVZE?=
 =?utf-8?B?UkdKOWxSNmVzYUxtTUFVckZ4Ky9RNlgwYWo2T1hHdlVhQkE5N1JWWHJaN3FT?=
 =?utf-8?B?OGJvMUtGaE16R3JyQWtqaEUvUnFVZVBmSkUyUzF1dHJ5MXZnVXI2ZDJrVEdS?=
 =?utf-8?B?SXpWVVpvSUo1SmQxczBvRFdMaUxuOVF2Y3R1TjljVlJKWGJISHRLT1BZRWFX?=
 =?utf-8?B?VDlrMlVxRm5DNDRSRXlQU2xUek1zdG5rTTl1ajZUZ056Q1lDM0RBN0NqdEVi?=
 =?utf-8?B?eHN0STRrcVM3TFVBUDhBVUlZZjR1aGIrWXF5cUM0VWhNb3JIaXFoQzlTaTc3?=
 =?utf-8?B?KzVnUXZXYURaMU5QZUtZcXZlSXFNUUlVUDZOSjlLbDlBTXdSbE5aUHM3Mkta?=
 =?utf-8?B?Vi9YaklJUS9Sc3JsOXZhdVBQQU5wQlA0cTlJeGxKWkt2K05MYXhlQlhxTmN3?=
 =?utf-8?B?VzNUZ3ZIbmg1djZVRXVNdEN1UlpTaXdiOTgyaEpmNEJuc3NBc01RN0FyY1lP?=
 =?utf-8?B?TXp4eHdjNHE5aUJhb005MDQxSkRIa2JkNUE0MUpCc3oySVBPVzF0Tmc1OCtP?=
 =?utf-8?Q?BZ5uRofMYF1Ord+lOoedAo5UQ6KqIUbY?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0943E35FD0C70548970BA30748F20FC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6132
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	82dab687-b60f-4580-6aa5-08dd67ce3c18
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlIzSytLOVJ2Q1MwV0hxc0hJdHZaTi81L2V2L3NYclkxMzMzOUgrNUNTMUlp?=
 =?utf-8?B?VEU3SzdjOS9DT3FKWmMvMXNGdUFTaFlCa3gwenBFRW8xanFzTSt6N1BVMVlv?=
 =?utf-8?B?cTFOUVpQYTZrL0gwNjZhcFJNVDFyK1p6MWpCaUlZMzBpRDBydjdQRlJYQnNo?=
 =?utf-8?B?cEZhYUZUS21hbzhwZDkwNW1KNmtCM3dyckhVV1UxMnFaMjY0aEhqR2JGOThX?=
 =?utf-8?B?eTBSaDFjZXRlcEE1S0xHWXMwWnZ1eXYrRjVOYjNpTERxNFBzRWllRmhmR2RB?=
 =?utf-8?B?T1I4c1dhbmRabkgwWXpraDYwTzErNG5SY3hFZ1p5RFo4dmJFZXNwL2JtblVX?=
 =?utf-8?B?TVJHbXNwQkJFS3AyR1VOdCtrTUZZM3V1b25NOUJvQ1M5UU43cmp0ODBldUZM?=
 =?utf-8?B?VGVPdU1ldVlkVmhHVDhEUnY5SFhvY01mK3l1K01zWnN2cmQ3M0NnM2pid3gx?=
 =?utf-8?B?bUJrS0JlNG1WeEdsYzRWM29Qc0NtdzRHdFo1UWFkRytsTk1oZVMyNER0UFVB?=
 =?utf-8?B?UW9kOGI5SXd2V2QraXdCVXQyMlllNjN0MTFpeUgrb1RUV1ZOQlRLRGFoa00x?=
 =?utf-8?B?d244VTdPekJzd1FEakU3UDN1Z29FZEFVZ0l5V2VpQksyNEd3VjQwTVBwV01B?=
 =?utf-8?B?K2ZhNC93NEJiZWlRTnNMbmlwbkh4RTRnbkxpcFJaK2FXVnprVzBURVAySUZ1?=
 =?utf-8?B?VkxNaU9PRkJrSWVuSHBNWU8xcHFXNmNWdTc4ZW9Mdk84ckNSWWV5aFE4Tnlx?=
 =?utf-8?B?SEdKV204QzVwNXpWeDZpek40Sm1PRml5MnFib2labVN0S0R3ZC9BY1J3SkVl?=
 =?utf-8?B?VExkempGNllzdEwzOURYMjlock1lRVk1NFJIdGNoUy9rU2pzNTFmdFpuTHFJ?=
 =?utf-8?B?WlVyKzJSRzE1YlJrNVdiSkowR2x4MW9vUWhoM05WQnVUaWZZeWFSdG0rNUhh?=
 =?utf-8?B?aDJHOGU0Zmp5UWRUb0VSR3l0WnBVME9mRXhFbmRxOHRFYnJrdks2OHVyYUV3?=
 =?utf-8?B?ZTFUUlY4aEFMOWh6dXJCdlhiaWR6d1kySUpWOTAxbkt2T1kvN2EzNHVTNHBM?=
 =?utf-8?B?b25SakxjSEJnak1PcGFKbUFMUzM3UnRIWkxDVGdHZk5SQjVxTFhrQUZ0M3ZC?=
 =?utf-8?B?VVZVaFY1UGlRZ0kvalpjNlRiRzR3Wk5PbUZNeHg1ZmI5RVcxVURXTEQwME5s?=
 =?utf-8?B?Vk1UbjdORTBZR2ZDSUdhR25nK2R4Z0dMb0FiZ0NReENWTldqWG9YeGc4dUsv?=
 =?utf-8?B?MjUxdkk3cXpjejFWczhXajV4R05mai90Nkk4TmpTaHVoaFVIaCtwR2pyRHhC?=
 =?utf-8?B?YVlKR1EyQ1g5SThNSk8rdjUrZ2Z4QmxoYTBxdERGVER6VkFYV0ErK1hIMnhw?=
 =?utf-8?B?ZTFLQzMraHBDSlVKclFYd3psS1FEWkZXYStqbjZ0QjBtTDFObkt5eTdRRjd1?=
 =?utf-8?B?VXhSek5oZTNNTC81dHkzUEd4aW9lMDdUbVRHQWdkaVZrZVpueXgwc29jZ2tZ?=
 =?utf-8?B?VitRdUFrTW5va09hQmwxRWZZRVRhY2JCOWR0L1VFbTArL081MndTUnhzdndo?=
 =?utf-8?B?ZDNiNUl0cDBiL1FVcGlGZmg2aW9JcUZ5WHNHS1lpWks4UlQ5MjUvQUc0S1ll?=
 =?utf-8?B?UkIydGdmVmlQc0NPM1FXeHJCWjd5dVZubFFXVzdnRmwxaHZSd1ZNZmVnRnEw?=
 =?utf-8?B?VnpkQ28wVjdSb0x5QmNnOE04K3c1VHZmQm9MM21WMUZkbitJTDNXZ1NKUkNS?=
 =?utf-8?B?Q2VEU1poOCtZQWt3OTVJSHRvQ0VSOTM5OTMwdThSUXUzQlFUYlV5MGp2RlJD?=
 =?utf-8?B?cSt0aU9uR0EycTYxSzF2ME4wNE5WZ3NUa1NueTlmRk1tYkpPSFp4UHF4ZXQ2?=
 =?utf-8?B?TGxwTG1sc0NOQ1luVHlNd2F3SDhGOTE2MFE0dXlNbTFWNkM4ckdTWkhvZXcx?=
 =?utf-8?B?Mnh5VklmZ05oeEpzeFo0NTJlcU0zR0VCK0JOS3paSzVIZVdibUMrSC9uOTBB?=
 =?utf-8?Q?x3oz24x/N3FPIEr5w2D1UdjOfAL4S4=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 16:42:49.7220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e22eb34-0a8a-4f2b-b705-08dd67ce405c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5960
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213415

T24gMTkgTWFyIDIwMjUsIGF0IDIxOjQyLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiAtREVQRU5EUyA9ICJsaWJwaXBlbGluZSBnZGJtIGdyb2ZmLW5hdGl2ZSBiYXNlLXBhc3N3ZCIN
Cj4gK0RFUEVORFMgPSAibGlicGlwZWxpbmUgZ2RibSBncm9mZi1uYXRpdmUgYmFzZS1wYXNzd2Qg
emxpYiINCg0KV3JvbmcgY29tbWl0IDspDQoNCj4gUkRFUEVORFM6JHtQTn0gKz0gImJhc2UtcGFz
c3dkIg0KPiArUkRFUEVORFM6JHtQTn06YXBwZW5kOmxpYmMtZ2xpYmMgPSAiIHV0aWwtbGludXgt
Y29sIg0KPiBQQUNLQUdFX1dSSVRFX0RFUFMgKz0gImJhc2UtcGFzc3dkIg0KPiANCj4gIyB8IC91
c3Ivc3JjL2RlYnVnL21hbi1kYi8yLjguMC1yMC9tYW4tZGItMi44LjAvc3JjL3doYXRpcy5jOjkz
OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX25sX21zZ19jYXRfY250cicNCj4gQEAgLTIzLDYg
KzI0LDEwIEBAIFVTRV9OTFM6bGliYy1tdXNsID0gIm5vIg0KPiBpbmhlcml0IGdldHRleHQgcGtn
Y29uZmlnIGF1dG90b29scyBzeXN0ZW1kDQo+IA0KPiBFWFRSQV9PRUNPTkYgPSAiLS13aXRoLXBh
Z2VyPWxlc3MgLS13aXRoLXN5c3RlbWRzeXN0ZW11bml0ZGlyPSR7c3lzdGVtZF9zeXN0ZW1fdW5p
dGRpcn0iDQo+ICsNCj4gKyMgdXRpbC1saW51eCBjb2wgaXMgZGVwcmVjYXRlZCBhbmQgb25seSBi
dWlsZHMgZm9yIGdsaWJjDQo+ICtFWFRSQV9PRUNPTkY6YXBwZW5kOmxpYmMtbXVzbCA9ICIgLS13
aXRoLWNvbD0nJyINCj4gKw0KDQpGZWVscyBsaWtlIHRoaXMgY291bGQgYmUgbmVhdGVyIGFzIGEg
UEFDS0FHRUNPTkZJRy4NCg0KUEFDS0FHRUNPTkZJRyA/Pz0g4oCcY29s4oCdDQojIHV0aWwtbGlu
dXggY29sIGlzIGRlcHJlY2F0ZWQgYW5kIG9ubHkgYnVpbGRzIGZvciBnbGliYw0KUEFDS0FHRUNP
TkZJRzpyZW1vdmU6bGliYy1tdXNsID0g4oCcY29sIg0KUEFDS0FHRUNPTkZJR1tjb2xdID0g4oCc
4oCUd2l0aC1jb2ws4oCUd2l0aG91dC1jb2wsLHV0aWwtbGludXgtY29s4oCdDQoNClJvc3M=

