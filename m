Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6C5C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 08:25:36 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.129])
 by mx.groups.io with SMTP id smtpd.web11.36522.1675067133419071615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 00:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=Exv4PLHM;
 spf=pass (domain: est.tech, ip: 40.107.15.129, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH0I5Oi1G9g6s0889PJ7JxeR6iy7o7X9u15PPZbzGtubDFy9enR7sFHcfx1TN998qQuvkwDxQLtt4WI3lr1l1femSexOji2qH/lrNZTc22vo4xweKx4JeNIohwYzGhj+r3Ly2C0uSPuRXDWqedR/WD9AYwidwNmaxrLb8tpaA1LYvFsHWsDxu9bfuoWQe60wZr1g0lymhzA3W12gEI90vOFOdI858rwPVVXCtsjdne+gNy7ycVOqaEldWVHlAGx07Du6YnbrRe6Oa4sE7XO2XcVZ+q8M3cmXBY9C19Pc9uGdBoeYBFH2tZZzmARGAqyHOCj7uAfrgXLtbGPcxaCDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKkpJJFyUAdFkxltf97aLnzL1Zhws4OvEyOhC9k4Log=;
 b=cZqM1qG0LydIMSe8Jnb9gUBH4N7YFHmF2zXkbHQPlgPUNnoMdUbBSO3ebkwweSvTZi631sz3C1X4OBPvu/18JH+UFXRZP2gCXuNvyiaZINrT0gguZwbsTF13erbk3cJwttKMVVz1r1FVROlN+EEs2iCSEMcjo02XieN+T8RhJJ1JloY8k4jFalJgxMCyCQ6AhkaQ1JrNu618UHmeQV1Dv+T47xmQJcN31N7lErum406KrUdxUhwwoD3Vwm+c5aBA61eZoocqWwA/9+KUIDS3poEdKPiAnHHWM4BQy0w4KnZ+ErYRjeXzkhPn0jmSRaoSztRwyV7MTCjNCYYRidcLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKkpJJFyUAdFkxltf97aLnzL1Zhws4OvEyOhC9k4Log=;
 b=Exv4PLHMPFNZTaWLQBfOhmjacqcbnYVVdxi2Gbi2XNXNKE2fRwFD4XiXUMGcUzK+g6Y1313eWvNHBrLALOIVV5odYTqg9QtmZnqj9ykrLhrk/Rw5vtyVgC2N+xwuIz5eiSsx0mc7lwxIA7AtvAOOaXh3Sz+b9NZ+e+hO7JeU6BM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AS8P189MB2247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:571::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:25:30 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 08:25:29 +0000
Date: Mon, 30 Jan 2023 09:25:27 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
 <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
 <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
 <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
X-ClientProxiedBy: GV3P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::11) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AS8P189MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c13236-4dd6-4c86-72c6-08db029b8c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3lHZOhWDX30s4yPUwhrl/w5WbFtg492MlSHYkTJ7TcFIys5zMC4OhbGKxLua891O6TwBl4QkthmRNpq8WCTbeSnn+/fi9uxmV31wIjfIgdGObAAQ3x8VOMmRniQHJe0U+LfVntlJO0ud1Y4WEwvppImhfrgzXqr90A0g67mcbWXGtsEHCS87nZdBfHa5uYEVp1Qyzv/P3BoDX55zrPtMti8p7OziZDKbp8/b/AU6nNHTitxB79cgLkI4VkhLq5FxsxRHRuAjI8ZkkJ4GbZ3ckDGl/JW0tx13pBpnkk7ErW/NqnUW5PRGs2YiuM5G0oknbesarSMkK6AXUs+T3ZT2cfAQNSy/1jmee9pVbfcEVuuFiHTRBQ2zUNfhyT1TiBJxcfdN29viYYhhpG6uzN9ZcM7VPkmY2Dc7x6EGs0LJlacZO0/u1M/vWJoavr4gV/+8HjcH3SosuD8mZPzsideU2utlEzrBh55oXOysluaLyH+r7xNmYCHphSVxuP4Fe0REa3GgtMli251z2J7XNA22QqIiZkTW4fNZt4DmNs77KM7HMh3QSyMr1nWcPaTW7nqSHSkUTEnJRMXLqPbVFcNaopQ3Eo0SJn6tjlLxt51Ilg8/KJt8UBo1AqQsFZAKWftiQmkdKEXlr98x4jmLqMSYFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(39830400003)(366004)(136003)(346002)(396003)(451199018)(8936002)(41300700001)(86362001)(4744005)(5660300002)(83380400001)(316002)(38100700002)(66556008)(66476007)(66946007)(6916009)(4326008)(8676002)(6512007)(26005)(9686003)(1076003)(186003)(6506007)(6486002)(478600001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AcloL8zw2oVxUZ/K0aN+qRLRUfcG+cn84IGTDuuRoGs8QMPReSn7l8Unhc+X?=
 =?us-ascii?Q?0iKfUCN8mvVTu0Ub3T9y/5plV0j39+L+lJceRErsc0yFZBgGlWQ7k2BcbSt2?=
 =?us-ascii?Q?KXucVByNwdTRGq3HbEvJJRQN0YB9wV+fWs1bZO0jnziTw0RP5c1sJxF5vJql?=
 =?us-ascii?Q?j4RmLtWpN7jUrTtw3p9Fqoto+6s9ZLhe6V30T3QSrgQeaBds7nWe5XrV2fsr?=
 =?us-ascii?Q?GomO+4lhofr9imHl8k9Tg/7B3qkLKVgJ8K+WEkzZKO9wiXVffEVzrK/uOP6W?=
 =?us-ascii?Q?Ny3MpcXJ6hPv/avh7tzSZKRg8qT/DJunZviFu/pbQ4ZOvVIKQp8FJGn1xgRP?=
 =?us-ascii?Q?s5qhBFmVEg9/Ylptn3Au9AGGEA0tgyipoP4oKSf24LucHl5LwflEKNrwrZet?=
 =?us-ascii?Q?0TMN8fdyn81Vj2mAYBLrg9mPsiGii7RKYfxVmcSqE7o7IZSbRromfpXNBDJs?=
 =?us-ascii?Q?Epv5hj6saIg+GVaSxXvR+Mu1AeNwywCYszUnF1NBjbcXCO3NWjlBbPZWkHJ4?=
 =?us-ascii?Q?70pp6eYuMJxlWeY2GYFL9xfYEXDfYL/K+V9b2YotAdlx6taGU3tEI+Bi+se4?=
 =?us-ascii?Q?C2/LIteQkWd9pQPBvC8gPhVrijod2HXL4b6VJaNj6zH9K7F7HjnJUfMBwwm8?=
 =?us-ascii?Q?FhRi59WrMlD376pRsBZZQ2fu0L28gZKwMzdw45h/rlubDQMxZvMdPA7GU19j?=
 =?us-ascii?Q?4rkZLW+QToqJqxih+4xgjt1RMvhgxEUS8PY5ENBOZERTQWQGXZQNzJVv7rQF?=
 =?us-ascii?Q?ljWzGampDWowKQYMLbHFh7zVx9Xgibf+i8qqi4QrgHx6jQFBVLI++fLIVhOT?=
 =?us-ascii?Q?H/kOT2FqV3uH6ndel6BBhzSHykVzkY6r40eogcTBlDz9SpczHVxa3wCySW7k?=
 =?us-ascii?Q?4RrlTphLWREL4Gb6JYhCD5x5/l80bWqk4LAcyty0gvffSzBey/YNTxewnEr/?=
 =?us-ascii?Q?51335B8QclhsQ2NqN+mewCYQfSuhV+RJwRHGyYRZ60YL7f/ubCagIjMJW/sH?=
 =?us-ascii?Q?B1vBJ3n5ObYqdrdqBUzPOw9FqZ4cHDMko0lIJtqUFrJVyLee0OBd1u5u35Ow?=
 =?us-ascii?Q?zi5+jP/3cIfkR7aFOwXE/mFxNlQ876nub8TN2TKHAnW6bb1sQglx98wlM5gT?=
 =?us-ascii?Q?bHCxrJUcPfbcS55Qewmhy2jH4vX1f/D1phlBwlE7phdJsRR8Gfmf4mh5w8cJ?=
 =?us-ascii?Q?Zck9fFpym4dydFH9jDmjU+wiT5TANVM3se1HPj7hh+Pjg8kJRQdZH9Pc0Lfh?=
 =?us-ascii?Q?T+44hBfq4ErHalC9dQjZQns5HXWR9CSmmvyKRHFe2YxMxHP1pSBfP7eC7O1O?=
 =?us-ascii?Q?Wg97FEgWLQmQs0wT9r6QP8u85k8lhEJCaqVubFj8Pv4Z7PNWOTL7g/7tRwdY?=
 =?us-ascii?Q?fRWFyCwf0RX9kAF+vDM22b0kfGjJW0v0wWOXwabIZEzW35z+lS78dB77vxft?=
 =?us-ascii?Q?B6GdcFoFGZfbw6nK7NwsHw5W28QtCjC2LkjPZZgwUjDcTXZI5h7TtJKJHSW7?=
 =?us-ascii?Q?qgQ19yjy2QrJCwKo9YIBCImLyP1PiQ4J0EGzIqXhFUzzTWFsDp+A+JgI5nTA?=
 =?us-ascii?Q?AqedFUPMtEBH1W1FC3KauRvZcnu3kJejKTklioH/s/kZlo7gSB0aNRZs8YkS?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c13236-4dd6-4c86-72c6-08db029b8c20
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:25:29.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfCrZkhBucxr7dYDNTNjy+EKLiI8WcIYkLtxyMlPIpj57WuWaq2iFQIPAeqJoDnmUA5FaVFlq20v9tZ2OwcnsJpru5kWIUJ+wOCh7ASN+vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 08:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176480

On Thu, Jan 26, 2023 at 03:24:29PM +0100, Alexander Kanavin wrote:
> On Thu, 26 Jan 2023 at 13:07, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > I believe the patch cannot be
> > upstreamed into gnutls since gnutls use automake and use 'make check' to verify the same locally.
> > This patch enables running gnutls tests under ptest, hence it would tag the patch as:
> > Upstream-Status: Inappropriate [embedded specific]
> >
> > What do you think?
>
> That's ok. The real issue is that libcheck does not support
> installable tests, and it should be solved there rather than patched
> into specific upstreams that use it.
>
> Can you also try to determine what are the specific missing items
> needed by entries in test_disallowlist and see if they can be easily
> provided on target via adding to RDEPENDS:${PN}-ptest?
>
Well, these are not package dependencies, rather local file dependencies (pem files, etc)
 Ravineet
> Alex

