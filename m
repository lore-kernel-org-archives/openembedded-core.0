Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC1C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:39:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6506.1686051545385136048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D64B5XqU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521663e13=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3568RdvS017937
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 11:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=1m+9MeLAnY3GaGHB6b3t4XcVUybQxROiUX0Wx+rlKPE=;
 b=D64B5XqU+zl0qEcfnp/PQ+azBgn4cG0iglGNhzUwzcC07jKA62fqW9XDfW8k3nP1ngRU
 008d67bkB+YPprgamEBsi/217TTeWpYNS1uPi4MJijf/zcIBVuo8dxRvZAL0YHwC+ACq
 EC8lNsawiYdZy5gCvQIqVBu1tIFLCes/10EYhGZz2PS7a4F8qDPt6umjRYi7YlNcu4L5
 q/hlS5CkkQ0yKKt3EeT4JmMjn1ITKr252R8ZT4z4hd+Xw8jUgr/LzVoJI6ZOm4n/JkIi
 nXKS12LNE94jhC8Es/q8ZwsmJxWzz+QuVisfxHHgaHy2ndmuTywQ+O0gtV+AeU50u/wX cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jde4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:39:04 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356Bd4D9003142
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 11:39:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jde3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 11:39:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhRNxAknFrOdRta2sd9rHmGK+5SG/c7/UqXHUCunwQhF5KlMYJ2QoBVwEU7hgdDAqbkddwO1MTVN6mmC6nYLHHjtDtECPjwWJAyIQwix8gh2lmHlDBEmqiDecgKjA6D6xLFLTcrZQKzdlMXqyqfWscZk0yPMcSYlRorrLT8jDj0NZ/BDlBW7BaluTOQnHz3Vcv2rPzHDUL4LxtrKPXmS8j1YlMScXVD2SLNP7Gg6AOHx1c/+ymdDXPR7KOptt/DEaLJAw3xgGqbo+WSMdA96Pm75Y/skAxQIhnMm467ldTl248u+/WaBuAnvnwORgxA9G9kgUTlfxYn7HivA510aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m+9MeLAnY3GaGHB6b3t4XcVUybQxROiUX0Wx+rlKPE=;
 b=Z0OWTeKtishdDIdzavvj16ejBSYgT8zU32FzKZ0QecgCTRgunbBIuw0yhSSt4B9GywTxFZWN2Ify3GR4Ja9x0d7jpGXmf83o0vwC+I9KA91NAo8e0Wrar6IcefcXmyXHBqiipSzARthNaB8ja763Lt595nko2TUxGCy8JuaN58HSo0SgO8EVLb7dYKAhxONWe3TYSk6MG0TxHB6YhzwjYXZEaIMGYLIC9VGkz+z1VfD1BRU5LOw0yUtRMEFrOrF1W2vTmaNc+kOxwdD/UTTGxBukrDlo3pKPOoYHyCBOF5GU8CcHf1wYKfBBGXJbXbZAcVQaRocux8+mp3G0IJDYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 11:38:59 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::7b69:8447:ce7b:8e80]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::7b69:8447:ce7b:8e80%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 11:38:58 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484
Thread-Topic: [OE-core] [PATCH] perl: fix CVE-2023-31484
Thread-Index: AQHZl9WoDu7Bp6LtZE6f0X64NaxrFq99nfmAgAADFeI=
Date: Tue, 6 Jun 2023 11:38:58 +0000
Message-ID: 
 <BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20230605174616.2559077-1-soumya.sambu@windriver.com>
 <a29c16f23d36d0a4c5b714285329c74c03e89200.camel@linuxfoundation.org>
In-Reply-To: 
 <a29c16f23d36d0a4c5b714285329c74c03e89200.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|PH8PR11MB6731:EE_
