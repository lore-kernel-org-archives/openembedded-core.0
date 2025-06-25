Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF04C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 08:47:38 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.web10.10613.1750841255202904290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 01:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=R8p678vg;
 spf=pass (domain: cherry.de, ip: 52.101.69.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBRbKwQ1QsCjUeqqYhmz5OeQegzaYrxp9lp37hETO16LA9viKf/kT/BeLttmNHQnDzYMVK8a4kUL+yw6tYVpR/CESYCfHWz4wS7xom1MEsW8GnW9RoLRQt9yxx6UVoMjZK1RzjHLyapMZ/UFRMjMeyEHxCuead78sw4xxarlql3uZU0G1WITiV856L4pDcw+Hn7iGJhQRgkOJtzcVThAVu7CRvr7NZd3LjEtusX4gOcuPIC2CIus6bsWHDZPalhkgZYUG2AHJ15o5PMI1h5/IbkKZZMY1F3FZB8q+xelgc1k69YIuq+envSt7x9/QoO8CkJNjfOgbXpxcpll9Y7irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jNDUTfXyRd2z62DPZ2JztzIYTBFIJ1AIo/Gs1V179A=;
 b=itlQovR82pvb3e2jrne2Ewn9GuyZTxw3A28mlFGCXqGPlJ5hHbTkhRV2zkuNy3mqLaadw9X/vEATjkC8/MCDYoDOvsGWFQS7uARIyyEnMjvIks3fOuiLUaxfrBKTue+rZq9ac/HXquOLg0qAHfnHEkPiP8GBxoNQbBGobjehndNAuJJl9cbD2kzJP7fnCt7KrXEgCiYqGTiq5U4Do96fbkOppkYyfiYeiGM78Co3y29MLDqG9y40doSJtbmtzC7oNXPy1b8fzTXoGIM4lP2hnI/AJz5zx6pkAoyh0KvvSDA8UoFrgBUlOhCSBbTPmCVDwv/U+AHWb+EN5Ny/dwllAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jNDUTfXyRd2z62DPZ2JztzIYTBFIJ1AIo/Gs1V179A=;
 b=R8p678vgqNOnaTsL/ADczWvFoxXErioMbVlWzPnawRATCObjAjujfdgygp3ggPYsbSwv6ohejYmea4XrJ0nGdMxmZ9NSzD2YoC35BX90yd9JEGZeLKG2vjwSGGg/iw3cT0NJWJQAiPRQS9EdyVLxLvwj9pqFxlNGYxnOpXdW9ko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 08:47:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:47:29 +0000
Message-ID: <f025e769-cc6a-4bb9-8fe8-d69733d59e74@cherry.de>
Date: Wed, 25 Jun 2025 10:47:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] mesa: lighten up libclc dependencies for the
 target
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
 Trevor Woerner <twoerner@gmail.com>
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
 <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
 <qkgwktgnp7om77sqqalrm3jkglfubt5mcnmw2d5tgkgi74boa6@pvvgu6ciq46l>
 <91a281a1-f336-4475-b598-b28471b5c178@cherry.de>
 <CAO9ioeUytn1OXh5CF-0qg228QWaFbVgekD7AMAoe7RbtQMKWaw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO9ioeUytn1OXh5CF-0qg228QWaFbVgekD7AMAoe7RbtQMKWaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0260.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4c0377-ed46-44c1-9fd8-08ddb3c4eae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1BwTlByKzFseFNRVzkyR1JabC9EWk9zYVR0SXFYN0U0aGJqcUhMdWkwS1pY?=
 =?utf-8?B?VWdJeFVJVkl3UG5EWVB0Smw5blRHelV6UGVDVlB4TjdhendsNGE3QWNhaS8v?=
 =?utf-8?B?OUtUK1JBcVZlMDg4NCtKSDNkMmlxQUFtb0dObThnc3RBVW1wV0JZWEU2MEY2?=
 =?utf-8?B?aDdRU25nZFVwbnhVMWRBeEcrbkF5YXI4VE5zaUk5WTlvMEE2Y3YzWFhRS1FP?=
 =?utf-8?B?S2tlczlPZnZ0aTRTN3c3ZGptdFRrS3hGaDRQNkM2SkRBS1JuRTlQRDczeXpL?=
 =?utf-8?B?ejIyWjg2TmxycENSQWxIZzJKcE5uK0dZRjJBcDA1YWtkeG5YbEJOSjBIemtJ?=
 =?utf-8?B?L3Z1ZGJ1d3d3dzkwZ1BwbGRRWTNxdlJjN2xwcEsvOUpNdkpyTHFCMzhlNHBJ?=
 =?utf-8?B?N0hnRFU5TStRUTl4UTZId21POWZtZmNRUjY1VnA4eGdFWWhvOXh0VkNsbm5I?=
 =?utf-8?B?VUVUcnhhMnRYdXA2MlBrbTlaUmNSb2RSVXhwUTlXeFdYQkhSeWVNcjJmTVp3?=
 =?utf-8?B?dCtzZEJiclF0eDdLQmNFTFFEWWM5ZUxURE03VTNJcGJnVll0czFBZWczYkhk?=
 =?utf-8?B?T0lnU2JZa21lNW9Rc2dOZjViUUZNbU9NS0RnSnRJT2dTTU53VmU1dnR4MFY3?=
 =?utf-8?B?L0txemgvS0dyOVBraWZoWlgyT0trR3ZMajR4QnRRaVhaMStMYXRUS1kyMjll?=
 =?utf-8?B?Y1dsL01aSkNXTy9QZGQrMEVGZDErYUc4UXlZY0I1alJ0TERFTmpZMnN0WlpJ?=
 =?utf-8?B?NDNXT2RYQ1NCV0RyYndvV2YyajVWOXVWS2tLdWlKVitsdG1pdTY0MzdGODlK?=
 =?utf-8?B?YVAvZWdxbzlicnVzNlhoblFhVDlBS2RQWXJRc0J0RTI1c1lFZUI3dFlZbjNp?=
 =?utf-8?B?TWFiaU5nMjczQnR4TDlObjVzeUhyU3grb3F3cE5obTNtNEJnYjVmQXJzdWFx?=
 =?utf-8?B?UlZlekIza3JFRk1Wa0I2U01qZUcwSzRleUdpanByVEpoYjUrVEJIa1ZPR3d0?=
 =?utf-8?B?UmZ5SHJNREtaNWFZWE5Sd1EwVitua3N4bWtRRmpKUm9ZOWNFWUVGRkM0V1pR?=
 =?utf-8?B?YnZzK3poUlRTZkNFeUc2S0krRVZZWVVTTVl4bU15cEJhUHJNVWtzbkFINkl3?=
 =?utf-8?B?TXlETWV2aWRuWHpmUVZjbmtHeDlteERYbzNSUk53SS9ZeExBSVNiaGliVHp4?=
 =?utf-8?B?VmxtWE05dmxqS0w3RGk1dVZXWkttZHJ5c2RDaTFyeHRWUFZQRXFGaGZaQTBO?=
 =?utf-8?B?U0JaZ1dla2Z2ZUxEL1BzSjhiMTBtcEViNUJvdG9oNDdSK3E0RmFabzRuM3kx?=
 =?utf-8?B?SGFna2d6UlROSjB3dW1SQkxFTDg3ajVXYkQ0UmtlZ29YRkFDYTFmamU4N1pm?=
 =?utf-8?B?TS9EYjhvd2ZuOGxFc3RpdmJ0MG9OblVwa1hSVjNMbDZnUXBnYjFGMXR2Z1F0?=
 =?utf-8?B?c3dBdk9BVVVuVE9jeWs5K0l6ZUFVejgyTlNhZVpnbGtmS1NSVFRWaDNqM2lX?=
 =?utf-8?B?RjZ0S1llaFZZM250cGNneXlOK2FPSndrTlRCbDY0M2EwVWxHMWRlNStjRVBj?=
 =?utf-8?B?UU9XekdsR05ZZDdFZGFDU0ptMHVndTBmYm5RTkl6VDd6QkU0KzVnWnpGSlRi?=
 =?utf-8?B?bmRMVkFNTDdlc2IwQy96SEJlbGl5VVdRdnpMVGZvTVhwS2k3YUgrS3llTG5G?=
 =?utf-8?B?dlRZbEF4dEpoT0J4Njl6empjZFFnWEowZ1Ayc3FicW8zd3FYMGNmYjJUSzRF?=
 =?utf-8?B?VTB1bXVQMUtvdFIrRDZpRXV5TkRPazg4bnU3VisvdFc2eDYyUWRqWVF4akhB?=
 =?utf-8?B?MTZycU0xeWUwazJEeU9QLzBxbmMrUEtUbHhvSit5cFZDT1N6MVhrMFhMc2ds?=
 =?utf-8?B?dXE5amlpS3pYK3hQSlk5OXVobUFzR3hWK1JDYUdicmJPNzJEU2Q3VjVOWElt?=
 =?utf-8?Q?dFPVelcVPFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkxUeFAwQ0xlYm04NjE3QytjTmM2bDd0RmhDNjVpSTNERnhDRzdQTVkyTTlY?=
 =?utf-8?B?N3NVbjQ2eEFiZ2VVTDdvM0FNNWFNUklQbFN2QzdtOXlXbmdNazU5RUhtMk5k?=
 =?utf-8?B?ZThYOTlScE5NcWl3a0xCaUVDK08rV25VcXQxTWZkTGtXeUU3THF5bTRjenM0?=
 =?utf-8?B?S3lBeWUzN2VjdjEzRFVBQzVsM1Rmd0RZbUk4TnIxVm5aTmYzbnhOdVVWSFk5?=
 =?utf-8?B?LzdGWGhlb01nV0lqV2JqRDZTeGdCbXpPWDRMTWlCcG5PSitpbzBsdUozQS94?=
 =?utf-8?B?OU50aUJWK3dvb3EzUGZTeHN0cXozWjlBV2RTRS9HZEVMSnY2bHBSTE1DMWVU?=
 =?utf-8?B?bFFLQzFMNGZ1R014RldCRVFLN2tOZmF6bnZQRnpkMVFCZmYyU2pUdThqOGRa?=
 =?utf-8?B?a1RXTmUxZmNsMGp3clB3L2phazhnODFyNmtncGtwVlJlV2d1ckpycG9pL2h1?=
 =?utf-8?B?eHptbFM4aE43NHRLUXJraVFSeFRSaHAraUQzSmhNQ1J3ZXVoNy9pdEZ3bTlF?=
 =?utf-8?B?cjZhWHRWYlBTamNXQjd5QlJWQnJaMU5GQk9NNUFRRmxsVllycEdlMlF1Qy9r?=
 =?utf-8?B?S3VvYkxjVXU5K1V6eDZoSkFCSXB1SndicFpZbCsvWUFvMGxGeDRVaDQxSXNa?=
 =?utf-8?B?dGRGeElaWHFYd3ZNUkNXYlJSSHFOSFU2dnAwbDVPaWt1MkNpOGhKRWxpTWd3?=
 =?utf-8?B?elFnT2M3R1RDNDdidFZGSnNza09ib2l2bDNoVWM2eElCWXdTbkgvOVVVeVZ2?=
 =?utf-8?B?dTNOT3FORU81Nmp2bXJiRVN1NUprN2cvVzdLcVBhMXJwZzFFWGQ5Z2k5RW5o?=
 =?utf-8?B?MytJb3BoNTh1dm1zNzkwMExId1JBRWtWWitmencwUmgxLy9wMW5wVzFBWFZS?=
 =?utf-8?B?WXVJUFVuVFVWZnVFVVlSRTMzTzNUaW0rQmhBSzR2OFRQVE0xbzg4djlsOHBM?=
 =?utf-8?B?blVGSHZqQklkbjFPNFNtWmNxMFpYdFV0K1BCY0s2eTVmdDRkcVQ5N0xQdWJ6?=
 =?utf-8?B?SUh2QkJsQjRXYU5tZjg5SVcrQnhaUFcweE5neEZNc1pYcjlOaWl1NWNTdThx?=
 =?utf-8?B?VjI2UGxjU3o5MU9zU2dvRDJLK0RhdjN3NXYvS3BJYnJoc2t0NW1VbVlDcDIw?=
 =?utf-8?B?akdJWHN1VjJ3U1lNUzFQSG0ybVpsNUVFRUtFdWZLelhrYXF4RnBaUW5xeWY3?=
 =?utf-8?B?S0E4NjBIdCsyd3RVTHVIT1RtckNvbUJ2QUtUczA4MGFrTUhjejBHZXpUeFll?=
 =?utf-8?B?VFJWWE1HS1Y1Rk5kZy9BWUp0eVg3aC8zUDJQNWV0bUFWcU8yQmJ6ZTB6eUJZ?=
 =?utf-8?B?ZC9vY0doK0IyZWx0S0dEMGhDcDFJdEozRklCNzlPVkxkQzNKRU1sb3lpRlhJ?=
 =?utf-8?B?Ti9WZWhxNk0vajhORGtkM1pTcHpQVVN0OXJ2UkZHWUZFV0hYYmdJWnlOcFlh?=
 =?utf-8?B?bGJPRDNjTkk2cHZvblhaM1NwS2RaSjFMZ00yemluVDcyWmJGSzFTZ2NjVmZE?=
 =?utf-8?B?SzlJb3pjUko3c0VoeVFiK01hMHJlMFlhZ3pnQ1dsTFZHMVlmZ3BXc0RuczN1?=
 =?utf-8?B?amNpNXBHRmFIWDFUblg3dm5IVjljN0kxUEVMUnFHelFKcHVmYndDd3Zkb3pa?=
 =?utf-8?B?SUgzUlFQMFlUdUUxdGltZDF3YmhUZUZTQXhqcmlXZlZnbkd6dGQvK3cxaHdt?=
 =?utf-8?B?cjJBWjRQMHcwZWFHV0diNFZYd1dreUVibnlHR2M2d3J0SmdYNENkeFh1RzFW?=
 =?utf-8?B?TWN0dThzMzV5MW55L01rdHdYSk5mbFNTWmVwSE0zR040UTlhWE1MUHhoSTBY?=
 =?utf-8?B?eFJxVHFSWGs4SkJaU09XRmtLOUsvRU9HeFYwL1VVVkdhbWJqUmQzcnh3dmlV?=
 =?utf-8?B?Q25CVVZySGtaOEJLZXpkMjE0aWRRempNcWRyNy9yMTZvQ01LMXgvc2pjYjBM?=
 =?utf-8?B?c3RXZFFVOWtkVFpLZ1h2bjFtMGhBMXhSNGJLYm5RU1g4NUN4K3RFdUhPbjRO?=
 =?utf-8?B?WE42dnNFVy8rT3RRY2dwT245TVdUVFR0WlNUak1yUVZpQm44ZjFoUUtZSGhh?=
 =?utf-8?B?a3lFTXVrV1BEbjJEWUFpelBLc1hoTHlERWExN0daRTc3aFRxK3FaYy9PSzlo?=
 =?utf-8?B?Skx0QU1IQit1RTQwdnJzWTVTV29tRWhkU283anU1K0ZKQXp2TzdHa2o0QkdW?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4c0377-ed46-44c1-9fd8-08ddb3c4eae9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:47:29.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1XAUGxBY2AoaGFASp7MeaMxge6F8JdEb7rN/rJVf+G0Ehez/u2uLQQq6/GVqNARaEWDPyPWEPjnR7NHAr/jiXtizSwQB0PBnqCJzf4G90g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 08:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219306

