Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F8BC35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 02:46:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3535.1702953970057671857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 18:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AViqYfO/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717775950=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ2f7w4032170
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=rrPR2fC+Gb3YytEYeX
	oY3sZ99Thkm+A0taum7WLnnQ8=; b=AViqYfO/8bKL2NsfmOrvoMp7vC6zTd7qE0
	3JguH6qypG991DYzKHDIGI8u5/iuw9y3eZS5y382ANhQyvMEwtFJKge+n2AbyNVp
	zA/L9wGFjh+3osaNPkBEZytIJeWRi+xqLmVuxIZ2gOgnOUBXcEY/AdlJK9T5C5ny
	F6DJVpKoGb06w/SY3AJovyHAhvvVeZqSA/RRJD3h63qQjMDXfK6VPxboARjWuCFm
	lh92ZpYBvmG5FaklR08OZgv6HXy9o331ih4bX0QDzesT/9AxfhEql2Z3h/Y5KW1+
	xeGT0+JVB9CM/esXrKelrd/J4xjT1YrrYZ8apTsLLncuAKHAKrqg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5tpq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:46:09 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BJ2k85f004856
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:46:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5tpq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 02:46:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEjNTfYueHRqGZ3mcggMyPrR/H+ip476rvc1Gak8x0IWAvo8QhHB6ynbEO4nOa4po5A2yPma9OeJgdkJ9ZM4qSMtn61jSalc8AvJRHRu57x+H0g8/6skJ6qJL83RUKA+lwxXiydzQ/dXb77VS8xskhUDcvYRxcJ7io/KEHnERculBD+z7geGW+1MI8WUWjAb+GZTnnHxGPwDXhIT3PPorJZ06H8Opf8N6q+XDeLuVYy7I5mdX+niJTqx1TT8QRJL2v8r6LATRgs9VZpy85FXBXnrwBX6lhsG6+T6unxSzkBsqHlDbYb2WyZA1aw1efALg7k+ouUZoHfQyLs55snz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrPR2fC+Gb3YytEYeXoY3sZ99Thkm+A0taum7WLnnQ8=;
 b=j254LvNWC2A0cJMyqC3oRpCjZtSn1GVfYX03kswtWE/KnUiPqzqm4b4wPh/skOxWiQNm+leafZP0igDHMFJOE9muFBm5eHWg8UtHEYiqv3ueZ61q+8PyXKRJFTHLSlxkmq0021Ok6olabngBNxfGdwqscja7/jKO641LMsySnTvOjZOF0aDNNFslczbxgXqAljX7JMPfZsvvY2qFsOkjuxb6QCJAGl+JGG5KDKrHRx0gldLn8813iJHUwOrMwyMyyAn0Il6wMgJxjsLlxHTWFCDA5v8kQY+fykndg24OFa/eHEGnXnzZSsXk6BBSUuHOKylDenoweSrojxKYMjuXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 02:46:04 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 02:46:03 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-license-expression: Fix the ptest
 failure
Thread-Topic: [OE-core] [PATCH v3] python3-license-expression: Fix the ptest
 failure
Thread-Index: AQHaMZReMSp5qxVLkEOy6dc7z7wszLCv55Hd
Date: Tue, 19 Dec 2023 02:46:03 +0000
Message-ID: 
 <CO1PR11MB500981375ED0BB04B5FDF865F197A@CO1PR11MB5009.namprd11.prod.outlook.com>
References: 
 <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
 <20231218091332.3090320-1-mingli.yu@windriver.com>
 <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|IA1PR11MB7754:EE_