x-ms-office365-filtering-correlation-id: ea0cc3f4-e5a6-41f2-37a8-08db66829e04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s1yLfhDoaHLkQprdgNQ9+h7G1kMP4C2k59ZcVYhzlEGAcKqzkbtJWEfyIl79HGsQJd5i4CZWVMHR6RfLqCXHf1wd1+LSqJ+MZZB26ilS6wxfxj1ZViT6vxkVfk7PYetHRpgOa5omt1nZaeb1hpHKD3pvsxD9OdzNannyqDdE1JFkZxil7mIC2hpSoXwg+XPX51o96KONq+gnRtoe8CdEy14/3BTHf5NfJ8A0O9jARgVXxvLSPaVodovGoW5FniP9otRpTAHX+POC0YoJx7bimHZ7fxabY4/y+hh8E4yFihtrrZU6w3geWqDnl7wepNP94M4rKFsIXV3V0wk8XXv2Un+xRD/nqDwwwtbis7EJDIk3nf5liAufDncKZiBjrAjkcwTkLANZXV3jkFzYtePuSlNIQsn4EtLw+4garoxY6SpRxEg6F5+x+9x0jI2wWgkqKitqxM6Vehf1A+KUr36Syj/e3/SfstcAzqLDgfdRzmNOjni39sdJyYbDSYAa4K0YuRC+2mrCUtPwgeLmUa6ozPX92yJ8xMYrREhoud3SkPakOcTqehBNwZREgY853g4ZL/K2ebnW/l/dX7PhL5KiKSq/s1vmY8AIyO2DOpPdawg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39830400003)(136003)(396003)(376002)(346002)(451199021)(83380400001)(38100700002)(33656002)(55016003)(86362001)(38070700005)(122000001)(99936003)(478600001)(41300700001)(110136005)(7696005)(71200400001)(5660300002)(8676002)(52536014)(66946007)(66476007)(64756008)(76116006)(8936002)(66446008)(66556008)(19627405001)(2906002)(316002)(26005)(53546011)(6506007)(9686003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7zS6fn4+xZNbTgyywek2m04oYOLAHc7icGaE/VIQyahqZP+WnBmHW82a83?=
 =?iso-8859-1?Q?R9oqr+FXkzeu+5gEwTo4mHR73onqqlfrn3Gb+OBNIpgEoq8+xQS1wb9ZsZ?=
 =?iso-8859-1?Q?+PGw0qgxzhi1cAPIG9YtazmgdFbC5cnK0kQQCDgWyJJUsRGrU/oHpzDqAK?=
 =?iso-8859-1?Q?VxSiizodgUaaH47gTyZ065Vq0YECH+WTXFed3Ajh/fC6xqq4XaJGr9wGQH?=
 =?iso-8859-1?Q?ggh99UZwn9rTdNfADsYFTGwWMb05wTwMHFvRmkrqrnHypOc0NyD+pBymvk?=
 =?iso-8859-1?Q?0u0wGriwIjjywkWqeno78QQbM9fdSxxUxgXTydqrksXJZrPY1SkLGxkEHd?=
 =?iso-8859-1?Q?8/f42TeJHtbz6fhVfA9++vNO+64AdWHhhbK/Kx4sXMe4x0xAfYtLm92HC6?=
 =?iso-8859-1?Q?mqaa1WiKEwCqYb+Pg3pWIbtTenCJe4CeTgeJE08RWqfebuRGDI7PGZF97z?=
 =?iso-8859-1?Q?d/KgCSoxSkVwDw1etT9+Es9hS6PhPPLatgr5UL17NgjgRQzeWViSe2LyiS?=
 =?iso-8859-1?Q?Dbram+YfI7KmvT3vnnbYg+Dcw8yDkolShcoIV8upWFKF9vea+XDHHQdLp6?=
 =?iso-8859-1?Q?oV3sYHwdibsZDqG9WdfvBKllfpSKidBWSi76vkrCQIgpJu3fjSaz1Vnpto?=
 =?iso-8859-1?Q?zEWYd5lQyDGv5lOavyO+U7ZcORJqZB50IjBWmvAgJn6gh7oqQsjop/tNad?=
 =?iso-8859-1?Q?o82tjwPlW/zgZU5sxSYt1s6SnXkCoLm9H5Geb+73l0+I9wgG0oCGomPlQv?=
 =?iso-8859-1?Q?gKQqoIFl4VZkPLweQpRVIXivn7XRl9eDQBYwOT10N6xxqWcA2OMnVEb38H?=
 =?iso-8859-1?Q?7P2kN+nfEPK3Fd63224Fa1ahHkpO9CFBlWpwXlke3rimtIhnQtcb9ytVrt?=
 =?iso-8859-1?Q?TuEJ0rpxtZFaDnV+jo9NmmbVPVwv0eRmvudWwwKrXmWzei4nunVSsqM5n1?=
 =?iso-8859-1?Q?1f+pNYU4fuCyaMtPCt1DZ6vaL/vQ1hQpDhoyIP/44y73FCDph9E8I1HG7Y?=
 =?iso-8859-1?Q?hxlZKpvc3N1C0MI74TP3vj1w1ab3WMoclQDWYqV9I5hmI7h+niouHEcyoP?=
 =?iso-8859-1?Q?ziLwLxBAgvxkVoAzZAxRNHQNygsP+qJ5i05P4gdw5kwB4p5gUWu+j6phly?=
 =?iso-8859-1?Q?/0jWLbo42X4hUQmxqmdsyMCPdSIItr1cWx2NTksqo/KjtyM+2Rbyt3Lhgm?=
 =?iso-8859-1?Q?iE45PyFK775Dq0W/OVpeFslj4VFhCM3WFCDMHEnuCp4v833qnZu3wj/L6A?=
 =?iso-8859-1?Q?jmeEYsdwjRmuwQ82rQKdaS7UqDTIaTeg5aSFBoHfhPOmY7+bSuCjUmcbEP?=
 =?iso-8859-1?Q?tfNER3vJ1Z0UNd9Ruk9G12ghuRwdndud2RpwaJ+6kDvRSSvZePSVyG0AQ/?=
 =?iso-8859-1?Q?eNXUJtXWhJig8/ngkvcVKcPEpgkmvjNWUWO6V7WUVf30IiaC/qyE1QvRli?=
 =?iso-8859-1?Q?9CVce7MgnnxMFr8H3fH2NAtRM7hSWbx8SRgR/6AReWNR76P+mbpZOEXubF?=
 =?iso-8859-1?Q?gHtXB4Lc/BLDLTnsDbNMsBCgLsyKNI3t/AOU3iGnoeNenweIY0/nTylF1J?=
 =?iso-8859-1?Q?GZpvsc4stTY4dL+6eit4l/P9N5erJiidsoaWXiQe6JX1AD/M7G1o5O8Qui?=
 =?iso-8859-1?Q?EQThabzMeNHV/aQP+u+MjoRNOz97m6r0jI?=
Content-Type: multipart/mixed;
	boundary="_004_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0cc3f4-e5a6-41f2-37a8-08db66829e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 11:38:58.5623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bi5ZBHM7egH5CZFDVglv5hKvDa0eeCQ+ZyJIJGh3ykbuJG7YOdAtKLsi+3R0wFne/ekeGHcXIhHdWLGt2udq/RirjOYvqtanOYVHSaH1Hoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
X-Proofpoint-ORIG-GUID: 29N77mPvdPZMAXWFX0vNckttjgE-dFIe
X-Proofpoint-GUID: GjClB6KfXWbWmCxzYkOSTB_p9_nThUVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=982
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182426

--_004_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_"

--_000_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is for kirkstone branch. Attached is the updated patch.

Regards,
Soumya

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Tuesday, June 6, 2023 4:35 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org
wrote:
> CPAN.pm before 2.35 does not verify TLS certificates when downloading
> distributions over HTTPS.
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

Which release is this patch against?

Cheers,

Richard

--_000_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
This is for kirkstone branch. Attached is the updated patch.</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)" class=3D"elementToProof">
<br>
Regards,<br>
Soumya<br>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 4:35 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix CVE-2023-31484</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; CPAN.pm before 2.35 does not verify TLS certificates when downloading<=
br>
&gt; distributions over HTTPS.<br>
&gt;<br>
&gt; Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../perl/files/CVE-2023-31484.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 29 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-devtools/perl/perl_5.34.1.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 30 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-314=
84.patch<br>
<br>
Which release is this patch against?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_--

