Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176FBC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 02:43:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.18112.1641955399066919601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XfNk7F3s;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8011b17de3=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20C2Hame031290
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:43:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=S/1dZF2xBmPeXC0Yf5uKS4dFBfwRHRrxdOlwUzwMB2I=;
 b=XfNk7F3s43ujRFhjQc6MDjCFW1GUlTJpf2FDfQa4o7f2tPAkXlf8VkBGtQFptd7GEldq
 MC8jAZLTEBKpbuXVICUJMfZJ/puPwIbw36y8i9HSwcZL26bDmzM4cLIUF+S1CoPKfsHZ
 fFpRtKsb6uvVVvBSdBrIoCSzMOtCf7k3fXnlmqfDdAMqIJtF9UlTbLRtFb6orVQ0FyFk
 iwck7cxN7Ppp1XaMZp0r0BkgxG3wPY+dJrktNlNwo9wxtmVRIG/Cl8s9kmWtT8zrrItw
 dr+DDQ0BNC74mEReCLA23ueB/14EhGKCL03WCkfLkmBjmeDY5XhjlW+d+jUgXcHkbVtN hA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgmn6hbtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:43:17 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20C2hGx6016288
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:43:16 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgmn6hbtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 18:43:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9vMNnhnevEQkaFHAJuHGwr+Kh3Axw2ZJBx/oU7xs1VMny8uYYZ957ixdlaSRVLVgM0sys8wU9pxqqx0fF8Ee7LZyGLCwTh274GbY5uhlwrN5r8Q9GgoU20W4EsbKleJX6KWaa8soNwLUtf2VGjfcj5OSAyD+5s/yP02BOak3noKyOxFP5aft2NwZlxi1k2jn/42glPzj7D4vtcsdfu2JJJwyCcmUH6HYacI4wEFPLHHhpBR1yzV8CkfoNKZOyFGdq9qLTJkHICD91S9vH68VU+JrUJaxYpdQrJzhCI5aWy644ac6teQhReCUwXlWLJ+A0QKrehycYTcGQXmu7REPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/1dZF2xBmPeXC0Yf5uKS4dFBfwRHRrxdOlwUzwMB2I=;
 b=QM6+T8qGi3wspUyLxXS5zkfcwn554+BRQo7XY5J8mQ/y1QqhtNeSln8KRcGNfThsvMQaFUbMa3cFRkwhES9PfHPRfJ5sP7Umeqv8G6IXozB5IEoL79+HAUSkVLhuJhVITAbYe/ByZXPhYTAOlFMSXtYXqKOpgTDr7Fv2rbgogGMoQGLAZq2cT9Wax6Mpsey+K6Ne2bsk6ctp3yMFCgSmdGW2aht5Ae8eSQwcoRg1Cxeh9OEbOolKj0d0ndreWicQWBze3qphWMgSYuUfknsKBSdoh1GNtRT281frXJ4rcbIWOAxMk2hYeZLybNWlM5LzniP8TtTj4fK1Uo3c1m9ljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 02:43:13 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Wed, 12 Jan 2022
 02:43:13 +0000
Date: Wed, 12 Jan 2022 10:43:02 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] armv9a/tune: Add the support for the
 Neoverse N2 core
Message-ID: <Yd5ANjPMa3ZCzWTO@pek-khao-d2>
References: <20211224100518.3561765-1-kexin.hao@windriver.com>
 <16C3A8F7D6F5EA98.22520@lists.openembedded.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uP7hYQovo5mbDMwQ"
