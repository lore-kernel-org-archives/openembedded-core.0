Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A8C636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 11:52:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.112])
 by mx.groups.io with SMTP id smtpd.web11.21400.1675252361805437903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 03:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=hpR7e7yR;
 spf=pass (domain: est.tech, ip: 40.107.21.112, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbFGQ2NuVmHUljZb2CMBp+BCzsFZ/NA5jofb17wl+9jS+PCfHpq3qNFGD4oaoBOTjjAvA1+4k+Nt26Cq5xMrc7bNQYFBUgv+HlV8bWvonguRQE6hZCsxfMiMAflNF8XG3i9t1+DzuHnulQT82Ux13d25TvdpReEwJE8v7ZKnM8tMqQNnnmKM8LCZcSfubM1g+0cefZT9Vyju4QBXfKY5hkmNe2kCd7qo/IdzHzweOyNKmjOMYxwMYztv7e21h3TgzqEAm0T+2ej+UF1xNWK5dgQ52u0CEwCF/wohi5hrjvpgA4DXm1jCmFnj0BApMqtk2E7EC6UH+lUy+KouJFjB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM0XjirqDBSbDdFngmjsh6ux80KZ1Ln+DYA6wev28MI=;
 b=O6eybUyW6OukH3bn0yKpqhl8+GTdW+S2NOoRzJO8Nb4Znl3wQcinNDt7/nl3olkujaDJByW0ShzxTylRpHwwC8oeioWij/Vo/vtblsi/PkOE4XFVPvkzXSvFyOu6tbxzVRHACvpN4FFYdc1XVHmYZuUnTPD4dMUZZ2ftTimBJ1C4pkxe2Hq6KCfNu2Bnt1fmINJxvApmhU7pTBUrvjq1E/ZSUJLYU8cfeUMDRmIakiDII9/okrBvGFvV5WIgtlxglj3PYd4+XxdgJGYx0u1g445vcIRKnEG/AQ6/fF8RSmkJHPLbWeETn7CC0/X9ruwWbXE3jHpBfywdtDtQf+g/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM0XjirqDBSbDdFngmjsh6ux80KZ1Ln+DYA6wev28MI=;
 b=hpR7e7yRWp0HO7cWiYvIivHRsyAUg7HSV3Ks8mYAX9lzqLqfMfWe82Y5y6dFE2pHJogiLyeXp92uBQRhH2PJBiLO4PwMCVZkLtyGSmqap2q/VeNhJbgJQpfHH7h5qdtLTCB1jd66O6Ju5eJY7NYaWDhWlZE9emP6DHgVvFfhgbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AM7P189MB0647.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 11:52:37 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:52:37 +0000
Date: Wed, 1 Feb 2023 12:52:35 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230201115235.43rc22tvhbpq23iu@serber-ng.hemma>
References: <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
 <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
 <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
 <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
 <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
 <20230130093253.gpiq3nozb2jodvrx@serber-ng.hemma>
 <20230131175829.xhe5jhicl77j4ole@serber-ng.hemma>
 <CANNYZj93nkp01UVuVLLCXbyxEu1KZf3hV=Hr34Xsb-+ZyUhjxw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj93nkp01UVuVLLCXbyxEu1KZf3hV=Hr34Xsb-+ZyUhjxw@mail.gmail.com>
X-ClientProxiedBy: GV3P280CA0010.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::11) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AM7P189MB0647:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad788b6-3015-4d09-6b30-08db044ad079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OeO+Qh/XSEgza2tnt71HhumuBeJ222TjX8vqQKWNB5iaAXNiD7Mu18fl9ZfUxDZsErufQvgiUKMY7OFuKjn3YrM9fsV8iIFclgCqkRvbJeJz+etLFSvK01NOoivfjXBvzzaosaNERtBlUfyMfkK7c79I9VuSyc86Nq7QHzim4Yo9eqA1nJSyNGWLAl53vzERWoUGDO29LSiGJ0vHUEuVVoe9GnHNZUYX+xGZGrX3Ejw9VMYajXphpeZAnNS0+Ogz1qwYHK1ygQppRx2hkhnWV4z0XpFN0EV7Ls/uz8xi/ZazRcbaCvCWmec+0yGN/ruZ88SKFhjBLCZ5947BzC3RXxkXXLcZAMKI+yRFYTEFnvZo2KTjGitBymrAHGKlli2ikIFuKcaN52fiyXqQgh9fb+WRwH6lex2zuEKV2nKx1jx8O7Tf4YfN0JBGIbJZzfaGT3q+PVuu3Je4POC49hTGC39IQrr7cW64bgtvBQuCEscXiMnISa5Km/y/HTPz6Zxq2N+ayLm/lR5mhOV5CdeGyszrpHejsjvi4V85YnDVsT2pihQlhDfBmQDinmEmgp3br8eTC9Mk/rapMYKE4kmhLI8EkoBHBNOYr2Bw0t4zN52vR/XGA72kdh7URFhAmhKb8dKgan2VtNGdGspXMkCUjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(376002)(39830400003)(136003)(396003)(451199018)(186003)(26005)(1076003)(9686003)(6512007)(6506007)(478600001)(6486002)(316002)(38100700002)(83380400001)(86362001)(66556008)(66946007)(4326008)(66476007)(6916009)(8676002)(8936002)(41300700001)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AKrLo2R+D6pVDvGg/l/2q3sR1EWZFYsRRmGzomX1v9VUJQhmmUhndUq5Sa2R?=
 =?us-ascii?Q?tOuWT95t7QgKIO95p0XxRryXqZdhnOQpTeIuLbx+M8ELWypvcRTnQwh+ZrnD?=
 =?us-ascii?Q?mKAIefHymWjw81GrWnW6lbB8zweINpTFSEV4vxamdaQhmNf07I/DXSuT/lLi?=
 =?us-ascii?Q?lnHM5KWsJvqAfeQAcLf9hsvS/nOZTuSCOT9TBXFM8IlwyTZOM4Bb11OCUIYD?=
 =?us-ascii?Q?gRe5Bsi1CBy1Xtpurylml18qsBkGd4ofuHpjPGVOypTxwKdnzoIKPrFqTKdk?=
 =?us-ascii?Q?sMUrPObkgENEbIOmYgeuz6eVI8Huek8gIP+sZaTln+AqwJGzhO0MClvhvABA?=
 =?us-ascii?Q?ckwv7bPdeCzlr+tPOMwP1ulCwHsWCm9Jyn0FhRpEb7YJ9kfPor9Js7FQc0Ja?=
 =?us-ascii?Q?qL5d8e6Loj6Dau/BRc78iS4IFGHBz2P4OrHLCZ9G7ytUeX+EiZG4UgX7e3Qi?=
 =?us-ascii?Q?Tu5zKYlveLCkZgMbaDM7J132s0al90P8ZudrKcrnosWrIbfv1LdRsb4tYU0Y?=
 =?us-ascii?Q?onQISJIhpjTastNrmrJCGQfcIJ2MMJ0lUjGjx0GjM/RHwMvM1q4yBSUBRTP+?=
 =?us-ascii?Q?h9LfdpI1Jw/1GAuMrHc33MKtIWrTihBxQdeOTx45vDf+d78J73xL5GI/lSdt?=
 =?us-ascii?Q?JSD6tK1aO+n1LYDSolq1j2rMyNdlRw7OwQb0aY2fbwDTq9CTJmBYGcmpLEPD?=
 =?us-ascii?Q?YM8XktadPT3et4nE+4EAF6ucPJeDHDpSOmkP8XjWJoTzwujBQ3seFOKh2WMX?=
 =?us-ascii?Q?LJ6V21Fga4VwJgwAGVtsnizH08o6v7iGiLHE6JenHgf6ZZNzbuSEyAGcc66B?=
 =?us-ascii?Q?Rg+BIKwW1evZwwWbh4UmyFUWNL60hBk2DPB4Kxl5A3lW8E99iovTbcTciM5l?=
 =?us-ascii?Q?a3qiEaYPwy0/qRhxiLdyAqjskBKXKAypSVGozowz5W+zpJKx+Msg4iv4m8+e?=
 =?us-ascii?Q?CqVpcyZM3dArSUwuAigAN+uZ1Dlt9XpQUi7K822kD+owhupIIYgMdvx62FbH?=
 =?us-ascii?Q?IKPl9Z7/lJFhbJn0JTnUschQtb5y09jNtO27cE2474yvBESIgIxW/frD02Tg?=
 =?us-ascii?Q?3lYLiZRJn8bENnoEA7iF75B2pzq3jJU5ZUjQNDED0m7o2Eq0GYy3bVTU5CQc?=
 =?us-ascii?Q?By8H9OQAf8vUk3IXhuSQeqxh/cuQ86h4a6RTxfO75QfKS1syJe5p80QonaMZ?=
 =?us-ascii?Q?9tvbf6WPMCCA8Izq7YXlMuSb+sEQn7gyFVAFYjDjuicHOdJGLWR/3NFrqujo?=
 =?us-ascii?Q?/TazEx8IU+YPGLE5p3QWQR88ivLwi4GPnkaI9YP56SHjSIGvGoYd/WtaFUvA?=
 =?us-ascii?Q?OhkVW1fDaDfQKjuy1A0tNl+rW1gDoUd4T97HaXIT4d3HNBjvPnJUZeuU612l?=
 =?us-ascii?Q?iOC9hauxCphWSm4wdKPeM3YoCPM7TEJUzdQFltcaK2wwj5RTqD8g3ZZ/kLSP?=
 =?us-ascii?Q?C1v7LV0dWhy5u9PfVMm7WNvX3FHjZnYSruKO9LVVC1WxxG84R5WSdm3Ialnr?=
 =?us-ascii?Q?CpdJTYH4m5AYEZIcks/JmNfBv9KsYHWRa5AwT6zbHOoNwKID0zFN6sD8HnAD?=
 =?us-ascii?Q?f66k3JYBM9v3ZJL8C6UAdP6fJqZ75y+fgEExUucwWnMe7NwOKXj0oyN13qno?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad788b6-3015-4d09-6b30-08db044ad079
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:52:37.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYdkz/o0plkF5esa8b/yW6AYjMYYNgPlNVWxICIUPFH+VuPjht79IBMkjces5PuoWHhuDb0DUTw8Abt09FKI3EDgg2+oifKejkleubsFVC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 11:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176528

On Wed, Feb 01, 2023 at 10:10:56AM +0100, Alexander Kanavin wrote:
> On Tue, 31 Jan 2023 at 18:58, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > So, tried to add missing files via autotools-brokensep (not recommendded), but still some tests will not
> > be possible to run since they are expected to be run via wrapper shell scripts. These are the test:
> >  - system-override-curves-allowlist"
> >  - system-override-hash"
> >  - system-override-sig"
> >  - system-override-sig-tls"
> >  - system-prio-file"
> > Giving up at this stage, don't really see a good way forward.
> >
> > I will post initial patch updated with comments you had before, in case someone else wants to look at it.
> > I do understand that you may not want to integrate the patch.
>
> The patch is fine, I only wanted to find out if additional tests can
> be added with reasonable effort. If you say that the effort is not
> reasonable compared to the outcome, then I trust that, and don't have
> any objections to the existing patch going in. Just try to document
> your findings (via comments in code or commit message) so that someone
> can use them as a starting point later on.
Will do, thanks!
/Ravineet
>
> Alex