--_004_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 06 Jun 2023 11:37:28 GMT";
	modification-date="Tue, 06 Jun 2023 11:38:01 GMT"

Received: from PH7PR11MB8503.namprd11.prod.outlook.com (2603:10b6:510:30d::14)
 by BYAPR11MB3397.namprd11.prod.outlook.com with HTTPS; Tue, 6 Jun 2023
 09:26:19 +0000
Received: from BN7PR06CA0054.namprd06.prod.outlook.com (2603:10b6:408:34::31)
 by PH7PR11MB8503.namprd11.prod.outlook.com (2603:10b6:510:30d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 09:26:18 +0000
Received: from BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::21) by BN7PR06CA0054.outlook.office365.com
 (2603:10b6:408:34::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 09:26:18 +0000
Authentication-Results: spf=softfail (sender IP is 205.220.178.238)
 smtp.mailfrom=lists.openembedded.org; dkim=pass (signature was verified)
 header.d=lists.openembedded.org;dmarc=bestguesspass action=none
 header.from=lists.openembedded.org;compauth=pass reason=109
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lists.openembedded.org discourages use of 205.220.178.238 as permitted
 sender)
Received: from mx0b-0064b401.pphosted.com (205.220.178.238) by
 BN8NAM12FT037.mail.protection.outlook.com (10.13.182.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Tue, 6 Jun 2023 09:26:17 +0000
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3569EfYx006446
	for <soumya.sambu@windriver.com>; Tue, 6 Jun 2023 09:26:16 GMT
Authentication-Results-Original: ppops.net;	spf=pass
 smtp.mailfrom=bounce+67612+182417+7320427+11847295@lists.openembedded.org;
	dkim=pass header.d=lists.openembedded.org header.s=20140610
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jakr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <soumya.sambu@windriver.com>; Tue, 06 Jun 2023 09:26:16 +0000
X-Received: by 127.0.0.2 with SMTP id b2jyYY7321762xCvxYvp420Y; Tue, 06 Jun 2023 02:26:15 -0700
X-Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4593.1686043543132277515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 02:25:43 -0700
X-Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3568RdsG017937
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 09:25:42 GMT
X-Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jak7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 09:25:41 +0000
X-Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 02:25:40 -0700
X-Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 02:25:39 -0700
From: "Soumya via lists.openembedded.org" <soumya.sambu=windriver.com@lists.openembedded.org>
To: <openembedded-core@lists.openembedded.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH v2 1/1] perl: fix CVE-2023-31484
Date: Tue, 6 Jun 2023 09:25:35 +0000
Message-Id: <176607AB744305A4.16722@lists.openembedded.org>
Precedence: Bulk
List-Unsubscribe: <mailto:openembedded-core+unsubscribe@lists.openembedded.org>
List-Subscribe: <mailto:openembedded-core+subscribe@lists.openembedded.org>
List-Help: <mailto:openembedded-core+help@lists.openembedded.org>
Sender: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
Mailing-List: list openembedded-core@lists.openembedded.org; contact openembedded-core+owner@lists.openembedded.org
Delivered-To: mailing list openembedded-core@lists.openembedded.org
Reply-To: soumya.sambu@windriver.com
List-Post: <mailto:openembedded-core@lists.openembedded.org>
X-Orig-Message-Id: <20230606092535.767943-1-soumya.sambu@windriver.com>
X-Gm-Message-State: WiGV3z93TaCvpNtXJVfqsxz9x7320427AA=
Content-Type: multipart/mixed; boundary="9zwLBbjzMEUEybkIsb7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.openembedded.org; q=dns/txt; s=20140610; t=1686043575;
 bh=CEyOxcPdof5KN7V1ldLH//p496vSVg/CjauyRwc9rcE=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=SpV/4nm66hrwMQcyJl0+rIU6+11DovsVBpQ8x+Sd0Mr60hn2lieR3l87DnLsOIm1ZU5
 /NquqIibi6n9SsjdEir2MrKNjYMrAQeGr2EIWz3XxEwPMsus1dxSf6rNOY8zFEp6FiW1E
 U6bh1UGDme3I0zzPEu4ehewAEwWABQouifM=
