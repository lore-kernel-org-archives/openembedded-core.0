Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60623C61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 20:10:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.59])
 by mx.groups.io with SMTP id smtpd.web10.19763.1677837308025549777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 01:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: vm.pl, ip: 40.107.6.59, mailfrom: piotr.lobacz@vm.pl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIx+VrXhmU++sL9RngZF5IWEkE+LP+cXyxiwoFwo6ikZ0loh00ZUs0+AtSpd/fDOcxdAAi7JQolfXKCCkGqAaX7npXByir4Og0ld//8pXpowveYQ0YHB82q3ihqg0S8zSb9NTJiRhIjK4qcx5LgaTsTS/PcXZHgnOnhLgrZtkf0QGC+AvU5DBSI54AkeCcfsVPtRwLjgYuR+A9J0ZXjTOkaSw+HyJ61vz4m379ZivXP3Bm4e0QG+5BRzBT4N0Q7FmyZO3KiJIstgHpItbSzvGcIfdJVedQRCGIO9FHwunQlF82paEPFSbPmI0PqVtZbAsV/bq9orEvdkq3QxpASyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq7n7BhJAZQqB3UKmeS8E4nhnhLUUSmPF/WRt14pIvs=;
 b=B+gjtUW83XRdTSFBtTXxQ5uo8Tegc6s9qIrqgd0jdtUyY5g7BqEsxHBi/rac4Yzq58QOoGwvV9yRy8JyQX2Chahm6vR+xWnHhTKNJKGfFs90BZpYqQNuuBhsd7Sa6Qn+4BUDsCRYbYk/8DGUjOH0Q8fCX7kK7aNZ2zO4cijZnvUkRiVKLipp2JyYkpKPKXsLlUDBc0rY4Nu7NmiPtMQkD2zUEOcfuUy0qrWDP5pdWG4cgVF2fEa8E9XkCd0JFOGrjzHnFOz45zKBtQ+aN0s0ss/4Ti6W5/zg27bfks9LLFPtVbZmR2eTcM8joG6vXdJR6ZnkEdP67DyHJYpUf9mL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vm.pl; dmarc=pass action=none header.from=vm.pl; dkim=pass
 header.d=vm.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vm.pl; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sq7n7BhJAZQqB3UKmeS8E4nhnhLUUSmPF/WRt14pIvs=;
 b=iutMv0YfTemojfox0H0Mb/3KWfXFvMkLx8gtONv10mUpttmni+ZqVMpSfp5Gr4ei0plNMlZZZRisytKNGa+W3PhA8yBmbdrwzyz7ZGIMiDwmnA58MFZXVX60WeBsPsILMtgEPdJFRowEPcBqy9emehJ1aMaluUoI9xTIBKjeTMk=