Content-Disposition: inline
In-Reply-To: <16C3A8F7D6F5EA98.22520@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa59f96f-8846-4d84-d3f6-08d9d5754728
X-MS-TrafficTypeDiagnostic: MN2PR11MB4613:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4613C9D6E5922EC3A9187A10E2529@MN2PR11MB4613.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V1cMwO8cFmtUBp7yup8EWWhIgSXl0HbmNeOL+gqon3jGip5CPKKMusgsDscUQJ4ohocln26a7FEcwlFqBx4jU1vJYmR3kfH+PNRP6txBXAMu2QdjCORiZyQJnXFRnA234QHM4jELF7ViIE5AN6KJs+6++Aa9gy2ZzJt0GGrU7y0shpDocvPc31tUvtAEvB3k4OJFWU1xs+AiCB23yRQM45vXCC5ke9DNvRuSqdEbrfVpb0vG2Efq519AbjyBmvNPB9zVW0jx3/v2pHH+ui62deXSxKzODl3MDhQOSXli5qxYkjJq1enV3qcUwmZeuO4X6H1Fe/Hso5EjSCrYbq9F+zns/VVPAz8cXQtmL3bl6RPIxEdak3X79gEZIwCRx3FxzTd1l9oliZQZ/G6+Br8Hj9thU/hUG+H5/8myixxkjh1dbPzkgFF9ghDUcKe7iENmVVj1EKnUg+VqdBjT8vTkyF+7icjM/tDYxLUfMEAVsiGcoc5cIEdyVC2WIp9YJ0suHsu2jFUdEK83fqTf+Dvd/28G+NR02tr6sMlFfcLgdH6h8QFMR+UKiFiPLEvgzgM4GqdY+dho/vxZ86tNNLyIhtg9rlSxI1cRNWqmk4W1SaVwXZrx44PH9ZkX49GqR83rgwEvs8YfoCv0SkvLvs7IBKSSSO74vZbuq8PWTpYEFi+OfglJnXUSb2AelzgmpOcdCaNVFZ0uQt0n4L+OpuWHKgM3/V3K8QpCqF7S5YUFWPnM6LMYWw2hho9AX4cMY5kMPhYr6OVVsmtWZ6Uk32vCASQlynMDVgyR0nyUVzPDjYB20Ssgl3WjaRCKrKWmmhV4nrCXRnIPlMQ6WT6QSj69QufqVjooG+cuDA6NQbe83a/ZnpVzzdxWoifZzJDr65LA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6512007)(508600001)(966005)(9686003)(6506007)(4326008)(44144004)(5660300002)(21480400003)(6916009)(186003)(8676002)(52116002)(83380400001)(6486002)(2906002)(316002)(86362001)(6666004)(33716001)(8936002)(26005)(38350700002)(66556008)(38100700002)(66476007)(66946007)(71600200004)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?scSnKzSkMA40/TY3ovNgKx56bE1Q8FAbb+ItoKUt4v6h7UQxjSQR5jDcCXwm?=
 =?us-ascii?Q?P5zTmUtUN2T8/ESPSdxL/IIxAPZUffLZ3GRpQnxcljdC/j20dFOue405uyZA?=
 =?us-ascii?Q?9oc6MgRVPthUb930m7cn8ro0Qu/BExc/XP6DL/uJBROivChwBz+uioX9aY6g?=
 =?us-ascii?Q?YGkAeaAUtSV+a73Ts2dVJ/VCkzW3NzkkewDeuuZtmXidNIo3u64vzZwQeF1n?=
 =?us-ascii?Q?NTlDgaSQTJLPaMLEfyxtWyOIyOclB0kCwhcbGBVVWVA9+vo+U1f4Zx9vklO8?=
 =?us-ascii?Q?KWMXIM7dNzjRG9CFs0or7Gp6c+MtMFFbGw4HUaDLdgdbYVGUI15NsQcFZggx?=
 =?us-ascii?Q?rbdjDaRSf0ylBKoKw6oT7pkDZpHSuVAbyCvEwWKqU/QUsRt7Q2KG/KQEfh5y?=
 =?us-ascii?Q?kv/f9zZ4Jio2mYkWhFCS/ESGQwfuIhK40qpwyHM5PU5wpqhc44UQkE3AHyTg?=
 =?us-ascii?Q?ST3f93o89wIV0XASG7GNMUVpVmKzJ6vVu5grdztrU4+ctamKqESPvAYn/VmZ?=
 =?us-ascii?Q?4W/6WWONNjoODzDuvOIFxh+bz4G0yRTwg0RCYgb4rLacSUdxDoq4KTlK4h4W?=
 =?us-ascii?Q?UBaEzycTMQH+2O2Bi1a/QIsu1Iupxqe9QZvj97azldseAkT+IR/5Sw3zLZWj?=
 =?us-ascii?Q?jCjjyBMj9bYxP6x9YRFz6QAA2/3ed3Jk7/yAVIBHIngsm1A/gSNNAPg9GH1d?=
 =?us-ascii?Q?vOrnWVrrcAyfOooyG9XCwoIzzHaLOGuVFn/tIkJn9F9FSVHuSLQHlKDaiFEb?=
 =?us-ascii?Q?fk4+ujorS1PIht346yhZVP7f+LgDuzVKhdjEw9kNg48xIb00l2kToqvrewQT?=
 =?us-ascii?Q?o0Dpvch0voKjmtnStLfZQ9hrJjqV8yavw7og/gN2qwqrYJFbzb8QVy2w7YMu?=
 =?us-ascii?Q?4hS7AZNXeL1KeP7mwvIFHc8wAC+zRwGeEzIVjKqounzs7OszxgAP5IG3hWwx?=
 =?us-ascii?Q?w7ENwahNAM2YjCN88AUdVpAT3xhELM/UYBhKkqBTwvAVoaLp45NrK49dGbbe?=
 =?us-ascii?Q?ayNzcZN6iVR06hIC/h+cyQsABgTnQkomu1yD6fG1zZbC0hF9EUvXz8xJJN7B?=
 =?us-ascii?Q?u1OTJJfiqSrcT3GsKiS1exjSRg0uQvX4H4sRgxuJuvN3cx2QX98+aXi7sL48?=
 =?us-ascii?Q?Kparr8oKEXP6NCD/Gn0yIC0Pri8CqvZ53FHJsdOUSvi1lAUBr4MZT1vy+Pmm?=
 =?us-ascii?Q?s0/YO+N0FAtgEERY46teGD8NAUO3vepBECRzwJNJoOVU5sLYb/v5uWNmv5sc?=
 =?us-ascii?Q?ECAJt6C6jp+n2U/nDf4R3A3JIRqW7n7y6ECyELDsLlkHTvPeOJe+JGlvQnIR?=
 =?us-ascii?Q?+bZ4FoFS2dH5uREnrGjD03vJHz3B9FjdW1L45+4+xYExVilBEQNHMoMmTeVx?=
 =?us-ascii?Q?wwwmP3tdB5ZX5m7PiGU1jpjJnDJjD4XPG8X57xEfJ0bM+79NaQv2tWB6WL0K?=
 =?us-ascii?Q?aQhzmnz2+FZPgo0oCwxDFhsHcnBra/i1thcK0RYR+vi6YBbhWb5qB2geWyY+?=
 =?us-ascii?Q?1Mn2CLoWG8BMwAPRKFpSv31c7gJUD0mbDewp/YGE2LMm1idFaJ0ApAlOVo1E?=
 =?us-ascii?Q?3D18N2eMHqZvUgXj1oH6b2xLrFt5azL+c+5AkbUOr6eRXxQpvIDhMLzjzEgF?=
 =?us-ascii?Q?+NfzRMLukZwOCyTZ/DDAz5w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa59f96f-8846-4d84-d3f6-08d9d5754728
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 02:43:13.4351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LBWfGPQ54vbWyl6uab15MFIVCH5kznNcI8S0tJ6DOIztOMUvzT4D0/USwXgw4kk/F+1d0YtB6HvNIc3VhcqPhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
X-Proofpoint-ORIG-GUID: tPnFfbDGCiK20PfU62DTjOFM6RD53Kiz
X-Proofpoint-GUID: bcVvnJyHh-3J6JWlrB2ffaWFjwQdobrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_13,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=569 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 02:43:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160478

