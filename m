Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E38BC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 15:15:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.63])
 by mx.groups.io with SMTP id smtpd.web11.12987.1749827748850625017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 08:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=PIJYNm/C;
 spf=pass (domain: cherry.de, ip: 52.101.65.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z39+q2P7YfKGVSTt/42AxhE9qfIQtftpo9NeerpGsSsJXMr9zCDHwnt5PGVYHa5s/ZRbMZOa6YVoMDC/o5g0LYlADbcYwo+rfbwjpsiOXoflQQyxFEls+lvvcX1wSHoiE9W7kGU3pTA1FMXWPL/psdPHhhrYqrKxo4ExF/SFbHT9gHQqbtFIhYrbadmXDs/x2w6LrXaLvb7ZOqOo2kH9simTqRMKQEupodbtQwUJFEyCruD4ZcEgzNRsAXRZgNLH2JOo7+PIRABRIKiqe93OH+LFMmo3NyeEurzVuXoFoXfrNLzEafsmyLuqoXg5acFGHf37sxFRSehWveE95RBqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E0HzlL0P4q6Fc5RXJly7j3b/VOxXgMpHv/iJmgto+U=;
 b=QJc3tP8ULaQ2O3Hbmgmx4MdosC1Zfysq9hBHn5zj6XPfBD1bd0nA0afcnBjXHaKx8l3wo4gLNtyPf8qpaaN0QYFMjLZIlrPaNaQEHzJY8+gtbYRm7+w/j2XCjZKA8oJZhNXR+NF+vgiAWmnRj5f/HKxWNFoXulG3fTB/5UxYVP/rMzpy93IxpHmPujprcHwKn9jq93TFzuB6yxFr7cXo8E+N2ChJLVR2M+36OhJfsj0HbHPjB9eeuK26bRlHWuJB3HbDBIeccIrtay6c1HrU8TV6AiUFhRpwxYf1XuEcAdfT4j6AmRvIituZUMfIxGBOHr7oWFvn7UDgpAQsbWKuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E0HzlL0P4q6Fc5RXJly7j3b/VOxXgMpHv/iJmgto+U=;
 b=PIJYNm/CRRkk6FadNgUpreNgT78LhFSk99oiOfMXusvJqRL+rEqBBiqUVJT9IIFJGsNhwnQIbRmg4zsRy4wBtWiUKaZ0KyezPhoCnpV23B9l8vFYYrrXs7EGG1f7thC9yTX+cGjDFXbb9lGeNJ6twaWig2G6YBVgxX8+AFz5ejM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:15:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 15:15:45 +0000
Message-ID: <16025827-1c26-42c9-8dc6-8be5ef96f13e@cherry.de>
Date: Fri, 13 Jun 2025 17:15:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to fix Panfrost support in mesa?
To: dmitry.baryshkov@oss.qualcomm.com
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
 Trevor Woerner <twoerner@gmail.com>
References: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
 <CAO9ioeUJVaovv7WTdP1V4KFRHeTK7Tv9LowrcG6V2OfvrJwpvQ@mail.gmail.com>
 <b7dd59f6-12b1-4bea-a340-16582aecb598@cherry.de>
 <730d068f-6a3f-4954-a225-d48a67adf468@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <730d068f-6a3f-4954-a225-d48a67adf468@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0138.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 7229ef7b-3080-41c8-2b30-08ddaa8d2b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DNyw7JJosLdwdU9kJMYL2rRG4trRTXBaTLaefUGjL3qJ7ElHPbG6aMwpfiCT?=
 =?us-ascii?Q?YHzfDw73xKLkb1Y74OVr3RTE8fMIhrssq+gl4MkkTEqDvh7hIyvt2n+/JeFT?=
 =?us-ascii?Q?/8Jp+MsQxhilf1pNRd3bDEJP+uFBPBzKocTMSmaN+dy80EQVqNda6cR+lsJY?=
 =?us-ascii?Q?+GpkcpTCVf2t8xUBkTSmixMIQSrgG85+Fyx86LkOAk/gu++TIil8EvEizmge?=
 =?us-ascii?Q?9nM4q7aDCmL3kZqgPmPHpRzYH8fXJYOH7ZYlS+zatepdayt2/hoQ/ljrnTVL?=
 =?us-ascii?Q?cHrS6OXVcXWhU1bN6gSPlKBkLL0Zn+4V8q/srkyMpYsonr1+PuZ4S+6gEooW?=
 =?us-ascii?Q?0XdMO73kiTlg+orkZ3HqzfUvud96Q+/E0J2KaCS5DnMKzIcQ9YNKPRwzYQm3?=
 =?us-ascii?Q?ZDIniLsz1KTVZe/5ujcx26mcuUqanil/ZmVFoXlVUT/MlreQ3YZi1j5lwGFl?=
 =?us-ascii?Q?PXjbTjXEF7speR+pO3QiYelDebnq8cFFJxx0PXzf2XAFadoktlKqTyS9vD04?=
 =?us-ascii?Q?+vN/zdFPdlS77QomBepzqoXM4n85Jxk89R8Z4F6v6O5Fr2DPCsN5c6Bm2S+4?=
 =?us-ascii?Q?GR+NO2byHZHjywuSS+ciuhn6T8WJ58ZGwLc6aeOGxSYK0lPsayxqZVQ6So3r?=
 =?us-ascii?Q?1ipaeJP8BPqU8c1+15w1l3k2Jg1Y2jQCpUR7EKEsmMBjcBg9ak2fJ9W7Rsss?=
 =?us-ascii?Q?VkhAb6JcEAM1HeINzMTpBb7dbwOwE0iukrmzrNYlcepLQra1asodHx9/pcol?=
 =?us-ascii?Q?jAtA1gqBxqUYb9OcuoB1A3nVP4NYhgnMSJAhd+3gf1B966+syBoDJqnyAP1p?=
 =?us-ascii?Q?ZKYs45rTSSD2Al/+UKxbGnxDKi1mSCDlT5PZsIWKea7+B9gl7n9/uqtSoiRJ?=
 =?us-ascii?Q?p0bzRHB/2OGBSKMK372Agwb3fwdbkW6XUs95liT45zaUxcg/bjel0Sho7kld?=
 =?us-ascii?Q?VaauM8HPOos6zktjaqvyeTC8Vcjc5okwNS3vrhpP50w9F5zTCRUIL6sjQj5y?=
 =?us-ascii?Q?/oJ+dgLxdIgVzKJBwpDPeVb5zH/LGzNJJmqZSOkpjzoGwiMhIopNdaQ7HE2K?=
 =?us-ascii?Q?Km9779DWxZXqj2E7uh/38Uibacu0uuxQMD+oZwIBTF51CvtrZjvHj3tIqNv0?=
 =?us-ascii?Q?ytRGOG3DbAWBFdqLhzggRMzvSpRUJ5RazRMFTc7lj8KVVmTWbQIUPe4BVu7+?=
 =?us-ascii?Q?51b1m181XgMFVm+vzIgWrhCPZH9T5Ol+oWfQwA7g4bSoIXAGNPMwJT0vTfiE?=
 =?us-ascii?Q?cRrUQu+KNy2re4vY7hbnBjoWqttDumQ68ErVpAT1E2jq4qB14j+gBs//acGO?=
 =?us-ascii?Q?zs0m+O/ZqTcsYC/CoNcCupK5nSXGO+EIp6jGyMgFILH9iLABUEIop5SaIoS3?=
 =?us-ascii?Q?J7/MW7aoto9PkLfdKtoPnHB2FA5L9qE3sXyExh4hW52oXXCNlGY0bNFvqwsv?=
 =?us-ascii?Q?mVFCJI+5ZSc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lR6vgWpG65CAJNwsa1XHhiLSQthj0gtvZpdcteCWwBgonQ9sI/V+Byvel5Jl?=
 =?us-ascii?Q?tp9LK5z8haCMbCFKPLd3ci+zfONrfwFMr8Q0gSoDNlngk6RbaEo70SYsdLwe?=
 =?us-ascii?Q?KH7DuLg6UWSf2tOxYXdOaVni86bqM77h79hjBUfhSSTRbxl0xIKrnuW0DclI?=
 =?us-ascii?Q?D4ZxN6UNIMHU0k6jWh3d9ynIigkDOy/vI3NKgxdtAMAuljM+4qjiSIDYUdmE?=
 =?us-ascii?Q?jlcNe1b53UH2N8uJ7P/ue6lkjy/OlLyANGyJ1IarUQgxMNQBRTywROMFDr5e?=
 =?us-ascii?Q?q59Vb/eT3/V4/Onx2WaQ2phcVVz2KFGLJrq08w3l5TMRpTc/D+zVvW8vnJtg?=
 =?us-ascii?Q?FwZ71Q6SqBnqS0j+b/yIRUjNfI6IHYbzLTTYwaQB0bX8kXOr1419O7Wl7o5u?=
 =?us-ascii?Q?oxsOwai9H5ZiTmuSeXZY/sm+zWgz3EvEQMrw5r4p8mcWnSN3qfnXD03aAJX+?=
 =?us-ascii?Q?cQ7UnFj7hqbWNqMgKlHHgUwkM7Ecxha1uWsCRZxuVK0rOqh7SxWUC3wFFUOU?=
 =?us-ascii?Q?rXqeMKIKXewF4Rbn85ItLB5CcND23iwM1J75YQq8fFX/nSOIk/LoetWQ5WE7?=
 =?us-ascii?Q?bydTTBGT51B7CvFob5eFPZvCFD3B8oxT1e3J4sHcFMQ4HGQII4926rVQ6Hdw?=
 =?us-ascii?Q?N8MTSC0OFLMcUkTTbeg+wPAWbn8hvFIyQbcj9IoFYV82E1ccA9TNoxGj84li?=
 =?us-ascii?Q?sAvqTaJGv+ma++XoBYxbbjaax7ACRGRq5xPBRkK331956CFuSrkeELAQAuDA?=
 =?us-ascii?Q?KAbGYVzErFmi18NuVAa7YX4FJL6yOziXHLNX87+xn9wLzaNdv+/xPooajy57?=
 =?us-ascii?Q?OMFKNnPVbSqQNoz5+pS7bowH3PBkFr+usX2FzYXdfhK04fAFw9YcPmEsWwye?=
 =?us-ascii?Q?07pQQlIwQItqVwa1BbvxrcVC6GO31C3rmOf2RPZhSbVVfIt+SJXC4V5uORJ/?=
 =?us-ascii?Q?g7J4uScDxSnDrIiDUpAn4tKOJsH2Vc7nrZCdn0x//ap63ZbypX1+mqEtssQg?=
 =?us-ascii?Q?0MNJcBKXOO/SOoOkDp5q0k6zlbi+XvtjTJIrKvi1JakuqhZhLf0CzFnhLi9i?=
 =?us-ascii?Q?rscn1VCsVFtFv5FkEWV6UDnsIpfjh3C4HnBBeL1mG+HuwaUxg9i6X/9RZlaT?=
 =?us-ascii?Q?pAVyCIUSgMufTZHYK8WG0E6x1lE+BefEyR2iHSTay38ciV38W91kOtSS/49m?=
 =?us-ascii?Q?yqJ9lliR9cqhoeDOLwN+jmM2pEma7Fo2JbsHYIfmOfBXHPz0gX3/AwoFBVHJ?=
 =?us-ascii?Q?9wYsigKHdycDxW6CwuQuMgegc7PoNCdzI8AZbEbDhzZHJh2s8Anp52dPlVae?=
 =?us-ascii?Q?I0vKh0c3ic6aU952y8XetXuFXGsJyUsqyR4RlfmkVQXqiUWPlQYFIapf11+W?=
 =?us-ascii?Q?IAth3z8mq9alcNNWxMQrUvRSitTlB7xRa8/EhtW8tp1daRX4/QmC9T6E8Ru+?=
 =?us-ascii?Q?w2t2SO6PF+JJ27xfzgIjNE3wjfQaqf7wJLL7rQNTeJsToAOC9pc85vfYltTH?=
 =?us-ascii?Q?sc5h00nHLOE2BP3+QHI1nHwrAqlvnBQ2/5S1+69ThI6djM67II9IewDdVc7s?=
 =?us-ascii?Q?+l46PzRseXwRL9VnaEqo85KZiBH7+uSR91W3cXviGF5FklXRINXbkhc9iIkD?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7229ef7b-3080-41c8-2b30-08ddaa8d2b65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:15:45.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lYAU4ONLMYG5QQpzDHFQWLqgj27XfQ/h+AQDJYEGVe0Cnju1sVK6W1fK1P7rXUQ0jX9bpmMsxO8YEx7Avp8FhxMwQ9vj+3IqkxKgD3KBsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 15:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218614

Hi Dmitry,

On 6/13/25 2:20 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On 12/06/2025 14:21, Quentin Schulz wrote:
>> Hi Dmitry,
>>
>> On 6/11/25 10:08 PM, Dmitry Baryshkov wrote:
>>> On Wed, 11 Jun 2025 at 18:33, Quentin Schulz=20
>>> <quentin.schulz@cherry.de> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> I've been trying to add support for Panthor (Panfrost for Mali Valhall
>>>> and later as far as I understood) to meta-rockchip a few months ago
>>>> already and attempting again.
>>>>
>>>> I had managed to do something for an old mesa release but it doesn't
>>>> work anymore. Worse, it seems that the current Panfrost support is=20
>>>> broken :)
>>>
>>> That's an interesting claim. I hope you mean 'broken in OE-Core', not
>>> 'broken in Mesa'.
>>>
>>
>> Yes, I meant in the OE-Core recipe :)
>>
>>>>
>>>> For starters, the build doesn't succeed unless we have both panfrost=20
>>>> and
>>>> libclc PACKAGECONFIG enabled. I believe this is due to 20970bcd9652
>>>> ("panfrost: Add base of OpenCL C infrastructure") merged in 25.1.0. So
>>>> there are some changes required in mesa recipe to force libclc
>>>> PACKAGECONFIG *in addition* to the panfrost PACKAGECONFIG for the whol=
e
>>>> thing to build. This shouldn't be too difficult though.
>>>
>>> This seems almost correct.
>>>
>>>>
>>>> However, reading the aforementioned commit revealed something else (or
>>>> maybe I misunderstood :) ). It appears that LLVM is now required at
>>>> build time for the Gallium driver, so that would make panfrost part of
>>>> GALLIUMDRIVERS_LLVM now. The issue is that it builds with and without
>>>> gallium-llvm PACKAGECONFIG, and it seems to be running glmark2-es2-drm
>>>> just fine on RK3588 (G610; Valhall). So I'm not sure what to do here?
>>>
>>> If I understand correctly, panfrost requires at least mesa-clc /
>>> panfrost-compile to be built for the build system. We support building
>>
>> Not sure? I believe panfrost-compile is always used (either by taking=20
>> it from the host or building it) whenever the gallium or vulkan dirver=20
>> (or tools) for panfrost is enabled?
>=20
> Yes. The idea is to build it only for the host, removing the need for=20
> the target libclc / llvm / clang.
>=20
>>
>>> the former, but we don't support building the latter.
>>> The quoted commit has the options to be passed to the meson when
>>> building the 'host' binaries aka mesa-native and when cross-building
>>> mesa.
>>>
>>> Though I'm really surprised that building of panfrost works w/o
>>> gallium-llvm in the current mesa.inc
>>>
>>
>> For the target recipe, gallium-llvm isn't selected right now, and=20
>> adding libclc is enough to make it pass the build. But we also set it=20
>> for both target (by adding it manually) and native (already there,=20
>> c.f. PACKAGECONFIG:append:class-native) recipes.
>=20
> Okay, you are selecting gallium-llvm manually (for the target build).=20
> Then it makes sense that the build passes.
>=20

