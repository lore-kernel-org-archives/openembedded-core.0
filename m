Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF12CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 13:20:33 +0000 (UTC)
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (CAN01-YQB-obe.outbound.protection.outlook.com [40.107.116.110])
 by mx.groups.io with SMTP id smtpd.web10.77091.1755528137504244913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 07:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@efficios.com header.s=selector1 header.b=ZEvU/tLa;
 spf=pass (domain: efficios.com, ip: 40.107.116.110, mailfrom: mjeanson@efficios.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laoI6Y9cA/gWwB5AlqaMFADK6s0gStGJwjzK/risikSV9wjYLHihNQTNPV5Q9fhBeO7HEr8kNHB0j+svv48LVa8fFMXv27Mc0X4k7TnvNvBKB2FQO16DODuDHb0mL/bVpBgaTrZHn3/IyPcuy91FZsrFasaGTGZ8mLLQO+Qzwha5UMu643pYTRF93//ZnbNQVE8gBGOsblS3BRTpxkfsSUJT4zd6CvDnpjsior1kdhGlAgai9Drqi3MIyeG0wiz0eCKR5Novv3FGI4Sj6wKkcVxUXahYJpsvKdLt0RiyDEVDaG0BremEuMeWCSREUbngWg7UMOwfNY9676Pxf+xYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SmOhd05w7U/L0nGPPd+vCmFLl+hrGZrImYPZqpj8M4=;
 b=pvXsTR5H0+QsUszhAxPfqE8ICOchhLeyARrofn9PpBGnqc6GONrENaLJmL40i39TN1DG2H1l9ZkLUZDUYKpqhb6+n7JFcACyB226oUx43H6eVPQigdP5fH5AJFmuMkLVkg4eny1GqLriFlcEOjbmHDi2UycCmj1/7Om0vvivDlXd+LHgIYV/gageKsGBFRlW+SKn9fKsmGDceN/KGBCxbspl3RGg+B8+zLsX0nuhHArWJAaXcIdEkfi2mr20PsT0QQexio+6vnSBR7n4+kZgFfLZ5Y8UqGG3GDf/7MFXh1P6APhiz8bJafn/c3Se08bnJ+YM5F0ECne421cqHKt3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SmOhd05w7U/L0nGPPd+vCmFLl+hrGZrImYPZqpj8M4=;
 b=ZEvU/tLaw4md9uNsiAeFP7ORIqiIpIpllfopMsvCJE1CLZ16J3GVrnMtxM0bLPkGQAX1//N7ao70cwIEWOp8YySilBceSyfYDpyfzh+2NZa9u2M/fCLWiORGd93yMy1xEQKQS1obB9kVfjr5CLk4ACQz0/3SKj91icolPbiEvbC/U4pu15r+Vpa4kl8imfat9Jm+DVEHfL/geg4oVVIEteR+LVOBkT0YaBITiVUn/6VVVsiIs0/oKQSQ76Am8HrFsf8Mamzmu0atCrli4dM5/QzMYif8HmAC3hgapsOCWJgzOnE15jzQJIjuOiZ7X+wdLHhToIypcHp3ml3oOeeCbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:24::5)
 by YT3PR01MB10637.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 14:26:29 +0000
Received: from YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::be09:e1b:b343:7f9]) by YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::be09:e1b:b343:7f9%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 14:26:28 +0000
Message-ID: <5198402b-9c68-4938-9b59-c445df99b909@efficios.com>
Date: Mon, 18 Aug 2025 10:26:26 -0400
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 3/5] babeltrace2: Fix python bindings ptests
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
 <20250817205124.3384337-3-richard.purdie@linuxfoundation.org>
From: Michael Jeanson <mjeanson@efficios.com>
Autocrypt: addr=mjeanson@efficios.com; keydata=
 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 IZHa
