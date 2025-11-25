Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15D1CFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:45:27 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12907.1764060325428984768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nMYYvA9U;
 spf=pass (domain: siemens.com, ip: 52.101.72.63, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVJ6uV96chL2t2GPps+ITVr9FdzJqbmr6f0RDO+/MeAbUNb8INS1WNWEnJ0w4aLIqYi85yUWyWYQZzEsKLzKuHErjFAfU8DwmOXv8rZPMDZFneRCDktznxfS8xJ7bqdG7c593J8pT72Dhkakbx025w9GNZ0nvuVgwL9jvsBhVL9JoyTcNHv9aFoVB6VXig21d5O4wNPfmsYqHegYdGZkNM/SMLidt8k8enJMq9xsculvA9ksb/PVXsE2+qa+rZ+8Ib3JqjfAQ1PJZUbhATTCytaIDTWQPo1k6KQU5hV+6aWw3jtBAhNCeajU2oUkgldF+SOe1mcYSfoc3XJMRm7PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7FA9Vj6OH22RJcmX6AW9KI59UPoodGcvzd8qmilrZA=;
 b=hd7eoWYOZcs3QZkRN2qP++itLI1QHiqWAtDNF8iEN2fnkJNPazBveFxLijaGjhoB3nrqRU9aj7DaJn3qPC8VWlniTJSFe5dZWj3fd41fczKsLU9PiZh6cF6H7E4ijxv1yFWC7WZVHBjoJxHfL/JEb+030EuEic8wI9IfPIrwdchqy7eqcYgosO9h94pLdR/xWasqfTJqkq+nEwsG+mdM876IBKyDqpfzx0sg7iLsrPd1J8aUOneU58qFZqrS/PtIuhOF/BQy9YkOLehAdNpZAJXn2heC941WsywEuZVhJP+ZqOzzweWHfhazXLK3LdS3ly3FnA0Zcp5c0gq0syk1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7FA9Vj6OH22RJcmX6AW9KI59UPoodGcvzd8qmilrZA=;
 b=nMYYvA9UdAWxlaqZjWAPTewpic5ryMs+ZC32fsRHfiEYmv7OdamhCn+VFpR7EH3W9IQZqPS4cUbyZtuZMLPXjQYne26dlRRaaSiH8QxCkHaeo9+OAPzKU4dIqX6iR1TPgondBNUx7cYP6Yp7Fv2db/9OC5GHrT29NVNCoPOIBZ7fZrFYomabngfA5X/evyf2qOgdQXoeHnP9Jqoa418KPPQMDOc6pkl6mPvXVih+3hAQesqH1ahOEMTdyHcboqcxQFsk5BthxhNXidcHxH6Fvh05fbcFLcdlIxId1YGatqSr1sMCDv73LSk+U0VT1hTyUqkoEyAjuFxx0lUdXYj8Pw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 08:45:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:45:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2rUDECDQ
Date: Tue, 25 Nov 2025 08:45:19 +0000
Message-ID: 
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c23643d-cad5-4db2-8ad1-9b6dc3da2f90;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-25T08:31:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0,
 1;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_ContentBits=1;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Enabled=true;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Method=Standard;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Name=Vertraulich;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SetDate=2025-11-25T08:02:03.697Z;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6252:EE_
x-ms-office365-filtering-correlation-id: 761303af-16bf-4a99-8471-08de2bfef71e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?aIrSSeJ283nI4T+JV+bdlqIpJZyxlNvadRlYdMRNrsRhisGzzRib/Vl3PNUr?=
 =?us-ascii?Q?XoRDbFHzj/S0RxGOfkgG1P0RD8S1AGFfFIWx2+eGEDxxvP4hSfgf0rS4uKh1?=
 =?us-ascii?Q?i5DiBavV0DGeckfWZUDLsuRdi2ZTHstScwusphgfMn9UKI+V9R64smRb+IJK?=
 =?us-ascii?Q?U2B9QSjUT19pC7oo0myQIJ/70GMO9EU8nVZ+h6iNYEdTYXmT3xDePxBI5yks?=
 =?us-ascii?Q?Hl0O+w48ZoIlBKr9TTTwBRiCZt0bBjJWXmqJAnPh4y9u50aoYAN47dRUcHfT?=
 =?us-ascii?Q?2cFFgp3ybJKhS0qxAnnaEdapk2mzInoZANrGjvPLZ5ZYkCOFSjAvxoYYvryn?=
 =?us-ascii?Q?O5+E9l+CiDMlLVAYIJ02YDU8OID26oK29eWMSClGuZ6QmhOGQkHruboIl7Lk?=
 =?us-ascii?Q?yq3laRmWs/7PCZfoTFfPcFDsb4OeqTVkDbExq0Te9NBMsY/LR1KJrwexq04m?=
 =?us-ascii?Q?eH3NEXpFrPa9uqSA0hiox/TNU2PujTgvU5CnFLh6HCualJlIqAr1l4k3APmO?=
 =?us-ascii?Q?BpP/HFbSHJZjc3N1CDcda+UpGXDFndrFtIoSPco6mTkaxUcXI+9GH7tG39a+?=
 =?us-ascii?Q?bOVRToEBifSEOwri6zC+Bg+2Co+mT1nxS0xaQTd1aV+Lb9cl2gU9ludXfxd9?=
 =?us-ascii?Q?dqXfIG0R40KpJPbTfloxUIt59savhaoaO6FOlP5xhVeyXNa/uoWnaf6bYaGV?=
 =?us-ascii?Q?3vE60ObMnAGxbCt+/5qp7ZDQMVh6DBRvgrWLM/IaLJfv6D1hkXl2vLMIyL58?=
 =?us-ascii?Q?nu/30FwiQQrnHrlPwbCOmswbPElUtgP+tVwcfdzgCmJrFLReNN5oFqImcsJ2?=
 =?us-ascii?Q?ukyCLgiq9M1xDqLd/cvowKI+Zl8872nbvzeR7knpdt4wcQ1P4d40AbGWusy/?=
 =?us-ascii?Q?e061HxOnow4kWExiH83BzfcpXCtsw+jIpkH6lKCjQD9XgTfPHcZpWeev1z0A?=
 =?us-ascii?Q?kX3pwg2DpL7DuOUrW4a8BDvFjplFWGNUrjIV1l4YGUSbTtC6PIb6dwrnHrvy?=
 =?us-ascii?Q?EVTwIoVT7zP+z9qsiZpJZ3WRAkKuJ2OQ8JBSYSrBh5tD6LCMtY1ObXsQFVcv?=
 =?us-ascii?Q?YvkayUtNpkfYcW2loltdI8QlqYTTtN4fOz/D6eBZPruFXayhYiaG72bBIsi2?=
 =?us-ascii?Q?UtzXzc05q359EYpBOuvyOs1e8i7zTAoH3g7Xm/IxD5CM7velGrYvricbDHR6?=
 =?us-ascii?Q?+QrK4e+Yr6F1GtSaB/xEl+ovZI4qDYMdt9CBWsIrdK9F2wLxmIm8BlVTqRNm?=
 =?us-ascii?Q?eqVS074e0ZdqLFtrHkzsMHnS7CaVIE74KlOmJyNCWqIOg9EfkTHbe/EWka8f?=
 =?us-ascii?Q?BmqPzm833XuZVaLdGrM186/5C/L4gLHIi9pLVJwxVoC+A1WsMATK9vO6X0B0?=
 =?us-ascii?Q?aEqKTm35Byj3YFnBOQgy/LtwKbvMVeBCYqJeB+uhE/9KJV++t7U6RLeNnQ/C?=
 =?us-ascii?Q?IXht7sfiWuhHPcxQWm3Cq+PYQx4sq/RrYnC/jqB8h6ngXMf4eMvpEA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?w4bNhFUWqgt3zI9HUtU8mXPPhuhZMXdnaHEEayYbVhXKUC73yiCceA4lT5y+?=
 =?us-ascii?Q?ACSuBII9XMlh5Tm1z6SN1GMcdYjR9y2NXzHlK1vTv9owmB83SUJJ/J/lqnRl?=
 =?us-ascii?Q?VbP32idTn+WsFvtz1OzYL06FOzCxOgbAQMEBOcp+uYJwVvGmr0QXNyTfkeYc?=
 =?us-ascii?Q?oLdRqplVIu7Ss+EZNpECad217tmGYmqjVTUqTgPMn0Yhqx+THyWKafOTL2tM?=
 =?us-ascii?Q?7wNmh0oYpbIn74WeRk3owy3EPq6CWdMkMnSuWXPcExUKQNlvDfgHCkuaVA25?=
 =?us-ascii?Q?pKjc4OthTLQDgYYdfx1KyQhp+2N1vI33cO3HZdpojWTJNzLiHGyDAa/HB4WZ?=
 =?us-ascii?Q?Zfd/8l5EEI+q9D7+/OgtYELbjbodKm+7nFowcftvYXx+Lspdul3ftkqPfj6D?=
 =?us-ascii?Q?CXZhZytnkVtQwrnpBJiE+eovE7mRzz+W96UB1jbz50uW6KlznvUlr1ecntXt?=
 =?us-ascii?Q?axQOjwjkEBmNZuK3LEMIKeoqTehY/hLBbUa8SIDzih9khX7QSuTtEZKMrqos?=
 =?us-ascii?Q?bV+dabVp+yDdClweZMY5kFeCUbINCFRRMZAvuuuVjlpkgMzsUxRGmzhKvdaI?=
 =?us-ascii?Q?JJAd1Bi4EKhR4n/Pf8Bz9duGrVm4quFcrkuU0DM6fYnhE+ISvgoxavgD6WKL?=
 =?us-ascii?Q?As+oSXQHPMg7x102qgqADZZcFh0sIUoqR7kUOlCTdQjpvLENDqVz+gBXCd/7?=
 =?us-ascii?Q?tyRVzbN/WK5EeQO0rWYLLiNdiHOz7wwxAMWgGXciKp8eFfrNG06nKuaSULiI?=
 =?us-ascii?Q?MZNHLwZDUGg+r/yvYNEvX3oXCtLzpy2cqBd/PHwaD4OSh3qeO5FQuogamVxS?=
 =?us-ascii?Q?UFVxOkfGXbW8alU1aLL3TpBl2P5g7n7MllFOMdBEM5jJ1ybnE32N/R3+ddCG?=
 =?us-ascii?Q?TEnFYikq7GEqRepjGS3gehuNZcK4rK2R/VhslDUiNq3W0dpb3G3MupXmwkNT?=
 =?us-ascii?Q?CZ3GPnaXeF3woMLJERA/PsIchXPQGCM/uI/B8a9HvFLzgUCGsBz+JN12Qjoj?=
 =?us-ascii?Q?o0uxXdh9kpqGrI6rGBrsLFCh6a6sW1FmuwfmaY3IxX8qFxwEIL5UFlHe+sSQ?=
 =?us-ascii?Q?S96cqJoBGC6xfwmLqkQROJimL+yJFlIIQ0ug5HrvjUeWgREl3d30CYRLLh3e?=
 =?us-ascii?Q?rbosAIa9N+ypX/Gs4s9JX69nFftP0pyDushgPjftAaH7R9bYGOp4L+HL5My7?=
 =?us-ascii?Q?/JT4/6rtAIRG2Jblj+tLGeyExCoeqxeWitlKJ+z2D193m7YuRMaLHdHfPUVH?=
 =?us-ascii?Q?5rk7mC1tfuPVw9Xf8rZe/bCAgK1HyOL4uHEg9xo/frOzDzbDk66tq8rhnvgO?=
 =?us-ascii?Q?gpBw0Fmg/EYsEL5LjliPNRkxp8FAIXGflCf4b5Fj6FE/2uMXjwOTkiF3BLxC?=
 =?us-ascii?Q?jJvg5ndg5KaHYlw6Q5pFuVvlqx4mdeegOGVkegUZnBjh4ODhQa8Cuo8OHlqZ?=
 =?us-ascii?Q?Ipiz3lk/+CU6sQltrTRnGAabEwYY5k5HOxjoxAWOrJGDtWflBonCEr54R80T?=
 =?us-ascii?Q?5MTLieHLZHeUHJAsydes/qBEFYh5K9VchhpeUDvkx1JPKzuHFYzqaH1h0yNR?=
 =?us-ascii?Q?RUupzC0a1pIZdbEeLK0atlJUEVwqxQR6Q7wam3Kk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 761303af-16bf-4a99-8471-08de2bfef71e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 08:45:20.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DdJ48+sKnZEwHg0u8yIC0AsALQn5zAWXownYofQxQsV1tBW25p2EgQLvA/JceGW0SPrEZk48563NzxxokoKUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226756



> -----Original Message-----
> From: Haase Moritz, JD-61 <Moritz.Haase@bmw.de>
> Sent: Tuesday, November 25, 2025 9:02
> To: openembedded-core@lists.openembedded.org
> Cc: matthias.schiffer@ew.tq-group.com; richard.purdie@linuxfoundation.org=
;
> Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> steve@sakoman.com
> Subject: Re: [scarthgap 8/8] curl: only set CA bundle in target build
>=20
> Hi,
>=20
> > In native/nativesdk builds, sysconfdir refers to a recipe sysroot
> > directory, which will disappear once the workdir is cleaned up, breakin=
g
> > libcurl's HTTPS connections.
> >
> > By simply not setting --with-ca-bundle at all in non-target builds, cur=
l
> > defaults to the host system's CA certificates, which is desirable anywa=
ys
> > to allow builds in environments that require local CA certificates.
>=20
> this patch seems to have broken opkg in the SDK for us: It now fails to d=
ownload
> packages via HTTPS (from a server with a "proper" certificate from a publ=
ic CA),
> reporting:
>=20
> > SSL certificate problem: self-signed certificate in certificate chain
>=20
> It looks like the env variables set by [0] and others like 'SSL_CERT_(DIR=
|FILE)'
> (see [1]) are only taken into account by curl on the command line (see [2=
]), but
> not by libcurl, which opkg uses. Removing the default CA bundle option fr=
om the
> build now means that libcurl doesn't have any CA certificates to verify a=
gainst
> unless explicitly configured (previously it was using 'ca-certificates.cr=
t'
> shipped by the SDK). For opkg, that would be possible using the 'ssl_ca_f=
ile'
> and 'ssl_ca_file' options in the config file, but those paths would need =
to be
> relocatable at SDK install time and there might be other programs using l=
ibcurl
> that are affected by the same issue.
>=20
> Is there anything that I'm missing or an easier workaround to restore opk=
g's
> HTTPS transfer abilities?

