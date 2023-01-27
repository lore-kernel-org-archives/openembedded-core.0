Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F9FC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:10:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.101493.1674825043425313598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=JyWhC8j0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.82, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUTIdPN9kYP8pLYUxePr21In2TB6oegWBiChBMgu0hatODc/rWBd1EW4osfbeAtX+VJclDwZyOl9LCzKpT3ug3wNqm/ZzezyE2P6ae4q7kIkDvnPBY+lNf4scZFc/DuadsMRVQSYaUfy9AJwEj9Vm8AhlS0YQhsTlLWd6bxIhmbzavD1VF3Bh53tJecywGtE715RkboxfRWnNA9NMcsrKQgD3Dh91yNLc7yw8rxr5NxCpvsY7asIFoMyF4UEIP0Fo2ZOZO0ERjKnjG9105tA2zlaO1P3BokRgFZRlBuWS+GKT7jFlyAjCPzWVDsWvOlt5f2f0BcVAKFas84YbCV33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t52wZqi+QfNgeSaHsFfu+9ZtEmRt6ma2youWaQzdgR8=;
 b=aAaG7pX+Z0Pa3bXhXnxeo+LT4mac2xM6bztlsE2pN/ENviHDxokm+MDL4j43s+uAE/sROo/LfslhyqcoBjQl4Z9oVmBnsWtkknWVej4mKl7j1w6X4xWaVmwrnHNIs1azHzTXsj+Q2ntnquV7n2QEtT7U2a9NS10G1p+8iRRPiOxV/RA/8SbYEHou8GIws86BFeDcjExZmICJkWewdBzJxYx+S3IAThkfKdgcuKVYReSNsEWLYfWWF5iK4kKoK7peD5m9ZeYJPeqpJZmfAzRJm8ZRuTxlZI9aN5PdxbnUC6SSgbb+6IL8Y4qa3Ex5EwP8W2YdWs+okSIa7TmAKhScgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t52wZqi+QfNgeSaHsFfu+9ZtEmRt6ma2youWaQzdgR8=;
 b=JyWhC8j0tpivOUFxCrT90Lw+Tl0ApAKKK4R1DP+fFKwpQJ0oD86GBu0hKeF4jhWXKBGS+5laB3AyWH3QItMYCm7PorIMxsVtwO1N12DZDis1v/AzISNmXCBVJkxwUyZhQQFjN865tjXZ7Uy6qvlS1JCbZ8w6nMt7e1pD9LwywuAzegzrz4SlPSRZmdiG4J6ddWiJ45HgDFPmtKmKtByQYWyCMz6XSkIcDGwQfOOPc/IGgukqCDv2JWbl+PabgtitmC7DWnndsn1YNswcQp3uqL2EAHWbWNkCKPnoYU/uZm+mt2VpUIOcHdLueCJ4pBkaS3Gy8uJd0VYpn4rDdNyCCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS1PR04MB9681.eurprd04.prod.outlook.com (2603:10a6:20b:480::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 13:10:39 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%6]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 13:10:39 +0000
