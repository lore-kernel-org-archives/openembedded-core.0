Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0802CCCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 10:30:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.web11.30925.1759746608899890879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 03:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=a0NS1Z28;
 spf=pass (domain: siemens.com, ip: 52.101.70.10, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIn3hE/wxXvynL5sPEedkE/5+2hR3tE1ff7pXhsMxEHATSJrQgt0e2/udK+qvE0sPZSdn+A5ArZk9QLTrn0nZTIYFdsVEkVU87Kp5XFKvs/WMqNPtDdyedxTLj9bOX3lTV0ikamvQ2AZasaXrJQgXPmGBfbBzqajDyUiv6irs8S7dghshpuz1bEnQsfTutkAJORS4Il0ivEvq/eLIDMzcnRn+dLyWlkhGudXRoyLAqWLNtpHepAKmWnCQkOtD6TIqgM/OIagDOQoWwcxsTP7pr4ektrs+0VFBgCMtFfcz6UbWAohAtfDKIoUljMoak69+BKlInP0hft45FfUNJuLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b2SnYv5tIyIf/1QSISQXMP91rsZFLOcbod1G37XEw8=;
 b=v8G8yjDXbOPq++CPcGxeF1LyZ8TmuXv4tgk68wjFfrj1M1bfTiAnStUlU9wOOV05P3QbCyljIu6siJnCGLAA7zB/N2P4I8OCj/o6xA5sr5Q+hCmkiY9CWGm4ZW7kKs4+wPjs7Uit16G9oC4QmsgkfB8F9YmI7Dz/oovG9pcuIi13qzHdTaxmw19wnxeginxRLXsHkEGdvqgC3uh79kSgTy+y5/TpBrJutrWsVUYi9SfKjZXoGqetsvxsgS5USffGpGoXwLKINOJ1Jt4wZEVJKRGV/1MZDAAvBoZAQtZkFtjI2UCTBN3RV493FyWTAGhXk90z0EJx3IWNFlCGRxtbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b2SnYv5tIyIf/1QSISQXMP91rsZFLOcbod1G37XEw8=;
 b=a0NS1Z28V0jd9/FjseE4Q/ZoRtRcEd6lko+D4GZ4nI2LMdYL8QGesR+/go9+bBsKO0RIKYF699UVeSVC6avtizV+XI8Z2i5t5pavt4O9v6Kb7e5BweeXQrew3pof33mwKlVmLKnrh/O1L8asVaEOgOBwyFFonvCS8+cpamZUHRpvGRyYoe+3mQd6KvRALBE26QGHgXQPsZZtdCUI3O+BhkiikWFKxroe5M9xdENAOKZGUwF2yIrGrzXj9SOzb9vHxDA6URYgqzaZ/UA4T3I/3z5GK47oGM5EMd1tvEWOmyHSkDWz2Vj+u+E2tnQCJ3e9i1uzghh4V+hFOK9HUyHySg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8538.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:30:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9182.015; Mon, 6 Oct 2025
 10:30:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.17 -> 3.0.18
Thread-Topic: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.17 -> 3.0.18
Thread-Index: AQHcNqcXF1tecxEHrEq2Dpu+PP+3F7S06mvQ
Date: Mon, 6 Oct 2025 10:30:00 +0000
Message-ID: 
 <AS1PR10MB569772D97F95CE85D9FF77D2FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <186BDE36FCF4B316.24594@lists.openembedded.org>
In-Reply-To: <186BDE36FCF4B316.24594@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=50eafe45-8393-42c0-af9b-7518062badd9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-06T10:27:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8538:EE_
x-ms-office365-filtering-correlation-id: b90aa971-913c-49da-a323-08de04c34db1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?fNiNnLmc64ShTJDC+cdeVEDIrG87PlliYsUT/vci5QFBYp1pRZQC7KYMl19O?=
 =?us-ascii?Q?oqwpscF6HAl+poGkHx7oQWYePeEHcpuu70xmYZIMQK5GcO355q1EYE8wNf9G?=
 =?us-ascii?Q?D+KWmUfd136qhfM0WSuSkaSHT57ZDqwcQnWZFaffb003Thy8KP3fAMcMzBKF?=
 =?us-ascii?Q?Eqz3J+/oKMRfin6/5kARqnj4mM3Uzj7vO1JArnCQmkSIPkzqNr/XgR1czeFO?=
 =?us-ascii?Q?unX1V6XciKR5p6aAz73yKw+iB6WPUNdecJeCStWUIo/zTftG+2CHfvy4BhUo?=
 =?us-ascii?Q?jrH1kGvMGxId1PXbOwTD93mNF0CV8+5Xh299kLoFzM7fXq2SL0uKUQWhDink?=
 =?us-ascii?Q?u8FAYhq3TAD03K6J3635sMPI8lZtcH6PMw9C57Y+9y2P6KMdJA1QsyfinEaO?=
 =?us-ascii?Q?L/tGL09wP/eoD+f+p2OVjEwiyJ5zpvzQ0X3mhTM56+woFwRz3Z2Qi1EKNXSQ?=
 =?us-ascii?Q?5d0MLZhJHjJ6sXctk4MB36jMBMWGlPbBiPhDV9afgEyTExjb2yy+x87D/pMw?=
 =?us-ascii?Q?HenLayb2TvX0kAeEJH3V7IVKgALhOh6dSL8VVTLbUMtOEksFkhSh0lDqLGYX?=
 =?us-ascii?Q?1SUSmaofH5GG8iGv6yCXHsAuKBvTiOQ7rxzezhdiEv7DkXxLlvJmcn6HNbqF?=
 =?us-ascii?Q?03jzNYhFimlOyjrrhRn14PVKvnTi7S7elQ+ACi2fcFOui3G5BgsLJ5Jmp2Xu?=
 =?us-ascii?Q?391YmshK4OVk8+lkqW2aHGCKI5SENKVLKm7N2N8qiU0yAWoVIF6UOAZcn+Ra?=
 =?us-ascii?Q?RcqIMVU93/zRhPNVHZqEkd73zlbXnQwUu3/b8YsCqrnj6p9ukWKz1v3WTv3n?=
 =?us-ascii?Q?tw7i8a0TUipMreq0RgXv07TPXc2C7bMYtF92kL7q3+pUUXz+CRbbqX4gyNJA?=
 =?us-ascii?Q?mvG1qz4R3ouwxEsDW2562+i0gRgRfG9HM97GnQQogheRGxnzCWzI+6dhNlNd?=
 =?us-ascii?Q?0mEqhHbzgEC26J34F4YS3FXFlsA/Xd46Yo/inZvXY3OJ1iMsfqqNM+qFsXve?=
 =?us-ascii?Q?qsZOsO67e0rDYn2NAiRpCWGVzHYWuu3rKvGz3e4hnu+DUghernm+/hWcuZXN?=
 =?us-ascii?Q?5hprxlE0x1ttCnlZoQ9nhDyhLPpylP1CxBJ6rgJm3rD2PF/KOKHOOY7+hU/i?=
 =?us-ascii?Q?ueZCpvxJ+qC1ldR1HiyCjBIoYCZ9dUr7NVyhlPPDF+rCGk2nQc8x2tQVSiQR?=
 =?us-ascii?Q?jLTsnbeYbhr4d3qc2ULv4bCzI+AAnBI5y8Ir6PC2YY4G2qBUraV8PaDdaMjK?=
 =?us-ascii?Q?jzdZ12UbNs7oTfEXTpAoEG3HKTkx6DZF/+AkweTPoZ/UafWJpQvFyteSfwpM?=
 =?us-ascii?Q?5irEKQbET4S0JvdNs3BJRevfb4R9xmGuiTApNO/LPgY9To+rJARYMRXfN6Qf?=
 =?us-ascii?Q?bGMML7PJwQly1svNdEEGkTWoY6bkdET+ZgoIC9cPAVY3N7BtHVi2R8BR4mhc?=
 =?us-ascii?Q?tATFguwj7rLw4Z57d6yGNcgYi1CS4JMm9Js9Zd9+41oNjXf3JAtUZw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VFUzdW/Gr3mCyZsWxcqtvmywBnGJIL24wsgHQ9ozLUkEDwmJej7Pad2lceS7?=
 =?us-ascii?Q?ALYscfKuGvTMP4K2bOomX689jT6bnNB1rZRJTh9swVjRKaEzhp4W13hq29UL?=
 =?us-ascii?Q?tTFPopddKruFGthvTqipxAcLq/4nPWnSN4APJvAKmqs07owhTQA3cYUIw5fj?=
 =?us-ascii?Q?8JX9/6+lEpN8VoqTNJvYehcc8ClHkvjcp0mUL7Zh3tJx9jCR62ysW4o52POX?=
 =?us-ascii?Q?I6jN8EMPBpSNX3GxcgrPICv4MRArFmlAGL8b0mPMPjv3SggYdawmb9rfmLug?=
 =?us-ascii?Q?J846MIMaaUEYmhvrA9c23D9yXt8LeBq5/KNtdTmZjmoXHhBOr4sNRdXJHaJB?=
 =?us-ascii?Q?lJaZwDE94c2ZIUrnQiW5aeWtK507zeHgL6rl0j0INYcbL8hdD0q7McwKdNNQ?=
 =?us-ascii?Q?uqgCK+C4X2/eSdOTagcBRL8RCvPGmTInpZCLlukVCd7rvMF0Re8PwkrDEjIh?=
 =?us-ascii?Q?F3j7Jb83GxcM6lSOrfP3QcKhE7s51vB5IyvrpzukmX3+UW8xFhnsWBlmY/WP?=
 =?us-ascii?Q?qXZdVhwvTvlVi0SU6hqsjVPs6kuiuZzZIDcqcTcSxOMJC0DezgCkMkLE0KR8?=
 =?us-ascii?Q?KXbCGhGUQvxKfiizmq6V1/yoF6jLLr6rtySLlvHcTStBxVbaryx6Ff3AGPH+?=
 =?us-ascii?Q?74r23FOn8wnCfaCaaRLX8mL/IWcFh9d8v31ZS4XgQY3LBlzT02ZoW8eKmaYz?=
 =?us-ascii?Q?oIZaC4T2fVwAxOOX1YIB4ohcwg3+gLnEF8OnjP4QrKmKq7dXmzpJd2UB9xzX?=
 =?us-ascii?Q?cvhoRnDJvk2KK2WSOEi1L9N9udAeM2CgYdKByg9cfudZSoqZXKXEOB8yZ9Dv?=
 =?us-ascii?Q?uUfdqXySsSRZpdazPdYG2kLvaIQ39A3LUeJcnKi/y5MZQNLC2ONCw6BSe/a9?=
 =?us-ascii?Q?PHYgyQAVHEjmwOuWmUc8tuio9HDsdwPksKZJIYBIvaPYVQOnnNDISux+TELV?=
 =?us-ascii?Q?sO2LMIM26WoWYnsU64sjXzbk2sQz/xm4FLUEz5HL0QWWb8v+qAMAr9+l4EVl?=
 =?us-ascii?Q?PpE+B/DC0LDlIeSiVlZkUPIUABcjgFGG7AfCJHQs1oQloagl3Em840xK/78c?=
 =?us-ascii?Q?dOCdPMBMC/qaMOmxPA2uZWS3ifugls7zpdusoeh1yyIsAWqh6SXdkS3nlXk1?=
 =?us-ascii?Q?1IXdLdhhX7wsNIL2Ts/Mst5ErbUFPORurE8Zb+ZedIL4tQyjUMVFUqilgcXU?=
 =?us-ascii?Q?7nKrTBTHrmvxKPI49A2bO/4ShbhD6FZgeHToIzQ4v0Pg9Iu/rpU+rgBAp0+U?=
 =?us-ascii?Q?iopQ1BLUOsYxGDMzEaQ2jLJ9O2AimtWwWEZa2tDAWpPx137cPQJzJGZB12HA?=
 =?us-ascii?Q?XFqS7jjRGB/YifKr5/CW6Mv3zaHq70u9tlH5h9Gpbzl08oIun1mvu/7S24C3?=
 =?us-ascii?Q?t6Sre93FI+qxFCi0IfOQQRqAOrjjVG0vtv3IJDCYLg5tJ7FpyFwVCjuKIfCa?=
 =?us-ascii?Q?zgI3K8VzCLLcx2dbxdVdnIAd5vLv4WFp6diC9/xHzT8cBVeW0qI/M162z9mt?=
 =?us-ascii?Q?4oIM+xGXn0LIKZkBxTqJ6LdrRvb8tToOSc69Txdk3YkIvSreB5i8FLWBH37D?=
 =?us-ascii?Q?4V0AkiZyZr8e8tnRyyajzC/ADJ+bPpWOjw0zxZ1l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b90aa971-913c-49da-a323-08de04c34db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 10:30:00.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSKwTm/UcQniyK07fDY8jOVb76Y2VSa6Hj7F55pobMyCw3UkQnHwdxgfsO2BjuHXKOXmPZ3ZgChri1i44qgBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8538
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 10:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224474

I guess I have sent this prematurely, I have a failing ptests with this one=
.
I have a bit problem with infrastructure so not sure if this is my infra or=
 real failure...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Monday, October 6, 2025 11:49
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.17 -> 3.0.18
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Release information:
> https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes=
-
> between-openssl-3017-and-openssl-3018-30-sep-2025
>=20
> OpenSSL 3.0.18 is a security patch release. The most severe CVE fixed in =
this
> release is Moderate.
> This release incorporates the following bug fixes and mitigations:
> * Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
> * Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232=
)
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../0001-Configure-do-not-tweak-mips-cflags.patch    |  2 +-
>  ...-strip-sysroot-and-debug-prefix-map-from-co.patch |  2 +-
>  .../openssl/openssl/CVE-2023-50781-2.patch           | 12 ++++++------
>  .../openssl/openssl/CVE-2023-50781-4.patch           |  2 +-
>  .../openssl/openssl/CVE-2023-50781-6.patch           |  2 +-
>  .../openssl/openssl/CVE-2024-41996.patch             |  4 ++--
>  .../recipes-connectivity/openssl/openssl/afalg.patch |  2 +-
>  .../openssl/{openssl_3.0.17.bb =3D> openssl_3.0.18.bb} |  2 +-
>  8 files changed, 14 insertions(+), 14 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb =3D>
> openssl_3.0.18.bb} (99%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-=
not-
> tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-
> Configure-do-not-tweak-mips-cflags.patch
> index af435472a5..c2470c2e29 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-
> cflags.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-
> mips-cflags.patch
> @@ -17,7 +17,7 @@ Index: openssl-3.0.4/Configure
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
>  --- openssl-3.0.4.orig/Configure
>  +++ openssl-3.0.4/Configure
> -@@ -1423,16 +1423,6 @@ if ($target =3D~ /^mingw/ && `$config{CC}
> +@@ -1423,16 +1423,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help
> 2>&1` =3D~ m/-mno-cygwin/m)
>           push @{$config{shared_ldflag}}, "-mno-cygwin";
>           }
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-str=
ip-sysroot-
> and-debug-prefix-map-from-co.patch b/meta/recipes-
> connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefi=
x-map-
> from-co.patch
> index bafdbaa46f..40e9bb9d30 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-
> debug-prefix-map-from-co.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-
> debug-prefix-map-from-co.patch
> @@ -38,7 +38,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
>  --- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
>  +++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
> -@@ -472,13 +472,23 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lfl
> +@@ -483,13 +483,23 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
>                            '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
>   BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.p=
atch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> index b336d9e850..a401b5cec2 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> @@ -288,7 +288,7 @@ index c8921acd6e..11a91e62b1 100644
>=20
>       switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
>       case RSA_FLAG_TYPE_RSA:
> -@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char=
 *out,
