Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D31C83000
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 08:27:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.web11.34535.1751272036797147584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=r4a945Bc;
 spf=pass (domain: siemens.com, ip: 40.107.159.64, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO7Yaxy8+YCJ6kjlSNbXaCbaX4vjtY9IvG+bX+VOC5SYEIHi2i/nGQjvMS8B8wiXYszwooUMrtrSnBllHYztsFufPgLXMjXDQSEGgoKUdTP0o4i9hlEToFTcAzOs2c8/fTR5mxpeDlC+I4Nzjs1CIFVzn5uyGjIDp8p+kwADpL09QrBctcK8TGV8SZKZgNNKfDYaiRFYLzd4j6Z3S7mrxRNUJTNLXtvkL5/4zZhvyvrr2WaFr+b4dzax4Dz3KwsoNTDZ9zsHL26IUYg+HeS8BjR2sPDPNrFEA0s28kKKK5K0Ny0vgR7FUNdkyhx4QNGrwZ9458MGFdHnwcgi2Ee1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI5A1q0NoZC6KZZpJ6ByrPHMKFFgZpW4jDpOGgwYkjk=;
 b=QlM2JnfvMnGo9w1mFJXyJQ4iL9yuo0x66ft54xa3P8CmQ8/LU0Cx2++a6Sayn9lF9Uvyd5sU78wHP7eTNzCasx+jwXQLcIxujDC0yliJ6cP32uvvYUvyR20noVE1I79LvqhdVkYtdLFeEbSQSpECtfDMb6g4cyHluGG4w1RiV79KAvFDq1YcHN0Spe9YIpTu3GH015QMRZWTmoSthJ92jgnFajlnSQEWDxnRrRlirJ7pvwfVHeY0F2SFw3tnUObZ7B3Os4hLdvh1Xw4+rNy7fVfwvtYP/9gDKUudigsYMqGpJly7cKKeUQoubnzWmHAD3mSj9SgO5jPcBpWWqLpwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI5A1q0NoZC6KZZpJ6ByrPHMKFFgZpW4jDpOGgwYkjk=;
 b=r4a945BcgY23tlItVSy8TB1Q14wWZE9gwoIQqyiM+JbYVK6XxhYI41cyV0xFHSTH1z6Ax6a6+XCaqgAJ9qpquPQINeeg1X4dKA9r9DniAUZACbrJIn4saI6tEmr1a12DpE1dV75T5CmOzrZpUi2BaZvrI6vzrQu73dsueAcHTyOM72BtXaohUddfg4iZP/Z/jUH6sNO8yytZ3++RVctjoB7/ATHI8h1XiKL4xO3n9mQqx2fFqSGQaeXDqHo8QAL9JPmvd9IT+apOryM/L4Y2HE2NTBjksivPqXaYys23waxgyvZKRmLLVh/GcUl6NTDVFWOWg47YvmdNUVLnC6pEfA==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by GVXPR10MB8528.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 08:27:12 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%7]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 08:27:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>
Subject: RE: [OE-core][PATCH 1/1] mmc-utils: upgrade to 1.0
Thread-Topic: [OE-core][PATCH 1/1] mmc-utils: upgrade to 1.0
Thread-Index: AQHb6Sdr0yC13Lm8l0qklzPcK9KSurQbXnig
Date: Mon, 30 Jun 2025 08:27:12 +0000
Message-ID: 
 <PA4PR10MB5707527D7E9B805772223A6DFD46A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250627101544.1836102-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250627101544.1836102-1-dario.binacchi@amarulasolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=239ac715-3554-4cd8-af02-5cbab766e86c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-30T08:24:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|GVXPR10MB8528:EE_
