Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46443CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15259.1762154843864352797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=RK0MovGG;
 spf=pass (domain: navimatix.de, ip: 52.101.84.135, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBRp3aJ/EXlXaaaCkWxlAlIFkwtG5Mi0x2EK3YY/hpvn93o3veygcbeZE/8uKfnSeTy7JqnE7wBKABFCYBzleuLXYw4icLvzJRTBPudX7FslsnTgx3FbucIsAhngrb06D1XDnQvpY2tWF+5SgClJ6cmCE5e+PsDIKDJd8Vp/9EO+qOYTLTEiYkGFFb3wlX7jtEjwY0jgVbAmTbJvEP+zrMp4+pDpBWZ5qDfyW3s5IuLPe+zcCaLuCct8pJb1l7raUMUq0kp8o+FDs67Ze1PHgAC0PD8B8c2039v3Rj++F0X7L51SVyDC4dW6VaT0sbF5yGMjoLSiBlUrIsd8pB9oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBjQgODf29VkBxs9TaMvWL8aSty6IVYdmPacWIoh2xo=;
 b=WJ/oosYkvqtRSH9eU7TxvBnoOC6MRdD2SYmuO8j7xwaWmuxuoJtAMYwSjSZBfGcFwNNhOIT3Rja8duj8ypvY1S26cL/h2EEERn4pqQX4kv0PWNbxwoD6pyBipug3hjUzpYLBLyVdiQ6lmPzG6oTSj32JWjULMwxxopOEcrUL4Oq0v5Tn01EPJ70seYenQSTqoDoxRvyxAj59gCVehK7oMfb4X4ljHzKZeiSONdrSN7X31dsU4NE0mzwv5ZiDG7nVfk/4FPVCRGEpLfREIj9AceoPnBmrN+5wIjXunsKGjL//9iiOGjG226GzZz44Eyas7yBi3i0Duu7jaOkg1vvM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBjQgODf29VkBxs9TaMvWL8aSty6IVYdmPacWIoh2xo=;
 b=RK0MovGGBrwSVbg9NPucTa1ut+o0BMmTmBj9BNW7GtCxVeOjAkV37NsLbS9RXFgxGp5s6jYlWUQtqvF6mUZy/pOo2J/x50N8nQAZOytmK82pMGjAh+de27PPvvuhnRqPIOXGxkJ8qtG7TBF4UELyTw3aY8N2+Ftdm6fqnZPTTtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:22 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:21 +0000
Date: Mon, 3 Nov 2025 08:27:20 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 16/18] gtk4: Convert to gnomebase
Message-ID: <acef39a49423e8f64cedf92579577d66dcc7bfbb.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a38c5fb-dd2f-4388-e926-08de1aaa6d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ftc7n6DUxYazI+LxIH7DcSv3Lttml2K8qgP2AthtBo1P7Z8Ge5mKieCtOOUN?=
 =?us-ascii?Q?oLC66v3GIJo5OilXQqFL7unPoKLAsvR9zVxMrE0sVTG7ptaXKprn80mejlTI?=
 =?us-ascii?Q?L4E5lX4Imf6ocdMcj6SSMUbjGKhefQcdHus45hPdq3ZNPaKd1S4B2quStZ9X?=
 =?us-ascii?Q?kjoWQTg76Ew8fHRfl/P5kwxytOvUGnEqjSLqImOwlJ91Qn7Kp2Se59V3ByYU?=
 =?us-ascii?Q?SiNCPZqDPzpdWAj+u/hCi0EnDXSUAmM+vd8/G5O47azUOfNvdgqucAFQJNpu?=
 =?us-ascii?Q?UptQMaaQX96j3dnIPTqUTMgyV2CtwLjXAlwAWH9Yh8AWcrK1dNuGjOQ0xmE+?=
 =?us-ascii?Q?ey1Q8ho61lKeCz6Qsl0BoV2a5uZ6iTVC7u43zsbsycK7yGqWoscFUEm5JIGP?=
 =?us-ascii?Q?nZkZdU7jFwF27YF/Aossl9e3nc9TYzLSBEndIu6l281iWEY0ATWmStAGUTG7?=
 =?us-ascii?Q?SNn/L6HEVnKddNHnCYFkfNlxUzoIFvOoCu2tmW7ZW7wAaJBYEJFJ6ThIrsF5?=
 =?us-ascii?Q?eZe7bJx/6YRRFEb5IlDRoTODFTBj2t0snVryUU3bt4AXoR8EWAlGxS3Ni4Xv?=
 =?us-ascii?Q?x+z1sfdQHAD7ekeYhLg5HBiI2pRkBEtcnG4DY+34nKlPY9mGxy6mhc8AFt/O?=
 =?us-ascii?Q?14nAazL/dHhkRPe8/jTVw6ErhPPajE8aK7IFiVt9XlkP90E5Xt9ScGREDW4q?=
 =?us-ascii?Q?7cHQCq93KKjRDILhhgS3cNZ2TvzL1hAW6Qal4MG/S/YMcx7obKaqoA5fvtpj?=
 =?us-ascii?Q?iaIyfCFfSY1yyIwALdkodbrsaBUHUoT2l5npc8XfvaIE4neWMlsL1UreFG9Y?=
 =?us-ascii?Q?DaD2pa9xNe7QtPrScbkAqMZw+tYSm0rl/JXNYXuIFTp0D1lyfhJnCRfaQyvP?=
 =?us-ascii?Q?z96lZDvBBf9nHxHTSmRpgNsnlIlqtCof5hEIEAo30sXeayAzNUtBRK0R3l0r?=
 =?us-ascii?Q?CS3FxMMwwxQn2L8gtz2TbrwC2IAdkrt2SXQ6eViWow0+njBoPry4UYHpf9Ih?=
 =?us-ascii?Q?QWpbnrzLURJlBFMp6/oUoTyUo7t/tAH+Onu7gcP5e5vqoqAKIYNVlJTya+0U?=
 =?us-ascii?Q?oXd/WSuKtPaJHHUsTCm7efvq4cFaZnt34zQ39twWjwPAp8GoATMqBgNtxmY7?=
 =?us-ascii?Q?n6n/65phzGHswxtb/zWGaOKw1KjP5V+wRf4JbLsRG83R+ufcjlVzBJvIjI/v?=
 =?us-ascii?Q?kNIPeXmeNjJtAhd5PcuKHVTt3LAGt3nkxT3LXoGM2gymz5n8hPC0mTkjP+El?=
 =?us-ascii?Q?VggOc6zHYpTPds51cR7yoNfhpaLlHzaITEK7pj5p6eVi1rRPtMi0Kzh42u/r?=
 =?us-ascii?Q?gLw0C7SAi/FKKepJVPnyOvn9IePTv7JptSa/EJKn7a64xaFUlQ7qFgI7HmEe?=
 =?us-ascii?Q?vT70HaOMH2Qt7nDC28n7YW1cGpdfeyMRLQie5v75Rve0LzD2O4zGgyqB6Mp9?=
 =?us-ascii?Q?bN1xjpEJI5dMHa/lpNqsghF3pcrdWq2j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CptrGXfGL8i/20F9W21gPxVTxrdcfAwoZJVLSR8x4NPuWJatqntlwNyvXL0L?=
 =?us-ascii?Q?H9N72RBNI+e1heHS5BPG0MHnwyfzAWnQTjlkO2kkN889lxlMmGYrNbMSmVgl?=
 =?us-ascii?Q?nfebcuXQEtKjzZjr82K6jnA5Tmlz623UTC0LNeWdhjc0rOgupRrqC4uhVXTd?=
 =?us-ascii?Q?yaPhXTacQE2OLi/jTg4o6A1fCG0ZL2S7nNPlEOuaUOR+Yq4oDnCnmOLgTQYl?=
 =?us-ascii?Q?ptFXSGCBoTmiICi5guS2GvwVBHmNZhVagX2u04deZw1rHhsCnoB9qhxa3+wD?=
 =?us-ascii?Q?szHHoW3MK07MjCoqEHb42C2J/OYKZ4nAnbdCncXQxW3Bde3JlEsZcLTpSFev?=
 =?us-ascii?Q?MnUm/HnLKzYiLKmOC9j11jA376FNXw4cOxo43W6Ih6s43e7LfOf5c/G5P5xw?=
 =?us-ascii?Q?ePOhaqHwbiVSKaEjJILZk3slKw12M1Ot/XXJJtE5pecidhC4NMzZUOmpBsKL?=
 =?us-ascii?Q?uRlbepX8vY+vYHrm4jHFlHuEDopCPw++MWfabwYPTM1/svrT4tMyvlQDVoMG?=
 =?us-ascii?Q?G9na/91zJZO9IUxzh4k6zOjW7L9hu5gXP8O5UodeYFaQ+DxkYwppTIEdC9Lp?=
 =?us-ascii?Q?TC5sLZWPRewxIevxgjaSONCVijTASTn+cFlUl424RxgLvXPvHbRzkj8OGq34?=
 =?us-ascii?Q?TzwQSkueIYcwpliI0KgO/CaYYT61Sb5jwgozCqSDkApoRzMR8bc4A8cgJdf9?=
 =?us-ascii?Q?7Dp2tfgNiNtGKjL1qiTILihiYMBUJekE+OJGtJyvpimfYotOqfE37P2bFGaV?=
 =?us-ascii?Q?rfFph+0JLPhooOplm7fsQy+8M3dfYZ2p6W500kwcgJBVM/PmOdtBXeCWcsDf?=
 =?us-ascii?Q?afld+Qr7zl6w/FFxz8Qyg2oscrvxNRD4rr8bon8jsdR3mrezF2xZnw56tq5m?=
 =?us-ascii?Q?yyMB2eK1WNeQyZ0npVRMcaa+/pG7CPrz1AyweUZQjZA4h2shDUkFPYPeG2Nj?=
 =?us-ascii?Q?qoI4KEf+m1YI0V1t0ctkKJ2XwqeZ/8b2AJpsuyLeWM6aClo9+8gxz9SBLXom?=
 =?us-ascii?Q?JS9Jy7Z5x64EyBQwMkZAFPVO047pNRNyBhd3sGT7oRZNE9d0EFn9SGQuTWjd?=
 =?us-ascii?Q?d8XSPdZk1hNn/hSedDKBtosQyTaA05Jb+3YMD5AIGmho18ds6AWeUacjMlz8?=
 =?us-ascii?Q?JlsyD7DoM1vBxvBbXuuQu5Pmaiudim3nk3yyqJCefvOZvC54zFHNTVobVZ0K?=
 =?us-ascii?Q?OCFo4bZ7ECWjMlZ08sA+g9/1chsXCSF0j3s7fRpLtPt3kfg6xgeCWOq0pmtC?=
 =?us-ascii?Q?GztiB6Z0v4CQjBcu6KkK9vwZtyh9FtwoyHojDGEimn0q+pUOgj9593EFpPfq?=
 =?us-ascii?Q?geRlsP0I1LsKy7N/qJE22KB/wExE53d/Tmmu5lhEp54KbHyVpHX9uv1KH5tg?=
 =?us-ascii?Q?4xZ6aB6H4sU3wR1oCN/Ys7nb+Y6/tQYgxDm1jxuDuZJWHgDU8ljKKWhBdNR7?=
 =?us-ascii?Q?y3Jw6vLND9uXUFx1yGrddRlcIWKMFoDu1Gb1wjbESRkVGO/ym5kI/gdiOMX8?=
 =?us-ascii?Q?qGytTYbfeycnPDkV9KJFiAC/b1/+hjde59roLWxEp6NODnAc/6CscYRz966q?=
 =?us-ascii?Q?b9reVKWmpebrBoq26H04WMjqDIQDGYURyjKpRzJMVCEl5V+CDY4/vX9D2vgf?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a38c5fb-dd2f-4388-e926-08de1aaa6d82
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:21.8820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRaBAmo4Y7NI1lkgki+KvsWjv4COTJMkVqrEpLMUXyG0gxmN/lht6dS62OVeUhfLpPCgXIMP64yJ8P6d6se40baE4idb+SGVWPGH33Ku4Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225607

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.20.2.bb | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.20.2.bb
index 9fcb55b52a..d04251927f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -33,18 +33,15 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d2=
9fb2 \
 "
=20
-MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI[archive.sha256sum] =3D "5e8240edecafaff2b8baf4663bdceaa668ef10a207=
bee4d7f90e010e10bddc5c"
=20
-UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz=
"
-
-SRC_URI =3D "${GNOME_MIRROR}/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f9=
0e010e10bddc5c"
-
-S =3D "${UNPACKDIR}/gtk-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 CVE_PRODUCT =3D "gnome:gtk"
=20
-inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings fe=
atures_check gobject-introspection
+GNOMEBN =3D "gtk"
+
+inherit gettext gnomebase gi-docgen update-alternatives gsettings features=
_check gobject-introspection
=20
 # TBD: nativesdk
 # gobject-introspection.bbclass pins introspection off for nativesk. As lo=
ng as
@@ -85,10 +82,8 @@ LIBV =3D "4.0.0"
=20
 FILES:${PN}:append =3D " \
     ${datadir}/bash-completion \
-    ${datadir}/glib-2.0/schemas/ \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
-    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
     ${libdir}/gtk-4.0/${LIBV}/media \
     ${bindir}/gtk4-update-icon-cache \
     ${bindir}/gtk4-launch \
--=20
2.51.0


