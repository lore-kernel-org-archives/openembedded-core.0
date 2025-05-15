Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C87C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 20:57:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web11.2073.1747342671889442520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 13:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TW34HIPJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TW34HIPJ;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G5O5J5h1IRrZCifvaT4ZyrBah3WUQ4IaW6KjiV9oggZknJ6EFlAJIMAKFl5eXGMrXNs379eoMcBXSBIyM317ULw7+ssxgGHmH9jJnM6RBd9WcZLVQUgQlCDS+RxnvxUq0HrpHkK+5/EjO5W9UGQbRZurKegVLw6WxNUJ8onKwUi+NNjyp7K4mRPbQpDSU0soL4sNN5AvleM2BpYYArq9bLZggVsw8Ak6AtBL35UntPbtmvSGGPsStfn7K5NgAw4ZP/jjTaoctsQFENdGFA+EEfke6wH/5XLp4heliv3yTGcKWrzbhQMMxWnyKogWiM6mwEwyy+YP+GRso3ELLYLHZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9f5JCCNIQcLKOOqQXrXhb9BKzn8CTkaGlMMRw6i+po=;
 b=A1fau/MJwDu1Yo1a0RyQzK3Tzhhn3ibqc0TCXsDiTGIALBU4GyRvZIHeV6G0A6EuAY+4dFzIFiRWpGkOVOFnTxrnkKf7aOIoaVFdxsChKN1G0sUwgHJ+GMdq22MNx9yuvxSyF1Dw7JeurQCBSplaxbDPJuBv6K938p5dfEA9iBtn57Y+DDwzDe+9FBydf61TO+icRb1c3IqW+0koiq9nNZ43rlwe3Mzvfr6cLPmL6F49sVMpKlf/rmXVi2tfXfcULkJB6MIHged0I0hn+4ZV4uhkLit+c4nAfma/bhkqYlceDEbliMTnOp0SCSa9APE8oB2HDRAxp2OQC0zhJNHJ3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9f5JCCNIQcLKOOqQXrXhb9BKzn8CTkaGlMMRw6i+po=;
 b=TW34HIPJa3SqtCtw4ijE9JA21FQvfXlNLxIHG5M7aLvYgcnSeD4g77ZSCXdA4Uf0BSv4hhMqU3keol4PCxXQAen4C1PxBDQfnjLIDVAF45bZk7AGHT/gE42paeeY8xf7iTFpKtO/FrQKjIPWVZCBM7oreOox8G+5YdBnNu8lN1Y=