Qruick workaround could be to set host path for native/nativesdk?
# use host certificates for non-target builds
CERT_BASE_DIR ?=3D "/etc"
CERT_BASE_DIR:class-target =3D "${sysconfdir}"
And use "--with-ca-bundle=3D${CERT_BASE_DIR}/ssl/certs/ca-certificates.crt

However, the system will behave differently with curl-cli and libcurl.
So what should probably be done is to implement env handling for everything=
 using libcurl as was done in the patch series which prompted this hot-patc=
h:
* https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D5f4fd544d3df7365224599c9efdce4e545f51d5e
* https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D397d432a62c265f481cf1ac4d9c760504d9eb9f5
* https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D2e0b9e9a86f6bd2ba13082e31d7c097b254f30a4
Especially with commit message saying "... respects host CA certificates".
I guess that series didn't take libcurl into account and should be extended=
 instead of trying to find per-usecase sulutions.

Peter

>=20
> Thanks,
>=20
> Moritz
>=20
> [0]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-
> support/curl/curl/environment.d-curl.sh
> [1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-
> connectivity/openssl/files/environment.d-openssl.sh
> [2]:
> https://github.com/curl/curl/blob/de7b3e89218467159a7af72d58cea8425946e97=
d/sr
> c/tool_operate.c#L2586-L2623