--uP7hYQovo5mbDMwQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2021 at 06:05:18PM +0800, Kevin Hao wrote:
> This adds the support for the Neoverse N2 core, even though the
> Neoverse N2 core implements the Arm v9.0-A architecture, but the support
> of it in GCC is based on the Arm v8.5-A architecture. Please see the
> commit 50d9db203bc3 ("aarch64: Add support for Neoverse N2 CPU") in GCC
> for more detail.

Ping.

Thanks,
Kevin

>=20
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  .../include/arm/armv9a/tune-neoversen2.inc    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.=
inc
>=20
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/m=
eta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
> new file mode 100644
> index 000000000000..36355f7bedb0
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
> @@ -0,0 +1,22 @@
> +#
> +# Tune Settings for Neoverse-N2
> +#
> +DEFAULTTUNE ?=3D "neoversen2"
> +
> +TUNEVALID[neoversen2] =3D "Enable Neoverse-N2 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' =
-mcpu=3Dneoverse-n2', '', d)}"
> +
> +# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
> +# but the support of it in GCC is based on the Arm v8.5-A architecture.
> +require conf/machine/include/arm/arch-armv8-5a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES                                         +=3D "neoversen2 neov=
ersen2-crypto"
> +ARMPKGARCH:tune-neoversen2                          =3D "neoversen2"
> +ARMPKGARCH:tune-neoversen2-crypto                   =3D "neoversen2-cryp=
to"
> +TUNE_FEATURES:tune-neoversen2                       =3D "${TUNE_FEATURES=
:tune-armv8-5a} neoversen2"
> +TUNE_FEATURES:tune-neoversen2-crypto                =3D "${TUNE_FEATURES=
:tune-neoversen2} crypto"
> +PACKAGE_EXTRA_ARCHS:tune-neoversen2                 =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8-5a} neoversen2"
> +PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
> +BASE_LIB:tune-neoversen2                            =3D "lib64"
> +BASE_LIB:tune-neoversen2-crypto                     =3D "lib64"
> --=20
> 2.31.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159998): https://lists.openembedded.org/g/openembedde=
d-core/message/159998
> Mute This Topic: https://lists.openembedded.org/mt/87934488/3617424
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ke=
xin.hao@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--uP7hYQovo5mbDMwQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmHeQDYACgkQk1jtMN6u
sXGWGggAzm1KVzNXVFEcLzClRfztUz+Hnpv/rwohCo8P5dFo5kyhfZPFl2uIY4hF
6l6VWk8ZCOYssFrw/mQrm9CBswwzOO8qaA4axi0SEBmgQf+LG1qIGC7um8jBl5zv
JwVQ4Vw5bQoDzv/SanzxRgXh68cFmCBDFw7t5i0QidSxDW3D1TGX+dBsLPeUMpqg
lEtUbb9brB88OK8cXa3PHUhI7+QBoqCKy4fQK9tacsOkBdI1MyGvsN3XYOii1KkB
6M95wvCxopHXVAlONwd5ZfJmxhmztCTrPBUP9LnyGKlw3IQxEVp2o/uXr84BqAj1
Nv0fanHdtaofrb5f62kvat6a3yOq5w==
=VCJ3
-----END PGP SIGNATURE-----

--uP7hYQovo5mbDMwQ--

