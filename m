Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F90C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 03:07:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3183.1642216039617023239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 19:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ENHg0ryU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F37JCq013144
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 19:07:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=HhI4U3ROlFv3q4Z5i6z1NGRhPU2js0EQJQCDZ7nl2rc=;
 b=ENHg0ryUIi5q+yAWALAyUlBQ8mSHBrY4EK45buOEfUtSZPHD5SUGTDjm/2u2qbS4ZeLN
 PxwO2SlgbVi7Os8VdEIC5qE8El8AoH5376b4HSy0mU2cj9dwofuS/0MhNIUOGWjksn8j
 RgnJBZKAPp6n4B6hHleSo5RWu0iw8JVbJ7USH7bNc+4w5yVYzXEz8rG8bg3kvms+/z48
 lMKj6EMEwa4lGSivn5K2HudStAZjCuJdeOpxxQjnim+HPtZklgOv3eSCpxrLL9jl6bzB
 dFekoGCEkN0Bzh24uluh5szSf/R1RRrxz/zCniOugNNIVcorco9s/0ykcvWqll0uXKAv Kw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkjq0g3np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 19:07:18 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F37IbP013137
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 19:07:18 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkjq0g3nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jan 2022 19:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQfd4GGtYC6Ih9D8MlJ1qlJkEYInIBiNxdHh954GwSob6BTfqbvwkN8pf6M0NTFixh+VKkhCUgM+Bi4K27WH8QoH/3x69u8gp+4EFSH9y2SwQElAtZ4wrU11OtCDcKWR4F7WGgseELYWKJJsjN6OZfdZYV37GtkO3PDZPmt97ST3xoFqNJ6Bd6+so0OxMP6W7wXECwYL8iUA3H6oPkoM0vonTQD3ugVb8R+uaT40luHrwBs4WvVGdGyPbCAF8t5iciCpZvB8Uqf+NNFvLmV0cxssgoOkPt9edjhGsrY1h/sjWatPoicoi/HVWqS0xgB3gGq0eJ9NNPlPowt+X37P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhI4U3ROlFv3q4Z5i6z1NGRhPU2js0EQJQCDZ7nl2rc=;
 b=e+/L9qGEH0r8wKgytlAxI+qKVLOH4pZZdVmlvEDV4JfDJi3QvGut13BA3qBMwoapPuAgAQ7hCHQz1+Ld/eTWc35ybSFr3iUo7Yl7Bac35ddfNjthbR/JANFxTNifqVmNYKRbG8pQ0F8usO0UtrAFXyVotDy8t+RpxGxqOWJDw7yhrbiLGrkq3uLnSyYm3vExUAz5eoC6OZwOkv2Y+78RY40IXdDhIUfY2W2bOyjFaBYmZyE2UUsOCS6sJ8viAX6a1+2fbUGfilffQRkZCQuG86DE2iXUVHbsJjsE2/+99fcEoOhu92LF0fcpxkBc5KP+zWHeIPywEs7VlMeu7SnmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MWHPR11MB1774.namprd11.prod.outlook.com (2603:10b6:300:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sat, 15 Jan
 2022 03:07:16 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 03:07:16 +0000
Date: Sat, 15 Jan 2022 11:07:09 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "ross.burton@arm.com" <ross.burton@arm.com>,
        "jdmason@kudzu.us" <jdmason@kudzu.us>,
        "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Subject: Re: [hardknott 1/2] tune-cortexa72: remove crypto for the default
 cortex-a72
Message-ID: <YeI6XVwwQA0/DIgW@pek-khao-d2>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
 <20220115023747.1154635-2-kexin.hao@windriver.com>
 <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="30Ji44G2TeUWqC4k"
Content-Disposition: inline
In-Reply-To: <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
X-ClientProxiedBy: BYAPR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::39) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5465222-c876-45b3-a12c-08d9d7d42263
X-MS-TrafficTypeDiagnostic: MWHPR11MB1774:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17741E552BDA3D0C4F4F5B00E2559@MWHPR11MB1774.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Ly+KJ14MbJvnbutlGDys+jYbvNOK9yZ2bDyK4iPZ+6v5cq366y+nOOfEUOZIeScNlkfj2WCQWwi2HS2L7XySr4/lnIPks6/hhn9CIb4pIEpCCpiSfcKdkDAwHv2OoM7T9CnGMu1+etoomP4lbTpp5EVQil1gkFwYuiut4ptEjZxG55/pk7gCab4CWyQlHnEI0Q3Xh4TLjLE3T3d/6M/N1jKm5trjazvX+apbkD4V4w7cjHoMdN1F05XrqkxqaSBM+5HtAm8oELZQTZ+fKgxX946xIW6QsXQHs3Q0d437jarMHckHBWiXii+/bYZBytcW7nx9W4103rLV/bVmW3WisRvhaJkP5DOHwPENutHaWYZ70mftF3J+yYmP+Ib+3fbjrOjeKcfxkAyjInhyuJUc4Ku35vNtbFjaC4dngjE2s7a1/mwPhfT9wOyOcWSlRHY/Tv9Repngm4V4p5PNqQXMM091uvGP3MIpsBnKZVM80w2JEwULs/0B1gr2F6R/zFgyLNtnj1obt1dnhf+jdzp0OSt6Og+92Pu7Jx1UTqhoMipsfTzpguY4E4nY3Khc1rGvwTbs4Vdc4Bu/t+YWJXeiU02PVyO1rLn3atxSVXn+Tc60oT7kHjFzviLF0Y1+fCpIxfNqrcujTANk/JNFGGcR77LGFpqMyO2vEpk39mn7KDx2TkuEbi+iKMwujkgxs8TH6DVK/Egi38MBsWDaIG2OBpnQLtPC59Y7QE6C3FWySo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(86362001)(83380400001)(66946007)(66556008)(38350700002)(38100700002)(5660300002)(9686003)(21480400003)(4326008)(107886003)(2906002)(66476007)(44144004)(6916009)(508600001)(8936002)(6486002)(54906003)(6512007)(6666004)(6506007)(33716001)(8676002)(26005)(52116002)(316002)(186003)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oQ+RCDw21mK3MyniHHS9UCAb3paOfItXf5BLWM/9+NCEJHXZNGHxNgwrIXNT?=
 =?us-ascii?Q?SmaXoMO/H+v2h40VkHqwTCGcyCD86N7QaP12IdpFANu7F0y+VACc4z51q9YU?=
 =?us-ascii?Q?z7GtDlz3fOvGIInDWX8QR2Wu+lJ0A4IjAH11vmscKUPz3YjIZQp1xg5nLgGL?=
 =?us-ascii?Q?bQ3EKw6OX8bcUnqYKh4FlpD/hJLuICqIpcv+EBOSrFIY61XuRsD6NsDn+1Rt?=
 =?us-ascii?Q?fGsDSIYY1IEQwgAG+NXEHZFhz7qk6Rbzlkscgl8XFVKMh8e5nCJwVvLnU3/j?=
 =?us-ascii?Q?Y/HQl7/q04oA0PvBaTA1s86cTNDFvA5JeddXXyYYFKaDZWphFcu/gdzs2u4/?=
 =?us-ascii?Q?DwBp4NEGwdwIINmEXYv+nrDw+Kc7azJ237fd2T4u0LHLTcD4jOTW/V1BQ3aW?=
 =?us-ascii?Q?fmTvXyGd7mnb1o86gAut5N0J+SzRfc8rCoUndBSGX8rEdk/npiQfbfNMcyMP?=
 =?us-ascii?Q?Q5Xg8WWMle9QJM/kX4jSItUA01/wtMbqLNST6elmdExE0rG/YXlsiCfvV6Vm?=
 =?us-ascii?Q?OsernfLYPHUBi4qUwvPf8Qegd1bKKzQubbUQMkg7GUoEnWujrSeBXaAidIrM?=
 =?us-ascii?Q?vW5v/zi0CVRXi8gXTpkzLg40/gNd/lobcYASVBTJLxKTya4dfa6mxBQxV3WR?=
 =?us-ascii?Q?eQIshDxVkOMpAravW1mzDaIqyBQfLT0r90NaaHANFChq/iz8dP4fGcIKXqB6?=
 =?us-ascii?Q?UBbdWiJ+kfHbU3bqLxC+fP76bHUEHBLkKw+y7N8jG0aJu43m7OLhaxCC2gYF?=
 =?us-ascii?Q?vYl+NJIdwm2g1wg260QRgUBl2HvIrkqJdwDPOLwLr51iqQQGvgqmhmWKnjCT?=
 =?us-ascii?Q?YRo6WaG9ZnhhJiG8pR5wUV1jVZXyrhXJONIjsTEPF20eq8vsLE10N7KRKhL5?=
 =?us-ascii?Q?dc3tWjSw6dkDG0XogRN+vJ2kON3TjhKon71uDvCUmayorR0LuymoqC+5dZA6?=
 =?us-ascii?Q?PrZtCkkt3UiSRdMOOAisQt6q/HWrG0hD1eGI+r4KL46RurL2SPYP+8b3inAT?=
 =?us-ascii?Q?OzXr46TAkJS+/0VuHgupupc3zKJ78JkkRnMeOL8ppEivaY9bjH67f5XKwkDW?=
 =?us-ascii?Q?U+VuD0cf4qrZPugmm68jxL0W9WtzlJAdZI7teA4ccLAiTMDWrVJW3fj2Yl7l?=
 =?us-ascii?Q?0m0esdH7mbk3+bO/xlgNFPqWnp8HXiBwNSJS5Rtax2Ri+sFJWQ0kCNIAyzRK?=
 =?us-ascii?Q?cslv7dinBni0QnPWFrUW8NJEksX70Sib/iiHJyere+XaVhK1QO0++9bNvBJy?=
 =?us-ascii?Q?AFJHtCQ9BUotdFYTgxQmS5BpEDtU9v6Rruh+SlRfBBs+BzqF/5j6Pnx13GWJ?=
 =?us-ascii?Q?vWJmipj+Q6Nq9haXp9iJ8eUX3RStq47UbHT4E95Eh4KRXEM92JmYoO8nf25v?=
 =?us-ascii?Q?pmzD10nuY0icVs5UB8P27+nQLZ2Y3qJ5uGr6UD5/kD6xe3rshYd44UQCBx7A?=
 =?us-ascii?Q?WL32IfSF26ejlnhKlS2H8fVudnZcYBd41sB/XOGpfjCJVMQOWyc9V8B37RRQ?=
 =?us-ascii?Q?wIoJ2vStv/rh8Z2wtPZ5KatwR8cDuLYl6nPNn+I1ysoyTsCK88xL9Ek69PVG?=
 =?us-ascii?Q?J2S9BPUaoHwRCitphnDxkHdWQta40BWKwAPINqr3ErWS/ggAtsnm7KvfgF3P?=
 =?us-ascii?Q?jJsbuzCqXmGAtmvHkJIVkuo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5465222-c876-45b3-a12c-08d9d7d42263
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 03:07:16.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LJRlLJsl0b+RieBXX1nTFWMSth9txWcEFogNHlkFx4TxLlcOsyq8hKHOvdMqqh0RBI8w91HYvb+/PgxZRC2Aug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1774
X-Proofpoint-ORIG-GUID: 9lLEpfSjAOs0DDe3pF2XqJ3p1tjU3dWA
X-Proofpoint-GUID: WK3kKS5nZkVbHmaj0lT2l7FKH37s1t7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-15_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 03:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160601