Hi Dmitry,

On 6/24/25 9:36 PM, Dmitry Baryshkov wrote:
> On Tue, 24 Jun 2025 at 17:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Dmitry,
>>
>> On 6/24/25 3:35 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 24, 2025 at 02:44:26PM +0200, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> By using mesa-native mesa-clc instead of libclc, we do not actually need
>>>> most of the heavy dependencies of the libclc PACKAGECONFIG as we simply
>>>> need to use the natively compiled mesa-clc instead. We thus can simply
>>>> depend on mesa-native for the target recipe.
>>>>
>>>> libclc however is still required if opencl (rusticl) is selected.
>>>>
>>>> Because asahi drivers are only enabled when libclc is also selected, we
>>>> can now remove the explicit dependency on MESA_NATIVE.
>>>> We do the same for panfrost even though libclc isn't enforced yet for
>>>> mesa for the target. Support for panfrost has been broken for a while
>>>> already anyway (because of the possibly missing libclc) but we'll fix it
>>>> in a later commit.
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>>    meta/recipes-graphics/mesa/mesa.inc | 19 +++++++++++--------
>>>>    1 file changed, 11 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>>> index 330a04f1b098a2d3a6874f40feabe8836dd4cb37..eafe1697c48edc661b33a54c5856d8e577608fd5 100644
>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>> @@ -158,7 +158,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>>>>
>>>>    # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
>>>>    # Be sure to enable them both for the target and for the native build.
>>>> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
>>>> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
>>>>
>>>>    PACKAGECONFIG[broadcom] = ""
>>>>    PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
>>>> @@ -201,19 +201,21 @@ MESA_CLC = "system"
>>>>    MESA_CLC:class-native = "enabled"
>>>>    INSTALL_MESA_CLC = "false"
>>>>    INSTALL_MESA_CLC:class-native = "true"
>>>> -MESA_NATIVE = "mesa-native"
>>>> -MESA_NATIVE:class-native = ""
>>>> +# Reuse libclc from mesa-native instead of bringing heavy dependencies
>>>> +LIBCLC_DEPS = "mesa-native"
>>>> +LIBCLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"
>>>>
>>>>    PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
>>>>    PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
>>>> -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
>>>> +PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,${LIBCLC_DEPS}"
>>>
>>> I think it might be easier to drop this completely and to move meson
>>> arguments to EXTRA_OEMESON (next to precomp-compiler options that you've
>>> added). This way native builds will always build a full configuration
>>> with mesa-clc, precomp compilers and other required drivers, while the
>>> targets builds can be really optimal and won't require 'foo libclc'
>>> hurdle.
>>>
>>
>> We actually talked about that and I eventually decided against, and
>> forgot to explain, sorry about that.
>>
>> Having libclc always on for the target mesa will require mesa-native be
>> a dependency of mesa, which I'm not entirely sure is the best of ideas
>> since nothing else in mesa requires mesa-native as far as I could tell?
>> That's quite the dependency to always bring in, what do you think?
> 
> Okay. So we have several cases:
> - class-native build. It should depend on libclc & spirv in order to
> provide mesa-clc, asahi-clc & panfrost_compile. I don't think we ever
> need RustiCL support in this build

