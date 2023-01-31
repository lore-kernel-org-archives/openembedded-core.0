Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BA3C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 17:58:36 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.104])
 by mx.groups.io with SMTP id smtpd.web11.964.1675187914568812658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 09:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=hxUgOG96;
 spf=pass (domain: est.tech, ip: 40.107.105.104, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc1TNCp2T0r3LBnxY7cEdDVrhZbYqp7b/zbtKPEpzM77x/f1p45rc6ORBz8mrrIFGATB7Q+Ci8tHDyt2vQLaTjU/URVXmm5xIghqf3SLL//WHqNpCx52j/aBkoKzwyIZTo4KCjNbQtC4L6HydXfsFsrEVX23+bOPWmXfQ2y7545LD8iSVDRNDHVuDuiphAokUKXJUNr7wLtr6e369B9hg4zTTEA5MWo/DYrAbiWq+YRx8JYv4zXe0B+Hxx7EJLRiEFF3O2uib1FrUYy6XoC6yDM90kY7iZnrn079RbxlEhdQNmrHA+y1vJ5IyF+itSZgJyH8ZjZT92HYJPhCEwiI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQfNOt2E6DMoEMS+V58eE0ynim8Ht/1fa5nK3cWVP2g=;
 b=S8bhWXK3dOjtbxL9KUDUD/uRmKdqKTRkcsgIrN2fvAKmVsIWHwyu/BFxHItiKqlztXfdaofPjt3OwOY9yDd+p7ebBs+h5sW7NsDy+Fs92zblfX1xKGB1xei/GlewqlSrc3doe7e3ktJ3R2rDwJM66pbY/J9Z4MVuYpMq54fNINWKQ0aiP1bnFItSZBRu9utxd8y5EaW1UXPKEs3OVMcax+8FxMZO/yCdGdoKEIHBNzgQlXkn68cR9iVta7Vuip0k8eViGwtZruU2+xOPNFFZKlIuEb/4cdu6rfvZW+XqAOKRGiq/Ka4kk1X2jGy/J+CA6r1dC9+X/+vXzkh8C/Nclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQfNOt2E6DMoEMS+V58eE0ynim8Ht/1fa5nK3cWVP2g=;
 b=hxUgOG96WMs6WHc5oBl/rhq02NTsAzM8yzro2VKS5h4CbboI34CZlHtUAXeCvGDScGaqqXdE17C9cQb0S0MMF51w16iiXMrScgXlqVpDWY7n3WdG5LYQaZIcG8cFeO088Q3nerUc4apaZyGC9IK0GmAG4jQtkyRAVzCyu6YP3E0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by VE1P189MB0927.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Tue, 31 Jan
 2023 17:58:31 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 17:58:31 +0000
Date: Tue, 31 Jan 2023 18:58:29 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230131175829.xhe5jhicl77j4ole@serber-ng.hemma>
References: <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
 <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
 <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
 <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
 <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
 <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
 <20230130093253.gpiq3nozb2jodvrx@serber-ng.hemma>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130093253.gpiq3nozb2jodvrx@serber-ng.hemma>
X-ClientProxiedBy: GV3P280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::13) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|VE1P189MB0927:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d8bc0f-4961-4f79-0a48-08db03b4c36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L2cygaIBgQwhpQ2/jMRjKYbnaCiKSr7ngNaORYDZC8Ij3yJVR/M7izJDXw2Rhi1ra3wQzyp+plfGcxI2omXhq1B2ogpH6EYNn3SaxsBD0RZ/V4+auJo8ArI8Jih+eOjPz1r2qRiQmr2PE2HW8i7EAWBNYHL+jf8zWK0hUT+DM0j5uIcCqxB7/K3qoEF8nZGrMYPj1/W/zUj+bd828nKht8EyZPdxJFB8UhBgbi3Gb3s5VnX5u+/AlBvG167BbBVEtMuXN9GQDe2zyfov/4dpLAkd/VswbiboAzT3C2/+Bn+VdYYyZT588FwwnN2LhRRxcNhCjpIpe4WYJQV/N7gjAW9vGThhKrQcATBFecm42PJzcdS2co06X5jtb78DtWqYB7XRDbHnZC4uWyf0ruXSOsU9An0RJZzu8fH8rtTK08FQtaeLSPkgQQ1WAZV8mx88mVCIGVEvyV+oMn00YYoy4GqpBGnxVjvDr0+xWo17DPOu4KFYt3qcpMFkoOAxMIbDpzK3aCnFeWJ+mOwJuTI5kUp3Wt0yCLiVWLQt7Wm50IcKBOeFdLbpY93FOvBjzpfAKsy2bI9gLkPkvYQ1LLHcIhGsOXG/rFi8r6LFA/gt4jFzroma78286rqHQwquYHBI1pNk5efQ+aKmyzU1KpAt5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39840400004)(366004)(346002)(136003)(451199018)(316002)(8936002)(5660300002)(1076003)(9686003)(86362001)(478600001)(6506007)(6486002)(186003)(26005)(38100700002)(6512007)(2906002)(4326008)(41300700001)(8676002)(66556008)(6916009)(66476007)(83380400001)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gpBOlagb5/w1ehoOQ3KU6Tm3F2K93xYxzG4eHqyflL/wcvzSkUALBo6/kn5j?=
 =?us-ascii?Q?7gSAwGUFnToVtdV2EPyHd+Oz6Cr/94MkkuHRzand4kBrPULnwmdmtemZRd/o?=
 =?us-ascii?Q?ZTPyHeu65PHyVeMtjiSPYGbA71kLWh89mSfrE7sFUL2mgUFsawy9C5Q/9aAp?=
 =?us-ascii?Q?OpRvPXeObPMw0aJ/2mbdS3oVGeETqzH27uhXNjTErOHjTP0xvtvc6tan0Ajm?=
 =?us-ascii?Q?CL04o7V3ZU7S8PutAdwuBKgV7AaVPa5mQS61ZzNv3a56mYrdbbpZVNfqJPvl?=
 =?us-ascii?Q?LYMQTiYbH5WkqOrWRPRxjRSJRl1uBzYZX+LwBWlqO10my+7WPN17B7X4cCOm?=
 =?us-ascii?Q?2MKlDmc+3iuy4DGVm1VuPOc45JbEXKVRlb6w50/SVi2RyhguIeVpfF9dFCWJ?=
 =?us-ascii?Q?x74Y+q11wMRebVEkZCTL94BbmUF1+9xq9AEJWpNxmMDkTR0zeW6FZNUlmk6G?=
 =?us-ascii?Q?0nOL/OSDykCCSX/FesmFLa+5RRBkeGIF8eJDbV4Bp/pbFoVkJE86uTFClnpA?=
 =?us-ascii?Q?vs9+ZDmL7hCA3NLIR6IU9WGGlijY9+DreDY4SG7NRIcjddYQhP2d6F0NyeAg?=
 =?us-ascii?Q?IPkQswT3StL+7PGTXthfdthDj9gf4ApA8S8MiUErpsaAoPZL1f1nB4qqR+M5?=
 =?us-ascii?Q?QkFfn0mLLT76hxqNF6SZrcOKzrF+UsDMcb5qHNAL1BmPI5QLy4ch/AeToiNj?=
 =?us-ascii?Q?N5OlZ43j0jWaMvEg73SL1LAceCwTcxU11HjNLTkf+nlyxsbU4XaYdlLpOHch?=
 =?us-ascii?Q?WF2Xe6keQKTxz8xgGbCdXgTvgOIQ3i7NObGBEbr7U4YxJZulVCChWtgg4x5a?=
 =?us-ascii?Q?vXKXy592/krBBo2waRr+2hcHvJkHfPWRo4cboWp/jLqQNxqB20lfBA5upxp0?=
 =?us-ascii?Q?BrgOO6AW3ZOKP8kAvAvLBGQ21Iac2YOcCoX4MgF/oYsmLppN6jPO5URN0ltu?=
 =?us-ascii?Q?rcW5G81OQdPXQh6WtDrzfThXicyC9CZbqiQIJcJZkqZizyndrXPhsy8dCQwy?=
 =?us-ascii?Q?70BELiYj0dLsiRDUZ3ijk6kzaeDV8wSZuPKPXD7T1vvnBA6XaAGvXwL5neVH?=
 =?us-ascii?Q?1zo1IYN8ZiIvLAb1ex8CYiWI40ZmSI/GQNUWXdd2rjvzUty7BfyzwNWQsPPF?=
 =?us-ascii?Q?iB02P+ccLENw0cbwLUr7XR7P2GK7wIj7qVy0r1PVdiMb0vQreIZZQF/qYzbW?=
 =?us-ascii?Q?XI8qWUsGFYlR7BAgI9UkqFcjjlna8DzYAz19Wwxi9dvAw6gyDxe7fdUhP1ZV?=
 =?us-ascii?Q?errD5R149AnmJeCclLcXoe2vh0eL/CaDx5bw7vcFoAqfHHM8S1c4qbOy4nga?=
 =?us-ascii?Q?7JLLBLoUX518myHU0IWe/u0v2H96+DPdyvHKIIL3ngemiuQIi/S8USHL2nb9?=
 =?us-ascii?Q?jZ2cxDPv9ve6+TiiOCmzgcyBs0MGxtrIChafrzfHdGP07QgFaNmGR8X5slKr?=
 =?us-ascii?Q?pkgnK9uItkbYsUZw40eV8ittNYGI3ymi9jwOZwww/V5Vx1fflLSc6jELm1LR?=
 =?us-ascii?Q?faO5IBn1HlPDQqRqf99QFPhgwvkN+tvfLKutyGmHA+Z9nFfMeLET4F8Ms1B0?=
 =?us-ascii?Q?cZr2IRBfubULEUvlsApgWmlNrMZ65JjPXaPYkQYHLdsgUEJ87UmUVzpqLXDB?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d8bc0f-4961-4f79-0a48-08db03b4c36c
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:58:31.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRbTMgSxhcL6Z8kpn0G9MOO/uI7hknYrEuDlQfbsYYVF3iyvJQSqlv40eK03xFJqF42ul477TJUcu1rnrBtz86NJkdPcaHStIIOmXAtGTW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 17:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176525

