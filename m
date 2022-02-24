Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B10C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:52:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.28])
 by mx.groups.io with SMTP id smtpd.web08.12122.1645717932527159570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=fbS4Qo5t;
 spf=pass (domain: outlook.com, ip: 40.92.75.28,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQKffoeQGOqQkTcebjymOtmJIVguk9J1r1/CzypRHdb3+AHcwwvVwuok1tmocYxggJRWvoZFLMCWR8d/6sDksX41U+yw3+hkVjtvpkquItOMchAquTkgsekvWq9olnvQLImEuTB4CRm3Kpbii8cmvKXAG0jYAkyjI+MFE7ki3BCKXrfRvRgd7aHKdjAfQ1do+QNrwRw+qrxDJMeGPZYkm8L6mMrUy1Q3LaWfN6+GLD4nxBZ674t1aNqR9OVNSJCM1P8Ljl0XDcnuy2AvLtagw1VN7veV85mG71UpI+C7TvGgkoxIohT+cklmsgsDIIeRrn5b0wN8fwwynBaB0xBajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lGir+FpMknTfFACjEs6Z9JnOioaIIiQAJI/uBvKkTs=;
 b=EdGC6P+o302s+nawaGkdy8HnIzbSOjeawm0gJczw8XNm3iR75aaG8JiyjoK5l6f8RjEu3QXKRH3yR76e5//35X9PyW3OO3xMaKtUM2J5cyZS5VOLaTfQqRxmu6j8Xaa/wFQ5IcdRWJebwLvm2I8JKspqIetlg+V2r+TVym2VcXxniRYClHVzD3LFpaIlyQWFdjCQisY8GORi70zb5eN4bdeUTmYJDJf50K2PcNPev7kyVbj+ios92NgOVPGICBrPK4atMOa0g+YqRHNTBjglcwEeGLq2LvaNUYgQUHHYsxAIWBgdIJMj5vDaVQcVx9EejMTnpysYBbmrR31IdC4A7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lGir+FpMknTfFACjEs6Z9JnOioaIIiQAJI/uBvKkTs=;
 b=fbS4Qo5tLBzhZqr2s59Euw+7q2GXxmJn8TjjnMy83pGbeZjxrjOCeFPmXR7eAx1khGGOWj0oDSzzTZmHqv8gF8c3JDcfKXjM4n/62HoUfGoeufCDZiXmR5IrEyeUBgkKWxB3n1e6n1o2/bZhPTTctl+tqDv7ErUXIIFv6Umfl2Lho3gjf7zmjWpBbQiNQKlgRMeBnbPOnPo6sOqmA7JbTQACBEPS7JFe6OIfO98MfM3NnXJpvkjqJlY1K6nsI25tFu+ehdOzH1GqzD6gkrto3sqmC6BB459D/4PJHV+n8IdILEQARok/tTpNJ/g5rMuAuQctoZuMSdPjL/VE3BFz1g==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DB8PR09MB3578.eurprd09.prod.outlook.com (2603:10a6:10:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 15:52:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 15:52:07 +0000
Message-ID: 
 <AM9PR09MB46421D2885F301ED19EF4338A83D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 24 Feb 2022 16:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3 00/32] Python PEP-517: build wheels and
 install with pip
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1645557032.git.tim.orling@konsulko.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [7oftdfYVfJrUqFapCqJ+DDU/PCWbbwVjQ8LFpoJKfaQuM4nLes+mPChcR8qM0orU]
X-ClientProxiedBy: AS8P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::14) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <594f6a88-d689-f10b-8c4a-10961dae91fb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 066891cf-7d49-4b37-0ccd-08d9f7ad9c5f
X-MS-TrafficTypeDiagnostic: DB8PR09MB3578:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rsanwRardMG8DSYbvMP7nkEiK/VhWE1Wm7o2Yw7YYAnKmDDqDZCV766P8ZYfLoDnD/V5w8WlwQaF8nL9Rz1/NqlcaBSDNLAPFYd8rcoxW58xdafCvKazmCTgxGp5nW2I8JZdgDTjJG+Fz+B2X9dMzN+KDdz65xz/VZ2x8HZclHlM4hOoL++1TCpjzAggRkoG/VBWoovzFcFLOC5vOV4OWPZIf8sX/CAwNq1F7uIXm+bvEkup3rkxYAzKf/jaQzxJToCHrEWC8GilXbtC8WBs+jhz//iqZACoNpZeJGl7EMWb/AuNVOpifOVZPSCGM2mboX98VJ6VvShoT3TW+T5d1BEwhmKsTha8RB8rFBqC41ZjSXUBsYnDhB31+Zy1k4DRou8BGdypocQkeegPJXMneFsq7OQDXps/vo8g81x9cyd2fl0qV99IDJrTIEmgnViu9NiAc9ScK4I1KaajfrDyzMD5lpFi8xkKjiBwN5SK7SRiVOjQhRpS8rrGPg0K09dxELaf7S4ry2L8qTQBOn6hwO8d/0282zmn5wtIXCXNPTYrCM0FbQbz+PBBNvzHL8L7/jldS84mpGYz66uwyFv0OA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zm1UbndVTTFmSEtpVkFDc2phcGV5azFzN3RZdVJNdU0zZnFGNVpmM2x4WFgy?=
 =?utf-8?B?TjJSZkpuUVBHOGVkdTlIa2hHSEdCa3l5blhDR0pEQlJiU3pTVTlUM0h0MDR5?=
 =?utf-8?B?bDhnY2h0U1B1Y2RZbkYzTzdYL3hkdXV4S2FDOFptbWJQSXJRcmtrUEsvNHJv?=
 =?utf-8?B?dExkZ3BKTTNxWmFCZGJ1YWJXL0xSNzBMTGNsSGdoN1lOWkh2cUtLSW1SMzY4?=
 =?utf-8?B?dmlVeTYvM2Zxakw4bWJGMFBaMFhyaDlOZjdMMEI0aEFiWHJMYkJuVEtidUwy?=
 =?utf-8?B?RHllY1FmcVlzZ3h3a1RFZXRTOFYrcGNES3RWWXpVcmF2YkJZTXlCQVlYMWZ4?=
 =?utf-8?B?UFJEZlVHYnJvdExYVTRIS1VGL2YvYTAzM3pudEJqWnpBTC9Zb3VUUHFHVXhB?=
 =?utf-8?B?VDFzYURkdHVEVHZ6N3YyKys3V2M5bmIxYWZQME5tamVZRGEvRmgveDJqQmpz?=
 =?utf-8?B?YVJDWHYxeEpXUFF4b1JYYlhnNDNDWnJQdklkNWNaRVVJN1JId2VHUlNGWEVz?=
 =?utf-8?B?ZG5ibDZBa3FOWGNHdko2ejFBK3VTMTNMMlRBc29nTnh1KzY2T2k5UXZZZ1pS?=
 =?utf-8?B?RnZyZ2NpbzlNaVdWNlNnRzZZV1Zna1RVV3BJYlgzQWZ0dVlEQUJYQ0laVmpY?=
 =?utf-8?B?OHVmOXhKRjJxNHdHd1I1MXlXcFZ2NEdGcVBiL0Zlb3hERXpQdnNZNnJQWnFj?=
 =?utf-8?B?TnlFSFhTR0hGZTV4SkZqdlBuNnJNNWdJRVA3c0N6VEdFa1VOU2RZc1U2ekxt?=
 =?utf-8?B?elVzY05mN0M0eFVuNmNKcklUNUUyNWgrZXgwcitxdUxiUUNDSzA5RU1udVFq?=
 =?utf-8?B?MXF6bnNXZzFneTF3dnZIMEVmT2dubmE3UUl0OXlZM1p2TjdheHBpVnJROHBi?=
 =?utf-8?B?citMZ1ViTUpEcTJZdzNhQnJnUXhXUE9JRGFQcGZzOWhFMXJNWlhDcG1MUTB5?=
 =?utf-8?B?VlN5c1Y4MjhrNERRWTZjWGVicDlXQzdwTSt1aWlXMVpVTGtpRS9raFVYYmpO?=
 =?utf-8?B?RzlSczRqcVNiSlE1czAxNFY2U0VqNWw0alcyWEFJbEo5aHNKZVNHVkdGenVR?=
 =?utf-8?B?NXRWQnR5VG9CTFRtUktFSFpZWjF6VkViVUx6YnRLQTBTUllnQm9mandISnZ3?=
 =?utf-8?B?QWNPbnhmQ3N6bjM0STlyWmxqYVY4czFXeUlJSWd2b0pHdUtiY0l6TFhRSFV0?=
 =?utf-8?B?UlBrdXR3V3dJV0w3azRvRkYxajNPRUN3N1VVUk1aWWNOTTBrRXRsRUZUTFQ4?=
 =?utf-8?B?SE8rL1RIaXFSV09QNmVBK09DczdaMUFXTWVLdEszYmYvbHZVbU9YSjBLdFMw?=
 =?utf-8?B?NHg0WmY2S08rQWRUSGFXaTcybmdEd2ozL2xWZXIxM053c3VadGtraURiQzJv?=
 =?utf-8?B?UExzUUNSU0pwR3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 066891cf-7d49-4b37-0ccd-08d9f7ad9c5f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 15:52:07.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:52:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162325

I got a kind of general question about this patch series and all the 
followups: is this still considered to go into the next release?

I'm a bit worried about the fallout of this pretty invasive change - 
even though I see that at some point it needs to be done.

My understanding is that the "classic" way will stop with Python 3.12, 
which doesn't apply to next LTS release - as this will likely remain on 
3.10.
Only downside will be that manual helper files for updates of packages 
that are lacking a setup.py needs to be provided (there are already a 
few examples how to do it) - not a big deal if you'd ask me.

So what's the stand of the project regarding this issue - also keeping 
in mind that I think it's already past feature freeze?

