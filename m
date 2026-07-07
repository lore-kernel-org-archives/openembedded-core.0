Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA5FC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1803.1783441522260058329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 09:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=h4jjQzZf;
 spf=pass (domain: navimatix.de, ip: 52.101.70.120, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpkweFITAKbcUGWD4g96DxsOgbvdgfAXQdLbwrw67dX3CCbk5Df1FAgqNn1/Tt+kn+wMBhVR0s5G2Q4jtnyp3jaM7B178yFjbhEg6NV6FB4L3jzjgp+6hsnFdRnJBYWtVf//ECgJ6BVm0DLimELsmtReGMCXZQViXqXq8aVKaYaJMkrFOEZtcs1t2OmUJ41iY384UftPEC3pUS7utapw9W/fiLgrKgqOMBFD6UBaikyF4M13ll9eI9sDZC1pmZLSGzBgrP6Y2n8ik82FcIWj/z9/uGvOwzQsfNnyhvOHtoVnM9FvzWqL32QRfn1JveGgbs1XvJTV9jse+PvE1TcVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QXli2w9IAmB5Hcd9x/s6svSXFc7iRcMKDrEHT54nvU=;
 b=O6QUtQAbXvs4Ve4ASTmVP6p9Ej0K9odAS3aGffQmNWqonUYNXty+wWbhlv64l8Yu2AqPAx66FP+RsuSMhtGUnnHaTAY1xrp5VXWKYUrtt7mpK63pyVwRZ7Gf1AKRQISNkqOMJElM+EXYBB6rrXVdEZnp6dmXzJFp1X3SQcPC4bOn+99vwZx1dB830n5XMFjhojB4dvtRgO8ErrKnh5q7DGbKnaZb08szdoTFgcedLoVwAWw+eCBuOCgoXinY11xZgsF0qwXX+m7zh087w5H71etdPOzPsW+yYQscUz4wzrzArhCt+bBX6T+yUa7EU8YeRxS288X69/dcUklHny3tBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QXli2w9IAmB5Hcd9x/s6svSXFc7iRcMKDrEHT54nvU=;
 b=h4jjQzZfWEgHeVGFB5YTyGhYr003+hWrbfMdsJmwMktHGY7qPuBuCdZO5+s9XwuY6eo3P2EpGICbtJ5PaDPQuiab8oP9L/3Mhc87jKt7MxL8Vdd+WPfXmNnok2ClI19TSmLTIj3R18K41uLGuM196ogSx6XuY5KvfOmm33qevzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB10847.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:21b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 16:25:16 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Tue, 7 Jul 2026 16:25:15 +0000
Date: Tue, 7 Jul 2026 18:25:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: leon.anavi@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using
 systemd
Message-ID: <ak0mCn1v18QBHsYI@navimatix.de>
References: <20260707090248.417251-1-leon.anavi@konsulko.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="afkh6nxawffhfrmw"
Content-Disposition: inline
In-Reply-To: <20260707090248.417251-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: BE1P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB10847:EE_
X-MS-Office365-Filtering-Correlation-Id: b742e933-9c3a-4690-3c01-08dedc4452c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	1e1DeGqx5KiSdk8aZ83oVtUb4amwyHletpEdyrOY+ZIBox6NERxtGylctzYo00B2ZIQi3+ab2TlmIWe/331YMBhBsZAkABFan31oLHe3SZfmuRvQY6dXjCr5zaCmlGw25SMxSo3nmIGDRfbtTcadJch2yg0tGa7PudSZVf/Yc3Tr252wy7R2AZFdarMY0iM27CyfgYHX/VtYDFrI0X9drxvxn0JEPrCjaOf6sk8XTYzMouNKH+u4THhSkeGb/cZHYdld/uBon/YpHOZLGZEKjP6koibWc9ZSXzuYjAO4FzNX7+nJXtf7O95f5duqYugASEyOJ6/7cMsMagXwKYoBlaoxxIftP36lRJhFMcP6bgE7oFynOpTEf9pFKD+HAndccKHPH3Tht8CpNvFhyJ+Ta5OQQFXDmYU78oBr/vYr65z8waTl20cYFIPf9dDCwqG4E9q/zvbqcJkQFEPlJyQQpgzAsc/AAib8JYyWgWXhXgKa/jbWKS8dNjkX6732QqflWYrEt1MhgBDwRnOncxsiBbaxObCaxhKbHsCBLRkaOMWrFuzm/wVVSAusl0ISdJ+i4KbznQX+twT8x955ainamwlhnLnk71Wcy6shqEjxa+Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?b05R6aI6WpegyZ/V2XsYueTiS+pIvgwjs/J+KExw7m/S71ge/819nuCT/A?=
 =?iso-8859-1?Q?Dv9TkGqfUSbDRhZWp/UnZj6GI9AKyy/G/8VYOFs7jRCuoJ4RWcsNZ4kdVN?=
 =?iso-8859-1?Q?BFavf0XJomzwbI24oBoLak12lM5PmXFO+19KBIpZ6dq/ZYhmidhQ/F7PWC?=
 =?iso-8859-1?Q?7D/jTxJrmSRcFLjnF/vpk5i4YGmC9E3BXCLt+5dRfc+N5twe7uEzsKHNeJ?=
 =?iso-8859-1?Q?mFfh8ZLsMEoQWR5ZShBl7NjN4esPEszDSsMidYUd/2ajytfknQGAHnnj0U?=
 =?iso-8859-1?Q?mAgBfHV8sItZZwEBkn/ZtXCFqGni0HBlEXHI7JwbML/j9eoKQQkLM+fFoc?=
 =?iso-8859-1?Q?4+5OZnUYIZHNIPTxwFXaUJn9EWD3PK12MXsQMU00UnECpyv8htZq3PSQDN?=
 =?iso-8859-1?Q?zw7i2Io0ML2I1VrrZNhABRNAnGcPVPd1PrdPeswzjO7mrive+gHYQlBHVF?=
 =?iso-8859-1?Q?2aGRneiIDJNdCXlarHk58bR+QoMaqI/qetmTKG2vEOjOgIcA6PFFahqANd?=
 =?iso-8859-1?Q?WtO8+j+78DKnjBem47eHYRR8NMIHfvC7ChPPU+o1BcisF6Cu+uKI8ukBS6?=
 =?iso-8859-1?Q?CBt0M4FVsW89GpJZ1Z9StUYFj9pG9ETqH8e3HvwsOiYax9jmihi1c9T3bf?=
 =?iso-8859-1?Q?P9S+quu+Y/k7nw9vBlncJD1MBw9ZoTZ1Ems7g5y86Tf0fcQt5uWpL7Buhk?=
 =?iso-8859-1?Q?Tt/t3KwAR9C9N6l2gBcEs72RPlseoYiPSexRKUEo0kZQ/6I9M/Q6jwoeRI?=
 =?iso-8859-1?Q?lu3ntBUIBLjYf49i6XEIcJDuVqPNj+BWFQyMxCISDiFgu5VIjqcaZjsWus?=
 =?iso-8859-1?Q?z2oczyIXr08WhlgUIMAFFZuolZSMydTHUBkxdtZ9LZdentYolhH4uvNcA0?=
 =?iso-8859-1?Q?1ssNWQRWHMSk+HNi3FV/mEsWz9nfJwWdtCfH2wzJ/erOGLiOOxfCgfvGpY?=
 =?iso-8859-1?Q?x61qyWVb1AhvysZHN5jKocEpONl5EV7ncGBf7UhSykJ5cPJzNXnp2G+jdI?=
 =?iso-8859-1?Q?BoJVPEONb6w0DYwrE+B8d8y8UxCowe/Snds7jPLXJ4MLZsAakcTpmiFyMv?=
 =?iso-8859-1?Q?g5FgnhGAWUR872jnR8dUG1yAzhZ81TZOdd4yE3k1wZm2EJkkC8gFN2lThl?=
 =?iso-8859-1?Q?dSPF0I8pAj2tYMPP4VvAJMvY2VDo4mU4cXCPaRxoBj3g/HWDwC3+H/LZUm?=
 =?iso-8859-1?Q?xc5DiBau4bHoawcamMmg26fOoJC6HeHUfvR4z5Ot5PTOjYyJunAkwrQrI2?=
 =?iso-8859-1?Q?Hv6UYynd6D7L84FgEIhKzKIVIFJrGwJENv4nl5XI5sR+ykuWuzLTLGaxPU?=
 =?iso-8859-1?Q?CfUWk0nPF2wIkVMYsvSRiX9Q8a76b3PElJiwK+P6lwXzInX8F8xK7i65ds?=
 =?iso-8859-1?Q?bb2ka8BLZB4IMbwe4TRCasJyVWPUWlqqlg8ZwxK6tPYdtHMugr2JQeSjbw?=
 =?iso-8859-1?Q?YknnpXyk9KMEgcqs2H93hcdoDXYINnFKZ0yQHVp+glExK6EXaNlHf3kKaC?=
 =?iso-8859-1?Q?9lRR8nMRH4AxMLzyJzLd756719aaWFOxjXnw2PIvwpJRZSnH9z1KwBhx8D?=
 =?iso-8859-1?Q?XvkgDdNPf376Qy+GdaQM2bhI1Y3gvB5Xu+D/zNSXj4ptPSYu/VIwa3UMwy?=
 =?iso-8859-1?Q?G3mly8wYEVr81voBLxCiLCHGiZgfTuESiaMSsAJhq1ZhcebjqkUPPM0G1y?=
 =?iso-8859-1?Q?4/P3uEFVy44X258s/iXYmfgO1rsHGwdhUzPPqIKgSMG29ovzpLPfUcGfSE?=
 =?iso-8859-1?Q?uqYIwskCJRiVhdeB/Eai/AK6sEwIZtGbJqbXFaVvVQfMvHorgvLZ1oOSR1?=
 =?iso-8859-1?Q?AEunWGeocPbmTWEKjHz/kR0r/kqGpd4=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b742e933-9c3a-4690-3c01-08dedc4452c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 16:25:15.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/1BDsexjjB7QWMSGS2EhaRBERL9ohugFO9xtUcIjjOzskYLmVu7kdD7HXe7NsIUh2o9ZEgDbcXxE+aiAy+elTQk5MDqZv15Fl1SHxWWLpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 16:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240403

--afkh6nxawffhfrmw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using
 systemd
MIME-Version: 1.0

Leon Anavi via lists.openembedded.org schrieb am Di 07. Jul, 12:02 (+0300):
> Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
> This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> has been set to systemd. Otherwise having systemd in conjunction
> with wayland but without pam leads to a conflict with the
> REQUIRED_DISTRO_FEATURES for weston related recipes.
>=20
> This adjustment is required following these recent changes that
> switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
>=20
> - 159148f4de2595556fef6e8678578df83383857b
>   meta: Support opting out of any distro features
>   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
>   with wayland and vulkan.)
>=20
> - 0b4061c5d50261f826d0edb4b478d2d305274b7c
>   conf: Switch to systemd by default and simplify init manager selection
>=20
> This fixes issues with test_machine_world when running the
> yocto-check-layer script for BSP layers that include weston in the
> dependency chain, for example meta-tegra:
>=20
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'l4t-=
graphics-demos', 'weston']
>=20
> The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> enabled. Therefore, it makes sense to also add pam to the defaults
> through DISTRO_FEATURES in init-manager-systemd.inc.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta/conf/distro/include/init-manager-systemd.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/con=
f/distro/include/init-manager-systemd.inc
> index 63fd225ca5..2e9eef24b5 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -1,5 +1,5 @@
>  # Use systemd for system initialization
> -DISTRO_FEATURES:append =3D " systemd usrmerge"
> +DISTRO_FEATURES:append =3D " systemd usrmerge pam"

