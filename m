Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A903DC021B1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=SxRFugI5;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1Sy5V9+LQaNvxEJKQdd3QvfWj5WQoEaxLlW1fm9R5FkBeX9cy9J6iANpgAGf7roMGjeRnwYXHcREuqp/Q6+hCETXG6eLZHWrzWEiRPcobeRsUyTNGPKzMDJI8SzlHWl21VOtcoXbG711u4BPwbrQFZ4eNET+clmv2+uDj8K0TFZmNtWmkbCf65t5pYMjE5fWh9QOQN4Iz2EfDoIKVuLRj8vNYP/Cl+5hPlJOZWWVlMgvq5FNJvc2sbffZhT9SDk8uRjb+9ulcJPbQfAItRMJbjg5X48FUyb1aP5+rqtl/iHMmFNPRJXU+IH8t4I5ye29TrZ1ywetepirSHYXoixug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z95iKDAQSF64aJioA8VFsTXIyYba31mhhzgPxizAe80=;
 b=o2kfOs6vRL9Vmt1xsmp8WokdR6CD8OjbUtG0D4au2cgsdIxo5H5dHgU9FVA082PPuTHI1vIcNopzfsjkkHYs+Q91sucutGPYrD9NoNJdpZR0oKxPWrQxAjBwfdeKgN36s5LhM4Nvk64IYrLOQ+n+LplYrteyunWYYgumYvhAgLdUeU0I5vd24fJXnpp+GQn9uEVY1PH1Oka65Qu7ypeB+zInPfgCB4+yMhERfwYJLLyWp22Edlex6K4gQsH/C2pCqaCDM4QLnOG02SXfC8X69rJeqHYea3mqeClgSl0A+KBuFJMfUK7B8Qf57R+Trn63bhOx2WKeWkQQXPX0z2dYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z95iKDAQSF64aJioA8VFsTXIyYba31mhhzgPxizAe80=;
 b=SxRFugI5SjRPcGFijADjncaEcQU1ZcOnKzGjIyrVZ5spCU5LEtzF5Ei4W6Pt3H8Mt414QLnhq7B9ZwkBAwYkuVYXOuwr4U/FuU7aX6RyhJeabS0QvQV1+kymdwDNWJux+Zcd0iDg/OBsAwk7XC2nLhcwrhR5kkNSMM0nH50vHxOOPoZvyJdeiyCHLATq1TFZw8uYYo4nsTXhoOl7V1sW4+4ELi5RXO8dr/lydM+CBl1ia0xHFSnfp/k9stBTnG+6uXIgCI4apIXj7h6KFK0120BskqPbt+GPh7Q/dEluJzi5FE61g7q0go7HSuttUzsSruBy4M9OV4D84Sa4nbLX0Q==
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
 15:01:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 19/30] classes: add vendor class for npm
