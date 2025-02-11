Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55B8C021BE
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.137])
 by mx.groups.io with SMTP id smtpd.web10.1087.1739286064292317958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=n0iZFYc7;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujSr8w2ZdhMEtsp8BlaVXoneCr3oJRnR9/+1ymzrvFqDh23zAfsLjx1cJSjt32lPxP2bHasVavDBd3SVarAv9O9htIgcanF7Dwrp9s8kGY4ReI/qYA5zvpR7gD4yFyXetkdzOMk7hUc/aIJbnmmncFcSvqJEwEuLMXHq4Z7A4a+FNbFJFfCoLce49Zx3DThxHWWl5hP87C/qj7LHnbDkYl6wHhBG/nn1cO0JqOLwZtBvtCv+6OuCtlOU3s6HYmDh+nElagMVRiJx2iKSHQ4x1AKzGFRu5FuejCLPfKeikJ3GhbZh5cI3RyiRMEjNRlVRqn/aspba8p5rPygLHqcGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsHJ+JR56ZHJfN1HSC7XvhJgKhSunJbNw0bMlELNlDg=;
 b=elKxMcEaVvOQu5Ai3TQwCBehTiN4rFyncpNjPfnHkjnLl9HtQpdt8SDAoA6Wc0m42vQW9TroI990+6sLu0opPjmcj9kWPsHK6j/Idjq9xPx3zHexrzAyMiudba1GPPoNsU0vB5Met4r9ZvPynEsCNlkTDdSAGH/ypFcK88iz/bK4XHuXGCWDMY42WKYbflihPbaJXkiK1c+RKJR8crde5DvDtDW1ul9ciFEgNRzC7PkROPuBY8IEO2IKTzvUPYzh6VXCI/xor//incGb2VcZcS0arpYcs3/5DqycdSIbEwunKvxiFY5/SyTJEgysHng/uBDIbwVCteeorp48a7eqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsHJ+JR56ZHJfN1HSC7XvhJgKhSunJbNw0bMlELNlDg=;
 b=n0iZFYc7SssQyDe35UCVfyVD/qppqC5VBVA5GFWHOXrExOcXCcKOv9Pgv05pfggvmH/GG9XDrU6UbYVUQt2jtgf5vJpqKd+edSfjV3yCdTnBwh5aLZmBimSR6LCLjfJXCUpmRzTEJuX/PWVglFr/01rTtg1hzebZIEhnjTSmsC/+5g6vD0HDIaaSvmFxMeRhUQtjr6lRBcRAZL8DWjKz/6TVZ1UYDHFcDMET8aaCIVgwUW3fql2n1KtteFzBg5J4UdSIht4IA8EoG0GVWWS3qt4zVbEs08mhdQ1gGqJONdt3Q/5U+8FKUm/VCBG1fpTXoIFeUGeiBCnUoA3LiIrO0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Tue, 11 Feb
 2025 15:01:00 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:59 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 16/30] classes: add vendor class
