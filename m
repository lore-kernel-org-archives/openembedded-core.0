Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754A5F9EDD5
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:43:49 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82859.1776865266123263954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ayzp+Gb8;
 spf=pass (domain: est.tech, ip: 52.101.84.29, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R90INu4iUm+4og7B6x9iOPoQWdeqH3+kZA5sbFAmXmpcEcy062Xx9b5hYIQq6Jvsgh9yX2lF0jrXDdNovq4SMn0j0fU5//36fQFoHKVFxUt9w+c4I0LdtObyh/mAywOiUiKp3J84yz21CjAppnn44Y3l+TTuuom4SEAl7U7BgAtU7xMPh2r8DR811OTAtOB4gbuFY1GLIUOKZwdzUwZg/FmzexqPy98y4TBZCRf0vi5zELYjPWXIay7loWQKE/OAaM3fv20JTSxWdNeELtHRkLdZEtXRg/ixjywrMuWgYqpznNdRcDDSe9Vs7JIAQChuY5gdRYx+DUn2tmEIqPsGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wztnPNA6kt5WRdai4va8EHX2L8j4/3mESmBMZlQz0lE=;
 b=SDUKUkmeZeRxyacWkE0csDw+yEuZYNt+DBh0KDIm4z5wsBwFuR/kChezms8PDSYi15iMahGxkIfaNMdnZY/rwlRVcH9dh9GTOVWCXDtA8jVUFNdrwTYXxe9VpVxcqCPcU1pzGcWbM/nHQa7/b17mKQM8tRpAskhapWYBq79xLuY/Ep0Xqr7CtqStkoxTP3S+CRTpKy8EEUU00gRdEoMuBHJ1peiqQj2TqQyvB3NsMFXSDF6/q3P83FxDYf77louLKVl6oaEx5/d/q+6eVbfY+f6Sg/cBf/1ADbSYcT8vJ0JndN0y0KbCcDed1bzZLMPR2WmW+CVs89LbkVdCQLEmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wztnPNA6kt5WRdai4va8EHX2L8j4/3mESmBMZlQz0lE=;
 b=ayzp+Gb82l+Nqxm94s9bWr63TGPMYA2XbQdtuKY84ApJkEtAyZSq6BfF0uqIhCJ7aMCV9aZiblt/41BBLhHbZh64mX16cF40vT0z5Yigx9ORji4gpgWhB7EmE4RnlKMZjh5vqlS5OJ5Uc3tCbXPryxx4hPUXNpIIkDbNmbIODaCO0PoYbIihHR3WS/JVf7Jy8TDL0NQKIKEgbw3AhS6QgpK9ClWyYvLGF0pOmksbeyTT0KB8Sphwsvh82MNntAdgzmxujIBVCrNXawACJDov7rQwMAXm4aoqamUpPScJfD54EHMFXvL1GMrDu8mZ09dKmO5hnTijWg0Oa3tEpJH/Eg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GVXP189MB3387.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 13:41:00 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:41:00 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 3/4] binutils: fix CVE-2025-69649
Thread-Topic: [OE-core][scarthgap][PATCH 3/4] binutils: fix CVE-2025-69649
Thread-Index: AQHc0lh9l0ZcLojaME6p1K0fFsEwIrXrFDKx
Date: Wed, 22 Apr 2026 13:41:00 +0000
Message-ID: 
 <AS8P189MB167235D33D9618A5E6294A6BB32D2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422130358.386475-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422130358.386475-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|GVXP189MB3387:EE_
