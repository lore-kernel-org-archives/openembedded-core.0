Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BA1C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:37:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web11.18448.1737473845410699562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DuNvhlHS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DuNvhlHS;
 spf=pass (domain: arm.com, ip: 40.107.21.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B1NgP563F8/298zogqc+RzgaplXqYDiSff36ct2wtzA2f9K2XSpgzfuqbFovi05+js2jPzXlOvDWobqzMhnLCjAdJu2mVHhBi0np+I3DsnwkI0Pzj1k6qira5jIkRcCDYK7nupaptXGoZVUT3drfFdKoNqx/aHWZOFl4NDRbZDYM7eNwvr1CmTBLDmvJ+QchfvL3RYtjWabDwjAVCmqpinU3Gi1IrG/3rB5pwMDJzN4m7UuDt4hbDzJkzxv1IatYtOwxGKMZDlOfyzeEH0KqmfWQoE964U4mhspzFeDQ2mJo6/DwoMygiWaBgrCykzLNWk28sp5tjjwdu8V9v0rEbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSFGKV1WZjzxrHVRzSWR+tTEgfbarRElg0idrIo0qkw=;
 b=H0+ayknBd6o0t9VpJVMRFh+jLckKEugRHFIShPx59GTjypqajuXCLWFIuQ431JFNOgBITVlrU7s2XWROEJMPWET5swis34EEFX1L0N2J9cKIsCp6RIz5nYkNgkXLg2y8LLtOSYrDiTOSoCLDV5AG4gAe/X2kyflgWQwqYQVUi9Etuk3frZfBMiqEkhuAClPYCcG+N5+Y2YlJVMr85ABo3hctgNcRK12noLIzU/zBZwYraG/sePYeYdNz+byPHQxtG6oh7cLW7ocZaROJ1VggWkSJovObLfU2Sf7O0aHxr/ZhhNMgIJpptQ+VjNZW7MQuWvdsUfK9pXK5Rc0/Er7AwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSFGKV1WZjzxrHVRzSWR+tTEgfbarRElg0idrIo0qkw=;
 b=DuNvhlHShRaBA6GWv1CmcgNM+Ity3DHYo+g+kSjwh2F+oj/gNybiYyluUz82Ytv3hIe7iHI8wegf797VipUFxYpPofo4n1I2n3tjtRH24o7JM2zJMcdlvdEnVPwE5nZoejzZTWIEehp8kPkmEWkrKh1pQ5GwTMsVAxineMcemZY=
Received: from AM9P192CA0030.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::35)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 15:37:19 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::bf) by AM9P192CA0030.outlook.office365.com
 (2603:10a6:20b:21d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 15:37:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Tue, 21 Jan 2025 15:37:19 +0000
Received: ("Tessian outbound 31efbc6d7992:v543"); Tue, 21 Jan 2025 15:37:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 056b5aee2b0a417a
X-TessianGatewayMetadata: iy/Yoen1KxDs5UWFT3yWc1aIuMvUxLM5wCXOmVl0bRa/2AnxKb6Hx+voAT04O10z2we+s7uk8/jwY+UHC64EhrQDTPpSzTD4RcT0bH6RIHfOabTqTxj4r8B2+H2z+eWcSwpdBUSNDPq9mRn7oqB/4NDmhehoIdNdX0Q4Kacjl8o=
X-CR-MTA-TID: 64aa7808
Received: from Ldd7d644dab9f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4CE28E3-42FD-4B0E-B0C6-F2E958F017D4.1;
	Tue, 21 Jan 2025 15:37:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ldd7d644dab9f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 21 Jan 2025 15:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRNbp6xZpTk13JcWUquQ6/m69UOdOMogAsdgQHPh6KT4IrpXcFjym09X+rPU5SCuGcLPiWVMXZ/QOJgcm5gI3OrkEX9acLqLVcisVWq/WJRgWDaPuATAfq5gs9mMfbwB4ZOB7pZeEzABVQg5JMD2oDPMuStlinTfCt30EVQ8J9zFx+DfXLkDddtRL580HtUfA18PR2AxGxFejw/7oDAMUJrmkFPz+0bUONjB2stNWSO36SFvEqTucJ5M0hkgYjfp9+Y8Y1a+PWZw29r3GWCI5aHnaPzj3YYFPEfY7tR6rLVvhnIsGc0RE82N3xlxiIXB/Hlg8fWzpFdRoHlTww1D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSFGKV1WZjzxrHVRzSWR+tTEgfbarRElg0idrIo0qkw=;
 b=INNmxrZeKiHulP+OzLEGSlfE089DIg6589XNzcC2eSpctz5irminN7BrBk+MsYuXOmyQyAMz6A9N6tHUe9uRHbXLyKww0h4rRKNftpYv+s/mHvOSZVmqoV8WXAbxzH6SKEVKS4R0FpH6XxBBdszhCd/Lb2vI8C3PxKhd6eX/DR3rXY+1fg095IwxioISdiOOJuZaAP/hgnDWQ20E86GAcxFWW8wUFAzTBF8qgD/RatWm/RbF56HwzEH1R7gkQHsfIsBjbp6o+xQsB+DFAl2CmRD6oIqjYqs0un/oN4NULMqR3nl4uAqv/WeWiTVCnKZY/a8wx/do+8FM28/2HAE4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSFGKV1WZjzxrHVRzSWR+tTEgfbarRElg0idrIo0qkw=;
 b=DuNvhlHShRaBA6GWv1CmcgNM+Ity3DHYo+g+kSjwh2F+oj/gNybiYyluUz82Ytv3hIe7iHI8wegf797VipUFxYpPofo4n1I2n3tjtRH24o7JM2zJMcdlvdEnVPwE5nZoejzZTWIEehp8kPkmEWkrKh1pQ5GwTMsVAxineMcemZY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Tue, 21 Jan
 2025 15:37:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 15:37:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>
Subject: Re: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test
 failure during do_testsdk
Thread-Topic: [OE-core] [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test
 failure during do_testsdk
Thread-Index: AQHbaB1sgs6TTgnyLEWzTk5V/n0OabMhZGIA
Date: Tue, 21 Jan 2025 15:37:09 +0000
Message-ID: <492E6C7B-D6ED-4D05-8FE6-AC9029521655@arm.com>
References: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
 <20250116134833.1838212-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20250116134833.1838212-2-Harish.Sadineni@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5853:EE_|AM4PEPF00027A5D:EE_|DBBPR08MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 5723ea9d-72f2-4b29-2591-08dd3a317daf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZHYrcVBoZlJyVmF5am13SE9TQnIwSGF3VnI3RDdlN21mL0tXR3QyQmg2UGRL?=
 =?utf-8?B?TzEzcHR3NVU3ejdnalp0NFJhaCt1VS9WMEVRbE9oRld4T0ExNW9NbXEyM2xh?=
 =?utf-8?B?a1VMOEtkRGl3MjFIN1oyMmNObDFJVjBPSERuR3VDYWhYQWZnNm5PQjlNZnlY?=
 =?utf-8?B?anR3Nk5aMEhRbzVxRFVBR2dBQmNQK1FneGlja0RyVUFCbDc1RjBIN2JCbS85?=
 =?utf-8?B?VTdwdERvZ1RYcUpEYWZaRUtROEdxQnBnTGcxRWxRSHpVdDBoMHcyZmVRV2tq?=
 =?utf-8?B?QVVTZ2VkMFEvMHhncHpzSVNFWHhjMm44MFR3cHNjK2pETXBHQjU3djRjbnRZ?=
 =?utf-8?B?OGtDMU1CKytKZk5uNzg4QU1WU1ArRFJvYXltZXlkbjVRbE44S3V5UHlteFFx?=
 =?utf-8?B?bGtsT0xEaER1TXNHSFh3MERyejdTdUo1U3NvdmFEejdOdGxkenVZcXVzckhY?=
 =?utf-8?B?cnpDU1dXbjRvbEF0eGxFY2tibWJxcU5ET0Q1U3RlSXU3cmNaOUhIMmRLeG9K?=
 =?utf-8?B?VXIydUp6MDhtWndqblpMYjVISkJCT2lxSFFPNmQ1NTE1MTlJaUZXMGlnRFpi?=
 =?utf-8?B?Q0VBY0g1SnB6VFcyc3dXSitGemZkN1JFeXNHNkVGOWlTVjNYaUY2Rklva0ZU?=
 =?utf-8?B?WWdDTVZPd2NydVFCSTVJVTBNbXlraktzdmxEOFhzMEptRlAySDB5ckFkL0J4?=
 =?utf-8?B?MCtZMFcxRjMwVUxybWxhRUV1d0g1K0VBT21Sb0xLTHVGWmphZEkxMHJ2NDRy?=
 =?utf-8?B?R0dsL1dTVk9QbGpTdFdSQjRVM0ZrMWVCRmZkZ0VabWx2Sk9hek9keU5YUnZo?=
 =?utf-8?B?SWdMMyt4d0Y4NHRKZWZMN092K09KYTU4NUROYmcwdlZMbERMc0hvb2JlSVJB?=
 =?utf-8?B?WGFpUitKUmdtL3pJUHFwZGRvd0RGZmV3Rk43bTl3S3JQSlowS2JuMVcwUWd4?=
 =?utf-8?B?cGRKODFaSmt6ZnQ3aFhMM2hYLytGZVF2dGJucnhYLy91V3RhZXF2Mml5VjNo?=
 =?utf-8?B?U1ZYWXlId2xRWUd4ZUFuT2dkNEl3ejFyaXVSWVo0cG9vYlFBNE4wcGhuNklr?=
 =?utf-8?B?Q0tEQzludDcwM2YyNDFXc0FwdXVWMi9TRUg4anl1ajg4WFRyeXhRakZKcVY4?=
 =?utf-8?B?cWMwRGlyK3hyNENnMjdPanoxNW9pMzk5dnN4TVd1UkdvNFl0RjJuNjFoMDd2?=
 =?utf-8?B?dE9TcDQvVUUxS1ZLRFRON05TWDVkclJPU0ErQVovUFAyYnBINjdKU081WHVw?=
 =?utf-8?B?K1VuYnkwWUw5QStzeDRJNXpqRnRaZjdwOGdiQXRmQkwwc2tMejlLWlErK2lL?=
 =?utf-8?B?eFhpMmNXTllzcnVSUHdsYUhzOWdDMUdsZGtpSFAxNGxwT0FYTEh5YUhRQkJO?=
 =?utf-8?B?aTJ3TjlFZVdLR0FyZ3V6aGZCVjV1bERya3VHalFENHF1NER2NE9qVDVYZFRt?=
 =?utf-8?B?Q0JreVpxVk9jSGZlRUhkbkFkaEhIUmJyTVUrUkcwZXF3MGsrZDEwVXJlazZJ?=
 =?utf-8?B?eU5sTGQzczZoMkZkRXdZTmxVWlY4RUpSb3RDc0VNODRWRldIYkhsaFEyNE8r?=
 =?utf-8?B?cWZGRzR0UEVFM2NaVEdYQ0tHckpJcGNxN0VkWWNJOWdqUjFMbzBEdFphdFJN?=
 =?utf-8?B?NEhzdmRVVEVNQ2hMeFVMY0ZUMEEyTkZhelBCUDN6RjU4RUY5S0kya1E5blJm?=
 =?utf-8?B?WkhnTGxkSEdmOTJCSmxmSldXUEJ1UTBaSFhaNHVCNVpzbW9sRm10WVFyYmly?=
 =?utf-8?B?dVdVbk5TQ0V4WDNZZTRaNXNUUG5ZRkdRdlQ5SUVOeUk4RnovUC84WVVwY3U2?=
 =?utf-8?B?QWV2dFdBc2dTSzZ5N1RVWlpPTFNBc0djd3dOQndYVVFnU2pZVThEUGtkWDdL?=
 =?utf-8?B?RUVwRWFjMjE1RHFKeXk2MjRXN1o3WGhzWHlMeGFSdXFzSjZRcEUzTWw2Z1JR?=
 =?utf-8?Q?2oDyw4JqecJAh7qVIB4X8g359GvRBkx3?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DC74D84FB599941BB0874F4C17CD4FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ff188e62-32a3-4852-1c7c-08dd3a3177a3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmFydzVqdzU5WkRiL2Q5N2M0K3hDWUJHdTlUQ3MyV3dKTzdSR2x5NHdJK3ps?=
 =?utf-8?B?Z1plZnNNSHp2NWR4dHNuS2wxN1VxUEZMQmFvNDYzUUhYWkJ2S09XN3hYSXp6?=
 =?utf-8?B?YzBmb2tWVE44QStqcU5sZmRCaDNhL05NVC9Qd2VEYnVyOWxrSDd5NUcwREVH?=
 =?utf-8?B?WXBtLzdRV29aL09MS0VGaU1zSXA0VlRVWGkzNGVZZ004dVpqM09VYXhSY1RX?=
 =?utf-8?B?b3R0RmJmMXAvbmNuZ1dmVXBmcnplYW9FaWpJK1FqcnlXKzJBMXBHd2w5bXIy?=
 =?utf-8?B?emdGUXJIdmQ2bERTL2JVTnBia0VDejZFM0JINE1zRm9iZW1RR3RtejRRc3Fv?=
 =?utf-8?B?amQzVkxrNWZEWHlTeU8rdGdXVFBVVFNrcWw4YUx0VFc1bUxQNmxuR3dDbEds?=
 =?utf-8?B?ZStwRnN2Z29MSGdnQnN0RDBuMWJmU1haNmt1NHg0aWFOSlljeVFpVmlaZzh5?=
 =?utf-8?B?L1hZbmlveWZUUDFiYXFKczR5QkdiNHJSUU8rNmRqL1J6ZVlHQVlaL1QxZVFz?=
 =?utf-8?B?MUVnbHlURnhRMWF4Tnlhalpvb0VzQU82K002U3JYMmsvOVMyMjBwY1lXVnR6?=
 =?utf-8?B?R2JUbzc1c0drc2szRjFUODExRjIzRWlxR2VuVVRTUTMxVVJzMFY1YmtIeWJi?=
 =?utf-8?B?Mm1VNm5ydko5UllEeCt6SjNtRUJqOW05MVMzbUFVM0hOaW5UVEM4R2NzZVZF?=
 =?utf-8?B?YVBBdUtuZVdCWTdidXlXM1Q5TU5XSVpCQ3BzTXFFVmhQUE5sbEFtYnRhY3NP?=
 =?utf-8?B?WUJKQ3JaMDlqSEdvVDh3V3NKTUxFU29meklJS2dhYjc2MnZyTW9rQXl2WVpT?=
 =?utf-8?B?bkFlc21zRGJSZmhhZEwwU0dNUDA3c0VoL2g0aGpxamZaRnd3bUcrUnMxMmh0?=
 =?utf-8?B?K3VVaDdDUHQ3M1RGL28yb1E0eFdtK2l5NGRhMXB5QzlVK0EyK3FJVE45R1dU?=
 =?utf-8?B?ek1vQ3RHMk1HVGZZREFlN1ZuTGkrc2JzSU9tNklhMUtNSkVldVJHSG5KanhU?=
 =?utf-8?B?clNJMzFzS3ZKZmJHd0JWdWthNEgzTXhiOG9LVVdSUVloVlFrMDE1cUhpZHdF?=
 =?utf-8?B?N3R1a0ovVlFSblJtMTN1ZW9TQ1YrUXJzTTg5Qys4TUpDV3hzRzRrTk1Ca2Zj?=
 =?utf-8?B?VU01YXBrcjJ6eGU5L2s2R0VpaGhrS3ZmOGx2TlVlSU0xNUtxUGJmL1pIZ082?=
 =?utf-8?B?dUNDSkNFNE1TbW5YNnQxa29RVGJacmtwR3VZNDcwbkNhaVMvWGhpcDZZOWQz?=
 =?utf-8?B?ZUxBc1JKclpkT3poT0xieGFRdERYMS9GRklGTkRNSHpOVHhDR2UyaVFsNjgr?=
 =?utf-8?B?MG40WCt3KzM4Z2hvZTZhVisrajhyZ1Era0xPSEd4MXE3UGJScDdUTHMzaWMr?=
 =?utf-8?B?UGkzbU1EOERxN2RaYlRxTU5yL01nYlNvWTdUdjQ1cWtYVnBEWmMvemlKaXY4?=
 =?utf-8?B?VDRTR3hyS3B5V09qWGVPM1ZhcFlRUWg3NEdxMUY5SnNvS0VrOHBCTkdtYmdi?=
 =?utf-8?B?TGxyb1hxc0M0NWhHUkRYUXpIQWh4UlN5ZG1yWnZVaVlIcE5yNTZub2dZSGZ2?=
 =?utf-8?B?dEduWFZSYjA2K0IwNjVMUVdjWkUvVU9vUGhGTURlaFBqajNkQnlpdlNoQVNJ?=
 =?utf-8?B?elA0U2NSb0dCNU9hTVlmci9oQVliVlczaEpYOFVmZDZEWW9SeXVQaGF1bkRm?=
 =?utf-8?B?UUtlV3FnNkl6UzZLaGtyUUxidEVTZmVvaTF4c1h5K2RldUtoYzF6WndkczBy?=
 =?utf-8?B?NDZKMnlEazhpa2U1N2NjRGc4NWV4SytDSDA4YlhGOGk3b0wwcGtqeXVjU25r?=
 =?utf-8?B?cE0wNFY0c0hlSVluNkd2b0VUSFU0N1dTbTNORVdDd053MDd1LzRLdk1nMCt5?=
 =?utf-8?B?OGYyQkxIdXVMRHd6ajd6bllZdmRlTEluemRJZWswdmR2K0JqcFFvWGxza0dY?=
 =?utf-8?B?QjR5R3FIOUswQ1FPbHBvUGszUUJxQmF4NVoyZDVDczIxYjZQY2lBNEZYM1pa?=
 =?utf-8?B?eGpBak4zYk5BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:37:19.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5723ea9d-72f2-4b29-2591-08dd3a317daf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210100

T24gMTYgSmFuIDIwMjUsIGF0IDEzOjQ4LCBTYWRpbmVuaSwgSGFyaXNoIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxIYXJpc2guU2FkaW5lbmk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEhhcmlzaCBTYWRpbmVuaSA8SGFyaXNoLlNh
ZGluZW5pQHdpbmRyaXZlci5jb20+DQo+IA0KPiBUaGUgZG9fdGVzdHNkayBmb3IgbGliMzItY29y
ZS1pbWFnZS1zYXRvIGFib3J0cyB3aXRoIGJlbG93IGVycm9yOg0KPiBjb25maWd1cmU6IGVycm9y
OiBQYWNrYWdlIHJlcXVpcmVtZW50cyAoZ3RrKy0zLjApIHdlcmUgbm90IG1ldDoNCj4gTm8gcGFj
a2FnZSAnZ3RrKy0zLjAnIGZvdW5kDQo+IENvbnNpZGVyIGFkanVzdGluZyB0aGUgUEtHX0NPTkZJ
R19QQVRIIGVudmlyb25tZW50IHZhcmlhYmxlIGlmIHlvdSBpbnN0YWxsZWQgc29mdHdhcmUgaW4g
YSBub24tc3RhbmRhcmQgcHJlZml4Lg0KPiANCj4gVGhpcyBjdWFzZXMgZHVlIHRvIGFuIGFic29s
dXRlIHBhdGggbmFtZSBpbiAnc2RrX2VudicsIHdoaWNoIGlzIG5vdyBzdHJpcHBlZCB0byBoYXZl
IG9ubHkgdGhlIGVudmlyb25tZW50IG5hbWUuDQoNCkNhbiB5b3UgZ2l2ZSBtb3JlIGNvbnRleHQg
YXMgdG8gaG93IHRoaXMgZmFpbHM/ICBUaGUgY3VycmVudCBjb2RlIGRvZXMgYSBzdWJzdHJpbmcg
bWF0Y2ggc28gaXTigJlzIG5vdCBjbGVhciBob3cgdGhpcyBicmVha3MsIGFuZCB3aHkgdGhlIEFC
IGRvZXNu4oCZdCBmYWlsIHdoZW4gaXQgc2hvdWxkIGJlIGV4ZXJjaXNpbmcgbXVsdGlsaWIgU0RL
cyBhbHJlYWR5Lg0KDQpDaGVlcnMsDQpSb3Nz

