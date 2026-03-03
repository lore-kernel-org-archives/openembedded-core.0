Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F02EC047C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:26:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13855.1772526985545909916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 00:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=F2MuHlUk;
 spf=pass (domain: siemens.com, ip: 52.101.70.22, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyZtoVFUNLF7sIGQfpnpkIDH1Jc3uOR+NDVoeS9BwXRVvhyZ+jZqvimV2yp4CihAHvLtGsMjgT7RTH4kmfZup9JfDwiBgLkLorGkVx6O63DIiZFEQtnUzmiWdfKc0zVrQiz5CM39nYTNDqGGLeoA74TZzJrMvTkA/wV0aImUaT2dKEiEs2TXEWgz0B1Ar25nPHvHWB2soKEIEQeCk87M9TeKiE4pU0XOV0CzTa2K23zJx+LKVDIUvfi5BbZQv3KUJFrQyTi8Bjzy2tkGim7bpzB13cFXvt1SVTuzcRWqtdJMwxGP3LhxNtOUa0VdyeFmtF8zZcJY0ax4ft+pxezLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KulTjgV7FZ533+STsxMYB7SlF0RpXvhN+KjDTeU6z84=;
 b=sEZlH4T4LiSYJaAyXNeLhZCF0JXSBSgbYXYbcYUdKvhnmtJG2SDjj+arGhm0BnuGRJUkGG/sHsaKz4cuP2qSUk67i2ve+RPUZiqpEr5iizzp1DrfGYDNmtTSIWrBKnGljPuAJNqBi2AXnciYOig9YHwCnAUZFyFVW7tEJxxAlVTg64NVvZKkOAXToYkWhcYhfb/9TXqN+6uAzxhSZauSpGKOvlasTaLiU1G9OgozR/qdFOlJWWP+l5kXnYbk7gmzKAgH/f3feUsu+AgeQnBRv81kvAUryXvP3X4aanUz3/r/jK27d+orFkDSzAM2IlQ7vJoatL/u6TjeywRb+8e60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KulTjgV7FZ533+STsxMYB7SlF0RpXvhN+KjDTeU6z84=;
 b=F2MuHlUkxWd0K4UyqYvuYMcAAhvb04oRrgnFH9p52fluzjs++/hejD6fX44znMZqYmuBZ6K6sETMBmecddHpXD1dWUPRXkR5pF2A+I2jw9a01CKSg1mPvaa204rujMP7OyBQIVSXILIqSXVHeOxL88fs6x+nfqx0fOml5SGUk+swuANDZcZ8oRMRKe848bn8ObpEH/gZ69DTlqyav3mClul3niuIML1BAhaVsU3+ch4ABJq+Q6sp7QJUENCpp408q6lCuKPAiDRDtYRccpziUQqFPmL4ioVDuFIx782xxYg6gFltLe5Q25kKdrz9bcPhgRPE78bA3Sv+oy2Bkiuggw==
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::20)
 by DU0PR10MB7609.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 08:20:54 +0000
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7]) by AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 08:20:54 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "stondo@gmail.com"
	<stondo@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Ross.Burton@arm.com" <Ross.Burton@arm.com>, "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>, "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer,
 Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v5 00/10] spdx30: SBOM enrichment and documentation
Thread-Topic: [OE-core] [PATCH v5 00/10] spdx30: SBOM enrichment and
 documentation
Thread-Index: AQHcql3VfHbt0/+Dk0eSG0GABq8tULWbatMAgAENWto=
Date: Tue, 3 Mar 2026 08:20:53 +0000
Message-ID: 
 <AS4PR10MB54411BC08BA31A7D246671E4AC7FA@AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <DGSFIGH5C5HJ.G5NI0606QP4D@bootlin.com>
