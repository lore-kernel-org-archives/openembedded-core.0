Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBE6C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 14:47:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web11.14555.1715179638890072513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 07:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iAMHTCuF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iAMHTCuF;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OQbk7Tqn3x7z4NtdQsJ9mlxrDoGJitraDmCZie9kl9pHNK98v5wswhuiKssO1rHlKMF8DeVNYnKRLz5szUDTNOdaQciNEv/nNNSPr/8ioMAT2kGvLkzKC5KdE5JjbnZMCoe2/S37yn7TWcFMdIPEdB4fhAEsw87lO+GR8Pf5keSpO842Fu3U7WZErArSoUA0OkxZMkMuOHag2M7AkwjZ+XLGsEgF7g8uj/KH5ja2lHzxLjXvjxz8so2QpakjnB9rddG8GjiR4ZXqVcahgZKXFSCD3asCzumCgF3NOHyM8oViSSVKH5YVpFU9tNqc51nEmcn73z0qU7r7opk9UkjlWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpLKxwvKwshaeRP8+CW9tHmI2qxCQ8cUcKYRrFB47HM=;
 b=l9XZuLX2/WV4zxcSnpeve0PjYvv+UphEZAl6dNQhwdVBh9OIJPSUh3ZTtADKv8oOFvF6ZPTLDFTsfxwVTccVmBWVO5r9Y/Dg//6+l0Knm2lkYpQ0fh/2CShBmQ68WXuAtfDCczO71p28fO3TGTQ4tXI1qHhOBH492Y3uO6sJT1jOY8ppQbMcdgO37w9318JOnDW+e79uXV2EJuF3W7rQmj/HOuEm1S5PunnQOu5mlJM/WiORzUmhds4SAvzREAraMaIAY98g24LOuFJlqIV0MbrIyqzZV5v8G0ZQZOw/OSPkjcN9WEGgUZR9pvpgB9i84wLdH4DZZLtd57dLprTWzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpLKxwvKwshaeRP8+CW9tHmI2qxCQ8cUcKYRrFB47HM=;
 b=iAMHTCuFAuSeZEsRIg93/V7YOhoYW+L2nsr9ngr4c5QMfMCfiaqYaw9yvXHY7uuavOIk1KkothBkklEA1tlyprFW2y846s59CT2s2VKXxWSm9Ws5JqFU38J+lKKCDUZUswKcSmXlIiOj4Ed6NrE+13zSUfnTSVj3kPOIHPZj4s0=
