Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA51C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:20:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2884.1681453246343772461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Wf1EyRge;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3468fb4c98=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E6GOkj029087
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/N1pk83rACXZOSX6eYZPEGxXvjT+NDdq4Lrrttb1Xag=;
 b=Wf1EyRgep9aTQbCFyYmEL2kGYYqQtuZCwgNj3AvCuzDePJCIy1AQToXPgOgTwhElJrgl
 t17xJWRJMqFkBo5T/QsSnpMgzhusdFZkWTbjFHe2m7JMZg+vgQlPboqlkHwhTJtlJPLF
 Owu/4+MD1z6nNexNKWv2WJQjtLKzGr7GDzfE7drk1R6D1SvZgzbgq/XAwOtbS9XRXvWD
 HUzAKRnM8TGqkEbYy3bISXJ0uOXHLG3fdQevHxS2FsWc14qrSOJqKvHOi94tGmL0BWsO
 LXjEuhRJTDgHK24mXWCaaL7BAYoQmSDnBirXWYKJGTB5LEPD/bbWyRLpE/B1Py9BPG8b Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7dp9edn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:20:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33E6KivX004330
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:20:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7dp9edk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 06:20:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsiLzUhSEiKTYtqwRnuDoMq1n07ai1161cinzwfvs7ggeXPXOTx9t/IRMHmWE4/f+i9WWAmtBjFieRRTLiPdEOlzwbUkfoHdWFR0fhrhlXCkSZmvT3VaQ6AYlWaGPGX+Bk79uEK075bbF9tKtxVOsMeO2w0veuZsf2Rg0KOKS97zRpJLueQwRZQMME5Q3hKNXiemnSM2kSYfdPcc1xdsg2mFtosCUJS2nh421LPdO49r4u+WAd/9XfUecjonavDyHq/OABcdt79EKPH8TGMV1upbxo8HJ9GSJ4TJlDoKtVw0MLH3abM3pALcmoSx2G/OlduKCLGap79Iz+QYWiF/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N1pk83rACXZOSX6eYZPEGxXvjT+NDdq4Lrrttb1Xag=;
 b=Y1v79A8V8q6qR4CI/wznm0BVpcddw7X/nc0WM8beYw72AaBzpTIpEczgp465BJctmhjblSt3jUAxVg8MWE38cJpO8XOppqKkpvuOTXReRu8JlRUUUgQ9kqVyDwYfLY2K7LhlAgIZxPabnF7kmxXc/wFHGIctKL4qvyuewi9FKTk+LRFKpcyQ5J5qe83fTtp2n0pKT71+UT0bQn+37nyT3Fz85XB809dOoFUoIRQec5UnjPoLTiDvzThQskPEM0KB23oUH2UdBlurv8ukUU3Bx+UZzqwEM7B5KeN+n+YlSNpJ/HBFoMi/+OEdob5+nggioAOcm07tKHqbru11/ZC2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 06:20:42 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::ae46:be17:d89d:db39%4]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 06:20:42 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>,
        Khem
 Raj <raj.khem@gmail.com>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "yashinde145@gmail.com" <yashinde145@gmail.com>
Subject: FW: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Topic: GCC patch "[PATCH] Share work directories" to be discussed after
 GCC upstream denial
