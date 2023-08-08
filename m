Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E54CC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 04:06:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.54532.1691467577140981259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 21:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kzs8/d5q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75849a1ae8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3783piGb008991
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Aug 2023 21:06:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=FOmd7gYYJ9fVXlN4mi
	GuEeBYa0dwSr2A4bRItB5ncXQ=; b=kzs8/d5q6PFrGC+E/8d93vv++siedP0dW4
	ZRV0IRDBAXg7N5mq/QdOznVZ5RR3BdBtnNXIWMGYmXAEwCcF8CvAKCgHomFZ7xlO
	Lo799azKkPi4rRlc0qSYmSMPnlRHw84qrCdMCjM8CA82sSXSuAIcvORSX7QvyO2r
	y2jluB2JMBcLd5l4szn4bKcGETdAzO4DDSOufNKm/FglBrvvzfzHJLxWb+ulvMur
	8G8KFdtn8NRk6bP5STyNHLAUxZnt5YRkEeIZ1ikF5GlaR8/7brqhSs8KQvpqtxkP
	TisyOgK+FhJJ5oFQI6txwv8C7ZTuvMsvZ12/xOm161TeFsTNqwrA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfhx60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 21:06:16 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37846GLD000700;
	Mon, 7 Aug 2023 21:06:16 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfhx5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 21:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY2eTDSacv2SHzkKisZ+iShD5TW4CkmjWHEkUpAcorebjknHDfA3D9XtyfwJvtCcHk3S4o9nv2QL+K0M3UOyypfrLwYHzA43D6/kOTwyxuYfR00XxOO/dNu28fuRrqvUvgWoAqTroYFQ92/oOTlisTecJvi+lTPWnaK1q3xqdISzkxfHVdVyx8ER2FwB86JhQGr9aHskDbyxOtlnkQG156gggO4ckhbBlQDwmWrkUlW/SwcYv9B5eG4lXubUnFa4FcQ4nQKpaqUOyIXFtfmmbo8U1eVR2ZDWbPVv/sOsPZV4O+xTlEku54FC07i0Xm52+otxVkXATk7s0YUgAZzbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOmd7gYYJ9fVXlN4miGuEeBYa0dwSr2A4bRItB5ncXQ=;
 b=GMoE2bNuk0jcsMvxi7+xkxeFnAbn4kYW+Ih5yan64y3UcxjSZ4wSyL7zJ2Ctx/GJuL4ggxJhPVtLeGzidY0OYAY3cd0AueIjNTGnDqm3G7kZL7QP+d+Tnf7Ymlvqp295GGk3JP8KtAPP5l4oYGxKAHihlzNZIQOaj1FwZGW1BytxkEYFaPuMTtDWvEsZSZMxwzQrSeaS3hLEPC8Q6qZnW6nn06vvSOsS5QEnvea5vx68/8BC6xN/AAx49+I0+3p72lsShuYGR8fj60wLsKa1DCwIvQRsrQ/K4exRoI5n7uiUws66Zaf4rLg0RMc2b9lZKpXO8QEHE/B/U8+vLU93iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 04:06:13 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 04:06:13 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16
Thread-Topic: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16
Thread-Index: AQHZyVQVDJfML3W7BkOXOein/S1FCq/fn19ggAAow7o=
Date: Tue, 8 Aug 2023 04:06:13 +0000
Message-ID: 
 <MW4PR11MB582213D75B714B14620D6B20840DA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230807172414.3219478-1-archana.polampalli@windriver.com>
 <CH3PR11MB8093ABF5920A956C7BBA0C22B90DA@CH3PR11MB8093.namprd11.prod.outlook.com>
In-Reply-To: 
 <CH3PR11MB8093ABF5920A956C7BBA0C22B90DA@CH3PR11MB8093.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SA2PR11MB4875:EE_
