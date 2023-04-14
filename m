Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DF3C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:16:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2833.1681452959745117689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KzRFxmQZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3468fb4c98=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E6Fkmi017340
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:15:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=bVgixncqxrtQcS9hZu5lAWajbhDMsnj9xufoULLuHII=;
 b=KzRFxmQZ8W4uLCASG04+ycpJra8lMjmttu1VgCvno1IPG7C8Kv6XSGHXv74ccFQGZkb6
 0nCeVF4mjRx5SvGsABwlQ4slUJ+wzLMPDfE2mG+maMsyHt2mIBo/quRXKwOteEYLL+cx
 hHAtrWdgDbJ4osD4XhXUCTbqoUgPSTPUC5cxVF5IlRHkc6q9D0wcNUIZkAlHHts97RI9
 mvqAZPbd00MNHOvXqNQwP/JzqaG8FlJ24oFc0Skh7jqCfnk/OtoxGVNtZyi5HjQf35yU
 zC4/+JMtbOvFtXcKL9ccDgEKNjXFiL5OpSdjg66CqLbjexZuqkobSkTB6FieaAUYJXaL 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2hf6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:15:59 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33E6FwhD017400
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:15:58 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2hf6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 23:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP1miQ3G1uIevPZTff2ZoI/mAJTBnGZf50nd1xvQ0ZDpeAHSD9hvn2/HzBmJ1SC+FGmAlKFZVe8ZNJaj5kH/Qugila/MQlCjV8gLSgS2WXCkZ+I31yN9mtpwPaifgBovHLQ5t/ikQdQYDyQrCi/jj3cjVkeWw3pJ9Dc7ZIRcZ0kCdQmXe+lApmJtX2r9+Lfmiam7z955IaSbNhniKUSUyP4PQRb08yFinAu4GuwMiktup8hZOzhL6/gka4MI9tzXdKkfvCGSPWWld7pF1rSScAbfMZWghxQGQYTXzMgaaO9z3qx8vlVyvJXbV0Pd7tIAL4IK/6oCTD/BzFSri1mYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVgixncqxrtQcS9hZu5lAWajbhDMsnj9xufoULLuHII=;
 b=n87jOh07JVuKC1/jLmbWqOMI0N8+839BfKgvco8ObYAEo2AIQ1rtixAmcZuRZn5tBD94PWGf/1SdIS8ADzHk0iyqrb56cYgtAKFLG/jolGRrmruL8xJnF6LNJVVmRA1RgOq4UJvznGEAxITe6gien+I/Ktaxu7fDBWv9UZdCFpDQd4d9AyQibP/zU4jK8/M3ajEXGBD35xdHh+pP+WA45uiytCVy6kCDYFQf98PlDUA4HTdxCjfK4mdpv3qs8PbMF+o2IfNmJc1j/BGbNOyIms3tPbeYuRIDnGBdSZNxwY916wM6tgBRZHfvZUsb5GE7gguG09SH/F+XVQndegsxIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 06:15:56 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39%4]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 06:15:55 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        "yashinde145@gmail.com"
	<yashinde145@gmail.com>
Subject: FW: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Topic: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Index: AQHZbpiSuAW44uclcU2B5LDjcYkrUA==
Date: Fri, 14 Apr 2023 06:15:55 +0000
Message-ID: 
 <SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230222121904.4087522-1-Yash.Shinde@windriver.com>
 <CA+=Sn1kxde5ynivyv_Y4PUvJUBBEauZWdun6Pp=EBvEt3UZQJg@mail.gmail.com>
