Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A268FCCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 10:41:04 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.17])
 by mx.groups.io with SMTP id smtpd.web10.5612.1761129655509952641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 03:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W/gGD64D;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W/gGD64D;
 spf=pass (domain: arm.com, ip: 40.107.159.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cIrEjzgRD0/ec7BB64WLz5m7d2grRFyMHYV2fEEKksZEzXpbej3t7bE+dSrhxh2sKb55F3/AAnp73jeh95f7SNEWnq17eBw+G+SvnhMdDDRoLHRzwwJJPlP1U+agfrnfS+eQUNtBk5UusZfXiOr1FCcRq0BcFiezfZyck223e59UlBYheX3/+MRzZ2BrRNWN7aif50rToV5Uawk2DlsKuyEgOULERUdNXEkxxIqfJo6gbGNiMWqzI4fkeE1n6WHF3Y+q6P2UQthmgL4FjmIqF/h5bywqRR6WoANrBkyE/kjYt9mdCTEqXtlCw6ZCs6fWm0pBnZhByTRJbGFfonJcLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RbOABhbbyHgKoZ01JxXhROlz2PRWEYGuDpeB9uGCJ0=;
 b=x2y56b+Wii7zTmEzIL9M6RQfOyDIZQJCKeAXiKgU7h+CyMmGoqWhwN+aFvFGMdDrp2VmKbcxBlS0wYW636gZEnML4q/FW4y4yBhP4eDQRg7gJF7ViC5roCdIDCAjPdnTF5OqF+u3yaNkoDimWv45BZpUuvQmytp5fISHpdKp1KGbMFJbaPFjbiHEpambKyNwNyl3fnl64fA+LjnvBASkXXexpxZ2Pr1lHkhq9QRDvVuat5H7mECvbVvSlrFZ2+1RKI2loiyTVkOVYsxHVMaTKSL5AI1w8PZFKgqRImpNcp7JlE0GT3uieBFfSdy2TIsVEIeCEfGRJurSohLNeYmr2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RbOABhbbyHgKoZ01JxXhROlz2PRWEYGuDpeB9uGCJ0=;
 b=W/gGD64DayXrw28bJIjwtH3kwx6/u3uKjpnFmISI5OXf+Gip2U2POSvRAtmVL1rKyu0xBS86l50zzTSi4GOlAZGuMixqVmLXdUrtSIlaQhImBPY+BvZ0LaWXKcmbnGqQpDfOxNwegs3RgwbqcYJo5FrtNW1cKT8ieeiycNWNgF0=
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by VE1PR08MB5661.eurprd08.prod.outlook.com (2603:10a6:800:1b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:40:48 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::9a) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Wed,
 22 Oct 2025 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Wed, 22 Oct 2025 10:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJlnaeoVcMONpNw/mm6FX6lNM4GbGP1C1vjnLq4QF3bmLLb1I0G2ugiIiJa98ql4dqq3987CKjpVWfQH9KzgmfVrnw6p1G4Z88JJPaeCkLnNFsndW/qob4RThq3D2Y315iva7fJsw0Zuq7gcUWxdcSOH0MnJHJhoQVW7qUobmCnIvPT219lLfMhapg0NdPK4AMV2SMQ/i00c0aldojPJhpcTJcUXx99n6vpY8BGbJZUtoD2Sl4Tp+DA8H/S9AU7cLnED4SUH6cB9VLbtMuTiLES8MwrmZsqRESG7jcoVffLmhblMO7fuYxb8Ib/17UxsnYyrpQSdV0empWHOgmudFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RbOABhbbyHgKoZ01JxXhROlz2PRWEYGuDpeB9uGCJ0=;
 b=yDwrD+ldlgKIHNmhrIhT83RmpaXRB1Gxwa6YoCSnRrTZ7hGUkhFzuw5AgeVPF6l1uXW+9oNP6iRHDuYM+GqXDQUWEySvuSfRM+GkFV2cbqhxGCY2ovG4da5ZDj+eEVlL8EzDs0ATiCC505scXNDrQFOpA4yH97XtB9yX5W95HPeKhb7JlTRU8HD02BclIMaXRA3JWx3ZE4g9/sGb1nKi/OKUXEk4TL3G4QFIFO9XL+3+WSn7KC2HVAf/cx7cm3/7D9VDRN0YMO2IDvoV3+5oQj1flH/Kf8Zp8sKEYK2J5k0Eiurr9eko4ef7fbA7rGPQK9xz9EHS5JYPFgzBr75BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RbOABhbbyHgKoZ01JxXhROlz2PRWEYGuDpeB9uGCJ0=;
 b=W/gGD64DayXrw28bJIjwtH3kwx6/u3uKjpnFmISI5OXf+Gip2U2POSvRAtmVL1rKyu0xBS86l50zzTSi4GOlAZGuMixqVmLXdUrtSIlaQhImBPY+BvZ0LaWXKcmbnGqQpDfOxNwegs3RgwbqcYJo5FrtNW1cKT8ieeiycNWNgF0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6517.eurprd08.prod.outlook.com (2603:10a6:20b:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 22 Oct
 2025 10:40:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:40:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: support template files with
 dots
Thread-Topic: [OE-core] [PATCH] systemd.bbclass: support template files with
 dots
Thread-Index: AQHcPeRc0dP3t1V/l06ILlw023v/ArTOBKgA
Date: Wed, 22 Oct 2025 10:40:12 +0000
Message-ID: <3FAF0AA8-5867-4822-9D3F-BFA43D40EA4C@arm.com>
References: <20251015145936.857490-1-jason.m.bills@linux.intel.com>
In-Reply-To: <20251015145936.857490-1-jason.m.bills@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6517:EE_|DB1PEPF0003922D:EE_|VE1PR08MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: f344dcf4-4474-48d4-d14a-08de1157760f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dEVUMFN5OWhzQyt3SVZLUXpXS2VSQnByUmVwelA2bmdrTnVXRVZOYnhXZHB6?=
 =?utf-8?B?dzZ4U1NHYnk4MWdiOXZ5QWpwNjgwT2FPRDQ1eitTTzYveVdkN1E4c0k4YXQx?=
 =?utf-8?B?dEpqTUJoWjBIWitaZnFtRm56RlFMQ2EwYjJNMGdxVDkwaHcxT1FUTVhvcUpy?=
 =?utf-8?B?a3hGSGFSVUZ0SFBXYUkzZksrTlhBQUc4NEZ4bnJHQ0RDRkUyV3dTNGg3eHpN?=
 =?utf-8?B?TVM2M3pjWjI2eVVSaFk1ZDRWa2xLRlArbUUxNHFHSzJQY2ErNFVCV0hMMStT?=
 =?utf-8?B?UDJmWHJFV3c0ZWNVRkNLaCtkRS9yWm9YcWdvMksrbjJQOFY5VndrOUEvdEZK?=
 =?utf-8?B?OEpWYTZ2SWs5TkZBYzRzbTJOeWsyTnk1TUQ4RTFvckhsNlJSWkdqa0pPSDZK?=
 =?utf-8?B?RWZXdUg4bzdVZ3MrWnFRRkxudkxDMDI5K1krTjE1ZHhFMnVjVnFQOFhLUlZk?=
 =?utf-8?B?dzJwWFVQT01qSnVuYlgxMlNEaVFrbCtZZGpMMFJYS0N1UWNjQ3ZrSnRpcjlR?=
 =?utf-8?B?SW16WnZ1QzI5QTdCTWw3UC9jU0JGc24vV0RJR2NYQklpT1phQkhrWnN1alpv?=
 =?utf-8?B?K0lUTXI2aFNxWXJNRFBSb1kxaVptSnFZdm1PY2xWOUt1NlBZZ2FCMHpoa2I0?=
 =?utf-8?B?bFFFNjFidnc5THQ2MU03SzRKV1d0V2pHY2ZvR1ZYd1BxRUpMZzhwajcrbmIy?=
 =?utf-8?B?R0p5K2pEME83ZUVNRW5nd1AwdExKMk5SWkxFeFlTN1c1TlJXaHMwRXdiYyt5?=
 =?utf-8?B?RVpCQlhWakdpNEdaZXJoK043VlQ2WGRaeWtHSTVpdFFnQ0doM1A4VkRGTFpi?=
 =?utf-8?B?MEgrankyZHJFKzM4QzJreDR2U3RBYzAvWUphNVBJWjhselJPUnV2NVU1RkpW?=
 =?utf-8?B?bGlUbVJ5TVF3dDMwUGFPKzFmNEh3L1pOY0ZNNFB5dndMTnBndE1ST0ticFZr?=
 =?utf-8?B?SVplb2tiRWlBTVpoZjVCRzB3SFYvdjdXZElxNXpKUGR6eHE1Sm0vY3g0RmxH?=
 =?utf-8?B?WkZybWhCWWNRT2FieGY1Z1YyaDZFTDRoWXZ1eW9WajZJcVc4aWNQWVhuZ3Jl?=
 =?utf-8?B?ZlFRT0R1S1lSWmtXVVF2M3dNYVFjQmlyQ3hGTzdlTzgvbmo4cm04NXhtTWdV?=
 =?utf-8?B?Q2JBc1RxZjMxcFVWS1R2TmtpVWRYZUNRZXREa1dZVkZIN3BvYVBqYUNmQkhw?=
 =?utf-8?B?a1B6YnJQZTlIR2NURWxwbjZkSk9vN1FvTDlwMFU3UnRtYzZuZ2NMSzNRNG1U?=
 =?utf-8?B?QmdQdzhjSDBJb2I2R29qb2w0NE1yQ0xScW9ERTB4bnUvMGlXNDRVM1pyc0xj?=
 =?utf-8?B?Rmx2RVh6amJLWFR1MU1OV0dOYnVFN1lIejA3eDZDajRwQWxsS3E3OUhBOFdY?=
 =?utf-8?B?WnlzR0V5S1I1azNlZndxbUQ0b1F1MzZydjNHb0FFODNZQXl4aWdpeDA0cE5G?=
 =?utf-8?B?SFNyQzlVbUE1WWcwNnZDdTJ1NHhNcWZPZldxTjA1NGV3RDZvVXZPcHFIbGQv?=
 =?utf-8?B?WkdQQWtIVEU0N01vT2ZDVDI3d2NIMjRscXpwQks3RGkydzFaU2dQUDQzOW56?=
 =?utf-8?B?V2FuREh3a3RjMXd5SkNJd2NxQ0NVVGxidkhiTGVSMWQ0enlyNFhRYjNNUHJW?=
 =?utf-8?B?Yldub1RuZU9WZHc0N2VVeWdYKzB1K1phc05RdWVOTVRFMm5EUSs2QzBRd0Zm?=
 =?utf-8?B?VFJmRWFRKy82cjVCRGw2WVpCQVQya0R0Wlp3UWVZWm5RcWJXTHc3SzluNDVX?=
 =?utf-8?B?NzdRS1pnaUVZRm5wODNra3FEYTNQV256MVBIS0V1WFAxM3BXa0J1OGdKRzJF?=
 =?utf-8?B?TTZpeGdpa0tSQ2dWdVNyTGZtMVJ3RjZFbmpQb2JtZ1o2QnVuUmt1V0RsZkh5?=
 =?utf-8?B?OEZZckNPdm03cnF1L3dQK3dNZmFJVjJYYjI0YXY5cFFBd1JTaWxPMVhMamI5?=
 =?utf-8?B?VmRENXpmTUhrRVRqczFhR1kvVGRDWFZRWHZtRXZRV3dRSHpxQ2E1OGJlOVpr?=
 =?utf-8?B?MUZRZ2RCd0tlZCtlTmtBMEI0ZFFSZHNac2lvbGVPVXNTRXdKUDk1STJ4OUt1?=
 =?utf-8?Q?djs6AP?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <153DDD5A3435F54BA234C2640C9C6568@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6517
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f18dde3-02fb-425b-77d3-08de1157618e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bi8xR1V3b0Y1d1JSWFpOMTNnVUtPZWpGSXNCdnp1UDhVeXZySHYwM0w2NWkw?=
 =?utf-8?B?NFpvVkdacTZ1aDh4bmhjSHR0Z1ZyS1ZpbGRHZFZjTzFiemtlUmlNQ28vUXZx?=
 =?utf-8?B?OEZ3bldVL3MwOGtNdXVmeTBFc0pKeG1CL2tJeldNV09hTFJUc3A4aDh4My9Q?=
 =?utf-8?B?YTVmelgyRTVpbUNoTEMzSWFIbHFOSGpYUHFkTWowOHRQNkhqOE5VY0tnWUJv?=
 =?utf-8?B?VU1qdmRBaXJCRndpOTRCUkFDTmo4UHQ2SVF6ajliZGYyY2xReld1bWVvMysw?=
 =?utf-8?B?SnVRWWtlcE1QYUtBa3FScm1wM01vNTlrYktUTjNmRTZ6Q2FMdXB5SjM0eHhY?=
 =?utf-8?B?RllJcHVuTWhzaU9kVU0zbHZuM2NmYkY2cG9pUHZQUW9VRWlZcW5jMmE3eUJO?=
 =?utf-8?B?WkgwMXVWaGh5dWdzRHB1R3ZqdXFiUlBqWDVQaWVSa1BqMEEvZDZkMUJIWFJY?=
 =?utf-8?B?QW8zKzVUekNmUkMrbE1NcUZLYU1JeURuTVpvL1JXUEFQblozNlJxZnREMXIz?=
 =?utf-8?B?bVVXcUNIS0FLMjJiZXlmc3ZITUxnQVZNV3hiSzVKZTdVWC9UT1d6MjE5dThy?=
 =?utf-8?B?elRlRlQwUEMvYlNHWnVBc0hjK2hXbUwxb0FTV1dLaEVOM3c5SG5ISGpvbWZl?=
 =?utf-8?B?S2lBL013QkFhbzNPZmpOTjRsS0hCbHpVY0l0RERaTjRqLzhndGR3VThTNmR6?=
 =?utf-8?B?cXAzMU1MR1BvS3Uzd3VRblJDY3VXUUZScDFNYnBPQUdhZUh1Tjhkd1hHSFhJ?=
 =?utf-8?B?THplbTRJZUN2eVBJZlRIZmhVc1VOZTczeTl0VXNka21HSXdBR0lEY0dwRUR2?=
 =?utf-8?B?VGtnQUZyN2FQVks4TkRFM3dmdklJT1NYOXk4WGdybWYrWGFJcVpIZmlkY1RU?=
 =?utf-8?B?aENSU2UrNlF3YkZWM2g2Ym0xbGdmYkpISDVGbW5oaktneEQyVzExakhxc2tr?=
 =?utf-8?B?Z2hhb2Q2OHhRU0p0NmpXdWF6VnpISlhaS3dTbzl2Z1pDMTE5RzQ1MmFUcWth?=
 =?utf-8?B?SHo4VHRkSWhLZUw5SGZKckxQSTg2RHA1UWdSaFErZ2h1VjJmbHJKbDY5M3Zy?=
 =?utf-8?B?ZTdqeUZBRnE0ZURKMlZDajA0TWo3ZVh5S2d0cDRoNjdQNFljT2VYQXhTUVd5?=
 =?utf-8?B?bUhvQkxBYlNYdGoyQ0tOUEZOOGJmT0M5cDZmOHQwak9aeVA0R0x2UHNxcHg5?=
 =?utf-8?B?LzcrbnQ2RW9TWTVVbDFjQTJHcHN1eHBYNnV4Q2NQZzd3N08wdzhQcEp3MTdU?=
 =?utf-8?B?WGRIVTczaWt5ZWVxSGRhR0w2ek5ZZGdCUVI4WFY5VEVWeGR5ODFKVEF0dm9j?=
 =?utf-8?B?TFVOaGdwckdJa3pYRmpybk5UTlc0aW83cUJ3ZnkvcXBNRWJTMW5MczBZM2Q3?=
 =?utf-8?B?UTZJNVlvb2Vmc1ZXZUpkNkx1MmpGZzlrQkdjR1dCamVabVZEd0xOeHFOUUp4?=
 =?utf-8?B?MFVLZktNdFV6YURLL0dXL0F3MnhmVXRZbC8yM0NsaXJBWVIvWDBwQzdCT1Bv?=
 =?utf-8?B?NHJSVmFoMlJ2WktnOFJuK0FwZFErSUhjWTlxS3JyZ0YrTkVrM3RFeHBKdVRr?=
 =?utf-8?B?Q0lTdm52cEV2Tzl1aHhXTkl5WTVieENMSGpPb2pSNGtxbUtmYXBaN3JiNk5R?=
 =?utf-8?B?bVdER3pZN0lQVHBNcEFaUDAyR0lCZjdlK2JkL3VoU1p1a2hQYVhNa2tTWkFF?=
 =?utf-8?B?b3p2bHQ2UnlVMG5OSmloTlJSblUwWjFiZEhzMk1Ienk3L2c1UnJETEFoOVdS?=
 =?utf-8?B?NDBRdTRtcGZabU92NUE5dDVCa2xJRjNHWGc1NWlpR0NSYW40b1Z4ZitWRDZ1?=
 =?utf-8?B?RWROWDh0enpiSElUWFNzUmZYSjBUeGZoakNZaDJGRTIvUGJwRUdDSGJXMWpl?=
 =?utf-8?B?WlZVd0owK1Vvd3ptdkltN1oyQkhmN2ttK2lsbkZZSDFUNGxIYVhZMEFxaGlG?=
 =?utf-8?B?TmlITWNiUTZkU1liRzFVZEpYVDZOdUNGc1BEemRLUkM0NEdqcjJ0Kzc3K2xJ?=
 =?utf-8?B?OVY5Q1cvcUNnd3ErV2x2bmc4MlRZbWFwZEQwL2dBUHJvS0J2eWZNTDFiNXVD?=
 =?utf-8?B?bkJOdXQ1dnJ2Rlg0MUIxZmxpQlIyYkJVVmtYSmxHRDdaZS8vcldBUnloOC9H?=
 =?utf-8?Q?XGYE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:40:47.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f344dcf4-4474-48d4-d14a-08de1157760f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5661
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 10:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225184

T24gMTUgT2N0IDIwMjUsIGF0IDE1OjU5LCBCaWxscywgSmFzb24gTSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8amFzb24ubS5iaWxscz1saW51eC5pbnRlbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBJZiB0aGUgU1lTVEVNRF9TRVJWSUNFIHZhcmlhYmxlIGNv
bnRhaW5zIGEgdGVtcGxhdGUgaW5zdGFuY2UgdGhhdCBoYXMNCj4gZG90cyBpbiB0aGUgbmFtZSBz
dWNoIGFzICJ4eXoub3BlbmJtY19wcm9qZWN0Lm15QGluc3RhbmNlLnNlcnZpY2UiLCB0aGUNCj4g
cmVnZXggc3BsaXRzIG9uIGFsbCB0aGUgZG90cyByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBw
eXRob24NCj4gZXhjZXB0aW9uOg0KPiANCj4gRXhjZXB0aW9uOiBWYWx1ZUVycm9yOiB0b28gbWFu
eSB2YWx1ZXMgdG8gdW5wYWNrIChleHBlY3RlZCAzKQ0KPiANCj4gVG8gY29udGludWUgdG8gc3Vw
cG9ydCBzZXJ2aWNlIGZpbGVzIHdpdGggZG90cyBpbiB0aGUgbmFtZSwgdGhpcyBjaGFuZ2VzDQo+
IHRvIGZpcnN0IHNwbGl0IG9ubHkgb24gdGhlICdAJyB0byBpc29sYXRlIHRoZSBuYW1lLCB0aGVu
IHNwbGl0IHRoZQ0KPiBzZWNvbmQgaGFsZiBvbiB0aGUgZG90IHRvIGdldCB0aGUgcmVtYWluaW5n
IHR3byBwYXJhbWV0ZXJzLg0KPiANCj4gQ29uZmlybWVkIHdoZW4gYnVpbGRpbmcgdGhhdCB0aGUg
dGhyZWUgcGFyYW1ldGVycyBmb3IgdGVtcGxhdGUgaW5zdGFuY2VzDQo+IHdpdGhvdXQgZG90cyBj
YW1lIG91dCB0aGUgc2FtZSBhbmQgdGhhdCB0ZW1wbGF0ZSBpbnN0YW5jZXMgd2l0aCBkb3RzDQo+
IGluY2x1ZGUgdGhlIGZ1bGwgbmFtZSB3aXRoIGRvdHMgaW4gdGhlIGZpcnN0IHBhcmFtZXRlci4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIE0uIEJpbGxzIDxqYXNvbi5tLmJpbGxzQGxpbnV4
LmludGVsLmNvbT4NCj4gLS0tDQo+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvc3lzdGVtZC5iYmNsYXNz
IHwgMyArKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvc3lzdGVtZC5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9zeXN0ZW1kLmJiY2xhc3MNCj4gaW5kZXggNWEwNTUwYjI4
Ny4uZmNkNDc4MDliMiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9zeXN0ZW1k
LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9zeXN0ZW1kLmJiY2xhc3MNCj4g
QEAgLTI0Nyw3ICsyNDcsOCBAQCBweXRob24gc3lzdGVtZF9wb3B1bGF0ZV9wYWNrYWdlcygpIHsN
Cj4gICAgICAgICAgICAgICAgIGlmIG5vdCBzeXN0ZW1kX3NlcnZpY2VfZXhpc3RzKHNlcnZpY2Us
IHVzZXIsIGQpOg0KPiAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlDQo+ICAgICAgICAgICAg
ICAgICBpZiAnQCcgaW4gc2VydmljZSBhbmQgJ0AuJyBub3QgaW4gc2VydmljZToNCj4gLSAgICAg
ICAgICAgICAgICAgICAgKHNlcnZpY2VuYW1lLCBpbnN0YW5jZSwgc2VydmljZV90eXBlKSA9IHJl
LnNwbGl0KCdbQC5dJywgc2VydmljZSkNCj4gKyAgICAgICAgICAgICAgICAgICAgKHNlcnZpY2Vu
YW1lLCBwb3N0Zml4KSA9IHNlcnZpY2Uuc3BsaXQoJ0AnKQ0KPiArICAgICAgICAgICAgICAgICAg
ICAoaW5zdGFuY2UsIHNlcnZpY2VfdHlwZSkgPSBwb3N0Zml4LnNwbGl0KCcuJykNCg0KVGhlIGFz
c3VtcHRpb24gaGVyZSBpcyB0aGF0IHRoZSBzZXJ2aWNlIG5hbWUgb25seSBjb250YWlucyBhIHNp
bmdsZSBkb3QgYW5kIHRoZSBpbnN0YW5jZSBpc27igJl0IHNvbWV0aGluZyBsaWtlIGZvby5iYXIs
IHJpZ2h0PyAgQXJlIHdlIGNlcnRhaW4gdGhhdCBpcyB0aGUgY2FzZT8NCg0KUm9zcw0KDQo=

