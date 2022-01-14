Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10653C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:22:44 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.124])
 by mx.groups.io with SMTP id smtpd.web12.6950.1642166563014343290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=f9TFcReF;
 spf=pass (domain: sancloud.com, ip: 40.107.10.124,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpkRrBfubSWe6uDCif0pkmXG5nIRbWmVv5Dd6gAutOcLqnzGqoveV5q9AJGhVVH6vP8PD/mww0tjBXpRvIZvWbMfdlYZE4E3ZNj3DuetED/T7It6oPllDwsR27DRg6AR3pOUJd+yGG1tLZ6SciKQPzXS1WeQl9v08sYf0ZSo6SqCQET+8MmQnHxDpQavymZL94UnHhMq/tELG0BKGMCw5+oN5BkULUZUPam0gpVahBGAE0Ome6yObD5Hz1MimB6CkxaF4rzV3UszB5V5/5ckWktWtbiUMapWvUabj/dAfUiEGHYJ8ZjWrU+KnhtpjPf3IgZHZdcoVZjuzGVqYPCbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibbc+ebLakB2W/lzNrBLwyI0SbQGfr9IEMrnkCB79Tw=;
 b=h1OvvjNmLRpc10UAit56HhL3JmpJivf0ffvlJ1onPsm8mJ31EdhGW/x3f+GSKj7aOPHftE9T57mnF1NTHV8/HBdeB2xNYQUL/BO1wIBlYQ8XP5X2s0sX/rDDsDpKO7NKGAq62jWPafL5XWy+f2Gqjy3G9MN1qTFMrl8WOQoxNUG8SDjNBVs/DA7dMRgy7LSYSfPzmCxjeJJuun8noUCaJGg95Pn4KzH61tjcEJ213Vtvnnm+zx4yhFEHZ9YJ2tzeMyYYFtanrRutOhM77EoGLec5cR4C/oNZcShEkL80XQtupdDuNKwBJ5mfalkatlAHFlLEynLLtvj8foDUH13hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibbc+ebLakB2W/lzNrBLwyI0SbQGfr9IEMrnkCB79Tw=;
 b=f9TFcReFcs8xsCktLdf1W4km7t0yG6peH+w/oAUB9qkOfYaMZJOcwPi5IleLyjGtijItRwTzTsvX6uayE1r2c+Sp8CQ/lZSUMX9SjfgUf3TN/n2sameREV/Au7YIuiqNqOFE5TN/jhPZoGez8l5jj1Cq7tTuHmyWwr7JUxtDhc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO4P123MB5255.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:20a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 13:22:39 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 13:22:39 +0000
From: Paul Barker <paul.barker@sancloud.com>
To: openembedded-core@lists.openembedded.org,
	Steve Sakoman <steve@sakoman.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Barker <paul.barker@sancloud.com>
Subject: [dunfell PATCH] kernel: introduce python3-dtschema-wrapper
Date: Fri, 14 Jan 2022 13:22:24 +0000
Message-ID: <20220114132224.2679-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0464.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::19) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa75220-7920-44be-233f-08d9d760f036
X-MS-TrafficTypeDiagnostic: LO4P123MB5255:EE_
X-Microsoft-Antispam-PRVS: 
	<LO4P123MB525542F83E4C8E0BB586631293549@LO4P123MB5255.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X2EGbxcqxaoMEj4GVGR6Lv0+77QzrNLycAu42Abru1b3izjqybv37fJgFVCtVL/7mqzzsl4B+rM7Oj4Fcuhz5poxV6Gm+ymkA/q1YEGrPLSrf7MFauFtaRL5IJIGDNuGoNsgdwgjWHBqBaAg9FEoRhcUS5/AN35hkbPm7+XxoGJOPJHiacztFfEXk3cYbgayCfuvXKlwoOq8qKDj8uNZjR+6p/nT8xJxSn/Y4wugGms0f3+9YIYjRFfdhO7ek9+NOJepJv3eIlBXMCCGaMWFrQXXmS/XXtykc8DouViJ0b8DTXtlY9YeoYjCc0dp58AEuqkQz8oD8i+yTTDPKiT+yIQ+mGwskeNFmfICCu9YPm8gMe10A3tnk9jkLPYb6uffelDVg5IVa9D8TDrhWJ+RFojgJyXCtXBnaFZVDKYko+6gZKPPHCzc9x5E1sHBYMHchkYiM+grQZsvvVnaxlUjggeb2+/jisPuskkouI3kaZnFNnbBZ0t0xVZGDanK3e3NtF9U8Yn9xa7xKlcnyWv4kWTFNE7MGrV9ZaXscjGm0XMOgMFTHB033aNKxy49oFB1Cn0gfh2wy3E5ycmZGREFzKrthkQ4lTU8CTll286MrnpmPLhiHmNGOp8n87OheM65Ug/CSBHp8ZUWZrUJdjMBjs6tQujSYAy64bLgkGHootC2SFV/ZYjwrlvnjXiAszmCWeg1FWdBGLu25GCH8PMV+3K6wzLGTY9OJBPvuYZqvetO8WvUkIXNZyEDlIpd4MRMl/FEScJEgsmQnwI0kHdNNsMHSWd82f9nOml/VNYl18Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(346002)(376002)(316002)(1076003)(107886003)(36756003)(83380400001)(8676002)(8936002)(54906003)(2906002)(2616005)(66946007)(66476007)(66556008)(38100700002)(6916009)(38350700002)(6512007)(4326008)(6506007)(186003)(508600001)(44832011)(5660300002)(86362001)(52116002)(26005)(6666004)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WPm/G8nqBVWAtnTuDSCtn0U9KULNwlrO9mpc+K5wMDDHDcxOCRK+ZWEcSqLa?=
 =?us-ascii?Q?7bgf918GCFfgR0TnukHYOI3xDRDQaZwmMENiBmssG+MAZYDIPnCUXkIjf4p3?=
 =?us-ascii?Q?ceBjZd025jnL5FLy2yj9eDy/jVU34teY5NAaYCdaEgnGqSUvG3w2UlLO+cyt?=
 =?us-ascii?Q?VR8DWw9E+ddY9zLu+kEveHUa47rZW2C4O9KYZyz2QYR791IfgXU/5l/yclXP?=
 =?us-ascii?Q?NFCudhNZPP1Vg1stw/FUNlHRdUwnvTYEXr+fGkluZJA6GbJqYSUBaWXNxCor?=
 =?us-ascii?Q?OtzvIVsLn0cj5MjoAn+81FjIxGijEpVs62r2pPi6ZNWROIvHeFGARB3zIbAq?=
 =?us-ascii?Q?3hkXHzTrZlf9Z1NVlhZaxFksw+XiaJACwZqmzsz74P5wwPrU0YIdtcN7gWeh?=
 =?us-ascii?Q?1ZkrF+4dqYd4z0M2tNoBvIydVuTY8WjDO03vRM4AI2vWboLEufTAQJL3V5aq?=
 =?us-ascii?Q?cGEQMkXpgAsrpKfZt1VXGyD2W+u0cJhTuSgvTC0zHGSLsDlnzUvYdC7IbdAg?=
 =?us-ascii?Q?Q6RVuAiBFIbkWy/mXDsPabl9mvNkI1cXCZebK9HIWgpnkhAdLCQzyjv/uGq+?=
 =?us-ascii?Q?Z7V3IFl8PqmfcIppFHX3Y7Gwg0gQFnKfDztXF1/ZXUaKqgHcHILkZX0MVumj?=
 =?us-ascii?Q?Z2NnsVC2h+A5U1FG177jzw2tLlpv6Ir9g2tYyCoSs3bmgRtRn8Z1iotQ3xGz?=
 =?us-ascii?Q?UaMywCi3U3l+D70Yd8niXLTw1hfIEBaqQRXYkAXZlIp6CezLZQen4F5wMqFc?=
 =?us-ascii?Q?l1WSbH9s9l0YCzX8/zKaLIhsGYz7+x1COP0THLbZwGcy62dHcChmLLEkahzc?=
 =?us-ascii?Q?KHUi581yr7/KNH8CT8Vxf+sujGc9HmkKsYEMrB58nBL1ADd7pr8pr+gVHALT?=
 =?us-ascii?Q?vJJt4s3ZKPXLwjrHs0jZvKArsK/YIVxgLQLR+9xWKZbg37pVPHZycoPKFgUw?=
 =?us-ascii?Q?AOBLZeijRfswHvmKnjP/riE7pxfpA/nSsHJWwzTipwb08zTc4lmbLfnmW9M1?=
 =?us-ascii?Q?WAX9h7/Po4uM+4nFA8dtsFgYfcfVkDdFwbCqfTvzVhqYZ4Fu5sKZ3HkT2muW?=
 =?us-ascii?Q?OGjQyNh6mopDuXDfdDSCOfJoC5dSv/etPBNDBYCXiCQ/VSwkUhEOcoxJtCuX?=
 =?us-ascii?Q?piUs4JWnsX+tK/APftIGNyFWRThna/bMymKKKb0iUrM0WE8526gHRAFfMtMM?=
 =?us-ascii?Q?jRn9q6bSkOgXOr1MYtIbk0uBqZaPjH0Rt+56rnEWn+K3ENBK8iM8MH5O3LYd?=
 =?us-ascii?Q?6Pgcdxa1HmnGLGuoGGwaoArVpNprhuEVHvhi6aCuM75HZIsc/sqx0AjZ9T85?=
 =?us-ascii?Q?HFiCOXuxsxxDP06iT/4R/NxY7tcSipToveDwusO8ta8ytNLrX+v3RteWFL5h?=
 =?us-ascii?Q?Afk9pQjiifakzcNEFFss+kbLjWi6XGgdwQad7T394V3xB3JOD0bSUMWX3kzv?=
 =?us-ascii?Q?LfB+hvQvKuy9PQKc0jw6bdB3TmHXqdHhGVCyNVH39P5apgaBRY1EwjO8XH4B?=
 =?us-ascii?Q?sAqtWukkPtjZAzJx3XY1rLYqHZa44G0RJfFiQcXQQ4z/LZ8he0opLb8Z/41W?=
 =?us-ascii?Q?oBWZsyY4FFRM0y41gZCZ5Y21KdGI82X9RBg5P90SCZ6hAdnEI+EQjx8ks9jF?=
 =?us-ascii?Q?o9utivUqlLiC8stiwc2emj8PWxaV0803l4c1NSIkZ9MoGvY+xKqQjOXW+pG6?=
 =?us-ascii?Q?HpWSZg=3D=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fa75220-7920-44be-233f-08d9d760f036
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 13:22:39.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ilYFgQ+oZzq8FuJ5vSnIpXFmWyUhR++A4/oqA0qPhneFNsV1UiL/lWu6qkCMQD3S7B9KnU8SkzMz0kkNog4qzoYk7aaiN1NN0NxHlVxiCB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB5255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 13:22:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160567

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.16 kernel introduced mandatory schema checking on any dtb file
built through the kernel.

