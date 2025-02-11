Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5715C18E7C
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=5tVhSkq9;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc/PTQGjIQvfJieuhDd+F5s2QJm9yG6n9RPsXrxGcDQlJsGG5x2hThtO+QgTN/AaSzqj4zMsUQpOFhnjFMsTNhZBiHXqkyaTJSUuoXtmKt+WbJK2j1pu6PYm4gNNojJYBXRi2YMFiKxXw/Xxvc7wzQyb1rKK8wRO+I2u+ne2b4QjhYHkOHHyJ0AgL/uEi4aEUjRR8xl3VAHoU6ZCk27PsRPLBPQUHJ233b5K/vGgePnwRTAAgLB2Conp5DY8+G0n7FLB1fJJj/R8Yt+mL/cbi4RH3ANkOQWqcp9bV72blWGtKS6wZo1H+0PKcnaIf2RswQC9em+9UHwtBLrgzfEp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq+G3vNdB+Wza8qJUFGEM2uex4rdrWxMr/ueJVWlcV4=;
 b=n3F1W5L+EClL29/ejnAl+Lmzgi+xJ6RSaorpOyILhg/ngDJ9QDXKsOqzkVSALMUcHWiUTocTbMTqw6K4wSHM/9t+ImXAbJcjAMutlSyWW2kgtsZGpfi2l9sc7tST6cy3YhDG+uat5ECdv1jkBbW8RVgIOV6rhVHg/uXhvrVz9YPzkcdkUMrDglJXge53kqmBk615pTCQLWFompRU9lowoi4Rrp1hMMEFoeTUfFAxoJsH5WRC60TwSsMmEEMPRufHQfXVDrBOxZUNepNJoLvaqmnNBLL5zVZPu267y+WmSc0WwOTTVFU+87kn925E7CyIpiTPDpCWqT9qvY5aARm6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq+G3vNdB+Wza8qJUFGEM2uex4rdrWxMr/ueJVWlcV4=;
 b=5tVhSkq9dNoSO+IxOuBQGyrsQKiQVFB4XQDS9xazh4ogWOhArM5pFtIffoQyU9YXRRUvG6bK+vzVc5aaLIZr4ArzY3bjqgli9Ooef5NzYFFiDuE0nufj23/uD/DZiyT8TB/OJGlogj4K8luUQzApoJWI8k+/59CMxySGTN/Cim4Ok6y4UX6ZhpVoSNIMYPD4uO3rxTgtQiLioPH2zcuR82CfcpS05vXkSvO/S/6vbpOKAThcc8a22oBcjgvh8Wjf25aCTzqTeHdvUxP2/fkUx2dtz8XGLjwUD8EHzX5+UfurwyGaeq9K6NT+Hkhbwc+Km2lsbHMSaG6Tad+ug/W+Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:02 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:02 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 20/30] classes: add vendor_npm_build class
