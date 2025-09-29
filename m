Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B535CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 10:17:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50286.1759141063856167660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 03:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rASdIuaz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2367b08ad8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T5KQov324749
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=krQrUnaWcbMiQVVxkuns31v5puY+XK84U7Rv/k/IzL8=; b=
	rASdIuaz5IZnUp3dZSWr7qKMAVPVkvUgUiBHIM30tttsfnOijM5wlqGv13vvx2VI
	bgYhUg/Ck6J21QCji+HIr9c/SX8K6QDQ5JPeHCOtzeWYBB8vtKKybwpxLttbhaen
	3mGCFTejQ2kHqKtaaCEMIzEi3OsGivbbqsI2B+Z1JinrjSeqhljLkzPbJ7PWTViP
	QR7wxAYb+wSNIzFS3I9PxDulSaVLhxv8BLRaSjfESsF2LTbkHjTio7xkoug/S3/t
	ouXVAzAjsJv8oePO1V9D62UgHNx8waz3aPv1QyQvxlxrVixdT6SdLM8C/04xw32p
	9sIThNjYBKzuZ26jKHvLqA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wsunt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 10:17:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmA2Gg1NX77dhaJ3FgxbcP9HC/2iW0KWyI3ICxaz2YWkeXn8VHC+I2NjnJiL1SHHKozMImZ/0H6Saavaekeq2klPc2UhjO7PyiJgmtyVZkzJNM53iPTFqWsABUry1kmrArs7WQQjI6CEM0BH6q+WOkzQAvTnSndOl/fsnqkDoDD8lJk606yG2jUFymDsyIQOuFr4VTJxqIcgYj4+CglIF7H8xjX7Ho2EeeJ+Y6uWyeBarvQ3WwtV5HCi+/yTMNw/350kvZbxYIo06QRS/GNMWGpjfl0Nffp51/fsI66qAHCqow81pyjCpmEspOizB8Wy5FvF+gvm+EBcr7gWc/f65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krQrUnaWcbMiQVVxkuns31v5puY+XK84U7Rv/k/IzL8=;
 b=rOaaRePhqQNNJ1/U8Heq//C46fFU9ih3KMFi4KGzKL+3pka/qQi8zmG3uKzj6JZY2BtdvkGZtcG0Gh6qbsUN+HygmHISd/dx2sleTkrlnxOLYAWGdb031A/26/oxWTqhu8V8L3bCFVk3sIpp/5MB3YAImKe+henxyTmVq++xD/VO6ZB5iBDOA1pwUXfOUGeOCVW/ZLiBYbqdZ62s6yMgaGN72gMrImXjh+FPcTz6YhZZWeDJHD7NkAno4nC+vdY5aSfK6ogUvcbcQyW9TnbgE/0Ydvi6Ew9W52GXJyBeczPFJMjwhX+WUaDT5qsWimSBmXt7+S+x0ilfMFEh3KUNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:17:40 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 10:17:39 +0000
