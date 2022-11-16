Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A92C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 22:01:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2661.1668636085128667262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 14:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VdE0emRq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83191d2d0a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGLvOuM002945
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=RwxN08Qyd/5pG+ZE9xxETSa6kvqy0UlUvGhXqTPGtoY=;
 b=VdE0emRqexbDW3588wPpOPArr/nER3V60jEi+E1k0g6xV+zDMVTsM3rfa0fxN0xkjJFC
 K4mUv+Z0mz/lzmSDZTa+UJsRV4XlRV7YdQTS+yBvg0UafU4HMxoQgKRvmjD6TGKWxRla
 jaG508TeHmxTYrvk78PoTGAXbKBI2A6ggJqOJxO5PNS3HRIw1l+0NBnpj3Bu1oHazReO
 oTBiYq1ug7G7M6TQVSm/88lxNMKA0oVW4UseATQIrzkdAzBQRItuQi6nsDAJZegJ5seQ
 ZVGl4JwBmtt7XoobKFAAmMgpkGURyDEOaDmcYx3JTd4elGHcMFJ+QuTv+qupMt4CiClG tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kv75csja2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:01:24 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGM1N19011414
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:01:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kv75csja1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 22:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND08qH5F5jvRVHBYXhdMnpyb5lu8NFj3gEVdks+jmzzZNU8VLNLPJMAchcuB7U9CYjUFPPwnUs+f8kmULwEpP8bwn6fTytRYchs0+cHUO7I5vl5N1xIjBgABnooBpsbLJIZS9eHky/8zCCDTUxOI0NbGSpDTwGgl/e2Ozl5h8aJJEkCrgY6tdb6dGUqqjNb7g0/qxBmdkfa6jcVgTuKdNQhuJ/XDtbwA108DkJaiQioxZgECjcuPzSSOlkWmaNOGuxHdVoHPk0C/lVWCnQgcZPS7n7mHch+AWPc6CldfKqe4w26TK0nQxJE7W2Rs3JxKXs0Myc3qmuXlVeV/PTXFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwxN08Qyd/5pG+ZE9xxETSa6kvqy0UlUvGhXqTPGtoY=;
 b=TJSPrcSaGti3RkeoY6014hFlgjyElEMDPCWwYlGkE81VSR4BS7Zj4H+e/Lbi0tZQyfGMmFdUCz7ufMAKOvmEVz+uZgTra6rJwiun9PgTdWQf99qBfxIg+xQxGbbF+tK5nYMqkGssM7oueKjfM9LiHUxzzPtYfpY1lXYpEg2U4hfc9MsmWFaDE8Ic94jRFCN89/RSbXs1KPZVf2yzThqwEjfyr7kqrFxx0t7AXGguY+eUaoPRueLwi6nqXarp0TFCqbWJFapzl07NMckZIUWyXdQwO90rTtkAcjVR/oL6dGiTafMsnC0Qqmrp3OZtDsE6ooqw2BrgeXjEp0Nv1B0AIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 22:01:21 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0%7]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 22:01:21 +0000