x-ms-office365-filtering-correlation-id: 128357b3-65d4-4f19-03cf-08db97c4ce28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qd0Cnhk6KOJQP/7DFiF8tBZUOn6oCTp39lBkuic30lQKCzUl5C6V+fIzmCGO2pzHw5nMV8bHSaOv6FPtyGT182VlFuaM3lYdDcUSdHbTxQo/P9tnBH+WuA3j4LPWrOgNCmIzlbq+DL8vHSz/2HWWTps+bFiCKpdFWKRXRzYKX29hMtdmvx3nvJkds5TGR+buJ5Gj6RntEgntfnIVnlk9OyYqraAO4TXCle8sIqeHCyyOIkYUBFfRSeIuHmZXmIwPTn05YOULfUBPysMy0BjDYhsriOLJd6eAOJ5MR9ZxaxRURTdjNBgeDflZTFhgSBPa6lIWoDMy5aGff7U/UQsORr/Yka/rm5hPe8xM1NAr05yYe+kv9pzvjQKNaXQ6rsJ2dS4bY7Vn1STyzqnGujariYdGroR8KkRGQd7zGsbirie0anYlu0RKwvRPXNl3ShyDobt5KHAx6rygJJopJxyKWpqmNtfI4OoRXMIBUUh5+1n6/7XQOrw3UB6BYUfZF5T2qjYtaocEsf10pYuUhGBIUISLN7stDUSJSNURAbHCMlNTSvF8JUw8MkYxO9nFVveUNFIE3lUt6JlLYcXuMYm//ID+Q6MN67YJ4a7R+Nd1vtPxrMMZXpUuF4sJMrpTCkQslUgCVFIJ0B1vKTNVo/Lg2+pbhSdUCQF1bA002GW92u/HPwnx+4gzJWG1W8CSvVbCvhAK6y1+psuFkGd2/FSZlA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39850400004)(136003)(376002)(396003)(451199021)(90011799007)(186006)(1800799003)(90021799007)(83380400001)(2906002)(5660300002)(71200400001)(38070700005)(110136005)(7696005)(66476007)(64756008)(91956017)(122000001)(66446008)(66946007)(76116006)(66556008)(966005)(33656002)(9686003)(4326008)(55016003)(316002)(38100700002)(41300700001)(86362001)(166002)(107886003)(8936002)(8676002)(26005)(6506007)(19627405001)(53546011)(478600001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fcJ9iOVFsGdCL/HAA0fKkYGoUR5r8e9Cjj61ooeXHgdbDqlwOlctyNoyu9eF?=
 =?us-ascii?Q?6u832fKxoX4v1qnP/ILnF0lnV+0Cq+B4TgKFG5rDDxcaD6sZUBA9bU6H8GOp?=
 =?us-ascii?Q?FY5xtnH9XqwkNO1wsU9CKhh6WnoTQz1WlZbeUEZ244L2CaD4qT/oV03rq9bS?=
 =?us-ascii?Q?DYvyv+M++/Veve4zUgcYHrIlE9KNmUUraUoTqspO07PyNiulW1zwwEOI5Yo6?=
 =?us-ascii?Q?UpxNo6/u5bsMlkK6ROytgjZR2NKm652NHda+qMbeWiS6gMwFQ5yb4usM5+Zl?=
 =?us-ascii?Q?oQ+aIMPgKwlFhyN3d9czTh46yPWqt6WQ7PLdVoeRVtk1ij5l+i9SvajD5gJd?=
 =?us-ascii?Q?Gxz3+zPSkT2VN0mt3IGLqBw7OkyeggsQFQMlfwKQZ/KYFm+LUmlFB4F2HtL0?=
 =?us-ascii?Q?xld/dtnpuzMgOolaZGOKngfRUL6xkEOjWybo7h/Y/enk778njeeZH3+nhPCV?=
 =?us-ascii?Q?DEwwRQm8JHTHlR2uERQ0Cci15D4OEmgc4mxsMApEUM8GAGj7gSUUjAmBZPSd?=
 =?us-ascii?Q?CQfBadmOpdn29CRzls///4Dl+PSVVGcYBb2bJOAz+1M8lLGlEOukSHQnmAzs?=
 =?us-ascii?Q?l4cYM9YXToCbo20EPXrb23QOzC3+Go1G3gePHFf1U8AnLVksixIBOxXKrX/v?=
 =?us-ascii?Q?z0y5shYT0asTRKUZPg2jPTYWb2Td+KXjSLHKstSqpzP6Ix8UNUTjdcw/yCkM?=
 =?us-ascii?Q?qcpNq93p0mPQ5jUxWZ/+oy0N2apMgiAJO6wqQk2Vr/tirEJu0S5YoftS/w1m?=
 =?us-ascii?Q?BasZMHHrE6aQNMN16qpi/kgRjTptikrld8cmv5sVGMKk60T9C6W/X3fCKyln?=
 =?us-ascii?Q?KixDK2en+i6uyr6bSTqyLejYG6Ki3yY2QIvrjxWMyCH4+elhk/uHXGU9sBCe?=
 =?us-ascii?Q?0BaX0pwoX40sF1XREk1JpT2/lX1of0Lw72co0bdKC81U98TTMsgYZsNMnJOd?=
 =?us-ascii?Q?DzsaG0K1UOjKDaIAEGBDRzeax32PztiSWkqF2qbJMQRb/z09Y36nF9BQp6Xg?=
 =?us-ascii?Q?WbYcoCH8HJPc8+3Jb/TrbiWu3eH2OWBJkL4OjByqJfqX4pxB44rGoG+Vlte9?=
 =?us-ascii?Q?mJ5PLTyKGMybzY2or9hLU2KWiaE5cZnGCOAjndKNSxAEDwbHSADNZfsGjKvO?=
 =?us-ascii?Q?O1OekEizaf5+bvPVU7C8MQb8ZHFdo7HdnCRTDlTNztb7j2hIc7srRebbzg3i?=
 =?us-ascii?Q?g8Zozkc11/5EuN7c0EupIhxjN/53DCDU1eWNxmh672pD8OQGWMXauXM58wDf?=
 =?us-ascii?Q?DqFkfjALc0YC7MoZoPsbu2eh21TKyMt1RBnn0x67CFuV8klM5kVadq/emcX0?=
 =?us-ascii?Q?CAtYLmfQxV+UU3RPGr0dF0CugrJpE7teS8xpFReXZWCERxZd5H21DmIeI+nD?=
 =?us-ascii?Q?YezMUn+h/SiW8W9A2NpiULmYqk6ZGVe6d18pTohB2KIDmXnKp2Xd2qLz6ElC?=
 =?us-ascii?Q?VKiIDd8oRVwfDiVIcJWuBO9D7TaEfLZvj1f0bGrjMuyC5ZijQwMTG8dbLxUE?=
 =?us-ascii?Q?O+ZQjSn/pS+eWRd6CcWJUEOJYj1NLocMVya6qszj+8qy7vkgEdSQf1083wt6?=
 =?us-ascii?Q?VlGF9v0FQAJNO4xPfvhpfHrGOaU3x/7/BzqADDZHpyy/qgDbzdfNttx/HV/z?=
 =?us-ascii?Q?OA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582213D75B714B14620D6B20840DAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128357b3-65d4-4f19-03cf-08db97c4ce28
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 04:06:13.1088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Js4h1vD/A3EOXnpLJMHzJMJS67/1eY6P2G8LB15Uli4XN8QloW/aqGIBqWUaMxLciD4VNGVwUyBYWdPg/zo3TBQE1tj7LPRDMdpSQpDxWTMlsIgtzVzRIbSqQtGwYeF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
X-Proofpoint-GUID: TXjvhSAXa2j3N6iisoad-72uwNy-CHTM
X-Proofpoint-ORIG-GUID: xjX1rn2OmDK9HK3EpJ5X9fN2QJc14bhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_01,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=991 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308080035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 04:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185647