libclc* not gallium-llvm.

gallium-llvm always on for class-native
libclc always on for class-native
gallium-llvm off for class-target for meta-rockchip
libclc always on for meta-rockchip (not now, but that was the plan)

>>
>> For the native recipe, gallium-llvm is always there (c.f.=20
>> PACKAGECONFIG:append:class-native). So that might explain why you're=20
>> surprised.
>>
>>>> Making it part of gallium-llvm drivers brings in clang{,-native} among
>>>> other things which is horrifyingly long to compile.
>>>
>>> I think clang-native would be required at least.
>>>
>>> If you implement precomp-compilers in some way, the correct build
>>> options would be:
>>>
>>
>> I'm not sure it's necessarily worth it as one would need to have=20
>> precomp-compilers + all drivers guarding this precomp-compilers (right=20
>> now panfrost and asahi it seems) in the native recipe as well so that=20
>> the target recipe could use it.
>=20
> I was thinking about enabling corresponding options in the BSP layer.=20
> But... then came the second thought. In the BSP layer we can use target=20
> overrides to select options for the target mesa, but we can't similarily=
=20
> change class-native PACKAGECONFIG.
>=20

Exactly, the issue is have a class-native PACKAGECONFIG that depends on=20
the target machine you're building, so that panfrost/asahi=20
precomp-compilers can be compiled only when necessary (when building for=20
panfrost/asahi-able target machines).