In-Reply-To: <DGSFIGH5C5HJ.G5NI0606QP4D@bootlin.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-03T08:20:53.406Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5441:EE_|DU0PR10MB7609:EE_
x-ms-office365-filtering-correlation-id: b7686984-8f58-4aa4-55b6-08de78fdc9c2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|39142699007|31052699007|1800799024|376014|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 3KEK8GvPGkaAnKuLIjgRKjWnnpwfPpj98b+ggQg3IrZy26gCThvQQ5NyZZ6r7m20rAAg+d/7AiF/dYn0Ry4flaVdNJOdFDRL8PDcVsPl67KYylWQoInG5qfaRAK/kPYTBMscaHsCfr5l72XP4qSHGodzdt8q6wgZWlYReeu+TU3GE43sPLpgz6Zb/1gC+YSbiK7jw71xAadp3Nf387RLO27BS5GU0RWViio5e1lgeESU8qqKvlWT6P5MsgT4PzMGj2S4PFYoxVGicnsmzFNjNJr3TTJcsno+BAChXgKL4mfaCnOS/r0DPUqqIApy0lCQslU2MDWW++uAxwS+23YG/hPDwNyy2FJPktfa11DDblD0SHMd+fE7FdFPynTOJ6LIm0mMo7yLiQYu/8qoB/iSklkmmPExaTgFtGJbpLJe6a16rOxjFByFbxw+l0h2VQk9A8T6HzST+XlI9qFUj8jLqcW8kMKh5qogGAFS8zXyWBYbOsLk1ddUeN+MzETz18vY/Fs4g84JQfTFOl4xEnLrohFJKyVRowkp+xuLrXzM6xB3X2zdR3C6OJd3kI6wv84nBif0iroxDlMb4JWeomR8/Hjf96oTtzwO2GaEnuqSeMXWTu9tWpnin0GNegxNjGYKmz/ILrUgYEd+1+vKjzGjQp/0xqGhfHyt7lOcE9Vt7FnxCastQ/GEBp/xSfkst3+8tgdHb8M3qrnk9U3sRk+AaoYbyxa03DSQRaA8tMRFQqAVNk+bSxHwr81C8LDpp+2s4rYlksobPD/5iYR3bHEH8IlSJy0Y+Xin3XL+MgXwueo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(39142699007)(31052699007)(1800799024)(376014)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1254?Q?y6K6gm0L5waDEa1zr3eG7Y6/HxO/l+GQ5uRMFr2BcKzUJYpqMyAz8FXI?=
 =?windows-1254?Q?CwcelLOeHvjVPcRX9qvaShfsZVgnaxAGIW4nm5/8+uaM5pKlhPjwUtiU?=
 =?windows-1254?Q?puKv6N6zZfom3dQuHzNCupzZFCz8tLefZ89QDi1Qf0MrIl0M9r9tTB54?=
 =?windows-1254?Q?p/toI/e2xO65CGYUc+q+C5iABq+JLGuctzt0EzwoQhepzy5z3j2NJD7R?=
 =?windows-1254?Q?tVe8iSs/ArLq59AII3v4a4LmJUa2BIqNb2nP8OH7xSUJvEMznOh5r+II?=
 =?windows-1254?Q?8a98VOvl0hlvPVesH/3LzjnxfGwNWpTrD2UXa9UPBKFpajlVIA4nAcTL?=
 =?windows-1254?Q?wt4vMXBrQBE2iY17Dyf95ez9EuL1rPJrJLwboU8pFY8n6NpjQT8oesH5?=
 =?windows-1254?Q?9tcsc8DqNZ3nTQmn/HHWcFpKLtmUhPSQO3ZPNT/wUPqlRgvH6zgswHQK?=
 =?windows-1254?Q?+3RXOLoGCDdnbBOnCEgNFLzFxRiRKISGa4pLJl4N0dXv3I626Addhyas?=
 =?windows-1254?Q?8Ym02GYKW0vOHoY/clWdwMXOHFJlwbeci42jV0aXIDQ+j7RRlqHWsOSs?=
 =?windows-1254?Q?VcYyVvQe5WuJqgTJpFGAU072sb+qE3O+GVVS+A6S10qspGi3wLRb+JxT?=
 =?windows-1254?Q?B6mVe1E+m2Vi15R7UnucoE10mhweTKpb9E6ppokJKdIVGuzzwZlZacBD?=
 =?windows-1254?Q?bRFPegLB84sDBSe5QMUKF/LcjQAiLghWTesoaNeFnOEGmVwkxZUWvN+a?=
 =?windows-1254?Q?oFEsfXLsh8uMcFNvcosibi+1KL/4ewQHjJUjg8F/i9vbqKYO2uPhQg/v?=
 =?windows-1254?Q?wTxenGleYggDCB71FrrOJ2zMHrBPHAbdp8fyF1uY66HaVxO1wXXZBbYo?=
 =?windows-1254?Q?ZnEDnQL2mwLG3B3+VRCPCa7YpCpSqxnB4Lh3XEB13VHYqTc9GRHcdHf4?=
 =?windows-1254?Q?9PStG5DRGkypS0iyVp67tMVD6TolBxdTv1i15J5+EnP+KqyfO1pI4eAJ?=
 =?windows-1254?Q?Wj4Xqg0BqKx3hjPsLcyC35S4DSxlKZTa4lPXo4uiSfG2aBHoIh0TwE+a?=
 =?windows-1254?Q?2cNFddeNxDxRhxSfSDwHZH8R7vqiCi+10lqyCWYZ5dFrdTCUAA6YB8md?=
 =?windows-1254?Q?zOIxbptZ1KOZJV/69ECB8xSFIqIgUhD6z/WvluQpnrLjiAiBxvZzG/Ud?=
 =?windows-1254?Q?tgeO7GJjehwAmfwETVMC82Zb99KwEnH+0x9ko7N6skLOX9iCkpLCdh3s?=
 =?windows-1254?Q?3pdFDz5+3achc9rU//zxoCcadm2GJurjAYOhQrapHbnSdpasss6caW0K?=
 =?windows-1254?Q?5KASRxIB50pUerlcX5qJqUsQvA3ldRz5ehj/NNUTlEz5Bz9ppH+y/WJm?=
 =?windows-1254?Q?zKr/Sj+21sQVX1VneqSUwY+EufLJ2SHlGDMGKmriEncBIszeV5RcLKIG?=
 =?windows-1254?Q?FwnNFqZjpq6TyDqm+cbhPoqWW4C3+oIAWNCQAua2wZJAd2FbKNWNQCyv?=
 =?windows-1254?Q?yQXUZjlo3K/EuvKubIZ2ZqSWcRyteD9JN3GEnzyEv2HCf97mSjAhkj8M?=
 =?windows-1254?Q?Ef7u2SFsZPnrYvtkUpVl3XmgDdOPTmp0HBAdTrxUVe4QGpOaycSwv1bR?=
 =?windows-1254?Q?5irQVQsT2HLfH3ddaPbXg9+5X59tYJ8ft7oOhIGs2RuwDqbV9OSFjbRD?=
 =?windows-1254?Q?oyRKEWMCKKvYkL9PF4Q6a3Uv6VjMnInlWLBUc3MzBAEXLBixFwB8iW3r?=
 =?windows-1254?Q?5wwMQWmCy5QqOk+Fyttq8c6chH4nPGgjpTbOWQE0cMZCBs+mVv4J4sec?=
 =?windows-1254?Q?j4B2YwEH/HO41wtDUmLe2WVSfuNG5BZXeBF1sV88rdyvNAtv7is3zP/S?=
 =?windows-1254?Q?lQZYrZOI1Wh4qA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b7686984-8f58-4aa4-55b6-08de78fdc9c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 08:20:53.9945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRe/0MajXktIqOTYARzSLXzOmIDGOUzEKNJ9sVUpj9qDjELcakhOfpKGAh2lJtKpZae8q9DuDe5VMqcB5iCjJP7l9V+RBsmhnDvzI00hOp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7609
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB54411BC08BA31A7D246671E4AC7FAAS4PR10MB5441EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 09:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232268