On Mon, Jan 30, 2023 at 10:32:53AM +0100, Ravineet Singh wrote:
> On Mon, Jan 30, 2023 at 10:08:13AM +0100, Alexander Kanavin wrote:
> > On Mon, 30 Jan 2023 at 09:49, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > > > Those local files are provided by something, so you should find out
> > > > what that something is. Is it gnutls source tree itself? Or some other
> > > > component? Do we have a recipe for it?
> > > Yes, these are from gnutls source tree itself.
> > > I did not want to have the logic to install these files in this patch (want to keep it short),
> > > rather later as I progress in my learning of bitbake magic.
> >
> > That's okay, but making the test set as complete as possible would be
> > appreciated. You have the knowledge and context for it in your head
> > right now, and it's going to be harder for someone else, or even for
> > you later on.
> makes sense, I'll put some effort into it and send upgraded patch.
> Thanks Alex!
>  Ravineet
So, tried to add missing files via autotools-brokensep (not recommendded), but still some tests will not
be possible to run since they are expected to be run via wrapper shell scripts. These are the test:
 - system-override-curves-allowlist"
 - system-override-hash"
 - system-override-sig"
 - system-override-sig-tls"
 - system-prio-file"
Giving up at this stage, don't really see a good way forward.

I will post initial patch updated with comments you had before, in case someone else wants to look at it.
I do understand that you may not want to integrate the patch.
/Ravineet

> >
> > Alex

