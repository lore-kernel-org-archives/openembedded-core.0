Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BFCC3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 12:28:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.web10.14091.1746707288462995417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 05:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ZICth6Tu;
 spf=pass (domain: oss.nxp.com, ip: 52.101.66.28, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAm3NyiCt8eudpcn8tUQzRvuKNxDcGWca2ibmK10fO4T4E7nF7XbXGh2Q8mFMrAy6BYXtQoh1TRFi3oOgZNWS42Df3Ls4xEr/960rx/rtOTQR/NyPdrnCm+eWQVySQgr8my5fodm/wC6xGgrnLtZWizOZtB2o+aS3rW0GvQuyeQiqfv0N2z8TWgCtnjwa/zAYaBukRYCR6ritVcphM593yq/s/wm0cXJvjeVvL8J7IkOh4+sEaSXdSnhUkjpuPrPxzLKyfSWKJLrQbyqawHPYexmXabTT3uiH60GfGf24FyPr4nEqx/7Vum02ObiQ9yZ3awqmspAoeYFVTU8dIFdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGTAoBr9JiAtTl1szpETkkUoleCF4fZZmOcNsSrudSo=;
 b=UnDbbwyAPWPukgcuo7L9tfl+JL4UNV6MAKMHc6p+ukJF5X35gbldSqwEH7aSXnF0CM5z+nMZewemrKp7iY5AAgym3ZKINInPYAZQJkelq4uMbYNktK+bpOxGOiFBcQFtWmLtcMO7gZpKRAi/qjwDd4Jiv57fIzxvdZUdmxYgWmX91sH1vVEpLrWcWM8yVMWbld6GZmHs3ihcNyjnj5tWNJqz90An/C9FB91YSqd2V68euO/DIxEyhP/FloApHSsUM+0meS/JOjeAeh9sgCb6R+L5cT15OlyZ3aQgrSUA234tISkP1WdpOlXbnb5EnC3TCAN6u4wiPoBvTmrHz9m31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGTAoBr9JiAtTl1szpETkkUoleCF4fZZmOcNsSrudSo=;
 b=ZICth6Tu/Pd8hra9vUHHCSL4rKZnCKzxeNXFVVQOoridtEWzajTScy8ZNvNbzvRTRWUT8ThbZkOcZb9wfokezSGfyGecqhqJR1UjDcBcdUtA+Tzz5XjneI8C5FZEsGBc1GXIhcUqy5wATvL7szFYE6PS5tUOr84/BIqG3pJClhPRE8nF0WkG99BWcXvrYuQGD1uf77RB2E+VjTE1DGp7CfaMityI9FqaSdr7XBHYOs3VDgl+8E469OazaSIjUyVk5LvwB6eXku8QFbyH7SBFB2ZxYLnIw2wcOtd1+AKQOBHAmKN6KBUwGox4I5cJZvZkaSebr4ueskaSINev/Ov1OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU4PR04MB10316.eurprd04.prod.outlook.com (2603:10a6:10:567::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 12:28:05 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%7]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 12:28:05 +0000
Message-ID: <ecd3e3d5-fae1-4c7f-bf1b-7f418bc0601a@oss.nxp.com>
Date: Thu, 8 May 2025 07:27:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] meson: Allow user to override setup
 command options
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
 <C418837B-2179-4849-BFCE-B5C2C69C415A@arm.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <C418837B-2179-4849-BFCE-B5C2C69C415A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU4PR04MB10316:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbb32cb-ceca-402f-5a14-08dd8e2bc81f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6jK5aRsQshFCytavM0k4mU8VdpE6aiL85IuD8kvYIOvSt8CeIBUYm5FAsLeH?=
 =?us-ascii?Q?e0b9z/BsDRaF2giTybHUQRvYUCQSkw5BWQNAto04l/X7GGJD6ogA5K6ejvZg?=
 =?us-ascii?Q?GtnVKNirvLlQLnw2s7PimywRXpKR0f4iqddgCHJkY1A5Gz9Bz/mplhE78srP?=
 =?us-ascii?Q?hGYQ7noDA2ORYbwBEUz8vxMEmfPo4yaQvRy8SYPZwuYJ/uXTCjUXIb4jEWWK?=
 =?us-ascii?Q?rcV/cYqbpWsggz9NGr6zT4XrxI3h2uU5s5qsTkorUEydzJTs5zdezOSxow7T?=
 =?us-ascii?Q?lWBJkZfwuU/yZIK84u/Dz9NEkRKGXInGJIrfRlzyk4ODrrPPNvmQgawNbXgL?=
 =?us-ascii?Q?Z1ohijpKGzbwN2LK90IiOdhewMoqUypXAH8p4wcbB8M2TXnVKjjo8OhFcz5/?=
 =?us-ascii?Q?AU+rFaXpNiCN9EA6a7Uc+jxLQnmEMB/KqvWB6fVA6TbZwAfJlPd1y45Rv2le?=
 =?us-ascii?Q?Iy1S1oKzfH5gondUuEwTIFy1TzCfsaQUFyxuGyR5NbL+h8Savh050lqGGdok?=
 =?us-ascii?Q?wQ+HwqePVDooaFOKRHbqYBYorY2dqdJrurs36W96Ly47v6P+svI8E5qelAPF?=
 =?us-ascii?Q?J96ZCuKCuD3eX6NL3r7SCl9/HtYgtT3X7WZBkDOvv/81wzca4ZH3bnYgG9kv?=
 =?us-ascii?Q?x5n8KB4uwIiH6I0Aq0KazqiMOGqLCk3OoUo2wVvZ8zbw8VxgFgXQ23CV3bVW?=
 =?us-ascii?Q?DOXfHLPvNKsPmeyAYQI74iayiB+AEEKKN/M4w61xFVsNANWOeMMuMgmH0uOD?=
 =?us-ascii?Q?qkN8pjCdX2xvjFHXosbO++TfX5+Yk52TA4SXyLmh8q4TCZ/YQc6hJnFk/g1e?=
 =?us-ascii?Q?rCqHB6X4E/UJtXqb0utxLw+o7a2aqqO3nwqdjgt8htx8Bq3Mxs3dtIJhjsTk?=
 =?us-ascii?Q?AlUyswS3Bl36nGbL1UDibSutByDGJwIuV4mQNxR4or4zDj3SWJlrXCiS1UzX?=
 =?us-ascii?Q?dKMKK4aFHjyDTV8K0GoVrqY7mtj3TpcudTgDzxLeeGuhkZZGzFz+Eu0UONuw?=
 =?us-ascii?Q?oI+zBFHanML16/W7SODSSsD8awJDV8FNxCRK+Uzs9KQLdQys+pr3zPQJAqO2?=
 =?us-ascii?Q?vkArMKFDwNOSS4QZrYHqXnjxGIJLHw+R/uZAZ2SKTMob7yGKXgHpMeGYOqgS?=
 =?us-ascii?Q?P/XSBgPq4RvvdJ8O2j62cGeruftB9lKmYpWV9nGXFfjRnGG854DhzMUShwbX?=
 =?us-ascii?Q?BDqBPy0hmSBpWYvpLSs0SaCmWswbVNbKSLKfGeJ0W3Zjfi9WJJ7sQoFb7f3k?=
 =?us-ascii?Q?X6IgQ9z8J0zld7lhi/dUwLjTnzYGJjJp3InJBomQv+kxy2hPoNxd2xurQAUv?=
 =?us-ascii?Q?/iM4PZUK6eXpMW4pXfmcPfdBLxqcJjpg0cLb1zQmKp0+SyBE7g/wAGCXjqpK?=
 =?us-ascii?Q?K0IS0lv2FJ/Mrgyqm7rXVkA/OTGgcOcKauQbLjQdJJQs9c2l5dVLhau6gaG3?=
 =?us-ascii?Q?82+s8c2Q1G8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2bg05pTr8mnbaH/8bDOOx8XD2Bp1j4G3hERiB1KFAcijwq8e1KfSKKfo0sf1?=
 =?us-ascii?Q?dEx+g0H44h43qlTVOERG3K7aYoaIhu/8utbuv8ZCoHBe7zmZN+/ru3263OXB?=
 =?us-ascii?Q?EZ5OaTdCC5ePYU4yqNuRK6XPt5t4O4G+kliXWsfZqHQggPTkaxv4qmaxP7O2?=
 =?us-ascii?Q?i3+khFwHz3+LVZMQil60pzVBedkwrhcvvlV07fNVKqE4J4eYu9iveOa9uQII?=
 =?us-ascii?Q?OjHuUYfCeWIkigCY131q1qGfGmXFOw9zRo+8I2XOIEbi9FlhOqdvcsYiO0Ey?=
 =?us-ascii?Q?x7hPYeECwJf7AeqaBDz8q/VOs+7fobxgSlMoyk9RqxxrRbO4ponGS5U3Ih7H?=
 =?us-ascii?Q?A3vPQVAwtsX1GVJLCfiMdJMEJGDnc76+wbxTunxjyRdmlXE/p/Q0+L24uIfH?=
 =?us-ascii?Q?QHk9wV35E67LNaMlNIUSiihgQpFunuBcX7tE82lERrSckNs2pXnHyyT3dV+X?=
 =?us-ascii?Q?JfOKMXCrsFO87rt/SM5QzIPo0N1OvbT2au4yMgdmLDIUWxdZrcNu7Twspj+1?=
 =?us-ascii?Q?NVUroHguf4Yt3XxkfnVJJDH8a/LAhMuJLA3CaJQjb6K5aIpkCA4ZbCmqjy/8?=
 =?us-ascii?Q?v1aOGNmvQemL3jSCq1ulUddwOeNToqtQoAAgPahgfWiuvLabcraSqTVCEce7?=
 =?us-ascii?Q?masAzK+1zq92fe1ZhbPT816ePXhwcovUsWiANgARfyGcJzOBkb6Q6ErvPS4l?=
 =?us-ascii?Q?joWDACpjhV1nMb+/AdeUnLi3ol2EqMipegmgJEf2n2LU9Wf5Jr5RieceV4wO?=
 =?us-ascii?Q?c/sdPRh2aVB9BsbU/dgoXADPb254NnNv9g5KKCROSObTN1ibdQ11T6azNaOt?=
 =?us-ascii?Q?OP43SLYtLVNYOO/TPc02laQURyzUHWnvZSsgdQCRStbvz6pd8Cu7TfByYcVp?=
 =?us-ascii?Q?nggP07P6aTAjDRlUv0F8gcSwVg1e53DoDWNV8rQib9hSXWA/CMEWnpwU22fk?=
 =?us-ascii?Q?fP2g6hCQqvsY5m2zets4nFNpBuxL7eIfuGWgts4dk7ICjtDQFMLkFzh28L6V?=
 =?us-ascii?Q?usF4h/aUa6G/atx6bWaOehEN929HgIcn9aqM/K7eF2S2virZRZ5gC3/Xw5cV?=
 =?us-ascii?Q?0AJTJCxo/SbEKiqMO8bIwOh9vyg9Ugxa74nEpl6E2M7vF6G/PZpS5T5+L6Gz?=
 =?us-ascii?Q?PDnhgorPR+kRVNHaZz1dZuTRUh45hibi95yqDfklZq7pb3nha4KJJzjjPU1l?=
 =?us-ascii?Q?GsknfBDMTOnMjbW5PHCsDh9seAmpe05kCZLPuPReWwXxEImwcrGSHvxn4ps1?=
 =?us-ascii?Q?nALOMYg65G6XUA6pize7yl+vZLVGtiZBhj44eOVmp3z9JuQqnJDjlhKei8ah?=
 =?us-ascii?Q?AApNVIvD4+kiozvRZvhh9v/JPnr8Sg/lCxnPdwZGefvJxGdygAWcZT4WdFZo?=
 =?us-ascii?Q?Ex5p/ARq8UukcxIEQ7hgju65fxUGg4KM/eThqIZPw0Vx6Adyoa4zraG/usPl?=
 =?us-ascii?Q?CNP7xXiv8/GwBISURl1BVq6F35GEe3kfrp9rcuhAHQD9KcqAiDc3rg8mM6/q?=
 =?us-ascii?Q?G05VSwmWQ+86r6NijfdVImGGgqUSJB1XTGCnGF7G9YNZOm+xV3GH50gV0xQu?=
 =?us-ascii?Q?5ohi8BmGrlW63xpvs4D7rt+gBjTonmPyY3hQ5tgi/L+HQGWpQ4wUJjmlPItk?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb32cb-ceca-402f-5a14-08dd8e2bc81f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 12:28:05.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxsPCvw3TS6+zWEW5OoPEKwkdRSD7WycR54HwdvfcKY6SuIDrx04VcScoch2idzxLwEsEQhp2/2NgnRLhwkrIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 12:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216150

Hi Ross,

On 5/8/2025 5:40 AM, Ross Burton wrote:
> Hi Tom,
>=20
> On 17 Apr 2025, at 19:08, Tom Hochstein via lists.openembedded.org <tom.h=
ochstein=3Doss.nxp.com@lists.openembedded.org> wrote:
>>
>> The user cannot override the setup command options --cross-file and
>> --native-file because the meson-wrapper places these options on the
>> command line after the user options. This problem was noticed when
>> trying to build with an SDK using a custom cross-file.
>=20
> So I=E2=80=99ve been trying to test this series in eSDKs and have discove=
red that some bugs meant our eSDK coverage is basically zero.  I fixed thos=
e and now have the interesting situation that:
> - fully populated eSDKs fail to install
> - minimal eSDKs install, but meson doesn=E2=80=99t install a cross-file
>=20
> Did you manage to test this series inside an eSDK, or just a traditional =
SDK?

I did not try eSDK.

>=20
> Thanks,
> Ross