x-ms-office365-filtering-correlation-id: b76b20ae-5c40-49d8-ffd4-08dea074ca19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 YhVsdONaTP5HBvv7k6sgfl73lgepac3vdaXiU6QI0aZ/yOYnHSakBKujfpmkWL6+MeAO0bBa/tDkNz3HV+MKTPvAnqVlWMN02dQBhZUpljxRetRBeZ4ZYXIyKJj1dsIoG3gKTTXHuijVwnz9o5yl93AdxT+syfHOm3bq/FOLebx6UWcdv1uO7QMNBjJjnSJGr1NwT9rxuOrHTQV6XVIFBJp14MrLs208QjtIy8frKo9oJ5MjqHD8nTr2J6GOIlnYphhqO45kpd4jZxtOSd/U9Rc7tLuuWOg2MNbMogJyDq9IfaGVnrPdpg6o6+F55LbV5nt8tuxrgJe2PzSsN+V1KrTdYTltshm+gqYyblMTTWVq4g7EUHRa0BYYO2k/x0dSDk3fHhxe/J96iOj9Nr1x2Fo+UiULCScUReLFZYzQ6FOn3xYNPMfu1PijyzKPf1dB7i/rqyOmcUfJ+tHyCN2BXxegdh8X9eQs25n7fB3zTvBxAs78RObRj8DVoj7sRaXsooQ8F/b1IsKoVZQ2rPGEBn5KCSfLbC93QP+FAC/TjvFS7/fKA9FczosFgCY52X4Krci9l5He8Rqql6WyetwO0Bd09WIzyM9qswVQi+/jQgvL708n2/a5FxkvIj7V5aJhO3sLKMv0ZLvoIeq4FJHX+0bXXHBQqdMng1RbcrS1a+hupxReOAAsLetc6+BUzN3HqWNRIIqa3Y4DLiN08qF+Njmf/dmdiUds1ycS+hjXv/LlCVB1sDVKgacUGANBXoV7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CGz070LVXQxmysoGRt93u6NeoVctGPiRrbWI2eXLSAJmSWNH8gelTDtvZk?=
 =?iso-8859-1?Q?GiF2/IcRiVhXVwhXtSQd2h9+p+nN8Amk1BK2/bRpH/AjO2yQEGu0PTXXIb?=
 =?iso-8859-1?Q?fcfZT3pKYYgdQF5YZ9ZWnGoGguPtCEkcGBeuVE2XLApPRGlOqoEE9X1Nt/?=
 =?iso-8859-1?Q?Kb9oawopRTGrwhE2THAFrGSjyd13EPc+XrreEx8/NLT4q15STZPdWzSSKd?=
 =?iso-8859-1?Q?SWKq7aBFaOTl6vcuYpM/N4F40awIopA+mMU2mXwxIRx4RU1pXMacOXoj3j?=
 =?iso-8859-1?Q?q6fu3sNyU5SYP2Pyt5q3Am2Q7T4shySj4p+Xb2UQ+Z5lR/AxAGLerg8MXz?=
 =?iso-8859-1?Q?XId1h4f2HuzPzRl8Xv6doyD+jWVRQ864hNTh8+a6Baf/Le63ZHiXrgfsIN?=
 =?iso-8859-1?Q?MEkHolR3rYEWOc3qU+J/pxr9cb52/8jtQOAMr20JR7KFbKjmVvWOb/TjyY?=
 =?iso-8859-1?Q?YzBl6F5leeiodmds4HmDxMhAXO3wp+FgRBCqyR1lQxpUET/RLTcEiPhAtL?=
 =?iso-8859-1?Q?cyrXs/Ij1X/eIbZp0nKuaKALSMVqS0IiRXw1e3bWignEfHzsPd84C04AkQ?=
 =?iso-8859-1?Q?BzmwT57iblGVfFPnYWSV9vvwYmj2V0ozMxs6JKDiOfWfdZZ7kdbba39yFJ?=
 =?iso-8859-1?Q?UumMFF/wLFUz36rDo7oBWmrrLl1jELH3tdHvEZmH+vX3XZ0gg+m4394IsK?=
 =?iso-8859-1?Q?Cdny80wcyEp0T6RKwu/Doo1W4uxbM6EUXoOCQ6O+Q6dvTgWAfPenEINOWR?=
 =?iso-8859-1?Q?qaP+PgYpzXx+9/kheq4E7YTI9lbjQnrvRBeweakMp8HKvvTslphmJGBWYJ?=
 =?iso-8859-1?Q?HXPgmkR41g/i1f+44a/Twq0eT+orFdwLjB9pM6oFyHnzCvHfknOUlr4wgX?=
 =?iso-8859-1?Q?rTYRdIHsCfXlX46iBTd2rs0cFuqKqDkX+obEgWfpWENS8aIc9Ia1tUkKdW?=
 =?iso-8859-1?Q?aTYKwAf1FuCc6q5PQqk/A/8XRLS2gz8TBvcQxn6x7lL8eJcv2i9zwPyMDY?=
 =?iso-8859-1?Q?KTtaX8EDmMv9Em2YEns8krReK9x1rD1qr4emGBiJ+Uy7e/CPqxy1jMnoSZ?=
 =?iso-8859-1?Q?WIA603bYtlBFYcLKy8KdSA2G4qBemD35Nq8dF99HjL9c7tlG15d9IPuVKX?=
 =?iso-8859-1?Q?r/4FSZG2NfW6XxEtb+3WObpo/XoqwLJ6qFe2xCls1mTcFvn2zQtq1tmSch?=
 =?iso-8859-1?Q?V3neGSmJ/p7eGgb61LHZfVWjjctFKOvu9fXsmwmqQAdwcMZmGWZvlkMXKS?=
 =?iso-8859-1?Q?zCmGg0VyIDBN+3dDJTsDTgiTPZPSBw3AjkOxBQ8KkGg7/z7+w/kQ5RRh4/?=
 =?iso-8859-1?Q?mRKX3hR+PlGR9sGk3kGfOWJcoNQA1fXExC4XlyU+4icFhFNvtH2Ll2NnQ9?=
 =?iso-8859-1?Q?fx9+YqkVYWjRRJigzKLxksn/IatqWxfy6Q8g56s8ZExmr6Llq9zSImVj22?=
 =?iso-8859-1?Q?i2bDXOvMhATg2lL5730Tp04xG/auGpSOL1YmSWaKhjWvUd9qXAZzyJWnvJ?=
 =?iso-8859-1?Q?iKVPOUbGjab9BzmVxnNYgpA73vQDV0WRasmrIWkSSJUjFuezWZ+dWmsAF1?=
 =?iso-8859-1?Q?aj8WZ5pkeWCQvmPD544QDxygzqLHD7fQR+566tjr8zWSP7pAJVP1ZP8Eca?=
 =?iso-8859-1?Q?i+M18n/1lgJzEGzgWEPAsmfSM9GQsuo4LpPdKcySqP81Gg4HdnZuj8mlA3?=
 =?iso-8859-1?Q?ccNr+NT6SZl/myNBdKjvPS0QIzCVwSl8VxN2stok0DsxED7REMW7TUQnkT?=
 =?iso-8859-1?Q?qcNkOcM/T3V9n7ThRUsN7ez6oH20MmjfakVhERYgllH3/iI3DPT/K/2ZzN?=
 =?iso-8859-1?Q?J/ybtP9gAR02EXRkLmbKgpw8uC9p7ow=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b76b20ae-5c40-49d8-ffd4-08dea074ca19
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 13:41:00.0344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAmPa3pG6nn888WJk9STYo1TGS3GE2/VBi7zY1djWBGaICirX+mLnoXc1IBzTAaVIqmNP4SkPgoNUtmpYyYf5FjKZsjpERFIIsYCujP/lUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3387
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB167235D33D9618A5E6294A6BB32D2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235725