Received: from AS4P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::10)
 by DU4PR08MB11006.eurprd08.prod.outlook.com (2603:10a6:10:576::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 20:57:34 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::c8) by AS4P190CA0034.outlook.office365.com
 (2603:10a6:20b:5d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Thu,
 15 May 2025 20:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 20:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5ILIbCP571PUOVZxK8LjxpIK00zvGPk6nWLycr9b0od4yHfNhStWhxAvWqEHGklrGP2iycgDYN4FBWd11rLAE0DcSR0aE9xIAEf9LodR9GlbbWugN5B5Q1RM1L43+3DiItgLiabl2elbDySv59PKdKOG69nAF/i2ENxC2TZ9HfyDz6UxyKcS2If8HOGKsoDXgvGR+Wa7gvuYkZE7sJ4q61gpFp/xXQDdIf6cNraGb/5KMPaR0qT0xhoOzrP911/8D+GvxyD4QDXFbBHBH2mc+4guMsE6RuHvxPM1gxxN8xQTrvzHw5fQtayYoRzJelSTgc126cUMrceSZUA7eY7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9f5JCCNIQcLKOOqQXrXhb9BKzn8CTkaGlMMRw6i+po=;
 b=HKEbu/9/DCnfHbRCbqam4GSAt8XjfV7jZfR6qYLgvB8Gs53oIvcIpDrOEprnYSiBIGXHHxCWIJpCuzZRktzR5aUkbkEWR6Tr8B/7VNILZG9z1lXId6dnOrhESYSJKy3Q4sVmV9VgPkBDSXRgLA2MrZLNIVbJAJ/IZIw3zM32WCmfGooVnKJ3X3wrdwtdLF0YgwyrgZW7U6vjy6wRyHvHPZNLifMo44/gwChjgPiChSWvTErktG6UK7cC2MdR2WOjkMahiw9G+BbUBQMvhpyKHGlq3dzN7HWtQG6hqBGSoZmm3NK/oNJt+ec0UDtaT27DxJUU790j69YwwU3JaMsm4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9f5JCCNIQcLKOOqQXrXhb9BKzn8CTkaGlMMRw6i+po=;
 b=TW34HIPJa3SqtCtw4ijE9JA21FQvfXlNLxIHG5M7aLvYgcnSeD4g77ZSCXdA4Uf0BSv4hhMqU3keol4PCxXQAen4C1PxBDQfnjLIDVAF45bZk7AGHT/gE42paeeY8xf7iTFpKtO/FrQKjIPWVZCBM7oreOox8G+5YdBnNu8lN1Y=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PR3PR08MB5562.eurprd08.prod.outlook.com (2603:10a6:102:85::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Thu, 15 May 2025 20:57:00 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 20:57:00 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: 
 AQHbxZq5ZISzQqXBeki2/byi0MF8RbPTsSuAgAAA5ACAAAObAIAAIHSAgAAyMICAAA5cgIAAFcmA
Date: Thu, 15 May 2025 20:56:59 +0000
Message-ID: <5979472F-B748-4ADE-B950-636574096C3B@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
 <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
 <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|PR3PR08MB5562:EE_|AM1PEPF000252E0:EE_|DU4PR08MB11006:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a99882-ab31-42e2-e456-08dd93f31d1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a29KQ0xvVkRydHA2NGt4aWFLcTZjYXZIdEpCRUYvbzAwMFNmKy9nVGhlVzZM?=
 =?utf-8?B?WTRxRnhMRUVPVU5hZUw0MHB1SWk4YTBHY0pQSGFPblpyS2hzL0FsWm1SRytk?=
 =?utf-8?B?Q3JWRU9ETFBDRFVXVTAyVnVJTm5qSWdyeW5ZZXpFcEd0dFFiSVFkNlMxSGlz?=
 =?utf-8?B?cWRvKzd6YWtTOUlteXFWRk1WZzJFR3gzV3BNMGFodnB6eXY5blp1UmlvMnJ4?=
 =?utf-8?B?cUdNY0tPdWpvNFArVFJER2tWOGY2NXlPUzNRKzhBL1JvRjRINWluTkkrb0Fh?=
 =?utf-8?B?dVp0QXBPSGljM1lrVGErRWg1R2l1UGRNQzRmZ3JhUGwzRDdwaHQ0S0xXNER5?=
 =?utf-8?B?Nm5BbThuaFI4M3VtRnB5dnNHMDVhcVlQWjhmVVBOZStmSkUxZ3RNWGpJZkdv?=
 =?utf-8?B?dkVLYjJQVDA5Q2xwVzM5M1FzdG5rVWhDMHBuSlYvUVlvaFhjSjQ0S0ZaNkl5?=
 =?utf-8?B?UFpaVHIxQUdxK2VQSE0yWnF5ZVlaZ0xPY2lIbnhBQ0xCQmIrVzdLUXNseXli?=
 =?utf-8?B?T2VZMEF6d21XZERMMm56ZWpDUG1ydUp0ak1mOXM2WWg1aEpUcmVGbFdJeEFi?=
 =?utf-8?B?WUw1dkdRWkpJaXRTWEFaY2JYbmhab0lySkROSmtZMzc3dUZleU1CRUdPdGll?=
 =?utf-8?B?M2pOemJIVjNtUFNiOVhqd29lQnVFQ2l4aDJCdlZxdW5XaEdhN3BJRFNsOERr?=
 =?utf-8?B?S2xoVFdYWnRlYk53RXJDN29XVXVycnpRU3BSSm5qeWlBdE0yV2xqSjc4b3FL?=
 =?utf-8?B?U3R0UXc4SWl3YVhKRTlmT1BuNnJhbGVzeHFDaVoyN1Q1Mk9FU3lESTNxUUhC?=
 =?utf-8?B?a1JqYm0ybHdWMkVIUmRzNU9DUGEzTC91Y254WWw1OXhJSGQxMGVSZHMybmFY?=
 =?utf-8?B?SllLM1I0Z0pob3FFWThHMUw0RzRNVjRJc1lPc3V6ZTR2MlNjNFVSSm5vdWZE?=
 =?utf-8?B?Nm5meUF0d0RRcW1jeEgwdkt3TUFHZThFUmZBUVZ6K3BoVFFGUlFmZ2VQYnBJ?=
 =?utf-8?B?VlNRQ08vTm4yU3E2UmZvbG95eDUvakF1WEVCK1ZjcjJNRCszVURBODM0WDhs?=
 =?utf-8?B?UXI5OVk5SXdpVG1qaHVmcFplNmxHNzNON2FjTmF3Rk9kQTFGbm9RajQ3Z05O?=
 =?utf-8?B?UVQ5TGkwbUY5U3A5Z25xYVNyVmxPR2FHUUIrU1ZFNjNDTWxjSUROS1A5WVBS?=
 =?utf-8?B?OVBXMHRWSnRRb3drbUdhWkRrRmVhZWVGcFN3VjkzYU9TTC94WlNmZ0ljNXhR?=
 =?utf-8?B?S3JHUjFpSFJkdTdkME9FMlhxTm5hd1BOS2dzSTFhcUs0YW9iN0ZDaVhlYmt4?=
 =?utf-8?B?d0R6ZEdwcUdJbkFKeUF2SjdBUkhFVThnOVREbWdsYi9td2JXL1I2Vjd4YlRj?=
 =?utf-8?B?T28zWW9oL1VoMmdWVDdkQUsva001SVMra1MxczYxM3kwUkpzNmhWamVhTEEx?=
 =?utf-8?B?WTh4WGpuM05lVzRqSmxrQ1Z3UHFvSlZZdGM3c0FjREF6dVRHV3VIMkdaMVY0?=
 =?utf-8?B?c2pSSGFHSzJra0lMLzM2T1lrdGNYbXpaUWZWL2l6U0JkcGpmdHJMMXh2Qlg4?=
 =?utf-8?B?TWNQQ251d3pQR29NK29PV0dqdjg4ak1pcjFXNlF6NEk3YzVRRzBtVFZxK1lz?=
 =?utf-8?B?cmovWGNDcTcwUmZWT1JaOEUyUFczbHRaWW9MeEVPcHVVZHNYTldmVSt4T0wv?=
 =?utf-8?B?OCszNTVXNkhhSzhmUDZrcmE4RHdTVVlPZyswUWhZU2NVNkRRT2dGY3hsa2xY?=
 =?utf-8?B?ZTlOL2MrTGo1NVJqcUV1MkdvaVlSdmRQZEFybElxWG43VGVXb2hoSXNRUjRM?=
 =?utf-8?B?RjBKdVZEbGZTV1c1WW9sMnhmWitUbU1wWkloWkJJbmREUFZCNGpwaS9wTUpC?=
 =?utf-8?B?U3FDNDB4RnBvcmdmUlE1bHhhQnpmWDd2Y293OWloZkJBVWVnY3FGZk9DMDhE?=
 =?utf-8?B?K0RkRzZuRjI5SlBJS2JzYzdWOUhCRzdZL2ZkY1ZKSzA3Ry9FZncyRUFzaUw4?=
 =?utf-8?Q?ZY8QFFFP38E+wbDp4twgAs87GRRIWE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE8271768B759D4EB7D07CED2D46C710@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5562
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2b37b2f-a9a6-4721-0646-08dd93f3095c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|36860700013|14060799003|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFg0VmJpYm9VYWp2M0ZBV3dBNDFUUUlXN0FTbE5FYndZSXdrVk90em5SY1Fw?=
 =?utf-8?B?QlNZSWlKVCt0cDNjUFQ4K29wRTRyWEtVeElIeGEvM21oc0FYTVVvanhpalBJ?=
 =?utf-8?B?V0grRlZ2SVFyRE51SGtuVExraDRsRHpjMFFLaGdlZWtTQWdoUFdvRlRXM05U?=
 =?utf-8?B?c0t5RzdNTHB0NHNSSEdmM05BQ2ZZTUNHNDZNdzFUdjNSdmRuODJINENTOVRa?=
 =?utf-8?B?UGRiVG0wTGhPVGdka2gvNTFsdlNQcFVhQXNmWFdibEpYeXZlK2N3elM1Rk5C?=
 =?utf-8?B?THk0ZVJ0UTFOQmNVd0lPbUkvVnFVRjVLWnF3S2lMM2RRUUlYWnpPc1ZtMm1s?=
 =?utf-8?B?K2NVSFdqaFpGYUFNWFZMKzZmZUlLQ1p2VkU1RG4rS0FQQkJkaVk0YlBjM285?=
 =?utf-8?B?YW9LMEZrc3Yrai9DYWwvQ2EraHFMSmVldnJYSXFQUjFhSXhSKzNmRHdEZG11?=
 =?utf-8?B?TFdJWExzYmhFaWdibDZCUTdocGdWYlh4ajRVV0dNL21DT1J0WU1rZEp4TEor?=
 =?utf-8?B?dHJ0NEtRVWJxa0gxZC9iVnJ4VnhabzZPUTZJQSsxYVRYVFV6aXZyR2VDWjJs?=
 =?utf-8?B?ZnFZdkcxaWZSNnNZUTArV3dheHFTZmtqbjkvT3RreGZmMDZ2M3NUcFVKd0l3?=
 =?utf-8?B?ZlNYQ0VlSlJuWC9OeGc0NjhUSjhPRFBqOWR5SjVQOGxGbEZ0NnVUSmJ3NFlq?=
 =?utf-8?B?cWthNnJxTE83aWZhQk5TNmZ4cDBGZVdkdjlNNFhDclFiTFk1eHhPYW5LVVVU?=
 =?utf-8?B?SEFrY2pDWnRIMDRJd2hMblNsYTBGZUlVM0pLVWIvQXk5RG5aWGpyTkhhekNT?=
 =?utf-8?B?Q09jeldNbG13V3p0SVpqaTlFektQdWVZeWN1VUtVdjJ6aG9ZaktiZnFiWWI2?=
 =?utf-8?B?NGlmRWx2T29Zb1lXWndwSzNaTlNoQlNXTkxiUTY1Q1cxcTBWTGViUlFuNzhW?=
 =?utf-8?B?bldjZHMwL01kN1dHMk5oRkV5c2R0dUVGaFE4eFBESXUwME9WR0tnY0E1czdj?=
 =?utf-8?B?SUc3K0Evd0RTL2tibXFRTXJCTTA2ZGo3TEZ2eVJoUGhLTGRCM3FGSm41TXNX?=
 =?utf-8?B?TW5aSWFnSXFmNTZlVTBFMG1MM1dZK3M0K3NLZEQ1bzZUTWZuM3RiRHFySVlv?=
 =?utf-8?B?eXhCQ2pDZ1FNSEdUWnZGRG5yeXExTkVmWFczdUUvTUZCOUN2TWJISDRjaVN1?=
 =?utf-8?B?dnpCOGJrZnlwREx5R1ZkR2ptdnZQVWNmSFFKM1V3OWljelVSYks0MW01b2lh?=
 =?utf-8?B?VDNRSHVmZ0tJTXkrOWJjclFQbCtidlVUMGY2N09VNDFPaG9hL09aRkREd0Ru?=
 =?utf-8?B?UDlheUxXSnNjOElsaGx2RXhqaFRZVWJMSEw2dFhyQjQ3bTRHaEROZ0JrWHVM?=
 =?utf-8?B?OEJDd2hRQzVOcDR6T0tHdm9aNWRDZEg3ZlNwVHdBckFYcDZielVvZ2RGWUI3?=
 =?utf-8?B?K3BiZnphRE9EQ2xqR3ZTSTc3cUtSd2NVOHlrekxpbmFpRXRtTlkwY0dBK0JG?=
 =?utf-8?B?bjQ2emJFQUcxS1hIT09tTmdFZU54RG51MFJadjZhSUJCSnBScmViZDZsWlY4?=
 =?utf-8?B?VGl0UHo0cHN6QThiWU9vbFlsMFFJUFNpT1ZKdzJwb2l6WlA3a1ZxM1pLT2JX?=
 =?utf-8?B?ZWQ2Rnc4YVgvc084dm9Idm53Q1N4TE84QzBJV3pqM2cyME41bWZnemtlb1pk?=
 =?utf-8?B?RU9iQlpkRVBiU01UUDQvaXdhNDJXN3AwRE51UTJ2RWJyU3NkcHVDL0FMYTZN?=
 =?utf-8?B?OUo5cG1NVktFVzViT21nc2Q3SVd5c3hUWUlVOW4xamJBY1pTdjI3QjdObTFl?=
 =?utf-8?B?SVpFTWdjNEVhK29QVkt4Si96L2JLS0JBTnM3NE9WU2xiMmY5QXVJYnd0ejJH?=
 =?utf-8?B?Z3JrdU1LRUlJaURVakQrMkRnTllKajFYeHVobGFPb1c4dmpTdzNuRk4yZXFP?=
 =?utf-8?B?MXR5RkZTMnU4Ri9QaE9KMGhLalh3KzdBR1MrRWVzU3R3SW9EcWNsZG5zVENa?=
 =?utf-8?B?emRYdGNqVW5BZlV2a3dudDc1dXlVclRCa25HdTd1Q2FSb0tmajN0bjU1Z244?=
 =?utf-8?Q?zECaBq?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(14060799003)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 20:57:33.0079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a99882-ab31-42e2-e456-08dd93f31d1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 20:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216706

SGkgS2hlbSwNCg0KPiBPbiAxNSBNYXkgMjAyNSwgYXQgMjA6MzgsIEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMTE6NDji
gK9BTSBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBIaSBLaGVtLA0KPj4gDQo+Pj4gT24gMTUgTWF5IDIwMjUsIGF0IDE2OjQ3LCBLaGVtIFJhaiB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDY6
NTLigK9BTSBsdWNhIGZhbmNlbGx1IHZpYQ0KPj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGx1
Y2EuZmFuY2VsbHU9YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPj4+IHdyb3RlOg0K
Pj4+PiANCj4+Pj4gSGkgQWxleA0KPj4+PiANCj4+Pj4+IE9uIDE1IE1heSAyMDI1LCBhdCAxNDoz
OCwgQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+
Pj4gDQo+Pj4+PiBPbiBUaHUsIDE1IE1heSAyMDI1IGF0IDE1OjM2LCBMdWNhIEZhbmNlbGx1IDxM
dWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPj4+Pj4+PiBXaHk/IENhbiB0aGF0IGJlIGEg
UEFDS0FHRUNPTkZJRz8NCj4+Pj4+PiANCj4+Pj4+PiBJIHVzZWQgdGhlIHNhbWUgYXBwcm9hY2gg
YXMgbGxkYiwgd2h5IGRvIHlvdSB0aGluayB3ZSBzaG91bGQgdXNlIGEgZGlmZmVyZW50IGFwcHJv
YWNoPw0KPj4+Pj4gDQo+Pj4+PiBUaGUgcmVxdWVzdCB3YXMgdG8gZXhwbGFpbiB3aHkgdGhpcyBp
cyBiZW5lZmljaWFsLCBhbmQgc2hvdWxkIGJlDQo+Pj4+PiBhbHdheXMgZW5hYmxlZC4gV2hhdCBp
cyB0aGUgdXNlIGNhc2Ugc3BlY2lmaWNhbGx5IGluIGNsYW5nPw0KPj4+PiANCj4+Pj4gb2sgSSBz
ZWUgd2hhdCB5b3UgbWVhbiwgdGhlIG1vZHVsZSB3aWxsIHVzZSBzb21lIHB5dGhvbiBiaW5kaW5n
cyBmb3IgbGliY2xhbmcsIHNvIEkgZ3Vlc3MNCj4+Pj4gc29tZSByZWNpcGUgY291bGQgc3dpdGNo
IHRoZSBmZWF0dXJlIG9uIGlmIHVzaW5nIHRoZSBtb2R1bGUsIG90aGVyd2lzZSBpdCBzaG91bGQg
c3RheSBvZmYNCj4+Pj4gYnkgZGVmYXVsdC4NCj4+Pj4gDQo+Pj4+IE1ha2Ugc2Vuc2UsIEnigJls
bCB0cnkgdG8gaW1wbGVtZW50IGluIHRoYXQgd2F5DQo+Pj4gDQo+Pj4gSnVzdCBtZWFzdXJlIGJ1
aWxkIHRpbWVzIGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBjaGFuZ2UsIG15IGd1ZXNzIGlzIGl0DQo+
Pj4gaXMgbm90IGFkZGluZyBhIHNpZ25pZmljYW50IGFtb3VudCwgYnV0IGRvIG1lYXN1cmUgaXQu
DQo+PiANCj4+IElzIHRoZXJlIGEgc3RhbmRhcmQgd2F5IHRvIGRvIHRoYXQ/DQo+IA0KPiBlbmFi
bGUgYnVpbGRzdGF0cyBhbmQgZG8gYSBidWlsZCBiZWZvcmUgYW5kIGFmdGVyDQo+IGl0IHNob3Vs
ZCBjYXB0dXJlIHRhc2sgdGltZXMNCg0KSGVyZSBhIHN1bW1hcnksIGxldCBtZSBrbm93IGlmIEkg
c2hvdWxkIHBhc3RlIGEgcGFydGljdWxhciB0YXNrL3Rhc2tzOg0KDQp3aXRoOg0KDQpOT1RFOiBC
dWlsZCBjb21wbGV0aW9uIHN1bW1hcnk6DQpOT1RFOiAgIGRvX3BvcHVsYXRlX3N5c3Jvb3Q6IDAu
MCUgc3N0YXRlIHJldXNlKDAgc2V0c2NlbmUsIDEgc2NyYXRjaCkNCk5PVEU6ICAgZG9fZGVwbG95
X3NvdXJjZV9kYXRlX2Vwb2NoOiAwLjAlIHNzdGF0ZSByZXVzZSgwIHNldHNjZW5lLCAxIHNjcmF0
Y2gpDQpOT1RFOiAgIGRvX2NyZWF0ZV9zcGR4OiAwLjAlIHNzdGF0ZSByZXVzZSgwIHNldHNjZW5l
LCAxIHNjcmF0Y2gpDQpOT1RFOiAgIGRvX2NyZWF0ZV9wYWNrYWdlX3NwZHg6IDAuMCUgc3N0YXRl
IHJldXNlKDAgc2V0c2NlbmUsIDEgc2NyYXRjaCkNCk5PVEU6ICAgZG9fcmVjaXBlX3FhOiAwLjAl
IHNzdGF0ZSByZXVzZSgwIHNldHNjZW5lLCAxIHNjcmF0Y2gpDQpOT1RFOiAgIGRvX3BvcHVsYXRl
X2xpYzogMC4wJSBzc3RhdGUgcmV1c2UoMCBzZXRzY2VuZSwgMSBzY3JhdGNoKQ0KDQpIb3N0IElu
Zm86IExpbnV4IDxob3N0bmFtZT4gNi41LjAtMjUtZ2VuZXJpYyAjMjV+MjIuMDQuMS1VYnVudHUg
U01QIFBSRUVNUFRfRFlOQU1JQyBUdWUgRmViIDIwIDE2OjA5OjE1IFVUQyAyIHg4Nl82NCB4ODZf
NjQgDQpCdWlsZCBTdGFydGVkOiAxNzQ3MzQwMjM0LjM2IA0KRWxhcHNlZCB0aW1lOiAxNDg0LjAy
IHNlY29uZHMgDQpDUFUgdXNhZ2U6IDcxLjElIA0KDQoNCndpdGhvdXQ6DQoNCk5PVEU6IEJ1aWxk
IGNvbXBsZXRpb24gc3VtbWFyeToNCk5PVEU6ICAgZG9fcG9wdWxhdGVfc3lzcm9vdDogMC4wJSBz
c3RhdGUgcmV1c2UoMCBzZXRzY2VuZSwgMSBzY3JhdGNoKQ0KTk9URTogICBkb19kZXBsb3lfc291
cmNlX2RhdGVfZXBvY2g6IDAuMCUgc3N0YXRlIHJldXNlKDAgc2V0c2NlbmUsIDEgc2NyYXRjaCkN
Ck5PVEU6ICAgZG9fY3JlYXRlX3NwZHg6IDAuMCUgc3N0YXRlIHJldXNlKDAgc2V0c2NlbmUsIDEg
c2NyYXRjaCkNCk5PVEU6ICAgZG9fY3JlYXRlX3BhY2thZ2Vfc3BkeDogMC4wJSBzc3RhdGUgcmV1
c2UoMCBzZXRzY2VuZSwgMSBzY3JhdGNoKQ0KTk9URTogICBkb19yZWNpcGVfcWE6IDAuMCUgc3N0
YXRlIHJldXNlKDAgc2V0c2NlbmUsIDEgc2NyYXRjaCkNCk5PVEU6ICAgZG9fcG9wdWxhdGVfbGlj
OiAwLjAlIHNzdGF0ZSByZXVzZSgwIHNldHNjZW5lLCAxIHNjcmF0Y2gpDQoNCkhvc3QgSW5mbzog
TGludXggPGhvc3RuYW1lPiA2LjUuMC0yNS1nZW5lcmljICMyNX4yMi4wNC4xLVVidW50dSBTTVAg
UFJFRU1QVF9EWU5BTUlDIFR1ZSBGZWIgMjAgMTY6MDk6MTUgVVRDIDIgeDg2XzY0IHg4Nl82NCAN
CkJ1aWxkIFN0YXJ0ZWQ6IDE3NDczMzg2NTkuODMgDQpFbGFwc2VkIHRpbWU6IDEyOTQuOTMgc2Vj
b25kcyANCkNQVSB1c2FnZTogODEuNiUgDQoNCkNoZWVycywNCkx1Y2ENCg0K

