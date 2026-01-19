Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD27CCF2CF
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:58:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31587.1768813137524344470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VDYlVO4D;
 spf=pass (domain: siemens.com, ip: 52.101.69.39, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGsZhgzD6ZsPFMfh89/r+yOL75oDdJYh7BA45jgDkbQOpn+9DH/ljq3FKlRZ1UWk+zww0c2Dfx58/13VacgSY5JGZizm+qckFqDy/1PgwCWXI8FAMXH4h+0pCVoZ9RVnqCr3iaCLa9aLCVQx3qnAPEYlKG1bvvtGMjK2XVAtD8LYQF9xBzWh7MeuKO1JnggrAGaT63agzTzuokbHvkNMyBi2HN7PF1p7FQYX4r8Jpo9FX7+0o2+pW2jgmvrZ7tSzBQh1mGNJJrSZVLgTzWIzgSKcJRGrdF0BwVg6w1W6XytxT7eORE9kVbMttleS96jiXRzugcf2pQQP3878giK4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXo3g6B/LeijrygvlbOlvXn4LvcvTDUUy+mVMi1eyfA=;
 b=m9dyBlqnJYk3EERWEkZjUCztfthB5Sk/aTyoD3l9LqrqPlXLwmVFldgms/6cN9D+hoodFE5nIGb1j1lYXe88vdbpokRb2A9IxnhPe21FESdhyn/rMhKVZue05EeHn7c69tFoc4NW1oAtfBgBCLsgtJM3R58QqqarFq0gsYHOOWIt/EJ+3A2y7rKcDrH9CTtgab3gSWDQ7t6EjbcrRrDcNDDNYfGqC3dYfVSxW7omF2woVeScMpOUCbk/WKY7OkYm7oZIR/a2jvnZFg4BbJHDaZdSUd/xOSc0aVt86bZ5Egp0so+zUGDrrBZx2uyp9R4Yp8eQO8Stz1wEx/+FX3OoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXo3g6B/LeijrygvlbOlvXn4LvcvTDUUy+mVMi1eyfA=;
 b=VDYlVO4DijafnkAZhpNghvAciYrH91YMZNbx42f1BvqLvBcZhGRBQfbJ4lGMJDiu2r9o0Gz5hVQE+3jtezWeJaa+lSKlI5XIm7AHwod8eeMzh1jaypDRHL5KeQ9Vmn2sspjFCgfoIFGRm0P9RcAtxH9YCclhp6K5kFOrLpWdOBeKej5IBRmmAdPtIYg0AalZDwETGUd8147PGOUVSBJ+m6rGxqpAL7q1/kXFEV317QVz3mC1/zhFCTC+dU5SvW1pTm8ZzKjYDqil0c2Zrty2TRrDOiwDcUz95AY9TTqxBfO7eHKP/IZY80TllFTaNakQ2fO2nTV4YPjKXltYkNIT4w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7988.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 08:58:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 08:58:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Subject: RE: [OE-core] [PATCH] zlib: Fix CVE-2026-22184
Thread-Topic: [OE-core] [PATCH] zlib: Fix CVE-2026-22184
Thread-Index: AQHciRv4uCAUWdJSmkGXQM51gAhpjrVZMRHA
Date: Mon, 19 Jan 2026 08:58:52 +0000
Message-ID: 
 <AS1PR10MB56971D1500EADD5D48DA5C3DFD88A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260119081635.3976267-1-mingli.yu@windriver.com>
In-Reply-To: <20260119081635.3976267-1-mingli.yu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=27b74138-5cc7-4d73-a246-74f19366c93d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-19T08:57:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7988:EE_
x-ms-office365-filtering-correlation-id: a6bd19e7-d90f-4009-3501-08de5738f80e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?chl7zXgr8mha9WuGa0EVzq2nkUGQCj6hOTgykMLwQXAkkXoqfSgw2aoGtAvY?=
 =?us-ascii?Q?nqRnXOHukbFZgpb2OwJ2u3adlbG4SCWaFJeZ1IYjzissRDynCDkDh3Q6XVqY?=
 =?us-ascii?Q?zPopfJ50MOZRjD5UCIvgIWCDoWD5jQTuShxYSl36/Xa3I8Hi0OIDU3mOMKrV?=
 =?us-ascii?Q?Ja56ESfUvzRQD//Q7EeRxrGSY5+X1ceYfR8I5Tu8WMlo+4zR+OOX2tc6ygh0?=
 =?us-ascii?Q?8i6vQW8lfQlL7iQWSIHqa3nUhOOtZgH3Tu6U75Yx/ffxvH2PBcWnq/eV5un6?=
 =?us-ascii?Q?E0CsPMLNkHg6BRfl8nLteUgNmclWapUmpVbHh8e2sQ/1My64im/GogO59grP?=
 =?us-ascii?Q?v9VCMNp/IALTpxZ0d1qUlUdrW6KieMDVkvvkWk86ZhH6n2uN7lcxzZfpV2Z7?=
 =?us-ascii?Q?HH3iE+0rhVD2tfmS1Hzo4Hsoy6n4asU3bilznMqL1MD7jGdlVTYu1eTDCz6Q?=
 =?us-ascii?Q?98AWJmj4RiDXNCLkFoYMC9k4djaHeJxpxgUO0aOq7n0/NqFvn0lmc8TLzZYQ?=
 =?us-ascii?Q?QubSqr5AvFruExehpVGvZwJT3hL9Aj0V7PqaaD5LxprKJV6sFVn5Y6XiZdaF?=
 =?us-ascii?Q?5kVdP/e8oP8j0skFMitnJjI0Aycqh+KTCOQBQFJqib2kSPYoKLjp/VfEbqYt?=
 =?us-ascii?Q?II5w4SxbDZy7n0gIac3wLyzKxgQiV8HNcnQ4zvJnlwzcji08ClGoAinNkOpO?=
 =?us-ascii?Q?WYoTcR3U6KOMaHAz3JZgr4/CLXurdjFlcdV7ke7aoljgLJHnQHupSXw/gi2v?=
 =?us-ascii?Q?0H3caROawj9Qbkz103c5T5XBUUkr/URPDEBl4aA0rj/11Ed5ZCOhAWkDX71E?=
 =?us-ascii?Q?ZfNW4eNBKh3RayzIxDV7d7TXd3Ae5br4bhpwJuFGC1+6N2AlYAwL+3jsfQNf?=
 =?us-ascii?Q?/ToTpivNm25iGzKNDNOVEgMI2orgJ3yLva3+iMubi/ucakLQGdE3+0yFtm1n?=
 =?us-ascii?Q?Q7XXM81ZDdFM9GwhHSIEsc56s4CZb2I31Lqln/PCNv9ZYA7No5/YbgXG0ySo?=
 =?us-ascii?Q?o/Wzch03+MTWHrbaWJJLLByP0W5g2bApxGYtQP9t3tcVQl0z2FoOPhDR94H9?=
 =?us-ascii?Q?4mo8VK1EOicMo3N6gi3HOhY08utx34hel63lgdTVd0U1+kXHYqBXniS+Rm0K?=
 =?us-ascii?Q?K5lT3ICn3WYzFZZkRDBh3FzTxdKsFuQWmAXu9MkoZ6UfgvGasWoVEsW1h9N+?=
 =?us-ascii?Q?sr3a9AliK8yJgGVmHRLn3L5HFcmU8XNSdSRXeEVtUz41O/cV7IYLuj4aNXew?=
 =?us-ascii?Q?B9MC/abVSAc2GK/wzrxHBkEQgUt99tUv4Eo6e0wxMw9mbXHTdzVeXAOSBZrj?=
 =?us-ascii?Q?FWL5dXdv/EU6t4au2dQukuiE0J00LeyyZmV6PnUxxLlaVIvONCGnw4zso3Qz?=
 =?us-ascii?Q?RaGl+j03XfUigQjEKxac0IpqnBrrAZZ4xvE/9n38uZn9aGnsvkBCOblqb5/m?=
 =?us-ascii?Q?t8SbWoI8DzX8e6FoiQbJfaqXegE+SSjXj7sM2U5A9n+20W+hDotgQ/shY9ex?=
 =?us-ascii?Q?a5g6lOo04GSr0zUayIXXXEgCis/M+DI2SXYnBo9DY2ZiBNY9Fh4L0LbuEqPi?=
 =?us-ascii?Q?f1k7MKLvKSKTKY+cEso=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OJWfXyrc9lowdkxtnn7jzMslvFGTX74tkN+JbfUAjtRMz1iOMC4nesNDWJAS?=
 =?us-ascii?Q?7I0RYxoREEIpBpuP+D1v3YB6kgk+vqdOdFmQOUGN29DhAOIi+QHIwnhIsqau?=
 =?us-ascii?Q?BgvVwsVGGEG+yl7ngFmx9zM4tlSta37joO8MjiWgZV4OD/16iVRnCvlA2ENK?=
 =?us-ascii?Q?nbOXzJH7udzmMWiQfnEIZPL7mQHObyy4QX78QinhKKEjO9LqTjMgKGK/CbZ0?=
 =?us-ascii?Q?64zsmIsqZp7nFGaP2vhS/EgGA0JDuLLWvz5+QO3Poj6mpf8vYTE3ZWz0llxu?=
 =?us-ascii?Q?mgQbazLMqSO40hD40+PcTg79/2S7/xWWcS/R0LaXYsb0ncEK+4hBizp635g4?=
 =?us-ascii?Q?MHnZaAHWSWqDb/8IrIMpcKpAdPUXS8WGt43d0LiywnTrkazD29r4kDEuRYf/?=
 =?us-ascii?Q?aLFqKdk16T/wm3kRyqGAyDsJY2fnz8ubQBq0JwUnMAZhxzyEIrOEjz0yoSKs?=
 =?us-ascii?Q?j7Ya74saRyK4IuRiA4g+7/vPPBDqTalk56v2tXiudwBS6lvL+74RSJtcAjBv?=
 =?us-ascii?Q?AgyGQA+48ZFmUyLiObgVp6E1pwQ0Ud7SnM+Tahr47mVBW65hnSqj+or9eLYH?=
 =?us-ascii?Q?C/9AKGq5owxSeVN7Lr6N0nzCsn42d0FPeuowrgCuCB4U375YtV8SFQvO0a7r?=
 =?us-ascii?Q?coLR7M+WmH5jjwZbDNNUZlKBWk2XDQ7bdWra00Lwm3SDembqabcSVCHgXyiq?=
 =?us-ascii?Q?f6mliKAfaGfO0VYvaeCxHA6OQ/8u6ik4UftE8XR+S1e018ldOUw9cJH1Z+3d?=
 =?us-ascii?Q?Rx1DfQFC6dUy6cexeSnsxVeHZ9zIOL2V28vXxpIB5jFOrToEJaxxWO+KUve9?=
 =?us-ascii?Q?EJEB8k3rpmuzrBlb7n4OwxFg2Y//t1XOf4GaLWjtnapHMggh9Jq66Q2uEnVi?=
 =?us-ascii?Q?bv12I36N13eF8QKcrk4hHAdC+SSAbHAFHVvCugqZCJn0LLv3tS5m8M+rcVYT?=
 =?us-ascii?Q?k77OoCoGF9/Fa699iYIWbjkyZXnOgge6YLRrWfHuBsh4mdUDAJ9dDKH0GOIY?=
 =?us-ascii?Q?4rkVj0QNhDpi6duP/7LeF5B4GhhdbNWaNpHCzho8YxGEPnUKJawrNEh4yINj?=
 =?us-ascii?Q?jxwDfWtMuEHnn+je8b7eMrhJT8Z9EWkYQJmtOLUttyF9DfzOEwe09/eRrKQv?=
 =?us-ascii?Q?BdUuDxIQmqHayBPN101GqDiEqeBWeZxBTydb3pyHI/cLHkhRIE57yZ57peVa?=
 =?us-ascii?Q?CqN6/V4ultLCilyz7QTFroYSYupYTYxxNLbqlZbsbjCXTVigRg6WE8u7icWj?=
 =?us-ascii?Q?ioDdMqabv4kj487zxHGBEIweflqpibXDTWii1CjVNSx93kS42oB6ZP68+GkV?=
 =?us-ascii?Q?EF8BLc+Nw4KrP9dgpVzw7xVGGrnlIfrDOGnUBIvcUoorUC6ZvTD3TRI3Ze00?=
 =?us-ascii?Q?ZNESWFymXyJ3Qvi1Hm/QwCXjvqRYgxcC/O6V3G03NnUPgjCxxwoq17QCSqbn?=
 =?us-ascii?Q?fPUCBFJA5ExJhRoRhMjlAKhVO+mmzletZjkRYuUMvSo55P9z04MrNQTvbYHY?=
 =?us-ascii?Q?cV4JIYI0dvavzgcCSXNmZ4RTy5jYhV9v7zRTb59ycRVd5HaboX9Me4oxrRsv?=
 =?us-ascii?Q?kY/wuDkNvLSGDe1BSZHMu99sxEdb0mZoHTa8mFdlFtiT3N2Kk/30QRsjbvVJ?=
 =?us-ascii?Q?QsceX5YHi4C5d0+ifafWrtdWC60SoRx4O23fPeipd1M9V/codevxdUNdACWw?=
 =?us-ascii?Q?g7+7jXx4F1iGSMSN4JyqkCqhrsh2JaFZUPaGTdxFJtqvsbEYWNVBogo5vv5Q?=
 =?us-ascii?Q?HC6JUSOdGA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bd19e7-d90f-4009-3501-08de5738f80e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 08:58:52.4596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5B390qlyyY3mMlqsDJjGu4E9Bo7MnL0yh+jl0v1N9PB9cYr3b4fPkbnacwiDR+VTXsiDOwm631NnQ14GgWyweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229599

Not sure which one is nicer for this useless CVE.
Removing related files as this patch or setting CVE_STATUS as in https://li=
sts.openembedded.org/g/openembedded-core/message/229564
Let the maintainers decide...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yu, Mingli via
> lists.openembedded.org
> Sent: Monday, January 19, 2026 9:17
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] zlib: Fix CVE-2026-22184
>=20
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Backport a patch [1] to fix CVE-2026-22184.
>=20
> [1]
> https://github.com/madler/zlib/commit/1a40058a92d525aa49a6eac698cfde500fc=
9b
> 92f
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../zlib/zlib/CVE-2026-22184.patch            | 753 ++++++++++++++++++
>  meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
>  2 files changed, 754 insertions(+)
>  create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-22184.patch
>=20
> diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-22184.patch b/meta/reci=
pes-
> core/zlib/zlib/CVE-2026-22184.patch
> new file mode 100644
> index 0000000000..130195d1ff
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib/CVE-2026-22184.patch
> @@ -0,0 +1,753 @@
> +From 1a40058a92d525aa49a6eac698cfde500fc9b92f Mon Sep 17 00:00:00 2001
> +From: Mark Adler <git@madler.net>
> +Date: Sun, 11 Jan 2026 13:00:25 -0800
> +Subject: [PATCH] Remove untgz from contrib.
> +
> +CVE: CVE-2026-22184
> +
> +Upstream-Status: Backport
> [https://github.com/madler/zlib/commit/1a40058a92d525aa49a6eac698cfde500f=
c9b
> 92f]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + contrib/README.contrib     |   3 -
> + contrib/untgz/Makefile     |  14 -
> + contrib/untgz/Makefile.msc |  17 -
> + contrib/untgz/untgz.c      | 667 -------------------------------------
> + 4 files changed, 701 deletions(-)
> + delete mode 100644 contrib/untgz/Makefile
> + delete mode 100644 contrib/untgz/Makefile.msc
> + delete mode 100644 contrib/untgz/untgz.c
> +
> +diff --git a/contrib/README.contrib b/contrib/README.contrib
> +index 5e5f950..d9480ee 100644
> +--- a/contrib/README.contrib
> ++++ b/contrib/README.contrib
> +@@ -49,9 +49,6 @@ puff/       by Mark Adler <madler@alumni.caltech.edu>
> + testzlib/   by Gilles Vollant <info@winimage.com>
> +         Example of the use of zlib
> +
> +-untgz/      by Pedro A. Aranda Gutierrez <paag@tid.es>
> +-        A very simple tar.gz file extractor using zlib
> +-
> + vstudio/    by Gilles Vollant <info@winimage.com>
> +         Building a minizip-enhanced zlib with Microsoft Visual Studio
> +         Includes vc11 from kreuzerkrieg and vc12 from davispuh
> +diff --git a/contrib/untgz/Makefile b/contrib/untgz/Makefile
> +deleted file mode 100644
> +index b54266f..0000000
> +--- a/contrib/untgz/Makefile
> ++++ /dev/null
> +@@ -1,14 +0,0 @@
> +-CC=3Dcc
> +-CFLAGS=3D-g
> +-
> +-untgz: untgz.o ../../libz.a
> +-	$(CC) $(CFLAGS) -o untgz untgz.o -L../.. -lz
> +-
> +-untgz.o: untgz.c ../../zlib.h
> +-	$(CC) $(CFLAGS) -c -I../.. untgz.c
> +-
> +-../../libz.a:
> +-	cd ../..; ./configure; make
> +-
> +-clean:
> +-	rm -f untgz untgz.o *~
> +diff --git a/contrib/untgz/Makefile.msc b/contrib/untgz/Makefile.msc
> +deleted file mode 100644
> +index 77b8602..0000000
> +--- a/contrib/untgz/Makefile.msc
> ++++ /dev/null
> +@@ -1,17 +0,0 @@
> +-CC=3Dcl
> +-CFLAGS=3D-MD
> +-
> +-untgz.exe: untgz.obj ..\..\zlib.lib
> +-	$(CC) $(CFLAGS) untgz.obj ..\..\zlib.lib
> +-
> +-untgz.obj: untgz.c ..\..\zlib.h
> +-	$(CC) $(CFLAGS) -c -I..\.. untgz.c
> +-
> +-..\..\zlib.lib:
> +-	cd ..\..
> +-	$(MAKE) -f win32\makefile.msc
> +-	cd contrib\untgz
> +-
> +-clean:
> +-	-del untgz.obj
> +-	-del untgz.exe
> +diff --git a/contrib/untgz/untgz.c b/contrib/untgz/untgz.c
> +deleted file mode 100644
> +index 7857921..0000000
> +--- a/contrib/untgz/untgz.c
> ++++ /dev/null
> +@@ -1,667 +0,0 @@
> +-/*
> +- * untgz.c -- Display contents and extract files from a gzip'd TAR file
> +- *
> +- * written by Pedro A. Aranda Gutierrez <paag@tid.es>
> +- * adaptation to Unix by Jean-loup Gailly <jloup@gzip.org>
> +- * various fixes by Cosmin Truta <cosmint@cs.ubbcluj.ro>
> +- *
> +- * This software is provided 'as-is', without any express or implied
> +- * warranty.  In no event will the authors be held liable for any damag=
es
> +- * arising from the use of this software.
> +- *
> +- * Permission is granted to anyone to use this software for any purpose=
,
> +- * including commercial applications, and to alter it and redistribute =
it
> +- * freely, subject to the following restrictions:
> +- *
> +- * 1. The origin of this software must not be misrepresented; you must =
not
> +- *    claim that you wrote the original software. If you use this softw=
are
> +- *    in a product, an acknowledgment in the product documentation woul=
d be
> +- *    appreciated but is not required.
> +- * 2. Altered source versions must be plainly marked as such, and must =
not be
> +- *    misrepresented as being the original software.
> +- * 3. This notice may not be removed or altered from any source distrib=
ution.
> +- */
> +-
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <string.h>
> +-#include <time.h>
> +-#include <errno.h>
> +-
> +-#include "zlib.h"
> +-
> +-#ifdef _WIN32
> +-#  include <direct.h>
> +-#  include <io.h>
> +-#  include <windows.h>
> +-#  ifndef F_OK
> +-#    define F_OK  0
> +-#  endif
> +-#  define mkdir(dirname,mode)   _mkdir(dirname)
> +-#  ifdef _MSC_VER
> +-#    define access(path,mode)   _access(path,mode)
> +-#    define chmod(path,mode)    _chmod(path,mode)
> +-#    define strdup(str)         _strdup(str)
> +-#  endif
> +-#else
> +-#  include <sys/stat.h>
> +-#  include <unistd.h>
> +-#  include <utime.h>
> +-#endif
> +-
> +-
> +-/* values used in typeflag field */
> +-
> +-#define REGTYPE  '0'            /* regular file */
> +-#define AREGTYPE '\0'           /* regular file */
> +-#define LNKTYPE  '1'            /* link */
> +-#define SYMTYPE  '2'            /* reserved */
> +-#define CHRTYPE  '3'            /* character special */
> +-#define BLKTYPE  '4'            /* block special */
> +-#define DIRTYPE  '5'            /* directory */
> +-#define FIFOTYPE '6'            /* FIFO special */
> +-#define CONTTYPE '7'            /* reserved */
> +-
> +-/* GNU tar extensions */
> +-
> +-#define GNUTYPE_DUMPDIR  'D'    /* file names from dumped directory */
> +-#define GNUTYPE_LONGLINK 'K'    /* long link name */
> +-#define GNUTYPE_LONGNAME 'L'    /* long file name */
> +-#define GNUTYPE_MULTIVOL 'M'    /* continuation of file from another vo=
lume */
> +-#define GNUTYPE_NAMES    'N'    /* file name that does not fit into mai=
n hdr */
> +-#define GNUTYPE_SPARSE   'S'    /* sparse file */
> +-#define GNUTYPE_VOLHDR   'V'    /* tape/volume header */
> +-
> +-
> +-/* tar header */
> +-
> +-#define BLOCKSIZE     512
> +-#define SHORTNAMESIZE 100
> +-
> +-struct tar_header
> +-{                               /* byte offset */
> +-  char name[100];               /*   0 */
> +-  char mode[8];                 /* 100 */
> +-  char uid[8];                  /* 108 */
> +-  char gid[8];                  /* 116 */
> +-  char size[12];                /* 124 */
> +-  char mtime[12];               /* 136 */
> +-  char chksum[8];               /* 148 */
> +-  char typeflag;                /* 156 */
> +-  char linkname[100];           /* 157 */
> +-  char magic[6];                /* 257 */
> +-  char version[2];              /* 263 */
> +-  char uname[32];               /* 265 */
> +-  char gname[32];               /* 297 */
> +-  char devmajor[8];             /* 329 */
> +-  char devminor[8];             /* 337 */
> +-  char prefix[155];             /* 345 */
> +-                                /* 500 */
> +-};
> +-
> +-union tar_buffer
> +-{
> +-  char               buffer[BLOCKSIZE];
> +-  struct tar_header  header;
> +-};
> +-
> +-struct attr_item
> +-{
> +-  struct attr_item  *next;
> +-  char              *fname;
> +-  int                mode;
> +-  time_t             time;
> +-};
> +-
> +-enum { TGZ_EXTRACT, TGZ_LIST, TGZ_INVALID };
> +-
> +-char *prog;
> +-
> +-void error(const char *msg)
> +-{
> +-  fprintf(stderr, "%s: %s\n", prog, msg);
> +-  exit(1);
> +-}
> +-
> +-const char *TGZsuffix[] =3D { "\0", ".tar", ".tar.gz", ".taz", ".tgz", =
NULL };
> +-
> +-/* return the file name of the TGZ archive */
> +-/* or NULL if it does not exist */
> +-
> +-char *TGZfname (const char *arcname)
> +-{
> +-  static char buffer[1024];
> +-  int origlen,i;
> +-
> +-  strcpy(buffer,arcname);
> +-  origlen =3D strlen(buffer);
> +-
> +-  for (i=3D0; TGZsuffix[i]; i++)
> +-    {
> +-       strcpy(buffer+origlen,TGZsuffix[i]);
> +-       if (access(buffer,F_OK) =3D=3D 0)
> +-         return buffer;
> +-    }
> +-  return NULL;
> +-}
> +-
> +-
> +-/* error message for the filename */
> +-
> +-void TGZnotfound (const char *arcname)
> +-{
> +-  int i;
> +-
> +-  fprintf(stderr,"%s: Couldn't find ",prog);
> +-  for (i=3D0;TGZsuffix[i];i++)
> +-    fprintf(stderr,(TGZsuffix[i+1]) ? "%s%s, " : "or %s%s\n",
> +-            arcname,
> +-            TGZsuffix[i]);
> +-  exit(1);
> +-}
> +-
> +-
> +-/* convert octal digits to int */
> +-/* on error return -1 */
> +-
> +-int getoct (char *p,int width)
> +-{
> +-  int result =3D 0;
> +-  char c;
> +-
> +-  while (width--)
> +-    {
> +-      c =3D *p++;
> +-      if (c =3D=3D 0)
> +-        break;
> +-      if (c =3D=3D ' ')
> +-        continue;
> +-      if (c < '0' || c > '7')
> +-        return -1;
> +-      result =3D result * 8 + (c - '0');
> +-    }
> +-  return result;
> +-}
> +-
> +-
> +-/* convert time_t to string */
> +-/* use the "YYYY/MM/DD hh:mm:ss" format */
> +-
> +-char *strtime (time_t *t)
> +-{
> +-  struct tm   *local;
> +-  static char result[32];
> +-
> +-  local =3D localtime(t);
> +-  sprintf(result,"%4d/%02d/%02d %02d:%02d:%02d",
> +-          local->tm_year+1900, local->tm_mon+1, local->tm_mday,
> +-          local->tm_hour, local->tm_min, local->tm_sec);
> +-  return result;
> +-}
> +-
> +-
> +-/* set file time */
> +-
> +-int setfiletime (char *fname,time_t ftime)
> +-{
> +-#ifdef _WIN32
> +-  static int isWinNT =3D -1;
> +-  SYSTEMTIME st;
> +-  FILETIME locft, modft;
> +-  struct tm *loctm;
> +-  HANDLE hFile;
> +-  int result;
> +-
> +-  loctm =3D localtime(&ftime);
> +-  if (loctm =3D=3D NULL)
> +-    return -1;
> +-
> +-  st.wYear         =3D (WORD)loctm->tm_year + 1900;
> +-  st.wMonth        =3D (WORD)loctm->tm_mon + 1;
> +-  st.wDayOfWeek    =3D (WORD)loctm->tm_wday;
> +-  st.wDay          =3D (WORD)loctm->tm_mday;
> +-  st.wHour         =3D (WORD)loctm->tm_hour;
> +-  st.wMinute       =3D (WORD)loctm->tm_min;
> +-  st.wSecond       =3D (WORD)loctm->tm_sec;
> +-  st.wMilliseconds =3D 0;
> +-  if (!SystemTimeToFileTime(&st, &locft) ||
> +-      !LocalFileTimeToFileTime(&locft, &modft))
> +-    return -1;
> +-
> +-  if (isWinNT < 0)
> +-    isWinNT =3D (GetVersion() < 0x80000000) ? 1 : 0;
> +-  hFile =3D CreateFile(fname, GENERIC_WRITE, 0, NULL, OPEN_EXISTING,
> +-                     (isWinNT ? FILE_FLAG_BACKUP_SEMANTICS : 0),
> +-                     NULL);
> +-  if (hFile =3D=3D INVALID_HANDLE_VALUE)
> +-    return -1;
> +-  result =3D SetFileTime(hFile, NULL, NULL, &modft) ? 0 : -1;
> +-  CloseHandle(hFile);
> +-  return result;
> +-#else
> +-  struct utimbuf settime;
> +-
> +-  settime.actime =3D settime.modtime =3D ftime;
> +-  return utime(fname,&settime);
> +-#endif
> +-}
> +-
> +-
> +-/* push file attributes */
> +-
> +-void push_attr(struct attr_item **list,char *fname,int mode,time_t time=
)
> +-{
> +-  struct attr_item *item;
> +-
> +-  item =3D (struct attr_item *)malloc(sizeof(struct attr_item));
> +-  if (item =3D=3D NULL)
> +-    error("Out of memory");
> +-  item->fname =3D strdup(fname);
> +-  item->mode  =3D mode;
> +-  item->time  =3D time;
> +-  item->next  =3D *list;
> +-  *list       =3D item;
> +-}
> +-
> +-
> +-/* restore file attributes */
> +-
> +-void restore_attr(struct attr_item **list)
> +-{
> +-  struct attr_item *item, *prev;
> +-
> +-  for (item =3D *list; item !=3D NULL; )
> +-    {
> +-      setfiletime(item->fname,item->time);
> +-      chmod(item->fname,item->mode);
> +-      prev =3D item;
> +-      item =3D item->next;
> +-      free(prev);
> +-    }
> +-  *list =3D NULL;
> +-}
> +-
> +-
> +-/* match regular expression */
> +-
> +-#define ISSPECIAL(c) (((c) =3D=3D '*') || ((c) =3D=3D '/'))
> +-
> +-int ExprMatch (char *string,char *expr)
> +-{
> +-  while (1)
> +-    {
> +-      if (ISSPECIAL(*expr))
> +-        {
> +-          if (*expr =3D=3D '/')
> +-            {
> +-              if (*string !=3D '\\' && *string !=3D '/')
> +-                return 0;
> +-              string ++; expr++;
> +-            }
> +-          else if (*expr =3D=3D '*')
> +-            {
> +-              if (*expr ++ =3D=3D 0)
> +-                return 1;
> +-              while (*++string !=3D *expr)
> +-                if (*string =3D=3D 0)
> +-                  return 0;
> +-            }
> +-        }
> +-      else
> +-        {
> +-          if (*string !=3D *expr)
> +-            return 0;
> +-          if (*expr++ =3D=3D 0)
> +-            return 1;
> +-          string++;
> +-        }
> +-    }
> +-}
> +-
> +-
> +-/* recursive mkdir */
> +-/* abort on ENOENT; ignore other errors like "directory already exists"=
 */