Date: Tue, 11 Feb 2025 16:00:24 +0100
Message-ID: <20250211150034.18696-20-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c65865-678c-48b8-43eb-08dd4aace2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N5X4W5W6eIYxEqXtmGRCVWwy1kg4rzYqY5hyxazbiUEIJnvztixnymihnYKD?=
 =?us-ascii?Q?d8aG2SRuKabenWENJF2wzFVcurUUjd7K+izoryFAZjlTwyYwEbfpxatRcmVj?=
 =?us-ascii?Q?IrMkp5Rp158KPeLcBD3JoSGZIzgm/291k3RHQwpWwWgxn/DLwUqqsMx22uAV?=
 =?us-ascii?Q?hVGBs97oVrtr6yiDZZFE16G+idPKZWYKT7AIPTg2t6EcuhaGYrCfLffRqO32?=
 =?us-ascii?Q?2JPHE29ZO33m3AE5VjpmS0IuEZsZDHOeXikOygeHR6eVSBJTjpDQ8yacTF2n?=
 =?us-ascii?Q?37x74/18s1ahgpx+XWYlBZbFxtpFB+Iwg56e5/6+bH+4s9ztv+l2QS7MFrL7?=
 =?us-ascii?Q?j075hSFz80vymjfeNeyEGAXmbpue0HJZRtzi9MIdtQKqaw7ZGCKJgKJB8q3t?=
 =?us-ascii?Q?zDqdK/XYfhLLvwgMcPjFSAU70iZTv0VkpHk2/XMBwCdDqRBs2yxkF9YpD8fF?=
 =?us-ascii?Q?BIEUDiVTlqc7GQevkwgDEeLus35IutxxwSfWtvJTvoCozKqaRNX377Zkpsgx?=
 =?us-ascii?Q?7/FvTnvMVck/RKpvA/P0c8gbYN7tc9HUZMlRnesJiXFDdJkSl7doGx//4RHr?=
 =?us-ascii?Q?lIP9w4CsYUiX0ab0MF5+cV0n9dJ2sQYxhzdFlq1KY2nte6Kt41VxHchGuSR/?=
 =?us-ascii?Q?25nmNkv7VM04SulDPsy8cxghFnekCucvSE2nWgC/sQYUkVWvmQLAaOTVXbrA?=
 =?us-ascii?Q?2X1FRAcgJVTStM1xNDXvF6YkTH3DNRcVFZWk3rigCghNDJRfeYDzhNdlWyY/?=
 =?us-ascii?Q?ND3YcnrWQs1yPP8T3+okx9x/yL/QilVOXYBMzssqvnCQNJ+RPKe8ZsFVf3XZ?=
 =?us-ascii?Q?ngv5RVA+zVsnBh3w30XQD/V2J6VRZvlDSnJaeEfBq7jSs6CD4aF6DNGOCOWp?=
 =?us-ascii?Q?QDKlTLNRAh2PxrCUVufbjjt7vsetUg6kNHtt7nfH4LgaDAgRqiPpPXLuu2M0?=
 =?us-ascii?Q?cTzg7RAnNsluHMeI8lHuxaUmuslywrZ63nrzQCn0sxGYWgY2n7dg1CxVOI8V?=
 =?us-ascii?Q?/L97ZQkFzZCTRQ1dYnXPZmhjUR3XhYTq4ee6STIFG9p+Yma1e2Gx63aYldrv?=
 =?us-ascii?Q?9/2C37YbicQ6mZIFDs4ske9JQkPSJhxGIpbePrXYEnWthKzgOxT3ppkooL4s?=
 =?us-ascii?Q?whcjf6EmD6P73GJfleg3Z2OdbV+N5PP77ewqcxbpcC36dhwVv+xg9YsaiP5Y?=
 =?us-ascii?Q?oDKJtkfjjW7R9ApasoKNDUWYkTFG7HoIf0Kkkhq6HxfuqoDpybc9z1IBFfi9?=
 =?us-ascii?Q?hvx14wWco0k0wiBfX1zUbIfPKz6j7t91hohZv2css7BoTzApcaHS06x2wQ6t?=
 =?us-ascii?Q?nN4DmaUnWMHQZuNX7VSmuzaVoy7J2Vt3ztFXm91xBVCfmIoR9mOYOCb90sb4?=
 =?us-ascii?Q?febZyvpKsAcglpIN4KsgwxT1PKzn0yOOZIyhf7qcUmq3DAtQsk2p7iRS1qiz?=
 =?us-ascii?Q?FEgpVQO/UqIuRIfg7oCANsDmgEJgMzsg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LU4pwLYngocTTQ42+8cbTzcy7a1Z8fcBpRZVkDzHGfriWmg89UxWQ5LRPUHy?=
 =?us-ascii?Q?jyLqnhNzC9D6Lyxj4PLxaHTl+3AISsoT7HWrI2g06LL0MJnFJG6eJH+DvD8h?=
 =?us-ascii?Q?sDMQUpj7KHuOLcZJeYs7dqMPoPPgrmh1Jzg5n+HWBfGZVgKLdovkbONvgmZv?=
 =?us-ascii?Q?zFXiRxYoZMoDHqOuSLcDRr5z+C4l7bNi1P+t+WLqYHuyL2IGU1+avAJX9tKU?=
 =?us-ascii?Q?/DV28svUSG/KLImXeiX1SeigcWpP3EBrmBHiydChr7wtFJLJE4Ch6byIB7im?=
 =?us-ascii?Q?jTIcsDB6JPWQCwBxNFA/ovvTGPZS/mcfAjBpwEmtIGMiO2kwObHOmAsw+ybx?=
 =?us-ascii?Q?qde/pzZjxTtOJ5i+xQs7Gqv8UQg18Rhe+SC0orfhXBt9r8NmwwpFhzmORpmz?=
 =?us-ascii?Q?QaWKFH0mEeD13e4dwtCmHxFieiu5eGefU0e3Fec5CBV1hENpP1HzAgHq2+UN?=
 =?us-ascii?Q?nWY9gKxmzzkPwWI7qml/E/nkDw4dm9ZmTiovqc6bWMufqbz8J4LBFknhGy4M?=
 =?us-ascii?Q?QvN33G6OIe2Exl2fbHlhgwXTut1GnhjnjlDu2PhisI9UelLP69kocVRHFeml?=
 =?us-ascii?Q?Ai5Ct9t4aMv9Nbg69UWOepj+4YiHCWjqQ053tpxNKAAdKulUwqq4NCL9cslv?=
 =?us-ascii?Q?BM+uz1ssKUTqe4ZyGubovCVPF1rUaxyKg/RWbpm9jfvGWgDibu5Zwe059CwJ?=
 =?us-ascii?Q?0ja8YnHsYoe3MDWcAaSQ8fH79Hb+6HnaJ6M8YrSjRK/Lo9kxh7JtoH53axZu?=
 =?us-ascii?Q?ButeA7ICJeQQ/c+3iYq/VOrNJJZpZu5iwgYO5A4Mo96MTgGxDcdCisL92pV6?=
 =?us-ascii?Q?KoaA1sOjiGxtkaIgJ9JSAc6M9W5rDzNsy2CJA1i41yVYIKR0OZvJAoX1vx2e?=
 =?us-ascii?Q?U3wxPLiteep+YU4T1+ZfROWh1eXj+q5xeDlgjRzHOWKknGSOYrAuF/BKLPJt?=
 =?us-ascii?Q?8ieBuywnog8+M5n4dogCqWexkpxLhlLi8ox00bSHQGDXewLVFYEF4Sc83Wpz?=
 =?us-ascii?Q?vp9NEyelfdBxIYsfJ4A8aYn5nInb1lIv/SqZA7C4oRfaNlABN5zjnzZ4JBEU?=
 =?us-ascii?Q?3kF+nrIhUar9K4BvDNTx/OvEfVmZeL5Qcnw+RzK4gM/yBe0vD76DYHm/Vi3/?=
 =?us-ascii?Q?yyD4t8T+H+YlZvl6MUrmPByphi+FXsX/ddvPYFwLK6JkhfgJNFYxPHA8Vpjk?=
 =?us-ascii?Q?KgSqOjpyEyZ5stFzjHLItS0P7671L4eV9oVLy7JvLTfXrmsk5sU4EKscGFW+?=
 =?us-ascii?Q?96gdK8tB1zVU4VE7abLvQ9K4EdDZzrxgTtPdbb9zrxBNP5lQ7jQxqaFXkPEs?=
 =?us-ascii?Q?z1aDQtd/6rcLLFfgrebChl9XdSBUiLH0g6kLO7ot7G6UDotekCnW6MfqIhX6?=
 =?us-ascii?Q?bgwVW0OqMEg6EcTwIhEFb7AQkfrKR4EO7jvNx3caa4Kv5QxzWhRzdvwlepfA?=
 =?us-ascii?Q?PC2HC5d/wph2NVDEFpC839vag/ONIOgOgdEr8x2SNKsLxTxztgIV12Fk+ISC?=
 =?us-ascii?Q?6pT1/KKJUAful8KQEMwSMpxkzRZKtkyIQj5v4q+K0tEVdDt81AcSKCYX9qkh?=
 =?us-ascii?Q?2kd2GS7vewASFcs789ZdB1FXWCDkr7VkQuLLlKOYDVMC2mWR6nDBssyS0pXa?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c65865-678c-48b8-43eb-08dd4aace2b8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:55.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdNI0kxvVHaEC2os/0Vhb2hgip13uej3CN/y8DDhfPdniR++JJqUNBwY5cQ6mxLnSt6d3Ql8iaBgb4isxWM5lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211145

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor class for npm to build a npm package from source.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/vendor_npm_build.bbclass | 50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/classes-recipe/vendor_npm_build.bbclass