Date: Tue, 11 Feb 2025 16:00:23 +0100
Message-ID: <20250211150034.18696-19-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: e1e1bc4f-5bd8-46c6-a572-08dd4aace276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U1XTtaL4nbZ5CMVaXSnlX35AZrqh2d+YHooEHcanUwrTXnQpBRjGlTGL4J56?=
 =?us-ascii?Q?8LUjqYMMV72qrkuH7xUyoMz37ClWrIj5uSDFlKswIY+JvbrflEeGwKu9uJ7m?=
 =?us-ascii?Q?bA3ihPfuzmodBqR+CW/50pVPqhWK5HQUBs8kZyCW4ygLttlgmhxMN0Rc2C3k?=
 =?us-ascii?Q?jNAQU9a5Vq4NSPSjm/TFuMgDRDmTWNSBJ90xEhaQE+gSmQ9YcmCNkFLjOiVt?=
 =?us-ascii?Q?j2gUmz/gTx9t0+UrR05CgGeYDNBa0cRapTN6gqm2H/m0gs0smDrp35G2ER+K?=
 =?us-ascii?Q?wr8SyyCCt2/UnRlidj8Evj7E679/mZnPYA6ALE9gh1se8x2m2OTfeE4SRKoC?=
 =?us-ascii?Q?QS29XQQRy2s5Hl56EQn7BhoTbZOCscGHWOrOKZWpv0RPpdh2+OWWlu+ovXe0?=
 =?us-ascii?Q?D6DLHbJ4p6ht0MZJafOcADEpRA2vTuaCGJmctkVkz9G0H0BmMtfiSwAMReie?=
 =?us-ascii?Q?v5vYtkntQy0Kfdi5vvj9KUP1wgc52e/L/QzhmfactLkCufbnZcDZ65jkR4/L?=
 =?us-ascii?Q?V8QRoAX2qI2mlyEvJ6quQmTFnKuyBlRRHcbz9ia9w2SigwdT6UJe0AphuIvV?=
 =?us-ascii?Q?ANnFeGpX/mbsPHnGi7Pm4ldJpSfWJqNMDUXRjgeFq+DmxKmAn3PpS6mJSnIX?=
 =?us-ascii?Q?BWGAp6pBduh5iKzkyWh+t1s3rqDEplrShvqyVGYGZpSYRlOxtEY60AwbFjJE?=
 =?us-ascii?Q?Q5NVDOVCJkP5ClylGFmpt7d7mrq2ax7oXCLjrj1KyDtUCLD7hnaKyWMPmJb2?=
 =?us-ascii?Q?7KYnKo26GL96aVUOU9sIBEEuKBwMWDrp8n+qM2WKcmyZQvAs0f+tMyMh3xTH?=
 =?us-ascii?Q?wMfuIdIDgTZa9W2yr9pEG0RutdoWSh5Y8dBPQ/XJ+3uwDbO/ZXwIvkBUuUqD?=
 =?us-ascii?Q?/DKnt16qgDTIx6IRGtREXJfEigoAcZyaNb+XxBIS9c9hRpQfTScRoRZfWERx?=
 =?us-ascii?Q?KOwLCGuTCCFtL/3P1AlVFRsyohcO6dDPegpmneKMm8RLirWHknloHYIznRk9?=
 =?us-ascii?Q?Juki03py1JH4ynVQ82OVkMoHfj/CuxBUVPJF+RlO54ygWvyk2Rf0ojKv6RH2?=
 =?us-ascii?Q?atmFV2MTQ3Q5Y9Wv1TMloVD3P9Rn7kw7lHNeAycQrO5jF9fffKQ0tEjy4xG5?=
 =?us-ascii?Q?6NvFz8uNkNv3ZgwbneNl8NbTJVAy2BqjkF2yCLH40uUDdMvHpfTQ0QbjSpyy?=
 =?us-ascii?Q?OW8q4JoBFnABY4opxjoQY2HHYrm7E+4bx4yv6pyuawpQHObUtD4DbzMAuLZ6?=
 =?us-ascii?Q?GedGUo2rEP3zAGeufKLAl9GejwW84ebQkhixtetmegKu5Xtv73dIo0dWpUvf?=
 =?us-ascii?Q?yGTYXxTapWQxcw+yLzHmIAza6+RFLVf/wMc27zzMbcqboQLr5+4QGa7JxXlB?=
 =?us-ascii?Q?3vdu8pB/m2MR5eCwDW+IuCFPVZ5H?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JKnO2eP8/VvZHLhwAukTFL3HFc9wxo79WR41A7/6jWPDrKmNjWoTFoi8n0zk?=
 =?us-ascii?Q?yg8PE6uJQswYV7G5ILLXLgVhB8s148DRgVBiNgeQKK2Gr6lD/9GDdb7+vL5L?=
 =?us-ascii?Q?SBE85hoXYsVygLH3NdEmwKrPjpoZIg5KoQkQkNJRLfVvNBK1GXPyTkJ5YqML?=
 =?us-ascii?Q?9Kg65d4B8v35aDtB3yf4zfzOc/p1cowJZdDsU35lYcV+jeCV8lo3QxrVGDY4?=
 =?us-ascii?Q?w9RAMbvZQxrnmTeK+eF4BZ4DFav5rhrmqLr1gtIPjnveIxAHon1O7SY+h0tG?=
 =?us-ascii?Q?zJP2nVKVxogmg83qRfw6VSZewoWfXKJKEwpqeZdHoi/enO2NRIB1uPtPNnh9?=
 =?us-ascii?Q?fEs9i5Dfnf5wPrnN2LvttsDhRYke6tXK/YeatTmnigE8HgUX4OHyUrst329C?=
 =?us-ascii?Q?NgmBYckG19P1tWWlNTihnfdHEGLQomYlOI01YAwpPz6wZ7D+hWgsnXFeQR25?=
 =?us-ascii?Q?LioZmE8HpP17OGe5dwwu/Mi4dvtLNRwqYXbf6eQ+nlDTzHKzEJC2P/Pl7en+?=
 =?us-ascii?Q?dGRshZFJsnNdj3dglCfvixrfj2gkK56XicpuSk1/sdTvGzy4lZB768onXr7B?=
 =?us-ascii?Q?5h0VBlD0oVHDUjYY6NzOV3AgNN4OuImKj9rDZaUkaifGpdGdHJeHYw66AzYk?=
 =?us-ascii?Q?+jhRq68pnSxaFcX1oMtD8vd+102MnmVtHT4wojA2QQRgRJ8NSxYkUWxpVQAu?=
 =?us-ascii?Q?fy3ttO1ygC/+IcjtQMl02m0McrOUHItAg4AbmRabdnS38jfeifq0kY46iwcp?=
 =?us-ascii?Q?sqNN1LDil/jlLA02HT2pv28cz2Vy2c8Grbq7xVyu/McZ/XYo9e9Alve+exDA?=
 =?us-ascii?Q?rhzQP9Iyuu6zWbDQJrsowBSr8mnaVQ7NY5srN3JH4fhpjg0pbkyUIt1bmLgE?=
 =?us-ascii?Q?tvqk9e3jrSd0H/XvHnSZYJm/+vBFQEf6KQgPGuJACfzyfQGYu5XSRws1Tfxy?=
 =?us-ascii?Q?Q/57epQPc3puoQueha7P/xst/08AVd72Grk+rFTymcdcSrhW6JgXaDndiswh?=
 =?us-ascii?Q?mNZE+jIAGOv1tIh13f4Gx6Frqtk8T1FKd4TNKhH3wnXhu4e3ZO/kyQGgg6Nh?=
 =?us-ascii?Q?dbqu/V+Fg8RQUZVadM51txHuNFdXl1BB+/tgBosyz93PBPrjngYr5ETY01y1?=
 =?us-ascii?Q?S8DSxavXrP7eH45zo/cd/XRUNgvSRhWc5sEKF01ZwqikrQsHvYriOk+Q/jIT?=
 =?us-ascii?Q?eI0aYoVHuYYZWbKJ0CgNHqwqh0MRJ2IpyawwGubWZZnM5hcu+mle+XJhd/GC?=
 =?us-ascii?Q?Lo7AbOh2aiKKbmEh9aUrJfFUAJV7JQT/ASrSSsugvhXWnIr37qUnUbKl2MDi?=
 =?us-ascii?Q?DlpuOgoWw0UQk0H5Zyo8egRzZ3lfRiHks89bSkGkBlTLq+EshBFtVGip1V9R?=
 =?us-ascii?Q?RHIaGYTBCw0eMQR5A7drYbML265fr729F6YCz1XHC6ysG1M8Xh2IJ8j/T1aF?=
 =?us-ascii?Q?RQcXgiCX1NM3DCoORQaQzZ8DOxgHT2HQEjs2VRjbAa47AbaMTlVGXhh8C+LN?=
 =?us-ascii?Q?6k2xGZvGpIP4O3qdBqjpPRnOLwfmwU37Ao5INiXZajwXUCIQ8BBUS3eN4kez?=
 =?us-ascii?Q?+sO7Sk2I4F0EJ4r8ITmD3pKlTN7MoxFKRHZp445zjJWi+SV3y0OdwogPJBfU?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1bc4f-5bd8-46c6-a572-08dd4aace276
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:55.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3bV5vZ8TnDIZ4IJ4xICi0cR5O6qpt1xp+UySA6QE8nRs+0A0qM3Us/KyMU27je38L9nOAb95b88XI+4kFnLcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211142

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor class for npm to resolve the dependency SRC_URIs from a
package-lock.json file and populate the npm node_modules folder. The
class replaces the normal npm class and provide a simplified compile and
install task.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/vendor_npm.bbclass | 115 +++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 meta/classes-recipe/vendor_npm.bbclass

