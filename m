Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC290CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:52:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.web11.30447.1759744330439502601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H4FafZva;
 spf=pass (domain: siemens.com, ip: 52.101.84.34, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtQGX6L/K2ps+VgFYcfFPQ9u5oD3Fvd9oVk3MtVaJzFiMiuWUSMSFuzYEW1W471ZdsEiLzYNu48MT13CDUf84K70NPNxWAvml2Gc1EIM/k2FSZl1OQuKN78tZLCW0ZmnMe3cyDK8EXZ385ARivtGN3ajgEjnyY9SGX2t0ClFE33mgpysojGAe14m9wwRADUu4n46ayIETpQv4iZ9k5m92UpIX7xOEWEtlPcFRZE+hpH/CUyez7EPfvo7tUjQLW5hdVYKAgFgQj8uWO6N7+tXKyduPoYtZHutw6204nBxllFlwG1LI3Cr8eLPCwo3vwa/aYOqy5K0NX7QzEzIk9vTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTaok0zflwIFKkpEY0ErDRaku5VErpAde01ZwikR5GA=;
 b=goBi1vlxaPAPzA4HZZj9EM4Z2CD0uhLA2p+mBEq1YQX9dxNUB3zmMjiF49fcITpUo5qTU8ur/ph9ByQ7DbYlTbAC0scwDgAW1PN+G2P82aQ6CHOOms9KzHcdwA5RQqCr9OU/JrZa7Ul9GHww2mgUoJ80DhZIQ3iqYicnsJddu+ch+PV2pSFTQPpZug3nge8m1JeD5CGipZESis2fndzwy19dJyTMb+lvEIzGclBXoYj8VedUrYamD7BmC0PeNl1XBFgVBMiAw4vxd3IyMUUo0aXQ9LVNCWCjROIffiQtGRTueaptiXDJF9YkVpqHPTEuiqFi6kVE/6cSNWtnwlP7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTaok0zflwIFKkpEY0ErDRaku5VErpAde01ZwikR5GA=;
 b=H4FafZva2KkMd3V/r0J65gp5So2Uof/UF/wmdMp5BMf/7LmwDKl1f9HWcG1qdwBWzdQWI9kk4fZ9EntA9EpncDBKc5WFlPJaumqgumvjNa0bW6SKTIqP15YNiGcyGNX9UHEgbdlnyqIZfYC+aOTaJZPenWa3lcSlx3m5LNoYriMJmSEOroIYqFnj+YnO1OeocWQoo44N7BTkFRhHuubN+BBCIG3Tqko8wub9JwWPkGfLcTJ+NcsZIucDJLCBnWXiOHppcN/P7iIheT755RxA3l7zSW0fQ314gKdLN2Av8ps5r3aAbtjSYRfNolbOZ2sYiym6gtJH9eAjBPrt9qtWxg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8378.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:52:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9182.015; Mon, 6 Oct 2025
 09:52:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0.18
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 ->
 3.0.18
Thread-Index: AQHcNpkt7Tgal0Wex0KgeV5nGQ4iYbS04CBQ
Date: Mon, 6 Oct 2025 09:52:06 +0000
Message-ID: 
 <AS1PR10MB56979D4719B7D45235350DB2FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251006081341.3653614-1-archana.polampalli@windriver.com>
In-Reply-To: <20251006081341.3653614-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4b273050-7b6b-4380-9313-b90249dcf0ac;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-06T09:50:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8378:EE_
x-ms-office365-filtering-correlation-id: 045e9e80-3a5f-43fe-981b-08de04be02bb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?uARZqIcOLU1CVn2dZ6pM+yNMMSrbzttjefoYKdrKHqQeZ6jjzSM2x/Ih1NDS?=
 =?us-ascii?Q?ZqHv34Gg2L7qSL3+VHG3/0c8IkwrHs5sj+oZ8V/i6qSFbbzse5+EdN9mTsK+?=
 =?us-ascii?Q?vRvxUs5H67cgCEo2fvuSJ0vTVUoWJs6kbOiUMkPpHohlvR/h4H7r0ZCYCO1n?=
 =?us-ascii?Q?o/L/qtGkDovklxO7wHNE09EEhtRDar//ELthqHU/pVurwKI3oarCQfoQTv0j?=
 =?us-ascii?Q?yRRqWBghZPL3q5q/Aq/e1Zv0dAjgCfr6trkQV7/ff3GzHNgl+m+7u8630eX6?=
 =?us-ascii?Q?3Kv+q3GRNHPwbHucVU7eFUZeatGQdHf5ta7PUcDnWGXU9eueNPBVmlOXT4Ht?=
 =?us-ascii?Q?ccs8yzGuCguhaZoiVOmEmAGp2Rlb6HilqWMSHbUfpiVfhUmFfTvpn9hQWg36?=
 =?us-ascii?Q?xfOk0KzdrWvZO53jUhfW/UAXOeQujGrrwFfVTSrew7J0/uzznVck3a0CTPjA?=
 =?us-ascii?Q?cdEEQcX0fevXE0RVNI7NUWSBqGoUsqCGBlIhpfpPhcY12Nx0dIGRONC54U2q?=
 =?us-ascii?Q?9m7fOQLBh5zKhdtzHLTP7VyUVultYY7RNcCkGkPkAVTejm+VMIhrP3QdFNYS?=
 =?us-ascii?Q?pkYQ3imV4CuuT90BzHhDKo3+tULp8na7fFHA6Apoui+OGyBUHA4yHBp5EpUk?=
 =?us-ascii?Q?pUgjN3gg/ltFCbcIbnmEcsBCi1UK9+1DX/ERWwzacMgD3iyNw1533KwF6K7t?=
 =?us-ascii?Q?EEM66SyAfMAcEu4A+279ljiShwT5eHj1RA5xzvbgBW0JbrW2dqy5n9egM8BB?=
 =?us-ascii?Q?w5G0/8btKiACGy3rwMSj410kOfXHTXIRt8eC3DHl+njMWvTr7VDAaaAARCqB?=
 =?us-ascii?Q?fg+UnSbxfkO4miKf3eQISKTmcix/yV2nmmZ//kQETZJRq1KVYALrozCWZ+1+?=
 =?us-ascii?Q?5lauG6ExbXwgmzxAJfKyEDYw7h7v07bUQfDpCH1hlUq/wziFm2QAvm+nwzBO?=
 =?us-ascii?Q?RFYJ8tQI7r2pXHSXwTuEI2EtGOiIVtNiByomy5OiBWjJftm3IJtdzOrd7ZT4?=
 =?us-ascii?Q?mwsUqVFyINa74XF/QkkJpj//rrdR0kHzId8UafTzAWhLgx52qdA2s0BEp56r?=
 =?us-ascii?Q?YgU7soJr0buWcvGVOqBM3GTsa/ND1oRdzBGeHEe5YM4ytKX6znntQuN7l08h?=
 =?us-ascii?Q?Lq/TBBCBywSeWgRGdII5DTQVSbQDvpu8T8U9qfqPgY+QR4mcbLJzZ8tNvmKe?=
 =?us-ascii?Q?d0dBlks/NPowGMHE3X3sb2b6EkjCq9EcWUa5lWIp/R5zLxhrq76jWa337bhR?=
 =?us-ascii?Q?2aKaRgMxJSvadSXCPjAer0eMUAMnahFKq5Q/blhqUqM/QmEitbXJdEsIY5Cm?=
 =?us-ascii?Q?xzLugZdP4+vU3mRtA4wRkDi37a+o6mmSUXfl6fv4QRXKqWEOQEQSYw9W7zFx?=
 =?us-ascii?Q?X3wjGdfvjmqxWV1YOTuuKhGBqjXYbH2N9T5BouTuD6MDwf2CeNo0c5xMRwAv?=
 =?us-ascii?Q?oZ381NKmtuWPA3/SiGNFeWe1YRGeMT+R+pPAgaA128uO5DS3ZQYCCuQakMgN?=
 =?us-ascii?Q?TtwBLNhWfLq3ZXrVTKOFeln/DNkO+BZ1ASfg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PCILeT/eu457qr02Jpm8/u+1BTlQG/hQtwGRi2EqqAydllCoXbUybD6exRvd?=
 =?us-ascii?Q?16UCJ9/JLQU5Tk4VYSQGfMMUw4X/qJ1SgVJz0YxabcAe+SOzriRUwRtBcPpT?=
 =?us-ascii?Q?9X1SHYa7TWa6nkmilIVn4c4HMTyEVXfT8gBSK+fT0zDsguYyGFj6z3g5fYg9?=
 =?us-ascii?Q?8zft2+ex/HHRrpHn+l+m1HDlmR5ESlPu1XIKCSzDSAHENhjTGFnnu6Q7Beic?=
 =?us-ascii?Q?aYmf/ULvdlDBNY+zRyWZE1nYI1StzBUCcXYttTC7jBpbOQPjfua0hDJn4X9m?=
 =?us-ascii?Q?Y3w37PXX9ttSFUYav+PO/p362i2FLWfOMqrMuGC8rYSP9JBol+Nb6i9xqrqH?=
 =?us-ascii?Q?2y07jHR5AUZ0DU9xbsd5w4JR73M7l4ZQfSLXMYsBT0HHRITei+KLO63mWv/m?=
 =?us-ascii?Q?UEaxZHOdMxE5s7OReJ/MWkotZDAwDvqId6S1o/MyXjOqcTfj5PjKI9XSjjX6?=
 =?us-ascii?Q?zaI5JcAAB4n1d5n2StfgLrZjMYaI471QvyZyowoREe++4JcgCYN6E4KFhIUN?=
 =?us-ascii?Q?QJTlW7M9Dgvjy/MVrnh8ECMGKhU43pw66w9KEjOs4jrwCvMlj+fsdZCN5aGg?=
 =?us-ascii?Q?omkIQQNKI7rNrZYMGnSbKft9YJz5XAaVq4LlU6rgBLW9xpvrlzQSTwdb5IZc?=
 =?us-ascii?Q?nvDmNMiVKHm31rMrvU3ZVDRA85vQw9j+W8hx985yYXWzuOI/KNoFsEt43fmy?=
 =?us-ascii?Q?To8UoeapHB7MZrZRhMJqMl2UkwC4r/zP+ngIY7Bn987IHxWKS17cZDUZR9lm?=
 =?us-ascii?Q?yF6V6V382bCqDwQY72+0ZCVsHVjW8zXnsncTV6ilHB5uw5SE2t9AGJJYLNTs?=
 =?us-ascii?Q?u4vlRtDNTgFavpV0rJanb14F/rEn52qm7lZQzQ8MCHOstpj+PfUcWH2oDuH1?=
 =?us-ascii?Q?WTA4ySJUGwjyn9okpKLducp2iKm1KRihhKyTGWAmkrn1CH1dt73cQN9AIHTr?=
 =?us-ascii?Q?pZW+ESidPHXpaFqwbstppGTSFy6mzZEO9kjUcz86aMy8qEE6QDM27hPnMd+9?=
 =?us-ascii?Q?36ZAXLUBEhmbO5vx8r6tVodrmrF77Lr5v8pdUF0y0QShd8o7jID65YTKyzU6?=
 =?us-ascii?Q?JBMyCPkDMI9cycDlJVRBcYbX0SwSWZ2UJjQtq/6pnkw6foKerF/hEajaeZEi?=
 =?us-ascii?Q?br6m0Z40tNe4RJHGXjf+HkFJWJVnupBlj8sLl/h8tmeIFGdr3yqT1pUxrGWE?=
 =?us-ascii?Q?mdusQxXVeZYKudeLnjpozMJbLTyOxUQmTyxFNnXKcCUzeSF7ZnQ136fK3q9Z?=
 =?us-ascii?Q?XKZeLY7CMMuXdOmpns7+S81GMSJS+SOlN3mhstdYIyP9ALLfHQGX0oFTIl9Y?=
 =?us-ascii?Q?IwkvA4e6+RIG2T9ELik67JmH/1MDx1zzh3MJEHO0icva6idZD149FjA3hF67?=
 =?us-ascii?Q?karQu3fjnAC0nRundZvIR6Qv3756VaplAZa+dXs4yrNxh5/GIUlENMrDv6eh?=
 =?us-ascii?Q?MvoivTW3KNKVyvb3Em3MEUJWLS5qWEFsX3+EmvhHc7Y85/GzGOEmLTkz9ZxT?=
 =?us-ascii?Q?KrcQj45Vjq2CTI13hTk9HeVEqTfhwvfsOE762f1bd1er6fCDW1SePx0dlXMB?=
 =?us-ascii?Q?jnvLG++A03KN3hylYXDFH9f2jaQI7JRUwYRqeON1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 045e9e80-3a5f-43fe-981b-08de04be02bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 09:52:06.8890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qXy0UI8IHSjxJtQEToM0uva5Q209iMJdgmIFOC+Z4DqNfgbRN3i0iEB6ob/Zj3ACsxq1jAoHluL/pnYkJYClw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 09:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224472

I have sent out another patch which also refreshed patches.
Here I'd like to ask the maintainers regarding patch refresh policy.
Should I be doing it also when the do_patch does not report any fuzz, only =
when some line numbers moved a bit?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Polampalli, Archana via
> lists.openembedded.org
> Sent: Monday, October 6, 2025 10:14
> To: openembedded-core@lists.openembedded.org
> Subject: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0.1=
8
>=20
> From: Archana Polampalli <archana.polampalli@windriver.com>
>=20
> This release incorporates the following bug fixes and mitigations:
> Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
> Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)
>=20
> Changelog:
> https://github.com/openssl/openssl/blob/openssl-3.0.18/NEWS.md#openssl-30
>=20
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../openssl/{openssl_3.0.17.bb =3D> openssl_3.0.18.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb =3D>
> openssl_3.0.18.bb} (99%)
>=20
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
> --
> 2.40.0