--_000_MW4PR11MB582213D75B714B14620D6B20840DAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for catching this,

Will send V2

Regards,
Archana
________________________________
From: Lee, Chee Yang <chee.yang.lee@intel.com>
Sent: 08 August 2023 07:21
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: RE: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.1=
6

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Polampalli, Archana via
> lists.openembedded.org
> Sent: Tuesday, August 8, 2023 1:24 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Hari.GPillai@windriver.com
> Subject: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16

Typo in commit short message/title " 9.18.15 ".
There is similar patch in master.
https://git.openembedded.org/openembedded-core/commit/?id=3D77d2fa5ac1f394f=
ba2b8e24f2b6ded6ea6b691b4


>
> Remove --enable-epoll  and  --disable-devpoll configuration option as the=
se are
> removed in bind-9.18.16
>     6b6076c882: Remove obsolete epoll/kqueue/devpoll configure options
> Ref:
> https://github.com/isc-
> projects/bind9/commit/6b6076c882a00028197b04a827f6cf8e7a5369de
>
> Security fixes:
> https://nvd.nist.gov/vuln/detail/CVE-2023-2828
> https://nvd.nist.gov/vuln/detail/CVE-2023-2911
>
> Changelog:
> https://github.com/isc-projects/bind9/blob/v9.18.16/CHANGES
> https://bind9.readthedocs.io/en/v9.18.16/notes.html#notes-for-bind-9-18-1=
6
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>


