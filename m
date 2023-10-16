Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B7FCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 16:00:01 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.88])
 by mx.groups.io with SMTP id smtpd.web10.130571.1697471990831622296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 08:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=Jeh5SiwO;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxMiW9vjRPAovUNs7NcRWQ3ECGG6d9jd3bqgxpkqiVeOn9tVxx05cJLxiaKzYktfiPE1rHuYC5QpuFhd0pJzssLTyHpDARMYwt33EcGFTTPGKXiRScafqIIEUzfByjIp4YZffpu+fIYOZNKtmvTb27FkRnDXOdn6D2HO6zA4RCMhuFGWfyyxfPYzoai28IumJIronGsNhvff7hlgrQ2b5iF1AmdqUxI9VFeRNAVG1Jkg84s9J5gceulr+i6BB0Fxl57ul/ODM/HnJQYa6ifzhQ3XWuKH4EDf4S17K310gtyx68Uo5wgjh9vmF8+lvxXcSD7sOJl/Qchk6G59mx+ReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaXJKHXBDFOttu+I7JdZJRUumQHfAZzNMmC0Xvohl2o=;
 b=ecBeUpM3zpVwmP9vECikNmwWsfXuy8fep9vYIFFv9iWxxR1Q4/DoHdDaoF4F0t9T5qdWdaxvE0BFOzN8iWDX58Fpj2EvQtcgDzrwqlSPKOpA0oAYVT6zxP5Z0VKcytBpTPBk9Zy2fjjjF4xilP047j5AId17BmSmeJZ15dbn5MaTwA9dbSidZwKnCm0gDVKYHIIQGoMu5saGnfUkRlcY8M4VVor/KdjcvnMM+97k+2k1QOLQAcGBdKjnhN8+Xyj6j4paRnAnmKZ62hB1xueakrgzTfML3Mi5jdIG7xQMJ25LgrWpgeoJPU9sggEpZ7Irnroior6YcYBIQMEkDSTSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaXJKHXBDFOttu+I7JdZJRUumQHfAZzNMmC0Xvohl2o=;
 b=Jeh5SiwOVHS/4lBIh6aBHtc5PDGYyMpNRefhCW926pGn+6X4XQMeow/0pLPv9uJ/2XFntvKuww1os1OSYpjbiZEY2iXFlePCHClNxeMRCRIC18VoeGTS3NUnC5jFQqLST7rjQpueqSmCKM+gWD3E/94ENL74+DTeJ/6DdwVYWRovQPdx03R629Or4kZVeWQbBcZDLyDFZVLGSgGJHA/zU55uGbf1TwCS+pT19Raxw2gCKMtIwNpPsBrzfsVcApV9SRSu0MgKfx1raph2Nz+wIUcbJzao2A6QThdMq0uxiM5hhTaDtV4Xx1IeUzfFI0OR8aW8lRbl5+EBcJ0UsxVsGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VE1PR04MB7248.eurprd04.prod.outlook.com (2603:10a6:800:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:59:45 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152%5]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 15:59:45 +0000
