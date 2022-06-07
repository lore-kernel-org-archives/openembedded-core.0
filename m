Return-Path: <claussen.j@eppendorf.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E147C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 12:36:31 +0000 (UTC)
Received: from smail-epp.dts-security.de (smail-epp.dts-security.de
 [81.89.246.136])
 by mx.groups.io with SMTP id smtpd.web12.11951.1654605381296003881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 05:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@eppendorfaghamburg.onmicrosoft.com
 header.s=selector1-eppendorfaghamburg-onmicrosoft-com header.b=PWIKp2zO;
 spf=pass (domain: eppendorf.de, ip: 81.89.246.136,
 mailfrom: claussen.j@eppendorf.de)
Received: from pps.filterd (smail-epp.dts-security.de [127.0.0.1])
	by smail-epp.dts-security.de (8.16.1.2/8.16.1.2) with SMTP id 257CEgsc007621
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 14:36:19 +0200
Received: from mail-hh-06.emea.epglobal.org ([172.16.0.5])
	by smail-epp.dts-security.de with ESMTP id 3ggfhw0de9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 14:36:18 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL8g1z0QZpVG027Jdc4BxE8szGm3hZP/ss1jzY2HqL7JWAIz72hQUh78ZLkX2pwi6LJgmVUJohlgdIw549dEF7lPhmSsGHIuXBvhvx6JYK2R5SzykMkjVQfKTVpqw9Ysz+aL1sVcoIlfhILEtMxjn30rrPgJlh81eOdFgyK2cQIi+YB6iCshBDHzE/Ag9weJCTx3Leg2JiVa0nXp1jc/Sw3DafWOKuO71kDkRfE26L3hEjvsQx4NpeplUdwsIei0twSfahZzbLsLf9i4fZxXIOdYTKMJv8bx+8Z2Qh2SdDbZBKBZaAaM9JbUlaaBMGqwWpwQ+d8se93p6X6JHQ4wHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ37qZoJsDriNm1Pm+MomD6KHvHBFoH6i3k/7AU7+8w=;
 b=bjPw2yDkxGzM0IM4xf8q+ADRHJbsR1+Jq8v9Pym0Kv6tluSleTbmi8B2n+JyTeXMdYxqP+w+kMVeSRcot9JBGv+/Li1/nNan5xBrSg3msNXCnbt5vPvuGGdkanriRx4OWcRbYnGx9ZaBfyosdyeqYIxDDPG8g2cnuSj3cZjBbvuhgXH2IHbcjsTNiuhTU37k0YGX2sRSlVzJXVR8oaK7rN7bB4xvTj9ek2gNnpikNsoOMOIAeKCvX6BKC3s6iy/gFnjkX+wpsQR5te6mrvJXrEDU/hiaIUPIq1Xvscq6L+PxpBokMtYxQiYGxIfQJwmgso8+L3t0umddewP8nvqpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eppendorf.de; dmarc=pass action=none header.from=eppendorf.de;
 dkim=pass header.d=eppendorf.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eppendorfAGHamburg.onmicrosoft.com;
 s=selector1-eppendorfAGHamburg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQ37qZoJsDriNm1Pm+MomD6KHvHBFoH6i3k/7AU7+8w=;
 b=PWIKp2zOo1tmPkn4L6FFhUePQ8AQEjxgWWj7xzBOiqNrd5Uj41a68uy+0/z0L9ggaT65PrhW3e2octKTRIOGz7lENZkkZRFiRBquFYXwZBzUD5AJifOtNEApQniErYISrDyjfMYeiVOKbHlHry99XWEmlt/3o1yS+3zKbH5cLlk=
From: Jan Claussen <Claussen.J@eppendorf.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: dropbear: Allow root login fix
Thread-Topic: dropbear: Allow root login fix
Thread-Index: AQHYemsIDb3JzmKqoUuBi9Y5n1bkDw==
Date: Tue, 7 Jun 2022 12:36:15 +0000
Message-ID: 
 <AS8PR02MB8392C950253DEB9B054726B9F0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5eb3c621-c119-b61f-aac4-d61190f984b2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f042048-12f1-4543-db72-08da48825082
