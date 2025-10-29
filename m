Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F14CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 11:36:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4091.1761737780987237780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 04:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pAXPObKy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33970d012c=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBAmah1978523
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:36:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=NFnqMsCFycB5PDAWXVnd13
	OMGi3VoUNRTEZ1D/CKgPs=; b=pAXPObKyvWyirrw+2jE40UNSYHPprsD84LgI3o
	EGAQrMLvowpV78/fg9rbtVxwcRIAo84WTMJo+RjV6LMj49MpbH9Lwl067wVgblSr
	E0jx0kjeGqs9rSpFIynPoScntZE9gnqK2ZYucAtVsxhD6Cf35Sw2RN9o9ooxE7NA
	I0yNKGuSgjD1dvQbh+OlFjE93g3yZn6huMrVc+47s6xlchH7bdCwSeokYhOG5Pvu
	cYfKI7YCMbKpHwkMK7GcAJCGN0LcP0c4I/mpePijXT7DedtiSS313+SZPGv+ND7E
	oe1+F2KQBt9GDWnGoBtBbHI7cAEtiCDiFMbkO0+EHxA1buKw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a34890sfx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 04:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uajb8scrmi6eFo4ntPMmrzRHRnPYihjSBgfxjDiOGxu+m/Lvge03zucYDdejhQvLn6+48lm7CENIoc7F5UMaeQpj0/YUE3KsocUni3mVmI0ulQbYXI24jdmASmqs7bpfYqK1lm2KiJlmx4AU8nP0aZ/cRLLyiO+aStD7UptpZ3JH7wpjtlqHm5pD8q0PWBS2WgCI806Xg77URB34+qRxq1iFJ9jPaisGgZrfdNIYr/H3/dA/kt2vvR3YNABudanXyWN4+Ay84+yK1D9n2TCYXxtzhRpL+Iwu7hkkHOzZa6bg4QDy97P9YSZJnXFtn9u0/CzUKYrves31qb9sZW9+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFnqMsCFycB5PDAWXVnd13OMGi3VoUNRTEZ1D/CKgPs=;
 b=Gxyrqas+9yV87QZ5Royn/ZCRbnPWSZsr++WiKxTxKepbM6ZyMNXFAGixEF9JMQ50wVWBRv9SgMgxj5QgtjQGZyJgfsArXiU3BNe1k9AZL7yP80yNq1RX6H7BVEKtmAfKkzU38cRaxynTsUBjma/4sKui9Kqi4ihr1waDZTV1gwX9DEkEqKGaGHDGlNG/+p8hU7hvDfB3DGtgQaIw1GtdC1UM+Zxp85bz/poQsR1jBHf5X1KsgZnHHieSf0XK+xqCqgWroWYWP83qmc0+c4BdRGpEsiYnDyHhU0ltskipFp/MLLUpON4FRA7cXuYTSfLXbdr/L39JlavfeAyX0g9fwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by SJ2PR11MB8298.namprd11.prod.outlook.com (2603:10b6:a03:545::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 11:36:15 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 11:36:15 +0000
Content-Type: multipart/alternative;
 boundary="------------YRO0VhRE0cF2GsUiGPMemWdm"
Message-ID: <783b200b-f1df-40da-8f03-333b23369bd2@windriver.com>
Date: Wed, 29 Oct 2025 17:06:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: include image SPDX tasks in
 locked signatures
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        SunilKumar.Dora@windriver.com
References: <20251010094034.4107881-1-Maganuru.Jayasurya@windriver.com>
 <CAJdd5GZLv=TtpsEXPNTjcivptECw2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com>
Content-Language: en-US
From: Maganuru Jayasurya <Maganuru.Jayasurya@windriver.com>
In-Reply-To: <CAJdd5GZLv=TtpsEXPNTjcivptECw2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com>
X-ClientProxiedBy: PN4PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::6) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|SJ2PR11MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: abec611b-8be7-4f0c-8ce5-08de16df5e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|69100299015|4053099003|8096899003|13003099007|191535003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWk2MEZyQ1MzeSsySmNMUExTNzNPYlkvcjh4SnJqZ1dmUlZxZTdFZXBndXlt?=
 =?utf-8?B?cGxSZUZFdnNKOXg5OW5MbmZ5bm54NTFLYVJTbmd4Rm4zWm1IMlRSa3ZFdStW?=
 =?utf-8?B?WngwZmZhUDRrRWRZVkJuWFM3eUZHUkN1VngwMXBWYWI2S3BOK1NiV1pKeVpM?=
 =?utf-8?B?dDNmL0VMbFR5WEZSVllMWGh0cFRIR09ic0lKVS9PQ3hTdkFEQ3BmWng3dHNL?=
 =?utf-8?B?cHpkc0FPc3JXTjYyMHRKREk4NlhWQVdoYlQxWFZieldxdzNvd2Q0TERvazgr?=
 =?utf-8?B?VDVmRmNSMUV0cmQzUU9nblYzam83SzFNSXQ5VE5aaGYzeXBwVEIwYTlmT0pR?=
 =?utf-8?B?TURzUWFJaVljMVExQ1o2c0pBbGZJTGhrZmJldTFPUlhXemduUnpLdTZ1YUI3?=
 =?utf-8?B?RXY4N0dsQkxSY2RwU2J4cWc5YVptb3lKVzFvNCtiNVJiYTU2Z2hqdmd3V29X?=
 =?utf-8?B?QTZwS3Bnd2ZQNWlRMDBDbWRtcU83bHNnbEt1MUZSaDJmYjdBQVcvTGpJY2JZ?=
 =?utf-8?B?VEl0TjdBQytyNjdUSmRmVHhkMmF5YXRLUlJQRHRGQkxuMlVSempENmkyNURu?=
 =?utf-8?B?azFYUEM4dnFXUXFHVk1PdW5kUVU1K1JrVVZTbXRHTEtXWkhjMWdJd0lFY2tq?=
 =?utf-8?B?YkMyRG16NUtyVWRFMVdCZExtcEdnR3RpZWs5M0dweXU5aitmWlNhT0lmc3hH?=
 =?utf-8?B?YW1yTjRvdVp4Z2lMSEdpektVK1VRQzI1cnQ3dlhqUEF0US9JM1kvdFY3cnhr?=
 =?utf-8?B?RE1PU1VqV2NMVnZ2Z21MTElNWjZFRzFPRFlKb2tOTGM4STZqQUkzUDV2WkN0?=
 =?utf-8?B?NzZKalBQeUZuMHhyM28zVHlzcTJjM3Nsa0VJbUV6dFU1NUE2KzFMNUQ5Sm5h?=
 =?utf-8?B?K2pISkdYejQ1ZDJVWEJPeHdDOVhxdkdHZlJ4cm9sU29WRmVPaHFvWTM4d05v?=
 =?utf-8?B?ZGFCb0hPbWFlWHFQSmkxd3JOYnBia1crUW1vNFhHM1YrdTNiTEp1d3pGOVZL?=
 =?utf-8?B?a3Y2ZGpnVjdBK3lDOUR6ZHFXRXVZNjY4b3UrYkV5RUMwR3pzbTcyYjJIWk1v?=
 =?utf-8?B?aVB5dGFkU3FDK1VmaHpOOWRXNUdsS2JKajgwWTZpbUNvc3BWZlZldWVaaDZ5?=
 =?utf-8?B?K3JxVkNrWCsvNEhySlVKaHdLSHA1Yk5BZk12dzc5WjVZeDdLd3hqQ0gybmtV?=
 =?utf-8?B?SnR6R25ZK0Uva2FPNk91WnBGenNkNTRYT1k3enhMWEFKTVd6ZlJyNUZKc0Rs?=
 =?utf-8?B?TG1Ja1dzSHhzeloxMkFNMkFZUFBqY3ljWktqVDZSQTRlVnU5YWEyN1Z3Szls?=
 =?utf-8?B?VjMrc3FXS2c5ejFORmp0MXBqeW5xdTBQZXhDVXhmcU9vcGRUSTF5WkJlMkls?=
 =?utf-8?B?TjRnTlU1Nk01V01LbENoL3U1dzNUUnZCNUc3YmF4bTErUDFFSk1wM2p4d0JP?=
 =?utf-8?B?LzFkb2JtR2pUSEllejY4Z2JCWHNua1NWaHRtWS9pblE0Vkxwek1oUmJ1UVZN?=
 =?utf-8?B?cytUUmtDMkJJZmRJYm1VTXNRSXBxcEduWkQrd1hwRUpuVWVrbXlTdHNhWWxW?=
 =?utf-8?B?NGhxNStzY0duYnFnNXVwQmZEL2J4Z0ZwMzkrOHdPaXlFajE0aXdEV2JpVHJW?=
 =?utf-8?B?WEI3bUQyOXlxbk5NVlE4RHlMa3dvekdoeWhNbEd2N0R4ZkhiN0xCNHFvZDlX?=
 =?utf-8?B?MjlUSEF6WUhzeFV3YU9waWlqY1pSV0loUmlobng1dktSczBhckhJTldZZGJz?=
 =?utf-8?B?bkhQcGhGWlEwMjRlQkNkUlFLbFVDaVJMbmhMSklBNlBnWjlXM0pONWZSVTdC?=
 =?utf-8?B?SitCbEFVWGFBdFdZLzNielFIVmR3aXJGc1h6NEtmREZYWDNDRHNwTzBXVlF1?=
 =?utf-8?B?T2t4dFVLUmZNRWl5ZUMrdDdudVU2WGR1VEtqT3RsOTVrb0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(69100299015)(4053099003)(8096899003)(13003099007)(191535003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjdqRWh5NnZERGZuL2JsM2hFb2JpMjE1QjNEbE0ycWhlZEhhMmhyckgxUHNY?=
 =?utf-8?B?SFdvb0hTNzJpbGZuRlVuaFRnTEpVTEE2YVpoandRbTcwa0J6RFc3VjZKVitO?=
 =?utf-8?B?SlNLRGtMMkE5bEJtZkE4UnVjUUgzSjdFcjBGTUhDaGdQeE55QkVLR1NnUDcv?=
 =?utf-8?B?dTB3RVIrQ1dWZXlDejEzVmNuMTNCMjVYNWtQamllUCtGMkZiWS9ZaXdRWFRh?=
 =?utf-8?B?V0Q1Y1htdXV1ektzL2ZLeUwwcDRCYTFJeDdjUHY1VkV4UHlRcFZoVnlXQ3d5?=
 =?utf-8?B?VEpCa2ZlNks5ekdlYzRQdnpORHVQQUo2UDY1aEU4TjVMRFpYVmRYZ3dLMnc5?=
 =?utf-8?B?R1V0MndZOE1qdys2Z3NleXllUkFGNStHcHhvYkVoRk51UVpZWlNiMnFISGlz?=
 =?utf-8?B?Y2k1dGtsK1hhNUtkRWlPOE1SRllGRjJvM2doMm1SN1FJTW1MV3JPVnNub3ZU?=
 =?utf-8?B?ZXpRcmNWUEs2NXFuOXl4VFV2ZmFHZ1plQmxYcnEwZ1Q5b2VER0hZQllCTllU?=
 =?utf-8?B?Z0t4ajRLMVVqb2FSclFLM09DTDYzWm1RUW1ZWnZZb0syZEJJamNHOU5YTjN3?=
 =?utf-8?B?cm93WjVDdk9rck80NW16SERKMFFSd0tLdU51eVJJN0UxRUxQMU1tSkxZOTVZ?=
 =?utf-8?B?dUU0bjJOcG1zbjJpTTQ5Q213TGRWNGhQZDJMN3lVZVZXMlNPa1NMTGpiRThK?=
 =?utf-8?B?OUxTSzFDTXRJT0JMUnlUTlRTeFpQVEVtOHlXTUFxS1AxNmt0dXdkblY5TERG?=
 =?utf-8?B?YjZQcGZmS1RUTjNndUZMN3JoWDBtNmFzWVFlb2U0SnVWbUM1RVE5RGdsVG1O?=
 =?utf-8?B?QXIycXlHRWxTZHErVncyRXBGVHJ5MHd2Umd5RGlTTm1nUUZhL2hiZzUrTFlq?=
 =?utf-8?B?M0JMVzBibHkzYVFhQkZuMWV4R283ZEJ3SVVkU3hSSUNKWTQ0Z1Y0L2p1MXls?=
 =?utf-8?B?V1I4bDdXeU41YXUrdVRZS1NsZWJ4QWRNZ01IdU5leGdXMDN1Q1VabktZVTFj?=
 =?utf-8?B?MXZLWFVaSVViU0FVVnF2SXF2RDdxeExsc29sQ1BSZVVLR1NrZVJSaEFacHEv?=
 =?utf-8?B?N2w1UEhUNlh2Z2pBTUFjd1NmRmEwY3Y3d1NyTk92SjR1THhKWEV1WnBRb1N0?=
 =?utf-8?B?blZjUmRuV2Z6M1Z1UVJsNElyNTc1OG11R0JJamhzekNWZ3FnOHRybVQ0czlL?=
 =?utf-8?B?TlhCeVc5MHRBeGxrQUozbldXVzlvKzVMR2tqc3ZEMmpIYThuRjZYaTVWZUxs?=
 =?utf-8?B?QW9UU093ZU1POXJHVERZcW9sa3AyalhzNFErMFZtdXcxTENKMGFWWGdPZExH?=
 =?utf-8?B?VG9PWjV0RXhZRUthL0E0eHRrdVNnaExBNHlkSkRXb0JNcEhNbytrWFFPQ2RB?=
 =?utf-8?B?ZnhZbWZxVFVGVURocEpzUm1ZeElub3RLdmhDU1llU3A2cXlRbXI3alZFT0p1?=
 =?utf-8?B?KzdSZ0liQnpEcXNMRkJISUZiWXlvSm5lOE1pRmpXalJFNjFFRTZITmNSVmZq?=
 =?utf-8?B?NnhLdzFDT3ovT1pXbjhBbzVETnh3QzBhK3hkR2xoRUY5RGRqME44K012VVlE?=
 =?utf-8?B?eXRwNWI3alg5ZVpzUVYxOENPOE9NcVZPUHluZ0lKRTJGU0M0eGxaR1NRMVBu?=
 =?utf-8?B?bmZCR2RSbU53cUFRMkp4MW1NZFg2NERzeHQ0SVViYjFDWHo4WWVJak9tUlpS?=
 =?utf-8?B?U3NhQ1RkZnVtZTZJbjNKTFlUKzMxamEyTENNd2srK25WT3ZYa0Y5ZTN2aVBN?=
 =?utf-8?B?MVd1eDdsWjU3S0xDZlVBWVFFc044U3hISy9zaDdZU29UR1p4ZGlYYjg1a1lp?=
 =?utf-8?B?bmY5WCtEcjQwdENkODdEbGhxSlRrTDVUMDFDeTdxUXorNDBaWlRIVVZHaklz?=
 =?utf-8?B?dU9pYUVoNWpOTnVHQ3ZHMDR5R2xQbWZMRnlQK09lRHh0bFExMC92RXIvUTlV?=
 =?utf-8?B?aFFENFRxUmpxNUJQWDh4YzZxL1E1WE1kMkkyaTJzREg1c01CZHV2dzRaRGg1?=
 =?utf-8?B?SWtlcStPWkpyRkZMVXdSeEx6OUZGOVBuTHBKand3ZGsxeklMUmRGYTEvOUdh?=
 =?utf-8?B?cGJwZDZvK1N3OG5JeHpKSG9pbzZ2VTdnaitXUElobWt1TUpyLzV2aTg4Ykln?=
 =?utf-8?B?WGVYZXZuNlhXS1BuUUMyM25SLzM2dldUYURMVUlMV29zL0p4WGlQWDM3V0pE?=
 =?utf-8?Q?BnWEUZ8huUWixN6mi7N47U0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abec611b-8be7-4f0c-8ce5-08de16df5e36
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 11:36:15.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmpB85kzS8Iuxx3zT2jzH5HwlAJrcp5MZ7cTVgwEWWIecGkobrIYsDPAykfErB8IolXgP5ShpNWs78Jh0C5ewGVT+mUP4xvMZ/qSpkBdgMlBIJ7k5rKDIEPfrbzK9ONC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8298
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: QJLRi5xAGk24evCG1asmceFvdJxSWcuJ
X-Proofpoint-ORIG-GUID: 6b3jmwC-IlTzmLirE-RfRo98yTPbUy-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NyBTYWx0ZWRfX2MtediM1Wd9b
 fjaBuc/laUjpcg9BrJryjNne+Vao+mlzqkpiagxW2qkcJHkPon0PC17chtW9whCK/vD5s0LE9Sd
 Iufn8nyxwwoGvuoUzwnpItOtTcN5J9XPEpJBcJ24VPSZdu0pcMD+52u1rlqRhQPalgrQVAayONk
 2aegeJgy+SDBJGcbriq7UG4ocYZ7ZXwyGxlnx12xrqhc3BV1RolHMQIWVhp74aYGuURetCoGQd3
 Uop7YlJ5LDfu/KGV1g4xbpkylOP5lobH4b1EOepBlh8uWEZ4iZpOxwLY6U5mjEkjfKjGLIqI+FS
 yKwauW16p/qVqoA6ymIu03Qm0M13Wm/u5VXdgdpPAkZYqkdzUi5kOBz5VZVzz2+u9Gpm3QSmSze
 +7zO4GtQxgNTtRCjmYPkodb6w7yOtg==
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6901fc34 cx=c_pps
 a=To5YXH8t/p3KPg3XNsFgJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=vFuUp8_t_RSfTHXCSnsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UBFVfQAFWYhimOpKR3UA:9
 a=qG0EY1fBlzXYH7Q0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=xjGz-wBMAAAA:8
 a=TeuQqM9sAAAA:8 a=zWK90iubHkgoHHqhLo8A:9 a=gS44n71m5N6czw9J:21
 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10 a=TrhwNP2um4qoDiK-Ec4Z:22
 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=dmbvPvuLAiAwK5y7oBu2:22 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 11:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225447

--------------YRO0VhRE0cF2GsUiGPMemWdm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59TBAmah1978523


On 20/10/2025 22:09, Joshua Watt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Oct 10, 2025 at 3:41=E2=80=AFAM Jayasurya Maganuru via
> lists.openembedded.org
> <maganuru.jayasurya=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
>>
>> Fixes [YOCTO #15726]
>> Fixes [YOCTO #15853]
>>
>> After the switch to SPDX 3.0, eSDK installation can fail with errors l=
ike:
>>
>>    gcc-source-1*:do_fetch attempted to execute unexpectedly
>>    This is usually due to missing setscene tasks.
>>
>> This is caused by image-related SPDX tasks, such as do_create_image_sb=
om_spdx,
>> being excluded from the locked signatures. Without these, the correspo=
nding
>> sstate-cache artifacts are missing during eSDK installation.
>>
>> Previously (under SPDX 2.2), these image SPDX/SBOM tasks were not
>> dependencies of do_populate_sdk_ext task, so their sstate artifacts
>>   were not required at install time.
>>
>> Fix:
>> - do_create_image_sbom_spdx is added to do_sdk_depends[recrdeptask] to
>>   ensure it is included in the eSDK build and corresponding sstate cac=
he.
>> - SDK_TARGETS (and multilib variants) are removed from the excluded ta=
rget
>>   list in prepare_locked_cache(), so their image SPDX/SBOM tasks are r=
etained
>> in locked-sigs.inc.
>>
>> With this fix, eSDK installs work without unexpected task runs, even
>> for custom distros or "tar" images.
>>
>> Signed-off-by: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
>> ---
>>   meta/classes-recipe/populate_sdk_ext.bbclass | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/class=
es-recipe/populate_sdk_ext.bbclass
>> index 36a3e9c836..769672ec80 100644
>> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
>> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
>> @@ -465,6 +465,15 @@ def prepare_locked_cache(d, baseoutpath, derivati=
ve, conf_initpath):
>>
>>       # Filter the locked signatures file to just the sstate tasks we =
are interested in
>>       excluded_targets =3D get_sdk_install_targets(d, images_only=3DTr=
ue)
>> +    sdk_targets =3D d.getVar('SDK_TARGETS')
>> +    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).sp=
lit())
>> +    excluded_set =3D set(excluded_targets.split())
>> +
>> +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included=
 in the locked signatures,
>> +    # as they are required during eSDK installation.
>> +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
>> +    excluded_targets =3D ' '.join(filtered_excluded_set)
>> +
>>       sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>>       lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>>       #nativesdk-only sigfile to merge into locked-sigs.inc
>> @@ -821,7 +830,7 @@ addtask sdk_depends
>>   do_sdk_depends[dirs] =3D "${WORKDIR}"
>>   do_sdk_depends[depends] =3D "${@get_ext_sdk_depends(d)} meta-extsdk-=
toolchain:do_populate_sysroot"
>>   do_sdk_depends[recrdeptask] =3D"${@d.getVarFlag('do_populate_sdk', '=
recrdeptask', False)}"
>> -do_sdk_depends[recrdeptask] +=3D "do_populate_lic do_package_qa do_po=
pulate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
>> +do_sdk_depends[recrdeptask] +=3D "do_populate_lic do_package_qa do_po=
pulate_sysroot do_deploy do_create_image_sbom_spdx ${SDK_RECRDEP_TASKS}"
> The SPDX dependencies are generally added in
> creates-spdx-sdk-3.0.bbclass so as not to cause problems when SPDX is
> disabled. Is it possible to add it there instead?


Hi Joshua,

Following your review, I=E2=80=99ve moved the logic to=20
|create-spdx-sdk-3.0.bbclass| and sent V2.
https://lists.openembedded.org/g/openembedded-core/message/225440
<cid:part1.tomxmoFd.K1rkOQUa@windriver.com>
While exploring |create-*spdx-image*-3.0.bbclass|, we could=20
alternatively place the |do_create_image_sbom_spdx| task like this:

-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx=20
do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx=20
do_create_image_spdx before do_build *do_sdk_depends

*Do you think the current V2 approach is sufficient, or would this=20
alternate placement be preferable?

Thanks,
Jayasurya


>
>>   do_sdk_depends[rdepends] =3D"${@' '.join([x + ':do_package_write_${I=
MAGE_PKGTYPE} ' + x +=20
>> ':do_packagedata' for x in=20
>> d.getVar('TOOLCHAIN_HOST_TASK_ESDK').split()])}"
>>
>>   do_populate_sdk_ext[dirs] =3D"${@d.getVarFlag('do_populate_sdk', 'di=
rs', False)}"
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224675):https://lists.openembedded.org/g/openembed=
ded-core/message/224675
>> Mute This Topic:https://lists.openembedded.org/mt/115686400/3616693
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------YRO0VhRE0cF2GsUiGPMemWdm
Content-Type: multipart/related;
 boundary="------------9e3XMyJkz4EWD8LAt0cLeKPl"

--------------9e3XMyJkz4EWD8LAt0cLeKPl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59TBAmah1978523

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 20/10/2025 22:09, Joshua Watt wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAJdd5GZLv=3DTtpsEXPNTjcivptECw=
2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, Oct 10, 2025 at 3:41=E2=80=AFAM Jayasurya Maganuru via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:maganuru.jayasurya=3Dwi=
ndriver.com@lists.openembedded.org">&lt;maganuru.jayasurya=3Dwindriver.co=
m@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Jayasurya Maganuru <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Maganuru.Jayasurya@windriver.com">&lt;Maganuru.Jayasurya@windriver.com&=
gt;</a>

Fixes [YOCTO #15726]
Fixes [YOCTO #15853]

After the switch to SPDX 3.0, eSDK installation can fail with errors like=
:

  gcc-source-1*:do_fetch attempted to execute unexpectedly
  This is usually due to missing setscene tasks.

This is caused by image-related SPDX tasks, such as do_create_image_sbom_=
spdx,
being excluded from the locked signatures. Without these, the correspondi=
ng
sstate-cache artifacts are missing during eSDK installation.

Previously (under SPDX 2.2), these image SPDX/SBOM tasks were not
dependencies of do_populate_sdk_ext task, so their sstate artifacts
 were not required at install time.

Fix:
- do_create_image_sbom_spdx is added to do_sdk_depends[recrdeptask] to
 ensure it is included in the eSDK build and corresponding sstate cache.
- SDK_TARGETS (and multilib variants) are removed from the excluded targe=
t
 list in prepare_locked_cache(), so their image SPDX/SBOM tasks are retai=
ned
in locked-sigs.inc.

With this fix, eSDK installs work without unexpected task runs, even
for custom distros or &quot;tar&quot; images.

Signed-off-by: Jayasurya Maganuru <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:Maganuru.Jayasurya@windriver.com">&lt;Maganuru.Jayasurya@windr=
iver.com&gt;</a>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
index 36a3e9c836..769672ec80 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -465,6 +465,15 @@ def prepare_locked_cache(d, baseoutpath, derivative,=
 conf_initpath):

     # Filter the locked signatures file to just the sstate tasks we are =
interested in
     excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
+    sdk_targets =3D d.getVar('SDK_TARGETS')
+    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).split=
())
+    excluded_set =3D set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in=
 the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
+    excluded_targets =3D ' '.join(filtered_excluded_set)
+
     sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
@@ -821,7 +830,7 @@ addtask sdk_depends
 do_sdk_depends[dirs] =3D &quot;${WORKDIR}&quot;
 do_sdk_depends[depends] =3D &quot;${@get_ext_sdk_depends(d)} meta-extsdk=
-toolchain:do_populate_sysroot&quot;
 do_sdk_depends[recrdeptask] =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@d.getVarFlag('do_populate_sdk','recrdeptask',False)}">&quot;${=
@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}&quot;</a>
-do_sdk_depends[recrdeptask] +=3D &quot;do_populate_lic do_package_qa do_=
populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}&quot;
+do_sdk_depends[recrdeptask] +=3D &quot;do_populate_lic do_package_qa do_=
populate_sysroot do_deploy do_create_image_sbom_spdx ${SDK_RECRDEP_TASKS}=
&quot;
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
The SPDX dependencies are generally added in
creates-spdx-sdk-3.0.bbclass so as not to cause problems when SPDX is
disabled. Is it possible to add it there instead?</pre>
    </blockquote>
    <p><br>
    </p>
    <p data-start=3D"154" data-end=3D"166">Hi Joshua,</p>
    <p data-start=3D"168" data-end=3D"400">Following your review, I=E2=80=
=99ve moved
      the logic to <code data-start=3D"215" data-end=3D"244">create-spdx-=
sdk-3.0.bbclass</code>
      and sent V2.<br>
      <a moz-do-not-send=3D"false" href=3D"cid:part1.tomxmoFd.K1rkOQUa@wi=
ndriver.com">https://lists.openembedded.org/g/openembedded-core/message/2=
25440<br>
      </a><br>
      While exploring <code data-start=3D"289" data-end=3D"320">create-<b=
>spdx-image</b>-3.0.bbclass</code>,
      we could alternatively place the <code data-start=3D"355" data-end=3D=
"382">do_create_image_sbom_spdx</code> task like this:</p>
    <p data-start=3D"168" data-end=3D"400"><font face=3D"monospace">-addt=
ask
        do_create_image_sbom_spdx after do_create_rootfs_spdx
        do_create_image_spdx before do_build<br>
        +addtask do_create_image_sbom_spdx after do_create_rootfs_spdx
        do_create_image_spdx before do_build <b>do_sdk_depends<br>
          <br>
        </b></font>Do you think the current V2 approach is sufficient,
      or would this alternate placement be preferable?</p>
    <p data-start=3D"168" data-end=3D"400">Thanks,<br>
      Jayasurya</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAJdd5GZLv=3DTtpsEXPNTjcivptECw=