That funcionality is provided via python3-dt-schema.

The dependencies to enable that functionality is not small, and may
not always be desired (in particular on architectures that do not
support dtbs, or in development cycles). It may also be useful for
allowing a non-conformant dts to be compiled.

This commit introduces a set of wrapper scripts that when added
as a depenency to the kernel, can pass both the validation testing
and validation steps of a dts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from oe-core commit 2566563ad49d.
Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python3-dtschema-wrapper/dt-doc-validate  | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper/dt-validate  | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper_2021.10.bb   | 17 ++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc=
-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-=
schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-val=
idate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.1=
0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 895cf894872b..1575fce8c715 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -576,6 +576,7 @@ RECIPE_MAINTAINER_pn-python3 =3D "Oleksandr Kravchuk <o=
pen.source@oleksandr-kravch
 RECIPE_MAINTAINER_pn-python3-async =3D "Oleksandr Kravchuk <open.source@ol=
eksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus =3D "Oleksandr Kravchuk <open.source@ole=
ksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils =3D "Oleksandr Kravchuk <open.source=
@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dtschema-wrapper =3D "Bruce Ashfield <bruce.a=
shfield@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodome =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodomex =3D "Joshua Watt <JPEWhacker@gm=
ail.com>"
 RECIPE_MAINTAINER_pn-python3-extras =3D "Oleksandr Kravchuk <open.source@o=
leksandr-kravchuk.com>"
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-valida=
te b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
new file mode 100644
index 000000000000..2aa57851c7e1
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-doc-validate wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-doc-validate.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema =
b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
new file mode 100644
index 000000000000..24b89d861982
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-mk-schema wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-mk-schema.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate b=
/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
new file mode 100644
index 000000000000..8a4710a7eda1
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-validate wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-validate.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/=
meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
new file mode 100644
index 000000000000..c869274d09fa
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "Wrapper for tooling for devicetree validation using YAML =
and jsonschema"
+HOMEPAGE =3D "https://yoctoproject.org"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+SRC_URI =3D "file://dt-doc-validate \
+           file://dt-mk-schema \
+           file://dt-validate"
+
+do_install() {
+    install -d ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-doc-validate ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-mk-schema ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-validate ${D}${bindir}/
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


