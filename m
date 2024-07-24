Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5728DC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 20:40:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.20881.1721853599869077597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 13:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K+4Uv2rA;
 spf=pass (domain: siemens.com, ip: 40.107.22.80, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emL8b23CCcgAx7HiJatqVtqQD0NT6aPSJCyk3TI6hHGNSfCpqnpfBgk/9+jXyv5CDUsOJqRVgvMSehy8g4PUBjYR8lDMdrJgCjWR5aSB5IXr06it8U9yxj6qxrIUsVTOFojjjV0eJjU+SxoGq8WfP21wYy1ULx3+9DmgmwzJqdYp2VWq1zzHHFtaFlpd6WggbT7cKbRN3SnmnFV8XKRgAGhuN7pK+JwN45bwJB7l85obOwcVnI6vutb8KzmEVHQKhQkiqgcUyNU635HLQl0NRjFqNASkTc86B9+p4nZ6DLDAJaUgCdh3D3rmBInnlv9vXPFBzRAXDzSiiisY0ev93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jj4rV9ZlokQwsbM8kC17bpLOJxMBGr/yDKe+6jDHkU=;
 b=lAT+/1vkTL6uVYBbBh+gQt0CeHfa4Ean8dDATiBqLV2DzTIpn0ATvcHbPlDt75j/GwHYSfKJ9UavZn4l+JpOnmOelyeDsskBuOJanvWTDoP7PkS2LxPVpOFIiH7woWrHUcS2ZDDXr/+7+vEfpAKOk1hrFq8BQaCFc96xxJZYflEYPtkeP694b9UqfB6PXegSkzOYla7HPlYA0R5hlAy2xVx16+0PwRVWgN+7A6nv0IniXtgs8MnCFcrNVogpXFwKhFjV1+YMQmoATPC/JAdngb77dCTAfUHHnXt4OuQeeARVrgKURQ/Ye8g9LUGPBhvnbvlpoZqqsxaAYB5PkiWujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jj4rV9ZlokQwsbM8kC17bpLOJxMBGr/yDKe+6jDHkU=;
 b=K+4Uv2rA4kTelFi6/IhqCqrOqkzU2zg9gwcaHFSRmryb6GxPjwiCcH4BqatChTC6rvtRfe10zX0G7Lt4SIbhAploVzC5ym4Dhs30z7EX8TInJZXzlcotqHv46e0R3xWjyYlSfZxEQf1nxk/g/34ubfPp55FIr/fQrORYz2cW8EGU2zWGifzFZZ9T2lvJgtAnRfvXVIRnrAB+ZBW8daFGvzqv+6S2MzOhxXGYZH2/bMYDuW3giNAbY+EME0RCPdKoMNVfOyWJWJeEPulHNsOXUm8BiqPBHfC9HQB2Vp/LXm5HmyNmBPz/Ctk7Ls5JxXMHLFnQLKUOdIqxLB254JNlng==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.36; Wed, 24 Jul
 2024 20:39:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 20:39:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Wicki, Patrick" <patrick.wicki@siemens.com>, "patrick.wicki@subset.ch"
	<patrick.wicki@subset.ch>
Subject: RE: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to own
 sub-package
Thread-Topic: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to
 own sub-package
Thread-Index: AQHawWc2NhJn1w5FPUyYvRYZKTz2FrIGkDeA
Date: Wed, 24 Jul 2024 20:39:55 +0000
Message-ID: 
 <AS1PR10MB5697BB37A759467BFAF6E326FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240618100554.2793454-1-patrick@subset.ch>
In-Reply-To: <20240618100554.2793454-1-patrick@subset.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a3d4e782-8fd6-4893-881d-d7404b33696a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T20:38:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8979:EE_
x-ms-office365-filtering-correlation-id: c22e8345-6987-4850-f49c-08dcac20c6b2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?n+OuTtHBBMEujZrNrYDI/Jw+Qg8Cx0Z1f54hRg2CiV5+VZSvUQK33znGPrXn?=
 =?us-ascii?Q?1CL46Px2qehKdmAiyS5lt++tPe6gF98NKDYzGeaTSsAiTYjyu0inkI8+6JFC?=
 =?us-ascii?Q?EC+DNWGo0yuU2s1EQVbNp3kYKTDaOGmzdvSvZA2+rSwcqIgYnFonQ6CFd5cn?=
 =?us-ascii?Q?jLq02rxHDUPF1e7mCvoV+ViNPAAuIg86munI3+UAHMfhWnkCAjyrjv1ruVCp?=
 =?us-ascii?Q?IAhwdy90wOVaTUdk0rP60LPHd2KXPbfd/bgzTeDvCmehuYYgU9LXgCI3jdpT?=
 =?us-ascii?Q?Lu9aXTUSJS93jNttxujJBnG900cqixoKD4mPVCwVtwN2Syw5r8G798GT5Wbn?=
 =?us-ascii?Q?V8Dr98q1EP69v/Ht1yqFIFoOjv3PPd9j8j2h8AhLoeFJMzEvNxfGL1OJqJJo?=
 =?us-ascii?Q?XbvYPRJMWBY0pMaT29hEOQDtKklXjA4kCl5O/8PyzsyRfCRA48JfOYnlxaI7?=
 =?us-ascii?Q?jLd+EwV0C7GLZqG3xvSZk21jDq64YWViohtRDUaa+9vCrEfc7pOKEbcesuGw?=
 =?us-ascii?Q?eDaYwLNAa1bZ63Jfo8mOTdFUqvALtnsQ2YAKsGlyr2TlPRa2BNUzwea4uYxL?=
 =?us-ascii?Q?o5yghAL2tXrxB/wtD74wm9gUOZYE3CqT+/8SdMYPOYsQkDuHDnMQaf3XgIKD?=
 =?us-ascii?Q?e51pJ0JGFp/QE9U1I+2WOTcSfgaxWKPvRfreit89mb9XpRFEpx4yCb52jwXA?=
 =?us-ascii?Q?tsfEZYVLS+teuqTxkIINt+sS8VP9yOVnlPnUsYat0cT1NKaPt+za8mqBd1N2?=
 =?us-ascii?Q?4SSmRduASx2v6bF4RS92q/vl/kF6qtYe9thtZlUd4t8ab7d+31Mw1yRcigvJ?=
 =?us-ascii?Q?uPcFP540APPOxlzHf7+wglITDEVITezep+4XH3DgWrMo7EXGZGJa+8updPH2?=
 =?us-ascii?Q?dokE9aNrnQ13UG7NcOq2+HvSCwuGDt9w8iO9e4LaHx2bGbZUlQj+2HBSrzw0?=
 =?us-ascii?Q?GkfehcUBCbrL2Hvmo8p98r1HRHq4e9Ys2ew5uhgRWRZW+aSIg0i4wzOyXU8x?=
 =?us-ascii?Q?dLXe4EeDbH4SR7V7ssf91NJZFudtwFx4RmbGy2lLYiYaN9K9D5Nh+ejxyiss?=
 =?us-ascii?Q?C3DAtE5Bxzi+O8wNP8Vo5o6bsfXCvqXTt5uyswfvjY/mpwleiK4tvDvPJ22D?=
 =?us-ascii?Q?2LC4UTzInev5tyVupJnyFd4roB9GKHbc42oRtDBB63X1zffdrh2xRMZLdhyR?=
 =?us-ascii?Q?LmvDgjs+ChIvF+tpmjbVMz/fPtdfNalQsN9vfujosAJpLW9TH+L0ry69qBQo?=
 =?us-ascii?Q?pZXEIUYeLnKRE0hBUhQaFkZB+yhdZQ3PspvTEagWrb8YU3bqb8bbk56672DJ?=
 =?us-ascii?Q?+6cgUAScOqz8k5xn7ZHcOvNs80HrMhoU45bCWyLEGlS5imT50efVRunLxTSW?=
 =?us-ascii?Q?A1y9p9Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q4iZkhgplFU8tDY5qtekX1rnkyO4NwjpkfDDDdTYqgHyO0NDlcQrRPh+lBFM?=
 =?us-ascii?Q?QIYcAheYEieydyCosimUUhG9/j7+cLogf/hE8EGdjgzg7qZ+FBh9CGEE7t7g?=
 =?us-ascii?Q?P9egs4A7uwhyLRWA9ojIT6EYwgayTqNLBurZLnSr7J+TlBAGGny5VtC7WWTp?=
 =?us-ascii?Q?C3TwG8EdDzAQcVRuI1AvMs0zhjxOMeOXFo7qquB8SSGc2wg6Fg9AuVQrGAjE?=
 =?us-ascii?Q?7qJJiqfWf/3jol5XbEKpfDvPdlnGkCX/w8lIX+iE33prfdjJgETdKn8XdNYx?=
 =?us-ascii?Q?xs3pPn3fNhj629O/mEtko7qOh9cZA444uZpfaFhx341Vjry1AQKWMISq34ST?=
 =?us-ascii?Q?IshqTNPSej/ESPdfMROAgi1A/G1LBYkvmXw5eP1rsdehL5VfClO9XpKDKMec?=
 =?us-ascii?Q?GgWg4SdvB2bshOL9rg3XXwEZqxJCcXLR6ZVxzgmQv32RXt75zeFA8ENE14AG?=
 =?us-ascii?Q?fxjozFjn2u13SIMcT/HnuC9Ksqx9z555wBVlEQcla3El1mCQgGqXu1eYJ2HB?=
 =?us-ascii?Q?gC1nYTbbmt5R8xQOg42sov4tnPUPzuU5bUV8nPYszQ9TqbA836+10GB5FSR5?=
 =?us-ascii?Q?arjrpY6pquuGXlTmXlqLShZ1PXbq+z44LWn3vvSEUzJW3wYYMbis8RNKdwD+?=
 =?us-ascii?Q?zWt3nQnv3/57qfQ0e57LmfR0d9+T3wrZEU7QjNGeS//jS2ZskV1eKxheC7lN?=
 =?us-ascii?Q?EKt8T9L4QuXOOahqeeZceDlzCIXVQHktQltiBs6N1ueGddyKo1he+FYRShTH?=
 =?us-ascii?Q?b44m4NUxuwaI29Ocm0qLYv4UjWely0Zm8/d3guluSvtc9fixRHH9cp4cYc1P?=
 =?us-ascii?Q?oJNVKoP7w3t0hRQ1H8fyaCL6/dQZabsAiA6a5ZnS2YuAuWbC8860WSQlWS0s?=
 =?us-ascii?Q?yOAnE6VS5cOIxqMgcUCbsgw319qki0Ins2ol2BL5Lm+0C0TOeGmb3db8Qxjj?=
 =?us-ascii?Q?xoMaFeD6pDx+HWkoqWvC5XT1gGNvLW8x5XQ0g7+WlB7ntj5USjcnQUVVGTs3?=
 =?us-ascii?Q?bfyTMD9YBZR129N7K85WxFJ+OSDG/anWLsGK6jZAUix4vWZ2Z0A8IoBfvzOi?=
 =?us-ascii?Q?OUR9+V7R0fRHBoD6hf3P7gC3ziHuh//RLHFZFpa+TOiTz8EQMsDJrp/cnXvS?=
 =?us-ascii?Q?R0tptUARbNl7x7mJIq+kgzZkq9hqP+DH5sOKQp/92FDcjZBV3yyRjY2tMb6I?=
 =?us-ascii?Q?j8ZPOYA52re73mvBKLUTWBQHeh5okXZKY8KKZsuxFDNRUrLW7iLYx24ZE0ne?=
 =?us-ascii?Q?4F/u3F1nwh6HrVjp08s9DZjCefKreBGu1/ZLwa/86o9PYaFfENhqPPsr44Rb?=
 =?us-ascii?Q?2lhBiOnYdQwubG5FAxcciGxeCVjoFQINPcV4s282effjWDHD8XawX5qIok7b?=
 =?us-ascii?Q?LEiPDgdVv15sIDKT0bsLAKFtrG1AgRhtTJxmU+PFTS3MJTaHSfXH5YIvNtxX?=
 =?us-ascii?Q?34xSt6QSKc9n2k7pc4G4EbbhZu+koTNcfihR8x/npiILd1gPvrfmTiK4U46N?=
 =?us-ascii?Q?OQ9mPI6f3I144HVo8iF2wKc9b9WoMBjHTgAGSLmvwy6p0oEWRZaoJ1sbRU9h?=
 =?us-ascii?Q?wc8YcpPYlEBFFDgDzXm45GNvwMigKP+H8tiWNqyj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c22e8345-6987-4850-f49c-08dcac20c6b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 20:39:55.1850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kn+sv1Ksgt18uvBq6bATv1O/g3lFxAp9hh0jdMQyeAeZnY1bsvb/GU+L+mDtQELj1nl7OQsLvGC1Iue0UU+H5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 20:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202484

Gentle ping

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Patrick Wicki via lists.openembedded.org
Sent: Tuesday, June 18, 2024 12:06
To: openembedded-core@lists.openembedded.org
Cc: Wicki, Patrick (SI BP R&D ZG SW 2) <patrick.wicki@siemens.com>
Subject: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to own =
sub-package

From: Patrick Wicki <patrick.wicki@siemens.com>

The gpgme-tool binary is licensed GPL-3.0-or-later. Split it out into its o=
wn package that can be opted out of.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta/recipes-support/gpgme/gpgme_1.23.2.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-supp=
ort/gpgme/gpgme_1.23.2.bb
index d8807b3af2..55f164e4a9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -3,11 +3,18 @@ DESCRIPTION =3D "GnuPG Made Easy (GPGME) is a library des=
igned to make access to G  HOMEPAGE =3D "http://www.gnupg.org/gpgme.html"
 BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
=20
-LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE:${PN} =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-cpp =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-tool =3D "GPL-3.0-or-later"
+LICENSE:python3-gpg =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
                     file://COPYING.LESSER;md5=3Dbbb461211a33b134d42ed5ee80=
2b37ff \
                     file://src/gpgme.h.in;endline=3D23;md5=3D2f0bf06d1c7dc=
b28532a9d0f94a7ca1d \
-                    file://src/engine.h;endline=3D22;md5=3D4b6d8ba313d9b56=
4cc4d4cfb1640af9d"
+                    file://src/engine.h;endline=3D22;md5=3D4b6d8ba313d9b56=
4cc4d4cfb1640af9d \
+                    file://src/gpgme-tool.c;endline=3D21;md5=3D66c5381e0e0=
5475792e24982d15e7ce8 \
+                    "
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \ @@ -33,6 +40,8 @@ RDEPE=
NDS:${PN}-cpp +=3D "libstdc++"
=20
 RDEPENDS:python3-gpg +=3D "python3-unixadmin"
=20
+RRECOMMENDS:${PN} +=3D "${PN}-tool"
+
 BINCONFIG =3D "${bindir}/gpgme-config"
=20
 # Default in configure.ac: "cl cpp python qt"
@@ -61,9 +70,10 @@ export PKG_CONFIG=3D'pkg-config'
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-PACKAGES =3D+ "${PN}-cpp python3-gpg"
+PACKAGES =3D+ "${PN}-cpp ${PN}-tool python3-gpg"
=20
 FILES:${PN}-cpp =3D "${libdir}/libgpgmepp.so.*"
+FILES:${PN}-tool =3D "${bindir}/gpgme-tool"
 FILES:python3-gpg =3D "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev +=3D "${datadir}/common-lisp/source/gpgme/*"
=20
--
2.45.2


