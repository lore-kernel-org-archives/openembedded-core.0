Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B81C02197
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 16:06:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.15915.1738771610000276968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 08:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dN56cFgj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dN56cFgj;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NyH81bdgUrT6Q+Y0DI71hvxdRlBPTVh0QP9SRqzUhMIX+yIsTWaOYKNUlgbu5TMVWopD1AkIHSlhi56GLagSxyiTaxichZPVWNrTZswA6KSfiK/sygDOdEoUkff7z9l4wOZNLei8xHfO7HqpenI34PZDpntSmqLap2VB7t0DJmvCpzTJhgzQwgkvLSPcAgDVC54cfRyH1DI7tUzRWUHk+VzQ+UFPHzY1K7Yl+OCs5uPBoi9vm8zuQlXRKLXU/XI5llWXBK6o6rYsKmgvBDZ0elelDUjkx9KgpOsZTsqV5tAVoOVLQMBv4y2DOCozs3dHTYfC11GWdTNDkf+Rt5kzIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyXNsGOI7pX3vYqgo9gD6Fei6nu8AJOzy9sQzD+S7yU=;
 b=r0h09F8RfB4OJCNF7FX1wE7hw5+ug2xBrggNkp+x6sxoXqG9z7+FJJi9GrdTy5tbJyOtkErX7fO3dl8cCLHo1kiZDpBILeeuXCUA5s9w0ZU9GRDsA/GuBEyGFnL0GJ69EsDWkL7jrGs5qafoQa5K11wEL0/QFNMH/aggRT9JkzJYYtS52W/P/ePNMpk8IEZL8d6munzAFDC/0hGU8i77YaOfNG0Df7EkCsvF7xVvxc6D2OdxDuVU1PblSn0ZfeHU95BUt2CY3NGEMpvUKnSj4RdvBJT7MOoMsMB0gNygIJJXcJ2Lddk/rXPT3fTmoGGtb2ZE6T3eqZH4f+8tAw7YRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyXNsGOI7pX3vYqgo9gD6Fei6nu8AJOzy9sQzD+S7yU=;
 b=dN56cFgjsPZatfa0AarFl5eZK1ZmlAVlgcByaLWyECMTQzBtuvU+pp09uOvsB9jg6b/4OFML8sohsSe9MqdU3eZzpvdIXbiQOmB7QIasRruHfU94BCPXGMtGvBYP4MNVEejLE9yBlfikGmZO/NvWlG+k1vA/hZPADWFqeZPoZtU=