diff --git a/meta/classes-recipe/vendor_npm.bbclass b/meta/classes-recipe/v=
endor_npm.bbclass
new file mode 100644
index 0000000000..c8bb2b6403
--- /dev/null
+++ b/meta/classes-recipe/vendor_npm.bbclass
@@ -0,0 +1,115 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The directory of the package.json file relative to the root directory, p=
er
+# default assume there's a file directly in the root directory
+NPM_SRC_DIR ?=3D ""
+
+# The path to the package.json file
+NPM_MANIFEST_FILE ?=3D "${NPM_SRC_PATH}/package.json"
+
+# The path to package-lock.json file
+NPM_LOCK_FILE ?=3D "${@os.path.join(os.path.dirname(d.getVar('NPM_MANIFEST=
_FILE')), 'package-lock.json')}"
+
+# The URL of the npm registry
+NPM_REGISTRY ?=3D "https://registry.npmjs.org"
+
+# The option to npm install development dependencies
+NPM_INSTALL_DEV ?=3D "0"
+
+# The option to npm prune development dependencies after install
+NPM_PRUNE_DEV ?=3D "${@['0', '1'][oe.types.boolean(d.getVar('NPM_INSTALL_D=
EV'))]}"
+
+# The nodejs architecture of the target
+NPM_ARCH ?=3D "${@map_nodejs_arch(d.getVar("TARGET_ARCH"), d)}"
+
+inherit nodejs-arch python3native vendor
+
+DEPENDS:append =3D "nodejs-native"
+RDEPENDS:${PN}:append:class-target =3D "${@['', ' nodejs'][bb.data.inherit=
s_class('allarch', d)]}"
+
+NPM_SRC_PATH =3D "${S}/${NPM_SRC_DIR}"
+NPM_SRC_SUBDIR =3D "${@os.path.relpath(d.getVar('NPM_SRC_PATH'), d.getVar(=
'WORKDIR'))}"
+NPM_SRC_URI_FILE =3D "${VENDOR_DIR}/npm-source-uris.txt"
+SRC_URI_FILES:append =3D " ${NPM_SRC_URI_FILE}"
+
+NPM =3D "npm"
+NPM_CACHE =3D "${WORKDIR}/cache/npm"
+NPM_COMMON_FLAGS =3D "\
+    --offline \
+    --fund=3Dfalse \
+    --audit=3Dfalse \
+    --cache=3D${NPM_CACHE} \
+    --loglevel=3Dsilly \
+    --foreground-scripts \
+    --release \
+    --nodedir=3D'${RECIPE_SYSROOT_NATIVE}${prefix_native}' \
+    --python=3D${PYTHON} \
+    --build-from-source \
+"
+NPM_BUILD_FLAGS =3D "\
+    ${NPM_COMMON_FLAGS} \
+    --arch=3D${NPM_TARGET_ARCH} \
+    --target_arch=3D${NPM_TARGET_ARCH} \
+"
+
+export NPM_CONFIG_USERCONFIG =3D "/dev/null"
+export NPM_CONFIG_GLOBALCONFIG =3D "null"
+
+def npm_src_uri(d, name=3DNone, version=3DNone, registry=3DNone, subdir=3D=
None):
+    import oe.vendor.npm
+    if not name:
+        name =3D d.getVar("PN")
+    if not version:
+        version =3D d.getVar("PV")
+    if not registry:
+        registry =3D d.getVar("NPM_REGISTRY")
+    if not subdir:
+        subdir =3D os.path.basename(d.getVar("S"))
+    return oe.vendor.npm.determine_src_uri(registry, name, version, subdir=
)
+
+python vendor_npm_do_vendor_resolve() {
+    import oe.vendor
+    import oe.vendor.npm
+
+    lock_file_dir =3D d.getVar("NPM_LOCK_FILE")
+    lock_file_dir =3D get_early_source_dir(d, lock_file_dir)
+    registry =3D d.getVar("NPM_REGISTRY")
+    src_subdir =3D d.getVar("NPM_SRC_SUBDIR")
+    dev =3D oe.types.boolean(d.getVar("NPM_INSTALL_DEV"))
+    src_uris =3D oe.vendor.npm.resolve_src_uris(lock_file_dir, registry,
+                                              src_subdir, dev)
+    with open(d.getVar("NPM_SRC_URI_FILE"), "w") as f:
+        oe.vendor.dump(f, src_uris)
+}
+
+oe_run_npm() {
+    bbnote ${NPM} "$@"
+    ${NPM} "$@"
+}
+
+vendor_npm_do_compile() {
+    oe_run_npm rebuild ${NPM_BUILD_FLAGS}
+}
+do_compile[cleandirs] +=3D "${NPM_CACHE}"
+
+vendor_npm_do_install() {
+    oe_run_npm install --global --prefix=3D${D}${exec_prefix}
+    rm ${D}${exec_prefix}/lib/node_modules/${BPN}
+    install -d ${D}${exec_prefix}/lib/node_modules/${BPN}
+    tar -C . -cf - --exclude-vcs . | \
+        tar -C ${D}${exec_prefix}/lib/node_modules/${BPN} --no-same-owner =
-xf -
+    rm -rf ${D}${exec_prefix}/lib/node_modules/${BPN}/node_modules/.bin
+    if "${@['false', 'true'][oe.types.boolean(d.getVar('NPM_PRUNE_DEV'))]}=
"; then
+        (cd ${D}${exec_prefix}/lib/node_modules; oe_run_npm prune --omit=
=3Ddev)
+    fi
+}
+
+FILES:${PN} +=3D " \
+    ${nonarch_libdir}/node_modules/${BPN} \
+"
+
+EXPORT_FUNCTIONS do_vendor_resolve do_compile do_install
--=20
2.39.5