I'm not aware of such a mechanism sadly :/

>>
>>> PACKAGECONFIG:append:pn-mesa-native =3D " panfrost libclc gallium-llvm"
>>
>> libclc and gallium-llvm are already part of the mesa-native=20
>> PACKAGECONFIG, I don't have panfrost there though and I would need it=20
>> to make use of precom-compiler=3Dsystem on the target recipe.
>>
>> Considering we would need panfrost in mesa-native (+ precomp_compiler)=20
>> to be able to build panfrost on target, does it mean we should always=20
>> have panfrost in native (in OE-Core) to avoid having to figure this is=20
>> required from target recipe's perspective? or in BSP layers?
>=20
> It seems so...I can't find a better way to handle it, provided we want=20
> BSP layers to pass yocto-check-layer requirements.
>=20
>>
>>> PACKAGECONFIG:append:pn-mesa =3D " panfrost"
>>>
>>> Note, currently we don't pass -Dmesa-clc=3Dsystem if libclc is disabled=
.
>>> Most likely that needs to be changed too.
>>>
>>
>> The issue is that if mesa-clc=3Dsystem when libclc PACKAGECONFIG is=20
>> disabled, we still need mesa-native (with libclc PACKAGECONFIG)=20
>> otherwise it won't be found.
>=20
> Yes, this is expected.
>=20
>>
>> However, maybe with this we can lighten up the dependencies in the=20
>> target recipe in PACKAGECONFIG[libclc] to essentially only mesa-native?
>=20
> Yes.
>=20
>>
>> It seems like maybe some PACKAGECONFIG (e.g. libclc, the upcoming=20
>> precomp_compiler, etc...) should be native-only? What's the point of=20
>> libclc for the target recipe for example? Is there even a point making=20
>> those PACKAGECONFIG options maybe we could simply hardcode them in=20
>> EXTRA_OEMESON for example for the target (always =3Dsystem for mesa-clc=
=20
>> and precomp-compiler for the target recipe for example?)
>=20
> libclc is required for RustiCL support. But then you can simply fold=20
> libclc into opencl.
>=20

