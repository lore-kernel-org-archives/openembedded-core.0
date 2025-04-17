Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47175C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.64])
 by mx.groups.io with SMTP id smtpd.web10.9193.1744897727032908324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=DT7EKv73;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.64, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2uWmhKqtNAuArrXyKJYaHV/PVQQDcJug8fC4sBxrfco10Ne+pLwrSUFeY19LuCKl+ut9ao9I9OU6cxuiJiZuPQNyZhKO4Fy7NT/0eEjre27A5kT1AA7+k2DO3QuWMoY8DqnBiSjAXXPhBW7Mhz0rJKRodWvjUmEsE07eRTSFaWkxqaUPd+Wh7qSIf+WNRzZiXENr/IusNaFY/X1FIyuxkK/fhW8p7IK7Tdc3oZm50eWy5VMb0QMCvboS7zEAhMNm0MkZN95IVCdFRZAOoHRQLo+yv2nr/l1cZDxPfa9BC7RUA9hAmBbJAdLN3Lfjdr7wFHRebylnAeKXt7zxqlNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZlbk4YdpxLWshV82s3bIDAY+TG4QTqx2bWx2lmwBuU=;
 b=w7HDY8imxTXJRxpGW8RZ1ArT/vDqxBrhv6jNxwlyfX23+3Okd1OuwGsETQAzZmhkiuRsJyeHu9+4uURgJ046BI+12S7Ai6yXxTnTsW3jzf/DsqnjFHJ3JBT/QVVyOw6AhN1gEZMykxodch0ITWj2hEv0kHwSYe4XqDQbI4uS/ZWceW7sTRcRTRWkIicXSwun/mw5qWorc55D40gkBxFllcGbvxdvYR57skVenkA+sq1weOSe61XSeel7fFv+uHV4sWEs7nu7nIrTY06j9rAn5XFNi7fF2EbAGGBPQ4nizcQWfVbn892NqsdUsOEBkZtKBWJzSLw3NBWCUtOFB5NK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZlbk4YdpxLWshV82s3bIDAY+TG4QTqx2bWx2lmwBuU=;
 b=DT7EKv73fi1kGS1/hzEt+7XBNLuJTYKH64zOVd68DyLv5jn+JdaK+zriOO085KbZd/xIDnr4tRoIlRHlaJq2/NP9RvZds9HHUEAMnedX1hh/OnGpIaGRbl1qunGmqlS4FQ8PjuwS9DB5FSsyBvpIS+qu+iTtgoF0a3efQqA6zBW7RGYf/TS9J93pRqm/53v1NXu1iPgF7xiawHaYIKXqF5aoGCXeEPhvC5a8N5BWxjhV56EntmUgitYhGsxA+xtS/+U66J9lt1dnoYkwL8pi8pUvbRAefIaelSJtxnzauNYEsiy0ex5YUpfH8IGTJC36u0KXQlWrFVGlSE1l3HNYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8731.eurprd04.prod.outlook.com (2603:10a6:20b:43e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 13:48:43 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 13:48:43 +0000
Message-ID: <bdbe1e60-db3c-481b-9fcc-ff9dc585f3e8@oss.nxp.com>
Date: Thu, 17 Apr 2025 08:48:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 6/6] oeqa/sdk/meson: Skip test when SDK arch
 != build machine arch