x-ms-office365-filtering-correlation-id: f7f5286e-e534-429d-3925-08ddb7afe9d2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cXhm7WWkYDK+OH9RZ0g0cwSZan9bO/SCo/2ycLJww4XRR37vioQLH0J+fISK?=
 =?us-ascii?Q?4bgO2qqXWQqiDnv8ZAdnZybSlF04enBFRbTDHUa+byTfhDk4BpOGsBGi2wSN?=
 =?us-ascii?Q?e+BSs9m5vhSGnYeuVQDHnEviFT2lkeFcZ75RiwzVn29eY3iyvumSrFaaUeeC?=
 =?us-ascii?Q?JoWboyH+siftQKHxUBkcPR0tDdhcjizOyfQ73hM9ZURcI6ZW6NIox5Z1v8GC?=
 =?us-ascii?Q?iOGHEzpJct7lts4vyz7Z9SI0I3bILXcVFOzTJy4o89kvXEH9WHQ2sUzTOvgs?=
 =?us-ascii?Q?ez0mfkaTZM+FP/qmWTnW4vXrYF+3sED92bQ79YOHmW367Nij/SmReaPTkNrg?=
 =?us-ascii?Q?20+7vQ5nePEUZ9p9KAgED4YR4YKaZxLjaTVe720DcwGYV439fXjGI8pg9Zln?=
 =?us-ascii?Q?T2ZnZbXZ02d7Uus/GXb9ZZQNNMg+lcYFHrUbE2zO6coQt4+nUw4WOUr9lEEc?=
 =?us-ascii?Q?wHd6l1Z+K25WkuiqbGkc1DlBvACsyY+vMRiw3gDRFGjmFcB/aPAQV7o5XNm8?=
 =?us-ascii?Q?bjSoHL9rdbTE1z+El+lY9mS88wxjgNUODnukRLXnwmkLfVCsLDq6UygR2GIc?=
 =?us-ascii?Q?I0WmcuAnVeq70iVhAvUcukom4QRwVW0+rvge7rOU8Rcvq0+QkxRnQ55tTcgu?=
 =?us-ascii?Q?FZNRXZ3quJLWPCoz9N3NX/LLyRkL99z6Lbn9Ua0RQlnEspc7519z8ssoRR64?=
 =?us-ascii?Q?Vn2AnALB2QjjiRFe4oJUAcHdGsyvsGGt3s3W6ysQQitECLdtuhEn/nLHg8+1?=
 =?us-ascii?Q?BVrhoV2bcDKdQam3P4BNE0MPBJo0SApzP9koSF1lE58j0d8Dh8JANiTF2FKV?=
 =?us-ascii?Q?4BhrrYMSMEPHMEIOOPsaV7pLRLttNmnKiUt67mYzf+Wv9YtuK6ELNbMLeE1s?=
 =?us-ascii?Q?4d6RL/YczQyvUjZ82OByyrsxrml8XvL9+CKmNrMxs/aiotcEn/VOtKTMtsOL?=
 =?us-ascii?Q?QBHZ6gKUUaEEw15xaP6kLpv97L3N6mLu9Mj3cPS+PHHOA6/OmtjQU3L8oaYy?=
 =?us-ascii?Q?475qLLJwDHI4xQcUND/lfse//f+1ZSz8OBOKaS4OsOmibLvUmPIunt1e3F8N?=
 =?us-ascii?Q?p2PahaPm0t5RYLBXZKiQRe7lCt308yzWMOHnwRe6cjg0JruccucTL51oVjJ2?=
 =?us-ascii?Q?+YJ4VUfFIcAptpVvpRd343o/3blkstT3IPxfogf5DvVK0oebDPso/H+aVY2Q?=
 =?us-ascii?Q?zq5qKy2t8LroD9yNm3AXwhVyEgsJ5nMQKEBRuCjDeOombIc22svE2GGMtnvl?=
 =?us-ascii?Q?5c1GucRLiXJZascF/UtLlr78/l2qrIBdwe58tQTXFGFS9QsRjCWPOsEP4C+0?=
 =?us-ascii?Q?Kmn6n82QlfV6+nBJm1ZXq9Kl49FNLD8oXQlcGcT6xQr/HBVy2weKDLmXpEec?=
 =?us-ascii?Q?RjZuPrcE+1esraOsuRkAopRNx94tD+JdU6q8gd/AkalUmcR0ToE0Tkq1LDz4?=
 =?us-ascii?Q?qi3u3CB4lZew+25LXnN4tkdYVmET122F7wW6NudAVvAbvOM0A16zsA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xT3IZG02dLPLAe83ApHpwbTdIxk0DnnmkucAFIBzMpbgoLJ5+9VpxrsyuE2a?=
 =?us-ascii?Q?kQUsFw5WR78yWi0MFX93ZSZFjDtQIr7Er9gtGyGHXS7RZpiQfXTKUcgF3PjI?=
 =?us-ascii?Q?VyS7ISoBMnOeEDIZTMa8Bisq7QYcyWLtwv03NizDISTGPXErADAAvZwZleaj?=
 =?us-ascii?Q?fHXnUHSNkYlf9XWWOVTop4CJ1aFpowpJrOPTYBVJ1zDJpKP9dm/am9cPnr03?=
 =?us-ascii?Q?L4TuDQHoVOyVIR164C8tiVFoueCZN08yA8ddjaVgTkCgXTrREuGkrrOnRZQj?=
 =?us-ascii?Q?8XrRNgXtlkOQ7zW+Rd+aHMDXz5c5fHT67L6QpzAmbl1wBWEPYzuHDpavRgJH?=
 =?us-ascii?Q?idDJpedBlG6fKOTBY4Z4pkmpuooF9cJzihdb2NmRbBGP8FvhnGeI3StrJkWH?=
 =?us-ascii?Q?maHgkGCQbliE9MEZ8x+z1as92xJOeBRY86DnUpenyED5BuqGOdaNnPl3BhaJ?=
 =?us-ascii?Q?NDQNTahF2Q76rHx3aRxNUkrONvNbZ4C4JUcgtqD2meSma/YwTlitWORs7htv?=
 =?us-ascii?Q?z9sTBG62x0jpl3V+fh1IbjRqofuc/W/XmIdEyubB+ZXwmLyWqrUM9XjVaQuI?=
 =?us-ascii?Q?VORRcQR4ZNyMffLSoIqTSId7oq8njrYJGsFvLDnjqwN6/qIXTkV5BCKT/kzx?=
 =?us-ascii?Q?rkSXHjXcYMwAQXA3K6BSC6IxDHPuvlf9zcEJjDQ1EwA+oE5lZsYTMBwriPO1?=
 =?us-ascii?Q?yG8AA/06wj7ycBvKH0wVuIzYHiKPw7M+KGdXisjoAYGZAKeef/0w4pgHtYTj?=
 =?us-ascii?Q?fK+j4w7XKzztOPunq5cUAmiGrPhtH4si6V3I8asvPps2LaQnCsSqE2mV+0ZV?=
 =?us-ascii?Q?F4S80uaCXeTs2i0kZkStr/1YJ1ZqzUsFbCCrzQSVDu89+3Sn5jFB8V2ENHft?=
 =?us-ascii?Q?wyamu+0cpX/m+l+fNDAc7iM/teGT1mm2zd2+Gz9HaWN5jNLV+EkcgGHceAJQ?=
 =?us-ascii?Q?rGRHYhZi/bvfJ/T73p7B3kGBZKZlc0lBipk0uRBhG4AMUw08sFy/8BgCYSjs?=
 =?us-ascii?Q?a4G7xHSuNZiqorOuv1PMnycoNMYc/YxR+MhxVjCGihiOlFbPrN+9Mv6MgefY?=
 =?us-ascii?Q?f2Oi0oYCnz2YYPKwRRqvYbbkb3hkvVkdpkSDHxwycwda1U5A8IpDneeqellt?=
 =?us-ascii?Q?s8QkdkBneft2Amj6Vbw/kcxPdES/2uex5ZvsKjLs3vXff5g7kZTy+nESsJ49?=
 =?us-ascii?Q?H9MOMjLeioBUFZ7TmtIvn78tnKFoR0i53K1caVFOO53GQx2OJmVBaM8C8Hwp?=
 =?us-ascii?Q?EpLhfUC1L8DJuUF1tgBr4vAq2UzP8vix115hMoP7il6AFBjqs0YLMH8baSDx?=
 =?us-ascii?Q?jIad6uLx5hJIM2D8CF3O7alSn0VgYKCT6tTSkafHwNzN4nBOo7Bq3WF5KLzy?=
 =?us-ascii?Q?zmTngblX6tgFNBJ5QsQJ6Mnc9XzwjXY60QCkWPewLDCiEUTYNl09K+b6avxd?=
 =?us-ascii?Q?xKWLx9ZFNZeCpZdnfJEzxpCTqqkr9hyXuzY81hiecFDN1XbYB5oZj8zcg6R7?=
 =?us-ascii?Q?IpjaIlistb/TJdM8D41m2WAPHC32Iw9vHG/ChuFbO0fyoDGsQe1MeNW9MX/s?=
 =?us-ascii?Q?8GOL9LQ+6wjT7yn035eqcr/5Tgp0dezyRDGZvx3v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f5286e-e534-429d-3925-08ddb7afe9d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 08:27:12.6452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exJ2lsqFslx9XqrUWp+bEf+lu/BnPEqNfa7qV9+eZQAL7R/4lNOHXeFJaY0+nhrUfkMTtgW68s2ZwEbd9ryMaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219459



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Dario Binacchi via
> lists.openembedded.org
> Sent: Friday, June 27, 2025 12:16
> To: openembedded-core@lists.openembedded.org
> Cc: linux-amarula@amarulasolutions.com; Dario Binacchi
> <dario.binacchi@amarulasolutions.com>
> Subject: [OE-core][PATCH 1/1] mmc-utils: upgrade to 1.0
>=20
> This is the first tagged version of the package.
>=20
> Change log since last version bump:
>=20
>   d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
>   a23ad7875b89 mmc-utils: Start to use the generic print_usage function
>   e769d44ecb77 mmc-utils: Introduce a generic print_usage function
>   6586fa5535dc mmc-utils: Simplify and streamline print_help function
>   ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct
> Command
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-
> devtools/mmc/mmc-utils_git.bb
> index f3944aebf035..612b146950ca 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://mmc.c;beginline=3D1;endline=3D20;md5=3Dfae32792e20f4d27ade1c5a762=
d16b7d"
>=20
>  SRCBRANCH ?=3D "master"
> -SRCREV =3D "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
> +SRCREV =3D "d8a8358a7207bd81d0c38dca2cf27a48bf411341"
>=20
> -PV =3D "0.1+git"
> +PV =3D "1.0"
>=20
>  SRC_URI =3D "git://git.kernel.org/pub/scm/utils/mmc/mmc-
> utils.git;branch=3D${SRCBRANCH};protocol=3Dhttps"

Please add ";tag=3Dv${PV}" to SRC_URI

Peter

>  UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.43.0


