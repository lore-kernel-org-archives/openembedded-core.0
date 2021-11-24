Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02250C4321E
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:16 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.43])
 by mx.groups.io with SMTP id smtpd.web11.7026.1637765293947463928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=twqqeipB;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nurEHvSDxQi/Vy9RkkHVn5eciJjs38k9Hyat2S8lNxj1p/kPiaMSem1TEYKK1fKVxhL6VefFyxDd37zN6mmL8regAa7FvxiAiSoVXGeW6sQQeHCqJck5t7VLi7bPCph06Oj16ZOXJYEV3oY65ONwWbbzro76AJl45W1IyH/eHvmEL3M2YCvJXX4dYPjIFM1l2OGcuFim04EmRCg+rNnw4dEoymf5hsTPzYv+jMSGvuM0AhpEA2fwtmTq7/EQtHVCe7VGQOidg0ThJ3K1MNeMACRfXtWo23vLUVgdiSjUbvTww7vz9xrKjO3c3KCOhJaJ9GcUFmkUtjqHuDMHBn7L+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gndTorw013AVfs+YgecsR3KrFCCDSHL1l56o6BHvBSU=;
 b=IYvo92hyM5vDhtG/tWvWXGYQkuI5tEviujWGH3A4xemMD7aFOOkl30iINqBBjQ5vFF0443xd8LnqQGZA2a3c3Hy/3YDNtlQl30HVsiofyGQ1bGJJUIrQ2rSqHhZAcWVtuqmMrBe+wo/NeQUVLHK1avcgjnzKx+aJk2DrjOAIASAo0pzsiWByudJrn4msMpWWW20qUTLnjF/t7Q7IeSqojSis9qNX7KbhbKq1Qczhvu4zgDHUB/YQxqoMo9O2npIjDXvQS/+isLHRGDVptBIt3QtjcMVX9drI9IAFoH9v/tkDezKOnJGTkm90JWeQJy4GHAUx/UvIqEQtfcnrLPyfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gndTorw013AVfs+YgecsR3KrFCCDSHL1l56o6BHvBSU=;
 b=twqqeipB8zg9BfsrwQIoAByvd+TZ5rkcZFe2pEZZFLa15NXEFvZD/E//FE1Sc+k2NMphKLMwqhN3fBtwUWJIoGoRxyeRTx26NVgF4g4gSV4UvtdJAlLmG+Gl8NWw3w6hlPxOYLmctv06/yrWorWoOiGlTJxG7N9Om7R3vrMwNeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:08 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:08 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 08/15] npm_build_dist: add class to build npm package and
 install its dist folder
