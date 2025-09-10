Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C583CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:33:22 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.9])
 by mx.groups.io with SMTP id smtpd.web11.19679.1757514798881955727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SwRwAOEL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SwRwAOEL;
 spf=pass (domain: arm.com, ip: 52.101.84.9, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Hux68g/Gc+JLbjv1dG4mocHQEMVt2GOaYYJGAomxT3JWgZxbWIgX4HIB7x0t1Ri4eU+j1rf4WRzL5j1v0mTxLON7792WSTz/6LLdO0xFxn4hIYYNh3x5PKYyyX6JIhyp5Q7YYfrtsuBKPrQ2Adqa9VGeTzpSqo7n2TTZgIhaRfxhJYC3XgumilHjgNi/2ktFK6iiirQif+FhzgWBdW0NyMc7Ax1+nJnqzX8E5Rcz69QEfqXXv+Cxo1HKtLWaAiUbehFcJ2R3fWzs8vO5e04/Z+1aIwolloTQYxDgWkOXo9hJTma+IC1tJs72rMa9ZYBUWnsmsOtNSlE0JQv9YByJ1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNCSaHkBd7SD6+9xLrle8h0eLWL7hPRRghr0489+m+8=;
 b=bi5eRXQa4CtntiS9GCKxRVSAVy3oSBjgxzFW/rHVAnkaQhvcdh96U51fLNDRYbWxEIpgi6gC8oMvFnYBEqMgIf0o41PVEel0A1OY7nD7IRQCDOgLYKRgKzCIcxyGZqFL/UE0eAhMtCOkqw5rXtCv4CHASeFgerYcMFNelhiqwp64chw3Twh7i/WeRkcAcukUWy8bRG1vFKVOxq3cvWi6yn5qzaV/C9UKFHkjlJz1bml057jlHtJmIe2fK/CxhQIsZ2okTOzxBUaxMilZ3q8XwrnP/vYLRaXIq41xQPTWuFTrwZ+azBZJRgrs84YKAOBoi7kzuPOZZeJWkmf8+bz4+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNCSaHkBd7SD6+9xLrle8h0eLWL7hPRRghr0489+m+8=;
 b=SwRwAOELjtT5rmGvfxMzN8Sb6imbzcZ1Lsum0IYSeDm94OisIE3eBs7yw4j3TM8J5QmoXjYzJ7xfoEN6engAglPVgfOmDV65t9Q2qQbosM3MgkLmj+B1eSINzf8SewrcG+rdqbktJFEHiCRKGwIkuJweLT2SK9LgRF9lcOP7kV8=
Received: from DU7P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::35)
 by AS8PR08MB9694.eurprd08.prod.outlook.com (2603:10a6:20b:616::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:33:14 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::db) by DU7P195CA0008.outlook.office365.com
 (2603:10a6:10:54d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 14:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Wed, 10 Sep 2025 14:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH0bFrTxOLvHTY/5YiI26OvTGdsb2x3fi9zFLqO8W63a9/j8kKagVBii8oEYg9F9eRRHAX51WAiWm3vzPbc22IYJYKqxKUYkJwUJHZYwzqKalUy1XQ/dOy2esOm7MCFGaSpsIZiWE1YjU1MrOnSRAunXf9u3UCmxKMxkltnRuFdMZ3v49t6Wz7Nk/JC9M1FkyOWadAanLmvRi6EjdfkWigEd2+8+DOzLdZ1J8KZIYG4fIXgxHPrZwqYRuCW8M0tEK24KQoMoefAuf9kWNUDMD32vki87mH1F/0hODg57fHW44oF0vwASthgnwGuVFxt8y6Xii1njaUb0W2E/GEgROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNCSaHkBd7SD6+9xLrle8h0eLWL7hPRRghr0489+m+8=;
 b=SIEoAvMntXDE0IMGUvKNmhY8gsXN3K4r2xL/RPiJHAM85aBL/RdaUHTxZ7M3cL2Hz8cfA3MWJTIll+fvlvNWbQ85VTWqAnQ6bRMbKl5IGZZj9588raMWuXE5iOl5RZefeZKZQas6Pn4uZveK5IHymJea6ACja60103q2fUL8L10EUBEbS4h+ELBzH8bYUQdkMkKakYTPqfWuz8EzexSytaFX80JFm5Z9JSUbt4AwAcX7Tv9pe0BlyC4TdN4dO20CJXBTCSu74fHE1sXOanAtm+t9AlsZiwRtqev1E4bCVKjYA5f5IKZ+bzBCpH2KUrtWeGknVUHdvpPeLzm4st05Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNCSaHkBd7SD6+9xLrle8h0eLWL7hPRRghr0489+m+8=;
 b=SwRwAOELjtT5rmGvfxMzN8Sb6imbzcZ1Lsum0IYSeDm94OisIE3eBs7yw4j3TM8J5QmoXjYzJ7xfoEN6engAglPVgfOmDV65t9Q2qQbosM3MgkLmj+B1eSINzf8SewrcG+rdqbktJFEHiCRKGwIkuJweLT2SK9LgRF9lcOP7kV8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10677.eurprd08.prod.outlook.com (2603:10a6:10:529::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:32:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:32:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: add --extra-space back for compatibility
Thread-Topic: [OE-core] [PATCH] wic: add --extra-space back for compatibility
Thread-Index: AQHcIlqQ+KJ0FmzJCkmzW37nV+eRaLSMemSAgAAAXgA=
Date: Wed, 10 Sep 2025 14:32:39 +0000
Message-ID: <0CC60829-6EB9-44A0-B863-2FBDD77600EC@arm.com>
References: <20250910135508.2383081-1-ross.burton@arm.com>
 <CANNYZj9FehWY8Y74sT1XNhZ=Q6H1SmV=7stdHgo5sMQGX8Bh_A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9FehWY8Y74sT1XNhZ=Q6H1SmV=7stdHgo5sMQGX8Bh_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10677:EE_|DU2PEPF00028D09:EE_|AS8PR08MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a44830d-139f-45a3-9432-08ddf076f96b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c3B4QjNuaXlxUUhVZmJJa3A1RzRWL3FBazMycDhycS9WQmdEUy9sQjRpVjFP?=
 =?utf-8?B?OEJJdDR6SGxVdVl2Mkg4QUREV25LK2hpUXJJR1VITFpyTEVJKy9TT2ErZVph?=
 =?utf-8?B?bWhMRWxhZ2ZEdVBHeTA4Y051bmZnenV3OWRuS1NLWmZPQWtGcjYwd1BQOU81?=
 =?utf-8?B?dnZCVmtiSXB0TTUxSkFvVmRiajZUZU1HWEoramxvWnJhNG9SYjZKdEVZVXpa?=
 =?utf-8?B?OSs3NXhObjFudWF2WTVGMHlWeG42Tk82OERxWnVhYkpPdDhXbVZhc0RQMm0v?=
 =?utf-8?B?a2tHL3NKcXVKeVZURUtNaWI5LzJZaDJuK2Nhd1B4RGFJTlFwdDRSS056eEdZ?=
 =?utf-8?B?UGN1dkRIM25nNVl4MWlycXUrNkwvM0tYakxFWmw4Vk5WMFNvck9lZkkwa0Mr?=
 =?utf-8?B?bUV1NWMzTUJ0bVVjc0F3TDJ1T3orZ2lVNjdHQndsSWtkbkw4WkVHc1lSVkly?=
 =?utf-8?B?TzBjV1hnVFFxSkZXT1pxeFNxd1AyRENETnhkN0lDZmUwVEV0ZFg2cjdRZlBZ?=
 =?utf-8?B?dnllcllTcjU5WGxROStZci9YUWVJRm42clV4aTNzdkpDWWJXaUdHRm1IL091?=
 =?utf-8?B?Wnc2ZDRMU0NBTFRKQjQ5MXVqVjBuc2FSMGFtNWhEdExUQUJ5WjNaaDFkYktK?=
 =?utf-8?B?QWRkUjgwaVdmREJlR2s1S0lucUhPdEpnUHNQOFBBNGxFRWJpTngyai9KejBm?=
 =?utf-8?B?c09MK0pTS0tKOGV4Wk0rVnMra0toVFVhcHd2VmVWZVd6eUduUGtnTHZpc1dK?=
 =?utf-8?B?K2dlUldnZjFhZ0NzbnA2S3JMN2Y2YmF3c0U3QnVmTXNyZjhQeVpXUjdmNXUw?=
 =?utf-8?B?M1AwdHZ1MGZoTzlPVU1hYzF3cE5mSVRzck90bFBRRmlhdVVDV2lFWTRucXF3?=
 =?utf-8?B?VGJkOWlMUk4rSlBJTDZPMmlSdGZmejlhV1EzMmE5S3dBYVNRWmY1cjJlWVl0?=
 =?utf-8?B?bWNsL2tyWVBuWk1OSEVRWXl2Q1NldHRxTE5mNGtrTzRySDJXS1Z0WmZvZ0hX?=
 =?utf-8?B?azhHZ2ZNNGEyVmJWOVFsTFR6NWFxZGVObExiSlNFbFB4bk54cWpDZGFmem95?=
 =?utf-8?B?RWNJN2xHd1JHckp2cG9UdUEyVnp2c2pkRTdRRFhYMldObnhzeVlncHdWRTMy?=
 =?utf-8?B?RFVnRkE1WVd5aWo5T2FtN3FsTlhSKzNBWmxLNUt3UjB6UEVmZXBldUw2QUdG?=
 =?utf-8?B?ZC9hL1p3QU1rcE8yREVyeEZxczdhOWNNN3dvN1Flam1xMlppeE44SldzNlJQ?=
 =?utf-8?B?RUhUNGJLdDRIMmlVNFdoc1cydjFrdTN2STdWQW5SY2hpSFlRb1FSYTdjRThF?=
 =?utf-8?B?ZzNGTysyTzJGdzhQZ01YRVBjY0JOcGU1aG5lZ0dGWEdCV3hiT2pyU2EyOS9j?=
 =?utf-8?B?aXFOTmVmSzRiWUs4ay8wNnBISWtBdFgvOU9scWdFTVZwMWIwOU0xa2F3L1RC?=
 =?utf-8?B?bFdDTFhtMWxuS01RZUtrdmlXbTRHYkRCbFhpbGRzQXkxVUd2aWJVcGpNVUNP?=
 =?utf-8?B?ak5INk1tWTliK3hQYTZNVFhLY1FRY2dhbVUyYUJSdUp0MlJhcElVZmRiN28r?=
 =?utf-8?B?ZHFrMHJhZjBjTTZRQVQ5clNWMEphM1BFc3NCTzNQOFl5ZjY3Q1FmRUk4SmxD?=
 =?utf-8?B?cFZOTjNTWUxwWE5heHVrdVk0eFhlZys5UDc4dGcxRnBjQ2txdTJxNGptQ3Zs?=
 =?utf-8?B?OFRHSHA2cWRUaGdXZSt0VGY4R0EzeEpKSjR3anRBVHNoMTkyUHNDbW1oeEpN?=
 =?utf-8?B?VjFxVjBEVVYwK3k1NFo5OVhsa2dxY3pHclpZZ3ZDUW5JOG9hSS9hYXJtaEh3?=
 =?utf-8?B?KzdNZk1kZi9NeUJ0dU9rbnBIVC9sZUdCUVRTREZqWEp6VXdCRmJPNmx3allJ?=
 =?utf-8?B?MjE5MlVpMjlTYnpHWFJYekJmUWtFT3NMMlZvM0Rja1d5bEFlNzE3WW5TSGpY?=
 =?utf-8?B?WElCWjhMZDNRM2FvR1dSYnZpUlFOd0h5Wk5KZ3RnRk1hMFk1bEVnaDRTMm40?=
 =?utf-8?B?YlNZbVNCUmFBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD0A1DF47C69204FB1D3D7350CF95401@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10677
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b8057af6-b207-48e5-03cf-08ddf076e4e3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnlUSk5VRTArKzFxV2YwSGh6bUtGaXR4UlVndFBvazR2UGZ0allLSnp1a0hl?=
 =?utf-8?B?c2ZEVXpza0NFOFNIc3BFQlYwWHVMaEkrcFhGbGRSdnJkb3gvRThraldWdlpP?=
 =?utf-8?B?S1VTUWRreG1JWklDNE5XeWNCQXJOelZJRUVJV2hMMjlYQ2UzRktpejRoWlhV?=
 =?utf-8?B?UGJJSEo2ZCsraC81em8vdTc4UXpTT2FMYzJpd1krMThoR3RNMjcxaHpUTElJ?=
 =?utf-8?B?U2Ewd0NrR2FOWlpkMHpUNTNXckZadVRVT3BKMFRKTmp2amErRUdtMGw1MnEr?=
 =?utf-8?B?VTdkNG45ckR5cndzNWlrUW9LdXdrYlQ3LzBGQ0NQMGdOS3ZRd3pCUWxtbTFq?=
 =?utf-8?B?K3JmbUFjeFo4TE0xc2ZsZ1hMalZ0R2l1K09rL0lOQ1dsN251MURYTmZPSW9W?=
 =?utf-8?B?RkNPQXJKYmNpNFNKVm0vZGkyN2tEdnl3TUwrRjBUQjhFUjRiL1VmTFVXOHdM?=
 =?utf-8?B?NGFBSFh1V3czUkovRjJrQWtJWTdnUDZldFBTQlliVHowaFpwZGlCc3p3ekpn?=
 =?utf-8?B?RURFTVZIazdGc01sY2tRc2d6ck5NM2NxVG8yOERFVUVGWml0MU9LaFZtZlZh?=
 =?utf-8?B?NVZTZmU1SElHMnBBb2M2YXk3bGlwOFZVWlBtbHBhdUpVQ1A3UmZoY3dsek9r?=
 =?utf-8?B?bjFMaitTTjBuZ2ZaeTk1QTR0UTE2SGpaWVZPMndSbHVoQi9mZGVidEE0aDJm?=
 =?utf-8?B?U2RqczZTV2c5c2o0b0hEbnJKT2N0dlBYQ0UyR2xCT1lnb0syc2pkSC9CN2dY?=
 =?utf-8?B?RjhPa2p2emwwcmhKVnhFT2RFcnluUitkeVpsYkNWV2hPOGsvTC94MndRak9D?=
 =?utf-8?B?NVZDZ1NFNXc1UEV4MmI4bklFTUROdHAwWngwSUlRb0dTUDlXczFpMktYNUo4?=
 =?utf-8?B?eDFCZUdyZXJpUGlnVEFCRWFuRHE5cWd1NzRxSFc2eFZiZ1lLMWttRkVpaGxJ?=
 =?utf-8?B?cEFuYWxDZnk3UWQzdXphR0tRR011b3BnYmg1alNVaWpBVFUydnFhdVBqaUd0?=
 =?utf-8?B?aVR6MW1MWUQ4RnE0VlBhbFo1TjI1S1M4Myt3djlMS0J1dEhoVXNXSU1USzYx?=
 =?utf-8?B?bkN1anhIazgwRzdwbjZ6V20wU1dlQzFTNEp5YTBDVFo4VVZpYTd2TStodXVL?=
 =?utf-8?B?NEYrUHNtd2NsZ3lWcW1sY0JqM203dTcvOGxIYUxMcHVUYjZvcWxtMmVmWVhK?=
 =?utf-8?B?RmJYeDgwQUxKNEUvRFQzSHFnV3JLYXZBNkNHdXloamp3aC9KU0dZakhqVjRm?=
 =?utf-8?B?TjhCdjQzMWlnWXRVSUlEM3dlMXZuTmV0MmpYUkEwNnM5OTFqZExtUUI0WDVG?=
 =?utf-8?B?L0NCR2FzNTlKcC9Dd09TcTdBRHpLKzh5SjlpSlBZaXNRQlpiL05uVzd5L3lq?=
 =?utf-8?B?cnE3eTNtcHB0SVFvbzVPMElrS2tzVndMSUxzUUFqMDVYVmNDaCsvakVKbmdU?=
 =?utf-8?B?dFRia0ZVRU00dSsrNEh2dXU0YmhOYjQzckVSeXpEVEx4c0lXMkJoenVkTTlN?=
 =?utf-8?B?aXBmUlErbUdqSlJlTTlXYXNybDZtNGJoUGpmRFVLNktRT3ZBU2U5WlJhLzI5?=
 =?utf-8?B?NG1kVTl1RkRuSG1aaFFuVmFqbzBxVUcyY0xoRkU5emFBOWNFMDlLVzZFZml5?=
 =?utf-8?B?VmxUK0tGMjRwL3JJSlR2RHVJK2RDZVY2eVh5eGF6c09DRTkyWUh4SXNJZVIw?=
 =?utf-8?B?ZVZpc1ZTei9PcHJhMXZMakdWekU5cHM2NlNIUHZxQnlKOUhleHZ1bFNEaTBs?=
 =?utf-8?B?L3RQVTZ4bU1VQ3hBc3p0eDlYR2ZuUEFOVk12d2hYTFdWK21NUXczZDR0RFFK?=
 =?utf-8?B?L2FFVVB0SnRhQnFqVEVEMkRHVlp3YURhM3hUY0JFSVI5Zi9mblpKcUVOQjVR?=
 =?utf-8?B?bTA2OGcrekpvNlZBMUVoL2pTajc0SklIOTN2UG93V21Ma1AzWmdYREhYMXkx?=
 =?utf-8?B?NnM0WFVTTUdlRGZVUEhia2V5MnFwa0p1TTdEWmd6cnRoeEZQM3VkOXYvWU9y?=
 =?utf-8?B?OWNRTG03U2hDMkJqTHpmdFNOQnFIRXNOVXBpdTFHOVo2ajRGanJqWFc3Z1ZN?=
 =?utf-8?Q?+W80NU?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:33:13.7340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a44830d-139f-45a3-9432-08ddf076f96b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223220

T24gMTAgU2VwIDIwMjUsIGF0IDE1OjMxLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBXaHkgbm90IGZpeCB0aGUgZmlsZXM/IFdoZW4gY2Fu
IHRoaXMgYmUgcmVtb3ZlZD8NCg0KQmVjYXVzZSBhcyBtdWNoIGFzIEkgZW5qb3kgYnJlYWtpbmcg
Y2hhbmdlcywgdGhpcyBvbmUgaXMgdHJpdmlhbCB0byBtaXRpZ2F0ZS4NCg0KV2UgX2NvdWxkXyBy
ZW1vdmUgaXQgYXQgYW55IHBvaW50IGJ1dCB0aGUgb3ZlcmhlYWQgaXNu4oCZdCBleGFjdGx5IG1h
c3NpdmUsIGl04oCZcyBqdXN0IGFuIGFsaWFzIGZvciB0aGUgYXJndW1lbnQuDQoNClJvc3M=

