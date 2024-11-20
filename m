Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCECFD711BC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:48:35 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.52])
 by mx.groups.io with SMTP id smtpd.web10.16885.1732117714092720114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=T57TPYQK;
 spf=pass (domain: cherry.de, ip: 40.107.104.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUxpyRTTa7ezIhlfTYHdxiyP7H8WnrPduP0g5GM1NmIxOxobo+MOdNkjQ65h3f0iqYHM6EDRu+FzkYU8x/3zjqMvGjGsv0TKWhpsR7sQ+2LKdIBOdzRYny17Rnz8IZffn5mGy9GkBtMLNRoRAS2lYXfFP493zn801VoelmuxvBvJQJHVdjpWR0QBtQ4oZ+kcpwpsn6dcxE5vo0vqUtw/g6syyBNhfSrJhihWEwVPx7eCrieuPJFrE4F3EB7wyjnmwOhvzVKeH6eW2HTvU+MTklzJcGc/2ZWQTgB1EYZWKYJqbrmL91pQyPpmV5vZLrcDZUJgYTqpcppO3taPiWlZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbiXHs0WvA+lKvm795IkiMP9/qpYhalV6UFKXZyag5M=;
 b=F4Bn3CmQktDOerJUwrY8Ao+vIYBVDAc2ZuSuvSZMon+iaI7CWETeKBmzCoMYuHfuXKg/f8vd/fzLC2RaUxbyDr+V7ztD/1eafFYVMY2cGGuB5pRIfPymFjOT+P4tkliYpSHlEWEkZzT6HTT+mlsWaYOIouRLdRdj7RXF2ghit/IpUh0sHqC6TiRhuHroaBwzqfsNumHyr8hZJJqjX7Y5rFgX8vSGiamcIHUr7bEO5u56YQ+XDeZ+UMJd5s3y/CqbDCFwidHinJyiBs8d5Cr9L84+Rg84W/UO5JxY/yT3nQiFfEVZJZBFrwgLoV/kikUJU5pWotPDkvtGdNgWoFlo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbiXHs0WvA+lKvm795IkiMP9/qpYhalV6UFKXZyag5M=;
 b=T57TPYQKpdnq3R2W0e4gdkc28TXniu/MLEu0qeS0xFNBh3CbysbYG6L87qF9btLZSsobqLfBK9Jdq+arI9MmYBfcisjjYWaMVwc+ygFQEPe6We/lsf3oOn3yx0kv2/zKKoUERTbPSBd5vEgCv7qvNTJD4UCEGD39yvUw/Vrx3CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10453.eurprd04.prod.outlook.com (2603:10a6:150:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 15:48:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 15:48:31 +0000
Message-ID: <dcf7055f-cca2-4a01-95c0-da3936ce4fab@cherry.de>
Date: Wed, 20 Nov 2024 16:48:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/3] bitbake.conf: make
 ZSTD_COMPRESSION_LEVEL a number rather than a dash-prefixed option
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241120153205.2525735-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120153205.2525735-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10453:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcc1091-05f6-43e8-d9a9-08dd097ac85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFIwZEtkTzVkVGpvMytibWhZVkdYUzdwMjBhN3FJKzMreFphYzBvZUswdTRq?=
 =?utf-8?B?am0wakI4YjhGQUU4cEQ4T2YzRWhYSlN1d2VLTm1WUndCdHU1cFZCYzh1c0o3?=
 =?utf-8?B?Z09nNGtqeEVkOFdzUGovVS9sSUcwQlEyTHJkUkhuUVVNN05ud1lEbW5COTBY?=
 =?utf-8?B?L3l4UjlJVXAvR0pyYkl1aVFNUmVwcXlEdm5XOGVxb0RrY0YxaUU2MEM5aFpP?=
 =?utf-8?B?THJCc29hQ1NSRFpVeGlZamtDc2h6Znh4UWZLNktoK3dHKzhJM0kzZFI4NGtR?=
 =?utf-8?B?a3o3L2tzSEwvUDRjd0pjUDZkbVN6czIrOVJZb0oxYkF1R3JydWI5V05UcUFU?=
 =?utf-8?B?K3ZZUWpoNXYxbkh4NUx2MThuZ3NON3lZMmxOaThCOElic2JuOWZDZS9qK0l2?=
 =?utf-8?B?aEZ5bmN0NHNaenVZZTc4c1R1N0VjZ1k5M2JCSllEbUg3TE5UVWlCWUc5em1y?=
 =?utf-8?B?THlhbVhmVllXRmozUWV0N0x3MVZudzRqQVFSZGk3SzNPWFhsVmFwNW9US001?=
 =?utf-8?B?eU13c01UZmMxTUlCZTcxZW01VnZUT0N3bTRKRWVZOWszVCthSkFZQWdDVXFJ?=
 =?utf-8?B?QlFWeXJRbC92THhZL1JXZTYvaHpyRGVyTDd3MG9rTmdWenNrWlBabWtpV1Fl?=
 =?utf-8?B?VU1YN20xZStub1MzSkNMenREUjZvSjZzcFB2NVVjejFxUGxjUVA4UEtNb1c3?=
 =?utf-8?B?TDNZNEZ4ZDdsZVBCSVVsN1JpRlR1K2VXMVhhOTBYb2xTZDJQSDNjTXUxUVFI?=
 =?utf-8?B?VGVQMXpSNHFGMDZTWCtacDZXQ1VTTTV2M0haT2JQNUF4dlJNMlU5TUVINnI5?=
 =?utf-8?B?QTEvQnh1RjloaEtDODFsYnlxNE95QlNFS1M2NTY5K0lPR1A0RmNjUXpDL1hY?=
 =?utf-8?B?ZFhvL082QURQUHhrRUtDamJTYytwRThoZW8yQ2t0RDdpWTJnZFgrTnc0NmdX?=
 =?utf-8?B?UGpVS2swc3NMUzBRejNGNjNEQ0FCVlNuaGx0M2JSQ1Vvb0NkU3B5bnduUFA3?=
 =?utf-8?B?ZFJMUFhlRkF5VWc2ZldXblhPTW0wU2tCa0ljNVQrelkzMkFwYks2Rmh0azNv?=
 =?utf-8?B?SVVkb0dCSTRlaDBQYVkrb0tOMzVXWitKRE1MRjVZaG1XK2V1Qk5zT25xdHl1?=
 =?utf-8?B?amczZGdYWFhaRk53bWxacGI4aTN3bHpUMzNIRXN2ZlptankvVkhRbVQreWp3?=
 =?utf-8?B?dnQyazRGbHBiWTh2Qk5Od2NaTk5NU1RvR2ptQUdSSlZnNEVHWVRFTm5GZ01z?=
 =?utf-8?B?b0pTeTltMDhOSG9wRHl2QWlTdDlKcmhKa0plWWo0SFI4SytPekVLVWV2RnBm?=
 =?utf-8?B?cXFUcG9kN29maGl5dktPRWxlSnpZR0JsNzBia3pER0l4Y0V0dGxQZFM2UkRZ?=
 =?utf-8?B?L2dYS3NjNDExSkF0akQ3K2ZGZlNxRWZ2aGxaRzJrSERKekZZY1dhWkpGd1dh?=
 =?utf-8?B?TlRiM3FrOHUwUkY2a21DUStSUTZqNEwzNjBJZFRZUzRLNHgwN2J6UGkrM2NY?=
 =?utf-8?B?NjJ0YWFseVJqMThNc1UzZGVjclA2dk4ydWNnelNCRXFtTFdYc1F3TzhnR3RI?=
 =?utf-8?B?Wm45czRNV00wTUxCdmVrRlRXTUgvZENtV2RscDV2d2k2YWIrK1YxYWR2cEQ0?=
 =?utf-8?B?Z1ZzMlM5UE85QVF4bFhQWjRlWXNWTVJjYUN5aGtiWFpXZVNLSG9kS280aVRv?=
 =?utf-8?B?VDhkZzlDSm1Za0QrODU1QjZIQjlyVmNFS0wyYnM2RWNxelhJR0pvYTZYZkZD?=
 =?utf-8?Q?Rh43FJquBCNtF3hHVm1+CXWlneXswKpYLrFl97Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHcvRHR4NStCd1BUV2dNY3ZDb2d3bjNGaWUvekg0U0hFQzZIb1I1UDBTR04x?=
 =?utf-8?B?K1pLTmFaczNKZjF1aVgzRDdoRDFCbklLRUl3Z1NNMWpBN1gxYWY0cVNyOUlD?=
 =?utf-8?B?eWFvTGJGSU4wekIxdHpsSjZab1ZZS1JDd2JBc0lVZVZ6a1RvWkNzTVJjQmhh?=
 =?utf-8?B?SHM4bFBZeEprYkc1REVkcWdlYjg3QnluV2luMVNXL3hybnJ6SmlpT2s5Y0Ew?=
 =?utf-8?B?WGVsamNWeENCMEtCRjk1VGRNU3dwWStZUzhrbmhkc2c1THZBbDhqdlpMRWN3?=
 =?utf-8?B?dm5ZdU43WFFIcCtPNW02YUxQNlNVaHUza1VEbE5GUTJzQjhsTWwzTUQ4UjNk?=
 =?utf-8?B?NGYzZmZZai9QRW9DL1Z4ZUNwbUJZMmZrVVF4aTU4bVFnNWtSVExoOUZJdHF0?=
 =?utf-8?B?TGJJL2ZLeVVRK1JlSG9BRVBqRzJ1djRBa1hpdXlMSVNlK0dBcnFMR3RWOHkx?=
 =?utf-8?B?MURPOXFOem9LTGtVTjA4WGRaUnVBT1VpLzNQeFhwTWl5M003bmQ5Q2V0Vml5?=
 =?utf-8?B?MzJHYmFML09URXZIQXpROVFCTTVUSTJac3ZISFdyQ3ZOQ29HbXowTStYZDN4?=
 =?utf-8?B?WDRZRjBwbGloZFpwKy9kRGlpSWJKdEZpMmxmZ0xNZ1NRakZnQzZJK3dIL0VT?=
 =?utf-8?B?ckZ4Q1hSeUUrdEcxeEcyc0JJQ001WmdqVzVLaHg5SklpOWsvVVBhNmt6SjJv?=
 =?utf-8?B?NkFiUTkzSUlhZzJmUXhwL2oyMFlFSDU4VEFlRGkxNTZVRHNYSVh6VWpma08v?=
 =?utf-8?B?MXozSjlYZWZwM1NpeVFCTnBDTStUUUdnaHVJQjJSOTZPbFM5RHg5Y0Y3c0ZB?=
 =?utf-8?B?akpJdEdKVWZBdXM2N3luWExDa2lPck5vZVJCazVLc0FYQkJOMG14SFNWb3d1?=
 =?utf-8?B?Z0RiMnFqUzhkcndnQnlYbC9lNHZ6ZDYrWHBoeURVWTdOdXM0QllEMWg1aFl4?=
 =?utf-8?B?MUFNM1V5cnpFOU4xQjVOL2lER3NiUmZoT2F0ZGc2L3grR3FFS2E3emdIK0hM?=
 =?utf-8?B?cjkwaDVxeFlvL1BjZ0NISU5GQ2t2eXdod2ZXTkRzYmg1THdtaTMyR0xFYkZF?=
 =?utf-8?B?NjFNaFBEQ2x5T3MrWVBwWjZLbkhEV00yanJPcWQvMFZoQWpqQUhJMnphSEFO?=
 =?utf-8?B?Y0xYOFBWWUhUSU9UdmR1djBRVWliRXFpM2xyajB5ZUxuSjdMeUtCOFFIb0p2?=
 =?utf-8?B?cjBvdUFXTkZ0MmdocU9zemZQcE9BeStIV29mWi9Sc0c0MDc3cmFONE9PVUpY?=
 =?utf-8?B?ejhaYUZrNzZsMHR3M3NsQmp0Vm9OdFdSMU9KYnNGeGhla0MvV2YzL2wvMFlI?=
 =?utf-8?B?WExzYmltdG9zSEptTlJObHNkMDhDekdEcW9QdUIrQU1xRGJuN0Vzenh4ck91?=
 =?utf-8?B?a0wvWGdhNTBId3ZVOW9pQlArWjEzWVRBOHo2cmJUWXk1Z2RCUWxReUI1UGpN?=
 =?utf-8?B?N0pVajRjZHBZb0puY3ZVa2dqajAwSUFzZzd3YXJ3ajhLaXhzNERDQXhoYnpX?=
 =?utf-8?B?Z0VhaXNkYy85ZjJta0FWVFpra0lyb0FIYm9SVE5SVmJLVFlnZTBYQk5hc2lz?=
 =?utf-8?B?aFV6OVhtcWZYZWNrbW5FQkxub25MNytuZWd3S0ZyekRHOWdQbVp1VVBSeW9h?=
 =?utf-8?B?dXZzcHpXd1FlOGYzdjhNYmhnM0ZZRENzSDQ4THBxUTNYd01idEQxeHJneUtx?=
 =?utf-8?B?RUUzOEZQbm13UEoxQTZ4Mys5QzNLWEZ0Nm9SeFlCWDFad01OWVJMTm5TWXQw?=
 =?utf-8?B?eWdMUm5qckRnOVdrY0dPTUh1UTFtb3BhZnpqWjhueFByY0dXNTBQL1l4cHR1?=
 =?utf-8?B?cWlFWVAwZ1ZxWS91VGoveUpWRCs5QUhlZjdrMFFBL1R3U2dLNjRhL0VwYUpQ?=
 =?utf-8?B?ZjVNRzBrV3N5WHMvME5EOFQwSHJJdCswRnM0Ull5aUVZRHpBUTRpTGpZMEtw?=
 =?utf-8?B?bnpJWVhGVkZJNi8rYkRzLzVqU2M1S0lsdzYyU1Z4L2RQWGNMQjIvQWl6Ujlr?=
 =?utf-8?B?Tjl6Wk5lOEVQekFlRHdqNFFaK2pXb0FMTXpkNUpFbU9ZV1pQaGFQSmp3NGt6?=
 =?utf-8?B?cHdLNXVJM09MVmhZdkVJcUNENXFtUitVWlNqR0Z0cEw0WC8wOFNXZDFxZmdu?=
 =?utf-8?B?OFZBYnZwQ0ROSlhMbTg1OEcwc2txNWNQTjJOMHIzelJKZVFBNGxpc0UzVEhG?=
 =?utf-8?Q?BE+/Zp4vpEyyx8Yku2sysWM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcc1091-05f6-43e8-d9a9-08dd097ac85c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 15:48:31.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJPAT4ln3fB8rje3wJW7MF3Hu9YUf+QF59jKqIcUZj7P+rV2U+MnLXNO8HKiF/E8eaf5SSFNoYpIIqTbTa+4Sm4FmLQbFfb7G6vGfH4/RF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207465

Hi Alex,

On 11/20/24 4:32 PM, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> This allows using it where only a number is needed, such as rpm compression
> setting.
> 

Sounds good to me except now we need to document this change in content 
format (if someone was modifying it, they need to put a number instead 
of the number prefixed with a dash) in the migration manual for 
walnascar, would you mind sending a patch to the docs for that (or at 
the very least open a bug ticket so it's tracked) once this gets merged?

Looks good to me,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

