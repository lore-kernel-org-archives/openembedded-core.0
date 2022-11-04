Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940FBC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 09:13:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web12.8994.1667553210885540026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Bry6fBEA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.47, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKHcsWGmPuORIlpmjItKG2Ij4fDo4Jq/YhBJkF2ZYwZzW7pRoMSWBR2AYuaO44S5/sv1lVLODBMK6qr64wKsTg6O4YfYdM3bcA5KDXYMwHxIuLPLw81xusLqdxszRaK0BzQ1uSB+jqgzb1yxC1htuzf/sg0D59MKhz795BjzNWgjN6CVjZ24fy9SqmV/SH3HaKOOoPD74bODSF1EJTJu9dTgcmLl2lbUY0jQVqXCMY4rrHhhPE8mHcFULelXI0l0bvxpjMyU+9mjhn+CKHSKAqN1IEgSqH8VRhHJuDRcajqAUgboSMgT5YorSMZGuSQOXNJ0/QHYhPDgjS/dJHYe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVzH/nvJl0ElERILtOcyPHRHhh6o/rk19ytLRnhBxXU=;
 b=E7aVUPhFTCi5r1HYQKR9BDI/lmxFhL2pBcGokN3H+4FvauJuE2PsHpmROKCNKOgwrnMxFDrBsa9hxdqGiuk8Mpg6SvcvA/WQqCHxYS+t+TJlAUL9B89/XkXFYMI+ZtpJrBjlyppAoNig3vwS545Y/Lh3FDpMZWu51SMQJKkTTcNLZIifdRtJyJEzcMiRefj57pjYwc0H/FFNvemVRkdHjqQ8tqwgwEpSpMVLs9EbxjkViZf+8oOJaMn3xrbl+UtQxbyWIFo2lEilTwy//jpMfnqiga//vHZpHQKt1d5+hmNlDYOChLaHwiNWAE/+HOAZrvYQ8uf5puiY5XEIA1UzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVzH/nvJl0ElERILtOcyPHRHhh6o/rk19ytLRnhBxXU=;
 b=Bry6fBEAIuJaP/j8uxppzXh01hdMdw0Sy4lg7OcQKoe1E8eJocAFjhrR0JwtHgJaQSpTUHbwPkBin6/aY2puBQbIkZUnTXWcqdcOWyeaJ30GpfqiSnvYgCvDwwZr4qA776U8fNcLdKi921D8PzAFwjvd1vMmgMMV94ZQi/T8N5PGpSAGruNJdwRvCTqcZ25FIiPbm7fEKy3zYh0DMGri5D3boNw/WQfuM4Aw0NoHsNkNG2gJ8gr6ob6/xV8axkG7O3H31tmfZNqSJySG3iF3j6HPO6LOUC0WkVqch/ZOd3GtGHAALi2ASBIYt2TTbrFzaPKzYzdAEb6vJ9k1CTiRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 09:13:26 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 09:13:26 +0000