Message-ID: <1540d6ec-a24b-4636-ac8e-46668dfd1651@windriver.com>
Date: Mon, 29 Sep 2025 15:47:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <09c1040b-742f-49a2-a36b-629104f1d1d2@gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <09c1040b-742f-49a2-a36b-629104f1d1d2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b6db9f-32e1-49f5-3032-08ddff416b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUV2WGFwRVRoT0I3VHU2ZFdJTk5TRjhrYTRybkJBOTRyVjArQXc3MFdpSVg5?=
 =?utf-8?B?RDR3WHpwb2ZpZnQxd2JSUllJMHRWd21LK0RHNG1OcS9MWWlJbm8vcnArT1lH?=
 =?utf-8?B?R3grTTdoSDlKdGZhbW5UL3FZS1ROYnRPZTFPNHZEbUM5aUZGeUF5aUdIUTBz?=
 =?utf-8?B?N1ErdjdJUDJvamxqajRmRWU4NUppdVcvb2FKVENJbkFlaUhidmxzVHR2VTZj?=
 =?utf-8?B?bklrM3NUQXFXUjV2RHRWWGJsaUNRbHhiRzlwV1lrUVRQcnFQVTFvSXRqdmNS?=
 =?utf-8?B?dWpLREVnN2J1QlN0UWJDK2VGbTRZbGNqOTRid3lWRENDdmdzZ29iOWZZLzR0?=
 =?utf-8?B?cnJ1SWtyNnZGZGl4eUE2WndTUmxWaURnNzc4S296RTVieXFRSU1mb3NQVys2?=
 =?utf-8?B?dnJCZkZXRHBweWxteWkwcDltSkdiaFFEUlh6TURCc0JVUi9iaFdlV01RTFI2?=
 =?utf-8?B?N05EZ2E2VExJbVkxcDJzUDd6R0RYSXY1QlV3WDZzd0l3RzVtdk9IMjE3dmJ6?=
 =?utf-8?B?K0RlbEcrSlVZa0IrRzhTcDF5QlJoMWpMZTJJUlIrdXp1cHNKazI2djhlUTZ1?=
 =?utf-8?B?dzlNcDJjMk9MY0FOT09Demxlb0Z6OTA3cStYQ0RlbW84T2Zzclk2U2J0cTcw?=
 =?utf-8?B?dkJYbzRwVkZlUks2YXB4b2JKOUVOMDRRZWN4MkV0d2R3ZVZYeFZqUUxscHJY?=
 =?utf-8?B?eHJHSXdPTnA1Ukg0aG1WOFVmR0xFTi9LSEZMUnJ2NGlWN0FWTDU5WHQzV1Ey?=
 =?utf-8?B?Z0hLNWJwSmZkbkNRVmw0U3p4cFBXbE1OYmtjSERJUnA3T0JDNGxZQ0NHWHhn?=
 =?utf-8?B?aklLVFJBY1VOeTUrbUloVjl0dWR6OVBaZ1ZjMnQ4VUdEN09GVStVV2owcVl5?=
 =?utf-8?B?ZVNDbUZ1RHFWeWc2RGtkNkFQemNqSlJGRFlBVyt3cXhZK21RczFHSG5raUJD?=
 =?utf-8?B?R0JvdWw4bS9zUlZ0Z3ZnQkFsblJMYjBCSHNza0ZEU29LSGJuNCtJSXNWb3RS?=
 =?utf-8?B?V3NsUlBSSFlJcXNSZGxMTVVBM2NlaTVJc0p5Q1RLQ3FNaEJoTHR4RlEyM2oy?=
 =?utf-8?B?MTg4U21nMXhlbFF4QVQ2bndXTXliRC9NdmJ3WEJZcERUdCtFRDdVWE4wc0w4?=
 =?utf-8?B?NEw2d2tlVkVNNHg0TlBZcGFXWldqWGxRSzhLSzBpdmxZOGhLMWNBeWRCRHQv?=
 =?utf-8?B?RDZ6bTlId1lxZGFpUHBrcDJHZmUwd2dFbWpvYmJ6VDlsbWdMb09jWWh6ckM5?=
 =?utf-8?B?d1ZpV0Z0YjNRenFHa2tKajJydGlBUWw5dVpURVFubEp0aEtPUW1JRS95R1R2?=
 =?utf-8?B?WFFvVG95L2NpQitCS3BPdUtGMksyRVJtRjQ3UHpEM0R6dTgxOFhNUlg2c1hJ?=
 =?utf-8?B?bWdYTm52UWlFd3ZnOUhZcDdjcFd2SWlod3FDTnV4MklOV3lkdkt1dS9lWHM5?=
 =?utf-8?B?bmNiY3piVTNiZ0JDeFpwT3lNTzJtWHFNbEJFN010TndwWlAwR1V0LzFUeFMw?=
 =?utf-8?B?T0c1QldDQkgxZ3lURUhqSXhua3JBT2JqN0ZPV3JTVUFRc2NMaW8wMUdBMkhj?=
 =?utf-8?B?enIySnUxWU5GVEZOTDVFOHN5Y1UxSUhCWk50Y3FWcHc0dVpvZzVaQkpvVXBF?=
 =?utf-8?B?YldJR0R4clBvUnpEY3lFS3g0TjJNY3RYUUhmRVlCVWlqWW1PWmM4Mkd6RUh4?=
 =?utf-8?B?Y2UwOExqdmVJZGlyOHUxUUo2WjhnWjlocXNqOGRwSkxtYld3SXF6SmQvdVRI?=
 =?utf-8?B?NTROcGhXQmhUeUFpdU1lRzVUYVNPeENkZ0kwclFTRUlyZm4vdmhNcEwzSlhs?=
 =?utf-8?B?TnRmSmRBMjMxWjQzaEltSkVEWnNjcWhjODRqZS9wakMwY2lwdGN3ZGpGSFE3?=
 =?utf-8?B?amJhMHcxL0hpRnUyRG50dzFNdU1ETHFMNFM1ZVBic0FPOVI0dlNZa3V4UjZ0?=
 =?utf-8?Q?Ag0kbfjj2mQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1kzaytTTnlLQ0dKKzZuN25UTWVuVzNjVHA1bDJ5WlJIN241UHV2RnA1YjY4?=
 =?utf-8?B?SUhzQk1TdG16QmNNcWtZb2FCWGpaVmNlczZiZmFCa2dkV3FEMDhVTmxZblpr?=
 =?utf-8?B?MHVSOWtaMVpSSnlFTEI2bFZtVVpBRnFVYzkwWGE4SnRQRkNGM1NDclJHVG1j?=
 =?utf-8?B?eTk2QW9Na0dlRjdVR1dwSlV1QWtNM09MOHExSGU3b0hhdTIvSk01bERCZTVQ?=
 =?utf-8?B?ZWl0eGczb2JLNEIzd0w1MTlPaHR0UHV3aEgyL3dET0hBOTdTTnRlc2NrbkRG?=
 =?utf-8?B?ZE5LYStHdmkwYXJidUFNZmk1UXlDWHdMVFRnU3JTUVROSUhSVmJzU1VtUVRs?=
 =?utf-8?B?SFFZa2FUZFVWV0x4WjVZZTgyMHk4SjZtOTl6MjVMOTc0MzA3VUJWSWU1bU15?=
 =?utf-8?B?anQyUFcycDJVenlvRWJPVkRpRnhTRW1qaDJGZmF2SjFGQjJkREQza2hpRSt4?=
 =?utf-8?B?eE95bk5XTU9ZcklHOHMyRjN3NkNER0hjL0NnYWRxM1ltMWxLZDJ3cVJCZkNa?=
 =?utf-8?B?NWNpVFN2V2dLRFhZZHlxZ0RxSFlhMEdEaGRTZjlPR3ZKdjVWcmV0RTdTMjQ2?=
 =?utf-8?B?czFwQ09uSlZFa2RZeHlOQ25RcmxlR013dzI4UjRTL2YwbFk5V2M5aGNEZEJx?=
 =?utf-8?B?c3I0VllFWGE2a2tnazU3aFJCaHdhMVdaYWxmSFBmQ0NkZ1FMNWFxTDBUcGdr?=
 =?utf-8?B?dlVMOXRJeFRnbFlHeEZidVFJRzRhRlB3MlM1MGRIKytjbC9vNm9iY0V2K2tE?=
 =?utf-8?B?T01xWFdMS3FvbFAzTEZGaUJjN3lscE9qVGdCcGFTL0pybTlXMzBNU0NiSjFv?=
 =?utf-8?B?SmtIbjUrdlhtbWhQYWMzS1JSNDZjRGlpVGthYWZMeWJ6SWRna3Y4NnN3UVp3?=
 =?utf-8?B?cmxYUklmQ3hkdGMxVlg5M2d4WXpQemN3YzBDWm9hb2hlVlB3TlBUOHJ2ckVi?=
 =?utf-8?B?c1BxK2Yva3o1NE9ROEU1NDlIN1hpU0d1WTQ3R2VvYU5UNzlzSEYyMjlBRmVp?=
 =?utf-8?B?SktsSWxWdjJkS2xGVXJqVFQ4MnlZRVUwdWpnVGJ1MnZWSzFEQjZPWnpaL09K?=
 =?utf-8?B?eng1OUxEcWJuQUtmK3daVmRnVjNLNWFSYWhUZTBXUzhYa3BKMmt4bE9HWUNo?=
 =?utf-8?B?Q1BoL3JsU0pncU9lNHBpL1Q5YlVJYkVKbTRIMEpDUy8xTHcyUGJpRzFrSjdH?=
 =?utf-8?B?QnMyQ2NmcDB3R3FkMEZWQzZCOXdVeFo5eEY1Q29WenBTeEIrL3JadlFjUzR0?=
 =?utf-8?B?Tlp4dE9sWGtRRW04LzIrcnBGVlR4RGdRZm53SlNiQnp6eE43bkRKaVJ4V1RE?=
 =?utf-8?B?VnR6SFJPYkJQVnlrZFFwNmRCWU1ERWVDMTd1UmpxcWh3Tm5haW9BU2xzMDhM?=
 =?utf-8?B?Y3lhVml4MzdKNXZUVSsxRWxISjF2ajBEYUdnbW03ZEVrdWIyeWM0a2VCZ1lX?=
 =?utf-8?B?MlowMDRzVFJhWlk1aWxsd0k5RVhaWndmdWdqN09UVG5CeDQ5b3R6a1dIRTRG?=
 =?utf-8?B?RzVQK1VRM1h2RUg1Y2s2MGFHVk81dGhWUHZVTkRFUEtrYytpMG1yVmhWMWNR?=
 =?utf-8?B?NWJTRVhNbkpXQ1VIRkpxaTJFM2g0TTVmUU5rczA3V2VwNWM4UFR2dGRvZGhq?=
 =?utf-8?B?b1g1SWpJMWdWdUp4WVNObWIrQ1VyUXBFa2d1MlRwMXFKc2pXK3ZJYllQSHg0?=
 =?utf-8?B?MTdRQ1loRExGWlJNdHd4WWo4bERQVzdqL29uVUxpVVRnWFphV0k1YzdnNHph?=
 =?utf-8?B?ZDFrNmIvZ0JtVHZrOEV6VGFBS3BJdmtzVkFnLzY2Zi9KQzA4YS9rWm5NTVRT?=
 =?utf-8?B?U3pIUVdrOWpUTXJOVUIvSGhTZXV2UW9Fc01nejYwcW5yU0ZVTWZwQ0Fwd2kv?=
 =?utf-8?B?S2N3ZWM0TUp0VjJiZ0hsSUMyL3lZQ0w3Z1FFaDhqc2V4d2w0NGZjZXF1eTRy?=
 =?utf-8?B?MTZxbDFNRWpKVDRlQUdjMTdIVnJiRHZ4MXB2NngzNWlML3NKbnBjZkh0eDRY?=
 =?utf-8?B?MWlMMVB0YTU0czZpRHdkQitpUE5GYmNzWE9YNU5udTF5OEVsZlc4dnVESWNY?=
 =?utf-8?B?cnlGM2l3UEJ0Yi9ndGdOQzRUNWdoTm83MmxUSG5NK05pd0MvVkppVmZpWUYr?=
 =?utf-8?B?MWI0VHpBUG9xbTVBNTh4YndhVGZ5Y3pxSE01SUpMZVllUzB2NGRGaE1FbzFV?=
 =?utf-8?Q?zY3H2cVRaV9KWuMZlg+qmIY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b6db9f-32e1-49f5-3032-08ddff416b40
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 10:17:39.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7urwCGBId9QO9EUytAi7Cw7dr8va+jllCwpD1DRKU0Te7MfZwVhaUzw6mOMHU9ft/qPS2T/OWGPPPijhQ3pw0BskxvxUR42hSNZVdWmE+K4vYh1n9gujmoYuiKyf4Pb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA5OSBTYWx0ZWRfX1rkpzDXqDS1h
 BATtlQhYybgVv2mBq45A96nibpmn5ER38GCy4S/DpOQgkdgOWCwD7pEKRojsLcuRfqtkPbAkKb2
 4pg5xvin7cq9wUefkoUJOc33ROGMhfNs/2Sf6v127ztKyJ1pnfhT4WQ/FsXuZvGtC5Kw86kD6yc
 rPG0+ypjrQqei7wKuOgxhJtkCYAGOoc5Llyb6q9eEU+QcVgw92LotnBEZ3cmYnpyxu7CSXpLuYx
 o6RRbNxKX6DD2qhC01/B6o2vG5HOswUw9UwECNMY2962jt173ZOU9N1hS7hotf/UTukr3zWEHZi
 7SFl1DL0HXgc3Yxwl+G1mfwzq6ld/fkY6rxBkgCyGNoDsw2ow0pUGdOHiLhejkl8ll295x99f7m
 EafCjPrURCOM9SCAASPjPLrii3s0gg==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68da5cc6 cx=c_pps
 a=GsI8iPYaTsLAaW3Q0Q+aKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=hFW1afw1LRi8xATqvu0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Hqou25T6mLgA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: X7bLn7Riz9BI_VtM7h2phEvKulURKpRC