Message-ID: <c3846028-0d1a-981c-003c-c1ebb49a0f9a@theobroma-systems.com>
Date: Fri, 27 Jan 2023 14:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] Use zImage instead of linux.bin in fitImage
Content-Language: en-US
To: dowens@precisionplanting.com, openembedded-core@lists.openembedded.org
References: <SptN.1674667491903478336.gAIC@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <SptN.1674667491903478336.gAIC@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0182.eurprd09.prod.outlook.com
 (2603:10a6:800:120::36) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS1PR04MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: df19c83b-1557-4318-aa9f-08db0067e2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KvpS1Z2D9ORfvd6l32DzgKfrQsl4sP4avi0VOUvEF36/Pz4RJ0T/X08NxSQU/PU61ZW+MgI9ewsA9aPEXbrtKal+nhdG1pf0erRVCSpCyWtGaJvzrfiE3z0LoTEQ2inENBqmDD36Rvkkx4hbcc4rnx3JcAmny2N3bJQc5ItoQ2GvKPJSR+a5b5vmaiYoOmccYuFcfdjr0OyX05fDAg4AUNuZCZBya37qjPsdxOHiNeCIz075I+ydDl8TmgzwH0TI2VajQPEe33Pkz+nPUYQDv+SLV0yuFxOFzEmiiEzKgLN0c9L5Vq0KZoKOoDRVKXsoAYoAECmRjrTFW5o3DIEuWCuIlbhRJTHlJGhDrAKbXrrNqpcw+sU8miBKcnFVfyqYigADfMGw8sYAT1z4duWqCJlSPKayjhwLaLXRM+VIYa2e//Fu2VR0gaZ2kVF+jgeGWB3Iv62wEVa/UxnYzVoDDihJAV3ICdc2m6dgcutBPqGLq211l6ihfb06PdqSwSwOPHwo6JAvR0Q3fduGFDkma1rbxhMxsjspSMFaP1qHDfO/jA+0m0ixO/jRgTjU1UZzYD17QaItpykDMNghaXaoI1YtR7mNg18pblXaVLLv0ub/veFjL7JSG00vGHNKYBK+aeha+A622sdWxnkcKxbwLx+1bBC8m+8F9edGiliyelEkCBvspzf82LmMs7Niz57/D7NPFW/1yfO3u3n9+HOXrSuPgByZSgPlPmoZ6Yx/YGPYCMBN8PHKOLWDywx12yS7QmRG1ryocBo1yoCWm8nMIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(451199018)(31686004)(2906002)(316002)(86362001)(31696002)(36756003)(66476007)(66946007)(44832011)(66556008)(41300700001)(8676002)(6486002)(26005)(966005)(478600001)(6506007)(38100700002)(8936002)(5660300002)(6512007)(186003)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nMaTvb5BmCDsoEv/HU+fGTQ4Epctpp+CD9/4Kg9JKuz5urDidn7Xl4kL7yeY?=
 =?us-ascii?Q?QuZdyUkRd8kPnFATukxYuY+49MHNcOmbpaAfPU+z3mDZ3le85abROyxGYZvy?=
 =?us-ascii?Q?6kuu09eRrpXBl61qmSJQ4EB2G1YrM+KuSzAQ1uSQS/xxGNCkePbb0dxuM0rV?=
 =?us-ascii?Q?/1M3QqkQAUX7CTI1pl5abGw0p2Ga6C6co7GXetOXYo48UOUlP6U2UBpkuORB?=
 =?us-ascii?Q?UKENWvOdIw6O5+Mtr3kElGrv0N7Zn29179/iP4CxKp+BjpxWlW28Qx8F7pJ7?=
 =?us-ascii?Q?EsIew1syEr5AfJ0eCQfhuFKfAPlCWT/l73AgY7/xovQzvL+SmnKOv0IZysnW?=
 =?us-ascii?Q?G/PljHPwWmRU9Rs6QiTy837jk3y8rMX2+mV08M8UNCWecafXgHhCfzCGpwIV?=
 =?us-ascii?Q?1Zj6FNXLfHaQPtW067hROqfCd4f5uSztP+Jt/EtbEmz4RhlHb4WRi675VG/6?=
 =?us-ascii?Q?gtJ3+D6ChtUQxA74bVYfNOvMQT/gucnj4n0FRnABvFYaiwCTgupxqV5SxG2w?=
 =?us-ascii?Q?v6uYZi6Da/pBfBCxIM9DOkv8RPdE4HYY2brfLA6B6+zWqXVWC1lD6XbSJHd4?=
 =?us-ascii?Q?rOC1iWe0dWmr57dx9lAn9E7aia69N2yyh3Xe/AUaCdcDczH0nKyxNYBISvmn?=
 =?us-ascii?Q?ksZ/0EHnbTR/svgNplTU+FSP1OC5r+h9xUC4OiT+XaSNvii+FaDVP0QQwzuP?=
 =?us-ascii?Q?3IAU49oC19AteyoF81Yq06YtaQCeXli/0n44P7bZ9fC0kwKx9Lh1xJ1fpOql?=
 =?us-ascii?Q?zYTaGSZyxBipjKKA8H5PIBtXm/VfsUWhoisFzLZjQsvNo3aVOtXObhh5GLo3?=
 =?us-ascii?Q?MMPB3Q4AQjm08tSjPDCTEi8YzfpHw/n7XSpEyszQjYXyt/pR5xI1BMClHBR1?=
 =?us-ascii?Q?WQfUFy0bUt8alb55uGOtiuh6nttwy6MGgqgvm2s6J/F0ZZlpazNL6WaCf6Jc?=
 =?us-ascii?Q?h/FTJHB0tat/DTklSgzj9jYjYJeFJIvRiV5oZtXWTAvv1WgbOsWrrxhnwhsn?=
 =?us-ascii?Q?LVGrxknlsjfKQj/1jyFtbQGpUOSH6NkZZyviz4ahtb04k17FAcdD42R5im/e?=
 =?us-ascii?Q?IE0xgn9P7kitV5I/VO4oCPgysP0lN8QRPYjz9NqmoZB8CYm6fCKGJQXiUVSD?=
 =?us-ascii?Q?yXOCm/Lj2eBW8LwVjMGBgGDM/ljPtje6EO6IxumK0hBBy4cFV2JDzJeBcg5U?=
 =?us-ascii?Q?vvChKe8zP2Hr9RU0HCX7rqldepLaR1rgy8EZpoSptWpv61Hc55WPi8yltlnE?=
 =?us-ascii?Q?dh//+kCTEvoV4csIXYaVmuEDEkBWBuq1W4SlPItAAwL0u0MXDQ2+9aGMONGH?=
 =?us-ascii?Q?/ObTtM6Swpanu40SKF2wTglOZSFsv8oN4WsfV1CzStOfZ0uXvYB8+thtjMnK?=
 =?us-ascii?Q?QlFmw4UMOxOXxLd6GiXaEdSfTyprlbTA4N9Tx0WRP3duxSLSO/TlcI+nX/Ew?=
 =?us-ascii?Q?y+wRf/9EOZo4pOnHa559EGw2M5efN37W/hL4hTUJLWtOWKVfzLU/HEV/n3IG?=
 =?us-ascii?Q?wCdfDTr/8ucl02dMW5yiNmZWPklsDIzmBonoPFVppFYamWUTp0Jglmufm045?=
 =?us-ascii?Q?Et/ozA3TEUWGqzcWuJocX3jgMr0ULuznKj13Mj7qxFdZbKWBLR4sWVVxBtAB?=
 =?us-ascii?Q?Q4X3/I1SYYy9EFYF+1Blk4BjxyibC21Qmz2UEls61ZME?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df19c83b-1557-4318-aa9f-08db0067e2f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:10:39.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiHJbqbvVAV+Sj/21tvJ5KfWHo+w2yazl4Ex3kHQAql8wFxoomDtIqTJxcEF7oBeerK6NYsSK1fP4sWjEIxOiCrHCSk1Me4gVc69J4rBmqqog9XAIwHzCzsoS9MFj+qP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 13:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176443

