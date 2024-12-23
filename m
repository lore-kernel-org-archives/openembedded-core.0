Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C07BE77188
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 00:57:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web10.5523.1734915428317596379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 16:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lzCC/88E;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.49, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg5DKgm584zLHlfTJyPIzDDJA0uK4priq7GZxLTDMW7tmew7PKeaRKb16syQvyYmyeAHquSJ9zPa1zj1/yw2pRhLHZEqS6SRLVrSeswWxhy3E4l2qGJTQdZZnrdyULV3A/UR3cc9OLKmn0BIG2wqw4ni5YbEUTFxvi1gK9GFc7cFTgo8+9O57AODQ6zlSMsuoCZt6jnp3PDNnHwpCyHQ/Ha/fixVENSBeSunlDoQWqduG5buRoWBdgXK1wRIR5zis6Xht1AuFY0nufhEn9uAHibiQcT2LlpON6i8/f/NfRqGRvfcS9qYjYjRmAXWX1R92jwrgx6Q1JqRefJXo+yGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idi3a34M21jtoIJsq3u4kly2aJMj/K9cPRNLFdte++Y=;
 b=S/Ad9hC+UVHLxupEDTymXr7cSRp9v8kvsP0hnrDQw5UCnSs750RgDYs7O675p8b3tTtlINBu7ZVpakBekV2ktjIA1NH4+fZI9Li4ScPqinGV6b4b/LLPtcNj+AK1qi7gNt9H7FtbKgIysPq50PqKfKUEFB6U0eYSPgCOq6DrFSWJBOTYgwXg96Z9/Oqg1CmSdzGjcihK5xApXt2LOxWqKGb0/+M/5i9THi089QCmeJc23Mwbs6kZ7a3KQ6WDdg8RZy3zb1VSvjgfl6/HLo0i5gLZFOGo10iwga8Ck65+FPrc5Fc4VctYwbrMTsCkjEnrBT5qWO1W41s8xU0TjrUCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idi3a34M21jtoIJsq3u4kly2aJMj/K9cPRNLFdte++Y=;
 b=lzCC/88ENYBP9eS+8eiHOvRzznvrkaff2QH56QVqVIys+jX3Q62Ssh9ShInW66RY3zKEUMu4JOV1xwmzClc3kFazJmOgl+eZCMzGbrN2dsOJCvhiNdo/+HXhNJX/nqsdtg7iEDXimd79G2Qza63nfjfFSsQ0Ni3QozgF6TkQoc5BWipMSn7udttxl8AK/nEVVrEeUbiaun2wWcUj8hcdBZAjmnelwdqnf6069/YHkP/JoVq07qLKFkOBOwVUQBFE3Pi4bsgSjnyaNEu9ANRftVdXAyANoU52jaCx+RezpofRWVKnDQSoV+hfNpQRdtlhVuF44MPXlfrP4QXZ2LOK9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI2PR04MB10836.eurprd04.prod.outlook.com (2603:10a6:800:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 00:56:59 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 00:56:59 +0000
Message-ID: <1cd9ccf5-a75d-4613-bfa4-0dfd9335a222@oss.nxp.com>
Date: Sun, 22 Dec 2024 18:56:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
 <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
 <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
 <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
 <CAMKF1sos+HS7jikyMUGwMGoXXyft71dZWTgB0pZma22jOStdPA@mail.gmail.com>
 <35266fcb-3a20-40b1-8004-433e8489477b@oss.nxp.com>
 <b459926f-9486-4c05-adeb-a4e0ca74a569@windriver.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <b459926f-9486-4c05-adeb-a4e0ca74a569@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN6PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:805:de::45) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI2PR04MB10836:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dfc023-ece4-42fc-858f-08dd22ecb451
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ujvl5dEnpJ55m0MMO7IYX0zXQwY2aa7IZxTCSR3EEXuEat9bPudmLro1Ukso?=
 =?us-ascii?Q?sNb0yKk00ekQbgXRUtu0kq57oo9kvPdQG8GkaLmYo8LIJs3ZQfcFXzJS1HuL?=
 =?us-ascii?Q?zB86wZyDZ7ng+qC2p5URzq+ePxkglEV2e0KxP7selOKuwvDfYT+1iSuc3cpk?=
 =?us-ascii?Q?DLXzm/x743vV+bpen1yKxOUD9L8+QlZYXkxV3BxWiEcx004EhyfYBtEhP+IE?=
 =?us-ascii?Q?Mal01re3k/kjveN2C+EnpuyO9VcNQNIXdKPsJDZCYkj0aAExpZo/Z5+kkPU3?=
 =?us-ascii?Q?dJOKWPuHgYKAoEWONSSnbhIbsREfEQgqnehzuFh7iEW+XjCTyJ5g6naGSH8Y?=
 =?us-ascii?Q?u8TtE/6D4V+j8DJ6M0aU+VjAQD9DHcwbzjmqFhWaq2TKEp13qaGvOyREgaej?=
 =?us-ascii?Q?ENMwE0xw7VYjo3sRMOShmj2dSFnpo8U5e4Zdicq+XhT2626tgY+56+842BNX?=
 =?us-ascii?Q?XTTNvylTMDxszk/4ppclUo3bEB47ITAJQi3RY7Jhc1qF1wuuFfHYfpMVCpC3?=
 =?us-ascii?Q?lAosyiylPgmHTze6sqz8cU+M30G7zGN2qekM+YcWmpYsuyCtst6SRaBdf/HF?=
 =?us-ascii?Q?QQG5ub3HkBfK9wG1C1SqXM2WhVKXP/RjGfeAk25LoI2ndHNp0GdPLmRUHUIn?=
 =?us-ascii?Q?Z52rIUBI+gi1PvoCRqhJxR1X+acwobFwe4+je0n5CzTvGg56LrulkzfmDq82?=
 =?us-ascii?Q?3Nr8NWHx2gJyzBCCa1K9PUscBdDh+11/Fg8klh8WDkbydVxHUFrd2/L1jFlr?=
 =?us-ascii?Q?vgAu8hfF1I6tnpS+LTk1Tuoe+cGFvYLyePd3d6P05snnIfoKK0q+HWv89Z9n?=
 =?us-ascii?Q?t516fpKFG62u1WoI9z9nmyEVtHfX9CF/Ng3GdWs+U0ALsTLQci+gl1OUqSNx?=
 =?us-ascii?Q?vzeMPnz2lVfEhbsezPYnsc1GRui7LraroudPHcUkbMPktidk6gXViYp5nqbl?=
 =?us-ascii?Q?PyVhqP3EnYAeFjLK0UWWucnsopw7qorfSWOQHmpFZdL+hwfnuKtV2KZQaKMi?=
 =?us-ascii?Q?O5NXpcfc0R2r2+wPWnEycJLxZ31y5OcSbaB6BsAyZ0nx4O0ge2ikg6MAO3zF?=
 =?us-ascii?Q?m/bE2f0xilkmEyep8ca2lTHMh+jbJljS4WULynOVfa4EAS8E2h87DumdVgyi?=
 =?us-ascii?Q?Ll2jae/ZdCZO9+Kc5MsEH+BuxLAPUFyhvj91hRgaKXX+EfLsDxD+RK4t3wo4?=
 =?us-ascii?Q?CNojgEYwNhyMzAWqo7jF/MkOO3DFeQchU9Y8MyfQE4/w0wxNXmmMemegyheE?=
 =?us-ascii?Q?jBsM8IWbRTx/N8f8p9ukn1unQbZP+/RuLM2sfzBTZjp884Fh2yZL4DwSaf+F?=
 =?us-ascii?Q?3A4Je+ssGr+bY+aPDkFfwue/MvXixvoim6jq4cY07zexOdyy5g2y45FwrORE?=
 =?us-ascii?Q?ndry6o3p9nkEhLedCqJiLy/AKmij?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?849izG9/9QZnxj+ITSFk0wzIDY0zhumDkiwaoICyIg+x1iiyYxEMIOM1ZtYN?=
 =?us-ascii?Q?9L+6cg2VrK45wvDLmgoW7yLL5jp7t7dTUkjsn9C+uoPVScbt50hTz4QA9j+H?=
 =?us-ascii?Q?wkpzJimTjy7DTC3OlEScZxBCOpwrQhToVD+AUYBM/bTwx28CllzwxZFZsVZZ?=
 =?us-ascii?Q?TmtMpn2QsT+MgWvcFfuztmy3fHnhuOSbs60PmR68iipmsuZi12yuRKnHGXno?=
 =?us-ascii?Q?IYv5pGPHo61dYVG1kKgUknEE6jcVbSV7sXyrgJwFgfd5oXoeoTL6oNMp1EBn?=
 =?us-ascii?Q?XIzWo4TJeUmCwW4IVJ/5P56wcANPjuojpyIA5BBSIx1qrptG0lNZzqDEBHBd?=
 =?us-ascii?Q?/fEp4JkNTkt9bQ5z6A3NXCYf2QPIECDJOX6KqQmC37RPB5w20Yhd53Hf/Xt5?=
 =?us-ascii?Q?BEjVfq/aaPuyP0DpSkZ+eUowWzBcGxg/UrflCNBOtmz+FvJy0pafg6FXFO0x?=
 =?us-ascii?Q?mHJjlOObUp2jSBFWPdRyprabVhxlfef77RKChQ2JQUp6SO2lNkIbyyccx/vZ?=
 =?us-ascii?Q?vDD/9fUaaS1kB74Y23vZQ5bQJEIJ6Uyz598t+eIFa1hZ3AYTNh/TLlxt0kut?=
 =?us-ascii?Q?kFmur5RYkSnf8n6tc/+nCSyjIBM225NxL9chhGjjml/So/oVfYlBwg3yUM+A?=
 =?us-ascii?Q?rZInVNpZmcTN8GaEmKaPd8EK3qY/kQMxDwyJWf6J6swI8AhZo4m/INbWpwKl?=
 =?us-ascii?Q?UAF2d3+AfwM5wIQIuEpWfZzz8TmMcywEja2E1jc7v37Ei72XDo4es8jRh/Bl?=
 =?us-ascii?Q?LN/M4H0Oi/FT3I6Wu1p9ph5EXna8Jpj8fRT/B2BRYStvyn9/Os8Gjf11QaYV?=
 =?us-ascii?Q?xZLe2ZyqBBF6sDujzapg3Va1MVw4kO257dG5ALVH0+W+uDyhxRnO7W+fUDR4?=
 =?us-ascii?Q?/sQ+Je4N6fqxB/H6SvFEkOHgpyfWwvKpVWuYu4iQFq3n1vj5Sp/ICl2pUdZj?=
 =?us-ascii?Q?cBxHXeO7My15Gfm/8ETwVazqIz7fDL49MS/deHdmcJFCPqX1euIYfupvzyVe?=
 =?us-ascii?Q?f+aS0TNAqwatv8362aiBJdjqCD1Vs+y3MoGVtsLHNCMBlsZCtl0b0f6CeIHL?=
 =?us-ascii?Q?+rK3LGC194zUCbFaJVM/Xx0dQmls2+uF1/ZM/mi4SidhbWiI7W5GF9Y2gnCt?=
 =?us-ascii?Q?c/2yVN3kcjh69tW/qy9YkQTLlMjy/a130vhj6D8JBnOzqeZXIFDvcjIPIT32?=
 =?us-ascii?Q?oFdsllxr36TbIjU00BcKi3kOkBXzsiPFjDAqWcZeZxedhGTJtj2dnotQUdV+?=
 =?us-ascii?Q?Ipw2l5n86gLejUiZtO70S01NWhAgu4TmgHzzeNg3lqWggunBfOk5lTsqsARX?=
 =?us-ascii?Q?D34gEc8Oh4TtUJaQtvL2WaVcZWvf89BrP/JaWnPhGDNX622cvcNHZDzcNR5F?=
 =?us-ascii?Q?TfwlA7eaNEOe2gSH/CgqeEmS8nbVVY5fwje/T2Dq2wHfxOcCqYSrUR4x47pJ?=
 =?us-ascii?Q?RWY6IT91TzPlZIP7W5qLA7L/kZwlty0bfGlVT6W2P4RdbRj5sosOO9pPFfXk?=
 =?us-ascii?Q?MEkr7iVLI0UG13kKeW8/nuUkCLaaSayw5INnPgpX3icpzB29S2Ha6g9fhjD1?=
 =?us-ascii?Q?kY82jzRe2fDjzyQ8TPrPHBIn39pO4miQ7BVyTGA8g+UQRS7apY2p/jmmUdQO?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dfc023-ece4-42fc-858f-08dd22ecb451
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 00:56:59.2561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PFOcMZWfuA5CYrqhlCjudzNhBIGcGNmTpAkVM6D3rO/kcFI0/Rk+2wFntOoPQE5r6w5Vj7QeCapSRVk2sn4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 00:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209014

On 12/22/2024 2:28 PM, Randy MacLeod wrote:
>=20
> Better still is to install the tests along with dependencies only for=20
> the ptests as is done in many recipes,
> for example wayland:
>=20
>  =C2=A0 install:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/wayland/wayland_1.23.1.bb?h=3Dmaster#n40
>=20
>  =C2=A0 ptest dependencies:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/wayland/wayland_1.23.1.bb?h=3Dmaster#n61
>=20
> I don't know anything about the weston tests but hopefully it's not too=20
> complicated.
>=20
> Ah, I see you've already sent a v3...
>=20
> Would you have time to add ptest support as a follow-up commit?
>=20

Sorry, I'm just trying to get the build as it is to work, not an expert
on the weston tests themselves, so better to leave that to someone with
more expertise and/or motivation to properly integrate the tests.

Tom


