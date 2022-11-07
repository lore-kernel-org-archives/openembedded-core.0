Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0930AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 13:03:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web12.2942.1667826203695875730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 05:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=IwqyCf+U;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.57, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLocC/x0xwZLPz4JMvkmDAu5Gtd98hxlE2zaLD+e0jMuAIXAzDcksFDEqzOzODWP4U9ZJ6l5SK56owNfFjnKBxjivMKewsha6qA5lHxHzcvW5/wKefVnwSOeWRNZCxmsPetT1xTvS9QUor6SxPGKhgWN6X98sm3ikY8I1rcKWM1gjA4KB3mVF+K6qAJuJ9+qxUofTsUS881tJM9ZNPgTdD6tAMrTWg8GeIJvFOBU2oQ+DyEBgiJ0FbyVh/vtOq2YledZjUg59Yh90q8bwOM5TsDONgUf/9SkvQx0CgX0asPMr04TgK1g1HZR0rxcr1rI+Nlvc2kF3E6zMmbTqkVTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMEbic6LjPNCwy2InXw2wLoGdbhy2vg/hNMu8y5aLUo=;
 b=VGxcdCCtlCF8AqmzzWsGjaPn5w7M97ZknCVXDYgyIS7ZjUeVuq4rH5ms0L0fmmCXzobNaGmB7d3nag11i+KIaATf6lpiIfZapzcylXFNPmNPLYbWwOnHDWVJvoOwa08+0Ag9c3YNifz4e/XuP6dYRIz8JyYvHs//hHG5dFCTdAOQPEA5dFWFBvQMFsVnF9Vg4XtdGD6yKz0Asei2vawXNxxHw46uT8L8LhIyibUA6KD9JvEchRERZ8dZwBHlq35726NYIcDQP7XhKT8ao9G4vuNQuFw8qiCMpUf7gN+FOH0PcLNqihTfhzxi7j0e3kr6CIPRu+xhkLApda415D17oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMEbic6LjPNCwy2InXw2wLoGdbhy2vg/hNMu8y5aLUo=;
 b=IwqyCf+UaO9DJa9u1WZ7pFJRM0XoRMYe6cDTulXs2ew3iLVDp9vD/FhzawQVdTfVMjehYnJugBkiIUfz5lNT372GLi0wT+vWUeiCu5QBNJ7wju68RFaKH1gJxvnJSiZI2idDlGqhEBNiPan8xUOSDy8BQvTmaG3NjPrGQNF1J+K+r4npzNX+83FlmdG4R4doWGw5apsqaHLjGBVxl/iDLr4QUKr424lBFdWynq0ibultlbKym8+RFk7EOMd/AvU9cA6bZKdc/KoxbsB6fKX3woaod8fXFWQjGkoFvHf5X3gHs6+sBniPJdDZxwjrsXWC1PlW/ZGOvLzdaTzg81wAcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 13:03:20 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 13:03:20 +0000
