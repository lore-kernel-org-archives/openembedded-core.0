Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D101AC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 23:36:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.100])
 by mx.groups.io with SMTP id smtpd.web11.1148.1740440194085066886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 15:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=P2nz8wsR;
 spf=pass (domain: navimatix.de, ip: 40.107.159.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDOaXm1EL2DwJkIonrVHE7dwKYG5cuugUVge1zvzRrDw5uiVbPnFu+WjcnAwehB/+J24SUdZ5bMNOdNH0Oygbh/+X4+GeuA1qy5a5p6eME4/nsEiUvNvrcFzVOIQ/847jIF+f5qWptI8N0gf3SPn+OArFmNunLsZAHqtfWELGl4Z9ff4HP+nJWL6Uzw6yJgA0dz/9I22T8sz3OSsL8oW+G+9mp0sHk+HtUAt8Yrl8lust2mD1NWOtUxZtLiq0sDSQRtV/ogSy9wxbKQdeQVGuT8PEWnLRyEFBTUIUqqi+GZt9zSLasONUABrv78Y2OPv83a+RqVIUtXfG+CjPQttFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzd1OAAn1psfTQKB9zvPJG/HRTlHnAGa92zx6E3gr60=;
 b=IFXzZQSEtwaopQMU/YrRBgJS+Ur92k/23ugyqcuKo09q1t98UtT6I1SEtbMCKt/dWR+7ePEugqMmm7QAd5RCrQgUjy0C6hQYuvX/zpOqm21QfUqDxi4cVQmn+2Xe/VdqdYpLUJB/Ntub/SSsfFPamAKiq5NYNfhMtTw0+OamSab+A7aHxhvZv+EVvKgL+slOJxO0t30jbaxrGZ45HPvOR9uck4/IEixYSrEoV2dAWiqv6Fi9TfsVT+ppqgkikGSgKjjmsz+A3AK4Hom78XW0aLkMfaOPywYJ3LG72ZJ5SmU8yBqR0DpT7UMczBvcDgz7V8OZqXZphQNE0PNL7BEDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzd1OAAn1psfTQKB9zvPJG/HRTlHnAGa92zx6E3gr60=;
 b=P2nz8wsRcHAxXwQWbEPE5z/+hvQ7omDACiwBz2Qxrx5V0XCFGKjLfDiPWWOHsH249U2NwWdb+NXQ6AWrqkiS+adtw2t/bg5Sssos4iVj5+EzzftfzUHMj5PbWDh314kB90RAxZssgfQr/hpchy5B1H/yBgYNmf8L2M6W48qCGVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PA4PR01MB7215.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 23:36:29 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 23:36:29 +0000
Date: Tue, 25 Feb 2025 00:36:26 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: changqing.li@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
Message-ID: <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250220035724.1460062-1-changqing.li@windriver.com>
X-ClientProxiedBy: BE1P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PA4PR01MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fefcb75-e0f4-471a-f0e1-08dd552c0fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HsE6PKQMGnyup2blEWmgErFC349ygInJ26VJmRYQZET7QBEZ+HjFS3xGGsI+?=
 =?us-ascii?Q?UBLv8HF7wbee28rJs9zeyYwdIUXSsU6vX+VE9iseB26nzU+YZp6cEjz7RE4F?=
 =?us-ascii?Q?lZzN7OglvOTSS9KNNskwF/KKF2uvCOcE694Gi7l58HlX9pRBq8gUzIn5sNZn?=
 =?us-ascii?Q?DuaCgKhJI9ytG/h9WbZjlvl0q2k8upl6/kJ8/jNEfyvKKqbPNCOq//Typ85w?=
 =?us-ascii?Q?dmLj2BfgZOsgVrNy38Yg9EBedKwLIbITggqpEu5WXHO6PUdgpSEuwmx4ww+N?=
 =?us-ascii?Q?XSbJ5jBwgoP9Jrhx6z0whHJAIrbyOyN39WkVScEm9O1EWj/lhq+CoLRmNgFD?=
 =?us-ascii?Q?3OiB38jIuiaT8RC7A5pcz5JjHskWOcjT3nBmI562hJ44/6Y13U9eWRBtPKuq?=
 =?us-ascii?Q?UqRamMnwp0mzCnsgnkJSjX9xGtxIkGPpP6K4WpHTj/KQh0T62kJxCM8emjZ8?=
 =?us-ascii?Q?2ZCT5nubV9k7G8J074Zzfu6AdhwCd8v4k0GWfVTkZZYC+k5iHRS36nYam8/2?=
 =?us-ascii?Q?wzxEvHInvl5coWN+WwjfF28aqDw/73Kft0qtC3D00ewSOiN2auy425jh1j+T?=
 =?us-ascii?Q?8rXAxvIetnyq3+kUPS5ty7W8GFP0aRogqzzEwtFxMN7V6IE1YzmkjR+cq9fV?=
 =?us-ascii?Q?2LYjRhhy6ZWw/NlMQrMU4MRmtNXadTjikRO0of0pJbhRG+bUmJCsRl06PAV4?=
 =?us-ascii?Q?nRRm3ckI12ghAkJMJvGNYavHhD3stbU2Y/kIU1rHbYGx4SsKCcv1/IyixYyK?=
 =?us-ascii?Q?U3ZdoH9SK9lHQj1PVU+MZaflCWKl9zPOT/OX7DPidyaA/yZPQZNO2fj29u0p?=
 =?us-ascii?Q?0WEy3cuimEfNXsEUbVrwUflwyrizbjfOmPpd/1EIgHmlB2yHUf5MdYo/HU1F?=
 =?us-ascii?Q?p73/ftnHMFZTLfFUyM8vSs3bcvMxQK4sb24sdkr2vQLyE0LlQ7hnwL0FhoCq?=
 =?us-ascii?Q?Sqp0GviJYQ8UaGsRX+mFjwUW/QVg1QwjcbzI/6mFQjGR0eHtKetQEEEnc7Px?=
 =?us-ascii?Q?pLrcNag0rJ9zcSS48iuV1sDBGi1MZ3N7GAz7B977HS8R6Woot+Fa3vmEzGiU?=
 =?us-ascii?Q?MVOpBZCBE2rPOwd6C2nSUYoMOaEYonyP9X0H9oK7boK8thSO4JA5L6oth3al?=
 =?us-ascii?Q?mNoOP/ka/3PtxZvJ/g33uWCv0FUft/uXk/xV704hUHiis5KnDN2LeDO31Jgx?=
 =?us-ascii?Q?YSLK+ybpFuxvi2Zb3O4w+mnT954GgSXZpqLbhwx5H214+GI3PXyP5AzDNvr8?=
 =?us-ascii?Q?W4eIt3aXJBcXyCKtksXmj4+UJK8FB3DWkEcvXXGymVxXCmBnGJ5ZsQtgw0mU?=
 =?us-ascii?Q?KeKWcA+I0eYzgi5sTu1yl3+3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pN1ih9k+TOWXBBsfRGgRkpRQRDfM5Q98sSUol0p2Z1BhQv9EP6bouo2VKvZk?=
 =?us-ascii?Q?1zLl1ltOeXawsCLps0kF2pRSfGuai3F7DStHQmQxACkO2BUBCNPNbkltsHj1?=
 =?us-ascii?Q?YQrcPxlVbe2MP7CzvYRzSgoTpie2tZeWC86ZIklP81+N8IVUhOQGBfZzpnhq?=
 =?us-ascii?Q?0Rn8zO95ratRpTXeLEuhYL7AJyw/PuN9uoSi0UoYL/DUMdrIjpNegt0PGrTa?=
 =?us-ascii?Q?CDPvz6jh5AJeGZpNDT8SEq1OG/Rg2QCrhMghuHbPTfN1yzje4laazua6405z?=
 =?us-ascii?Q?aOhM1zPBfuJ7hLDG6uzSiK/DScixwESXTTn3uXtPX+zGpIr5a1vaYWkAxZGQ?=
 =?us-ascii?Q?cEZCc1ChRjSz5UxpWGatTvun97amW5pUQ6aUxlAr8BQcMWoKXzuTAHWTGIzb?=
 =?us-ascii?Q?0vkWlWihBloDez3mrHIy8a+lb5hcqN2BPrNBMAiKTjtuNyd1N6n9ll3DHLSL?=
 =?us-ascii?Q?nMB7QqxB6vr3jDF04+AQY9roZ2khu4TJDcdw7/+YxQKKGdRit3xFrx1DhaOb?=
 =?us-ascii?Q?7Ioe/+2/+fDUJU1pyhsEPehanNzPrvABzwi0BKyMbPgnUFxAkllWB4JUyMYx?=
 =?us-ascii?Q?CIYbHtoksXPgGA04zS63NA1gX95ARsfeVVy7PXVka7jU6m3eNA5yk8DWazpZ?=
 =?us-ascii?Q?B8K/uF6QyyMAyFCyvwdVkyCitkF86NBfQIGXibM9Pnh9ygC+oO5pa8+l5Zrr?=
 =?us-ascii?Q?qtio+8DhHzx2nCe/+GzCk/KbpsZUKhFjR/wAnT/rrQFoTmxZrfKnO4wOgHq0?=
 =?us-ascii?Q?aQZihFXm7M+Rx3vgjiUKhfwCs4VDY+TVFyvBR+6a5Hz+VMEB9ZdLSSGF4VWi?=
 =?us-ascii?Q?sdXsJ8VZT0gnQ9NwK/ulZ5afD4Mk7ZhsXz/NLioP7VlPLg7QST6jXP8P/lon?=
 =?us-ascii?Q?yHTf7VOqfD6D8gqgfnGa+k2f4fh5jHe8NtFeHDMhplL5BbPaJ2kOB0Ppn1WZ?=
 =?us-ascii?Q?sCRk3mjHRWIg7p8hNandBXOjib4gQwIJ/eLntTgz+jgz+IO0GNreJxwW5V7f?=
 =?us-ascii?Q?u0Jx5FNS6PSoKOQa+U5/wBT0icMYgqUtB/MFP9+IgeLpQY5r/1/ex+oIRRRW?=
 =?us-ascii?Q?T4C9xVwtk+LOYGaYYvtJsu2cFznh58yYw6zdOtXbvnhUE+k0tiaC+TT6Yn63?=
 =?us-ascii?Q?CHrsgLDZABaBuCnnry4WzULIsSt4cTa12GZcpmcz582GepFIP6d01rBkA7Fo?=
 =?us-ascii?Q?Kmb328VNQJRNyIrU80CPPRLxVF/qi+dGdoQrQkX4Tm2nze/9pcplYkTPuCH+?=
 =?us-ascii?Q?CLSMPUgJ0InBJJCevpiAhZwh1ciGkua1abRKT8Xwxsvo1TwfIS9PIEVYpAS3?=
 =?us-ascii?Q?VfIsPdESOq7OLBiLx5SrlDFAjTWbTsqpblq+L/mvtb419KgDA4loTxkiZCjk?=
 =?us-ascii?Q?NOEl+YJdYo6cOWq7Lc89WDUNZWQjZdLBPhHNuGEfmRS0NOJaVLbxG+JuWVfz?=
 =?us-ascii?Q?1eJz1wchiZztWCNbKiR5Lr0ID4VIiTDSgO1OigclpB0DY3Mb/XW5mLfG5PW/?=
 =?us-ascii?Q?TsLP7azsi09krimTH9bzmsImLOXudjXS5M0TNNIyecFy7oegzgcGexGdvs9Z?=
 =?us-ascii?Q?MsrsFzHRX/88R5jtqw9r59oX19gmvngxnGulM1PsgzC96YQmF0zrnbYFyGHt?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fefcb75-e0f4-471a-f0e1-08dd552c0fe4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 23:36:29.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkHbL6mEksInrRJku+QlSm+DYeWH4/dOxH5uDF3T52LvuNBrK2lZglnViMsRkH5HdvbRF8VsRSNOlw39wEOtzO9vn4hmUoppF3WCEpRIb70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 23:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211854

Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+0800=
):
> The reverted commit causes regression when ldconfig not in
> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
> ctypes.util.find_library(name) can find the lib if it is installed,

Hello Changqing Li,

Did I understand correctly that gtk+3 was found before, indent of ldconfig
was in der DISTRO_FEATURES? But after the change, if fails.

Where is libgdk installed? In /usr/lib or somewhere else?


Bye, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