In-Reply-To: <20250817205124.3384337-3-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: YQZPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::12) To YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:24::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YQBPR0101MB5080:EE_|YT3PR01MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: 68404d10-4ac4-4129-8b88-08ddde6337e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?SWlwMGxRdlpCaFQ0Q05TSkdBMFc0Z1RaeHBaRmYrbkJDaUJHSWgyaEt5OHR4?=
 =?utf-8?B?SzBNaXE0NUVoejFqYXhPU1ZvVHhXZDdkdE5MWHRaYmZZRkZZMGp5aGhwdk1q?=
 =?utf-8?B?amZYTFdRTFE1RzFoNG42M0ZObTZCblRHblV1VDZGaUFrSFU5KytkaWJ2d0lD?=
 =?utf-8?B?akJmQTN3dkVPdjh4dks2QlZLL2xOampTZ0Y3RFdPTFZTbWlnUXg4RlRucEl6?=
 =?utf-8?B?TXM4R0ZmaFI5T2JBeDVsOW4vbmErUnJVWUFBcFJSSjZJQ25OL0l1OTlBN1E4?=
 =?utf-8?B?MXpOQWpoVUZUcGE1dnc4em9SbTYwRnc4N2d1T0Vzc3VlYUxUZWp6N1k4KytN?=
 =?utf-8?B?Wi9EOUVIejhnR0piT3FabjhVZXVlVFVveEtNbUo0dm9RanZ0bHd2UFdoVzZz?=
 =?utf-8?B?MnF2SDF2TEZzR1FZUGVlTXd5eStFNHNGd1hzbUYwelVpUE1JeWtoZUxXdk5z?=
 =?utf-8?B?K0JFcUROM2VsQ1g2c3NkbmdmVGFYT1pVVXM1VzBYT0RyVWlzc3ZlQ0JOTEhr?=
 =?utf-8?B?b3F1YVVSZlMwQ1ZQWUZvUmZyd3R3OGtxa1FOVnF4Vmg2Q3RtVVJOMCtjNm1u?=
 =?utf-8?B?bmJEejQxVkF3ckVrRXRiTGcrUzdlMkJCYndDeWJySTltUmNpNTFxUFBRUzVh?=
 =?utf-8?B?cVdJS0c2MXBwOE5XNm4rajhHa1RGVWI4R2ZQdzVxVmRmcFdxZ000RVI1L2ww?=
 =?utf-8?B?Q3c2VVV4cmNtUjkzT0JSaTNEOWdJTWF1OFEvKzZNZENtZFZvSlZILzdZY1Vv?=
 =?utf-8?B?THk5dlBhY2NMbVZiTUE3cTMrTlB6TWY2WFlRWTk2TlhjZlh2TU9ucEdVUG1y?=
 =?utf-8?B?R0FacmVQUUZpZjY5N1pOSHhsZFBrd0VhbTFMQ2ZJM2JGcEc5Uk53QllKbkZs?=
 =?utf-8?B?SzRwY3E1TmZJTHFxSFpKdFJPYmIxdFJxMXFnTkRqSHZ4a29NY2k0aUJRUG91?=
 =?utf-8?B?SXByU1B1SitOR0ROOVhuOXFIZ3FadFZGa0dJNFFXZE9YajNHL1crVVRUVlp6?=
 =?utf-8?B?b2t2N2RtZGdETFhBY3VYd1hIRWZMOUt2dFlkSkI1dUt2WU9JK2E2Q3F2WEZp?=
 =?utf-8?B?SVZoa2p2aUhJUnhwaU12L09LcHRvNk4wOThqS0ZpelNZWlRDakltMjcxSStX?=
 =?utf-8?B?eFZiK0MyVjEydEQ4emZxV1BzWWJPMDdXTDc2d1BXTkJoRlliaDdTT0FjdndE?=
 =?utf-8?B?M3hpaXFVVXphbnl3eVpUaDVtMlNRTFRkYjZSV3pVcFJGNi9mLzJpVCtQMzNG?=
 =?utf-8?B?VzNlK0FpaUl0VGVOQXI5TTJWeU5xYXMvcEFhdEVyY2pCY01lQUk5QWFpSklG?=
 =?utf-8?B?WWZJdVNCQVEyaTZzMWFmYVVqU0dUOTMxUTN6MGFURFZLRW04cGhMd3VKemFi?=
 =?utf-8?B?Uk12RVpQMVpQcW5LaXEvNjd2d1FXZjZhRE15L1hxdjJUekwvUDNOU1pUSzVV?=
 =?utf-8?B?bTNNZlFHdXlTbmlUK01WS3ZRTUNhVjY2U1NINSs1SDR3alZJUFpPY0JlcWRG?=
 =?utf-8?B?eng4TktDd3hFQjNhc1NSUDR3TmUrMkFnVnB1SlYyVFBZU3ZqSE9wSGRqNHNv?=
 =?utf-8?B?UmtnREpJcEZlaFFyNXdFcnAycmgyWFV2TmpPV2RPeS83Vnpqc0N6aHpSelNY?=
 =?utf-8?B?OUZpcHIrd0M5V29pWElJdGNsRlJkeSs3QXRoZlVpME5TdE9VR2R0MDh6Uzd4?=
 =?utf-8?B?MER6TFYzbERzUHFrQS9nSHM4VHR4QVphaTNsdDUxVXR0TWQyMTRBZzhDTGpN?=
 =?utf-8?B?SG9hMHZNb0h3MEdETG1ha2dqZ0F6NjVkWkNnekRCUGlPZndaSzN1T1hBL1Bs?=
 =?utf-8?B?MW4zTjY5Mi9RWDlyZzhvRzIwaUVtZklZeThnZ2RDNW9wWjhRWkJmK1Z3dUh4?=
 =?utf-8?B?WTZLdGlndUVHd0VBVFZCRUhHdHRQY2FLOHlPR0R3SU9mQ3hxUXlsSndzUXdK?=
 =?utf-8?Q?VqI1LM4+6yc=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?UG9VMzZOL2NFd25UakVlNHJpTXRWbmF3NUpiR251WDg0cnRhbVFDWWl0Q0tX?=
 =?utf-8?B?R1NEc3lwSm92NUYxMDlGNHpYcHE3di93TC93eTlOVml1WDQyS0xnWDYxTnhD?=
 =?utf-8?B?b2piMm9sTEFEZ1V2b3hmK25XcFdEZ09lSEJMRjBHeXU1dW5tOWVOWjdjNkVu?=
 =?utf-8?B?N0dVM1p6RTdQd0lESW1kWDMwTlZoSS91VUtHSnJKbitWRHF5Y0Q2NHRGWTg3?=
 =?utf-8?B?cnY3blE3ODh4T1RPekloUWNQSEcvd3RCZDZacTR4YjV2Vkx4SnBpcmZYS080?=
 =?utf-8?B?a3plRHlDeklBUHZ1d3FaS3o2YXl6NlFaNXY5Q2V1Q2ZlTWg4YUN0ZmRGWENx?=
 =?utf-8?B?TTd0UDNFbHh5ajVnYWpEb0c5UWF2eW5UdVdKQW9HbERYR0h3RytpMmhnYW9B?=
 =?utf-8?B?U1AwR3hsdEE5WWx0SERuT0VrQUp4YmZ5dzZEb04rdXdIRCtJNURsMFU1eUdM?=
 =?utf-8?B?YzFYV09QT3FldHhwR1pTY2RkRmUzN0NudXVFQ2Q3NFNRWkV0ZFJWSWY0Rlhl?=
 =?utf-8?B?bVR6YklEUVFzZjJtaEdZUHhzZkFEMGZvc2U3U21QQ0o5RVc3TEEvRVh5cHdv?=
 =?utf-8?B?MUlCWkhORVVLVmFUTTgrSlpWTUFYQkhMaGtYMFlMS0R0c3pudUpxbmJQOHFa?=
 =?utf-8?B?SDRmdm1zQXI1TFJJV2IxM29Wb2xFZ1pQVmJ5SWlpQjBTZkVad2FXQW9JK2x5?=
 =?utf-8?B?a0RLSXNmdkQwcVpyRnY2UFdvN2VNa1FqMlZFS2lQejdJZWk0NUJVYUV1Q2h2?=
 =?utf-8?B?K2grbUxiWVhsMXdLdUw0OVNYeFN5SktRUGJZdytUWjRIb1l5UzdCek0veTcv?=
 =?utf-8?B?dXNXZ0xMSnI4YkdqbUQ5dmcvUmdsNnBaL04zb290SHNjZ0hXUTdZeVlSeWVY?=
 =?utf-8?B?K3IxUFRONGF6TGc0VTRrbi9yZ3dRdzNseW5INFJQM09jNC9qQnhZRjdQRVJ1?=
 =?utf-8?B?NW5PVUtaZXp2NWVXdEQ5UUJsNTlQK2pCU0N4S3l2TWptNWdlbGFhZi9JYmhw?=
 =?utf-8?B?STV3MTI5akVhWWo0QTIxQ1ZENmwrWUxxZ29SRHlYSFYvbXV3UWhMbmh0Wjha?=
 =?utf-8?B?bGRudlErU2Y5ZG1FZXptTFZ0ZzZaOWp2QWRaUkpZY3pZT3E2KzNYS0RZMEw1?=
 =?utf-8?B?ODFRVEtma3Q5bW9rWEI5a2p4M0dIZWdsNmNiRUZsRlByM2syQlQwSVRzVGVz?=
 =?utf-8?B?RFBHOXBEeldvQUEvK0w5OXBUOC9PcU41V3U4cDk5S2FoZnVTYVRnMXdJU0FP?=
 =?utf-8?B?UHVkREdxd1dEWndTY2l5eUpWK2J6TUM1dXZrUEVCVHBYaHM4cmVEYWVjTURj?=
 =?utf-8?B?MUE2cXMyN04ydzVNZ0xXdTBIZmplRWt2dEdVZlY3WGlKVngwVGpCQUZrNXYz?=
 =?utf-8?B?T3FaOGxER1BFdHViNUNjOWl1ZWRWbDRwdGw3amZvcE56YXZrd0tNNUlZSE84?=
 =?utf-8?B?eVBNWWhvVXZxNENyL2VCQ1FNeEx4eWk2WEx2dWpZeXB6cFlVajRHckpzOHdv?=
 =?utf-8?B?NEJHZk93VHZrK2w4NzduZTlxN0s5TlRqUmE2YWRlWDF4U1dMeTJDNC9kZkxY?=
 =?utf-8?B?NjcwNkY2SU9ENUc3ampzczhDT2FyUnpIeE8xN25ZRVJKYWVlalFDSnhKcHdy?=
 =?utf-8?B?Q3MrendEUWJDUkk5bVBsSlBERDRuc1JVVjJMYzhYRzE3UTU0MVNJV0I4VEll?=
 =?utf-8?B?SzRlSEZKdUYvcE5uR3QwemNla1VEcFBHN1NPd0ZQWENjWVk4L3pQc2FEZ0ha?=
 =?utf-8?B?ejNNR0RLTGhpOHJ3bUZLTDlRMkRIbHl5a21MZ1pJeXNBci9WNmxzVUxHeXhh?=
 =?utf-8?B?WFI3eEVNUlhTNFRYRGRTMVYvQ1VvUTdrNnNJaUJNQ3R3d3BDR1VxdS9nL0lL?=
 =?utf-8?B?Z0hOSk96eWtab3BKdUlMRlRuR2pkQThkOWRvZHk4QUpQVWI2ZFZBbU9lT2FE?=
 =?utf-8?B?YUREQ0pYek80UFd4eWJJMmlQRTdMK1B1dHNDbExSaUVwMXcvNlZ1Wk5iVXRo?=
 =?utf-8?B?SjNHYXc0ck9VU3h1dXQ3aldzZ2lvY3N5REcxS3JmdW5UNVJPZ1lqb01wT2RT?=
 =?utf-8?B?bStsTEtjZ3M3dU83d0hUUXVjZXNPZEQ3emhmdERCUi9rVi95K09TMmxGVHpz?=
 =?utf-8?B?SDFOMFR1UXJZU0RUb29WZnJkWStXemMyc3p5ckZaOVU1MGMvR21yMkVtckVG?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68404d10-4ac4-4129-8b88-08ddde6337e9
