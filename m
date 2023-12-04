Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3992FC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 12:48:31 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.72])
 by mx.groups.io with SMTP id smtpd.web10.68496.1701694101250428955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 04:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=ojGukUKP;
 spf=pass (domain: weidmueller.com, ip: 40.107.241.72, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isO9teCKkJUdFypy3h6D8oKOPSaAw2RZo8qIPJSgX5E5w0R+DycaswJuqv88jwQk0BQr2GJYAd0Ahkp5y+uYiR8eRlle2+usvFBCGpOUWua/mHf3hESe5K9D+e9mMGgXihjiBvXED2kvmcBs87qg/Qvy+eJRwDhgLy7UIZpIHiVkSF/kCNEHW88xVJ7GhGZOhpPIx2PLw/HRB1JhwnSO2P8LZydqtQ78IEAn1lXBUpUGPr21TVJF5JpNtBMD9Ggpj3/J4kyVygTNK2qPg1FSzW2yNZlQTCEHtb4Pawf2OQo1f3zhoF0sSlPh40J1/gvsUjyB6gBbRdn01DbHp3VAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGVdv2KbwbFc+9Hp76GM5wKgybb1rtzIWXrXHeNoO3E=;
 b=oQdcsETzrFQ+B8+1GvPx9vat1HWXnefbJIqTBAl5b+Z3Zp8hxQbekAvMZL2Ox1wYHgCJApYqqbe7MO5TgSLmXkn1Knhj72sJPG2mfKPGBld14pvrv6Ey/f4nadrD+ulCaitSmQFvISctpgFWu3q6jwiZ80b1gHRAcAxNuSwmSUEwefQ+KDKUFop2mPKOga++RlWRzeSELPeha0HMns8WAad+Lk0/CbeVGf0anA8Iev/Iu7vewnWFZBlHu1L1eagBHmRGrRh/C5Qb2J7QFAHKTQsL6oCs2Z01LaW62mnx/72m02ojnVDEl1zlruqlyKpevwYZY+Sf9mrG0l4zSpR0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGVdv2KbwbFc+9Hp76GM5wKgybb1rtzIWXrXHeNoO3E=;
 b=ojGukUKPUGuO/hsA/Ne737uvD6kk4tArnXogQFITLBJSyySFigjwe77epXFZLwG/lxfYjzDGTwb9gaL/YSviUsTL8rU05T8nkDhG2g2huWHYhOC2JrOOZjH/AZ/rRazB6waI+nioDpNPfxUn6FmPNzdaQ8CRkG0L2VZICJBUYGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DB3PR08MB8939.eurprd08.prod.outlook.com (2603:10a6:10:42b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 12:48:16 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 12:48:16 +0000
Message-ID: <abf061da-f67e-47ce-80b4-f6cc7879cc2e@weidmueller.com>
Date: Mon, 4 Dec 2023 13:48:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/2] patch: reduce changes during patch
 refresh
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
 <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org>
 <8ca92320-0ab3-4679-9de1-74f38ad0f8a7@weidmueller.com>
 <CANNYZj_kV6ZEnFa3-dnFQqhSUGUy7ZE6DyGU9fzqZwsKGw=6tg@mail.gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <CANNYZj_kV6ZEnFa3-dnFQqhSUGUy7ZE6DyGU9fzqZwsKGw=6tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::14) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DB3PR08MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: a0593cae-19a2-468f-fe3c-08dbf4c74934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q3ypN37pjFapXZzi3DR5VH0R2UCKJKdtVuz9vHOX8QuJE4Vjdu2rysfo8N3aspYUlm/95W3TiRpAxEyMA4a1pvdraTfdrNs+NFQJ3GXAPG538hZcAm5XtoZuxyVSX9k+o2k3nHof0urx1s18fmFfsL2R4MV7/4fFLedumIsLqQ0ws40dCXgQcpl9iCxvXQRp22b0NOj6hmo47pkIUhek/qJE9QbTswYLlFr5gIl7KCDKdvjz1jtV3Gow+uzOOcotYk/LMD6m46r8tcdkciT0/FdOhioQqU7LJdQjcb0EWHCNQHHA7eLhPQf5VInUsswv3rDgRUfjlNi2TBacPjYX9VHYrhCuC7rZIXPNkJtlqiUCw5f+wggFBWKBt1uHCXmW6ANCI1U3DK8/iJpH3Vp0hZVt3/XjSixZhw8xzHQUlZugE4luOovDCzjo3oDZVqAh34s8u/KRxdJ3Kh8SNem02b99OjqEfk+/MfU7bWXVOI2Dijk0aIuiu2JlTMUQdJ4pGSvFeUT65uIooG/egkisxfTES+namQCyhynwTs1m5AON0V89QM0In9J6Prc5xdhZHee0d/uJiJuVYpLccIQPHnmmrPFFJBPwHpi+xKnFz2sv/PUJcjqCw2jIgV1i5oupgcN89Lh3GxQEn6nlRWkraA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39850400004)(366004)(346002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(38100700002)(5660300002)(2906002)(53546011)(83380400001)(6512007)(6506007)(107886003)(2616005)(26005)(478600001)(6486002)(36756003)(41300700001)(316002)(66556008)(6916009)(54906003)(66476007)(66946007)(8676002)(8936002)(31696002)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnNlaDUvUzlDTk1GSC9tSmNIMEpDKzVLMTl5NXZ1c2thc2psSlBOTXFSZkds?=
 =?utf-8?B?UytIVmFPalZSQ29MQktRZVhGbUdnQS9pVkU1d0RRbEZXeDcvbUVxNmgvNkds?=
 =?utf-8?B?cHZoL1pWS05ZcFRCYzZzaGgrRmZ4UTE3Qkd5VDdHUVM2L2FoTFBoTWQ3WGh0?=
 =?utf-8?B?V0VmckZuVUE3WE9pd3VnUDY3NVk3R3VhYUp1RFZjRzBOR1hvN3dOYU5WQkRh?=
 =?utf-8?B?elBmZnJrV2s1THkvYUpJeU5DSWhwOWRmWkRkTmxqcG1Bb2ZZWTFDWHEwQlk4?=
 =?utf-8?B?bEVzQjlYY01SbzRPVGtTQlZqbVZibDhpVlo4Sy90cnB4eTlPWk9Id2ZLR01E?=
 =?utf-8?B?bjdReTJYZTZCc2xBbnVlNlhvc2ppSkVlRWwwYnRRLzNHcUVGeDZDOEVQRUNm?=
 =?utf-8?B?VWpTRW9ld1BEUGg3eUJsVWxUa015QUx3ZnZRTWJhNlNPeXN0cGxUZTdBZjAw?=
 =?utf-8?B?alpvOEsvajh6blpHNGRKbWdMZVYyWVAvTThxWlgyYmhXNDMyTENCbzRwQzky?=
 =?utf-8?B?TjJ6TTY4cHNUczVsWVVnelBLQmxvV0hUVzE3bU9vZDBXNi9mSXB5MWlmOG9U?=
 =?utf-8?B?RzJ4TUZPOWREMW51QmVmdzF5bDBrUGNSQ25vOXlsbXFodEo1cy9wcGZRQ2pD?=
 =?utf-8?B?dVIwc0ozTTRicDJaRHBxWUVKV1IwYTdLY0JKS2RMK2dOYjkwYWVNckpaaHhj?=
 =?utf-8?B?T2w2R3FCVDNOTXBuZWZIMzZrVTl2V0lGNUFoY2tDcWY3ZFkrYzBVZXpYejZV?=
 =?utf-8?B?MDVjV29DK1RvR0g0dFlEZ2Z2SDhqTFpZT1FpTGdUVTJiajJMOGpQWlBYUlF6?=
 =?utf-8?B?K0t0b2ZoN1lOaGwybDVTQ0VQdDk3RVl3cTNjWWl3UnluT0N4cGIzRjRIcU1Q?=
 =?utf-8?B?N0VtNTZrU0Z6YWRmMnhzQVJYejlHRzZRcHB5cHhEMUVqVDNtbEJuRGRmWHlY?=
 =?utf-8?B?ZSt1eTZseHRTUmRKTGREVnBCN1dpOGlraGNTUU9ERVArR29lK3lGT0JWaHU3?=
 =?utf-8?B?bHVLWVdqdDZ3bFlmdFhEOHB2RDJvZGQxTzgxVnJ5VXlxTHpUanR3WnJUdHlY?=
 =?utf-8?B?bUN5N3cvTzM5am5NRkZVSkxDMHduU1cxdy9ONmJWZmtZakFtNHlnU3dmTDBu?=
 =?utf-8?B?SmVjWllTV25LZDhLYjFYYXBkdDFXNExjOXFEaG1OdDYvWnBjYkorNGs2TExr?=
 =?utf-8?B?R21COXFhNFZmODRRdFQwNGJ0UTNGb0w5eDh1c1pISVZqUS90MFFZait3OHhm?=
 =?utf-8?B?YlNjekVyMjgrRHU1WDR4SnJubnkvRzB6ZXdqRzgyRXM3VnhuZncxN09QWk8w?=
 =?utf-8?B?TkNSb1VySGJ4MTFFdGI0RTFZMHdERXlRVTZON2JSKzJ2T3dnWWE0ZXZjQ0JG?=
 =?utf-8?B?V0dBazdzTCtua1B3RHlkRkEvV2ZUMlB1TjBML2s0Z3dlRnBhdGhXR1dzc1Rs?=
 =?utf-8?B?R1N6YSt4SVdwbGtYSWlTV3Z4cXhBMDBJV1FsaDdza2I0eUFYMUl0RGd3WFlq?=
 =?utf-8?B?SjdyZEtkM1hRaGx1RStjdEJXQ2JiVVg5eDFuZWFTZEpldFhFWmx6eERCQ2ZO?=
 =?utf-8?B?NDUzSEdoV0t2RmkzY3VUaWhHaStRcmQ2SHdYSHVJODhIajBvU0NndWFkNnV4?=
 =?utf-8?B?RVV5Rk4zR1RCNnRlUkNaeFAxVzRVbzV1WXFub3NIUG5uVVV4eS9vOVdCVlhQ?=
 =?utf-8?B?NjFuRTJBN3J5NldWVlV2RHloZk5MYXU5Z3ZGWnRUMkRIei9sRTRmT0FNdVhB?=
 =?utf-8?B?azFsWDFoa084QVFiS2s1cnhqeDJpdjlOZE1mQzVYOUU3UXdyUHYrVVRzaThr?=
 =?utf-8?B?QU5Zek4rRDZFYVJ6RjB2SVNaZzBCSGNvSzJ0aWZydGs0UjJsT1BncU9ZeEhN?=
 =?utf-8?B?Wm9BYWVabGI4REg0dGFrZnd3Z1c2M1Nnbmp4MTZBZWlOQkVEbjdzVVM0eUdo?=
 =?utf-8?B?eVJYMmFXU3ZZamNiVFdQQXVMdThZdlZvdmZPYzlwa0VHM0luYk1ITEtSRHA5?=
 =?utf-8?B?VlhjMnFTYzFCV2lCK3piOTl6dk5xdnFPWlJuZHZ2N1hJTjI5WUdCcGJHeHhJ?=
 =?utf-8?B?UCtGUVZydUUrNW40ay8wN0FwMnFpWnJkNWtRYStnMkNUdFJ2U3lWNThrNWFY?=
 =?utf-8?B?bTU2Y2F5TXc1UnZDcDRkbFBqdVI4REx1cU5HTHBUMk1VTFVtUGtDTDNQYWhC?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0593cae-19a2-468f-fe3c-08dbf4c74934
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 12:48:16.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHbkBXyULsJ/9H2qTxAr/5kG2hZD6kHLVeKHs15yE6ubnZZmqKYMtVDkynH/MWPCNZNJqnPQI8FiUfspdLtsFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 12:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191735

Hi Alex,

On 04.12.2023 11:54, Alexander Kanavin wrote:
> On Mon, 4 Dec 2023 at 11:48, Lukas Funke
> <lukas.funke-oss@weidmueller.com> wrote:
>> Unfortunately, the patch indeed causes the tests to fail. The
>> problamatic lines are in the 'lib\devtool\standard.py':
>>
>> if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
>>          if not firstlineitems[1] in changed_revs:
>>                  continue
>>
>> When the commit-hash becomes all zero, there is no way for devtools to
>> detect the change. I'm a little puzzled how to handle this situation.
>> However, I still think the all zero hash is usefull since it will reduce
>> the noise when developers review their changed in git(lab|hub). Maybe it
>> would be for the best to remove the check?
> 
> It would help if you provide the context for that code snippet, so we
> can see why is it there, and what is it trying to do, without having
> to go and separately study the code ourselves. Patch review is hard,
> please do not make it harder.

You're probably right. A little context is always helpful.

 From the top: the proposed change is setting the commit-hash in 
exported patches to all-zero.

When devtool is updating the recipes using 'devtool update-recipe 
<somerecipe>' it figures out (in '_get_patchset_revs()') which commits 
were changed during development (in the workspace).
Now devtool known which commits actually contain changes. Subsequently 
devtool is exporting the patches with all-zero commit hash (in 
'_export_patches()', which contains our all-zero commit hash change).
'_export_patches()' also compares the now exported commit-hash to the 
expected commit-hash which is an argument to the very same function. 
Since it they didn't match (see the code snippet), devtool thinks there 
is no change. Thus, the patch is ignored.

If we want to export patches with all-zero commits we have to either 
remove this check or have to export the original commit id in the patch. 
The latter would again introduce noise.

Best regards
Lukas

> 
> Alex


