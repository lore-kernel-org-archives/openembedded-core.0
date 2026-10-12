Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10C6CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:00:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10907.1791802848104261225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=kw1D1MOo;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.69.67, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSW1d0xiyt95VgxvR2HlSlnKRahoaF85fotHArVEBSMAIUDDe97VOXRKaoNBdPsG3fzqvyJQEUYLsHRIvboL8Cf68KzhwmW01dRwf8DUGHbv4cSSqdL7z+QaiAEowCo2AFAyC060OtTlXrrpToHSNiXLVAE8aEhx9bKyOx01dBCEhd5qOLVAna159lh4T0vhaGtbgdeIZBa7ze9cKEX+Moa/ZfBgLYbz2FrykGBqX7y4exVWOhyDLQuGOln0gg1WzlSfVJKM/nnSgCEOsBAufi5abDCFo251WPdsVIdb9joqFn75hhSRQ7sg502YB1ZNhUJmcgScHHo8rf2vo/vLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgjqhY/y9KcMolxcdf9TxpwNWBFngWfAPqj8+TLyJWw=;
 b=G0GJZcjx7Xfg8rbcXVrjPZJ3bUW7+vIVdy2GlPog3/09PVG39CkuLoNPrdHxnehAfxHJhFWIwI92Ky5f4+LYOt4VLDgfn36+7n9B8VHxThkW3MyrSjnb9ctDSjn8rZYGRmknw/mimDoka4GgAAEjkrdbtGXtDRfqDfCPqvDwEoSp1AaWoQGKlYjwFgJJ+SzJlLsDXO5/auT7ZAnPa2JqOzbsE20yGraI5D4zVVtqcamn2TdACGufWERXNRFNEHw5u4lEkUrJw6CdY5/zvJtVnTh0eSa0fdbONdl1GbMZXd9WddhTHk6r4MifthwmG9Fh3opD/q8zEwRFt65agqVKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgjqhY/y9KcMolxcdf9TxpwNWBFngWfAPqj8+TLyJWw=;
 b=kw1D1MOoTFMwj95vjfC46SpYPj6C+wncQ4MTbq9s6eQd4laGoUaennNGPY6hHPuB0eXTNjiSkY3w+vMY5iVgY2NMtbbWBdFCm/i6Z5vq4Uqj/Nd8rpnArExhYBeDK0/n9UnRRSLBkhbQ8U5g3rrXECPCYcruV1Mlpker5DUDkyPiqTujL2zEj3UvAxVJRsWyc//qHiwnlrPGvPGppySdihDHr8sncQfZM28yOSIWEueiBiwR+mwl+QzgMBjek7HYdIBxIvMGIsFwey3+Jn4d2XWk3SGbd89IZaQ22H2sjXYs336Ah3d9jvz34TAJknPkaS2uMWy+FHvkFtcuq1MGcw==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by MI9PR07MB375903.eurprd07.prod.outlook.com
 (2603:10a6:290:ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:00:45 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:00:45 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH v2] libarchive: fix CVE-2026-15028
