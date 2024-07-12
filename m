Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A029C3DA4B
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:26:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.7668.1720790785592784156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fcb1ww3Z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Fcb1ww3Z;
 spf=pass (domain: arm.com, ip: 40.107.21.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Le4Tk1myzjvdv0TpEIsXHpQCLyo60K6C+1Yobzz5FI2cxJOqBv2qvBw/Nf6T8j08obF6scvuc0CWcfodXvPKxeCSMx7MS56i9A372O2zbB7x7j5ZWTu+9Za6WQTNj0663kBXHkIayCUQdgvAU5Ol+3dMMxb1l8LOH1B8xPT268j82DNVTSRTbgNvTZnQh9NxMEJJAr+IFJ3EffWLLkyjJasjoGVLvS1vhSNVBLy11rPwH+OoePP5r/LF9qpqisJyvrZL6K1FrQ0Iqd5qElDNLr2U/cUr0mr7EeB4WvjJRHL1R8uzb4xoELEA4nAya+tNWUIddV9t0aLFCKh+Q2UuVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVfgnLGdjlGmGB4WHdnIaBWCpyh3sGaDep7ZaqqMFmM=;
 b=c2cSckUKmLoH2rZ5iLu5AiDyIukwUATqJ+8XC2JLadEYWBrbeidTIrkIRZzVuX65iah1YKryUCRobUSZ/OBV6FeFefs6Q7Ab7TeVc5wblRj6O+gsROaqFkB7+hvmF2oB7dPg28E0u+7I4CdHluG7idnozRdu67sae7Q42oj5dAPgETUBCDUNwjQKnZ0hgOlwxmYLRr/y/z13Iw1HIE3IhVVFLJ0FVm96SBu/eI0uItkzGxJY49GxMr1WRJc465XOG9SgdaXfFcRgKh7nT6Noiq2zMQUI6Ai/hzRWrrVLAHD3vFEbiRMvEE5hStaMk9664pwSoU+3c0NMqq+PRRg98w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVfgnLGdjlGmGB4WHdnIaBWCpyh3sGaDep7ZaqqMFmM=;
 b=Fcb1ww3ZpA+lx9SQf7ekPKNvdwHEjj7IxDEcxy6ej047JXJSW6Gwb9DtdksMSLPoRKM3DeFa5Pg+nbAig0k9tC/fe7cJ/uvBy2walfqptTEMvh0c3TVV24NwsCuzXoCfMleXja9m0qYJ5Db9C5GF/ld100aucmVcLUETNc1yXcM=
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by DBBPR08MB6010.eurprd08.prod.outlook.com (2603:10a6:10:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 13:26:21 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::de) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 13:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7762.17
 via Frontend Transport; Fri, 12 Jul 2024 13:26:20 +0000
Received: ("Tessian outbound 8d320bbb64fa:v359"); Fri, 12 Jul 2024 13:26:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80763aef415ea5b3
X-CR-MTA-TID: 64aa7808
Received: from d15e8f2ec6f9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 169C051E-64F6-4026-B20B-5DFAB06601C5.1;
	Fri, 12 Jul 2024 13:26:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d15e8f2ec6f9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 12 Jul 2024 13:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoFpsHmCLi3kGdGoP/shr4VjuLAkcgda1TCX/68C8rOltvcqEbD8Yf7OiSMzyvO6oqOIMn9FHLyNQ7uRrqWW+Baeu2jghfEJiKd9fNvTerFsz+S3pNkzJc+tEa/okL+9RXZNhSv4H7veiItbFnVnEb+3rnLZ9xLO0O38KyBuGMbwDxKJuGbULelDj8r/f/DZtzYZD+Mrz4D6IhNXuNKltm62zHfH2z2RkJ4BgrpW2h/raIrXGo0eCRnKM5/x8dBSpFlq0rU8emWZCbIXgiWX1LOywM2gEo0o7i1xwNcTyUJg6Rgc/58QVVi6q1rykaGPJxNVMQvT4fqMbbokOwiHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVfgnLGdjlGmGB4WHdnIaBWCpyh3sGaDep7ZaqqMFmM=;
 b=TvEXx2K/JJNQ67ITd5/puqRynsEUHt0+LOtTpDyM6iG7Y0BMp6U/eoIZwrQLU8yYJNHVBo7/hgil++pkDcBMGMVZf6Jq0lq0hvKn0xVdHXu2ecoPVagfs/FWZtZfHcoIdSFnQJWpJSo53jR1Z253H5LtygmskNBPCeIQAPQZsZ3x++jTdqvd4LEofZGc5WYI9nGdLlVzkbLaOHruoEG0eGLR2pKuIV/bWJoBvKiNRXPxVeneswOfynlCfpk0liCtQHvcSL47uX/rB326Ke8NpWwHO3vxwIRRjkNyfhiyrPm+CKUdgB4BvFcJmxL1KuYNKk6yvkx4uBPhitzxfU2Clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVfgnLGdjlGmGB4WHdnIaBWCpyh3sGaDep7ZaqqMFmM=;
 b=Fcb1ww3ZpA+lx9SQf7ekPKNvdwHEjj7IxDEcxy6ej047JXJSW6Gwb9DtdksMSLPoRKM3DeFa5Pg+nbAig0k9tC/fe7cJ/uvBy2walfqptTEMvh0c3TVV24NwsCuzXoCfMleXja9m0qYJ5Db9C5GF/ld100aucmVcLUETNc1yXcM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6048.eurprd08.prod.outlook.com (2603:10a6:102:e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 13:26:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 13:26:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] arch-arm64: Use neoverse-v1 ISA for Qemu
 usermode
Thread-Topic: [OE-core] [PATCH 2/2] arch-arm64: Use neoverse-v1 ISA for Qemu
 usermode
Thread-Index: AQHa0+v/I+z3ZoUwqk2JuIPcc+SN47HzFjwA
Date: Fri, 12 Jul 2024 13:26:12 +0000
Message-ID: <A5091FD3-1B02-4D5B-BAD7-7389678E211A@arm.com>
References: <20240711234203.3841594-1-raj.khem@gmail.com>
 <20240711234203.3841594-2-raj.khem@gmail.com>
In-Reply-To: <20240711234203.3841594-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6048:EE_|DB3PEPF0000885C:EE_|DBBPR08MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 9021b688-737b-4e93-3f77-08dca27637f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z1g3YkMrYXhlUXB3azBQUHdkM1l2M25TQmJDUEZ1M3BjdkZHSHh0Qkc2VExU?=
 =?utf-8?B?U1N6Q1YveGlqOEF1UGpjM3pDVDRRaEdMakVWcDlyWnNTMWlvc2dDdjhMNlpT?=
 =?utf-8?B?QmtnbTNObklqM1VoekViSjNBdGNmZlhKVmJOK0FISUlpNTdkNmRIdFRxcTZH?=
 =?utf-8?B?eU0vdUlIYTIzWHRWSTkyMTQrOFpqNHFaY290VkhYL21jcHo0WUhMMFZjV2Vp?=
 =?utf-8?B?NE8zM1lndEVhdGV2RmRyYXpVZEM1N09vU2padE1ZaFB1K1h5VFE1SVV4aEFF?=
 =?utf-8?B?Nk5IVmxaSVhodlh4TFh6aGxQNEsvZUQxMkN6RWxHUS9sdytBaDBwM3FxaGo2?=
 =?utf-8?B?ZEdsZkpudGFPVEV5QUJiNkJhTnA2Z0NXNEhYSWZWTTkrMElaRkM0VWRxQTFQ?=
 =?utf-8?B?b0htYW03Qjk3U3BMeFlEVHdCYk9rVnhlVmhKZGIzVWdzcDNITHpxWXlvSmsx?=
 =?utf-8?B?KzdMZjhWblI5TFJzTFJhM2JxOFl4WGZCcWhrMExxWmd5RDZ0QzZBY0VCZWVm?=
 =?utf-8?B?OFVmSUx4VEdST3REbUEzWUhKV1BJaG0zUGtGMTl4c3FCMkl6THBzRVI4VEF2?=
 =?utf-8?B?R0t3ZUFpdHZ4dXUvUVdWa3dRQVp6OGhqaVpVb3owUXU1MVFVcE5yRFhDS2lS?=
 =?utf-8?B?cWMzVWhFU3ozMVZyZWpyalZ6VkY2cW4reGc3TFhxb1RIditwYjBkQ0RUNVRD?=
 =?utf-8?B?dU9oaHd2ejVWZ0pzVkV3bWtXY2dhQ2RrKzNCMDF2Q0dPQTVwUkhZckJWWFRQ?=
 =?utf-8?B?YUhPMHRUOVNuT3I0WkpwREtTUmIrd2huYVk2cjRPQUF2UXozQldiZGNxTHhT?=
 =?utf-8?B?SjkzMjNSaHpJZGcxVkcyUEtVTi84QjZNajZPeERxQXJrTlBHQko0MG9BQUR2?=
 =?utf-8?B?VDByM3NpTVNKYk5mbXFMK0V5ZG9iVWI0V2Z4ZnhIcVI5THVRczd1YkF3a0RM?=
 =?utf-8?B?MjZlRnc1NzRuQUVybEViMGF3SjJ0Z3NrTE84cVJwai9aekk2L3ZvL29KakhJ?=
 =?utf-8?B?bE9UZzFYRElYdTBCOFl1dWRMNzlpckc2eGRDdDZpeGl0dVdyV01sclpwQWRj?=
 =?utf-8?B?UmFwMDUyZU9IY3hqaFNYbEY2RGNuYnpBaFIrZlExOU1qYUtaTzg5aE1uc2Nn?=
 =?utf-8?B?cWdqV0Y2TEt3QksxZTE3MkhNTmVneWNpNWttRWF1aTBsWjYwZWVINmhzL2kv?=
 =?utf-8?B?dXNYYllrRWpuQndiM1M0S3NHaWtPYS9yOVV0aW05d0JiSWVFeXhnZ0NXN2x3?=
 =?utf-8?B?U0Q2Ym9RVzZKMVBYS0g3aU9CNHQ4YTlSeGRIVWZtaStZR3JNZDRhKyt5dEV2?=
 =?utf-8?B?TE53VkhZbmJWY0lMSWVJRmFXbTYvZEgrb2F0eExPL09yV0p4U1JsTUw1WTV3?=
 =?utf-8?B?UVBsQjBoVHg4UUh2eTIzYURhUE14SnRIK085ZjdRQ09WMXVlNFdVekpZWVhh?=
 =?utf-8?B?eHdzaTc5MmgzY0ovTXNWcUI2Qy84QWpsNGk2RVRyLy9PUHhaSytwS0c2MEl3?=
 =?utf-8?B?cDJaaVZSRW85SE93NHo0V3N1dmw5V0xvdExIVlBFTklVQUFsVkVtQkxseGZN?=
 =?utf-8?B?V0dySmxDcTBaMXBIYUxMeTVhTlpFVHpaZ1I2bDM4Nm1pZ0E2TDVaQm9WQUtJ?=
 =?utf-8?B?UEdGVndEMnlGU0tjTVluSGFKOWloc0o3ekl6NEJIbFdKdzlLa08wK0xVOU5l?=
 =?utf-8?B?QWFhazNVMG5PYnpFcFFqcG9vc1dhZnU3NkhuK2NjdHY3WndhVTFUYmRGQnBm?=
 =?utf-8?B?dnVSR0R1eXBPZGVyeHVWVVgzVXVhT2kxM1pKekMwUFVCYWtoSmFiVGxsZ2dU?=
 =?utf-8?B?V0hTaXJyZ3ZJcE9Rb2NVMDY3VlE0ZzN4OFI0Q0VPZmdMYUVpbURPemtEbzll?=
 =?utf-8?B?VGJtazBmWGZxSHE0L0o5RC9MQ2VheDNJUEsvN2FkcXRhSnc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C347F4B4B1344C4AA52B2767E2C99AAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6048
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0dceb0f4-5313-4097-e670-08dca2763312
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzJ1QkE5V3dMRW1DUjl1dVpjUFRPV0sycE80bXExZy9IWnFRMEh0TFJ6OVY5?=
 =?utf-8?B?a0ExazlQYmdaYjN4YmpkRFVtR0NrTlFOVm1yV25BeXlvSXM4Uk95YzlHQ0ZU?=
 =?utf-8?B?a2N1dk9VVHptR0t6WjFyK0Q5dmtLRGlwdGFrZnRwS3p1dWtvc1lOZGpDRi9v?=
 =?utf-8?B?WjFzQWdGZmZuM3NiSWI4YkpYM25BNTFiK1p0bTY5eUVKcExMcDBIcFBRaE1o?=
 =?utf-8?B?QlkzYjJGRGFKREJ6dzFRcVdBVC94elRCZU5XWUF6emFwcEE4bmlLbmpqMzhL?=
 =?utf-8?B?citlN1J0d2VFYkFDMzljZXNhTEJtYUVzT0RDNDNvT0RUc2VwREZlU2dnekd2?=
 =?utf-8?B?M1RHV1V5STIwdkJJRW55b3IrN3Q4QkNGSmMvN2tOTGtMc05TQXdzUmFJV29Q?=
 =?utf-8?B?SUFZajhLNy9DRmljSnJhamQ3R3JMR09iR2M1NFlRMU9RcUZPK04wT0hicnRT?=
 =?utf-8?B?ZGE3RU1YTFQzbGRwaWIvek9ZSFdHczYvSnFFMk81ZVNPQk5RYWxmS01PRHRt?=
 =?utf-8?B?a2dGd09oYldjNTN1NmZxanlLa3BoUnRrVzl6ZmljS2lYOWJhdzU3WHNPcVMz?=
 =?utf-8?B?bkNINmFCakR5cUdVb293eFNvZkRMc0Q2TVRJT2I4NHhiUlo0bDk1NzlIYVNM?=
 =?utf-8?B?SkNXaHQ3akoxMkRwdkNOdHJyRWZMRy9BUFZmaXV1NVRZSVBDbUg3OXRCaGgr?=
 =?utf-8?B?ZGpVcHR6QzdGM1JUWFlZODhualloL3p0UjQyTjdSajRnRkE5dWFwTjBSSFc4?=
 =?utf-8?B?RkRGQ3BteEdKeERDL2hZTk0wM2czZWNrbHgxYTFKb3FralJkYWxGOVMrT3hS?=
 =?utf-8?B?MzU1LzNBTjZkTVpqNHltUkhQTnpHSHNvd1g2aUJvelBpMkhTUnFoZUdyNy9J?=
 =?utf-8?B?WDVqdWtoai9QTnVVMSt4Y1VzNHY1Y3hhY0psUlZEUSt6WTdKeGRDMWJOZFhn?=
 =?utf-8?B?RWxCcENZeGMwaEROQVc5S1NqejRFZHFqM2pKR2Z5UUVHNXk0YTBCSjhmRStj?=
 =?utf-8?B?OVJMWVdQQ2gyMHRaaVdKOVpuQy9OcXJzVjhkZlQyeFdyZUNiNTJNWkxwRHdi?=
 =?utf-8?B?SjBYdU1nRlMxZnFzT3ZnNTdVbUF6NmMrb2hQaENSSndXWmk0cXBFUW9CWHU5?=
 =?utf-8?B?RGxkRGNDY3VCWEdlS2dGRUlieklnQ3JPZFE1ZENpcEN5b3pSUXZFYTIweHFL?=
 =?utf-8?B?UzM5R0ZYVmJRODZFTWhGQXVLRjNkVjVpTGdKMWdJZyttc1d2QzkwSGZnNElN?=
 =?utf-8?B?N1NHSzZqeXd3ay9xNjRMUWIrTTJVUVVPajl4UllQNDVtWUlUN0dUVnlQZi9z?=
 =?utf-8?B?ZkdUcGVHeXdFQmZxcGRVeS90WmdBclVsZzd0SHdkZ095Smw0OXpyNzRYUEtT?=
 =?utf-8?B?UkU4RUlNV2RRTElobmJmekw0ZzJWT2RjS3lxcE1TdURGVlpLL1Erd1p0blhz?=
 =?utf-8?B?YTVBcFdMQzVxTXFUUmZlNTJnZkgvMGs5MndNSXRvY01IanFpYkZIUHFOSmZk?=
 =?utf-8?B?Y3ZDYUttRFpXZFkyOW8xcE53RTI5Y0VnMmRnY0NmeDBDckQxRWdmVHgwQTJ1?=
 =?utf-8?B?NnNpYTJBYTZ0aGZKa0hTNmcveHNvdWxvK01RdHNsZnVVUDBUR2RjWnFEd3JO?=
 =?utf-8?B?QlZKQlZPV2R5cEtoVWhTZ0pjdnA2V1NGUUswai90b0oyRnRsWS8yWHBVeXJZ?=
 =?utf-8?B?emlYQU85RmZEREhIV1M1a2tvVVlhOU9kN24rajJwSHhkeldWM2djbitaQ09G?=
 =?utf-8?B?aHVtYUtxbmt0eFN4L3VKWkkySUxZUUJKMUVaWnBnWUlSbElYQnlvQ0NaUHlu?=
 =?utf-8?B?UGN4QXdrSTVmN1FBdUp1a2phZG5aQ1BCNmt4ZmxQcmw5cXZmMHJoSlZMdWkw?=
 =?utf-8?B?eWUrVWFyUHVybDZ1MVg5YkxXVUxCaFhXRzUzUlZJOEJucWE1R2NuOE1aSjY1?=
 =?utf-8?Q?OmWNRING4yFsai1ZeMr3dd5JMTMsR430?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 13:26:20.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9021b688-737b-4e93-3f77-08dca27637f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201828

T24gMTIgSnVsIDIwMjQsIGF0IDAwOjQyLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gV2l0aCBsYXRlc3QgcWVtdSBzZXZlcmFsIHBsYWNlcyB3aGVyZSBxZW11LXVzZXJtb2Rl
IGlzIHVzZWQgZS5nLg0KPiBub2RlanMsIHF0d2ViZW5naW5lLCBjaHJvbWl1bSwgdGhlIGJ1aWxk
cyBhcmUgZmFpbGluZyBmb3JtIGFybXY4YQ0KPiB0dW5lZCBtYWNoaW5lcyAoZS5nLiB0ZWdyYSkg
d2hpY2ggaXMgZHVlIHRvIHFlbXUgY3Jhc2ggKCBTSUdJTEwgKQ0KPiBlbmNvdXRlcmVkIHdoZW4g
J21heCcgSVNBIGlzIHVzZWQgKCB3aGljaCBpcyBkZWZhdWx0ICksIG1heCBzZWVtcw0KPiB0byB1
c2UgbmVvdmVyc2UtbjIgZXF1aXZhbGVudCBmZWF0dXJlcywgd2hpY2ggaXMgZXZpZGVudCB0aGF0
IFNJR0lMTA0KPiBhbHNvIGhhcHBlbnMgd2hlbiB1c2luZyAtY3B1IG5lb3ZlcnNlLXYyLCB0aGVy
ZWZvcmUgZXhwbGljaXRseSBzZWxlY3QNCj4gbmVvdmVyc2UtdjEgZm9yIElTQSwgd2hpY2ggd29y
a3MgYW5kIGNvdmVycyBhbG1vc3QgYWxsIChpZiBub3QgYWxsKQ0KPiBjcHUgdHVuZXMgZm9yIGFy
bXY4IHdlIGhhdmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPg0KPiAtLS0NCj4gbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm02
NC5pbmMgfCA1ICsrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FybS9hcmNoLWFybTY0Lmlu
YyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtNjQuaW5jDQo+IGluZGV4
IDgzMmQwMDAwYWNiLi45NjM5OTExZDMzYiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jb25mL21hY2hp
bmUvaW5jbHVkZS9hcm0vYXJjaC1hcm02NC5pbmMNCj4gKysrIGIvbWV0YS9jb25mL21hY2hpbmUv
aW5jbHVkZS9hcm0vYXJjaC1hcm02NC5pbmMNCj4gQEAgLTQyLDMgKzQyLDggQEAgVEFSR0VUX0ZQ
VSA9ICIke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdhYXJjaDY0JywgJyR7
VEFSR0VUX0ZQVV82NH0NCj4gIyBzdXBwb3J0IHRoZXNlIHRoZXkncmUgbWVhbmluZ2xlc3MgTk9Q
IGluc3RydWN0aW9ucywgc28gdGhlcmUncyB2ZXJ5IGxpdHRsZQ0KPiAjIHJlYXNvbiBub3QgdG8u
DQo+IFRVTkVfQ0NBUkdTIC49ICIke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycs
ICdhYXJjaDY0JywgJyAtbWJyYW5jaC1wcm90ZWN0aW9uPXN0YW5kYXJkJywgJycsIGQpfSINCj4g
Kw0KPiArIyBGaXggcWVtdS11c2VyIGNyYXNoZXMgd2hpbGUgYnVpbGRpbmcgbm9kZWpzL2Nocm9t
aXVtL3F0d2ViZW5naW5lLCBkZWZhdWx0cyBJU0EgaXMgbWF4IGFuZCBpdCBnZW5lcmF0ZSBTSUdJ
TExzDQo+ICsjIHFlbXU6IHVuY2F1Z2h0IHRhcmdldCBzaWduYWwgNCAoSWxsZWdhbCBpbnN0cnVj
dGlvbikgLSBjb3JlIGR1bXBlZA0KPiArIyBTZWxlY3QgdGhlIHN1cGVyc2V0IElTQQ0KPiArUUVN
VV9FWFRSQU9QVElPTlNfYXJtdjhhID0gIi1jcHUgbmVvdmVyc2UtdjHigJ0NCg0KVGhpcyBpcyBk
ZWZpbml0ZWx5IHRoZSB3cm9uZyBwbGFjZSBmb3IgdGhpcy4gIFdoYXQgbWFjaGluZSBhcmUgeW91
IHVzaW5nIGhlcmU/IENhbiB5b3UgZ2V0IGEgZ2RiIHRvIGlkZW50aWZ5IHdoYXQgdGhlIGluc3Ry
dWN0aW9uIGZhaWxpbmcgaXM/DQoNClJvc3MNCg0K

