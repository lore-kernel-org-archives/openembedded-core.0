Return-Path: <fabiferro@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6669C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:21:37 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.92.18.91])
 by mx.groups.io with SMTP id smtpd.web10.150877.1703863288364071613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=RvAjK/ka;
 spf=pass (domain: hotmail.com, ip: 40.92.18.91, mailfrom: fabiferro@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/8m/1GkkIVAk/SDHkHB4vQ4jHg4c/82YDzswQs+X2PVhwzDnx4fDQrtngJdSzG5cyPmnIXDjCF1D4jFaCQZDb6/gOVOY+x2Ji/AxaatFJcvbxJzCh92IIXTOeWwY1TUrA3KEn+u5sRZzdqgKHbRiIIhfEaL7bDR/LIxJo6UCt1U7ARu1k6RZaTZN+KgJSJvrNNGy1T5LC1D8aSf0psrTEF5ByXVqwuLw6vaONiz5KG2rvv4L8z/TzDnnTys55QChQIBNnDKlU94q6Ch15m+QWyxRF6jdErQDOOMev0vi+z6T/U0UwVoMx/ZQWiSAQGuVT2GJRPpODoZSNMcIfvKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC1o0CKTJfyIyF3O351HPbvk5/dFshCjucxNB0zxm/g=;
 b=EHEPrF5JuGhV0oiwcGnSyyhK6hhUYIxDo6+cDj+4a09oozJV12p3sVmkQ2yP/xysSaHEE1/5WX7RZwrhpRbyfcuvsbZn3XiZDUdQLTWBY+GwUaQD8H3RBtR9aUht3wMwSS4R0UTFUhs/rF0G9XC8FTdhG2ax8e2TVQEoAeML/qjvc1FwQ0il+0KA1pNY+T78mjXlvtifsYK1wAxSDuQHXXjQ3M9Pb+DV7d9JYTkqptKLAGjlyZ7UjKKrhnmWQlz8xmkU0GR/ylv7UzF2+rYEuNniP7vTBIbZTUnGPpiJuyrBEc6wTw4Ph8wiGp4WXuA/LUdBMJrzGsnxl/or4089GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC1o0CKTJfyIyF3O351HPbvk5/dFshCjucxNB0zxm/g=;
 b=RvAjK/kaeL9P1ZuL8ZpwwmaNbtytjXe0xO/jopGNG89l0HTLgmi8UKpZH6/LO04R7SvEeXHdoVBUU30WWAekBd1A4ENitQG8T1JjJ4DfhF3yi9bOxsC2yqosBd10ZjvTZRl2pffS7WaYo0dK5MzWDDW0sCxIHMwwH3rtd4o4ceSTc4cfFeDQqVnMAyoQWFQWBxLeQ7WsRCe1Q8xbJzldMd0zUmso5HqTKDadovArB8lWyndDW13ucA9gIo96e7/brHd8CNSnOnBrUf7nuASeh+IUNkldLx3yk27Gcm505OdlTe+tcXT10idwpCoxrbxt8nrgvXB/U30u8vasJxfZjQ==
Received: from PH0PR20MB4495.namprd20.prod.outlook.com (2603:10b6:510:149::18)
 by SJ0PR20MB4291.namprd20.prod.outlook.com (2603:10b6:a03:426::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 15:21:26 +0000
Received: from PH0PR20MB4495.namprd20.prod.outlook.com
 ([fe80::83d5:5f29:7f16:c11e]) by PH0PR20MB4495.namprd20.prod.outlook.com
 ([fe80::83d5:5f29:7f16:c11e%4]) with mapi id 15.20.7113.028; Fri, 29 Dec 2023
 15:21:26 +0000
From: Fabiano Ferronato <fabiferro@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [Gatesgarth][PATCH] mobile-broadband-provider-info: Use branch main
 in SRC_URI
Thread-Topic: [Gatesgarth][PATCH] mobile-broadband-provider-info: Use branch
 main in SRC_URI
Thread-Index: AQHaOmqwbzrkebazQUiUp9bpVwrmWQ==
Date: Fri, 29 Dec 2023 15:21:26 +0000
Message-ID: 
 <PH0PR20MB4495504D9E4128F862CCE617AF9DA@PH0PR20MB4495.namprd20.prod.outlook.com>
References: 
 <SJ0PR03MB70500DC32860BC4008C279C6AF759@SJ0PR03MB7050.namprd03.prod.outlook.com>
In-Reply-To: 
 <SJ0PR03MB70500DC32860BC4008C279C6AF759@SJ0PR03MB7050.namprd03.prod.outlook.com>
Accept-Language: en-GB, pt-BR, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [wph94HrGfIEgK9PSVZ/gwvKQ7PbWncZ3]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR20MB4495:EE_|SJ0PR20MB4291:EE_
x-ms-office365-filtering-correlation-id: d7c1d730-28bc-44c1-bdf6-08dc0881d2f5
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mZgxspnPlvrV7C/th3JOANO7QnkXlkfZaeOGtis8fQxQiMqbxcbiUT3nQBHLge7QucVcPxZRg1qq7wxidxflIoyi/N22DlZwxuOUU1Z8KffQjYkePyK3GoAxtPk8R6dE0UeP2Zb0XjMAaUDA3J9ZhecRUBBC3AtOKDphJV+twC5uX/hffh2iPdwvWi1R7xmhvwRT5XsbqETb9feK8FvISFemtvlgAd4RMtdue4a7jNjOlXGLhxDrnkwuLuSZS+rHqc/5Oqi3hYsCUtR9CG6/90ZWkmdlEqCOcEsabmxEOiZpbYIKwb8FXMnNRnclZLMLWeaNSpSmEJshgRw47fBDlJPn1NqAv3gnW0whjUuZwCSgcnLjEfnwyzFsNOtLg45yHkqLnqKt+ivf/Qyip49v9qQnYyfuJqEWtiwCsXudgUZ4MKxCMf9qsP40z5NSQp1P85CgkjkJMCoK1bbz/UswZM5gYxRgAWWeH4PH9MGoW8wklI7G/c5A0MDWaQBNu9oPKT2rdXIceF50O28kJZYOx2dGBcy5jWQ+3tH2nmh7Ms8RJRi3FOR5AM0SLXOqs0AT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ztZ1vz0Tb2lo7ve6G4ATrXV5kSSVNGftoM0ANjOvP+tm008bugBzse3+rs?=
 =?iso-8859-1?Q?hIW0mfNn4UNpFW3qKhGNYfCU97Z1/ai08FAs318gkuM6BK0YfhCXfJoItd?=
 =?iso-8859-1?Q?Ep9bEVb8LRmRDLZtP1zfADl10xtA0d8gmpZxXEH/hbpW0zFbQh0nEzZ1w4?=
 =?iso-8859-1?Q?oPA07L6qLIv4cQ7ItX+wtuTbs3L+WNU7V7JVRqxzFIsBCkIggpVNa8ehkx?=
 =?iso-8859-1?Q?SAxy97k2MHNOwRBOXUifY2LTbMzXXWYrDgU/YALgmBDEnSWq4SedsC2sdW?=
 =?iso-8859-1?Q?MBMrFC0+18DgVMFg8NHG8xgT9/Assl7cGzMYMbUfTE+sEXpMCW3FIbY7YM?=
 =?iso-8859-1?Q?FN8mGj5FJ/c5YkU/FchRCzCusyGI1CjedGxZ2Pw6G+H8NqYOvOCTdLPXV1?=
 =?iso-8859-1?Q?j9Inar6SSFtAAWoAlxLxrIton/wIH8IjWylh4F062MPszsJ8r/HsPWzGQy?=
 =?iso-8859-1?Q?tm5m9N66Vg2QT7KFP4zvFntWvxvvGYEerKt6PVeLIrOtbsoHpea27/q+GP?=
 =?iso-8859-1?Q?YzsywVm8PjD/mCuyG2XKsimwdB2C9quxTalCxzhP+VL2ncS212uz1DHc2K?=
 =?iso-8859-1?Q?HZXhGw86suhGOmZjufE+ggAy9QcAv2gDqyAia9pUHNyJ43D+o8UhuMLww6?=
 =?iso-8859-1?Q?zm5uwkmcqE3jhm5SrfgB38vM1Vfg453X8RURt2vf42ctejfPQADjl9xjnj?=
 =?iso-8859-1?Q?BNm4OuWUBt9QBs9xX0yd6wJtHBgsN5WPgTqICK7xlPnIf2sVfOu3KDvbk4?=
 =?iso-8859-1?Q?FJQ6vLORsaR35sqZvj0QM/FoZ2KcadQqhcCdIVYMwmatvXsJyxpgsgmS1g?=
 =?iso-8859-1?Q?i1Anz8Etn/Q67AxwqaILqD6CNmUKIMFioLMAPlQDDwwbXxDq1ac3dliqLL?=
 =?iso-8859-1?Q?M8s78nc6RN7B26Z1LgVOSHOtkG7B41iSvp+X9JROcXHOKl1+RvKctyZF0I?=
 =?iso-8859-1?Q?ADXOVIEqjtSgg6fQ2YKwyJAG5gE0za6VF3H6lJDpEXKwPbk/Cak3N5JOjy?=
 =?iso-8859-1?Q?9VCNZMjeRUbQz7p/iwhcsUHdmSSaIx1fiHCu1FyuYp8SzIVzOPn9tWLxjn?=
 =?iso-8859-1?Q?bFykgWeB3S62XACm6ZLlEGCDzR29AYLDLYWM5B0s+gwDQs3FMJugHfgOIQ?=
 =?iso-8859-1?Q?1aJ/xTyAtRcYbAQIzhM0oZOs80bDgA8uBoEeWUg17PajCRAwjyv23PtDqm?=
 =?iso-8859-1?Q?8JR8rTjo0nZYrYZhFD8J/nWe3wqWObSJtVSeDIdVc1vs/cBgXXyo92Hpab?=
 =?iso-8859-1?Q?AAmE1wFRF0bGk23SclsA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR20MB4495504D9E4128F862CCE617AF9DAPH0PR20MB4495namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-9803a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR20MB4495.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c1d730-28bc-44c1-bdf6-08dc0881d2f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2023 15:21:26.2661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB4291
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193016

--_000_PH0PR20MB4495504D9E4128F862CCE617AF9DAPH0PR20MB4495namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From d8bea31d74f356c96d9b6df462071709111f5d7e Mon Sep 17 00:00:00 2001
From: Fabiano Ferronato <fabiferro@hotmail.com>
Date: Fri, 29 Dec 2023 15:48:37 +0100
Subject: [PATCH] mobile-broadband-provider-info: Use branch main in SRC_URI

Uptream branch was renamed from master to main.

Signed-off-by: Fabiano Ferronato <fabiferro@hotmail.com>
---
 .../mobile-broadband-provider-info_git.bb                       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobil=
e-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadba=
nd-provider-info/mobile-broadband-provider-info_git.bb
index 7dccc15e03..b359a50758 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broad=
band-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broad=
band-provider-info_git.bb
@@ -7,7 +7,7 @@ SRCREV =3D "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
 PV =3D "20201225"
 PE =3D "1"

-SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.g=
it;protocol=3Dhttps"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.g=
it;protocol=3Dhttps;branch=3Dmain"
 S =3D "${WORKDIR}/git"

 inherit autotools
--
2.30.2

--_000_PH0PR20MB4495504D9E4128F862CCE617AF9DAPH0PR20MB4495namp_
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
From d8bea31d74f356c96d9b6df462071709111f5d7e Mon Sep 17 00:00:00 2001
<div>From: Fabiano Ferronato &lt;fabiferro@hotmail.com&gt;</div>
<div>Date: Fri, 29 Dec 2023 15:48:37 +0100</div>
<div>Subject: [PATCH] mobile-broadband-provider-info: Use branch main in SR=
C_URI</div>
<div><br>
</div>
<div>Uptream branch was renamed from master to main.</div>
<div><br>
</div>
<div>Signed-off-by: Fabiano Ferronato &lt;fabiferro@hotmail.com&gt;</div>
<div>---</div>
<div>&nbsp;.../mobile-broadband-provider-info_git.bb &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-</div>
<div>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/=
mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-br=
oadband-provider-info/mobile-broadband-provider-info_git.bb</div>
<div>index 7dccc15e03..b359a50758 100644</div>
<div>--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-=
broadband-provider-info_git.bb</div>
<div>+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-=
broadband-provider-info_git.bb</div>
<div>@@ -7,7 +7,7 @@ SRCREV =3D &quot;90f3fe28aa25135b7e4a54a7816388913bfd4=
a2a&quot;</div>
<div>&nbsp;PV =3D &quot;20201225&quot;</div>
<div>&nbsp;PE =3D &quot;1&quot;</div>
<div>&nbsp;</div>
<div>-SRC_URI =3D &quot;git://gitlab.gnome.org/GNOME/mobile-broadband-provi=
der-info.git;protocol=3Dhttps&quot;</div>
<div>+SRC_URI =3D &quot;git://gitlab.gnome.org/GNOME/mobile-broadband-provi=
der-info.git;protocol=3Dhttps;branch=3Dmain&quot;</div>
<div>&nbsp;S =3D &quot;${WORKDIR}/git&quot;</div>
<div>&nbsp;</div>
<div>&nbsp;inherit autotools</div>
<div>-- </div>
2.30.2
</body>
</html>

--_000_PH0PR20MB4495504D9E4128F862CCE617AF9DAPH0PR20MB4495namp_--