x-ms-traffictypediagnostic: DB7PR02MB4043:EE_
x-microsoft-antispam-prvs: 
 <DB7PR02MB40437367FF5E4CD4CE29A7A0F0A59@DB7PR02MB4043.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ultN/1oEEW7jWGs/VEa2RLAtN2aYplIDzInHaRLcAr3uK/XRvJi1+9cAfzMX6i++Gg5iFpMqYMHxjmXkMq9rKNg5ynDj1TX8gFKzf4+CvkJx9fZvXFILs+IQueI1TTvcdNhAPbvbvc5yIkF4Xgz/oBL0QgYgruzRLyzdG/CmSedKK1EV83j6ALxiYNLq0kbixo3jGW+zNoRUhcFsY0F1DZ5patmO5uSzJV+4je5g4rB/ESrD1m7ltE/7Er8WQ0CA4MmJNohMxVWHmYr7CH0N+rI44bvkyBrw6gKQkP7r/UUeTlt1uFa9S5qcC3qcbqDhvlEu+Osem+bHPDdFBq3BeinOpq1JvlL8s+GbUjhz8rLtX2a4s+95pIMzGEniLsIS3rDdF3kpvltdTBl61A2QugiwLdqUeNejbaVk3fhiE96c3krhdqQBshrF3BhbrZvWkC4pUZx3pp1UgNp0AGE2zRewps3SOY2MK1k4g7dqeM63p8gvcqxZH3t5r8yvJMAPFBXJTTPVpLYJfMXu8Pfu+xXKw9jNKpcdtLH4FdyuNJnxv0vzV+s8GVLIQWWAZhGpw2oOGmmzCHWuHKgsQre3sLVr3WwM+UQ2u6Aq/mYJZQz8QR+GUpdh9/5oCv08NXDPztjg2mdmRWErBBaUWFBT67XL625kMBSS9A4wo2hYrKoLiG46v2I74rEFb0/sgwixQxTcXoYMMe/o120FBtoDww==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB8392.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(66446008)(64756008)(52536014)(76116006)(5660300002)(38070700005)(8676002)(38100700002)(6916009)(316002)(4744005)(2906002)(7696005)(83380400001)(122000001)(9686003)(55016003)(33656002)(186003)(8936002)(86362001)(19627405001)(26005)(71200400001)(6506007)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?p25TrT+sAq1UImtbyrycUmxfuMV28MlHB33pO/+iQmsMQ/hiY8/AxLalhn?=
 =?iso-8859-1?Q?8eDKeMNGW1WBBHOdSeUC9MkVqVJZW8vhz6aJM3gIrJr0JYmpj+t4dy5F0C?=
 =?iso-8859-1?Q?x0QzlbAu06jpMxGQ/eDBL2VW088WOpPHlXHrcfAG+69GIKm4F9jbVwjKXT?=
 =?iso-8859-1?Q?ZBXfUDCVebqz3S0m9ZBsmvbimyUarmx2EHaVOkAgn4oMb6rhWBnJKzQJV7?=
 =?iso-8859-1?Q?QU1wtLjxstTOwhn8f42NAsfO1Fr7nn5ZrIIPMK59/xV3e8dpxsl89URm3X?=
 =?iso-8859-1?Q?ZRPByxTop3zrPQU1RLaF8gt0HSbuYX8bnda7AwtA+B50EYgYoX7ktCT8Tf?=
 =?iso-8859-1?Q?P0IL5tR2IbDHizqYVHUwqWs//zaAyMUjfUPjsZbLqr+rf8CUR3L485IAD2?=
 =?iso-8859-1?Q?dvAgxZZ57I4o6RRmn5iWswTcXiJKGfNfxAh40jp27b6WSVm2tAcsYpfNZT?=
 =?iso-8859-1?Q?on4oxP44XYvTbD5yXaHioVjH3hbxbxpO/3yGD9OWhypOGVds8Xv2M0TydN?=
 =?iso-8859-1?Q?a59ox1M1e/BkM2UENLGrOlQwBKB/fyH21nHwx9svWBvj8/N/Rqfgyli0IL?=
 =?iso-8859-1?Q?5jA9XcHldO1bYpI+V3PRWcEkHDgEfH/LgNp761G17cSERPPgmMMGYOFBb+?=
 =?iso-8859-1?Q?Xxix9PFfvemVU3XuT26aONxKAwWRaFW5Mxlqagaj8QRpri3HHBAXTNB2on?=
 =?iso-8859-1?Q?yr8lH/y6FGm/DQrLK0NAH58qxY2dQPT/cXmV/yxxK1E3w1Fs5TQFL07t04?=
 =?iso-8859-1?Q?ZZ4/zqeuZEt7p5fhGjiXKnCEJEahjbsSaSuNrkL7Jl5RBQvvUVyP+jmSAP?=
 =?iso-8859-1?Q?ROZJTw9HLW9h0RbNOf1amv1sAiC2tmjRmSG8evO5QqxJAuXeEg9nFKCRNw?=
 =?iso-8859-1?Q?ajdk01IZtKyZ26HtYB1wJ8wOisntlfpZQLy15OcoVYdsY9sZTGJMTrGN84?=
 =?iso-8859-1?Q?5ed5qRHPwmVdNe+WjpK0bltICHJUlkl9EjPErlVY3xa+OiSbjd1YEjvKoN?=
 =?iso-8859-1?Q?TZAu7me6Dyq0wR9ioqzkrnvrykp5WIkvJEgsH1GS5ouQiWLcXJlb7p4NpL?=
 =?iso-8859-1?Q?B3Zdt5YuYXGix7+r5ZiI1i9Ehbtde99qeZhYHLDded/oviSEmhIEczFAfm?=
 =?iso-8859-1?Q?E91RAYsrC1dDleZDp+GaRK9/xhZrOuw/s1eWVFAZRs8nJRlJncdVPTmZul?=
 =?iso-8859-1?Q?gA6KSutY/e0hp6rd/8pL6Kk1F7ORQVaYbljUtSpEVG0gf2f/UcUcF3BaJ/?=
 =?iso-8859-1?Q?hNg9O7hmaCVc/E9KEq70awnUv+Kc/+T2H8ZJIdOkZq5ZKZ4OaFziteg5mB?=
 =?iso-8859-1?Q?DXvYAUO9KlyMHNfCIBaiOEsmWo1CvsM8qzs7w0agp/WasV/YcyZ4VdDbIe?=
 =?iso-8859-1?Q?v65w0yW2KwU2CSuAtJ9nZO1JLx7obyCsvr27Q3DuipWCBWhWwWfjNz9iMC?=
 =?iso-8859-1?Q?x7bdVHZwo6C3BystXbxy4c7Fc/3h2Bee+OisEsfc9vLNTzztXxSo2oKDle?=
 =?iso-8859-1?Q?JaKLZ3c5s+bfJYk4APjMsAxRD9MBZvGj7tzTk9ADi8Novf/e3+7KpkXY6I?=
 =?iso-8859-1?Q?XEQNRJaYffBZn41x63r6Qh9PM2gpq77l7yGzF2pRoC/ELZfGZsqVVyihE8?=
 =?iso-8859-1?Q?dnbVYdDy9m5DwEdBmrqDdM362Cw3pwnWGGfCOdgwp36Q0TBkVmyrNz69eG?=
 =?iso-8859-1?Q?qUiA6ai0g7G8N1pLJQOTCvJ36jsPThckgYEBx2NxdfQuZuqgZcTU1toSFp?=
 =?iso-8859-1?Q?6k6L+kq+GMjfxLOwnUDsIyenJ4EvHLL33QqvSXMkVgDqe+vu4CWeI7iCci?=
 =?iso-8859-1?Q?LZpbRKRLbA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR02MB8392C950253DEB9B054726B9F0A59AS8PR02MB8392eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB8392.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f042048-12f1-4543-db72-08da48825082
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 12:36:15.9891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 30d50150-9a5a-43db-b809-ff90d7ab4fd6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tAvAKo+auQN/AA3y/tS3vGt4G4Amck1tU8SgDEsI6fepr8G4dAjqqlItM661bnc3ntTzU4sjv+laTIAIirTY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4043
X-OriginatorOrg: eppendorf.de
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-07_04:2022-06-07,2022-06-07 signatures=0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 12:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166660