X-Proofpoint-GUID: e0m574uK2q-dOJ3tb_gSyJmC6OUmyb44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509290099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58T5KQov324749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224133


On 26-09-2025 22:20, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.org=20
> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Updated the Rust build to depend on Clang instead.
>>
>> *Summary of discussion with the rust upstream about using latest LLVM=20
>> instead of Rust maintained LLVM fork.
>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-l=
lvm-fork-what-rust-uses/23489=20
>>
>>
>> *Upstream LLVM is generally compatible:
>> - Rust does support building with upstream (vanilla) LLVM, especially=20
>> the latest
>> major release and the one or two preceding ones.
>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat=
ing-llvm=20
>>
>>
>> *Impact on Yocto Rust upgrades:
>> - Rust upgrades shall always check for updates on rust forked llvm=20
>> and backport
>> the relevant patches to clang's llvm.
>>
>> *Regarding the rust forked llvm local patches:
>> - There are no local patches on rust forked llvm other than the=20
>> backported fixes
>> from llvm master.
>>
>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because=
 of=20
>> this following
>> diff otherwise we will get errors during link time.
>>
>> Setup in rust-llvm
>> -DLLVM_ENABLE_ZLIB=3DOFF \
>> -DLLVM_ENABLE_ZSTD=3DOFF \
>> -DLLVM_ENABLE_FFI=3DOFF \
>>
>> Setup in clang
>> -DLLVM_ENABLE_FFI=3DON \
>> -DLLVM_ENABLE_ZSTD=3DON \
>>
>> *When multilibs enabled:
>>
>> llvm-config expects static libraries to be located in the lib=20
>> directory rather than
>> lib64. However, since LLVM is built as a non-multilib component, the=20
>> lib directory
>> doesn't contain any library files. To accommodate this without=20
>> breaking multilib
>> behavior, we copy the required library files appropriately.
>>
>> Previously, when we depended on rust-llvm, this worked because we=20
>> specified:
>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>
>> With this setup, llvm-config was installed inside=20
>> ${libdir}/llvm-rust, which included
>> its own bin and lib directories. Thus, llvm-config located in bin=20
>> would correctly find
>> the libraries in the adjacent lib directory.
>>
>> Even when multilib was enabled or not, llvm-config would still look=20
>> for libraries under
>> lib in this structure, so everything functioned as expected.
>>
>> *Changes needs to be done when llvm splits from clang:
>> In rust recipe:
>> Update the dependency from:
>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native llvm"
>>
>> In llvm recipe:
>> Apply the same changes that were made in the Clang recipe, as those
>> configurations have now been moved to the LLVM recipe after the split.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>> =C2=A0 meta/recipes-devtools/clang/clang_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
>> =C2=A0 meta/recipes-devtools/clang/common-clang.inc |=C2=A0 6 +++---
>> =C2=A0 meta/recipes-devtools/rust/rust_1.90.0.bb=C2=A0=C2=A0=C2=A0 | 1=
8 ++++++++++++++----
>> =C2=A0 3 files changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/clang_git.bb=20
>> b/meta/recipes-devtools/clang/clang_git.bb
>> index 53bca1c24f..3e117b308b 100644
>> --- a/meta/recipes-devtools/clang/clang_git.bb
>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>> =C2=A0 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeList=
s.txt
>> =C2=A0 LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURE=
S',=20
>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>> =C2=A0 LLVM_TARGETS_TO_BUILD ?=3D=20
>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,=20
>> d)};BPF;${LLVM_TARGETS_GPU}"
>>
>> =C2=A0 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>
>> @@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_PIC=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCLANG_DEFAULT_PIE_ON_LINUX=3D=
ON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_BINDINGS_LIST=3D'' \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -DLLVM_INSTALL_UTILS=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_FFI=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_ZSTD=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFFI_INCLUDE_DIR=3D$(pkg-conf=
ig=20
>> --variable=3Dincludedir libffi) \
>> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>> -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip=
 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>> + -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
