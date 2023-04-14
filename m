Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABE2C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:19:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2951.1681453162089339901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=h2/KN4B8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3468fb4c98=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E50JVr002422
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:19:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=5CSn3UiQGgkwZH7ZjqFm+oHiOza74D3HBLRoOWF3ezc=;
 b=h2/KN4B8yMCzpxZRxk2Xa6/4DMZ5qwcYZdqZ2VlUHGea71C/EJkNJoy+Cf59SX5GmTQS
 uLFqpyDdKPIg69JbxZ88QEw3iQika+YoxoTWGuyvLENjxB9xPg4cFnNWBhgLQZsQgaes
 gwrpA4o+2Gev2VAJw/5D2SWmIIIZDW7esKPr9cJ/1Y/X8S5HJBp7x5cGTGMTTXF4Q2ge
 r5Kh3pHmrt548DeHXDLGNFpisFQLuOeCFkj1M61zGZH3z1u2VzGQVP3sW+n9M9rtmXQk
 LHLVsWrMGsK98xZO7vUAXDVqm7Rjc7fuvuJCCO78u3GD8xRSykUedp/CfYKyVlEVD5h5 gw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8sfe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctSFLLVJ1yE+G8JF3wbPn4Cqsjlb1bR9On2c2vO73m9smtPCU+IOvCMICpIy0WaaBwm8LPv4lfLsjbicGyBkMmHH6obt1MGMvZNajVr1pLDAz2F8USIfbKWLCP/su+N4KnkBAGu/nUJf9jqXMee1tobS6p0vQhPRN3DsKAVBZo4y5TnWztcaAOhNhIYZ85nzyW7mOmxIvM8gwNEnCXSfnaYgbdksum17/PwkC3LqfUkUpSPnMPDWH9zgbwqmWmehXvEP5IUpuU9OSKa0rHKoSV4GUAGgFtLAdTuJNpkTPfKVleOs9kJnckhToY0XS9rZJwt7vVmc0p7PZvhlM9t7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CSn3UiQGgkwZH7ZjqFm+oHiOza74D3HBLRoOWF3ezc=;
 b=YLo9UFOn2W8B0O9IxCRB+/YklWeAU3XCQiG4AlkPiFgADJb5YT06YY9eWuaGKrJ4C+lDqdseN4a1G193zfxdE1QB+8qpMIZBZG9074hJTpG1V+fC1SOIGCovK9IMSfjk8dC4bul6BcYyRzO3vEJuid5DR08t4pwm5h0cOmR1uPOI+Mf3jrgOiHvZuykhPzYlk6RxQWWmf8ArrbXKwghTTjCMem0PGQT2y3jI/SnWKH8KhbJ15dxnqjaBXe8EjI+6t68Ahnx+BWt9Sd007hEvrpsFnGTYoHApRL6cSqoIKMB/qCUGSQpj3o7tKWBZA5zHs8DPgzN6++HYh9QKeNmudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 06:19:19 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39%4]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 06:19:19 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: FW: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Topic: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Index: AQHZbpiSuAW44uclcU2B5LDjcYkrUK8qVNV6
