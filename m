Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D9FC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 07:23:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5294.1638429817377934916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 23:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rYe8Qv8B;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79705ebf0d=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B27LZdt009893
	for <openembedded-core@lists.openembedded.org>;
 Wed, 1 Dec 2021 23:23:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=sMRt2W77JHsAW9QIHqJY4q/4zhBLtbDsv1lKjMH4cGE=;
 b=rYe8Qv8B7fpvqHgSrdIJu2laeCU6XLa1Toe9GiN7GpmjHnX+h5zCtGqmPZBj3PYHw3uF
 Hp27Y6d63oQUN67zRerWT+TLL3LGBqnJxgtPyCRnpXwf2IZPhtHJ7ERvlcBRSZBdLYIE
 JPugBLWEcgnkCoN1UmwsuohkIR5oMMjhjLEIoFTCF20omFnxAh+pCbt/91LA32+2LL0/
 57tuvXvpXBECqdlm7K8IwDMQVnWoAwRilHcyS8XFGiS7W7KsRyRxibVwwUrmXFu4NBmU
 IFuKUYHnnF60noqk2YgggqlzCmdcxGglWgAAFH9juMT3/t52nPj1g+SP+w+1bJD70VZz Dw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp5nyry4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 23:23:36 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1B27NaWU012556
	for <openembedded-core@lists.openembedded.org>;
 Wed, 1 Dec 2021 23:23:36 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp5nyry4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Dec 2021 23:23:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJXm/vktob2fxyfvsY1kupHXuVx+YeWC0uUGiGumTwHshVB8vZTceY4RDKHTb6fvbj4m1FMEJgZ4siKPesCuW9wZgPk6e2rxL6hlgcBESg94Efw3RQiA/WWWNr84w5NDBdSkHCZi0tkWb99RnByFByOy4F9eV9ZCatwGy++olg4L7zQVmMYBhez22ShFqyhnMqtiBMWaEWkIEk/UHJ5Rx+W7sJQUcbUtYH2YkDiCertjbKqMDkDN3sTjqGgdGiGjT7xNw5AEEtuodsLY9ibghbJBM/EGIWJU029WtKaAEGVD7EDmuqR+lzKRXYdS9IBithMSEYKXR41BKm37/aNHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMRt2W77JHsAW9QIHqJY4q/4zhBLtbDsv1lKjMH4cGE=;
 b=CKpBK9vaZkmL5L0+qMcnER/DPKXz+2AIPy20XpRyaX3sYstWZDDOXLdmM2xwSnlxRhmRidNKwNuLX43poXoPSyI6nX6VhvRG3kelqYsIeAVOyPyUGLL3Itvu/VCNv8oQ0m8xDmO+ILJTYFkKpxiMpgccMFicBHMFuDwaKlPCOXyFpUs1SE/xwYz5bIENs1obfoOW7aLrlwNL7QGSIAlyAIY2aYwnmRRUztchwKz+AuuznwEUmiJdS4g9pXlhM6QbLnIUW0YvjMDYMZE13x7fir9OobMsHctK/CJ4NNGJIjZcdKDbqYrQqIlGXBW5MR1NfPTRH9b/a+XXmiSSRKfXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SN6PR11MB3247.namprd11.prod.outlook.com (2603:10b6:805:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Thu, 2 Dec
 2021 07:23:33 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293%3]) with mapi id 15.20.4649.018; Thu, 2 Dec 2021
 07:23:33 +0000
Date: Thu, 2 Dec 2021 15:23:14 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Linux Yocto <linux-yocto@lists.yoctoproject.org>
Subject: Re: [PATCH] linux-yocto-dev: Make -dev kernel work for a fixed
 revision