x-ms-office365-filtering-correlation-id: abf189fa-ea6f-4005-781d-08dc003ca474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uflt7nbJhrmjNB5pNtB1cBN89ciFGRlFdUnEyM/ShPdBkNnx4rGFgBbWVG6feA0F9sJ0+KAWjs6rfbSKsiKAoW+ItDFI94eeJO6C5g7B4n7tXuBSDY4PMsQbiLNoJe51SqSblPvUvSxLNN6lozDqt0VQRxkT5zxvuyETjqXwG0naNfor+CDivZ9gTCWvrGRCYYuj/j1avrg2Qyad7fyu+zyw/rr0XXVCnayejkgmfZtjGArmjZcPU9DLbIsy7TXyFlWpa9wQ9xh2EmWIRMwvzhFiQPKRhr7/uKR3NPvnVfBGIkMC5OCsbQ7/EgytxwCMxzp9x4DnogWuwxHWXbN+tut4VBxdbfVzzKFfKckokQiNTjqd2qSq9J4liVOs0VcsMGDWlR36NoDzyDOT7bLxXYCUPX02Ua4zdOTKqrnHrgz75z0WrCawioi2UJUFtscJ4cJqDhrWirDp8qGqY7KKskHReSziVLx+pqBkpfr3/tHFybnPD4IhA7qBU4Xv+plWku+dZe8NmaokTf31Wwqk8eq90otXdsY4B7jr1jf5qulEUTjf5baA+lyePNAgUzTCmQE8wtbMK1aaF68OGkCF0hqNdbZseQltxbIZiTMqMyJ1MLhIuCO6rz+4YTiHfFSKbncCrnRZDyLW2f6ij1zlEvuiHQh4qOAaURu4n3MU27c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(26005)(6506007)(53546011)(7696005)(8676002)(66946007)(52536014)(5660300002)(9686003)(4326008)(83380400001)(71200400001)(41300700001)(2906002)(478600001)(91956017)(76116006)(66556008)(64756008)(6916009)(316002)(66476007)(66446008)(8936002)(38100700002)(86362001)(122000001)(38070700009)(33656002)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7dCHZCI79r/qB6EKvg0lPZcnFBSqMWNxgYnpEN6Qba5o7aJoL9uK8hCBCeJo?=
 =?us-ascii?Q?LGVWVwPjog9wkTZaAQ64daD2f9HXTlTSHo3K26c72QLRcoR3ffpJZZXuendx?=
 =?us-ascii?Q?mqsQwQCuKd0YCglzilw+CuAnX8je4n2umfmVsPPpMu1h1g3VLhw2LPN58z7Q?=
 =?us-ascii?Q?RovPxFgkxmU1ssvyrTAhhIJ7h+VGJYGABbrzepChD6k8+2KgsZ2gnULVvsci?=
 =?us-ascii?Q?ss5uijlLekGR1WRqxVYi+7at05HwU+RPQDJ6D94uGh9O47zDEln+smSKihMG?=
 =?us-ascii?Q?KNm4f16F0BJWBsCRg898ou4FI90UkuNDXGtrOg4rlQLWTT6IlbdfV3GL0Yut?=
 =?us-ascii?Q?BjnaU/+DMBkGls3YvK9P9d1KEYxvdUqRDRm9Q2ZKNDXsl/Zm/cDM5nVvyzIp?=
 =?us-ascii?Q?PC4IQHUSK0xJ/Ba4P02wBuzw6/JPbxymWxJpHBSSRtESGIjcspqXL/wiUU3K?=
 =?us-ascii?Q?0MEXkXvuQMuA02slcLiQg5GGGVIofGWLZ8Fo+Tzhavzney0emA712justvtm?=
 =?us-ascii?Q?b/3u+HwADAImPUToABdtNIO/XeSZ4++ls53U3kM40zeJ7bUmhjRxvu8dKcLa?=
 =?us-ascii?Q?Y/yoGavPN3vZDiF0q4t3tZFzqA7UPNz5KVftOnLJaKu5fB5Zn1puUZRKpHQu?=
 =?us-ascii?Q?/CNGYGedsn4KAcW3rn5s2BtW/mM48GoEIxwIPj3hFoB7Hsdxq4uDSsK1vMaN?=
 =?us-ascii?Q?dTVAJDAPYT+Q1bdQNXpu8vir6zufZcJXzcELVkW4IwN5OXNoT96RMXuq/LCZ?=
 =?us-ascii?Q?vMP08id3cLx+SHLtAKHy7IeZylCAZlGSg5QKAeNR54qHsB5SSD0i5NDRbiHb?=
 =?us-ascii?Q?kGGn5WNHYkVIy0RmBo2IvjZF6V/BB+3XlyCftvas91dbWZ8+foXY+gPY49im?=
 =?us-ascii?Q?APxr7M5raslG72j4kRggozCF3jW3DpoKpFTJk2YeizPYOhTRfFWLaWyVFaAw?=
 =?us-ascii?Q?8Q0yrTfn/egrdQuAkp1Uw7daIqPmOJNxDh5sE/QNrUo9eGcSr+PJu+qPYUGW?=
 =?us-ascii?Q?IYzeYWW0m4ArbDRgT47SiQv6XUB+WyPN0fEGqYWSGaJQp6Cuqg5K/n2qKEO4?=
 =?us-ascii?Q?9tckr3adfNmvUnCWpbCPRKqX+Zmr3O8o6aA3APDTb16o5q4rU9sMWU29+yOA?=
 =?us-ascii?Q?FBMyLDFe7jW+XE3eI66uuUEfHhOXcn0k1uVx2nssW9MxszipUTW1d+GgVcZx?=
 =?us-ascii?Q?UoT6uizu2UsYr12jfjLAoZvWzsTvnKYGS5TWEwZ3s0uj0eUcgmUKdt0qylVM?=
 =?us-ascii?Q?VjFeMw7iNEp6Psag6XF35oK6ESJlwXnxuuNtPfWYppl9wiHOMUTc3upcLFoc?=
 =?us-ascii?Q?U47xoAwpevX2308/rfz+k9golb/ggofLtOg/5KAU3+mzi7P5j1brnLgd4bpO?=
 =?us-ascii?Q?8PA5WdAy3SOa4/manJuXRiiW/z0BrEAIE42/Wb4DvDFvTJHU0vie2qrigg4T?=
 =?us-ascii?Q?tc+Odqz71W6Q89KiFqHenGZyWiK6Ro9PRz9+0onMTh2zBx05apDeDP/Dm4+I?=
 =?us-ascii?Q?BCucpR2cH8f7BIItxikIEYIYkFiNm7b9bdiy1auWUQYEFzrhoowmi7V7kBhW?=
 =?us-ascii?Q?kFYQXlT/arjG9G3ET+FdqmrKt34KiZejEP3DDHcS?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB500981375ED0BB04B5FDF865F197ACO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf189fa-ea6f-4005-781d-08dc003ca474
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 02:46:03.6401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/o+jnbuKgdorJMxE9cmVFOruXKQamktxTUKYQu8/qSBDXbMdnvqEUq2MQEm2f7HChfSHAmqrGo9bdBCQyZ/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
X-Proofpoint-ORIG-GUID: 6IPgkNZ3_s6uu__9DAXXR3t4uC5VL5tD
X-Proofpoint-GUID: EzWJGsMTkcxjRkL4RWTbnfzpsAYqu3LA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=970
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192685