Date: Wed, 24 Nov 2021 15:47:32 +0100
Message-ID: <20211124144739.2250-9-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd7f14c-9d0a-4a7a-27c8-08d9af596de4
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801C8D358F789A3210945A9D7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dVTsWrqMg5wPHr1CD0TDV40h4QY1Qmwk38xGWWQy9ibfLjgArUhmtIpMuA2lk3wn3c9Ethwl+bsvybL0d3oQTVJfIJgF968djhgxP5IlU2IckbK2YuCu+UJo+poFFvnNWUHcqLbQX9fNRZBlWDxQSSnRIgQog4RX1oP9sq0OwmQu9tWSlpGkg2n65gA5sOVw9bCvQDvzCodTdiAA5x3Hkg3EgB1Of9UpUaWt8Gjb38eL3WZGYN7jt0Ol0tAJ4ZkM5MTNR9qg383pjRQiy6Q6LI+kVGtP9axINyrSTLFp/ahwvCAynGU1O+LYN3bqOa2ZgH3mkpq8UY5Chjgewp9GN+7MFpxyaas4zYliKNTB5vnzcbNIzc6qByoKoNRoNjxSw7Ry4QM8PS/+sLWmjOhvRlTnoJy6JVTv70tBtbMxbFFEfNERhFgDxo/yLeqQk0iW4jr6iFW6Dykl616d9oNn5WI1O283RTtz5AXh5DdXPwM4awj74imQCEcyNZ8ioE8ZUksb2WGKnjXw+wdNvRJ8FZJjK7T00t5K+SrBMLqb6tpRBkAhCf382b5aZZhKcoRhD1ZwAkX1HLqOBompMq6mk4F0ANrypSdcvOfgNgHtU89IbBbTyBu90+gVFyhHEZs48A/q7hFmnUxeo+K0UQjZpjoDldnzP2LzOeN7WksRczwwR/33TTIM54bae0R6/nUfALigOXT3yYI/Ueiejx8Gwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dP8Cq22NJH6Em4+HEAzv4ifT1L15GP9hdhkjj5RV7gv9q4L6zrS4ZqPE2l+Y?=
 =?us-ascii?Q?GB9F0oA1S5o357lCt5q5SMSDkjViOKnC9Tcua2VdBgJOAaproTUXcDnMMSex?=
 =?us-ascii?Q?aCSA0pJqwpVzP4xHfRxIsVfYoCtj+Zwktd/5soirsJ+t78QFEU7D7Nb8PMhz?=
 =?us-ascii?Q?rSfwfSLIyap9A5ARsm9oRRGfXUIftqIfCKNKrOwZPpTrFkPn3P0N+xO2+dxk?=
 =?us-ascii?Q?RStieT6L16CEXnFetyivi1wWsop1VUG5LsKWh/0wl/tVx7mk/XEqBF5r+HEZ?=
 =?us-ascii?Q?jcssaxa5GL+xmDFK/Fjmizb2XzOz5cYUiAV1fvbNOsLq04CnKZk6iO7R14ua?=
 =?us-ascii?Q?d3y/56tsxGJVtGjsfiwduG+B3ulx3K93984ovr5GA3zrUhpT8bLOs+AgyDzt?=
 =?us-ascii?Q?DVkYDLJGowkl19tu6xfSRdOx/CiDnmytu4Oc/UabKUcIGgMftysxcX1eTUmY?=
 =?us-ascii?Q?hLExgLvqiCgkeh8dZijoAzoxaM1SQePsgrYVvsrLDI2XvFOGXxYLuUW0btKE?=
 =?us-ascii?Q?bsHry1DzKsP7g190YvnkrDECpPQfPQFcHLnzWKILhOJZ0sVYKjGdJzPd7nuR?=
 =?us-ascii?Q?HQgf//crFFB9k07d0FnJheODc6FAm0eRPrugUI8NZjI4vyRS/78JIWH1KT3I?=
 =?us-ascii?Q?23C7PwQOQXURfaiVpBFURkDKX6GPm8x1FUftBOzpDnffhMq/0YaYW72JSZ7O?=
 =?us-ascii?Q?Qom+ufi22y9lyOnP4pAxC34lhGk3YJVV7hshepzRRLbvd6UzCs1AwtE1FOHI?=
 =?us-ascii?Q?tIyMo/xcWfNVXfMbjK+gXqptpP8AaZXyzhf2JqmSLAW++2DgVZWK+ndZ6Htp?=
 =?us-ascii?Q?PHwY3KV5yeyKuVD9zDiGLTQUPVcfA2a5LCpxLF6An9TSInpULsc7TbhH47La?=
 =?us-ascii?Q?8Xnn+3nTDEv0WL5Iol0UgXv6CcaNG0QDEXRdhbWLk9SIoWYaLAiBHBG/tUsR?=
 =?us-ascii?Q?8SpYbQfg/NdZQnzzTNttsvC6ZOBSmmAUWfqh9c6pCKIOQEaO5tWa/6Mo7WTq?=
 =?us-ascii?Q?h9IK5Bv8WRq+7fZmV1tmh+VUyYKxKjqkUofNzwdUQDE5scbPB67WGscH5r5U?=
 =?us-ascii?Q?AfpyHApla7OebqnkXPabTu8DgMnY1Tm2Jg93t6PfIsRPXLoGcndCLVQF0SRk?=
 =?us-ascii?Q?t49bg7hmxacN2FF4Qemzb+hV/O0RP9buLScysN/4eeMZhUhqbxq/BysmZ17B?=
 =?us-ascii?Q?F9rRE0H96SSuX/ywPg9waMzanmVQi7k8QT8CD0F6/yoC6UV11hNNcLf7ZiBZ?=
 =?us-ascii?Q?b3iicNoIMdZf/x9yNMuuaH/hEu8Upz3SkROFB/N8HDYrnVqWogqFzCdL57st?=
 =?us-ascii?Q?RsLUNY/8/HPFUG4krx64oySyBGLlzJyjn69kqss7NejND9H2f4vCkMhiHDc3?=
 =?us-ascii?Q?f2y77gpX4/30nd+mogTEttX731PIzy9z5ee0DW1mdCFBWfZL7ewTgBtF2VlN?=
 =?us-ascii?Q?l1aCkgNqTdaxmjhzY4m3QoyxjsHFmz8SKXELRs+buy60Kjqjxe5UoxJ6nhW+?=
 =?us-ascii?Q?f7488O4UnYhtPY79busWwCO74QWGQTd3rgExs3cGSn8Y6aBSOG6zu1XnW/ah?=
 =?us-ascii?Q?vSR7yRLaV3MBHcYwPGidkCzkX50kgUUYyGoNXNZy/7qRN1/HF+jaKdtkFLMl?=
 =?us-ascii?Q?v6m2Hz+daWvxQ9uxxQhsJTY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfd7f14c-9d0a-4a7a-27c8-08d9af596de4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:08.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PJuDN2P4rmYK35Es0CuWwTSCE9KMRlIvxZ+HW1oIa26quWG/CP0IPx366UfkpjjdekeO/yE0CPwVnZM0jGDukw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158705

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm_build_dist.bbclass | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/classes/npm_build_dist.bbclass

diff --git a/meta/classes/npm_build_dist.bbclass b/meta/classes/npm_build_d=
ist.bbclass
new file mode 100644
index 0000000000..074edb8552
--- /dev/null
+++ b/meta/classes/npm_build_dist.bbclass
@@ -0,0 +1,31 @@
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# A bbclass to build npm package and install its dist folder.
+#
+# Usage:
+#  inherit npm_build_dist
+#
+# Optional variables:
+#  NPM_DIST:
+#       Path of dist source folder
+#
+#  NPM_BUILD_ARCH:
+#       Path of www install folder
+
+inherit allarch npm_build
+
+NPM_RDEPENDS =3D ""
+
+NPM_DIST ?=3D "${NPM_SOURCEPATH}/dist"
+NPM_WWW ?=3D "${servicedir}/www/${BPN}"
+
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}${NPM_WWW}
+    cp -a --no-preserve=3Downership ${NPM_DIST}/* ${D}${NPM_WWW}/
+}
+
+FILES:${PN} =3D "${NPM_WWW}"
+
--=20
2.20.1


