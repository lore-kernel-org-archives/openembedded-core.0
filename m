Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BC4CD8CA5
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 16:04:01 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.59])
 by mx.groups.io with SMTP id smtpd.web11.95334.1696953835304247473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 09:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=a6PI+zyz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.59, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3SBKdca1loZREQB5PwbYACjdJOrqr+PXYA3BQNxYQsHm7qMXbOZt5OzXXYIo/ZmeyHXSPiiMhiTJeHXE8+xMU40Sdv/sGoREvhihr07WlT8pTsyiQz7CP9o/2HEQ7obIgjqsJ06BO7Mu1sNJLjsfRaUjT+mbRHyFzjljIY9bQrDIPUks5K+xMrm6z84egvtE90rtYOnEK04SIgH/KWAWSmM8f6ygFGwP1fCff57aU8ESKx3LgrCli+Q1frAvUBQ2q60tNYnpd47j6asKp7bqx8P4KCyj5hPGOmZKPARezs7AFxV4UPevHwAE5FDvmyuUecqvnO+WSqtneV3g0Fxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvcid1r78RZo4bhiiDsBz6JULOpc1VKgIN/82PH89yI=;
 b=bRVcQT+V0u17wQoKJ3MJkD9s6rZdzWes9s1fCLvMbJ2c1FRengMN0E2D46ufqlqe//ynoXhUP/jjqCJ3OTd0a5flOIwXAd0kDbfK6nI6HftuTv35JsDmu7JYM/qggJ011aiGDr4oQcGKECdZf8cSbNm4WvHz0dtnoCCgldWXGK8UTC7R9xbcd1bFXA4g009ZdRjwRVcekBryJh9SddXZRgRlCBx9tLvCTOvFBQu5AoBcXBzQvtIIGoP/EqLfRJvq1bPACYtNZ5ES7Kaa5KoKbD+iyj7L58LOYf99jj8Il9mk4/LDSspEJ3XKA/4D8G+4ZW53i4cEXwAS/LPtp+8zPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvcid1r78RZo4bhiiDsBz6JULOpc1VKgIN/82PH89yI=;
 b=a6PI+zyzDKbn9S5FF9HJ3YK3bmEidi2olcVG8yAIEsX0MpbZaooDCDQYNo5fpOOptrXrjpYXmTWMdbGQrcslhSN77uXANLr5yp+uV+BV5F7sm23A4SeF1zQXX5VGs9aNhIbiGusG4XcSFuMod+49cY69uJXlz4w8cVs/33ziufmH5XZmbXYwRJGVEqto7bShe3WI0YQge3BR45DHI3vAaIF0oIyy3hDpyWZDZ4TxCSxLargOxyYaA8b/vbAA46I3XfK4jJLWoN/LGNKyo+F1R4LJN9rBmFSsssVRlx/lGvu0Ws4ET+YnsviYj6kdv7reWRqwLo5DzeUH/5I/+epmGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7745.eurprd04.prod.outlook.com (2603:10a6:20b:234::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:03:51 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:03:51 +0000
Message-ID: <2e63bf32-f372-4930-8dd5-7142cd8d049e@theobroma-systems.com>
Date: Tue, 10 Oct 2023 18:03:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] wic: fix a typo in help output
Content-Language: en-US
To: git@andred.net, openembedded-core@lists.openembedded.org
References: <20231010113031.376044-1-git@andred.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231010113031.376044-1-git@andred.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::6) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eff751-f5df-4aa1-2a4b-08dbc9aa7ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xDDFEwyw6ANSPssKQE0JqIjM5xLswbJa8/JjgEaIoH4YEDL8LtQOrphOaAb+BMZbiS73UBde5mnh5e5hTObvRe/JHpkCufErksgF/+qTiDOw0G35Iy9apvRiMjpe2aEDck1wZeZUFqFEOoeJoG+OpZf9aqLsg0YtRJvyH9POp+WChwoda2bv+1q8o1Yfjvutwuslja9B7O8ROFE1UrQqm2RSzT/pMpT/Ze5Viibmc+BUjAWhsSZ0BkY+JpQPKhDeShjrO9aJm9T54O2hUCzl4LphM9gPgQKf+JjTaiGPZ7Myqo5yDloQELkK3qhZmhwyygyeXBVmODtUIZJVO9GC2sR4OhugYhNsj/NCSkcFpFvt95OLD2oRBrF/unekDtZqQ7NFCfzSQoHU8BWDkkqp9QPKTn+To91lCPVou9xDi/YDUCVcCBU4ex4xGNexnIzYBTF7bYQC6+PakWyQJPUlXpaleUwKdVosXfR0h4YydCw+UtGtmykz863KdP0CVxYWjYONsMWJXXBteAqPVhkf/FaIRTRhA6gWpz61vzFB2K06wPkmnTTmI31DXtX0GHgduqvTIdqPAm11qtQ8XRAuktb2cB87Ks2j8ofyJQLHwoOSeNNwDB7EhGCH854XfpycKpeN83Y787nCO/bmG0DbmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39840400004)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(53546011)(6506007)(2616005)(478600001)(966005)(6486002)(26005)(4744005)(2906002)(5660300002)(66476007)(66556008)(66946007)(8676002)(8936002)(44832011)(41300700001)(316002)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JMwSpntQvLerZCT9ilJyuUTzrWwMjn/m/6MsflqzKW8jLQyxit4HNJY9llbE?=
 =?us-ascii?Q?XhIH+m49QSNb9A1ql7t6RAvZKFmC+lCERZO0i2GtUVeLpxWd2p5drkiMdOLr?=
 =?us-ascii?Q?2deu58ZTssSQPzwf60gkZL/h9Jl5Mp5/CoFaXf58EehtOkKdxDIFCD/+TaYs?=
 =?us-ascii?Q?JJkT4pZqPsHrQNphRq6/QsFSKRItvV/nDje0ZVvB9m/7pV8Gcx3F7EThZmb2?=
 =?us-ascii?Q?q12VBNB5tjpnTf5H6SYXFsVzWpKBoVbmiT1H8ZhD/22BOCN8mHXfAyJf3xgd?=
 =?us-ascii?Q?e9sEOb35l9JnJsBq6x+gQD4tGeimHHNk/gBN12yR5AOoKNUvcjPjmWuehP9j?=
 =?us-ascii?Q?gcVvyVpX2552NO8VN3n+GF5YKrhzIkpnLWGM3EMzacBrYzQXf5cO5doUN+MP?=
 =?us-ascii?Q?cF1ApfDqIGbRi9Ipz/eHzPNUESqo+UQTyGERPqDZOLnLSNOHA5FyP5zKsILH?=
 =?us-ascii?Q?mIWacLucYhLs3GpLaJzrG4pEpc2omzdO1X2f3vnJiq51cl+Mv7Wv1/xB1aUL?=
 =?us-ascii?Q?A0Wp4KnCOiZuUCXQl0Ymj7CJq9KbrD51IQWUiNG3+tTYg9TpUhYJ6T0fJHh2?=
 =?us-ascii?Q?xcrtyh6mz2sNM6lqRGGl+vqVsgBZ2CoZ6PHmoYllGRql8x5aKKT5zomlDN9E?=
 =?us-ascii?Q?dwiFCcYuibvNyhv11pByzY6V2PjulFR2jQ4B1X6pZ2gofxb3pINYPPIcc8Wr?=
 =?us-ascii?Q?K6bJPEqx7Kh0bEbkt+dd6yGNNOalVevt9qD0eBI7yztljs7DHvzPBTs92/TV?=
 =?us-ascii?Q?jTXyPiRqGeoGrKM5Unw5GjuLPnmq83W4v3rUoaZczsXlpXKCE9cS2WOGOb01?=
 =?us-ascii?Q?IJq7glGmJ2TH5LpN3p99Kfr8DObWMSVgAimUcNpwMlqFA7u0WMv5/123r7S4?=
 =?us-ascii?Q?gnHjs4JXhH/bYTxlJWp3JXqpmJV5tFX1YEaKyHUxv+rRcAWaS3aJfuoXEce9?=
 =?us-ascii?Q?+v9lRQtAEwMqiRDNjSD1iYWJ6HsYlr+nPVFBrfZX2hRYaq11PxxBoLR4VgED?=
 =?us-ascii?Q?nF3+tk17nr1lf65UhUxfm3fW//UOxbSe0oVs0gAtb8H3IKwM4Vt8g4rOngIv?=
 =?us-ascii?Q?yZtBkkgVZXaVMI+lIoNWjcpGMKAVE7ms8dzxMA8pV2y1XOuQf2IcAybQt6c6?=
 =?us-ascii?Q?x19SKEWuApGZIJbWz50hQkISWILTkIdfYMMVEXC4IBteQBvWaob37Ap2LqsF?=
 =?us-ascii?Q?tVapZkGGNHL6PTd/F49wKD/Na49LEAEA4ZUCHpHYn+qynL+sc8bVz+ejB+Ir?=
 =?us-ascii?Q?vclHzHBy+Gr8jRIysaotP1LkizofYeVuNvfZfmoNkjANVukTuKdfZn7Fyp3P?=
 =?us-ascii?Q?DLUf6GEytDEQAlwlvPxmcULsHbx83uO1ohnrm37sU34ASOBeUo/mj81FoYiM?=
 =?us-ascii?Q?0cygpq6sXWP58bpn6UifF6G/hX2Adr8nZcuZoKkpCvOnToqyIZiYm16kQx9H?=
 =?us-ascii?Q?A7y82Ienlo41VPg0jobt2dTQ1091A8zy3b6V29MPXusQU2cwSCq+XNRgoPVZ?=
 =?us-ascii?Q?R8ieSfJWpaovJRbJKEY8+zmMR4aoUBhJuGeAJ+kN0q+vwo42WPk7nUrgwl5+?=
 =?us-ascii?Q?MWBBalx8NUkaNVel2KxHnUFv8KYMpcAkI4yjrp7O0S2XDoVI9Acj2PQjjoCj?=
 =?us-ascii?Q?+7Gowy4D0Rr6n2BgsoVjW5Y=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eff751-f5df-4aa1-2a4b-08dbc9aa7ebd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:03:51.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpKfHXp45rJuflp0bqbtrAtHkUjyaFghnzY0FZIqbWeJ3fdx0HgKoKD3ur/ioh1p8ZP9t8HEuswxlOieIlKQWG8E9iEcjEXnkmEgBDnldRYlviIyzyAQlHFnBWFHGy0s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 16:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188913

Hi Andr=C3=A9,

On 10/10/23 13:30, Andr=C3=A9 Draszik via lists.openembedded.org wrote:
> [You don't often get email from git=3Dandred.net@lists.openembedded.org. =
Learn why this is important at https://aka.ms/LearnAboutSenderIdentificatio=
n ]
>=20
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Cheers,
Quentin