X-MS-Exchange-CrossTenant-AuthSource: YQBPR0101MB5080.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:26:28.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbh+vpKwLGPnzsSNg3OmoiAbJMNyc3w7oOJDiLoqmLAyzqyVOU56cdnPtDm8+ckKxr4CzClsuBkE8x514RE8GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10637
Content-Language: fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222112

On 2025-08-17 16:51, Richard Purdie wrote:
> From: Michael Jeanson <mjeanson@efficios.com>
> 
> The python bindings ptests weren't functional. This patch:
> 
>    * Adds a patch to allow the tests to be executed on target standalone
>    * Sets a variable to allow the right install path to be passed to setup.py
>    * Sets the right paths in the ptest runner script for the python modules
>    * Installs the missing data needed to run the tests
> 
> Base patch was written by Michael Jeanson, RP then tweaked working
> and formatting and added config to complete the work on all arches.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Michael Jeanson <mjeanson@efficios.com>

> ---
>   .../babeltrace2/external-python-tests.patch   | 126 ++++++++++++++++++
>   .../lttng/babeltrace2/run-ptest               |   3 +
>   .../recipes-kernel/lttng/babeltrace2_2.1.1.bb |   7 +-
>   3 files changed, 134 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
> new file mode 100644
> index 00000000000..960b33d9595
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
> @@ -0,0 +1,126 @@
> +From d2f528aa09a9001e63710470f6b700d122494961 Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Thu, 14 Aug 2025 12:27:16 -0400
> +Subject: [PATCH babeltrace] bindings/python: Allow tests to be run externally
> +
> +Upstream doesn't officially support running their tests externally. The python
> +bindings need some tweaks to work in this configuration.
> +
> +The patch was created by Michael Jeanson <mjeanson@efficios.com> and is under
> +discussion with upstream to see if there is a way to support OE's ue case.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Change-Id: I89555a3fbd821baa7088acc154e81665102286b8
> +---
> + .../python/bt2/test_component_descriptor.py   |   2 +-
> + tests/bindings/python/bt2/test_graph.py       |   2 +-
> + tests/bindings/python/bt2/test_plugin.py      |  10 +-
> + .../python/bt2/test_query_executor.py         |   2 +-
> + tests/utils/utils.sh                          |   2 +-
> + 6 files changed, 117 insertions(+), 9 deletions(-)
> + create mode 100644 tests/0001-wip-tests-yocto.patch
> +
> +diff --git a/tests/bindings/python/bt2/test_component_descriptor.py b/tests/bindings/python/bt2/test_component_descriptor.py
> +index dcad514eb..49a3c054d 100644
> +--- a/tests/bindings/python/bt2/test_component_descriptor.py
> ++++ b/tests/bindings/python/bt2/test_component_descriptor.py
> +@@ -19,7 +19,7 @@ class ComponentDescriptorTestCase(unittest.TestCase):
> +         self._comp_descr = bt2.ComponentDescriptor(_DummySink, {"zoom": -23}, self._obj)
> +
> +     def _get_comp_cls_from_plugin(self):
> +-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
> ++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
> +         assert plugin is not None
> +         cc = plugin.source_component_classes["dmesg"]
> +         assert cc is not None
> +diff --git a/tests/bindings/python/bt2/test_graph.py b/tests/bindings/python/bt2/test_graph.py
> +index 9661667a9..7fe247bd9 100644
> +--- a/tests/bindings/python/bt2/test_graph.py
> ++++ b/tests/bindings/python/bt2/test_graph.py
> +@@ -113,7 +113,7 @@ class GraphTestCase(unittest.TestCase):
> +         del comp_obj
> +
> +     def test_add_component_obj_non_python_comp_cls(self):
> +-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
> ++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
> +         assert plugin is not None
> +         cc = plugin.source_component_classes["dmesg"]
> +         assert cc is not None
> +diff --git a/tests/bindings/python/bt2/test_plugin.py b/tests/bindings/python/bt2/test_plugin.py
> +index 0d7a9e775..39451f93a 100644
> +--- a/tests/bindings/python/bt2/test_plugin.py
> ++++ b/tests/bindings/python/bt2/test_plugin.py
> +@@ -41,7 +41,7 @@ class FindPluginsTestCase(unittest.TestCase):
> +             )
> +
> +     def test_find_none_existing_dir(self):
> +-        plugins = bt2.find_plugins_in_path(_TEST_PLUGIN_PLUGINS_PATH, recurse=False)
> ++        plugins = bt2.find_plugins_in_path(os.environ["BT_TESTS_BUILDDIR"], recurse=False)
> +         self.assertIsNone(plugins)
> +
> +     def test_find_dir(self):
> +@@ -53,7 +53,7 @@ class FindPluginsTestCase(unittest.TestCase):
> +             os.environ["BT_TESTS_OS_TYPE"], "so"
> +         )
> +         plugin_name = "babeltrace-plugin-utils.{}".format(extension)
> +-        path = os.path.join(_TEST_PLUGIN_PLUGINS_PATH, "utils", ".libs", plugin_name)
> ++        path = os.path.join(_TEST_PLUGIN_PLUGINS_PATH, plugin_name)
> +         pset = bt2.find_plugins_in_path(path)
> +         self.assertTrue(len(pset) == 1)
> +
> +@@ -66,14 +66,14 @@ class FindPluginTestCase(unittest.TestCase):
> +         self.assertIsNone(plugin)
> +
> +     def test_find_existing(self):
> +-        plugin = bt2.find_plugin("ctf", find_in_user_dir=False, find_in_sys_dir=False)
> ++        plugin = bt2.find_plugin("ctf", find_in_user_dir=False, find_in_sys_dir=True)
> +         self.assertIsNotNone(plugin)
> +
> +
> + class PluginTestCase(unittest.TestCase):
> +     def setUp(self):
> +         self._plugin = bt2.find_plugin(
> +-            "ctf", find_in_user_dir=False, find_in_sys_dir=False
> ++            "ctf", find_in_user_dir=False, find_in_sys_dir=True
> +         )
> +
> +     def tearDown(self):
> +@@ -125,7 +125,7 @@ class PluginTestCase(unittest.TestCase):
> +         self.assertEqual(plugins["lttng-live"].name, "lttng-live")
> +
> +     def test_filter_comp_classes_len(self):
> +-        plugin = bt2.find_plugin("utils", find_in_user_dir=False, find_in_sys_dir=False)
> ++        plugin = bt2.find_plugin("utils", find_in_user_dir=False, find_in_sys_dir=True)
> +         self.assertEqual(len(plugin.filter_component_classes), 2)
> +
> +     def test_sink_comp_classes_len(self):
> +diff --git a/tests/bindings/python/bt2/test_query_executor.py b/tests/bindings/python/bt2/test_query_executor.py
> +index 099457197..9bbfd417a 100644
> +--- a/tests/bindings/python/bt2/test_query_executor.py
> ++++ b/tests/bindings/python/bt2/test_query_executor.py
> +@@ -129,7 +129,7 @@ class QueryExecutorTestCase(unittest.TestCase):
> +         del query_method_obj
> +
> +     def test_query_with_method_obj_non_python_comp_cls(self):
> +-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
> ++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
> +         assert plugin is not None
> +         cc = plugin.source_component_classes["dmesg"]
> +         assert cc is not None
> +diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
> +index 28db595d1..05b87f64e 100644
> +--- a/tests/utils/utils.sh
> ++++ b/tests/utils/utils.sh
> +@@ -143,7 +143,7 @@ export BT_TESTS_BT2_BIN
> + # bt_run_in_py_env() to use it.
> + #
> + # TODO: Remove when `tests/bindings/python/bt2/test_plugin.py` is fixed.
> +-_bt_tests_plugins_path=$BT_TESTS_BUILDDIR/../src/plugins
> ++_bt_tests_plugins_path=/usr/lib/babeltrace2/plugins
> +
> + # Colon-separated list of project plugin paths, if not set
> + _bt_tests_set_var_def BT_TESTS_BABELTRACE_PLUGIN_PATH \
> +--
> +2.47.2
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> index a0bf33b75de..55397c2dd62 100755
> --- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> @@ -6,6 +6,9 @@
>   # test plan to raise ERRORs; this is just noise.
>   makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
>   
> +declare -x BT_TESTS_BABELTRACE_PLUGIN_PATH="/usr/lib/babeltrace2/ptest/tests/utils/python"
> +declare -x BT_TESTS_PROVIDER_DIR="/usr/lib/babeltrace2/plugin-providers"
> +
>   exec 2> error.log
>   make -C tests -k -s $makeargs $target
>   exitcode=$?
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> index 88f589eafbc..52768f6ce3c 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
>              file://0001-tests-fix-test-applications-in-cpp-common.patch \
>              file://0001-tests-set-the-correct-plugin-directory.patch \
>              file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
> +           file://external-python-tests.patch \
>              "
>   SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
> @@ -21,6 +22,8 @@ inherit autotools pkgconfig ptest python3targetconfig
>   
>   EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
>   
> +export DISTSETUPOPTS = " --install-lib=${PYTHON_SITEPACKAGES_DIR}"
> +
>   PACKAGECONFIG ??= "manpages"
>   PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
>   
> @@ -67,8 +70,8 @@ do_install_ptest () {
>   	find "${S}/tests/$d" -maxdepth 1 -name *.json \
>   	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>       done
> -    install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
> -    cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
> +    install -d "${D}${PTEST_PATH}/tests/data/"
> +    cp -a ${S}/tests/data/* ${D}${PTEST_PATH}/tests/data/
>   
>       # Copy the tests directory tree and the executables and
>       # Makefiles found within.


