Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2358EFCD0D2
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:21:38 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9144.1773822087068771810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Kd+C3uTK;
 spf=pass (domain: navimatix.de, ip: 40.107.159.78, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBtcR6Q/AIRWKtj/AUrhhTQZWNb2YFmR/MYJ5PKFGvq1uevkwCCIlTsXqex7VVuS9p8xRPIvVRS/m3KgTDU7ZxIVpfN5atE1iMKXyJAblvR01nlU/8YTQbCICmq55e1K+hMuFKW28k3pxm905kGDlR8QvsHsNw534AcD9xkraNpxWPooeLGC52nvJ0dBbl1YBQuni+KJOA92g27119NIkvOpTb+dksOwRdBsQrJRZRxnszrPUmPmD+vfHHwBA5SMxfPFO4iULB6lEACLMOCEZqBAk3SP1lH0VAtQXj8x4zNb58CmKnXFaoIcMhyLMw3Vdx+sdaML+D3AGbtk6BD5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhm2MsRVKh+eMUU73ehsiPwVMBxtOUB7u1pE4pw52W8=;
 b=s4/MdCO8ONaHsOw0prWFS6H+H8Z+nwJl4eeKU5xepRSYezhODNEFDL8oXCYPndZbnxiNxw/BcM+ZShwQRn+dFmZ+kxvKBneuc8QuuX9gtbIv2CdOHi7+tNZuIzVwhhlkUZu5Kdm74zrFUkl6yPVkQGG5Un18dbrXdeetFH2RFHTkL7tUaLg7jyki0ZOTUcpjr2mIlSmQaG+iswa8JHTv8LJJAApYIAZ4ACiTbhAF9K8dhM231+EOQKmhSzkwPWFUL4T91qbh5TJJMSH5q6OBCGxYvWpXk3E62W2TEFyPpflSFQUZfqv10AJ+oOJCyIDunfjd4kb4QXsemgEDNqwaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhm2MsRVKh+eMUU73ehsiPwVMBxtOUB7u1pE4pw52W8=;
 b=Kd+C3uTKSosX9C8nknx/FXhoTN0XEt45262Y12frhJexZOTEvy2l7S9nAbHOLHUWBoEwYoSbjeXHR/fQBxJ4VwoW7cTirHm2UiI5h2RTcy9i7/VOp+5CipnhkhR5a4/NW6kCFMx2w7PdXF9D2lrPrhmR9DuoGh/kLGNfkV5Pvkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA1PR01MB11346.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:489::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 08:21:22 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Wed, 18 Mar 2026 08:21:21 +0000
Date: Wed, 18 Mar 2026 09:21:20 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] icu: Skip buildpaths QA check, if TMPDIR is /build/tmp
Message-ID: <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA1PR01MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b83f04c-ec91-4fb5-fff4-08de84c7567a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Q2aMVziJYZ+HEaNexriTJCW343XaiTSgChSEO4OTOgqCy45qHF49C3laL31dtq3y7xGO+BM1PqOvjDPqyBmFAzay1Ir+a33Lw4LbO05eBr3jEI9DpYgLvWXzkwQgB7z7V3slJF0STH4noxXNBkdhPXwCYgoTUMes+C8cmpSEwAJyVhhbRg0jegktxqzyK20BAM7nM58neKfB+PSslYF93U2RO7vdaYP5YYPD/M/qzIloNjOnRNjIkmH7arF6UBGYQydGIhKVH3NhqX4+Bxj48ihAiBa8pfJZzLtAu19Ul6lyOFHDPSoNYDR0G2aRK6Bwnl1uIOXLnrALudrHb8J5fhzzYX1QDxV0ZU5YsPMHe5rVB2DBD7MCQs6rPHdHvwxttzvoRapE7s9CgICOXRpLUCdlGQQVhDQmpsKNyJfscORJjbA5jvOAVxMkq82wb/j7QDQW3bHCFcDuWTrUzLFFCiuUpCN2x4X1brJwQSiXuaiURs0upLbwbXzx6r5Z5Z96fZQIePTYXyeuJuoGNHaBvhBJSCSoOOt7eT9+JaiK5zPzK5ezv4G3NSiTMyJiK4ET4M3iA2y008fLZkLdmvylkIMLichLv1nN8yOuMikJRxBE7PGkntlg9hDcREMNRlRJqCYEhjw/65Tj1yzL85b+dkAyOHGYpMCYgCRDb8/AiHaEOGE3F1eHStzSvbHZQKU5vCo+fMl5n19ZnNGdKqkhOhijmhCwutdGDndtEezjvKk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I3Lh3RjUYU52h/szxUH907FtlsfUbIU3c7Y7xeVF2v02im6TcPTmVncY+JLX?=
 =?us-ascii?Q?LsytvsbrqZiztUPDWiztsSdLqNseVOh/+49Kzie3KAU75hnh19etD+XH10fx?=
 =?us-ascii?Q?twel7YSvkxrq7nQVhPVedTDtF51bv/Zamr/6hZ5FwRfiN8sbKcdohbwxD8FS?=
 =?us-ascii?Q?Ml5KKT8kzgbn/eAXp2bcTBdF0LWSF2IjZGdswluzXU3cYyn6OpaqMvpxUD6n?=
 =?us-ascii?Q?fJgIngmvn05wL/xivrqWsPzolAEVANQ/bGjxrYOeo9eSHh3mRR+dXYc/9QgD?=
 =?us-ascii?Q?EKFGJFV2igQXIc1WRLfRPdtpA7Gkuf0Uk/irYXOU8oXqJ8GiIrbH+i8TbGOX?=
 =?us-ascii?Q?odMeKM/G6pwZ2n4dcIOcFLxy8o6xixfosvhlHXY2cABjiFCe5hXT3xrXv6li?=
 =?us-ascii?Q?TQj5ZDwUV9dCDt4ssN6tYaeKUxSmcCc3epyhr+9lEvBhct6O/NIqn15SzXvg?=
 =?us-ascii?Q?Fqb9b6BwY5JtG174wNdA5ACm/6rSjC6fXM4XcGO8b5EmIDU4HzfY/xa0D5tg?=
 =?us-ascii?Q?u6emrhQHVEmrho/QbppAx6oDK1D/JGISSzSspbPQDReFUl3ChLyfsyEHJZ+N?=
 =?us-ascii?Q?HjDSEMDoTb/cSxwkhUYQk/H6DMYaFsMJ29MNgpgtqp6cpc48FwCc9ClXuxMh?=
 =?us-ascii?Q?YLSvtG6T8dWAUqKiOAmDrUmaBwgqCtpVJhEwaEKhuHRu8e/SaF7LdUV7qjPc?=
 =?us-ascii?Q?GHlMqRaOGZ4vY1zqHFZhUq95kI8/9fo1MFvZwv7uHKyJiIWJA3bZnT9bzijy?=
 =?us-ascii?Q?5ychpdmvtsvTtEprnp1QWIsXU102kTi8+Ds2OnT5FeJwxFCHKbsS48Yv1hn2?=
 =?us-ascii?Q?Q26vOYj3QbfAUck23yX7hN7nCRUOPbZriZyWK/KxXm+rLS1CF0FKDYNQdmkY?=
 =?us-ascii?Q?n+0BS5dYA8cKRH7JZLOVeEnCXeYMpNR4zVRAYew0+RLlLiWzLZNxQU/rC7SM?=
 =?us-ascii?Q?+0vFGiJpQ46CTrMspZWdOBhGGr1LmB0wmmhXoRJDMO/VEJsmcKh0k92NCya4?=
 =?us-ascii?Q?n1WJzOtB9B4bKqZmPT720V6mINyhZFlye9Edq0EroCWN9Fq4lwDvjTunJY5l?=
 =?us-ascii?Q?zBlFjs9gbAMk3XRaclCshXG+IGC5/Y1zW21IPhXMizOs73RtMt6RrIr8EDIu?=
 =?us-ascii?Q?p86a70LqaoiSqtzd78jgGwbWN9G8bwt+unCy1C64WaKL+/gruYPAS+qAygjC?=
 =?us-ascii?Q?flASRV/6UIrF4p4sT32r5iOVHlfz1I9g53L1GZHQXbidw5A9z539WT9D6SCj?=
 =?us-ascii?Q?Jt37nuYu5alVMoNUosu1AVblJ+6rl9BuFnvshqDyJirrb3aJnB/Y9EoCkleC?=
 =?us-ascii?Q?MM0Vg5PTq2gTOeTgU5sHEePp+mcqQerlyC5S2ROxxTaHuToKfaKhKRn3GSgi?=
 =?us-ascii?Q?9jjJP+ZHLNUZqb9WoG3dx31AiLWmxr4cqiyDn9awGI7PvAJeXAf0M5+NR/nc?=
 =?us-ascii?Q?UEi3hSUb9s1oUXj+YzxygQ9xqkqCoSLE8R11lUW/unnz5MPsFmhVp/iH/zld?=
 =?us-ascii?Q?Xd1IH4WIGw8AuvVLbw9dK+TcvenFc7geQ1keMoMkyQxauYt6Z2SaZ0kzkFnM?=
 =?us-ascii?Q?Rvt1vOWr+wxfFlV7xccJtfse5AMl1Xy5eFM4javC4IEXh0gziC3LgSQaDxOu?=
 =?us-ascii?Q?MHJD5NJUCH77oQkTfSDdsI/t0CDQquS4P3ogj47TSdsAXBmqbvpUHfOJ9GAp?=
 =?us-ascii?Q?DxLlC8PPWRDOWJzZSvnHvJ41FuPzk9iyXqfj5DYCCB9f7hQSIWW+4aOmh1+0?=
 =?us-ascii?Q?WDbfm9YiMTqoj2oxHuC5y0wR2SoTW80=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b83f04c-ec91-4fb5-fff4-08de84c7567a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:21:21.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJv6D+TXzR8qG2ZMfjJOYYy7/10tUQHmymo8UuHCVUSd3g+R417h9x8VSxeAMiUelIliKnnZCuLJfe43LXxLsrNUfVAHeXEBPLxGlL3ED9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR01MB11346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233370

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The file udatatst.c really contains the string /build/tmp. When building
with kas-container the build directory is /build and hence the TMPDIR
becomes /build/tmp.