--30Ji44G2TeUWqC4k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 15, 2022 at 02:53:09AM +0000, Mittal, Anuj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Sat, 2022-01-15 at 10:37 +0800, Kevin Hao wrote:
> > From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> >
> > The cryptographic unit is optional for the Cortex-A72, but it was
> > included by default previously.  This breaks building systems that
> > lack this functionality when using tune-cortexa72.inc.
> >
> > To correct this, add a crypto entry in the tune file.  Since CRC is
> > optional for ARMv8.0, do the same thing while we're at it.
> >
> > For platforms that had been happily using tune-cortexa72.inc, a
> > slight
> > degradation of performance will occur using the default.  To correct
> > this, simply add:
> > DEFAULTTUNE =3D "cortexa72-crc-crypto"
> >
>=20
> I am not very familiar with ARM tunes but it sounds like you are
> changing behaviour for people who might already be using these tunes
> with these two patches ... That might not be suitable for stable
> branches.

These two patches fix the application crash bug on the boards which
have a cortexa72 core but don't have a crypto unit. IMHO they are definitely
suitable for the stable branch. Yes, for the boards which do have a crypto
unit, they would have to update their default tune to avoid the slight
the degradation of performance.

Thanks,
Kevin

>=20
> Perhaps Ross, Jon or others can comment if this is something that
> should be merged in stable branches.
>=20
> Thanks,
>=20
> Anuj
>=20
> > (From OE-Core rev: 2568d537087adb0b592aa250bf628a7b48c3a9d3)
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> > Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit
> > message)
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > [Kevin: Convert to the old style override syntax]
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > ---
> >  meta/conf/machine/include/tune-cortexa72.inc | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/tune-cortexa72.inc
> > b/meta/conf/machine/include/tune-cortexa72.inc
> > index b3f68ab6e3be..7608a20c43f4 100644
> > --- a/meta/conf/machine/include/tune-cortexa72.inc
> > +++ b/meta/conf/machine/include/tune-cortexa72.inc
> > @@ -6,8 +6,16 @@ TUNE_CCARGS .=3D
> > "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=3Dcorte
> >  require conf/machine/include/arm/arch-armv8a.inc
> >
> >  # Little Endian base configs
> > -AVAILTUNES +=3D "cortexa72"
> > +AVAILTUNES +=3D "cortexa72 cortexa72-crc cortexa72-crc-crypto"
> >  ARMPKGARCH_tune-cortexa72             =3D "cortexa72"
> > -TUNE_FEATURES_tune-cortexa72          =3D "${TUNE_FEATURES_tune-
> > armv8a-crc-crypto} cortexa72"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa72    =3D "${PACKAGE_EXTRA_ARCHS_tune-
> > armv8a-crc-crypto} cortexa72"
> > -BASE_LIB_tune-cortexa72               =3D "lib64"
> > +ARMPKGARCH_tune-cortexa72-crc         =3D "cortexa72"
> > +ARMPKGARCH_tune-cortexa72-crc-crypto  =3D "cortexa72"
> > +TUNE_FEATURES_tune-cortexa72          =3D "${TUNE_FEATURES_tune-
> > armv8a} cortexa72"
> > +TUNE_FEATURES_tune-cortexa72-crc      =3D "${TUNE_FEATURES_tune-
> > cortexa72} crc"
> > +TUNE_FEATURES_tune-cortexa72-crc-crypto   =3D "${TUNE_FEATURES_tune-
> > cortexa72} crc crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72        =3D
> > "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    =3D
> > "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    =3D
> > "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-
> > crc cortexa72-crc-crypto"
> > +BASE_LIB_tune-cortexa72            =3D "lib64"
> > +BASE_LIB_tune-cortexa72-crc        =3D "lib64"
> > +BASE_LIB_tune-cortexa72-crc-crypto =3D "lib64"
>=20

--30Ji44G2TeUWqC4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmHiOl0ACgkQk1jtMN6u
sXH+lgf+KJp2Ufo6hJqgs6sJHHtDohhtDc65RSEKsoqlbfGgZ8henDzKcw2YIKLe
KWpFNeKFyvvsTSZnZtjjXSxUJE7T99o+clYmQ6rNDIqvfcKuhjNQn+sV6x7pAvxz
lRGOzMqx+F7w5tTB1eRXXUI/DZqS7MmysGBn2SMmk2KsISEtgYq2ngWk4YE9ORWZ
aJqGG8ZDTYM2y9KfDdUU7pk9BeBSNfumPu/lHMMUVta2fhavQ4YHM5BR96xGqAUo
N1MEebGhJN1pQuCUNYQnoohHFVbTTivXHtF7CJreLcq4+/tgidvTvGwOASWa6C0q
/vqoj0ePOCcLEQPyDVhx8tNc8XkQ4A==
=9FIH
-----END PGP SIGNATURE-----

--30Ji44G2TeUWqC4k--

