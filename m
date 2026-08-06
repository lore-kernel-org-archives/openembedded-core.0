Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E83C5AC80
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:50:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25256.1786038591622304631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K0WTKKll;
 spf=pass (domain: siemens.com, ip: 52.101.66.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok2+ZcTMVCTv0bzELbfZNAmRnDHbENP+fY9MyslTB+G32CP8KuxlnJ74ytf7L81ax93mRjptHKphPqigFX+UCo9idJmCxXm3yTH+ukURYHEhEUIXZuf/CQCOArn8rgRHa/gs0S7xa7VtOMX6fjtIYOMtC34yplp74UdnR2ze/px6F/aUKcRRYzAYpf8nxETukTk7L6n+WUfRcH2+4fhHLJrsk2zZt3G3WrHfqZyk2F6nq/N/KSGWEcDQYhN0V0GyvYTmO74PUrDHwunyPQi9jNhrEQt025d3+c3Svy33m//JBYrOgx8O5BqfFC2NaK09E1+OyZ8zfOesZBioqChXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfA8IQXLXPh9blQGC7qIq7fdsh4MSLuE6jkfwmuBigw=;
 b=hnMEQP2gQWekMbxBkMxLmkzvmhjanYHyBwqxENer3nnZo+3OMtNqSpxLvIBR/0ChN22zGmz7YlJP+6GG4IJrs82iKI45A7FUzDtuuI6++70HUMpj7vG2fDm9vE9axeycraXq+Tyn0jsXVhCwUIcK0qtIofZ1WdJJBjTqiLDzlreOvSwzSHf0qV2o3j2XvZb2T881yy0XRKa8hSXcfAyCrH9Vuo8gdTvGEMPGRejUGc/X3sxVOdbRbFhHAIY8ubk4lvQPQH5vkF5s+e9zNWtioDAEGF3SxCOFY45MYBBKde2cp4MZraG/AuEm234FEhzGW+d8sPSXh47hfsgUwHEOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfA8IQXLXPh9blQGC7qIq7fdsh4MSLuE6jkfwmuBigw=;
 b=K0WTKKllMHQzmgfwyNDvKdoO4EcYAKGfdzc7hhkmuQYnurkrkKdghOfVANm0LYaDbAyy1SaGneo9ayfx+ySCgo2XlW6k07+nryv6HH19DwCGVxiRIqQl1CWd7OvuXGd+jvzd9QTGmo+qw21FpchujhsdrA/nscnw8R5BeOox/+BMtOeJA8Mj9E2VZyZK0QZTzyF/kCSEPpcu7NRnzE/Fh4wk8AClqlJdGexJ+2K947AHxhetNxYqeLRDzlC+HxPb6BuzIPIe/qr61VlF+5arw6OCMc3liqVortKFfsRhFL9EnMR/UsT0fOv7suPSZ7UEbCn/UBMMwp3MTtw5w8/UEQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI1PR10MB3613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 17:49:47 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 17:49:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3: upgrade 3.14.6 -> 3.14.7
Thread-Topic: [OE-core] [PATCH] python3: upgrade 3.14.6 -> 3.14.7
Thread-Index: AQHdJaEhEQHXTXKu2EavJsPmCVC+/raRShcQ
Date: Thu, 6 Aug 2026 17:49:47 +0000
Message-ID: 
 <AS8PR10MB507393BC59596DC2FE8311FEFDD22@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260806124246.26004-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260806124246.26004-1-jaipaul.cheernam@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=42d4c42d-e62e-4c9c-afd2-b29ecdc4edd5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-06T17:40:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI1PR10MB3613:EE_
x-ms-office365-filtering-correlation-id: f8e7ff7c-5aa3-4680-a1d0-08def3e31b66
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|38070700021|56012099006|10067099003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 elUPSr0eLOf0encQ17E0Ez0FkVScuNBVCseHzpKzsEJWV+94lZa1aD25t1MLk4l/4YNCRLJjWOrWsxe8jmhUGxd5p/AWjrxPXmRxP6oxAJwXCJRHPw5anS+UZjSrp8nmukK+cfMvrjgOB2kSyDwR469f5H8gH+dBRxn/BK/r7lXEchKdNL6JEe9Xhxd7z1705qdrNZMywYM08LO9kgCwp7MPcr7S4DkCnhB2y077uWbKaQFvzPD6fcB5l5DYI+mcsfPr4OUiazqXQ8nOI0QKPkAozH7F+QvsSJl1kVw++oF9tTd5gT1Y19xAmwSCHfbPng44jcPr464xFobDS/IaOUzECv9qUb/rQ8Q2Q/qZmr7MAHJkwCv/lb/KmdEXtwpMLhHoOMK9Ql5jEgI0zG/T2It0MCoKj2HxF/pHZTfEkcLr9bPM8ZB5t7g9ev5678af20GOpxOZlKkWHABB2eKXmnvbeeLLFAlVDCs6OY8ELWkeGgaXsfzBD27lDEWJggOnuFDeqpVOg3Fv3wkZ+q7f9qLOFpnc5NSyigqpt8lObbf7WedLh5Ertxb7w4HqF2tVx7HbSU5apsHPopg3uWAlQAmwuSFfhJFgH68c3HxmFFhVNhObHYPrPZTEg/9CwBKMBYWAM4QMpN3mFICeVsqLf3MhK++haGDKYC8/753KhN14yz9en79Thx7EQwVT5o/V0pRfBzxgHpT0EWQZsJv95qsKfj43jdV+B3/vFhGMKas=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AImeLVu20VZU9yiLAQN2PUNs6NU9MjTS3H9+gpTvh04nKb6O4NpwNbPg1l/K?=
 =?us-ascii?Q?qiN1odqB2T/CfwmABhgsaBJmkWtFrv+YNB9nfxtc9xztEX0SlThSTgN7bTVE?=
 =?us-ascii?Q?hiTONivx2MeDnTzeox7836fmbwO+N7qFMPLsQC7SMjRUoUiBoraLkLfUInSx?=
 =?us-ascii?Q?8RCxS0Bm/gl+Y1Obklzkb04tdYH1XHXOi0f+leCji+HJC99s6DAW4dyykpw2?=
 =?us-ascii?Q?yQ+259w8q9aGyuJ9aBbuvNjlK/ikUvy5zC1T0h6jdpKd3Eiu6w0z1iQWGqb7?=
 =?us-ascii?Q?s+kR8fGQp5V0qkSt79LYc/y3PKUrghzw52OqUGErEuG0ZSqiTaew7kb4wFp9?=
 =?us-ascii?Q?c9DO3ehBe/8hgJzMVcHcGd29KzOkA4vJd2SwIU+C7nWxjk4Be6OwcuGrNwZE?=
 =?us-ascii?Q?6VWzp4rUwhULhZioUz7JO8tptnpDXp7Acz2JOjp+5uAO4MMYoxTSHDkcYGI1?=
 =?us-ascii?Q?SiVo3lWRLUyC46Zt7Mt5k++NFjsKF1dR18d4C7FpdEh1n0oIwEe4EwCcaY9w?=
 =?us-ascii?Q?5CRuKAQSfxCp71GH2CpqdCLl4cp5UUYocGiUe3Tt34Y2RMEuS9YUV7BGlli3?=
 =?us-ascii?Q?qbCSQ72ptlJ0NGY0XwAL2KEU2RRghteBaSY8VCbYGxf424zB0wjKaolS59f9?=
 =?us-ascii?Q?5BdTgTF/0oCTsO4e8fKFbJ/m8KRY0vAUG693DMbRp/llj5OtZBf0bfMNmtmM?=
 =?us-ascii?Q?t71aQpOw4ws822QaXnbAdSSPMZKznWGzJQS9+6YHJrNexT+31NFXH6XOZWDs?=
 =?us-ascii?Q?eVNsk2EXRVCFo/Fs+s7jXUhy6TNnER4j3MkBdWxO/dab3j8AXRCTAWkWs0dR?=
 =?us-ascii?Q?A2YIK09ywLKJWVJ0IcVt+0qhptdh7Q1s3gHFq8v+ob5JLC0a8faHqsyKZjCf?=
 =?us-ascii?Q?jSMnVmekj9NOtyyzVcMwzvjesHHkJC5Gdm9V5gBXZjL5VbHbf22Y5Ke1XIwT?=
 =?us-ascii?Q?Xt/fdbBD2fDRtvHBXXt4wBnRt1idA+b0vvdyLV/eikBIb6v4mtjgffFjb6BV?=
 =?us-ascii?Q?uZkewxN2aPUK8/rDKK/D3YWvDsdtYocGmnR5qNQBhd5tZje33uyvsAPmJCMI?=
 =?us-ascii?Q?TKWbw6i0Ly0MaCVRADdlqIbw7m++TWhN4Sb1/YRXcraXIX7ZZ41ZoNp2ATfe?=
 =?us-ascii?Q?wFP0XzAhYDpNGUEZzx5u1D9OCzGO1xj8Qx4XEm+hu2AlxGU1aTeqRtH1HK93?=
 =?us-ascii?Q?GuUYfX136YrGrW9QLzJHNXIO4QLb521GBw5dm5zFpt/TJCTusBR73PRRT2+L?=
 =?us-ascii?Q?R9uaqaEvcaoXLIvMrRaTlXxpH2HfCoOUPrjDqQ0uELklcbFNeuLC7YGcKBJn?=
 =?us-ascii?Q?k8lnVvor+aKfRcoTssTBdoxKoZw+u6qXsllUFrUJi+IrQ+u+yF42WRQzTRMf?=
 =?us-ascii?Q?0btP2YySu4/gMT297U65emHHzUKMrmSQkAVBmtUl0FoCp3nkSR2cA/4vfUmE?=
 =?us-ascii?Q?qe53NmfJQBdtZU2Ns/hWEGd7VKcKYNNskJP48X0s+kjV6Xea+t4lkmzUnyic?=
 =?us-ascii?Q?TZCArdHXBWGB/3yIVP11JnaaV373DKGKJnkgp7ng8iyKZoRVuFpDzRdAtmvg?=
 =?us-ascii?Q?DtlFis25Ml20GgjVtcYZ6tDCDLoJpN5KE61zouURBKx0BhkaV6RnYOgjMPcQ?=
 =?us-ascii?Q?t8oGr2FdVzTR6XhKeTGdouL77oxs1nUcvPLPwa9bJSJdtc003CRCM+GfrLiU?=
 =?us-ascii?Q?aXZYUuTEZ+c16Blj1hKhkehvEXyGYWDiyFN/LUaIKjvpbT84jNxi+c2l2PBG?=
 =?us-ascii?Q?0e/ITL3W/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e7ff7c-5aa3-4680-a1d0-08def3e31b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 17:49:47.5567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwv2iStqGOl2ta9vdL+6rt/IwvzM8at1y3brr4BcxMbTHffXEeClSakFkzEJHMrNsHBYgGVUegPM1MWY3cuRoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242967



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jaipaul Cheernam
> Sent: Thursday, August 6, 2026 2:43 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Subject: [OE-core] [PATCH] python3: upgrade 3.14.6 -> 3.14.7
>=20
> Release notes: [1]
>=20
> Resolves following CVEs:
> * CVE-2026-4360
> * CVE-2026-11940
> * CVE-2026-11972

Where is this list of resolved CVEs coming from? It looks like list of prev=
iously manually patched CVEs.
If I run sbom_cve_check_recipe on python 3.14.7, I get following CVEs with =
detail "fixed-version: Fixed from version 3.14.7"
          "id": "CVE-2025-15366",
          "id": "CVE-2026-0864",
          "id": "CVE-2026-11940",
          "id": "CVE-2026-11972",
          "id": "CVE-2026-12003",
          "id": "CVE-2026-4360",
          "id": "CVE-2026-6879",

Also note that the new CVE_STATUS entries added in this patch should be rem=
oved.
The are resolved automatically and we should explicitly list only those whi=
ch are not automated.

Peter

>=20
> Removed patches included in this release.
> Removed obsolete CVE_STATUS entries.
>=20
> [1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-7-final
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

