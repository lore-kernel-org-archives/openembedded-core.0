Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CBFC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:59:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web11.14835.1743177547506212484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Yx1LChTT;
 spf=pass (domain: siemens.com, ip: 40.107.22.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+Lt1GCE6CXet+EuCmJGBavHxXQP+5bp6+mxsU5L1fCzYgjhXHrcc5WVhrODfaguTlADuP7FuSvDSvedM+v870jMLB8KGuHEdDdsHbaNgq6WLH8By7pGXg3hoKxt5JWk0ZMDQi7BceGs1at6wD9hAG3Nv4GWT+L/pk+s++ZO4mqFLxc6jz0zVF1VPskaLtTe75v8/kAs4cI8b6qF2RUe05qEwv+BIZU0mfLIu/doYQ283odIaLnnttYlBtJ/xwpW6QeiPrV7gOgpFv7WG339zHUukyGktj1M5xKYW8LDtT11+C9eQw0dVO2TEf4dxShaZxMrMe9JHG1XPfArKtyJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV6x7UJI1vfqLc556+egGYv0iRCFDG6gk7vNXNMXoN4=;
 b=N1KDIzw4u0W3oyyZ3OY0wUS6y9kuOFv0bDTgMlZkUdq43p7SdT8nUf40WNoIQQYjIs0a2XxhmfcY8rXC7ToLZGmjZVfh5dvNR7Hl1u8aaIBHV4YScCo3YtgMm/1t77hMrO6gi2zDPvVNHAjGNCuSDdCnCJyFqyMrurhop98LBskSDFMnJ7uIvQ74xd1YkM9jttNPRR852l00pbp4Juc1AgrxSCpY5fNKWS8q7qSwLDJ6DwnyAzq3yCCdVdVGBIORnoYnp3Ks7dbf/N7710r29DUXXLG6T1KenOpeX5XmEhFfi8ooLPsOpz5dV4Wqod/g7b1qMEV5KO6news1rTtnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV6x7UJI1vfqLc556+egGYv0iRCFDG6gk7vNXNMXoN4=;
 b=Yx1LChTTspy1W1gMTxC5/hRf8PaiaF/D9UG9fTOkP1D4tTDh8z3IdfbobDkYqREVwq5Ui4P4e56KpuxcyYbX7RPYk1SwYU6XoxMuwrb0q+cyrIjiGmLURScBuv3n1MKeHD/DnCltNh7zu7mgDyYfQemu6H4jrRAfUQzN4Kb8SmhJElug/dx6j992cqDYndWmBmLJTKfteL3OG51LLxml+f5VLkQ0n/pwCA24O1qC/mnN5hcliX5OU699Zy79Oszf8rdyRbiBUZiO7eQcmzVv3pPqaU4cFy1alPDkQZPKVGD2iysSODJOn6rbn0vsWkG2ufvwSq4Xyw6aDiL3kwnZSA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB9003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:451::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:59:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:59:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, Marta Rybczynska <rybczynska@gmail.com>
Subject: RE: [OE-core][PATCH] cve-update-nvd2-native: handle missing
 vulnStatus
Thread-Topic: [OE-core][PATCH] cve-update-nvd2-native: handle missing
 vulnStatus
Thread-Index: AQHbn/jbkrKKEm9qb0CFRhKE4f8AtrOIs04A
Date: Fri, 28 Mar 2025 15:59:04 +0000
Message-ID: 
 <AS1PR10MB569714EB15C26420109E5BA0FDA02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <183102268539BD3E.31520@lists.openembedded.org>
In-Reply-To: <183102268539BD3E.31520@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fd45f5e2-dcb6-405e-b582-9aea7f2dafc3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-28T15:54:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB9003:EE_
x-ms-office365-filtering-correlation-id: ed2936a6-9d85-44ef-fbbb-08dd6e1176eb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?IvQFR3uMGq7ilO0MBP5MGKiHbbbaBmfaa2koVeLyi+jAY5EPgaMmNHoF5yfd?=
 =?us-ascii?Q?GNMLzZchm4FaRX+w3S/XUY/LTFO4OLqcv7EUtlvPUuGqHk1OkExJU3yhKbI4?=
 =?us-ascii?Q?pA08s3s5pMMO/gKYNit+arLSIYOgTyQW9o2FLR6xn/X1JAPUjUwUFo9G1wnZ?=
 =?us-ascii?Q?+esooPF+2DtKzI/hwt6fmIByGw3K7GUwFot2rNQXPpgr4LCunmZCQHS4n/1J?=
 =?us-ascii?Q?fysuRredF9K+0/f57+xbH61YKVokc08sEm1k0UcavutszTDhL5JIQUpvhB7y?=
 =?us-ascii?Q?SgvcKLYANiMroyBnVIIjRAD6IWmA6n49hoGL7HwzZxufbUTAFEvIFx+SxR2u?=
 =?us-ascii?Q?QMGul7t97wQcLxIxHbj8M3ZTHP0k2ZaNJDenDw87Ru1ItsGKBJ0dD/Od/nKQ?=
 =?us-ascii?Q?95s4QfOOHW6OawNkGMe4FLfUnvv/6bOPi8PfVfLbDpnp+VtikEEa0YpuKP1u?=
 =?us-ascii?Q?j+3dUw1CfoeTrQXQNgZcLkavSXkqwRqImYkDL25f5fO+GOshYb0CJ/WWwpOL?=
 =?us-ascii?Q?XLTUodjLMYkAEWQChOqmo5pFCJiWwPESquWU1akfu0GAWb604ubaIbJlhiev?=
 =?us-ascii?Q?FVBlgnCdrGJ00qPNDYOruZzZoJ+msYRDXAxuykiyn0j4vR3bOg56i0wWaQ3+?=
 =?us-ascii?Q?kRpeX+GwIs6yat28yGmUVK3GeTDrTUdBrMdOP2wQ8HXlPBATzNtoYBlUirPP?=
 =?us-ascii?Q?PeofAQ77ahDdtKW59rmkMg+9vY8we6SjByUe+a3oU6XonjkgNSD3TDuIYixV?=
 =?us-ascii?Q?xzbH++6NsoUM76wDjbCUQMRYpFaJK65AAPuNb/wvmKjK9pY277Un8/FmcCIE?=
 =?us-ascii?Q?Uy7JodeQINR/8W1VFuunbSuS/bSWkwXvQermqlE4wLdhG3wPNfQOC85q5tvl?=
 =?us-ascii?Q?ILfSjTKLvZUSjTxqxyx8mDUPh+zuHePvjvbgeCvt+a3rIRVINcKkY9HFJPYJ?=
 =?us-ascii?Q?lAyMeM+IPQ4dEwFAIVYALLlv7MBb/BJJpMPoIuUrK5vzqD5rIEUZDruAqKrK?=
 =?us-ascii?Q?wJxEcAwpBZK/uLLUHrP1ySpmILeM7OJr8euqb8LUjuM/rQVCu4GH/1YqGQh3?=
 =?us-ascii?Q?Jvo5JU4vvkogRq8AJdnKQm5suiPKfq5rdZRlc/DrnXQc9rcl10SAyxdLwHxP?=
 =?us-ascii?Q?SLwc01hSIpgSNrLrDZ++b+gaTKSE/MIckOBEPdg7gtFDRVwyqwDd3zFzfC5r?=
 =?us-ascii?Q?0GCUMQ6U1d05MfpZzPqfGgXPBmte2o0HIp8rgA5nsFY8li3XVwiNi7BhaGq2?=
 =?us-ascii?Q?pk8BFQ63qmg8svUgoCSrsHZ+nsPBQX9T/WqdKSh0V5ku0bw0tGISKqJzGCI/?=
 =?us-ascii?Q?ZF9Tle1ts8U0xmNaa8ZkiUlDH/NCH/Rz4w9nsBK45qFdyqrlySOWm66JqLQq?=
 =?us-ascii?Q?1c6/cqipm4pqYngGa1dql0dQZ18fVW3N1klAUUyZsB6I2BANp46/4aOvlRXN?=
 =?us-ascii?Q?6VxbZ74ALyOV9mznjS9qSSC9l+4GcXWE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SvTgbWjMe1Un9FY0hiN2UnALzXTmPZdj9Xmvl83i375CffoPKRdYwKiwGOxt?=
 =?us-ascii?Q?iGKoGbMl9zG2nY8+FMSqPdsHthZuSBNe2mDqdyrJ1mJjaNk7dcyGM1xqkNXv?=
 =?us-ascii?Q?fANZGgtBKDmkxk83j0yY/ESi5Ud2vekPLTdQAdaCjmtLPfUIsS6pflyhA5VC?=
 =?us-ascii?Q?u7xF1gnlrNWogkzp+s4i0Qeb7P33+DgcBeFC+ScyZUb4/5uVoIUcV8Tl/By3?=
 =?us-ascii?Q?dE8M18NRXc9ck80czqnv6nHSMuptpvIs1Ae90cZ+YmO8BqCcGTle4inGPtaG?=
 =?us-ascii?Q?rOaE1Ou2cUnHrQrl+vpSHx1G/L/iYfp28PFf4E4+IPydY6Y2zT91GYrog+nP?=
 =?us-ascii?Q?zPZ03GeOrkTEmSLyYCPASHT8yrkIia0oxUQXuA86+N+vNgIJ4O76AKwOi6/n?=
 =?us-ascii?Q?O9CSIru4HxJAt0XyerFqPWX/3qM1RZeR6IBF3FFhtCKtn6su/BuvivDfFyhG?=
 =?us-ascii?Q?oHz4Gpb0qdzwaEtQRa7y8FcX3E13OehzHLDmP06/snQRRuhY2fmF2UC3HapU?=
 =?us-ascii?Q?JM5uzT1c8mACR9TIV0+PqN6DD0DMxAv1G9a4QaDj1a6EDqnflpUYjhu26ESv?=
 =?us-ascii?Q?jwgpavewHdgJ/s0FYcre/if69rJ5+wnCFf+33NhdPuD6s016/qCjNtu8vG+g?=
 =?us-ascii?Q?ttudEroDn02pptmSeI3YCPZwnkzZLueoy485XSegtjwq+kLs5xz524fKH6CK?=
 =?us-ascii?Q?lt19ZrLRNloOnJGK18kUyCAegnR2zTB9FaP2ddxiZ9A7SCMTfnf3jLF5GxOR?=
 =?us-ascii?Q?EMued3GlXS0YuugQOtydGxEQmL5fC+rboM/YRGd60J1daCGP//uvppwgs8lG?=
 =?us-ascii?Q?q6BU+G4gPu8eOnOL+PDFabSx+wB8+U/MqVtv4pt/6uQ5h4IghhbJY8lN7r6C?=
 =?us-ascii?Q?MBVT00ZiFr73tkxKtfDSYXECftXVb0pL+xSs8sqdgkLIqvLDp0dxWZ2sS3j1?=
 =?us-ascii?Q?OjvqrTZtoGUk6nM5YRfGTNVYFkA9oLBKBaWu1RttNOERi/6bwm+9Pvh+8hJM?=
 =?us-ascii?Q?U2b+5Zl0DoAs3Va2N74gH75llLQWdYTyp5SczyTDpYbp42HNrUXFnVTVhmoO?=
 =?us-ascii?Q?OZx1winK0e2UOYI1Sb3+UKBFVDNcbS7pT5ozK8Bzdf8RtWyMh/LwfPPcn6mK?=
 =?us-ascii?Q?JgN6dUdaQmx3Dehl1ldwFPLEgI4KiynAKo5n3rGyVLmT43escOZ4tdidFHn5?=
 =?us-ascii?Q?IECpd/0q6fBFtcIjO2EKOXc1RoLGSlskgJ+3c/xRqIkhBCeHD5NrPaOucKR9?=
 =?us-ascii?Q?fTiOKJqfy2feyA7zPEBpOnRycpmwv9nL2mlwGvvz4sqsdK9bwI4GJxiaN7UZ?=
 =?us-ascii?Q?0GSlYln7y4JaxWzmldAvuEShxuU5zXk/rkPDe77zcNwJHqWUkPGwjeIKG3p9?=
 =?us-ascii?Q?LyqQHORnIz2jsiUQ+rIw9SWxnytuPNo8tO6J+s1ACh2K1Du3cccbZi+S7hif?=
 =?us-ascii?Q?+OupkRmBE1ljNT3BqAWNwce+6q77RXELy0qhJsXC4EJsL0tT4Vm/etLaU3cq?=
 =?us-ascii?Q?7mnT06iTn/883Wk6KLJCpfO14ybivwREuQV6ccqvvCE9cYnQmlFV0fJgqRY8?=
 =?us-ascii?Q?rmgoYF5PgvqHSzh8N/TEn/n6XjdPvYt2iOrdlPeb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2936a6-9d85-44ef-fbbb-08dd6e1176eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 15:59:04.4607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EStpn/cn2U8CXbq0Wqc2eL/eTJwk7ARoghOHJgduJmb11PlBGG1BDhS+Ur0o+kwTUWG7JGG5AyS7CiFqF7ZpzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213857

dunfell and styhead are EOL and not accepting patches, so they will start f=
ailing to update DB.
Shall they be removed from the Valkyrie CVE reports?

Alternatively, they could reuse database fetched by a branch which can proc=
ess CVE feeds.
Or we could also ask NVD to fix this CVE in their API and wait what happens=
.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Friday, March 28, 2025 16:47
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH] cve-update-nvd2-native: handle missing vulnStat=
us
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> There is a new CVE which is missing vulnStatus field:
> https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=3DCVE-2025-2682
>=20
> This leads to:
> File: '<snip>/poky/meta/recipes-core/meta/cve-update-nvd2-native.bb', lin=
eno:
> 336, function: update_db
>      0332:
>      0333:    accessVector =3D None
>      0334:    vectorString =3D None
>      0335:    cveId =3D elt['cve']['id']
>  *** 0336:    if elt['cve']['vulnStatus'] =3D=3D  "Rejected":
>      0337:        c =3D conn.cursor()
>      0338:        c.execute("delete from PRODUCTS where ID =3D ?;", [cveI=
d])
>      0339:        c.execute("delete from NVD where ID =3D ?;", [cveId])
>      0340:        c.close()
> Exception: KeyError: 'vulnStatus'
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-
> core/meta/cve-update-nvd2-native.bb
> index a68a8bb89f..b9c18bf6b6 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -336,7 +336,7 @@ def update_db(conn, elt):
>      accessVector =3D None
>      vectorString =3D None
>      cveId =3D elt['cve']['id']
> -    if elt['cve']['vulnStatus'] =3D=3D  "Rejected":
> +    if elt['cve'].get('vulnStatus') =3D=3D  "Rejected":
>          c =3D conn.cursor()
>          c.execute("delete from PRODUCTS where ID =3D ?;", [cveId])
>          c.execute("delete from NVD where ID =3D ?;", [cveId])

