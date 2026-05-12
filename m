Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EFBCD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:14:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71917.1778580874044108106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 03:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TlwIM/mm;
 spf=pass (domain: siemens.com, ip: 40.107.162.39, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL8D/y52T5QkEvFMGl3VJAto6KALhBaYvt6sCVOeT/09eFVOAg4h7U526IUplopNxth7+jA6w1Kh4H8z73ew1qn0nEHqcHHRDSLl3T6maJMsGTphKomuxgL6efPiD9Lbz9k7Pe8r3HJomIewnzAXgBHk5yyLuPv3ailZKvlgNMN7om5kMTGFTVE87GtjlX3Dz6axnGk1swNScl25qEoFiKV3x0y74XvcgExtSgs5cfh5r1FU57sSx8HQ+Q2WItTP/tnHdfzZZItHhnWedqCdKGDg36exNUAjdhwojVwOgno3Uo0v/RclZDXCh4gb8mlY3OP2LQdvdpF9o8ymdtlpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNi7kswdk6S+kAyubpbszVYWNQqmtG43MNIZJLFb4z0=;
 b=dEp5tVJm1PP/7uAQmkQ6uhfAdds7/KdrQua0QR6zWDm9lRc8vmRaiSD+vP1J/FmD6NEknUo3EOj4GnkK5Piy5VR9c8FHdgHlICMv/XBYjs50akxQ7XBL+tuySXYSS/wOEO0dDLaxA2RVAmOMWd1UDaLdcpi37Oir8LEzGo0k2wul3LuihhCkLyGPEAIzMtz8Crq0348e5LqO3LpPKpdWGhxay8BYnICJWDfe2pDEQEcV8dOB0U215acgdWdVAnPme/xsOJagGwgFjulfCJEFEYRduHYBPxmwhnC1SA+zNY4kpyOHD+qtae3Pd6HVEzaZnWZROOkI37khXrVcjLBN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNi7kswdk6S+kAyubpbszVYWNQqmtG43MNIZJLFb4z0=;
 b=TlwIM/mmPyHSSrxiF95bgoJU3vszmGfpVqQ8I4kMY/UH+wx0aXzDISpd+M5n3EqX/h5nK2mBQFqj4XgffzXC4WN46Id1HbrQe+vZkqEJ6CEt93OKp32qC1fx0NKZmjOzvanduuqEeJn49C+Vjp2bj4dG2JrBv8DpNN5yzdr4O6Mc9y/VXmMcbSkNucdjrGS3KfGctgZ92bMPiC0LjGoweJyx7shWvgR4CX73vBRrDZSXHixFO5zGzJai32r4lu5hR7aBYifheiO+FWngfvg/0UCPWLAy/jkipTulZAb+e+t4zxb2GYe3LGIcNUjdc67kCHqyAj54IbNh7xojjgfyGQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB8133.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:14:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 10:14:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Topic: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Index: AQHc4feOvj824O0d+k+1jYZdCs8HKLYKK7Uw
Date: Tue, 12 May 2026 10:14:29 +0000
Message-ID: 
 <AS1PR10MB5697F0913DB780BDCC207D55FD392@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260512101002.2282038-1-alex.kanavin@gmail.com>
In-Reply-To: <20260512101002.2282038-1-alex.kanavin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=db666d81-684f-4e09-864a-2b3c943d7f4d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-12T10:12:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB8133:EE_
x-ms-office365-filtering-correlation-id: a5db3b5e-9c74-4ee3-16a6-08deb00f412b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|38070700021|11063799003|3023799003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 p74vcsGubXARtzIIXzyybJ/E3pZCxowq7nKbZ+KJts5qQCA39t0ZBORrTB4qle6D9v1SPYox/dGODLh3JEX99/JQhyZrmKqzp+quI71iCyE6xye0ZQoj+zC2isE8E05W1BDGatN2+nPYiUgDxGkm3BVDEuL1itxtzuuXxp34NWWXuQH/5Fcm5bekuhEC9/zQCPJrOuQycgSWHj2Y95ErJ7wDZL8hLPkvobnh/SIXr5uuKJPHdCIKvfZeCAT8/3/QD1gOdOCoDVEpXxpy7eGpIc/ZAqR2hxTsvKcXxuHoCysuaPgZFPKiTCPkoVu+QYkVDrktzO9KOIxcFo6YBZOdtW10SCjzaMCuR+TFe/7lEHrOazBMMn9WHafSlHSLqTMQCnVBx3HL96VKYv2ZnsqmQy5ku2bQwgvCqAy8p78pJiBhnaidsxcT/gbwhOdghTz+SL+56lcG6zvfom73j74HpnAB5UtlRjHQ3+y215vC2D6YHFrTM6eESmLn8Z1IZ5iDPz42UlYhhOg/+e/zOYGHTSd96w6w6B/4/D10u2m78Pt7xUJLezu7bBn7T+Ks9IS6Ql3HSPpOudCY/6TUA94rON2lJW6POA1HUT9BRCWmX9aUJWgTD9zL4AcavX7JkHFtnykideUeHkXpHgzR+9bTFDSdrQF6zCFGMDLpvCAEDTc+ATN8TK+vvPomHIZcWxw+I3je6rs+nWa0MDN/HtWqNlPMnFVJNFr2r7/UgVrvLejEhofizCBid4G8pn6bkYgZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(38070700021)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jvZUBOKzkmgWZSr9z710VjOlrATRBBWXVXqwYoUHIuKcWXVJsFNrWudu5OAE?=
 =?us-ascii?Q?awvT/2DZ7iWpqwWxehckobu/WQphk2WMSaNY0OcsMp0vTiYiJLgfJfi4Kahx?=
 =?us-ascii?Q?V37n7Er5BQpR6l2CI+1194sUdLiJIEtm0A/eB6T0cTfGKrw9uL71TOAr2rXn?=
 =?us-ascii?Q?TiWt6w+mEW50qoBMYBtjYATbQViEHgw/pwbDP/NSYNYNcrjeNZYQfGPwcIxI?=
 =?us-ascii?Q?ARLmBkIUYC8CgYn8BCmV2JywHLGiOR/fbO3NMEK8vZos37ZoIXIDI+hGqo+5?=
 =?us-ascii?Q?bdCFvx6zVl5TPgGrzcgCHMx3JOqBi6Z+/t+HtNGbHyqzQq6o6J47S7wdp1d5?=
 =?us-ascii?Q?WYwOdKa11ol5CqpVgHY/9tfKvp3/JTabqDkD3mKqGKhycYS68PWaddRhRqxU?=
 =?us-ascii?Q?I2R/hij/2ieW7Jk659pNX0jAmCKX/g37wGYUjoD0dEsGMgId+ie9kSB8PxqB?=
 =?us-ascii?Q?gqJXWX2kB3TCdqjwis3+0ZjayUOikddJI/dkh8ibe7isT+KYq2VjCcd0uhRn?=
 =?us-ascii?Q?EOIk1ngjGbXQievlqgk3N5Ob0YLpcVV1rggZb/PsMT3AbSduVZXNAY24/I2f?=
 =?us-ascii?Q?rfn9L39GpoEmacSwEFfo8B/YsVSeUsJiV/Vu+tfRN4532mFKxJkkH/Oa98qD?=
 =?us-ascii?Q?l1sIzxyzd6SxN44fqTAO4wk9dBzNkUAo6tEWIdeRyqXStviF6SaLgyYbKRFs?=
 =?us-ascii?Q?ZFnp92VKt0DRDp5gGubWM1y/uwU89g+kR+LV9cn1M4/GHUSyqnO60J+1TlJW?=
 =?us-ascii?Q?MZZoqduAi10fL2LJN2ZtkRRU+JwwT03rMUK/hXSbfHPPm0/BuPOLkr7e+ykc?=
 =?us-ascii?Q?1WVsJ8sSBH0aWCPbErvyPBejF5Vh5/HDADtL9Sxpbu6gcJ4vv3pSj6PxdqG2?=
 =?us-ascii?Q?/LBMpYqfE6B6hDSasAua/ZdRsXi3b4lKlrTMn7Ahp4jkWxUluUAqZ21oqmIR?=
 =?us-ascii?Q?nZdZ3HFEx202+47ibWUx//Estg2+AXbS/YCI1HRJnzeWDFbbvsSShboU01I3?=
 =?us-ascii?Q?qh/ViOPGOYcU2IxWacS242GrShnN0NnTYj6P82nthv8uMZqPvwxcs8Uf6K7m?=
 =?us-ascii?Q?LnGAYNHZZ9iPlkPI2S70QlxrNWXjU2iRabM6BC9WzY1/O1mrRMRzm/OgMyRD?=
 =?us-ascii?Q?Zps6Y2oL885fpeI563ahScQey+mqd21C1CfVvZwle3dz1X6T8gwP9blTmY7+?=
 =?us-ascii?Q?RElDd13fyNZrdXyCTdUsciRC0mSHepG5/0uxQRLSfYZKjdd40czX3N5WNitq?=
 =?us-ascii?Q?Tp/Sawjnd+Qrp3i0JoPcKSHT8k9YPPhwc406SdGFuceVK9duqhSBe3nfoDmF?=
 =?us-ascii?Q?/2RZPvTCy2TWFvB4pEU2r5KFGRT0k0NuPpCWho6ndA2hAGFNySWSeej+l46Y?=
 =?us-ascii?Q?6hDGodUwWCcRhdU+M3CrFw4EUEWLKXxr4acTPBwsGqxjhb2c2KNZ4+SbToW1?=
 =?us-ascii?Q?ehvNCbIaCFvNSEgJV8SdQt/cExRTrD1EGUUtKNb9iAmlMIzRx4hQaAcvWpVt?=
 =?us-ascii?Q?8OAkoiz+2WP8q0lF2YwAhti2eQESl6IHZVNZqiYozKwnW0BM0mzypaRsOero?=
 =?us-ascii?Q?691O2EGWPJf5mcTTC0N8lHpQeso79n8Cpy1abySPlTFaKm/xAgFn1EIYK63v?=
 =?us-ascii?Q?bYwHXv+GReUy+3o+RvbjkcSK1wlkwqmxg5gZwN/cuTqF8UXWlikmvn5RzuJR?=
 =?us-ascii?Q?TfP2MP2hqAboHSON3YBI/lPItNBtJePU2cO+K3d1IZ/v9aLAkpU0uV59BfVQ?=
 =?us-ascii?Q?glMy055F3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db3b5e-9c74-4ee3-16a6-08deb00f412b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 10:14:29.7313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMCc3383f/LmAihgwtmOLlDnr3hpGlXaGwSOy1vU3E/LuHZ0GbOSnI7FMlefVdtQgGGMfMc4PFg71N9OmS1GAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236876



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> lists.openembedded.org
> Sent: Tuesday, May 12, 2026 12:10 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
> ensure version checks are correct
>=20
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> These recipes didn't set PV, which by default is 1.0. This isn't correct:

This is probably old commit message that claims PV being 1.0.
I can see version provided in filename of recipes being updated in this com=
mit.

> upstream does provide date-based tags that can be used to perform version
> upgrades.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ve.bb =3D> sbom-cve-check-update-cvelist-native_2026-05-07.bb} | 2 +-
>  ...bb =3D> sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cveli=
st-
> native.bb =3D> sbom-cve-check-update-cvelist-native_2026-05-07.bb} (88%)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-
> native.bb =3D> sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (90=
%)
>=20
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-c=
velist-
> native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-
> cvelist-native_2026-05-07.bb
> similarity index 88%
> rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-
> cvelist-native.bb
> rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-
> cvelist-native_2026-05-07.bb
> index 3763e7f21f..7670172c40 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-
> native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-
> native_2026-05-07.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
>  SRC_URI =3D
> "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;protocol=3Dhttps=
;destsuffix=3D"
>  SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
>=20
> -# cve_2026-05-07_1300Z
>  SRCREV =3D "dd0e93c75034d0167498174c886a56729edc44de"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>.+)_baseline"
>=20
>  require sbom-cve-check-update-db.inc
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-n=
vd-
> native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nv=
d-
> native_2026.05.07-000006.bb
> similarity index 90%
> rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-
> nvd-native.bb
> rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-
> native_2026.05.07-000006.bb
> index 26a14e6eb1..02446e30ce 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-
> native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-
> native_2026.05.07-000006.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-
> feeds"
>  SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-
> feeds.git;branch=3Dmain;protocol=3Dhttps;destsuffix=3D"
>  SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
>=20
> -# v2026.05.07-000006
>  SRCREV =3D "72d8841c8ad9083ebf6723063f275444ea0d76f9"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.+)"
>=20
>  require sbom-cve-check-update-db.inc
> --
> 2.47.3


