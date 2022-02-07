Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355F1C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 12:12:39 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web10.21345.1644235956755609439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 04:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=m8JLDVT8;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A69XODf5WXSe0geM2DtjOzM/ZVBV0H2sLaGvQgR1bcxYfwF8KLOOWpP/uzbQM8JXteGbZ3VWxTWL2Z2rVDPfZqoPsBnqA+2c0bm6hvdgkaj6w6nSW/8PKeaKH5bI6v5eMXP0JklniApcw+voMtDplRAHCt0YJ8RntAPfsbG0ylamOiOvd84IWcoIGk6AXAtjevhz3FNX8+uV1dhbilHI0mJsCRwnxJCaXforuBiZpcdjaFi/RsWpDrf8LzmI3JW0Q+1taPM7BEsq2CMtBj6bmNNJ4KyYsFG9q+BavtsktsZo60r4I0JnP5PJyldxWXUPT2XldPpGP6BQqMWKLixxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRkW5GEABDT7K0SO+mJ8iK/AqXG2yPGnAsXjd4I+zNw=;
 b=LPLah7/P3tnnvVrfyeV1z5Vue5oPVRsk8gn9X4NtXhMPNVyNpYDTHlbz+QcDnuNBbsQTLCgx2zlg/jDbin35lbg2JzgXMA5xsfz4CcpygZ/2mbREbTjiM7vrV2a3DRhgTioUlzc8BDBzzSGzMFLwE6EQpY6PEwteZ9kPuixSZhC214GyUnUIH0cS7Imr/Di6COdEypLtXMhd9Hgrcq21ymvnaSpSMVc7c9e4rKjHDD46US7F5Po5Q4JIfIR6sOnPoPx1HfH9WVjpaPpVRN6gS8Mk+3rQKjR+qWKKa2SgxucG+M8nys6PZaQ9DB/f+DZTLVTPJr+rboEcSBZ5We+hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRkW5GEABDT7K0SO+mJ8iK/AqXG2yPGnAsXjd4I+zNw=;
 b=m8JLDVT8fWGME0HLRYgMR3bE0lbqTuLt0QnCrU/8ZY0u4BcU7390YAroXu1yRiRzzJIhZoL4/V6qnNSIWWkQ5UCf4tlA/iZ5aYyMngdA/kCPGFFSNmF3fuuQJvkhZnIGkfcU5/8zM2ALOZZtHvXEjCGyMrnX7ptU4UNm0/q3qUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB6803.eurprd08.prod.outlook.com (2603:10a6:20b:301::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 12:12:33 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:12:33 +0000
Message-ID: <e562905a-195b-30a3-6491-54db38fc5899@weidmueller.com>
Date: Mon, 7 Feb 2022 13:12:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
 <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
 <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
 <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
 <50aaf17e-9588-6d97-9d97-8f20769404d2@kernel.crashing.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <50aaf17e-9588-6d97-9d97-8f20769404d2@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:206:1::18) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0877bc62-e7cd-4857-6799-08d9ea331ee4
