Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC9BCA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 16:07:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.24])
 by mx.groups.io with SMTP id smtpd.web10.52196.1754928469691387409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 09:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LuE/JQJw;
 spf=pass (domain: cherry.de, ip: 52.101.83.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQI41wKU1DRz4OZluBTU0Sb45n+LCwS3dEK5JEXmD3bN8N1il3KXSayQWzef/fc24O/bMH3RBi78DGcOlAoX1qxoWq8RrAnC9OoVLCu7ak4aFUmSPJDsExxV901nijvMmaII1ZbKPGss4Q0mcwa7cU64iCla2ROv3YRPTUonN/Pns6bK0S+sIzKkI6qZ33uYeB4hvJmm053p5nd2/yzF2D9gK5/XNA7dfzbbDPwMpxmVY6815RCP4NIU2ZtmSLFniJ/0iW2jd5BlTQiGUsnX5paU4cLChcHHgdnQSNodtgkRAAkPYAqP9fQSyLGOu2kzjWUZozAPfUARwqYrDwAd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpCOZgAhdjHr3Vfp7te9dT4p6qp+h44d4rPScbnCSOU=;
 b=TrLvxlErWHo6izQx08SbEXI7Ob5dncTssoN8qmjNvTbnTkg1wihDEnDoaeIs/SmY12Or5Phe4Xv17cwlMH7zkuStRNPDTUp31znO5+gVtrvU0+1k9fhxNc65SWRpEhdAyhv3Y2lk9Dai0wD4seYAALTynJ3Ns/nsyKRUKq6YR7diRF5G1htGD2+QnKmt9K+6TrISBD+WJqZ+Z2MVcXYHTWc2cIoLdJU+lofI12zr+YzkmymWL8l7g3cZlhhiyiWnxdQcxhbTP95bZ2WfM8NrsJInnHcMP7/T0uZF5CBil0zJGpJANM2SIZmOBVQ9oL+/SZFU20/j6h/25TGalGfvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpCOZgAhdjHr3Vfp7te9dT4p6qp+h44d4rPScbnCSOU=;
 b=LuE/JQJwjFrgMeXUgAcatX8u1+A33yc+FAAfs5bLr5MOT4C9/MYLdo1ajdft4GW32BxQujDGsLs5QjY1SQJo5edVeGqne1kXw7Ja7+UXaKlH05RK25cbq6qerGqqp96p+5wD2gxCRAqPrzFoSXcUcvp1QlcxqvzSiYm8TuyO02k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Mon, 11 Aug
 2025 16:07:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 16:07:45 +0000
Message-ID: <cde9cee5-13ea-4634-8361-d92318ea71c0@cherry.de>
Date: Mon, 11 Aug 2025 18:07:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] wic: rename wks flag --extra-space to
 --extra-filesystem-space
