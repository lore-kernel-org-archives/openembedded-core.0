Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C1CC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 08:49:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.95])
 by mx.groups.io with SMTP id smtpd.web10.36575.1675068580040731943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 00:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=U7jSUE92;
 spf=pass (domain: est.tech, ip: 40.107.6.95, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeT8JCZfpU2dLZhA1kFOl50P3MYVrw+OE79mRqlsDSp74KkMSiAZQkTh+A+QWK5r/V5hxEH6gEDi5dFrpcWlTdJRaD/5OEu4uvxfnAjbeg418J6EuZDFC1jO69HjaJirQDkE+zttxJhFPAbBm7bsReMjLY3mvX7dUMImOlnYY5M2UJFApRYWq4XcotACKZVMLIHx8bzW33QZZXdQbm134CEEBGz7vjJHKu79P6BwWYdJRSP2ybddYHAtKeKiAPpBlRiPTKE1+JqaTQfStI3veft5P1C4DrNqynJLzSnfr5pUBSDJVsO0AwFQ/PVJEF1FdAu/XhiW/KAJMEY5ED6Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBKshvodc47Jziywcys+MAvK9AzvdKor/LjfW0ekv/A=;
 b=S4fKWfY+ZmKmlC51wLvNYIuAOT8Asq/l5EKZRvYC+al8G0YY8j8z2T21O+N6cJZTwKr8JmJmIjLzelEcwgHWWWfMkO42bWGH/oTsQaGyLcQR1DFBD43YFaiJagDbt3s0wY4MGWE2Rnv4JBpjwQ/n4tHmDEa8MjYOmytnoD3pVeQyPTMJ3MiIm87+x9tekO3FRAX/9KrpZViCAiFQZqoLNBhr0GiytHq28tbx0qYFZttnzAzwt4+1QPI08UsHFnY0xjCtIb81an5yvbWFbYP54VSbwM0S+gMPWxlG83AW68OCoin5h7gp/QuRCfbCvBzEwlkrCrUGbPcLLI0Rd74Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBKshvodc47Jziywcys+MAvK9AzvdKor/LjfW0ekv/A=;
 b=U7jSUE92nrLoaUY2j/GOhGCzJ1AQuwrDPC2firX95agLA3S4BvoAWr6ZPag0JUn4zD8OeZZP8O+/ON7EYxsQpf4tabj6H1Lvs3CtvUjWrLopgfHnB2HuwGdZ+1vIIcb6ELmzHP7xtJbdX1+smsEcmCwpPu6Qm5trXrq3/DHo9u4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by PRAP189MB1946.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:295::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Mon, 30 Jan
 2023 08:49:37 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 08:49:37 +0000
Date: Mon, 30 Jan 2023 09:49:34 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
 <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
 <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
 <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
 <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
X-ClientProxiedBy: GV3P280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::21) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|PRAP189MB1946:EE_
X-MS-Office365-Filtering-Correlation-Id: 318762f4-6fd3-4c60-3f9d-08db029eeaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dnc9IaBi7+55M4fdCROOHvRk6Oqu+g08kuw+WJy66k9Z039uCv3cQ24QaEON6/kiWoD8rQFjw6JWOkY87N01xeGKPqm7k4Cr3d1CSqFfDd3jNSAp4/prauEExwSltdQ7QwBmXiErM2nRCf7X27cQ6ArOzz8zFxmjN+WiC4mv9qbjPDG9+FxKIS4F0q4EOTZtK71hdnweFJDSKRH+DzvAkLL7FKMKPe756oi4rXLpPnhITfqOCwTAXkPaIs2yHG+2/+dMFiNOoslH1S6FJq9i3yQQo9xr//vIm3DJypUSUWNOpfdE9EOwH8OmIscGMancpdG5EkKoQonhzH68h5PEinJbdMzG7OyUZo4Q4Au3XWhLXcEO3F7rrNivMg7Tu0JOHQYY9M7fs9wI74lC+8XIDxd6um22XH0kGU0n1QSTmbAxyIQ4GiSpD6PWhSys3Kr5llRp0OCdH4z95Vgi6xDQK+S0QF85oeFhwv7Ba1zSHMr99pvGgxBni1xn5MlpqLi5B/DuQjyWnV+WkLuFaxNlTIpFM92+A43QWUC2JdBfEm4t1o5Jj/tEqf9isFRvmctxJdMnNTHmx2xD/w5Lw9eUbOp4yyDd5Ujj28tCZSw7h5O8umSAtSIfZhRvkvEsHTbGISAAmPEmpWwXi18QoD7IJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(376002)(136003)(346002)(396003)(366004)(451199018)(38100700002)(6512007)(2906002)(9686003)(26005)(186003)(6506007)(1076003)(6666004)(6486002)(478600001)(8676002)(8936002)(316002)(6916009)(66556008)(66476007)(41300700001)(66946007)(4744005)(4326008)(5660300002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z3aYSGTD1eXd598dB6WsyRiM0/atAJGFpJz9eGb89jnE0q4mdRpW2BkTdgLO?=
 =?us-ascii?Q?g8HD9u60X4zVPrbfwfoI6IY6POX/ohZgUKL/BG1hsNb89vmV5yJp5Zy99diK?=
 =?us-ascii?Q?BNFOpvgWavr9ZnuIs2juXe7v/Odb8dFna9wDCiJlmE98x28FQYtjL6LizN0l?=
 =?us-ascii?Q?Z7mO8UMqfdExaiK2s4hl19oP8IsBWL9dziagH9FsDkQyj23QTScnLM9Fb+ez?=
 =?us-ascii?Q?20BLn067Kffk8AHLHWzjQoHOwNttNQwd7JCDIziXeoVmSk7y5Ut/2F1VJTfy?=
 =?us-ascii?Q?SL9uh9Dk1iUY0+Lpi5DxN6puQUeEtxJYxV6U8O3hFZ3dEYETN+wTTSzG4kdr?=
 =?us-ascii?Q?wCOxuL9HQE7oWKw7X4AiwCUl70c+BK+5U+jlVVCzKlowr6kxAox8BwloL7qI?=
 =?us-ascii?Q?qu2uhEAKKa8SjDA/nj3ZMZv+8KzxKppxwYQNGz8D8I206y7HmJ93/VPlFXNk?=
 =?us-ascii?Q?HT9J1tVOCpY6rPrJw38YolNU50jYsARaYII3NyfCV5bAtOcWYaxZJ9h+lEi0?=
 =?us-ascii?Q?ZvzxKvzQCGMvA35N2NLJ5F/dutZm8zZdO/GE2Ei0XwUH+fnHbEipxvdk03eN?=
 =?us-ascii?Q?0LZg/MQT4AsG5MTdHVjzbCv6NGyjg9U9z4E6wOBe0VGTENWhODghit6MR1xH?=
 =?us-ascii?Q?G3kaXGuhVTTlGbHEErYgnqUwsM9krBvRg/cki81T1UyJUpCzUomP+VD20kWz?=
 =?us-ascii?Q?6yoEdJ8BzYRTdcqPDYODXE1tPcLp0DDl7jZpo70OI/ZVKKqh3SE67uHF/ykr?=
 =?us-ascii?Q?Dr2PRqr2FhlW+uLXDtzrhh32uC44xLh3+oXrhjeuJURyB0QCDV7GBNplV73i?=
 =?us-ascii?Q?D09eOnWlU1JbGCv2fszENpPTx3unS/vCsW2bwpc9/kqSc529eMGbHGE8As7N?=
 =?us-ascii?Q?xSJV8jDjGc+AI18aLQ/yByRy3iZkYDcwCz23IVkoEKwadXtZelYCY75xVuU3?=
 =?us-ascii?Q?htz+ZxZjaNI3cP4eAnOa4p5Beudb7BTY/ycnOFRMkJPhX9OE7DgwK+siVubr?=
 =?us-ascii?Q?/ELirRkZJj44zQgxkT1a03cb68i/EwfqSwGdsR7dOioFmtzxrpNoSSbj7uyp?=
 =?us-ascii?Q?gev8ze3DCmYhFWCjrOGlyr36xtSxMHFk7Jt7vFSewnbD+hI33MPxkGksELwk?=
 =?us-ascii?Q?puOXEyou4sNoE8Y8tcjRY+Kgr5gUUl5U9ntzC6QTK0q7/HfhPLw4LHc+62HX?=
 =?us-ascii?Q?jd/7R623qd5buUAxCpNxLDhiZafw5swtgtMmh5VzBb4cSItItX7kLwIC6f2o?=
 =?us-ascii?Q?chWBs7RcY7OL/8nveI8lRCFm0iMe9aoScBsaTXDAHizDMapptu2a8UeI7sxH?=
 =?us-ascii?Q?HCVMVYrY9WItp9OLHFJ6wt6d8D1wdXD8vi78xfz/H5sh1S9r34gzaozH4G9T?=
 =?us-ascii?Q?1phRpcWZ8DVQ04pBGn+HZzNWLWU0VrQOygncdIrk5iwLsLlSQjSD0aFUJclV?=
 =?us-ascii?Q?p3T/Bf+517hP+0Wx++i/sQZyatfM0cm4V0j2mcHemsqo7x49qAOiNbSkdvgC?=
 =?us-ascii?Q?PZMU1X3tb34DNkTxfiwACJtI56hY1O2kQold2t5BQ9QGXKmHpB2lAovbeNv+?=
 =?us-ascii?Q?dA1pxNTGNBGWWyjZfURDFtlZAud4ftCkgxeIgPRLNkvuMJOOLFs+bCoUEes3?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 318762f4-6fd3-4c60-3f9d-08db029eeaaa
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:49:36.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SM+GAbRTuL+4YUH7grM52uUGW4A/CWagrEDo7SBNefyBcZIgBoForTtgRi6G80lYejg93l862jrZKzhTRGMyykHByM9FJixIqqpWgHbdEug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 08:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176482

On Mon, Jan 30, 2023 at 09:31:27AM +0100, Alexander Kanavin wrote:
> On Mon, 30 Jan 2023 at 09:25, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > > Can you also try to determine what are the specific missing items
> > > needed by entries in test_disallowlist and see if they can be easily
> > > provided on target via adding to RDEPENDS:${PN}-ptest?
> > >
> > Well, these are not package dependencies, rather local file dependencies (pem files, etc)
>
> Those local files are provided by something, so you should find out
> what that something is. Is it gnutls source tree itself? Or some other
> component? Do we have a recipe for it?
Yes, these are from gnutls source tree itself.
I did not want to have the logic to install these files in this patch (want to keep it short),
rather later as I progress in my learning of bitbake magic.
 Ravineet
>
> Alex