To: openembedded-core@lists.openembedded.org
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
 <20250411172803.3706607-6-tom.hochstein@oss.nxp.com>
 <d375570faca49f301b13213dabd508547a0664c4.camel@linuxfoundation.org>
 <1836D8BA73D61DA5.22324@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <1836D8BA73D61DA5.22324@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH8PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::7) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: cbddd629-3792-4c72-08c3-08dd7db6911a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D67vfCgWZrtKZmThO/8c0lbWenAodublkuSn2YJoyZlkX60fD0vZX60ZKeK8?=
 =?us-ascii?Q?ffFKXy0F6heP9gE1lBXwV8r/8/sdcGg2z3FUM54vQ5MD2PIpFAoq2xy71HjX?=
 =?us-ascii?Q?GIFSDxjAjH8p60pB1lpL4uNXxqhjNp/mXnpQ6oFg4xqmBzaRsmzxpf14DjOd?=
 =?us-ascii?Q?S1qZpMwN4p2CLNyiMEQtelOYO35urS80m89wyFdgsBQ03q6gu9/pG6yeolGI?=
 =?us-ascii?Q?mqWsQgqK8b9m8eSKFx6b/5nonYfM5W7fuDWwMsyeAE8HFsV1gv3CrAbFyzC6?=
 =?us-ascii?Q?vhZ12KfTSEjhdSE5h9fF9g9fi2EtezTlfggfOjcPq8Ku26fgnqYOrMLy2hlQ?=
 =?us-ascii?Q?P9PaVUJu31WMUmjVNKKXvwNiMpvO/c9dcC7xaHNfUul0jZIkEB6BdT3ipieT?=
 =?us-ascii?Q?FES1lQFH8HUI+y8Bc3bTc9WSaqj6V7CS+SJN+0mAVu0htura0iJAcByLpCWj?=
 =?us-ascii?Q?3dQpHt8QvkIoXj+ZKm6PkFo13DX0LbcsLzUpyPLdQhgQ8QhwmygazjaGqPnc?=
 =?us-ascii?Q?UnCZXHO1BOnzesALYG5wP6F42Ks0/ZVzz1H2Sqq0BXfFvIMCqMK/ONI+i3Ab?=
 =?us-ascii?Q?r9ZPW5DjgrIfAy5vIMk2L/2yQZEpAbKHATqbfcSWsZoDvu1jSeXijkDkCxjn?=
 =?us-ascii?Q?u0zUApvfsGMv/n0tlSpx0K27Q5dwmKSDNXJ0oUXkqlo8GQTG2A263xJHS9o4?=
 =?us-ascii?Q?xltr/4yEzVssg3KS7WZh2eApE8OZR65a1k+llSZmYx2O2DM5xk6ANqs831K0?=
 =?us-ascii?Q?JUTQe0OB9r56ceuOORgft2XsCOLyeGmYrfI2jCGxCVsJPz1GrC7JH5HB+ST3?=
 =?us-ascii?Q?wM5ZNQHEC8LnxEgCoMM85tvm4EScpHz1TUb2fw0hAhHg4sOxL3mgQ2nv9eW/?=
 =?us-ascii?Q?AJ6GZszPlKN3DoaDfIecPIsJ2r4GsMqNSq9kZeAUc7n7eV7S7/FO4PpdzNl/?=
 =?us-ascii?Q?X0N+kuw8V9sahcIc5ggMn2J/7EBdBD697/+S0yvW+hupo2xV95h64Nby4Yg+?=
 =?us-ascii?Q?OyEYV2fUiutu9P/mC4PDebQxXbdRFjJMmABTzgeAPA9wrTtGKIhk1voPaBxn?=
 =?us-ascii?Q?lGXP7KzVBKEoyC7qmBuF2kZQKlFWDf/JJg4yjtJT4FDYQzADn+OHf73W92ZC?=
 =?us-ascii?Q?7dztbA8CNduj8QC9B4CXFEqvyNN5tT6/0uhxbUtpApPIrF2wdUHnnDEcVsQ/?=
 =?us-ascii?Q?Qw3PxZZntrkD3qV+u39amYMk7btxRC4STdWkHhidkEmjlT+u9VscRiLygM54?=
 =?us-ascii?Q?Tm3ZSErJqIVcyBlB40gkeldJITT1MJdC+A1eW8AMjEI+Nqi1fxCY1gLE7TqV?=
 =?us-ascii?Q?U0aFp8+LL4X9sodpFHd1iXWctLSPQC5TjVyxj9utptOprwHIpJTL+/rTVSFL?=
 =?us-ascii?Q?+oVo/xU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hjUKJt8KY4jSP2JrEBbwv1zYwFMHx9MF2LSYqVSftfYfHk8NE4Zkt2UhuULG?=
 =?us-ascii?Q?YSsafCGKX5GJwL3tt5AXkbl0yimIiJs2uYyYS0ziftW/uK+ZwKYOxTixXJzL?=
 =?us-ascii?Q?siMKjckaw6H+I1mkD56SLrp/TWFjZjx4RYF1I9VuHVb+Dx6Kmw7OJUXOf+B9?=
 =?us-ascii?Q?2+iUPxh2b4Vu/YBbWgkuoDu1fVeWSAoVZz8HCS5xW5m58CPXqd2njqGYv9a5?=
 =?us-ascii?Q?tLyD8/H4Il4+ueE9Dh03HMoFle9OPHXEqnjBxWGARVQ8A4wwW97EeMWKfasf?=
 =?us-ascii?Q?aZEmlEMXG7DF+EDnfpjBkxRB87IsxKZ4TWzpuc8NA9cCmuL+6bcaWxylnM+d?=
 =?us-ascii?Q?is4giA7mfzMJ12vAJ0YmK3668xTtmMS4sffQDrR/gqsswXA1Yss0xwg+eevf?=
 =?us-ascii?Q?jyTt5nlck3Y6aAmqAv0sfVKNcxc8LpTLhEDTfMShXUOyjnMnesSlzxVv8x+k?=
 =?us-ascii?Q?LNzWwCGRn11UYSyLRCJS3mScVP6yKvJ6w6v240+M9r8VMhxEffcKwd9pq7fq?=
 =?us-ascii?Q?8+Xlg9ON0AV2jl5oMcpnJjnbgZ5/UmNe91/ixIwQsGItcqeuj3WFhpnIw71E?=
 =?us-ascii?Q?RTrE8AzdWCeYdUWnfiTWSb4DJOypjJpzcz2RvLsZYsyhavT8PBDPXaOgFBeP?=
 =?us-ascii?Q?K4Ofo84u0fK1P0/3SA3vMoU64RVwG9nwn/IFSn9TIfHhbYu8hg4pb4EbCU7n?=
 =?us-ascii?Q?jwo2Ko68AjoiEJtidLWiQz8XH/X+n9GMgrkTd2+QEF9NezWM6zOBkrUcaKF7?=
 =?us-ascii?Q?VbMyL0ASWS7Nui5LnTWx2D5rQp/Vsmzg/ouIYjl1u4o88NGce4LlO8y5Xl0W?=
 =?us-ascii?Q?6TjmD5y4UQfyM2daSKVAwHj50t8pw0fawwbRmIgancc8Bh7jfuIksnDGQpSU?=
 =?us-ascii?Q?atwaIrAo1HAhD3KVgSxDtDzYVfp6HwH8F0VZQ2PxZhWcGuSfmp5k5MxJk0N9?=
 =?us-ascii?Q?pL12vXcCIIbYSWCYCib4p2Rti4pxXwEDLYKsWdk48Er2USekFZBgi6uT2ce5?=
 =?us-ascii?Q?+Qnwpb04t6JQSETXYeXXrErrIPiumdSfka5xL7ys0kDN0OIy3PbVA3lA29y2?=
 =?us-ascii?Q?XUj3qiycywUM9sJ3BcO3M2263BfbzZZxcQleBr9X3xKSCB3n32kSKKXsoXCp?=
 =?us-ascii?Q?Vi+dPl1ueIKMJQSuD+GTDpUkeGVXe/FocxtBVGdpRcaRAy2IGybThZw9bXTv?=
 =?us-ascii?Q?hSia6V9TgKzQYntM4LQnXv9AM59BEUMYejvZ0hHeEX0tDLcn/S8UfcroiOlL?=
 =?us-ascii?Q?amTB+zSxCk5Y7RyIxe6ztVIwoGKrA0AJtlgQgNmYIGXAMj1cYjLESbTdOIQp?=
 =?us-ascii?Q?xayk5KIfgnACIb+KjaOrrfs8xiKxgOVDrhBgpYaK0zM450xtOLyxz0RfC695?=
 =?us-ascii?Q?4w3vXNY7nSm677nvym8QRkmLd/l5sIxaLpD7SGk8wA0yOt8g2DrLdHsibpRW?=
 =?us-ascii?Q?Hz6iwkGubOQhz45XRZjSnHHdCrXy5o23Eg9FDXDe+DLbsO4H+dr2vIVi15b6?=
 =?us-ascii?Q?hwiii7dPezOASOjoiiPgosPuSPodppa7cXuGhrhfwqMrjlJa741Xq8zhtV6O?=
 =?us-ascii?Q?9nPsWYemL6YTA0bWEo06P2KmNXojxBa76ShFyAcz218YAJc0GjC+5XEvursM?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbddd629-3792-4c72-08c3-08dd7db6911a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:48:43.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siip8zHMNDwfvXCvXB1lc1ecu8WmqZO8xGpW2CpOw0pnSlYeu0OoC/jOPmLr7v8djLTthvemQf3Pglq8j8KSuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 13:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215078

