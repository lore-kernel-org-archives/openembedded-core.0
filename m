Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655FFD148A1
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:29:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7595.1767882586846628368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Eo7fkZ4A;
 spf=pass (domain: cherry.de, ip: 52.101.65.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za9Qme1gqj5+VLegz4cH1nO2CImn64TQIH3RiL/LpvwyeEMSq2OJzz8zJ2bJ77fedj5v/WDknBJhHbK+o1fPgwbiTCykk+QnZS/a4OVJu8YKmEbwbtLNvo/AH9rgI9jAAE0/a11OAyR0lITUtCy3/1uhb/Ep0W7TvB3nap0xpVEyzCCOKdc0Pf9JK6rZRQf/WJbmjs6I8K3enE+FiTRLEgPNXJ/RwrPvcuDmn7Kif/kxUUfHpAGzl/AkoqO5WawAl7TQWkLZkqkbnQejJufIzkJGQp/E6KoUur5e9NBqsyjp4rGO6JtSjzBa6oAtlAkg4o84+hQtsoEjN0G4qR37Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN5uWEfAF0rSI4xPBvtGBLo5TPQB9BqOqgi9AsaQEeA=;
 b=d8/+04GmO0gQE4Glhz7qXzBn+BI6X4XfFawX9waMIAs9zEWbRHM3W5oYoVeG491jRI0cp5mHJ8JVdSbJnuMzQb2Comuqn3DMfjqzk0xi+/nqBu8cA6RvtRsh5YO3J7kM9e6SOksj4rfGey6ZC+vb2ATza2b+kWANlecUhhwQeTcTapIOWx//fQanmkM8o6129pxz7s0UOOqCQN3XKu1BIU7gLbbkh65FDcr48ib9ei71iwsM2xT3WHtosk66WA6hyzdVjh3x9j8AbX9i2Ipp5JIGdv9UR4iV4mQTa68IRPbRBIM/jxEpaLkAcqB5SBc1J/7srAA9dQc1gsxmDWm2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN5uWEfAF0rSI4xPBvtGBLo5TPQB9BqOqgi9AsaQEeA=;
 b=Eo7fkZ4ArR/ki2E1LTXC+VTKV/W5NtXS7XY+k6qMvw/KTvL9+TSafkpXZjX4cj30Z5gb5hoCiS90bsH65ICLbpPf7XN8xh75TVtdvDX1cVFsK/sEaFwej7tQytyr59GKIhS6sTp/BWLCPIkYg7pb9M+dY0HN6Hic47w6ZAwEiHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB11953.eurprd04.prod.outlook.com (2603:10a6:800:31f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:29:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:29:41 +0000
Message-ID: <2ca994ec-64cc-4538-840b-0effae7cd6fb@cherry.de>
Date: Thu, 8 Jan 2026 15:29:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] kernel-fitimage: Add FIT_CONF_MAPPINGS for
 flexible DTB configuration
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
References: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
 <20251218201432.1608259-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251218201432.1608259-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB11953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1612bf-720a-49c6-221e-08de4ec25bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UjI3NDRmc2xWTnJKdUlhM0t4L3lFNUpsUGthbGNPZnlzR2FCL2duNkNSNzFs?=
 =?utf-8?B?VXFhWEd4a3FUbzB2OEwvTTdEb2pNWnhOdk8vTG1UTXorbUZvcmx6R3g4VEVT?=
 =?utf-8?B?a05YTnFEZEpweUw1dHpPaHVBVjA0VFE2SWtjMUVXT0lhYzQ4L3k2MjdieklN?=
 =?utf-8?B?VHVqVzZ3Q3orNVdtQjRvV2lpK1lDS2tvaUNnTFRkck9zSmd0TEdZSEQ3RlVJ?=
 =?utf-8?B?cUorMHIycEtVUnF4c09IZVdCbzRlNGRsZjB1U2dZM1hGQUlNdzlHQVFwZGJn?=
 =?utf-8?B?T0JYNHhuQVdPQkk5Y1pYWmt2N0pOS3Q1LzBLZTA5bHpCaVRoT1RwdnFNWHF3?=
 =?utf-8?B?SytiTDR3L09BcFZoaDJHNk44TVpMTWxFdDRzVVJtdUI4S05RYkdka3owYTgx?=
 =?utf-8?B?VmpjcXVuT0xvN0pmYTZjTStqWGhaQ1FpYTBtaU1Ga0RucnlwM1JpWjEvcHNQ?=
 =?utf-8?B?d2hCNHE0V2QzVHFhZHZXbGdleUhEeHZHMWtrZUdRVmovc1BkUzJXNjJDT0xT?=
 =?utf-8?B?OVEvS3pCdDRjZ0pJYmk2d2tNWlJ6aTA5K2JvQVp5ZG9mRzF0NW5Nc1dIYldx?=
 =?utf-8?B?elhMemo1Z2pMUy9JYXBHZ1ZJMEl4ZW4vdGN0ZDB6bzZRUk9vYm1pT2JUdlJU?=
 =?utf-8?B?SWF5QUtHdTRMNWtWaWtRb09VZWd6alZvdjNBR1V5bCtCRFBlK2JKbmtHRlBH?=
 =?utf-8?B?a1doNzEzZENaKzRDY1JtMGFQTjFJSlVEL0FBdi9ucHpydkU0a25kT2k4NHhU?=
 =?utf-8?B?Y2o2ZE9jNkd5ZjFBMmkvdmE5b0dWMHFNYkk3OHl0UTJVKzJzRVpOR1RKUm9v?=
 =?utf-8?B?V2dMbXpiQXQvR0hpRWNETTNtUjlpa2lHZjM2dm91bEo2NE9WMDZqRFBJbi9z?=
 =?utf-8?B?NVJTenRCRXdjaWZ5THUwRHpqeWJXdUo0NU0zeDUzeHlLeVh2QUJVWVBQeUFx?=
 =?utf-8?B?QVJMek40UHBxSWk5aDMrenpKcXJBNWcyUHpCcnZZRU5MQU5EZENrVG5RVTlG?=
 =?utf-8?B?Nm9MSFhMTVBJU3ZxRTNHZVpwNEVjU2N3R1lTM1B0YThwWm1ieFVWbGErTWNH?=
 =?utf-8?B?Q2hBdVRIRG1HaFpxZHovOStVdUNXSmJRYjhHREhmWmxid05EamV4UmhzdDFH?=
 =?utf-8?B?SGo5OVdqQ25BRG9Rb3FkTTl2b2pPaXROeC9NdE1ybzhNQlVyVDBJN2pmbTAw?=
 =?utf-8?B?WnZGb2VqcWthOXZVSmFJb2dhTCs5K2dneFJkMkFuVU9zalBQbHUrWjFCUVRL?=
 =?utf-8?B?UVhWUHJIejIwZ3hXMUViZDVPR0k4NVh6OWQyYjhXVDQvRWQ0MkphK1BYWUJM?=
 =?utf-8?B?UGZDazNmVHhoeTQrQVBBc1F2dDFzMXRaQ1h4RUNwbm5BZ2VsS3NKa2RhREFV?=
 =?utf-8?B?eWptdVVLZzk3SXBtOElQRm1ITm11U25EekZaV0xKeDdJdHNjQ2xiMzB4d05v?=
 =?utf-8?B?a3VTMExrOHArUzJoZVdVcG1vZzJ1ZUYvMzRMNmFUL2F6dkdGL1ZkZTd0bmpE?=
 =?utf-8?B?aGFod1kxdm5ldHRxUmRiU2FOM3ZYWVZ5cEhudzBLb3VwamVxTEZ3V3NncXlK?=
 =?utf-8?B?STc4bEhpcDVGRC9LVXNMNnBvdTZ4ZkViR0lINTROT1d0M3lwVlV4R3B0U1dT?=
 =?utf-8?B?SDNZTjhKbXdFQlBGeE1oTnhhSWZPUWFodTB1eTYxYmIrWnNvS3JYMmxqSGdY?=
 =?utf-8?B?Q21XaGV6RHErbjE2RWkxVjNiNVgzbExNdzFrN240ajVTRFJmMlpNVStNVmp1?=
 =?utf-8?B?NDJMbkdKWWRlMWRiWFBDdXZGOWhkUTZtVHpyN0dsSEdmWGJPSExXSkNmUFNR?=
 =?utf-8?B?U0pnU0JlUG1icVo5aWlHQUhIOStxNHB1a2x6YlFteUdta3Q3dnByaytpMnZi?=
 =?utf-8?B?em9VMnluZVE4MktUVTAyRzZrTUJqWm5GbktrK3ltcFp5MUJ1MytOR01PSjRC?=
 =?utf-8?Q?kPaUqjFC/4QjcC7hk/qsEBuHBlXvwCQF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjhBM0gwbHd6Vkxad1RrSnI4WmNhcC9kM2pOajBJTE9wMVhvZUdNbytCbHdC?=
 =?utf-8?B?T2ZBRUpqaGVLVzNlMmY5NXVxN1kxVk9BaVhIVDJwNHRvZGRZV2FFbjkxSWJO?=
 =?utf-8?B?SHYxK2NjdDQ3YmVOY2VBMUUrSVoxUVY2TWZYZ0R0bHNBOHpSamlDMDAzblBw?=
 =?utf-8?B?d0JYNGMzRjk1bW1CRDBwU21semRIV1E1OFplM3BSNVhvQXl5Z2JXU1RqbDlo?=
 =?utf-8?B?ZzBOL2o5TjFUZ1FScXVwaENNZXhhMS9YeStWM0lRSkxPWWFKUU9mdTIrem5D?=
 =?utf-8?B?Q0F6eWRKZFhGdnZ5R09HN0JyenNOWmlFMldDSWR3NFhnSDluZWlxc2hiOUxU?=
 =?utf-8?B?VDhrczBmMUlYMmt3UU85NnNFV3A1RFFNT0pPbGhLbnR3WkhHaVZpbTJLcWY1?=
 =?utf-8?B?R2o4UE9uaW0zSkZ6ODl0am44K09uakhyNCtsKy9lcXZNVElNMW1RcFdDRHB6?=
 =?utf-8?B?SjZrVDZkcE9PY0pMcncvRVpucHdESU4yYmxUZ2Y0YjRiRy9pZjlQWXF4Zm04?=
 =?utf-8?B?aUp1Tm8yeTB1YkM2ZEVORTZGWHhDZTZ2K2tLek9QbFNSaEVxczVMb0pMemRj?=
 =?utf-8?B?TW01eXl5RnlTR3ZTSFl3UER2d3lUMVhleGhNN2FoSXZTMnNEdDB3SGRIcHBx?=
 =?utf-8?B?RGxmOUthbFZBSWdnRkw1dUZUb1h4V21oeXdvenRDL2k5dDA4TjZsRCtWUE5J?=
 =?utf-8?B?TjNFWDM1em9GMXJMcEc4TGwwZ2dDMEJyUHM1M1ZGTm82cHM0MnlkWWszTTZ0?=
 =?utf-8?B?NEhhalBmRWp0L081dUZsREpZWFhCZ0oxd0ZDbHNLYy9FeUNsK2hYV2JXUHRJ?=
 =?utf-8?B?S0lkcDJZemx6SWY1UGtyM0w4VGwrTDljbm1MNTVkU3VYZ0FtbW90S3NpS3RB?=
 =?utf-8?B?dmZvcS8xamFmTEZvYW1HNEQyYWlsbmtHQ3ZwSFV4c0VPQXFaRE15bVFpVkNr?=
 =?utf-8?B?a2FpMThYcURmSTFxU3Yrc2drQ2dueEJVNnFDcjdyM1A3Um5vRFkxMjFXaWVS?=
 =?utf-8?B?a1g3aVFuVjhIUkNPaVJjemNsSFlFeWlNSHlaZWxSUWR4Qm5jVE5NREdGS0h4?=
 =?utf-8?B?Q1dRcnhLeXl1akhzN3BFQWUrcXZGUy8zalNiSGVYekFoOTkyWkFQOFpoa1ZH?=
 =?utf-8?B?a2Z5TG05aVkrWnZzUTlEMU93TnFEbEpjdng4YkwxbFZEeDRZL0JrY2lLR3Za?=
 =?utf-8?B?NjZwWG0yVmpHSFduUmhCalZvYlZGK2dOeE9ueUUyK1lOaVU2N3FhdXdwZWxT?=
 =?utf-8?B?MWZHUmVzeXNTMXVDRW1Eb2QrUkJmOVNaZWw3d2pxVk9KbTNDY28yTW5xQ0o4?=
 =?utf-8?B?MWFTdEZJU2pERzZWV1UzdzhmVk4yVDU5NEpBQ09TNWU0ZFFiM0xmcG5JeG1j?=
 =?utf-8?B?SjVTc0ZDU1lrR0tnb2pvcW5seklJT2F3VE0wUDU4bksyK3VmNzE5YlplS050?=
 =?utf-8?B?T3ZGcEFwQlFYbUtTT01kb0d4d0NCb1RKaDVSZERlR0lvTjEwbUdxeGY0OTJT?=
 =?utf-8?B?R2VlRmdjSWlUOVROdUF6aWFlaVV5YnVJY2c3MFdYU0pKNUFaOE1mY0xacWN2?=
 =?utf-8?B?SmdwQlJSV2w4SjBITTY5MnhQb0dmS3dYYUExcmRZMkVHQjI4RmU5RTNTZmIv?=
 =?utf-8?B?QkRrODdYSGJ4TVYvQmJSdnV0MEdvM2w2N05razRaKzZXL3NUNXhTK0hKUUk0?=
 =?utf-8?B?aHRjMlp2dGxaNG9aVFEzQVVha3hFb0hzSlhDaUZTNkF2VDBkVkkwRWF3UVVD?=
 =?utf-8?B?ZnRLUC95OTBwMmFXMEtpbTROU2RObll4ditEOGhhU3B6NXVSSE1ZQVRUdDNB?=
 =?utf-8?B?M1hScnJqQnM5NW5zc2tLcldCdWt1aTZUM1pNZmUwdHl1RXpROEpHS2RURUx4?=
 =?utf-8?B?Um1wYWsyVTNKeE1lUWJWQXQ3ZWJBZzc2TlA2THJKekxoM1dvYzZqdFJqYmV1?=
 =?utf-8?B?V1FHSnZ0aGNRSDM4V0lna0ZyOFlGeGdzT1Ywd3FGZEs1N2JoZ0o2eng3bDlq?=
 =?utf-8?B?MnZqNEFndCtxRnVtMUtnSVNhRmhiVTRRNnNXVHNWN3ZpZmdBeUdFQ0VBejVS?=
 =?utf-8?B?VGg0cVdxN2I0L1hoWTl6RE1iYjU3T20waHlYZ21kOUcwZzhXYXdwOXZja0VT?=
 =?utf-8?B?TitSL1E1akpDWEhIZ2RxejhuVERlMFJqZEpUWDJsWXBwV1dMZGNQY082SWVP?=
 =?utf-8?B?VldxdTFwd1JXMDBIdlFlWm9VeE9nWnllSjQ5WVArYysxQkhkWHY3ZkVFaFJJ?=
 =?utf-8?B?OUhsdndQVTlhUmRhYVhWQVhpOE1DQ2VNaDY0MlJ0MjRDNFNTOHhvM0x2SHlH?=
 =?utf-8?B?RG16R0pkRGVMdCs3OGxwRm9sbzgrUmJEUXJjRlVIa1NzMWtQb2I2dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1612bf-720a-49c6-221e-08de4ec25bf7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:29:40.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pU1sD+Uun/SwWLjuB7XWhV0Aha/EYlZm/8nZ23olMynZppifwjvAPLqBcl49GsMNAA6uEgDP/2AlmbYGP4kR06h80by/CsDEU+PkBEFC7n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229076

Hi Adrian,

I see this has been merged but don't see patches on the docs ML, may I 
convince you to send patches to at the very least add them to the glossary?

Cheers,
Quentin