--_000_CO1PR11MB500981375ED0BB04B5FDF865F197ACO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

yes, the python3-license-expression ptest is fast and v4 sent to add python=
3-license-expression to PTESTS_FAST.

Thanks,
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, December 18, 2023 17:26
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-license-expression: Fix the ptest=
 failure

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 18 Dec 2023 at 10:13, Yu, Mingli <mingli.yu@eng.windriver.com> wrot=
e:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fix the below ptest failure:
>  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton_c=
odestyle>
>  def test_skeleton_codestyle(self):
>  """
>  This test shouldn't run in proliferated repositories.
>  """
>  setup_cfg =3D configparser.ConfigParser()
>  setup_cfg.read("setup.cfg")
>  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
>  tests/test_skeleton_codestyle.py:22:
>  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D '=
metadata'
>  def _getitem_(self, key):
>  if key !=3D self.default_section and not self.has_section(key):
>  > raise KeyError(key)
>  E KeyError: 'metadata'

I went and checked why this isn't seen on the autobulder - this ptest
is actually excluded from testing because it's in PTESTS_PROBLEMS.
Please add it to PTESTS_FAST (if it's quick enough), and then it's
good.

Alex

--_000_CO1PR11MB500981375ED0BB04B5FDF865F197ACO1PR11MB5009namp_
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
2pt; color: rgb(0, 0, 0);">yes, the
</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontS=
ervice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; back=
ground-color: rgb(255, 241, 0);">python3-license-expression</span><span sty=
le=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri,=
 Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
 ptest is fast and v4 sent to add </span><span style=3D"font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: black; background-color: rgb(255, 241, 0);">python3-=
license-expression to</span><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11p=
t; color: black; background-color: rgb(255, 241, 0);">&nbsp;PTESTS_FAST.</s=
pan></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: black; background-color: rgb(255, 241, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: black; background-color: rgb(255, 241, 0);">Thanks,</span></div=
>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, December 18, 2023 17:26<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v3] python3-license-expression: Fix th=
e ptest failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 18 Dec 2023 at 10:13, Yu, Mingli &lt;mingli.yu@eng.windriver.com&gt=
; wrote:<br>
&gt;<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;<br>
&gt; Fix the below ptest failure:<br>
&gt;&nbsp; self =3D &lt;test_skeleton_codestyle.BaseTests testMethod=3Dtest=
_skeleton_codestyle&gt;<br>
&gt;&nbsp; def test_skeleton_codestyle(self):<br>
&gt;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp; This test shouldn't run in proliferated repositories.<br>
&gt;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp; setup_cfg =3D configparser.ConfigParser()<br>
&gt;&nbsp; setup_cfg.read(&quot;setup.cfg&quot;)<br>
&gt;&nbsp; &gt; if setup_cfg[&quot;metadata&quot;][&quot;name&quot;] !=3D &=
quot;skeleton&quot;:<br>
&gt;&nbsp; tests/test_skeleton_codestyle.py:22:<br>
&gt;&nbsp; self =3D &lt;configparser.ConfigParser object at 0x7fd87cf55110&=
gt;, key =3D 'metadata'<br>
&gt;&nbsp; def _getitem_(self, key):<br>
&gt;&nbsp; if key !=3D self.default_section and not self.has_section(key):<=
br>
&gt;&nbsp; &gt; raise KeyError(key)<br>
&gt;&nbsp; E KeyError: 'metadata'<br>
<br>
I went and checked why this isn't seen on the autobulder - this ptest<br>
is actually excluded from testing because it's in PTESTS_PROBLEMS.<br>
Please add it to PTESTS_FAST (if it's quick enough), and then it's<br>
good.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB500981375ED0BB04B5FDF865F197ACO1PR11MB5009namp_--

