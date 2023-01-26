Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E0AC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 08:03:22 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.115])
 by mx.groups.io with SMTP id smtpd.web10.68950.1674720195028839544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 00:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=HfDhf8sI;
 spf=pass (domain: est.tech, ip: 40.107.13.115, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DINWYWwJTBSvLSbUANJBP2PfWJKYIJtioKJrsHVk3Xs+sJncJWMr3BGi8jWvTRYcC7ZMbPKa+7A4qPg3Iv2V5iL7eoMPIBdEF91lNq4Ks8l5ZGl5gdye/xmtMmDXLtgPtSJ1vQHFgv6z0n44IBMG6yclGoVDfwid7UkopZG5dYL0K75dCwJuriSDhXKOSL11EMxH/f1mJRBGHpOznbvGbbUNmOmo5w+ZZQDeZmNineO6KPhPISSpTXhSjjeE9/t5675qLGpmfALZ6htNMbfU1G5t/uITvuRhddMxnud23EdjhXflU+g/3T4gJtl1/9Z9TGRtB5TPtqAsRSAL9epl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac9xZS/swTJErf1+kNJYnq3ADMEG6irADbAkG0sdzfY=;
 b=bn4N0ZSLtZdNDRM+/TmdGmQv0dZv9QsalK7Cv5qt1xTQx9WAfHCpxyHmWyGhWV2vptUNSRuXcfBo3B/c+34cJ+HHoCdo41cPGtmmlMrz46UU3crpfCer6HqY++rQUil0MwIUbF4QBPeM3Z9TShuuUKEPS5ciyJCrKa4qXYkFLGzUqK1GktII4pivmVuxnjGoJ+xXvNPmcPesxrRVyJN8ki/yNFjakaqYMsqhUT85+qK9rOj2YJgsiexzYx0wYyTK3bGJpPcz6dQ0TI3pX4YndHLyNdi4Li389BdAUOjFM0VtgwnvLrClb6+HGqSYY/yk8cqGsZ3mK4r9lE2Mlae9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac9xZS/swTJErf1+kNJYnq3ADMEG6irADbAkG0sdzfY=;
 b=HfDhf8sIO8nQt8yCPpNK18Evr1kG9JwzmywtJRhYqxhJFsXG5/8FfHW3qsv6TChbeEZ2w38kqAMT6E/NTHBs01GgbBKB6AW5VriuQj311nccH9zA0Z/2nAhNO9TednvoZlZkfffNUh31kkIVcGA/pW5t3XJQqY5aleajy0GURVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AS8P189MB2578.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:632::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Thu, 26 Jan
 2023 08:03:10 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6002.028; Thu, 26 Jan 2023
 08:03:10 +0000
Date: Thu, 26 Jan 2023 09:03:08 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
 <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
X-ClientProxiedBy: GV3P280CA0046.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::17) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AS8P189MB2578:EE_
X-MS-Office365-Filtering-Correlation-Id: 37141d28-0969-4aff-7633-08daff73c445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e66nzp6n7FfLCkqHM21CqMbTIMZIRKSwOmUOVzeKJP1OXX81ptB21EjHrCe8FMkaulb8BGdnQ3FTPqTqsrl1p5g5XSJRx01whQW8PYmoJMU+c1krwYSwjZvbO8BBS9rGh688aOiONQ3OWQTJEkn7NzWcqpx68yUs5Oql3HDdALgLM3CZ4xsWQidjf+L0d2qJxcKO7TUk+MGP1lMB8/SQq1ZKxFbCyGo0CgyS/IItjDkbL7fR5BXE5l3hSXwKCozNI4QfCaTsFLx78ePCfqK97BqIgMY89TcAYaRAxRVdnDBpxOa/kULoy1vzXCOS4pETYG0vd1/juz2s8RhPjYpzVDLNIB+jEoG/C8QNHkAuuiwW8x12pNNRGuxYUquzBJi9YE5AF6XLZtV+vkdUfGsyW3doWVHaHkjP+xQBCtGxUvkD0yIkCSmaE0Jwo66AL7J+Vv0215hRE1dW60vonkd689mO4nBHgpyHif8yvIogzqxNPobPpHJn2qqQO21CPwmwurARcOiGD0rQUkuOpXobDaw3xxFEh+sLqZqgMp8qUa5MgSNfsT+ymNcQGFf0ilRc12YCj+ymmlk/M2mO4KKDxm0NTsyCaX2CJbrelFVG9eoYP3xDNN6s+1s9jjCNZX7q4Op7Dtva6DCn05/hsC28+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39840400004)(136003)(376002)(366004)(451199018)(478600001)(4326008)(38100700002)(86362001)(41300700001)(316002)(2906002)(66476007)(5660300002)(6486002)(8936002)(4744005)(6916009)(8676002)(66556008)(1076003)(6506007)(26005)(186003)(66946007)(9686003)(83380400001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w05Hszf5XrgTgsLo8ybkFnPuPLgVLqGh5NHvPCvyaDiq5gKD7YgX+dlzD/RH?=
 =?us-ascii?Q?JVpe5itx3xQvVAAEiGQmrJvD3axAV3N0aVqg0p2jHknJzANLqNbjiySx4uHp?=
 =?us-ascii?Q?udhuCgE4fUpQ/9MyEjLuyf4bwwX1i6xA1a+avKa6KvniObpt6xHbexm5NpNS?=
 =?us-ascii?Q?bJCej7AxN12wTZVgnGVb8ECtq7Cq8GqCrPwNCjni5ml3GV0UMoN4rBN8PwdW?=
 =?us-ascii?Q?/z6Z021nqyFwC7c4WbbCG9Z7dghgKf3njESn1IFUz789OlZxzClOLf4AvqJh?=
 =?us-ascii?Q?dPz0AyX4w1PB5vStqrCilQib9YMXKrqhK6tn0xkloszmvQv6T5nutuk/8tGX?=
 =?us-ascii?Q?rUPQovUxQXTBOREbfk1YnHhqm1QI9IK68qXm8sSN4oFKZfcTlTYaIDV35wkx?=
 =?us-ascii?Q?9jBU41fbvE/PG8G7+GTeTFN2xPSE55rboGLuwSR8uWbBJlAYWx7zA/mSweHw?=
 =?us-ascii?Q?MClr2CephcuSmgES/iaHmVPI4G5xsoZsWf7VV/vuCUHsaIsDEXKOx6hTM0EY?=
 =?us-ascii?Q?Lo11QcCC3KAcyi8eg/iIddHa58yKn5XDopb2norrshE6DSr4lIVC4nZB8Ib4?=
 =?us-ascii?Q?X8LznIIReAXW4H33EvIPgJWT3BXaO1JzHwSoevfWXu6R0l7zjmzTuFmyIkXL?=
 =?us-ascii?Q?P1uv1zm1e9ZqF1IbMY+YYKM8WMY+t41xTfVq098npYENE4I2WaGiTm5VKIKk?=
 =?us-ascii?Q?9trflm2jKlLBEoRmiCunau2lmCBhm/qy4DMPE2sq66ozNbr0sIU1w/B60e2H?=
 =?us-ascii?Q?Sf4lT/1wVkma5ep0EMyUQ1J9Z7Hj5uwb3kBCeOueikyETYvIfNOh9vBeApG7?=
 =?us-ascii?Q?jt3T8HY90mT4CaYJuyYocOT37RnnENdejkxxkFK9T7yoYKRjQlCMfxSHgDZy?=
 =?us-ascii?Q?Q4Wy8beqfVorGjP0ii9Ye/+xeXDJVtWn8jW0ceilHaRVXuYdyaIRkyi5h7vc?=
 =?us-ascii?Q?ZicWVUWOjZdZP7k5wNM428o5pmd/mNimofrum8/PeOS5ccsAnPbTeLK9una6?=
 =?us-ascii?Q?xJRl3v83pwMTFxbY7v0gvsc7Z17+r9edBDxp1yq9F8zb3gs8JTbctmvGevKW?=
 =?us-ascii?Q?uXs1g24ecWpXArUGii83LhsubEQFvg8ypnHJbzguyriXeuAB3Rj9um74l84t?=
 =?us-ascii?Q?UNpZBwoDtIagR3Ttu+Cqgh8PXjf4fhKFzsxlFOtcR1Ew37h3e7fAH54cE8HZ?=
 =?us-ascii?Q?RJFbNjpOFuqih2gLOHJDzHovl6W5vLFXtcnSbbx98PwM5JQsRfvpd8zFnCM0?=
 =?us-ascii?Q?mluP/pPfaBESkP0Ofy0XeurqbBP5QB+6J3b92RBV/sE9BcootflCp0RtVLVk?=
 =?us-ascii?Q?n/WM9Y0M965yftQjTfu9NoYUwWvEgPL0sc2K+5819KdN/0NKk+V94H8hFCRR?=
 =?us-ascii?Q?qrbZsEUsLN07gBYCK++vCnm/kelq4MpVtaSBzhmSbPMLNfqBEHlSI1A5CLPi?=
 =?us-ascii?Q?c/eYdVG4ergJsvJyCWUL5O61aDZvQooiTdpjvhB8OA2eeiFqXjMTYtF8zvIM?=
 =?us-ascii?Q?kPv1wePTADXgUyhdSOZvA7vT6Oo6DLTTboaGs+5vcHQTBgJydVVhYNL7Jtib?=
 =?us-ascii?Q?+U1QVzt8umT/O5Wm3KDNkC3ncvwG8kBg6GcaxX0SK0REdtLjRDHeOOrHaWsV?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 37141d28-0969-4aff-7633-08daff73c445
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:03:10.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDWj/M4urL4lCeS7nGvXrC4Osg3W2hQn2EX+iE2mtDCqZkC0Cn45pq645y8cW38yhjKK5R6rT+E3s7VZRQLaIRK1uqXoUrPIMHdP4mR0Rl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176383

On Wed, Jan 25, 2023 at 10:02:22PM +0100, Alexander Kanavin wrote:
> On Wed, 25 Jan 2023 at 15:20, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> >
> > On Wed, Jan 25, 2023 at 03:02:27PM +0100, Alexander Kanavin wrote:
> > > Thanks! Before this can be added I'd like to clarify two things:
> > > - is execution time of 184 with or without kvm?
> > It is with kvm.
> > > - depending on that, you need to add the test to fast or slow list in
> > > ptest-packagelists.inc, so it's actually executed in yocto CI.
> > I'll add it in the slow list in ptest-packagelists.inc, I assume that is OK.
>
> Also the newly added patch is missing Upstream-Status. Aren't you
> getting a build failure with that?
Sorry, I am new to openembedded/yocto hence I do not know where to find the build output/status. Could you point me to it?
I will add 'Upstream-Status: Pending'.
/Ravineet


>
> Alex