Received: from DB9PR09MB4985.eurprd09.prod.outlook.com (2603:10a6:10:2a6::11)
 by AS8PR09MB5317.eurprd09.prod.outlook.com (2603:10a6:20b:374::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 09:55:03 +0000
Received: from DB9PR09MB4985.eurprd09.prod.outlook.com
 ([fe80::f8e1:e0d3:1af8:4473]) by DB9PR09MB4985.eurprd09.prod.outlook.com
 ([fe80::f8e1:e0d3:1af8:4473%5]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 09:55:03 +0000
From: piotr.lobacz@vm.pl
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [oe] [oe-core] [PATCH 1/1] Fix Bug 11766 - "nobody" group added by systemd sysusers.d
Thread-Topic: [oe] [oe-core] [PATCH 1/1] Fix Bug 11766 - "nobody" group added
 by systemd sysusers.d
Thread-Index: AQHZTbXrJPy3rllqNUC887OkZrj3sQ==
Date: Fri, 3 Mar 2023 09:55:03 +0000
Message-ID: 
 <DB9PR09MB4985543FAB59060FA950783994B39@DB9PR09MB4985.eurprd09.prod.outlook.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vm.pl;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4985:EE_|AS8PR09MB5317:EE_
x-ms-office365-filtering-correlation-id: 52950949-c53a-4487-7f4f-08db1bcd5c2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9OU32nynn0StB+l9I+w+juvKO+LJw1z7LGWulmyW27GeI1cf2TGv+aFrgnB7otZbLapL84+J4zudB5MrjhRvOVS/LL5sn8FF+Q42Gt+0WEWGWP6fHhDWzH8YA4kJpbtb2ADNbjt++UXhTV9eKYjwtwtJNPC26O/Z5d14pFyHV7/nxA26py6kmmfyCC7yjLzFIktUIul2A3PEWXBv1BNz8LlavA7gYXEXVPPnIscT14vjsVJE2b2msCqGAZY36gSXC9XfVx5GbONW7BfX7UsuwU5Epqn1iJKf0aeXifg2l5S46Qp48BilOHSSK4NvGd/gth2NYJmJ+ljGzu9rFgceGXZXg3vuCJ/2zykndCPqdXoqmpIAMlXz8v2jmn56kzKGf/5AyG3Cnv8bTMSEiQJRnHbD8FMxrEtU5SAuQRJZCq/H77MPT3JENh6nc2b+KbDLxxjhgA2yBBXDNttO9Q+Etcl9H1DNYwSzQ/O9PSaZox3ixhydALeox+TF5OzA/DZMW3pXiYljOozsHy2q4vXnWk8tE8AUa7jRY+zdA8z1vNYXFjaHqBEABxFMjzAhsMjuMyWEoVR6tswnCILcXqPtnKDeO0olbGrGpt0e62NEk0F2xHW9s1r/q9G6DC8ZP5l1eLCKwl4R/H/pV4hGIeCGb5+2wmZwPCAX+SDemQ6lXPxH87H4uYu2hyPTQ74GPAhlnuPTueOgjbGC08K77IIdrw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR09MB4985.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39840400004)(346002)(396003)(376002)(451199018)(19627405001)(122000001)(478600001)(38100700002)(52536014)(5660300002)(8936002)(86362001)(33656002)(55016003)(38070700005)(9686003)(186003)(26005)(6506007)(66946007)(71200400001)(66476007)(7696005)(8676002)(66446008)(4744005)(66556008)(76116006)(64756008)(2906002)(316002)(41300700001)(6916009)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?V0huAiX2YyueNllmNgqDSvHNcO5SDUGVwMAnyM2bX7Bz8NqhDDdNBaAHYr?=
 =?iso-8859-2?Q?INWBCSd8Yqgzmn+WAofIzQ8M+egGsPDDyTN7EkbOXX7k0BxFYu63CEe3g+?=
 =?iso-8859-2?Q?t4OcgnpV+4TBt1/9VmmY++Y0ZLhfhliThosT20f1A9dp/wFFOKFvLeOpxV?=
 =?iso-8859-2?Q?P7ER3BA7Qn/deILd/sKQeKOOd+ELO6/tWMqzB+R2j265Ur938rG0LTq+kd?=
 =?iso-8859-2?Q?i7zd29MJUZMD/ItPiydEtwg/INPX46sf3/vd0Vi+CSntpUjnXUv7vEcYvB?=
 =?iso-8859-2?Q?LLesaYNyKLyuwpmPXK3IM03pgafwEAtdb2jV1jv7MVUTlSKtB/nSCamL7d?=
 =?iso-8859-2?Q?L+aL5x58awyciPieP2WvwdN4fbyk9U4mUKD4bKQEQ6YZqjRhpxDNAltOwP?=
 =?iso-8859-2?Q?oSQAep20Ze7FA9P1LbIJmHsxFlk6po8t0qwX92/FwJolOSvXcLf7V1Zmxq?=
 =?iso-8859-2?Q?jKj+xKkw/QfvFlENBcVPnLCQHMQAkGduXnMkBsXG0qB497nENXC8u3/QY4?=
 =?iso-8859-2?Q?Fhp/wKvSA4NlhhWUObKg8Z/jwQq3zMY0NrhQXTHPlkgoHLCzzAf+V2lP5D?=
 =?iso-8859-2?Q?4aGc2ZXiVqdUIJJPLDJJrOm1OlQ8zkJTbHWCnbPC939VzMwc19FIclzJ8Z?=
 =?iso-8859-2?Q?23V/jdqDpPK1N/pxU11LIuL4P5DpXNt/1rkmq0kJ8LhxQSJ7OWXHfJfM0o?=
 =?iso-8859-2?Q?64GIdEJhTxfLcZI+7dD65357qmERAZTb14Jf69rsmfr2IWsdEV9FPoECam?=
 =?iso-8859-2?Q?Ytiwa4N+IblHMswYW/IOUJ6MfCXwvPWxqUk0hj9iuhuZ4xV/81iiGOlKYW?=
 =?iso-8859-2?Q?DbkW2mSEhJXjvU6+WCZv96jC9O6uyYOn6KibHi2LP7fggE3P3/+hYhY8nU?=
 =?iso-8859-2?Q?UJi1TYou99yosQRMeh4B8Ki1/Mm9wplu3u+zoQaZENhAhaZTDAkE1VJc6+?=
 =?iso-8859-2?Q?4DWU41XXqQg8B6Ri9KvVhvXjn0XJQpZZKaTPHa5ijhO3CgTbQ18IVyW4sP?=
 =?iso-8859-2?Q?ZvBQDEYxz2SXCJAWkKsN2fID3ApgTbDN4OsNBez6G1g6xHjPke+pvry9/C?=
 =?iso-8859-2?Q?FHgyBKm3ya7kOuytyuUfoadUYJz/u22+lHkIPAI9LbY3+wf8g6PiJyl2JR?=
 =?iso-8859-2?Q?iOznVZfqELtlNKjemmaZgDsdC3zvH11soD6tfgCRi4ZjOPzvf0zAru0ssV?=
 =?iso-8859-2?Q?K3ibJT60gFraWhvhk0WZ1Rk7bNutK33nn7+rBv7hO4Ah4syCdINS6MLOQm?=
 =?iso-8859-2?Q?fFhrpZJbJ5L2y5ykFP10Bxt8ANdkIqFlBOGQVdnf1ag8yhfhse+/Gw5fXe?=
 =?iso-8859-2?Q?4b639z+eAsXvdr9sZGZuDAO97e0yOHBm2tU+U5h9+lzxgXy/1aunWMuwcx?=
 =?iso-8859-2?Q?eXXkO1v+yIJPG+/zidBZkeN5ezZBBvpThEUKql2KUcDblF73p4IXV3wVJE?=
 =?iso-8859-2?Q?lcKJWFljMYOL/C7JcZPb61Bv1D+fJhMFFItMcFGELf+maTYivftwii7wuv?=
 =?iso-8859-2?Q?P4eL/1EwR148FHakz5ZiAjIDBEVlPkpkJOhDzWSxB03ki5ItIbEgmeFxAz?=
 =?iso-8859-2?Q?0xyyvgOsAu782b5vZlg3ROw6L4hC6+sS27nCsApHubg3cN0GZGbjbHMQ6s?=
 =?iso-8859-2?Q?dmCThOrSWeoI0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vm.pl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4985.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52950949-c53a-4487-7f4f-08db1bcd5c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 09:55:03.1475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c853baab-a591-497c-8f38-18f805b1811d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rINIhvUGfw6g/Ro/jrWTqUBJv1NMl56rAUpDu09DPMLMz0SwM3Sxt/EWJ3lVouqhiiBJWpBzyjNLiypq7GhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5317
Content-Language: pl-PL
Content-Type: multipart/alternative;
	boundary="_000_DB9PR09MB4985543FAB59060FA950783994B39DB9PR09MB4985eurp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178052

--_000_DB9PR09MB4985543FAB59060FA950783994B39DB9PR09MB4985eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_250.5.bb
index 7df7bca4cc..9bb42b971f 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -221,7 +221,7 @@ rootlibdir ?=3D "${base_libdir}"
 rootlibexecdir =3D "${rootprefix}/lib"

 EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
-                  -Dnobody-group=3Dnobody \
+                  -Dnobody-group=3Dnogroup \
                   -Drootlibdir=3D${rootlibdir} \
                   -Drootprefix=3D${rootprefix} \
                   -Ddefault-locale=3DC \


--_000_DB9PR09MB4985543FAB59060FA950783994B39DB9PR09MB4985eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_250.5.bb</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<div class=3D"ContentPasted0">index 7df7bca4cc..9bb42b971f 100644</div>
<div class=3D"ContentPasted0">--- a/meta/recipes-core/systemd/systemd_250.5=
.bb</div>
<div class=3D"ContentPasted0">+++ b/meta/recipes-core/systemd/systemd_250.5=
.bb</div>
<div class=3D"ContentPasted0">@@ -221,7 +221,7 @@ rootlibdir ?=3D &quot;${b=
ase_libdir}&quot;</div>
<div class=3D"ContentPasted0">&nbsp;rootlibexecdir =3D &quot;${rootprefix}/=
lib&quot;</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">&nbsp;EXTRA_OEMESON +=3D &quot;-Dnobody-user=
=3Dnobody \</div>
<div class=3D"ContentPasted0">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;-Dnobody-group=3Dnobody \</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;-Dnobody-group=3Dnogroup \</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;-Drootlibdir=3D${rootlibdir} \</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;-Drootprefix=3D${rootprefix} \</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;-Ddefault-locale=3DC \</div>
</div>
<div class=3D"elementToProof">
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB9PR09MB4985543FAB59060FA950783994B39DB9PR09MB4985eurp_--