> +-/* return 1 if OK */
> +-/*        0 on error */
> +-
> +-int makedir (char *newdir)
> +-{
> +-  char *buffer =3D strdup(newdir);
> +-  char *p;
> +-  int  len =3D strlen(buffer);
> +-
> +-  if (len <=3D 0) {
> +-    free(buffer);
> +-    return 0;
> +-  }
> +-  if (buffer[len-1] =3D=3D '/') {
> +-    buffer[len-1] =3D '\0';
> +-  }
> +-  if (mkdir(buffer, 0755) =3D=3D 0)
> +-    {
> +-      free(buffer);
> +-      return 1;
> +-    }
> +-
> +-  p =3D buffer+1;
> +-  while (1)
> +-    {
> +-      char hold;
> +-
> +-      while(*p && *p !=3D '\\' && *p !=3D '/')
> +-        p++;
> +-      hold =3D *p;
> +-      *p =3D 0;
> +-      if ((mkdir(buffer, 0755) =3D=3D -1) && (errno =3D=3D ENOENT))
> +-        {
> +-          fprintf(stderr,"%s: Couldn't create directory %s\n",prog,buff=
er);
> +-          free(buffer);
> +-          return 0;
> +-        }
> +-      if (hold =3D=3D 0)
> +-        break;
> +-      *p++ =3D hold;
> +-    }
> +-  free(buffer);
> +-  return 1;
> +-}
> +-
> +-
> +-int matchname (int arg,int argc,char **argv,char *fname)
> +-{
> +-  if (arg =3D=3D argc)      /* no arguments given (untgz tgzarchive) */
> +-    return 1;
> +-
> +-  while (arg < argc)
> +-    if (ExprMatch(fname,argv[arg++]))
> +-      return 1;
> +-
> +-  return 0; /* ignore this for the moment being */
> +-}
> +-
> +-
> +-/* tar file list or extract */
> +-
> +-int tar (gzFile in,int action,int arg,int argc,char **argv)
> +-{
> +-  union  tar_buffer buffer;
> +-  int    len;
> +-  int    err;
> +-  int    getheader =3D 1;
> +-  int    remaining =3D 0;
> +-  FILE   *outfile =3D NULL;
> +-  char   fname[BLOCKSIZE];
> +-  int    tarmode;
> +-  time_t tartime;
> +-  struct attr_item *attributes =3D NULL;
> +-
> +-  if (action =3D=3D TGZ_LIST)
> +-    printf("    date      time     size                       file\n"
> +-           " ---------- -------- --------- ----------------------------=
---------\n");
> +-  while (1)
> +-    {
> +-      len =3D gzread(in, &buffer, BLOCKSIZE);
> +-      if (len < 0)
> +-        error(gzerror(in, &err));
> +-      /*
> +-       * Always expect complete blocks to process
> +-       * the tar information.
> +-       */
> +-      if (len !=3D BLOCKSIZE)
> +-        {
> +-          action =3D TGZ_INVALID; /* force error exit */
> +-          remaining =3D 0;        /* force I/O cleanup */
> +-        }
> +-
> +-      /*
> +-       * If we have to get a tar header
> +-       */
> +-      if (getheader >=3D 1)
> +-        {
> +-          /*
> +-           * if we met the end of the tar
> +-           * or the end-of-tar block,
> +-           * we are done
> +-           */
> +-          if (len =3D=3D 0 || buffer.header.name[0] =3D=3D 0)
> +-            break;
> +-
> +-          tarmode =3D getoct(buffer.header.mode,8);
> +-          tartime =3D (time_t)getoct(buffer.header.mtime,12);
> +-          if (tarmode =3D=3D -1 || tartime =3D=3D (time_t)-1)
> +-            {
> +-              buffer.header.name[0] =3D 0;
> +-              action =3D TGZ_INVALID;
> +-            }
> +-
> +-          if (getheader =3D=3D 1)
> +-            {
> +-              strncpy(fname,buffer.header.name,SHORTNAMESIZE);
> +-              if (fname[SHORTNAMESIZE-1] !=3D 0)
> +-                  fname[SHORTNAMESIZE] =3D 0;
> +-            }
> +-          else
> +-            {
> +-              /*
> +-               * The file name is longer than SHORTNAMESIZE
> +-               */
> +-              if (strncmp(fname,buffer.header.name,SHORTNAMESIZE-1) !=
=3D 0)
> +-                  error("bad long name");
> +-              getheader =3D 1;
> +-            }
> +-
> +-          /*
> +-           * Act according to the type flag
> +-           */
> +-          switch (buffer.header.typeflag)
> +-            {
> +-            case DIRTYPE:
> +-              if (action =3D=3D TGZ_LIST)
> +-                printf(" %s     <dir> %s\n",strtime(&tartime),fname);
> +-              if (action =3D=3D TGZ_EXTRACT)
> +-                {
> +-                  makedir(fname);
> +-                  push_attr(&attributes,fname,tarmode,tartime);
> +-                }
> +-              break;
> +-            case REGTYPE:
> +-            case AREGTYPE:
> +-              remaining =3D getoct(buffer.header.size,12);
> +-              if (remaining =3D=3D -1)
> +-                {
> +-                  action =3D TGZ_INVALID;
> +-                  break;
> +-                }
> +-              if (action =3D=3D TGZ_LIST)
> +-                printf(" %s %9d %s\n",strtime(&tartime),remaining,fname=
);
> +-              else if (action =3D=3D TGZ_EXTRACT)
> +-                {
> +-                  if (matchname(arg,argc,argv,fname))
> +-                    {
> +-                      outfile =3D fopen(fname,"wb");
> +-                      if (outfile =3D=3D NULL) {
> +-                        /* try creating directory */
> +-                        char *p =3D strrchr(fname, '/');
> +-                        if (p !=3D NULL) {
> +-                          *p =3D '\0';
> +-                          makedir(fname);
> +-                          *p =3D '/';
> +-                          outfile =3D fopen(fname,"wb");
> +-                        }
> +-                      }
> +-                      if (outfile !=3D NULL)
> +-                        printf("Extracting %s\n",fname);
> +-                      else
> +-                        fprintf(stderr, "%s: Couldn't create %s",prog,f=
name);
> +-                    }
> +-                  else
> +-                    outfile =3D NULL;
> +-                }
> +-              getheader =3D 0;
> +-              break;
> +-            case GNUTYPE_LONGLINK:
> +-            case GNUTYPE_LONGNAME:
> +-              remaining =3D getoct(buffer.header.size,12);
> +-              if (remaining < 0 || remaining >=3D BLOCKSIZE)
> +-                {
> +-                  action =3D TGZ_INVALID;
> +-                  break;
> +-                }
> +-              len =3D gzread(in, fname, BLOCKSIZE);
> +-              if (len < 0)
> +-                error(gzerror(in, &err));
> +-              if (fname[BLOCKSIZE-1] !=3D 0 || (int)strlen(fname) > rem=
aining)
> +-                {
> +-                  action =3D TGZ_INVALID;
> +-                  break;
> +-                }
> +-              getheader =3D 2;
> +-              break;
> +-            default:
> +-              if (action =3D=3D TGZ_LIST)
> +-                printf(" %s     <---> %s\n",strtime(&tartime),fname);
> +-              break;
> +-            }
> +-        }
> +-      else
> +-        {
> +-          unsigned int bytes =3D (remaining > BLOCKSIZE) ? BLOCKSIZE : =
remaining;
> +-
> +-          if (outfile !=3D NULL)
> +-            {
> +-              if (fwrite(&buffer,sizeof(char),bytes,outfile) !=3D bytes=
)
> +-                {
> +-                  fprintf(stderr,
> +-                    "%s: Error writing %s -- skipping\n",prog,fname);
> +-                  fclose(outfile);
> +-                  outfile =3D NULL;
> +-                  remove(fname);
> +-                }
> +-            }
> +-          remaining -=3D bytes;
> +-        }
> +-
> +-      if (remaining =3D=3D 0)
> +-        {
> +-          getheader =3D 1;
> +-          if (outfile !=3D NULL)
> +-            {
> +-              fclose(outfile);
> +-              outfile =3D NULL;
> +-              if (action !=3D TGZ_INVALID)
> +-                push_attr(&attributes,fname,tarmode,tartime);
> +-            }
> +-        }
> +-
> +-      /*
> +-       * Abandon if errors are found
> +-       */
> +-      if (action =3D=3D TGZ_INVALID)
> +-        {
> +-          error("broken archive");
> +-          break;
> +-        }
> +-    }
> +-
> +-  /*
> +-   * Restore file modes and time stamps
> +-   */
> +-  restore_attr(&attributes);
> +-
> +-  if (gzclose(in) !=3D Z_OK)
> +-    error("failed gzclose");
> +-
> +-  return 0;
> +-}
> +-
> +-
> +-/*
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> +-
> +-void help(int exitval)
> +-{
> +-  printf("untgz version 0.2.1\n"
> +-         "  using zlib version %s\n\n",
> +-         zlibVersion());
> +-  printf("Usage: untgz file.tgz            extract all files\n"
> +-         "       untgz file.tgz fname ...  extract selected files\n"
> +-         "       untgz -l file.tgz         list archive contents\n"
> +-         "       untgz -h                  display this help\n");
> +-  exit(exitval);
> +-}
> +-
> +-
> +-/*
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> +-
> +-#if defined(WIN32) && defined(__GNUC__)
> +-int _CRT_glob =3D 0;      /* disable argument globbing in MinGW */
> +-#endif
> +-
> +-int main(int argc,char **argv)
> +-{
> +-    int         action =3D TGZ_EXTRACT;
> +-    int         arg =3D 1;
> +-    char        *TGZfile;
> +-    gzFile      f;
> +-
> +-    prog =3D strrchr(argv[0],'\\');
> +-    if (prog =3D=3D NULL)
> +-      {
> +-        prog =3D strrchr(argv[0],'/');
> +-        if (prog =3D=3D NULL)
> +-          {
> +-            prog =3D strrchr(argv[0],':');
> +-            if (prog =3D=3D NULL)
> +-              prog =3D argv[0];
> +-            else
> +-              prog++;
> +-          }
> +-        else
> +-          prog++;
> +-      }
> +-    else
> +-      prog++;
> +-
> +-    if (argc =3D=3D 1)
> +-      help(0);
> +-
> +-    if (strcmp(argv[arg],"-l") =3D=3D 0)
> +-      {
> +-        action =3D TGZ_LIST;
> +-        if (argc =3D=3D ++arg)
> +-          help(0);
> +-      }
> +-    else if (strcmp(argv[arg],"-h") =3D=3D 0)
> +-      {
> +-        help(0);
> +-      }
> +-
> +-    if ((TGZfile =3D TGZfname(argv[arg])) =3D=3D NULL)
> +-      TGZnotfound(argv[arg]);
> +-
> +-    ++arg;
> +-    if ((action =3D=3D TGZ_LIST) && (arg !=3D argc))
> +-      help(1);
> +-
> +-/*
> +- *  Process the TGZ file
> +- */
> +-    switch(action)
> +-      {
> +-      case TGZ_LIST:
> +-      case TGZ_EXTRACT:
> +-        f =3D gzopen(TGZfile,"rb");
> +-        if (f =3D=3D NULL)
> +-          {
> +-            fprintf(stderr,"%s: Couldn't gzopen %s\n",prog,TGZfile);
> +-            return 1;
> +-          }
> +-        exit(tar(f, action, arg, argc, argv));
> +-      break;
> +-
> +-      default:
> +-        error("Unknown option");
> +-        exit(1);
> +-      }
> +-
> +-    return 0;
> +-}
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-
> core/zlib/zlib_1.3.1.bb
> index 592b7f1422..cd6cdb6aa6 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://zlib.h;beginline=3D6;endline=3D23;md5=3D5377232268e952e9ef6
>  # The source tarball needs to be .gz as only the .gz ends up in fossils/
>  SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
>             file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> +           file://CVE-2026-22184.patch \
>             file://run-ptest \
>             "
>  UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> --
> 2.34.1