>> -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_HOST_TRIPLE=3D${TARGET_=
SYS}${HF} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_LIBDIR_SUFFIX=3D${LLVM_=
LIBDIR_SUFFIX} \
>> diff --git a/meta/recipes-devtools/clang/common-clang.inc=20
>> b/meta/recipes-devtools/clang/common-clang.inc
>> index bf3a63914a..c22e3c1b19 100644
>> --- a/meta/recipes-devtools/clang/common-clang.inc
>> +++ b/meta/recipes-devtools/clang/common-clang.inc
>> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('aarch64$', a):=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>> 'AArch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('aarch64_be$', a):=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>> 'AArch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('mips(isa|)(32|64|)(r6|)(=
el|)$', a): return 'Mips'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv32'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('p(pc|owerpc)(|64)', a):=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn=20
>> 'PowerPC'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return=20
>> 'LoongArch'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return=20
>> 'loongarch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Unhan=
dled architecture %s" % arch_val)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ""
>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb=20
>> b/meta/recipes-devtools/rust/rust_1.90.0.bb
>> index 5d804c7398..c2cb8f8829 100644
>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
>> =C2=A0 inherit rust
>> =C2=A0 inherit cargo_common
>>
>> -DEPENDS +=3D "rust-llvm"
>> +DEPENDS +=3D "ninja-native clang"
>> =C2=A0 # native rust uses cargo/rustc from binary snapshots to bootstr=
ap
>> =C2=A0 # but everything else should use our native builds
>> =C2=A0 DEPENDS:append:class-target =3D " cargo-native rust-native"
>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL',=20
>> 'stable', '', '-${RUST_CHANNEL}', d)
>>
>> =C2=A0 export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>
>> -RUST_ALTERNATE_EXE_PATH ?=3D=20
>> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D=20
>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-con=
fig"
>>
>> =C2=A0 # We don't want to use bitbakes vendoring because the rust sour=
ces=20
>> do their
>> =C2=A0 # own vendoring.
>> @@ -188,6 +188,16 @@ python do_configure() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func("setup_cargo_environ=
ment", d)
>> =C2=A0 }
>>
>> +#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
>> +#Since LLVM is built as a non-multilib component, the 'lib' directory
>> +#doesn't have any library files when multilibs enabled. So, copying
>> +#library files without impacting multilib behavior.
>> +do_compile:append:class-target() {
>> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
>> +=C2=A0=C2=A0=C2=A0 cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a=20
>> ${STAGING_DIR_TARGET}/usr/lib/.
>> +fi
>> +}
>
> llvm-config can deduce paths to be self-relative, You might try to
> create a copy of native llvm-config in STAGING_LIBDIR or STAGING_BINDIR
> and that might help
The llvm-config binary built for the target is already available in=20
STAGING_BINDIR
 =C2=A0and we're using that for the Rust target build. I also tried copyi=
