Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1935FCA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 15:16:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.42])
 by mx.groups.io with SMTP id smtpd.web10.54547.1756739807122385970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=MFa9/1V3;
 spf=pass (domain: cherry.de, ip: 40.107.159.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPLt6HbroREh3+LulMwbcqpIt7HdWmBanV4iBH7pyulrZF68LoGiqNhxAgQJZ5Hl2NhIgwm3ayLSQbpU6mH/tVl3zQzPfkZGOMz6DWnHkTMNqtq6+qEju/fNi9u6DEoYn9MNajU88uAnUnJ1BNNR2VB0xp5+i4RYvMO6+RNfubXDHkg9jS2jYV5k0FVFAOCp4pFccL7RAQfZnW8z0wFn7hISbDOhhyo4Xgd4IixCNfNTQkOG1w1CCxKzPzh3COpF6J9rHIXCLG6FhP1OZi8iNaofeUaJDg/gNLb1to3TfO/yQUTNBTPPHu4DOL2/NfEDn5obca3qT9K0MfTyb8ot+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9Q9SbybjjfbgW+fJZ8fCmaAuOKdYczHVTnKb4GHzuY=;
 b=Ol6AT8GmbjHvpgi3Nr3yWhSXcFVaCYU6xNsthYS3lOp2TE7o4xbddRPRuHqOFhGbX6NJzceNq9s1rjpobvORQaj338bUBO+62S+iPQQfoTtr7WY8gBgBbSF3dqJz1RycRPDjAHqstfzD2U3XcLZHXyzIfkASlfztLBTKRVngx/OIl/yjgqJ5OX7ziRNXeEWZCADmEKI562IuRhn3TMAqpNOqogMqbUD8QQkGQm4BNmiNfIp5HO7+R05W15ocreIypV4dtTfo6EVV94HxyN2YVPxejj0OQVYAChlQd+H9MHrbQvGD/xO2pQ9McwHaoInPDon2kReknz1menWipGdZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9Q9SbybjjfbgW+fJZ8fCmaAuOKdYczHVTnKb4GHzuY=;
 b=MFa9/1V3ZsL/mFdFIQXRyCvhq1qTpDG0Kx8oBdma0aN76yxdQ1p9lOUqt2NAIWvHaf+gO8k8YChgq53ssUZCDBO2aHZVw6VWMjpFU5OBxSbrS0EIPHte0C+gmHXcejbTrwEw4U+/ASjn5MPIcDM56G4QcdRAr6oDOb0VUBqJbGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9391.eurprd04.prod.outlook.com (2603:10a6:102:2aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.14; Mon, 1 Sep
 2025 15:16:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 15:16:39 +0000
Message-ID: <b309bed3-501f-4bbc-a95a-f0f2e44e7bed@cherry.de>
Date: Mon, 1 Sep 2025 17:16:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6f079c-0493-4f32-21b6-08dde96a8c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MCnVqa/ouPU/k/d0pC6v+LV7/BkzjD4gHUvBAEXbftjztzo4Qm4Xh3OoPHnm?=
 =?us-ascii?Q?4V2lDN8XBcdBcARBs4pmjGpMJCST2RjGoeHJvGF718gKYgJrlEX8Z5aFWLl+?=
 =?us-ascii?Q?LCQB4qluflYnp7/WzpKxC59nZHrBmz2rp4mtDtpOsr5UmdvypdZsxDNbEUUB?=
 =?us-ascii?Q?sh30od0lrQV9r8u5Jtj/no9Df1//OPMFgUYCnU4hMsTXpS+YMudb+O4VCzNB?=
 =?us-ascii?Q?QKhN/UvF/6cJS4pMUin3rTsNkaxaKajngPUhXUgIX5ek8s/I5c/DSw+ewEcI?=
 =?us-ascii?Q?IEpw2lKf4JZ674FH8Vn3msfWp1dyT2e4eKlX4eXqsLh5h91jhTyqyhe54hwL?=
 =?us-ascii?Q?c0emFpkpFmHDKeL+sRHj359MmaU1C1P6v7ilJgoX8zFibMvUBGJ7k7bpZK0a?=
 =?us-ascii?Q?rnZ+vSuB4aSQ1FDmyc9kkcfhFNDKuBkFusNzWL1gbi6mCOgNJYC60uzxti56?=
 =?us-ascii?Q?7C9KACU53J8wU6b9rcZeQbq+ghAYa5qMPNBtXCMoqaDD6+bhJ6os4nsv3SRL?=
 =?us-ascii?Q?j9r2bc8MyZHJ+RoS7cXqYVc0W42DAmNEGjNi9vUPVtCYDafeirtXHWdA3i/B?=
 =?us-ascii?Q?ZTgWBEqyzPKj0k8RcZRF0se5phh+JXvv8FnslFxgRey9SUIh6Mu2Azh1zSYQ?=
 =?us-ascii?Q?uamZNtIQImeFMxGsASZC6SUk/X7hX5Qdukt9tAiHWKpfqiPGFYHgsJcmKG2m?=
 =?us-ascii?Q?HRnf+ZWZL9SFODHPygx/tG+3eSebQMejZSr0YAXKgdlilL76w9WVLWK4owrD?=
 =?us-ascii?Q?9gjl3QcoI9IETe4nj5qR19kcO2PultISVJiJ9/SqbBSAi/Bur4lexMZwMUfb?=
 =?us-ascii?Q?8Hp3XKTgh4AHEIfPePIvxGQ1wXbWxVyzV/t5OqhYwpDpLnU5fEVvvXZLz7r0?=
 =?us-ascii?Q?G/U/hqwBFnKOn7918kZ66etqGzeXixm51DqTX0Lh47TB8enzbXmwwg8R5uB6?=
 =?us-ascii?Q?15Ou6lvEKIFpTc9ctrBn7rWD8WDQ/DjY22Jaw0iwaUMMtUXU8uw3j/XgJVBO?=
 =?us-ascii?Q?VWyHO/Xo/5pmyoXyBZ20yHBhjhkM8Ss9tFqV+np6ILDqTzK9vAlbrfCE6yoT?=
 =?us-ascii?Q?dU5DITA1GIih9VmWkaiW01O/QndusGhb2nLwpEHB8jAhS7iECRO1ZDj62zZS?=
 =?us-ascii?Q?/SWM6ZUAsENXUsav71dLzoi0aW/sGk6NC5yu5ExPBEaR3kjcnxGuogrueLxV?=
 =?us-ascii?Q?cKBl0s1seG9sj0qBXj3WFg/DGZNjYt7o1lJShtEwBgmyv3UR2wP/t9of1rSK?=
 =?us-ascii?Q?e7PxEuF7ZJl/BmjBcrMTPmKiZBgaJQPH2yW2VInmvWM7RXd2nT33iXlfN938?=
 =?us-ascii?Q?CRrggKqkeqpraihW5pClbnb+tioNKUvR590KCpSpmPbInvjkKjXIeMb3YCTD?=
 =?us-ascii?Q?KcHtjIY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?84pihZF4K+I2S2dLyHlTE9VelVbCaAAlddW1qboL+4UriT4UrG3uxeWWwBaG?=
 =?us-ascii?Q?oEJyCVVM5hy/r+nK/DldoWXOSNZOnuupSiQL7y9RQPLAWQeELopwVAfiLOM4?=
 =?us-ascii?Q?sHT7o4EJ2NwN+U6YPXsU1vkez4GI2kUx80cHm0Xl+n/2lDpG8/XKQd5TIu0s?=
 =?us-ascii?Q?4hKuh64Wj+WOFmmJ3FLJm+AwQ75cM2sHShZiinPlC0jYzKk49uM2UeM72QRp?=
 =?us-ascii?Q?h2dHf/acumzoGI+jWJvd43X0vYwpJHi5T4datGTMO3S1LkuuFsafcxM8K8v6?=
 =?us-ascii?Q?GQDzRrg47zLLQLvSc+m02GGe74M8ETt2mBBo8+tLjCZTS95SKFXKolbnq5DV?=
 =?us-ascii?Q?85bpdDbLmJVFxrkGPwCVHD+sb5tOSgMkYGMk/2eFOw/MfrcZUwzpgdecKTi0?=
 =?us-ascii?Q?NM3rU0FYLlFxqzzGHu5KfNqKgY2/7iCzZIUUJiZ0UcnvNzk6KXzV62pE5Ggb?=
 =?us-ascii?Q?HtivAE5gz+D0FzLT85eWHgBBmCMxLUEAnkotZQGi7+5DbtBk8vIKyWYeoxEQ?=
 =?us-ascii?Q?wzOsGpwx0pvVulbVRtITirMHrAbUc8gwdbKDIHdEQn0gx9vDoPaOS0J04Riu?=
 =?us-ascii?Q?c7Y01j2zvqSyKWuazWNGGEezfVnzCLJrsF5MYMRBnDYxi8xmTebqDv5ZdeMs?=
 =?us-ascii?Q?d6Wn9JbKzlxlykWuj1MgIwv2P4ZWFMWtTFDl4O3pqiR/iSEjIiQ6rubSS6b7?=
 =?us-ascii?Q?1wLL5qje8ncFIUJX/5xkhUbtQOvkUovOue4rPxi9pO8v/NKep7fLXq8DgdnB?=
 =?us-ascii?Q?djODPN45/EHwL8ZvaCtPeLqAKx4pInbVTJoHebjnwhFHkFUXUOuefBUnCU83?=
 =?us-ascii?Q?RBmrHOUAZ1qh+KWBK+QxQhNes5f3Y6tBWoj2zJWWgN/RE/H9+nQqmYjEZ70e?=
 =?us-ascii?Q?cSg15vO7SOisd6KsU/WL9+XxN+Vr2/2CMtj7zj5u00ZAi/0+GhMgSwrQdioh?=
 =?us-ascii?Q?jfsX3AMleHbuZbYDpxJ+EUIdBQTeZ0dbyD+QjxPiwDFmNCZy57hz49SvN/qM?=
 =?us-ascii?Q?WBoi1Tqak+S5TiBKgUz9XNPhLYz7Sw/d/OAIspwk13YRmooRq861mMDYRvGi?=
 =?us-ascii?Q?llk6NYgOX28KvoMHhVAZOXWNe1CgisV8BrdJS7nt+SU2RepnICl457KmpOFo?=
 =?us-ascii?Q?I47995LBfjTWm1+h3xFeDCyzETNjg5PHHOi5h2wrTDx4eG2lki+M+T4dVDD7?=
 =?us-ascii?Q?Gr/MPDJ2rz8EnTsrprDxR2mBBWVmhTbx5apnXARuDTNzD6f4he8zBXgyHtMe?=
 =?us-ascii?Q?+mohWFfs6UQq9rxIIoak6BCk7uj0/g+yjk67qJmjnbTfKGEhOywv7Io7d5cS?=
 =?us-ascii?Q?r3FfZaPRl6HTJ+sLgUyKqYznLOdNnx5+QAoo4KwsX6L91OonlULDF7TNeiWR?=
 =?us-ascii?Q?XIzg7QWsX5P43ARK0b8jOygNsyVMhwtPAWp1PsuS6sSb5wO5FUm9vaSi4IVg?=
 =?us-ascii?Q?yMC7nQHvnAzFE30ex85+0bIHXSBuNBXBWdf6utJ5ZPvsKBhX9rWGlo1rqbzt?=
 =?us-ascii?Q?v+mlA0WshUUhSdLNOb/BOYkqzeJbPOSlx4fUMqUPRk8U3Vjr+5wy7eqIiI0v?=
 =?us-ascii?Q?G4ut6bRW4Uwk/6NCKYGa1iS7PKVqP3z/hH99Ts5mOjR/SeirqSROUm5gufBy?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6f079c-0493-4f32-21b6-08dde96a8c28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 15:16:39.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpCyhBL1MOBJwRHM6If/oL0L1MoIhjTgVOAvvyJVssll42UNeru+7/rWEfUc/vuNbZGjq1AIuMjZuH0D+8eqjIIGszdvmz9ngFxffifsJJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 15:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222665

On 9/1/25 4:51 PM, Quentin Schulz via lists.openembedded.org wrote:
> Hi Mathieu, all,
>=20
> On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
>> On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
>>> @Otavio, can I add the new mesa-tools-native recipe under your
>>> maintainership in meta/conf/distro/include/maintainers.inc, it is after
>>> all still mesa?
>>>
>>> Panfrost support has been broken for a while already because it now
>>> requires libclc which isn't enforced by default. This fixes this
>>> oversight.
>>>
>>> While re-adding support for panfrost, the build time for libclc were a
>>> bit too much to my taste and I tried to figure out if we could lighten
>>> up the dependencies for the target recipe and it seems to be the case.
>>>
>>> libclc brings very expensive dependencies such as llvm and clang.
>>> Building clang and llvm for each target architecture is very expensive,
>>> but mesa allows to depend on prebuilt host binaries (mesa-clc and
>>> precomp-compiler). Those are built by mesa as well, but can be compiled
>>> in mesa-native instead of mesa, making the dependency expensive but onl=
y
>>> once regardless of the number of target architectures to build for.
>>> Ideally the mesa-clc and precomp-compiler would only be compiled in
>>> mesa-native if target mesa requires libclc support, however this is not
>>> possible as a target recipe cannot impact or depend on a native recipe'=
s
>>> configuration. We thus have two choices, always build libclc in
>>> mesa-native with its heavy dependencies and impact every build or force
>>> the user to modify the mesa-native recipe in a custom layer (as a nativ=
e
>>> recipe cannot use target's OVERRIDES). The latter is unacceptable so th=
e
>>> former seems to be the only option. Another big downside is that
>>> mesa-native currently builds drivers (amd, nouveau, svga) which we may
>>> have absolutely no interest in building, increasing the build time and
>>> possibly dependencies list).
>>>
>>> A third choice is to spin-off the native mesa recipe with libclc suppor=
t
>>> into a new recipe without drivers and only what's necessary to build
>>> mesa-clc and precomp-compiler binaries.
>>> This allows to keep a "clean" mesa-native recipe for whoever needs thos=
e
>>> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
>>> and only bring the libclc dependency when required by the target recipe=
.
>>>
>>> Because libclc is now only built for the host, opencl support now needs
>>> to explicitly bring libclc and others to build as libclc won't bring it
>>> in the build environment anymore.
>>>
>>> Note that this was essentially only build tested (run tested on RK3588
>>> with panfrost though).
>>>
>>> Note that building gallium-llvm support on big.LITTLE architecture with
>>> TOOLCHAIN =3D "gcc" (the default) currently doesn't work as llvm doesn'=
t
>>> support big.LITTLE architecture in -mcpu/-march which is passed to the
>>> CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
>>> further than that but that prevents us from building opencl support for
>>> Rockchip most popular and powerful SoCs right now. One option could be
>>> to force this recipe to be built with clang toolchain only whenever
>>> gallium-llvm is specified in PACKAGECONFIG (not tested). Though that ma=
y
>>> be not straightforward seeing the comment in libclc recipe related to
>>> forcing the toolchain to clang.
>>> I'm also not sure mesa has a way to specify different args to LLVM-only
>>> drivers but that could be another option.
>>>
>>> Runtime tested on RK3588 and PX30 with kmscube.
>>> Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
>>> after some time but could be kernel related as it starts failing after
>>> [=C2=A0 968.625506] panfrost ff400000.gpu: gpu sched timeout, js=3D1,=20
>>> config=3D0x7b00, status=3D0x8, head=3D0xa68d200, tail=3D0xa68d200,=20
>>> sched_job=3D0000000019e6f20d
>>>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>
>> Hi Quentin,
>>
>> Thanks for the new version.
>>
>> It looks like we have a build issue for riscv platforms:
>>
>> ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The=20
>> sstate manifest for task 'expat:populate_sysroot' (multilib variant=20
>> '') could not be found.
>> The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-=20
>> nativesdk.
>> But none of these manifests exists:
>> =C2=A0=C2=A0=C2=A0=C2=A0 /srv/pokybuild/yocto-worker/qemuriscv64/build/b=
uild/tmp/sstate-=20
>> control/manifest-qemuriscv64-expat.populate_sysroot
>> =C2=A0=C2=A0=C2=A0=C2=A0 /srv/pokybuild/yocto-worker/qemuriscv64/build/b=
uild/tmp/sstate-=20
>> control/manifest-allarch-expat.populate_sysroot
>> =C2=A0=C2=A0=C2=A0=C2=A0 /srv/pokybuild/yocto-worker/qemuriscv64/build/b=
uild/tmp/sstate-=20
>> control/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
>>
>> https://eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuil=
ders%2F45%2Fbuilds%2F379&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7C0c66=
831ac5ba49c1d25908dde9671d66%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C6=
38923351293360001%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL=
jAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sd=
ata=3DAo0lx3qCzc7c7LM8aBbFgzKhgDOTldZQq%2Fv9GLbKhQY%3D&reserved=3D0
>> https://eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuil=
ders%2F56%2Fbuilds%2F396&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7C0c66=
831ac5ba49c1d25908dde9671d66%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C6=
38923351293391687%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL=
jAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sd=
ata=3DyxdpkunuYbmZehHivrJxHkqCZwPSfiT2m4xVnm27oUA%3D&reserved=3D0
>> https://eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuil=
ders%2F58%2Fbuilds%2F362&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7C0c66=
831ac5ba49c1d25908dde9671d66%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C6=
38923351293414274%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL=
jAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sd=
ata=3DdCx1ZUeLnMbcG9w4Rs4PcazKrfhWh7U88Vu4k1Lzjnk%3D&reserved=3D0
>>
>> Can you have a look at these, please?
>>
>=20
> Ok so I believe this is because mesa-tools-native uses a different=20
> mechanism from other mesa recipes to be a native recipe.
>=20
> mesa-tools-native inherits native + -native in the recipe filename.=20
> mesa-gl/mesa simply adds native to BBCLASSEXTEND.
>=20
> The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib)=
=20
> in it. In the case of BBCLASSEXTEND, non-native dependencies are=20
> suffixed with -native to be native when building the native recipe. But=20
> in the case of inherit native + -native in filename, it doesn't.
>=20
> To validate this, I did a simple
>=20
> DEPENDS:remove =3D "expat zlib"
> DEPENDS +=3D "expat-native zlib-native"
>=20
> and compiling mesa-tools-native on qemurisc64 then worked just fine.
>=20
> For a quick and dirty fix, I can simply parse DEPENDS for non-native=20
> packages and just add the -native suffix, but it feels very wrong.
>=20
> I remembered that PACKAGECONFIG can also bring dependencies to DEPENDS=20
> if selected and those have a mix of native and non-native dependencies.=20
> Turns out, those automatically get -native appended though! (via the=20
> anonymous python in base.bbclass:529).
> So I'm wondering if we shouldn't "just" fix the DEPENDS not adding -=20
> native suffix when building for the native variant even when there only=20
> exists a native variant of the recipe?
>=20
> Otherwise I started to look into making mesa-tools a target+native=20
> recipe to match the other mesa recipes but then I hit a dependency loop=20
> for some reason (and also, there already exists a mesa-tools package=20
> generated by the mesa-gl/mesa target recipe, so that may make things=20
> more confusing as well. I guess I could call it mesa-tools-only or=20
> something like that, this doesn't break the dependency loop though).
>=20
> Any preference on how to go forward with this?
>=20

Discussing with Ross on private IRC chat, another option could be to=20
postpone patch 12 and merge the rest as they should work just fine like=20
that. Patch 12 is a build optimization to avoid building panfrost/asahi=20
drivers in mesa-native to be able to build panfrost/asahi mesa target=20
drivers with precomp-compilers enabled (which are enabled via=20
panfrost/asahi tools in mesa-tools-native), as well as only having=20
libclc dependency on the host and not requiring libclc PACKAGECONFIG to=20
be present in both mesa-native and mesa target recipes.

I have some unrelated clean up for mesa waiting locally as well, so=20
reducing the amount of patches I have to carry and rebase would be nice=20
:) (especially since there's a mesa recipe upgrade we probably want to=20
have as soon as possible).

Let me know what you prefer on how to handle the issue reported in the=20
previous mail and the partial/full merge of this series.

Thanks!
Quentin