In-Reply-To: 
 <CA+=Sn1kxde5ynivyv_Y4PUvJUBBEauZWdun6Pp=EBvEt3UZQJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: b8e044d7-5cdd-4468-0bce-08db3cafb4cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jMK2jDFBhtEJmyzt64tkULjS0Hl6g6EVX/fko+OEpWa+gpi6Gm8pkvYaTVWFh3ej62yETTxBL/6jPe+2GqimHbapNojmwZ17tTmxWZBC2d1Qft09QXsobJyfKU3Q/gfS0hX+qRSA8cJd0OiyhVp4RX3lkx3oo+aAyipckzxm5OBiokWQWj6X17j4PV6+5LoENwnc+MTpbJrsSSDkUvlh6UT421JdQ8/nmDe40mzcGJmhLe0OMgd2lNoRTC11ToWFztB8btTWKzMMl0WCGjAG1VCW8T3dRekpDRjdujjNfoNW0J6sEgAFGC2no3STivG5ZsV337ey6upRTjXUaShBNTHQCUY+Azw3XOjuFOA+t4S2Reb6piQLwO7YEvck1eFyLj0ZjZoooTfVqwwYMYufmjSCkAqgBkw2Uid9rd3K9Zw6+TFWSmZYMkvLWDguB8iEBsQJHjTeFOBycvIuAKy7CS+P0ptAENoV6EE9sx+3G9NRiZc2Eebk4p+wHDdKTuzfHqdCT8WPdlN0kaZuYu1YAjRi8Aikja7ooe+IVYC9d4sokRXShKGRxhYmYx+0RNqL5xsHVn4yY/i8U+NuWX0L6LdU5N5ek43Yk7ESukLJ7dNzfJ9YMtvA4V6RkXmp8aNZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(33656002)(8676002)(38100700002)(5660300002)(2906002)(52536014)(38070700005)(55016003)(86362001)(8936002)(122000001)(316002)(66556008)(64756008)(41300700001)(66946007)(66446008)(66476007)(110136005)(83380400001)(76116006)(6506007)(26005)(53546011)(186003)(9686003)(71200400001)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?N2H2np7F0nyJb84Gr+5S3EnGkOaiiMOBie5PFBAdODPF9JrxQdD5u2wH?=
 =?Windows-1252?Q?lDosyoq+B5WALnCmz4Qi67vTsxa7uMDm/r6+Hv/t5GWqUmR/m7Yd3s4U?=
 =?Windows-1252?Q?mcqElRazyQ0ebJqW+o+dCvPXd2aiwosHAFJy6YBCfaVoW0+s+mbWySik?=
 =?Windows-1252?Q?8gAnnhtCXnpWe2uVwwavpDkY6eIcRdGFayx5L/6PrIZQ8L5VwK089iYK?=
 =?Windows-1252?Q?Yghu3SVB3bxGwBvTXq9Sn+jpdirZavbEcvdJ4WW+xvMUzUho7dh66niC?=
 =?Windows-1252?Q?TUKTO/W66RogRA4CfnrcNW6lk3Z3sJkLJqd5u/3zVYdByqE6tw/wKrly?=
 =?Windows-1252?Q?g7HTRjKw3Pjnt+GDmDdOs24A4puzbTaA18/zljHC7hHnv79p2Zltw87F?=
 =?Windows-1252?Q?9DN0IJ45HUczTKrDbDbxNzEqrhB2ULEyVtMSYUNfRnpbQ3ATED0YyiJt?=
 =?Windows-1252?Q?QBLrMv4gDsZnFtw37RpDtfIQx+afpv8I+Vt9WXN+oEVztGSt+j448VBy?=
 =?Windows-1252?Q?k1f5w6435MmrHhGYinHYwH3DJVDRQ4EerTxRc0q2klOLik1CjkGV3A/o?=
 =?Windows-1252?Q?0Angxh2TstfZ2dpptmSVHraGb9vY5tZsNaYEelShNqI7X+3dSDdXZWYw?=
 =?Windows-1252?Q?Plu0NLyPa/kyHXv1kbPLuFcAiHMLBiBEpx+UKD5IB7RmAAiirr3xbjQd?=
 =?Windows-1252?Q?XMvaL07uaaSErVQ90RMf9b0juUq2HYR1FTcdF5t8tVd+PvEoUCqHYkvG?=
 =?Windows-1252?Q?g9zkYGabPchpc6SC8SjgmEg4bxy12UQX1y62dFgcFSoS4nWasVsIvzAA?=
 =?Windows-1252?Q?KyK+7SxgKnUreypsI9UvBQ53sJQdju/nLMAvxU7HNtdwv11Lv6vpvcLN?=
 =?Windows-1252?Q?c2BZu8/nFTzk9abQHKqJbi5UR/c7eESAISVGcChzZsT50X0Bs7fJIbaW?=
 =?Windows-1252?Q?cHzBxKQldtpWavGaVuKtYamQXx4X8NZ+lTyGXiqnY+DZMivIpnlVec75?=
 =?Windows-1252?Q?TGZdyMHbD83Kn9GnontgmVfPwWSIPu0Ntkd8e8qTUG+Zw6xvVC1a7e0t?=
 =?Windows-1252?Q?hBRt6icAnlaSFwu1xQEB0NyuPIxLQ+GiganuCBZ/ioszX9mx9GajQMhV?=
 =?Windows-1252?Q?CBJ351MxcdmZbrcecFJ2oYPTvmMRzST381lovnC/h6qA1yx9qzfvQGrX?=
 =?Windows-1252?Q?mpBgD5atrSzcqqjucx3EzDCN2sEO5+yEMU/kMcQoJj5XYaXb5uSPVm7q?=
 =?Windows-1252?Q?UWzn2fmhVMDePCB4dT7B8UQ4/wGCBbsFnTNNBpDLwT93NIDT/651ujsV?=
 =?Windows-1252?Q?mKY4pRhX1v5xvcVtbBL8EaTA1wcGTSkPXqNyU12Em/nZAgcm/2ZYgUQg?=
 =?Windows-1252?Q?M2KIsHO8Cf0G40G7KWhQ2h1c/v8TF06dl7fKQIV+vlwlfG4KjfnJobSG?=
 =?Windows-1252?Q?jdJezGGa3lUKvKYxAVEmLC3YSsSWhRNmbKrhsixaOIuzWRuNN7vJfDUX?=
 =?Windows-1252?Q?+Fb2DGZS03OBTUQsSXuIQ7lVs+Hhs6UG6CBhUqTAYxfZQon3fjkvihxP?=
 =?Windows-1252?Q?6RuKiNgEN0oZqRc4DWWr6upJnGIVi5MbK9kQHSHhJRsZs650M4Ia91Ek?=
 =?Windows-1252?Q?RFBK8+volghJUHNb2qClrxWaHOo/YpZ3Nv9yqq5YyyFQm7yX7KybjkMc?=
 =?Windows-1252?Q?pxlGnd0rZY9uHt+/F5N7pGOpKnEvpzfX54xJ70WpHZ1mq7+xiB8cBmnm?=
 =?Windows-1252?Q?lZ7R3xC6rLrhz/GgJYs=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e044d7-5cdd-4468-0bce-08db3cafb4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 06:15:55.3424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjUYT8sgyfBP6pX42ul07YGMmJfSbIJ3JBFffim3wU1goZYXeeSnXclsm83KL3DzqVZzseQkwMz99TSitE7APUH6kdmpyMKW5azSoOEJRXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
X-Proofpoint-ORIG-GUID: RKHpUmUFRayKo6gUxLau6taxVG2EIk3x
X-Proofpoint-GUID: tjsHM98ZAZbi2WVU5v8htHffyktokMIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179987

--_000_SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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


--_000_SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999SJ1PR11MB6129namp_
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
<p class=3D"MsoNormal">As discussed in the meeting, sharing the GCC upstrea=
m=92s reply for =93Share work directories=94 patch.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:pinskia@gmail.com">Andrew Pinski</a><br>
<b>Sent: </b>22 February 2023 21:34<br>
<b>To: </b><a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br=
>
<b>Cc: </b><a href=3D"mailto:gcc-patches@gcc.gnu.org">gcc-patches@gcc.gnu.o=
rg</a>; <a href=3D"mailto:raj.khem@gmail.com">
raj.khem@gmail.com</a>; <a href=3D"mailto:Randy.MacLeod@windriver.com">MacL=
eod, Randy</a>;
<a href=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkonda, Sundeep</a><br>
<b>Subject: </b>Re: [PATCH] Share work directories</p>
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
</div>
</body>
</html>

--_000_SJ1PR11MB61296FDC4EA03F6DBD6B4C2FEB999SJ1PR11MB6129namp_--

