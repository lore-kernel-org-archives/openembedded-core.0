Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web09.2422.1610722050494973356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 06:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SVTLe8Pl;
 spf=pass (domain: windriver.com, ip: 40.107.220.82, mailfrom: paul.gortmaker@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhWT5xXYIUMNMmK82XTJOTNGj2QaUOuExmNZ4Pq/einGnchGoYDXRbow6/PzTbwFTljEt9r0m3yb+iB/HtAE6C+GO02xbfFxnzkfiLs+eYbdzMiXWYDdbQvsgm143yM2yZ/dock2N1lqXi/DVhjzF3NilCYviiOugTixFttcu3U7i4SUaaAr6zgbYeKh+FI985WxAcVZdvwM4iN7gO6b4RzCA3Q0kD37MZu5RP+I4kJV0FAKXVBnQLR7EhQpHSSgqkItl3korMejCTU8xSRin92r4WZrPv9ngSr56Bfo34qR+8c5n2nGqYCBJOMyUvS4+rZ5e+oDUAiXIvtFqyxWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJUfVEbC/ZApgyI85mF8KOLuaCd628KjU5mDGsuCCzE=;
 b=c2ByFJWMWgG9XbMlsFAIta3AR/vmWXWBzY2IHaqKzzVDE8MIRfC0cnxXLVIEMGdl5aZOIVoWwWr9hRec6flZG+tXc0CJWkOUE9cI7mJanUxqgJGOamoxla9k3EQbMWYrei+AdWewAzUY+Sh0N2VHZOAKb9WRg7AESQ6DDvQzgxyeGLX9K7DZ2un2JnpESEuGyrl9jJRTGzFIR6YZRY39OU5P/YXJVptDVZuglEkxR39nOQCuvkGd+YR0b2h3bQa+KqFPkh6MI4ffYEMpJfvLJv56BvZG1QIpil74qIz/4fP9RBNamjU3iSC7F04q6Z72BIpLyRGpZwo9DdL5u8A8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJUfVEbC/ZApgyI85mF8KOLuaCd628KjU5mDGsuCCzE=;
 b=SVTLe8PlJZ3dZlBvUSmaSN1lsyy9UDa7WryQeyQDboceaUF9ue8C9BPpp/YaP3arBmIHnLIdebXQdiH+Wtbwu/EofcVetUTBHdJT7zTJ4Y1TOpNiV9u52KDk1DNY8cICn2hgXT1QC8rqZmVOwm9eUc/NnGikAcOxK0WCuYMjYcs=
Authentication-Results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB3899.namprd11.prod.outlook.com (2603:10b6:5:19c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 14:47:28 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%4]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 14:47:28 +0000
Date: Fri, 15 Jan 2021 09:47:25 -0500
From: "Paul Gortmaker" <paul.gortmaker@windriver.com>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Message-ID: <20210115144724.GM16838@windriver.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
In-Reply-To: <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
Return-Path: paul.gortmaker@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from windriver.com (128.224.252.2) by YTBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 14:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e94e50-e0ff-44b6-bf4f-08d8b9647aae
X-MS-TrafficTypeDiagnostic: DM6PR11MB3899:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB389974182FEEC37806F241DF83A70@DM6PR11MB3899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J4v+GtvC3ukH0nSOjiFC15oT5Mussf6G0XDpCoiaQ28GwMUlz8RRSb/f0q2+KCwfPhiA8r4Avea3M2XQ4ohdu42O2wnOm0BdSq5VqVXpllkkr69Q4J9uAD4jnnfAgQp+hJ7Ur6kf0hhNsIE2FiFjtI7ZvisjUxEzj1d0zHvDNpyveYyPs2Ch45y2B5PVeWbMnEGRdMQNN1J17Xc69Uf+hn/I2WQKN7O8+uq9XAFEqBzs9GKG5x5aoOvUztCfJDE2PahA/9e226/d62g2HVT47uomCf/snFgWiPmvOZ+PHhGrhG+ortHZPQIkNbyk+Qp2Lmq8ksSz/S3sOVuEbxdgfMz1rQaWkcy9CmZE+Cn523B23rDd4nzhhT0sPI97rzJSjgW/477uFVM9Wbm0/AlTDCikrXLM7KIsI6/QFjwh02D8gpVf+TTfknXTewPfcxaHOb+ttWMp04lq1qlAEgQFaaTyN2mMC6pD5N6wY1OsyG5YBnMaiGDZs0KddrxJygoubvIs7oh+QQqEQNMUdDo5fg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39850400004)(346002)(186003)(55016002)(66946007)(44832011)(66556008)(2906002)(66476007)(6916009)(26005)(2616005)(8886007)(8936002)(83380400001)(5660300002)(16526019)(478600001)(52116002)(36756003)(86362001)(8676002)(33656002)(54906003)(7696005)(316002)(4326008)(1076003)(966005)(956004)(192303002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Cga3Xk7/rEo0SeZjFD6mjR1c1olM5WcJGqMWikVYDFnahIL/Hhud6jdjL7ge?=
 =?us-ascii?Q?VepjylEDmBf4P7yndhtsAH33pzB7Qahs9n4t7USDAS/Ma8pYgENQoUaYEjCH?=
 =?us-ascii?Q?xEDxZdD8pFLq49DWS6Iuznikli8ElhscvXQfS+j06kSP6Mk8+ewKG61zTlPV?=
 =?us-ascii?Q?eZQNSz50rve+VHlAqAFBsEIKyR5jM9N7qFsBDf2PeIi5HeObP+aknfm3L/kx?=
 =?us-ascii?Q?uZCXbb0SuukrvEFRXfVXkzjTIQxbjLPzLeWlE1iCt86EyPmspiSy+0pXXXLC?=
 =?us-ascii?Q?Hc7yi45aH5/8F2bnVVmkYqtK5mYPuolvYGFCTMQjcyqceXAwIdtlphHWwzua?=
 =?us-ascii?Q?rVGlqzlolEw0u5ggtq/CBRua72Mv5jrqALJaQi+kAufWRkdamDVHgh8SLjTC?=
 =?us-ascii?Q?F0tvesN84x3OmnuG8DHkMZ13vtVViQ/H/c0jmdrjcBO1VslesWKquWU3o3Wy?=
 =?us-ascii?Q?QxCy93xGxY4nJe4NyTol8ogZ2Iv67IXJfGNrqU6gjP4kScCOnb/nlBm3qnQK?=
 =?us-ascii?Q?hlJGKEJMiROB4IkhnB7Qlly9Qmk1qvj1qSjqu3PlkbJCTaCgwaRpEUgEIdFA?=
 =?us-ascii?Q?8zwuRt25QcEa5ivhwe0zfwKIfdmorNWCV03ThsXYNNh973Iq9t5YOt8e7AnI?=
 =?us-ascii?Q?KF9KWiSOLUFZxqQGQYQWo1CaK5YNmuv2R7vfGgFKvfIfrg1TGPss5Ixc2wta?=
 =?us-ascii?Q?6aJbgvgSHfSe5alLAtLHIaIks7X6IIDjERA23zaQg1gYvIWdHeVQUV4Vc/CT?=
 =?us-ascii?Q?dpHLS7XArp3e21gBVik/n1NTmn5ru8eVTQ8e7Vt/9nKkkPu8vUXKDfRQuQxH?=
 =?us-ascii?Q?Yfn4tCtJqE5HnEKGu6bInfin+3WWhb1k3mL51QbvmH04hKAQKjCZPqZs3+wB?=
 =?us-ascii?Q?rZUTUohfdlH9dkWtLtqcAd6ePpot7xIIgmvaTUk3Vv+DVpfy/MK+i4LpkH+6?=
 =?us-ascii?Q?WhQKqvIatjFfrGMvhbkudQ7gYUojh9XoKrBo82cJLOnvReohndnXjOBTKw8E?=
 =?us-ascii?Q?GKgh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e94e50-e0ff-44b6-bf4f-08d8b9647aae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:47:28.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLMJ6pqDp5Qv1tB8Z9HPh9T3pEV2jc6vhf6FZ8WtR4/Xd8Cme6mHLlEKiwK8e0z1sSDVfMJ4ZC9ixbz5RB5QRLJ2y9gC0e3mxAH5ZgqzYzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3899
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8] On=
 15/01/2021 (Fri 09:57) Luca Boccassi wrote:

