Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E1C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:18:44 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.12108.1705407517399990670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 04:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=w2tZa9Ho;
 spf=pass (domain: navimatix.de, ip: 40.107.241.79, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rwwwl7kVXwfbtyO3zIW8k6U86KGrBw3QiOu/6Rdo9kQ67tBCS/nigQB7Netm+swe9F0IExf/nwgiJ6Wy004bKB0LRtvTJTQ5KQHAOi0pceSgvu/Uk42SeGq107Ff5pZDm2A9Y2IjbjZsncQKUXQxBwbeVoCIXKH8aEA87pw9vxitR7OcFTM50ppbJFLLHKgc3ENxIHE1jQosPAuq7o1Rz/gOR8oXLdb2f4hk3tR2+Q1RaXyMPa0r9YbHns8H6VOVz0deoeUZPAWlURKWqIUZQSSd1oW8SNmL260QWemONCtF33brIPPlWE8no69MCgWLYxUt7wqVkxslY3VdiJNnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixtUx7qlhNqtEvL+lsysDsfD/j9HxH9D4k2cm1Q5Du8=;
 b=YZDDPqs+wGF2bf8yJZ/6A+wMwuLR2y5dnaeY8JFhMlSTAPs3cVMvynFV4ug+rr8/a2bkfLMJc8H0NVdEDN97ga3ZAmsxayxdchiJD+PbebxsiFnJOBHPc66p+3VN/k1SfaMNbQo0MUol/CXj0spg207SS+W5LBhGap4Pqe9+JZX1qztqos2oiz0cW9A00QsQljhw9+lgwAQRUpbDx1vYrZwkTvrtbcFzn4MlX+H3QUjoxG6KVXXpY8FbwArE32LXJ4we/5wiff5m0tYCcQgtLoDm2kxQpRPDhDl2FR2XkzNN6obQKj1iltCFwFWh0sIbDO4J0QFoeaQ/AICIHOf0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixtUx7qlhNqtEvL+lsysDsfD/j9HxH9D4k2cm1Q5Du8=;
 b=w2tZa9Hoyf4ALk0aP8AJ10U6vyhKJ3nIpI2oEHCtO6ScR4GQPkse4gsPuaWGY/4KG9Wt8zSfP+kDjp+7p09nbW5GZdfMlxdfCx6BnuMHZcQQEWCzMEHcoypH/PMcyDiudxJFnOoCZZun4fvQjyXoX8JYSpFm31gW20OCrARfNrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AM0PR01MB6465.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:14a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 12:18:33 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 12:18:32 +0000
Message-ID: <3e5b1b85-eeba-4c5a-9f8f-a491ea1e87a2@navimatix.de>
Date: Tue, 16 Jan 2024 13:18:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Content-Language: en-US, de-DE
To: jamin_lin@aspeedtech.com, openembedded-core@lists.openembedded.org
References: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::19) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AM0PR01MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b785bf-31b2-445e-9396-08dc168d41a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	27mwtX1lmJKorscS8rizn04/YFaJcew59tN/8ru8bSRibpgnNVuhyFg/i9To29jeDlFU3x1Bk1kUIWXxbpvLp4Jzz7KYVB75RV+v+Ty4jj6kPbF1oFUA3/25rR92aitfMBnooc/n8OiKs7koQB3azl6fUke7fTWpQGjT9CB4EsMMVUu2bWyLP0TrDLLBXIyP6/ytT2D8D3zdO8x32oKhMalq9P43ne1NyBCwhIkM5OuQrGnd5FKoJTFzy1Nj2oG+s46xsCFFHtTxZEXz54RVk1CeNKilzlvE/ddFnWcp4uVG8nkl8VHKogzGbsSz+Rs1vQ+ze7cuk+v4FHAMQSP8cSNi1lgZjjRs76I7r40SGv/Vj6NCjziGF5gfkZ95WhMx0KCqkwhlBdwPJGIz7q90puz4SH/cdWQZQVtQx+wR5T3FqTUNJio8254phf5D7Hh0nXNv8hdTASaCGOxHjiO1sc1MTdnCgASFlRdeop1SKeoPE0iOh0T4krVIpIb75Fj8M3ugkFMjGo/bRY/ogb1Wbbh16hQHLXZmEhlHpbNCQOn6f6Kf2Fav7rwHTfjnxjqSJIYtHtfUcFHEtfgnfoDdTu4x1SYF25f3QTydoI6VxR4ahYlcMOYecAHz7gxWsKDN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39840400004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(4744005)(5660300002)(478600001)(86362001)(31696002)(36756003)(6486002)(38100700002)(2616005)(53546011)(6512007)(83380400001)(66574015)(26005)(6666004)(41300700001)(6506007)(316002)(66946007)(66556008)(66476007)(8676002)(8936002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UduXfAFedf9sFgDopLJLAiVbQtgrk34ce+XG2rN1GEZ24R55JRGDCCVBtRYt?=
 =?us-ascii?Q?5ZgiaJp5hkEC60PwXi8KLEnxYei/cnQOT/rUTAdFg4lBlPL/FwXrfy3PNgrs?=
 =?us-ascii?Q?JmH8K4YHyn6qZQaK+CwSm6639g5WJeBzHo3qfXoeo6XzX6JIbCVQqLFMh/Az?=
 =?us-ascii?Q?QmCqZua98M4ILnB97g3qkdcyg3IcmJH9twg17WOhuMW8y7xlD40CDY6mmXsB?=
 =?us-ascii?Q?/7XESYc0rK4C6HADpNmA90fRr4rya/avZajzYWCYIrnwW4R8HoKdQX+sm/yA?=
 =?us-ascii?Q?jAsZBcIBWuFuPkzYsR+JwaAPqGixt8DAJ2BO7XhzgNC1YBWrXTfujd9AsI4V?=
 =?us-ascii?Q?F6SY9CjfKNwfZ5tHli1tJRVsbls0rWeBFMEefXSgZ4JnBLyZjcaqzi+2AJ5O?=
 =?us-ascii?Q?LUzikBTCe8nVZcaV36BMdvTAjr5QNgsWXPSExJ0OH5ObXBQRYkGXUo7OmR1v?=
 =?us-ascii?Q?l3WplYfBYPIY7tQHFSfy6TMMSQ14YZLf8frKeRD3hbk/YthDB/q0oVD+ldoR?=
 =?us-ascii?Q?juDNMa5JteNxqQ0QQWMDWAC1dXkmiC9wmnWdolM0DGVsuPIVISn7AHUTJEkv?=
 =?us-ascii?Q?NdIvZZ659h1fHOH83xb64632ev4t0FAMB5asgZWNhWManGVfpTCNUjKsGYas?=
 =?us-ascii?Q?wVUmOWwYHUMyXQj+SbXxQWGeAv2GIzhf6RTSzaj3VuqqQ2TMNhDanoeklOWD?=
 =?us-ascii?Q?bVoLvZb+3VqwuqT0YVw7BrLgM/vhE9MgbeyCV1RBIc1LxmsBE6GCC262NKCD?=
 =?us-ascii?Q?UqBEtkr0XmbmvAB7aYaBrtrU31oWvsLRyw+FXZYd1UD2BfrMjHH5ReCGgNxH?=
 =?us-ascii?Q?FK5jQ7gv7Ck7Uiay4NRQVoL+F6jvBkd/Dhi8skgEWz0Kt2gNTXQjgpbH0VDJ?=
 =?us-ascii?Q?kG/T3s/XHgEzv5rCKbX+waxXlyFyvVIklyJir6HAj66W6/q0cnsVCJbW8lel?=
 =?us-ascii?Q?Yza9SSx02YQpl2XQvpVR0PXwTCCOmr0iZ278QoI/VVOkbYPbM/AAl8XfkMtN?=
 =?us-ascii?Q?E1KKKT8y+0VJChcgFW6LuoVzOeTl4UoZSvREF0R1PuqXn5FyKpqmGkmLoLfU?=
 =?us-ascii?Q?dLBTIkjkDNexX9R4o44zFC0o1tfx9ixj0/4ayBx/7jMKP1n7WkFs8tjNpfop?=
 =?us-ascii?Q?BtFMziCU/AmyrSUQSiDFGaNvcmcDUSaiXXBdVEyTycF2DX+887DsFltJsqeI?=
 =?us-ascii?Q?BAm0JcI0s3uMKt4Na2h0SwJnMYf6HFCqAt+LjClEcuFlbjzIZ1dHn/5gcJ3j?=
 =?us-ascii?Q?O7y9trSWZAJkJRi/oCwGTxd/AzqT4aHm5jTEAoC5yCuhgBLKiv9iZL+P6vZj?=
 =?us-ascii?Q?vH82U9OGwLBHduEGXvUbrKsirXr1JuB1u3pJPcyG4Gztm+xqNRqFWGoSeJxG?=
 =?us-ascii?Q?KQ34PCbEw/nVhw8e68+T855+OBV4IBAg8OjvssNQayAqybbHmaxZzG1Jg82d?=
 =?us-ascii?Q?X6WjNMQUvfa9TEmlTLHQy4Q2QBUBp7Cd5s/+yIrGDJDzNqUyvHGTVvqvhlKL?=
 =?us-ascii?Q?vonjTvK3ccZapYHB6XenIQsvyuQuszqWh9lHLhpodyJAWcrNC8Cbs3e8mgU6?=
 =?us-ascii?Q?tJHdhSXQntnhFn7wLuqFhNcTRScafxZ/lF7Qwei/Jn7ToTLHBSwENxdkkeVW?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b785bf-31b2-445e-9396-08dc168d41a0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 12:18:32.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joyGTUHJa4anYBDt0zhzjcTw39aB16woMIrbF1QToYe6M3fibp6jWD5C8n6XJIq7MZazPMRT1ZzpYkqh29sYCRmtB4J+J1Hvhc2aA53EOAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 12:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193859

On 15.01.24 08:54, Jamin Lin via lists.openembedded.org wrote:
> Currently, u-boot FIT image only support to load u-boot image.
> To support optee-os and trusted-firmware-a, update ITS file generation
> scripts, so users are able to use u-boot FIT image to load
> u-boot, optee-os and treustred-firmware-a images
>=20
> Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A" to
> enable trusted-firmware-a image and it is disable by default.
>=20
> Add a variable "UBOOT_FIT_OPTEE_OS" to enable optee-os image
> and it is disable by default.
>=20
> The ITS file creation loos like as following.
                        ^^^^

Is here a K missing?


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


