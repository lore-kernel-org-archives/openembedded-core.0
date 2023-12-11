Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AB4C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:35:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5527.1702290935080243625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JakVyOC9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07090768a2=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB6K1aW029238
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=Xhk5J2w9+Tam67BUNo
	ITmMpVCtIP+1nBfzQp3h5lX1k=; b=JakVyOC9AGTo4tisDueoI1mSdFCEXdVE/9
	PTJ9wIuHsY1q4h8Gdyv+K59t7hy4/ZMtKp0UBfEmPdklFCLa/tHONw2RusSpCsby
	RaueTg3aVPfXwMqekDMyj1+7QcKN8U7dzRPYx+QO+EaxgDtT+2nqN+w3TEwgU9fF
	iONWdtao+CIAGV/rL3/oph8S3WPCZeFUeusqoOF5zpk3KGBz89w+AJ7HchRJ4CTt
	Jp3FO870/Trm6fAg7XspaYJV7tCU6W0VRrg/hbnbyxaK1Ha2oD1X1m6dROfQDcId
	ZYxTQ1itDvInAyAeYcxWCbw5qelLLZZsm9FLG0XTOJTEllypJnMg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvf761jb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:35:34 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BBAZXHQ025268
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:35:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvf761jb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:35:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R++j2p7onG/lqFxtT2ppIKeVxAmRUB7v/UXbL4oKC4kLWSZLTeQKT/BlxvuQVjkLDuSHkjRYmtivmVpXd67UdmScD7kQ45Lja9D88Foa5d5HmT2fV91LmOz8Nd2fACJlKNUnM5Vp2F5ogrbwINNpDcQNFc1sRpDmyRa8r7NCO1qLefzt6b5FgFWXf/J592PyGGuHAFjYykkMmsD/lvnsw4zq9J2avFL0AH5wktmyIacUoJOFq4fMLLqmFOP5/SmxAlDXcULrt57MeHZSD/UxiS2dEV1jG4XQy/YB9apVitmzpQKHxPlXOcUfiqdAcXpHtLeSDMfMxd7fIkb9fiWZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhk5J2w9+Tam67BUNoITmMpVCtIP+1nBfzQp3h5lX1k=;
 b=EIz1AemK/EKIJcwPBvRzBzTpN+Pji9azcqtb0cR0+1Ap7bnfkFGqwq9AvLgNSEzlWKzr+VVsZzkRXb/n3kUzJStu9mjVQxywuCIIZaOEkjxDFTPNdDq/i9UX+JiPzkoaCqxkDNsNMXJrtLzN3wX2eFIXq5JJK93VTqn1PmXNW1Hi5XfmGpORtk25j8uzQ3wy1cEc2AmEjJgMZmxuyz1FWCNluz1HQttqXtK/7mCGVNxwTNtAdvFvQj35/8OgR9/jb0mYt96C3ZdN9p7Qm8Y1PiREsm5tT7r0UptSOlpmU3k0nZtSe1x6u0SKdNW25g8XLbNZ77DGzVTHLTMnOHOkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 10:35:29 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4f9d:3b80:9e57:685e]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4f9d:3b80:9e57:685e%3]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 10:35:29 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and
 CVE-2023-45284
Thread-Topic: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and
 CVE-2023-45284
Thread-Index: AQHaKprdhDnJPrEseUu3rSlToZ2Zu7Cj4rH6
Date: Mon, 11 Dec 2023 10:35:28 +0000
Message-ID: 
 <BYAPR11MB3397689BFA5B883B5E49BC60818FA@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20231208104215.1425474-1-soumya.sambu@windriver.com>
 <202312091225509233e4be@mail.local>