Message-ID: <Yah0YhJFeqv7gRrU@pek-khao-d2>
References: <20211201043934.3212357-1-kexin.hao@windriver.com>
 <f2c3aa7c59a874f99b80d49bde596e93664a5392.camel@linuxfoundation.org>
 <CADkTA4N_zXDJVH8hwZMVqa+tsHvrm4zD+UDKiYV4qHwu4WPx3g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yHZXFoKT5fTC2WMz"
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4N_zXDJVH8hwZMVqa+tsHvrm4zD+UDKiYV4qHwu4WPx3g@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
Received: from pek-khao-d2 (147.11.105.121) by
 SG2PR06CA0246.apcprd06.prod.outlook.com (2603:1096:4:ac::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 2 Dec 2021 07:23:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e972eeb-e823-463c-fc7a-08d9b564a5dd
X-MS-TrafficTypeDiagnostic: SN6PR11MB3247:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3247F7B0389392B89C2B941CE2699@SN6PR11MB3247.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nUbxF6ZRUCDP8kio66EQAdA/vx4R8hZkrdBsogA66o3MV8s5ntjhSyEwX8GwZdL3uGTkObXTUpD+s4VtwT8zju6fbT+OG5NBwYDaocMcHPJcOeqiCmP3Q5VmzfMD3vZEo2WC55Rjw7S1Psuhi3Btll7aCCJHCZGKZozGydsS18kd6LnYGs+LoBNbGgP7TLqRgx5xVqJ7og6JTx2IED+XJyikzGOZCXI6mcBTv9yDbGTuMMyr/gfsfXgSThWEIUuh/yrFHRlYV89dnd7OYAJhqWXgeH1ThC+1DepY3VvUXDEf4WSiH3b/g1vhhKGieFB/9B0dHD2x2RJrlsqb5PZs8M5CghyVQN1yfu2iANaqgj7QLTlirGIBg448f7Js5vFCV8pEvAARlwPjv/SpZlhPO0NDviZKxHKWyeXIgecqHxJbod/vfiHeUmYqznmEgC14D3l4JWKMPzP5wvnaECLpzfCvSJN+OURCn4QP1K2PGIU97TJoHBm42ZiIlQIbgUHWkyUmn3qc1hyoaJQ13OVtC7GqBt4LhFDnrHtA7bsNLAZ1wUA8ux2z9J1qtknJxfr1sUDUs26DIDhZDM5bjUHpiVBtjn42/5mvMlOQgntqLpndHiCTH6QitB312r4/wZpNQcgxu0AL4XWx9oxoENcjZF9c5sMPV+zJrBW3HZP8woODCUVHerSCEwUwzZwobK1tVo095fEoYKigKRVRohqxC66mb/M7ceKE80u6WfGTIOOhj2Ef03gCr6btOk+MV52w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(8676002)(5660300002)(33716001)(52116002)(53546011)(55016003)(8936002)(38100700002)(956004)(86362001)(38350700002)(66946007)(66556008)(4326008)(2906002)(26005)(44144004)(66476007)(186003)(6666004)(9686003)(6916009)(54906003)(21480400003)(508600001)(316002)(83380400001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y8kZpRceLYyE7fHh33cRcJ+1XeOUDtUEhO2oAcm1NMNOntad94Oxtmc5uCq4?=
 =?us-ascii?Q?8kofiY7rGU5dk8S3xH9KfWzyMniDJ9I+Zfirn3/roqaQ87LXSk8Z571SJLcJ?=
 =?us-ascii?Q?T3f19/1nJBG3aRgmi7IljghAMxsSNODzutgtKMZjN4KbCp7RAzpvAlsG34UC?=
 =?us-ascii?Q?ZzGbyfp496posq6t0gWTZUyStPU8hfWNDCOl6SA0z9GSeXouCrcWTKnDrKQO?=
 =?us-ascii?Q?TQsm9LKb8IzF4EUjZ1AJ87Pd4Fvd/D5vm8DYkWXfOucsengk3kn2nuqtpWaH?=
 =?us-ascii?Q?NJd16cgSAQrmTCEKfkYEbk5Bh0+HYqSEI9dX5zDG/jfPvCZLBmKQmtSXGYC1?=
 =?us-ascii?Q?XBbStq3NH9WUBMqv2Liv9IsVVjKvrZC3Ri5JRC6bp7ByNK+IyEf9s6J+qA/h?=
 =?us-ascii?Q?o5FevAybffdIcU9s3jzmQbHoYzrTaBXC6Cvzw3/ccS8v0XkNM++RLYqnt0+e?=
 =?us-ascii?Q?HNxyp/8P7cpvpT+5wlfaiSQEcvWypu6CMC24C1rj2vdqFapH2tT0mZfbnAhP?=
 =?us-ascii?Q?owagc60fr+jFCs9Lk/eEgxUOHY3vFjs02Tr48NEnI3uIsAgxEkpjsbiuZzf2?=
 =?us-ascii?Q?ow8WOOoUooXZRm/6mwj0pXKe9xoPhCwHYoW4qRYcCglVPbq6wGZPrdi/YaFu?=
 =?us-ascii?Q?q4uon2KwgcLtTYSEzaHuCgAMcGOpE7COVDpBdlUKCngy4HAX2iUCilZ/61fO?=
 =?us-ascii?Q?VrAgamVsb6xUXSTPL71z9GZ0lXaD/xSs7Oa0ngWZ1eV6OCv6YpKiU8anRtTf?=
 =?us-ascii?Q?zMZeNFLKJWHgFsC16AhS2RghKdQan/1QpdmMrqP0nZ6NoBAti7/RuWsiLqVu?=
 =?us-ascii?Q?BstR0uXcKB0rp7Lwfty+X/vxdRmi26LydRxWLDXW0naz6c37T972A6G05gqa?=
 =?us-ascii?Q?P1tX7NcNHeNEDa33Phm4T8L3c6vAClpA4ueX/s43f5U4EVA2IGdlX4+DBYS9?=
 =?us-ascii?Q?kbzn0b/p50Jpf75/5FauiZoFXaoawkMWaBE9GGBue7LcL+y8gRKnQBnBxqr1?=
 =?us-ascii?Q?RXNL68SQu6JyBtnuDbTfcEfQaRJfyZR/wTHt96aVY9g8Wnn5wX6IYzTMCNyc?=
 =?us-ascii?Q?z0anDEvmZOh0hh2bEApz/tJfzGTynmeJnQhkgdprPYllVJyaucEhY9edcyjp?=
 =?us-ascii?Q?r0dJwlfR5E6NdBCQzd/E0uEC28gIokcF3zezBwIUz6js2XJ0v4uCVd2EBV+E?=
 =?us-ascii?Q?iQ+KgdHnpzU5xiyXMYBxchYGTd0llxT14LMlzkMK2CBI1stw0eyd9fm2vXm9?=
 =?us-ascii?Q?/zK3GCHzZP2rrK4HdV5kuEYhYbGuybQYYETH2kVjT2m5sGn5WNFNG93D8zU6?=
 =?us-ascii?Q?bmV9mh5WImbTy1Z9quvxavYQx4FJ0jAsq/A0oT7ijkffXOYFGqnpwZQaaJw9?=
 =?us-ascii?Q?mXS5tm7o6z4gX9UJuz7INUvmYo26jVms93HkGcPsCj/ps6fW3vAV6+IjTQux?=
 =?us-ascii?Q?iOHyIQI949+qOn8vBkUp1ECH2H439MVHL524DKDo3tTOYcce6T82BNsIQo6G?=
 =?us-ascii?Q?Fy2Qx4neEKo2iTYAvFlSl8vHtvOmc9cjdoA5mZIb7Oe2H/Q1BHZOGWG0on+I?=
 =?us-ascii?Q?3kTqzXaaLUlSz+xtazg4NPZdqUe0yxueSCTiY/AERrrKHFejrMzmDFlhotdy?=
 =?us-ascii?Q?dlP0JsQFJ5C+zBD8IHTHDOw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e972eeb-e823-463c-fc7a-08d9b564a5dd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 07:23:33.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jl3fGx5ihSliwLfcFQmZX6NHmT+uFSOPFHIRSiFPf89wePBrBYjgGdnA/m22M6KzsehpRK4szsWNgWzZQ0AYaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3247
X-Proofpoint-ORIG-GUID: AqaKAftAbdSDCws-9WtOKNW-mmbZQuIa
X-Proofpoint-GUID: ZYZjgX5Y3OJZLXGYbrZSeaguYcyA6KN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 07:23:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159073

--yHZXFoKT5fTC2WMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 04:27:44PM -0500, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Wed, Dec 1, 2021 at 6:28 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2021-12-01 at 12:39 +0800, Kevin Hao wrote:
> > > By default the -dev kernel uses the "AUTOREV" to pull in the branch
> > > head as the revision. Some of our BSPs are based on the -dev kernel a=
nd
> > > we choose to nail down the kernel to a specific revision when releasi=
ng
> > > our product by using some setting like below:
> > >   PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-dev"
> > >   SRCREV_machine:pn-linux-yocto-dev =3D "6fb48ae18a10770702266dd1f1aa=
500149e361ec"
> > >   KBRANCH:pn-linux-yocto-dev =3D "standard/x86"
> > >   LINUX_VERSION =3D "5.15"
> > >
> > > Since all the standard/* branches will be rebased after each kernel
> > > version bump, we would get bitbake fetch failure due to that specific
> > > commit is not reachable in the new version branch. This kind of issue
> > > can be fixed by setting the "nobranch" parameter in the SRC_URI becau=
se
> > > it will cause the fetcher to skip the SHA validation for the branch.
> > > And this also won't cause other side effect because all the branches
> > > will be created in the do_kernel_checkout() and the current branch wi=
ll
> > > be reset to the reversion we want in do_validate_branches().
> > >
> > > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/reci=
pes-kernel/linux/linux-yocto-dev.bb
> > > index 6b6ea9a7e864..7204c3eddc11 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > @@ -19,7 +19,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisi=
ons.inc
> > >  KBRANCH =3D "standard/base"
> > >  KMETA =3D "kernel-meta"
> > >
> > > -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D${KBRANCH};name=3Dmachine \
> > > +# Set nobranch to skip the SHA validation for branch if a fixed reve=
sion is used
> > > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D${KBRANCH};name=3Dmachine;nobranch=3D1 \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dmaster;destsuffix=3D${KMETA}"
> > >
> > >  # Set default SRCREVs. Both the machine and meta SRCREVs are statica=
lly set
> >
> > I'm afraid this looks to be a bit of a horrible workaround/hack. It hap=
pens that
> > if you specify a branch and set nobranch it might do what you want but =
that
> > certainly isn't by design.
> >
> > Either the revision is in the branch or it isn't. The error is telling =
you the
> > configuration you set isn't valid and you really need to set a valid
> > configuration, i.e. a revision and a branch or a revision and set nobra=
nch but
> > not both.
> >
> > I'm not sure I understand why the kernel would be rebasing after each k=
ernel
> > release? Is this because it is one of the unversioned branches?
>=20
> Yah, it is exactly that. The -dev kernel has always been a rebase
> tree, like linux-next upstream.
>=20
> Since the BSP work started against it (the -dev tree), when I move on
> from a -dev version, I've been saving all work into versioned branches
> ... versus removing them (and storing the history in the
> kernel-cache).
>=20
> That being said, we merged some code some time ago that allows the
> -dev kernel to automatically switch to the versioned branches, versus
> the rebased "standard/*" branches. (that supports existing releases
> with the -dev kernel as I move the one in master to new versions).
> Have a look at do_validate_branches(), but unfortunately the fetcher
> error will have already been thrown and we can't adjust to the fixed
> SRCREV.
>=20
> The issue here is the attempt to pin the revision (like Richard is
> saying), since if you use AUTOREV the code I just mentioned code kicks
> in to make sure a versioned branch is used. Nothing should be released
> against -dev, so any issues with pinned SRCREVs and branches should be
> transient.
>=20
> I've floated the idea a few times that now that versioned branches are
> being created (to keep older dev kernels around) I could just create
> the branches from the start as versioned, and then you wouldn't have
> the issue you are seeing, even with a pinned SRCREV.

That would be great if you can do so.

> We are in a
> middle state, since the structure of -dev has changed over time as
> more use for it appeared (and it was also created when even the
> linux-yocto branches were not versioned). But that isn't something
> that I could do until the next -dev version and only part of the next
> yocto release.
>=20
> But for the short term, the fetcher error you are seeing should happen
> once, and you could have a bbappend to adjust the KBRANCH accordingly,
> or similar .. which shouldn't be much extra effort, as you mentioned
> it was something in a release.  If you have somewhere that you are
> setting the SRCREV, why not set the KBRANCH in the same place ?

Yes, it is pretty easy to fix this kind of issue in our development phase.
It only become a big issue after the product is delivered to customer.

Thanks,
Kevin

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > I can fix the fetcher to hard error if both are set...
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--yHZXFoKT5fTC2WMz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmGodGIACgkQk1jtMN6u
sXFa9Qf/ZvgvyPkBzimgAj7OAqhDtCoDnVJjaVxiATQJ4DeHBYlIWZt1CfHxNtZ8
YxdqDnxxctHodVtBABp43SqlNkhkiHhNeF5QsDjp8Yoaqh2DG4h/wAn1fxDjWz/D
SUKgtjJUdlHZioFmYVdb3bLtOrE1cFEMLyNA85g0RpyRDahsYwwRyVC4yyTufgYh
DNKF63+7ZxVSYT1GuQw/wHtb/xtng5CWzjK2G+F1Lbr/erh03Xi+6aCT7rxnjEAw
pN/UHoHR3QsmwnEXf/hrVti/dEp7ALxyQKNixlPF21mWWy7hRSmznEfraJSgr3zT
OQUHAbFpkJbIhmV93abNcyIRAPTfFQ==
=RBjV
-----END PGP SIGNATURE-----

--yHZXFoKT5fTC2WMz--