Message-ID: <3ac2df35-d9be-5b2d-1576-38ba5a712d56@theobroma-systems.com>
Date: Fri, 4 Nov 2022 10:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] How to use linux-firmware to install single firmware
 package? #kirkstone
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <CGDd.1667516824130158087.aCkO@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CGDd.1667516824130158087.aCkO@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 99622978-3347-4423-bbfb-08dabe44d4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+PhlzX2DYsVJ0N5ektfptmZDJ2jnn9/2knidpGua9cq/00xY3ltO9ETfzvZd8felxQQ+F44XjbaUewG+IkImeoRLl0gMSKgDPzjyIf0jPTDphyck3nj/yKiPWMDP0HlBmwl1KWbzVu9adI588jrIk4o+AC3EP5SxpW1iM/bjWbObZTbk9TqRjYoSO/pKQk9GejDk5oqY6444cmJeMS4dly0jBUbhb876kEV7F48roSK1L358wF1UyZsRzE6pRzc47ARu3fK+TuPUYLOa1uar1BJQmcbFVlz31L/6x7ZT30kj2iF01z1nYpej866YHyT7kTO997MJarkzwbNxgyQUIFBfOYXSJFFf97ko5IrKai6X99lHich2p3f/kbgeJbu+vTG6dznveUD9V+qmKoXf1PbY6yBIQewp2ARh48Hrjpz6Afqes17PaUe+aEmxt3ViAvpH0XylooD36SbkTa3Naia8CknzAJp7prKNCekP0iogWlXJR+bLpA01/cbEfQQdV0thrcHGTE3l9poI3VYq3dNHoRdmiQ7sheaBO/uZqOTOPOn6+pTn0eM/7yhaSHcY+3CxRFxQDNduMi9J5ZnH2r+tqGs+oIofahJtPfT43pOYphnnz07tK6Y6BdaW7HGoWol5nRz3y4tRjJ/J+BVDpx4TFmuV423mpB2BFwAcj/RZrAxOe/Nse50peCJAz4fC7W+uMKZXegds1MoNO474IOpmtdRPszaRyAxAtGsdMZyFKO+ZT+ahgk0RuFLjQURb3GK0RYxaqLZOm+LUqnMUIvEJqfy2UP2akhJ6TOQhjp4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(39850400004)(376002)(136003)(451199015)(26005)(66556008)(8676002)(66946007)(66476007)(36756003)(186003)(44832011)(2616005)(41300700001)(5660300002)(8936002)(6512007)(6506007)(53546011)(86362001)(31696002)(38100700002)(2906002)(478600001)(6486002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWtKYXpYYUJVQVcyR3JDc2h1a2ZvcmVUUWpoR1hMOEkvUFZUV2NWT1VmS0hK?=
 =?utf-8?B?V3k3dU5Xb0h0bmN6VHBqOWR1UzJWVms0ZzVCeUhXVG9WSW00d05ZSTZ4UzZ1?=
 =?utf-8?B?b24rbzRBSjZpODdyVUdEVkZSZXRvWUJUcVJFZTVpeDBBNmZZc0l3OU1veW13?=
 =?utf-8?B?UnZtWEE5MFlIeGtZUzRTN0kwak9QcXVOb2cwZWI4QjBHUCs2OGluRVVGNWF4?=
 =?utf-8?B?Q1p5VnNyV0dNdzE5cG8zNy90MFRTQVJtSFZPRFFyQXR1cmlZSk5rTFgxalht?=
 =?utf-8?B?QkdmMzN2Mitwc3BjczhZdFpCQVE2cjdjS2hhdEJOOEdLcFBVNmxPL2xnMDBw?=
 =?utf-8?B?eFd6OWlDcFQrR3Y4QUpDN3ZPOG9RRXVSRDJTRVVwSitmeDA0dGdEQThSakdZ?=
 =?utf-8?B?MVFRWndqYVBFNkZCSGVmdUpIeEFYQzdHMFE1WjBhVnlRR1dDS0NHRHBubkd3?=
 =?utf-8?B?bTJ4Ty9nanNEa0tBeVorYkRFNC9kYTlxd1Y4NDZWaU9Fc1dTSEYxSzJwWEhU?=
 =?utf-8?B?VTdsRnZXcFA2RTlKRVBOdXc0UUxlbmQ5eHdwSUpSNkMyK1oxdnBuU2kzNys0?=
 =?utf-8?B?V0VJNUgwNWkyTm1hUGFUdTdxUkx0NWxiYjZCYk1XazJrbnFndk5jYzRQSWg1?=
 =?utf-8?B?QmFWYXpkdW9Gc2RyejhMa1daUFY1UE9lZktiaUtHNDhXc0NHdzV4RDB6OEhu?=
 =?utf-8?B?VkNUMWFjbGRNbkk3Z0JYUW1DQ3drRjhoUE5QZzVoSUlKOWxmQzJ5Vk9EUGht?=
 =?utf-8?B?ZHNUQW02a0FCTlhJSHJEWi9TSTNYNVMvbWx2SmxBWllXcUd4aVowZlhvNFVJ?=
 =?utf-8?B?SEtiUW9pMzlsWkROQWtQMWdUbVJ0ZGp5KzZtckUyRmxMOXNqckRhaTZ2Z2ti?=
 =?utf-8?B?bmRGRlNoVXEzaXZDQjU2OUY1L29STWhYejU5NjZNMmoxSi9kbUVKNTJWUEgx?=
 =?utf-8?B?a3RTZWY1VFhGejRaa1ZQZDdkU3hVVDkvOEZYMzQ1dWpiYTFKK3B3MWNIcWh5?=
 =?utf-8?B?RjNxWnFrOWRHek96RjQwUy9ocFV6MzRYVDZyVGx2SDM5MngyS0lxaG53OUpt?=
 =?utf-8?B?WkdhTFB3RmRQMkVwSjRmTllKR0g3OXV1Sm1yUlhYajJRL1FnK0hpaW16K2oy?=
 =?utf-8?B?TldsOGFNV0plMm10cjBtQkZ6MkRlYmgySmVoVFRITCtXRDk0UTRjWC9GNzY1?=
 =?utf-8?B?WlI5VC82STFETnBIMTFGV2lEMDV3ZEtMU1UrVzZqUjNxUWtTRTRKd3gxb2tJ?=
 =?utf-8?B?V3k3RUNFblFaUHBvSUFhWEw3UkdFTHFFYjloTGtsdFAyY1VvM3ZiNUpacm5t?=
 =?utf-8?B?U053WHAzWU5lNy9zSWUvWmFKWngwUmgvVUV1WUNDelB0Z3U5ZUlMbDNxZ3RB?=
 =?utf-8?B?bGQrQUNKVExROEM1NkRMeEFqNGh6c2VQRTVjSHB3WjMrS3FYNnhVc21MMlc1?=
 =?utf-8?B?a2NpYUFSbGFMSjNKZWtoaEJ1N0drUXBiTlhJeWxMZWcwZnQ4bnMyWWlWRGxV?=
 =?utf-8?B?L3RwSkl4VVN5MHpPaWc5YWdIdjZtZEVJdlNDYnlBTlJCQmw1aldvaGFsdytU?=
 =?utf-8?B?cGRHZXBRWjFyQ0dOOUFaaTF5OGdHNnJDaFoxMlppUDBSODU0QlJxUXJ4bm5F?=
 =?utf-8?B?dmxVcDZ1aWpGd1RON2hGK3h4elgwVVVsci9pUzF2ZGJxMWJsa2JacVVYN2dz?=
 =?utf-8?B?MEtEeGU3VDl1Qzc0R29UU3F4ZHVCQnpFc3EraGkvSXFuVXUyeHZldGU3YWJo?=
 =?utf-8?B?cnBKc1JWSzVYd1A0ZjlFU2ljSy82K3I5T25KTmszZUQvZTJtYjNUUUdXZFBv?=
 =?utf-8?B?NWdURXdUSW1hQzIyWjNqQnMyK0IydVJhVWNOMjU5NUFSdldrU2xIL25ybzhI?=
 =?utf-8?B?MXFxRVUydHNodTVVZkErZGd3MlFsT1hjNlZPcGlGQ0hvOWNubzJiU3hUU29v?=
 =?utf-8?B?WSsvYVp0b1RLa1hsb3E3c3RBSC90a2hzcGFFNElnYVhQak9XTkVwTVRwQ1Jv?=
 =?utf-8?B?cUFIeFlrK1MzUEdiejMvRGdkSG03ZEJhSnpERkpiUzhHOEV4TlhrVE5VQ0FH?=
 =?utf-8?B?cHFyQWZ2cnVNOEszVWVNWWVGNVFKV3g0NVJTZEpKQmNEVmRwcEdLQ2dCTE1u?=
 =?utf-8?B?d2VoNHVURW50NU4zMEJROHNvbTNUOVZySjlBcjY4NGx2NUxabllRZi9XNURF?=
 =?utf-8?Q?qu1HEk7U+EfoVkjAKKGJSYo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99622978-3347-4423-bbfb-08dabe44d4cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 09:13:26.5877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEd8nPAqiWexBN8nSvoBxALc6WFuPnFl97Mj3of0Zu1MxbPbQndWg6J+jZgprPG1tbvzABH7YWXi5yAcfdEZIiwrVC/ctuccwZj+5B5M2RbksGvaL83X8pfxqa9FgJPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 09:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172704

Hi Livius,

On 11/4/22 00:07, Livius wrote:
> Hi,
> 
> I would like to install linux-firmware-ath10k and linux-firmware-imx-sdma-imx7d firmware package to my image recipe in kirkstone release but when i append them to IMAGE_INSTALL somewhy each pack from linux-firmware recipe installs itself. It is extramly large in size about 500 MB, it is totaly not accaptable for me, it is too large.
> 
> I am using the following syntax to install them:
> 
> IMAGE_INSTALL:append = " linux-firmware-imx-sdma-imx7d linux-firmware-ath10k"
> 

This seems correct to me.

> If i remove them, there are no any linux-firmware in my deployed image, it means somehow they trigger to install the full linux-firmware pack, how can i use it to install only some single linux-firmware?
> 

There might be an issue somewhere, we need to debug this. Can you 
reproduce this with only poky?

Which version of oe-core/yocto are you using?

Can you run bitbake -g <your-image>? Check that only your 
linux-firmwasre packages are installed in the image. You can also check 
that the linux-firmware packages don't contain more files than they 
should (either look into the .rpm/.deb/.ipk packages in tmp/deploy or in 
WORKDIR/packages/ of linux-firmware). Also look at the .dot files with 
your favorite text editor and check what does linux-firmware-ath10k 
bring in as a dependency, maybe there's a bad dependency somewhere that 
brings some other packages in.

Cheers,
Quentin

