Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EE2CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 14:52:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.42])
 by mx.groups.io with SMTP id smtpd.web11.53585.1756738320980620934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 07:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=g7DqSmIX;
 spf=pass (domain: cherry.de, ip: 52.101.70.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw9WKh54Um+y9dnZojrLDyuKs5kEdvrbu/lxtAmiSx2fDkoOb7RL0rOq0HnuGYGPuIWArrrm2OqhsVoV+ZHZZ0/rCcRRURuSGCTFToFnBQKgkI1tDK0Mynw7Ipgx6xcCXmklZOdfmX535Fj5kQjLVWVMqV8wYgeC2iTRXW67LULDB7tf9uQsqb4ibowlvH9WRcDOGtDkecA2SqRAYtQ2vnXXDX9CF6N3h6xN7TZGSwnRuMskcCURtAZreX3NnxET8BauqJ08s5BaL8ABSLQ4Xcfq23plmlm/NzfHPZWOo1ZPOQ5L4aGzX177YKv/VvFIkmiIsjm0K5sYbrQINjyzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbWD8itfkDIF1S7YGjqFW3fjWlsowvisxjoaQPsokHY=;
 b=oTb6GxwFQJIyGDpWl8IZzO7av1KdXP9WRbbEx+3fB36L+smI1SZIBExglAzKs6AYwQfz9Ef3MgKGlkWRcPKO1GjpERyGX6WlDygobHBdSChDeUz3cL/2cRB7GekkOi1Sy2sNnTFInbAs9/N1eSb2X42d23C9hayRIDdVeMaBS27rwO/QlwCgxTO5lB1bhMK2m3KJzy3YbuQ3wQz3t33HyRpVdv5Njmr3FuR/f3v+ZLuGoA0j35SzVIK3MJvyBz4EbdzcoWNYeidXkAsLyxOgb+AkmUECSkQc/wNHu3oKO1H2wd+acIlrjI0TosEag3OSx+mrz1k4wgJ5yAsQ+096/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbWD8itfkDIF1S7YGjqFW3fjWlsowvisxjoaQPsokHY=;
 b=g7DqSmIXweqCoSo7ENiwWuLX4QbEi4VJr0pf5SWsXPbAOS0xXzxRFXrJh+ZnQuu0elVyyvy/VawYcze5mMRCbZ5aLGswo1ACurHD3s7JEbZZ839dMyQZPDME5AsBK3MRJ1T+n/K+nx2qTA+mxUFwHUPxNuK7ukDGGaOQixLkuHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB8035.eurprd04.prod.outlook.com (2603:10a6:20b:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 14:51:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 14:51:54 +0000
Message-ID: <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
Date: Mon, 1 Sep 2025 16:51:49 +0200
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
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::38) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6ba1c8-af66-4066-9aec-08dde9671573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0Rkd0NXZnJtbzlpeXRrWXdjbVF0SU9Kc2lRU0kxN0ZuU0RlNHlkZUpWWXJm?=
 =?utf-8?B?WjVsSHd2L01lSE1mcFo1Z25XZjQ4NEN0OUoraEI3WjlnU1FFZlNaMEJIaExI?=
 =?utf-8?B?eExES0xhY25mcWQyaVljWkRJb1hHUVpRR1BQcHpXV2FFaU9XNmhRdXB0MzRn?=
 =?utf-8?B?UktXb0x5UER5bHVUM0Z4WFJUbUthR3ZNMzYxSjJUV2kxNWhJOXEzRTJua2g2?=
 =?utf-8?B?RUVNOUk0S1Jtd016MkVrQis4a2hBQ0xkckdQNVVJQXpVZmZWMnhpTlpVQ0hM?=
 =?utf-8?B?YnhINERpRlc1dkZGU1ZpTkZzNHNrc2xXNmdoTlkvSXVCcW54QWlCQ0pVeXE2?=
 =?utf-8?B?VUg3K2pvb3RwQWtUanJZVUlIeXRjekRrWE40WFdtbzVYUk1DdU52aHBPRE0z?=
 =?utf-8?B?SWx0TzlGU2lSV0NWdzJaNHFhRVFvdS9PeXpwb3ZiUzZXT0U1MXN3MDZEdjlW?=
 =?utf-8?B?MkJ2b1FnUXBRTEp3aXVwZmorcUs0ZEowRmZvajduRjJYK2NwNSs5QmZob0lB?=
 =?utf-8?B?SFVoYXI4VC9TYjFEbGR3Tmpwbld1V1JtZmptckJGMUxnUTFQejhZMWJpVGpN?=
 =?utf-8?B?WlQydEVRampNelUyaEY0a1Q4b0lLSGFsM2h5Wm10MEdQL015SEdUKzlZSFZI?=
 =?utf-8?B?NTQ0T3FoL3RKWHUrdDJhZ09DT0hOclBleDBhVlM0RFp5dVFtRmJlTG5QeHV2?=
 =?utf-8?B?M2RhaDJ2TTZLMGNUNldDVWtpRVRJUEkxSXNqd2xBTlJnUzVOdDg0QzJ1d1BW?=
 =?utf-8?B?WE5ralZ4TFNITURjWXhBWDk4LytFRDZNeStDeER1bUxYS25ZYmJhUnhUTFpv?=
 =?utf-8?B?dXZnQ2YzZjlDaERjQ05rd1kvRXh5ZXZMQ3FnV2tldjN6NWx3WU5rWkFDYmU1?=
 =?utf-8?B?MzIvMFErUldsckdWN3Jxa3Yra1NmaldNQmRyMVpuaUhCZTRoZWFXMThLMFlo?=
 =?utf-8?B?Wmx0dUVKendVdDZicTN2angvTDNVU1pXMnhYQ01lTTRzeUtTK2lpcmQ1RmpZ?=
 =?utf-8?B?UGtKcnp6aEJRWHE5WVlXbkV6c2RjbW5ITVhobUd6eWhtUzk2TUR2ZU9oaTZp?=
 =?utf-8?B?VEd2b2d3b3JjSmdscis2VXIwMHVhL0tVSjBaczQwejBDeGxMVGVWNnJGZTd3?=
 =?utf-8?B?ODg4R0QyWXJtZjFyK0tYTW4zOS83SGF1S1NUMmRUaU01RXdvWGYwMGtpQXNy?=
 =?utf-8?B?UUVBNHNxVlJ5RFAzcnFYTkpuc0JKcDFsbm96Z09TczRUc2hNejNXQ2RkT0hU?=
 =?utf-8?B?Y0hhMTJoTXJwUzRRYlpERjg5OWFMUXhUSUpXNTVkWGRWSDBEdDd1K3h4MWRB?=
 =?utf-8?B?eWpCRm5HQVFuMjJiWXRyMkhjRndweFVUZU9OVTJrRWpsa0ZxS3RtbEMyRnlL?=
 =?utf-8?B?dFJKOHRpdndPcjVIbXV4SmU0eEZuT2FmY3lESkJoeG5mTkI0REJRMVJzMU56?=
 =?utf-8?B?VGZ5dGR0QTQ1aUN1TWtyZUdZbVRwMER0TFJ3emtlU0YrbDNJUkxZci9td1h0?=
 =?utf-8?B?ZEZ2eHBRcGsvY2kyb1prdllQbEVxWEJ6VGFadERGaWt4K0hXL0krajB1N3lr?=
 =?utf-8?B?QndWUk5QUHdWMmRUVHpJVUsxbXdNU0ZhSHNJcjVlTmVmdmlseVV5L0lBYWUy?=
 =?utf-8?B?R0ErSlNPVTNJUkN4TnhBMjFnOVdHS0IwMFdRc1U0VVlYVDhadUVGWUpVNjlS?=
 =?utf-8?B?N01JTVoxL01ZbmtRcXg0ai9rU3NyZ0tqMVp1QzY4NHZxQkFEaVJLYkhKbU5S?=
 =?utf-8?B?MDlPRlBTcGpLai90NWVkVFl2RkRua0d2cTE5TEI0aDJRUU9QSEpmWERjRTFO?=
 =?utf-8?Q?QCt8xU+ef5QEu65Bdsn4klFJuVyRtYE7Siy9g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnlyaURoT0sySkFYa3RWN2dZdUFoejhmV3l0WFRJSVZIMCs4dG9sbVh4WGlI?=
 =?utf-8?B?b2ZPK3FHbFlyRzJ5cHA0YXhmWVc2cXQ1ZnIwcUJGZU04bjJHWUVoYzZ4K2lp?=
 =?utf-8?B?ZDhOaDFIblRUbFhJQ3YycTk2L3pYdUhvR0d3eTlPTk9DeFFNLzJTd0hwejhq?=
 =?utf-8?B?MFhpclZZZDZ3aS96QnM2ZFY1WEVyT0kvcUNlOUgxa1R3djJvdGREb1h2WURp?=
 =?utf-8?B?ejA4aU5VVG51SXppUUZVazdORHkvU3R6eHkrTXlMK21wdGRId1JpbTlHOTNP?=
 =?utf-8?B?TjRwUGR0QmVERnA2c255WVk2aHNrbkZMQmVoaVJuWUhjRGp1bHJiVncwQjNl?=
 =?utf-8?B?Tnh6ZjhONDEvb3EvbWlNMU5iUVpDM3liYVF5WktDclM1TnR5T1dqbWRHbnJL?=
 =?utf-8?B?bnI5dGFmeUd1NENVSEk1NWNFVDN5WkJ5SGh4TVhieno3Nm5MOEIxZDBuSFA1?=
 =?utf-8?B?NDlsL0F3c2xzdm5nTm5IWHJHL0NMVUFhc2UrWWNFVFFGSG5tWmxvbW5VV0lL?=
 =?utf-8?B?RTZCWmdZUEdPb0luYVdjWFIyQi83UFNsdGhOY0VzZi9TTEJDOXcyRG9MYktw?=
 =?utf-8?B?WEkxTUhiTHFsVFNMR2x3Z0l4blI4TlJLNy8xdTg2NWJvNWVqblBUNUF2S0tO?=
 =?utf-8?B?Q21YS0p3Q0NYamxXSHFPbkwwSFd2Q3ZtNXRuMHB5SEdZZ05JcEovNU82Mm9P?=
 =?utf-8?B?Mk0zTnk2dmxWWGtkNk9sYXV4WUM3TGNJc0JKYXBjZ2s1RFg4UmUwY01ndkhO?=
 =?utf-8?B?VVliblhDSW5ibVAySHBNa1BycnBkYzVueW51Z1kva3NuNGhNeDF3WlI3RXBF?=
 =?utf-8?B?UncwZzJWRkMyTnJQTml5MXJSSkU2dy9MQlJpRHdzTWZVT2FaRHFHOWhnbTMz?=
 =?utf-8?B?cWM1dVoyNjJLa2RCMlhhbXZMRDJzb29UdVErRlhRQXY0ZlB5aXJueEYrMS9y?=
 =?utf-8?B?ZU83dEZ6eVdNWWpTTWlsUVkvMzZtSDhqTGFzMFJpL2RkVUZZNjB5OHFaRzlo?=
 =?utf-8?B?MXNyZUFDaDlId2VBNGc4M21kOEJIaHlOb2VGbFhybGoyY0F2ZTJvbkE4VmJR?=
 =?utf-8?B?N1c3Y2EzcmpPb1QyRjBEejZZS29ZM1JNL0U3MFA2S09WMDBHUE5yL1ZxbUdO?=
 =?utf-8?B?SFpPOXdCdjFkUGlzdGp3TFNNZTVKKzhiYjZkc1pDajlEc2RtcU85cnF2dkVC?=
 =?utf-8?B?b1YyYWIxeVhpczJiekp0RGtSb2VRWS9ESmJSdzhMdlpYUUtmZHRMUElCclJo?=
 =?utf-8?B?SkJxUUFEK01kWldpZEdMTWM4YmgvdlFYcmVzT04wL1RxV3FDM2RqTkdhbGRL?=
 =?utf-8?B?MGltUmV4YmdCSlQ1b21LdWpIV0lVLzdUUExKbERYYUZrd1VtNUl2QWRjaDNU?=
 =?utf-8?B?ZVYyUEpHZVZ6TnEzeHVFTHdmejdXRUliaS9QeWVQdGFlNHFIM2VxRkJwT3h1?=
 =?utf-8?B?NVJRazV4dlRTWWhZWHBWTGh5VXZ3WWxlYkExS3FrcGtZQzc2WkZuZ1hibFc0?=
 =?utf-8?B?a3lxRURZZW5sQ0I4YW1pUXBJWVZGZFhYQ3gvS0NlOVdvdndGQnB3cG5yVktJ?=
 =?utf-8?B?ZjBXSHJWM0txcmVBUW1zRXFEdDl2UTMrYVhRTU5CRWwyd0J3djlKRlVrOGFt?=
 =?utf-8?B?ck83Vm50WFZ5Mlh0c1QvY1Q2b3VPZWlDdTBkWmZVK3Q3NFpCajdTdVZVOGlO?=
 =?utf-8?B?akpYc0FEa3FyRFY0OFRnWHI5dWo2NTF0WE9OQUFZNElhdUVPMjJhZTlrdU5F?=
 =?utf-8?B?ZnVlcVdrS3BXY0dGWXNpWjcySm1Henc1YUVNUFp4L1FBWUoybEpNbGd1MUxC?=
 =?utf-8?B?S05XblRTSDUrLzUrME5pYW5UeGFvQlFDYmdhZkJBdW91cDVIZG5SOFlDcmQv?=
 =?utf-8?B?WkhxSzJDdUlOREYzR1lkNTRhbzdHbSsrZ0YyMFJPWXdxUnlPbHFCSlpWN1Ay?=
 =?utf-8?B?QWlNdjFBRENudmwwK05SNzZrcXQyaVRRK3lGZ3hHS3czOUZNK1F0bHFPc2k2?=
 =?utf-8?B?bktLLzBDM2lqbUpVSndEeG4zUHdUK0t0Z0VzR3JnUllhT29XeUEzb2FhYWlp?=
 =?utf-8?B?ZERUckFra2d0UmVuekZhUlZWQWRXQzJvZFFkd3dIRkdtbG1QMkpUUDVHdFFY?=
 =?utf-8?B?Tk0rWEtrUTUyekdFVzEzWThsOVNRRHROaVlOUW9nR3h2TWxqbkpKR2lNOHNs?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6ba1c8-af66-4066-9aec-08dde9671573
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 14:51:53.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79KxiOJwUMhjadgM9zQwwU5d9j41Yxjk0M2rBAHLpkomF8gcRha7wSug3cAQeynLleHB86BBqmromekcAGMlH7WJzHnolnrg/a/Nizdno90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 14:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222661

Hi Mathieu, all,

On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
> On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
>> @Otavio, can I add the new mesa-tools-native recipe under your
>> maintainership in meta/conf/distro/include/maintainers.inc, it is after
>> all still mesa?
>>
>> Panfrost support has been broken for a while already because it now
>> requires libclc which isn't enforced by default. This fixes this
>> oversight.
>>
>> While re-adding support for panfrost, the build time for libclc were a
>> bit too much to my taste and I tried to figure out if we could lighten
>> up the dependencies for the target recipe and it seems to be the case.
>>
>> libclc brings very expensive dependencies such as llvm and clang.
>> Building clang and llvm for each target architecture is very expensive,
>> but mesa allows to depend on prebuilt host binaries (mesa-clc and
>> precomp-compiler). Those are built by mesa as well, but can be compiled
>> in mesa-native instead of mesa, making the dependency expensive but only
>> once regardless of the number of target architectures to build for.
>> Ideally the mesa-clc and precomp-compiler would only be compiled in
>> mesa-native if target mesa requires libclc support, however this is not
>> possible as a target recipe cannot impact or depend on a native recipe's
>> configuration. We thus have two choices, always build libclc in
>> mesa-native with its heavy dependencies and impact every build or force
>> the user to modify the mesa-native recipe in a custom layer (as a native
>> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
>> former seems to be the only option. Another big downside is that
>> mesa-native currently builds drivers (amd, nouveau, svga) which we may
>> have absolutely no interest in building, increasing the build time and
>> possibly dependencies list).
>>
>> A third choice is to spin-off the native mesa recipe with libclc support
>> into a new recipe without drivers and only what's necessary to build
>> mesa-clc and precomp-compiler binaries.
>> This allows to keep a "clean" mesa-native recipe for whoever needs those
>> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
>> and only bring the libclc dependency when required by the target recipe.
>>
>> Because libclc is now only built for the host, opencl support now needs
>> to explicitly bring libclc and others to build as libclc won't bring it
>> in the build environment anymore.
>>
>> Note that this was essentially only build tested (run tested on RK3588
>> with panfrost though).
>>
>> Note that building gallium-llvm support on big.LITTLE architecture with
>> TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
>> support big.LITTLE architecture in -mcpu/-march which is passed to the
>> CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
>> further than that but that prevents us from building opencl support for
>> Rockchip most popular and powerful SoCs right now. One option could be
>> to force this recipe to be built with clang toolchain only whenever
>> gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
>> be not straightforward seeing the comment in libclc recipe related to
>> forcing the toolchain to clang.
>> I'm also not sure mesa has a way to specify different args to LLVM-only
>> drivers but that could be another option.
>>
>> Runtime tested on RK3588 and PX30 with kmscube.
>> Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
>> after some time but could be kernel related as it starts failing after
>> [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
> 
> Hi Quentin,
> 
> Thanks for the new version.
> 
> It looks like we have a build issue for riscv platforms:
> 
> ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'expat:populate_sysroot' (multilib variant '') could not be found.
> The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk.
> But none of these manifests exists:
>      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-qemuriscv64-expat.populate_sysroot
>      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-allarch-expat.populate_sysroot
>      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362
> 
> Can you have a look at these, please?
> 

Ok so I believe this is because mesa-tools-native uses a different 
mechanism from other mesa recipes to be a native recipe.

mesa-tools-native inherits native + -native in the recipe filename. 
mesa-gl/mesa simply adds native to BBCLASSEXTEND.

The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib) 
in it. In the case of BBCLASSEXTEND, non-native dependencies are 
suffixed with -native to be native when building the native recipe. But 
in the case of inherit native + -native in filename, it doesn't.

To validate this, I did a simple

DEPENDS:remove = "expat zlib"
DEPENDS += "expat-native zlib-native"

and compiling mesa-tools-native on qemurisc64 then worked just fine.

For a quick and dirty fix, I can simply parse DEPENDS for non-native 
packages and just add the -native suffix, but it feels very wrong.

I remembered that PACKAGECONFIG can also bring dependencies to DEPENDS 
if selected and those have a mix of native and non-native dependencies. 
Turns out, those automatically get -native appended though! (via the 
anonymous python in base.bbclass:529).
So I'm wondering if we shouldn't "just" fix the DEPENDS not adding 
-native suffix when building for the native variant even when there only 
exists a native variant of the recipe?

Otherwise I started to look into making mesa-tools a target+native 
recipe to match the other mesa recipes but then I hit a dependency loop 
for some reason (and also, there already exists a mesa-tools package 
generated by the mesa-gl/mesa target recipe, so that may make things 
more confusing as well. I guess I could call it mesa-tools-only or 
something like that, this doesn't break the dependency loop though).

Any preference on how to go forward with this?

Cheers,
Quentin