X-MS-TrafficTypeDiagnostic: AM9PR08MB6803:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6803A11C0DFEE0D094D1D822D72C9@AM9PR08MB6803.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ywi/2QqR9g8Ya0C9+ob6N1QZKtYqSG1sOzlH94vWMOKC9XMaouz+EU7SMFu2OUzgc9vbu+ZlFnWf2enrTraIZMrOJHvFwzDueZyiav1UKYtyqt9CnUfAa9FX0LJOBs8aVEZzwtobYq3fNW88kgxX10In7xCp5ptQZTa8IQxJh+2aaJNWQ0vmF2d/BYZtT/TWhXqORrOWVJWWDkmZNtspqgH2K6gnXDyJYpR6cYGXw+3PtYLcWlJDtBuenaj8A6Q6CMxLVEGE0v9sY/9FfvcxnyHpJiNHTcIvU+Ev4jSB2TvZYSyattk/w1G0Y8KKczgvV/y08+KGThxobyuuCW+O0Myzscelb/oaU9rTHUVhcH5sG1EbtoySdBJPvefx/UatJAfnZ9CgaioCyiVdaBjsiQ6eTGCIPhPyc2L5FGja7mvQSn80pom6hU58Tqrjoba9YshxP7rwLs4/WcEXqDzDau95GLv7l2VGdt0vKqLNZwtts6PemLuAyeQ9xxiwiCtifVAthwL04Cdzp3OxAExmcrO6ygPB+CtEcXiQWjED+vssHYPFsD8i9qzxuKNyUmgRXrkpHo0fiHrTyrDVwBWW0BZxRdikjWPsWw8A9qk6ixZDViQ+8t6e1N5EI9ytjTJbJJtHdG6wRqKV5O9FN3ozQruEVhSwgKWCVdCssskaFHY32FcVgrvUki6Dixm1VnaKfquPiK/SW+V9tPRbkyrOGVrwiyrz5vHoG+0ff60PHKnyydfamNdPjZLxruh5T85xjePEXuJ9o8kUDZKmw28dLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(53546011)(2906002)(6506007)(86362001)(66556008)(4326008)(52116002)(6486002)(508600001)(66946007)(38100700002)(66476007)(8676002)(8936002)(31686004)(31696002)(110136005)(36756003)(316002)(107886003)(54906003)(6512007)(5660300002)(83380400001)(26005)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0N5K7ocw4agQrwnskq1MT+DoULr8ChwnrPm1DXUqR5uVucI9Yd+eIpgzSKkq?=
 =?us-ascii?Q?7MDtJpg2f7bXNeiBQu8CZ+oR1Yg7A3dEDKuBdWbiaswxSMojHEZfpwoDFmcI?=
 =?us-ascii?Q?QmiiuxNlorOeVpP8uwxFhR08uXUNftHRz3iCwbw7MeyVBIu/vWUpCy+B6OwA?=
 =?us-ascii?Q?rpeVBWiiW/KeTs4RN+qH6xew9ZWHYYY/5g8OZgobhz6OgRoljJVAoCrv2dci?=
 =?us-ascii?Q?rsKQG3i4YPuJnJ7cU9J7uUDHEn2QL/642yzBOskuraFljAFQ8esawRUClrbh?=
 =?us-ascii?Q?DFM81tEQklnZtTE0kMCNl2JzT0Cp2Ex9E+/wBXmPIbovcOXvPVdDDb6z/gBg?=
 =?us-ascii?Q?8eA4zbyYoDfH4uSD5pahcdNdQtUAvHdpGo5Omoh4O2lhfK1V9YuXawsvQckv?=
 =?us-ascii?Q?PM53IPprcZMqlVgGRok5T41k56ykdiyVNQBP2qoO+dMK8iaMm9Kd3i2BJ2/8?=
 =?us-ascii?Q?Kl2cpWvQ/9pmMYiHvIc0mkRyiHaLoR6lXSmsgf26BU+gaUR/WAiEtercvHF5?=
 =?us-ascii?Q?9Y+EAdGwJyqYe6WkUqPSb+M4HCYffEp09gSUzFNTuXYpcOq9+9bvKH87dW77?=
 =?us-ascii?Q?un36vhPkKMbwWEMYTMNVdXj7+SWQXcr/4WkMFcVfs2S55KDAhNXIFeSPpa5O?=
 =?us-ascii?Q?tB2EBRQFxMCHxEfaTtpyzvqxw+bZ9JxtXnNFWSPflLaPOgK/KR1LzFcUYCEX?=
 =?us-ascii?Q?GcEdMAtZn+PB1N9K5cLjXNTzMtOtq1UiF5GUhuPdfhNA7Vycub2IQqzGHHI6?=
 =?us-ascii?Q?DzSCwmdWQryiSxgfGQqpvCdD0UXcE/zcb85L3TX7T+JqvO1x2OUlWOY7HMe8?=
 =?us-ascii?Q?x4LNHEZPBi6bc0HgmcPsVDdk8OSB05hbsLUt1C5iy5Mslio3xbF7KgQbZ4nt?=
 =?us-ascii?Q?LAqC1LnsriuCMm/jeWS6QyxsoXNhGO0B3vyCM10jc+v1RAjygVdlITwgwOQq?=
 =?us-ascii?Q?H1iOB1n9GUegAknJ7WZh4lFWd8cdbnMWSfQJMb0HCIb9HFYNyeH0KbEn1Pic?=
 =?us-ascii?Q?rvhn4pSJ5O3TygJZGky3dJYvELVKhxHEEiePPhqkJZ/hRiY/JVMMPD+8fkdb?=
 =?us-ascii?Q?a6PtJlBq0Xt+hqp/5NepQExa/sMBQJZVXgD+9l0iC/1UtxuLgNErNvYszAS8?=
 =?us-ascii?Q?wUEquZu1GlvP1qd4RpEjVrFH3L3BAN2lUvA6XlKZeKT6SS+vBP+zePDxGgE7?=
 =?us-ascii?Q?q+xe3zT9hbVIVUA3+qENsOkQqlGzGtrjdPgtVgYQ06/Ry4C2dEl+JEH+cVgp?=
 =?us-ascii?Q?Qyr5ztPcXGXpBNuDxBfXDkGi6PLpbhQK0me/PZHwemfMsqhlfEzXhk2u/vIj?=
 =?us-ascii?Q?gER44UaaQQe/n7cAfGQpfhVOBQPGMa0SM5fzIvxboEeyAgAIaG/D5Ct0UJg8?=
 =?us-ascii?Q?yimPx3rufTg1cdNl+BRBXdniIK6RUJCdNg2G14hXyVgHvYVckOL5VE8ANimf?=
 =?us-ascii?Q?OCzWduoG8/OnHJ/QANaeK9aSSHycnH0T3/oV8gnZoflnJWGUKFC4NI+sHtiV?=
 =?us-ascii?Q?Z9bFNrwngLBWvJQ52MJe4cqGiQdmP0J9mrw1vHlMasIji8IqXo5D94oeUGFt?=
 =?us-ascii?Q?RxBx1zXsacZa5HQhe5FhI3wWX04MyqH1KRHjEkfzNuhwdb7FOi1oO3avdaRD?=
 =?us-ascii?Q?bzckvmj69cKw0pDv/LZ4/ck=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0877bc62-e7cd-4857-6799-08d9ea331ee4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:12:33.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vuoZsEzjCq1GWi+HBM5Aofk6vV7/J9IgSBHklfDteYYY0HA3O7PRTFMzycvrVxAeG1+GDbUKzOSLwUI+nQXA/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6803
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 12:12:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161459