In-Reply-To: <202312091225509233e4be@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|IA1PR11MB8175:EE_
x-ms-office365-filtering-correlation-id: 8145de7b-c9d3-4d79-56da-08dbfa34e48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +W6XdBJV/jlHm+agW818MXt10AwlGYDXdXJMlELPL0+0y17dZZ+L/8SJoYG8OoBHHSEvzjtsQ5/Saipx8ePT/lmaWTvvl0aFU9UqKOBjhBk2Z1YMoG7fc2VfbDNYtyfmW21e3gPLGU8fGqtbH7BKU7NnFwMe4aR+94YNJQAW4M+RVUW111VvnTdYOFOw+sdhlR+AMm4oVf6LVeOZp0gQ1izG8u4SS1AlN6kyZHjZxF/yABYYz51xVrE3pEOaZA5eyD6yzNmKwAFBidFAX2lu0Y0628r+oIpy9eyjMW4uOv8D7E8mOIepUBU0hFaT3q/z/OZBIQ78raJhafZqCyHIgv62eSozBjkhKeFn19OKFVTyeF0DxxBEMVMMqss904+5E4Vg4WXAfB+UKo3AZqBXO9WP82SbimLcId24oOC1kleLpOk5oktqQ3PsgR4qCSkPmsY57MSIM+7XREsD/WWL6DyoWJKU+eifUltMofAs3oZ8yS33P7mvuHfNebfCFIBMf1+U9WMAA3zx1Qhkc2OOIvO0KTvWjzSXAocUNli0cpmD9afNZn0j0SQf98nmz65BnUsve1OisSS9DQ8j7GIb+NmDk0KOhpON3HdqbMsd7kQNW0Vaf0woTJDmvHHaqb6JAj4nsCcn+W0yR3r5gony+SrRbOf0UwiPtMTLM8zTiRXYO+rDg9P/xnufocrnouFr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(346002)(136003)(396003)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(66899024)(41300700001)(26005)(83380400001)(38070700009)(33656002)(86362001)(38100700002)(122000001)(166002)(5660300002)(316002)(8676002)(8936002)(4326008)(2906002)(7696005)(6506007)(9686003)(71200400001)(53546011)(6916009)(52536014)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(478600001)(966005)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ih8hk4Z5kpIOIb+9smpb6lGEMKAnf7LSUZak2WiwY8RB6DaEUnnKzCmi9Oml?=
 =?us-ascii?Q?DLYH3mSbKDUAowWp9Hyzao5p0N4MGFh6BJcmtJtzEAq0Y0nHqEKLyJegH8Bm?=
 =?us-ascii?Q?j9sck6ydKHO/7Y62UibgUF/8q1hmLAyvMe4dAFfPCxwfIG6NdOa7wJLqmbE+?=
 =?us-ascii?Q?CwYLkbrP57sxjXBSSFr6cvgdWvSGixiUktq277aYwY56DRZNT3l9S9uYdNwY?=
 =?us-ascii?Q?A9FRRX+9N4X+gc8ySiGVN9lo9J1QLh5KT5+z0E46O/pdBBw1ZIq0LzhCPa9g?=
 =?us-ascii?Q?QFyH0VEumyTK7NODexcIClE0aag88q2kC1IlbqQyJcn7dbGkbS9uT9vpcS3l?=
 =?us-ascii?Q?kObhpVFwUobztv/Gi5Ssf6q6U/QZ4+vD7g03MIhODgVl6zq1qDnlyj7yKboV?=
 =?us-ascii?Q?q3n3FJ+ZDnu2KGn4Qx9X/JJjlNJTiedjq7ZFvzcIX7LIGN0VpWsbMBy/+2V4?=
 =?us-ascii?Q?Hs/yxtjDMrbDbY2qFn4CNLM6a0OLj642XGOh17nQzu831ICkw04TAgROpkwF?=
 =?us-ascii?Q?TC0+PAdg9J0r/uPa6gDmb3xoniASfJSVuQ/B9CjS0vpQbIMqpllqm+082yKl?=
 =?us-ascii?Q?AEWHRCLoAoa1TsSIj1H0n3EL04b364rl1AczyRTVjDu8hX+VJTu6m4a73KSW?=
 =?us-ascii?Q?ruuedrkDlOX04P0Wejhl2g75jGi36v3SpOjIe/jBYL/Jg3ppMXo+CsJ+Nynh?=
 =?us-ascii?Q?GcZ2hO0e9ImQUnl6Ctq0UqSIBauDGr8vXDlN3p0n7z+lo1/V3rcwvr1kYNVI?=
 =?us-ascii?Q?dP9c8wNvTUQPlMk6JIqY83GomcyqsYdPTeK8negNbk/KedRfLhsbE1/savVF?=
 =?us-ascii?Q?UGu0IbDGJRvQ1z6IAA0pH3LxoABVfQ1q9Q2KhHaIzN82C+zru2P3FyM1zWIi?=
 =?us-ascii?Q?BODn7KoHKjgyvF8UQXC85J+3msCkh3el9V/+af3RzuPlT4KXJn+zxCh3k5lH?=
 =?us-ascii?Q?YqMy5SX/KWGWVCeYL2eJ5yPBubi47JJs7GEqW3lmjIBGSM8of/qxzMCw21mE?=
 =?us-ascii?Q?gL5aoqfUMgWmGphqL6BongtXyIOOzIMaO+6MUU6mrrmjI0uUSV3evG+yBPv3?=
 =?us-ascii?Q?eXG4ieYJnfB03ytrX/eQ5cVmX60vk6B0/wkIWl+ZE18Km0DCkc3ZHtwpdNZa?=
 =?us-ascii?Q?nG5dyd299HF/HeT2alVR99gVSq+qVjo7hym/lCuW+e8+M0UpCmZX10LMpC8b?=
 =?us-ascii?Q?LN4uGuoRCcAYZtD7SuPyyQCyOfHO4qzMZ0/yTBmFk2PhToHobk9I7HFg7aau?=
 =?us-ascii?Q?nfLHzyki5ZN0GDRUJvptsmnwcuQ1cIv/SbY4UswBI/39vOwOuH4t0+YkyNGX?=
 =?us-ascii?Q?p0w48GKgCPsQ3ENTUeEN5Up9PwY7hErwUAwFar/mEYEYRtCknLH/ZfMqgl1v?=
 =?us-ascii?Q?h8w9sx//3G/OeNUhazhWdkOv9WoEopxBHqvfOaHgAiuGJoRTUSE5DGAPL691?=
 =?us-ascii?Q?Ggh6Ix+PXvAWNhDjwfuoU9s8p2fYfKYS51YEv7oED9aH2DGnnwChnKoqmZDN?=
 =?us-ascii?Q?NozlqWWYfA0jWPZU8QQHTooNaPTDFDhtXHEpwCCBeZ3vISxTQDpLQViBdj6k?=
 =?us-ascii?Q?QaEFzXb276I4wssLHjzRQe864doLk6WQzFLYykW0?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397689BFA5B883B5E49BC60818FABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8145de7b-c9d3-4d79-56da-08dbfa34e48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 10:35:28.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OkVGNCsGufFbye7j+eV2h4MZVtHetkfWRri+2QRWhjCdX+Vm75wClCiS/c1Yob0AWze91SjM0qeXua0pTYhKAnvrsLbvt3Kn++7puQ79Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: Wq31vXBRmxh-LCtY5rcZzi4TeYjIw_22
