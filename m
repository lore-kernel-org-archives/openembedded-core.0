Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB73CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:23:20 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.45])
 by mx.groups.io with SMTP id smtpd.web11.12900.1760700195929470637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cqwHjp6f;
 spf=pass (domain: cherry.de, ip: 52.101.65.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBxn+rhEAZBn6XZUrUEkidMcVXoW3TUAONlXAuWx+eixENuL8zsHoUy3dqiiKRlIH6Z4oPuT9ir+lhyNX3gFaX7JHn9LvdaxeNaXXs7sd5HD/IsYT1L5Alz/u3RBbgMuh7x8TNGDEAW9q5infr1uJvl2/NTrLRHgDqRim78aYk6LBqIJRJmp0kk5wvKGCM7HN7pDyGrO65rU05sLCMcPfM9xK80kn4saTZwiqIRxNZfH39kJQOQ0nXJ7sAFjzJghpHUJEEInOsQRUvYb9E6cUEoCxBAuSug/In3LUuPTYu4BkOwD0pMjMWsDUbejNc1+wRbkGL1E9rpqSvhC/GKeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjINl2DWS1CvxneW5GYVcEG6tYLxjKyZGfJtaHJUa8E=;
 b=S7al9Kzf/E2Yiq7iHCnuJFmy4iHXeHCDPp46O7WNd27V7CEsywfGS4sNHo9rmCJdKvyHg9JmVjOUvyHKSsa5l3fsYa+KuadEN+l/RIx8ENZP7RgLqytyL+ttwrpH9Qq02tCLdhs0t5lHU9pq+9Mt4naxqZu//dLcMJ+6qTlEewr7/tWjaXkjGNWs1eaiCc0tiJ1N31CqNY/UXyzrT0m1bdO/e+pph3tdV52+jxX4KyVMNTWoHD1WEKzectdTqYY757sj5bWcPY24TuBdbMRwGUm5cBiTAzlJ1uY7zbbOHd2k05O4DHNjOXmvBdPkfCeUizdplXRIARKmOdmmUjsC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjINl2DWS1CvxneW5GYVcEG6tYLxjKyZGfJtaHJUa8E=;
 b=cqwHjp6fa/K3ZkOdPKve5wZ4kioHa/hwCP4UhvlKSCMBu1F5oIxHnnl2SzButne0zsR59cDDbwSMGcTegeqREFXgY0FocsGW5cV2FVc2cuNcjhRn2mwvrQZPjk1TTwpWOz6+IOREbE1KPBYGH6CyG8mgFHcHwW5KGtMCtK6WRLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB11573.eurprd04.prod.outlook.com (2603:10a6:800:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Fri, 17 Oct
 2025 11:23:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 11:23:12 +0000
Message-ID: <92173122-0c41-4739-b5e9-eb10e20b92b4@cherry.de>
Date: Fri, 17 Oct 2025 13:23:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: update 25.2.4 -> 25.2.5
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20251017104135.2635981-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251017104135.2635981-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: fba042f4-59a1-4272-3673-08de0d6f8ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUlGVUxlVmxYSmd5UHp5Z2tSMUE4aENrU1FsMjJMWndMdzVybW12dFVrTzll?=
 =?utf-8?B?RUZnZHZxMGdLM0wyL29PUmo5NERYbUozdjF6UWFVa0p3MkRhSjd4TldDZGZG?=
 =?utf-8?B?aEVtV05Ga2VGeTBkS2xuU1QzZ3Q2dEpudDJlcGRWV3dpdDRTZWNQNVNZdTNX?=
 =?utf-8?B?UnJiY3Nkb0cwK3pYVk1FSkRwbmUxU2MrS2ZvRC9vYTBaUmNycnJzcjl1NWMy?=
 =?utf-8?B?WXBhN29sb3NTOFZjOGVxcUdScDVCYUNGMzNod2NhNS9Id3JvV3NpaTd4bXNp?=
 =?utf-8?B?NjJ3S1hOQzNEUXhva2NVMzJ3TnNJV0NCcWxJZVVZUFZrK2NlQjhVWHFVU2hR?=
 =?utf-8?B?REtoeWF0R3B6TitHdFVXdTRwVDRLOWExdUtHOUF0TG5iT2NsL083QW41MkVm?=
 =?utf-8?B?cFVvVVJ2RDhQT05nTGxaZGRKSG56eDNDdDJ5dzYwMnhzVkVrejVJQnkrOXQ1?=
 =?utf-8?B?SE1qNnFrc0NGTU5VYmMveHpKK3dpTUxISlk0WTV5aldudVJGVjE2SFgrQWhR?=
 =?utf-8?B?NlUzbksweTRtRjd2YSs4dXJva3ROeTA4bEtUb3k2MEp2M0dQdjV2a0VOaDd3?=
 =?utf-8?B?WTdWdEVnVlZkNHJTT1NQR1hxOW91R28wcUJ4SVlreGVxQ0tVdDhJNkpvZElz?=
 =?utf-8?B?Z1daVDgydi9XeDkwUG8reUFMTXh0SWlEUDM0Z29DOHV5SWM4bkcwZXVoYytu?=
 =?utf-8?B?ZmpVRlE1VjNIaDg4RWc0SkVzYXl6ZExWbk13dXpId2F5cWhnRUtTU2hBRHd0?=
 =?utf-8?B?aUdzb2JhNWpJTklnUXpaVFlrMkZEZFR3RjNwZFNiSUQ1ZjZPWlg0V2VBVEgx?=
 =?utf-8?B?TjY3dXNCWndJRGVEUHhFZ09yQlQ5d1RnOWFEaDBXbDduQ2Fkb3VwNVBUcVFt?=
 =?utf-8?B?RUxyVjVxZlhHKzRVcG5ET2dXU05VUUc0aVhCNk1oSG83cUtRQ1BvN1hFcnlp?=
 =?utf-8?B?aEp0eUV0cXV6S1ByM09NZzA5Z3VLZUZlVGFrVUhsWTFtREdHU0F2TXFuU2s5?=
 =?utf-8?B?c3JvQmlmNllpSWRiOUc3V1pES1ZEcmZqWHo4dTV0SWF6NWNrNUk4bnI5eEJ6?=
 =?utf-8?B?UWpmN1o1eHB6TEtvZ1o2ZldFNTRwVHpoa2JibVdpTU9ORUlFY3RIZis0UnJQ?=
 =?utf-8?B?bHI2TDhUNDk4M1pQL2QrRGdoS05vUWEvdWs0V2xUNStadWNmdjI5M2FPaE8r?=
 =?utf-8?B?NE10c3pJRG5vOEtxMDhxU0dmd0V2alVtbXlGajQvT3hIdTBGVXNhWEJsTDd1?=
 =?utf-8?B?VVovZ1o3NXJta2FHcERqQm95NUtmYWFaR2lGNUlmSlFDbkRZVDZYM2NYUm9Y?=
 =?utf-8?B?enVyU2RxalkxUmlGMWhQcHhPYTI0R2VxT2pqSGh6TEpIMEJZRGJTK3Q2b2Iv?=
 =?utf-8?B?a3VBaklYT3VLQ3VWNDdKRUh6a29CMkxGeHhRV2o2QjdxT2pCZUZWV2JCWUVn?=
 =?utf-8?B?ODNYSkN6MlI1Q25vN2tLdWlSK1QyNlIyMktsZlRaVkdSTlkwTFdEOEFFdFJC?=
 =?utf-8?B?aGlBTHpTNTV6bmdPaGJDOEFoTFhjYytDbDB6U2RzMnlYekVGYnk2ck9BZHJp?=
 =?utf-8?B?VHFsYTdxQmhyNFdpMWlIN0JuQkdpWnZxOXo5ZHlLZTZtTGVJWVh3ZjB0NTUv?=
 =?utf-8?B?Ri92SzVlaUZhTXpjd2R3TWxJZmNoWUhGSGpPV2pzUmpUOGtZQ1JWZENVZmkz?=
 =?utf-8?B?WW1FNUxLQzBjL1RUMkwzdUNkZ3lZRVA5Q2FBVjlUdWhwWGdWVUxGZ1RVVm1I?=
 =?utf-8?B?bzRLSmFIYUNIZnZZUUpqQ25XMnRHeEJCci9KTTFKcGVOU2NiUjY0Z05zeUJq?=
 =?utf-8?B?RGdDVWVsSDhQa1FCTEtuMzNPdFBKd2Nad1NyQzNoK2lYbGIwd2RpSUUrU2JW?=
 =?utf-8?B?UWVyVElnbStMZmdIWWliWEFjTW9yUjl3SjA0cFFtRVl0NXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eC9waFlLY09jcWhhcGpOaVFrQWx2OFhFekRwM2o5UHY5TE5Cb3hNMlZrcHNr?=
 =?utf-8?B?bHJxS2M4SUtNZ09nL2RSdHRUekh1QU9OZzhFZU0yQXhaNFBYd0E4NTNGdmJC?=
 =?utf-8?B?WVpjTjE4cjBaakJoNGFrS0NVbWFjVEwyNUk4SWZvODRaUGNjTHFTTmJVTXVY?=
 =?utf-8?B?cGN5RktBdVhnV2lkbkZUV2FYcnprQml5MW9rREVaRGJMeEg3b3JXdXpwblQw?=
 =?utf-8?B?TFN6ejE2eVVhS2ZEdVhVVVB1amozaXRyKzJkT1g4aDZ0SktwT3piM09FeGpt?=
 =?utf-8?B?QVFmNy9BSTJEckl4cGl3ZDJKa3h3SG1mOS9iQUFrSU5EVFo1Y0FEWG1LSHdJ?=
 =?utf-8?B?N3Nhdzg4bWpkMFVHQWprZUJ1eGNtMkhIN1FhTkRzTGpiSk1RTXJWUCtuMlg0?=
 =?utf-8?B?T0tYdW1DVm1SMUJ6VFBJMnNuY0o3QzU2UXVVQ1BYYWM1ck9zSExvSDR2SERI?=
 =?utf-8?B?ekxiS05vSy9YMmRydXNpQlhoUko5UEhCUGdqUlhHaVh4YkZoZGl6L0k0REdD?=
 =?utf-8?B?eVVha1p0Z21xWVF2KzY2ekNoUG1sSUJ3S0RRY2VQd29GV2JLNTdsTWducGpv?=
 =?utf-8?B?ZlBkbGJRc3I1RVFPeUdDQVp5eFRqWXpKNnBwbGxVNEVLb1pGNGxUaHJjWjhB?=
 =?utf-8?B?eGIvaUswZENmV09FMEUrZlFPZ09kTlR5dDRETzgrT2llbzFqTUxCdElLb1VV?=
 =?utf-8?B?NWJQT3VkcXJpWXhNd010b0dnZnhtS3M2cXNZRmNDcmZmN1Z0NVJZMWYxWFIv?=
 =?utf-8?B?V3B1dXh5VHF1ZnV5aUFBSmsxRE9RVjhHbnREbFkva240Y0NHeTI3S3NpbzdY?=
 =?utf-8?B?UUFtbTVQU0tYRGdhL1h1Y09CczJhdGU5aWlBOGdNT080R1EvYWdxL3RYdnp3?=
 =?utf-8?B?S1dKMU1zRUFKdDczQ3o3cDhReG1kUVRUWDliQk8reiszV0lsd0lEbmc1QTdL?=
 =?utf-8?B?Y3M2OXRUWFpQWGpCVGs1UVdtWkNEZlZNcUtlL0JMY1REZDdsY0FFOEt3akgy?=
 =?utf-8?B?YmNtdEcyY0kwL3dVWXJYd1R3N2kxQ3VVSnRxcEM5d2duMmVmTmJuMndvTlo2?=
 =?utf-8?B?TTZ0NjRLMEk5NzFDQXVvVDZVOUFCWmNQWEZRRGpXczFsODkwMXlQaVJsOVZ3?=
 =?utf-8?B?TlRxbkpwa1cza1BEaUZUSzZLeUZzcWxadEhuVXdIb2ZNS0dVWUNmUmRzWHRG?=
 =?utf-8?B?R2srb1E0aGJCOHI2UlcvZS8wSGZRWGl4SUloRHBDdUErbTNOKzBjY1dWSlk3?=
 =?utf-8?B?VzZLZ28zUUxTUWxXdXlhNXpwQTh3YzZVUWtqUE9YOUVicURpMmw0VFRZc0cr?=
 =?utf-8?B?cG1QVms0TUpsdzY4bC9hZWtJOUV4Sm5hYjBRQkZkT2RTUU82elZqWjR5bnFM?=
 =?utf-8?B?RTVMTEttSS9aM0ZZeGFxU0ZWTWtJZVN5T0o1UHpyWDJweDRzaENKNWlHeUxj?=
 =?utf-8?B?MEJCcFFKbStUMDY3UmszYVJoakRZcFR4MnE4YTdIOHNreDkxUVpETDFycVha?=
 =?utf-8?B?RWlDNmVKQVJBdHV6cXdHT2hHdFRGRkkvR2YxRGV5b2x2YzlRcjRXZWVacDh4?=
 =?utf-8?B?dTZGQkZxTzlUdldCUnRSeGRRN29KbVZsK1k0dGdISGNBcm5WYXprNkRpWjBZ?=
 =?utf-8?B?eWxFUDBRUUl6QmV5Sm0wdGQ4dk1zWjNyU0MwZmxSVW44S09vOG9ndCs2SXVB?=
 =?utf-8?B?VW51SEE5aWc4QjRqbjBLU1p2OHF4MWlaa0dpT0tBZFEzM1R1T1RmQ3hJU1Ax?=
 =?utf-8?B?c2l1N0hqazNNMUNFN0dYclYySThaZVh5dU1KblFvc0VtZUVvR1NtTE50OFds?=
 =?utf-8?B?d2RnTDg0UHBMRDk3dmtpRTFzNm9YVmhaWDVESHpMcUFVeW9LQ3R6L2ZmM2VD?=
 =?utf-8?B?eW40MVE5d1pOVmR1VDRVYXc2S25LRitqcWh6dzcweVVUaU9VbkV0YUo3RHU1?=
 =?utf-8?B?MkN4bVJXa0VES1k3WnFUSW5BSExDUDRMVFpTUXN5bmxHVm5aR0NzeU9yNzBG?=
 =?utf-8?B?LzhjMG1xdEVqeGozMUlDajJNL1A5c1ZLNTlxMXZacHZNdms3Y2xoM1U2UUxF?=
 =?utf-8?B?dXRVc1o3NzdyTGhYQXlKaEloQit0amplK0o3REV4aHVTV3VmTW1yZmY2TFQ3?=
 =?utf-8?B?bFBhQXdGNWpNbUJGbXJJazRFOXU1blpjcTMrcC9WZzlDRFhFUVdrd1hQN1lN?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fba042f4-59a1-4272-3673-08de0d6f8ee8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 11:23:12.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKJtz1oYJdACuOIMaBkikYfsWMQqYNBEliu8vWGUC0BPgSkn4DHwRCDMU6VJ97s0USZCAIyKStACFeMIglEmqDE5wT4RPt2D63PnYmVl+VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225007

Hi Zoltan,

On 10/17/25 12:41 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Announcement:
> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226555.html
> 
> Remove 0001-glx-provide-glx.pc.patch because it's merged into
> this release.
> 

Thanks for the patch, see 
https://lore.kernel.org/openembedded-core/20251016-mesa-25-2-5-v1-1-08035df5e74e@cherry.de/ 
which I sent yesterday :)

Considering it's the same patch, maybe you can give your 
Reviewed-by/Tested-by there?

I've been told this will probably not make the cut to Yocto 5.3 but 
it'll probably end up being backported (though it remains to be seen 
whether I/someone needs to explicitly ask for it).

Cheers,
Quentin