If we enforce mesa-clc=3Dsystem, then I believe so yes.

>>
>> I "quickly" hacked something together that would make panfrost build=20
>> without requiring to add libclc to the target PACKAGECONFIG. This does=20
>> a few things like using precomp-compilers from mesa-native and mesa-=20
>> clc from mesa-native without requiring either PACKAGECONFIG in target=20
>> recipe, forcefully adds mesa-native as dependency of target recipe=20
>> (though maybe should only be added when libclc or precomp-compilers is=20
>> not in target's PACKAGECONFIG?) and removes libclc spirv-tools spirv-=20
>> llvm-translator from build dependencies for the target (panfrost=20
>> builds fine, but is it correct?).
>>
>> """
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=20
>> graphics/mesa/mesa.inc
>> index 9b41955132..746b5f7be9 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -97,7 +97,7 @@ INHIBIT_DEFAULT_RUST_DEPS =3D=20
>> "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
>> =C2=A0=C2=A0PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm intel amd=
 svga"
>> =C2=A0=C2=A0PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm intel =
amd svga"
>> =C2=A0=C2=A0PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm intel am=
d svga"
>> -PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm amd svga"
>> +PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm amd svga=20
>> asahi panfrost precomp_compiler"
>>
>> =C2=A0=C2=A0# "gbm" requires "opengl"
>> =C2=A0=C2=A0PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>> @@ -194,10 +194,18 @@ INSTALL_MESA_CLC =3D "false"
>> =C2=A0=C2=A0INSTALL_MESA_CLC:class-native =3D "true"
>> =C2=A0=C2=A0MESA_NATIVE =3D "mesa-native"
>> =C2=A0=C2=A0MESA_NATIVE:class-native =3D ""
>> +MESA_PRECOMP_COMPILER =3D "system"
>> +MESA_PRECOMP_COMPILER:class-native =3D "enabled"
>> +INSTALL_MESA_PRECOMP_COMPILER =3D "false"
>> +INSTALL_MESA_PRECOMP_COMPILER:class-native =3D "true"
>> +MESA_CLC_DEPS =3D "mesa-native"
>> +MESA_CLC_DEPS:class-native =3D "libclc spirv-tools spirv-llvm-translato=
r"
>>
>> =C2=A0=C2=A0PACKAGECONFIG[gallium] =3D "-Dgallium-=20
>> drivers=3D${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers=3D'',=
=20
>> libdrm"
>> =C2=A0=C2=A0PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-l=
lvm=3Denabled,=20
>> - Dllvm=3Ddisabled, llvm llvm-native elfutils"
>> -PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-=20
>> clc=3D${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=3Denabled,,libclc=20
>> spirv- tools spirv-llvm-translator ${MESA_NATIVE}"
>> +DEPENDS:append:class-target =3D "mesa-native"
>> +PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-=20
>> clc=3D${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=3Denabled,-Dmesa-=20
>> clc=3Dsystem,${MESA_CLC_DEPS}"
>> +PACKAGECONFIG[precomp_compiler] =3D "-Dprecomp-=20
>> compiler=3D${MESA_PRECOMP_COMPILER} -Dinstall-precomp-=20
>> compiler=3D${INSTALL_MESA_PRECOMP_COMPILER},-Dprecomp-compiler=3Dsystem,=
=20
>> ${MESA_NATIVE}"
>=20
> I'm not sure if we need a separate option here. I like your idea of=20
> folding this into EXTRA_OEMESON.
>=20

Fair enough. Will try to come up with something, hopefully not breaking=20
stuff. I only build for Rockchip target machines so it's difficult to=20
think about all other corner cases (which is also one of the reasons it=20
took so long to update the mesa recipe so thanks a ton for making this=20
happen).

[...]

>>>> On a side note, I'm also not entirely sure why we need
>>>> softpipe,llvmpipe,r300,nouveau always enabled?
>>>> Can't we make softpipe the default only when llvmpipe isn't enabled?
>=20
> I forgot to comment here. I'd say, please don't turn it off=20
> automatically (or at least allow it to be reenabled). I've seen several=20
> times the case when llvmpipe crashes, but softpipe works. I don't=20
> remember what was the cause, but it's nice to have both available.
>=20

I actually decided to not do it because the logic would have been a bit=20
complex for not much benefit (I guess?). I would have had to check that=20
llvmpipe is part of the final GALLIUMDRIVERS variable (it's disabled for=20
some architectures for example so even building gallium-llvm drivers=20
doesn't necessarily bring it) and then strip it from the string=20
manually. Too much effort, especially since I read somewhere that=20
llvmpipe is *in some scenario* faster than softpipe, if it's not always=20
then I shall leave the choice to the end-user :)

Cheers,
Quentin