ng=20
the natively built
llvm-config into STAGING_LIBDIR and adjusted the Rust target build to=20
depend on it,
but the build still failed. The issue was that it continued to look in=20
the lib directory
instead of lib64 when multilibs are enabled. However, this can be=20
addressed in an
alternative way as below:

-RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
-RUST_ALTERNATE_EXE_PATH_NATIVE =3D=20
"${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-config=
"

Currently I am making the above changes. Since as you suggested to copy=20
and use
natively built llvm-config, I'm wondering would it be better to simply=20
make the
Rust target build depend directly on the native llvm-config as below.

-RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
-RUST_ALTERNATE_EXE_PATH_NATIVE =3D=20
"${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR_NATIVE}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-config=
"

>
>> +
>> =C2=A0 rust_runx () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "COMPILE ${PN}" "$@"
>>
>> @@ -199,7 +209,7 @@ rust_runx () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset CXXFLAGS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset CPPFLAGS
>>
>> -=C2=A0=C2=A0=C2=A0 export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>> +=C2=A0=C2=A0=C2=A0 export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=
=3D-lz=20
>> -Clink-arg=3D-lzstd"
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built llvm-config i=
nto the target so we can=20
>> run it. Horrible,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but works!
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224075):=20
>> https://lists.openembedded.org/g/openembedded-core/message/224075
>> Mute This Topic: https://lists.openembedded.org/mt/115446166/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

