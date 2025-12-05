Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CDFD2E03A
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:26:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1319.1764923192076729557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=x7OsRNrO;
 spf=pass (domain: siemens.com, ip: 52.101.66.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAKKztMbR3B14xfrgGfPN+EfkN6CPCEJj0HLkL/x17w5p0DSDpAMD+01/frg9YkCwl46jxWzwXy3rQ4gA8/k7oFSs+GLri6PtJTcJ2eZmGNnXbT8UEYDx4wfZjf0MLJpDwbWQ/8HrI2RNLPcsFcvA2g9EsYwyDjoqhxdno/aGnsrqES9NXaT68X0kg4sj3BLJvlAP+sCcCA86pdlT4U6VJovsKIrRbCHOZNsnMtp/6C/AWAEjD7QvzumpntRu3epoSHuHNRsxDV71OwmAH5rX2ch0gBz2jpE9RxDZVGlzGKAn6dxUczp7ZIzPrLoN7TpSOLmwsIdHu/nsojNq23Mog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1ywqHl7nn8YNNgYOLtCcCtWmsNRsFGtTOUWR/XVI6U=;
 b=fhX+BH7UNhJ1LA0QG2qUCqGoDAG4c5f+3tVfPvwGYf38fIbVAdls8Pj6zvWum55tWXE7LnleoF8NnfDqYDLwukw1pLUtYqbhVWzLQ+0pu1WZOiTN/xyYlsWQJzb9hTj3FxWGYDIDiEADxkbPihRuJo8HbgfqpkRbwFm2sV5DsnV/88zDkrhJYYBOG8/E43417sEzqYbOfeRDgPt2VLaNrGp+CC1WcRlUDN+LtDtQaaAcCXH56na39Tr+ryUK8ygb7GuiF5GjWwZdZ5m3cPM4xIcGn/KzV61dEXFm433VyKrA9yqo4MkSf2qtb//cigZLQXuAJNn1ChPymJS+KD8eDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1ywqHl7nn8YNNgYOLtCcCtWmsNRsFGtTOUWR/XVI6U=;
 b=x7OsRNrOX0Z+1klAogwAiebNGeecl/SW0f+r/9T8DJ53W8IUe2cXRumzGzimIUnjZgjePcsJ4lziUHIBO3CCHLTYF12RuwHcotpsMfZDGufNMW8ou4IRHaj3ftI/6lXvQDbHfUwgpm6UfhU8IuQLYuAr42PJsff8Bn7tzE7GqU1rFxKkcUlkYMhiXUOR2V7QRom0yf+SMSPh5iiA530NWLVudTRMnWvFATHic9EKIormGZNWRFgFdHFo1k4/dbe3Tf/dk1EdLiRSy7eK4zbtFf0RA35SCpgSmLTfdCIfq5LPrrV/O1AXisZDhpNWdPvuN8n++TAAldwZCqhST9V+KA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 08:26:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Fri, 5 Dec 2025
 08:26:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?= for
 PTEST_EXPECT_FAILURE
Thread-Topic: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?= for
 PTEST_EXPECT_FAILURE
Thread-Index: AQHcZb6e/47SoOFKv0yN4TNy/RzDrrUStb/w
Date: Fri, 5 Dec 2025 08:26:25 +0000
Message-ID: 
 <AS1PR10MB56974B8A04684033C2275119FDA7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251205081008.320482-1-Qi.Chen@windriver.com>
 <20251205081008.320482-2-Qi.Chen@windriver.com>
In-Reply-To: <20251205081008.320482-2-Qi.Chen@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=16f48943-c707-4853-b876-b6de847db88e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-05T08:24:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6894:EE_
x-ms-office365-filtering-correlation-id: 6b47ad14-e5a8-49c0-38bb-08de33d7fb1c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RJxXV3Nh7xZiRysXaIdl5BtAvLALg03PYhda2bwDOC8cyVi3+RQYPXAP3zoi?=
 =?us-ascii?Q?Lj8RfpI1+jsMt8LQ5NIcMtelM1Fg/URj1IlOJDLFAgco4w9fsyVPa2Ue4JVz?=
 =?us-ascii?Q?gmYJuFu5r5xjABFhfcULsQTGeLPKjNj7oP7e0pq6Ewr6WRq1RptJM8ryhj7J?=
 =?us-ascii?Q?WItsFt0/jc3uZv7OJf39e4QMKxJ+LaseScmURDEJoQE9e5XChRYYGkESWICE?=
 =?us-ascii?Q?Kq+VMRG4PU0EqNXhZKtmJl8KSwRUi39wWo2/igNTz8IZHxFq0RRarttnWSxd?=
 =?us-ascii?Q?3K++I4xV6nnRYyBV1deYUh3N7GV1y8h2IgYRfr2aOGSuGU/asXZCOyMacYxb?=
 =?us-ascii?Q?oPZqoQwC1BkaBjG2texVHznsAiZ3uRA5bnMknCvYULAZVafiTeBD+o83DmCm?=
 =?us-ascii?Q?5Ls2SYNSDeqNtCLyFcIY+Ffj4oUDzbvz5yAv5QQswIfz1rdDn90imeSCxxnb?=
 =?us-ascii?Q?cqkxo6pweC8nfkjT6UWTo2YWTN2RxPdIyOrveuzVh5pHBIrly3kqCO3vsy33?=
 =?us-ascii?Q?ygaxxskZ57Pd1VahFTiYrdBLgqFmY1fw4roi/iIc+VX3ji75QU/xZK+VUtdy?=
 =?us-ascii?Q?wMgg+48WQ0SgmQaQJMuXblIksMc1ALvZcws4GafbhbXqmCYRLQUPnPFz7MHn?=
 =?us-ascii?Q?/c+PUxBiCUcUo6uq4ON5Jh5BwZhJ0mNr64eVDGgoUyaQHCZPFch3lJZBYlzE?=
 =?us-ascii?Q?mgPtonicr99VwxOEqj0Pokg6hZQbPSgciHvR8ziEqOEZZtJCLERLtWazaU86?=
 =?us-ascii?Q?0UtTdF+vPeEAqZrYPt+i2ompqnv2nj1Ps884r97//KYEFRbTAOIzAJIA64Lf?=
 =?us-ascii?Q?pIpBplD+e+Xh0S4kQpL5JCgCCK5Nk/KWsZDWdWNJ80dR78u5+GitP52StxCd?=
 =?us-ascii?Q?hQbQtjYVVp6rf9Oy6Pi3KK5D4TRUCSWf9pemHyhxijaskbNZxZHmc/p5Hpra?=
 =?us-ascii?Q?brqoS528ETT0OWYGWMopnQoQUGX4HEfethswNQ2VsDC+SzxMCQDybObfcSXN?=
 =?us-ascii?Q?9OHAaAmvpM43Y6k2P0jBq22HENAIt0zh0kqxisbxdEg8pd37We3k10FqVOYd?=
 =?us-ascii?Q?F0rUc5Mfzx92qO25d0ZNJogcJmVgH/i7Am67zSnhTONztAt8tAXhM02FY/9M?=
 =?us-ascii?Q?WKPa5I3an1+mM0V9VoURFp6t9yWkJgc32X6nDo2fHNFmbUiMv54XG6B9K91W?=
 =?us-ascii?Q?S4bpF/AB90BbXbUa04JmM3GIYVwjOb1SoOanqDQWbhAtTVwb+rxe6K1/ytn9?=
 =?us-ascii?Q?KIE5vB5MLrx6F+USJQggbohjq2wd6kOaP0srLxFOUSKgvwslZXTScEVh4M9T?=
 =?us-ascii?Q?m7KkpavcT5boUEDsI14t63r0nF3K3g7O8nxcdqpWE25SbZ5lZ8Vn+ifPVi1p?=
 =?us-ascii?Q?z7p8/sODw0VeX+tj1Y59roAVw4z7qoPdYx8WzhbILUxfcbv6xAw9VOH6W7hs?=
 =?us-ascii?Q?26Uy4T9rNl79CcFBVAWwOKdTMytARkP02Q1JVupXQI20LDoyBQwjmCGoxLiV?=
 =?us-ascii?Q?LxgW1SbeazZhgBnxYnCBl5aeANV6fAiCx0HK?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?o3bydTWqowkRRW+U7OCDgKC5gLx7h3xc+ZMJF3mV0FmaizLNc9dHlWpWhk/p?=
 =?us-ascii?Q?jb23kitCoJ7k0K7bfend20hVDvt55iOqpAD+t48RkrJrTlTaj5ltmPqmsec6?=
 =?us-ascii?Q?UX0TRdXJaWlEc9rXsQP8Lyy8psavGjHzwzu6uQ2wajA2H6xFgZzu2rDEwQcs?=
 =?us-ascii?Q?VD7jwPQrmwWnLCqyuE5zwm63FIgZcw6fMYTJc61RmXANfx5n5E+FyxoexTAG?=
 =?us-ascii?Q?rrtJ3tvpVTMCSEuPmQ+XXXmYPFCPHEJyAraSm1vVj9OPGVGOeIremiqHyzRR?=
 =?us-ascii?Q?5c1CIJSl5+X2lckq41/wbfKTUPfbPLReT1Q2ALXz0cf05ZmhXfVi5uIodq7u?=
 =?us-ascii?Q?rtp9rrSI5IaE8wldycP4YRUWS+igZhnXgITS6WTMkqllT5KDFX4eUIx/tDZo?=
 =?us-ascii?Q?VXmYp9hTOoNA2sH0u09CgR+aN+5mEDsPGoGSlsixXoh/184GWStTEqAAcrNo?=
 =?us-ascii?Q?GBNm1dCdw/x3OJiIQWzQPQDGRduLe3/qbOUcYN5Hzmp0l/gbC1v1G1s1TtlH?=
 =?us-ascii?Q?o/05w3XHpb/6+pvV+/hhpL8kTPdpVQkANoKHe13HMN5p4iu4m/m6rYqTJ3QV?=
 =?us-ascii?Q?gKzxbtEGzMNXlv5R0yjSko8Ep/cjFs3ZLYNpfoN6qP8R7JI3rSST5boTNFMN?=
 =?us-ascii?Q?Qbqq5N3dkHxaSQyhj+5qGxQoPzW6Zy04/2HMUzKgb7170Bkb/bgCmEv8JoW7?=
 =?us-ascii?Q?kQWyk6Iieu4Wof5WoOJoCeE+BFU+JeLgJUTnrmFKo5/eSl8rx531a101n+YV?=
 =?us-ascii?Q?7XteGZ2N2Ictnxru1PHqN0NAUTMH6DUBKhdu8+hpKtyFdkuLT5Lr3yUxjVkA?=
 =?us-ascii?Q?4C6deNgxsV7jtHyGmFXuqCzIKli+lVmfFhc/UEUSVHHjKH7OalsZ4skhGhqd?=
 =?us-ascii?Q?aaSFsWOG+2kbeRge7yT2L/hDK1fOUBkqcyxS//ZUF67b6pEZodp1zFQ7hTa1?=
 =?us-ascii?Q?en1hhnbvue1cS4Yn3hl5MNKyW6a4RIIJ3FgKMo+dJBnz8fdSaNvkNvqgAR8r?=
 =?us-ascii?Q?K7x+eI004uQR4L4AsvESmft8moVZ4JjVOQKxFhUicWp/DGbY8WIGNKqpK80E?=
 =?us-ascii?Q?CPRl0DU3RoQPineYpAQB0JJ58DZ9FWSUlsxnDsJiOxdxMMiA/ijBfMfnXr1S?=
 =?us-ascii?Q?rbOCJXCPAyRuRho2aeH/E1x4JHdrbuACtlKRQ09AaI0hJ0+0tgdIzynnmfjI?=
 =?us-ascii?Q?QhlyOlc3NRuEzlCg1oTr0VbttvGkJNwisZNEdnKthnQTAFq4OoyRe0QnqPcV?=
 =?us-ascii?Q?Ljc/qko058zsggl97qYY5sWAj7uUzYERhACUSknJV/UJbEhe/BsOTDTKYP/O?=
 =?us-ascii?Q?/h/rW1MLaDKPEypEtj8kMMrZqNaOWDYJC1o/LeU5O0FV57mN6R/qTOZWP2VB?=
 =?us-ascii?Q?w8BB4VWuLj8i+osi9IhhrgU0Xj6Z9DEMdNtGcxw9S9XUA1nBBvDnottpCiso?=
 =?us-ascii?Q?OL50zjet94Sxkxe9FuIi/QFxj77Mrs9VFdwRd8wIi3A64AgTMiuYus6c14fE?=
 =?us-ascii?Q?/kjZ5HeSWu9MCWX+4kWg/6d/7HEq4ZMiRqcDFU3NWNrh/stoFeKbU8bZNyf4?=
 =?us-ascii?Q?YHqjsTqA9lT2xZ4Bdxfk3Wsj3sb5QFtNxRIaNjFY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47ad14-e5a8-49c0-38bb-08de33d7fb1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 08:26:25.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBPc7t5pk54Phm7/T4TLDQJt5Aha8K7jCKPY3cT0ovw9WImbCbQ2Xw380L9ZOBudko7ugLvL+WVDY6qB8MT4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6894
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227338



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Chen Qi via
> lists.openembedded.org
> Sent: Friday, December 5, 2025 9:10
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?=3D for
> PTEST_EXPECT_FAILURE
>=20
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> We need to allow users to easily override this value in local.conf.
> This has the benefit that 'bitbake core-image-ptest-xxx:do_testimage'
> fails when expected.
>=20
> As an example, I used 'bitbake core-image-ptest-util-linux:do_testimage'.
> It succeeded with warning message. I didn't notice the warning message.
> I saw the command succeeded and I tought util-linux ptest is OK. But
> in actual fact, the ptest failed. It's the PTEST_EXPECT_FAILURE setting
> in this core-image-ptest.bb that is not giving me error.
>=20
> With this change, I can put PTEST_EXPECT_FAILURE =3D "1" in my local.conf=
,

This comment should be probably "0".

> and I can easily see if 'core-image-ptest-xxx:do_testimage' succeeds or
> not.
>=20
> The PTEST_EXPECT_FAILURE change should result in testdata regenerated
> because ptest.py test case's behavior is affected by it.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-
> core/images/core-image-ptest.bb
> index 017f05f81b..b554964d20 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -42,7 +42,8 @@ QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>=20
>  # Sadly at the moment the full set of ptests is not robust enough and sp=
oradically
> fails in random places
> -PTEST_EXPECT_FAILURE =3D "1"
> +PTEST_EXPECT_FAILURE ?=3D "1"
> +write_image_test_data[vardeps] +=3D "PTEST_EXPECT_FAILURE"
>=20
>  python () {
>      if not d.getVar("MCNAME"):
> --
> 2.43.0


