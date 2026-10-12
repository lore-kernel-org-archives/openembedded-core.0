Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85921CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:01:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10771.1791802872466048170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=FbL7PVj+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.61, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAfxDzm73WMusK1zf30D1jHuWIIglFvYNsbt9mBJTUwYQZ+ASYkUWohvPl08MUkG03J/p1XXTBncZG4fZGY01J8S+DM5eMUPNxMC8aIsBHu337qu7JNySFuuKnaPN14cT6bm/uVVdD+42XuaNdAHCDB2oegzX9nMj5DE/P06XQB68lXLNVGtBaVEyUpO6fwo4SXyItlMlms3Qjl4XXx6itkmYpNVOhlDBnfs5qeXkZcbXZ0lteXWZ8sRO2dW+3FaDdtzhzSRxl2ynJyHSFPqn8mhtvi6upjdeByFtDokSTKRI6RrCqyrw/6uLeOZebB3Tini4VJY0zUND1iQGdCdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk81kpCPYscRAWIFSu0n2FovNraCqcYGvquzvICEI3s=;
 b=uo25KKxXpystGpjv9O2eAPbEoSyLBiYj6rgqyy7hyDoYbaJ6w7iS8RHk3lKxBz+LUDolPn5LZHhNdMxDIEnGqzUOe29Tj1KiCrU3i/SbcQyXBBWkjVclBimPd2NxLawqs2wmFO0UXaPf9GqtOUZJkLyc2pVm258LgeBHrEvaR9M2X/N8/tFxvhyLZv4eCos4IRkJUbdxIYhOb9lSpxTcdskxbD+QSHmLb06zZRrrahvemVKFPKbKvgDPvSWUHKwKu5TL/ZwfVTneiauEqr4J0rcTy7/rn4UU+AddEjo2ZRXvqFY6lFl7d6sRpMus0uPSim8C+E8byLT6XxyBKWQhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk81kpCPYscRAWIFSu0n2FovNraCqcYGvquzvICEI3s=;
 b=FbL7PVj+3tXhNux+e0JQx19mJ4ilBZgsi+ahp3nXkhgX39dJCmn1HiXkK4la4PhuGqIIpj72LBO7gs7zXbDYuaw4Wd+gpyQimbNqj3UWlMvukKA1obdrwpqKpvWHQdiFdrSe/NeErtOwHk4y4UmxDSh54XoD7tsDMJLxb0LDcrY9kj+gEEq+ObNq/I/uptKVQV7GWwarttCkKJSdIRCYs5G6z1JQWiQHVhXbGQ3e7W5uc746q+AExggYI1bqI1c4Va69smQxlM3IuNZ+ddfFm9Kd1tZPvbAR2JhWCBBnkTHrjvOkeoKq5j7BTfWCsCy+Ue14pcbjTR2Qbq7fbwIUnw==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by MI9PR07MB375903.eurprd07.prod.outlook.com
 (2603:10a6:290:ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:01:07 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:01:07 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH v2] libarchive: fix CVE-2026-15028