Received: from AM9P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::19)
 by DU0PR08MB9935.eurprd08.prod.outlook.com (2603:10a6:10:401::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 14:47:14 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::25) by AM9P192CA0014.outlook.office365.com
 (2603:10a6:20b:21d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45 via Frontend
 Transport; Wed, 8 May 2024 14:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Wed, 8 May 2024 14:47:13 +0000
Received: ("Tessian outbound ba75727f6dca:v315"); Wed, 08 May 2024 14:47:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: abb4bef642ced639
X-CR-MTA-TID: 64aa7808
Received: from 4fc832133e50.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7A981FED-9A3B-4644-AF1F-4B1D3483E83D.1;
	Wed, 08 May 2024 14:47:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fc832133e50.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 May 2024 14:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6KI4U6ggB7Jtu1JWxyGWFfjcDtbwaJ5OuW5HbNYyT/YPViW/ap8b/nUnOrFr0htgo7DfauZ2YwrrtbveTRccRjl9sXhrkT1Fh+dsyVAlAKtKyHp8HmbK7W/GfA6qv5Jj3lBtMEOSv3EMxp4oyA72slkV1T80Ht+kYGrT0a/h4pGpNE/KxrtX3Szj6Q4YeNaEJSGJ4fa/EZ0PQ7nNKoIWEEUwVQOSwsXPgVePVaBInPREpEjx/oyhgEBlgekuVHahKcXDfu14SPVmtxOKNuGCwaMHDnJqGdzW6j7NSOHDi01fviL3CyiKK0IZ9vo6xQuJ2tnOpPd4GjkdBHpshKxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpLKxwvKwshaeRP8+CW9tHmI2qxCQ8cUcKYRrFB47HM=;
 b=YcdMI4FB+PZPY94cfk2jqA6dcza09A2n2Wa/PTSSrLH7jwIc+iMVIWViqLFNyHKErorH9vfXwesEmvCPwcZGmQDINAMl7Nf9Zm4Kh4tuVH83OHGQUcuySblDDOxoSDqMLQg6hPhH2P4uNlY5VOE4T1WBn5puK+SjQ3jHz1DtYzuAbzMYW7Qop6rVC98TElSB1hxNMoS65+LCC/kz9siO6lobLJidCSccmX9jpCMoLB6by+HvbYnA6VBUPDh9/x06QfIxNE4yH8MjGfDGawIqW5aKEGagK9j95gyycbTpxaYA1/AGeV+2YxfWVlyYySLk5HQVsV1df2k30zP7GiE3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpLKxwvKwshaeRP8+CW9tHmI2qxCQ8cUcKYRrFB47HM=;
 b=iAMHTCuFAuSeZEsRIg93/V7YOhoYW+L2nsr9ngr4c5QMfMCfiaqYaw9yvXHY7uuavOIk1KkothBkklEA1tlyprFW2y846s59CT2s2VKXxWSm9Ws5JqFU38J+lKKCDUZUswKcSmXlIiOj4Ed6NrE+13zSUfnTSVj3kPOIHPZj4s0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10846.eurprd08.prod.outlook.com (2603:10a6:800:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 14:47:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 14:47:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "simit.ghane@lge.com" <simit.ghane@lge.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rajesh.kanna@lge.com"
	<rajesh.kanna@lge.com>, "vijaya.sundaram@lge.com" <vijaya.sundaram@lge.com>,
	"dp.min@lge.com" <dp.min@lge.com>, "krishnakumar.s@lge.com"
	<krishnakumar.s@lge.com>, "jaeyoon.jung@lge.com" <jaeyoon.jung@lge.com>,
	"martin2.jansa@lgepartner.com" <martin2.jansa@lgepartner.com>
Subject: Re: [OE-core] [PATCHv1] Fix building error with '-O2' in sysroot path
Thread-Topic: [OE-core] [PATCHv1] Fix building error with '-O2' in sysroot
 path
Thread-Index: AQHaoTVi2MS95upRI0OYXFn+BPJ+lrGNaraA
Date: Wed, 8 May 2024 14:47:05 +0000
Message-ID: <8A9AEBAD-9B6B-41AC-8FBA-C93D3858E94F@arm.com>
References: <20240508104826.481616-1-simit.ghane@lge.com>
In-Reply-To: <20240508104826.481616-1-simit.ghane@lge.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10846:EE_|AM3PEPF00009BA1:EE_|DU0PR08MB9935:EE_
X-MS-Office365-Filtering-Correlation-Id: 250c86f6-7240-4854-6ac6-08dc6f6dbfcb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z2xkY2VOa0NXUjR6S003aUtkSjdZeUVLUHBqQmcrVjF4c1N0SzdtQ09LMjht?=
 =?utf-8?B?QVJVc3VYSHZ0WjRZY3FrUnpybFI2ZXJhTys2OTJER1FOdEZyeXVFbkE1cC9C?=
 =?utf-8?B?cXUvU0czU1NiS2l1Mkh0cTN6d1hNOVBRM2xNSGFEMTQwL2tMT0JXL3ZSNHBw?=
 =?utf-8?B?ZFFrS3dMbDQydGJWeDMxRWJtS1hFM1dBZzlROGpkYVJta3Nwb0JEcm4vVFVC?=
 =?utf-8?B?cTd5MVd0QWw4cDRjK3ZCMkVKeW5kR2lSL3lHN1NjTGhPT1pEWWlxNDZPWjZR?=
 =?utf-8?B?MWY4T3puSmgwUmh3ODBjUWN2ZHhEUkcvdDhQL1lwcmNHdGxUUVJreEo1SGdL?=
 =?utf-8?B?NWw1WkhKWmdyb3JQZ05nZ09DaVBMbUQzR20wMmcvS245QXFDSmVsNWRDMkxI?=
 =?utf-8?B?dDN3NFNEYW5vOHdFWFV5Q1BjeDZkT04xSFRUeEJFUmFpMmNqMFJYNnJYK2Na?=
 =?utf-8?B?ZFMxTFltdXkrQzVCdDRNOUZ3THhTdWkxSFpLT2ZpUGRTOG0rSXVseFRLY01y?=
 =?utf-8?B?SytRTWZRN20xRVZTdFR2Z2lmS2ZIRk4xU0pacmphWDNBbmczTitQQkZVZWhP?=
 =?utf-8?B?cHN0UWNpMWZTSnJqMWR5UW1uN2NTWWlNVUVjTWpWU2UzVGJtS0wyVU5lZW8y?=
 =?utf-8?B?UGZ5M1hFZGoxVmRybFhQaEJHM2UreGpMV1dSK0R3Nlc2aE0xdmlnM3lVKzNn?=
 =?utf-8?B?Ym41VWpxQzYwNk5UbGJZZ2dxVjJjMWV2KzIwcmFQT0xhTTRPY0E3eWJ6VVZR?=
 =?utf-8?B?RTBQdkt1YUdkQVB0MnMzZ2RCdFBnMU5hWG8vaHpRR3RUU0hpdXN2Qk8xOHla?=
 =?utf-8?B?TjA3SnRSR1dnVnljc05tK2VwSFB0RkZlaFl4OHd3d2Z1eU9zMG41TTJNWnp0?=
 =?utf-8?B?NEhUOTVsS1dVNjBXZzZZOTdESUcrQUc1NERoRTVQVUxkNGVHbDRFcDhjZExv?=
 =?utf-8?B?S3ZZU1lheHI1Tlk4MXVLSThvVnpQdFV3dTg1TTB6amJDWVpnVWpuYUZXekJv?=
 =?utf-8?B?djZVc25IK25XZEZUNHdsUC9jYW1jTHh4TS8ybndRZ3dQTDhhMGk4YWNQNEps?=
 =?utf-8?B?a3U0K1FuMytiRnptSDdWVStJYjUxWDdLUXlwL2poQWM0QkdHY3ZGclcreVJD?=
 =?utf-8?B?UGNGNjM3TzNjQjA3VWxVSXFsZVZRYzhFK1E0cGxIeHlicVdwZkhBamYwWTJO?=
 =?utf-8?B?L0dyR2thb3lKMm03RGlsNCtiS0VpQ2ZHMW11K3pkdEUwZkI5b1JwaFprVkRL?=
 =?utf-8?B?SGEvSDZBY01NK2lVcW1IVEdhWHFYbk1FSnhaNFFlKyt3cXZVR1JrTWFvRjZ5?=
 =?utf-8?B?NGhkZm0zamprUEJwc2F5TVYrRUh2UlZwYUMzTFBoRFBZK3VHN3dYaFlTMzNw?=
 =?utf-8?B?Y2NvT1p2aWRSUkVGTzFab2FnQzNZaEVqaXlmalRxZzh0YlZVeXFWS3poUG1S?=
 =?utf-8?B?VEtreWp1RDNNMk5BeVpkZkdjdXY4Q3hadnFOWEhNSDl2VWo5dFFGMUdjOEUw?=
 =?utf-8?B?cEZXN3ZXQmFtd2pWaGtJU09UWDZyMHdtTmlRRXpqL3FlZUlEK2FmYTF2WThz?=
 =?utf-8?B?MDBKQnBWUk1pNWFQU1hYd0ZsdW02bmFaZFhFbjBaZERWeUZnYUpNOWJ4TW9w?=
 =?utf-8?B?ODdiczI4WitwK3pjUFgwYlh6bEl4RU9Wd3JhOThEc1U5NkgwRzE5djkzUml2?=
 =?utf-8?B?YktuaFBwVlRCRy9JcmhqUzJkbWVMK3cyNUZOK25PdkprRCtxR2dWQlcyYzNu?=
 =?utf-8?Q?9IImylGVIYMEniID8g=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <35C68E47C54E4247845DF515A5A2682B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10846
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	364679c4-bf47-4b16-8712-08dc6f6dba88
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|35042699013|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlBjc0JJMldlSnpXWVoxbzVNS2w5dUMzNkx0OW5xVnBNUTRzcUwyaDdkTi8v?=
 =?utf-8?B?enR0Z1FpVURpb0dHWmxyU3FCSmxlMTRZZStEdWt6Z1BYdzhQQ2VzL1k0MEZh?=
 =?utf-8?B?dW80NDBZT0F2ODByRXN4anhhMlk1a2JyQWpuekNGU01adXFXcmxnbnUyTUxQ?=
 =?utf-8?B?WDE5NlZ5MlMxeWVVSHJUb1RHZkE1WlBXWU13T2h1NzZEVjY1eUtJNElzR1Fp?=
 =?utf-8?B?L1hpbWJSSHRIUTFXWUliZENxNkkxVDl5NzBlUlB2Vm01bDRENzdqZHUvaUJN?=
 =?utf-8?B?d2NhbDFWOWswTUo0aEJKR1FxaUdQb0Y4VnpNK3gwMEFjcVExcVd4d00vd1M2?=
 =?utf-8?B?MjM5dmwvWkxSYldlZUF6M3Q0SjJNTWxMT3B1dUtKNjBRMitxZ1pTNDZrYmM3?=
 =?utf-8?B?OVFFQUFBZnA0QVBZK21mQTJTcXFHSjRmRzk1cExJTWVxNGlXaUJxREpuRjJZ?=
 =?utf-8?B?N000dGdha0ZFZFd3Rmg5anord3o4T0k2V2JXTTVEK2JRMDRCYmsyMndieVlL?=
 =?utf-8?B?NmgxaUZoaEhlVUZiUWIwa3hLRDVPNjRNMEt1R0tjZ3hxTmJ6eDVlMzJUUWxl?=
 =?utf-8?B?VVBrTWI0SmUybVdKT25NeDNSOHpibXRDNVpkL2I5T1ptVHZMSjNteTl0Ryt6?=
 =?utf-8?B?RjhPUDUvY1ZIRnhOcDY4dEpHTmRhVGMwRFFWNmNJVUlsWVdHMnd0VklKVnJG?=
 =?utf-8?B?YXR6M01HdTlHcVVjSWJpR0FRZXNkZmdvWXB0L3oyMDIyUldYZlh0WXpJaGl4?=
 =?utf-8?B?aVhzUys0ajBBWE4yZ0J1ZUZTa1FQcVRRdFdlZDNuSWJOenZuVXNXcDFuVStZ?=
 =?utf-8?B?UWVZeTNaZG52c2prQXJ4MURzZEt5Z1hLam42UXlGVW9qb3FpK2g1a05COGt1?=
 =?utf-8?B?YVlOOVp5Rjd4bmZIMS9NUkpJYlFsbmZNdkV4QnNrUDZTRzI1QnBIUURlNGc5?=
 =?utf-8?B?ODlibE11TUlGNEVjSGhxMytyT3h3MmdVVG00dE8xblgrQjZzZ2pTZTRzeEhE?=
 =?utf-8?B?ZGJuWkxabE5FQTIzRElLNmVremU2YVVLdktOR2Y4bFpTbWpoRzVza21JSGRF?=
 =?utf-8?B?WXNuRllBYzdpMDQ2c0Z1eFNvNzRvS0NVNG1hYVZoZHQwbUhrMzZhUFJIREwv?=
 =?utf-8?B?aXRxbzdvalYzVWR4RnBubTg0alh0Y0Y2cFZHbTB5Z3o1V3ZxRW1uU1kvV3hM?=
 =?utf-8?B?N3Y2b1I2K0NBZkVzOHFPMzNaV2NxNXNBbkZaeEhiSlZGTm1DS0dHUlBTU1I4?=
 =?utf-8?B?VHBqVGFXN1FSeDN6aGtiL2t4SGo3QmNLUHVIOXNEdDhPTnhxQzZXcGxXQ3Fv?=
 =?utf-8?B?ZW9HWEVjK2NKRlh2VEowQmsxemdrSXFWbHdtd20yVjYzQk5RTWd1cm01NU02?=
 =?utf-8?B?b0dWUitKMGtpVkVobVZKSW1oTmFiMXVySmc5alNZdHdpYWJoaVVaTmt4a3lx?=
 =?utf-8?B?WHdQZWJPRnAreHUzS1RQS0tMUFRRQ0wyTTFxMm53VnlveVM5UEF0TWdEQ3FR?=
 =?utf-8?B?b2Zoenl0Tm12cEcwQWZ4R2htaEtKWjBZMW5YeHF3OGUweG1yRVpoSVhTQkJN?=
 =?utf-8?B?amFsYjg1SWZ5UDJ2cTRaOWZudzRKWW1ZOFVzMmg4Skt5cE8xTkUvYTVVY1ZR?=
 =?utf-8?B?RG9QNk1XOU9FOTZoV3J6S3RCa1RHZS9sSW5kdTh4VjUvckZDTWlrVERpWXRw?=
 =?utf-8?B?KyswNVMyV2RKQmViQ1JpMjY3OHpWdjBrUHVVOFdUMTRrWkcrT0w0SVRQQjlE?=
 =?utf-8?Q?0+hpbCwpdFZk5QGMorpuFW6jXVWlaf6LJrnnkIW?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 14:47:13.9040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 250c86f6-7240-4854-6ac6-08dc6f6dbfcb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 14:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199122

RmVlbHMgbGlrZSB3ZSBzaG91bGQgYm90aCBiYWNrcG9ydCB0aGF0IF9hbmRfIHBhc3Mg4oCUZGlz
YWJsZS1PLWZsYWctbXVuZ2luZywgYXMgd2UgY29udHJvbCB0aGUgY29tcGlsZXIgZmxhZ3MuDQoN
ClJvc3MNCg0KPiBPbiA4IE1heSAyMDI0LCBhdCAxMTo0OCwgc2ltaXQuZ2hhbmUgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPHNpbWl0LmdoYW5lPWxnZS5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBDaGFyYWN0ZXJzIGxpa2UgJy1PMicgb3IgJy1PZmFzdCcgd2ls
bCBiZSByZXBsYWNlZCBieSAnLU8xJyBhbmQgJy1PMCcNCj4gcmVzcGVjdGl2ZWx5IHdoZW4gY29t
cGlsaW5nIGNpcGhlciBhbmQgcmFuZG9tIGluIHRoZSBmaWxlc3lzdGVtDQo+IHBhdGhzIGFzIHdl
bGwgaWYgdGhleSBoYXBwZW4gdG8gY29udGFpbiAnLU8yJyBvciAnLU9mYXN0DQo+IA0KPiBJZiB3
ZSBhcmUgY3Jvc3MgY29tcGlsaW5nIGxpYmdjcnlwdCBhbmQgc3lzcm9vdCBjb250YWlucyBzdWNo
DQo+IGNoYXJhY3RlcnMsIHdlIHdvdWxkDQo+IGdldCBjb21waWxlIGVycm9ycyBiZWNhdXNlIHRo
ZSBzeXNyb290IHBhdGggaGFzIGJlZW4gbW9kaWZpZWQuDQo+IA0KPiBGaXggdGhpcyBieSBhZGRp
bmcgYmxhbmsgc3BhY2VzIGFuZCB0YWJzIGJlZm9yZSB0aGUgb3JpZ2luYWwgbWF0Y2hpbmcNCj4g
cGF0dGVybiBpbiB0aGUgc2VkIGNvbW1hbmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBzaW1pdC5n
aGFuZSA8c2ltaXQuZ2hhbmVAbGdlLmNvbT4NCj4gLS0tDQo+IC4uLmlsZGluZy1lcnJvci13aXRo
LU8yLWluLXN5c3Jvb3QtcGF0aC5wYXRjaCB8IDUyICsrKysrKysrKysrKystLS0tLS0NCj4gMSBm
aWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAyLWxpYmdj
cnlwdC1maXgtYnVpbGRpbmctZXJyb3Itd2l0aC1PMi1pbi1zeXNyb290LXBhdGgucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMi1saWJnY3J5cHQtZml4LWJ1
aWxkaW5nLWVycm9yLXdpdGgtTzItaW4tc3lzcm9vdC1wYXRoLnBhdGNoDQo+IGluZGV4IGNmOWVi
ZmIzZTYuLjMzOWJjOWM1NjMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdjcnlwdC9maWxlcy8wMDAyLWxpYmdjcnlwdC1maXgtYnVpbGRpbmctZXJyb3Itd2l0aC1PMi1p
bi1zeXNyb290LXBhdGgucGF0Y2gNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2Ny
eXB0L2ZpbGVzLzAwMDItbGliZ2NyeXB0LWZpeC1idWlsZGluZy1lcnJvci13aXRoLU8yLWluLXN5
c3Jvb3QtcGF0aC5wYXRjaA0KPiBAQCAtMSwzMSArMSwzOCBAQA0KPiAtRnJvbSAwZjY2ZTc5NmE4
NTIyZTEwNDNkZGEwM2I4OGQ1ZjZmZWFlODM5ZDE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0K
PiAtRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtRGF0ZTogV2VkLCAx
NiBBdWcgMjAxNyAxMDo0NDo0MSArMDgwMA0KPiAtU3ViamVjdDogW1BBVENIXSBsaWJnY3J5cHQ6
IGZpeCBidWlsZGluZyBlcnJvciB3aXRoICctTzInIGluIHN5c3Jvb3QgcGF0aA0KPiArRnJvbSA3
ZDk4MTdjYTkzNWEzNWZlNmM4ZTJjMmM3NjE1ODI1ZmEwOGEzYTE5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQ0KPiArRnJvbTogInNpbWl0LmdoYW5lIiA8c2ltaXQuZ2hhbmVAbGdlLmNvbT4NCj4g
K0RhdGU6IFR1ZSwgNyBNYXkgMjAyNCAxNDowOTowMyArMDUzMA0KPiArU3ViamVjdDogW1BBVENI
VjJdIEZpeCBidWlsZGluZyBlcnJvciB3aXRoICctTzInIGluIHN5c3Jvb3QgcGF0aA0KPiANCj4g
LVVwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXQuZ251cGcub3JnL2NnaS1iaW4vZ2l0d2ViLmNnaT9wPWxpYmdjcnlwdC5naXQ7
YT1jb21taXQ7aD03ZDk4MTdjYTkzNWEzNWZlNmM4ZTJjMmM3NjE1ODI1ZmEwOGEzYTE5XQ0KPiAr
DQo+ICsqIGNpcGhlci9NYWtlZmlsZS5hbSAob19mbGFnX211bmdpbmcpOiBUd2VhayB0aGUgc2Vk
IHNjcmlwdC4NCj4gKyogcmFuZG9tL01ha2VmaWxlLmFtIChvX2ZsYWdfbXVuZ2luZyk6IERpdHRv
Lg0KPiArLS0NCj4gKw0KPiArQ2hhcmFjdGVycyBsaWtlICctTzInIG9yICctT2Zhc3QnIHdpbGwg
YmUgcmVwbGFjZWQgYnkgJy1PMScgYW5kICctTzAnDQo+ICtyZXNwZWN0aXZlbHkgd2hlbiBjb21w
aWxpbmcgY2lwaGVyIGFuZCByYW5kb20gaW4gdGhlIGZpbGVzeXN0ZW0NCj4gK3BhdGhzIGFzIHdl
bGwgaWYgdGhleSBoYXBwZW4gdG8gY29udGFpbiAnLU8yJyBvciAnLU9mYXN0DQo+IA0KPiAtQ2hh
cmFjdGVycyBsaWtlICctTzInIG9yICctT2Zhc3QnIHdpbGwgYmUgcmVwbGFjZWQgYnkgJy1PMScg
d2hlbg0KPiAtY29tcGlsaW5nIGNpcGhlci4NCj4gSWYgd2UgYXJlIGNyb3NzIGNvbXBpbGluZyBs
aWJnY3J5cHQgYW5kIHN5c3Jvb3QgY29udGFpbnMgc3VjaA0KPiBjaGFyYWN0ZXJzLCB3ZSB3b3Vs
ZA0KPiBnZXQgY29tcGlsZSBlcnJvcnMgYmVjYXVzZSB0aGUgc3lzcm9vdCBwYXRoIGhhcyBiZWVu
IG1vZGlmaWVkLg0KPiANCj4gLUZpeCB0aGlzIGJ5IGFkZGluZyBibGFuayBzcGFjZXMgYmVmb3Jl
IGFuZCBhZnRlciB0aGUgb3JpZ2luYWwgbWF0Y2hpbmcNCj4gLXBhdHRlcm4gaW4gdGhlDQo+IC1z
ZWQgY29tbWFuZC4NCj4gK0ZpeCB0aGlzIGJ5IGFkZGluZyBibGFuayBzcGFjZXMgYW5kIHRhYnMg
YmVmb3JlIHRoZSBvcmlnaW5hbCBtYXRjaGluZw0KPiArcGF0dGVybiBpbiB0aGUgc2VkIGNvbW1h
bmQuDQo+IA0KPiAtU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KPiArU2lnbmVkLW9mZi1ieTogc2ltaXQuZ2hhbmUgPHNpbWl0LmdoYW5lQGxnZS5jb20+DQo+
IA0KPiAtUmViYXNlIHRvIDEuOC4wDQo+IC1TaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25n
eHUuamlhQHdpbmRyaXZlci5jb20+DQo+ICtDaGFuZ2VMb2cgZW50cmllcyBhZGRlZCBieSB3aw0K
PiANCj4gK05vdGUgdGhhdCB0aGVyZSBpcyBhbHNvIHRoZSBjb25maWd1cmUgb3B0aW9uIC0tZGlz
YWJsZS1PLWZsYWctbXVuZ2luZzsNCj4gK3NlZSB0aGUgUkVBRE1FLg0KPiAtLS0NCj4gIGNpcGhl
ci9NYWtlZmlsZS5hbSB8IDIgKy0NCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gKyByYW5kb20vTWFrZWZpbGUuYW0gfCAyICstDQo+ICsgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvY2lwaGVyL01ha2VmaWxlLmFtIGIvY2lwaGVyL01ha2VmaWxlLmFtDQo+IC1pbmRleCBj
M2Q2NDJiLi44OGM4ODNhIDEwMDY0NA0KPiAraW5kZXggYzNkNjQyYjJhYy4uZjFjMzk3MWM0MCAx
MDA2NDQNCj4gLS0tIGEvY2lwaGVyL01ha2VmaWxlLmFtDQo+ICsrKyBiL2NpcGhlci9NYWtlZmls
ZS5hbQ0KPiBAQCAtMTUzLDcgKzE1Myw3IEBAIGdvc3Qtcy1ib3g6IGdvc3Qtcy1ib3guYw0KPiBA
QCAtMzMsNyArNDAsMjAgQEAgaW5kZXggYzNkNjQyYi4uODhjODgzYSAxMDA2NDQNCj4gDQo+ICBp
ZiBFTkFCTEVfT19GTEFHX01VTkdJTkcNCj4gLW9fZmxhZ19tdW5naW5nID0gc2VkIC1lICdzLy1P
XChbMi05c2d6XVsyLTlzZ3pdKlwpLy1PMS8nIC1lICdzLy1PZmFzdC8tTzEvZycNCj4gLStvX2Zs
YWdfbXVuZ2luZyA9IHNlZCAtZSAncy8gLU9cKFsyLTlzZ3pdWzItOXNnel0qXCkgLyAtTzEgLycg
LWUgJ3MvIC1PZmFzdCAvIC1PMSAvZycNCj4gKytvX2ZsYWdfbXVuZ2luZyA9IHNlZCAtZSAncy9b
WzpibGFuazpdXS1PXChbMi05c2d6XVsyLTlzZ3pdKlwpLyAtTzEgLycgLWUgJ3MvW1s6Ymxhbms6
XV0tT2Zhc3QvIC1PMSAvZycNCj4gKyBlbHNlDQo+ICsgb19mbGFnX211bmdpbmcgPSBjYXQNCj4g
KyBlbmRpZg0KPiArZGlmZiAtLWdpdCBhL3JhbmRvbS9NYWtlZmlsZS5hbSBiL3JhbmRvbS9NYWtl
ZmlsZS5hbQ0KPiAraW5kZXggMGM5MzVhMDU5NS4uMzQwZGYzOGE3OSAxMDA2NDQNCj4gKy0tLSBh
L3JhbmRvbS9NYWtlZmlsZS5hbQ0KPiArKysrIGIvcmFuZG9tL01ha2VmaWxlLmFtDQo+ICtAQCAt
NTYsNyArNTYsNyBAQCBqaXR0ZXJlbnRyb3B5LWJhc2UuYyBqaXR0ZXJlbnRyb3B5Lmggaml0dGVy
ZW50cm9weS1iYXNlLXVzZXIuaA0KPiArIA0KPiArICMgVGhlIHJuZGplbnQgbW9kdWxlIG5lZWRz
IHRvIGJlIGNvbXBpbGVkIHdpdGhvdXQgb3B0aW1pemF0aW9uLiAgKi8NCj4gKyBpZiBFTkFCTEVf
T19GTEFHX01VTkdJTkcNCj4gKy1vX2ZsYWdfbXVuZ2luZyA9IHNlZCAtZSAncy8tT1woWzEtOXNn
el1bMS05c2d6XSpcKS8tTzAvZycgLWUgJ3MvLU9mYXN0Ly1PMC9nJw0KPiArK29fZmxhZ19tdW5n
aW5nID0gc2VkIC1lICdzL1tbOmJsYW5rOl1dLU9cKFsyLTlzZ3pdWzItOXNnel0qXCkvIC1PMCAv
JyAtZSAncy9bWzpibGFuazpdXS1PZmFzdC8gLU8wIC9nJw0KPiAgZWxzZQ0KPiAgb19mbGFnX211
bmdpbmcgPSBjYXQNCj4gIGVuZGlmDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCMxOTkxMTQpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5OTExNA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDU5Nzg0MzcvNjg3NTg4OA0KPiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IA0KDQo=