X-CLX-Shades: Deliver
X-CLX-Response: 1TFkXGxoaGhEKTHoXGxoaGhEKWUQXYUgfR29Fbnp/H2IRClhYF3pvGB0TaRw FAWxyEQp4ThdoGntjRE9fc2JtYREKeEsXem8YHRNpHAUBbHIRCnlMF2FyXnAdc155WlpwEQpDSB cHGB4TEQpDWRcHGxscEQpDSRcaBBoaGhEKWU0Xbk9GQ1xPWBEKX1kXGRITEQpfTRdnZnIRCllJF
 xpxGhAadwYZHBNxHhIcHBAadwYYGgYaEQpZXhdsbGYRCklGF11DRE5YQ1xPWHVCRVleT04RCklH F3hPTREKQ04XGGMYRUQdRX9PTngbXlJnTEtHQV9cYH9acmJ5SF9LH3wRClhcFx8EGgQZGxwFGxo EGxsaBBsZHgQZHhAbHhofGhEKXlkXSF5haH4RCk1cFxwbGREKTFoXaEd7TV0RCkxGF29ra0Vrax
 EKQk8XbR5SRwEYcEhmcmsRCkNaFxwcBBsdHwQYGBgEGxoSEQpCXhcbEQpESRcbEQpCRhdhSB9Hb 0Vuen8fYhEKQkcXY0NmUE5HHE5rbF8RCkJcFxsRCkJLF25EU29HQmBgflxvEQpCSRdpYG1dHER4 Ym9fXhEKQkUXYUhvc30YHGFaem4RCkJOF2lgbV0cRHhib19eEQpCTBduGF5hf0NvHhlITBEKQmw
 XYm9SfVhaHmB+a2sRCkJAF2BsGFwFAWVzeW8fEQpCWBd6bxgdE2kcBQFschEKWlgXGBEKeUMXZ2 kcRF1SWE1ZHWgRClpLFxsaHhsdEQpwZxdhWGwcTBhgb29dTRAaEQpwaBdvcE5FU25lG2VTARAeE hEKcGgXaEtkfkRLQx5kQF4QGhEKcGgXeh9QRl5ZRxhhax8QGhEKcGgXaH9hXm5mUGJPbWsQGhEK
 cGgXZGRITx5ecF9+T04QGhEKcGgXY0sTaXh9UhMcQFsQHRoRCnBoF2FSeGYcX25iR0dSEBoRCnB oF2xdemJdH0hCcnx4EBoRCnB9F2sBbVpZeG8ZYUhMEBoRCnB9F2McTRl4H0hwQxhBEBoRCnB9F2 hwaWYcXX9PTQVhEBoRCnB9F2xcZxNcW0NCSWB6EBoRCnBnF2J9WEgBaEdyfk9CEBoRCnB9F2dJX
 GZDUBxgc35OEB0SEQpwfxdlZV1SE2tGW0FIYxATGhEKcH8XZX9NWhl/ZGN8ZFAQGxoSEQpwXxdg bBgYRXMdQkNGeBATHxEKcF8XbRpmbkgeQnNfXHsQGxoaEQpwXxdgewV5BVJNHQFDThATGhEKcGw XaH17ehhCb0hSYnMQGhEKcEwXZk8dfm4bfVNgeW8QGhEKbX4XGhEKWE0XSxEg
