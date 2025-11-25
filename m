Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769F7D0E6CD
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 12:34:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16004.1764074091740461341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 04:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ucpUfKHC;
 spf=pass (domain: siemens.com, ip: 52.101.84.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtXl+NoFcZ/YOF3Ex7VvzRriqX1D47AHFG7Fm3MCOIP516tsirRNbRvtGQVpQEINH+4LLVSZooKy5A5gjZlnaePTgF7rg5d2oR3ictDqH46BpA+UZlVDxWJkeCcD/dTEJGMvx1021ZtjdQF+AGxI+/UvKTSt+HRf8LGx6/Ev4/qvQRj+Q5CZxZA4UF3itpyHxE8Ou4L4kV7QKAsihkqkz9CBq5+9dny2WoR5qpVzUpGNItRHJeSc/L9AiS94g3/oNxLUurNACjk1kpKH7N/yHCXI3w4RS0bnOmhL8VN2s0t2WcBEsR1sUqGKZDW5NIBKPAoApxiafNh9uoj/dFUrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG8lzxOrB7060aeRTm1rh1aMLcIOY+zScbu8zNsyZUc=;
 b=gkJjggJ4YMVK/h2RltYKc5ACM41ksHhMcs8DUupx3cyC+ILce+l53V26YNFvyhg/n1aGLt30uR3fF/sTYAkzCjq5OjsklWqtDB3Qasi9dWvoHvRxGTsm4IOkkV4gLhfdaTRNAfdPIMeEQdFTQxlK/XaOgDDCv0bjf10pWwr6Wo2Gvz62Xj4Nl3uAhfvdL3Tlo4DcVGFuhtcjzint396gI5Z/1x5Z8v0UrdqXlCufXxZtaydCqXNkrvaeo/XlT0YAGU1FS1ZEzJLSzr1h8oszxiLZqJegqpXyeyAR/MnITjYj1MFrCK1iRXgu5wX+hkRHJpXFl5gdK6eJlGLcsjhzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG8lzxOrB7060aeRTm1rh1aMLcIOY+zScbu8zNsyZUc=;
 b=ucpUfKHC+eTKsWnMXduYCyrm0VN0DvkidWPZIhvaMF40SYrjlIXbK/nRifC8UlVaBbR5unMw1BxOQd4FKBOOcPMVry+9L3l+yBD2WRlBjk3QsgJbWANJSDRTPwRheD+CVDofO7U7AS8cJMjhNIYW8l6tIJvn8Mw4nw5I/Db8+te17gmASm4+HPXbH/cgp1PTt/bMl1+8FQFInQkVeVW64CWpOd8xbcrm96UR2DkR9HTB1HYnXajCgZ8XyHnrzgNOb9cEW0IkYWqyXUnRV/51kAY/Tht7eIg53SzRReIoSvRMso0+JfQyXmFSjJ1dxV3RFHWbHFHmYxNm0Edkzu0geQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by FRWPR10MB9394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 12:34:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:34:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2rUDECDQgAA9dhOAAATwYA==
Date: Tue, 25 Nov 2025 12:34:46 +0000
Message-ID: 
 <AS1PR10MB5697DDEA8FD729A473CD61B7FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <PAWPR09MB8030A52B0E6122B81CEED6ADEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PAWPR09MB8030A52B0E6122B81CEED6ADEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c23643d-cad5-4db2-8ad1-9b6dc3da2f90;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-25T08:31:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|FRWPR10MB9394:EE_
x-ms-office365-filtering-correlation-id: f9c58145-a8a7-477c-4bed-08de2c1f046c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?wNelJcw7rcs479/mJUmDbo9rQSotDhv3ROhGcB6TkHQSGku1i1lsUli0YJhq?=
 =?us-ascii?Q?bzaTIHS467mlvvvmxjNMPEEd895Fuh+PYyS+3aidRdP1o/zLNdPWS+0eqCoc?=
 =?us-ascii?Q?lctpK2EI3rHz999X1FVlEgs7vqQbM10us8Vx7Va/KYyoMCrN94u+CLSgxLAS?=
 =?us-ascii?Q?GWAdWX1JEHHgacwVrBhTXZnLMGvbZCLhW33tQ/CEXuR44ecNmDugODOSX2gZ?=
 =?us-ascii?Q?imY+4/FS/KIpmwmifpLDmUsoKIfk68ahqC4ZmZvT/K6iIK/bdoLXz3+1+IMJ?=
 =?us-ascii?Q?b+0gZHhyINrar0F2ll4he2nVlfl/LYDgbLEepkS1RAbgOok6chMMxaM0Vc9V?=
 =?us-ascii?Q?WyJksoKLemwMvHpu+fsF/X25XOLcHzVD3VvB7qgZ16EflsuixOsEJPPmfWN1?=
 =?us-ascii?Q?hSl/HZaYQ4t9xxcF5e+fFpLVHrqvlvwuQKNjFJ0mynkdGYflJNb7GvtIyxhX?=
 =?us-ascii?Q?5TwVTgCRJQ43ibvZZ/aT4CFX8ztaCpJ85PR/Ua7XejNwAd6x8ySU2pOS7CWu?=
 =?us-ascii?Q?HllUobsTa0gjmUyZYQ3rnnpi6vSjD7CMNS4Z9A6NCiwp6HAKcVHoceCEe4GU?=
 =?us-ascii?Q?H7mvZRviAJMdoO1oACRwtqii7UB7WRVlir5PmfAAnGwQJ6oSE9Kv9l+3Xu1o?=
 =?us-ascii?Q?/5R/Bi4Mw/vA0lJ9M1aYaxMGltSTRNQettlnAj2/4sD4lUwz2Kom5RAXGbqG?=
 =?us-ascii?Q?8dFMtHGN8Hjqh35+YtkD/hgTvWcksyk9vd4j7CpXpzo8GgHNoXSByJBpCU19?=
 =?us-ascii?Q?HsWdTh+JffSDnnGglqwNpsI4DFox/ikqX2PYDYhcj5hV7hFM21yTST7MDmsi?=
 =?us-ascii?Q?0LonBoST53ys2SpzgwY6q+xxz0TYIA2l50+pPBJ6zEPth0nFGU8853pKuMqQ?=
 =?us-ascii?Q?M8txif6ZGL5+Emtm39+6ZfOYNLsIp7U5Hbo0fbOw0gvk2DwCoEEz4mKhgxtU?=
 =?us-ascii?Q?H17oqiJR+qsUuHN+hXEnlzmkeT3zBU+uTXJ2dIgLKMU/Yzib0gV1t1t35WXj?=
 =?us-ascii?Q?67lSfOgdCawzzglU39cDHcnaoFNb2bVcdRUvIwTKpcQSo9D0g7ivRBGGTZjp?=
 =?us-ascii?Q?08F/HfHXsRnL1pOFvVueMzEa3gDslTesLNStOOVHUaDaZp81KfULKCxWUKwA?=
 =?us-ascii?Q?P64kN1wYy3rwtDDrlpY1EpcCbZhVZ/nN5ed+CmYuNPzfIwu5jTAkaD6tIkXw?=
 =?us-ascii?Q?lJ7xbpffjggO5OqDan+1TzlHvCjfDL9DGrhkjCmP4OTZ5GabJrYzDsS0dlLo?=
 =?us-ascii?Q?BzYJo38BJnjYa8wteVp5381ykwmff+d2do2kvbZKPk6lo5TeQlL2BI3LCKl0?=
 =?us-ascii?Q?rb0bYxbg3FfMdTy1nBILljv/Xwq7wFfuDjSaojENS5u+3cYTbU4rLl+indTw?=
 =?us-ascii?Q?wrGBKGcaDgSk8LPskOYJpFjpDfI1DOW80BUfXWa+rQhm5v1cWVNGFscC9d03?=
 =?us-ascii?Q?BMaILF33louC548NuiGy6PLpZbuQqKI3GSGRoKDVdkI9HYmuByeKQYtfRbax?=
 =?us-ascii?Q?NSyECD4dO6al1lf7b0N58QG1X4yaF9r/d2uB?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7uJJahnXGaAQadAtBe7eDrloF7MWkBv6Q6wfL0DZ1nvhFdhRUwqgqiByPZAm?=
 =?us-ascii?Q?OiWRRmdbj2tyDl3R+R/DDvgVFivp3xPxS4J++GbllkxDBQLUIa9BqiyK3P8g?=
 =?us-ascii?Q?PrYe5g+dezFlmTjPSsvfRSv9K/3n/B0aoiR6nC4EQrgldFxrbgepTGMHIwGl?=
 =?us-ascii?Q?rF4dB4/u1zrA4PZj62UoyCfRRwGhnDPe9468PmKpxCp1XWgouWCG/TApzNyf?=
 =?us-ascii?Q?bADfhohmLRHb4A9Y5tx7FzSJDhAYoRym1PZNls81/coY84Hwm6L46LRKvGFv?=
 =?us-ascii?Q?cLarN9THhShutY/A2GBsb6SnSpZxQGrPYk4J+LWURHFGdQZ0ludJ+fkgopqB?=
 =?us-ascii?Q?ntwjO1/p+/SHAIOKzMu9V4egFEPTQzVrsdfx4+tWCrsqwdr4VgXCZu1prLfp?=
 =?us-ascii?Q?O5PmrVgu8TT+tgv0MTnYbgpPdPrFj+TSSps9bYM3yw5YanVLAJFzs3zGVkyc?=
 =?us-ascii?Q?wzgPfZpBPMQxE2KyoPYY/MDGfzWgL0yzTWrWtYeyKfIehZWQrXptMtvkL17p?=
 =?us-ascii?Q?FHKVz8+WSQP2ARU+YCfCNNBPIpA0pLiCWMaypRyqn25gBzbc5E82Xe85G85D?=
 =?us-ascii?Q?Y1ieJfvOnpIAzYOljjuAEjxu1tijE+BBdIg/rSBFjFJzHs1e1EBtTLmj52od?=
 =?us-ascii?Q?svRBU56RjEPlTta6RPkz2MnvyhWJe8G3sg2PlyAZFabiTcDP7xb2uoc4/rV2?=
 =?us-ascii?Q?kn94FbIH7dR3KQ8IBqISejsC20BdI94+iJSrX5b9tB03LJ4xM2zNjr46137z?=
 =?us-ascii?Q?1tkoecDofwTCn3WugwNrlHDzmA8AigBX5AGS4F+iCDj4MlxS0WA/FexLhFdO?=
 =?us-ascii?Q?/oPT1Q8WCVsFq6tBfPWdCBk17cHGyMlihzBzvlAryDorfuNJOrqXAp71wAV+?=
 =?us-ascii?Q?z2uN1svxIYrpbOxNlAOwpfFkGz8YCw7081/eCvGZsng9JIUEvjQdPqc6TBQf?=
 =?us-ascii?Q?RqdWGxxsz9i4wMXZQVfnBEvmMxilJh33TBbrZwVaGkud47gI8REyS7O3IhMe?=
 =?us-ascii?Q?02cf1h67ennQS93CjJCWUsOZDYEwyAy7sv5wwpBc7li04Ex6iOROdENHpCoJ?=
 =?us-ascii?Q?VEsyR2IUrZWkVQmjpttz4KhPIcSa+BC0chMjALi8TAzJX5skbr+OHO3hqAIa?=
 =?us-ascii?Q?1ybsNKPWQOqm/m3Ev/6E90ZGPBMQoT0iGCQYHew8xI90sZmPNOES46NfnKoX?=
 =?us-ascii?Q?FpgLegLNpwIfYvZFnnXUtlJC1IsqWpaFs42zBaKvtlB/c+E2Z8jQUbEd2lF1?=
 =?us-ascii?Q?UVK/a5XXAkhMiLciuoxlEFOHe6apd1seVdry3vihfHHzwjYwstUWASy8GOkR?=
 =?us-ascii?Q?pGxQCOhKPm+47EEDbDGdQnKWnddPHvXSgpj98ZrGx+Y7JhaNj/hAWcr9EmDd?=
 =?us-ascii?Q?21I5mB5oHpDdYfvTm7GXWEpHheWexvdc0dySW6ivt25IPvQf+J1QWNK1oK6F?=
 =?us-ascii?Q?IHXsTQmEYtN6mqTwlb9rDLNF56YYuSP+yLxKwABhOOEoN6tVkcPq7at968fN?=
 =?us-ascii?Q?JtrGoUXTmh8rt+pWD7EPENj8uvYrEqmmDAO0COEkmg8epKMW6lkeHOd279oI?=
 =?us-ascii?Q?g5aQGBgQ+UrUjkZqrpcug6wbfXDrnoRdM8hyXshj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c58145-a8a7-477c-4bed-08de2c1f046c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 12:34:46.2567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1BlW7bEfxaUWLPexKKyU8ExSYazF5Nm532SmTxDt+jfRFDQuNffnHa/IjS+raKgYWstPQVdDERea+maaFQINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226765



> -----Original Message-----
> From: Haase Moritz, JD-61 <Moritz.Haase@bmw.de>
> Sent: Tuesday, November 25, 2025 13:26
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> openembedded-core@lists.openembedded.org
> Cc: matthias.schiffer@ew.tq-group.com; richard.purdie@linuxfoundation.org=
;
> steve@sakoman.com
> Subject: Re: [scarthgap 8/8] curl: only set CA bundle in target build
>=20
> Hi Peter,
>=20
> >> Is there anything that I'm missing or an easier workaround to restore =
opkg's
> >> HTTPS transfer abilities?
> >
> > Qruick workaround could be to set host path for native/nativesdk?
> > # use host certificates for non-target builds
> > CERT_BASE_DIR ?=3D "/etc"
> > CERT_BASE_DIR:class-target =3D "${sysconfdir}"
> > And use "--with-ca-bundle=3D${CERT_BASE_DIR}/ssl/certs/ca-certificates.=
crt
> >
> > However, the system will behave differently with curl-cli and libcurl.
> >  So what should probably be done is to implement env handling for every=
thing
> >  using libcurl as was done in the patch series which prompted this hot-=
patch:
> > [...]
> > Especially with commit message saying "... respects host CA certificate=
s".
> > I guess that series didn't take libcurl into account and should be exte=
nded
> instead of trying to find per-usecase sulutions.
>=20
> just so that I get you correctly: Your suggestion is to add additional en=
v setup
> scripts for opkg (and possibly other affected tools)? That should be doab=
le, but
> we'd need to add (and backport) support to read the env vars and apply th=
e
> necessary curl options to opkg - or patch libcurl to do that automaticall=
y (and
> thus behave like curl CLI)?

Having custom patches in curl recipe for this is a bad idea.

Having some wrapper or environment scripts inline with what was done for cu=
rl-cli/python/git is probably the way to go.
Links you provided show that libcurl is respecting environment variables wh=
en those are provided.

Peter

>=20
> Regards,
>=20
> Moritz