--_000_MW4PR11MB582213D75B714B14620D6B20840DAMW4PR11MB5822namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you for catching this,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Will send V2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lee, Chee Yang &lt;ch=
ee.yang.lee@intel.com&gt;<br>
<b>Sent:</b> 08 August 2023 07:21<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> RE: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -&=
gt; 9.18.16</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<br>
&gt; core@lists.openembedded.org&gt; On Behalf Of Polampalli, Archana via<b=
r>
&gt; lists.openembedded.org<br>
&gt; Sent: Tuesday, August 8, 2023 1:24 AM<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Cc: Hari.GPillai@windriver.com<br>
&gt; Subject: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -&gt; 9.=
18.16<br>
<br>
Typo in commit short message/title &quot; 9.18.15 &quot;.<br>
There is similar patch in master.<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D77d2=
fa5ac1f394fba2b8e24f2b6ded6ea6b691b4">https://git.openembedded.org/openembe=
dded-core/commit/?id=3D77d2fa5ac1f394fba2b8e24f2b6ded6ea6b691b4</a><br>
<br>
<br>
&gt;<br>
&gt; Remove --enable-epoll&nbsp; and&nbsp; --disable-devpoll configuration =
option as these are<br>
&gt; removed in bind-9.18.16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; 6b6076c882: Remove obsolete epoll/kqueue/devpo=
ll configure options<br>
&gt; Ref:<br>
&gt; <a href=3D"https://github.com/isc-">https://github.com/isc-</a><br>
&gt; projects/bind9/commit/6b6076c882a00028197b04a827f6cf8e7a5369de<br>
&gt;<br>
&gt; Security fixes:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-2828">https://nvd=
.nist.gov/vuln/detail/CVE-2023-2828</a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-2911">https://nvd=
.nist.gov/vuln/detail/CVE-2023-2911</a><br>
&gt;<br>
&gt; Changelog:<br>
&gt; <a href=3D"https://github.com/isc-projects/bind9/blob/v9.18.16/CHANGES=
">https://github.com/isc-projects/bind9/blob/v9.18.16/CHANGES</a><br>
&gt; <a href=3D"https://bind9.readthedocs.io/en/v9.18.16/notes.html#notes-f=
or-bind-9-18-16">
https://bind9.readthedocs.io/en/v9.18.16/notes.html#notes-for-bind-9-18-16<=
/a><br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582213D75B714B14620D6B20840DAMW4PR11MB5822namp_--