X-Proofpoint-ORIG-GUID: H-_LHS4F-hkXFWnEpWhTkYFxdJXJFtMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=919 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312110085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192158

--_000_BYAPR11MB3397689BFA5B883B5E49BC60818FABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I see that current go version is 1.20.12 which is not vulnerable to these C=
VEs. Kindly ignore this patch.

Regards,
Soumya




________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Saturday, December 9, 2023 5:55 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and CVE-2023=
-45284

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

We had go upgrades in between, can you rebase (and check if this is
still needed)?

On 08/12/2023 10:42:15+0000, Soumya via lists.openembedded.org wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> These CVEs affect path handling on Windows.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45283
> https://nvd.nist.gov/vuln/detail/CVE-2023-45284
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.20.10.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devto=
ols/go/go-1.20.10.inc
> index 39509ed986..0c0a736084 100644
> --- a/meta/recipes-devtools/go/go-1.20.10.inc
> +++ b/meta/recipes-devtools/go/go-1.20.10.inc
> @@ -16,3 +16,6 @@ SRC_URI +=3D "\
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "72d2f51805c47150066c103754c75fddb2c19d48c92=
19fa33d1e46696c841dbb"
> +
> +CVE_STATUS[CVE-2023-45283] =3D "not-applicable-platform: Issue only appl=
ies on Windows"
> +CVE_STATUS[CVE-2023-45284] =3D "not-applicable-platform: Issue only appl=
ies on Windows"
> --
> 2.40.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192038): https://lists.openembedded.org/g/openembedde=
d-core/message/192038
> Mute This Topic: https://lists.openembedded.org/mt/103052741/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_BYAPR11MB3397689BFA5B883B5E49BC60818FABYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Hi
</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
12pt; font-weight: 400; color: rgb(66, 66, 66); background-color: rgb(255, =
255, 255);">Alexandre</span><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
I see that current&nbsp;go version is 1.20.12 which is not vulnerable to th=
ese CVEs. Kindly ignore this patch.<br>
<br>
Regards,<br>
Soumya<br>
<br>
<br>
<br>
<br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Sent:</b> Saturday, December 9, 2023 5:55 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and C=
VE-2023-45284</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
We had go upgrades in between, can you rebase (and check if this is<br>
still needed)?<br>
<br>
On 08/12/2023 10:42:15+0000, Soumya via lists.openembedded.org wrote:<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; These CVEs affect path handling on Windows.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-45283">https://nv=
d.nist.gov/vuln/detail/CVE-2023-45283</a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-45284">https://nv=
d.nist.gov/vuln/detail/CVE-2023-45284</a><br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/go/go-1.20.10.inc | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-de=
vtools/go/go-1.20.10.inc<br>
&gt; index 39509ed986..0c0a736084 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.20.10.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.20.10.inc<br>
&gt; @@ -16,3 +16,6 @@ SRC_URI +=3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0009-go-Filter-build-p=
aths-on-staticly-linked-arches.patch">
file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[main.sha256sum] =3D &quot;72d2f51805c47150066c103754c75f=
ddb2c19d48c9219fa33d1e46696c841dbb&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-45283] =3D &quot;not-applicable-platform: Issue o=
nly applies on Windows&quot;<br>
&gt; +CVE_STATUS[CVE-2023-45284] =3D &quot;not-applicable-platform: Issue o=
nly applies on Windows&quot;<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt;<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#192038): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/192038">
https://lists.openembedded.org/g/openembedded-core/message/192038</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10305274=
1/3617179">
https://lists.openembedded.org/mt/103052741/3617179</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alexandre.bel=
loni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397689BFA5B883B5E49BC60818FABYAPR11MB3397namp_--