Date: Fri, 14 Apr 2023 06:19:18 +0000
Message-ID: 
 <SJ1PR11MB612998EF5D4E81A13E9AD04BEB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230222121904.4087522-1-Yash.Shinde@windriver.com>
 <CA+=Sn1kxde5ynivyv_Y4PUvJUBBEauZWdun6Pp=EBvEt3UZQJg@mail.gmail.com>
 <SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: 
 <SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: cdc8998c-1463-427f-42a4-08db3cb02e2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H6KSLTteBf939SFqiw15gLQy0R5iwXOS6+XwL1q2E+aDSFN6gmW4F5woeQeI+6VriwvIHEHSkJvxeFJ70xokKttNwwbFf/ZXT2pN6r7Ej5XJvLNvJ4J2C9fvPEqT29OYy0ZU0wNKn4nv0/m1Lyek2NO9LYs1cWOqrtxsuW0AZu4SE3fybKsx+FfTPx2FkHgoXvme5mvI1miSLvkgfJnB5+ozx4Q0bzrQkY+Q8ezB4FvXfs7UsmZrILI8sm+QymhHaxZSF4p2e75WgW9iLTYO3KazTo6fIta0W8aR9X3olyzpQXpiHlENjifaAOOmLjV4YfMv81KLHxQlBbxJxv4300W9aDfEWGeTG6Sr2zfp4FbAKalFp+QgRq1sE6I11vEwOfPAJFUx1t5OJRDGsVBz9mRKcGKPIp8uSggTvs4FTI9JYHe1eoREfNLxY6GTsDfdRxO58ZF1grTjXOPqKaVA4gqSPlHoZr8bZvBVN32Pq6vRaFlnCXYeXl6wWQkbOc7X2PNAZ2h+idwmWfvfxZSdqFFzOOAuYbsFIxJNXwPLlgCrILOKmtuUbZvTf2X4DBayNsL1/L1G2OaocyAaWCOTQ52cydFNr+onwDP7HyJsLijkgrRTkakQ/qQnJljbWSbP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(2940100002)(33656002)(8676002)(38100700002)(5660300002)(2906002)(52536014)(38070700005)(55016003)(86362001)(8936002)(6916009)(122000001)(316002)(66556008)(64756008)(41300700001)(66946007)(66446008)(66476007)(83380400001)(76116006)(6506007)(26005)(53546011)(186003)(9686003)(71200400001)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?CSVV3pi6xcmfrgwep77bT/5fQN/vygCOFoat2EEyLzVYN2AwpB/or7r8?=
 =?Windows-1252?Q?cqDTM7FGXhifiUZSXwJm1la+dyGq44l8NKpvQ3zhT4eo0kvtZvWJHjHQ?=
 =?Windows-1252?Q?Il+iSdA//MfD/e7IfEKm12paF2JuKyqnqWnKPueVIcy+85Tw40EEIbpu?=
 =?Windows-1252?Q?1yy12zk7DSLGCHN5kBfhWCjibY8mcf7toJ0rsGeg+kOv/c731W77jIqT?=
 =?Windows-1252?Q?vZhwjm0XgNypfEEQru04KmngLQRoL8OCGdyLaKXTebbkutmr5GrNl/lX?=
 =?Windows-1252?Q?PNMfFPNo2yPtMX3g2xfsfHpoMcXSu2I7y7n7l4v2lZ03H4UTrHDbkJgi?=
 =?Windows-1252?Q?XDfaiP3g0+WEooL1Xh/inI0QG6iPPrTFZZCwd7qqvOpUlY9ctf4e3qzv?=
 =?Windows-1252?Q?wLxby4b/CiAp8jrc2eO9XegjA/qd9fJ6924oDTcG87bbj5sUuqXW6jCa?=
 =?Windows-1252?Q?7IAoyKDlpVIgxeGpTm15bDTbJiuWpAa7ugH5Amm5IYykzWkJyK6twy7T?=
 =?Windows-1252?Q?5Ci3f2tl1ZpWKOsQeHLRNxDB+yUHKptem0I3EtA0ZDGk0LfaDo6Z/k6K?=
 =?Windows-1252?Q?Ar1Dmcwhi9j8jf4Mi1IrzaUu2El8mjNFwSiUzGA1WepumhMCBn/6iCln?=
 =?Windows-1252?Q?WkH884GbV0wTRE7P7CoRyUkc92znVveNegRZGK3mqH8N/MxJKsz4owrf?=
 =?Windows-1252?Q?KLZB/As+5yVNzu5uW3bDACjygPXARcg+ayWw73iTdVYSopCVHU0Z8xv/?=
 =?Windows-1252?Q?NoS+Fg0UdWsdTyqFk33meApiu946UcPVmzkzm5rATYlHuy+c7G1zVSdP?=
 =?Windows-1252?Q?XcO04efmd388yGwRydzT2a490QDxV9Euy7Dn6fE5/e3tNDq7WHHiEtJ4?=
 =?Windows-1252?Q?rb905kwpAMGcN3w8Wwgm0RrUMbowU4xlj7q7rlUBAoBAomSSCdqVEHIN?=
 =?Windows-1252?Q?3QM5GNjz3bgfPjWcnYNa8cAKsj3TczGZBROTuY3JFiLC43Ush3IPKd23?=
 =?Windows-1252?Q?27AWrDEYJ8Y/6XVzCPpsqHeX9fjoFikAwzddzl+n75Uz79jXpbp4cCpO?=
 =?Windows-1252?Q?ivPGSqHo/g8Wtym0KJBI2Sm2KwZCZlMi1FoliLqoLjaMif4H+W3b4osu?=
 =?Windows-1252?Q?q5+2TSgCDe8G4U+qT6ZEgD5aUMSrWT6vDV0OG2IsXS32XpuyTtoev6Mg?=
 =?Windows-1252?Q?R3YC/hiUqTsYx1HLymI6QU26douSFN7gjjFRBuE0e7TPWvD42RmMTPxm?=
 =?Windows-1252?Q?pcgWdM1MhGN7y6zhuuBsf1iKSZ6eZrVdLLrfczUB+GQ7+jbWT62xczar?=
 =?Windows-1252?Q?xjGWQSgdvDOtSGSbeAZbmCMPdu7AyGyQHv+OBhqaSPUQ4jcIKK7aiEDh?=
 =?Windows-1252?Q?jhoiTmS9Vjh8qZ0MbIjKJ3Y9AcBIlrhIYkT8YV3CvEqn/F+vMtnrj0gW?=
 =?Windows-1252?Q?41ldwb7V5GppU9LeL/SG6pbg7xXCDB3MEOeQHOHoL5f82sX0onwIyMsj?=
 =?Windows-1252?Q?R8xdzFUWxg9qs68RHHlKrCK5heL2zA0dwiNDfTr+DeOW4cdC+m1YnlQ0?=
 =?Windows-1252?Q?V0cgFC0tGqIpr89jDYaKJs0vnYQsaQtp0zTjHTiqkqgmqSrHUKwnBMQz?=
 =?Windows-1252?Q?Z2qNPqf4pfQFa54GGT/26lxzv8A2hym33HpbiHcSNfyLLeSrOLnOJwM6?=
 =?Windows-1252?Q?+wpxgEm4ia3zShHuAXNBckXL3rc66qw9zPRbv5defHygDkKFfjxi5Xwf?=
 =?Windows-1252?Q?OT1zrYOS7SDM49rXayw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB612998EF5D4E81A13E9AD04BEB999SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc8998c-1463-427f-42a4-08db3cb02e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 06:19:18.9359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +I6OT3seamBfq0I0OZIakp+FkKYWEmZDX6bTnEqc+lLAo5p6B5rstY/8c2aAJB3UHL5+SfNPeZ/dPHL5yrUcU8MWELLn6ZKzfK2zDvVMFRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
