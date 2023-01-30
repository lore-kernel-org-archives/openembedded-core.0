Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D586C61DA4
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 09:33:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.92])
 by mx.groups.io with SMTP id smtpd.web10.37059.1675071180140918732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 01:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=KPdMi4OU;
 spf=pass (domain: est.tech, ip: 40.107.105.92, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA0V/dtEwpWeaETnj5d0t8uZWbLfGFhXw7/Mikp4LlFEeaDNEGFzXWlB6DY21rnxTrjM25qT+Fd66//XzGu+NzFhpumrHq5RIj6zpxsptKFASJLjwOakbtbUcF+nqP+5lon4IDlkLIpSb0LdD/TOqCc2BriDosrR38TL31xt6fipB5ZBatK50QFCXeQXpeDHq4G+VcLvUz6+j3G074CX4d0V0lcXQcoybZZEO5WDh64cZVytUt9hyu5LiCXtM2IE7LrPv8m8h/YaTSXu6XTm/qtLhKNLynbkEGBIq3D4WIDpxlqda9Dr8YglksdH/N4UeIAhVELXNGeYfqRyHs6/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ707GtyWYafeSJrKSBDxDNHkHLn4TGniTBAVp2XNZg=;
 b=LPFxs9fYyIlcjpKNAsF187nooPjHhU9K2ColXGPPWK7s7IdpTva6Yuf/1fKA7Fba3uZY0kTmW8b1uFzJZtNrLG68ZxS5/w8uUHd0lyJi27gxtEY1zS2/Ep5ozkgYf5L01HRGqJvmPq85Rsqj/O+6Ohbi2IZn5gMXdQzobJE8XJOFktNpBAxtMxXSN5GQdRFtvBGc8Z2yeEGnuxLhWE8EiKHcXovZZIWHMYpz6O1dw0JAGxD1b6eSGmnAe9A9jh+3F7Ztzr8Z8N2072niV9+v5rQ33aAFfbEukTs8bqnqJeOBwJLDjBJ23JoiDygBiQwmmwgcv9jpHnZt9DpGa+sgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ707GtyWYafeSJrKSBDxDNHkHLn4TGniTBAVp2XNZg=;
 b=KPdMi4OU9ofw3crd6pelFN2Df1cyzPRmsc2rgdrWtvrobh2w8pcuPcgsqZno8HWXJBor2zug5pY7iKD4Qk7IkYDIO70iT2t577QM9U+I3eykH4PQ4L/BVwX07wo1WGzTQWt8lQDulNV+JLcoHT5E0P1qFJDaiH4PvJPjHLjO8ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by DU2P189MB2585.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:49a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 09:32:56 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 09:32:56 +0000
Date: Mon, 30 Jan 2023 10:32:53 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230130093253.gpiq3nozb2jodvrx@serber-ng.hemma>
References: <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
 <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
 <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
 <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
 <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
 <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
 <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
X-ClientProxiedBy: GVYP280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::14) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|DU2P189MB2585:EE_
X-MS-Office365-Filtering-Correlation-Id: b47521ee-d9a5-484d-4af9-08db02a4f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QXDbFG457pmpZ8YnHvWgP3NG0Knm6iQXn/HFgm3Y3BYe063Nykn5Ibjy28nIpO4Y42RYX4d9CpTj9QAnKr30kVHffUnrPuMX4WgAyymMGjoTKLfL01rJW6ZdRRKZrO2pnsyLowvk/ZrFZUwMr/fi6Ug9CeXRNiSNn0kJlztqQgcVGkg2y+5l0xOoiNtEez4FvfiaNEy/lh8u9WY4KjPZ/XNTMLwycFYUU+xf4Px7ISr4yS+ZKTAFqIr3su98uPFDvb7Vgn/Z7JwykYX2QEXn4Z65wkSTIT/nsbmufmzf5o/3ph6j1UJX8cqC3P/1vCFvoVaRVwbkVgGBDCmmPmvfDzmDdxrtUjkQ1Cs+ixvaNSO8S94/XXwOEyOUN2DbhOhvdTtEXPJikZfeurxXZp2Qs0qXi1qLsebrlOzY4/PXeUpmvOagPjmEueDLAJuq1/Ui14bmhvg4MEl+97G33X5D7eRf2jmEDe4ombO2pCw2Inyny4LgSmzvZIbaKX9kbjY9JF175aKpx6qOHnEh81Nyc3suVhha1WfnsVTM2ozPHPrcHY8ukMKagoOVXnlsfCC2a72ema8EiZ4lBNViXwKsFWkCohIxKRzn40bRB0WCwpV+FQPYeSnAlr7pkMn4WWf/TXcpxYasRD0dgSrXKfsnfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39830400003)(346002)(136003)(451199018)(316002)(8936002)(41300700001)(4326008)(4744005)(5660300002)(8676002)(2906002)(66556008)(66476007)(6916009)(66946007)(6486002)(478600001)(86362001)(26005)(186003)(6512007)(6666004)(1076003)(6506007)(9686003)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e6kJuUGoXt12gMszbmBiw0sk+Ncm9Yu5wDO+fnm3kWYoAxVPtAW81a6vU/3h?=
 =?us-ascii?Q?X/VTZycX+EqsOv2x6rysb+B59voThqiTH5F+JQN4aXLjaRegfJOLvKl2kOpH?=
 =?us-ascii?Q?ouHfnDLuI8F80EjQK9AB9DAMqRcxnfJo26UHmv9zCZFYFuiUAINay9/5J7KD?=
 =?us-ascii?Q?UQuaAXkrhL8eHxR3t/HJgB82ITbjf86tdNyJOm2a34l8CgZJX7tdAxN8hJup?=
 =?us-ascii?Q?AnuvUYG6qnqtTuWVWzzlyT2ZoItfUTZsqg9qd43yEJE1NgYcUDUkrIpvOPvC?=
 =?us-ascii?Q?pUZNGbnJ9UN7ctPBIZBlTrPaDaeThYX3GA5VVwL/ej3qsJF225rfl+qvvPDA?=
 =?us-ascii?Q?XfeeMWcieiF2ECJRiOqjn8zCKZ6GnRsrfFUv4LlvcP9VscNAEjb9uQhJvv1S?=
 =?us-ascii?Q?DI96uclKN8/34T3DHCf3wuOEGNUYcPvyZ9xLVbJagyDq6fNM+oHKcoKLQxbY?=
 =?us-ascii?Q?TWMLI6tKe9OfawbF/O3z3e16aRJL0fNA5HrtLRAxkHOb4DWMyepRG6lBpn0B?=
 =?us-ascii?Q?8UHDG2vDpP7rrLBEMqtP/jnjMjBj+muMjPim+rdqDe1Rlik1sBJ1YQEATaQP?=
 =?us-ascii?Q?H1LtKTC4ecUxocS8rR38EyllWEVmKl3iXYHmNJ6xAPApW1mJubjZ/jOSuN4b?=
 =?us-ascii?Q?KFnMPpIR3dY638ygzIUWdMMORc9O4CBLX5unoeBKDw3xwqZj/2DNrxw5cgoH?=
 =?us-ascii?Q?9yeWz9UhCQetC0spoWjtYKOigwIqSPe4N18QNaoMxm8L9kCed+fDDp9jdOJK?=
 =?us-ascii?Q?P+SMrkyHSJGtsZAq1sSDrAx3Js5tN1/cmB+QKY+bGfSoReZdJ4jRPX4WKMxK?=
 =?us-ascii?Q?7atKmeZfaHc/5Ywrbqeh7SPld3eyyugFugJwztaXasfbkA8UEVSDYdsIjq8q?=
 =?us-ascii?Q?DbyfuqcHOwGdLhlC93xrPUu2XXNhimdU6mFpv5g2JInYq+YVwzK69EiEVyTG?=
 =?us-ascii?Q?1F7WPwtnzlH8g7V8WJ53G6t0lyBLZuSNThk5eP2noR5Th8Pa8bb6FGlUklp4?=
 =?us-ascii?Q?wxz17NYbY+DCm/OKrHlPzvEEgjOyyFhwGSDKcRXp285NwxmWZjQMI8KKShoa?=
 =?us-ascii?Q?f7L8NWncGUhvmiGN/Oe+UxfHa/4PZ+7qa5jC3WnyLx3z3EN47vohSf0qlgk5?=
 =?us-ascii?Q?UoonisFDtnHpBcmbUfmqp+lpEH3pOKNocYHpV6BDccgdnjcH6GxKAACqFyp8?=
 =?us-ascii?Q?aV9YYliWuguM9TSGf95nBHuA0NaLzYYwIEFfBApj5/6BaMlK/CfMFCUtSnl8?=
 =?us-ascii?Q?o39TFsLKPwnFRHdT+KBDgEKjtab8CxtSCaWiBFVk63TuC6p9Kz2KUl9xc+7u?=
 =?us-ascii?Q?VOXJCiCfIQDxYlhxusYh3Tmc56RNy6knJF4zGtJDwJjaiuDOa27y42ssdmFB?=
 =?us-ascii?Q?EizqcSbFt5+YXVtYTMzNlbATDbS44nlVGqf26/0ZPo2R3aj2KitVpNaQx846?=
 =?us-ascii?Q?HBvAn0QMdO5VgrQc9L8MsPpr+nCZu66LuTZs5JhJlA9R19lNVrXCsUYqN6d6?=
 =?us-ascii?Q?rVZ6qVGrnUDz1RaQOO6gMkfoveHRilqe28ZTvo2hRrsVljCzf7GkULSRGfns?=
 =?us-ascii?Q?Cy0z4VY2+FvIuL961sRaR4lGIMIImnJvb5bNhq+YxFahsKDXIqC4KrR3y0W1?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b47521ee-d9a5-484d-4af9-08db02a4f7d7
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:32:56.0437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ei+c1eQf9vLioMIstxzUR2/Ff5xOA2hKY2FN4o8RAiHnQRngru2zvAeYWLZtH30bgfEMX3RZ3mLzV3MBiJB3Qmrg4G5t3LhlgYiknq/0gNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 09:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176485

On Mon, Jan 30, 2023 at 10:08:13AM +0100, Alexander Kanavin wrote:
> On Mon, 30 Jan 2023 at 09:49, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > > Those local files are provided by something, so you should find out
> > > what that something is. Is it gnutls source tree itself? Or some other
> > > component? Do we have a recipe for it?
> > Yes, these are from gnutls source tree itself.
> > I did not want to have the logic to install these files in this patch (want to keep it short),
> > rather later as I progress in my learning of bitbake magic.
>
> That's okay, but making the test set as complete as possible would be
> appreciated. You have the knowledge and context for it in your head
> right now, and it's going to be harder for someone else, or even for
> you later on.
makes sense, I'll put some effort into it and send upgraded patch.
Thanks Alex!
 Ravineet
>
> Alex

