Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A979C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 13:30:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.33008.1642339830034711197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 05:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iAlcg2t4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80157207cb=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20GDUTSt016043
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 05:30:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=GN8EZcsveHP9LfgWttBzFaGSssuDGFE844bjg3Bj7xk=;
 b=iAlcg2t4B7tZBV0yasPLndVQEwHFsACbdkOh9HjjWA3UAGT+9JkJrnuiOOttbE4rK2j1
 xu30wLXCDLMcM9FhwYN1HKHle9RLpN1kp/KH6hbskN1D0M8UWWZjs2HIzqxpu7KyuHUV
 eUC8fDq0jjKjZrSEZt7gVYXj7QKoATBQm+j2QpFa0s8pR2P6ZsgKK1Z2oOBnFOnHdPYr
 gkDIuu2gv34rhQ5HMBmpUoZ5rnB1iJWQ+PBLCO5X7KAbdNmzlXuInPiISKlbFg+ayc3U
 ZdvppmVqJ/KkXPoIo2UA/Tp5KJ8jNWfGVZ8YXJQovBElmOTJ2i3qxsxYtZJEy2C0lh5n 1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8h4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 05:30:29 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20GDUS6k016036
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 05:30:28 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8h4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 05:30:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRrji6hCfki9ulkZVIIZNKN11Oo63bDBmnpjBL71UjhpubEaBNipetgJW110+4AgkcqkO3tWKFiqj/xU85mQJpmxuNHHhL+ML+VyW1TExk45zvrJFY7tZLseSpKaCWPou6hMr+RfphpcMEbWcNo+ieBpEBKRcPp8LOIViuBDc6r42uFR2DAQGZJnD8dtenRYY42ZawFVzlH058cxnX3sumOzfgzItq/cv7SjJzs74v127rLiqkCa3yeMwXXgr9cJn4qlxeLxyI/++K7MEyKfsiZBRl5PDvAsSv9Xv1oRNlvNjcOL8NcfzPhFpVDLuQjS4M6evrGSWDONeNwMYVTgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN8EZcsveHP9LfgWttBzFaGSssuDGFE844bjg3Bj7xk=;
 b=FbhTASOiphXSyULBohtqyP+9gUierL5X6KJ3bosjzV0qD/ayrIebB4Yy9vT40wrCHZwBQKyUlG+f8RiNnMdAFE2qypozHGYLLFc1/7+YKdvWb3AZgzYA2rnIDtz4Vr47fpdMcYGyUunaBHnasfZTzL1OmNLmWdfRJMaf6mloWp+BsbQneCiatk6fzAkmmhgHMrW9sZ5RlyRIN8uIDPC1wWSwAPMbSiPrs4azZhfKW4qu133QzzJd3CmvOMU5ehajo7oMensChR2YEaHDhFJh5Za0zUnNPG/fF+ZLUncZppy0iboc24Jg3BZFBe4hks3ASNpNmZVrXlV/8wYB/6+PgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BY5PR11MB4403.namprd11.prod.outlook.com (2603:10b6:a03:1ba::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sun, 16 Jan
 2022 13:30:24 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sun, 16 Jan 2022
 13:30:24 +0000
Date: Sun, 16 Jan 2022 21:30:12 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "ross.burton@arm.com" <ross.burton@arm.com>,
        "jdmason@kudzu.us" <jdmason@kudzu.us>,
        "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [hardknott 1/2] tune-cortexa72: remove crypto for the
 default cortex-a72
Message-ID: <YeQd5K5UNg/2S8iW@pek-khao-d2>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
 <20220115023747.1154635-2-kexin.hao@windriver.com>
 <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
 <0d85a02855799b6b26757e4e189f7b8b301bbe26.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DyxI9V4NXNbA+zii"
Content-Disposition: inline
In-Reply-To: 
 <0d85a02855799b6b26757e4e189f7b8b301bbe26.camel@linuxfoundation.org>
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4f9fda-c0f4-4906-efc2-08d9d8f45a07
X-MS-TrafficTypeDiagnostic: BY5PR11MB4403:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4403AFB3C864D9A8F3814776E2569@BY5PR11MB4403.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	njTNG5QCywH3V0+Ra3A1DdixeqMkJC7fotPYFWB3rGVyPZzw71nUb1XMzVvDFUsFrNCatC178XyH0PxTyjpfmTA97DhmoljbsQl1Lu3nmjKHRmtT2P6lwfvrgAlAk17sSq5evkD24n2/q01RtqaAlzcn3GDpWlgCEwOp6vK7MTeK8XkllH1960OGdj66p+IvPXU8KwoOpHSX1FTpnNf674orEZqI/csWn/yRecHEer7z5vf9kbl40UOslSXu7XdTZq+ynxBHMaBskVhL2CyELaW82HMGHCw1kwNOh4PFmTcvndp9Cv8rX278CKfNxnYtA70kv+EjKbpk/6SsCbChvPuu500iovGxdQlGi641mbNkYF/9pSkroeha7ARujig5XzdVe+27JzajKJ++y0yg3VEfITCAu2U2F8dIxYzreBsj+Jj5eMbpswkCBXZ0vNDINcfVO/rvo/43bdlwtbSmesi45/hqO9V7x2FRX6OIetxVj6F9JiwRCvDcmtEHz7IgX2aSAZqv6658pHFwoOQP6XfulW49ZrVEVnet3NDN9yHX6dv5eIj2T4nfSdjCVelLluUGdA0UJIDIDogSkpzeOA1zXF9pwadX6jOQSA8bWNXubcIWZLxUjVj9jf/nvu3qtHg6yg4SDu/14o4hPSk3Jrdppoe8tcSTDiizEoHxexSUr+3pJkm4kO1qDRvj1OTNFHPXUpmm9u++ZfVyQNc4jyyTNGOBC/gwLrq/D5WtVf97OO73GoZq3Vd0jZvHaWJg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(107886003)(6916009)(52116002)(8676002)(66556008)(66476007)(66946007)(38350700002)(6486002)(4326008)(54906003)(316002)(6666004)(186003)(44144004)(21480400003)(6506007)(26005)(508600001)(86362001)(5660300002)(6512007)(8936002)(33716001)(9686003)(2906002)(38100700002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tCGL3zj/42qE/7645tm0WcBq+6QW2RWgSng95xQHWsO841AFJEa6cj2CysOi?=
 =?us-ascii?Q?PCo5JqU5EoYmwVvD0aavZGMFm+SWgGsGUEpKRz9pTEb6fYa+JhgTldKXH6mH?=
 =?us-ascii?Q?zvJeJEMPCbTaSDuKLv/z/HjO+KpUL2AAz5UonSWuoRrTzIeZmuvgjRpK+2AX?=
 =?us-ascii?Q?fRYxWAxXQseqNt/wyBu9wrKz6lCL19AUNDlZtnLNSdLNskbDSYO6bLYnsBwq?=
 =?us-ascii?Q?kW8oKK4sN4Gt+jwuAe9Mnky8xcQ3FyEeRs09rjs+bUXWG7NV39bTSvAOxCpE?=
 =?us-ascii?Q?4p1f0CPtrWKyxsUUNwjsLQenPMn4voKbUBn/cjFHiwcx6rloWw4qPglzxlP9?=
 =?us-ascii?Q?0/bEioyGR2OmEwxxezqreGREaLx2f0vPe32IcbQJ1+rdsMmjoJqnmApSanDp?=
 =?us-ascii?Q?fa1NBoV9EH/RFfNsGwdu3LY+lN4nctkvJWDIAySr3tDCUCNgBSdMWmoijxiX?=
 =?us-ascii?Q?WxwrtLJ6MP1fgbTIUQLr4YKq0GMamZ6fa2t5heDbPZRHdLuXa5aJGC2gjDIJ?=
 =?us-ascii?Q?A+Wc2+N0k/t0Vud6JpAfV67iPUKr3zj+0ZeFYRM/ZhYIu2qqqtfdern+kqK+?=
 =?us-ascii?Q?I66k62bHmZPuAowcbiAifyCJnh7uUpQzRP7PNtcDKuMMXiedalyGgUIiBgAt?=
 =?us-ascii?Q?cR4xjdrmicpG9JiQ3iw0ZBQPnnjXXagt6norSyGHZrLG7xvnT7kAJyMj2VgL?=
 =?us-ascii?Q?hDe8+4pycgYIknplg/zNUtxAFXFm2Cf3+zP0wiPquvoF8md+G98nbM1XA37Y?=
 =?us-ascii?Q?yEEtVEljbeNCqF9NOIvfD9bGLZAYi/YTsCqMl5uA1Mnfv6Gx0Z9DzEwsTOrY?=
 =?us-ascii?Q?IUKaF1jvUiZ+NrROF7wvA5Cuz236/JhVBEsd8C334YSax+9BauO600KwfV82?=
 =?us-ascii?Q?85Fe5oREYsfDfOLAbMDYfIOl9O6fmSRA2UhBMSFpcQTr9p2hTOYsBe7tiTt+?=
 =?us-ascii?Q?jrHTyx+T54MoGu8EFTsIz9H3T+q8NElBQ6vbUGSm0YAMxZac0yS2D4QeFs3v?=
 =?us-ascii?Q?DfCNwOTn/VQeHW4Sk91Cfh0l1XQlkK3EqiwBWXVQTjMf2moeqwE2hmH4E5Aq?=
 =?us-ascii?Q?HfPPvbeXfUXTkz8G1kRGLSPvR/owHxb9q+hpHfM8ZX11EDq75ak5MHqRdoKB?=
 =?us-ascii?Q?19TCaj00Qs/hlUg/lk5GasqQpGEdxK+OSy4zbW6vu6OALxvRjltBakfNgjl5?=
 =?us-ascii?Q?Rw+zu/5s8CCh4A8S5FKqYRDcykiceQNLMRC8FZF+cPh+5Tl8OwBHamW2Tfyk?=
 =?us-ascii?Q?It/Dka4Tdx+JxB7DD3aCqA2aTO5UFm07L41ymUJHcxtLsr3K/pDOmMRpylDi?=
 =?us-ascii?Q?vq4FZz8Pm49jqRazud/KINI5B7MCZ+AS7VQxbL70taPk+F1nKiv6wsNnAmxp?=
 =?us-ascii?Q?MNkvdZdCzh1cUhZR+0Y1OzlHE7AUMJWACCUKSHRgqSAZQ/hvDj4yUiuSODJX?=
 =?us-ascii?Q?iMuN4GwcopeY6AthHhXYUl6J/mApZmafGcSG07ztDPb+K8bgikfQcmdm613N?=
 =?us-ascii?Q?W+Uzr1Lz1ZdRQI1wrg2YDjcv4BIvtpUd0eLTNr59oXeniLyW0enQ85XCPUAy?=
 =?us-ascii?Q?zTnHt4hko5ICJytnup2pfIx6fYXkivsBJuBcFO/evTg97Zzpk80iALm0TT3C?=
 =?us-ascii?Q?tIjDN0imMEfCyHszGVo3uws=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f4f9fda-c0f4-4906-efc2-08d9d8f45a07
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 13:30:24.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5j/p9dchFArOOBZcsjh6kfbEqHp1Nus6uLG+7DcOmbZE7bmdDlKBJIBeH/u68IclkpURlHbbSVOWW8vqvzt+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4403
X-Proofpoint-GUID: v2XIQQoOMlJ6LHsGlfmt2hgbpcoC6xGx
X-Proofpoint-ORIG-GUID: BPkYi72saz-lssXtUcofav7oioL5splw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_05,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 13:30:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160605

--DyxI9V4NXNbA+zii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 16, 2022 at 12:01:16PM +0000, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Sat, 2022-01-15 at 02:53 +0000, Anuj Mittal wrote:
> > On Sat, 2022-01-15 at 10:37 +0800, Kevin Hao wrote:
> > > From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> > >
> > > The cryptographic unit is optional for the Cortex-A72, but it was
> > > included by default previously.  This breaks building systems that
> > > lack this functionality when using tune-cortexa72.inc.
> > >
> > > To correct this, add a crypto entry in the tune file.  Since CRC is
> > > optional for ARMv8.0, do the same thing while we're at it.
> > >
> > > For platforms that had been happily using tune-cortexa72.inc, a
> > > slight
> > > degradation of performance will occur using the default.  To correct
> > > this, simply add:
> > > DEFAULTTUNE =3D "cortexa72-crc-crypto"
> > >
> >
> > I am not very familiar with ARM tunes but it sounds like you are
> > changing behaviour for people who might already be using these tunes
> > with these two patches ... That might not be suitable for stable
> > branches.
> >
> > Perhaps Ross, Jon or others can comment if this is something that
> > should be merged in stable branches.
>=20
> You're right to be nervous of the change, I was with master. Having looke=
d into
> the issue, it is a serious one and probably should be fixed.
>=20
> That said, I think there is perhaps a patch missing from this series, the=
 one
> which removes the cortexa72-crc tune.

I dropped that patch intentionally since it doesn't fix any real issue and =
may be not
suitable for the stable branch.

> I think this is fine even for a stable
> series since the patch adding it is also in this series. The patches do m=
ake
> more sense once looked at as a whole,

Faire enough, I will send a v2 to include that patch.

Thanks,
Kevin

> we just didn't get this quite right for
> master at first.
>=20
> Cheers,
>=20
> Richard
>=20

--DyxI9V4NXNbA+zii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmHkHeQACgkQk1jtMN6u
sXE5Igf/SUrJJA2DVbPXAfu+U3N+Y+WXShSyteGsjWUvEKuXFWcUjdPcoGkpBuc+
pnVBYSyqMfh59cogS7w/YFqsR7g7YXjBqX6s3RR6ihObF5Ea5BughzqiIYFO15rp
Chjybj6MtDkS4F4AGVJO28oXMqx2FVaww0z5hhXqQzGNgvX8vYXJAEwaLZk5MOfa
ZxQMHAPpT4isvxF1mabs2u/3kgc5kUvRvwQmvllVH9RIr76tLtn9e5dAhx4njGim
DC4F1XtYBMcjA6j45ECu0NPcetF0BNA1nlAPOeHLZQ3RHCrkS831x5lndLMrbJB/
L0oDFQbpbSeV2HuSSj+oIFN03iWqnA==
=7E8U
-----END PGP SIGNATURE-----

--DyxI9V4NXNbA+zii--