Received: from DB3PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:8::26) by
 AS8PR08MB6438.eurprd08.prod.outlook.com (2603:10a6:20b:33e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 16:06:45 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::6b) by DB3PR08CA0013.outlook.office365.com
 (2603:10a6:8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 16:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Wed, 5 Feb 2025 16:06:45 +0000
Received: ("Tessian outbound c79bb2535b53:v567"); Wed, 05 Feb 2025 16:06:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e0f19716d459a5c
X-TessianGatewayMetadata: LYMQGegSlr3sZQPDf/rrq7SPMiyI3uQ9y1m5zm/xMJ5z1egWk9iCrCupwrLzGnRy2Sac7we5F03CvwX+UKWZPkVQhYsfvuksCcAHfN7Ld/KJFVGupeZKX7hPyXtik5ZL9BV+WiQUNdrV5d4WRqqB10K9/oc3MlAczB72uexb1fQ=
X-CR-MTA-TID: 64aa7808
Received: from L101c66c373d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9DD9E14D-39F8-43E9-AA61-F00C182AE849.1;
	Wed, 05 Feb 2025 16:06:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L101c66c373d5.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 05 Feb 2025 16:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIM6B2jeU+SrtTdGc6pXlSUf34pi0MHmuhsGtz7KICZN3m75jgJuUF5Kls5dykOOO+ieA2axkNNEOZ4zSLo7+to6TobmCtc/JltgUn2iP3c8/yvmGdBxcEpu0MWt69hSFr/Oj9oFlltvsA3T4unGpUWw/mw4NWE6DAtlu99rmJoV0J6SBx578QcNHfIn0pg9+kwlmyLcm0JRVVbShguHCAHdcW84dShfHNkWrn15gF4sW/Ez+Qp4iuV4Rjdnngtyvg57RM1F/Y+vLJAIqaCh6/CDEz76Llde7DA/8dtWBaOHPxLkL4bPilXPTwCQlK4ep0W34MQzkbydQeTmDYT2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyXNsGOI7pX3vYqgo9gD6Fei6nu8AJOzy9sQzD+S7yU=;
 b=DT/XczHYwl4OU+IophPCCBtufoL6kTtZU+chE6crOpHfhhI7JaEfK6nUMHWbAIks4qGINLEK+M8RB2u2VasS8Ydq3IywlOIv+/ILXqR7w/iMMGl854lSigfIl1LuqWqZgYiGuh8EL3sH8e7DHwGA0TXAA5AX9aTtkd39Zv5jcu5f0SNcl7k4xm4cgzZSbqn6VTzsc2r4WxKLk3VowEwQR3BffV6Mrw4oEW/a9bNYeg30zirHCcz8RzW7VjfQnp31P7m9EqTcmm/loPPoDG8SiCEZMwIRoPgtBtm0oouJwQJ0J/veBhIlX7Fi8vSGDnRU08dXS1bAl/p5vJ5A0ailPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyXNsGOI7pX3vYqgo9gD6Fei6nu8AJOzy9sQzD+S7yU=;
 b=dN56cFgjsPZatfa0AarFl5eZK1ZmlAVlgcByaLWyECMTQzBtuvU+pp09uOvsB9jg6b/4OFML8sohsSe9MqdU3eZzpvdIXbiQOmB7QIasRruHfU94BCPXGMtGvBYP4MNVEejLE9yBlfikGmZO/NvWlG+k1vA/hZPADWFqeZPoZtU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8778.eurprd08.prod.outlook.com (2603:10a6:20b:5bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 16:06:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:06:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "foss@0leil.net" <foss@0leil.net>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Quentin Schulz
	<quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v3 2/2] scripts: add b4-wrapper for poky
Thread-Topic: [OE-core] [PATCH v3 2/2] scripts: add b4-wrapper for poky
Thread-Index: AQHbd9+AJ9CigYZHIUa9QD/6217KFLM44A6A
Date: Wed, 5 Feb 2025 16:06:34 +0000
Message-ID: <C5FA52CF-E739-41F9-9C85-D85EA7553EDD@arm.com>
References: <20250205-b4-support-v3-0-f8b1456ae1c2@cherry.de>
 <20250205-b4-support-v3-2-f8b1456ae1c2@cherry.de>
In-Reply-To: <20250205-b4-support-v3-2-f8b1456ae1c2@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8778:EE_|DU2PEPF00028D09:EE_|AS8PR08MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 551b56e6-e058-43a1-833c-08dd45ff1683
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UUtCclhCUVFWOFEwaTY1RjZpOHd6UTNmclo3bXZYaG41blE3K2VzOWdjWGEv?=
 =?utf-8?B?eEdIaEpzbmpPRTVPNmJaNWtzK3hmblYvWGZFUVZQL1dxWVdYYUZLOUxjcDNU?=
 =?utf-8?B?MjVsN2ZYMzh6dkpPSHNmZmhXenlEYzFnbE1JbXh3ejVUZGhVMlZNRk1idGZM?=
 =?utf-8?B?bnVTUWlWZk1nai9FR1Y4ankvSXZxd1owWE95N1JtbnZSOFgwT2ZLQ1FMT0p4?=
 =?utf-8?B?T2NGYjUvdDNMbUl5MmJKNXhXZVBBREYwRU9JSTVlTVhJRE5TT0dpeTRLaUVr?=
 =?utf-8?B?YUdUWUtjME5SclMxSU54WGxaRWF3TUxrUzZvNFhUdThKTzkyWmRuZDNjdys5?=
 =?utf-8?B?WkI1aTRIeVJ2WEltRzZXYm52TzZjMUFRUm5qZjVURUF3MXFEc0p0cjVJT1or?=
 =?utf-8?B?aWVXNFFKMGUzenB3aTdSRmlyM3NZUXI5T1d3TkIrVEFkeVd2VC9wUzRpY21v?=
 =?utf-8?B?cmRHZlkvM2RtcXFDRmpPRlVsZkxHTmJ4NXZCVGNxY1h2VjBlQzBwTVZhUEJW?=
 =?utf-8?B?SmdsZlF2U0lMemRBbmZwaE5RaExXRHNCVktwK216VlJmaEtrdUtZU1ZsTytx?=
 =?utf-8?B?bTl6Mmk5cXdmTWozdHMyV3dlVW5VbkpBMmFCL3ZRZmcxUFkwZXQ4NW4wMGtC?=
 =?utf-8?B?amh1UUZHTVpoT3p2N0Fad3dOa0tnWFBUMUVEeHVxVDV3MjVaeHhDNnIydzJa?=
 =?utf-8?B?Y1p3TEhXRnMwa2toQzZyNkhpTkhTeFZqNWUvdVFVOUljeG1lb3lkVzhQS1NX?=
 =?utf-8?B?b3lTcFZ3OUVWTzJwdjFKcG5NdFhUV2wzTFZtNEJtNFVrOUlITmJTWFp6VXBw?=
 =?utf-8?B?WmI0TmlYOENlZStlM3pVUDhmdWdQdm5LQng5M3dGUFNXSzlSeWF6c1BIeHRR?=
 =?utf-8?B?VUlxTFE5a1lGNWZTZVliUG9mZ1k5ckM3cjM2cklGbGpwTU1NQkpjOVJ6aUZZ?=
 =?utf-8?B?cDQ4bGJDV3liU3dmSlhUOFpEMjd4eE1mN3paWjg1TllkTVA2SURmWTY5WWhE?=
 =?utf-8?B?Q1FYc2IxbU9SaWttY1kydGpIVm5zZlFWckFvT0RRYnF2WG5hSzg1Y3REd2NP?=
 =?utf-8?B?aE12VFg3Mk9mdXR1RFd3SzM3bnp5U250ZVBMd2ZrbHEvQ0RSeXpER2phSUlv?=
 =?utf-8?B?VDlwNjRHQ1FEemE4UUNDWnBGVnBma05VVmpTOHlhWE5DN0JhUGU4c1ZNb1pQ?=
 =?utf-8?B?U2JNMHV2c3BTMXlqQUYzQkVxd1NPVFQxSjZWaDBiTm52WWdhL09mMS83bTYv?=
 =?utf-8?B?Yk5sR0lWNTV4Q3REbXMwaUExYzJxb25uZHpSNDM4SW15VmZFMjE4MjBTSzBa?=
 =?utf-8?B?V2dUSnovY0hKVTJ3K0dxeDhpakxQN0x4MXRFK1VqV2VPeEdXMk5kbHJGRVdy?=
 =?utf-8?B?MGNtOE83eTlGTjVsbkpXNUwvQXVQRzFLMEFKY3U2SXZpTTI4aW5hbzFPL2k4?=
 =?utf-8?B?bXh3a1o3Z3ZPd1ZzZjY1cW03bGw3b3F0Wk5uRFlocVJrdVVWVmsrWllEMUxv?=
 =?utf-8?B?RHpmZzc3S1VUcXhCbnZpZmhpYWp5Y3lrdjZlRDcxdGs0bTdWYnNIcUd5ckV5?=
 =?utf-8?B?MmJvNnA0Tlloc0ZnK0FaZER1WVRpQzB4SFBqWkhpS0dORFh5REV0aUkzWFNB?=
 =?utf-8?B?REk4RytDQWhLdlRReWRGNjZkZXR3VlhRdHFMWXFYTkZLOFV4TzNxVkdybjNY?=
 =?utf-8?B?MDNpOEFudVlTS0E5NFNqUFlUeUo0VEpKV1cvRHEyKzJGa0Rya3g4MUxPZzVP?=
 =?utf-8?B?dmVhME1HT0pwZnZGcUNOKzNieVJ3Nmgyc3dleUxKREVNaEJKYjF1VXBlVG5s?=
 =?utf-8?B?YWczNVArYitIaXJvOUwxNmk1KzNVRCtIZlVGRTdQcW9sQndKNXVNL3ZscTlP?=
 =?utf-8?B?RHZNVjA2emxJOG11YXZzdC8xbWtiNFExQ0ExSzNsYzF5TE5RY214QXB5MzN0?=
 =?utf-8?Q?eqHuTuBNfJUHCqAqVu5EMPVwLCJker+w?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A095F08D86998A4BBEA889BB580EB40E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8778
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	be814bc2-6b38-483f-d7e6-08dd45ff101a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTFZRDcxNGduZUFnRU9WT3ZFNGlWbW1Vb2l4K3FvRFh6M0ZMVmxielVQbmNy?=
 =?utf-8?B?bFBKMFNjZUdxK2dmemhoV0tnMm9GK0V5d0h2SVlnZ3lVZ3J1dVY4Nlo5blVX?=
 =?utf-8?B?OTYwZ1FLMGlxQmE2SjVtcGhiRW0zekZRY0JVQ3JaTjZNZWdtaCswMHhsWm56?=
 =?utf-8?B?KzZMbE9RZU9pakJpMkhBWUJtelZ3UmV6MDRGVWFWblBNanY3UkF0U3ZpSWtF?=
 =?utf-8?B?ZFVBUlgyOExOc2xOYlViQ1l4Ni9xN3hSSG9jUGNtMlhqV1E0MGtGTkQ2aUpP?=
 =?utf-8?B?OVMySWhXTGFmemYwY0k2QVdlbmNkb2RJRzVlSks0S3RDUFlaYTVhckpYOHlm?=
 =?utf-8?B?U245YVNPbU5tNU00T0dLdTdRQThGSnhVaUNNMVFValBKd0ZVNjRXQk4vdEVX?=
 =?utf-8?B?SHRtYkkyZUxNL0dPYW0zbXpQM0toTnMzc1BITXJYbVp4K2gxTFUwYTEwT3Ft?=
 =?utf-8?B?Z3diMXdkbEZTNWZZTFY1eURzNS9mZU5MWDBEdVZzeHRsT3BYc01tejV3UFFr?=
 =?utf-8?B?ZTJFdXlLd2hpd3djN24zenhTc3BJd203ZWMvek5tRmwra0hpLzR2Q1hPT0xh?=
 =?utf-8?B?dStuSU82SW1jL2Zqc21qQnlxZ0oxMEQvVUdoc3dQeUx2YlpRWS9YRU9aQWdZ?=
 =?utf-8?B?bTdSVFpYRUFKUll5Z3QzaWdrVzNIYlZxblg2L0JXQ29pTUxscnMzL3ZXazVM?=
 =?utf-8?B?YlB3Y25OSTMxaVVaMHFOQmwrNWZJbTNzUEVHdUFEanVJWXdmVGFGUmxVYUQ1?=
 =?utf-8?B?UTVyYXIxb1lrSUY1OGp1TVp5VWpqMUFvd2c2WklNVlhiR3V1Z3dqRzJHOENW?=
 =?utf-8?B?TmUvV3ZndE1vTjhhQzRvMnVKbWVJKzFBNkJGeVQ0c2xEazZXSVh5K1g5WkRp?=
 =?utf-8?B?MndWOFByRWtVbkpMdWtiUEZrS2t3TzdZUW9nclB2TGkwY21LelkwdndSNEUz?=
 =?utf-8?B?aHNTanJzYTd0aC9rdW52c01OdTBKUlhWVWVUcUdIdUhjbSs5MnVIVWZ4UWxw?=
 =?utf-8?B?NzRIY0pMUXVpL1Y5MUF5S0JZM3pFUGJBN3Z6cllIVk9PUXcyWlY3SzFQMFpM?=
 =?utf-8?B?OTlFS0xqakNDSFJkbnFYMlFwWTBOM3ZPaXJvejNjRmozQzdZKy9IZUJVU20y?=
 =?utf-8?B?Z2NWYmE5aVRKQ3Vlb2F1blBBOXhSazBVT1BiZFBWS0hqbTJxSjJyRlR3Y3Ry?=
 =?utf-8?B?dXJuZnhDK1hhT3pnMEZWK2VGRjlhM1kwS2RsaHd2Vlh6eEE1RGJaa2FiL08r?=
 =?utf-8?B?VEE0OXQ0MmpMNFdKSFhySjM1U0VzRVNycWE3Q05kcVcyMDYxc2VJT045WG4w?=
 =?utf-8?B?N28vcjBWa3FLVGtxcWMwRUdydmFiQUpLMENQRFN4V0dHTGlWdHJTT3VGclR1?=
 =?utf-8?B?RnlqUVJxWit6SVpORWdpeTdnK0Q5L0Y3Q2RkT1lQY21TUEN0TjJpdzVUblVS?=
 =?utf-8?B?eWJHZTlaZDFCRFBrb2FVN3dEbmk3TmZWYXc5SzNmWnQzcnBqYzNOVHp0cTh2?=
 =?utf-8?B?Mks2OWs4OHBLeklYOHZoVFBOVnNzcUpVdElMejVFYnk2dEVhTGdQWW54YmhQ?=
 =?utf-8?B?TXlmL3prV1lEL3pHMmxFaTlobDBnZlZKejh5TUl3VmZZaU5HZGptWXZVQitW?=
 =?utf-8?B?VkM3eFFDOGxjYVJQQ2dTMjZHdHNoNTJaZUZZdzRpa2Z1ZG9KWTQxYjlBSERT?=
 =?utf-8?B?MldTbEtsaG4rR1NrWW1TaEJxcXJKQzNqR2JweThMWDhYd3pUa2hKNjlDU09R?=
 =?utf-8?B?UHJ1UGV6dTNMRkxvQlYwSk9hQ2UxdVVzaVZQLy9uZEE2bW5jTmtTZUFJbEZh?=
 =?utf-8?B?S0JyVGcrVk94TVJ1UXQxcTRjUjZlbWlRbnM2cHNNdWFibWUyRVVjS2Z6cm55?=
 =?utf-8?B?eTlOdXpscDliSHBWeG1EamlZLzdYaTN3WlYyN1hWcW9CS0k3STF2TEVyVWo1?=
 =?utf-8?B?ZERGOFhBYWNrdEpyVGVRMlRwanJDTHQ3REhhM1kvK05PcldLQ0thc20rOTNG?=
 =?utf-8?B?Z0d0ekJXWVlRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:06:45.3173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551b56e6-e058-43a1-833c-08dd45ff1683
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 16:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210864

DQoNCj4gT24gNSBGZWIgMjAyNSwgYXQgMTU6MDUsIFF1ZW50aW4gU2NodWx6IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxmb3NzPTBsZWlsLm5ldEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gK2lmIHN1YnByb2Nlc3MuY2FsbChbIndoaWNoIiwgImxzZGlmZiJdLCBzdGRvdXQ9
c3VicHJvY2Vzcy5ERVZOVUxMKSAhPSAwOg0KDQrigJx3aGljaOKAnSBpc27igJl0IGFjdHVhbGx5
IGEgc3RhbmRhcmQgdG9vbCwgc28gSeKAmWQgdXNlIHNodXRpbC53aGljaCgpIGluc3RlYWQ6IGd1
YXJhbnRlZWQgdG8gd29yayBhbmQgbm8gbmVlZCB0byBzcGF3bi4NCg0KUm9zcw0KDQo=

