Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B6ACFC53E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:35 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.61])
 by mx.groups.io with SMTP id smtpd.web10.51803.1728901292699356517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=i1NhXnLg;
 spf=pass (domain: cherry.de, ip: 40.107.247.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2InqBgeihkAp6V2X330Tp/LgFItn3TWTf1OBME8a08iDU/dEmhYrhuiF2RkKt5aCBxH17PeMuhjyEond0K9P5JVTG5KgTO7QkyY57rPkt9B6C4oKLTptZfBCoOV2mBFSJ8DJI11ZvC3vE8PUWzQCEOPnVE/rHUtxB5yKR19OZia0/9xmT73Gk9qCEhF239YlOUzbw9+QYwj9mMidDyCRESx3cnpUpF0fj5UbTZMQrJFCLYnq0PqJnKBEYT+H5u6w/SLT8FdT0VPn7XXr2FC3GrdioPcdxkEah49IsNmntZ0X5yK0DNr2owoUANWqvKUmUqlQuvB+jsVUtzVg5TOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CExjxMzJWICprp81UT3Qn6gT98WSK8gNnGMIpO4AxaA=;
 b=m6n8u9lb5eIo41lRZ5t4dCfDeTa9SAhSgoJIfoBJPbSjdrQlj2LHrxmzDafMqv3qJ5qDO1eOJZCn8xmKEIfLhnDXvN7vRMgqRAOVYa+18p0Cixr3Wgp+3cn4lAxhgkhALkSFa3V19FFzwlrA5U5KZXkoJ76jidyIirAiSpfEqZFCUcgS03tF2hH96sF2Z+B2e6PchIGpRf8KKoLGAOpUV85s5FfH2xHXGKPOdUGZtJl67oseNgOAJG625vyurSRRSccBbcTSyrWcGmIvVTB0eIO3c2frl92esweRZyV6bSPpB2kDcj7GMctv3GGewUcm003URNRluRGeFj/0/prcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CExjxMzJWICprp81UT3Qn6gT98WSK8gNnGMIpO4AxaA=;
 b=i1NhXnLgAjoYs61v6qVPz+YenqWJxrW8zrA2YmSajjs9UibQUjWWiGHNu0WsifIg88Tp75iT6LaTAKwNTBXde0aymEBrbbt8k53LUkJx6sRiP4XsyUZC01asNp0bzNUcdHeFWhaLQjJaMv0VdM2xskuiaGvZmpanbzyu96oK0Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9675.eurprd04.prod.outlook.com (2603:10a6:10:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:21:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:21:26 +0000
Message-ID: <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
Date: Mon, 14 Oct 2024 12:21:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
To: katariina.lounento@vaisala.com, openembedded-core@lists.openembedded.org
References: <20241008063325.62462-1-katariina.lounento@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241008063325.62462-1-katariina.lounento@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 4186d64f-2fa0-4b97-1080-08dcec39f58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xGiJXYrttakFRSR7TjhxV65PkQzpEp0mxU7ruKj1egMHirKoanBL0ESUKHZk?=
 =?us-ascii?Q?oTKwzBz3BVLRKIG/GRgxw5+7jxZd3nZsad4MRuzpT4071G002XYjublN4fym?=
 =?us-ascii?Q?J8gaiLmNgPaIt4jU924zEXLsChCEiN7Lpe5k5A3HYJmeW5FJpQBzdQbdr+R2?=
 =?us-ascii?Q?KlG6Py+0BMOtv/d4yOCORvnq7LpAgHncOeMyyWmQ/rY7ANksgfu2wCRtZ5s9?=
 =?us-ascii?Q?8UEEvUUUAaDv4RkkOdY7y3gfLrrnIjCnIwJa3LbXN9YFFumuC4aY/yNONLqZ?=
 =?us-ascii?Q?YLP3zonv8I3xc6O2FfksQRcvk4PDO0GlRor7LG9wQshin31GAISBjl2EUA14?=
 =?us-ascii?Q?KvzqKWvN5V129sko+qcaPgRYU4ch6qZxPN/0bF7zDkml7jZ57q9gNLsHNPVd?=
 =?us-ascii?Q?z3m8WbXC12JKM7ZH2rmhF94hApdrsj7uFVxtkIGFUhrkiFRpv6l6QA9KAnVj?=
 =?us-ascii?Q?JBP0RL6ZruJysTt8Hi8iKNfb1Q131d6EplFfxjaf4+zhndH7iw3DtuA0L7xQ?=
 =?us-ascii?Q?xk6vtRBC6uytUCA32w9JoaX+TthqSat3RqP9ZbJGuDeiCUv19YvE2nk+PKNc?=
 =?us-ascii?Q?1k4n1e+WokTrB0jNRMkZmgo2wvWlsVLXsJMAdGwd37PLEqJUKE96JbBpSWGC?=
 =?us-ascii?Q?InwKZPR9LuSsVsv4MjMm/6YBpqHA/mWi8hoOwm6ujwKA9dWCsCMf9yiTaNVG?=
 =?us-ascii?Q?u0PCQLIbr7dDjIFA8T1z6LAojuWa5HYPBLGjGQu4Up2nRO84Huw2pFVujJqt?=
 =?us-ascii?Q?8F0U19n31ghm+0w+NKTW+quC3MAdmQf3ZQOcbSYGnyWP17XIkPW46Mfyayoy?=
 =?us-ascii?Q?950hc6PMtuBSG3Mw3j2vHxGP/1a1INhWv2mXFKu+Tez1wps7NhieNJR/TWYN?=
 =?us-ascii?Q?pGGXGiyyCiIgkmdU7ggmeTMU5t3G75yuvOwcTWmjK7Bg3IbyoL6j5OnhWIiZ?=
 =?us-ascii?Q?e6Tx4+tLYBm8Nrc97t2aE2JuEqH1hKfTwqIziKILSc44eBnv3EwdeLC7B4ss?=
 =?us-ascii?Q?O3pUzcjNKjT3vMrkAwIqIR6YkYEcq1VzDqMfmJ8zHHd41YTzUUMVLUSeCzjH?=
 =?us-ascii?Q?aWzF0NFu68T5oW5W9WY0zMcZ2pDSDhqKRsvA0btpH7CVhtctayKlyVU/eXCo?=
 =?us-ascii?Q?bjpQPRpx5oCRzOBnx1v/cr1TQL/7UFwJQnmuLYprRYbtkHluZY8tqXWmv9Rb?=
 =?us-ascii?Q?Mx5R/vZbusTpRd79buPc5CVKCFAp64rlOQiXdZFUzM36dA+jYqlyABNKwoeV?=
 =?us-ascii?Q?nWvGz2eAtBJP2svjbDpdLXoJZqJBH0vdOZKGawzFfQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yzaWsJ6BZIudLhkhN2PKPMU7lQw3lj3pNRcwgU/k9n15J4V7xbns6Gjc3sUk?=
 =?us-ascii?Q?aUICw0sJ1+mPAl9Ij4I4qMbKUZJi7jdxOEZNcfjIusTGIsBPuxxcDHgWBBWB?=
 =?us-ascii?Q?aiCcXXHbinoX3fVvp3HxHcT7kRtsH+rXf+nzbIT8BXbhKzZyNx2IeroHGThw?=
 =?us-ascii?Q?5lJ97Lko9Iz4jhRvfYVJVoSWAJS9Q4mPP0zwtsfmSxshgDrIgMkzXycRSN75?=
 =?us-ascii?Q?1+ThX1Xzd+Jj8MRFo3vT4c449HHNqXGVXE/b4HVvpyWJiVJXKn8tgqgEPc+g?=
 =?us-ascii?Q?AuBPzmaYuYP37QD98TqQS/S00wsdRDkHOl0n+l4t0i+9h4RmkTu076txfHlt?=
 =?us-ascii?Q?leUrESQ3NMq+EZkq1lhWoZ66P1xhKBhh6nSh8U1lkSjgiONTGDEw9z2x4bkS?=
 =?us-ascii?Q?Mc2oQKlQx4hh/T1nzHCRXQkj5bqkVf3skw/TXP4NbPgHIDHwuUHbaFJ+M21m?=
 =?us-ascii?Q?Yfde3yvHGsMMilRLxxNDEpa7pRbvEzp/rdADGnAGvHBws0u7nOJGlLT7DL1O?=
 =?us-ascii?Q?AGW5aAV4ejaVsP3pbU0Vqoi+V+wKBrYhGGRzTYn0nGkKAc/A8jdMeoLBOF9/?=
 =?us-ascii?Q?008Op2M1YCv9nAlTVvl4tYUPZwGcxcDaZjP/SR2cuvmdehprRR2OF988mFBk?=
 =?us-ascii?Q?sWimy8Wg4/R9LF8SF/VNRk86BGVYTuaeh6C+gPrZMs5W1dyRNpvAi5uyex91?=
 =?us-ascii?Q?6Uasy4moM7es93Y0YRAiASnK/LrnqPKXaxtuVQy2oRri+1xezlMtQW2TdF3B?=
 =?us-ascii?Q?memBpCVqihjOcgBE8rxWdikbaTmRwqLszx88DNedZ6V7zwOz/TbtuNa5nGk8?=
 =?us-ascii?Q?4plW/l2hCkSFKJffxxjyjVQlvVfOfu4Yfw+v3zqXObujWGoZiiiTzhw8snZ0?=
 =?us-ascii?Q?MP/GvkYm7/UYqsWhks/J+K5xpoeOjNx388iVXrVeMty6At27esT2F9gxBuTz?=
 =?us-ascii?Q?Ab1+tAfeZ6SidHPFyv4lSHSFSmBKNKVJRVPUI7GNs3mTgkOnDBO/mu18Sre+?=
 =?us-ascii?Q?W9VFS4AoHEuMGUBDUvJgDVX6n0V+jIvIXXVFNo9JfeTYcU00O2T/eCWe/je9?=
 =?us-ascii?Q?/4s8fszphFUoJzgJLkSUOY2mJWB488wjQnBzslGzF7Vs+6XNfZDiM4hGFAYE?=
 =?us-ascii?Q?V1DAyOQ2zCNZ67ePv3VJhkJIx9qPfUjAIjxfTXlpFqbCRY0Ovipefbk6J3X6?=
 =?us-ascii?Q?zBm8gvP6zEnnPCyTlatAJOLl0BgV2dFsys8mYUIL0XcbMWANeHzn9UrojOOF?=
 =?us-ascii?Q?AWdAP1CscgMOPadDQpcUEI1/OzJR6nyPeh3vVgb0e4gFNZKddF0JtwA9NH5x?=
 =?us-ascii?Q?sArD+jt23urV7LpOkdLVtQGATRKELKCFkkkp8xGDOzZSPtymccSae9YymoCc?=
 =?us-ascii?Q?ve80E4JREQvIzPxOO20Ti5TygCK2oQysLpm20JlPfiKHOIHWNDibvflT2DDL?=
 =?us-ascii?Q?cSHo/Um2+gaAM6eZzffhFQ6H5eA1mRLjuh65Z6d0wmfchwarg6C0Oqw5zf+i?=
 =?us-ascii?Q?ZPMxDT8d+SJTvdFUdvLOY6lRfwEOzOh30IVy86HwmPOu7gSYuM6rQYyV00BB?=
 =?us-ascii?Q?M8ZIPOhIeS7rIVdxM5VOsZeHlqWN0mBwsOC2gIfV?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4186d64f-2fa0-4b97-1080-08dcec39f58a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:21:25.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jHyMo/QpgxrGOumtb0lMj8AwT2I7zFAiOYDB5GUuTTAzzwCaMAdbABISVSaN5QnAKN02JmA9wZQe41nTkpWc2BvoCM8CpmZewRbdL0Bpcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205739

Hi Katariina,

On 10/8/24 8:33 AM, Katariina Lounento via lists.openembedded.org wrote:
> [You don't often get email from katariina.lounento=3Dvaisala.com@lists.op=
enembedded.org. Learn why this is important at https://aka.ms/LearnAboutSen=
derIdentification ]
>=20
> From: Katariina Lounento <katariina.lounento@vaisala.com>
>=20
> The list of valid statuses (`upstream_status_literal_valid_status`) was
> missing "Inactive-Upstream", which caused patchtest to fail the test
> test_patch.TestPatch.test_upstream_status_presence_format for patches
> containing lines like:
>=20
>      +Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2=
013]
>=20
> with the error:
>=20
>      FAIL: test Upstream-Status presence: Upstream-Status is in incorrect=
 format (test_patch.TestPatch.test_upstream_status_presence_format)
>=20
> "Inactive-Upstream" is documented in the Yocto Project and OpenEmbedded
> Contributor Guide [1]:
>=20
>      Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]
>=20
>          The upstream is no longer available. This typically means a
>          defunct project where no activity has happened for a long time =
=E2=80=94
>          measured in years. To make that judgement, it is recommended to
>          look at not only when the last release happened, but also when
>          the last commit happened, and whether newly made bug reports and
>          merge requests since that time receive no reaction. It is also
>          recommended to add to the patch description any relevant links
>          where the inactivity can be clearly seen.
>=20

I'm wondering if we simply shouldn't remove this status?

I believe even if the project is inactive, we should still aim at=20
submitting patches in the event the project starts again, or maybe it's=20
just that nobody has sent a patch for years and the SW works good enough=20
for all people involved.

What do you think?

Otherwise, looks good to me.

Cheers,
Quentin