2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre"> do_sdk_depends[rdepends] =
=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@''.join([x+':do_=
package_write_${IMAGE_PKGTYPE}'+x+':do_packagedata'forxind.getVar('TOOLCH=
AIN_HOST_TASK_ESDK').split()])}">&quot;${@' '.join([x + ':do_package_writ=
e_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('TOOLCHAIN=
_HOST_TASK_ESDK').split()])}&quot;</a>

 do_populate_sdk_ext[dirs] =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@d.getVarFlag('do_populate_sdk','dirs',False)}">&quot;${@d.getV=
arFlag('do_populate_sdk', 'dirs', False)}&quot;</a>
--
2.49.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#224675): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/224675">https:/=
/lists.openembedded.org/g/openembedded-core/message/224675</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/115686400/3616693">https://lists.openembedded.org/mt=
/115686400/3616693</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
--------------9e3XMyJkz4EWD8LAt0cLeKPl
Content-Type: text/html; charset=UTF-8; name="225440"
Content-Disposition: inline; filename="225440"
Content-Id: <part1.tomxmoFd.K1rkOQUa@windriver.com>
Content-Location: https://lists.openembedded.org/g/openembedded-core/message/225440
Content-Transfer-Encoding: base64

CgkKCTwhRE9DVFlQRSBodG1sPgoJPGh0bWwgbGFuZz0iZW4tVVMiPgoJCTxoZWFkPgoJCQk8bWV0
YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDtjaGFyc2V0PVVU
Ri04Ij4KCQkJPG1ldGEgaHR0cC1lcXVpdj0iWC1VQS1Db21wYXRpYmxlIiBjb250ZW50PSJJRT1l
ZGdlIj4KCQkJCgkJCQk8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNl
LXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCI+CgkJCQoJCQk8bWV0YSBuYW1lPSJwaW50ZXJlc3Qi
IGNvbnRlbnQ9Im5vcGluIiAvPgoJCQk8bWV0YSBuYW1lPSJwaW50ZXJlc3QiIGNvbnRlbnQ9Im5v
aG92ZXIiIC8+CgkJCQoJCQk8bWV0YSBuYW1lPSIzNzc4NTE3ZWI0ODEwZGZiNWQxNDNlZDhmMWIz
NTliM2I1YTgyOTIzIiBjb250ZW50PSIwZjU2MjU3YzNkYjRhMjIyZTkxYjExYmM2ODcxYzRkZjJl
MjYzYjI4IiAvPgoJCQk8bGluayByZWw9ImFwcGxlLXRvdWNoLWljb24iIHNpemVzPSI1N3g1NyIg
aHJlZj0iL29yZ2ltZy9vcmcuMTA1L2Zhdmljb25zL2FwcGxlLWljb24tNTd4NTcucG5nP3Y9MTY4
MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0iYXBwbGUtdG91Y2gtaWNvbiIgc2l6ZXM9
IjYweDYwIiBocmVmPSIvb3JnaW1nL29yZy4xMDUvZmF2aWNvbnMvYXBwbGUtaWNvbi02MHg2MC5w
bmc/dj0xNjgwNDUwNDQ3MDM3NjA3OTQ4Ij4KCQkJPGxpbmsgcmVsPSJhcHBsZS10b3VjaC1pY29u
IiBzaXplcz0iNzJ4NzIiIGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9mYXZpY29ucy9hcHBsZS1pY29u
LTcyeDcyLnBuZz92PTE2ODA0NTA0NDcwMzc2MDc5NDgiPgoJCQk8bGluayByZWw9ImFwcGxlLXRv
dWNoLWljb24iIHNpemVzPSI3Nng3NiIgaHJlZj0iL29yZ2ltZy9vcmcuMTA1L2Zhdmljb25zL2Fw
cGxlLWljb24tNzZ4NzYucG5nP3Y9MTY4MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0i
YXBwbGUtdG91Y2gtaWNvbiIgc2l6ZXM9IjExNHgxMTQiIGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9m
YXZpY29ucy9hcHBsZS1pY29uLTExNHgxMTQucG5nP3Y9MTY4MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJ
CTxsaW5rIHJlbD0iYXBwbGUtdG91Y2gtaWNvbiIgc2l6ZXM9IjEyMHgxMjAiIGhyZWY9Ii9vcmdp
bWcvb3JnLjEwNS9mYXZpY29ucy9hcHBsZS1pY29uLTEyMHgxMjAucG5nP3Y9MTY4MDQ1MDQ0NzAz
NzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0iYXBwbGUtdG91Y2gtaWNvbiIgc2l6ZXM9IjE0NHgxNDQi
IGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9mYXZpY29ucy9hcHBsZS1pY29uLTE0NHgxNDQucG5nP3Y9
MTY4MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0iYXBwbGUtdG91Y2gtaWNvbiIgc2l6
ZXM9IjE1MngxNTIiIGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9mYXZpY29ucy9hcHBsZS1pY29uLTE1
MngxNTIucG5nP3Y9MTY4MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0iYXBwbGUtdG91
Y2gtaWNvbiIgc2l6ZXM9IjE4MHgxODAiIGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9mYXZpY29ucy9h
cHBsZS1pY29uLTE4MHgxODAucG5nP3Y9MTY4MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJl
bD0iaWNvbiIgdHlwZT0iaW1hZ2UvcG5nIiBzaXplcz0iMTkyeDE5MiIgIGhyZWY9Ii9vcmdpbWcv
b3JnLjEwNS9mYXZpY29ucy9hbmRyb2lkLWljb24tMTkyeDE5Mi5wbmc/dj0xNjgwNDUwNDQ3MDM3
NjA3OTQ4Ij4KCQkJPGxpbmsgcmVsPSJpY29uIiB0eXBlPSJpbWFnZS9wbmciIHNpemVzPSIzMngz
MiIgaHJlZj0iL29yZ2ltZy9vcmcuMTA1L2Zhdmljb25zL2Zhdmljb24tMzJ4MzIucG5nP3Y9MTY4
MDQ1MDQ0NzAzNzYwNzk0OCI+CgkJCTxsaW5rIHJlbD0iaWNvbiIgdHlwZT0iaW1hZ2UvcG5nIiBz
aXplcz0iOTZ4OTYiIGhyZWY9Ii9vcmdpbWcvb3JnLjEwNS9mYXZpY29ucy9mYXZpY29uLTk2eDk2
LnBuZz92PTE2ODA0NTA0NDcwMzc2MDc5NDgiPgoJCQk8bGluayByZWw9Imljb24iIHR5cGU9Imlt
YWdlL3BuZyIgc2l6ZXM9IjE2eDE2IiBocmVmPSIvb3JnaW1nL29yZy4xMDUvZmF2aWNvbnMvZmF2
aWNvbi0xNngxNi5wbmc/dj0xNjgwNDUwNDQ3MDM3NjA3OTQ4Ij4KCQkJPGxpbmsgcmVsPSJtYW5p
ZmVzdCIgaHJlZj0iL29yZ2ltZy9vcmcuMTA1L2Zhdmljb25zL21hbmlmZXN0Lmpzb24/dj0xNjgw
NDUwNDQ3MDM3NjA3OTQ4Ij4KCQkJPG1ldGEgbmFtZT0ibXNhcHBsaWNhdGlvbi1UaWxlQ29sb3Ii
IGNvbnRlbnQ9IiNmZmZmZmYiPgoJCQk8bWV0YSBuYW1lPSJtc2FwcGxpY2F0aW9uLVRpbGVJbWFn
ZSIgY29udGVudD0iL21zLWljb24tMTQ0eDE0NC5wbmciPgoJCQkKCQkJCgkJCQoKPHNjcmlwdD4K
Lyogc3R1YnMgKi8KCWNvbnN0IGhhcHRpY3NJbXBhY3RIZWF2eSA9IGFzeW5jICgpID0+IHsKCX07
Cgljb25zdCBoYXB0aWNzSW1wYWN0TWVkaXVtID0gYXN5bmMgKCkgPT4gewoJfTsKCWNvbnN0IGhh
cHRpY3NJbXBhY3RMaWdodCA9IGFzeW5jICgpID0+IHsKCX07Cgljb25zdCBoYXB0aWNzVmlicmF0
ZSA9IGFzeW5jICgpID0+IHsKCX07Cgljb25zdCBoYXB0aWNzU2VsZWN0aW9uU3RhcnQgPSBhc3lu
YyAoKSA9PiB7Cgl9OwoJY29uc3QgaGFwdGljc1NlbGVjdGlvbkNoYW5nZWQgPSBhc3luYyAoKSA9
PiB7Cgl9OwoJY29uc3QgaGFwdGljc1NlbGVjdGlvbkVuZCA9IGFzeW5jICgpID0+IHsKCX07Cjwv
c2NyaXB0PgoKCQkJCjxzY3JpcHQ+CgkKCQlmdW5jdGlvbiBzZXRQdWxsVG9SZWZyZXNoKCkge30K
CQoJZnVuY3Rpb24gZ290b1VSTChpbnVybCkgewoJCXdpbmRvdy5sb2NhdGlvbi5ocmVmID0gaW51
cmw7CgkJcmV0dXJuOwoJfQoJZnVuY3Rpb24gY29udGVudExvYWRlZChpc0hUTVgsIGYsIGNhbGxl
ciA9ICIiKSB7CgkJY29uc29sZS5sb2coImNvbnRlbnRMb2FkZWQ6ICIgKyBpc0hUTVggKyAiICIg
KyBjYWxsZXIpOwoJCWlmIChpc0hUTVggPT0gdHJ1ZSkgewoJCQlkb2N1bWVudC5ib2R5LmFkZEV2
ZW50TGlzdGVuZXIoJ2h0bXg6YWZ0ZXJTZXR0bGUnLCBmLCB7b25jZTogdHJ1ZX0pOwoJCX0gZWxz
ZSB7CgkJCWlmIChkb2N1bWVudC5yZWFkeVN0YXRlICE9PSAnbG9hZGluZycpIHsKCQkJCWNvbnNv
bGUubG9nKCdkb2N1bWVudCBpcyBhbHJlYWR5IHJlYWR5LCBqdXN0IGV4ZWN1dGUgY29kZSBoZXJl
Jyk7CgkJCQlmKCk7CgkJCX0gZWxzZSB7CgkJCQljb25zb2xlLmxvZygnZG9jdW1lbnQgd2FzIG5v
dCByZWFkeSwgcGxhY2UgY29kZSBoZXJlJyk7CgkJCQlkb2N1bWVudC5hZGRFdmVudExpc3RlbmVy
KCdET01Db250ZW50TG9hZGVkJywgZiwge29uY2U6IHRydWV9KTsKCQkJfQoJCX0KCX0KCglmdW5j
dGlvbiBIaWRlQXBwU2lkZWJhck9uS2V5Ym9hcmQoKSB7CgkJY29uc29sZS5sb2coIkluIEhpZGVB
cHBTaWRlYmFyT25LZXlib2FyZCIpOwoJCQoJfQoJLy8gc3R1YgoJZnVuY3Rpb24gbG9nRXJyb3Io
ZGF0YSwgdXJsLCBsaW5lbnVtYmVyKSB7CgkJY29uc29sZS5sb2coZGF0YSkKCQlyZXR1cm47Cgl9
Cgl2YXIgcHVzaFN1YlRva2VuOwoJdmFyIGlnbm9yZUVycm9ycyA9IGZhbHNlOwoJdmFyIGxhc3RF
cnJvciA9ICIiOwoJCgkJd2luZG93Lm9uZXJyb3IgPSBmdW5jdGlvbihlcnJvck1lc3NhZ2UsIGVy
cm9yVXJsLCBlcnJvckxpbmUsIGVycm9yQ29sdW1uLCBlcnJvck9iaikgewoJCQlsZXQgY29sdW1u
OwoJCQlsZXQgc3RhY2s7CgkJCWlmIChjb25zb2xlICYmIGNvbnNvbGUubG9nKSB7CgkJCQljb25z
b2xlLmxvZygibXNnOiIsIGVycm9yTWVzc2FnZSk7CgkJCQljb25zb2xlLmxvZygidXJsOiIsIGVy
cm9yVXJsKTsKCQkJCWNvbnNvbGUubG9nKCJsaW5lOiIsIGVycm9yTGluZSk7CgkJCQlpZiAoZXJy
b3JDb2x1bW4gIT09IHVuZGVmaW5lZCAmJiBlcnJvck9iaiAhPSBudWxsKSB7CgkJCQkJY29uc29s
ZS5sb2coImNvbHVtbjoiLCBlcnJvckNvbHVtbik7CgkJCQkJY29sdW1uID0gZXJyb3JDb2x1bW47
CgkJCQl9CgkJCQlpZiAoZXJyb3JPYmogIT09IHVuZGVmaW5lZCAmJiBlcnJvck9iaiAhPSBudWxs
KSB7CgkJCQkJY29uc29sZS5sb2coInN0YWNrOiIsIGVycm9yT2JqLnN0YWNrKTsKCQkJCQlzdGFj
ayA9IGVycm9yT2JqLnN0YWNrOwoJCQkJfQoJCQkJY29uc29sZS5sb2coImNsaWVudF9pZDoiLCAi
d2ViLndlYjA5Ljg4MjcxMy4xNzYxNzM3NzY3MTk2NjIwNTk5Iik7CgkJCQljb25zb2xlLmxvZygi
bGFzdF9lcnJvcjoiLCBsYXN0RXJyb3IpOwoJCQkJY29uc29sZS5sb2coInN0YWNrOiIsIHN0YWNr
KTsKCQkJfQoJCQlpZiAoZXJyb3JVcmwgPT0gIiIgfHwgZXJyb3JVcmwgPT09IG51bGwpIHsKCQkJ
CWVycm9yVXJsID0gd2luZG93LmxvY2F0aW9uLmhyZWY7CgkJCX0KCQkJaWYgKGVycm9yTWVzc2Fn
ZS5pbmNsdWRlcygiU2VjdXJpdHlFcnJvcjoiKSA9PSB0cnVlKSB7CgkJCQlpZ25vcmVFcnJvcnMg
PSB0cnVlOwoJCQl9CgkJCWlmIChpZ25vcmVFcnJvcnMgPT0gdHJ1ZSkgewoJCQkJY29uc29sZS5s
b2coImNvb2tpZXMsIGRpc2FibGVkLCBpZ25vcmluZyIpOwoJCQkJbGFzdEVycm9yID0gZXJyb3JN
ZXNzYWdlOwoJCQkJcmV0dXJuOwoJCQl9CgkJCWpRdWVyeS5hamF4KHsKCQkJCXR5cGU6ICdQT1NU
JywKCQkJCXVybDogJy9qc2NsaWVudGVycm9yJywKCQkJCWRhdGE6IHsKCQkJCQltc2c6IGVycm9y
TWVzc2FnZSwKCQkJCQl1cmw6IGVycm9yVXJsLAoJCQkJCWxpbmU6IGVycm9yTGluZSwKCQkJCQlj
b2x1bW46IGNvbHVtbiwKCQkJCQlzdGFjazogc3RhY2ssCgkJCQkJbGFzdF9lcnJvcjogbGFzdEVy
cm9yLAoJCQkJCWNsaWVudF9pZDogIndlYi53ZWIwOS44ODI3MTMuMTc2MTczNzc2NzE5NjYyMDU5
OSIKCQkJCX0sCgkJCQlzdWNjZXNzOiBmdW5jdGlvbigpIHsKCQkJCQlpZiAoY29uc29sZSAmJiBj
b25zb2xlLmxvZykgewoJCQkJCQljb25zb2xlLmxvZygnSlMgZXJyb3IgcmVwb3J0IHN1Y2Nlc3Nm
dWwuJyk7CgkJCQkJfQoJCQkJCWxhc3RFcnJvciA9IGVycm9yTWVzc2FnZTsKCQkJCX0sCgkJCQll
cnJvcjogZnVuY3Rpb24oKSB7CgkJCQkJaWYgKGNvbnNvbGUgJiYgY29uc29sZS5lcnJvcikgewoJ
CQkJCQljb25zb2xlLmVycm9yKCdKUyBlcnJvciByZXBvcnQgc3VibWlzc2lvbiBmYWlsZWQhJyk7
CgkJCQkJfQoJCQkJCWxhc3RFcnJvciA9IGVycm9yTWVzc2FnZTsKCQkJCX0KCQkJfSk7CgkJCXJl
dHVybiB0cnVlOwoJCX0KCQo8L3NjcmlwdD4KCQkJCgkJCQoJCQk8c2NyaXB0IHNyYz0iL3Rpbnlt
Y2UtNS4xMC45L3RpbnltY2UubWluLmpzIj48L3NjcmlwdD4KCQkJPHNjcmlwdCBzcmM9Ii9qcy9i
cm93c2VyLWltYWdlLWNvbXByZXNzaW9uLTIuMC4yLm1pbi5qcyI+PC9zY3JpcHQ+CgkJCTxsaW5r
IGhyZWY9Ii9jc3MvYXBwbGljYXRpb24tYjI1NmE4ZjFkN2RjNTExMDY5YjJhYzdlYWNiN2EzNTgu
Y3NzIiByZWw9InN0eWxlc2hlZXQiIGlkPSJncm91cHNpby1jc3MiPgoJCQk8c2NyaXB0IHNyYz0i
L2pzL2FwcGxpY2F0aW9uLTc4MDBlOTc2ODYwYjM1N2RmNDA1YTNlYTIyYWE3MmIxLmpzIiBpZD0i
Z3JvdXBzaW8tanMiPjwvc2NyaXB0PgoJCQk8c2NyaXB0IHNyYz0iL2pzL3J1bl9wcmV0dGlmeS5q
cyI+PC9zY3JpcHQ+CgkJCTx0aXRsZT5bUEFUQ0ggdjJdIHBvcHVsYXRlX3Nka19leHQ6IGluY2x1
ZGUgaW1hZ2UgU1BEWCB0YXNrcyBpbiBsb2NrZWQgc2lnbmF0dXJlczwvdGl0bGU+CgkJCQoKCQkJ
CgkJCQkKCgoKPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiB0eXBlPSJ0ZXh0L2NzcyIgaHJlZj0iL2Nz
cy9jb29raWVjb25zZW50LTMuMS4wLm1pbi5jc3MiIC8+CjxzY3JpcHQgc3JjPSIvanMvY29va2ll
Y29uc2VudC0zLjEuMC5taW4uanMiPjwvc2NyaXB0Pgo8c2NyaXB0PgogIHdpbmRvdy5hZGRFdmVu
dExpc3RlbmVyKCJsb2FkIiwgZnVuY3Rpb24oKXsKICB3aW5kb3cuY29va2llY29uc2VudC5pbml0
aWFsaXNlKHsKICAgICJwYWxldHRlIjogewogICAgICAicG9wdXAiOiB7CiAgICAgICAgImJhY2tn
cm91bmQiOiAiI2Q5ZWRmNyIsCiAgICAgICAgInRleHQiOiAiIzMxNzA4ZiIKICAgICAgfSwKICAg
ICAgImJ1dHRvbiI6IHsKICAgICAgICAiYmFja2dyb3VuZCI6ICIjNTZjYmRiIiwKICAgICAgICAi
dGV4dCI6ICIjZmZmZmZmIgogICAgICB9CiAgICB9LAogICAgImNvb2tpZSI6IHsKICAgICAgICAi
ZG9tYWluIjogIi57ey5PcmcuRG9tYWlufX0iCiAgICB9LAogICAgImNvbnRlbnQiOiB7CiAgICAg
ICJtZXNzYWdlIjogIk91ciBzaXRlIHVzZXMgY29va2llcyBzbyB0aGF0IHdlIGNhbiByZW1lbWJl
ciB5b3UgYW5kIHVuZGVyc3RhbmQgaG93IHlvdSBhbmQgb3RoZXIgdmlzaXRvcnMgdXNlIG91ciBz
aXRlLCB0byBpbXByb3ZlIHlvdXIgYnJvd3NpbmcgZXhwZXJpZW5jZSBhbmQgaGVscCB1cyBpbXBy
b3ZlIG91ciBzaXRlLiBCeSBjb250aW51aW5nIHRvIHVzZSBvdXIgd2Vic2l0ZSwgeW91IGFncmVl
IHRvIG91ciB1c2Ugb2Ygc3VjaCBjb29raWVzLiIsCiAgICAgICJkaXNtaXNzIjogIkkgQWdyZWUi
LAogICAgICAiaHJlZiI6ICJodHRwczovL2dyb3Vwcy5pby9zdGF0aWMvY29va2llX3BvbGljeSIK
ICAgIH0KICB9KX0pOwo8L3NjcmlwdD4KCgoJCQkKCQkJCjxsaW5rIHJlbD0iY2Fub25pY2FsIiBo
cmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS90
b3BpYy9wYXRjaF92Ml9wb3B1bGF0ZV9zZGtfZXh0LzExNjAwOTc4NSI+CjxzY3JpcHQgdHlwZT0i
YXBwbGljYXRpb24vbGQranNvbiI+CnsKICAiQGNvbnRleHQiOiAiaHR0cHM6Ly9zY2hlbWEub3Jn
IiwKICAiQHR5cGUiOiAiRGlzY3Vzc2lvbkZvcnVtUG9zdGluZyIsCiAgImhlYWRsaW5lIjogIltQ
QVRDSCB2Ml0gcG9wdWxhdGVfc2RrX2V4dDogaW5jbHVkZSBpbWFnZSBTUERYIHRhc2tzIGluIGxv
Y2tlZCBzaWduYXR1cmVzIiwKICAidGV4dCI6ICJGcm9tOiBKYXlhc3VyeWEgTWFnYW51cnUgJmx0
O01hZ2FudXJ1LkpheWFzdXJ5YUAuLi4mZ3Q7IEZpeGVzIFtZT0NUTyAjMTU3MjZdIEZpeGVzIFtZ
T0NUTyAjMTU4NTNdIEFmdGVyIHRoZSBzd2l0Y2ggdG8gU1BEWCAzLjAsIGVTREsgaW5zdGFsbGF0
aW9uIGNhbiBmYWlsIHdpdGggZXJyb3JzIGxpa2U6IGdjYy1zb3VyY2UtMSo6ZG9fZmV0Y2giLAog
ICJkYXRlUHVibGlzaGVkIjogIjIwMjUtMTAtMjlUMDM6MTE6MTMtMDc6MDAiLAogICJhdXRob3Ii
OiB7CiAgICAiQHR5cGUiOiAiUGVyc29uIiwKICAgICJuYW1lIjogIkpheWFzdXJ5YSBNYWdhbnVy
dSIKICB9LAogICJkaXNjdXNzaW9uVXJsIjogImh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL3RvcGljLzExNjAwOTc4NSIsCiAgInVybCI6ICJodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyNTQ0
MCIKfQo8L3NjcmlwdD4KPG1ldGEgcHJvcGVydHk9Im9nOnRpdGxlIiBjb250ZW50PSJbUEFUQ0gg
djJdIHBvcHVsYXRlX3Nka19leHQ6IGluY2x1ZGUgaW1hZ2UgU1BEWCB0YXNrcyBpbiBsb2NrZWQg
c2lnbmF0dXJlcyIgLz4KPG1ldGEgcHJvcGVydHk9Im9nOmRlc2NyaXB0aW9uIiBjb250ZW50PSIi
IC8+CjxtZXRhIHByb3BlcnR5PSJvZzppbWFnZSIgY29udGVudD0iaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvY292ZXJwaG90byIgLz4KCgo8c2NyaXB0
PgoJaHRteC5jb25maWcuc2Nyb2xsQmVoYXZpb3IgPSAiaW5zdGFudCI7CglodG14LmNvbmZpZy5o
aXN0b3J5Q2FjaGVTaXplID0gMDsKCWh0bXguY29uZmlnLmRlZmF1bHRTZXR0bGVEZWxheSA9IDA7
Cgljb25zb2xlLmxvZygiRlVMTCBQQUdFIExPQUQiKTsKPC9zY3JpcHQ+CgkJPC9oZWFkPgoJCTxi
b2R5IGlkPSJib2R5IiBjbGFzcz0iIiBoeC1oZWFkZXJzPSd7IkFjY2VwdC1WZXJzaW9uIjogIjNi
MmRmMmQyODljNDM3ODc4MTMxZDMwZTI5YjI3YWU1MTdkMDdkOGMifScgaHgtZXh0PSJwcmVsb2Fk
IiBoeC1ib29zdD0iZmFsc2UiPgoJCQkKCQkJCTxzY3JpcHQ+CgkJCQkJaWYgKHdpbmRvdy5tYXRj
aE1lZGlhICYmIHdpbmRvdy5tYXRjaE1lZGlhKCcocHJlZmVycy1jb2xvci1zY2hlbWU6IGRhcmsp
JykubWF0Y2hlcykgewoJCQkJCQlkb2N1bWVudC5ib2R5LmNsYXNzTGlzdC5hZGQoJ2RhcmstbW9k
ZScpOwoJCQkJCX0KCQkJCTwvc2NyaXB0PgoJCQkKCgkJCQoJCQkJPGRpdiBjbGFzcz0ibmF2YmFy
IG5hdmJhci1oZWFkIG5hdmJhci1maXhlZC10b3AiICByb2xlPSJuYXZpZ2F0aW9uIiBpZD0iaGVh
ZGVyYmFyIj4KCQkJCQk8ZGl2IGNsYXNzPSJjb250YWluZXItZmx1aWQiIHN0eWxlPSJwYWRkaW5n
LWxlZnQ6MHB4OyI+CgkJCQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyIgY2xhc3M9Im5hdmJhci1sZWZ0IiBoeC1ib29zdD0iZmFsc2UiIGh4LWRpc2luaGVyaXQ9Iioi
PgoJCQkJCQkJPGltZyBzcmM9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9vcmdpbWcv
b3JnLjEwNS9tYWlubG9nby5wbmc/dj0xNjgwNDUwNDQ3MDM3NjA3OTQ4IiBoZWlnaHQ9IjUwIiBh
bHQ9Ikdyb3Vwcy5pbyI+CgkJCQkJCTwvYT4KCQkJCQkJCQoJCQkJCQkJPHVsIGNsYXNzPSJuYXYg
bmF2YmFyLW5hdiBwdWxsLXJpZ2h0IHZpc2libGUteHMiIHN0eWxlPSJtYXJnaW4tdG9wOjVweDtt
YXJnaW4tYm90dG9tOjVweDsiPgoJCQkJCQkJCTxsaT4KCQkJCQkJCQkJPGEgaHJlZj0iIyIgZGF0
YS10b2dnbGU9Im1vZGFsIiBkYXRhLXRhcmdldD0iI21vYmlsZUFjY291bnQiPgoJCQkJCQkJCQkJ
PGkgY2xhc3M9ImZhLWZ3IGZhIGZhLWJhcnMgZmEtbGciPjwvaT4KCQkJCQkJCQkJPC9hPgoJCQkJ
CQkJCTwvbGk+CgkJCQkJCQk8L3VsPgoKCQkJCQkJCTx1bCBjbGFzcz0ibmF2IG5hdmJhci1uYXYg
cHVsbC1yaWdodCBoaWRkZW4teHMiPgoJCQkJCQkJCTxsaSBjbGFzcz0iZHJvcGRvd24iPgoJCQkJ
CQkJCQk8YSBocmVmPSIjIiBjbGFzcz0iZHJvcGRvd24tdG9nZ2xlIiBkYXRhLXRvZ2dsZT0iZHJv
cGRvd24iIGFyaWEtaGFzcG9wdXA9InRydWUiIGFyaWEtZXhwYW5kZWQ9ImZhbHNlIj4KCQkJCQkJ
CQkJCTxpIGNsYXNzPSJmYS1mdyBmYS1yZWd1bGFyIGZhLWdsb2JlIj48L2k+CgkJCQkJCQkJCQkK
CQkJCQkJCQkJCQlFbmdsaXNoCgkJCQkJCQkJCQkKCQkJCQkJCQkJCTxiIGNsYXNzPSJjYXJldCI+
PC9iPgoJCQkJCQkJCQk8L2E+CgkJCQkJCQkJCTx1bCBjbGFzcz0iZHJvcGRvd24tbWVudSI+CgkJ
CQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL3NldGxhbmcvYXIiPgoJCQkJCQkJCQkJCQnYp9mE2LnYsdio2YrYqQoJCQkJCQkJCQkJ
CTwvYT4KCQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0i
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvZGUiPgoJCQkJCQkJCQkJCQlE
ZXV0c2NoCgkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCTxsaT4KCQkJ
CQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvdW5zZXRsYW5n
Ij4KCQkJCQkJCQkJCQkJRW5nbGlzaAoJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCTwvbGk+CgkJ
CQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL3NldGxhbmcvZXMiPgoJCQkJCQkJCQkJCQlFc3Bhw7FvbAoJCQkJCQkJCQkJCTwvYT4K
CQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvZnIiPgoJCQkJCQkJCQkJCQlGcmFuw6dh
aXMKCQkJCQkJCQkJCQk8L2E+CgkJCQkJCQkJCQk8L2xpPgoJCQkJCQkJCQkJPGxpPgoJCQkJCQkJ
CQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9zZXRsYW5nL2l0Ij4K
CQkJCQkJCQkJCQkJSXRhbGlhbm8KCQkJCQkJCQkJCQk8L2E+CgkJCQkJCQkJCQk8L2xpPgoJCQkJ
CQkJCQkJPGxpPgoJCQkJCQkJCQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9zZXRsYW5nL25sIj4KCQkJCQkJCQkJCQkJTmVkZXJsYW5kcwoJCQkJCQkJCQkJCTwvYT4K
CQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvcHQtYnIiPgoJCQkJCQkJCQkJCQlQb3J0
dWd1w6pzIGRvIEJyYXNpbAoJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJ
CQk8bGk+CgkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L3NldGxhbmcvcHQiPgoJCQkJCQkJCQkJCQlQb3J0dWd1w6pzCgkJCQkJCQkJCQkJPC9hPgoJCQkJ
CQkJCQkJPC9saT4KCQkJCQkJCQkJCTxsaT4KCQkJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFuZy91ayI+CgkJCQkJCQkJCQkJCdCj0LrRgNCw0ZfQ
vdGB0YzQutCwCgkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCTxsaT4K
CQkJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFu
Zy96aC1oYW5zIj4KCQkJCQkJCQkJCQkJ566A5L2T5Lit5paHCgkJCQkJCQkJCQkJPC9hPgoJCQkJ
CQkJCQkJPC9saT4KCQkJCQkJCQkJPC91bD4KCQkJCQkJCQk8L2xpPgoJCQkJCQkJCTxsaT4KCQkJ
CQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2hlbHBjZW50ZXIi
IHRhcmdldD0iX2JsYW5rIj4KCQkJCQkJCQkJCUhlbHAKCQkJCQkJCQkJPC9hPgoJCQkJCQkJCTwv
bGk+CgkJCQkJCQkJPGxpPgoJCQkJCQkJCQk8YSBpZD0ibG9naW4iIGhyZWY9Imh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9sb2dpbiIgaHgtYm9vc3Q9ImZhbHNlIiBoeC1kaXNpbmhlcml0
PSIqIj4KCQkJCQkJCQkJCTxpIGNsYXNzPSJmYSBmYS1zaWduLWluLWFsdCI+PC9pPgoJCQkJCQkJ
CQkJTG9nIEluCgkJCQkJCQkJCTwvYT4KCQkJCQkJCQk8L2xpPgoJCQkJCQkJCQoJCQkJCQkJPC91
bD4KCQkJCQk8L2Rpdj4KCQkJCTwvZGl2PgoJCQkJPGRpdiBjbGFzcz0ibW9kYWwgZmFkZSIgaWQ9
Im1vYmlsZUFjY291bnQiIHJvbGU9ImRpYWxvZyI+CgkJCQkJPGRpdiBjbGFzcz0ibW9kYWwtZGlh
bG9nIiBzdHlsZT0ibWFyZ2luLXRvcDo1MHB4OyI+CgkJCQkJCTxkaXYgY2xhc3M9Im1vZGFsLWNv
bnRlbnQiPgoJCQkJCQkJPGRpdiBjbGFzcz0ibW9kYWwtYm9keSI+CgoJCQkJCQkJCQk8dWwgY2xh
c3M9Imxpc3QtZ3JvdXAgbm9ib3JkZXJsaXN0Ij4KCgkJCQkJCQkJCQk8bGkgY2xhc3M9Im5vYm9y
ZGVyaXRlbSBsaXN0LWdyb3VwLWl0ZW0iPgoJCQkJCQkJCQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9sb2dpbiIgaHgtYm9vc3Q9ImZhbHNlIiBoeC1kaXNpbmhlcml0
PSIqIj4KCQkJCQkJCQkJCQkJPGkgY2xhc3M9ImZhIGZhLXNpZ24taW4tYWx0Ij48L2k+CgkJCQkJ
CQkJCQkJCUxvZyBJbgoJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJCQkK
CQkJCQkJCQkJCTxsaSBjbGFzcz0ibm9ib3JkZXJpdGVtIGxpc3QtZ3JvdXAtaXRlbSI+CgkJCQkJ
CQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2hlbHBjZW50ZXIi
IHRhcmdldD0iX2JsYW5rIj4KCQkJCQkJCQkJCQkJPGkgY2xhc3M9ImZhLWZ3IGZhIGZhLXF1ZXN0
aW9uLWNpcmNsZSI+PC9pPgoJCQkJCQkJCQkJCQlIZWxwCgkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJ
CQkJPC9saT4KCgkJCQkJCQkJCQk8bGkgY2xhc3M9ImRyb3Bkb3duIG5vYm9yZGVyaXRlbSBsaXN0
LWdyb3VwLWl0ZW0iPgoJCQkJCQkJCQkJCTxhIGhyZWY9IiMiIGNsYXNzPSJkcm9wZG93bi10b2dn
bGUiIGRhdGEtdG9nZ2xlPSJkcm9wZG93biIgYXJpYS1oYXNwb3B1cD0idHJ1ZSIgYXJpYS1leHBh
bmRlZD0iZmFsc2UiPgoJCQkJCQkJCQkJCQk8aSBjbGFzcz0iZmEtZncgZmEtcmVndWxhciBmYS1n
bG9iZSI+PC9pPgoJCQkJCQkJCQkJCQkKCQkJCQkJCQkJCQkJCUVuZ2xpc2gKCQkJCQkJCQkJCQkJ
CgkJCQkJCQkJCQkJCTxiIGNsYXNzPSJjYXJldCI+PC9iPgoJCQkJCQkJCQkJCTwvYT4KCQkJCQkJ
CQkJCQk8dWwgY2xhc3M9ImRyb3Bkb3duLW1lbnUiPgoJCQkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJ
CQkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFuZy9hciI+
CgkJCQkJCQkJCQkJCQkJ2KfZhNi52LHYqNmK2KkKCQkJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJ
CQkJPC9saT4KCQkJCQkJCQkJCQkJPGxpPgoJCQkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvZGUiPgoJCQkJCQkJCQkJCQkJCURldXRzY2gK
CQkJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCQkJPGxpPgoJCQkJ
CQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3Vuc2V0bGFu
ZyI+CgkJCQkJCQkJCQkJCQkJRW5nbGlzaAoJCQkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJCQkJCQk8
L2xpPgoJCQkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFuZy9lcyI+CgkJCQkJCQkJCQkJCQkJRXNwYcOxb2wKCQkJ
CQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCQkJPGxpPgoJCQkJCQkJ
CQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvZnIi
PgoJCQkJCQkJCQkJCQkJCUZyYW7Dp2FpcwoJCQkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJCQkJCQk8
L2xpPgoJCQkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFuZy9pdCI+CgkJCQkJCQkJCQkJCQkJSXRhbGlhbm8KCQkJ
CQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCQkJPGxpPgoJCQkJCQkJ
CQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvbmwi
PgoJCQkJCQkJCQkJCQkJCU5lZGVybGFuZHMKCQkJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCQkJ
PC9saT4KCQkJCQkJCQkJCQkJPGxpPgoJCQkJCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL3NldGxhbmcvcHQtYnIiPgoJCQkJCQkJCQkJCQkJCVBvcnR1Z3XD
qnMgZG8gQnJhc2lsCgkJCQkJCQkJCQkJCQk8L2E+CgkJCQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJ
CQkJCTxsaT4KCQkJCQkJCQkJCQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9zZXRsYW5nL3B0Ij4KCQkJCQkJCQkJCQkJCQlQb3J0dWd1w6pzCgkJCQkJCQkJCQkJCQk8
L2E+CgkJCQkJCQkJCQkJCTwvbGk+CgkJCQkJCQkJCQkJCTxsaT4KCQkJCQkJCQkJCQkJCTxhIGhy
ZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9zZXRsYW5nL3VrIj4KCQkJCQkJCQkJ
CQkJCQnQo9C60YDQsNGX0L3RgdGM0LrQsAoJCQkJCQkJCQkJCQkJPC9hPgoJCQkJCQkJCQkJCQk8
L2xpPgoJCQkJCQkJCQkJCQk8bGk+CgkJCQkJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvc2V0bGFuZy96aC1oYW5zIj4KCQkJCQkJCQkJCQkJCQnnroDkvZPk
uK3mlocKCQkJCQkJCQkJCQkJCTwvYT4KCQkJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCQk8L3Vs
PgoJCQkJCQkJCQkJPC9saT4KCgkJCQkJCQkJCTwvdWw+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9k
aXY+CgkJCQkJPC9kaXY+CgkJCQk8L2Rpdj4KCQkJCjxzY3JpcHQ+CnZhciBncm91cG5hdmlnYXRv
ckRhdGEgPSBbCgpdOwo8L3NjcmlwdD4KCgo8IS0tIE1vZGFsIERpYWxvZyBmb3IgQXV0b2NvbXBs
ZXRlIC0tPgo8ZGl2IGNsYXNzPSJtb2RhbCBmYWRlIiBpZD0iZ3JvdXBuYXZpZ2F0b3JNb2RhbCIg
dGFiaW5kZXg9Ii0xIiByb2xlPSJkaWFsb2ciIGFyaWEtbGFiZWxsZWRieT0ibW9kYWxMYWJlbCIg
YXJpYS1oaWRkZW49InRydWUiPgogIDxkaXYgY2xhc3M9Im1vZGFsLWRpYWxvZyIgcm9sZT0iZG9j
dW1lbnQiPgogICAgPGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CiAgICAgIDxkaXYgY2xhc3M9
Im1vZGFsLWJvZHkiPgogICAgICAgIDxpbnB1dCB0eXBlPSJ0ZXh0IiBjbGFzcz0iZm9ybS1jb250
cm9sIiBpZD0iZ3JvdXBuYXZpZ2F0b3JJbnB1dCIgcGxhY2Vob2xkZXI9IkdvIHRvIGdyb3VwLi4u
IiBzdHlsZT0ibWFyZ2luLWJvdHRvbToxMHB4Ij4KICAgICAgICA8ZGl2IGlkPSJncm91cG5hdmln
YXRvckNvbnRhaW5lciIgY2xhc3M9ImF1dG9jb21wbGV0ZVJlc3VsdHMiIHN0eWxlPSJtYXgtaGVp
Z2h0OjI1MHB4OyBvdmVyZmxvdy15OiBhdXRvOyI+PC9kaXY+CgkJPGRpdiBjbGFzcz0idGV4dC1j
ZW50ZXIiIHN0eWxlPSJtYXJnaW4tdG9wOjEwcHg7IGZvbnQtc2l6ZToxMnB4OyI+PGkgY2xhc3M9
ImZhLXNoYXJwIGZhLWFycm93LXVwLWFycm93LWRvd24iPjwvaT4gdG8gbmF2aWdhdGUmbmJzcDsm
bmJzcDsmbmJzcDs8aSBjbGFzcz0iZmEtc2hhcnAgZmEtYXJyb3ctdHVybi1kb3duLWxlZnQiPjwv
aT4gdG8gdXNlJm5ic3A7Jm5ic3A7Jm5ic3A7PHN0cm9uZz5lc2M8L3N0cm9uZz4gdG8gZGlzbWlz
czwvZGl2PgogICAgICA8L2Rpdj4KICAgIDwvZGl2PgogIDwvZGl2Pgo8L2Rpdj4KCgo8c2NyaXB0
PgovLyBLZWVwIHRyYWNrIG9mIHRoZSBjdXJyZW50bHkgc2VsZWN0ZWQgaW5kZXgKdmFyIHNlbGVj
dGVkSW5kZXggPSAtMTsKCi8vIEZ1bmN0aW9uIHRvIGhpZ2hsaWdodCB0aGUgbWF0Y2hlZCBzdWJz
dHJpbmcKZnVuY3Rpb24gaGlnaGxpZ2h0U3Vic3RyaW5nKHN0ciwgc3Vic3RyaW5nKSB7CiAgdmFy
IGluZGV4ID0gc3RyLnRvTG93ZXJDYXNlKCkuaW5kZXhPZihzdWJzdHJpbmcudG9Mb3dlckNhc2Uo
KSk7CiAgaWYgKGluZGV4ICE9PSAtMSkgewogICAgdmFyIGJlZm9yZSA9IHN0ci5zdWJzdHJpbmco
MCwgaW5kZXgpOwogICAgdmFyIG1pZGRsZSA9IHN0ci5zdWJzdHJpbmcoaW5kZXgsIGluZGV4ICsg
c3Vic3RyaW5nLmxlbmd0aCk7CiAgICB2YXIgYWZ0ZXIgPSBzdHIuc3Vic3RyaW5nKGluZGV4ICsg
c3Vic3RyaW5nLmxlbmd0aCk7CiAgICByZXR1cm4gYmVmb3JlICsgJzxzcGFuIGNsYXNzPSJhdXRv
Y29tcGxldGUtaGlnaGxpZ2h0Ij4nICsgbWlkZGxlICsgJzwvc3Bhbj4nICsgYWZ0ZXI7CiAgfQog
IHJldHVybiBzdHI7Cn0KCi8vIEZ1bmN0aW9uIHRvIGhpZ2hsaWdodCB0aGUgc2VsZWN0ZWQgaXRl
bSBhbmQgZW5zdXJlIGl0IGlzIHZpc2libGUgaW4gdGhlIHNjcm9sbGFibGUgbGlzdApmdW5jdGlv
biBoaWdobGlnaHRTZWxlY3RlZEl0ZW0obW9kYWxOYW1lKSB7CiAgdmFyIGxpc3RDb250YWluZXIg
PSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChtb2RhbE5hbWUgKyAnQ29udGFpbmVyJyk7CiAgdmFy
IGl0ZW1zID0gZG9jdW1lbnQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZShtb2RhbE5hbWUgKyAnLWxp
c3QtaXRlbScpOwogIEFycmF5LmZyb20oaXRlbXMpLmZvckVhY2goZnVuY3Rpb24oaXRlbSwgaWR4
KSB7CiAgICBpdGVtLmNsYXNzTmFtZSA9IGlkeCA9PT0gc2VsZWN0ZWRJbmRleCA/IG1vZGFsTmFt
ZSArICctbGlzdC1pdGVtIGF1dG9jb21wbGV0ZS1saXN0LWl0ZW0gYnRuLXByaW1hcnkgbm8taG92
ZXInIDogbW9kYWxOYW1lICsgJy1saXN0LWl0ZW0gYXV0b2NvbXBsZXRlLWxpc3QtaXRlbSBuby1o
b3Zlcic7IC8vIEFwcGx5IGJ0bi1wcmltYXJ5IGNsYXNzIHRvIHRoZSBzZWxlY3RlZCBpdGVtCiAg
fSk7CiAgaWYgKGl0ZW1zLmxlbmd0aCA+IDAgJiYgc2VsZWN0ZWRJbmRleCA+PSAwKSB7CiAgICB2
YXIgc2VsZWN0ZWRJdGVtID0gaXRlbXNbc2VsZWN0ZWRJbmRleF07CiAgICB2YXIgY29udGFpbmVy
VG9wID0gbGlzdENvbnRhaW5lci5zY3JvbGxUb3A7CiAgICB2YXIgY29udGFpbmVyQm90dG9tID0g
Y29udGFpbmVyVG9wICsgbGlzdENvbnRhaW5lci5jbGllbnRIZWlnaHQ7CiAgICB2YXIgaXRlbVRv
cCA9IHNlbGVjdGVkSXRlbS5vZmZzZXRUb3A7CiAgICB2YXIgaXRlbUJvdHRvbSA9IGl0ZW1Ub3Ag
KyBzZWxlY3RlZEl0ZW0ub2Zmc2V0SGVpZ2h0OwoJY29uc3QgZnVkZ2UgPSA1OTsKICAgIGlmIChz
ZWxlY3RlZEluZGV4ID4gMCAmJiBpdGVtVG9wID4gY29udGFpbmVyQm90dG9tKSB7CiAgICAgIC8v
IElmIHRoZXJlIGFyZSBpdGVtcyBiZWxvdyB0aGUgc2VsZWN0ZWQgaXRlbSBhbmQgdGhlIHNlbGVj
dGVkIGl0ZW0gaXMgbm90IGZ1bGx5IHZpc2libGUsIHNjcm9sbCBkb3duCiAgICAgIGxpc3RDb250
YWluZXIuc2Nyb2xsVG9wID0gaXRlbVRvcCAtIGxpc3RDb250YWluZXIuY2xpZW50SGVpZ2h0ICsg
aXRlbXNbc2VsZWN0ZWRJbmRleCAtIDFdLm9mZnNldEhlaWdodDsKICAgIH0gZWxzZSBpZiAoc2Vs
ZWN0ZWRJbmRleCA8IGl0ZW1zLmxlbmd0aCAtIDEgJiYgKGl0ZW1Ub3AgLSBmdWRnZSkgPCBjb250
YWluZXJUb3ApIHsKICAgICAgLy8gSWYgdGhlcmUgYXJlIGl0ZW1zIGFib3ZlIHRoZSBzZWxlY3Rl
ZCBpdGVtIGFuZCB0aGUgc2VsZWN0ZWQgaXRlbSBpcyBub3QgZnVsbHkgdmlzaWJsZSwgc2Nyb2xs
IHVwCiAgICAgIGxpc3RDb250YWluZXIuc2Nyb2xsVG9wID0gaXRlbVRvcCAtIGZ1ZGdlIC0gaXRl
bXNbc2VsZWN0ZWRJbmRleCArIDFdLm9mZnNldEhlaWdodDsKICAgIH0KICB9Cn0KCi8vIGZ1bmN0
aW9uIHRvIHBvcHVsYXRlIHRoZSBsaXN0IGJhc2VkIG9uIHRoZSBpbnB1dApmdW5jdGlvbiBwb3B1
bGF0ZUxpc3QobW9kYWxOYW1lLCBkYXRhKSB7CiAgdmFyIGlucHV0ID0gZG9jdW1lbnQuZ2V0RWxl
bWVudEJ5SWQobW9kYWxOYW1lKydJbnB1dCcpLnZhbHVlOwogIHZhciBsaXN0Q29udGFpbmVyID0g
ZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQobW9kYWxOYW1lKydDb250YWluZXInKTsKICBsaXN0Q29u
dGFpbmVyLmlubmVySFRNTCA9ICcnOwogIGRhdGEuZm9yRWFjaChmdW5jdGlvbihpdGVtKSB7CiAg
ICBpZiAoaXRlbS5uYW1lLnRvTG93ZXJDYXNlKCkuaW5jbHVkZXMoaW5wdXQudG9Mb3dlckNhc2Uo
KSkpIHsKICAgICAgdmFyIGRpdiA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ2RpdicpOwogICAg
ICBkaXYuaW5uZXJIVE1MID0gaGlnaGxpZ2h0U3Vic3RyaW5nKGl0ZW0ubmFtZSwgaW5wdXQpOwog
ICAgICBkaXYuY2xhc3NOYW1lID0gbW9kYWxOYW1lKyctbGlzdC1pdGVtIGF1dG9jb21wbGV0ZS1s
aXN0LWl0ZW0gbm8taG92ZXInOyAvLyBBcHBseSBuby1ob3ZlciBjbGFzcwogICAgICBkaXYuYWRk
RXZlbnRMaXN0ZW5lcignY2xpY2snLCBmdW5jdGlvbigpIHsKICAgICAgICAvLyBOYXZpZ2F0ZSB0
byB0aGUgc3BlY2lmaWVkIFVSTCB3aGVuIGEgbGlzdCBpdGVtIGlzIGNsaWNrZWQKICAgICAgICB3
aW5kb3cubG9jYXRpb24uaHJlZiA9IGl0ZW0udXJsOwogICAgICB9KTsKICAgICAgZGl2LmFkZEV2
ZW50TGlzdGVuZXIoJ21vdXNlbW92ZScsIGZ1bmN0aW9uKCkgewogICAgICAgIC8vIFJlbW92ZSBu
by1ob3ZlciBjbGFzcyBmcm9tIGFsbCBpdGVtcyB3aGVuIHRoZSBtb3VzZSBpcyBtb3ZlZCBvdmVy
IGFueSBpdGVtCgkJY29uc29sZS5sb2coIm1vdXNlIG1vdmUiKTsKICAgICAgICB2YXIgaXRlbXMg
PSBkb2N1bWVudC5nZXRFbGVtZW50c0J5Q2xhc3NOYW1lKG1vZGFsTmFtZSsnLWxpc3QtaXRlbScp
OwogICAgICAgIEFycmF5LmZyb20oaXRlbXMpLmZvckVhY2goZnVuY3Rpb24oaXRlbSkgewogICAg
ICAgICAgaXRlbS5jbGFzc0xpc3QucmVtb3ZlKCduby1ob3ZlcicpOwogICAgICAgIH0pOwogICAg
ICB9KTsKICAgICAgbGlzdENvbnRhaW5lci5hcHBlbmRDaGlsZChkaXYpOwogICAgfQogIH0pOwog
IGhpZ2hsaWdodFNlbGVjdGVkSXRlbShtb2RhbE5hbWUpOwp9CgpmdW5jdGlvbiBJbml0QXV0b2Nv
bXBsZXRlKG1vZGFsTmFtZSwgZGF0YSkgewoJLy8gRm9jdXMgdGhlIGlucHV0IGZpZWxkIHdoZW4g
dGhlIG1vZGFsIGlzIHNob3duIGFuZCBwb3B1bGF0ZSB0aGUgbGlzdAoJJCgnIycgKyBtb2RhbE5h
bWUgKyAnTW9kYWwnKS5vbignc2hvd24uYnMubW9kYWwnLCBmdW5jdGlvbiAoKSB7CgkJJCgnIycg
KyBtb2RhbE5hbWUgKyAnSW5wdXQnKS5mb2N1cygpLnZhbCgnJyk7CgkJcG9wdWxhdGVMaXN0KG1v
ZGFsTmFtZSwgZGF0YSk7CgkJc2VsZWN0ZWRJbmRleCA9IDA7CgkJaGlnaGxpZ2h0U2VsZWN0ZWRJ
dGVtKG1vZGFsTmFtZSk7Cgl9KTsKCgkvLyBFdmVudCBsaXN0ZW5lciBmb3IgaW5wdXQgZmllbGQg
dHlwaW5nCglkb2N1bWVudC5nZXRFbGVtZW50QnlJZChtb2RhbE5hbWUgKyAnSW5wdXQnKS5hZGRF
dmVudExpc3RlbmVyKCdpbnB1dCcsIGZ1bmN0aW9uKCkgewoJCXBvcHVsYXRlTGlzdChtb2RhbE5h
bWUsIGRhdGEpOwoJCXNlbGVjdGVkSW5kZXggPSAwOwoJfSk7CgoJLy8gRXZlbnQgbGlzdGVuZXIg
Zm9yIGFycm93IGtleXMgYW5kIGVudGVyIGtleQoJZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQobW9k
YWxOYW1lICsgJ0lucHV0JykuYWRkRXZlbnRMaXN0ZW5lcigna2V5ZG93bicsIGZ1bmN0aW9uKGV2
ZW50KSB7CgkJdmFyIGl0ZW1zID0gZG9jdW1lbnQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZShtb2Rh
bE5hbWUgKyAnLWxpc3QtaXRlbScpOwoJCWlmIChldmVudC5rZXkgPT09ICdBcnJvd0Rvd24nKSB7
CgkJCWV2ZW50LnByZXZlbnREZWZhdWx0KCk7CgkJCWlmIChzZWxlY3RlZEluZGV4IDwgaXRlbXMu
bGVuZ3RoIC0gMSkgc2VsZWN0ZWRJbmRleCsrOwoJCQloaWdobGlnaHRTZWxlY3RlZEl0ZW0obW9k
YWxOYW1lKTsKCQl9IGVsc2UgaWYgKGV2ZW50LmtleSA9PT0gJ0Fycm93VXAnKSB7CgkJCWV2ZW50
LnByZXZlbnREZWZhdWx0KCk7CgkJCWlmIChzZWxlY3RlZEluZGV4ID4gMCkgc2VsZWN0ZWRJbmRl
eC0tOwoJCQloaWdobGlnaHRTZWxlY3RlZEl0ZW0obW9kYWxOYW1lKTsKCQl9IGVsc2UgaWYgKGV2
ZW50LmtleSA9PT0gJ0VudGVyJyAmJiBzZWxlY3RlZEluZGV4ID49IDAgJiYgc2VsZWN0ZWRJbmRl
eCA8IGl0ZW1zLmxlbmd0aCkgewoJCQlldmVudC5wcmV2ZW50RGVmYXVsdCgpOwoJCQlpdGVtc1tz
ZWxlY3RlZEluZGV4XS5jbGljaygpOwoJCX0KCX0pOwp9CgpmdW5jdGlvbiBzaG93QXV0b2NvbXBs
ZXRlTW9kYWwobW9kYWxOYW1lKSB7CgkkKCcjJyArIG1vZGFsTmFtZSArICdNb2RhbCcpLm1vZGFs
KCdzaG93Jyk7CglzZWxlY3RlZEluZGV4ID0gLTE7Cn0KPC9zY3JpcHQ+CgoJCQk8ZGl2IGlkPSJj
b250ZW50IiBjbGFzcz0iY29udGFpbmVyLWZsdWlkIj4KPHNjcmlwdD4KCUluaXRBdXRvY29tcGxl
dGUoImdyb3VwbmF2aWdhdG9yIiwgZ3JvdXBuYXZpZ2F0b3JEYXRhKTsKCglkb2N1bWVudC5ib2R5
LmFkZEV2ZW50TGlzdGVuZXIoInNob3dSZWxvYWRQYWdlRGlhbG9nIiwgZnVuY3Rpb24oZXZ0KSB7
CgkJY29uc29sZS5sb2coIkZvcmNlZCByZWxvYWQiKTsKCQlsb2NhdGlvbi5yZWxvYWQoKTsKCX0p
OwoKCWZ1bmN0aW9uIFNob3dCYWNrQnV0dG9uKGxhYmVsKSB7CgkJdmFyIGxvZ29FbGVtZW50ID0g
ZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoImxvZ28iKTsKCQlpZiAobG9nb0VsZW1lbnQpIHsKCQkJ
aHRtbCA9IGAKCQkJCTxzcGFuIHN0eWxlPSJjb2xvcjojZmZmO21hcmdpbi10b3A6MTRweDttYXJn
aW4tbGVmdDoxMnB4O2Zsb2F0OmxlZnQgIWltcG9ydGFudDsgaGVpZ2h0OjM2cHg7Ij4KCQkJCTxh
IG9uY2xpY2s9ImdvQmFjaygpIiBzdHlsZT0iY29sb3I6I2ZmZiI+CgkJCQkJPGkgY2xhc3M9ImZh
LWZ3IGZhLXNvbGlkIGZhLWNoZXZyb24tbGVmdCBmYS1sZyI+PC9pPgoJCQkJPC9hPjwvc3Bhbj5g
OwoJCQlpZiAobGFiZWwgIT0gIiIpIHsKCQkJCWh0bWwgKz0gYDxkaXYgc3R5bGU9InBvc2l0aW9u
OmFic29sdXRlO2xlZnQ6NTAlO3RyYW5zZm9ybTp0cmFuc2xhdGVYKC01MCUpO3RleHQtYWxpZ246
Y2VudGVyO2NvbG9yOiNlY2YwZjE7bWFyZ2luLXRvcDo1cHg7Ij48aDQ+YCArIGxhYmVsICsgYDwv
aDQ+PC9kaXY+YDsKCQkJfQoJCQlsb2dvRWxlbWVudC5pbm5lckhUTUwgPSBodG1sOwoJCX0KCX0K
CglmdW5jdGlvbiBIaWRlQmFja0J1dHRvbigpIHsKCQl2YXIgbG9nb0VsZW1lbnQgPSBkb2N1bWVu
dC5nZXRFbGVtZW50QnlJZCgibG9nbyIpOwoJCWlmIChsb2dvRWxlbWVudCkgewoJCQlsb2dvRWxl
bWVudC5pbm5lckhUTUwgPSBgCgkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmciIGNsYXNzPSJuYXZiYXItbGVmdCI+CgkJCQkJPGltZyBzcmM9Imh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9vcmdpbWcvb3JnLjEwNS9tYWlubG9nby5wbmc/dj0xNjgwNDUwNDQ3
MDM3NjA3OTQ4IiBoZWlnaHQ9IjUwIiBhbHQ9Ikdyb3Vwcy5pbyI+CgkJCQk8L2E+YDsKCQl9Cgl9
CgoJZnVuY3Rpb24gZ29CYWNrKCkgewoJCWhpc3RvcnkuYmFjaygpOwoJfQoKCS8vIHN1Ym1pdEV2
ZW50IGFjdHMgbGlrZSAuc3VibWl0KCksIGV4Y2VwdCBpdCBpcyBjb21wYXRpYmxlIHdpdGggdGhl
IGFwcCwgYnkgdXNpbmcgZXZlbnRzIGluc3RlYWQuCglmdW5jdGlvbiBzdWJtaXRFdmVudChlbGUp
IHsKCQljb25zb2xlLmxvZygiaW4gc3VibWl0RXZlbnQiKTsKCQlpZiAoZWxlLnN0YXJ0c1dpdGgo
JyMnKSkgewogICAgCQllbGUgPSBlbGUuc2xpY2UoMSk7CgkJfQoJCWRvY3VtZW50LmdldEVsZW1l
bnRCeUlkKGVsZSkuc3VibWl0KCk7CgkJcmV0dXJuOwoJCS8qCgkJY29uc3QgdGhlRXZlbnQgPSBu
ZXcgQ3VzdG9tRXZlbnQoJ3N1Ym1pdCcsIHsKCQkJYnViYmxlczogdHJ1ZSwKCQkJY2FuY2VsYWJs
ZTogdHJ1ZQoJCX0pOwoJCWlmICh0eXBlb2YgZWxlID09PSAnc3RyaW5nJyB8fCBlbGUgaW5zdGFu
Y2VvZiBTdHJpbmcpIHsKCQkJaWYgKGVsZS5zdGFydHNXaXRoKCIjIikgPT0gdHJ1ZSkgewoJCQkJ
ZWxlID0gZWxlLnNsaWNlKDEpOwoJCQl9CgkJCWlmIChkb2N1bWVudC5nZXRFbGVtZW50QnlJZChl
bGUpLmRpc3BhdGNoRXZlbnQodGhlRXZlbnQpID09IHRydWUpIHsKCQkJCS8vIGlmIG5vdCBjYW5j
ZWxsZWQsIGRvIG5vcm1hbCBzdWJtaXQKCQkJCWNvbnNvbGUubG9nKCJjYWxsaW5nIHN1Ym1pdCIp
OwoJCQkJZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoZWxlKS5zdWJtaXQoKTsKCQkJfQoJCQlyZXR1
cm47CgkJfQoJCS8vIGFzc3VtZSBlbGUgaXMgdGhlIGVsZW1lbnQKCQlpZiAoZWxlLmRpc3BhdGNo
RXZlbnQodGhlRXZlbnQpID09IHRydWUpIHsKCQkJLy8gaWYgbm90IGNhbmNlbGxlZCwgZG8gbm9y
bWFsIHN1Ym1pdAoJCQljb25zb2xlLmxvZygiY2FsbGluZyBzdWJtaXQiKTsKCQkJZWxlLnN1Ym1p
dCgpOwoJCX0KCQkqLwoJfQoKCS8vIGdpb0Rlc3Ryb3kgaXMgYSBjb252ZW5pZW5jZSBmdW5jdGlv
biBmb3IgZGVzdHJveSBjYWxsYmFja3MKCWZ1bmN0aW9uIGdpb0Rlc3Ryb3koZXZlbnRDQikgewoJ
CWxldCBpbnRlcm5hbEdpb0Rlc3Ryb3kgPSBmdW5jdGlvbihldnQpIHsKCQkJLy8gZG8gbm90IGFj
dGl2YXRlIG9uIGluZmluaXRlIHNjcm9sbCBldmVudHMKCQkJaWYgKGV2dC5kZXRhaWwudGFyZ2V0
ICE9PSB1bmRlZmluZWQgJiYgZXZ0LmRldGFpbC50YXJnZXQuaWQgIT0gIm1haW5jb250ZW50LXJl
ZnJlc2giKSB7CgkJCQljb25zb2xlLmxvZygiSWdub3JpbmcgaW5maW5pdGUgc2Nyb2xsIGV2ZW50
Iik7CgkJCQlyZXR1cm47CgkJCX0KCQkJY29uc29sZS5sb2coIkNhbGxpbmcgZGVzdHJveSBjYWxs
YmFjayIpOwoJCQlldmVudENCKGV2dCk7CgkJfQoJCWRvY3VtZW50LmJvZHkuYWRkRXZlbnRMaXN0
ZW5lcigiaHRteDpiZWZvcmVTd2FwIiwgaW50ZXJuYWxHaW9EZXN0cm95LCB7b25jZTogdHJ1ZX0p
OwoJCWRvY3VtZW50LmJvZHkuYWRkRXZlbnRMaXN0ZW5lcigiaHRteDpoaXN0b3J5Q2FjaGVNaXNz
IiwgaW50ZXJuYWxHaW9EZXN0cm95LCB7b25jZTogdHJ1ZX0pOwoJfQoJCQkKCXZhciBkcmF3ZXJD
bG9zZUZ1bmMgPSBmdW5jdGlvbihldnQpIHsKCQljb25zb2xlLmxvZygiaW4gZHJhd2VyQ2xvc2VG
dW5jIik7CgkJLy8gRmluZCBhbGwgZWxlbWVudHMgd2l0aCB0aGUgY2xhc3MgJ2RyYXdlcicKCQl2
YXIgZHJhd2VycyA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoJy5kcmF3ZXInKTsKCgkJLy8g
SXRlcmF0ZSBvdmVyIGVhY2ggZWxlbWVudCBhbmQgY2FsbCBjbG9zZURyYXdlcigpIG9uIGVhY2gK
CQlkcmF3ZXJzLmZvckVhY2goZnVuY3Rpb24ob2JqKSB7CgkJCWRyYXdlck9iai5jbG9zZURyYXdl
cihvYmopOwoJCX0pOwoJCSQoJy5tb2RhbCcpLm1vZGFsKCdoaWRlJyk7Cgl9Cglkb2N1bWVudC5i
b2R5LmFkZEV2ZW50TGlzdGVuZXIoJ2h0bXg6YmVmb3JlU3dhcCcsIGRyYXdlckNsb3NlRnVuYyk7
Cglkb2N1bWVudC5ib2R5LmFkZEV2ZW50TGlzdGVuZXIoJ2h0bXg6aGlzdG9yeUNhY2hlTWlzcycs
IGRyYXdlckNsb3NlRnVuYyk7CgoJdmFyIGtleWRvd25GdW5jID0gZnVuY3Rpb24oZXZlbnQpIHsK
CQl2YXIgdGFnTmFtZSA9IGV2ZW50LnRhcmdldC50YWdOYW1lLnRvTG93ZXJDYXNlKCk7CgkJaWYg
KHRhZ05hbWUgPT09ICdpbnB1dCcgfHwgdGFnTmFtZSA9PT0gJ3RleHRhcmVhJyB8fCBldmVudC50
YXJnZXQuaXNDb250ZW50RWRpdGFibGUpIHsKCQkJaWYgKGV2ZW50LmtleSA9PT0gJ0VzY2FwZScp
IHsKCQkJCWV2ZW50LnRhcmdldC5ibHVyKCk7CgkJCX0KCQkJcmV0dXJuOwoJCX0KCQkvLyBjaGVj
ayBpZiB0aGUgdmlld2ltYWdlcyB2aWV3ZXIgaXMgdXAKCQlsZXQgZWxlbWVudCA9IGRvY3VtZW50
LmdldEVsZW1lbnRCeUlkKCdvdmVybGF5Jyk7CgkJaWYgKGVsZW1lbnQgJiYgZWxlbWVudC5jbGFz
c0xpc3QuY29udGFpbnMoJ3Zpc2libGUnKSkgewoJCQlyZXR1cm47CgkJfQoJCWNvbnNvbGUubG9n
KCJIRVJFOiAiICsgZXZlbnQua2V5ICsgIiAiICsgZXZlbnQuY3RybEtleSArICIgIiArIGV2ZW50
LnNoaWZ0S2V5ICsgIiAiICsgZXZlbnQubWV0YUtleSk7CgkJaWYgKGV2ZW50LmN0cmxLZXkgJiYg
ZXZlbnQuc2hpZnRLZXkgJiYgKGV2ZW50LmtleSA9PT0gJz8nIHx8IGV2ZW50LmtleSA9PT0gJy8n
KSkgewoJCQlldmVudC5wcmV2ZW50RGVmYXVsdCgpOyAvLyBQcmV2ZW50IHRoZSBkZWZhdWx0IGFj
dGlvbgoJCQkvLyBTaG93IHRoZSBtb2RhbCBkaWFsb2cgZm9yIGtleWJvYXJkIHNob3J0Y3V0cwoJ
CQkkKCcjc2hvcnRjdXRNb2RhbCcpLm1vZGFsKCdzaG93Jyk7CgkJCXJldHVybjsKCQl9CgkJJCgn
I3Nob3J0Y3V0TW9kYWwnKS5tb2RhbCgnaGlkZScpOwoKCQlpZiAoZXZlbnQua2V5LnRvTG93ZXJD
YXNlKCkgPT09ICdnJykgewoJCQkvLyBGb3IgV2luZG93cyBhbmQgTGludXgKCQkJaWYgKGV2ZW50
LmN0cmxLZXkpIHsKCQkJCWV2ZW50LnByZXZlbnREZWZhdWx0KCk7CgkJCQlzaG93QXV0b2NvbXBs
ZXRlTW9kYWwoImdyb3VwbmF2aWdhdG9yIik7CgkJCQlyZXR1cm47CgkJCX0KCQl9CgoJCS8vIENo
ZWNrIGlmIHRoZSBwcmVzc2VkIGtleSBpcyAnLycKCQlpZiAoKGV2ZW50LmtleSA9PT0gJ2YnIHx8
IGV2ZW50LmtleSA9PT0gJ0YnKSAmJiBldmVudC5zaGlmdEtleSkgewoJCQlpZiAobmF2aWdhdG9y
LnBsYXRmb3JtLnRvVXBwZXJDYXNlKCkuaW5kZXhPZignTUFDJykgPj0gMCkgewoJCQkJaWYgKGV2
ZW50Lm1ldGFLZXkpIHsKCQkJCQlldmVudC5wcmV2ZW50RGVmYXVsdCgpOyAvLyBQcmV2ZW50IHRo
ZSBkZWZhdWx0IGFjdGlvbgoJCQkJCS8vIEZvY3VzIG9uIHRoZSBzZWFyY2ggYm94CgkJCQkJbGV0
IGJveCA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdzZWFyY2hib3gnKQoJCQkJCWlmIChib3gg
IT0gbnVsbCkgewoJCQkJCQlkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnc2VhcmNoYm94JykuZm9j
dXMoKTsKCQkJCQl9CgkJCQl9CgkJCX0gZWxzZSB7CgkJCQkvLyBGb3IgV2luZG93cyBhbmQgTGlu
dXgKCQkJCWlmIChldmVudC5jdHJsS2V5KSB7CgkJCQkJZXZlbnQucHJldmVudERlZmF1bHQoKTsg
Ly8gUHJldmVudCB0aGUgZGVmYXVsdCBhY3Rpb24KCQkJCQkvLyBGb2N1cyBvbiB0aGUgc2VhcmNo
IGJveAoJCQkJCWxldCBib3ggPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnc2VhcmNoYm94JykK
CQkJCQlpZiAoYm94ICE9IG51bGwpIHsKCQkJCQkJZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Nl
YXJjaGJveCcpLmZvY3VzKCk7CgkJCQkJfQoJCQkJfQoJCQl9CgkJfQoJfQoJZG9jdW1lbnQuYWRk
RXZlbnRMaXN0ZW5lcigna2V5ZG93bicsIGtleWRvd25GdW5jKTsKCXZhciByZW1vdmVEcmF3ZXJD
bG9zZUZ1bmMgPSBmdW5jdGlvbihldnQpIHsKCQlkb2N1bWVudC5ib2R5LnJlbW92ZUV2ZW50TGlz
dGVuZXIoJ2h0bXg6YmVmb3JlU3dhcCcsIGRyYXdlckNsb3NlRnVuYyk7CgkJZG9jdW1lbnQuYm9k
eS5yZW1vdmVFdmVudExpc3RlbmVyKCdodG14Omhpc3RvcnlDYWNoZU1pc3MnLCBkcmF3ZXJDbG9z
ZUZ1bmMpOwoJCWRvY3VtZW50LnJlbW92ZUV2ZW50TGlzdGVuZXIoJ2tleWRvd24nLCBrZXlkb3du
RnVuYyk7Cgl9Cglkb2N1bWVudC5ib2R5LmFkZEV2ZW50TGlzdGVuZXIoImh0bXg6aGlzdG9yeUNh
Y2hlTWlzcyIsIHJlbW92ZURyYXdlckNsb3NlRnVuYywge29uY2U6IHRydWV9KTsKCgkvLyBDaGVj
ayBmb3IgcGFzc2tleSBlbnJvbGxtZW50IHByb21wdCBhZnRlciBjcm9zcy1kZXZpY2UgYXV0aGVu
dGljYXRpb24KCSQoZnVuY3Rpb24oKSB7CgkJaWYgKHNlc3Npb25TdG9yYWdlLmdldEl0ZW0oJ3Bh
c3NrZXlQcm9tcHRBZnRlckNEQScpID09PSAndHJ1ZScpIHsKCQkJY29uc29sZS5sb2coJ1Bhc3Nr
ZXkgQ0RBIGZsYWcgZGV0ZWN0ZWQsIHNob3dpbmcgZW5yb2xsbWVudCBtb2RhbCcpOwoKCQkJLy8g
U2hvdyB0aGUgbW9kYWwKCQkJJCgnI3Bhc3NrZXlFbnJvbGxtZW50TW9kYWwnKS5tb2RhbCgnc2hv
dycpOwoKCQkJLy8gQ2xlYXIgdGhlIGZsYWcgd2hlbiBtb2RhbCBpcyBkaXNtaXNzZWQKCQkJJCgn
I3Bhc3NrZXlFbnJvbGxtZW50TW9kYWwnKS5vbignaGlkZGVuLmJzLm1vZGFsJywgZnVuY3Rpb24o
KSB7CgkJCQljb25zb2xlLmxvZygnTW9kYWwgZGlzbWlzc2VkLCBjbGVhcmluZyBmbGFnJyk7CgkJ
CQlzZXNzaW9uU3RvcmFnZS5yZW1vdmVJdGVtKCdwYXNza2V5UHJvbXB0QWZ0ZXJDREEnKTsKCQkJ
fSk7CgoJCQkvLyBTZXQgdXAgZW5yb2xsbWVudCBidXR0b24gaGFuZGxlcgoJCQl2YXIgZW5yb2xs
QnRuID0gZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2Vucm9sbExvY2FsUGFzc2tleUJ0bicpOwoJ
CQlpZiAoZW5yb2xsQnRuKSB7CgkJCQllbnJvbGxCdG4uYWRkRXZlbnRMaXN0ZW5lcignY2xpY2sn
LCBmdW5jdGlvbigpIHsKCQkJCQljb25zb2xlLmxvZygnRW5yb2xsbWVudCBidXR0b24gY2xpY2tl
ZCcpOwoJCQkJCS8vIFJlZGlyZWN0IHRvIHNldHRpbmdzIHBhZ2Ugd2hlcmUgdGhleSBjYW4gYWRk
IGEgcGFzc2tleQoJCQkJCXNlc3Npb25TdG9yYWdlLnJlbW92ZUl0ZW0oJ3Bhc3NrZXlQcm9tcHRB
ZnRlckNEQScpOwoJCQkJCXdpbmRvdy5sb2NhdGlvbi5ocmVmID0gJ2h0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9zZXR0aW5ncy9zZWN1cml0eSc7CgkJCQl9KTsKCQkJfQoJCX0KCX0pOwo8
L3NjcmlwdD4KPCEtLSBQYXNza2V5IEVucm9sbG1lbnQgTW9kYWwgLS0+CjxkaXYgY2xhc3M9Im1v
ZGFsIGZhZGUgd2ViYXV0aG4tb25seSIgaWQ9InBhc3NrZXlFbnJvbGxtZW50TW9kYWwiIHRhYmlu
ZGV4PSItMSIgcm9sZT0iZGlhbG9nIj4KCTxkaXYgY2xhc3M9Im1vZGFsLWRpYWxvZyIgcm9sZT0i
ZG9jdW1lbnQiPgoJCTxkaXYgY2xhc3M9Im1vZGFsLWNvbnRlbnQiPgoJCQk8ZGl2IGNsYXNzPSJt
b2RhbC1oZWFkZXIiPgoJCQkJPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJjbG9zZSIgZGF0
YS1kaXNtaXNzPSJtb2RhbCIgYXJpYS1sYWJlbD0iQ2xvc2UiPgoJCQkJCTxzcGFuIGFyaWEtaGlk
ZGVuPSJ0cnVlIj4mdGltZXM7PC9zcGFuPgoJCQkJPC9idXR0b24+CgkJCQk8aDQgY2xhc3M9Im1v
ZGFsLXRpdGxlIj4KCQkJCQk8aSBjbGFzcz0iZmEgZmEtZmluZ2VycHJpbnQiPjwvaT4KCQkJCQlB
ZGQgYSBQYXNza2V5IHRvIFRoaXMgRGV2aWNlCgkJCQk8L2g0PgoJCQk8L2Rpdj4KCQkJPGRpdiBj
bGFzcz0ibW9kYWwtYm9keSI+CgkJCQk8cD4KCQkJCQlZb3UgbG9nZ2VkIGluIHVzaW5nIGEgcGFz
c2tleSBmcm9tIGFub3RoZXIgZGV2aWNlLiBGb3IgZmFzdGVyIGFjY2VzcyBuZXh0IHRpbWUsIGFk
ZCBhIHBhc3NrZXkgdG8gdGhpcyBkZXZpY2UuCgkJCQk8L3A+CgkJCQk8cD4KCQkJCQk8c3Ryb25n
PkJlbmVmaXRzOjwvc3Ryb25nPgoJCQkJPC9wPgoJCQkJPHVsPgoJCQkJCTxsaT5GYXN0ZXIgbG9n
aW4gd2l0aCBqdXN0IHlvdXIgZmluZ2VycHJpbnQgb3IgZmFjZTwvbGk+CgkJCQkJPGxpPk5vIG5l
ZWQgdG8gdXNlIHlvdXIgcGhvbmUgZWFjaCB0aW1lPC9saT4KCQkJCQk8bGk+V29ya3MgZXZlbiB3
aGVuIG9mZmxpbmU8L2xpPgoJCQkJPC91bD4KCQkJPC9kaXY+CgkJCTxkaXYgY2xhc3M9Im1vZGFs
LWZvb3RlciI+CgkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4tZGVmYXVs
dCIgZGF0YS1kaXNtaXNzPSJtb2RhbCI+CgkJCQkJTWF5YmUgTGF0ZXIKCQkJCTwvYnV0dG9uPgoJ
CQkJPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJidG4gYnRuLXByaW1hcnkiIGlkPSJlbnJv
bGxMb2NhbFBhc3NrZXlCdG4iPgoJCQkJCTxpIGNsYXNzPSJmYSBmYS1wbHVzIj48L2k+CgkJCQkJ
QWRkIFBhc3NrZXkgTm93CgkJCQk8L2J1dHRvbj4KCQkJPC9kaXY+CgkJPC9kaXY+Cgk8L2Rpdj4K
PC9kaXY+CjwhLS0gTW9kYWwgRGlhbG9nIGZvciBLZXlib2FyZCBTaG9ydGN1dHMgLS0+CjxkaXYg
Y2xhc3M9Im1vZGFsIGZhZGUiIGlkPSJzaG9ydGN1dE1vZGFsIiB0YWJpbmRleD0iLTEiIHJvbGU9
ImRpYWxvZyIgYXJpYS1sYWJlbGxlZGJ5PSJteU1vZGFsTGFiZWwiPgogIDxkaXYgY2xhc3M9Im1v
ZGFsLWRpYWxvZyIgcm9sZT0iZG9jdW1lbnQiPgogICAgPGRpdiBjbGFzcz0ibW9kYWwtY29udGVu
dCI+CiAgICAgIDxkaXYgY2xhc3M9Im1vZGFsLWhlYWRlciI+CiAgICAgICAgPGg0IGNsYXNzPSJt
b2RhbC10aXRsZSIgaWQ9Im15TW9kYWxMYWJlbCI+S2V5Ym9hcmQgU2hvcnRjdXRzPC9oND4KICAg
ICAgPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9Im1vZGFsLWJvZHkiPgoJCTxkaXYgY2xhc3M9InJv
dyI+CgkJCTxkaXYgY2xhc3M9ImNvbC14cy0zIHRleHQtcmlnaHQiPjxzdHJvbmc+Y3RybDwvc3Ry
b25nPiArIDxzdHJvbmc+c2hpZnQ8L3N0cm9uZz4gKyA8c3Ryb25nPj88L3N0cm9uZz4mbmJzcDsm
bmJzcDs6PC9kaXY+CgkJCTxkaXYgY2xhc3M9ImNvbC14cy05IiBzdHlsZT0ibWFyZ2luLWxlZnQ6
IC0yM3B4OyI+U2hvdyBhbGwga2V5Ym9hcmQgc2hvcnRjdXRzPC9kaXY+CgkJPC9kaXY+CgkJPGRp
diBjbGFzcz0icm93Ij4KCQkJPGRpdiBjbGFzcz0iY29sLXhzLTMgdGV4dC1yaWdodCI+PHN0cm9u
Zz5jdHJsPC9zdHJvbmc+ICsgPHN0cm9uZz5nPC9zdHJvbmc+Jm5ic3A7Jm5ic3A7OjwvZGl2PgoJ
CQk8ZGl2IGNsYXNzPSJjb2wteHMtOSIgc3R5bGU9Im1hcmdpbi1sZWZ0OiAtMjNweDsiPk5hdmln
YXRlIHRvIGEgZ3JvdXA8L2Rpdj4KCQk8L2Rpdj4KCQk8ZGl2IGNsYXNzPSJyb3ciPgoJCQk8ZGl2
IGNsYXNzPSJjb2wteHMtMyB0ZXh0LXJpZ2h0Ij48c3Ryb25nIGNsYXNzPSJjdHJsbWV0YSI+Y3Ry
bDwvc3Ryb25nPiArIDxzdHJvbmc+c2hpZnQ8L3N0cm9uZz4gKyA8c3Ryb25nPmY8L3N0cm9uZz4m
bmJzcDsmbmJzcDs6PC9kaXY+CgkJCTxkaXYgY2xhc3M9ImNvbC14cy05IiBzdHlsZT0ibWFyZ2lu
LWxlZnQ6IC0yM3B4OyI+RmluZDwvZGl2PgoJCTwvZGl2PgoJCTxkaXYgY2xhc3M9InJvdyI+CgkJ
CTxkaXYgY2xhc3M9ImNvbC14cy0zIHRleHQtcmlnaHQiPjxzdHJvbmcgY2xhc3M9ImN0cmxtZXRh
Ij5jdHJsPC9zdHJvbmc+ICsgPHN0cm9uZz4vPC9zdHJvbmc+Jm5ic3A7Jm5ic3A7OjwvZGl2PgoJ
CQk8ZGl2IGNsYXNzPSJjb2wteHMtOSIgc3R5bGU9Im1hcmdpbi1sZWZ0OiAtMjNweDsiPlF1aWNr
IGFjdGlvbnM8L2Rpdj4KCQk8L2Rpdj4KCQk8L2Rpdj4KCQk8ZGl2IGNsYXNzPSJ0ZXh0LWNlbnRl
ciIgc3R5bGU9Im1hcmdpbi10b3A6MTBweDsgbWFyZ2luLWJvdHRvbToxMHB4OyBmb250LXNpemU6
MTJweDsiPjxzdHJvbmc+ZXNjPC9zdHJvbmc+IHRvIGRpc21pc3M8L2Rpdj4KICAgIDwvZGl2Pgog
IDwvZGl2Pgo8L2Rpdj4KCQkJCQoJCgk8ZGl2IGlkPSJtYWlucm93IiBjbGFzcz0icm93IiAgaHgt
Ym9vc3Q9InRydWUiIGh4LXRhcmdldD0iI21haW5jb250ZW50LXJlZnJlc2giIGh4LXB1c2gtdXJs
PSJ0cnVlIiBoeC1oaXN0b3J5PSJmYWxzZSIgaHgtb246OmFmdGVyLXJlcXVlc3Q9ImRvY3VtZW50
LmdldEVsZW1lbnRCeUlkKCdtYWluY29udGVudCcpLnNjcm9sbFRvKHt0b3A6IDAsIGJlaGF2aW9y
OiAnaW5zdGFudCd9KSIgPgoJCTxkaXYgaWQ9Imdyb3Vwc2lkZWJhciIgY2xhc3M9InNjcm9sbGJh
ciBoaWRkZW4tcHJpbnQiPgoJCQk8ZGl2IGNsYXNzPSJzY3JvbGxiYXItY29udGVudCI+CgkJCQk8
ZGl2IGlkPSJhY2NvcmRpb24iIHJvbGU9InRhYmxpc3QiIGFyaWEtbXVsdGlzZWxlY3RhYmxlPSJ0
cnVlIiBzdHlsZT0ibWFyZ2luLWJvdHRvbToyMHB4OyI+CgkJCQkJPGRpdiBjbGFzcz0ibGlzdC1n
cm91cCBub2JvcmRlcmxpc3QiIHN0eWxlPSJib3JkZXI6MDttYXJnaW4tYm90dG9tOjBweCI+CgkJ
CQkJCQoKCgk8YSB0aXRsZT0iR3JvdXAgSG9tZSIgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUiIGNsYXNzPSJsaXN0LWdyb3VwLWl0ZW0gc2lk
ZWJhci1pdGVtIj4KCQk8aSBjbGFzcz0iZmEtZncgZmEgZmEtaG9tZSBmYS1sZyI+PC9pPgoJCUhv
bWUKCQkKCTwvYT4KCgkKCgkKCgkKCQkKCQoJCQoKCTxhIHRpdGxlPSJNZXNzYWdlcyIgaHJlZj0i
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWNz
P3NpZGViYXI9dHJ1ZSIgaWQ9InNpZGViYXItYXJjaGl2ZXMiIGNsYXNzPSJub2JvcmRlcml0ZW0g
bGlzdC1ncm91cC1pdGVtIHNpZGViYXItaXRlbSBzaWRlYmFyLWl0ZW0tYXJjaGl2ZXMgYWN0aXZl
Ij4gCgkJPGkgY2xhc3M9ImZhLWZ3IGZhIGZhLWNvbW1lbnRzIGZhLWxnIj48L2k+CgkJTWVzc2Fn
ZXMKCQk8c3BhbiBpZD0ic2lkZWJhci1hcmNoaXZlcy1iYWRnZSIgY2xhc3M9ImJhZGdlIj48L3Nw
YW4+Cgk8L2E+CgoJCgkKCQoJCgkKCQoJCQoKCTxhIHRpdGxlPSJIYXNodGFncyIgaHJlZj0iaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvaGFzaHRhZ3Mi
IGlkPSJzaWRlYmFyLWhhc2h0YWdzIiBjbGFzcz0ibm9ib3JkZXJpdGVtIGxpc3QtZ3JvdXAtaXRl
bSBzaWRlYmFyLWl0ZW0gc2lkZWJhci1pdGVtLWhhc2h0YWdzIj4gCgkJPGkgY2xhc3M9ImZhLWZ3
IGZhIGZhLWhhc2h0YWcgZmEtbGciPjwvaT4KCQlIYXNodGFncwoJCTxzcGFuIGlkPSJzaWRlYmFy
LWhhc2h0YWdzLWJhZGdlIiBjbGFzcz0iYmFkZ2UiPjwvc3Bhbj4KCTwvYT4KCgkKCgkJCgkKCgkK
CgkKCgkKCQkJCgoJPGEgdGl0bGU9IlN1Ymdyb3VwcyIgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvc3ViZ3JvdXBzIiBpZD0ic2lkZWJhci1z
dWJncm91cHMiIGNsYXNzPSJub2JvcmRlcml0ZW0gbGlzdC1ncm91cC1pdGVtIHNpZGViYXItaXRl
bSBzaWRlYmFyLWl0ZW0tc3ViZ3JvdXBzIj4gCgkJPGkgY2xhc3M9ImZhLWZ3IGZhIGZhLWNoYXJ0
LXBpZSBmYS1sZyI+PC9pPgoJCVN1Ymdyb3VwcwoJCTxzcGFuIGlkPSJzaWRlYmFyLXN1Ymdyb3Vw
cy1iYWRnZSIgY2xhc3M9ImJhZGdlIj48L3NwYW4+Cgk8L2E+CgoJCgoJCgoJCgoJCgoJCgoJCgoJ
CgoJCQkJCTwvZGl2PgoJCQkJPC9kaXY+CgkJCQkKCTxkaXYgY2xhc3M9InRleHQtY2VudGVyIiBz
dHlsZT0iZm9udC1zaXplOjEzcHg7bWFyZ2luLWJvdHRvbTozMHB4Ij4KCQk8ZGl2IHN0eWxlPSJw
YWRkaW5nLWJvdHRvbToxMHB4OyI+CgkJCTxzdHJvbmc+Y3RybDwvc3Ryb25nPiArIDxzdHJvbmc+
c2hpZnQ8L3N0cm9uZz4gKyA8c3Ryb25nPj88L3N0cm9uZz4gZm9yIHNob3J0Y3V0cwoJCTwvZGl2
PgoJCTxkaXYgc3R5bGU9InBhZGRpbmctYm90dG9tOjVweDsiPgoJCQk8YSBocmVmPSJodHRwczov
L2dyb3Vwcy5pby9zdGF0aWMvYWJvdXQiPgoJCQkJQWJvdXQKCQkJPC9hPiAmbWlkZG90OwoJCQk8
YSBocmVmPSJodHRwczovL2dyb3Vwcy5pby9zdGF0aWMvZmVhdHVyZXMiPgoJCQkJRmVhdHVyZXMK
CQkJPC9hPiAmbWlkZG90OwoJCQk8YSBocmVmPSJodHRwczovL2dyb3Vwcy5pby9zdGF0aWMvcHJp
Y2luZyI+CgkJCQlQcmljaW5nCgkJCTwvYT4KCQk8L2Rpdj4KCQk8ZGl2IHN0eWxlPSJwYWRkaW5n
LWJvdHRvbTo1cHg7Ij4KCQkJPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuaW8vaG9tZSI+CgkJCQlI
b21lCgkJCTwvYT4gJm1pZGRvdDsKCQkJPGEgcmVsPSJub2ZvbGxvdyIgaHJlZj0iaHR0cHM6Ly9n
cm91cHMuaW8vY2hhbmdlbG9nIj4KCQkJCUNoYW5nZWxvZwoJCQk8L2E+ICZtaWRkb3Q7CgkJCTxh
IGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmlvL3N0YXRpYy90b3MiPgoJCQkJVGVybXMKCQkJPC9hPgoJ
CTwvZGl2PgoJCTxkaXYgc3R5bGU9InBhZGRpbmctYm90dG9tOjVweDsiPgoJCQk8YSBocmVmPSJo
dHRwczovL2dyb3Vwcy5pby9oZWxwY2VudGVyIiB0YXJnZXQ9Il9ibGFuayI+CgkJCQlIZWxwCgkJ
CTwvYT4KCQk8L2Rpdj4KCQk8ZGl2IHN0eWxlPSJwYWRkaW5nLWJvdHRvbTo1cHg7Ij4KCQkJJmNv
cHk7IDIwMjUgR3JvdXBzLmlvCgkJPC9kaXY+Cgk8L2Rpdj4KCgkJCTwvZGl2PgoJCTwvZGl2PgoJ
CTxkaXYgaWQ9Im1haW5jb250ZW50IiBjbGFzcz0iZ3JvdXBtYWluY29udGVudCI+CgkJCTxkaXYg
aWQ9Im1haW5jb250ZW50LXJlZnJlc2giPgoJCQkJPGRpdiBpZD0ibWFpbmNvbnRlbnQtY29sdW1u
IiBjbGFzcz0iY29sLXhzLTEyIG1haW5jb250ZW50LWNvbHVtbiI+CgkJCQkJCgkKCQoJCgoJCgoJ
Cgk8ZGl2IGlkPSJhbGVydGRpdiI+PC9kaXY+Cgk8ZGl2IGNsYXNzPSJub3RpY2V0ZW1wbGF0ZSB0
ZW1wbGF0ZSI+CgkJPGRpdiBjbGFzcz0iYWxlcnQgYWxlcnQtc3VjY2VzcyBhbGVydC1kaXNtaXNz
aWJsZSIgcm9sZT0iYWxlcnQiPgoJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImNsb3Nl
IiBkYXRhLWRpc21pc3M9ImFsZXJ0IiBhcmlhLWxhYmVsPSJDbG9zZSI+CgkJCQk8c3BhbiBhcmlh
LWhpZGRlbj0idHJ1ZSI+CgkJCQkJJnRpbWVzOwoJCQkJPC9zcGFuPgoJCQk8L2J1dHRvbj4KCQkJ
PHNwYW4gY2xhc3M9ImZsYXNobXNnIj48L3NwYW4+CgkJPC9kaXY+Cgk8L2Rpdj4KCTxkaXYgY2xh
c3M9ImFsZXJ0dGVtcGxhdGUgdGVtcGxhdGUiPgoJCTxkaXYgY2xhc3M9ImFsZXJ0IGFsZXJ0LWRh
bmdlciBhbGVydC1kaXNtaXNzaWJsZSIgcm9sZT0iYWxlcnQiPgoJCQk8YnV0dG9uIHR5cGU9ImJ1
dHRvbiIgY2xhc3M9ImNsb3NlIiBkYXRhLWRpc21pc3M9ImFsZXJ0IiBhcmlhLWxhYmVsPSJDbG9z
ZSI+CgkJCQk8c3BhbiBhcmlhLWhpZGRlbj0idHJ1ZSI+CgkJCQkJJnRpbWVzOwoJCQkJPC9zcGFu
PgoJCQk8L2J1dHRvbj4KCQkJPHNwYW4gY2xhc3M9ImZsYXNobXNnIj48L3NwYW4+CgkJPC9kaXY+
Cgk8L2Rpdj4KCTxkaXYgY2xhc3M9ImFsZXJ0bm9jbG9zZXRlbXBsYXRlIHRlbXBsYXRlIj4KCQk8
ZGl2IGNsYXNzPSJhbGVydCBhbGVydC1kYW5nZXIiIHJvbGU9ImFsZXJ0Ij4KCQkJPHNwYW4gY2xh
c3M9ImZsYXNobXNnIj48L3NwYW4+CgkJPC9kaXY+Cgk8L2Rpdj4KCgoKIAo8c2NyaXB0PgpmdW5j
dGlvbiBkaXNtaXNzKCkgewogICAgY29uc29sZS5sb2coImRpc21pc3MiKTsKICAgICQuZ2V0KCAi
L2Rpc21pc3NhbGVydCIpOwp9Cgp2YXIgJGFsZXJ0dGVtcGxhdGUgPSAkKCIuYWxlcnR0ZW1wbGF0
ZSIpOwp2YXIgJGFsZXJ0bm9jbG9zZXRlbXBsYXRlID0gJCgiLmFsZXJ0bm9jbG9zZXRlbXBsYXRl
Iik7CnZhciAkbm90aWNldGVtcGxhdGUgPSAkKCIubm90aWNldGVtcGxhdGUiKTsKZnVuY3Rpb24g
Y3JlYXRlQWxlcnQobXNnLCBpc0Vycm9yLCBhdXRvQ2xvc2UsIG5vQ2xvc2UpIHsKCWlmIChpc0Vy
cm9yID09IGZhbHNlKSB7CgkJJG5ld1BhbmVsID0gJG5vdGljZXRlbXBsYXRlLmNsb25lKCk7Cgl9
IGVsc2UgewogICAgICAgIGlmIChub0Nsb3NlKSB7CgkJICAkbmV3UGFuZWwgPSAkYWxlcnRub2Ns
b3NldGVtcGxhdGUuY2xvbmUoKTsKICAgICAgICB9IGVsc2UgewoJCSAgJG5ld1BhbmVsID0gJGFs
ZXJ0dGVtcGxhdGUuY2xvbmUoKTsKICAgICAgICB9Cgl9CgkkbmV3UGFuZWwuZmluZCgiLmZsYXNo
bXNnIikuaHRtbChtc2cpOwoJaWYgKGF1dG9DbG9zZSA9PSB0cnVlKSB7CgkJJCgiI2FsZXJ0ZGl2
IikuYXBwZW5kKCRuZXdQYW5lbC5mYWRlVG8oMjAwMCwgNTAwKS5zbGlkZVVwKDUwMCwgZnVuY3Rp
b24oKXsKCQkgICAgJG5ld1BhbmVsLnNsaWRlVXAoNTAwKTsKCQkgICAgJG5ld1BhbmVsLnJlbW92
ZSgpOwoJCX0pKTsgIAkKCX0gZWxzZSB7CgkJJCgiI2FsZXJ0ZGl2IikuYXBwZW5kKCRuZXdQYW5l
bC5mYWRlSW4oKSk7Cgl9CiAgICByZXR1cm4gJG5ld1BhbmVsOwp9CgoKCgo8L3NjcmlwdD4KCgoK
CQoKPHNjcmlwdD4KICAvLyBkb0xpa2UgdG9nZ2xlcyBhIGxpa2UgZm9yIGEgcGVyc29uLgogIGZ1
bmN0aW9uIGRvTGlrZShncm91cG5hbWUsIG51bWxpa2VzLCBtc2dpZCwgbGlrZSwgY3NyZikgewog
ICAgJC5hamF4KHsKICAgICAgdXJsOiBncm91cG5hbWUrIi9saWtlP21zZ2lkPSIrbXNnaWQrIiZs
aWtlPSIrbGlrZSsiJmNzcmY9Iitjc3JmLAogICAgICBjYWNoZTogZmFsc2UsCiAgICB9KTsKICAg
IGlmIChsaWtlID09IHRydWUpIHsKICAgICAgbnVtbGlrZXMrKwogICAgfSBlbHNlIHsKICAgICAg
bnVtbGlrZXMtLQogICAgfQogICAgZGlzcGxheUxpa2VzKGdyb3VwbmFtZSwgbnVtbGlrZXMsIG1z
Z2lkLCBsaWtlLCBjc3JmKTsKICAgIGRpc3BsYXlMaWtlU3RhdHMoZ3JvdXBuYW1lLCBudW1saWtl
cywgbXNnaWQsIGxpa2UpOwogIH0KCiAgLy8gZGlzcGxheUxpa2VzIGRpc3BsYXlzIHRoZSBMaWtl
L1VubGlrZSBsaW5rIGJ1dHRvbi4KICBmdW5jdGlvbiBkaXNwbGF5TGlrZXMoZ3JvdXBuYW1lLCBu
dW1saWtlcywgbXNnaWQsIGhhc2xpa2VkLCBjc3JmKSB7CiAgICBpZiAoaGFzbGlrZWQgPT0gdHJ1
ZSkgewogICAgICBsaWtlZGF0YSA9ICI8c3BhbiBpZD0nbGlrZWJ1dHRvbiIrbXNnaWQrIic+PGEg
aHJlZj0nIycgb25jbGljaz0nZG9MaWtlKFwiIitncm91cG5hbWUrIlwiLCIrbnVtbGlrZXMrIiwi
K21zZ2lkKyIsIGZhbHNlLCBcIiIrY3NyZisiXCIpO3JldHVybiBmYWxzZTsnPjxpIGNsYXNzPVwi
ZmEgZmEtdGh1bWJzLXVwXCI+PC9pPiBVbmxpa2U8L2E+PC9zcGFuPiIKICAgIH0gZWxzZSB7CiAg
ICAgIGxpa2VkYXRhID0gIjxzcGFuIGlkPSdsaWtlYnV0dG9uIittc2dpZCsiJz48YSBocmVmPScj
JyBvbmNsaWNrPSdkb0xpa2UoXCIiK2dyb3VwbmFtZSsiXCIsIitudW1saWtlcysiLCIrbXNnaWQr
IiwgdHJ1ZSwgXCIiK2NzcmYrIlwiKTtyZXR1cm4gZmFsc2U7Jz48aSBjbGFzcz1cImZhIGZhLXRo
dW1icy11cFwiPjwvaT4gTGlrZTwvYT48L3NwYW4+IgogICAgfQogICAgJCgiI2xpa2VidXR0b24i
K21zZ2lkKS5odG1sKGxpa2VkYXRhKTsKICB9CgogIC8vIGRpc3BsYXlMaWtlU3RhdHMgZGlzcGxh
eXMgdGhlIGxpbmUgdGhhdCBzaG93cyBob3cgbWFueSBwZW9wbGUgaGF2ZSBsaWtlZCB0aGlzLgog
IGZ1bmN0aW9uIGRpc3BsYXlMaWtlU3RhdHMoZ3JvdXBuYW1lLCBudW1saWtlcywgbXNnaWQsIGhh
c2xpa2VkKSB7CiAgICBpZiAoaGFzbGlrZWQgPT0gZmFsc2UgJiYgbnVtbGlrZXMgPT0gMCkgewog
ICAgICAkKCIjbGlrZXN0YXRzIittc2dpZCkuaHRtbCgiPHNwYW4gaWQ9J2xpa2VzdGF0cyIrbXNn
aWQrIidjbGFzcz0nbGlrZXN0YXRzJz48L3NwYW4+Iik7CiAgICAgIHJldHVybgogICAgfQogICAg
bGlrZWRhdGEgPSAiPHNwYW4gaWQ9J2xpa2VzdGF0cyIgKyBtc2dpZCArICInIGNsYXNzPSdsaWtl
c3RhdHMnPjxpIGNsYXNzPSdmYSBmYS10aHVtYnMtdXAnPjwvaT4gIgogICAgaWYgKGhhc2xpa2Vk
ID09IHRydWUpIHsKICAgICAgbGlrZWRhdGEgKz0gIllvdSIKICAgICAgaWYgKG51bWxpa2VzID4g
MSkgewogICAgICAgIGxpa2VkYXRhID0gbGlrZWRhdGEgKyAiIGFuZCA8YSBocmVmPScjJyBvbmNs
aWNrPSdzaG93TGlrZXMoXCIiICsgZ3JvdXBuYW1lICsgIlwiLCIgKyBtc2dpZCArICIpO3JldHVy
biBmYWxzZTsnPiIgKyAobnVtbGlrZXMtMSkKICAgICAgICBpZiAobnVtbGlrZXMgPT0gMikgewog
ICAgICAgICAgbGlrZWRhdGEgPSBsaWtlZGF0YSArICIgT3RoZXIiCiAgICAgICAgfSBlbHNlIHsK
ICAgICAgICAgIGxpa2VkYXRhID0gbGlrZWRhdGEgKyAiIE90aGVycyIKICAgICAgICB9CiAgICAg
IH0KICAgIH0gZWxzZSB7CiAgICAgICAgbGlrZWRhdGEgKz0gIjxhIGhyZWY9JyMnIG9uY2xpY2s9
J3Nob3dMaWtlcyhcIiIgKyBncm91cG5hbWUgKyAiXCIsIiArIG1zZ2lkICsgIik7cmV0dXJuIGZh
bHNlOyc+IiArIG51bWxpa2VzCiAgICAgICAgaWYgKG51bWxpa2VzID09IDEpIHsKICAgICAgICAg
IGxpa2VkYXRhID0gbGlrZWRhdGEgKyAiIFBlcnNvbiIKICAgICAgICB9IGVsc2UgewogICAgICAg
ICAgbGlrZWRhdGEgPSBsaWtlZGF0YSArICIgUGVvcGxlIgogICAgICAgIH0KICAgIH0KICAgIGxp
a2VkYXRhID0gbGlrZWRhdGEgKyAiPC9hPiBsaWtlZCB0aGlzPC9zcGFuPiIKICAgICQoIiNsaWtl
c3RhdHMiK21zZ2lkKS5odG1sKGxpa2VkYXRhKTsKICB9CgogIC8vIHNob3dMaWtlcyBmZXRjaGVz
IGFsbCB0aGUgbGlrZXMgZm9yIGEgbWVzc2FnZSBhbmQgcG9wcyB1cCB0aGUgZGlhbG9nIGJveCB0
byBzaG93IHRoZW0uCiAgZnVuY3Rpb24gc2hvd0xpa2VzKGdyb3VwbmFtZSwgbXNnaWQpIHsKICAg
IGNvbnNvbGUubG9nKGdyb3VwbmFtZSkKICAgICQuZ2V0SlNPTihncm91cG5hbWUrIi9nZXRsaWtl
cz9tc2dpZD0iK21zZ2lkLCBmdW5jdGlvbiggZGF0YSApIHsKICAgICAgICBodG1sZGF0YSA9ICc8
dWwgY2xhc3M9Imxpc3QtZ3JvdXAiPicKICAgICAgICBqUXVlcnkuZWFjaChkYXRhLCBmdW5jdGlv
bigpIHsKICAgICAgICAgIGh0bWxkYXRhICs9ICc8bGkgY2xhc3M9Imxpc3QtZ3JvdXAtaXRlbSIg
c3R5bGU9ImRpc3BsYXk6IGZsZXg7YWxpZ24taXRlbXM6IGNlbnRlcjsiPicgKyB0aGlzLkljb24g
KyAnIDxzcGFuIHN0eWxlPSJtYXJnaW4tbGVmdDogMTBweDsiPicgKyB0aGlzLlByb2ZpbGUgKyAn
PC9zcGFuPjwvbGk+JwogICAgICAgIH0pOwogICAgICAgIGh0bWxkYXRhICs9ICc8L3VsPicKICAg
ICAgICAkKCIjc2hvd2xpa2VzYm9keSIpLmh0bWwoaHRtbGRhdGEpOwogICAgICAgICQoJyNzaG93
bGlrZXNtb2RhbCcpLm1vZGFsKHtzaG93OnRydWV9KQogICAgICB9CiAgICApOwogIH0KPC9zY3Jp
cHQ+CgoJPCEtLSBzaG93IGxpa2VzIG1vZGFsIC0tPgoJPGRpdiBjbGFzcz0ibW9kYWwgZmFkZSIg
aWQ9InNob3dsaWtlc21vZGFsIiB0YWJpbmRleD0iLTEiIHJvbGU9ImRpYWxvZyIgYXJpYS1sYWJl
bGxlZGJ5PSJzaG93bGlrZXNtb2RhbExhYmVsIj4KCQk8ZGl2IGNsYXNzPSJtb2RhbC1kaWFsb2ci
IHJvbGU9ImRvY3VtZW50Ij4KCQkJPGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CgkJCQk8ZGl2
IGNsYXNzPSJtb2RhbC1oZWFkZXIiPgoJCQkJCTxidXR0b24gdHlwZT0iYnV0dG9uIiBjbGFzcz0i
Y2xvc2UiIGRhdGEtZGlzbWlzcz0ibW9kYWwiPgoJCQkJCQk8c3BhbiBhcmlhLWhpZGRlbj0idHJ1
ZSI+CgkJCQkJCQkmdGltZXM7CgkJCQkJCTwvc3Bhbj4KCQkJCQkJPHNwYW4gY2xhc3M9InNyLW9u
bHkiPgoJCQkJCQkJQ2xvc2UKCQkJCQkJPC9zcGFuPgoJCQkJCTwvYnV0dG9uPgoJCQkJCTxoNCBj
bGFzcz0ibW9kYWwtdGl0bGUiIGlkPSJzaG93bGlrZXNtb2RhbExhYmVsIj4KCQkJCQkJTGlrZXMK
CQkJCQk8L2g0PgoJCQkJPC9kaXY+CgkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1ib2R5Ij4KCQkJCQk8
ZGl2IGlkPSJzaG93bGlrZXNib2R5Ij48L2Rpdj4KCQkJCTwvZGl2PgoJCQkJPGRpdiBjbGFzcz0i
bW9kYWwtZm9vdGVyIj4KCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4t
ZGVmYXVsdCBidG4tc20iIGRhdGEtZGlzbWlzcz0ibW9kYWwiPgoJCQkJCQk8aSBjbGFzcz0iZmEg
ZmEtdGltZXMiPjwvaT4KCQkJCQkJQ2xvc2UKCQkJCQk8L2J1dHRvbj4KCQkJCTwvZGl2PgoJCQk8
L2Rpdj4KCQk8L2Rpdj4KCTwvZGl2PgoKCjxzY3JpcHQ+CnZhciBlZGl0b3I7CmNvbnRlbnRMb2Fk
ZWQoZmFsc2UsIGZ1bmN0aW9uKCkgewoJCn0pOwo8L3NjcmlwdD4KCQoJCQoKCTxkaXYgY2xhc3M9
InJvdyBicmVhZGNydW1iLXJvdyIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDEwcHgiPgoJCTxkaXYg
Y2xhc3M9ImNvbC14cy0xMiBjb2wtc20tOSI+CgkJCTxzcGFuIGNsYXNzPSJoaWRkZW4tc20gaGlk
ZGVuLW1kIGhpZGRlbi1sZyBwdWxsLXJpZ2h0IiBzdHlsZT0icGFkZGluZzo4cHggMTVweDsiPjxh
IGRhdGEtdG9nZ2xlPSJtb2RhbCIgZGF0YS10YXJnZXQ9IiNzZWFyY2hNb2RhbCI+PGkgY2xhc3M9
ImZhIGZhLXNlYXJjaCI+PC9pPjwvYT48L3NwYW4+CgkJCTxkaXYgY2xhc3M9ImJyZWFkY3J1bWIt
Y29udGFpbmVyIj4KCQkJCQoJCQkJCTxvbCBjbGFzcz0iYnJlYWRjcnVtYiBzY3JvbGwtYnJlYWRj
cnVtYiI+CgkJCQkJCTxsaT48YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZSI+PGkgY2xhc3M9ImZhIGZhLWhvbWUiPjwvaT4gT3BlbmVtYmVk
ZGVkLUNvcmU8L2E+PC9saT4KCQkJCQkJCgkJCQkJCTxsaSBjbGFzcz0iYWN0aXZlIj48YSBocmVm
PSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlcz9tc2dudW09MjI1NDQwIj48aSBjbGFzcz0iZmEgZmEtY29tbWVudHMiPjwvaT4gTWVzc2Fn
ZXM8L2E+PC9saT4KCQkJCQk8L29sPgoJCQkJCgkJCTwvZGl2PgoJCTwvZGl2PgoJCTxkaXYgY2xh
c3M9ImNvbC1zbS0zIGhpZGRlbi14cyIgc3R5bGU9InBhZGRpbmctcmlnaHQ6MHB4Ij4KCQkJPGZv
cm0gY2xhc3M9ImZvcm0taW5saW5lIHB1bGwtcmlnaHQiIG1ldGhvZD0iZ2V0IiBhY3Rpb249Imh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3NlYXJjaCI+
CgkJCQk8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJwIiB2YWx1ZT0iLCwsMjAsMCwwLDAiPgoJ
CQkJCgkJCQk8ZGl2IGNsYXNzPSJpbnB1dC1ncm91cCI+CgkJCQkJPGlucHV0IGlkPSJzZWFyY2hi
b3giIHR5cGU9InRleHQiIGNsYXNzPSJmb3JtLWNvbnRyb2wiIHBsYWNlaG9sZGVyPSJTZWFyY2gi
IHRpdGxlPSJTZWFyY2giIG5hbWU9InEiIHNpemU9IjIwIiB2YWx1ZT0iIiBzdHlsZT0iaGVpZ2h0
OjM3cHgiPgoJCQkJCTxkaXYgY2xhc3M9ImlucHV0LWdyb3VwLWJ0biI+CgkJCQkJCTxidXR0b24g
Y2xhc3M9ImJ0biBidG4tcHJpbWFyeSIgdHlwZT0ic3VibWl0IiBzdHlsZT0iaGVpZ2h0OjM3cHg7
IiBhcmlhLWxhYmVsPSJTZWFyY2giPgoJCQkJCQkJPHNwYW4gY2xhc3M9ImZhIGZhLXNlYXJjaCI+
PC9zcGFuPgoJCQkJCQk8L2J1dHRvbj4KCQkJCQk8L2Rpdj4KCQkJCTwvZGl2PgoJCQk8L2Zvcm0+
CgkJPC9kaXY+Cgk8L2Rpdj4KCgoJPGRpdiBjbGFzcz0ibW9kYWwgZmFkZSIgaWQ9InNlYXJjaE1v
ZGFsIiB0YWJpbmRleD0iLTEiIHJvbGU9ImRpYWxvZyIgYXJpYS1sYWJlbGxlZGJ5PSJzZWFyY2hN
b2RhbExhYmVsIj4KCQk8ZGl2IGNsYXNzPSJtb2RhbC1kaWFsb2ciIHJvbGU9ImRvY3VtZW50Ij4K
CQkJPGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CgkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1oZWFk
ZXIiPgoJCQkJCTxidXR0b24gdHlwZT0iYnV0dG9uIiBjbGFzcz0iY2xvc2UiIGRhdGEtZGlzbWlz
cz0ibW9kYWwiPgoJCQkJCQk8c3BhbiBhcmlhLWhpZGRlbj0idHJ1ZSI+CgkJCQkJCQkmdGltZXM7
CgkJCQkJCTwvc3Bhbj4KCQkJCQkJPHNwYW4gY2xhc3M9InNyLW9ubHkiPgoJCQkJCQkJQ2xvc2UK
CQkJCQkJPC9zcGFuPgoJCQkJCTwvYnV0dG9uPgoJCQkJCTxoNCBjbGFzcz0ibW9kYWwtdGl0bGUi
IGlkPSJzZWFyY2hNb2RhbExhYmVsIj4KCQkJCQkJU2VhcmNoCgkJCQkJPC9oND4KCQkJCTwvZGl2
PgoJCQkJPGZvcm0gY2xhc3M9ImZvcm0taG9yaXpvbnRhbCIgbWV0aG9kPSJnZXQiIGFjdGlvbj0i
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvc2VhcmNo
Ij4KCQkJCQkKCQkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1ib2R5Ij4KCQkJCQkJPGRpdiBjbGFzcz0i
Zm9ybS1ncm91cCI+CgkJCQkJCQk8ZGl2IGNsYXNzPSJjb2wtc20tMTIiPgoJCQkJCQkJCTxpbnB1
dCB0eXBlPSJ0ZXh0IiBjbGFzcz0iZm9ybS1jb250cm9sIiBwbGFjZWhvbGRlcj0iU2VhcmNoIiB0
aXRsZT0iU2VhcmNoIiBuYW1lPSJxIiB2YWx1ZT0iIj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rp
dj4KCQkJCQk8L2Rpdj4KCQkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1mb290ZXIiPgoJCQkJCQk8YnV0
dG9uIGNsYXNzPSJidG4gYnRuLXByaW1hcnkgYnRuLXNtIiBhcmlhLWxhYmVsPSJTZWFyY2giPgoJ
CQkJCQkJPGkgY2xhc3M9ImZhIGZhLXNlYXJjaCI+PC9pPgoJCQkJCQkJU2VhcmNoCgkJCQkJCTwv
YnV0dG9uPgoJCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4tZGVmYXVs
dCBidG4tc20iIGRhdGEtZGlzbWlzcz0ibW9kYWwiPgoJCQkJCQkJPGkgY2xhc3M9ImZhIGZhLXRp
bWVzIj48L2k+CgkJCQkJCQlDYW5jZWwKCQkJCQkJPC9idXR0b24+CgkJCQkJPC9kaXY+CgkJCQk8
L2Zvcm0+CgkJCTwvZGl2PgoJCTwvZGl2PgoJPC9kaXY+CgoJCgk8ZGl2IGNsYXNzPSJyb3ciPgoJ
CTxkaXYgY2xhc3M9ImNvbC14cy0xMiBjb2wtc20tNSBjb2wtbWQtNSIgc3R5bGU9InBhZGRpbmct
cmlnaHQ6MHB4OyI+CgoJCQk8Zm9ybSBjbGFzcz0iZm9ybS1pbmxpbmUiIG1ldGhvZD0iZ2V0IiBh
Y3Rpb249Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L21lc3NhZ2VzIj4KCQkJCTxkaXYgY2xhc3M9ImZvcm0tZ3JvdXAgYnV0dG9uLWxpbmstZ3JvdXAi
PgoJCQkJCQoJCQkJCQoJCgkJPGRpdiBjbGFzcz0iYnRuLWdyb3VwIiBzdHlsZT0iZGlzcGxheTpp
bmxpbmUtYmxvY2siPgoJCgkJCQoJCQkJPGJ1dHRvbiBpZD0id2lkZS1tZXNzYWdlcyIgdHlwZT0i
YnV0dG9uIiBjbGFzcz0iZHJvcGRvd24td2lkZSBidG4gYnRuLXNtIGJ0bi1kZWZhdWx0ICBkcm9w
ZG93bi10b2dnbGUiIGRhdGEtdG9nZ2xlPSJkcm9wZG93biIgYXJpYS1oYXNwb3B1cD0idHJ1ZSIg
YXJpYS1leHBhbmRlZD0iZmFsc2UiPgoJCQkJCQoJCQkJCQk8aSBjbGFzcz0iZmEgZmEtY29tbWVu
dCI+PC9pPgoJCQkJCQoJCQkJCVNpbmdsZQoJCQkJCQoJCQkJCQk8c3BhbiBjbGFzcz0iY2FyZXQi
Pjwvc3Bhbj4KCQkJCQkKCQkJCTwvYnV0dG9uPgoJCQkKCQkJPHVsIGNsYXNzPSJkcm9wZG93bi1t
ZW51IiByb2xlPSJtZW51Ij4KCQkJCQoJCQkJCQoJCQkJCQk8bGk+CgkJCQkJCQk8YSB0aXRsZT0i
TWVzc2FnZXMiIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJl
ZGRlZC1jb3JlL21lc3NhZ2VzP21zZ251bT0yMjU0NDAiPgoJCQkJCQkJCQoJCQkJCQkJCQk8aSBj
bGFzcz0iZmEgZmEtY29tbWVudHMiPjwvaT4KCQkJCQkJCQlNZXNzYWdlcwoJCQkJCQkJPC9hPgoJ
CQkJCQk8L2xpPgoJCQkJCQoJCQkJCgkJCQkJCgkJCQkJCTxsaT4KCQkJCQkJCTxhIHRpdGxlPSJU
b3BpY3MiIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3RvcGljcz90aHJlYWRpZD0xMTYwMDk3ODUiPgoJCQkJCQkJCQoJCQkJCQkJCQk8aSBj
bGFzcz0iZmEgZmEtaW5ib3giPjwvaT4KCQkJCQkJCQlUb3BpY3MKCQkJCQkJCTwvYT4KCQkJCQkJ
PC9saT4KCQkJCQkKCQkJCQoJCQkJCQoJCQkJCQk8bGk+CgkJCQkJCQk8YSB0aXRsZT0iRXhwYW5k
ZWQiIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL21lc3NhZ2VzP2V4cGFuZGVkPTEmYW1wO21zZ251bT0yMjU0NDAiPgoJCQkJCQkJCQoJCQkJ
CQkJCQk8aSBjbGFzcz0iZmEgZmEtY29tbWVudHMiPjwvaT4KCQkJCQkJCQlFeHBhbmRlZAoJCQkJ
CQkJPC9hPgoJCQkJCQk8L2xpPgoJCQkJCQoJCQkJCgkJCTwvdWw+Cgk8L2Rpdj4KCTxkaXYgY2xh
c3M9ImJ0bi1ncm91cCI+CgkJCgkJCTxhIGlkPSJuYXJyb3ctbWVzc2FnZXMiIGhyZWY9ImphdmFz
Y3JpcHQ6dm9pZCgwKSIgY2xhc3M9ImRyb3Bkb3duLW5hcnJvdyBidG4gYnRuLXNtIGJ0bi1kZWZh
dWx0ICIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi00cHg7IiBkYXRhLWRyYXdlci10cmlnZ2VyIGFyaWEt
Y29udHJvbHM9Im1lc3NhZ2VzLWRyYXdlciIgYXJpYS1leHBhbmRlZD0iZmFsc2UiPgoJCQkJCgkJ
CQkJPGkgY2xhc3M9ImZhIGZhLWNvbW1lbnQiPjwvaT4KCQkJCQoJCQkJU2luZ2xlCgkJCQkKCQkJ
CQk8c3BhbiBjbGFzcz0iY2FyZXQiPjwvc3Bhbj4KCQkJCQoJCQk8L2E+CgkJCgk8L2Rpdj4KCTxz
ZWN0aW9uIGNsYXNzPSJkcmF3ZXIgZHJhd2VyLWJvdHRvbSIgaWQ9Im1lc3NhZ2VzLWRyYXdlciIg
ZGF0YS1kcmF3ZXItdGFyZ2V0PgoJCTxkaXYgY2xhc3M9ImRyYXdlci1vdmVybGF5IiBkYXRhLWRy
YXdlci1jbG9zZSB0YWJpbmRleD0iLTEiPjwvZGl2PgoJCTxkaXYgY2xhc3M9ImRyYXdlci13cmFw
cGVyIj4KCQkJPGRpdiBjbGFzcz0iZHJhd2VyLWNvbnRlbnQiPgoJCQkJPGRpdiBjbGFzcz0ibGlz
dC1ncm91cCI+CgkJCQkJCgkJCQkJCTxhIGhyZWY9IiMiIGNsYXNzPSJsaXN0LWdyb3VwLWl0ZW0g
ZGlzYWJsZWQiIHRpdGxlPSJTaW5nbGUiPgoJCQkJCQkJCgkJCQkJCQkJPGkgY2xhc3M9ImZhIGZh
LWNvbW1lbnQiPjwvaT4KCQkJCQkJCVNpbmdsZQoJCQkJCQk8L2E+CgkJCQkJCgkJCQkJCgkJCQkJ
CQoJCQkJCQkKCQkJCQkJCTxhIGNsYXNzPSJsaXN0LWdyb3VwLWl0ZW0iIHRpdGxlPSJNZXNzYWdl
cyIgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZXM/bXNnbnVtPTIyNTQ0MCI+CgkJCQkJCQkJCgkJCQkJCQkJCTxpIGNsYXNzPSJm
YSBmYS1jb21tZW50cyI+PC9pPgoJCQkJCQkJCU1lc3NhZ2VzCgkJCQkJCQk8L2E+CgkJCQkJCQoJ
CQkJCQoJCQkJCQkKCQkJCQkJCgkJCQkJCQk8YSBjbGFzcz0ibGlzdC1ncm91cC1pdGVtIiB0aXRs
ZT0iVG9waWNzIiBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS90b3BpY3M/dGhyZWFkaWQ9MTE2MDA5Nzg1Ij4KCQkJCQkJCQkKCQkJCQkJCQkJ
PGkgY2xhc3M9ImZhIGZhLWluYm94Ij48L2k+CgkJCQkJCQkJVG9waWNzCgkJCQkJCQk8L2E+CgkJ
CQkJCQoJCQkJCQoJCQkJCQkKCQkJCQkJCgkJCQkJCQk8YSBjbGFzcz0ibGlzdC1ncm91cC1pdGVt
IiB0aXRsZT0iRXhwYW5kZWQiIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2VzP2V4cGFuZGVkPTEmYW1wO21zZ251bT0yMjU0NDAi
PgoJCQkJCQkJCQoJCQkJCQkJCQk8aSBjbGFzcz0iZmEgZmEtY29tbWVudHMiPjwvaT4KCQkJCQkJ
CQlFeHBhbmRlZAoJCQkJCQkJPC9hPgoJCQkJCQkKCQkJCQkKCQkJCTwvZGl2PgoJCQk8L2Rpdj4K
CQk8L2Rpdj4KCTwvc2VjdGlvbj4KPHNjcmlwdD4KZnVuY3Rpb24gbW9kYWxtZXNzYWdlcyh0YXJn
ZXQpIHsKCWRyYXdlciA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdtZXNzYWdlcy1kcmF3ZXIn
KTsKCWlmIChkcmF3ZXIgIT0gbnVsbCkgewoJCWRyYXdlck9iai5jbG9zZURyYXdlcihkcmF3ZXIp
OwoJfQoJLy8kKHRhcmdldCkubW9kYWwoJ3Nob3cnKTsKfQo8L3NjcmlwdD4KCgkJCQkJCgoJCQkJ
CQoJCQkJPC9kaXY+CgkJCTwvZm9ybT4KCQk8L2Rpdj4KCQk8ZGl2IGNsYXNzPSJoaWRkZW4teHMg
Y29sLXNtLTcgY29sLW1kLTcgbmFycm93LXBhZGRpbmciPgoJCQk8Zm9ybSBjbGFzcz0iZm9ybS1p
bmxpbmUiIG1ldGhvZD0iZ2V0IiBhY3Rpb249Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2VzIj4KCQkJCTxkaXYgY2xhc3M9InB1bGwtcmln
aHQgaGlkZGVuLXhzIj4KCQkJCQk8ZGl2IGNsYXNzPSJmb3JtLWdyb3VwIGhpZGRlbi14cyI+CgkJ
CQkJCTxpbnB1dCB0eXBlPSJ0ZXh0IiBjbGFzcz0iZm9ybS1jb250cm9sIiBzdHlsZT0iZGlzcGxh
eTppbmxpbmU7IGhlaWdodDozNXB4OyIgc2l6ZT0iOCIgcGxhY2Vob2xkZXI9Ik1zZyAjIiB0aXRs
ZT0iTXNnICMiIG5hbWU9Im1zZ251bSIgdmFsdWU9IiI+CgkJCQkJPC9kaXY+CgkJCQkJCgkJCQkJ
CTx1bCBjbGFzcz0icGFnaW5hdGlvbiBmb3JtLWdyb3VwIiBzdHlsZT0ibWFyZ2luOjAiPgoJCQkJ
CQkJCgkJCQkJCQkJPGxpPgoJCQkJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyNTQzOSI+CgkJCQkJCQkJCQk8
aSBjbGFzcz0iZmEgZmEtY2hldnJvbi1sZWZ0Ij4KCQkJCQkJCQkJCQk8c3BhbiBjbGFzcz0ic3It
b25seSI+CgkJCQkJCQkJCQkJCXByZXZpb3VzIHBhZ2UKCQkJCQkJCQkJCQk8L3NwYW4+CgkJCQkJ
CQkJCQk8L2k+CgkJCQkJCQkJCTwvYT4KCQkJCQkJCQk8L2xpPgoJCQkJCQkJCgkJCQkJCQk8bGkg
Y2xhc3M9ImRpc2FibGVkIj4KCQkJCQkJCQk8YSBocmVmPSJqYXZhc2NyaXB0OnZvaWQoMCkiPgoJ
CQkJCQkJCQkjMjI1NDQwCgkJCQkJCQkJPC9hPgoJCQkJCQkJPC9saT4KCQkJCQkJCQoJCQkJCQkJ
CTxsaT4KCQkJCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjU0NDEiPgoJCQkJCQkJCQkJPGkgY2xhc3M9ImZh
IGZhLWNoZXZyb24tcmlnaHQiPgoJCQkJCQkJCQkJCTxzcGFuIGNsYXNzPSJzci1vbmx5Ij4KCQkJ
CQkJCQkJCQkJbmV4dCBwYWdlCgkJCQkJCQkJCQkJPC9zcGFuPgoJCQkJCQkJCQkJPC9pPgoJCQkJ
CQkJCQk8L2E+CgkJCQkJCQkJPC9saT4KCQkJCQkJCQoJCQkJCQk8L3VsPgoJCQkJCQoJCQkJPC9k
aXY+CgkJPC9mb3JtPgoJCTwvZGl2PgoJPC9kaXY+CgoJCgkJPGRpdj4KCQkJPGg0PgoJCQkJCgkJ
CQkKCQkJCVtQQVRDSCB2Ml0gcG9wdWxhdGVfc2RrX2V4dDogaW5jbHVkZSBpbWFnZSBTUERYIHRh
c2tzIGluIGxvY2tlZCBzaWduYXR1cmVzCgkJCQkKCQkJCQoJCQk8L2g0PgoJCTwvZGl2PgoJCTx0
YWJsZSBjbGFzcz0idGFibGUgdGFibGUtY29uZGVuc2VkIHRhYmxlLXN0cmlwZWQgdGFibGUtZml4
ZWQiPgoJCQk8dGJvZHk+CgkJCQk8dHI+PC90cj4KCQkJCQoJPHRyIGNsYXNzPSJiYWNrZ3JvdW5k
LWNvbG9yIiA+CgkJPHRkIHN0eWxlPSJwYWRkaW5nLWxlZnQ6MHB4O3BhZGRpbmctcmlnaHQ6MHB4
O3BhZGRpbmctYm90dG9tOjBweDtib3JkZXI6MHB4OyI+CgkJCTxkaXYgY2xhc3M9InRhYmxlLWJh
Y2tncm91bmQtY29sb3IgZXhwYW5kZWQtbWVzc2FnZSI+CgkJCQoJCQk8aHIgY2xhc3M9InNyLW9u
bHkiPgoJCQk8YSBuYW1lPSJtc2cyMjU0NDAiIGlkPSJtc2cyMjU0NDAiPjwvYT4KCQkJCgkJCTxk
aXYgY2xhc3M9InJvdyI+CgkJCQk8ZGl2IGNsYXNzPSJjb2wtbWQtMTIiPgoJCQkJCTxkaXYgY2xh
c3M9InB1bGwtbGVmdCI+CgoJCQkJCQkKCQkJCQkJCTxkaXYgY2xhc3M9ImRyb3Bkb3duIj4KCQkJ
CQkJCQk8YSBjbGFzcz0iZHJvcGRvd24tdG9nZ2xlIiBocmVmPSIjIiByb2xlPSJidXR0b24iIGlk
PSJkcm9wZG93bk1lbnUyNTg3ODI5NTAiIGRhdGEtdG9nZ2xlPSJkcm9wZG93biIgYXJpYS1oYXNw
b3B1cD0idHJ1ZSIgYXJpYS1leHBhbmRlZD0iZmFsc2UiPgoJCQkJCQkJCQkKCQkJCQkJCQkJCTxz
cGFuIHN0eWxlPSJkaXNwbGF5OiBmbGV4O2FsaWduLWl0ZW1zOiBjZW50ZXI7Ij4KCQkJCQkJCQkJ
CQk8aSBjbGFzcz0iZmEgZmEtdXNlciIgc3R5bGU9ImZvbnQtc2l6ZTo0MHB4OyBwYWRkaW5nLXJp
Z2h0OjJweDsgcGFkZGluZy1sZWZ0OjJweDsiPjwvaT4KCQkJCQkJCQkJCQkKCQkJCQkJCQkJCQkJ
PHU+SmF5YXN1cnlhIE1hZ2FudXJ1PC91PgoJCQkJCQkJCQkJCQoJCQkJCQkJCQkJCTxzcGFuIGNs
YXNzPSJjYXJldCI+PC9zcGFuPgoJCQkJCQkJCQkJPC9zcGFuPgoJCQkJCQkJCQkKCQkJCQkJCQk8
L2E+CgkJCQkJCQkJPHVsIGNsYXNzPSJkcm9wZG93bi1tZW51IiBhcmlhLWxhYmVsbGVkYnk9ImRy
b3Bkb3duTWVudTI1ODc4Mjk1MCI+CgkJCQkJCQkJCQoJCQkJCQkJCQkKCQkJCQkJCQkJCQoJCQkJ
CQkJCQkJPGxpPgoJCQkJCQkJCQkJCTxhIHJlbD0ibm9mb2xsb3ciIGhyZWY9Imh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3NlYXJjaD9xPXBvc3Rlcmlk
Ojk5NDg3MDEiPgoJCQkJCQkJCQkJCQk8aSBjbGFzcz0iZmEtZncgZmEgZmEtY29tbWVudHMiPjwv
aT4KCQkJCQkJCQkJCQkJQWxsIE1lc3NhZ2VzIEJ5IFRoaXMgTWVtYmVyCgkJCQkJCQkJCQkJPC9h
PgoJCQkJCQkJCQkJPC9saT4KCQkJCQkJCQkJCgkJCQkJCQkJPC91bD4KCQkJCQkJCTwvZGl2PgoJ
CQkJCQkKCQkJCQk8L2Rpdj4KCQkJCQk8ZGl2IGNsYXNzPSJwdWxsLXJpZ2h0IiBzdHlsZT0idGV4
dC1hbGlnbjogcmlnaHQ7Ij4KCQkJCQkJPGZvbnQgc2l6ZT0iLTEiIGNsYXNzPSJ0ZXh0LW11dGVk
Ij4KCQkJCQkJCQo8c2NyaXB0IGlkPSJ0aW1lZGlzcG1zZzI1ODc4Mjk1MCI+CgkkKCcjdGltZWRp
c3Btc2cyNTg3ODI5NTAnKS5yZXBsYWNlV2l0aChEaXNwbGF5U2hvcnRUaW1lKDE3NjE3MzI2NzM2
MDE3NjI4MTEsIGZhbHNlCgkJKSk7Cjwvc2NyaXB0PgoKCQkJCQkJPC9mb250PgoJCQkJCQkmbmJz
cDsKCQkJCQkJPGEgcmVsPSJub2ZvbGxvdyIgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjU0NDAiPgoJCQkJCQkJPHNwYW4g
Y2xhc3M9ImhpZGRlbi14cyI+CgkJCQkJCQkJIzIyNTQ0MCZuYnNwOyZuYnNwOwoJCQkJCQkJPC9z
cGFuPgoJCQkJCQkJPGkgY2xhc3M9ImZhIGZhLWxpbmsgZmEtbGciPjwvaT4KCQkJCQkJPC9hPgoJ
CQkJCQkKCQkJCQk8L2Rpdj4KCQkJCTwvZGl2PgoJCQk8L2Rpdj4KCQkJPGJyIC8+CgkJCTxkaXYg
aWQ9Im1zZ2JvZHkyNTg3ODI5NTAiIGNsYXNzPSJ1c2VyLWNvbnRlbnQiPgoJCQkJPGRpdiBjbGFz
cz0iZm9yY2VicmVhayIgZGlyPSJhdXRvIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlLXdyYXA7Ij5G
cm9tOiBKYXlhc3VyeWEgTWFnYW51cnUgJmx0O01hZ2FudXJ1LkpheWFzdXJ5YUAuLi4mZ3Q7PGJy
IC8+PGJyIC8+Rml4ZXMgW1lPQ1RPICMxNTcyNl08YnIgLz5GaXhlcyBbWU9DVE8gIzE1ODUzXTxi
ciAvPjxiciAvPkFmdGVyIHRoZSBzd2l0Y2ggdG8gU1BEWCAzLjAsIGVTREsgaW5zdGFsbGF0aW9u
IGNhbiBmYWlsIHdpdGggZXJyb3JzIGxpa2U6PGJyIC8+PGJyIC8+ICBnY2Mtc291cmNlLTEqOmRv
X2ZldGNoIGF0dGVtcHRlZCB0byBleGVjdXRlIHVuZXhwZWN0ZWRseTxiciAvPiAgVGhpcyBpcyB1
c3VhbGx5IGR1ZSB0byBtaXNzaW5nIHNldHNjZW5lIHRhc2tzLjxiciAvPjxiciAvPlRoaXMgaXMg
Y2F1c2VkIGJ5IGltYWdlLXJlbGF0ZWQgU1BEWCB0YXNrcywgc3VjaCBhcyBkb19jcmVhdGVfaW1h
Z2Vfc2JvbV9zcGR4LDxiciAvPmJlaW5nIGV4Y2x1ZGVkIGZyb20gdGhlIGxvY2tlZCBzaWduYXR1
cmVzLiBXaXRob3V0IHRoZXNlLCB0aGUgY29ycmVzcG9uZGluZzxiciAvPnNzdGF0ZS1jYWNoZSBh
cnRpZmFjdHMgYXJlIG1pc3NpbmcgZHVyaW5nIGVTREsgaW5zdGFsbGF0aW9uLjxiciAvPjxiciAv
PlByZXZpb3VzbHkgKHVuZGVyIFNQRFggMi4yKSwgdGhlc2UgaW1hZ2UgU1BEWC9TQk9NIHRhc2tz
IHdlcmUgbm90PGJyIC8+ZGVwZW5kZW5jaWVzIG9mIGRvX3BvcHVsYXRlX3Nka19leHQgdGFzaywg
c28gdGhlaXIgc3N0YXRlIGFydGlmYWN0czxiciAvPiB3ZXJlIG5vdCByZXF1aXJlZCBhdCBpbnN0
YWxsIHRpbWUuPGJyIC8+PGJyIC8+Rml4OjxiciAvPi0gQWRkZWQgYGRvX2NyZWF0ZV9pbWFnZV9z
Ym9tX3NwZHhgIGFzIGEgdGFzayBkZXBlbmRlbmN5IGJlZm9yZSBgZG9fc2RrX2RlcGVuZHNgPGJy
IC8+ICB0byBlbnN1cmUgU1BEWC9TQk9NIGRhdGEgZ2VuZXJhdGlvbiBpcyBpbnRlZ3JhdGVkIGlu
IHRoZSBlU0RLIGJ1aWxkIGZsb3cuPGJyIC8+LSBBZGp1c3RlZCBgcHJlcGFyZV9sb2NrZWRfY2Fj
aGUoKWAgdG8gcmV0YWluIFNES19UQVJHRVRTIChhbmQgdGhlaXIgbXVsdGlsaWI8YnIgLz4gIHZh
cmlhbnRzKSBpbiB0aGUgbG9ja2VkIHNpZ25hdHVyZXMgZmlsZSwgZW5zdXJpbmcgaW1hZ2UgU1BE
WC9TQk9NIHRhc2tzIGFyZTxiciAvPiAgcHJlc2VydmVkIGFuZCBub3QgZXhjbHVkZWQgZHVyaW5n
IGxvY2tlZC1zaWdzIGZpbHRlcmluZy48YnIgLz48YnIgLz5XaXRoIHRoaXMgZml4LCBlU0RLIGlu
c3RhbGxzIHdvcmsgd2l0aG91dCB1bmV4cGVjdGVkIHRhc2sgcnVucywgZXZlbjxiciAvPmZvciBj
dXN0b20gZGlzdHJvcyBvciAmIzM0O3RhciYjMzQ7IGltYWdlcy48YnIgLz48YnIgLz5TaWduZWQt
b2ZmLWJ5OiBKYXlhc3VyeWEgTWFnYW51cnUgJmx0O01hZ2FudXJ1LkpheWFzdXJ5YUAuLi4mZ3Q7
PGJyIC8+LS0tPGJyIC8+djI6IE1vdmVkIGFkZGl0aW9uIG9mIGRvX2NyZWF0ZV9pbWFnZV9zYm9t
X3NwZHggZnJvbSBwb3B1bGF0ZV9zZGtfZXh0LmJiY2xhc3MgdG8gY3JlYXRlLXNwZHgtc2RrLTMu
MC5iYmNsYXNzPGJyIC8+PGJyIC8+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvY3JlYXRlLXNwZHgtc2Rr
LTMuMC5iYmNsYXNzIHwgMSArPGJyIC8+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvcG9wdWxhdGVfc2Rr
X2V4dC5iYmNsYXNzICAgIHwgOSArKysrKysrKys8YnIgLz4gMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspPGJyIC8+PGJyIC8+ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUv
Y3JlYXRlLXNwZHgtc2RrLTMuMC5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9jcmVhdGUt
c3BkeC1zZGstMy4wLmJiY2xhc3M8YnIgLz5pbmRleCBlNWYyMjBjZGZhLi40ZmI2YjEyODNlIDEw
MDY0NDxiciAvPi0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvY3JlYXRlLXNwZHgtc2RrLTMuMC5i
YmNsYXNzPGJyIC8+KysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9jcmVhdGUtc3BkeC1zZGstMy4w
LmJiY2xhc3M8YnIgLz5AQCAtMTgsNiArMTgsNyBAQCBkb19wb3B1bGF0ZV9zZGtfZXh0W3Bvc3Rm
dW5jc10gKz0gJiMzNDtzZGtfZXh0X2NyZWF0ZV9zYm9tJiMzNDs8YnIgLz4gZG9fcG9wdWxhdGVf
c2RrX2V4dFtmaWxlLWNoZWNrc3Vtc10gKz0gJiMzNDske1NQRFgzX0RFUF9GSUxFU30mIzM0Ozxi
ciAvPiBQT1BVTEFURV9TREtfUE9TVF9IT1NUX0NPTU1BTkQ6YXBwZW5kOnRhc2stcG9wdWxhdGUt
c2RrLWV4dCA9ICYjMzQ7IHNka19leHRfaG9zdF9jcmVhdGVfc3BkeCYjMzQ7PGJyIC8+IFBPUFVM
QVRFX1NES19QT1NUX1RBUkdFVF9DT01NQU5EOmFwcGVuZDp0YXNrLXBvcHVsYXRlLXNkay1leHQg
PSAmIzM0OyBzZGtfZXh0X3RhcmdldF9jcmVhdGVfc3BkeCYjMzQ7PGJyIC8+K2FkZHRhc2sgZG9f
Y3JlYXRlX2ltYWdlX3Nib21fc3BkeCBiZWZvcmUgZG9fc2RrX2RlcGVuZHM8YnIgLz4gPGJyIC8+
IHB5dGhvbiBzZGtfaG9zdF9jcmVhdGVfc3BkeCgpIHs8YnIgLz4gICAgIGZyb20gcGF0aGxpYiBp
bXBvcnQgUGF0aDxiciAvPmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL3BvcHVsYXRl
X3Nka19leHQuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvcG9wdWxhdGVfc2RrX2V4dC5i
YmNsYXNzPGJyIC8+aW5kZXggMjg1OTMyMGRkZi4uMjgzOGNhMWEwMyAxMDA2NDQ8YnIgLz4tLS0g
YS9tZXRhL2NsYXNzZXMtcmVjaXBlL3BvcHVsYXRlX3Nka19leHQuYmJjbGFzczxiciAvPisrKyBi
L21ldGEvY2xhc3Nlcy1yZWNpcGUvcG9wdWxhdGVfc2RrX2V4dC5iYmNsYXNzPGJyIC8+QEAgLTQ2
MCw2ICs0NjAsMTUgQEAgZGVmIHByZXBhcmVfbG9ja2VkX2NhY2hlKGQsIGJhc2VvdXRwYXRoLCBk
ZXJpdmF0aXZlLCBjb25mX2luaXRwYXRoKTo8YnIgLz4gPGJyIC8+ICAgICAjIEZpbHRlciB0aGUg
bG9ja2VkIHNpZ25hdHVyZXMgZmlsZSB0byBqdXN0IHRoZSBzc3RhdGUgdGFza3Mgd2UgYXJlIGlu
dGVyZXN0ZWQgaW48YnIgLz4gICAgIGV4Y2x1ZGVkX3RhcmdldHMgPSBnZXRfc2RrX2luc3RhbGxf
dGFyZ2V0cyhkLCBpbWFnZXNfb25seT1UcnVlKTxiciAvPisgICAgc2RrX3RhcmdldHMgPSBkLmdl
dFZhcigmIzM5O1NES19UQVJHRVRTJiMzOTspPGJyIC8+KyAgICBleHRfc2RrX3RhcmdldF9zZXQg
PSBzZXQobXVsdGlsaWJfcGtnX2V4dGVuZChkLCBzZGtfdGFyZ2V0cykuc3BsaXQoKSk8YnIgLz4r
ICAgIGV4Y2x1ZGVkX3NldCA9IHNldChleGNsdWRlZF90YXJnZXRzLnNwbGl0KCkpPGJyIC8+Kzxi
ciAvPisgICAgIyBFbnN1cmUgU0RLX1RBUkdFVFMgYW5kIHRoZWlyIGltYWdlIFNQRFgvU0JPTSB0
YXNrcyBhcmUgaW5jbHVkZWQgaW4gdGhlIGxvY2tlZCBzaWduYXR1cmVzLDxiciAvPisgICAgIyBh
cyB0aGV5IGFyZSByZXF1aXJlZCBkdXJpbmcgZVNESyBpbnN0YWxsYXRpb24uPGJyIC8+KyAgICBm
aWx0ZXJlZF9leGNsdWRlZF9zZXQgPSBleGNsdWRlZF9zZXQgLSBleHRfc2RrX3RhcmdldF9zZXQ8
YnIgLz4rICAgIGV4Y2x1ZGVkX3RhcmdldHMgPSAmIzM5OyAmIzM5Oy5qb2luKGZpbHRlcmVkX2V4
Y2x1ZGVkX3NldCk8YnIgLz4rPGJyIC8+ICAgICBzaWdmaWxlID0gZC5nZXRWYXIoJiMzOTtXT1JL
RElSJiMzOTspICsgJiMzOTsvbG9ja2VkLXNpZ3MuaW5jJiMzOTs8YnIgLz4gICAgIGxvY2tlZHNp
Z3NfcHJ1bmVkID0gYmFzZW91dHBhdGggKyAmIzM5Oy9jb25mL2xvY2tlZC1zaWdzLmluYyYjMzk7
PGJyIC8+ICAgICAjbmF0aXZlc2RrLW9ubHkgc2lnZmlsZSB0byBtZXJnZSBpbnRvIGxvY2tlZC1z
aWdzLmluYzxiciAvPi0tIDxiciAvPjIuNDkuMDwvZGl2PgoJCQkJCgkJCQkKCQkJCQoJCQk8L2Rp
dj4KCQkJCgkJCTxwPjwvcD4KCQoKCQoJCQk8ZGl2IGNsYXNzPSJ0YWJsZS1oaWdobGlnaHQtYmFj
a2dyb3VuZC1jb2xvciIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi0xMHB4O21hcmdpbi1yaWdodDotMTBw
eDttYXJnaW4tYm90dG9tOi0xMHB4O3BhZGRpbmctbGVmdDoxMHB4O3BhZGRpbmctcmlnaHQ6MTBw
eDtwYWRkaW5nLXRvcDo0cHg7cGFkZGluZy1ib3R0b206MnB4O2JvcmRlci1ib3R0b20tbGVmdC1y
YWRpdXM6NHB4O2JvcmRlci1ib3R0b20tcmlnaHQtcmFkaXVzOjRweDsiPgoJCQk8ZGl2IGNsYXNz
PSJyb3ciPgoJCQkJCgkJCQkJPGRpdiBjbGFzcz0iY29sLXhzLTgiPjwvZGl2PgoJCQkJCgkJCQkK
CQkJPC9kaXY+CgkJCTxkaXYgY2xhc3M9InJvdyI+CgkJCQk8ZGl2IGNsYXNzPSJjb2wteHMtMTIi
PgoJCQkJCTxkaXYgaWQ9Imxpa2VzdGF0czI1ODc4Mjk1MCI+PC9kaXY+CgkJCQk8L2Rpdj4KCQkJ
PC9kaXY+CgkJCQoJCQkKCQkJPC9kaXY+CgkJCTwvZGl2Pgo8c2NyaXB0Pgpjb250ZW50TG9hZGVk
KGZhbHNlLCBmdW5jdGlvbigpIHsKCQoJCgkKCQlkaXNwbGF5TGlrZVN0YXRzKCIvZy9vcGVuZW1i
ZWRkZWQtY29yZSIsIDAsIDI1ODc4Mjk1MCwgZmFsc2UpCgkKfSk7CgkJZnVuY3Rpb24gcmVwbHlU
b0NoYW5nZTI1ODc4Mjk1MChlbGVtZW50KSB7CgkJCXZhciB2YWx1ZSA9IGVsZW1lbnQudmFsdWU7
CgkJCWlmICh2YWx1ZSA9PSAiMSIpIHsKCQkJCXN1YmogPSAkKCcjc3ViamVjdDI1ODc4Mjk1MCcp
LnZhbCgpOwoJCQkJJCgnI3N1YmplY3QyNTg3ODI5NTAnKS52YWwoJ1ByaXZhdGU6ICcgKyBzdWJq
KTsKCQkJCSQoJyNiY2NtZTI1ODc4Mjk1MCcpLnNob3coKTsKCQkJfSBlbHNlIGlmICh2YWx1ZSA9
PSAiMiIpIHsKCQkJCXN1YmogPSAkKCcjc3ViamVjdDI1ODc4Mjk1MCcpLnZhbCgpOwoJCQkJJCgn
I3N1YmplY3QyNTg3ODI5NTAnKS52YWwoc3Viai5yZXBsYWNlKCdQcml2YXRlOiAnLCAnJykpOwoJ
CQkJJCgnI2JjY21lMjU4NzgyOTUwJykuc2hvdygpOwoJCQl9IGVsc2UgewoJCQkJc3ViaiA9ICQo
JyNzdWJqZWN0MjU4NzgyOTUwJykudmFsKCk7CgkJCQkkKCcjc3ViamVjdDI1ODc4Mjk1MCcpLnZh
bChzdWJqLnJlcGxhY2UoJ1ByaXZhdGU6ICcsICcnKSk7CgkJCQkkKCcjYmNjbWUyNTg3ODI5NTAn
KS5oaWRlKCk7CgkJCX0KCQkJaWYgKHRpbnlNQ0UuZ2V0KCdlZGl0b3IyNTg3ODI5NTAnKSAhPSBu
dWxsKSB7CgkJCQl0aW55TUNFLmdldCgnZWRpdG9yMjU4NzgyOTUwJykuZm9jdXMoKTsKCQkJfQoJ
CX0KCgkJZnVuY3Rpb24gc2V0Rm9jdXMyNTg3ODI5NTAoKSB7CgkJCXRpbnlNQ0UuYWN0aXZlRWRp
dG9yLmZvY3VzKCk7CgkJfQoKPC9zY3JpcHQ+CgkJPC90ZD4KCTwvdHI+CgoKCQkJPC90Ym9keT4K
CQk8L3RhYmxlPgkJCQkJCgkJCgk8IS0tIFZpZGVvIE1vZGFsIC0tPgoJPGRpdiBjbGFzcz0ibW9k
YWwgZmFkZSIgaWQ9InZpZGVvTW9kYWwiIHRhYmluZGV4PSItMSIgcm9sZT0iZGlhbG9nIiBhcmlh
LWxhYmVsbGVkYnk9InZpZGVvTW9kYWxMYWJlbCI+CgkJPGRpdiBjbGFzcz0ibW9kYWwtZGlhbG9n
IiByb2xlPSJkb2N1bWVudCIgc3R5bGU9IndpZHRoOjgwdnc7IGhlaWdodDo4MHZoO21hcmdpbi1s
ZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Ij4KCQkJPGRpdiBjbGFzcz0ibW9kYWwtY29udGVu
dCI+CgkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1oZWFkZXIiPgoJCQkJCTxidXR0b24gdHlwZT0iYnV0
dG9uIiBjbGFzcz0iY2xvc2UiIGRhdGEtZGlzbWlzcz0ibW9kYWwiIGFyaWEtbGFiZWw9IkNsb3Nl
Ij48c3BhbiBhcmlhLWhpZGRlbj0idHJ1ZSI+JnRpbWVzOzwvc3Bhbj48L2J1dHRvbj4KCQkJCTwv
ZGl2PgoJCQkJPGRpdiBjbGFzcz0ibW9kYWwtYm9keSIgaWQ9InZpZGVvTW9kYWxCb2R5Ij4KCQkJ
CTwvZGl2PgoJCQk8L2Rpdj4KCQk8L2Rpdj4KCTwvZGl2PgoKCTwhLS0gSW1hZ2UgTGlnaHRib3gg
TW9kYWwgLS0+Cgk8ZGl2IGNsYXNzPSJtb2RhbCBmYWRlIiBpZD0iaW1hZ2VMaWdodGJveCIgdGFi
aW5kZXg9Ii0xIiByb2xlPSJkaWFsb2ciIGFyaWEtbGFiZWxsZWRieT0iaW1hZ2VMaWdodGJveExh
YmVsIj4KCQk8ZGl2IGNsYXNzPSJtb2RhbC1kaWFsb2cgbW9kYWwtbGciIHJvbGU9ImRvY3VtZW50
Ij4KCQkJPGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CgkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1o
ZWFkZXIiPgoJCQkJCTxidXR0b24gdHlwZT0iYnV0dG9uIiBjbGFzcz0iY2xvc2UiIGRhdGEtZGlz
bWlzcz0ibW9kYWwiIGFyaWEtbGFiZWw9IkNsb3NlIj4KCQkJCQkJPHNwYW4gYXJpYS1oaWRkZW49
InRydWUiPiZ0aW1lczs8L3NwYW4+CgkJCQkJPC9idXR0b24+CgkJCQkJPGg0IGNsYXNzPSJtb2Rh
bC10aXRsZSIgaWQ9ImltYWdlTGlnaHRib3hMYWJlbCI+PC9oND4KCQkJCTwvZGl2PgoJCQkJPGRp
diBjbGFzcz0ibW9kYWwtYm9keSIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyBwb3NpdGlvbjpy
ZWxhdGl2ZTsiPgoJCQkJCTxpbWcgaWQ9ImxpZ2h0Ym94SW1hZ2UiIHNyYz0iIiBzdHlsZT0ibWF4
LXdpZHRoOjEwMCU7IG1heC1oZWlnaHQ6NzB2aDsiIGFsdD0iIj4KCQkJCQk8IS0tIE5hdmlnYXRp
b24gYnV0dG9ucyAtLT4KCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgaWQ9ImxpZ2h0Ym94UHJl
diIgY2xhc3M9ImJ0biBidG4tZGVmYXVsdCBsaWdodGJveC1uYXYgbGlnaHRib3gtbmF2LXByZXYi
IHN0eWxlPSJkaXNwbGF5Om5vbmU7Ij4KCQkJCQkJPGkgY2xhc3M9ImZhIGZhLWNoZXZyb24tbGVm
dCI+PC9pPgoJCQkJCTwvYnV0dG9uPgoJCQkJCTxidXR0b24gdHlwZT0iYnV0dG9uIiBpZD0ibGln
aHRib3hOZXh0IiBjbGFzcz0iYnRuIGJ0bi1kZWZhdWx0IGxpZ2h0Ym94LW5hdiBsaWdodGJveC1u
YXYtbmV4dCIgc3R5bGU9ImRpc3BsYXk6bm9uZTsiPgoJCQkJCQk8aSBjbGFzcz0iZmEgZmEtY2hl
dnJvbi1yaWdodCI+PC9pPgoJCQkJCTwvYnV0dG9uPgoJCQkJCTxkaXYgaWQ9ImxpZ2h0Ym94VGV4
dENvbnRlbnQiIHN0eWxlPSJkaXNwbGF5Om5vbmU7IHRleHQtYWxpZ246bGVmdDsgbWF4LWhlaWdo
dDo3MHZoOyBvdmVyZmxvdzphdXRvOyB3aGl0ZS1zcGFjZTpwcmUtd3JhcDsgZm9udC1mYW1pbHk6
bW9ub3NwYWNlOyBiYWNrZ3JvdW5kOiNmNWY1ZjU7IHBhZGRpbmc6MTVweDsiPjwvZGl2PgoJCQkJ
PC9kaXY+CgkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1mb290ZXIiPgoJCQkJCTxzcGFuIGlkPSJsaWdo
dGJveENvdW50ZXIiIGNsYXNzPSJwdWxsLWxlZnQiIHN0eWxlPSJsaW5lLWhlaWdodDozNHB4O3Bh
ZGRpbmctcmlnaHQ6MjBweDsiPjwvc3Bhbj4KCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgaWQ9
ImxpZ2h0Ym94RG93bmxvYWQiIGNsYXNzPSJidG4gYnRuLXByaW1hcnkiPgoJCQkJCQk8aSBjbGFz
cz0iZmEgZmEtZG93bmxvYWQiPjwvaT4gRG93bmxvYWQKCQkJCQk8L2J1dHRvbj4KCQkJCQk8YnV0
dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4tZGVmYXVsdCIgZGF0YS1kaXNtaXNzPSJt
b2RhbCI+Q2xvc2U8L2J1dHRvbj4KCQkJCTwvZGl2PgoJCQk8L2Rpdj4KCQk8L2Rpdj4KCTwvZGl2
PgoJPHNjcmlwdD4KCnZpZGVvanMucmVnaXN0ZXJQbHVnaW4oJ29yaWVudGF0aW9uSGFuZGxlcics
IGZ1bmN0aW9uKCkgewogICAgdGhpcy5vbignbG9hZGVkbWV0YWRhdGEnLCBmdW5jdGlvbigpIHsK
ICAgICAgICBjb25zdCBwbGF5ZXIgPSB0aGlzOwogICAgICAgIGNvbnN0IHZpZGVvID0gdGhpcy50
ZWNoKCkuZWwoKTsKICAgICAgICBjb25zb2xlLmxvZygiSW4gbG9hZGVkbWV0YWRhdGEiKTsKCiAg
ICAgICAgLy8gRnVuY3Rpb24gdG8gaGFuZGxlIHJvdGF0aW9uCiAgICAgICAgY29uc3Qgcm90YXRl
VmlkZW8gPSAoZGVncmVlcykgPT4gewogICAgICAgICAgICBjb25zb2xlLmxvZyhgUm90YXRpbmcg
dmlkZW8gYnkgJHtkZWdyZWVzfSBkZWdyZWVzYCk7CiAgICAgICAgICAgIAogICAgICAgICAgICAv
LyBDbGVhciBhbnkgZXhpc3RpbmcgdHJhbnNmb3JtcyBmaXJzdAogICAgICAgICAgICB2aWRlby5z
dHlsZS50cmFuc2Zvcm0gPSAnJzsKICAgICAgICAgICAgCiAgICAgICAgICAgIGlmIChkZWdyZWVz
ICE9PSAwKSB7CiAgICAgICAgICAgICAgICB2aWRlby5zdHlsZS50cmFuc2Zvcm0gPSBgcm90YXRl
KCR7ZGVncmVlc31kZWcpYDsKICAgICAgICAgICAgICAgIGNvbnN0IHBvc3RlckVsID0gcGxheWVy
LmVsKCkucXVlcnlTZWxlY3RvcignLnZqcy1wb3N0ZXInKTsKICAgICAgICAgICAgICAgIGlmIChw
b3N0ZXJFbCkgewogICAgICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKCJyb3RhdGluZyBwb3N0
ZXIiKTsKICAgICAgICAgICAgICAgICAgICBwb3N0ZXJFbC5zdHlsZS50cmFuc2Zvcm0gPSBgcm90
YXRlKCR7ZGVncmVlc31kZWcpYDsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQogICAg
ICAgIH07CgogICAgICAgIC8vIENoZWNrIHZpZGVvIGRpbWVuc2lvbnMgYW5kIGFueSBleGlzdGlu
ZyB0cmFuc2Zvcm0KICAgICAgICBjb25zdCB2aWRlb1JhdGlvID0gdmlkZW8udmlkZW9XaWR0aCAv
IHZpZGVvLnZpZGVvSGVpZ2h0OwogICAgICAgIGNvbnN0IGN1cnJlbnRUcmFuc2Zvcm0gPSB2aWRl
by5zdHlsZS50cmFuc2Zvcm0gfHwgJyc7CiAgICAgICAgY29uc29sZS5sb2coIlZpZGVvIGRpbWVu
c2lvbnM6IiwgdmlkZW8udmlkZW9XaWR0aCwgIngiLCB2aWRlby52aWRlb0hlaWdodCk7CiAgICAg
ICAgY29uc29sZS5sb2coIlZpZGVvIHJhdGlvOiIsIHZpZGVvUmF0aW8pOwogICAgICAgIGNvbnNv
bGUubG9nKCJDdXJyZW50IHRyYW5zZm9ybToiLCBjdXJyZW50VHJhbnNmb3JtKTsKCiAgICAgICAg
Ly8gVHJ5IHRvIGRldGVjdCByb3RhdGlvbiBtZXRhZGF0YSBmcm9tIHZpZGVvIGVsZW1lbnQKICAg
ICAgICBsZXQgaGFzTWV0YWRhdGFSb3RhdGlvbiA9IGZhbHNlOwogICAgICAgIHRyeSB7CiAgICAg
ICAgICAgIGlmICh2aWRlby52aWRlb1RyYWNrcyAmJiB2aWRlby52aWRlb1RyYWNrc1swXSkgewog
ICAgICAgICAgICAgICAgaGFzTWV0YWRhdGFSb3RhdGlvbiA9ICEhdmlkZW8udmlkZW9UcmFja3Nb
MF0ucm90YXRpb247CiAgICAgICAgICAgICAgICBjb25zb2xlLmxvZygiSGFzIG1ldGFkYXRhIHJv
dGF0aW9uOiIsIGhhc01ldGFkYXRhUm90YXRpb24pOwogICAgICAgICAgICB9CiAgICAgICAgfSBj
YXRjaCAoZSkgewogICAgICAgICAgICBjb25zb2xlLmxvZygiRXJyb3IgY2hlY2tpbmcgdmlkZW8g
dHJhY2tzOiIsIGUpOwogICAgICAgIH0KCiAgICAgICAgLy8gRnVuY3Rpb24gdG8gY2hlY2sgaWYg
dmlkZW8gbmVlZHMgcm90YXRpb24KICAgICAgICBjb25zdCBuZWVkc1JvdGF0aW9uID0gKCkgPT4g
ewogICAgICAgICAgICBpZiAodmlkZW9SYXRpbyA8IDEpIHsgIC8vIFBvcnRyYWl0IHZpZGVvCiAg
ICAgICAgICAgICAgICAvLyBJZiBpdCBoYXMgYW4gZXhpc3Rpbmcgcm90YXRpb24gdHJhbnNmb3Jt
LCBpdCdzIHByb2JhYmx5IEhFVkMKICAgICAgICAgICAgICAgIGlmIChjdXJyZW50VHJhbnNmb3Jt
LmluY2x1ZGVzKCdyb3RhdGUnKSkgewogICAgICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKCJW
aWRlbyBoYXMgZXhpc3Rpbmcgcm90YXRpb24gdHJhbnNmb3JtIik7CiAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgCiAgICAg
ICAgICAgICAgICAvLyBJZiBpdCBoYXMgcm90YXRpb24gbWV0YWRhdGEsIGJyb3dzZXIgbWlnaHQg
aGFuZGxlIGl0CiAgICAgICAgICAgICAgICBpZiAoaGFzTWV0YWRhdGFSb3RhdGlvbikgewogICAg
ICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKCJWaWRlbyBoYXMgcm90YXRpb24gbWV0YWRhdGEi
KTsKICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgICAgICAgICAgICB9Cgog
ICAgICAgICAgICAgICAgLy8gTGV0J3MgcGxheSBhIGZyYW1lIGFuZCBjaGVjayB0aGUgYWN0dWFs
IHJlbmRlcmVkIHNpemUKICAgICAgICAgICAgICAgIGNvbnN0IHZpZGVvRWwgPSBwbGF5ZXIuZWwo
KS5xdWVyeVNlbGVjdG9yKCd2aWRlbycpOwogICAgICAgICAgICAgICAgY29uc3QgcmVuZGVyZWRS
YXRpbyA9IHZpZGVvRWwub2Zmc2V0V2lkdGggLyB2aWRlb0VsLm9mZnNldEhlaWdodDsKICAgICAg
ICAgICAgICAgIGNvbnNvbGUubG9nKCJSZW5kZXJlZCByYXRpbzoiLCByZW5kZXJlZFJhdGlvKTsK
CiAgICAgICAgICAgICAgICAvLyBJZiByZW5kZXJlZCByYXRpbyBpcyBzaWduaWZpY2FudGx5IGRp
ZmZlcmVudCBmcm9tIHZpZGVvIHJhdGlvLAogICAgICAgICAgICAgICAgLy8gYnJvd3NlciBtaWdo
dCBiZSBoYW5kbGluZyByb3RhdGlvbgogICAgICAgICAgICAgICAgaWYgKE1hdGguYWJzKHJlbmRl
cmVkUmF0aW8gLSB2aWRlb1JhdGlvKSA8IDAuMSkgewogICAgICAgICAgICAgICAgICAgIGNvbnNv
bGUubG9nKCJWaWRlbyBuZWVkcyByb3RhdGlvbiBiYXNlZCBvbiByZW5kZXJlZCBkaW1lbnNpb25z
Iik7CiAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7CiAgICAgICAgICAgICAgICB9CiAg
ICAgICAgICAgIH0KICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgICAgIH07CgogICAgICAg
IC8vIENoZWNrIGlmIHJvdGF0aW9uIGlzIG5lZWRlZAogICAgICAgIGlmIChuZWVkc1JvdGF0aW9u
KCkpIHsKICAgICAgICAgICAgY29uc29sZS5sb2coIkFwcGx5aW5nIHJvdGF0aW9uIik7CiAgICAg
ICAgICAgIHJvdGF0ZVZpZGVvKDE4MCk7CiAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgY29u
c29sZS5sb2coIk5vIHJvdGF0aW9uIG5lZWRlZCIpOwogICAgICAgIH0KCiAgICAgICAgLy8gQWRk
IHJvdGF0aW9uIHRvZ2dsZSBidXR0b24gZm9yIG1hbnVhbCBvdmVycmlkZQogICAgICAgIGNvbnN0
IEJ1dHRvbiA9IHZpZGVvanMuZ2V0Q29tcG9uZW50KCdCdXR0b24nKTsKICAgICAgICAKICAgICAg
ICBjbGFzcyBSb3RhdGVCdXR0b24gZXh0ZW5kcyBCdXR0b24gewogICAgICAgICAgICBjb25zdHJ1
Y3RvcihwbGF5ZXIsIG9wdGlvbnMpIHsKICAgICAgICAgICAgICAgIHN1cGVyKHBsYXllciwgb3B0
aW9ucyk7CiAgICAgICAgICAgICAgICB0aGlzLmVsKCkuaW5uZXJIVE1MID0gJzxzcGFuIGNsYXNz
PSJzci1vbmx5Ij5Sb3RhdGU8L3NwYW4+PGkgY2xhc3M9ImZhcyBmYS1zeW5jIj48L2k+JzsKICAg
ICAgICAgICAgICAgIHRoaXMuY3VycmVudFJvdGF0aW9uID0gbmVlZHNSb3RhdGlvbigpID8gMTgw
IDogMDsKICAgICAgICAgICAgfQogICAgICAgICAgICAKICAgICAgICAgICAgaGFuZGxlQ2xpY2so
KSB7CiAgICAgICAgICAgICAgICB0aGlzLmN1cnJlbnRSb3RhdGlvbiA9ICh0aGlzLmN1cnJlbnRS
b3RhdGlvbiArIDE4MCkgJSAzNjA7CiAgICAgICAgICAgICAgICByb3RhdGVWaWRlbyh0aGlzLmN1
cnJlbnRSb3RhdGlvbik7CiAgICAgICAgICAgIH0KICAgICAgICB9CgogICAgICAgIC8vIFJlZ2lz
dGVyIGFuZCBhZGQgdGhlIHJvdGF0ZSBidXR0b24KICAgICAgICB2aWRlb2pzLnJlZ2lzdGVyQ29t
cG9uZW50KCdSb3RhdGVCdXR0b24nLCBSb3RhdGVCdXR0b24pOwogICAgICAgIHBsYXllci5nZXRD
aGlsZCgnY29udHJvbEJhcicpLmFkZENoaWxkKCdSb3RhdGVCdXR0b24nLCB7fSwgcGxheWVyLmNv
bnRyb2xCYXIuY2hpbGRyZW4oKS5sZW5ndGggLSAxKTsKICAgIH0pOwp9KTsKCgkJY29udGVudExv
YWRlZChmYWxzZSwgZnVuY3Rpb24oKSB7CgkJCWxldCBwbGF5ZXI7CgkJCWxldCB2aWRlb0xpbmtz
ID0gZG9jdW1lbnQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZSgndmlkZW8tbGluaycpOwoJCQlmb3Ig
KHZhciBpID0gMDsgaSA8IHZpZGVvTGlua3MubGVuZ3RoOyBpKyspIHsKCQkJCXZpZGVvTGlua3Nb
aV0uYWRkRXZlbnRMaXN0ZW5lcignY2xpY2snLCBmdW5jdGlvbihldmVudCkgewoJCQkJCWxldCB2
aWRlb1NyYyA9IGV2ZW50LmN1cnJlbnRUYXJnZXQuZ2V0QXR0cmlidXRlKCdkYXRhLXZpZGVvLXNy
YycpOwoJCQkJCWxldCB2aWRlb05hbWUgPSBldmVudC5jdXJyZW50VGFyZ2V0LmdldEF0dHJpYnV0
ZSgnZGF0YS12aWRlby1uYW1lJyk7CgkJCQkJY29uc29sZS5sb2coInZpZGVvU3JjOiAiLCB2aWRl
b1NyYyk7CgkJCQkJLy8gQ3JlYXRlIGEgbmV3IHZpZGVvIHRhZwoJCQkJCWxldCB2aWRlb1RhZyA9
IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ3ZpZGVvJyk7CgkJCQkJdmlkZW9UYWcuc2V0QXR0cmli
dXRlKCdjbGFzcycsICd2aWRlby1qcyB2anMtZmlsbCBjZW50ZXItYmxvY2sgdmpzLWRlZmF1bHQt
c2tpbicpOwoJCQkJCXZpZGVvVGFnLnNldEF0dHJpYnV0ZSgnY29udHJvbHMnLCAnJyk7CgkJCQkJ
dmlkZW9UYWcuc2V0QXR0cmlidXRlKCdwcmVsb2FkJywgJ2F1dG8nKTsKCQkJCQl2aWRlb1RhZy5z
ZXRBdHRyaWJ1dGUoJ2RhdGEtc2V0dXAnLCAne30nKTsKCgkJCQkJLy8gQ3JlYXRlIGEgbmV3IHNv
dXJjZSB0YWcKCQkJCQlsZXQgc291cmNlVGFnID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgnc291
cmNlJyk7CgkJCQkJc291cmNlVGFnLnNldEF0dHJpYnV0ZSgnc3JjJywgdmlkZW9TcmMpOwoJCQkJ
CXNvdXJjZVRhZy5zZXRBdHRyaWJ1dGUoJ3R5cGUnLCAndmlkZW8vbXA0Jyk7CgoJCQkJCS8vIEFw
cGVuZCB0aGUgc291cmNlIHRhZyB0byB0aGUgdmlkZW8gdGFnCgkJCQkJdmlkZW9UYWcuYXBwZW5k
Q2hpbGQoc291cmNlVGFnKTsKCgkJCQkJLy8gR2V0IHRoZSBtb2RhbCBib2R5IGFuZCBjbGVhciBp
dHMgY29udGVudHMKCQkJCQlsZXQgbW9kYWxCb2R5ID0gZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQo
J3ZpZGVvTW9kYWxCb2R5Jyk7CgkJCQkJbW9kYWxCb2R5LnNldEF0dHJpYnV0ZSgnc3R5bGUnLCAn
aGVpZ2h0Ojgwdmg7d2lkdGg6ODB2dycpOwoJCQkJCW1vZGFsQm9keS5pbm5lckhUTUwgPSAnJzsK
CgkJCQkJLy8gQXBwZW5kIHRoZSB2aWRlbyB0YWcgdG8gdGhlIG1vZGFsIGJvZHkKCQkJCQltb2Rh
bEJvZHkuYXBwZW5kQ2hpbGQodmlkZW9UYWcpOwoKCQkJCQkvLyBJbml0aWFsaXplIHRoZSB2aWRl
byBwbGF5ZXIKCQkJCQlwbGF5ZXIgPSB2aWRlb2pzKHZpZGVvVGFnKTsKCQkJCQlwbGF5ZXIub3Jp
ZW50YXRpb25IYW5kbGVyKCk7CgoJCQkJCS8vIENyZWF0ZSBhIG5ldyBidXR0b24gY29tcG9uZW50
CgkJCQkJbGV0IEJ1dHRvbiA9IHZpZGVvanMuZ2V0Q29tcG9uZW50KCdCdXR0b24nKTsKCQkJCQlj
bGFzcyBEb3dubG9hZEJ1dHRvbiBleHRlbmRzIEJ1dHRvbiB7CgkJCQkJCWNvbnN0cnVjdG9yKHBs
YXllciwgb3B0aW9ucykgewoJCQkJCQkJc3VwZXIocGxheWVyLCBvcHRpb25zKTsKCQkJCQkJCXRo
aXMuZWwoKS5pbm5lckhUTUwgPSAnPHNwYW4gY2xhc3M9InNyLW9ubHkiPkRvd25sb2FkPC9zcGFu
PjxpIGNsYXNzPSJmYXMgZmEtZG93bmxvYWQiPjwvaT4nOwoJCQkJCQl9CgoJCQkJCQloYW5kbGVD
bGljaygpIHsKCgkJCQkJCQl3aW5kb3cub3Blbih2aWRlb1NyYywgJ19ibGFuaycpOwoKCQkJCQkJ
fQoJCQkJCX0KCgkJCQkJLy8gUmVnaXN0ZXIgdGhlIGN1c3RvbSBCdXR0b24gY2xhc3MKCQkJCQl2
aWRlb2pzLnJlZ2lzdGVyQ29tcG9uZW50KCdEb3dubG9hZEJ1dHRvbicsIERvd25sb2FkQnV0dG9u
KTsKCgkJCQkJLy8gQWRkIHRoZSBjdXN0b20gYnV0dG9uIHRvIHRoZSBjb250cm9sIGJhcgoJCQkJ
CXBsYXllci5nZXRDaGlsZCgnY29udHJvbEJhcicpLmFkZENoaWxkKCdEb3dubG9hZEJ1dHRvbics
IHt9KTsKCQkJCX0pOwoJCQl9CgkJCSQoJyN2aWRlb01vZGFsJykub24oJ2hpZGUuYnMubW9kYWwn
LCBmdW5jdGlvbiAoZSkgewoJCQkJaWYgKHBsYXllcikgewoJCQkJCXBsYXllci5wYXVzZSgpOwoJ
CQkJfQoJCQl9KTsKCQkJdmFyIGNoZWNrYm94ZXMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxs
KCcuZGVsZXRlLWNoZWNrYm94Jyk7CgoJCQkvLyBUaGUgZm9yRWFjaCBtZXRob2Qgd2lsbCBub3Qg
ZXhlY3V0ZSBpZiB0aGUgTm9kZUxpc3QgaXMgZW1wdHksCgkJCS8vIHNvIHRoZXJlJ3Mgbm8gbmVl
ZCBmb3IgYW4gZXhwbGljaXQgY2hlY2sgZm9yIHRoZSBleGlzdGVuY2Ugb2YgY2hlY2tib3hlcy4K
CQkJY2hlY2tib3hlcy5mb3JFYWNoKGZ1bmN0aW9uKGNoZWNrYm94KSB7CgkJCQljaGVja2JveC5h
ZGRFdmVudExpc3RlbmVyKCdjbGljaycsIGZ1bmN0aW9uKGV2ZW50KSB7CgkJCQkJLy8gU3RvcCB0
aGUgZXZlbnQgZnJvbSBidWJibGluZyB1cCB0byB0aGUgcGFyZW50IGVsZW1lbnRzCgkJCQkJZXZl
bnQuc3RvcFByb3BhZ2F0aW9uKCk7CgkJCQl9KTsKCQkJfSk7CgoJCQkvLyBJbWFnZSBMaWdodGJv
eCBDb250cm9sbGVyCgkJCXZhciBsaWdodGJveEltYWdlcyA9IFtdOwoJCQl2YXIgY3VycmVudElt
YWdlSW5kZXggPSAwOwoKCQkJZnVuY3Rpb24gaW5pdGlhbGl6ZUxpZ2h0Ym94KCkgewoJCQkJLy8g
Q29sbGVjdCBhbGwgbGlnaHRib3ggaW1hZ2VzIGZyb20gaW5saW5lIGltYWdlcyBhbmQgYXR0YWNo
bWVudHMKCQkJCWxpZ2h0Ym94SW1hZ2VzID0gW107CgkJCQl2YXIgaW5saW5lSW1hZ2VzID0gZG9j
dW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmxpZ2h0Ym94LWltYWdlJyk7CgkJCQl2YXIgYXR0YWNo
bWVudEltYWdlcyA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoJy5saWdodGJveC1hdHRhY2ht
ZW50Jyk7CgoJCQkJLy8gQWRkIGlubGluZSBpbWFnZXMKCQkJCWlubGluZUltYWdlcy5mb3JFYWNo
KGZ1bmN0aW9uKGltZywgaW5kZXgpIHsKCQkJCQlsaWdodGJveEltYWdlcy5wdXNoKHsKCQkJCQkJ
c3JjOiBpbWcuZ2V0QXR0cmlidXRlKCdkYXRhLWxpZ2h0Ym94LXNyYycpIHx8IGltZy5zcmMsCgkJ
CQkJCXRpdGxlOiBpbWcuZ2V0QXR0cmlidXRlKCdkYXRhLWxpZ2h0Ym94LXRpdGxlJykgfHwgJycs
CgkJCQkJCXR5cGU6ICdpbWFnZScsCgkJCQkJCWRvd25sb2FkVXJsOiBpbWcuZ2V0QXR0cmlidXRl
KCdkYXRhLWxpZ2h0Ym94LWRvd25sb2FkJykgfHwgaW1nLmdldEF0dHJpYnV0ZSgnZGF0YS1saWdo
dGJveC1zcmMnKSB8fCBpbWcuc3JjLAoJCQkJCQlpbmRleDogbGlnaHRib3hJbWFnZXMubGVuZ3Ro
CgkJCQkJfSk7CgkJCQkJaW1nLnNldEF0dHJpYnV0ZSgnZGF0YS1saWdodGJveC1pbmRleCcsIGxp
Z2h0Ym94SW1hZ2VzLmxlbmd0aCAtIDEpOwoJCQkJfSk7CgoJCQkJLy8gQWRkIGF0dGFjaG1lbnQg
aW1hZ2VzCgkJCQlhdHRhY2htZW50SW1hZ2VzLmZvckVhY2goZnVuY3Rpb24oZWxlbSwgaW5kZXgp
IHsKCQkJCQl2YXIgaXNUZXh0ID0gZWxlbS5nZXRBdHRyaWJ1dGUoJ2RhdGEtbGlnaHRib3gtdHlw
ZScpID09PSAndGV4dCc7CgkJCQkJbGlnaHRib3hJbWFnZXMucHVzaCh7CgkJCQkJCXNyYzogZWxl
bS5nZXRBdHRyaWJ1dGUoJ2RhdGEtbGlnaHRib3gtc3JjJyksCgkJCQkJCXRpdGxlOiBlbGVtLmdl
dEF0dHJpYnV0ZSgnZGF0YS1saWdodGJveC10aXRsZScpIHx8ICcnLAoJCQkJCQl0eXBlOiBpc1Rl
eHQgPyAndGV4dCcgOiAnaW1hZ2UnLAoJCQkJCQlkb3dubG9hZFVybDogZWxlbS5nZXRBdHRyaWJ1
dGUoJ2RhdGEtbGlnaHRib3gtZG93bmxvYWQnKSB8fCBlbGVtLmdldEF0dHJpYnV0ZSgnZGF0YS1s
aWdodGJveC1zcmMnKSwKCQkJCQkJaW5kZXg6IGxpZ2h0Ym94SW1hZ2VzLmxlbmd0aAoJCQkJCX0p
OwoJCQkJCWVsZW0uc2V0QXR0cmlidXRlKCdkYXRhLWxpZ2h0Ym94LWluZGV4JywgbGlnaHRib3hJ
bWFnZXMubGVuZ3RoIC0gMSk7CgkJCQl9KTsKCQkJfQoKCQkJZnVuY3Rpb24gc2hvd0xpZ2h0Ym94
SW1hZ2UoaW5kZXgpIHsKCQkJCWlmIChpbmRleCA8IDAgfHwgaW5kZXggPj0gbGlnaHRib3hJbWFn
ZXMubGVuZ3RoKSByZXR1cm47CgoJCQkJY3VycmVudEltYWdlSW5kZXggPSBpbmRleDsKCQkJCXZh
ciBpdGVtID0gbGlnaHRib3hJbWFnZXNbaW5kZXhdOwoKCQkJCSQoJyNpbWFnZUxpZ2h0Ym94TGFi
ZWwnKS50ZXh0KGl0ZW0udGl0bGUpOwoJCQkJJCgnI2xpZ2h0Ym94Q291bnRlcicpLnRleHQoKGlu
ZGV4ICsgMSkgKyAnIC8gJyArIGxpZ2h0Ym94SW1hZ2VzLmxlbmd0aCk7CgoJCQkJaWYgKGl0ZW0u
dHlwZSA9PT0gJ3RleHQnKSB7CgkJCQkJLy8gU2hvdyB0ZXh0IGNvbnRlbnQKCQkJCQkkKCcjbGln
aHRib3hJbWFnZScpLmhpZGUoKTsKCQkJCQkkKCcjbGlnaHRib3hUZXh0Q29udGVudCcpLnNob3co
KTsKCQkJCQlmZXRjaChpdGVtLnNyYykudGhlbihyID0+IHIudGV4dCgpKS50aGVuKHRleHQgPT4g
ewoJCQkJCQkkKCcjbGlnaHRib3hUZXh0Q29udGVudCcpLnRleHQodGV4dCk7CgkJCQkJfSk7CgkJ
CQl9IGVsc2UgewoJCQkJCS8vIFNob3cgaW1hZ2UKCQkJCQkkKCcjbGlnaHRib3hUZXh0Q29udGVu
dCcpLmhpZGUoKTsKCQkJCQkkKCcjbGlnaHRib3hJbWFnZScpLnNob3coKTsKCQkJCQkkKCcjbGln
aHRib3hJbWFnZScpLmF0dHIoJ3NyYycsIGl0ZW0uc3JjKS5hdHRyKCdhbHQnLCBpdGVtLnRpdGxl
KTsKCQkJCX0KCgkJCQkvLyBTaG93L2hpZGUgbmF2aWdhdGlvbiBidXR0b25zCgkJCQkkKCcjbGln
aHRib3hQcmV2JykudG9nZ2xlKGxpZ2h0Ym94SW1hZ2VzLmxlbmd0aCA+IDEpOwoJCQkJJCgnI2xp
Z2h0Ym94TmV4dCcpLnRvZ2dsZShsaWdodGJveEltYWdlcy5sZW5ndGggPiAxKTsKCgkJCQkvLyBV
cGRhdGUgZG93bmxvYWQgYnV0dG9uCgkJCQkkKCcjbGlnaHRib3hEb3dubG9hZCcpLm9mZignY2xp
Y2snKS5vbignY2xpY2snLCBmdW5jdGlvbigpIHsKCgkJCQkJd2luZG93Lm9wZW4oaXRlbS5kb3du
bG9hZFVybCArICc/ZG93bmxvYWQ9MScsICdfYmxhbmsnKTsKCgkJCQl9KTsKCQkJfQoKCQkJLy8g
SW5pdGlhbGl6ZSBsaWdodGJveCBvbiBwYWdlIGxvYWQKCQkJaW5pdGlhbGl6ZUxpZ2h0Ym94KCk7
CgoJCQkvLyBIYW5kbGUgY2xpY2tzIG9uIGxpZ2h0Ym94IGltYWdlcwoJCQkkKGRvY3VtZW50KS5v
bignY2xpY2snLCAnLmxpZ2h0Ym94LWltYWdlLCAubGlnaHRib3gtYXR0YWNobWVudCcsIGZ1bmN0
aW9uKGUpIHsKCQkJCWUucHJldmVudERlZmF1bHQoKTsKCQkJCXZhciBpbmRleCA9IHBhcnNlSW50
KCQodGhpcykuYXR0cignZGF0YS1saWdodGJveC1pbmRleCcpKTsKCQkJCXNob3dMaWdodGJveElt
YWdlKGluZGV4KTsKCQkJCSQoJyNpbWFnZUxpZ2h0Ym94JykubW9kYWwoJ3Nob3cnKTsKCQkJfSk7
CgoJCQkvLyBOYXZpZ2F0aW9uIGJ1dHRvbnMKCQkJJCgnI2xpZ2h0Ym94UHJldicpLm9uKCdjbGlj
aycsIGZ1bmN0aW9uKCkgewoJCQkJdmFyIG5ld0luZGV4ID0gKGN1cnJlbnRJbWFnZUluZGV4IC0g
MSArIGxpZ2h0Ym94SW1hZ2VzLmxlbmd0aCkgJSBsaWdodGJveEltYWdlcy5sZW5ndGg7CgkJCQlz
aG93TGlnaHRib3hJbWFnZShuZXdJbmRleCk7CgkJCX0pOwoKCQkJJCgnI2xpZ2h0Ym94TmV4dCcp
Lm9uKCdjbGljaycsIGZ1bmN0aW9uKCkgewoJCQkJdmFyIG5ld0luZGV4ID0gKGN1cnJlbnRJbWFn
ZUluZGV4ICsgMSkgJSBsaWdodGJveEltYWdlcy5sZW5ndGg7CgkJCQlzaG93TGlnaHRib3hJbWFn
ZShuZXdJbmRleCk7CgkJCX0pOwoKCQkJLy8gS2V5Ym9hcmQgbmF2aWdhdGlvbgoJCQkkKGRvY3Vt
ZW50KS5vbigna2V5ZG93bicsIGZ1bmN0aW9uKGUpIHsKCQkJCWlmICghJCgnI2ltYWdlTGlnaHRi
b3gnKS5oYXNDbGFzcygnaW4nKSkgcmV0dXJuOwoKCQkJCWlmIChlLmtleUNvZGUgPT09IDM3KSB7
IC8vIExlZnQgYXJyb3cKCQkJCQkkKCcjbGlnaHRib3hQcmV2JykuY2xpY2soKTsKCQkJCX0gZWxz
ZSBpZiAoZS5rZXlDb2RlID09PSAzOSkgeyAvLyBSaWdodCBhcnJvdwoJCQkJCSQoJyNsaWdodGJv
eE5leHQnKS5jbGljaygpOwoJCQkJfSBlbHNlIGlmIChlLmtleUNvZGUgPT09IDI3KSB7IC8vIEVT
QwoJCQkJCSQoJyNpbWFnZUxpZ2h0Ym94JykubW9kYWwoJ2hpZGUnKTsKCQkJCX0KCQkJfSk7CgoJ
CQkvLyBSZS1pbml0aWFsaXplIGxpZ2h0Ym94IHdoZW4gbW9kYWwgaXMgc2hvd24gKGluIGNhc2Ug
aW1hZ2VzIHdlcmUgbG9hZGVkIGR5bmFtaWNhbGx5KQoJCQkkKCcjaW1hZ2VMaWdodGJveCcpLm9u
KCdzaG93LmJzLm1vZGFsJywgZnVuY3Rpb24oKSB7CgkJCQlpbml0aWFsaXplTGlnaHRib3goKTsK
CQkJfSk7CgoJCX0sICJhdHRhY2htZW50LnF0cGwiKTsKCTwvc2NyaXB0PgoKCgkJCgkJPGRpdiBj
bGFzcz0icHVsbC1yaWdodCI+CgkJCTx1bCBjbGFzcz0icGFnaW5hdGlvbiI+CgkJCQkKCQkJCQk8
bGk+CgkJCQkJCTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI1NDM5Ij4KCQkJCQkJCTxpIGNsYXNzPSJmYSBmYS1jaGV2
cm9uLWxlZnQiPgoJCQkJCQkJCTxzcGFuIGNsYXNzPSJzci1vbmx5Ij4KCQkJCQkJCQkJcHJldmlv
dXMgcGFnZQoJCQkJCQkJCTwvc3Bhbj4KCQkJCQkJCTwvaT4KCQkJCQkJPC9hPgoJCQkJCTwvbGk+
CgkJCQkKCQkJCTxsaSBjbGFzcz0iZGlzYWJsZWQiPgoJCQkJCTxhIGhyZWY9ImphdmFzY3JpcHQ6
dm9pZCgwKSI+CgkJCQkJCSMyMjU0NDAKCQkJCQk8L2E+CgkJCQk8L2xpPgoJCQkJCgkJCQkJPGxp
PgoJCQkJCQk8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzIyNTQ0MSI+CgkJCQkJCQk8aSBjbGFzcz0iZmEgZmEtY2hldnJv
bi1yaWdodCI+CgkJCQkJCQkJPHNwYW4gY2xhc3M9InNyLW9ubHkiPgoJCQkJCQkJCQluZXh0IHBh
Z2UKCQkJCQkJCQk8L3NwYW4+CgkJCQkJCQk8L2k+CgkJCQkJCTwvYT4KCQkJCQk8L2xpPgoJCQkJ
CgkJCTwvdWw+CgkJPC9kaXY+CgkJCgkJCTxkaXYgY2xhc3M9InJvdyI+CgkJCQk8ZGl2IGNsYXNz
PSJjb2wtc20tb2Zmc2V0LTEgY29sLXNtLTEwIj4KCQkJCQk8ZGl2IGNsYXNzPSJhbGVydCBhbGVy
dC1zdWNjZXNzIj4KCQkJCQkJPGNlbnRlcj4KCQkJCQkJPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvam9pbiI+Sm9pbjwvYT4gb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB0byBhdXRvbWF0aWNhbGx5IHJlY2Vp
dmUgYWxsIGdyb3VwIG1lc3NhZ2VzLgoJCQkJCQk8L2NlbnRlcj4KCQkJCQk8L2Rpdj4KCQkJCTwv
ZGl2PgoJCQk8L2Rpdj4KCQkKCgkJCgk8Zm9ybSBjbGFzcz0iZm9ybSIgaWQ9InJlcG9ydGZvcm0i
IGh4LWJvb3N0PSJmYWxzZSI+CgkJCgkJPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0ibWlkIiBp
ZD0icmVwb3J0bWlkIiB2YWx1ZT0iMCI+CgkJPCEtLSBSZXBvcnQgTWVzc2FnZSBNb2RhbCAtLT4K
CQk8ZGl2IGNsYXNzPSJtb2RhbCBmYWRlIiBpZD0icmVwb3J0TWVzc2FnZU1vZGFsIiB0YWJpbmRl
eD0iLTEiIHJvbGU9ImRpYWxvZyIgYXJpYS1sYWJlbGxlZGJ5PSJyZXBvcnRNZXNzYWdlTW9kYWxM
YWJlbCI+CgkJCTxkaXYgY2xhc3M9Im1vZGFsLWRpYWxvZyIgcm9sZT0iZG9jdW1lbnQiPgoJCQkJ
PGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CgkJCQkJPGRpdiBjbGFzcz0ibW9kYWwtaGVhZGVy
Ij4KCQkJCQkJPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJjbG9zZSIgZGF0YS1kaXNtaXNz
PSJtb2RhbCI+CgkJCQkJCQk8c3BhbiBhcmlhLWhpZGRlbj0idHJ1ZSI+CgkJCQkJCQkJJnRpbWVz
OwoJCQkJCQkJPC9zcGFuPgoJCQkJCQkJPHNwYW4gY2xhc3M9InNyLW9ubHkiPgoJCQkJCQkJCUNs
b3NlCgkJCQkJCQk8L3NwYW4+CgkJCQkJCTwvYnV0dG9uPgoJCQkJCQk8aDQgY2xhc3M9Im1vZGFs
LXRpdGxlIiBpZD0icmVwb3J0TWVzc2FnZU1vZGFsTGFiZWwiPgoJCQkJCQkJUmVwb3J0IE1lc3Nh
Z2UKCQkJCQkJPC9oND4KCQkJCQk8L2Rpdj4KCQkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1ib2R5Ij4K
CQkJCQkJPGxhYmVsIGZvcj0icmVhc29uIj4KCQkJCQkJCVJlYXNvbgoJCQkJCQk8L2xhYmVsPgoJ
CQkJCQk8dGV4dGFyZWEgaWQ9InJlYXNvbiIgbmFtZT0icmVhc29uIiBjbGFzcz0iZm9ybS1jb250
cm9sIiByb3dzPSI1Ij48L3RleHRhcmVhPgoJCQkJCQk8ZGl2IGNsYXNzPSJyYWRpbyI+CgkJCQkJ
CQk8bGFiZWw+CgkJCQkJCQkJPGlucHV0IHR5cGU9InJhZGlvIiBuYW1lPSJyZXBvcnR0byIgdmFs
dWU9Im1vZHMiIGNoZWNrZWQ+CgkJCQkJCQkJUmVwb3J0IHRvIE1vZGVyYXRvcnMKCQkJCQkJCTwv
bGFiZWw+CgkJCQkJCQk8c3BhbiBjbGFzcz0iaGVscC1ibG9jayI+CgkJCQkJCQkJSSB0aGluayB0
aGlzIG1lc3NhZ2UgaXNuJiMzOTt0IGFwcHJvcHJpYXRlIGZvciBvdXIgZ3JvdXAuIFRoZSBHcm91
cCBtb2RlcmF0b3JzIGFyZSByZXNwb25zaWJsZSBmb3IgbWFpbnRhaW5pbmcgdGhlaXIgY29tbXVu
aXR5IGFuZCBjYW4gYWRkcmVzcyB0aGVzZSBpc3N1ZXMuCgkJCQkJCQk8L3NwYW4+CgkJCQkJCQk8
bGFiZWw+CgkJCQkJCQkJPGlucHV0IHR5cGU9InJhZGlvIiBuYW1lPSJyZXBvcnR0byIgdmFsdWU9
InN1cHBvcnQiPgoJCQkJCQkJCVJlcG9ydCB0byBPcGVuIEVtYmVkZGVkIFN1cHBvcnQKCQkJCQkJ
CTwvbGFiZWw+CgkJCQkJCQk8c3BhbiBjbGFzcz0iaGVscC1ibG9jayI+CgkJCQkJCQkJSSB0aGlu
ayB0aGlzIHZpb2xhdGVzIHRoZSBUZXJtcyBvZiBTZXJ2aWNlLiBUaGlzIGluY2x1ZGVzOiBoYXJt
IHRvIG1pbm9ycywgdmlvbGVuY2Ugb3IgdGhyZWF0cywgaGFyYXNzbWVudCBvciBwcml2YWN5IGlu
dmFzaW9uLCBpbXBlcnNvbmF0aW9uIG9yIG1pc3JlcHJlc2VudGF0aW9uLCBmcmF1ZCBvciBwaGlz
aGluZy4KCQkJCQkJCTwvc3Bhbj4KCQkJCQkJPC9kaXY+CgkJCQkJCTxwPgoJCQkJCQkJPGNlbnRl
cj4KCQkJCQkJCQk8c3Ryb25nPgoJCQkJCQkJCQlOb3RlOgoJCQkJCQkJCTwvc3Ryb25nPgoJCQkJ
CQkJCVlvdXIgZW1haWwgYWRkcmVzcyBpcyBpbmNsdWRlZCB3aXRoIHRoZSBhYnVzZSByZXBvcnQu
CgkJCQkJCQk8L2NlbnRlcj4KCQkJCQkJPC9wPgoJCQkJCTwvZGl2PgoJCQkJCTxkaXYgY2xhc3M9
Im1vZGFsLWZvb3RlciI+CgkJCQkJCTxidXR0b24gdHlwZT0iYnV0dG9uIiBjbGFzcz0iYnRuIGJ0
bi1kZWZhdWx0IGJ0bi1zbSIgZGF0YS1kaXNtaXNzPSJtb2RhbCI+CgkJCQkJCQk8aSBjbGFzcz0i
ZmEgZmEtdGltZXMiPjwvaT4KCQkJCQkJCUNhbmNlbAoJCQkJCQk8L2J1dHRvbj4KCQkJCQkJPGJ1
dHRvbiBjbGFzcz0iYnRuIGJ0bi1kYW5nZXIgYnRuLXNtIiBuYW1lPSJyZXBvcnQiIHZhbHVlPSIx
Ij4KCQkJCQkJCTxpIGNsYXNzPSJmYSBmYS1mbGFnIj48L2k+CgkJCQkJCQlSZXBvcnQKCQkJCQkJ
PC9idXR0b24+CgkJCQkJPC9kaXY+CgkJCQk8L2Rpdj4KCQkJPC9kaXY+CgkJPC9kaXY+Cgk8L2Zv
cm0+CjxzY3JpcHQ+Cgljb250ZW50TG9hZGVkKCAgZmFsc2UgICwgZnVuY3Rpb24oKSB7CgkJY29u
c29sZS5sb2coIlNldHRpbmcgdXAgcmVwb3J0IG1lc3NhZ2UgbW9kYWwiKTsKCQkkKCcjcmVwb3J0
TWVzc2FnZU1vZGFsJykub24oJ3Nob3cuYnMubW9kYWwnLCBmdW5jdGlvbihlKSB7CgkJCXZhciBt
c2dJZCA9ICQoZS5yZWxhdGVkVGFyZ2V0KS5kYXRhKCdtZXNzYWdlLWlkJyk7CgkJCSQoJyNyZXBv
cnRtaWQnKS52YWwobXNnSWQpOwoJCX0pOwoJCSQoJyNyZXBvcnRmb3JtJykub24oJ3N1Ym1pdCcs
IGZ1bmN0aW9uKGV2ZW50KSB7CgkJCWV2ZW50LnByZXZlbnREZWZhdWx0KCk7CgkJCSQoJyNyZXBv
cnRNZXNzYWdlTW9kYWwnKS5tb2RhbCgnaGlkZScpOwoJCQkkLmFqYXgoewoJCQkJdXJsOiAiaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvcmVwb3J0IiwK
CQkJCXR5cGU6ICJQT1NUIiwKCQkJCWRhdGE6ICQodGhpcykuc2VyaWFsaXplKCksCgkJCQlzdWNj
ZXNzOiBmdW5jdGlvbihodG1sKSB7CgkJCQkJY3JlYXRlQWxlcnQoIllvdXIgcmVwb3J0IGhhcyBi
ZWVuIHNlbnQuIiwgdHJ1ZSk7CgkJCQl9CgkJCX0pOwoJCQlyZXR1cm4gZmFsc2U7CgkJfSk7Cgl9
KTsKPC9zY3JpcHQ+CgoJCTxmb3JtIGNsYXNzPSJmb3JtIiBtZXRob2Q9IlBPU1QiIGFjdGlvbj0i
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvZWRpdG1l
c3NhZ2UiPgoJCQkKCQkJPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0ibWlkIiBpZD0ibWlkIiB2
YWx1ZT0iMCI+CgkJCTxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9ImFjdGlvbl90eXBlIiB2YWx1
ZT0iZGVsZXRlIj4KCQkJPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iciIgdmFsdWU9Imh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2VzIj4K
CQkJPCEtLSBWZXJpZnkgUmVtb3ZlIE1vZGFsIC0tPgoJCQk8ZGl2IGNsYXNzPSJtb2RhbCBmYWRl
IiBpZD0iZGVsZXRlTWVzc2FnZU1vZGFsIiB0YWJpbmRleD0iLTEiIHJvbGU9ImRpYWxvZyIgYXJp
YS1sYWJlbGxlZGJ5PSJkZWxldGVNZXNzYWdlTW9kYWxMYWJlbCI+CgkJCQk8ZGl2IGNsYXNzPSJt
b2RhbC1kaWFsb2ciIHJvbGU9ImRvY3VtZW50Ij4KCQkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1jb250
ZW50Ij4KCQkJCQkJPGRpdiBjbGFzcz0ibW9kYWwtaGVhZGVyIj4KCQkJCQkJCTxidXR0b24gdHlw
ZT0iYnV0dG9uIiBjbGFzcz0iY2xvc2UiIGRhdGEtZGlzbWlzcz0ibW9kYWwiPgoJCQkJCQkJCTxz
cGFuIGFyaWEtaGlkZGVuPSJ0cnVlIj4KCQkJCQkJCQkJJnRpbWVzOwoJCQkJCQkJCTwvc3Bhbj4K
CQkJCQkJCQk8c3BhbiBjbGFzcz0ic3Itb25seSI+CgkJCQkJCQkJCUNsb3NlCgkJCQkJCQkJPC9z
cGFuPgoJCQkJCQkJPC9idXR0b24+CgkJCQkJCQk8aDQgY2xhc3M9Im1vZGFsLXRpdGxlIiBpZD0i
ZGVsZXRlTWVzc2FnZU1vZGFsTGFiZWwiPgoJCQkJCQkJCVZlcmlmeSBEZWxldGUKCQkJCQkJCTwv
aDQ+CgkJCQkJCTwvZGl2PgoJCQkJCQk8ZGl2IGNsYXNzPSJtb2RhbC1ib2R5Ij4KCQkJCQkJCUFy
ZSB5b3Ugc3VyZSB5b3Ugd2FudCB0byBkZWxldGUgdGhpcyBtZXNzYWdlIGZyb20gdGhlIG1lc3Nh
Z2UgYXJjaGl2ZXMgb2Ygb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz8g
PHN0cm9uZz5UaGlzIGNhbm5vdCBiZSB1bmRvbmUuPC9zdHJvbmc+CgkJCQkJCTwvZGl2PgoJCQkJ
CQk8ZGl2IGNsYXNzPSJtb2RhbC1mb290ZXIiPgoJCQkJCQkJPGJ1dHRvbiB0eXBlPSJidXR0b24i
IGNsYXNzPSJidG4gYnRuLWRlZmF1bHQgYnRuLXNtIiBkYXRhLWRpc21pc3M9Im1vZGFsIj4KCQkJ
CQkJCQk8aSBjbGFzcz0iZmEgZmEtdGltZXMiPjwvaT4KCQkJCQkJCQlDYW5jZWwKCQkJCQkJCTwv
YnV0dG9uPgoJCQkJCQkJPGJ1dHRvbiBjbGFzcz0iYnRuIGJ0bi1kYW5nZXIgYnRuLXNtIiBuYW1l
PSJkZWxtZXNzYWdlIiB2YWx1ZT0iMSI+CgkJCQkJCQkJPGkgY2xhc3M9ImZhIGZhLXRyYXNoLWFs
dCI+PC9pPgoJCQkJCQkJCVllcwoJCQkJCQkJPC9idXR0b24+CgkJCQkJCTwvZGl2PgoJCQkJCTwv
ZGl2PgoJCQkJPC9kaXY+CgkJCTwvZGl2PgoJCTwvZm9ybT4KCQk8Zm9ybSBjbGFzcz0iZm9ybSIg
bWV0aG9kPSJQT1NUIiBhY3Rpb249Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3JlcG9zdG1lc3NhZ2UiPgoJCQkKCQkJPGlucHV0IHR5cGU9ImhpZGRl
biIgbmFtZT0ibWlkIiBpZD0icmVwb3N0bWlkIiB2YWx1ZT0iMCI+CgkJCTxpbnB1dCB0eXBlPSJo
aWRkZW4iIG5hbWU9InIiIHZhbHVlPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlcyI+CgkJCTwhLS0gVmVyaWZ5IFJlcG9zdCBNb2RhbCAt
LT4KCQkJPGRpdiBjbGFzcz0ibW9kYWwgZmFkZSIgaWQ9InJlcG9zdE1lc3NhZ2VNb2RhbCIgdGFi
aW5kZXg9Ii0xIiByb2xlPSJkaWFsb2ciIGFyaWEtbGFiZWxsZWRieT0icmVwb3N0TWVzc2FnZU1v
ZGFsTGFiZWwiPgoJCQkJPGRpdiBjbGFzcz0ibW9kYWwtZGlhbG9nIiByb2xlPSJkb2N1bWVudCI+
CgkJCQkJPGRpdiBjbGFzcz0ibW9kYWwtY29udGVudCI+CgkJCQkJCTxkaXYgY2xhc3M9Im1vZGFs
LWhlYWRlciI+CgkJCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImNsb3NlIiBkYXRh
LWRpc21pc3M9Im1vZGFsIj4KCQkJCQkJCQk8c3BhbiBhcmlhLWhpZGRlbj0idHJ1ZSI+CgkJCQkJ
CQkJCSZ0aW1lczsKCQkJCQkJCQk8L3NwYW4+CgkJCQkJCQkJPHNwYW4gY2xhc3M9InNyLW9ubHki
PgoJCQkJCQkJCQlDbG9zZQoJCQkJCQkJCTwvc3Bhbj4KCQkJCQkJCTwvYnV0dG9uPgoJCQkJCQkJ
PGg0IGNsYXNzPSJtb2RhbC10aXRsZSIgaWQ9InJlcG9zdE1lc3NhZ2VNb2RhbExhYmVsIj4KCQkJ
CQkJCQlWZXJpZnkgUmVwb3N0CgkJCQkJCQk8L2g0PgoJCQkJCQk8L2Rpdj4KCQkJCQkJPGRpdiBj
bGFzcz0ibW9kYWwtYm9keSI+CgkJCQkJCQlBcmUgeW91IHN1cmUgeW91IHdhbnQgdG8gcmVwb3N0
IHRoaXMgbWVzc2FnZT8KCQkJCQkJPC9kaXY+CgkJCQkJCTxkaXYgY2xhc3M9Im1vZGFsLWZvb3Rl
ciI+CgkJCQkJCQk8YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4tZGVmYXVsdCBi
dG4tc20iIGRhdGEtZGlzbWlzcz0ibW9kYWwiPgoJCQkJCQkJCTxpIGNsYXNzPSJmYSBmYS10aW1l
cyI+PC9pPgoJCQkJCQkJCUNhbmNlbAoJCQkJCQkJPC9idXR0b24+CgkJCQkJCQk8YnV0dG9uIGNs
YXNzPSJidG4gYnRuLWRhbmdlciBidG4tc20iIG5hbWU9ImRlbG1lc3NhZ2UiIHZhbHVlPSIxIj4K
CQkJCQkJCQk8aSBjbGFzcz0iZmEgZmEtcmV0d2VldCI+PC9pPgoJCQkJCQkJCVllcwoJCQkJCQkJ
PC9idXR0b24+CgkJCQkJCTwvZGl2PgoJCQkJCTwvZGl2PgoJCQkJPC9kaXY+CgkJCTwvZGl2PgoJ
CTwvZm9ybT4KPHNjcmlwdD4KY29udGVudExvYWRlZChmYWxzZSwgZnVuY3Rpb24oKSB7CgkkKCcj
ZGVsZXRlTWVzc2FnZU1vZGFsJykub24oJ3Nob3cuYnMubW9kYWwnLCBmdW5jdGlvbihlKSB7CgkJ
dmFyIG1zZ0lkID0gJChlLnJlbGF0ZWRUYXJnZXQpLmRhdGEoJ21lc3NhZ2UtaWQnKTsKCQkkKCcj
bWlkJykudmFsKG1zZ0lkKTsKCX0pOwoJJCgnI3JlcG9zdE1lc3NhZ2VNb2RhbCcpLm9uKCdzaG93
LmJzLm1vZGFsJywgZnVuY3Rpb24oZSkgewoJCXZhciBtc2dJZCA9ICQoZS5yZWxhdGVkVGFyZ2V0
KS5kYXRhKCdtZXNzYWdlLWlkJyk7CgkJJCgnI3JlcG9zdG1pZCcpLnZhbChtc2dJZCk7Cgl9KTsK
CSQoJ1tpZF49Y2FuY2VsXScpLm9uKCdjbGljaycsIGZ1bmN0aW9uKCkgewoJCW1zZ19udW0gPSAk
KHRoaXMpLmF0dHIoJ2lkJykuc3BsaXQoIi0iKVsxXQoJCSQoIiN3aW5kb3ctIittc2dfbnVtKS5j
b2xsYXBzZSgnaGlkZScpCgl9KTsKCSQoIi5tb2RhbCIpLm9uKCdzaG93bi5icy5tb2RhbCcsIGZ1
bmN0aW9uICgpIHsKCQkkKHRoaXMpLmZpbmQoImlucHV0OnZpc2libGU6Zmlyc3QiKS5mb2N1cygp
OwoJfSk7CgkkKCJbZGF0YS10b2dnbGU9J3Rvb2x0aXAnXSIpLnRvb2x0aXAoKTsKCXNldFB1bGxU
b1JlZnJlc2goKTsKCVVwZGF0ZVNpZGViYXIoImFyY2hpdmVzIik7CglpZiAoZG9jdW1lbnQuZG9j
dW1lbnRFbGVtZW50LmNsaWVudFdpZHRoIDw9IDk5MikgewoJCVNob3dCYWNrQnV0dG9uKCIiKTsK
CQlnaW9EZXN0cm95KGZ1bmN0aW9uKGV2ZW50KSB7CgkJCWNvbnNvbGUubG9nKCJkZXN0cnVjdG9y
IGNhbGxlZCIpOwoJCQlIaWRlQmFja0J1dHRvbigpOwoJCX0pOwoJfQp9KTsKPC9zY3JpcHQ+CgkK
CgkJCQk8L2Rpdj4KCQkJPC9kaXY+CgkJPC9kaXY+Cgk8L2Rpdj4KCTxkaXYgY2xhc3M9InJvdyBo
aWRkZW4tcHJpbnQiIGlkPSJtb2JpbGVTaWRlYmFyIiAgaHgtYm9vc3Q9InRydWUiIGh4LXRhcmdl
dD0iI21haW5jb250ZW50LXJlZnJlc2giIGh4LXB1c2gtdXJsPSJ0cnVlIiBoeC1oaXN0b3J5PSJm
YWxzZSIgaHgtb246OmFmdGVyLXJlcXVlc3Q9ImRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdtYWlu
Y29udGVudCcpLnNjcm9sbFRvKHt0b3A6IDAsIGJlaGF2aW9yOiAnaW5zdGFudCd9KSIgPgoJCTxk
aXYgaWQ9Im1vYmlsZVNpZGViYXJTdWIiIGNsYXNzPSJjb2wteHMtMTIgaGlkZGVuLW1kIGhpZGRl
bi1sZyI+CgkJCTxkaXYgY2xhc3M9Im5hdmJhciBuYXZiYXItZGVmYXVsdCBuYXZiYXItZml4ZWQt
Ym90dG9tIj4KCQkJCTxkaXYgY2xhc3M9ImNvbnRhaW5lciIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7
IGp1c3RpZnktY29udGVudDogc3BhY2UtYXJvdW5kOyI+CgkJCQkJCgkJCQkJCQoJCgkJCgkKCTxk
aXYgaWQ9Im1vYmlsZXNpZGViYXItYXJjaGl2ZXMiIGNsYXNzPSJtb2JpbGVzaWRlYmFyLWl0ZW0i
IHN0eWxlPSJtYXJnaW4tdG9wOjEwcHg7IHBhZGRpbmctYm90dG9tOjIwcHg7IGZsZXg6IDE7IHRl
eHQtYWxpZ246IGNlbnRlcjsiIGh4LWdldD0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWNzP3NpZGViYXI9dHJ1ZSIgIGh4LWJvb3N0PSJ0cnVl
IiBoeC10YXJnZXQ9IiNtYWluY29udGVudC1yZWZyZXNoIiBoeC1wdXNoLXVybD0idHJ1ZSIgaHgt
aGlzdG9yeT0iZmFsc2UiIGh4LW9uOjphZnRlci1yZXF1ZXN0PSJkb2N1bWVudC5nZXRFbGVtZW50
QnlJZCgnbWFpbmNvbnRlbnQnKS5zY3JvbGxUbyh7dG9wOiAwLCBiZWhhdmlvcjogJ2luc3RhbnQn
fSkiID4KCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IHBvc2l0aW9uOiByZWxh
dGl2ZTsiPgoJCQk8ZGl2IHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7ZGlzcGxheTogaW5saW5l
LWJsb2NrOyI+CgkJCTxpIGNsYXNzPSJmYS1mdyBmYS1zb2xpZCBmYS1jb21tZW50cyBmYS0yeCI+
PC9pPgoJCQkKCQkJPC9kaXY+PGJyPgoJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOjEycHg7Ij5N
ZXNzYWdlczwvc3Bhbj4KCQk8L2Rpdj4KCTwvZGl2PgoKCQoJCgoJCQkJCQkKCQoKCQkJCQkKCQkJ
CQk8ZGl2IHN0eWxlPSJmbGV4OiAxOyB0ZXh0LWFsaWduOiBjZW50ZXI7bWFyZ2luLXRvcDoxMHB4
IiBkYXRhLWRyYXdlci10cmlnZ2VyIGFyaWEtY29udHJvbHM9ImRyYXdlci1uYW1lIiBhcmlhLWV4
cGFuZGVkPSJmYWxzZSI+CgkJCQkJCTxpIGNsYXNzPSJmYS1mdyBmYS1saWdodCBmYS1iYXJzIGZh
LTJ4Ij48L2k+PGJyPgoJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOjEycHg7Ij5Nb3JlPC9z
cGFuPgoJCQkJCTwvZGl2PgoJCQkJPC9kaXY+CgkJCTwvZGl2PgoJCQk8c2VjdGlvbiBjbGFzcz0i
ZHJhd2VyIGRyYXdlci1sZWZ0IiBpZD0iZHJhd2VyLW5hbWUiIGRhdGEtZHJhd2VyLXRhcmdldD4K
CQkJCTxkaXYgY2xhc3M9ImRyYXdlci1vdmVybGF5IiBkYXRhLWRyYXdlci1jbG9zZSB0YWJpbmRl
eD0iLTEiPjwvZGl2PgoJCQkJPGRpdiBjbGFzcz0iZHJhd2VyLXdyYXBwZXIgZHJhd2VyLXdyYXBw
ZXItdG9wIj4KCQkJCQk8ZGl2IGNsYXNzPSJkcmF3ZXItaGVhZGVyIj4KCQkJCQkJPGRpdiBjbGFz
cz0iZHJhd2VyLXRpdGxlIj4KCQkJCQkJCTxpIGNsYXNzPSJmYS1mdyBmYS1yZWd1bGFyIGZhLWJh
cnMgZmEtM3giPjwvaT4KCQkJCQkJCTxzcGFuIGNsYXNzPSJzci1vbmx5Ij4KCQkJCQkJCQlNb3Jl
IE9wdGlvbnMKCQkJCQkJCTwvc3Bhbj4KCQkJCQkJCU1vcmUKCQkJCQkJPC9kaXY+CgkJCQkJCTxi
dXR0b24gY2xhc3M9ImRyYXdlci1jbG9zZSIgZGF0YS1kcmF3ZXItY2xvc2UgYXJpYS1sYWJlbD0i
Q2xvc2UgRHJhd2VyIj48L2J1dHRvbj4KCQkJCQk8L2Rpdj4KCQkJCQk8ZGl2IGNsYXNzPSJkcmF3
ZXItY29udGVudCI+CgkJCQkJCTxkaXYgY2xhc3M9Imxpc3QtZ3JvdXAgbm9ib3JkZXJsaXN0Ij4K
CQkJCQkJCQoKCgk8YSB0aXRsZT0iR3JvdXAgSG9tZSIgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUiIGNsYXNzPSJsaXN0LWdyb3VwLWl0ZW0g
c2lkZWJhci1pdGVtIj4KCQk8aSBjbGFzcz0iZmEtZncgZmEgZmEtaG9tZSBmYS1sZyI+PC9pPgoJ
CUhvbWUKCQkKCTwvYT4KCgkKCgkKCgkKCQkKCQoJCQoKCTxhIHRpdGxlPSJNZXNzYWdlcyIgaHJl
Zj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9w
aWNzP3NpZGViYXI9dHJ1ZSIgaWQ9InNpZGViYXItYXJjaGl2ZXMtbW9iaWxlIiBjbGFzcz0ibm9i
b3JkZXJpdGVtIGxpc3QtZ3JvdXAtaXRlbSBzaWRlYmFyLWl0ZW0gc2lkZWJhci1pdGVtLWFyY2hp
dmVzIGFjdGl2ZSI+IAoJCTxpIGNsYXNzPSJmYS1mdyBmYSBmYS1jb21tZW50cyBmYS1sZyI+PC9p
PgoJCU1lc3NhZ2VzCgkJPHNwYW4gaWQ9InNpZGViYXItYXJjaGl2ZXMtbW9iaWxlLWJhZGdlIiBj
bGFzcz0iYmFkZ2UiPjwvc3Bhbj4KCTwvYT4KCgkKCQoJCgkKCQoJCgkJCgoJPGEgdGl0bGU9Ikhh
c2h0YWdzIiBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9oYXNodGFncyIgaWQ9InNpZGViYXItaGFzaHRhZ3MtbW9iaWxlIiBjbGFzcz0ibm9i
b3JkZXJpdGVtIGxpc3QtZ3JvdXAtaXRlbSBzaWRlYmFyLWl0ZW0gc2lkZWJhci1pdGVtLWhhc2h0
YWdzIj4gCgkJPGkgY2xhc3M9ImZhLWZ3IGZhIGZhLWhhc2h0YWcgZmEtbGciPjwvaT4KCQlIYXNo
dGFncwoJCTxzcGFuIGlkPSJzaWRlYmFyLWhhc2h0YWdzLW1vYmlsZS1iYWRnZSIgY2xhc3M9ImJh
ZGdlIj48L3NwYW4+Cgk8L2E+CgoJCgoJCQoJCgoJCgoJCgoJCgkJCQoKCTxhIHRpdGxlPSJTdWJn
cm91cHMiIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3N1Ymdyb3VwcyIgaWQ9InNpZGViYXItc3ViZ3JvdXBzLW1vYmlsZSIgY2xhc3M9Im5v
Ym9yZGVyaXRlbSBsaXN0LWdyb3VwLWl0ZW0gc2lkZWJhci1pdGVtIHNpZGViYXItaXRlbS1zdWJn
cm91cHMiPiAKCQk8aSBjbGFzcz0iZmEtZncgZmEgZmEtY2hhcnQtcGllIGZhLWxnIj48L2k+CgkJ
U3ViZ3JvdXBzCgkJPHNwYW4gaWQ9InNpZGViYXItc3ViZ3JvdXBzLW1vYmlsZS1iYWRnZSIgY2xh
c3M9ImJhZGdlIj48L3NwYW4+Cgk8L2E+CgoJCgoJCgoJCgoJCgoJCgoJCgoJCgoJCQkJCQkJCgkJ
CQkJCQkJPGEgY2xhc3M9Im5vYm9yZGVyaXRlbSBsaXN0LWdyb3VwLWl0ZW0gc2lkZWJhci1pdGVt
IiBocmVmPSJodHRwczovL2dyb3Vwcy5pby9zdGF0aWMvdG9zIiB0YXJnZXQ9Il9ibGFuayI+CgkJ
CQkJCQkJCTxpIGNsYXNzPSJmYS1mdyBmYWwgZmEtbmV3c3BhcGVyIGZhLWxnIj48L2k+CgkJCQkJ
CQkJCVRlcm1zCgkJCQkJCQkJPC9hPgoJCQkJCQkJCQoJCQkJCQkJCgkJCQkJCTwvZGl2PgoJCQkJ
CTwvZGl2PgoJCQkJPC9kaXY+CgkJCTwvc2VjdGlvbj4KCQk8L2Rpdj4KCTwvZGl2PgoKPCEtLSBN
b2RhbCBEaWFsb2cgZm9yIEF1dG9jb21wbGV0ZSAtLT4KPGRpdiBjbGFzcz0ibW9kYWwgZmFkZSIg
aWQ9InF1aWNrQWN0aW9uc01vZGFsIiB0YWJpbmRleD0iLTEiIHJvbGU9ImRpYWxvZyIgYXJpYS1s
YWJlbGxlZGJ5PSJtb2RhbExhYmVsIiBhcmlhLWhpZGRlbj0idHJ1ZSI+CiAgPGRpdiBjbGFzcz0i
bW9kYWwtZGlhbG9nIiByb2xlPSJkb2N1bWVudCI+CiAgICA8ZGl2IGNsYXNzPSJtb2RhbC1jb250
ZW50Ij4KICAgICAgPGRpdiBjbGFzcz0ibW9kYWwtYm9keSI+CiAgICAgICAgPGlucHV0IHR5cGU9
InRleHQiIGNsYXNzPSJmb3JtLWNvbnRyb2wiIGlkPSJxdWlja0FjdGlvbnNJbnB1dCIgcGxhY2Vo
b2xkZXI9IkdvIHRvIHBhZ2UuLi4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEwcHgiPgogICAgICAg
IDxkaXYgaWQ9InF1aWNrQWN0aW9uc0NvbnRhaW5lciIgY2xhc3M9ImF1dG9jb21wbGV0ZVJlc3Vs
dHMiIHN0eWxlPSJtYXgtaGVpZ2h0OjI1MHB4OyBvdmVyZmxvdy15OiBhdXRvOyI+PC9kaXY+CgkJ
PGRpdiBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW4tdG9wOjEwcHg7IGZvbnQtc2l6
ZToxMnB4OyI+PGkgY2xhc3M9ImZhLXNoYXJwIGZhLWFycm93LXVwLWFycm93LWRvd24iPjwvaT4g
dG8gbmF2aWdhdGUmbmJzcDsmbmJzcDsmbmJzcDs8aSBjbGFzcz0iZmEtc2hhcnAgZmEtYXJyb3ct
dHVybi1kb3duLWxlZnQiPjwvaT4gdG8gdXNlJm5ic3A7Jm5ic3A7Jm5ic3A7PHN0cm9uZz5lc2M8
L3N0cm9uZz4gdG8gZGlzbWlzczwvZGl2PgogICAgICA8L2Rpdj4KICAgIDwvZGl2PgogIDwvZGl2
Pgo8L2Rpdj4KCgoKCjxzY3JpcHQ+Cgl2YXIgcXVpY2tBY3Rpb25zRGF0YSA9IFsKCQkKCQkKCQkJ
e25hbWU6ICJHcm91cCBIb21lIiwgdXJsOiAiaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUifSwKCQkKCgkJCgkJCXtuYW1lOiAiVG9waWNzIiwgdXJsOiAi
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWNz
In0sCgkJCXtuYW1lOiAiTWVzc2FnZXMiLCB1cmw6ICJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlcyJ9LAoJCQl7bmFtZTogIkV4cGFuZGVk
IE1lc3NhZ2VzIiwgdXJsOiAiaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZXM/ZXhwYW5kZWQ9MSJ9LAoJCQoJCQoJCQoJCQl7bmFtZTogIlBv
bGxzIiwgdXJsOiAiaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvcG9sbHMifSwKCQkKCQkKCQkJe25hbWU6ICJIYXNodGFncyIsIHVybDogImh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL2hhc2h0YWdzIn0sCgkJ
CgkJCgkJCgkJCgoJCQoKCQkKCQkJe25hbWU6ICJTdWJncm91cHMiLCB1cmw6ICJodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9zdWJncm91cHMifSwKCQkK
CQkKCQkKCgkJCgoJCQoJCQoJCQoJCS8qIG90aGVyIHBhZ2VzICovCgkJe25hbWU6ICJIZWxwIiwg
dXJsOiAiL2hlbHBjZW50ZXIifSwKCQl7bmFtZTogIkZlZWQiLCB1cmw6ICIvZmVlZCJ9LAoJCXtu
YW1lOiAiWW91ciBHcm91cHMiLCB1cmw6ICIvZ3JvdXBzIn0sCgkJe25hbWU6ICJZb3VyIENhbGVu
ZGFyIiwgdXJsOiAiL2NhbGVuZGFyIn0sCgkJe25hbWU6ICJZb3VyIEFjdGl2aXR5IiwgdXJsOiAi
L2FjdGl2aXR5In0sCgkJe25hbWU6ICJZb3VyIFBlbmRpbmcgTWVzc2FnZXMiLCB1cmw6ICIvcGVu
ZGluZ21zZ3MifSwKCQl7bmFtZTogIkFjY291bnQgTG9naW4iLCB1cmw6ICIvYWNjb3VudCJ9LAoJ
CXtuYW1lOiAiQWNjb3VudCBQcmVmZXJlbmNlcyIsIHVybDogIi9hY2NvdW50P3BhZ2U9cHJlZnMi
fSwKCQl7bmFtZTogIkFjY291bnQgU2VjdXJpdHkiLCB1cmw6ICIvYWNjb3VudD9wYWdlPXNlY3Vy
aXR5In0sCgkJe25hbWU6ICJBY2NvdW50IElkZW50aXR5IiwgdXJsOiAiL2FjY291bnQ/cGFnZT1w
cm9maWxlJm1lbWJlcl9pbmZvX2lkPTAifSwKCQl7bmFtZTogIkFjY291bnQgTm90aWZpY2F0aW9u
cyIsIHVybDogIi9hY2NvdW50P3BhZ2U9bm90aWZpY2F0aW9ucyJ9LAoJCXtuYW1lOiAiQWNjb3Vu
dCBPdGhlciBTZXJ2aWNlcyIsIHVybDogIi9hY2NvdW50P3BhZ2U9b2F1dGgifSwKCQl7bmFtZTog
IkFjY291bnQgQm91bmNlcyIsIHVybDogIi9hY2NvdW50P3BhZ2U9Ym91bmNlcyJ9LAoJCXtuYW1l
OiAiQWNjb3VudCBCaWxsaW5nIiwgdXJsOiAiL2FjY291bnQ/cGFnZT1iaWxsaW5nIn0sCgkJe25h
bWU6ICJGaW5kIGEgR3JvdXAiLCB1cmw6ICIvc2VhcmNoP3A9U3Vic0NvdW50LCwsMjAsMiwwLDAi
fSwKCV07CgoKCUluaXRBdXRvY29tcGxldGUoInF1aWNrQWN0aW9ucyIsIHF1aWNrQWN0aW9uc0Rh
dGEpOwoKCWRvY3VtZW50LmFkZEV2ZW50TGlzdGVuZXIoJ2tleWRvd24nLCBmdW5jdGlvbihldmVu
dCkgewoJCXZhciB0YWdOYW1lID0gZXZlbnQudGFyZ2V0LnRhZ05hbWUudG9Mb3dlckNhc2UoKTsK
CQlpZiAodGFnTmFtZSA9PT0gJ2lucHV0JyB8fCB0YWdOYW1lID09PSAndGV4dGFyZWEnIHx8IGV2
ZW50LnRhcmdldC5pc0NvbnRlbnRFZGl0YWJsZSkgewoJCQlyZXR1cm47CgkJfQoJCS8vIGNoZWNr
IGlmIHRoZSB2aWV3aW1hZ2VzIHZpZXdlciBpcyB1cAoJCWxldCBlbGVtZW50ID0gZG9jdW1lbnQu
Z2V0RWxlbWVudEJ5SWQoJ292ZXJsYXknKTsKCQlpZiAoZWxlbWVudCAmJiBlbGVtZW50LmNsYXNz
TGlzdC5jb250YWlucygndmlzaWJsZScpKSB7CgkJCXJldHVybjsKCQl9CgkJaWYgKGV2ZW50Lmtl
eS50b0xvd2VyQ2FzZSgpID09PSAnLycpIHsKCQkJaWYgKG5hdmlnYXRvci5wbGF0Zm9ybS50b1Vw
cGVyQ2FzZSgpLmluZGV4T2YoJ01BQycpID49IDApIHsKCQkJCS8vIEZvciBNYWMKCQkJCS8vIENo
ZWNrIGlmIENvbW1hbmQgKGV2ZW50Lm1ldGFLZXkpIGlzIHByZXNzZWQsIGFuZCBlaXRoZXIgT3B0
aW9uIChldmVudC5hbHRLZXkpIGlzIHByZXNzZWQgb3Igbm90CgkJCQlpZiAoZXZlbnQubWV0YUtl
eSkgewoJCQkJCWV2ZW50LnByZXZlbnREZWZhdWx0KCk7CgkJCQkJc2hvd0F1dG9jb21wbGV0ZU1v
ZGFsKCJxdWlja0FjdGlvbnMiKTsKCQkJCQlyZXR1cm47CgkJCQl9CgkJCX0gZWxzZSB7CgkJCQkv
LyBGb3IgV2luZG93cyBhbmQgTGludXgKCQkJCWlmIChldmVudC5jdHJsS2V5KSB7CgkJCQkJZXZl
bnQucHJldmVudERlZmF1bHQoKTsKCQkJCQlzaG93QXV0b2NvbXBsZXRlTW9kYWwoInF1aWNrQWN0
aW9ucyIpOwoJCQkJCXJldHVybjsKCQkJCX0KCQkJfQoJCX0KCX0pOwoJZnVuY3Rpb24gVXBkYXRl
U2lkZWJhcihpZCkgewoJCWNvbnNvbGUubG9nKGlkICsgIiB3YXMgY2xpY2tlZCIpOwoJCXZhciBz
aWRlYmFySXRlbXMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCcubW9iaWxlc2lkZWJhci1p
dGVtJyk7CgkJc2lkZWJhckl0ZW1zLmZvckVhY2goZnVuY3Rpb24oaXRlbSkgewoJCQl2YXIgaUVs
ZW1lbnQgPSBpdGVtLmdldEVsZW1lbnRzQnlUYWdOYW1lKCdkaXYnKVswXS5nZXRFbGVtZW50c0J5
VGFnTmFtZSgnaScpWzBdOwoJCQlpZiAoaXRlbS5pZCA9PSAibW9iaWxlc2lkZWJhci0iICsgaWQp
IHsKCQkJCWNvbnNvbGUubG9nKCJtYWtpbmcgc29saWQgIiArIGlkKQoJCQkJaUVsZW1lbnQuY2xh
c3NMaXN0LmFkZCgnZmEtc29saWQnKTsKCQkJCWlFbGVtZW50LmNsYXNzTGlzdC5yZW1vdmUoJ2Zh
LWxpZ2h0Jyk7CgkJCX0gZWxzZSB7CgkJCQlpRWxlbWVudC5jbGFzc0xpc3QucmVtb3ZlKCdmYS1z
b2xpZCcpOwoJCQkJaUVsZW1lbnQuY2xhc3NMaXN0LmFkZCgnZmEtbGlnaHQnKTsKCQkJfQoJCX0p
OwoJCXZhciBzaWRlYmFySXRlbXMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCcuc2lkZWJh
ci1pdGVtJyk7CgkJLy8gcmVtb3ZlICdhY3RpdmUnIGNsYXNzIGZyb20gYWxsICdzaWRlYmFyLWl0
ZW0nIGVsZW1lbnRzCgkJc2lkZWJhckl0ZW1zLmZvckVhY2goZnVuY3Rpb24oaXRlbSkgewoJCQlp
ZiAoaXRlbS5pZCA9PSAic2lkZWJhci0iICsgaWQpIHsKCQkJCWNvbnNvbGUubG9nKCJtYWtpbmcg
YWN0aXZlICIgKyBpZCkKCQkJCWl0ZW0uY2xhc3NMaXN0LmFkZCgnYWN0aXZlJyk7CgkJCX0gZWxz
ZSB7CgkJCQlpdGVtLmNsYXNzTGlzdC5yZW1vdmUoJ2FjdGl2ZScpOwoJCQl9CgkJfSk7Cgl9Cjwv
c2NyaXB0PgoKCgkJCTwvZGl2PgoJCQkKCQkJCTxkaXYgaWQ9InNjcm9sbC10b3Atb3V0ZXIiPgoJ
CQkJCTxkaXYgaWQ9InNjcm9sbC10b3AiIGNsYXNzPSJzY3JvbGwtdG9wLXdyYXBwZXIgaGlkZGVu
LXhzIj4KCQkJCQkJPHNwYW4gY2xhc3M9InNjcm9sbC10b3AtaW5uZXIiPgoJCQkJCQkJPGkgY2xh
c3M9ImZhIGZhLWFycm93LWNpcmNsZS11cCBmYS1mdyBmYS0yeCI+PC9pPgoJCQkJCQk8L3NwYW4+
CgkJCQkJPC9kaXY+CgkJCQk8L2Rpdj4KPHNjcmlwdD4KCSQoZnVuY3Rpb24oKSB7CgkJJChkb2N1
bWVudCkub24oJ3Njcm9sbCcsIGZ1bmN0aW9uKCkgewoJCQlpZiAoJCh3aW5kb3cpLnNjcm9sbFRv
cCgpID4gMTAwKSB7CgkJCQkkKCcuc2Nyb2xsLXRvcC13cmFwcGVyJykuYWRkQ2xhc3MoJ3Nob3cn
KTsKCQkJfSBlbHNlIHsKCQkJCSQoJy5zY3JvbGwtdG9wLXdyYXBwZXInKS5yZW1vdmVDbGFzcygn
c2hvdycpOwoJCQl9CgkJfSk7CgkJJCgnLnNjcm9sbC10b3Atd3JhcHBlcicpLm9uKCdjbGljaycs
IHNjcm9sbFRvVG9wKTsKCX0pOwoKCWZ1bmN0aW9uIHNjcm9sbFRvVG9wKCkgewoJCXZlcnRpY2Fs
T2Zmc2V0ID0gdHlwZW9mKHZlcnRpY2FsT2Zmc2V0KSAhPSAndW5kZWZpbmVkJyA/IHZlcnRpY2Fs
T2Zmc2V0IDogMDsKCQllbGVtZW50ID0gJCgnYm9keScpOwoJCW9mZnNldCA9IGVsZW1lbnQub2Zm
c2V0KCk7CgkJb2Zmc2V0VG9wID0gb2Zmc2V0LnRvcDsKCQkkKCdodG1sLCBib2R5JykuYW5pbWF0
ZSh7CgkJCXNjcm9sbFRvcDogb2Zmc2V0VG9wCgkJfSwgMTAwLCAnbGluZWFyJyk7Cgl9CgoJaWYg
KG5hdmlnYXRvci5wbGF0Zm9ybS50b1VwcGVyQ2FzZSgpLmluZGV4T2YoJ01BQycpID49IDApIHsK
CQlsZXQgZWxlbWVudHMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCdzdHJvbmcuY3RybG1l
dGEnKTsKCQllbGVtZW50cy5mb3JFYWNoKChlbGVtZW50KSA9PiB7CgkJCS8vIENoZWNrIGlmIHRo
ZSBpbm5lclRleHQgaXMgImN0cmwiCgkJCWlmIChlbGVtZW50LmlubmVyVGV4dCA9PT0gJ2N0cmwn
KSB7CgkJCQkvLyBDcmVhdGUgYSBuZXcgImkiIGVsZW1lbnQKCQkJCWxldCBuZXdFbGVtZW50ID0g
ZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgnaScpOwoJCQkJbmV3RWxlbWVudC5jbGFzc0xpc3QuYWRk
KCdmYS1zb2xpZCcsICdmYS1jb21tYW5kJyk7CgkJCQkKCQkJCS8vIFJlcGxhY2UgdGhlIG9sZCAi
c3Ryb25nIiBlbGVtZW50IHdpdGggdGhlIG5ldyAiaSIgZWxlbWVudAoJCQkJZWxlbWVudC5wYXJl
bnROb2RlLnJlcGxhY2VDaGlsZChuZXdFbGVtZW50LCBlbGVtZW50KTsKCQkJfQoJCX0pOwoJfQo8
L3NjcmlwdD4KCQkJCgkJCQoKCgkJPC9ib2R5PgoJPC9odG1sPgoK

--------------9e3XMyJkz4EWD8LAt0cLeKPl--

--------------YRO0VhRE0cF2GsUiGPMemWdm--