Thread-Index: AQHZbpk9jr6tp+f1Q0mmDfD7NxZbjw==
Date: Fri, 14 Apr 2023 06:20:42 +0000
Message-ID: 
 <SJ1PR11MB61295601FDB553E1C8820C71EB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 2df02e0c-20a7-4624-7690-08db3cb06015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ND7LHJirNOHQ4USSsIUt49UH/3y8W2sB/A3W/O9PjtNAQmJWpJyMvHLizw/1kUY86MRXdC5EvNJtQbi/sgGUwhN2pmwWCuScURQis3adkBRmzl5IbeymjmYl8NvsUYOZQCxh2Dz/N9gdTGjNptJNpRrmHezLvAQoGBy7BKhbivSB8yMk05WaD0zv0Hvd/ywHVmrgUuEQ28t4z/9lknvDchWLZWgbwELDUG3I2GOaOnLuGnvYRBKEEhwF8bqJ+SAOPV2392xRrXYZMqeLGE87q3s4p421ChXxEvbnIBv0HDOvQva487EzZVeNr2LmP2OBJkUb/iS6PQr5pAca/0ZYbodAMAUuhrvq68qwV5egfSuCL/yQYMBcymHo91guQNHrpfPloR2J+6CRNCvmRwDN4OIrIVCOLhtmT4rMd4va4v9WzhSJSIqoxIUENVo7fbfgif+/XXVkk5tweDmUSIcR8Q8cnomXjcA5of+Bkflkc6V6IzNNZfMBGmd/aF6TERHV7Te82KVwak3sqNXfrTQGgzzifzGLUAf0fofgKRkESJndZtgjynDbOvu4lzYg+BYOWGqi2gMTNPHFbJeV2uIRh/casY+1lbyQwNEuf0Ud5nswYLW8qdUuzyiv/m22Ba2g
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(33656002)(8676002)(38100700002)(5660300002)(2906002)(52536014)(38070700005)(55016003)(86362001)(8936002)(4326008)(122000001)(316002)(66556008)(64756008)(41300700001)(66946007)(66446008)(66476007)(54906003)(110136005)(83380400001)(76116006)(6506007)(26005)(53546011)(186003)(9686003)(71200400001)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?0esq6sPqWwpPxmkQ5P7KToFOaUD75sgxggL0NCFvWUmxgL9yNQT6m3oW?=
 =?Windows-1252?Q?/eX4YgHPX/ZaJP7EvKuGcvPvFbLZW3iI6olTOZwXXW9Mjap7VI2p6gjN?=
 =?Windows-1252?Q?nTw+dUyFH5M73Gpg/o/hMrKYRLlmdyB31BUN8hClcIlogQ/OSXVgjgp4?=
 =?Windows-1252?Q?SlHnuuePu47lkiVY92Eyn7dwFoBW+FwXqc2IkFfU65GgewwUkmMmJrmh?=
 =?Windows-1252?Q?jTkrbDjNNSecJYPcDZyhBImr+1LVVq3oXCxnmmbc7basVMqho+dNGuY+?=
 =?Windows-1252?Q?Kmug5seYByL81Jq7Y65AwnQ+LpOIBRkP8ic+cPJL2T/sYAW6XagstuPN?=
 =?Windows-1252?Q?Eaqo6z3iL+yyg3tANtumeS0v0ceXEk5HYKMzRH9d8yyO09z+5+melj88?=
 =?Windows-1252?Q?HJg8+gTWZggTxMrQ2EqqOEq+StPU6bqZSQ/iE3d8Nvnz/KG4PLlL6vM3?=
 =?Windows-1252?Q?AaknhGcpT2EcKV5aALPggdKMrLQeOaO7KF1IXTI/IHTVHMJwge2hZ+gZ?=
 =?Windows-1252?Q?ST1+uCkQ8imREwglvKRM4SLEEJeaN/UBQyIUuqCZS+Y39tFgHRyfW66c?=
 =?Windows-1252?Q?gNmK2OFF0C6+Ozu85FVOw+xX/2gPaW6zg76o9T8209JT14qH/yLz3XNk?=
 =?Windows-1252?Q?LKfxjxKXOh8oeb6ALUztsQNeDZTr+Xe+9QVm7+nDI30RdNljZ5dpoMVG?=
 =?Windows-1252?Q?ozuhyL5a3kRqj24AL12RfBDSJvzeJiejJJ5XwjVvKwtSHtWSPT8GX/58?=
 =?Windows-1252?Q?LYZMWu7+f58aWQ6Q94lPIADudaeCEP1+U/tmb1ny8rw6zWIpdz4ctin8?=
 =?Windows-1252?Q?17moFez45N70Ja0ZzKlsaaY0erGwALIQnDFOpX7wHJVvNbDign0E8KOz?=
 =?Windows-1252?Q?bydZ1PvDGhFyFBQVR47nZi8VA+Wu1jAvWWvvw3px4YP/2+3fu3TaO4W3?=
 =?Windows-1252?Q?BGxP4ubCls/9Cju4vw6j+OFHzwi33yovdDEG1FPl6ubhjzyk2pTUFb9j?=
 =?Windows-1252?Q?E/eNlRTxAMf417aI2EsX4g2ANiteqISqKLU0bU1gRiDD7vLJYIBbIfNq?=
 =?Windows-1252?Q?IYc0BneXOq5bswkQzdJtBgGLzBguHxbMFo4GpaKTdYTsD5JV8Ksj4vla?=
 =?Windows-1252?Q?AOtM1yV45LNMv3WEforuCjXa41Tb5pD0i1J+ALaKTENI64BbalnG97HQ?=
 =?Windows-1252?Q?fXNUVIgUY4Kw3VOh8M04fONzQNO3fc2/u4e53tnw+sb91b/hKpfMQYzC?=
 =?Windows-1252?Q?udyKxNuqDI2Zk2eRRBEFV8qdrrLrqbxgLMVyiGIevtsdrZpgUvfp+nJr?=
 =?Windows-1252?Q?z+GmYt+GqYLLY8LplULfe+VvZtvuAAO8TelepqcCD/40LwzB9BGejxnT?=
 =?Windows-1252?Q?RyhbCi+Ngx+SjGOEFCQRubptxSmW2MA+daoOtagkG3UPC5l7LaSehp1h?=
 =?Windows-1252?Q?6DYlKzHluXeXGR37GIlBpzVmnml5YGoJMhM75W1JKcz2UrNIMH69Sequ?=
 =?Windows-1252?Q?ib94vQbHnEzknD8RelzlOR1R845LMkTVvV8BqNdaxySYfmmfHtM1gjnv?=
 =?Windows-1252?Q?YEIpr3XEnAIqOpQTAJPI3jlSR4ncyeIlaT80JZHBt/BCh9Enirr+z/ZH?=
 =?Windows-1252?Q?wKOnvKChlCbwg4mvoNB+gSdEdCKh7HUN4vxcaRKwX4wnV8Fg/v/3DaON?=
 =?Windows-1252?Q?VTtANJWUeNbukGzs7y+Yff9VuUGMgTOg/e9ebkFTCBQFb/NOLgiP6YqL?=
 =?Windows-1252?Q?MSI+77BMP2Os1UQFWn8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61295601FDB553E1C8820C71EB999SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df02e0c-20a7-4624-7690-08db3cb06015
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 06:20:42.6955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpoilsF8iWDm8g3MRmQ4eaTzR99ClkyarFNbDPkOrfWeZLYK05RNitCo/vGw4gFNJ5PuHrzWTQODDRbBupDvg8N2D7RI8SxFtE1IxCkdGRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
X-Proofpoint-ORIG-GUID: SvDlyjn2hc2UZJvjz4jUoW6f-5kzYciE
X-Proofpoint-GUID: ckEeGoldK3mkfl1a_iikD4LTq3ikFdEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179989

--_000_SJ1PR11MB61295601FDB553E1C8820C71EB999SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

As discussed in the meeting, sharing the GCC upstream=92s reply for the =93=
Share work directories=94 patch.

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


--_000_SJ1PR11MB61295601FDB553E1C8820C71EB999SJ1PR11MB6129namp_
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
m=92s reply for the =93Share work directories=94 patch.</p>
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

--_000_SJ1PR11MB61295601FDB553E1C8820C71EB999SJ1PR11MB6129namp_--