On 4/16/2025 11:16 AM, Tom Hochstein via lists.openembedded.org wrote:
> On 4/15/2025 5:48 AM, Richard Purdie wrote:
>> [You don't often get email from richard.purdie@linuxfoundation.org.=20
>> Learn why this is important at=20
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On Fri, 2025-04-11 at 12:28 -0500, Tom Hochstein via=20
>> lists.openembedded.org wrote:
>>> The SDK Meson test fails when the SDK is not for the build machine:
>>> ```
>>> Traceback (most recent call last):
>>> =C2=A0=C2=A0=C2=A0 File=20
>>> "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meso=
n.py", line 47, in test_epoxy
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["=
exelist"],=20
>>> data["host"]["c"]["exelist"])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ~~~~~~~~~~~~~^^^^^
>>> KeyError: 'c'
>>> ```
>>>
>>> Skip the test in this case.
>>>
>>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>>> ---
>>> =C2=A0 meta/lib/oeqa/sdk/cases/meson.py | 5 +++++
>>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> I think this may not be quite right as I saw:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1370
>>
>> in my build with this series applied.
>>
>> Cheers,
>>
>> Richard
>=20
>=20
> Thanks, Richard. I'm able to reproduce this. It's specific to=20
> meta-ide-support.
>=20
> The setup looks fine:
>=20
> $ meson setup --warnlevel 1 -Degl=3Dno -Dglx=3Dno -Dx11=3Dfalse build
> meson-wrapper: Running meson with setup options: "=20
> --cross-file=3D.../poky/build/tmp/sysroots/x86_64/usr/share/meson/arm-pok=
y-linux-gnueabi-meson.cross --native-file=3D.../poky/build/tmp/sysroots/x86=
_64/usr/share/meson/meson.native "
> The Meson build system
> Version: 1.7.2
> ...
>=20
> The KeyError appears because the build machine data is empty:

This assertion turns out to be wrong. In fact, the build machine data is
empty in the working case as well. I propose to drop this part of the
new test, as the remaining part of the test seems sufficient.

>=20
> $ meson introspect -i --compilers build
> {
>  =C2=A0=C2=A0=C2=A0 "host": {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "c": {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "id":=
 "gcc",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "exel=
ist": [
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "arm-poky-linux-gnueabi-gcc",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mthumb",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mfpu=3Dneon",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mfloat-abi=3Dhard",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mcpu=3Dcortex-a15",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-fstack-protector-strong",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-O2",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_FORTIFY_SOURCE=3D2",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Wformat",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Wformat-security",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Werror=3Dformat-security",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_TIME_BITS=3D64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_FILE_OFFSET_BITS=3D64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "--sysroot=3D.../poky/build/tmp/sysroots/qemuarm"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "link=
er_exelist": [
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "arm-poky-linux-gnueabi-gcc",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mthumb",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mfpu=3Dneon",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mfloat-abi=3Dhard",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-mcpu=3Dcortex-a15",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-fstack-protector-strong",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-O2",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_FORTIFY_SOURCE=3D2",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Wformat",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Wformat-security",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-Werror=3Dformat-security",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_TIME_BITS=3D64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "-D_FILE_OFFSET_BITS=3D64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "--sysroot=3D.../poky/build/tmp/sysroots/qemuarm"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "file=
_suffixes": [
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "c"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "defa=
ult_suffix": "c",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "vers=
ion": "14.2.0",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "full=
_version": "arm-poky-linux-gnueabi-gcc (GCC) 14.2.0",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "link=
er_id": "ld.bfd"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0 "build": {}
> }
>=20
> I don't understand why. The meson.native file looks the same as for the=20
> standalone SDK case, and the meson machine data seems fine.
>=20
> $ meson introspect -i --machines build/
> {
>  =C2=A0=C2=A0=C2=A0 "host": {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "system": "linux",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu_family": "arm",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu": "arm",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "endian": "little",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "kernel": null,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "subsystem": null,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "is_64_bit": false,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "exe_suffix": "",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "object_suffix": "o"
>  =C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0 "build": {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "system": "linux",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu_family": "x86_64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu": "x86_64",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "endian": "little",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "kernel": "linux",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "subsystem": "linux",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "is_64_bit": true,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "exe_suffix": "",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "object_suffix": "o"
>  =C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0 "target": {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "system": "linux",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu_family": "arm",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu": "arm",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "endian": "little",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "kernel": null,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "subsystem": null,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "is_64_bit": false,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "exe_suffix": "",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "object_suffix": "o"
>  =C2=A0=C2=A0=C2=A0 }
> }
>=20
> I'm stuck.
>=20
> Tom
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215000): https://lists.openembedded.org/g/openembedde=
d-core/message/215000
> Mute This Topic: https://lists.openembedded.org/mt/112214633/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [to=
m.hochstein@oss.nxp.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