--_000_AS8PR02MB8392C950253DEB9B054726B9F0A59AS8PR02MB8392eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

    This enables root login when either "allow-root-login" or "debug-tweaks=
"
    were set in EXTRA_IMAGE_FEATURES.

    Signed-off-by: Jan Claussen <claussen.j@eppendorf.de>

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dr=
opbear/dropbear.inc
index 78f9f9adbd..e545c425ab 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -105,6 +105,13 @@ do_install() {
  -e 's,@BINDIR@,${bindir},g' \
  -e 's,@SBINDIR@,${sbindir},g' \
  ${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdi=
r}/*.service
+
+    # Enable root login for dropbear when debug-tweaks or allow-root-login=
 are set
+    if [ "${@bb.utils.filter('EXTRA_IMAGE_FEATURES', 'debug-tweaks', d)}" =
\
+         || "${@bb.utils.filter('EXTRA_IMAGE_FEATURES', 'allow-root-login'=
, d)}" ]; then
+            sed -i 's/-w//g' ${D}/etc/default/dropbear
+    fi
+
 }

 inherit update-alternatives
________________________________
This email including its attachments is intended for the person or entity o=
nly to which it is addressed. It may contain confidential and/or privileged=
 material. Any review, forwarding, dissemination, other use of, or taking o=
f any action in reliance upon this information by persons or entities other=
 than the intended recipient is prohibited. If you received this email in e=
rror, please contact the sender and delete the material from any computer s=
ystem.
________________________________


Eppendorf SE, Hamburg, Barkhausenweg 1, 22339 Hamburg, Amtsgericht Hamburg =
HRB 171526
Vors. des Aufsichtsrats: Philipp von Loeper
Vorstand: Eva van Pelt (Co-Vorsitzende), Dr. Peter Fruhstorfer (Co-Vorsitze=
nder), Axel Jaeger und Dr. Wilhelm Pl=FCster

Eppendorf Instrumente GmbH, Hamburg, Amtsgericht Hamburg, HRB 69077
Gesch=E4ftsf=FChrer: Dr. Bernd Petersen und Dr. Alexander Papra

Eppendorf Liquid Handling GmbH, Hamburg, Amtsgericht Hamburg, HRB 92250
Gesch=E4ftsf=FChrer: Dietmar Stadler


________________________________
According to the general high quality approach of Eppendorf, we apply to ou=
r mail traffic the latest protection technologies and methods, including ex=
tensive scanning and DMARC, to help our communication partners in protectin=
g their IT environment.
Privacy information according to Articles 13 and 14 GDPR can be found here:=
 www.eppendorf.com/gdpr
<http://www.eppendorf.com/gdpr>
________________________________

--_000_AS8PR02MB8392C950253DEB9B054726B9F0A59AS8PR02MB8392eurp_
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
&nbsp; &nbsp; This enables root login when either &quot;allow-root-login&qu=
ot; or &quot;debug-tweaks&quot;
<div>&nbsp; &nbsp; were set in EXTRA_IMAGE_FEATURES.</div>
<div><br>
</div>
<div>&nbsp; &nbsp; Signed-off-by: Jan Claussen &lt;claussen.j@eppendorf.de&=
gt;</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-co=
re/dropbear/dropbear.inc</div>
<div>index 78f9f9adbd..e545c425ab 100644</div>
<div>--- a/meta/recipes-core/dropbear/dropbear.inc</div>
<div>&#43;&#43;&#43; b/meta/recipes-core/dropbear/dropbear.inc</div>
<div>@@ -105,6 &#43;105,13 @@ do_install() {</div>
<div>&nbsp; -e 's,@BINDIR@,${bindir},g' \</div>
<div>&nbsp; -e 's,@SBINDIR@,${sbindir},g' \</div>
<div>&nbsp; ${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_sys=
tem_unitdir}/*.service</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;# Enable root login for dropbear when debug-tweaks =
or allow-root-login are set</div>
<div>&#43; &nbsp; &nbsp;if [ &quot;${@bb.utils.filter('EXTRA_IMAGE_FEATURES=
', 'debug-tweaks', d)}&quot; \</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; || &quot;${@bb.utils.filter('EXTRA_I=
MAGE_FEATURES', 'allow-root-login', d)}&quot; ]; then</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i 's/-w//g' ${D}/e=
tc/default/dropbear</div>
<div>&#43; &nbsp; &nbsp;fi</div>
<div>&#43;</div>
<div>&nbsp;}</div>
<div><br>
</div>
&nbsp;inherit update-alternatives<br>
</div>
<span style=3D"font-size:8.0pt;font-family:Arial;color:#000000">
<hr>
This email including its attachments is intended for the person or entity o=
nly to which it is addressed. It may contain confidential and/or privileged=
 material. Any review, forwarding, dissemination, other use of, or taking o=
f any action in reliance upon this
 information by persons or entities other than the intended recipient is pr=
ohibited. If you received this email in error, please contact the sender an=
d delete the material from any computer system.<br>
<hr>
<br>
<br>
Eppendorf SE, Hamburg, Barkhausenweg 1, 22339 Hamburg, Amtsgericht Hamburg =
HRB 171526
<br>
Vors. des Aufsichtsrats: Philipp von Loeper <br>
Vorstand: Eva van Pelt (Co-Vorsitzende), Dr. Peter Fruhstorfer (Co-Vorsitze=
nder), Axel Jaeger und Dr. Wilhelm Pl=FCster
<br>
<br>
Eppendorf Instrumente GmbH, Hamburg, Amtsgericht Hamburg, HRB 69077<br>
Gesch=E4ftsf=FChrer: Dr. Bernd Petersen und Dr. Alexander Papra<br>
<br>
Eppendorf Liquid Handling GmbH, Hamburg, Amtsgericht Hamburg, HRB 92250<br>
Gesch=E4ftsf=FChrer: Dietmar Stadler<br>
</span><span style=3D"font-size:8.0pt;font-family:Arial;color:#000000"><br>
<br>
<hr>
According to the general high quality approach of Eppendorf, we apply to ou=
r mail traffic the latest protection technologies and methods, including ex=
tensive scanning and DMARC, to help our communication partners in protectin=
g their IT environment.<br>
Privacy information according to Articles 13 and 14 GDPR can be found here:=
 <a href=3D"http://www.eppendorf.com/gdpr">
www.eppendorf.com/gdpr <br>
<hr>
</span></a>
</body>
</html>

--_000_AS8PR02MB8392C950253DEB9B054726B9F0A59AS8PR02MB8392eurp_--