--_000_AS4PR10MB54411BC08BA31A7D246671E4AC7FAAS4PR10MB5441EURP_
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

sure, I can do it!
Best,

Stefano


________________________________
From: Antonin Godard <antonin.godard@bootlin.com>
Sent: Monday, March 2, 2026 17:15
To: stondo@gmail.com <stondo@gmail.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Cc: Ross.Burton@arm.com <Ross.Burton@arm.com>; jpewhacker@gmail.com <jpewha=
cker@gmail.com>; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) <stefano.t=
ondo.ext@siemens.com>; Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.=
com>; Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com=
>
Subject: Re: [OE-core] [PATCH v5 00/10] spdx30: SBOM enrichment and documen=
tation

Hi,

On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo via lists.openembedded.org=
 wrote:
> This v5 drops patch 07/11 ("spdx30: Include recipe base PURL in package
> external identifiers") from the v4 series, as it is now superseded by
> Joshua Watt's commit 874b2d301d ("spdx: Add yocto PURLs") which already
> includes oe.purl.get_base_purl(d) in the default SPDX_PACKAGE_URLS value,
> making the separate patch redundant.
>
> All other v4 patches are unchanged. See v4 cover letter for full context.
>
> Changes since v4:
>   - Dropped 07/11: "spdx30: Include recipe base PURL in package external
>     identifiers" =97 superseded by 874b2d301d (spdx: Add yocto PURLs,
>     Joshua Watt, merged to master Jan 8 2026)
>
> Stefano Tondo (10):
>   spdx30: Add configurable file filtering support
>   spdx30: Add supplier support for image and SDK SBOMs
>   spdx30: Add ecosystem-specific PURL generation
>   spdx30: Add version extraction from SRCREV for Git source components
>   spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
>   spdx30: Enrich source downloads with external refs and PURLs
>   oeqa/selftest: Add test for download_location defensive handling
>   spdx.py: Add test for version extraction patterns
>   cve_check: Escape special characters in CPE 2.3 formatted strings
>   spdx-common: Add documentation for undocumented SPDX variables
>
>  meta/classes/create-spdx-3.0.bbclass |  20 ++
>  meta/classes/spdx-common.bbclass     |  63 +++++
>  meta/lib/oe/cve_check.py             |  37 ++-
>  meta/lib/oe/spdx30_tasks.py          | 329 ++++++++++++++++++++++++++-
>  meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
>  5 files changed, 518 insertions(+), 6 deletions(-)

