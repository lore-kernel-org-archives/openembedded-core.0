Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248FC41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:20:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.52151.1690215618541641239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=vclr4aTA;
 spf=pass (domain: welotec.com, ip: 40.107.6.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf7Ub4diu9+N2oO/bLgcE9cYCjq7HuADEAEpdIdH7e9G7Cr6PgizUzAAJDNX1vNxLVlA8qzswofe3ZKgCLOF6VPru8txlJKO2N0DdGniVkf7dB+vdrt57r97TGqdjCC+Ljhe5td7VP0STpXEYQ4w/NsBMh1YCUxe6t/qBGK6RrA8iq01j7X6dA2PMROTCsG+xtsKmId9Gx6N0nZYbR8fCLAg3rHYwpGpdWNkQ991MVVPovHuXzJKHyfpFt3To6KeCkhtLCTYsqPnkzUxmvg5lQyTto3Oo9YOYO29iBbv+KCAcMtv16WWnsx2+lzQiOE/mRVdgLTX+HPpTYEhB6jr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=L9gFYWhs0kw7p1w9mEpWR5OaHSa6KrxAE5ckaGUgMzez5wf1BVZgMsjRdA+/lpqH4nb7WMfqWI6MT7U/xp8rlReIRLs5wSJW77RCJrtpukOEKaIewhtexXg6PXV8FEM9g005vuFn4i3kitgYaVgxhjxoWcKTbMAZ6RV8CHb4Tz66dtAORWoXduxKmgwiqB08t0t0f1ybdey4EN1/YcqrMLZCBGzL3bHNk2OuD+oc8VBW1FnyJNCSDa34+WWZflG1uUaKNUsUtM4t2J+ADs2aeGXKZwGXNf/Pah++nfeo3jy0MuzDUxEns0hhBdwDozI8J/Lzp2ZGSg2igb1IQCeULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=vclr4aTA2Wt0LKEHFQZXrD5HlbxtSlYkX1m6NrfqaZyvHvPhInCj/R3+V1982KsuMIj4jR2bcOEusCBnU7IOkUZFDZ44n1iFRpPuAHrJZejqGv1eBfdg0tFMfuVPHCuuAqUyx5PzPGrFvxKJL1DZGV8l3VxyhdMmGFubKwjKKNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 16:20:15 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:20:15 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Mon, 24 Jul 2023 18:20:03 +0200
Message-ID: <20230724162007.3701193-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf2cae6-f054-4f0b-31fd-08db8c61dd47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pklds3Gax8S7Gs9rIUdFsGxb/1U0h0+JQ52u65x8UvCn5Yiy5KTezRIaUu/HRk7CJjIKyUQURvBoyAgfQr8KFxKPxakF/04zp/dvnvE4VzqVW7Xi3sCvadmTiN2KMQLxe2M1KhIKR4ZhXjDDQ5y+np/LNfa+1LjKdG0iho+LErdOx76XyJMCO2wljnBX6fY1afTvVWMKFzWr/V+dXby/SACRM+xO80xKISTgVCNbDJqbdo9SplfBM3nUKX+m+gEbyj0Lqs8EAr5oNk322XZWqou6CqS6VaMh06TjalQny9i5iAHTZZnua/WIB/3baLaT6G6IS6yPnuctrF7y4zYWyBn3TTXyLqyfT/grCB9iP1kxZw+xdiOv9ATZe1yhdfshyTvl4CerIvEE270upamG/WYl9dQxI138a9cUUTk0mFePtW7VsOwdtdbrLlDv6d+LyYHiJyrmeOBMD868/G9R8hA/JAWNLcm1BwH+EDazcERpLHcBq+KRf4Fet9MmoG/+Hn30QqKEw44JErUT0gzeTOuXBLVRo4earGnhe3Xq/R1295RYkvOpX14S69/hWbjrnrQ0u/kOz9XGRb9uAD64tqkhgGDKF6+Vo2HTXBMfPh0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(451199021)(6666004)(966005)(6512007)(52116002)(6486002)(478600001)(186003)(2616005)(1076003)(26005)(6506007)(107886003)(2906002)(316002)(41300700001)(6916009)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?II+Wzvu4BtuWHtZnBOPlsCFSy2P9UlN6+O7w+IQ2s4C8sW9VDN8VJZZSVlin?=
 =?us-ascii?Q?lAM5Ls7plydtwDm64piGox5qX6anc/PzsR1xcNRIAinArN+Q/Ze02HTqvq0M?=
 =?us-ascii?Q?3JcxsayyYMGR6SJqeRtDdqp9RsD9lW7qFla7QB59onmm2t4geYkw9UKNj5TV?=
 =?us-ascii?Q?IQ1ExWd0grd2CaSyaWsZyUp3SRwHAG6Is5GQf1k/T5zDZ0QzVi5Nh3Utqq18?=
 =?us-ascii?Q?6kjGWadiaPD0Op22acu8pg5TGx20c0To651jr7m5LucBG8Pl/Z1kwAhuBqO0?=
 =?us-ascii?Q?F66bcG7cjIMMwtlpn8JqlT0nVAUl0+qN1Gmm4fFKWso6q3zsYLTEX/p9PR2i?=
 =?us-ascii?Q?PLTh78ccOT0sp8m+KDv9S62P7vpYkrJ6u+LckbVqVNBg+n6niz3Vj4jL01Qb?=
 =?us-ascii?Q?1YkAxfNPDpsDdcNBk/vni+4hlWv+IxLk+QAll7wpxEHvFLM11u931V7VZ4TE?=
 =?us-ascii?Q?nNtKCtoHLMlUYiiIAwLnWQ1+FitTkSnxrNh+YJUVQoqcK46S4cUoQI1YEo7V?=
 =?us-ascii?Q?eZ4EG0hPBAbWTuNIvWSzmBLIHJ80q27e0LvSyR6GLrfrSQrDEyEclY6ZvJoP?=
 =?us-ascii?Q?0Nr0LnHLikuOtimHS+EMCsrdCJoIR0baL48v5Htz7Uk/zpy2J0A8b7ot3Lv8?=
 =?us-ascii?Q?JeVKJMCo1yMZoR/ef2QX2rJxY1/vtbrEbqqAeBZXjMStHabdJdU9RvB+SLps?=
 =?us-ascii?Q?IS8AHnaj5Da+zZotQAnRgCEXlfTX77p6SXZP0j3AR6JDCUz8bI3NO2dkSBbA?=
 =?us-ascii?Q?m6XrOSbzLfwNTvM/q1xRYNCx/KHbfLUppDntPjXozeI8fsu2LZKqzgbeJKqr?=
 =?us-ascii?Q?a3WMEafECNtW0HZUQywmAjNBFJeM4Q4mig6QEPnQAmNnDqlaAhxeKP+GsYB/?=
 =?us-ascii?Q?fjbYYZoSu/eBO2WgBZLpSDlq0kSgGZtYVe4zXyiMYPeGsfBJ/93h62U+IIj0?=
 =?us-ascii?Q?dK2JY7suIcW8spom+cjKNJ+QkiBUd4EsmL9jLXGRij+XgdakpF0Wep0BxDkT?=
 =?us-ascii?Q?BNTf4d/ZTPM0yj4WNRG0zih/oRCesiO/h4m3hLquQxTh+M26KA0Pcembl+pe?=
 =?us-ascii?Q?BIP66lAOyOEgK5JtA8AJOcd1HZPss+KwtwP1lUyzWwVwRkhzEOSUPBpszfKE?=
 =?us-ascii?Q?/oaIOC56FFbeedsFDGaobej+OXakOiLjiOFu/vDO1X77RdeVcxNI35clIK9x?=
 =?us-ascii?Q?fICLl3r3GtiuHH27KfWSiWkhca0V8tO8DiRYFUFVKX7cTrMcvHki3jN/6mRW?=
 =?us-ascii?Q?S2K1XgzqdYtsaHwManKK6SqYfkjgeEF0OYulpNtdFqm1sSoNlooZ60OsTJ+2?=
 =?us-ascii?Q?+20VD3HYQJYK5MvIT3e2VUcecPs4GrFhHL7KvOH8DfqrgEI+Mxc6aKqcH1E+?=
 =?us-ascii?Q?bHiiW/ftqZT32AYTs35pVQKGUYJMPs5F0w7LBGOFh6INS3OVPoPdbsXWVmSg?=
 =?us-ascii?Q?BgXaEuFZFOq+tSzzzLDGCGEKnwOnoWeTIvfvB8h9g61i499AY4yPv+WNYUG2?=
 =?us-ascii?Q?Zi/7zOIeSXyUqUQVbRJNfPODszJ0DC++nd0JzXDkcvHH8SiU4F5okkXBGRUk?=
 =?us-ascii?Q?14lbxGk2TjuLulRvtenI3w7GUQZIrpmkLocankcA?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf2cae6-f054-4f0b-31fd-08db8c61dd47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:20:15.7151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qzUz2rUm9E8K8CYZKjxUC+sLbpjDIQyAMtA2FEiV5idtZBYAxUunoUgkolg6kMFL2fuyry9LKJ1YV3AMgSEew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184797

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


