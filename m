Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FBACA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:33:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.35])
 by mx.groups.io with SMTP id smtpd.web10.34505.1756974805951721275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZJBZp2KY;
 spf=pass (domain: cherry.de, ip: 52.101.83.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCw9D1laJcAuPvDSe9bDGlkew0otC3dVKQMLRJUixKPNahuDBEu9qfLNVm52ieWrL/y/jEw8p2LGLdGaJ9rmT/cH6SqnRup67xxKsUPxKAtoBo9hge58Px0E0pDrlqF48lEjLKN2+LTl5u77cRqFfh8V/6rFqher2VM6syNTygajIYA1cQ7iA6gW6LRmOnCG3g5ZELz1nuraQLVk49eoVHPjy5xI6XOb/fOK6RF/nmZqwgy33TqjwJx2CJIazlLCSUxtSnkB6r/NUU+JGmA6evfymMhZjjHWTv/MkZBXq7bQZDzWRL7z4S8ovFVUedASfzi4wLEAgLTYVkPR5Jh/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYgOzKupqsDmwlOkc1cuy7ykDRXQObDfeocF+OoxmnA=;
 b=IRYCkPlYDxh/2WzDcc1bOxiqFF/dzBTUhij4J969XOi6LGTpJ19J1ba9gPI36mITEZ6yQ+PeY+NJAmRz8XzpNmrKCZiwDaoAr/yKhaMrE3BdK2p3CnsfW5LeN+haVOlxTD3F1J3aUJDPgt3FfFv3XrpNaktT9g+h3J0+ztzZpd5IfsaVlQUi1PlFVH7fXxHpjHIGU7qEmRp6Z6MHZLCnD7FY0FL+e2HtaAjcBJjwC7j6qSYcd67rIPB/68PyX9lXTJClPDmI5H8Yme95O84qJOkyy/iXIE9orBPvKmYty4WFdIBmn/dK5ioOwvDOqtOwjdjd9g6RTX0LHXgQ8/luSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYgOzKupqsDmwlOkc1cuy7ykDRXQObDfeocF+OoxmnA=;
 b=ZJBZp2KYqkdHxx6YFkIJT6I0a+TTlZ83ARjxJFlcaePP6s6Jywg5ixvbvsxZ+hiH2vvQPZcbotPvEfYj//P9FzS6peREJ2tkoxXLkiXLmwDwwCWhfhDIuz/zNMq/Zlq2T0giBsn4fp3Rnp9i6IkLeuZwgKcx8kFhwVj6Ksn9i4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8944.eurprd04.prod.outlook.com (2603:10a6:102:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 08:33:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 08:33:21 +0000
Message-ID: <d9b39dcf-2703-4020-a43e-e182ed6a2cb3@cherry.de>
Date: Thu, 4 Sep 2025 10:33:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
 <b309bed3-501f-4bbc-a95a-f0f2e44e7bed@cherry.de>
 <DCJSJ2XDAYRQ.O73EFFHWIDLZ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DCJSJ2XDAYRQ.O73EFFHWIDLZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e9565d-7c9d-4e71-69c6-08ddeb8db4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzhOTWYvUlM2cDQ4UitNTE1jWGZ0WUpQbnNleCt6bExseSt1Y1Npc0YwZ1BY?=
 =?utf-8?B?bzMzMXl2VWRQbnpWOWFrZVNvZXF3d3lBWGFhakJ4bG0rNCs2cmtTOFhYazQ4?=
 =?utf-8?B?MjR4V2ZjREF1bll4d1M1bXFNRkZuUjNzN3ppQXBaQitaVnI5NnkwV2hJY21a?=
 =?utf-8?B?TjdyOFN0SUlmbVg2THo1ZmF5a0I5d1F1anNISnMvQ3o3c3k3WjdPUEhKaXFh?=
 =?utf-8?B?S1NsNFlQckY3UEZ5Q09NZ2NCRlZHVEhUNXovRGFwaTE5ZHVsK3RCM2NqaU5G?=
 =?utf-8?B?VnlFaG91bmdGNmN3Vi84QTVqTlJEeUx2aHBWZjZEY3BOWVhUOFhFUWpBTkdE?=
 =?utf-8?B?aGZydnFRbTBsbmlqT0VKbDdLTXRFWmdXNnJPVng2Mm12eStEMnUzcTJ3aTdk?=
 =?utf-8?B?VFJxQ1FoZ1JsK1FSTlJhVjRNRTNzSjIwRkkyVXcrOE4yTmtCSlJjRmpMUlcx?=
 =?utf-8?B?QW5XZWY4VkpZZnJrRmw4Y21yTDZrVEplMVIyZWFxWDRPTHFqblZZYnhmN1pp?=
 =?utf-8?B?ZHlzRU1aNkI2anUzYytibU1Pb3RzOVk3UFBXUGNadlRMa0ZnanF2YTFhQXRu?=
 =?utf-8?B?SzdzMkpsTEFFU25aejlJMEJNYkZFbThmR1V6VDhLZ0Vsa3hKUlpsNU9yTDkx?=
 =?utf-8?B?TGxHTGtFVU05MkpNYnpTWUZjVjBoWitlTmJ6Q3A3QTcwWXUrVFJaRU5oakx4?=
 =?utf-8?B?bzR3WHNiN3QwSHFxelJodjJjV091VW5IczZkTnpXWlZEMjNGYXF3S21OZG5I?=
 =?utf-8?B?Mk11OHh3eHFGc0w0enA3c0lmUzBEMEZYUWwzak11aFprNFFveXBlbllxQ084?=
 =?utf-8?B?ejVSUlNGNk5pdTBtdWlDWW1Lb1lITDZaczc4d0hmUkRqdS9PUHpzbkJKN0Iz?=
 =?utf-8?B?YkFFbXlZc05RQmJkKzJmb2VaMzhwRDJRdnVhTCtJb3prWHZ5R29sUSs1Sm9W?=
 =?utf-8?B?WmgrT2Z1N2Znb1JhVmc1ZWRJK01WaHIvckh6YWUvamZCUERpZjZZWll0WjlJ?=
 =?utf-8?B?K293UzQ4NEU2RjVUVzNzNTh0N29kQ2lFU1l2UTB1RGE2Rm5GNThuVTAwR2V4?=
 =?utf-8?B?aUJYUDR1TFFHWkhiS0NmZjNJTC90M3QwNE1yMlpjZnkxMktWR09GcUJaNWw4?=
 =?utf-8?B?akZFWG1vckFSTUpOd1RyTFg4R3VrTjZlV2VmcHBQckZsRzlJZjNBU1ZaTWla?=
 =?utf-8?B?TkxvMFAwQ1N2VVVsbC9na08xTitsMFVxYVZpcnpkejVIR1NnTzBtNE0vVlh4?=
 =?utf-8?B?Y3hJWndaR0MwQXA2UUdENzZFcHJVUW11cTJRK00vTjBwL3hRTDJqakpoaGtV?=
 =?utf-8?B?b09Bc2I1RElhcXFyUG11WEhFWkhIY2k0Uk5BaXp6RFVnZFFmOEMzbnlPN203?=
 =?utf-8?B?TVVkRDJCSS8xRFFyU1ZpVEZuVDBIYjhkNkdDYzhXR0pFOU9hc3hUYjBySzA2?=
 =?utf-8?B?WGFFWkwzOUxhcHQxTGpjd3VQekR2M0xjZUtsdUVGNU5KM01EdFlkSGwxclpU?=
 =?utf-8?B?NnlzcHh2NmpRNE8xVmt0azFscGkrR2dHNWxnMXhabWg4eGY1SVpLUDNzeGdz?=
 =?utf-8?B?WThpT0FWQ0ZLOHlQNVJya0JTVTl1SDdydjJJUHZIeXJlUTlhQXRZYkNIMzZs?=
 =?utf-8?B?Z2N6eHdqZGtCdnFPMUlUZkQ4ZWpBWTFpRk95MFMxdlBzcnBVNit3aHZUZmE2?=
 =?utf-8?B?QVZIYk1jZHcrQzh5WCs1Y3lQbDZTQktxK1BpRCtpcys1ZHduNnB0a2QyU2JZ?=
 =?utf-8?B?QmFCSUltS0Z2RktoVlV0NHVnMk92VzREVzZYZjN1bXV0RTA3S05Yb283cDBN?=
 =?utf-8?B?bmVzRlpYb3l0NFQ3VnNBaTBIMzlQQ0R1Z0pYT1ZjaFVpbTdSZ3VwejN6SE1M?=
 =?utf-8?B?NWhEeWZtRGtCTDgrSUNSVlVDbCtVUTdMRktSWSt5ei96UHZlbENsdHRlYkJU?=
 =?utf-8?Q?GdHFmdV49TM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWRXSlAxaVdza1hGdnhodGNYVXVBVm9DZElPTktNenluSzRqUzdWczhCcXRH?=
 =?utf-8?B?Ymt3TUUycHA1bHNHbElDM3JHdlRrKzkvWnoyTUEvQ1JQQUlsV0FGcUpwVTZO?=
 =?utf-8?B?SGIxdG9ZSzBiTW5Ga0dpeFdZVEQxdVUyUDZ0RU5yMXA0Q2p6ZjZHaGhHSXpY?=
 =?utf-8?B?bU5ITFlKdFUxbURubXVKUEpKR0REV290RXcrL1BwNHVHTmY4NG4rNGt1ZXBZ?=
 =?utf-8?B?WHNvcnppUlNidGVGMHBWMm1IUkVmMnpHVmpCQ1ByeTNZUmNhdTNKc2IrWE4x?=
 =?utf-8?B?QlpqTmdDRmpoY1BObTZQYXdxUXl5ekhqYjdFN3lwT21sTmE5RUs0OEF6aktY?=
 =?utf-8?B?VnVYWVVVa1Z0WGZlSHNYcTFyUmF1dUhpaW45T1JzdUx1SVpMeVJyeGZJZk1S?=
 =?utf-8?B?LzNsYzIrWGg5OGZUTmd3TVpNbG9tVXl4NVIrYjBxU0xKT3pScHpxYUFvdmMw?=
 =?utf-8?B?WUttSFZxaWdsSHVlekV5RHJkS2NxblZpbGRhdGxYZFBQSzZ0ZS9sMXFVS1B4?=
 =?utf-8?B?MitKQ1EyTzFOVkdvODQxR2JtUjJiNVMxSVpUaEZwVU1DZW45U3VUcmwvRnVJ?=
 =?utf-8?B?dE9KSDRsZ2VvZ0l1cldxa0puQTZvcXB5alkrb2tGa3U0b25semhFL3BldEdD?=
 =?utf-8?B?VW95ZkFTV2NRamNiYVUwMHZRVVU2Qm9pcVoreHh2TDcvYUtBS3JVLzhoVUZy?=
 =?utf-8?B?bDRrZmx3SDVaanFxbjZuc3N3K3VWSTUxbnJtUmxPS29ObitESHlTUHJjYmRQ?=
 =?utf-8?B?QVYzUjlvdFNSSUVTTlJBaVViZjlBZHkxYmV1NHBlemRjUVJxc1Jrc3R5VjE1?=
 =?utf-8?B?M1luelVvNWlnSEpXNlU5S0ZpNDd2dlZ1am01KzgwVHhLaUJYZGR5aHFhak9F?=
 =?utf-8?B?RVlrTGVtenVBMC83SU43OWpIaUxDRXpPS1ZrRDcvTzdUbktuOVJpa0xCVUl0?=
 =?utf-8?B?eFFBWkJpSVRHYWgwS3J2b1B2Zk1uNVQyaHI5MmhmdXhYYUFCeWlmV2hFdFkx?=
 =?utf-8?B?TEJFVnNOTkFBRE5aM1FaWXN5dHVUVDlUK0NqblhnY1F3T0ZtblRFejQ1T05P?=
 =?utf-8?B?VnpPaGtMUkhiRnozWm83Rm1FUnphenpRTWk4MHdXY0FienBOWVFFVjdvWkJV?=
 =?utf-8?B?MzR0Q0xVSHRVcDZ2ODBzaFZYZ3QvTUpGNHJ2dno0STVXZzFmTEhMY2FYbDB3?=
 =?utf-8?B?K3BRd3k5VlBjVEczbGtuYktEZTRDRVBiT1ZTVEl3N1hRb2cwQXQ3a24wK29O?=
 =?utf-8?B?azI1N200YWc1dHNKUVhzNDBJVlRCR0J2Y2F0WDFMUWhHWVl3WG0wZUszOEoy?=
 =?utf-8?B?dWtseExRcFpSUTlxV05VREpJN08rbVhVQ2U5RGRka2hHc1oxN0Fkb21zem95?=
 =?utf-8?B?bGc4MmVOZkE4Q0hObzRvNW1kTTJVc0txQ1lwRUdzT3c4NFJwVWM1VW9yeFJR?=
 =?utf-8?B?dWF2SWZmR1h0SmdmUURRSFMxeW1XOGkyQ1MrSVFabWxDbFc4bkRMRlZFZzZ1?=
 =?utf-8?B?Q2hCZUx3a1phb3lOZHp2azVON0tEd01FZ1dZalZYRTNQd1dRUDJlaGQ1aS8y?=
 =?utf-8?B?THF1SGRKUkt3Z2s4dVRpNW42QmVYdGRtbGVSV29LU00xSWcvc2xkdUNWTnhP?=
 =?utf-8?B?OE5OeDE1ejF4WVc4VzhCa2Zrd1c5UTZTV1o5TllXdzlUREhSQk5saHN5ZlBT?=
 =?utf-8?B?SzB6MUttbTBQOWNaYU5tRE1HY1M0dGhMTVdZQnEzeUR6VHdNZ2UyWllqTmdD?=
 =?utf-8?B?WHpKS2hBTEV0NVRXMWhWOWx2NjVsZ0FkQjZXcjBleGxZZFl1NC9KY3M4VXhI?=
 =?utf-8?B?dERaZWl0ZzF1M1YweUs1L3hGYUJoSEFBU1VYcytma05BTUt0WU5PVGZkZGFv?=
 =?utf-8?B?UlBOTWJsV3lZcUYrdFVtc0I1MWplVGhRODV3cjdVRjhmRHdQNm54NU1kMFRC?=
 =?utf-8?B?LzFZQWRkWVpReDJlRmRsSHNhc3pINUtvSHJFMm1FN3drV1U1aVJ5a01iRVhF?=
 =?utf-8?B?RG83RWpSazNTY1F5c2RwWDYzZWRYcmppd1BTWnZlU21yc0FEeHRzRFBVRXdQ?=
 =?utf-8?B?U2lPNWNaaEtnZ25vZEhtcDQ0Y3d0dksrcDVDUlNGNUpYY1dpYzVPcThvVjF4?=
 =?utf-8?B?UUU2bmdXZ1NvejhJcGtOajM4bDQyTEhpb0hGaTFpYUVBaU5wa1dYbGRoMDYw?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e9565d-7c9d-4e71-69c6-08ddeb8db4a1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:33:21.2445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+tlIRGDyKjYw4QP/nUD8JS/2a2xIgVrqSvNzSOzx2/F3fZdZOqUI2brIX2jgGNKn8T03ld2/VAUz0pJiSO7ScwuxLxM8ZI4A2BvUHbPr9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222907

Hi Mathieu,

On 9/4/25 8:09 AM, Mathieu Dubois-Briand wrote:
> On Mon Sep 1, 2025 at 5:16 PM CEST, Quentin Schulz via lists.openembedded.org wrote:
>> Discussing with Ross on private IRC chat, another option could be to
>> postpone patch 12 and merge the rest as they should work just fine like
>> that. Patch 12 is a build optimization to avoid building panfrost/asahi
>> drivers in mesa-native to be able to build panfrost/asahi mesa target
>> drivers with precomp-compilers enabled (which are enabled via
>> panfrost/asahi tools in mesa-tools-native), as well as only having
>> libclc dependency on the host and not requiring libclc PACKAGECONFIG to
>> be present in both mesa-native and mesa target recipes.
>>
> 
> Hi Quentin,
> 
> I just want to confirm, this series builds successfully on the
> autobuilder after dropping patch 12.
> 

Thanks, I guess I'll split this into two series to avoid holding off 
updates and cleanups then.

There's a 25.2.2 release that got out meanwhile so I'll respin this for 
a v7 when I have time.

Cheers,
Quentin