Am 06.02.2022 um 20:05 schrieb Mark Hatle:
> On 2/6/22 11:35 AM, Richard Purdie wrote:
>> On Sun, 2022-02-06 at 18:31 +0100, Alexander Kanavin wrote:
>>> On Sun, 6 Feb 2022 at 18:27, Mark Hatle <mark.hatle@kernel.crashing.org=
>
>>> wrote:
>>>> It definitely works in Honister (I'm actively using it.)
>>>>
>>>> We produce a single package set, then allow for multiple image=20
>>>> recipes to
>>>> select
>>>> which init manager to use.=C2=A0 This simplifies the eSDK, sstate-cach=
e and
>>>> binary
>>>> package feed -- while still giving the end user the ability to switch.
>>>>
>>>
>>>
>>> Selection of init manager is a distro setting, it can be used by=20
>>> component
>>> recipes to make decisions, and overriding it from images is neither=20
>>> tested nor
>>> supported.
>>
>> There is a hybrid where you can enable sysvinit and systemd at the=20
>> same time and
>> use them in different situations. We do test that and it is that test=20
>> which
>> showed issues on the autobuilder with this patch.
>>
>> It isn't as easy as pick and chose either in a given image but handy for
>> initramfs and some other uses.
>=20
> I've got the following in my distro:
>=20
> # Create packages that support both systemd and sysvinit
> # but only on arm/arm64 systems, microblaze is sysvinit only
> DISTRO_FEATURES_BACKFILL_CONSIDERED:remove:arm =3D "sysvinit systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED:remove:aarch64 =3D "sysvinit systemd"
> DISTRO_FEATURES_BACKFILL:append:arm =3D " systemd"
> DISTRO_FEATURES_BACKFILL:append:aarch64 =3D " systemd=E2=80=9D
>=20
> INIT_MANAGER_DEFAULT =3D "systemd"
> INIT_MANAGER_DEFAULT:microblaze =3D "sysvinit"
> INIT_MANAGER_DEFAULT:zynq =3D "sysvinit"
>=20
> INIT_MANAGER ?=3D "${INIT_MANAGER_DEFAULT}"
>=20
> Then a few configurations change the INIT_MANAGER, and (almost) all of=20
> the sstate is re-usable and things don't need to be re-built.
>=20
> The issue I have, microblaze if the filesystem is over about 80mb it=20
> doesn't fit into memory.=C2=A0 On Arm, some devices are memory limited th=
e=20
> same way microblaze is, while some have full access to flash storage and=
=20
> thus can use systemd.=C2=A0 And on aarch64 - most defined (but not all) h=
ave=20
> flash storage.
>=20
> This is all about sstate-cache re-use (time to build the image) and=20
> ability to have a SINGLE binary distribution that supports the image=20
> size requirements of the user.

After the change from Richard the optimization will only take place if=20
DISTRO_FEATURES doesn't contain sysvinit and you will get the=20
independent systemd and udev packages for all your platforms.

Regards
   Stefan