systemd and usrmerge are required features for systemd. But pam is optional
and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.

On the other side: Is pam so much common that it should be enabled by
default? Why not leave this decision to the distro or the local.conf when
the user selects the content of the image?


Kind regards, J=F6rg

>  VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
>  VIRTUAL-RUNTIME_initscripts ??=3D ""
>  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> --=20
> 2.47.3
>=20

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--afkh6nxawffhfrmw
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcwNzE2MjUxMFowLwYJKoZIhvcNAQkE
MSIEIGel+vXKFhaTOlhk0ZnZQ0EKHdQfav3OL9WU9ytC3h72MDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQAq8qpoyEO17hhcDi+QKfuhw+/Yxj1MiT7SUOgCWY/H6MJUUEUdtxSMnBinJMY6kjlmJaKt
EKDzui9/e5iirX7/YMYKKiHE6NVNY0inNV8ZJRYSNcwaAnr4xHQU5RKTmwgexBmxJiTR4F+R
iFGnkXdWiMEP/5KlyduFFRyjvjKCkW5I1G847W86VW67Ps0xCxKE0eIRy6B7h8FnyP6WG01l
KxvOxBFwMn8WZ69gKO9++QRQiLDcSstnYeXtwu0xgFpeqpAbiG9ub5yyo8+CddRKx3DiwHPI
5qvK+Urmr8AyRCEDBl3BZlxHVF5YAKWCELRsFAOw2Ly1vuekXDOPIwwB

--afkh6nxawffhfrmw--