Message-ID: <b837d8d6-ec68-823d-88f8-5bdb05c67ad9@theobroma-systems.com>
Date: Mon, 7 Nov 2022 14:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] How to use linux-firmware to install single firmware
 package? #kirkstone
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <27593.1667581724503766480@lists.openembedded.org>
 <32673.1667587483969030362@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <32673.1667587483969030362@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0058.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 27081cd7-5d2a-4be9-8992-08dac0c071ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+c9lR9tdntiBODQ4/fZyZZz1kInObBplZM7xoe3DLTqNXbTGOPrAr2M63mxjYNkLqe1kVoKuOrgXQ+27Z1TWcfs+LH8NQ2DkDf93OO4onwW5JYheNA+F/JmaLJVAo+GmqqtEZEggTXny3GNPI6tYorPKCqyWvSoO7pCFU5gTdipZANWm98msMrd8ag66c/PKDVS8/OjOvj2VtI96cIksWu01ue7FTjfyuWMdJLGTP9XSotkGBNCYzhReU1sUNgvQ7NToL0KsKy31N73WWEYtxRP+DuBJHQb3OnZEr8sn6kiVf5k0wvBxaLbn0hayqu8NRwCTdsCIzXTVSLP39YIX5VFASKW8leA/6Xzjz+NnE8q6VfI/KqOEqWcYA7aVJx/thsPMjp3MteH20Az++Os38ddkAuo4E1hDUI96M4ZrmFy6eMJq+a/6i64fNWiIDKqGhQJFT4sI6MjbUz+N021HUp8sOa2Gj1AvlO2lUQiqgQlNk+zOToqJQDGfEiuYN26LUd2zn7Qz5G62BgSJrFA3lpChb3yp9QotsA+UDuqQUVboZAcFGRNtRNjEMtnjxi9kkOxRzvRr7Ap4a9UvwwjeSo2ingNvx+nWlhZup97YXj1TPdc+IDvEPVvngO3Mn8W2ZhIk/ZY+1ArrKTj+uT4x1KCmCvdGxFNh9MFX/1MeApA0xzKOlV+IhoOzR+drtSS4Oq+Op65B1ELlQMoWI+gCMPtJmyuLAuPU6H757efjEfuvvqhnCLYP8zCWp8WecArfNkC5cLPuTciPfxyvStMH6QmL9VHnMdkV5AJAf73HLC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199015)(26005)(6512007)(2616005)(6506007)(53546011)(186003)(44832011)(4744005)(2906002)(8676002)(478600001)(38100700002)(6486002)(41300700001)(5660300002)(8936002)(316002)(66946007)(66556008)(66476007)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kniMokZ1kgqqniHWxNB9IprJvBGhxnkUdv8RXRUCD8wHMY19sfw2r0x5WxSw?=
 =?us-ascii?Q?UBB8loIx0vzUNtQqRspFsiTjuMkaZH9L03FI4QAXU9H3p5D9XSn1raxTPbvO?=
 =?us-ascii?Q?TBzaIYRXyBKKR5/xdCoSz67oRDRzevCJajKpx4LeS+dSa4rQgC/tnbNXrtUQ?=
 =?us-ascii?Q?1ONLbMnHEk6GWpy7JxkGVn466xP6aXE4eAvLExhQfXFbNCPQWHV6CswoUPIV?=
 =?us-ascii?Q?lPvxkz67NL8FGfONBJ8I/vL7wgQ/PhWw5jH0wFOZfvBhsXoPOrhwGS4FVxFe?=
 =?us-ascii?Q?7iYorbkUoIjaGEty4KlI0Tage/7q/NkF+DBGYnGTRk/1Mf8lAQPOCeR6MeUu?=
 =?us-ascii?Q?ysTwFqHRfRNg5OAQD1S9hTxLAZKbhMRKPaBsXoJCZfShn00WqkQKYuimTBmM?=
 =?us-ascii?Q?DWsfWtB0XOxseL7jzzVKlF0NvUN6Whf+Hd0k0QCHIlEqgx8OZCcE6P1/LAsD?=
 =?us-ascii?Q?0BoHwuhvFiCpKjyzRorQj0JizxFLLRAClYgToMSPNvBULraX5FJmkVP3Y+aT?=
 =?us-ascii?Q?EulDupqlFFX4hOouphDqdLV5u2TjGJ5EQ2Mh5dpy475KPgys5ZkWgWNfFlLP?=
 =?us-ascii?Q?jLZvSPRRElMpaPLNJYuFfCjVbfQwiRJTi+4A/ewKHy21Qvqb0R2DLTEEEw5g?=
 =?us-ascii?Q?QSUg3IdHXqxworKQckWlMqldCFFhw/QUUWMA+oq+RIfWRGoEjYSaegS1Ho96?=
 =?us-ascii?Q?4TNb7+x3fWBSpo5KgUliKne5V4eeudDztMKJ/o7I9As9v/Z+ySkC1cBfZ1hR?=
 =?us-ascii?Q?y/6G9i23dDxMMruT3r5bGjr0tiTBHpRO7IjoCZIcZuL6CaxSSy4c3C9v0gqF?=
 =?us-ascii?Q?wIA0jD48LR0E2KdY2ILAQ9L7grb9vtMt0N6YUgdrKX3pZ25vIjguXvlea0xX?=
 =?us-ascii?Q?pKML7Zux6czRbf8jqNFmUxPEL083MBWq4W/K8wXVxEFeNXn0pJJeWHTch+6A?=
 =?us-ascii?Q?w0rewccxwHOALj2qblvz8ZJ+KxH3ChHq1rizb4bVJiwcdtzLYnb4q6t0SPXp?=
 =?us-ascii?Q?Dk6QInZSvY84f+3WxIEUL5aWI2gnwiqa62mbnkoUuXyy5NvHl4eU5zRyKIez?=
 =?us-ascii?Q?s5s1mJ+J8OoOjJ3gMW8OM3qdGg37NDnqJy2sea89Iwx6Rr9ahWcSKYhUBrDQ?=
 =?us-ascii?Q?MkrRAAgLrgDzSrT+j4wZQfwbmBXyn0sZ+9tLGNhc+EKWlyQG9UpUx0IzKtWw?=
 =?us-ascii?Q?3qje3ARPU3rZ6mymHm+mgrOUOA7vC5PWUl62ui6w5MKvLhgiqlxJ3iHDO9am?=
 =?us-ascii?Q?rPUg09AsO9ePmmKRQEr8Zy5xWHtZRm+m4b+I8RqhvwdlFMQXqVkV/DChO2a+?=
 =?us-ascii?Q?p5B8oMdkOacjuNE7DYZJgWVahgVRgaKNzP2/8WrP/wqUQiSodPBZJeD+7pRs?=
 =?us-ascii?Q?RUpYhgZ1qco94qk9Mj3wGKZzAoVDVZSKI8QGQ23zLGgGxyFjcq2nUXgTGKOa?=
 =?us-ascii?Q?b6CRutSe8zPcn2/SfPqr5pOkniHrbFveOzIcfT38ggLLvC8y55zVq9san5EP?=
 =?us-ascii?Q?uCeDtp54CIPXEUsKP9TjGLliY8Pi/6Uh2v56dDqbcTn2dZkNR5ilqwpxrQGZ?=
 =?us-ascii?Q?x9NPqoneuG9xIrUUKMceF22ZRaTsvu9UNW6b7R5zj1Bl1fxJIL7OIp+eScTR?=
 =?us-ascii?Q?qJPP6F9FpUx8f1zzJXOSMuM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27081cd7-5d2a-4be9-8992-08dac0c071ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 13:03:20.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzeh+mDXEr1YrdXUTX4H2lGJG2g6b26F7RQEGSYbsBIfyaCUlU2OKst1knfBN8Px1tX0VNTD+Qjsjl30YTntJhf63MtysxqGnemi1xADIwR3m7qCvnjEzXClzD+DZ+0v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 13:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172840

Hi,

On 11/4/22 19:44, Livius wrote:
> What should i check in=C2=A0buildhistory? In my buildhistory=C2=A0folder=
=C2=A0linux-firmware folder contains all packages as a subfolders, like was=
 in my=C2=A0tmp/deploy/rpm/noarch. Following content is in my=C2=A0linux-fi=
rmware/linux-firmware-imx-sdma-imx7d/latest text file.
>=20
> PE =3D 1
> PV =3D 20220913
> PR =3D r0
> RPROVIDES =3D
> RDEPENDS =3D linux-firmware-imx-sdma-license
> RRECOMMENDS =3D
> PKGSIZE =3D 2862
> FILES =3D /lib/firmware/imx/sdma/sdma-imx7d.bin
> FILELIST =3D /lib/firmware/imx/sdma/sdma-imx7d.bin
>=20

The installed-packages.txt would probably list all linux-firmware=20
packages I assume?

Could you also check the=20
linux-firmware/linux-firmware-imx-sdma-license/latest text file and tell=20
us what it contains? Because the content of=20
linux-firmware/linux-firmware-imx-sdma-imx7d/latest seems to be fine.

Cheers,
Quentin