Thread-Topic: [scarthgap][PATCH v2] libarchive: fix CVE-2026-15028
Thread-Index: AQHdWjj7VYn/8AL+Hkuzu9ZVGQuWYg==
Date: Mon, 12 Oct 2026 11:01:07 +0000
Message-ID: <20261012110103.11458-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|MI9PR07MB375903:EE_
x-ms-office365-filtering-correlation-id: 5960fc64-aea2-493b-07e0-08df28501e17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|13003099007|261009223027099003|38070700021|11063799006|6133799003|12006099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 
 HPTfRB40PB2N7yOA+puU52f3M25H3pYS+6nNBC1PPsOBX4BxU4T8kJg7ThexMU9u1R/CNCui+bjVPJqED/82v53SmNdsrJ2ao+Dg6WUTX0KKu0wWXbOG03XESFHeMNUOIFSdYKo5DibD5f59y/HSqMLyJNB2IrPyoxE6Hm8+5y60BT4h4wO6wBDxqajAt2UPy7QZvfw2jDUqAeLYl0BZLhGL8v7XVzlqapPEQld/9Ps2dA7vrlHcRNSA5tpYJSNI7cvN0/+p89xrNDrsrAE9IdS0oSVsWjS3F5cTsJhKdrxQZI85wJmtxn4VbEqxmXKsr/uloyi/YAtrrA7Z+PJNeOoqt/388pfcRcJ/PLb0tQLCDeaDIGun2++O4PjYv2fnt3Y+B6XEPAlt/eA60rdKoVhpN4CbsQjxOoGjlEIpliRq66iupsO6DjSY06cSJFh1PkMMrs8nlCzmgZ4WVyH9mrtLElLW1OJJILUy12WDDHTJbM+9spANeEviUB0wFYFz2gDdThew+4D9UTUm8R1zUigjqTlOBdZEWOIjU5CBatYaoYPfBo0mliIr9HOOhxM3vPt/L1Q7/4H/2F8vim1BhbttruXiC/tQIxPA7GeHTKSHrhbjeBMWTm9CKX8RX3r0E+2wwiKH5u9gU5WxgMxBZS56SGG9+rJnQHbV2XNXujQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(13003099007)(261009223027099003)(38070700021)(11063799006)(6133799003)(12006099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Y8dPaFByCVNKfNfPz2+hpwPpqdSX/5eix4YZZxFbRCVwBryb9HLz/ioM7Y?=
 =?iso-8859-1?Q?vYiZT4cmALq6hyD6DHkwh4k91Gh+a01ULeLMbLlwXRY7uLIGNbE7fsUMGg?=
 =?iso-8859-1?Q?CRYTh73VDLVMjnDXtuhjW8aRhClH/bZEVmaM5ru4ktXY2chbjFSigNPziF?=
 =?iso-8859-1?Q?2HNyNHAtgfBwsEQzsB+beeI8eApkBoHLhapMz/QQpadSZ+n5xznQRMk7Tc?=
 =?iso-8859-1?Q?5VgIltIoSVyO6XKSlgJVcJEGCJqQhSjcDmSOvKhfuIQgrvHY377vdEYgnH?=
 =?iso-8859-1?Q?2ospr8ktjxFbrWzNeW5iZCbDkrl3d45Bli33fGWzKgI+8e326+pukEiaEz?=
 =?iso-8859-1?Q?aAcvM4lMmFkF8tvHueyEMLNqD+jZSD0ZDfuQ57m1G0uEbYgnJ0e1b8nWYy?=
 =?iso-8859-1?Q?vfF/QNTyB3HmTSBKhdwrxIIOWkQvAqyDLpdDZ/LTNuCQ1cmEagJfHze/Gq?=
 =?iso-8859-1?Q?aILaw0YNfg02uuOMdKTjL0jjc0LQgp9zXsdPXe1v1QT9eDoP4swayuQtni?=
 =?iso-8859-1?Q?W7M2w9PMDBeiPikgntjeu0AP1E9l5ZGb80IofkU4V1VEj+fguxww/9FEIl?=
 =?iso-8859-1?Q?5lVUQR56qv5tETrV1xMzOvgLyxQdyTpH8ulwu5czcbX8E0fQgqMgQX5jKK?=
 =?iso-8859-1?Q?IGuKlNqxjmkrlZ6BBXQjJAnw9uCK5ZhkBr7JTjVMVmApP58QFIgbO7+pcn?=
 =?iso-8859-1?Q?D3Q5Oq04FhNuACVltzhxNWGtOybBojj3rmA0Vrd+Bkaph6okSOWNnEWwNc?=
 =?iso-8859-1?Q?4eMHWQLSEmgwlUx99cTmP9INx2gQgpt+C/GS9bxXcd9A3GY1VqRH2aAYvK?=
 =?iso-8859-1?Q?FzokZN6c3ScjSiZcwQK5u8P9kWv+AfcTa4GW0qVKu/l5IJef/J5X8I87X6?=
 =?iso-8859-1?Q?tCErFKk404bcQuV8JZ0mlkil4HVRi3ODjqjwqsw87QdAtRnQ7ne7SpKoKL?=
 =?iso-8859-1?Q?RgpP3xIlgfc10f96xCuc4DWJhABGa2HgkAmFGWoQ8KRrtguqwXPiY0Byjg?=
 =?iso-8859-1?Q?DGTdcVOz5Kb6MnO8WsQfOqq6nelC0hSWKaeTfOdsfIx0tLN1TAekOjZR2u?=
 =?iso-8859-1?Q?6P8dgiMwpeuGdezIEUEnnpUf7Ffb1l900O/F6c4Ae5kDW2UHCfnuCZ1oqa?=
 =?iso-8859-1?Q?hn54vwLfeoeq3NG/+jQ2b0ynjf6PH39iJZvhCnMhbPXg+JwKsigwnHgDjb?=
 =?iso-8859-1?Q?pgkt7n6baA1t3WYE025GdY5hpt6szcwqi6Tb2atp12qg+Jo72IEOT31w2b?=
 =?iso-8859-1?Q?5jrIQrFgiJfauJvNNuiJ5a/RNc8l5Igi0EMNxKSxgOEHKqo89Ml9xY36eQ?=
 =?iso-8859-1?Q?OPBvmW8E3s7Bc0N+KXPz0U9mb26XAiTi4eRsdpDyy07z0pl7FzrP1kccBB?=
 =?iso-8859-1?Q?ajUWjIetA/Obdbge64OJ5padvgm7FUrYEVWNtub14he5SLs9U36uI/fWyu?=
 =?iso-8859-1?Q?64PJX8BIOv8IQrycHavhTClwFgpscaV5Snz5SzMbMmsol2tGTpfI+3OiFg?=
 =?iso-8859-1?Q?rnOivBVuekQsTT3RyBedES2KHXVIP57wqYWAO0hWimgL6YC5Q6CrGEJ24d?=
 =?iso-8859-1?Q?Ilg87bBgBHN3PkeW5ofg3aWjeDDepEXYpaqwLHZVxB+N5VsjufYbxOAP6W?=
 =?iso-8859-1?Q?7vnBVLjt4xQC4OIHS6Q9ShiRX7KxTP1sX/6VdPsMGS9CS4+DmJqgYLSyba?=
 =?iso-8859-1?Q?8Mn4fUFSeNLyOmdRjmrBjkVL6S+xFkX0X4GCJotNlXt8zWhMOU19DTQ4ZG?=
 =?iso-8859-1?Q?ECNd/YGVt5kNhdgFlBZmJStNC488OnEvNyEyrPrUbvUNRpR4yYysThmYI+?=
 =?iso-8859-1?Q?0N3wz/e4og=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5960fc64-aea2-493b-07e0-08df28501e17
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 11:01:07.6612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2bYmZrsf9P42JRwrRhLJtfCKZ3XphECw3kTcQQTRv70DhIHMir2JnXx1gdyLAsnQNoN+SCaQXkcqbriOLgz/PuFUgKyANxmq/X9/0BpwlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR07MB375903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247634

Backport patch to fix CVE-2026-15028.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-15028=0A=
=0A=
The link in NVD is wrong. Based on project own pull request:=0A=
  https://github.com/libarchive/libarchive/pull/3252=0A=
=0A=
Fixing commit is the below one:=0A=
  https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d5570=
2785f82cedb7ef2=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++=0A=
 .../libarchive/libarchive_3.7.9.bb            |  1 +=0A=
 2 files changed, 42 insertions(+)=0A=
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15=
028.patch=0A=
=0A=
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch=0A=
new file mode 100644=0A=
index 0000000000..c63fcf22f2=0A=
--- /dev/null=0A=
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch=0A=
@@ -0,0 +1,41 @@=0A=
+From 40b92de1def08e4fc319d55702785f82cedb7ef2 Mon Sep 17 00:00:00 2001=0A=
+From: datauwu <datauwu@users.noreply.github.com>=0A=
+Date: Mon, 6 Jul 2026 21:51:15 +0800=0A=
+Subject: [PATCH] tar: fix 1-byte OOB read in SUN.holesdata parsing=0A=
+=0A=
+header_pax_extension() passes PAX attribute values without the trailing=0A=
+newline to pax_attribute(). The SUN.holesdata parser read one byte past=0A=
+the supplied value when the last numeric field ended at the value=0A=
+boundary.=0A=
+=0A=
+Handle length =3D=3D 0 before checking *e.=0A=
+=0A=
+CVE: CVE-2026-15028=0A=
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/40b92de1def08e4fc319d55702785f82cedb7ef2]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ libarchive/archive_read_support_format_tar.c | 11 ++++-------=0A=
+ 1 file changed, 4 insertions(+), 7 deletions(-)=0A=
+=0A=
+diff --git a/libarchive/archive_read_support_format_tar.c b/libarchive/arc=
hive_read_support_format_tar.c=0A=
+index e07cfdb63b..1c0441db6c 100644=0A=
+--- a/libarchive/archive_read_support_format_tar.c=0A=
++++ b/libarchive/archive_read_support_format_tar.c=0A=
+@@ -3448,13 +3448,10 @@ pax_attribute_SUN_holesdata(struct archive_read *a=
, struct tar *tar,=0A=
+ 				return (ARCHIVE_FATAL);=0A=
+ 			tar->sparse_last->hole =3D hole;=0A=
+ 		}=0A=
+-		if (length =3D=3D 0 || *e =3D=3D '\n') {=0A=
+-			if (length =3D=3D 0 && *e =3D=3D '\n') {=0A=
+-				return (ARCHIVE_OK);=0A=
+-			} else {=0A=
+-				return (ARCHIVE_WARN);=0A=
+-			}=0A=
+-		}=0A=
++		if (length =3D=3D 0)=0A=
++			return (ARCHIVE_OK);=0A=
++		if (*e =3D=3D '\n')=0A=
++			return (ARCHIVE_WARN);=0A=
+ 		p =3D e + 1;=0A=
+ 		length--;=0A=
+ 		hole =3D hole =3D=3D 0;=0A=
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb=0A=
index 2eb22e2d61..3719965eed 100644=0A=
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb=0A=
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb=0A=
@@ -51,6 +51,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \=0A=
            file://CVE-2026-4424-2.patch \=0A=
            file://CVE-2026-5121-02.patch \=0A=
            file://CVE-2026-5745.patch \=0A=
+           file://CVE-2026-15028.patch \=0A=
            "=0A=
 UPSTREAM_CHECK_URI =3D "http://libarchive.org/"=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=

