Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFB3C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:20:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.51])
 by mx.groups.io with SMTP id smtpd.web10.36684.1721046020053599184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=de4OiTmv;
 spf=pass (domain: outlook.com, ip: 40.92.90.51, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8xNsLMD2cUoqoyahPMNgf1XLSb0HL/IQMvhBacIY1jWUD3hRXPLpSoFEq1T4jBon3pleBdjCLr6nKItB2jwoUoMYKwmhGKiBHKTRVBgKBXP6zaxeHjUQpDH7xYvWZo0/6xor+siZzwhedw9RrptQA6/W3qno8t1VVv+sZG0aSiy+AARUDcOSmAWYkZosWp7QycmGRbWtqu4FQLU9SaaoI6N7Zf4T0XNKk1loohhPFnC4HuiYG6FtVpE4UTtswCj71p2TYEEAP1ydyZoZbCuUfBZBAlH/PXCrvCitG7Ma+XAfTj5qUrepzZGuPMyRUQ68gPZaQhYc2X1mdijkP8hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PibRlqvs0HxQwpsdUStrbElKtwikNyEmL2GqgtAoqSk=;
 b=G/Ob+fUsdXTFI7sQaXjUTTMhKXqeT5zTdcNlBsHlPwXSi2Jk7a4zZuCrIX1xrBxdZ753ZG6y035yyIkDSZPC8lFJHFHQJVbUbj5gU4HjA+ZrWIbdu34IpHn5xFkwCSazJ80ceVJ5wi22TnRzdrE/CtpWwwJs5lyFK+LvdO00pnda8jZVP7/FpXmK7RZEoShlu1sHYNaqgb+SuwOf4smZdac7rpIgWT1v57DpfG1Sw3pmOIaOCcRc/qREoTXkDHkT/6mx3UNXK51WAvfc9ui2qBW0tUJR/P/0/Wtl6FIRCG/r4qfX+ywnKEuwsBepyPKcH04sFdKUdJ5KwVoAfD4DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PibRlqvs0HxQwpsdUStrbElKtwikNyEmL2GqgtAoqSk=;
 b=de4OiTmv4hgIRC/TV61uqHjwniQNEl4IilTixFZlhefuk9LtTLoCuVntfDOk2FXTxH7PEpxG/8cKO2GD+TKJrGpL92aabWwGy97ZmO2vORgscgttJMhRDpUKx6zYieuDqi0QuirNmset2xWkBHgRrHQL3OBlnkvoaqqs7N9DHmbPJJHMJuPXMuo7ykEIrzhvK9Cr9JFmjQ/DI+98WV8kIglEPtt+SjsgrEfpj1BHMt9RLALmeDbIOcHsdroQ32eHrduAUgDVJE5fhtYMD3CvDSVbExCRI6JQwEv+uXft3XrrsFnC6wiPayX1VKUd/Er5lKWSrEfb06dsBZJHUeSbtQ==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI2PR07MB10228.eurprd07.prod.outlook.com (2603:10a6:800:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13; Mon, 15 Jul
 2024 12:20:09 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7784.013; Mon, 15 Jul 2024
 12:20:09 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] classes/flit-core: fix dependency loop
Date: Mon, 15 Jul 2024 12:18:58 +0000
Message-ID: <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [JcbEVCZYLAmtSJoyFT7rqiAcB0ggv/FjJNgQbRf3QUTdku6bE0TaiJvj+PaRj8/v]
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240715121858.195348-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI2PR07MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: bd38a748-51f3-483d-a180-08dca4c8781e
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	e6uTZXbJPUt6tcrBKlTilyppwvD/lPPzH7YAZ2WphUIYCcrHy5fxO1WMuuYAgFuRsA63bG83IE0cdcwSeoef755M3BQRItgDff/eS9TIXl6gfhxNdjZMoqPaQtMySCsWDqqWPpoyEyifPLV3djbKeA80o4+wWiI2RZAZhK7fsDYt64yn/mTtx4zDnOCLWzKSz4jn/cJ0hIHEg/Y5xaeRQluZCi7meKnMfuxwrlIKretKrVvWnXTPu3NLclmfRF7doXdRnCu7YyH1aWQhbotkNE3hCxfDGkuN0MTeCNX7mbMLFkIHOZY640rCs4bSMlamvYUd0l8aiA9TDz8vwwgeVkXNSV/z6c0WnFCsk85AGSWahDanw4O1Ju8jaIdB+mGFpkBVklPPw2jrHb+InH3d9CDzg/mB6J8ulrA5itGdh/SoByLcsx0ODJMHO7yVvczlIKglZLRBgwKd5zAqPz+bJGWDwpx+FhBrP7oguz6xz+/1gP8Xgt9YdDl4UgxV39uMUfbHPCu0dDE0R4+J6q/jG9DQdEgXbphQArf7M6dOMn08bg6d4PFzD9Mad3tDOjY24v7VTUtn7pUa4fFidQgNmsZIcw4oR5y/aOmRrGUj9UlZKUNqCys4E+N+NW+zpBFwPitfxJo85qbWbjEJZErFKZ/gdTUrZt5qObnf05+LKtdTgDfA92Cr7fOEHgE96hBc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F+ybe9c3GM9KBR1ZYMAjSOWH0fzmb0V2cH35CZCKj4HOpHwlc5mN5wH4p/RQ?=
 =?us-ascii?Q?jHFwtpaW97Qd2QruQT3Kr2Puk2gN2VfUiADH8BIuJnN62AHWss92mWjhc2wl?=
 =?us-ascii?Q?aa183x3YRKYKEFDIMsPjGkpEic8hk8RWGUjT9UCZgpuLIbxhjMv+a0+yEENo?=
 =?us-ascii?Q?3nzULsnbVnex5Mn2Js5PazPh5LU7+tFjFC3Zw8dth9KyDOj5UjRWF/YiAgnI?=
 =?us-ascii?Q?W2r77+b0ovZbcHrvf/0iSbLGjAOZshb0p4PpXBrCdSAqwGDBvFpIp9rZVe6Y?=
 =?us-ascii?Q?rgZ4c3pHhpyxly946EBc1XrzFLS6SSlmCaokHaYN8sGULv25ZyaFye+F2Bsq?=
 =?us-ascii?Q?yeL/0ZuFaPsafY8NPPaJbYAkq6Q48W9NfL/g+K8Yo40y3EsjiUIUJFqHKwa7?=
 =?us-ascii?Q?hZT+5ZVtD6IfnzvdQX+aw3G0JGq5Q1SzqVQaJrPcCTm2A3AlIUxb3cEl7ySC?=
 =?us-ascii?Q?GVqzCvQ5tQmUVlfOeHHBnFRhtkQtyFUaG299vFqsCSu7FqZRZnKZ1GdT8cv8?=
 =?us-ascii?Q?b7jVV3Lydl3bGXkNVbneTrsWkP7jZH8XmqVwRp69Ty0oBpiqwZy47WtIA7QT?=
 =?us-ascii?Q?/6ypbzoEUjHTCdkKcG0tmkx0fZpALS0IV7PcbS/j4NjIiOx9LRFyuG/wL++J?=
 =?us-ascii?Q?M0N5nljj/vChQ6AAZ4AYo5Ku1APIDFhRbvibv1xKCs5WYmqZoXptsJiSZ2eV?=
 =?us-ascii?Q?M3/3fDU9RDkzt7K26WjywEHllKR3cpafY9Nvw7NebKMUsj0/3GIHNY0OO+uq?=
 =?us-ascii?Q?6sqgd43DRxlTs+iogzf5BsRwQY2vS05b+6dPN5Qi2xGI8wuH5kLm20eXRe0h?=
 =?us-ascii?Q?6mELGkFSDOtroLQtX3/Vynh1mWkb16EOMDhQ1PTnRk9Yv8PZ/lVJV+79dqqM?=
 =?us-ascii?Q?dFGzoQs9395ll1rSTxGaF9tKxb5TuV87nlH9al0VaMmD1PmI1mfHiF6sWJB6?=
 =?us-ascii?Q?rs6AlPg/RXAD2hAZ/ZS5XnUYst5ITf26qAYp5XkrIxOT1tenVT0BgziK6b5v?=
 =?us-ascii?Q?7hU685OyDjy7h/Ctz1n8Y5GlaHwdQPPX/ELuhydkRrFGBNOhMgPd9pHPHTHN?=
 =?us-ascii?Q?/LlUyDoxpkF6lx7omKfjHUBvIEsclVk5m1sO1W7IRfSf7KxzAHxl0CTe8rrB?=
 =?us-ascii?Q?1PIGK0vi66zRmxrO4gLgN65EiiklxHtCc0gYq8HLWi+a10ZAZH+/WeQDQMUR?=
 =?us-ascii?Q?qJJb99/SZImlzEK+yOQC1urd/QRrJBNnlLHz06tveTi37To0dCEdCCvj6v40?=
 =?us-ascii?Q?hq/wGpKZH0VAJsfICNN17nS88+8gGHhVQCPz9sghNdLBtRpO98Pc4qFA001L?=
 =?us-ascii?Q?IPM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd38a748-51f3-483d-a180-08dca4c8781e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 12:20:09.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR07MB10228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201919

when using python_flit_core on a native recipe
it was creating a dependency loop, as tasks for
python3 requires tasks for python3-native,
which is essential for building any native python recipes.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-recipe/python_flit_core.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_flit_core.bbclass b/meta/classes-re=
cipe/python_flit_core.bbclass
index a0b1feb70a..3da9da3e6f 100644
--- a/meta/classes-recipe/python_flit_core.bbclass
+++ b/meta/classes-recipe/python_flit_core.bbclass
@@ -6,7 +6,10 @@
=20
 inherit python_pep517 python3native python3-dir setuptools3-base
=20
-DEPENDS +=3D "python3 python3-flit-core-native"
+DEPENDS +=3D "python3-flit-core-native"
+DEPENDS:append:class-native =3D " python3-native"
+DEPENDS:append:class-nativesdk =3D " nativesdk-python3"
+DEPENDS:append:class-target =3D " python3"
=20
 python_flit_core_do_manual_build () {
     cd ${PEP517_SOURCE_PATH}
--=20
2.34.1