From: "Sajal, Sakib" <Sakib.Sajal@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
Thread-Topic: [OE-core] [PATCH] blktrace: ask for python3 specifically
Thread-Index: AQHY77LeX3c3ie94VkmKOciWalhF364tjZAAgBSVUuw=
Date: Wed, 16 Nov 2022 22:01:20 +0000
Message-ID: 
 <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2538:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: 09d32080-9669-423f-1235-08dac81e1864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8KE95fcmAzJGoIanXVthPI2FbufsCNMs4r6nlWTMWCrjvouoLF5QuqVdkDjAA0FgYgCRWqomSn8Q2hUjKQ+9y443mAGqpZKDCcbvdFWg0gFYnafwW9Xyh/ROJG781/2p3Me4suAsyZWgBxHpN5LcVAzb0CjkOiu3y2nJIvnIH3fZINgK8I7zh1VJVP8j9dGSshHOz74mAr7XiGjtTsXm0VHHpD8IZ7wbv6sifAjeOfhjJCxyxIIwkkbvmHEzH7xdRN/0QzELWert4x4luVXEgHA7nloZEeGbQVJ8glWj0ccuVhQbR1K4neY36Otu4QrXPyKN0XZw7XtC0ql5QvKfu00WK8x70XvUxja4ksUU5/LKW3iX+CxNqBCyn6x4tlSKFmfg3YqYhTkrt6wm+UgV4pobdShrvLJ+NzmX6U4QyAp6gUda1xhxFFEII2gmnOyj5ugu0yP2uE7HZ7kN6V9Wu33jiJaHQbsmxrQ+suK5DAzDSO93Syv9TwCTQDxJbrPRtrMjSA9VwPW3F6UeC5OobBNm2E8wKjTjO0NC2ICf/Zy6YcN4aTRHK1uzW3YJNwFucxcCQoudbbMklJ7N13F5tNenA2dCVLkZ/n6pttL23OWCrDVW5kaj51XlEo2/qPTNoQixkN+SDDyvO4iebk00/StPPXqFDXEoqM2Q6qdwv/EkbuNVoz9CmASdwd5xDs+WlMQb92x15ax1GZKsdGV0Htre/Ibe7IcBXMXoDHy/lSwydc701a74iUaPzIpleN7q1YOykGsoiJKlOoOZRVk4qET+7x86zrvZsho2yrC1VlFEDxxwKBhoA2ZJGF+tfIYK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(451199015)(21615005)(2906002)(5660300002)(41300700001)(71200400001)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(316002)(91956017)(4326008)(6916009)(966005)(53546011)(7696005)(86362001)(186003)(9686003)(26005)(6506007)(478600001)(52536014)(166002)(8936002)(19627405001)(122000001)(38100700002)(33656002)(38070700005)(15974865002)(55016003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?quEvnGtNDDT7aWaiAY6/tc7zSPMkW96MGtl22SgOE+Xxo67WmKbXRtXSW9?=
 =?iso-8859-1?Q?6IckRfzqW0sUsLtMX/8ubP8t7sxX+v3Ft6r3ae18gQPDzJON4fsaqAE4yp?=
 =?iso-8859-1?Q?Y27hUUMIsBVZz/JATh5zrQZOa/wKUgS+my0ieAgfP/hbuPPKMHEACi8N1v?=
 =?iso-8859-1?Q?w/ounwHrvo9W1tsf0qU/J4ej8F6vGTMVOXOl2tcIMvmhSLs5AWkwepGvNd?=
 =?iso-8859-1?Q?Ko2T4YsWFD43CmN1E0krTxr7NjyULCsNX9k+RQmvxKuRArJNEe8X0eE2Zx?=
 =?iso-8859-1?Q?zBc2S4/sl1ScVYNfhLCVf+LVO7Fimtv2ZjkzYlY1G9I+UFx0JMEGCDaQJ7?=
 =?iso-8859-1?Q?s6/YjKMWh2q9Gncpal77bsUJRhNruWyxUs0VWLC+rozrS1YbVtCNO179vB?=
 =?iso-8859-1?Q?Y5VC9Hll7MaMRm8+eIqoImBwHG7UjkEkCtDtjcAOe8ymt9nmrKZPN/ZlWH?=
 =?iso-8859-1?Q?01/2rh25TnJmv6/WexaVKSYTksejMEm+/R8fxn7N5f3ar6k6WS4O4tpEvq?=
 =?iso-8859-1?Q?dHqUIbMtyDPCKA3SUn7TnEytFWNWbEgFa2Cs+BLFiXEFXwmehosmUZqixc?=
 =?iso-8859-1?Q?QqS+/ueb5IuW5wOMNHrWYbqcYiu0ekIiTYM81uGsUWPxZTGh4IvIbQSeW4?=
 =?iso-8859-1?Q?tIKkbBD4vdO+ZPsBWpCWOsdO7cv+8JwVNxnwQ2GkhQfOtUUSWJ0E0y3jxB?=
 =?iso-8859-1?Q?oOZ4GHrTI3qv17jcaGKm1tbn0Pyuq+VQIsi/UjyR2FUrye0WM14VBfzOAL?=
 =?iso-8859-1?Q?M+3Hm+jbcDC+UJVbtDCNbL8UKli/fo5nD3m2ZH0M00eX5dEiRKQtlz7VPc?=
 =?iso-8859-1?Q?4Rp5T7lTYzfG3sfCqWd9bkrhB9rpHJ5GL2E/5DYxbwU2Iny0ZYtBNZUGCK?=
 =?iso-8859-1?Q?Bja/gsJlfm0z2B4XvJQnnD3zhVINNKj97E/G73KANKQ3OGXyBNxYiyODcf?=
 =?iso-8859-1?Q?hHnCA3gfLLzWMrg8haRXbAk1X60OQAtzviN1IxabN0bd5LleKUWh6UDvOr?=
 =?iso-8859-1?Q?IxYAfR8F9B0gl4i7cxsc7DBWRWJogTTRcRHl4KsTebhR3OavosYqe9E3Si?=
 =?iso-8859-1?Q?JeBqwwJyZUZmEj49Wd0lzQuk4IsLLUaS51BXjIUVH/elkPTSdyVAl3IxHa?=
 =?iso-8859-1?Q?XXgHLVpOtBgL7c9Y5cocMCKQS6ZNxG4ilY2aTR8XCtB6RhORExd1cOpILU?=
 =?iso-8859-1?Q?lSEtotMoS37Cct8paGO+oBCoXdh0OVVFOTgh/X5hUVHIedfgS7AxJcthtg?=
 =?iso-8859-1?Q?l4E7XS1j2LyvWq6/3d31IvvWS0itHoR+2ufZcBHLj+2hqdA75fFQhLzw9/?=
 =?iso-8859-1?Q?89zC+doUAfdRn/NDaCT0N1cbGRLmeyz8twaQVBjiJSkePn1SnHZr91YP4T?=
 =?iso-8859-1?Q?k8HI8giTZ21236tS1nflQytDnr7eGNy+qKYQEN5wZ8qVX/GIsoOqQPOANj?=
 =?iso-8859-1?Q?zHRd1vC4g0eEj6vuGocZTq/ybuGnRiVCopjStW1EY/jLMaFi1P4S+ZogmX?=
 =?iso-8859-1?Q?MGtHH8i4qNNspXLZ7aK1zhunS5x3rJjtvO7Bk6SzCUBl3UV3SHHe+ONv+1?=
 =?iso-8859-1?Q?NgvauWnB6cIFjhFmIDXvN8ijd3mvH/rTuET7C3OPmN1+5kgjp4X97kbCFS?=
 =?iso-8859-1?Q?zFMuY1qRyris2r5vvMuC8M4KBdPidQdGHW?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB25388B935A115A1398CD8EAAF2079DM6PR11MB2538namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d32080-9669-423f-1235-08dac81e1864
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 22:01:20.9663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0z3aa3DAXIzooGIC0Z6VbVcpKE84pXXQVO38TUHlzW3p64SKrvYHyPfRFPlTX/UZEvIa0X+VWy8Fz7/0KTJuxuwlUoUNKNqv/+gW8JZI5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-Proofpoint-GUID: tvlpb82n0LCYIy2FwNk_hzHSszUveXh1
X-Proofpoint-ORIG-GUID: LfTOu-ylm_UbqBIgtZn3GdfUge35gbso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=948 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173393

--_000_DM6PR11MB25388B935A115A1398CD8EAAF2079DM6PR11MB2538namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: November 3, 2022 3:00 PM
To: Sajal, Sakib <Sakib.Sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically


On Thu, 3 Nov 2022 at 19:34, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> python2 has been deprecated, use python3 instead
>>
>> +Upstream-Status: Inappropriate (OE-specific)
>
>This is not inappropriate, or oe-specific, please send the patch upstream =
first.
>
>Alex

I have already sent a patch to upstream blktrace which was rejected:
https://www.spinics.net/lists/linux-btrace/msg01364.html

In summary, upstream maintainers see the following on their distro:

axboe@m1max ~> which python
/usr/bin/python
axboe@m1max ~> /usr/bin/python --version
Python 3.10.7
axboe@m1max ~> env python
Python 3.10.7 (main, Sep  8 2022, 14:34:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>

while on yocto:
root@qemux86-64:~# which python
root@qemux86-64:~# which python3
/usr/bin/python3
root@qemux86-64:~# /usr/bin/python3 --version
Python 3.11.0
root@qemux86-64:~# env python
env: can't execute 'python': No such file or directory
root@qemux86-64:~# env python3
Python 3.11.0 (main, Oct 24 2022, 17:48:40) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>

python symlink to python3 is not required by python development community a=
nd is a choice left for distributions to make. If you look at oe-core, most=
, if not all, packages are changing the shebang to python3:
oe-core.git$ grep -r "env python3" | wc -l
166

Regards,
Sakib
Re: [PATCH] bno_plot.py: Ask for python3 specifically &mdash; Linux Btrace<=
https://www.spinics.net/lists/linux-btrace/msg01364.html>
Linux Btrace: Re: [PATCH] bno_plot.py: Ask for python3 specifically
www.spinics.net


--_000_DM6PR11MB25388B935A115A1398CD8EAAF2079DM6PR11MB2538namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" class=3D"elementToProof"><font style=
=3D"font-size: 11pt;" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> November 3, 2022 3:00 PM<br>
<b>To:</b> Sajal, Sakib &lt;Sakib.Sajal@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] blktrace: ask for python3 specificall=
y</font>
<div class=3D"PlainText elementToProof"><br>
<br>
On Thu, 3 Nov 2022 at 19:34, Sakib Sajal &lt;sakib.sajal@windriver.com&gt; =
wrote:<br>
</div>
<div class=3D"PlainText elementToProof">&gt;&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt;&gt; python2 has been deprecate=
d, use python3 instead<br>
</div>
<div class=3D"PlainText elementToProof">&gt;&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt;&gt; +Upstream-Status: Inapprop=
riate (OE-specific)<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt;This is not inappropriate, or o=
e-specific, please send the patch upstream first.<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt;Alex</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
I have already sent a patch to upstream blktrace which was rejected:</div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
<a href=3D"https://www.spinics.net/lists/linux-btrace/msg01364.html" id=3D"=
LPlnkOWALinkPreview">https://www.spinics.net/lists/linux-btrace/msg01364.ht=
ml</a></div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
In summary, upstream maintainers see the following on their distro:</div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
<pre class=3D"ContentPasted1 elementToProof">axboe@m1max ~&gt; which python=
=0A=
/usr/bin/python=0A=
axboe@m1max ~&gt; /usr/bin/python --version=0A=
Python 3.10.7=0A=
axboe@m1max ~&gt; env python=0A=
Python 3.10.7 (main, Sep &nbsp;8 2022, 14:34:29) [GCC 12.2.0] on linux=0A=
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.=0A=
&gt;<i class=3D"ContentPasted1">&gt;&gt;</i></pre>
while on yocto:</div>
<div class=3D"PlainText elementToProof ContentPasted0 ContentPasted2" style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
root@qemux86-64:~# which python
<div class=3D"ContentPasted2">root@qemux86-64:~# which python3</div>
<div class=3D"ContentPasted2">/usr/bin/python3</div>
<div class=3D"ContentPasted2">root@qemux86-64:~# /usr/bin/python3 --version=
</div>
<div class=3D"ContentPasted2">Python 3.11.0</div>
<div class=3D"ContentPasted2">root@qemux86-64:~# env python</div>
<div class=3D"ContentPasted2">env: can't execute 'python': No such file or =
directory</div>
<div class=3D"ContentPasted2">root@qemux86-64:~# env python3</div>
<div class=3D"ContentPasted2">Python 3.11.0 (main, Oct 24 2022, 17:48:40) [=
GCC 12.2.0] on linux</div>
<div class=3D"ContentPasted2">Type &quot;help&quot;, &quot;copyright&quot;,=
 &quot;credits&quot; or &quot;license&quot; for more information.</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
</div>
<div class=3D"PlainText elementToProof ContentPasted0 ContentPasted2" style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"PlainText elementToProof ContentPasted0 ContentPasted2" style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
python symlink to python3 is not required by python development community a=
nd is a choice left for distributions to make. If you look at oe-core, most=
, if not all, packages are changing the shebang to python3:</div>
<div class=3D"PlainText elementToProof ContentPasted0 ContentPasted2 Conten=
tPasted3" style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font=
-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
oe-core.git$ grep -r &quot;env python3&quot; | wc -l
<div class=3D"ContentPasted3">166</div>
<div class=3D"ContentPasted3"><br>
</div>
<div class=3D"ContentPasted3">Regards,</div>
<div class=3D"ContentPasted3">Sakib<br>
</div>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1">
<div id=3D"LPBorder_GTaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtYnRyY=
WNlL21zZzAxMzY0Lmh0bWw." class=3D"LPBorder256791" style=3D"width: 100%; mar=
gin-top: 16px; margin-bottom: 16px; position: relative; max-width: 800px; m=
in-width: 424px;">
<table id=3D"LPContainer256791" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr style=3D"border-spacing: 0px;" valign=3D"top">
<td style=3D"width: 100%;">
<div id=3D"LPTitle256791" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: &quot;wf_segoe-ui_light&quot;, &quot;Segoe UI Li=
ght&quot;, &quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP=
&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor256791" href=3D"https://www.spinics.n=
et/lists/linux-btrace/msg01364.html" style=3D"text-decoration: none; color:=
 var(--themePrimary);">Re: [PATCH] bno_plot.py: Ask for python3 specificall=
y &amp;mdash; Linux Btrace</a></div>
<div id=3D"LPDescription256791" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: &quot;wf_segoe-ui_normal&quot;, &=
quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margi=
n-bottom: 12px; margin-right: 8px; overflow: hidden;">
Linux Btrace: Re: [PATCH] bno_plot.py: Ask for python3 specifically</div>
<div id=3D"LPMetadata256791" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: &quot;wf_segoe-ui_normal&quot;, &quot=
;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
www.spinics.net</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
></span></font></div>
</body>
</html>

--_000_DM6PR11MB25388B935A115A1398CD8EAAF2079DM6PR11MB2538namp_--