--_000_AS8P189MB167235D33D9618A5E6294A6BB32D2AS8P189MB1672EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
Please drop this patch, this doesn't apply for binutils 2.42

Thanks!
Adarsh
________________________________
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Sent: Wednesday, April 22, 2026 15:03
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 3/4] binutils: fix CVE-2025-69649

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69649 [1].

[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D66a3492c=
e68e1ae45b2489bd9a815c39ea5d7f66

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69649.patch    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 6c1f9dc870..8a92807f30 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -73,5 +73,6 @@ SRC_URI =3D "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69649.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..bf27987625
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,42 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+       PR 33697
+       * readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found =3D false;
+
+-      for (i =3D 0, section =3D filedata->section_headers;
+-         i < filedata->file_header.e_shnum;
+-         i++, section++)
+-      {
++      section =3D filedata->section_headers;
++      if (section !=3D NULL)
++      for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++)
+          if (display_relocations (section, filedata))
+            found =3D true;
+-      }
+
+       if (! found)
+        {
+--
+2.35.6
+
--
2.34.1


--_000_AS8P189MB167235D33D9618A5E6294A6BB32D2AS8P189MB1672EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please drop this patch, this doesn't apply for binutils 2.42</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Adarsh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tec=
h&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, April 22, 2026 15:03<br>
<b>To:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
<b>Subject:</b>&nbsp;[OE-core][scarthgap][PATCH 3/4] binutils: fix CVE-2025=
-69649</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">From: Adarsh Jagadish Kamini &lt;adarsh.jag=
adish.kamini@est.tech&gt;<br>
<br>
Backport upstream fix for CVE-2025-69649 [1].<br>
<br>
[1] <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=
=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66" data-auth=3D"NotApplicable" id=
=3D"OWAff4b33ae-3b5b-b69a-3c63-898a2d9b80e2" class=3D"OWAAutoLink">
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D66a3492ce68e=
1ae45b2489bd9a815c39ea5d7f66</a><br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br>
---<br>
&nbsp;.../binutils/binutils-2.42.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;.../binutils/binutils/CVE-2025-69649.patch&nbsp;&nbsp;&nbsp; | 42 +++=
++++++++++++++++<br>
&nbsp;2 files changed, 43 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6=
9649.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc<br>
index 6c1f9dc870..8a92807f30 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
@@ -73,5 +73,6 @@ SRC_URI =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0030-CVE-2025-11840.patch"=
 data-auth=3D"NotApplicable" id=3D"OWA38757733-87c0-bbe5-4c06-280de5b89f4e"=
 class=3D"OWAAutoLink">
file://0030-CVE-2025-11840.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69647.patch" data=
-auth=3D"NotApplicable" id=3D"OWA4eb4abaa-9f9e-6b68-f6c3-b3fdc9a90b03" clas=
s=3D"OWAAutoLink">
file://CVE-2025-69647.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69648.patch" data=
-auth=3D"NotApplicable" id=3D"OWAdb0ee430-164a-98b3-b9e6-522814ca2d48" clas=
s=3D"OWAAutoLink">
file://CVE-2025-69648.patch</a>&nbsp;\<br>
+&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69649.patch" data-auth=
=3D"NotApplicable" id=3D"OWAe1ae0711-6a63-ac05-c029-efbc74467c4c" class=3D"=
OWAAutoLink">
file://CVE-2025-69649.patch</a>&nbsp;\<br>
&nbsp;&quot;<br>
&nbsp;S&nbsp; =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch<br>
new file mode 100644<br>
index 0000000000..bf27987625<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch<br>
@@ -0,0 +1,42 @@<br>
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001<br>
+From: Alan Modra &lt;amodra@gmail.com&gt;<br>
+Date: Mon, 8 Dec 2025 15:58:33 +1030<br>
+Subject: [PATCH] PR 33697, fuzzer segfault<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR 33697<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * readelf.c (process_relocs): Don't s=
egfault on no sections.<br>
+<br>
+CVE: CVE-2025-69649<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/gitweb.cg=
i?p=3Dbinutils-gdb.git;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66" data-a=
uth=3D"NotApplicable" id=3D"OWA8c62964a-f829-383d-6255-c9ab7c1c21b0" class=
=3D"OWAAutoLink">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git=
;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66</a>]<br>
+<br>
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)<br>
+Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
+Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
+---<br>
+ binutils/readelf.c | 8 +++-----<br>
+ 1 file changed, 3 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/binutils/readelf.c b/binutils/readelf.c<br>
+index 8f188e8c3e2..8d28b1c30e4 100644<br>
+--- a/binutils/readelf.c<br>
++++ b/binutils/readelf.c<br>
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool found =3D false;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, section =3D filedata-&gt;sec=
tion_headers;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i &lt; filedata-&gt;file=
_header.e_shnum;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i++, section++)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; section =3D filedata-&gt;section_headers;<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (section !=3D NULL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; filedata-&gt;file_hea=
der.e_shnum; i++, section++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (display_relocat=
ions (section, filedata))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found =
=3D true;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! found)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+--<br>
+2.35.6<br>
+<br>
--<br>
2.34.1<br>
<br>
</div>
</body>
</html>

--_000_AS8P189MB167235D33D9618A5E6294A6BB32D2AS8P189MB1672EURP_--

