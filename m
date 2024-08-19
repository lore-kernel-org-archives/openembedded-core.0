Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382E9C5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 09:30:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.112])
 by mx.groups.io with SMTP id smtpd.web10.206543.1724059813820436183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Wxjnv6n5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.112, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV3Dc1xFc9QEi4hHqNXYlao8/4ITJlEu1o1WbQmUkK8NmgxkNyqAQAXGkAaAGkLviCH8U4LzctGJ66ZYjqIa/FWcuAhqF2FxVLFqE4H6sqagHArZJP2RCg6YNWCeJUl0lRwTm3kpdEdiuZBvKcl9wMXF/wbPwwr1CayeYmMOXUgslbeDEvOOx1yWgjrMyERzSXqY18E5as9MUr2AtfgO0aOFiXZm3r9KBo2IzjUQsLLEVPyuNhNKAv+uX8C5TnHYAvFOqy4wVBxJV/rVljMyhvIBujEFEwpzHRubNuBnAJ6AKzrI5HhYeV65zv4xFsSqLMZfYladjQ0ATU7tv5ST2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqicTLlpwYg6LXJ343gZeTzet5Ad5sdIUj9kYeJh/4A=;
 b=TJc1Ve0fy68QTol/yy2xvh9fpx8Q3DE+rKmNkYwLMA8P14P7ty/x9YHrHf8RjadsPoUvH9CIK73SoWbeqK//aXa1XOT+b3bQ9UdI0yavWrZm6qW52cCDqDfEnffDnP0Ej4QFDTM3yGRNhVK2yRvmiX4wRGufJtPU7rBfnmDNVmSAaAJVNi4seBHaQhph5c6QMi6kvTLqooAvVosPJeMx5TE9RAQ00EFOurn4sIxe8ctq9cZDCE7emSoOjOSNhqW577Z2Zn0njkg/p9Gc0uR0murrEMzi/cyiFUy1K29Uoe1aJUgmNJ05lVI4J5j54vC9O2iTanpmP4On4Uh9F04irw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqicTLlpwYg6LXJ343gZeTzet5Ad5sdIUj9kYeJh/4A=;
 b=Wxjnv6n5uJoNYJ1wZzEZc3K/RYnJXoX0t853x1zQ2/VMlBkpwDyiv4NGpooLLqi5E7quvWXtIqAmxVeHdHNugqioQegdY/Xt07IaoDKHGULQGgjDIombFjHSt1kpUGGMJHrm5sc2+tfMZww8eHxFyanyIqWQ7SSnqxVD6tdWxbRYnjngy9lwvAOn5zpzPXDAI7P1zPfQ0iEXX18epygTFlZ/pkvv0fm7T6vMSHUjRP32Dg4iIWSTBjkaHGb1/9S2HlD/Iwd8vKIaznXPpZ7OpCa9vXKEOOsjErJbD9lBeIyAFlEbSR9Bn9tt66uuaSyFjwbbo6Gmx4DsSA5CdSr8Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7728.eurprd06.prod.outlook.com (2603:10a6:102:150::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 09:30:11 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:30:11 +0000
Message-ID: <04335c41-624e-44e4-aa4e-491f54c228aa@vaisala.com>
Date: Mon, 19 Aug 2024 12:30:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20240819082215.1322013-1-niko.mauno@vaisala.com>
 <CANNYZj-NDo7vRb3Qvngb3v3yCfxfF+hGpxC1mmGO=gpBX7UMjA@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj-NDo7vRb3Qvngb3v3yCfxfF+hGpxC1mmGO=gpBX7UMjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0000384E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd6b5db-3b42-4102-f2b9-08dcc03185f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JvQEBunpeDsVO2B0O65ekvjqY1BJubMnROLx3TI1BKmWkjuA62uCiS0SKTWK?=
 =?us-ascii?Q?vkHs7GdjEKCWVWW/cvyidkBYx/wWcaX3/P+of6nOb21I8gWHOScKqRrPoxFE?=
 =?us-ascii?Q?Es0Yps2v+U0nhMk0cIrOKDS1kDdA4+bxclEf04tU48uYiiqbFDbmsvIa4v8E?=
 =?us-ascii?Q?01coIgJiEBHAWa89H6GuTyApYb4CGMzYjwiGXDp2GfC/J1ZasbPsbEs9z2wH?=
 =?us-ascii?Q?F+HiedgLMzCC7MROM0d/Nt8KDkEzX6cduTPGqlBQrXZ39QdVX0g/0IZclhvG?=
 =?us-ascii?Q?8ejx0Mu1I8R9dkjItOYwF2JkPGaPIfUdtVifBLwjPex4B9Zx2FmBe51IMl7J?=
 =?us-ascii?Q?b3lK+ubDLAtNtEIX/wbTQAYbJkStVuqNGGAXF1jZZooaE7Hk77cn7bpJvaV8?=
 =?us-ascii?Q?yG3ytdl2n3lQ7ctQgOhiozIT63K7ANJhfUq+fkg3uONmEGaZoKoIp6YF6o2W?=
 =?us-ascii?Q?Sne0/9FKCqCu2APwP3Y1yr6r6pqLE/tlYrGARvkYXl0cyOsJ08nWKsBGpDhz?=
 =?us-ascii?Q?wV/XdvRkoNYFF+IwjH65P0PQA4MkVCF81C/0c45NYDKPhBrieNYltVcc1wvN?=
 =?us-ascii?Q?umRDIRW2orRSoitKsuP3LdxbCtopVR1XJRO/YV/digR9mEl7Ok+4R+9vfvZ9?=
 =?us-ascii?Q?+hvj8Ph7FX8JbFMOfxuKUYDFiynsbrOq8qviUtnIVeJMdGjEsHuB1QwNIlJ0?=
 =?us-ascii?Q?GBMJskzR7txPxaFD5tNQbBJmOyMYJ7Q198heCbPhCDAkC759Ga+ugnjjppeh?=
 =?us-ascii?Q?qbF7pGnsVoyFoFU3iSwQz8g2UaEUITplad3G3nbW4qnfLTlHFWf/Tj5N9l6A?=
 =?us-ascii?Q?hc70nIeSRuGPbhZvjDyh5NsiTGX+v4UGd3Uo+Fm/3F6Rmy6OQIqxfAB+nvKh?=
 =?us-ascii?Q?pPKc/CceqjwOlRgyz9S1b9C4Vtmao/EMPOVtVGCzuPtd8SxwjY7OccczwWZo?=
 =?us-ascii?Q?rrQD21Soh+FBdUxc/rdr5gwF0hX0VGwl7k0NfdBVXY3/k444zn5EmlROswta?=
 =?us-ascii?Q?lTIUqno8ETmgXTYUmPqYg5ZZ3TfKtX+D/655BGwIV41Gkq5HJf+yl16FnqhM?=
 =?us-ascii?Q?SUCeIlRbBRkdYH1+JezgFbuS6hP9v2WemM/YczU0BZpH1q3Hu7KO9zLnTHWR?=
 =?us-ascii?Q?ft1edC0m/uOKku7KifYLLWRLpLbCU3xMHeniVIzEMDpD1TUAMySuCMLs3F/7?=
 =?us-ascii?Q?ZfWHyiVZHxZ+X9Gb1onUHzB8fgY6pfD/JTL8e9DDBgwkGpzfDCiks4zEJduE?=
 =?us-ascii?Q?cSX1F4cbIVS/qLMNoTft5M/arUTj1zL4rjNunawPhZI2mnPEyL65Q/a4q6mt?=
 =?us-ascii?Q?1cSyVjUZxaDWe1ZAHbqEK1N8X3Rc1/3y6pITZ16yMmk09Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I4ap9I4GQy4CCY7DuNSyBgp1v1p3Al/ukdHq3em4lR3P9rHkY2Lrq4KPl1tP?=
 =?us-ascii?Q?QV2Sea9xHb/Qj+FyBp6eOTstqQIhyvrP3BgxOaWh82i506LTmqVhO7qseuos?=
 =?us-ascii?Q?iA9gdvBfDqZpMwIAM3LusJdOI4abHO0ASlKEmfR1JlU8Pkglt5OxNB40HLZq?=
 =?us-ascii?Q?U4H5IONv1Bc3OBfy6aAtJsV9gEwY7TDt66sqyFTOLSZQanrVrv5ijD7joH25?=
 =?us-ascii?Q?MnxhXyAY0wncgrodouG1wZUXcDk8fUj62w1yVJaVSZty9MkoHO4CyEROCkUB?=
 =?us-ascii?Q?FRaTCSAuC8SgMZmR61j5wi8KzVdN60QuDlcpdy+JxNOvwKduKPpD3+dmHsAa?=
 =?us-ascii?Q?eRJaP3IPSvwTu5+eu6zyYtTw5K/zVQ6gtE8kfVo7EmC6ZRswoz4VkTIktMVi?=
 =?us-ascii?Q?SP6ypg2AgZTaE9FXsp8uqacrifW+bmKP0HS5gNBaq9gNw4Jaq//7GBIwgRQU?=
 =?us-ascii?Q?lQ75mkklz6RO8+0yBo0mwvLfvGY5Okkn5iGRYPDn6/U1w9Kjct5cWdmSaz0q?=
 =?us-ascii?Q?NaOnOBjVP6iVa5U/Ns4TZ7/SGziM2qQ9taW+dUu2CFXXOa+RerlWNrCQEanw?=
 =?us-ascii?Q?jkwsxondZoB8jnjMNK4M8+NchaVeVYPl8cjeIR9z9j8yLau4IYyS9q9Yh1rc?=
 =?us-ascii?Q?gx0xXADFuUHtI2OOaBoSyKdQ6sifAOrJnJRxqm9J9FHEhKSBKZJmlsilAmuZ?=
 =?us-ascii?Q?LtTs2fmgi/J9xKPM3S6ERvPTz4UA4c8VTnyciRFlKAsSXIwiGeIrB4V9UEql?=
 =?us-ascii?Q?qK14vt86ZIezvQPV1dZHfc24uhbF99wvRWmkcurfRz9OCYhrQ81xvRLqzIsn?=
 =?us-ascii?Q?24ZI2Y0Uqv2kzOZpfQuL8y1/rhH0iGjweHB5TbUeLJDpU9qawW/CjEManJQO?=
 =?us-ascii?Q?pmLwXygLQ8fY2ZQQNndcq4/qBIEnQFcVBepf6IM4+Qmwia/I9wHN3e7zwzp7?=
 =?us-ascii?Q?xdKdecF/9DjrC+ZbC1YbZDBbVaCcP2Slr9mP7cqTzG2zgNeqa6tRC7MGWIu3?=
 =?us-ascii?Q?WcIOVxE8bLqIzbgRcM/K3NbnEZbyKd0mNsGD2Q3hKF3N/iE61cixdvBC2hVz?=
 =?us-ascii?Q?P8U56IjrChs1FmrjemAXYUldzIMtQFtDP9JqXgWG3zfmZURLJaBWB0oGijmS?=
 =?us-ascii?Q?nVsbX+ONn9h7J9vDiRf666D2W1MYEo058SuSQK7Z1tSs6+FILU6wvhEHDvzm?=
 =?us-ascii?Q?hH2WSAQoX0JHFym/oL+9fX8XE+bxh+55pMpHey29qdXkcSdcrF0QGmru7p+7?=
 =?us-ascii?Q?uomW/rS5zRLPYnWIeNs6hsYG6KrFqTE3D8EeNqWWsRlDCqRA+5eefiUa1nKe?=
 =?us-ascii?Q?UYi8q/hGpqx/ybLIiq1Sux3yVxaTosZDlkRcKAhNtDSRwjyMOENAELfazzNO?=
 =?us-ascii?Q?fETBzrJST49Nzc9Xisae8ZEC9yRAfedP9ylml2z50i0/qfcu4P1nn1mmdjt4?=
 =?us-ascii?Q?9wlWT5/58PJqF67peHR9G/AbzKmQfr0yx03WwvWQL69sy5ZEXukjIsFwScGY?=
 =?us-ascii?Q?QWbo7DZOoLTVzotYGcp8amRHLGuY5DOXSuvLjKw/1C3mbLWCRfu2snBp7Hk5?=
 =?us-ascii?Q?pBJ/rxgcDyzqQ7x0HNCXy/9KNKVrqxkzOwKfraurnRTRTyu+CLh8D844mGXZ?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd6b5db-3b42-4102-f2b9-08dcc03185f8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:30:11.4790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6YQE3ubOQ8oS4baIE6vIJHhyfeIYixUwROGaz79g0oTl20gfpRWV1H1RgJWFr8COAOKDPQgC5uLA3Y263NtEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203496

On 19.8.2024 11.27, Alexander Kanavin wrote:
> I don=E2=80=99t think this should be disabled by default actually. If the=
=20
> default upstream behavior is to enable, and all current linux-yocto=20
> kernels have the needed support, then we should follow that.

Thanks, addressed in v3 which I just submitted.
-Niko