X-Proofpoint-GUID: nUAWR54gNm0OG6BIKSYcs_EfnTeevwsk
X-Proofpoint-ORIG-GUID: nUAWR54gNm0OG6BIKSYcs_EfnTeevwsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179988

--_000_SJ1PR11MB612998EF5D4E81A13E9AD04BEB999SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



From: Shinde, Yash<mailto:Yash.Shinde@windriver.com>
Sent: 14 April 2023 11:45
To: Patches and discussions about the oe-core layer<mailto:openembedded-cor=
e@lists.openembedded.org>; yashinde145@gmail.com<mailto:yashinde145@gmail.c=
om>
Subject: FW: GCC patch "[PATCH] Share work directories" to be discussed aft=
er GCC upstream denial

As discussed in the meeting, sharing the GCC upstream=92s reply for =93Shar=
e work directories=94 patch.

Regards,
Yash

From: Andrew Pinski<mailto:pinskia@gmail.com>
Sent: 22 February 2023 21:34
To: Shinde, Yash<mailto:Yash.Shinde@windriver.com>
Cc: gcc-patches@gcc.gnu.org<mailto:gcc-patches@gcc.gnu.org>; raj.khem@gmail=
.com<mailto:raj.khem@gmail.com>; MacLeod, Randy<mailto:Randy.MacLeod@windri=
ver.com>; Kokkonda, Sundeep<mailto:Sundeep.Kokkonda@windriver.com>
Subject: Re: [PATCH] Share work directories

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, Feb 22, 2023 at 4:22 AM Yash Shinde <Yash.Shinde@windriver.com> wro=
te:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Fix configure and Makefile files to read the defaults.hand t-oe from buil=
d directory,
> so that the source can be shared between gcc-cross-initial, gcc-cross-int=
ermediate, gcc-cross, gcc-runtime,
> and also the sdk build which use a separate build directory compared to s=
ource directory.

>
> While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> occasionally failure that test the existance of default.h doesn't work,
> the reason is tm_include_list=3D'** defaults.h' rather than tm_include_li=
st=3D'** ./defaults.h'.
> So we add the test condition for this situation.

This patch does not make sense because $(srcdir)/defaults.h will always exi=
st.
I build all the time with different object directories and I know of
many people who build with a read only source directory; explicitly so
they can test that way.
You are going to have to expand on why you need defaults.h from the
build directory and not the source directory?
As far as I Know there is no defaults.h in the build directory even.
Do you have another patch which changes that?


