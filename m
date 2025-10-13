Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078D2CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 06:26:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.web10.36461.1760336776530550746
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 23:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZbyJ+z9P;
 spf=pass (domain: siemens.com, ip: 52.101.66.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd5TkGWTMDgwwZmdJCg58jpJsWxcWIIEA9SWowLnva9EhAAsv2M0fBF8CcFGCQpgV0sOOqomxQvnHVHoPgkzdtymNPhtR1aDENFsfTfvUEJkJzShWtROHWvV+9BZG4r/OLwb9NKA73b39ZU6ukk0nAjM1if+2+dVk1WmGlZnltyfp4rbXJPJL4CTTCRQZwKuR6MpsFGLWj9pnsT5KrPCiEXY/Z7reGkA95i94esTaKOtZVs3RlFW6g7sPgsiNbFBsdEbDxKAtPq8G4zQFg/2ZUmIPNDYWPAhOdKDLL6B9SBLfBF0/813jTj/hMT7Cw72tOqZZ+gC8FleOjQPJU44bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXlL7g8EMyhW5P5torvRYEzpq7pMFEKGpLGXzNN4SWY=;
 b=Ew8HJMpH4dEGg6MxnoOTb6waE1StUbi8soATfV2Bdc65V17ROXQ7kinjA26jW67wQ1vO6JKAETV8Hzb2U7VLlRmWkxlyYw2uinZCE9SPosKfeTlpnSTNrF2vEJTcfn5ZUbFNM0HFpiG/NN7MxNAzhz4btFQ6IXXxCL01Pf7W+FFhM65BmuPJ8DAXf8dey6pdFX+UOO3Ym/iCMyVTpx+WDofzW8cZUBmUCVkcgW7a/GL/YGyncSKNf8KRoe7NO56yOehud/4qed5lFxSVaHNBRTBqZLJTkvlaMD3EKa+3JM1yfZoluCD21JIagliCbGGAZARg/zX10luCcEKs16KOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXlL7g8EMyhW5P5torvRYEzpq7pMFEKGpLGXzNN4SWY=;
 b=ZbyJ+z9P4hdqTyj4bKjWYg/IohJVTr5ugN+iG62T4kBlGx4wQSr0Shif74S/ivkNoCGfCmWAr4WpFVcz3dhczEN+yPG2Ac5v52OaFAn7OvLzfFo1XMRBMRQ0LGR/k+OU3P9re6BoEQPR2p6gqxFBp7tpi1vXomVlB033h7kLFbCtLcAy5muFBNF8xDYR++qAWX5Pw4hkxwXdpxWqckMQskyWnSme1kvPM6eiiRpRGcG7SyQAcxogYcAdNwa/2scsDSAe+HXADu7xkHwZk+SulGV6UCCl7fU+YdzCVxQ0MTA5nu+qq514PDAaOs+cTkYWUVDWmR8nhuxmSXBouoMrnA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB5879.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:527::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 06:26:12 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:26:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcPAnpEUlKPzcbL0ePyBWu4USQ4rS/m8Vg
Date: Mon, 13 Oct 2025 06:26:11 +0000
Message-ID: 
 <AS1PR10MB5697EDF33ABB021BFA11FB7BFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <186DF8D2507720C0.3474@lists.openembedded.org>
In-Reply-To: <186DF8D2507720C0.3474@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=194be67a-f22a-40a9-b338-c9e22b394db6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-13T06:23:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB5879:EE_
x-ms-office365-filtering-correlation-id: 9b22ac95-73f1-4124-a3bb-08de0a2167a3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?52nzYAjHIG9jT6+JbUGnJVO+zzB15w7xa+VbOPSYmn6J2GmXysAw0Xh+jQet?=
 =?us-ascii?Q?FTeVTKjDje3BC59CpFJF08X/7xp/cxlHKqa0AxClnh3qbw4r/HUwh6B/PUT2?=
 =?us-ascii?Q?um86v3s7KNj19E8sbcH6hBzeSB4nidH1cogNdrCA+HtzNBgu+26jbjgDUZCe?=
 =?us-ascii?Q?Om2yIO8WRSQuy4ac/5G1bPf/3kL/eEEtsvYvavClaxW8RR6vTZQRtY1asxS5?=
 =?us-ascii?Q?ke3myDzwOT/Mshmxo8eVcQIXpQV5zJIYpPmSeFQwLU145MGoi8vwniadpLlQ?=
 =?us-ascii?Q?3KjQ4zOnBd1fyfFd/87Zuc6s6ouFJVDaA8IbHlKBJummQTHwZVY/0HHhiK2/?=
 =?us-ascii?Q?0Bpe8vnTbVd6k8BzOkZ17GPpaa6e1QpJmsJ1OD7d79J0o6lXFKy4mHfR1gAN?=
 =?us-ascii?Q?pqVa52pIRhgl/Fl4M1Pbq8+BfKCPBvRrVNd0oeCCZaHFEnxAjcUfNjkqTx9V?=
 =?us-ascii?Q?kqKejg/knsBacPduj4J1wiYNhDxCOz6xSLU4KAvgN+zATKn8ICc06QyemHPD?=
 =?us-ascii?Q?SUt4sMwAl5ltqokRr8bfBkjqIOpoBBTgYJ6zG9yLrVaeaHzpJ0YgRlkYP97p?=
 =?us-ascii?Q?Bh6uvhLCgxUzGCrVmkLB2cPZHAzb9UmiQnvqGW/YENWA75aszZnt5jpe+BnO?=
 =?us-ascii?Q?r3IQPbuU+ATFOzxxveQ28424EuAbWx4DXq07MTCubrrFhNBZKZCTEJPzrhGu?=
 =?us-ascii?Q?n0HwiZSkk4nG+Euby/SagriIqQ82w71NvNR/SPnx3ILpsosve+Civq8sxlYK?=
 =?us-ascii?Q?M0irRxsrkgYDsx2BOkI8i+XcXGw2mVLSKl1e39vBYQwUNnuy9S0IZkbaQBgC?=
 =?us-ascii?Q?FnhLZ/syaLh/Y1qE7oUgHxxxy2smdOy9CfRtHkxAJs5s6U9kXoeR/79lUaV4?=
 =?us-ascii?Q?vItseR/N5AQLDs17LO4Mg4lMBmaHLHzGssCanEcUMByfxiKyjifQbPyZBKbk?=
 =?us-ascii?Q?5vEoALNFugUD1XxeyWIlZDrZMweizoIFtDbFPv+HbSPfDjG/VEvnWL3M/zLn?=
 =?us-ascii?Q?ZSkNxytPvNgIVudhEeeScIZuGiGlUZjZoomF61+9fc7S4ewYskcxGOWj5x2T?=
 =?us-ascii?Q?FYIgZHpZlBP+Aj2RDqrZpAQ58gOpPCclFTiVm7zuDlnP0jpJ8n0u19A564pN?=
 =?us-ascii?Q?3jPuCU53WVfY9NrCZ4Bed/0bDiN82h/Hq9qR8lEeozL4UGxNduqgszyQ+/98?=
 =?us-ascii?Q?2RB7Wi8dPgzx7tNnb32BWbPSQF5nSm9VsqygTLCMQzj9Fq0eS578zPUYpY6L?=
 =?us-ascii?Q?MM6XuNR+DGedQiUrWUZonDp8iz4tSNvmYkUVtuFvR3+qTeBkFgPTvHuiBZJJ?=
 =?us-ascii?Q?EhnUfmCDe6Zx0GDDfqg2q0o01s7yv7A5reVr6mOjtMkBrUQOh82cWvwUII3c?=
 =?us-ascii?Q?zsHFh6mF1oeCriuaBFn8DYHRE/4aPxHfWN5WoIfrqRg9TS3YluoP4FMshSY6?=
 =?us-ascii?Q?KaW8B8Pgl3pJNfsepyXO60uiWt5dHid2?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2T/TV4Nje8yZCwCiIwhEnwWJ4rLLvYVLQSn1tPrnNhvSVifqvVOoh4aGKf1r?=
 =?us-ascii?Q?JyuOujCk1p1jwiHu3J7hYo8hst2xZwcrJLcVKnYkIw/hOX8zlLJVP6dKGdYn?=
 =?us-ascii?Q?HV2CkNeVGFvAP64wl99mrqk6pWm/pL9dyCKclBDHpSjuY99PL+nPgrwKcO+j?=
 =?us-ascii?Q?PEldMjzal4YO41HNIFFnUQno8iORpdItd57ZKmWLMIU6F4nmPU37fYaU62rX?=
 =?us-ascii?Q?GMScI68B6vco34RVkUCULivPJ4WqTSRLPU4KPnhN4vSwHfuux9+mfnBs4dY0?=
 =?us-ascii?Q?op4cO/j2xB4PdjsDBTvDaNgTZYlEbXDOFQSxGaVnSAHvg9PoMrK1rhIRZGX8?=
 =?us-ascii?Q?Gga+diMKuQ7aeAWRZ0IB7Oa7MvpE9xTmCdWVW/ClsAoaPtPCyxt9e/2yuIrZ?=
 =?us-ascii?Q?ZcYsjNusVEhpr1n6kx6l4tKPU5pzvu2ZM8JIJnQOytYZSOQabb/OF7/4F20h?=
 =?us-ascii?Q?bqMTzytfaTjzZBWc3E77bOg7wNXClQoja8+OcNO9ST/1XPJyin6yYuZ76H9E?=
 =?us-ascii?Q?4vdOznYc+OLXh7K0dTLOjtF3Z11NxPk48govnYVlIcHbXGNUbyPLzYFTO5P9?=
 =?us-ascii?Q?W7uzPGb7yGLNUMj+5Aom9rchO0JakTtjg0V8ubMWSL+PsBDrLzwsUFgrHGaW?=
 =?us-ascii?Q?cOtBfrOz2VOvx92Vw8uw6Q886td3zbQR2KY8RlxTmxHecKKhsnVNzP68Nptg?=
 =?us-ascii?Q?VbaYHI0GSNQChi+kp+FYo1k1hr0Umuecv2qC/c7dK2FJM6mbMnLYiAfo1b62?=
 =?us-ascii?Q?ha8sry4BiFat/96Bwouw9mlS5uUdbCQsy4vsRYnPONJngo2KnwQNnSwyFoml?=
 =?us-ascii?Q?buZv0JfrgCDiZYLAK7SZ6rPWRiyix3b36p4TUecINQiH6GTiLACksflebw+j?=
 =?us-ascii?Q?zP2v0a1j8dfylmIU/aPSjEa30lTsbpF6aYFf6jUnQ3jzFm316RD3zdur0zDE?=
 =?us-ascii?Q?DtwoRuC+HaRzM2HC6LMcwVavcAq2o2nPRiIwENO89SYAsXSSfKjHwZxF3bRu?=
 =?us-ascii?Q?moRgE8GTT/VXLROyboYjKVvzZKxmACwvWqf3s28Q+ZZz2In84/NH3HiJfZMP?=
 =?us-ascii?Q?0Eq8gz5HKcKGS+odUMWJv67aPCNKHaqpqPXx1GppY3Ud5ZRHuPFZ3uOtyEnN?=
 =?us-ascii?Q?4hX1dEVzvpcKp0agCQ8zP8/GSflCVX2AM9KprnEf/zm4EH9/1+XLfgLe2+Gd?=
 =?us-ascii?Q?h+I8jsriAfICJAYN3FMtv9dc2kB+Qs9u8gB30TRXvqgDHQ6O0CCe2AB/CSeA?=
 =?us-ascii?Q?FvyhZb8pTe0c9yAF2k89iRI+uPlpfK2WI+xr2b8kh7rEimvwJ9DX/9FPHGu/?=
 =?us-ascii?Q?O+y/D2BOK7j4TcHaxLNJGwjyOThQaXtHRryoasbhK1LzMnXJAiZTSBFLr5ny?=
 =?us-ascii?Q?k0YalvXJzTXf+nTktTEX5irxLXRKxJAnmJqS9k1hJgPILTQrm+6I9iC7CPgf?=
 =?us-ascii?Q?W/Dl/1A5MBAYK6ZWNZZGK3d7QzMmT24dsFMrlYU1zUtmQVht7UzOiCKjYaoX?=
 =?us-ascii?Q?NjzGKUi06lpVkv36hZJLgL4qsLJlT6aVxwG/dFGYcEdKR4x471KKMY210B4K?=
 =?us-ascii?Q?dQhxK96qxHqIK4XzZS90BNF7JNzu32P7WMwtBv/U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b22ac95-73f1-4124-a3bb-08de0a2167a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 06:26:11.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yycf545nWI+r3aaAK2gj3AA3on0FQLjWR3fj7MR72kM/t9ZIGkqMyzn4VYkdukVL+Ao1Rj3VOgwUPjDQmVz16g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5879
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 06:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224761



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Monday, October 13, 2025 8:23
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.
>=20
> This update includes major change in how it is built.
> Instead of autotools, autosetup is used.
>=20
> Autosetup (https://msteveb.github.io/autosetup/) claims to be
> * Replacement for autoconf in many situations
> However it also claims NOT to
> * Intended to replace all possible uses of autoconf
> This means that some autoconf features are not available.
>=20
> Recipe changes:
> * stop inheriting autotools and define B, do_configure and do_install
> * add patch to disable zlib as autosetup cannot be preconfigured like
>   autotools to force function calls
> * update packageconfig options to match new syntax
> * libedit is detected with ncurses linking options (as seen in
>   do_configure log)
> * backport rpaths fix
> * define soname to avoid file-rdeps QA error due to wrong library name
> * clean B for do_configure as the new Makefiles do not seem to properly
>   retrigger build if configuration changes
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2 changes:
> - rebased to latest master
> - removed anti-strip hack not needed in latest version
> - created patch to disable zlib
> - (no change) checked proj-native build: succeeds on Debian 12 x86 host
>=20
>  meta/recipes-support/sqlite/sqlite3.inc       | 33 ++++++++---
>  ...rpath-configure-script-flag-to-addre.patch | 57 +++++++++++++++++++
>  .../0002-Add-option-to-disable-zlib.patch     | 51 +++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  8 ---
>  meta/recipes-support/sqlite/sqlite3_3.50.4.bb | 10 ++++
>  5 files changed, 144 insertions(+), 15 deletions(-)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disa=
ble-
> rpath-configure-script-flag-to-addre.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/0002-Add-option-t=
o-
> disable-zlib.patch
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.48.0.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.50.4.bb
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-
> support/sqlite/sqlite3.inc
> index 28a33282ae1..94dbc38ec5e 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -14,34 +14,35 @@ def sqlite_download_version(d):
>  SQLITE_PV =3D "${@sqlite_download_version(d)}"
>=20
>  S =3D "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
> +B =3D "${WORKDIR}/build"
>=20
>  UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
>  UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
>=20
>  CVE_PRODUCT =3D "sqlite"
>=20
> -inherit autotools pkgconfig siteinfo
> +inherit pkgconfig siteinfo
>=20
>  # enable those which are enabled by default in configure
>  PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"
>  PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
>=20
> -PACKAGECONFIG[editline] =3D "--enable-editline,--disable-editline,libedi=
t"
> -PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,readli=
ne
> ncurses"
> +PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-
> header=3D${includedir}/editline/readline.h,--disable-editline,libedit ncu=
rses"
> +PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-
> header=3D${includedir}/readline/readline.h,--disable-readline,readline nc=
urses"
>  PACKAGECONFIG[fts3] =3D "--enable-fts3,--disable-fts3"
>  PACKAGECONFIG[fts4] =3D "--enable-fts4,--disable-fts4"
>  PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"
>  PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
>  PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
> -PACKAGECONFIG[dyn_ext] =3D "--enable-dynamic-extensions,--disable-dynami=
c-
> extensions"
> -PACKAGECONFIG[zlib] =3D ",,zlib"
> -
> -CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'zlib',
> '', 'ac_cv_search_deflate=3Dno',d)}"
> +PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
> +PACKAGECONFIG[dyn_ext] =3D "--enable-load-extension,--disable-load-exten=
sion"
>=20
>  EXTRA_OECONF =3D " \
>      --enable-shared \
>      --enable-threadsafe \
>      --disable-static-shell \
> +    --disable-rpath \
> +    --soname=3Dlegacy \
>  "
>=20
>  # pread() is in POSIX.1-2001 so any reasonable system must surely suppor=
t it
> @@ -65,4 +66,22 @@ FILES:lib${BPN}-staticdev =3D "${libdir}/lib*.a"
>=20
>  AUTO_LIBNAME_PKGS =3D "${MLPREFIX}lib${BPN}"
>=20
> +do_configure() {
> +    ${S}/configure \
> +        --build=3D${BUILD_SYS} \
> +        --host=3D${TARGET_SYS} \
> +        --prefix=3D${prefix} \
> +        --bindir=3D${bindir} \
> +        --libdir=3D${libdir} \
> +        --includedir=3D${includedir} \
> +        --mandir=3D${mandir} \
> +        ${EXTRA_OECONF} \
> +        ${PACKAGECONFIG_CONFARGS}
> +}
> +do_configure[cleandirs] =3D "${B}"
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpa=
th-
> configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlite=
3/0001-
> Add-the-disable-rpath-configure-script-flag-to-addre.patch
> new file mode 100644
> index 00000000000..f1e93a1c9a7
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-conf=
igure-
> script-flag-to-addre.patch
> @@ -0,0 +1,57 @@
> +From 87c807c6dd4df67328919fa28e89a06839e634fe Mon Sep 17 00:00:00 2001
> +From: stephan <stephan@noemail.net>
> +Date: Sun, 22 Jun 2025 22:48:11 +0000
> +Subject: [PATCH] Add the --disable-rpath configure script flag to addres=
s
> + [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
> +
> +FossilOrigin-Name:
> a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912644b89366c5
> +
> +Upstream-Status: Backport
> [https://github.com/sqlite/sqlite/commit/87c807c6dd4df67328919fa28e89a068=
39e6
> 34fe]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + autosetup/sqlite-config.tcl | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
> +index bb81123204..4dd065095e 100644
> +--- a/autosetup/sqlite-config.tcl
> ++++ b/autosetup/sqlite-config.tcl
> +@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
> +           =3D> {Link the sqlite3 shell app against the DLL instead of e=
mbedding
> sqlite3.c}
> +       }
> +       {canonical autoconf} {
> +-        # A potential TODO without a current use case:
> +-        #rpath=3D1 =3D> {Disable use of the rpath linker flag}
> ++        rpath=3D1 =3D> {Disable use of the rpath linker flag}
> ++
> +         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
> +         soname:=3Dlegacy
> +           =3D> {SONAME for libsqlite3.so. "none", or not using this fla=
g, sets no
> +@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
> +
> ######################################################################
> ##
> + # Handle the --enable/disable-rpath flag.
> + proc sqlite-handle-rpath {} {
> +-  proj-check-rpath
> +   # autosetup/cc-shared.tcl sets the rpath flag definition in
> +   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
> +   # rather than as a compiler check. Though we should do a proper
> +@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
> +   # for which sqlite-env-is-unix-on-windows returns a non-empty
> +   # string.
> +
> +-#  if {[proj-opt-truthy rpath]} {
> +-#    proj-check-rpath
> +-#  } else {
> +-#    msg-result "Disabling use of rpath."
> +-#    define LDFLAGS_RPATH ""
> +-#  }
> ++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
> ++  if {[proj-opt-truthy rpath]} {
> ++    proj-check-rpath
> ++  } else {
> ++    msg-result "Disabling use of rpath."
> ++    define LDFLAGS_RPATH ""
> ++  }
> + }
> +
> +
> ######################################################################
> ##
> diff --git a/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disab=
le-
> zlib.patch b/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disab=
le-
> zlib.patch
> new file mode 100644
> index 00000000000..c14c9dbd5b7
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib=
.patch
> @@ -0,0 +1,51 @@
> +From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
> +From: Peter Marko <peter.marko@siemens.com>
> +Date: Sun, 12 Oct 2025 23:32:46 +0200
> +Subject: [PATCH] Add option to disable zlib
> +
> +Autotools allowed to disable zlib by preconfiguring variable
> +'ac_cv_search_deflate=3Dno'.
> +Autosetup does not seem to offer this option, so implement real option.
> +
> +Note that configuring sqlite without zlib is virtually impossible zlib
> +normally gets into the system with toolchain. So the only option is to
> +configure it out.
> +
> +This change is being done for Yocto project, where it's currently
> +important to avoid additional dependencies having to restore chain of
> +dependencies in "restore build from cache" scenario.
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +Upstream-Status: Backport [TODO]

I'm currently unable to register myself in sqlite forum.
Either registration is not working or our email system blocks it.

Would be great if someone else who has account or can register posts this p=
atch there for comments.
Alternatively I could make this Inappropriate [oe-specific] for time being.=
..

Peter

> +---
> + autosetup/sqlite-config.tcl | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
> +index 85fe414382..77190a7053 100644
> +--- a/autosetup/sqlite-config.tcl
> ++++ b/autosetup/sqlite-config.tcl
> +@@ -274,6 +274,14 @@ proc sqlite-configure {buildMode configScript} {
> +       }
> +     }
> +
> ++    # Other options for CLI shell
> ++    cli-shell {
> ++      {*} {
> ++        zlib=3D1
> ++          =3D> {Disable zlib support}
> ++      }
> ++    }
> ++
> +     # Options for ICU: International Components for Unicode
> +     icu {
> +       {*} {
> +@@ -641,7 +649,7 @@ proc sqlite-check-common-system-deps {} {
> +     string.h strings.h \
> +     inttypes.h
> +
> +-  if {[cc-check-includes zlib.h] && [proj-check-function-in-lib deflate=
 z]} {
> ++  if {[opt-bool zlib] && [cc-check-includes zlib.h] && [proj-check-func=
tion-in-lib
> deflate z]} {
> +     # TODO? port over the more sophisticated zlib search from the fossi=
l auto.def
> +     define HAVE_ZLIB 1
> +     define LDFLAGS_ZLIB -lz
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes=
-
> support/sqlite/sqlite3_3.48.0.bb
> deleted file mode 100644
> index bd2ac6614d8..00000000000
> --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require sqlite3.inc
> -
> -LICENSE =3D "PD"
> -LIC_FILES_CHKSUM =3D
> "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed00c66"
> -
> -SRC_URI =3D "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
> -SRC_URI[sha256sum] =3D
> "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
> -
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.50.4.bb b/meta/recipes=
-
> support/sqlite/sqlite3_3.50.4.bb
> new file mode 100644
> index 00000000000..b822d7e919c
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
> @@ -0,0 +1,10 @@
> +require sqlite3.inc
> +
> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D
> "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed00c66"
> +
> +SRC_URI =3D "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
> +SRC_URI[sha256sum] =3D
> "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
> +
> +SRC_URI +=3D "file://0001-Add-the-disable-rpath-configure-script-flag-to=
-
> addre.patch"
> +SRC_URI +=3D "file://0002-Add-option-to-disable-zlib.patch"