It depends if we need rusticl in qemu for example? But otherwise yes, 
makes sense to me.

I also kind of don't know what to do with the nativesdk case as the 
recipe seems to support it.

> - target builds for asahi / panfrost / intel / nouveau. These should
> depend only on mesa-native for native progs and specify
> -Dmesa-clc=system

And we can know which ones require that by figuring out what can set 
with_clc meson variable to true in the event mesa-clc!=system, so 
shouldn't be TOO difficult to follow what upstream does?

> - target builds using RustiCL. These should depend on full libclc &
> spirv packages
> 
> I think the easiest way to handle all these points without too many
> troubles is to:
> - Enable mesa-clc / prebuild-compilers / asahi / panfost in native builds

Agreed, I believe this is what I've done in this patch.

> - Drop libclc PACKAGECONFIG
> - Declare that asahi, panfrost, intel and nouveau PACKAGECONFIGs
> depend on mesa-native. Pass -Dmesa-clc=system to these drivers in a
> non-native build

I'm wondering if we cannot simply have mesa-clc=system always on (in 
OE_EXTRAMESON), even when we actually don't need clc at all? Is this 
going to hurt us somehow? This would simplify (albeit make it less 
explicit) supporting those drivers as we would only need to add 
mesa-native to the PACKAGECONFIG[<driver>] part?