Thanks,
Andrew Pinski

>
> gcc/ChangeLog:
>
>         * configure
>         * configure.ac
>         * mkconfig.sh
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  gcc/configure    | 4 ++--
>  gcc/configure.ac | 4 ++--
>  gcc/mkconfig.sh  | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/gcc/configure b/gcc/configure
> index 254f9b6c943..ff2a3e26049 100755
> --- a/gcc/configure
> +++ b/gcc/configure
> @@ -13471,8 +13471,8 @@ for f in $tm_file; do
>         tm_include_list=3D"${tm_include_list} $f"
>         ;;
>      defaults.h )
> -       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> -       tm_include_list=3D"${tm_include_list} $f"
> +       tm_file_list=3D"${tm_file_list} ./$f"
> +       tm_include_list=3D"${tm_include_list} ./$f"
>         ;;
>      * )
>         tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> diff --git a/gcc/configure.ac b/gcc/configure.ac
> index 62bc908b991..d36830cf2fb 100644
> --- a/gcc/configure.ac
> +++ b/gcc/configure.ac
> @@ -2336,8 +2336,8 @@ for f in $tm_file; do
>         tm_include_list=3D"${tm_include_list} $f"
>         ;;
>      defaults.h )
> -       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> -       tm_include_list=3D"${tm_include_list} $f"
> +       tm_file_list=3D"${tm_file_list} ./$f"
> +       tm_include_list=3D"${tm_include_list} ./$f"
>         ;;
>      * )
>         tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> index 054ede89647..3b2c2b9df37 100644
> --- a/gcc/mkconfig.sh
> +++ b/gcc/mkconfig.sh
> @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
>      if [ $# -ge 1 ]; then
>         echo '#ifdef IN_GCC' >> ${output}T
>         for file in "$@"; do
> -           if test x"$file" =3D x"defaults.h"; then
> +           if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defaul=
ts.h"; then
>                 postpone_defaults_h=3D"yes"
>             else
>                 echo "# include \"$file\"" >> ${output}T
> @@ -106,7 +106,7 @@ esac
>
>  # If we postponed including defaults.h, add the #include now.
>  if test x"$postpone_defaults_h" =3D x"yes"; then
> -    echo "# include \"defaults.h\"" >> ${output}T
> +    echo "# include \"./defaults.h\"" >> ${output}T
>  fi
>
>  # Add multiple inclusion protection guard, part two.
> --
> 2.39.0
>



--_000_SJ1PR11MB612998EF5D4E81A13E9AD04BEB999SJ1PR11MB6129namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br>
<b>Sent: </b>14 April 2023 11:45<br>
<b>To: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">Patc=
hes and discussions about the oe-core layer</a>;
<a href=3D"mailto:yashinde145@gmail.com">yashinde145@gmail.com</a><br>
<b>Subject: </b>FW: GCC patch &quot;[PATCH] Share work directories&quot; to=
 be discussed after GCC upstream denial</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As discussed in the meeting, sharing the GCC upstrea=
m=92s reply for =93Share work directories=94 patch.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From: </b><a href=3D"mailto:pinskia@gmail.com">An=
drew Pinski</a><br>
<b>Sent: </b>22 February 2023 21:34<br>
<b>To: </b><a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br=
>
<b>Cc: </b><a href=3D"mailto:gcc-patches@gcc.gnu.org">gcc-patches@gcc.gnu.o=
rg</a>; <a href=3D"mailto:raj.khem@gmail.com">
raj.khem@gmail.com</a>; <a href=3D"mailto:Randy.MacLeod@windriver.com">MacL=
eod, Randy</a>;
<a href=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkonda, Sundeep</a><br>
<b>Subject: </b>Re: [PATCH] Share work directories<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">CAUTION: This email comes from a non Wind River emai=
l account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed, Feb 22, 2023 at 4:22 AM Yash Shinde &lt;Yash.Shinde@windriver.com&g=
t; wrote:<br>
&gt;<br>
&gt; From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt;<br>
&gt; Fix configure and Makefile files to read the defaults.hand t-oe from b=
uild directory,<br>
&gt; so that the source can be shared between gcc-cross-initial, gcc-cross-=
intermediate, gcc-cross, gcc-runtime,<br>
&gt; and also the sdk build which use a separate build directory compared t=
o source directory.<br>
<br>
&gt;<br>
&gt; While compiling gcc-crosssdk-initial-x86_64 on some host, there is<br>
&gt; occasionally failure that test the existance of default.h doesn't work=
,<br>
&gt; the reason is tm_include_list=3D'** defaults.h' rather than tm_include=
_list=3D'** ./defaults.h'.<br>
&gt; So we add the test condition for this situation.<br>
<br>
This patch does not make sense because $(srcdir)/defaults.h will always exi=
st.<br>
I build all the time with different object directories and I know of<br>
many people who build with a read only source directory; explicitly so<br>
they can test that way.<br>
You are going to have to expand on why you need defaults.h from the<br>
build directory and not the source directory?<br>
As far as I Know there is no defaults.h in the build directory even.<br>
Do you have another patch which changes that?<br>
<br>
<br>
Thanks,<br>
Andrew Pinski<br>
<br>
&gt;<br>
&gt; gcc/ChangeLog:<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * configure<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * configure.ac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * mkconfig.sh<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; gcc/configure&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&gt;&nbsp; gcc/configure.ac | 4 ++--<br>
&gt;&nbsp; gcc/mkconfig.sh&nbsp; | 4 ++--<br>
&gt;&nbsp; 3 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/gcc/configure b/gcc/configure<br>
&gt; index 254f9b6c943..ff2a3e26049 100755<br>
&gt; --- a/gcc/configure<br>
&gt; +++ b/gcc/configure<br>
&gt; @@ -13471,8 +13471,8 @@ for f in $tm_file; do<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quo=
t;${tm_include_list} $f&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults.h )<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;${tm_file_l=
ist} \$(srcdir)/$f&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quot;${tm_inc=
lude_list} $f&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;${tm_file_l=
ist} ./$f&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quot;${tm_inc=
lude_list} ./$f&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;$=
{tm_file_list} \$(srcdir)/config/$f&quot;<br>
&gt; diff --git a/gcc/configure.ac b/gcc/configure.ac<br>
&gt; index 62bc908b991..d36830cf2fb 100644<br>
&gt; --- a/gcc/configure.ac<br>
&gt; +++ b/gcc/configure.ac<br>
&gt; @@ -2336,8 +2336,8 @@ for f in $tm_file; do<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quo=
t;${tm_include_list} $f&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults.h )<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;${tm_file_l=
ist} \$(srcdir)/$f&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quot;${tm_inc=
lude_list} $f&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;${tm_file_l=
ist} ./$f&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_include_list=3D&quot;${tm_inc=
lude_list} ./$f&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_file_list=3D&quot;$=
{tm_file_list} \$(srcdir)/config/$f&quot;<br>
&gt; diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh<br>
&gt; index 054ede89647..3b2c2b9df37 100644<br>
&gt; --- a/gcc/mkconfig.sh<br>
&gt; +++ b/gcc/mkconfig.sh<br>
&gt; @@ -77,7 +77,7 @@ if [ -n &quot;$HEADERS&quot; ]; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $# -ge 1 ]; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo '#ifdef IN_GCC' &=
gt;&gt; ${output}T<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for file in &quot;$@&q=
uot;; do<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test =
x&quot;$file&quot; =3D x&quot;defaults.h&quot;; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test =
x&quot;$file&quot; =3D x&quot;./defaults.h&quot; -o x&quot;$file&quot; =3D =
x&quot;defaults.h&quot;; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; postpone_defaults_h=3D&quot;yes&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; else<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;# include \&quot;$file\&quot;&quot; &g=
t;&gt; ${output}T<br>
&gt; @@ -106,7 +106,7 @@ esac<br>
&gt;<br>
&gt;&nbsp; # If we postponed including defaults.h, add the #include now.<br=
>
&gt;&nbsp; if test x&quot;$postpone_defaults_h&quot; =3D x&quot;yes&quot;; =
then<br>
&gt; -&nbsp;&nbsp;&nbsp; echo &quot;# include \&quot;defaults.h\&quot;&quot=
; &gt;&gt; ${output}T<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;# include \&quot;./defaults.h\&quot;&qu=
ot; &gt;&gt; ${output}T<br>
&gt;&nbsp; fi<br>
&gt;<br>
&gt;&nbsp; # Add multiple inclusion protection guard, part two.<br>
&gt; --<br>
&gt; 2.39.0<br>
&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB612998EF5D4E81A13E9AD04BEB999SJ1PR11MB6129namp_--