Message-ID: <7a244680-a944-40c3-91a4-13e8dd40d03f@theobroma-systems.com>
Date: Mon, 16 Oct 2023 17:59:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uboot-extlinux-config.bbclass: fix missed override syntax
 migration
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
CC: steve@sakoman.com
References: <20231005-dev-uboot-extlinux-config-sstate-invalidate-v1-1-0f63ac16e38d@theobroma-systems.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231005-dev-uboot-extlinux-config-sstate-invalidate-v1-1-0f63ac16e38d@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: c6206537-8ca0-4249-86ac-08dbce60ea72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPcbSLbIFuS1mfggJqsDOwH553W/q3yrxE4YMTR2GaqCpuQVSALQnCvoTEytx7XScmmYZXRj/1ZvtXaMbJh/E67H18tPGNlcEPNJiE2l53bE9deD3iOphkoHU6QnPkHCALLWn23rjZm0Vo1bVvZMNPPiwuirziTwMGlRXS2e1xTEWkcndT7FUvA54gvDtmhOOEmh4jRDvKjHlfxrY5kHMNtWCbs7MJZS3ItJqlA094l1qTdfE5TWCz1Yy5Adfff0O3nk1BffWVR3NI5IdixFYDIN9g7SY5N3PNp5NYCEPRAYptxDcI+CLlUxzR5IGPGGpxCFJBsc66L/2fcWGv6Dr0X6DP+xBbeCDWEmDAuhu5HjkLO07ZtGigvez1RJChaaMrWPoaMZnPjhuYnF8cUOznP1ldGJWRteVZw7hZsyxkdnB8OpgxGEG7wCzKmZnyxWtrFjgNG7qCfjIaCRH4RQehNULhUU5X5Kybd4IdkBkeO/l94l0eH+TULpMojOsEyAiLen62YRWpbx3Lind7QOKYMi4hw5O+H13rJtLKEVD4kMldJJTescmjV3mk6x1XTh2TWO41hrmBU+3PWQdxr7nPBs4BPzUSGoCkxve3ltoA/fUXK6Yw1M90AzhB6UqgshaMvYl9LkyaFETkd676wtDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(396003)(346002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(53546011)(5660300002)(44832011)(2906002)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(6512007)(31696002)(478600001)(6486002)(966005)(41300700001)(316002)(66556008)(66946007)(66476007)(31686004)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SYstFHSz0/0FgjDvAKuXJ4Y7v6vzNXm4m7JfE4YljYh/CAqePF56+f5m5k/G?=
 =?us-ascii?Q?xspD9eu2ZkAIZ3xJlmwhT4RhX2982gjwQy1NYqsoq9Ztn2y2HS+OqaOrMhvw?=
 =?us-ascii?Q?JnWzljvZ0CCgu9EbwJ60pFgyHr287JJFUD3cJKv23ebhd/8mFXuh5W74in9p?=
 =?us-ascii?Q?mPoCqbMrnKlW1rO0BKXjJCdezmoe9GJGehyhLo8F7fCcM4cGtRPKWuNBpR/S?=
 =?us-ascii?Q?pbRXYEzhPV2x0/rqwjnfcUwewUON4h3Dhp8fMwqLOTGe5I0bdo81caGJjUri?=
 =?us-ascii?Q?pBbcl8wPAHOlvlTQQvC477zkM9WBQIQL7+gmNDnVuZHD5G5O1WNiCNNTzB4J?=
 =?us-ascii?Q?Ima03MqWCrdEfNQahcuoY6k3DOd9a7dX5X180G1+RChd8BvyM8csGK2Fozp3?=
 =?us-ascii?Q?UrhpzGTTeRozPuPA1BTYW4tc4hDaDUF8IIFcYURFK+wdm7vmMgdMM306MbH2?=
 =?us-ascii?Q?YamXRMI3RHxYc9R6IG2JUbSArOjtEfsU/CWc4fBFMJf9kuF9zQzqNYGW867e?=
 =?us-ascii?Q?D+m4qybQbq7p/POUOiz3TW4MtdKS85ODc8H8q0+rzWGk9lN+zG+7N4QNvRhS?=
 =?us-ascii?Q?WXqVjCmDRG3Qp3U+fDuNeoZ2OOw8ZOo0NpSOJ27rG7gCPR/Htq59e2RwphER?=
 =?us-ascii?Q?7H0ZVNGimA/oNmkt2M3A0hwQTGBq4cnXZXVH8VvhoU4kxJAr0PFujEeRN8p6?=
 =?us-ascii?Q?6Bm+8/Ye921AEYq/pocaUqhlkSTIxohEwpKN+taN12glGEHPY+/iQHMo9Pu3?=
 =?us-ascii?Q?qW0rBcVwxkCkTzCiwax9++Dc3K2LelxK+a9m7F2mrF/DaP0sSJGgvba5v/W0?=
 =?us-ascii?Q?/Twadh/or3uyaz06RD0GUDfAngT+13M/lsFaacjHbKmN7r8kb8CVAXKcwZnz?=
 =?us-ascii?Q?EkhYlzbtM+wIGKMMdQmJ0qFCTaEea4fM6u0FEZcwYIcPD1Gc7EC71JUNlKVC?=
 =?us-ascii?Q?69G/IvSK//AtlU2Z84igfsK5he8cRyRPj0BasY7QRgvv+N9wLjqQxgWCkb0b?=
 =?us-ascii?Q?9w6sd+b+Z8/HBvLjCzk5D9nsuR7cVkmGYlQokU5nzECI8DtCDIhZYBTB/Beo?=
 =?us-ascii?Q?3IKP9PdRbjt0CDMzcZ4+Zil5kBP62+xmJFQBYRubYI8/INicYl42mtuzSn52?=
 =?us-ascii?Q?OFmRblQqd+SFq0iQjXrIfmVyto+rlcddXhBnAi4E/7ldW7Jkdza/3fd23TWB?=
 =?us-ascii?Q?MFyKCpxuQ3gzv7SRCE4493JCceiYkd9r9VUKcheLHUZEvsnqZlRXFs1OxZlv?=
 =?us-ascii?Q?/GZuj8yJVgqh2Pu692Mfk61BUuR3DB1cKoTrd+xS9SQr/HOGJN9m/1vT/RJn?=
 =?us-ascii?Q?EyR3nGdv3pcy9l2dvEKFKde35BEIjDPmXvm9K3thOBoeIPfOvY52ZqL8eXus?=
 =?us-ascii?Q?PqRV7uMYKtG0DwuF0tqJFm4gUmzPH8ZBH69Y4tK7eFAwfXT3t5el434s1rZZ?=
 =?us-ascii?Q?uzEmH55R6nKBNyYtgu4+P4WaVuxGRXDy1AyHe9xopxg6LpdLbLiaGS/y2Xek?=
 =?us-ascii?Q?FFsZgQnCW5Vck75MF0jGiaseQdh8tyqokT1+AaQq5WNCIaX2nLCM1SMBS+Rm?=
 =?us-ascii?Q?vFz5YSwCUjQYbe0UbgGTFGVAvVou/Y0P9ocwAGrGiUQVnTOt7qIwqm/+OF1f?=
 =?us-ascii?Q?0QJgwZixVJeKTGbtkQuFT4Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6206537-8ca0-4249-86ac-08dbce60ea72
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:59:44.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXUti4rUOPFfGm0WApc5H14i8QgUMbqSC+Y+0DRpSGOIV2famQbdJKlq5It+D51LP4xyqS5vW0xVyflIdz3l7eQkpy+fmJuleyVGme93a20W8J+EVxjRxNDxgVMdMBfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 16:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189304

Hi Steve,

I think this is appropriate for backporting to earlier branches.=20
Considering that dunfell supports both old and new syntax, I don't think=20
it matters for that branch.

https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/u=
boot-extlinux-config.bbclass?id=3Db4dd9d873508128adbbf5ff6cf0a3df3d2ffbcf6=
=20
is the URL to the merged commit.

Lemme know how I can help,
Cheers,
Quentin

On 10/5/23 15:39, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>=20
> uboot-extlinux-config allows to specify multiple "labels" (entries in a
> menu, =C3=A0-la grub) and each of them have their own values for some fie=
lds.
> Each "base" variable, e.g. UBOOT_EXTLINUX_FDT can be overridden for each
> label. This is done via the OVERRIDES mechanism based on the label name,
> e.g. UBOOT_EXTLINUX_FDT:linux if linux is a label.
>=20
> However, OVERRIDES doesn't contain the label globally because it's only
> necessary in one task. Therefore, the OVERRIDES itself is modified
> within the task. This means that the sigdata will not be told the
> dependency on UBOOT_EXTLINUX_FDT:linux, because it cannot know about it.
>=20
> For this reason, we need to explicitly specify which variables this task
> depends on via vardeps varflag for the task.
>=20
> This was done in the past, but we missed updating it during the override
> syntax migration so the cache wouldn't get invalidated if someone
> modifies UBOOT_EXTLINUX_FDT:linux from a configuration file or a
> bbappend for example.
>=20
> Let's fix this by migrating it to the new syntax.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> Cc'ing Steve Sakoman for backporting to stable releases:
> - kirkstone
> - mickledore
>=20
> Dunfell should be unnecessary since we support both syntaxes there.
> ---
>   meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/cla=
sses-recipe/uboot-extlinux-config.bbclass
> index 30bbea57de..0413e760bd 100644
> --- a/meta/classes-recipe/uboot-extlinux-config.bbclass
> +++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
> @@ -159,7 +159,7 @@ python do_create_extlinux_config() {
>           bb.fatal('Unable to open %s' % (cfile))
>   }
>   UBOOT_EXTLINUX_VARS =3D "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDT=
DIR FDT KERNEL_ARGS INITRD"
> -do_create_extlinux_config[vardeps] +=3D "${@' '.join(['UBOOT_EXTLINUX_%s=
_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.g=
etVar('UBOOT_EXTLINUX_LABELS').split()])}"
> +do_create_extlinux_config[vardeps] +=3D "${@' '.join(['UBOOT_EXTLINUX_%s=
:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.g=
etVar('UBOOT_EXTLINUX_LABELS').split()])}"
>   do_create_extlinux_config[vardepsexclude] +=3D "OVERRIDES"
>  =20
>   addtask create_extlinux_config before do_install do_deploy after do_com=
pile
>=20
> ---
> base-commit: 2b9044361f2855866eed831f8bdb770f2c7d42dc
> change-id: 20231005-dev-uboot-extlinux-config-sstate-invalidate-c464136a1=
68b
>=20
> Best regards,