diff --git a/meta/classes-recipe/vendor_npm_build.bbclass b/meta/classes-re=
cipe/vendor_npm_build.bbclass
new file mode 100644
index 0000000000..1cef316e01
--- /dev/null
+++ b/meta/classes-recipe/vendor_npm_build.bbclass
@@ -0,0 +1,50 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+NPM_BUILD_TARGET ?=3D "build"
+EXTRA_OENPM_BUILD ?=3D ""
+NPM_REBUILD ?=3D "1"
+
+inherit vendor_npm
+
+NPM_INSTALL_DEV =3D "1"
+NPM_PRUNE_DEV =3D "1"
+
+NPM_NATIVE_ARCH ?=3D "${@map_nodejs_arch(d.getVar("BUILD_ARCH"), d)}"
+
+NPM_BUILD_NATIVE_FLAGS =3D "\
+    ${NPM_COMMON_FLAGS} \
+    --arch=3D${NPM_NATIVE_ARCH} \
+    --target_arch=3D${NPM_NATIVE_ARCH} \
+"
+
+NPM_BUILD_NATIVE_ENVS =3D "\
+    CC=3D"${BUILD_CC}" \
+    CXX=3D"${BUILD_CXX}" \
+    LINK=3D"${BUILD_CC}" \
+    AR=3D"${BUILD_AR}" \
+    CPPFLAGS=3D"${BUILD_CPPFLAGS}" \
+    CFLAGS=3D"${BUILD_CFLAGS}" \
+    CXXFLAGS=3D"${BUILD_CXXFLAGS}" \
+    LDFLAGS=3D"${BUILD_LDFLAGS}" \
+"
+
+oe_run_npm_native() {
+    bbnote "${NPM_BUILD_NATIVE_ENVS} ${NPM} $@"
+    ${NPM_BUILD_NATIVE_ENVS} ${NPM} "$@"
+}
+
+vendor_npm_build_do_compile() {
+    oe_run_npm_native rebuild ${NPM_BUILD_NATIVE_FLAGS}
+
+    oe_run_npm_native run ${NPM_BUILD_TARGET} ${NPM_BUILD_NATIVE_FLAGS} ${=
EXTRA_OENPM_BUILD}
+
+    if "${@['false', 'true'][oe.types.boolean(d.getVar('NPM_REBUILD'))]}";=
 then
+        vendor_npm_do_compile
+    fi
+}
+
+EXPORT_FUNCTIONS do_compile
--=20
2.39.5