To: pierre-loup.gosse@smile.fr, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
 <20250811134804.841937-2-pierre-loup.gosse@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250811134804.841937-2-pierre-loup.gosse@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: c2737fcf-b3be-4fe2-15b8-08ddd8f13573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjYySDB5U0RUWFJ5LzZLYTROYmk0cGJSM0ZRMGdqS1FyVWd1SU5LUHdscEx6?=
 =?utf-8?B?Y2tsNE5LUFE4VjhGL2VCYmdpVjNSd2FYaHlOUUpzWkNwbG5vYmJUd1ZRZWZB?=
 =?utf-8?B?VXQ1RGpUUlgrLzBwTXVsZEk1ZUJSV2xxZEhTcmtPTk1tYWJ0b1ZZcmNSeUZE?=
 =?utf-8?B?Y3B3SWV2Q1REbE9ZNGwvd3kyN2RzOEpFMjdxWU5RUHhLSkZkSXd4cnZLenoy?=
 =?utf-8?B?Wk5zQVVXZ2s0bituSWpmZkJpdUs0U0s3allGTzFHVjlod0JKclNFWUlTVmJ2?=
 =?utf-8?B?VzBGWG9yU3FUWFlKeEZqZFU3N01LRHB2SkNHc1lRaUhKcUJkaGVHV2ZUQ2w2?=
 =?utf-8?B?UnZGTExIakRVRzF6QnpHUnQzVTk0UFJSKy9aZVR6S2dNWXdjeXdGMSs1V3Z0?=
 =?utf-8?B?RFRnR1JvdmphY1B4MW1wcXpMdzhBb21uV3BiVmNXVlBVNVZmand6bDcvRjMw?=
 =?utf-8?B?aXdLdHZzVTFLQVdIWVNjVjVCVUpwTFRLSjcxQWFSdVNKVXFpYThwaW1sSHAv?=
 =?utf-8?B?Z2t3T2VpbkZLSUJGeCthdkJIVHRaZXAwVlIrTTA2NTduc0RBaFBDaTdLeHcy?=
 =?utf-8?B?cG9hUzQycjdDa0FtSkwraUlBSHBNMWZYR2Q4TUx5U1ZIQWNwSzFKdXIvYW83?=
 =?utf-8?B?amlORllLTER2N2xRSXovZmdaOXhYZjBUVTBsWVN1cjhSQzkyOTQ4L1dmQWRp?=
 =?utf-8?B?QzdEc1hSZUxXUXNkMUNuS0tkY096Y21WYWpnMVZuYUROR1RHUi84RkRVNkhv?=
 =?utf-8?B?WVNCYTZZZG1vMHZSQjMweWFDbjV3OU1iRW12eUs5Rld2S3JXZlgzbExLTVhP?=
 =?utf-8?B?S0NRTDNzSlFONlRZdmZvdVhROHZ4TnJkR3ZxR3JGck5Qd2JvOWRDLzVKMGpr?=
 =?utf-8?B?Vk91SU1CNHBmTGxiaWtIVi82dEpjRWVoWnNvWXByMXdDbDNiaXNEa2Jra3hl?=
 =?utf-8?B?dnRhN1ArdS91VTVSaklhekZhVW5ib1ZIeWdPVlE5WGM4MkF1a1RRT1JWVnJ6?=
 =?utf-8?B?Z3JpT1ZndGY1Z2NlZEhkcGkvcUxGeGw4c3ovcXhQaXhDZXZRMjdkeE55Ym4r?=
 =?utf-8?B?Z25TZTk1ZGxaRE1nWWxYZlNabGF1L2JEKytDdnhEa21BZEpMWGVSYkczRzB1?=
 =?utf-8?B?aFF3UXpzQ0llVXNZRGVycitaTXNFZXBsclJ2cVpKSEhNTUdjbUxMQnRlVmM4?=
 =?utf-8?B?Q0xBL3VvZUxUQ2VESjJ6NXNsT3o0MXJpelVwb21SM3lRbVRmVXV1QlhvQ091?=
 =?utf-8?B?NkkrSVk1OWtpRXdjT1BIV3pLWngrdUw4cm1wVjV2K1VsT0dyZ1VYWUFrci9I?=
 =?utf-8?B?TWhwQnZBYm03ZW8vcC82WWFIYWl4MnZib1M2V3BIM2VkcmtRbTJhZnlBZTVs?=
 =?utf-8?B?ZmF5YkxWTGhBS256dmM1RzdzM3pmZlkrY21VSEp1cHdmcXNOMkIrVFBzTmNs?=
 =?utf-8?B?SFNoWEUvRFJIY0pEYWdYQXNqaVE1TXRiMXJJM3ZiUXFrRTJPa2dtRFlMTVRL?=
 =?utf-8?B?SkltY1JWakNPR1BDSStzdjNSQWduMkIxN0NNbVM3ejNaeGtTQjh5ODlCRE8v?=
 =?utf-8?B?TXZWRFV3UGZmdGxHOGVzOVg3ZGJNMXk5UFk5T29reGdQSXNMWUxsWHY2M1ZW?=
 =?utf-8?B?VExDelo4UW1xaCthWktXQmhpZTJJdm1RZ3ZwV1V3VGFZN1FyRGhZZzRkeGlq?=
 =?utf-8?B?V1BkYXBlNXBvN2NyY29uMVRsVE1tN0N3QzRTcFV3UzJvZDFkdzR2cm5Ldnpq?=
 =?utf-8?B?ekFBbTMxcU5hVlFvVDVZN2haTnQ0WURNNThSallVZVdyN3NtbXRqaGlNMWw4?=
 =?utf-8?B?Qmo4bGh3UWdlSEZxdW80MktmTzJCUzR4eFBQQnJCcWJwMFl0RUJJZ3N6VWtk?=
 =?utf-8?B?WGtSMVNTSE5mTEx5NE9YVHJ4SUZGU1dRUlFBMzJEamFRME5sZlFTK0pvM1Uy?=
 =?utf-8?Q?qWVLrRrsEck=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGR6cFA3eEtGTFBoMkUxd0xlRHZHYzNJRHpQR3JFbVlsOXRhbUNWR0prek1y?=
 =?utf-8?B?VnVsZ1N5NElLWE9PdzNhdTg0cUUxS0lURmVZYTJjRHJaQ0swalhjYXdHY3pD?=
 =?utf-8?B?a3VONEpDZUwxTTEyamd0eVlvR1pGTFZoeUxEZTBxb0U1MktYZkxIVWZCOGVR?=
 =?utf-8?B?ZzI4eHpxaDBNampmbkdaRG1IeXZPQXA1QzBFZGJrODdWQXRoMVJYVTRSWHhy?=
 =?utf-8?B?dW8zOGhBb0t2TStJM1cxRkR3TTZlQWE2V2RrSldRUlJ3b0dySDBScUNPN2pH?=
 =?utf-8?B?NUx6RDZVOXRaUlU5NGx5L3NncjdLTEp4alRHdFVrRU9ZVUtpUU9kOERMZUJn?=
 =?utf-8?B?bDNWdXNIUG9zYkx4OHNWK3FHMERERGcyNDRlVHIyeTZoTlhEUk5rYTBlTE14?=
 =?utf-8?B?UXNJSFB5aWI0LzZBR2t1VnZzR25RTzErV3Z6ZCtsYlo5YjQ3bWFKajAzaFI1?=
 =?utf-8?B?WlF0NkdicmJtZWwvSTFOYWNhSmRGQ3k5d2Q2VnpodHVKdlRyeGRhckhyUG1W?=
 =?utf-8?B?Smx5UHRPNnBNSldvZWtHMXJuZUJnWlRDdGdDOUlNNHRNK0pZenB2SDBXMG5N?=
 =?utf-8?B?aXRYd3dtcWNMRXhZUEtDMERWS0IvNkJuS1NlbWVzM3YwN1g5YVY3bGlwZlRP?=
 =?utf-8?B?NHVvUzBielpOM3hGOHRhOWx1cW5vU3JCSlVENVJvaFAzb2RiNUhsVTZOWFdr?=
 =?utf-8?B?SWNIRXppd0pXQTVPb2gwcFhhRlFmS1VEUFROZlFFeisxbWRLVVNUajJUWFU0?=
 =?utf-8?B?bjRkelZ6bEsycllTWGNzT0UxZWpYTGpnQWpsRDBFdFduTGVkeFdERHVTYkN4?=
 =?utf-8?B?QlhvUndHcVUwdnFYT09wZWFQWjlTODd0Q0VMQm5leGNSNTFWQWVZNm9Xc3o4?=
 =?utf-8?B?bGMrSHlGRjBhaHNaSjFPZ2tTN0xpQzJWM3FTMUNFeTB3VWpPUlRpd0N0eDdB?=
 =?utf-8?B?MStLWm85M29jbW5OVUtXa1hoTU9qcGFjSWs5bEw5Q21US0lsdlVHT252V1Bo?=
 =?utf-8?B?MFBRWjFqbnRncC9yVlRuZWx4cnBZNDhDQXRiS1JydUxQaXQ2ZnN4KzRGZlVv?=
 =?utf-8?B?UG0zOXNMZ0liU3o5enZ0eGVkek41UmZRMTdjcWJMdUE2MXFyYjk1YWNNNWkr?=
 =?utf-8?B?dGFLaExuOFJFNnVFRTc4dzZ4cUJuSEpGSU5Sd29lZ3VacHpGWU1Yd1dwd2Nx?=
 =?utf-8?B?MDNsTWgwVm5XTXIwNSt4UXlySnQxcUdzRFpDN0h1bDVvdHYzMG9IeTAreVVM?=
 =?utf-8?B?dm5DcjlXeWJoMnZtNTRYNVdlOEZsWnVIaWFMclBMTkhqaitnM05jVFAwZEVT?=
 =?utf-8?B?S2hWWmpnMHVybWUybVp1TmlXc2IraWJhWUNNQkxBbExsWG15Yzh5ZjFvUlQx?=
 =?utf-8?B?OUpJYW5nU2VDdkkrU0d1WFErZzY1bm5kcWhHQi9QUVVCbm1UazFLNVRWS1BD?=
 =?utf-8?B?aitiQ1FHMFo2T0pTRXpFYUpOSHRZT0JJa29ucEpZNXExQzQydW5BZ0ZXZ2d2?=
 =?utf-8?B?UUx6a21CT2NMeklSNW5rOUtib3hkYkcrUTFLUkZFWXdWRmhFdW9LZU1Gdksy?=
 =?utf-8?B?d0VCRXhaTlRER3B5bGltMzFrYk5VWGNaSG1kL1ZhSG02cG02YjN1c2puY3Mw?=
 =?utf-8?B?WWNmSHgzVHo2RlRYRVFIS0wwbnZGQVI3bTJ3ZGZYNkJBUytZSGZMMmtjNUZQ?=
 =?utf-8?B?Nm1EakxlazdoZkx2Sy8wYUczZStaOVFMeitqSWNtdVVnWVR4QTZ5Z1hxb2dj?=
 =?utf-8?B?ZGdhV2E3TTRjc3BBc2JxdGRwOVNJQk5tU0tzcEdDZEJlelljSWxURFFNZGdM?=
 =?utf-8?B?dmR0TXZWN0pYcitGLzd4Nzc5ZEFWNzhhSVgwL3ZXTnBxU25wSXJFd3MrcDAv?=
 =?utf-8?B?VzYreDJ6QTZJZnhaaFRjRFhCZFZFWm4wZ1hESlBEZVBYUEVET01Td09pYVVY?=
 =?utf-8?B?RU5aRGgza09RRDRiQngzRVYwcTRwZ3NzeTFVTUdYb0h0Y2I2ZCtqNXN6allU?=
 =?utf-8?B?YlN4K2hvS25EZGR0VWR0ZU40SGZIK2dwQU5LRldpdUl3aEZzMDA2eVhIYUpQ?=
 =?utf-8?B?bXJBbXkvSHJMajZFNnV0eGJnOU9KOUVhdnpEa25iRVU1SVBmZzV4dlE3QURG?=
 =?utf-8?B?Y05WWG9oSFE0MDNxSVZ2Ti9nZ2QzQk04NmZTQ1hiSmxIN3hqenNnUzY3YUdx?=
 =?utf-8?B?eU83aDVHYWxWZDRLWHUxcWp6QytVT3NIbGhxQzlIQUVmTHk4M3VTSnhjdzNo?=
 =?utf-8?B?YVhYYWxDdG9KbFI1SURJRGdvd2h3PT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2737fcf-b3be-4fe2-15b8-08ddd8f13573
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:07:45.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlO4y2Hr2kKLPlL+iN5RtSCMItdWuRR7mJRIxQkuE3ivFjapYDYiZDdzokkZAZRrOYCrdjfnKN/K5AW28wJpHBC9ueK/9W62g116ZjlA6sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221745

Hi Pierre-Loup,

On 8/11/25 3:48 PM, pierre-loup.gosse via lists.openembedded.org wrote:
> [You don't often get email from pierre-loup.gosse=smile.fr@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> 
> Makes a clear distinction with --extra-partition-space flag.
> 
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> 
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Would you mind sending a patch for the documentation (yocto-docs) 
if/once this gets merged to rename the occurrences of this option and 
also notify users of the change in the appropriate migration manual?

Cheers,
Quentin