X-Proofpoint-ORIG-GUID: 2I2on7oUedR1txMfamkuvJUpXHSbua5V
X-Proofpoint-GUID: 2I2on7oUedR1txMfamkuvJUpXHSbua5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_06,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=inbound_notspam policy=inbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=816
 phishscore=0 clxscore=1000 suspectscore=0 priorityscore=1000 adultscore=0
 classifier=customer_allow adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060079
 domainage_replyto=10417
Return-Path: bounce+67612+182417+7320427+11847295@lists.openembedded.org
X-MS-Exchange-Organization-ExpirationStartTime: 06 Jun 2023 09:26:17.6388
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 
 05a4037d-51e7-4096-3cae-08db667014eb
X-EOPAttributedMessage: 0
X-EOPTenantAttributedMessage: 8ddb2873-a1ad-4a18-ae4e-4644631433be:0
X-MS-Exchange-Organization-MessageDirectionality: Incoming
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
 BN8NAM12FT037:EE_|PH7PR11MB8503:EE_|BYAPR11MB3397:EE_
X-MS-Exchange-Organization-AuthSource: 
 BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Office365-Filtering-Correlation-Id: 05a4037d-51e7-4096-3cae-08db667014eb
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-Organization-SCL: -1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: 
 CIP:205.220.178.238;CTRY:US;LANG:en;SCL:-1;SRV:;IPV:CAL;SFV:SKN;H:mx0b-0064b401.pphosted.com;PTR:mx0b-0064b401.pphosted.com;CAT:NONE;SFS:;DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 09:26:17.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a4037d-51e7-4096-3cae-08db667014eb
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-AuthSource: 
 BN8NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8503
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.0113325
X-MS-Exchange-Processed-By-BccFoldering: 15.20.6455.026
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097);
X-Microsoft-Antispam-Message-Info: 
 =?iso-8859-1?Q?K3+KudPMW8Zo9t/DPR/9NYzWRxLGK2KPKSHYU9Czbj+quU/i1IzlVZ/CWZ?=
 =?iso-8859-1?Q?890CazOVW0/HKoeHz2v8fRJs+Cu5JtBMOvV+rgaLXs/YRf9FBMx5cw/ynW?=
 =?iso-8859-1?Q?3iAT2ZGd7Mf0AHP63V4QAPbbasAdvNxII1y8iCoLyBJWlvPOq6bDa2LBu0?=
 =?iso-8859-1?Q?d05Ns69+b/ymUVaaYuQQ/XbCp4iFFFUWC9Y/UmZMj5hdOggnjFpXJHr2M+?=
 =?iso-8859-1?Q?YUClhzUmDE3Ovr98ol6EaN/HIivn3hhrf6K+pkSoDWExEhEQ7GcycUGHdh?=
 =?iso-8859-1?Q?xTqpVbSViWpPHs8QLd9vv7jmGizbv3E9VBtKY6xPLsR1DZlUpncfYxzSXJ?=
 =?iso-8859-1?Q?J2NKWCV70JS9oMlUEokBadlUzAyNIifGR57m4lj9CG0cQf5KspXLDmW97N?=
 =?iso-8859-1?Q?wZZoT3suQYlCJ6AjaFkX1GwIL7scIfGD9PlLfLoM0Q0TdIWcg95WMU9hpA?=
 =?iso-8859-1?Q?cO5XPd7p85uvmb59SwiwLBs8Zk3stwgM5sE9uCaPbxXyVSH1uWl1/qGJoV?=
 =?iso-8859-1?Q?f/LxfPd1Wq8kpe32Vc/t3PMQ2Zm4eyTpanBDRq5WLvGlO6NKSd3B6AHHJK?=
 =?iso-8859-1?Q?/MoET61xdu5l4d+woIuMZF2oi7CM4WjG4tv/hJI+VAFifTeICi6mlaad98?=
 =?iso-8859-1?Q?5iBRB15e9M8bhw+XvV4sLMyUmJwMCy1ONptohAgdVAzjCbQ+13REVLY3Re?=
 =?iso-8859-1?Q?yfDLC/SjWODa25IvoyPsROaxP+vEbKGZdysR7bJR1MmpeP7d3QghJ5CogK?=
 =?iso-8859-1?Q?9guyPDRxp0H6DR59mpwJsJ3GfuQhGdrAJYuqZq3x17936EX2XAi/d5mqrr?=
 =?iso-8859-1?Q?RD4W4FtzR33KBERD7PdRjQaqisJLlihnDVyv0mQZH/iHH2ijvfuJzMfaRR?=
 =?iso-8859-1?Q?zbVh/bO05jbCLwd1SjKhRQp3voBzcwVzT2ujKy28ZnsLvji+2uKys5OPV4?=
 =?iso-8859-1?Q?WATabjeGGXAX89k1grnACBro9ObkB+fLUNDYsYykk9rqOV5tClF7pATm0V?=
 =?iso-8859-1?Q?AIoIOBriLst2A7m2ARAhCYZ7btpWkPYjxNCMM3KZ+YwSesJTQJFA3fkius?=
 =?iso-8859-1?Q?7KoVtcWA3YXEgmzgtEdlkEQnQtR9Sz5umWQUcwEBQxoOwWuMSNmJl7Uln7?=
 =?iso-8859-1?Q?xRc9BANzaO7L9R7P9WoOyqbfkCVh/fREqG9RwnSYIJ7jDEqG+S5UzZSn3x?=
 =?iso-8859-1?Q?PZrzoYTyy+sf/i1HnIJwtR59zt17U2b9W2pKQOPEWFHRkXxOQKtIiCISGA?=
 =?iso-8859-1?Q?eDawyWHt0mDYKx80rrWbwMeG6LsDlakja+aMGNqGxkylSpZtYmWxCJ+kIJ?=
 =?iso-8859-1?Q?uC5pwuEWF9M5JHPDhqQfnt0jZUIW6UFAcvKdXXEcfOOaBOTpLzYClf72hp?=
 =?iso-8859-1?Q?p8YSl8fVm28j6U4wxPs8CRDPq0/ii45dF0EHpXtaoRzR+EVsMdYXNKwBB8?=
 =?iso-8859-1?Q?oS3++Kafd4RYaWZEzgwqFlAqTZQc4QZrf+pznEa/JyTwm2LJa1PD6ux5Bn?=
 =?iso-8859-1?Q?L81r9CcwkoatVt5eU5O+WIU0jy5ZXquZRwcEBBRGTzIZGSfhyiBnDSODnW?=
 =?iso-8859-1?Q?qbEa6mRoXuRDsw/Ltuzu9GLrEQFHzHmlOl+sDhhNxJav0K67zJ6L2PSq38?=
 =?iso-8859-1?Q?AV8iysz+s0SOrGusoWQGIRzmtuMnnjYVYRPKH2/xV8XptX1VbRek2H/TDv?=
 =?iso-8859-1?Q?8nWXy+bmdsUS+2UB6dvLba66KGqwNZUi140tXLdQkn+8xRY+xGyV6809AL?=
 =?iso-8859-1?Q?wIjd1nHTTLrOe4aSLPEuZADbOmFG7vbyAriohrbhu/m0rcc4cY5wXFn2sR?=
 =?iso-8859-1?Q?rxDfClf6Oh3kx6RlgGk3HZGdIouu42a3sBVxbjgpwaXw8fxVhiOvRy+p34?=
 =?iso-8859-1?Q?udszFmqRinfu2q0A=3D=3D?=
MIME-Version: 1.0

--9zwLBbjzMEUEybkIsb7h
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..1f7cbd0da1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
+
+CVE: CVE-2023-31484
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+index 4fc792c..a616fee 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+
+     my $want_proxy = $self->_want_proxy($uri);
+     my $http = HTTP::Tiny->new(
++        verify_SSL => 1,
+         $want_proxy ? (proxy => $self->{proxy}) : ()
+     );
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index af4660091b..1fa8482bcd 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-build-with-gcc-12.patch \
            file://CVE-2023-31486.patch \
+           file://CVE-2023-31484.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.40.0


--9zwLBbjzMEUEybkIsb7h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#182417): https://lists.openembedded.org/g/openembedded-=
core/message/182417
Mute This Topic: https://lists.openembedded.org/mt/99359707/7320427
Group Owner: openembedded-core+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [soum=
ya.sambu@windriver.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--9zwLBbjzMEUEybkIsb7h--

--_004_BYAPR11MB339703E6629D812AD19D49C28152ABYAPR11MB3397namp_--