> size_t *outlen,
> +@@ -204,6 +207,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char=
 *out,
> size_t *outlen,
>   {
>       PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;
>       int ret;
> @@ -296,7 +296,7 @@ index c8921acd6e..11a91e62b1 100644
>       size_t len =3D RSA_size(prsactx->rsa);
>=20
>       if (!ossl_prov_is_running())
> -@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r *out,
> size_t *outlen,
> +@@ -281,8 +285,12 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r
> *out, size_t *outlen,
>           }
>           OPENSSL_free(tbuf);
>       } else {
> @@ -311,7 +311,7 @@ index c8921acd6e..11a91e62b1 100644
>       }
>       *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outle=
n, ret);
>       ret =3D constant_time_select_int(constant_time_msb(ret), 0, 1);
> -@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx,
> OSSL_PARAM *params)
> +@@ -406,6 +414,10 @@ static int rsa_get_ctx_params(void *vprsactx,
> OSSL_PARAM *params)
>       if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
>           return 0;
>=20
> @@ -322,7 +322,7 @@ index c8921acd6e..11a91e62b1 100644
>       return 1;
>   }
>=20
> -@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[]
> =3D {
> +@@ -417,6 +429,7 @@ static const OSSL_PARAM
> known_gettable_ctx_params[] =3D {
>                       NULL, 0),
>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION,
> NULL),
>=20
> OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSIO
> N, NULL),
> @@ -330,7 +330,7 @@ index c8921acd6e..11a91e62b1 100644
>       OSSL_PARAM_END
>   };
>=20
> -@@ -549,6 +562,14 @@ static int rsa_set_ctx_params(void *vprsactx, const
> OSSL_PARAM params[])
> +@@ -554,6 +567,14 @@ static int rsa_set_ctx_params(void *vprsactx, const
> OSSL_PARAM params[])
>               return 0;
>           prsactx->alt_version =3D alt_version;
>       }
> @@ -345,7 +345,7 @@ index c8921acd6e..11a91e62b1 100644
>=20
>       return 1;
>   }
> -@@ -562,6 +583,7 @@ static const OSSL_PARAM known_settable_ctx_params[]
> =3D {
> +@@ -567,6 +588,7 @@ static const OSSL_PARAM
> known_settable_ctx_params[] =3D {
>       OSSL_PARAM_octet_string(OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL,
> NULL, 0),
>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION,
> NULL),
>=20
> OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSIO
> N, NULL),
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.p=
atch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
> index c6dad3cbec..c7a4a7daf8 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
> @@ -21,7 +21,7 @@ diff --git a/test/recipes/30-
> test_evp_data/evppkey_rsa_common.txt b/test/recipes
>  index 080c4d02af..1405465098 100644
>  --- a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
>  +++ b/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
> -@@ -277,6 +277,414 @@ Derive =3D RSA-2048
> +@@ -278,6 +278,414 @@ Derive =3D RSA-2048
>   Result =3D KEYOP_INIT_ERROR
>   Reason =3D operation not supported for this keytype
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.p=
atch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
> index 75e1df4bba..9104667b8b 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
> @@ -35,7 +35,7 @@ index 0ad654fc60..a3d01eec45 100644
>   # The old FIPS provider doesn't include the workaround (#13817)
>   FIPSversion =3D >3.0.0
>   # Corrupted ciphertext
> -@@ -261,6 +269,16 @@ Decrypt =3D RSA-2048
> +@@ -260,6 +268,16 @@ Decrypt =3D RSA-2048
>   Input =3D
> 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3
> 619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24
> A7BF49BD6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836
> D7CFBC75BA999BDBE48DBC09227AA46C88F21DCCBA7840141AD5A5D71FD12
> 2E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B205A84AC5444F3420
> 2C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E12F76
> 2AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F
> 46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76C
> B9A79
>   Output =3D
> 4cbb988d6a46228379132b0b5f8c249b3860043848c93632fb982c807c7c82fffc7a9ef
> 83f4908f890373ac181ffea6381e103bcaa27e65638b6ecebef38b59ed4226a9d12af67
> 5cfcb634d8c40e7a7aff
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.pat=
ch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
> index 49ec9c0130..5a91f55a12 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
> @@ -32,7 +32,7 @@ index 795a3f2..3e7a811 100644
>  @@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int
> checktype)
>       if (pub_key =3D=3D NULL)
>           return 0;
> -
> +
>  -    /* The partial test is only valid for named group's with q =3D (p -=
 1) / 2 */