> On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > Recent systemd started using ascii args to "hidepid=3D" mount options
> > > for proc fs - unconditionally -- even though kernels older than v5.8
> > > emit an error message on each attempt:
> > >=20
> > > root@qemux86-64:~# cat /proc/version
> > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10=
.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > root@qemux86-64:~# dmesg|grep proc:
> > > [   29.487995] proc: Bad value for 'hidepid'
> > > [   43.170571] proc: Bad value for 'hidepid'
> > > [   44.175615] proc: Bad value for 'hidepid'
> > > [   46.213300] proc: Bad value for 'hidepid'
> > > root@qemux86-64:~#
>=20
> Wouldn't it be better to patch the kernel to downgrade that message to
> debug level?

The problem is that the breakage is forced upon older kernels, so you'd
have to effectively mainline that kind of "fix" to v5.12 (where there is
no problem) and then you could in theory request it for v5.4 linux-stable
according to "stable rules".

Besides, if something with root/mount priv. is consistently trying to
drive a square peg into a round hole - by trying to mount something and
failing -- it should be something that a sysadmin would want to
investigate.  Which is precisely why I am here now.  I think burying it
at debug level is counterproductive to that.


> > > +The systemd maintainer has dismissed this as something people should
> > > +simply ignore[1] and has no interest in trying to avoid it by
> > > +proactively checking the kernel version, so people can safely assume
> > > +that they will never see this version check commit upstream.
> > > +
> > > +However, as can be seen above, telling people to just ignore it is n=
ot
> > > +an option, as we'll end up answering the same question and dealing w=
ith
> > > +the same bug over and over again.
> > > +
> > > +The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> > > +systemd 247 and above plus kernel v5.7 or older will need this.
> > > +
> > > +[1] https://github.com/systemd/systemd/issues/16896
> > > +
> > > +Upstream-Status: Actively hostile
> >=20
> > The status needs to be
> >=20
> > Upstream-Status: Denied [Actively hostile=20
> > https://github.com/systemd/systemd/issues/16896]
> >=20
> > (so our tools have an idea of what status patches are in)
>=20
> Paul, please, let's avoid loaded language - Denied is fine by itself
> and conveys what it needs to. I understand it can be frustrating when
> upstream maintainers do not agree with user assessments, but the linked
> discussion was polite and professional and there's no need to call it
> "hostile".

Normally I'd agree with you, but it isn't just this one thread/instance,
but instead *years* of continued "my way or the highway" behaviour
demonstrated by systemd on various lists like LKML, for all to see.  In
any case, in the interest of not breaking existing tooling, and getting
the fix to our users, I am fine with it being changed to simply be:

Upstream-Status: Denied [https://github.com/systemd/systemd/issues/16896]

Paul.
--

>=20
> Also, speaking as an upstream maintainer, I'd be willing to review a
> patch that adds a log_debug notice to advise to ignore the error if the
> fallback path is taken. It's low cost and reasonable, so I don't think
> it would be a problem to merge it.
>=20
> > https://wiki.yoctoproject.org/wiki/Best_Known_Methods#Patch_Comments
>=20
> Richard, FYI this appears to be an empty page.
>=20
> --=20
> Kind regards,
> Luca Boccassi