Date: Tue, 11 Feb 2025 16:00:20 +0100
Message-ID: <20250211155958.RFC.16.a23c043b-97fa-49d9-a050-be7ae8efbe51@changeid>
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
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d34f358-7571-4db7-7769-08dd4aace1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V+PqUEZN81G6EGHc/Qfj1+hnup38o6sCcIZw9XJxX0FnYHIUpfXYffwtxrni?=
 =?us-ascii?Q?cy0DC49lEByfqm1zKIXs1xE1WrYX1iwm3TrVIQoIBlZI4Au+SGlBZv0tUsBV?=
 =?us-ascii?Q?LQKCJyENniotEj69he38chuYc1DlMyiUaEZQJo8fdB6jXaoNnBkiyAoK6wkE?=
 =?us-ascii?Q?Rq76mM5ZRrV0oq6yjErkyHLYRBBXrppA7fdZvwHGHsQVlaqLSqh1RKkGX8Ax?=
 =?us-ascii?Q?Jz6F3YKRB/Jl2zsM37Dexqz1kewl5HcSMY3PuU69c3qfQ3RARg2CnJJA0+ry?=
 =?us-ascii?Q?oqdORleMClyN9F50cB8ACjNiXm74GYjo1xHC3PqGz/55kcW4WTHDC5AoaE3R?=
 =?us-ascii?Q?uC829YEFVygS/S0hJsMq121Sfc8c3+ZTjUa2YYPkchT8N71EHYyit0Pdwc8z?=
 =?us-ascii?Q?k8zvw6XPyxJ11cAyfchyKKbujlTCzqukOWJIMjswzD5mUBF0Ou0/39trXwPU?=
 =?us-ascii?Q?F6n0qzdjuJjuowSo3Q74e20PwWuX77W/RduKXqG05lpYMYRp+sa+r1vV+qWM?=
 =?us-ascii?Q?4ixBaXaUiGP+FgT+SKJBLrQp1WNqeBBIkvHKGq0YlwFeU8utwp7DxwXJVB0P?=
 =?us-ascii?Q?u8JyLoaJCNuGnGz+1z1LRelikMe2yuqGl7dFv/PNcqDCmkzOXvXtLTVNn6EY?=
 =?us-ascii?Q?2T8pDVhEXenNzfI37JjBapqQFD7Ghsd/3pLLuzZMViXzmKBPz2TQOxFEuXQW?=
 =?us-ascii?Q?FJfMG609DGQy0M7JXeOY2FrP2JE6ri0SPklrYHsq8Dcp3yLd4PChQHFpjGfi?=
 =?us-ascii?Q?caEts+dG9FTr99U9DqBwp2zweIkuP4xY5IB9lX7xvwY9Aqxxo+D1Nisj2U96?=
 =?us-ascii?Q?NSlScnW1ZDAmyb7UuWd1KL8dYiB3sif9fcddEjoIeRO7192/0RF+YNlZRT1h?=
 =?us-ascii?Q?noQHSaTOQo8CVCoMRxI65HgyKn67h8X0A//4ReS5dH4GcDA194u/05Hewo0p?=
 =?us-ascii?Q?mxmUsLc/IQVKtNEgwxI8Y14x8I1C0i+UeiVR/FbcM0t5U+MBVJEFQZ3ZmQq2?=
 =?us-ascii?Q?MGz99tr7DUHpRJ5lvh9YDJLaP2/3UgzrHP95xaoIjq8xFJgsEs86w3f1k9ar?=
 =?us-ascii?Q?qxHxZs3X0/MFz9Ws8sPZUv251ZZ2Ibe97kf7z2T4tU10nYxfq/JCNOJAU2c3?=
 =?us-ascii?Q?UAg+jiwuPwnem9B3CYC8251emKjCn58CXDEt7WZGAebRZl6WGsppPSpNCEwd?=
 =?us-ascii?Q?SBb+DMjpMAnr/Tdw8eGdP0IRp7qbgYXMtF3LaW5n1/cGZOf+giP1lJd2n+pN?=
 =?us-ascii?Q?W6Uz9vZNZ0r4Ig89gpdD5NkZl94fm8M2KE8+9h/3x84mfzgcTpO9P3k+4oUz?=
 =?us-ascii?Q?iMYmw66h3Ii0wCVnyNKjppK2mixjuePkRfHEna4ndJkAMM9IZZzUPUpQvyhk?=
 =?us-ascii?Q?VzZ2nC6SiLEJyU9IYG2p+R/R0bLhdrqgbfWfuRX16wFbqtlcBzza4l/L/1c0?=
 =?us-ascii?Q?PSLkOeaLdhtd11/9+e9QFnC7NqiDZbRN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ST0JUnJIldLswVxl9t9+1O4HU+803lrQm6y3tqrDz3zM+vF5BaOxiW0rqWkF?=
 =?us-ascii?Q?z8+ArvXxzrJgbCQpt8KyIOCY0r7cDnrmM+Hz6i67sXg1M4m5Q8Q+nbwmEk6T?=
 =?us-ascii?Q?21yk+9aQorSVNWLNz8PQR0NpFX1o5Kb0+4FbtyvMFUVI/KBwGgQPK9rWFiHB?=
 =?us-ascii?Q?MHUB8os8gCAV6TWAFuYg+xTCe1EL8wcnVYJzrAwRlulRegDxls3e3IeJheRb?=
 =?us-ascii?Q?nEq7dbXU3Wrz+L4M15aUejpvVCa1L+apE0U/inVPxzquaq/uzD9qZk8quEcM?=
 =?us-ascii?Q?glsICjvlSCIr2tk9vKCcVOt4m0lMqfE8qrOiDji2zhRvXvKkUQTbCKqzvVUt?=
 =?us-ascii?Q?s2ssY3Im2jWA9yXaKpIxNqJ/b8O3wINcu5q4JoV6aatPk7hD3VPCxBHsngs8?=
 =?us-ascii?Q?EyzxxulUc1+e+w9H5Jun16hNB92pOc/Mur16NuPzMkQR4p2TpzsFWuf5xMLZ?=
 =?us-ascii?Q?xEBHSI0EVxRquMIyqyu/eUCQWclr/zRBsH7qxqyeX4SInGHRwILCiDMFsP1F?=
 =?us-ascii?Q?1g91UNJJ/P1oWEIJZfR0QdetPkgugIT5XBTCJ4t950pPsj2faAI3rygziv5F?=
 =?us-ascii?Q?hbla0UbMjS5KEjSaT4m+aeUITaXvzgJf3SGFmcRBAA2TGbcDLldfPhDMx0SV?=
 =?us-ascii?Q?9q7ZoRreafkGMBCmFOqTVNlR5mUzpC+YkttywtMDs3eA3VisRCAU3hBiXMMc?=
 =?us-ascii?Q?Ehgnfnk3CrkVc1tdFJNd8jrr4Ru7N4+MPOBLAYMywlWrIzbInUpnV4R1b0Wa?=
 =?us-ascii?Q?+q9lPkuj+0DUpsH4oUcBD3haLqI0KtFNn2o1EsJX3vdCoMPY/yV9kE8y1kqJ?=
 =?us-ascii?Q?08+TwAqfup/jGtyUMdxRcIp8pJB9/I1cUB8OmxW5/ySpWLD1QCwD01QikMqI?=
 =?us-ascii?Q?gTsQtVre2IYqPDNb14ARKb4WQoIa+9qsnkbccz8VT1z9NwpH7ZDqLBzMGvZZ?=
 =?us-ascii?Q?SIS1/mhLNcinEEKJcsCp2ja6IH3AKBb151GiHgzJ3cjL/UoRQOjFZlKEmpeB?=
 =?us-ascii?Q?rHDjR6KbZ9TcUH75xugsAnFeSBVMjBC8ow+qgIoF5eog722gb8x0G0x/l1Xm?=
 =?us-ascii?Q?D9KseeZYyamdVKQFVn7G4QfDk5RKZaRcEYFgHGQdv+SSIa1ta5X2uv6IDOCu?=
 =?us-ascii?Q?jpQDBczSzimks9e1si3Uvq9UrvQ0D7i9VxCVWOnYzcC9JmdybPVyLyC3gxFo?=
 =?us-ascii?Q?R+/2ccGAgA/V2+At20swJvTYqH+cHGnxWtYtN6YkupnewjSP9jUT0qOppGsf?=
 =?us-ascii?Q?tCFrPDqWZy/aYhvsvUPpU+jLSlAfblINe14Ydw5cZ8fDymCME/vTcL+rbIeF?=
 =?us-ascii?Q?6z/akD7c7C7Y2iZ8OGVPb0rVk6z/z80f0i7D4me4DFKljJx1zRF3iXa3Ncbu?=
 =?us-ascii?Q?MACJykbog8yrEiw3kGZ2lnbdvsfFi7ApRUtuGQ5w3kBnZ8hBwA8O35UZ60aC?=
 =?us-ascii?Q?bCydEuajDy3mHafhW/GtDLneJJkYqiiDV10G3wnuYRHmNDd//zgP0YBLRLlp?=
 =?us-ascii?Q?QkGDkK6qKomb3qfEPzBDSVRz4FGkBfUUvI598Hvg08bQSmO/YFLP/TDV4ZbK?=
 =?us-ascii?Q?cbDfDhK5hjg/+OQvOYqPx7+OZ4jnlQBkwAlE9qJmvcbDC9uvdf039bzZOfi1?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d34f358-7571-4db7-7769-08dd4aace1a5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:53.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Njvswvx18oYQzAzXAkK/LivaoIP0guPmshsezKg+AmIuqcsUaja+yB9BxQTkLPscyiwFprWpmk33H082RmIgZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211144

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a common vendor class with a prototype for the do_vendor_resolve
task and common dump and load SRC_URI_FILES function.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/vendor.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes-recipe/vendor.bbclass

diff --git a/meta/classes-recipe/vendor.bbclass b/meta/classes-recipe/vendo=
r.bbclass
new file mode 100644
index 0000000000..a99c9a3121
--- /dev/null
+++ b/meta/classes-recipe/vendor.bbclass
@@ -0,0 +1,28 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+VENDOR_DIR =3D "${WORKDIR}/vendor"
+
+inherit early
+
+def vendor_dump_uris(filepath, uris, d):
+    import oe.vendor
+    with open(filepath, "w") as f:
+        oe.vendor.dump(f, uris)
+
+def vendor_load_uris(filepath, d):
+    import oe.vendor
+    with open(filepath, "r") as f:
+        return oe.vendor.load(f)
+
+
+python vendor_do_vendor_resolve() {
+    vendor_dump_uris([], d)
+}
+addtask vendor_resolve after do_patch_early before do_fetch
+do_vendor_resolve[cleandirs] +=3D "${VENDOR_DIR}"
+
+EXPORT_FUNCTIONS do_vendor_resolve
--=20
2.39.5