> - Make opencl PACKAGECONFIG depend on libclc / spirv-tools /
> spirv-headers directly.
> 

Agreed, I believe this is what I've done in this patch.

> WDYT?
> 

I would like to avoid having

MESA_CLC = "-Dmesa-clc=system -Dinstall-mesa-clc=false 
-Dmesa-clc-bundle-headers=enabled"
MESA_CLC:class-native = ""

PACKAGECONFIG[nouveau] = "${MESA_CLC},,${MESA_NATIVE}"
PACKAGECONFIG[intel] = "${MESA_CLC},,${MESA_NATIVE}"
...

which actually wouldn't differ that much from what we have today, just 
that we would merge libclc PACKAGECONFIG with PACKAGECONFIG of drivers 
that require it.

And looking at the meson.build from mesa again.. it seems this is only 
required for Intel Iris gallium driver and Intel Vulkan driver (for 
Intel drivers I mean), so Crocus, i915, etc. don't need it and we would 
bring the mesa-native dependency for this as well?

We can start with this though and if people complain about unnecessary 
dependencies, then figure out something more precise and maybe rework 
the PACKAGECONFIG selection system we currently have (but that's a much 
bigger task :) ). This remark also applies if we have mesa-clc=system 
always in OE_EXTRAMESON for the target build.

BTW, it seems like intel also has a precomp-compiler 
(intel-clc/intel_clc) and it's also handled with -Dprecomp-compiler and 
-D install-precomp-compiler options :)

Cheers,
Quentin

