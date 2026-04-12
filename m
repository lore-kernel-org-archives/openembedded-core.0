Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F339E937FD
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 19:04:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.255518.1776020692912837090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 12:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I/I8LgbS;
 spf=pass (domain: siemens.com, ip: 40.107.162.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaulOFcXq02Vq+SfNvHOX8QKpJxvTlTejEFr09Y27FylymXmO5YqkeUwLfXx9Py9SZXi751KmDMdJn/GOc/xHPbWxik1ixZxRSbeQhRL6JCLaTwcbmdvcDe7WuRqX2dJeoOZRz+NHCcWXuFoXuUm55lP3ToOChxVaROk8yGujcBMwutFBNFmGBmM5tIk260qbUn0MYVj/XeGMWLPla8M9F7DWgq+bRydTn4lZHvx3mpz/MsZ2uy2938fxNjAZRp7y2RN89n1wx1T9vnjy24EB4Mkpwt38TyCbnj95d1qbZTPBLOoaeatWSxCTF1jKjusL02aqGD+XREqieI9vanP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0reAV4MaNrYaebT6syb/+hazPeZdqIxLNtMFlqOovM=;
 b=RVCp+JXZNlB9u9Y6iZLWejDvr86fk35Vzgldm922knMNG97gpGrOlCZY0gS91wlxIfa+7SeJjZH0YP+DyGrJwcAgvNwNiEi2Y71Ds9OqU3kDSq/W7m3Cj8yWSmkvspevdkduWo1k04mieyfwgk3U3muvsdIO1TocI+Q3qIhbw26dZqaAKJcVatXgg8Vx2syHCz30qXvzNCR1H3T/GK6xHwv9zwm3Z40rYE4xmwhh/5JVGe03PRbOtKNtioH7SLr7BXa95Fc9D66V5gNafOFMFhOxlQLg2P33FvN5dNc+DqQSBtWgXUJLYODDeBpxh3VK+yF0ROWS0ql4GHK43oTn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0reAV4MaNrYaebT6syb/+hazPeZdqIxLNtMFlqOovM=;
 b=I/I8LgbS44ZdDkZfrXmX4VapxHuHe1GCNeNq0bKw802HYl1P9GDo5X76UJg/WG4sF4Lr7AL9NFmVsS+1glLQCAEA1TnueLYSUrI2xwKmRglCOBfb33HOGwmMFRTvX7Fi5B0PgEMFoeZQwpWRZPNt7SUBXB5TPXEikI9SaXJQIn73w+EsKJsm7CntUrbOuHIsi+f+iP1METxvrCnajPi1DcsuQAMJYnKWQhmfQWbv4KFVOuNOYwB/wKK65PmyC12+rIjYIeQU0Uy5kmDKmVbI3SkmkV9OoRsAHiEA9Os/EQSA4/bGOk+dsyg9Ukk6vocDcalimaibhsL5EG0O5ELa7g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sun, 12 Apr
 2026 19:04:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 19:04:48 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>, Ross Burton
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Topic: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Index: AQHcyq2co6Yk9IO1d0Coj5Am6U3L27XbxjhQ
Date: Sun, 12 Apr 2026 19:04:48 +0000
Message-ID: 
 <AS1PR10MB5697C1A55909F05EE73FB5A2FD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260412185201.2556780-1-peter.marko@siemens.com>
 <20260412185201.2556780-2-peter.marko@siemens.com>
In-Reply-To: <20260412185201.2556780-2-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=70fbe58e-6d5d-4c39-9cab-9464fa9a2c57;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-12T18:54:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5650:EE_
x-ms-office365-filtering-correlation-id: a0a5e602-f679-4114-84a0-08de98c65e50
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 LuQgaIzVmT8yrVCqR6GqFxGJU073rvdWcoI5fjJSUb7byI0NBRmnpRku0lFBx5xQuhkfGJyCSX9znbXf9Cp2by5gsnZT/frIlxsAI5Nv4vjNL8CqwXoycy3O/JjtPlkFZLVk/TRAMlcBx2/W/9Mn5fm7qkJEcOKx9cSyBf3k6qmNaQt6+EBoxv4SOAQN63r+Cll8bcnX/XQEjjF2CCdfw1AMbsO6Gyn8PltEtoY08COtd34fi3ojPOSqluHjOLg609u2lMbOqgalDtfctOXFY/8gDPwbDS/9JwUK44b8pN1KZwEB+NPncCCj3+SPU1Q85WfusgOppRHuvEntJnGblDPQo6kNtuWDUM8L1Wq8Bf3ocDgwIa7Zn91V5jAHZILQBc+8pQpFnHDel8PcPphywU6I39ZVoYLR4P5KCnh/TSzqg+trnJKyGnfD2So4DU84rGHYt2jRlK04RcvH7Etk8LoxTrOImXqX7GwPo35qLt1nEQFQhcKgdUFRaHfunuV5hrBohqFVrEdgMxwZD9Hkm/o7RrwVPr6x0OqdOYtEcbnp0pYBh/lpPaawnnKHkQGbIayiMyp+yLFVYiAvWI1mzqr1TR1QDrfNheCmpOArgbQtZH2uOTJ/4DH54s6PhV/jAYvvItNNWR7xG1b9Kry1hG22QenZjh2/GxmhOxoHfFReJH2TtItb270nJG9koUUb7uV+SqBmnj8RXVSxJgpMeaRfp92qzTQv7SVltDFx+DlHl+jfNNcuSyKj4iVxsDY+gVU20lc7Ey9r7pQdaytyM+pvxwqjwcaPidhlELS4UzE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rH/joG7EvivilJR9HTp7D3JWy6lo9Dv+aFAk2s7VPaWK8rKswmbmI/V81TSm?=
 =?us-ascii?Q?829Cex/BnpBF3+UrUewstK5a+5Gbp9c+jKPXmIW4HkBu2TPxba4k6roDezPg?=
 =?us-ascii?Q?lIhDeUoopoMebNyLCcmjUB7HO9eYQzUUjyybi5lOvSGrbFTeDvutF6P+sp9j?=
 =?us-ascii?Q?NDaGKlPlwHKh/69BJXllgKu8Vm8J5wVsXRkNRazK6a/IrU8rvlMEkt0ScCQJ?=
 =?us-ascii?Q?xRjNGMjaIfPfqWN0xUN8kLvE6uMcFRO8lxIHSgW72o5tQH3Q5FbD29Q5CAGU?=
 =?us-ascii?Q?2AOQGidVPl99T0dKKIscYSwjJTj1iEfvvZgKMMCs/4cpyDEenUx9HKbLtdWb?=
 =?us-ascii?Q?h3iSFVfyIFxOJ/Q4ycJgUZmQaU9bK8pssrURc5jbfAIK1nmHlVhd06EcHxMJ?=
 =?us-ascii?Q?HnrlFF9pdoxA028mYWImw4wD9BCJmaKMJbXd8pN1Uy7L9AImwFhvyxEIULjh?=
 =?us-ascii?Q?oJCvrl4bZfU4hedYXhxc1GzH8AjRLxz9yGPQl/MPEjv2jG6mzyvRqSz/H8o5?=
 =?us-ascii?Q?b7aO/rj0ywiQmyNQOslbWSVHItl4jNHMbUVUj3BoKqwsMGzDOJ2Fe9nC/74W?=
 =?us-ascii?Q?4hOpPlkW4ZBVx1fCfnn4AnF5iOgFkU9YDEwEszxZ+8jVFqGUAns9rSoXt1q3?=
 =?us-ascii?Q?iBP8I0FAldZtQCJLSbW2EGDNEJd13XpobecsKJ4KCnsLyDHfd23qbOVAJ5db?=
 =?us-ascii?Q?p03RGhmtdOGBF8orerASxr234nbeVIhIY6Nq4wzKFgqnKAivouwueOdePEl+?=
 =?us-ascii?Q?sZZJp03DDjWLd4v4BCgbaNoWIft+9tWOZkYzp37OyO2Nwq7wCPaiZeNjeNQz?=
 =?us-ascii?Q?RBmVbYAnqn88JnzabYJ66SdeFLb6dTt9dmWSJc0Lbpp1ZBJPKYFBKPAhvN/s?=
 =?us-ascii?Q?Iy2KwMGQ9FBX8hVrQ08mS8sz3BaW/rOg+k2KmwK+wiSNs3RHrwzDP7DyY7sM?=
 =?us-ascii?Q?eTNkJyrZ/tJGG3xBq++7MD+ax1EulpTeUmAGB7kggUVGeYOnAOAy7uuViB2l?=
 =?us-ascii?Q?DrMMsyfNErwkOA4J85UIwCrWBVAwVpbJ2OHEq4RcB5uKiMlxVOknIJn4Hioa?=
 =?us-ascii?Q?V1fNEufF5GOG6aqdCoPd4EzLwF7d1bLV8+PUWvdj/lmPPzXBRPgNWvjHZEUm?=
 =?us-ascii?Q?P3kFZhdOxYvcC96thRSykJO20ZO5ulwpEekgmTgEcsrG9e2y+blrjOqpbV/y?=
 =?us-ascii?Q?iG3dSt5D1YyuWYoiY04h9H//3+fICiBOB8okdpxs9IQ/TCmA1sat01+COyyg?=
 =?us-ascii?Q?TxdE0L/XGJQe8jUBjt01H9AYDSS4XLThLVTq2wiGmNOc5J5XmvMZd+ezIhmr?=
 =?us-ascii?Q?dLh3PWZU87c4nfBSoQBoA3V/0QLj1Td39Ihr6paRhWRWc6vr+819yXARk2tL?=
 =?us-ascii?Q?WDjrDFkg54zOVl39ADkpvMJb5lR2VuxZgUBAYFjDPxZCDwuYFWR93i2WA7tN?=
 =?us-ascii?Q?6oHMHMHUwA4DLEmhsvdZEqlmCMHbDqpv0kT+jLOZq9A2J/TDk1OJITdNGB1D?=
 =?us-ascii?Q?ijsucWlfZaJCjk92QUWRq5To/qFkqSMqJgQz5oQO+V509D76eyrnIBzjlmmv?=
 =?us-ascii?Q?xnTl2bV4ljr9B+1GChq3woNgtpSZewkD5TL35WEyV1o+BTO4kaz2wtDX85Fe?=
 =?us-ascii?Q?iCiQg5wVe1x4BmKUxGNHxilLNYELYoejxlsL7cU4gHKAG4XK8FXswZ0+Ycaf?=
 =?us-ascii?Q?2c7cQr4T7dG7ulLORP6OQ8w+APHmblhSU1h+ksw+PNoZrjyY9h4yW+o57vTg?=
 =?us-ascii?Q?3ddxfhl7Fw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a5e602-f679-4114-84a0-08de98c65e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 19:04:48.6275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 09vT+3dDXDKBebbp0IOb9m8l4h1NtwqzFdQIvDOrLalNe+L+VQr0U5YpPj4nAnzeyrHV9ipPEl76nXBHd5xS3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 19:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235074



> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, April 12, 2026 8:52 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [PATCH 2/2] xwayland: set status for CVE-2024-21886
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Reference [1]:
> Introduced in: xorg-server-1.13.0 (2012)
> Fixed in: xorg-server-21.1.11 and xwayland-23.2.4
>=20
> Note that the status should be "fixed-version", however that does not=09
> seem to work correctly with the new sbom-cve-check.

This looks like a bug in sbom-cve-check (or vex?) code.
Any idea why certain manual CVE_STATUSes would be overridden by cvelistV5 s=
tatus?

>=20
> [1] https://lists.x.org/archives/xorg/2024-January/061525.html
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-graphics/xwayland/xwayland_24.1.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/rec=
ipes-
> graphics/xwayland/xwayland_24.1.9.bb
> index df1bb7e31b..6c10eddb8e 100644
> --- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> +++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> @@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D
> "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f58245
>=20
>  UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
>=20
> +CVE_STATUS[CVE-2024-21886] =3D "version-not-in-range: fixed since xwayla=
nd-
> 23.2.4"
> +
>  inherit meson features_check pkgconfig
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>=20