>  -    if (checktype =3D=3D OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
>  -        && ossl_dh_is_named_safe_prime_group(dh))
> @@ -42,7 +42,7 @@ index 795a3f2..3e7a811 100644
>  +     */
>  +    if (ossl_dh_is_named_safe_prime_group(dh))
>           return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
> -
> +
>       return DH_check_pub_key_ex(dh, pub_key);
>  --
>  2.40.0
> diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta=
/recipes-
> connectivity/openssl/openssl/afalg.patch
> index cf77e873a2..8a8bf80a5f 100644
> --- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
> @@ -7,7 +7,7 @@ Index: openssl-3.0.4/Configure
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
>  --- openssl-3.0.4.orig/Configure
>  +++ openssl-3.0.4/Configure
> -@@ -1681,20 +1681,7 @@ $config{CFLAGS} =3D [ map { $_ eq '--ossl-
> +@@ -1679,20 +1679,7 @@ $config{CFLAGS} =3D [ map { $_ eq '--ossl-strict-
> warnings'
>   unless ($disabled{afalgeng}) {
>       $config{afalgeng}=3D"";
>       if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/r=
ecipes-
> connectivity/openssl/openssl_3.0.18.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.17.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> index a50bd2edbf..a8dd338327 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> @@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>=20
> -SRC_URI[sha256sum] =3D
> "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
> +SRC_URI[sha256sum] =3D
> "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
>=20
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"