Hi Dave,

On 1/25/23 18:24, dowens via lists.openembedded.org wrote:
> I'm trying to build a fit image for an ARM target and am struggling to co=
nfigure kernel-fitimage in such a way that it includes zImage as the fitIma=
ge kernel instead of linux.bin.=C2=A0 zImage is significantly smaller than =
linux.bin and can be used on my system without needing to modify u-boot's=
=C2=A0CONFIG_SYS_BOOTM_LEN due to the large kernel size.
>=20
> I've tried several permutations of the following settings in my machine.c=
onf file without success:
> KERNEL_CLASSES +=3D "kernel-fitimage"
> KERNEL_IMAGETYPE =3D "fitImage"
> KERNEL_IMAGETYPES +=3D "zImage"
> KERNEL_IMAGETYPE_REPLACEMENT =3D "zImage"
>=20
> I've also tried patterning my config on oe-core/meta/lib/oeqa/selftest/ca=
ses/fitimage.py which uses several combinations of the settings above.=C2=
=A0 In every case, linux.bin is the kernel included in the resulting fitIma=
ge.=C2=A0 Is there some combination of settings that will enable zImage in =
my fit image?
>=20

I believe the issue is this line here:
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ker=
nel-fitimage.bbclass#n572

I would naively suggest to replace linux.bin with=20
${KERNEL_IMAGETYPE_REPLACEMENT} and see where this leads you?

Cheers,
Quentin

