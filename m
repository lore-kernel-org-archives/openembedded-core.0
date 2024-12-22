Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D6E7718B
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 00:13:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web10.16944.1734826426657147209
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 16:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=SfEb3VZB;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.78, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao1MgmG6a/E26p+QxdkILwIt3eVgYRQb4vh7LCQnvS0eFPwNzcv543MxB0P69mQgsZ6SHJ70bEcgZPHVCcrOwWBaudggIjpjtq7d8Z8F5VaEcOj/aneXDXlCRni+WWJcHP4m9OlPA7MXxawFkCP5E3h3t1sg9iqRFRpVCzE4Ovph/6SU7o3OipHF8PItdXYacQmu1eZTD3pXTwBWzYrfmzdaLRStfnkOVFX87hLZ3PLOxUaVYzoC1Tw4oRKfTMZxH8tP0Io8Bgs4yQCx/iFIubuBAOA6bv1wV1ntIOs9dsOZp7BmO7lglplFZQ9b+ZkxSwF71JO7TBEByHawLkp4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yIICtWQIV/xbL7FoEA2I+iGY+KMWmi8Giz8OF41MEA=;
 b=KL5zP9lAPTxEkuuca5xySDGQGP9epzMhhbY2vgFzEQd80GpT1wi+yAR34cugEu3Qa0ITdX9D2FPjJN7obsfjCFAAzyupTRGiiGWHhV7D+MqbQ0ibxIG6gRBB2tbMG6Rb60SFtmPtliQLlXX1kJXvpsSh8925f06WxVdAFRAeTQQx8YMbjGjRvjkFvZIKLbwCCmXx136rgShGF5mdk2fdQedWdSRiO+QXbgJkVmSl9lyv1kdHNxpaukcByCx80lZ07UzGTfdSTKHm4wTgeCZuy9BwXe8ke1Dk0GLld03qTVmPUjUfwHFeecrOeknT255EoDtBgrod4oAhmZz5ULQjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yIICtWQIV/xbL7FoEA2I+iGY+KMWmi8Giz8OF41MEA=;
 b=SfEb3VZBQ/GdhpeGchMvKNV087RTNCmJDauPwvgZLmvN18HTUxw34CqnsP0EFdKVOV47Xv/jB8tKJUjjxTvtoqbgHAmQ+143AtAuTyJJtjVWMybcAJUSb4MeyZlRSyrmsSkoVzVKXY/QhqvzPlKJ+QHJasr8TSp0GduimiAHJgq4RK+SpxOA4oydh/1jtwR4Hqxvt1YiHODuYNmJoYmDK1xvkggtY4XJ6JxiYwOdGncYM9iFaiPjRlPXYiDcvFahgjay2JXo0OUZ17ThaDryFFSggOC4SWqtavWrvmBfgDbk+wSxs9Ni4j4EdYD+AlCLfjbYFABRSEc3/1NW2jGuIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU4PR04MB10983.eurprd04.prod.outlook.com (2603:10a6:10:58c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sun, 22 Dec
 2024 00:13:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 00:13:37 +0000
Message-ID: <35266fcb-3a20-40b1-8004-433e8489477b@oss.nxp.com>
Date: Sat, 21 Dec 2024 18:13:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
 <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
 <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
 <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
 <CAMKF1sos+HS7jikyMUGwMGoXXyft71dZWTgB0pZma22jOStdPA@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CAMKF1sos+HS7jikyMUGwMGoXXyft71dZWTgB0pZma22jOStdPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN1PR12CA0063.namprd12.prod.outlook.com
 (2603:10b6:802:20::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU4PR04MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d697697-7927-40eb-0374-08dd221d7b3a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EfWkX6cq1UYP4qx8LPv/p12EOASUy2Z9UadR3OvKLYHQCaFLEYp+sX7SEFqp?=
 =?us-ascii?Q?lX8VdjEFhtxBwPLSJ65hmJ8jZRb7det/V8fw2sebNfQwAg/ObzFylBQ/6V3+?=
 =?us-ascii?Q?BiVh9n0anj3TZ8dbHfBq//22wiZEFf0XnjO32J+KR4bemNb2pUKEQAR2f6nB?=
 =?us-ascii?Q?P+ma0ashq5hYt0hJeDMiXGL73DKFh5aL5Th1e9cCh+GwnvRZQSH4QP3TuX/R?=
 =?us-ascii?Q?cO/VEFzTuTWRgnpU6ABAkmrzfRRU70A7TXVhgtKZUsiPN+As4Hc95y1rCkZa?=
 =?us-ascii?Q?H+LM14405mCHq4uyrjlS7WmYefILY7SpOzF9Kc8bFA03MwYq78C3dhuAmL6u?=
 =?us-ascii?Q?V5GSbnIhzUmaWjxvofHTRJ3wmMr9KYGQqf2Ur7PAx+NVkw97eIPdXTY2C4Sd?=
 =?us-ascii?Q?xSuyE5vXy0+naKr02bVIBuYglNZs037zYUjkEjF4c6yguAbljEwZbxTnX5ht?=
 =?us-ascii?Q?k/3Fqi3fbBs/g3GF9xeU3UHoRCyhHl9K4kT7qh41xGvbXJ66LHrLAbYcWEe1?=
 =?us-ascii?Q?FaLbIxe9g3nIzV4brCnfxyVUpTqjIRY3lcQ5d9AMUk2lfV0swy4+KrFJgmJi?=
 =?us-ascii?Q?azze+tPWPu0jnOqVuq37zAl5zo3o7WGMJXuQEdn83T8E5/Lo7FW97EkpX1cJ?=
 =?us-ascii?Q?mfDuVl4Gg2IVv1to81lXrfbcH5S4ixwdiEVWm4ujpGqLoqUwodP7MzLgBamU?=
 =?us-ascii?Q?g/8RameecWQDy+Sas/eMjC+NeXWmeDgMNT9aho5nvxViEYWxKnceWODDBfbL?=
 =?us-ascii?Q?C2FvaGAJ4TzqohXjUUR256ZIPBgWLIh0ibfvDfuM5gTMbxyGMKXJ9MDQ5qge?=
 =?us-ascii?Q?LjuTb4wWzxlZfr1m9WjrqQ8d54ElvQYeAzoD980GGwrexo+C0wsX8J4yiVpv?=
 =?us-ascii?Q?RTwz/nSWELdFf8VgsyVj6rMDGm2pQ0LiVbz7t8YBl1xIZLiT0wSlzTR8DP53?=
 =?us-ascii?Q?X6HKlYMGYwnz1uGkm99c3khL7dpR5K8hxvWV0HARxhL/foQg1vtpnaNyejnj?=
 =?us-ascii?Q?zePAxksn0k6uOj+7fmySgUzsVHYbACQ/Ne8vCjtplwFOT22rs5e7CxcUs7/W?=
 =?us-ascii?Q?x/aQbIIJRr3oPIQ1ie2V9ylvee0Xh45iVQicLHIX8ofen3d1UrMGrtcifHxC?=
 =?us-ascii?Q?NY6VAXkwEURD07J0a0BuM3gLo+9l1/jJz/WgTmSAH171Mz1Mx8lOj4O5aIIT?=
 =?us-ascii?Q?wTgAh5NMC7eS8mxb4D+QLphiGp6fpA0nrsSgGleIQ2+HuNZV/+YaY0UeLxjp?=
 =?us-ascii?Q?LCXW9KvOMWpbt+y6RT4iv5ptR/OMbo3dibL2Bd5rdGmtm/EJCAowJUn/XR3D?=
 =?us-ascii?Q?5MlzgmXY5e+rArwGa2AiTn8X5qsIqtGObxYKeTgCi4oNmV+rkJOwr9vBMCRD?=
 =?us-ascii?Q?d5kSXD+akiqn3VReDdpqFQ+8oq9o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8N/iGXdfUUCdmJ9EGMCfeQLIaIZEJskvzRK/Y3YIg8OZ6xHt6hcVn3GRk5/d?=
 =?us-ascii?Q?XIeqeV0BpqGoB3nT0Qgiv8ZZ5tMvhe6XrkvB1mmVO8p3BnxDmp0Hl5vUwXg9?=
 =?us-ascii?Q?ig7lW2t2KbeEnenLNbwJesbWkPAHQwgEV7hw1Zhh6/NlGwzzX/1E/NUmzgcT?=
 =?us-ascii?Q?Dm57QB+Rq06j81/tdJM239OUvM0Gjp2uj1N4vQv39v6eJc1+LDtYuk7vM5Cl?=
 =?us-ascii?Q?1v9s9xz6mP8kUjDvpt9mkQ3Heblop1teIp9xHIbp590iIfAUNd56G9VLsVT9?=
 =?us-ascii?Q?3iDhZNvuWTaImvrHDW9lyDxBbRE0F3vB/Kw1hE9N2kmYjjyy7LQRotfF2NJb?=
 =?us-ascii?Q?Ff5/TFj0idAPSkxX0HYM+Gh1PuROk/DBxywwY/WhGcjbo6qmqMiTL1ZGJAKz?=
 =?us-ascii?Q?CmlcGyHdckGYmbbxWD83WbywaC8A6+mm5KZaHAPUnqHgUNYFKHM+8ZlXjZ5y?=
 =?us-ascii?Q?/44vGshxE8uj96Kwfko1Z7wXr8i9ZjK2Z2QGFn4AwqLdAA4vvS/RDrZqwM/D?=
 =?us-ascii?Q?f4AiPIB3LXhAm+CvrK7WJIG0oEle6r1++Rcb1hVPFFHeoBJP4hqoKhWUKsbe?=
 =?us-ascii?Q?pe+e5ewrEwEwAHp09umbfIKlXeg6B2bmLmepEaJzs08CrfmtGG8LDbpuwSuQ?=
 =?us-ascii?Q?BHE1zKdYnvfzFtmAVRIc8Z0M4rBxJeyulVDMyibdg1z6dRQbTd3qthGFBgD9?=
 =?us-ascii?Q?4dgzqq2l1yzkpO5ByWLpqZZQ+FaQ09+CGy8QbQA5N0MQOmDUw3x4ZDgk6ZR7?=
 =?us-ascii?Q?M9C9oUQpzrObphl+OF/HQHzAf/rErdmxEWfxf1Xb2b+jVaSZmMGsO6sxdA5X?=
 =?us-ascii?Q?NIW7fUBr1vlnfvjOtNStj7HW8bxf8HE6nUKuJlyTQt/7Lzsf1t2GQTDO1fBX?=
 =?us-ascii?Q?HK3ykwFWLjUZkLNtarmnOOx+OVlQevsSMNJFIrPDmZ9k8wDPCwzJ+1C9xSEh?=
 =?us-ascii?Q?TUFJTQzehrbLq6TPAu1bYsigisxLJgZJZ3IedDA32wFjOKOmy2JmVCdy3PgB?=
 =?us-ascii?Q?ZvRk5wA3JQUNTYnsYQKQoNQZq3gyvzXo1lwV/cpHDEjSx+pr+pOT4fuwEUfX?=
 =?us-ascii?Q?E10Ji7uRbhYFn1GlAuphmM6hM7ZewGUI0uURojt37IAU7viXwLd9xhvYsQPd?=
 =?us-ascii?Q?6umc54eNDjvkmxU1dYRGOaFIrnjPayjmeXadCTrRr4AWIhcU1bfcsD+NY65r?=
 =?us-ascii?Q?Tk/4SBu2GW8uWOYbPlSwrI6J38C6iXCR5eOGijmuzJgzIwhMe4RM9QLP/jqK?=
 =?us-ascii?Q?PPhUGsGxCeZ5BsJuzzFTm9gCsW0GkDRCJndzOF8jFn7v+axOj2juvPUZJErS?=
 =?us-ascii?Q?lOF8NQVklAeqpVeSLogq3DEQFzTagNhepcafufrJeeJ01A9989QGRqiA+pJT?=
 =?us-ascii?Q?vx+Yie8f4VLugqy0XIQRqr4Y01Hg+9Vrqj4mezBfuvXjdfAbfhKZwFSIPzl/?=
 =?us-ascii?Q?32km2xz8MvAF0IyD696eeNah78AMCBbNd75Y9UUTXqISTnNS7MV1ouz/gguN?=
 =?us-ascii?Q?hu6X7Ez/qK6wuyYmY3dIwj1JNZpdJXgCzeTKnD641Pgb0mXGdIVDcC55CDe1?=
 =?us-ascii?Q?UwIMlsdSTSO4R8rUFkGorKC5wl3jR4e2fNm1X31fzhZvwuiIog3rEPM0EXhg?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d697697-7927-40eb-0374-08dd221d7b3a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 00:13:37.6772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qknEe/ap8tzDx8CwxexCeSPnddeiVdfGtrNcki5CNEzO61zyELlP0lT5NyoDcnItVLvDhgKXrnbjGwDGw9mdig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 00:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208994

On 12/21/2024 4:33 PM, Khem Raj via lists.openembedded.org wrote:
>=20
>=20
> On Sat, Dec 21, 2024 at 1:45=E2=80=AFPM Tom Hochstein <tom.hochstein@oss.=
nxp.com=20
> <mailto:tom.hochstein@oss.nxp.com>> wrote:
>=20
>     On 12/21/2024 2:10 PM, Khem Raj wrote:
>      >
>      > Tests sometimes do require additional packages and at times
>      > development headers and libs
>      > on target for different reasons and these dependencies may not be
>      > needed for normal
>      > functioning of the package. I would suggest to add them into image=
 as
>      > rdeps (if they are needed)
>      > conditional upon ptests being enabled.
>      >
>=20
>     I don't see that weston references ptests. Is your comment a mistake,
>     or do I misunderstand?
>=20
>=20
> No you did not misunderstand. I am trying to help you
>=20
>=20
> Hmm. Is there is meson option to disable/enable tests in Weston ? If so=20
> then you can disable the tests by default. Since the error seems to be=20
> showing a test configuration failure
>=20

Aha, we've gotten to the root now. We're building the tests folder but
not installing it. Will send a v2 that disables the unused tests build.

Tom