Thread-Topic: [wrynose][PATCH v2] libarchive: fix CVE-2026-15028
Thread-Index: AQHdWjjuUXq5SI1yQUOa3FsvUPUiHQ==
Date: Mon, 12 Oct 2026 11:00:45 +0000
Message-ID: <20261012110033.11294-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|MI9PR07MB375903:EE_
x-ms-office365-filtering-correlation-id: 07fe71ba-d6d4-43a8-8b9f-08df285010b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|13003099007|261009223027099003|38070700021|11063799006|6133799003|12006099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 
 CCHD04elXyZPLCfSiZ9GHh9MBNc/LLURQrgt5tyix6e6VH00MQu4vha5SxS5XdRh9r9JJtZfom2Z3IN2SbF9/FQRDiwKRKG8hglE6AAbM4oc8IfL/XiQrFOMYZG+tQGZx+frgQ2WGn4AoIpDGM2POfTruoAYcgzwz8hLAZXaozUiTogKMiwuWMOkRvYSVydaT/24l4/w7CFx/c43QOLIp9FnAhuqw2HuBlFnJ9F2Zl8kupQ9q0UksscKDiCnQ3qhtm3rvTGVKrnsJNB533u+0EobxHFL7ftCGYXKBxgAvNsb/H1Y/ILJFVALYVZ7SpmHHuOy3qcsipuWpKRxsAb/Pu08Y6z3gJwkCaz698LsJ/UNivneQpXrcaBlOxXSzJWeKlNv90OZcLSrFpPfH2JEWCYYmLa+QUUyGx6YTNPHp/awZA+yQUJoci3+qCnSx/Ri6dwNRYTep+BP8RrCqisxhM7Ax0dypf/AVU8nuKcikDCKw2xmqwdhOTNdPI9EmO1pc+biP+yTLVi161tPnzmSUBqV3/SrupNPIrFG1KP20mzp4OBQ2ARcwoEij3Hlb5Fg8VouEispRWz/1yliD6M0vwplY6r0tnwfkaGwnR8DHVcXD7c3YT71bvMcro592RWXUBLc6QzELBqnJ3AVfOjV/BtoRv0E0emxiJtLuxMq0H8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(13003099007)(261009223027099003)(38070700021)(11063799006)(6133799003)(12006099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tRBKGybAq6/QQPIrCGihUSctNA30exYuhBiA6aAcZlos1WSjzzEwfrVCJW?=
 =?iso-8859-1?Q?yNcaHSNuVZX23ySsV/+9loW12/B8ao9AmCdJ7gPEFCbmeY1/vNlDN82mur?=
 =?iso-8859-1?Q?AiKN696F4/x4JcKGEuaaksMzp5gMprp63DYFrsEmvZU69kSRJLcMOOwVr8?=
 =?iso-8859-1?Q?F5lQ93CwByzngLH8OMf0tMjZOqcnrJ1ENHmB9xN9/dPn6p9iWMoeeaSChP?=
 =?iso-8859-1?Q?69KFHf8sIRTaw5DQmkVeAbC8dc+srXtCMrFK6JKMh2vA2PR4HKrkQRWw35?=
 =?iso-8859-1?Q?wDNE2rZheBXi2Sj5FPSqkka3thVrjgCyK1f/C0EvNHcl3GitEcJ0sS70ds?=
 =?iso-8859-1?Q?ft4X1PdomH5a5/ZaeMZjTxYBFJFa3hkg4LkqDKjYid1273cV29Z7GOW88m?=
 =?iso-8859-1?Q?u1r10rFgdDfok5oiKr8JwmJamIPfLjVuS+USwcw+p2/wk4f7aErYu+tZDP?=
 =?iso-8859-1?Q?hqUXSNg3UqxgvSXZe4ZP1Bw/chbW9nU5a5fqJ6zebt67m3NeL5KLpGNfSQ?=
 =?iso-8859-1?Q?LtZmLa/hJi4+/jpbql4RcFFe3husc5Y8mteUet9U29O5rMR00bMstplEX7?=
 =?iso-8859-1?Q?0rORm96slcbeWIQ/qSLNr3w6R4omzByG5ekNzTdCT7UKrQVEmdy5AVj+8l?=
 =?iso-8859-1?Q?83GUbTdgqeqAVqbOq9a8ue14C3n9MKAn+RysMvERVTcoDgU4Zlgn737wap?=
 =?iso-8859-1?Q?VxapaZ9lfa7NppkQ7s/K30bi5h/xOVVpsXswFPyzrsumk0+gZrh7IQ1CSh?=
 =?iso-8859-1?Q?XUDpadJ6q16WikeZNByVlrPty3bcUL0Y/+rKitzFSX6KPr3nlyOLjvESku?=
 =?iso-8859-1?Q?VuyxEZufRpB0m6SIBxpVrKl1MGjlB4jprSLwwabQKb0Yr6UVLIsv2I8y1Y?=
 =?iso-8859-1?Q?2giE+BsS2yZp7Uu1xZYEfQpaDMtpFdS2RG2I5mXMWgqUnIKT+NZddUj6wg?=
 =?iso-8859-1?Q?w2NxIXwpjpeuWtnY+57ES2P7bpE4VeMLIG+vXsTnBNCBaho7zs6v8O0OZ1?=
 =?iso-8859-1?Q?dnyUJEW7fZQmxPGNgMSmo7VDXfMZ5DcILWJj68RMQW6BXnvkzvEwEgMmG7?=
 =?iso-8859-1?Q?ioS+1p4ZhgvBCYVV67p5cw6wHXdQ52GMyALm97fKT7NRn+WKWNvQjL9Ysu?=
 =?iso-8859-1?Q?a2IDuSk0h0JQEu5wz4DxGM6mli11t1amvB0JmdV6YQXwMrXTTTirZeRkHP?=
 =?iso-8859-1?Q?hd7V7V2aTnFA7xeRqdjNORGfA0En19PtIS63AT6lu17H8d3kesJSmkLsND?=
 =?iso-8859-1?Q?9LHAR/Zfh8XiomWVXK3I0E801IZcZbSjs3SvDVp1esRTgx9knKMd7mnYYW?=
 =?iso-8859-1?Q?lSVAxQ7OSffwMeS4xcz6esIl/9338nifqgZOKzOoC5sphBDl3nWwPYvRbC?=
 =?iso-8859-1?Q?lx/lAKgVa2Q5W1QlfkfQ+4Gpr4N6ennngvE7xn2nQHUxXKRzPP8XNZejjK?=
 =?iso-8859-1?Q?ipC06BSbhJlGLJqtOyl6oH36us3ek9PPQVHhDXYr+BEQsJZN2vGOntEZ2D?=
 =?iso-8859-1?Q?hLZJEGGorkON+GqmxKOM74bbJn6NC0dHIUAn4jDigL8hvykL43WVmlD2lu?=
 =?iso-8859-1?Q?G475BKcMliLN3n5Qh9s6G5WQWP7Wz+MUH0A0WJmUdeL33uyyAwfYLrH3PY?=
 =?iso-8859-1?Q?Zp1mpg7YW8mYuVH4JvUkMGrxIpCuTaibFRzHUPI6nuBY7Pio8v8uzvPL1j?=
 =?iso-8859-1?Q?VIpQn9f/W9cfLj4zk6erG5BBgA9bQRTcv8/Vki0f9/yUlNzmeOIOolTWhL?=
 =?iso-8859-1?Q?yrFBQ6kYr5SiKDF8CnulJ07bOKIRb3NpXSEvi5hfJ6hANk6UHMhZGqiJn6?=
 =?iso-8859-1?Q?Mp5Ydax04A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fe71ba-d6d4-43a8-8b9f-08df285010b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 11:00:45.2658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZQ9KPwhGwVHVRWF4qUZ1JnXegswK0bYjcQOSGu/PThdtlR0RS2YFKR/FWaoWwRS2gEWo+cJ9iFkM7vFmoM1uShz3T/j0Vil6c7Cgi9DoPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR07MB375903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247633

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
 .../libarchive/libarchive_3.8.7.bb            |  1 +=0A=
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.7.bb=0A=
index afc06f85d4..d4cd0b5b01 100644=0A=
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb=0A=
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb=0A=
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"=0A=
 =0A=
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \=0A=
            file://run-ptest \=0A=
+           file://CVE-2026-15028.patch \=0A=
           "=0A=
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=