If this series is accepted and merged, would you be able to help documentin=
g the new
variables introduced by the series in the Yocto Project documentation? This
would be sent on the docs@lists.yoctoproject.org list.

Documentation for these variables would be in:
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.yoc=
toproject.org%2Fyocto-docs%2Ftree%2Fdocumentation%2Fref-manual%2Fvariables.=
rst&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C42d160334da6405c7343=
08de7876ec7b%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63908064933387974=
8%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DK7EHUVXXVU=
HmVDTxn3cwXfJYgMCP2fmkdb1%2FXOclcQo%3D&reserved=3D0<https://git.yoctoprojec=
t.org/yocto-docs/tree/documentation/ref-manual/variables.rst>.

The SBOM document would also likely need an update:
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.yoc=
toproject.org%2Fyocto-docs%2Ftree%2Fdocumentation%2Fdev-manual%2Fsbom.rst&d=
ata=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C42d160334da6405c734308de7=
876ec7b%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639080649333937685%7CU=
nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW=
4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4ScS2Sx0NyiQ6hV=
ZPAndqO2sf4pAlS8vXgOqR8sxLsc%3D&reserved=3D0<https://git.yoctoproject.org/y=
octo-docs/tree/documentation/dev-manual/sbom.rst>

It can most likely be based off the documentation you've already written th=
rough
the [doc] flag. I can help with the rST formatting. This would be greatly
appreciated!

Antonin

--_000_AS4PR10MB54411BC08BA31A7D246671E4AC7FAAS4PR10MB5441EURP_
Content-Type: text/html; charset="windows-1254"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
254">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif;" class=3D"elementToProof">
<span style=3D"font-size: 10pt; color: rgb(0, 0, 0);">Hi </span><span style=
=3D"font-size: 11pt; color: rgb(0, 0, 0);">Antonin</span><span style=3D"fon=
t-size: 10pt; color: rgb(0, 0, 0);">,</span></div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
sure, I can do it!</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Stefano</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Antonin Godard &lt;an=
tonin.godard@bootlin.com&gt;<br>
<b>Sent:</b> Monday, March 2, 2026 17:15<br>
<b>To:</b> stondo@gmail.com &lt;stondo@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Ross.Burton@arm.com &lt;Ross.Burton@arm.com&gt;; jpewhacker@gmai=
l.com &lt;jpewhacker@gmail.com&gt;; Tondo, Stefano (ext) (SI B PRO AUT PD Z=
UG SW 2) &lt;stefano.tondo.ext@siemens.com&gt;; Marko, Peter (FT D EU SK BF=
S1) &lt;Peter.Marko@siemens.com&gt;; Freihofer, Adrian (SI
 B PRO TI EAC CCP) &lt;adrian.freihofer@siemens.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v5 00/10] spdx30: SBOM enrichment and =
documentation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo via lists.openembedded.org=
 wrote:<br>