% grep -n -C2 /build/tmp source/test/cintltst/udatatst.c
136-    char* path=3D(char*)malloc(sizeof(char) * (strlen(ctest_dataOutDir(=
))
137-                                           + strlen(U_ICUDATA_NAME)
138:                                           + strlen("/build/tmp/..")+1 =
) );
139-
140-    char        *icuDataFilePath =3D 0;

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-support/icu/icu_78.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/icu/icu_78.2.bb b/meta/recipes-support/ic=
u/icu_78.2.bb
index 1e99803105..b2e3e1a588 100644
--- a/meta/recipes-support/icu/icu_78.2.bb
+++ b/meta/recipes-support/icu/icu_78.2.bb
@@ -122,6 +122,9 @@ SRC_URI[data.sha256sum] =3D "582968cf174c9498b2046b4f4e=
7f786def5f18222bd8d98432d7a
 UPSTREAM_CHECK_REGEX =3D "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI =3D "https://github.com/unicode-org/icu/releases"
=20
+# The file source/test/cintltst/udatatst.c contains the string "/build/tmp=
/.."
+INSANE_SKIP:${PN}-src +=3D "${@'buildpaths' if d.getVar('TMPDIR') =3D=3D '=
/build/tmp' else ''}"
+
 EXTRA_OECONF:append:libc-musl =3D " ac_cv_func_strtod_l=3Dno"
=20
 PACKAGECONFIG ?=3D ""
--=20
2.53.0


