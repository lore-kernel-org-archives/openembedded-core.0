Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF68C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 02:27:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2519.1652754440525162056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 19:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=a69EnZsR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2136de53c6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24H2AkhP000300
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 19:27:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=+rppkHGQC7Hekc0OM0IFsVivTyiFQcjGmzCNpuD+E2k=;
 b=a69EnZsRWKFYWmRcIgUMKokHfRIUC+4cg5o5FPu6/jz+htElIhDGvK+7cscce9YF0p2r
 PRPsJJfM5GuB3OHe7t2imtqqzm8AqejH2XqZIszYpyh3n/PkoBy2TimrXRafNk+6Hv2W
 +1oqPqUYTWLnBP6eIe5EoQT5jB6zk+JpCkYCxGYgjFtvUAsooeWauBCnnA+5biToIxto
 gQ2b5yo3Y1lgAF8Fv8DbGjwrTh8NtvNGzHLAbTamT8r+64o2Gbat+zA0rmnLpUyeNREW
 bv8EYwGOgd4moOeu4g0t43mp/IHj5qlYUn/dtsfNGLERfUC7NH8Rw92H0obOcLekbQjc fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmsvfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 19:27:19 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24H2RIwo006402
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 19:27:18 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmsvf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 May 2022 19:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANJhQntmWqeX9ZRGTyXPqWM+aD/bCvAWu7nbBU/RmME62LruII5N24z9+rOnoiaoQVbEnkKS5Yptncb4OdxHORIPe+Zsb/5ISFTZ2ncnyYw88PH3EfYqFZjhT8T+htlN88iCU2ybzlteLsh3EsOShgJm48AvWougmOxzuqwah9ahImNAPSwzRboDtx9BGYH7Hu+um8BH425GF6awt/F35u8AWrcpO2zBIHowxW6VjZiWEJRpQVaMU3g/6UN315yCdwUQGY3tAVtGADxEWEV9btFezC+cwB8DPvLfNNiI1jQZ4Fb64TMKyWuYydY44ylyyJHh0HcFycwoM3FxBAA8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rppkHGQC7Hekc0OM0IFsVivTyiFQcjGmzCNpuD+E2k=;
 b=fCpDGUyklDqxVOT/dSR9XY4LykNc/Msv0aGRdLZcuY3Fk5kHJBZXGCDaAWo6Mfzoj2gXOnOUQiurq923nXKdCWIw5q4q6D4vhnJfTWu23GhD4P33eGDeMum8aEZbTwwVdYsYMVVGea0kS8Jaao1ORXWIKSdCSoAfdgz0mE0lqql++4+isAGycmsZkDSegmb1b8CJClpFE7t02qUPll2r7nPKgICPa8gfC81wepc2m9I/KjL7tYI1yUiYY6ArtC3WSVhKhNQdkWsOL4iaadz01MrlO8+Af/09FLjHsPTE5waNHvLf9UgUp4p0EoXDz7Z5yzD9w1LK84fcgQBcAQfqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM6PR11MB3499.namprd11.prod.outlook.com (2603:10b6:5:61::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 02:27:15 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 02:27:15 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt manpage
Thread-Topic: [OE-core] [PATCH] squashfs-tools: always install prebuilt
 manpage
Thread-Index: AQHYaRNbA0Jg4WR14E+XMteRzIZvUq0iU8aa
Date: Tue, 17 May 2022 02:27:15 +0000
Message-ID: 
 <SN6PR11MB255785E91DAB262B87A46FBD82CE9@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220516104207.1734099-1-changqing.li@windriver.com>
 <4e640d6e43aae9a6be851539f6ddbb7882b82a62.camel@linuxfoundation.org>
In-Reply-To: 
 <4e640d6e43aae9a6be851539f6ddbb7882b82a62.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84024106-e700-4241-f213-08da37acc1d6
x-ms-traffictypediagnostic: DM6PR11MB3499:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB3499514EB5F90CA00CA0416482CE9@DM6PR11MB3499.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xeb2gluJOCB4ddKX631ji0rAt7+SahUqf7kfdYhRjRKgkhwV3scBO+TsSTZzDANEnOCmZtWJrAquUeLEBBNu8XJaCtpXo3dO2wiFFrujZlTkPITC2PNALMT3dRC5MUTs1UUYwX0rjVdcpM2hUpos6wogN2FUpL9HSbnqgBW5jD7Q0UZC1R6lBa2/E/NcSIHRrtrb3oJaOR4wdxz+KWAnKRSonnnRAlQlHzYxu9JDynRZmbUnNqWNrnEPXAYLKamxeisJZSywYsG69HF01XBaspZCjUb6HMtOKwMG9S8R040yc8Y6qDlZYYdAjsDheGn7JU9V/nfqZPJaQrfamkCc7It+UgV0OEbOQPZLsKSLgJy8rFiJ3wuNOUmGqskeioCYsLchf5Lk9vEJG8fUgAerBgSHfXoDGncRsfP3JB7X1mEQX1hdEwQS580j1iyMkNo+Am8pwJXZh/b16HwN+QTEeE9Y9p0xx5L11C3aKE5Q0FHkkRtq6mu0JkocANQVtmwvh/Ug9pFTAhZMzckWyVC1/Bt+4ux+Qf5vXMoxCp6FmTl01w/uxnQDGmhFbZ8uD8BOeXOdYggAmGTGvkswWDQyVL/eScr6y1WH/FxIrGEFc1PJRLwMk/XPBaXnyQx4XYzSjYEpg43OF+QXWES0CMiriZ7BIfbvBPpNg0aIV5siUXygAP4iGXIvLnHd+A3clx+laqf4qxP+iY+/praDq4hlaQ3Yi0pASSDtNCJUlqkxmhE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(71200400001)(53546011)(66946007)(55016003)(2906002)(66556008)(33656002)(52536014)(8936002)(38100700002)(508600001)(5660300002)(26005)(9686003)(38070700005)(122000001)(19627405001)(110136005)(91956017)(186003)(76116006)(316002)(83380400001)(7696005)(86362001)(64756008)(66476007)(66446008)(8676002)(13296009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XJwvwMUEINiO6mLV3jegjQ40H/jmA6FZ3W5PAg0SPlJSzb1LmR6t6sDKUz?=
 =?iso-8859-1?Q?iJMYcQaApfo/l4UqB5aBmrGuz0M8kIS0AaIGTxzWdgr+pDKDVJ2bnXwJM0?=
 =?iso-8859-1?Q?XvSHT6ev5nIiOHJIw0/jiJ+Tz7msnQO7crG5HMibL6DNqlTaWMzJ5/EWcr?=
 =?iso-8859-1?Q?ZaDZPyF6RloTzT8Rxe3WWlnoaoW27eKya95/lNzrTpns7Ow5jEV2oc1Eil?=
 =?iso-8859-1?Q?gVmSzoFnmBGvCf1xeCwjyDUusf2kIMK9gbyG29njISWShTbSdn87T8BLI/?=
 =?iso-8859-1?Q?CdpZnorljZ7QXDiYhtf1sGnubWIBRb7niK0UIffR0a1tTk2zTYl+Shk2rF?=
 =?iso-8859-1?Q?GQHizcX1Gf0zDMiNc+XVSToq4n4CmIgITZDdEl/Y+CEBWqEPxN2Yj4zVrs?=
 =?iso-8859-1?Q?IKDwXauk6qCqkDcqtJ/Y8M3+KXU9Qko3J9fF2VuRxPZ5meiX/V/ZOmwYu6?=
 =?iso-8859-1?Q?rsXZfRo/5+Bl1n2DhWUruEuJ52NsoOzz5IJmzemV4YLq4tzU/nOW+QyEIS?=
 =?iso-8859-1?Q?8O+DA3tCJaAtQlybnWa0BrpUl8oAx1cSE3CJxDoXrRu3Flr7JkidEtyTp7?=
 =?iso-8859-1?Q?Wr9OYaC/aiCC1MEcavTx05KNQU6STg8Zv5zB6IUwF9WhgIhPFn2d5HbYqL?=
 =?iso-8859-1?Q?BZGeLSGiZNBdKzOUWSy+h0Y2ou2cwJI6r2ZP97X8fa97nkUC1r52QR9jUj?=
 =?iso-8859-1?Q?9e85wCmeoXQEljj2zDXl2rjK3eFvCqduMaU855xrBr7SVpokEsoicbIxNP?=
 =?iso-8859-1?Q?uUu+PLakCFd5FkDFGVMAOYNJosgih8Ma2Do2kFGfbkcPgcacLwP60Wzsu8?=
 =?iso-8859-1?Q?IdlcBgivt1zDWrVs6ixY757m6pAsCbmBq5cuUV5A3Sdhum42xlidWsEq6+?=
 =?iso-8859-1?Q?oSNfkdYrCKbZpBeHLm44Ssm4IZCZ3R8ZyXMTBUnHXfHM5L6PG8dGsOdcpf?=
 =?iso-8859-1?Q?iYMrduB24+IHvV9bRxKcKiB1FLy/xuGyDhZShlc9e9WUrA5aUQu9hsX8w7?=
 =?iso-8859-1?Q?AKp7imAmjAubttFoPBh8Vt67AAh4MMR7Kukwh2/CJjaqqew8hBI7qf8dkt?=
 =?iso-8859-1?Q?+yQMSQFwU9hi7btxM2PMHPiLbGvNAQHJ3tj0NWg6mDXBUbwBS2KzXeW9jq?=
 =?iso-8859-1?Q?0H+iIVC8NIlzNbi/KaKr/+PgPpNboEaPr9AiGJarfwABM9da3OlRTKO4/F?=
 =?iso-8859-1?Q?fLRLSV0ZbBjTq4dQJtCAEaOV7Zsbi7M8a99H2ijh2k1LfcVsJHmXQu4ghN?=
 =?iso-8859-1?Q?j0mqxAKmC9z4C6DANmk2n8xEH8bJLApEeAzE9rh9uzscwdXRf0vKYVRKg6?=
 =?iso-8859-1?Q?4EYRLRRVfimBnHXU1PdPE8qiatvD3ScSGR7rYbPrC2QPWp4rIrUP/q9jW3?=
 =?iso-8859-1?Q?vC85gSQdZUU89TcMUvh1ASycYfGT1+PoVk30NOeXJ2Eku6ehLPOQEPZXAp?=
 =?iso-8859-1?Q?cTyFM0RKoweUfvUkUtNqvb+IzXnawmNksb1QBoBkJ8sfaat1D6CZ2WNFWz?=
 =?iso-8859-1?Q?7MchMhKYAM5GdeVjtKKMysdOzTm/T0GGHZwPm/YkrnzPkTohQ5LoHhAd0j?=
 =?iso-8859-1?Q?jZFkhT+DJfEdkn6cvBzheHwJjaylHmwiT7igq0TzYOBKZDg/6WdikHSq0p?=
 =?iso-8859-1?Q?tFqgdd+u+B2veM4D1HYVfe1kFybLVB9qDgUU3OWP8i1GYe5fhAngqTB12r?=
 =?iso-8859-1?Q?MPYDLDRmbwX2aG7bDK5FrYEHvW+VPZKFZ/sOL8csXdE++WVWECqzG9QIzG?=
 =?iso-8859-1?Q?Sq+UYIPDhYAxQXZycvCNhKiROVOzbQECkDgYC3LJ/JydrsR0Tl9bix9sjp?=
 =?iso-8859-1?Q?m73dw2DnuV9WtmckRdwL1cKOTKAOMiA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB255785E91DAB262B87A46FBD82CE9SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84024106-e700-4241-f213-08da37acc1d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 02:27:15.2025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UvzzIlMkHUFm4qXALwyCkCF/KT5FcZc5wFXJVEKmMGdp8cz3FdgCWC1FeHug1+xD1Qalrwqj842asfiWGuDCOJBfL1X8KIvn/WFu7mpu5RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3499
X-Proofpoint-GUID: r5wAaN3ECsjmMB_pN9HTyU_2U14X58WN
X-Proofpoint-ORIG-GUID: 60L1arFHwTN5Z0QnfMXMvEsWVVGGHruj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_16,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 02:27:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165703

--_000_SN6PR11MB255785E91DAB262B87A46FBD82CE9SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>
Sent: Monday, May 16, 2022 6:54 PM
To: Li, Changqing <Changqing.Li@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt manp=
age

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> When other feature enabled, and involve help2man into squashfs-tools's
> recipe-sysroot-native, install-manpages.sh will run target binary on
> build host, eg: mksquashfs --help, which will cause error.
> Eg:
>  ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6: version `=
GLIBC_2.34' not found (required by ../squashfs-tools/mksquashfs)
> > help2man: can't get `--help' info from /tmp/tmp.pEG5R8COVb/mksquashfs.s=
h
> > Try `--no-discard-stderr' if option outputs to stderr
> > ./mksquashfs-manpage.sh: help2man returned error.  Aborting
> > ../generate-manpages/install-manpages.sh: Failed to generate manpage.  =
Aborting
>
> Fixed by always install prebuilt manpage, avoid running target binary on
> build host
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

I'd much prefer not to carry a patch doing this. Which "other feature
enabled" trigger this to happen?

When  meta-secure-core  is involved,  and DISTRO_FEATURES efi-secure-boot a=
nd ima is enabled,
in meta-signing-key/classes/user-key-store.bbclass,  it will add DEPENDS as=
 following:
DEPENDS:append:class-target =3D " \
    ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot", "sbsigntool-=
native", "", d)} \
    ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot", "libsign-nat=
ive", "", d)} \
    openssl-native \
    ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot", "efitools-na=
tive gnupg-native", "", d)} \
"

and efitools-native  DEPENDS  on  help2man-native,  so all target depends o=
n help2man-native.
efitools's manpage also don't configurable.

We might want to talk to upstream about making this configurable rather
than carrying a patch, or we make sure help2man is never accessible to
this recipe in some other way.

I will talk to upstream about this first.

Cheers,

Richard


--_000_SN6PR11MB255785E91DAB262B87A46FBD82CE9SN6PR11MB2557namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> richard.purdie@linu=
xfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, May 16, 2022 6:54 PM<br>
<b>To:</b> Li, Changqing &lt;Changqing.Li@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] squashfs-tools: always install prebui=
lt manpage</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:<br>
&gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt;<br>
&gt; When other feature enabled, and involve help2man into squashfs-tools's=
<br>
&gt; recipe-sysroot-native, install-manpages.sh will run target binary on<b=
r>
&gt; build host, eg: mksquashfs --help, which will cause error.<br>
&gt; Eg:<br>
&gt;&nbsp; ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6: v=
ersion `GLIBC_2.34' not found (required by ../squashfs-tools/mksquashfs)<br=
>
&gt; &gt; help2man: can't get `--help' info from /tmp/tmp.pEG5R8COVb/mksqua=
shfs.sh<br>
&gt; &gt; Try `--no-discard-stderr' if option outputs to stderr<br>
&gt; &gt; ./mksquashfs-manpage.sh: help2man returned error.&nbsp; Aborting<=
br>
&gt; &gt; ../generate-manpages/install-manpages.sh: Failed to generate manp=
age.&nbsp; Aborting<br>
&gt;<br>
&gt; Fixed by always install prebuilt manpage, avoid running target binary =
on<br>
&gt; build host<br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
<br>
I'd much prefer not to carry a patch doing this. Which &quot;other feature<=
br>
enabled&quot; trigger this to happen?</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">When&nbsp;&nbsp;meta-secure-core&nb=
sp; is involved,&nbsp; and DISTRO_FEATURES&nbsp;efi-secure-boot and ima is =
enabled,&nbsp;&nbsp;</div>
<div class=3D"PlainText elementToProof">in&nbsp;meta-signing-key/classes/us=
er-key-store.bbclass,&nbsp; it will add DEPENDS as following:</div>
<div class=3D"PlainText elementToProof">DEPENDS:append:class-target =3D &qu=
ot; \
<div>&nbsp; &nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;=
efi-secure-boot&quot;, &quot;sbsigntool-native&quot;, &quot;&quot;, d)} \</=
div>
<div>&nbsp; &nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;=
efi-secure-boot&quot;, &quot;libsign-native&quot;, &quot;&quot;, d)} \</div=
>
<div>&nbsp; &nbsp; openssl-native \</div>
<div>&nbsp; &nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;=
efi-secure-boot&quot;, &quot;efitools-native gnupg-native&quot;, &quot;&quo=
t;, d)} \</div>
&quot;<br>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">and&nbsp;<span style=3D"color: rgb(=
0, 0, 0); background-color: rgb(255, 255, 255); display: inline !important;=
">efitools-native&nbsp; DEPENDS&nbsp; on&nbsp;&nbsp;</span>help2man-native,=
&nbsp; so all target depends on&nbsp;<span style=3D"color: rgb(0, 0, 0); ba=
ckground-color: rgb(255, 255, 255); display: inline !important;">help2man-n=
ative.</span></div>
<div class=3D"PlainText elementToProof"><span style=3D"color: rgb(0, 0, 0);=
 background-color: rgb(255, 255, 255); display: inline !important;">efitool=
s's manpage also don't&nbsp;<span style=3D"color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255); display: inline !important;">configurable.</span=
></span></div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">We might want to talk to upstream a=
bout making this configurable rather<br>
than carrying a patch, or we make sure help2man is never accessible to<br>
this recipe in some other way.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I will talk to upstream about this =
first.<br>
</div>
<div class=3D"PlainText elementToProof"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB255785E91DAB262B87A46FBD82CE9SN6PR11MB2557namp_--