&gt; This v5 drops patch 07/11 (&quot;spdx30: Include recipe base PURL in p=
ackage<br>
&gt; external identifiers&quot;) from the v4 series, as it is now supersede=
d by<br>
&gt; Joshua Watt's commit 874b2d301d (&quot;spdx: Add yocto PURLs&quot;) wh=
ich already<br>
&gt; includes oe.purl.get_base_purl(d) in the default SPDX_PACKAGE_URLS val=
ue,<br>
&gt; making the separate patch redundant.<br>
&gt;<br>
&gt; All other v4 patches are unchanged. See v4 cover letter for full conte=
xt.<br>
&gt;<br>
&gt; Changes since v4:<br>
&gt;&nbsp;&nbsp; - Dropped 07/11: &quot;spdx30: Include recipe base PURL in=
 package external<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; identifiers&quot; =97 superseded by 874b2d301d=
 (spdx: Add yocto PURLs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Joshua Watt, merged to master Jan 8 2026)<br>
&gt;<br>
&gt; Stefano Tondo (10):<br>
&gt;&nbsp;&nbsp; spdx30: Add configurable file filtering support<br>
&gt;&nbsp;&nbsp; spdx30: Add supplier support for image and SDK SBOMs<br>
&gt;&nbsp;&nbsp; spdx30: Add ecosystem-specific PURL generation<br>
&gt;&nbsp;&nbsp; spdx30: Add version extraction from SRCREV for Git source =
components<br>
&gt;&nbsp;&nbsp; spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting<br>
&gt;&nbsp;&nbsp; spdx30: Enrich source downloads with external refs and PUR=
Ls<br>
&gt;&nbsp;&nbsp; oeqa/selftest: Add test for download_location defensive ha=
ndling<br>
&gt;&nbsp;&nbsp; spdx.py: Add test for version extraction patterns<br>
&gt;&nbsp;&nbsp; cve_check: Escape special characters in CPE 2.3 formatted =
strings<br>
&gt;&nbsp;&nbsp; spdx-common: Add documentation for undocumented SPDX varia=
bles<br>
&gt;<br>
&gt;&nbsp; meta/classes/create-spdx-3.0.bbclass |&nbsp; 20 ++<br>
&gt;&nbsp; meta/classes/spdx-common.bbclass&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 63 +++++<br>
&gt;&nbsp; meta/lib/oe/cve_check.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 37 ++-<br>
&gt;&nbsp; meta/lib/oe/spdx30_tasks.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 329 ++++++++++++++++++++++++++-<br>
&gt;&nbsp; meta/lib/oeqa/selftest/cases/spdx.py |&nbsp; 75 ++++++<br>
&gt;&nbsp; 5 files changed, 518 insertions(+), 6 deletions(-)<br>
<br>
If this series is accepted and merged, would you be able to help documentin=
g the new<br>
variables introduced by the series in the Yocto Project documentation? This=
<br>
would be sent on the docs@lists.yoctoproject.org list.<br>
<br>
Documentation for these variables would be in:<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-m=
anual/variables.rst">https://eur01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgit.yoctoproject.org%2Fyocto-docs%2Ftree%2Fdocumentation%2Fre=
f-manual%2Fvariables.rst&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.c=
om%7C42d160334da6405c734308de7876ec7b%7C38ae3bcd95794fd4addab42e1495d55a%7C=
1%7C0%7C639080649333879748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C=
%7C%7C&amp;sdata=3DK7EHUVXXVUHmVDTxn3cwXfJYgMCP2fmkdb1%2FXOclcQo%3D&amp;res=
erved=3D0</a>.<br>
<br>
The SBOM document would also likely need an update:<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-m=
anual/sbom.rst">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.yoctoproject.org%2Fyocto-docs%2Ftree%2Fdocumentation%2Fdev-man=
ual%2Fsbom.rst&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C42d16=
0334da6405c734308de7876ec7b%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63=
9080649333937685%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp=
;sdata=3D4ScS2Sx0NyiQ6hVZPAndqO2sf4pAlS8vXgOqR8sxLsc%3D&amp;reserved=3D0</a=
><br>
<br>
It can most likely be based off the documentation you've already written th=
rough<br>
the [doc] flag. I can help with the rST formatting. This would be greatly<b=
r>
appreciated!<br>
<br>
Antonin<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS4PR10MB54411BC08BA31A7D246671E4AC7FAAS4PR10MB5441EURP_--

